package org.hi.domain;

public class SearchCriteria extends Criteria{
	private String dateFirst;
	private String dateEnd;
	private String reg_user;
	private String title;
	private String y;
	private String n;
	
	
	
	public String getDateFirst() {
		return dateFirst;
	}



	public void setDateFirst(String dateFirst) {
		this.dateFirst = dateFirst;
	}



	public String getDateEnd() {
		return dateEnd;
	}



	public void setDateEnd(String dateEnd) {
		this.dateEnd = dateEnd;
	}



	public String getReg_user() {
		return reg_user;
	}



	public void setReg_user(String reg_user) {
		this.reg_user = reg_user;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getY() {
		return y;
	}



	public void setY(String y) {
		this.y = y;
	}



	public String getN() {
		return n;
	}



	public void setN(String n) {
		this.n = n;
	}



	@Override
	public String toString() {
		return reg_user+"=reg_user, "+
			   dateFirst+"=fdate,  "+
			    dateEnd+"=edate,  "+
				title+"=title,   "+
				n+"=n,  "+
				y+"=y,"+
				getEndpageNum()+"=endpageNum"+
				getPageStart()+"=pageStart"
				;
	}
}
