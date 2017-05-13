package com.srd.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.srd.vo.MessageVO;

public class MessageDAO {
	private Connection conn;

	public MessageDAO(Connection conn) {
		this.conn = conn;
	}
	
	private MessageVO loadData(ResultSet rset) throws SQLException {
		MessageVO vo = new MessageVO();
		vo.setIdmessage(rset.getInt("idmessage"));
		vo.setFromId(rset.getString("fromId"));
		vo.setToId(rset.getString("toId"));
		vo.setMessage(rset.getString("message"));
		vo.setIdtransaction(rset.getInt("idtransaction")+"");
		vo.setTimestamp(rset.getTimestamp("time"));
		return vo;
	}
	
	public List<MessageVO> getConversationByIdtransaction(String idtransaction) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from message where idtransaction=? order by time " ;
		List<MessageVO> result = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idtransaction);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				MessageVO tmp = new MessageVO();
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
	
	public void insert(MessageVO vo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "insert into message(                           "
				+ "   fromId,toId,message,time,idtransaction " + "  )  "
				+ "values(       ?,?,?,now(),?  )         ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getFromId());
			pstmt.setString(2, vo.getToId());
			pstmt.setString(3, vo.getMessage());
			pstmt.setString(4, vo.getIdtransaction());
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			if (pstmt != null)
				pstmt.close();
		}
	}
	public List<MessageVO> getLatestConversation(MessageVO vo) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from message where idtransaction=? and fromId=? and toId=? order by time " ;
		List<MessageVO> result = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getIdtransaction());
			pstmt.setString(2, vo.getFromId());
			pstmt.setString(3, vo.getToId());
			rset = pstmt.executeQuery();
			while (rset.next()) {
				
				MessageVO tmp = new MessageVO();
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
	
	public MessageVO getLatestConversationProductId(String accountId) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from message where toId=?  order by time DESC" ;
		MessageVO result = new MessageVO();
		//String idproduct = "";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, accountId);
			
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
}
