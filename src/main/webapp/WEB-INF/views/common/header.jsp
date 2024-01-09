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
        display: flex;
     }

     .gnb-area .inner{
        display: flex;

        align-items: center;

        padding-left: 240px;
        
     }

     .menu{
        display: flex;
        padding-left: 100px;
        margin-left : auto;
      flex-wrap: wrap;
      margin-top:20px;
      
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
    
    .menu::after {
    content: "";
    display: table;
    clear: both;
}
	h1{
		margin-top:50px;
	}
    
    #autoComplate {
    position: absolute;
    z-index: 999; /* 다른 요소보다 위에 나타나도록 설정 */
    border: solid 1px gray;
    height: 150px;
    margin-top: -1px;
    border-top: 0px;
    width: 70%;
    box-sizing: border-box;
    background-color: #f0f0f0;
    display: none; /* 기본적으로 숨김 상태로 설정 */
    /* 추가 스타일은 필요에 따라 조절하세요 */
}


/*----------------랭킹------------------*/
#best {
    position: relative;
    width : 20%;
}

#bestbg{

    width: 400px;
    margin-left: 80%;
    margin-right : auto;
    margin-top: 20px;
    position: relative;
}	

/* 초기에는 첫 번째 요소만 보이도록 설정 */
#scroll li:not(:first-child) {
    display: none;
}

/* 마우스가 #best에 들어오면 나머지 요소들이 나타남 */
#best:hover #scroll li {
    display: list-item;
    background-color: #fff; /* Set background color to white */
    box-shadow: 3px 3px; /* 그림자 설정 */
}

#scroll {
    list-style: decimal;
    counter-reset: item;
    margin: 0; /* margin 제거 */
    padding: 0; /* padding 제거 */
    
    
}

/* /* 각 인기 검색어 앞에 숫자를 추가 */
#scroll li {
    counter-increment: item;
     margin-bottom: -50px;
     
} */

/* 인기 검색어의 숫자를 가상 요소로 표시 */
#scroll li:before {
    content: counter(item) ". ";
    margin-right: 5px;
    font-weight: bold;
}


/* #bestbg p{
   margin-left: 40px;   
   font-size: 26px;
   font-weight: 500;
   color: #4c4c4c;
} */

#bestbg li {
    margin-left: 30px;
    padding-bottom: 10px;
    font-size: 16px;
    color: #595959;
    position: relative; /* position 변경 */
}

#scroll li a {
    text-decoration: none; /* 밑줄 제거 */
    color: inherit; /* 부모 요소의 색상 상속 */
}
    
    
    #scroll {
  display: grid;
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
                    <div class="nav" >
            <c:choose>
            	<c:when test="${empty loginUser }">
                        <a href="enrollForm.me">Join</a>
                        <a href="loginForm.me">Login</a>
                        <a href="faqList.bo">FAQ</a>
                        <a href="scrap.mp">Notice</a>
       			 </c:when>
       			 	<c:otherwise>
                        <a href="logout.me">Logout</a>
                        <a href="faqList.bo">FAQ</a>
                        <a href="scrap.mp">Notice</a>
                        <a href="mypage.me">Mypage</a>
		        	</c:otherwise>
		       </c:choose>
					 <button id="searchBtn"><img src="resources/img/search.png" width="20" height="20"></button>
					<form action="insert.ps" class="insertForm" method="post" style="position: relative; display: inline-block;">
					    <input type="text" id="searchBox" name="keyword" style="display: none;" style="width : 30%;">
					    <button type="submit" id="searchBtn2" style="display: none; background-color: transparent;">검색</button>
					    <!-- 자동완성 띄워줄 영역 -->
						<div id="autoComplate">
						</div>
					</form>
                </div>
        </div>
        </div>
        </div>
        <!--****************************로그인 후 헤더************************************************-->
<%--             <div class="top-area">
             <div class="inner">
                <div class="aside">
                    <div class="nav">
        		<c:otherwise>
                        <a href="logout.me">Logout</a>
                        <a href="">FAQ</a>
                        <a href="scrap.mp">Notice</a>
                        <a href="mypage.me">Mypage</a>
		        </c:otherwise>
                </div>
          
        </div>

        </div>
        </div> --%>
          
        <div class="gnb-area">
            <div class="gnb-wrap">
                <div class="inner">
                    <!--로고예용-->
                    <h1 class="lelogo">LittleECO</h1>
                    <!--메뉴!!-->
                    <div class="menu">
                    
                        <ul>
                      <li class="menus"><a href="about.ab">About</a></li>
                      <li class="menus"><a href="searchEco.bo">searchEco</a></li>
                      <li class="menus"><a href="rblist.hrb">How2Recycle</a></li>
                      <li class="menus"><a href="">moiza</a></li>
                        </ul>
                        

                    </div>
                          <div id="best">
                           <div id="bestbg">
                              <ol id="scroll">
	
								<!-- 인기검색어 출력 할 영역 -->
								
                              </ol>
                           </div>
                        </div>
                </div>
            </div>
        </div>
        
      <script type="text/javascript">
	      
      //검색어 입력값이 null,공백일 때
      	$("#searchBtn2").click(function(event) {
	          var keyword = $("#searchBox").val().trim();
	          if (keyword.length === 0) {
	              event.preventDefault();
	          }
	      });
      
      
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
        	                        str += "<span style='margin-right: 5px; '>" + result[i].keyword + "</span>"+"<br>";
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
        	
        	
        	
        	
        	// 인기검색어 영역 
			$(document).ready(function () {
			    var intervalId;
				
			    function showNextKeyword(keywords, index) {
			        if (index < keywords.length) {
			            var keyword = keywords[index].keyword;
			            var rank = index + 1;
			            var listItem = $("<li>").append("<a href='#' class='popular-keyword'>"+ "<strong>"+ rank +"</strong>" +". " + keyword + "</a>");

			            // 클릭 이벤트를 추가하여 검색어를 클릭할 때 동작하도록 함
			            listItem.find(".popular-keyword").on("click", function (e) {
			                e.preventDefault(); // 기본 동작 막기

			                // 선택한 검색어를 가져와서 searchBox에 넣기
			                var selectedKeyword = $(this).text().split('. ')[1];
			                $("#searchBox").val(selectedKeyword);

			                // searchBtn2를 클릭하여 검색 수행
			                $("#searchBtn2").click();
			            });

			            $("#scroll").html($("<ol>").css("list-style-type", "none").append(listItem)); // 번호를 표시하지 않음

			            // 다음 검색어를 2초 뒤에 표시
			            intervalId = setTimeout(function () {
			                showNextKeyword(keywords, (index + 1) % keywords.length);
			            }, 2000);
			        }
			    }

			    // 초기에 첫 번째 인기 검색어를 보이도록 설정
			    $.ajax({
			        url: "select.ps",
			        dataType: "json",
			        success: function (result) {
			            // 일반적인 경우에는 순위별로 2초마다 한 개씩 보여줌
			            showNextKeyword(result, 0);

			            // 호버 시에 전체 목록을 보여주는 이벤트
			            $("#best").mouseenter(function () {
			                clearTimeout(intervalId); // 이전에 설정된 타이머 제거
			                showAllKeywords(result);
			            });

			            // 호버에서 벗어나면 다시 2초마다 한 개씩 보여줌
			            $("#best").mouseleave(function () {
			                showNextKeyword(result, 1);
			            });
			        },
			        error: function () {
			            console.log("통신 오류");
			        }
			    });

			    // 전체 목록을 보여주는 함수
			    function showAllKeywords(keywords) {
			        var list = $("<ol>").css("list-style-type", "none");
			        for (var i in keywords) {
			            var rank = parseInt(i) + 1;
			            var listItem = $("<li>").append("<a href='#' class='popular-keyword'>" + "<strong>"+ rank +"</strong>" + ". " + keywords[i].keyword + "</a>");

			            // 클릭 이벤트를 추가하여 검색어를 클릭할 때 동작하도록 함
			            listItem.find(".popular-keyword").on("click", function (e) {
			                e.preventDefault(); // 기본 동작 막기

			                // 선택한 검색어를 가져와서 searchBox에 넣기
			                var selectedKeyword = $(this).text().split('. ')[1];
			                $("#searchBox").val(selectedKeyword);

			                // searchBtn2를 클릭하여 검색 수행
			                $("#searchBtn2").click();
			            });

			            list.append(listItem);
			        }

			        $("#scroll").html(list);
			    }
			});

			</script>
        	

        	
    </header>
        </body>
</html>