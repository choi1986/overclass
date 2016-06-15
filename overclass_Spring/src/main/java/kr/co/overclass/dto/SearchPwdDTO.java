package kr.co.overclass.dto;

public class SearchPwdDTO {
	private String user_id;
	private String user_pwd;
	private String user_pwd_confirm;
	private String user_pwdq;
	private String user_pwda;

	public SearchPwdDTO() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "[사용자ID: "+user_id+
				", 사용자암호: "+user_pwd+
				", 비밀번호질문: "+user_pwdq+
				", 비밀번호답: "+user_pwda+
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
		return user_pwd;
	}

	public void setUser_pwd_confirm(String user_pwd) {
		this.user_pwd = user_pwd;
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
}
