<%@page import="administrativo.Compra"%>
<%@page import="administrativo.Compra"%>
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
            <a  class="btn btn-info" href="moduloPagos.jsp">Modulos de Pago</a>
            <a  class="btn btn-danger" href="logout">Cerrar Sesion</a>
        </div>
        <div class="container" id="divPagosFacturas">
            <br>
            <h1> Modulo Pagos</h1>
            <div syle="padding-left:400px">
                <form action="panel.jsp" method="POST">
                    <p>buscar factura desde
                        <input class="form-control" type="date" name="fechaInicioFacturacion">
                        hasta
                        <input class="form-control" type="date" name="fechaFinalFacturacion">
                        <input class="btn btn-success btn-sm" type="submit" value="Buscar">
                        <a class="btn btn-danger btn-sm" href="panel.jsp">Regresar</a>
                    </p>
                </form>
            </div>
            <table class="table table-bordered" id="facturas" border="1">
                <thead>
                <th  class="text-center">Numero de factura</th>
                <th class="text-center">Fecha</th>
                <th class="text-center">Total</th>
                <th class="text-center">Abono</th>
                <th class="text-center">Restante</th>
                <th class="text-center">Acciones</th>
                </thead>
                <% 
                    String fechaInicioFacturacion = request.getParameter("fechaInicioFacturacion");
                    String fechaFinalFacturacion = request.getParameter("fechaFinalFacturacion");
                    if ((fechaInicioFacturacion != null && fechaFinalFacturacion != null) && (fechaInicioFacturacion != "" || fechaFinalFacturacion != "")) {
                %>
                <script type="text/javascript">
                    muestra_oculta('divPagosFactuas');
                </script>

                <%
                    ArrayList<Compra> comcred = gcompra.getCompraFechaCredito(fechaInicioFacturacion, fechaFinalFacturacion);
                        for (Compra com : comcred) {
                %>
                <tr>
                    <td  class="text-center"><%= com.getId()%></td>
                    <td class="text-center"><%= com.getFecha()%></td>
                    <td class="text-center"><%= com.getTotal()%></td>
                    <td class="text-center"><%= com.getAbono()%></td>
                    <td class="text-center"><%= (com.getTotal() - com.getAbono())%></td>
                    <td class="text-center"><a class="btn btn-primary" href="pagos.jsp?id=<%= com.getId()%>">PAGAR</a></td>
                </tr>
                <%
                        }
                    } 
                    else {
                    ArrayList<Compra> comcred = gcompra.getTodosCredito();
                        for (Compra com : comcred) {
                %>
                <tr>
                    <td  class="text-center"><%= com.getId()%></td>
                    <td class="text-center"><%= com.getFecha()%></td>
                    <td class="text-center"><%= com.getTotal()%></td>
                    <td class="text-center"><%= com.getAbono()%></td>
                    <td class="text-center"><%= (com.getTotal() - com.getAbono())%></td>
                    <td class="text-center"><a class="btn btn-primary" href="pagos.jsp?id=<%= com.getId()%>">PAGAR</a></td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
        </div>
    </body>
</html>
