package org.apache.jsp.registros;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import clases.conexion;

public final class modregistrop_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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
      out.write("<!doctype html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta charset=\"utf-8\">\r\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("        <title>Odontologia</title>\r\n");
      out.write("        <link href=\"../css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"../css/style.css\" rel=\"stylesheet\">\r\n");
      out.write("        <script>\r\n");
      out.write("            function fecha() {\r\n");
      out.write("                var lista = document.getElementById(\"day\");\r\n");
      out.write("                var lista1 = document.getElementById(\"year\");\r\n");
      out.write("                var today = new Date();\r\n");
      out.write("                var aÃ±o = today.getFullYear();\r\n");
      out.write("                for (i = 1; i < 32; i++) {\r\n");
      out.write("                    lista.options.add(new Option(i, i));\r\n");
      out.write("                }\r\n");
      out.write("                for (i = 0; i < 150; i++) {\r\n");
      out.write("                    lista1.options.add(new Option(aÃ±o, aÃ±o));\r\n");
      out.write("                    aÃ±o--;\r\n");
      out.write("                }\r\n");
      out.write("\r\n");
      out.write("            }\r\n");
      out.write("        </script>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body class=\"contentpage\" onload=\"fecha();\">\r\n");
      out.write("        <!-- Navigacion del menu inicio -->\r\n");
      out.write("        <div class=\"navbar navbar-default navbar-fixed-top affix inner-pages\" role=\"navigation\">\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <div class=\"navbar-header\">\r\n");
      out.write("                    <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-collapse\">\r\n");
      out.write("                        <span class=\"sr-only\">Toggle navigation</span>\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                    </button>\r\n");
      out.write("                    <h1><a class=\"navbar-brand\" href=\"index.html\">Odontologia Dental <img src=\"../images/logo.jpg\" alt=\"\" width=\"50\"/><br><br>\r\n");
      out.write("                            <h6>Cuidamos tu sonrisa odontologos con la mas alta capacidad profesional</h6>\r\n");
      out.write("                        </a></h1>\r\n");
      out.write("                </div>\t\r\n");
      out.write("                <div class=\"navbar-collapse collapse\">\r\n");
      out.write("                    <ul class=\"nav navbar-nav\">\r\n");
      out.write("                        <li class=\"active\">\r\n");
      out.write("                            <a href=\"../index.html\" title=\"Inicio\"><span data-hover=\"Inicio\">Inicio</span></a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"../quienes.html\" title=\"Quienes Somos\"><span data-hover=\"Quienes Somos\">Quienes Somos</span></a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"../mision.html\" title=\"MisiÃ³n VisiÃ³n\"><span data-hover=\"MisiÃ³n VisiÃ³n\">MisiÃ³n VisiÃ³n</span></a>\r\n");
      out.write("                        </li>\r\n");
      out.write("\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"../contactos.html\" title=\"Contactos\"><span data-hover=\"Contactos\">Contactos</span></a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li class=\"dropdown\">\r\n");
      out.write("                            <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\"><span data-hover=\"Servicios\">Servicios</span> <b class=\"caret\"></b></a>\r\n");
      out.write("                            <ul class=\"dropdown-menu\">\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <a href=\"../acesso.html\" title=\"Acesso al sistema\">Acesso al sistema</a>\r\n");
      out.write("                                </li>\r\n");
      out.write("                            </ul>\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- Navigacion del menu final -->\r\n");
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
      out.write("                    <p>Por favor entrege toda la informaciÃ³n correcta para que pueda ser validada en el sistema caso contrario noo podra acceder a un cuenta.</p>\r\n");
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
      out.write("                    ");

                        String id = request.getParameter("id");
                        conexion con = new conexion();
                        ResultSet rs = con.consulta("select * from personas where dni='" + id + "'");
                        while (rs.next()) {
                            out.print("<form  id='registro' name='registro' action='../procesos/moregistrop.jsp?id="+rs.getString("dni")+"' method='POST'>");
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
                            out.print("      <input type='email' class='form-control' id='correo' name='correo' placeholder='Ingrese su correo electronico' onchange='validare(registro);' value='" + rs.getString("correo") + "'>");
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
                            String leer = "", aï¿½o = "", mes = "", dia = "", mes1 = "";
                            for (int i = 0; i < rs.getString("fnacimiento").length(); i++) {
                                leer = leer + rs.getString("fnacimiento").substring(i, i + 1);
                                if (i == 3) {
                                    i++;
                                    aï¿½o = leer;
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
                            out.print("     <option value='" + aï¿½o + "'>" + aï¿½o + "</option>");
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
                    
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <br>\r\n");
      out.write("        <br>\r\n");
      out.write("        <!-- fin del formulario -->\r\n");
      out.write("\r\n");
      out.write("        <!-- Pie de pagina inicio -->\r\n");
      out.write("        <div class=\"footer\">\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-md-3\">\r\n");
      out.write("                        <h6>Acerca de Nosotros</h6>\r\n");
      out.write("                        <p>Estamos comprometidos con la excelencia en todas las facetas de este arte y ciencia. Estamosn orgullosos de la calidad de nuestro trabajo, utilizando los mejores materiales disponibles. Trabajamos con tÃ©cnicos protÃ©sicos y artistas dentales altamente preparados, que siguen nuestro compromiso por la excelencia.</p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-md-3\">\r\n");
      out.write("                        <h6>Valores de la InstituciÃ³n</h6>\r\n");
      out.write("                        <p>Trabajo en equipo Ã¡gil y multidisciplinar</p>\r\n");
      out.write("                        <p>Trato humano y personalizado</p>\r\n");
      out.write("                        <p>AtenciÃ³n global de la persona</p>\r\n");
      out.write("                        <p>Compromiso con la sociedad</p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-md-3\">\r\n");
      out.write("                        <h6>Mapa de sitio:</h6>\r\n");
      out.write("                        <ul>\r\n");
      out.write("                            <li><a href=\"index.html\" title=\"\">Inicio</a></li>\r\n");
      out.write("                            <li><a href=\"contactos.html\" title=\"\">Contactos</a></li>\r\n");
      out.write("                            <li><a href=\"quienes.html\" title=\"\">Terminos y condiciones</a></li>\r\n");
      out.write("                            <li><a href=\"politicas.html\" title=\"\">Politicas de Privacidad</a></li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-md-3 contact-info\">\r\n");
      out.write("                        <h6>InformaciÃ³n  de la Institucion</h6>\r\n");
      out.write("                        <p>Toda la informacion se entrega para contactos a la instituciÃ³n por parte de la Dra. Gulnara Obando V.</p>\r\n");
      out.write("                        <p class=\"social\">\r\n");
      out.write("                            <a href=\"#\" class=\"facebook\"></a> <a href=\"#\" class=\"pinterest\"></a> <a href=\"#\" class=\"twitter\"></a>\r\n");
      out.write("                        </p>\r\n");
      out.write("                        <p class=\"c-details\">\r\n");
      out.write("                            <span>Email </span>odontologiadental@hotmail.com<br >\r\n");
      out.write("                            <span>TelÃ©f</span> 2 365-069</p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-md-12 copyright\">\r\n");
      out.write("                        <p>&copy;  Copyright 2015 Odontologia Dental Todos lo derechos Reservados. <a href=\"index.html\">DiseÃ±ado: Grupo Odontologia Dental</a></p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- termina pie de pagina -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <!-- Javascript plugins -->\r\n");
      out.write("        <script src=\"https://code.jquery.com/jquery.js\"></script>\r\n");
      out.write("        <script src=\"../js/bootstrap.min.js\"></script>\r\n");
      out.write("        <script src=\"../js/carouFredSel.js\"></script>\r\n");
      out.write("        <script src=\"../js/jquery.stellar.min.js\"></script>\r\n");
      out.write("        <script src=\"../js/custom.js\"></script>\r\n");
      out.write("        <script src=\"../js/jquery-ui.min.js\"></script>\r\n");
      out.write("\r\n");
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
