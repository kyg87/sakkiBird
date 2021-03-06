<%@page import="com.motherbirds.model.MemberModel"%>
<%@page import="com.motherbirds.dao.WriterDao"%>
<%@page import="com.motherbirds.model.WriterModel"%>
<%@page import="java.util.List"%>
<%@page import="com.motherbirds.dao.MYSQLWriter"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	
	
	WriterDao writerDAO = new MYSQLWriter();
	List<WriterModel> list = writerDAO.getList(pg,query);
	List<WriterModel> list2 = writerDAO.getList();
	int size=writerDAO.getSize(query);	
		System.out.println(size);
	
		String userName = "";
	
	System.out.println("name :" + request.getSession().getAttribute("member"));
/* 	System.out.println("name :" +request.getSession().getAttribute("name")); */
	/* -------------------- 로그인 처리*/


	


	/* System.out.println(userName.equals("")); */
	
%>

<!DOCTYPE HTML>
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Platz - Free Grid Wordpress Theme</title>

<!-- Behavioral Meta Data -->
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="icon" type="image/png" href="img/small-logo-01.png">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,900,900italic,700italic,700,500italic,400italic,500,300italic,300' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
	<link href='css/style.css' rel='stylesheet' type='text/css'>
	
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<!-- Naver login -->
 	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	
</head>

<body>
<!-- 
  <div id="naver_id_login"></div>
  //네이버아이디로로그인 버튼 노출 영역
  <script type="text/javascript">
  	var naver_id_login = new naver_id_login("Y6l8Zy4zJ8u_RebKOpFT", "http://192.168.123.108:8080/SakkiBird/platz/login-proc.jsp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("http://motherbirds.com");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  </script> 
 -->
<a name="ancre"></a>

<!-- CACHE -->
<div class="cache"></div>

<!-- HEADER -->

<div id="wrapper-header">
	<div id="main-header" class="object">
		<div class="logo"><a href="index.jsp"><img src="img/llogo.png" alt="logo platz" height="38" width="90"></a></div>
        <div id="main_tip_search">
			<form> 
				<input type="text" name="search" id="tip_search_input" list="search" value="<%=query%>" autocomplete=off required>
				<input type="hidden" name="p" value="1" />
			</form>
		</div>
        <div id="stripes"></div>
    </div>
</div>
<!-- NAVBAR -->

<div id="wrapper-navbar">
		<div class="navbar object">
    		<div id="wrapper-sorting">
	        	<div id="wrapper-title-1">
	        	<div class="top-rated object">MAIN</div>
	            	<div id="fleche-nav-1"></div>
	    		</div>
	            
				<div id="wrapper-title-2">
				<%-- <%	response.sendRedirect("writer.jsp"); %> --%>
	            <%
           			if(request.getSession().getAttribute("member") == null){
           		%>	            
	            <a id="auth" href="account.jsp">
	            <script>
				
	            var auther = document.querySelector("#auth");
	               	auther.onclick = function(){
						
							alert("글을 쓰시려면 로그인 해주세요.");
							return false;
					};
				</script>
				<%
           		}else{
				%>
				<a id="auth" href="writer.jsp">
	            <script>
				
	            var auther = document.querySelector("#auth");
	               	auther.onclick = function(){
						
	               			alert("글을 쓰러 갑니다.");
							return false;
					};
				</script>
				<%
           		};
				%>
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
		
	
		<%-- 	<!-- 슬라이더 -->
			<section class="pen">
				<div class="stage">
				
					<%for(WriterModel r : list2){ %>
					
						<div class="element michael">
						<a href="details.jsp?page=<%=r.getCode()%>">
							<img src="images/<%=r.getContent_img()%>" alt="" style="max-width: 100%; height: 330px;" />
							<br/>
							<%=r.getTitle() %></a>
								
						</div>
						<%} %>
					<!-- <div class="element franklin"></div>
					<div class="element trevor"></div> -->
						
					
				</div>
			</section> --%>
			
			<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
			<script src="js/index.js"></script>
			
			<section class="work">
						
						<%for(WriterModel m : list){ %>
						<figure class="whites">
							<a href="details.jsp?page=<%=m.getCode()%>">
								<img src="/upload/<%=m.getContent_img()%>" alt="" />
								<!-- <dl>
									<dt>Wordpress theme</dt>
									<dd>Symphony is a responsive one page website template designed with sketches and coded with html5 and php. Freebie released by Lacoste Xavier.</dd>	
								</dl> -->
							</a>
                            <div id="wrapper-part-info">
                            	<div class="part-info-image"><img src= "img/icon-font.svg" alt="" width="28" height="28"/></div>
                            	<div id="part-info"><%=m.getTitle() %></div>
							</div>
                        </figure>	
						<%} %>
	          
					</section>
                    
				</div>	
            	    
			</div>
         
         
<%
int last = (size % 9) > 0 ? (size / 9) + 1 : size / 9;
System.out.println("갯수" + last);
%>       
         
    <div id="wrapper-oldnew">
    	<div class="oldnew">
        	<div class="wrapper-oldnew-prev">
            	<!-- <div id="oldnew-prev"></div> -->
        	</div>
            <div class="wrapper-oldnew-next">
            	<div class="pagination__wrapper">
  <ul class="pagination">
    <li><button class="prev" title="previous page">&#10094;</button></li>
    <%for(int i=0;i<last;i++){ %>
     <li><a href="?p=<%=i+1 %>&search=<%=query%>"><button><%=i+1 %></button></a></li>
	<%} %> 
    <li><button class="next" title="next page">&#10095;</button></li>
  </ul>
</div>
    		</div>
        </div>
	</div>     
	
	
	
<!-- 버튼1 -->

<%-- <%
int last = (size % 9) > 0 ? (size / 10) + 1 : size / 10;
System.out.println("갯수" + last);
%>
<ul class="pagination">
<%for(int i=0;i<last;i++){ %>
<li><a href="?p=<%=i+1 %>&search=<%=query%>"><%=i+1 %></a></li>
<%} %> --%>
<!--   <li><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li class="active"><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li> -->
<!-- </ul> -->

    
       
	<div id="wrapper-thank">
    	<div class="thank">
        	<div class="thank-text">Mother<span style="letter-spacing:-5px;"></span>Birds</div>
    	</div>
	</div>
	    
	<!-- <div id="main-container-footer">
		<div class="container-footer">
        	
            <div id="row-1f">
            	<div class="text-row-1f"><span style="font-weight:600;font-size:15px;color:#666;line-height:250%;text-transform:uppercase;letter-spacing:1.5px;">What is Platz</span><br>Platz is a blog showcasing hand-picked free themes, design stuff, free fonts and other resources for web designers.</div>
            </div>
            
            <div id="row-2f">
            	<div class="text-row-2f"><span style="font-weight:600;font-size:15px;color:#666;line-height:250%;text-transform:uppercase;letter-spacing:1.5px;">How does it work</span><br>Platz offers you all the latest freebies found all over the fourth corners without to pay.</div>
            </div>
            
            <div id="row-3f">
            	<div class="text-row-3f"><span style="font-weight:600;font-size:15px;color:#666;line-height:250%;text-transform:uppercase;letter-spacing:1.5px;">Get in touch!</span><br>Subscribe our RSS or follow us on Facebook, Google+, Pinterest or Dribbble to keep updated.</div>
            </div>
            
            <div id="row-4f">
            	<div class="text-row-4f"><span style="font-weight:600;font-size:15px;color:#666;line-height:250%;text-transform:uppercase;letter-spacing:1.5px;">Newsletter</span><br>You will be informed monthly about the latest content avalaible.</div>

				<div id="main_tip_newsletter"> 
					<form>
						<input type="text" name="newsletter" id="tip_newsletter_input" list="newsletter" autocomplete=off required>
					</form>
				</div>
            </div>
            
		</div>
	</div> -->
    
    
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
	<script type="text/javascript">
	
	</script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.scrollTo.min.js"></script>
    <script type="text/javascript" src="js/jquery.localScroll.min.js"></script>
    <script type="text/javascript" src="js/jquery-animate-css-rotate-scale.js"></script>
	<script type="text/javascript" src="js/fastclick.min.js"></script>
	<script type="text/javascript" src="js/jquery.animate-colors-min.js"></script>
	<script type="text/javascript" src="js/jquery.animate-shadow-min.js"></script>    
	<script type="text/javascript" src="js/main.js"></script>
	<script>
	




/* PRELOADER */

function preloader() {
	if (document.images) {
		var img1 = new Image();
		var img2 = new Image();
		var img3 = new Image();
		var img4 = new Image();
		var img5 = new Image();
		var img6 = new Image();
		var img7 = new Image();
		var img8 = new Image();
		var img9 = new Image();
		var img10 = new Image();
		var img11 = new Image();
		var img12 = new Image();
		var img13 = new Image();
		var img14 = new Image();
		var img15 = new Image();
		var img16 = new Image();
		var img17 = new Image();
		var img18 = new Image();
		var img19 = new Image();
		var img20 = new Image();

		img1.src = "img/psd-4.jpg";
		img2.src = "img/font-1.jpg";
		img3.src = "img/psd-1.jpg";
		img4.src = "img/psd-2.jpg";
		img5.src = "img/ai-1.jpg";
		img6.src = "img/theme-2.jpg";
		img7.src = "img/psd-3.jpg";
		img8.src = "img/font-2.jpg";
		img9.src = "img/font-3.jpg";
		img10.src = "img/ai-2.jpg";
		img11.src = "img/icons-1.jpg";
		img12.src = "img/ui-1.jpg";
		img13.src = "img/font-5.jpg";
		img14.src = "img/theme-2.jpg";
		img15.src = "img/psd-5.jpg";
		img16.src = "img/icons-3.jpg";
		img17.src = "img/font-4.jpg";
		img18.src = "img/theme-3.jpg";
		img19.src = "img/font-6.jpg";
		img20.src = "img/theme-4.jpg";
	}
}
function addLoadEvent(func) {
	var oldonload = window.onload;
	if (typeof window.onload != 'function') {
		window.onload = func;
	} else {
		window.onload = function() {
			if (oldonload) {
				oldonload();
			}
			func();
		}
	}
}
addLoadEvent(preloader);




/*페이지버튼 자바스크립트*/
/* 
$('a').on('click', function(e){
	  $(e).preventDefault();
	});

	$('.pagination li').on('click', function(){

	  $(this).siblings().removeClass('active');
	  $(this).addClass('active');
	  
	}) */
	
/* 슬라이더자바스크립트 */
  /*   $('.element').each(function() {
     $(this).mouseover(function() {
        $(this).addClass('active');
       $('.stage').children('.element').not('.active').addClass('inactive');
     });
     $(this).mouseleave(function() {
         $(this).removeClass('active');
         $('.stage').children('.element').not('.active').removeClass('inactive');
     });
 }); */




</script>


</body>


</html>
