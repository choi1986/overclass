package kr.co.overclass.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.ReportVO;
import kr.co.overclass.dto.ReportDTO;
import kr.co.overclass.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{

	@Inject
	private AdminDAO dao;
	
	@Override
	public List<ReportDTO> list(Criteria cri) throws Exception { //�Ű�� �� ���
		List<ReportDTO> list = dao.list(cri);
		String writers[] = new String[list.size()];
		String writer;
		for (int i = 0; i < list.size(); i++) {
			writers[i] = list.get(i).getWriter();
			writer = writers[i];
			int t = dao.report_stack(writer);
			list.get(i).setReport_stack(t);
		}
		
		return list;
	}

	@Override
	public void report(ReportVO vo) throws Exception { //�Ű��ϱ�
		dao.report(vo);
	}

	@Override
	public int report_count() throws Exception { //�Ű�� �� ����
		return dao.report_count();
	}

	@Override
	public void banDoc(int reportno) throws Exception { //�����ϱ�
		dao.banDoc(reportno);
	}

	@Override
	public void report_del(int reportno) throws Exception { //�����ϰ� �ۻ���
		dao.report_del(reportno);
	}

	@Override
	public List<ReportDTO> ban_list() throws Exception {
		return dao.ban_list();
	}

}
