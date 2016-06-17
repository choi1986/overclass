package kr.co.overclass.persistence;

import java.util.List;

import kr.co.overclass.domain.BanVO;
import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.ReportVO;
import kr.co.overclass.dto.ReportDTO;

public interface AdminDAO {
	public List<ReportDTO> list(Criteria cri) throws Exception; //신고글 출력d
	public void report(ReportVO vo) throws Exception; //신고하기
	public int report_count() throws Exception; //신고글 개수
	public void banDoc(int reprotno) throws Exception; //제제하기
	public void report_del(int reportno) throws Exception; //제제하고 글삭제
}
