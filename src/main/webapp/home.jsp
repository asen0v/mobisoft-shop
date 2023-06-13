<%@page import="java.sql.ResultSet"%>
<%@page import="com.solent.mavenproject2.Database"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String msg = request.getParameter("msg");
    Database db = new Database();
    String sql = "SELECT * FROM inventory LIMIT 10";
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
    <title>MobiSoft - Your One-Stop Shop for Mobile Wonders</title>
	 <link rel="icon" type="image/x-icon" href="./img/favicon.png">

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/offcanvas-navbar/">

     <jsp:include page="menu.jsp" />

    

<main class="container">
  <div class="d-flex align-items-center p-3 my-3 text-white bg-purple rounded shadow-sm">
    <img class="me-3" src="./img/hello.png" alt="" width="48" height="48">
    <div class="lh-1">
      <h1 class="h6 mb-0 text-white lh-1">Welcome, <u><%
            out.println(session.getAttribute("userTitle"));
      %>!</u></h1>
      <small>   
         MobiSoft is your gateway to a world of limitless possibilities. From the latest smartphones to cutting-edge accessories, we offer everything you need to elevate your mobile experience and unlock a world of wonders at your fingertips!
 </small>
    </div>
  </div>


 <div class="my-3 p-3 bg-body rounded shadow-sm">
   <h5 class="border-bottom pb-2 mb-0"><img src="./img/new-product.png" alt="" width="32" height="32"> Recent Products</h5>
  <% while (rs.next()) { %>
    <div class="d-flex text-body-secondary pt-3">
      <% String type = rs.getString("type");
         if (type.equals("phone")) { %>
        <img src="./img/phone.png" height="32px" width="32px"> &nbsp;
      <% } else if (type.equals("accessory")) { %>
        <img src="./img/accessory.png" height="32px" width="32px"> &nbsp;
      <% } %>
      <div class="pb-3 mb-0 small lh-sm border-bottom w-100">
        <div class="d-flex justify-content-between">
          <strong class="text-gray-dark"><% out.println(rs.getString("make")); %> - <%=rs.getString("model") %> </strong>
          <a href="order.jsp?itemID=<%=rs.getString("id") %>">Order</a>
        </div>
        <span class="d-block">£<%=rs.getString("price") %></span>
      </div>
    </div>
  <% } %>
</div>


  
  
   <jsp:include page="footer.jsp" />


	