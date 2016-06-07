package kr.co.overclass.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.overclass.domain.DocumentVO;

@Repository
public class DocumentDAOImpl implements DocumentDAO{
	
	@Inject
	private SqlSession session;
	
	@Override
	public void create(DocumentVO vo) throws Exception { //�۾���
		session.insert("document.insert", vo);
	}
	
	@Override
	public void delete(int dno) throws Exception { //Ư�� �Խñ� ����
		session.delete("document.delete", dno);
	}

	@Override
	public List<DocumentVO> mainFeed_list() throws Exception { //�����ǵ� �Խñ� ��ȸ
		return session.selectList("document.mainFeed_list");
	}

	@Override
	public int mainFeed_count(String writer, String sender, String receiver) 
			throws Exception { //�����ǵ� �Խñ� ����
		Map<String, String> map = new HashMap<String, String>();
		map.put("writer", writer);
		map.put("sender", sender);
		map.put("receiver", receiver);
		return session.selectOne("document.mainFeed_count", map);
	}

	@Override
	public List<DocumentVO> myFeed_list() throws Exception { //�����ǵ� �Խñ� ��ȸ
		return session.selectList("document.myFeed_list");
	}

	@Override
	public int myFeed_count(String writer) throws Exception { //�����ǵ� �Խñ� ����
		return session.selectOne("document.mainFeed_count", writer);
	}
}
