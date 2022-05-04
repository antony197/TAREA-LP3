-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-07-2021 a las 16:54:46
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdventas1`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AbonaFactura` (`id` INT, `cant` FLOAT)  BEGIN
	update compra set abono=abono+cant where idCompra=id;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AbonaFacturaUsuario` (`id` INT, `cant` FLOAT)  BEGIN
	update venta set abono=abono+cant where idVenta=id;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `autenticar` (`uname` VARCHAR(45), `contra` VARCHAR(45))  BEGIN
	select *from usuario where usuario=uname and password=contra;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllCompras` ()  BEGIN
	select * from compra;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllComprasCredito` ()  BEGIN
	select * from compra where credito=1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllProducts` ()  BEGIN
	select * from producto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllProveedores` ()  BEGIN
	select * from proveedor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getBusqueda` (IN `nom` VARCHAR(45))  BEGIN
	select *from producto where nombre like concat("%",nom,"%");
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getCompra` (`id` INT)  BEGIN
	select * from compra where idCompra=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getFacturaFecha` (`inicio` VARCHAR(45), `final` VARCHAR(45))  BEGIN
	select * from compra where fecha between inicio and final;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getFacturaFechaCredito` (`inicio` VARCHAR(45), `final` VARCHAR(45))  BEGIN
	select * from compra where( fecha between inicio and final) and credito=1 ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getFacturaFechaCreditoUsuario` (`id` INT, `inicio` VARCHAR(45), `final` VARCHAR(45))  BEGIN
	select * from venta where( fecha between inicio and final) and credito=1 and idUsuario=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getFacturaFechaUsuario` (`id` INT, `inicio` VARCHAR(45), `final` VARCHAR(45))  BEGIN
	select * from venta where (fecha between inicio and final) and idUsuario=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getLastCompra` ()  BEGIN
	SELECT * FROM compra
order by idCompra desc limit 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getLastVenta` ()  BEGIN
	SELECT * FROM venta
order by idVENTA desc limit 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getProducto` (`id` INT)  BEGIN
	select * from producto where idProducto=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getProductosCompra` (`id` INT)  BEGIN
	select Nombre, precio,cantidad from compra_producto inner join producto on compra_producto.idProducto=producto.idProducto
    where idCompra=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getProductosVenta` (`id` INT)  BEGIN
	select Nombre, precio,cantidad from venta_producto inner join producto on venta_producto.Producto_idProducto=producto.idProducto
    where VENTA_IdVENTA=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getVenta` (`id` INT)  BEGIN
	select * from venta where idVENTA=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getVentas` (`id` INT)  BEGIN
	select * from venta where idUsuario=id ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getVentasCredito` (`id` INT)  BEGIN
	select * from venta where credito=1 and idUsuario=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarProducto` (`id` INT, `nom` VARCHAR(45), `prec` FLOAT)  BEGIN
	update producto
    set precioVenta=prec,nombre= nom
    where idproducto=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `newClienteProducto` (`cli` INT, `produ` INT)  BEGIN
	insert into usuario_producto values(produ,cli);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `newCompra` (`prov` INT, `tot` FLOAT, `fec` DATE, `cred` INT, `ab` FLOAT)  BEGIN
	insert into Compra(idProveedor,Total,fecha,credito,abono) values(prov,tot,fec,cred,ab);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `newCompraProducto` (`comp` INT, `prod` INT, `precio` FLOAT, `cant` INT)  BEGIN
	INSERT INTO compra_producto
    VALUES(comp,prod,precio,cant);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `newProducto` (`nom` VARCHAR(45), `com` FLOAT, `ven` FLOAT, `ex` INT, `foto` VARCHAR(45))  BEGIN
	insert into producto(Nombre,PrecioCompra,precioVenta,existencias,NombreFoto) values(nom,com,ven,ex,foto); 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `newProveedor` (`nom` VARCHAR(45))  BEGIN
	insert into proveedor(Nombre) values(nom);  
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `newProveedorProducto` (`prov` INT, `produ` INT)  BEGIN
	insert into proveedor_producto values(prov,produ); 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `newUser` (`ced` VARCHAR(45), `nom` VARCHAR(45), `ape` VARCHAR(45), `us` VARCHAR(45), `pass` VARCHAR(45), `correo` VARCHAR(45), `rango` INT)  BEGIN
	INSERT INTO usuario
    VALUES(ced,nom,ape,us,pass,correo,rango);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `newVenta` (`us` INT, `tot` FLOAT, `fec` DATE, `cred` INT, `ab` FLOAT)  BEGIN
	insert into Venta(idUsuario,Total,fecha,credito,abono) values(us,tot,fec,cred,ab); 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `newVentaProducto` (`ven` INT, `prod` INT, `precio` FLOAT, `cant` INT)  BEGIN
	INSERT INTO venta_producto
    VALUES(prod,ven,precio,cant);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateProductoCompra` (`id` INT, `cant` INT, `prec` FLOAT)  BEGIN
	update producto
    set existencias= existencias+cant,precioCompra= prec
    where idproducto=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateProductoVenta` (`id` INT, `cant` INT)  BEGIN
	update producto
    set existencias= existencias-cant
    where idproducto=id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `idCompra` int(11) NOT NULL,
  `idProveedor` int(11) NOT NULL,
  `Total` float NOT NULL,
  `Fecha` date NOT NULL,
  `Credito` int(11) NOT NULL,
  `abono` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`idCompra`, `idProveedor`, `Total`, `Fecha`, `Credito`, `abono`) VALUES
(1, 1, 1000, '2021-07-09', 1, 1000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_producto`
--

CREATE TABLE `compra_producto` (
  `idCompra` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `precio` float NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compra_producto`
--

INSERT INTO `compra_producto` (`idCompra`, `idProducto`, `precio`, `Cantidad`) VALUES
(1, 11, 10, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `PrecioCompra` float NOT NULL,
  `precioVenta` float NOT NULL,
  `Existencias` int(11) NOT NULL,
  `nombreFoto` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `Nombre`, `PrecioCompra`, `precioVenta`, `Existencias`, `nombreFoto`) VALUES
(1, 'aspirina', 5, 6, 785, 'aspirina.png'),
(2, 'ibuprofeno', 9, 10, 498, 'ibuprofeno.jpg'),
(3, 'mascarilla KN95', 15, 15, 697, 'mascarillakn95.jpg'),
(4, 'Protector Facial Bendi-C', 3, 4, 300, 'protectorFacial.jpg'),
(5, 'Vick Vaporub', 27, 27, 200, 'vicvaparuc.jpg'),
(6, 'assa 81mg', 9, 9, 200, 'assa.jpg'),
(7, 'Panadol Antigripal NF Tableta', 105, 105, 100, 'panadol.png'),
(8, 'Grifantil jarabe', 27, 27, 50, 'grifantil.jpg'),
(9, 'nikson ', 9, 10, 300, 'nikson.jpg'),
(10, 'Bismutol', 22, 23, 80, 'bismutol.jpg'),
(11, 'JointCare', 10, 13, 95, 'JointCare.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`idProveedor`, `Nombre`) VALUES
(1, 'Proveedor1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor_producto`
--

CREATE TABLE `proveedor_producto` (
  `idProveedor` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedor_producto`
--

INSERT INTO `proveedor_producto` (`idProveedor`, `idProducto`) VALUES
(1, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `password` varchar(20) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `rango` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nombre`, `apellido`, `usuario`, `password`, `correo`, `rango`) VALUES
('1', 'Silvia', 'Perez', 'xyz', '123', 'SilviaPerez@gmail.com', 2),
('2', 'Xusuario', 'Asd', 'Xus', '789', 'Xusuario@gmail.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_producto`
--

CREATE TABLE `usuario_producto` (
  `Producto_idProducto` int(11) NOT NULL,
  `Usuario_idUsuario` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario_producto`
--

INSERT INTO `usuario_producto` (`Producto_idProducto`, `Usuario_idUsuario`) VALUES
(1, '2'),
(2, '2'),
(3, '2'),
(11, '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `idVENTA` int(11) NOT NULL,
  `idUsuario` varchar(45) NOT NULL,
  `total` float NOT NULL,
  `fecha` date NOT NULL,
  `credito` int(11) NOT NULL,
  `abono` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`idVENTA`, `idUsuario`, `total`, `fecha`, `credito`, `abono`) VALUES
(1, '2', 4.8, '2021-07-05', 1, 4),
(2, '2', 45, '2021-07-09', 0, 0),
(3, '2', 64.2, '2021-07-09', 0, 0),
(4, '2', 62.5, '2021-07-09', 0, 0),
(5, '2', 30, '2021-07-09', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_producto`
--

CREATE TABLE `venta_producto` (
  `Producto_idProducto` int(11) NOT NULL,
  `VENTA_idVENTA` int(11) NOT NULL,
  `Precio` float NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `venta_producto`
--

INSERT INTO `venta_producto` (`Producto_idProducto`, `VENTA_idVENTA`, `Precio`, `cantidad`) VALUES
(1, 1, 4.8, 1),
(1, 2, 5, 9),
(1, 5, 6, 5),
(2, 3, 9.6, 2),
(3, 3, 15, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`idCompra`),
  ADD KEY `fkProveedor_idx` (`idProveedor`);

--
-- Indices de la tabla `compra_producto`
--
ALTER TABLE `compra_producto`
  ADD PRIMARY KEY (`idCompra`,`idProducto`),
  ADD KEY `fk_Compra_has_Producto_Producto1_idx` (`idProducto`),
  ADD KEY `fk_Compra_has_Producto_Compra1_idx` (`idCompra`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD UNIQUE KEY `Nombre_UNIQUE` (`Nombre`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idProveedor`),
  ADD UNIQUE KEY `Nombre_UNIQUE` (`Nombre`);

--
-- Indices de la tabla `proveedor_producto`
--
ALTER TABLE `proveedor_producto`
  ADD PRIMARY KEY (`idProveedor`,`idProducto`),
  ADD KEY `fk_Proveedor_has_Producto_Producto1_idx` (`idProducto`),
  ADD KEY `fk_Proveedor_has_Producto_Proveedor_idx` (`idProveedor`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `usuario_UNIQUE` (`usuario`),
  ADD UNIQUE KEY `correo_UNIQUE` (`correo`);

--
-- Indices de la tabla `usuario_producto`
--
ALTER TABLE `usuario_producto`
  ADD PRIMARY KEY (`Producto_idProducto`,`Usuario_idUsuario`),
  ADD KEY `fk_Producto_has_Usuario_Usuario1_idx` (`Usuario_idUsuario`),
  ADD KEY `fk_Producto_has_Usuario_Producto1_idx` (`Producto_idProducto`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idVENTA`),
  ADD KEY `fkUusario_idx` (`idUsuario`);

--
-- Indices de la tabla `venta_producto`
--
ALTER TABLE `venta_producto`
  ADD PRIMARY KEY (`Producto_idProducto`,`VENTA_idVENTA`),
  ADD KEY `fk_Producto_has_VENTA_VENTA1_idx` (`VENTA_idVENTA`),
  ADD KEY `fk_Producto_has_VENTA_Producto1_idx` (`Producto_idProducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `idCompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `idVENTA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `fkProveedor` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `compra_producto`
--
ALTER TABLE `compra_producto`
  ADD CONSTRAINT `fk_Compra_has_Producto_Compra1` FOREIGN KEY (`idCompra`) REFERENCES `compra` (`idCompra`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Compra_has_Producto_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `proveedor_producto`
--
ALTER TABLE `proveedor_producto`
  ADD CONSTRAINT `fk_Proveedor_has_Producto_Producto1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Proveedor_has_Producto_Proveedor` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_producto`
--
ALTER TABLE `usuario_producto`
  ADD CONSTRAINT `fk_Producto_has_Usuario_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Producto_has_Usuario_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fkUusario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `venta_producto`
--
ALTER TABLE `venta_producto`
  ADD CONSTRAINT `fk_Producto_has_VENTA_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`),
  ADD CONSTRAINT `fk_Producto_has_VENTA_VENTA1` FOREIGN KEY (`VENTA_idVENTA`) REFERENCES `venta` (`idVENTA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
