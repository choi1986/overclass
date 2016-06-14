package kr.co.overclass.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.overclass.service.GoodService;

@RestController
@RequestMapping("/good")
public class GoodController {
	private static final Logger logger = LoggerFactory.getLogger(GoodController.class);
	
	@Inject
	private GoodService service;
	
/*	@RequestMapping(value="/", method=RequestMethod.POST)
	public ResponseEntity<String> goodSearch()*/
	
}
