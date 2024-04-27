<%-- 
    Document   : MyProfile
    Created on : 27 Dec, 2022, 3:17:26 PM
    Author     : ardra
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%@include  file="Heada.jsp" %>
        <br><br><br>
        <div id="tab" align="center">
          <%
            
                String sel="select * from tbl_agency where agency_id='"+session.getAttribute("agid")+"'";
                //out.print(sel);
                ResultSet rs=con.selectCommand(sel);
                rs.next();
            
                %>
           <form method="post">
            <table border="1" align="center" cellpadding="10" >
                <tr>
                
                 <td colspan="2"><img src="../Assets/Files/AgencyLogo/<%=rs.getString("agency_logo")%>" width="120" height="120"/></td>
    
               </tr>  
                <tr>
                    <td>Name</td>
                <td><%=rs.getString("agency_name")%></td>
                </tr>
                <tr>
                    <td>Email</td>
                <td><%=rs.getString("agency_email")%></td>
                </tr>
                 <tr>
                    <td>Contact</td>
                <td><%=rs.getString("agency_contact")%></td>
                </tr>
                  <tr>
                    <td>Address</td>
                <td><%=rs.getString("agency_address")%></td>
                </tr>
                </table> 
                      </form>
        </div>
    </body>
      <%@include file="Foota.jsp" %>
</html>
