package kr.co.overclass.service;

import java.util.List;
import java.util.Map;

import kr.co.overclass.domain.UserVO;
import kr.co.overclass.dto.DocumentDTO;

public interface FindService {
	public List<DocumentDTO> tagFind(String tag, String user_id) throws Exception;
	public int tagcnt(String tag) throws Exception;
	public List<UserVO> friendFind(Map<String, Object> map) throws Exception;
	public int friendcnt(String friend) throws Exception;
}
