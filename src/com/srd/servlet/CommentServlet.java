package com.srd.servlet;

import java.io.IOException;
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
import com.srd.dao.CommentDAO;
import com.srd.dao.WantedDAO;
import com.srd.vo.CommentVO;
import com.srd.vo.WantedVO;

@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
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
    public CommentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		System.out.println(action);
		if ("insertComment".equals(action)) {
			loadDriver();
			Connection conn = null;
			Statement stmt = null;
			try {
				conn = DriverManager.getConnection(url, user, password);
				CommentDAO commentDAO = new CommentDAO(conn);
				CommentVO productCommentVO = new CommentVO();
				CommentVO personCommentVO = new CommentVO();
				productCommentVO.setIdcomment(Integer.parseInt(request.getParameter("productIdcomment")));
				productCommentVO.setScore(request.getParameter("productScore"));
				productCommentVO.setDiscription(request.getParameter("productDiscription"));
				
				personCommentVO.setIdcomment(Integer.parseInt(request.getParameter("personIdcomment")));
				personCommentVO.setScore(request.getParameter("personScore"));
				personCommentVO.setDiscription(request.getParameter("personDiscription"));
				
				commentDAO.submitComment(productCommentVO);
				commentDAO.submitComment(personCommentVO);
				
				//要放已評論紀錄
				List<CommentVO> sellerProductCommentVOs = new ArrayList<>();
				List<CommentVO> sellerPersonCommentVOs = new ArrayList<>();
				List<CommentVO> buyerProductCommentVOs = new ArrayList<>();
				List<CommentVO> buyerPersonCommentVOs = new ArrayList<>();
				String accountid = request.getParameter("accountid");
				sellerProductCommentVOs=commentDAO.getCommentDone(accountid,"product","seller");
				sellerPersonCommentVOs=commentDAO.getCommentDone(accountid,"person","seller");
				buyerProductCommentVOs=commentDAO.getCommentDone(accountid,"product","buyer");
				buyerPersonCommentVOs=commentDAO.getCommentDone(accountid,"person","buyer");
				request.getSession().setAttribute("sellerProductCommentVOs", sellerProductCommentVOs);
				request.getSession().setAttribute("sellerPersonCommentVOs", sellerPersonCommentVOs);
				request.getSession().setAttribute("buyerProductCommentVOs", buyerProductCommentVOs);
				request.getSession().setAttribute("buyerPersonCommentVOs", buyerPersonCommentVOs);
				response.sendRedirect("commentdone.jsp");
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
		}else if ("getOneComment".equals(action)) {
			loadDriver();
			Connection conn = null;
			Statement stmt = null;
			try {
				conn = DriverManager.getConnection(url, user, password);
				CommentDAO commentDAO = new CommentDAO(conn);
				CommentVO productCommentVO = new CommentVO();
				CommentVO personCommentVO = new CommentVO();
				String idcomment = request.getParameter("idcomment");
				productCommentVO = commentDAO.getOneCommentByIdcomment(idcomment);
				personCommentVO = commentDAO.getOneCommentByIdcomment((Integer.parseInt(idcomment)+1)+"");
				request.getSession().setAttribute("productCommentVO", productCommentVO);
				request.getSession().setAttribute("personCommentVO", personCommentVO);
				response.sendRedirect("commentToDo.jsp");
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
		}else if ("commentyet".equals(action)) {
			loadDriver();
			Connection conn = null;
			Statement stmt = null;
			try {
				conn = DriverManager.getConnection(url, user, password);
				CommentDAO commentDAO = new CommentDAO(conn);
				List<CommentVO> commentVOs = new ArrayList<>();
				String accountid = request.getParameter("accountid");
				commentVOs=commentDAO.getCommentyetsByAccountID(accountid);
				request.getSession().setAttribute("commentVOs", commentVOs);
				response.sendRedirect("commentyet.jsp");
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
		}else if ("commentdone".equals(action)) {
			loadDriver();
			Connection conn = null;
			Statement stmt = null;
			try {
				conn = DriverManager.getConnection(url, user, password);
				CommentDAO commentDAO = new CommentDAO(conn);
				List<CommentVO> sellerProductCommentVOs = new ArrayList<>();
				List<CommentVO> sellerPersonCommentVOs = new ArrayList<>();
				List<CommentVO> buyerProductCommentVOs = new ArrayList<>();
				List<CommentVO> buyerPersonCommentVOs = new ArrayList<>();
				String accountid = request.getParameter("accountid");
				sellerProductCommentVOs=commentDAO.getCommentDone(accountid,"product","seller");
				sellerPersonCommentVOs=commentDAO.getCommentDone(accountid,"person","seller");
				buyerProductCommentVOs=commentDAO.getCommentDone(accountid,"product","buyer");
				buyerPersonCommentVOs=commentDAO.getCommentDone(accountid,"person","buyer");
				request.getSession().setAttribute("sellerProductCommentVOs", sellerProductCommentVOs);
				request.getSession().setAttribute("sellerPersonCommentVOs", sellerPersonCommentVOs);
				request.getSession().setAttribute("buyerProductCommentVOs", buyerProductCommentVOs);
				request.getSession().setAttribute("buyerPersonCommentVOs", buyerPersonCommentVOs);
				response.sendRedirect("commentdone.jsp");
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
