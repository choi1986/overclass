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
	public String login () { // login ��������
		return "/member/loginForm2";
	}
	
	@RequestMapping(value="/loginPost", method=RequestMethod.POST) // �α��� ��ư ���� ��
	public String loginPost (LoginDTO dto, HttpSession session, Model model) throws Exception { // �α��� ���� ����
		UserVO vo = service.login(dto); // �α��� �õ��� ���̵�, ����� ���� ������ ������
		if (vo!=null) model.addAttribute("userVO", vo); // �ִٸ� ��(->����)�� ��ü ����.

		/*��Ű����*/
		if(dto.isUseCookie()){//�α��������� üũ�ڽ��� üũ�ߴٸ�
			int amount=60*60*24*7; //�ʴ���
			Date sessionlimit = new Date(System.currentTimeMillis()+(1000*amount));
			service.keepLogin(vo.getUser_id(), session.getId() , sessionlimit);
		}
		
		session.setAttribute("loginFail", "1");
		return "/member/loginForm2"; // �ش� ������ ���ٸ� �α��� ȭ������ ����, �ִٸ� ���ǿ� �α��� ���� �����ϰ� ��������.
	}
	
	@RequestMapping(value="/admin", method=RequestMethod.POST) // ������ ��������
	public String admin () throws Exception {
		return "/admin/adminFeed";
	}
	
	@RequestMapping(value="/dupl", method=RequestMethod.POST) // �α��� ��ư ���� ��
	public String duplicate (JoinDTO dto, HttpSession session, Model model) throws Exception { // �α��� ���� ����
		UserVO vo = service.searchUser(dto.getUser_id());
		if (vo!=null) session.setAttribute("joinDuplCk", vo.getUser_id());
		else  session.setAttribute("joinDuplCk", "");
		session.setAttribute("joinDupl", dto); // �ִٸ� ��(->����)�� ��ü ����.
		return "/member/loginForm2";
	}
	
	@RequestMapping(value="/join") // ȸ�� ���� ��ư ���� ��
	public String join (JoinDTO dto, HttpSession session, Model model) throws Exception { // ȸ�� ���� ȭ������
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
		if (service.createUser(vo)==1) session.setAttribute("joinCk", "1");
		else session.setAttribute("joinCk", "0");
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
	
	@RequestMapping(value="/searchID") // ���̵� ã�� ��ư ���� ��
	public String searchID (SearchIDDTO dto, HttpSession session, Model model) throws Exception { // ȸ�� ���� ȭ������
		String user_id = service.searchID(dto); // �ش� ���̵� �ִٸ� ã�ƿ�
		//�������̵� �ִٸ� �Ʒ� ����, ���ٸ� ���ǿ� ���� �̸����� �ٸ� �� �־ �α��� ������ üũ �� �޽��� ����
		if (user_id==null) session.setAttribute("searchID", "0");
		else session.setAttribute("searchID", user_id);
		
		return "/member/loginForm2";
	}
	
	@RequestMapping(value="/searchPwd") // ��� ã�� ��ư ���� ��
	public String searchPwd (SearchPwdDTO dto, HttpSession session, Model model) throws Exception { // ȸ�� ���� ȭ������
		if (service.searchPwd(dto))
			session.setAttribute("searchPwd", "suc");
		else if (!dto.getUser_pwd().equals(dto.getUser_pwd_confirm()))
			session.setAttribute("searchPwd", "pwdFail");
		else
			session.setAttribute("searchPwd", "fail");
		return "/member/loginForm2";
	}
}
