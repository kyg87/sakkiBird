package com.motherbirds.board.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.motherbirds.dao.BoardCommentDAO;
import com.motherbirds.dao.MYSQLWriter;
import com.motherbirds.dao.WriterDao;
import com.motherbirds.model.WriterModel;


@WebServlet("/details")
public class BoardCommentController extends HttpServlet {
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		/*response.setContentType("text/html; charset=UTF-8");*/
		
		BoardCommentDAO BCDao = new BoardCommentDAO();
		String pageNum = request.getParameter("pageNum");
		WriterDao vote = new MYSQLWriter();
		WriterModel model = vote.getWriteModel(pageNum);

		
		
		
		String voteId = request.getParameter("vote_id");
		System.out.print(pageNum);
		
		String comment = request.getParameter("message");
		
		HttpSession session = request.getSession();
		
		System.out.println("username :" +session.getAttribute("member"));
		
		if(comment != null){
			
			if(session.getAttribute("member") != null){
				
				BCDao.addComment(comment,pageNum,(String)request.getSession().getAttribute("member"));
				response.sendRedirect("details.jsp?page="+pageNum);
			}
			
			else if(session.getAttribute("member") == null)
			{
				/*response.getWriter().println("<script>alert('로그인해라'); location.href='details.jsp?page="+pageNum+"'</script>");*/
				response.sendRedirect("../platz/account.jsp?return-url=details.jsp?page="+pageNum);
			}
			
		}
		else{
			
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
	}

}
