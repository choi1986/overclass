package kr.co.overclass.persistence;

import java.util.List;

import kr.co.overclass.domain.FriendVO;

//���ƿ� �˸�, ģ����û���� �˸�, ���� �˸�, ��۾˸�
public interface NoticeDAO {
	public List<FriendVO> receiveReqNotice(String user_id)throws Exception;//ģ����û�� ���̵� Ȯ��
	public int countReq(String user_id) throws Exception;//ģ����û ��
}
