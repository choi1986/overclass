package kr.co.overclass.service;

import java.util.List;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.ReplyVO;
import kr.co.overclass.dto.ReplyDTO;

public interface ReplyService {
	public void addReply(ReplyVO vo)throws Exception;
	public void removeReply(int rno)throws Exception;
	public List<ReplyDTO> listReply(int dno,Criteria cri)throws Exception;
	public int countReply(int dno) throws Exception;
}
