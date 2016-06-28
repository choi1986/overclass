package kr.co.overclass.service;

import java.util.List;

import kr.co.overclass.domain.FriendVO;

public interface FriendService {
	public int insert_rel(FriendVO vo) throws Exception;//模备 包拌 涝仿
	public int delete_rel(FriendVO vo) throws Exception;//模备 包拌 昏力
	public List<FriendVO> select_rel(String user_id) throws Exception;//模备 包拌 八祸(1疙)
	public int insert_req(FriendVO vo) throws Exception;//模备 夸没 涝仿
	public int delete_req(FriendVO vo) throws Exception;//模备 夸没 昏力
	public List<FriendVO> select_req_all(FriendVO vo) throws Exception;//模备 夸没 八祸(1疙
	public List<FriendVO> select_req_send(FriendVO vo) throws Exception;//模备 夸没 八祸(1疙)
	public List<FriendVO> select_req_receive(String receiver) throws Exception;//唱茄怕柯 模备夸没 八祸
	public int findReq(FriendVO vo) throws Exception;
	public int findRel(FriendVO vo) throws Exception;
}
