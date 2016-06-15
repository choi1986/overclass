package kr.co.overclass.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.overclass.domain.MsgVO;

@Repository
public class MsgDAOImpl implements MsgDAO {
	
	@Inject
	private SqlSession session;
	
	@Override
	public void write(MsgVO vo) throws Exception {
		session.insert("msg.write",vo);
	}

	@Override
	public List<MsgVO> read(String user_id) throws Exception {
		List<MsgVO> list = session.selectList("msg.read", user_id);
		return list;
	}

	@Override
	public int count(String user_id) throws Exception {
		return session.selectOne("msg.count",user_id);
	}

}
