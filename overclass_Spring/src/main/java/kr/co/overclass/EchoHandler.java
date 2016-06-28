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
	
	// ������ ������ ����ڵ��� �����ϴ� ����Ʈ
	private List<WebSocketSession> connectedUsers;
	Map<String, WebSocketSession> users;	// �������̵�� �����ϰ�ü
	Map<WebSocketSession,String> userssession;
	//Vector<RoomVO> roomV;	// ä���� �ϴ� �����鳢���� ������ ������ ����
	@Inject
	private MsgService service;
	
	// ������
	public EchoHandler() {
		connectedUsers = new ArrayList<WebSocketSession>();
		users = new HashMap<>();
		userssession = new HashMap<>();
		
		//roomV = new Vector<>();
	}

	
	// Ŭ���̾�Ʈ ���� ���Ŀ� ����Ǵ� �޼ҵ�
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// logger.info("session ID : "+session.getId() + " ����");
		logger.info("����IP : " + session.getRemoteAddress().getHostName());
		
		// �������ִ� ������
		connectedUsers.add(session);
	}
	
	// Ŭ���̾�Ʈ�� ������ ������ �޽����� �������� �� ����Ǵ� �޼ҵ�
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		String payloadMessage = (String) message.getPayload();
		
		/* ���� �޽��� �м��ؼ� �ӼӸ� ���Ư������, �޽��������� �ؾߵ�. JSON ���
		 ****************** �������� ���� **********************
		
		**Ŭ���̾�Ʈ ������������
		100 : ��������
		110 : ������ȭ����Ʈ ��û
		140 : ��ȭ��� ����ó��
		200 : �޽��� ����
		
		*���� ������������
		120 : ������ȭ����Ʈ ����
		130 : �ֽŸ޽��� ��� ����
		210 : ģ���޽��� ����
		300 : ��������. ���̵� ����!
		310 : ģ�� �α׾ƿ� �˸�
		*/
		
		Gson fromgson = new Gson();
		MsgwsVO frommsg = fromgson.fromJson(payloadMessage, MsgwsVO.class);
		logger.info(session.getId()+"("+frommsg.getSender()+")" +" : "+ payloadMessage);
		
		Gson togson = new Gson();
		// �������ݹ�ȣ�� ���� �ൿ
		switch(frommsg.getProtocol()){
			case 100:{	// �����ߴٴ� ���������� ����
					// ���̿� sender�� Websession�� �����ؼ� �ش� ����id�� ���������� �̾���
					users.put(frommsg.getSender(), session);
					userssession.put(session, frommsg.getSender());
					logger.info("********** ����ID : "+frommsg.getSender()+" ����!! ************");
					
					// �޽������ ����
					List<MsgDTO> list = service.sitebarDisplay(frommsg.getSender());
					int count = service.count(frommsg.getSender());
					
					Map<String,Object> map = new HashMap<>();
					map.put("protocol", 130);
					map.put("list", list);
					map.put("count", count);
					session.sendMessage(new TextMessage(togson.toJson(map)));
				} break;
			case 110:{	// Ŭ���̾�Ʈ�� ��ȭ��븦 �����ϸ�
					Map<String, String> choosemap = new HashMap<>();
					choosemap.put("sender", frommsg.getSender().trim());
					choosemap.put("receiver", frommsg.getReceiver().trim());
					// receiver = ������ ��ȭ���
					
					List<MsgDTO> chatlist = service.chatList(choosemap);
					
					Map<String, Object> sendData = new HashMap<>();
					sendData.put("protocol", 120);
					sendData.put("chatlist", chatlist);
					// ������ ��ȭ����� Ŭ���̾�Ʈ���� ����
					session.sendMessage(new TextMessage(togson.toJson(sendData)));
					
					// ������ ���� �޽����� ����ǥ��
					Map<String, String> map = new HashMap<>();
					map.put("sender", frommsg.getReceiver());
					map.put("receiver", frommsg.getSender());
					service.changeRead(map);
				}break;
			case 140:{
					// ��ȭ�� �ϴ� ������ ���� �޽����� ����ǥ��
					Map<String, String> map = new HashMap<>();
					map.put("sender", frommsg.getSender());
					map.put("receiver", frommsg.getReceiver());
					service.changeRead(map);
				}break;
			case 200:{	// ���޸޽����� ����
					MsgwsVO tomsg = new MsgwsVO();
					tomsg.setSender(frommsg.getSender());
					tomsg.setReceiver(frommsg.getReceiver());
					tomsg.setProtocol(210);
					tomsg.setContent(frommsg.getContent());
					tomsg.setUser_image(service.getImage(frommsg.getSender()));
					
					/* 
					  	����!!!!!!!!!! 
					  	map �ȿ� �ش������� Ű���� ������ �������� �׳� �������.
					  	�׸��� ������ ������ ������ �ݹ滸��.
					 */
					if(users.get(frommsg.getReceiver()) != null) { 
						// �����ߵ� ���ǰ��� �����ͼ�
						// WebSocketSession receiveUser = users.get(frommsg.getReceiver());
						
						// DB���
						service.writeNR(tomsg);
						users.get(frommsg.getReceiver()).sendMessage(new TextMessage(togson.toJson(tomsg)));
						
						
						// �޽������ ����
						List<MsgDTO> list = service.sitebarDisplay(frommsg.getReceiver());
						int count = service.count(frommsg.getReceiver());
						
						Map<String,Object> map = new HashMap<>();
						map.put("protocol", 130);
						map.put("list", list);
						map.put("count", count);
						users.get(frommsg.getReceiver()).sendMessage(new TextMessage(togson.toJson(map)));
						
						// �ٽ� �����ؼ� JSON ��ü�� ����� ����
						//receiveUser.sendMessage(new TextMessage(togson.toJson(tomsg)));
					}else{
						// ���� ���������� DB���� ���
						service.writeNR(tomsg);
					}
				} break;
		} // switch
		
	}
	
	// Ŭ���̾�Ʈ�� ������ ������ �� ����Ǵ� �޼ҵ�
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// ��������
		logger.info(session.getId() + " ����");
		users.remove(userssession.get(session));
		userssession.remove(session);
		connectedUsers.remove(session);
	}
}
