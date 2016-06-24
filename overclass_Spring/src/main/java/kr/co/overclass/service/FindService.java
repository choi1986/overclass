package kr.co.overclass.service;

import java.util.List;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.ReportVO;
import kr.co.overclass.dto.DocumentDTO;
import kr.co.overclass.dto.ReportDTO;

public interface FindService {
	public List<DocumentDTO> tagFind(String tag) throws Exception;
	public int tagcnt(String tag) throws Exception;
}
