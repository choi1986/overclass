package kr.co.overclass.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.overclass.domain.FriendVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Inject
	private SqlSession session;

	@Override
	public List<FriendVO> receiveReqNotice(String user_id) throws Exception {
		return session.selectList("notice.receivereq", user_id);
	}

	@Override
	public int countReq(String user_id) throws Exception {
		return session.selectOne("notice.countReq", user_id);
	}

	@Override
	public void reqSubmit(String sender, String receiver) throws Exception {
		Map<String,String> map = new HashMap<>();
		map.put("sender", sender);
		map.put("receiver", receiver);
		session.insert("notice.reqSubmit", map);
		session.delete("notice.reqDelete", map);
	}
}
