<%-- 
    Document   : AjaxWasteMaterial
    Created on : 10 Mar, 2023, 3:05:14 PM
    Author     : ardra
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <option value="">--select--</option>

<%
    String selT = "select * from tbl_wastematerial where wastecategory_id='" + request.getParameter("did") + "'";
    //out.print(selT);
    ResultSet rslt = con.selectCommand(selT);

    while (rslt.next()) {

%>



<option value="<%=rslt.getString("wastematerial_id")%>"><%=rslt.getString("wastematerial_type")%></option>

<%

    }
%>


