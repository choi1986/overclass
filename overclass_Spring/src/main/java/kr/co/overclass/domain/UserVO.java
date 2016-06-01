package kr.co.overclass.domain;

import java.util.Date;

public class UserVO {
	private int dno;
	private String writer;
	private String content;
	private String tag;
	private Date writedate;
	private String image;
	private int goodcnt;
	private int replycnt;

	public UserVO() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "[글번호: "+dno+
				", 작성자: "+writer+
				", 내용: "+content+
				", 태그: "+tag+
				", 작성일: "+writedate+
				", 이미지: "+image+
				", 좋아요: "+goodcnt+
				", 댓글: "+replycnt+
				"]";
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getGoodcnt() {
		return goodcnt;
	}

	public void setGoodcnt(int goodcnt) {
		this.goodcnt = goodcnt;
	}

	public int getReplycnt() {
		return replycnt;
	}

	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	
	
	
}
