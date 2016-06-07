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
	
	//글쓰기
	@Override
	public void create(DocumentVO vo) throws Exception {
		dao.create(vo);
	}
	
	//특정 게시글 삭제
	@Override
	public void delete(int dno) throws Exception {
		dao.delete(dno);
	}
	
	//메인피드 게시글 조회
	@Override
	public List<DocumentVO> mainFeed_list(Criteria cri) throws Exception {
		return dao.mainFeed_list(cri);
	}
	
	//메인피드 게시글 개수
	@Override
	public int mainFeed_count(String user_id) throws Exception {
		return dao.mainFeed_count(user_id);
	}
	
	//마이피드 게시글 조회
	@Override
	public List<DocumentVO> myFeed_list(Criteria cri) throws Exception {
		return dao.myFeed_list(cri);
	}

	//마이피드 게시글 개수
	@Override
	public int myFeed_count(String user_id) throws Exception {
		return dao.myFeed_count(user_id);
	}
}
