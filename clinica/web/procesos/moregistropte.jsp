<%@page import="clases.conexion"%>
<%
    String nivel = (String) session.getAttribute("nivel");
    conexion con = new conexion();
    String id = request.getParameter("id");
    String id1 = request.getParameter("ni");
    String nombre = request.getParameter("nombres");
    String especialidad = request.getParameter("especialidad");

    String apellido = request.getParameter("apellidos");
    String telefono = request.getParameter("telefono");
    String celular = request.getParameter("celular");
    String direccion = request.getParameter("direccion");
    String sexo = request.getParameter("sexo");
    String fecha = request.getParameter("year") + "-" + request.getParameter("month") + "-" + request.getParameter("day");
    con.consulta("UPDATE personas SET nombres='" + nombre + "', apellidos='" + apellido + "', telefono='" + telefono + "',celular='" + celular + "', direccion='" + direccion + "', fnacimiento='" + fecha + "', sexo='" + sexo + "' WHERE dni='" + id + "';");
    con.consulta("update doctores set espdoctor='especialidad' where dnidoctor='"+id+"'");
    response.sendRedirect("../administracion/listares.jsp?id=" + id1 + "");
%>