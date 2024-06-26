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
                <th>District</th>
                <th>Place</th>
                <th>Landmark</th>
                <th>Details</th>
                <th>Photo</th>
                <th>Action</th>
            </tr>
            <%//out.print(session.getAttribute("usid"));
                String select = "select * from tbl_rdwaste r inner join tbl_user u on u.user_id=r.user_id inner join tbl_place p on p.place_id=r.place_id inner join tbl_district d on d.district_id=p.district_id inner join tbl_agency ag on ag.district_id=p.district_id  inner join tbl_type t on t.type_id=p.type_id where u.user_id ='"+session.getAttribute("usid")+"' ";
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
                    if(rs.getString("rdwaste_status").equals("2"))
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
