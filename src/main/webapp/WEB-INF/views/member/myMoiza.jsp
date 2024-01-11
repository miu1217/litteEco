<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>LITTLE ECO</title>
 	
    
</head>
    <style>
		.wrap {
		  width: 60%; /* 뷰 페이지의 너비를 현재 페이지의 60%로 조절 */
		  height: 100vh; /* 페이지 전체 높이만큼 설정 */
		  margin-left: 20%; /* 뷰 페이지를 오른쪽으로 이동시켜서 여백과 겹치지 않게 함 */
		
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
        
        btn{
        	width: 100%;
            height: 100px;
            text-align: center;
            margin-top: 60px;
            margin-bottom: 50px;
        }
        
       #btn{
       background-color: #002C7B;
       border: #002C7B;
       
       }
        #ibtn{
       background-color: #002C7B;
       border: #002C7B;
        margin-right: 20px;
       }
       
       .btn_area{
       	margin-bottom: 50px;
       }
      

        .container {
            gap: 10px;
            display:flex;
            flex-wrap: wrap;
            
        }
        
         .content-card {
         flex: 1 0 calc(50% - 10px); /* 50% - gap */
            background-color: #edf2f7;
            border-radius: 0.5rem;
            padding: 1rem;
            margin-bottom: 30px;
            margin-left: 55px;
            width: 400px;
        }
        
        .text-center {
            text-align: center;
        }
        
        .text-6xl {
            font-size: 3.75rem;
        }
        
        .text-2xl {
            font-size: 1.25rem;
        }
        
        .font-semibold {
            font-weight: 600;
        }
        
        .mb-12 {
            margin-bottom: 3rem;
        }
        
        .mb-4 {
            margin-bottom: 1rem;
        }
        
        .text-right {
            text-align: right;
        }
        
        .w-full {
            width: 100%;
        }
        
        .py-2 {
            padding-top: 0.5rem;
            padding-bottom: 0.5rem;
        }
        
        .mt-4 {
            margin-top: 1rem;
        }
        
        .bg-blue-500 {
            background-color: #3498db;
        }
        
        .hover\:bg-blue-600:hover {
            background-color: #2980b9;
        }
        
        .rounded {
            border-radius: 0.25rem;
        }
        
        #btn {
		    background-color: #002C7B;
		    border: #002C7B;
		}
		.btn-info.btn-fill {
		    color: #FFFFFF;
		    background-color: #1DC7EA;
		    opacity: 1;
		    filter: alpha(opacity=100);
		}
		.btn.btn-fill {
		    color: #FFFFFF;
		    background-color: #888888;
		    opacity: 1;
		    filter: alpha(opacity=100);
		}
		[type=reset], [type=submit], button, html [type=button] {
		    -webkit-appearance: button;
		}
		.btn-info {
		    border-color: #1DC7EA;
		    color: #1DC7EA;
		}
		.btn {
		    border-width: 2px;
		    background-color: transparent;
		    font-weight: 400;
		    opacity: 0.8;
		    filter: alpha(opacity=80);
		    padding: 8px 16px;
		    border-color: #888888;
		    color: #888888;
		}
		.btn {
		    -webkit-transition: all 100ms ease-in;
		    -moz-transition: all 100ms ease-in;
		    -o-transition: all 100ms ease-in;
		    -ms-transition: all 100ms ease-in;
		    transition: all 100ms ease-in;
		}
		.btn-info {
		    color: #fff;
		    background-color: #17a2b8;
		    border-color: #17a2b8;
		}
		.btn {
		    display: inline-block;
		    font-weight: 400;
		    text-align: center;
		    white-space: nowrap;
		    vertical-align: middle;
		    -webkit-user-select: none;
		    -moz-user-select: none;
		    -ms-user-select: none;
		    user-select: none;
		    border: 1px solid transparent;
		    padding: 0.5rem 0.75rem;
		    font-size: 1rem;
		    line-height: 1.25;
		    border-radius: 0.25rem;
		    transition: all .15s ease-in-out;
		}
		.pull-right {
		    float: right;
		}
		
.empty-space {
  width: 20%;
  height: 100vh;
  position: absolute;
  top: 20; /* 페이지 상단에 고정 */
}

    hr {
      width: 100%;
    
      border: 0;
      height: 2px;
      background-color: black;
    } 

    </style>
</head>
<body>

    <%@ include file="../common/header.jsp" %>
    
       <div class="empty-space">
    <%@include file="../common/mypageSideBar.jsp" %>
       </div>
    <div class="wrap">
         <div class="moiza_header" id="moiza_title">
            <p class="title_text">MOIZA</p>
            
        </div><!--//notice header-->
        <h3>참여중인 그룹</h3>
            <hr>
            <br>
            <br>
            <br>
        

        <div class="container">
        </div>
    </div>
		<div class="empty-space"></div>
    
    <script>
    	$(function(){
    		selectMoizaList();
    		

			
			
			
			$(document).on("click", ".content-card", function(){
			    var mno = $(this).find('input[name="moizaNo"]').val();
			    location.href = "moiza.de?mno=" + mno;
			});

			
    	});
    	
    	function selectMoizaList(){
    		$.ajax({
    			url:"moizaList.mp",
    			success : function(result){
    				var str = "";
    				
	    				for(var i in result){

	    					str += "<div class= 'container'>"
	    						+"<div class= 'content-card'>"
	    						+ "<input type='hidden' id='mnNo' name='moizaNo' value='"+ result[i].moizaNo + "'>"
	    						+ "<div id='mTitle' name='moziaTitle'>"+result[i].moizaTitle+"</div>"
	               				+ "<div id='mGoal' name='moizaGoal'>"+ result[i].moizaGoal+"</div>"
	               				+ "<div id='mName' name='moizaName'>"+ result[i].moizaName+"</div>"
	               				+ "<button type='button' id='btn' class='btn btn-info btn-fill pull-right'> 모집링크 </button>"
	               				+ "</div>"
	               				+ "</div>";
	
								$(".container").html(str);
	    				}
    				
    				
    			},error : function() {
					console.log("MOIZALIST 통신 오류");
				}
    		});
    	}
    	

    </script>
    
</body>


</html>
