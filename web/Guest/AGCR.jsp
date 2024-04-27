<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

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
            width: 100%;
            height: 100%;
            background: linear-gradient(rgb(96, 245, 88), rgb(231, 250, 90));
            padding: 60px;
            box-sizing: border-box;
            overflow-y: auto;
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
        <div id="registrationForm">
    <div id="registrationFormContent">
        <h2 id="formTitle"></h2>
        <div id="formContainer">


            <div id="tab" align="center">
                <form class="Form" method="post" enctype="multipart/form-data" action="../Assets/ActionPages/AgencyUploadAction.jsp">

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
                            
    </div>
</div>
</div>
    </body>
    
</html>
