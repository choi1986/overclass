package kr.co.overclass.persistence;

import java.util.List;

import kr.co.overclass.domain.BanVO;
import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.ReportVO;
import kr.co.overclass.dto.ReportDTO;

public interface AdminDAO {
	public void ban(BanVO vo) throws Exception; //제제하기
	public List<ReportDTO> list(Criteria cri) throws Exception; //신고글 출력
	public void report(ReportVO vo) throws Exception; //신고하기
	public int report_count() throws Exception; //신고글 개수
}
