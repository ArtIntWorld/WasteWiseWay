<%-- 
    Document   : ChangePassword
    Created on : 29 Dec, 2022, 12:07:01 PM
    Author     : ardra
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    </head>
    <%
        if(request.getParameter("btnsave")!=null)
        {
            String cPassword=request.getParameter("txtcpwd");
            String nPassword=request.getParameter("txtnpwd");
            String ccPassword=request.getParameter("txtcnpwd");
            
            String selQry="select * from tbl_agency where agency_id='"+session.getAttribute("agid")+"'";
            ResultSet rs = con.selectCommand(selQry);
            rs.next();
            String currentPassword=rs.getString("agency_password");
            
            if(cPassword.equals(currentPassword))
            {
                if(nPassword.equals(ccPassword))
                {
                    String upQry = "update tbl_agency set agency_password='"+nPassword+"' where agency_id='"+session.getAttribute("agid")+"'";
                    out.println(upQry);
                   if(con.executeCommand(upQry))
                       
               {
                     response.sendRedirect("../Agency/Home2.jsp");
                  }
                   
                }
                
            }
            
            
        }
    %>
    <body>
         <%@include  file="Heada.jsp" %>
        <br><br><br>
        <div id="tab" align="center">
        <form method="post">
            <table border="1" align="center" cellpadding="10" >

                <tr>
                    <td>Current Password</td>
                <td><input type="password" name="txtcpwd" required="required"></td>
                </tr>
                <tr>
                    <td>New Password</td>
                <td><input type="password" name="txtnpwd" required="required" title="Must not match with 'Current Password'"></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                <td><input type="password" name="txtcnpwd" required="required"  title="Must match with 'New Password'"></td>
                </tr>
                 <tr>
                    <td colspan="4" align="center">
                        <input type="submit" value="Change" name="btnsave">
                         <input type="reset" value="Cancel" name="btn_reset">
                    </td>  
                </tr> 
                
                </table> 
                      </form>
        </div>
    </body>
      <%@include file="Foota.jsp" %>
</html>


