package kr.co.overclass.dto;

public class LoginDTO {
  //login페이지에 필요한 객체
   private String user_id;
   private String user_pwd;
   private boolean useCookie;   
     
   
   
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


public boolean isUseCookie() {
	return useCookie;
}



public void setUseCookie(boolean useCookie) {
	this.useCookie = useCookie;
}



    @Override
	public String toString() {
		return "[아이디:"+user_id+", 비번:"+user_pwd+
				", 쿠키사용:"+useCookie+"]";
	}
   
    
   
   

}
