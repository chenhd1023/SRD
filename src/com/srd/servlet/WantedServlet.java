package com.srd.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sun.misc.BASE64Decoder;
import com.srd.dao.WantedDAO;
import com.srd.vo.WantedVO;

@WebServlet("/WantedServlet")
public class WantedServlet  extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private static String driver = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3306/srb?useUnicode=true&amp;characterEncoding=utf-8&autoReconnect=true&useSSL=false";
	private static String user = "root";
	private static String password = "8825252";

	private static void loadDriver() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public WantedServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("testinservlet");
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		System.out.println(action);
		if ("insertFirst".equals(action)) {
			loadDriver();

			Connection conn = null;
			Statement stmt = null;

			try {
				conn = DriverManager.getConnection(url, user, password);
				WantedDAO wantedDAO = new WantedDAO(conn);
				WantedVO wantedVO = new WantedVO();
				wantedVO.setName(request.getParameter("name"));
				wantedVO.setOwner(request.getParameter("owner"));
				wantedVO.setOther(request.getParameter("other"));
				wantedDAO.insertFirst(wantedVO);
				// productDAO.updateSelect(srbAccountVO);
				request.getSession().setAttribute("wantedName", wantedVO.getName());
				request.getSession().setAttribute("status", "success");
				// conn.commit();
				response.sendRedirect("wantedassign2.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (stmt != null) {
					try {
						stmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}else if ("insertSecond".equals(action)) {
			loadDriver();

			Connection conn = null;
			Statement stmt = null;

			try {
				conn = DriverManager.getConnection(url, user, password);
				WantedDAO wantedDAO = new WantedDAO(conn);
				WantedVO wantedVO = new WantedVO();
				wantedVO.setPrice(request.getParameter("price"));
				wantedVO.setDateStart(request.getParameter("dateStart"));
				wantedVO.setDateEnd(request.getParameter("dateEnd"));
				wantedVO.setTimelimit(request.getParameter("timelimit"));
				wantedDAO.insertSecond(wantedVO);
				//request.getSession().setAttribute("productName",productVO.getName());
				//request.getSession().setAttribute("status", "success");
				response.sendRedirect("wantedassign3.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (stmt != null) {
					try {
						stmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}else if ("insertThird".equals(action)) {
			loadDriver();
			Connection conn = null;
			Statement stmt = null;
			try {
				conn = DriverManager.getConnection(url, user, password);
				WantedDAO wantedDAO = new WantedDAO(conn);
				WantedVO wantedVO = new WantedVO();
				int idwanted=wantedDAO.getLastInsertId();
				String fileSavePathString = "img/wanted/"+idwanted+".png";
				String crntImage = request.getParameter("imagebase64");
				BASE64Decoder decode = new BASE64Decoder();
				byte[] data = decode.decodeBuffer(crntImage.substring(crntImage.indexOf(",")+1));
				OutputStream stream = new FileOutputStream("C:/Users/Administrator/workspace/srdtest/WebContent/"+fileSavePathString);
				stream.write(data);
				
				wantedVO.setPicture(fileSavePathString);
				wantedDAO.insertThird(wantedVO);
				wantedVO = wantedDAO.getLastInsert();
				//System.out.println(crntImage);
				//System.out.println(crntImage.substring(crntImage.indexOf(",")+1));
				stream.close();
				request.getSession().setAttribute("name",wantedVO.getName());
				request.getSession().setAttribute("price",wantedVO.getPrice());
				request.getSession().setAttribute("picture",wantedVO.getPicture());
				request.getSession().setAttribute("idwanted",wantedVO.getIdwanted());
				request.getSession().setAttribute("owner",wantedVO.getOwner());
				request.getSession().setAttribute("dateStart",wantedVO.getDateStart());
				request.getSession().setAttribute("dateEnd",wantedVO.getDateEnd());
				request.getSession().setAttribute("other",wantedVO.getOther());
				request.getSession().setAttribute("timelimit",wantedVO.getTimelimit());
				
				
				response.sendRedirect("bid.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (stmt != null) {
					try {
						stmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}

	}

}
