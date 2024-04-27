<%-- 
    Document   : ComplaintType
    Created on : 27 Jan, 2023, 2:00:52 PM
    Author     : ardra
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>COMPLAINT TYPE jsp page</title>
    </head>
    <body>
        <%@include  file="headadmin.jsp" %>
        <br>
        <div id="tab" align="center">
        <%
            
            String ctid = "", ctname = "";
            String CompType = "";
            if (request.getParameter("btnsave") != null) {
                if (!request.getParameter("coid").equals("")) {
                    String up = "update tbl_complainttype set complainttype_title='" + request.getParameter("txttype") + "' where complainttype_id='" + request.getParameter("coid") + "' ";
                    con.executeCommand(up);
                } else {

                    CompType = request.getParameter("txttype");
                    String ins = "insert into tbl_complainttype(complainttype_title)values('" + CompType + "')";
                    if (con.executeCommand(ins)) {
        %>
                     <script>
                         alert("Data inserted");
                         </script>
                         <%
                        }
                }
            }
            if(request.getParameter("pid")!=null)
            {
                String del="delete from tbl_complainttype where complainttype_id='"+request.getParameter("pid")+"'";
                if(con.executeCommand(del))
                {
                 response.sendRedirect("ComplaintType.jsp");
                 
                }
            }
            if(request.getParameter("cid")!=null)
            {
                //out.print(request.getParameter("cid"));
                String sel="select * from tbl_complainttype where complainttype_id='"+request.getParameter("cid")+"'";
                ResultSet rs=con.selectCommand(sel);
                rs.next();
                ctid=rs.getString("complainttype_id");
                ctname=rs.getString("complainttype_title");
            }
        %>
   
        <form method="post">
    <table border="1" align="center" cellpadding="10" >

	<tr>
 		<td>Type</td>
                <input type="hidden" name="coid" required="required" value="<%=ctid%>">
                <td><input type="text" name="txttype" required="required" pattern="[a-zA-Z ]*$" title="Only alphabets allowed"  autocomplete="off"  value="<%=ctname%>"></td>
 		
	</tr>
        <tr>
        <td colspan="3" align="center">
            <input type="submit" value="Save" name="btnsave">
             <input type="submit" value="Cancel" name="btnsave">
    </table>
            <table border="1" align="center">
                <tr>
   <th>Serial No</th>
   <th>Type</th>
   <th>Action</th>
 </tr>
 <%
            String sel="select * from tbl_complainttype";
            ResultSet rs=con.selectCommand(sel);
            int i=0;
            while(rs.next())
            {
             i++; 
 %>
<tr>
     <td><%=i%></td>
     <td><%=rs.getString("complainttype_title")%></td>
     <td><a href="ComplaintType.jsp?pid=<%=rs.getString("complainttype_id")%>">Delete</a><a href="ComplaintType.jsp?cid=<%=rs.getString("complainttype_id")%>">Edit</a> </td>
 <%
            }
             %>
        </tr>
    </table> 
        </form> 
        </div>
    </body>
     <%@include file="footadmin.jsp" %>
</html>