<%-- 
    Document   : Place.jsp
    Created on : 3 Dec, 2022, 2:30:35 PM
    Author     : ardra
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Place JSP page</title>
    </head>
    <body>
        <%@include  file="headadmin.jsp" %>
        <br>
        <div id="tab" align="center">

        <%
            String Place = "";
            if (request.getParameter("btnsave") != null) {
                Place = request.getParameter("txtplace");
                String ins = "insert into tbl_place(place_name,district_id,type_id)values('" + Place + "','" + request.getParameter("ddlDept") + "','" + request.getParameter("ddlType") + "')";
                if (con.executeCommand(ins)) {
        %>
        <script>
            alert("Data inserted");
        </script>
        <%
                }
            }
            if (request.getParameter("did") != null) {
                String del = "delete from tbl_place where place_id='" + request.getParameter("did") + "'";
                if (con.executeCommand(del)) {
                    response.sendRedirect("Place.jsp");
                }
            }
        %>


        <form method="post">

            <table border="1" align="center" cellpadding="10" >

                <tr>
                    <td>District</td>

                    <td>  
                        <select name="ddlDept">
                            <option value="">--select--</option>
                            <%
                                String sel = "select * from tbl_district";
                                ResultSet rs = con.selectCommand(sel);

                                while (rs.next()) {

                            %>



                            <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>

                            <%

                                }
                            %>


                        </select>	
                    </td>
                <tr>
                <tr>
                    <td>Type</td>

                    <td>  
                        <select name="ddlType">
                            <option value="">--select--</option>
                            <%
                                String selT = "select * from tbl_type";
                                ResultSet rst = con.selectCommand(selT);

                                while (rst.next()) {

                            %>



                            <option value="<%=rst.getString("type_id")%>"><%=rst.getString("type_name")%></option>

                            <%

                                }
                            %>


                        </select>	
                    </td>
                <tr>

                <tr>
                    <td>Place</td>
                    <td><input type="text" name="txtplace" required="required"  autocomplete="off"  pattern="^[A-Z]+[a-zA-Z ]*$" title="First Letter Must be Capital"></td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <input type="submit" value="Save" name="btnsave">
                        <input type="submit" value="Cancel" name="btnsave">
                    </td>  
                </tr>  
            </table>
            <table border="1" align="center">
                <tr>
                    <th>Serial No</th>
                    <th>District</th>
                    <th>Type</th>
                    <th>Place</th>
                    <th>Action</th>
                </tr>
                <%
                    String select = "select * from tbl_place p inner join tbl_type t on t.type_id=p.type_id inner join tbl_district d on d.district_id=p.district_id ";
                    ResultSet ress = con.selectCommand(select);
                    int i = 0;
                    while (ress.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=ress.getString("district_name")%></td>
                    <td><%=ress.getString("type_name")%></td>
                    <td><%=ress.getString("place_name")%></td>
                    <td><a href="Place.jsp?did=<%=ress.getString("place_id")%>">Delete</a></td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
        </div>
         </body>
     <%@include file="footadmin.jsp" %>
</html>