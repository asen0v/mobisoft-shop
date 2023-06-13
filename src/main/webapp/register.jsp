<%@ page import="com.solent.mavenproject2.User" %>

<%
    String inputUsername = request.getParameter("txtUsername");
    String inputPassword = request.getParameter("txtPassword");
    String inputTitle = request.getParameter("txtTitle"); 

    User uSr = new User();

    if (inputUsername != null && inputPassword != null) {
        boolean registrationSuccess = uSr.register(inputUsername, inputPassword, inputTitle); 
        
        if (registrationSuccess) {
            // Retrieve user details after successful registration
            if (uSr.login(inputUsername, inputPassword)) {
                String[] uInfo = uSr.getUserDetails(inputUsername, inputPassword);
                session.setAttribute("userID", uInfo[0]);
                session.setAttribute("userTitle", uInfo[1]);
                session.setAttribute("userType", uInfo[2]);
                response.sendRedirect("home.jsp");
            } else {
                response.sendRedirect("register.jsp?msg=Failed to retrieve user details");
            }
        } else {
            response.sendRedirect("register.jsp?msg=Registration failed");
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">

    <title>Register - MobiSoft</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/sign-in/">

    <!-- Bootstrap core CSS -->
    <link href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css" rel="stylesheet">s

    <!-- Custom styles for this template -->
    <link href="https://getbootstrap.com/docs/4.0/examples/sign-in/signin.css" rel="stylesheet">
  </head>
  
  
 <body class="text-center">
      <form class="form-signin" action="register.jsp" method="post">
      <img class="mb-4" src="https://getbootstrap.com/docs/4.0/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
      <h1 class="h3 mb-3 font-weight-normal">Register</h1>
       <label for="txtTitle" class="sr-only">Name</label>
      <input type="text" name="txtTitle" class="form-control" placeholder="Name" required>
      <label for="txtUsername" class="sr-only">Username</label>
      <input type="text" name="txtUsername" class="form-control" placeholder="Username" required autofocus>
      <label for="txtPassword" class="sr-only">Password</label>
      <input type="password" name="txtPassword" class="form-control" placeholder="Password" required>
      
      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me"> Remember me
        </label>
      </div>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
            Already have an account? <a href="index.jsp">Log in</a>
      <p class="mt-5 mb-3 text-muted">&copy; 2023 - Veselin Asenov</p>
    </form>
  </body>
</html>

