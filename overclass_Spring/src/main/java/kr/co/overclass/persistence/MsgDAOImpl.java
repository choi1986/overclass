package kr.co.overclass.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.co.overclass.domain.MsgVO;
import kr.co.overclass.domain.MsgwsVO;
import kr.co.overclass.dto.ChatFriendListDTO;
import kr.co.overclass.dto.MsgDTO;
import kr.co.overclass.service.MsgServiceImpl;

@Repository
public class MsgDAOImpl implements MsgDAO {
	private static final Logger logger = LoggerFactory.getLogger(MsgDAO.class);
	
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
		logger.info("조회하는 아이디 : "+receiver);
		return session.selectList("msg.read4", receiver,new RowBounds(0, 4));
	}

	@Override
	public List<ChatFriendListDTO> friendList(String user_id) throws Exception {
		return session.selectList("msg.friendList", user_id);
	}

	@Override
	public List<MsgDTO> chatList(Map<String, String> map) throws Exception {
		RowBounds rb = new RowBounds(0, 30);
		List<MsgDTO> temp = session.selectList("msg.chatList", map, rb);
		List<MsgDTO> returnlist = new ArrayList<>();
		int j = temp.size()-1;
		for(int i=temp.size()-1; i>=0;i--){
			returnlist.add(temp.get(i));
		}
		return returnlist;
	}

	@Override
	public void changeRead(Map<String, String> map) throws Exception {
		session.update("msg.changeRead",map);
	}

	@Override
	public void writeNR(MsgwsVO vo) throws Exception {
		session.insert("msg.writeNR",vo);
	}
	
	@Override
	public String getImage(String sender) throws Exception {
		return session.selectOne("msg.getImage",sender);
	}
}
