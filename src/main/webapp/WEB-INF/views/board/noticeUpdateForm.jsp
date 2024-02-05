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

        .notice_write {
            height: auto;
        }

        .notice_write_table {
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
            width: 150px;
        }


        #titleTr input[type="text"] {
            width: 90%;
            margin-left: 45px;
            height: 35px;
            border: 1px solid #BDBDBD;
            /* color: #A4A4A4; */
            color: #585858;
            font-size: 15px;
            font-family: 'Noto Sans KR', sans-serif;
            padding: 5px
        }

        #contentTr textarea {
            margin-left: 45px;
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
        
        <div class="notice_header" id="notice_title">
            <p class="title_text">공지사항</p>
        </div><!--//notice header-->

		<form id="noticeUpdateForm" method="post" action="update.no" enctype="multipart/form-data">
		<div class="notice_write">
				<table class="notice_write_table" align="center">
					<tbody>
						<tr class="tableCol" id="titleTr">
							<td colspan="2"><input type="text" name="boardTitle" id="nTitle"
								value="${n.boardTitle }" required></td>
						</tr>
						<tr class="tableCol" id="nInput">
							<th><label for="upFile" id="input_file">첨부파일</label></th>
							<td><input type="file" name="reUpFile" id="upFile">
								<%-- <input type="file" id="upfile" class="form-control-file border" name="reUpFile"> --%>
								<a href="${n.boChangeName }" download="${n.boOriginName }">${n.boOriginName }</a>
								<input type="hidden" name="boardNo" value="${n.boardNo }" > 
								<input type="hidden" name="boChangeName"
								value="${n.boChangeName }"> <input type="hidden"
								name="boOriginName" value="${n.boOriginName }"></td>
						</tr>
						<tr class="tableCol" id="contentTr">
							<td colspan="2"><textarea name="boardContent" id="nContent"
									cols="30" rows="10" required>${n.boardContent }</textarea></td>
						</tr>
					</tbody>

				</table>
		</div>
		<!--//notice write-->

		<div class="btn_area">
			<button type="button" class="nBtn" id="cBtn" onclick="javascript:history.go(-1);">취소하기</button>
			<button type="submit" class="nBtn" id="sBtn">수정하기</button>
		</div>
		</form>

	</div><!--//wrap-->



   	<!-- footer -->
    <jsp:include page="../common/footer.jsp" />
    

</body>
</html>