package kr.co.overclass.persistence;

public interface UserLoginDAO {
	// 로그인 검색
	public String searchUserLogin (String user_id) throws Exception;
	// 로그인 추가
	public void createUserLogin (String user_id) throws Exception;
	// 로그아웃
	public void deleteUserLogin (String user_id) throws Exception;
}
