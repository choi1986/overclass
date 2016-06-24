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
		logger.info("�������� ����");
		List<MsgDTO> list = dao.sitebarDisplay(user_id);
		
		//*****************������, �����*******************
		String sFormat = "yyyyMMddHHmmss";	// ���� ��¥����
		SimpleDateFormat fmt = new SimpleDateFormat(sFormat);
		
		for(int i=0;i<list.size();i++){
			Date msgtime = fmt.parse(list.get(i).getWritedate());	// DB���� ���� �ð���
			Date now = new Date();  // ����ð�
		
		//��¥ ���
		   //1000:�и���, 60: ��, 60:��, 24: �ð�
		   //���ϴ� �������� �����ϸ� �˴ϴ�.
		   //��) �ð� ���� - 1000 * 60 * 60
			int ct = (int)((now.getTime() - msgtime.getTime()) / (1000));	// �ʺ�
			if( ct < 60){	// 60�ʰ� �ȵǾ��ٸ�
				list.get(i).setWritedate(ct+"��");
			}else if( (ct/60) < 60) {	// 60���� �ȵǾ��ٸ�
				list.get(i).setWritedate(ct/60+"��");
			}else if( (ct/(60*60)) < 24) {	// 24�ð��� �ȵǾ��ٸ�
				list.get(i).setWritedate(ct/(60*60)+"�ð�");
			}else{
				list.get(i).setWritedate(ct/(60*60*24)+"��");
			}// if
		}
		//**************************************
		logger.info("����Ʈ ���ϿϷ�!");
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
		// ��üũ�� �ظ���?
		List<MsgDTO> list = dao.chatList(map); 

		//*****************������, �����*******************
		String sFormat = "yyyyMMddHHmmss";	// ���� ��¥����
		SimpleDateFormat fmt = new SimpleDateFormat(sFormat);

		for(int i=0;i<list.size();i++){
			Date msgtime = fmt.parse(list.get(i).getWritedate());	// DB���� ���� �ð���
			Date now = new Date();  // ����ð�

			//��¥ ���
			//1000:�и���, 60: ��, 60:��, 24: �ð�
			//���ϴ� �������� �����ϸ� �˴ϴ�.
			//��) �ð� ���� - 1000 * 60 * 60
			int ct = (int)((now.getTime() - msgtime.getTime()) / (1000));	// �ʺ�
			if( ct < 60){	// 60�ʰ� �ȵǾ��ٸ�
				list.get(i).setWritedate(ct+"��");
			}else if( (ct/60) < 60) {	// 60���� �ȵǾ��ٸ�
				list.get(i).setWritedate(ct/60+"��");
			}else if( (ct/(60*60)) < 24) {	// 24�ð��� �ȵǾ��ٸ�
				list.get(i).setWritedate(ct/(60*60)+"�ð�");
			}else{
				list.get(i).setWritedate(ct/(60*60*24)+"��");
			}// if
		}
		//**************************************
		
		return list;
	}
}