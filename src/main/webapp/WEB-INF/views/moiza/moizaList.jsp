<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>LITTLE ECO</title>
 	
    
</head>
    <style>
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
        
       }
       
       .btn_area{
       	margin-bottom: 70px;
       	margin-right: 50px;
       	
       }
      

        .container {
            display: flex;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            margin-bottom: 30px;
            margin-left: 30px;
            
        }
        
         .content-card {
            background-color: #fffff;
           	
            border-radius: 0.5rem;
            padding: 1rem;
            margin-bottom: 30px;
            margin-left: 140px;
            margin-right: 55px;
            width: 600px;
            border: 1px solid #002C7B;
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
		
		#loadMoreBtn{
			margin-left: 920px;
			margin-bottom: 30px;
			 background-color: #002C7B;
		}
		
		#mTitle{
			font-weight: bold;
		}
    </style>
</head>
<body>

    <%@ include file="../common/header.jsp" %>
    
    
    <div class="wrap">
         <div class="moiza_header" id="moiza_title">
            <p class="title_text">MOIZA</p>
        </div><!--//notice header-->
        
        <c:if test="${not empty loginUser}">
        <div class="btn_area">
        	<button type="button" id="ibtn" class="btn btn-info btn-fill pull-right"> MOIZA</button>
        </div>
        </c:if>
       
        <div class="container">
        </div>
        	<button type="button" id="loadMoreBtn" class="btn btn-info btn-fill">더보기</button>
    </div>
    
    <script>
    var page = 1; // Initial page number
    var reviewsPerPage = 9;
    	$(function(){
    		selectMoizaList();
    		
    		$(document).on("click","#btn", function(){
				
				location.href = "moiza.ap?mno=" + mno;
			});
    		
			$(document).on("click","#ibtn", function(){
				
				location.href = "moiza.in";
			});
			
			
			
			$(document).on("click", ".content-card", function(){
			    var mno = $(this).find('input[name="moizaNo"]').val();
			    location.href = "moiza.de?mno=" + mno;
			});
			
			
		        // $(document).ready에서 한 번 실행
		        $(document).ready(function () {
		            // 초기 로드
		            loadMoreReviews();
		            // 클릭 이벤트 핸들러 등록
		            $("#loadMoreBtn").click(selectMoizaList);
		           
		        });
			
    	});
    	
    	function selectMoizaList(){
    		$.ajax({
    			url:"moizaList",
    			data: { page: page },
    			success : function(result){
    				var str = "";
    				
	    				for(var i in result){

	    					str += "<div class= 'container'>"
	    						+"<div class= 'content-card'>"
	    						+ "<input type='hidden' id='mnNo' name='moizaNo' value='"+ result[i].moizaNo + "'>"
	    						+ "<div id='mTitle' name='moziaTitle'>"+result[i].moizaTitle+"</div>"
	               				+ "<div id='mGoal' name='moizaGoal'>"+ result[i].moizaGoal+"</div>"
	               				+ "<div id='mName' name='moizaName'>"+ result[i].moizaName+"</div>"
	               				+ "</div>"
	               				+ "</div>";
	
								$(".container").html(str);
	    				}
    				
	    			
    				
    			},error : function() {
					console.log("MOIZALIST 통신 오류");
				},complete: function () {
                    // Increment the page number for the next load, regardless of success or error
                    page++;
                }
    		});
    	}
    
    </script>
    <script>
    function loadMoreReviews() {
               
                $.ajax({
                    url: "moizaMore",
                    type: "GET",
                    data: { page: page },
                    success: function (data) {
                        console.log('sccuess');
                        console.log(data);
                        // Iterate through the received reviews and append them to the review tab
                            $.each(data, function (index, pm) {
                            var productHtml = '<div class="product"data-category-no="'+pm.categoryNo+'" data-product-no="'+pm.productNo+'" data-product-name="'+pm.productName+'">';
                            productHtml += '<div class="product-info"><img src="${contextPath}'+pm.imgsrc+'" id="product-img" data-product-no="'+pm.productNo+'" onclick="productDetail(this)">';
                            productHtml += '<div id="product-name"><p>'+pm.productName+'</p></div>';
                            productHtml += '<div class="product-infomation"><p>'+pm.categoryName+'</p></div>';
                            productHtml += '<div class="product-foot"><div class="product-price"><p id="product-price">'+pm.productPrice+'원</p>';
                            productHtml += '</div><div class="product-compare"><img src="${contextPath }/resources/assets/icons/plus.svg" class="plusIcon" /> <span>비교하기</span></div>';
                            productHtml += '</div></div></div>'; 
                            
                            var moizaHtml = "<div class= 'container'>"
                            	moizaHtml +="<div class= 'content-card'>"
                            	moizaHtml += "<input type='hidden' id='mnNo' name='moizaNo' value='"+ result[i].moizaNo + "'>"
                            	moizaHtml += "<div id='mTitle' name='moziaTitle'>"+result[i].moizaTitle+"</div>"
                            	moizaHtml +=  "<div id='mGoal' name='moizaGoal'>"+ result[i].moizaGoal+"</div>"
                            	moizaHtml +=  "<div id='mName' name='moizaName'>"+ result[i].moizaName+"</div>"
                            	moizaHtml +=  "</div>"
                            	moizaHtml +=  "</div>";
                            	
                            	
                            $("container").append(moizaHtml);
                        });
                    },
                    error: function () {
                        console.error("Error loading more reviews.");
                    },
                    complete: function () {
                        // Increment the page number for the next load, regardless of success or error
                        page++;
                    }
                });
            }
        
    </script>
    <%@ include file="../common/footer.jsp" %>
</body>

<script src="/littleEco/resources/assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="/littleEco/resources/assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="/littleEco/resources/assets/js/plugins/bootstrap-switch.js"></script>
<!--  Chartist Plugin  -->
<script src="/littleEco/resources/assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="/littleEco/resources/assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="/littleEco/resources/assets/js/light-bootstrap-dashboard.js?v=2.0.0 " type="text/javascript"></script>
<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="/littleEco/resources/assets/js/demo.js"></script>
</html>
