package kr.co.overclass.domain;

public class MsgwsVO {
	private String sender;
	private String receiver;
	private int protocol;
	private String msg;
	
	public MsgwsVO() {
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public int getProtocol() {
		return protocol;
	}

	public void setProtocol(int protocol) {
		this.protocol = protocol;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
}
