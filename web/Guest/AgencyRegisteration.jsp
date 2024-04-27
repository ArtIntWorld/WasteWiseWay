<%-- 
    Document   : AgencyRegisteration
    Created on : 17 Dec, 2022, 12:08:42 PM
    Author     : ardra
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agency Registeration</title>
        <style>
            
        </style>
    </head>
    <body >
        <%@include  file="Head.jsp" %>
        <br><br><br>
        <div id="tab" align="center">
        <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/AgencyUploadAction.jsp">

            <table border="1" align="center" cellpadding="10" >

                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" required="required" autocomplete="off" pattern="^[A-Z]+[a-zA-Z ]*$" title="First Letter Must be Capital and input must be letters"></td>
                </tr>

                <tr>
                    <td>E-Mail</td>
                    <td><input type="email" name="txtemail" required="required"></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>
                        <textarea name="txtaddress" rows="3" cols="20" required="required" autocomplete="off" pattern="^[A-Z]+[a-zA-Z ]*$" title="First Letter Must be Capital and input must be letters"></textarea>
                    </td>
                </tr>

                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtcontact" required="required" autocomplete="off" pattern="[7-9]{1}[0-9]{9}" title="Phone number starting with digits from 7-9 and remaing 9 digits from 0-9"></td>
                </tr>
                <tr>
                    <td>District</td>

                    <td>  
                        <select name="ddlDis" id="ddlDis">
                            <option value="">--select--</option>
                            <%
                                String sel = "select * from tbl_district";
                                ResultSet rs = con.selectCommand(sel);

                                while (rs.next()) {

                            %>



                            <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>

                            <%

                                }
                            %>


                        </select>	
                    </td>
                </tr>
                

               
                <tr>
                    <td>Logo</td>
                    <td><input type="file" name="file_logo"  required="required"></td>


                </tr>
                <tr>
                    <td>Proof</td>
                    <td><input type="file" name="file_proof"  required="required"></td>


                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txtpassword" required="required"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Save" name="btnsave">
                        <input type="reset" value="Cancel" name="btnsave">
                    </td>

                </tr>
            </table>
        </form>
        </div>
    </body>
<!--    <script src="../Assets/JQuery/jQuery.js"></script>
    <script>
                            function getPlace()
                            {
                                var did = document.getElementById("ddlDis").value;

                                var tid = document.getElementById("ddlType").value;

                                $.ajax({url: "../Assets/AjaxPages/Ajaxplace.jsp?did=" + did + "&tid=" + tid,
                                    success: function(result) {
                                        $("#ddlPlace").html(result);
                                    }
                                })
                            }

    </script>-->
</html>
<br>
