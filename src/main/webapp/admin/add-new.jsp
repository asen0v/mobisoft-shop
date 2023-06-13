

<%@page import="java.sql.ResultSet"%>
<%@page import="com.solent.mavenproject2.Database"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Database db = new Database();
    String sql = "Select * from phones";
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
     

          <h2>  <span data-feather="plus-circle"></span> Add New Product</h2>
          <div class="table-responsive">
		  
		   <form name="frmNewProduct" action="newproduct.jsp" method="post">
              <table>
			  <tr>
			  <td>Type:</td>
<td><select id="txtType" name="txtType">
  <option value="phone">Phone</option>
  <option value="accessory">Accessory</option>
</select> </td></tr>
                  <tr>
                      <td>Make</td>
                      <td><input type="text" name="txtMake"></td>
                  </tr>
                  <tr>
                      <td>Model</td>
                      <td><input type="text" name="txtModel"></td>
                  </tr>
                  <tr>
                      <td>Price</td>
                      <td><input type="text" name="txtPrice"></td>
                  </tr>
                  <tr>
                      <td>Quantity</td>
                      <td><input type="text" name="txtQty"></td>
                  </tr>
                  <tr>
                      
                      <td><input class="btn btn-primary rounded-pill px-10" type="submit" value="Add New Product"></td>
                  </tr>
              </table>
              </form>
		  
		  
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
