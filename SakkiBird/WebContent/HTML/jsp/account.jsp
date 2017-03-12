<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>로그인/회원가입</title>
  
  
  <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Open+Sans:600'>

  <link rel="stylesheet" href="../css/account/style.css">
</head>
<body>
  <div class="login-wrap">
	<div class="login-html">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
		<div class="login-form">
			<div class="sign-in-htm">
				<div class="group">
					<label for="user" class="label">Email</label>
					<input id="user" type="text" class="input">
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="pass" type="password" class="input" data-type="password">
				</div>
				<div class="group">
					<input id="check" type="checkbox" class="check" checked>
					<label for="check"><span class="icon"></span>로그인 상태 유지</label>
				</div>
				<div class="group">
					<input type="submit" class="button" value="로그인">
				</div>
				<div class="hr"></div>
				<div class="foot-lnk">
					<a href="#forgot">아이디를 까묵?</a>
	
				</div>
				<div class="foot-lnk">
					<a href="#forgot">비밀번호를 까묵?</a>
				</div>
				<div class="foot-lnk">
				<a href=""><img class= "img1" src="../images/페북.png"/></a>
				<a href=""><img class= "img1" src="../images/트위터.png"/></a>
				<a href=""><img class= "img1" src="../images/까똑.png"/></a>
				</div>
			</div>
			<form action="../../memberAddServlet" method="post">
				<div class="sign-up-htm">
					<div class="group">
						<label for="pass" class="label">Email Address</label>
						<input name = "email" id="pass" type="text" class="input">
					</div>
					<div class="group">
						<label for="user" class="label">Username</label>
						<input name ="username" id="user" type="text" class="input">
					</div>
					<div class="group">
						<label for="pass" class="label">Password</label>
						<input name="pw" id="pass" type="password" class="input" data-type="password">
					</div>
					<div class="group">
						<label for="pass" class="label">Confirm Password</label>
						<input  id="pass" type="password" class="input" data-type="password">
					</div>
					<div class="group">
						<input type="submit" class="button" value="가입하기">
					</div>
					<div class="hr"></div>
					<div class="foot-lnk">
						<label><!-- for="tab-1" -->MotherBird에 오신것을 환영합니다</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
  
  
</body>
</html>