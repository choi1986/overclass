package kr.co.overclass.persistence;

import java.util.List;

import kr.co.overclass.domain.FriendVO;

public interface FriendDAO {
	public int oc_insert_rel(FriendVO vo) throws Exception;//ģ�� ���� �Է�
	public int oc_delete_rel(FriendVO vo) throws Exception;//ģ�� ���� ����
	public List<FriendVO> oc_select_rel(String user_id) throws Exception;//ģ�� ���� �˻�(1��)
	public int oc_insert_req(FriendVO vo) throws Exception;//ģ�� ��û �Է�
	public int oc_delete_req(FriendVO vo) throws Exception;//ģ�� ��û ����
	public FriendVO oc_select_req_all(FriendVO vo) throws Exception;//ģ�� ��û �˻�(1��)
	public List<FriendVO> oc_select_req_send(FriendVO vo) throws Exception;//ģ�� ��û �˻�(1��)
	public List<FriendVO> oc_select_req_receive(FriendVO vo) throws Exception;//ģ�� ��û �˻�(1��)
}
