<%-- 
    Document   : main
    Created on : 12 Apr, 2024, 8:10:14 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WasteWiseWay - Building a Green Environment</title>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&family=Protest+Riot&family=Sniglet:wght@400;800&display=swap" rel="stylesheet">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&family=Protest+Riot&family=Sniglet:wght@400;800&display=swap" rel="stylesheet">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&family=Protest+Riot&family=Sniglet:wght@400;800&display=swap" rel="stylesheet">
    </head>
    <style>

        body,html
        {
            font-family: "Noto Sans", sans-serif;
            font-size: 14px;
            /*            margin: 0;
                        padding: 0;*/
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        /*        .container
                {
                    flex: 1;
                    flex-direction: column;
                    display: flex;
                }*/

        .navbar
        {
            display: flex;
            padding: 20px;
            justify-content: center;
            align-items: center;
            background-color: rgba(19, 17, 17, 0.75);
            position: relative;
            overflow: hidden;
            /*            border: solid;*/
            margin-top: -10px;
            margin-right: -8px;
            margin-left: -8px;
        }

        .logo
        {
            position: absolute;
            /* Adjust top position as needed */
            left: 5px;
            top: 4px;
            width: 50px;
            transition: display 0.2s ease-in-out;
        }

        ul.list 
        {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
            font-weight: bold;
            color: rgba(19, 17, 17, 0.5);
            cursor: default;
        }

        ul.list li 
        {
            display: inline;
            margin-right: 35px;
            margin-left: 30px;
            color: rgba(19, 17, 17, 0);

        }

        button
        {
            position: absolute;
            color: #424241;
            font-weight: bolder;
            right: 10px;
            padding-top: 7px;
            padding-bottom: 7px;
            border: none;
            width: 80px;
            height: 35px;
            background-color: rgb(106, 255, 0);
            cursor: pointer;
            transition: background-color 0.1s ease-in-out,box-shadow 0.1s ease-in-out;
            box-shadow: 0px 0px 5px rgba(0,0,0,0.3);
            border-radius: 6px;
        }

        button:hover
        {
            background-color: #d0ff00;
            box-shadow: 0px 0px 0px rgb(0,0,0);
        }

        #btn1
        {
            right: 20px;
        }

        #btn2
        {
            right: 105px;
        }

        .navbar hr
        {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%; /* Full width of the navbar */
            height: 1px; /* Height of the line */
            background-color: rgba(177, 177, 177, 0.51); /* Color of the line */
            margin: 0; /* Remove default margin */
            padding: 0; /* Remove default padding */
        }

        a
        {
            text-decoration: none;
            color: inherit;
            transition: color 0.1s ease-in-out;
        }

        a:hover
        {
            color: rgb(106, 255, 0);
        }

        .section1
        {
            display: flex;
            flex-direction: column;
            /*padding: 20px;*/
            justify-content: center;
            align-items: center;
            background-image: url("Assets/Template/Main/images/bg-green.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            /*            position: relative;*/
            overflow: hidden;
            /*            border: solid;*/
            margin-right: -8px;
            margin-left: -8px;
            height: 92.4vh; 
        }

        .black-overlay 
        {
            position: absolute;
            left: 0;
            width: 100%;
            height: 92.4vh;
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)); /* Adjust the opacity (0.5) as needed */
        }

        .slogan
        {
            position: absolute;
            right: 50px;
            font-family: "Noto Sans", sans-serif;
            font-weight: 1000;
            font-style: normal;
            font-size: 35px;
            color: #ebebeb;
            word-spacing: 4px;
            letter-spacing: 1px;
            line-height: 55px;
            text-align: right;
            margin-top: 50px;
        }

        .spcl
        {
            color: greenyellow;
        }

        .img1
        {
            justify-content: center;
            align-items: center;
        }

    </style>

    <body>
        <div class="container">
            <div class="navbar">
                <div class="logosym"><a href="index.jsp"><img class="logo" src="Assets/Template/Main/images/WWWlogo.png"></a></div>
                <ul class="list">
                    <li>About Us</li>
                    <li>Portfoli</li>
                </ul>
                <button id="btn1" onclick="navigateToPage('Guest/Login.jsp')">Login</button>
                <button id="btn2" onclick="navigateToPage('Guest/Register.jsp')">Register</button>
                <hr>
            </div>

            <script>
                function navigateToPage(url) {
                    window.location.href = url; // Redirect to the specified URL
                }
            </script>