package kr.co.overclass.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.overclass.domain.MsgVO;
import kr.co.overclass.dto.MsgDTO;

@Repository
public class MsgDAOImpl implements MsgDAO {
	
	@Inject
	private SqlSession session;
	
	@Override
	public void write(MsgVO vo) throws Exception {
		session.insert("msg.write",vo);
	}

	@Override
	public List<MsgDTO> read(String user_id) throws Exception {
		return session.selectList("msg.read", user_id);
	}

	@Override
	public int count(String user_id) throws Exception {
		return session.selectOne("msg.count",user_id);
	}

	@Override
	public List<MsgDTO> sitebarDisplay(String receiver) throws Exception {
		return session.selectList("msg.read4", receiver,new RowBounds(0, 4));
	}

}
