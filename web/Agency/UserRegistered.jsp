<%-- 
    Document   : AcceptedAgency
    Created on : 27 Dec, 2022, 11:37:56 AM
    Author     : ardra
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accepted Agency</title>
    </head>
    <body>
          <%@include  file="Heada.jsp" %>
        <br>
        <div id="tab" align="center">
            <%
                if (request.getParameter("eid") != null) {
                    String up = "delete from tbl_user where user_id='" + request.getParameter("eid") + "'";
                    con.executeCommand(up);
                    response.sendRedirect("UserRegistered.jsp");
                }
            %>
        <table border="1" align="center">
            <tr>
                <th>Sl. No.</th>
                <th>Name</th>
                <th>Email</th>
                <th>Address</th>
                <th>Contact</th>
                <th>District</th>
                <th>Photo</th>
                <th>Proof</th>
                <th>Action</th>
            </tr>
            <%
                String select = "select * from tbl_user u inner join tbl_place p on u.place_id = p.place_id inner join tbl_district d on d.district_id = p.district_id where d.district_id='" +session.getAttribute("agdid")+ "'";
                
                ResultSet rs = con.selectCommand(select);
                int i = 0;
                while (rs.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("user_name")%></td>
                <td><%=rs.getString("user_email")%></td>
                <td><%=rs.getString("user_address")%></td>
                <td><%=rs.getString("user_contact")%></td>
                <td><%=rs.getString("place_name")%></td>
                <td><img src="../Assets/Files/UserPhoto/<%=rs.getString("user_photo")%>" width="120" height="120"/></td>
                <td><a href="../Assets/Files/UserProof/<%=rs.getString("user_proof")%>"download>Download</a></td>
             <td>
               <a href="UserRegistered.jsp?eid=<%=rs.getString("user_id")%>">Reject</a>
                </td>
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
