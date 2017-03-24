<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
    
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>www.CarrierMithr.com</title>
    <style type="text/css">
        <!--
        .body {
            margin:0%;
        }
        a:link {
            color: #003366;
            text-decoration: underline;
        }
        a:visited {
            text-decoration: underline;
            color: #660066;
        }
        a:hover {
            text-decoration: none;
            color: #CC6633;
        }
        a:active {
            text-decoration: underline;
            color: #990033;
        }
        .style10 {
            color: #993300;
            font-weight: bold;
        }
        .style11 {
            color: #993333;
            font-weight: bold;
        }
        .style12 {color: #339933}
        body,td,th {
            color: #336633;
        }
        -->
    </style>
</head>
    
<body style="margin:0px">
<table width="100%" height="492" border="1">
    <tr valign="top">
        <td height="120" bgcolor="#624631" colspan="2">
            <jsp:include page="CompanyHeader.jsp"/>
            <font size="5" color="#000000"><b>Welcome</b></font> <font size="6" color="#ffffff"><b> <%= session.getAttribute("s1") %></b></font>
        </td>
        <td></td>
    </tr>
    
    
    <tr>
    <td width="20%" height="449" valign="top" bgcolor="#624631">
        <jsp:include page="Companymenu.html"/>
    </td>
    <td >
        <form action="savejobdetails.jsp" method="post">
<table width =85% border=0 cellpadding=3 cellspacing=0>
                            <tr >
                                <td colspan="2" bgcolor="#F2DFE2"> <div align="left" class="style4">
                                        <div align="center" class="style5">Job Details </div>
                                </div></td>
                            </tr>
                            <tr >
                                <td width="33%" bgcolor="#FFFFFF"><div align="left"><font SIZE="2" COLOR="black" face =arial >Unique Job_ID</font></div></td>
                                <td width="67%" bgcolor="#FFFFFF"><div align="left">
                                        <input TYPE="text" NAME="Jobid" id="Jobid" size=30 maxlength=30>
                                </div></td>
                            </tr>
                            <tr bgcolor =#FEF7E9>
                                <td bgcolor="#E6F0F0"><div align="left"><font SIZE="2" COLOR="black" face =arial>Name of post</font></div></td>
                                <td bgcolor="#E6F0F0"><div align="left">
                                        <input type="text" NAME="post"  id="post" size=30 maxlength=50>
                                </div></td>
                            </tr>
                            <tr bgcolor =#FEF7E9>
                                <td bgcolor="#F2DFE2"><div align="left"><font SIZE="2" COLOR="black" face =arial>Criteria</font></div></td>
                                <td bgcolor="#F2DFE2"><div align="left">
                                        <input NAME="criteria" TYPE="text" id="criteria" size=30  maxlength=50>
                                </div></td>
                            </tr>
                            <tr bgcolor =#FEF7E9>
                                <td bgcolor="#F2DFE2"><div align="left"><font SIZE="2" COLOR="black" face =arial>No of Vacancies</font></div></td>
                                <td bgcolor="#F2DFE2"><div align="left">
                                        <input NAME="vacancies" TYPE="text" id="vacancies" size=30  maxlength=50>
                                </div></td>
                            </tr>
                            <tr>
                                <td bgcolor="#FFFFFF"><div align="left"><font SIZE="2" COLOR="black" face =arial>Salary/Annum</font></div></td>
                                <td bgcolor="#FFFFFF"><div align="left">
                                        <input TYPE="text" NAME="Salary" id="Salary" size=30 maxlength=30 value=''>
                                </div></td>
                            </tr>
                           
                            <tr  bgcolor =#FEF7E9>
                                <td bgcolor="#F2DFE2"><div align="left"><font SIZE="2" COLOR="black" face =arial>Last Date</font></div></td>
                                <td bgcolor="#F2DFE2"><div align="left">
                                        <input TYPE="text" NAME="last" id="last" size=30 maxlength=30 value=''>
                                </div></td> 
                            </tr>
                            <tr><td height="51" colspan=2 bgcolor="#F2DFE2" ><div align="center"><br>
                                <input TYPE="submit" value="Submit" onclick="return valid()">
                                </div>                                 
                             </td>
                            </tr>
    
</table>
        </form>
        
    </td>
    </tr>
    
</table>
        

</body>
</html>
    