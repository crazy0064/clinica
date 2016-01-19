<%@page import="java.util.Date"%>
<%@page import="clases.conexion"%>
<%
    Date actual=new Date();
    String id = request.getParameter("id");
    conexion con = new conexion();
   con.consulta("UPDATE notas SET estnota='false',estvisto='true',fecha='"+actual+"' WHERE idnota='"+id+"';");
    response.sendRedirect("../notificacion/notificaciones.jsp");
%>