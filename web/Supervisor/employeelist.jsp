<%-- 
    Document   : employeelist
    Created on : 27 Jan, 2023, 10:04:22 AM
    Author     : ardra
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee List</title>
    </head>
    <body>
         <%@include  file="Headu.jsp" %>
         
        <div id="tab" align="center">
         <%
        if(request.getParameter("did")!=null){
        String del = "delete from tbl_employee where employee_id='" + request.getParameter("did") + "'";
        con.executeCommand(del);
        response.sendRedirect("employeelist.jsp");
        }
         else
                {
                   // out.println("Failed");
                }
            
        %>
         
        <table border="1" align="center">
            <tr>
                <th>Sl. No.</th>
                <th>Name</th>
                <th>Email</th>
                <th>Address</th>
                <th>Contact</th>
                <th>Photo</th>
                <th>Action</th>
            </tr>
            <%
                String select = "select * from tbl_employee where supervisor_id = '" + session.getAttribute("supid") + "'";
                
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
                <td><%=rs.getString("employee_contact")%></td>
                <td><img src="../Assets/Files/EmployeePhoto/<%=rs.getString("employee_photo")%>" width="120" height="120"/></td>
                <td><a href="employeelist.jsp?did=<%=rs.getString("employee_id")%>">Delete</a></td>
                
            </tr>
            <%
                }
            %>
</table
        </div>
    </body>
</html>
    </body>
     <%@include file="Footu.jsp" %>
</html>
