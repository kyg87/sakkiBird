<%@page import="com.motherbirds.dao.MYSQLWriter"%>
<%@page import="com.motherbirds.dao.VoteDao"%>
<%@page import="com.motherbirds.dao.WriterDao"%>
<%@page import="com.motherbirds.model.WriterModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
	WriterDao vtdao = new MYSQLWriter();	
	List<WriterModel> list = vtdao.getList();
	
	String checkResult = request.getParameter("vote");
	System.out.print(checkResult);
	
%>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
	
	window.addEventListener("load", function(e) {
		
		var title = document.querySelector("#test-title");
		var writer = document.querySelector("#test-writer");
		var regdate = document.querySelector("#test-regdate");
		var content = document.querySelector("#test-content");
		var radio1 = document.querySelector("#first-choice");
		var radio2 = document.querySelector("#second-choice");
		var radio3 = document.querySelector("#third-choice");
		var submitBtn = document.querySelector("#submit");
		var result = document.getElementsByName("group");
		var check = null;

		submitBtn.onclick = function(){
			
			for(var i = 0; i < result.length; i++){
				if(result[i].checked){
					check = result[i].value;
					break;
				}
				
			}
			
			alert(check);
			
		};
		
	});

	
</script>

</head>
<body>

	<%if(checkResult != null){ %>
		<span>투표결과</span>
	<%} else{ %>

	<form action = "VoteTest-Proc.jsp" method = "post" id = "VoteResult">
		<span id = "test-title">title</span><br /><br />
		<span id = "test-writer">wr</span><br /><br />
		<span id = "test-regdate">reg</span><br /><br />
		<span id = "test-content">cont</span><br /><br />
		<input type = "radio" id = "first-choice" name = "group" value = "1"/>choice me<br /><br />
		<input type = "radio" id = "second-choice" name = "group" value = "2"/>choice meme<br /><br />
		<input type = "radio" id = "third-choice" name = "group" value = "3"/>choice mememe<br /><br />
		<meter id = "first-choice-bar" value = "1" min = "0" max = "10"></meter><br /><br />
		<meter id = "second-choice-bar" value = "2" min = "0" max = "10"></meter><br /><br />
		<button id = "submit" type = "submit">Submit</button><br /><br />
	</form>
	<%} %>
	
</body>
</html>





