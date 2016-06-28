package kr.co.overclass.controller;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import kr.co.overclass.domain.UserVO;
import kr.co.overclass.dto.JoinDTO;
import kr.co.overclass.dto.LoginDTO;
import kr.co.overclass.dto.ReportDTO;
import kr.co.overclass.dto.SearchIDDTO;
import kr.co.overclass.dto.SearchPwdDTO;
import kr.co.overclass.egovframework.EgovHttpSessionBindingListener;
import kr.co.overclass.service.AdminService;
import kr.co.overclass.service.UserService;

@Controller
@RequestMapping("/")
public class UserController {
	
	@Inject
	private UserService service;
	
	@Inject
	private AdminService adminService;

	@RequestMapping(value="/")
	public String login (HttpSession session) throws Exception { // login ��������
		UserVO vo = (UserVO)session.getAttribute("login");
		if(vo!=null) {
			session.removeAttribute("login");
		}
		return "/member/loginForm2";
	}
	
	@RequestMapping(value="/loginPost", method=RequestMethod.POST) // �α��� ��ư ���� ��
	public String loginPost (LoginDTO dto, HttpServletRequest request, HttpSession session, Model model) throws Exception { // �α��� ���� ����
		UserVO vo = service.login(dto); // �α��� �õ��� ���̵�, ����� ���� ������ ������
		if (vo!=null) {
			List<ReportDTO> reportDTO = adminService.ban_list();
			for (int i=0; i<reportDTO.size(); i++) {
				if (reportDTO.get(i).getWriter().equals(dto.getUser_id())) {
					session.setAttribute("loginFail", "3");
					return "/member/loginForm2";
				}
			}
			model.addAttribute("userVO", vo); // �ִٸ� ��(->����)�� ��ü ����.
			EgovHttpSessionBindingListener listener = new EgovHttpSessionBindingListener();
			request.getSession().setAttribute(vo.getUser_id(), listener);
		}

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
	public String duplicate (JoinDTO dto, RedirectAttributes attr, HttpSession session, Model model) throws Exception { // �α��� ���� ����
		if (dto.getUser_id()=="") session.setAttribute("joinDuplCk", dto.getUser_id());
		else {
			UserVO vo = service.searchUser(dto.getUser_id());
			if (vo!=null) session.setAttribute("joinDuplCk", vo.getUser_id());
			else  session.setAttribute("joinDuplCk", "");
		}
		session.setAttribute("joinDupl", dto); // �ִٸ� ��(->����)�� ��ü ����.
		return "redirect:/";
	}
	
	@RequestMapping(value="/join") // ȸ�� ���� ��ư ���� ��
	public String join (JoinDTO dto, RedirectAttributes attr, HttpSession session, Model model) throws Exception { // ȸ�� ���� ȭ������
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
		return "redirect:/";
	}
	
	@RequestMapping(value="/main/modifyUser") // ������ ���� ��ư ���� ��
	public String modify (JoinDTO dto, RedirectAttributes attr, HttpSession session, Model model) throws Exception {
		UserVO vo = new UserVO();
		vo.setUser_id(dto.getUser_id());
		vo.setUser_pwd(dto.getUser_pwd());
		vo.setUser_email(dto.getUser_email());
		vo.setUser_tel(dto.getUser_tel1()+"-"+dto.getUser_tel2()+"-"+dto.getUser_tel3());
		vo.setUser_loc(dto.getUser_loc());
		vo.setUser_hobby1(dto.getUser_hobby1());
		vo.setUser_hobby2(dto.getUser_hobby2());
		vo.setUser_pwdq(dto.getUser_pwdq());
		vo.setUser_pwda(dto.getUser_pwda());
		service.updateUser(vo);
		vo = service.searchUser(dto.getUser_id());
		session.setAttribute("login", vo);
		return "redirect:/main/myFeed";
	}
	
	@RequestMapping(value="/main/leave") // ������ ���� ��ư ���� ��
	public String leave (String user_id, RedirectAttributes attr, HttpServletRequest request) throws Exception {
		service.deleteUser(user_id);
		request.getSession().invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout (HttpServletRequest request, RedirectAttributes attr, HttpServletResponse response, HttpSession session) throws Exception {
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
		return "redirect:/";
	}
	
	@RequestMapping(value="/searchID") // ���̵� ã�� ��ư ���� ��
	public String searchID (SearchIDDTO dto, RedirectAttributes attr, HttpSession session, Model model) throws Exception { // ȸ�� ���� ȭ������
		String user_id = service.searchID(dto); // �ش� ���̵� �ִٸ� ã�ƿ�
		//�������̵� �ִٸ� �Ʒ� ����, ���ٸ� ���ǿ� ���� �̸����� �ٸ� �� �־ �α��� ������ üũ �� �޽��� ����
		if (user_id==null) {
			session.setAttribute("searchID", "0");
			session.setAttribute("searchIDInfo", dto);
		}
		else session.setAttribute("searchID", user_id);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/searchPwd") // ��� ã�� ��ư ���� ��
	public String searchPwd (SearchPwdDTO dto, RedirectAttributes attr, HttpSession session, Model model) throws Exception { // ȸ�� ���� ȭ������
		if (service.searchPwd(dto))
			session.setAttribute("searchPwd", "suc");
		else if (!dto.getUser_pwd().equals(dto.getUser_pwd_confirm())) {
			session.setAttribute("searchPwd", "pwdFail");
			session.setAttribute("searchPwdInfo", dto);
		}
		else {
			session.setAttribute("searchPwd", "fail");
			session.setAttribute("searchPwdInfo", dto);
		}
		return "redirect:/";
	}
}
