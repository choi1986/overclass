package kr.co.overclass;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import kr.co.overclass.domain.MsgwsVO;
import kr.co.overclass.dto.MsgDTO;
import kr.co.overclass.service.MsgService;

public class EchoHandler extends TextWebSocketHandler {
	private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	// 서버에 연결한 사용자들을 저장하는 리스트
	private List<WebSocketSession> connectedUsers;
	Map<String, WebSocketSession> users;	// 유저아이디와 웹소켓객체
	Map<WebSocketSession,String> userssession;
	//Vector<RoomVO> roomV;	// 채팅을 하는 유저들끼리의 세션을 저장할 백터
	@Inject
	private MsgService service;
	
	// 생성자
	public EchoHandler() {
		connectedUsers = new ArrayList<WebSocketSession>();
		users = new HashMap<>();
		userssession = new HashMap<>();
		
		//roomV = new Vector<>();
	}

	
	// 클라이언트 연결 이후에 실행되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// logger.info("session ID : "+session.getId() + " 접속");
		logger.info("연결IP : " + session.getRemoteAddress().getHostName());
		
		// 접속해있는 유저들
		connectedUsers.add(session);
	}
	
	// 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행되는 메소드
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		String payloadMessage = (String) message.getPayload();
		
		/* 받은 메시지 분석해서 귓속말 상대특정짓고, 메시지보내고 해야됨. JSON 사용
		 ****************** 프로토콜 정의 **********************
		
		**클라이언트 전송프로토콜
		100 : 서버접속
		110 : 유저대화리스트 요청
		140 : 대화목록 읽음처리
		200 : 메시지 전송
		
		*서버 전송프로토콜
		120 : 유저대화리스트 전송
		130 : 최신메시지 목록 전송
		210 : 친구메시지 전송
		300 : 유저접속. 아이디 전송!
		310 : 친구 로그아웃 알림
		*/
		
		Gson fromgson = new Gson();
		MsgwsVO frommsg = fromgson.fromJson(payloadMessage, MsgwsVO.class);
		logger.info(session.getId()+"("+frommsg.getSender()+")" +" : "+ payloadMessage);
		
		Gson togson = new Gson();
		// 프로토콜번호에 따른 행동
		switch(frommsg.getProtocol()){
			case 100:{	// 접속했다는 프로토콜이 오면
					// 같이온 sender와 Websession을 저장해서 해당 세션id가 누구인지를 이어줌
					users.put(frommsg.getSender(), session);
					userssession.put(session, frommsg.getSender());
					logger.info("********** 유저ID : "+frommsg.getSender()+" 접속!! ************");
					
					// 메시지목록 전송
					List<MsgDTO> list = service.sitebarDisplay(frommsg.getSender());
					int count = service.count(frommsg.getSender());
					
					Map<String,Object> map = new HashMap<>();
					map.put("protocol", 130);
					map.put("list", list);
					map.put("count", count);
					session.sendMessage(new TextMessage(togson.toJson(map)));
				} break;
			case 110:{	// 클라이언트가 대화상대를 선택하면
					Map<String, String> choosemap = new HashMap<>();
					choosemap.put("sender", frommsg.getSender().trim());
					choosemap.put("receiver", frommsg.getReceiver().trim());
					// receiver = 선택한 대화상대
					
					List<MsgDTO> chatlist = service.chatList(choosemap);
					
					Map<String, Object> sendData = new HashMap<>();
					sendData.put("protocol", 120);
					sendData.put("chatlist", chatlist);
					// 가져온 대화목록을 클라이언트에게 전송
					session.sendMessage(new TextMessage(togson.toJson(sendData)));
					
					// 상대방이 보낸 메시지들 읽음표시
					Map<String, String> map = new HashMap<>();
					map.put("sender", frommsg.getReceiver());
					map.put("receiver", frommsg.getSender());
					service.changeRead(map);
				}break;
			case 140:{
					// 대화를 하던 상대방이 보낸 메시지들 읽음표시
					Map<String, String> map = new HashMap<>();
					map.put("sender", frommsg.getSender());
					map.put("receiver", frommsg.getReceiver());
					service.changeRead(map);
				}break;
			case 200:{	// 전달메시지가 오면
					MsgwsVO tomsg = new MsgwsVO();
					tomsg.setSender(frommsg.getSender());
					tomsg.setReceiver(frommsg.getReceiver());
					tomsg.setProtocol(210);
					tomsg.setContent(frommsg.getContent());
					tomsg.setUser_image(service.getImage(frommsg.getSender()));
					
					/* 
					  	주의!!!!!!!!!! 
					  	map 안에 해당유저의 키값이 없으면 웹소켓이 그냥 뻗어버림.
					  	그리고 익플은 웹소켓 세션이 금방뻗음.
					 */
					if(users.get(frommsg.getReceiver()) != null) { 
						// 보내야될 세션값을 가져와서
						// WebSocketSession receiveUser = users.get(frommsg.getReceiver());
						
						// DB기록
						service.writeNR(tomsg);
						users.get(frommsg.getReceiver()).sendMessage(new TextMessage(togson.toJson(tomsg)));
						
						
						// 메시지목록 전송
						List<MsgDTO> list = service.sitebarDisplay(frommsg.getReceiver());
						int count = service.count(frommsg.getReceiver());
						
						Map<String,Object> map = new HashMap<>();
						map.put("protocol", 130);
						map.put("list", list);
						map.put("count", count);
						users.get(frommsg.getReceiver()).sendMessage(new TextMessage(togson.toJson(map)));
						
						// 다시 포장해서 JSON 객체로 만들고 전송
						//receiveUser.sendMessage(new TextMessage(togson.toJson(tomsg)));
					}else{
						// 접속 안해있으면 DB에만 기록
						service.writeNR(tomsg);
					}
				} break;
		} // switch
		
	}
	
	// 클라이언트가 연결을 끊었을 때 실행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 연결해제
		logger.info(session.getId() + " 퇴장");
		users.remove(userssession.get(session));
		userssession.remove(session);
		connectedUsers.remove(session);
	}
}
