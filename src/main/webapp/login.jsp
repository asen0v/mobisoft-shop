
<%@page import="com.solent.mavenproject2.User"  %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            String inputUsername = request.getParameter("txtUsername");
            String inputPassword = request.getParameter("txtPassword");
            User uSr = new User();
            if( uSr.login(inputUsername, inputPassword) ) {
                String[] uInfo = uSr.getUserDetails(inputUsername, inputPassword);
                session.setAttribute("userID", uInfo[0]);
                session.setAttribute("userTitle", uInfo[1]);
                session.setAttribute("userType", uInfo[2]);
                if(uInfo[2].equals("admin")){
                    response.sendRedirect("admin/dashboard.jsp");
                } else response.sendRedirect("home.jsp");
                
            } else response.sendRedirect("index.jsp?msg=username or password mismatched");
        %>
    </body>
</html>
