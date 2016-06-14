package kr.co.overclass.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.PageMaker;
import kr.co.overclass.dto.DocumentDTO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger
    = LoggerFactory.getLogger(AdminController.class);
	
	
	@RequestMapping(value="",method=RequestMethod.GET)
	public String admin(Criteria cri, Model model, HttpServletRequest request)throws Exception{
		String user_id = "admin";
		String user_image = "/overclass/resources/img/profile_default.png";
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_image", user_image);
		//String user_id = (String) request.getSession().getAttribute("user_id");
		//String user_image = (String) request.getSession().getAttribute("user_id");
		/*List<DocumentDTO> list = service.mainFeed_list(cri, user_id);
		model.addAttribute("user",map);
		model.addAttribute("list", list);
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(service.mainFeed_count(user_id));*/
/*		model.addAttribute("pageMaker", maker);*/
		
		return "document/mainForm";
	}
}
