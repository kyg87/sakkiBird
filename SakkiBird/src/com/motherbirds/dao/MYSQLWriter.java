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

import com.motherbirds.model.MemberModel;
import com.motherbirds.model.WriterModel;
public class MYSQLWriter implements WriterDao{
	
	@Override
	public int getSize(String query) {
		String sql = "SELECT COUNT(CODE) SIZE FROM BOARD_WRITE WHERE BINARY TITLE LIKE ? order by Regdate desc";
	      int size=0;
	      
	      try {
		         Class.forName("com.mysql.jdbc.Driver");
		         
		         String url = "jdbc:mysql://211.238.142.84:3306/motherbird?autoReconnect=true&amp;useSSL=false&characterEncoding=UTF-8";
		         Connection con = DriverManager.getConnection(url, "kyg", "0116");
		         PreparedStatement st = con.prepareStatement(sql);
		         st.setString(1, "%"+query+"%");
		         
		         ResultSet rs = st.executeQuery();
		         if(rs.next())
		         size=rs.getInt("SIZE");
		         
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
		      return size;
		   }

	@Override
	public List<WriterModel> getList() {
		String sql = "select * from BOARD_WRITE order by content_voterate1+content_voterate2+content_voterate3+content_voterate4+content_voterate5 desc limit 0,3 ";
		
		 List<WriterModel> list = new ArrayList<>();
	      try {
		         Class.forName("com.mysql.jdbc.Driver");
		         
		         String url = "jdbc:mysql://211.238.142.84:3306/motherbird?autoReconnect=true&amp;useSSL=false&characterEncoding=UTF-8";
		         Connection con = DriverManager.getConnection(url, "kyg", "0116");
		         Statement st = con.createStatement();
		         ResultSet rs = st.executeQuery(sql);
		         
		    
		         WriterModel write=null;
		         
		         while(rs.next()){
			            write = new WriterModel();
			            write.setCode(rs.getString("CODE"));
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


	@Override
	public List<WriterModel> getList(int page) {
		// TODO Auto-generated method stub
		return getList(page,"");
	}


	@Override
	public List<WriterModel> getList(int page, String query) {
		String sql = "SELECT* FROM BOARD_WRITE WHERE TITLE LIKE ? order by Regdate desc limit ?,9 ";
		 List<WriterModel> list = new ArrayList<>();
	      try {
		         Class.forName("com.mysql.jdbc.Driver");
		         
		         String url = "jdbc:mysql://211.238.142.84:3306/motherbird?autoReconnect=true&amp;useSSL=false&characterEncoding=UTF-8";
		         Connection con = DriverManager.getConnection(url, "kyg", "0116");
		         PreparedStatement st = con.prepareStatement(sql);
		         st.setString(1, "%"+query+"%");
		         st.setInt(2, 9*(page-1));
		      	
		         ResultSet rs = st.executeQuery();
		         
		    
		         WriterModel write=null;
		         
		         while(rs.next()){
			            write = new WriterModel();
			            write.setCode(rs.getString("CODE"));
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
		         
		         String url = "jdbc:mysql://211.238.142.84:3306/motherbird?autoReconnect=true&amp;useSSL=false&characterEncoding=UTF-8";
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
		public WriterModel getWriteModel(String num) {
			// TODO Auto-generated method stub
			 String sql = "select * from BOARD_WRITE WHERE CODE LIKE ?";
		      
	         WriterModel write = null;
		
		      
		      try {
		         Class.forName("com.mysql.jdbc.Driver");
		         
		         String url = "jdbc:mysql://211.238.142.84:3306/motherbird?autoReconnect=true&amp;useSSL=false&characterEncoding=UTF-8";
		         Connection con = DriverManager.getConnection(url, "kyg", "0116");
		         PreparedStatement st = con.prepareStatement(sql);
		         
		      	 st.setString(1, num);
		      	
		         ResultSet rs = st.executeQuery();
		         
		
		
		         
		         if(rs.next()){
		            write = new WriterModel();
		            write.setCode(rs.getString("CODE"));
		            write.setTitle(rs.getString("TITLE"));
		            write.setWriter(rs.getString("WRITER"));
		            write.setRegDate(rs.getTimestamp("REGDATE"));
		            write.setEndDate(rs.getTimestamp("ENDDATE"));
		            write.setContent(rs.getString("Content"));
		            write.setContent_first_choice(rs.getString("Content_first_choice"));
		            write.setContent_voterate1(rs.getInt("Content_voterate1"));
		            write.setContent_second_choice(rs.getString("Content_second_choice"));
		            write.setContent_voterate2(rs.getInt("Content_voterate2"));
		            write.setContent_third_choice(rs.getString("Content_third_choice"));
		            write.setContent_voterate3(rs.getInt("Content_voterate3"));
		            write.setContent_fourth_choice(rs.getString("Content_fourth_choice"));
		            write.setContent_voterate4(rs.getInt("Content_voterate4"));
		            write.setContent_fifth_choice(rs.getString("Content_fifth_choice"));
		            write.setContent_voterate5(rs.getInt("Content_voterate5"));
		            write.setHit(rs.getInt("HIT"));
		            write.setContent_img(rs.getString("content_img"));
		            write.setContent_vote(rs.getString("content_vote"));
		            
		
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

		@Override
		public int add(String title, String writer, String content, int selectCount, String[] selects, String fileName) {
			
			String codeSql = "SELECT MAX(cast(CODE as unsigned))+1 CODE FROM BOARD_WRITE";
			String sql = "";
			
			switch (selects.length) {
			case 2:
				 sql = "INSERT INTO BOARD_WRITE(CODE,TITLE,WRITER, Content, Content_Img, CONTENT_VOTE ,REGDATE, ENDDATE,CONTENT_FIRST_CHOICE, CONTENT_SECOND_CHOICE) "
							+ "VALUES (?,?,?,?,?,?,NOW(),DATE_ADD( now() , interval + 1 day),?,?)" ;
				break;
			case 3:
				 sql = "INSERT INTO BOARD_WRITE(CODE,TITLE,WRITER, Content, Content_Img, CONTENT_VOTE ,REGDATE, ENDDATE,CONTENT_FIRST_CHOICE, CONTENT_SECOND_CHOICE, CONTENT_THIRD_CHOICE) "
							+ "VALUES (?,?,?,?,?,?,NOW(),DATE_ADD( now() , interval + 1 day),?,?,?)" ;
				break;
			case 4:
				 sql = "INSERT INTO BOARD_WRITE(CODE,TITLE,WRITER, Content, Content_Img, CONTENT_VOTE ,REGDATE, ENDDATE,CONTENT_FIRST_CHOICE, CONTENT_SECOND_CHOICE, CONTENT_THIRD_CHOICE, CONTENT_FOURTH_CHOICE) "
							+ "VALUES (?,?,?,?,?,?,NOW(),DATE_ADD( now() , interval + 1 day),?,?,?,?)" ;
				break;
			case 5:
				 sql = "INSERT INTO BOARD_WRITE(CODE,TITLE,WRITER, Content, Content_Img, CONTENT_VOTE ,REGDATE, ENDDATE,CONTENT_FIRST_CHOICE, CONTENT_SECOND_CHOICE, CONTENT_THIRD_CHOICE, CONTENT_FOURTH_CHOICE, CONTENT_FIFTH_CHOICE) "
							+ "VALUES (?,?,?,?,?,?,NOW(),DATE_ADD( now() , interval + 1 day),?,?,?,?,?)" ;
				break;
	
			default:
				break;
			}
			

			
			int result = 0;
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				
				String url = "jdbc:mysql://211.238.142.84:3306/motherbird?autoReconnect=true&amp;useSSL=false&characterEncoding=UTF-8"; // DB�뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶�뜝�럥吏쀥뜝�럩援�
				Connection con = DriverManager.getConnection(url, "kyg", "0116"); // �뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럥�맶�뜝�럥吏쀥뜝�럩援꿨뜝�럡苡ュ뜝�럥�맶占쎈쐻�뜝占� �뜝�럥�맶�뜝�럥堉℡뜝�럥荑덂뜝�럩援�
				
				Statement codeSt = con.createStatement();
				ResultSet rs = codeSt.executeQuery(codeSql);
				
				rs.next();
				
				String code = rs.getString("CODE");
				if(code == null) code = "1";
				rs.close();
				codeSt.close();
				
			
				PreparedStatement st = con.prepareStatement(sql);
				
				st.setString(1,code);
				st.setString(2,title);
				st.setString(3,writer);
				st.setString(4,content);
				st.setString(5, fileName);
				st.setInt(6,selectCount);
				
				for(int i = 0; i < selects.length;i++)
				{
					st.setString(7 + i,selects[i]);
				}
				
				
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

		@Override
		public int update(int vote, String code) {
			String sql = " UPDATE BOARD_WRITE SET CONTENT_VOTERATE? = CONTENT_VOTERATE?+1 WHERE CODE = ?";
			 int result = 0;
		      try {
			         Class.forName("com.mysql.jdbc.Driver");
			         
			         String url = "jdbc:mysql://211.238.142.84:3306/motherbird?autoReconnect=true&amp;useSSL=false&characterEncoding=UTF-8";
			         Connection con = DriverManager.getConnection(url, "kyg", "0116");
			         PreparedStatement st = con.prepareStatement(sql);
			         
			         st.setInt(1, vote);
			         st.setInt(2, vote);
			         st.setString(3, code);
			      	
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

		@Override
		public String lastcode() {
			String sql = "SELECT max(cast(code as unsigned)) CODE FROM BOARD_WRITE";
			String code="0";

			try {
				Class.forName("com.mysql.jdbc.Driver");

				String url = "jdbc:mysql://211.238.142.84/motherbird?autoReconnect=true&amp;useSSL=false&characterEncoding=UTF-8";
				Connection con = DriverManager.getConnection(url, "kyg", "0116");
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(sql);
				
				if (rs.next())
					code = rs.getString("CODE");

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
			return code;
		}

		@Override
		public int hit(String code) {
			String sql = " UPDATE BOARD_WRITE SET HIT = HIT+1 WHERE CODE = ?";
				 int result = 0;
			      try {
				         Class.forName("com.mysql.jdbc.Driver");
				         
				         String url = "jdbc:mysql://211.238.142.84:3306/motherbird?autoReconnect=true&amp;useSSL=false&characterEncoding=UTF-8";
				         Connection con = DriverManager.getConnection(url, "kyg", "0116");
				         PreparedStatement st = con.prepareStatement(sql);
				         

				         st.setString(1, code);
				      	
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

		
		@Override
		public int voteAdd(String board_code,String userName) {
			String codeSql = "SELECT MAX(cast(CODE as unsigned))+1 CODE FROM VOTE_MEMBER";
			String sql = "INSERT INTO VOTE_MEMBER(CODE,BOARD_CODE,MEMBER_USERNAME) VALUES(?,?,?)";
	
			int result = 0;
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				
				String url = "jdbc:mysql://211.238.142.84:3306/motherbird?autoReconnect=true&amp;useSSL=false&characterEncoding=UTF-8"; // 
				Connection con = DriverManager.getConnection(url, "kyg", "0116"); //
				
				Statement codeSt = con.createStatement();
				ResultSet rs = codeSt.executeQuery(codeSql);
				
				rs.next();
				
				String code = rs.getString("CODE");
				if(code == null) code = "1";
				rs.close();
				codeSt.close();
				
			
				PreparedStatement st = con.prepareStatement(sql);
				
				st.setString(1,code);
				st.setString(2, board_code);
				st.setString(3,userName);
				
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

		@Override
		public Boolean isVote(String articleNum, String userName) {
			String sql = "SELECT * FROM VOTE_MEMBER where BOARD_CODE = ? and MEMBER_USERNAME = ?" ;
			
			Boolean isVoted = false;
	
			try {
				Class.forName("com.mysql.jdbc.Driver");
				
				String url = "jdbc:mysql://211.238.142.84:3306/motherbird?autoReconnect=true&amp;useSSL=false&characterEncoding=UTF-8"; // DB占쏙옙占쏙옙
				Connection con = DriverManager.getConnection(url, "kyg", "0116"); // 占쏙옙占쏙옙遣占� 占싸듸옙
				
				PreparedStatement st = con.prepareStatement(sql);			
				
				st.setString(1, articleNum);
				st.setString(2, userName);

				ResultSet rs = st.executeQuery();
				
				if(rs.next()){
					isVoted = true;
				}
				
				st.close();
				con.close();
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return isVoted;
		}



}


