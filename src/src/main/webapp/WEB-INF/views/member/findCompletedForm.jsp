<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원찾기 성공화면</title>
</head>
<style>

   @import url('https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Diphylleia&family=Nanum+Pen+Script&family=Noto+Sans+Display:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Noto+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Song+Myung&display=swap');

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

a {
  text-decoration: none;
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

.enrollAfter {
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
  margin-bottom: 60px;
}

.info{
  margin-top: 20px;
  width: 80%;
}

.info{
  width: 1000px;
  height: 300px;
  margin-top: 5px;
  padding: 0px 20px;
  border: 1px solid lightgray;
  outline: none;
}
.login {
  margin-top: 20px;
  width: 80%;
}
.loginBtn {
  width: 100%;
  height: 50px;
  border: 0;
  outline: none;
  background-color: navy;
  font-size: 1.2em;
  letter-spacing: 2px;
  font-weight: bold;
  cursor: pointer;
  margin-top: 30px;
}

.loginBtn a{
    color: white;
}

.info1{
    margin-top: 70px;
    font-size: 45px;
    font-weight: 100;
}

.info2{
    margin-top: 50px;
    font-size: 30px;
}

</style>
<body>

	<%@ include file="../common/header.jsp" %>
	
	<div class="wrap">
        <div class="enrollAfter">
            <h2>계정 찾기</h2>
              <div class="info">
                  <div class="info1" align="center">${findMsg}</div>
                  <div class="info2" align="center">${findResult}</div>
              </div>
              <div class="login">
                  <button type="button" class="loginBtn"><a href="loginForm.me">로그인하기</a></button>
                  <button type="button" class="loginBtn"><a href="findMemberPwdForm.me">비밀번호 찾기</a></button>
              </div>
        </div>
    </div>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>