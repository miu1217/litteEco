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
            
        }
        #contents{
            padding-top: 60px;
            padding-bottom: 60px;
            display: block;
            width: 1250px;
            height: 1000px;
            margin: 0 auto;
        }
        
        #contents ul{
            display: flex;
            list-style: none;
            flex-wrap: wrap;            
        }

        #contents #thumbnail{
            width: 365px;
            height: 300px;
            border-radius: 10px;
            background-color: wheat;
            margin-right: 10px;
        }

        #contents> li{
            width: 365px;
            height: 350px;
            padding: 0 0 30px 20px;
            margin-bottom: 50px;
        }

        #contents img{
            border-radius: 10px;
        }

        #contents p{
            text-align: center;
            font-size: 18px;
            font-weight: 500;
            color: #1a1a1a;
        }


		#hrbtn{
			padding: 20px 60px;
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
			padding-right: 120px;
			padding-top: 50px;
		}
	
    </style>
</head>
<body>
    <div id="contents">
     <c:if test="${empty list }" >
     	<p align="center">조회된 게시글이 없습니다.</p>
     </c:if>
    <ul>
     <c:forEach items="${list }" var="hrb">
     <c:if test="${not empty hrb.rcyTitle }">
      <li>
         <div id="thumbnail" onclick="location.href='rbdetail.hrb?rbno=${hrb.rcyBoardNo}'"> 
        </div>
       
        <table id="s_tit"> 
         <thead>
         <tr>
         <th>${hrb.rcyTitle } </th><td>조회수 ${hrb.count }</td>
         
         </tr>
         </thead>
        </table>
      </li>    
     </c:if>
</c:forEach>
     <c:forEach items="${list }" var="hrb">
     	<c:if test="${not empty hrb.ecoTitle }">
            <li>
         <div id="thumbnail" onclick="location.href='detail.sbo?bno=${hrb.ecoBoardNo}'"> 
        </div>
       	
        <table id="s_tit"> 
         <thead>
         <tr>
         <th>${hrb.ecoTitle } </th><td>조회수 ${hrb.count }</td>
         
         </tr>
         </thead>
        </table>

      </li>    
     	</c:if>
     </c:forEach>
    </ul>

    </div>
    
<%--     <div id="pagingArea" align="center">
    <ul class="pagination">
      <c:if test="${pi.currentPage ne 1 }">
      	<li class="page-item"> <a class="page-link" href="mypost.mp?currentPage=${pi.currentPage-1 }">previouse</a></li>
      </c:if>
    	<c:forEach begin="${pi.startPage }" end="${pi.endPage }" var="p">
    		<li class="page-item"><a class="page-link" href="mypost.mp?currentPage=${p }">${p }</a></li>
    	</c:forEach>
    	<c:if test="${pi.currentPage ne pi.maxPage}">
    		<li class="page-item"> <a class="page-link" href="mypost.mp?currentPage=${pi.currentPage+1 }">Next</a></li>
    	</c:if>
    </ul>
    </div> --%>
    
    
    <script type="text/javascript">
    	
    
    
    
    </script>

    
</body>
</html>