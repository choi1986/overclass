package kr.co.overclass.dto;

public class FriendDTO {
	private String oc_sender;//요청ID
	private String oc_receiver;//대상ID
	
	
	public FriendDTO(String oc_sender, String oc_receiver) {
		super();
		this.oc_sender = oc_sender;
		this.oc_receiver = oc_receiver;
	}
	
	public String getOc_sender() {
		return oc_sender;
	}
	public void setOc_sender(String oc_sender) {
		this.oc_sender = oc_sender;
	}
	public String getOc_receiver() {
		return oc_receiver;
	}
	public void setOc_receiver(String oc_receiver) {
		this.oc_receiver = oc_receiver;
	}
	
	
}
