<%-- 
    Document   : savecompanydata
    Created on : Mar 26, 2012, 5:18:44 PM
    Author     : ASD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recruitment System</title>
    </head>
    <body>
        
                <p>
            <% 
        try 
        {

            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con = DriverManager.getConnection("jdbc:odbc:OnlineExam");
            Statement st = con.createStatement();
            Statement st2 = con.createStatement();
            String status = "c";
            st2.executeUpdate("insert into Login values('" + request.getParameter("commusername").toLowerCase() + "','" + request.getParameter("commpassword") + "','" + status + "')");
            st.executeUpdate("insert into Com (CName, CAddress, CPost, CCriteria, CUsername, CEmail, CContact, CCutoff) values('" + request.getParameter("commname") + "','" + request.getParameter("commaddress") + "','"  + request.getParameter("commpost") + "','" + request.getParameter("commcriteria") +  "','" + request.getParameter("commusername").toLowerCase() + "','" + request.getParameter("commemail") + "','" + request.getParameter("commcontact") + "','" + request.getParameter("commcutoff") + "')");
            st.close();
            st2.close();
        }
        catch(Exception e) 
        {
            out.println(e);
        }
            %>
            
            <font color="red" size="5"> Your company is registered successfully!!!<br>
        </font></p>
        <p><a href="Login.jsp"><strong>Go Forward</strong></a></p>        
    </body>
</html>
