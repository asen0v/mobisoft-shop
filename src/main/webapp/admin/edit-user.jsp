
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    String uId = request.getParameter("uId");  
            
            
    String driverName = "com.mysql.cj.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String dbName = "test";
    String userId = "root";
    String password = "";
    
    try {
        Class.forName(driverName);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    
    try {
        connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
        statement = connection.createStatement();
        String sql = null;
        
        if (uId==null || uId==""){
             sql = "Select valid user.";
        } else {
            sql = "Select * from user where uId='"+uId+"'";
        }
        
        out.println(sql);
        
        resultSet = statement.executeQuery(sql);
        
    
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
     

         
		     <% while(resultSet.next()){ %>
		  <h2>  <span data-feather="plus-circle"></span> Edit User</h2>
          <div class="table-responsive">
		  
		   <form name="frmEditUser" action="user-update.jsp" method="post">
              <table>
			
                  <tr>
                      <td>Name</td>
                      <td><input type="text" name="txtTitle" value="<%=resultSet.getString("uTitle")%>"/></td>
                  </tr>
                  <tr>
                      <td>Username</td>
                      <td><input type="text" name="txtName" value="<%=resultSet.getString("uName")%>"/></td>
                  </tr>
				   <tr>
                      <td>Password</td>
                      <td><input type="password" name="txtPass" value="<%=resultSet.getString("uPass")%>"/></td>
                  </tr>
                  <tr>
                      <td>Bank (£)</td>
                      <td><input type="text" name="txtBank" value="<%=resultSet.getString("uBank")%>"/></td>
                  </tr>
                    <tr>
			  <td>Permissions:</td>
<td><select id="txtType" name="txtType">
<option value="<%=resultSet.getString("uType")%>"><%=resultSet.getString("uType")%></option>
<option> --- </option>
  <option value="user">User</option>
  <option value="admin">Admin</option>
</select> </td></tr>
                  <tr>
                      
                      <td><input class="btn btn-primary rounded-pill px-10" type="submit" value="Edit User"></td>
                  </tr>
              </table>
              </form>
		  
		   <% } %>
          </div>
		  
		    <%
          } catch (Exception e){
            e.printStackTrace();
	}   
          %>
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



