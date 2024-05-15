<%-- 
    Document   : Register
    Created on : 20 Apr, 2024, 10:16:13 AM
    Author     : USER
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Bebas+Neue&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&family=Protest+Riot&family=Sniglet:wght@400;800&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Bebas+Neue&family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&family=Protest+Riot&family=Sniglet:wght@400;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Bebas+Neue&family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&family=Protest+Riot&family=Sniglet:wght@400;800&family=Teko:wght@300..700&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Bebas+Neue&family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&family=Protest+Riot&family=Quantico:ital,wght@0,400;0,700;1,400;1,700&family=Sniglet:wght@400;800&family=Teko:wght@300..700&display=swap" rel="stylesheet">
        
         <style>
        body, html 
        {
            margin: 0;
            padding: 0;
            height: 100%;
        }
        
        

        .container {
            background: linear-gradient(to bottom, #fcf03f, #00f2fe);
            height: 100%; /* Fill viewport height */
            width: 100%; /* Fill full width */
            color: #fff; /* Text color */
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
        
        .black-overlay 
        {
            position: absolute;
            left: 0;
            width: 100%;
            background: linear-gradient(rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2)); /* Adjust the opacity (0.5) as needed */
        }
        
        .glass{
            width: 450px;
            background: rgba(224, 224, 224, 0.41);
            backdrop-filter: blur( 5px );
            box-shadow: 0 4px 30px rgba(0,0,0,0.1);
            height: 60vh;
            margin: 100px;
            display: flex;
            justify-content: center; /* Center the container horizontally */
            align-items: center;
            font-size: 70px;
            
            cursor: pointer;
            
            font-family: "Bebas Neue", sans-serif;
            font-weight: 400;
            font-style: normal;
            border-radius: 15px;
            letter-spacing: 12px;
            transition: box-shadow 0.3s,font-size 0.3s,letter-spacing 0.3s;
            
        }
        
        .container a
        {
            text-decoration: none;
            color: inherit;
        }
        
        .glass:hover
        {
            box-shadow: 0 4px 30px rgba(0,0,0,0.9);
            font-size: 80px;
            letter-spacing: 17px;
        }
        
        #registrationForm {
            position: fixed;
            top: 0;
            right: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(rgb(96, 245, 88), rgb(231, 250, 90));
            z-index: 2;
            padding: 60px;
            box-sizing: border-box;
            overflow-y: auto;
            transition: right 0.3s ease;
            display: flex;
            flex-direction: column;
            justify-content: center; /* Center vertically */
            align-items: center;
        }

        #registrationFormContent {
            width: 80%;
            margin: 0 auto; /* Center horizontally */
            padding: 20px;
            border-radius: 8px;
            height: 100%;
            background: #05fc70;
            backdrop-filter: blur(5px);
            box-shadow: 0 4px 30px rgba(0,0,0,0.1);
            /*height: auto;  Adjust height as needed */
            display: flex;
            flex-direction: column;
            /*justify-content: center;  Center vertically */
            align-items: center;
        }

        .close-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 24px;
            cursor: pointer;
        }
  
        table
        {
            background-color: #98e094;
            width: 120%;
            border-radius: 6px; 
            border: 1px;
            margin-left: -50px;
        }
        
/*        table, th{
            border: 1px solid #ddd;
            padding-top: 20px;
            padding-bottom: 20px;
            text-align: center;
        }
        
 */        td {
            padding-top: 10px;
            padding-bottom: 10px;
           
        }
        
        input[type="text"]
        {
            border: none;
            background-color: #e0e0dc;
            height: 30px;
        }
        
        input[type="password"]
        {
            border: none;
            background-color: #e0e0dc;
            height: 30px;

        }
        
        input[type="email"]
        {
            border: none;
            background-color: #e0e0dc;
            height: 30px;
        }
        
        textarea
        {
            border: none;
            background-color: #e0e0dc;
            height: 60px;
            width: 100%;
        }
        
        .formtext
        {
            color: white;
            font-family: "Josefin Sans", sans-serif;
            font-optical-sizing: auto;
/*            font-weight: <weight>;*/
            font-style: normal;
        }
        
        .btnsub
        {
            margin: 30px;
            width: 110px;
            height: 50px;
            background: linear-gradient(rgb(96, 245, 88), rgb(231, 250, 90));
            box-shadow: 0 4px 3px rgba(0,0,0,0.3);
            transition: box-shadow 0.3s;
            cursor: pointer;
            border: none;
            border-radius: 45px;
            font-family: "Quantico", sans-serif;
            font-weight: 700;
            font-style: normal;
            font-size: 15px;
            color: white;
        }
        
        .btnsub:hover
        {
            box-shadow: 0 0px 0px rgba(0,0,0,0);
        }
        
        input[type="file"]
        {
            outline: none;
            background-color: #e0e0dc;
            border-radius: 50px;
            width: 200px;
        }
        
        
        ::-webkit-file-upload-button
        {
            color: white;
            background: yellowgreen;
            padding: 10px;
            border: none;
            border-radius: 50px;
            outline: none;
            cursor: pointer;
        }
        
        tr{
            border-bottom: solid;
            border-bottom-color: #e0e0dc;
        }
        
        select
        {
            cursor: pointer;
            border-radius: 6px;
            height: 30px;
            width: 150px;
            border: none;
            font-family: "Noto Sans", sans-serif;
            font-optical-sizing: auto;
            font-style: normal;
            font-variation-settings:
              "wdth" 100;
        }
        
        #openModalBtn
        {
            width: 90%;
            height: 50px;
            margin-bottom: 5px;
            margin-right: 10px;
            border: none;
            border-radius: 6px;
            background-color: rgba(235, 229, 68,0.5);
            color: white;
            font-family: "Teko", sans-serif;
            letter-spacing: 4px;
            font-size: 20px;
            font-optical-sizing: auto;
            font-style: normal;
        }
        
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
            height: 310px;
        }
        
        button
        {
            cursor: pointer; 
        }
        
        </style>
    </head>
    <body>
            
        <div class="container">
            <div class="black-overlay"></div>
            <div class="glass" id="userCard" onclick="window.location='UserRegisteration.jsp'">User</div>
            <div class="glass" id="agencyCard" onclick="window.location='AgencyRegisteration.jsp'">Agency</div>
        </div>
        
        <div id="registrationForm">
        <div id="registrationFormContent">
            <span class="close-btn" onclick="hideRegistrationForm()">×</span>
            <h2 id="formTitle"></h2>
            <div id="formContainer"></div>
        </div>
    </div>
<div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h2>Choose Location</h2>
                <div id="map"></div>
                <button id="currentLocationBtn">Choose Current Location</button>
        </div>
</div>
    <script>
        function showRegistrationForm(cardType) {
            var formContainer = document.getElementById('registrationForm');
            var formContent = document.getElementById('registrationFormContent');
            var formTitle = document.getElementById('formTitle');
            var formContainerDiv = document.getElementById('formContainer');
            var userCard = document.getElementById('userCard');
            var agencyCard = document.getElementById('agencyCard');

            if (formContainer && formContent && formTitle && formContainerDiv && userCard && agencyCard) {
                // Set the form title based on the card type
                if (cardType === 'user') {
                    formTitle.textContent = 'User Registration Form';
                    // Insert AG registration form HTML into the form container
                    formContainerDiv.innerHTML = `
                    <div id="tab" align="center">
            <form class="Form" method="post" enctype="multipart/form-data" action="../Assets/ActionPages/UserUploadAction.jsp">

                <table cellpadding="10">

                    <tr>
                        <td class="formtext">Name</td>
                        <td colspan="3"><input type="text" style="width: 96%" name="txtname" required="required" autocomplete="off" pattern="^[A-Z]+[a-zA-Z ]*$" title="First Letter Must be Capital and input must be letters"></td>
                    </tr>
                    <tr>
                        <td class="formtext">Email</td>
                        <td><input type="email" style="width: 90%" name="txtemail" required="required"></td>
                   
                        <td class="formtext">Contact</td>
                        <td><input type="text" style="width: 90%" maxlength="10" name="txtcontact" required="required" autocomplete="off" pattern="[7-9]{1}[0-9]{9}" title="Phone number starting with digits from 7-9 and remaing 9 digits from 0-9"></td>
                    </tr>
                        <td class="formtext">Address</td>
                        <td>
                            <textarea name="txtaddress" rows="3" cols="20"  required="required" autocomplete="off" pattern="^[A-Z]+[a-zA-Z ]*$" title="First Letter Must be Capital and input must be letters"></textarea>
                        </td>
                
                  <td colspan="2"  align="center">
                            <button id="openModalBtn">Choose Location</button>
                        </td>
                    </tr>
            
                    <tr>
                        <td class="formtext">District</td>

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
                        <td class="formtext">Type</td>

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
                </tr>
                <tr>
                        <td class="formtext">Place</td>
                        <td>
                        
                            <select name="ddlPlace" id="ddlPlace">
                                <option value="sel">--select--</option>
                            </select>	
                    
                        </td>
                    
                        <td class="formtext">House No.</td>
                        <td class="formtext"><input type="text" style="width: 90%" name="txthouseno" required="required" pattern="[0-9]*" title="Input Must be numbers" autocomplete="off"></td>
                    </tr>
                    <tr>
                        <td class="formtext">Photo</td>
                        <td><input class="photo" id="fileLogoInput" type="file" name="file_photo"  required="required"></td>

                        <td class="formtext">Proof</td>
                        <td><input class type="file"  id="fileLogoInput" name="file_proof"  required="required"></td>
                    </tr>
                    <tr>
                        <td class="formtext">Password</td>
                        <td><input type="password" style="width: 90%" name="txtpassword" required="required">
                            <input type="hidden" name="user_latitude" id="user_latitude" value="2435678876">
                            <input type="hidden" name="user_longitude" id="user_longitude" value="86754352678">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" align="center">
                            <input class="btnsub" type="submit" value="Submit" name="btnsave">
                            
                            <input class="btnsub" type="reset" value="Cancel" name="btnsave">
                        </td>

                    </tr>
                </table>
            </form>
        </div>
        
        
            `;
                } else if (cardType === 'agency') {
                    formTitle.textContent = 'Agency Registration Form';
                    // Insert AD registration form HTML into the form container
                    formContainerDiv.innerHTML = `
                    <br><br><br>
                    <div align="center" style="top: 160px">
        <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/AgencyUploadAction.jsp">

            <table cellpadding="10">

                <tr>
                    <td class="formtext">Name</td>
                    <td colspan="3"><input type="text" style="width: 96%" name="txtname" required="required" autocomplete="off" pattern="^[A-Z]+[a-zA-Z ]*$" title="First Letter Must be Capital and input must be letters"></td>
                </tr>

                <tr>
                    <td class="formtext">E-Mail</td>
                    <td><input type="email" name="txtemail" required="required"></td>
                
                    <td class="formtext">Contact</td>
                    <td><input type="text" name="txtcontact" maxlength="10" required="required" autocomplete="off" pattern="[7-9]{1}[0-9]{9}" title="Phone number starting with digits from 7-9 and remaing 9 digits from 0-9"></td>
                </tr>
        
                <tr>
                    <td class="formtext">Address</td>
                    <td>
                        <textarea name="txtaddress" rows="3" cols="20" required="required" autocomplete="off" pattern="^[A-Z]+[a-zA-Z ]*$" title="First Letter Must be Capital and input must be letters"></textarea>
                    </td>
                
                    <td class="formtext">District</td>

                    <td>  
                        <select name="ddlDis" id="ddlDis">
                            <option value="">--select--</option>
                            <%
                                String sela = "select * from tbl_district";
                                ResultSet rsa = con.selectCommand(sela);

                                while (rsa.next()) {

                            %>



                            <option value="<%=rsa.getString("district_id")%>"><%=rsa.getString("district_name")%></option>

                            <%

                                }
                            %>


                        </select>	
                    </td>
                </tr>
                

               
                <tr>
                    <td class="formtext">Logo</td>
                    <td><input type="file" name="file_logo"  id="fileLogoInput" required="required"></td>

                    <td class="formtext">Proof</td>
                    <td><input type="file" name="file_proof"  id="fileLogoInput" required="required"></td>


                </tr>
        <tr>
                        <td class="formtext">Password</td>
                        <td><input type="password" style="width: 90%" name="txtpassword" required="required">
                            
                        </td>
                    </tr>
                
                <tr>
                    <td colspan="6" align="center">
                        <input class="btnsub" type="submit" value="Save" name="btnsave">
                        <input class="btnsub" type="reset" value="Cancel" name="btnsave">
                    </td>

                </tr>
            </table>
        </form>
        </div>
            `;
                }

                // Show the registration form with sliding animation
                formContainer.style.right = '0';
                userCard.style.opacity = '0'; // Hide the AG card
                agencyCard.style.opacity = '0'; // Hide the AD card
            }
        }

        function hideRegistrationForm() {
            var formContainer = document.getElementById('registrationForm');
            var userCard = document.getElementById('userCard');
            var agencyCard = document.getElementById('agencyCard');

            if (formContainer && userCard && agencyCard) {
                // Hide the registration form with sliding animation
                formContainer.style.right = '-100%';
                userCard.style.opacity = '1'; // Show the AG card
                agencyCard.style.opacity = '1'; // Show the AD card
            }
        }
    </script>
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
                                        document.getElementById("user_latitude").value = e.latlng.lat;
                                        document.getElementById("user_longitude").value = e.latlng.lng;
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
                                   openModalBtn.addEventListener("click", function(e) {
                                                e.preventDefault();
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
    
    <script>
            function navigateToPage(url) {
                window.location.href = url; // Redirect to the specified URL
            }
        </script>
        
        <script>
            document.addEventListener("DOMContentLoaded", function() {
    const fileInput = document.getElementById("fileLogoInput");

    // Add event listener for change event on file input
    fileInput.addEventListener("change", function() {
        if (fileInput.files.length > 0) {
            // If a file is selected, dynamically change button text background color
            const uploadButton = fileInput.nextSibling; // Select the sibling button element
            uploadButton.style.backgroundColor = "#ffcccc"; // Change button text background color
             // Change button text color
        } else {
            // If no file is selected (e.g., input cleared), reset button text styles
            const uploadButton = fileInput.nextSibling; // Select the sibling button element
            uploadButton.style.backgroundColor = "yellowgreen"; // Reset button text background color
            }
    });
});

        </script>

</body>
</html>
