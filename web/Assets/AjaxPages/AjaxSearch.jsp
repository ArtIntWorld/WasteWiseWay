<%-- 
    Document   : AjaxSearch
    Created on : 10 Mar, 2023, 3:39:26 PM
    Author     : ardra
--%>



<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

 <table border="1" align="center">
            <tr>
                
                
            
            <%
                String select = "select * from tbl_agency s inner join tbl_place p on p.place_id = s.place_id inner join tbl_district d on p.district_id = d.district_id inner join tbl_type t on p.type_id = t.type_id where agency_vstatus = 1 and true";
                if(!request.getParameter("did").equals(""))
                {
                    select += " and d.district_id='"+request.getParameter("did") +"'";
                }
                if(!request.getParameter("pid").equals(""))
                {
                    select += " and p.place_id='"+request.getParameter("pid") +"'";
                }
                if(!request.getParameter("tid").equals(""))
                {
                    select += " and p.type_id='"+request.getParameter("tid") +"'";
                }
              ResultSet res = con.selectCommand(select);
                int i = 0;
                while (res.next()) {
                    i++;
            %>
            
           
            <td> <img src="../Assets/Files/AgencyLogo/<%=res.getString("agency_logo")%>" width="120" height="120"/><br>
                    Name: <%=res.getString("agency_name")%><br>
                Email: <%=res.getString("agency_email")%><br>
               Address: <%=res.getString("agency_address")%><br>
                Contact: <%=res.getString("agency_contact")%><br>
               District: <%=res.getString("district_name")%><br>
              Place: <%=res.getString("place_name")%><br>
               Type: <%=res.getString("type_name")%><br>
               <a href="wastereq.jsp?aid=<%=res.getString("agency_id")%>">Send Request</a>
          
            <%
            if(i==4)
                out.print("</tr><tr>");
                }
            %>
            </tr>
            </table>