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
	public List<ReportDTO> list(Criteria cri) throws Exception { //�Ű�� ���
		return session.selectList("admin.list");
	}

	@Override
	public int report_count() throws Exception { //�Ű�� ����
		return session.selectOne("admin.report_count");
	}

	@Override
	public void report(ReportVO vo) throws Exception { //�Ű��ϱ�
		session.insert("admin.report", vo);
	}
}
