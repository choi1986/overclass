package kr.co.overclass.dto;

public class SearchIDDTO {
	private String user_name;
	private String user_email;
	private String user_birth;

	public SearchIDDTO() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "[이름: "+user_name+
				", 이메일: "+user_email+
				", 생일: "+user_birth+"]";
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

	public String getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
}
