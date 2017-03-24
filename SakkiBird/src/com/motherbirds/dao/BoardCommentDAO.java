package com.motherbirds.dao;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.motherbirds.model.BoardCommentModel;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class BoardCommentDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	// 占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
	/** JDBC DRIVER 占쏙옙키占쏙옙 占쏙옙占쏙옙 */
	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	/** 占쏙옙占쏙옙占싶븝옙占싱쏙옙 URL */
	private final String DB_URL = "jdbc:mysql://211.238.142.84:3306/motherbird";
	/** 占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙占싱듸옙 */
	private final String DB_ID = "kyg";
	/** 占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙호 */
	private final String DB_PWD = "0116";

	public List<BoardCommentModel> getList() {
		String sql = "SELECT  * FROM BOARD_COMMENT";
		List<BoardCommentModel> list = new ArrayList<>();

		try {			
			
			Class.forName(this.JDBC_DRIVER);
			this.conn = (Connection) DriverManager.getConnection(this.DB_URL, this.DB_ID, this.DB_PWD);
			PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery();

			BoardCommentModel boardcomment = null;

			while (rs.next()) {
				boardcomment = new BoardCommentModel();
				boardcomment.setCommentIdx(rs.getInt("COMMENT_IDX"));
				boardcomment.setCommentNum(rs.getInt("COMMENT_NUM"));
				boardcomment.setCommentParent(rs.getInt("COMMENT_PARENT"));
				boardcomment.setCommentWriter(rs.getString("COMMENT_WRITER"));
				boardcomment.setCommentContent(rs.getString("COMMENT_CONTENT"));
				boardcomment.setCommentHit(rs.getInt("COMMENT_HIT"));
				boardcomment.setCommentRegdate(rs.getDate("COMMENT_REGDATE"));
				boardcomment.setCommentImgAdr(rs.getString("COMMENT_IMAGE_ADR"));
				boardcomment.setCommentArticleNum(rs.getInt("COMMENT_ARTICLE_NUM"));
				
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
			// 占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙체 占쏙옙占쏙옙
			Class.forName(this.JDBC_DRIVER);
			this.conn = (Connection) DriverManager.getConnection(this.DB_URL, this.DB_ID, this.DB_PWD);
			/*this.pstmt = (PreparedStatement) this.conn.prepareStatement("INSERT INTO `motherbird`.`BOARD_COMMENT`"
					+ "(COMMENT_IDX, COMMMENT_NUM, COMMENT_PARENT, COMMENT_WRITER, COMMENT_CONTENT, COMMENT_HIT, COMMENT_REGDATE,"
					+ "COMMENT_IMAGE_ADR , COMMENT_ARTICLE_NUM) "
					+ "VALUES (?, ?, ?, ?, ?, ?, SYSDATE, ?, ?)");*/
			
			this.pstmt = (PreparedStatement) this.conn.prepareStatement("INSERT INTO `motherbird`.`BOARD_COMMENT`"
					+ "(COMMENT_IDX, COMMMENT_NUM, COMMENT_PARENT, COMMENT_WRITER, COMMENT_CONTENT, COMMENT_HIT, COMMENT_REGDATE,"
					+ "COMMENT_IMAGE_ADR , COMMENT_ARTICLE_NUM) "
					+ "VALUES (?, ?, ?, ?, ?, ?, SYSDATE, ?, ?)");

			this.pstmt.setInt(1, commentModel.getCommentIdx());
			this.pstmt.setInt(2, commentModel.getCommentNum());
			this.pstmt.setInt(3, commentModel.getCommentParent());
			this.pstmt.setString(4, commentModel.getCommentWriter());
			this.pstmt.setString(5, commentModel.getCommentContent());
			this.pstmt.setInt(6, commentModel.getCommentHit());
			this.pstmt.setString(7, commentModel.getCommentImgAdr());
			this.pstmt.setInt(8, commentModel.getCommentArticleNum());
			
			this.pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 占쏙옙占쏙옙占� 占쏙옙체 占쏙옙占쏙옙
			close(null, this.pstmt, this.conn);
		}
	}
	
	public void addComment(String comment) {
		try {
			// 占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙체 占쏙옙占쏙옙
			Class.forName(this.JDBC_DRIVER);
			this.conn = (Connection) DriverManager.getConnection(this.DB_URL, this.DB_ID, this.DB_PWD);			
			
			this.pstmt = (PreparedStatement) this.conn.prepareStatement("INSERT INTO BOARD_COMMENT(COMMENT_IDX, COMMENT_NUM, COMMENT_PARENT,"
					+ " COMMENT_WRITER, COMMENT_CONTENT, COMMENT_HIT, COMMENT_REGDATE,"
					+ "COMMENT_IMAGE_ADR , COMMENT_ARTICLE_NUM) "
					+ "VALUES (?, ?, ?, ?, ?, ?, NOW(), ?, ?)");

			this.pstmt.setInt(1, 9);
			this.pstmt.setInt(2, 6);
			this.pstmt.setInt(3, 0);
			this.pstmt.setString(4, "test34");
			this.pstmt.setString(5, comment);
			this.pstmt.setInt(6, 9966);
			this.pstmt.setString(7, "test/test2.img");
			this.pstmt.setInt(8, 1001);
			
			this.pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 占쏙옙占쏙옙占� 占쏙옙체 占쏙옙占쏙옙
			close(null, this.pstmt, this.conn);
		}
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
