package com.srd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.srd.vo.ProductVO;

public class ProductDAO {
	private Connection conn;

	public ProductDAO(Connection conn) {
		this.conn = conn;
	}

	private ProductVO loadData(ResultSet rset) throws SQLException {
		ProductVO vo = new ProductVO();
		vo.setIdproduct(rset.getInt(1));
		vo.setName(rset.getString(2));
		vo.setOwner(rset.getString(3));
		vo.setDescribe(rset.getString(4));
		vo.setPrice(rset.getString(5));
		vo.setPlace(rset.getString(6));
		vo.setCatalog(rset.getString(7));
		vo.setSaleboolean(rset.getString(8));
		vo.setSaleprice(rset.getString(9));
		vo.setPicture1(rset.getString(10));
		vo.setRentdays(rset.getString("rentdays"));
		return vo;
	}

	public List<ProductVO> queryAll() throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from product    " ;
		List<ProductVO> result = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			///pstmt.setString(1, idproduct);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				ProductVO tmp = new ProductVO();
				tmp = loadData(rset);
				result.add(tmp);
			}
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rset != null)
				rset.close();
			if (pstmt != null)
				pstmt.close();
		}
		return result;

	}
	
	public List<ProductVO> queryByContentType(String contentType) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from product where saleboolean=?" ;
		List<ProductVO> result = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			if (contentType.equals("contentresale")) {
				pstmt.setString(1, "yes");
			} else if(contentType.equals("contentdonate")){
				pstmt.setString(1, "donate");
			}
			rset = pstmt.executeQuery();
			while (rset.next()) {
				ProductVO tmp = new ProductVO();
				tmp = loadData(rset);
				result.add(tmp);
			}
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rset != null)
				rset.close();
			if (pstmt != null)
				pstmt.close();
		}
		return result;

	}
	
	public List<ProductVO> queryByCatlog(String catalog,String contentType) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from product where catalog=? " ;
		List<ProductVO> result = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, catalog);
			if (contentType.equals("contentresale")) {
				sql=sql+"and saleboolean='yes'";
			} else if(contentType.equals("contentdonate")){
				sql=sql+"and saleboolean='donate'";
			}
			rset = pstmt.executeQuery();
			while (rset.next()) {
				ProductVO tmp = new ProductVO();
				tmp = loadData(rset);
				result.add(tmp);
			}
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rset != null)
				rset.close();
			if (pstmt != null)
				pstmt.close();
		}
		return result;

	}
	
	public List<List<ProductVO>> queryByAccountid(String accountid) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from product where owner=?" ;
		List<ProductVO> smallRow = new ArrayList<>();
		int smallRowCounter = 0;
		List<List<ProductVO>> result = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, accountid);
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				ProductVO tmp = new ProductVO();
				tmp = loadData(rset);
				smallRow.add(tmp);
				smallRowCounter++;
				if (smallRowCounter==3) {
					result.add(smallRow);
					smallRowCounter = 0;
					smallRow = new ArrayList<>();
				} 
			}
			if (smallRowCounter<3) {
				result.add(smallRow);
			}
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rset != null)
				rset.close();
			if (pstmt != null)
				pstmt.close();
		}
		return result;

	}
	
	public ProductVO query(String idproduct) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from product    " + "where idproduct = ?         ";
		ProductVO result = new ProductVO();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idproduct);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				result = loadData(rset);
			}
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rset != null)
				rset.close();
			if (pstmt != null)
				pstmt.close();
		}
		return result;

	}
	
	public ProductVO getLastInsert() throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from product    " + "where idproduct = (select max(idproduct) from product)         ";
		ProductVO result = new ProductVO();
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				result = loadData(rset);
			}
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rset != null)
				rset.close();
			if (pstmt != null)
				pstmt.close();
		}
		return result;

	}
	
	public void insertFirst(ProductVO vo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "insert into product( name,owner,description,place,catalog  ) values(  ?,?,?,?,?)         ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getOwner());
			pstmt.setString(3, vo.getDescribe());
			pstmt.setString(4, vo.getPlace());
			pstmt.setString(5, vo.getCatalog());
			//pstmt.setString(5, null);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			if (pstmt != null)
				pstmt.close();
		}
	}
	
	public void insertSecond(ProductVO vo) throws SQLException {
		PreparedStatement pstmt = null;
		int idproduct = getLastInsertId();
		String sql = "update product set price=? ,   saleboolean=?,  saleprice=? , rentdays=? where idproduct=?    ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPrice());
			pstmt.setString(2, vo.getSaleboolean());
			pstmt.setString(3, vo.getSaleprice());
			pstmt.setString(4, vo.getRentdays());
			pstmt.setInt(5, idproduct);
			//pstmt.setString(5, null);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			if (pstmt != null)
				pstmt.close();
		}
	}
	
	public void insertThird(ProductVO vo) throws SQLException {
		PreparedStatement pstmt = null;
		int idproduct = getLastInsertId();
		String sql = "update product set picture1=?  where idproduct=?    ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPicture1());
			pstmt.setInt(2, idproduct);
			//pstmt.setString(5, null);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			if (pstmt != null)
				pstmt.close();
		}
	}
	
	public int getLastInsertId() throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select max(idproduct) from product    " ;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rset != null)
				rset.close();
			if (pstmt != null)
				pstmt.close();
		}
		return result;
	}
}
