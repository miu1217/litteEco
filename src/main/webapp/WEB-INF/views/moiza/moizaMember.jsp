<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>LITTLE ECO</title> 
  
     <style>
        .layout {
            display: flex;
            height: 100vh;
            background-color: #f3f4f6; /* bg-gray-100 */
			
        }

		/*
        .button {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 0.375rem;
            font-size: 0.875rem;
            font-weight: 500;
            height: 2.5rem;
            padding: 0.5rem 1rem;
            width: 100%;
            background-color: #805ad5; /* bg-purple-500 
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #6b46c1; /* darker purple 
        }
*/
        .main-content {
            flex: 1;
            padding-top: 100px;
            padding-right: 280px;
            padding-left: 280px;
        }

        .dashboard {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 2.5rem;
        }

        .card,
        .card-large {
            background-color: white;
            padding: 1.25rem;
            border-radius: 0.5rem;
            box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1);
        }

        .card-large {
            grid-column: span 2;
        }
        
        .card-right{
        	display: grid;
        	grid-row-gap: 20px;
        }
        #moizaTable{
          text-align: left;
          width:100%;
        }
    
		#moizaApplyTable button{
			padding-right: 10px;
		}
        #moizaTable th{
           height: 45px;
           text-align: left;
        }

        #moizaTable td{
           height : 48px;
            text-align: left;
        }
     /*
       .btn-sm {
		    font-size: 12px;
		    border-radius: 3px;
		    padding: 5px 10px;
			 color: #3472F7; 
		}
		*/
		/*
		.btn-primary {
		    border-color: #3472F7;
		    color: #3472F7;
		}
		*/

		/*
		.btn {
		    border-width: 2px;
		    background-color: transparent;
		    font-weight: 400;
		    opacity: 0.8;
		    filter: alpha(opacity=80);
		    padding: 8px 16px;
		    border-color: #3472F7;
		    /* color: #3472F7; 
		    align-items: end;
		}
		*/
		
		.Title{
		    font-weight: bold;
			padding-bottom: 20px;
		}
 
      
	  /*버튼요소들 스타일 적용 영역*/

	  #memberBtn{
		background-color: #3472F7;
		color: #f3f4f6;
		width: 90px;
		height: 40px;
		border-style: none;
	  }

	  #idArea{width: 60px;}
	  #idArea2{width: 160px;}
	 .btn{
		border-radius: 3px;
		margin-right: 5px;
	 }
	  #applyBtn{
		background-color: #060d4e;
		color: #f3f4f6;
		width: 90px;
		height: 40px;
		border-style: none;
	  }
	  #holdBtn{
		background-color: #c7c7c7;
		color: #fff;
		border-style:none;
		width: 90px;
		height:40px;
	  }
	  #deleteBtn{
		background-color: #d92825;
		color: #f3f4f6;
		border-style: none;
		width: 90px;
		height: 40px;
	  }

	  #hApplyBtn{
		background-color: #060d4e;
		color: #f3f4f6;
		width: 90px;
		height:40px;
		border-style: none;
	  }
	  #hDeleteBtn{
		background-color: #d92825;
		color: #f3f4f6;
		width: 90px;
		height: 40px;
		border-style: none;
	  }


    </style>
</head>
<body>

<%@ include file="../common/header.jsp" %>
<div class="layout">
    <div class="main-content">
       <input type="hidden" id="mno" value="${mno}">
        <div class="dashboard">
            <div class="card-large">
            	<div class="Title">사용자 관리</div>
                  <div class="card-body table-full-width table-responsive">
                     <table class="table table-hover" id="moizaTable">
                                <thead>
                                     <th>ID</th>
                                     <th>Name</th>
                                    <th>Email</th>
                             </thead>
                           <tbody>   
                          </tbody>
                       </table>
                     </div>
            </div>
            
            <div class="card-right">
                <!-- Content for 요청 현황 and 누락 현황 -->
                <div class="card">
                	<div class="Title">요청 현황</div>
                	<table class="table table-hover" id="moizaApplyTable">
                           <tbody>   
                          </tbody>
                       </table>
                <!-- Content for 요청 현황 and 누락 현황 -->
            	</div>
           		<div class="card">
					<div class="Title">보류 현황</div>
					<table class="table table-hover" id="moizaHoldTable">
                           <tbody>   
                          </tbody>
                       </table>
            	</div>
            </div>
        </div>
    </div>
</div>
	<script>
	
		
		$(function(){
			moizaMemberList();
			moizaApplyList();
			moizaHoldList();
			
			
			$(document).on("click","#holdBtn", function(){
				
				var memberNo = $(this).closest('tr').find('input[type="hidden"]').val();
				var mno = $("#mno").val();
				location.href="memberHold?memberNo=" + memberNo + "&moizaNo=" +mno;
				
				
			});
			
			$(document).on("click","#deleteBtn", function(){
							
				var memberNo = $(this).closest('tr').find('input[type="hidden"]').val();
				var mno = $("#mno").val();
				location.href="memberApplyDelete?memberNo=" + memberNo + "&moizaNo=" +mno;
				
				
			});
			
			
			$(document).on("click","#hDeleteBtn", function(){
				
				var memberNo = $(this).closest('tr').find('input[type="hidden"]').val();
				var mno = $("#mno").val();
				location.href="memberApplyDelete?memberNo=" + memberNo + "&moizaNo=" +mno;
				
				
			});
			
			$(document).on("click","#applyBtn", function(){
				
				var memberNo = $(this).closest('tr').find('input[type="hidden"]').val();
				var mno = $("#mno").val();
				location.href="memberApplyAccept?memberNo=" + memberNo + "&moizaNo=" +mno;
				
				
			});
			
			$(document).on("click","#hApplyBtn", function(){
				
				var memberNo = $(this).closest('tr').find('input[type="hidden"]').val();
				var mno = $("#mno").val();
				location.href="memberApplyAccept?memberNo=" + memberNo + "&moizaNo=" +mno;
				
				
			});
			

			$(document).on("click","#memberBtn", function(){
				
				var memberNo = $(this).closest('tr').find('input[type="hidden"]').val();
				var mno = $("#mno").val();
				location.href="memberDelete?memberNo=" + memberNo + "&moizaNo=" +mno;
				
				
			});
		});
	
		
		function moizaMemberList() {
			$.ajax({
				url : "moizaMemberList",
				data : {mno : $("#mno").val()},
				success : function(result) {
					var str = "";
					
					
					for(var i in result){
						str +="<tr>"
							+ "<td>" +result[i].memberId +"</td>"
							+ "<td>" +result[i].memberName +"</td>"
							+ "<td>" +result[i].email +"</td>"
							+ "<td><input type='hidden' value='"+result[i].memberNo+"'></td>"
							+"<td> "
							+"<button type='button' id='memberBtn'class='btn btn-primary btn-sm'>내보내기</button>"
							+"</td>"
							+"</tr>"
							+"<hr>";
							
							
						$("#moizaTable tbody").html(str);
							
						
					}
					
				},error : function() {
					console.log("MOIZAMEMBERLIST 통신 오류");
				}
				
			}); 
		}
	
		function moizaApplyList() {
			$.ajax({
				url : "moizaApplyList",
				data : {mno : $("#mno").val()},
				success : function(result) {
					var str = "";
					
					
					for(var i in result){
						str +="<tr>"
							+ "<td>" +result[i].memberName +"</td>"
							+ "<td><input type='hidden' value='"+result[i].memberNo+"'></td>"
							+"<td> "
							+"<button type='button' id='applyBtn'class='btn btn-primary btn-sm'>수락</button>"
							+"<button type='button' id='holdBtn'class='btn btn-primary btn-sm'>보류</button>"
							+"<button type='button' id='deleteBtn'class='btn btn-primary btn-sm'>삭제</button>"
							+"</td>"
							+"</tr>"
							+"<hr>";
							
							
						$("#moizaApplyTable tbody").html(str);
							
						
					}
					
				},error : function() {
					console.log("MOIZAMEMBERLIST 통신 오류");
				}
				
			}); 
		}
		
		
		function moizaHoldList() {
			$.ajax({
				url : "moizaHoldList",
				data : {mno : $("#mno").val()},
				success : function(result) {
					var str = "";
					
					
					for(var i in result){
						str +="<tr>"
							+ "<td>" +result[i].memberName +"</td>"
							+ "<td><input type='hidden' value='"+result[i].memberNo+"'></td>"
							+"<td> "
							+"<button type='button' id='hApplyBtn'class='btn btn-primary btn-sm'>수락</button>"
							+"<button type='button' id='hDeleteBtn'class='btn btn-primary btn-sm'>삭제</button>"
							+"</td>"
							+"</tr>"
							+"<hr>";
							
							
						$("#moizaHoldTable tbody").html(str);
							
						
					}
					
				},error : function() {
					console.log("MOIZAMEMBERLIST 통신 오류");
				}
				
			}); 
		}
	</script>

<jsp:include page="../common/footer.jsp" />
</body>
</html>