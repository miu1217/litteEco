<%@page import="com.kh.littleEco.member.model.vo.Member"%>
<%@page import="com.kh.littleEco.searchEco.model.vo.EcoLike" %>
<%@page import="com.kh.littleEco.searchEco.model.vo.SearchEco" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
Member loginMember = (Member) session.getAttribute("loginMember");
%>
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
    
        /* 헤더부분 */
        .search_header {
            width: 100%;
            height: 180px;
            position: relative;
        }

        .title_text {
            font-family: 'Noto Sans', sans-serif;
            font-size: 42px;
            position: absolute;
            left: 50%;
            top: 40%;
            transform: translate(-50%, -50%);
        }

        .search_list {
            height: auto;
        }

        /* 검색부분 */
        .searchBox {
            width: 100%;
            text-align: center;
            padding: 50px 0;
        }

        .searchBox * {
            font-family: 'Noto Sans KR', sans-serif;
        }

        .sorting {
            height: 30px;
            width: 120px;
            font-size: 16px;
            vertical-align: middle;

        }

        #search_input {
            width: 240px;
            height: 30px;
            padding: 0;
            vertical-align: middle;
            font-size: 16px;

            &:focus {
                outline: none;
            }
        }

        .searchBtn {
            height: 30px;
            width: 120px;
            vertical-align: middle;
            font-size: 16px;
            background-color: #002C7B;
            color: #E6E6E6;
            border: none;
        }

        .searchBtn:hover{
            color: white;
            cursor: pointer;
            background-color: #02215a;
        }


        /* 브랜드 보여지는 테이블 */
        .search_list_table {
            width: 60%;
           /*  border-collapse: collapse; */
            border-spacing: 10px 30px;
        }
        
        #startTh {
			
        }
        /*
        #thum_box {
        	width: 340px;
        	height: 270px;

        }
        */
        #thumb_img {
        	width: 200px;
        	height:244px;
        	object-fit:cover;
        
        }

        #likeCountTd > ul > li {
            list-style: none;
        }

        th, td {
            font-family: 'Noto Sans KR', sans-serif;
            text-align: center;
            padding: 5px;
            margin: 10px;
        }

        #imageTd {
        /*    height: 220px;
            width: 220px;*/
            background-color: #002C7B;
            border:5px solid white;
        }

        #titleTh {
            text-align: left;
            padding-left: 50px;
            height: 80px;
            width:65%;
            font-size: 22px;
            font-weight: 500;
        }

        #contentTd {
            text-align: left;
            padding-left: 50px;
            width: 100%;
            font-size: 18px;

        }

        /* 글작성버튼-관리자 아니면 안보여야됨 */
        .notice_write_btnBox {
            width: 100%;
            text-align: center;
            height: 100px;
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



        /* 페이지내이션 */
        .pagination {
            width: 100%;
            height: 60px;
            margin-top: 2%;
            text-align: center;
            margin-bottom: 40px;
            list-style: none;
            padding: 0;
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


		/* 좋아요 버튼 */
		.likeBtn {
			border: none;
		
		}


    </style>
        
</head>
<body>
	<!-- header -->
    <%@ include file="../common/header.jsp" %>

    <div class="wrap">
        
        <div class="search_header " id="search_title">
            <p class="title_text">SEARCH ECO</p>
        </div>
        
        <div class="search_list" id="search_table">

            <table class="search_list_table" align="center">
                <tbody>
	                <c:if test="${empty sList }">
	                	<tr>
	                		<td colspan="4">조회된 게시물이 없습니다.</td>
	                	</tr>
	                
	                </c:if>
	                <c:forEach items="${sList }" var="s">
		                <th id="startTh">
		                    <tr><!--한 게시글 보여지기-->
		                        <td id="imageTd" rowspan="3" colspan="1" class="thumb_img"  onclick="location.href='detail.sbo?bno=${s.ecoBoardNo}'" >
		                        	<div id="thum_box">
		                        		<img  style="width: 365px; height:244px;"src="${s.thumImg}">
		                        	</div>
		                        </td>
		                        <th id="titleTh" colspan="2" onclick="location.href='detail.sbo?bno=${s.ecoBoardNo}'" >${s.ecoBoardTitle }</th>
		                        
		                        <td id="likeCountTd">
		                        	<ul>
		                        		<li>
		                        			<input type="hidden" name="boardNo" id='hiddenBno' value="${s.ecoBoardNo }">
						             		
						                    <button type="button" onclick="dolike(this);" style="border: none;">
						                    	<img class="heartClass" src="resources/02_searchEco/like_off.png">
						                    </button> 
		                        		</li>
		                        		<li class="like_count"></li>
		                        	</ul>      
		                        </td>
		                        
		                        
		                        <tr>
		                        <td id="contentTd" colspan="2" onclick="location.href='detail.sbo?bno=${s.ecoBoardNo}'" >${s.brandInfo }</td>
		                        </tr>
		                        
		                    </tr>
		                </th>
                    </c:forEach>
                </tbody>
            </table>
            
            <c:set var="boardNo" value="${ecoBoardNo }"/>
            <c:set var="memberNo" value="${loginMember.memberNo }"/>

        </div>

       <script> //좋아요 기능 
       function dolike(el){
           
           var ebno = $(el).parents().children().eq(0).val();
           var heartImg = $(el).children().eq(0);
           var like = $(el).parents().children().eq(1); //라이크 버튼
           var likeText = like.text(); //왜필요하지?

           //if(이미지파일이 heart이면 ) 
       	   if(heartImg.attr("src") === "resources/02_searchEco/like_off.png"){
            $.ajax({
               url : "likeInsert.bo",
               data : {
                       ebno : ebno,
                       userNo : "${loginUser.memberNo}",
                   },
               success : function(result){
                   if(result){
                       heartImg.attr("src","resources/02_searchEco/like_on.png");

                   }else{
                       console.log("좋아요실패");
                   }
               },
               error : function(){
                   console.log("통신오류")
               }
           }); 
           
           }else{
               $.ajax({
                   url : "likeRemove.bo",
                   data : {
                       ebno : ebno,
                       userNo : "${loginUser.memberNo}"
                       
                   },
                   success: function(result){
                	   if(heartImg.attr("src") === "resources/02_searchEco/like_on.png"){
                           heartImg.attr("src","resources/02_searchEco/like_off.png");
                        
                       }else{
                           console.log("좋아요취소실패");
                       }
                   },
                   error : function(){
                       console.log("통신오류 리무브");
                   }
               });
           }
           
       	
       }
       
       function likeCheck(el){
 		  var ebno = $(el).parents().children().eq(0).val();
 	    
 		  $.ajax({
 	        url: "likeCheck",
 	        data: {
 	            ebno: ebno
 	        },
 	        success: function(result) {
 	        	
 	        	$(".result").html(result);
 	        }
 	    });
 	}
       
       </script>
  
        <div class="paginationBox" id="eco_pagination" align="center">
			<ul class="pagination">
				<%-- <c:if test="${pi.currentPage ne 1 }"> --%>
                    <li class="page-item"><a class="page-link" href="searchEco.bo?currentPage=${pi.currentPage-1}">＜</a></li>
	 			<%-- </c:if> --%>
	 			<c:forEach begin="${pi.startPage }" end="${pi.endPage }" var="p" >
	                <li class="page-item"><a class="page-link" href="searchEco.bo?currentPage=${p}">${p }</a></li>
	 			</c:forEach>
                <%-- <c:if test="${pi.currentPage ne pi.maxPage }"> --%>
	                <li class="page-item"><a class="page-link" href="searchEco.bo?currentPage=${pi.currentPage+1}">＞</a></li>
                <%-- </c:if> --%>
			</ul>
        </div>
        
        <!-- 관리자일때만 보여야됨 -->      
        <div class="notice_write_btnBox">
        <c:if test="${not empty loginUser and loginUser.memberId eq ('admin')}">
            <button type="" class="notice_writeBtn" onclick="location.href='searchEcoInsert.bo'">글작성</button>
        </c:if>
        </div>
        
    </div>

   	<!-- footer -->
    <jsp:include page="../common/footer.jsp" />
    

</body>
</html>
