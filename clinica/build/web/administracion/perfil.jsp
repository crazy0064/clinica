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
        <script>
            function fecha() {
                var lista = document.getElementById("day");
                var lista1 = document.getElementById("year");
                var today = new Date();
                var año = today.getFullYear();
                for (i = 1; i < 32; i++) {
                    lista.options.add(new Option(i, i));
                }
                for (i = 0; i < 150; i++) {
                    lista1.options.add(new Option(año, año));
                    año--;
                }

            }
        </script>
    </head>

    <body onload="fecha();">

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
                                    rs = con.consulta("select * from personas where correo='" + user + "'");
                                    while (rs.next()) {
                                        out.print("<form  id='registro' name='registro' action='../procesos/moregistrop.jsp?id=" + rs.getString("dni") + "' method='POST'>");
                                        out.print(" <div class='form-group'>");
                                        out.print("    <input type='text' disabled  class='form-control' id='dni' name='dni' placeholder='Ingrese su DNI' value='" + rs.getString("dni") + "'>");
                                        out.print("   </div>");
                                        out.print(" <div class='form-group'>");
                                        out.print("    <input type='text' required class='form-control' id='nombres' name='nombres' placeholder='Ingrese sus nombres' value='" + rs.getString("nombres") + "'>");
                                        out.print("   </div>");
                                        out.print("   <div class='form-group'>");
                                        out.print("      <input type='text' required class='form-control' id='apellidos' name='apellidos' placeholder='Ingrese sus apellidos' value='" + rs.getString("apellidos") + "'>");
                                        out.print("   </div>");
                                        out.print("  <div class='form-group'>");
                                        out.print("      <input type='email' required disabled class='form-control' id='correo' name='correo' placeholder='Ingrese su correo electronico' onchange='validare(registro);' value='" + rs.getString("correo") + "'>");
                                        out.print("   </div>");
                                        out.print("   <div class='form-group'>");
                                        out.print("      <input name='telefono' type='text' class='form-control' id='telefono' placeholder='Ingrese su  numero de telefono' onkeydown='return numeros(event)' maxlength='15' value='" + rs.getString("telefono") + "'>");
                                        out.print(" </div>");
                                        out.print("  <div class='form-group'>");
                                        out.print("<input name='celular' type='text' class='form-control' id='celular' placeholder='Ingrese su numero de celular' onkeydown='return numeros(event)' maxlength='15' value='" + rs.getString("celular") + "'>");
                                        out.print("</div>");
                                        out.print("  <div class='form-group'>");
                                        out.print(" <input type='text' required class='form-control' id='direccion' name='direccion' placeholder='Ingrese su direccion donde vive actualmente' value='" + rs.getString("direccion") + "'>");
                                        out.print("</div>");
                                        out.print("<div class='form-group'>");
                                        out.print("   <select name='sexo' required class='form-control' id='sexo'>");
                                        if (rs.getString("sexo").equals("t")) {
                                            out.print("     <option value='true'>Masculino</option>");

                                        } else {
                                            out.print("     <option value='false'>Femenino</option>");

                                        }
                                        out.print("    <option value='true'>Masculino</option>");
                                        out.print("    <option value='false'>Femenino</option>");
                                        out.print(" </select>");
                                        out.print(" </div>");
                                        String leer = "", año = "", mes = "", dia = "", mes1 = "";
                                        for (int i = 0; i < rs.getString("fnacimiento").length(); i++) {
                                            leer = leer + rs.getString("fnacimiento").substring(i, i + 1);
                                            if (i == 3) {
                                                i++;
                                                año = leer;
                                                leer = "";

                                            }
                                            if (i == 6) {
                                                i++;
                                                mes = leer;
                                                if (mes.equals("01")) {
                                                    mes1 = "Enero";
                                                }
                                                if (mes.equals("02")) {
                                                    mes1 = "Febrero";
                                                }
                                                if (mes.equals("03")) {
                                                    mes1 = "Marzo";
                                                }
                                                if (mes.equals("04")) {
                                                    mes1 = "Abril";
                                                }
                                                if (mes.equals("05")) {
                                                    mes1 = "Mayo";
                                                }
                                                if (mes.equals("06")) {
                                                    mes1 = "Junio";
                                                }
                                                if (mes.equals("07")) {
                                                    mes1 = "Julio";
                                                }
                                                if (mes.equals("08")) {
                                                    mes1 = "Agosto";
                                                }
                                                if (mes.equals("09")) {
                                                    mes1 = "Septiembre";
                                                }
                                                if (mes.equals("10")) {
                                                    mes1 = "Octubre";
                                                }
                                                if (mes.equals("11")) {
                                                    mes1 = "Noviembre";
                                                }
                                                if (mes.equals("12")) {
                                                    mes1 = "Diciembre";
                                                }
                                                leer = "";

                                            }
                                            if (i == 9) {
                                                i++;
                                                dia = leer;
                                                leer = "";

                                            }
                                        }
                                        out.print("  <div class='form-group'>");
                                        out.print(" <select name='year' required class='form-control' id='year'>");
                                        out.print("     <option value='" + año + "'>" + año + "</option>");
                                        out.print(" </select>");
                                        out.print("  </div>");
                                        out.print(" <div class='form-group'>");
                                        out.print("   <select name='month' required class='form-control' id='month'>");
                                        out.print("    <option value='" + mes + "'>" + mes1 + "</option>");
                                        out.print("    <option value='1'>Enero</option>");
                                        out.print("    <option value='2'>Febrero</option>");
                                        out.print("    <option value='3'>Marzo</option>");
                                        out.print("   <option value='4'>Abril</option>");
                                        out.print("  <option value='5'>Mayo</option>");
                                        out.print("  <option value='6'>Junio</option>");
                                        out.print(" <option value='7'>Julio</option>");
                                        out.print("   <option value='8'>Agosto</option>");
                                        out.print("  <option value='9'>Septiembre</option>");
                                        out.print("   <option value='10'>Octubre</option>");
                                        out.print("   <option value='11'>Noviembre</option>");
                                        out.print("    <option value='12'>Diciembre</option>");
                                        out.print("  </select>");
                                        out.print(" </div>");
                                        out.print(" <div class='form-group'>");
                                        out.print("   <select name='day' required class='form-control' id='day'>");
                                        out.print("   <option value='" + dia + "'>" + dia + "</option>");
                                        out.print("   </select>");
                                        out.print(" </div>");
                                        out.print("  <button type='submit' class='btn btn-default btn-green'>Actualizar Registro</button>");
                                        out.print(" </form>");
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
