<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="host.HostDAO"%>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="host" class="host.Host" scope="session" />
<jsp:setProperty name="host" property="host_id" />
<jsp:setProperty name="host" property="password" />
<jsp:setProperty name="host" property="email" />
<jsp:setProperty name="host" property="phone_num" />
<jsp:setProperty name="host" property="name" />

<!DOCTYPE html>
<html>
<head>
    <meta charset = "UTF-8">
    <meta name = "viewport" content=" = "width=device-width", initial-scale = "1">
    <title>Document</title>
    <link rel = "stylesheet" href = "../loginstyle.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>

<body>
<section class="login-form">
    <h1>REGISTER FORM</h1>
    <form action="hostRegisterAction.jsp" method="post">
        <div class="int-area">
            <input type="text" id ="host_id" name="host_id" autocomplete="off" required>
            <label for="host_id">ID</label>
        </div>
        <div class="int-area">
            <input type="password" id ="password" name="password" autocomplete="off" required>
            <label for="password">PW</label>
        </div>
        <div class="int-area">
            <input type="text" id ="name" name="name" autocomplete="off" required>
            <label for="name">NAME</label>
        </div>
        <div class="int-area">
            <input type="text" id ="email" name="email"  autocomplete="off" required>
            <label for="email">PHONE</label>
        </div>
        <div class="int-area">
            <input type="text" id ="phone_num" name="phone_num" autocomplete="off" required>
            <label for="phone_num">E-MAIL</label>
        </div>
        <div class="btn-area3">
            <button type="submit">REGISTER</button>
        </div>
    </form>
</section>
</body>
</html>
