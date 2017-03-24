
<%@page import="java.io.*,java.sql.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recruitment System</title>
    </head>
    <body bgcolor="#D9EEFB">
        <p>
            <% try {

            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con = DriverManager.getConnection("jdbc:odbc:OnlineExam");
            Statement st = con.createStatement();
            //Statement st2 = con.createStatement();
            Statement st3 = con.createStatement();
            String status = "s";
            //st2.executeUpdate("insert into Login values('" + request.getParameter("username") + "','" + request.getParameter("password") + "','" + status + "')");
            st.executeUpdate("update Details set Name='" + request.getParameter("name") + "',CollegeName='" + request.getParameter("college") + "',CollegePhone='" + request.getParameter("collegephone") + "',CollegeEmail='" + request.getParameter("collegeemail") + "',EmailID='" + request.getParameter("email") + "',Telephone='" + request.getParameter("telephone") + "',Address='" + request.getParameter("address") + "',State='" + request.getParameter("state") + "',Pin='" + request.getParameter("pin") + "'");
            if (request.getParameter("sel_cat").equals("Experienced")) {
                st3.executeUpdate("update Experienced set ExpYears='" + request.getParameter("expyears") + "',Company='" + request.getParameter("company") + "',Designation='" + request.getParameter("designation") + "',Salary='" + request.getParameter("salary") + "',ComAddress='" + request.getParameter("comAddress") + "'");
            }
            st.close();
            //st2.close();
            st3.close();
        } catch (Exception e) {
            out.println();
        }

            %>
            
            <font color="red" size="5"> You have registered successfully!!!<br>
        </font></p>
        <p><a href="Login.jsp"><strong>Go Forward</strong></a></p>
    </body>
</html>
