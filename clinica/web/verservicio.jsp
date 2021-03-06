<%@page import="java.sql.ResultSet"%>
<%@page import="clases.conexion"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Calendar fecha = Calendar.getInstance();
    int a = fecha.get(Calendar.YEAR);
    conexion con = new conexion();
    ResultSet rs = con.consulta("select * from empresa");
    String empresa = "", logo = "", telefonoi = "", correoi = "";
    while (rs.next()) {
        empresa = rs.getString("nombre");
        logo = rs.getString("logo");
        telefonoi = rs.getString("telefonoi");
        correoi = rs.getString("correoi");
    }
    String id = request.getParameter("id");
%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><%out.print(empresa);%></title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <script src="js/sweetalert.min.js"></script> 
        <link rel="stylesheet" type="text/css" href="css/sweetalert.css">
        <link rel="stylesheet" href="css/styles.css" />
        <link rel="stylesheet" href="css/jquery-ui.css" />
        <script src="js/jquery-1.9.1.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/login.js"></script>
    </head>
    <body class="contentpage">

        <!-- Navegacion del menu -->
        <div class="navbar navbar-default navbar-fixed-top affix inner-pages" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Menu Prinicpal</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <h1><a class="navbar-brand" href="#"><%out.print(empresa);%><img src="images/logo.png" alt="" width="50"/><br><br>
                            <h6><%out.print(logo);%></h6>
                        </a></h1>

                </div>	

                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="./index.jsp" title="Inicio"><span data-hover="Inicio">Inicio</span></a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span data-hover="Nosotros">Nosotros</span> <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="./quienes.jsp" title="Quienes Somos"><span data-hover="Quienes Somos">Quienes Somos</span></a>
                                </li>
                                <li>
                                    <a href="./mision.jsp" title="Misión Visión"><span data-hover="Misión Visión">Misión Visión</span></a>
                                </li>
                                <li>
                                    <a href="./acerca.jsp" title="Acerca de"><span data-hover="Acerca de">Acerca de</span></a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="./servicios.jsp" title="Servicios"><span data-hover="Servicios">Servicios</span></a>
                        </li>


                        <li>
                            <a href="./contactos.jsp" title="Contactenos"><span data-hover="Contactenos">Contactenos</span></a>
                        </li>

                        <%
                            String user = (String) session.getAttribute("varUsuario");
                            if (user != null) {%>

                        <li>
                            <a href = "./administracion/panela.jsp" title = "Ir al Sistema" >Ir al Sistema</a> 
                        </li>

                        <%  } else {
                        %>
                        <li>
                            <div id="loginContainer" class="navbar-collapse collapse">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="loginButton"><span data-hover="Accedder">Acceder</span> <b class="caret"></b></a>
                                <div id="loginBox">                
                                    <form id="loginForm" action="./procesos/logina.jsp" method="post">
                                        <fieldset id="body">
                                            <fieldset>
                                                <label for="email">Correo Electrónico</label>
                                                <input type="text"  id="email" name="usuario" />
                                            </fieldset>
                                            <fieldset>
                                                <label for="password">Contraseña</label>
                                                <input type="password"  id="password" name="clave"/>
                                            </fieldset>

                                            <input type="submit" id="login" value="Iniciar Sesión " />
                                        </fieldset>
                                        <span><a href="./registros/rnuevop.jsp">No Tienes Cuenta ! Registrate</a></span>
                                    </form>
                                </div>
                                <br><br><br><br><br><br><br>
                            </div>
                        </li>
                        <%  }
                        %>

                    </ul>
                </div>
            </div>
        </div>
        <!-- Fin del navegacion del menu -->

        <br><br><br>

        <br>
        <br>

        <!-- Contenido Inicio -->
        <div class="container">
            <div class="row adoption">
                <%
                    ResultSet rsi = con.consulta("select * from servicios where idservicio='" + id + "'");
                    while (rsi.next()) {
                %>
                <div class="col-md-12 centered" >
                    <div >
                        <a href=".<%out.print(rsi.getString("fotoser")); %>" title="<%out.print(rsi.getString("nomservicio")); %>" data-hover="<%out.print(rsi.getString("nomservicio")); %>" data-toggle="lightbox" class="lightbox">

                            <img src=".<%out.print(rsi.getString("fotoser")); %>" alt="<%out.print(rsi.getString("nomservicio")); %>" />
                        </a>
                    </div>
                </div>
                <div class="col-md-12 centered">
                    <h3><span><%out.print(rsi.getString("nomservicio")); %></span></h3>
                    <p style="font-size:15px; text-align:justify;"><%out.print(rsi.getString("detalleser")); %></p>
                </div> 
                <%}%>
                <br>
                <div class="col-md-12 centered">
                    <h3 style="font-family: fantasy; "><span>Servicios </span></h3>
                </div>
                <br>
                <%
                    ResultSet rss = con.consulta("select * from servicios where estservicio='true'");
                    while (rss.next()) {
                %>
                <div class="col-md-4">
                    <a href="verservicio.jsp?id=<%out.print(rss.getString("idservicio")); %>" title="<%out.print(rss.getString("nomservicio")); %>"><img src=".<%out.print(rss.getString("fotoser")); %>" alt="<%out.print(rss.getString("nomservicio")); %>" /></a>
                    <div class="title">
                        <h5>
                            <span data-hover="<%out.print(rss.getString("nomservicio")); %>"><%out.print(rss.getString("nomservicio")); %></span>
                        </h5>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
        <!-- Fin de contenido -->
        <br>
        <br>
        <!-- Pie de pagina inicio -->
        <div class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <h6>Acerca de Nosotros</h6>
                        <p>Estamos comprometidos con la excelencia en todas las facetas de este arte y ciencia. Estamosn orgullosos de la calidad de nuestro trabajo, utilizando los mejores materiales disponibles. Trabajamos con técnicos protésicos y artistas dentales altamente preparados, que siguen nuestro compromiso por la excelencia.</p>
                    </div>
                    <div class="col-md-3">
                        <h6>Objetivo Asistencial</h6>
                        <p>Somos un centro de referencia para nuestros pacientes actuales y futuros, fundamentalmente por nuestra seriedad y rigor profesional. Nuestro objetivo es acercarnos con tratamientos odontológicos de calidad a la sociedad. </p>
                    </div>

                    <div class="col-md-3 contact-info">
                        <h6>Información  de la Institucion</h6>
                        <p>Toda la informacion se entrega para contactos a la institución por parte de la Dra. Gulnara Obando V.</p>
                        <p class="social">
                            <a href="https://www.facebook.com" class="facebook"></a> <a href="https://es.pinterest.com" class="pinterest"></a> <a href="https://www.twitter.com" class="twitter"></a>
                        </p>
                        <p class="c-details">
                            <span>Email: </span><%out.print(correoi);%><br >
                            <span>Teléf: </span> <%out.print(telefonoi);%></p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 copyright">
                        <p>&copy;  Copyright <%out.print(a);%> <%out.print(empresa);%> Todos lo derechos Reservados. <a href="index.jsp">Diseñado: Grupo <%out.print(empresa);%></a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- termina pie de pagina -->

        <!-- Javascript plugins -->
        <script src="https://code.jquery.com/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/carouFredSel.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/ekkoLightbox.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>