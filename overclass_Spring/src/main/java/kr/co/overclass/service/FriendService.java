package kr.co.overclass.service;

import kr.co.overclass.domain.FriendVO;

public interface FriendService {
	public void insert_rel(FriendVO vo) throws Exception;//模备 包拌 涝仿
	public void delete_rel(FriendVO vo) throws Exception;//模备 包拌 昏力
	public void select_rel(FriendVO vo) throws Exception;//模备 包拌 八祸(1疙)
	public void insert_req(FriendVO vo) throws Exception;//模备 夸没 涝仿
	public void delete_req(FriendVO vo) throws Exception;//模备 夸没 昏力
	public void select_req(FriendVO vo) throws Exception;//模备 夸没 八祸(1疙
}
