package com.srd.dao;

public class ShowNativeEncoding {
	 public static void main(String[] args) {

	       String enc = System.getProperty("file.encoding");

	       System.out.println(enc);
	 }
}
