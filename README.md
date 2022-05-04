# Simple shopping cart with JSP and Servlets

> This is my first big project with JSP which is built with MySQL database.The website pretty much provides full feature for a shopping website such as:

* Explore the products
* Shopping cart
* Provide basic admin page to manage products
* Provide basic http authentication for admin page and user.

> Full instructions are given in spanish.
# VIDEO DE USO
https://youtu.be/ufXb7WxsPYo

# Sistema web para la administración de tienda virtual.

> Este es mi primer proyecto "grande" en web usando la tecnología de JSP y MySQL como gestor de bases de datos. El sitio web fue construido como parte de la asignatura "Fundamentos de Bases de Datos" en la Universidad de La Sabana.

##Contenido General del proyecto

* Creación de usuario tipo cliente
* Inicio de sesión para usuario tipo cliente y administrador (por separado)
* Cierre de sesión en ambos tipos de usuario
* Panel para cada usuario
* Restricción de acceso (acceso prohibido)


## Módulo Administrador

* Informacion de productos (Muestra todos los productos en una tabla con sus debidos atributos)
* Modificar productos (Ciertos parámetros no se pueden editar debido a las reglas del proyecto)
* Comprar productos (Al pretender ser una tienda real el administrador compra productos a los proveedores)
* Crear producto (las imagenes deben estar guardadas en web/imgprodu)
* Crear proveedor
* Facturas 
* Módulo pagos (permite pagar las compras que fueron declaradas a crédito)


## Módulo Cliente

* Registro de usuario tipo cliente
* Ver productos(permite ver todos los productos que existen en la tienda)
* Detalles de producto (ver los detalles del producto seleccionado para acto siguiente agregarlo al carrito)
* CheckOut (Permite ver el carrito, eliminar productos dentro del carrito y proceder a comprar)
* Facturas (Permite ver las compras que se han hecho como cliente)
* Módulo pagos(Pagar las facturas que se han declarado como a crédito)


## Recomendaciones 

> El proyecto se ha creado usando NetBeans 8.0.2 por lo tanto se puede clonar directamente a dicho IDE. Además se uso usando Apache Tomcat.

* Configurar la clase Connection db línea 19 con los datos del Servidor MySQL y nombre de base de datos.
* La base de datos con Stored Procedures se encuentra en el repositorio como "FinalTienda.sql"
* El proyecto se ha diseñado con fines académicos, por lo que se espera que el uso de este repositorio sea meramente académico.

## Referencia.

En la realización del proyecto usé estos videos y plantillas para finalizarlo.

* PuroCodigo https://purocodigo.net/videotutorial/istema-de-autenticacion-con-jsp-y-ajax
* SinFloo https://www.youtube.com/watch?v=D3HER9EGQSI&list=PLG1l7S-453CauhEV_WAQdHozalUVkP9X7
* Fazt https://www.youtube.com/channel/UCX9NJ471o7Wie1DQe94RVIg (plantilla login)





