<%@page import="java.io.FileNotFoundException"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="clases.conexion"%>
<%
    conexion con = new conexion();
    String user = request.getParameter("id");
    String destination = "/img/";
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
            con.consulta("update citas set foto='" + destination + "" + item.getName() + "' where idcita='" + user + "'");
            out.println("<script>alert('Se ha Subido Exitosamente');</script>");
            out.println("<script language='javascript'>window.location='../administracion/fotot.jsp?id=" + user + "'</script>;");

        }
    } catch (FileUploadException e) {
        out.println("<script>alert('Se ha producido un error Interno');</script>");
        out.println("<script language='javascript'>window.location='../administracion/fotot.jsp?id=" + user + "'</script>;");

    } catch (FileNotFoundException f) {
        out.println("<script>alert('Se ha producido un error Interno');</script>");
        out.println("<script language='javascript'>window.location='../administracion/fotot.jsp?id=" + user + "'</script>;");

    }


%>
