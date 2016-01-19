<%@page import="clases.conexion"%>
<%
    String id=request.getParameter("id");
    String id1=request.getParameter("ni");
    conexion con = new conexion();
    con.consulta("UPDATE especialidad SET estesp=false WHERE codesp='"+id+"';");
    response.sendRedirect("../administracion/listare.jsp");
%>