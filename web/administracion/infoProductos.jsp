<%@page import="java.util.ArrayList"%>
<%@page import="administrativo.Producto"%>
<%@page import="gestion.GestionCompra"%>
<%@page import="gestion.GestionProveedor"%>
<%@page import="gestion.GestionProducto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(true);
    Object username = sesion.getAttribute("username") == null ? null : sesion.getAttribute("username");
    
    GestionProducto gp = new GestionProducto();
    GestionProveedor gprov = new GestionProveedor();
    GestionCompra gcompra = new GestionCompra();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style>
            body {
                background: url(../img/adminfondo.jpg)  center top;
                background-repeat: no-repeat;
                background-attachment: fixed
            }
            table{
                background-color: white;
            }
            div{
                background-color:rgba(255,255,255,0.6);
            }
            h1{
                color: white;
            }
        </style>
    </head>
    <body>
        <h1>Bienvenido <%=username%></h1>
        <div  class="container text-center">
            <a  class="btn btn-info" href="infoProductos.jsp">Lista de Productos</a>
            <a  class="btn btn-info" href="comprarProductos.jsp">Comprar Producto</a>
            <a  class="btn btn-info" href="Facturas.jsp">Facturas</a>
            <a  class="btn btn-info" href="newProduct.jsp">Nuevo Producto</a>
            <a  class="btn btn-info" href="newProveedor.jsp">Nuevo Proveedor</a>
            <a  class="btn btn-danger" href="logout">Cerrar Sesion</a>
        </div>
        <div  class="container" id="divControlProducto">
            <h1> Control Producto</h1>
            <table class="table" id="controlProducto" >
                <thead>
                <th class="text-center">FOTO</th>
                <th class="text-center">ID PRODUCTO</th>
                <th class="text-center">Nombre</th>
                <th class="text-center">Precio compra</th>
                <th class="text-center">Precio venta</th>
                <th class="text-center">Existencias</th>
                <th class="text-center">Acciones</th>
                </thead>
                <%  
                    ArrayList<Producto> productos = gp.getTodos();
                    for (Producto prod : productos) {
                %>
                <tr>
                    <td class="text-center"><image src="../imgprodu/<%= prod.getNombreFoto()%>" width="100" height="100"></td>
                    <td class="text-center"><%= prod.getId()%></td>
                    <td class="text-center"><%= prod.getNombre()%></td>
                    <td class="text-center"><%= prod.getPrecioCompra()%></td>
                    <td class="text-center"><%= prod.getPrecioVenta()%></td>
                    <td class="text-center"><%= prod.getExistencias()%></td>
                    
                    <td class="text-center">
                        <a class="btn btn-warning" href="modificar.jsp?id=<%= prod.getId()%>&nombre=<%= prod.getNombre()%>&precioVenta=<%= prod.getPrecioVenta()%>">Modificar</a>
                        <a class="btn btn-warning" href="EliminarProducto?id=<%= prod.getId()%>">Eliminar</a></td>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </body>
</html>
