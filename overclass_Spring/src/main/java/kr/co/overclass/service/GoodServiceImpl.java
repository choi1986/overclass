package kr.co.overclass.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.overclass.dto.GoodDTO;
import kr.co.overclass.persistence.GoodDAO;

@Service
public class GoodServiceImpl implements GoodService {
	
	@Inject
	private GoodDAO dao;

	@Override
	public void insert(Map<String, Object> map) throws Exception {
		dao.insert(map);
	}

	@Override
	public void delete(Map<String, Object> map) throws Exception {
		dao.delete(map);
	}

	@Override
	public int count(int dno) throws Exception {
		return dao.good_count(dno);
	}

}
