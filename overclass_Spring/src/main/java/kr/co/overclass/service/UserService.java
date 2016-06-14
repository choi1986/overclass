package kr.co.overclass.service;

import java.util.Date;

import kr.co.overclass.domain.UserVO;
import kr.co.overclass.dto.LoginDTO;
import kr.co.overclass.dto.SearchIDDTO;
import kr.co.overclass.dto.SearchPwdDTO;

public interface UserService {

	public UserVO searchUser (String user_id) throws Exception;
	public void createUser (UserVO user) throws Exception;
	public void updateUser (UserVO user) throws Exception;
	public void updateUserImg (String user_image) throws Exception;
	public void deleteUser (String user_id) throws Exception;
	public UserVO login (LoginDTO dto) throws Exception;
    public void keepLogin (String user_id, String session_id, Date next) throws Exception;
    public UserVO checkLoginBefore (String value) throws Exception;
	// 아이디 찾기
	public String searchID (SearchIDDTO dto) throws Exception;
	// 비밀번호 찾기
	public boolean searchPwd (SearchPwdDTO dto) throws Exception;
}
