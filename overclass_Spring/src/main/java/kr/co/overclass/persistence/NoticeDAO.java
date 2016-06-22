package kr.co.overclass.persistence;

import java.util.List;

import kr.co.overclass.domain.DocumentVO;
import kr.co.overclass.domain.FriendVO;
import kr.co.overclass.domain.GoodVO;
import kr.co.overclass.dto.GoodNoticeDTO;

//���ƿ� �˸�, ���ƿ� �˸�, ģ����û���� �˸�, ģ����û���� �˸�, ģ������ �˸�, ���� �˸�, ��۾˸�
public interface NoticeDAO {
	public List<GoodVO> goodNotice(int dno)throws Exception;//���ƿ��� ���̵�,�� Ȯ��
	public List<FriendVO> sendReqNotice()throws Exception;//ģ����û �����̵� Ȯ��
	public List<FriendVO> receiveReqNotice()throws Exception;//ģ����û�� ���̵� Ȯ��
	public List<FriendVO> submitReqNotice()throws Exception;//ģ������ Ȯ��
	public List<DocumentVO> newDocNotice()throws Exception;//����Ȯ��
	public List<GoodNoticeDTO> newRepNotice()throws Exception;//���Ȯ��
}
