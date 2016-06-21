package kr.co.overclass;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import kr.co.overclass.domain.MsgwsVO;
import kr.co.overclass.domain.RoomVO;

public class EchoHandler extends TextWebSocketHandler {
	private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	// 서버에 연결한 사용자들을 저장하는 리스트
	private List<WebSocketSession> connectedUsers;
	Map<String, Object> users;
	Vector<RoomVO> roomV;	// 채팅을 하는 유저들끼리의 세션을 저장할 백터
	
	// 생성자
	public EchoHandler() {
		connectedUsers = new ArrayList<WebSocketSession>();
		users = new HashMap<>();
		roomV = new Vector<>();
	}

	
	// 클라이언트 연결 이후에 실행되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("session ID : "+session.getId() + " 접속");
		logger.info("연결IP : " + session.getRemoteAddress().getHostName());
		
		// 접속해있는 유저들
		connectedUsers.add(session);
	}
	
	// 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행되는 메소드
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		String payloadMessage = (String) message.getPayload();
		logger.info(session.getId() +" : "+ payloadMessage);
		
		/* 받은 메시지 분석해서 귓속말 상대특정짓고, 메시지보내고 해야됨. JSON 사용
		 ****************** 프로토콜 정의 **********************
		
		**클라이언트 전송프로토콜
		100 : 서버접속
		200 : 메시지 전송
		300 : 로그아웃 (종료)
		
		*서버 전송프로토콜
		110 : 서버접속완료
		210 : 친구메시지 전송
		310 : 친구 로그아웃
		*/
		
		Gson fromgson = new Gson();
		MsgwsVO frommsg = fromgson.fromJson(payloadMessage, MsgwsVO.class);
		
		Gson togson = new Gson();
		
		// 프로토콜번호에 따른 행동
		switch(frommsg.getProtocol()){
		case 100:{	// 접속했다는 프로토콜이 오면
					// 같이온 sender와 Websession을 저장해서 해당 세션id가 누구인지를 이어줌
					users.put(frommsg.getSender(), session);
					logger.info("welcome "+frommsg.getSender());
					
					MsgwsVO tomsg = new MsgwsVO();
					tomsg.setProtocol(110);
					tomsg.setMsg("welcome");
					// 110 프로토콜과 메시지로 welcome을 보냄.
					session.sendMessage(new TextMessage(togson.toJson(tomsg)));
				} break;
		case 101:{
					
				} break;
				
		}
		List<WebSocketSession> chatroom = new ArrayList<>();
		
		
		
		session.sendMessage(new TextMessage("ECHO : "+payloadMessage));
	}
	
	// 클라이언트가 연결을 끊었을 때 실행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 연결해제
		logger.info(session.getId() + "퇴장");
		connectedUsers.remove(session);
	}
}
