<%@page import="clases.conexion"%>
<%
    String id = request.getParameter("id");
    conexion con = new conexion();
   con.consulta("UPDATE perfiles SET estado=true WHERE idperfil='"+id+"';");
    response.sendRedirect("../administracion/perfiles.jsp");
%>