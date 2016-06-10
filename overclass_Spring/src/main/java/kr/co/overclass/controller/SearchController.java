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
		return "/addfunction/search";//search��û�� �˻� ���� �������� �̵�
	}

	@RequestMapping(value="/search2", method=RequestMethod.GET)
	public String searchResult(){
		return "/addfunction/search2";//�˻� ���������
	}
	
	@RequestMapping(value="/searchIdName", method=RequestMethod.GET)
	public String searchId(String info, Model model) throws Exception{
		logger.info("���̵�/�̸��˻�........................"+info);
		SearchVO vo = new SearchVO();
		Map<String,Object> map = service.pageMaker(info,new Criteria());
		vo.setInfo(info);
		vo.setStart((int)map.get("start"));
		vo.setEnd((int)map.get("end"));
		model.addAttribute("selectIdName",service.select(vo));//���̵� �̸� �˻�
		logger.info(info+"�˻�����");
		return "/addfunction/search2";
	};
	
	@RequestMapping(value="/searchTag", method=RequestMethod.GET)
	public String searchTag(String tag, Model model) throws Exception{
		logger.info("�±װ˻�........................"+tag);
		SearchVO vo = new SearchVO();
		vo.setInfo(tag);
		vo.setStart(1);
		vo.setEnd(5);
		model.addAttribute("selectTag", service.selectTag(vo));//�±װ˻�
		logger.info("tag"+"�˻�����");
		return "/addfunction/search2";
	}
}


