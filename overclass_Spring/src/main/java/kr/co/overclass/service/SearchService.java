package kr.co.overclass.service;

import java.util.List;

import kr.co.overclass.domain.DocumentVO;
import kr.co.overclass.domain.UserVO;

public interface SearchService {
	public UserVO selectId(String user_id)throws Exception;
	public List<UserVO> selectName(String user_name)throws Exception;
	public List<DocumentVO> selectTag(String doc_tag)throws Exception;
}
