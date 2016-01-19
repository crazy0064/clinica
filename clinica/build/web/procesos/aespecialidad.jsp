<%@page import="clases.conexion"%>
<%
    String id = request.getParameter("id");
    conexion con = new conexion();
    con.consulta("UPDATE especialidad SET estesp=true WHERE codesp='" + id + "';");
    response.sendRedirect("../administracion/listare.jsp");
%>