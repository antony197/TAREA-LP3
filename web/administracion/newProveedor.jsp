<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(true);
    Object username = sesion.getAttribute("username") == null ? null : sesion.getAttribute("username");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.1.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
        <script type="text/javascript" src="./js/manejoproveedor.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="./css/newProveedor.css">
    </head>
    <body>
        <%            if (username != null && sesion.getAttribute("rango").equals(2)) {
                response.getWriter().print("Bienvenido " + username.toString());
            } else {
                response.getWriter().print("Acceso denegado");
                response.sendRedirect("index.jsp");
            }
        %>
       <div id="divCrearProveedor" class="Registro">
           <form id="newproveedor" action="CrearProveedor" method="post">
            <table id="newProveedor" >
                <thead>
                    <th>Nombre proveedor</th>
                </thead>
                <tr>
                    <td><input type="Text" name="nombre" placeholder="Ingrese el Nombre" class="text"></td>
                </tr>
            </table>
            <input type="submit" value="Guardar proveedor" class="enviar">
        </form>
    </div>
    <br>
    <br>
    <a href="infoProductos.jsp" class="Volver">Regresar</a>
    </body>
</html>