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
	
	@RequestMapping(value="/searchId", method=RequestMethod.GET)
	public String searchId(String user_id, Model model) throws Exception{
		logger.info("아이디검색........................");
		model.addAttribute("selectId",service.selectId(user_id));
		return "/addfunction/search";
	};
	
	@RequestMapping(value="/searchName", method=RequestMethod.GET)
	public String searchName(String user_name, Model model) throws Exception{
		logger.info("이름검색........................");
		model.addAttribute("selectName", service.selectName(user_name));
		return "/addfunction/search";
	}
	
	@RequestMapping(value="/searchTag", method=RequestMethod.GET)
	public String searchTag(String doc_tag, Model model) throws Exception{
		logger.info("태그검색........................");
		model.addAttribute("selectTag", service.selectTag(doc_tag));
		return "/addfunction/search";
	}
}
