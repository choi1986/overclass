package kr.co.overclass.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.DocumentVO;
import kr.co.overclass.domain.SearchVO;
import kr.co.overclass.domain.UserVO;
import kr.co.overclass.persistence.SearchDAO;

@Service
public class SearchServiceImpl implements SearchService {

	@Inject
	private SearchDAO search;

	@Override
	public List<DocumentVO> selectTag(SearchVO vo) throws Exception {
		return search.searchTag(vo);//태그 검색
	}

	@Override
	public List<UserVO> select(SearchVO vo) throws Exception {
		return search.search(vo);//아이디 검색
	}

	@Override
	public int countNameNum(String user_name) throws Exception {
		return search.countName(user_name);
	}

	@Override
	public int countIdNum(String user_id) throws Exception {
		return search.countId(user_id);
	}

	@Override
	public int countTagNum(String tag) throws Exception {
		return search.countTag(tag);
	}

}



