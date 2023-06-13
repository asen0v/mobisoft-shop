

<%@page import="java.sql.ResultSet"%>
<%@page import="com.solent.mavenproject2.Database"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String msg = request.getParameter("msg");
    Database db = new Database();
    String sql = "Select * from user";
    ResultSet rs = db.executeSQL(sql);
    
%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">

    <title>Dashboard Template for Bootstrap</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/dashboard/">

    <!-- Bootstrap core CSS -->
    <link href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">
  </head>

  <body>
   
	  
	  <jsp:include page="menu.jsp" />


        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
     
<% if (msg != null && !msg.isEmpty()) { %>
	  <div id="msg">
<h3><i style="color: red">
	   <%= msg %>
	  </i></h3>
	  </div>
		<% } %>
		
   <h1> Welcome, <%
            out.println(session.getAttribute("userTitle"));
      %> </h1>
	  
	  

<p>As an administrator, you hold the power to manage and optimize the operations of our platform. With a comprehensive range of 
tools and features at your disposal, you can ensure a seamless experience for both our users and our business.</p>
<p>From this centralized hub, you have the ability to oversee various aspects of our platform's functionality. 
Whether it's adding new products to our extensive catalog, monitoring the latest orders, or managing user accounts, you're in control.</p>

<p>Feel free to explore the different sections available to you. Use the "Add New Product" option to expand our product offerings 
and keep up with the ever-evolving mobile industry. If you need an overview of the existing phones or accessories, simply navigate to the 
corresponding sections to stay up to date with the latest trends.</p>

<p>Keeping a close eye on orders is crucial, and the "<a href="view-orders.jsp">View Orders</a>" section provides you with real-time information about purchases 
made by our valuable customers. Additionally, you can browse through user profiles and make necessary updates using the "<a href="view-users.jsp">Users</a>" section.</p>

<p>Should you ever need to find specific information or make changes quickly, take advantage of the search functionality conveniently located in the upper right corner.</p>

<p>We're thrilled to have you on board as an admin, and we trust that your presence will contribute to the growth and success of MobiSoft.
Should you have any questions or require assistance, our support team is always available to lend a helping hand.</p>

<p>Thank you for being an integral part of our MobiSoft community. Happy managing!</p>

<p>Best regards,</p>
<p>The MobiSoft Team</p>

        </main>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="../../assets/js/vendor/popper.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>

    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>

  </body>
</html>

