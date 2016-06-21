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
	
	// ������ ������ ����ڵ��� �����ϴ� ����Ʈ
	private List<WebSocketSession> connectedUsers;
	Map<String, Object> users;
	Vector<RoomVO> roomV;	// ä���� �ϴ� �����鳢���� ������ ������ ����
	
	// ������
	public EchoHandler() {
		connectedUsers = new ArrayList<WebSocketSession>();
		users = new HashMap<>();
		roomV = new Vector<>();
	}

	
	// Ŭ���̾�Ʈ ���� ���Ŀ� ����Ǵ� �޼ҵ�
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("session ID : "+session.getId() + " ����");
		logger.info("����IP : " + session.getRemoteAddress().getHostName());
		
		// �������ִ� ������
		connectedUsers.add(session);
	}
	
	// Ŭ���̾�Ʈ�� ������ ������ �޽����� �������� �� ����Ǵ� �޼ҵ�
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		String payloadMessage = (String) message.getPayload();
		logger.info(session.getId() +" : "+ payloadMessage);
		
		/* ���� �޽��� �м��ؼ� �ӼӸ� ���Ư������, �޽��������� �ؾߵ�. JSON ���
		 ****************** �������� ���� **********************
		
		**Ŭ���̾�Ʈ ������������
		100 : ��������
		200 : �޽��� ����
		300 : �α׾ƿ� (����)
		
		*���� ������������
		110 : �������ӿϷ�
		210 : ģ���޽��� ����
		310 : ģ�� �α׾ƿ�
		*/
		
		Gson fromgson = new Gson();
		MsgwsVO frommsg = fromgson.fromJson(payloadMessage, MsgwsVO.class);
		
		Gson togson = new Gson();
		
		// �������ݹ�ȣ�� ���� �ൿ
		switch(frommsg.getProtocol()){
		case 100:{	// �����ߴٴ� ���������� ����
					// ���̿� sender�� Websession�� �����ؼ� �ش� ����id�� ���������� �̾���
					users.put(frommsg.getSender(), session);
					logger.info("welcome "+frommsg.getSender());
					
					MsgwsVO tomsg = new MsgwsVO();
					tomsg.setProtocol(110);
					tomsg.setMsg("welcome");
					// 110 �������ݰ� �޽����� welcome�� ����.
					session.sendMessage(new TextMessage(togson.toJson(tomsg)));
				} break;
		case 101:{
					
				} break;
				
		}
		List<WebSocketSession> chatroom = new ArrayList<>();
		
		
		
		session.sendMessage(new TextMessage("ECHO : "+payloadMessage));
	}
	
	// Ŭ���̾�Ʈ�� ������ ������ �� ����Ǵ� �޼ҵ�
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// ��������
		logger.info(session.getId() + "����");
		connectedUsers.remove(session);
	}
}
