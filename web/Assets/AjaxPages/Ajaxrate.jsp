<%@page  import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%
    String sel="select * from tbl_wastematerial where wastematerial_id='"+request.getParameter("mt")+"' and wastecategory_id='"+request.getParameter("cat")+"'";
    ResultSet rs=con.selectCommand(sel);
    if(rs.next())
    {
        %>
        <input type="text" name="txt_rate" value="<%=rs.getString("wastematerial_rate")%>" readonly="">
        <%
    }
%>
