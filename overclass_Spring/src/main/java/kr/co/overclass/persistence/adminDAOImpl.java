package kr.co.overclass.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.overclass.domain.BanVO;
import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.ReportVO;

@Repository
public class adminDAOImpl implements adminDAO{
	
	@Inject
	private SqlSession session;
	
	@Override
	public void ban(BanVO vo) throws Exception {
		
	}

	@Override
	public List<ReportVO> list(Criteria cri, String writer) throws Exception {
		return null;
	}

	@Override
	public int report_count(String writer) throws Exception {
		return 0;
	}

	@Override
	public void report(ReportVO vo) throws Exception {
		session.insert("admin.report", vo);
	}
}
