<%@page import="com.solent.mavenproject2.Database" %>


<%
    Database db = new Database();

    String phoneIDinput = request.getParameter("id");
        int i = 0; 
    String sql = "Delete from inventory where id="+phoneIDinput;
    
   i = db.executeUpdate(sql);
	
	response.sendRedirect("view-phones.jsp?msg=Phone has been deleted.");

%>