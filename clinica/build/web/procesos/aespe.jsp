<%@page import="clases.conexion"%>
<%
    String id = request.getParameter("id");
    String idc = request.getParameter("idc");
    conexion con = new conexion();
   con.consulta("UPDATE doctores SET estdoctor=true WHERE iddoctor='"+id+"';");
    response.sendRedirect("../administracion/listaresp.jsp?id="+idc+"");
%>