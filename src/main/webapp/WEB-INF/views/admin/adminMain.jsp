<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
</style>

<body>
<!-- alert창 띄우기 -->
	<c:if test="${not empty alertMsg }">
		<script>
			var alertMsg = "${alertMsg}";
			alert(alertMsg);
		</script>
		<c:remove var="alertMsg" />
	</c:if>
    <div class="wrapper">
        <div class="sidebar" >
            <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

        Tip 2: you can also add an image using data-image tag
    -->
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
                    <a class="navbar-brand" href="#pablo"> Member List </a>
                    
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card strpied-tabled-with-hover">
                                <div class="card-header ">
                                    <h4 class="card-title">Member</h4>
                                </div>
                                <div class="card-body table-full-width table-responsive">
                                    <table id="memberList" class="table table-hover table-striped">
                                        <thead>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Phone</th>
                                            <th>CreateDate</th>
                                        </thead>
                                        <tbody>
                                          
                                        </tbody>
                                    </table>
                                </div>
            	<script>
            	$(function(){
            		selectMemberList();
            		
            		$(document).on("click","#ubtn", function(){
        				console.log($(this).closest('tr').find('input[type="hidden"]').val());
        				
        				var mno = $(this).closest('tr').find('input[type="hidden"]').val();
        				
        				location.href = "memberUpdate.ad?mno=" + mno;
        			});
            		
            		$(document).on("click","#dbtn", function(){
        				console.log($(this).closest('tr').find('input[type="hidden"]').val());
        				
        				var mno = $(this).closest('tr').find('input[type="hidden"]').val();
        				
        				location.href = "memberDelete.ad?mno=" + mno;
        			});
            	});
            	
            	function selectMemberList() {
					$.ajax({
						url : "memberList.ad",
						success : function(result){
							var str = "";
							
							for(var i in result){
								str +="<tr>"
									+ "<td>" +result[i].memberId +"</td>"
									+ "<td>" +result[i].memberName +"</td>"
									+ "<td>" +result[i].email +"</td>"
									+ "<td>" +result[i].phone +"</td>"
									+ "<td>" +result[i].createDate +"</td>"
									+ "<td><input type='hidden' value='"+result[i].memberNo+"'></td>"
									+"<td> "
									+"<button type='button' id='ubtn'class='btn btn-primary btn-sm'>UPDATE</button>"
									+"<button type='button' id='dbtn'class='btn btn-primary btn-sm'>DELETE</button>"
									+"</td>"
									+"</tr>";
									
									
								$("#memberList tbody").html(str);
									
								
							}
							
							
						},error : function() {
							console.log("adminMemberList 통신 오류");
						}
						
					});
				}
            </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<!--   Core JS Files   -->

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
