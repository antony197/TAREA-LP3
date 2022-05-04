<%@page import="administrativo.Producto"%>
<%@page import="gestion.GestionProducto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(true);
    Object username = sesion.getAttribute("username") == null ? null : sesion.getAttribute("username");

    int idProd = Integer.parseInt(request.getParameter("id"));
    String nombre = request.getParameter("nombre");
    float precom = Float.parseFloat(request.getParameter("precioVenta"));
    GestionProducto gp = new GestionProducto();
    Producto prod = gp.getProducto(idProd);
%>
<%
    if (username != null && sesion.getAttribute("rango").equals(2)) {
        response.getWriter().print("Bienvenido " + username.toString());
    } else {
        response.getWriter().print("Acceso denegado");
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
        <style>
            body {
                background: url(../img/adminfondo.jpg);               
                width:100%;
                height:100%;
                margin:0;
                border:0;
                padding:0;    
            }
            table{
                background-color: white;
            }
            div{
                background-color:rgba(255,255,255,0.6);
            }
            font{
                font-size:30px;
                font-face:verdana;
                color:white;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-4" >
                    <center>
                        <hr>  
                        <hr>
                        <hr>  
                        <image  src="../imgprodu/<%= prod.getNombreFoto()%>" width="300" height="300">
                    </center>
                </div>
                <div class="col-sm-4">
                    <h1>Modificar Producto</h1>
                    <hr>
                    <form action="ModificarProducto" method="post" class="form-control" style="width: 500px; height: 400px">
                        ID:
                        <input type="number" readonly="" name="id" class="form-control" value="<%= idProd%>"/>
                        Nombre del producto:
                        <input type="text" name="nombre" class="form-control" value="<%= nombre%>"/><br>
                        Precio Venta:
                        <input type="text" name="precio" class="form-control" value="<%= precom%>"/>
                        <br>
                        <input type="submit" value="Guardar" class="btn btn-success "/>
                        <a href="infoProductos.jsp">Regresar</a>
                    </form>
                </div>
            </div>
        </div>       
    </body>
</html>
