<%@page import="java.io.File"%>
<%@page import="com.motherbirds.dao.MYSQLWriter"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ServletContext ctx = request.getServletContext();
	String path = ctx.getRealPath("/upload");
	out.println(path);
	
	File d = new File(path);
	//파일 업로드할 경로가 만들어지지 않는다면 만들어야함
	if(!d.exists())//경로가 존재하지 않는다면
		d.mkdir();
	
	/* MultipartRequest req = new MultipartRequest(request
	, path
	, 1024*1024*10
	, "UTF-8"
	, new DefaultFileRenamePolicy()); */

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