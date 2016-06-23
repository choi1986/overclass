package kr.co.overclass.persistence;

import java.util.List;

import kr.co.overclass.domain.FriendVO;

public interface FriendDAO {
	public int oc_insert_rel(FriendVO vo) throws Exception;//模备 包拌 涝仿
	public int oc_delete_rel(FriendVO vo) throws Exception;//模备 包拌 昏力
	public List<FriendVO> oc_select_rel(String user_id) throws Exception;//模备 包拌 八祸(1疙)
	public int oc_insert_req(FriendVO vo) throws Exception;//模备 夸没 涝仿
	public int oc_delete_req(FriendVO vo) throws Exception;//模备 夸没 昏力
	public FriendVO oc_select_req_all(FriendVO vo) throws Exception;//模备 夸没 八祸(1疙)
	public List<FriendVO> oc_select_req_send(FriendVO vo) throws Exception;//模备 夸没 八祸(1疙)
	public List<FriendVO> oc_select_req_receive(FriendVO vo) throws Exception;//模备 夸没 八祸(1疙)
}
