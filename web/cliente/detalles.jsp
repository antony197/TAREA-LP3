<%@page import="administrativo.Producto"%>
<%@page import="gestion.GestionProducto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(true);
    Object username = sesion.getAttribute("username") == null ? null : sesion.getAttribute("username");

    int idProd = Integer.parseInt(request.getParameter("id"));
    GestionProducto gp = new GestionProducto();
    Producto prod = gp.getProducto(idProd);


%>
<%    if (username != null && sesion.getAttribute("rango").equals(1)) {
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
                background: url(../img/FONDO2.jpg);               
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
            <h1>Detalles del producto</h1>
            <div class="row">
                <div class="col-sm-4" >
                    <center>
                        <hr>  
                        <hr>
                        <hr>  
                        <image  src="../imgprodu/<%= prod.getNombreFoto()%>" width="300" height="300">
                    </center>
                </div>
                <div class="col-sm-8">
                    <hr>
                    <form action="AgregaCarrito" method="post"  style="width: 500px; height: 400px">
                        IdProducto:
                        <input type="number" readonly="" name="id" class="form-control" value="<%= idProd%>"/>
                        Nombre del producto:
                        <input type="text" readonly name="nombre" class="form-control" value="<%= prod.getNombre()%>"/><br>
                        Precio:
                        <input type="text" readonly name="precio" class="form-control" value="S/ <%= prod.getPrecioVenta()%>"/>
                        <br>
                        Cantidad disponible
                        <input type="number" readonly name="disponible" class="form-control" value="<%= prod.getExistencias()%>"/>
                        <br>
                        Cantidad a llevar
                        <input type="number" min="1" max="<%=prod.getExistencias()%>"  name="cantidad" class="form-control" value="0"/>
                        <br>
                        <button type="submit"  class="btn btn-success ">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16">
                            <path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z"/>
                            <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                            </svg>
                            Agregar al carrito
                        </button>
                        <a href="productos.jsp" class="btn btn-primary ">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-left-circle-fill" viewBox="0 0 16 16">
                            <path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zm3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
                            </svg>
                            Regresar           
                        </a>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>