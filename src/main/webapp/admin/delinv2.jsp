<%@page import="com.solent.mavenproject2.Database" %>


<%
    Database db = new Database();

    String accIDinput = request.getParameter("id");
        int i = 0; 
    String sql = "Delete from inventory where id="+accIDinput;
    
   i = db.executeUpdate(sql);
	
	response.sendRedirect("view-accessories.jsp?msg=Accessory has been deleted.");

%>