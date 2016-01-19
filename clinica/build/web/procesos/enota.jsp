<%@page import="clases.conexion"%>
<%
    String id = request.getParameter("id");
    conexion con = new conexion();
    con.consulta("delete from notas WHERE idnota='" + id + "';");
    response.sendRedirect("../notificacion/notificaciones.jsp");
%>