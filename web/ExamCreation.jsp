<%@page import="java.io.*,java.sql.*"session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <style type="text/css">
            <!--
            .style1 {
                font-size: 18px;
                font-weight: bold;
                color: #FF0000;
            }
            .style7 {color: #CC3333; font-weight: bold; }
            .style14 {color: #006699}
            .style19 {color: #003366; font-weight: bold; }
            .style20 {color: #663366}
            -->
        </style>
    </head>
    <body style="margin:0px" bgcolor="#FFFFFF">
        <table width="100%" border="1" bgcolor="#FFFFFF">
            <tr>
                <td height="107" colspan="2"><jsp:include page="CompanyHeader.jsp"/></td>
            </tr>
            <tr>
                <td width="1" height="512"><jsp:include page="Companymenu.html"/></td>
                <td width="961" bgcolor="#B0CDD7" valign="top">
                    <table width="277" border="0" align="center">
                        <tr>
                            <td colspan="2"><div align="center" class="style1">
                                    <p class="style7 style14">Exam Creation </p>
                            </div></td>
                        </tr>
                        <tr>
                            <td>
                        <%
        String jid = request.getParameter("jobid");
        try {
            if (jid == null) {
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                Connection con = DriverManager.getConnection("jdbc:odbc:OnlineExam");
                Statement st = con.createStatement();
                        %>
                        <form name="form1" action="ExamCreation.jsp">
                            <table>
                                <tr>
                            <td width="163" height="42"><span class="style19">Select a JobID </span></td>
                            <td width="104">
                                <label>
                                    <select name="jobid">
                                        <%      ResultSet rs = st.executeQuery("select * from JobDetails");
                                    String s1 = null;
                                    // String s2=null;
                                    while (rs.next()) {
                                        s1 = rs.getString("JobId");
                                        //    s2=rs.getString("Post");

                                        %>
                                        <option value="<%=s1%>"><%=s1%></option>
                                        <% }//while %>
                                    </select>
                                </label>   
                            </td></tr>
                            <tr><td> <div align="center">
                                        <input type="submit" value="Show Details"> 
                            </div></td></tr> 
                            </table>
                        </form> 
                            </td></tr>
                        <%
                          }//if
                          else {
                              jid = request.getParameter("jobid");
                              Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                              Connection con = DriverManager.getConnection("jdbc:odbc:OnlineExam");
                              Statement st = con.createStatement();
                              Statement st2 = con.createStatement();
                              ResultSet rs = st.executeQuery("select * from JobDetails where JobId='" + jid + "'");
                              String s2 = null;
                              while (rs.next()) {
                                  s2 = rs.getString("post");
                                  
                                  session.setAttribute("post", s2);

                        %>
                        <tr>
                            <td><span class="style19">Post Name :</span></td>
                            <td><%=s2%></td>
                        </tr>
                    </table>
                    <p>&nbsp;</p>
                    <form method="post" action="saveexamdetails.jsp">
                        <table width="318" border="1" align="center">
                            <tr>
                                <td width="138" height="40"><div align="center" class="style4 style20"><strong>Exam ID</strong></div></td>
                                <td width="164"><input type="text" name="examid"></td>
                            </tr>
                            <tr>
                                <td height="40"><div align="center" class="style4 style20"><strong>Exam Name </strong></div></td>
                                <td ><input type="text" name="examname"></td>
                            </tr>
                            <tr>
                                <td height="41" ><div align="center" class="style4 style20"><strong>Cutoff %</strong></div></td>
                                <td ><input type="text" name="cutoff"></td>
                            </tr>
                            
                            <tr>
                                <td height="33" colspan="2" ><div align="center">
                                        <input type="submit" name="Submit" value="Submit">
                                </div>        </td>
                            </tr>
                        </table>
                    </form>
                    <%
                }//while
                session.setAttribute("jobid", request.getParameter("jobid"));
                session.setAttribute("post", s2);
            }//else

        }//try
        catch (Exception e) {
            out.println(e);
        }
                    %>
                    
                </td>
            </tr>
        </table>
    </body>
</html>
