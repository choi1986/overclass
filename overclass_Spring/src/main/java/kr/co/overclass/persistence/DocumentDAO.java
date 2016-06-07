package kr.co.overclass.persistence;

import java.util.List;

import kr.co.overclass.domain.DocumentVO;

public interface DocumentDAO {
	public void create(DocumentVO vo) throws Exception; //�۾���
	public void delete(int dno)throws Exception; //Ư���� ����
	public List<DocumentVO> mainFeed_list() throws Exception; //�����ǵ� �Խñ� ��ȸ
	public int mainFeed_count(String writer, String sender, String receiver) throws Exception; //�����ǵ� �Խñ� ����
	public List<DocumentVO> myFeed_list() throws Exception; //�����ǵ� �Խñ� ��ȸ
	public int myFeed_count(String writer) throws Exception; //�����ǵ� �Խñ� ����
}
