<%@page import="com.solent.mavenproject2.Database" %>

<%
    Database db = new Database();

    String uName = request.getParameter("txtName");
	String uPass = request.getParameter("txtPass");
    String uTitle = request.getParameter("txtTitle");
    String uBank = request.getParameter("txtBank");
    String uType = request.getParameter("txtType");
    int i = 0; 
    String sql = "UPDATE user SET uPass = '" + uPass + "', uTitle = '" + uTitle + "', uBank = '" + uBank + "', uType = '" + uType + "' WHERE uName = '" + uName + "'";

    out.println(sql);
    i = db.executeUpdate(sql);
	
	response.sendRedirect("view-users.jsp");
%>
