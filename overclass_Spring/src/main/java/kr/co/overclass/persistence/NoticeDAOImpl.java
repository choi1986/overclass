package kr.co.overclass.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.overclass.domain.DocumentVO;
import kr.co.overclass.domain.FriendVO;
import kr.co.overclass.domain.GoodVO;
import kr.co.overclass.dto.GoodNoticeDTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Inject
	private SqlSession session;
	
	@Override
	public List<GoodVO> goodNotice(int dno) throws Exception {
		return session.selectList("notice.good", dno);
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
