<%@page import="clases.MailSender"%>
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
                                    <a href="../registros/rnuevop.jsp" title="Crear una Cuenta">Crear una Cuenta</a>
                                </li>
                                <%  }
                                %>

                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <%
            String tipo = request.getParameter("tdocumento");
            String dni = request.getParameter("dni");
            String nombre = request.getParameter("nombres");
            String apellido = request.getParameter("apellidos");
            String correo = request.getParameter("correo");
            String telefono = request.getParameter("telefono");
            String celular = request.getParameter("celular");
            String direccion = request.getParameter("direccion");
            String sexo = request.getParameter("sexo");
            String fechas = request.getParameter("year") + "-" + request.getParameter("month") + "-" + request.getParameter("day");
            String clave = request.getParameter("clave");
            String tpersona = "003";
            rs = con.consulta("select p.dni,p.correo,p.estpersona from personas p where dni='" + dni + "' or correo='" + correo + "'");
            String dn = "";
            String cor = "";
            String est = "";
            while (rs.next()) {
                dn = rs.getString("dni");
                cor = rs.getString("correo");
                est = rs.getString("estpersona");
            }

        %>
        <br>
        <br>
        <br>
        <br>


        <!-- inicio de Services -->
        <div class="rehome">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 centered">
                        <%if (dn.equals(dni)) {
                        %>
                        <a href="../registros/rnuevop.jsp" title="Volver a Ingresar" class="roundal" id="kennel"></a>
                        <h4>Alerta Encontrada?</h4>
                        <p>El Dni ingresado ya se encuentra registrado en la base de datos</p>

                        <%
                        } else if (cor.equals(correo)) {
                        %>
                        <a href="../registros/rnuevop.jsp" title="Volver a Ingresar" class="roundal" id="kennel"></a>
                        <h4>Alerta Encontrada?</h4>
                        <p>El correo electronico ingresado ya se encuentra registrado en la base de datos</p>

                        <%
                        } else if (est.equals("t")) {
                        %>
                        <a href="../registros/rnuevop.jsp" title="Volver a Ingresar" class="roundal" id="kennel"></a>
                        <h4>Alerta Encontrada?</h4>
                        <p>Este usuario esta desativado temporalmente contacte la institucion</p>

                        <%
                        } else {
                        %>
                        <a href="../administracion/logina.jsp" title="Volver a Entrar" class="roundal" id="kennel"></a>
                        <h4>Se ha enviado un mensaje de confirmacion a su correo?</h4>
                        <p>con este mensaje usted activara su cuenta asi permitiendose a acceder a los servicios del la intitucion.</p>

                        <%
                                con.consulta("INSERT INTO personas(dni, tdocumento, nombres, apellidos, correo, telefono, celular,direccion, fnacimiento, sexo, clave, tpersona)VALUES ('" + dni + "', 'true', '" + nombre + "', '" + apellido + "', '" + correo + "', '" + telefono + "', '" + celular + "','" + direccion + "','" + fechas + "', 'true', md5('" + clave + "') , '" + tpersona + "');");
                                MailSender ms = new MailSender();
                                ms.mensaje("http://localhost:8080/clinica/procesos/final.jsp?id=" + dni + "");
                                ms.para(correo);
                                ms.SendMail();

                            }%>

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