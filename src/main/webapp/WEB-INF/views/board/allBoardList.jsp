<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LITTLE ECO</title>
  
    <style>
        .pt-10 {
            padding-top: 2.5rem;
        }

        .max-w-2xl {
            max-width: 42rem;
        }

        .mx-auto {
            margin-left: auto;
            margin-right: auto;
        }

        * {
            font-family: 'Noto Sans', sans-serif;
            font-family: 'Noto Sans KR', sans-serif;
        }

        div {
            display: block;
        }

        body {
            margin: 0;
            line-height: inherit;
        }

        html {
            line-height: 1.5;
            -webkit-text-size-adjust: 100%;
            -moz-tab-size: 4;
            tab-size: 4;
            -webkit-tap-highlight-color: transparent;
        }

        .p-4 {
            padding: 1rem;
        }

        .shadow-md {
            --tw-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
            --tw-shadow-colored: 0 4px 6px -1px var(--tw-shadow-color), 0 2px 4px -2px var(--tw-shadow-color);
            box-shadow: var(--tw-ring-offset-shadow, 0 0 #0000), var(--tw-ring-shadow, 0 0 #0000), var(--tw-shadow);
        }

        .bg-white {
            --tw-bg-opacity: 1;
            background-color: rgb(255 255 255 / var(--tw-bg-opacity));
        }

        .rounded-lg {
            border-radius: 0.5rem;
        }

        .text-sm {
            font-size: 0.875rem;
            line-height: 1.25rem;
        }
        

        blockquote, dd, dl, figure, h1, h2, h3, h4, h5, h6, hr, p, pre {
            margin: 0;
        }

        p {
            display: block;
            margin-block-start: 1em;
            margin-block-end: 1em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
        }


/*         *{
            box-sizing: border-box;
            border-width: 0;
            border-style: solid;
            border-color: #e5e7eb;
        } */

        .flex {
            display: flex;
        }

        .justify-between {
            justify-content: space-between;
        }

        .items-center {
            align-items: center;
        }
        
                .mb-5 {
            margin-bottom: 1.25rem; /* 1.25rem = 20px */
            box-shadow: 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .search-highlight {
		    font-weight: bold; /* 진한 글씨체 */
		    background-color: yellow; /* 배경색 강조 */
		    /* 원하는 스타일을 여기에 추가할 수 있습니다. */
		}
		
		
		.text-overflow-ellipsis {
		    overflow: hidden;
		    text-overflow: ellipsis;
		    display: -webkit-box;
		    -webkit-line-clamp: 3; /* 표시할 줄 수 */
		    -webkit-box-orient: vertical;
		}

		img{
		max-width: 100px;
		}
    </style>
</head>
<body>
    <%@include file="../common/header.jsp" %>
     <div class="max-w-2xl mx-auto pt-10">
                             <strong>리사이클</strong>
                <br>
                <br>
                <hr>
    <c:choose>
    	<c:when test="${empty rList }">
    		        		        <div class="mb-5">
            <div class="bg-white shadow-md rounded-lg p-4 flex justify-between items-center">
                <h2 class="text-xl font-bold text-gray-800">검색 결과가 없습니다</h2>
            </div>
            <p class="text-gray-600 text-sm"></p>
            <!-- Placeholder image with detailed description -->
            
        </div>
    	</c:when>
    	<c:otherwise>
            	<c:forEach items="${rList }" var="r">
   
        <!-- First Item -->
        <div class="mb-5">
        <div class="bg-white shadow-md rounded-lg p-4 flex justify-between items-center" >
            <h2 class="text-xl font-bold text-gray-800">${r.recycleBoardTitle}</h2>
            <button class="bg-green-500 text-white px-3 py-1 rounded text-sm" onclick="location.href='rbdetail.hrb?rbno=${r.boardNo}'">상세보기</button>
        </div>
        <p class="text-gray-600 text-sm text-overflow-ellipsis">${r.recycleBoardContent}</p>
    </div>
            	</c:forEach>
    	</c:otherwise>
    </c:choose>
    </div>
        
        <!-- 서치에코 영역 -->
        <div class="max-w-2xl mx-auto pt-10">
                        <strong>서치에코</strong>
                <br>
                <br>
                <hr>
        <c:choose>
        	<c:when test="${empty sList }">
        		        <div class="mb-5">
            <div class="bg-white shadow-md rounded-lg p-4 flex justify-between items-center">
                <h2 class="text-xl font-bold text-gray-800">검색 결과가 없습니다</h2>
            </div>
            <p class="text-gray-600 text-sm"></p>
            <!-- Placeholder image with detailed description -->
           
        </div>
        	</c:when>
        	<c:otherwise>
        <c:forEach items="${sList }" var="eco">
        	
        <div class="mb-5">
            <div class="bg-white shadow-md rounded-lg p-4 flex justify-between items-center">
                <h2 class="text-xl font-bold text-gray-800">${eco.ecoBoardTitle }</h2>
                <button class="bg-green-500 text-white px-3 py-1 rounded text-sm" onclick="location.href='detail.sbo?bno=${eco.ecoBoardNo}'">상세보기</button>
            </div>
            <p id="img"class="text-gray-600 text-sm text-overflow-ellipsis">${eco.ecoBoardContent }</p>
            <!-- Placeholder image with detailed description -->
            
        	</div>
        </c:forEach>
        	</c:otherwise>
        </c:choose>
        </div>
        
        <!-- 모이자 영역 -->
                <div class="max-w-2xl mx-auto pt-10">
                <strong>모이자</strong>
                <br>
                <br>
                <hr>
        <c:choose>
        	<c:when test="${empty mList }">
        		        <div class="mb-5">
            <div class="bg-white shadow-md rounded-lg p-4 flex justify-between items-center">
                <h2 class="text-xl font-bold text-gray-800">검색 결과가 없습니다</h2>
            </div>
            <p class="text-gray-600 text-sm"></p>
            <!-- Placeholder image with detailed description -->
        </div>
        	</c:when>
        	<c:otherwise>
        <c:forEach items="${mList }" var="m">
        	
        <div class="mb-5">
            <div class="bg-white shadow-md rounded-lg p-4 flex justify-between items-center">
                <h2 class="text-xl font-bold text-gray-800">${m.moizaName }</h2>
                <button class="bg-green-500 text-white px-3 py-1 rounded text-sm" onclick="location.href='moiza.de?mno=${m.moizaNo}'">상세보기</button>
            </div>
            <p class="text-gray-600 text-sm text-overflow-ellipsis">${m.moizaGoal }</p>
            <!-- Placeholder image with detailed description -->
        	</div>
        </c:forEach>
        	</c:otherwise>
        </c:choose>
        </div>

       
    
    <script type="text/javascript">
    
    function highlightSearchResults(keyword, content) {
        // 정규 표현식을 사용하여 검색어에 일치하는 부분을 찾아서 강조 스팬으로 감싸기
        var highlightedContent = content.replace(new RegExp(keyword, 'gi'), function(match) {
            return '<span class="search-highlight">' + match + '</span>';
        });

        return highlightedContent;
    }

    var listItems = document.querySelectorAll('.bg-white.shadow-md.rounded-lg.p-4.flex.justify-between.items-center');
    listItems.forEach(function(item) {
        var titleElement = item.querySelector('h2');
        var contentElement = item.nextElementSibling;

        var originalTitle = titleElement.innerHTML;
        var originalContent = contentElement.innerHTML;

        // 동적으로 생성된 HTML을 해당 위치에 추가
        titleElement.innerHTML = highlightSearchResults("${keyword}", originalTitle);
        contentElement.innerHTML = highlightSearchResults("${keyword}", originalContent);
    });
    
    
    </script>
</body>
</html>
