package kr.co.overclass.persistence;

import java.util.List;
import java.util.Map;

import kr.co.overclass.dto.GoodDTO;

public interface GoodDAO {
	public List<GoodDTO> search(Map<String, Object> map) throws Exception;
	public void insert(Map<String, Object> map) throws Exception;
	public void delete(Map<String, Object> map) throws Exception;
	public List<GoodDTO> count(Map<String, Object> map) throws Exception;
	public int good_count(int dno) throws Exception;
}
