package kr.co.overclass.domain;

public class FriendVO {
	private String sender;//������ ���
	private String receiver;//�޴� ���
	
	public FriendVO(String sender, String receiver) {
		super();
		this.sender = sender;
		this.receiver = receiver;
	}

	public FriendVO() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "[������ ���: "+ sender + ", �޴� ���: "+ receiver + "]";
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
