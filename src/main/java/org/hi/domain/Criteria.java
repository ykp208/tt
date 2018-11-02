package org.hi.domain;

public class Criteria {
	private int page;	
	private int perPageNum;
	private int endpageNum;
	private int pageStart;
	
	public Criteria(){
		this.page = 1;
		this.perPageNum = 10;
		this.endpageNum =10;
		this.pageStart =1;
	}

	public void setPage(int page){
		
		if(page <= 0){
			this.page = 1;
			return;
		}
		
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum){
		
		if(perPageNum <= 0 || perPageNum > 100){
			this.perPageNum = 10;
			return;
		}
		
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}	
	
	//method for MyBatis SQL Mapper - 
	public int getPageStart() {
		
		return (this.page -1)* perPageNum+1;
	}
	
	//method for MyBatis SQL Mapper 
	public int getPerPageNum(){
		
		return this.perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}

	public int getEndpageNum() {
		
		return (this.page -1)* perPageNum + 10;
	}


	
	

}
