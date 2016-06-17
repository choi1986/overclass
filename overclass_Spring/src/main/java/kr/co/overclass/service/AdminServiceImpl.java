package kr.co.overclass.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.overclass.domain.BanVO;
import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.ReportVO;
import kr.co.overclass.dto.ReportDTO;
import kr.co.overclass.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{

	@Inject
	private AdminDAO dao;
	
	@Override
	public void ban(BanVO vo) throws Exception {
		
	}

	@Override
	public List<ReportDTO> list(Criteria cri) throws Exception {
		return dao.list(cri);
	}

	@Override
	public void report(ReportVO vo) throws Exception {
		dao.report(vo);
	}

	@Override
	public int report_count() throws Exception {
		return dao.report_count();
	}
}
