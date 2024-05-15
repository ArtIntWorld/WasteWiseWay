<%-- 
    Document   : ReplyComplaint
    Created on : 27 Jan, 2023, 3:54:47 PM
    Author     : ardra
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ReplyComplaint JSP page</title>
    </head>
    <body>
         <%@include  file="Heada.jsp" %>
        <br><br><br>
        <div id="tab" align="center">
        <%
        if(request.getParameter("btnsave")!=null)
        {
        String up = "update tbl_complaint set complaint_status= 1, complaint_reply = '"+request.getParameter("txtreply")+"' where complaint_id='" + request.getParameter("did") + "'";
        con.executeCommand(up);
        response.sendRedirect("Home2.jsp");
        }
        %>
        
  
    
        <form method="post">

            <table border="1" align="center" cellpadding="10" >
                <tr>
                    <td>Reply</td>
                    <td><textarea name="txtreply" rows="3" cols="20"></textarea></td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <input type="submit" value="Submit" name="btnsave">
                        <input type="submit" value="Reset" name="btnsave">
                    </td>  
                </tr>  

            </table>
        </form>
        </div>
         </body>
      <%@include file="Foota.jsp" %>
</html>