package kr.co.overclass.dto;

public class FriendDTO {
	private String oc_sender_req;//ģ�� ���� ��û��(ģ����û)
	private String oc_receiver_req;//���� ���� ���(ģ����û)
	private String oc_sender_rel;//ģ�� ���� ��û��(ģ��)
	private String oc_receiver_rel;//ģ�� ���� ���(ģ��)
	@Override
	public String toString() {
		return "FriendDTO [oc_sender_req=" + oc_sender_req + ", oc_receiver_req=" + oc_receiver_req + ", oc_sender_rel="
				+ oc_sender_rel + ", oc_receiver_rel=" + oc_receiver_rel + "]";
	}
	
	public String getOc_sender_req() {
		return oc_sender_req;
	}
	public void setOc_sender_req(String oc_sender_req) {
		this.oc_sender_req = oc_sender_req;
	}
	public String getOc_receiver_req() {
		return oc_receiver_req;
	}
	public void setOc_receiver_req(String oc_receiver_req) {
		this.oc_receiver_req = oc_receiver_req;
	}
	public String getOc_sender_rel() {
		return oc_sender_rel;
	}
	public void setOc_sender_rel(String oc_sender_rel) {
		this.oc_sender_rel = oc_sender_rel;
	}
	public String getOc_receiver_rel() {
		return oc_receiver_rel;
	}
	public void setOc_receiver_rel(String oc_receiver_rel) {
		this.oc_receiver_rel = oc_receiver_rel;
	}
	
}
