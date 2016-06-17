package kr.co.overclass.controller;

import java.util.Map;
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
		return "/addfunction/search";//search¿äÃ»½Ã °Ë»ö ¸ÞÀÎ ÆäÀÌÁö·Î ÀÌµ¿
	}

	@RequestMapping(value="/search2", method=RequestMethod.GET)
	public String searchResult(){
		return "/addfunction/search2";//°Ë»ö °á°úÆäÀÌÁö
	}
	
	@RequestMapping(value="/searchIdName", method=RequestMethod.GET)
	public String searchIdName(String info, HttpSession session, Model model) throws Exception{
		logger.info("¾ÆÀÌµð/ÀÌ¸§°Ë»ö........................"+info);
		SearchVO vo = new SearchVO();
		boolean result = Pattern.matches(".*[¤¡-¤¾¤¿-¤Ó°¡-ÆR]+.*", info);//ÇÑ±Û°Ë»ç
		if(result){
			logger.info("ÀÌ¸§°Ë»ö........................"+info);
			int index = service.countNameNum(info);
			logger.info("°á°úÇà ¼ö........................"+index);
			vo.setInfo(info);
			vo.setStart(index-(index-1));
			vo.setEnd((index-(index-1))*10);
			model.addAttribute("selectIdName",service.select(vo));//¾ÆÀÌµð ÀÌ¸§ °Ë»ö
			model.addAttribute("resultCount",service.countNameNum(info));
			session.setAttribute("idName", info);
			logger.info(info+": ÀÌ¸§ °Ë»ö¼º°ø");
		}else{
			logger.info("¾ÆÀÌµð........................"+info);
			int index = service.countIdNum(info);
			logger.info("°á°úÇà ¼ö........................"+index);
			vo.setInfo(info);
			vo.setStart(index-(index-1));
			vo.setEnd((index-(index-1))*10);
			model.addAttribute("selectIdName",service.select(vo));//¾ÆÀÌµð ÀÌ¸§ °Ë»ö
			model.addAttribute("resultCount",service.countIdNum(info));
			session.setAttribute("idName", info);
			logger.info(info+": ¾ÆÀÌµð °Ë»ö¼º°ø");
		}
		return "/addfunction/search2";
	};
	
	@RequestMapping(value="/searchIdNamePage", method=RequestMethod.GET)
	public String searchIdNamePage(int page,HttpSession session, Model model) throws Exception{
		String info = (String)session.getAttribute("idName");
		logger.info("¾ÆÀÌµð/ÀÌ¸§°Ë»ö........................"+info);
		SearchVO vo = new SearchVO();
		boolean result = Pattern.matches(".*[¤¡-¤¾¤¿-¤Ó°¡-ÆR]+.*", info);//ÇÑ±Û°Ë»ç
		int end = page*10;
		int start = end-9;
		if(result){
			logger.info("ÀÌ¸§°Ë»ö........................"+info);
			int index = service.countNameNum(info);
			logger.info("°á°úÇà ¼ö........................"+index);
			vo.setInfo(info);
			vo.setStart(start);
			vo.setEnd(end);
			model.addAttribute("selectIdName",service.select(vo));//¾ÆÀÌµð ÀÌ¸§ °Ë»ö
			model.addAttribute("resultCount",service.countNameNum(info));
			logger.info(info+": ÀÌ¸§ °Ë»ö¼º°ø");
		}else{
			logger.info("¾ÆÀÌµð........................"+info);
			int index = service.countIdNum(info);
			logger.info("°á°úÇà ¼ö........................"+index);
			vo.setInfo(info);
			vo.setStart(start);
			vo.setEnd(end);
			model.addAttribute("selectIdName",service.select(vo));//¾ÆÀÌµð ÀÌ¸§ °Ë»ö
			model.addAttribute("resultCount",service.countIdNum(info));
			logger.info(info+": ¾ÆÀÌµð °Ë»ö¼º°ø");
		}
		return "/addfunction/search2";
	};
	
	@RequestMapping(value="/searchTag", method=RequestMethod.GET)
	public String searchTag(String tag, HttpSession session, Model model) throws Exception{
		logger.info("ÅÂ±×°Ë»ö........................"+tag);
		SearchVO vo = new SearchVO();
		int index = service.countTagNum(tag);
		logger.info("°á°úÇà ¼ö........................"+index);
		vo.setInfo(tag);
		vo.setStart(index-(index-1));
		vo.setEnd((index-(index-1))*10);
		model.addAttribute("selectTag", service.selectTag(vo));//ÅÂ±×°Ë»ö
		model.addAttribute("resultCount",service.countTagNum(tag));//ÆäÀÌÁö ºÐÇÒÇÏ±â À§ÇÑ µ¥ÀÌÅÍ ¼ö Á¤º¸ Àü¼Û
		session.setAttribute("tag", tag);
		logger.info("tag"+"°Ë»ö¼º°ø");
		return "/addfunction/search2";
	}

	@RequestMapping(value="/searchTagPage", method=RequestMethod.GET)
	public String searchTagPage(int page, HttpSession session, Model model) throws Exception{
		SearchVO vo = new SearchVO();
		String tag = (String)session.getAttribute("tag");
		vo.setInfo(tag);
		int end = page*10;
		int start = end-9;
		vo.setStart(start);
		vo.setEnd(end);
		model.addAttribute("selectTag", service.selectTag(vo));//ÅÂ±×°Ë»ö
		model.addAttribute("resultCount",service.countTagNum(tag));//ÆäÀÌÁö ºÐÇÒÇÏ±â À§ÇÑ µ¥ÀÌÅÍ ¼ö Á¤º¸ Àü¼Û
		logger.info("tag"+"°Ë»ö¼º°ø");
		return "/addfunction/search2";
	}
}


