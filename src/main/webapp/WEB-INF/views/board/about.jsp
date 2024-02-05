<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <title>LITTLE ECO</title>
    <style>
        .wrap{
            /* border: 1px solid black; */
            height: auto;
            width: 100%;
        }
        .about_cont{
            width: 100%;
            height: auto;
        }
        .tit{
            text-align: center;
            font-size: 40px;
            font-weight: 400;
            margin-top: 100px;
            padding-bottom: 80px;
        }

        .about_cont{
            height: auto;
            text-align: center;
            /* border: 1px solid red; */
        }
        .con1{
            margin-bottom: 100px;
            position: relative;
            transform: translate();
       
        }

        #sText01{
            position: absolute;
            top: 0;
            left: 0;
        transform: translate(125%,50%);
        }
        #text01{
            font-size: 36px;
            color: #d4d4d4;
        }
        #subText01{
            font-size: 16px;
            color: #d4d4d4;
            font-weight: 300;
        }

        .con2{
            margin-left: -250px;
            position: relative;
        }

        #sText02{
            float: right;
            transform: translate(-70%,-200%);
            text-align: left;            
        }

        #text02,#text03,#text04{
            font-size: 26px;
        }
        #subText02,#subText03,#subText04{
            font-size: 12px;
        }

        #con2_2{
            float: right;
            transform: translate(40%,-15%);
        }
        #sText03{
            /* float: left; */
            margin-left:700px;
            margin-top: 100px;
            text-align: left;
        }
  
      
        .con3{
           /*  background-color: violet;  */
            /* text-align: center; */
            margin-top: 150px;
            transform: translate(-10%,20%);
            width: 100%;
            height: 500px;

        }
        
        .con3 img {
        	float: left;
        	margin-left: 30%;
        }
        #sText04{
            float: left;
            /* transform: translate(-100%,-100%); */
            text-align: left;
            position: absolute;
            top: 200px;
            right: 20%;
        }
        .con4{
            /* border: 1px solid blue; */
        /*    text-align: center;*/
            margin-top: 250px;
            padding-bottom: 100px;
            height: auto;
            width:100%;
            
        }
        .con4 >table{
            background-color: #e6e6e6;
            
            /* width: 1200px; */
           /*  transform: translate(5%); */
            width: 100%;
            /* border: 1px solid black; */
        }
        #datatable ul{
            padding-top: 30px;
            list-style: none;
            padding-left: 0;
        } 

        #datatable{
			width:1000px;
            /* padding: 60px 1500px; */
            text-align:center;
			
        }
        #tTit{
        
/*         	margint-left:80px; */
/*             padding-top: 90px; */
		   /*  padding-left: 350px;
		    padding-top: 90px; */
		    padding: 90px;
            font-size: 50px;
            padding-bottom: 30px;
            color: #454545;
            text-align:center;
        }
        #tsTxt{
            font-size: 14px;
            padding-bottom: 40px;
        }

        .data-area{
            width: 320px;
            height: 400px;
            background-color: #fff;
            margin-left: 20px;
            margin-right: 20px;
            margin-bottom: 80px;
            
        }
        #data1{
        	padding-left:20px;
        }
        #data3{
        	padding-rihgt:20px;
        }
        

        .num{
            padding-top: 40px;
            font-size: 100px;
            font-weight: 100;
            color: rgb(46, 139, 147);
        }
        .dtit{
            font-size: 14px;
            font-weight: 400;
            color: #454545;
            padding-top: 40px;
        }
        #unit{
         
            font-size: 18px;
            font-weight: 400;
            color: #5e5e5e;
        }

        .line{
            margin-top: 40px;
            margin-left: 100px;
            margin-bottom: 30px;
            padding-bottom: 50px;
            width: 100px;
            height: 80px;
            border-top: 2px solid gray;
        }
        .tbcon{
            padding-left: 50px;
        }
        #tbtxt{
            font-size: 30px;
            font-weight: 400;
            color: #454545;
            /* padding-left: 70px; */
            /* padding-right: 50px; */
        }
        .middleLine{
            width: 20px;
            height: 3px;
            border-bottom: 2px solid blue;
        }
        .tbnum{
             padding-top: -18px; 
            font-size: 25px;
/*             vertical-align: middle; */
            padding-right: 20px;
            color: #454545;
        }
        .tbStxt{
            text-align: left;
            font-size: 34px;
            font-weight: 500;
            color: #515151;
            padding-left:30px ;
        }
        .tbstxt{
            padding-left: 30px;
            font-size: 14px;
            color: #454545;
        	padding-bottom: 30px;
        }
        .con5{
            text-align: center;
            /* transform: translate(25%); */
            margin-top: 8%;
            width: 100%;
        }
        .con5 table{
            text-align: center;
            width: 100%;
        }
        #leftline{
            height: 120px;
            border-right: 1px solid #a5a5a5;
        }
        #eTxt{
            padding-top: 40px;
            font-size: 35px;
            font-weight: 300;
            color: #454545;
            padding-bottom: 180px;
            padding-left: 30px;
        }

    </style>

</head>
<body>

   <%@ include file="../common/header.jsp" %>
    
<div class="wrap">
    <div class="tit">ABOUT</div>

    <div class="about_cont">
        <div class="con1" >
            <div><img src="resources/01_about/img01.png" alt="">
                <div id="sText01">
                <p id="text01">자원의 최소화,순환의 최대화</p>
                <p id="subText01">리틀에코는 자원순환을 위해 제품생산부터 재활용까지 <br>
                    전과정을 고민하고 대안하는 모든 브랜드를 응원합니다.</p>
                </div>
                </div>
            

        </div>
        <div class="con2" >
            <div id="con2_1"><img src="resources/01_about/img02.png" alt=""></div>
            <div id="sText02">
                <span id="text02">자원순환이란</span>
                <p id="subText02">폐기물(waste)발생을 최대한 줄이고 <br>
                                  사용한 폐기물에 대해서 재사용(reuse) 또는 재생이용(recovery)하며, <br>
                                  불가피하게 남은 폐기물은 환경에 미치는 영향을 최소화하여 <br>
                                  처리하는 것을 의미합니다.
                                </p></div>
            <div id="con2_2"><img src="resources/01_about/img03.png" alt=""></div>
            <div id="sText03"> 
                <span id="text03">자원순환을 위한 브랜드</span>
                <p id="subText03">리틀에코는 자원순환을 위한 제품을 <br>
                                  제작하는 브랜드들을 선별하여 정보를 제공하고, <br>
                                  회원들의 취향에 맞춰 회원별 브랜드 추천 서비스를 <br>
                                  제고하고 있습니다.
                                </p></div>
        </div>
        <div class="con3" >
            <div><img src="resources/01_about/img04.png" alt=""></div>
            <div id=sText04>      
                <span id="text04">자원순환을 위한 행동실천</span>
                <p id="subText04">자원순환을 위한 플로깅 또는 환경운동을 모집해 <br>
                                  회원들이 자신의 니즈에 맞춰 <br>
                                  참여할 수 있는 행동실천 모임을 모집하여 <br>
                                  자원순환과 환경보호에 한발 더 나아갈 수 있는 <br>
                                  행동 실천을 리틀에코가 함께합니다.
                                  
                                </p></div>
        </div>
        <div class="con4" align="center">
            <table id="datatable" align="center">
                <tr>
                    <th colspan="3" id="tTit">갈 곳 없는 폐기물</th>
                </tr>
                <tr>
                    <td colspan="3" id="tsTxt">
                        우리는 쉽게 쓰레기를 버리지만, <br>
                        그 쓰레기를 처리하는 시설은 피하고 있습니다.            
                    </td>
                    
                </tr>
                <tr>
                    <td >
                        <ul class="data-area" id="data1">
                            <li class="dtit">2021년도 폐기물 발생량(만톤)</li>
                            <li class="num" id="open-result-1"><span class="count">19738</span><span id="unit">t</span></li>
                            <li class="line"></li>
                            <li></li>
                        </ul>
                    </td>
                    <td>
                        
                        <ul class="data-area" id="data2">
                            <li  class="dtit">2021년도 재활용 총계(만톤)</li>
                            <li  class="num" id="open-result-2"><span class="count">17161</span><span id="unit">t</span></li>
                            <li class="line"></li>
                            <li></li>
                        </ul>
                        
                        
                    </td>
                    <td>
                        
                        
                        <ul class="data-area" id="data3">
                            <li  class="dtit"> 국내 폐자원 이용률</li>
                            <li  class="num"><span class="count">86.9</span><span id="unit">%</span></li>
                            <li class="line"></li>
                            <li></li>
                        </ul>

                    </td>
                </tr>
                <tr id="lastcon">
                    <td rowspan="2" id="tbtxt">자원순환의 4가지 실천</td>
                    <td>
                        <table class="tbcon">
                            <tr>
                                <td rowspan="2" class="tbnum">1</td>
                                <td class="middleLine"> </td>
                            
                                <td class="tbStxt">REduce</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="tbstxt">불필요한 것은 줄이고</td>
                            </tr>
                    </table>
                </td>
                    <td>
                        <table class="tbcon">
                            <tr>
                                <td rowspan="2" class="tbnum">3</td>
                                <td class="middleLine"> </td>
                            
                                <td class="tbStxt">REcycle</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="tbstxt">올바르게 재활용하고</td>
                            </tr>
                    </table>
                    </td>
                </tr>
                <tr>
                    
                    <td>

                        <table class="tbcon">
                            <tr>
                                <td rowspan="2" class="tbnum">2</td>
                                <td class="middleLine"> </td>
                            
                                <td class="tbStxt">REuse</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="tbstxt">다시 사용하고</td>
                            </tr>
                    </table>
                    </td>
                    <td>
                        <table class="tbcon">
                            <tr>
                                <td rowspan="2" class="tbnum">4</td>
                                <td class="middleLine"> </td>
                            
                                <td class="tbStxt">REcovery</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="tbstxt">에너지로 만들고</td>
                            </tr>
                    </table>

                    </td>
                </tr>


            </table>

        </div>
        <div class="con5">
            <div>

                <table>
                    <tr>
                        <td id="leftline"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="2" id="eTxt">리틀에코는 자원순환에 앞장서는 브랜드와 함께하겠습니다.</td>
                    </tr>


                </table>


            </div> 
         
        </div>

    </div>
    
    <script>
    /*	
    	
    	$(document).ready(function(){
    		

	    	
    		$.ajax({
    			
    			url: "recycling.api",
    			/* dataType: "json", 
    			success : function(result) {
    				var items = result.response.body.items;
    				
    				console.log(result.response.body);
    				
    				if (items && items.length > 0) {
    		            var str1 = items[0].wsteQty;
    		            var str2 = items[0].totRecyQty;
    		            result1.html(str1);
    		            result2.html(str2);
    		        } else {
    		            console.log("통신 성공하였으나 데이터가 없습니다.");
    		        }
    				
    			},*/
    			
/*     			 $.ajax({
    		            url: "recycling.api",
    		            success: function (result) {
    		                var data = result.data;

    		                if (data && data.length > 0) {
    		                    var str1 = data[0].WSTE_QTY;
    		                    var str2 = data[0].TOT_RECY_QTY;
    		        	    	var result1 = ("#open-result-1");
    		        	    	var result2 = ("#open-result-2");
    		        	    	
    		        	    	
    		                    result1.text(str1);
    		                    result2.text(str2);
    		                } else {
    		                    console.log("통신 성공하였으나 데이터가 없습니다.");
    		                }

    		            },
    		            
    		            
    			error:function(){
    				console.log("통신오류");
    			}
    			
    		});

    		
    	}); */

    
    </script>
    
    <script>
    
    $(document).ready(function(){
        Number.prototype.format = function(n) {
            var r = new RegExp('\\d(?=(\\d{3})+' + (n > 0 ? '\\.' : '$') + ')', 'g');
            return this.toFixed(Math.max(0, Math.floor(n))).replace(r, '$&,');
        };

        $('.count').each(function () {
            $(this).prop('counter', 0).animate({
                counter: $(this).text()
            }, {
                duration: 5000,
/*                 easing: 'easeOutExpo', */
                step: function (step) {
                    $(this).text('' + step.format());
                }
            });
        });
    });
    
    </script>
    




</div>
   <%@ include file="../common/footer.jsp" %>

</body>
</html>