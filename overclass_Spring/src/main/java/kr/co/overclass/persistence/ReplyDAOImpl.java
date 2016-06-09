package kr.co.overclass.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.ReplyVO;

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
	public List<ReplyVO> list(int dno, Criteria cri) throws Exception {
		RowBounds bounds= new RowBounds(cri.getPageStart(), 
                cri.getPerPageNum());
		logger.info(dno+"");
		logger.info("cri 스타트페이지값 : "+cri.getPageStart());
		logger.info("cri 페이지넘값 : "+cri.getPerPageNum());
			//1페이지:(0,10)   2페이지:(10,10)    3페이지:(20,10)

		return session.selectList("reply.read",dno,bounds);
	}

	@Override
	public void delete(int rno) throws Exception {
		session.delete("reply.delete",rno);
	}

}
