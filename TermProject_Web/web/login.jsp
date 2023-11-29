<%--
  Created by IntelliJ IDEA.
  User: LEEDONGMIN
  Date: 2023-11-26
  Time: 오후 1:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html>
<head>
        <meta charset = "UTF-8">
        <meta name = "viewport" content=" = "width=device-width", initial-scale = "1">
        <title>Document</title>
        <link rel = "stylesheet" href = "loginstyle.css">
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>

<body>
<section class = "login-form">
    <h1>사용자 페이지</h1>
    <form action = "loginAction.jsp">
        <div class = "int-area">
            <input type = "text" id = "user_id" name = "user_id" autocomplete="off" required>
            <label for = "user_id">ID</label>
        </div>
        <div class = "int-area">
            <input type = "password" id = "password" name = "password" autocomplete="off" required>
            <label for = "password">PW</label>
        </div>
        <div class = "btn-area">
            <button type = "submit">로그인</button>
        </div>
    </form>

    <div class="caption">
        <a href="register.jsp">사용자 계정을 만들고 싶다면 여기를 클릭하세요</a>
    </div>
    <div class="caption">
        <a href="./hostAction/hostlogin.jsp">호스트 계정과 관련된 일을 할려면 여기를 클릭하세요</a>
    </div>
</section>


    <script>
        let UserID = $('#user_id');
        let Password = $('#password');
        let btn = $('#btn');

        $(btn).on('click', function (){
            if($(UserID).val() == ""){
                $(UserID).next('label').addClass('warning');
            }
            else if($(Password).val() == ""){
                $(Password).next('label').addClass('warning');
            }
        })
    </script>
</body>
</html>
