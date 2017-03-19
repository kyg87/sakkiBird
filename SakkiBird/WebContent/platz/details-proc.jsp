<%@page import="com.motherbirds.dao.MemberDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String email = request.getParameter("vote_id");
	String user = request.getParameter("user");
	String pw = request.getParameter("pw");	
	
 	MemberDAO dao = new MemberDAO();

	int result = dao.add(email, pw, user);
	
	System.out.printf("account-proc" +user);
	if(result > 0)
		response.sendRedirect("index.jsp?name="+user);

%>