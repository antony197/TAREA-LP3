<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesion = request.getSession(true);
    Object username = sesion.getAttribute("username") == null ? null : sesion.getAttribute("username");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.1.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
        <script type="text/javascript" src="./js/main.js"></script>
        <style>
            
             body {
                background: url(../img/adminfondo.jpg)  center top;
                background-repeat: no-repeat;
                background-attachment: fixed
            }
            h1{
                color:white;
            }
            
           
        </style>
    </head>
    <body>
        <%            if (username != null && sesion.getAttribute("rango").equals(2)) {
                response.getWriter().print("Bienvenido " + username.toString());
            } else {
                response.getWriter().print("Acceso denegado");
                response.sendRedirect("index.jsp");
            }
        %>
    <center><h1>
            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-bag-fill" viewBox="0 0 16 16">
  <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5z"/>
</svg>
            NUEVO PRODUCTO
        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-bag-fill" viewBox="0 0 16 16">
  <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5z"/>
</svg>
        </h1></center>
        <div class="container" id="divCrearProducto">
            <center>
                <form id="newproduct" class="form-control" action="CrearProducto" method="post" style="width: 700px; height: 200px">
                    Nombre del nuevo producto:
                    <input type="Text" class="form-control" name="nombre" placeholder="Ingrese el Nombre"><br>
                    Foto:
                    <input type="file" class="form-control" name="foto" accept="image/png, .jpeg, .jpg, image/gif">
                    <br>
                    <input class="btn btn-success" type="submit" value="Guardar producto">
                    <a class="btn btn-info" href="infoProductos.jsp">Regresar</a>
                </form>
            </center>
        </div>
        
    </body>
</html>