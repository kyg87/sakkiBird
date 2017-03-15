package com.motherbirds.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.motherbirds.model.WriterModel;
public class MYSQLWriter implements WriterDao{
			  public List<WriterModel> getList(String query) {
			      String sql = "select * from BOARD_WRITE WHERE TITLE LIKE '%"+query+"%'";
			      
			      
			      List<WriterModel> list = new ArrayList<>();
			      
			      try {
			         Class.forName("com.mysql.jdbc.Driver");
			         
			         String url = "jdbc:mysql://211.238.142.84:3306/motherbird";
			         Connection con = DriverManager.getConnection(url, "kyg", "0116");
			         Statement st = con.createStatement();
			         ResultSet rs = st.executeQuery(sql);
			         
			         WriterModel write = null;
			         
			         while(rs.next()){
			            write = new WriterModel();
			            write.setNum(rs.getInt("NUM"));
			            write.setTitle(rs.getString("TITLE"));
			            write.setWriter(rs.getString("WRITER"));
			            write.setRegDate(rs.getDate("REGDATE"));
			            write.setEndDate(rs.getDate("ENDDATE"));
			            write.setContent(rs.getString("Content"));
			            write.setContent_first_choice(rs.getString("Content_first_choice"));
			            write.setContent_voterate1(rs.getInt("Content_voterate1"));
			            write.setContent_second_choice(rs.getString("Content_second_choice"));
			            write.setContent_voterate1(rs.getInt("Content_voterate2"));
			            write.setContent_third_choice(rs.getString("Content_third_choice"));
			            write.setContent_voterate1(rs.getInt("Content_voterate3"));
			            write.setContent_fourth_choice(rs.getString("Content_fourth_choice"));
			            write.setContent_voterate1(rs.getInt("Content_voterate4"));
			            write.setContent_fifth_choice(rs.getString("Content_fifth_choice"));
			            write.setContent_voterate1(rs.getInt("Content_voterate5"));
			            write.setHit(rs.getInt("HIT"));
			            write.setContent_img(rs.getString("content_img"));
			            
			            list.add(write);
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
		   public int add(WriterModel write) {
		      String sql = "INSERT INTO BOARD_WRITE(`TITLE`,`WRITER`,`REGDATE`, 'ENDATE', `Content`, 'Content_Img','Content_vote1', 'Content_vote2', 'Content_vote3', 'Content_vote4', 'Content_vote5') VALUES (?,?,sysdate(),?,?,?,?,?,?,?,?)";
		            
		      List<WriterModel> list = new ArrayList<>();
		      
		      try {
		         Class.forName("com.mysql.jdbc.Driver");
		         
		         String url = "jdbc:mysql://211.238.142.84:3306/motherbird";
		         Connection con = DriverManager.getConnection(url, "kyg", "0116");
		         PreparedStatement st = con.prepareStatement(sql);
		         st.setString(1,  write.getTitle());
		         st.setString(2,  write.getWriter());
		         st.setDate(3, (Date) write.getEndDate());
		         st.setString(4,  write.getContent());
		         st.setString(5,  write.getContent_first_choice());
		         st.setString(6,  write.getContent_second_choice());
		         st.setString(7,  write.getContent_third_choice());
		         st.setString(8,  write.getContent_fourth_choice());
		         st.setString(9,  write.getContent_fifth_choice());
		         
		         int result = st.executeUpdate();
		         
		         st.close();
		         con.close();
		                                 
		      } catch (ClassNotFoundException e) {

		         e.printStackTrace();
		      } catch (SQLException e) {

		         e.printStackTrace();
		      }
		      return 0;
		   }
		   
		   
		@Override
		public WriterModel getWriteModel(int num) {
			// TODO Auto-generated method stub
			 String sql = "select * from BOARD_WRITE WHERE NUM LIKE ?";
		      
	         WriterModel write = null;
		
		      
		      try {
		         Class.forName("com.mysql.jdbc.Driver");
		         
		         String url = "jdbc:mysql://211.238.142.84:3306/motherbird";
		         Connection con = DriverManager.getConnection(url, "kyg", "0116");
		         PreparedStatement st = con.prepareStatement(sql);
		         
		      	 st.setInt(1, num);
		      	
		         ResultSet rs = st.executeQuery();
		         
		
		
		         
		         if(rs.next()){
		            write = new WriterModel();
		            write.setNum(rs.getInt("NUM"));
		            write.setTitle(rs.getString("TITLE"));
		            write.setWriter(rs.getString("WRITER"));
		            write.setRegDate(rs.getDate("REGDATE"));
		            write.setEndDate(rs.getDate("ENDDATE"));
		            write.setContent(rs.getString("Content"));
		            write.setContent_first_choice(rs.getString("Content_first_choice"));
		            write.setContent_voterate1(rs.getInt("Content_voterate1"));
		            write.setContent_second_choice(rs.getString("Content_second_choice"));
		            write.setContent_voterate1(rs.getInt("Content_voterate2"));
		            write.setContent_third_choice(rs.getString("Content_third_choice"));
		            write.setContent_voterate1(rs.getInt("Content_voterate3"));
		            write.setContent_fourth_choice(rs.getString("Content_fourth_choice"));
		            write.setContent_voterate1(rs.getInt("Content_voterate4"));
		            write.setContent_fifth_choice(rs.getString("Content_fifth_choice"));
		            write.setContent_voterate1(rs.getInt("Content_voterate5"));
		            write.setHit(rs.getInt("HIT"));
		            write.setContent_img(rs.getString("content_img"));
		            
		
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
		      return write;
		}

	}

