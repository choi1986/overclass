package kr.co.overclass.persistence;

import java.util.Date;

import kr.co.overclass.domain.UserVO;
import kr.co.overclass.dto.LoginDTO;

public interface UserDAO {
	// ȸ�� �˻�
	public UserVO searchUser (String user_id) throws Exception;
	// ȸ�� ����
	public void createUser (UserVO user) throws Exception;
	// ȸ�� ��������
	public void updateUser (UserVO user) throws Exception;
	// ȸ�� �̹�������
	public void updateUserImg (String user_image) throws Exception;
	// ȸ�� Ż��
	public void deleteUser (String user_id) throws Exception;
	// �α���
	public UserVO login (LoginDTO dto) throws Exception;
	// �α����� ������� sessionKey, sessionLimit ����
	public void keepLogin(String user_id, String session_id, Date next) throws Exception;
	// loginCookie�� ��ϵ� ������ �������� ���� ��ȸ
	public UserVO checkUserWithSessionKey (String value) throws Exception;
}
