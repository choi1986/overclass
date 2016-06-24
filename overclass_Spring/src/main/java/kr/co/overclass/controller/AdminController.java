package kr.co.overclass.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
import kr.co.overclass.service.DocumentService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger
    = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private AdminService service;
	
	@Inject
	private DocumentService docService;
	
	//관리자뷰 신고목록 출력
	@RequestMapping(value={"","/adminFeed_Page","ban_list"},method=RequestMethod.GET)
	public String admin(String page, Model model, HttpServletRequest request)throws Exception{
		UserVO vo = (UserVO) request.getSession().getAttribute("login"); //로그인정보를 얻음
		PageMaker maker = new PageMaker();
		Criteria cri = new Criteria();
		if ( page != null) {
			cri.setPage(Integer.parseInt(page));
		}
		
		List<ReportDTO> ban_list = service.ban_list();
		model.addAttribute("ban_list",ban_list); //제제목록 출력
		
		List<ReportDTO> list = service.list(cri);
		maker.setCri(cri);
		maker.setTotalCount(service.report_count());//신고글 개수
		
		model.addAttribute("user",vo);
		model.addAttribute("list",list);
		model.addAttribute("pageMaker", maker);
		return "admin/adminFeed";
	}
	
	//신고하기
	@RequestMapping(value="/reportDoc",method=RequestMethod.POST)
	public String report_ban(ReportVO vo, RedirectAttributes attr) throws Exception {
		String msg = null;
		if ( service.report_sel(vo) == 0 ) {
			msg = "Report_SUCCESS";
			service.report(vo); //report테이블에 신고정보 저장
		} else {
			msg = "Report_FAIL";
		}
		attr.addFlashAttribute("msg", msg);
		return "redirect:/main";
	}
	
	//제재하기
	@Transactional
	@RequestMapping(value="/banDoc",method=RequestMethod.POST)
	public String report_ban(int reportno, int dno, RedirectAttributes attr) throws Exception {
		service.banDoc(reportno); //신고된 글 정보 banDoc테이블에 저장
		service.report_del(reportno); //report테이블에 신고정보 삭제
		docService.delete(dno); //신고된 글 삭제
		return "redirect:/admin";
	}
	
	//신고 철회하기
	@RequestMapping(value="/cancelDoc",method=RequestMethod.POST)
	public String cancel(int reportno, RedirectAttributes attr) throws Exception {
		service.report_del(reportno); //report테이블 신고정보 삭제
		return "redirect:/admin";
	}
}
