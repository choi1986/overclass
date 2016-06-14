package kr.co.overclass.dto;

import java.util.Date;

public class BanVO {
	private String ban_id;
	private Date ban_date;
	private String ban_content;
	
	public BanVO() {
	}

	public String getBan_id() {
		return ban_id;
	}

	public void setBan_id(String ban_id) {
		this.ban_id = ban_id;
	}

	public Date getBan_date() {
		return ban_date;
	}

	public void setBan_date(Date ban_date) {
		this.ban_date = ban_date;
	}

	public String getBan_cause() {
		return ban_content;
	}

	public void setBan_cause(String ban_cause) {
		this.ban_content = ban_cause;
	}
}
