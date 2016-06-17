package kr.co.overclass.persistence;

import java.util.List;
import java.util.Map;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.DocumentVO;
import kr.co.overclass.domain.SearchVO;
import kr.co.overclass.domain.UserVO;

public interface SearchDAO {
	public List<UserVO> search(SearchVO vo)throws Exception;//아이디 이름 검색
	public List<DocumentVO> searchTag(SearchVO vo)throws Exception;//태그 검색
	public int countName(String user_name)throws Exception;//페이징 처리위한 검색결과 수
	public int countId(String user_id)throws Exception;//페이징 처리위한 검색결과 수
	public int countTag(String tag)throws Exception;//페이징 처리위한 검색결과 수
}


