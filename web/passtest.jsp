<%-- 
    Document   : passtest
    Created on : Jun 10, 2012, 6:45:53 PM
    Author     : Shanky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script language="javascript">
            function add()
            {
                textt="";
                text=document.getElementById("pass").toString();
                //textt=textt+text;
                //document.getElementById("pass").value="#";
                document.getElementById("txt").value=document.getElementById("pass");
                text="hello";
                document.getElementById("div").value=text;
                //document.getElementById("hid").value=text;
            }
        </script>
    </head>
    <body>
        <h1>password!</h1>
        <form action="showpass.jsp">
            <input type="hidden" value="" id="hid" name="hid">
            <input type="text" value="" id="txt">
            enter password <input type="text" id="pass" name="pass" onkeyup="" onblur="add()">
            
            <div id="div"></div>
            
            <input type="submit" value="submit">
        </form>
    </body>
</html>
