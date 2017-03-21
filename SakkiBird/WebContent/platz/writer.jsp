<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<link href="css/write/layout.css" type="text/css" rel="stylesheet" />
	<link href="css/write/style.css" type="text/css" rel="stylesheet" />

</head>
<body>

<a name="ancre"></a>

<!-- CACHE -->
<div class="cache"></div>

<!-- HEADER -->

<div id="wrapper-header">
	<div id="main-header" class="object">
		<div class="logo"><img src="img/LOGO.png" alt="logo platz" height="38" width="90"></div>
        <div id="main_tip_search">
			<form> 
				<input type="text" name="search" id="tip_search_input" list="search" autocomplete=off required>
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
           <a href="index.jsp"> <div class="rated object">MAIN</div></a>
            	<div id="fleche-nav-1"></div>
    		</div>
            
            <div id="wrapper-title-2">
            <a href="writer.html"><div class="top-recent object">WRITE</div></a>
                <div id="fleche-nav-2"></div>
    		</div>
            
            <div id="wrapper-title-3">
            <a href="#"><div class="oldies object">LOGIN</div></a>
                <div id="fleche-nav-3"></div>
    		</div>
            </div>
            <div id="wrapper-bouton-icon">
            	<div id="bouton-ai"><img src="img/48_twitter_circle_color.png" alt="illustrator" title="Illustrator" height="28" width="28"></div>
            	<div id="bouton-psd"><img src="img/48_facebook_circle_black.png" alt="photoshop" title="Photoshop" height="28" width="28"></div>
            	<div id="bouton-theme"><img src="img/KakaoTalk.jpg" alt="theme" title="Theme" height="28" width="28"></div>
            	<!-- <div id="bouton-font"><img src="img/icon-font.svg" alt="font" title="Font" height="28" width="28"></div>
            	<div id="bouton-photo"><img src="img/icon-photo.svg" alt="photo" title="Photo" height="28" width="28"></div>
            	<div id="bouton-premium"><img src="img/icon-premium.svg" alt="premium" title="Premium" height="28" width="28"></div> -->
			</div>
    	</div>
</div>




<!-- PORTFOLIO -->

	<div id="wrapper-container">
    
			<!-- WRAPPER -->
	<div id="wrapper">

		<!-- MAIN -->
		<div id="main">

			<!-- content -->
			<div id="content">

					<form action = "writer-proc.jsp" method="post">
						<table id="main-table">
							<thead>
								<tr>
									<td>제목</td>
									<td><input name ="title" id="TITLE" class="box green-box" type="text"
										placeholder="제목을입력하세요." required/></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>내용</td>
									<td>
									<textarea name ="content" id="content-box" rows="30" cols="80"></textarea>
									</td>
								</tr>
							</tbody>
							<tbody id="toDoList">
								<tr>
									<td>1번</td>
									<td><input name ="select" id="task" class="box" type="text"
										placeholder="항목을입력하세요." required/></td>
								</tr>
								<tr>
									<td>2번</td>
									<td><input name ="select" class="box" type="text" placeholder="항목을입력하세요." required/>
									</td>
								</tr>
							</tbody>
						</table>
						
						<div class="info-add">
							<input type="button" id="addTaskBtn" value ="╂"/>
						</div>
						
						<div id="option-field">
							<div id="time-option">
								<div id="time-field">
									<h1 class="hidden">마감입력</h1>
									<label>마감일시</label>
								</div>
								<div id="time-detail">
									<input class="mini-box " type="datetime-local" required/>
								</div>
							</div>
							<div id="image-option">
								<div id="image-field">
									<h1 class="hidden">사진입력</h1>
									<label>사진첨부</label>
								</div>
								<div id="image-detail">
									<!-- <input class="mini-box" type="text" placeholder="파일명" />-->
									<!--<input class="btn-style" type="button" value="찾아보기" />-->
									<input name ="file" type="file"  id="getfile" class="upload-box" required>
								</div>
							</div>
							<!-- <input class="btn-style" type="button" value="미리보기" /> -->
							<div id="image">
								<img id="thumbnail" src="img/empty.jpg" width="140px" />
							</div>
						</div>
						
						<div id="option-bottom">
							<input class="back-box btn" type="button" value="목록으로" /> 
							<input id="reg-button" class="success-box btn" type="submit" value="등록하기" />
						</div>
						
					</form>
				</div>
			<!-- ENDS content -->

		</div>
		<!-- ENDS MAIN -->



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

	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.scrollTo.min.js"></script>
    <script type="text/javascript" src="js/jquery.localScroll.min.js"></script>
    <script type="text/javascript" src="js/jquery-animate-css-rotate-scale.js"></script>
	<script type="text/javascript" src="js/fastclick.min.js"></script>
	<script type="text/javascript" src="js/jquery.animate-colors-min.js"></script>
	<script type="text/javascript" src="js/jquery.animate-shadow-min.js"></script>    
	<script type="text/javascript" src="js/main.js"></script>
	<script type="text/javascript" src="js/toDoListAdd.js"></script>
	<script type="text/javascript" src="js/fileUpload.js"></script>
	
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

</script>


</body>


</html>
