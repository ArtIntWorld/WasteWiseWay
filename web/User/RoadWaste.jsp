<%-- 
    Document   : RoadWaste
    Created on : 10 Feb, 2023, 11:30:58 AM
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
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
        <style>
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0, 0, 0, 0.5);
            }

            .modal-content {
                background-color: #fefefe;
                margin: 5% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
                height: 400px;
            }

            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }

            #map {
                height: 300px;
            }
        </style>
    </head>
    <body>
        <%@include  file="Head.jsp" %>
        <br><br><br>
        <div id="tab" align="center">
            <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/RoadWasteUploadAction.jsp">

                <table border="1" align="center" cellpadding="10" >
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
                    <tr>
                    <tr>
                        <td>Type</td>

                        <td>  
                            <select name="ddlType" id="ddlType" onchange="getPlace()">
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
                    <tr>

                    <tr>
                        <td>Place</td>
                        <td>
                            <select name="ddlPlace" id="ddlPlace">
                                <option value="sel">--select--</option>
                            </select>	      
                        </td>
                    </tr>
                    <tr>
                        <td>Landmark</td>
                        <td>
                            <textarea name="txtlandmark" required="required" rows="3" cols="20"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button id="openModalBtn">Choose Location</button>

                        </td>
                    </tr>
                    <tr>
                        <td>Details</td>
                        <td>
                            <textarea name="txtdetails" required="required" rows="3" cols="20"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>Photo</td>
                        <td><input type="file" name="file_photo"  required="required"></td>
                    <input type="hidden" name="rdwaste_latitude" id="rdwaste_latitude" value="2435678876">
                    <input type="hidden" name="rdwaste_longitude" id="rdwaste_longitude" value="86754352678">
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="Save" name="btnsave">
                            <input type="reset" value="Reset" name="btnsave">
                        </td>

                    </tr>
                </table>
            </form>
        </div>
        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h2>Choose Location</h2>
                <div id="map"></div>
                <button id="currentLocationBtn">Choose Current Location</button>
            </div>
        </div>
    </body>
    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
    <script>
                                var map;
                                var marker;

                                // Initialize the map when the modal is opened
                                function initializeMap() {
                                    map = L.map('map').setView([51.505, -0.09], 13);

                                    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                                        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                                    }).addTo(map);

                                    // Handle click event on the map to set the marker
                                    map.on('click', function(e) {
                                        document.getElementById("rdwaste_latitude").value = e.latlng.lat;
                                        document.getElementById("rdwaste_longitude").value = e.latlng.lng;
                                        if (marker) {
                                            map.removeLayer(marker);
                                        }
                                        marker = L.marker(e.latlng).addTo(map);
                                    });

                                    // Handle click event on the "Choose Current Location" button
                                    var currentLocationBtn = document.getElementById("currentLocationBtn");
                                    currentLocationBtn.addEventListener("click", function() {
                                        if (navigator.geolocation) {
                                            navigator.geolocation.getCurrentPosition(function(position) {
                                                var lat = position.coords.latitude;
                                                var lng = position.coords.longitude;
                                                document.getElementById("rdwaste_latitude").value = lat;
                                                document.getElementById("rdwaste_longitude").value = lng;

                                                if (marker) {
                                                    map.removeLayer(marker);
                                                }
                                                marker = L.marker([lat, lng]).addTo(map);

                                                map.setView([lat, lng], 13);
                                            });
                                        } else {
                                            alert("Geolocation is not supported by your browser.");
                                        }
                                    });
                                }

                                // Get the button and modal elements
                                var openModalBtn = document.getElementById("openModalBtn");
                                var modal = document.getElementById("myModal");

                                // Get the close button element
                                var closeBtn = document.getElementsByClassName("close")[0];

                                // Open the modal when the button is clicked
                                openModalBtn.addEventListener("click", function() {
                                    modal.style.display = "block";
                                    initializeMap();
                                });

                                // Close the modal when the close button is clicked
                                closeBtn.addEventListener("click", function() {
                                    modal.style.display = "none";
                                });
    </script>
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

    </script>
</html>