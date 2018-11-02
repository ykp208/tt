package org.hi.domain;

public class BoardVO {

	

	private String board_id;
	private String title;
	private String content;
	private String reg_datetime;
	private String reg_user;
	private String delete_flag;
	private String email;
	private String phone;
	private int bno;
	private int rn;
	
	private String phone1;
	private String phone2;
	private String phone3;
	
	
	@Override
	public String toString(){
		return  board_id + "=board_id ,"+
				title + "=title, "+
				content + "=content, "+
				reg_datetime + "=reg_datetime, "+
				reg_user + "=reg_user, "+
				delete_flag + "=delete_flag, "+
				email + "=email, "+
				phone + "=phone, "+
				bno + "=bno, ";
				
	}
	
	

		

	public String getPhone1() {
		return phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg_datetime() {
		return reg_datetime;
	}
	public void setReg_datetime(String reg_datetime) {
		this.reg_datetime = reg_datetime;
	}
	public String getReg_user() {
		return reg_user;
	}
	public void setReg_user(String reg_user) {
		this.reg_user = reg_user;
	}
	public String getDelete_flag() {
		return delete_flag;
	}
	public void setDelete_flag(String delete_flag) {
		this.delete_flag = delete_flag;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
		
		this.phone1 = phone.substring(0,3);
		this.phone2 = phone.substring(3,7);
		this.phone3 = phone.substring(7,11);
		
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}





	public int getRn() {
		return rn;
	}





	public void setRn(int rn) {
		this.rn = rn;
	}
	
	
	
}
