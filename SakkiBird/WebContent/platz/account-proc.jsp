<%@page import="com.motherbirds.model.MemberModel"%>
<%@page import="com.motherbirds.dao.MemberDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String email = request.getParameter("email");
	String user = request.getParameter("user");
	String pw = request.getParameter("pw");

	MemberDAO dao = new MemberDAO();
	
	
	if (dao.existEmail(email)) {
		
		System.out.println("이메일 이미 있다");
		response.sendRedirect("account.jsp?validate=false");
	} else {

		if (dao.existuserName(user)) {
			System.out.println("이름이 중복 ");
			response.sendRedirect("account.jsp?validate=false");
		} else {

			int result = dao.add(email, pw, user);

			System.out.printf("account-proc" + user);
			if (result > 0)
			{
				MemberModel member = dao.get(email, pw);
				session.setAttribute("member", member);

				response.sendRedirect("index.jsp");
				
				
			}
		}
	}
%>