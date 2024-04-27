<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WASTEMATERIAL jsp page</title>
    </head>
    <body>
        <%@include  file="headadmin.jsp" %>
        <br>
        <div id="tab" align="center">
        <%
            String Wastematerial="";
            String eid = "", ename = "",category = "",rname="";
            if(request.getParameter("btnsave")!=null) {
                if (!request.getParameter("hid").equals("")) {
                  String up = "update tbl_wastematerial set wastematerial_type='" + request.getParameter("txtmaterialtype") + "' ,wastematerial_rate='" + request.getParameter("txtrate") + "',wastecategory_id='" + request.getParameter("category")+"' where wastematerial_id='" +request.getParameter("eid")+ "' "; 
                 if(con.executeCommand(up))
                 {
                     %>
                     <script>
                         alert("updated");
                         window.location="Wastematerial.jsp";
                     </script>
                     <%
                 }
                     } else 
            {
                 Wastematerial=request.getParameter("txtmaterialtype");
                String ins="insert into tbl_wastematerial(wastematerial_type,wastematerial_rate,wastecategory_id)values('"+Wastematerial+"','"+request.getParameter("txtrate")+"','"+request.getParameter("category")+"')";
                        if(con.executeCommand(ins))
                        {
                     %>
                     <script>
                         alert("Data inserted");
                         </script>
                         <%
                        }
            } 
            }
            if (request.getParameter("eid") != null) {
                //out.print(request.getParameter("eid"));
                String sel = "select * from tbl_wastematerial where wastematerial_id='" + request.getParameter("eid") + "'";
                //out.print(sel);
                ResultSet rs = con.selectCommand(sel);
                if(rs.next())
                {
                eid = rs.getString("wastematerial_id");
                ename = rs.getString("wastematerial_type");
                 rname = rs.getString("wastematerial_rate");
                category= rs.getString("wastecategory_id");
                //out.print(category);
                }
                
            }

        %>
   
        <form method="post">
    <table border="1" align="center" cellpadding="10" >

	<tr>
 		<td>Material type</td>
                 <input type="hidden" name="hid" required="required" value="<%=eid%>">
 		<td><input type="text" name="txtmaterialtype" required="required" pattern="[a-zA-Z ]*$" title="Input Must be letters" autocomplete="off" value="<%=ename%>"></td>
        </tr>  
        <tr>
        <td>Rate</td>
 		<td><input type="text" name="txtrate" required="required" pattern="[0-9]*" title="Input Must be numbers" autocomplete="off" value="<%=rname%>"></td>
	</tr>
        <tr>
                    <td>Waste Category</td>

                    <td>  
                       
                            <%
                                String sel = "select * from tbl_wastecategory";
                                ResultSet rs = con.selectCommand(sel);

                                while (rs.next()) {

                            %>

                            <input type="radio" name="category" value="<%=rs.getString("wastecategory_id")%>" 
                                   <%
                                   if(rs.getString("wastecategory_id").equals(category)) 
                                   out.print("checked");
                                   %>><%=rs.getString("wastecategory_name")%>
                            

                           <%

                                }
                            %>

	
                    </td>
                <tr>
     
     
    
      
  </td>
</tr>
        <tr>
        <td colspan="3" align="center">
            <input type="submit" value="Save" name="btnsave">
             <input type="submit" value="Cancel" name="btnsave">
    </table>
            <table border="1" align="center">
                <tr>
   <th>Serial No</th>
   <th>Type</th>
   <th>Rate</th>
   <th>Waste category</th>
   <th>Action</th>
 </tr>
 <%
            String select = "select * from tbl_wastematerial s inner join tbl_wastecategory p on p.wastecategory_id = s.wastecategory_id ";
            ResultSet resl=con.selectCommand(select);
            int i=0;
            while(resl.next()){
             i++; 
             %>
 
         
<tr>
     <td><%=i%></td>
     <td><%=resl.getString("wastematerial_type")%></td>
      <td><%=resl.getString("wastematerial_rate")%></td>
       <td><%=resl.getString("wastecategory_name")%></td>      
     <td><a href="Wastematerial.jsp?eid=<%=resl.getString("wastematerial_id")%>">Edit</a></td>   
     
        </tr>
        <%
            }
            %>
    </table> 
        </form>     
        </div>
    </body>
     <%@include file="footadmin.jsp" %>
</html>