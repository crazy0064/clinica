<%@page import="clases.conexion"%>
<%
    String id = request.getParameter("id");
    conexion con = new conexion();
   con.consulta("delete from perfiles WHERE idperfil='"+id+"';");
    response.sendRedirect("../administracion/perfiles.jsp");
%>