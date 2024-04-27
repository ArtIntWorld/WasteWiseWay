<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP View User Waste Request</title>
        <script>
            function calculatePayment() {
                var rows = document.querySelectorAll("table#wasteTable tbody tr");
                var totalRecyclablePayment = 0;
                var totalNonRecyclablePayment = 0;

                rows.forEach(function(row) {
                    var qtyInput = row.querySelector("input[type='number']");
                    if (qtyInput) {
                        var rate = parseFloat(qtyInput.getAttribute('rate'));
                        var qty = parseFloat(qtyInput.value);
                        var wasteCategory = qtyInput.getAttribute('wtype');

                        if (!isNaN(rate) && !isNaN(qty)) {
                            var payment = rate * qty;

                            if (wasteCategory === 'Non-biodegradable' || wasteCategory === 'Hazardous') {
                                totalNonRecyclablePayment += payment;
                            } else {
                                totalRecyclablePayment += payment;
                            }
                        }
                    }
                });

                // Set the calculated payments to the respective textboxes
                var txtPtu = document.getElementById("txt_ptu");
                var txtRtu = document.getElementById("txt_rtu");

                if (txtPtu && txtRtu) {
                    txtPtu.value = totalRecyclablePayment.toFixed(2);
                    txtRtu.value = totalNonRecyclablePayment.toFixed(2);
                    document.getElementById("tdP").innerHTML = totalRecyclablePayment.toFixed(2);
                    document.getElementById("tdR").innerHTML = totalNonRecyclablePayment.toFixed(2);
                } else {
                    console.error("Textbox not found.");
                }
            }
        </script>

    </head>
    <body>
        <%@include file="Headu.jsp" %>
        <br>
        <div id="tab" align="center">
            <form method='post' > <!-- Prevent form submission -->
                <table border="1" align="center" id="wasteTable">
                    <tr>
                        <th>Sl. No.</th>
                        <th>Category</th>
                        <th>Qty</th>
                    </tr>
                    <%
                        if (request.getParameter("btn_submit") != null) {
                            if (request.getParameter("txt_rtu").equals("nill") || request.getParameter("txt_ptu").equals("nill")) {
                    %>
                    <script>
                        alert("Amount Not Found");
                        window.location = "Collect.jsp?wid=<%=request.getParameter("wid")%>";
                    </script>
                    <%
                            } else {
                                String updQry = "update tbl_wasterequest set wastereq_status='2',recived='" + request.getParameter("txt_rtu") + "', payed='" + request.getParameter("txt_ptu") + "' where wastereq_id ='" + request.getParameter("wid") + "'";
//                            out.print(updQry);
                                if (con.executeCommand(updQry)) {
                                    response.sendRedirect("Home4.jsp");
                                }
                            }
                        }

                        String select = "select * from tbl_wasterequestbody wb inner join tbl_wasterequest wr on wr.wastereq_id=wb.wasterequest_id inner join tbl_wastematerial wm on wm.wastematerial_id=wb.wastematerial_id inner join tbl_wastecategory wc on wc.wastecategory_id=wm.wastecategory_id where wastereq_id='" + request.getParameter("wid") + "'";
                        ResultSet rs = con.selectCommand(select);
                        int i = 0;
                        while (rs.next()) {
                            i++;
                    %>
                    <tr>
                        <td><%=i%></td>
                        <td><%=rs.getString("wastematerial_type")%></td>
                        <td><input type="number" required="" wtype='<%=rs.getString("wastecategory_name")%>' rate='<%=rs.getString("wastematerial_rate")%>' placeholder="<%=rs.getString("wastematerial_rate")%>/kg" name="txt_kg"></td>
                    </tr>
                    <%
                        }
                    %>
                    <tr>
                        <td colspan="3" align='right'>
                            <input type="button" value="Calculate" onclick="calculatePayment()">
                        </td>
                    </tr>
                    <tr>
                        <td>Pay to User</td>
                        <td colspan="2" id="tdP">

                        </td>
                    </tr>
                    <tr>
                        <td>Received From User</td>
                        <td colspan="2" id="tdR">

                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" >
                            <input type="hidden" required="" value="nill" name="txt_rtu" id="txt_rtu">
                            <input type="hidden" required="" value="nill" name="txt_ptu" id="txt_ptu">
                            <input type="submit" value="Submit" name="btn_submit"></td>
                    </tr>
                </table>
            </form>
        </div>
        <%@include file="Footu.jsp" %>
    </body>
</html>
