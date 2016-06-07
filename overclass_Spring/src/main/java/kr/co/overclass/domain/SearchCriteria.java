package kr.co.overclass.domain;

public class SearchCriteria extends Criteria{

	private String searchType;
	private String keyword;
	
	@Override
	public String toString() {
		return "SearchCriteria [검색종류: "+searchType+
				     ", 키워드: "+keyword+"]";
	}
	
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	
}
