package kr.co.overclass.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.overclass.domain.UserVO;
import kr.co.overclass.dto.LoginDTO;
import kr.co.overclass.dto.SearchIDDTO;
import kr.co.overclass.dto.SearchPwdDTO;
import kr.co.overclass.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDAO userDAO;

	@Override
	public UserVO searchUser(String user_id) throws Exception {
		return userDAO.searchUser(user_id);
	}

	@Override
	public int createUser(UserVO user) throws Exception {
		return userDAO.createUser(user);
	}

	@Override
	public void updateUser(UserVO user) throws Exception {
		userDAO.updateUser(user);
	}

	@Override
	public void updateUserImg(String user_image) throws Exception {
		userDAO.updateUserImg(user_image);
	}

	@Override
	public void deleteUser(String user_id) throws Exception {
		userDAO.deleteUser(user_id);
	}

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return userDAO.login(dto);
	}

	@Override
	public void keepLogin(String user_id, String session_id, Date next) throws Exception {
		userDAO.keepLogin(user_id, session_id, next);		
	}

	@Override
	public UserVO checkLoginBefore(String value) throws Exception {		
		return userDAO.checkUserWithSessionKey(value);
	}
	
	@Override
	public String searchID(SearchIDDTO dto) throws Exception {
		return userDAO.searchID(dto);
	}
	
	@Override
	public boolean searchPwd(SearchPwdDTO dto) throws Exception {
		return userDAO.searchPwd(dto);
	}

}
