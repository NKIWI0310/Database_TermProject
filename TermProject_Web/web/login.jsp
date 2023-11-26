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
    <h1>Welcome</h1>
    <form action = "loginAction.jsp">

        <div class = "int-area">
            <input type = "text" name = "Email" autocomplete="off" required>
            <label for = "Email">ID</label>
        </div>
        <div class = "int-area">
            <input type = "password" name = "Password" autocomplete="off" required>
            <label for = "Password">PW</label>
        </div>
        <div class = "btn-area">
            <button type = "submit">Sign-in</button>
        </div>
    </form>

    <div class="caption">
        <a href="register.jsp">Don't have an account? Sign-up</a>
    </div>
</section>


    <script>
        let Email = $('#Email');
        let Password = $('#Password');
        let btn = $('#btn');

        $(btn).on('click', function (){
            if($(Email).val() == ""){
                $(Email).next('label').addClass('warning');
            }
            else if($(Password).val() == ""){
                $(Password).next('label').addClass('warning');
            }
        })
    </script>
</body>
</html>
