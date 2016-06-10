package kr.co.overclass.controller;

import java.util.Map;
import java.util.regex.Pattern;

import javax.inject.Inject;

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
	public String searchId(String info, Model model) throws Exception{
		logger.info("¾ÆÀÌµð/ÀÌ¸§°Ë»ö........................"+info);
		SearchVO vo = new SearchVO();
		Map<String,Object> page = service.pageMaker(info,new Criteria());
		vo.setInfo(info);
		vo.setStart((int)page.get("start"));
		vo.setEnd((int)page.get("end"));
		model.addAttribute("selectIdName",service.select(vo));//¾ÆÀÌµð ÀÌ¸§ °Ë»ö
		boolean result = Pattern.matches(".*[¤¡-¤¾¤¿-¤Ó°¡-ÆR]+.*", info);//ÇÑ±Û°Ë»ç
		System.out.println(result);
		if(result){//ÇÑ±ÛÀÌ¸é ÀÌ¸§
			model.addAttribute("page",service.countNameNum(info));
		}else{//¾Æ´Ï¸é ¾ÆÀÌµð
			model.addAttribute("page",service.countIdNum(info));
		}
		logger.info(info+"°Ë»ö¼º°ø");
		return "/addfunction/search2";
	};
	
	@RequestMapping(value="/searchTag", method=RequestMethod.GET)
	public String searchTag(String tag, Model model) throws Exception{
		logger.info("ÅÂ±×°Ë»ö........................"+tag);
		SearchVO vo = new SearchVO();
		Map<String,Object> page = service.pageMaker(tag,new Criteria());
		vo.setInfo(tag);
		vo.setStart((int)page.get("start"));
		vo.setEnd((int)page.get("end"));
		model.addAttribute("selectTag", service.selectTag(vo));//ÅÂ±×°Ë»ö
		model.addAttribute("page",service.countTagNum(tag));//ÆäÀÌÁö ºÐÇÒÇÏ±â À§ÇÑ µ¥ÀÌÅÍ ¼ö Á¤º¸ Àü¼Û
		logger.info("tag"+"°Ë»ö¼º°ø");
		return "/addfunction/search2";
	}
}


