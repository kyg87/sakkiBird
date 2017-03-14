package com.motherbirds.dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.motherbirds.model.MemberModel;


public class MemberDAO {

	public List<MemberModel> getList() {
		String sql = "SELECT * FROM MEMBER";
		List<MemberModel> list = new ArrayList<>();

		try {
			Class.forName("com.mysql.jdbc.Driver");

			String url = "jdbc:mysql://211.238.142.84:3306/motherbird";// DB����
			Connection con = DriverManager.getConnection(url, "kyg", "0116"); // ����̺�
																				// �ε�
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);

			MemberModel MEMMODEL = null;

			while (rs.next()) {
				MEMMODEL = new MemberModel();
				MEMMODEL.setID(rs.getString("ID"));
				MEMMODEL.setEMAIL(rs.getString("EMAIL"));
				MEMMODEL.setPW(rs.getString("PW"));
				MEMMODEL.setUSERNAME(rs.getString("USERNAME"));
				MEMMODEL.setREGDATE(rs.getDate("REGDATE"));

				list.add(MEMMODEL);
			}

			rs.close();
			st.close();
			con.close();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public void ADD(MemberModel member) {
		String sql = "INSERT INTO MEMBER(ID,EMAIL,PW,USERNAME,REGDATE) VALUES(?,?,?,?,sysdate());";
		List<MemberModel> list = new ArrayList<>();

		try {
			Class.forName("com.mysql.jdbc.Driver");

			String url = "jdbc:mysql://211.238.142.84:3306/motherbird";// DB����
			Connection con = DriverManager.getConnection(url, "kyg", "0116"); // ����̺�
																				// �ε�
			PreparedStatement st = con.prepareStatement(sql);
			int result = st.executeUpdate();
			
			st.setString(1, member.getID());
			st.setString(2, member.getEMAIL());
			st.setString(3, member.getPW());
			st.setString(4, member.getUSERNAME());
			

			
			st.close();
			con.close();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
