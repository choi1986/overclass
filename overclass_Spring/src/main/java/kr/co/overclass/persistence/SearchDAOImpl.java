package kr.co.overclass.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.DocumentVO;
import kr.co.overclass.domain.SearchVO;
import kr.co.overclass.domain.UserVO;

@Repository
public class SearchDAOImpl implements SearchDAO {

	@Inject
	private SqlSession session;
	
	public SearchDAOImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<DocumentVO> searchTag(SearchVO vo) {
		return session.selectList("search.searchTag", vo);//태그 검색
	}

	@Override
	public List<UserVO> search(SearchVO vo) throws Exception {
		return session.selectList("search.search", vo);//아이디 이름 검색
	}


	@Override
	public Map<String, Object> pageMaker(String info,Criteria cri) throws Exception {
		Map<String,Object> map = new HashMap<>();
		//10행씩 2페이지?
		//행의수 10 페이지1 1~10
		//행의수 10 페이지2 11~20	end=2*10
		//perPageNum:페이지당 보여줄 개수
		//pageStart:현재페이지
		int end = cri.getPage()*cri.getPerPageNum();
		int start = end-9;
		map.put("info", info);
		map.put("start", start);
		map.put("end", end);
		return map;
	}

	@Override
	public int countName(String user_name) throws Exception {
		return session.selectOne("search.countName", user_name);
	}

	@Override
	public int countId(String user_id) throws Exception {
		return session.selectOne("search.countId", user_id);
	}

	@Override
	public int countTag(String tag) throws Exception {
		return session.selectOne("search.countTag", tag);
	}

}


