package kr.co.overclass.controller;

import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.SearchVO;
import kr.co.overclass.service.SearchService;

@Controller
public class SearchController {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@Inject
	private SearchService service;
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String searchMain(){
		return "/addfunction/search";//search요청시 검색 메인 페이지로 이동
	}
	
	@RequestMapping(value="/searchIdName", method=RequestMethod.GET)
	public String searchIdName(String info, HttpSession session, Model model) throws Exception{
		logger.info("아이디/이름검색........................"+info);
		SearchVO vo = new SearchVO();
		boolean result = Pattern.matches(".*[ㄱ-ㅎㅏ-ㅣ가-힣]+.*", info);//한글검사
		if(result){
			logger.info("이름검색........................"+info);
			int index = service.countNameNum(info);
			logger.info("결과행 수........................"+index);
			vo.setInfo(info);
			vo.setStart(index-(index-1));
			vo.setEnd((index-(index-1))*10);
			model.addAttribute("selectIdName",service.select(vo));//아이디 이름 검색
			model.addAttribute("resultCount",index);
			session.setAttribute("idName", info);
			model.addAttribute("currentPage", 1);
			logger.info("현재페이지...........1");
			if(service.countNameNum(info)!=0){logger.info(info+": 이름 검색성공");};
		}else{
			logger.info("아이디........................"+info);
			int index = service.countIdNum(info);
			logger.info("결과행 수........................"+index);
			vo.setInfo(info);
			vo.setStart(index-(index-1));
			vo.setEnd((index-(index-1))*10);
			model.addAttribute("selectIdName",service.select(vo));//아이디 이름 검색
			model.addAttribute("resultCount",service.countIdNum(info));
			session.setAttribute("idName", info);
			model.addAttribute("currentPage", 1);
			logger.info("현재페이지...........1");
			if(service.countIdNum(info)!=0){logger.info(info+": 아이디 검색성공");};
		}
		return "/addfunction/search";
	};
	
	@RequestMapping(value="/searchIdNamePage", method=RequestMethod.GET)
	public String searchIdNamePage(int page,HttpSession session, Model model) throws Exception{
		String info = (String)session.getAttribute("idName");
		logger.info("아이디/이름검색........................"+info);
		SearchVO vo = new SearchVO();
		boolean result = Pattern.matches(".*[ㄱ-ㅎㅏ-ㅣ가-힣]+.*", info);//한글검사
		int end = page*10;
		int start = end-9;
		if(result){
			logger.info("이름검색........................"+info);
			int index = service.countNameNum(info);
			logger.info("결과행 수........................"+index);
			vo.setInfo(info);
			vo.setStart(start);
			vo.setEnd(end);
			model.addAttribute("selectIdName",service.select(vo));//아이디 이름 검색
			model.addAttribute("resultCount",index);
			model.addAttribute("currentPage", page);
			logger.info("현재페이지..........."+page);
			if(service.countNameNum(info)!=0){logger.info(info+": 이름 검색성공");};
		}else{
			logger.info("아이디........................"+info);
			int index = service.countIdNum(info);
			logger.info("결과행 수........................"+index);
			vo.setInfo(info);
			vo.setStart(start);
			vo.setEnd(end);
			model.addAttribute("selectIdName",service.select(vo));//아이디 이름 검색
			model.addAttribute("resultCount",index);
			model.addAttribute("currentPage", page);
			logger.info("현재페이지..........."+page);
			if(service.countIdNum(info)!=0){logger.info(info+": 아이디 검색성공");};
		}
		return "/addfunction/search";
	};
	
	@RequestMapping(value="/searchTag", method=RequestMethod.GET)
	public String searchTag(String tag, HttpSession session, Model model) throws Exception{
		logger.info("태그검색........................"+tag);
		SearchVO vo = new SearchVO();
		int index = service.countTagNum(tag);
		logger.info("결과행 수........................"+index);
		vo.setInfo(tag);
		vo.setStart(index-(index-1));
		vo.setEnd((index-(index-1))*10);
		model.addAttribute("selectTag", service.selectTag(vo));//태그검색
		model.addAttribute("resultCount",index);//페이지 분할하기 위한 데이터 수 정보 전송
		session.setAttribute("tag", tag);
		model.addAttribute("currentPage", 1);
		logger.info("현재페이지...........1");
		if(service.countTagNum(tag)!=0){logger.info("tag"+"검색성공");};
		return "/addfunction/search";
	}

	@RequestMapping(value="/searchTagPage", method=RequestMethod.GET)
	public String searchTagPage(int page, HttpSession session, Model model) throws Exception{
		String tag = (String)session.getAttribute("tag");
		logger.info("태그검색........................"+tag);
		SearchVO vo = new SearchVO();
		int index = service.countTagNum(tag);
		logger.info("결과행 수........................"+index);
		vo.setInfo(tag);
		int end = page*10;
		int start = end-9;
		vo.setStart(start);
		vo.setEnd(end);
		model.addAttribute("selectTag", service.selectTag(vo));//태그검색
		model.addAttribute("resultCount",service.countTagNum(tag));//페이지 분할하기 위한 데이터 수 정보 전송
		model.addAttribute("currentPage", page);
		logger.info("현재페이지..........."+page);
		if(service.countTagNum(tag)!=0){logger.info("tag"+"검색성공");};
		return "/addfunction/search";
	}
}
