<%@ page contentType="text/html;charset=utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
	<button id="facebook">facebook</button>
	<button id="twitter">twitter</button>
	<!-- <button id="me2day">me2day</button>
	<button id="yozm">yozm</button> -->
<script type="text/javascript">

var  facebook = document.querySelector("#facebook")
	,twitter = document.querySelector("#twitter")
	/* ,me2day = document.querySelector("#me2day")
	,yozm = document.querySelector("#yozm") */

	,thisUrl = "http://motherbirds.com/platz/details.jsp?page=1018"
	,msg = "테스트 페이지를 SNS에 연동합니다. http://goo.gl/MxddN"
	,tag = "romeoh"

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
</body>
</html>