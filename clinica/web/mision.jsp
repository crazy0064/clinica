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
    </head>
    <body class="homepage">

        <!-- Navegacion del menu -->
        <div class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Menu Prinicpal</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <h1><a class="navbar-brand" href="index.jsp"><%out.print(empresa);%><img src="images/logo.png" alt="" width="50"/><br><br>
                            <h6><%out.print(logo);%></h6>
                        </a></h1>
                </div>	
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="#" title="Inicio"><span data-hover="Inicio">Inicio</span></a>
                        </li>
                        <li>
                            <a href="quienes.jsp" title="Quienes Somos"><span data-hover="Quienes Somos">Quienes Somos</span></a>
                        </li>
                        <li>
                            <a href="mision.jsp" title="Misión Visión"><span data-hover="Misión Visión">Misión Visión</span></a>
                        </li>

                        <li>
                            <a href="contactos.jsp" title="Contactos"><span data-hover="Contactos">Contactos</span></a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span data-hover="Servicios">Servicios</span> <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <%
                                    String user = (String) session.getAttribute("varUsuario");
                                    if (user != null) {%>
                                <li>
                                    <a href = "./administracion/panela.jsp" title = "Panel de Administración" > Panel de Administración</a> </li >
                                    <%  } else {%>
                                <li>
                                    <a href="acesso.jsp" title="Acceder al sistema">Acceder al sistema</a>
                                </li>
                                <li>
                                    <a href="./registros/rnuevop.jsp" title="Crear una Cuenta">Crear una Cuenta</a>
                                </li>
                                <%  }
                                %>

                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Fin del navegacion del menu -->

        <!-- Inicio de galeria -->
        <div id="home_carousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#home_carousel" data-slide-to="0" class="active">
                </li>
                <li data-target="#home_carousel" data-slide-to="1"></li>
                <li data-target="#home_carousel" data-slide-to="2"></li>
            </ol>

            <!-- Inicio de Imagenes -->
            <div class="carousel-inner">
                <div class="item active">
                    <img src="images/3.jpg" alt="" />
                    <div class="carousel-caption">
                        <h2>Tecnología de Blanqueamiento</h2>
                        <p>Estas se  realizan aplicando substancias oxidantes que se pueden activar mediante luz o calor, originando el efecto blanqueador, gracias a la reacción química de oxidación que se produce durante el blanqueamiento de los dientes.</p>
                    </div>
                </div>
                <div class="item">
                    <img src="images/1.jpg" alt="" />
                    <div class="carousel-caption">
                        <h2>Infraestructura de una Clínica Dental </h2>
                        <p>Ambientes amplios, cómodos y modernos, 
                            Estacionamiento propio y seguro de fácil acceso, 
                            Amplias y cómodas salas de espera, 
                            SSHH independientes para pacientes tanto para hombres como para mujeres </p>
                    </div>
                </div>
                <div class="item">
                    <img src="images/2.jpg" alt="" />
                    <div class="carousel-caption">
                        <h2>Tu Clínica Dental</h2>
                        <p>Tres Modernas Unidades Dentales, 
                            Equipo Radiográfico Dental, 
                            Ultrasonido para Profilaxis, 
                            Estelirización por agentes químico, calor seco y autoclave, 
                            Cámara Intraoral, 
                            Equipo de ultima generación para implantología</p>
                        <h2></h2>
                    </div>
                </div>
            </div>

            <!-- Controles -->
            <a class="left carousel-control" href="#home_carousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
            </a>
            <a class="right carousel-control" href="#home_carousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
            </a>
        </div>
        <!-- galeria final -->

        <!-- Contenido Inicio -->
        <div class="rehome">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 centered">

                        <h4><img src="images/mision.png"></h4>
                        <p>Misión</p>
                        <p>Brindar servicios odontológicos integrales contribuyendo a resolver eficazmente los problemas de salud Oral de nuestros pacientes, aplicando para ello conceptos de excelencia en el servicio, eficiencia en la gestión y calidez personalizada en la atención.                          </p>
                        <p>Visión                          </p>
                        <p>Ser la clinica odontológica líder en la zona norte del Lima con lo más avanzado en tecnología y con especialistas que reúnan los requisitos máximos de profesionalismo y excelencia, para satisfacer al máximo las exigencias de nuestros pacientes e ir más allá de sus expectativas, deseando establecer una relación duradera con cada paciente basada en el tratamiento personalizado y orientado al detalle brindándoles nuestra experiencia a su servicio.</p>

                    </div>
                </div>
            </div>
        </div>
        <!-- Fin de contenido -->



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