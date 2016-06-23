package kr.co.overclass.dto;

import java.util.Date;

public class DocumentDTO {
	private int dno;
	private String writer;
	private String content;
	private String tag;
	private Date writedate;
	private String image;
	private String mapLoc;
	private int goodcnt;
	private int replycnt;
	private String user_image;
	private int good;

	public DocumentDTO() {
		image = "";
	}
	
	@Override
	public String toString() {
		return "[글번호: "+dno+
				", 글쓴이: "+writer+
				", 글내용: "+content+
				", 태그: "+tag+
				", 글작성일자: "+writedate+
				", 이미지경로: "+image+
				", 좋아요개수: "+goodcnt+
				", 댓글개수: "+replycnt+
				", 프로필사진: "+user_image+
				", 굿여부: "+good+
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
	
	public String getMapLoc() {
		return mapLoc;
	}

	public void setMapLoc(String mapLoc) {
		this.mapLoc = mapLoc;
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

	public String getUser_image() {
		return user_image;
	}

	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}

	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
	}
	
}
