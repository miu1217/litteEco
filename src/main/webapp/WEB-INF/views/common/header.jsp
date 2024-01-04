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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&family=Noto+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <style>

     *{
        max-width: 1920px;
        font-family: 'Noto Sans', sans-serif;
        font-family: 'Noto Sans KR', sans-serif;
     }

     html
        body {
            width: 100%;
            margin: 0;
            padding: 0;
        }

     header {
        height: auto;
        /* position: relative; */
        z-index: 100;
        /* display: block; */

     }
     .top-area{
        position: relative;
        z-index: 110;
        width: 100%;
        height: 60px;
        background-color: #000;  
     }

     .nav {
        /* border: 1px solid darkcyan; */
        float: right;
        display: inline;
        margin-top: 20px;
       margin-right: 60px;
          }

     /*-------------------헤더 탑영역(로그인 faq 공지사항 버튼 영역)------------*/
     .nav a{
        text-decoration: none;
        padding-left: 63px;
        font-size: 16px;
        font-style: normal;
        color:#fff;
     }

     .gnb-wrap{
        width: 100%;
        height: 80px;
        /* vertical-align: middle; */
        /* border: 1px solid saddlebrown; */
     }

     .gnb-area .inner{
        display: flex;
        padding-left: 240px;
        align-items: center;
     	margin-top: 20px;     
     }

     .menu{
        margin-left: 150px;      
        position: absolute;
        align-items: center;
     }

     .menu ul{
        list-style: none;
        display: block;
        padding-top: 5px;
        /* float: left; */
        padding-left: 75px;
        font-size: 18px;
        font-weight: 500;
    }

    .menu a, .lelogo a{
        text-decoration: none;
        color: #4c4c4c;
    }
    .menus{
        display: inline;
        padding-left: 30px;
    }
    
/*------------------------헤더영역 끝-----------------------------------------------*/
</style>
</head>

<body>
	<!-- alert창 띄우기 -->
	<c:if test="${not empty alertMsg }">
		<script>
			var alertMsg = "${alertMsg}";
			alert(alertMsg);
		</script>
		<c:remove var="alertMsg" />
	</c:if>
   <header class="gnb">
      <!--***************************헤더영역*************************************-->
      <c:choose>
			<c:when test="${empty loginUser}">
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
			</c:when>
			<c:otherwise>
				<div class="top-area">
					<div class="inner">
						<div class="aside">
							<div class="nav">
								<a href="">Mypage</a>
								<a href="logout.me">Logout</a>
								<a href="">FAQ</a>
								<a href="">Notice</a>
							</div>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
  <div class="gnb-area">
      <div class="gnb-wrap">
          <div class="inner">
              <!--로고예용-->
              <h1 class="lelogo"><a href="/littleEco">LittleECO</a></h1>
              <!--메뉴!!-->
              <div class="menu">
                  <ul>
                      <li class="menus"><a href="">About</a></li>
                      <li class="menus"><a href="">searchEco</a></li>
                      <li class="menus"><a href="">How2Recycle</a></li>
                      <li class="menus"><a href="">moiza</a></li>
                  </ul>

              </div>
          </div>
      </div>
  </div>
</header>

        <!--*******************************헤더영역 끝**********************************************-->
        </body>
</html>