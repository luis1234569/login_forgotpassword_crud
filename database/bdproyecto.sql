-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: dbproyecto
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acceso_empresas`
--

DROP TABLE IF EXISTS `acceso_empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acceso_empresas` (
  `id` int(11) NOT NULL,
  `user` varchar(50) DEFAULT NULL,
  `bd` varchar(50) DEFAULT NULL,
  `empresa` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acceso_empresas`
--

LOCK TABLES `acceso_empresas` WRITE;
/*!40000 ALTER TABLE `acceso_empresas` DISABLE KEYS */;
INSERT INTO `acceso_empresas` VALUES (1,'admin','elhost_pos','empresaejemplo'),(2,'admin2','elhost_pos2','empresaejemplo'),(3,'vendedor','elhost_pos2','empresaejemplo'),(4,'vendedor2','elhost_pos2','empresaejemplo'),(5,'vendedor2','elhost_posdemo','empresademo');
/*!40000 ALTER TABLE `acceso_empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accesos_empresas`
--

DROP TABLE IF EXISTS `accesos_empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accesos_empresas` (
  `acceso_empresa_id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) DEFAULT NULL,
  `bd` varchar(50) DEFAULT NULL,
  `empresa` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`acceso_empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accesos_empresas`
--

LOCK TABLES `accesos_empresas` WRITE;
/*!40000 ALTER TABLE `accesos_empresas` DISABLE KEYS */;
/*!40000 ALTER TABLE `accesos_empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id2` int(11) NOT NULL DEFAULT 1755657895,
  `parent` varchar(100) DEFAULT 's/n',
  `description` varchar(100) DEFAULT 's/n',
  `link` varchar(100) NOT NULL,
  `node_order` varchar(100) NOT NULL,
  `activo` int(1) NOT NULL DEFAULT 1,
  `usuario` varchar(255) NOT NULL,
  `idusuario` varchar(20) NOT NULL,
  `idempresa` int(11) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,'0','ARCHIVO','','0',1,'Administrador','Administrator',1),(2,2,'1','EMPRESA','grid_empresa','1',1,'Administrador','Administrator',1),(3,3,'1','SUCURSAL','grid_sucursal','1',1,'Administrador','Administrator',1),(4,4,'1','CLIENTE','form_clientes123','1',1,'Administrador','Administrator',1),(7,1755657895,'2','LOGARITMO','FANTAMOUNT.COM','1',1,'GABRIEL','1',5);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_apps`
--

DROP TABLE IF EXISTS `sec_apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_apps` (
  `sec_apps_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(128) DEFAULT NULL,
  `app_type` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sec_apps_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_apps`
--

LOCK TABLES `sec_apps` WRITE;
/*!40000 ALTER TABLE `sec_apps` DISABLE KEYS */;
INSERT INTO `sec_apps` VALUES (1,'app_change_pswd','contr','Security Application'),(2,'blank_chequeo_saldos1','blank',NULL),(3,'control_conexion','contr',NULL),(4,'form_acceso_empresas','form',NULL),(5,'grid_cuenta','cons',NULL),(6,'menu_pos','menu','');
/*!40000 ALTER TABLE `sec_apps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_groups`
--

DROP TABLE IF EXISTS `sec_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_groups` (
  `sec_groups_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sec_groups_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_groups`
--

LOCK TABLES `sec_groups` WRITE;
/*!40000 ALTER TABLE `sec_groups` DISABLE KEYS */;
INSERT INTO `sec_groups` VALUES (1,'Administrador'),(2,'Administrador2'),(3,'cliente'),(4,'laboratorio'),(5,'rayosx'),(6,'Vendedor');
/*!40000 ALTER TABLE `sec_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_groups_apps`
--

DROP TABLE IF EXISTS `sec_groups_apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_groups_apps` (
  `sec_groups_apps_id` int(11) NOT NULL AUTO_INCREMENT,
  `sec_groups_id` int(11) DEFAULT NULL,
  `sec_apps_id` int(11) DEFAULT NULL,
  `priv_access` varchar(1) DEFAULT 'N',
  `priv_insert` varchar(1) DEFAULT 'N',
  `priv_delete` varchar(1) DEFAULT 'N',
  `priv_update` varchar(1) DEFAULT 'N',
  `priv_export` varchar(1) DEFAULT 'N',
  `priv_print` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`sec_groups_apps_id`),
  KEY `fk_group_apps` (`sec_groups_id`),
  KEY `fk_app` (`sec_apps_id`),
  CONSTRAINT `fk_app` FOREIGN KEY (`sec_apps_id`) REFERENCES `sec_apps` (`sec_apps_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_apps` FOREIGN KEY (`sec_groups_id`) REFERENCES `sec_groups` (`sec_groups_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_groups_apps`
--

LOCK TABLES `sec_groups_apps` WRITE;
/*!40000 ALTER TABLE `sec_groups_apps` DISABLE KEYS */;
INSERT INTO `sec_groups_apps` VALUES (1,1,2,'Y','N','N','N','N','N'),(2,1,5,'Y','Y','Y','Y','Y','Y'),(3,1,3,'N','N','N','N','N','N'),(4,1,2,'Y','Y','Y','Y','Y','Y'),(5,1,3,'Y','Y','Y','Y','Y','Y');
/*!40000 ALTER TABLE `sec_groups_apps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_logged`
--

DROP TABLE IF EXISTS `sec_logged`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_logged` (
  `sec_logged_id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) DEFAULT NULL,
  `date_login` varchar(128) DEFAULT NULL,
  `sc_session` varchar(32) DEFAULT NULL,
  `ip` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`sec_logged_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_logged`
--

LOCK TABLES `sec_logged` WRITE;
/*!40000 ALTER TABLE `sec_logged` DISABLE KEYS */;
INSERT INTO `sec_logged` VALUES (1,'vendedor','15012021','','127.0.0.1'),(2,'admin','15012021','','127.0.0.1'),(3,'vendedor','15012021','','127.0.0.1');
/*!40000 ALTER TABLE `sec_logged` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_users`
--

DROP TABLE IF EXISTS `sec_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_users` (
  `sec_users_id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) DEFAULT NULL,
  `pswd` varchar(255) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `active` varchar(1) DEFAULT NULL,
  `activation_code` varchar(32) DEFAULT NULL,
  `priv_admin` varchar(1) DEFAULT NULL,
  `empresa` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sec_users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_users`
--

LOCK TABLES `sec_users` WRITE;
/*!40000 ALTER TABLE `sec_users` DISABLE KEYS */;
INSERT INTO `sec_users` VALUES (1,'admin','4297f44b13955235245b2497399d7a93','Admin','admin@admin.com','Y','','Y','elhost_empresa'),(2,'admin2','4297f44b13955235245b2497399d7a93','Admin','admin@admin.com','Y','','Y','elhost_empresa'),(3,'cliente','202cb962ac59075b964b07152d234b70','cliente','cliente@hotmail.com','Y','','','elhost_empresa'),(4,'Vendedor','148fvdg18dv1fv178df1v87df1981d8s9f1v91','vendedor','vendedor@gmail.com',NULL,NULL,NULL,NULL),(5,'user','$2a$05$FeR7Xjvns5/Rof3WdGinPeNrZsAniOqmpHcsab5g.OMxTcGubDHP.','test','lav@gmail.com',NULL,NULL,NULL,'empresaejemplo'),(6,'user2','$2a$05$ASMdBCmKi5YXuLxC5u42eOzbf1F/micfzna/vTZJDlN65BiN8/6Pm','test','lav@gmail.com',NULL,NULL,NULL,'empresaejemplo'),(7,'luis','$2a$05$aHwzTjFVuO9n6CGFO3y8bulpEqanPV95SzHjHAq2vOdiNyFzCsRjy','luis albert','lav.ruiz@yavirac.edu.ec',NULL,NULL,NULL,'yavirac'),(8,'name','$2a$05$UJpTSj.IgwpWR2s3fT82Pe3.RayhuMp6v9IOwyy0bGMKI6Ec6oCda','siul ziur','lav.ruiz@yavirac.edu.ec',NULL,NULL,NULL,'yavirac');
/*!40000 ALTER TABLE `sec_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_users_groups`
--

DROP TABLE IF EXISTS `sec_users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_users_groups` (
  `sec_users_groups_id` int(11) NOT NULL AUTO_INCREMENT,
  `sec_users_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sec_users_groups_id`),
  KEY `fk_group` (`group_id`),
  KEY `fk_usuario` (`sec_users_id`),
  CONSTRAINT `fk_group` FOREIGN KEY (`group_id`) REFERENCES `sec_groups` (`sec_groups_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario` FOREIGN KEY (`sec_users_id`) REFERENCES `sec_users` (`sec_users_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_users_groups`
--

LOCK TABLES `sec_users_groups` WRITE;
/*!40000 ALTER TABLE `sec_users_groups` DISABLE KEYS */;
INSERT INTO `sec_users_groups` VALUES (9,1,1),(10,2,2),(11,3,6),(12,4,3);
/*!40000 ALTER TABLE `sec_users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('aZbxJGSeYaAs0_qws4G6eLWjXJ64shM5',1648305910,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":7}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-28 11:26:02
