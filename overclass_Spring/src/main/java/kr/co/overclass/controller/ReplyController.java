package kr.co.overclass.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.PageMaker;
import kr.co.overclass.domain.ReplyVO;
import kr.co.overclass.domain.UserVO;
import kr.co.overclass.dto.ReplyDTO;
import kr.co.overclass.service.ReplyService;

@RestController
@RequestMapping("/reply")
public class ReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Inject
	private ReplyService service;
	
	@RequestMapping(value="/list/{dno}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> replyList(@PathVariable("dno") int dno,
			@PathVariable("page") int page) {
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			Criteria cri = new Criteria();
			cri.setPage(page);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			//pageMaker.setTotalCount(1);
			pageMaker.setTotalCount(service.countReply(dno));
			
			Map<String, Object> map = new HashMap<String, Object>();
			List<ReplyDTO> list = service.listReply(dno,cri);
			map.put("list", list);
			map.put("pageMaker", pageMaker);
			
			entity = new ResponseEntity<Map<String, Object>>(map,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/", method=RequestMethod.POST)
	public ResponseEntity<String> replyWrite(@RequestBody ReplyVO vo) {
		
		ResponseEntity<String> entity = null;
		try {
			vo.setRno(0);
			service.addReply(vo);
			logger.info("댓글등록자 : "+vo.getReplyer());
			logger.info("댓글등록내용 : "+vo.getContent());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/{rno}", method=RequestMethod.DELETE)
	public ResponseEntity<String> replyRemove(@PathVariable("rno") int rno, String user_id) {
		
		ResponseEntity<String> entity = null;
		logger.info("삭제요청된 댓글번호 : "+rno);
		logger.info("로그인된 유저아이디 : "+user_id);
		try {
			if(service.removeReply(rno,user_id)){
				entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			}else {
				entity = new ResponseEntity<String>("FAIL",HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
