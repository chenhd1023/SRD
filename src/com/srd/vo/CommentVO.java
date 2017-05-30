package com.srd.vo;

public class CommentVO {
	private int idcomment;
	private String idtransaction;
	private String role;
	private String type;
	private String accountid;
	private String score;
	private String discription;
	private String status;
	private String date;
	private TransactionVO transactionVO;
	private String img;
	public int getIdcomment() {
		return idcomment;
	}
	public void setIdcomment(int idcomment) {
		this.idcomment = idcomment;
	}
	public String getIdtransaction() {
		return idtransaction;
	}
	public void setIdtransaction(String idtransaction) {
		this.idtransaction = idtransaction;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAccountid() {
		return accountid;
	}
	public void setAccountid(String accountid) {
		this.accountid = accountid;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getDiscription() {
		return discription;
	}
	public void setDiscription(String discription) {
		this.discription = discription;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public TransactionVO getTransactionVO() {
		return transactionVO;
	}
	public void setTransactionVO(TransactionVO transactionVO) {
		this.transactionVO = transactionVO;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	} 
}
