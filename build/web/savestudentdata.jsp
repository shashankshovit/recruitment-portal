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
            Statement st3 = con.createStatement();
            String status = "s";
            String d= request.getParameter("d");
            String m= request.getParameter("m");
            String y= request.getParameter("y");
            String dt = ""+y+"-"+m+"-"+d;
            java.sql.Date dob = java.sql.Date.valueOf(dt);
            
            st2.executeUpdate("insert into Login values('" + request.getParameter("comusername").toLowerCase() + "','" + request.getParameter("compassword") + "','" + status + "')");
            st.executeUpdate("insert into Details values('" + request.getParameter("comusername").toLowerCase() + "','" + request.getParameter("comname") + "','" + request.getParameter("gender") + "','"  + request.getParameter("college") + "','" + request.getParameter("collegephone") + "','" + request.getParameter("collegeemail") + "','" + request.getParameter("branch") + "','" + request.getParameter("Degree") + "','" + request.getParameter("email") + "','" + request.getParameter("telephone") + "','" + request.getParameter("address") + "','" + request.getParameter("state") + "','" + request.getParameter("pin") + "')"); //+ "','" + request.getParameter("sel_cat") + "')");
            if (request.getParameter("sel_cat").equals("Experienced")) {
                st3.executeUpdate("insert into Experienced values('" + request.getParameter("comusername").toLowerCase() + "','" + request.getParameter("expyears") + "','" + request.getParameter("company") + "','" + request.getParameter("designation") + "','" + request.getParameter("salary") + "','" + request.getParameter("comAddress") + "')");
            }
            st.close();
            st2.close();
            st3.close();
        }
        catch (Exception e) 
        {
            out.println(e);
        }

            %>
            
            <font color="red" size="5"> You have been registered successfully!!!<br>
        </font></p>
        <p><a href="Login.jsp"><strong>Go Forward</strong></a></p>

        
    </body>
</html>
