package kr.co.overclass.service;

import java.util.List;

import kr.co.overclass.domain.FriendVO;

public interface FriendService {
	public int insert_rel(FriendVO vo) throws Exception;//ģ�� ���� �Է�
	public int delete_rel(FriendVO vo) throws Exception;//ģ�� ���� ����
	public List<FriendVO> select_rel(String user_id) throws Exception;//ģ�� ���� �˻�(1��)
	public int insert_req(FriendVO vo) throws Exception;//ģ�� ��û �Է�
	public int delete_req(FriendVO vo) throws Exception;//ģ�� ��û ����
	public List<FriendVO> select_req_all(FriendVO vo) throws Exception;//ģ�� ��û �˻�(1��
	public List<FriendVO> select_req_send(FriendVO vo) throws Exception;//ģ�� ��û �˻�(1��)
	public List<FriendVO> select_req_receive(String receiver) throws Exception;//�����¿� ģ����û �˻�
	public int findReq(FriendVO vo) throws Exception;
	public int findRel(FriendVO vo) throws Exception;
}
