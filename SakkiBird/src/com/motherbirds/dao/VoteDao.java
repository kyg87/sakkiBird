package com.motherbirds.dao;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.motherbirds.model.WriterModel;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class VoteDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";	
	private final String DB_URL = "jdbc:mysql://211.238.142.84:3306/motherbird";	
	private final String DB_ID = "kyg";	
	private final String DB_PWD = "0116";
	
	
	public List<WriterModel> getList() {
		String sql = "SELECT  * FROM BOARD_COMMENT";
		List<WriterModel> list = new ArrayList<>();

		try {			
			
			Class.forName(this.JDBC_DRIVER);
			this.conn = (Connection) DriverManager.getConnection(this.DB_URL, this.DB_ID, this.DB_PWD);
			PreparedStatement st = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery();

			WriterModel vote = null;

			while (rs.next()) {
				vote = new WriterModel();
				vote.setCode(rs.getString("CODE"));
				vote.setTitle(rs.getString("TITLE"));
				vote.setWriter(rs.getString("WRITER"));
				vote.setRegDate(rs.getDate("REGDATE"));
				vote.setContent(rs.getString("CONTENT"));
				vote.setContent_vote(rs.getString("CONTENT_VOTE"));
				vote.setContent_first_choice(rs.getString("CONTENT_FIRST_CHOICE"));
				vote.setContent_second_choice(rs.getString("CONTENT_SECOND_CHOICE"));
				vote.setContent_voterate1(rs.getInt("CONTENT_VOTERATE1"));
				vote.setContent_voterate2(rs.getInt("CONTENT_VOTERATE2"));
				vote.setContent_vote_cnt(rs.getInt("CONTENT_VOTE_CNT"));
							
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
}
