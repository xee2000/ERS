package kr.ac.ers.command;

public class SearchCriteria {
	
	private int page;
	private int perPageNum;
	private String keyword;
	private String searchType;
	
	
	public int getPage() {
		return page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public String getKeyword() {
		return keyword;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public void setPage(String page) {
		this.page = Integer.parseInt(page);
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	public void setPerPageNum(String perPageNum) {
		this.perPageNum = Integer.parseInt(perPageNum);
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	
	
	public int getStartRowNum() {
		return (this.page-1)* this.perPageNum;
	}
	
	
}








