package kr.co.overclass.persistence;

import java.util.List;

import kr.co.overclass.domain.BanVO;
import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.ReportVO;
import kr.co.overclass.dto.ReportDTO;

public interface AdminDAO {
	public void ban(BanVO vo) throws Exception; //�����ϱ�
	public List<ReportDTO> list(Criteria cri) throws Exception; //�Ű�� ���
	public void report(ReportVO vo) throws Exception; //�Ű��ϱ�
	public int report_count() throws Exception; //�Ű�� ����
}
