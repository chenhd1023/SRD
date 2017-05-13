package com.srd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.srd.vo.SrbAccountVO;

public class SrbAccountDAO {
	private Connection conn;

	public SrbAccountDAO(Connection conn) {
		this.conn = conn;
	}

	private SrbAccountVO loadData(ResultSet rset) throws SQLException {
		SrbAccountVO vo = new SrbAccountVO();
		vo.setName(rset.getString("name"));
		vo.setSchoolmail(rset.getString("schoolmail"));
		vo.setHumanid(rset.getString("humanid"));
		vo.setAccountid(rset.getString("accountid"));
		vo.setAccountpassword(rset.getString("accountpassword"));
		vo.setCellphone(rset.getString("cellphone"));
		vo.setPhoto(rset.getString("photo"));
		return vo;
	}

	public SrbAccountVO updateSelect(SrbAccountVO vo) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from account    " + "where accountid = ?         "
				+ "and   accountpassword = ?         ";
		SrbAccountVO result = new SrbAccountVO();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getAccountid());
			pstmt.setString(2, vo.getAccountpassword());
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

	public void insert(SrbAccountVO vo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "insert into account(                           "
				+ "   name,schoolmail,humanid,accountid,accountpassword, cellphone             " + "  )  "
				+ "values(                    " + "   ?,?,?,?,?,?  )         ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getSchoolmail());
			pstmt.setString(3, vo.getHumanid());
			pstmt.setString(4, vo.getAccountid());
			pstmt.setString(5, vo.getAccountpassword());
			pstmt.setString(6, vo.getCellphone());
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			if (pstmt != null)
				pstmt.close();
		}
	}
	
	public boolean login(SrbAccountVO vo)throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from account    " + "where accountid = ? and accountpassword= ?        ";
		//SrbAccountVO result = new SrbAccountVO();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getAccountid());
			pstmt.setString(2, vo.getAccountpassword());
			rset = pstmt.executeQuery();
			if (rset.next()) {
				return true;
			}else {
				return false;
			}
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rset != null)
				rset.close();
			if (pstmt != null)
				pstmt.close();
		}
	}
	
	public SrbAccountVO getAllStatus(SrbAccountVO vo)throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from account    " + "where accountid = ? and accountpassword= ?        ";
		//SrbAccountVO result = new SrbAccountVO();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getAccountid());
			pstmt.setString(2, vo.getAccountpassword());
			rset = pstmt.executeQuery();
			if (rset.next()) {
				return loadData(rset);
			}else {
				return null;
			}
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rset != null)
				rset.close();
			if (pstmt != null)
				pstmt.close();
		}
	}
	
	public SrbAccountVO getAllStatusByAccountid(String accountid)throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from account    " + "where accountid = ? ";
		//SrbAccountVO result = new SrbAccountVO();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, accountid);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				return loadData(rset);
			}else {
				return null;
			}
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rset != null)
				rset.close();
			if (pstmt != null)
				pstmt.close();
		}
	}

}
