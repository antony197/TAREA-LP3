<%@page import="java.util.ArrayList"%>
<%@page import="administrativo.Producto"%>
<%@page import="administrativo.Compra"%>
<%@page import="gestion.GestionProducto"%>
<%@page import="gestion.GestionProveedor"%>
<%@page import="gestion.GestionCompra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(true);
    Object username = sesion.getAttribute("username") == null ? null : sesion.getAttribute("username");
    if (username != null && sesion.getAttribute("rango").equals(2)) {
        //response.getWriter().print("Bienvenido " + username.toString());
    } else {
        response.getWriter().print("Acceso denegado");
        response.sendRedirect("index.jsp");
    }
    int idCompra = Integer.parseInt(request.getParameter("id"));
    GestionProducto gp = new GestionProducto();

    GestionProveedor gprov = new GestionProveedor();
    GestionCompra gcompra = new GestionCompra();
    Compra com = gcompra.getCompra(idCompra);
    ArrayList<Producto> detalles = gcompra.getProductosCompra(idCompra);
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
            <h1>Factura de Compra Nro <%= idCompra%></h1>
            <table class="table table-bordered" border="1">
                <thead>
                <th>ID COMPRA</th>
                <th>Proveedor</th>
                <th> Total</th>
                <th>Fecha</th>
                
                </thead>
                <tr>
                    <td><%= com.getId()%></td>
                    <td><%= com.getIdproveedor()%></td>
                    <td><%= com.getTotal()%></td>
                    <td><%= com.getFecha()%></td>
                    
                </tr>
            </table>
            <br>
            <br>
            <table class="table table-bordered" border="1">
                <thead>
                <th>Producto</th>
                <th>Precio Unitario</th>
                <th> Cantidad</th>
                <th>Total</th>
                </thead>
                <% for (Producto prods : detalles) {%>
                <tr>
                    <td><%= prods.getNombre()%></td>
                    <td><%= prods.getPrecioCompra()%></td>
                    <td><%= prods.getExistencias()%></td>
                    <td><%= (prods.getPrecioCompra() * prods.getExistencias())%></td>
                </tr>
                <%
                    }
                %>
            </table>
            <br>
            <br>
            <a class="btn btn-success" href="infoProductos.jsp">Regresar</a>
        </div>
    </body>
</html>
