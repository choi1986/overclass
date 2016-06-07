package kr.co.overclass.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.overclass.domain.DocumentVO;
import kr.co.overclass.domain.UserVO;

@Repository
public class SearchDAOImpl implements SearchDAO {

	@Inject
	private SqlSession session;
	
	public SearchDAOImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<DocumentVO> searchTag(String doc_tag) {
		return session.selectList("search.searchTag", doc_tag);
	}

	@Override
	public List<UserVO> search(String info) throws Exception {
		return session.selectList("search.search", info);
	}

}


