package com.motherbirds.dao;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.motherbirds.model.BoardCommentModel;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class BoardCommentDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	
	private final String DB_URL = "jdbc:mysql://211.238.142.84:3306/motherbird?autoReconnect=true&amp;useSSL=false&characterEncoding=UTF-8";
	
	private final String DB_ID = "kyg";
	
	private final String DB_PWD = "0116";

	public List<BoardCommentModel> getList(String article_num) {
		String sql = "SELECT  * FROM BOARD_COMMENT WHERE COMMENT_ARTICLE_CODE = ?";
		List<BoardCommentModel> list = new ArrayList<>();

		try {			
			
			Class.forName(this.JDBC_DRIVER);
			this.conn = (Connection) DriverManager.getConnection(this.DB_URL, this.DB_ID, this.DB_PWD);
			PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
			
			st.setString(1, article_num);
			
			ResultSet rs = st.executeQuery();

			BoardCommentModel boardcomment = null;

			while (rs.next()) {
				boardcomment = new BoardCommentModel();
				boardcomment.setCommentCode(rs.getString("COMMENT_CODE"));
				boardcomment.setCommentNum(rs.getInt("COMMENT_NUM"));
				boardcomment.setCommentParent(rs.getInt("COMMENT_PARENT"));
				boardcomment.setCommentWriter(rs.getString("COMMENT_WRITER"));
				boardcomment.setCommentContent(rs.getString("COMMENT_CONTENT"));
				boardcomment.setCommentHit(rs.getInt("COMMENT_HIT"));
				boardcomment.setCommentRegdate(rs.getDate("COMMENT_REGDATE"));
				boardcomment.setCommentImgAdr(rs.getString("COMMENT_IMAGE_ADR"));
				boardcomment.setCommentArticleCode(rs.getString("COMMENT_ARTICLE_CODE"));
				
				list.add(boardcomment);
			}
			
			rs.close();
			st.close();
			conn.close();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public void insert(BoardCommentModel commentModel) {
		try {
			// �뜝�룞�삕�뜝�룞�삕�뜝�떢釉앹삕�뜝�떛�룞�삕 �뜝�룞�삕泥� �뜝�룞�삕�뜝�룞�삕
			Class.forName(this.JDBC_DRIVER);
			this.conn = (Connection) DriverManager.getConnection(this.DB_URL, this.DB_ID, this.DB_PWD);
			/*this.pstmt = (PreparedStatement) this.conn.prepareStatement("INSERT INTO `motherbird`.`BOARD_COMMENT`"
					+ "(COMMENT_IDX, COMMMENT_NUM, COMMENT_PARENT, COMMENT_WRITER, COMMENT_CONTENT, COMMENT_HIT, COMMENT_REGDATE,"
					+ "COMMENT_IMAGE_ADR , COMMENT_ARTICLE_NUM) "
					+ "VALUES (?, ?, ?, ?, ?, ?, SYSDATE, ?, ?)");*/
			
			this.pstmt = (PreparedStatement) this.conn.prepareStatement("INSERT INTO `motherbird`.`BOARD_COMMENT`"
					+ "(COMMENT_CODE, COMMMENT_NUM, COMMENT_PARENT, COMMENT_WRITER, COMMENT_CONTENT, COMMENT_HIT, COMMENT_REGDATE,"
					+ "COMMENT_IMAGE_ADR , COMMENT_ARTICLE_CODE) "
					+ "VALUES (?, ?, ?, ?, ?, ?, SYSDATE, ?, ?)");

			this.pstmt.setString(1, commentModel.getCommentCode());
			this.pstmt.setInt(2, commentModel.getCommentNum());
			this.pstmt.setInt(3, commentModel.getCommentParent());
			this.pstmt.setString(4, commentModel.getCommentWriter());
			this.pstmt.setString(5, commentModel.getCommentContent());
			this.pstmt.setInt(6, commentModel.getCommentHit());
			this.pstmt.setString(7, commentModel.getCommentImgAdr());
			this.pstmt.setString(8, commentModel.getCommentArticleCode());
			
			this.pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// �뜝�룞�삕�뜝�룞�삕�뜝占� �뜝�룞�삕泥� �뜝�룞�삕�뜝�룞�삕
			close(null, this.pstmt, this.conn);
		}
	}
	
	public int addComment(String comment,String aticle_code,String userName) {
		String codeSql = "SELECT MAX(cast(COMMENT_CODE as unsigned))+1 CODE FROM BOARD_COMMENT";
		int result = 0;
		try {
		
			Class.forName(this.JDBC_DRIVER);
			this.conn = (Connection) DriverManager.getConnection(this.DB_URL, this.DB_ID, this.DB_PWD);
			
			Statement codeSt = conn.createStatement();
			ResultSet rs = codeSt.executeQuery(codeSql);
			
			rs.next();
			String code = rs.getString("CODE");
			if(code == null) code = "1";
			
			rs.close();
			codeSt.close();

			this.conn = (Connection) DriverManager.getConnection(this.DB_URL, this.DB_ID, this.DB_PWD);			
			
			this.pstmt = (PreparedStatement) this.conn.prepareStatement("INSERT INTO BOARD_COMMENT(COMMENT_CODE, COMMENT_NUM, COMMENT_PARENT,"
					+ " COMMENT_WRITER, COMMENT_CONTENT, COMMENT_HIT, COMMENT_REGDATE,"
					+ "COMMENT_IMAGE_ADR , COMMENT_ARTICLE_CODE) "
					+ "VALUES (?, ?, ?, ?, ?, ?, NOW(), ?, ?)");

			this.pstmt.setString(1, code);
			this.pstmt.setInt(2, 6);
			this.pstmt.setInt(3, 0);
			this.pstmt.setString(4, userName);
			this.pstmt.setString(5, comment);
			this.pstmt.setInt(6, 9966);
			this.pstmt.setString(7, "test/test2.img");
			this.pstmt.setString(8, aticle_code);
			
			result = this.pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		
			close(null, this.pstmt, this.conn);
		}
		
		return result;
	}

	public void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
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
