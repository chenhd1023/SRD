package com.srd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.srd.vo.CommentVO;
import com.srd.vo.TransactionVO;

public class CommentDAO {
	private Connection conn;

	public CommentDAO(Connection conn) {
		this.conn = conn;
	}

	private CommentVO loadData(ResultSet rset) throws SQLException {
		CommentVO vo = new CommentVO();
		vo.setIdcomment(rset.getInt("idcomment"));
		vo.setIdtransaction(rset.getString("idtransaction"));
		vo.setRole(rset.getString("role"));
		vo.setType(rset.getString("type"));
		vo.setAccountid(rset.getString("accountid"));
		vo.setScore(rset.getString("score"));
		vo.setDiscription(rset.getString("discription"));
		vo.setStatus(rset.getString("status"));
		vo.setDate(rset.getString("date").substring(0,10));
		return vo;
	}
	
	public void createNewComment(CommentVO vo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "insert into comment( idtransaction,role,type,accountid,status,date  ) values(  ?,?,?,?,?,now())         ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getIdtransaction());
			pstmt.setString(2, vo.getRole());
			pstmt.setString(3, vo.getType());
			pstmt.setString(4, vo.getAccountid());
			pstmt.setString(5, "commentyet");
			//pstmt.setString(5, null);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			if (pstmt != null)
				pstmt.close();
		}
	}
	
	public void submitComment(CommentVO vo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "update comment set score=? ,   discription=?,  date=now() , status='done'  where idcomment=?    ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getScore());
			pstmt.setString(2, vo.getDiscription());
			pstmt.setInt(3, vo.getIdcomment());
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			if (pstmt != null)
				pstmt.close();
		}
	}
	
	public List<CommentVO> getCommentDone(String accountid,String type,String role) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from comment where accountid=? and status='done' and type=? and role=? order by date";
		List<CommentVO> result = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, accountid);
			pstmt.setString(2, type);
			pstmt.setString(3, role);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				CommentVO tmp = new CommentVO();
				tmp = loadData(rset);
				tmp.setTransactionVO(getTransactionVOByIdtransaction(tmp.getIdtransaction()));
				if ("product".equals(type)) {
					tmp.setImg(getImgByTransaction(tmp.getTransactionVO()));
				} else if("person".equals(type)){
					if ("buyer".equals(role)) {
						tmp.setImg(getPhotoByAccountid(tmp.getTransactionVO().getSeller()));
					} else if("seller".equals(role)){
						tmp.setImg(getPhotoByAccountid(tmp.getTransactionVO().getBuyer()));
					}
				}
				result.add(tmp);
			}
		} catch (Exception e) {
			throw e;
		} finally {
			if (pstmt != null)
				pstmt.close();
		}
		return result;
	}
	
	public List<CommentVO> getCommentyetsByAccountID(String accountid) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from comment where accountid=? and status='commentyet' and type='product' order by date";
		List<CommentVO> result = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, accountid);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				CommentVO tmp = new CommentVO();
				tmp = loadData(rset);
				tmp.setTransactionVO(getTransactionVOByIdtransaction(tmp.getIdtransaction()));
				tmp.setImg(getImgByTransaction(tmp.getTransactionVO()));
				result.add(tmp);
			}
		} catch (Exception e) {
			throw e;
		} finally {
			if (pstmt != null)
				pstmt.close();
		}
		return result;
	}
	
	public CommentVO getOneCommentByIdcomment(String Idcomment) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from comment where idcomment=? ";
		CommentVO result = new CommentVO();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Idcomment);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				result = loadData(rset);
				result.setTransactionVO(getTransactionVOByIdtransaction(result.getIdtransaction()));
				if ("product".equals(result.getType())) {
					result.setImg(getImgByTransaction(result.getTransactionVO()));
				} else if("person".equals(result.getType())){
					if ("buyer".equals(result.getRole())) {
						result.setImg(getPhotoByAccountid(result.getTransactionVO().getSeller()));
					} else if("seller".equals(result.getRole())){
						result.setImg(getPhotoByAccountid(result.getTransactionVO().getBuyer()));
					}
				}
				
			}
		} catch (Exception e) {
			throw e;
		} finally {
			if (pstmt != null)
				pstmt.close();
		}
		return result;
	}
	
	public TransactionVO getTransactionVOByIdtransaction(String idtransaction) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from transaction where idtransaction=? ";
		TransactionVO result = new TransactionVO();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idtransaction);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				result.setIdtransaction(rset.getInt("idtransaction"));
				result.setIdproduct(rset.getString("idproduct"));
				result.setBuyer(rset.getString("buyer"));
				result.setSeller(rset.getString("seller"));
				result.setStatus(rset.getString("status") );
				result.setProductname(rset.getString("productname"));
				result.setProductOrWanted(rset.getString("productOrWanted"));
			}
		} catch (Exception e) {
			throw e;
		} finally {
			if (pstmt != null)
				pstmt.close();
		}
		return result;
	}
	
	public String getImgByTransaction(TransactionVO vo) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql="";
		if ("product".equals(vo.getProductOrWanted())) {
			 sql = "select picture1 from product where idproduct=? ";
		} else if("wanted".equals(vo.getProductOrWanted())){
			 sql = "select picture from wanted where idwanted=? ";
		}
		
		String result = "";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getIdproduct());
			rset = pstmt.executeQuery();
			while (rset.next()) {
				result=rset.getString(1);
			}
		} catch (Exception e) {
			throw e;
		} finally {
			if (pstmt != null)
				pstmt.close();
		}
		return result;
	}
	
	public String getPhotoByAccountid(String accountid) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql= "select photo from account where accountid=? ";
		String result = "";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, accountid);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				result=rset.getString(1);
			}
		} catch (Exception e) {
			throw e;
		} finally {
			if (pstmt != null)
				pstmt.close();
		}
		return result;
	}
	
	public float getPersonCommentScore(String targetAccountid) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql= "SELECT score FROM srb.comment LEFT JOIN srb.transaction ON comment.idtransaction = transaction.idtransaction where role='buyer' and type='person' and comment.status='done' and seller=?";
		int i = 0;
		int score = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, targetAccountid);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				String tmp ="";
				tmp=rset.getString(1);
				System.out.println(tmp);
				score=score+Integer.parseInt(tmp);
				System.out.println(score);
				i++;
				System.out.println(i);
			}
			
		} catch (Exception e) {
			throw e;
		} finally {
			if (pstmt != null)
				pstmt.close();
		}
		if (i==0) {
			return -1;
		} else {
			return score/i;
		}
		
	}
	
	public List<CommentVO> getProductComments(String targetidproduct) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql= "SELECT * FROM srb.comment LEFT JOIN srb.transaction ON comment.idtransaction = transaction.idtransaction where role='buyer' and type='product' and comment.status='done' and productOrWanted='product' and idproduct=?";
		List<CommentVO> result = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, targetidproduct);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				CommentVO tmp = new CommentVO();
				tmp = loadData(rset);
				result.add(tmp);
			}
			
		} catch (Exception e) {
			throw e;
		} finally {
			if (pstmt != null)
				pstmt.close();
		}
			return result;
		
	}
}
