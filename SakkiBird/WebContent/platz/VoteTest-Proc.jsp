<%@page import="com.motherbirds.model.WriterModel"%>
<%@page import="com.motherbirds.dao.MYSQLWriter"%>
<%@page import="com.motherbirds.dao.WriterDao"%>
<%@page import="com.motherbirds.dao.VoteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String test = request.getParameter("group");
	System.out.print(test);
	
	WriterDao vote = new MYSQLWriter();
	WriterModel model = vote.getWriteModel(1001);
	
	int result = vote.update(Integer.parseInt(test), "1001");
	
	if(result > 0)
		response.sendRedirect("VoteTest.jsp?vote="+result);
	
%>
   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>