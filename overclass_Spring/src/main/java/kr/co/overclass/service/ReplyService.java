package kr.co.overclass.service;

import java.util.List;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.ReplyVO;

public interface ReplyService {
	public void addReply(ReplyVO vo)throws Exception;
	public void removeReply(int rno)throws Exception;
	public List<ReplyVO> listReply(int dno,Criteria cri)throws Exception;
}
