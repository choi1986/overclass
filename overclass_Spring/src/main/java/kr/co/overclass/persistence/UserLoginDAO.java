package kr.co.overclass.persistence;

public interface UserLoginDAO {
	// �α��� �˻�
	public String searchUserLogin (String user_id) throws Exception;
	// �α��� �߰�
	public void createUserLogin (String user_id) throws Exception;
	// �α׾ƿ�
	public void deleteUserLogin (String user_id) throws Exception;
}
