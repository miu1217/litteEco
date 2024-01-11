<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&family=Noto+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
  
    <style>

        #title{
            font-size: 40px;
            font-weight: 400;
            display: flex;
            justify-content: center;
            margin-top: 60px;

        }
        .list-area{
            border-top: 3px solid #313131;
            border-bottom: 3px solid #313131;
            text-align: left;
            width: 1000px;
            margin-top: 60px;
            align-items: center;
            /* vertical-align: middle; */
            margin-bottom: 120px;
         
        }

        .question{
            vertical-align: middle;
            height: 62px;
            width: 100%;
        }
        .question td{
            font-size: 18px;
            font-weight: 800;
            border-top: 1px solid #ddd;
        }

        .answer td{
            height: 97px;
            border-top: 1px solid #ddd;
            background-color: #fafafa;
            font-size: 15px;
            font-weight: 500;
            color: #656565;
        }
        .answer{
        display: none;
    }
    
    .question{
    	cursor: pointer;
    }
    #qicon{
    	width: 30px;
    }
    
    </style>
</head>
<body>
<%@ include file="../common/header.jsp" %>

    <div id="title">FAQ</div>
    
    <table class="list-area" align="center">
        <tr class="question">
            <td id="qIcon" width="60px">
                <img src="resources/00_main/04_con/q_icon.png" alt="">
            </td>
            <td>
                <p>마이페이지는 어디에 있나요?  </p>
            </td>
            <td>
                <img src="resources/00_main/04_con/on_incon.png" alt="">
            </td>


        </tr>
        <tr class="answer">
            <td>
                <img src="resources/00_main/04_con/a_icon.png" alt="">

            </td>
            <td>
                <p>  홈페이지 접속하여 로그인하신 후 로그인 화면 상단 우측에서 Mypage를 클릭하시면 됩니다. </p>
            </td>

        </tr>
        <tr class="question">
            <td id="qIcon">
                <img src="resources/00_main/04_con/q_icon.png" alt="">
            </td>
            <td>
                <p>질문이 무엇인가여 </p>
            </td>
            <td>
                <img src="resources/00_main/04_con/on_incon.png" alt="">
            </td>


        </tr>
        <tr class="answer">
            <td>
                <img src="resources/00_main/04_con/a_icon.png" alt="">

            </td>
            <td>
                <p>  답변 어쩌고 저쩌고 웅엥웅엥</p>
            </td>

        </tr>
        <tr class="question">
            <td id="qIcon">
                <img src="resources/00_main/04_con/q_icon.png" alt="">
            </td>
            <td>
                <p>질문이 무엇인가여 </p>
            </td>
            <td>
                <img src="resources/00_main/04_con/on_incon.png" alt="">
            </td>


        </tr>
        <tr class="answer">
            <td>
                <img src="resources/00_main/04_con/a_icon.png" alt="">

            </td>
            <td> 
                <p>  답변 어쩌고 저쩌고 웅엥웅엥</p>
            </td>

        </tr>
        <tr class="question">
            <td id="qIcon">
                <img src="resources/00_main/04_con/q_icon.png" alt="">
            </td>
            <td>
                <p>질문이 무엇인가여 </p>
            </td>
            <td>
                <img src="resources/00_main/04_con/on_incon.png" alt="">
            </td>


        </tr>
        <tr class="answer">
            <td>
                <img src="resources/00_main/04_con/a_icon.png" alt="">

            </td>
            <td>
                <p>  답변 어쩌고 저쩌고 웅엥웅엥</p>
            </td>

        </tr>

    </table>
    
    <%@ include file="../common/footer.jsp" %>
</body>

<script >

	$(function(){
		$(".question").click(function(){
			var $q =$(this).next();
			console.log($(this).next());
			
			if($q.css("display")=="none"){
				$(this).siblings(".answer").slideUp();
				$q.slideDown(100);
			}else{
				$q.slideUp(100);
			}
			
		});
	});



</script>
</html>