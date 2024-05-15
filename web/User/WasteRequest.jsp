<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <style>
                .custom-datepicker .ui-datepicker-calendar td span.ui-state-default:not(.ui-state-disabled) {
                    opacity: 0.5;
                    pointer-events: none;
                }
            </style>
            <title>Waste Request</title>
        </head>
    <%

        if (request.getParameter("submit") != null) {
            String date = request.getParameter("txtdate");
            String[] values = request.getParameterValues("ddlwas");
            String ins = "insert into tbl_wasterequest(wastereq_date,wastereq_pickupdate,user_id) value(curdate(),'" + date + "','" + session.getAttribute("usid") + "')";
            if (con.executeCommand(ins)) {
                String sel2 = "select max(wastereq_id) as id from tbl_wasterequest";
                ResultSet res = con.selectCommand(sel2);
                res.next();
                String id = res.getString("id");
                for (String value : values) {
                    String insQry = "insert into tbl_wasterequestbody(wasterequest_id,wastematerial_id)value('" + id + "','" + value + "')";
                    con.executeCommand(insQry);
                }
            }
        }

    %>
    <body>
          <%@include  file="Head.jsp" %>
        <br><br><br>
        <form id="form" method="post">
            <table border="1" id="table" align="center">
                <tr>
                    <td>
                        <button id="plus-btn" onclick="addRow()">+</button>
                    </td>
                    <td>
                        Date
                    </td>
                    <td>
                        <input type="text" id="dateInput" name="txtdate">
                    </td>
                    <td colspan="3" align="right">
                        <input type="submit" name="submit" value="Submit">
                    </td>
                </tr>
                <tr id="onerow">
                    <td>Category</td>
                    <td>
                        <select name="ddlcat" id="ddlcat" onchange="getWasteMaterial(this)">
                            <option value="">--select--</option>
                            <% String sel = "select * from tbl_wastecategory";
                                ResultSet rs = con.selectCommand(sel);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("wastecategory_id")%>"><%=rs.getString("wastecategory_name")%></option>
                            <% }
                            %>
                        </select>	
                    </td>
                    <td>Wastematerial</td>
                    <td>
                        <select name="ddlwas" id="ddlwas" onchange="getrate(this)">
                            <option value="">--select--</option>
                        </select>	
                    </td>
                    <td>Rate</td>
                    <td>
                        <div class="rateresult" id="rateresult">
                            <input type="text" name="txt_rate" value="">
                        </div>
                    </td>
                </tr>
            </table>
        </form>
        <script src="../Assets/JQuery/jQuery.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
        <script>


                            $(function() {
                                var allowedDays = [1,2,3,4, 5,6,7,8,9, 10,11,12,13,14, 15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];

                                // Find the next available date
                                var today = new Date();
                                var nextAvailableDate = null;

                                while (!allowedDays.includes(today.getDate())) {
                                    today.setDate(today.getDate() + 1);
                                }

                                nextAvailableDate = today;

                                // Set the default value to the next available date
                                var defaultValue = $.datepicker.formatDate('yy-mm-dd', nextAvailableDate);
                                $('#dateInput').val(defaultValue);

                                $('#dateInput').datepicker({
                                    dateFormat: 'yy-mm-dd',
                                    minDate: 0, // Disable previous dates
                                    beforeShowDay: function(date) {
                                        var day = date.getDate();
                                        var isAllowed = allowedDays.includes(day);
                                        return [isAllowed];
                                    },
                                    beforeShow: function(input, inst) {
                                        inst.dpDiv.addClass('custom-datepicker');
                                    }
                                });
                            });


                            function addRow() {
                                var table = document.getElementById("table");
                                var newRow = document.createElement("tr");
                                newRow.innerHTML = document.getElementById("onerow").innerHTML;
                                var textBox = newRow.querySelector("input[name='txt_rate']");
                                textBox.value = "";
                                table.appendChild(newRow);
                            }

                            function getWasteMaterial(selectElement) {
                                var selectedValue = selectElement.value;
                                var row = selectElement.parentNode.parentNode;
                                var wastematerialDropdown = row.querySelector("select[name='ddlwas']");
                                $.ajax({
                                    url: "../Assets/AjaxPages/AjaxWasteMaterial.jsp?did=" + selectedValue,
                                    success: function(result) {
                                        wastematerialDropdown.innerHTML = result;
                                    }
                                });
                            }
                            function getrate(selectElement) {
                                var selectedValue = selectElement.value;
                                var row = selectElement.parentNode.parentNode;
                                var data = row.querySelector("select[name='ddlcat']");
                                var rate = row.querySelector("#rateresult");
                                $.ajax({
                                    url: "../Assets/AjaxPages/Ajaxrate.jsp?cat=" + data.value + "&mt=" + selectedValue,
                                    success: function(result) {
                                        rate.innerHTML = result;
                                    }
                                });
                            }
                            document.getElementById("plus-btn").addEventListener("click", function(e) {
                                e.preventDefault();
                                var rows = document.querySelectorAll("#table tr:not(#onerow)");
                                var rowData = [];
                                rows.forEach(function(row) {
                                    var categoryElement = row.querySelector("select[name='ddlcat']");
                                    var wastematerialElement = row.querySelector("select[name='ddlwas']");
                                    var rateElement = row.querySelector("input[name='txt_rate']");
                                    var category = categoryElement ? categoryElement.value : "";
                                    var wastematerial = wastematerialElement ? wastematerialElement.value : "";
                                    var rate = rateElement ? rateElement.value : "";
                                    rowData.push({
                                        category: category,
                                        wastematerial: wastematerial,
                                        rate: rate
                                    });
                                });
                            });








        </script>
    </body>
</html>
