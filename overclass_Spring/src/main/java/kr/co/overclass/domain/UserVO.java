package kr.co.overclass.domain;

import java.util.Date;

public class UserVO {
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String user_email;
	private String user_tel;
	private String user_loc;
	private String user_hobby1;
	private String user_hobby2;
	private String user_birth;
	private String user_gender;
	private String user_pwdq;
	private String user_pwda;
	private Date user_joindate;
	private String user_image;
	private int user_logincnt;
	private int user_admin;

	public UserVO() {
		user_image = "";
	}

	@Override
	public String toString() {
		return "[�����ID: "+user_id+
				", ����ھ�ȣ: "+user_pwd+
				", �̸�: "+user_name+
				", �̸���: "+user_email+
				", �ڵ�����ȣ: "+user_tel+
				", ����: "+user_loc+
				", ���1: "+user_hobby1+
				", ���2: "+user_hobby2+
				", ����: "+user_birth+
				", ����: "+user_gender+
				", ��й�ȣ����: "+user_pwdq+
				", ��й�ȣ��: "+user_pwda+
				", ��������: "+user_joindate+
				", �����ʻ���: "+user_image+
				", �α���Ƚ��: "+user_logincnt+
				", ������: "+user_admin+
				"]";
	}
	
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}

	public String getUser_loc() {
		return user_loc;
	}

	public void setUser_loc(String user_loc) {
		this.user_loc = user_loc;
	}

	public String getUser_hobby1() {
		return user_hobby1;
	}

	public void setUser_hobby1(String user_hobby1) {
		this.user_hobby1 = user_hobby1;
	}

	public String getUser_hobby2() {
		return user_hobby2;
	}

	public void setUser_hobby2(String user_hobby2) {
		this.user_hobby2 = user_hobby2;
	}

	public String getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public String getUser_pwdq() {
		return user_pwdq;
	}

	public void setUser_pwdq(String user_pwdq) {
		this.user_pwdq = user_pwdq;
	}

	public String getUser_pwda() {
		return user_pwda;
	}

	public void setUser_pwda(String user_pwda) {
		this.user_pwda = user_pwda;
	}

	public Date getUser_joindate() {
		return user_joindate;
	}

	public void setUser_joindate(Date user_joindate) {
		this.user_joindate = user_joindate;
	}

	public String getUser_image() {
		return user_image;
	}

	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}

	public int getUser_logincnt() {
		return user_logincnt;
	}

	public void setUser_logincnt(int user_logincnt) {
		this.user_logincnt = user_logincnt;
	}

	public int getUser_admin() {
		return user_admin;
	}

	public void setUser_admin(int user_admin) {
		this.user_admin = user_admin;
	}
	
	
	
}
