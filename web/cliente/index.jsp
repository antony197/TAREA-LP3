<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesion = request.getSession(true);
%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Inicio Cliente</title>
        <link rel="stylesheet" href="./css/master.css">
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.1.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
        
    </head>
    <body>
        <div class="login-box">
            <img src="img/emprende.jpeg" class="avatar" alt="Avatar Image">
            <h1>Login Here</h1>
            <form action="AutenticarCliente" method="post" id="forminicio">
                <!-- USERNAME INPUT -->
                <label for="username">Username</label>
                <input type="text" placeholder="Enter Username" name="username" id="username">
                <!-- PASSWORD INPUT -->
                <label for="password">Password</label>
                <input type="password" placeholder="Enter Password" name="password" id="password">
                <input type="submit" value="Log In">
                <a href="crear.jsp">No tiene cuenta? Cree una</a><br>
                <a href="../index.jsp">Regresar</a><br>
            </form>
        </div>
    </body>
</html>
