package kr.co.overclass.persistence;

import java.util.List;

import kr.co.overclass.domain.DocumentVO;
import kr.co.overclass.domain.UserVO;

public interface SearchDAO {
	//아이디/이름검색
	public List<UserVO> search(String info)throws Exception;
	//태그검색
	public List<DocumentVO> searchTag(String doc_tag)throws Exception;
}
