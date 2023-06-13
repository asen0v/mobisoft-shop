<%@page import="java.sql.ResultSet"%>
<%@page import="com.solent.mavenproject2.Database"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String searchModel = request.getParameter("txtModel");
    String searchTypeInput = request.getParameter("seltype");     
            
            
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
        
        if (searchModel==null || searchModel==""){
             sql = "Select * from inventory order by make";
        } else {
            sql = "Select * from inventory where make='"+searchModel+"' AND type='"+searchTypeInput+"'";
        }
        
        
        
        resultSet = statement.executeQuery(sql);
        
    
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
     
<form action="search.jsp" method="get">
            <div class="row">
              <div class="col-sm">
                 <input type="text" class="form-control" placeholder="Input Make" name="txtModel">
              </div>
                <div class="col-sm">
                    <select class="form-control" name="seltype">
                        <option value="">Select Type</option>
                        <option value="phone">Phone</option>
                        <option value="accessory">Accessory</option>
                    </select>
              </div>
              <div class="col-sm">
                  <input type="submit" value="Search" class="btn btn-primary">
              </div>

            </div>
        </form>
		
		
	
          <div class="table-responsive">
            <table class="table table-striped table-sm">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Accessory Make</th>
                  <th>Accessory Title</th>
                  <th>Accessory Price</th>
                  <th>Quantity Available</th>
                  <td>Actions</td>
                </tr>
              </thead>
              <tbody>
                <% while(resultSet.next()) { %>
                <tr>
                  <td><%=resultSet.getString("id") %></td>
                  <td><% out.println(resultSet.getString("make")); %></td>
                  <td><%=resultSet.getString("model") %></td>
                  <td>£<%=resultSet.getString("price") %></td>
                  <td><%=resultSet.getString("qty") %></td>
                  <td><a href="#"><span data-feather="edit"></span></a> &nbsp; <a href="delinv2.jsp?id=<%=resultSet.getString("id") %>"><span data-feather="trash"></span></a></td>
                </tr>
                <% } %>
              </tbody>
            </table>
              <div class="text-center">
SQL Query: <span class="badge bg-info-subtle text-info-emphasis rounded-pill"><%= sql %></span></div>

          <%
          } catch (Exception e){
            e.printStackTrace();
          }    
          %>
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
