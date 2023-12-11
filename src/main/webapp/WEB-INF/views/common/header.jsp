<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&family=Noto+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<style>
* {
	font-family: 'Noto Sans', sans-serif;
	font-family: 'Noto Sans KR', sans-serif;
}

html
        body {
	margin: 0;
	padding: 0;
}

header {
	height: auto;
	position: relative;
	z-index: 100;
	display: block;
}

.top-area {
	position: relative;
	z-index: 110;
	width: 100%;
	height: 60px;
	background-color: #000;
}

header .inner{
	height: 100%;
	justify-content: flex-start;
}

.aside {
	margin-left: 10%;
}

.nav {
	/* border: 1px solid white; */
	float: right;
	display: block;
	margin-top: 20px;
	margin-right: 240px;
}

.menu{
	vertical-align: middle;
}
/*-------------------헤더 탑영역(로그인 faq 공지사항 버튼 영역)------------*/
.nav a {
	text-decoration: none;
	padding-left: 63px;
	font-size: 16px;
	font-style: normal;
	color: #fff;
}

.gnb-area {
	width: 100%;
}

.gnb-wrap {
	height: 80px;
}

.gnb-area .inner {
	display: flex;
	padding-left: 240px;
	align-items: center;
}

.menu {
	display: flex;
	padding-left: 100px;
	align-items: center;
}

.menu ul li{
	list-style: none;
	float: left;
	padding-left: 75px;
	font-size: 18px;
	font-weight: 500;
}

.menu a, .returnMain {
	text-decoration: none;
	color: #4c4c4c;
}

.gnb-area .inner .ul{
	margin-top : 10px;
}

/*------------------------헤더영역 끝-----------------------------------------------*/
</style>
</head>

<body>
	<header class="gnb">
		<!--***************************헤더영역*************************************-->
		<div class="top-area">
			<div class="inner">
				<div class="aside">
					<div class="nav">
						<a href="enrollForm.me">Join</a>
						<a href="loginForm.me">Login</a>
						<a href="">FAQ</a>
						<a href="">Notice</a>
					</div>

				</div>

			</div>
		</div>
<<<<<<< HEAD
		<!--*****************************로그인 후 헤더************************************************-->
=======
		<!--****************************로그인 후 헤더************************************************-->
>>>>>>> refs/remotes/origin/wjdwngh1
		<div class="top-area" style="display: none;">
			<div class="inner">
				<div class="aside">
					<div class="nav">
						<a href="">Mypage</a> <a href="">Logout</a> <a href="">FAQ</a> <a
							href="">Notice</a>
					</div>

				</div>

			</div>
		</div>
		<div class="gnb-area">
			<div class="gnb-wrap">
				<div class="inner">
					<!--로고예용-->
					<h1 class="lelogo">
					<a href="/littleEco" class="returnMain">LittleECO</a>
					</h1>
					<!--메뉴!!-->
					<div class="menu">
						<ul class="menu2">
							<li><a href="">About</a></li>
							<li><a href="">searchEco</a></li>
							<li><a href="">How2Recycle</a></li>
							<li><a href="">moiza</a></li>
						</ul>

					</div>
				</div>
			</div>
		</div>
	</header>
	<!--*******************************헤더영역 끝**********************************************-->
</body>
</html>