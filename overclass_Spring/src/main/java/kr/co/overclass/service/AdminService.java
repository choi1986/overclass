package kr.co.overclass.service;

import java.util.List;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.ReportVO;
import kr.co.overclass.dto.ReportDTO;

public interface AdminService {
	public List<ReportDTO> list(Criteria cri) throws Exception; //신고글 출력
	public void report(ReportVO vo) throws Exception; //신고하기
	public int report_count() throws Exception; //신고글 개수
	public void banDoc(int reportno) throws Exception; //제제하기
	public void banDoc_del(int reportno) throws Exception; //제제하고 글삭제
	public void report_del(int reportno) throws Exception; //제제하고 글삭제
	public List<ReportDTO> ban_list() throws Exception; //제제목록 출력
	public int report_sel(ReportVO vo) throws Exception;
}
