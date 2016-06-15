package kr.co.overclass.persistence;

import kr.co.overclass.domain.FriendVO;

public interface FriendDAO {
	public void friend_rel_insert(FriendVO vo) throws Exception;//ģ�� ���� �Է�
	public void friend_rel_delete(FriendVO vo) throws Exception;//ģ�� ���� ����
	public void friend_rel_select(FriendVO vo) throws Exception;//ģ�� ���� �˻�(1��)
	public void friend_req_insert(FriendVO vo) throws Exception;//ģ�� ��û �Է�
	public void friend_req_delete(FriendVO vo) throws Exception;//ģ�� ��û ����
	public void friend_req_select(FriendVO vo) throws Exception;//ģ�� ��û �˻�(1��)
}
