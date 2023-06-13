<%@page import="java.sql.ResultSet"%>
<%@page import="com.solent.mavenproject2.Database"%>
<%@page import="com.solent.mavenproject2.User"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String msg = request.getParameter("msg");
	String userID = (String) session.getAttribute("userID");
    Database db = new Database();
    String sql = "SELECT * FROM orders WHERE userid = " + userID;
    ResultSet rs = db.executeSQL(sql);

    
%>
<!doctype html>
<html lang="en" data-bs-theme="auto">
  <head><script src="../assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.112.5">
    <title>Order History - MobiSoft - Your One-Stop Shop for Mobile Wonders</title>
	 <link rel="icon" type="image/x-icon" href="./img/favicon.png">

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/offcanvas-navbar/">

     <jsp:include page="menu.jsp" />

    

<main class="container">
 


 <div class="my-3 p-3 bg-body rounded shadow-sm">
   <h5 class="border-bottom pb-2 mb-0"><img src="./img/order.png" alt="" width="32" height="32"> Order History</h5>
  <% while (rs.next()) { %>
    <div class="d-flex text-body-secondary pt-3">
      <% String type = rs.getString("itemtype");
         if (type.equals("phone")) { %>
        <img src="./img/phone.png" height="32px" width="32px"> &nbsp;
      <% } else if (type.equals("accessory")) { %>
        <img src="./img/accessory.png" height="32px" width="32px"> &nbsp;
      <% } %>
      <div class="pb-3 mb-0 small lh-sm border-bottom w-100">
        <div class="d-flex justify-content-between">
          <strong class="text-gray-dark"><% out.println(rs.getString("itemname")); %> | Quantity: <%=rs.getString("qty") %> </strong>
          <a href="order.jsp?itemID=<%=rs.getString("id") %>">Order again</a>
        </div>
        <span class="d-block">Order Total: £<%=rs.getString("price") %></span>
      </div>
    </div>
  <% } %>
</div>

 <div class="text-center">
SQL Query: <span class="badge bg-info-subtle text-info-emphasis rounded-pill"><%= sql %></span></div>



  
  
   <jsp:include page="footer.jsp" />


	