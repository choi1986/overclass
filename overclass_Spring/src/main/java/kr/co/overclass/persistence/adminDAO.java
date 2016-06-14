package kr.co.overclass.persistence;

import java.util.List;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.dto.BanVO;
import kr.co.overclass.dto.ReportVO;

public interface adminDAO {
	public void ban(BanVO vo) throws Exception; //�����ϱ�
	public List<ReportVO>list(Criteria cri, String writer) throws Exception; //�Ű�� ���
	public int report_count(String writer) throws Exception;
}
