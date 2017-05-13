package com.srd.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.srd.dao.SrbAccountDAO;
import com.srd.vo.SrbAccountVO;

/**
 * Servlet implementation class AccountServlet
 */
@WebServlet("/AccountServlet")
public class AccountServlet extends HttpServlet {
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
	public AccountServlet() {
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

		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		System.out.println(action);
		if ("insert".equals(action)) {
			loadDriver();

			Connection conn = null;
			Statement stmt = null;

			try {
				conn = DriverManager.getConnection(url, user, password);
				SrbAccountDAO srbAccountDAO = new SrbAccountDAO(conn);
				SrbAccountVO srbAccountVO = new SrbAccountVO();
				srbAccountVO.setName(request.getParameter("name"));
				srbAccountVO.setSchoolmail(request.getParameter("schoolmail"));
				srbAccountVO.setHumanid(request.getParameter("humanid"));
				srbAccountVO.setAccountid(request.getParameter("accountid"));
				srbAccountVO.setAccountpassword(request
						.getParameter("accountpassword"));
				srbAccountVO.setCellphone(request.getParameter("cellphone"));
				srbAccountDAO.insert(srbAccountVO);
				srbAccountDAO.updateSelect(srbAccountVO);
				request.getSession().setAttribute("updateVo",
						srbAccountDAO.updateSelect(srbAccountVO));
				// request.getSession().setAttribute("status", "success");

				// conn.commit();
				response.sendRedirect("signupsuccess.jsp");
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

		} else if ("login".equals(action)) {
			loadDriver();
			Connection conn = null;
			Statement stmt = null;
			try {
				conn = DriverManager.getConnection(url, user, password);
				SrbAccountDAO srbAccountDAO = new SrbAccountDAO(conn);
				SrbAccountVO srbAccountVO = new SrbAccountVO();
				srbAccountVO.setAccountid(request.getParameter("accountid"));
				srbAccountVO.setAccountpassword(request
						.getParameter("accountpassword"));
				boolean loginstatus = srbAccountDAO.login(srbAccountVO);
				System.out.println(loginstatus);
				if (loginstatus) {
					srbAccountVO=srbAccountDAO.getAllStatus(srbAccountVO);
					request.getSession().setAttribute("accountid", srbAccountVO.getAccountid());
					System.out.println(srbAccountVO.getAccountid());
					request.getSession().setAttribute("profilePhoto", srbAccountVO.getPhoto());
					System.out.println(srbAccountVO.getAccountid());
					System.out.println(srbAccountVO.getPhoto());
					request.getSession().setAttribute("login", "success");
					// conn.commit();
					response.sendRedirect("index.jsp");
				} else {
					// conn.commit();
					response.sendRedirect("loginfailedid.jsp");
				}

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
		} else if ("logout".equals(action)) {
			request.getSession().setAttribute("login", "fail");
			response.sendRedirect("index.jsp");
		}
	}

}
