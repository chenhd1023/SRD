package com.srd.vo;


public class SrbAccountVO {
	private String name = "";
    private String schoolmail= "";
    private String humanid= "";
    private String accountid= "";
    private String accountpassword= "";
    private String cellphone= "";
    private String photo="";
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSchoolmail() {
		return schoolmail;
	}
	public void setSchoolmail(String schoolmail) {
		this.schoolmail = schoolmail;
	}
	public String getHumanid() {
		return humanid;
	}
	public void setHumanid(String humanid) {
		this.humanid = humanid;
	}
	public String getAccountid() {
		return accountid;
	}
	public void setAccountid(String accountid) {
		this.accountid = accountid;
	}
	public String getAccountpassword() {
		return accountpassword;
	}
	public void setAccountpassword(String accountpassword) {
		this.accountpassword = accountpassword;
	}
	public String getCellphone() {
		return cellphone;
	}
	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}
	
	public void setId(String accountid) {
		this.accountid = accountid;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
    
}
