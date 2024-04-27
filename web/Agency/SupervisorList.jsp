<%-- 
    Document   : SupervisorList
    Created on : 31 Dec, 2022, 10:43:09 AM
    Author     : ardra
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP SupervisorList</title>
    </head>
    <body>
         <%@include  file="Heada.jsp" %>
        <br><br><br>
        <div id="tab" align="center">
        <%
            if (request.getParameter("did") != null) {
                String del = "delete from tbl_supervisor  where supervisor_id='" + request.getParameter("did") + "'";
                if (con.executeCommand(del)) {
                    response.sendRedirect("SupervisorList.jsp");
                }
                else
                {
                    out.println("Failed");
                }
            }
        %>
        <table border="1" align="center">

            <tr>
                <th>Sl. No.</th>
                <th>Name</th>
                <th>Email</th>
                <th>Address</th>
                <th>Contact</th>
                <th>Gender</th>
                <th>Place</th>
                <th>Photo</th>
                <th>Proof</th>
                <th>Date of join</th>
                <th>Action</th>
            </tr>
            <%
                String select = "select * from tbl_supervisor s inner join tbl_place p on p.place_id = s.place_id where s.agency_id='"+session.getAttribute("agid")+"'";

                ResultSet rs = con.selectCommand(select);
                int i = 0;
                while (rs.next()) {
                    i++;
            %>


            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("supervisor_name")%></td>
                <td><%=rs.getString("supervisor_email")%></td>
                <td><%=rs.getString("supervisor_address")%></td>
                <td><%=rs.getString("supervisor_contact")%></td>
                <td><%=rs.getString("supervisor_gender")%></td>
                <td><%=rs.getString("place_name")%></td>
                <td><img src="../Assets/Files/SupervisorPhoto/<%=rs.getString("supervisor_photo")%>" width="120" height="120"/></td>
                <td><a href="../Assets/Files/SupervisorProof/<%=rs.getString("supervisor_proof")%>"download>Download</a></td>

                <td><%=rs.getString("supervisor_doj")%></td>
                <td>
                    <a href="SupervisorList.jsp?did=<%=rs.getString("supervisor_id")%>">Delete</a>

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

