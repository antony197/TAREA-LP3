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
            <a  class="btn btn-info" href="productos.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-shop" viewBox="0 0 16 16">
                <path d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.371 2.371 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976l2.61-3.045zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0zM1.5 8.5A.5.5 0 0 1 2 9v6h1v-5a1 1 0 0 1 1-1h3a1 1 0 0 1 1 1v5h6V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5zM4 15h3v-5H4v5zm5-5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1v-3zm3 0h-2v3h2v-3z"/>
                </svg>Productos</a> 
            <a  class="btn btn-info" href="facturas.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard" viewBox="0 0 16 16">
                <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z"/>
                <path d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z"/>
                </svg>Facturas</a>  
            <a  class="btn btn-info" href="carrito.jsp" ><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag-fill" viewBox="0 0 16 16">
                <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5z"/>
                </svg>Carrito</a>  
            <a  class="btn btn-danger" href="CerrarSesion"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
                <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                </svg>Cerrar Sesion</a>
        </div>
        <div  class="container" id="divControlProducto">
            <br>
            <div syle="padding-left:400px">
                <form action="productos.jsp" method="POST">
                    <p><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                        </svg>Buscar
                        <input class="form-control" type="text" name="buscaProducto" value="">
                        <input class="btn btn-success btn-sm" type="submit" value="Buscar">
                        <a class="btn btn-danger btn-sm" href="productos.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                            <path d="M1.293 1.293a1 1 0 0 1 1.414 0L8 6.586l5.293-5.293a1 1 0 1 1 1.414 1.414L9.414 8l5.293 5.293a1 1 0 0 1-1.414 1.414L8 9.414l-5.293 5.293a1 1 0 0 1-1.414-1.414L6.586 8 1.293 2.707a1 1 0 0 1 0-1.414z"/>
                            </svg> Eliminar busqueda</a>
                    </p>
                </form>
            </div>
            <h1> Busca Producto</h1>
            <table class="table table-bordered" id="controlProducto" >
                <thead>
                <th class="text-center">Imagen</th>
                <th class="text-center">ID</th>
                <th class="text-center">Nombre</th>
                <th class="text-center">Precio venta</th>
                <th class="text-center">Existencias</th>
                <th class="text-center">Acciones</th>
                </thead>
                <%
                    String nombreProducto = request.getParameter("buscaProducto");
                    if (nombreProducto != null && nombreProducto != "") {
                %>
                <script type="text/javascript">
                    muestra_oculta('divControlProducto');
                </script>
                <%
                    ArrayList<Producto> productos = gp.getBusqueda(nombreProducto);
                    for (Producto prod : productos) {
                %>
                <tr>
                    <td class="text-center"><image src="../imgprodu/<%= prod.getNombreFoto()%>" width="100" height="100"></td>
                    <td class="text-center"><%= prod.getId()%></td>
                    <td class="text-center"><%= prod.getNombre()%></td>
                    <td class="text-center"><%= prod.getPrecioVenta()%></td>
                    <td class="text-center"><%= prod.getExistencias()%></td>
                    <td class="text-center"><a class="btn btn-warning" href="detalles.jsp?id=<%= prod.getId()%>">Ver Mas</a></td>
                </tr>
                <%     }
                } else {
                    ArrayList<Producto> productos = gp.getTodos();
                    for (Producto prod : productos) {%>
                <tr>
                    <td class="text-center"><image src="../imgprodu/<%= prod.getNombreFoto()%>" width="100" height="100"></td>
                    <td class="text-center"><%= prod.getId()%></td>
                    <td class="text-center"><%= prod.getNombre()%></td>
                    <td class="text-center"><%= prod.getPrecioVenta()%></td>
                    <td class="text-center"><%= prod.getExistencias()%></td>
                    <td class="text-center"><a class="btn btn-warning" href="detalles.jsp?id=<%= prod.getId()%>">Ver Mas</a></td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
        </div>
    </body>
</html>
