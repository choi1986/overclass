package kr.co.overclass.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.overclass.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession session;
	
	public UserDAOImpl() {
	}

	@Override
	public UserVO searchUser(String user_id) throws Exception {
		return session.selectOne("user.searchUser", user_id);
	}

	@Override
	public void createUser(UserVO user) throws Exception {
		session.insert("user.createUser", user);
	}

	@Override
	public void updateUser(UserVO user) throws Exception {
		session.update("user.updateUser", user);
	}

	@Override
	public void updateUserImg(String user_image) throws Exception {
		session.update("user.updateUserImg", user_image);
	}

	@Override
	public void deleteUser(String user_id) throws Exception {
		session.update("user.deleteUser", user_id);
	}

	@Override
	public void login(String user_id, String user_pwd) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("pwd", user_pwd);
		session.update("user.login", map);
	}

}
