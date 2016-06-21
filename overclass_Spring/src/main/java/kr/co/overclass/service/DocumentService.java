package kr.co.overclass.service;

import java.util.List;
import java.util.Map;

import kr.co.overclass.domain.Criteria;
import kr.co.overclass.domain.DocumentVO;
import kr.co.overclass.domain.UserVO;
import kr.co.overclass.dto.DocumentDTO;

public interface DocumentService {
	public void create(DocumentVO vo) throws Exception; //글쓰기
	public void delete(int dno)throws Exception; //특정글 삭제
	public List<DocumentDTO> mainFeed_list(Criteria cri, String user_id) throws Exception; //메인피드 게시글 조회
	public int mainFeed_count(String user_id) throws Exception; //메인피드 게시글 개수
	public List<DocumentDTO> myFeed_list(Criteria cri, String user_id) throws Exception; //마이피드 게시글 조회
	public int myFeed_count(String user_id) throws Exception; //마이피드 게시글 개수
	public void imageUpdate(Map<String, String> map) throws Exception;
	public DocumentDTO read_doc(int dno) throws Exception;//글 1건 조회
}
