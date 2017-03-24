<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Recruitment</title>
    </head>
    
    <body>
        <table width="104%" border="1">
            <tr>
                <td height="23" colspan="2"><jsp:include page="CandidateHeader.jsp"/></td>
            </tr>
            <tr>
                <td height="597" width="7%"><jsp:include page="Candidatemenu.jsp"/></td>
                <td  bgcolor="#EBD9CD" width="99%">
                    <% try {

            String c1 = (String) session.getAttribute("s1");
            String c2 = (String) session.getAttribute("s2");


            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con = DriverManager.getConnection("jdbc:odbc:OnlineExam");


            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery("select * from Details where Username='" + c1 + "'");

            String s1 = null;
            String s2 = null;
            String s3 = null;
            String s4 = null;
            String s5 = null;
            String s6 = null;
            String s7 = null;
            String s8 = null;
            String s9 = null;
            String s10 = null;
            String s11 = null;

            String expyrs = "", company = "", desig = "", sal = "", comadd = "", category = "";
            while (rs.next()) {
                s1 = rs.getString(2);//name
                s2 = rs.getString(4);//colg
                s3 = rs.getString(5);//colgph
                s4 = rs.getString(6);//colgemail
                //s5 = rs.getString();//mark
                s6 = rs.getString(9);//email
                s7 = rs.getString(10);//tph
                s8 = rs.getString(11);//add
                s9 = rs.getString(12);//state
                s10 = rs.getString(13);//pin
                //s11 = rs.getString(14);//category

            }
            String sql = "select * from Experienced where Username='" + c1 + "'";
            rs = st.executeQuery(sql);
            if (rs.next()) {
                expyrs = rs.getString(2);
                company = rs.getString(3);
                desig = rs.getString(4);
                sal = rs.getString(5);
                comadd = rs.getString(6);
                category = "Experienced"; s11=category;
            } else {
                category = "Fresher"; s11=category;
            }
                    %>
                    
                    <form method="POST" action="savestudentedit.jsp" name="form1">
                        <table border=0 cellpadding=3 cellspacing=0 width =81% align=center>
                            <tr bgcolor =#FEF7E9 wdth =100%>
                                <td colspan="2" bgcolor="#E2E0CF"><div align="center"><font color="#386A78" size="5"><strong>Edit Profile</strong></font></div></td>
                            </tr>
                            <tr bgcolor =#FEF7E9 wdth =100%>
                                <td width="48%" bgcolor="#F3E8DA"><strong><font color="#666600" size="3" face="Times New Roman, Times, serif">Name&nbsp;
                                <font color="#993333">(as in academic records)</font> </font></strong></td>
                                <td width="52%" bgcolor="#F3E8DA"><input TYPE="text" NAME="name" size=30
                                                                         maxlength=30 value='<%=s1%>'>                </td>
                            </tr>
                            <tr bgcolor =#FEF7E9>
                                <td bgcolor="#F3E8DA">
                                    <strong><font SIZE="3" COLOR="#666600" face ='Times New Roman, Times, serif'>College in which studying</font> </strong>
                                </td>
                                <td bgcolor="#F3E8DA"><input TYPE="text" NAME="college" size=30 maxlength=30 value='<%=s2%>'>                       </td>
                            </tr>
                            <tr bgcolor =#FEF7E9>
                                <td bgcolor="#F3E8DA">
                                    <strong><font SIZE="3" COLOR="#666600" face ='Times New Roman, Times, serif'>College Phone</font> </strong>
                                </td>
                                <td bgcolor="#F3E8DA"><input TYPE="text" NAME="collegephone" size=30 maxlength=30                                       value='<%=s3%>'><font SIZE="2" COLOR="#CC0000" face =arial (STD-No.)>                                 </td>
                            </tr>
                            <tr bgcolor="#FFFFFF">
                                <td>
                                    <strong><font SIZE="3" COLOR="#666600" face ='Times New Roman, Times, serif'>College Email</font> </strong>
                                </td>
                                <td><input TYPE="text" NAME="collegeemail" size=30 maxlength=50 value='<%=s4%>'>                                 </td>
                            </tr>
                            <tr bgcolor =#FEF7E9>
                                <td bgcolor="#F3E8DA">
                                    <strong><font SIZE="3" COLOR="#666600" face ='Times New Roman, Times, serif'>% of Marks</font></strong>
                                </td>
                                <td bgcolor="#F3E8DA">
                                    <table width="111" border=0 cellpadding=0 cellspacing=0>
                                        <tr>
                                            <td width="95"><div align="center"><font SIZE="2" COLOR="#3366CC" face =arial><strong>BCA / B.Sc. %</strong></font> </div></td>
                                        </tr>
                                        <tr>
                                            <td><input TYPE="text" NAME="markDegree" size=8 maxlength=8 value='<%  %>' onblur="checkDec('markBSC')">                                              </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr  bgcolor =#FEF7E9>
                                <td bgcolor="#F3E8DA">
                                    <strong><font SIZE="3" COLOR="#666600" face ='Times New Roman, Times, serif'>Email_id</font></strong>
                                </td>
                                <td bgcolor="#F3E8DA"><input TYPE="text" NAME="email" size=30 maxlength=30 value='<%=s6%>'></td>
                            </tr>
                            <tr bgcolor="#FFFFFF">
                                <td>
                                <strong><font SIZE="3" COLOR="#666600" face ='Times New Roman, Times, serif'>Telephone Number</font> </strong></td>
                                <td><input NAME="telephone" TYPE="text" id="telephone" value="<%=s7%>">
                                    <font SIZE="2" COLOR="#CC0000" face ='arial'>(STD-No.)  </font>
                                </td>
                            </tr>
                            <tr  bgcolor =#FEF7E9>
                                <td bgcolor="#F3E8DA" ><strong><font face="Times New Roman, Times, serif" color=#666600 size=3>Address</font> </strong></td>
                                <td bgcolor="#F3E8DA">
                                    <input class=USS_TEXT maxLength=30 name="address" size=40 value='<%=s8%>'><b><font face="ARIAL, HELVETICA" color=red size=+2></font></b>
                                </td>
                            </tr>
                            <tr bgcolor="#FFFFFF">
                                <td><strong><font face="Times New Roman, Times, serif" color=#666600 size=3>State</font> </strong></td>
                                <td><select name=state> <option selected value='<%=s9%>'>Select State</option>
                                        <option value=AP>Andhra Pradesh</option> <option value=AR>Arunachal
                                        Pradesh</option> <option value=AS>Assam</option> <option
                                            value=BR>Bihar</option> <option value=CH>Chandigarh</option> <option
                                            value=CG>Chattisgarh</option> <option value=DL>Delhi</option> <option
                                            value=GA>Goa</option> <option value=GJ>Gujarat</option> <option
                                            value=HR>Haryana</option> <option value=HP>Himachal Pradesh</option>
                                        <option value=JK>Jammu &amp; Kashmir</option> <option
                                            value=JH>Jharkhand</option> <option value=KA>Karnataka</option> <option
                                            value=KL>Kerala</option> <option value=MP>Madhya Pradesh</option>
                                        <option value=MH>Maharashtra</option> <option value=MN>Manipur</option>
                                        <option value=ML>Meghalaya</option> <option value=MZ>Mizoram</option>
                                        <option value=NL>Nagaland</option> <option value=OR>Orissa</option>
                                        <option value=PY>Pondicherry</option> <option value=PB>Punjab</option>
                                        <option value=RJ>Rajasthan</option> <option value=SK>Sikkim</option>
                                        <option value=TN>Tamilnadu</option> <option value=TR>Tripura</option>
                                        <option value=UA>Uttaranchal</option> <option value=UP>Uttar
                                        Pradesh</option> <option value=WB>West Bengal</option> <option
                                    value=XX>Others</option></select><br>                           </td>
                            </tr>
                            <tr bgcolor="#FFFFFF">
                                <td bgcolor="#F3E8DA">
                                    <strong><FONT face="Times New Roman, Times, serif" color=#666600 size=3>Pincode</FONT> </strong>
                                </td>
                                <td bgcolor="#F3E8DA"><INPUT class=USS_TEXT maxLength=6 name="pin" size=6 value='<%=s10%>'><B><FONT face="ARIAL, HELVETICA" color=red size=+2></FONT></B>
                                    <input type="hidden" name="category" id="category" value="<%=category%>" />
                                </td>
                            </tr>
                            <%
     if (s11.equalsIgnoreCase("Fresher")) {
                            %>
                            <tr bgcolor="#FFFFFF">
                                <td>
                                    <strong><font SIZE="3" COLOR="#666600" face ='Times New Roman, Times, serif'>Category</font></strong>
                                </td>
                                <td align="left" >
                                    <input type="radio" name="cat"  value='Experienced' onclick="setVal(this);" />Experienced
                                </td>
                            </tr>
                            <%     }
                            %>
                            <tr bgcolor =#FEF7E9>
                                <td bgcolor="#F3E8DA">
                                    <strong><font SIZE="3" COLOR="#666600" face ='Times New Roman, Times, serif'>Experienced Years</font></strong>
                                </td>
                                <td bgcolor="#F3E8DA"><input TYPE="text" NAME="expyears" size=30 maxlength=30 value="<%=expyrs%>"></td>
                            </tr>
                            <tr bgcolor =#FEF7E9>
                                <td bgcolor="#F3E8DA"><strong><font SIZE="3" COLOR="#666600" face ='Times New Roman, Times, serif'>Company</font></strong></td>
                                <td bgcolor="#F3E8DA"><input TYPE="text" NAME="company" size=30 maxlength=30 value="<%=company%>"></td>
                            </tr>
                            <tr bgcolor =#FEF7E9>
                                <td bgcolor="#F3E8DA"><strong><font SIZE="3" COLOR="#666600" face ='Times New Roman, Times, serif'>Designation _ </font></strong></td>
                                <td bgcolor="#F3E8DA"><input TYPE="text" NAME="designation" size=30 maxlength=30 value="<%=desig%>"></td>
                            </tr>
                            <tr bgcolor =#FEF7E9>
                                <td bgcolor="#F3E8DA"><strong><font SIZE="3" COLOR="#666600" face ='Times New Roman, Times, serif'>Salary _</font></strong></td>
                                <td bgcolor="#F3E8DA"><input TYPE="text" NAME="salary" size=30 maxlength=30 value="<%=sal%>"></td>
                            </tr>
                            <tr bgcolor =#FEF7E9>
                                <td bgcolor="#F3E8DA"><strong><font SIZE="3" COLOR="#666600" face ='Times New Roman, Times, serif'>Company Address</font></strong></td>
                                <td bgcolor="#F3E8DA"><input TYPE="text" NAME="comAddress" size=30 maxlength=30 value="<%=comadd%>"></td>
                            </tr>
                            <tr>
                                <td height="49" colspan=2 align="center" ><input TYPE="submit" value="    Save    "></td>
                            </tr>
                        </table>
                    </form>
                    
                    <%// }//while
        }//try
        catch (Exception e) {
            out.println(e);
        }  %>
                </td>
            </tr>
        </table>
    </body>
</html>
