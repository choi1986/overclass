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
	
	@RequestMapping(value = "/friendfunc")// 模备 夸没 涝仿
	public String friendMain(){
		return "addfunction/friendAdd";
	}
	
	// 模备眠啊夸没
	@RequestMapping(value="/addfriend", method=RequestMethod.POST)
	public ResponseEntity<String> addFriend(@RequestBody FriendVO vo){
		ResponseEntity<String> entity = null;
		vo.toString();
		try {
			if(service.findRel(vo) == 0){	// 模备啊 酒聪绊
				if(service.findReq(vo) == 0) {	// 模备夸没吝牢霸 绝栏搁 模备夸没
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
	
	// 模备眠啊夸没铰倡
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
	
	// 模备昏力
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
	
	
	// 模备夸没八祸
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
	
	// 模备夸没昏力
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
	
	/*@RequestMapping(value = "/deleteRel")// 模备 夸没 昏力 
	public String deleteFriendrel(String info,HttpSession session,Model model) throws Exception{// 模备 昏力
		UserVO user = (UserVO) session.getAttribute("login");
		String sender = user.getUser_id();//模备包拌 夸没 id
		String receiver = info;//模备包拌 罐绰 id
		FriendVO vo = new FriendVO(sender,receiver);
		service.delete_rel(vo);
		return "addfunction/friendList";//模备 夸没 涝仿 饶 皋牢 汽栏肺 倒酒埃促
	}
	
	@RequestMapping(value = "/selectReq")// 模备 夸没 八祸 
	public String selectFriendrel(String info,HttpSession session,Model model) throws Exception{// 模备 昏力
		UserVO user = (UserVO) session.getAttribute("login");
		String sender = user.getUser_id();//模备包拌 夸没 id
		String receiver = info;//模备包拌 罐绰 id
		FriendVO vo = new FriendVO(sender,receiver);
		//service.select_rel(vo);
		return "/addfunction/friendList";
	}*/
}
