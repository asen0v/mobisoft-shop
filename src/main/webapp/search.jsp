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
<html lang="en" data-bs-theme="auto">
  <head><script src="../assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.112.5">
    <title>Search - MobiSoft - Your One-Stop Shop for Mobile Wonders</title>
	 <link rel="icon" type="image/x-icon" href="./img/favicon.png">

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/offcanvas-navbar/">

     <jsp:include page="menu.jsp" />

    

<main class="container">
 <br/>

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
		
<div class="my-3 p-3 bg-body rounded shadow-sm">
   <h5 class="border-bottom pb-2 mb-0"><img src="./img/new-product.png" alt="" width="32" height="32"> Recent Products</h5>
  <% while(resultSet.next()){ %>
    <div class="d-flex text-body-secondary pt-3">
      <% String type = resultSet.getString("type");
         if (type.equals("phone")) { %>
        <img src="./img/phone.png" height="32px" width="32px"> &nbsp;
      <% } else if (type.equals("accessory")) { %>
        <img src="./img/accessory.png" height="32px" width="32px"> &nbsp;
      <% } %>
      <div class="pb-3 mb-0 small lh-sm border-bottom w-100">
        <div class="d-flex justify-content-between">
          <strong class="text-gray-dark"><%=resultSet.getString("make")%> - <%=resultSet.getString("model")%> </strong>
          <a href="order.jsp?itemID=<%=resultSet.getString("id") %>">Order</a>
        </div>
        <span class="d-block">£<%=resultSet.getString("price")%></span>
      </div>
   
   </div>
 
  
	
  <% } %>
  
</div>

 

  
 
            
            
         <div class="text-center">
SQL Query: <span class="badge bg-info-subtle text-info-emphasis rounded-pill"><%= sql %></span></div>

          <%
          } catch (Exception e){
            e.printStackTrace();
          }    
          %>
		  
</div>



  
  
   <jsp:include page="footer.jsp" />


	