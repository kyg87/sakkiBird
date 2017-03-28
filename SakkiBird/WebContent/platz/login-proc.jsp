<%@page import="java.net.URLEncoder"%>
<%@page import="com.motherbirds.model.MemberModel"%>
<%@page import="com.motherbirds.dao.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>



<%
	request.setCharacterEncoding("UTF-8");
	String email = request.getParameter("email");
	String pw = request.getParameter("pw");	
	String returnURL = null;
	MemberDAO dao = new MemberDAO();
	
	MemberModel member = dao.get(email, pw);
	
	session = request.getSession();
	
	boolean validate = true;
	returnURL = request.getParameter("returnURL");
	
	
	if(member == null && returnURL.equals("null")){
		
		validate = false;
	}
	else if(member != null)
	{
		session.setAttribute("member", member.getUserName());
		session.setMaxInactiveInterval(60*60);

	
	}
	
	if(validate)
	{
		
		System.out.println("url :" + request.getParameter("returnURL"));
		if(!returnURL.equals("null")){
			if(member == null){
				response.sendRedirect("account.jsp?validate=false&return-url="+returnURL);
				
			}
			else
				response.sendRedirect(returnURL);
		}
		else
			response.sendRedirect("index.jsp");
		
	}
	else
	{
		/* request.setAttribute("validate", validate); */
		System.out.print("왜 못ㅁ넘어오지??");
		response.sendRedirect("account.jsp?validate=false");
	}
	
		/* response.sendRedirect("account.jsp"); */
%>