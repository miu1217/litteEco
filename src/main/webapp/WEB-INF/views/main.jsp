<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>littleEco</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&family=Noto+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <style>

     *{
        font-family: 'Noto Sans', sans-serif;
        font-family: 'Noto Sans KR', sans-serif;
     }

/*---------------------------------콘텐츠영역-----------------------------------------*/
.wrap *{
      width: 100%;
      /* margin: auto; */
     }
/*-------------상단 탑 이미지-------------------------------------------*/

     .key_visual{
         width: 100%;
        height: 550px;
        overflow: hidden;

     }

     img .imgslide1{
        width: 100%;
        height: auto;
        width: 100%;
        height: 550px;
        animation: slide1 7s infinite;
     }
/*
     img .imgslide2{
        width: 100%;
        height: auto;
        position:absolute;
        left: 0;
        top: 0;
        width: 100%;
        height: 550px;
        animation: slide2 7s infinite;
     }

     img .imgslide3{
        width: 100%;
        height: auto;
        position:absolute;
        left: 0;
        top: 0;
        width: 100%;
        height: 550px;
        animation: slide3 7s infinite;
     }

     @keyframes slide1 {
        0%{left: -1200px;}
        33.33%{left:-1200px;}
        66.66%{left:0px;}
        100%{left:1200px;}
        
     }

     @keyframes slide2 {
        0%{left: -1200px;}
        33.33%{left:-1200px;}
        66.66%{left:0px;}
        100%{left:1200px;}
        
     }

     @keyframes slide3 {
        0%{left: -1200px;}
        33.33%{left:-1200px;}
        66.66%{left:0px;}
        100%{left:1200px;}
        
     }*/




/*------------브랜드 콘텐츠 / 로그인전, 취향선택안한회원------------------*/

.our-brand{
   width: 100%;
   /* background-color:brown ; */
   margin-top: 90px;
   margin-left: 80px;
    display: none;  
   /* 로그인전취향선택안한 회원 함수에서 바꿔주세여 */ 
   
}

.our-brand > div{
   float: left;
   height: 1010px;
   /* position: relative; */
}
.our-brand > p{
   font-weight: 800;
   font-size: 70px;
   margin-left: 350px;

}

#brand1{
   width: 860px;
   /* background-color: white; */

   
}
#brand1 > div{
   float: left;

}
#bimg{
   width: 552px;
   height: 737px;
   /* z-index: 100;/ */
   /* background-color: firebrick; */
   position: relative;

}

#btext1{
   position: absolute;
   z-index: 120;
   top: 580px;
   left: 40px;
   width:195px;
   height: 75px;
}
#btext1 img{
   padding-bottom: 15px;
}
#btext1 span{
   
   font-weight: 600;
   font-size: 24px;
}

.subIm{
   
   width: 30%;
   /* background-color: blanchedalmond; */
   margin-left: 42px;
}

#simg1{
   
   height: 354px;
   width: 267px;
   /* background-color: tomato; */
}
#simg2{
   margin-top: 30px;
   height: 354px;
   width: 267px;
   /* background-color: thistle; */
}


/*---------------------------------1-2------------------------------*/
#brand2{
   width: 860px;
   /* background-color: violet; */

}
#brand2 > div{
   float: left;
   /* height: 100% */
}
#bimgB2{
   width: 552px;
   height: 737px;
   /* background-color: firebrick; */
   /* margin-left: 42px; */
   position: relative;
}
#btext2{
   position: absolute;
   z-index: 120;
   top: 580px;
   left: 70px;
   width:270px;
   height: 75px;
}

#btext2 img{
   width: 75px;
   height: 21px;
   padding-bottom: 15px;
}
#btext2 span{
   
   font-weight: 600;
   font-size: 24px;
}
.subImB2{
   
   width: 30%; 
    margin-left: 42px;
   /* background-color: blanchedalmond; */
}

#simg1B2{
   height: 354px;
   width: 267px;
   /* background-color: tomato; */

}
#simg2B2{
   margin-top: 30px;
   height: 354px;
   width: 267px;
   /* background-color: thistle; */
}


/*-------------------------로그인한 취향선택한 회원---------------------------------*/


.user-brand{

   height: 922px;
   margin-top: 90px;
   position: relative;
   overflow: hidden;
   margin-bottom: 100px;
}


.user-brand #tit{
   font-weight: 800;
   font-size: 70px;
   margin-left: 350px;
}

#brandlist{
   display: table;
   table-layout: fixed;
   border-spacing: 90px;
   height: 639px;
   margin-top: 120px;
   transform: translate3d(-882px,0px,0px);
}

#brandlist a{
   display:table-cell;
   width: 1162px;
}


#tit{
   width: 500px;
   height: 53px;

}



#usbr1 img{
   /* position: relative; */
}
#ubt1{
   /* position:relative; */
   top: 400px;
   left: 63px;
}
#ubt1 img{
   width: 176px;
   height: 27px;
   margin-bottom: 15px;
}

#ubt1 span{
   
   font-size: 52px;
   font-weight: 300;
   color: #fff;
   letter-spacing: -2.5px;
}



#ubt2{
   position: absolute;
   top: 300px;
   padding-left: 56px;
   
}
#ubt2 img{
   width: 176px;
   height: 27px;
   margin-bottom: 15px;
}

#ubt2 span{
   font-size: 52px;
   font-weight: 300;
   letter-spacing: -2.5px;
   color: #000;
}



#ubt3{
position: absolute;
top: 300px;
padding-left: 56px;

}
#ubt3 img{
width: 176px;
height: 27px;
margin-bottom: 15px;
}

#ubt3 span{
font-size: 52px;
font-weight: 300;
letter-spacing: -2.5px;
color: #000;
}

#pre{
   width: 29px;
   height: 138px;
   position: absolute;
   z-index: 9000;
   left: 406px;
   top: 550px;
}

#next{
   width: 30px;
   height: 140px;
   position: absolute;
   z-index: 9000;
   right: 210px;
   top: 550px;
}





/*----------------인기게시글영역------------------------*/
.bestcon{
   width: 100%;
   height: 515px;
   /* background-color: aqua; */   
   float: left;
   position: relative;
}
.bestcon a{
   text-decoration: none;
   color: #000;
}

#bg{
   width:1500px;
   height: 355px;
   background-color: #fff;
   position: absolute;
   left: 206px;
   top: 80px;
}

#bestwrap{
   width: 1390px;
   height: 275px;
   /* background-color: blue; */
   margin: 0 auto;
   margin-top:40px;
}

#bestwrap div{
   float: left;
   width: 448px;
   height: 100%;
   padding-right: 10px;
   /* background-color: wheat; */
}
/*----------------베스트게시물 1구역------------------ */

#how{
   border-right: 1px solid #a1a1a1;
}
#how ul{
   list-style: none;
}

#how img{
   /* background-color: aqua; */
   width: 173px;
   height: 40px;
   margin-bottom:60px;
}
#howtit{
   font-size: 28px;
   font-weight: 600;
   margin-bottom: 30px;
}
#how span{
   font-size: 16px;
   font-weight: 400;
   color: #666;
}

/*---------------------베스트게시글 2구역--------------------------- */

#moi{
   border-right: 1px solid #a1a1a1;
}
#moi ul{
   list-style: none;
}
#moi img{
   width: 104px;
   height: 40px;
   margin-bottom: 60px;
}
#moitit{
   font-size: 28px;
   font-weight: 600;
   margin-bottom: 30px;
}
#moi span{
   font-size: 16px;
   font-weight: 400;
   color: #666;
}
/*----------------랭킹------------------*/
#bestbg{
   width: 400px;
   /* height: 100%; */
   border: 1px solid #a1a1a1;
   border-radius: 20px;
   margin-left: 20px;
}

/* 초기에는 첫 번째 요소만 보이도록 설정 */
#scroll li:not(:first-child) {
    display: none;
}

/* 마우스가 #best에 들어오면 나머지 요소들이 나타남 */
#best:hover #scroll li {
    display: list-item;
}

/* ol 요소의 리스트 스타일 설정 */
#scroll {
    list-style: decimal;
    counter-reset: item; /* 카운터 초기화 */
}

/* /* 각 인기 검색어 앞에 숫자를 추가 */
#scroll li {
    counter-increment: item;
} */

/* 인기 검색어의 숫자를 가상 요소로 표시 */
#scroll li:before {
    content: counter(item) ". ";
    margin-right: 5px;
    font-weight: bold;
}


#bestbg p{
   margin-left: 40px;   
   font-size: 26px;
   font-weight: 500;
   color: #4c4c4c;
}

#bestbg li{
   margin-left: 30px;
   padding-bottom: 10px;
   font-size: 16px;
   font-weight: 500;
   color: #595959;
}

.banner{
   width: 100%;
   height: 475px;
   margin-top: 120px;
   float: left;
   margin-left: 206px;
}

.banner p{
   font-size: 30px;
   font-weight: 500;

}
.banner > div{
   float: left;
   height: 152px;
   
   
}

#banner1{
   padding-right: 70px;
   width: 715px;
   
}
#banner2{
   width: 715px;
   
}



  
#scroll {
  display: grid;
  grid-template-columns: repeat(2, 1fr); /* 2개의 열로 설정 */
  
}

/* 홀수 행에 배치하는 아이템 */
#scroll li:nth-child(odd) {
  grid-row: span 2; /* 현재 행을 2로 설정 */
}

/* 짝수 행에 배치하는 아이템 */
#scroll li:nth-child(even) {
  grid-row: span 2; /* 현재 행을 2로 설정 */
}


   

    </style>
</head>
<body>
    
	<%@ include file="../views/common/header.jsp" %>

        <!--콘텐츠 영역 시작-->
        <div class="wrap">
        <div class="contents" id="content">
            <!--******************************메인 콘텐츠 영역 **********************************-->
            <div class="key_visual">
                <!--****************************상단 탑 이미지 영역*****************************-->
                <img src="resources/00_main/key_visual/01_topimg.png" class="imgslide1" alt="">
                <img src="resources/00_main/key_visual/02_topimg.png" class="imgslide2" alt="">
                <img src="resources/00_main/key_visual/03_topimg.png" class="imgslide3" alt="">
            </div>
            </div>


            <div class="sub_content">
               <!--****************로그인안한 기본화면, 취향선택 안한 회원 메인화면***************-->
                <section class="our-brand">
                   <p>OUR ECO's</p>
                    <div class="brand-area1" id="brand1">
                     <div id="bimg">
                        <img src="resources/00_main/01_con/01_defimg.png" alt="">
                        <div id="btext1">
                        <img src="resources/00_main/01_con/닥터노아logo.png" alt="" id="bLogo">
                        <span>
                           순하면서 상쾌한 <br>
                           새로운 가글의 시대
                        </span>
                     </div>
                     </div>
                     <div class="subIm">
                        <div id="simg1"><a href=""><img src="resources/00_main/01_con/01_1brand_click.png" alt=""></a></div>
                        <div id="simg2"><a href=""><img src="resources/00_main/01_con/01_2branc_click.png" alt=""></a></div>
                     </div>
                    </div>
                    <div class="brand-area2" id="brand2">
                     <div id="bimgB2">
                        <img src="resources/00_main/01_con/02_defimg.png" alt="">
                       

                           <div id="btext2">
                              <img src="resources/00_main/01_con/모레상점logo.png" alt="" id="bLogo2"> <br>


                              <span>
                                 건조한 입술도 촉촉하게 <br>
                                 도심 속 가로수도 지키는
                              </span>
                           </div>
                         
                     
                     </div>
                     <div class="subImB2">
                        <div id="simg1B2"><a href=""><img src="resources/00_main/01_con/02_1brand_click.png" alt=""></a></div>
                        <div id="simg2B2"><a href=""><img src="resources/00_main/01_con/02_2brand_click.png" alt=""></a></div>
                     </div>

                    </div>
                </section>

                <!--******************************로그인후 화면,취향선택회원화면************************************* -->
                <section class="user-brand">
                  <div id="tit">YOUR ECO's</div>
                  <div id="brandlist" id=" section fp-section fp-table  fp-completely">
                   <a href="" id="usbr1">
                     <img src="resources/00_main/01_con/01_img.png" id="" alt="" onclick="">
                     <div id="ubt1">
                        <img src="resources/00_main/01_con/동구밭팩토리logo.png" alt=""> <br>
                        <span>
                           지속가능한 가치소비 <br>
                           업사이클링 뷰티의 시작

                        </span>
                     </div>
                  </a>
                   <a href="" id="usbr2"><img src="resources/00_main/01_con/02_img.png" id="" alt="" onclick="">
                     <div id="ubt2">
                        <img src="resources/00_main/01_con/닥터노아logo.png" alt=""> <br>
                        <span>
                           대나무 칫솔의 새로운 기준, <br>
                           마루 대나무 칫솔 스탠다드
                        </span>

                     </div>   
                  </a>
                   <a href="" id="usbr3">
                     <img src="resources/00_main/01_con/03_img.png" id="" alt="" onclick="">
                     <div id="ubt3">
                        <img src="resources/00_main/01_con/더피커logo.png" alt=""> <br>
                        <span>
                           지속가능한 <br>
                           플라스틱 프리 치약
                        </span>
                        </div>
                  </a>
                  
                  
               </div> 
               <div id="pre">
                  <a href=""><img src="resources/00_main/01_con/prev.png" alt=""></a>
               </div>
               </a>
               <div id="next">
                  <a href=""><img src="resources/00_main/01_con/next.png" alt=""></a>
               </div>

               </section>


                <!--*************************************인기게시글 영역*****************************************************-->
                <section class="bestcon" >
                  <img src="resources/00_main/02_con/bg.png" alt="">
                  <div id="bg">
                     <div id="bestwrap">
                        <div id="how">
             
                           <ul>
                              <li><img src="resources/00_main/02_con/howto.png" alt=""></li>
                              
                              <!--************게시물 타이틀이 들어갈 자리입니다아아아아아아아***********-->
                              <li id="howtit"><a href="">생활속 분리배출</a></li>

                              <li>  
                               <span>
                                 
                                 <!--***********게시물 내용들어갈 자리이이이이이ㅣㅇ이이이 *-*********-->
                                 게시물 내용이 들어가느 ㄴ자리 <br>
                                 몇줄이 들어갈지 아무도 모르는 자리 <br>
                                 얼마나 적어놔야할까여 ........ 
                              
                               </span>
                              </li>
                           </ul>
                        </div>
                        <div id="moi">
                           <ul>
                              <li><img src="resources/00_main/02_con/moiza.png" alt=""></li>
                              
                              <!--************게시물 타이틀이 들어갈 자리입니다아아아아아아아***********-->
                              <li id="moitit"><a href="">생활속 분리배출</a></li>

                              <li>
                               <span>

                                 <!--***********게시물 내용들어갈 자리이이이이이ㅣㅇ이이이 *-*********-->
                                 게시물 내용이 들어가느 ㄴ자리 <br>
                                 몇줄이 들어갈지 아무도 모르는 자리 <br>
                                 얼마나 적어놔야할까여 ........ 
                               
                              </span>
                             </li>
                           </ul>
                        </div>


                        <!--****************인기게시글 랭킹 영역******************************-->
                        <div id="best">
                           <div id="bestbg">
                              <p>인기 검색어</p>
                              <ol id="scroll">
	
								<!-- 인기검색어 출력 할 영역 -->
								
                              </ol>
                           </div>
                           

                        </div>
                        
				<script type="text/javascript">
				$(document).ready(function () {
				    var intervalId;

				    function showNextKeyword(keywords, index) {
				        if (index < keywords.length) {
				            var keyword = keywords[index].keyword;
				            var rank = index + 1;
				            var listItem = $("<li>").append("<a href='#' class='popular-keyword'>" + rank + ". " + keyword + "</a>");

				            // 클릭 이벤트를 추가하여 검색어를 클릭할 때 동작하도록 함
				            listItem.find(".popular-keyword").on("click", function (e) {
				                e.preventDefault(); // 기본 동작 막기

				                // 선택한 검색어를 가져와서 searchBox에 넣기
				                var selectedKeyword = $(this).text().split('. ')[1];
				                $("#searchBox").val(selectedKeyword);

				                // searchBtn2를 클릭하여 검색 수행
				                $("#searchBtn2").click();
				            });

				            $("#scroll").html($("<ol>").css("list-style-type", "none").append(listItem)); // 번호를 표시하지 않음

				            // 다음 검색어를 2초 뒤에 표시
				            intervalId = setTimeout(function () {
				                showNextKeyword(keywords, (index + 1) % keywords.length);
				            }, 2000);
				        }
				    }

				    // 초기에 첫 번째 인기 검색어를 보이도록 설정
				    $.ajax({
				        url: "select.ps",
				        dataType: "json",
				        success: function (result) {
				            // 일반적인 경우에는 1위, 2위, 3위를 2초마다 한 개씩 보여줌
				            showNextKeyword(result, 0);

				            // 호버 시에 전체 목록을 보여주는 이벤트
				            $("#best").mouseenter(function () {
				                clearTimeout(intervalId); // 이전에 설정된 타이머 제거
				                showAllKeywords(result);
				            });

				            // 호버에서 벗어나면 다시 1위, 2위, 3위를 2초마다 한 개씩 보여줌
				            $("#best").mouseleave(function () {
				                showNextKeyword(result, 1);
				            });
				        },
				        error: function () {
				            console.log("통신 오류");
				        }
				    });

				    // 전체 목록을 보여주는 함수
				    function showAllKeywords(keywords) {
				        var list = $("<ol>").css("list-style-type", "none");
				        for (var i in keywords) {
				            var rank = parseInt(i) + 1;
				            var listItem = $("<li>").append("<a href='#' class='popular-keyword'>" + rank + ". " + keywords[i].keyword + "</a>");

				            // 클릭 이벤트를 추가하여 검색어를 클릭할 때 동작하도록 함
				            listItem.find(".popular-keyword").on("click", function (e) {
				                e.preventDefault(); // 기본 동작 막기

				                // 선택한 검색어를 가져와서 searchBox에 넣기
				                var selectedKeyword = $(this).text().split('. ')[1];
				                $("#searchBox").val(selectedKeyword);

				                // searchBtn2를 클릭하여 검색 수행
				                $("#searchBtn2").click();
				            });

				            list.append(listItem);
				        }

				        $("#scroll").html(list);
				    }
				});

				</script>
                        
                     </div>

                  </div>
                </section>

                <!--*************배너 이미지 박아둔거라 신경안쓰셔도 됩니다**************************-->
                <section class="banner">
                  <p>이벤트·행사</p>
                  <div id="banner1"><img src="resources/00_main/03_con/01_banner.png" alt=""></div>
                  <div id="banner2"><img src="resources/00_main/03_con/02_banner.png" alt=""></div>
                </section>
            </div>
      </div>
     <jsp:include page="../views/common/footer.jsp"/>
</body>
</html>