<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="../assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>littleEco</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="/littleEco/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/littleEco/resources/assets/css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="/littleEco/resources/assets/css/demo.css" rel="stylesheet" />
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
        
        .search{
        
        margin-left: 220px;
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
            height: 26px;
            padding: 0;
            vertical-align: middle;
            font-size: 16px;

            &:focus {
                outline: none;
            }
        }

        .searchBtn {
            height: 34px;
            width: 120px;
            vertical-align: middle;
            font-size: 16px;
            background-color: #002C7B;
            color: #E6E6E6;
        }

        .searchBtn:hover{
            color: white;
            cursor: pointer;
            background-color: #02215a;
        }


        /* 브랜드 보여지는 테이블 */
        .search_list_table {
            width: 60%;
            /* border-collapse: collapse; */
            border-spacing: 0px 30px;
        }

        #likeCountTd > ul > li {
            list-style: none;
        }

        th, td {
            font-family: 'Noto Sans KR', sans-serif;
            text-align: center;
            padding: 5px;
        }

        #imageTd {
            height: 220px;
            width: 220px;
            background-color: #002C7B;
        }

        #titleTh {
            text-align: left;
            padding-left: 50px;
            height: 80px;
        }

        #contentTd {
            text-align: left;
            padding-left: 50px;

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

		#brandName {
		font-weight:bold;
		}

    </style>
        
</head>
<body>
    <div class="wrap">
         <div class="sidebar" >
           
            <div class="sidebar-wrapper" style="background-color: #002c7b;">
                <div class="logo">
                    <a href="http://www.creative-tim.com" class="simple-text">
                        Litte Eco
                    </a>
                </div>
                <ul class="nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="admin">
                            <i class="nc-icon nc-notes"></i>
                            <p>Member List</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="brand.ad">
                            <i class="nc-icon nc-circle-09"></i>
                            <p>Brand</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="search">
        <div class="search_header " id="search_title">
            <p class="title_text">SEARCH ECO</p>

        </div><!--//notice header-->
        
        <div class="search_list" id="search_table">

            <div class="searchBox">
                <select name="sort" class="sorting" id="sort">
                    <option value="all">전체</option>
                    <option value="sell">판매상품</option>
                    <option value="brand">브랜드 이름</option>
                </select>

                <input type="text" name="search_text" id="search_input">

                <button type="submit" class="searchBtn">검색</button>
            </div>


            <table class="search_list_table" align="center">
                <tbody>
	                <c:if test="${empty bList }">
	                	<tr>
	                		<td colspan="3">조회된 게시물이 없습니다.</td>
	                	</tr>
	                
	                </c:if>
	                <c:forEach items="${bList }" var="b">
	                    <tr id="brandList"><!--한 게시글 보여지기-->
	                        <th id="titleTh"> <img class="product__item__pic set-bg" src="${b.imgSrc}" style="width: 200px; height: 150px; margin: 80px 10px 0px 10px;"></th>
	                        <th><input type="hidden" value="${b.brandNo }"></th>
	                        <td id="brandName" colspan="2">${b.brandName }</td>
	                        <td id="brandInfo" colspan="2">${b.brandInfo }</td>
	                    </tr>
                    </c:forEach>
                </tbody>

            </table>

        </div><!--//notice list-->
        
        <div class="paginationBox" id="brand_pagination" align="center">
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

        <div class="notice_write_btnBox">
            <button type="button" id="btn" class="notice_writeBtn">글작성</button>
        </div>
        
    </div><!--//wrap-->
    </div>
    
    <script>
    
	    $(document).on("click","#brandList", function(){
	    	var bno= $(this).children().eq(1).children().val();
	    	
			location.href = "brandUpdate.ad?bno=" + bno;
		});
	    $(document).on("click","#btn", function(){
			location.href = "brandInsert.ad"
		});
    </script>
</body>

<script src="/littleEco/resources/assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="/littleEco/resources/assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="/littleEco/resources/assets/js/plugins/bootstrap-switch.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!--  Chartist Plugin  -->
<script src="/littleEco/resources/assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="/littleEco/resources/assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="/littleEco/resources/assets/js/light-bootstrap-dashboard.js?v=2.0.0 " type="text/javascript"></script>
<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="/littleEco/resources/assets/js/demo.js"></script>

</html>
