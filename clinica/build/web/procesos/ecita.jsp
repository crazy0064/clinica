<%@page import="clases.conexion"%>
<%
    String id = request.getParameter("id");
    conexion con = new conexion();
   con.consulta("delete from citas where idcita='"+id+"';");
    response.sendRedirect("../administracion/listarcitas.jsp");
%>