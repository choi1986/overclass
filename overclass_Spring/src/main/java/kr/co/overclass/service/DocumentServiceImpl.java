package kr.co.overclass.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.overclass.domain.DocumentVO;
import kr.co.overclass.persistence.DocumentDAO;

@Service
public class DocumentServiceImpl implements DocumentService {
	
	@Inject
	private DocumentDAO dao;

	@Override
	public void create(DocumentVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public void delete(int dno) throws Exception {
		dao.delete(dno);
	}

	@Override
	public List<DocumentVO> mainFeed_list() throws Exception {
		return dao.mainFeed_list();
	}

	@Override
	public List<DocumentVO> myFeed_list() throws Exception {
		return dao.myFeed_list();
	}
}
