<%--
  Created by IntelliJ IDEA.
  User: LEEDONGMIN
  Date: 2023-11-27
  Time: 오후 7:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="contract.ContractDAO" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.IOException" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="database.database" %>
<%@ page import="bill.Bill" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="bill.BillDAO" %>

<jsp:useBean id="user" class="user.User" scope="session" />
<jsp:setProperty name="user" property="user_id" />
<jsp:setProperty name="user" property="password" />
<jsp:setProperty name="user" property="email" />
<jsp:setProperty name="user" property="phone_num" />
<jsp:setProperty name="user" property="name" />

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
    String id = user.getUser_id();
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
                        <h2>사용자 기능</h2>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="./roomlist.jsp">
                            방 목록 조회
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="./bill.jsp">
                            청구서 조회
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="messageSend.jsp">
                            메세지 보내기
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="./contractSend.jsp">
                            계약서 보내기
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="./review.jsp">
                            리뷰 남기기
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <main role="main" class="main-content">
            <div class="container mt-3">
                <h2>계약서 작성</h2>

                <form action="contractSend.jsp" method="post">

                    <input type="hidden" name="user_id" value="<%= id %>">

                    <div class="mb-3">
                        <label for="contract_date" class="form-label">계약일</label>
                        <input type="date" class="form-control" id="contract_date" name="contract_date" required>
                    </div>

                    <div class="mb-3">
                        <label for="room_id" class="form-label">방 번호</label>
                        <input type="number" class="form-control" id="room_id" name="room_id" required>
                    </div>

                    <div class="mb-3">
                        <label for="price" class="form-label">가격</label>
                        <input type="number" class="form-control" id="price" name="price" required>
                    </div>

                    <div class="mb-3">
                        <label for="duration" class="form-label">기간</label>
                        <input type="number" class="form-control" id="duration" name="duration" required>
                    </div>

                    <div class="mb-3">
                        <label for="start_time" class="form-label">계약 시작 시간</label>
                        <input type="datetime-local" class="form-control" id="start_time" name="start_time" required>
                    </div>

                    <div class="mb-3">
                        <label for="end_time" class="form-label">계약 종료 시간</label>
                        <input type="datetime-local" class="form-control" id="end_time" name="end_time" required>
                    </div>

                    <button type="submit" class="btn btn-primary">계약서 작성</button>
                </form>
            </div>
        </main>
    </div>
</div>
</body>

<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String userId = request.getParameter("user_id");
        int roomId = Integer.parseInt(request.getParameter("room_id"));
        String contractDate = request.getParameter("contract_date");
        int price = Integer.parseInt(request.getParameter("price"));
        int duration = Integer.parseInt(request.getParameter("duration"));
        String startTime = request.getParameter("start_time");
        String endTime = request.getParameter("end_time");

        // 계약서 생성
        ContractDAO contractDAO = new ContractDAO(database.dbURL, database.dbID, database.dbPassword);
        int contractId = contractDAO.insertContract(userId, roomId, contractDate, price, duration, startTime, endTime);

        // 청구서 생성
        Bill bill = new Bill();
        bill.setPrice(price);
        bill.setUserId(userId);
        bill.setContractId(contractId);
        bill.setStatus("unpaid");  // 초기 상태는 미지불로 설정
        bill.setPayMethod("credit");  // 예시로 신용카드로 설정

        // 데이터베이스에 청구서 삽입
        BillDAO billDAO = new BillDAO(database.dbURL, database.dbID, database.dbPassword);
        billDAO.insertBill(bill);
    }

%>
</html>
