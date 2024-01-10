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
            background-color: #805ad5; /* bg-purple-500 */
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #6b46c1; /* darker purple */
        }

        .main-content {
            flex: 1;
            padding: 1.25rem;
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
        .table table-hover{
          text-align: left;
          
        }
        
        .table table-hover th{
           height: 45px;
        }
        .table table-hover td{
           height : 45px;
        }
			
    </style>
</head>
<body>

<%@ include file="../common/header.jsp" %>
<div class="layout">
    <main class="main-content">
        <div class="dashboard">
            <div class="card-large">
                  <div class="card-body table-full-width table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Salary</th>
                                            <th>Country</th>
                                            <th>City</th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Dakota Rice</td>
                                                <td>$36,738</td>
                                                <td>Niger</td>
                                                <td>Oud-Turnhout</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Minerva Hooper</td>
                                                <td>$23,789</td>
                                                <td>Curaçao</td>
                                                <td>Sinaai-Waas</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Sage Rodriguez</td>
                                                <td>$56,142</td>
                                                <td>Netherlands</td>
                                                <td>Baileux</td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td>Philip Chaney</td>
                                                <td>$38,735</td>
                                                <td>Korea, South</td>
                                                <td>Overland Park</td>
                                            </tr>
                                            <tr>
                                                <td>5</td>
                                                <td>Doris Greene</td>
                                                <td>$63,542</td>
                                                <td>Malawi</td>
                                                <td>Feldkirchen in Kärnten</td>
                                            </tr>
                                            <tr>
                                                <td>6</td>
                                                <td>Mason Porter</td>
                                                <td>$78,615</td>
                                                <td>Chile</td>
                                                <td>Gloucester</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
            </div>
            
            <div class="card-right">
                <!-- Content for 요청 현황 and 누락 현황 -->
                <div class="card">
                <!-- Content for 요청 현황 and 누락 현황 -->
            	</div>
           		<div class="card">
                <!-- Content for 요청 현황 and 누락 현황 -->
            	</div>
            </div>
        </div>
    </main>
</div>

<jsp:include page="../common/footer.jsp" />
</body>
</html>
