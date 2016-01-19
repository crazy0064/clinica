package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import clases.conexion;
import java.util.Calendar;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

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

      out.write("\r\n");
      out.write("<!doctype html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta charset=\"utf-8\">\r\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("        <title>");
out.print(empresa);
      out.write("</title>\r\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\">\r\n");
      out.write("    </head>\r\n");
      out.write("    <body class=\"homepage\">\r\n");
      out.write("\r\n");
      out.write("        <!-- Navegacion del menu -->\r\n");
      out.write("        <div class=\"navbar navbar-default navbar-fixed-top\" role=\"navigation\">\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <div class=\"navbar-header\">\r\n");
      out.write("                    <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-collapse\">\r\n");
      out.write("                        <span class=\"sr-only\">Menu Prinicpal</span>\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                    </button>\r\n");
      out.write("                    <h1><a class=\"navbar-brand\" href=\"#\">");
out.print(empresa);
      out.write("<img src=\"images/logo.png\" alt=\"\" width=\"50\"/><br><br>\r\n");
      out.write("                            <h6>");
out.print(logo);
      out.write("</h6>\r\n");
      out.write("                        </a></h1>\r\n");
      out.write("                </div>\t\r\n");
      out.write("                <div class=\"navbar-collapse collapse\">\r\n");
      out.write("                    <ul class=\"nav navbar-nav\">\r\n");
      out.write("                        <li class=\"active\">\r\n");
      out.write("                            <a href=\"#\" title=\"Inicio\"><span data-hover=\"Inicio\">Inicio</span></a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"quienes.jsp\" title=\"Quienes Somos\"><span data-hover=\"Quienes Somos\">Quienes Somos</span></a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"mision.jsp\" title=\"Misión Visión\"><span data-hover=\"Misión Visión\">Misión Visión</span></a>\r\n");
      out.write("                        </li>\r\n");
      out.write("\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"contactos.jsp\" title=\"Contactos\"><span data-hover=\"Contactos\">Contactos</span></a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li class=\"dropdown\">\r\n");
      out.write("                            <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\"><span data-hover=\"Servicios\">Servicios</span> <b class=\"caret\"></b></a>\r\n");
      out.write("                            <ul class=\"dropdown-menu\">\r\n");
      out.write("                                ");

                                    String user = (String) session.getAttribute("varUsuario");
                                    if (user != null) {
      out.write("\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <a href = \"./administracion/panela.jsp\" title = \"Panel de Administración\" > Panel de Administración</a> </li >\r\n");
      out.write("                                    ");
  } else {
      out.write("\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <a href=\"acesso.jsp\" title=\"Acceder al sistema\">Acceder al sistema</a>\r\n");
      out.write("                                </li>\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <a href=\"./registros/rnuevop.jsp\" title=\"Crear una Cuenta\">Crear una Cuenta</a>\r\n");
      out.write("                                </li>\r\n");
      out.write("                                 <li>\r\n");
      out.write("                                     <li class=\"active\">\r\n");
      out.write("                                         \r\n");
      out.write("                            <a href=\"../reportes/ayuda.jsp?id=/pdf/manual_admin.pdf\"><span data-hover=\"Ayuda\">Ayuda</span></a>\r\n");
      out.write("                            <a class=\"dropdown-toggle\" href=\"../reportes/ayuda.jsp?id=/pdf/manual_admin.pdf\">\r\n");
      out.write("                                <i class=\"fa fa-question\"></i>\r\n");
      out.write("                            </a>\r\n");
      out.write("                              \r\n");
      out.write("                        </li>\r\n");
      out.write("                                </li>\r\n");
      out.write("                                ");
  }
                                
      out.write("\r\n");
      out.write("\r\n");
      out.write("                            </ul>\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- Fin del navegacion del menu -->\r\n");
      out.write("\r\n");
      out.write("        <!-- Inicio de galeria -->\r\n");
      out.write("        <div id=\"home_carousel\" class=\"carousel slide\" data-ride=\"carousel\">\r\n");
      out.write("            <ol class=\"carousel-indicators\">\r\n");
      out.write("                <li data-target=\"#home_carousel\" data-slide-to=\"0\" class=\"active\">\r\n");
      out.write("                </li>\r\n");
      out.write("                <li data-target=\"#home_carousel\" data-slide-to=\"1\"></li>\r\n");
      out.write("                <li data-target=\"#home_carousel\" data-slide-to=\"2\"></li>\r\n");
      out.write("            </ol>\r\n");
      out.write("\r\n");
      out.write("            <!-- Inicio de Imagenes -->\r\n");
      out.write("            <div class=\"carousel-inner\">\r\n");
      out.write("                <div class=\"item active\">\r\n");
      out.write("                    <img src=\"images/3.jpg\" alt=\"\" />\r\n");
      out.write("                    <div class=\"carousel-caption\">\r\n");
      out.write("                        <h2>Tecnología de Blanqueamiento</h2>\r\n");
      out.write("                        <p>Estas se  realizan aplicando substancias oxidantes que se pueden activar mediante luz o calor, originando el efecto blanqueador, gracias a la reacción química de oxidación que se produce durante el blanqueamiento de los dientes.</p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"item\">\r\n");
      out.write("                    <img src=\"images/1.jpg\" alt=\"\" />\r\n");
      out.write("                    <div class=\"carousel-caption\">\r\n");
      out.write("                        <h2>Infraestructura de una Clínica Dental </h2>\r\n");
      out.write("                        <p>Ambientes amplios, cómodos y modernos, \r\n");
      out.write("                            Estacionamiento propio y seguro de fácil acceso, \r\n");
      out.write("                            Amplias y cómodas salas de espera, \r\n");
      out.write("                            SSHH independientes para pacientes tanto para hombres como para mujeres </p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"item\">\r\n");
      out.write("                    <img src=\"images/2.jpg\" alt=\"\" />\r\n");
      out.write("                    <div class=\"carousel-caption\">\r\n");
      out.write("                        <h2>Tu Clínica Dental</h2>\r\n");
      out.write("                        <p>Tres Modernas Unidades Dentales, \r\n");
      out.write("                            Equipo Radiográfico Dental, \r\n");
      out.write("                            Ultrasonido para Profilaxis, \r\n");
      out.write("                            Estelirización por agentes químico, calor seco y autoclave, \r\n");
      out.write("                            Cámara Intraoral, \r\n");
      out.write("                            Equipo de ultima generación para implantología</p>\r\n");
      out.write("                        <h2></h2>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <!-- Controles -->\r\n");
      out.write("            <a class=\"left carousel-control\" href=\"#home_carousel\" data-slide=\"prev\">\r\n");
      out.write("                <span class=\"glyphicon glyphicon-chevron-left\"></span>\r\n");
      out.write("            </a>\r\n");
      out.write("            <a class=\"right carousel-control\" href=\"#home_carousel\" data-slide=\"next\">\r\n");
      out.write("                <span class=\"glyphicon glyphicon-chevron-right\"></span>\r\n");
      out.write("            </a>\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- galeria final -->\r\n");
      out.write("\r\n");
      out.write("        <!-- Contenido Inicio -->\r\n");
      out.write("        <div class=\"rehome\">\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-md-12 centered\">\r\n");
      out.write("\r\n");
      out.write("                        <h4><img src=\"images/inicio.png\"></h4>\r\n");
      out.write("                        <p>Queremos darle la bienvenida a nuestra web e invitarle a conocer la Clinica y descubrir los servicios odontológicos integrales que brindamos, cuidando al máximo su salud con profesionalismo, calidad, garantía y brindando las mejores facilidades de pago.\r\n");
      out.write("                            No defraudamos a nuestros pacientes, les escuchamos, entendemos y realizamos el tratamiento más adecuado para cada uno, nuestro trabajo no acaba hasta que el paciente esté satisfecho, logrando excelentes resultados.\r\n");
      out.write("                            Sonrisas y Detalles su Clinica Dental de Confianza.</p>\r\n");
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- Fin de contenido -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <!-- Pie de pagina inicio -->\r\n");
      out.write("        <div class=\"footer\">\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-md-3\">\r\n");
      out.write("                        <h6>Acerca de Nosotros</h6>\r\n");
      out.write("                        <p>Estamos comprometidos con la excelencia en todas las facetas de este arte y ciencia. Estamosn orgullosos de la calidad de nuestro trabajo, utilizando los mejores materiales disponibles. Trabajamos con técnicos protésicos y artistas dentales altamente preparados, que siguen nuestro compromiso por la excelencia.</p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-md-3\">\r\n");
      out.write("                        <h6>Objetivo Asistencial</h6>\r\n");
      out.write("                        <p>Somos un centro de referencia para nuestros pacientes actuales y futuros, fundamentalmente por nuestra seriedad y rigor profesional. Nuestro objetivo es acercarnos con tratamientos odontológicos de calidad a la sociedad. </p>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"col-md-3 contact-info\">\r\n");
      out.write("                        <h6>Información  de la Institucion</h6>\r\n");
      out.write("                        <p>Toda la informacion se entrega para contactos a la institución por parte de la Dra. Gulnara Obando V.</p>\r\n");
      out.write("                        <p class=\"social\">\r\n");
      out.write("                            <a href=\"https://www.facebook.com\" class=\"facebook\"></a> <a href=\"https://es.pinterest.com\" class=\"pinterest\"></a> <a href=\"https://www.twitter.com\" class=\"twitter\"></a>\r\n");
      out.write("                        </p>\r\n");
      out.write("                        <p class=\"c-details\">\r\n");
      out.write("                            <span>Email: </span>");
out.print(correoi);
      out.write("<br >\r\n");
      out.write("                            <span>Teléf: </span> ");
out.print(telefonoi);
      out.write("</p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-md-12 copyright\">\r\n");
      out.write("                        <p>&copy;  Copyright ");
out.print(a);
      out.write(' ');
out.print(empresa);
      out.write(" Todos lo derechos Reservados. <a href=\"#\">Diseñado: Grupo ");
out.print(empresa);
      out.write("</a></p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- termina pie de pagina -->\r\n");
      out.write("\r\n");
      out.write("        <!-- Javascript plugins -->\r\n");
      out.write("        <script src=\"https://code.jquery.com/jquery.js\"></script>\r\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\r\n");
      out.write("        <script src=\"js/carouFredSel.js\"></script>\r\n");
      out.write("        <script src=\"js/jquery.stellar.min.js\"></script>\r\n");
      out.write("        <script src=\"js/ekkoLightbox.js\"></script>\r\n");
      out.write("        <script src=\"js/custom.js\"></script>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
