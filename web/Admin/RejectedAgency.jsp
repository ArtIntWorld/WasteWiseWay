<%-- 
    Document   : RejectedAgency.jsp
    Created on : 27 Dec, 2022, 11:43:38 AM
    Author     : ardra
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rejected Agency</title>
    </head>
    <body>
        <%@include  file="headadmin.jsp" %>
        <br>
        <div id="tab" align="center">
        <table border="1" align="center">
            <tr>
                <th>Sl. No.</th>
                <th>Name</th>
                <th>Email</th>
                <th>Address</th>
                <th>Contact</th>
                <th>District</th>
                <th>Place</th>
                <th>Type</th>
                <th>Logo</th>
                <th>Proof</th>
                <th>Action</th>
            </tr>
            <%
                String select = "select * from tbl_agency a inner join tbl_district d on a.district_id=d.district_id where agency_vstatus = 2";

                ResultSet rs = con.selectCommand(select);
                int i = 0;
                while (rs.next()) {
                    i++;
            %>


            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("agency_name")%></td>
                <td><%=rs.getString("agency_email")%></td>
                <td><%=rs.getString("agency_address")%></td>
                <td><%=rs.getString("agency_contact")%></td>
                <td><%=rs.getString("district_name")%></td>
                <td><img src="../Assets/Files/AgencyLogo/<%=rs.getString("agency_logo")%>" width="120" height="120"/></td>
                <td><a href="../Assets/Files/AgencyProof/<%=rs.getString("agency_proof")%>"download>Download</a></td>

                
                <td>
                    <a href="AgencyVerification.jsp?did=<%=rs.getString("agency_id")%>">Accept</a>
                   </td>
            </tr>
            <%
                }
            %>




        </table>
    </body>
</html>
</div>
    </body>
     <%@include file="footadmin.jsp" %>
</html>
