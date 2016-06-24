package kr.co.overclass.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.overclass.domain.UserVO;
import kr.co.overclass.dto.ChatFriendListDTO;
import kr.co.overclass.service.MsgService;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@Inject
	private MsgService service;
	
	@RequestMapping("/chatting")
	public String test(){
		return "/addfunction/WSmsg";
	}
	
	@RequestMapping(value="",method=RequestMethod.GET)
	public String chat(HttpSession session, Model model, String sender) throws Exception {
		logger.info("GET");
		UserVO user = (UserVO)session.getAttribute("login");
		List<ChatFriendListDTO> friendlist = service.friendList(user.getUser_id());
		model.addAttribute("friendlist",friendlist);
		model.addAttribute("targetuser",sender);
		return "/document/chat";
	}
}
