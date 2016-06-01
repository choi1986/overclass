package kr.co.overclass.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import kr.co.overclass.domain.DocumentVO;
import kr.co.overclass.domain.UserVO;

public class SearchDAOImpl implements SearchDAO {

	@Inject
	private SqlSession session;
	
	public SearchDAOImpl() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public UserVO searchId(String user_id) {
		return session.selectOne("search.searchId", user_id);
	}

	@Override
	public List<UserVO> searchName(String user_name) {
		return session.selectList("search.searchName", user_name);
	}

	@Override
	public List<DocumentVO> searchTag(String doc_tag) {
		return session.selectList("search.searchTag", doc_tag);
	}

}
