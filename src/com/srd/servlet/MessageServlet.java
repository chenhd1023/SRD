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
import com.srd.dao.MessageDAO;
import com.srd.dao.ProductDAO;
import com.srd.dao.SrbAccountDAO;
import com.srd.dao.TransactionDAO;
import com.srd.dao.WantedDAO;
import com.srd.vo.CommentVO;
import com.srd.vo.MessageVO;
import com.srd.vo.ProductVO;
import com.srd.vo.SrbAccountVO;
import com.srd.vo.TransactionVO;
import com.srd.vo.WantedVO;

@WebServlet("/MessageServlet")
public class MessageServlet extends HttpServlet {
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

	public MessageServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		System.out.println(action);
		if ("getConversation".equals(action)) {
			loadDriver();
			Connection conn = null;
			Statement stmt = null;

			try {
				conn = DriverManager.getConnection(url, user, password);
				MessageDAO messageDAO = new MessageDAO(conn);
				ProductDAO productDAO = new ProductDAO(conn);
				WantedDAO wantedDAO = new WantedDAO(conn);
				SrbAccountDAO srbAccountDAO = new SrbAccountDAO(conn);
				TransactionDAO transactionDAO = new TransactionDAO(conn);
				List<MessageVO> messageVOs = new ArrayList<>();
				ProductVO productVO = new ProductVO();
				WantedVO wantedVO = new WantedVO();
				SrbAccountVO sellerVO = new SrbAccountVO();
				TransactionVO transactionVO = new TransactionVO();
				String idproduct = request.getParameter("idproduct");
				String buyer = request.getParameter("buyer");
				String seller = request.getParameter("seller");
				String productOrWanted = request.getParameter("productOrWanted");
				
				transactionVO.setIdproduct(idproduct);
				transactionVO.setBuyer(buyer);
				transactionVO.setSeller(seller);
				transactionVO.setProductOrWanted(productOrWanted);
				if (productOrWanted.equals("product")) {
					productVO = productDAO.query(idproduct);
					transactionVO.setProductname(productVO.getName());
				} else if(productOrWanted.equals("wanted")){
					wantedVO = wantedDAO.queryById(idproduct);
					transactionVO.setProductname(wantedVO.getName());
				}
				
				
				if (!transactionDAO.checkTransactionExist(transactionVO)) {
					transactionVO.setStatus("new");
					transactionDAO.insert(transactionVO);
				}
				transactionVO = transactionDAO.getOneTransaction(transactionVO);
				messageVOs = messageDAO.getConversationByIdtransaction(transactionVO.getIdtransaction()+"");
				sellerVO = srbAccountDAO.getAllStatusByAccountid(idproduct);
				List<TransactionVO> transactionVOs = new ArrayList<>();
				transactionVOs = transactionDAO.getAllTransactionByAccountid(buyer);
				request.getSession().setAttribute("messageVOs", messageVOs);
				request.getSession().setAttribute("productVO", productVO);
				request.getSession().setAttribute("wantedVO", wantedVO);
				request.getSession().setAttribute("productOrWanted", productOrWanted);
				request.getSession().setAttribute("sellerVO", sellerVO);
				request.getSession().setAttribute("transactionVOs", transactionVOs);
				request.getSession().setAttribute("transactionVO", transactionVO);
				request.getSession().setAttribute("status", "SUCCESS");
				response.sendRedirect("message.jsp");
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

		} else if ("insertNewMessage".equals(action)) {
			loadDriver();
			Connection conn = null;
			Statement stmt = null;

			try {
				conn = DriverManager.getConnection(url, user, password);
				MessageDAO messageDAO = new MessageDAO(conn);
				TransactionDAO transactionDAO = new TransactionDAO(conn);
				List<MessageVO> messageVOs = new ArrayList<>();
				MessageVO messageGonnaSendVO = new MessageVO();
				TransactionVO transactionVO = new TransactionVO();
				messageGonnaSendVO.setFromId(request.getParameter("fromId"));
				messageGonnaSendVO.setToId(request.getParameter("toId"));
				String idtransaction=request.getParameter("idtransaction");
				messageGonnaSendVO.setIdtransaction(idtransaction);
				messageGonnaSendVO.setMessage(request.getParameter("message"));
				String status = request.getParameter("status");
				if (!status.equals("new")) {
					transactionDAO.updateStatus(idtransaction, status);
					if (status.equals("return")) {
					CommentDAO commentDAO = new CommentDAO(conn);
					CommentVO buyerProductCommentVO = new CommentVO();
					CommentVO buyerPersonCommentVO = new CommentVO();
					CommentVO sellerProductCommentVO = new CommentVO();
					CommentVO sellerPersonCommentVO = new CommentVO();
					
					buyerProductCommentVO.setIdtransaction(idtransaction);
					buyerProductCommentVO.setRole("buyer");
					buyerProductCommentVO.setType("product");
					buyerProductCommentVO.setAccountid(request.getParameter("fromId"));
					
					buyerPersonCommentVO.setIdtransaction(idtransaction);
					buyerPersonCommentVO.setRole("buyer");
					buyerPersonCommentVO.setType("person");
					buyerPersonCommentVO.setAccountid(request.getParameter("fromId"));
					
					sellerProductCommentVO.setIdtransaction(idtransaction);
					sellerProductCommentVO.setRole("seller");
					sellerProductCommentVO.setType("product");
					sellerProductCommentVO.setAccountid(request.getParameter("toId"));
					
					sellerPersonCommentVO.setIdtransaction(idtransaction);
					sellerPersonCommentVO.setRole("seller");
					sellerPersonCommentVO.setType("person");
					sellerPersonCommentVO.setAccountid(request.getParameter("toId"));
					
					commentDAO.createNewComment(buyerProductCommentVO);
					commentDAO.createNewComment(buyerPersonCommentVO);
					commentDAO.createNewComment(sellerProductCommentVO);
					commentDAO.createNewComment(sellerPersonCommentVO);
					} 
				} 
				transactionVO = transactionDAO.getTransactionByID(idtransaction);
				messageDAO.insert(messageGonnaSendVO);
				messageVOs=messageDAO.getConversationByIdtransaction(request.getParameter("idtransaction"));
				request.getSession().setAttribute("messageVOs", messageVOs);
				request.getSession().setAttribute("transactionVO", transactionVO);
				response.sendRedirect("message.jsp");
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

		} else if ("getLatestConversation".equals(action)) {
			loadDriver();
			Connection conn = null;
			Statement stmt = null;

			try {
				conn = DriverManager.getConnection(url, user, password);
				MessageDAO messageDAO = new MessageDAO(conn);
				ProductDAO productDAO = new ProductDAO(conn);
				SrbAccountDAO srbAccountDAO = new SrbAccountDAO(conn);
				TransactionDAO transactionDAO = new TransactionDAO(conn);
				WantedDAO wantedDAO = new WantedDAO(conn);
				List<MessageVO> messageVOs = new ArrayList<>();
				List<TransactionVO> transactionVOs = new ArrayList<>();
				ProductVO productVO = new ProductVO();
				WantedVO wantedVO = new WantedVO();
				SrbAccountVO sellerVO = new SrbAccountVO();
				SrbAccountVO buyerVO = new SrbAccountVO();
				TransactionVO transactionVO = new TransactionVO();
				String accountid = request.getParameter("accountid");
				transactionVO = transactionDAO.getLatestTransaction(accountid);
				messageVOs = messageDAO.getConversationByIdtransaction(transactionVO.getIdtransaction()+"");
				sellerVO = srbAccountDAO.getAllStatusByAccountid(transactionVO.getSeller());
				buyerVO = srbAccountDAO.getAllStatusByAccountid(transactionVO.getBuyer());
				if (transactionVO.getProductOrWanted().equals("product")) {
					productVO = productDAO.query(transactionVO.getIdproduct());
				} else if(transactionVO.getProductOrWanted().equals("wanted")){
					wantedVO = wantedDAO.queryById(transactionVO.getIdproduct());
				}
				transactionVOs = transactionDAO.getAllTransactionByAccountid(accountid);
				
				request.getSession().setAttribute("messageVOs", messageVOs);
				request.getSession().setAttribute("productVO", productVO);
				request.getSession().setAttribute("wantedVO", wantedVO);
				request.getSession().setAttribute("productOrWanted", transactionVO.getProductOrWanted());
				request.getSession().setAttribute("sellerVO", sellerVO);
				request.getSession().setAttribute("buyerVO", buyerVO);
				request.getSession().setAttribute("transactionVOs", transactionVOs);
				request.getSession().setAttribute("transactionVO", transactionVO);
				response.sendRedirect("message.jsp");
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

		}else if ("getSpecificTransaction".equals(action)) {
			loadDriver();
			Connection conn = null;
			Statement stmt = null;

			try {
				conn = DriverManager.getConnection(url, user, password);
				MessageDAO messageDAO = new MessageDAO(conn);
				ProductDAO productDAO = new ProductDAO(conn);
				SrbAccountDAO srbAccountDAO = new SrbAccountDAO(conn);
				TransactionDAO transactionDAO = new TransactionDAO(conn);
				WantedDAO wantedDAO = new WantedDAO(conn);
				List<MessageVO> messageVOs = new ArrayList<>();
				List<TransactionVO> transactionVOs = new ArrayList<>();
				ProductVO productVO = new ProductVO();
				WantedVO wantedVO = new WantedVO();
				SrbAccountVO sellerVO = new SrbAccountVO();
				SrbAccountVO buyerVO = new SrbAccountVO();
				TransactionVO transactionVO = new TransactionVO();
				String accountid = request.getParameter("accountid");
				String transactionid = request.getParameter("transactionid");
				transactionVO = transactionDAO.getTransactionByID(transactionid);
				messageVOs = messageDAO.getConversationByIdtransaction(transactionVO.getIdtransaction()+"");
				sellerVO = srbAccountDAO.getAllStatusByAccountid(transactionVO.getSeller());
				buyerVO = srbAccountDAO.getAllStatusByAccountid(transactionVO.getBuyer());
				if (transactionVO.getProductOrWanted().equals("product")) {
					productVO = productDAO.query(transactionVO.getIdproduct());
				} else if(transactionVO.getProductOrWanted().equals("wanted")){
					wantedVO = wantedDAO.queryById(transactionVO.getIdproduct());
				}
				transactionVOs = transactionDAO.getAllTransactionByAccountid(accountid);
				
				request.getSession().setAttribute("messageVOs", messageVOs);
				request.getSession().setAttribute("productVO", productVO);
				request.getSession().setAttribute("wantedVO", wantedVO);
				request.getSession().setAttribute("productOrWanted", transactionVO.getProductOrWanted());
				request.getSession().setAttribute("sellerVO", sellerVO);
				request.getSession().setAttribute("buyerVO", buyerVO);
				request.getSession().setAttribute("transactionVOs", transactionVOs);
				request.getSession().setAttribute("transactionVO", transactionVO);
				response.sendRedirect("message.jsp");
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
