<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>회원가입 화면</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans&family=Noto+Sans+KR&display=swap" rel="stylesheet">

   <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <%@include file = "../common/header.jsp" %>
    
  </head>
  <style>
   body {
  font-family: 'Noto Sans KR', sans-serif;
  
  align-items: center;
  justify-content: center;
  height: 100vh;
  margin: 0;
  
}

.main {
  width: 60%;
  margin : auto;
  margin-top:100px;
  
}

.title {
  width: 60%;
  text-align: left;
}

.mypage-menu {
  background-color: #f0f0f0;
  padding: 10px;
  display: flex;
  justify-content: center;
  width: 100%;
  margin: 0px -5px;
  padding: 12px 6px;
  background-color: white;

}

.mypage-menu button {
    margin: 0px;
    border: none;
    background : none;
    font: inherit;
    position: relative;
    display: inline-flex;
    flex-direction: column;
    -webkit-box-pack: center;
    justify-content: center;
    vertical-align: top;
    text-align: center;
    box-sizing: border-box;
    padding: 12px 6px;
    cursor: pointer;
    touch-action: manipulation;
    white-space: nowrap;
    border-radius: 6px;
    
}

.mypage-menu button:hover{
    background-color: navy;
    color: white;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  display: flex;
}

li {
  margin-right: 15px;
}



.scrap-folder {
  display: flex;
  flex-wrap: wrap;
  text-align: center;
  margin: 20px auto 0px; /* 왼쪽과 오른쪽 여백을 조정하기 위해 음수 margin을 설정 */
  padding: 0px;
  padding-top: 0px;
  padding-bottom: 0px;
  transform: translateY(0px);
  margin-left: -10px;
  margin-right: -10px;
  line-height: 1;
  

}

.scrap-folder > div {
    position: relative;
  width: 22%;
  margin: 10px;
  box-sizing: border-box;
  padding: 0;
  margin: 0;
  margin-left: 10px;
  margin-right: 10px;
  margin-bottom: 20px;
  touch-action: auto;
  padding-top: 180px;
  border-radius: 4px;
  cursor: pointer;
  display: inline-block;
  text-align: center;
  padding-inline: 10px;
  align-items : center;

}

hr {
      border: 0;
  height: 2px;
  background-color: black;
}
.scrap-folder a {
  display: inline-block; /* inline-block으로 설정 */
    text-align: left; /* 가운데 정렬을 위해 왼쪽 정렬로 설정 */
    border: 0px;
    height: 100%;
    line-height: 100%; /* 텍스트 수직 정렬을 위해 line-height 추가 */
    vertical-align: middle; /* 텍스트 수직 정렬을 위해 vertical-align 추가 */
}



.scrapBtn {


}

/* 추가로 body에 마진을 줘서 양 옆 20%의 공백을 만듭니다. */
body {
  margin-left: 20%;
  margin-right: 20%;
}


    /* 초기에는 숨겨진 상태로 설정 */
    .checkbox-container {
      position: absolute;
      top: 0;
      right: 0;
      display: none;
    }

    /* 스타일링을 위한 추가적인 CSS */
    .checkbox-container input {
      margin-right: 5px;
      width : 20px;
      height : 20px;
    }

    .scrap {
      position: relative;
    }

.empty-space {
  width: 200px; /* 원하는 너비로 조절 */
  float: left; /* 좌측으로 부유(floating)되도록 설정 */
}

.empty-space2 {
  width: 200px; 
  float: right; 
}

hr {
  width: 100%;

  border: 0;
  height: 2px;
  background-color: black;
} 

#deleteBtn{
	display:none;
}


    /* 모달영역 */
    .mWrp{
      position: fixed;
      z-index: 200;
      padding-top: 250px;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgba(0,0,0,0.3);
      display: none;
    }
	.mBody {
	  width: 400px;
	  height: 500px;
	    padding: 40px 40px;
	    margin: 0 auto;
	    border: 1px solid #777;
	    background-color: #fff;
	    overflow: auto;
	    text-align: center;
	}
.mBody button {
    margin: 20px; /* 나머지 버튼들 간격 조정 */
    font-size: 20px;
    border: 0px;
    background: navy;
    color: white;
}
.mBody input{
	margin : 20px;
	width : 80%;
	height : 40px;
	text-align: center;
}
    .cBtn{
      float: right;
      font-weight: bold;
      color : #777;
      font-size: 25px;
      cursor: pointer;
    }
	.folder-chkBox{
		z-index : 999;
	}
	a{
	text-decoration-line: none;
	color : black;
	}
	.scrap-folder div{
		background-image:url(resources/img/folder3334.png);
		background-size : 120px 120px ;
		background-position : center ,center;
		background-repeat : no-repeat
	}
	

	.insert-folder:hover{
	        background-color: #0056b3; /* 버튼 배경색 변경 */
        color: #fff; /* 버튼 텍스트 색상 변경 */
	}
	.insert-folder{
				        /* 원하는 스타일을 여기에 추가하세요 */
        background-color: #007bff; /* 버튼 배경색 */
        color: #fff; /* 버튼 텍스트 색상 */
        border: 1px solid #007bff; /* 버튼 테두리 스타일 */
        border-radius: 5px; /* 버튼 테두리 둥글기 */
        padding: 8px 16px; /* 내부 여백 */
        cursor: pointer; /* 포인터 커서로 변경 */
	}
	

</style>
<body>
	<div class="empty-space">
	<%@include file = "../common/mypageSideBar.jsp" %>
</div>
    <div class="main" id="scrapTab">
        <div class="title">
        <h3>스크랩 북</h3>
        </div>
        <hr>
        <div class="mypage-menu" >
            <ul>
                <li><a href="scrap.mp" class="menu-link1" data-target="scrap"><button>스크랩</button></a></li>
                <li><a href="myPost.mp" class="menu-link" data-target="myPost"><button>내가 쓴 글</button></a></li>
                <li><a href="#" class="menu-link" data-target="my-replies"><button>내가 쓴 댓글</button></a></li>
                <li><a href="#" class="menu-link" data-target="likePost"><button>좋아요 한 글</button></a></li>
            </ul>
            <span id="update-area">
            <button id="toggleBtn">편집</button>
            <button id="toggleBtn2" style="display: none;">편집</button>
            <button id="deleteBtn" >선택 삭제</button>
             <button id="moveFolderBtn" style="display: none;" data-bs-toggle="modal" onclick="showConfirm();" data-bs-target="#addFolderModal">폴더 이동</button>
            </span>
        </div>
        <div id="content">
        <div class="folder-area">
            
                 <div class="scrapBtn">
                    <button class="insert-folder">
                        <div align="center" id="afBtn" data-bs-toggle="modal" onclick="showConfirmationDialog();" data-bs-target="#addFolderModal">폴더 추가</div>
                    </button>
                </div>
            <div class="scrap-folder" id="scarp-folder">
                <br>
                <br>
            </div>
        </div>
        
        </div>
    </div>
    
     <div class="mWrp" id="withdrawalConfirmationModal">
       	<div class="mBody">
            <span class="cBtn" onclick="hideConfirmationDialog();">&times;</span>
            <h2>새 폴더</h2>
            <p>폴더 이름을 입력해주세요.</p>
            <input type="text" id="addFolderInput" placeholder="">
            <button type="submit" id="addFolderBtn" onclick="confirmWithdrawal();">예</button>
            <button type="reset" onclick="hideConfirmationDialog();">아니오</button>
        </div>
    </div> 
    
		         <div class="mWrp" id="updateModal">
       	<div class="mBody">
            <span class="cBtn" onclick="hideModal();">&times;</span>
            <h2>폴더 이동</h2>
            <p>폴더를 선택해주세요</p>
            <select id="folderSelect2">

		    </select>
            <button type="submit" id="updateFolderBtn">예</button>
            <button type="reset" onclick="confirmHide();">아니오</button>
        </div>
    </div>

    
    <div class="empty-space2"> </div>
    <script type="text/javascript">
    
	    		// 폴더 조회
				function loadFolders() {
					    $.ajax({
					        url: "selectFolder.mp",
					        dataType: 'json',
					        success: function (result) {
					            //list가 배열이고 길이가 0보다 큰지 확인
					            if (Array.isArray(result) && result.length > 0) {
					                $("#scarp-folder").empty();
					
					                for (var i in result) {
					                    // 폴더 div 생성
					                    var folderDiv = $("<div class='scrap' data-target='scrapListContent'></div>");
					
					                    // 체크박스 생성
					                    var checkboxContainer = $("<div class='checkbox-container'>" +
					                        "<input type='checkbox' class='folder-chkBox'>" +
					                        "</div>");
					
					                    // 폴더 번호를 data-folder-no 속성으로 설정
					                    folderDiv.attr("data-folder-no", result[i].folderNo);
					
					                    // 폴더 이름 추가
					                    folderDiv.append("<a href=''>" + result[i].folderName + "</a>");
					
					                    // 폴더에 체크박스 컨테이너 추가
					                    folderDiv.append(checkboxContainer);
					
					                    // 스크랩 폴더 영역에 추가
					                    $("#scarp-folder").append(folderDiv);
					                    
					                    checkboxContainer.find('.folder-chkBox').click(function (e) {
					                        e.stopPropagation(); // 이벤트 전파 중단
					                    });
					                }
					            } else {
					                // list가 비어 있으면 메시지를 표시
					                $("#scarp-folder").empty().append("<div class='scrap' id='addLink'><a href='#'>폴더를 추가해보세요</a></div>");
					            	
					                
					                $("#addLink").click(function () {
					                    // 폴더 추가 모달을 나타나게 함
					                    $("#afBtn").click();
					                });
					            
					            
					            }
					        },
					        error: function () {
					            console.log("통신 오류");
					        }
					    });
					}
					
					loadFolders();

	    
	    	//폴더 추가 메소드
			$(document).ready(function() {
			    $("#addFolderBtn").click(function () {
			        var folderName = $("#addFolderInput").val();
			        
			        if (folderName != "") {
			            $.ajax({
			                url: "addFolder.mp",
			                data: {
			                    folderName: folderName,
			                    memberNo: "${loginUser.memberNo}"
			                },
			                success: function (result) {
			                    if (result.success) {
			                        alert(result.message);
			                        loadFolders();
			                    } else {
			                        alert(result.message);
			                    }
			                    $("#addFolderInput").val(""); // 입력 폼 비우기
			                },
			                error: function (error) {
			                    console.error("에러");
			                    alert("서버 오류");
			                }
			            });
			        } else {
			            alert("폴더 이름을 입력하세요.");
			        }
			    });
			    
			    loadFolders();
			});

			
			//편집 버튼 체크박스 활성화
			
			$("#toggleBtn").click(function(){
				
				var checkBox = $(".checkbox-container");
				var deleteBtn = $("#deleteBtn");
				
				checkBox.toggle();
				deleteBtn.toggle();
				
			});
			
			//폴더 삭제
			
			$("#deleteBtn").click(function () {
		    var chkBox = $(".folder-chkBox:checked");
		    var deletedCount = 0; //삭제 된 폴더 수
		
		    // 사용자에게 확인 메시지 표시
		    var confirmDelete = confirm("스크랩된 게시물은 전부 삭제됩니다. 삭제하시겠습니까?");
		    
		    if (confirmDelete) {
		        chkBox.each(function () {
		            var currentChk = $(this).closest('.scrap');
		            var folderNo = currentChk.data("folder-no");
		            
		            $.ajax({
		                url: "deleteFolder.mp",
		                type: "post",
		                data: {
		                    folderNo: folderNo
		                },
		                success: function (result) {
		                    if (result.success) {
		                        console.log(result);
		                        currentChk.remove();
		                        deletedCount++; // 각 폴더 삭제 시 카운트 증가
		
		                        // 요청 완료 후 얼러트 메세지 출력
		                        if (deletedCount === chkBox.length) {
		                            alert("총 " + deletedCount + "개의 폴더가 삭제되었습니다.");
		
		                            // 삭제 후 조회
		                            loadFolders();
		
		                            // 체크박스 및 선택삭제 버튼 감추기
		                            $("#toggleBtn").click();
		                        }
		                    } else {
		                        console.log("실패 로그");
		                        alert("삭제 실패");
		                    }
		                },
		                error: function (error) {
		                    console.error("에러");
		                    alert("서버 오류");
		                }
		            });
		        });
		    }
		});

			// 스크랩 북 메뉴바
			$(document).ready(function() {
			    $(".menu-link").on("click", function(e) {
			        e.preventDefault(); // 기존의 링크 동작 방지
			        
			        var target = $(this).data("target"); // 클릭한 메뉴의 data-target 속성 값
			        var url = target + ".mp"; // 로드할 페이지의 URL, 여기서는 "my-post.mp", "scrap-posts.mp" 등으로 가정

			        // Ajax를 이용해 해당 페이지를 동적으로 로드
			        $.ajax({
			            url: url,
			            method: "GET",
			            success: function(response) {
			                // 로드한 페이지를 #content 영역에 삽입
			                $("#content").html(response);
			            },
			            
			            error: function(error) {
			                console.error("오류", error);
			            }
			        });
			    });
			});
			
/* 			function onScrapFolderViewLoad() {
			    // "폴더 이동" 버튼을 표시
			    $("#moveFolderBtn").show();
			} */
			
			
			// 스크랩 뷰 페이지 불러올 함수
			function loadScrapView() {
			    //클릭한 폴더 번호
			    var folderNo = $(this).data("folder-no");
			    var target = $(this).data("target");
			    var url = target + ".mp";
			    //스크랩 뷰페이지용 편집버튼
			    $("#toggleBtn2").show();
			    $("#toggleBtn").hide();
			    // 동적 로드
			    $.ajax({
			        url: url,
			        method: "GET",
			        data: { folderNo: folderNo },
			        success: function(response) {
			            // 로드한 페이지를 #content 영역에 삽입
			            $("#content").html(response);
			            loadFoldersForMove();
			            
			            /* $("#toggleBtn").hide(); */
			        },
			        error: function(error) {
			            console.error("오류", error);
			        }
			    });
			}

			// 스크랩 폴더 뷰 페이지
			$(document).on("click", ".scrap", loadScrapView);

			//폴더 목록 가져오는 함수
			function loadFoldersForMove() {
	 
			    $.ajax({
			        url: "selectFolder.mp",
			        dataType: 'json',
			        success: function (result) {
			            if (Array.isArray(result) && result.length > 0) {
			                $("#folderSelect2").empty(); //기존 옵션 비우기

			                for (var i in result) {
			                    // 폴더 옵션 추가
			                    $("#folderSelect2").append("<option value='" + result[i].folderNo + "'>" + result[i].folderName + "</option>");
			                }
			            } else {
			                // 폴더 목록이 비어있을 때의 처리
			                console.log("폴더 목록이 비어 있습니다.");
			            }
			        },
			        error: function () {
			            console.log("통신 오류");
			        }
			    });
			}
			
			
			
 			//타 메뉴 클릭시 편집버튼 숨김
			$(".menu-link").on("click",function(){
			
				$("#toggleBtn").hide();
			}); 
			
			
		    //모달영역
		    function showConfirmationDialog() {
		        // 탈퇴 확인 모달을 보이게 함
		        $("#withdrawalConfirmationModal").show();
		    }

		    function hideConfirmationDialog() {
		        // 탈퇴 확인 모달을 감춤
		        $("#withdrawalConfirmationModal").hide();
		    }

		    function confirmWithdrawal() {
		    	
		    	$("#withdrawalConfirmationModal").hide();
		        // "예"를 선택하면 폼을 제출하고, "아니오"를 선택하면 폼 제출을 취소
		        return confirm;
		    }

		    $("#toggleBtn2").click(function () {
		        var checkBoxes = $(".checkbox-container2");
		        $("#moveFolderBtn").toggle();
		        checkBoxes.toggle(); // 체크박스 컨테이너 토글
		    });

		    
		    $(document).on("click", "#updateFolderBtn", function() {
		    	console.log("작동 되노");
		        loadScrapView.call(this);
		    });
		    

		    
		    function showConfirm(){
		    	
		    	$("#updateModal").show();
		    }
		    function hideModal(){
		    	$("#updateModal").hide();
		    	
		    }
		    function confirmHide(){
		    	$("#updateModal").hide();
		    }
		    function confirmBtn(){
		    	$("#updateModal").hide();
		    }

</script>


    	
    
    

		
		

    


        
    </body>
    </html>