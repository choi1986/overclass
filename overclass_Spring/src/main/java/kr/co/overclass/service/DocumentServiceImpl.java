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
	
	//글쓰기
	@Override
	public void create(DocumentVO vo) throws Exception {
		dao.create(vo);
	}
	
	//특정 게시글 삭제
	@Override
	public void delete(int dno) throws Exception {
		dao.delete(dno);
		System.out.println("글삭제완료: "+dno);
	}
	
	//메인피드 게시글 조회
	@Override
	public List<DocumentDTO> mainFeed_list(Criteria cri, String user_id) throws Exception {
		// dao에서 리스트 가져오기
		List<DocumentDTO> list = dao.mainFeed_list(cri, user_id);
		
		// 좋아요 가져오기 위한 map생성
		Map<String, Object> map = new HashMap<>();
		map.put("good_user", user_id);
		
		// 출력한 게시글 넘버 String 생성
		int dnonum[] = new int[list.size()];
		for(int i = 0; i<list.size() ; i++){
			// dnonum에 출력할 dno들 입력
			dnonum[i] = list.get(i).getDno();
		}
		map.put("dnonum", dnonum);
		
		if(dnonum.length == 0) {
			return list;
		}
		
		// DB에서 굿을 했는지 리스트를 받아옴
		List<GoodDTO> goodlist = good_dao.search(map);
		// DB에서 굿 카운트 받아옴
		List<GoodDTO> goodcount = good_dao.count(map);
		// DB에서 댓글 카운트 받아옴
		List<ReplyCountDTO> replycount = reply_dao.count(map); 
		
		for(int i = 0; i<list.size() ; i++) {
			list.get(i).setGood(0);
			list.get(i).setGoodcnt(0);
			for(int j = 0; j<goodlist.size();j++) {
				// 받아온 리스트의 글번호와, 조회된 리스트의 글번호가 일치하는지를 검사 (일치 = 굿을 했다는뜻)
				if(list.get(i).getDno() == goodlist.get(j).getDno()) {
					list.get(i).setGood(1);
				}
			}
			for(int j = 0; j<goodcount.size();j++){
				// 굿이 몇개되었는지 카운트해서 일치하는 dno에 입력
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
	
	//메인피드 게시글 개수
	@Override
	public int mainFeed_count(String user_id) throws Exception {
		return dao.mainFeed_count(user_id);
	}
	
	//마이피드 게시글 조회
	@Override
	public List<DocumentDTO> myFeed_list(Criteria cri, String user_id) throws Exception {
		return dao.myFeed_list(cri, user_id);
	}

	//마이피드 게시글 개수
	@Override
	public int myFeed_count(String user_id) throws Exception {
		return dao.myFeed_count(user_id);
	}

	@Override
	public DocumentDTO read_doc(int dno) throws Exception{
		return dao.read_doc(dno);
	}
}
