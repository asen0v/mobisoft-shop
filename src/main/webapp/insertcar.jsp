<%@page import="com.solent.mavenproject2.Database" %>

<%
    Database db = new Database();

    String carTitle = request.getParameter("txtCarTitle");
    String carMake = request.getParameter("txtCarMake");
    String carColour = request.getParameter("txtCarColour");
    String carPrice = request.getParameter("txtCarPrice");
    int i = 0; // Initialize the variable i with a default value
    String sql = "INSERT INTO cars (carTitle, carMake, carColour, carPrice) VALUES ('"+carTitle+"', '"+carMake+"', '"+carColour+"', '"+carPrice+"')";

    out.println(sql);
    i = db.executeInsert(sql);
	
	response.sendRedirect("dashboard.jsp");
%>
