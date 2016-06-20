package kr.co.overclass.domain;

import org.springframework.web.socket.WebSocketSession;

public class RoomVO {
	private WebSocketSession sender;
	private WebSocketSession receiver;
	
	public RoomVO() {
	}

	public WebSocketSession getSender() {
		return sender;
	}

	public void setSender(WebSocketSession sender) {
		this.sender = sender;
	}

	public WebSocketSession getReceiver() {
		return receiver;
	}

	public void setReceiver(WebSocketSession receiver) {
		this.receiver = receiver;
	}
}
