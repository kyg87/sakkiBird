<%@page import="com.motherbirds.model.BoardCommentModel"%>
<%@page import="java.util.List"%>
<%@page import="com.motherbirds.dao.BoardCommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

    
<%
	BoardCommentDAO bocodao = new BoardCommentDAO();
	List<BoardCommentModel> list = bocodao.getList();
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
	
</script>

</head>
<body>

	<table id = "board-comment" border="1px solid black">
	
		<tr>
			<td>댓글번호</td>
			<td>작성자</td>
			<td>내용</td>
			<td>작성시간</td>
			<td>추천수</td>
			<td>이미지 주소</td>
			<td>게시글 번호</td>
		</tr>
		
		<%int btncnt = 1; %>
		<%for(BoardCommentModel bcm:list){ %>
		<tr>
			
			<td id = "comment-num"><%=bcm.getCommentNum() %></td>
			<td id = "comment-writer"><%=bcm.getCommentWriter() %></td>
			<td id = "comment-content"><%=bcm.getCommentContent() %></td>
			<td id = "comment-regdate"><%=bcm.getCommentRegdate() %></td>
			<td id = "comment-hit"><%=bcm.getCommentHit() %></td>
			<td id = "comment-img-adr"><%=bcm.getCommentImgAdr() %></td>
			<td id = "comment-article-num"><%=bcm.getCommentArticleNum() %></td>
			<td><input type="button" id = "cnt<%=btncnt%>" value = "덧글"></td>
			<%btncnt++; %>
		</tr>
		<%} %>
	</table>
	
	

</body>
</html>