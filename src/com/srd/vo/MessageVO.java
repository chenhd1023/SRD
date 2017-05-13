package com.srd.vo;

import java.sql.Timestamp;

public class MessageVO {
	private int idmessage;
	private String fromId;
	private String toId;
	private String message;
	private Timestamp timestamp;
	private String idtransaction;

	public int getIdmessage() {
		return idmessage;
	}

	public void setIdmessage(int idmessage) {
		this.idmessage = idmessage;
	}

	public String getFromId() {
		return fromId;
	}

	public void setFromId(String fromId) {
		this.fromId = fromId;
	}

	public String getToId() {
		return toId;
	}

	public void setToId(String toId) {
		this.toId = toId;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Timestamp getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}

	public String getIdtransaction() {
		return idtransaction;
	}

	public void setIdtransaction(String idtransaction) {
		this.idtransaction = idtransaction;
	}


}
