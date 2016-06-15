package kr.co.overclass.persistence;

import kr.co.overclass.domain.FriendVO;

public interface FriendDAO {
	public void oc_insert_rel(FriendVO vo) throws Exception;//模备 包拌 涝仿
	public void oc_delete_rel(FriendVO vo) throws Exception;//模备 包拌 昏力
	public void oc_select_rel(FriendVO vo) throws Exception;//模备 包拌 八祸(1疙)
	public void oc_insert_req(FriendVO vo) throws Exception;//模备 夸没 涝仿
	public void oc_delete_req(FriendVO vo) throws Exception;//模备 夸没 昏力
	public void oc_select_req(FriendVO vo) throws Exception;//模备 夸没 八祸(1疙)
}
