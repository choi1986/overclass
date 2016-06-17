package kr.co.overclass.service;

import java.util.List;
import java.util.Map;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.DocumentVO;
import kr.co.overclass.domain.SearchVO;
import kr.co.overclass.domain.UserVO;

public interface SearchService {
	public List<UserVO> select(SearchVO vo)throws Exception;//���̵� �̸� �˻�
	public List<DocumentVO> selectTag(SearchVO vo)throws Exception;//�±� �˻�
	public int countNameNum(String user_name)throws Exception;//����¡ ó������ �˻���� ��
	public int countIdNum(String user_id)throws Exception;//����¡ ó������ �˻���� ��
	public int countTagNum(String tag)throws Exception;//����¡ ó������ �˻���� ��
}


