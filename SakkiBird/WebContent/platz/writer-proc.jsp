<%@page import="com.motherbirds.dao.MYSQLWriter"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String file = request.getParameter("file");
	String[] selects = request.getParameterValues("select");
	
	System.out.printf("title: "+title);
	System.out.println();
	System.out.printf("content: "+content);
	System.out.println();
	System.out.printf("selects.length: "+selects.length);
	System.out.println();
	for(int i = 0 ; i < selects.length;i++)
	System.out.println(selects[i]);
	

	System.out.printf("file: "+file);
	System.out.println();
	
	
	MYSQLWriter dao = new MYSQLWriter();
	
	int result = dao.add(title, "", content, selects.length, selects, file);
	
	
	if(result > 0)
		System.out.println("Done");
	 	response.sendRedirect("index.jsp"); 
	

%>