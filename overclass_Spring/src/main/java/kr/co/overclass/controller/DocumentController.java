package kr.co.overclass.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.imgscalr.Scalr;
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
	public String create(DocumentVO vo, RedirectAttributes attr, MultipartFile file, HttpSession session) throws Exception {
		String imageName = file.getOriginalFilename();
		String formatName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1);
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		logger.info("파일이름: "+imageName);
		uploadPath = session.getServletContext().getRealPath("/resources/upload");
		String downloadPath = "/overclass/resources/upload/";
		
		//이미지 안올렸을때 처리
		if(imageName.trim().equals("")){
			service.create(vo);
		} else {
			vo.setImage(downloadPath+savedName);
			service.create(vo);
		}
		logger.info("글쓰기...[" + vo + "]");	
		logger.info("사진: [파일이름: "+file.getOriginalFilename()+
				", "+"파일크기: "+ Math.floor(((float)file.getSize()/1048576)*100f)/100f +"MB"+
				", "+"파일타입: "+file.getContentType()+"]");
		attr.addFlashAttribute("msg", "Write_SUCCESS");
		
		return "redirect:/main";
	}
	
	//마이피드에서 글쓰기
	@RequestMapping(value="/myFeed/writeDoc",method=RequestMethod.POST)
	public String mycreate(DocumentVO vo, RedirectAttributes attr, MultipartFile file, HttpSession session) throws Exception {
		String imageName = file.getOriginalFilename();
		String formatName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1);
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		logger.info("파일이름: "+imageName);
		uploadPath = session.getServletContext().getRealPath("/resources/upload");
		String downloadPath = "/overclass/resources/upload/";

		//이미지 안올렸을때 처리
		if(imageName.trim().equals("")){
			service.create(vo);
		} else {
			vo.setImage(downloadPath+savedName);
			service.create(vo);
		}
		logger.info("글쓰기...[" + vo + "]");	
		logger.info("사진: [파일이름: "+file.getOriginalFilename()+
				", "+"파일크기: "+ Math.floor(((float)file.getSize()/1048576)*100f)/100f +"MB"+
				", "+"파일타입: "+file.getContentType()+"]");
		attr.addFlashAttribute("msg", "Write_SUCCESS");

		return "redirect:/main/myFeed";
	}
	
	//파일업로드
	private String uploadFile(String originName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target); //실제 파일 업로드
		return savedName;
	}
	
	//특정 게시글글 삭제
	@RequestMapping(value="/removeDoc",method=RequestMethod.GET)
	public String delete(int dno, RedirectAttributes attr) throws Exception {
		logger.info("게시물 삭제...["+ dno +"]");
		service.delete(dno);
		attr.addFlashAttribute("msg", "Remove_SUCCESS");
		
		return "redirect:/main";
	}
	
	//메인피드 게시글 조회
	@RequestMapping(value="",method=RequestMethod.GET)
	public String mainFeed_page(Criteria cri, Model model, HttpServletRequest request)throws Exception{
		String user_id = "test1";
		String user_image = "/overclass/resources/img/feed_default.png";
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_image", user_image);
		//String user_id = (String) request.getSession().getAttribute("user_id");
		//String user_image = (String) request.getSession().getAttribute("user_id");
		List<DocumentDTO> list = service.mainFeed_list(cri, user_id);
		model.addAttribute("user",map);
		model.addAttribute("list", list);
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(service.mainFeed_count(user_id));
		model.addAttribute("pageMaker", maker);
		
		logger.info("메인피드...리스트 개수: "+ list.size());
		
		return "document/mainForm";
	}
	
	//메인피드 페이징
	@RequestMapping(value="/mainFeed_Page",method=RequestMethod.GET)
	public String mainFeed_list(int page, Criteria cri, Model model, HttpServletRequest request)throws Exception{
		String user_id = "test1";
		String user_image = "/overclass/resources/img/feed_default.png";
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_image", user_image);
		//String user_id = (String) request.getSession().getAttribute("user_id");
		//String user_image = (String) request.getSession().getAttribute("user_id");
		cri.setPage(page);
		List<DocumentDTO> list = service.mainFeed_list(cri, user_id);
		model.addAttribute("list", list);
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(service.mainFeed_count(user_id));
		model.addAttribute("user", map);
		model.addAttribute("pageMaker", maker);
		
		logger.info("메인피드...리스트 개수: "+ list.size());
		logger.info("메인피드...페이지 : "+ cri.getPage());
		return "document/mainForm";
	}
	
	@RequestMapping(value="/myFeed",method=RequestMethod.GET)
	public String myFeed(Criteria cri, Model model, HttpServletRequest request) throws Exception{
		String user_id = "test1";
		String user_image = "/overclass/resources/img/feed_default.png";
		String birth = "900317";
		String email = "charminguk2@naver.com";
		String loc ="경기도";
		String name = "홍길동";
		String tel = "010-9767-9783";
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_image", user_image);
		map.put("user_birth", birth);
		map.put("user_email", email);
		map.put("user_loc", loc);
		map.put("user_name", name);
		map.put("user_tel", tel);
		//String user_id = (String) request.getSession().getAttribute("user_id");
		//String user_image = (String) request.getSession().getAttribute("user_id");
		List<DocumentDTO> list = service.myFeed_list(cri, user_id);
		model.addAttribute("user", map);
		model.addAttribute("list", list);
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(service.myFeed_count(user_id));
		model.addAttribute("pageMaker", maker);
		
		logger.info("마이피드...리스트 개수: "+ list.size());
		return "document/myFeed";
	}
	
	@RequestMapping(value="/myFeed_Page",method=RequestMethod.GET)
	public String myFeed_page(int page, Criteria cri, Model model, HttpServletRequest request)throws Exception {
		String user_id = "test1";
		String user_image = "/overclass/resources/img/feed_default.png";
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_image", user_image);
		//String user_id = (String) request.getSession().getAttribute("user_id");
		//String user_image = (String) request.getSession().getAttribute("user_id");
		cri.setPage(page);
		List<DocumentDTO> list = service.mainFeed_list(cri, user_id);
		model.addAttribute("list", list);
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(service.mainFeed_count(user_id));
		model.addAttribute("user",map);
		model.addAttribute("pageMaker", maker);
		
		logger.info("메인피드...리스트 개수: "+ list.size());
		logger.info("메인피드...페이지 : "+ cri.getPage());
		return "document/myFeed";
	}
}
