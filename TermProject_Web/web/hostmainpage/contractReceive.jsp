<%--
  Created by IntelliJ IDEA.
  User: LEEDONGMIN
  Date: 2023-11-27
  Time: 오후 7:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="host.HostDAO"%>
<%@ page import ="java.io.PrintWriter" %>
<%@ page import="contract.ContractDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="database.database" %>
<%@ page import="contract.Contract" %>
<%@ page import="java.util.List" %>

<jsp:useBean id="host" class="host.Host" scope="session" />
<jsp:setProperty name="host" property="host_id" />
<jsp:setProperty name="host" property="password" />
<jsp:setProperty name="host" property="email" />
<jsp:setProperty name="host" property="phone_num" />
<jsp:setProperty name="host" property="name" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous">
    <title>Document</title>
    <style>
        .sidenav {
            background-color: #ffffff;
            position: fixed;
            width: 250px;
            height: 100%;
            top: 0;
            left: 0;
            z-index: 1000;
        }
        .sidenav h2 {
            text-align: center;
            margin-top: 20px; /* 필요에 따라 조절 */
        }

        .nav-item {
            margin: 5px 0;
            text-align: center;
            width: 100%;
        }

        .nav-item a {
            background-color: #ffffff;
            padding: 10px;
            display: block;
            border-radius: 5px;
            color: black;
            box-sizing: border-box;
            border: 1px solid black;
        }

        .nav-item a:hover {
            background-color: #ced4da;
            color: black;
        }

        .navbar {
            z-index: 1001;
        }

        .main-content {
            margin-left: 250px;
            width: calc(100% - 250px);
            height: 100vh;
            overflow: auto;
            position: relative;
            z-index: 1;
        }

        .navbar-text {
            margin-right: 20px;
        }

        .navbar-header {
            margin-left: 20px;
        }
    </style>
</head>

<%
    String id = host.getHost_id();
%>
<body>

<div class="container-fluid">

    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid d-flex justify-content-end align-items-center">
            <div class="navbar-header">
            <span class="navbar-text">
                <strong><%=id%> 님</strong>
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="/TermProject_Web_war_exploded/logout.jsp">LogOut</a></li>
                </ul>
            </span>
            </div>
        </div>
    </nav>


    <div class="row">
        <nav class="col-md-3 sidebar sidenav">
            <h2>Term Project</h2>
            <div class="position-sticky">
                <ul class="navbar nav flex-column">
                    <li class="nav-item"></li>
                    <li class="nav-item"></li>
                    <li class="nav-item"></li>
                    <li class="nav-item"></li>
                    <li class="nav-item"></li>
                    <li class="nav-item">
                        <h2>호스트 기능</h2>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="./messageReceive.jsp">
                            메세지 확인
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="./RoomDelete.jsp">
                            자신의 방 삭제
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="./contractReceive.jsp">
                            계약서 확인
                        </a>
                    </li>

                </ul>
            </div>
        </nav>
        <%
            ContractDAO contractDAO = new ContractDAO(database.dbURL, database.dbID, database.dbPassword);
            List<Contract> contracts = contractDAO.getContractsByHostId(id);
        %>

        <main role="main" class="main-content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <h2>호스트가 보유한 계약서 목록</h2>

                        <% if (contracts != null && !contracts.isEmpty()) { %>
                        <div class="row">
                            <% for (Contract contract : contracts) { %>
                            <div class="col-md-4 mb-3">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">계약서 ID: <%= contract.getContractId() %></h5>
                                        <p>User ID: <%= contract.getUserId() %></p>
                                        <p>Room ID: <%= contract.getRoomId() %></p>
                                        <p>계약일: <%= contract.getContractDate() %></p>
                                        <p>가격: <%= contract.getPrice() %></p>
                                        <p>기간: <%= contract.getDuration() %></p>
                                        <p>계약 시작 시간: <%= contract.getStartTime() %></p>
                                        <p>계약 종료 시간: <%= contract.getEndTime() %></p>
                                    </div>
                                </div>
                            </div>
                            <% } %>
                        </div>
                        <% } else { %>
                        <p>호스트가 보유한 계약서가 없습니다.</p>
                        <% } %>

                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
</body>

</html>
