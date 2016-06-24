package kr.co.overclass.persistence;

import java.util.List;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.ReportVO;
import kr.co.overclass.dto.DocumentDTO;
import kr.co.overclass.dto.ReportDTO;

public interface FindDAO {
	public List<DocumentDTO> tagFind(String tag) throws Exception;
	public int tagcnt(String tag) throws Exception;
}
