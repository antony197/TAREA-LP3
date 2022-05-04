<%@page import="administrativo.Venta"%>
<%@page import="gestion.GestionVenta"%>
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
    if (username != null && sesion.getAttribute("rango").equals(1)) {
        response.getWriter().print("Bienvenido " + username.toString());
    } else {
        response.getWriter().print("Acceso denegado");
        response.sendRedirect("index.jsp");
    }
    int idCompra = Integer.parseInt(request.getParameter("id"));
    GestionProducto gp = new GestionProducto();

    GestionProveedor gprov = new GestionProveedor();
    GestionVenta gv = new GestionVenta();
    Venta com = gv.getVenta(idCompra);
    ArrayList<Producto> detalles = gv.getProductosVenta(idCompra);

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
        <style>
            body {
                background: url(../img/clientefondo.jpg)  center top;
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
            h1 {
                font-size: 30px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Detalles de Factura Nro <%= idCompra%></h1>
            <table class="table table-bordered" border="1">
                <thead>
                <th class="text-center">ID COMPRA</th>
                <th class="text-center">Comprador</th>
                <th class="text-center"> Total</th>
                <th class="text-center">Fecha</th>
                </thead>
                <tr>
                    <td class="text-center"><%= com.getId()%></td>
                    <td class="text-center"><%= com.getIdUsuario()%></td>
                    <td class="text-center"><%= com.getTotal()%></td>
                    <td class="text-center"><%= com.getFecha()%></td>
                </tr>
            </table>
            <br>
            <br>
            <table class="table table-bordered" border="1">
                <thead>
                <th class="text-center">Producto</th>
                <th class="text-center">Precio Unitario</th>
                <th class="text-center"> Cantidad</th>
                <th class="text-center">Total</th>

                </thead>
                <%
                    for (Producto prods : detalles) {%>
                <tr>
                    <td class="text-center"><%= prods.getNombre()%></td>
                    <td class="text-center"><%= prods.getPrecioCompra()%></td>
                    <td class="text-center"><%= prods.getExistencias()%></td>
                    <td class="text-center"><%= (prods.getPrecioCompra() * prods.getExistencias())%></td>
                </tr>
                <%
                    }
                %>
            </table>
            <br>
            <br>
            <a class="btn btn-success" href="productos.jsp">Regresar</a>
        </div>
    </body>
</html>
