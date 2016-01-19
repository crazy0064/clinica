<%@page import="clases.conexion"%>
<%
    String id=request.getParameter("id");
    String id1=request.getParameter("ni");
    conexion con = new conexion();
    con.consulta("UPDATE servicios SET estservicio=false WHERE idservicio='"+id+"';");
    response.sendRedirect("../administracion/listarser.jsp");
%>