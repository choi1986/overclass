package kr.co.overclass.service;

import java.util.List;

import kr.co.overclass.domain.FriendVO;

//���ƿ� �˸�, ģ����û���� �˸�, ģ������ �˸�, ���� �˸�, ��۾˸�
public interface NoticeService {
	public List<FriendVO> receiveReqNotice(String user_id)throws Exception;//ģ����û�� ���̵� Ȯ��
	public int countReq(String user_id) throws Exception;//ģ����û ��
}
