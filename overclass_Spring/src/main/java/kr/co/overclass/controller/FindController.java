package kr.co.overclass.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.FriendVO;
import kr.co.overclass.domain.PageMaker;
import kr.co.overclass.domain.UserVO;
import kr.co.overclass.dto.DocumentDTO;
import kr.co.overclass.service.FindService;
import kr.co.overclass.service.FriendService;


@Controller
@RequestMapping("/find")
public class FindController {
	private static final Logger logger
    = LoggerFactory.getLogger(FindController.class);
	
	@Inject
	private FindService service;
	
	@Inject
	private FriendService friendService;
	
	//태그검색
	@RequestMapping(value={"/tagfind","/tagfindpage"},method=RequestMethod.GET)
	public String tagfind(String tag, String page, Model model, HttpServletRequest request) throws Exception {
		String url = request.getServletPath(); //requestMapping url주소값 얻어옴
		UserVO vo = (UserVO) request.getSession().getAttribute("login");
		List<DocumentDTO> list = service.tagFind(tag);
		Criteria cri = new Criteria();
		if ( page != null) {
			cri.setPage(Integer.parseInt(page));
		}
		PageMaker maker = new PageMaker();
		String forward = null;
		maker.setCri(cri);
		maker.setTotalCount(service.tagcnt(tag));
		
		model.addAttribute("user",vo);
		model.addAttribute("taglist",list);
		model.addAttribute("pageMaker", maker);
		return "addfunction/findForm";
	}
	
	//친구검색
	@RequestMapping(value={"/friendfind","/friendfindpage"},method=RequestMethod.GET)
	public String friendfind(String friend, String page, Model model, RedirectAttributes attr, HttpServletRequest request) throws Exception {
		String url = request.getServletPath(); //requestMapping url주소값 얻어옴
		UserVO vo = (UserVO) request.getSession().getAttribute("login");
		FriendVO friendVO = new FriendVO();
		String user = vo.getUser_id();
		Criteria cri = new Criteria();
		if ( page != null) {
			cri.setPage(Integer.parseInt(page));
		}
		PageMaker maker = new PageMaker();
		String forward = null;
		Map<String, Object> map = new HashMap<>();
		map.put("my_id", user);
		map.put("user_id", friend);
		map.put("user_name",friend);
		maker.setCri(cri);
		maker.setTotalCount(service.friendcnt(friend));
		List<UserVO> list = service.friendFind(map);
		model.addAttribute("pageMaker", maker);
		model.addAttribute("user",vo);
		model.addAttribute("friendlist",list);
		forward = "addfunction/findForm";
		return forward;
	}
}
