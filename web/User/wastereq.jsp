<%-- 
    Document   : UserRegisteration
    Created on : 29 Dec, 2022, 2:09:49 PM
    Author     : ardra
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Waste Request</title>
    </head>
    <body>
        <%@include  file="Head.jsp"%>
        <br><br><br>
        <% 
      if(request.getParameter("btnsave")!=null)
      {
          String ins="insert into tbl_wasterequest(wastereq_date,wastereq_pickupdate,user_id)values(curdate(),'"+request.getParameter("txtcontact")+"','"+session.getAttribute("usid")+"')";
          if(con.executeCommand(ins))
          {
              %>
              <script>
                  alert("Request Sended");
                  window.location="wastereq.jsp";
                  
              </script>
              <%
          }
      }
        %>
        <div id="tab" align="center">
            
            <form method="post" >
                <table border="1" align="center" cellpadding="10" >
                    <tr>
                        <td>Category</td>
                        <td>  
                            <select name="ddlcat" id="ddlcat" onchange="getWasteMaterial(this.value)">
                                <option value="">--select--</option>
                                <%
                                    String sel = "select * from tbl_wastecategory";
                                    ResultSet rs = con.selectCommand(sel);

                                    while (rs.next()) {

                                %>
                                <option value="<%=rs.getString("wastecategory_id")%>"><%=rs.getString("wastecategory_name")%></option>

                                <%

                                    }
                                %>
                            </select>	
                        </td>
                    </tr>
                    <tr>
                    <tr>
                        <td>Wastematerial</td>
                        <td>  
                            <select name="ddlwas" id="ddlwas" onchange="getrate()">
                                <option value="">--select--</option>
                            </select>	
                        </td>
                    <tr>
                        <td>Rate</td>
                        <td>
                            <div id="rateresult">
                                <input type="text" name="txt_rate">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Pickup Date</td>
                        <td><input type="Date" name="txtcontact" required="required"></td>
                    </tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Submit" name="btnsave">
                        <input type="reset" value="Cancel" name="btn-save">
                    </td>

                    </tr>
                </table>
            </form>
        </div>
    </body>
    <script src="../Assets/JQuery/jQuery.js"></script>
    <script>

                                function getWasteMaterial(did)
                                {
                                    //alert("hello");
                                    $.ajax({url: "../Assets/AjaxPages/AjaxWasteMaterial.jsp?did=" + did,
                                        success: function(result) {
                                            $("#ddlwas").html(result);
                                        }
                                    })
                                }
    </script>
    <script>
        function getrate()
        {
            var did = document.getElementById("ddlcat").value;

            var tid = document.getElementById("ddlwas").value;

            $.ajax({url: "../Assets/AjaxPages/Ajaxrate.jsp?cat=" + did + "&mt=" + tid,
                success: function(result) {
                    $("#rateresult").html(result);
                }
            })
        }
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
    </script>
</html>













