package kr.co.overclass.dto;

import java.util.Date;

public class JoinDTO {
	private String user_id;
	private String user_pwd;
	private String user_pwd_confirm;
	private String user_name;
	private String user_email;
	private String user_tel1;
	private String user_tel2;
	private String user_tel3;
	private String user_loc;
	private String user_hobby1;
	private String user_hobby2;
	private String user_birth;
	private String radio;
	private String user_pwdq;
	private String user_pwda;
	private Date user_joindate;
	private String user_image;
	private int user_logincnt;
	private int user_admin;
	private boolean joinErrorCk;

	public JoinDTO() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "[사용자ID: "+user_id+
				", 사용자암호: "+user_pwd+
				", 사용자암호확인: "+user_pwd_confirm+
				", 이름: "+user_name+
				", 이메일: "+user_email+
				", 핸드폰번호: "+user_tel1+"-"+user_tel2+"-"+user_tel3+
				", 지역: "+user_loc+
				", 취미1: "+user_hobby1+
				", 취미2: "+user_hobby2+
				", 생일: "+user_birth+
				", 성별: "+radio+
				", 비밀번호질문: "+user_pwdq+
				", 비밀번호답: "+user_pwda+
				", 가입일자: "+user_joindate+
				", 프로필사진: "+user_image+
				", 로그인횟수: "+user_logincnt+
				", 관리자: "+user_admin+
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

	public String getUser_pwd_confirm() {
		return user_pwd_confirm;
	}

	public void setUser_pwd_confirm(String user_pwd_confirm) {
		this.user_pwd_confirm = user_pwd_confirm;
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

	public String getUser_tel1() {
		return user_tel1;
	}

	public void setUser_tel1(String user_tel1) {
		this.user_tel1 = user_tel1;
	}

	public String getUser_tel2() {
		return user_tel2;
	}

	public void setUser_tel2(String user_tel2) {
		this.user_tel2 = user_tel2;
	}

	public String getUser_tel3() {
		return user_tel3;
	}

	public void setUser_tel3(String user_tel3) {
		this.user_tel3 = user_tel3;
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

	public String getRadio() {
		return radio;
	}

	public void setRadio(String user_gender) {
		this.radio = user_gender;
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

	public boolean isJoinErrorCk() {
		return joinErrorCk;
	}

	public void setJoinErrorCk(boolean joinErrorCk) {
		this.joinErrorCk = joinErrorCk;
	}
	
	
}
