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

import com.srd.dao.ProductDAO;
import com.srd.dao.SrbAccountDAO;
import com.srd.vo.ProductVO;
import com.srd.vo.SrbAccountVO;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
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
	public ProductServlet() {
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
		if ("getOneProduct".equals(action)) {
			loadDriver();

			Connection conn = null;
			Statement stmt = null;

			try {
				conn = DriverManager.getConnection(url, user, password);
				ProductDAO productDAO = new ProductDAO(conn);
				SrbAccountDAO srbAccountDAO = new SrbAccountDAO(conn);
				ProductVO productVO = new ProductVO();
				SrbAccountVO srbAccountVO = new SrbAccountVO();
				String idproduct = request.getParameter("idproduct");
				productVO = productDAO.query(idproduct);
				srbAccountVO = srbAccountDAO.getAllStatusByAccountid(productVO.getOwner());
				request.getSession().setAttribute("productVO", productVO);
				request.getSession().setAttribute("srbAccountVO", srbAccountVO);
				request.getSession().setAttribute("status", "SUCCESS");

				// conn.commit();
				response.sendRedirect("goods.jsp");
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

		} else if ("insertFirst".equals(action)) {
			loadDriver();

			Connection conn = null;
			Statement stmt = null;

			try {
				conn = DriverManager.getConnection(url, user, password);
				ProductDAO productDAO = new ProductDAO(conn);
				ProductVO productVO = new ProductVO();
				productVO.setName(request.getParameter("name"));
				productVO.setOwner(request.getParameter("owner"));
				productVO.setDescribe(request.getParameter("describe"));
				productVO.setCatalog(request.getParameter("catalog"));
				productVO.setPlace(request.getParameter("place"));
				productDAO.insertFirst(productVO);
				// productDAO.updateSelect(srbAccountVO);
				request.getSession().setAttribute("productName",
						productVO.getName());
				request.getSession().setAttribute("status", "success");
				// conn.commit();
				response.sendRedirect("goodsassign2.jsp");
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
		} else if ("insertSecond".equals(action)) {
			loadDriver();

			Connection conn = null;
			Statement stmt = null;

			try {
				conn = DriverManager.getConnection(url, user, password);
				ProductDAO productDAO = new ProductDAO(conn);
				ProductVO productVO = new ProductVO();
				productVO.setPrice(request.getParameter("price"));
				productVO.setSaleboolean(request.getParameter("saleboolean"));
				productVO.setSaleprice(request.getParameter("saleprice"));
				productVO.setRentdays(request.getParameter("rentdays"));
				productDAO.insertSecond(productVO);
				//request.getSession().setAttribute("productName",productVO.getName());
				//request.getSession().setAttribute("status", "success");
				response.sendRedirect("goodsassign3.jsp");
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
		} else if ("insertThird".equals(action)) {
			loadDriver();
			Connection conn = null;
			Statement stmt = null;
			try {
				conn = DriverManager.getConnection(url, user, password);
				ProductDAO productDAO = new ProductDAO(conn);
				ProductVO productVO = new ProductVO();
				int idproduct=productDAO.getLastInsertId();
				String fileSavePathString = "img/products/"+idproduct+".png";
				String crntImage = request.getParameter("imagebase64");
				BASE64Decoder decode = new BASE64Decoder();
				byte[] data = decode.decodeBuffer(crntImage.substring(crntImage.indexOf(",")+1));
				OutputStream stream = new FileOutputStream("C:/Users/Administrator/workspace/srdtest/WebContent/"+fileSavePathString);
				stream.write(data);
				
				productVO.setPicture1(fileSavePathString);
				productDAO.insertThird(productVO);
				productVO = productDAO.getLastInsert();
				//System.out.println(crntImage);
				//System.out.println(crntImage.substring(crntImage.indexOf(",")+1));
				stream.close();
				request.getSession().setAttribute("name",productVO.getName());
				request.getSession().setAttribute("saleprice",productVO.getSaleprice());
				request.getSession().setAttribute("product",productVO.getPrice());
				request.getSession().setAttribute("place",productVO.getPlace());
				request.getSession().setAttribute("catalog",productVO.getCatalog());
				request.getSession().setAttribute("describe",productVO.getDescribe());
				request.getSession().setAttribute("picture1",productVO.getPicture1());
				
				
				
				response.sendRedirect("goods.jsp");
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
		} else if ("indexToContent".equals(action)) {
			loadDriver();
			Connection conn = null;
			Statement stmt = null;
			try {
				conn = DriverManager.getConnection(url, user, password);
				ProductDAO productDAO = new ProductDAO(conn);
				List<ProductVO> productVOs = new ArrayList<>();
				
				
				productVOs = productDAO.queryAll();
		

				request.getSession().setAttribute("productVOs",productVOs);
				
				
				
				response.sendRedirect("contentshare.jsp");
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
