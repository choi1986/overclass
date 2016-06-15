package kr.co.overclass.service;

import java.util.List;

import kr.co.overclass.domain.BanVO;
import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.ReportVO;

public interface AdminService {
	public void ban(BanVO vo) throws Exception; //�����ϱ�
	public List<ReportVO>list(Criteria cri, String writer) throws Exception; //�Ű�� ���
	public void report(ReportVO vo) throws Exception;
	public int report_count(String writer) throws Exception;
}
