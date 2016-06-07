package kr.co.overclass.service;

import kr.co.overclass.domain.UserVO;

public interface UserService {

	public UserVO searchUser (String user_id) throws Exception;
	public void createUser (UserVO user) throws Exception;
	public void updateUser (UserVO user) throws Exception;
	public void updateUserImg (String user_image) throws Exception;
	public void deleteUser (String user_id) throws Exception;
	public void login (String user_id, String user_pwd) throws Exception;
}
