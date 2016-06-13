package kr.co.overclass.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.ReplyVO;
import kr.co.overclass.dto.ReplyDTO;
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
	public boolean removeReply(int rno, String user_id) throws Exception {
		user_id="test1";
		if(dao.reply(rno).getReplyer().equals(user_id)) {
			dao.delete(rno);
			return true;
		}
		return false;
	}

	@Override
	public List<ReplyDTO> listReply(int dno, Criteria cri) throws Exception {
		return dao.list(dno,cri);
	}

	@Override
	public int countReply(int dno) throws Exception {
		return dao.count(dno);
	}

}
