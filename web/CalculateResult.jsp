<%-- 
    Document   : CalculateResult
    Created on : May 16, 2012, 7:27:38 PM
    Author     : Shanky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
<%        
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        String sql = null;
        int correct=0,wrong=0;
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            con = DriverManager.getConnection("jdbc:odbc:OnlineExam");
            st = con.createStatement();
        } catch (Exception ex) {
            out.println("Error: " + ex.toString());
        }
%>

    <%
            String student = (String)session.getAttribute("s1");    
            String examid = (String)session.getAttribute("examid");    
            String jobid = (String)session.getAttribute("jobid");    
            String post = (String)session.getAttribute("post");    
            
            out.println("Exam ID: "+examid+" Job ID: "+jobid);
            String qry = "select QuestionNo, Question, Option1, Option2, Option3, Option4, Answer from Question where ExamID='"+examid+"'and JobID='"+jobid+"' order by QuestionNo;";
            rs = st.executeQuery(qry);
            

%>

        <%
                    String answer;
                    String q;
                    while(rs.next())
                        {
                            q = rs.getString("QuestionNo");
                            answer = rs.getString("Answer");
                            String t = "ques"+q;
                            String ans = ""+request.getParameter(t);
                            if(ans.equals(answer))
                                correct++;
                            else
                                wrong++;
                        }
        st.close();
        %>
    
        Correct Answers = <%=correct%> Wrong Answers = <%=wrong%> Student ID = <%=student%>
        
        <%
                st = con.createStatement();
                    sql="insert into Result(StudentID,ExamID,JobID,Correct,Wrong) values ('"+student+"','"+examid+"','"+jobid+"',"+correct+","+wrong+")";
                    st.executeUpdate(sql);
                    st.close();
                    response.sendRedirect("ExamResult.jsp");
        %>

    </body>
</html>
