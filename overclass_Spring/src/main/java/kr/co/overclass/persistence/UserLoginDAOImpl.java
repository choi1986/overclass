package kr.co.overclass.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class UserLoginDAOImpl implements UserLoginDAO {

	@Inject
	private SqlSession session;
	
	public UserLoginDAOImpl() {
	}

	@Override
	public String searchUserLogin (String user_id) throws Exception {
		return session.selectOne("user.searchUserLogin", user_id);
	}

	@Override
	public void createUserLogin (String user_id) throws Exception {
		session.insert("user.createUserLogin", user_id);
	}

	@Override
	public void deleteUserLogin (String user_id) throws Exception {
		session.update("user.deleteUserLogin", user_id);
	}
}
