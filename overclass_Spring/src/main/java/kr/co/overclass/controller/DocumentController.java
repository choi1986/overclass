package kr.co.overclass.controller;

import java.io.File;
import java.util.ArrayList;
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
import kr.co.overclass.domain.FriendVO;
import kr.co.overclass.domain.PageMaker;
import kr.co.overclass.domain.UserVO;
import kr.co.overclass.dto.DocumentDTO;
import kr.co.overclass.service.DocumentService;
import kr.co.overclass.service.FriendService;
import kr.co.overclass.service.UserService;


@Controller
@RequestMapping("/main")
public class DocumentController {
	private static final Logger logger
    = LoggerFactory.getLogger(DocumentController.class);
	
	@Inject
	private DocumentService service;
	@Inject
	private FriendService friService;
	@Inject
	private UserService userService;
	String uploadPath;
	
	//파일업로드
	private String uploadFile(String originName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originName; //uuid와 함께저장
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target); //실제 파일 업로드
		return savedName;
	}
	
	//메인피드, 마이피드에서 글쓰기
	@RequestMapping(value={"/writeDoc","/mywriteDoc"}, method=RequestMethod.POST)
	public String create(DocumentVO vo, RedirectAttributes attr, MultipartFile file, HttpServletRequest request) throws Exception {
		String imageName = file.getOriginalFilename(); //파일의 원래이름
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes()); //UUID가 더해진 파일이름
		String url = request.getServletPath(); // requestMapping url주소값 얻어옴
		String forward = null; 
		String downloadPath = "/overclass/resources/upload/"; //DB에 경로추가해서 저장하기 위함
		uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload"); //파일 업로드 위치
		
		//이미지 안올렸을때 처리
		if(imageName.equals("")){ //파일이 없을때
			service.create(vo);
		} else { //파일이 있다면
			vo.setImage(downloadPath+savedName); //전체경로 추가
			service.create(vo);
		}
		attr.addFlashAttribute("msg", "Write_SUCCESS");
		
		logger.info("글쓰기...[" + vo + "]");	
		logger.info("사진: [파일이름: "+imageName+
				", "+"파일크기: "+ Math.floor(((float)file.getSize()/1048576)*100f)/100f +"MB"+
				", "+"파일타입: "+file.getContentType()+"]");
		if( url.matches(".*mywriteDoc.*") ) {
			forward = "redirect:/main/myFeed";
		} else {
			forward = "redirect:/main";
		}
		return forward;
	}
	
	//마이피드 수정
	@RequestMapping(value={"/imageUp","/imageDefault"},method=RequestMethod.POST)
	public String imageupdate(String user_id, MultipartFile imagefile, RedirectAttributes attr,Model model, HttpServletRequest request) throws Exception {
		String url = request.getServletPath();
		String imageName = imagefile.getOriginalFilename(); //파일의 원래이름
		String savedName = uploadFile(imagefile.getOriginalFilename(), imagefile.getBytes()); //UUID가 더해진 파일이름
		String downloadPath = "/overclass/resources/upload/"; //DB에 경로추가해서 저장하기 위함
		uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload"); //파일 업로드 위치
		UserVO vo = (UserVO) request.getSession().getAttribute("login");
		String image = null;
		
		if (url.equals("/main/imageDefault")) { //프로필 기본이미지로 변경 요청시
			image = "/overclass/resources/img/profile_default.png"; 
		} else {
			image = vo.getUser_image();
		}
		Map<String, String> map = new HashMap<>();
		//파일이 빈값이 아닐때 선택한이미지로 삽입
		if (!imageName.equals("")) {
			vo.setUser_image(downloadPath+savedName);
			map.put("user_image",downloadPath+savedName);
		} else { //파일이 빈값일때 기존이미지 삽입
			vo.setUser_image(image);
			map.put("user_image",image);
		}
		map.put("user_id",user_id);
		service.imageUpdate(map);
		request.getSession().removeAttribute("login"); //세션정보 갱신을 위해 세션정보 삭제
		request.getSession().setAttribute("login", vo); //갱신된 세션정보를 다시 저장
		attr.addFlashAttribute("msg", "Update_SUCCESS");
		return "redirect:/main/myFeed";
	}
		
	
	//메인피드, 마이피드 글 삭제
	@RequestMapping(value={"/removeDoc","/myremoveDoc"},method=RequestMethod.GET)
	public String delete(int dno, RedirectAttributes attr, HttpServletRequest request) throws Exception {
		String url = request.getServletPath(); //requestMapping url주소값 얻어옴
		String forward = null;
		service.delete(dno); //해당 글번호의 글 삭제
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
	@RequestMapping(value={"","/myFeed","/mainFeed_Page","/myFeed_Page","friendFeed","friendFeed_Page"},method=RequestMethod.GET)
	public String mainlist(String page, String user_id, Model model, HttpServletRequest request)throws Exception{
		String url = request.getServletPath(); //requestMapping url주소값 얻어옴
		UserVO vo = (UserVO) request.getSession().getAttribute("login"); //로그인정보 얻어옴
		Criteria cri = new Criteria();
		
		if ( page != null) {
			cri.setPage(Integer.parseInt(page));
		}
		PageMaker maker = new PageMaker();
		String forward = null;
		maker.setCri(cri);
		List<DocumentDTO> list = null;
		if( url.equals("/main/myFeed") || url.equals("/main/myFeed_Page") ) {
			list = service.myFeed_list(cri, vo.getUser_id());
			maker.setTotalCount(service.myFeed_count(vo.getUser_id()));
			forward = "document/myFeed";
		} else if( url.equals("/main") || url.equals("/main/mainFeed_Page")) {
			logger.info("\""+vo.getUser_id()+"\"로 접속, "+vo.toString());
			maker.setTotalCount(service.mainFeed_count(vo.getUser_id()));
			list = service.mainFeed_list(cri, vo.getUser_id());
			forward = "document/mainForm";
		} else if ( url.equals("/main/friendFeed") || url.equals("/main/friendFeed_Page") ) {
			List<FriendVO> friVo =  friService.select_rel(vo.getUser_id());
			boolean friCk=false;
			for(int i=0; i<friVo.size(); i++) {
				if(friVo.get(i).getSender().equals(user_id)||friVo.get(i).getReceiver().equals(user_id))
					friCk=true;
			}
			if(friCk) {
				UserVO friend = new UserVO();
				list = service.myFeed_list(cri, user_id);
				maker.setTotalCount(service.myFeed_count(user_id));
				friend = userService.searchUser(user_id);
				model.addAttribute("friend",friend);
				forward = "document/friendFeed";
			}
			else {
				model.addAttribute("friCk", "fail");
				forward = "document/myFeed";
			}
		}
		model.addAttribute("user",vo);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", maker);
		
		List<FriendVO> friTempList = friService.select_rel(vo.getUser_id());
		ArrayList<UserVO> friVoList = new ArrayList<UserVO>();
		
		for (int i=0; i<friTempList.size(); i++) {
			if(!friTempList.get(i).getSender().equals(vo.getUser_id()))
				friVoList.add(userService.searchUser(friTempList.get(i).getSender()));
			
		}
		for (int i=0; i<friTempList.size(); i++) {
			if(!friTempList.get(i).getReceiver().equals(vo.getUser_id()))
				friVoList.add(userService.searchUser(friTempList.get(i).getReceiver()));
		}
		request.getSession().setAttribute("friend_rel", friVoList);
		
		return forward;
	}
	
	//지도
	@RequestMapping(value="/map", method=RequestMethod.GET)
	public String map(String mapXY, String mapLoc, HttpSession session,Model model) throws Exception{
		System.out.println("map: "+mapXY);
		String temp = mapXY.replaceAll("[()]", "");
		String format[] = temp.split(", ");
		String mapX = format[0];
		String mapY = format[1];
		Map<String, Object> map = new HashMap<>();
		map.put("mapX", mapX);
		map.put("mapY", mapY);
		map.put("mapLoc", mapLoc);
		model.addAttribute("mapinfo",map);
		return "document/map";
	}
	
	@RequestMapping(value="/read_document", method=RequestMethod.GET)
	public String read_document(int dno,HttpSession session,Model model) throws Exception{
		DocumentDTO dto = service.read_doc(dno);
		System.out.println(dto.toString());
		model.addAttribute("doc", dto);
		return "document/readDoc";
	}
}
