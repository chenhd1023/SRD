package com.srd.vo;

public class TransactionVO {
	private int idtransaction;
	private String idproduct;
	private String buyer;
	private String seller;
	private String status;
	private String productname;
	public int getIdtransaction() {
		return idtransaction;
	}
	public void setIdtransaction(int idtransaction) {
		this.idtransaction = idtransaction;
	}
	public String getIdproduct() {
		return idproduct;
	}
	public void setIdproduct(String idproduct) {
		this.idproduct = idproduct;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
}
