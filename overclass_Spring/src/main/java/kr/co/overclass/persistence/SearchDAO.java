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
	public int count(String value)throws Exception;//����¡ ó������ �˻���� ��
	public Map<String,Object> pageMaker(String info,Criteria cri)throws Exception;//sql �����ϱ� ���� ����������Ŀ
}


