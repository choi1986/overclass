package kr.co.overclass.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.overclass.domain.GoodVO;
import kr.co.overclass.service.GoodService;

@RestController
@RequestMapping("/good")
public class GoodController {
	private static final Logger logger = LoggerFactory.getLogger(GoodController.class);
	
	@Inject
	private GoodService service;
	
	@RequestMapping(value="/", method=RequestMethod.POST)
	public ResponseEntity<String> goodInsert(@RequestBody GoodVO vo){
		// ���ƿ並 ���ָ鼭, ��ȯ������ ���� �� �Խù��� ���ƿ� ������ �ѱ�
		ResponseEntity<String> entity = null;
		
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("dno", vo.getDno());
			map.put("good_user", vo.getGood_user());
			service.insert(map);
			logger.info("���ƿ� �۹�ȣ : "+vo.getDno());
			
			int good_count = service.count(vo.getDno());
			logger.info(vo.getDno()+"�� ���� ���ƿ� ���� : "+good_count);
			entity = new ResponseEntity<String>(good_count+"", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public ResponseEntity<String> goodDelete(@RequestBody GoodVO vo){
		// ���ƿ並 ��� ���ָ鼭, ��ȯ������ ���� �� �Խù��� ���ƿ� ������ �ѱ�
		ResponseEntity<String> entity = null;
		
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("dno", vo.getDno());
			map.put("good_user", vo.getGood_user());
			service.delete(map);
			logger.info("���ƿ����� �۹�ȣ : "+vo.getDno());
			
			int good_count = service.count(vo.getDno());
			logger.info(vo.getDno()+"�� ���� ���ƿ� ���� : "+good_count);
			entity = new ResponseEntity<String>(good_count+"", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
