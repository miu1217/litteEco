<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>회원가입 화면</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  
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
  color: black;
}

li {
  list-style: none;
}

.wrap {
  width: 100%;
  height : 1500px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: rgba(0, 0, 0, 0.1);
  background-color: white;
}

.login {
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
}

.memberInfo {
  margin-top: 20px;
  width: 80%;
}

.memberInfo input , .memberCategory input {
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
  background-color: #878795;
  font-size: 1.2em;
  letter-spacing: 2px;
  font-weight: bold;
  cursor: pointer;
}

.submit :hover{
    background-color: navy;
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

/* 라디오 스타일 */
.gender {
    display: flex;
}
.gender input[type=radio]{
    display: none;
}

.gender input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 35px;
    width: 100%;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
    background-color: #fff;
    color: #333;
}

.gender input[type=radio]:checked+label{
    background-color: navy;
    color: #fff;
}
.gender p{
  margin-top : 5.005px;
}

/* 체크박스 스타일 */

.category input[type=checkbox]{
  display: none;
}
.category input[type=checkbox]+label{
  display: inline-block;
    cursor: pointer;
    height: 45px;
    width: 100%;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
    background-color: #fff;
    color: #333;
}
.category input[type=checkbox]:checked+label{
    background-color: navy;
    color: #fff;
}
.checkboxCss {
  margin-top: 10px;
  border-radius: 20px;
}
.checkboxCss div{
  font-size: 12px;
  margin-top: 10.005px;
}

.grid-div{
  display: grid;
  grid-template-columns: repeat(4,1fr);
  grid-template-rows: auto;
  grid-gap: 5px;
}

.item3{
  grid-column : 3/5;
}
.item4{
  grid-column: 1/3;
}

.grid-div2{
  display: grid;
  grid-template-columns: repeat(3,1fr);
  grid-template-rows: auto;
  grid-gap: 5px;
}

</style>
<body>

	<%@ include file="../common/header.jsp" %>
	
    <div class="wrap">
        <div class="login">
            <h2>회원가입</h2>
            <form class="form-tag" action="insert.me" method="post">
              <div class="memberInfo">
                  <h4>아이디</h4>
                  <input type="text" name="memberId" id="memberId" class="memberId" placeholder="영문,숫자 5자이상 12자이하의 아이디를 입력해주세요" maxlength="12" required>
                  <span id="checkIdMsg"></span>
              </div>
              <div class="memberInfo">
                  <h4>비밀번호</h4>
                  <input type="password" name="memberPwd" id="memberPwd" class="memberPwd" placeholder="영문,숫자,특수문자를 포함한 8자 이상의 비밀번호를 입력해주세요" required>
                  <span id="checkPwdMsg"></span>
              </div>
              <div class="memberInfo">
                <h4>비밀번호 확인</h4>
                <input type="password" name="memberPwd2" id="memberPwd2" class="memberPwd" placeholder="영문,숫자,특수문자를 포함한 8자 이상의 비밀번호를 입력해주세요" required>
                <span id="checkPwdMsg2"></span>
              </div>
              <div class="memberInfo">
                <h4>이름</h4>
                <input type="text" name="memberName" id="memberName" class="memberName" required>
                <span id="checkNameMsg"></span>
              </div>
              <div class="memberInfo">
                <h4>닉네임</h4>
                <input type="text" name="nickName" id="nickName" class="nickName" required>
                <span id="checkNickNameMsg"></span>
              </div>
              <div class="memberInfo">
                <h4>생년월일</h4>
                <input type="text" name="birth" class="" id="birth" placeholder="생년월일 8자리" maxlength="8">
                <span id="checkBirthMsg"></span>
              </div>
              <div class="memberInfo">
                <div class="gender">
                  <input type="radio" id="f" name="gender" value="F"><label for="f"><p>여자</p></label>
                  <input type="radio" id="m" name="gender" value="M"><label for="m"><p>남자</p></label>
                </div>
              </div>
              <div class="memberInfo">
                <h4>이메일</h4>
                <input type="email" id="email" name="email" class="">
                <span id="checkEmailMsg"></span>
              </div>
              <div class="memberInfo">
                <h4>휴대전화번호</h4>
                <input type="text" id="phoneNumber" name="phone" class="" placeholder="-  제외" maxlength="11" required>
                <span id="checkPhoneMsg"></span>
              </div>
              <div class="memberInfo">
                <div class="category">
                  <h4>관심태그(3개)</h4>
                  <h6>(선택사항)</h6>
                  <div class="grid-div">
                    <input type="checkbox" id="category1" name="categoryNo" value="1"><label for="category1" class="checkboxCss item1"><div>#지속 가능 제품</div></label>
                    <input type="checkbox" id="category2" name="categoryNo" value="2"><label for="category2" class="checkboxCss item2"><div>#사회적 기업</div></label>
                    <input type="checkbox" id="category3" name="categoryNo" value="3"><label for="category3" class="checkboxCss item3"><div>#제로웨이스트 및 친환경 제품</div></label>
                    <input type="checkbox" id="category4" name="categoryNo" value="4"><label for="category4" class="checkboxCss item4"><div>#친환경 교육 및 커뮤니티</div></label>
                    <input type="checkbox" id="category5" name="categoryNo" value="5"><label for="category5" class="checkboxCss item5"><div>#유기농 식품</div></label>
                    <input type="checkbox" id="category6" name="categoryNo" value="6"><label for="category6" class="checkboxCss item6"><div>#주방 용품</div></label>             
                  </div>
                  <div class="grid-div2">
                  	<input type="checkbox" id="category7" name="categoryNo" value="7"><label for="category7" class="checkboxCss item7"><div>#욕실 용품</div></label>
                    <input type="checkbox" id="category8" name="categoryNo" value="8"><label for="category8" class="checkboxCss item8"><div>#생활 용품</div></label>
                    <input type="checkbox" id="category9" name="categoryNo" value="9"><label for="category9" class="checkboxCss item9"><div>#패션</div></label>
                  </div>
                </div>
              </div>
              
              <div class="submit">
                  <button type="submit" id="enrollBtn" class="submitBtn">가입하기</button>
              </div>

            </form>
            <!--***************************** 회원가입 유효성검사 스크립트 *********************************-->
            <script>
              
                // 아이디 조건처리
                /* $("#memberId").on("blur", function() {

                      var memberId = $(this).val();
                      var idTest = /[a-zA-Z0-9]{5,12}$/g;
                          
                      if (idTest.test(memberId)) {
                          $("#checkIdMsg").text("사용가능한 아이디입니다").css("color","blue");
                          $("#memberId").css("border","1px solid lightgray");
                          $("#enrollBtn").attr("disabled",false);
                      } else {
                          $("#memberId").val("");
                          $("#checkIdMsg").text("사용할 수 없는 아이디입니다").css("color","red");
                          $("#memberId").css("border","1px solid red");
                          $("#enrollBtn").attr("disabled",true);
                      }
                });

                //비밀번호 조건처리(8자리 이상 영문 대소문자, 숫자, 특수문자가 각각 1개 이상)
                $("#memberPwd").on("blur", function() {

                      var memberPwd = $(this).val();
                      var pwdTest = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$/;
                          
                      if (pwdTest.test(memberPwd)) {
                          $("#checkPwdMsg").text("사용가능한 비밀번호입니다").css("color","blue");
                          $("#memberPwd").css("border","1px solid lightgray");
                          $("#enrollBtn").attr("disabled",false);
                      } else {
                          $("#memberPwd").val("");
                          $("#checkPwdMsg").text("사용할 수 없는 비밀번호입니다").css("color","red");
                          $("#memberPwd").css("border","1px solid red");
                          $("#enrollBtn").attr("disabled",true);
                      }
                 });

                 //비밀번호 재확인처리
                $("#memberPwd2").on("blur", function() {

                      var memberPwd = $("#memberPwd").val();
                      var memberPwd2 = $(this).val();

                      if (memberPwd === memberPwd2) {
                           $("#checkPwdMsg2").text("비밀번호가 일치합니다").css("color","blue");
                           $("#memberPwd2").css("border","1px solid lightgray");
                           $("#enrollBtn").attr("disabled",false);
                      } else {
                          $("#memberPwd2").val("");
                          $("#checkPwdMsg2").text("비밀번호가 일치하지않습니다").css("color","red");
                          $("#memberPwd2").css("border","1px solid red");
                          $("#enrollBtn").attr("disabled",true);
                      }

                });

                //이름 조건처리
                $("#memberName").on("blur", function() {

                  var memeberName = $(this).val();
                  var memberNameTest = /^[가-힣]+$/;

                  if (memberNameTest.test(memeberName)) {
                      $("#checkNameMsg").text("");
                      $("#memberName").css("border","1px solid lightgray");
                      $("#enrollBtn").attr("disabled",false);
                  } else {
                      $("#memberName").val("");
                      $("#checkNameMsg").text("한글만 입력 가능합니다").css("color","red");
                      $("#memberName").css("border","1px solid red");
                      $("#enrollBtn").attr("disabled",true);
                  }
                  });

                //닉네임 조건처리
                $("#nickName").on("blur", function() {

                    var nickName = $(this).val();
                    var nickNameTest = /^([a-zA-Z0-9가-힣]).{1,9}$/;

                    if (nickNameTest.test(nickName)) {
                        $("#checkNickNameMsg").text("사용가능한 닉네임입니다").css("color","blue");
                        $("#nickName").css("border","1px solid lightgray");
                        $("#enrollBtn").attr("disabled",false);
                    } else {
                        $("#nickName").val("");
                        $("#checkNickNameMsg").text("사용할 수 없는 닉네임입니다").css("color","red");
                        $("#nickName").css("border","1px solid red");
                        $("#enrollBtn").attr("disabled",true);
                    }
                    });

                //생년월일 8자리확인처리
                $("#birth").on("blur", function() {

                    var birth = $(this).val();
                    var birthTest = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;

                    if(birthTest.test(birth)){
                      $("#checkBirthMsg").text("");
                      $("#birth").css("border","1px solid lightgray");
                      $("#enrollBtn").attr("disabled",false);
                    }else{
                      $("#birth").val("");
                      $("#checkBirthMsg").text("올바른 생년월일을 입력하세요").css("color","red");
                      $("#birth").css("border","1px solid red");
                      $("#enrollBtn").attr("disabled",true);
                    }

                    });

                //이메일 @여부처리
                $("#email").on("blur", function() {

                  var email = $(this).val();
                  var emailTest =  /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 

                  if(emailTest.test(email)){
                    $("#checkEmailMsg").text("");
                    $("#email").css("border","1px solid lightgray");
                    $("#enrollBtn").attr("disabled",false);
                  }else{
                    $("#email").val("");
                    $("#checkEmailMsg").text("올바른 이메일 양식을 입력하세요").css("color","red");
                    $("#email").css("border","1px solid red");
                    $("#enrollBtn").attr("disabled",true);
                  }

                  });

                //휴대전화 번호
                $("#phoneNumber").on("blur", function() {

                  var phoneNumber = $(this).val();
                  var phoneNumberTest = /^010-?([0-9]{4})-?([0-9]{4})$/;

                  if(phoneNumberTest.test(phoneNumber)){
                    $("#checkPhoneMsg").text("");
                    $("#phoneNumber").css("border","1px solid lightgray");
                    $("#enrollBtn").attr("disabled",false);
                  }else{
                    $("#phoneNumber").val("");
                    $("#checkPhoneMsg").text("올바른 핸드폰 번호을 입력하세요").css("color","red");
                    $("#phoneNumber").css("border","1px solid red");
                    $("#enrollBtn").attr("disabled",true);
                  }

                });

                //카테고리 3개 제한
                $("input[type='checkbox']").on("click",function(){
                var count = $("input:checked[type='checkbox']").length;

                if(count>3){
                  $(this).prop("checked",false);
                  alert("카테고리는 최대 3개까지 선택할 수 있습니다");
                }

              }); */
                
               
            </script>
            <!-- *****************************카테고리(체크박스) 선택한 값 여러개 가져오기***************************** -->
            <script>

            	$("#enrollBtn").click(function(){//
            		
	            		var cArr = []; //카테고리배열 초기화
	            		
	            		$("input[name='categoryNo']:checked").each(function(i){
	            			
	            			cArr.push($(this).val()); //체크된 값들 배열에 넣기
	            			
	            		});
	            		
	            			console.log(cArr);
	            		
	            		  $.ajax({
	            			url : "insert.me"
	            			,type : "post"
	            			,data :{
	            				categoryNo : cArr //키값 : 밸류 categoryNo -> VO 필드명으로 맞춰줘서 같이 가져오기
	            			} 			
	            		}); 
  
            	});//
            
            </script>
                      
        </div>
    </div>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>