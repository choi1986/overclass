package kr.co.overclass.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.ReportVO;
import kr.co.overclass.dto.ReportDTO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Inject
	private SqlSession session;

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

	@Override
	public void banDoc(int reportno) throws Exception { //�����ϱ�
		session.insert("admin.banDoc", reportno);
	}

	@Override
	public void report_del(int reportno) throws Exception { //�����ϰ� �ۻ���
		session.delete("admin.report_del", reportno);
	}

	@Override
	public List<ReportDTO> ban_list() throws Exception {
		return session.selectList("admin.ban_list");
	}

	@Override
	public int report_stack(String writer) throws Exception {
		return session.selectOne("admin.report_stack",writer);
	}

	@Override
	public int report_sel(ReportVO vo) throws Exception {
		return session.selectOne("admin.report_sel", vo);
	}
}
