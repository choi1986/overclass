package kr.co.overclass.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.overclass.domain.UserVO;
import kr.co.overclass.dto.LoginDTO;
import kr.co.overclass.service.UserService;

@Controller
@RequestMapping("/")
public class UserController {
	
	@Inject
	private UserService service;

	@RequestMapping(value="/main")
	public String mainPage () { // main������(�α��� ������)
		return "/member/loginForm2";
	}
	
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public String login (LoginDTO dto, HttpSession session, Model model) throws Exception { // �α��� ���� ����
		UserVO vo = service.login(dto); // �α��� �õ��� ���̵�, ����� ���� ������ ������
		if (vo!=null) model.addAttribute("userVO", vo); // �ִٸ� ��(->����)�� ��ü ����.
		return "/member/loginForm2"; // �ش� ������ ���ٸ� �α��� ȭ������ ����, �ִٸ� ���ǿ� �α��� ���� ����.
	}
	
	@RequestMapping(value="/join")
	public String join () { // ȸ�� ���� ȭ������
		return "/member/join";
	}
}
