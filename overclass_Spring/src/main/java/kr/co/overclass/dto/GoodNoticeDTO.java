package kr.co.overclass.dto;

public class GoodNoticeDTO {
	private String writer;
	private int dno;
	private String good_user;
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public String getGood_user() {
		return good_user;
	}
	public void setGood_user(String good_user) {
		this.good_user = good_user;
	}
	
	@Override
	public String toString() {
		return "[�ۼ���: "+writer+", �۹�ȣ: "+dno+", ���ƿ��Ѿ��̵�"+good_user+"]";
	}
}
