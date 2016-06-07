package kr.co.overclass.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {//�Խ��� �ϴ��� ������ �ѹ��� ���� ����
   private int totalCount;//��ü���ڵ��
   private int startPage;//���۳ѹ�
   private int endPage;//���ѹ�
   private boolean prev;//����������
   private boolean next;//����������
   
   private int displayPageNum=10;//�� ȭ�鿡 ������ ���ڵ� ��
   private Criteria cri;//����������, �� ȭ�� ������ ���ڵ� ��, skip�� ���ڵ�
   
   
   
   
public int getTotalCount() {
	return totalCount;
}
public void setTotalCount(int totalCount) {
	this.totalCount = totalCount;
	calcData();
}

   private void calcData(){
	 //��) ��ü���ڵ�:90��   ����������·��ڵ��:10��, ��ü��������:9������
	 endPage= (int)(Math.ceil(cri.getPage()/(double)displayPageNum)
			 *displayPageNum); //�ϴ����)�������� ��ȣ
	 //10
	 
     startPage = (endPage - displayPageNum) + 1; //�ϴ����)���������� ��ȣ   
     //1
     
     int tempEndPage = //��ü���� ������������ ��ȣ
    	(int)(Math.ceil(totalCount/(double) cri.getPerPageNum()));
     //9
     
     if(endPage> tempEndPage) endPage = tempEndPage;
     prev = startPage==1 ? false:true;// ù�������� ��� prev��Ȱ��ȭ
     next = endPage * cri.getPerPageNum() >= totalCount ? false :true;
     //�������������� ��� next��Ȱ��ȭ
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
	   //?searchType=Ÿ��Ʋ
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
