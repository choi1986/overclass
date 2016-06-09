package kr.co.overclass.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.DocumentVO;
import kr.co.overclass.persistence.DocumentDAO;

@Service
public class DocumentServiceImpl implements DocumentService {
	
	@Inject
	private DocumentDAO dao;
	
	//�۾���
	@Override
	public void create(DocumentVO vo) throws Exception {
		dao.create(vo);
	}
	
	//Ư�� �Խñ� ����
	@Override
	public void delete(int dno) throws Exception {
		dao.delete(dno);
	}
	
	//�����ǵ� �Խñ� ��ȸ
	@Override
	public List<DocumentVO> mainFeed_list(Criteria cri, String user_id) throws Exception {
		return dao.mainFeed_list(cri, user_id);
	}
	
	//�����ǵ� �Խñ� ����
	@Override
	public int mainFeed_count(String user_id) throws Exception {
		return dao.mainFeed_count(user_id);
	}
	
	//�����ǵ� �Խñ� ��ȸ
	@Override
	public List<DocumentVO> myFeed_list(Criteria cri, String user_id) throws Exception {
		return dao.myFeed_list(cri, user_id);
	}

	//�����ǵ� �Խñ� ����
	@Override
	public int myFeed_count(String user_id) throws Exception {
		return dao.myFeed_count(user_id);
	}
}
