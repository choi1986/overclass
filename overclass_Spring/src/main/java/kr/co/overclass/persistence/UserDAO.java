package kr.co.overclass.persistence;

import kr.co.overclass.domain.UserVO;

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
	public int login (String user_id, String user_pwd) throws Exception;
}
