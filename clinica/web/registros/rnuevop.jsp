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
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
        <script type="text/javascript" src="../js/validar.js"></script>
    </head>
    <body class="contentpage" onload="fecha();">

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
                    <h1><a class="navbar-brand" href="../index.jsp"><%out.print(empresa);%><img src="../images/logo.png" alt="" width="50"/><br><br>
                            <h6><%out.print(logo);%></h6>
                        </a></h1>
                </div>	
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="../index.jsp" title="Inicio"><span data-hover="Inicio">Inicio</span></a>
                        </li>
                        <li>
                            <a href="../quienes.jsp" title="Quienes Somos"><span data-hover="Quienes Somos">Quienes Somos</span></a>
                        </li>
                        <li>
                            <a href="../mision.jsp" title="Misión Visión"><span data-hover="Misión Visión">Misión Visión</span></a>
                        </li>

                        <li>
                            <a href="../contactos.jsp" title="Contactos"><span data-hover="Contactos">Contactos</span></a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span data-hover="Servicios">Servicios</span> <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <%
                                    String user = (String) session.getAttribute("varUsuario");
                                    if (user != null) {%>
                                <li>
                                    <a href = "../administracion/panela.jsp" title = "Panel de Administración" > Panel de Administración</a> </li >
                                    <%  } else {%>
                                <li>
                                    <a href="../acesso.jsp" title="Acceder al sistema">Acceder al sistema</a>
                                </li>
                                <li>
                                    <a href="rnuevop.jsp" title="Crear una Cuenta">Crear una Cuenta</a>
                                </li>
                                <%  }
                                %>

                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <br>
        <br>
        <br>
        <br>

        <!-- Inicio de informacion -->
        <div class="container">
            <div class="row">
                <div class="col-md-12 centered">
                    <h3><span>Nuevo Registro De Paciente</span></h3>
                    <p>Por favor entrege toda la información correcta para que pueda ser validada en el sistema caso contrario noo podra acceder a un cuenta.</p>
                </div>
            </div>
        </div>
        <!-- fin de informacion -->
        <br>
        <br>
        <!-- inicio de formulario -->
        <div class="container content">
            <div class="row">
                <div class="col-md-9">
                    <form  id="registro" name="registro" action="../procesos/nuevop.jsp" method="POST">
                        <div class="form-group">
                            <select autofocus required class="form-control" name="tdocumento" id="tdocumento">
                                <option value="">Selecione de tipo de documento de DNI</option>
                                <option value="true">Nacional</option>
                                <option value="false">Extranjero</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="text" required class="form-control" id="dni" name="dni" placeholder="Ingrese su numero DNI de ciudadano" title="Ingrese su numero DNI de ciudadano" onkeydown="return numeros(event)" onchange="evaluar(registro)">
                        </div>
                        <div class="form-group">
                            <input type="text" required class="form-control" id="nombres" name="nombres" placeholder="Ingrese sus nombres" title="Ingrese sus nombres">
                        </div>
                        <div class="form-group">
                            <input type="text" required class="form-control" id="apellidos" name="apellidos" placeholder="Ingrese sus apellidos" title="Ingrese sus apellidos">
                        </div>
                        <div class="form-group">
                            <input type="email" required class="form-control" id="correo" name="correo" placeholder="Ingrese su correo electronico" title="Ingrese su correo electronico" onchange="validare(registro);">
                        </div>
                        <div class="form-group">
                            <input name="telefono" type="text" class="form-control" id="telefono" placeholder="Ingrese su  numero de telefono" title="Ingrese su  numero de telefono" onkeydown="return numeros(event)" maxlength="15">
                        </div>
                        <div class="form-group">
                            <input name="celular" type="text" class="form-control" id="celular" placeholder="Ingrese su numero de celular" title="Ingrese su numero de celular" onkeydown="return numeros(event)" maxlength="15">
                        </div>
                        <div class="form-group">
                            <input type="text" required class="form-control" id="direccion" name="direccion" placeholder="Ingrese su direccion donde vive actualmente" title="Ingrese su direccion donde vive actualmente">
                        </div>
                        <div class="form-group">
                            <select name="sexo" title="Seleccione el sexo" required class="form-control" id="sexo">
                                <option value="">Seleccione el tipo de sexo</option>
                                <option value="true">Masculino</option>
                                <option value="false">Femenino</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <select name="year" title="seleccione el año de nacimiento" required class="form-control" id="year">
                                <option value selected="">Seleccione el año de Nacimento</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <select name="month" title="Seleccione el mes de nacimiento" required class="form-control" id="month">
                                <option value="" selected="">Seleccione el mes de Nacimento</option>
                                <option value="1">Enero</option>
                                <option value="2">Febrero</option>
                                <option value="3">Marzo</option>
                                <option value="4">Abril</option>
                                <option value="5">Mayo</option>
                                <option value="6">Junio</option>
                                <option value="7">Julio</option>
                                <option value="8">Agosto</option>
                                <option value="9">Septiembre</option>
                                <option value="10">Octubre</option>
                                <option value="11">Noviembre</option>
                                <option value="12">Diciembre</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <select name="day" title="Seleccione el día de nacimiento " required class="form-control" id="day">
                                <option value="">Seleccione el dia de Nacimento</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <input type="password" required class="form-control" id="clave" name="clave" placeholder="Ingrese su clave de acceso privada" title="Ingrese su clave de acceso privada" onchange="validarp(this.value, registro);">
                        </div>
                        <button type="submit" class="btn btn-default btn-green" name="enviar" id="enviar">Registrar</button>
                    </form>
                </div>

            </div>
        </div>
        <br>
        <br>
        <!-- fin del formulario -->
        
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
                        <p>&copy;  Copyright <%out.print(a);%> <%out.print(empresa);%> Todos lo derechos Reservados. <a href="../index.jsp">Diseñado: Grupo <%out.print(empresa);%></a></p>
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