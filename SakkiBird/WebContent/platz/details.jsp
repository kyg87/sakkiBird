<%@page import="com.motherbirds.model.WriterModel"%>
<%@page import="com.motherbirds.dao.MYSQLWriter"%>
<%@page import="com.motherbirds.model.BoardCommentModel"%>
<%@page import="java.util.List"%>
<%@page import="com.motherbirds.dao.BoardCommentDAO"%>

<%
	String pageNum = request.getParameter("page");
	BoardCommentDAO bocodao = new BoardCommentDAO();
	List<BoardCommentModel> list = bocodao.getList();
	
	System.out.println(request.getParameter("page"));
	
	MYSQLWriter writerDAO = new MYSQLWriter();
	WriterModel writerModel = writerDAO.getWriteModel(Integer.parseInt(pageNum));
	
	System.out.println(writerModel.getContent_img());

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

</head>

<body>

	<a name="ancre"></a>

	<!-- CACHE -->
	<div class="cache"></div>

	<!-- HEADER -->

	<div id="wrapper-header">
		<div id="main-header" class="object">
			<a href="index.html"><div id="logo">
					<img src="img/logo-burst.svg" alt="logo burstfly" height="38"
						width="90">
				</div></a>
			<div id="main_tip_search">
				<form>
					<input type="text" name="search" id="tip_search_input"
						list="search" autocomplete=off required>
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
					<div class="top-rated object">Top-rated</div>
					<div id="fleche-nav-1"></div>
				</div>

				<div id="wrapper-title-2">
					<a href="#"><div class="recent object">Recent</div></a>
					<div id="fleche-nav-2"></div>
				</div>

				<div id="wrapper-title-3">
					<a href="#"><div class="oldies object">Oldies</div></a>
					<div id="fleche-nav-3"></div>
				</div>
			</div>
			<div id="wrapper-bouton-icon">
				<div id="bouton-ai">
					<img src="img/icon-ai.svg" alt="illustrator" title="Illustrator"
						height="28" width="28">
				</div>
				<div id="bouton-psd">
					<img src="img/icon-psd.svg" alt="photoshop" title="Photoshop"
						height="28" width="28">
				</div>
				<div id="bouton-theme">
					<img src="img/icon-themes.svg" alt="theme" title="Theme"
						height="28" width="28">
				</div>
				<div id="bouton-font">
					<img src="img/icon-font.svg" alt="font" title="Font" height="28"
						width="28">
				</div>
				<div id="bouton-photo">
					<img src="img/icon-photo.svg" alt="photo" title="Photo" height="28"
						width="28">
				</div>
				<div id="bouton-premium">
					<img src="img/icon-premium.svg" alt="premium" title="Premium"
						height="28" width="28">
				</div>
			</div>
		</div>
	</div>

	<!-- FILTER -->

	<div id="main-container-menu" class="object">
		<div class="container-menu">

			<div id="main-cross">
				<div id="cross-menu"></div>
			</div>

			<div id="main-small-logo">
				<div class="small-logo"></div>
			</div>

			<div id="main-premium-ressource">
				<div class="premium-ressource">
					<a href="#">Premium Resources</a>
				</div>
			</div>

			<div id="main-themes">
				<div class="themes">
					<a href="#">Latest themes</a>
				</div>
			</div>

			<div id="main-psd">
				<div class="psd">
					<a href="#">PSD Goodies</a>
				</div>
			</div>

			<div id="main-ai">
				<div class="ai">
					<a href="#">Illustrator freebies</a>
				</div>
			</div>

			<div id="main-font">
				<div class="font">
					<a href="#">Free fonts</a>
				</div>
			</div>

			<div id="main-photo">
				<div class="photo">
					<a href="#">Free stock photos</a>
				</div>
			</div>

		</div>
	</div>


	<!-- PORTFOLIO -->

	<div id="wrapper-container">

		<div class="container object">

			<div id="main-container-image">

				<div class="title-item">
					<div class="title-icon"></div>
					<div class="title-text">전광렬, 그가 고통받고있는 이유는??</div>
					<div class="title-text-2">Sept 25, 2015 by Onuur</div>
					
					<div class="title-text-2"><strong>작성자 : </strong> KwangForever</div>
					<div class="title-text-2"><strong>작성 시간 : </strong> 2017/02/15 17:52</div>
					<div class="title-text-2"><strong>마감 시간 : </strong> 2017/03/09 18:00</div>
				</div>
	

				<div class="work">
					<figure class="white">
						<img src="images/<%=writerModel.getContent_img()%>" alt="" />
						<div id="wrapper-part-info">
							<div class="part-info-image-single">
								<div>
									<p>안녕하세요 전광렬입니다.</p>
									<p>저는 지금 고통받고 있습니다. 무엇때문에 고통받고 있을까요?</p>
									<p></p>
									<p></p>
								</div>

								<div id="radio-btns">
									<p>
										<input type="radio" name="group" /> <label>1번 선택지 1번
											선택지1번 선택지1번 선택지1번 선택지1번 선택지1번 선택지1번 선택지</label>
									</p>
									<p>
										<input type="radio" name="group" /> <label>2번 선택지2번
											선택지2번 선택지2번 선택지2번 선택지2번 선택지</label>
									</p>
									<p>
										<input type="radio" name="group" /> <label>3번 선택지3번
											선택지3번 선택지3번 선택지</label>
									</p>
									<p>
										<input type="radio" name="group" /> <label>4번 선택지4번
											선택지4번 선택지</label>
									</p>
									<p>
										<input type="radio" name="group" /> <label>5번 선택지</label>
									</p>

									<div id="vote-btns">
										<button>투표하기</button>
										<button>결과보기</button>
									</div>
								</div>

								<!-- 					------------------ 투표 결과 --------------------------- -->

								<div id="vote-style">
									<dl>
										<dt>
											<h2>VOTE Result</h2>
										</dt>
										<dd>1. 1번 선택지
										<dd id="percent">30%</dd>
										</dd>
										<dd>
											<meter class="vote-bar" value="3" min="0" max="10"></meter>
										</dd>

										<dd>2. 2번 선택지
										<dd id="percent">10%</dd>
										</dd>
										<dd>
											<meter class="vote-bar" value="1" min="0" max="10"></meter>
										</dd>

										<dd>3. 3번 선택지
										<dd id="percent">20%</dd>
										</dd>
										<dd>
											<meter class="vote-bar" value="2" min="0" max="10"></meter>

										</dd>

										<dd>4. 4번 선택지
										<dd id="percent">30%</dd>
										</dd>
										<dd>
											<meter class="vote-bar" value="3" min="0" max="10"></meter>

										</dd>

										<dd>5. 5번 선택지
										<dd id="percent">10%</dd>
										</dd>
										<dd>
											<meter class="vote-bar" value="1" min="0" max="10"></meter>

										</dd>
									</dl>
									<button id="vote-back">돌아가기</button>
								</div>
							</div>
						</div>
					</figure>

					<div class="post-send">
						<div id="main-post-send">
							<div id="title-post-send">Add your comment</div>
							<form id="contact" method="post"
								action="/onclickprod/formsubmit_op.asp">
								<fieldset>
									<p>
										<textarea id="message" name="message" maxlength="500"
											placeholder="Votre Message" tabindex="5" cols="30" rows="4"></textarea>
									</p>
								</fieldset>
								<div style="text-align: center;">
									<input type="submit" name="envoi" value="Envoyer" />
								</div>
							</form>
						</div>
					</div>

					<%for(BoardCommentModel bcm:list){ %>
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
				<div class="thank-text">
					<span>Thanks you</span>
					<span>라지현 & 유동근</span>
				</div>
			</div>
		</div>

		<div id="main-container-footer">
			<div class="container-footer">

				<div id="row-1f">
					<div class="text-row-1f">
						<span
							style="font-weight: 600; font-size: 15px; color: #666; line-height: 250%; text-transform: uppercase; letter-spacing: 1.5px;">What
							is Burstfly</span><br>Burstfly is just a blog showcasing
						hand-picked free themes, design stuff, free fonts and other
						resources for web designers.
					</div>
				</div>

				<div id="row-2f">
					<div class="text-row-2f">
						<span
							style="font-weight: 600; font-size: 15px; color: #666; line-height: 250%; text-transform: uppercase; letter-spacing: 1.5px;">How
							does it work</span><br>Burstfly offers you all the latest freebies
						found all over the fourth corners without to pay.
					</div>
				</div>

				<div id="row-3f">
					<div class="text-row-3f">
						<span
							style="font-weight: 600; font-size: 15px; color: #666; line-height: 250%; text-transform: uppercase; letter-spacing: 1.5px;">Get
							in touch!</span><br>Subscribe our RSS or follow us on Facebook,
						Google+, Pinterest or Dribbble to keep updated.
					</div>
				</div>

				<div id="row-4f">
					<div class="text-row-4f">
						<span
							style="font-weight: 600; font-size: 15px; color: #666; line-height: 250%; text-transform: uppercase; letter-spacing: 1.5px;">Newsletter</span><br>You
						will be informed monthly about the latest content avalaible.
					</div>

					<div id="main_tip_newsletter">
						<form>
							<input type="text" name="newsletter" id="tip_newsletter_input"
								list="newsletter" autocomplete=off required>
						</form>
					</div>
				</div>

			</div>
		</div>


		<div id="wrapper-copyright">
			<div class="copyright">
				<div class="copy-text object">
					Copyright © 2016. Template by <a style="color: #D0D1D4;"
						href="http://designscrazed.org/">Dcrazed</a>
				</div>

				<div class="wrapper-navbouton">
					<div class="google object">g</div>
					<div class="facebook object">f</div>
					<div class="linkin object">i</div>
					<div class="dribbble object">d</div>
				</div>
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
	
$("form").on("submit", function(event) {
  event.preventDefault();
  $.post("/burstfly/form-burstfly-modified.asp",$("form").serialize(), function(data) {//alert(data);
	});
});

</script>


</body>


</html>
