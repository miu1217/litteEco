<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&family=Noto+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap')
	;
/*
        font-family: 'Noto Sans', sans-serif;
        font-family: 'Noto Sans KR', sans-serif;
        */
footer {
	border: 1px solid black;
	background-color: #000;
	display: flex;
	/* justify-content: left; */
	width: 1920px;
	height: 300px;
}

.footer_content {
	display: inline-block;
	margin-left: 230px;
	margin-top: 80px;
}

#ftxt {
	color: #a1a1a1;
}

.koText a {
	text-decoration: none;
	color: #a1a1a1;
}

.engText {
	color: #a1a1a1;
}

.footer_content table {
	width: 300px;
	text-align: left;
}
</style>
</head>

<body>
	<!--footer영역-->
	<footer>
		<div id="footer_area">
			<div class="footer_content">

				<table id="ftxt">
					<thead>
						<tr>
							<th class="fstxt">소개</th>
							<th class="fstxt">이용약관</th>
							<th class="fstxt">개인정보</th>
							<th class="fstxt">취급방법</th>
						</tr>
					</thead>
				</table>

				<br>
				<p class="littleEco_info koText">
					<a href="#">㈜리틀에코 사업자 정보</a>
				</p>
				<p class="littleEco_copyright engText">ⓒ LITTlE ECO All right
					reserved</p>
			</div>
		</div>
	</footer>
</body>

</html>
