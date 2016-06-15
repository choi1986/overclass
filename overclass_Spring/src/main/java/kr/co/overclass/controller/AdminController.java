package kr.co.overclass.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.PageMaker;
import kr.co.overclass.domain.ReportVO;
import kr.co.overclass.dto.DocumentDTO;
import kr.co.overclass.persistence.adminDAO;
import kr.co.overclass.service.AdminService;
import kr.co.overclass.service.DocumentService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger
    = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private AdminService service;
	
	@RequestMapping(value="",method=RequestMethod.GET)
	public String admin(Criteria cri, Model model, HttpServletRequest request)throws Exception{
		String user_id = "admin";
		String user_image = "/overclass/resources/img/profile_default.png";
		String user_name = "°ü¸®ÀÚ";
		String report_id = "test1";
		String report_image = "/overclass/resources/img/juwon.PNG";
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_image", user_image);
		map.put("user_name", user_name);
		
		Map<String, Object> map2 = new HashMap<>();
		map2.put("report_id", report_id);
		map2.put("report_image", report_image);
		
		model.addAttribute("user",map);
		model.addAttribute("report",map2);
		//String user_id = (String) request.getSession().getAttribute("user_id");
		//String user_image = (String) request.getSession().getAttribute("user_id");
		/*List<DocumentDTO> list = service.mainFeed_list(cri, user_id);
		model.addAttribute("list", list);
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(service.mainFeed_count(user_id));*/
		/*		model.addAttribute("pageMaker", maker);*/
		
		return "admin/adminFeed";
	}
	
	@RequestMapping(value="/reportDoc",method=RequestMethod.POST)
	public String report(ReportVO vo, RedirectAttributes attr) throws Exception {
		service.report(vo);
		attr.addFlashAttribute("msg", "Write_SUCCESS");
		
		return "redirect:/main/myFeed";
	}
}
