<%@page import="java.io.*,java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Recruitment System</title>
    <style type="text/css">
        <!--
        .body {
            margin:0%;
        }
        a:link {
            color: #000066;
            text-decoration: underline;
        }
        a:visited {
            text-decoration: underline;
            color: #C0DCC0;
        }
        a:hover {
            text-decoration: none;
            color: #996666;
        }
        a:active {
            text-decoration: underline;
            color: #FF9999;
        }
        .style4 {
            color: #CC3333;
            font-weight: bold;
        }
        .style5 {color: #006699}
        -->
    </style>
    <script language="javascript">
        function valid()
        {
            var a=document.form1.commname.value;
            var b=document.form1.commpassword.value;
            var c=document.form1.commemail.value;
            var d=document.form1.commcontact.value;
            var e=document.form1.commcutoff.value;
            if(document.form1.commname.value=="")
            {
                alert("Enter Company Name");
                document.form1.commname.focus();
                return false;
            }
            else if(parseInt(a))
            {
                alert("Company Name cannot be integer");
                document.form1.commname.focus();
                return false;
            }
            if(document.form1.commaddress.value=="")
            {
                alert("Enter Company Address");
                document.form1.commaddress.focus();
                return false;
            }
            if(document.form1.commpost.value=="")
            {
                alert("Enter Company Post");
                document.form1.commpost.focus();
                return false;
            }
            if(document.form1.commcriteria.value=="")
            {
                alert("Enter Company Criteria");
                document.form1.commcriteria.focus();
                return false;
            }
            if(document.form1.commusername.value=="")
            {
                alert("Enter Company Username");
                document.form1.commusername.focus();
                return false;
            }
            if(document.form1.commpassword.value=="")
            {
                alert("Enter Company Password");
                document.form1.commpassword.focus();
                return false;
            }
            if(b.length<8)
            {
                alert("Password should be minimum 8 characters");
                document.form1.commpassword.focus();
                return false;
            }
            if(document.form1.commemail.value=="")
            {
                alert("Enter Company Email");
                document.form1.commemail.focus();
                return false;
            }
            else if(c.indexOf('@')==-1)
            {
                alert("Enter Email Correctly");
                document.form1.commemail.focus();
                return false;
            }
            else if(c.indexOf('.')==-1)
            {
                alert("Enter Email Correctly");
                document.form1.commemail.focus();
                return false;
            }
            if(document.form1.commcontact.value=="")
            {
                alert("Enter Company Contact no:");
                document.form1.commcontact.focus();
                return false;
            }
            else if(!parseInt(d))
            {
                alert("Enter ssinteger");
                document.form1.commcontact.focus();
                return false;
            }
            else if(((document.form1.commcontact.value.length)<6) || ((document.form1.commcontact.value.length)>11))
            {
                alert("Phone no should contain atleast 6 integers ");
                document.form1.commcontact.focus();
                return false;
            }
            if(document.form1.commcutoff.value=="")
            {
                alert("Enter Company Cutoff");
                document.form1.commcutoff.focus();
                return false;
            }
            else if(!parseInt(e))
            {
                alert("Enter integer");
                document.form1.commcutoff.focus();
                return false;
            }
            else if(parseInt(e)<0||parseInt(e)>100)
            {
                alert("Enter cutoff in %");
                document.form1.commcutoff.focus();
                return false;
            }

            return true;

        }
    </script>
    
</head>

<body style="margin:0px">
    <table width="100%" border="1">
        <tr>
            <td height="28" colspan="2" bgcolor="#624631"><jsp:include page="Header.jsp"/></td>
        </tr>
        <tr>
            <td width="3%" height="354" valign="top" bgcolor="#624631"><jsp:include page="Companymenu.html"/></td>
            <td width="99%" bgcolor="#F2DFE2" valign="top">
                <div class="Reg" align="center">
                    
                    <%
            
            //String jid = request.getParameter("jobid");
            /*String  = request.getParameter("");
            String  = request.getParameter("");
            String  = request.getParameter("");
            String  = request.getParameter("");
            String  = request.getParameter("");
            */
            try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con = DriverManager.getConnection("jdbc:odbc:OnlineExam");
            Statement st = con.createStatement();
            
            ResultSet rs = st.executeQuery("select * from JobDetails");
            %>
            <table align="center" width="60%" border="1" bgcolor="#F5D2E9">
                <tr><td colspan="7" align="center"><b><font size="5">Job Details</font></b></td></tr>
                <tr>
                    <td><b>Job Id</b></td><td><b>Post</b></td><td><b>Criteria</b></td><td><b>Vacancies</b></td><td><b>Salary/Annum</b></td><td><b>Last Date</b></td><td><b>Edit</b></td>
                </tr>
                <%
                    while(rs.next())
                    {
                        out.println("<tr>");
                        out.println("<td>"+rs.getString(1)+"</td>");
                        out.println("<td>"+rs.getString(2)+"</td>");
                        out.println("<td>"+rs.getString(3)+"</td>");
                        out.println("<td>"+rs.getString(4)+"</td>");
                        out.println("<td>"+rs.getString(5)+"</td>");
                        out.println("<td>"+rs.getString(6)+"</td>");
                        out.println("<td><a href=\"EditComProfile.jsp\">Edit</a></td>");
                        out.println("</tr>");
                    }
                %>
            </table>>
            <font color="red" size="5"></font>
            <%   } catch (Exception e) {
            out.println(e);
        }

            %>
                    
                </div>
            </td>
        </tr>
    </table>
</body>
