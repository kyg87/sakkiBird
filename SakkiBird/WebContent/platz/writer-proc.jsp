
<%@page import="com.motherbirds.dao.WriterDao"%>
<%@page import="com.motherbirds.model.BoardFile"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.motherbirds.dao.MYSQLBoardFile"%>
<%@page import="com.motherbirds.dao.BoardFileDao"%>
<%@page import="com.motherbirds.dao.MYSQLWriter"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
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
	
	 MultipartRequest req = new MultipartRequest(request
	, path
	, 1024*1024*10
	, "UTF-8"
	, new DefaultFileRenamePolicy()); 

	/* req.setCharacterEncoding("UTF-8"); */
	String title = req.getParameter("title");
	String content = req.getParameter("content");
	String file = req.getParameter("file");
	String[] selects = req.getParameterValues("select");
	
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
	
	
	WriterDao dao = new MYSQLWriter();
	
	int result = dao.add(title, "세은", content, selects.length, selects, file);
	 	
	String boardCode = dao.lastcode();
	System.out.println(boardCode);
	BoardFileDao noticeFileDao = new MYSQLBoardFile();

	Enumeration fnames = req.getFileNames();

	while (fnames.hasMoreElements()) {
		String f = (String) fnames.nextElement();
		String fname = req.getFilesystemName(f);

		BoardFile file2 = new BoardFile();
		file2.setBoardCode(boardCode);
		file2.setSrc(fname);
		noticeFileDao.add(file2);

		out.println("<br/>" + f);
		out.println("<br/>" + fname);
	}
	
	if(result > 0)
		System.out.println("Done");
	 	response.sendRedirect("index.jsp");
	
%>