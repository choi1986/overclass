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
	
	//메인피드에서 글쓰기
	@RequestMapping(value="/writeDoc", method=RequestMethod.POST)
	public String create(String url, DocumentVO vo, RedirectAttributes attr, MultipartFile file, HttpSession session) throws Exception {
		String imageName = file.getOriginalFilename();
		String formatName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1);
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		logger.info("파일이름: "+imageName);
		uploadPath = session.getServletContext().getRealPath("/resources/upload");
		String downloadPath = "/overclass/resources/upload/";
		
		//이미지 안올렸을때 처리
		if(imageName.equals("")){
			service.create(vo);
		} else {
			vo.setImage(downloadPath+savedName);
			service.create(vo);
		}
		attr.addFlashAttribute("msg", "Write_SUCCESS");
		
		logger.info("글쓰기...[" + vo + "]");	
		logger.info("사진: [파일이름: "+file.getOriginalFilename()+
				", "+"파일크기: "+ Math.floor(((float)file.getSize()/1048576)*100f)/100f +"MB"+
				", "+"파일타입: "+file.getContentType()+"]");
		if( url.equals("my") ) {
			return "redirect:/main/myFeed";
		} else {
			return "redirect:/main";
		}
	}
	
	//파일업로드
	private String uploadFile(String originName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();
		String savedName = "";
		if(!originName.equals("")){
			savedName = uid.toString() + "_" + originName;
			File target = new File(uploadPath, savedName);
			FileCopyUtils.copy(fileData, target); //실제 파일 업로드
		} 
		return savedName;
	}
	
	//메인피드, 마이피드 글 삭제
	@RequestMapping(value="/removeDoc",method=RequestMethod.GET)
	public String mydelete(int dno, RedirectAttributes attr, String url) throws Exception {
		service.delete(dno);
		attr.addFlashAttribute("msg", "Remove_SUCCESS");
		
		logger.info("게시물 삭제: ["+ dno +"]");
		if(url.equals("my")) {
			return "redirect:/main/myFeed";
		} else {
			return "redirect:/main";
		}
	}
	
	//메인피드 글 조회
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
		
		logger.info("\""+user_id+"\"로 접속, "+vo.toString());
		logger.info("●메인페이지 접근");
		return "document/mainForm";
	}
	
	//메인피드 페이징
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
		
		logger.info("메인피드 페이지 : "+ cri.getPage());
		return "document/mainForm";
	}
	
	//마이피드 글조회
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
		
		logger.info("★마이피드페이지 접근");
		return "document/myFeed";
	}
	
	//마이피드 페이징
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
		
		logger.info("★마이피드 페이지 : "+ cri.getPage());
		return "document/myFeed";
	}
}
