<%@page import="administrativo.Venta"%>
<%@page import="gestion.GestionVenta"%>
<%@page import="administrativo.Compra"%>
<%@page import="gestion.GestionCompra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int idFact = Integer.parseInt(request.getParameter("id"));
    GestionVenta gv = new GestionVenta();
    Venta com = gv.getVenta(idFact);
    HttpSession sesion = request.getSession(true);
    Object username = sesion.getAttribute("username") == null ? null : sesion.getAttribute("username");
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
    <center>
        <div class="container">
            <h1>Pagar factura No <%= idFact%></h1>
            <div class="container-fluid">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col"># Factura</th>
                            <th scope="col">Total factura</th>
                            <th scope="col">Abonos</th>
                            <th scope="col">Total a pagar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row"><%=idFact%></th>
                            <td><%= com.getTotal()%></td>
                            <td><%= com.getAbono()%></td>
                            <td><%= (com.getTotal() - com.getAbono())%></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <hr>
            <center>
                <form action="PagarVenta" method="post" class="form-control" style="width: 500px; height: 400px">
                    ID:
                    <input type="number" readonly="" name="id" class="form-control" value="<%= idFact%>"/>
                    Monto a pagar:

                    <input type="number" name="pago" class="form-control" min="0" max="<%=(com.getTotal() - com.getAbono())%>"/><br>
                    <br>
                    <input type="submit" value="Guardar" class="btn btn-success "/>
                    <a class="btn btn-primary" href="detalles_factura.jsp?id=<%= com.getId()%>">Detalles</a>
                    <a class="btn btn-warning" href="javascript:window.history.back();">Regresar</a>
                </form>
            </center>
        </div>
    </center>
</body>
</html>
