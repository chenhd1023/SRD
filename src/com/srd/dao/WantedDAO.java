package com.srd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.srd.vo.WantedVO;

public class WantedDAO {
	private Connection conn;

	public WantedDAO(Connection conn) {
		this.conn = conn;
	}

	private WantedVO loadData(ResultSet rset) throws SQLException {
		WantedVO vo = new WantedVO();
		vo.setIdwanted(rset.getInt("idwanted"));
		vo.setName(rset.getString("name"));
		vo.setOwner(rset.getString("owner"));
		vo.setPrice(rset.getString("price"));
		vo.setDateStart(rset.getString("dateStart"));
		vo.setDateEnd(rset.getString("dateEnd"));
		vo.setOther(rset.getString("other"));
		vo.setPicture(rset.getString("picture"));
		vo.setStatus(rset.getString("status"));
		vo.setTimelimit(rset.getString("timelimit"));
		return vo;
	}

	public List<WantedVO> queryAll() throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from wanted    ";
		List<WantedVO> result = new ArrayList<>();

		try {
			pstmt = conn.prepareStatement(sql);
			// /pstmt.setString(1, idproduct);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				WantedVO tmp = new WantedVO();
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
	
	public WantedVO queryById(String idwanted) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from wanted where idwanted=?";
		WantedVO result = new WantedVO();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idwanted);
			rset = pstmt.executeQuery();
			if (rset.next()) {
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
	
	public List<WantedVO> queryByNameRtnList(WantedVO vo) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from wanted where name=?";
		List<WantedVO> result = new ArrayList<>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			rset = pstmt.executeQuery();
			while (rset.next()) {
				WantedVO tmp = new WantedVO();
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
	
	
	public WantedVO getLastInsert() throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from wanted    " + "where idwanted = (select max(idwanted) from wanted)         ";
		WantedVO result = new WantedVO();
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
	
	public WantedVO queryByName(String name) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from wanted    " + "where Name = ? ";
		WantedVO result = new WantedVO();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rset = pstmt.executeQuery();
			if (rset.next()) {
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
	
	public void insertFirst(WantedVO vo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "insert into wanted( name,owner,other  ) values(  ?,?,?)         ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getOwner());
			pstmt.setString(3, vo.getOther());
			
			//pstmt.setString(5, null);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			if (pstmt != null)
				pstmt.close();
		}
	}
	
	public void addNewPrice(WantedVO vo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "insert into wanted( name,owner,other,price,dateStart,dateEnd, timelimit,picture ) values(  ?,?,?,?,?,?,?,?)         ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getOwner());
			pstmt.setString(3, vo.getOther());
			pstmt.setString(4, vo.getPrice());
			pstmt.setString(5, vo.getDateStart());
			pstmt.setString(6, vo.getDateEnd());
			pstmt.setString(7, vo.getTimelimit());
			pstmt.setString(8, vo.getPicture());
			
			//pstmt.setString(5, null);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			if (pstmt != null)
				pstmt.close();
		}
	}
	
	public void insertSecond(WantedVO vo) throws SQLException {
		PreparedStatement pstmt = null;
		int idproduct = getLastInsertId();
		String sql = "update wanted set price=? ,   dateStart=?,  dateEnd=? , timelimit=? where idwanted=?    ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPrice());
			pstmt.setString(2, vo.getDateStart());
			pstmt.setString(3, vo.getDateEnd());
			pstmt.setString(4, vo.getTimelimit());
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
	
	
	public void insertThird(WantedVO vo) throws SQLException {
		PreparedStatement pstmt = null;
		int idproduct = getLastInsertId();
		String sql = "update wanted set picture=?  where idwanted=?    ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPicture());
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
		String sql = "select max(idwanted) from wanted    " ;
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
	
	public List<WantedVO> queryDistinctName() throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select distinct wanted.name from wanted  " ;
		List<WantedVO> result = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				WantedVO tmp = new WantedVO();
				tmp.setName(rset.getString("name"));
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

	
}
