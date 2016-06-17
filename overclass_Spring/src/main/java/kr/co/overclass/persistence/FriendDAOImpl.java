package kr.co.overclass.persistence;

import java.util.List;

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
	public int oc_insert_rel(FriendVO vo) throws Exception {
		return session.insert("friend.insert_rel",vo);
		//�Էµ� �� ���� ����
	}

	@Override
	public int oc_delete_rel(FriendVO vo) throws Exception {
		return session.delete("friend.delete_rel",vo);
		//������ �� ���� ����
	}

	@Override
	public List<FriendVO> oc_select_rel(FriendVO vo) throws Exception {
		return session.selectList("friend.select_rel", vo);
		//�˻��� ��� ����Ʈ�� ����
	}

	@Override
	public int oc_insert_req(FriendVO vo) throws Exception {
		return session.insert("friend.insert_req",vo);
		//�Էµ� �� ���� ����
	}

	@Override
	public int oc_delete_req(FriendVO vo) throws Exception {
		return session.delete("friend.delete_req",vo);
		//������ �� ���� ����
	}

	@Override
	public FriendVO oc_select_req_all(FriendVO vo) throws Exception {
		return null;
	}

	@Override
	public List<FriendVO> oc_select_req_send(FriendVO vo) throws Exception {
		return session.selectList("friend.select_req_send", vo);
	}

	@Override
	public List<FriendVO> oc_select_req_receive(FriendVO vo) throws Exception {
		return session.selectList("friend.select_req_recieve", vo);
	}
}