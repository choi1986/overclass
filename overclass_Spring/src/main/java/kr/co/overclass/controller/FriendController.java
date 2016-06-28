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

import kr.co.overclass.domain.FriendVO;
import kr.co.overclass.service.FriendService;


@RestController
@RequestMapping("/friend")
public class FriendController {
	private static final Logger logger = LoggerFactory.getLogger(FriendController.class);
	
	@Inject
	private FriendService service;
	
	@RequestMapping(value = "/friendfunc")// ģ�� ��û �Է�
	public String friendMain(){
		return "addfunction/friendAdd";
	}
	
	// ģ���߰���û
	@RequestMapping(value="/addfriend", method=RequestMethod.POST)
	public ResponseEntity<String> addFriend(@RequestBody FriendVO vo){
		ResponseEntity<String> entity = null;
		vo.toString();
		try {
			if(service.findRel(vo) == 0){	// ģ���� �ƴϰ�
				if(service.findReq(vo) == 0) {	// ģ����û���ΰ� ������ ģ����û
					service.insert_req(vo);
					entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
				}else{
					entity = new ResponseEntity<String>("DUPLICATE",HttpStatus.OK);
				}
			}else{
				entity = new ResponseEntity<String>("ALREADY",HttpStatus.OK);
			}
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// ģ���߰���û�³�
	@RequestMapping(value="/applyfriend", method=RequestMethod.POST)
	public ResponseEntity<String> applyFriend(@RequestBody FriendVO vo){
		ResponseEntity<String> entity = null;
		
		try {
				service.insert_rel(vo);
				service.delete_req(vo);
				entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// ģ������
	@RequestMapping(value="/delrel", method=RequestMethod.POST)
	public ResponseEntity<String> delFriend(@RequestBody FriendVO vo){
		ResponseEntity<String> entity = null;
		
		try {
				service.delete_rel(vo);
				entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	// ģ����û�˻�
	@RequestMapping(value="/searchreq", method=RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> searchReq(@RequestBody FriendVO vo){
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			List<FriendVO> list = service.select_req_receive(vo.getReceiver());
			
			Map<String, Object> map = new HashMap<>();
			map.put("list", list);
			map.put("count", list.size());
			entity = new ResponseEntity<Map<String, Object>>(map,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
			logger.error(e.getMessage());
		}
		return entity;
	}
	
	// ģ����û����
	@RequestMapping(value="/delreq", method=RequestMethod.POST)
	public ResponseEntity<String> reqFriendDel(@RequestBody FriendVO vo){
		ResponseEntity<String> entity = null;
		
		try {
				service.delete_req(vo);
				entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	/*@RequestMapping(value = "/deleteRel")// ģ�� ��û ���� 
	public String deleteFriendrel(String info,HttpSession session,Model model) throws Exception{// ģ�� ����
		UserVO user = (UserVO) session.getAttribute("login");
		String sender = user.getUser_id();//ģ������ ��û id
		String receiver = info;//ģ������ �޴� id
		FriendVO vo = new FriendVO(sender,receiver);
		service.delete_rel(vo);
		return "addfunction/friendList";//ģ�� ��û �Է� �� ���� ������ ���ư���
	}
	
	@RequestMapping(value = "/selectReq")// ģ�� ��û �˻� 
	public String selectFriendrel(String info,HttpSession session,Model model) throws Exception{// ģ�� ����
		UserVO user = (UserVO) session.getAttribute("login");
		String sender = user.getUser_id();//ģ������ ��û id
		String receiver = info;//ģ������ �޴� id
		FriendVO vo = new FriendVO(sender,receiver);
		//service.select_rel(vo);
		return "/addfunction/friendList";
	}*/
}
