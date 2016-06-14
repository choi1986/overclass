package kr.co.overclass.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.co.overclass.dto.GoodDTO;

@Repository
public class GoodDAOImpl implements GoodDAO {
	private static final Logger logger = LoggerFactory.getLogger(GoodDAOImpl.class);
	
	@Inject
	private SqlSession session;
	
	@Override
	public void insert(Map<String, Object> map) throws Exception {
		session.insert("good.insert",map);
	}

	@Override
	public List<GoodDTO> search(Map<String, Object> map) throws Exception {
		return session.selectList("good.search", map);
	}

	@Override
	public void delete(Map<String, Object> map) throws Exception {
		session.delete("good.delete",map);
	}

}
