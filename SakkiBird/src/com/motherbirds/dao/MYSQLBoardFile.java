package com.motherbirds.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.motherbirds.model.BoardFile;

public class MYSQLBoardFile implements BoardFileDao{

	@Override
	public List<BoardFile> getList(String boardCode) {
		String sql = "SELECT * FROM BOARD_FILE WHERE BOARD_CODE=?";

		List<BoardFile> list = new ArrayList<>();

		try {
			Class.forName("com.mysql.jdbc.Driver");

			String url = "jdbc:mysql://211.238.142.84:3306/motherbird?autoReconnect=true&amp;useSSL=false&characterEncoding=UTF-8";
	         Connection con = DriverManager.getConnection(url, "kyg", "0116");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, boardCode);

			ResultSet rs = st.executeQuery();

			BoardFile file = null;

			while (rs.next()) {
				file = new BoardFile();
				file.setCode(rs.getString("CODE"));
				file.setSrc(rs.getString("SRC"));
				file.setBoardCode(rs.getString("BOARD_CODE"));
				list.add(file);
			}

			rs.close();
			st.close();
			con.close();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int add(BoardFile file) {
		
		return add(file.getSrc(),file.getBoardCode());
	}

	@Override
	public int add(String src, String boardCode) {
		String codeSql = "SELECT IFNULL(max(cast(code as unsigned)),0)+1 CODE from BOARD_FILE";
		String sql = "INSERT INTO BOARD_FILE(CODE,SRC,BOARD_CODE) VALUES(?,?,?)";

		int result = 0;

		try {
			Class.forName("com.mysql.jdbc.Driver");

			String url = "jdbc:mysql://211.238.142.84:3306/motherbird?autoReconnect=true&amp;useSSL=false&characterEncoding=UTF-8";
	        Connection con = DriverManager.getConnection(url, "kyg", "0116");
			Statement codeSt = con.createStatement();
			ResultSet rs = codeSt.executeQuery(codeSql);
			rs.next();
			String code = rs.getString("CODE");
			rs.close();
			codeSt.close();

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, code);
			st.setString(2, src);
			st.setString(3, boardCode);


			result = st.executeUpdate();

			st.close();
			con.close();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

}
