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
	public Map<String,Object> pageMaker(String info,Criteria cri)throws Exception;//sql �����ϱ� ���� ����������Ŀ
	public int countNum(String value)throws Exception;//����¡ ó������ �˻���� ��
}


