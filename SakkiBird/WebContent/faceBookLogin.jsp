<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Facebook Login JavaScript Example</title>
<meta charset="UTF-8">
</head>
<body>
<script>
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    if (response.status === 'connected') {
      // 페이스북과 앱에 같이 로그인되어 있다.
      var uid = response.authResponse.userID;
     var accessToken = response.authResponse.accessToken;
     console.log('uid: '+uid);//사용자 고유값
     console.log('accessToken: '+accessToken);//권한 체크를 위한 값 일정 기간 마다 변경 됨
      testAPI();
    } else if (response.status === 'not_authorized') {
      // 페이스북에는 로그인 되어있으나, 앱에는 로그인 되어있지 않다.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    } else {
      //  페이스북에 로그인이 되어있지 않아서, 앱에 로그인 되어있는지 불명확하다.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into Facebook.';
    }
  }

  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
  FB.init({
    appId      : '669794856538437',
    cookie     : true,  // enable cookies to allow the server to access 
                        // the session
    xfbml      : true,  // parse social plugins on this page
    version    : 'v2.5' // use graph api version 2.5
  });

  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });

  };

  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML =        'Thanks for logging in, ' + response.name + '!';
    });
  }
  
</script>

<!--
  Below we include the Login Button social plugin. This button uses
  the JavaScript SDK to present a graphical Login button that triggers
  the FB.login() function when clicked.
-->

<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
</fb:login-button>

<div id="status">
</div>

</body>
</html>