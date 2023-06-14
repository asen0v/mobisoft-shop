    
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
    
        
        resultSet = statement.executeQuery(sql);
        
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en" data-bs-theme="auto">
  <head><script src="../assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.112.5">
    <title>Edit Profile - MobiSoft - Your One-Stop Shop for Mobile Wonders</title>
	 <link rel="icon" type="image/x-icon" href="./img/favicon.png">

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/offcanvas-navbar/">

     <jsp:include page="menu.jsp" />

    

<main class="container">
  <div class="d-flex align-items-center p-3 my-3 text-white bg-purple rounded ">
    <img class="me-3" src="./img/profile.png" alt="" width="48" height="48">
    <div class="lh-1">
      <h1 class="h3 mb-0 text-white lh-1"> Edit Profile</h1>
      
    </div>
  </div>
         
		     <% while(resultSet.next()){ %>
		
          <div class="table-responsive">
		  
		   <form name="frmEditProfile" action="edit-profile.jsp" method="post">
              <table>
			
                  <tr>
                      <td>Name</td>
                      <td><input class="form-control" type="text" name="txtTitle" value="<%=resultSet.getString("uTitle")%>"/></td>
                  </tr>
                  <tr>
                      <td>Username</td>
                      <td><input class="form-control" type="text" name="txtName" value="<%=resultSet.getString("uName")%>"/></td>
                  </tr>
				   <tr>
                      <td>Password</td>
                      <td><input class="form-control" type="password" name="txtPass" value="<%=resultSet.getString("uPass")%>"/></td>
                  </tr>
                 
                  <tr>
                      
                      <td><input class="btn btn-primary rounded-pill px-10" type="submit" value="Edit Profile"></td>
                  </tr>
              </table>
              </form>
		  
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


	