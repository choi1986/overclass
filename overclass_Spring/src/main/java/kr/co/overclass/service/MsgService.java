package kr.co.overclass.service;

import java.util.List;

import kr.co.overclass.domain.MsgVO;
import kr.co.overclass.dto.MsgDTO;

public interface MsgService {
	public void write(MsgVO vo) throws Exception;
	public List<MsgDTO> read(String user_id) throws Exception;
	public List<MsgDTO> sitebarDisplay(String user_id) throws Exception;
	public int count(String user_id) throws Exception;
}
