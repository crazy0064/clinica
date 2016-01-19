<%@page import="clases.conexion"%>
<%
    String id = request.getParameter("id");
    conexion con = new conexion();
   con.consulta("UPDATE servicios SET estservicio=true WHERE idservicio='"+id+"';");
    response.sendRedirect("../administracion/listarser.jsp");
%>