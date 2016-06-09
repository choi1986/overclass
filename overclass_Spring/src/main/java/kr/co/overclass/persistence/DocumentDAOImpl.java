package kr.co.overclass.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.DocumentVO;

@Repository
public class DocumentDAOImpl implements DocumentDAO{
	
	@Inject
	private SqlSession session;
	
	@Override
	public void create(DocumentVO vo) throws Exception { //글쓰기
		session.insert("document.insert", vo);
	}
	
	@Override
	public void delete(int dno) throws Exception { //특정 게시글 삭제
		session.delete("document.delete", dno);
	}

	@Override
	public List<DocumentVO> mainFeed_list(Criteria cri, String user_id) throws Exception { //메인피드 게시글 조회
		return session.selectList("document.mainFeed_list", user_id, 
				new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	@Override
	public int mainFeed_count(String user_id) throws Exception { //메인피드 게시글 개수
		return session.selectOne("document.mainFeed_count", user_id);
	}

	@Override
	public List<DocumentVO> myFeed_list(Criteria cri, String user_id) throws Exception { //마이피드 게시글 조회
		return session.selectList("document.myFeed_list", user_id, 
				new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	@Override
	public int myFeed_count(String user_id) throws Exception { //마이피드 게시글 개수
		return session.selectOne("document.mainFeed_count", user_id);
	}
}
