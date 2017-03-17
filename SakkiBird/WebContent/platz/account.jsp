<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>로그인/회원가입</title>
  
  
  <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Open+Sans:600'>

  <link rel="stylesheet" href="css/account/style.css">

  
</head>

<body>
  <div class="login-wrap">
	<div class="login-html">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
		<div class="login-form">
		<form action="login-proc.jsp" method="post">
			<div class="sign-in-htm">
			<form>
				<div class="group">
					<label for="user" class="label">Email</label>
					<input name = "email" id="user" type="text" class="input">
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input name = "pw" id="pass" type="password" class="input" data-type="password">
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
		</form>
				<form action="account-proc.jsp" method="post">
					<div class="sign-up-htm">
						<div class="group">
							<label for="pass" class="label">Email Address</label> <input
								name ="email" id="pass" type="text" class="input">
						</div>
						<div class="group">
							<label for="user" class="label">Username</label> <input 
							    name = "user" id="user"type="text" class="input">
						</div>
						<div class="group">
							<label for="pass" class="label">Password</label> <input
							    name = "pw" id="pass"type="password" class="input" data-type="password">
						</div>
						<div class="group">
							<label for="pass" class="label">Confirm Password</label> <input
								id="pass" type="password" class="input" data-type="password">
						</div>
						<div class="group">
							<input type="submit" class="button" value="가입하기">
						</div>
						<div class="hr"></div>
						<div class="foot-lnk">
							<label>
								<!-- for="tab-1" -->MotherBird에 오신것을 환영합니다</a>
						</div>
					</div>
				</form>
			</div>
	</div>
</div>
  
  
</body>
</html>
