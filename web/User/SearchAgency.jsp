<%-- 
    Document   : SearchAgency
    Created on : 10 Feb, 2023, 10:07:00 AM
    Author     : ardra
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP User Registeration</title>
    </head>
    <body>
         <%@include  file="Head.jsp" %>
        <br><br><br>
        <div id="tab" align="center">
 <form method="post">
     
            <table border="1" align="center" cellpadding="10" >

                 <tr>
                    <td>District</td>

                    <td>  
                        <select name="ddlDis" id="ddlDis" onchange="getSearch()">
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
                    <td>Type</td>

                    <td>  
                        <select name="ddlType" id="ddlType" onchange="getPlace(),getSearch()">
                            <option value="">--select--</option>
                            <%
                                String selT = "select * from tbl_type";
                                ResultSet rst = con.selectCommand(selT);

                                while (rst.next()) {

                            %>



                            <option value="<%=rst.getString("type_id")%>"><%=rst.getString("type_name")%></option>

                            <%

                                }
                            %>


                        </select>	
                    </td>
               
                    <td>Place</td>
                    <td>
                        <select name="ddlPlace" id="ddlPlace" onchange="getSearch()">
                            <option value="">--select--</option>
                        </select>	      
                    </td>
                </tr>
            </table>
                <div id="searchresult">
           <table border="1" align="center">
            <tr>
                
                
            
            <%
                String select = "select * from tbl_agency s inner join tbl_place p on p.place_id = s.place_id inner join tbl_district d on p.district_id = d.district_id inner join tbl_type t on p.type_id = t.type_id where agency_vstatus = 1";

                ResultSet res = con.selectCommand(select);
                int i = 0;
                while (res.next()) {
                    i++;
            %>
            
           
            <td> <img src="../Assets/Files/AgencyLogo/<%=res.getString("agency_logo")%>" width="120" height="120"/><br>
                    Name: <%=res.getString("agency_name")%><br>
                Email: <%=res.getString("agency_email")%><br>
               Address: <%=res.getString("agency_address")%><br>
                Contact: <%=res.getString("agency_contact")%><br>
               District: <%=res.getString("district_name")%><br>
              Place: <%=res.getString("place_name")%><br>
               Type: <%=res.getString("type_name")%><br>
               <a href="wastereq.jsp?aid=<%=res.getString("agency_id")%>">Send Request</a>
          
            <%
            if(i==4)
                out.print("</tr><tr>");
                }
            %>
            </tr>
            </table>
            </div>
        </form>

<script src="../Assets/JQuery/jQuery.js"></script>
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
                            
                            function getSearch()
                            {
                                //alert("hi");
                                var did = document.getElementById("ddlDis").value;

                                var tid = document.getElementById("ddlType").value;
                                
                                var pid = document.getElementById("ddlPlace").value;

                                $.ajax({url: "../Assets/AjaxPages/AjaxSearch.jsp?did=" + did + "&tid=" + tid+ "&pid=" + pid,
                                    success: function(result) {
                                        $("#searchresult").html(result);
                                    }
                                })
                            }

    </script>
        </div>
    </body>
</html>