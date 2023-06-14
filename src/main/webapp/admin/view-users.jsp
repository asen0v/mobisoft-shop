
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
      
          <h2>  <span data-feather="users"></span> Users  </h2>  <% if (msg != null && !msg.isEmpty()) { %>
	  <div id="msg">
<h3><i style="color: red">
	   <%= msg %>
	  </i></h3>
	  </div>
		<% } %>
          <div class="table-responsive">
            <table class="table table-striped table-sm">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Name</th>
                  <th>Username</th>
				  <th>Bank</th>
                  <th>Type</th>
                  <td>Actions</td>
                </tr>
              </thead>
              <tbody>
                <% while(rs.next()) { %>
                <tr>
                  <td><%=rs.getString("uId") %></td>
                  <td><% out.println(rs.getString("uTitle")); %></td>
                  <td><%=rs.getString("uName") %></td>
				  <td>£<%=rs.getString("uBank") %></td>
                  <td><%=rs.getString("uType") %></td>
                  <td><a href="edit-user.jsp?uId=<%=rs.getString("uId") %>">
                          <span data-feather="edit"></span></a> &nbsp; 
                          <a href="deluser.jsp?uId=<%=rs.getString("uId") %>"><span data-feather="trash"></span></a></td>
                </tr>
                <% } %>
              </tbody>
            </table>
          </div>
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
