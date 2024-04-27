<!doctype html>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <html>
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, viewport-fit=cover">
            <meta name="apple-mobile-web-app-capable" content="yes" />
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Bebas+Neue&family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=Merriweather:ital,wght@0,300;0,400;0,700;0,900;1,300;1,400;1,700;1,900&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&family=Protest+Riot&family=Quantico:ital,wght@0,400;0,700;1,400;1,700&family=Sniglet:wght@400;800&family=Teko:wght@300..700&display=swap" rel="stylesheet">
            <title>New Template ? Slides 4.1 Template Generator</title>

        </head>
        
        <style>
            
            body, html 
            {
                margin: 0;
                padding: 0;
                height: 100%;
            }
           
            
            form
            {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                background: linear-gradient(to top, #f5ff61, #86ff61);
                height: 80%;
                width: 50%;
                border-radius: 12px;
                border-: 1px;
                
            }
            
            .container
            {
                height: 100%;
                margin: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                background: linear-gradient(to top, #d1db44, #65d642);
            }
            
            .container img
            {
                width: 250px;
            }
            
            .logo1
            {      
                margin-top: -20px;
                margin-bottom: 20px;
                
            }
            
            .logo2
            {      
                margin-top: -10px;
                margin-bottom: 50px;               
            }
            
            .txt
            {
                margin-bottom: 27px;
                border: none; 
                height: 32px;
                width: 300px;
                background-color: #a9f241;
                box-shadow: 0px 1px 10px rgba(0, 0, 0,0.2);
                border-radius: 9px;
                padding: 12px 12px;
                font-family: "Merriweather", serif;
                font-weight: 700;
                font-style: normal;
                letter-spacing: 3px;
            }
            
            .btn
            {
                margin-top: 10px;
                width: 90px;
                height: 50px;
                border: none;
                border-radius: 45px;
                cursor: pointer;
                background: linear-gradient(to right, #56f054, #83f582);
                font-family: "Teko", sans-serif;
                font-optical-sizing: auto;
                font-size: 20px;
                letter-spacing: 3px;
                font-style: normal;
                font-weight: 400;
                color: #34362f;
            }
            
            .conatiner p
            {
                margin-bottom: 10px;
                
            }
                       
         </style>
        
<body>
    
    <%
        if (request.getParameter("btnsave") != null) {

            String sel = "select * from tbl_admin where admin_email='" + request.getParameter("txtemail") + "' and admin_password='" + request.getParameter("txtpwd") + "'";
            ResultSet rs = con.selectCommand(sel);

            String sele = "select * from tbl_agency where agency_email='" + request.getParameter("txtemail") + "'  and agency_password='" + request.getParameter("txtpwd") + "' and agency_vstatus=1 ";
            ResultSet res = con.selectCommand(sele);

            String selec = "select * from tbl_user where user_email='" + request.getParameter("txtemail") + "'  and user_password='" + request.getParameter("txtpwd") + "'";
            ResultSet resu = con.selectCommand(selec);

            String select = "select * from tbl_supervisor where supervisor_email='" + request.getParameter("txtemail") + "'  and supervisor_password='" + request.getParameter("txtpwd") + "'";
            ResultSet resul = con.selectCommand(select);
            
            String select1 = "select * from tbl_employee where employee_email='" + request.getParameter("txtemail") + "'  and employee_password='" + request.getParameter("txtpwd") + "'";
            ResultSet result = con.selectCommand(select1);

            if (rs.next()) {
                session.setAttribute("aid", rs.getString("admin_id"));
                session.setAttribute("aname", rs.getString("admin_name"));
    %>
    <script>
        window.location = "../Admin/Home.jsp";
    </script>
    <%
    } else if (res.next()) {
        session.setAttribute("agid", res.getString("agency_id"));
        session.setAttribute("agname", res.getString("agency_name"));
        session.setAttribute("agdid", res.getString("district_id"));
    %>
    <script>
        window.location = "../Agency/Home2.jsp";
    </script>
    <%
    }
    else if (result.next()) {
        session.setAttribute("egid", result.getString("employee_id"));
        session.setAttribute("egname", result.getString("employee_name"));
    %>
    <script>
        window.location = "../Employee/Home4.jsp";
    </script>
    <%
    }
    else if (resu.next()) {
        session.setAttribute("usid", resu.getString("user_id"));
        session.setAttribute("usname", resu.getString("user_name"));
    %>
    <script>
        window.location = "../User/Home3.jsp";
    </script>
    <%
    } else if (resul.next()) {
        session.setAttribute("supid", resul.getString("supervisor_id"));
        session.setAttribute("supname", resul.getString("supervisor_name"));
    %>
    <script>
        window.location = "../Supervisor/Home4.jsp";
    </script>
    <%
            } else {
                out.print("<script>alert('Invalid Credentials')</script>");
            }
        }


    %>
    <div class="container">
                       
                        <form class="Form" action="#" autocomplete="off" method="post">
                            
                             <img class="logo1" src="../Assets/Template/Main/images/WWWlog.png">
                             <img class="logo2" src="../Assets/Template/Main/images/WasteWiseWay1.png">
                            <table><input type="email" class="txt" name="txtemail" placeholder="Email" val=""/></table>
                            <input type="password" class="txt" name="txtpwd" placeholder="Password" val=""/>

                            <button type="submit" class="btn" name="btnsave">Login</button>
                            
                        </form>
        </div>            
</body>
</html>