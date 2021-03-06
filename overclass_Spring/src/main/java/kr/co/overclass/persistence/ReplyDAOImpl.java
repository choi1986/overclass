package kr.co.overclass.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.ReplyVO;
import kr.co.overclass.dto.ReplyCountDTO;
import kr.co.overclass.dto.ReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	private static final Logger logger = LoggerFactory.getLogger(ReplyDAOImpl.class);
	
	@Inject
	private SqlSession session;

	@Override
	public void create(ReplyVO vo) throws Exception {
		session.insert("reply.create",vo);
	}

	@Override
	public List<ReplyDTO> list(int dno, Criteria cri) throws Exception {
		RowBounds bounds= new RowBounds(cri.getPageStart(), 
                cri.getPerPageNum());
			//1페이지:(0,10)   2페이지:(10,10)    3페이지:(20,10)

		return session.selectList("reply.read",dno,bounds);
	}

	@Override
	public void delete(int rno) throws Exception {
		session.delete("reply.delete",rno);
	}
	
	@Override
	public List<ReplyCountDTO> count(Map<String, Object> map) throws Exception {
		return session.selectList("reply.count",map);
	}

	@Override
	public ReplyVO reply(int rno) throws Exception {
		return session.selectOne("reply.selectOne",rno);
	}

	@Override
	public int replycount(int dno) throws Exception {
		return session.selectOne("reply.replycount",dno);
	}

}
