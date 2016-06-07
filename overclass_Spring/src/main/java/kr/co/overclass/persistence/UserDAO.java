package kr.co.overclass.persistence;

import kr.co.overclass.domain.UserVO;

public interface UserDAO {
	// 회원 검색
	public UserVO searchUser (String user_id) throws Exception;
	// 회원 가입
	public void createUser (UserVO user) throws Exception;
	// 회원 정보수정
	public void updateUser (UserVO user) throws Exception;
	// 회원 이미지수정
	public void updateUserImg (String user_image) throws Exception;
	// 회원 탈퇴
	public void deleteUser (String user_id) throws Exception;
	// 로그인
	public int login (String user_id, String user_pwd) throws Exception;
}
