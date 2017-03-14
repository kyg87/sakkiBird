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
			      String sql = "SELECT  * FROM MEMBER WHERE TITLE LIKE '%"+query+"%'";
			      
			      
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
			            write.setWriter(rs.getString("WRITER"));
			            write.setRegDate(rs.getDate("REGDATEe"));
			            write.setEndDate(rs.getDate("ENDDATE"));
			            write.setContext(rs.getString("CONTEXT"));
			            write.setContext_vote1(rs.getString("CONTEXT_VOTE1"));
			            write.setContext_vote2(rs.getString("CONTEXT_VOTE2"));
			            write.setContext_vote3(rs.getString("CONTEXT_VOTE3"));
			            write.setContext_vote4(rs.getString("CONTEXT_VOTE4"));
			            write.setContext_vote5(rs.getString("CONTEXT_VOTE5"));
			            write.setHit(rs.getInt("HIT"));
			            
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
		      String sql = "INSERT INTO `motherbird`.`Writer`(`TITLE`,`WRITER`,`REGDATE`, 'ENDATE', `CONTEXT`, 'CONTEXT_Img','Context_vote1', 'Context_vote2', 'Context_vote3', 'Context_vote4', 'Context_vote5') VALUES (?,?,sysdate(),?,?,?,?,?,?,?,?)";
		            
		      List<WriterModel> list = new ArrayList<>();
		      
		      try {
		         Class.forName("com.mysql.jdbc.Driver");
		         
		         String url = "jdbc:mysql://211.238.142.84:3306/motherbird";
		         Connection con = DriverManager.getConnection(url, "kyg", "0116");
		         PreparedStatement st = con.prepareStatement(sql);
		         st.setString(1,  write.getTitle());
		         st.setString(2,  write.getWriter());
		         st.setDate(3, (Date) write.getEndDate());
		         st.setString(4,  write.getContext());
		         st.setString(5,  write.getContext_vote1());
		         st.setString(6,  write.getContext_vote2());
		         st.setString(7,  write.getContext_vote3());
		         st.setString(8,  write.getContext_vote4());
		         st.setString(9,  write.getContext_vote5());
		         
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

	}

