<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	String validate = request.getParameter("validate");

	System.out.println(validate);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인/회원가입</title>


<link rel='stylesheet prefetch'
	href='http://fonts.googleapis.com/css?family=Open+Sans:600'>

<link rel="stylesheet" href="css/account/style.css">

<!-- 회원가입   -->
<script type="text/javascript">
 	function sendIt()
 	{
        var email = document.querySelector("#emailInput");
        var user = document.querySelector("#userInput");
        
        var pass = document.querySelector("#passInput");
        var pass1 = document.querySelector("#passInput1");
    
        var myForm = document.querySelector("#myForm");
        
        var str = email.value;//이메일 데이터값
         
        str = str.trim();//공백 제거

        
        if(!str){
            alert("이메일을 입력하세요");
            email.focus();//해당입력란으로 포커싱
            return;
        }
   
        if(!emailcheck(str)){
            alert("정상적인 이메일을 입력하세요");
            email.focus();
            return;
        }
        if(user.value.length ==0){
            alert("유저네임을 입력하세요");
            user.focus();
            return;
        }

        if(pass.value.length ==0){
            alert("비밀번호를 입력하세요");
            pass.focus();
            return;
        }
        //패스워드 일치 체크
        if(pass.value != pass1.value){
            alert("패스워드가 같지 않습니다 확인해주세요");
            pass.focus();
            return;
        }

        myForm.submit();
 		
 	}
     /*이메일 정규식 검사*/
    function emailcheck(strValue)
    {
        var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
        //입력을 안했으면
        if(strValue.lenght == 0)
        {return false;}
        //이메일 형식에 맞지않으면
        if (!strValue.match(regExp))
        {return false;}
        return true;
    }
 </script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>

<body>
<!-- 	<div id="naver_id_login"></div>
	//네이버아이디로로그인 버튼 노출 영역
	<script type="text/javascript">
  	var naver_id_login = new naver_id_login("Y6l8Zy4zJ8u_RebKOpFT", "http://192.168.123.108:8080/SakkiBird/platz/login-proc.jsp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("motherbirds.com");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  </script> -->


	<div class="login-wrap">
		<div class="login-html">
			<%if (validate != null && validate.equals("false")) {%>
			<div id="warning">아이디 또는 비번이 유효하지 않습니다.</div>
			<%}%>

			<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
				for="tab-1" class="tab">Sign In</label> <input id="tab-2"
				type="radio" name="tab" class="sign-up"><label for="tab-2"
				class="tab">Sign Up</label>
			<div class="login-form">
				<form action="login-proc.jsp" method="post">
					<div class="sign-in-htm">
						<form>
							<div class="group">
								<label for="user" class="label">Email</label> <input
									name="email" id="user" type="text" class="input" required="required">
							</div>
							<div class="group">
								<label for="pass" class="label">Password</label> <input
									name="pw" id="pass" type="password" class="input"
									data-type="password" required="required">
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
								<a href=""><img class="img1" src="img/페북.png" /></a> <a
									href=""><img class="img1" src="img/트위터.png" /></a> <a
									href=""><img class="img1" src="img/까똑.png" /></a>
							</div>
						</form>
					</div>

					<form id="myForm" action="account-proc.jsp" method="post">
						<div class="sign-up-htm">
							<div class="group">
								<label for="pass" class="label">Email Address</label> <input
									name="email" id="emailInput" type="text" class="input">
							</div>
							<div class="group">
								<label for="user" class="label">Username</label> <input
									name="user" id="userInput" type="text" class="input">
							</div>
							<div class="group">
								<label for="pass" class="label">Password</label> <input
									name="pw" id="passInput" type="password" class="input"
									data-type="password">
							</div>
							<div class="group">
								<label for="pass" class="label">Confirm Password</label> <input
									id="passInput1" type="password" class="input"
									data-type="password">
							</div>
							<div class="group">
								<input id="idReg" type="button" class="button" value="가입하기"
									onclick="sendIt()">
							</div>
							<div class="hr"></div>
							<div class="foot-lnk">
								<label> <!-- for="tab-1" -->MotherBird에 오신것을 환영합니다</a>
							</div>
						</div>
					</form>
			</div>
		</div>
	</div>


</body>
</html>
