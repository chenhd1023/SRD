package com.srd.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.misc.BASE64Decoder;

/**
 * Servlet implementation class Base64Servlet
 */
@WebServlet("/Base64Servlet")
public class Base64Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Base64Servlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String crntImage = request.getParameter("imagebase64");
		BASE64Decoder decode = new BASE64Decoder();
		byte[] data = decode.decodeBuffer(crntImage.substring(crntImage
				.indexOf(",") + 1));
		OutputStream stream = new FileOutputStream("D:/tmp/abc.png");
		stream.write(data);
		System.out.println(crntImage);
		System.out.println(crntImage.substring(crntImage.indexOf(",") + 1));
		stream.close();
	}

}
