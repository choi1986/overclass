package kr.co.overclass.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@RequestMapping("/chatting")
	public String test(){
		return "/addfunction/WSmsg";
	}
	
	@RequestMapping(value="",method=RequestMethod.GET)
	public String chat() throws Exception {
		
		
		return "/document/chat";
	}
}
