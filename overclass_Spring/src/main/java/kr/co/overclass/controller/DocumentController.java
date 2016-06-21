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
	
	//메인피드, 마이피드에서 글쓰기
	@RequestMapping(value={"/writeDoc","/mywriteDoc"}, method=RequestMethod.POST)
	public String create(DocumentVO vo, RedirectAttributes attr, MultipartFile file, HttpServletRequest request) throws Exception {
		String imageName = file.getOriginalFilename();
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		String url = request.getServletPath();
		String forward = null;
		String downloadPath = "/overclass/resources/upload/";
		uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload");
		
		//이미지 안올렸을때 처리
		if(imageName.equals("")){
			service.create(vo);
		} else {
			vo.setImage(downloadPath+savedName);
			service.create(vo);
		}
		attr.addFlashAttribute("msg", "Write_SUCCESS");
		
		logger.info("글쓰기...[" + vo + "]");	
		logger.info("사진: [파일이름: "+imageName+
				", "+"파일크기: "+ Math.floor(((float)file.getSize()/1048576)*100f)/100f +"MB"+
				", "+"파일타입: "+file.getContentType()+"]");
		if( url.equals("/main/mywriteDoc") ) {
			forward = "redirect:/main/myFeed";
		} else {
			forward = "redirect:/main";
		}
		return forward;
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
	@RequestMapping(value={"/removeDoc","/myremoveDoc"},method=RequestMethod.GET)
	public String mydelete(int dno, RedirectAttributes attr, HttpServletRequest request) throws Exception {
		String url = request.getServletPath();
		String forward = null;
		service.delete(dno);
		attr.addFlashAttribute("msg", "Remove_SUCCESS");
		
		logger.info("게시물 삭제: ["+ dno +"]");
		if( url.equals("/main/myremoveDoc") ) {
			forward = "redirect:/main/myFeed";
		} else {
			forward = "redirect:/main";
		}
		return forward;
	}
	
	//메인피드, 마이피드 글 조회 + 페이징
	@RequestMapping(value={"","/myFeed","/mainFeed_Page","/myFeed_Page"},method=RequestMethod.GET)
	public String mainFeed_page(String page, Model model, HttpServletRequest request)throws Exception{
		String url = request.getServletPath();
		UserVO vo = (UserVO) request.getSession().getAttribute("login");
		String user_id = vo.getUser_id();
		Criteria cri = new Criteria();
		
		if ( page != null) {
			cri.setPage(Integer.parseInt(page));
		}
		PageMaker maker = new PageMaker();
		String forward = null;
		maker.setCri(cri);
		List<DocumentDTO> list = null;
		if( url.equals("/main/myFeed") || url.equals("/main/myFeed_Page") ) {
			list = service.myFeed_list(cri, user_id);
			maker.setTotalCount(service.myFeed_count(user_id));
			forward = "document/myFeed";
		} else if( url.equals("/main") || url.equals("/main/mainFeed_Page")) {
			logger.info("\""+user_id+"\"로 접속, "+vo.toString());
			maker.setTotalCount(service.mainFeed_count(user_id));
			list = service.mainFeed_list(cri, user_id);
			forward = "document/mainForm";
		}
		model.addAttribute("user",vo);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", maker);
		
		return forward;
	}
	
	@RequestMapping(value="/read_document", method=RequestMethod.GET)
	public String read_document(int dno,HttpSession session,Model model) throws Exception{
		DocumentDTO dto = service.read_doc(dno);
		System.out.println(dto.toString());
		model.addAttribute("doc", dto);
		return "document/readDoc";
	}
}
