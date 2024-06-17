<%-- 
    Document   : lista
    Created on : 16 jun. 2024, 15:53:27
    Author     : Julieth
--%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Listado de Archivos</title>
        <link rel="stylesheet" href="../CSS/lista.css">
    </head>
    <body>
        <div class="container">
            <h1>Listado de Archivos en la Carpeta</h1>

            <ul id="file-list">
                
                <%
                    // Ruta de la carpeta a listar (puedes cambiarla por la que necesites)
                    String rutaCarpeta = "D:\\SimposioData\\Archivos";

                    // Crear un objeto File para la carpeta
                    File carpeta = new File(rutaCarpeta);

                    // Verificar si es una carpeta y si existe
                    if (carpeta.isDirectory() && carpeta.exists()) {
                        // Obtener la lista de archivos y carpetas dentro de la carpeta
                        File[] archivos = carpeta.listFiles();

                        // Iterar sobre la lista de archivos
                        for (File archivo : archivos) {
                %>
                <li>
                    <div class="file-info">
                        <span class="file-name"><%= archivo.getName()%></span>
                        <span class="file-size"><%= String.format("%.2f KB", (double) archivo.length() / 1024)%></span>
                    </div>
                </li>
                <%
                    }
                } else {
                %>
                <li><p>La carpeta especificada no existe o no es válida.</p></li>
                    <%
                        }
                    %>
            </ul>
        </div>
    </body>
</html>
