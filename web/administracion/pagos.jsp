<%@page import="administrativo.Compra"%>
<%@page import="gestion.GestionCompra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int idFact = Integer.parseInt(request.getParameter("id"));
    GestionCompra gcompra = new GestionCompra();
    Compra com = gcompra.getCompra(idFact);
%>
<%  HttpSession sesion = request.getSession(true);
    Object username = sesion.getAttribute("username") == null ? null : sesion.getAttribute("username");
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
    </head>
    <body>
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
                <form action="PagarFactura" method="post" class="form-control" style="width: 500px; height: 400px">
                    ID:
                    <input type="number" readonly="" name="id" class="form-control" value="<%= idFact%>"/>
                    Monto a pagar:
                    <input type="number" name="pago" class="form-control" min="0" max="<%=(com.getTotal() - com.getAbono())%>"/><br>
                    <br>
                    <input type="submit" value="Guardar" class="btn btn-success "/>
                    <a class="btn btn-primary" href="factura.jsp?id=<%= com.getId()%>">Detalles</a>
                    <a class="btn btn-warning" href="panel.jsp">Regresar</a>
                </form>
            </center>
        </div>
    </center>
</body>
</html>
