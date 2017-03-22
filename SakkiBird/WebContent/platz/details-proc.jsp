<%@page import="com.motherbirds.model.WriterModel"%>
<%@page import="com.motherbirds.dao.MYSQLWriter"%>
<%@page import="com.motherbirds.dao.WriterDao"%>
<%@page import="com.motherbirds.dao.MemberDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String voteId = request.getParameter("vote_id");
	String pageNum = request.getParameter("pageNum");
	System.out.print(pageNum);
	
	WriterDao vote = new MYSQLWriter();
	WriterModel model = vote.getWriteModel(Integer.parseInt(pageNum));
	
	int result = vote.update(Integer.parseInt(voteId), pageNum);
	
	if(result > 0)
		response.sendRedirect("details.jsp?page="+pageNum);
	
/* 	String user = request.getParameter("user");
	String pw = request.getParameter("pw");	
	
 	MemberDAO dao = new MemberDAO();

	int result = dao.add(voteId, pw, user);
	
	System.out.printf("account-proc" +user);
	if(result > 0)
		response.sendRedirect("index.jsp?name="+user); */

%>