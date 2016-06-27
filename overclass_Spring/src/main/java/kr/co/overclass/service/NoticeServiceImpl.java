package kr.co.overclass.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.overclass.domain.FriendVO;
import kr.co.overclass.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	private NoticeDAO dao;

	@Override
	public List<FriendVO> receiveReqNotice(String user_id) throws Exception {
		return dao.receiveReqNotice(user_id);
	}

	@Override
	public int countReq(String user_id) throws Exception {
		return dao.countReq(user_id);
	}

	@Override
	public void reqSubmit(String sender, String receiver) throws Exception {
		dao.reqSubmit(sender, receiver);
	}
}
