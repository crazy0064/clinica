<%@page import="clases.fechas"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="clases.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    conexion con = new conexion();
    ResultSet rs = null;
    String nom = "", apel = "", foto = "", id = "", pri = "", idno = "", idc = "";//variables de usuario
    String dia = "", diam = "", diami = "", diaj = "", diav = "", dias = "", diad = "";
    String empresa = "";//variable de empresa
    String user = (String) session.getAttribute("varUsuario");//variable que contiene la sesion activa
    String dato = (String) session.getAttribute("mover");
    int mover = Integer.parseInt(dato);
    Date pasa = new Date();
    fechas sr = new fechas();
    String url = request.getRequestURI();//varible que extrae url de pagina
    int acceso = 0;//varible de acceso a pagina
    if (user == null) {
        response.sendRedirect("../administracion/logina.jsp");
    } else {
        idc = request.getParameter("id");
        dia = sr.srfecha(pasa, 0, mover);
        diam = sr.srfecha(pasa, 1, mover);
        diami = sr.srfecha(pasa, 2, mover);
        diaj = sr.srfecha(pasa, 3, mover);
        diav = sr.srfecha(pasa, 4, mover);
        dias = sr.srfecha(pasa, 5, mover);
        diad = sr.srfecha(pasa, 6, mover);
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
                    <center><h4><i class="fa fa-refresh"></i>Busqueda de horario del Especialista </h4></center>
                    <div class="row mt">

                        <div class="col-lg-12">
                            <div class="form-panel">
                                <br> <br>
                                <form  id="ncitas" name="ncitas" action="ncitasm.jsp?id=<%out.print(idc);%>" method="POST">

                                    <div class="form-group">
                                        <input type="text" class="form-control" id="busqueda" name="busqueda" placeholder="Busqueda avanzada ........." onClick="abrirc('../busquedas/datos');">
                                        <input type="text" size="1" id="idp" name="idp"  style="display:none">
                                    </div>

                                    <button type="submit" class="btn btn-default btn-lg btn-block" id="buscar" name="buscar"> Cargar Agenda </button>
                                </form>
                                <br>
                                <center> <h4><i class='fa fa-list'></i> Horario Generado </h4></center>
                                <br>
                                <div class="form-group">

                                    <%
                                        if (request.getParameter("buscar") != null) {
                                            String buscar = request.getParameter("busqueda");
                                            String idp = request.getParameter("idp");
                                            if (buscar.equals("")) {
                                                buscar = (String) session.getAttribute("contener");
                                                idp = (String) session.getAttribute("temporal");
                                            } else {
                                                session.setAttribute("contener", buscar);
                                                session.setAttribute("temporal", idp);
                                            }
                                            rs = con.consulta("select count(*) from horarios where iddoctor='" + buscar + "'");
                                            String conte = "";
                                            while (rs.next()) {
                                                conte = rs.getString("count");
                                            }
                                            if (!conte.equals("0")) {
                                                id = buscar;
                                                out.print("  <form id='ncita' name='ncita' action='' method='POST'>");
                                                out.print("   <table class='table table-striped table-advance table-hover'>");
                                                out.print("  <hr>");
                                                out.print(" <thead>");
                                                out.print("     <tr>");

                                                out.print("        <th >Hora</th>");
                                                out.print("        <th >Lunes <input  type='text' size='1' name='dial' value=" + (dia.substring(8, 10)) + "></th>");
                                                out.print("       <th >Martes <input  type='text' size='1' name='diam' value=" + (diam.substring(8, 10)) + "></th>");
                                                out.print("        <th >Miercoles <input  type='text' size='1' name='diami' value=" + (diami.substring(8, 10)) + "></th>");
                                                out.print("       <th class='hidden-phone'>Jueves <input  type='text' size='1' name='diaj' value=" + (diaj.substring(8, 10)) + "></th>");
                                                out.print("       <th class='hidden-phone'>Viernes <input  type='text' size='1' name='diav' value=" + (diav.substring(8, 10)) + "></th>");
                                                out.print("       <th class='hidden-phone'>Sabado <input  type='text' size='1' name='dias' value=" + (dias.substring(8, 10)) + "></th>");
                                                out.print("       <th class='hidden-phone'>Domingo <input  type='text' size='1' name='diad' value=" + (diad.substring(8, 10)) + "></th>");
                                                out.print("    </tr>");
                                                rs = con.consulta("select * from horarios h where iddoctor='" + buscar + "'");
                                                int subir = 0;
                                                out.print(" </thead>");
                                                out.print("    <tbody>");
                                                while (rs.next()) {
                                                    subir++;
                                                    out.print("    <tr>");

                                                    out.print(" <td><input type='text'  size='5' required='required' name='hora_" + subir + "' value='" + rs.getString("horahor") + "'/></td>");
                                                    if (rs.getString("lunes").equals("t")) {
                                                        out.print("<td><a style='color:#1AC87F' href='ncitam.jsp?hora=" + rs.getString("horahor") + "&&fecha=" + dia + "&&idd=" + id + "&&idp=" + idp + "&&idc=" + idc + "'>Agregar Cita</a></td>");

                                                    } else {
                                                        out.print("<td><a style='color:#FF0004'>Ocupado</a></td>");
                                                    }
                                                    if (rs.getString("martes").equals("t")) {
                                                        out.print("<td><a style='color:#1AC87F' href='ncitam.jsp?hora=" + rs.getString("horahor") + "&&fecha=" + diam + "&&idd=" + id + "&&idp=" + idp + "&&idc=" + idc + "'>Agregar Cita</a></td>");

                                                    } else {
                                                        out.print("<td><a style='color:#FF0004'>Ocupado</a></td>");

                                                    }
                                                    if (rs.getString("miercoles").equals("t")) {
                                                        out.print("<td><a style='color:#1AC87F' href='ncitam.jsp?hora=" + rs.getString("horahor") + "&&fecha=" + diami + "&&idd=" + id + "&&idp=" + idp + "&&idc=" + idc + "'>Agregar Cita</a></td>");

                                                    } else {
                                                        out.print("<td><a style='color:#FF0004'>Ocupado</a></td>");

                                                    }
                                                    if (rs.getString("jueves").equals("t")) {
                                                        out.print("<td class='hidden-phone'><a style='color:#1AC87F' href='ncitam.jsp?hora=" + rs.getString("horahor") + "&&fecha=" + diaj + "&&idd=" + id + "&&idp=" + idp + "&&idc=" + idc + "'>Agregar Cita</a></td>");

                                                    } else {
                                                        out.print("<td class='hidden-phone'><a style='color:#FF0004'>Ocupado</a></td>");

                                                    }
                                                    if (rs.getString("viernes").equals("t")) {
                                                        out.print("<td class='hidden-phone'><a style='color:#1AC87F' href='ncitam.jsp?hora=" + rs.getString("horahor") + "&&fecha=" + diav + "&&idd=" + id + "&&idp=" + idp + "&&idc=" + idc + "'>Agregar Cita</a></td>");

                                                    } else {
                                                        out.print("<td class='hidden-phone'><a style='color:#FF0004'>Ocupado</a></td>");

                                                    }
                                                    if (rs.getString("sabado").equals("t")) {
                                                        out.print("<td class='hidden-phone'><a style='color:#1AC87F' href='ncitam.jsp?hora=" + rs.getString("horahor") + "&&fecha=" + dias + "&&idd=" + id + "&&idp=" + idp + "&&idc=" + idc + "'>Agregar Cita</a></td>");

                                                    } else {
                                                        out.print("<td class='hidden-phone'><a style='color:#FF0004'>Ocupado</a></td>");

                                                    }
                                                    if (rs.getString("domingo").equals("t")) {
                                                        out.print("<td class='hidden-phone'><a style='color:#1AC87F' href='ncitam.jsp?hora=" + rs.getString("horahor") + "&&fecha=" + diad + "&&idd=" + id + "&&idp=" + idp + "&&idc=" + idc + "'>Agregar Cita</a></td>");

                                                    } else {
                                                        out.print("<td class='hidden-phone'><a style='color:#FF0004'>Ocupado</a></td>");

                                                    }
                                                    out.print("    </tr>");
                                                }
                                                out.print("  </tbody>");
                                                out.print("     </table>");
                                                out.print("  </form>");
                                            } else {
                                                out.print("No existen Registro de este Especilistaas");
                                            }
                                        }
                                    %>
                                </div>
                                <br>
                                <form id="dar" name="dar" method="post" action="ncitasm.jsp?id=<%out.print(idc);%>">
                                    <button type="submit" class="btn btn-default btn-lg btn-block" id="btnmas" name="btnmas">Siguiente Semana </button>
                                    <button type="submit" class="btn btn-default btn-lg btn-block" id="btnmenos" name="btnmenos">Anterior Semana</button>
                                </form>
                                <%
                                    if (request.getParameter(
                                            "btnmas") != null) {
                                        mover++;
                                        String inc = Integer.toString(mover);
                                        session.setAttribute("mover", inc);
                                    }
                                %>
                                <%
                                    if (request.getParameter(
                                            "btnmenos") != null) {
                                        mover--;
                                        String inc = Integer.toString(mover);
                                        session.setAttribute("mover", inc);
                                    }
                                %>
                                <br>
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