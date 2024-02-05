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
				.thumbnail{
			background-image:url(https://i3.ruliweb.net/ori/22/04/23/18052f68d5e50247b.gif);
			background-repeat : no-repeat;
			background-size : cover;
			background-position : center ,center;
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
         <div id="thumbnail" class="thumbnail" onclick="location.href='rbdetail.hrb?rbno=${hrb.rcyBoardNo}'"> 
        </div>
       
        <table id="s_tit"> 
         <thead>
         <tr>
         <th>제목 ${hrb.rcyTitle } </th><th>조회수 ${hrb.count }</th><th> /How2Recycle</th>
         
         </tr>
         </thead>
        </table>
      </li>    
     </c:if>
	</c:forEach>
     <c:forEach items="${list }" var="hrb">
     	<c:if test="${not empty hrb.ecoTitle }">
            <li>
         <div id="thumbnail" class="thumbnail" onclick="location.href='detail.sbo?bno=${hrb.ecoBoardNo}'"> 
        </div>
       	
        <table id="s_tit"> 
         <thead>
         <tr>
         <th>제목 ${hrb.ecoTitle } </th><th>조회수 ${hrb.count }</th><th> /SearchEco</th>
         
         </tr>
         </thead>
        </table>

      </li>    
     	</c:if>
     </c:forEach>
          <c:forEach items="${list }" var="m">
     	<c:if test="${not empty m.moizaName }">
            <li>
         <div id="thumbnail" class="thumbnail" onclick="location.href='moiza.de?mno=${m.moizaNo}'"> 
        </div>
       	
        <table id="s_tit"> 
         <thead>
         <tr>
         <th>제목 ${m.moizaName} </th><th>조회수 1</th><th> /Moiza</th>
         
         </tr>
         </thead>
        </table>

      </li>    
     	</c:if>
     </c:forEach>
     
    </ul>

    </div>


    
    
    <script type="text/javascript">
    	
    
    
    
    </script>

    
</body>
</html>