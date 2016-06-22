package kr.co.overclass.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.overclass.domain.DocumentVO;
import kr.co.overclass.domain.FriendVO;
import kr.co.overclass.domain.GoodVO;
import kr.co.overclass.domain.ReplyVO;
import kr.co.overclass.dto.GoodNoticeDTO;
import kr.co.overclass.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	private NoticeDAO dao;
	
	@Override
	public List<GoodNoticeDTO> goodNotice() throws Exception {
		return null;
	}

	@Override
	public List<FriendVO> sendReqNotice() throws Exception {
		return null;
	}

	@Override
	public List<FriendVO> receiveReqNotice() throws Exception {
		return null;
	}

	@Override
	public List<FriendVO> submitReqNotice() throws Exception {
		return null;
	}

	@Override
	public List<DocumentVO> newDocNotice() throws Exception {
		return null;
	}

	@Override
	public List<GoodNoticeDTO> newRepNotice() throws Exception {
		return null;
	}

}
