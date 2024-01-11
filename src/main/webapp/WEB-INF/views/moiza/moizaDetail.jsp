<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>LITTLE ECO</title>
    <style>
       @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&family=Noto+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
        /*
        font-family: 'Noto Sans', sans-serif;
        font-family: 'Noto Sans KR', sans-serif;
        */
    

        html, body {
            margin: 0;
            padding: 0;
        }

        .wrap{
            width: 100%;
            height: auto;
            
        }
    
        .moiza_header {
            width: 100%;
            height: 180px;
            position: relative;
        }

        .title_text {
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 42px;
            position: absolute;
            left: 50%;
            top: 40%;
            transform: translate(-50%, -50%);
        }

        .moiza_write {
            height: auto;
            margin-bottom: 50px;
        }

        .moiza_write_table {
            width: 60%;
            border-top: 3px solid black;
            border-collapse: collapse;
            border-bottom: 3px solid black;
        }

        th, td {
            font-family: 'Noto Sans KR', sans-serif;
            border-bottom: 1px solid #D8D8D8;
            height: 40px;
            text-align: center;
            padding: 5px;
        }

        td {
            color: #6E6E6E;
            text-align: left;
        }

        th {
       		text-align: left;
            width: 150px;
        }


        #titleTr input[type="text"] {
            width: 90%;
            
            height: 35px;
            border: 1px solid #BDBDBD;
            /* color: #A4A4A4; */
            color: #585858;
            font-size: 15px;
            font-family: 'Noto Sans KR', sans-serif;
            padding: 5px
        }

        #contentTr textarea {
            border: 1px solid #BDBDBD;
            /* color: #A4A4A4; */
            color: #585858;
            font-size: 15px;
            font-family: 'Noto Sans KR', sans-serif;
            width: 90%;
            resize: none;
            padding: 5px;
        }

        textarea:focus {
            outline: none;
        }

        .btn_area {
            width: 100%;
            height: 100px;
            text-align: center;
            margin-top: 60px;
            margin-bottom: 50px;
        }

        .nBtn {
            width: 180px;
            height: 60px;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 18px;
        }

        .nBtn:hover {
            cursor: pointer;
        }

        #applyBtn{
            background-color: #002C7B;
            color: #E6E6E6;
        }

        #applyBtn:hover{
            color: white;
            background-color: #02215a;
        }


         #mBtn, #uBtn{
            background-color: #002C7B;
            color: #E6E6E6;
        }

        #mBtn #uBtn:hover{
            color: white;
            background-color: #02215a;
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
	    height: 500px;
	    padding: 40px 40px;
	    margin: 0 auto;
	    border: 1px solid #777;
	    background-color: #fff;
	    overflow: auto;
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

	/* 스크랩 버튼 스타일 */
	.submitBtn {
	    background-color: #4CAF50; /* 버튼 배경색 */
	    color: white; /* 글자색 */
	    padding: 10px 20px; /* 내부 여백 */
	    font-size: 16px; /* 글자 크기 */
	    border: none; /* 테두리 없음 */
	    border-radius: 5px; /* 둥근 테두리 */
	    cursor: pointer; /* 포인터 커서 */
	}
	
	/* 마우스 호버 효과 */
	.submitBtn:hover {
	    background-color: #45a049; /* 호버시 배경색 변경 */
	}
	
	
	.container {
            gap: 10px;
            display:flex;
            flex-wrap: wrap;
        }
         .content-card {
         flex: 1 0 calc(50% - 10px); /* 50% - gap */
            background-color: #EDF2F7;
            border-radius: 0.5rem;
            padding: 1rem;
            margin-bottom: 30px;
            margin-left: 55px;
            width: 400px;
        }



    </style>
        
</head>
<body>
	<!-- header -->
    <%@ include file="../common/header.jsp" %>

    <div class="wrap">
        
        <div class="moiza_header" id="moiza_title">
            <p class="title_text">MOIZA</p>
        </div><!--//notice header-->
        
        <div class="moiza_write">
        	<input type="hidden" id="moizaNo" name="moizaNo" value="${m.moizaNo }">
            <table class="moiza_write_table" align="center">
                <tbody>
                    <tr class="tableCol" id="titleTr">
                    	<th>
                    		<label for="mName">프로젝트명</label>
                    			<input type="button" class="submitBtn" id="updateBtn" value="스크랩">
                    	</th>
                        <td colspan="2">
                            <input type="text" name="moizaName" id="mName" value="${m.moizaName}" readonly>
                        </td>
                    </tr>
                    <tr class="tableCol" id="titleTr">
                    	<th>
                    		<label for="mTitle">한줄 소개</label>
                    	</th>
                        <td colspan="2">
                            <input type="text" name="moizaTitle" id="mTitle" value="${m.moizaTitle}" readonly>
                        </td>
                    </tr>
                    <tr class="tableCol" id="titleTr">
                    	<th>
                    		<label for="mMission">미션</label>
                    	</th>
                        <td colspan="2">
                            <input type="text" name="moizaMission" id="mMission" value="${m.moizaMission}" readonly>
                        </td>
                    </tr>
                    <tr class="tableCol" id="titleTr">
                    	<th>
                    		<label>카테고리</label>
                    	</th>
                        <td class="form-group">
                          <input type="checkbox" id="category1" name="categoryNo" value="1" disabled><label for="category1" class="checkboxCss item1">&nbsp 지속 가능 제품 </label>
                          <input type="checkbox" id="category2" name="categoryNo" value="2" disabled><label for="category2" class="checkboxCss item2">&nbsp 사회적 기업 </label>
                          <input type="checkbox" id="category3" name="categoryNo" value="3" disabled><label for="category3" class="checkboxCss item3">&nbsp 제로웨이스트 및 친환경 제품 </label>
                          <input type="checkbox" id="category4" name="categoryNo" value="4" disabled><label for="category4" class="checkboxCss item4">&nbsp 친환경 교육 및 커뮤니티 </label>
                      
                         <br>
                          <input type="checkbox" id="category5" name="categoryNo" value="5" disabled><label for="category5" class="checkboxCss item5">&nbsp 유기농 식품 </label>
                          <input type="checkbox" id="category6" name="categoryNo" value="6" disabled><label for="category6" class="checkboxCss item6">&nbsp 주방 용품 </label>             
                          <input type="checkbox" id="category7" name="categoryNo" value="7" disabled><label for="category7" class="checkboxCss item7">&nbsp 욕실 용품 </label>
                          <input type="checkbox" id="category8" name="categoryNo" value="8" disabled><label for="category8" class="checkboxCss item8">&nbsp 생활 용품 </label>
                          <input type="checkbox" id="category9" name="categoryNo" value="9" disabled><label for="category9" class="checkboxCss item9">&nbsp 패션 </label>
                        </td>
                    </tr>
                    <tr class="tableCol" id="contentTr">
                    	<th>
                    		<label for="mGoal">목표</label>
                    	</th>
                        <td colspan="2">
                            <textarea name="moizaGoal" id="mGoal" cols="30" rows="5" readonly>${m.moizaGoal}</textarea>
                        </td>
                    </tr>
                    <tr class="tableCol" id="contentTr">
                    	<th>
                    		<label for="mInfo">단체 정보</label>
                    	</th>
                        <td colspan="2">
                            <textarea name="moizaInfo" id="mInfo" cols="30" rows="5" readonly>${m.moizaInfo}</textarea>
                        </td>
                    </tr>
                </tbody>

            </table>
        </div><!--//notice write-->
		
		
				    		<!-- 모달 영역 -->
    
	<div class="mWrp" id="withdrawalConfirmationModal">
        	<div class="mBody">
            <span class="cBtn" onclick="hideConfirmationDialog();">&times;</span>
            <h2>스크랩</h2>
            <p>폴더를 선택해주세요</p>
		     <select id="folderSelect">
		        <c:forEach var="f" items="${list}">
		            <option value="${f.folderNo}">${f.folderName}</option>
		        </c:forEach>
		    </select>
			<button type="button" onclick="confirmScrap();">예</button>
            <button type="button" onclick="hideConfirmationDialog();">아니오</button>
        </div>
    </div>
		
		<c:choose>
			<c:when test="${loginUser.memberNo eq mMember.memberNo}">
				<div class="btn_area">
					<button type="button" class="nBtn" id="cBtn" onclick="javascript:history.go(-1);">취소하기</button>
		            <button type="button" class="nBtn" id="uBtn">수정하기</button>
		            <button type="button" class="nBtn" id="mBtn">회원 관리하기</button>
		            <button type="button" class="nBtn" id="dBtn">삭제하기</button>
		         </div>
			</c:when>
			<c:when test="${not empty  loginUser}">
				<div class="btn_area">
					<button type="submit" class="nBtn" id="applyBtn">신청하기</button>
				</div>
			</c:when>
		</c:choose>
		
    </div><!--//wrap-->
	
	<script>
	$(function(){
		
		var mno = $("#moizaNo").val();
		
		$(document).on("click","#uBtn", function(){
			
			location.href = "moiza.up?mno=" + mno;
		});
		
		$(document).on("click","#dBtn", function(){
			
			location.href = "moiza.d?mno=" + mno;
		});
		
		$(document).on("click","#applyBtn", function(){
			
			location.href = "moiza.ap?mno=" + mno;
		});
		
		$(document).on("click","#mBtn", function(){
			
			location.href = "moiza.m?mno=" + mno;
		});
	});
	
		
		 // 이 예제에서는 cList가 이미 서버에서 받아온 데이터로 가정
	    var cList = [
	    	 <c:forEach items="${cList}" var="c"  varStatus="status">
	    		{
	    			categoryNo : '${c.categoryNo}'
	    		}<c:if test="${!status.last}">,</c:if>
	  	  	</c:forEach>
	    
	    ];
	    
	    cList.forEach(function(item) {
	    	
	        $("input[name=categoryNo][value=" + item.categoryNo + "]").prop('checked', true);
	    });
	    
	    
	  //카테고리 3개 제한
	    $("input[type='checkbox']").on("click",function(){
	    var count = $("input:checked[type='checkbox']").length;
	
	    if(count>3){
	      $(this).prop("checked",false);
	      alert("카테고리는 최대 3개까지 선택할 수 있습니다");
	    }
	
	  });
	  
	  
		function confirmScrap() {
	    	
			var moizaNo = ${m.moizaNo};
		    var memberNo = ${loginUser.memberNo};
		    var folderNo = $("#folderSelect").val();
		    var folderName = $("#folderSelect option:selected").text();
		    console.log(moizaNo);
		    console.log(memberNo);
		    console.log(folderNo);
		    console.log(folderName);
		    $.ajax({
		        type: "POST", 
		        url: "scrapMoizaBoard.mp",
		        data: {
		        	moizaNo: moizaNo,
		            memberNo: memberNo,
		            folderNo: folderNo
		        },
		        dataType: "json",
		        success: function (result) {
		            if (result == 1) {
		                alert("추가 성공");
		                $("#withdrawalConfirmationModal").hide();
		            } else {
		                alert("이미 스크랩 된 게시물 입니다");
		            }
		        },
		        error: function () {
		            console.log("실패");
		        }
		    });
		
		}

	// 모달영역
	function showConfirmationDialog() {
	    $.ajax({
	        url: 'selectFolder.mp',
	        type: 'GET',
	        dataType: 'json',
	        success: function(result) {
	            // 셀렉트 박스 초기화
	            $('#folderSelect').empty();
	            
	            // 폴더 목록
	            for (var i = 0; i < result.length; i++) {
	                $('#folderSelect').append('<option value="' + result[i].folderNo + '">' + result[i].folderName + '</option>');
	            }
	            
	            // 폴더추가 모달
	            $("#withdrawalConfirmationModal").show();
	        },
	        error: function(error) {
	            console.error(error);
	        }
	    });
	}

	function hideConfirmationDialog() {
	    // 탈퇴 확인 모달을 감춤
	    $("#withdrawalConfirmationModal").hide();
	}

	$(document).on("click", "#updateBtn", function () {
	    showConfirmationDialog();
	});

	</script>
	
	

   	<!-- footer -->
    <jsp:include page="../common/footer.jsp" />
    

</body>
</html>