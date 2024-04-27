<%-- 
    Document   : Complaint
    Created on : 27 Jan, 2023, 2:36:07 PM
    Author     : ardra
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint JSP page</title>
    </head>
    <body>
         <%@include  file="Head.jsp" %>
        <br><br><br>
        <div id="tab" align="center">

        <%
            String Complaint = "";
            if (request.getParameter("btnsave") != null) {
                Complaint = request.getParameter("compl");
                String ins = "insert into tbl_complaint(complainttype_id,complaint_description,user_id,complaint_date)values('" + Complaint + "','" + request.getParameter("txtdes") + "','"+session.getAttribute("usid")+"',curdate())";
                
                if (con.executeCommand(ins)) {
        %>
        
        <script>
            alert("Data inserted");
        </script>
        <%
                }
            }
            if (request.getParameter("did") != null) {
                String del = "delete from tbl_complaint where complaint_id='" + request.getParameter("did") + "'";
                out.print(del);
                out.println(del);
                if (con.executeCommand(del)) {
                    response.sendRedirect("Complaint.jsp");
                }
            }
        %>


        <form method="post">

            <table border="1" align="center" cellpadding="10" >

                <tr>
                    <td>Type</td>

                    <td>  
                        <select name="compl">
                            <option value="">--select--</option>
                            <%
                                String sel = "select * from tbl_complainttype";
                                ResultSet rs = con.selectCommand(sel);

                                while (rs.next()) {

                            %>



                            <option value="<%=rs.getString("complainttype_id")%>"><%=rs.getString("complainttype_title")%></option>

                            <%

                                }
                            %>


                        </select>	
                    </td>
                <tr>
                  
                <tr>

                <tr>
                    <td>Description</td>
                    <td><textarea name="txtdes" rows="3" cols="20" required="required"></textarea></td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <input type="submit" value="Save" name="btnsave">
                        <input type="submit" value="Reset" name="btnsave">
                    </td>  
                </tr>  
            </table>
            <table border="1" align="center">
                <tr>
                    <th>Serial No</th>
                    <th>Complaint Type</th>
                    <th>Description</th>
                    <th>Reply</th>
                    <th>Action</th>
                </tr>
                <%
                    String select = "select * from tbl_complaint p inner join tbl_complainttype c on p.complainttype_id=c.complainttype_id where user_id='"+session.getAttribute("usid")+"' ";
                    ResultSet ress = con.selectCommand(select);
                    int i = 0;
                    while (ress.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=ress.getString("complainttype_title")%></td>
                    <td><%=ress.getString("complaint_description")%></td>
                    <td><%=ress.getString("complaint_reply")%></td>
                    <td><a href="Complaint.jsp?did=<%=ress.getString("complaint_id")%>">Delete</a></td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
        </div>
         </body>
</html>