package kr.co.overclass.service;

import kr.co.overclass.domain.FriendVO;

public interface FriendService {
	public void insert_rel(FriendVO vo) throws Exception;//ģ�� ���� �Է�
	public void delete_rel(FriendVO vo) throws Exception;//ģ�� ���� ����
	public void select_rel(FriendVO vo) throws Exception;//ģ�� ���� �˻�(1��)
	public void insert_req(FriendVO vo) throws Exception;//ģ�� ��û �Է�
	public void delete_req(FriendVO vo) throws Exception;//ģ�� ��û ����
	public void select_req(FriendVO vo) throws Exception;//ģ�� ��û �˻�(1��
}
