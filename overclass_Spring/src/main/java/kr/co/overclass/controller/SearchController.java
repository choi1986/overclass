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
		Map<String,Object> page = service.pageMaker(info,new Criteria());
		vo.setInfo(info);
		vo.setStart((int)page.get("start"));
		vo.setEnd((int)page.get("end"));
		model.addAttribute("selectIdName",service.select(vo));//���̵� �̸� �˻�
		boolean result = Pattern.matches(".*[��-����-�Ӱ�-�R]+.*", info);//�ѱ۰˻�
		System.out.println(result);
		if(result){//�ѱ��̸� �̸�
			model.addAttribute("page",service.countNameNum(info));
		}else{//�ƴϸ� ���̵�
			model.addAttribute("page",service.countIdNum(info));
		}
		logger.info(info+"�˻�����");
		return "/addfunction/search2";
	};
	
	@RequestMapping(value="/searchTag", method=RequestMethod.GET)
	public String searchTag(String tag, Model model) throws Exception{
		logger.info("�±װ˻�........................"+tag);
		SearchVO vo = new SearchVO();
		Map<String,Object> page = service.pageMaker(tag,new Criteria());
		vo.setInfo(tag);
		vo.setStart((int)page.get("start"));
		vo.setEnd((int)page.get("end"));
		model.addAttribute("selectTag", service.selectTag(vo));//�±װ˻�
		model.addAttribute("page",service.countTagNum(tag));//������ �����ϱ� ���� ������ �� ���� ����
		logger.info("tag"+"�˻�����");
		return "/addfunction/search2";
	}
}


