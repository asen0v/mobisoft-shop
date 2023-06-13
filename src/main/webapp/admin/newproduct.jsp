<%@page import="com.solent.mavenproject2.Database" %>

<%
    Database db = new Database();

    String type = request.getParameter("txtType");
    String make = request.getParameter("txtMake");
    String model = request.getParameter("txtModel");
    String price = request.getParameter("txtPrice");
    String qty = request.getParameter("txtQty");
    int i = 0; 
    String sql = "INSERT INTO inventory (type, make, model, price, qty) VALUES ('"+type+"', '"+make+"', '"+model+"', '"+price+"', '"+qty+"')";

    out.println(sql);
    i = db.executeUpdate(sql);
	
	response.sendRedirect("dashboard.jsp?msg=New Product has been added.");
%>
