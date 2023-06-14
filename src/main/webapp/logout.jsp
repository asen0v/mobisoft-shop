

<%
    session.invalidate();
    response.sendRedirect("index.jsp?msg=successfully logout");
%>
