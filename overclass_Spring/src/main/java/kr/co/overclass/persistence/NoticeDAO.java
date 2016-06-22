package kr.co.overclass.persistence;

import java.util.List;

import kr.co.overclass.domain.DocumentVO;
import kr.co.overclass.domain.FriendVO;
import kr.co.overclass.domain.GoodVO;
import kr.co.overclass.dto.GoodNoticeDTO;

//좋아요 알림, 좋아요 알림, 친구요청보냄 알림, 친구요청받음 알림, 친구수락 알림, 새글 알림, 댓글알림
public interface NoticeDAO {
	public List<GoodVO> goodNotice(int dno)throws Exception;//좋아요한 아이디,글 확인
	public List<FriendVO> sendReqNotice()throws Exception;//친구요청 대상아이디 확인
	public List<FriendVO> receiveReqNotice()throws Exception;//친구요청한 아이디 확인
	public List<FriendVO> submitReqNotice()throws Exception;//친구관계 확인
	public List<DocumentVO> newDocNotice()throws Exception;//새글확인
	public List<GoodNoticeDTO> newRepNotice()throws Exception;//댓글확인
}
