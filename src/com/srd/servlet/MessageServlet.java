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

import com.srd.dao.MessageDAO;
import com.srd.dao.ProductDAO;
import com.srd.dao.SrbAccountDAO;
import com.srd.dao.TransactionDAO;
import com.srd.vo.MessageVO;
import com.srd.vo.ProductVO;
import com.srd.vo.SrbAccountVO;
import com.srd.vo.TransactionVO;

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
				SrbAccountDAO srbAccountDAO = new SrbAccountDAO(conn);
				TransactionDAO transactionDAO = new TransactionDAO(conn);
				List<MessageVO> messageVOs = new ArrayList<>();
				ProductVO productVO = new ProductVO();
				SrbAccountVO sellerVO = new SrbAccountVO();
				TransactionVO transactionVO = new TransactionVO();
				String idproduct = request.getParameter("idproduct");
				String buyer = request.getParameter("buyer");
				String seller = request.getParameter("seller");
				productVO = productDAO.query(idproduct);
				transactionVO.setIdproduct(idproduct);
				transactionVO.setBuyer(buyer);
				transactionVO.setSeller(seller);
				transactionVO.setProductname(productVO.getName());
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
				List<MessageVO> messageVOs = new ArrayList<>();
				MessageVO messageGonnaSendVO = new MessageVO();
				messageGonnaSendVO.setFromId(request.getParameter("fromId"));
				messageGonnaSendVO.setToId(request.getParameter("toId"));
				messageGonnaSendVO.setIdtransaction(request.getParameter("idtransaction"));
				messageGonnaSendVO.setMessage(request.getParameter("message"));
				messageDAO.insert(messageGonnaSendVO);
				messageVOs=messageDAO.getConversationByIdtransaction(request.getParameter("idtransaction"));
				request.getSession().setAttribute("messageVOs", messageVOs);
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
				List<MessageVO> messageVOs = new ArrayList<>();
				List<TransactionVO> transactionVOs = new ArrayList<>();
				MessageVO messageVO = new MessageVO();
				ProductVO productVO = new ProductVO();
				SrbAccountVO sellerVO = new SrbAccountVO();

				messageVO = messageDAO.getLatestConversationProductId(request
						.getParameter("toId"));
				// messageVOs = messageDAO.getProductConversation(
				// messageVO.getIdproduct(), messageVO.getFromId(),
				// messageVO.getToId());
				//productVO = productDAO.query(messageVO.getIdproduct());
				srbAccountVO = srbAccountDAO.getAllStatusByAccountid(productVO
						.getOwner());
				System.out.println(messageVOs.size());
				int i = 0;

				while (messageVOs.get(i).getFromId() != srbAccountVO
						.getAccountid() && messageVOs.size() >= i) {

					i++;
				}
				System.out.println(messageVOs.get(i).getFromId());
				request.getSession().setAttribute("FromId",
						messageVOs.get(i).getToId());
				request.getSession().setAttribute("ToId",
						messageVOs.get(i).getFromId());
				request.getSession().setAttribute("messageVOs", messageVOs);
				request.getSession().setAttribute("productVO", productVO);
				request.getSession().setAttribute("srbAccountVO", srbAccountVO);
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

		}
	}

}
