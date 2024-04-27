<%-- 
    Document   : AddEmployee
    Created on : 31 Dec, 2022, 11:43:05 AM
    Author     : ardra
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP AddEmployee</title>
    </head>
    <body>
        <%@include  file="Headu.jsp" %>

        <div id="tab" align="center">
            <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/EmployeeUploadAction.jsp">

                <table border="1" align="center" cellpadding="10" >

                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="txtname" required="required" autocomplete="off" pattern="^[A-Z]+[a-zA-Z ]*$" title="First Letter Must be Capital and input must be letters"></td>
                    </tr>

                    <tr>
                        <td>Email</td>
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
                        <td>Gender</td>
                        <td>
                            <input type="radio" name="gender" value="Male">Male
                            <input type="radio" name="gender" value="Female">Female
                            <input type="radio" name="gender" value="Others">Others
                        </td>
                    </tr>
                    <tr>
                        <td>Photo</td>
                        <td><input type="file" name="file_photo"  required="required"></td>


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
    <%@include file="Footu.jsp" %>
    <script src="../Assets/JQuery/jQuery.js"></script>
</html>