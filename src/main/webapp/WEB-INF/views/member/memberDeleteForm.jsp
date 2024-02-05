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
      width: 30%;
      height: 40px;
      margin-top: 0px;
      padding: 0px 20px;
      border: 1px solid lightgray;
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
      background-color: rgb(197, 39, 39);
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
    
    
    /* 모달영역 */
    .mWrp{
      position: fixed;
      z-index: 200;
      padding-top: 250px;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgba(0,0,0,0.3);
      display: none;
    }
	.mBody {
	  width: 400px;
	  height: 300px;
	    padding: 40px 40px;
	    margin: 0 auto;
	    border: 1px solid #777;
	    background-color: #fff;
	    overflow: auto;
	    text-align: center;
	}
.mBody button {
    margin: 20px; /* 나머지 버튼들 간격 조정 */
    font-size: 20px;
    border: 0px;
    background: navy;
    color: white;
}
.mBody input{
	margin : 20px;
	width : 80%;
	height : 40px;
	text-align: center;
}
    .cBtn{
      float: right;
      font-weight: bold;
      color : #777;
      font-size: 25px;
      cursor: pointer;
    }
	.mBody button {
	    margin: 30px;
	    font-size: 20px;
	    border: 0px;
	    background: navy;
	    color: white;
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
    
    .mysidebar, .empty-space {
      min-height: 150vh;
    }
    
        .memberInfo label {
        margin-right: 10px; /* 라디오 버튼과 라벨 사이의 여백 조정 */
    }

    .memberInfo input[type="radio"] {
        width: 16px; /* 라디오 버튼의 크기 조정 */
        height: 16px;
        margin-right: 20px; /* 라디오 버튼 간의 여백 조정 */
    }
    
    
    
    
    
    </style>
<body>
	
	<%@include file = "../common/header.jsp" %>
  
    <div class="mywrap">
      <div class="empty-space">
        <%@include file = "../common/mypageSideBar.jsp" %>
      </div>

        

      <div class="mypage-info" id="mypage-info">
        <h2>MY PAGE</h2>
        
        <h3>회원 탈퇴</h3>
        
       
        <form class="myform-tag" action="deleteMember.me" method="post">
              <hr>
              <br>
              <br>
              <div class="memberInfo">
                  
              <div>사용하고 계신 아이디(<strong>${loginUser.memberId}</strong>)는 탈퇴할 경우 재사용 및 복구가 불가능합니다. <br>
                    탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</div>
              </div>
              		<br><br><br>
              
			<div class="memberInfo">
			    <h4>탈퇴 사유</h4>
			    
			    <label for="withdrawalReason1">이용빈도 낮음</label>
			    <input type="radio" name="withdrawalReason" value="이용빈도 낮음" id="withdrawalReason1">
			    
			    <label for="withdrawalReason2">재가입</label>
			    <input type="radio" name="withdrawalReason" value="재가입" id="withdrawalReason2">
			    
			    <label for="withdrawalReason3">컨텐츠 부족</label>
			    <input type="radio" name="withdrawalReason" value="컨텐츠 부족" id="withdrawalReason3">
			    
			    <label for="withdrawalReason4">기타</label>
			    <input type="radio" name="withdrawalReason" value="기타" id="withdrawalReason4">
			</div>
				<br>
			<div id="otherReasonInput" style="display: none;">
			    <textarea name="withdrawalReason" id="otherReason" maxlength="500" style="width: 600px; height:400px;"></textarea>
				<div id="count" style="align:right;"></div>
			</div>


              <div class="memberInfo">
              
                <h4>비밀번호 확인</h4>
                <input type="password" name="userPwd" class="memberPwd" style="width:40%; position : relative; right : 10%;" >
              </div>
                <div class="submit" align="center">
                    <input type="button" class="submitBtn" id="updateBtn" value="회원탈퇴" onclick="showConfirmationDialog();" />
                </div>

          <div class="mWrp" id="withdrawalConfirmationModal">
        	<div class="mBody">
            <span class="cBtn" onclick="hideConfirmationDialog();">&times;</span>
            <h2>탈퇴 확인</h2>
            <p>정말로 탈퇴하시겠습니까?</p>
            <button type="submit" onclick="confirmWithdrawal();">예</button>
            <button type="button" onclick="hideConfirmationDialog();">아니오</button>
        </div>
    </div>
            </form>
            <br><br><br><br><br><br>


			

        </div>
        
        
        <div class="empty-space">dd</div>
        
        
      </div>
      
      
      
      <script>
    $(document).ready(function () {
        // 기타 버튼 클릭 시
        $("input[name='withdrawalReason']").change(function () {
            var otherRadio = $("#withdrawalReason4");
            var otherInput = $("#otherReasonInput");

            // 기타 버튼이 선택됐을 때
            if (otherRadio.is(":checked")) {
                otherInput.show(); 
            } else {
                otherInput.hide(); 
            }
        });
    });
    
    //최대글자수 표시
    $(document).ready(function() {
        $("#otherReason").on("input", function() {
            var count = $(this).val().length;
            $("#count").text(count + '/500');
        });
    });
    
    
    
    $(document).ready(function () {
        $("#updateBtn").click(function () {
            showConfirmationDialog();
        });

        $("#withdrawalForm").submit(function (e) {
            // 폼이 제출되기 전에 여기서 사용자의 선택에 따라 처리
            if (!confirmWithdrawal()) {
                e.preventDefault(); // 폼 제출을 취소
            }
        });
    });
	
    
    //모달영역
    function showConfirmationDialog() {
        // 탈퇴 확인 모달을 보이게 함
        $("#withdrawalConfirmationModal").show();
    }

    function hideConfirmationDialog() {
        // 탈퇴 확인 모달을 감춤
        $("#withdrawalConfirmationModal").hide();
    }

    function confirmWithdrawal() {
        // "예"를 선택하면 폼을 제출하고, "아니오"를 선택하면 폼 제출을 취소
        return confirm("정말로 탈퇴하시겠습니까? 이 작업은 취소할 수 없습니다.");
    }

</script>



    
</body>
</html>