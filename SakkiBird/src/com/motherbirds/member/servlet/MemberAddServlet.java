package com.motherbirds.member.servlet;

import java.io.Console;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.servlet4preview.RequestDispatcher;

import com.motherbirds.dao.MemberDAO;
import com.motherbirds.model.MemberModel;

/**
 * Servlet implementation class MemberAddServlet
 */
@WebServlet("/memberAddServlet")
public class MemberAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private MemberDAO memberDAO= null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		request.setCharacterEncoding("UTF-8");
		
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String username = request.getParameter("username");
		System.out.println(username);
		MemberModel memberModel = new MemberModel();
		
		memberModel.setEmail(email);
		memberModel.setPw(pw);
		memberModel.setUsername(username);
		
		this.memberDAO = new MemberDAO();
		
		memberDAO.insert(memberModel);
		
		System.out.println("done");
	      // View 보내기
 
		
	}

}
