<%--
  Created by IntelliJ IDEA.
  User: LEEDONGMIN
  Date: 2023-11-29
  Time: 오후 7:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="host.HostDAO"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
    response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    session.invalidate();
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="0;url=login.jsp">
    <title>Redirecting...</title>
</head>

<body>
<p>If you are not redirected, <a href="./hostlogin.jsp">click here</a>.</p>
</body>

</html>
