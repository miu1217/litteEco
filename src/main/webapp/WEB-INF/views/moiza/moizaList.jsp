<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>LITTLE ECO</title>
 <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="/littleEco/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/littleEco/resources/assets/css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="/littleEco/resources/assets/css/demo.css" rel="stylesheet" />
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
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
       
       .content-card {
            background-color: #edf2f7;
            border-radius: 0.5rem;
            padding: 1rem;
            margin-bottom: 1rem;
            margin-left: 30px;
        }
        

        .grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
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
    </style>
</head>
<body>
    <%@ include file="../common/header.jsp" %>
    
    
    <div class="wrap">
         <div class="moiza_header" id="moiza_title">
            <p class="title_text">MOIZA</p>
        </div><!--//notice header-->
        
        <div class="btn_area">
        	<button type="button" id="ibtn" class="btn btn-info btn-fill pull-right"> MOIZA</button>
        </div>
        <div class="grid">
            <div class="content-card">
            </div>
        </div>
    </div>
    
    <script>
    	$(function(){
    		selectMoizaList();
    		
    		$(document).on("click","#btn", function(){
				
				location.href = "moiza.ap?mno=" + mno;
			});
    		
			$(document).on("click","#ibtn", function(){
				
				location.href = "moizaInsert";
			});
    	});
    	
    	function selectMoizaList(){
    		$.ajax({
    			url:"moizaList",
    			success : function(result){
    				var str = "";
    				
    			
	    				for(var i in result){

	    					str += "<div id='mTitle' name='moziaTitle'>"+result[i].moizaTitle+"</div>"
	               				+ "<div id='mGoal' name='moizaGoal'>"+ result[i].moizaGoal+"</div>"
	               				+ "<div id='mName' name='moizaName'>"+ result[i].moizaName+"</div>"
	               				+ "<button type='button' id='btn' class='btn btn-info btn-fill pull-right'> 모집링크 </button>";
	               			
	               				
	
								$(".content-card").html(str);
	    				}
    				
    				
    			},error : function() {
					console.log("MOIZALIST 통신 오류");
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
