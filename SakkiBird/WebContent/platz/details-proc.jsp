<%@page import="com.motherbirds.model.WriterModel"%>
<%@page import="com.motherbirds.dao.MYSQLWriter"%>
<%@page import="com.motherbirds.dao.WriterDao"%>
<%@page import="com.motherbirds.dao.MemberDAO"%>
<%@page import="com.motherbirds.dao.BoardCommentDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	BoardCommentDAO BCDao = new BoardCommentDAO();

	request.setCharacterEncoding("UTF-8");
	
	String voteId = request.getParameter("vote_id");
	String pageNum = request.getParameter("pageNum");
	System.out.print(pageNum);
	
	String comment = request.getParameter("message");
	
	if(comment != null){
		BCDao.addComment(comment,pageNum,(String)request.getSession().getAttribute("member"));
		response.sendRedirect("details.jsp?page="+pageNum);
	}
	else{
		WriterDao vote = new MYSQLWriter();
		WriterModel model = vote.getWriteModel(pageNum);
		
		int result = 0;
		
		if(request.getSession().getAttribute("member") != null){
			
			String userName = (String)request.getSession().getAttribute("member");
			if(!vote.isVote(pageNum, userName))
			{
				vote.voteAdd(model.getCode(), userName);	
			}
		}
	
		
		result = vote.update(Integer.parseInt(voteId), pageNum);
		
		if(result > 0)
		{
			if(request.getSession().getAttribute("member") != null){
				response.sendRedirect("details.jsp?page="+pageNum);	
			}
			else{
				request.setAttribute("result", result);
				request.getRequestDispatcher("details.jsp?page="+pageNum).forward(request, response);
			}
				
		}
	}
	
	
	
	
	
/* 	String user = request.getParameter("user");
	String pw = request.getParameter("pw");	
	
 	MemberDAO dao = new MemberDAO();

	int result = dao.add(voteId, pw, user);
	
	System.out.printf("account-proc" +user);
	if(result > 0)
		response.sendRedirect("index.jsp?name="+user); */

%>