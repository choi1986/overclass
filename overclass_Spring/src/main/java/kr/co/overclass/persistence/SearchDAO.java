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
	public int count(String value)throws Exception;//페이징 처리위한 검색결과 수
	public Map<String,Object> pageMaker(String info,Criteria cri)throws Exception;//sql 실행하기 위한 페이지메이커
}


