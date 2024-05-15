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
                    <th>Address</th>
                    <th>Contact</th>
                    <th>Action</th>


                </tr>
                <%
                    String select = "select * from tbl_wasterequest s inner join tbl_user p on p.user_id = s.user_id  inner join tbl_supervisor t on p.place_id = t.place_id where supervisor_id = '" + session.getAttribute("supid") + "'";;
                    //out.print(select);
                    ResultSet rs = con.selectCommand(select);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>


                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("user_name")%></td>
                    <td><%=rs.getString("wastereq_date")%></td>
                    <td><%=rs.getString("wastereq_pickupdate")%></td>
                    <td><%=rs.getString("user_address")%></td>
                    <td><%=rs.getString("user_contact")%></td>
                    <td>

                        <%

                            if (rs.getString("wastereq_status").equals("0")) {
                        %>
                        <a href="AssignEmployee.jsp?wid=<%=rs.getString("wastereq_id")%>">Assign Employee</a>
                        <%
                        } else if (rs.getString("wastereq_status").equals("1")) {
                            String selQ = "select * from tbl_employee where employee_id='" + rs.getString("employee_id") + "'";
                            ResultSet rsQ = con.selectCommand(selQ);
                            rsQ.next();
                            out.println("Assigned to " + rsQ.getString("employee_name"));
                        } else {

                            int received = rs.getInt("recived");
                            int payed = rs.getInt("payed");

                            if (rs.getString("wastereq_status").equals("2")) {

                                if (received != 0 && payed == 0) {
                                    if (rs.getInt("user_pay") == 0) {
                                        out.print("Receive= " + received);

                                    } else {
                                        out.print("Received= " + received);
                                    }
                                }
                                if (payed != 0 && received == 0) {
                                    if (rs.getInt("supervisor_pay") == 0) {
                                        out.print("Pay= " + payed);

                        %>
                        <br> <a href="Payment.jsp?id=<%=rs.getString("wastereq_id")%>&amount=<%=rs.getString("payed")%>">Payment to User</a>
                        <%

                                } else {
                                    out.print("Paid= " + payed);
                                }
                            }

                            if ((received != 0) && (payed != 0)) {
                                if ((rs.getInt("user_pay") == 0) && (rs.getInt("supervisor_pay") == 0)) {
                                    out.print("Receive= " + received + " and Pay= " + payed);

                                } else if ((rs.getInt("user_pay") == 1) && (rs.getInt("supervisor_pay") == 0)) {
                                    out.print("Recieved= " + received + " and Pay= " + payed);

                        %>

                        <br> <a href="Payment.jsp?id=<%=rs.getString("wastereq_id")%>&amount=<%=rs.getString("payed")%>">Payment to User</a>

                        <%
                                        } else if ((rs.getInt("user_pay") == 1) && (rs.getInt("supervisor_pay") == 1)) {
                                            out.print("Received= " + received + " and Paid= " + payed);
                                        }

                                    }

                                }

                            }


                        %>

                    </td>

                </tr>
                <%                }
                %>




            </table>
        </div>
    </body>
    <%@include file="Footu.jsp" %>
</html>
