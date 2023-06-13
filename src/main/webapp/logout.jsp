<%-- 
    Document   : logout
    Created on : 12-Apr-2023, 16:01:10
    Author     : abbasm7
--%>

<%
    session.invalidate();
    response.sendRedirect("index.jsp?msg=successfully logout");
%>
