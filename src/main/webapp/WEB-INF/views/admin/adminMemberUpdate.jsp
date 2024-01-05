<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="../assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>littleEco</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="/littleEco/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/littleEco/resources/assets/css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="/littleEco/resources/assets/css/demo.css" rel="stylesheet" />
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>

<style>
	#btn{
	background-color: #002c7b ;
	border: #002c7b ;
	}
	
    #btn:hover{
            color: white;
            cursor: pointer;
            background-color: #02215a;
        }
	
</style>
<body>
    <div class="wrapper">
        <div class="sidebar" >
        
            <div class="sidebar-wrapper" style="background-color: #002c7b;">
                <div class="logo">
                    <a href="http://localhost:8887/littleEco/" class="simple-text">
                        littleEco
                    </a>
                </div>
                <ul class="nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="admin">
                            <i class="nc-icon nc-notes"></i>
                            <p>Member List</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="brand.ad">
                            <i class="nc-icon nc-circle-09"></i>
                            <p>Brand</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#pablo"> User </a>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Edit Profile</h4>
                                </div>
                                <div class="card-body">
                                    <form action="memberUpdate.ad" method="post"> 
                                    	<input type="hidden" name="memberNo" value="${m.memberNo}">
                                        <div class="row">
                                            <div class="col-md-6 pr-1">
                                                <div class="form-group">
                                                    <label>MEMBER ID</label>
                                                    <input type="text" class="form-control" disabled="" placeholder="MEMBER ID" name="memberId" value="${m.memberId}">
                                                </div>
                                            </div>
                                            <div class="col-md-6 px-1">
                                                <div class="form-group">
                                                    <label>MEMBER NAME</label>
                                                    <input type="text" class="form-control" placeholder="MEMBER NAME" name="memberName" value="${m.memberName}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 pr-1">
                                                <div class="form-group">
                                                    <label>NickName</label>
                                                    <input type="text" class="form-control" placeholder="NickName" name="nickName" value="${m.nickName}">
                                                </div>
                                            </div>
                                            <div class="col-md-6 pl-1">
                                                <div class="form-group">
                                                    <label>Email address</label>
                                                    <input type="text" class="form-control" placeholder="Email" name="email" value="${m.email}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 pr-1">
                                                <div class="form-group">
                                                    <label>BIRTH</label>
                                                    <input type="text" class="form-control" placeholder="BIRTH" name="birth" value="${m.birth}">
                                                </div>
                                            </div>
                                            <div class="col-md-6 pl-1">
                                                <div class="form-group">
                                                    <label>PHONE</label>
                                                    <input type="text" class="form-control" placeholder="PHONE" name="phone" value="${m.phone.trim()} ">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Category</label>
                                                    <br>
                                                    <input type="checkbox" id="category1" name="categoryNo" value="1"><label for="category1" class="checkboxCss item1">&nbsp 지속 가능 제품 </label>
                                                    <input type="checkbox" id="category2" name="categoryNo" value="2"><label for="category2" class="checkboxCss item2">&nbsp 사회적 기업 </label>
                                                    <input type="checkbox" id="category3" name="categoryNo" value="3"><label for="category3" class="checkboxCss item3">&nbsp 제로웨이스트 및 친환경 제품 </label>
                                                    <input type="checkbox" id="category4" name="categoryNo" value="4"><label for="category4" class="checkboxCss item4">&nbsp 친환경 교육 및 커뮤니티 </label>
                      
                                                    <br>
                                                    <input type="checkbox" id="category5" name="categoryNo" value="5"><label for="category5" class="checkboxCss item5">&nbsp 유기농 식품 </label>
                                                    <input type="checkbox" id="category6" name="categoryNo" value="6"><label for="category6" class="checkboxCss item6">&nbsp 주방 용품 </label>             
                                                    <input type="checkbox" id="category7" name="categoryNo" value="7"><label for="category7" class="checkboxCss item7">&nbsp 욕실 용품 </label>
                                                    <input type="checkbox" id="category8" name="categoryNo" value="8"><label for="category8" class="checkboxCss item8">&nbsp 생활 용품 </label>
                                                    <input type="checkbox" id="category9" name="categoryNo" value="9"><label for="category9" class="checkboxCss item9">&nbsp 패션 </label>
                                            </div>
                                            <button type="submit" id="btn" class="btn btn-info btn-fill pull-right">Update Profile</button>
                                        </div>
                                        </div>
                                    </form>
                                    <script>
									    // 이 예제에서는 cList가 이미 서버에서 받아온 데이터로 가정
									    var cList = [
									    	 <c:forEach items="${cList}" var="c"  varStatus="status">
									    		{
									    			categoryNo : '${c.categoryNo}'
									    		}<c:if test="${!status.last}">,</c:if>
									  	  	</c:forEach>
									    
									    ];
									    
									    cList.forEach(function(item) {
									        console.log(item.categoryNo);
									        $("input[name=categoryNo][value=" + item.categoryNo + "]").prop('checked', true);
									    });
									  
									    
									</script>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</body>
<script src="/littleEco/resources/assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="/littleEco/resources/assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="/littleEco/resources/assets/js/plugins/bootstrap-switch.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!--  Chartist Plugin  -->
<script src="/littleEco/resources/assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="/littleEco/resources/assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="/littleEco/resources/assets/js/light-bootstrap-dashboard.js?v=2.0.0 " type="text/javascript"></script>
<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="/littleEco/resources/assets/js/demo.js"></script>

</html>
