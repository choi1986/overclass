package kr.co.overclass.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.junit.runner.Request;
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

	@RequestMapping(value="/search2", method=RequestMethod.GET)
	public String searchResult(){
		return "/addfunction/search2";//검색 결과페이지
	}
	
	@RequestMapping(value="/searchIdName", method=RequestMethod.GET)
	public String searchId(String info, Model model) throws Exception{
		logger.info("아이디/이름검색........................"+info);
		SearchVO vo = new SearchVO();
		Map<String,Object> map = service.pageMaker(info,new Criteria());
		vo.setInfo(info);
		vo.setStart((int)map.get("start"));
		vo.setEnd((int)map.get("end"));
		model.addAttribute("selectIdName",service.select(vo));//아이디 이름 검색
		logger.info(info+"검색성공");
		return "/addfunction/search2";
	};
	
	@RequestMapping(value="/searchTag", method=RequestMethod.GET)
	public String searchTag(String tag, Model model) throws Exception{
		logger.info("태그검색........................"+tag);
		SearchVO vo = new SearchVO();
		vo.setInfo(tag);
		vo.setStart(1);
		vo.setEnd(5);
		model.addAttribute("selectTag", service.selectTag(vo));//태그검색
		logger.info("tag"+"검색성공");
		return "/addfunction/search2";
	}
}


