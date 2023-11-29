<%--
  Created by IntelliJ IDEA.
  User: LEEDONGMIN
  Date: 2023-11-26
  Time: 오후 2:03
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
    <title>Title</title>
</head>
<body>
<%	// ---> 2.
    if (host.getHost_id() == null || host.getPassword() == null || host.getName() == null
            || host.getPhone_num() == null || host.getEmail() == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('입력이 안 된 사항이 있습니다.')");
        script.println("history.back()");
        script.println("</script>");
    } else {  // ---> 3.
        HostDAO hostDAO = new HostDAO();
        int result = hostDAO.join(host);
        if (result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('이미 존재하는 아이디입니다. or 오류')");
            script.println("history.back()");
            script.println("</script>");
        } else {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = './hostlogin.jsp'");
            script.println("</script>");
        }
    }
%>
</body>
</html>
