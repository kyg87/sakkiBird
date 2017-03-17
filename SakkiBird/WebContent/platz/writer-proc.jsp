<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String[] selects = request.getParameterValues("select");
	
	System.out.println(title);
	System.out.println(content);
	for(int i = 0 ; i < selects.length;i++)
	System.out.println(selects[i]);
%>