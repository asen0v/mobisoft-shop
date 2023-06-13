<%
    String carIDinput = request.getParameter("carId");
    
    String sql = "Delete from cars where carId="+carIDinput;
    
    out.println(sql);
    

%>