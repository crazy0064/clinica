<%@page import="clases.conexion"%>
<%
    String id = request.getParameter("id");
    conexion con = new conexion();
   con.consulta("UPDATE submenus SET estado=false WHERE idsubmenu='"+id+"';");
    response.sendRedirect("../administracion/listarsubmen.jsp");
%>