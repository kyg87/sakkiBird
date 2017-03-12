package com.motherbirds.dao;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.motherbirds.model.MemberModel;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class MemberDAO {

	   private Connection conn = null;
	   private PreparedStatement pstmt = null;
	   private ResultSet rs = null;
	   // 데이터베이스 접속 설정 정보
	   /** JDBC DRIVER 패키지 정보 */
	   private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	   /** 데이터베이스 URL */
	   private final String DB_URL = "jdbc:mysql://211.238.142.84:3306/motherbird";
	   /** 데이터베이스 아이디 */
	   private final String DB_ID = "kyg";
	   /** 데이터베이스 암호 */
	   private final String DB_PWD = "0116";
	   
	   
	   
	   public void insert(MemberModel memberModel) {
		      try {
		         // 데이터베이스 객체 생성
		         Class.forName(this.JDBC_DRIVER);
		         this.conn = (Connection) DriverManager.getConnection(this.DB_URL, this.DB_ID, this.DB_PWD);
		         this.pstmt = (PreparedStatement) this.conn.prepareStatement("INSERT INTO `motherbird`.`member`(`EMAIL`,`PW`,`REGDATE`,`USERNAME`) VALUES (?,?,sysdate(),?)");
		         this.pstmt.setString(1, memberModel.getEmail());
		         this.pstmt.setString(2, memberModel.getPw());
		         this.pstmt.setString(3, memberModel.getUsername());
		    
		         System.out.println(memberModel.getUsername());
		         this.pstmt.executeUpdate();
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         // 사용한 객체 종료
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
