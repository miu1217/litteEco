<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>littleEco</title>
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

/*---------------------------------콘텐츠영역-----------------------------------------*/
.wrap * {
	width: 100%;
	/* margin: auto; */
}
/*-------------상단 탑 이미지-------------------------------------------*/
.key_visual {
	width: 100%;
	height: 550px;
	overflow: hidden;
}

img .imgslide1 {
	width: 100%;
	height: auto;
	width: 100%;
	height: 550px;
	animation: slide1 7s infinite;
}
/*
     img .imgslide2{
        width: 100%;
        height: auto;
        position:absolute;
        left: 0;
        top: 0;
        width: 100%;
        height: 550px;
        animation: slide2 7s infinite;
     }

     img .imgslide3{
        width: 100%;
        height: auto;
        position:absolute;
        left: 0;
        top: 0;
        width: 100%;
        height: 550px;
        animation: slide3 7s infinite;
     }

     @keyframes slide1 {
        0%{left: -1200px;}
        33.33%{left:-1200px;}
        66.66%{left:0px;}
        100%{left:1200px;}
        
     }

     @keyframes slide2 {
        0%{left: -1200px;}
        33.33%{left:-1200px;}
        66.66%{left:0px;}
        100%{left:1200px;}
        
     }

     @keyframes slide3 {
        0%{left: -1200px;}
        33.33%{left:-1200px;}
        66.66%{left:0px;}
        100%{left:1200px;}
        
     }*/

/*------------브랜드 콘텐츠 / 로그인전, 취향선택안한회원------------------*/
.our-brand {
	width: 100%;
	/* background-color:brown ; */
	margin-top: 90px;
	margin-left: 80px;
	/* 로그인전취향선택안한 회원 함수에서 바꿔주세여 */
}

.our-brand>div {
	float: left;
	height: 1010px;
	/* position: relative; */
}

.our-brand>p {
	font-weight: 800;
	font-size: 70px;
	margin-left: 350px;
}

#brand1 {
	width: 860px;
	/* background-color: white; */
}

#brand1>div {
	float: left;
}

#bimg {
	width: 552px;
	height: 737px;
	/* z-index: 100;/ */
	/* background-color: firebrick; */
	position: relative;
}

#btext1 {
	position: absolute;
	z-index: 120;
	top: 580px;
	left: 40px;
	width: 195px;
	height: 75px;
}

#btext1 img {
	padding-bottom: 15px;
}

#btext1 span {
	font-weight: 600;
	font-size: 24px;
}

.subIm {
	width: 30%;
	/* background-color: blanchedalmond; */
	margin-left: 42px;
}

#simg1 {
	height: 354px;
	width: 267px;
	/* background-color: tomato; */
}

#simg2 {
	margin-top: 30px;
	height: 354px;
	width: 267px;
	/* background-color: thistle; */
}

/*---------------------------------1-2------------------------------*/
#brand2 {
	width: 860px;
	/* background-color: violet; */
}

#brand2>div {
	float: left;
	/* height: 100% */
}

#bimgB2 {
	width: 552px;
	height: 737px;
	/* background-color: firebrick; */
	/* margin-left: 42px; */
	position: relative;
}

#btext2 {
	position: absolute;
	z-index: 120;
	top: 580px;
	left: 70px;
	width: 270px;
	height: 75px;
}

#btext2 img {
	width: 75px;
	height: 21px;
	padding-bottom: 15px;
}

#btext2 span {
	font-weight: 600;
	font-size: 24px;
}

.subImB2 {
	width: 30%;
	margin-left: 42px;
	/* background-color: blanchedalmond; */
}

#simg1B2 {
	height: 354px;
	width: 267px;
	/* background-color: tomato; */
}

#simg2B2 {
	margin-top: 30px;
	height: 354px;
	width: 267px;
	/* background-color: thistle; */
}

/*-------------------------로그인한 취향선택한 회원---------------------------------*/
.user-brand {
	height: 922px;
	margin-top: 90px;
	position: relative;
	overflow: hidden;
	margin-bottom: 100px;
}

.user-brand #tit {
	font-weight: 800;
	font-size: 70px;
	margin-left: 350px;
}

.brandListSlide {
	display: table;
	table-layout: fixed;
	border-spacing: 90px;
	height: 639px;
	margin-top: 120px;
	transform: translate3d(-882px, 0px, 0px);
}

.brandListSlide a {
	display: table-cell;
	width: 1162px;
}

#tit {
	width: 500px;
	height: 53px;
}

#ubt1 {
	/* position:relative; */
	top: 400px;
	left: 63px;
}

#ubt1 img {
	width: 176px;
	height: 27px;
	margin-bottom: 15px;
}

#ubt1 span {
	font-size: 52px;
	font-weight: 300;
	color: #fff;
	letter-spacing: -2.5px;
}

#ubt2 {
	position: absolute;
	top: 300px;
	padding-left: 56px;
}

#ubt2 img {
	width: 176px;
	height: 27px;
	margin-bottom: 15px;
}

#ubt2 span {
	font-size: 52px;
	font-weight: 300;
	letter-spacing: -2.5px;
	color: #000;
}

#ubt3 {
	position: absolute;
	top: 300px;
	padding-left: 56px;
}

#ubt3 img {
	width: 176px;
	height: 27px;
	margin-bottom: 15px;
}

#ubt3 span {
	font-size: 52px;
	font-weight: 300;
	letter-spacing: -2.5px;
	color: #000;
}

#pre {
	width: 29px;
	height: 138px;
	position: absolute;
	z-index: 9000;
	left: 406px;
	top: 550px;
}

#next {
	width: 30px;
	height: 140px;
	position: absolute;
	z-index: 9000;
	right: 210px;
	top: 550px;
}

/*----------------인기게시글영역------------------------*/
.bestcon {
	width: 100%;
	height: 515px;
	/* background-color: aqua; */
	float: left;
	position: relative;
}

.bestcon a {
	text-decoration: none;
	color: #000;
}

#bg {
	width: 1500px;
	height: 355px;
	background-color: #fff;
	position: absolute;
	left: 206px;
	top: 80px;
}

#bestwrap {
	width: 1390px;
	height: 275px;
	/* background-color: blue; */
	margin: 0 auto;
	margin-top: 40px;
}

#bestwrap div {
	float: left;
	width: 448px;
	height: 100%;
	padding-right: 10px;
	/* background-color: wheat; */
}
/*----------------베스트게시물 1구역------------------ */
#how {
	border-right: 1px solid #a1a1a1;
}

#how ul {
	list-style: none;
}

#how img {
	/* background-color: aqua; */
	width: 173px;
	height: 40px;
	margin-bottom: 60px;
}

#howtit {
	font-size: 28px;
	font-weight: 600;
	margin-bottom: 30px;
}

#how span {
	font-size: 16px;
	font-weight: 400;
	color: #666;
}

/*---------------------베스트게시글 2구역--------------------------- */
#moi {
	border-right: 1px solid #a1a1a1;
}

#moi ul {
	list-style: none;
}

#moi img {
	width: 104px;
	height: 40px;
	margin-bottom: 60px;
}

#moitit {
	font-size: 28px;
	font-weight: 600;
	margin-bottom: 30px;
}

#moi span {
	font-size: 16px;
	font-weight: 400;
	color: #666;
}
/*----------------랭킹------------------*/
#bestbg {
	width: 400px;
	/* height: 100%; */
	border: 1px solid #a1a1a1;
	border-radius: 20px;
	margin-left: 20px;
}

#bestbg p {
	margin-left: 40px;
	font-size: 26px;
	font-weight: 500;
	color: #4c4c4c;
}

#bestbg li {
	margin-left: 30px;
	padding-bottom: 10px;
	font-size: 16px;
	font-weight: 500;
	color: #595959;
}

.banner {
	width: 100%;
	height: 475px;
	margin-top: 120px;
	float: left;
	margin-left: 206px;
}

.banner p {
	font-size: 30px;
	font-weight: 500;
}

.banner>div {
	float: left;
	height: 152px;
}

#banner1 {
	padding-right: 70px;
	width: 715px;
}

#banner2 {
	width: 715px;
}

</style>
</head>
<body>

	<%@ include file="../views/common/header.jsp"%>

	<!--콘텐츠 영역 시작-->
	<div class="wrap">
		<div class="contents" id="content">
			<!--******************************메인 콘텐츠 영역 **********************************-->
			<div class="key_visual">
				<!--****************************상단 탑 이미지 영역*****************************-->
				<div class="key_visual-item active">
					<img src="resources/00_main/key_visual/01_topimg.png" class="imgslide1">
				</div>
				<div class="key_visual-item">
					<img src="resources/00_main/key_visual/02_topimg.png" class="imgslide2">
				</div>
				<div class="key_visual-item">
					<img src="resources/00_main/key_visual/03_topimg.png" class="imgslide3">
				</div>	
			</div>
			<!-- 메인화면 맨 위 사진 슬라이드 스크립트 -->
			<script>
				//메인사진슬라이드
				let currentSlide = 0;
		        const slides = document.querySelectorAll('.key_visual-item');
		        
		        function showSlide(index) {
		            slides.forEach((slide, i) => {
		                if (i === index) {
		                    slide.style.display = 'block';
		                } else {
		                    slide.style.display = 'none';
		                }
		            });
		        }
	
		        function nextSlide() {
		            currentSlide = (currentSlide + 1) % slides.length;
		            showSlide(currentSlide);
		        }
	
		        function prevSlide() {
		            currentSlide = (currentSlide - 1 + slides.length) % slides.length;
		            showSlide(currentSlide);
		        }
	
		        showSlide(currentSlide);
	
		        setInterval(nextSlide, 4000);
			</script>
		</div>


		<div class="sub_content">
			<!--****************로그인안한 기본화면, 취향선택 안한 회원 메인화면***************-->
			<c:if test="${empty loginUser or empty loginUser.categoryNo}">
				<section class="our-brand">
					<p>OUR ECO's</p>
					<div class="brand-area1" id="brand1">
						<div id="bimg">
							<img src="resources/00_main/01_con/01_defimg.png" alt="">
							<div id="btext1">
								<img src="resources/00_main/01_con/닥터노아logo.png" alt="" id="bLogo">
								<span> 순하면서 상쾌한 <br> 새로운 가글의 시대 </span>
							</div>
						</div>
						<div class="subIm">
							<div id="simg1">
								<a href=""><img src="resources/00_main/01_con/01_1brand_click.png" alt=""></a>
							</div>
							<div id="simg2">
								<a href=""><img src="resources/00_main/01_con/01_2branc_click.png" alt=""></a>
							</div>
						</div>
					</div>
					<div class="brand-area2" id="brand2">
						<div id="bimgB2">
							<img src="resources/00_main/01_con/02_defimg.png" alt="">


							<div id="btext2">
								<img src="resources/00_main/01_con/모레상점logo.png" alt=""
									id="bLogo2"> <br> <span> 건조한 입술도 촉촉하게 <br>
									도심 속 가로수도 지키는
								</span>
							</div>


						</div>
						<div class="subImB2">
							<div id="simg1B2">
								<a href=""><img
									src="resources/00_main/01_con/02_1brand_click.png" alt=""></a>
							</div>
							<div id="simg2B2">
								<a href=""><img
									src="resources/00_main/01_con/02_2brand_click.png" alt=""></a>
							</div>
						</div>

					</div>
				</section>
			</c:if>
			<!--******************************로그인후 화면,취향선택회원화면************************************* -->
			<c:if test="${not empty loginUser && not empty loginUser.categoryNo}">
				<section class="user-brand">
					
					<div id="tit">YOUR ECO's</div>
					
					<div id="brandlist" class="brandListSlide" id=" section fp-section fp-table  fp-completely">
						<!-- ajax로 가져온 브랜드 넣을자리 --> 
					</div>
					
					<!-- *****************슬라이드 전 후 버튼 이미지******************** -->
					<div id="pre">
						<a href=""><img src="resources/00_main/01_con/prev.png" alt=""></a>
					</div>
					<div id="next">
						<a href=""><img src="resources/00_main/01_con/next.png" alt=""></a>
					</div>

				</section>

			</c:if>
			<!--************************  브랜드 리스트 가져오기 ***************************-->
			<script>
				
				$(document).ready(function(){
					
					$.ajax({
						url : "getBrandList.ac",
						success  : function(result){
							
							var brandList = result
							var categoryNo = "${loginUser.categoryNo}"
							var brandLogoList = "";
							
							console.log(brandList);
							console.log(categoryNo);
							
							for(var i=0; i<brandList.length; i++){
									brandLogoList = "<a href=''><img src='"
													+ brandList[i].imgSrc
													+ "'><div id='ubt1' <br> <span>"
													+ brandList[i].brandName
													+ "</span></div></a>";
											
													
								console.log(brandLogoList);					
							}		
								
							$("#brandlist").html(brandLogoList);
							
						},error : function(){
							console.log("통신 실패");
						}
					});
					
				});
			
			</script>
			<!--*************************************인기게시글 영역*****************************************************-->
			<section class="bestcon">
				<img src="resources/00_main/02_con/bg.png" alt="">
				<div id="bg">
					<div id="bestwrap">
						<div id="how">

							<ul>
								<li><img src="resources/00_main/02_con/howto.png" alt=""></li>

								<!--************게시물 타이틀이 들어갈 자리입니다아아아아아아아***********-->
								<li id="howtit"><a href="">생활속 분리배출</a></li>

								<li><span> <!--***********게시물 내용들어갈 자리이이이이이ㅣㅇ이이이 *-*********-->
										게시물 내용이 들어가느 ㄴ자리 <br> 몇줄이 들어갈지 아무도 모르는 자리 <br> 얼마나
										적어놔야할까여 ........

								</span></li>
							</ul>
						</div>
						<div id="moi">
							<ul>
								<li><img src="resources/00_main/02_con/moiza.png" alt=""></li>

								<!--************게시물 타이틀이 들어갈 자리입니다아아아아아아아***********-->
								<li id="moitit"><a href="">생활속 분리배출</a></li>

								<li><span> <!--***********게시물 내용들어갈 자리이이이이이ㅣㅇ이이이 *-*********-->
										게시물 내용이 들어가느 ㄴ자리 <br> 몇줄이 들어갈지 아무도 모르는 자리 <br> 얼마나
										적어놔야할까여 ........

								</span></li>
							</ul>
						</div>


						<!--****************인기게시글 랭킹 영역******************************-->
						<div id="best">
							<div id="bestbg">
								<p>인기게시글</p>
								<ol>
									<li><a href="">인기글1</a></li>
									<li><a href="">인기게시글타이틀</a></li>
									<li><a href="">인기게시글타이틀</a></li>
									<li><a href="">인기게시글타이틀</a></li>
									<li><a href="">인기게시글타이틀</a></li>
								</ol>
							</div>

						</div>
					</div>

				</div>
			</section>

			<!--*************배너 이미지 박아둔거라 신경안쓰셔도 됩니다**************************-->
			<section class="banner">
				<p>이벤트·행사</p>
				<div id="banner1">
					<img src="resources/00_main/03_con/01_banner.png" alt="">
				</div>
				<div id="banner2">
					<img src="resources/00_main/03_con/02_banner.png" alt="">
				</div>
			</section>
		</div>
	</div>
	<jsp:include page="../views/common/footer.jsp" />

</body>
</html>