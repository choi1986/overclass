package kr.co.overclass.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.imgscalr.Scalr.Method;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.PageMaker;
import kr.co.overclass.domain.ReportVO;
import kr.co.overclass.domain.UserVO;
import kr.co.overclass.dto.ReportDTO;
import kr.co.overclass.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger
    = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private AdminService service;
	
	@RequestMapping(value={"","/adminFeed_Page","ban_list"},method=RequestMethod.GET)
	public String admin(String page, Model model, HttpServletRequest request)throws Exception{
		String url = request.getServletPath();
		UserVO vo = (UserVO) request.getSession().getAttribute("login");
		PageMaker maker = new PageMaker();
		Criteria cri = new Criteria();
		if ( page != null) {
			cri.setPage(Integer.parseInt(page));
		}
		
		/*임시*/
		String user_id = "admin";
		String user_image = "/overclass/resources/img/profile_default.png";
		String user_name = "관리자";
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_image", user_image);
		map.put("user_name", user_name);
		/*--------------*/
		
		List<ReportDTO> ban_list = service.ban_list();
		model.addAttribute("ban_list",ban_list);
		List<ReportDTO> list = service.list(cri);
		maker.setCri(cri);
		maker.setTotalCount(service.report_count());//신고글 개수
		
		model.addAttribute("user",map);
		model.addAttribute("list",list);
		model.addAttribute("pageMaker", maker);
		return "admin/adminFeed";
	}
	
	//신고하기
	@RequestMapping(value="/reportDoc",method=RequestMethod.POST)
	public String report(ReportVO vo, RedirectAttributes attr) throws Exception {
		
		service.report(vo);
		logger.info("신고처리: "+vo);
		
		attr.addFlashAttribute("msg", "Write_SUCCESS");
		
		return "redirect:/main/myFeed";
	}
	
	//제제하기
	@Transactional
	@RequestMapping(value="/banDoc",method=RequestMethod.POST)
	public String report(int reportno, String writer, Model model,RedirectAttributes attr) throws Exception {
		logger.info("신고번호: "+reportno);
		service.banDoc(reportno);
		service.report_del(reportno);
		return "redirect:/admin";
	}
	
/*	//제제목록 출력
	@RequestMapping(value="/ban_list",method=RequestMethod.GET)
	public String report(String page, int reportno, Model model) throws Exception {
		logger.info("파라미터확인!: "+ reportno);
		PageMaker maker = new PageMaker();
		Criteria cri = new Criteria();
		if ( page != null) {
			cri.setPage(Integer.parseInt(page));
		}
		if ( reportno != null) {
			dto.setReportno(Integer.parseInt(reportno));
		}
		
		List<ReportDTO> ban_list = service.ban_list();
		model.addAttribute("ban_list",ban_list);
		
		임시
		String user_id = "admin";
		String user_image = "/overclass/resources/img/profile_default.png";
		String user_name = "관리자";
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_image", user_image);
		map.put("user_name", user_name);
		--------------
		List<ReportDTO> list2 = service.list(cri);
		int report_cnt = service.report_count();
		maker.setCri(cri);
		maker.setTotalCount(service.report_count());
		
		model.addAttribute("user",map);
		model.addAttribute("list",list2);
		model.addAttribute("pageMaker", maker);
		model.addAttribute("count",report_cnt);
		return "admin/adminFeed";
	}*/
}
