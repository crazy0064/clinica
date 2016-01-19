<%@page import="clases.conexion"%>
<%
    String id = request.getParameter("id");
    String id1 = request.getParameter("ni");
    conexion con = new conexion();
    con.consulta("delete from personas WHERE dni='" + id + "';");
    response.sendRedirect("../administracion/listar.jsp?id=" + id1 + "");
%>