<%-- 
    Document   : SupEditProfile
    Created on : 31 Dec, 2022, 11:16:27 AM
    Author     : ardra
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP SupervisorEditProfile</title>
    </head>
    <body>
         <%@include  file="Headu.jsp" %>
         
        <div id="tab" align="center">
        <%
          if (request.getParameter("btnsave") != null) {
                 
                    String up = "update tbl_supervisor set supervisor_name='" + request.getParameter("txt_name") + "' ,supervisor_email='" + request.getParameter("txt_email") + "' ,supervisor_contact='" + request.getParameter("txt_contact") + "' ,supervisor_address='" + request.getParameter("txt_address") + "' where supervisor_id='" +session.getAttribute("supid")+ "' ";
              con.executeCommand(up);}
          %>
        <%
            
                String sel="select * from tbl_supervisor where supervisor_id='"+session.getAttribute("supid")+"'";
                //out.print(sel);
                ResultSet rs=con.selectCommand(sel);
                rs.next();
            
                %>
        
        <form method="post">
            <table border="1" align="center" cellpadding="10" >

                <tr>
                    <td>Name</td>
                <td><input type="text" name="txt_name" autocomplete="off" pattern="^[A-Z]+[a-zA-Z ]*$" title="First Letter Must be Capital and input must be letters" value="<%=rs.getString("supervisor_name")%>"></td>
                <a href="../Supervisor/Home4.jsp"></a>
                </tr>
                <tr>
                    <td>Email</td>
                <td><input type="text" name="txt_email" value="<%=rs.getString("supervisor_email")%>"></td>
                </tr>
                <tr>
                    <td>Contact</td>
                <td><input type="text" name="txt_contact" autocomplete="off" pattern="[7-9]{1}[0-9]{9}" title="Phone number starting with digits from 7-9 and remaing 9 digits from 0-9" value="<%=rs.getString("supervisor_contact")%>"></td>
                </tr>
                 <tr>
                     <td>Address</td>
                <td><input type="text" name="txt_address" autocomplete="off" pattern="^[A-Z]+[a-zA-Z ]*$" title="First Letter Must be Capital and input must be letters" value="<%=rs.getString("supervisor_address")%>"></td>
                </tr>
                 <tr>
                    <td colspan="4" align="center">
                        <input type="submit" value="Edit" name="btnsave">
                        <input type="reset" value="Cancel" name="btnsave">
                    </td>  
                </tr> 
                </table> 
                      </form>
        </div>
    </body>
     <%@include file="Footu.jsp" %>
</html>
