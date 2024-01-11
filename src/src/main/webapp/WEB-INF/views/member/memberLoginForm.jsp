<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>로그인 화면</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
</head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Diphylleia&family=Nanum+Pen+Script&family=Noto+Sans+Display:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Noto+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Song+Myung&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

a {
	text-decoration: none;
	color: black;
}

li {
	list-style: none;
}

.wrap {
	width: 100%;
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	background: rgba(0, 0, 0, 0.1);
	background-color: white;
}

.login {
	width: 30%;
	height: 600px;
	background: white;
	border-radius: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

h2 {
	color: black;
	font-size: 2em;
	font-weight: 800;
}

.login_id, .login_pw {
	margin-top: 20px;
	width: 80%;
}

.login_id input, .login_pw input {
	width: 100%;
	height: 50px;
	margin-top: 10px;
	padding: 0px 20px;
	border: 1px solid lightgray;
	outline: none;
}

.login_etc {
	margin-top: 10px;
	width: 80%;
	font-size: 14px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-weight: bold;
}

.submit {
	margin-top: 20px;
	width: 80%;
}

.submit input {
	width: 100%;
	height: 50px;
	border: 0;
	outline: none;
	color: white;
	background-color: navy;
	font-size: 1.2em;
	letter-spacing: 2px;
	font-weight: bold;
	cursor: pointer;
}

.loginId, .loginPwd {
	background-color: #f2f2f2;
	font-size: 18px;
}

.form-tag {
	width: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.leftLine, .rightLine {
	background-color: #d1c1c1;
	height: 2px;
	width: 200px;
}

.login-bottom {
	margin-top: 50px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.otherLogin {
	margin: 0 20px;
	width: 200px;
}

.userInfo {
	margin-top: 20px;
}

.kakaoLoginBtn{
	margin-top: 20px;
}
</style>
<body>

	<%@ include file="../common/header.jsp"%>

	<div class="wrap">
		<div class="login">
			<h2>LOGIN</h2>
			<form class="form-tag" action="login.me" method="post">
				<div class="login_id">
					<h4>ID</h4>
					<input type="text" name="memberId" class="loginId" id="logId">
				</div>
				<div class="login_pw">
					<h4>Password</h4>
					<input type="password" name="memberPwd" class="loginPwd" id="logPwd">
				</div>
				<div class="login_etc">
					<div class="checkbox">
						<label for="rememberId">
						<input type="checkbox" id="checkId" name="remember" value="chk"> 아이디저장
						</label>
					</div>
				</div>
				<div class="submit">
					<input type="submit" value="로그인" class="submitBtn">
				</div>
			</form>

			<div class="userInfo">
				<a href="enrollForm.me">회원가입</a> | 
				<a href="findMemberIdForm.me">아이디 찾기</a> | 
				<a href="findMemberPwdForm.me">비밀번호 찾기</a>
			</div>

			<div class="login-bottom">
				<div class="leftLine"></div>
				<div class="otherLogin">
					<p style="font-size: 20px; font-weight: bold;" align="center">SNS
						계정으로 로그인</p>
				</div>
				<div class="rightLine"></div>
			</div>

			<!-- 카카오톡으로 로그인들어갈 자리 -->
			<a id="kakao-login-btn" href="javascript:loginWithKakao()" class="kakaoLoginBtn">
			  <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
			    alt="카카오 로그인 버튼" />
			</a>
			<p id="token-result"></p>
		
		</div>
	<script>
	
		$(document).ready(function(){
		
				//저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
				var logId = getCookie("logId");
			
				$("input[name='memberId']").val(logId);  
			 
				if($("input[name='memberId']").val() != ""){ //처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
					$("#checkId").attr("checked", true); //ID 저장하기를 체크 상태로 두기.
				}
			
				$("#checkId").change(function(){ //체크박스에 변화가 있다면,
					if($("#checkId").is(":checked")){ //ID 저장하기 체크했을 때,
						var logId = $("input[name='memberId']").val();
						setCookie("logId",logId,1); //1일 동안 쿠키 보관
					}else{ // ID 저장하기 체크 해제 시,
						deleteCookie("logId");
					}
				});
			
				//ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
				$("input[name='memberId']").keyup(function(){ //ID 입력 칸에 ID를 입력할 때,
					if($("#checkId").is(":checked")){ //ID 저장하기를 체크한 상태라면,
						var logId = $("input[name='memberId']").val();
						setCookie("logId",logId,1); //1일 동안 쿠키 보관
					}
				});
			
		});	
		<%-- 쿠키 설정 --%>
		function setCookie(cookieName, value, exdays){
			var exdate = new Date();

			exdate.setDate(exdate.getDate() + exdays);

			var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());

			document.cookie = cookieName + "=" + cookieValue;
		}

		 
		<%-- 쿠키 삭제 --%>
		function deleteCookie(cookieName){
			var expireDate = new Date();

			expireDate.setDate(expireDate.getDate() - 1);

			document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}

		 
		<%-- 쿠키 호출 --%>
		function getCookie(cookieName) {

			cookieName = cookieName + '=';

			var cookieData = document.cookie;
			var start = cookieData.indexOf(cookieName);
			var cookieValue = '';

			if(start != -1){
				start += cookieName.length;

				var end = cookieData.indexOf(';', start);

				if(end == -1)end = cookieData.length;

				cookieValue = cookieData.substring(start, end);
			}
			return unescape(cookieValue);
		}
	
	</script>
		<!-- 카카오 스크립트 
		<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
  		  integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous">
		</script>
		<script>
		  Kakao.init('4983a14747a2dbcd8543611ab2fe283e'); //사용하려는 앱의 JavaScript 키 입력
		</script>
		<script>
			  function loginWithKakao() {
			    Kakao.Auth.authorize({
			      redirectUri: 'http://localhost:8887/littleEco/',
			    });
			  }
			
			  displayToken()
			  function displayToken() {
			    var token = getCookie('authorize-access-token');
			
			    if(token) {
			      Kakao.Auth.setAccessToken(token);
			      Kakao.Auth.getStatusInfo()
			        .then(function(res) {
			          if (res.status === 'connected') {
			            document.getElementById('token-result').innerText
			              = 'login success, token: ' + Kakao.Auth.getAccessToken();
			          }
			        })
			        .catch(function(err) {
			          Kakao.Auth.setAccessToken(null);
			        });
			    }
			  }
			
			  function getCookie(name) {
			    var parts = document.cookie.split(name + '=');
			    if (parts.length === 2) { return parts[1].split(';')[0]; }
			  }
			  
	</script>
	-->
	</div>
	
	<%@ include file="../common/footer.jsp"%>
</body>
</html>