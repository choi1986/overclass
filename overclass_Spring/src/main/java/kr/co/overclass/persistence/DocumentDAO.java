package kr.co.overclass.persistence;

import java.util.List;

import kr.co.overclass.domain.DocumentVO;

public interface DocumentDAO {
	public void create(DocumentVO vo) throws Exception; //글쓰기
	public void delete(int dno)throws Exception; //특정글 삭제
	public List<DocumentVO> mainFeed_list() throws Exception; //메인피드 게시글 조회
	public int mainFeed_count(String writer, String sender, String receiver) throws Exception; //메인피드 게시글 개수
	public List<DocumentVO> myFeed_list() throws Exception; //마이피드 게시글 조회
	public int myFeed_count(String writer) throws Exception; //마이피드 게시글 개수
}
