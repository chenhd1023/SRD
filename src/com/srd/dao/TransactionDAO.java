package com.srd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.srd.vo.TransactionVO;

public class TransactionDAO {
	private Connection conn;

	public TransactionDAO(Connection conn) {
		this.conn = conn;
	}

	private TransactionVO loadData(ResultSet rset) throws SQLException {
		TransactionVO vo = new TransactionVO();
		vo.setIdtransaction(rset.getInt("idtransaction"));
		vo.setIdproduct(rset.getString("idproduct"));
		vo.setBuyer(rset.getString("buyer"));
		vo.setSeller(rset.getString("seller"));
		vo.setStatus(rset.getString("status") );
		vo.setProductname(rset.getString("productname"));
		vo.setProductOrWanted(rset.getString("productOrWanted"));
		return vo;
	}

	public boolean checkTransactionExist(TransactionVO vo) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from transaction where idproduct=? and buyer=?  and  seller=?  ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getIdproduct());
			pstmt.setString(2, vo.getBuyer());
			pstmt.setString(3, vo.getSeller());

			rset = pstmt.executeQuery();
			if (rset.next()) {
				return true;
			}
		} catch (SQLException e) {
			throw e;
		} finally {
			if (rset != null)
				rset.close();
			if (pstmt != null)
				pstmt.close();
		}
		return false;
	}

	public void insert(TransactionVO vo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "insert into transaction(                           "
				+ "   idproduct,buyer,seller,status,productname,time,productOrWanted "
				+ "  )  " + "values(       ?,?,?,?,?,now(),?  )         ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getIdproduct());
			pstmt.setString(2, vo.getBuyer());
			pstmt.setString(3, vo.getSeller());
			pstmt.setString(4, vo.getStatus());
			pstmt.setString(5, vo.getProductname());
			pstmt.setString(6, vo.getProductOrWanted());
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			if (pstmt != null)
				pstmt.close();
		}
	}
	
	public void updateStatus(String idtransaction,String status) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "update transaction set status=?  where idtransaction=?    ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, status);
			pstmt.setString(2, idtransaction);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			if (pstmt != null)
				pstmt.close();
		}
	}

	public List<TransactionVO> getAllTransactionByAccountid(String accountid)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from transaction where  buyer=?  or  seller=? order by time desc ";
		List<TransactionVO> result = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, accountid);
			pstmt.setString(2, accountid);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				TransactionVO tmp = new TransactionVO();
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

	public TransactionVO getOneTransaction(TransactionVO vo)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from transaction where idproduct=? and buyer=?  and  seller=?  ";
		TransactionVO result = new TransactionVO();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getIdproduct());
			pstmt.setString(2, vo.getBuyer());
			pstmt.setString(3, vo.getSeller());

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
	
	public TransactionVO getTransactionByID(String idtransaction) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from transaction where idtransaction=?  ";
		TransactionVO result = new TransactionVO();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idtransaction);

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
	
	public TransactionVO getLatestTransaction(String accountid)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from transaction where buyer=?  or  seller=? order by time desc ";
		TransactionVO result = new TransactionVO();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, accountid);
			pstmt.setString(2, accountid);
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
}
