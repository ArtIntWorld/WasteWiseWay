<%-- 
    Document   : AgencyVerification
    Created on : 17 Dec, 2022, 1:48:52 PM
    Author     : ardra
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP View User Waste Request</title>
    </head>
    <body>
        <%@include  file="Headu.jsp" %>
        <br>
        <div id="tab" align="center">
       
        <table border="1" align="center">
                
            <tr>
                <th>Sl. No.</th>
                <th>Name</th>
                <th>Request date</th>
                <th>Details</th>
                <th>Image</th>
                <th>Contact</th>
                <th>Action</th>
                
           
            </tr>
            <%
                String select = "select * from tbl_rdwaste r inner join tbl_place p on p.place_id=r.place_id inner join tbl_user u on u.user_id=r.user_id inner join tbl_supervisor s on s.place_id=u.place_id where rdwaste_status='0' and r.place_id = '" + session.getAttribute("supplace") + "'";
//out.print(select);
                ResultSet rs = con.selectCommand(select);
                int i = 0;
                while (rs.next()) {
                    i++;
            %>


            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("user_name")%></td>
                <td><%=rs.getString("rdwaste_date")%></td>
                <td><%=rs.getString("rdwaste_details")%></td>
                <td><img src="../Assets/Files/RoadwastePhoto/<%=rs.getString("rdwaste_photo")%>" width="150" height="150"></td>
                <td><%=rs.getString("rdwaste_landmark")%></td>
                <td><a href="AssignEmployee.jsp?rwid=<%=rs.getString("rdwaste_id")%>">Assign Employee</a></td>
                
            </tr>
            <%
                }
            %>




        </table>
        </div>
    </body>
     <%@include file="Footu.jsp" %>
</html>
