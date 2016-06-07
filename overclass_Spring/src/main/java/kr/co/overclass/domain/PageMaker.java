package kr.co.overclass.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {//게시판 하단의 페이지 넘버에 대한 정보
   private int totalCount;//전체레코드수
   private int startPage;//시작넘버
   private int endPage;//끝넘버
   private boolean prev;//이전페이지
   private boolean next;//이후페이지
   
   private int displayPageNum=10;//한 화면에 보여질 레코드 수
   private Criteria cri;//현재페이지, 한 화면 보여질 레코드 수, skip될 레코드
   
   
   
   
public int getTotalCount() {
	return totalCount;
}
public void setTotalCount(int totalCount) {
	this.totalCount = totalCount;
	calcData();
}

   private void calcData(){
	 //예) 전체레코드:90개   한페이지출력레코드수:10개, 전체페이지수:9페이지
	 endPage= (int)(Math.ceil(cri.getPage()/(double)displayPageNum)
			 *displayPageNum); //하단출력)끝페이지 번호
	 //10
	 
     startPage = (endPage - displayPageNum) + 1; //하단출력)시작페이지 번호   
     //1
     
     int tempEndPage = //전체에서 마지막페이지 번호
    	(int)(Math.ceil(totalCount/(double) cri.getPerPageNum()));
     //9
     
     if(endPage> tempEndPage) endPage = tempEndPage;
     prev = startPage==1 ? false:true;// 첫페이지일 경우 prev비활성화
     next = endPage * cri.getPerPageNum() >= totalCount ? false :true;
     //마지막페이지일 경우 next비활성화
   }//calcData

   public String makeQuery(int page){
	   UriComponents uriComponents =
			UriComponentsBuilder.newInstance()
			.queryParam("page", page)
			.queryParam("perPageNum",cri.getPerPageNum())
			.build();
	   return uriComponents.toUriString();
   }//makeQuery
   
   public String makeSearch(int page){
	   UriComponents uriComponents =
			   UriComponentsBuilder.newInstance()
			   .queryParam("page", page)
			   .queryParam("perPageNum",cri.getPerPageNum())
	   //?searchType=타이틀
	   .queryParam("searchType", ((SearchCriteria)cri).getSearchType())
			   .queryParam("keyword", ((SearchCriteria)cri).getKeyword())
			   .build();
	   return uriComponents.toUriString();
   }//makeSearch



public int getStartPage() {
	return startPage;
}
public void setStartPage(int startPage) {
	this.startPage = startPage;
}
public int getEndPage() {
	return endPage;
}
public void setEndPage(int endPage) {
	this.endPage = endPage;
}
public boolean isPrev() {
	return prev;
}
public void setPrev(boolean prev) {
	this.prev = prev;
}
public boolean isNext() {
	return next;
}
public void setNext(boolean next) {
	this.next = next;
}
public int getDisplayPageNum() {
	return displayPageNum;
}
public void setDisplayPageNum(int displayPageNum) {
	this.displayPageNum = displayPageNum;
}
public Criteria getCri() {
	return cri;
}
public void setCri(Criteria cri) {
	this.cri = cri;
}
   
   
}
