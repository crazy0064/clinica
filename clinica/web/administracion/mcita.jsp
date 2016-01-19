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
        id = request.getParameter("id");
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
                    <center><h4><i class="fa fa-refresh"></i>Modificando Registro</h4></center>
                    <div class="row mt">

                        <div class="col-lg-12">
                            <div class="form-panel">
                                <%
                                    rs = con.consulta("select * from citas where idcita='" + id + "'");
                                    while (rs.next()) {
                                %>
                                <form  id="mcita" name="mcita" action="" method="POST">
                                    <div class="form-group">
                                        <input type="text" value="<% out.print(rs.getString("asunto")); %>" required class="form-control" id="asunto" name="asunto" placeholder="Asunto">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" value="<% out.print(rs.getString("medico")); %>" required class="form-control" id="especialista" name="especialista" placeholder="Especialista">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" value="<% out.print(rs.getString("paciente")); %>" required class="form-control" id="paciente" name="paciente" placeholder="Paciente">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" value="<% out.print(rs.getString("fecha")); %>" required class="form-control" id="fecha" name="fecha" placeholder="Fecha">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" value="<% out.print(rs.getString("hora")); %>" required class="form-control" id="hora" name="hora" placeholder="Hora ">
                                    </div>
                                    <div class="form-group">
                                        <input type="text"  value="<% out.print(rs.getString("notas")); %>"required class="form-control" id="nota" name="nota" placeholder="Notas">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" value="<% out.print(rs.getString("enfermedad")); %>" required class="form-control" id="enfermedad" name="enfermedad" placeholder="Enfermedad encontrada">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" value="<% out.print(rs.getString("sintomas")); %>" required class="form-control" id="sintomas" name="sintomas" placeholder="Sintomas encontrados">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" value="<% out.print(rs.getString("medicamentos")); %>" required class="form-control" id="medicamentos" name="medicamentos" placeholder="Medicamentos recetados">
                                    </div>
                                    <div class="form-group">
                                        <center><label class="form-control">Estado de Asistencia del paciente</label></center>
                                        <select name="estcita" class="form-control" id="estcita" >
                                            <option value="<% out.print(rs.getString("estcita")); %>"><% out.print(rs.getString("estcita")); %></option>
                                            <option value="Pendiente">Pendiente</option>
                                            <option value="Aplicada">Aplicada</option>
                                            <option value="No asistio">No asistio</option>
                                            <option value="Cancelado">Cancelado</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <center><label class="form-control">Estado del pago de cita</label></center>
                                        <select name="estpago" class="form-control" id="estpago" >
                                            <option value="<% out.print(rs.getString("estpago")); %>"><% out.print(rs.getString("estpago")); %></option>
                                            <option value="Pendiente">Pendiente</option>
                                            <option value="Pagado">Pagado</option>
                                            <option value="Anulado">Anulado</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" value="<% out.print(rs.getString("costo")); %>" class="form-control" id="costo" name="costo" placeholder="Precio de cita">
                                    </div>
                                    <button type="submit" class="btn btn-default btn-green" id="enviar" name="enviar">Registrar cita</button>
                                </form>
                                <%}%>
                                <%
                                    if (request.getParameter("enviar") != null) {
                                        String asunto = request.getParameter("asunto");
                                        String especialista = request.getParameter("especialista");
                                        String paciente = request.getParameter("paciente");
                                        String fecha = request.getParameter("fecha");
                                        String hora = request.getParameter("hora");
                                        String nota = request.getParameter("nota");
                                        String enfermedad = request.getParameter("enfermedad");
                                        String sintomas = request.getParameter("sintomas");
                                        String medicamentos = request.getParameter("medicamentos");
                                        String estcita = request.getParameter("estcita");
                                        String estpago = request.getParameter("estpago");
                                        String costo = request.getParameter("costo");
                                        con.consulta("UPDATE citas   SET  asunto='" + asunto + "', paciente='" + paciente + "', medico='" + especialista + "', fecha='" + fecha + "', hora='" + hora + "', notas='" + nota + "',        enfermedad='" + enfermedad + "', sintomas='" + sintomas + "', medicamentos='" + medicamentos + "', estcita='" + estcita + "', estpago='" + estpago + "',        costo=" + costo + " WHERE idcita='" + id + "';");
                                        out.print("<script>alert('Registro Actualizado');</script>");
                                        out.println("<script language='javascript'>window.location='../administracion/listarcitasp.jsp'</script>;");

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
