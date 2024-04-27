<%-- 
    Document   : UserMyProfile
    Created on : 29 Dec, 2022, 3:35:41 PM
    Author     : ardra
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP User My profile</title>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/qrcode.js"></script>
    </head>
    <body>
        <%@include  file="Head.jsp" %>
        <br><br><br>
        <div id="tab" align="center">
            <%

                String sel = "select * from tbl_user where user_id='" + session.getAttribute("usid") + "'";
                //out.print(sel);
                ResultSet rs = con.selectCommand(sel);
                rs.next();

            %>
            <form method="post">
                <table border="1" align="center" cellpadding="10" >
                    <tr>

                        <td colspan="2"><img src="../Assets/Files/UserPhoto/<%=rs.getString("user_photo")%>" width="120" height="120"/></td>

                    </tr>  
                    <tr>
                        <td>Name</td>
                        <td><%=rs.getString("user_name")%></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><%=rs.getString("user_email")%></td>
                    </tr>
                    <tr>
                        <td>Contact</td>
                        <td><%=rs.getString("user_contact")%></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><%=rs.getString("user_address")%></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <div id="code" align="center"></div>
                        </td>
                    </tr>
                </table> 
            </form>
        </div>
        <script>
            

            var array ='{ "id" : "' +<%=rs.getString("user_id")%> +'"  }';
            var qrcode = new QRCode(document.getElementById("code"), {
                text: array,
                width: 128,
                height: 128,
                colorDark: "#5868bf",
                colorLight: "#ffffff",
                correctLevel: QRCode.CorrectLevel.H,
            });
            

        </script>
    </body>
</html>








