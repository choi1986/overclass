package kr.co.overclass.domain;

public class Criteria {//�з��� ������ ǥ���ϴ� �Ӽ�
   private int page;//���� ������
   private int perPageNum;//�� �������� ������ ���ڵ� ��

   public Criteria() {
	  page=1;
	  perPageNum=10;
   }

   public void setPage(int page) {
	   this.page = page;
	   if(page<1)this.page=1;
   }

   public int getPage() {
	return page;
   }

   public void setPerPageNum(int perPageNum) {
	   this.perPageNum = perPageNum;	
   }

   public int getPerPageNum() {
		return perPageNum;
   }

   public int getPageStart(){//MyBatis���� ������ ��ŵ�� ���� ��
	   return  (page-1)*perPageNum;
   }
   
   @Override
	public String toString() {
		return "Criteria [������:"+page+", ������ ���� ��:"+perPageNum+"]";
	}
   
}



