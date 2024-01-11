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
    
        /* 공지사항 제목 칸 */
        .notice_header {
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


        /* 공지사항 디테일 뷰 테이블 */
        .notice_detail {
            height: auto;
        }

        .notice_detail_table {
            width: 60%;
            border-top: 5px solid black;
            border-collapse: collapse;
        }

        th, td {
            font-family: 'Noto Sans KR', sans-serif;
            border-bottom: 1px solid #D8D8D8;
            height: 40px;
            text-align: center;
            padding: 5px;
        }

        td {
            color: #2E2E2E;
            text-align: left;
        }

        #titleTr > td {
            font-weight: bold;
        }

        .nCon {
            font-weight: 400;
            color: #848484;
        }   
        .nTitle {
            width: 70%;
            font-size: 18px;
        }

        .nContent {
            height: 400px;
            vertical-align: text-top;
            padding: 20px 5px;

        }


		.nAttach {
			font-weight: bold;
		}
		
		


        /* 버튼 관련 */
        .btn_area {
            width: 80%;
            height: 100px;
            text-align: right;
            margin-top: 40px;
            margin-bottom: 60px;
        }

        .nBtn {
            width: 180px;
            height: 60px;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 18px;
            font-weight: bold;
        }

        .nBtn:hover {
            cursor: pointer;
        }

        #dBtn{
            background-color: #DF0101;
            color: #E6E6E6;
            border: none;
        }

        #dBtn:hover{
            color: #E6E6E6;
            background-color: #B40404;
        }


        /* 이전글 다음글 테이블 */
		/*
        .upDown_area {
            height: 300px;
        }

        .upDown_table {
            width: 60%;
            border-top: 3px solid black;
            border-bottom: 3px solid black;
            border-collapse: collapse;
        }
        
        .upDown_table > tbody > tr:hover {
        	cursor: pointer;
        }

        .upDownTr > td {
            height: 40px;
            padding: 10px 20px;
        }

        .upDown_td1 {
            width: 5%;
        }

        .upDown_td2 {
            width: 15%;
            text-align: center;
            font-size: large;
            font-weight: 600;
        }
       
		*/

    </style>
        
</head>
<body>
	<!-- header -->
    <%@ include file="../common/header.jsp" %>

    <div class="wrap">
        
        <div class="notice_header" id="notice_title">
            <p class="title_text">공지사항</p>
        </div><!--//notice header-->
        
        <div class="notice_detail">
            <table class="notice_detail_table" align="center">
                <tbody>
                    <tr class="tableCol" id="titleTr">
                        <td class="nTitle">${n.boardTitle }</td>
                        <td class="nDate">등록일 &nbsp; <span class="nCon">
                        	<fmt:parseDate var="pDate" value="${n.createDate }" pattern="yyyy-MM-dd" />
	                        <fmt:formatDate var="fDate" value="${pDate}" pattern="yyyy-MM-dd" /> 
	                        <c:out value="${fDate }" /></span></td>
                        <td class="nCount">조회수 &nbsp; <span class="nCon">${n.count }</sapn></td>
                    </tr>
                    <tr>
                    	<td class="nAttach" colspan="3">
                    		<c:choose>
	                    		<c:when test="${empty n.boOriginName }">
	    							첨부파일이 없습니다.
	    						</c:when>                	
	                    		<c:otherwise>
	                    			<input type="hidden" name="boFileNo" value="${n.boFileNo }" >
			                        <a href="${n.boChangeName }" download="${n.boOriginName }">${n.boOriginName }</a>
	                    		</c:otherwise>
                    		</c:choose>
                    	</td>
                    </tr>
                    <tr class="tableCol" id="contentTr">
                        <td colspan="3" class="nContent">${n.boardContent }</td>
                    </tr>
                </tbody>

            </table>
        </div><!--//notice write-->

        <div class="btn_area">
            <!--관리자일때만 보여야하는 버튼 2개-->
            <c:if test="${not empty loginUser and loginUser.memberId eq ('user1234')}">
            	<button type="submit" class="nBtn" id="dBtn">삭제하기</button>
            	<button type="submit" class="nBtn" id="wBtn" onclick="location.href='update.no?bno=${n.boardNo}'">수정하기</button>
            </c:if>
            <!--아래버튼은 아무나 보여야됨-->
            <button type="submit" class="nBtn" id="lBtn" onclick="location.href='notice.bo'">목록으로</button>
        </div>
        
        <script>
        	$(function() {
        		var dBtn = $("#dBtn");
        		
        		$("#dBtn").click(function() {
        			
        			var formObj = $("<form>");
        			
        			formObj.attr("action", "delete.no").attr("method","post");
        			
        			var bno = $("<input>").prop("type","hidden").prop("name","bno").prop("value","${n.boardNo}");
        			
        			var filePath = $("<input>").prop("type","hidden").prop("name","filePath").prop("value","${n.boChangeName}");
        			
        			var obj = formObj.append(bno).append(filePath);
        			
        			console.log(formObj);
					console.log(bno);
					console.log(filePath);
        			
        			$("body").append(obj);
        			
        			obj.submit();
        			                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
        		});
        		
        	});
        
        </script>
        
        
        
        
        

		<!-- 
        <div class="upDown_area" align="center">
            <table class="upDown_table">
                <tbody>
                    <tr class="upDownTr" onclick="location.href='detail.no?bno=${n.boardNo + 1}'">
                        <td class="upDown_td1">∧</td>
                        <td class="upDown_td2">다음글</td>
                        <%-- <c:if test="${n.boardNo + 1 }"> --%>
                        	<td class="upDown_td3">${n.boardTitle }</td>
                        <%-- </c:if> --%>
                    </tr>
                    <tr class="upDownTr" onclick="location.href='detail.no?bno=${n.boardNo - 1}'">
                        <td class="upDown_td1">∨</td>
                        <td class="upDown_td2">이전글</td>
                        <td class="upDown_td3">이전글이 없습니다</td>
                    </tr>
                </tbody>
            </table>

        </div>
         -->

    </div><!--//wrap-->



   	<!-- footer -->
    <jsp:include page="../common/footer.jsp" />
    

</body>
</html>