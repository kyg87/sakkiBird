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


public class MemberDAO implements MemberInter{

	public List<MemberModel> getList() {
		String sql = "SELECT * FROM MEMBER";
		List<MemberModel> list = new ArrayList<>();

		try {
			Class.forName("com.mysql.jdbc.Driver");

			String url = "jdbc:mysql://211.238.142.84:3306/motherbird";// DB占쏙옙占쏙옙
			Connection con = DriverManager.getConnection(url, "kyg", "0116"); // 占쏙옙占쏙옙遣占�
																				// 占싸듸옙
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);

			MemberModel MEMMODEL = null;

			while (rs.next()) {
/*				MEMMODEL = new MemberModel();
				MEMMODEL.setID(rs.getString("ID"));
				MEMMODEL.setEMAIL(rs.getString("EMAIL"));
				MEMMODEL.setPW(rs.getString("PW"));
				MEMMODEL.setUSERNAME(rs.getString("USERNAME"));
				MEMMODEL.setREGDATE(rs.getDate("REGDATE"));*/

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

			String url = "jdbc:mysql://211.238.142.84:3306/motherbird";// DB占쏙옙占쏙옙
			Connection con = DriverManager.getConnection(url, "kyg", "0116"); // 占쏙옙占쏙옙遣占�
																				// 占싸듸옙
			PreparedStatement st = con.prepareStatement(sql);
			int result = st.executeUpdate();
			
	/*		st.setString(1, member.getID());
			st.setString(2, member.getEMAIL());
			st.setString(3, member.getPW());
			st.setString(4, member.getUSERNAME());*/
			

			
			st.close();
			con.close();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	public int add(String email,String pw,String user)
	{
		String codeSql = "SELECT MAX(cast(CODE as unsigned))+1 CODE FROM MEMBER";
		
		String sql = "INSERT INTO MEMBER(CODE,EMAIL,PW,USERNAME,REGDATE) VALUES(?,?,?,?,NOW())" ;
		
		int result = 0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String url = "jdbc:mysql://211.238.142.84:3306/motherbird?autoReconnect=true&amp;useSSL=false&characterEncoding=UTF-8"; // DB占쏙옙占쏙옙
			Connection con = DriverManager.getConnection(url, "kyg", "0116"); // 占쏙옙占쏙옙遣占� 占싸듸옙
			
			Statement codeSt = con.createStatement();
			ResultSet rs = codeSt.executeQuery(codeSql);
			
			rs.next();
			
			String code = rs.getString("CODE");
			rs.close();
			codeSt.close();
			
		
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setString(1,code);
			st.setString(2,email);
			st.setString(3,pw);
			st.setString(4,user);
			
			
			result = st.executeUpdate();

			
			st.close();
			con.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public MemberModel get(String email,String pw)
	{

		String sql = "SELECT * FROM MEMBER where EMAIL = ? and PW = ?" ;
		
		MemberModel member = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String url = "jdbc:mysql://211.238.142.84:3306/motherbird?autoReconnect=true&amp;useSSL=false&characterEncoding=UTF-8"; // DB占쏙옙占쏙옙
			Connection con = DriverManager.getConnection(url, "kyg", "0116"); // 占쏙옙占쏙옙遣占� 占싸듸옙
			
			PreparedStatement st = con.prepareStatement(sql);			
			
			st.setString(1, email);
			st.setString(2, pw);

			ResultSet rs = st.executeQuery();
			
			if(rs.next()){
			
				member = new MemberModel();
				
				member.setCode(rs.getString("CODE"));
				member.setEmail(rs.getString("EMAIL"));
				member.setUserName(rs.getString("USERNAME"));

			}
			
			st.close();
			con.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return member;
	}

}
