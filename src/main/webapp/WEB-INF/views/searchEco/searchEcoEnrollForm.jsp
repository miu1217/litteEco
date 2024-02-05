
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LITTLE ECO</title>
 <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&family=Noto+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">




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
    
        .searchEco_header {
            width: 100%;
            height: 180px;
            position: relative;
        }

        #tit{
            font-size: 42px;
            font-weight: 400;
            display: flex;
            justify-content: center;
            margin-top: 35px;
            margin-bottom: 60px;
        }
           #tit a{
           text-decoration: none;
           color: #000;
        }
        
        
        .searchEco_write {
            height: auto;
        }

        .searchEco_write_table {
        text-align:left;
            width: 60%;
            border-top: 3px solid black;
            border-collapse: collapse;
            border-bottom: 3px solid black;
        }


       
       .searchEco_write td {
            color: #6E6E6E;
            text-align: left;
                font-family: 'Noto Sans KR', sans-serif;
            border-bottom: 1px solid #D8D8D8;
            height: 40px;
            padding: 5px;
        }

       .searchEco_write th {
			font-family: 'Noto Sans KR', sans-serif;
            border-bottom: 1px solid #D8D8D8;
            height: 40px;
            padding: 5px;
        }
        #thumImg{
            
        }
        #tdimg{
            list-style: none;
            display: flex;
        }
        
        tbody th {
        	width: 120px;
        
        }
        
        tbody input[type="text"] {
        	width: 80%;
            border: 1px solid #BDBDBD;
            font-family: 'Noto Sans KR', sans-serif;
            color: #585858;
            height:28px;
        }
        


        #contentTr textarea {
            border: 1px solid #BDBDBD;
            color: #585858;
            font-size: 15px;	
            font-family: 'Noto Sans KR', sans-serif;
            resize: none;
            padding: 5px;
            width: 80%;
            height: 200px;
        }

        textarea:focus {
            outline: none;
        }

		#fileDrop{
			width:200px;
			border: 1px solid #BDBDBD;
		}
		
		.divUploaded{
			text-align: center;
			width: 200px;
		}
        .btn_area {
            width: 100%;
            height: 100px;
            text-align: center;
            margin-top: 60px;
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
        
        #fileDrop{
        	width:600px;
        	height: 100px;
        	margin: 1px dashed black;
        }
        .divUploaded{
        	float:left;
        	width: 150px;
        }
        
	#ulBtn{
	 text-align: left;
	}
    </style>
    


</head>
<body>
  <%@ include file="../common/header.jsp" %>

    <div class="wrap">
        
      <div id="tit"><a href="searchEco.bo" style="text-decoration:none;">SEARCH ECO</a></div>
        
        <form id="enrollForm" method="post" action="searchEcoInsert.bo" enctype="multipart/form-data"> 
        <div class="searchEco_write">
            <table class="searchEco_write_table" align="center">
                <tbody>
                    <tr class="tableCol" id="titleTr">
                    	<th>제목</th>
                        <td>
                            <input type="text" name="ecoBoardTitle" id="seTitle" replaceholder="제목" required>
                        </td>
                    </tr>

                    <tr class="tableCol" id="nameTr">
                    	<th>브랜드 이름</th>
                        <td>
                            <input type="text" name="brandName" id="bName" required>
                        </td>
                    </tr>
                    <tr class="tableCol" id="seWriter">
                    	<th>작성자</th>
                        <td>
                            <input type="text"  id="bwriter" value="관리자" readonly>
                        </td>
                    </tr>
                    <!-- 
                    <tr>
                        <th id="thumbnail" width="80px">대표이미지</th>
                        <td colspan="2" id="thumImg" >
                            <!-- <img id="thumbImg" name="thumImg" width="300px" height="100px"> 
                			<input type="file" name="upFile" id="upFile">
                        </td>

                    </tr>
                     -->
 <%-- 
                	<tr>
						<th>상세이미지</th>
						<td>
							<!-- <img id="contentImg1" width="300px" height="100px"> -->
							<input type="file" name="upFileDetail" id="upFile<!--  -->">
						
						</td>
					</tr> --%>
                   <!--  <tr id="brandURLTr">
                    	<th>브랜드 URL</th>
                        <td>
                            <input type="text"  id="brandUrl" name="brandUrl" required>
                        </td> 
                    </tr>
                    <tr id="brandInfoTr">
                    	<th>브랜드 INFO</th>
                        <td>
                            <input type="text"  id="brand-info" name="brandInfo" required>
                        </td> 
                    </tr> -->
                    <tr  id="contentTr" >
                    	<th>내용</th>
                        <td>
                            <!--summernote api-->
                            <textarea name="ecoBoardContent" id="content" class="summernote" placeholder="본문입력"  style="resize:none;" required></textarea>
                        </td>
                    </tr>
      
                </tbody>

            </table>
            
            
            <br><br>
          <div id="file-area">
				<input type="file" id="file1" name="file1" onchange="loadImg(this,1)"> <!-- 대표이미지 필수  -->
				<input type="file" id="file2" name="file2" onchange="loadImg(this,2)">
				<input type="file" id="file3" name="file3" onchange="loadImg(this,3)">
			
			</div>
			
            
        </div><!--//notice write-->
        

        <div class="btn_area">
            <button type="submit" class="nBtn" id="cBtn" onclick="location.href='searchEco.bo'">취소하기</button>
            <button type="submit" class="nBtn" id="sBtn" >작성하기</button>
        </div>
	</form>
    </div><!--//wrap-->




    </div>
      <%@ include file="../common/footer.jsp" %>

    <script>

           
    
	$(document).ready(function() {
		
			$(".summernote").summernote({
			  height: 300,                 // 에디터 높이
				  minHeight: null,             // 최소 높이
			      maxHeight: null,             // 최대 높이
				  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				  lang: "ko-KR",					// 한글 설정
				  placeholder: '최대 2048자까지 작성 가능합니다.',	//placeholder 설정
			 	  toolbar: [
				    // [groupName, [list of button]]
				    ['fontname', ['fontname']],
				    ['fontsize', ['fontsize']],
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    ['color', ['forecolor','color']],
				    ['table', ['table']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']],
				    ['insert',['picture','link','video']],
				    ['view', ['fullscreen', 'help']]
				  ],
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
// 				callbacks: {
// 					onImageUpload: function(files,editor,welEditable){
// 						for(var i = files.length-1;i>0=;i--){
// 							uploadSummernoteImageFile(files[i],this);
// 						}
// 					}
// 				}
				
			});
		});

       
 $(function(){
                $("#file-area").hide(); //file input 숨기기
                //대표이미지를 클릭하면 input file 요소 1번이 클릭되게 하는 함수
                $("#thumbImg").click(function(){
                    $("#file1").click();
                });
                $("#contentImg1").click(function(){
                    $("#file2").click();
                });
                $("#contentImg2").click(function(){
                    $("#file3").click();
                });
            });
           
            
            //이미지를 읽어줄 함수 
            function loadImg(inputFile,num){
                //inputFile : 이벤트가 발생된 요소 객체 
                console.log(inputFile.files);
                //inputFile.files : 파일업로드 정보를 배열의 형태로 반환해주는 속성
                //파일을 선택하면 files속성의 length가 1이 반환됨
                if(inputFile.files.length == 1){ //파일이 등록되면 
                    //해당 파일을 읽어줄 FileReader라고 하는 자바스크립트 객체를 이용한다.
                    var reader = new FileReader();
                    //파일을 읽어줄 메소드 : reader.readAsDataURL(파일)
                    //해당 파일을 읽어서 고유한 url을 부여해주는 메소드 
                    //반환받은 url을 미리보기 화면에 넣어주면 된다. 
                    reader.readAsDataURL(inputFile.files[0]);

                    //해당 reader객체가 읽혀진 시점에 img src속성에 부여된 고유 url을 넣어주기
                    reader.onload = function(e){//e : event 객체
                        console.log(e);
                        //이벤트 객체에서 reader가 부여한 고유 url 정보 
                        //event.target.result 
                        console.log(e.target.result);

                        switch(num){
                            case 1: $("#thumbImg").attr("src",e.target.result); break;
                            case 2: $("#contentImg1").attr("src",e.target.result); break;
                            case 3: $("#contentImg2").attr("src",e.target.result); break;
                        }

                    }

                }else{//length가 1이 아니면 
                    switch(num){
                            case 1: $("#thumbImg").attr("src",null); break;
                            case 2: $("#contentImg1").attr("src",null); break;
                            case 3: $("#contentImg2").attr("src",null); break;
                        }

                }
            }

       
    </script>



</body>
</html>