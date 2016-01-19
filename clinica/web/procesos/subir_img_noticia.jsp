<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="clases.conexion"%>
<%
    conexion con = new conexion();
    String user = (String) session.getAttribute("varUsuario");
    String id=request.getParameter("id");
    String destination = "/imgn/";
    String destinationRealPath = application.getRealPath(destination);

    DiskFileItemFactory factory = new DiskFileItemFactory();
    factory.setSizeThreshold(1024);

    factory.setRepository(new File(destinationRealPath));

    ServletFileUpload uploader = new ServletFileUpload(factory);

    try {
        List items = uploader.parseRequest(request);
        Iterator iterator = items.iterator();

        while (iterator.hasNext()) {
            FileItem item = (FileItem) iterator.next();
            File file = new File(destinationRealPath, item.getName());
            item.write(file);
            con.consulta("update noticias set imagen='" + destination + "" + item.getName() + "' where id_noticia='"+id+"'");
            out.println("<script>alert('Noticia Publicada');</script>");
            out.println("<script language='javascript'>window.location='../administracion/panela.jsp'</script>;");
        }
    } catch (FileUploadException e) {
        out.println("<script>alert('Se ha producido un error Interno Upload');</script>");
        out.println("<script language='javascript'>window.location='../administracion/panela.jsp'</script>;");

    } catch (FileNotFoundException f) {
        out.println("<script>alert('Se ha producido un error Interno NotFound');</script>");
        out.println("<script language='javascript'>window.location='../administracion/panela.jsp'</script>;");

    }


%>
