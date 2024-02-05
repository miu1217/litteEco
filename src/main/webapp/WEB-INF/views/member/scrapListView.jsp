<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
          <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
		
		/* 이미지와 체크박스를 함께 감싸는 .item-container 스타일 추가 */
		.item-container {
		    position: relative;
		}
	
			
			    .checkbox-container2 {
	      top: 0;
	      right: 0;
	      display: none;
	    }
	
	    /* 스타일링을 위한 추가적인 CSS */
	    .checkbox-container2 input {
	      margin-right: 5px;
	      width : 20px;
	      height : 20px;
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
     <c:if test="${not empty hrb.recycleBoardTitle}">
      <li>
         <div id="thumbnail" class="thumbnail" onclick="location.href='rbdetail.hrb?rbno=${hrb.boardNo}'"> 
        </div>                
        <table id="s_tit"> 
         <thead>
         <tr>
         <th>제목 : ${hrb.recycleBoardTitle } </th>
         <th>/ RecycleBoard</th>
         <td>스크랩 일자 <fmt:formatDate value="${hrb.scrapDate}" pattern="yy/MM/dd"/></td>
			<td>			    
			    <div class="checkbox-container2" data-board-no="${hrb.boardNo}">
			        <input type="checkbox" class="checkbox">
			    </div>
			</td>
         </tr>
         </thead>
        </table>
      </li>    
     </c:if>
</c:forEach>
<c:forEach items="${list }" var="hrb">
	<c:if test="${not empty hrb.ecoBoardTitle }">
            <li>
         <div id="thumbnail" class="thumbnail" onclick="location.href='detail.sbo?bno=${hrb.ecoBoardNo}'"> </div>

        <table id="s_tit"> 
         <thead>
         <tr>
         <th>제목 : ${hrb.ecoBoardTitle} </th>
         <th>/ searchEco</th>
         <td>스크랩 일자 <fmt:formatDate value="${hrb.scrapDate}" pattern="yy/MM/dd"/></td>
         <td>                 <div class="checkbox-container2" data-ecoBoard-no="${hrb.ecoBoardNo}">
                    <input type="checkbox" class="checkbox" >
                </div></td>
         </tr>
         </thead>
        </table>

      </li>  
	</c:if>
</c:forEach>
<c:forEach items="${list }" var="hrb">
	<c:if test="${not empty hrb.moizaName }">
            <li>
         <div id="thumbnail" class="thumbnail" onclick="location.href='moiza.de?mno=${hrb.moizaNo}'"> </div>

        <table id="s_tit"> 
         <thead>
         <tr>
         <th>제목 : ${hrb.moizaName} </th>
         <th>/ Moiza</th>
         <td>스크랩 일자 <fmt:formatDate value="${hrb.scrapDate}" pattern="yy/MM/dd"/></td>
         <td>          <div class="checkbox-container2" data-moiza-no="${hrb.moizaNo}">
                    <input type="checkbox" class="checkbox">
                </div></td>
         </tr>
         </thead>
        </table>

      </li>  
	</c:if>
</c:forEach>
    </ul>

    </div>
    


    
    <script type="text/javascript">

    

    
			//게시물 폴더 이동
		 // 폴더 이동 버튼 클릭시
		    $("#updateFolderBtn").on("click", function () {
		        
		    	var folderNo = $("#folderSelect2").val();
		        var chkBox = $(".checkbox:checked");
		        var updateCount = 0; //이동된 게시글 수
		        
		        chkBox.each(function () {
		            var chk = $(this).closest(".checkbox-container2");
		            
		            var boardNo = chk.data("board-no");
		            var ecoBoardNo = chk.data("ecoBoard-no");
		        	var moizaNo = chk.data("moiza-no");
		 
		        //게시물과 폴더 정보 전송
		        $.ajax({
		            type: "post",
		            url: "updateFolder",
		            data: {
		                boardNo: boardNo,
		                ecoBoardNo : ecoBoardNo,
		                moizaNo : moizaNo,
		                folderNo: folderNo
		            },
		            success: function (result) {
		            	
		            	updateCount++;
		            	
		            	if(updateCount === chkBox.length){
		            		
		            	alert("총 "+ updateCount + "개의 게시물이 이동됐습니다");
		                	hideModal();
		            	}
		            	
		                	
		            },
		            error: function () {
		                console.log("통신 오류");
		            }
		        });
		    });
		    });

    

    
    
    </script>
    

    
</body>
</html>