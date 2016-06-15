package kr.co.overclass.persistence;

import java.util.List;

import kr.co.overclass.domain.BanVO;
import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.ReportVO;

public interface adminDAO {
	public void ban(BanVO vo) throws Exception; //제제하기
	public List<ReportVO>list(Criteria cri, String writer) throws Exception; //신고글 출력
	public void report(ReportVO vo) throws Exception;
	public int report_count(String writer) throws Exception;
}
