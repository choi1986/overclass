package kr.co.overclass.persistence;

import kr.co.overclass.domain.FriendVO;

public interface FriendDAO {
	public void friend_rel_insert(FriendVO vo) throws Exception;//模备 包拌 涝仿
	public void friend_rel_delete(FriendVO vo) throws Exception;//模备 包拌 昏力
	public void friend_rel_select(FriendVO vo) throws Exception;//模备 包拌 八祸(1疙)
	public void friend_req_insert(FriendVO vo) throws Exception;//模备 夸没 涝仿
	public void friend_req_delete(FriendVO vo) throws Exception;//模备 夸没 昏力
	public void friend_req_select(FriendVO vo) throws Exception;//模备 夸没 八祸(1疙)
}
