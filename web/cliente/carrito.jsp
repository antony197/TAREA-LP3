<%@page import="java.util.ArrayList"%>
<%@page import="administrativo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><%
    HttpSession sesion = request.getSession(true);
    Object username = sesion.getAttribute("username") == null ? null : sesion.getAttribute("username");
    ArrayList<Producto> cart;
    cart = (ArrayList<Producto>) session.getAttribute("cart");

    if (username != null && sesion.getAttribute("rango").equals(1)) {
        response.getWriter().print("Bienvenido " + username);
    } else {

        response.sendRedirect("index.jsp");
    }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
        <style>
            body {
                background: url(../img/carrito.jpg);               
                width:100%;
                height:100%;
                margin:0;
                border:0;
                padding:0;    
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
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
        <div  class="container" id="divControlProducto">

            <br>

            <h1 align="center">
                <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                </svg>
                CARRITO 
                <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                </svg>

            </h1>
            <table class="table" id="controlProducto" >
                <thead>
                <th class="text-center">Foto</th>
                <th class="text-center">IdProducto</th>
                <th class="text-center">Nombre</th>
                <th class="text-center">Precio venta</th>
                <th class="text-center">Cantidad</th>
                <th class="text-center">Acciones</th>
                </thead>
                <%                    
                    for (Producto prod : cart) {
                %>
                <tr>
                    <td class="text-center"><image src="../imgprodu/<%= prod.getNombreFoto()%>" width="100" height="100"></td>
                    <td class="text-center"><%= prod.getId()%></td>
                    <td class="text-center"><%= prod.getNombre()%></td>

                    <td class="text-center"><%= prod.getPrecioVenta()%></td>
                    <td class="text-center"><%= prod.getExistencias()%></td>
                    <td class="text-center"><a class="btn btn-danger" href="EliminarCarrito?id=<%= prod.getId()%>">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                            <path d="M1.293 1.293a1 1 0 0 1 1.414 0L8 6.586l5.293-5.293a1 1 0 1 1 1.414 1.414L9.414 8l5.293 5.293a1 1 0 0 1-1.414 1.414L8 9.414l-5.293 5.293a1 1 0 0 1-1.414-1.414L6.586 8 1.293 2.707a1 1 0 0 1 0-1.414z"/>
                            </svg>
                            Eliminar

                        </a></td>
                </tr>
                <% }%>
            </table>
            <form action="CrearVenta" method="POST">
                <%--      Credito :<input type="checkbox" name="credito"><br><br>
                     
          <input type="submit" class='btn btn-success' value='comprar'>
                --%>

                <button type="submit" class='btn btn-success' value='comprar'>
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
                    <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z"/>
                    </svg>
                    Comprar
                </button>
            </form>
            <br>
            <a href="productos.jsp" class="btn btn-info">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-left-circle-fill" viewBox="0 0 16 16">
                <path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zm3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
                </svg>
                Regresar           
            </a>
        </div>
    </body>
</html>