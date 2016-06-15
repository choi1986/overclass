package kr.co.overclass.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.overclass.domain.FriendVO;
import kr.co.overclass.persistence.FriendDAO;

@Service
public class FriendServiceImpl implements FriendService {

	@Inject
	private FriendDAO dao;
	
	@Override
	public void insert_rel(FriendVO vo) throws Exception {
		dao.oc_insert_rel(vo);
	}

	@Override
	public void delete_rel(FriendVO vo) throws Exception {
		dao.oc_delete_rel(vo);
	}

	@Override
	public void select_rel(FriendVO vo) throws Exception {
		dao.oc_select_rel(vo);
	}

	@Override
	public void insert_req(FriendVO vo) throws Exception {
		dao.oc_insert_req(vo);
	}

	@Override
	public void delete_req(FriendVO vo) throws Exception {
		dao.oc_delete_req(vo);
	}

	@Override
	public void select_req(FriendVO vo) throws Exception {
		dao.oc_select_req(vo);
	}

}
