<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="clases.conexion"%>
<%
    String id = request.getParameter("id");
    conexion con = new conexion();
    ResultSet rs = con.consulta("select * from citas where  estcita!='Aplicado' and idcita='" + id + "'");
    Date ver = new Date();
    Date actual = new Date();
    while (rs.next()) {
        ver = rs.getDate("fecha");
    }
    if (ver.before(actual)) {
        con.consulta("UPDATE citas SET estcita='Cancelado' WHERE idcita='" + id + "';");

    } else {
        out.print("<script>alert('No se puede Activar otra ves fecha caducada');</script>");
    }
    response.sendRedirect("../administracion/listarcitas.jsp");
%>