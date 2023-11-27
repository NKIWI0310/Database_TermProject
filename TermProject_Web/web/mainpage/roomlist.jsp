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
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*" %>

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
                    <li class="nav-item"></li>
                    <li class="nav-item">
                        <a class="nav-link active" href="./roomlist.jsp">
                            방 목록
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="./bill.jsp">
                            청구서
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link active" href="./message.jsp">
                            메세지
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="./selectHost.jsp">
                            호스트 조회
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="./contract.jsp">
                            계약
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <main role="main" class="main-content">
            <div class="row">
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        String dbURL = "jdbc:mysql://192.168.56.101:4567/Term_project";
                        String dbID = "dongmin-lee";
                        String dbPassword = "1234";
                        Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

                        String query = "SELECT * FROM room";
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery(query);

                        while (rs.next()) {
                %>
                <div class="col-md-4 mt-3">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"><%= rs.getString("name") %></h5>
                            <p class="card-text">Location: <%= rs.getString("location") %></p>
                            <p class="card-text">Host ID: <%= rs.getString("host_id") %></p>
                            <p class="card-text">Size: <%= rs.getInt("room_size") %></p>
                            <p class="card-text">Price: <%= rs.getInt("room_price") %></p>
                            <p class="card-text">Shape: <%= rs.getString("room_shape") %></p>
                        </div>
                    </div>
                </div>
                <%
                        }

                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>
        </main>
    </div>
</div>
</body>

</html>
