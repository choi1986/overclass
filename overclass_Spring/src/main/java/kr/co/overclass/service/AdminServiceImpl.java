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
	public List<ReportDTO> list(Criteria cri) throws Exception { //신고된 글 출력
		return dao.list(cri);
	}

	@Override
	public void report(ReportVO vo) throws Exception { //신고하기
		dao.report(vo);
	}

	@Override
	public int report_count() throws Exception { //신고된 글 개수
		return dao.report_count();
	}

	@Override
	public void banDoc(int reportno) throws Exception { //제제하기
		dao.banDoc(reportno);
	}

	@Override
	public void report_del(int reportno) throws Exception { //제제하고 글삭제
		dao.report_del(reportno);
	}
}
