<%-- 
    Document   : showpass
    Created on : Jun 10, 2012, 6:58:04 PM
    Author     : Shanky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Displaying!</h1>
        <%
            String hid = (String)request.getParameter("hid");
        %>
        <br><br>
        <h2>here is password <%=hid%></h2>>
    </body>
</html>
