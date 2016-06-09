package kr.co.overclass.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.overclass.domain.UserVO;
import kr.co.overclass.dto.JoinDTO;
import kr.co.overclass.dto.LoginDTO;
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
		return "/member/loginForm2"; // 해당 유저가 없다면 로그인 화면으로 리턴, 있다면 세션에 로그인 정보 저장하고 메인으로.
	}
	
	@RequestMapping(value="/dupl", method=RequestMethod.POST) // 로그인 버튼 눌린 후
	public void duplicate (LoginDTO dto, HttpSession session, Model model) throws Exception { // 로그인 정보 전송
		System.out.println("컨트롤러 듀플"+dto.getUser_id());
		return;
	}
	
	@RequestMapping(value="/join") // 회원 가입 버튼 눌린 후
	public String join (JoinDTO dto, HttpSession session, Model model) throws Exception { // 회원 가입 화면으로
		System.out.println(dto.toString());
		System.out.println("-----------------------");
		UserVO vo = new UserVO();
		vo.setUser_id(dto.getUser_id());
		vo.setUser_pwd(dto.getUser_pwd());
		if(!dto.getUser_pwd().equals(dto.getUser_pwd_confirm()))
			vo.setUser_pwd("0");
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
		System.out.println(vo.toString());
		service.createUser(vo);
		return "/member/loginForm2";
	}
}
