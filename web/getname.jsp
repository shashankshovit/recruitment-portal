
<%-- 
    Document   : getname
    Created on : Jun 21, 2012, 10:19:10 PM
    Author     : Shanky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
        String username = (String)session.getAttribute("s1");
        %>
        
        <%!
            Connection con;
            Statement st;
            ResultSet rs;
        %>
        
        <%
        try 
        {

            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            con = DriverManager.getConnection("jdbc:odbc:OnlineExam");
            st = con.createStatement();
            rs = st.executeQuery("select Name from Details");
            rs.next();
            //response.expires = -1;
            out.println(rs.getString("Name"));
            //response.write();
            st.close();
        }
        catch(Exception e) 
        {
            out.println("error while fetching name using ajax");
        }
            %>

        
        
    </body>
</html>
