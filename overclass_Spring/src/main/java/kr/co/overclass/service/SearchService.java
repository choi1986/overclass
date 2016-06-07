package kr.co.overclass.service;

import java.util.List;

import kr.co.overclass.domain.DocumentVO;
import kr.co.overclass.domain.UserVO;

public interface SearchService {
	public List<UserVO> select(String info)throws Exception;
	public List<DocumentVO> selectTag(String doc_tag)throws Exception;
}
