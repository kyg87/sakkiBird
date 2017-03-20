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
	// �����ͺ��̽� ���� ���� ����
	/** JDBC DRIVER ��Ű�� ���� */
	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	/** �����ͺ��̽� URL */
	private final String DB_URL = "jdbc:mysql://211.238.142.84:3306/motherbird";
	/** �����ͺ��̽� ���̵� */
	private final String DB_ID = "kyg";
	/** �����ͺ��̽� ��ȣ */
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
			// �����ͺ��̽� ��ü ����
			Class.forName(this.JDBC_DRIVER);
			this.conn = (Connection) DriverManager.getConnection(this.DB_URL, this.DB_ID, this.DB_PWD);
			this.pstmt = (PreparedStatement) this.conn.prepareStatement("INSERT INTO `motherbird`.`BOARD_COMMENT`"
					+ "(COMMMENT_NUM, COMMENT_PARENT, COMMENT_WRITER, COMMENT_CONTENT, COMMENT_HIT, COMMENT_REGDATE,"
					+ "COMMENT_IMAGE_ADR , COMMENT_ARTICLE_NUM) "
					+ "VALUES (?, ?, ?, ?, ?, SYSDATE, ?, ?)");

			this.pstmt.setInt(1, commentModel.getCommentNum());
			this.pstmt.setInt(2, commentModel.getCommentParent());
			this.pstmt.setString(3, commentModel.getCommentWriter());
			this.pstmt.setString(4, commentModel.getCommentContent());
			this.pstmt.setInt(5, commentModel.getCommentHit());
			this.pstmt.setString(6, commentModel.getCommentImgAdr());
			this.pstmt.setInt(7, commentModel.getCommentArticleNum());
			
			this.pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// ����� ��ü ����
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
