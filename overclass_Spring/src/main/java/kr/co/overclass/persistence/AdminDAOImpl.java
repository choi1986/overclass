package kr.co.overclass.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.overclass.domain.BanVO;
import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.ReportVO;
import kr.co.overclass.dto.ReportDTO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Inject
	private SqlSession session;
	
	@Override
	public void ban(BanVO vo) throws Exception {
		
	}

	@Override
	public List<ReportDTO> list(Criteria cri) throws Exception { //신고글 출력
		return session.selectList("admin.list");
	}

	@Override
	public int report_count() throws Exception { //신고글 개수
		return session.selectOne("admin.report_count");
	}

	@Override
	public void report(ReportVO vo) throws Exception { //신고하기
		session.insert("admin.report", vo);
	}
}
