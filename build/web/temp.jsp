                    <%
                        while(rs.next())
                           {
                     %>
                        <br>
                        <tr>
                            <td>
                        <%=rs.getString("QuestionNo")%>.<%=rs.getString("Question")%>
                        A: <input type="radio" name="ans<%=rs.getString("QuestionNo")%>" value="<%=rs.getString("Option1")%>">
                        B: <input type="radio" name="ans<%=rs.getString("QuestionNo")%>" value="<%=rs.getString("Option2")%>">
                        C: <input type="radio" name="ans<%=rs.getString("QuestionNo")%>" value="<%=rs.getString("Option3")%>">
                        D: <input type="radio" name="ans<%=rs.getString("QuestionNo")%>" value="<%=rs.getString("Option4")%>">
                            </td>
                        </tr>
                     <%
                            }                          
                            
                     %>
