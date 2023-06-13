<%@page import="com.solent.mavenproject2.Database" %>

<%
    Database db = new Database();

    String userID = request.getParameter("txtUserID");
    String itemID = request.getParameter("txtItemID");
    String itemType = request.getParameter("txtItemType");
    String itemMake = request.getParameter("txtItemMake");
    String itemModel = request.getParameter("txtItemModel");
	double itemQty = Double.parseDouble(request.getParameter("txtItemQty"));
	double itemPrice = Double.parseDouble(request.getParameter("txtItemPrice"));
		String itemName = itemMake + " " + itemModel;
		double finalPrice = itemQty * itemPrice;
    int i = 0; 
    String sql = "INSERT INTO orders (userid, itemid, itemtype, itemname, qty, price) VALUES ('"+userID+"', '"+itemID+"', '"+itemType+"', '"+itemName+"', '"+itemQty+"', '"+finalPrice+"')";
    out.println(sql);
    i = db.executeUpdate(sql);
	
    String sql2 = "UPDATE user SET uBank = uBank - " + finalPrice + " WHERE uId = " + userID;
	out.println(sql2);
    i = db.executeUpdate(sql2);
	
	String sql3 = "UPDATE inventory SET qty = qty - " + itemQty + " WHERE id = " + itemID;
	out.println(sql3);
    i = db.executeUpdate(sql3);
	
	response.sendRedirect("home.jsp?msg=Your order has been successful.");
%>
