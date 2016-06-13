package kr.co.overclass.persistence;


import java.util.List;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.ReplyVO;
import kr.co.overclass.dto.ReplyDTO;

public interface ReplyDAO {
	public void create(ReplyVO vo) throws Exception;
	public List<ReplyDTO> list(int dno, Criteria cri) throws Exception;
	public void delete(int rno) throws Exception;
	public int count(int dno) throws Exception;
}
