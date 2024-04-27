<%-- 
    Document   : SupMyProfile
    Created on : 31 Dec, 2022, 10:55:59 AM
    Author     : ardra
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP SupMyProfile</title>
    </head>
    <body>
         <%@include  file="Headu.jsp" %>
         
        <div id="tab" align="center">
           <%
            
                String sel="select * from tbl_supervisor where supervisor_id='"+session.getAttribute("supid")+"'";
                //out.print(sel);
                ResultSet rs=con.selectCommand(sel);
                rs.next();
            
                %>
           <form method="post">
            <table border="1" align="center" cellpadding="10" >
                <tr>
                
                 <td colspan="2"><img src="../Assets/Files/SupervisorPhoto/<%=rs.getString("supervisor_photo")%>" width="120" height="120"/></td>
    
               </tr>  
                <tr>
                    <td>Name</td>
                <td><%=rs.getString("supervisor_name")%></td>
                </tr>
                <tr>
                    <td>Email</td>
                <td><%=rs.getString("supervisor_email")%></td>
                </tr>
                 <tr>
                    <td>Contact</td>
                <td><%=rs.getString("supervisor_contact")%></td>
                </tr>
                  <tr>
                    <td>Address</td>
                <td><%=rs.getString("supervisor_address")%></td>
                </tr>
                </table> 
                      </form>
        </div>
    </body>
     <%@include file="Footu.jsp" %>
</html>

       