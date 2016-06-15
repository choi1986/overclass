package kr.co.overclass.service;

import java.util.List;
import java.util.Map;

import kr.co.overclass.dto.GoodDTO;

public interface GoodService {
	public void insert(Map<String, Object> map) throws Exception;
	public void delete(Map<String, Object> map) throws Exception;
	public int count(int dno) throws Exception;
}
