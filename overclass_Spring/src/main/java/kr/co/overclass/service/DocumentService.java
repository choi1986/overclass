package kr.co.overclass.service;

import java.util.List;
import java.util.Map;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.DocumentVO;
import kr.co.overclass.domain.UserVO;
import kr.co.overclass.dto.DocumentDTO;

public interface DocumentService {
	public void create(DocumentVO vo) throws Exception; //�۾���
	public void delete(int dno)throws Exception; //Ư���� ����
	public List<DocumentDTO> mainFeed_list(Criteria cri, String user_id) throws Exception; //�����ǵ� �Խñ� ��ȸ
	public int mainFeed_count(String user_id) throws Exception; //�����ǵ� �Խñ� ����
	public List<DocumentDTO> myFeed_list(Criteria cri, String user_id) throws Exception; //�����ǵ� �Խñ� ��ȸ
	public int myFeed_count(String user_id) throws Exception; //�����ǵ� �Խñ� ����
	public void imageUpdate(Map<String, String> map) throws Exception;
	public DocumentDTO read_doc(int dno) throws Exception;//�� 1�� ��ȸ
}
