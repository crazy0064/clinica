<%@page import="clases.conexion"%>
<%
    String id = request.getParameter("id");
    conexion con = new conexion();
   con.consulta("delete from submenus WHERE idsubmenu='"+id+"';");
    response.sendRedirect("../administracion/listarsubmen.jsp");
%>