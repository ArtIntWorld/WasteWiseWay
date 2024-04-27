<%-- 
    Document   : District.jsp
    Created on : 3 Dec, 2022, 10:24:26 AM
    Author     : ardra
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DISTRICT jsp page</title>
    </head>
    <body>
        <%@include  file="headadmin.jsp" %>
        <br>
        <div id="tab" align="center">
        <%
            String edid = "", ename = "";
            String District = "";
            if (request.getParameter("btnsave") != null) {
                if (!request.getParameter("hid").equals("")) {
                    String up = "update tbl_district set district_name='" + request.getParameter("txtdistrict") + "' where district_id='" + request.getParameter("hid") + "' ";
                    con.executeCommand(up);
                } else {

                    District = request.getParameter("txtdistrict");
                    String ins = "insert into tbl_district(district_name)values('" + District + "')";
                    if (con.executeCommand(ins)) {
                            %>
                            <script>
                                alert("Data inserted");
                            </script>
                            <%
                    }
                }
            }
            if (request.getParameter("did") != null) {
                String del = "delete from tbl_district where district_id='" + request.getParameter("did") + "'";
                if (con.executeCommand(del)) {
                    response.sendRedirect("District.jsp");

                }
            }
            if (request.getParameter("eid") != null) {
                //out.print(request.getParameter("eid"));
                String sel = "select * from tbl_district where district_id='" + request.getParameter("eid") + "'";
                ResultSet rs = con.selectCommand(sel);
                rs.next();
                edid = rs.getString("district_id");
                ename = rs.getString("district_name");
            }

        %>

        <form method="post">
            <table border="1" align="center" cellpadding="10" >

                <tr>
                    <td>District</td>
                <input type="hidden" name="hid"  value="<%=edid%>">
                <td><input type="text" name="txtdistrict" required="required" autocomplete="off" value="<%=ename%>" pattern="^[A-Z]+[a-zA-Z ]*$" title="First Letter Must be Capital and Entry must be letters"></td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <input type="submit" value="Save" name="btnsave">
                        <input type="submit" value="Cancel" name="btnsave">
            </table>
            <table border="1" align="center">
                <tr>
                    <th>Serial No</th>
                    <th>District</th>
                    <th>Action</th>
                </tr>
                <%
                    String sel = "select * from tbl_district";
                    ResultSet rs = con.selectCommand(sel);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("district_name")%></td>
                    <td>
                        <a href="District.jsp?did=<%=rs.getString("district_id")%>">Delete</a>
                        <a href="District.jsp?eid=<%=rs.getString("district_id")%>">Edit</a>
                    </td>
                </tr>
                <%
                    }
                %>

                </td>
                </tr>
            </table> 
        </div>
    </body>
     <%@include file="footadmin.jsp" %>
</html>
