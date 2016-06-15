package kr.co.overclass.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.overclass.domain.FriendVO;
import kr.co.overclass.domain.UserVO;
import kr.co.overclass.service.FriendService;


@Controller
@RequestMapping("/friend")
public class FriendController {
	private static final Logger logger = LoggerFactory.getLogger(FriendController.class);
	
	@Inject
	private FriendService service;
	
	@RequestMapping(value = "/addReq")// ģ�� ��û �Է�
	public String addFriendreq(String info,HttpSession session,Model model) throws Exception{
		UserVO user = (UserVO) session.getAttribute("userVO");
		String sender = user.getUser_id();//ģ������ ��û id
		System.out.println("sender" + sender);
		String receiver = info;//ģ������ �޴� id
		FriendVO vo = new FriendVO(sender,receiver);
		service.insert_req(vo);
		return "addfunction/friendList";//ģ�� ��û �Է� �� ���� ������ ���ư���
	}
	
	@RequestMapping(value = "/deleteReq")// ģ�� ��û ���� 
	public String deleteFriendreq(String info,HttpSession session,Model model) throws Exception{// ģ�� ����
		UserVO user = (UserVO) session.getAttribute("userVO");
		String sender = user.getUser_id();//ģ������ ��û id
		String receiver = info;//ģ������ �޴� id
		FriendVO vo = new FriendVO(sender,receiver);
		service.delete_req(vo);
		return "";//ģ�� ��û �Է� �� ���� ������ ���ư���
	}
	
	@RequestMapping(value = "/SelectReq")// ģ�� ��û �˻� 
	public String selectFriendreq(String info,HttpSession session,Model model) throws Exception{// ģ�� ����
		UserVO user = (UserVO) session.getAttribute("userVO");
		String sender = user.getUser_id();//ģ������ ��û id
		String receiver = info;//ģ������ �޴� id
		FriendVO vo = new FriendVO(sender,receiver);
		service.select_req(vo);
		return "";
	}
	
	@RequestMapping(value = "/addRel")// ģ�� ���� �Է� 
	public String addFriendrel(String info,HttpSession session,Model model) throws Exception{
		UserVO user = (UserVO) session.getAttribute("userVO");
		String sender = user.getUser_id();//ģ������ ��û id
		String receiver = info;//ģ������ �޴� id
		FriendVO vo = new FriendVO(sender,receiver);
		service.insert_rel(vo);
		service.delete_req(vo);
		return "";//ģ�� ��û �Է� �� ���� ������ ���ư��� 
	}
	
	@RequestMapping(value = "/deleteRel")// ģ�� ��û ���� 
	public String deleteFriendrel(String info,HttpSession session,Model model) throws Exception{// ģ�� ����
		UserVO user = (UserVO) session.getAttribute("userVO");
		String sender = user.getUser_id();//ģ������ ��û id
		String receiver = info;//ģ������ �޴� id
		FriendVO vo = new FriendVO(sender,receiver);
		service.delete_rel(vo);
		return "";//ģ�� ��û �Է� �� ���� ������ ���ư���
	}
	
	@RequestMapping(value = "/selectReq")// ģ�� ��û �˻� 
	public String selectFriendrel(String info,HttpSession session,Model model) throws Exception{// ģ�� ����
		UserVO user = (UserVO) session.getAttribute("userVO");
		String sender = user.getUser_id();//ģ������ ��û id
		String receiver = info;//ģ������ �޴� id
		FriendVO vo = new FriendVO(sender,receiver);
		service.select_rel(vo);
		return "/addfunction/friendList";
	}
}
