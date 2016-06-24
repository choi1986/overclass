package kr.co.overclass.persistence;

import java.util.List;
import java.util.Map;

import kr.co.overclass.domain.MsgVO;
import kr.co.overclass.domain.MsgwsVO;
import kr.co.overclass.dto.ChatFriendListDTO;
import kr.co.overclass.dto.MsgDTO;

public interface MsgDAO {
	public void write(MsgwsVO vo) throws Exception;
	public List<MsgDTO> read(String user_id) throws Exception;
	public List<MsgDTO> sitebarDisplay(String user_id) throws Exception;
	public int count(String user_id) throws Exception;
	public List<ChatFriendListDTO> friendList(String user_id) throws Exception;
	public List<MsgDTO> chatList(Map<String, String> map) throws Exception;
}
