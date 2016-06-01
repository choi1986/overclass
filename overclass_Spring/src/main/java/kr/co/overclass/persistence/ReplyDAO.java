package kr.co.overclass.persistence;


import java.util.List;

import kr.co.overclass.domain.ReplyVO;

public interface ReplyDAO {
	public void create(ReplyVO vo) throws Exception;
	public List<ReplyVO> list(int dno) throws Exception;
	public void delete(int rno) throws Exception;
}
