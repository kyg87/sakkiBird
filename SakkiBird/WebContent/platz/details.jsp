<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.motherbirds.dao.WriterDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.motherbirds.model.WriterModel"%>
<%@page import="com.motherbirds.dao.MYSQLWriter"%>
<%@page import="com.motherbirds.model.BoardCommentModel"%>
<%@page import="java.util.List"%>
<%@page import="com.motherbirds.dao.BoardCommentDAO"%>
<%@taglib prefix = "cc" uri="http://java.sun.com/jsp/jstl/core"%>

<%
request.setCharacterEncoding("UTF-8");



/* -------------------- 메인 처리*/
String _page =request.getParameter("p");

String _query =request.getParameter("search");


int pg=1;
String query="";



if(_page!=null &&!_page.equals("")) // 값이 넘겨 진 것이 있다면 
	pg=Integer.parseInt(_page);

if(_query!=null &&!_query.equals("")) // 값이 넘겨 진 것이 있다면 
	query=_query;


WriterDao writerDao = new MYSQLWriter();
List<WriterModel> list = writerDao.getList(pg,query);
List<WriterModel> list2 = writerDao.getList();
int size=writerDao.getSize(query);	
	System.out.println(size);

	String userName = "";

System.out.println("name :" + request.getSession().getAttribute("member"));
/* 	System.out.println("name :" +request.getSession().getAttribute("name")); */
/* -------------------- 로그인 처리*/







	WriterDao vtdao = new MYSQLWriter();	
	List<WriterModel> wmList = vtdao.getList();
	
	String checkResult = request.getParameter("vote");
	/* System.out.print(checkResult); */

	String pageNum = request.getParameter("page");
	BoardCommentDAO bocodao = new BoardCommentDAO();
	List<BoardCommentModel> bcList = bocodao.getList(pageNum);
	
	MYSQLWriter writerDAO = new MYSQLWriter();
	WriterModel writerModel = writerDAO.getWriteModel(pageNum);

	
	//선택지 문구 리스트
	List<String> selects = new ArrayList<String>();
	//선택지 투표수 리스트
	List<Integer> voteCounts = new ArrayList<Integer>();
	//투표율
	List<String> voteRate = new ArrayList<String>();
	//선택지 갯수
	
	
	int voteCount = Integer.parseInt(writerModel.getContent_vote());
	
	String[] colors = {"red","orange","yellow","green","blue","aqua"};
	
 	switch(voteCount){
		case 2:
			selects.add(writerModel.getContent_first_choice());
			selects.add(writerModel.getContent_second_choice());
			
			voteCounts.add(writerModel.getContent_voterate1());
			voteCounts.add(writerModel.getContent_voterate2());
			break;
		case 3:
			selects.add(writerModel.getContent_first_choice());
			selects.add(writerModel.getContent_second_choice());
			selects.add(writerModel.getContent_third_choice());
			
			voteCounts.add(writerModel.getContent_voterate1());
			voteCounts.add(writerModel.getContent_voterate2());
			voteCounts.add(writerModel.getContent_voterate3());
			break;
		case 4:
			selects.add(writerModel.getContent_first_choice());
			selects.add(writerModel.getContent_second_choice());
			selects.add(writerModel.getContent_third_choice());
			selects.add(writerModel.getContent_fourth_choice());
			
			voteCounts.add(writerModel.getContent_voterate1());
			voteCounts.add(writerModel.getContent_voterate2());
			voteCounts.add(writerModel.getContent_voterate3());
			voteCounts.add(writerModel.getContent_voterate4());
			break;
		case 5:
			selects.add(writerModel.getContent_first_choice());
			selects.add(writerModel.getContent_second_choice());
			selects.add(writerModel.getContent_third_choice());
			selects.add(writerModel.getContent_fourth_choice());
			selects.add(writerModel.getContent_fifth_choice());
			
			voteCounts.add(writerModel.getContent_voterate1());
			voteCounts.add(writerModel.getContent_voterate2());
			voteCounts.add(writerModel.getContent_voterate3());
			voteCounts.add(writerModel.getContent_voterate4());
			voteCounts.add(writerModel.getContent_voterate5());
			
			break;
	} 
 	
 	int totalVoteCount = 0;
 	
 	for(Integer l : voteCounts){
 		/* System.out.println( "투표 카운트: " + l); */
 		totalVoteCount += l;
 	}
 	
 	/* System.out.println("투표수 : " + totalVoteCount); */
 	
  	for(Integer l : voteCounts){
 		/* System.out.printf("퍼센트 : %f", ((float)(l/(float)totalVoteCount)) * 100); */
 		if(l != 0)
 		{
 			voteRate.add(String.format("%.2f", (float)(l/(float)totalVoteCount) * 100));
 		}
 		else 
 		{
 			voteRate.add("0");
 		}
 	}
 	
  	//투표 유무 체크
   	boolean isVoted =  writerDAO.isVote(pageNum, (String)request.getSession().getAttribute("member"));
  	
  	if(request.getAttribute("result") != null)
  	{
   		if((int)request.getAttribute("result") > 0) isVoted = true; 
  	}
/* 	System.out.println("result : " + request.getAttribute("result"));
  	System.out.println("isVoted : " + isVoted);

	System.out.println("motherbirds.com" +request.getRequestURI()+"?page="+pageNum);

	String currentURL = "motherbirds.com" +request.getRequestURI()+"?page="+pageNum;  */
%>

<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Detailed Single Post</title>

<!-- Behavioral Meta Data -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="icon" type="image/png" href="img/small-logo-01.png">
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,900,900italic,700italic,700,500italic,400italic,500,300italic,300'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Pacifico'
	rel='stylesheet' type='text/css'>
<link rel='stylesheet' href='css/details.css'>
<link rel='stylesheet' href='css/content/style.css'>

<script>

	
	
</script>


</head>

<body>
<!-- sns -->
<%-- 	<button id="facebook">facebook</button>
	<button id="twitter">twitter</button>
	
	<script type="text/javascript">

var  facebook = document.querySelector("#facebook")
	,twitter = document.querySelector("#twitter")
	/* ,me2day = document.querySelector("#me2day")
	,yozm = document.querySelector("#yozm") */

	,thisUrl = "<%="motherbirds.com/platz/details.jsp?" +"page="+pageNum %>"
	,msg = "테스트 페이지를 SNS에 연동합니다. http://motherbirds.com/platz/index.jsp"
	,tag = "motherbirds"

facebook.addEventListener("click", function(){
	goSns('facebook', thisUrl, msg, tag);
}, false);

twitter.addEventListener("click", function(){
	goSns('twitter', thisUrl, msg, tag);
}, false);

/* me2day.addEventListener("click", function(){
	goSns('me2day', thisUrl, msg, tag);
}, false);

yozm.addEventListener("click", function(){
	goSns('yozm', thisUrl, msg, tag);
}, false); */


function goSns(site, url, msg, tag) {
	var goUrl;
	if (site == "facebook"){
		
		// 페이스북
		goUrl = "http://www.facebook.com/sharer.php?u=" + url + "&t=" + encodeURIComponent(msg);
	}else if(site == "twitter"){
		
		// 트위터
		goUrl = "http://twitter.com/home?status=" + encodeURIComponent(msg) + " " + encodeURIComponent(url);
	}/* else if(site == "me2day"){
		
		// me2day
		goUrl = "http://me2day.net/posts/new?new_post[body]=" + encodeURIComponent(msg) + " " + encodeURIComponent(url) + "&new_post[tags]=" + encodeURIComponent(tag);
	}else if(site == "yozm"){
	
		// 요즘
		goUrl = "http://yozm.daum.net/api/popup/prePost?link=" + encodeURIComponent(url)+ "&prefix=" + encodeURIComponent(msg) + "&parameter=" + encodeURIComponent(msg);
	} */
	top.location.href = goUrl;
}
</script>
<!-- sns end -->
	<a name="ancre"></a>

	<!-- CACHE -->
	<div class="cache"></div>
 --%>
	<!-- HEADER -->

<div id="wrapper-header">
	<div id="main-header" class="object">
		<div class="logo"><img src="img/llogo.png" alt="logo platz" height="38" width="90"></div>
        <%-- <div id="main_tip_search">
			<form> 
				<input type="text" name="search" id="tip_search_input" list="search" value="<%=query%>" autocomplete=off required>
				<input type="hidden" name="p" value="1" />
			</form>
		</div> --%>
        <div id="stripes"></div>
    </div>
</div>
<!-- NAVBAR -->

<div id="wrapper-navbar">
		<div class="navbar object">
    		<div id="wrapper-sorting">
	        	<div id="wrapper-title-1">
	        	<div class="top-rated object">MAIN</div>
	            	<div id="fleche-nav-2"></div>
	    		</div>
	            
				<div id="wrapper-title-2">
				<%-- <%	response.sendRedirect("writer.jsp"); %> --%>
	            <a id="auth" href="account.jsp">
	            <script>
				
	            var auther = document.querySelector("#auth");
	               	auther.onclick = function(){
						<%
	               		if(request.getSession().getAttribute("member") == null){
	               		%>
							alert("글을 쓰시려면 로그인 해주세요.");
							return false;
						<%	
						};
						%>
					};
	           	
	            </script>
	            	<div class="recent object">WRITE</div>
	            
	            </a>
	                <div id="fleche-nav-2"></div>
	    		</div>
	            <%String isLogin =""; %>
	            	<div id="wrapper-title-3">
	            <%if(request.getSession().getAttribute("member") == null ){ %>
	            	<a href="account.jsp"><div class="oldies object">LOGIN</div></a>
	                <div id="fleche-nav-3"></div>
	            <%} else { %>
	            
	            <%-- <%request.getSession().invalidate(); %> --%>
	                
	                <a href="logout.jsp"><div class="oldies object">LOGOUT</div></a>
	                <div id="fleche-nav-3"></div>
	            
	            <%} %>
	    			</div>
	    		
	  
            </div>
            <%if(request.getSession().getAttribute("member") != null){ %>
            <div id="login-user">
            	<!-- <a href="#"> -->
            		<div class="hidden" id="bouton-ai">
            			<%=request.getSession().getAttribute("member") + "님 환영합니다." %>
            		</div>
            	<!-- </a> -->
            	
            	<!-- <div id="bouton-ai"><img src="img/48_twitter_circle_color.png" alt="illustrator" title="Illustrator" height="28" width="28"></div>
            	<div id="bouton-psd"><img src="img/48_facebook_circle_black.png" alt="photoshop" title="Photoshop" height="28" width="28"></div>
            	<div id="bouton-theme"><img src="img/KakaoTalk.jpg" alt="theme" title="Theme" height="28" width="28"></div> -->
            	<!-- <div id="bouton-font"><img src="img/icon-font.svg" alt="font" title="Font" height="28" width="28"></div>
            	<div id="bouton-photo"><img src="img/icon-photo.svg" alt="photo" title="Photo" height="28" width="28"></div>
            	<div id="bouton-premium"><img src="img/icon-premium.svg" alt="premium" title="Premium" height="28" width="28"></div> -->
			</div>
			<%} %>
    	</div>
</div>


	<!-- PORTFOLIO -->

	<div id="wrapper-container">

		<div class="container object">

			<div id="main-container-image">

				<div class="title-item">
					<!-- <div class="title-icon"></div> -->
					<div class="title-text"><%=writerModel.getTitle() %></div>
					<!-- <div class="title-text-2">Sept 25, 2015 by Onuur</div> -->
					
					<div class="title-text-2"><strong>작성자 : </strong> <%=writerModel.getWriter() %></div>
					<div class="title-text-2"><strong>작성 시간 : </strong> <%=writerModel.getRegDate() %></div>
					<div class="title-text-2"><strong>마감 시간 : </strong> <%=writerModel.getEndDate() %></div>
				</div>
	

				<div class="work">
					<figure class="white">
						<img src="/upload/<%=writerModel.getContent_img()%>" alt="" />
						<div id="wrapper-part-info">
							<div class="part-info-image-single">
								<div>
									<p><%=writerModel.getContent() %></p>
								
								</div>

							<%if(!isVoted){ %>
								<!-- vote container -->
								<div class="content-box primary clear-fix vMargin">
									<div class="content-box-header"></div>
									<div class="content-box-inner">
										<form action="details" method="post">
											<div class="content-box clear-fix poll-box">
												<%for(int i = 0 ; i < voteCount;i++){ %>
												<div class="poll-row">
													<div class="vote-cell">
														<input id="vote_1" type="radio" value=<%= (i+1) %> name="vote_id" required="required">
													</div>
													<div class="vote-cell"><%=selects.get(i) %></div>
												</div>
												<%} %>	
												
												<div class="poll-row">
												
													<div class="vote-cell">
														<input class="action-button green" type="submit"
															value="Submit vote" name="update">
													</div>
												</div>
												<input type="hidden" name ="pageNum" value=<%=pageNum%> />
											</div>
										</form>
									</div>
								</div>
								<%} else{%>
								<!-- vote container End-->
								
								<!-- vote Result  -->
								<div class="vote-container">
									<div class="question">
										<a href="#"><%=totalVoteCount%> votes</a>
									</div>
									<%for(int i = 0 ; i < voteCount;i++){ %>
									<div class = "vote-selects">
										<span><%=selects.get(i) %></span>
									</div>
									<div id="progress0" class="progress-bar">
										<span></span>
										<div class="progress-bar-value" style="width: <%=voteRate.get(i)+"%;" %> background-color: <%=colors[i] %>;"><%=voteRate.get(i)+"%"%></div>
									</div>
									<%} %>	
								</div>
								<%} %>
								<!-- vote Result End -->
							</div>
						</div>
					</figure>					

					<div class="post-send">
						<div id="main-post-send">
							<div id="title-post-send"><%int cnt = 0; %> 댓글<%for(BoardCommentModel bcm:bcList){cnt++; }%> [ <%=cnt %> ] </div>
							<form id="contact" method="post" action="details">
								<fieldset>
								
									<cc:if test = "${not empty validate && not validate }">
										<tr>
											<td colspan = "2" style = "">아이디 또는 비밀번호가 유효하지 않습니다.</td>
										</tr>
									</cc:if>
								
									<p>
										<textarea id="message_id" name="message" maxlength="500"
											placeholder="댓글을 입력하세요." tabindex="5" cols="30" rows="4" required="required"></textarea>
									</p>
								</fieldset>
								<div style="text-align: center;">
									<input type="submit" name="envoi" value="등록" />
									<input type="hidden" name ="pageNum" value=<%=pageNum%> />
								</div>
							</form>
						</div>
					</div>

					<%for(BoardCommentModel bcm:bcList){ %>
					<div class="post-reply">
						<div class="image-reply-post"></div>
						<div class="name-reply-post"><%=bcm.getCommentWriter() %></div>
						<div class="text-reply-post"><%=bcm.getCommentContent() %></div>
					</div>
					<%} %>
					
				</div>
			</div>
		</div>


		<div id="wrapper-thank">
			<div class="thank">
				<div class="thank-text">Mother<span style="letter-spacing:-5px;"></span>Birds</div>
			</div>
		</div>

		


		 <div id="wrapper-copyright">
		<div class="copyright">
    		<div class="copy-text object">Copyright © 2017 어미새와 아기새<!-- <a style="color:#D0D1D4;" href="https://dcrazed.com/">Dcrazed</a> --></div>
    		
			<!-- <div class="wrapper-navbouton">
    			<div class="google object">g</div>
    			<div class="facebook object">f</div>
    			<div class="linkin object">i</div>
    			<div class="dribbble object">d</div>
    		</div> -->
    	</div>
    </div>

	</div>



	<!-- SCRIPT -->

	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.scrollTo.min.js"></script>
	<script type="text/javascript" src="js/jquery.localScroll.min.js"></script>
	<script type="text/javascript"
		src="js/jquery-animate-css-rotate-scale.js"></script>
	<script type="text/javascript" src="js/fastclick.min.js"></script>
	<script type="text/javascript" src="js/jquery.flip.min.js"></script>
	<script type="text/javascript" src="js/jquery.animate-colors-min.js"></script>
	<script type="text/javascript" src="js/jquery.animate-shadow-min.js"></script>

	<script>
	

	
$(document).ready(function() {
		$.localScroll();
		$(".cache").delay(1000).fadeOut(500);
		
		$("#wrapper-header").delay(1500).animate({opacity:'1',width:'100%'},500);
		$("#wrapper-navbar").delay(2000).animate({opacity:'1',height:'60px'},500);
		
		$("#main-container-image").delay(2500).animate({opacity:'1'},500);
		
	});

/*TRANSITION PAGE*/

var speed = 'slow';

$('html, body').hide();

$(document).ready(function() {
    $('html, body').fadeIn(speed, function() {
        $('a[href], button[href]').click(function(event) {
            var url = $(this).attr('href');
            if (url.indexOf('#') == 0 || url.indexOf('javascript:') == 0) return;
            event.preventDefault();
            $('html, body').fadeOut(speed, function() {
                window.location = url;
            });
        });
    });
});

/* DISABLE HOVER EFFECT WHILE YOU SCROLL FOR A SMOOTHY NAVIGATION */

var body = document.body,
	timer;

window.addEventListener('scroll', function() {

	clearTimeout(timer);

	if(!body.classList.contains('disable-hover'))
		body.classList.add('disable-hover')

	timer = setTimeout(function(){
		body.classList.remove('disable-hover')
	}, 200);

}, false);
 
  /* BOUTON MENU */

$(document).on('touchstart mouseover', '#stripes', function(event){

        event.stopPropagation();
        event.preventDefault();
        if(event.handled !== true) {
			
			   $("#stripes").stop().animate({scale:'1.2',opacity:'0.5'},300);	

            event.handled = true;
        } else {
            return false;
        }
});

$(document).on('touchend mouseout', '#stripes', function(event){
	
        event.stopPropagation();
        event.preventDefault();
        if(event.handled !== true) {
			
			   $("#stripes").stop().animate({scale:'1',opacity:'1'},300);	

            event.handled = true;
        } else {
            return false;
        }
});

/* MENU SIDE OPEN */

var MENUSIDEOPEN = document.getElementById('stripes');

MENUSIDEOPEN.addEventListener('click', function() {
			   $("#main-container-menu").stop().animate({left:'0'},300);	
}); 

/* BOUTON CROSS */

$(document).on('touchstart mouseover', '#cross-menu', function(event){

        event.stopPropagation();
        event.preventDefault();
        if(event.handled !== true) {
			
			   $("#cross-menu").stop().animate({scale:'1.2',opacity:'0.5'},300);	

            event.handled = true;
        } else {
            return false;
        }
});

$(document).on('touchend mouseout', '#cross-menu', function(event){
	
        event.stopPropagation();
        event.preventDefault();
        if(event.handled !== true) {
			
			   $("#cross-menu").stop().animate({scale:'1',opacity:'1'},300);	

            event.handled = true;
        } else {
            return false;
        }
});

/* MENU SIDE CLOSE */

var MENUSIDECLOSE = document.getElementById('cross-menu');

MENUSIDECLOSE.addEventListener('click', function() {
			   $("#main-container-menu").stop().animate({'left':'-100%'},300);	
}); 

/* BOUTON MENU ARROW-2 */

$(document).on('touchstart mouseover', '#wrapper-title-2', function(event){

        event.stopPropagation();
        event.preventDefault();
        if(event.handled !== true) {
			
			   $("#fleche-nav-2").stop().animate({rotate: '90deg',opacity:'1'},300);	

            event.handled = true;
        } else {
            return false;
        }
});

$(document).on('touchend mouseout', '#wrapper-title-2', function(event){
	
        event.stopPropagation();
        event.preventDefault();
        if(event.handled !== true) {
			
			   $("#fleche-nav-2").stop().animate({rotate: '0deg',opacity:'0.5'},300);	

            event.handled = true;
        } else {
            return false;
        }
});

/* BOUTON MENU ARROW-3 */

$(document).on('touchstart mouseover', '#wrapper-title-3', function(event){

        event.stopPropagation();
        event.preventDefault();
        if(event.handled !== true) {
			
			   $("#fleche-nav-3").stop().animate({rotate: '90deg',opacity:'1'},300);	

            event.handled = true;
        } else {
            return false;
        }
});

$(document).on('touchend mouseout', '#wrapper-title-3', function(event){
	
        event.stopPropagation();
        event.preventDefault();
        if(event.handled !== true) {
			
			   $("#fleche-nav-3").stop().animate({rotate: '0deg',opacity:'0.5'},300);	

            event.handled = true;
        } else {
            return false;
        }
});

/* BOUTON MENU */

$(document).on('touchstart mouseover', '#stripes', function(event){

        event.stopPropagation();
        event.preventDefault();
        if(event.handled !== true) {
			
			   $("#stripes").stop().animate({scale:'1.2',opacity:'0.5'},300);	

            event.handled = true;
        } else {
            return false;
        }
});

$(document).on('touchend mouseout', '#stripes', function(event){
	
        event.stopPropagation();
        event.preventDefault();
        if(event.handled !== true) {
			
			   $("#stripes").stop().animate({scale:'1',opacity:'1'},300);	

            event.handled = true;
        } else {
            return false;
        }
});

/* BOUTON NEXT */

$(document).on('touchstart mouseover', '#oldnew-next', function(event){

        event.stopPropagation();
        event.preventDefault();
        if(event.handled !== true) {
			
			   $("#oldnew-next").stop().animate({scale:'1.2',opacity:'0.5'},300);	

            event.handled = true;
        } else {
            return false;
        }
});

$(document).on('touchend mouseout', '#oldnew-next', function(event){
	
        event.stopPropagation();
        event.preventDefault();
        if(event.handled !== true) {
			
			   $("#oldnew-next").stop().animate({scale:'1',opacity:'1'},300);	

            event.handled = true;
        } else {
            return false;
        }
});

/* BOUTON PREV */

$(document).on('touchstart mouseover', '#oldnew-prev', function(event){

        event.stopPropagation();
        event.preventDefault();
        if(event.handled !== true) {
			
			   $("#oldnew-prev").stop().animate({scale:'1.2',opacity:'0.5'},300);	

            event.handled = true;
        } else {
            return false;
        }
});

$(document).on('touchend mouseout', '#oldnew-prev', function(event){
	
        event.stopPropagation();
        event.preventDefault();
        if(event.handled !== true) {
			
			   $("#oldnew-prev").stop().animate({scale:'1',opacity:'1'},300);	

            event.handled = true;
        } else {
            return false;
        }
});


/* BOUTON PREV */

$(document).on('touchstart mouseover', '#logo', function(event){

        event.stopPropagation();
        event.preventDefault();
        if(event.handled !== true) {
			
			   $("#logo").stop().animate({scale:'1.1',opacity:'0.5'},300);	

            event.handled = true;
        } else {
            return false;
        }
});

$(document).on('touchend mouseout', '#logo', function(event){
	
        event.stopPropagation();
        event.preventDefault();
        if(event.handled !== true) {
			
			   $("#logo").stop().animate({scale:'1',opacity:'1'},300);	

            event.handled = true;
        } else {
            return false;
        }
});



/*FORMULAIRE NEWSLETTER*/
	
/* $("form").on("submit", function(event) {
  event.preventDefault();
  $.post("/burstfly/form-burstfly-modified.asp",$("form").serialize(), function(data) {//alert(data);
	});
}); */

</script>

<!-- <script type="text/javascript" src="js/content.js"></script> -->



</body>


</html>
