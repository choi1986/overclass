package kr.co.overclass.service;

import java.util.List;

import kr.co.overclass.domain.MsgVO;

public interface MsgService {
	public void write(MsgVO vo) throws Exception;
	public List<MsgVO> read(String user_id) throws Exception;
	public int count(String user_id) throws Exception;
}
