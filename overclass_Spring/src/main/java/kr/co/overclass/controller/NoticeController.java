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
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.overclass.domain.FriendVO;
import kr.co.overclass.domain.UserVO;
import kr.co.overclass.service.NoticeService;

@Controller
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	private NoticeService service;
	
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public String noticeMain() throws Exception{
		return "/addfunction/notice";
	};
	
	@RequestMapping(value="/notice/req", method=RequestMethod.GET)
	public String recvReqNotice(String user_id,Model model) throws Exception{
		logger.info(user_id+" 模备夸没 格废");
		List<FriendVO> list = service.receiveReqNotice(user_id);
		int countReq = service.countReq(user_id);
		model.addAttribute("reqlist", list);
		model.addAttribute("countReq",countReq);
		logger.info("模备夸没 荐"+countReq);
		return "/addfunction/notice";
	}
	@RequestMapping("/notice/reqCount")
	public void reqCount(Model model,HttpSession session) throws Exception{
		UserVO user = (UserVO)session.getAttribute("login");
		String user_id = user.getUser_id();
		model.addAttribute("reqCount", service.countReq(user_id));
	}
}
