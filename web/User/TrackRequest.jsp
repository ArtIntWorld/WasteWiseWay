<%-- 
    Document   : TrackRequest
    Created on : 27 May, 2023, 10:28:46 AM
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
        <%@include  file="Head.jsp" %>
        <br><br><br>
        <div id="tab" align="center">
            <table border="1" align="center">
                <tr>
                    <th>Sl. No.</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Request date</th>
                    <th>Pickup date</th>
                    <th>Waste material</th>
                    <th>Status</th>

                </tr>
                <%

                    String select = "select * from tbl_wasterequest r inner join tbl_user u on r.user_id=u.user_id where u.user_id='" + session.getAttribute("usid") + "'";
                    ResultSet rs = con.selectCommand(select);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("user_name")%></td>
                    <td><%=rs.getString("user_address")%></td>
                    <td><%=rs.getString("wastereq_date")%></td>
                    <td><%=rs.getString("wastereq_pickupdate")%></td>
                    <td>
                        <%
                            String selec = "select * from tbl_wasterequestbody u inner join tbl_wastematerial s on u.wastematerial_id = s.wastematerial_id where wasterequest_id =" + rs.getString("wastereq_id") + "";
                            ResultSet res = con.selectCommand(selec);
                            ResultSet res2 = con.selectCommand(selec);
                            res2.next();
                            while (res.next()) {
                                if (res2.next()) {
                        %>
                        <%=res.getString("wastematerial_type")%>,
                        <%
                        } else {
                        %>
                        <%=res.getString("wastematerial_type")%>

                        <%
                                }

                            }
                        %>
                    </td>
                    <td><%
                        if (rs.getString("wastereq_status").equals("0")) {
                            out.println("Pending");
                        } else if (rs.getString("wastereq_status").equals("1")) {
                            String selQ = "select * from tbl_employee where employee_id='" + rs.getString("employee_id") + "'";
                            ResultSet rsQ = con.selectCommand(selQ);
                            rsQ.next();
                            out.println("Assigned to " + rsQ.getString("employee_name"));
                        } else {

                            int received = rs.getInt("recived");
                            int payed = rs.getInt("payed");

                            if (rs.getString("wastereq_status").equals("2")) {
                               

                                if ((received != 0) && (payed ==0)) {
                                   
                                    if(rs.getInt("user_pay") == 0)
                                    {
                                      out.print("Pay= " + received);
                        %>
                        
                        <br> <a href="Payment.jsp?id=<%=rs.getString("wastereq_id")%>&amount=<%=rs.getString("recived")%>">Payment to Company</a>
                        
                        <%
                                    }else{
                                        out.print("Paid= " + received);
                                    }
                            }
                                if((payed != 0 )&& (received ==0))
                                {
                                    if(rs.getInt("supervisor_pay") == 0)
                                    {
                                        out.print("Receive= " + payed);
                                    }
                                    else{
                                        out.print("Received= " + payed);
                                    }
                                }
                                  if((received != 0) && (payed !=0))
                            {
                                 if((rs.getInt("user_pay") == 0) && (rs.getInt("supervisor_pay")==0))
                                    {
                                        out.print("Pay= " + received + " and Receive= " + payed);
                                         %>
                        
                        <br> <a href="Payment.jsp?id=<%=rs.getString("wastereq_id")%>&amount=<%=rs.getString("recived")%>">Payment to Company</a>
                        
                        <%
                                    }
                                 else if((rs.getInt("user_pay") == 1) && (rs.getInt("supervisor_pay")==0)){
                                      out.print("Paid= " + received + " and Receive= " + payed);
                                 }
                                 
                                 else if((rs.getInt("user_pay") == 1) && (rs.getInt("supervisor_pay")==1)){
                                      out.print("Paid= " + received + " and Received= " + payed);
                                 }
                                
                            }
                            }
                        }
                        %></td>

                </tr>
                <%                    }

                %>
            </table>
        </div>
    </body>
</html>

