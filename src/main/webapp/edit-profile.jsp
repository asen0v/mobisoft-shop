<%@page import="com.solent.mavenproject2.Database" %>

<%
    Database db = new Database();

    String uName = request.getParameter("txtName");
	String uPass = request.getParameter("txtPass");
    String uTitle = request.getParameter("txtTitle");
    int i = 0; 
    String sql = "UPDATE user SET uName = '" + uName + "', uPass = '" + uPass + "', uTitle = '" + uTitle + "' WHERE uName = '" + uName + "'";

    out.println(sql);
    i = db.executeUpdate(sql);
	
	response.sendRedirect("home.jsp");
%>
