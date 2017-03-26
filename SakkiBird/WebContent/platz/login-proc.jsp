<%@page import="java.net.URLEncoder"%>
<%@page import="com.motherbirds.model.MemberModel"%>
<%@page import="com.motherbirds.dao.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>



<%
	request.setCharacterEncoding("UTF-8");
	String email = request.getParameter("email");
	String pw = request.getParameter("pw");	
	
	MemberDAO dao = new MemberDAO();
	
	MemberModel member = dao.get(email, pw);
	
	session = request.getSession();
	
	boolean validate = true;
	
	if(member == null){
		
		validate = false;
	}
	else
	{
		session.setAttribute("member", member.getUserName());
		session.setMaxInactiveInterval(60*60);

	
	}
	
	if(validate)
	{
		response.sendRedirect("index.jsp");
	}
	else
	{
		request.setAttribute("validate", validate);
		request.getRequestDispatcher("account.jsp").forward(request, response);
	}
	
		/* response.sendRedirect("account.jsp"); */
%>