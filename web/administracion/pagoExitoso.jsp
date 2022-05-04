<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%  HttpSession sesion = request.getSession(true);
        Object username = sesion.getAttribute("username") == null ? null : sesion.getAttribute("username");
        if (username != null && sesion.getAttribute("rango").equals(2)) {
            response.getWriter().print("Bienvenido " + username.toString());
        } else {
            response.getWriter().print("Acceso denegado");
            response.sendRedirect("index.jsp");
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="5;./panel.jsp" />
        <title>Pago Exitoso</title>
    </head>
    <body>
        <h1>El pago de su factura ha sido exitoso, sera redireccionado en 5 segundos</h1>
    </body>
</html>
