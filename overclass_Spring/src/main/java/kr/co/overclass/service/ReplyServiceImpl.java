package kr.co.overclass.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.overclass.domain.ReplyVO;
import kr.co.overclass.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO dao;
	
	@Override
	public void addReply(ReplyVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public void removeReply(int rno) throws Exception {
		dao.delete(rno);
	}

	@Override
	public List<ReplyVO> listReply(int dno) throws Exception {
		return dao.list(dno);
	}

}
