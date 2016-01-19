<%@page import="clases.conexion"%>
<%
    String id = request.getParameter("id");
    conexion con = new conexion();
   con.consulta("UPDATE submenus SET estado=true WHERE idsubmenu='"+id+"';");
    response.sendRedirect("../administracion/listarsubmen.jsp");
%>