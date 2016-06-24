package kr.co.overclass.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.overclass.domain.MsgVO;
import kr.co.overclass.domain.MsgwsVO;
import kr.co.overclass.dto.ChatFriendListDTO;
import kr.co.overclass.dto.MsgDTO;

@Repository
public class MsgDAOImpl implements MsgDAO {
	
	@Inject
	private SqlSession session;
	
	@Override
	public void write(MsgwsVO vo) throws Exception {
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

	@Override
	public List<ChatFriendListDTO> friendList(String user_id) throws Exception {
		return session.selectList("msg.friendList", user_id);
	}

	@Override
	public List<MsgDTO> chatList(Map<String, String> map) throws Exception {
		RowBounds rb = new RowBounds(0, 30);
		return session.selectList("msg.chatList", map, rb);
	}
}
