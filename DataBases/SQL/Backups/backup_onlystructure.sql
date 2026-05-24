-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: say_hospital_bd
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbb_defunciones`
--

DROP TABLE IF EXISTS `tbb_defunciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_defunciones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_departamentos`
--

DROP TABLE IF EXISTS `tbb_departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_departamentos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `descripcion` text,
  `area_id` int DEFAULT NULL,
  `responsable_personal_id` int unsigned DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  KEY `idx_area` (`area_id`),
  KEY `idx_responsable` (`responsable_personal_id`),
  CONSTRAINT `fk_departamento_area_Id` FOREIGN KEY (`area_id`) REFERENCES `tbc_areas` (`ID`),
  CONSTRAINT `fk_departamento_responsable` FOREIGN KEY (`responsable_personal_id`) REFERENCES `tbb_personal` (`ID`),
  CONSTRAINT `kf_departamento_personal_id` FOREIGN KEY (`responsable_personal_id`) REFERENCES `tbb_personal` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_diagnosticos`
--

DROP TABLE IF EXISTS `tbb_diagnosticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_diagnosticos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_dietas`
--

DROP TABLE IF EXISTS `tbb_dietas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_dietas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `id_cita_medica` int unsigned DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `tipo_dieta` enum('Liquida clara','Liquida completa','Blanda','Facil masticacion','Hiposodica','Hipocalorica','Diabeticos') NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_dieta_cita` (`id_cita_medica`),
  CONSTRAINT `fk_dieta_cita` FOREIGN KEY (`id_cita_medica`) REFERENCES `tbd_citas_medicas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_documentos_oficiales`
--

DROP TABLE IF EXISTS `tbb_documentos_oficiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_documentos_oficiales` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_expedientes_medicos`
--

DROP TABLE IF EXISTS `tbb_expedientes_medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_expedientes_medicos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_medios_de_contacto`
--

DROP TABLE IF EXISTS `tbb_medios_de_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_medios_de_contacto` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Correo` varchar(150) DEFAULT NULL,
  `Telefono_Casa` varchar(20) DEFAULT NULL,
  `Movil` varchar(20) DEFAULT NULL,
  `Fecha_Registro` date NOT NULL DEFAULT (curdate()),
  `Fecha_Actualizacion` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Persona_ID` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `idx_medios_persona` (`Persona_ID`),
  CONSTRAINT `fk_medios_persona` FOREIGN KEY (`Persona_ID`) REFERENCES `tbb_personas` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=615 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_nacimientos`
--

DROP TABLE IF EXISTS `tbb_nacimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_nacimientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_notas_medicas`
--

DROP TABLE IF EXISTS `tbb_notas_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_notas_medicas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_pacientes`
--

DROP TABLE IF EXISTS `tbb_pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_pacientes` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `status_medico` varchar(150) DEFAULT NULL,
  `status_vida` enum('Vivo','Finado','Coma','Vegetativo','Desconocido') NOT NULL DEFAULT 'Desconocido',
  `fecha_ultima_citamedica` datetime DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `persona_id` int unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_paciente_persona` (`persona_id`),
  KEY `idx_pacientes_status_vida` (`status_vida`),
  CONSTRAINT `fk_paciente_persona` FOREIGN KEY (`persona_id`) REFERENCES `tbb_personas_fisicas` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1162965 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_personal`
--

DROP TABLE IF EXISTS `tbb_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_personal` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `persona_fisica_id` int unsigned NOT NULL,
  `departamento_id` int unsigned DEFAULT NULL,
  `numero_empleado` varchar(20) NOT NULL,
  `puesto` varchar(80) NOT NULL,
  `tipo_contrato` enum('BASE','EVENTUAL','HONORARIOS') NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_baja` date DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uk_num_empleado` (`numero_empleado`),
  KEY `idx_departamento` (`departamento_id`),
  KEY `fk_personal_persona_idx` (`persona_fisica_id`),
  CONSTRAINT `fk_personal_departamento` FOREIGN KEY (`departamento_id`) REFERENCES `tbb_departamentos` (`ID`),
  CONSTRAINT `fk_personal_persona_fisica` FOREIGN KEY (`persona_fisica_id`) REFERENCES `tbb_personas_fisicas` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_no_empleado_duplicado` BEFORE INSERT ON `tbb_personal` FOR EACH ROW BEGIN
  IF EXISTS (
    SELECT 1
    FROM tbb_personal
    WHERE numero_empleado = NEW.numero_empleado
  ) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Número de empleado duplicado';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_salario_valido` BEFORE INSERT ON `tbb_personal` FOR EACH ROW BEGIN
  IF NEW.salario IS NOT NULL AND NEW.salario <= 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El salario debe ser mayor a cero';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_baja_personal` BEFORE UPDATE ON `tbb_personal` FOR EACH ROW BEGIN
  IF NEW.fecha_baja IS NOT NULL THEN
    SET NEW.estatus = b'0';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbb_personal_medico`
--

DROP TABLE IF EXISTS `tbb_personal_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_personal_medico` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `personal_id` int unsigned NOT NULL,
  `cedula_profesional` varchar(30) NOT NULL,
  `especialidad` varchar(100) NOT NULL,
  `turno` enum('MATUTINO','VESPERTINO','NOCTURNO','MIXTO') DEFAULT NULL,
  `area_id` int DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uk_cedula` (`cedula_profesional`),
  KEY `fk_medico_area` (`area_id`),
  KEY `fk_personal_medico_idx` (`personal_id`),
  CONSTRAINT `fk_medico_area` FOREIGN KEY (`area_id`) REFERENCES `tbc_areas` (`ID`),
  CONSTRAINT `fk_personal_medico` FOREIGN KEY (`personal_id`) REFERENCES `tbb_personal` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=32784 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_personas`
--

DROP TABLE IF EXISTS `tbb_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_personas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `tipo` enum('Fisica','Moral') NOT NULL DEFAULT 'Fisica',
  `rfc` varchar(14) DEFAULT NULL,
  `pais_origen` varchar(50) DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `rfc_UNIQUE` (`rfc`)
) ENGINE=InnoDB AUTO_INCREMENT=1163079 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_personas_fisicas`
--

DROP TABLE IF EXISTS `tbb_personas_fisicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_personas_fisicas` (
  `ID` int unsigned NOT NULL,
  `titulo_cortesia` varchar(40) DEFAULT NULL,
  `nombre` varchar(60) NOT NULL,
  `primer_apellido` varchar(45) NOT NULL,
  `segundo_apellido` varchar(60) DEFAULT NULL,
  `genero` enum('H','M','N/B') NOT NULL DEFAULT 'N/B',
  `fecha_nacimiento` date NOT NULL,
  `curp` varchar(18) DEFAULT NULL,
  `grupo_sanguineo` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `edad` int DEFAULT NULL,
  `tipo_edad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_persona_1` FOREIGN KEY (`ID`) REFERENCES `tbb_personas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_no_curp_duplicado` BEFORE INSERT ON `tbb_personas_fisicas` FOR EACH ROW BEGIN
  IF NEW.curp IS NOT NULL AND EXISTS (
    SELECT 1
    FROM tbb_personas_fisicas
    WHERE curp = NEW.curp
  ) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'CURP duplicado';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_validar_edad_pf` BEFORE INSERT ON `tbb_personas_fisicas` FOR EACH ROW BEGIN
  DECLARE v_edad INT;

  SET v_edad = TIMESTAMPDIFF(YEAR, NEW.fecha_nacimiento, CURDATE());

  -- Permitir 1..96 (si quieres permitir recién nacidos, cambia < 1 por < 0)
  IF v_edad < 1 OR v_edad > 96 THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Rango de edad invalido (1-96)';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbb_personas_morales`
--

DROP TABLE IF EXISTS `tbb_personas_morales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_personas_morales` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_proveedores`
--

DROP TABLE IF EXISTS `tbb_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_proveedores` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_quejas_sugerencias`
--

DROP TABLE IF EXISTS `tbb_quejas_sugerencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_quejas_sugerencias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_recetas_medicas`
--

DROP TABLE IF EXISTS `tbb_recetas_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_recetas_medicas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `id_cita_medica` int unsigned NOT NULL,
  `fecha_emision` date NOT NULL,
  `medicamento` varchar(150) NOT NULL,
  `dosis` varchar(100) NOT NULL,
  `frecuencia` varchar(100) NOT NULL,
  `duracion` varchar(50) NOT NULL,
  `indicaciones` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_receta_cita` (`id_cita_medica`),
  CONSTRAINT `fk_receta_cita` FOREIGN KEY (`id_cita_medica`) REFERENCES `tbd_citas_medicas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_transacciones_financieras`
--

DROP TABLE IF EXISTS `tbb_transacciones_financieras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_transacciones_financieras` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_transfusiones_sanguineas`
--

DROP TABLE IF EXISTS `tbb_transfusiones_sanguineas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_transfusiones_sanguineas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_traslados`
--

DROP TABLE IF EXISTS `tbb_traslados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_traslados` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_tratamientos`
--

DROP TABLE IF EXISTS `tbb_tratamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_tratamientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbb_valoraciones`
--

DROP TABLE IF EXISTS `tbb_valoraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_valoraciones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_areas`
--

DROP TABLE IF EXISTS `tbc_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_areas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(80) NOT NULL,
  `Descripcion` text,
  `Ubicacion_ID` int DEFAULT NULL,
  `Personal_ID_Responsable` int DEFAULT NULL,
  `Area_Superior_ID` int DEFAULT NULL,
  `Estatus_Operacion` enum('Activo','Inactivo','En Espera') DEFAULT NULL,
  `Total_Empleados` int DEFAULT NULL,
  `Fecha_Registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Estatus` bit(1) DEFAULT b'1',
  PRIMARY KEY (`ID`),
  KEY `fk_area_superior` (`Area_Superior_ID`),
  CONSTRAINT `fk_area_superior` FOREIGN KEY (`Area_Superior_ID`) REFERENCES `tbc_areas` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_ai_areas` AFTER INSERT ON `tbc_areas` FOR EACH ROW BEGIN
INSERT INTO tbi_bitacora (
     Nombre_Tabla,
     Usuario,
     Operacion,
     Descripcion,
     Fecha_Hora
     )
     VALUES (
    'tbc_areas',
     USER(),
    'Insert',
    'Se ha agregado una nueva área',
    NOW()
    );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbc_cirugias`
--

DROP TABLE IF EXISTS `tbc_cirugias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_cirugias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_equipamiento`
--

DROP TABLE IF EXISTS `tbc_equipamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_equipamiento` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_espacios`
--

DROP TABLE IF EXISTS `tbc_espacios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_espacios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_medicamentos`
--

DROP TABLE IF EXISTS `tbc_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_medicamentos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_organos`
--

DROP TABLE IF EXISTS `tbc_organos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_organos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_patologias`
--

DROP TABLE IF EXISTS `tbc_patologias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_patologias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_servicios`
--

DROP TABLE IF EXISTS `tbc_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_servicios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_servicios_medicos`
--

DROP TABLE IF EXISTS `tbc_servicios_medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_servicios_medicos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_signos_vitales`
--

DROP TABLE IF EXISTS `tbc_signos_vitales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_signos_vitales` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_accesos`
--

DROP TABLE IF EXISTS `tbd_accesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_accesos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Persona_ID` int NOT NULL,
  `Fecha_Registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `Espacio_ID` int DEFAULT NULL,
  `Tipo` enum('Entrada','Salida') DEFAULT NULL,
  `Estatus` bit(1) DEFAULT b'1',
  `Personal_ID_autoriza` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_aprobaciones`
--

DROP TABLE IF EXISTS `tbd_aprobaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_aprobaciones` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Personal_ID` int NOT NULL,
  `Servicio_ID` int NOT NULL,
  `Estatus_Aprobacion` enum('Pendiente','Aprobado','Rechazado') DEFAULT NULL,
  `Fecha_Registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Estatus` bit(1) DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_campanias`
--

DROP TABLE IF EXISTS `tbd_campanias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_campanias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(150) NOT NULL,
  `Descripcion` text NOT NULL,
  `Departamento_ID` int unsigned NOT NULL,
  `Personal_ID_responsable` int unsigned NOT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Fin` datetime DEFAULT NULL,
  `Estatus_Realizacion` enum('Programada','Realizada','Finalizada','Cancelada','Aprobada','Activa','Inactiva') DEFAULT 'Programada',
  `Estatus` bit(1) DEFAULT b'1',
  `Tipo` enum('Preventiva','Diagnóstica','Terapéutica','Especializada','General') NOT NULL DEFAULT 'General',
  `Observaciones` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_citas_medicas`
--

DROP TABLE IF EXISTS `tbd_citas_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_citas_medicas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `motivo` varchar(255) NOT NULL,
  `tipo_cita` enum('Consulta general','Urgencias','Control','Seguimiento','Primera vez') NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_horarios`
--

DROP TABLE IF EXISTS `tbd_horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_horarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `tipo` enum('general','especifico') NOT NULL,
  `personal` bit(1) DEFAULT b'0',
  `departamento` bit(1) DEFAULT b'0',
  `area` bit(1) DEFAULT b'0',
  `espacio` bit(1) DEFAULT b'0',
  `servicio` bit(1) DEFAULT b'0',
  `referencia_id` int DEFAULT NULL,
  `estado` bit(1) DEFAULT b'1',
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3504 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_horarios_generales`
--

DROP TABLE IF EXISTS `tbd_horarios_generales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_horarios_generales` (
  `id` int NOT NULL,
  `dias` varchar(50) DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_horario_generales_horarios` FOREIGN KEY (`id`) REFERENCES `tbd_horarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_inventario_equipamientos`
--

DROP TABLE IF EXISTS `tbd_inventario_equipamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_inventario_equipamientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_inventario_medicamentos`
--

DROP TABLE IF EXISTS `tbd_inventario_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_inventario_medicamentos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_lotes_medicamentos`
--

DROP TABLE IF EXISTS `tbd_lotes_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_lotes_medicamentos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_padecimientos`
--

DROP TABLE IF EXISTS `tbd_padecimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_padecimientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_valoraciones`
--

DROP TABLE IF EXISTS `tbd_valoraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_valoraciones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbi_bitacora`
--

DROP TABLE IF EXISTS `tbi_bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbi_bitacora` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre_Tabla` varchar(80) NOT NULL,
  `Usuario` varchar(80) NOT NULL,
  `Operacion` enum('Insert','Update','Delete') NOT NULL,
  `Descripcion` text NOT NULL,
  `Fecha_Hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `vw_roles_usuarios_2`
--

DROP TABLE IF EXISTS `vw_roles_usuarios_2`;
/*!50001 DROP VIEW IF EXISTS `vw_roles_usuarios_2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_roles_usuarios_2` AS SELECT 
 1 AS `usuario`,
 1 AS `host`,
 1 AS `roles_asignados`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_roles_ususarios`
--

DROP TABLE IF EXISTS `vw_roles_ususarios`;
/*!50001 DROP VIEW IF EXISTS `vw_roles_ususarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_roles_ususarios` AS SELECT 
 1 AS `usuario`,
 1 AS `host`,
 1 AS `roles_asignados`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'say_hospital_bd'
--

--
-- Dumping routines for database 'say_hospital_bd'
--
/*!50003 DROP FUNCTION IF EXISTS `bandera_probabilidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `bandera_probabilidad`(p_porcentaje INT) RETURNS tinyint
    NO SQL
BEGIN
  IF p_porcentaje IS NULL THEN
    SET p_porcentaje = 50;
  END IF;

  SET p_porcentaje = LEAST(GREATEST(p_porcentaje,0),100);

  RETURN IF(RAND() < (p_porcentaje/100.0), 1, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_antiguedad_personal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_antiguedad_personal`(p_id INT) RETURNS int
    DETERMINISTIC
BEGIN
  DECLARE v_fecha DATE;

  SELECT fecha_ingreso
  INTO v_fecha
  FROM tbb_personal
  WHERE ID = p_id;

  RETURN TIMESTAMPDIFF(YEAR, v_fecha, CURDATE());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_apellido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_apellido`() RETURNS varchar(80) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
  /* Lista separada por | (puedes agregar más sin recalcular RAND()*N) */
  DECLARE v_list TEXT;
  DECLARE v_n INT;
  DECLARE v_i INT;

  -- Repeticiones = peso (asimetría)
  SET v_list =
    'Garcia|Garcia|Garcia|Garcia|Hernandez|Hernandez|Hernandez|Lopez|Lopez|Lopez|Martinez|Martinez|Martinez|Gonzalez|Gonzalez|Rodriguez|Rodriguez|Perez|Perez|Sanchez|Sanchez|Ramirez|Ramirez|Cruz|Cruz|Flores|Flores|Gomez|Gomez|Diaz|Diaz|Morales|Morales|'
    'Vazquez|Castro|Romero|Suarez|Rojas|Ortega|Torres|Ruiz|Mendoza|Silva|Delgado|Guerrero|Cortes|Reyes|Navarro|Ramos|Herrera|Medina|Aguilar|Jimenez|Nuñez|Santos|Campos|Vega|Marin|Varela|Paredes|Carmona|Bravo|Figueroa|Ibarra|Pineda|Salinas|Valdez|Ochoa|Mejia|Bautista|Carrillo|'
    'Palacios|Cordero|Montoya|Sandoval|Soto|Espinoza|Fuentes|Tapia|Alvarez|Benitez|Castillo|Acosta|Cabrera|Cano|Camacho|Avila|Ayala|Lozano|Vargas|Rivas|Reina|Peña|Luna|Dominguez|Sierra|Ferrer|Mora|Chavez|Salazar|Cardenas|Montes|Carrasco|Valencia|Barrera|Quiroz|Maldonado|Zamora|Pacheco|Lara|Cifuentes|Ordoñez|Alfaro|Beltran|Trujillo|Vera';

  SET v_n = 1 + LENGTH(v_list) - LENGTH(REPLACE(v_list, '|', ''));
  SET v_i = FLOOR(1 + RAND() * v_n);

  RETURN NULLIF(TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(v_list, '|', v_i), '|', -1)), '');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_calcular_edad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_calcular_edad`(fecha_nac DATE) RETURNS int
    DETERMINISTIC
BEGIN
  RETURN TIMESTAMPDIFF(YEAR, fecha_nac, CURDATE());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_curp_simple` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_curp_simple`(
    p_nombre VARCHAR(80),
    p_ap1 VARCHAR(80),
    p_ap2 VARCHAR(80),
    p_genero VARCHAR(10),
    p_fecha DATE
) RETURNS varchar(18) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
  DECLARE sexo CHAR(1);
  DECLARE base4 CHAR(4);
  DECLARE charset CHAR(36) DEFAULT '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  SET sexo = CASE
    WHEN p_genero = 'mujer' THEN 'M'
    WHEN p_genero = 'hombre' THEN 'H'
    ELSE 'X'
  END;

  SET base4 = CONCAT(
    UPPER(LEFT(IFNULL(p_ap1,'X'),1)),
    UPPER(LEFT(IFNULL(p_ap2,'X'),1)),
    UPPER(LEFT(IFNULL(p_nombre,'X'),1)),
    UPPER(SUBSTRING(IFNULL(p_nombre,'X'),2,1))
  );

  RETURN CONCAT(
    base4,
    DATE_FORMAT(p_fecha, '%y%m%d'),
    sexo,
    'NE',
    SUBSTRING(charset, FLOOR(1 + RAND()*36), 1),
    SUBSTRING(charset, FLOOR(1 + RAND()*36), 1),
    SUBSTRING(charset, FLOOR(1 + RAND()*36), 1),
    SUBSTRING(charset, FLOOR(1 + RAND()*36), 1),
    SUBSTRING(charset, FLOOR(1 + RAND()*36), 1)
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_fecha_nacimiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_fecha_nacimiento`(p_edad INT) RETURNS date
    DETERMINISTIC
BEGIN
  DECLARE base DATE;

  IF p_edad IS NULL OR p_edad < 0 THEN
    SET p_edad = 0;
  END IF;

  SET base = DATE_SUB(CURDATE(), INTERVAL p_edad YEAR);
  RETURN DATE_SUB(base, INTERVAL FLOOR(RAND()*365) DAY);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_bandera` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_bandera`() RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	Declare v_bandera Boolean default false;
    declare v_pivote Int Default 0;
    set v_pivote = fn_numero_aleatorio_rangos (0,100);
    if v_pivote <= 50 then
		set v_bandera=true;
	else
		set v_bandera=false;
	end if;
RETURN v_bandera;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_bandera_porcentaje` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_bandera_porcentaje`(v_porcentaje int) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN

RETURN rand() < (v_porcentaje/100);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_fecha_nacimiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_fecha_nacimiento`() RETURNS int
    DETERMINISTIC
BEGIN
DECLARE min_dias INT;
DECLARE max_dias INT;
DECLARE dias_aleatorios INT;
DECLARE fecha_aleatoria DATE;

SET min_dias = DATEDIFF(fecha_inicio, '1900-01-01');
SET max_dias = DATEDIFF(fecha_inicio, '1900-01-01');
SET dias_aleatorios = fn_numero_aleatorio_rangos(min_dias,max_dias);
SET fecha_aleatoria = DATE_ADD('1900-01-01',INTERVAL dias_aleatorios DAY);

RETURN fecha_aleatoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_grupo_sanguineo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_grupo_sanguineo`() RETURNS varchar(4) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
  RETURN hospital_rh_db.tipo_sangre_aleatorio();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_nombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_nombre`(p_genero VARCHAR(10)) RETURNS varchar(80) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
  DECLARE v_list TEXT;
  DECLARE v_n INT;
  DECLARE v_i INT;
  DECLARE v_val VARCHAR(80);

  IF p_genero = 'mujer' THEN
    SET v_list =
      'Maria|Maria|Maria|Maria|Guadalupe|Guadalupe|Ana|Ana|Ana|Carmen|Carmen|Juana|Juana|Laura|Laura|Patricia|Patricia|Sofia|Sofia|Daniela|Daniela|'
      'Valeria|Lucia|Andrea|Claudia|Diana|Victoria|Luisa|Fernanda|Alejandra|Paola|Veronica|Rocio|Monica|Susana|Adriana|Gabriela|Mariana|Karla|Natalia|Ximena|Camila|Renata|Regina|Aitana|Isabel|Beatriz|Elena|Irene|Olivia|Mia|Sara|Julia|Carolina|Ariadna|Estefania|Jimena|Magdalena|Perla|Selena|Valentina|Itzel|Fabiola|Araceli|Margarita|Yolanda|Leticia|Noemi|Silvia|Montserrat|Esmeralda|Brenda|Liliana|Angelica|Mayra|Luz|Pilar|Berenice|Cecilia|Celia|Alma|Rebeca|Teresa|Nadia|Abril|'
      'Mireya|Violeta|Estela|Amelia|Yesenia|Lourdes|Adela|Aurora|Clara|Dolores|Elsa|Gloria|Jacqueline|Noelia|Paulina|Rafaela|Silvana|Tatiana|Vania|Zulema|Brisa|Candelaria|Celeste|Dafne|Elisa|Emilia|Fatima|Helena|Leonor|Marisol|Nayeli|Ofelia|Paloma';
  ELSEIF p_genero = 'hombre' THEN
    SET v_list =
      'Jose|Jose|Jose|Jose|Juan|Juan|Juan|Carlos|Carlos|Luis|Luis|Miguel|Miguel|Jorge|Jorge|Jesus|Jesus|Manuel|Manuel|Francisco|Francisco|'
      'Antonio|Pedro|David|Eduardo|Fernando|Ricardo|Daniel|Alejandro|Roberto|Hector|Rafael|Sergio|Arturo|Alberto|Enrique|Oscar|Raul|Mario|Pablo|Diego|Andres|Javier|Emilio|Ivan|Guillermo|Gustavo|Felipe|Salvador|Adrian|Rodrigo|Angel|Victor|Marco|Hugo|Isaac|Mateo|Gael|Sebastian|Leonardo|Cristian|Mauricio|Cesar|Elias|Axel|Maximiliano|Bruno|Nicolas|Santiago|Julian|Benjamin|Ariel|Dario|Esteban|Gerardo|Fabian|Alonso|Edgar|Ulises|Thiago|Alan|Brian|Emiliano|Ernesto|Samuel|Vicente|Yahir|Zaid';
  ELSE
    SET v_list =
      'Alex|Sam|Taylor|Jordan|Casey|Robin|Ariel|Noel|Dani|Adrian|Cruz|Angel|Gael|Emilio|Rene|Andrea|Guadalupe|Joss|Mica|Sasha|Vale|Fer|Chris|Pat|Jess|Kim|Ali|Max|Sol|Rio|Eden|Sky|Marley|Paz|Dakota|Morgan|Riley|Rowan|Sage|Skyler|Harper|River|Phoenix|Emory|Quinn|Avery|Reese|Hayden|Finley|Kai|Milan|Remy|Santi|Luca|Drew|Lane|Nova|Ari|Teo|Noa';
  END IF;

  SET v_n = 1 + LENGTH(v_list) - LENGTH(REPLACE(v_list, '|', ''));
  SET v_i = FLOOR(1 + RAND() * v_n);

  SET v_val = TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(v_list, '|', v_i), '|', -1));

  -- Garantiza no NULL/empty
  IF v_val IS NULL OR v_val = '' THEN
    SET v_val = 'X';
  END IF;

  RETURN v_val;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_numero_aleatorio_rangos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_numero_aleatorio_rangos`(v_limite_inferior int , v_limite_superior int) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE v_numero_generado INT
	DEFAULT FLOOR(Rand()* (v_liminte_superior-v_limite_inferior+1)+v_limite_inferior);
	SET @numero_generado = v_numero_generado;
RETURN v_numero_generado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_pais` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_pais`() RETURNS varchar(60) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE r INT;

    SET r = FLOOR(1 + RAND()*100);

    IF r <= 26 THEN
        RETURN 'Brasil';
    ELSEIF r <= 42 THEN
        RETURN 'México';
    ELSEIF r <= 49 THEN
        RETURN 'Colombia';
    ELSEIF r <= 55 THEN
        RETURN 'Argentina';
    ELSEIF r <= 65 THEN
        RETURN 'Perú';
    ELSEIF r <= 73 THEN
        RETURN 'Guatemala';
    ELSEIF r <= 79 THEN
        RETURN 'Chile';
    ELSEIF r <= 85 THEN
        RETURN 'Ecuador';
    ELSEIF r <= 90 THEN
        RETURN 'Honduras';
    ELSEIF r <= 95 THEN
        RETURN 'El Salvador';
    ELSE
        RETURN 'España';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_random_string` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_random_string`(len INT) RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
  DECLARE chars VARCHAR(62) DEFAULT 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  DECLARE result VARCHAR(255) DEFAULT '';
  DECLARE i INT DEFAULT 0;

  WHILE i < len DO
    SET result = CONCAT(result, SUBSTRING(chars, FLOOR(1 + RAND()*52), 1));
    SET i = i + 1;
  END WHILE;

  RETURN result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_rfc_simple` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_rfc_simple`(
    p_nombre VARCHAR(80),
    p_ap1 VARCHAR(80),
    p_ap2 VARCHAR(80),
    p_fecha DATE
) RETURNS varchar(13) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
  DECLARE y CHAR(2);
  DECLARE m CHAR(2);
  DECLARE d CHAR(2);
  DECLARE base4 CHAR(4);
  DECLARE charset CHAR(36) DEFAULT '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  SET y = DATE_FORMAT(p_fecha, '%y');
  SET m = DATE_FORMAT(p_fecha, '%m');
  SET d = DATE_FORMAT(p_fecha, '%d');

  -- EXACTAMENTE 4 caracteres:
  SET base4 = CONCAT(
    UPPER(LEFT(IFNULL(p_ap1,'X'),1)),
    UPPER(LEFT(IFNULL(p_ap2,'X'),1)),
    UPPER(LEFT(IFNULL(p_nombre,'X'),1)),
    UPPER(SUBSTRING(IFNULL(p_nombre,'X'),2,1))
  );

  RETURN CONCAT(
    base4, y, m, d,
    SUBSTRING(charset, FLOOR(1 + RAND()*36), 1),
    SUBSTRING(charset, FLOOR(1 + RAND()*36), 1),
    SUBSTRING(charset, FLOOR(1 + RAND()*36), 1)
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_titulo_cortesia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_titulo_cortesia`(
    p_tipo_edad VARCHAR(20),
    p_genero VARCHAR(10)
) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
  IF p_tipo_edad IN ('lactante','infante','niñez','adolescente','neonato','pre adolecente') THEN
    CASE p_genero
      WHEN 'mujer' THEN RETURN 'Niña';
      WHEN 'hombre' THEN RETURN 'Niño';
      ELSE RETURN 'Menor';
    END CASE;
  END IF;

  CASE p_genero
    WHEN 'mujer' THEN RETURN 'Sra.';
    WHEN 'hombre' THEN RETURN 'Sr.';
    ELSE RETURN 'Mx.';
  END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `tipo_sangre_aleatorio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `tipo_sangre_aleatorio`() RETURNS varchar(3) CHARSET utf8mb4
    NO SQL
BEGIN

    DECLARE v_tipo VARCHAR(2);
    DECLARE v_rh CHAR(1);

    -- RH
    SET v_rh = IF(bandera_probabilidad(85), '+', '-');

    -- ABO con probabilidades condicionadas

    IF bandera_probabilidad(45) THEN
        SET v_tipo = 'O';

    ELSEIF bandera_probabilidad(64) THEN
        SET v_tipo = 'A';

    ELSEIF bandera_probabilidad(43) THEN
        SET v_tipo = 'B';

    ELSE
        SET v_tipo = 'AB';
    END IF;

    RETURN CONCAT(v_tipo, v_rh);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_n_personal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_n_personal`(IN cantidad INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE dep_id INT;
    DECLARE dep_count INT;
    DECLARE num_emp INT;
    DECLARE pf_base INT;

    -- Crear una tabla temporal para los departamentos válidos
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_departamentos (
        idx INT AUTO_INCREMENT PRIMARY KEY,
        depto_id INT
    );
    DELETE FROM tmp_departamentos;
    INSERT INTO tmp_departamentos (depto_id)
      SELECT ID FROM tbb_departamentos ORDER BY ID;
    SELECT COUNT(*) INTO dep_count FROM tmp_departamentos;
    SELECT IFNULL(MAX(persona_fisica_id),0) INTO pf_base FROM tbb_personal;

    -- Obtener el máximo correlativo de numero_empleado (los últimos 4 dígitos, ignorando huecos)
    SELECT IFNULL(MAX(CAST(SUBSTRING(numero_empleado,4) AS UNSIGNED)),0) INTO num_emp
      FROM tbb_personal WHERE numero_empleado LIKE 'EMP%';

    -- Insertar tantos registros como se pidan
    WHILE i < cantidad DO
        SET num_emp = num_emp + 1;

        -- Seguridad: si ya existe, sigue sumando hasta encontrar uno verdaderamente libre (por si hay ejecuciones en paralelo)
        WHILE EXISTS (SELECT 1 FROM tbb_personal WHERE numero_empleado = CONCAT('EMP', LPAD(num_emp,4,'0'))) DO
            SET num_emp = num_emp + 1;
        END WHILE;

        -- Rota departamentos
        SELECT depto_id INTO dep_id FROM tmp_departamentos WHERE idx = ((i % dep_count) + 1);

        INSERT INTO tbb_personal (
            persona_fisica_id,
            departamento_id,
            numero_empleado,
            puesto,
            tipo_contrato,
            fecha_ingreso,
            fecha_baja,
            salario,
            fecha_registro,
            fecha_actualizacion,
            estatus
        )
        VALUES (
            pf_base + i + 1,
            dep_id,
            CONCAT('EMP', LPAD(num_emp, 4, '0')),
            'Puesto Genérico',
            'BASE',
            '2020-01-01',
            NULL,
            20000.00,
            NOW(),
            NOW(),
            1
        );
        SET i = i + 1;
    END WHILE;
    DROP TEMPORARY TABLE tmp_departamentos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_otros_500_horarios_con_generales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_otros_500_horarios_con_generales`()
BEGIN
  DECLARE i INT DEFAULT 1;
  DECLARE horario_id INT;
  DECLARE id_base INT;

  -- Calcula el siguiente id disponible
  SELECT IFNULL(MAX(id), 0) INTO id_base FROM tbd_horarios;

  WHILE i <= 500 DO
    -- Inserta en tbd_horarios
    INSERT INTO tbd_horarios (
      nombre, descripcion, tipo, personal, departamento, area, espacio, servicio,
      referencia_id, estado, fecha_creacion, fecha_actualizacion
    ) VALUES (
      CONCAT('Horario ', id_base + i),
      CONCAT('Horario generado automáticamente (', id_base + i, ')'),
      'especifico',
      IF(MOD(i-1,5)=0,1,0),
      IF(MOD(i-1,5)=1,1,0),
      IF(MOD(i-1,5)=2,1,0),
      IF(MOD(i-1,5)=3,1,0),
      IF(MOD(i-1,5)=4,1,0),
      id_base + i,
      1,
      NOW(),
      NOW()
    );

    -- El id insertado será id_base + i por el AI secuencial
    SET horario_id = id_base + i;

    -- Inserta correspondientemente en tbd_horarios_generales
    INSERT INTO tbd_horarios_generales (
      id,
      dias,
      hora_inicio,
      hora_fin
    ) VALUES (
      horario_id,
      CASE MOD(i,7)
        WHEN 1 THEN 'Lunes'
        WHEN 2 THEN 'Martes'
        WHEN 3 THEN 'Miércoles'
        WHEN 4 THEN 'Jueves'
        WHEN 5 THEN 'Viernes'
        WHEN 6 THEN 'Sábado'
        ELSE 'Domingo'
      END,
      ADDTIME('07:00:00', SEC_TO_TIME(60 * 15 * MOD(i, 48))),
      ADDTIME('15:00:00', SEC_TO_TIME(60 * 15 * MOD(i, 48)))
    );
    SET i = i + 1;
  END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizar_grupos_sanguineos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_grupos_sanguineos`()
BEGIN
    UPDATE tbb_personas_fisicas
    SET grupo_sanguineo = CASE 
        -- Casos para A Positivo
        WHEN grupo_sanguineo LIKE '%A%POS%' OR grupo_sanguineo = 'A+' THEN 'A+'
        -- Casos para A Negativo
        WHEN grupo_sanguineo LIKE '%A%NEG%' OR grupo_sanguineo = 'A-' THEN 'A-'
        -- Casos para B Positivo
        WHEN grupo_sanguineo LIKE '%B%POS%' OR grupo_sanguineo = 'B+' THEN 'B+'
        -- Casos para B Negativo
        WHEN grupo_sanguineo LIKE '%B%NEG%' OR grupo_sanguineo = 'B-' THEN 'B-'
        -- Casos para AB Positivo
        WHEN grupo_sanguineo LIKE '%AB%POS%' OR grupo_sanguineo = 'AB+' THEN 'AB+'
        -- Casos para AB Negativo
        WHEN grupo_sanguineo LIKE '%AB%NEG%' OR grupo_sanguineo = 'AB-' THEN 'AB-'
        -- Casos para O Positivo (frecuente error con la letra O y el cero 0)
        WHEN grupo_sanguineo LIKE '%O%POS%' OR grupo_sanguineo LIKE '%0%POS%' OR grupo_sanguineo IN ('O+', '0+') THEN 'O+'
        -- Casos para O Negativo
        WHEN grupo_sanguineo LIKE '%O%NEG%' OR grupo_sanguineo LIKE '%0%NEG%' OR grupo_sanguineo IN ('O-', '0-') THEN 'O-'
        
        -- Si no coincide con nada, mantiene el valor original para no perder datos
        ELSE grupo_sanguineo 
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_contratar_personal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_contratar_personal`(
  IN p_persona_id INT,
  IN p_departamento_id INT,
  IN p_numero_empleado VARCHAR(20),
  IN p_puesto VARCHAR(80),
  IN p_tipo_contrato VARCHAR(20),
  IN p_fecha_ingreso DATE,
  IN p_salario DECIMAL(10,2)
)
BEGIN

  INSERT INTO tbb_personal
  (persona_id, departamento_id, numero_empleado,
   puesto, tipo_contrato, fecha_ingreso, salario)
  VALUES
  (p_persona_id, p_departamento_id, p_numero_empleado,
   p_puesto, p_tipo_contrato, p_fecha_ingreso, p_salario);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_fix_personas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_fix_personas`()
BEGIN
    DECLARE v_rows INT DEFAULT 1;

    SET SQL_SAFE_UPDATES = 0;

    -- ================= RFC =================
    WHILE v_rows > 0 DO
        UPDATE tbb_personas
        SET rfc = CONCAT('RFC', LPAD(ID, 10, '0'))
        WHERE rfc IS NULL
        LIMIT 5000;

        SET v_rows = ROW_COUNT();
    END WHILE;

    -- ================= PAIS =================
    SET v_rows = 1;
    WHILE v_rows > 0 DO
        UPDATE tbb_personas
        SET pais_origen = 'MEXICO'
        WHERE pais_origen IS NULL
        LIMIT 5000;

        SET v_rows = ROW_COUNT();
    END WHILE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_generar_usuarios_persona_fisica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generar_usuarios_persona_fisica`()
BEGIN
    DECLARE v_id_pf BIGINT;
    DECLARE v_nombre VARCHAR(100);
    DECLARE v_apellido VARCHAR(100);

    DECLARE v_base_nick VARCHAR(255);
    DECLARE v_nick_final VARCHAR(255);
    DECLARE v_pass_temp VARCHAR(255);

    DECLARE v_sufijo INT;
    DECLARE v_existe INT;

    DECLARE done INT DEFAULT 0;

    -- Cursor: recorre todas las personas físicas
    -- (si quieres solo las que NO tienen usuario, ya lo filtramos dentro)
    DECLARE cur CURSOR FOR
        SELECT pf.id, pf.nombre, pf.primer_apellido
        FROM persona_fisica pf;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO v_id_pf, v_nombre, v_apellido;

        IF done = 1 THEN
            LEAVE read_loop;
        END IF;

        -- 1) Evita duplicar: si ya existe usuario para esta persona, saltar
        SELECT COUNT(*)
          INTO v_existe
          FROM usuarios u
         WHERE u.persona_fisica_id = v_id_pf;

        IF v_existe > 0 THEN
            ITERATE read_loop;
        END IF;

        -- 2) Construir nickname base: primera letra del nombre + '.' + primer apellido
        --    - lower()
        --    - limpiar caracteres especiales
        SET v_base_nick = LOWER(
            limpiar_caracteres_especiales(
                CONCAT(LEFT(TRIM(v_nombre), 1), '.', TRIM(v_apellido))
            )
        );

        -- opcional: quitar espacios que pudieron quedar (por si apellido compuesto raro)
        SET v_base_nick = REPLACE(v_base_nick, ' ', '');

        -- 3) Garantizar único: si ya existe, agregar sufijo incremental
        SET v_nick_final = v_base_nick;
        SET v_sufijo = 1;

        nick_loop: LOOP
            SELECT COUNT(*)
              INTO v_existe
              FROM usuarios u
             WHERE u.nickname = v_nick_final;

            IF v_existe = 0 THEN
                LEAVE nick_loop;
            END IF;

            SET v_sufijo = v_sufijo + 1;
            SET v_nick_final = CONCAT(v_base_nick, v_sufijo);  -- m.ramirez2, m.ramirez3, ...
        END LOOP;

        -- 4) Password temporal en texto plano (ejemplo)
        --    Puedes cambiar el patrón al que uses en clase
        SET v_pass_temp = CONCAT('Temp#', v_id_pf);

        -- 5) Insertar usuario
        INSERT INTO usuarios (persona_fisica_id, nickname, password_plain, created_at)
        VALUES (v_id_pf, v_nick_final, v_pass_temp, NOW());

    END LOOP;

    CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_limpieza_masiva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_limpieza_masiva`()
BEGIN
    DECLARE v_rows INT DEFAULT 1;

    SET SQL_SAFE_UPDATES = 0;

    -- =========================
    -- PERSONAS
    -- =========================

    -- RFC por lotes
    SET v_rows = 1;
    WHILE v_rows > 0 DO
        UPDATE tbb_personas
        SET rfc = CONCAT(
            LEFT(MD5(ID), 4),
            LPAD(ID, 6, '0')
        )
        WHERE rfc IS NULL
        LIMIT 10000;

        SET v_rows = ROW_COUNT();
    END WHILE;

    -- país por lotes
    SET v_rows = 1;
    WHILE v_rows > 0 DO
        UPDATE tbb_personas
        SET pais_origen = 'MEXICO'
        WHERE pais_origen IS NULL
        LIMIT 10000;

        SET v_rows = ROW_COUNT();
    END WHILE;

    -- =========================
    -- PERSONAS FISICAS
    -- =========================

    -- titulo
    SET v_rows = 1;
    WHILE v_rows > 0 DO
        UPDATE tbb_personas_fisicas
        SET titulo_cortesia = ELT(
            FLOOR(1 + RAND()*3),
            'Sr.','Sra.','Dr.'
        )
        WHERE titulo_cortesia IS NULL
        LIMIT 10000;

        SET v_rows = ROW_COUNT();
    END WHILE;

    -- segundo apellido
    SET v_rows = 1;
    WHILE v_rows > 0 DO
        UPDATE tbb_personas_fisicas
        SET segundo_apellido = CONCAT('SA_', ID)
        WHERE segundo_apellido IS NULL
        LIMIT 10000;

        SET v_rows = ROW_COUNT();
    END WHILE;

    -- CURP unica
    SET v_rows = 1;
    WHILE v_rows > 0 DO
        UPDATE tbb_personas_fisicas
        SET curp = CONCAT(
            LEFT(MD5(ID), 10),
            LPAD(ID, 8, '0')
        )
        WHERE curp IS NULL
        LIMIT 10000;

        SET v_rows = ROW_COUNT();
    END WHILE;

    -- grupo sanguineo
    SET v_rows = 1;
    WHILE v_rows > 0 DO
        UPDATE tbb_personas_fisicas
        SET grupo_sanguineo = ELT(
            FLOOR(1 + RAND()*8),
            'A+','A-','B+','B-','AB+','AB-','O+','O-'
        )
        WHERE grupo_sanguineo IS NULL
        LIMIT 10000;

        SET v_rows = ROW_COUNT();
    END WHILE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_poblar_completo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_poblar_completo`(
    IN vcantidad INT
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE v_persona_id INT;
    DECLARE v_edad INT;
    DECLARE v_genero ENUM('H','M','N/B');
    DECLARE v_status_medico VARCHAR(100);
    DECLARE v_status_vida VARCHAR(20);

    WHILE i < vcantidad DO

        -- =========================
        -- 1. EDAD (SIEMPRE MAYOR DE EDAD)
        -- =========================
        SET v_edad = FLOOR(18 + RAND() * 60);

        -- =========================
        -- 2. GENERO RANDOM
        -- =========================
        SET v_genero = ELT(FLOOR(1 + RAND()*3),'H','M','N/B');

        -- =========================
        -- 3. STATUS MEDICO RANDOM
        -- =========================
        SET v_status_medico = ELT(
            FLOOR(1 + RAND()*3),
            'Estable',
            'Observacion',
            'Tratamiento'
        );

        -- =========================
        -- 4. STATUS VIDA RANDOM
        -- =========================
        SET v_status_vida = ELT(
            FLOOR(1 + RAND()*5),
            'Vivo',
            'Finado',
            'Coma',
            'Vegetativo',
            'Desconocido'
        );

        -- =========================
        -- 5. INSERTAR PERSONA
        -- =========================
        INSERT INTO tbb_personas (
            tipo,
            fecha_registro,
            estatus
        )
        VALUES (
            'Fisica',
            NOW(),
            b'1'
        );

        SET v_persona_id = LAST_INSERT_ID();

        -- =========================
        -- 6. INSERTAR PERSONA FISICA
        -- =========================
        INSERT INTO tbb_personas_fisicas (
            ID,
            titulo_cortesia,
            nombre,
            primer_apellido,
            segundo_apellido,
            genero,
            fecha_nacimiento,
            grupo_sanguineo,
            fecha_registro,
            estatus
        )
        VALUES (
            v_persona_id,
            'Sr.',
            CONCAT('Nombre', i),
            CONCAT('Apellido', i),
            CONCAT('Seg', i),
            v_genero,
            DATE_SUB(CURDATE(), INTERVAL v_edad YEAR),
            ELT(FLOOR(1 + RAND()*8),'A+','A-','B+','B-','AB+','AB-','O+','O-'),
            NOW(),
            b'1'
        );

        -- =========================
        -- 7. INSERTAR PACIENTE
        -- =========================
        INSERT INTO tbb_pacientes (
            status_medico,
            status_vida,
            fecha_ultima_citamedica,
            fecha_registro,
            estatus,
            persona_id
        )
        VALUES (
            v_status_medico,
            v_status_vida,
            NOW(),
            NOW(),
            b'1',
            v_persona_id
        );

        SET i = i + 1;

    END WHILE;

    SELECT CONCAT('Insertados: ', vcantidad) AS resultado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_poblar_pacientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_poblar_pacientes`(
    IN vcantidad_raw VARCHAR(20),
    IN vgnero VARCHAR(10),
    IN vedad_minima_raw VARCHAR(20),
    IN vedad_maxima_raw VARCHAR(20),
    IN vstatus_vida VARCHAR(20),
    IN vstatus_medico_in VARCHAR(150),
    IN vtipo_edad VARCHAR(20)
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE v_cantidad_final INT;

    DECLARE v_min INT DEFAULT 1;
    DECLARE v_max INT DEFAULT 96;

    DECLARE v_genero_norm VARCHAR(10);
    DECLARE v_genero_pf CHAR(1);

    DECLARE v_edad INT;
    DECLARE v_tipo_edad_final VARCHAR(20);
    DECLARE v_fecha_nac DATE;

    DECLARE v_persona_id BIGINT;

    DECLARE v_nombre VARCHAR(80);
    DECLARE v_ap1 VARCHAR(80);
    DECLARE v_ap2 VARCHAR(80);
    DECLARE v_titulo VARCHAR(20);

    DECLARE v_rfc VARCHAR(13);
    DECLARE v_curp VARCHAR(18);
    DECLARE v_pais VARCHAR(60);
    DECLARE v_sangre VARCHAR(4);

    DECLARE v_status_vida_final VARCHAR(20);
    DECLARE v_status_vida_enum VARCHAR(20);
    DECLARE v_status_medico_final VARCHAR(150);

    DECLARE v_now DATETIME DEFAULT NOW();

    /* VALIDACIONES */
    IF vcantidad_raw IS NULL OR vcantidad_raw REGEXP '^[0-9]+$' = 0 THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cantidad invalida';
    END IF;

    SET v_cantidad_final = CAST(vcantidad_raw AS UNSIGNED);
    IF v_cantidad_final <= 0 THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cantidad debe ser mayor a 0';
    END IF;

    SET v_genero_norm = vgnero;
    IF v_genero_norm = 'M' THEN SET v_genero_norm = 'mujer'; END IF;
    IF v_genero_norm = 'H' THEN SET v_genero_norm = 'hombre'; END IF;

    IF v_genero_norm IS NOT NULL AND v_genero_norm NOT IN ('hombre','mujer','n/b') THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Genero invalido';
    END IF;

    IF v_genero_norm = 'mujer' THEN SET v_genero_pf = 'M';
    ELSEIF v_genero_norm = 'hombre' THEN SET v_genero_pf = 'H';
    ELSE SET v_genero_pf = IF(RAND() < 0.5,'M','H'); END IF;

    IF v_genero_norm IS NULL OR v_genero_norm = 'n/b' THEN
      SET v_genero_norm = IF(v_genero_pf='M','mujer','hombre');
    END IF;

    IF vstatus_vida IS NOT NULL
       AND vstatus_vida NOT IN ('vivo','finado','coma','vegetativo','desconocido') THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Status vida invalido';
    END IF;

    IF vtipo_edad IS NOT NULL AND vtipo_edad NOT IN
      ('lactante','infante','niñez','adolescente',
       'neonato','pre adolecente',
       'joven','adulto joven','adulto','adulto mayor','paliativo') THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tipo edad invalido';
    END IF;

    IF vedad_minima_raw IS NOT NULL THEN SET v_min = CAST(vedad_minima_raw AS UNSIGNED); END IF;
    IF vedad_maxima_raw IS NOT NULL THEN SET v_max = CAST(vedad_maxima_raw AS UNSIGNED); END IF;

    SET v_min = GREATEST(v_min, 1);
    SET v_max = LEAST(v_max, 96);
    IF v_min > v_max THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Rango edad invalido (1-96)';
    END IF;

    /* INSERCION */
    START TRANSACTION;

    WHILE i < v_cantidad_final DO

      SET v_tipo_edad_final = IFNULL(vtipo_edad,'adulto');
      IF v_tipo_edad_final = 'pre adolecente' THEN SET v_tipo_edad_final='adolescente'; END IF;
      IF v_tipo_edad_final = 'neonato' THEN SET v_tipo_edad_final='lactante'; END IF;

      CASE v_tipo_edad_final
        WHEN 'Lactante' THEN SET v_edad = FLOOR(GREATEST(v_min,1) + RAND()*(LEAST(v_max,2)-GREATEST(v_min,1)+1));
        WHEN 'Infante' THEN SET v_edad = FLOOR(GREATEST(v_min,3) + RAND()*(LEAST(v_max,5)-GREATEST(v_min,3)+1));
        WHEN 'Niñez' THEN SET v_edad = FLOOR(GREATEST(v_min,6) + RAND()*(LEAST(v_max,11)-GREATEST(v_min,6)+1));
        WHEN 'Adolescente' THEN SET v_edad = FLOOR(GREATEST(v_min,12) + RAND()*(LEAST(v_max,18)-GREATEST(v_min,12)+1));
        WHEN 'Joven' THEN SET v_edad = FLOOR(GREATEST(v_min,19) + RAND()*(LEAST(v_max,25)-GREATEST(v_min,19)+1));
        WHEN 'Adulto Joven' THEN SET v_edad = FLOOR(GREATEST(v_min,26) + RAND()*(LEAST(v_max,39)-GREATEST(v_min,26)+1));
        WHEN 'Adulto' THEN SET v_edad = FLOOR(GREATEST(v_min,40) + RAND()*(LEAST(v_max,64)-GREATEST(v_min,40)+1));
        WHEN 'Adulto Mayor' THEN SET v_edad = FLOOR(GREATEST(v_min,65) + RAND()*(LEAST(v_max,96)-GREATEST(v_min,65)+1));
        WHEN 'Paliativo' THEN SET v_edad = FLOOR(GREATEST(v_min,65) + RAND()*(LEAST(v_max,96)-GREATEST(v_min,65)+1));
        ELSE SET v_edad = FLOOR(v_min + RAND()*(v_max-v_min+1));
      END CASE;

      IF v_edad IS NULL OR v_edad < v_min OR v_edad > v_max THEN
        SET v_edad = FLOOR(v_min + RAND()*(v_max-v_min+1));
        SET v_tipo_edad_final = 'adulto';
      END IF;

      SET v_fecha_nac = say_hospital_bd.fn_fecha_nacimiento(v_edad);

      SET v_ap1 = say_hospital_bd.fn_apellido();
      SET v_ap2 = say_hospital_bd.fn_apellido();
      SET v_nombre = say_hospital_bd.fn_nombre(v_genero_norm);

      SET v_titulo = say_hospital_bd.fn_titulo_cortesia(v_tipo_edad_final,v_genero_norm);
      IF v_titulo IS NULL THEN
        SET v_titulo = CASE
          WHEN v_genero_pf = 'M' THEN 'Sra.'
          WHEN v_genero_pf = 'H' THEN 'Sr.'
          ELSE 'Mx.'
        END;
      END IF;

      SET v_pais = say_hospital_bd.fn_pais();
      SET v_sangre = say_hospital_bd.fn_grupo_sanguineo();

      SET v_rfc = say_hospital_bd.fn_rfc_simple(v_nombre,v_ap1,v_ap2,v_fecha_nac);
      SET v_curp = say_hospital_bd.fn_curp_simple(v_nombre,v_ap1,v_ap2,v_genero_norm,v_fecha_nac);

      SET v_status_vida_final = IFNULL(vstatus_vida,'vivo');
      SET v_status_vida_enum = CASE v_status_vida_final
        WHEN 'vivo' THEN 'Vivo'
        WHEN 'finado' THEN 'Finado'
        WHEN 'coma' THEN 'Coma'
        WHEN 'vegetativo' THEN 'Vegetativo'
        ELSE 'Desconocido'
      END;

      IF vstatus_medico_in IS NOT NULL THEN
        SET v_status_medico_final = vstatus_medico_in;
      ELSE
        IF say_hospital_bd.bandera_probabilidad(70) THEN
          SET v_status_medico_final = 'Estable';
        ELSEIF hospital_rh_db.bandera_probabilidad(60) THEN
          SET v_status_medico_final = 'Observacion';
        ELSE
          SET v_status_medico_final = 'Tratamiento';
        END IF;
      END IF;

      INSERT INTO say_hospital_bd.tbb_personas
        (tipo,rfc,pais_origen,fecha_registro,fecha_actualizacion,estatus)
      VALUES
        ('Física',v_rfc,v_pais,v_now,NULL,b'1');

      SET v_persona_id = LAST_INSERT_ID();

      INSERT INTO say_hospital_bd.tbb_personas_fisicas
        (ID,titulo_cortesia,nombre,primer_apellido,segundo_apellido,genero,
         fecha_nacimiento,curp,grupo_sanguineo,fecha_registro,fecha_actualizacion,estatus,
         edad,tipo_edad)
      VALUES
        (v_persona_id,v_titulo,v_nombre,v_ap1,v_ap2,v_genero_pf,
         v_fecha_nac,v_curp,v_sangre,v_now,NULL,b'1',
         v_edad,v_tipo_edad_final);

      INSERT INTO say_hospital_bd.tbb_pacientes
        (status_medico,status_vida,fecha_ultima_citamedica,fecha_registro,fecha_actualizacion,estatus,persona_id)
      VALUES
        (v_status_medico_final,v_status_vida_enum,v_now,v_now,NULL,b'1',v_persona_id);

      SET i = i + 1;
    END WHILE;

    COMMIT;

    SELECT v_cantidad_final AS insertados;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_pruebas_naturaleza` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pruebas_naturaleza`(
    vcantidad_raw VARCHAR(20), 
    vgnero VARCHAR(10),
    vedad_minima_raw VARCHAR(20), 
    vedad_maxima_raw VARCHAR(20), 
    vstatus_vida VARCHAR(20),
    vtipo_edad VARCHAR(20)
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE v_cantidad_final INT;
    DECLARE v_min_final INT DEFAULT 0;
    DECLARE v_max_final INT DEFAULT 120;
    DECLARE v_edad_simulada INT;
    DECLARE v_status_medico_final VARCHAR(150);

    -- VALIDAR CANTIDAD
    IF vcantidad_raw IS NULL OR vcantidad_raw REGEXP '^[0-9]+$' = 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cantidad invalida';
    END IF;

    SET v_cantidad_final = CAST(vcantidad_raw AS UNSIGNED);

    IF v_cantidad_final = 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cantidad debe ser mayor a 0';
    END IF;

    -- VALIDAR GENERO
    IF vgnero IS NOT NULL AND vgnero NOT IN ('hombre','mujer','n/b') THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Genero invalido';
    END IF;

    -- VALIDAR STATUS VIDA
    IF vstatus_vida IS NOT NULL AND 
       vstatus_vida NOT IN ('vivo','finado','coma','vegetativo','desconocido') THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Status vida invalido';
    END IF;

    -- VALIDAR TIPO EDAD
    IF vtipo_edad IS NOT NULL AND 
       vtipo_edad NOT IN (
       'neonato','infante','niñez','pre adolecente',
       'joven','adulto joven','adulto','adulto mayor',
       'paliativo'
       ) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Tipo edad invalido';
    END IF;

    -- VALIDAR EDADES
    IF vedad_minima_raw IS NOT NULL THEN
        SET v_min_final = CAST(vedad_minima_raw AS UNSIGNED);
    END IF;

    IF vedad_maxima_raw IS NOT NULL THEN
        SET v_max_final = CAST(vedad_maxima_raw AS UNSIGNED);
    END IF;

    IF v_min_final > v_max_final OR v_max_final > 120 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Rango edad invalido';
    END IF;

    -- SIMULACION
    WHILE i < v_cantidad_final DO

        -- EDAD RANDOM
        SET v_edad_simulada = FLOOR(
            v_min_final + RAND() * (v_max_final - v_min_final + 1)
        );

        -- LOGICA STATUS MEDICO (TEST 14)
        IF vtipo_edad = 'paliativo' THEN
            SET v_status_medico_final = 'Cuidados Paliativos';
        ELSE
            SET v_status_medico_final = ELT(
                FLOOR(1 + RAND()*3),
                'Estable',
                'Observacion',
                'Tratamiento'
            );
        END IF;

        -- OUTPUT SIMULACION
        SELECT CONCAT_WS(" | ",
            CONCAT("Paciente: ", i+1),
            CONCAT("Genero: ", IFNULL(vgnero,'N/D')),
            CONCAT("Status Vida: ", IFNULL(vstatus_vida,'N/D')),
            CONCAT("Tipo Edad: ", IFNULL(vtipo_edad,'N/D')),
            CONCAT("Status Medico: ", v_status_medico_final),
            CONCAT("Edad Generada: ", v_edad_simulada)
        ) AS simulacion_paciente;

        SET i = i + 1;

    END WHILE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_redistribuir_grupos_reales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_redistribuir_grupos_reales`()
BEGIN
    UPDATE tbb_personas_fisicas
    SET grupo_sanguineo = CASE 
        -- Generamos un número aleatorio del 0.00 al 99.99
        WHEN RAND()*100 < 39 THEN 'O+'    -- ~39%
        WHEN RAND()*100 < 66 THEN 'A+'    -- ~27% (39+27=66)
        WHEN RAND()*100 < 75 THEN 'B+'    -- ~9%
        WHEN RAND()*100 < 84 THEN 'O-'    -- ~9%
        WHEN RAND()*100 < 90 THEN 'A-'    -- ~6%
        WHEN RAND()*100 < 95 THEN 'AB+'   -- ~5%
        WHEN RAND()*100 < 98 THEN 'B-'    -- ~3%
        ELSE 'AB-'                        -- ~2% el resto
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_roles_usuarios_2`
--

/*!50001 DROP VIEW IF EXISTS `vw_roles_usuarios_2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_roles_usuarios_2` AS select `u`.`User` AS `usuario`,`u`.`Host` AS `host`,ifnull(group_concat(concat(`r`.`TO_USER`,'@',convert(`r`.`TO_HOST` using utf8mb3)) order by `r`.`TO_USER` ASC separator ', '),'SIN ROLES') AS `roles_asignados` from (`mysql`.`user` `u` left join `mysql`.`role_edges` `r` on(((`u`.`User` = `r`.`FROM_USER`) and (`u`.`Host` = `r`.`FROM_HOST`)))) where ((`u`.`User` like '%user%') or (`u`.`User` = 'developer')) group by `u`.`User`,`u`.`Host` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_roles_ususarios`
--

/*!50001 DROP VIEW IF EXISTS `vw_roles_ususarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_roles_ususarios` AS select `u`.`User` AS `usuario`,`u`.`Host` AS `host`,ifnull(group_concat(concat(`r`.`TO_USER`,'@',convert(`r`.`TO_HOST` using utf8mb3)) order by `r`.`TO_USER` ASC separator ', '),'SIN ROLES') AS `roles_asignados` from (`mysql`.`user` `u` left join `mysql`.`role_edges` `r` on(((`u`.`User` = `r`.`FROM_USER`) and (`u`.`Host` = `r`.`FROM_HOST`)))) group by `u`.`User`,`u`.`Host` order by `u`.`User`,`u`.`Host` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-25 13:01:50
