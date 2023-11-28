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
<%@ page import="java.sql.*" %>
<%@ page import="database.database" %>
<%@ page import="message.MessageDAO" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="session" />
<jsp:setProperty name="user" property="user_id" />
<jsp:setProperty name="user" property="password" />
<jsp:setProperty name="user" property="email" />
<jsp:setProperty name="user" property="phone_num" />
<jsp:setProperty name="user" property="name" />

<%
    request.setCharacterEncoding("UTF-8");
    String userId = user.getUser_id(); // Get current user ID from the session
%>

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

        <main role="main" class="main-content">
            <div class="container mt-3">

                <h2>호스트에게 메세지 보내기</h2>

                <form action="messageSend.jsp" method="post">
                    <input type="hidden" name="userId" value="<%= userId %>">

                    <div class="mb-3">
                        <label for="hostId" class="form-label">Host ID:</label>
                        <input type="text" class="form-control" id="hostId" name="hostId" value="" required>
                    </div>

                    <div class="mb-3">
                        <label for="messageContent" class="form-label">Message:</label>
                        <textarea class="form-control" id="messageContent" name="content" rows="5" required></textarea>
                    </div>

                    <button type="submit" class="btn btn-primary">Send Message</button>
                </form>

                <%
                    MessageDAO messageDAO = new MessageDAO(database.dbURL, database.dbID, database.dbPassword);
                    // Handle the form submission using MessageDAO
                    if ("POST".equalsIgnoreCase(request.getMethod())) {
                        String hostIdInput = request.getParameter("hostId");
                        String content = request.getParameter("content");

                        // Use MessageDAO to send the message
                        messageDAO.sendMessage(id, hostIdInput, content);
                    }
                %>
            </div>
        </main>
    </div>
</div>
</body>

</html>
