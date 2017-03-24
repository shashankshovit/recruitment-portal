    <%@page import="java.io.*,java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Recruitment </title>
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
            var a=document.form1.comname.value;
            var b=document.form1.compassword.value;
            var c=document.form1.comemail.value;
            var d=document.form1.comcontact.value;
            var e=document.form1.comcutoff.value;
            if(document.form1.comname.value=="")
            {
                alert("Enter Company Name");
                document.form1.comname.focus();
                return false;
            }
            else if(parseInt(a))
            {
                alert("Company Name cannot be integer");
                document.form1.comname.focus();
                return false;
            }
            if(document.form1.comaddress.value=="")
            {
                alert("Enter Company Address");
                document.form1.comaddress.focus();
                return false;
            }
            if(document.form1.compost.value=="")
            {
                alert("Enter Company Post");
                document.form1.compost.focus();
                return false;
            }
            if(document.form1.comcriteria.value=="")
            {
                alert("Enter Company Criteria");
                document.form1.comcriteria.focus();
                return false;
            }
            if(document.form1.comusername.value=="")
            {
                alert("Enter Company Username");
                document.form1.comusername.focus();
                return false;
            }
            if(document.form1.compassword.value=="")
            {
                alert("Enter Company Password");
                document.form1.compassword.focus();
                return false;
            }
            if(b.length<8)
            {
                alert("Password should be minimum 8 characters");
                document.form1.compassword.focus();
                return false;
            }
            if(document.form1.comemail.value=="")
            {
                alert("Enter Company Email");
                document.form1.comemail.focus();
                return false;
            }
            else if(c.indexOf('@')==-1)
            {
                alert("Enter Email Correctly");
                document.form1.comemail.focus();
                return false;
            }
            else if(c.indexOf('.')==-1)
            {
                alert("Enter Email Correctly");
                document.form1.comemail.focus();
                return false;
            }
            if(document.form1.comcontact.value=="")
            {
                alert("Enter Company Contact no:");
                document.form1.comcontact.focus();
                return false;
            }
            else if(!parseInt(d))
            {
                alert("Enter ssinteger");
                document.form1.comcontact.focus();
                return false;
            }
            else if(((document.form1.comcontact.value.length)<6) || ((document.form1.comcontact.value.length)>11))
            {
                alert("Phone no should contain atleast 6 integers ");
                document.form1.comcontact.focus();
                return false;
            }
            if(document.form1.comcutoff.value=="")
            {
                alert("Enter Company Cutoff");
                document.form1.comcutoff.focus();
                return false;
            }
            else if(!parseInt(e))
            {
                alert("Enter integer");
                document.form1.comcutoff.focus();
                return false;
            }
            else if(parseInt(e)<0||parseInt(e)>100)
            {
                alert("Enter cutoff in %");
                document.form1.comcutoff.focus();
                return false;
            }

            return true;

        }
    </script>
    
</head>

<body style="margin:0px">

    
    
        <table width="100%" border="1">
        <tr>
            <td height="28" colspan="2" bgcolor="#624631"><jsp:include page="CompanyHeader.jsp"/></td>
        </tr>
        <tr>
            <td width="7%" height="354" valign="top" bgcolor="#624631"><jsp:include page="Companymenu.html"/></td>
            <td width="99%" bgcolor="#F2DFE2" valign="top">

    
    
    
    
    
                        <%
        String jid = request.getParameter("jobid");
        try {
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                Connection con = DriverManager.getConnection("jdbc:odbc:OnlineExam");

               if (jid == null) {
                Statement st = con.createStatement();
                        %>
                        <form name="form1" action="AddQuestions.jsp">
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
                                        s1 = rs.getString("JobID");
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
                            
                        <%
                          }//if
                          else {
                              //jid = request.getParameter("jobid");
                             // Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                             // Connection con = DriverManager.getConnection("jdbc:odbc:OnlineExam");

    
                          %>
    
    
    
    
    
<%
                //Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                //Connection con = DriverManager.getConnection("jdbc:odbc:OnlineExam");
                Statement st = con.createStatement();
                Statement st2 = con.createStatement();
%>
                <div class="Reg" align="center">
                    <form action="savequestions.jsp" method="post" name="form1" id="form1">
                        <table width =85% border=0 >
                        <tr >
                                <td colspan="2" bgcolor="#F2DFE2"> <div align="left" class="style4">
                                        <div align="center" class="style5">Add Question </div>
                                </div></td>
                            </tr>    
                           
<!--                           
                                     <tr>
                                    <td width="129" height="32"><span class="style15">Select an JobID </span></td>
                                    <td width="118"><label>
                                            <select name="jobid">
<%
/*
                                        ResultSet rs2 = st2.executeQuery("select * from JobDetails");
                                        String s2 = null;
                                        // String s2=null;
                                        while (rs2.next()) {
                                            s2 = rs2.getString("JobID");
                                            //    s2=rs.getString("Post");
%>
                                                <option value="<%=s2%>"><%=s2%></option>
<%
                                        }
*/
%>
                                            </select>
                                        </label>
                                            
                                </td></tr>
-->                                    
                                <td width="129" height="32"><span class="style15">Select an ExamID </span></td>
                                <td width="118"><label>
                                        <select name="examid">
                                            <%      ResultSet rs = st.executeQuery("select * from Exam where JobID ='"+jid+"'");
                                        String s1 = null;
                                        // String s2=null;
                                        while (rs.next()) {
                                            s1 = rs.getString("ExamID");
                                            //    s2=rs.getString("Post");
%>
                                            <option value="<%=s1%>"><%=s1%></option>
                                            <%}%>
                                        </select>
                                    </label>
                                        
                            </td></tr>

                        
                    
                        
                        
                        
                        <tr><td><input type="hidden" value="<%=request.getParameter("jobid")%>" name="jobid"></td></tr>
                        
                        
                            <tr  bgcolor =#FEF7E9>
                                <td bgcolor="#F2DFE2"><div align="left"><font SIZE="2" COLOR="black" face =arial>Question No %</font></div></td>
                                <td bgcolor="#F2DFE2"><div align="left">
                                        <input TYPE="text" NAME="quesno" id="quesno" size=30 maxlength=30 value=''>
                                </div></td>
                            </tr>
     
                      
                            <tr  bgcolor =#FEF7E9>
                                <td bgcolor="#E6F0F0"><div align="left"><font SIZE="2" COLOR="black" face =arial>Question %</font></div></td>
                                <td bgcolor="#E6F0F0"><div align="left">
                                      <textarea Name="question" Rows="5" Cols="50"> Question </textarea>
                                   
                                </div></td>
                            </tr>
                            <tr  bgcolor =#FEF7E9>
                                <td bgcolor="#F2DFE2"><div align="left"><font SIZE="2" COLOR="black" face =arial>Option1 %</font></div></td>
                                <td bgcolor="#F2DFE2"><div align="left">
                                        <input TYPE="text" NAME="Option1" id="Option1" size=30 maxlength=30 value=''>
                                </div></td>
                            </tr>
                            <tr  bgcolor =#FEF7E9>
                                <td bgcolor="#F2DFE2"><div align="left"><font SIZE="2" COLOR="black" face =arial>Option2%</font></div></td>
                                <td bgcolor="#F2DFE2"><div align="left">
                                        <input TYPE="text" NAME="Option2" id="Option2" size=30 maxlength=30 value=''>
                                </div></td>
                            </tr>
                            <tr  bgcolor =#FEF7E9>
                                <td bgcolor="#F2DFE2"><div align="left"><font SIZE="2" COLOR="black" face =arial>Option3 %</font></div></td>
                                <td bgcolor="#F2DFE2"><div align="left">
                                        <input TYPE="text" NAME="Option3" id="Option3" size=30 maxlength=30 value=''>
                                </div></td>
                            </tr>

                            <tr  bgcolor =#FEF7E9>
                                <td bgcolor="#F2DFE2"><div align="left"><font SIZE="2" COLOR="black" face =arial>Option4 %</font></div></td>
                                <td bgcolor="#F2DFE2"><div align="left">
                                        <input TYPE="text" NAME="Option4" id="Option4" size=30 maxlength=30 value=''>
                                </div></td>
                            </tr>

                      <tr  bgcolor =#FEF7E9>
                                <td bgcolor="#E6F0F0"><div align="left"><font SIZE="2" COLOR="black" face =arial>Answer %</font></div></td>
                                <td bgcolor="#E6F0F0"><div align="left">
                                        <input TYPE="text" NAME="Answer" id="Answer" size=30 maxlength=30 value=''>
                                </div></td>
                             </tr>      
                            
                            <tr>
                                <td height="51" colspan=2 bgcolor="#F2DFE2" ><div align="center"><br>
                                        <input TYPE="Submit" value="Add Question" onclick="return valid()">
                                </div>                                 </td>
                            </tr>



                        <%  }   %>                
                        
                        
                        <%                    
        }//try
        catch (Exception e) {
            out.println(e);
        }
                    %>







                        </table>
                    </form>
                </div>
            </td>
        </tr>
    </table>
</body>
</html>

</html>
