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
            font-weight: bold;
        }

        .nBtn:hover {
            cursor: pointer;
        }

        #sBtn{
            background-color: #002C7B;
            color: #E6E6E6;
        }

        #sBtn:hover{
            color: white;
            background-color: #02215a;
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
         <form id="noticeInsertForm" method="post" action="insert.no" enctype="multipart/form-data">
            <table class="moiza_write_table" align="center">
                <tbody>
                    <tr class="tableCol" id="titleTr">
                    	<th>
                    		<label for="cName">프로젝트명</label>
                    	</th>
                        <td colspan="2">
                            <input type="text" name="boardTitle" id="cName" value="제목" required>
                        </td>
                    </tr>
                    <tr class="tableCol" id="titleTr">
                    	<th>
                    		<label for="cName">미션</label>
                    	</th>
                        <td colspan="2">
                            <input type="text" name="boardTitle" id="cName" value="제목" required>
                        </td>
                    </tr>
                    <tr class="tableCol" id="titleTr">
                    	<th>
                    		<label for="cName">비전</label>
                    	</th>
                        <td colspan="2">
                            <input type="text" name="boardTitle" id="cName" value="제목" required>
                        </td>
                    </tr>
                    <tr class="tableCol" id="titleTr">
                    	<th>
                    		<label for="cName">카테고리</label>
                    	</th>
                        <td>
                            <input type="text" name="boardTitle" id="cName" value="제목" required>
                            <input type="text" name="boardTitle" id="cName" value="제목" required>
                            <input type="text" name="boardTitle" id="cName" value="제목" required>
                        </td>
                    </tr>
                    <tr class="tableCol" id="contentTr">
                    	<th>
                    		<label for="cName">시즌목표</label>
                    	</th>
                        <td colspan="2">
                            <textarea name="boardContent" id="nContent" cols="30" rows="5" required></textarea>
                        </td>
                    </tr>
                    <tr class="tableCol" id="contentTr">
                    	<th>
                    		<label for="cName">미팅일정</label>
                    	</th>
                        <td colspan="2">
                            <textarea name="boardContent" id="nContent" cols="30" rows="5" required></textarea>
                        </td>
                    </tr>
                    <tr class="tableCol" id="contentTr">
                    	<th>
                    		<label for="cName">공지사항</label>
                    	</th>
                        <td colspan="2">
                            <textarea name="boardContent" id="nContent" cols="30" rows="5" required></textarea>
                        </td>
                    </tr>
                </tbody>

            </table>
        </div><!--//notice write-->

        <div class="btn_area">
            <button type="button" class="nBtn" id="cBtn" onclick="javascript:history.go(-1);">취소하기</button>
            <button type="submit" class="nBtn" id="sBtn">작성하기</button>
        </div>
        </form>

    </div><!--//wrap-->



   	<!-- footer -->
    <jsp:include page="../common/footer.jsp" />
    

</body>
</html>