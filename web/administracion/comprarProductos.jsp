<%@page import="administrativo.Proveedor"%>
<%@page import="administrativo.Proveedor"%>
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

    ArrayList<Producto> productos = gp.getTodos();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="./js/main.js"></script>
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
        <div class="container" id="divAddProduct">
            <form action="CrearCompra" id="compra" method="post" onsubmit="return validateForm();">
                <h2 class="text-center"> Comprar producto</h2>
                <table  class="table table-striped" border="1">
                    <thead>
                    <th class="text-center">Proveedor</th>
                    <th class="text-center">Fecha compra</th>
                    </thead>
                    <tr>
                        <td class="text-center"> <select name="proveedores" id="proveedores" required>
                                <%
                                    ArrayList<Proveedor> proveedores = gprov.getTodos();
                                    for (Proveedor prov : proveedores) {
                                %>
                                <option value="<%=prov.getId()%>"><%=prov.getNombre()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </td>
                        <td class="text-center">
                            <input name="fechacompra" type="date" required>
                        </td>
                        <!-- <td>
                            <input type="checkbox" name="credito" id="credito"> 
                        </td> -->
                    </tr>
                </table>
                <br>
                <br>
                <h2 class="text-center">Seleccion de producto</h2>
                <table class="table table-striped" id="addProduct" border="1" >
                    <thead>
                    <th class="text-center">Producto</th>
                    <th class="text-center">Precio compra</th>
                    <th class="text-center">Cantidad</th>
                    </thead>
                    <tr>
                        <td class="text-center">
                            <select name="products" id="products">
                                <%
                                    for (Producto prod : productos) {
                                %>
                                <option value="<%= prod.getId()%>"><%= prod.getNombre()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </td>
                        <td class="text-center"><input type="Number" id="precompra"  placeholder="Ingrese el Precio compra"></td>
                        <td class="text-center"><input type="number" id="canticompra"  placeholder="Ingrese cantidad"></td>
                    </tr>
                </table>
                <input type='hidden' id='cantidadFactura'  name="cantidadFactura" value='0'>
                <br>
                <h2 class="text-center">Factura</h2>
                <table class="table table-striped" id="totalProductos" border="1">
                    <thead>
                    <th>ID</th>
                    <th>Producto</th>
                    <th>Precio compra</th>
                    <th>Cantidad</th>
                    <th>subtotal</th>
                    </thead> 
                </table>
                <input type="submit" value="comprar">

            </form>
            <button onClick="agregarFila();">agregar producto</button>
            <button onClick="eliminarFila();">Eliminar producto</button>
        </div>
    </body>
</html>
