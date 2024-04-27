<%-- 
    Document   : viewfeedback
    Created on : 8 Feb, 2023, 3:14:18 PM
    Author     : ardra
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Feedback</title>
    </head>
    <body>
         <%@include  file="headadmin.jsp" %>
        <br>
        <div id="tab" align="center">
        <table border="1" align="center">
            <tr>
                <th>Sl. No.</th>
                <th>Feedback</th>
                <th>Date</th>
            </tr>
            <%
                String select = "select * from tbl_feedback ";
                ResultSet rs = con.selectCommand(select);
                int i = 0;
                while (rs.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("feedback_content")%></td>
                <td><%=rs.getString("feedback_date")%></td>
                
            </tr>
            <%
                }
            %>
</table>
        </div>
    </body>
     <%@include file="footadmin.jsp" %>
</html>
    </body>
    
</html>