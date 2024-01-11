<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&family=Noto+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
  
    <title>Document</title>
    <style>
        html,body{
            margin: 0;
            padding: 0;
        }
        .wrap{
            width: 100%;
            height: auto;
            font-family: 'Noto Sans KR',sans-serif;
        }
        .hrb_header{
            height: 180px;
            position: relative;
        }
                      #tit{
            font-size: 40px;
            font-weight: 400;
            display: flex;
            justify-content: center;
            margin-top: 60px;
            margin-bottom: 60px;
            
        }
        .hrb_detail{
            height: auto;
        }
        .hrb_det_table{
            width: 60%;
            border-top: 3px solid black;
            border-collapse: collapse;
            border-bottom: 3px solid black;
        }


       .hrb_det_table td{
            color: #000;
            text-align: left;
               border-bottom: 1px solid #d8d8d8;
            height: 42px;
            padding: 5px;
            font-weight: 500;
        }
        .hrb_det_table th{
            width: 50px;
            color: #8c8c8c;
            font-weight: 400;
               border-bottom: 1px solid #d8d8d8;
            height: 42px;
            text-align: left;
            padding: 5px;
        }

        #contents{
            height: auto;
        }
        .ad_btn{
            text-align: center;
            padding-top: 60px;
            border-radius: 0;
            padding-bottom: 80px;
            
        }
        
        
        .hrb_btn:hover {
            cursor: pointer;
        }
        
        .hrb_btn{
            width: 180px;
            height: 60px;
            font-size: 16px;
            font-weight: 600;
        }
        #hrup{
            background-color: #002c7b;
            color:#e6e6e6;
            border-style: none;
        }
        #hrde{
            background-color: #d00000;
            color: #fce6e6;
            border-style: none;
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
    </style>
</head>
<body>
  <%@ include file="../common/header.jsp" %>
    <div id="wrap">
      <div id="tit">How2Recycle</div>

        <div class="hrb_detail">
            <table class="hrb_det_table" align="center">
                <tbody>
                    <tr>
                        <th>제목</th>
                        <td colspan="5">  ${rb.recycleBoardTitle }</td>
                    </tr>
                    <tr>
                        <th >작성자</th>
                        <td>${rb.memberNo }</td>
                        <th>작성일</th>
                        <td>${rb.createDate }</td>
                        <th>조회수</th>
                        <td>${rb.count }</td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td colspan="5">
                        
                        <c:if test="${empty map.fileList }">
                        	<p align="center">첨부파일이 없습니다.</p>
                        </c:if>
                        <c:forEach items="${map.fileList }" var="files">
                        
                        	 <a href="${at.boChangeName }" download="${at.boOriginName }">  ${at.boOriginName } </a>
                        </c:forEach>
                        	
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" width="100%" id="contents">
                        	${rb.recycleBoardContent }
                        </td>
                    </tr>

                </tbody>

            </table>
        </div>
			<div class="scrap-area">
				                <div class="submit" align="center">
                    <input type="button" class="submitBtn" id="updateBtn" value="스크랩" onclick="showConfirmationDialog();" />
                </div>
			</div>
			
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
			
        <div class="ad_btn">
            <button class="hrb_btn" id="hrl" >목록가기</button>
            <button class="hrb_btn" id="hrup" >수정하기</button>
            <button class="hrb_btn" id="hrde" >삭제하기</button>

        </div>


    </div>
    
    
    <script type="text/javascript">
    //모달영역
//스크랩 영역
	function confirmScrap() {
	    var boardNo = ${rb.boardNo};
	    var memberNo = ${loginUser.memberNo};
	    var folderNo = $("#folderSelect").val();
	    var folderName = $("#folderSelect option:selected").text();
	    console.log(boardNo);
	    console.log(memberNo);
	    console.log(folderNo);
	    console.log(folderName);
	    $.ajax({
	        type: "POST", 
	        url: "scrapBoard.mp",
	        data: {
	            boardNo: boardNo,
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

    
    </script>
       <%@ include file="../common/footer.jsp" %>
</body>
</html>
