CREATE DATABASE  IF NOT EXISTS `cotizaciones` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cotizaciones`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: cotizaciones
-- ------------------------------------------------------
-- Server version	5.6.24-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auditoria`
--

DROP TABLE IF EXISTS `auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditoria` (
  `idAuditoria` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `idRegistroTabla` int(11) NOT NULL,
  `nombreTabla` varchar(100) NOT NULL,
  `fechaRegistro` datetime NOT NULL,
  `operacion` varchar(100) NOT NULL,
  PRIMARY KEY (`idAuditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria`
--

LOCK TABLES `auditoria` WRITE;
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto`
--

DROP TABLE IF EXISTS `auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto` (
  `idAuto` int(11) NOT NULL AUTO_INCREMENT,
  `codigoAuto` char(8) NOT NULL,
  `idTipoAuto` int(11) NOT NULL,
  `descripcionTipo` varchar(50) DEFAULT NULL,
  `idMarca` int(11) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `idModelo` int(11) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `anio` int(11) NOT NULL,
  `numpuertas` int(11) DEFAULT NULL,
  `precio` decimal(10,0) NOT NULL,
  `urlFoto` varchar(100) DEFAULT NULL,
  `flagEstado` bit(1) DEFAULT b'1',
  PRIMARY KEY (`idAuto`),
  KEY `idTipoAuto` (`idTipoAuto`),
  KEY `idMarca` (`idMarca`),
  KEY `idModelo` (`idModelo`),
  CONSTRAINT `auto_ibfk_1` FOREIGN KEY (`idTipoAuto`) REFERENCES `configvariable` (`idConfigVariable`),
  CONSTRAINT `auto_ibfk_2` FOREIGN KEY (`idMarca`) REFERENCES `configvariable` (`idConfigVariable`),
  CONSTRAINT `auto_ibfk_3` FOREIGN KEY (`idModelo`) REFERENCES `configvariable` (`idConfigVariable`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto`
--

LOCK TABLES `auto` WRITE;
/*!40000 ALTER TABLE `auto` DISABLE KEYS */;
INSERT INTO `auto` (`idAuto`, `codigoAuto`, `idTipoAuto`, `descripcionTipo`, `idMarca`, `marca`, `idModelo`, `modelo`, `anio`, `numpuertas`, `precio`, `urlFoto`, `flagEstado`) VALUES (1,'TY1001',1,'Auto',1,'Auto',1,'Yaris',2015,4,60000,NULL,''),(2,'TY1002',1,'Auto',1,'Auto',1,'Corolla',2010,4,30000,NULL,'');
/*!40000 ALTER TABLE `auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `codigoCliente` char(8) NOT NULL,
  `razonSocial` varchar(100) DEFAULT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `idTipoCliente` int(11) NOT NULL,
  `descripTipoCliente` varchar(50) DEFAULT NULL,
  `idTipoDocumento` int(11) NOT NULL,
  `descripTipoDoc` varchar(50) DEFAULT NULL,
  `numeroDocumento` varchar(13) DEFAULT NULL,
  `flagEstado` bit(1) DEFAULT b'1',
  PRIMARY KEY (`idCliente`),
  KEY `idTipoCliente` (`idTipoCliente`),
  KEY `idTipoDocumento` (`idTipoDocumento`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idTipoCliente`) REFERENCES `configvariable` (`idConfigVariable`),
  CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`idTipoDocumento`) REFERENCES `configvariable` (`idConfigVariable`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`idCliente`, `codigoCliente`, `razonSocial`, `nombres`, `apellidos`, `email`, `idTipoCliente`, `descripTipoCliente`, `idTipoDocumento`, `descripTipoDoc`, `numeroDocumento`, `flagEstado`) VALUES (1,'CL001',NULL,'Juan','Perez','jo.sue.yep@hotmail.com',1,'Persona Natural',1,'DNI','44251122',''),(2,'12333','asdasd','asdas','dasdas','',1,NULL,12,NULL,'123123123',''),(3,'12312321','asdasd','asdasd','asdasd','',1,NULL,12,NULL,'123123123',''),(6,'123123','asdasd','sadasd','asdasd','',1,NULL,12,'','123123123',''),(7,'12345','asd','asd','asd','',1,NULL,13,'Pasaporte','12345258',''),(8,'432423','dsadsa','dsadsa','dsadsa','',15,'Persona Natural',12,'DNI','|12345678',''),(9,'987987','sddsa','dsadsa','dsadsa','',15,'Persona Natural',13,'Pasaporte','123456',''),(10,'cli002','asd','sda','dsa','',15,'Persona Natural',12,'DNI','12345678',''),(11,'CL0005','JO SAC','JO','YEP','',15,'Persona Natural',12,'DNI','4886551',''),(12,'CL0006','carlos sac','carlos','cornejo','',15,'Persona Natural',13,'Pasaporte','06662222',''),(13,'12345','dsa','dsa','dsa','',17,'Persona Juridica',12,'DNI','12345678','');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configvariable`
--

DROP TABLE IF EXISTS `configvariable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configvariable` (
  `idConfigVariable` int(11) NOT NULL AUTO_INCREMENT,
  `idPadre` int(11) DEFAULT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `flagEstado` bit(1) DEFAULT b'1',
  PRIMARY KEY (`idConfigVariable`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configvariable`
--

LOCK TABLES `configvariable` WRITE;
/*!40000 ALTER TABLE `configvariable` DISABLE KEYS */;
INSERT INTO `configvariable` (`idConfigVariable`, `idPadre`, `codigo`, `descripcion`, `flagEstado`) VALUES (1,NULL,NULL,'Marca',''),(2,1,NULL,'Toyota',''),(3,NULL,NULL,'TipoAuto',''),(4,3,NULL,'Mecanico',''),(5,NULL,'','Modelo',''),(6,5,NULL,'Sedan',''),(7,NULL,NULL,'Moneda',''),(8,7,NULL,'DOLARES',''),(9,1,NULL,'Kia',''),(10,1,NULL,'Kia',''),(11,NULL,NULL,'TipoDocumento',''),(12,11,NULL,'DNI',''),(13,11,NULL,'Pasaporte',''),(14,NULL,NULL,'TipoCliente',''),(15,14,NULL,'Persona Natural',''),(17,14,NULL,'Persona Juridica',''),(18,NULL,NULL,'TipoAuto',''),(19,3,NULL,'dsa','');
/*!40000 ALTER TABLE `configvariable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotizacion`
--

DROP TABLE IF EXISTS `cotizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotizacion` (
  `idCotizacion` int(11) NOT NULL AUTO_INCREMENT,
  `codigoCotizacion` char(8) NOT NULL,
  `idVendedor` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idTipoMoneda` int(11) NOT NULL,
  `descripTipoMoneda` varchar(50) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `importe` decimal(10,0) DEFAULT NULL,
  `flagAprobado` bit(1) DEFAULT b'0',
  `flagEstado` bit(1) DEFAULT b'1',
  PRIMARY KEY (`idCotizacion`),
  KEY `idVendedor` (`idVendedor`),
  KEY `idCliente` (`idCliente`),
  KEY `idTipoMoneda` (`idTipoMoneda`),
  CONSTRAINT `cotizacion_ibfk_1` FOREIGN KEY (`idVendedor`) REFERENCES `vendedor` (`idVendedor`),
  CONSTRAINT `cotizacion_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `cotizacion_ibfk_4` FOREIGN KEY (`idTipoMoneda`) REFERENCES `configvariable` (`idConfigVariable`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizacion`
--

LOCK TABLES `cotizacion` WRITE;
/*!40000 ALTER TABLE `cotizacion` DISABLE KEYS */;
INSERT INTO `cotizacion` (`idCotizacion`, `codigoCotizacion`, `idVendedor`, `idCliente`, `idTipoMoneda`, `descripTipoMoneda`, `precio`, `importe`, `flagAprobado`, `flagEstado`) VALUES (1,'COT001',1,1,1,'DOLARES',20000,20000,'',''),(2,'COT002',1,1,1,'DOLARES',50000,50000,'\0',''),(3,'COT003',1,1,8,NULL,NULL,60000,'\0',''),(4,'COT004',1,2,8,NULL,NULL,90000,'\0',''),(5,'COT005',1,1,8,'DOLARES',NULL,30000,'\0',''),(6,'COT006',1,1,8,'DOLARES',NULL,60000,'\0',''),(7,'COT007',1,1,8,'DOLARES',NULL,120000,'\0','');
/*!40000 ALTER TABLE `cotizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamentos` (
  `codigo` char(2) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` (`codigo`, `nombre`) VALUES ('02','ANCASH\r'),('03','APURIMAC\r'),('04','AREQUIPA\r'),('05','AYACUCHO\r'),('06','CAJAMARCA\r'),('07','CALLAO\r'),('08','CUSCO\r'),('09','HUANCAVELICA\r'),('10','HUANUCO\r'),('11','ICA\r'),('12','JUNIN\r'),('13','LA LIBERTAD\r'),('14','LAMBAYEQUE\r'),('15','LIMA\r'),('16','LORETO\r'),('17','MADRE DE DIOS\r'),('18','MOQUEGUA\r'),('19','PASCO\r'),('20','PIURA\r'),('21','PUNO\r'),('22','SAN MARTIN\r'),('23','TACNA\r'),('24','TUMBES\r'),('25','UCAYALI\r');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallecotizacion`
--

DROP TABLE IF EXISTS `detallecotizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallecotizacion` (
  `idDetalle` int(11) NOT NULL AUTO_INCREMENT,
  `idCotizacion` int(11) DEFAULT NULL,
  `idAuto` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idDetalle`),
  KEY `idCotizacion` (`idCotizacion`),
  KEY `idAuto` (`idAuto`),
  CONSTRAINT `detallecotizacion_ibfk_1` FOREIGN KEY (`idCotizacion`) REFERENCES `cotizacion` (`idCotizacion`),
  CONSTRAINT `detallecotizacion_ibfk_2` FOREIGN KEY (`idAuto`) REFERENCES `auto` (`idAuto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallecotizacion`
--

LOCK TABLES `detallecotizacion` WRITE;
/*!40000 ALTER TABLE `detallecotizacion` DISABLE KEYS */;
INSERT INTO `detallecotizacion` (`idDetalle`, `idCotizacion`, `idAuto`, `cantidad`, `precio`, `subtotal`) VALUES (1,3,1,1,60000.00,60000.00),(2,4,2,1,30000.00,30000.00),(3,4,1,1,60000.00,60000.00),(4,5,2,1,30000.00,30000.00),(5,6,2,2,30000.00,60000.00),(6,7,2,2,30000.00,60000.00),(7,7,1,1,60000.00,60000.00);
/*!40000 ALTER TABLE `detallecotizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provincia` (
  `codigo` char(4) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` (`codigo`, `nombre`) VALUES ('0102','BAGUA\r'),('0103','BONGARA\r'),('0104','CONDORCANQUI\r'),('0105','LUYA\r'),('0106','RODRIGUEZ DE MENDOZA\r'),('0107','UTCUBAMBA\r'),('0201','HUARAZ\r'),('0202','AIJA\r'),('0203','ANTONIO RAYMONDI\r'),('0204','ASUNCION\r'),('0205','BOLOGNESI\r'),('0206','CARHUAZ\r'),('0207','CARLOS FERMIN FITZCARRALD\r'),('0208','CASMA\r'),('0209','CORONGO\r'),('0210','HUARI\r'),('0211','HUARMEY\r'),('0212','HUAYLAS\r'),('0213','MARISCAL LUZURIAGA\r'),('0214','OCROS\r'),('0215','PALLASCA\r'),('0216','POMABAMBA\r'),('0217','RECUAY\r'),('0218','SANTA\r'),('0219','SIHUAS\r'),('0220','YUNGAY\r'),('0301','ABANCAY\r'),('0302','ANDAHUAYLAS\r'),('0303','ANTABAMBA\r'),('0304','AYMARAES\r'),('0305','COTABAMBAS\r'),('0306','CHINCHEROS\r'),('0307','GRAU\r'),('0401','AREQUIPA\r'),('0402','CAMANA\r'),('0403','CARAVELI\r'),('0404','CASTILLA\r'),('0405','CAYLLOMA\r'),('0406','CONDESUYOS\r'),('0407','ISLAY\r'),('0408','LA UNION\r'),('0501','HUAMANGA\r'),('0502','CANGALLO\r'),('0503','HUANCA SANCOS\r'),('0504','HUANTA\r'),('0505','LA MAR\r'),('0506','LUCANAS\r'),('0507','PARINACOCHAS\r'),('0508','PAUCAR DEL SARA SARA\r'),('0509','SUCRE\r'),('0510','VICTOR FAJARDO\r'),('0511','VILCAS HUAMAN\r'),('0601','CAJAMARCA\r'),('0602','CAJABAMBA\r'),('0603','CELENDIN\r'),('0604','CHOTA\r'),('0605','CONTUMAZA\r'),('0606','CUTERVO\r'),('0607','HUALGAYOC\r'),('0608','JAEN\r'),('0609','SAN IGNACIO\r'),('0610','SAN MARCOS\r'),('0611','SAN MIGUEL\r'),('0612','SAN PABLO\r'),('0613','SANTA CRUZ\r'),('0701','PROV. CONST. DEL CALLAO\r'),('0801','CUSCO\r'),('0802','ACOMAYO\r'),('0803','ANTA\r'),('0804','CALCA\r'),('0805','CANAS\r'),('0806','CANCHIS\r'),('0807','CHUMBIVILCAS\r'),('0808','ESPINAR\r'),('0809','LA CONVENCION\r'),('0810','PARURO\r'),('0811','PAUCARTAMBO\r'),('0812','QUISPICANCHI\r'),('0813','URUBAMBA\r'),('0901','HUANCAVELICA\r'),('0902','ACOBAMBA\r'),('0903','ANGARAES\r'),('0904','CASTROVIRREYNA\r'),('0905','CHURCAMPA\r'),('0906','HUAYTARA\r'),('0907','TAYACAJA\r'),('1001','HUANUCO\r'),('1002','AMBO\r'),('1003','DOS DE MAYO\r'),('1004','HUACAYBAMBA\r'),('1005','HUAMALIES\r'),('1006','LEONCIO PRADO\r'),('1007','MARAÃ‘ON\r'),('1008','PACHITEA\r'),('1009','PUERTO INCA\r'),('1010','LAURICOCHA\r'),('1011','YAROWILCA\r'),('1101','ICA\r'),('1102','CHINCHA\r'),('1103','NAZCA\r'),('1104','PALPA\r'),('1105','PISCO\r'),('1201','HUANCAYO\r'),('1202','CONCEPCION\r'),('1203','CHANCHAMAYO\r'),('1204','JAUJA\r'),('1205','JUNIN\r'),('1206','SATIPO\r'),('1207','TARMA\r'),('1208','YAULI\r'),('1209','CHUPACA\r'),('1301','TRUJILLO\r'),('1302','ASCOPE\r'),('1303','BOLIVAR\r'),('1304','CHEPEN\r'),('1305','JULCAN\r'),('1306','OTUZCO\r'),('1307','PACASMAYO\r'),('1308','PATAZ\r'),('1309','SANCHEZ CARRION\r'),('1310','SANTIAGO DE CHUCO\r'),('1311','GRAN CHIMU\r'),('1312','VIRU\r'),('1401','CHICLAYO\r'),('1402','FERREÃ‘AFE\r'),('1403','LAMBAYEQUE\r'),('1501','LIMA\r'),('1502','BARRANCA\r'),('1503','CAJATAMBO\r'),('1504','CANTA\r'),('1505','CAÃ‘ETE\r'),('1506','HUARAL\r'),('1507','HUAROCHIRI\r'),('1508','HUAURA\r'),('1509','OYON\r'),('1510','YAUYOS\r'),('1601','MAYNAS\r'),('1602','ALTO AMAZONAS\r'),('1603','LORETO\r'),('1604','MARISCAL RAMON CASTILLA\r'),('1605','REQUENA\r'),('1606','UCAYALI\r'),('1607','DATEM DEL MARAÃ‘ON\r'),('1701','TAMBOPATA\r'),('1702','MANU\r'),('1703','TAHUAMANU\r'),('1801','MARISCAL NIETO\r'),('1802','GENERAL SANCHEZ CERRO\r'),('1803','ILO\r'),('1901','PASCO\r'),('1902','DANIEL ALCIDES CARRION\r'),('1903','OXAPAMPA\r'),('2001','PIURA\r'),('2002','AYABACA\r'),('2003','HUANCABAMBA\r'),('2004','MORROPON\r'),('2005','PAITA\r'),('2006','SULLANA\r'),('2007','TALARA\r'),('2008','SECHURA\r'),('2101','PUNO\r'),('2102','AZANGARO\r'),('2103','CARABAYA\r'),('2104','CHUCUITO\r'),('2105','EL COLLAO\r'),('2106','HUANCANE\r'),('2107','LAMPA\r'),('2108','MELGAR\r'),('2109','MOHO\r'),('2110','SAN ANTONIO DE PUTINA\r'),('2111','SAN ROMAN\r'),('2112','SANDIA\r'),('2113','YUNGUYO\r'),('2201','MOYOBAMBA\r'),('2202','BELLAVISTA\r'),('2203','EL DORADO\r'),('2204','HUALLAGA\r'),('2205','LAMAS\r'),('2206','MARISCAL CACERES\r'),('2207','PICOTA\r'),('2208','RIOJA\r'),('2209','SAN MARTIN\r'),('2210','TOCACHE\r'),('2301','TACNA\r'),('2302','CANDARAVE\r'),('2303','JORGE BASADRE\r'),('2304','TARATA\r'),('2401','TUMBES\r'),('2402','CONTRALMIRANTE VILLAR\r'),('2403','ZARUMILLA\r'),('2501','CORONEL PORTILLO\r'),('2502','ATALAYA\r'),('2503','PADRE ABAD\r'),('2504','PURUS\r');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sucursal` (
  `idSucursal` int(11) NOT NULL AUTO_INCREMENT,
  `codigoDepartamento` char(2) DEFAULT NULL,
  `codigoProvincia` char(4) DEFAULT NULL,
  `codigoUbigeo` char(6) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `flagEstado` bit(1) DEFAULT b'1',
  PRIMARY KEY (`idSucursal`),
  KEY `codigoDepartamento` (`codigoDepartamento`),
  KEY `codigoProvincia` (`codigoProvincia`),
  KEY `codigoUbigeo` (`codigoUbigeo`),
  CONSTRAINT `sucursal_ibfk_1` FOREIGN KEY (`codigoDepartamento`) REFERENCES `departamentos` (`codigo`),
  CONSTRAINT `sucursal_ibfk_2` FOREIGN KEY (`codigoProvincia`) REFERENCES `provincia` (`codigo`),
  CONSTRAINT `sucursal_ibfk_3` FOREIGN KEY (`codigoUbigeo`) REFERENCES `ubigeo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubigeo`
--

DROP TABLE IF EXISTS `ubigeo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubigeo` (
  `codigo` char(6) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubigeo`
--

LOCK TABLES `ubigeo` WRITE;
/*!40000 ALTER TABLE `ubigeo` DISABLE KEYS */;
INSERT INTO `ubigeo` (`codigo`, `nombre`) VALUES ('010102','ASUNCION\r'),('010103','BALSAS\r'),('010104','CHETO\r'),('010105','CHILIQUIN\r'),('010106','CHUQUIBAMBA\r'),('010107','GRANADA\r'),('010108','HUANCAS\r'),('010109','LA JALCA\r'),('010110','LEIMEBAMBA\r'),('010111','LEVANTO\r'),('010112','MAGDALENA\r'),('010113','MARISCAL CASTILLA\r'),('010114','MOLINOPAMPA\r'),('010115','MONTEVIDEO\r'),('010116','OLLEROS\r'),('010117','QUINJALCA\r'),('010118','SAN FRANCISCO DE DAGUAS\r'),('010119','SAN ISIDRO DE MAINO\r'),('010120','SOLOCO\r'),('010121','SONCHE\r'),('010201','BAGUA\r'),('010202','ARAMANGO\r'),('010203','COPALLIN\r'),('010204','EL PARCO\r'),('010205','IMAZA\r'),('010206','LA PECA\r'),('010301','JUMBILLA\r'),('010302','CHISQUILLA\r'),('010303','CHURUJA\r'),('010304','COROSHA\r'),('010305','CUISPES\r'),('010306','FLORIDA\r'),('010307','JAZAN\r'),('010308','RECTA\r'),('010309','SAN CARLOS\r'),('010310','SHIPASBAMBA\r'),('010311','VALERA\r'),('010312','YAMBRASBAMBA\r'),('010401','NIEVA\r'),('010402','EL CENEPA\r'),('010403','RIO SANTIAGO\r'),('010501','LAMUD\r'),('010502','CAMPORREDONDO\r'),('010503','COCABAMBA\r'),('010504','COLCAMAR\r'),('010505','CONILA\r'),('010506','INGUILPATA\r'),('010507','LONGUITA\r'),('010508','LONYA CHICO\r'),('010509','LUYA\r'),('010510','LUYA VIEJO\r'),('010511','MARIA\r'),('010512','OCALLI\r'),('010513','OCUMAL\r'),('010514','PISUQUIA\r'),('010515','PROVIDENCIA\r'),('010516','SAN CRISTOBAL\r'),('010517','SAN FRANCISCO DEL YESO\r'),('010518','SAN JERONIMO\r'),('010519','SAN JUAN DE LOPECANCHA\r'),('010520','SANTA CATALINA\r'),('010521','SANTO TOMAS\r'),('010522','TINGO\r'),('010523','TRITA\r'),('010601','SAN NICOLAS\r'),('010602','CHIRIMOTO\r'),('010603','COCHAMAL\r'),('010604','HUAMBO\r'),('010605','LIMABAMBA\r'),('010606','LONGAR\r'),('010607','MARISCAL BENAVIDES\r'),('010608','MILPUC\r'),('010609','OMIA\r'),('010610','SANTA ROSA\r'),('010611','TOTORA\r'),('010612','VISTA ALEGRE\r'),('010701','BAGUA GRANDE\r'),('010702','CAJARURO\r'),('010703','CUMBA\r'),('010704','EL MILAGRO\r'),('010705','JAMALCA\r'),('010706','LONYA GRANDE\r'),('010707','YAMON\r'),('020101','HUARAZ\r'),('020102','COCHABAMBA\r'),('020103','COLCABAMBA\r'),('020104','HUANCHAY\r'),('020105','INDEPENDENCIA\r'),('020106','JANGAS\r'),('020107','LA LIBERTAD\r'),('020108','OLLEROS\r'),('020109','PAMPAS\r'),('020110','PARIACOTO\r'),('020111','PIRA\r'),('020112','TARICA\r'),('020201','AIJA\r'),('020202','CORIS\r'),('020203','HUACLLAN\r'),('020204','LA MERCED\r'),('020205','SUCCHA\r'),('020301','LLAMELLIN\r'),('020302','ACZO\r'),('020303','CHACCHO\r'),('020304','CHINGAS\r'),('020305','MIRGAS\r'),('020306','SAN JUAN DE RONTOY\r'),('020401','CHACAS\r'),('020402','ACOCHACA\r'),('020501','CHIQUIAN\r'),('020502','ABELARDO PARDO LEZAMETA\r'),('020503','ANTONIO RAYMONDI\r'),('020504','AQUIA\r'),('020505','CAJACAY\r'),('020506','CANIS\r'),('020507','COLQUIOC\r'),('020508','HUALLANCA\r'),('020509','HUASTA\r'),('020510','HUAYLLACAYAN\r'),('020511','LA PRIMAVERA\r'),('020512','MANGAS\r'),('020513','PACLLON\r'),('020514','SAN MIGUEL DE CORPANQUI\r'),('020515','TICLLOS\r'),('020601','CARHUAZ\r'),('020602','ACOPAMPA\r'),('020603','AMASHCA\r'),('020604','ANTA\r'),('020605','ATAQUERO\r'),('020606','MARCARA\r'),('020607','PARIAHUANCA\r'),('020608','SAN MIGUEL DE ACO\r'),('020609','SHILLA\r'),('020610','TINCO\r'),('020611','YUNGAR\r'),('020701','SAN LUIS\r'),('020702','SAN NICOLAS\r'),('020703','YAUYA\r'),('020801','CASMA\r'),('020802','BUENA VISTA ALTA\r'),('020803','COMANDANTE NOEL\r'),('020804','YAUTAN\r'),('020901','CORONGO\r'),('020902','ACO\r'),('020903','BAMBAS\r'),('020904','CUSCA\r'),('020905','LA PAMPA\r'),('020906','YANAC\r'),('020907','YUPAN\r'),('021001','HUARI\r'),('021002','ANRA\r'),('021003','CAJAY\r'),('021004','CHAVIN DE HUANTAR\r'),('021005','HUACACHI\r'),('021006','HUACCHIS\r'),('021007','HUACHIS\r'),('021008','HUANTAR\r'),('021009','MASIN\r'),('021010','PAUCAS\r'),('021011','PONTO\r'),('021012','RAHUAPAMPA\r'),('021013','RAPAYAN\r'),('021014','SAN MARCOS\r'),('021015','SAN PEDRO DE CHANA\r'),('021016','UCO\r'),('021101','HUARMEY\r'),('021102','COCHAPETI\r'),('021103','CULEBRAS\r'),('021104','HUAYAN\r'),('021105','MALVAS\r'),('021201','CARAZ\r'),('021202','HUALLANCA\r'),('021203','HUATA\r'),('021204','HUAYLAS\r'),('021205','MATO\r'),('021206','PAMPAROMAS\r'),('021207','PUEBLO LIBRE  / 1 \r'),('021208','SANTA CRUZ\r'),('021209','SANTO TORIBIO\r'),('021210','YURACMARCA\r'),('021301','PISCOBAMBA\r'),('021302','CASCA\r'),('021303','ELEAZAR GUZMAN BARRON\r'),('021304','FIDEL OLIVAS ESCUDERO\r'),('021305','LLAMA\r'),('021306','LLUMPA\r'),('021307','LUCMA\r'),('021308','MUSGA\r'),('021401','OCROS\r'),('021402','ACAS\r'),('021403','CAJAMARQUILLA\r'),('021404','CARHUAPAMPA\r'),('021405','COCHAS\r'),('021406','CONGAS\r'),('021407','LLIPA\r'),('021408','SAN CRISTOBAL DE RAJAN\r'),('021409','SAN PEDRO\r'),('021410','SANTIAGO DE CHILCAS\r'),('021501','CABANA\r'),('021502','BOLOGNESI\r'),('021503','CONCHUCOS\r'),('021504','HUACASCHUQUE\r'),('021505','HUANDOVAL\r'),('021506','LACABAMBA\r'),('021507','LLAPO\r'),('021508','PALLASCA\r'),('021509','PAMPAS\r'),('021510','SANTA ROSA\r'),('021511','TAUCA\r'),('021601','POMABAMBA\r'),('021602','HUAYLLAN\r'),('021603','PAROBAMBA\r'),('021604','QUINUABAMBA\r'),('021701','RECUAY\r'),('021702','CATAC\r'),('021703','COTAPARACO\r'),('021704','HUAYLLAPAMPA\r'),('021705','LLACLLIN\r'),('021706','MARCA\r'),('021707','PAMPAS CHICO\r'),('021708','PARARIN\r'),('021709','TAPACOCHA\r'),('021710','TICAPAMPA\r'),('021801','CHIMBOTE\r'),('021802','CACERES DEL PERU\r'),('021803','COISHCO\r'),('021804','MACATE\r'),('021805','MORO\r'),('021806','NEPEÃ‘A\r'),('021807','SAMANCO\r'),('021808','SANTA\r'),('021809','NUEVO CHIMBOTE\r'),('021901','SIHUAS\r'),('021902','ACOBAMBA\r'),('021903','ALFONSO UGARTE\r'),('021904','CASHAPAMPA\r'),('021905','CHINGALPO\r'),('021906','HUAYLLABAMBA\r'),('021907','QUICHES\r'),('021908','RAGASH\r'),('021909','SAN JUAN\r'),('021910','SICSIBAMBA\r'),('022001','YUNGAY\r'),('022002','CASCAPARA\r'),('022003','MANCOS\r'),('022004','MATACOTO\r'),('022005','QUILLO\r'),('022006','RANRAHIRCA\r'),('022007','SHUPLUY\r'),('022008','YANAMA\r'),('030101','ABANCAY\r'),('030102','CHACOCHE\r'),('030103','CIRCA\r'),('030104','CURAHUASI\r'),('030105','HUANIPACA\r'),('030106','LAMBRAMA\r'),('030107','PICHIRHUA\r'),('030108','SAN PEDRO DE CACHORA\r'),('030109','TAMBURCO\r'),('030201','ANDAHUAYLAS\r'),('030202','ANDARAPA\r'),('030203','CHIARA\r'),('030204','HUANCARAMA\r'),('030205','HUANCARAY\r'),('030206','HUAYANA\r'),('030207','KISHUARA\r'),('030208','PACOBAMBA\r'),('030209','PACUCHA\r'),('030210','PAMPACHIRI\r'),('030211','POMACOCHA\r'),('030212','SAN ANTONIO DE CACHI\r'),('030213','SAN JERONIMO\r'),('030214','SAN MIGUEL DE CHACCRAMPA\r'),('030215','SANTA MARIA DE CHICMO\r'),('030216','TALAVERA\r'),('030217','TUMAY HUARACA\r'),('030218','TURPO\r'),('030219','KAQUIABAMBA\r'),('030301','ANTABAMBA\r'),('030302','EL ORO\r'),('030303','HUAQUIRCA\r'),('030304','JUAN ESPINOZA MEDRANO\r'),('030305','OROPESA\r'),('030306','PACHACONAS\r'),('030307','SABAINO\r'),('030401','CHALHUANCA\r'),('030402','CAPAYA\r'),('030403','CARAYBAMBA\r'),('030404','CHAPIMARCA\r'),('030405','COLCABAMBA\r'),('030406','COTARUSE\r'),('030407','HUAYLLO\r'),('030408','JUSTO APU SAHUARAURA\r'),('030409','LUCRE\r'),('030410','POCOHUANCA\r'),('030411','SAN JUAN DE CHACÃ‘A\r'),('030412','SAÃ‘AYCA\r'),('030413','SORAYA\r'),('030414','TAPAIRIHUA\r'),('030415','TINTAY\r'),('030416','TORAYA\r'),('030417','YANACA\r'),('030501','TAMBOBAMBA\r'),('030502','COTABAMBAS\r'),('030503','COYLLURQUI\r'),('030504','HAQUIRA\r'),('030505','MARA\r'),('030506','CHALLHUAHUACHO\r'),('030601','CHINCHEROS\r'),('030602','ANCO-HUALLO\r'),('030603','COCHARCAS\r'),('030604','HUACCANA\r'),('030605','OCOBAMBA\r'),('030606','ONGOY\r'),('030607','URANMARCA\r'),('030608','RANRACANCHA\r'),('030701','CHUQUIBAMBILLA\r'),('030702','CURPAHUASI\r'),('030703','GAMARRA\r'),('030704','HUAYLLATI\r'),('030705','MAMARA\r'),('030706','MICAELA BASTIDAS\r'),('030707','PATAYPAMPA\r'),('030708','PROGRESO\r'),('030709','SAN ANTONIO\r'),('030710','SANTA ROSA\r'),('030711','TURPAY\r'),('030712','VILCABAMBA\r'),('030713','VIRUNDO\r'),('030714','CURASCO\r'),('040101','AREQUIPA\r'),('040102','ALTO SELVA ALEGRE\r'),('040103','CAYMA\r'),('040104','CERRO COLORADO\r'),('040105','CHARACATO\r'),('040106','CHIGUATA\r'),('040107','JACOBO HUNTER\r'),('040108','LA JOYA\r'),('040109','MARIANO MELGAR\r'),('040110','MIRAFLORES\r'),('040111','MOLLEBAYA\r'),('040112','PAUCARPATA\r'),('040113','POCSI\r'),('040114','POLOBAYA\r'),('040115','QUEQUEÃ‘A\r'),('040116','SABANDIA\r'),('040117','SACHACA\r'),('040118','SAN JUAN DE SIGUAS /1\r'),('040119','SAN JUAN DE TARUCANI\r'),('040120','SANTA ISABEL DE SIGUAS\r'),('040121','SANTA RITA DE SIGUAS\r'),('040122','SOCABAYA\r'),('040123','TIABAYA\r'),('040124','UCHUMAYO\r'),('040125','VITOR \r'),('040126','YANAHUARA\r'),('040127','YARABAMBA\r'),('040128','YURA\r'),('040129','JOSE LUIS BUSTAMANTE Y RIVERO\r'),('040201','CAMANA\r'),('040202','JOSE MARIA QUIMPER\r'),('040203','MARIANO NICOLAS VALCARCEL\r'),('040204','MARISCAL CACERES\r'),('040205','NICOLAS DE PIEROLA\r'),('040206','OCOÃ‘A\r'),('040207','QUILCA\r'),('040208','SAMUEL PASTOR\r'),('040301','CARAVELI\r'),('040302','ACARI\r'),('040303','ATICO\r'),('040304','ATIQUIPA\r'),('040305','BELLA UNION\r'),('040306','CAHUACHO\r'),('040307','CHALA\r'),('040308','CHAPARRA\r'),('040309','HUANUHUANU\r'),('040310','JAQUI\r'),('040311','LOMAS\r'),('040312','QUICACHA\r'),('040313','YAUCA\r'),('040401','APLAO\r'),('040402','ANDAGUA\r'),('040403','AYO\r'),('040404','CHACHAS\r'),('040405','CHILCAYMARCA\r'),('040406','CHOCO\r'),('040407','HUANCARQUI\r'),('040408','MACHAGUAY\r'),('040409','ORCOPAMPA\r'),('040410','PAMPACOLCA\r'),('040411','TIPAN\r'),('040412','UÃ‘ON\r'),('040413','URACA\r'),('040414','VIRACO\r'),('040501','CHIVAY\r'),('040502','ACHOMA\r'),('040503','CABANACONDE\r'),('040504','CALLALLI\r'),('040505','CAYLLOMA\r'),('040506','COPORAQUE\r'),('040507','HUAMBO\r'),('040508','HUANCA\r'),('040509','ICHUPAMPA\r'),('040510','LARI\r'),('040511','LLUTA\r'),('040512','MACA\r'),('040513','MADRIGAL\r'),('040514','SAN ANTONIO DE CHUCA  2/\r'),('040515','SIBAYO\r'),('040516','TAPAY\r'),('040517','TISCO\r'),('040518','TUTI\r'),('040519','YANQUE\r'),('040520','MAJES\r'),('040601','CHUQUIBAMBA\r'),('040602','ANDARAY\r'),('040603','CAYARANI\r'),('040604','CHICHAS\r'),('040605','IRAY\r'),('040606','RIO GRANDE\r'),('040607','SALAMANCA\r'),('040608','YANAQUIHUA\r'),('040701','MOLLENDO\r'),('040702','COCACHACRA\r'),('040703','DEAN VALDIVIA\r'),('040704','ISLAY\r'),('040705','MEJIA\r'),('040706','PUNTA DE BOMBON\r'),('040801','COTAHUASI\r'),('040802','ALCA\r'),('040803','CHARCANA\r'),('040804','HUAYNACOTAS\r'),('040805','PAMPAMARCA\r'),('040806','PUYCA\r'),('040807','QUECHUALLA\r'),('040808','SAYLA\r'),('040809','TAURIA\r'),('040810','TOMEPAMPA\r'),('040811','TORO\r'),('050101','AYACUCHO\r'),('050102','ACOCRO\r'),('050103','ACOS VINCHOS\r'),('050104','CARMEN ALTO\r'),('050105','CHIARA\r'),('050106','OCROS\r'),('050107','PACAYCASA\r'),('050108','QUINUA\r'),('050109','SAN JOSE DE TICLLAS\r'),('050110','SAN JUAN BAUTISTA\r'),('050111','SANTIAGO DE PISCHA\r'),('050112','SOCOS\r'),('050113','TAMBILLO\r'),('050114','VINCHOS\r'),('050115','JESUS NAZARENO\r'),('050201','CANGALLO\r'),('050202','CHUSCHI\r'),('050203','LOS MOROCHUCOS\r'),('050204','MARIA PARADO DE BELLIDO\r'),('050205','PARAS\r'),('050206','TOTOS\r'),('050301','SANCOS\r'),('050302','CARAPO\r'),('050303','SACSAMARCA\r'),('050304','SANTIAGO DE LUCANAMARCA\r'),('050401','HUANTA\r'),('050402','AYAHUANCO\r'),('050403','HUAMANGUILLA\r'),('050404','IGUAIN\r'),('050405','LURICOCHA\r'),('050406','SANTILLANA\r'),('050407','SIVIA\r'),('050408','LLOCHEGUA\r'),('050501','SAN MIGUEL\r'),('050502','ANCO\r'),('050503','AYNA\r'),('050504','CHILCAS\r'),('050505','CHUNGUI\r'),('050506','LUIS CARRANZA\r'),('050507','SANTA ROSA\r'),('050508','TAMBO\r'),('050601','PUQUIO\r'),('050602','AUCARA\r'),('050603','CABANA\r'),('050604','CARMEN SALCEDO\r'),('050605','CHAVIÃ‘A\r'),('050606','CHIPAO\r'),('050607','HUAC-HUAS\r'),('050608','LARAMATE\r'),('050609','LEONCIO PRADO\r'),('050610','LLAUTA\r'),('050611','LUCANAS\r'),('050612','OCAÃ‘A\r'),('050613','OTOCA\r'),('050614','SAISA\r'),('050615','SAN CRISTOBAL\r'),('050616','SAN JUAN\r'),('050617','SAN PEDRO\r'),('050618','SAN PEDRO DE PALCO\r'),('050619','SANCOS\r'),('050620','SANTA ANA DE HUAYCAHUACHO\r'),('050621','SANTA LUCIA\r'),('050701','CORACORA\r'),('050702','CHUMPI\r'),('050703','CORONEL CASTAÃ‘EDA\r'),('050704','PACAPAUSA\r'),('050705','PULLO\r'),('050706','PUYUSCA\r'),('050707','SAN FRANCISCO DE RAVACAYCO\r'),('050708','UPAHUACHO\r'),('050801','PAUSA\r'),('050802','COLTA\r'),('050803','CORCULLA\r'),('050804','LAMPA\r'),('050805','MARCABAMBA\r'),('050806','OYOLO\r'),('050807','PARARCA\r'),('050808','SAN JAVIER DE ALPABAMBA\r'),('050809','SAN JOSE DE USHUA\r'),('050810','SARA SARA\r'),('050901','QUEROBAMBA\r'),('050902','BELEN\r'),('050903','CHALCOS\r'),('050904','CHILCAYOC\r'),('050905','HUACAÃ‘A\r'),('050906','MORCOLLA\r'),('050907','PAICO\r'),('050908','SAN PEDRO DE LARCAY\r'),('050909','SAN SALVADOR DE QUIJE\r'),('050910','SANTIAGO DE PAUCARAY\r'),('050911','SORAS\r'),('051001','HUANCAPI\r'),('051002','ALCAMENCA\r'),('051003','APONGO\r'),('051004','ASQUIPATA\r'),('051005','CANARIA\r'),('051006','CAYARA\r'),('051007','COLCA\r'),('051008','HUAMANQUIQUIA\r'),('051009','HUANCARAYLLA\r'),('051010','HUAYA\r'),('051011','SARHUA\r'),('051012','VILCANCHOS\r'),('051101','VILCAS HUAMAN\r'),('051102','ACCOMARCA\r'),('051103','CARHUANCA\r'),('051104','CONCEPCION\r'),('051105','HUAMBALPA\r'),('051106','INDEPENDENCIA /1\r'),('051107','SAURAMA\r'),('051108','VISCHONGO\r'),('060101','CAJAMARCA\r'),('060102','ASUNCION\r'),('060103','CHETILLA\r'),('060104','COSPAN\r'),('060105','ENCAÃ‘ADA\r'),('060106','JESUS\r'),('060107','LLACANORA\r'),('060108','LOS BAÃ‘OS DEL INCA\r'),('060109','MAGDALENA\r'),('060110','MATARA\r'),('060111','NAMORA\r'),('060112','SAN JUAN\r'),('060201','CAJABAMBA\r'),('060202','CACHACHI\r'),('060203','CONDEBAMBA\r'),('060204','SITACOCHA\r'),('060301','CELENDIN\r'),('060302','CHUMUCH\r'),('060303','CORTEGANA\r'),('060304','HUASMIN\r'),('060305','JORGE CHAVEZ\r'),('060306','JOSE GALVEZ\r'),('060307','MIGUEL IGLESIAS\r'),('060308','OXAMARCA\r'),('060309','SOROCHUCO\r'),('060310','SUCRE\r'),('060311','UTCO\r'),('060312','LA LIBERTAD DE PALLAN\r'),('060401','CHOTA\r'),('060402','ANGUIA\r'),('060403','CHADIN\r'),('060404','CHIGUIRIP\r'),('060405','CHIMBAN\r'),('060406','CHOROPAMPA\r'),('060407','COCHABAMBA\r'),('060408','CONCHAN\r'),('060409','HUAMBOS\r'),('060410','LAJAS\r'),('060411','LLAMA\r'),('060412','MIRACOSTA\r'),('060413','PACCHA\r'),('060414','PION\r'),('060415','QUEROCOTO\r'),('060416','SAN JUAN DE LICUPIS\r'),('060417','TACABAMBA\r'),('060418','TOCMOCHE\r'),('060419','CHALAMARCA\r'),('060501','CONTUMAZA\r'),('060502','CHILETE\r'),('060503','CUPISNIQUE\r'),('060504','GUZMANGO\r'),('060505','SAN BENITO\r'),('060506','SANTA CRUZ DE TOLED\r'),('060507','TANTARICA\r'),('060508','YONAN\r'),('060601','CUTERVO\r'),('060602','CALLAYUC\r'),('060603','CHOROS\r'),('060604','CUJILLO\r'),('060605','LA RAMADA\r'),('060606','PIMPINGOS\r'),('060607','QUEROCOTILLO\r'),('060608','SAN ANDRES DE CUTERVO\r'),('060609','SAN JUAN DE CUTERVO\r'),('060610','SAN LUIS DE LUCMA\r'),('060611','SANTA CRUZ\r'),('060612','SANTO DOMINGO DE LA CAPILLA\r'),('060613','SANTO TOMAS\r'),('060614','SOCOTA\r'),('060615','TORIBIO CASANOVA\r'),('060701','BAMBAMARCA\r'),('060702','CHUGUR\r'),('060703','HUALGAYOC\r'),('060801','JAEN\r'),('060802','BELLAVISTA\r'),('060803','CHONTALI\r'),('060804','COLASAY\r'),('060805','HUABAL\r'),('060806','LAS PIRIAS\r'),('060807','POMAHUACA\r'),('060808','PUCARA\r'),('060809','SALLIQUE\r'),('060810','SAN FELIPE\r'),('060811','SAN JOSE DEL ALTO\r'),('060812','SANTA ROSA\r'),('060901','SAN IGNACIO\r'),('060902','CHIRINOS\r'),('060903','HUARANGO\r'),('060904','LA COIPA\r'),('060905','NAMBALLE\r'),('060906','SAN JOSE DE LOURDES\r'),('060907','TABACONAS\r'),('061001','PEDRO GALVEZ\r'),('061002','CHANCAY\r'),('061003','EDUARDO VILLANUEVA\r'),('061004','GREGORIO PITA\r'),('061005','ICHOCAN\r'),('061006','JOSE MANUEL QUIROZ\r'),('061007','JOSE SABOGAL\r'),('061101','SAN MIGUEL\r'),('061102','BOLIVAR\r'),('061103','CALQUIS\r'),('061104','CATILLUC\r'),('061105','EL PRADO\r'),('061106','LA FLORIDA\r'),('061107','LLAPA\r'),('061108','NANCHOC\r'),('061109','NIEPOS\r'),('061110','SAN GREGORIO\r'),('061111','SAN SILVESTRE DE COCHAN\r'),('061112','TONGOD\r'),('061113','UNION AGUA BLANCA\r'),('061201','SAN PABLO\r'),('061202','SAN BERNARDINO\r'),('061203','SAN LUIS\r'),('061204','TUMBADEN\r'),('061301','SANTA CRUZ\r'),('061302','ANDABAMBA\r'),('061303','CATACHE\r'),('061304','CHANCAYBAÃ‘OS\r'),('061305','LA ESPERANZA\r'),('061306','NINABAMBA\r'),('061307','PULAN\r'),('061308','SAUCEPAMPA\r'),('061309','SEXI\r'),('061310','UTICYACU\r'),('061311','YAUYUCAN\r'),('070101','CALLAO\r'),('070102','BELLAVISTA\r'),('070103','CARMEN DE LA LEGUA REYNOSO\r'),('070104','LA PERLA\r'),('070105','LA PUNTA\r'),('070106','VENTANILLA\r'),('080101','CUSCO\r'),('080102','CCORCA\r'),('080103','POROY\r'),('080104','SAN JERONIMO\r'),('080105','SAN SEBASTIAN\r'),('080106','SANTIAGO\r'),('080107','SAYLLA\r'),('080108','WANCHAQ\r'),('080201','ACOMAYO\r'),('080202','ACOPIA\r'),('080203','ACOS\r'),('080204','MOSOC LLACTA\r'),('080205','POMACANCHI\r'),('080206','RONDOCAN\r'),('080207','SANGARARA\r'),('080301','ANTA\r'),('080302','ANCAHUASI\r'),('080303','CACHIMAYO\r'),('080304','CHINCHAYPUJIO\r'),('080305','HUAROCONDO\r'),('080306','LIMATAMBO\r'),('080307','MOLLEPATA\r'),('080308','PUCYURA\r'),('080309','ZURITE\r'),('080401','CALCA\r'),('080402','COYA\r'),('080403','LAMAY\r'),('080404','LARES\r'),('080405','PISAC\r'),('080406','SAN SALVADOR\r'),('080407','TARAY\r'),('080408','YANATILE\r'),('080501','YANAOCA\r'),('080502','CHECCA\r'),('080503','KUNTURKANKI\r'),('080504','LANGUI\r'),('080505','LAYO\r'),('080506','PAMPAMARCA\r'),('080507','QUEHUE\r'),('080508','TUPAC AMARU\r'),('080601','SICUANI\r'),('080602','CHECACUPE\r'),('080603','COMBAPATA\r'),('080604','MARANGANI\r'),('080605','PITUMARCA\r'),('080606','SAN PABLO\r'),('080607','SAN PEDRO\r'),('080608','TINTA\r'),('080701','SANTO TOMAS\r'),('080702','CAPACMARCA\r'),('080703','CHAMACA\r'),('080704','COLQUEMARCA\r'),('080705','LIVITACA\r'),('080706','LLUSCO\r'),('080707','QUIÃ‘OTA\r'),('080708','VELILLE\r'),('080801','ESPINAR\r'),('080802','CONDOROMA\r'),('080803','COPORAQUE\r'),('080804','OCORURO\r'),('080805','PALLPATA\r'),('080806','PICHIGUA\r'),('080807','SUYCKUTAMBO 3/\r'),('080808','ALTO PICHIGUA\r'),('080901','SANTA ANA\r'),('080902','ECHARATE\r'),('080903','HUAYOPATA /1\r'),('080904','MARANURA\r'),('080905','OCOBAMBA  /2\r'),('080906','QUELLOUNO\r'),('080907','KIMBIRI\r'),('080908','SANTA TERESA\r'),('080909','VILCABAMBA\r'),('080910','PICHARI\r'),('081001','PARURO\r'),('081002','ACCHA\r'),('081003','CCAPI\r'),('081004','COLCHA\r'),('081005','HUANOQUITE\r'),('081006','OMACHA\r'),('081007','PACCARITAMBO\r'),('081008','PILLPINTO\r'),('081009','YAURISQUE\r'),('081101','PAUCARTAMBO\r'),('081102','CAICAY\r'),('081103','CHALLABAMBA\r'),('081104','COLQUEPATA\r'),('081105','HUANCARANI\r'),('081106','KOSÃ‘IPATA\r'),('081201','URCOS\r'),('081202','ANDAHUAYLILLAS\r'),('081203','CAMANTI\r'),('081204','CCARHUAYO\r'),('081205','CCATCA\r'),('081206','CUSIPATA\r'),('081207','HUARO\r'),('081208','LUCRE\r'),('081209','MARCAPATA\r'),('081210','OCONGATE\r'),('081211','OROPESA\r'),('081212','QUIQUIJANA\r'),('081301','URUBAMBA\r'),('081302','CHINCHERO\r'),('081303','HUAYLLABAMBA\r'),('081304','MACHUPICCHU\r'),('081305','MARAS\r'),('081306','OLLANTAYTAMBO\r'),('081307','YUCAY\r'),('090101','HUANCAVELICA\r'),('090102','ACOBAMBILLA\r'),('090103','ACORIA\r'),('090104','CONAYCA\r'),('090105','CUENCA\r'),('090106','HUACHOCOLPA\r'),('090107','HUAYLLAHUARA\r'),('090108','IZCUCHACA\r'),('090109','LARIA\r'),('090110','MANTA\r'),('090111','MARISCAL CACERES\r'),('090112','MOYA\r'),('090113','NUEVO OCCORO\r'),('090114','PALCA\r'),('090115','PILCHACA\r'),('090116','VILCA\r'),('090117','YAULI\r'),('090118','ASCENSION\r'),('090119','HUANDO\r'),('090201','ACOBAMBA\r'),('090202','ANDABAMBA\r'),('090203','ANTA\r'),('090204','CAJA\r'),('090205','MARCAS\r'),('090206','PAUCARA\r'),('090207','POMACOCHA\r'),('090208','ROSARIO\r'),('090301','LIRCAY\r'),('090302','ANCHONGA\r'),('090303','CALLANMARCA\r'),('090304','CCOCHACCASA\r'),('090305','CHINCHO\r'),('090306','CONGALLA\r'),('090307','HUANCA-HUANCA\r'),('090308','HUAYLLAY GRANDE\r'),('090309','JULCAMARCA\r'),('090310','SAN ANTONIO DE ANTAPARCO\r'),('090311','SANTO TOMAS DE PATA\r'),('090312','SECCLLA\r'),('090401','CASTROVIRREYNA\r'),('090402','ARMA\r'),('090403','AURAHUA\r'),('090404','CAPILLAS\r'),('090405','CHUPAMARCA\r'),('090406','COCAS\r'),('090407','HUACHOS\r'),('090408','HUAMATAMBO\r'),('090409','MOLLEPAMPA\r'),('090410','SAN JUAN\r'),('090411','SANTA ANA\r'),('090412','TANTARA\r'),('090413','TICRAPO\r'),('090501','CHURCAMPA\r'),('090502','ANCO\r'),('090503','CHINCHIHUASI\r'),('090504','EL CARMEN\r'),('090505','LA MERCED\r'),('090506','LOCROJA\r'),('090507','PAUCARBAMBA\r'),('090508','SAN MIGUEL DE MAYOCC\r'),('090509','SAN PEDRO DE CORIS\r'),('090510','PACHAMARCA \r'),('090601','HUAYTARA\r'),('090602','AYAVI\r'),('090603','CORDOVA\r'),('090604','HUAYACUNDO ARMA\r'),('090605','LARAMARCA\r'),('090606','OCOYO\r'),('090607','PILPICHACA\r'),('090608','QUERCO\r'),('090609','QUITO-ARMA\r'),('090610','SAN ANTONIO DE CUSICANCHA\r'),('090611','SAN FRANCISCO DE SANGAYAICO\r'),('090612','SAN ISIDRO\r'),('090613','SANTIAGO DE CHOCORVOS\r'),('090614','SANTIAGO DE QUIRAHUARA\r'),('090615','SANTO DOMINGO DE CAPILLAS\r'),('090616','TAMBO\r'),('090701','PAMPAS\r'),('090702','ACOSTAMBO\r'),('090703','ACRAQUIA\r'),('090704','AHUAYCHA\r'),('090705','COLCABAMBA\r'),('090706','DANIEL HERNANDEZ\r'),('090707','HUACHOCOLPA\r'),('090709','HUARIBAMBA\r'),('090710','Ã‘AHUIMPUQUIO\r'),('090711','PAZOS\r'),('090713','QUISHUAR\r'),('090714','SALCABAMBA\r'),('090715','SALCAHUASI\r'),('090716','SAN MARCOS DE ROCCHAC\r'),('090717','SURCUBAMBA\r'),('090718','TINTAY PUNCU\r'),('100101','HUANUCO\r'),('100102','AMARILIS\r'),('100103','CHINCHAO\r'),('100104','CHURUBAMBA\r'),('100105','MARGOS\r'),('100106','QUISQUI\r'),('100107','SAN FRANCISCO DE CAYRAN\r'),('100108','SAN PEDRO DE CHAULAN\r'),('100109','SANTA MARIA DEL VALLE\r'),('100110','YARUMAYO\r'),('100111','PILLCO MARCA\r'),('100201','AMBO\r'),('100202','CAYNA\r'),('100203','COLPAS\r'),('100204','CONCHAMARCA\r'),('100205','HUACAR\r'),('100206','SAN FRANCISCO\r'),('100207','SAN RAFAEL\r'),('100208','TOMAY KICHWA\r'),('100301','LA UNION\r'),('100307','CHUQUIS\r'),('100311','MARIAS\r'),('100313','PACHAS\r'),('100316','QUIVILLA\r'),('100317','RIPAN\r'),('100321','SHUNQUI\r'),('100322','SILLAPATA\r'),('100323','YANAS\r'),('100401','HUACAYBAMBA\r'),('100402','CANCHABAMBA\r'),('100403','COCHABAMBA\r'),('100404','PINRA\r'),('100501','LLATA\r'),('100502','ARANCAY\r'),('100503','CHAVIN DE PARIARCA\r'),('100504','JACAS GRANDE\r'),('100505','JIRCAN\r'),('100506','MIRAFLORES\r'),('100507','MONZON\r'),('100508','PUNCHAO\r'),('100509','PUÃ‘OS\r'),('100510','SINGA\r'),('100511','TANTAMAYO\r'),('100601','RUPA-RUPA\r'),('100602','DANIEL ALOMIA ROBLES\r'),('100603','HERMILIO VALDIZAN\r'),('100604','JOSE CRESPO Y CASTILLO\r'),('100605','LUYANDO 1/\r'),('100606','MARIANO DAMASO BERAUN\r'),('100701','HUACRACHUCO\r'),('100702','CHOLON\r'),('100703','SAN BUENAVENTURA\r'),('100801','PANAO\r'),('100802','CHAGLLA\r'),('100803','MOLINO\r'),('100804','UMARI  \r'),('100901','PUERTO INCA\r'),('100902','CODO DEL POZUZO\r'),('100903','HONORIA\r'),('100904','TOURNAVISTA\r'),('100905','YUYAPICHIS\r'),('101001','JESUS\r'),('101002','BAÃ‘OS\r'),('101003','JIVIA\r'),('101004','QUEROPALCA\r'),('101005','RONDOS\r'),('101006','SAN FRANCISCO DE ASIS\r'),('101007','SAN MIGUEL DE CAURI\r'),('101101','CHAVINILLO\r'),('101102','CAHUAC\r'),('101103','CHACABAMBA\r'),('101104','APARICIO POMARES\r'),('101105','JACAS CHICO\r'),('101106','OBAS\r'),('101107','PAMPAMARCA\r'),('101108','CHORAS\r'),('110101','ICA\r'),('110102','LA TINGUIÃ‘A\r'),('110103','LOS AQUIJES\r'),('110104','OCUCAJE\r'),('110105','PACHACUTEC\r'),('110106','PARCONA\r'),('110107','PUEBLO NUEVO\r'),('110108','SALAS\r'),('110109','SAN JOSE DE LOS MOLINOS\r'),('110110','SAN JUAN BAUTISTA\r'),('110111','SANTIAGO\r'),('110112','SUBTANJALLA\r'),('110113','TATE\r'),('110114','YAUCA DEL ROSARIO  1/\r'),('110201','CHINCHA ALTA\r'),('110202','ALTO LARAN\r'),('110203','CHAVIN\r'),('110204','CHINCHA BAJA\r'),('110205','EL CARMEN\r'),('110206','GROCIO PRADO\r'),('110207','PUEBLO NUEVO\r'),('110208','SAN JUAN DE YANAC\r'),('110209','SAN PEDRO DE HUACARPANA\r'),('110210','SUNAMPE\r'),('110211','TAMBO DE MORA\r'),('110301','NAZCA\r'),('110302','CHANGUILLO\r'),('110303','EL INGENIO\r'),('110304','MARCONA\r'),('110305','VISTA ALEGRE\r'),('110401','PALPA\r'),('110402','LLIPATA\r'),('110403','RIO GRANDE\r'),('110404','SANTA CRUZ\r'),('110405','TIBILLO\r'),('110501','PISCO\r'),('110502','HUANCANO\r'),('110503','HUMAY\r'),('110504','INDEPENDENCIA\r'),('110505','PARACAS\r'),('110506','SAN ANDRES\r'),('110507','SAN CLEMENTE\r'),('110508','TUPAC AMARU INCA\r'),('120101','HUANCAYO\r'),('120104','CARHUACALLANGA\r'),('120105','CHACAPAMPA\r'),('120106','CHICCHE\r'),('120107','CHILCA\r'),('120108','CHONGOS ALTO\r'),('120111','CHUPURO\r'),('120112','COLCA\r'),('120113','CULLHUAS\r'),('120114','EL TAMBO\r'),('120116','HUACRAPUQUIO\r'),('120117','HUALHUAS\r'),('120119','HUANCAN\r'),('120120','HUASICANCHA\r'),('120121','HUAYUCACHI\r'),('120122','INGENIO\r'),('120124','PARIAHUANCA   1/\r'),('120125','PILCOMAYO\r'),('120126','PUCARA\r'),('120127','QUICHUAY\r'),('120128','QUILCAS\r'),('120129','SAN AGUSTIN\r'),('120130','SAN JERONIMO DE TUNAN\r'),('120132','SAÃ‘O\r'),('120133','SAPALLANGA\r'),('120134','SICAYA\r'),('120135','SANTO DOMINGO DE ACOBAMBA\r'),('120136','VIQUES\r'),('120201','CONCEPCION\r'),('120202','ACO\r'),('120203','ANDAMARCA\r'),('120204','CHAMBARA\r'),('120205','COCHAS\r'),('120206','COMAS\r'),('120207','HEROINAS TOLEDO\r'),('120208','MANZANARES\r'),('120209','MARISCAL CASTILLA\r'),('120210','MATAHUASI\r'),('120211','MITO\r'),('120212','NUEVE DE JULIO\r'),('120213','ORCOTUNA\r'),('120214','SAN JOSE DE QUERO\r'),('120215','SANTA ROSA DE OCOPA\r'),('120301','CHANCHAMAYO\r'),('120302','PERENE\r'),('120303','PICHANAQUI\r'),('120304','SAN LUIS DE SHUARO\r'),('120305','SAN RAMON\r'),('120306','VITOC\r'),('120401','JAUJA\r'),('120402','ACOLLA\r'),('120403','APATA\r'),('120404','ATAURA\r'),('120405','CANCHAYLLO\r'),('120406','CURICACA\r'),('120407','EL MANTARO\r'),('120408','HUAMALI\r'),('120409','HUARIPAMPA\r'),('120410','HUERTAS\r'),('120411','JANJAILLO\r'),('120412','JULCAN\r'),('120413','LEONOR ORDOÃ‘EZ\r'),('120414','LLOCLLAPAMPA\r'),('120415','MARCO\r'),('120416','MASMA\r'),('120417','MASMA CHICCHE\r'),('120418','MOLINOS\r'),('120419','MONOBAMBA\r'),('120420','MUQUI\r'),('120421','MUQUIYAUYO\r'),('120422','PACA\r'),('120423','PACCHA\r'),('120424','PANCAN\r'),('120425','PARCO\r'),('120426','POMACANCHA\r'),('120427','RICRAN\r'),('120428','SAN LORENZO\r'),('120429','SAN PEDRO DE CHUNAN\r'),('120430','SAUSA\r'),('120431','SINCOS\r'),('120432','TUNAN MARCA\r'),('120433','YAULI\r'),('120434','YAUYOS\r'),('120501','JUNIN\r'),('120502','CARHUAMAYO\r'),('120503','ONDORES\r'),('120504','ULCUMAYO\r'),('120601','SATIPO\r'),('120602','COVIRIALI\r'),('120603','LLAYLLA\r'),('120604','MAZAMARI\r'),('120605','PAMPA HERMOSA\r'),('120606','PANGOA\r'),('120607','RIO NEGRO\r'),('120608','RIO TAMBO\r'),('120701','TARMA\r'),('120702','ACOBAMBA\r'),('120703','HUARICOLCA\r'),('120704','HUASAHUASI\r'),('120705','LA UNION\r'),('120706','PALCA\r'),('120707','PALCAMAYO\r'),('120708','SAN PEDRO DE CAJAS\r'),('120709','TAPO\r'),('120801','LA OROYA\r'),('120802','CHACAPALPA\r'),('120803','HUAY-HUAY\r'),('120804','MARCAPOMACOCHA\r'),('120805','MOROCOCHA\r'),('120806','PACCHA\r'),('120807','SANTA BARBARA DE CARHUACAYAN\r'),('120808','SANTA ROSA DE SACCO\r'),('120809','SUITUCANCHA\r'),('120810','YAULI\r'),('120901','CHUPACA\r'),('120902','AHUAC\r'),('120903','CHONGOS BAJO\r'),('120904','HUACHAC\r'),('120905','HUAMANCACA CHICO\r'),('120906','SAN JUAN DE ISCOS\r'),('120907','SAN JUAN DE JARPA\r'),('120908','TRES DE DICIEMBRE\r'),('120909','YANACANCHA\r'),('130101','TRUJILLO\r'),('130102','EL PORVENIR\r'),('130103','FLORENCIA DE MORA\r'),('130104','HUANCHACO\r'),('130105','LA ESPERANZA\r'),('130106','LAREDO\r'),('130107','MOCHE\r'),('130108','POROTO\r'),('130109','SALAVERRY\r'),('130110','SIMBAL\r'),('130111','VICTOR LARCO HERRERA\r'),('130201','ASCOPE\r'),('130202','CHICAMA\r'),('130203','CHOCOPE\r'),('130204','MAGDALENA DE CAO\r'),('130205','PAIJAN\r'),('130206','RAZURI\r'),('130207','SANTIAGO DE CAO\r'),('130208','CASA GRANDE\r'),('130301','BOLIVAR\r'),('130302','BAMBAMARCA\r'),('130303','CONDORMARCA /1\r'),('130304','LONGOTEA\r'),('130305','UCHUMARCA\r'),('130306','UCUNCHA\r'),('130401','CHEPEN\r'),('130402','PACANGA\r'),('130403','PUEBLO NUEVO\r'),('130501','JULCAN\r'),('130502','CALAMARCA\r'),('130503','CARABAMBA\r'),('130504','HUASO\r'),('130601','OTUZCO\r'),('130602','AGALLPAMPA\r'),('130604','CHARAT\r'),('130605','HUARANCHAL\r'),('130606','LA CUESTA\r'),('130608','MACHE\r'),('130610','PARANDAY\r'),('130611','SALPO\r'),('130613','SINSICAP\r'),('130614','USQUIL\r'),('130701','SAN PEDRO DE LLOC\r'),('130702','GUADALUPE\r'),('130703','JEQUETEPEQUE\r'),('130704','PACASMAYO\r'),('130705','SAN JOSE\r'),('130801','TAYABAMBA\r'),('130802','BULDIBUYO\r'),('130803','CHILLIA\r'),('130804','HUANCASPATA\r'),('130805','HUAYLILLAS\r'),('130806','HUAYO\r'),('130807','ONGON\r'),('130808','PARCOY\r'),('130809','PATAZ\r'),('130810','PIAS\r'),('130811','SANTIAGO DE CHALLAS\r'),('130812','TAURIJA\r'),('130813','URPAY\r'),('130901','HUAMACHUCO\r'),('130902','CHUGAY\r'),('130903','COCHORCO\r'),('130904','CURGOS\r'),('130905','MARCABAL\r'),('130906','SANAGORAN\r'),('130907','SARIN\r'),('130908','SARTIMBAMBA\r'),('131001','SANTIAGO DE CHUCO\r'),('131002','ANGASMARCA\r'),('131003','CACHICADAN\r'),('131004','MOLLEBAMBA\r'),('131005','MOLLEPATA\r'),('131006','QUIRUVILCA\r'),('131007','SANTA CRUZ DE CHUCA\r'),('131008','SITABAMBA\r'),('131101','CASCAS\r'),('131102','LUCMA\r'),('131103','COMPIN\r'),('131104','SAYAPULLO\r'),('131201','VIRU\r'),('131202','CHAO\r'),('131203','GUADALUPITO\r'),('140101','CHICLAYO\r'),('140102','CHONGOYAPE\r'),('140103','ETEN\r'),('140104','ETEN PUERTO\r'),('140105','JOSE LEONARDO ORTIZ\r'),('140106','LA VICTORIA\r'),('140107','LAGUNAS   \r'),('140108','MONSEFU\r'),('140109','NUEVA ARICA\r'),('140110','OYOTUN\r'),('140111','PICSI\r'),('140112','PIMENTEL\r'),('140113','REQUE\r'),('140114','SANTA ROSA\r'),('140115','SAÃ‘A\r'),('140116','CAYALTI\r'),('140117','PATAPO\r'),('140118','POMALCA\r'),('140119','PUCALA\r'),('140120','TUMAN\r'),('140201','FERREÃ‘AFE\r'),('140202','CAÃ‘ARIS\r'),('140203','INCAHUASI\r'),('140204','MANUEL ANTONIO MESONES MURO\r'),('140205','PITIPO\r'),('140206','PUEBLO NUEVO\r'),('140301','LAMBAYEQUE\r'),('140302','CHOCHOPE\r'),('140303','ILLIMO\r'),('140304','JAYANCA\r'),('140305','MOCHUMI\r'),('140306','MORROPE\r'),('140307','MOTUPE\r'),('140308','OLMOS\r'),('140309','PACORA\r'),('140310','SALAS\r'),('140311','SAN JOSE\r'),('140312','TUCUME\r'),('150101','LIMA\r'),('150102','ANCON\r'),('150103','ATE\r'),('150104','BARRANCO\r'),('150105','BREÃ‘A\r'),('150106','CARABAYLLO\r'),('150107','CHACLACAYO\r'),('150108','CHORRILLOS\r'),('150109','CIENEGUILLA\r'),('150110','COMAS\r'),('150111','EL AGUSTINO\r'),('150112','INDEPENDENCIA\r'),('150113','JESUS MARIA\r'),('150114','LA MOLINA\r'),('150115','LA VICTORIA\r'),('150116','LINCE\r'),('150117','LOS OLIVOS\r'),('150118','LURIGANCHO\r'),('150119','LURIN\r'),('150120','MAGDALENA DEL MAR\r'),('150121','PUEBLO LIBRE\r'),('150122','MIRAFLORES\r'),('150123','PACHACAMAC\r'),('150124','PUCUSANA\r'),('150125','PUENTE PIEDRA\r'),('150126','PUNTA HERMOSA\r'),('150127','PUNTA NEGRA\r'),('150128','RIMAC\r'),('150129','SAN BARTOLO\r'),('150130','SAN BORJA\r'),('150131','SAN ISIDRO\r'),('150132','SAN JUAN DE LURIGANCHO\r'),('150133','SAN JUAN DE MIRAFLORES\r'),('150134','SAN LUIS\r'),('150135','SAN MARTIN DE PORRES\r'),('150136','SAN MIGUEL\r'),('150137','SANTA ANITA\r'),('150138','SANTA MARIA DEL MAR\r'),('150139','SANTA ROSA\r'),('150140','SANTIAGO DE SURCO\r'),('150141','SURQUILLO\r'),('150142','VILLA EL SALVADOR\r'),('150143','VILLA MARIA DEL TRIUNFO\r'),('150201','BARRANCA\r'),('150202','PARAMONGA\r'),('150203','PATIVILCA\r'),('150204','SUPE\r'),('150205','SUPE PUERTO\r'),('150301','CAJATAMBO\r'),('150302','COPA\r'),('150303','GORGOR\r'),('150304','HUANCAPON\r'),('150305','MANAS\r'),('150401','CANTA\r'),('150402','ARAHUAY\r'),('150403','HUAMANTANGA\r'),('150404','HUAROS\r'),('150405','LACHAQUI\r'),('150406','SAN BUENAVENTURA\r'),('150407','SANTA ROSA DE QUIVES\r'),('150501','SAN VICENTE DE CAÃ‘ETE\r'),('150502','ASIA\r'),('150503','CALANGO\r'),('150504','CERRO AZUL\r'),('150505','CHILCA\r'),('150506','COAYLLO\r'),('150507','IMPERIAL\r'),('150508','LUNAHUANA\r'),('150509','MALA\r'),('150510','NUEVO IMPERIAL\r'),('150511','PACARAN\r'),('150512','QUILMANA\r'),('150513','SAN ANTONIO\r'),('150514','SAN LUIS\r'),('150515','SANTA CRUZ DE FLORES\r'),('150516','ZUÃ‘IGA\r'),('150601','HUARAL\r'),('150602','ATAVILLOS ALTO\r'),('150603','ATAVILLOS BAJO\r'),('150604','AUCALLAMA\r'),('150605','CHANCAY\r'),('150606','IHUARI\r'),('150607','LAMPIAN\r'),('150608','PACARAOS\r'),('150609','SAN MIGUEL DE ACOS\r'),('150610','SANTA CRUZ DE ANDAMARCA\r'),('150611','SUMBILCA\r'),('150612','VEINTISIETE DE NOVIEMBRE\r'),('150701','MATUCANA\r'),('150702','ANTIOQUIA\r'),('150703','CALLAHUANCA\r'),('150704','CARAMPOMA\r'),('150705','CHICLA\r'),('150706','CUENCA\r'),('150707','HUACHUPAMPA\r'),('150708','HUANZA\r'),('150709','HUAROCHIRI\r'),('150710','LAHUAYTAMBO\r'),('150711','LANGA\r'),('150712','LARAOS\r'),('150713','MARIATANA\r'),('150714','RICARDO PALMA\r'),('150715','SAN ANDRES DE TUPICOCHA\r'),('150716','SAN ANTONIO\r'),('150717','SAN BARTOLOME\r'),('150718','SAN DAMIAN\r'),('150719','SAN JUAN DE IRIS\r'),('150720','SAN JUAN DE TANTARANCHE\r'),('150721','SAN LORENZO DE QUINTI\r'),('150722','SAN MATEO\r'),('150723','SAN MATEO DE OTAO\r'),('150724','SAN PEDRO DE CASTA\r'),('150725','SAN PEDRO DE HUANCAYRE\r'),('150726','SANGALLAYA\r'),('150727','SANTA CRUZ DE COCACHACRA\r'),('150728','SANTA EULALIA\r'),('150729','SANTIAGO DE ANCHUCAYA\r'),('150730','SANTIAGO DE TUNA\r'),('150731','SANTO DOMINGO DE LOS OLLEROS\r'),('150732','SURCO\r'),('150801','HUACHO\r'),('150802','AMBAR\r'),('150803','CALETA DE CARQUIN\r'),('150804','CHECRAS\r'),('150805','HUALMAY\r'),('150806','HUAURA\r'),('150807','LEONCIO PRADO\r'),('150808','PACCHO\r'),('150809','SANTA LEONOR\r'),('150810','SANTA MARIA\r'),('150811','SAYAN\r'),('150812','VEGUETA\r'),('150901','OYON\r'),('150902','ANDAJES\r'),('150903','CAUJUL\r'),('150904','COCHAMARCA\r'),('150905','NAVAN\r'),('150906','PACHANGARA\r'),('151001','YAUYOS\r'),('151002','ALIS\r'),('151003','ALLAUCA\r'),('151004','AYAVIRI\r'),('151005','AZANGARO\r'),('151006','CACRA\r'),('151007','CARANIA\r'),('151008','CATAHUASI\r'),('151009','CHOCOS\r'),('151010','COCHAS\r'),('151011','COLONIA\r'),('151012','HONGOS\r'),('151013','HUAMPARA\r'),('151014','HUANCAYA\r'),('151015','HUANGASCAR\r'),('151016','HUANTAN\r'),('151017','HUAÃ‘EC\r'),('151018','LARAOS\r'),('151019','LINCHA\r'),('151020','MADEAN\r'),('151021','MIRAFLORES\r'),('151022','OMAS\r'),('151023','PUTINZA\r'),('151024','QUINCHES\r'),('151025','QUINOCAY\r'),('151026','SAN JOAQUIN\r'),('151027','SAN PEDRO DE PILAS\r'),('151028','TANTA\r'),('151029','TAURIPAMPA\r'),('151030','TOMAS\r'),('151031','TUPE\r'),('151032','VIÃ‘AC\r'),('151033','VITIS\r'),('160101','IQUITOS\r'),('160102','ALTO NANAY\r'),('160103','FERNANDO LORES\r'),('160104','INDIANA\r'),('160105','LAS AMAZONAS\r'),('160106','MAZAN\r'),('160107','NAPO\r'),('160108','PUNCHANA\r'),('160109','PUTUMAYO    \r'),('160110','TORRES CAUSANA\r'),('160112','BELEN\r'),('160113','SAN JUAN BAUTISTA\r'),('160114','TENIENTE MANUEL CLAVERO\r'),('160201','YURIMAGUAS\r'),('160202','BALSAPUERTO\r'),('160205','JEBEROS\r'),('160206','LAGUNAS\r'),('160210','SANTA CRUZ\r'),('160211','TENIENTE CESAR LOPEZ ROJAS\r'),('160301','NAUTA\r'),('160302','PARINARI \r'),('160303','TIGRE\r'),('160304','TROMPETEROS\r'),('160305','URARINAS\r'),('160401','RAMON CASTILLA\r'),('160402','PEBAS\r'),('160403','YAVARI  /1\r'),('160404','SAN PABLO\r'),('160501','REQUENA\r'),('160502','ALTO TAPICHE\r'),('160503','CAPELO\r'),('160504','EMILIO SAN MARTIN\r'),('160505','MAQUIA\r'),('160506','PUINAHUA\r'),('160507','SAQUENA\r'),('160508','SOPLIN\r'),('160509','TAPICHE\r'),('160510','JENARO HERRERA\r'),('160511','YAQUERANA    \r'),('160601','CONTAMANA\r'),('160602','INAHUAYA\r'),('160603','PADRE MARQUEZ\r'),('160604','PAMPA HERMOSA\r'),('160605','SARAYACU\r'),('160606','VARGAS GUERRA\r'),('160701','BARRANCA\r'),('160702','CAHUAPANAS\r'),('160703','MANSERICHE\r'),('160704','MORONA\r'),('160705','PASTAZA\r'),('160706','ANDOAS\r'),('170101','TAMBOPATA\r'),('170102','INAMBARI \r'),('170103','LAS PIEDRAS\r'),('170104','LABERINTO\r'),('170201','MANU    \r'),('170202','FITZCARRALD    \r'),('170203','MADRE DE DIOS    \r'),('170204','HUEPETUHE\r'),('170301','IÃ‘APARI\r'),('170302','IBERIA\r'),('170303','TAHUAMANU\r'),('180101','MOQUEGUA\r'),('180102','CARUMAS\r'),('180103','CUCHUMBAYA\r'),('180104','SAMEGUA\r'),('180105','SAN CRISTOBAL\r'),('180106','TORATA\r'),('180201','OMATE\r'),('180202','CHOJATA\r'),('180203','COALAQUE\r'),('180204','ICHUÃ‘A\r'),('180205','LA CAPILLA\r'),('180206','LLOQUE\r'),('180207','MATALAQUE\r'),('180208','PUQUINA\r'),('180209','QUINISTAQUILLAS\r'),('180210','UBINAS\r'),('180211','YUNGA\r'),('180301','ILO\r'),('180302','EL ALGARROBAL\r'),('180303','PACOCHA\r'),('190101','CHAUPIMARCA\r'),('190102','HUACHON\r'),('190103','HUARIACA\r'),('190104','HUAYLLAY\r'),('190105','NINACACA\r'),('190106','PALLANCHACRA\r'),('190107','PAUCARTAMBO\r'),('190108','SAN FRANCISCO DE ASIS DE YARUSYACAN\r'),('190109','SIMON BOLIVAR\r'),('190110','TICLACAYAN\r'),('190111','TINYAHUARCO\r'),('190112','VICCO\r'),('190113','YANACANCHA\r'),('190201','YANAHUANCA\r'),('190202','CHACAYAN\r'),('190203','GOYLLARISQUIZGA\r'),('190204','PAUCAR\r'),('190205','SAN PEDRO DE PILLAO\r'),('190206','SANTA ANA DE TUSI\r'),('190207','TAPUC\r'),('190208','VILCABAMBA\r'),('190301','OXAPAMPA\r'),('190302','CHONTABAMBA\r'),('190303','HUANCABAMBA\r'),('190304','PALCAZU\r'),('190305','POZUZO\r'),('190306','PUERTO BERMUDEZ\r'),('190307','VILLA RICA\r'),('200101','PIURA\r'),('200104','CASTILLA\r'),('200105','CATACAOS\r'),('200107','CURA MORI\r'),('200108','EL TALLAN\r'),('200109','LA ARENA\r'),('200110','LA UNION\r'),('200111','LAS LOMAS\r'),('200114','TAMBO GRANDE\r'),('200201','AYABACA\r'),('200202','FRIAS\r'),('200203','JILILI\r'),('200204','LAGUNAS\r'),('200205','MONTERO\r'),('200206','PACAIPAMPA\r'),('200207','PAIMAS\r'),('200208','SAPILLICA\r'),('200209','SICCHEZ\r'),('200210','SUYO\r'),('200301','HUANCABAMBA\r'),('200302','CANCHAQUE\r'),('200303','EL CARMEN DE LA FRONTERA\r'),('200304','HUARMACA\r'),('200305','LALAQUIZ\r'),('200306','SAN MIGUEL DE EL FAIQUE\r'),('200307','SONDOR\r'),('200308','SONDORILLO\r'),('200401','CHULUCANAS\r'),('200402','BUENOS AIRES\r'),('200403','CHALACO\r'),('200404','LA MATANZA\r'),('200405','MORROPON\r'),('200406','SALITRAL\r'),('200407','SAN JUAN DE BIGOTE\r'),('200408','SANTA CATALINA DE MOSSA\r'),('200409','SANTO DOMINGO\r'),('200410','YAMANGO\r'),('200501','PAITA\r'),('200502','AMOTAPE\r'),('200503','ARENAL\r'),('200504','COLAN\r'),('200505','LA HUACA\r'),('200506','TAMARINDO\r'),('200507','VICHAYAL\r'),('200601','SULLANA\r'),('200602','BELLAVISTA\r'),('200603','IGNACIO ESCUDERO\r'),('200604','LANCONES\r'),('200605','MARCAVELICA\r'),('200606','MIGUEL CHECA\r'),('200607','QUERECOTILLO\r'),('200608','SALITRAL\r'),('200701','PARIÃ‘AS\r'),('200702','EL ALTO\r'),('200703','LA BREA\r'),('200704','LOBITOS\r'),('200705','LOS ORGANOS\r'),('200706','MANCORA\r'),('200801','SECHURA\r'),('200802','BELLAVISTA DE LA UNION\r'),('200803','BERNAL\r'),('200804','CRISTO NOS VALGA\r'),('200805','VICE\r'),('200806','RINCONADA LLICUAR\r'),('210101','PUNO\r'),('210102','ACORA\r'),('210103','AMANTANI\r'),('210104','ATUNCOLLA\r'),('210105','CAPACHICA\r'),('210106','CHUCUITO\r'),('210107','COATA\r'),('210108','HUATA\r'),('210109','MAÃ‘AZO\r'),('210110','PAUCARCOLLA\r'),('210111','PICHACANI\r'),('210112','PLATERIA\r'),('210113','SAN ANTONIO  /1\r'),('210114','TIQUILLACA\r'),('210115','VILQUE\r'),('210201','AZANGARO\r'),('210202','ACHAYA\r'),('210203','ARAPA\r'),('210204','ASILLO\r'),('210205','CAMINACA\r'),('210206','CHUPA\r'),('210207','JOSE DOMINGO CHOQUEHUANCA\r'),('210208','MUÃ‘ANI\r'),('210209','POTONI\r'),('210210','SAMAN\r'),('210211','SAN ANTON\r'),('210212','SAN JOSE\r'),('210213','SAN JUAN DE SALINAS\r'),('210214','SANTIAGO DE PUPUJA\r'),('210215','TIRAPATA\r'),('210301','MACUSANI\r'),('210302','AJOYANI\r'),('210303','AYAPATA\r'),('210304','COASA\r'),('210305','CORANI\r'),('210306','CRUCERO\r'),('210307','ITUATA   2/\r'),('210308','OLLACHEA\r'),('210309','SAN GABAN\r'),('210310','USICAYOS\r'),('210401','JULI\r'),('210402','DESAGUADERO\r'),('210403','HUACULLANI\r'),('210404','KELLUYO\r'),('210405','PISACOMA\r'),('210406','POMATA\r'),('210407','ZEPITA\r'),('210501','ILAVE\r'),('210502','CAPAZO\r'),('210503','PILCUYO\r'),('210504','SANTA ROSA\r'),('210505','CONDURIRI\r'),('210601','HUANCANE\r'),('210602','COJATA\r'),('210603','HUATASANI\r'),('210604','INCHUPALLA\r'),('210605','PUSI\r'),('210606','ROSASPATA\r'),('210607','TARACO\r'),('210608','VILQUE CHICO\r'),('210701','LAMPA\r'),('210702','CABANILLA\r'),('210703','CALAPUJA\r'),('210704','NICASIO\r'),('210705','OCUVIRI\r'),('210706','PALCA\r'),('210707','PARATIA\r'),('210708','PUCARA\r'),('210709','SANTA LUCIA\r'),('210710','VILAVILA\r'),('210801','AYAVIRI\r'),('210802','ANTAUTA\r'),('210803','CUPI\r'),('210804','LLALLI\r'),('210805','MACARI\r'),('210806','NUÃ‘OA\r'),('210807','ORURILLO\r'),('210808','SANTA ROSA\r'),('210809','UMACHIRI\r'),('210901','MOHO\r'),('210902','CONIMA\r'),('210903','HUAYRAPATA\r'),('210904','TILALI\r'),('211001','PUTINA\r'),('211002','ANANEA\r'),('211003','PEDRO VILCA APAZA\r'),('211004','QUILCAPUNCU\r'),('211005','SINA\r'),('211101','JULIACA\r'),('211102','CABANA\r'),('211103','CABANILLAS\r'),('211104','CARACOTO\r'),('211201','SANDIA\r'),('211202','CUYOCUYO\r'),('211203','LIMBANI\r'),('211204','PATAMBUCO\r'),('211205','PHARA\r'),('211206','QUIACA\r'),('211207','SAN JUAN DEL ORO\r'),('211208','YANAHUAYA\r'),('211209','ALTO INAMBARI\r'),('211210','SAN PEDRO DE PUTINA PUNCO\r'),('211301','YUNGUYO\r'),('211302','ANAPIA\r'),('211303','COPANI\r'),('211304','CUTURAPI\r'),('211305','OLLARAYA\r'),('211306','TINICACHI\r'),('211307','UNICACHI\r'),('220101','MOYOBAMBA\r'),('220102','CALZADA\r'),('220103','HABANA\r'),('220104','JEPELACIO\r'),('220105','SORITOR\r'),('220106','YANTALO\r'),('220201','BELLAVISTA\r'),('220202','ALTO BIAVO\r'),('220203','BAJO BIAVO\r'),('220204','HUALLAGA\r'),('220205','SAN PABLO\r'),('220206','SAN RAFAEL\r'),('220301','SAN JOSE DE SISA\r'),('220302','AGUA BLANCA\r'),('220303','SAN MARTIN\r'),('220304','SANTA ROSA\r'),('220305','SHATOJA\r'),('220401','SAPOSOA\r'),('220402','ALTO SAPOSOA\r'),('220403','EL ESLABON\r'),('220404','PISCOYACU\r'),('220405','SACANCHE\r'),('220406','TINGO DE SAPOSOA\r'),('220501','LAMAS\r'),('220502','ALONSO DE ALVARADO\r'),('220503','BARRANQUITA\r'),('220504','CAYNARACHI   1/\r'),('220505','CUÃ‘UMBUQUI\r'),('220506','PINTO RECODO\r'),('220507','RUMISAPA\r'),('220508','SAN ROQUE DE CUMBAZA\r'),('220509','SHANAO\r'),('220510','TABALOSOS\r'),('220511','ZAPATERO\r'),('220601','JUANJUI\r'),('220602','CAMPANILLA\r'),('220603','HUICUNGO\r'),('220604','PACHIZA\r'),('220605','PAJARILLO\r'),('220701','PICOTA\r'),('220702','BUENOS AIRES\r'),('220703','CASPISAPA\r'),('220704','PILLUANA\r'),('220705','PUCACACA\r'),('220706','SAN CRISTOBAL\r'),('220707','SAN HILARION\r'),('220708','SHAMBOYACU\r'),('220709','TINGO DE PONASA\r'),('220710','TRES UNIDOS\r'),('220801','RIOJA\r'),('220802','AWAJUN\r'),('220803','ELIAS SOPLIN VARGAS\r'),('220804','NUEVA CAJAMARCA\r'),('220805','PARDO MIGUEL\r'),('220806','POSIC\r'),('220807','SAN FERNANDO\r'),('220808','YORONGOS\r'),('220809','YURACYACU\r'),('220901','TARAPOTO\r'),('220902','ALBERTO LEVEAU\r'),('220903','CACATACHI\r'),('220904','CHAZUTA\r'),('220905','CHIPURANA\r'),('220906','EL PORVENIR\r'),('220907','HUIMBAYOC\r'),('220908','JUAN GUERRA\r'),('220909','LA BANDA DE SHILCAYO\r'),('220910','MORALES\r'),('220911','PAPAPLAYA\r'),('220912','SAN ANTONIO\r'),('220913','SAUCE\r'),('220914','SHAPAJA\r'),('221001','TOCACHE\r'),('221002','NUEVO PROGRESO\r'),('221003','POLVORA\r'),('221004','SHUNTE  2/ \r'),('221005','UCHIZA\r'),('230101','TACNA\r'),('230102','ALTO DE LA ALIANZA\r'),('230103','CALANA\r'),('230104','CIUDAD NUEVA\r'),('230105','INCLAN\r'),('230106','PACHIA\r'),('230107','PALCA\r'),('230108','POCOLLAY\r'),('230109','SAMA\r'),('230110','CORONEL GREGORIO ALBARRACIN LANCHIPA\r'),('230201','CANDARAVE\r'),('230202','CAIRANI\r'),('230203','CAMILACA\r'),('230204','CURIBAYA\r'),('230205','HUANUARA\r'),('230206','QUILAHUANI\r'),('230301','LOCUMBA\r'),('230302','ILABAYA\r'),('230303','ITE\r'),('230401','TARATA\r'),('230402','HEROES ALBARRACIN\r'),('230403','ESTIQUE\r'),('230404','ESTIQUE-PAMPA\r'),('230405','SITAJARA\r'),('230406','SUSAPAYA\r'),('230407','TARUCACHI\r'),('230408','TICACO\r'),('240101','TUMBES\r'),('240102','CORRALES\r'),('240103','LA CRUZ\r'),('240104','PAMPAS DE HOSPITAL\r'),('240105','SAN JACINTO\r'),('240106','SAN JUAN DE LA VIRGEN\r'),('240201','ZORRITOS\r'),('240202','CASITAS\r'),('240203','CANOAS DE PUNTA SAL\r'),('240301','ZARUMILLA\r'),('240302','AGUAS VERDES\r'),('240303','MATAPALO\r'),('240304','PAPAYAL\r'),('250101','CALLERIA\r'),('250102','CAMPOVERDE\r'),('250103','IPARIA\r'),('250104','MASISEA\r'),('250105','YARINACOCHA\r'),('250106','NUEVA REQUENA\r'),('250107','MANANTAY\r'),('250201','RAYMONDI\r'),('250202','SEPAHUA\r'),('250203','TAHUANIA\r'),('250204','YURUA\r'),('250301','PADRE ABAD\r'),('250302','IRAZOLA\r'),('250303','CURIMANA\r'),('250401','PURUS\r');
/*!40000 ALTER TABLE `ubigeo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `IdUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `idVendedor` int(11) DEFAULT NULL,
  `correo` varchar(20) DEFAULT NULL,
  `clave` varchar(300) DEFAULT NULL,
  `flagHabilitado` bit(1) DEFAULT b'1',
  `flagEstado` bit(1) DEFAULT b'1',
  PRIMARY KEY (`IdUsuario`),
  KEY `idVendedor` (`idVendedor`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idVendedor`) REFERENCES `vendedor` (`idVendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`IdUsuario`, `idVendedor`, `correo`, `clave`, `flagHabilitado`, `flagEstado`) VALUES (1,NULL,'luis@gmail.com','12345','',''),(2,1,'pp@gmail.com','12345','','');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendedor` (
  `idVendedor` int(11) NOT NULL AUTO_INCREMENT,
  `idSupervisor` int(11) DEFAULT NULL,
  `codigoVendedor` char(8) NOT NULL,
  `docIdentidad` char(8) NOT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidoPaterno` varchar(80) DEFAULT NULL,
  `apellidoMaterno` varchar(80) DEFAULT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `idSucursal` int(11) NOT NULL,
  `nombreSucursal` varchar(100) DEFAULT NULL,
  `fechaNacimiento` datetime DEFAULT NULL,
  `fechaRegistro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `flagHabilitado` bit(1) DEFAULT b'1',
  `flagEstado` bit(1) DEFAULT b'1',
  PRIMARY KEY (`idVendedor`),
  KEY `idSucursal` (`idSucursal`),
  KEY `idSupervisor` (`idSupervisor`),
  CONSTRAINT `vendedor_ibfk_1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursal` (`idSucursal`),
  CONSTRAINT `vendedor_ibfk_2` FOREIGN KEY (`idSupervisor`) REFERENCES `vendedor` (`idVendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` (`idVendedor`, `idSupervisor`, `codigoVendedor`, `docIdentidad`, `nombres`, `apellidoPaterno`, `apellidoMaterno`, `telefono`, `correo`, `idSucursal`, `nombreSucursal`, `fechaNacimiento`, `fechaRegistro`, `flagHabilitado`, `flagEstado`) VALUES (1,NULL,'V001','12345678','Pepe','Ramirez','Vasquez','123456789','pp@gmail.com',1,'LIMA','1980-01-01 00:00:00','2015-11-25 00:00:00','','');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cotizaciones'
--

--
-- Dumping routines for database 'cotizaciones'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-04  1:11:11
