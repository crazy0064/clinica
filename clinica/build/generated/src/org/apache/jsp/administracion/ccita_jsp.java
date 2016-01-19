package org.apache.jsp.administracion;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Date;
import clases.MailSender;
import java.sql.ResultSet;
import clases.conexion;

public final class ccita_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");

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
        id = request.getParameter("id");
    }

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta charset=\"utf-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("        <title>");
out.print(empresa);
      out.write("</title>\r\n");
      out.write("        <link href=\"../assets/css/bootstrap.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"../assets/font-awesome/css/font-awesome.css\" rel=\"stylesheet\" />\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"../assets/css/zabuto_calendar.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"../assets/js/gritter/css/jquery.gritter.css\" />\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"../assets/lineicons/style.css\">   \r\n");
      out.write("        <link href=\"../assets/css/style.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"../assets/css/style-responsive.css\" rel=\"stylesheet\">\r\n");
      out.write("        <script src=\"../assets/js/chart-master/Chart.js\"></script>\r\n");
      out.write("        <script type=\"text/javascript\" src=\"../js/validar.js\"></script>\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("    <body>\r\n");
      out.write("\r\n");
      out.write("        <section id=\"container\" >\r\n");
      out.write("            <!--cabecera inicio-->\r\n");
      out.write("            <header class=\"header black-bg\">\r\n");
      out.write("                <div class=\"sidebar-toggle-box\">\r\n");
      out.write("                    <div class=\"fa fa-bars tooltips\" data-placement=\"right\" data-original-title=\"Menú de deslizamiento\"></div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <a href=\"#\" class=\"logo\"><b>");
out.print(empresa);
      out.write("</b></a>\r\n");
      out.write("                <div class=\"nav notify-row\" id=\"top_menu\">\r\n");
      out.write("                    <!--  inicio de notificaciones -->\r\n");
      out.write("                    <ul class=\"nav top-menu\">\r\n");
      out.write("                        <li class=\"dropdown\">\r\n");
      out.write("                            <a data-toggle=\"dropdown\" class=\"dropdown-toggle\" href=\"#\">\r\n");
      out.write("                                <i class=\"fa fa-tasks\"></i>\r\n");
      out.write("                                ");
rs = con.consulta("select count(*) from notas where estnota='true' and estvisto='false' and idpersona='" + idno + "'");
                                    while (rs.next()) {
                                
      out.write("\r\n");
      out.write("                                <span class=\"badge bg-theme\">");
out.print(rs.getString("count"));
      out.write("</span>\r\n");
      out.write("                            </a>\r\n");
      out.write("                            <ul class=\"dropdown-menu extended tasks-bar\">\r\n");
      out.write("                                <div class=\"notify-arrow notify-arrow-green\"></div>\r\n");
      out.write("                                <li>\r\n");
      out.write("\r\n");
      out.write("                                    <p class=\"green\">Tiene ");
out.print(rs.getString("count"));
      out.write(" Notificaciones</p>\r\n");
      out.write("                                    ");
}
      out.write("\r\n");
      out.write("                                </li>\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    ");
rs = con.consulta("select * from notas where estnota='true' and estvisto='false' and idpersona='" + idno + "' order by idnota desc limit 5");
                                        while (rs.next()) {
                                    
      out.write("\r\n");
      out.write("                                    <a href=\"../notificacion/nota.jsp?id=");
out.print(rs.getString("idnota"));
      out.write("\">\r\n");
      out.write("                                        <div class='task-info'>\r\n");
      out.write("                                            <div class=\"desc\">Notidicacion ");
out.print(rs.getString("idnota"));
      out.write("</div>\r\n");
      out.write("                                            <h7 class=\"green\">");
out.print(rs.getString("asunto"));
      out.write("</h7>\r\n");
      out.write("\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </a>\r\n");
      out.write("                                    ");
}
      out.write("  \r\n");
      out.write("                                </li>\r\n");
      out.write("                                <li class=\"external\">\r\n");
      out.write("                                    <a href=\"../notificacion/notificaciones.jsp\">Mostrar las Demas</a>\r\n");
      out.write("                                </li>\r\n");
      out.write("                            </ul>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <!-- Fin de notificaciones -->\r\n");
      out.write("                        <!-- inicio de mensajes-->\r\n");
      out.write("                        <li id=\"header_inbox_bar\" class=\"dropdown\">\r\n");
      out.write("                            <a data-toggle=\"dropdown\" class=\"dropdown-toggle\" href=\"index.html#\">\r\n");
      out.write("                                <i class=\"fa fa-envelope-o\"></i>\r\n");
      out.write("                                ");

                                    Date actual = new Date();
                                    rs = con.consulta("select count(*) from noticias where estado='true' and fecha='" + actual + "'");
                                    while (rs.next()) {
                                
      out.write("\r\n");
      out.write("                                <span class=\"badge bg-theme\">");
out.print(rs.getString("count"));
      out.write("</span>\r\n");
      out.write("                            </a>\r\n");
      out.write("                            <ul class=\"dropdown-menu extended inbox\">\r\n");
      out.write("                                <div class=\"notify-arrow notify-arrow-green\"></div>\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <p class=\"green\">Tiene ");
out.print(rs.getString("count"));
      out.write(" noticias actuales</p>\r\n");
      out.write("                                </li>\r\n");
      out.write("                                ");
}
      out.write("\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    ");

                                        rs = con.consulta("select * from noticias where estado='true' and fecha='" + actual + "' limit 5");
                                        while (rs.next()) {
                                    
      out.write("\r\n");
      out.write("                                    <a href=\"../notificacion/noticia.jsp?id=");
out.print(rs.getString("id_noticia"));
      out.write("\">\r\n");
      out.write("                                        <span class=\"photo\"><img  src=\"..");
out.print(rs.getString("imagen"));
      out.write("\"></span>\r\n");
      out.write("                                        <span class=\"subject\">\r\n");
      out.write("                                            <span class=\"from\">");
out.print(rs.getString("titulo").substring(0, 28));
      out.write("</span>\r\n");
      out.write("\r\n");
      out.write("                                        </span>\r\n");
      out.write("                                        <span class=\"message\">\r\n");
      out.write("                                            ");
out.print(rs.getString("encabezado").substring(0, 33));
      out.write("\r\n");
      out.write("                                        </span>\r\n");
      out.write("                                        <span class=\"time\">Leer Noticia</span>\r\n");
      out.write("                                    </a>\r\n");
      out.write("                                    ");
}
      out.write("\r\n");
      out.write("                                </li>\r\n");
      out.write("                                <li>\r\n");
      out.write("                                    <a href=\"../notificacion/noticias.jsp\">Mostrar las demas noticias</a>\r\n");
      out.write("                                </li>\r\n");
      out.write("                            </ul>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <!-- fin de mensajes -->\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"top-menu\">\r\n");
      out.write("                    <ul class=\"nav pull-right top-menu\">\r\n");
      out.write("                        <li><a class=\"logout\" href=\"../procesos/cerrar.jsp\">Salir del Sistema</a></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div>\r\n");
      out.write("            </header>\r\n");
      out.write("            <!--fin de cabecera-->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <!--Informacion del usuario y menu-->\r\n");
      out.write("            <aside>\r\n");
      out.write("                <div id=\"sidebar\"  class=\"nav-collapse \">\r\n");
      out.write("                    <ul class=\"sidebar-menu\" id=\"nav-accordion\">\r\n");
      out.write("\r\n");
      out.write("                        <p class=\"centered\"><a href=\"../administracion/foto.jsp\"><img src=\"..");
 out.print(foto); 
      out.write("\" class=\"img-circle\" width=\"60\"></a></p>\r\n");
      out.write("                        <h5 class=\"centered\">");
 out.print(nom + " " + apel);
      out.write("</h5>\r\n");
      out.write("                        ");

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
                        
      out.write("\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div>\r\n");
      out.write("            </aside>\r\n");
      out.write("            <!--fin de usuario y menu-->\r\n");
      out.write("\r\n");
      out.write("            <!--inicio de contenido-->\r\n");
      out.write("            <section id=\"main-content\">\r\n");
      out.write("                <section class=\"wrapper\">\r\n");
      out.write("                    <center><h4><i class=\"fa fa-refresh\"></i>Actualizar estado de pago</h4></center>\r\n");
      out.write("                    <div class=\"row mt\">\r\n");
      out.write("\r\n");
      out.write("                        <div class=\"col-lg-12\">\r\n");
      out.write("                            <div class=\"form-panel\">\r\n");
      out.write("                                <br> \r\n");
      out.write("                                <form action=\"\" id=\"ccita\" name=\"ccita\" method=\"post\">\r\n");
      out.write("\r\n");
      out.write("                                    <div class=\"form-group\">\r\n");
      out.write("\r\n");
      out.write("                                        ");

                                            rs = con.consulta("select * from citas where idcita='" + id + "'");
                                            while (rs.next()) {
                                        
      out.write("\r\n");
      out.write("                                        <select name=\"estpago\" class=\"form-control\" id=\"estpago\" >\r\n");
      out.write("                                            <option value=\"");
 out.print(rs.getString("estpago")); 
      out.write('"');
      out.write('>');
 out.print(rs.getString("estpago"));
      out.write("</option>\r\n");
      out.write("                                            <option value=\"Pendiente\">Pendiente</option>\r\n");
      out.write("                                            <option value=\"Pagado\">Pagado</option>\r\n");
      out.write("                                            <option value=\"Anulado\">Anulado</option>\r\n");
      out.write("                                        </select>\r\n");
      out.write("                                        ");
}
      out.write("\r\n");
      out.write("                                    </div>\r\n");
      out.write("\r\n");
      out.write("                                    <br>\r\n");
      out.write("\r\n");
      out.write("                                    <button type=\"submit\" class=\"btn btn-default btn-lg btn-block\" name=\"confi\" id=\"confi\">Cambiar estado</button>\r\n");
      out.write("                                </form>\r\n");
      out.write("                                ");

                                    if (request.getParameter("confi") != null) {
                                        String esta = request.getParameter("estpago");
                                        con.consulta("update citas set estpago='" + esta + "' where idcita='" + id + "'");
                                        rs = con.consulta("select * from personas p, citas c where idcita='" + id + "' and c.paciente=p.dni");
                                        String correo = "";
                                        while (rs.next()) {
                                            correo = rs.getString("correo");
                                        }
                                        MailSender ms = new MailSender();
                                        ms.mensaje("Su deuda esta en un estado: " + esta);
                                        ms.para(correo);
                                        ms.SendMail();
                                        out.print("<script>alert('Actualizacion correcta');</script>");
                                        out.println("<script language='javascript'>window.location='../administracion/listarcitasp.jsp'</script>;");
                                    }

                                
      out.write("\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>  \r\n");
      out.write("                </section>\r\n");
      out.write("            </section>\r\n");
      out.write("\r\n");
      out.write("        </section>\r\n");
      out.write("\r\n");
      out.write("        <!-- Plugin utilizados a iniciar -->\r\n");
      out.write("        <script src=\"../assets/js/jquery.js\"></script>\r\n");
      out.write("        <script src=\"../assets/js/jquery-1.8.3.min.js\"></script>\r\n");
      out.write("        <script src=\"../assets/js/bootstrap.min.js\"></script>\r\n");
      out.write("        <script class=\"include\" type=\"text/javascript\" src=\"../assets/js/jquery.dcjqaccordion.2.7.js\"></script>\r\n");
      out.write("        <script src=\"../assets/js/jquery.scrollTo.min.js\"></script>\r\n");
      out.write("        <script src=\"../assets/js/jquery.nicescroll.js\" type=\"text/javascript\"></script>\r\n");
      out.write("        <script src=\"../assets/js/jquery.sparkline.js\"></script>\r\n");
      out.write("        <script src=\"../assets/js/common-scripts.js\"></script>\r\n");
      out.write("        <script type=\"text/javascript\" src=\"../assets/js/gritter/js/jquery.gritter.js\"></script>\r\n");
      out.write("        <script type=\"text/javascript\" src=\"../assets/js/gritter-conf.js\"></script>\r\n");
      out.write("        <script src=\"../assets/js/sparkline-chart.js\"></script>    \r\n");
      out.write("        <script src=\"../assets/js/zabuto_calendar.js\"></script>\t\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
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
