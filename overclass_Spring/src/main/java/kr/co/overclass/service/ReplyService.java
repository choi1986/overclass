package kr.co.overclass.service;

import java.util.List;
import java.util.Map;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.ReplyVO;
import kr.co.overclass.dto.ReplyCountDTO;
import kr.co.overclass.dto.ReplyDTO;

public interface ReplyService {
	public void addReply(ReplyVO vo)throws Exception;
	public boolean removeReply(int rno, String user_id)throws Exception;
	public List<ReplyDTO> listReply(int dno,Criteria cri)throws Exception;
	public List<ReplyCountDTO> countReply(Map<String, Object> map) throws Exception;
	public int count(int dno) throws Exception;
}
