package kr.co.overclass.domain;

public class SearchVO {//���̵� �̸� �±� �˻��� VO
	String info;
	int start;
	int end;
	public SearchVO() {
		// TODO Auto-generated constructor stub
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	@Override
	public String toString() {
		return "[Ű����"+info+", start: "+start+", end: "+end+"]";
	}
}
