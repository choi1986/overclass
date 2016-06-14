package kr.co.overclass.persistence;

import java.util.Date;

import kr.co.overclass.domain.UserVO;
import kr.co.overclass.dto.LoginDTO;
import kr.co.overclass.dto.SearchIDDTO;
import kr.co.overclass.dto.SearchPwdDTO;

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
	public UserVO login (LoginDTO dto) throws Exception;
	// 로그인한 사용자의 sessionKey, sessionLimit 저장
	public void keepLogin(String user_id, String session_id, Date next) throws Exception;
	// loginCookie에 기록된 값으로 가용자의 정보 조회
	public UserVO checkUserWithSessionKey (String value) throws Exception;
	// 아이디 찾기
	public String searchID (SearchIDDTO dto) throws Exception;
	// 비밀번호 찾기
	public boolean searchPwd (SearchPwdDTO dto) throws Exception;
}
