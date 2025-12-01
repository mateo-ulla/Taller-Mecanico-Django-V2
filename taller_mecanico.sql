DROP DATABASE IF EXISTS taller_mecanico;
CREATE DATABASE IF NOT EXISTS `taller_mecanico`
  DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `taller_mecanico`;

SET FOREIGN_KEY_CHECKS = 0;

-- =============================
-- 1) TABLA PERSONA (base de todo)
-- =============================
CREATE TABLE `persona` (
  `dni` varchar(20) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `tele_contac` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB;

INSERT INTO `persona` VALUES
('17890452','POSTAI','FABIAN','AYACUCHO 969','3515504584'),
('17896456','PEREZ','RODOLFO','BSFBGFG 7896','351789654');

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL PRIMARY KEY,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =============================
-- 2) TABLA CLIENTE (depende de persona)
-- =============================
CREATE TABLE `cliente` (
  `cod_cliente` varchar(20) NOT NULL,
  `dni` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_cliente`),
  KEY `FK_dni_cliente` (`dni`),
  CONSTRAINT `FK_dni_cliente` FOREIGN KEY (`dni`) REFERENCES `persona` (`dni`)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

INSERT INTO `cliente` VALUES ('A105','17890452'),('C130','17896456');

-- =============================
-- 3) TABLA MARCA
-- =============================
CREATE TABLE `marca` (
  `cod_marca` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod_marca`)
) ENGINE=InnoDB;

INSERT INTO `marca` VALUES
(1,'RENAULT'),(2,'FORD'),(3,'FIAT'),
(4,'VOLKSWAGEN'),(5,'CHEVROLET'),(6,'TOYOTA'),(7,'HONDA');

-- =============================
-- 4) TABLA TIPO VEHICULO
-- =============================
CREATE TABLE `tipo_vehiculo` (
  `cod_tipo_vehiculo` varchar(5) NOT NULL,
  `descripcion` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`cod_tipo_vehiculo`)
) ENGINE=InnoDB;

INSERT INTO `tipo_vehiculo` VALUES
('1','AUTO'),('2','PIKUP'),('3','CAMIÓN'),('4','MOTO'),('5','LANCHA');

-- =============================
-- 5) TABLA EMPLEADO (depende de persona)
-- =============================
CREATE TABLE `empleado` (
  `legajo` int NOT NULL,
  `dni` varchar(20) NOT NULL,
  PRIMARY KEY (`legajo`),
  KEY `FK_dni_empleado` (`dni`),
  CONSTRAINT `FK_dni_empleado` FOREIGN KEY (`dni`) REFERENCES `persona` (`dni`)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

-- =============================
-- 6) TABLA CUSTOMER_VEHICULO (depende de cliente)
-- =============================
CREATE TABLE `customer_vehiculo` (
  `id_customer` int NOT NULL AUTO_INCREMENT,
  `cod_cliente` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_customer`),
  KEY `Fk_Customer_cliente` (`cod_cliente`),
  CONSTRAINT `Fk_Customer_cliente` FOREIGN KEY (`cod_cliente`)
    REFERENCES `cliente` (`cod_cliente`)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

INSERT INTO `customer_vehiculo` VALUES (2,'A105');

-- =============================
-- 7) TABLA FICHA_TECNICA (depende de cliente)
-- =============================
CREATE TABLE `ficha_tecnica` (
  `nro_ficha` int NOT NULL,
  `cod_cliente` varchar(20) DEFAULT NULL,
  `vehiculo` varchar(12) NOT NULL,
  `subtotal` float DEFAULT NULL,
  `mano_obra` float DEFAULT NULL,
  `total_general` float DEFAULT NULL,
  PRIMARY KEY (`nro_ficha`),
  KEY `FK_CodCliente` (`cod_cliente`),
  CONSTRAINT `FK_CodCliente` FOREIGN KEY (`cod_cliente`)
    REFERENCES `cliente` (`cod_cliente`)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

-- =============================
-- 8) TABLA DETALLE_EMPLEADO_FECHATEC
-- =============================
CREATE TABLE `detalle_empleado_fechatec` (
  `id_detalle_empleado_FT` int NOT NULL AUTO_INCREMENT,
  `nro_ficha` int NOT NULL,
  `legajo` int NOT NULL,
  `horas_trabajadas` float DEFAULT NULL,
  PRIMARY KEY (`id_detalle_empleado_FT`),
  KEY `FKnro_ficha` (`nro_ficha`),
  KEY `FK_codLegajo` (`legajo`),
  CONSTRAINT `FK_codLegajo` FOREIGN KEY (`legajo`) REFERENCES `empleado` (`legajo`)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `FKnro_ficha` FOREIGN KEY (`nro_ficha`) REFERENCES `ficha_tecnica` (`nro_ficha`)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

-- =============================
-- 9) TABLA REPUESTOS
-- =============================
CREATE TABLE `repuestos` (
  `cod_repuesto` varchar(30) NOT NULL,
  `descripcion` varchar(50),
  PRIMARY KEY (`cod_repuesto`)
) ENGINE=InnoDB;

-- =============================
-- 10) TABLA DETALLE_FICHA
-- =============================
CREATE TABLE `detalle_ficha` (
  `id_detalle_ficha` int NOT NULL AUTO_INCREMENT,
  `nro_ficha` int NOT NULL,
  `fecha` date NOT NULL,
  `cod_respuesto` varchar(30) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `cantidad` float NOT NULL,
  `precio` float NOT NULL,
  `importe` float NOT NULL,
  PRIMARY KEY (`id_detalle_ficha`),
  KEY `FK_nro_ficha` (`nro_ficha`),
  KEY `FKcod_respuesto` (`cod_respuesto`),
  CONSTRAINT `FK_nro_ficha` FOREIGN KEY (`nro_ficha`) REFERENCES `ficha_tecnica` (`nro_ficha`)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `FKcod_respuesto` FOREIGN KEY (`cod_respuesto`) REFERENCES `repuestos` (`cod_repuesto`)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

-- =============================
-- 11) TABLA CUSTOMER_DETALLE
-- =============================
CREATE TABLE `customer_detalle` (
  `id_detalle_customer` int NOT NULL,
  `id_customer` int NOT NULL,
  `cod_cliente` varchar(20) NOT NULL,
  `patente` varchar(10) NOT NULL,
  `cod_tipo_vehiculo` varchar(5) NOT NULL,
  `cod_marca` int DEFAULT NULL,
  PRIMARY KEY (`id_detalle_customer`),
  KEY `FK_cod_tipo_vehiculo` (`cod_tipo_vehiculo`),
  KEY `FK_cod_cliente` (`cod_cliente`),
  KEY `FK_cod_marca` (`cod_marca`),
  KEY `FK_idCustomer` (`id_customer`),
  CONSTRAINT `FK_cod_cliente` FOREIGN KEY (`cod_cliente`) REFERENCES `cliente` (`cod_cliente`)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `FK_cod_marca` FOREIGN KEY (`cod_marca`) REFERENCES `marca` (`cod_marca`)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `FK_cod_tipo_vehiculo` FOREIGN KEY (`cod_tipo_vehiculo`) REFERENCES `tipo_vehiculo` (`cod_tipo_vehiculo`)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `FK_idCustomer` FOREIGN KEY (`id_customer`) REFERENCES `customer_vehiculo` (`id_customer`)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

-- =============================
-- 12) PRESUPUESTO
-- =============================
CREATE TABLE `presupuesto` (
  `nro_presupuesto` INT NOT NULL,
  `cod_cliente` VARCHAR(20) DEFAULT NULL,
  `descripcion` VARCHAR(255) DEFAULT NULL,
  `total_presupuesto` FLOAT DEFAULT NULL,
  `total_gastado` FLOAT DEFAULT NULL,
  PRIMARY KEY (`nro_presupuesto`),
  KEY `FK_CodCliente_Presupuesto` (`cod_cliente`),
  CONSTRAINT `FK_CodCliente_Presupuesto` FOREIGN KEY (`cod_cliente`)
    REFERENCES `cliente` (`cod_cliente`)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS = 1;
