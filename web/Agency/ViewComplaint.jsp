<%-- 
    Document   : ViewComplaint
    Created on : 27 Jan, 2023, 3:41:19 PM
    Author     : ardra
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Complaint</title>
    </head>
    <body>
         <%@include  file="Heada.jsp" %>
        <br><br><br>
        <div id="tab" align="center">
         
        <table border="1" align="center">
            <tr>
                <th>Sl. No.</th>
                <th>Type</th>
                <th>Description</th>
                <th>Date</th>
                <th>User Name</th>
                <th>Contact</th>
                <th>Action</th>
            </tr>
            <%
                String select = "select * from tbl_complaint c inner join tbl_complainttype ct on ct.complainttype_id=c.complainttype_id inner join tbl_user u on u.user_id=c.user_id inner join tbl_place p on p.place_id=u.place_id inner join tbl_agency a on a.district_id=p.district_id  where complaint_status='0' and agency_id='"+session.getAttribute("agid")+"' ";
                ResultSet rs = con.selectCommand(select);
                int i = 0;
                while (rs.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("complainttype_title")%></td>
                <td><%=rs.getString("complaint_description")%></td>
                <td><%=rs.getString("complaint_date")%></td>
                <td><%=rs.getString("user_name")%></td>
                <td><%=rs.getString("user_contact")%></td>
                <td> <a href="ReplyComplaint.jsp?did=<%=rs.getString("complaint_id")%>">Reply</a></td>
                
            </tr>
            <%
                }
            %>
</table>
        </div>
    </body>
      <%@include file="Foota.jsp" %>
</html>
    </body>
    
</html>
