<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>LITTLE ECO</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
</head>
<style>

  @import url('https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Diphylleia&family=Nanum+Pen+Script&family=Noto+Sans+Display:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Noto+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Song+Myung&display=swap');

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.wrap {
  width: 100%;
  height: 1500px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: rgba(0, 0, 0, 0.1);
  background-color: white;
}

.find{
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
  font-weight: 400;
}

.memberInfo {
  margin-top: 20px;
  width: 80%;
}

.memberInfo input{
  width: 100%;
  height: 50px;
  margin-top: 13px;
  padding: 0px 20px;
  border: 1px solid lightgray;
  outline: none;
}

.submit {
  margin-top: 20px;
  width: 80%;
}

.submit button {
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

.form-tag{
  width: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.login-bottom{
  margin-top: 50px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.centerLine{
  margin-top: 30px;
}

.span1{
  font-size: 10px;
}

</style>
<body>
	<%@ include file="../common/header.jsp" %>
	
    <div class="wrap">
        <div class="find">
            <h2>비밀번호 재설정</h2>
           
	        	<form class="form-tag" action="resetMemberPwd.me" method="post">     
	              <div class="memberInfo">             
	                  <h4>비밀번호 변경</h4>
	                  <input type="text" name="memberId" placeholder="아이디" required>
	                  <input type="password" name="newPwd" id="newPwd" class="password" placeholder="새 비밀번호" maxlength="12" required>
	                  <span id="chkNewPwdMsg1"></span>
	                  <input type="password" name="checkNewPwd" id="checkNewPwd" class="password" placeholder="새 비밀번호 확인" required>
	                  <span id="chkNewPwdMsg2"></span>
	              </div>      
	              <div class="submit">
	                  <button type="submit" id="chageBtn" class="submitBtn">비밀번호 변경</button>
	              </div>
	            </form>
	            
	            <script>

                $("#newPwd").on("change", function() {

                      var newPwd = $(this).val();
                      var pwdTest = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$/;
                          
                      if (pwdTest.test(newPwd)) {
                          $("#chkNewPwdMsg1").text("사용가능한 비밀번호입니다").css("color","blue");
                          $("#newPwd").css("border","1px solid lightgray");
                      } else {
                          $("#newPwd").val("");
                          $("#chkNewPwdMsg1").text("사용할 수 없는 비밀번호입니다").css("color","red");
                          $("#newPwd").css("border","1px solid red");
                      }
                 });

                $("#checkNewPwd").on("change", function() {

                      var newPwd = $("#newPwd").val();
                      var checkNewPwd = $(this).val();

                      if (newPwd === checkNewPwd) {
                           $("#chkNewPwdMsg2").text("비밀번호가 일치합니다").css("color","blue");
                           $("#checkNewPwd").css("border","1px solid lightgray");
                      } else {
                          $("#checkNewPwd").val("");
                          $("#chkNewPwdMsg2").text("비밀번호가 일치하지않습니다").css("color","red");
                          $("#checkNewPwd").css("border","1px solid red");
					  }
                });
	            
	            </script>
        	
        </div>
    </div>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>