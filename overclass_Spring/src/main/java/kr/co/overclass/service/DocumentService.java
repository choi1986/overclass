package kr.co.overclass.service;

import java.util.List;

import kr.co.overclass.domain.DocumentVO;

public interface DocumentService {
	public void create(DocumentVO vo) throws Exception; //�۾���
	public void delete(int dno)throws Exception; //Ư���� ����
	public List<DocumentVO> mainFeed_list() throws Exception; //�����ǵ� �Խñ� ��ȸ
	public List<DocumentVO> myFeed_list() throws Exception; //�����ǵ� �Խñ� ��ȸ
}
