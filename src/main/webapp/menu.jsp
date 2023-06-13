<%@page import="java.sql.ResultSet"%>
<%@page import="com.solent.mavenproject2.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="./css/styles.css" rel="stylesheet">
 <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        width: 100%;
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }

      .btn-bd-primary {
        --bd-violet-bg: #712cf9;
        --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

        --bs-btn-font-weight: 600;
        --bs-btn-color: var(--bs-white);
        --bs-btn-bg: var(--bd-violet-bg);
        --bs-btn-border-color: var(--bd-violet-bg);
        --bs-btn-hover-color: var(--bs-white);
        --bs-btn-hover-bg: #6528e0;
        --bs-btn-hover-border-color: #6528e0;
        --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
        --bs-btn-active-color: var(--bs-btn-hover-color);
        --bs-btn-active-bg: #5a23c8;
        --bs-btn-active-border-color: #5a23c8;
      }
      .bd-mode-toggle {
        z-index: 1500;
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="offcanvas-navbar.css" rel="stylesheet">
  </head>
  <body class="bg-body-tertiary">
  
   
<%
 

  Database db = new Database();
    String countSql = "SELECT COUNT(*) AS total FROM inventory";
    ResultSet countRs = db.executeSQL(countSql);
    int totalCount = 0;
    if (countRs.next()) {
        totalCount = countRs.getInt("total");
    }
	
	String countSql1 = "SELECT COUNT(*) AS total FROM user";
    ResultSet countRs1 = db.executeSQL(countSql1);
    int totalUserCount = 0;
    if (countRs1.next()) {
        totalUserCount = countRs1.getInt("total");
    }
	
	    String countSql2 = "SELECT COUNT(*) AS total FROM inventory WHERE price<=50";
    ResultSet countRs2 = db.executeSQL(countSql2);
    int totalUnder50 = 0;
    if (countRs2.next()) {
        totalUnder50 = countRs2.getInt("total");
    }
	
	
	String countSql3 = "SELECT COUNT(*) AS total FROM inventory WHERE price>=500";
    ResultSet countRs3 = db.executeSQL(countSql3);
    int totalOver500 = 0;
    if (countRs3.next()) {
        totalOver500 = countRs3.getInt("total");
    }
	
	String countSql4 = "SELECT COUNT(*) AS total FROM inventory WHERE type='phone'";
    ResultSet countRs4 = db.executeSQL(countSql4);
    int totalPhones = 0;
    if (countRs4.next()) {
        totalPhones = countRs4.getInt("total");
    }
	
	String countSql5 = "SELECT COUNT(*) AS total FROM inventory WHERE type='accessory'";
    ResultSet countRs5 = db.executeSQL(countSql5);
    int totalAccs = 0;
    if (countRs5.next()) {
        totalAccs = countRs5.getInt("total");
    }
	
	String countSql6 = "SELECT COUNT(*) AS total FROM orders";
    ResultSet countRs6 = db.executeSQL(countSql6);
    int totalOrders = 0;
    if (countRs6.next()) {
        totalOrders = countRs6.getInt("total");
    }
	
	String userID = (String) session.getAttribute("userID");
    String sql = "SELECT uBank FROM user WHERE uId = " + userID;
    ResultSet rs = db.executeSQL(sql);
	int bank = 0;
    if (rs.next()) {
        bank = rs.getInt("uBank");
    }
	
	%>
    
<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark" aria-label="Main navigation">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">MobiSoft</a>
  

    <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="search.jsp">Search</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="profile.jsp?uId=<%= userID %>">Profile</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="order-history.jsp">Order History</a>
        </li>
		
      </ul>
      <span style="color: white;">Hello, <u><%
            out.println(session.getAttribute("userTitle"));
      %></u> |  Bank: £<%= bank
      %>  | &nbsp;</span><a class="nav-link" href="logout.jsp"><img src="img/logout.png" width="24px" height="24px" alt="Logout" title="Logout"/></a>
    </div>
  </div>
</nav>

<div class="nav-scroller bg-body shadow-sm">
  <nav class="nav" aria-label="Secondary navigation">
    <a class="nav-link active" aria-current="page" href="#">Statistics</a>
	<a class="nav-link" href="#"> | </a>
    <a class="nav-link" href="#">
      Products
      <span class="badge text-bg-light rounded-pill align-text-bottom"><%= totalCount %></span>
    </a>
	<a class="nav-link" href="#">
      Phones
      <span class="badge text-bg-light rounded-pill align-text-bottom"><%= totalPhones %></span>
    </a>
	<a class="nav-link" href="#">
      Accessories
      <span class="badge text-bg-light rounded-pill align-text-bottom"><%= totalAccs %></span>
    </a>
    <a class="nav-link" href="#">
      Users
      <span class="badge text-bg-light rounded-pill align-text-bottom"><%= totalUserCount %></span>
    </a>
    <a class="nav-link" href="#">
      Under <&#163;50
      <span class="badge text-bg-light rounded-pill align-text-bottom"><%= totalUnder50 %></span>
    </a>
	    <a class="nav-link" href="#">
      Over >&#163;500
      <span class="badge text-bg-light rounded-pill align-text-bottom"><%= totalOver500 %></span>
    </a>
	<a class="nav-link" href="#">
      Orders
      <span class="badge text-bg-light rounded-pill align-text-bottom"><%= totalOrders %></span>
    </a>
  </nav>
</div>