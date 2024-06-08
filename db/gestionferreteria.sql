-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para gestionferreteria
CREATE DATABASE IF NOT EXISTS `gestionferreteria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gestionferreteria`;

-- Volcando estructura para tabla gestionferreteria.tcategorias
CREATE TABLE IF NOT EXISTS `tcategorias` (
  `ID` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestionferreteria.tclientesxcompras
CREATE TABLE IF NOT EXISTS `tclientesxcompras` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IDpersona` int NOT NULL,
  `tventas_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_tClientesxVentas_tPersonas1_idx` (`IDpersona`),
  KEY `fk_tclientesxcompras_tventas1_idx` (`tventas_ID`),
  CONSTRAINT `fk_tclientesxcompras_tventas1` FOREIGN KEY (`tventas_ID`) REFERENCES `tventas` (`ID`),
  CONSTRAINT `fk_tClientesxVentas_tPersonas1` FOREIGN KEY (`IDpersona`) REFERENCES `tpersonas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestionferreteria.testadoproductos
CREATE TABLE IF NOT EXISTS `testadoproductos` (
  `ID` int NOT NULL,
  `estadoPro` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestionferreteria.tgeneros
CREATE TABLE IF NOT EXISTS `tgeneros` (
  `ID` int NOT NULL,
  `genero` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestionferreteria.tpersonas
CREATE TABLE IF NOT EXISTS `tpersonas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `IDtipoDoc` int DEFAULT NULL,
  `numDocumento` int DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `IDgenero` int NOT NULL,
  `estado` tinyint DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDtipoDoc_idx` (`IDtipoDoc`),
  KEY `fk_tpersonas_tGenero1_idx` (`IDgenero`),
  CONSTRAINT `fk_tpersonas_tGenero1` FOREIGN KEY (`IDgenero`) REFERENCES `tgeneros` (`ID`),
  CONSTRAINT `IDtipoDoc` FOREIGN KEY (`IDtipoDoc`) REFERENCES `ttiposdoc` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestionferreteria.tproductos
CREATE TABLE IF NOT EXISTS `tproductos` (
  `ID` int NOT NULL,
  `referencia` varchar(50) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `precio` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `IDestado` int NOT NULL,
  `tCategorias_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_tProductos_tEstadoProductos1_idx` (`IDestado`),
  KEY `fk_tproductos_tCategorias1_idx` (`tCategorias_ID`),
  CONSTRAINT `fk_tproductos_tCategorias1` FOREIGN KEY (`tCategorias_ID`) REFERENCES `tcategorias` (`ID`),
  CONSTRAINT `fk_tProductos_tEstadoProductos1` FOREIGN KEY (`IDestado`) REFERENCES `testadoproductos` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestionferreteria.tproductosxventas
CREATE TABLE IF NOT EXISTS `tproductosxventas` (
  `ID` int NOT NULL,
  `tVentas_ID` int NOT NULL,
  `tProductos_ID` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  `precioxcantidad` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_tProductosxVentas_tVentas1_idx` (`tVentas_ID`),
  KEY `fk_tProductosxVentas_tProductos1_idx` (`tProductos_ID`),
  CONSTRAINT `fk_tProductosxVentas_tProductos1` FOREIGN KEY (`tProductos_ID`) REFERENCES `tproductos` (`ID`),
  CONSTRAINT `fk_tProductosxVentas_tVentas1` FOREIGN KEY (`tVentas_ID`) REFERENCES `tventas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestionferreteria.tproductoxproveedores
CREATE TABLE IF NOT EXISTS `tproductoxproveedores` (
  `ID` int NOT NULL,
  `tproductos_ID` int NOT NULL,
  `tProveedores_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_tProductoxProveedores_tproductos1_idx` (`tproductos_ID`),
  KEY `fk_tProductoxProveedores_tProveedores1_idx` (`tProveedores_ID`),
  CONSTRAINT `fk_tProductoxProveedores_tproductos1` FOREIGN KEY (`tproductos_ID`) REFERENCES `tproductos` (`ID`),
  CONSTRAINT `fk_tProductoxProveedores_tProveedores1` FOREIGN KEY (`tProveedores_ID`) REFERENCES `tproveedores` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestionferreteria.tproveedores
CREATE TABLE IF NOT EXISTS `tproveedores` (
  `ID` int NOT NULL,
  `nit` int DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `contacto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestionferreteria.troles
CREATE TABLE IF NOT EXISTS `troles` (
  `ID` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestionferreteria.ttiposdoc
CREATE TABLE IF NOT EXISTS `ttiposdoc` (
  `ID` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestionferreteria.ttrabajadores
CREATE TABLE IF NOT EXISTS `ttrabajadores` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `usuario` int DEFAULT NULL,
  `contrasenia` varchar(45) DEFAULT NULL,
  `IDrol` int NOT NULL,
  `IDpersona` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_tTrabajadores_tRoles1_idx` (`IDrol`),
  KEY `fk_tTrabajadores_tPersonas1_idx` (`IDpersona`),
  CONSTRAINT `fk_tTrabajadores_tPersonas1` FOREIGN KEY (`IDpersona`) REFERENCES `tpersonas` (`ID`),
  CONSTRAINT `fk_tTrabajadores_tRoles1` FOREIGN KEY (`IDrol`) REFERENCES `troles` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestionferreteria.tventas
CREATE TABLE IF NOT EXISTS `tventas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `IDtrabajador` int NOT NULL,
  `totalPagado` int DEFAULT NULL,
  `id_persona` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_tVentas_tTrabajadores1_idx` (`IDtrabajador`),
  KEY `fk_tventas_tpersonas1_idx` (`id_persona`),
  CONSTRAINT `fk_tventas_tpersonas1` FOREIGN KEY (`id_persona`) REFERENCES `tpersonas` (`ID`),
  CONSTRAINT `fk_tVentas_tTrabajadores1` FOREIGN KEY (`IDtrabajador`) REFERENCES `ttrabajadores` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
