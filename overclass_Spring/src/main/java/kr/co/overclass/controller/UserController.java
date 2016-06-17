package kr.co.overclass.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import kr.co.overclass.domain.UserVO;
import kr.co.overclass.dto.JoinDTO;
import kr.co.overclass.dto.LoginDTO;
import kr.co.overclass.dto.SearchIDDTO;
import kr.co.overclass.dto.SearchPwdDTO;
import kr.co.overclass.service.UserService;

@Controller
@RequestMapping("/")
public class UserController {
	
	@Inject
	private UserService service;

	@RequestMapping(value="/")
	public String login () { // login 페이지로
		return "/member/loginForm2";
	}
	
	@RequestMapping(value="/loginPost", method=RequestMethod.POST) // 로그인 버튼 눌린 후
	public String loginPost (LoginDTO dto, HttpSession session, Model model) throws Exception { // 로그인 정보 전송
		UserVO vo = service.login(dto); // 로그인 시도한 아이디, 비번의 유저 정보를 가져옴
		if (vo!=null) model.addAttribute("userVO", vo); // 있다면 모델(->세션)에 객체 저장.

		/*쿠키정의*/
		if(dto.isUseCookie()){//로그인폼에서 체크박스를 체크했다면
			int amount=60*60*24*7; //초단위
			Date sessionlimit = new Date(System.currentTimeMillis()+(1000*amount));
			service.keepLogin(vo.getUser_id(), session.getId() , sessionlimit);
		}
		
		return "/member/loginForm2"; // 해당 유저가 없다면 로그인 화면으로 리턴, 있다면 세션에 로그인 정보 저장하고 메인으로.
	}
	
	@RequestMapping(value="/admin", method=RequestMethod.POST) // 관리자 페이지로
	public String admin () throws Exception {
		return "/admin/adminFeed";
	}
	
	@RequestMapping(value="/dupl", method=RequestMethod.POST) // 로그인 버튼 눌린 후
	public String duplicate (JoinDTO dto, HttpSession session, Model model) throws Exception { // 로그인 정보 전송
		UserVO vo = service.searchUser(dto.getUser_id());
		if (vo!=null) session.setAttribute("joinDuplCk", vo.getUser_id());
		else  session.setAttribute("joinDuplCk", "");
		session.setAttribute("joinDupl", dto); // 있다면 모델(->세션)에 객체 저장.
		return "/member/loginForm2";
	}
	
	@RequestMapping(value="/join") // 회원 가입 버튼 눌린 후
	public String join (JoinDTO dto, HttpSession session, Model model) throws Exception { // 회원 가입 화면으로
		UserVO vo = new UserVO();
		vo.setUser_id(dto.getUser_id());
		vo.setUser_pwd(dto.getUser_pwd());
		vo.setUser_name(dto.getUser_name());
		vo.setUser_email(dto.getUser_email());
		vo.setUser_tel(dto.getUser_tel1()+"-"+dto.getUser_tel2()+"-"+dto.getUser_tel3());
		vo.setUser_loc(dto.getUser_loc());
		vo.setUser_hobby1(dto.getUser_hobby1());
		vo.setUser_hobby2(dto.getUser_hobby2());
		vo.setUser_birth(dto.getUser_birth());
		vo.setUser_gender(dto.getRadio());
		vo.setUser_pwdq(dto.getUser_pwdq());
		vo.setUser_pwda(dto.getUser_pwda());
		service.createUser(vo);
		return "/member/loginForm2";
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout (HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		Object obj = session.getAttribute("login");
		
		if (obj!=null) {
			UserVO vo = (UserVO) obj;
			
			session.removeAttribute("login");
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(vo.getUser_id(), session.getId(), new Date());
			}
		}
		return "/member/loginForm2";
	}
	
	@RequestMapping(value="/searchID") // 아이디 찾기 버튼 눌린 후
	public String searchID (SearchIDDTO dto, HttpSession session, Model model) throws Exception { // 회원 가입 화면으로
		String user_id = service.searchID(dto); // 해당 아이디가 있다면 찾아옴
		//유저아이디 있다면 아래 문장, 없다면 세션에 같은 이름으로 다른 값 넣어서 로그인 폼에서 체크 후 메시지 띄우기
		if (user_id==null) session.setAttribute("searchID", "0");
		else session.setAttribute("searchID", user_id);
		
		return "/member/loginForm2";
	}
	
	@RequestMapping(value="/searchPwd") // 비번 찾기 버튼 눌린 후
	public String searchPwd (SearchPwdDTO dto, HttpSession session, Model model) throws Exception { // 회원 가입 화면으로
		if (service.searchPwd(dto))
			session.setAttribute("searchPwd", "suc");
		else if (!dto.getUser_pwd().equals(dto.getUser_pwd_confirm()))
			session.setAttribute("searchPwd", "pwdFail");
		else
			session.setAttribute("searchPwd", "fail");
		return "/member/loginForm2";
	}
}
