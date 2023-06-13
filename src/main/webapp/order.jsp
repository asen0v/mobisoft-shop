<%@page import="com.solent.mavenproject2.Database"%>
<%@page import="com.solent.mavenproject2.User"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String itemid = request.getParameter("itemID");  
            
            
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
        
        if (itemid==null || itemid==""){
             sql = "The product is not existing.";
        } else {
            sql = "Select * from inventory where id='"+itemid+"'";
        }
        
  
        
        resultSet = statement.executeQuery(sql);
        
    
%>

<!doctype html>
<html lang="en" data-bs-theme="auto">
  <head><script src="../assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.112.5">
    <title>New Order - MobiSoft - Your One-Stop Shop for Mobile Wonders</title>
	 <link rel="icon" type="image/x-icon" href="./img/favicon.png">

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/offcanvas-navbar/">

     <jsp:include page="menu.jsp" />

    

<main class="container">
  <div class="d-flex align-items-center p-3 my-3 text-white bg-purple rounded ">
    <img class="me-3" src="./img/order.png" alt="" width="48" height="48">
    <div class="lh-1">
      <h1 class="h3 mb-0 text-white lh-1"> NEW ORDER</h1>
      
    </div>
  </div>

  <% while(resultSet.next()){ %>
 <form name="frmNewProduct" action="neworder.jsp" method="post">
              <table>
		

                  <tr>
                  
                      <td> <input type="hidden" id="txtItemID" name="txtItemID" value="<%=resultSet.getString("id")%>"></td>
                  </tr>
				  
                  <tr>
                  
                      <td> <input type="hidden" id="txtUserID" name="txtUserID" value="<% out.println(session.getAttribute("userID")); %>"></td>
                  </tr>
                  <tr>
                      <td>Type</td>
                      <td>
					 
					  <input class="form-control" type="text" name="txtItemType" value="<%=resultSet.getString("type")%>"></td>
                 
				  </tr>
                  <tr>
                      <td>Make</td>
                      <td><input class="form-control" type="text" name="txtItemMake" value="<%=resultSet.getString("make")%>"></td>
                  </tr>
                  <tr>
                      <td>Model</td>
                      <td><input class="form-control" type="text" name="txtItemModel" value="<%=resultSet.getString("model")%>"></td>
                  </tr>
				  
				  
				    <tr>
                      <td>Quantity</td>
                      <td> <input class="form-control" type="number" id="txtItemQty" name="txtItemQty" value="1"></td>
                  </tr>
				    <tr>
                      <td>Price</td>
                      <td> <input class="form-control" type="text" id="txtItemPrice" name="txtItemPrice"  value="<%=resultSet.getString("price")%>" readonly></td>
                  </tr>
				  
				  
				 
                  <tr >
				  
                      
                      <td><br/><input class="btn btn-primary rounded-pill px-10" type="submit" value="Purchase"></td>
                  </tr>
              </table>
              </form>

	 <% } %>
  
  
 
            
            
         <div class="text-center">
SQL Query: <span class="badge bg-info-subtle text-info-emphasis rounded-pill"><%= sql %></span></div>

          <%
          } catch (Exception e){
            e.printStackTrace();
          }    
          %>
		  
</div>



  
  
   <jsp:include page="footer.jsp" />


	