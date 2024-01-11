<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>마이페이지</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans&family=Noto+Sans+KR&display=swap" rel="stylesheet">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"> -->


  </head>
  <style>
    

    

* {
 

  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: 'Noto Sans KR',  sans-serif !important;
  
}


.mywrap {
  width: 100%;
  min-height: 100vh;
  display: flex;
  /* align-items: center; */
  align-items: flex-start;
  justify-content: center;
  background: rgba(0, 0, 0, 0.1);
  background-color: white;
  position: relative; 
  white-space:nowrap; 
  
  
}

.mypage-info {
  width: 60%;
  min-height: 500px; /* height 대신 min-height 사용 */
  margin-bottom: 50px; /* 원하는 아래쪽 여백에 맞게 조절 */
  background: white;
  border-radius: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  margin-left : 20px;
  box-sizing: border-box;

  
}

.empty-space {
  width: 200px;
  margin-top:20px;
  
}

h2 {
  color: black;
  font-size: 2.5em;
  font-weight: 450;
  margin-bottom: 80px;
  margin-top: 100px;
}

.memberInfo {
  margin-top: 10px;
  width: 80%;
  display: flex;
 
  align-items: center;
}

.memberInfo input {
  width: 40%;
  height: 40px;
  margin-top: 0px;
  padding: 20px 20px;
  border: 1px solid lightgray;
  left : 1;
  right : 10%;
  position : relative;
  outline: none;
}

.memberInfo div {
  width: 80%;
  height: 40px;
  margin-top: 0px;
  padding: 0px 20px;
  
  outline: none;
}
.memberInfo h4 {
  width: 40%;
}

h3 {
  margin-right: 66%;
  margin-bottom: 10px;
}

.submit {
  margin-top: 20px;
  width: 70%;

}

.submit input {
  width: 30%;
  height: 40px;
  border: 1px solid lightgray;
  outline: none;
  color: white;
  background-color: navy;
  font-size: 0.9em;
  letter-spacing: 2px;
  font-weight: 550;
  cursor: pointer;
  
}

.myform-tag{
  width: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
}
hr {
  width: 80%;

  border: 0;
  height: 2px;
  background-color: black;
} 






#deleteBtn{
  background-color: red;
  color: white;
}

.mWrp{
	position: fixed;
	z-index: 200;
	padding-top: 100px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0,0,0,0.3);
	display: none;
}
.mBody{
 	width: 700px;
 	height: 600px;
 	padding: 40px 40px;
 	margin: 0 auto;
 	border: 1px solid #777;
 	background-color: #fff;
 	overflow : auto;
}
.cBtn{
	float: right;
	font-weight: bold;
	color : #777;
	font-size: 25px;
	cursor: pointer;
}
#c2modalBody table{
	
	width: 600px;
	height: 56px;
	border-bottom: 1px solid #343434;
	border-top: 1px solid #343434;
	text-align: center;
}
#c2modalBody th{
	border-bottom: 1px solid #DFDFE4;
}



      /*메뉴 버튼 관련*/
      .custom-tab-link {
    /* 원하는 스타일을 여기에 추가하세요 */
    background-color: #007bff; /* 버튼 배경색 */
    color: #fff; /* 버튼 텍스트 색상 */
    border: 1px solid #007bff; /* 버튼 테두리 스타일 */
    border-radius: 5px; /* 버튼 테두리 둥글기 */
    padding: 8px 16px; /* 내부 여백 */
    cursor: pointer; /* 포인터 커서로 변경 */
  }

  .custom-tab-link:hover {
    /* 마우스 오버 시의 스타일을 여기에 추가하세요 */
    background-color: #0056b3; /* 버튼 배경색 변경 */
    color: #fff; /* 버튼 텍스트 색상 변경 */
  }
  .showPwd{
  	position : relative;
  	right:20;
  	
  }






</style>
<body>
	
	<%@include file = "../common/header.jsp" %>
    
    
    <div class="mywrap">
<div class="empty-space">
	<%@include file = "../common/mypageSideBar.jsp" %>
</div>
<!--         <div class="mysidebar">
          <h3>Hello user</h3>
          <button class="menuBtn" 
          data-bs-target="#mypage-info"
          id="mypage">MY INFO</button>
          <button class="menuBtn"
          data-bs-toggle="tab"
          data-bs-target="#scrapTab"
          id="scrapBtn">MY SCRAP</button>
          <button class="menuBtn" 
          data-bs-target="#ecoTab"
          id="ecoBtn">MY ECO</button>
        </div> -->
        

      <div class="mypage-info" id="mypage-info">
        <h2>MY PAGE</h2>
        
        <h3>나의 회원 정보</h3>
        
       
        <form class="myform-tag" action="update.me" method="post" id="updateForm">
              <hr>
              <br>
              <br>
              <div class="memberInfo">
              <input type="hidden" name="memberId" value="${loginUser.memberId }">
                  <h4>아이디</h4>
                  <div>${loginUser.memberId}</div>
              </div>
              
              <div class="memberInfo">
                <h4>이름</h4>
                <div>${loginUser.memberName}</div>
              </div>
              <div class="memberInfo">
                <h4>닉네임</h4>
                <input type="text" name="nickName" id="nickName" required placeholder="2글자 이상 8글자 이하" maxlength="8" value="${loginUser.nickName}">
              </div>
              <span id="resultNick"></span>
              <div class="memberInfo">
                <h4>생년월일</h4>
                <input type="text" id="birth" name="birth" placeholder="" value="${loginUser.birth}">
              </div>
              <div class="memberInfo">
                <h4>이메일</h4>
                <input type="email" name="email" id="email" value="${loginUser.email}">
              </div>
              <div class="memberInfo">
                <h4>휴대전화번호</h4>
                <input type="text" id="phone" name="phone" required value="${loginUser.phone}" maxlength="11">
              </div>
              <span id="resultPhone"></span>
              <div class="memberInfo">
                <h4>비밀번호 확인</h4>
                <input type="password" name="memberPwd" class="memberPwd" >
              </div>
              <div class="submit" align="center">
                  <input type="submit" class="submitBtn" id="updateBtn" value="회원정보 변경"/>
              </div>

            </form>
            <br><br><br><br><br><br>
            <form class="myform-tag" action="updatePwd.me" method="post">
              <h3>비밀번호 수정</h3>
              <hr>
              <br><br>
              <div class="memberInfo">
                <h4>기존 비밀번호</h4>
                <input type="password" name="memberPwd" class="" id="userPwd">
              </div>
              <div class="memberInfo">
                <h4>새 비밀번호</h4>
                <input type="password" name="newPwd" class="password-input" placeholder="영문,숫자를 포함한 8자 이상의 비밀번호를 입력해주세요" id="newPwd">
              </div>
              
              <div class="memberInfo">
                <h4>새 비밀번호 확인</h4>
                <input type="password" name="checkPwd" class="password-input" id="checkPwd" >
              </div>
              <br>
              <span style="margin-right: 500px;" class="showPwd">
                <input type="checkbox" id="showPwd">  비밀번호 표시
              </span>
              <span id="resultDiv"></span>
              <div class="submit" align="center">
                  <input type="submit" value="비밀번호 수정" class="submitBtn" id="pwdBtn">
              </div>
            </form>
			

        </div>
        
        
        
        <div class="empty-space"> </div>
        <script>

          //비밀번호 변경 관련
          $(function(){

            var regExp = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$/;

            var userPwd = $("#userPwd");
            var newPwd = $("#newPwd");
            var chkPwd = $("#checkPwd");
            

            newPwd.blur(function(){

            if(!regExp.test(newPwd.val())){
              $("#resultDiv").css("color","red");
              $("#resultDiv").text("잘못된 비밀번호 형식입니다");
              newPwd.css("border"," 1px solid red");  
              

            }else if(chkPwd.val()===newPwd.val()){

              $("#resultDiv").css("color","blue");
                $("#resultDiv").text("사용가능한 비밀번호 입니다");  
                newPwd.css("border"," 1px solid lightgray");  
                
            }
            

              
            chkPwd.blur(function(){
              
              if(chkPwd.val()===newPwd.val() && regExp.test(newPwd.val())){
                $("#resultDiv").css("color","blue");
                $("#resultDiv").text("사용가능한 비밀번호 입니다");      
                chkPwd.css("border"," 1px solid lightgray");  
                

              }else{
                $("#resultDiv").css("color","red");
                $("#resultDiv").text("비밀번호가 일치하지 않습니다");
                chkPwd.css("border"," 1px solid red");  
                
                return false;
                
              }
            });
            


          });
        });

                        //폰번호 조건처리
                        $("#phone").on("blur", function() {

                            var phone = $(this).val();
                            var phoneTest = /^010-?([0-9]{4})-?([0-9]{4})$/;

                            if(phoneTest.test(phone)){
                            $("#resultPhone").text("");
                            $("#resultPhone").text("사용가능한 핸드폰 번호입니다").css("color","blue");
                            $("#phone").css("border","1px solid lightgray");
                            }else{
                            $("#phone").val("");
                            $("#resultPhone").text("올바른 핸드폰 번호을 입력하세요").css("color","red");
                            $("#phone").css("border","1px solid red");
                            }

                            });


        //닉네임 관련
        $(function(){

          var regExp = /^[a-zA-Z0-9가-힣]{2,8}$/;

          var nickName = $("#nickName");          
          
            
            nickName.blur(function(){
              
              if(regExp.test(nickName.val())){
                $("#resultNick").css("color","blue");
                $("#resultNick").text("사용가능한 닉네임 입니다");
                $("#nickName").css("border"," 1px solid lightgray");
                
                $("#updateBtn").prop("disabled", false);
                
              }else{

                $("#resultNick").css("color","red");
                $("#resultNick").text("2~8 글자 한글,영어,숫자만 입력해주세요");
                $("#nickName").css("border"," 1px solid red");
                
                $("#updateBtn").prop("disabled", true);
                
                nickName.focus();
                

                  
                }
                
              });
              
            
        });


        $('#showPwd').change(function() {
            
            var pwdInput = $('.password-input');
            
            pwdInput.attr('type', this.checked ? 'text' : 'password');
        });
        //이메일 형식 틀렸을 시 submit 막기

            $(function(){

              $("#updateBtn").click(function(){
                
                var email = $("#email");
                var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
                
                if(regExp.test(email.val()) || email.val()===""){
                  
                  $("#updateForm").submit();
                  
                }else{
                  alert("올바른 이메일 형식이 아닙니다");
                  email.focus();
                  return false;
                }
              });
            });

            
            
            
            $(document).on("click", "#scrapBtn", function() {
                // 해당 HTML 파일을 scrap.jsp로 로드하여 scrapTab 영역에 삽입
                $("#scrapTab").load("scrap.jsp");
            });

        </script>


    </div>

    
</body>
</html>