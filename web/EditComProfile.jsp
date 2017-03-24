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
            rs = st.executeQuery("select * from Com where CUsername='"+(String)session.getAttribute("s1")+"');");
            //rs.next();
            
            if(rs==null)out.print("result Set Empty");
    } 
    catch(Exception e) 
    {
            out.println(e);
        }
        
        
        %>
    <table width="100%" border="1">
        <tr>
            <td height="28" colspan="2" bgcolor="#624631"><jsp:include page="Header.jsp"/></td>
        </tr>
        <tr>
            <td width="3%" height="354" valign="top" bgcolor="#624631"><jsp:include page="Companymenu.html"/></td>
            <td width="99%" bgcolor="#F2DFE2" valign="top">
                <div class="Reg" align="center">
                    <form action="savecompanydata.jsp" method="post" name="form1" id="form1">
                        <table width =85% border=0 >
                            <tr>
                                <td colspan="2" bgcolor="#F2DFE2"> <div align="left" class="style4">
                                        <div align="center" class="style5"><%= session.getAttribute("s1")%> : Edit Company Profile </div>
                                </div></td>
                            </tr>
                            <tr>
                                <td width="33%" bgcolor="#FFFFFF"><div align="left"><font SIZE="2" COLOR="black" face =arial >Name</font></div></td>
                                <td width="67%" bgcolor="#FFFFFF"><div align="left">
                                        <input TYPE="text" NAME="commname" id="commname" size=30 maxlength=30 value="">
                                </div></td>
                            </tr>
                            <tr bgcolor =#FEF7E9>
                                <td bgcolor="#E6F0F0"><div align="left"><font SIZE="2" COLOR="black" face =arial>Address</font></div></td>
                                <td bgcolor="#E6F0F0"><div align="left">
                                        <input NAME="commaddress" TYPE="text" id="commaddress" size=30 maxlength=50>
                                </div></td>
                            </tr>
                            <tr bgcolor =#FEF7E9>
                                <td bgcolor="#F2DFE2"><div align="left"><font SIZE="2" COLOR="black" face =arial>Post</font></div></td>
                                <td bgcolor="#F2DFE2"><div align="left">
                                        <input NAME="commpost" TYPE="text" id="commpost" size=30  maxlength=50 value="">
                                </div></td>
                            </tr>
                            <tr bgcolor =#FEF7E9>
                                <td bgcolor="#F2DFE2"><div align="left"><font SIZE="2" COLOR="black" face =arial>Criteria</font></div></td>
                                <td bgcolor="#F2DFE2"><div align="left">
                                        <input NAME="commcriteria" TYPE="text" id="commcriteria" size=30  maxlength=50  value="">
                                </div></td>
                            </tr>
                            <tr>
                                <td bgcolor="#FFFFFF"><div align="left"><font SIZE="2" COLOR="black" face =arial>Email_ID</font></div></td>
                                <td bgcolor="#FFFFFF"><div align="left">
                                        <input TYPE="text" NAME="commemail" id="commemail" size=30 maxlength=30 value="">
                                </div></td>
                            </tr>
                            <tr>
                                <td bgcolor="#E6F0F0"><div align="left"><font SIZE="2" COLOR="black" face =arial>Contact No</font></div></td>
                                <td bgcolor="#E6F0F0"><div align="left">
                                        <input TYPE="text" NAME="commcontact" id="commcontact" size=32 maxlength=30 value="">
                                </div></td>
                            </tr>
                            
            
                            <tr  bgcolor =#FEF7E9>
                                <td bgcolor="#E6F0F0"><div align="left"><font SIZE="2" COLOR="black" face =arial>CutOff %</font></div></td>
                                <td bgcolor="#E6F0F0"><div align="left">
                                        <input TYPE="text" NAME="commcutoff" id="commcutoff" size=30 maxlength=30 value="">
                                                                                                                                      </div></td>
                            </tr>
                            <tr>
                                <td height="51" colspan=2 bgcolor="#F2DFE2" ><div align="center"><br>
                                        <input TYPE="reset"> &nbsp;&nbsp;<input TYPE="submit" value="Edit" onclick="return valid()">
                                                                            </div>                                 
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </td>
        </tr>
    </table>
</body>
