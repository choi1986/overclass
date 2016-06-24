package kr.co.overclass.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.overclass.persistence.UserLoginDAO;

@Service
public class UserLoginServiceImpl implements UserLoginService {
	
	@Inject
	private UserLoginDAO userLoginDAO;

	@Override
	public String searchUserLogin (String user_id) throws Exception {
		return userLoginDAO.searchUserLogin(user_id);
	}

	@Override
	public void createUserLogin (String user_id) throws Exception {
		userLoginDAO.createUserLogin(user_id);
	}

	@Override
	public void deleteUserLogin (String user_id) throws Exception {
		userLoginDAO.deleteUserLogin(user_id);
	}
}
