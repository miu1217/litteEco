<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&family=Noto+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
   <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
    <!-- 부트스트랩 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>

     *{
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
     .top-area{
        position: relative;
        z-index: 110;
        width: 100%;
        height: 60px;
        background-color: #000;

        
     }

     header .inner *{

        height: 100%; 

        justify-content: flex-start;
        align-items: center;
        
     }
     .aside{
        margin-left: 10%;
     }

     
     .nav {
        /* border: 1px solid white; */
        float: right;
        display: block;
        margin-top: 20px;
        margin-right: 240px;
          }

     /*-------------------헤더 탑영역(로그인 faq 공지사항 버튼 영역)------------*/
     .nav a{
        text-decoration: none;
        padding-left: 63px;
        font-size: 16px;
        font-style: normal;
        color:#fff;
     }

    .nav button{
    	text-decoration: none;
        margin-left: 40px;
        font-size: 16px;
        font-style: normal;
        color:#fff;
    }
    

     .gnb-area {
        width: 100%;
    }

     .gnb-wrap{
        height: 80px;

     }

     .gnb-area .inner{
        display: flex;

        align-items: center;

        padding-left: 240px;
     }

     .menu{
        display: flex;
        padding-left: 100px;
      
      
     }

     .menu ul li {
       
        list-style: none;
        float: left;
        padding-left: 75px;
        font-size: 18px;
        font-weight: 500;
    }
    .menu a{
        text-decoration: none;
        color: #4c4c4c;
    }
    
    

    

/*------------------------헤더영역 끝-----------------------------------------------*/
</style>
</head>

<body>
	<c:if test="${not empty alertMsg }">
		<script>
			var alertMsg = "${alertMsg}";
			alert(alertMsg);
		</script>
		<c:remove var="alertMsg"/>
	</c:if>



    <header class="gnb">
            <!--***************************헤더영역*************************************-->
            <div class="top-area">
             <div class="inner">
                <div class="aside">
                    <div class="nav">
                        <a href="insert.me">Join</a>
                        <a href="loginForm.me">Login</a>
                        <a href="">FAQ</a>
                        <a href="scrap.mp">Notice</a>
                        <a href="mypage.me">Mypage</a> <!-- 잠깐 빼놨음 -->
					 <button id="searchBtn"><img src="resources/img/search.png" width="20" height="20"></button>
					<form action="insert.ps" class="insertForm" method="post" style="position: relative;">
					    <input type="text" id="searchBox" name="keyword" style="display: none;" style="width : 30%;">
					    <button type="submit" id="searchBtn2" style="display: none; background-color: transparent;">검색</button>
					    <!-- 자동완성 띄워줄 영역 -->
						<div id="autoComplate" style="border: solid 1px gray; height: 150px; margin-top: -1px; border-top: 0px; width: 30%; box-sizing: border-box; background-color: #f0f0f0; position: relative;">
						    <span style="position: absolute; bottom: 5px; right: 5px; font-size: 12px; color: #666;">추천검색어</span>
						</div>



					</form>


                        
                </div>
          
        </div>
        
        <script type="text/javascript">
        	//검색창 토글이벤트
        	$("#searchBtn").click(function(){
        		
        		$("#searchBox").toggle();
        		$("#searchBtn2").toggle();
        	});
        	
			
        	//검색어 자동완성 영역
        	$(document).ready(function() {
        	    $("#autoComplate").hide();

        	    $("#searchBox").on("input", function() {
        	        var keyword = $(this).val().trim();
					
        	        //1글자 이상 입력했을때
        	        if (keyword.length > 0) {
        	            $.ajax({
        	                url: "auto.ps",
        	                dataType : "json",
        	                data: {
        	                    keyword: keyword
        	                },
        	                success: function(result) {
        	                    var str = "<span style='font-size: 12px; color: #666;'>추천검색어</span><br>";
        	                    for (var i in result) {
        	                        str += "<span style='margin-right: 5px;'>" + result[i].keyword + "</span>"+"<br>";
        	                    }
        	                    $("#autoComplate").empty().append(str).show();
        	                },

        	                error: function(error) {
        	                    console.log("error");
        	                    alert("실패");
        	                }
        	            });
        	        } else {
        	            $("#autoComplate").hide();
        	        }
        	    });
        	});


        	
        	
        </script>

        </div>
        </div>
        <!--****************************로그인 후 헤더************************************************-->
            <div class="top-area" style="display: none;">
             <div class="inner">
                <div class="aside">
                    <div class="nav">
                        <a href="">Logout</a>
                        <a href="">FAQ</a>
                        <a href="">Notice</a>
                </div>
          
        </div>

        </div>
        </div>
        <div class="gnb-area">
            <div class="gnb-wrap">
                <div class="inner">
                    <!--로고예용-->
                    <h1 class="lelogo">LittleECO</h1>
                    <!--메뉴!!-->
                    <div class="menu">
                    
                        <ul>
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