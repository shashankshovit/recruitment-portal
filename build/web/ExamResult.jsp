<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true" import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recruitment</title>
    </head>
    <body>
        <table width="104%" border="1">
            <tr>
                <td height="23" colspan="2"><jsp:include page="CandidateHeader.jsp"/></td>
            </tr>
            <tr>
                <td width="1"  height="597"><jsp:include page="Candidatemenu.jsp"/></td>
                <td width="738" valign="top">
                    
                    <%
        String uname = session.getAttribute("s1").toString().toLowerCase();
        String sql = "";
        Connection con;
        Statement st;
        ResultSet rs = null;
        // out.println(uname);
        try {
            sql = "select * from Result where StudentID='" + uname + "'";
                
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            con = DriverManager.getConnection("jdbc:odbc:OnlineExam");
            st = con.createStatement();
            rs = st.executeQuery(sql);
                    %>
                        
                    <table width="546" border="1" align="center">
                        <tr bgcolor="#CCCCCC">
                            <td bgcolor="#CCCCCC"><div align="center"><strong>Exam ID</strong></div></td>
                            <td bgcolor="#CCCCCC"><div align="center"><strong>Job ID</strong></div></td>
                            <td bgcolor="#CCCCCC"><div align="center"><strong>Correct</strong></div></td>
                            <td bgcolor="#CCCCCC"><div align="center"><strong>Wrong</strong></div></td>
                        </tr>
                        <%
                        while (rs.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rs.getString(3) + "</td>");
                            out.println("<td>" + rs.getString(4) + "</td>");
                            out.println("<td>" + rs.getString(5) + "</td>");
                            out.println("<td>" + rs.getString(6) + "</td>");
                                
                            out.println("</tr>");
                        }%>
                        <tr><td colspan="4" align="center"><br><br><b>Kindly refresh the page if the current result is not displayed.</b><br></td></tr>
                    </table>
                    <%
                        
        } catch (Exception ex) {
            out.println(ex.toString());
        }
                    %>
                </td>
            </tr>
        </table>
    </body>
</html>
