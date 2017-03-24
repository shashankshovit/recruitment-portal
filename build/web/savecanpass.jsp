<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
    
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>Recruitment System</title>
    <style type="text/css">
        <!--
        .body {
            margin:0%;
        }
        a:link {
            color: #003366;
            text-decoration: underline;
        }
        a:visited {
            text-decoration: underline;
            color: #660066;
        }
        a:hover {
            text-decoration: none;
            color: #CC6633;
        }
        a:active {
            text-decoration: underline;
            color: #990033;
        }
        .style10 {
            color: #993300;
            font-weight: bold;
        }
        .style11 {
            color: #993333;
            font-weight: bold;
        }
        .style12 {color: #339933}
        body,td,th {
            color: #336633;
        }
        -->
    </style>
</head>
    
<body style="margin:0px">
<table width="100%" height="492" border="1">
    <tr valign="top">
        <td height="120" bgcolor="#624631" colspan="2">
            <jsp:include page="CandidateHeader.jsp"/>
            <font size="5" color="#000000"><b>Welcome</b></font> <font size="6" color="#ffffff"><b> <%= session.getAttribute("s1") %></b></font>
        </td>
        <td></td>
    </tr>
    
    
    <tr>
    <td width="20%" height="449" valign="top" bgcolor="#624631">
        <jsp:include page="Candidatemenu.html"/>
    </td>
    <td >
        <img src="images/softtoy.jpg">
                    <font color="red" size="5"> Your password has been updated successfully!!!<br>
        </font>
    </td>
    </tr>
    
    <tr>
        <%
        String username = (String)session.getAttribute("s1");
        %>
        
        <%
        try 
        {

            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con = DriverManager.getConnection("jdbc:odbc:OnlineExam");
            Statement st = con.createStatement();
            st.executeUpdate("update Login set Password='" + request.getParameter("newpass") + "' where Username='"+ request.getParameter("user")+"')");
            
            st.close();
        }
        catch(Exception e) 
        {
            out.println();
        }
            %>

        
    </tr>
    
</table>

</body>
</html>
<!--
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recruitment System</title>
    </head>
    <body>
        
                <p>
            <%
/*            
            
            String username = (String)session.getAttribute("s1");
        try 
        {

            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con = DriverManager.getConnection("jdbc:odbc:OnlineExam");
            Statement st = con.createStatement();
            st.executeUpdate("update Login set Password='" + request.getParameter("newpass") + "' where Username='"+ request.getParameter("user")+"')");
            
            st.close();
        }
        catch(Exception e) 
        {
            out.println();
        }
  */          %>
            
            <font color="red" size="5"> Your password has been updated successfully!!!<br>
        </font></p>
            
    </body>
</html>
-->