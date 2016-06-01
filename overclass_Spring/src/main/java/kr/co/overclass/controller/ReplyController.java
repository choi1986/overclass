package kr.co.overclass.controller;

import javax.inject.Inject;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.overclass.domain.ReplyVO;
import kr.co.overclass.service.ReplyService;

@Controller
@RequestMapping("value=/reply")
public class ReplyController {
	
	@Inject
	private ReplyService service;
	
	@RequestMapping(value="/reply/list", method=RequestMethod.GET)
	public String replyList(Model model, int dno) throws Exception {
		model.addAttribute("replyList",service.listReply(dno));
		return "/";
	}
	
	@RequestMapping(value="/reply/write", method=RequestMethod.POST)
	public String replyWrite(ReplyVO vo) throws Exception {
		service.addReply(vo);
		
		return "/";
	}
	
	@RequestMapping(value="/reply/delete", method=RequestMethod.GET)
	public String replyRemove(int rno) throws Exception {
		service.removeReply(rno);
		return "/";
	}
}
