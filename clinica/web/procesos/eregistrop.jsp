<%@page import="clases.conexion"%>
<%
    String id=request.getParameter("id");
    String id1=request.getParameter("ni");
    conexion con = new conexion();
    con.consulta("UPDATE personas SET estpersona=false WHERE dni='"+id+"';");
    response.sendRedirect("../administracion/listar.jsp?id="+id1+"");
%>