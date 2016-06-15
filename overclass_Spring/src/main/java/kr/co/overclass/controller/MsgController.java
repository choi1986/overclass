package kr.co.overclass.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/msg")
public class MsgController {
	private static final Logger logger = LoggerFactory.getLogger(GoodController.class);
	
	@RequestMapping("/")
	public ResponseEntity<String> sitebarDisplay(){
		ResponseEntity<String> entity = null;
		
		
		
		return entity;
	}
}
