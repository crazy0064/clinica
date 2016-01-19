<%@page import="clases.conexion"%>
<%
    String id = request.getParameter("id");
    conexion con = new conexion();
   con.consulta("delete from menup WHERE idmenu='"+id+"';");
    response.sendRedirect("../administracion/listarmen.jsp");
%>