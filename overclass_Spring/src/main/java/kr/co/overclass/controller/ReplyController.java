package kr.co.overclass.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;import javax.net.ssl.HttpsURLConnection;

import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.overclass.domain.ReplyVO;
import kr.co.overclass.service.ReplyService;

@RestController
@RequestMapping("value=/reply")
public class ReplyController {
	
	@Inject
	private ReplyService service;
	
	@RequestMapping(value="/list/{dno}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> replyList(@PathVariable("dno") int dno, @PathVariable("page") int page) {
		ResponseEntity<List<ReplyVO>> entity = null;
		
		List<ReplyVO> list;
		try {
			list = service.listReply(dno);
			entity = new ResponseEntity<List<ReplyVO>>(list,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<ReplyVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/", method=RequestMethod.POST)
	public ResponseEntity<String> replyWrite(@RequestBody ReplyVO vo) {
		
		ResponseEntity<String> entity = null;
		try {
			service.addReply(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/{rno}", method=RequestMethod.DELETE)
	public ResponseEntity<String> replyRemove(@PathVariable("rno") int rno) {
		
		ResponseEntity<String> entity = null;
		try {
			service.removeReply(rno);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
