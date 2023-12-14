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

</style>
<body>

	<%@ include file="../common/header.jsp"%>

	<div class="wrap">
		<div class="login">
			<h2>LOGIN</h2>
			<form class="form-tag" action="login.me" method="post">
				<div class="login_id">
					<h4>ID</h4>
					<input type="text" name="memberId" class="loginId">
				</div>
				<div class="login_pw">
					<h4>Password</h4>
					<input type="password" name="memberPwd" class="loginPwd">
				</div>
				<div class="login_etc">
					<div class="checkbox">
						<label for="rememberId"> <input type="checkbox" name=""
							id="rememberId"> 아이디저장
						</label>
					</div>
				</div>
				<div class="submit">
					<input type="submit" value="로그인" class="submitBtn">
				</div>
			</form>

			<div class="userInfo">
				<a href="enrollForm.me">회원가입</a> | <a href="">아이디 찾기</a> | <a
					href="">비밀번호 찾기</a>
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

		</div>

	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>