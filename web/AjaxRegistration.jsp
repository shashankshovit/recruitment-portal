<%@page import="java.io.*" %>
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
            
            var xhttp;
            function ajaxhttp()
            {
                try
                {
                    alert("You are using a browser other than IE");     //ohter than IE
                    xhttp = new XMLHttpRequest();
                }catch(e)
                {
                    try
                    {
                        alert("Detected Internet Explorer");
                        xhttp = new ActiveXObject(Msxml2.XMLHTTP);      //IE
                    }catch(e)
                    {
                        try
                        {
                            alert("Detected IE, but second object created");
                            xhttp = new ActiveXObject(Microsoft.XMLHTTP);
                        }catch(e)
                        {
                            alert("Your browser does not support Ajax");
                            return false;
                        }
                    }
                }
                xhhtp.onreadystatechange = function()
                                            {
                                                if(xhttp.readystate == 4)
                                                    {
                                                        document.form1.comname.value=xhttp.responseText;
                                                    }
                                            }
                xhttp.open("post","getname.jsp",true);
                xhttp.send(null);
            }
            
            
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
            <td height="28" colspan="2" bgcolor="#624631"><jsp:include page="Header.jsp"/></td>
        </tr>
        <tr>
            <td width="7%" height="354" valign="top" bgcolor="#624631"><jsp:include page="menu.html"/></td>
            <td width="99%" bgcolor="#F2DFE2" valign="top">
                <div class="Reg" align="center">
                    <form action="savestudentdata.jsp" method="post" name="form1" id="form1">
                        <table width =85% border=0 cellpadding=3 cellspacing=0 >
                            <tr>
                                <td colspan="2" bgcolor="#F2DFE2"> <div align="left" class="style4">
                                        <br>
                                        <div align="center"><h1>This page is for candidate registration.</h1></div>
                                        <br>
                                        <div align="center" class="style5">Candidate Registration </div>
                                        <br>
                                </div></td>
                            </tr>
                            <tr>
                                <td width="33%" bgcolor="#FFFFFF"><div align="left"><font SIZE="2" COLOR="black" face =arial >username</font></div></td>
                                <td width="67%" bgcolor="#FFFFFF"><div align="left">
                                        <input TYPE="text" NAME="comusername" id="comusername" onkeydown="ajaxhttp()" size=30 maxlength=30>
                                </div></td>
                            </tr>
                            <tr bgcolor =#FEF7E9>
                                <td bgcolor="#E6F0F0"><div align="left"><font SIZE="2" COLOR="black" face =arial>Name</font></div></td>
                                <td bgcolor="#E6F0F0"><div align="left">
                                        <input NAME="comname" TYPE="text" id="comname" size=30 maxlength=50>
                                </div></td>
                            </tr>
                            <tr bgcolor =#FEF7E9>
                                <td bgcolor="#F2DFE2"><div align="left"><font SIZE="2" COLOR="black" face =arial>College</font></div></td>
                                <td bgcolor="#F2DFE2"><div align="left">
                                        <input NAME="college" TYPE="text" id="college" size=30  maxlength=50>
                                </div></td>
                            </tr>
                            <tr bgcolor =#FEF7E9>
                                <td bgcolor="#F2DFE2"><div align="left"><font SIZE="2" COLOR="black" face =arial>Collegephone</font></div></td>
                                <td bgcolor="#F2DFE2"><div align="left">
                                        <input NAME="collegephone" TYPE="text" id="collegephone" size=30  maxlength=50>
                                </div></td>
                            </tr>
                            <tr >
                                <td bgcolor="#FFFFFF"><div align="left"><font SIZE="2" COLOR="black" face =arial>College Email_Id</font></div></td>
                                <td bgcolor="#FFFFFF"><div align="left">
                                        <input TYPE="text" NAME="collegeemail" id="collegeemail" size=30 maxlength=30 value=''>
                                </div></td>
                            </tr>
                            <tr >
                                <td bgcolor="#E6F0F0"><div align="left"><font SIZE="2" COLOR="black" face =arial>Password</font></div></td>
                                <td bgcolor="#E6F0F0"><div align="left">
                                        <input TYPE="password" NAME="compassword" id="compassword" size=32 maxlength=30 value=''>
                                </div></td>
                            </tr>
                            <tr  bgcolor =#FEF7E9>
                                <td bgcolor="#F2DFE2"><div align="left"><font SIZE="2" COLOR="black" face =arial>Branch</font></div></td>
                                <td bgcolor="#F2DFE2"><div align="left">
                                        <input TYPE="text" NAME="branch" id="branch" size=30 maxlength=30 value=''>
                                </div></td>
                            </tr>
                  
                           
                             <tr  bgcolor =#FEF7E9>
                                <td bgcolor="#E6F0F0"><div align="left"><font SIZE="2" COLOR="black" face =arial>Pin %</font></div></td>
                                <td bgcolor="#E6F0F0"><div align="left">
                                        <input TYPE="text" NAME="pin" id="pin" size=30 maxlength=30 value=''>
                                </div></td>
                            </tr>
                             <tr  bgcolor =#FEF7E9>
                                <td bgcolor="#E6F0F0"><div align="left"><font SIZE="2" COLOR="black" face =arial>State %</font></div></td>
                                <td bgcolor="#E6F0F0"><div align="left">
                                        <input TYPE="text" NAME="state" id="state" size=30 maxlength=30 value=''>
                                </div></td>
                            </tr>
                             <tr  bgcolor =#FEF7E9>
                                <td bgcolor="#E6F0F0"><div align="left"><font SIZE="2" COLOR="black" face =arial>Telephone %</font></div></td>
                                <td bgcolor="#E6F0F0"><div align="left">
                                        <input TYPE="text" NAME="telephone" id="telephone" size=30 maxlength=30 value=''>
                                </div></td>
                            </tr>
                             <tr  bgcolor =#FEF7E9>
                                <td bgcolor="#E6F0F0"><div align="left"><font SIZE="2" COLOR="black" face =arial>Gender %</font></div></td>
                                <td bgcolor="#E6F0F0"><div align="left">
                                      Male<input TYPE="radio" NAME="gender" value="M" size=30 maxlength=30>
                                     Female<input TYPE="radio" NAME="gender" value="F" size=30 maxlength=30>
                                </div></td>
                            </tr>
                            <tr  bgcolor =#FEF7E9>
                                <td bgcolor="#E6F0F0"><div align="left"><font SIZE="2" COLOR="black" face =arial>SELECT CATEGORY %</font></div></td>
                                <td bgcolor="#E6F0F0"><div align="left">
                                      Experienced <input TYPE="radio" NAME="sel_cat" value="Experienced" size=30 maxlength=30>
                                     Non Exp<input TYPE="radio" NAME="sel_cat" value="Non_Experienced" size=30 maxlength=30>
                                </div></td>
                            </tr>
                            <tr  bgcolor =#FEF7E9>
                                <td bgcolor="#E6F0F0"><div align="left"><font SIZE="2" COLOR="black" face =arial>Degree %</font></div></td>
                                <td bgcolor="#E6F0F0"><div align="left">
                                     BA<input TYPE="radio" NAME="Degree" value="BA" size=30 maxlength=30>
                                     MA<input TYPE="radio" NAME="Degree" value="MA" size=30 maxlength=30>
                                     Btech<input TYPE="radio" NAME="Degree" value="B.Tech" size=30 maxlength=30>
                                     Mtech<input TYPE="radio" NAME="Degree" value="M.Tech" size=30 maxlength=30>
                                </div></td>
                            </tr>
                             <tr  bgcolor =#FEF7E9>
                                <td bgcolor="#E6F0F0"><div align="left"><font SIZE="2" COLOR="black" face =arial>Address %</font></div></td>
                                <td bgcolor="#E6F0F0"><div align="left">
                                      <textarea Name="address" Rows="5" Cols="50"> Your address </textarea>                                   
                                </div></td>
                            </tr>
                             <tr  bgcolor =#FEF7E9>
                                <td bgcolor="#E6F0F0"><div align="left"><font SIZE="2" COLOR="black" face =arial>DOB %</font></div></td>
                                <td bgcolor="#E6F0F0"><div align="left">
                                        Enter Dob:dd<select name="d">
                                        <script language="javascript">
                                        for(i=1;i<=31;i++) 
                                        document.write("<option value="+i+">"+i+"</option>");
                                        </script>
                                        </select>    
                                        mm<select name="m">
                                         <script language="javascript">
                                          for(i=1;i<=12;i++)
                                          document.write("<option value="+i+">"+i+"</option>");
                                           </script>   
                                        </select>
                                        yyyy<select name="y">
                                            <script language="javascript">  
                                             for(i=1950;i<2050;i++)
                                              document.write("<option value="+i+">"+i+"</option>")
                                            </script>
                                        </select>
                                </div></td>
                            </tr>
                            <tr  bgcolor =#FEF7E9>
                                <td bgcolor="#E6F0F0" colspan="2"><br>
                                    <div align="left">
                                        <font SIZE="2" COLOR="black" face =arial>
                                            <b>If you are an experienced user, fill in the following entries...</b>
                                        </font>
                                    </div><br>
                                </td>                                               
                            </tr>
                              
                             <tr  bgcolor =#FEF7E9>
                                <td bgcolor="#F2DFE2"><div align="left"><font SIZE="2" COLOR="black" face =arial>Company %</font></div></td>
                                <td bgcolor="#F2DFE2"><div align="left">
                                        <input TYPE="text" NAME="company" id="company" size=30 maxlength=30 value=''>
                                </div></td>
                            </tr>
                            <tr  bgcolor =#FEF7E9>
                                <td bgcolor="#E6F0F0"><div align="left"><font SIZE="2" COLOR="black" face =arial>Company Address %</font></div></td>
                                <td bgcolor="#E6F0F0"><div align="left">
                                      <textarea name="comAddress" Rows="5" Cols="50"> Company Address </textarea>
                                   
                                </div></td>
                            </tr>
                            <tr  bgcolor =#FEF7E9>
                                <td bgcolor="#F2DFE2"><div align="left"><font SIZE="2" COLOR="black" face =arial>Designation %</font></div></td>
                                <td bgcolor="#F2DFE2"><div align="left">
                                        <input TYPE="text" NAME="designation" id="designation" size=30 maxlength=30 value=''>
                                </div></td>
                            </tr>
                            <tr  bgcolor =#FEF7E9>
                                <td bgcolor="#F2DFE2"><div align="left"><font SIZE="2" COLOR="black" face =arial>Salary %</font></div></td>
                                <td bgcolor="#F2DFE2"><div align="left">
                                        <input TYPE="text" NAME="salary" id="salary" size=30 maxlength=30 value=''>
                                </div></td>
                            </tr>
                            <tr  bgcolor =#FEF7E9>
                                <td bgcolor="#E6F0F0"><div align="left"><font SIZE="2" COLOR="black" face =arial>Experience years %</font></div></td>
                                <td bgcolor="#E6F0F0"><div align="left">
                                        <select name="expyears">
                                        <script language="javascript">
                                        for(i=0;i<=20;i++) 
                                        document.write("<option value="+i+">"+i+"</option>");
                                        </script>
                                        </select>  
                            </tr>
                            <tr>
                                <td height="51" colspan=2 bgcolor="#F2DFE2" ><div align="center"><br>
                                        <input TYPE="reset"> &nbsp;&nbsp;<input TYPE="submit" value="Submit" onclick="return valid()">
                                </div>                                 </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </td>
        </tr>
    </table>
</body>
</html>
