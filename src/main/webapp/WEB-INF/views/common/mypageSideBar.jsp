<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
.mysidebar {
    left: 30px;
    top: 50px;
    width: 20%;
    height: 100%;
    background-color: white;
    padding-top: 120px;
    padding-left: 30px;
    margin-top: 100px;
    display: inline-block;
    min-height: 150vh;
    position: relative;
    display: block;
    text-align: center;
    z-index :100;
}

.mysidebar .menuBtn {
    text-decoration: none;
    color: black;
    display: block;
    padding: 10px;
    white-space: normal;
    border-radius: 10px;
    margin-bottom: 10px;
    background-color: rgb(211, 228, 241);
    padding: 1;
    width: 150px;
    margin-left: 70px;
}


.mysidebar h3 {
  margin-left: 70px; /* h3 태그에 좌측 여백을 줘서 버튼과 같은 열에 위치하도록 함 */
}
.mysidebar button:hover {
  background-color: navy;
  color: white;
}


	</style>


</head>
<body>
	
	<div class="sidebar">
	     <div class="mysidebar">
	  <a href="mypage.me" class="menuBtn">MY INFO</a>
	  <a href="scrap.mp" class="menuBtn">MY SCRAP</a>
	  <a href="moiza.mp" class="menuBtn">MY ECO</a>
	  <a href="delete.me" class="menuBtn">회원 탈퇴</a>
        </div>
	</div>
	



</body>
</html>