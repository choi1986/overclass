package kr.co.overclass.service;

public interface UserLoginService {

	public String searchUserLogin (String user_id) throws Exception;
	public void createUserLogin (String user_id) throws Exception;
	public void deleteUserLogin (String user_id) throws Exception;
}
