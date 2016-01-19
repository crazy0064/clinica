<%
    session.invalidate();
    out.println("<script>alert('cerrando sesion')</script>");
    response.sendRedirect("../administracion/logina.jsp");
%>

