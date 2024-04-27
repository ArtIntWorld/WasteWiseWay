<%-- 
    Document   : AssignEmployee
    Created on : 25 May, 2023, 3:30:10 PM
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
        <%
            if (request.getParameter("asid") != null) {
                String up = "update tbl_wasterequest set employee_id='" + request.getParameter("asid") + "', wastereq_status=1 where wastereq_id='" + request.getParameter("wid") + "' ";
                // out.print(up);
                con.executeCommand(up);
                response.sendRedirect("viewuserwastereq.jsp");
            }
            if (request.getParameter("rsid") != null) {
                String up1 = "update tbl_rdwaste set employee_id='" + request.getParameter("rsid") + "', rdwaste_status=1 where rdwaste_id='" + request.getParameter("rwid") + "' ";
                // out.print(up);
                con.executeCommand(up1);
                response.sendRedirect("viewuserwastereq.jsp");
            }


        %>

        <table border="1" align="center">
            <tr>
                <th>Sl. No.</th>
                <th>Name</th>
                <th>Email</th>
                <th>Address</th>
                <th>Photo</th>
                <th>Action</th>
            </tr>
            <%                String select = "select * from tbl_employee where supervisor_id='" + session.getAttribute("supid") + "'";

                ResultSet rs = con.selectCommand(select);
                int i = 0;
                while (rs.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("employee_name")%></td>
                <td><%=rs.getString("employee_email")%></td>
                <td><%=rs.getString("employee_address")%></td>


                <td><img src="../Assets/Files/EmployeePhoto/<%=rs.getString("employee_photo")%>" width="120" height="120"/></td>
                <td>
                    <%
                        if (request.getParameter("wid") != null) {
                    %>
                    <a href="AssignEmployee.jsp?asid=<%=rs.getString("employee_id")%>&wid=<%=request.getParameter("wid")%>">Assign For Waste Request</a>
                    <%
                    } else if (request.getParameter("rwid") != null) {
                    %>
                    <a href="AssignEmployee.jsp?rsid=<%=rs.getString("employee_id")%>&rwid=<%=request.getParameter("rwid")%>">Assign For Road Request</a>
                    <%
                        }
                    %>

                </td>

            </tr>
            <%
                }
            %>
        </table
    </body>
</html>
