package kr.co.overclass.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.PageMaker;
import kr.co.overclass.domain.UserVO;
import kr.co.overclass.dto.DocumentDTO;
import kr.co.overclass.service.FindService;


@Controller
@RequestMapping("/find")
public class FindController {
	private static final Logger logger
    = LoggerFactory.getLogger(FindController.class);
	
	@Inject
	private FindService service;
	
	@RequestMapping(value={"/tagfind","/tagfindpage"},method=RequestMethod.GET)
	public String tagfind(String tag, String page, Model model, HttpServletRequest request) throws Exception {
		String url = request.getServletPath(); //requestMapping url주소값 얻어옴
		System.out.println(tag);
		List<DocumentDTO> list = service.tagFind(tag);
		Criteria cri = new Criteria();
		if ( page != null) {
			cri.setPage(Integer.parseInt(page));
		}
		PageMaker maker = new PageMaker();
		String forward = null;
		maker.setCri(cri);
		maker.setTotalCount(service.tagcnt(tag));
		
		model.addAttribute("taglist",list);
		model.addAttribute("pageMaker", maker);
		return "addfunction/findForm";
	}
	
	@RequestMapping(value={"/friendfind","/friendfindpage"},method=RequestMethod.GET)
	public String friendfind(String friend, String page, Model model, HttpServletRequest request) throws Exception {
		String url = request.getServletPath(); //requestMapping url주소값 얻어옴
		System.out.println(friend);
		List<UserVO> list = service.friendFind(friend);
		Criteria cri = new Criteria();
		if ( page != null) {
			cri.setPage(Integer.parseInt(page));
		}
		PageMaker maker = new PageMaker();
		String forward = null;
		maker.setCri(cri);
		maker.setTotalCount(service.friendcnt(friend));
		
		model.addAttribute("friendlist",list);
		model.addAttribute("pageMaker", maker);
		return "addfunction/findForm";
	}
}
