package kr.co.overclass.persistence;

import java.util.List;
import java.util.Map;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.DocumentVO;
import kr.co.overclass.domain.SearchVO;
import kr.co.overclass.domain.UserVO;

public interface SearchDAO {
	public List<UserVO> search(SearchVO vo)throws Exception;//���̵� �̸� �˻�
	public List<DocumentVO> searchTag(SearchVO vo)throws Exception;//�±� �˻�
	public int countName(String user_name)throws Exception;//����¡ ó������ �˻���� ��
	public int countId(String user_id)throws Exception;//����¡ ó������ �˻���� ��
	public int countTag(String tag)throws Exception;//����¡ ó������ �˻���� ��
}


