package kr.co.overclass.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.ReportVO;
import kr.co.overclass.domain.UserVO;
import kr.co.overclass.dto.DocumentDTO;
import kr.co.overclass.dto.ReportDTO;

@Repository
public class FindDAOImpl implements FindDAO{
	
	@Inject
	private SqlSession session;

	@Override
	public List<DocumentDTO> tagFind(String tag) throws Exception {
		return session.selectList("find.tagfind",tag);
	}

	@Override
	public int tagcnt(String tag) throws Exception {
		return session.selectOne("find.tagcnt",tag);
	}

	@Override
	public List<UserVO> friendFind(String friend) throws Exception {
		return session.selectList("find.friendfind",friend);
	}

	@Override
	public int friendcnt(String friend) throws Exception {
		return session.selectOne("find.friendcnt", friend);
	}
}
