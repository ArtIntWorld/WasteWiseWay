<%-- 
    Document   : AgencyVerification
    Created on : 17 Dec, 2022, 1:48:52 PM
    Author     : ardra
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP View User Waste Request</title>
    </head>
    <body>
        <%@include  file="Headu.jsp" %>
        <br>
        <div id="tab" align="center">

            <table border="1" align="center">

                <tr>
                    <th>Sl. No.</th>
                    <th>Name</th>
                    <th>Request date</th>
                    <th>Pickup date</th>
                    <th>Material</th>
                    <th>Address</th>
                    <th>Contact</th>
                    <th>Action</th>


                </tr>
                <%
                    String select = "select * from tbl_wasterequest w inner join tbl_user u on u.user_id=w.user_id where employee_id='" + session.getAttribute("egid") + "'";
                    //out.print(select);
                    ResultSet rs = con.selectCommand(select);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                        String material = "";

                        String selec = "select * from tbl_wasterequestbody u inner join tbl_wastematerial s on u.wastematerial_id = s.wastematerial_id where wasterequest_id =" + rs.getString("wastereq_id") + "";
                        ResultSet res = con.selectCommand(selec);
                        ResultSet res2 = con.selectCommand(selec);
                        res2.next();
                        while (res.next()) {
                            if (res2.next()) {
                                material += res.getString("wastematerial_type") + ", ";

                            } else {
                                material += res.getString("wastematerial_type");
                            }

                        }


                %>


                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("user_name")%></td>
                    <td><%=rs.getString("wastereq_date")%></td>
                    <td><%=rs.getString("wastereq_pickupdate")%></td>
                    <td><%=material%></td>
                    <td><%=rs.getString("user_address")%></td>
                    <td><%=rs.getString("user_contact")%></td>
                    <td>
                        <%
                            String received = rs.getString("recived");
                            String payed = rs.getString("payed");

                            if (received.equals("NULL") && payed.equals("NULL")) {
                        %>
                        <a href="Collect.jsp?wid=<%=rs.getString("wastereq_id")%>">Collect</a>
                        <%
                            } else {
                                out.print("To User= " + received);
                                %>
                                <br>
                                <%
                                out.print("To Company= " + payed);
                            }
                        %>
                    </td>


                </tr>
                <%
                    }
                %>




            </table>
        </div>
    </body>
    <%@include file="Footu.jsp" %>
</html>
