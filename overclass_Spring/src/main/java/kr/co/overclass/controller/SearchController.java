package kr.co.overclass.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.overclass.service.SearchService;

@Controller
@RequestMapping("/overclass")
public class SearchController {
	
	@Inject
	private SearchService service;
	
	@RequestMapping(value="/searchId", method=RequestMethod.GET)
	public String searchId(String user_id, Model model) throws Exception{
		model.addAttribute("selectId",service.selectId(user_id));
		return "";
	};
	
	@RequestMapping(value="/searchName", method=RequestMethod.GET)
	public String searchName(String user_name, Model model) throws Exception{
		model.addAttribute("searchName", service.selectName(user_name));
		return "";
	}
	
	@RequestMapping(value="/searchTag", method=RequestMethod.GET)
	public String searchTag(String doc_tag, Model model) throws Exception{
		model.addAttribute("searchName", service.selectTag(doc_tag));
		return "";
	}
}
