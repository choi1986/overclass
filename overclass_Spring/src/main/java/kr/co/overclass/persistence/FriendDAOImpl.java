package kr.co.overclass.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.co.overclass.domain.FriendVO;

@Repository
public class FriendDAOImpl implements FriendDAO {

	private static final Logger logger = LoggerFactory.getLogger(FriendDAOImpl.class);
	
	@Inject
	private SqlSession session;
	
	@Override
	public void oc_insert_rel(FriendVO vo) throws Exception {
		session.insert("friend.insert_rel",vo);
	}

	@Override
	public void oc_delete_rel(FriendVO vo) throws Exception {
		session.delete("friend.delete_rel",vo);
	}

	@Override
	public void oc_select_rel(FriendVO vo) throws Exception {
		session.selectList("friend.select_rel", vo);
	}

	@Override
	public void oc_insert_req(FriendVO vo) throws Exception {
		session.insert("friend.insert_req",vo);
	}

	@Override
	public void oc_delete_req(FriendVO vo) throws Exception {
		session.delete("friend.delete_req",vo);
	}

	@Override
	public void oc_select_req(FriendVO vo) throws Exception {
		session.selectList("friend.select_req",vo);
	}
}
