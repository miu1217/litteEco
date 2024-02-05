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

.findAfter{
  width: 100%;
}
</style>
<body>
	<%@ include file="../common/header.jsp" %>
	
    <div class="wrap">
        <div class="find">
            <h2>계정 찾기</h2>
            <form class="form-tag" action="findMemberId.me" method="post">
              <div class="memberInfo">
                  <h4>아이디 찾기</h4>
                  <input type="text" name="memberName" id="memberName" class="memberName" placeholder="이름" maxlength="12" required>
                  <input type="email" name="email" id="email" class="email" placeholder="가입한 이메일 주소" required>
              </div>      
              <div class="submit">
                  <button type="submit" id="findBtn" class="submitBtn">아이디 찾기</button>
              </div>
            </form>
            
            <hr class="centerLine" style="border: 1px solid lightgray; width: 80%;">
            
            <form class="form-tag" action="findMemberPwd.me" method="post">
              <div class="memberInfo">
                  <h4>비밀번호 찾기</h4>
                  <input type="text" name="memberId" id="memberId" class="memberId" placeholder="아이디" maxlength="12" required>
                  <input type="text" name="memberName2" id="memberName2" class="memberName2" placeholder="이름" required>
                  <input type="email" name="email2" id="email2" class="email2" placeholder="가입한 이메일 주소" required>
              </div>      
              <div class="submit">
                  <button type="submit" id="findPwdBtn" class="submitBtn">비밀번호 찾기</button>
              </div>
            </form>
 
        </div>
    </div>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>