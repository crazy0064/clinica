<%@page import="clases.conexion"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Odontologia</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
        <script type="text/javascript" src="../js/validar.js"></script>
    </head>
    <body class="contentpage">
        <!-- Navigacion del menu inicio -->
        <div class="navbar navbar-default navbar-fixed-top affix inner-pages" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <h1><a class="navbar-brand" href="index.html">Odontologia Dental <img src="../images/logo.jpg" alt="" width="50"/><br><br>
                            <h6>Cuidamos tu sonrisa odontologos con la mas alta capacidad profesional</h6>
                        </a></h1>
                </div>	
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="../index.html" title="Inicio"><span data-hover="Inicio">Inicio</span></a>
                        </li>
                        <li>
                            <a href="../quienes.html" title="Quienes Somos"><span data-hover="Quienes Somos">Quienes Somos</span></a>
                        </li>
                        <li>
                            <a href="../mision.html" title="Misi贸n Visi贸n"><span data-hover="Misi贸n Visi贸n">Misi贸n Visi贸n</span></a>
                        </li>

                        <li>
                            <a href="../contactos.html" title="Contactos"><span data-hover="Contactos">Contactos</span></a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span data-hover="Servicios">Servicios</span> <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="../acceso.html" title="Acesso al sistema">Acesso al sistema</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Navigacion del menu final -->

        <br>
        <br>
        <br>
        <br>

        <!-- inicio de Services -->
        <div class="rehome">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 centered">
                        <a href="../administracion/logina.jsp" title="Volver a Entrar" class="roundal" id="kennel"></a>
                        <h4>Su cuenta se a Activado Correctamente?</h4>
                        <p>Usted ya puede acceder a su cuenta para acceder a los servicios del la institucion.</p>
                    </div>
                </div>
            </div>
        </div>

        <!--fin de Servicios -->

        <!-- Pie de pagina inicio -->
        <div class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <h6>Acerca de Nosotros</h6>
                        <p>Estamos comprometidos con la excelencia en todas las facetas de este arte y ciencia. Estamosn orgullosos de la calidad de nuestro trabajo, utilizando los mejores materiales disponibles. Trabajamos con tecnicos  y artistas dentales altamente preparados, que siguen nuestro compromiso por la excelencia.</p>
                    </div>
                    <div class="col-md-3">
                        <h6>Valores de la Instituci髇</h6>
                        <p>Trabajo en equipo agil y multidisciplinar</p>
                        <p>Trato humano y personalizado</p>
                        <p>Atenci髇 global de la persona</p>
                        <p>Compromiso con la sociedad</p>
                    </div>
                    <div class="col-md-3">
                        <h6>Mapa de sitio:</h6>
                        <ul>
                            <li><a href="index.html" title="">Inicio</a></li>
                            <li><a href="contactos.html" title="">Contactos</a></li>
                            <li><a href="quienes.html" title="">Terminos y condiciones</a></li>
                            <li><a href="politicas.html" title="">Politicas de Privacidad</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3 contact-info">
                        <h6>Informaci髇  de la Institucion</h6>
                        <p>Toda la informacion se entrega para contactos a la instituci髇 por parte de la Dra. Gulnara Obando V.</p>
                        <p class="social">
                            <a href="#" class="facebook"></a> <a href="#" class="pinterest"></a> <a href="#" class="twitter"></a>
                        </p>
                        <p class="c-details">
                            <span>Email </span>odontologiadental@hotmail.com<br >
                            <span>Telef </span> 2 365-069</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 copyright">
                        <p>&copy;  Copyright 2015 Odontologia Dental Todos lo derechos Reservados. <a href="index.html">Dise馻do: Grupo Odontologia Dental</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- termina pie de pagina -->

        <!-- Javascript plugins -->
        <script src="https://code.jquery.com/jquery.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/carouFredSel.js"></script>
        <script src="../js/jquery.stellar.min.js"></script>
        <script src="../js/ekkoLightbox.js"></script>
        <script src="../js/custom.js"></script>
    </body>
</html>
<%
    conexion con = new conexion();
    String id= request.getParameter("id");
    con.consulta("update personas set estactivo='true' where dni='"+id+"'");
   
%>