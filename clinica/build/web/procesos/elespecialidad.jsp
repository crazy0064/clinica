<%@page import="clases.conexion"%>
<%
    String id = request.getParameter("id");
    String id1 = request.getParameter("ni");
    conexion con = new conexion();
    con.consulta("delete from especialidad WHERE codesp='" + id + "';");
    response.sendRedirect("../administracion/listare.jsp");
%>