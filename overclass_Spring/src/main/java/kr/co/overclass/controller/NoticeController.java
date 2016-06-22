package kr.co.overclass.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.overclass.service.NoticeService;

@Controller
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	private NoticeService notice;
	
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public String searchMain(){
		return "/addfunction/notice";//search요청시 검색 메인 페이지로 이동
	}
}
