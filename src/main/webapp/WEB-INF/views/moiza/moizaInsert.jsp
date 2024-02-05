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
            font-weight: 300;
            border:none;
        }

        .nBtn:hover {
            cursor: pointer;
        }

        #sBtn{
            background-color: #002C7B;
            color: #E6E6E6;
            border:none;
        }

        #sBtn:hover{
            color: white;
            background-color: #02215a;
        }

		#cBtn{border-style:none;}

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
         <form id="noticeInsertForm" method="post" action="moiza.in" enctype="multipart/form-data">
            <table class="moiza_write_table" align="center">
                <tbody>
                    <tr class="tableCol" id="titleTr">
                    	<th>
                    		<label for="mName">프로젝트명</label>
                    	</th>
                        <td colspan="2">
                            <input type="text" name="moizaName" id="mName" required>
                        </td>
                    </tr>
                    <tr class="tableCol" id="titleTr">
                    	<th>
                    		<label for="mTitle">한줄 소개</label>
                    	</th>
                        <td colspan="2">
                            <input type="text" name="moizaTitle" id="mTitle" required>
                        </td>
                    </tr>
                    <tr class="tableCol" id="titleTr">
                    	<th>
                    		<label for="mMission">미션</label>
                    	</th>
                        <td colspan="2">
                            <input type="text" name="moizaMission" id="mMission" required>
                        </td>
                    </tr>
                    <tr class="tableCol" id="titleTr">
                    	<th>
                    		<label>카테고리</label>
                    	</th>
                        <td class="form-group">
                          <input type="checkbox" id="category1" name="categoryNo" value="1"><label for="category1" class="checkboxCss item1">&nbsp 지속 가능 제품 </label>
                          <input type="checkbox" id="category2" name="categoryNo" value="2"><label for="category2" class="checkboxCss item2">&nbsp 사회적 기업 </label>
                          <input type="checkbox" id="category3" name="categoryNo" value="3"><label for="category3" class="checkboxCss item3">&nbsp 제로웨이스트 및 친환경 제품 </label>
                          <input type="checkbox" id="category4" name="categoryNo" value="4"><label for="category4" class="checkboxCss item4">&nbsp 친환경 교육 및 커뮤니티 </label>
                      
                         <br>
                          <input type="checkbox" id="category5" name="categoryNo" value="5"><label for="category5" class="checkboxCss item5">&nbsp 유기농 식품 </label>
                          <input type="checkbox" id="category6" name="categoryNo" value="6"><label for="category6" class="checkboxCss item6">&nbsp 주방 용품 </label>             
                          <input type="checkbox" id="category7" name="categoryNo" value="7"><label for="category7" class="checkboxCss item7">&nbsp 욕실 용품 </label>
                          <input type="checkbox" id="category8" name="categoryNo" value="8"><label for="category8" class="checkboxCss item8">&nbsp 생활 용품 </label>
                          <input type="checkbox" id="category9" name="categoryNo" value="9"><label for="category9" class="checkboxCss item9">&nbsp 패션 </label>
                        </td>
                    </tr>
                    <tr class="tableCol" id="contentTr">
                    	<th>
                    		<label for="mGoal">목표</label>
                    	</th>
                        <td colspan="2">
                            <textarea name="moizaGoal" id="mGoal" cols="30" rows="5" required></textarea>
                        </td>
                    </tr>
                    <tr class="tableCol" id="contentTr">
                    	<th>
                    		<label for="mInfo">단체 정보</label>
                    	</th>
                        <td colspan="2">
                            <textarea name="moizaInfo" id="mInfo" cols="30" rows="5" required></textarea>
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

	<script>
	 //카테고리 3개 제한
    $("input[type='checkbox']").on("click",function(){
    var count = $("input:checked[type='checkbox']").length;

    if(count>3){
      $(this).prop("checked",false);
      alert("카테고리는 최대 3개까지 선택할 수 있습니다");
    }

  });
	</script>

   	<!-- footer -->
    <jsp:include page="../common/footer.jsp" />
    

</body>
</html>