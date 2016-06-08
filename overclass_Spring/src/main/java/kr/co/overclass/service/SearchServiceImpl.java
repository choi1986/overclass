package kr.co.overclass.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.overclass.domain.DocumentVO;
import kr.co.overclass.domain.UserVO;
import kr.co.overclass.persistence.SearchDAO;

@Service
public class SearchServiceImpl implements SearchService {

	@Inject
	private SearchDAO search;

	@Override
	public List<DocumentVO> selectTag(String doc_tag) throws Exception {
		return search.searchTag(doc_tag);//태그 검색
	}

	@Override
	public List<UserVO> select(String info) throws Exception {
		return search.search(info);//아이디 검색
	}

}



