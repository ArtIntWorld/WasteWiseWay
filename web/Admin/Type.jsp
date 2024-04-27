<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TYPE jsp page</title>
    </head>
    <body>
        <%@include  file="headadmin.jsp" %>
        <br>
        <div id="tab" align="center">
        <%
            String tid="",tname="";
            String Type="";
            if(request.getParameter("btnsave")!=null)
            {
              
                if(!request.getParameter("hid").equals(""))
                {
                    String up="update tbl_type set type_name='"+request.getParameter("txttype")+"' where type_id='"+request.getParameter("hid")+"'";
                    con.executeCommand(up);
                    response.sendRedirect("Type.jsp");
                }
                else
                {
       
                Type=request.getParameter("txttype");
                String ins="insert into tbl_type(type_name)values('"+Type+"')";
                        if(con.executeCommand(ins))
                        {
                     %>
                     <script>
                         alert("Data inserted");
                         </script>
                         <%
                        }
                }
            }
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_type where type_id='"+request.getParameter("did")+"'";
                if(con.executeCommand(del))
                {
                 response.sendRedirect("Type.jsp");
                 
                }
            }
            if(request.getParameter("eid")!=null)
            {
                //out.print(request.getParameter("eid"));
                String sel="select * from tbl_type where type_id='"+request.getParameter("eid")+"'";
                ResultSet rs=con.selectCommand(sel);
                rs.next();
                tid=rs.getString("type_id");
                tname=rs.getString("type_name");
            }
        %>
   
        <form method="post">
    <table border="1" align="center" cellpadding="10" >

	<tr>
 		<td>Type</td>
        <input type="hidden" name="hid" required="required" value="<%=tid%>">
                <td><input type="text" name="txttype" required="required" autocomplete="off" value="<%=tname%>"></td>
 		
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
            String sel="select * from tbl_type";
            ResultSet rs=con.selectCommand(sel);
            int i=0;
            while(rs.next())
            {
             i++; 
 %>
<tr>
     <td><%=i%></td>
     <td><%=rs.getString("type_name")%></td>
     <td><a href="Type.jsp?did=<%=rs.getString("type_id")%>">Delete</a><a href="Type.jsp?eid=<%=rs.getString("type_id")%>">Edit</a> </td>
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