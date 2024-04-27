<%-- 
    Document   : feedback
    Created on : 8 Feb, 2023, 2:33:08 PM
    Author     : ardra
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback JSP page</title>
    </head>
    <body>
          <%@include  file="Head.jsp" %>
        <br><br><br>
        <div id="tab" align="center">
             <%
            String feedback = "";
            if (request.getParameter("btnsave") != null) {
                feedback = request.getParameter("feed");
                String ins = "insert into tbl_feedback(feedback_content,feedback_date)values('" + request.getParameter("txtfb") + "',curdate())";
                
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
                    <td>Feedback</td>
                    <td><textarea name="txtfb" rows="3" cols="20" required="required"></textarea></td>
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
</html>