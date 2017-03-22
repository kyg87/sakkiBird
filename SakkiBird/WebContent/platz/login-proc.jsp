<%@page import="com.motherbirds.dao.MemberInter"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.motherbirds.model.MemberModel"%>
<%@page import="com.motherbirds.dao.MemberDAO"%>
<%@page contentType="text/html; charset=UTF-8" %>
<%@page session = "true"%>


<%
	request.setCharacterEncoding("UTF-8");
	String email = request.getParameter("email");
	String pw = request.getParameter("pw");	
	
	session.setAttribute("email", email);
	session.setAttribute("pw", pw);
	
	
	MemberInter dao = new MemberDAO();
	
	MemberModel member = dao.get(email, pw);
	
	if(member != null){
		response.sendRedirect("index.jsp");
	}
	else
		response.sendRedirect("account.jsp");
%>