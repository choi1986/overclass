package kr.co.overclass.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.overclass.domain.FriendVO;
import kr.co.overclass.persistence.FriendDAO;

@Service
public class FriendServiceImpl implements FriendService {

	@Inject
	private FriendDAO dao;
	
	@Override
	public int insert_rel(FriendVO vo) throws Exception {
		return dao.oc_insert_rel(vo);
	}

	@Override
	public int delete_rel(FriendVO vo) throws Exception {
		return dao.oc_delete_rel(vo);
	}

	@Override
	public List<FriendVO> select_rel(String user_id) throws Exception {
		return dao.oc_select_rel(user_id);
	}

	@Override
	public int insert_req(FriendVO vo) throws Exception {
		return dao.oc_insert_req(vo);
	}

	@Override
	public int delete_req(FriendVO vo) throws Exception {
		return dao.oc_delete_req(vo);
	}

	@Override
	public List<FriendVO> select_req_send(FriendVO vo) throws Exception {
		return dao.oc_select_req_send(vo);
	}

	@Override
	public List<FriendVO> select_req_receive(FriendVO vo) throws Exception {
		return dao.oc_select_req_receive(vo);
	}

	@Override
	public List<FriendVO> select_req_all(FriendVO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
