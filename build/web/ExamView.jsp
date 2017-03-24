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
<%
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        String sql = null;
        String pos,jid,exid;
        
        jid=request.getParameter("jobid");
        pos=request.getParameter("post");
        exid=request.getParameter("examid");
        
        
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            con = DriverManager.getConnection("jdbc:odbc:OnlineExam");
            st = con.createStatement();
        } catch (Exception ex) {
            out.println("Error: " + ex.toString());
        }
%>


    <%
                session.setAttribute("jobid", jid);
                session.setAttribute("post", pos);
                session.setAttribute("examid", exid); 
    %>

    <%
            String examid = (String)session.getAttribute("examid");    
            String jobid = (String)session.getAttribute("jobid");    
            String post = (String)session.getAttribute("post");    
            
            out.println("Exam ID: "+examid+" Job ID: "+jobid);
            String qry = "select QuestionNo, Question, Option1, Option2, Option3, Option4, Answer from Question where ExamID='"+examid+"'and JobID='"+jobid+"' order by QuestionNo;";
            rs = st.executeQuery(qry);
            

%>
    
    <table width="100%" border="1">
        <tr>
            <td height="28" colspan="2" bgcolor="#624631"><jsp:include page="CandidateHeader.jsp"/></td>
        </tr>
        <tr>
            <td width="3%" height="354" valign="top" bgcolor="#624631"><jsp:include page="Candidatemenu.jsp"/></td>
            <td width="99%" bgcolor="#F2DFE2" valign="top">
                <div class="Reg" align="center">
                    <form action="CalculateResult.jsp" method="post">
                    <table width="90%" border="1">
                        
                        <%
                            out.println("<tr><td align=center colspan=4><b><i>|| Exam ID: "+examid+" || Post: "+post+" || Job ID: "+jobid+" ||</i></b></td></tr>");
                            while(rs.next())
                               {
                                String q=""+rs.getString("QuestionNo");
                                String o1=""+rs.getString("Option1");
                                String o2=""+rs.getString("Option2");
                                String o3=""+rs.getString("Option3");
                                String o4=""+rs.getString("Option4");
                                
                                out.println("<tr>");
                                out.println("<td colspan=4><br>");
                                out.println(""+q+" . ");
                                out.println(""+rs.getString("Question")+"");
                                out.println("</td>");
                                out.println("</tr>");
                                out.println("<tr>");
                                out.println("");
                                out.println("<td>A: "+"<input type=radio name='ques"+q+"' value='"+o1+"'>"+o1+"</td>");                                
                                out.println("<td>B: "+"<input type=radio name='ques"+q+"' value='"+o2+"'>"+o2+"</td>");
                                out.println("<td>C: "+"<input type=radio name='ques"+q+"' value='"+o3+"'>"+o3+"</td>");
                                out.println("<td>D: "+"<input type=radio name='ques"+q+"' value='"+o4+"'>"+o4+"</td>");
                                out.println("</tr>");
                                
                                }
                            st.close();
                        %>
                        <tr><td align="center" colspan="4"><br><input type="submit" value="Submit Your Answers"></td></tr>
                    </table>
                    </form>
                </div>
            </td>
        </tr>
    </table>
</body>
