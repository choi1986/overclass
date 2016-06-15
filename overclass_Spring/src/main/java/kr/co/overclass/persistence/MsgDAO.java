package kr.co.overclass.persistence;

import java.util.List;

import kr.co.overclass.domain.MsgVO;

public interface MsgDAO {
	public void write(MsgVO vo) throws Exception;
	public List<MsgVO> read(String user_id) throws Exception;
	public int count(String user_id) throws Exception;
}
