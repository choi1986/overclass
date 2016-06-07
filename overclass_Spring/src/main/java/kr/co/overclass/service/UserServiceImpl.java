package kr.co.overclass.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.overclass.domain.UserVO;
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
	public void createUser(UserVO user) throws Exception {
		userDAO.createUser(user);
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
	public UserVO login(String user_id, String user_pwd) throws Exception {
		return userDAO.login(user_id, user_pwd);
	}

}
