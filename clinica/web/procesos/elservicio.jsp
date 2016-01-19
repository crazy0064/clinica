<%@page import="clases.conexion"%>
<%
    String id = request.getParameter("id");
    String id1 = request.getParameter("ni");
    conexion con = new conexion();
    con.consulta("delete from servicios WHERE idservicio='" + id + "';");
    response.sendRedirect("../administracion/listarser.jsp");
%>