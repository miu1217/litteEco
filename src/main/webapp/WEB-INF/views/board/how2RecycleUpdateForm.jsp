 
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
    
        .recycle_header {
            width: 100%;
            height: 180px;
            position: relative;
        }

               #tit{
            font-size: 40px;
            font-weight: 400;
            display: flex;
            justify-content: center;
            margin-top: 60px;
            margin-bottom: 60px;
        }
           #tit a{
           text-decoration: none;
           color: #000;
        }
        
        
        .recycle_write {
            height: auto;
        }

        .recycle_write_table {
        text-align:left;
            width: 60%;
            border-top: 3px solid black;
            border-collapse: collapse;
            border-bottom: 3px solid black;
        }


       
       .recycle_write td {
            color: #6E6E6E;
            text-align: left;
                font-family: 'Noto Sans KR', sans-serif;
            border-bottom: 1px solid #D8D8D8;
            height: 40px;
            padding: 5px;
        }

       .recycle_write th {
			font-family: 'Noto Sans KR', sans-serif;
            border-bottom: 1px solid #D8D8D8;
            height: 40px;
            padding: 5px;
        }
        #thumImg{
            text-align: center;
        }
        #tdimg{
            list-style: none;
            display: flex;
        }
      
        #titleTr input[type="text"] {
            width: 100%;
            height: 35px;
            border: 1px solid #BDBDBD;
            color: #585858;
            font-size: 15px;
            font-family: 'Noto Sans KR', sans-serif;
            padding: 5px
        }

        #contentTr>textarea {
            border: 1px solid #BDBDBD;
            color: #585858;
            font-size: 15px;	
            font-family: 'Noto Sans KR', sans-serif;
            width: 100%;
            resize: none;
            padding: 5px;
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
        
      <div id="tit"><a href="rblist.hrb" style="text-decoration:none;">How2Recycle</a></div><!--//notice header-->
        
        <form id="enrollForm" method="post" action="rbUpdate.hrb" enctype="multipart/form-data"> 
        <div class="recycle_write">
            <table class="recycle_write_table" align="center">
                <tbody>
                    <tr class="tableCol" id="titleTr">
                    	
                        <td colspan="2">
                            <input type="text" name="recycleBoardTitle" id="rbTitle" replaceholder="제목" value="${rb.recycleBoardTitle }" required>
                        </td>
                    </tr>
                    <tr class="tableCol" id="rbWriter">
                        <td colspan="2">
                            <input type="text"  id="bwriter" value="관리자" readonly>
                        </td>
                    </tr>
                   
 
                     <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td><input type="file" id="reUpFile" class="form-control-file border" name="reUpFile" ></td>
                    </tr>
                    
                    <tr id="contentTr" >
                        <th colspan="2">
                            <!--summernote api-->
                            <textarea name="recycleBoardContent" id="content" class="summernote" cols="30" rows="10" placeholder="본문입력"  style="resize:none;"  required>
                            ${rb.recycleBoardContent }
                            </textarea>
                           
                        </th>
                        <td>
                        	<input type="hidden" name="rbno" value="${rb.boardNo }">
                        </td>
                    </tr>
                    
                </tbody>
				
            </table>
            
            
            <br><br>
<!--             <div id="file-area" >
            	<input type="file" id="upFile" name="upFile" onchange="loadImg(this,1)" >
            </div> -->
            
        </div><!--//notice write-->
        

        <div class="btn_area">
            <button type="submit" class="nBtn" id="cBtn" onclick="location.href='rblist.hrb'">취소하기</button>
            <button type="submit" class="nBtn" id="sBtn" >수정하기</button>
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
                    $("#upFile").click();
                });
    
            });
	           
            
     function loadImg(inputFile,num){
							    
							        if(inputFile.files.length == 1){
							          var reader = new FileReader();
							          
							          reader.readAsDataURL(inputFile.files[0]);
							
							        
							          reader.onload = function(e){
							        	
							        		  $("#thumbImg").attr("src",e.target.result);
							        	  }
							        }else{
							        		  $("#thumbImg").attr("src",null);
							        	  }
							        
							      }
     
       
    </script>



</body>
</html>