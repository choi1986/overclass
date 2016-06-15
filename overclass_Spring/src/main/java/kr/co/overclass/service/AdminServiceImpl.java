package kr.co.overclass.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.overclass.domain.BanVO;
import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.ReportVO;
import kr.co.overclass.persistence.adminDAO;

@Service
public class AdminServiceImpl implements AdminService{

	@Inject
	private adminDAO dao;
	
	@Override
	public void ban(BanVO vo) throws Exception {
		
	}

	@Override
	public List<ReportVO> list(Criteria cri, String writer) throws Exception {
		return null;
	}

	@Override
	public void report(ReportVO vo) throws Exception {
		dao.report(vo);
	}

	@Override
	public int report_count(String writer) throws Exception {
		return 0;
	}
	
}
