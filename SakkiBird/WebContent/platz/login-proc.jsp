<%@page import="java.net.URLEncoder"%>
<%@page import="com.motherbirds.model.MemberModel"%>
<%@page import="com.motherbirds.dao.MemberDAO"%>
<%@ page contentType="text/html; charset=euc-kr" %>



<%
	request.setCharacterEncoding("UTF-8");
	String email = request.getParameter("email");
	String pw = request.getParameter("pw");	
	
	MemberDAO dao = new MemberDAO();
	
	MemberModel member = dao.get(email, pw);
	

	
	if(member != null){
		
		String encoded = URLEncoder.encode(member.getUserName());
		response.sendRedirect("index.jsp?name=" + encoded);
	}
	else
		response.sendRedirect("account.jsp");
%>