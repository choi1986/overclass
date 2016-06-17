package kr.co.overclass.controller;

import java.util.HashMap;
import java.util.List;
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

import kr.co.overclass.domain.MsgVO;
import kr.co.overclass.dto.MsgDTO;
import kr.co.overclass.service.MsgService;

@RestController
@RequestMapping("/msg")
public class MsgController {
	private static final Logger logger = LoggerFactory.getLogger(MsgController.class);
	
	@Inject
	private MsgService service;
	
	@RequestMapping(value="/sitebar",method=RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> sitebarDisplay(String user_id){
		ResponseEntity<Map<String,Object>> entity = null;
		
		try {
			// 새로온 쪽지 4개 리스트
			List<MsgDTO> list = service.sitebarDisplay(user_id);
			// 새로온 확인하지 않은 쪽지 갯수
			int count = service.count(user_id);
			logger.info("유저아이디:"+user_id+" 확인하지 않은 쪽지 : "+count);
			
			Map<String,Object> map = new HashMap<>();
			map.put("list", list);
			map.put("count", count);
			
			entity = new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/write",method=RequestMethod.POST)
	public ResponseEntity<String> write(@RequestBody MsgVO vo) {
		ResponseEntity<String> entity = null;
		
		try {
			service.write(vo);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/sitebarCount",method=RequestMethod.POST)
	public ResponseEntity<Integer> count(String user_id){
		ResponseEntity<Integer> entity = null;
		
		try {
			int count = service.count(user_id);
			logger.info("새로온쪽지수:"+count);
			entity = new ResponseEntity<Integer>(count,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
