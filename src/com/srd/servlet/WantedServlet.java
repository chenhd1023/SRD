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
import com.srd.dao.WantedDAO;
import com.srd.vo.ProductVO;
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
	public WantedServlet() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
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
				OutputStream stream = new FileOutputStream("C:/Program Files/Apache Software Foundation/Tomcat 7.0/webapps/srdtest/"+fileSavePathString);
				stream.write(data);
				
				wantedVO.setPicture(fileSavePathString);
				wantedDAO.insertThird(wantedVO);
				wantedVO = wantedDAO.getLastInsert();
				//System.out.println(crntImage);
				//System.out.println(crntImage.substring(crntImage.indexOf(",")+1));
				stream.close();
				List<WantedVO> wantedVOs = new ArrayList<>();
				wantedVOs = wantedDAO.queryByNameRtnList(wantedVO);
				
				
		
				request.getSession().setAttribute("wantedVO",wantedVO);
				request.getSession().setAttribute("wantedVOs",wantedVOs);
				request.getSession().setAttribute("url","action=getOneWanted&idwanted="+wantedVO.getIdwanted());
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
		}else if ("indexToContent".equals(action)) {
			loadDriver();
			Connection conn = null;
			Statement stmt = null;
			try {
				conn = DriverManager.getConnection(url, user, password);
				String contentType = request.getParameter("contentType");
				WantedDAO wantedDAO = new WantedDAO(conn);
				List<WantedVO> wantedVOs = new ArrayList<>();
				wantedVOs = wantedDAO.queryDistinctName();
				for (int i = 0; i < wantedVOs.size(); i++) {
					wantedVOs.set(i,wantedDAO.queryByName(wantedVOs.get(i).getName()));
				}
				List<List<WantedVO>> bigWantedVOs = new ArrayList<>();
				int counter=0;
				List<WantedVO> tmpVOs = new ArrayList<>();
				for (int i = 0; i < wantedVOs.size(); i++) {
					tmpVOs.add(wantedVOs.get(i));
					counter++;
					if (counter==4) {
						bigWantedVOs.add(tmpVOs);
						tmpVOs=new ArrayList<>();
						counter=0;
					}
				}
				if (counter>0) {
					bigWantedVOs.add(tmpVOs);
				}
		

				request.getSession().setAttribute("bigWantedVOs",bigWantedVOs);
				request.getSession().setAttribute("url","action=indexToContent&contentType="+contentType);
				response.sendRedirect(contentType+".jsp");
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
		}else if ("getOneWanted".equals(action)) {
			loadDriver();
			Connection conn = null;
			Statement stmt = null;
			try {
				conn = DriverManager.getConnection(url, user, password);
				//String contentType = request.getParameter("contentType");
				String idwanted = request.getParameter("idwanted");
				WantedDAO wantedDAO = new WantedDAO(conn);
				WantedVO wantedVO = new WantedVO();
				wantedVO = wantedDAO.queryById(idwanted);
				List<WantedVO> wantedVOs = new ArrayList<>();
				wantedVOs = wantedDAO.queryByNameRtnList(wantedVO);
				
				
		
				request.getSession().setAttribute("wantedVO",wantedVO);
				request.getSession().setAttribute("wantedVOs",wantedVOs);
				request.getSession().setAttribute("url","action=getOneWanted&idwanted="+wantedVO.getIdwanted());
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
		}else if ("addNewPrice".equals(action)) {
			loadDriver();
			Connection conn = null;
			Statement stmt = null;
			try {
				conn = DriverManager.getConnection(url, user, password);
				String idwanted = request.getParameter("idwanted");
				String accountid = request.getParameter("accountid");
				String price = request.getParameter("price");
				WantedDAO wantedDAO = new WantedDAO(conn);
				WantedVO wantedVO = new WantedVO();
				wantedVO = wantedDAO.queryById(idwanted);
				wantedVO.setOwner(accountid);
				wantedVO.setPrice(price);
				wantedDAO.addNewPrice(wantedVO);
				List<WantedVO> wantedVOs = new ArrayList<>();
				wantedVOs = wantedDAO.queryByNameRtnList(wantedVO);
				request.getSession().setAttribute("wantedVO",wantedVO);
				request.getSession().setAttribute("wantedVOs",wantedVOs);
				request.getSession().setAttribute("url","action=getOneWanted&idwanted="+wantedVO.getIdwanted());
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
