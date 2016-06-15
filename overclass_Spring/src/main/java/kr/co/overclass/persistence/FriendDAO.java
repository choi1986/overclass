package kr.co.overclass.persistence;

import kr.co.overclass.domain.FriendVO;

public interface FriendDAO {
	public void oc_insert_rel(FriendVO vo) throws Exception;//ģ�� ���� �Է�
	public void oc_delete_rel(FriendVO vo) throws Exception;//ģ�� ���� ����
	public void oc_select_rel(FriendVO vo) throws Exception;//ģ�� ���� �˻�(1��)
	public void oc_insert_req(FriendVO vo) throws Exception;//ģ�� ��û �Է�
	public void oc_delete_req(FriendVO vo) throws Exception;//ģ�� ��û ����
	public void oc_select_req(FriendVO vo) throws Exception;//ģ�� ��û �˻�(1��)
}
