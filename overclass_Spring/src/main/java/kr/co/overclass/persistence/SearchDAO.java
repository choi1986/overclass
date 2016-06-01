package kr.co.overclass.persistence;

import java.util.List;

import kr.co.overclass.domain.DocumentVO;
import kr.co.overclass.domain.UserVO;

public interface SearchDAO {
	//아이디검색
	public UserVO searchId(String user_id)throws Exception;
	//이름검색
	public List<UserVO> searchName(String user_name)throws Exception;
	//태그검색
	public List<DocumentVO> searchTag(String doc_tag)throws Exception;
}
