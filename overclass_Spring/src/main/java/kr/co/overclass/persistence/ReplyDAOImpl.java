package kr.co.overclass.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.overclass.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	private SqlSession session;

	@Override
	public void create(ReplyVO vo) throws Exception {
		session.insert("reply.create",vo);
	}

	@Override
	public List<ReplyVO> list(int dno) throws Exception {
		return session.selectList("reply.read",dno);
	}

	@Override
	public void delete(int rno) throws Exception {
		session.delete("reply.delete",rno);
	}

}
