<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="clases.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    conexion con = new conexion();
    ResultSet rs = null;
    String nom = "", apel = "", foto = "", id = "", pri = "", idno = "";//variables de usuario
    String empresa = "";//variable de empresa
    String user = (String) session.getAttribute("varUsuario");//variable que contiene la sesion activa
    String url = request.getRequestURI();//varible que extrae url de pagina
    int acceso = 0;//varible de acceso a pagina
    if (user == null) {
        response.sendRedirect("../administracion/logina.jsp");
    } else {
        //DATOS DEL USUARIO
        rs = con.consulta("select * from personas where correo='" + user + "'");
        while (rs.next()) {
            id = rs.getString("dni");
            pri = rs.getString("tpersona");
            idno = rs.getString("dni");
            nom = rs.getString("nombres");
            apel = rs.getString("apellidos");
            foto = rs.getString("fotpersona");
        }
        //DATOS PARA CONTROLAR EN ACCESO A LA PAGINA
        rs = con.consulta("select count(*) from menup m,privilegios p where p.idmenu=m.idmenu and m.estado='true' and p.idperfil='" + pri + "' and p.estado='true' and m.referencia='" + url + "'");
        while (rs.next()) {
            acceso = rs.getInt("count");
        }
        if (acceso == 0) {
            out.print("<script>alert('No Tienes Privilegios para Acceder');</script>");
            out.println("<script language='javascript'>window.location='../administracion/panela.jsp'</script>;");
        }
        //DATOS DE LA EMPRESA
        rs = con.consulta("select * from empresa");
        while (rs.next()) {
            empresa = rs.getString("nombre");
        }
    }
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title><%out.print(empresa);%></title>
        <link href="../assets/css/bootstrap.css" rel="stylesheet">
        <link href="../assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="../assets/css/zabuto_calendar.css">
        <link rel="stylesheet" type="text/css" href="../assets/js/gritter/css/jquery.gritter.css" />
        <link rel="stylesheet" type="text/css" href="../assets/lineicons/style.css">   
        <link href="../assets/css/style.css" rel="stylesheet">
        <link href="../assets/css/style-responsive.css" rel="stylesheet">
        <script src="../assets/js/chart-master/Chart.js"></script>
        <script type="text/javascript" src="../js/validar.js"></script>
        <script language='JavaScript'>
            var cont = 0;
            function addRowX()  //Esta la funcion que agrega las filas :
            {
                cont = ncita.horas.value;
                cont++;
                ncita.horas.value = cont;
                var indiceFila = 1;
                myNewRow = document.getElementById('tabla').insertRow(-1);
                myNewRow.id = indiceFila;
                myNewCell = myNewRow.insertCell(-1);
                myNewCell.innerHTML = '<td><input type="text" value="00:00" required size="5" name="hora_' + cont + '" /></td>';
                myNewCell = myNewRow.insertCell(-1);
                myNewCell.innerHTML = '<td><input type="checkbox"  name="lunes_' + cont + '" /></td>';

                myNewCell = myNewRow.insertCell(-1);
                myNewCell.innerHTML = '<input type="checkbox"   name="martes_' + cont + '"/>';
                myNewCell = myNewRow.insertCell(-1);
                myNewCell.innerHTML = '<input type="checkbox"   name="miercoles_' + cont + '"/>';

                myNewCell = myNewRow.insertCell(-1);
                myNewCell.innerHTML = '<input type="checkbox"  name="jueves_' + cont + '">';

                myNewCell = myNewRow.insertCell(-1);
                myNewCell.innerHTML = '<input type="checkbox"  name="viernes_' + cont + '">';
                myNewCell = myNewRow.insertCell(-1);
                myNewCell.innerHTML = '<input type="checkbox"  name="sabado_' + cont + '">';
                myNewCell = myNewRow.insertCell(-1);
                myNewCell.innerHTML = '<input type="checkbox"  name="domingo_' + cont + '">';
                indiceFila++;

            }
            //////////////Borrar() ///////////
            function borrar() {
                var table = document.getElementById('tabla');
                if (table.rows.length > 2)
                {
                    table.deleteRow(table.rows.length - 1);
                    cont = ncita.horas.value;
                    cont--;
                    ncita.horas.value = cont;

                }
            }
        </script>
    </head>

   <body>

        <section id="container" >
            <!--cabecera inicio-->
            <header class="header black-bg">
                <div class="sidebar-toggle-box">
                    <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Menú de deslizamiento"></div>
                </div>
                <a href="#" class="logo"><b><%out.print(empresa);%></b></a>
                <div class="nav notify-row" id="top_menu">
                    <!--  inicio de notificaciones -->
                    <ul class="nav top-menu">
                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <i class="fa fa-tasks"></i>
                                <%rs = con.consulta("select count(*) from notas where estnota='true' and estvisto='false' and idpersona='" + idno + "'");
                                    while (rs.next()) {
                                %>
                                <span class="badge bg-theme"><%out.print(rs.getString("count"));%></span>
                            </a>
                            <ul class="dropdown-menu extended tasks-bar">
                                <div class="notify-arrow notify-arrow-green"></div>
                                <li>

                                    <p class="green">Tiene <%out.print(rs.getString("count"));%> Notificaciones</p>
                                    <%}%>
                                </li>
                                <li>
                                    <%rs = con.consulta("select * from notas where estnota='true' and estvisto='false' and idpersona='" + idno + "' order by idnota desc limit 5");
                                        while (rs.next()) {
                                    %>
                                    <a href="../notificacion/nota.jsp?id=<%out.print(rs.getString("idnota"));%>">
                                        <div class='task-info'>
                                            <div class="desc">Notidicacion <%out.print(rs.getString("idnota"));%></div>
                                            <h7 class="green"><%out.print(rs.getString("asunto"));%></h7>

                                        </div>
                                    </a>
                                    <%}%>  
                                </li>
                                <li class="external">
                                    <a href="../notificacion/notificaciones.jsp">Mostrar las Demas</a>
                                </li>
                            </ul>
                        </li>
                        <!-- Fin de notificaciones -->
                        <!-- inicio de mensajes-->
                        <li id="header_inbox_bar" class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                                <i class="fa fa-envelope-o"></i>
                                <%
                                    Date actual = new Date();
                                    rs = con.consulta("select count(*) from noticias where estado='true' and fecha='" + actual + "'");
                                    while (rs.next()) {
                                %>
                                <span class="badge bg-theme"><%out.print(rs.getString("count"));%></span>
                            </a>
                            <ul class="dropdown-menu extended inbox">
                                <div class="notify-arrow notify-arrow-green"></div>
                                <li>
                                    <p class="green">Tiene <%out.print(rs.getString("count"));%> noticias actuales</p>
                                </li>
                                <%}%>
                                <li>
                                    <%
                                        rs = con.consulta("select * from noticias where estado='true' and fecha='" + actual + "' limit 5");
                                        while (rs.next()) {
                                    %>
                                    <a href="../notificacion/noticia.jsp?id=<%out.print(rs.getString("id_noticia"));%>">
                                        <span class="photo"><img  src="..<%out.print(rs.getString("imagen"));%>"></span>
                                        <span class="subject">
                                            <span class="from"><%out.print(rs.getString("titulo").substring(0, 28));%></span>

                                        </span>
                                        <span class="message">
                                            <%out.print(rs.getString("encabezado").substring(0, 33));%>
                                        </span>
                                        <span class="time">Leer Noticia</span>
                                    </a>
                                    <%}%>
                                </li>
                                <li>
                                    <a href="../notificacion/noticias.jsp">Mostrar las demas noticias</a>
                                </li>
                            </ul>
                        </li>
                        <!-- fin de mensajes -->
                    </ul>
                </div>
                <div class="top-menu">
                    <ul class="nav pull-right top-menu">
                        <li><a class="logout" href="../procesos/cerrar.jsp">Salir del Sistema</a></li>
                    </ul>
                </div>
            </header>
            <!--fin de cabecera-->


            <!--Informacion del usuario y menu-->
            <aside>
                <div id="sidebar"  class="nav-collapse ">
                    <ul class="sidebar-menu" id="nav-accordion">

                        <p class="centered"><a href="../administracion/foto.jsp"><img src="..<% out.print(foto); %>" class="img-circle" width="60"></a></p>
                        <h5 class="centered"><% out.print(nom + " " + apel);%></h5>
                        <%
                            ResultSet me = con.consulta("select * from menup m,privilegios p where p.idmenu=m.idmenu and m.estado='true' and m.relacion='0' and m.visible='true' and p.idperfil='" + pri + "' and p.estado='true'");
                            while (me.next()) {
                                out.print(" <li class='sub-menu'>");
                                out.print("<a href='" + me.getString("referencia") + "' >");
                                out.print("<i class='" + me.getString("clase") + "'></i>");
                                out.print("<span>" + me.getString("nombre") + "</span>");
                                out.print(" </a>");
                                ResultSet mes = con.consulta("select * from menup m,privilegios p where p.idmenu=m.idmenu and m.estado='true' and m.relacion='" + me.getString("idmenu") + "' and m.visible='true' and p.idperfil='" + pri + "' and p.estado='true'");
                                while (mes.next()) {
                                    out.print(" <ul class='sub'>");
                                    out.print(" <li><a  href='" + mes.getString("referencia") + "'>" + mes.getString("nombre") + "</a></li>");
                                    out.print(" </ul>");
                                }
                                out.print("</li>");
                            }
                        %>
                    </ul>
                </div>
            </aside>
            <!--fin de usuario y menu-->
            
            <!--inicio de contenido-->
            <section id="main-content">
                <section class="wrapper">
                    <center><h4><i class="fa fa-refresh"></i>Generando Horario de Trabajo</h4></center>
                    <div class="row mt">

                        <div class="col-lg-12">
                            <div class="form-panel">

                                <div class="form-group">


                                    <input type="button" class="btn btn-default btn-lg btn-block" name="btnmas" id="btnmas" value="Agregar Hora" onClick="addRowX()">
                                    <input type="button" class="btn btn-default btn-lg btn-block" name="btnmenos" id="btnmenos" value="Eliminar Hora" onClick="borrar()">

                                    <%
                                        if (request.getParameter("btnenviar") != null) {
                                            String dias[] = {"lunes", "martes", "miercoles", "jueves", "viernes", "sabado", "domingo"};
                                            int fil = Integer.parseInt(request.getParameter("horas"));
                                            for (int i = 1; i <= fil; i++) {
                                                String hora = request.getParameter("hora_" + i);
                                                String l = request.getParameter(dias[0] + "_" + i);
                                                if (l != null) {
                                                    l = "true";
                                                } else {
                                                    l = "false";
                                                }
                                                String m = request.getParameter(dias[1] + "_" + i);
                                                if (m != null) {
                                                    m = "true";
                                                } else {
                                                    m = "false";
                                                }
                                                String mi = request.getParameter(dias[2] + "_" + i);
                                                if (mi != null) {
                                                    mi = "true";
                                                } else {
                                                    mi = "false";
                                                }
                                                String ju = request.getParameter(dias[3] + "_" + i);
                                                if (ju != null) {
                                                    ju = "true";
                                                } else {
                                                    ju = "false";
                                                }
                                                String v = request.getParameter(dias[4] + "_" + i);
                                                if (v != null) {
                                                    v = "true";
                                                } else {
                                                    v = "false";
                                                }
                                                String s = request.getParameter(dias[5] + "_" + i);
                                                if (s != null) {
                                                    s = "true";
                                                } else {
                                                    s = "false";
                                                }
                                                String d = request.getParameter(dias[6] + "_" + i);
                                                if (d != null) {
                                                    d = "true";
                                                } else {
                                                    d = "false";
                                                }
                                                con.consulta("INSERT INTO horarios( horahor, iddoctor, lunes, martes, miercoles, jueves,viernes, sabado, domingo)    VALUES ( '" + hora + "', '" + id + "', '" + l + "', '" + m + "', '" + mi + "', '" + ju + "',  '" + v + "', '" + s + "','" + d + "');");

                                            }
                                        }
                                    %>



                                    <%
                                        rs = con.consulta("select count(*) from horarios where iddoctor='" + id + "'");
                                        String conte = "";
                                        while (rs.next()) {
                                            conte = rs.getString("count");
                                        }
                                        if (!conte.equals("0")) {
                                            out.print("  <form id='ncita' name='ncita' action='' method='POST'>");
                                            out.print("   <table class='table table-striped table-advance table-hover' id='tabla'>");
                                            out.print("    <tbody>");
                                            out.print("       <tr>");
                                            out.print("       <th colspan='9' scope='col'><center><h><i class='fa fa-refresh'></i>Mostrando Horario Generado <input type='text' value='" + conte + "' name='horas' id='horas' size='1'></h5></center></th>");
                                            out.print("    </tr>");
                                            out.print("     <tr>");

                                            out.print("        <th scope='col'>Hora </th>");
                                            out.print("        <th scope='col'>Lunes </th>");
                                            out.print("       <th scope='col'>Martes</th>");
                                            out.print("        <th scope='col'>Miercoles</th>");
                                            out.print("       <th scope='col'>Jueves</th>");
                                            out.print("       <th scope='col'>Viernes</th>");
                                            out.print("       <th scope='col'>Sabado</th>");
                                            out.print("       <th scope='col'>Domingo</th>");
                                            out.print("    </tr>");
                                            rs = con.consulta("select * from horarios h where iddoctor='" + id + "'");
                                            int subir = 0;
                                            while (rs.next()) {
                                                subir++;
                                                out.print("    <tr>");

                                                out.print(" <td><input type='text'  size='5' required name='hora_" + subir + "' value='" + rs.getString("horahor") + "'/></td>");
                                                if (rs.getString("lunes").equals("t")) {
                                                    out.print("<td><input checked='checked' type='checkbox'  name='lunes_" + subir + "' /></td>");

                                                } else {
                                                    out.print("<td><input type='checkbox' name='lunes_" + subir + "' /></td>");

                                                }
                                                if (rs.getString("martes").equals("t")) {
                                                    out.print("<td><input checked='checked' type='checkbox' name='martes_" + subir + "'/></td>");

                                                } else {
                                                    out.print("<td><input type='checkbox' name='martes_" + subir + "'/></td>");

                                                }
                                                if (rs.getString("miercoles").equals("t")) {
                                                    out.print("<td> <input checked='checked' type='checkbox' name='miercoles_" + subir + "'/></td>");
                                                } else {
                                                    out.print("<td> <input type='checkbox'  name='miercoles_" + subir + "'/></td>");

                                                }
                                                if (rs.getString("jueves").equals("t")) {
                                                    out.print("<td> <input checked='checked' type='checkbox' name='jueves_" + subir + "'></td>");

                                                } else {
                                                    out.print("<td> <input type='checkbox' name='jueves_" + subir + "'></td>");

                                                }
                                                if (rs.getString("viernes").equals("t")) {
                                                    out.print(" <td> <input checked='checked' type='checkbox' name='viernes_" + subir + "'></td>");

                                                } else {
                                                    out.print(" <td> <input type='checkbox' name='viernes_" + subir + "'></td>");

                                                }
                                                if (rs.getString("sabado").equals("t")) {
                                                    out.print(" <td><input checked='checked'  type='checkbox' name='sabado_" + subir + "'></td>");

                                                } else {
                                                    out.print(" <td><input type='checkbox' name='sabado_" + subir + "'></td>");

                                                }
                                                if (rs.getString("domingo").equals("t")) {
                                                    out.print("<td> <input checked='checked' type='checkbox' name='domingo_" + subir + "'></td>");

                                                } else {
                                                    out.print("<td> <input type='checkbox' name='domingo_" + subir + "'></td>");

                                                }
                                                out.print("    </tr>");
                                            }
                                            out.print("  </tbody>");
                                            out.print("     </table>");
                                            out.print("   <input type='submit' class='btn btn-default btn-lg btn-block' name='actualiza' id='actualiza' value='Actualizar horario'>");

                                            out.print("  </form>");
                                        } else {
                                    %>

                                    <form id="ncita" name="ncita" action="horario.jsp" method="POST">

                                        <table  class="table table-striped table-advance table-hover" id="tabla">
                                            <tbody>
                                                <tr>
                                                    <th colspan="8" scope="col"><center><h5><i class="fa fa-refresh"></i>Mostrando Horario Generado <input type="text" value="0" name="horas" id="horas" size="1"></h5></center></th>
                                                </tr>
                                                <tr>
                                                    <th>Hora </th>
                                                    <th>Lunes </th>
                                                    <th>Martes</th>
                                                    <th>Miercoles</th>
                                                    <th>Jueves</th>
                                                    <th>Viernes</th>
                                                    <th>Sabado</th>
                                                    <th>Domingo</th>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <input type="submit" class="btn btn-default btn-lg btn-block" name="btnenviar" id="btnenviar" value="Guardar Horario">
                                    </form>
                                    <%
                                        }

                                    %>
                                    <%    if (request.getParameter("actualiza") != null) {
                                            con.consulta("delete from horarios where iddoctor='" + id + "'");
                                            String dias[] = {"lunes", "martes", "miercoles", "jueves", "viernes", "sabado", "domingo"};
                                            int fil = Integer.parseInt(request.getParameter("horas"));
                                            for (int i = 1; i <= fil; i++) {
                                                String hora = request.getParameter("hora_" + i);
                                                String l = request.getParameter(dias[0] + "_" + i);
                                                if (l != null) {
                                                    l = "true";
                                                } else {
                                                    l = "false";
                                                }
                                                String m = request.getParameter(dias[1] + "_" + i);
                                                if (m != null) {
                                                    m = "true";
                                                } else {
                                                    m = "false";
                                                }
                                                String mi = request.getParameter(dias[2] + "_" + i);
                                                if (mi != null) {
                                                    mi = "true";
                                                } else {
                                                    mi = "false";
                                                }
                                                String ju = request.getParameter(dias[3] + "_" + i);
                                                if (ju != null) {
                                                    ju = "true";
                                                } else {
                                                    ju = "false";
                                                }
                                                String v = request.getParameter(dias[4] + "_" + i);
                                                if (v != null) {
                                                    v = "true";
                                                } else {
                                                    v = "false";
                                                }
                                                String s = request.getParameter(dias[5] + "_" + i);
                                                if (s != null) {
                                                    s = "true";
                                                } else {
                                                    s = "false";
                                                }
                                                String d = request.getParameter(dias[6] + "_" + i);
                                                if (d != null) {
                                                    d = "true";
                                                } else {
                                                    d = "false";
                                                }
                                                con.consulta("INSERT INTO horarios( horahor, iddoctor, lunes, martes, miercoles, jueves,viernes, sabado, domingo)    VALUES ( '" + hora + "', '" + id + "', '" + l + "', '" + m + "', '" + mi + "', '" + ju + "',  '" + v + "', '" + s + "','" + d + "');");

                                            }
                                            out.println("<script language='javascript'>window.location='../administracion/horario.jsp'</script>;");

                                        }
                                    %>



                                </div>
                            </div>
                        </div>  
                </section>
            </section>

        </section>

        <!-- Plugin utilizados a iniciar -->
        <script src="../assets/js/jquery.js"></script>
        <script src="../assets/js/jquery-1.8.3.min.js"></script>
        <script src="../assets/js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="../assets/js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="../assets/js/jquery.scrollTo.min.js"></script>
        <script src="../assets/js/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="../assets/js/jquery.sparkline.js"></script>
        <script src="../assets/js/common-scripts.js"></script>
        <script type="text/javascript" src="../assets/js/gritter/js/jquery.gritter.js"></script>
        <script type="text/javascript" src="../assets/js/gritter-conf.js"></script>
        <script src="../assets/js/sparkline-chart.js"></script>    
        <script src="../assets/js/zabuto_calendar.js"></script>	
    </body>
</html>
