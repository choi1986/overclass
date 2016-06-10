package kr.co.overclass.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.DocumentVO;
import kr.co.overclass.domain.PageMaker;
import kr.co.overclass.dto.DocumentDTO;
import kr.co.overclass.service.DocumentService;


@Controller
@RequestMapping("/main")
public class DocumentController {
	private static final Logger logger
    = LoggerFactory.getLogger(DocumentController.class);
	
	@Inject
	private DocumentService service;
	
	//�����ǵ忡�� �۾���
	@RequestMapping(value="/writeDoc",method=RequestMethod.POST)
	public String create(DocumentVO vo, RedirectAttributes attr) throws Exception {
		logger.info("�۾���...[" + vo + "]");	
		service.create(vo);
		attr.addFlashAttribute("msg", "Write_SUCCESS");
		
		return "redirect:/main";
	}
	
	//Ư�� �Խñ۱� ����
	@RequestMapping(value="/removeDoc",method=RequestMethod.GET)
	public String delete(int dno, RedirectAttributes attr) throws Exception {
		logger.info("�Խù� ����...["+ dno +"]");
		service.delete(dno);
		attr.addFlashAttribute("msg", "Remove_SUCCESS");
		
		return "redirect:/main";
	}
	
	//�����ǵ� �Խñ� ��ȸ
	@RequestMapping(value="",method=RequestMethod.GET)
	public String mainFeed_list(Criteria cri, Model model, HttpServletRequest request)throws Exception{
		String user_id = "test1";
		//String user_id = (String) request.getSession().getAttribute("user_id");
		List<DocumentDTO> list = service.mainFeed_list(cri, user_id);
		
		model.addAttribute("list", list);
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(service.mainFeed_count(user_id));
		model.addAttribute("pageMaker", maker);
		
		logger.info("�����ǵ�...����Ʈ ����: "+ list.size());
		
		return "document/mainForm";
	}
	
	@RequestMapping(value="/mainFeed_Page",method=RequestMethod.GET)
	public String mainFeed_list(int page, Criteria cri, Model model, HttpServletRequest request)throws Exception{
		String user_id = "test1";
		//String user_id = (String) request.getSession().getAttribute("user_id");
		cri.setPage(page);
		List<DocumentDTO> list = service.mainFeed_list(cri, user_id);
		
		model.addAttribute("list", list);
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(service.mainFeed_count(user_id));
		model.addAttribute("pageMaker", maker);
		
		logger.info("�����ǵ�...����Ʈ ����: "+ list.size());
		logger.info("�����ǵ�...������ : "+ cri.getPage());
		return "document/mainForm"; //����
	}
}
