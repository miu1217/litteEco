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
        #tit{
            font-size: 40px;
            font-weight: 400;
            display: flex;
            justify-content: center;
            margin-top: 60px;
            color: #000;
            
        }
        #contents{
            padding-top: 60px;
            padding-bottom: 60px;
            display: block;
            width: 800px;
/*             height: 1000px; */
            margin: 0 auto;
            
        }
        
        #boardList{
            text-align: center;
		   border-top: 2px solid #000;
		   border-bottom: 2px solid #000;
        }
		
		#boardList th{
		  vertical-align:middle;
		   text-align: center;
		   height:50px;
		}
		#boardList td{
				   text-align: center;	
				   height:45px;
		}
		

		#hrbtn{
			padding: 20px 60px;
			float:right;
			margin-right: 40px;
			background: #002c7b;
			color: #e6e6e6;
			font-size: 18px;
			font-weigth: 400;
		}
		
		
		#s_tit{
		margin-top: 10px;
		width:100%;
		}
		
		
		#s_tit>table th{
		 width: 85%;
		}

		#insertbtn{
			float:right;
			padding-right: 25px;
			padding-top: 50px;
		}
	
	
	/* 페이지내이션 */
        .pagination {
            width: 100%;
            height: 60px;
/*             margin-top: 2%; */
            text-align: center;
            margin-bottom: 40px;
            list-style: none;
        }
        
        .paginationBox {
        	width:fit-content; 
        	margin:auto;
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
#bno{color: #4d4d4d;font-weight: 300;}
#cdate{color: #4d4d4d;font-weight: 300;}
#title{font-weight:500;}
#writer{color:#4d4d4d; font-weight:300;}
	
    </style>
</head>
<body>
    <%@ include file="../common/header.jsp" %>
    <div id="tit">How2Recycle</div>
    <div id="contents">
     <table id="boardList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
             <c:if test="${empty list }" >
                     	<tr>
                     		<td colspan="6">조회된 게시글이 없습니다.</td>
                     	</tr>
                      </c:if>
                  	<c:forEach items="${list }" var="hrb">
                		<tr onclick="location.href='rbdetail.hrb?rbno=${hrb.boardNo}'">
	                        <td id="bno">${hrb.boardNo }</td>
	                        <td style="text-align:left;" id="title">${hrb.recycleBoardTitle }</td>
	                        <td id="writer">관리자</td>
	                        <td id="count">${hrb.count }</td>
	                        <td id="cdate"> ${hrb.createDate }</td>
                    	</tr>
                  	</c:forEach>
                  	
                </tbody>
            </table>
    
    
    
    
    
    
        </div>
    
    
   <c:if test="${not empty loginUser and loginUser.memberId eq ('admin')}">
	<div id=insertbtn>
		<button id="hrbtn" onclick="location.href='rbinsert.hrb'" >글작성</button>
	</div>    	
    </c:if>

    </div>
    
    <div id="pagingArea" align="center">
    <ul class="pagination">
      <c:if test="${pi.currentPage ne 1 }">
      	<li class="page-item"> <a class="page-link" href="rblist.hrb?currentPage=${pi.currentPage-1 }">previouse</a></li>
      </c:if>
    	<c:forEach begin="${pi.startPage }" end="${pi.endPage }" var="p">
    		<li class="page-item"><a class="page-link" href="rblist.hrb?currentPage=${p }">${p }</a></li>
    	</c:forEach>
    	<c:if test="${pi.currentPage ne pi.maxPage}">
    		<li class="page-item"> <a class="page-link" href="rblist.hrb?currentPage=${pi.currentPage+1 }">Next</a></li>
    	</c:if>
    </ul>
    
    </div>

    
    <%@ include file="../common/footer.jsp" %>
</body>




</html>