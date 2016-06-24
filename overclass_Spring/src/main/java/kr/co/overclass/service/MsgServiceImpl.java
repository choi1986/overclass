package kr.co.overclass.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.co.overclass.EchoHandler;
import kr.co.overclass.domain.MsgwsVO;
import kr.co.overclass.dto.ChatFriendListDTO;
import kr.co.overclass.dto.MsgDTO;
import kr.co.overclass.persistence.MsgDAO;

@Repository
public class MsgServiceImpl implements MsgService {
	private static final Logger logger = LoggerFactory.getLogger(MsgServiceImpl.class);
	
	@Inject
	private MsgDAO dao;

	@Override
	public void write(MsgwsVO vo) throws Exception {
		dao.write(vo);
	}
	
	@Override
	public List<MsgDTO> sitebarDisplay(String user_id) throws Exception {
		logger.info("서비스임플 들어옴");
		List<MsgDTO> list = dao.sitebarDisplay(user_id);
		
		//*****************몇초전, 몇분전*******************
		String sFormat = "yyyyMMddHHmmss";	// 받은 날짜형식
		SimpleDateFormat fmt = new SimpleDateFormat(sFormat);
		
		for(int i=0;i<list.size();i++){
			Date msgtime = fmt.parse(list.get(i).getWritedate());	// DB에서 받은 시간값
			Date now = new Date();  // 현재시간
		
		//날짜 계산
		   //1000:밀리초, 60: 초, 60:분, 24: 시간
		   //원하는 단위까지 곱셉하면 됩니다.
		   //예) 시간 계산시 - 1000 * 60 * 60
			int ct = (int)((now.getTime() - msgtime.getTime()) / (1000));	// 초비교
			if( ct < 60){	// 60초가 안되었다면
				list.get(i).setWritedate(ct+"초");
			}else if( (ct/60) < 60) {	// 60분이 안되었다면
				list.get(i).setWritedate(ct/60+"분");
			}else if( (ct/(60*60)) < 24) {	// 24시간이 안되었다면
				list.get(i).setWritedate(ct/(60*60)+"시간");
			}else{
				list.get(i).setWritedate(ct/(60*60*24)+"일");
			}// if
		}
		//**************************************
		logger.info("리스트 리턴완료!");
		return list;
	}

	@Override
	public List<MsgDTO> read(String user_id) throws Exception {
		return null;
	}

	@Override
	public int count(String user_id) throws Exception {
		return dao.count(user_id);
	}

	@Override
	public List<ChatFriendListDTO> friendList(String user_id) throws Exception {
		return dao.friendList(user_id);
	}

	@Override
	public List<MsgDTO> chatList(Map<String, String> map) throws Exception {
		// 널체크를 해말아?
		List<MsgDTO> list = dao.chatList(map); 

		//*****************몇초전, 몇분전*******************
		String sFormat = "yyyyMMddHHmmss";	// 받은 날짜형식
		SimpleDateFormat fmt = new SimpleDateFormat(sFormat);

		for(int i=0;i<list.size();i++){
			Date msgtime = fmt.parse(list.get(i).getWritedate());	// DB에서 받은 시간값
			Date now = new Date();  // 현재시간

			//날짜 계산
			//1000:밀리초, 60: 초, 60:분, 24: 시간
			//원하는 단위까지 곱셉하면 됩니다.
			//예) 시간 계산시 - 1000 * 60 * 60
			int ct = (int)((now.getTime() - msgtime.getTime()) / (1000));	// 초비교
			if( ct < 60){	// 60초가 안되었다면
				list.get(i).setWritedate(ct+"초");
			}else if( (ct/60) < 60) {	// 60분이 안되었다면
				list.get(i).setWritedate(ct/60+"분");
			}else if( (ct/(60*60)) < 24) {	// 24시간이 안되었다면
				list.get(i).setWritedate(ct/(60*60)+"시간");
			}else{
				list.get(i).setWritedate(ct/(60*60*24)+"일");
			}// if
		}
		//**************************************
		
		return list;
	}
}