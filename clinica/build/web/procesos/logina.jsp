<%@page import="java.sql.ResultSet"%>
<%@page import="clases.conexion"%>
<%
    ResultSet rs = null;
    HttpSession op = request.getSession();
    String conteo = "", usuario = "", clave = "", correo = "";
    usuario = request.getParameter("usuario");
    clave = request.getParameter("clave");
    conexion con = new conexion();
    rs = con.consulta("select count(*),p.* from personas p where correo='" + usuario + "'  and clave=md5('" + clave + "') and estpersona='true' and estactivo='true' group by p.dni");
    while (rs.next()) {
        conteo = rs.getString("count");
        correo = rs.getString("correo");
    }
    if (conteo.equals("1")) {
        out.println("<script>alert('Usuario Identificado Correctamente');</script>");
        out.println("<script language='javascript'>window.location='../administracion/panela.jsp'</script>;");
        op.setAttribute("varUsuario", correo);
        op.setAttribute("mover", "0");
        op.setAttribute("contener", "");
        op.setAttribute("temporal", "");
    } else {

        out.println("<script>alert('Datos Erroneos');</script>");
        out.println("<script language='javascript'>window.location='../administracion/logina.jsp'</script>;");
    }
%>
