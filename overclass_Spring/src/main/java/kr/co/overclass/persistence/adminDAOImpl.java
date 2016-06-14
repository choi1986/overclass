package kr.co.overclass.persistence;

import java.util.List;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.dto.BanVO;
import kr.co.overclass.dto.ReportVO;

public class adminDAOImpl implements adminDAO{

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
}
