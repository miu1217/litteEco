<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

        .notice_list {
            height: auto;
        }

        .notice_table {
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
            color: #6E6E6E;
        }

        th {
            width: 150px;
        }
        tbody > tr >td:nth-child(2) {
            text-align: left;
            font-size: 16px;
            color: black;
        }

		tbody > tr:hover {
			cursor: pointer;
		}
		
        #number_th {
            width: 70px;
        }

        #title_th {
            width: 55%;
        }

        .pagination {
            width: 100%;
            height: 60px;
            margin-top: 1%;;
        }

        .notice_write_btnBox {
            width: 100%;
            height: 60px;
            margin-top: 1%;
            text-align: center;
            margin-bottom: 100px;
        }
        .notice_writeBtn {
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 18px;
            width: 180px;
            height: 60px;
            background-color: #002C7B;
            color: #E6E6E6;
            font-weight: bold;
        }

        .notice_writeBtn:hover{
            color: white;
            cursor: pointer;
            background-color: #02215a;
        }
        
        /* pagination css */
        .paginationBox {
        	width:fit-content; 
        	margin:auto;
        	
        }

        .pagination {
            list-style: none;
            padding: 0;
        }

        .pagination > li {
            float: left;
        }
        
        .pagination > li > a {
        	text-decoration: none;
        	color:black;
        	font-family: 'Noto Sans KR', sans-serif;
        }
        
        .page-item {
        	margin : 20px;
        }


    </style>
        
</head>
<body>
	<!-- header -->
    <%@ include file="../common/header.jsp" %>

    <div class="wrap">
        
        <div class="notice_header" id="notice_title">
            <p class="title_text">공지사항</p>
        </div><!--//notice header-->
        
        <div class="notice_list" id="notice_table">
            <table class="notice_table" align="center">
                <thead>
                    <tr>
                        <th id="number_th">번호</th>
                        <th id="title_th">제목</th>
                        <th>등록일</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                	<c:if test="${empty list }">
                		<tr>
                			<td colspan="4">조회된 글이 없습니다.</td>
                		</tr>
                
                	</c:if>
                	<c:forEach items="${list }" var="n">
	                    <tr onclick="location.href='detail.no?bno=${n.boardNo}'">
	                        <td>${n.boardNo }</td>
	                        <td>${n.boardTitle }</td>
	                        <fmt:parseDate var="pDate" value="${n.createDate }" pattern="yyyy-MM-dd" />
	                        <fmt:formatDate var="fDate" value="${pDate}" pattern="yyyy-MM-dd" /> 
	                        <td><c:out value="${fDate }" /></td>
	                        <td>${n.count }</td>
	                    </tr>
                    </c:forEach>
                </tbody>

            </table>


        </div><!--//notice list-->
        
        <div class="paginationBox" id="notice_pagination" align="center">
			<ul class="pagination">
				<%-- <c:if test="${pi.currentPage ne 1 }"> --%>
                    <li class="page-item"><a class="page-link" href="notice.bo?currentPage=${pi.currentPage-1}">＜</a></li>
	 			<%-- </c:if> --%>
	 			<c:forEach begin="${pi.startPage }" end="${pi.endPage }" var="p" >
	                <li class="page-item"><a class="page-link" href="notice.bo?currentPage=${p}">${p }</a></li>
	 			</c:forEach>
                <%-- <c:if test="${pi.currentPage ne pi.maxPage }"> --%>
	                <li class="page-item"><a class="page-link" href="notice.bo?currentPage=${pi.currentPage+1}">＞</a></li>
                <%-- </c:if> --%>
			</ul>
        </div>
        
        <!-- 관리자일때만 보여야됨 -->
        <div class="notice_write_btnBox">
        <c:if test="${not empty loginUser and loginUser.memberId eq ('user1234')}">
            <button type="button" class="notice_writeBtn" onclick="location.href='insert.no'">글작성</button>
		</c:if>
        </div>



    </div><!--//wrap-->



   	<!-- footer -->
    <jsp:include page="../common/footer.jsp" />
    

</body>
</html>
