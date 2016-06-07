package kr.co.overclass.persistence;

import java.util.List;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.DocumentVO;

public interface DocumentDAO {
	public void create(DocumentVO vo) throws Exception; //�۾���
	public void delete(int dno)throws Exception; //Ư���� ����
	public List<DocumentVO> mainFeed_list(Criteria cri) throws Exception; //�����ǵ� �Խñ� ��ȸ
	public int mainFeed_count(String user_id) throws Exception; //�����ǵ� �Խñ� ����
	public List<DocumentVO> myFeed_list(Criteria cri) throws Exception; //�����ǵ� �Խñ� ��ȸ
	public int myFeed_count(String user_id) throws Exception; //�����ǵ� �Խñ� ����
}
