<%-- 
    Document   : TrackRdPickupRequest
    Created on : 10 Feb, 2023, 2:52:29 PM
    Author     : ardra
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%@include  file="Head.jsp" %>
        <br><br><br>
        <div id="tab" align="center">
        <table border="1" align="center">
            <tr>
                <th>Sl. No.</th>
                <th>Request Date</th>
                 <th>Pickup Date</th>
                <th>Amount</th>
                <th>Pay</th>
                <th>Action</th>
            </tr>
            <%//out.print(session.getAttribute("usid"));
                String select = "select * from tbl_wasterequest innerjoin tbl where u.user_id ='"+session.getAttribute("usid")+"' and wastereq_status='1' ";
                ResultSet rs = con.selectCommand(select);
                int i = 0;
                while (rs.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("wastereq_date")%></td>
                <td><%=rs.getString("wastereq_pickupdate")%></td>
                <td><%=rs.getString("recived")%></td>
                <td><%=rs.getString("rdwaste_landmark")%></td>
                <td><%=rs.getString("rdwaste_details")%></td>
               <td><img src="../Assets/Files/RoadwastePhoto/<%=rs.getString("rdwaste_photo")%>" width="120" height="120"/></td>
                <td><%=rs.getString("user_contact")%></td>
                <td>
                    <%
                    if(rs.getString("rdwaste_status").equals("1"))
                        out.print("picked");
                    else
                        out.print("pending");
                        %>
                </td>
                
            </tr>
            <%
                }
            %>
</table>
        </div>
    </body>
</html>
