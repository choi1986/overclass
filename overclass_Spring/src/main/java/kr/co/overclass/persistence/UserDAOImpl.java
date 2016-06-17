package kr.co.overclass.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.overclass.domain.UserVO;
import kr.co.overclass.dto.LoginDTO;
import kr.co.overclass.dto.SearchIDDTO;
import kr.co.overclass.dto.SearchPwdDTO;

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
	public int createUser(UserVO user) throws Exception {
		return session.insert("user.createUser", user);
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
	public UserVO login(LoginDTO dto) throws Exception {
		return session.selectOne("user.login", dto);
	}

	@Override
	public void keepLogin(String user_id, String session_id, Date next) throws Exception {
		Map<String,Object> map = new HashMap<>();
		   map.put("user_id", user_id);
		   map.put("session_id", session_id);
		   map.put("next", next);
		session.update("user.keepLogin", map);	
	}

	@Override
	public UserVO checkUserWithSessionKey(String value) throws Exception {
		return session.selectOne("user.checkUserWithSessionKey", value);
	}
	
	@Override
	public String searchID(SearchIDDTO dto) throws Exception {
		return session.selectOne("user.searchID", dto);
	}
	
	@Override
	public boolean searchPwd(SearchPwdDTO dto) throws Exception {
		if (session.update("user.searchPwd", dto)==1) return true;
		else return false;
	}

}
