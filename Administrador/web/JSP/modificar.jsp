<%-- 
    Document   : modificar
    Created on : 16 jun. 2024, 14:31:41
    Author     : Julieth
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.File" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Modificar Archivo</title>
    </head>
    <body>
        <h1>Modificar Archivo</h1>
        <form action="modificar.jsp" method="post" enctype="multipart/form-data">
            <label for="archivo">Nombre del archivo a modificar:</label>
            <input type="text" id="archivo" name="archivo" required><br><br>
            <label for="nuevoArchivo">Selecciona el nuevo archivo:</label>
            <input type="file" id="nuevoArchivo" name="nuevoArchivo" required><br><br>
            <input type="submit" value="Modificar">
        </form>

        <%
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String fileName = request.getParameter("archivo");
                String savePath = application.getRealPath("/archivos");
                File file = new File(savePath + File.separator + fileName);

                if (file.exists() && file.delete()) {
                    Part newFilePart = request.getPart("nuevoArchivo");
                    String newFileName = newFilePart.getSubmittedFileName();
                    newFilePart.write(savePath + File.separator + newFileName);
        %>
        <p>El archivo <%= fileName%> ha sido reemplazado por <%= newFileName%> con éxito.</p>
        <%
        } else {
        %>
        <p>No se pudo modificar el archivo <%= fileName%>. Verifique que el archivo exista.</p>
        <%
                }
            }
        %>
        <a href="../index.html">Volver al Panel de Administración</a>
    </body>
</html>

