<%-- 
    Document   : home
    Created on : 12-Apr-2023, 15:58:38
    Author     : abbasm7
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    String carNameInput = request.getParameter("txtcarname");
    String carColourInput = request.getParameter("selcarcolour");     
            
            
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
        
        if (carNameInput==null || carNameInput==""){
             sql = "Select * from cars order by carTitle";
        } else {
            sql = "Select * from cars where carTitle='"+carNameInput+"'";
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

    <title>Pricing example for Bootstrap</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/pricing/">

    <!-- Bootstrap core CSS -->
    <link href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="pricing.css" rel="stylesheet">
  </head>

  <body>

    <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
      <h5 class="my-0 mr-md-auto font-weight-normal">Company name</h5>
      <nav class="my-2 my-md-0 mr-md-3">
        <a class="p-2 text-dark" href="home.jsp">Home</a>
        <a class="p-2 text-dark" href="cars.jsp">Show Cars</a>
        <a class="p-2 text-dark" href="#">Enterprise</a>
        <a class="p-2 text-dark" href="#">Support</a>
      </nav>
      <% if (session.getAttribute("userID")!=null) { %>
        <u>Welcome <%=session.getAttribute("userTitle")%></u> &nbsp;&nbsp;<a class="btn btn-outline-primary" href="logout.jsp">Logout</a>
      <% } else {%>
        <a class="btn btn-outline-primary" href="index.jsp">Login</a>
      <% } %>
    </div>

    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
      <h1 class="display-4">Our Available Cars</h1>
      <p class="lead">Quickly build an effective pricing table for your potential customers with this Bootstrap example. It's built with default Bootstrap components and utilities with little customization.</p>
    </div>

    <div class="container">
        <form action="cars.jsp" method="get">
            <div class="row">
              <div class="col-sm">
                  <input type="text" class="form-control" name="txtcarname">
              </div>
                <div class="col-sm">
                    <select class="form-control" name="selcarcolour">
                        <option value="">--Colour--</option>
                        <option value="Red">Red</option>
                        <option value="Blue">Blue</option>
                    </select>
              </div>
              <div class="col-sm">
                  <input type="submit" class="btn btn-primary">
              </div>

            </div>
        </form>
        
      <div class="card-deck mb-3 text-center">
          <table class="table">
              <tr>
                  <th>Car Title</th>
                  <th>Car Make</th>
                  <th>Car Colour</th>
                  <th>Car Price</th>
                  <th>Action</th>
              </tr>
              <% while(resultSet.next()){ %>
              <tr>
                  <td><%=resultSet.getString("carTitle")%></td>
                  <td><%=resultSet.getString("carMake")%></td>
                  <td><%=resultSet.getString("carColour")%></td>
                  <td><%=resultSet.getString("carPrice")%></td>
                  <td><a href="deletecar.jsp?carId=<%=resultSet.getString("carId")%>">Delete record</a></td>
              </tr>
              <% } %>
          </table>

          <%
          } catch (Exception e){
            e.printStackTrace();
          }    
          %>
      </div>
    </div>
    
      <footer class="pt-4 my-md-5 pt-md-5 border-top">
        <div class="row">
          <div class="col-12 col-md">
            <img class="mb-2" src="https://getbootstrap.com/docs/4.0/assets/brand/bootstrap-solid.svg" alt="" width="24" height="24">
            <small class="d-block mb-3 text-muted">&copy; 2017-2018</small>
          </div>
          <div class="col-6 col-md">
            <h5>Features</h5>
            <ul class="list-unstyled text-small">
              <li><a class="text-muted" href="#">Cool stuff</a></li>
              <li><a class="text-muted" href="#">Random feature</a></li>
              <li><a class="text-muted" href="#">Team feature</a></li>
              <li><a class="text-muted" href="#">Stuff for developers</a></li>
              <li><a class="text-muted" href="#">Another one</a></li>
              <li><a class="text-muted" href="#">Last time</a></li>
            </ul>
          </div>
          <div class="col-6 col-md">
            <h5>Resources</h5>
            <ul class="list-unstyled text-small">
              <li><a class="text-muted" href="#">Resource</a></li>
              <li><a class="text-muted" href="#">Resource name</a></li>
              <li><a class="text-muted" href="#">Another resource</a></li>
              <li><a class="text-muted" href="#">Final resource</a></li>
            </ul>
          </div>
          <div class="col-6 col-md">
            <h5>About</h5>
            <ul class="list-unstyled text-small">
              <li><a class="text-muted" href="#">Team</a></li>
              <li><a class="text-muted" href="#">Locations</a></li>
              <li><a class="text-muted" href="#">Privacy</a></li>
              <li><a class="text-muted" href="#">Terms</a></li>
            </ul>
          </div>
        </div>
      </footer>
    


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="../../assets/js/vendor/popper.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <script>
      Holder.addTheme('thumb', {
        bg: '#55595c',
        fg: '#eceeef',
        text: 'Thumbnail'
      });
    </script>
  </body>
</html>




