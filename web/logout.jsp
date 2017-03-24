<%-- 
    Document   : logout
    Created on : May 12, 2012, 9:15:20 PM
    Author     : Shanky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            session.invalidate();
            response.sendRedirect("Login.jsp");
        %>
    </body>
</html>
