package kr.co.overclass.service;

import java.util.List;

import kr.co.overclass.domain.DocumentVO;

public interface DocumentService {
	public void create(DocumentVO vo) throws Exception; //글쓰기
	public void delete(int dno)throws Exception; //특정글 삭제
	public List<DocumentVO> mainFeed_list() throws Exception; //메인피드 게시글 조회
	public List<DocumentVO> myFeed_list() throws Exception; //마이피드 게시글 조회
}
