<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesion = request.getSession(true);
%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Inicio Admin</title>
        <link rel="stylesheet" href="./css/master.css">
    </head>
    <body>
        <div class="login-box">
            <img src="img/emprende.jpeg" class="avatar" alt="Avatar Image">
            <h1>Login Here</h1>
            <form action="signin" method="post">
                <!-- USERNAME INPUT -->
                <label for="username">Username</label>
                <input type="text" placeholder="Enter Username" name="uname">
                <!-- PASSWORD INPUT -->
                <label for="password">Password</label>
                <input type="password" placeholder="Enter Password" name="pass">
                <input type="submit" value="Log In">
                <a href="#">Olvido su contraseña? Contacte al administrador del sitio</a><br>
                <a href="../index.jsp">Regresar</a><br>
            </form>
        </div>
    </body>
</html>
