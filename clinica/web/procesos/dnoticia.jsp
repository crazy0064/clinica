<%@page import="clases.conexion"%>
<%
    String id = request.getParameter("id");
    conexion con = new conexion();
    con.consulta("UPDATE noticias SET estado=false WHERE id_noticia='" + id + "';");
    response.sendRedirect("../notificacion/lnoticias.jsp");
%>