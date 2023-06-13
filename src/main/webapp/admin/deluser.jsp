<%@page import="com.solent.mavenproject2.Database" %>


<%
    Database db = new Database();

    String userIDinput = request.getParameter("uId");
        int i = 0; 
    String sql = "Delete from user where uId="+userIDinput;
    
   i = db.executeUpdate(sql);
	
	response.sendRedirect("view-users.jsp?msg=User has been deleted.");

%>