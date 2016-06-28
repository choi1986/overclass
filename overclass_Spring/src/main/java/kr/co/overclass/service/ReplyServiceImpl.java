package kr.co.overclass.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.ReplyVO;
import kr.co.overclass.dto.ReplyCountDTO;
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
	public List<ReplyCountDTO> countReply(Map<String, Object> map) throws Exception {
		return dao.count(map);
	}

	@Override
	public int count(int dno) throws Exception {
		return dao.replycount(dno);
	}

}
