<%-- 
    Document   : wastecategory
    Created on : 16 Feb, 2023, 10:07:45 AM
    Author     : ardra
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WasteCategory JSP page</title>
    </head>
    <body>
        <%@include  file="headadmin.jsp" %>
        <br>
        <div id="tab" align="center">
          <%
            String Category = "";
            if (request.getParameter("btnsave") != null) {
                Category = request.getParameter("txtcat");
                String ins = "insert into tbl_wastecategory(wastecategory_name)values('" + request.getParameter("txtcat") + "')";
                
                if (con.executeCommand(ins)) {
        %>
          <script>
            alert("Data inserted");
        </script>
        <%
                }    
            }
                    %>
<form method="post">

            <table border="1" align="center" cellpadding="10" > 
                <tr>

                <tr>
                    <td>Waste Category</td>
                     <td><input type="text" name="txtcat" required="required"></td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <input type="submit" value="Submit" name="btnsave">
                        <input type="submit" value="Reset" name="btnsave">
                    </td>  
                </tr>  
            </table>
    <table border="1" align="center">
                <tr>
   <th>Serial No</th>
   <th>Waste Category</th>
 </tr>
 <%
            String sel="select * from tbl_wastecategory";
            ResultSet rs=con.selectCommand(sel);
            int i=0;
            while(rs.next())
            {
             i++; 
 %>
<tr>
     <td><%=i%></td>
     <td><%=rs.getString("wastecategory_name")%></td>
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