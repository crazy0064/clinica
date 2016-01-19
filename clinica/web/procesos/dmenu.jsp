<%@page import="clases.conexion"%>
<%
    String id = request.getParameter("id");
    conexion con = new conexion();
   con.consulta("UPDATE menup SET estado=false WHERE idmenu='"+id+"';");
    response.sendRedirect("../administracion/listarmen.jsp");
%>