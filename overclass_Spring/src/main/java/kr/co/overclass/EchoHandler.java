package kr.co.overclass;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import kr.co.overclass.domain.MsgVO;
import kr.co.overclass.domain.MsgwsVO;
import kr.co.overclass.domain.RoomVO;
import kr.co.overclass.service.MsgService;

public class EchoHandler extends TextWebSocketHandler {
	private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	// ������ ������ ����ڵ��� �����ϴ� ����Ʈ
	private List<WebSocketSession> connectedUsers;
	Map<String, WebSocketSession> users;	// �������̵�� �����ϰ�ü
	//Vector<RoomVO> roomV;	// ä���� �ϴ� �����鳢���� ������ ������ ����
	@Inject
	private MsgService service;
	
	// ������
	public EchoHandler() {
		connectedUsers = new ArrayList<WebSocketSession>();
		users = new HashMap<>();
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
		logger.info(session.getId() +" : "+ payloadMessage);
		
		/* ���� �޽��� �м��ؼ� �ӼӸ� ���Ư������, �޽��������� �ؾߵ�. JSON ���
		 ****************** �������� ���� **********************
		
		**Ŭ���̾�Ʈ ������������
		100 : ��������
		110 : ������ȭ����Ʈ ��û
		200 : �޽��� ����
		
		
		*���� ������������
		120 : ������ȭ����Ʈ ����
		210 : ģ���޽��� ����
		300 : ��������. ���̵� ����!
		310 : ģ�� �α׾ƿ� �˸�
		*/
		
		Gson fromgson = new Gson();
		MsgwsVO frommsg = fromgson.fromJson(payloadMessage, MsgwsVO.class);
		
		Gson togson = new Gson();
		// �������ݹ�ȣ�� ���� �ൿ
		switch(frommsg.getProtocol()){
			case 100:{	// �����ߴٴ� ���������� ����
					// ���̿� sender�� Websession�� �����ؼ� �ش� ����id�� ���������� �̾���
					users.put(frommsg.getSender(), session);
					logger.info("********** ����ID : "+frommsg.getSender()+" ����!! ************");
				} break;
			case 110:{	// Ŭ���̾�Ʈ�� ��ȭ��븦 �����ϸ�
					Map<String, String> map = new HashMap<>();
					map.put("sender", frommsg.getSender());
					map.put("receiver", frommsg.getReceiver());
					// receiver = ������ ��ȭ���
					
					List<MsgVO> chatlist = service.chatList(map);
					
					logger.info("�׽�Ʈ�ΰ�");
					//logger.info(chatlist.get(0).getReceiver());
					logger.info("�׽�Ʈ�ΰ�2");
					
					
					Map<String, Object> sendData = new HashMap<>();
					sendData.put("protocol", 120);
					sendData.put("chatlist", chatlist);
					// ������ ��ȭ����� Ŭ���̾�Ʈ���� ����
					session.sendMessage(new TextMessage(togson.toJson(sendData)));
				}break;
			case 200:{	// ���޸޽����� ����
					MsgwsVO tomsg = new MsgwsVO();
					tomsg.setSender(frommsg.getSender());
					tomsg.setReceiver(frommsg.getReceiver());
					tomsg.setProtocol(210);
					tomsg.setContent(frommsg.getContent());
					
					// DB���
					service.write(tomsg);
					/* 
					  	����!!!!!!!!!! 
					  	map �ȿ� �ش������� Ű���� ������ �������� �׳� �������.
					  	�׸��� ������ ������ ������ �ݹ滸��.
					 */
					logger.info("�޴��� : "+users.get(frommsg.getReceiver()));
					if(users.get(frommsg.getReceiver()) != null) { 
						// �����ߵ� ���ǰ��� �����ͼ�
						// WebSocketSession receiveUser = users.get(frommsg.getReceiver());
						users.get(frommsg.getReceiver()).sendMessage(new TextMessage(togson.toJson(tomsg)));
						// �ٽ� �����ؼ� JSON ��ü�� ����� ����
						//receiveUser.sendMessage(new TextMessage(togson.toJson(tomsg)));
					}else{
						
					}
				} break;
		} // switch
		
	}
	
	// Ŭ���̾�Ʈ�� ������ ������ �� ����Ǵ� �޼ҵ�
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// ��������
		logger.info(session.getId() + "����");
		connectedUsers.remove(session);
	}
}
