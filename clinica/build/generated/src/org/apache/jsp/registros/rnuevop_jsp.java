package org.apache.jsp.registros;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import clases.conexion;
import java.util.Calendar;

public final class rnuevop_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <link href=\"../css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"../css/style.css\" rel=\"stylesheet\">\r\n");
      out.write("        <script type=\"text/javascript\" src=\"../js/validar.js\"></script>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body class=\"contentpage\" onload=\"fecha();\">\r\n");
      out.write("\r\n");
      out.write("        <!-- Navegacion del menu -->\r\n");
      out.write("        <div class=\"navbar navbar-default navbar-fixed-top affix inner-pages\" role=\"navigation\">\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <div class=\"navbar-header\">\r\n");
      out.write("                    <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-collapse\">\r\n");
      out.write("                        <span class=\"sr-only\">Menu Prinicpal</span>\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                    </button>\r\n");
      out.write("                    <h1><a class=\"navbar-brand\" href=\"../index.jsp\">");
out.print(empresa);
      out.write("<img src=\"../images/logo.png\" alt=\"\" width=\"50\"/><br><br>\r\n");
      out.write("                            <h6>");
out.print(logo);
      out.write("</h6>\r\n");
      out.write("                        </a></h1>\r\n");
      out.write("                </div>\t\r\n");
      out.write("                <div class=\"navbar-collapse collapse\">\r\n");
      out.write("                    <ul class=\"nav navbar-nav\">\r\n");
      out.write("                        <li class=\"active\">\r\n");
      out.write("                            <a href=\"../index.jsp\" title=\"Inicio\"><span data-hover=\"Inicio\">Inicio</span></a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"../quienes.jsp\" title=\"Quienes Somos\"><span data-hover=\"Quienes Somos\">Quienes Somos</span></a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"../mision.jsp\" title=\"Misión Visión\"><span data-hover=\"Misión Visión\">Misión Visión</span></a>\r\n");
      out.write("                        </li>\r\n");
      out.write("\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"../contactos.jsp\" title=\"Contactos\"><span data-hover=\"Contactos\">Contactos</span></a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li class=\"dropdown\">\r\n");
      out.write("                            <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\"><span data-hover=\"Servicios\">Servicios</span> <b class=\"caret\"></b></a>\r\n");
      out.write("                            <ul class=\"dropdown-menu\">\r\n");
      out.write("                                ");

                                    String user = (String) session.getAttribute("varUsuario");
                                    if (user != null) {
      out.write("\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <a href = \"../administracion/panela.jsp\" title = \"Panel de Administración\" > Panel de Administración</a> </li >\r\n");
      out.write("                                    ");
  } else {
      out.write("\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <a href=\"../acesso.jsp\" title=\"Acceder al sistema\">Acceder al sistema</a>\r\n");
      out.write("                                </li>\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <a href=\"rnuevop.jsp\" title=\"Crear una Cuenta\">Crear una Cuenta</a>\r\n");
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
      out.write("\r\n");
      out.write("        <br>\r\n");
      out.write("        <br>\r\n");
      out.write("        <br>\r\n");
      out.write("        <br>\r\n");
      out.write("\r\n");
      out.write("        <!-- Inicio de informacion -->\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("                <div class=\"col-md-12 centered\">\r\n");
      out.write("                    <h3><span>Nuevo Registro De Paciente</span></h3>\r\n");
      out.write("                    <p>Por favor entrege toda la información correcta para que pueda ser validada en el sistema caso contrario noo podra acceder a un cuenta.</p>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- fin de informacion -->\r\n");
      out.write("        <br>\r\n");
      out.write("        <br>\r\n");
      out.write("        <!-- inicio de formulario -->\r\n");
      out.write("        <div class=\"container content\">\r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("                <div class=\"col-md-9\">\r\n");
      out.write("                    <form  id=\"registro\" name=\"registro\" action=\"../procesos/nuevop.jsp\" method=\"POST\">\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <select autofocus required class=\"form-control\" name=\"tdocumento\" id=\"tdocumento\">\r\n");
      out.write("                                <option value=\"\">Selecione de tipo de documento de DNI</option>\r\n");
      out.write("                                <option value=\"true\">Nacional</option>\r\n");
      out.write("                                <option value=\"false\">Extranjero</option>\r\n");
      out.write("                            </select>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <input type=\"text\" required class=\"form-control\" id=\"dni\" name=\"dni\" placeholder=\"Ingrese su numero DNI de ciudadano\" onkeydown=\"return numeros(event)\" onchange=\"evaluar(registro)\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <input type=\"text\" required class=\"form-control\" id=\"nombres\" name=\"nombres\" placeholder=\"Ingrese sus nombres\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <input type=\"text\" required class=\"form-control\" id=\"apellidos\" name=\"apellidos\" placeholder=\"Ingrese sus apellidos\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <input type=\"email\" required class=\"form-control\" id=\"correo\" name=\"correo\" placeholder=\"Ingrese su correo electronico\" onchange=\"validare(registro);\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <input name=\"telefono\" type=\"text\" class=\"form-control\" id=\"telefono\" placeholder=\"Ingrese su  numero de telefono\" onkeydown=\"return numeros(event)\" maxlength=\"15\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <input name=\"celular\" type=\"text\" class=\"form-control\" id=\"celular\" placeholder=\"Ingrese su numero de celular\" onkeydown=\"return numeros(event)\" maxlength=\"15\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <input type=\"text\" required class=\"form-control\" id=\"direccion\" name=\"direccion\" placeholder=\"Ingrese su direccion donde vive actualmente\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <select name=\"sexo\" required class=\"form-control\" id=\"sexo\">\r\n");
      out.write("                                <option value=\"\">Seleccione el tipo de sexo</option>\r\n");
      out.write("                                <option value=\"true\">Masculino</option>\r\n");
      out.write("                                <option value=\"false\">Femenino</option>\r\n");
      out.write("                            </select>\r\n");
      out.write("                        </div>\r\n");
      out.write("\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <select name=\"year\" required class=\"form-control\" id=\"year\">\r\n");
      out.write("                                <option value selected=\"\">Seleccione el año de Nacimento</option>\r\n");
      out.write("                            </select>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <select name=\"month\" required class=\"form-control\" id=\"month\">\r\n");
      out.write("                                <option value=\"\" selected=\"\">Seleccione el mes de Nacimento</option>\r\n");
      out.write("                                <option value=\"1\">Enero</option>\r\n");
      out.write("                                <option value=\"2\">Febrero</option>\r\n");
      out.write("                                <option value=\"3\">Marzo</option>\r\n");
      out.write("                                <option value=\"4\">Abril</option>\r\n");
      out.write("                                <option value=\"5\">Mayo</option>\r\n");
      out.write("                                <option value=\"6\">Junio</option>\r\n");
      out.write("                                <option value=\"7\">Julio</option>\r\n");
      out.write("                                <option value=\"8\">Agosto</option>\r\n");
      out.write("                                <option value=\"9\">Septiembre</option>\r\n");
      out.write("                                <option value=\"10\">Octubre</option>\r\n");
      out.write("                                <option value=\"11\">Noviembre</option>\r\n");
      out.write("                                <option value=\"12\">Diciembre</option>\r\n");
      out.write("                            </select>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <select name=\"day\" required class=\"form-control\" id=\"day\">\r\n");
      out.write("                                <option value=\"\">Seleccione el dia de Nacimento</option>\r\n");
      out.write("                            </select>\r\n");
      out.write("                        </div>\r\n");
      out.write("\r\n");
      out.write("                        <div class=\"form-group\">\r\n");
      out.write("                            <input type=\"password\" required class=\"form-control\" id=\"clave\" name=\"clave\" placeholder=\"Ingrese su clave de acceso privada\" onchange=\"validarp(this.value, registro);\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <button type=\"submit\" class=\"btn btn-default btn-green\" name=\"enviar\" id=\"enviar\">Registrar</button>\r\n");
      out.write("                    </form>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <br>\r\n");
      out.write("        <br>\r\n");
      out.write("        <!-- fin del formulario -->\r\n");
      out.write("        \r\n");
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
      out.write(" Todos lo derechos Reservados. <a href=\"../index.jsp\">Diseñado: Grupo ");
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
      out.write("        <script src=\"../js/bootstrap.min.js\"></script>\r\n");
      out.write("        <script src=\"../js/carouFredSel.js\"></script>\r\n");
      out.write("        <script src=\"../js/jquery.stellar.min.js\"></script>\r\n");
      out.write("        <script src=\"../js/ekkoLightbox.js\"></script>\r\n");
      out.write("        <script src=\"../js/custom.js\"></script>\r\n");
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
