package kr.co.overclass.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.DocumentVO;
import kr.co.overclass.domain.PageMaker;
import kr.co.overclass.domain.UserVO;
import kr.co.overclass.dto.DocumentDTO;
import kr.co.overclass.service.DocumentService;


@Controller
@RequestMapping("/main")
public class DocumentController {
	private static final Logger logger
    = LoggerFactory.getLogger(DocumentController.class);
	
	@Inject
	private DocumentService service;
	String uploadPath;
	
	//�����ǵ忡�� �۾���
	@RequestMapping(value="/writeDoc", method=RequestMethod.POST)
	public String create(String url, DocumentVO vo, RedirectAttributes attr, MultipartFile file, HttpSession session) throws Exception {
		String imageName = file.getOriginalFilename();
		String formatName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1);
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		logger.info("�����̸�: "+imageName);
		uploadPath = session.getServletContext().getRealPath("/resources/upload");
		String downloadPath = "/overclass/resources/upload/";
		
		//�̹��� �ȿ÷����� ó��
		if(imageName.equals("")){
			service.create(vo);
		} else {
			vo.setImage(downloadPath+savedName);
			service.create(vo);
		}
		attr.addFlashAttribute("msg", "Write_SUCCESS");
		
		logger.info("�۾���...[" + vo + "]");	
		logger.info("����: [�����̸�: "+file.getOriginalFilename()+
				", "+"����ũ��: "+ Math.floor(((float)file.getSize()/1048576)*100f)/100f +"MB"+
				", "+"����Ÿ��: "+file.getContentType()+"]");
		if( url.equals("my") ) {
			return "redirect:/main/myFeed";
		} else {
			return "redirect:/main";
		}
	}
	
	//���Ͼ��ε�
	private String uploadFile(String originName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();
		String savedName = "";
		if(!originName.equals("")){
			savedName = uid.toString() + "_" + originName;
			File target = new File(uploadPath, savedName);
			FileCopyUtils.copy(fileData, target); //���� ���� ���ε�
		} 
		return savedName;
	}
	
	//�����ǵ�, �����ǵ� �� ����
	@RequestMapping(value="/removeDoc",method=RequestMethod.GET)
	public String mydelete(int dno, RedirectAttributes attr, String url) throws Exception {
		service.delete(dno);
		attr.addFlashAttribute("msg", "Remove_SUCCESS");
		
		logger.info("�Խù� ����: ["+ dno +"]");
		if(url.equals("my")) {
			return "redirect:/main/myFeed";
		} else {
			return "redirect:/main";
		}
	}
	
	//�����ǵ� �� ��ȸ
	@RequestMapping(value="",method=RequestMethod.GET)
	public String mainFeed_page(Criteria cri, Model model, HttpSession session)throws Exception{
		UserVO vo = (UserVO) session.getAttribute("login");
		String user_id = vo.getUser_id();
		List<DocumentDTO> list = service.mainFeed_list(cri, user_id);
		model.addAttribute("user",vo);
		model.addAttribute("list", list);
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(service.mainFeed_count(user_id));
		model.addAttribute("pageMaker", maker);
		
		logger.info("\""+user_id+"\"�� ����, "+vo.toString());
		logger.info("�ܸ��������� ����");
		return "document/mainForm";
	}
	
	//�����ǵ� ����¡
	@RequestMapping(value="/mainFeed_Page",method=RequestMethod.GET)
	public String mainFeed_list(int page, Criteria cri, Model model, HttpSession session)throws Exception{
		UserVO vo = (UserVO) session.getAttribute("login");
		String user_id = vo.getUser_id();
		cri.setPage(page);
		List<DocumentDTO> list = service.mainFeed_list(cri, user_id);
		model.addAttribute("list", list);
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(service.mainFeed_count(user_id));
		model.addAttribute("user", vo);
		model.addAttribute("pageMaker", maker);
		
		logger.info("�����ǵ� ������ : "+ cri.getPage());
		return "document/mainForm";
	}
	
	//�����ǵ� ����ȸ
	@RequestMapping(value="/myFeed",method=RequestMethod.GET)
	public String myFeed(Criteria cri, Model model, HttpSession session) throws Exception{
		UserVO vo = (UserVO) session.getAttribute("login");
		String user_id = vo.getUser_id();
		List<DocumentDTO> list = service.myFeed_list(cri, user_id);
		model.addAttribute("user", vo);
		model.addAttribute("list", list);
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(service.myFeed_count(user_id));
		model.addAttribute("pageMaker", maker);
		
		logger.info("�ڸ����ǵ������� ����");
		return "document/myFeed";
	}
	
	//�����ǵ� ����¡
	@RequestMapping(value="/myFeed_Page",method=RequestMethod.GET)
	public String myFeed_page(int page, Criteria cri, Model model, HttpSession session)throws Exception {
		UserVO vo = (UserVO) session.getAttribute("login");
		String user_id = vo.getUser_id();		
		cri.setPage(page);
		List<DocumentDTO> list = service.mainFeed_list(cri, user_id);
		model.addAttribute("list", list);
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(service.mainFeed_count(user_id));
		model.addAttribute("user",vo);
		model.addAttribute("pageMaker", maker);
		
		logger.info("�ڸ����ǵ� ������ : "+ cri.getPage());
		return "document/myFeed";
	}
}
