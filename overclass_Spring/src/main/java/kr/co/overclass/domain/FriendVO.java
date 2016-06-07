package kr.co.overclass.domain;

public class FriendVO {
	private String sender;//보내는 사람
	private String receiver;//받는 사람
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
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
	
}
