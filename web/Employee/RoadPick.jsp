<%-- 
    Document   : ViewRoadwaste
    Created on : 10 Feb, 2023, 12:35:03 PM
    Author     : ardra
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Request</title>
    </head>
    <body>
         <%@include  file="Headu.jsp" %>
        <br><br><br>
        <div id="tab" align="center">
         <%
            if (request.getParameter("wid") != null) {
                String up = "update tbl_rdwaste set rdwaste_status=2 where rdwaste_id='" + request.getParameter("wid") + "' ";
                // out.print(up);
                con.executeCommand(up);
                response.sendRedirect("RoadPick.jsp");
            }

        %>
        <table border="1" align="center">
            <tr>
                <th>Sl. No.</th>
                <th>District</th>
                <th>Place</th>
                <th>Landmark</th>
                <th>Details</th>
                <th>Photo</th>
                <th>Action</th>

            </tr>
            <%
                String select = "select * from tbl_rdwaste r inner join tbl_employee e on r.employee_id=e.employee_id inner join tbl_place p on r.place_id=p.place_id inner join tbl_district d on d.district_id=p.district_id where rdwaste_status!='0' and e.employee_id='"+session.getAttribute("egid")+"' ";
                ResultSet rs = con.selectCommand(select);
                int i = 0;
                while (rs.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("district_name")%></td>
                <td><%=rs.getString("place_name")%></td>
                <td><%=rs.getString("rdwaste_landmark")%></td>
                <td><%=rs.getString("rdwaste_details")%></td>
               <td><img src="../Assets/Files/RoadwastePhoto/<%=rs.getString("rdwaste_photo")%>" width="120" height="120"/></td>
               <td> 
               <%
                            String status = rs.getString("rdwaste_status");

                            if (status.equals("1")) {
                        %>
                        <a href="RoadPick.jsp?wid=<%=rs.getString("rdwaste_id")%>">Collect</a>
                        <%
                            } else if(status.equals("2")) {
                                out.print("Collected");
                            }
                         %>
                    </td>
            </tr>
            <%
                }
            %>
</table>
        </div>
    </body>
      <%@include file="Footu.jsp" %>
</html>
    
