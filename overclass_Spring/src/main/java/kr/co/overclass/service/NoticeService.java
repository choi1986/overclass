package kr.co.overclass.service;

import java.util.List;

import kr.co.overclass.domain.FriendVO;

//좋아요 알림, 친구요청받음 알림, 친구수락 알림, 새글 알림, 댓글알림
public interface NoticeService {
	public List<FriendVO> receiveReqNotice(String user_id)throws Exception;//친구요청한 아이디 확인
	public int countReq(String user_id) throws Exception;//친구요청 수
}
