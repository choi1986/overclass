package kr.co.overclass.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.overclass.service.SearchService;

@Controller
public class SearchController {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@Inject
	private SearchService service;
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String searchMain(){
		return "/addfunction/search";
	}

	@RequestMapping(value="/search2", method=RequestMethod.GET)
	public String searchResult(){
		return "/addfunction/search2";
	}
	
	@RequestMapping(value="/searchId", method=RequestMethod.GET)
	public String searchId(String user_id, Model model) throws Exception{
		logger.info("아이디검색........................"+user_id);
		model.addAttribute("selectId",service.selectId(user_id));
		logger.info(user_id+"검색성공");
		return "/addfunction/search2";
	};
	
	@RequestMapping(value="/searchName", method=RequestMethod.GET)
	public String searchName(String user_name, Model model) throws Exception{
		logger.info("이름검색........................"+user_name);
		model.addAttribute("selectName", service.selectName(user_name));
		logger.info(user_name+"검색성공");
		return "/addfunction/search2";
	}
	
	@RequestMapping(value="/searchTag", method=RequestMethod.GET)
	public String searchTag(String tag, Model model) throws Exception{
		logger.info("태그검색........................"+tag);
		logger.info(tag+"검색성공");
		model.addAttribute("selectTag", service.selectTag(tag));
		return "/addfunction/search2";
	}
}
