package kr.co.overclass.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.co.overclass.controller.GoodController;
import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.DocumentVO;
import kr.co.overclass.domain.UserVO;
import kr.co.overclass.dto.DocumentDTO;
import kr.co.overclass.dto.GoodDTO;
import kr.co.overclass.dto.ReplyCountDTO;
import kr.co.overclass.persistence.DocumentDAO;
import kr.co.overclass.persistence.GoodDAO;
import kr.co.overclass.persistence.ReplyDAO;

@Service
public class DocumentServiceImpl implements DocumentService {
	
	private static final Logger logger = LoggerFactory.getLogger(DocumentServiceImpl.class);
	
	@Inject
	private DocumentDAO dao;
	
	@Inject
	private ReplyDAO reply_dao;
	
	@Inject
	private GoodDAO good_dao;
	
	//�۾���
	@Override
	public void create(DocumentVO vo) throws Exception {
		dao.create(vo);
	}
	
	//Ư�� �Խñ� ����
	@Override
	public void delete(int dno) throws Exception {
		dao.delete(dno);
		System.out.println("�ۻ����Ϸ�: "+dno);
	}
	
	//�����ǵ� �Խñ� ��ȸ
	@Override
	public List<DocumentDTO> mainFeed_list(Criteria cri, String user_id) throws Exception {
		// dao���� ����Ʈ ��������
		List<DocumentDTO> list = dao.mainFeed_list(cri, user_id);
		
		// ���ƿ� �������� ���� map����
		Map<String, Object> map = new HashMap<>();
		map.put("good_user", user_id);
		
		// ����� �Խñ� �ѹ� String ����
		int dnonum[] = new int[list.size()];
		for(int i = 0; i<list.size() ; i++){
			// dnonum�� ����� dno�� �Է�
			dnonum[i] = list.get(i).getDno();
		}
		map.put("dnonum", dnonum);
		
		if(dnonum.length == 0) {
			return list;
		}
		
		// DB���� ���� �ߴ��� ����Ʈ�� �޾ƿ�
		List<GoodDTO> goodlist = good_dao.search(map);
		// DB���� �� ī��Ʈ �޾ƿ�
		List<GoodDTO> goodcount = good_dao.count(map);
		// DB���� ��� ī��Ʈ �޾ƿ�
		List<ReplyCountDTO> replycount = reply_dao.count(map); 
		
		for(int i = 0; i<list.size() ; i++) {
			list.get(i).setGood(0);
			list.get(i).setGoodcnt(0);
			for(int j = 0; j<goodlist.size();j++) {
				// �޾ƿ� ����Ʈ�� �۹�ȣ��, ��ȸ�� ����Ʈ�� �۹�ȣ�� ��ġ�ϴ����� �˻� (��ġ = ���� �ߴٴ¶�)
				if(list.get(i).getDno() == goodlist.get(j).getDno()) {
					list.get(i).setGood(1);
				}
			}
			for(int j = 0; j<goodcount.size();j++){
				// ���� ��Ǿ����� ī��Ʈ�ؼ� ��ġ�ϴ� dno�� �Է�
				if(list.get(i).getDno() == goodcount.get(j).getDno()) {
					list.get(i).setGoodcnt(goodcount.get(j).getGood());
					
				}
			}
			list.get(i).setReplycnt(0);
			for(int k = 0; k<replycount.size();k++){
				if(list.get(i).getDno() == replycount.get(k).getDno()) {
					list.get(i).setReplycnt(replycount.get(k).getCount());
				}
			}
		}
		return list;
	}
	
	//�����ǵ� �Խñ� ����
	@Override
	public int mainFeed_count(String user_id) throws Exception {
		return dao.mainFeed_count(user_id);
	}
	
	//�����ǵ� �Խñ� ��ȸ
	@Override
	public List<DocumentDTO> myFeed_list(Criteria cri, String user_id) throws Exception {
		return dao.myFeed_list(cri, user_id);
	}

	//�����ǵ� �Խñ� ����
	@Override
	public int myFeed_count(String user_id) throws Exception {
		return dao.myFeed_count(user_id);
	}

	@Override
	public DocumentDTO read_doc(int dno) throws Exception{
		return dao.read_doc(dno);
	}
}
