<%--
  Created by IntelliJ IDEA.
  User: LEEDONGMIN
  Date: 2023-11-26
  Time: 오후 1:57
  To change this template use File | Settings | File Templates.
--%>
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

<html>
<head>
    <title>JSP</title>
</head>
<body>
<%
    HostDAO hostDAO = new HostDAO();
    int result = hostDAO.login(host.getHost_id(), host.getPassword());

    if(result == 1){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("location.href = '../hostmainpage/hostmainpage.jsp'");
        script.println("</script>");
    }
    else if(result == 0){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('비밀번호가 틀립니다.')");
        script.println("history.back()");
        script.println("</script>");
    }
    else if(result == -1){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('아이디가 틀립니다.')");
        script.println("history.back()");
        script.println("</script>");
    }
    else if(result == -2){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('DB오류 입니다.')");
        script.println("history.back()");
        script.println("</script>");
    }
%>

</body>
</html>
