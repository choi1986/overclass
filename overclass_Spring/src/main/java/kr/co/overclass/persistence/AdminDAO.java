package kr.co.overclass.persistence;

import java.util.List;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.ReportVO;
import kr.co.overclass.dto.ReportDTO;

public interface AdminDAO {
	public List<ReportDTO> list(Criteria cri) throws Exception; //�Ű�� ���
	public void report(ReportVO vo) throws Exception; //�Ű��ϱ�
	public int report_count() throws Exception; //�Ű�� ����
	public void banDoc(int reprotno) throws Exception; //�����ϱ�
	public void report_del(int reportno) throws Exception; //�����ϰ� �ۻ���
	public List<ReportDTO> ban_list() throws Exception; //�������
	public int report_stack(String writer) throws Exception;
	public int report_sel(ReportVO vo) throws Exception;
}
