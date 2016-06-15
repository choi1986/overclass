package kr.co.overclass.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.overclass.domain.FriendVO;
import kr.co.overclass.domain.UserVO;
import kr.co.overclass.service.FriendService;


@Controller
@RequestMapping("/friend")
public class FriendController {
	private static final Logger logger = LoggerFactory.getLogger(FriendController.class);
	
	@Inject
	private FriendService service;
	@RequestMapping(value = "/friendfunc")// 친구 요청 입력
	public String friendMain(){
		return "addfunction/friendAdd";
	}
	
	@RequestMapping(value = "/addReq", method=RequestMethod.GET)// 친구 요청 입력
	public String addFriendreq(String info,HttpSession session,Model model) throws Exception{
		logger.info("친구요청 입력.............");
		UserVO user = (UserVO) session.getAttribute("userVO");
		String sender = user.getUser_id();//친구관계 요청 id
		String receiver = info;//친구관계 받는 id
		logger.info("요청아이디: "+sender+", 대상아이디: "+info);
		FriendVO vo = new FriendVO(sender,receiver);
		if(service.insert_req(vo)!=0){
			model.addAttribute("result", "success");//입력 성공하면 result로 success
		}else{
			model.addAttribute("result", "fail");//입력 실패하면 result로 fail
		}
		return "addfunction/friendList";//친구 요청 입력 후 메인 폼으로 돌아간다
	}
	
	@RequestMapping(value = "/deleteReq")// 친구 요청 삭제 
	public String deleteFriendreq(String info,HttpSession session,Model model) throws Exception{// 친구 삭제
		UserVO user = (UserVO) session.getAttribute("userVO");
		String sender = user.getUser_id();//친구관계 요청 id
		String receiver = info;//친구관계 받는 id
		FriendVO vo = new FriendVO(sender,receiver);
		if(service.delete_req(vo)!=0){
			model.addAttribute("result", "success");//삭제 성공하면 result로 success
		}else{
			model.addAttribute("result", "fail");//삭제 실패하면 result로 fail
		}
		return "addfunction/friendList";//친구 요청 입력 후 메인 폼으로 돌아간다
	}
	
	@RequestMapping(value = "/SelectReq")// 친구 요청 검색 
	public String selectFriendreq(String info,HttpSession session,Model model) throws Exception{// 친구 삭제
		UserVO user = (UserVO) session.getAttribute("userVO");
		String sender = user.getUser_id();//친구관계 요청 id
		String receiver = info;//친구관계 받는 id
		FriendVO vo = new FriendVO(sender,receiver);
		List<FriendVO> list = service.select_req_receive(vo);
		model.addAttribute("list", list);
		return "addfunction/friendList";
	}
	
	@RequestMapping(value = "/addRel")// 친구 관계 입력 
	public String addFriendrel(String info,HttpSession session,Model model) throws Exception{
		UserVO user = (UserVO) session.getAttribute("userVO");
		String sender = user.getUser_id();//친구관계 요청 id
		String receiver = info;//친구관계 받는 id
		FriendVO vo = new FriendVO(sender,receiver);
		service.insert_rel(vo);
		service.delete_req(vo);
		return "addfunction/friendList";//친구 요청 입력 후 메인 폼으로 돌아간다 
	}
	
	@RequestMapping(value = "/deleteRel")// 친구 요청 삭제 
	public String deleteFriendrel(String info,HttpSession session,Model model) throws Exception{// 친구 삭제
		UserVO user = (UserVO) session.getAttribute("userVO");
		String sender = user.getUser_id();//친구관계 요청 id
		String receiver = info;//친구관계 받는 id
		FriendVO vo = new FriendVO(sender,receiver);
		service.delete_rel(vo);
		return "addfunction/friendList";//친구 요청 입력 후 메인 폼으로 돌아간다
	}
	
	@RequestMapping(value = "/selectReq")// 친구 요청 검색 
	public String selectFriendrel(String info,HttpSession session,Model model) throws Exception{// 친구 삭제
		UserVO user = (UserVO) session.getAttribute("userVO");
		String sender = user.getUser_id();//친구관계 요청 id
		String receiver = info;//친구관계 받는 id
		FriendVO vo = new FriendVO(sender,receiver);
		service.select_rel(vo);
		return "/addfunction/friendList";
	}
}
