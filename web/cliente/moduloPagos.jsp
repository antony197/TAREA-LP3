<%@page import="administrativo.Venta"%>
<%@page import="gestion.GestionVenta"%>
<%@page import="gestion.GestionProducto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="administrativo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(true);
    Object username = sesion.getAttribute("username") == null ? null : sesion.getAttribute("username");
    ArrayList<Producto> cart;
    cart = (ArrayList<Producto>) session.getAttribute("cart");
    GestionProducto gp = new GestionProducto();
    GestionVenta gv = new GestionVenta();
    int iduser = Integer.parseInt((String) sesion.getAttribute("id"));
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
        <h1>Bienvenido <%=username%></h1>
        <div  class="container text-center">
            <a  class="btn btn-info" href="productos.jsp">Productos</a> 
            <a  class="btn btn-info" href="facturas.jsp">Facturas</a>  
            <a  class="btn btn-info" href="carrito.jsp">Carrito</a>       
            <a  class="btn btn-info" href="moduloPagos.jsp">Modulo de Pagos</a>  
            <a  class="btn btn-danger" href="CerrarSesion">Cerrar Sesion</a>
        </div>
        <div class="container" id="divPagosFacturas">
            <br>
            <h1> Modulo Pagos</h1>
            <div syle="padding-left:400px">
                <form action="moduloPagos.jsp" method="POST">
                    <p>buscar factura desde
                        <input class="form-control" type="date" name="fechaInicioFacturacion">
                        hasta
                        <input class="form-control" type="date" name="fechaFinalFacturacion">
                        <input class="btn btn-success btn-sm" type="submit" value="Buscar">
                        <a class="btn btn-danger btn-sm" href="javascript:window.history.back();">Regresar</a>
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
                    muestra_oculta('divPagosFacturas');
                </script>
                <%
                    ArrayList<Venta> comcred = gv.getVentaFechaCredito(iduser, fechaInicioFacturacion, fechaFinalFacturacion);
                    for (Venta com : comcred) {
                %>
                <tr>
                    <td  class="text-center"><%= com.getId()%></td>
                    <td class="text-center"><%= com.getFecha()%></td>
                    <td class="text-center"><%= com.getTotal()%></td>
                    <td class="text-center"><%= com.getAbono()%></td>
                    <td class="text-center"><%= (com.getTotal() - com.getAbono())%></td>
                    <td class="text-center"><a class="btn btn-primary" href="pagos.jsp?id=<%= com.getId()%>">PAGAR</a></td>
                </tr>
                <%      }
                } else {
                    ArrayList<Venta> comcred = gv.getTodosCredito(iduser);
                    for (Venta com : comcred) {%>
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
