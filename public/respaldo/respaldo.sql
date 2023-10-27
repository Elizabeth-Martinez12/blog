-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

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
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  `description` varchar(2500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments_posts`
--

DROP TABLE IF EXISTS `attachments_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post` int(11) NOT NULL,
  `attachment` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post` (`post`),
  KEY `attachment` (`attachment`),
  CONSTRAINT `attachment` FOREIGN KEY (`attachment`) REFERENCES `attachments` (`id`),
  CONSTRAINT `post` FOREIGN KEY (`post`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments_posts`
--

LOCK TABLES `attachments_posts` WRITE;
/*!40000 ALTER TABLE `attachments_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Profesional','Unete a los mapaches',1),(2,'Tematico','Datos que no conocias',1),(3,'Profesional','Cocinemos increibles recetas juntos',1),(4,'Personal','Mantente saludable',1),(5,'Personal','Creemos nuevas cosas juntos',1),(6,'Personal','Quierete a ti mismo antes que alguien mas',1),(7,'Tematico','Bailemos al ritmo',1),(8,'Comercial','Todo lo que quieres en una guitarra',1),(9,'Profesional','Conoce mas sobre tu mascota',1),(10,'Profesional','Canta a tu propio ritmo',1),(11,'Profesional','Creando historias que inspiren y te lleven a otra dimension',1),(12,'Corporativo','Aprende a como hacer crecer tu dinero',1),(13,'Profesional','Estudiemos juntos los elementos',1),(14,'Corporativo','Entrevistas y mas informacion a tu alcance',1),(15,'Personal','Aprende a lucir bien',1),(16,'Corporativo','Armemos un caso',1),(17,'Profesional','Como saber hacer una buena pelicula',1),(18,'Profesional','Aprende a valorarte',1),(19,'Personal','Cuentame un secreto que deseas compartir',1),(20,'Personal','Sirvo para escuchar y darte mi humilde opinion',1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post1` (`post`),
  CONSTRAINT `post1` FOREIGN KEY (`post`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,'Necesito saber donde puedo obtener mas informacion sobre la carrera que quiero',NULL,NULL,NULL),(2,2,'En serio eso pasaba en el Vaticano :0',NULL,NULL,NULL),(3,3,'Increible receta, gracias por compartir',NULL,NULL,NULL),(4,4,'Son muy buenas recomendaciones, creo que me serviran mucho',NULL,NULL,NULL),(5,5,'A mi hija le encanto la mariposa,mil gracias <3',NULL,NULL,NULL),(6,6,'Me sentia un poco mal conmigo misma, pero veo que tambien existe gente que se siente como yo',NULL,NULL,NULL),(7,7,'A mi me gusta mucho bailar, gracias',NULL,NULL,NULL),(8,8,'Me gusta mucho la segunda de la lista, espero con ansias',NULL,NULL,NULL),(9,9,'Yo amo mucho a los animales aunque no se como cuidarlos de manera correcta',NULL,NULL,NULL),(10,10,'Comence a cantar en tonos mas altos gracias a estas recomendaciones',NULL,NULL,NULL),(11,11,'Me encanto el libro, ame los personajes',NULL,NULL,NULL),(12,12,'Mis ahorros ya no tendran que esperar para crecer',NULL,NULL,NULL),(13,13,'Me sirve para mi clase de quimica',NULL,NULL,NULL),(14,14,'Mucho que decir poco que mostrar',NULL,NULL,NULL),(15,15,'Tenia acne pero con la ayuda de estos productos mejoro',NULL,NULL,NULL),(16,16,'La verdad es un caso demasiado fuerte',NULL,NULL,NULL),(17,17,'Para mi la pelicula se me hizo interesante aunque un poco confusa',NULL,NULL,NULL),(18,18,'Apenas hoy me entero que sufro de estres',NULL,NULL,NULL),(19,19,'Yo siempre he sido de comprender lo mejor posible',NULL,NULL,NULL),(20,20,'Me siento como un niño infantil espero esto me pueda ayudar',NULL,NULL,NULL);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `autor` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  KEY `autor` (`autor`),
  CONSTRAINT `autor` FOREIGN KEY (`autor`) REFERENCES `users` (`id`),
  CONSTRAINT `category` FOREIGN KEY (`category`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,1,'Ficha de ingreso','Pasos para solicitar ficha',1,'2023-08-30 09:07:00',NULL,NULL),(2,2,2,'5 curiosidades del Vaticano','Lista de 5 datos',0,'2020-08-30 10:00:00',NULL,NULL),(3,3,3,'Spaguetti con albondigas','Guia paso a paso para preparar',1,'2023-08-30 08:15:00',NULL,NULL),(4,4,4,'Habitos para mantenerte saludable','Lista de ejercicios',1,'2023-08-30 10:05:00',NULL,NULL),(5,5,5,'Mariposas con hojas','Pasos para realizar la manualidad',0,'2019-09-01 09:25:00',NULL,NULL),(6,6,6,'Frases para motivar','Autores de frases para tener mejor autoestima',0,'2016-09-01 12:13:00',NULL,NULL),(7,7,7,'Como calentar el cuerpo antes de bailar','Rutinas de calentamiento',1,'2023-09-01 07:30:00',NULL,NULL),(8,8,8,'Las guitarras mas esperadas','Lista de guitarras con sus caracteristicas',0,'2023-09-01 09:20:00',NULL,NULL),(9,9,9,'Como cuidar un perro de manera correcta','Pasos de como es cuidar a una mascota',0,'2023-09-01 11:19:00',NULL,NULL),(10,10,10,'Afina tus cuerdas bucales','Cuidados para cantar mejor',0,'2017-09-02 10:22:00',NULL,NULL),(11,11,11,'El amor es una ilusion','Nuevo lanzamiento de ultima obra',0,'2020-09-02 07:00:00',NULL,NULL),(12,12,12,'Invierte de manera legal','Consejos de como saber invertir',0,'2022-09-02 07:45:00',NULL,NULL),(13,13,13,'Cadenas de carbono','Explicacion de lo que es una cadena',0,'2011-09-02 08:50:00',NULL,NULL),(14,14,14,'Discurso del presidente','Narracion de lo dicho por el mandatario',1,'2023-09-02 09:15:00',NULL,NULL),(15,15,15,'Como cuidar tu piel','Productos que se pueden usar en la piel',1,'2023-09-01 11:00:00',NULL,NULL),(16,16,16,'Caso de Zoe','Investigacion sobre niña',1,'2023-09-02 10:34:00',NULL,NULL),(17,17,17,'Los indestructibles','Punto de vista sobre la pelicula',0,'2011-09-02 11:08:00',NULL,NULL),(18,18,18,'Como saber si sufro de estres','Lista de posibles sintomas de estres',1,'2023-09-03 08:20:00',NULL,NULL),(19,19,19,'Como saber comprender','Saber que hacer para no tener malas acciones',0,'2021-09-03 09:10:00',NULL,NULL),(20,20,20,'Como tomar buenas desiciones','Opiones sobre como madurar',0,'2022-09-03 10:16:00',NULL,NULL);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `purchase_price` float NOT NULL,
  `unit_price` float NOT NULL,
  `min_stock` int(11) NOT NULL,
  `max_stock` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `dimensions` varchar(155) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `observation` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `category` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `discontinued` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`),
  KEY `fk_category_product` (`category`),
  CONSTRAINT `fk_category_product` FOREIGN KEY (`category`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile` varchar(20) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'admin',NULL,1,NULL,NULL,NULL),(2,'revisor',NULL,1,NULL,NULL,NULL),(3,'editor',NULL,1,NULL,NULL,NULL),(4,'autor',NULL,1,NULL,NULL,NULL),(5,'colaborador',NULL,1,NULL,NULL,NULL),(6,'suscriptor',NULL,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `lastname` varchar(80) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `photo` varchar(250) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id_usuario` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (1,'Edgar','Degante','2000-08-01','m','2312066656',NULL,'mapaches.info',1,'2023-08-29 10:00:00',NULL,NULL),(2,'Gael','Dominguez','2001-09-16','m','2315874692',NULL,'curiosidades.sif',1,'2023-08-29 10:01:00',NULL,NULL),(3,'Leo','Trinidad','1999-05-29','m','2311526984',NULL,'guiadecocina.nai',1,'2023-08-29 10:02:00',NULL,NULL),(4,'Jonathan','Julian','2003-04-26','m','2315469872',NULL,'ejercios.salud',1,'2023-08-29 10:03:00',NULL,NULL),(5,'Judith','Allende','2002-02-27','f','2316987436',NULL,'manualidades.psa',1,'2023-08-29 10:04:00',NULL,NULL),(6,'Natalia','Guerrero','2003-06-14','f','2311547963',NULL,'motivacion.amor',1,'2023-08-29 10:05:00',NULL,NULL),(7,'Lizbeth','Perdomo','2003-09-06','f','2314589632',NULL,'baila.music',1,'2023-08-29 10:06:00',NULL,NULL),(8,'Luke','Howland','2000-12-09','m','2316578246',NULL,'guitarra.store',1,'2023-08-29 10:07:00',NULL,NULL),(9,'Kathia','Martinez','2002-07-17','f','2311254784',NULL,'veterinaria.pet',1,'2023-08-29 10:08:00',NULL,NULL),(10,'Hasley','Weigel','2001-03-15','f','2314258963',NULL,'canta.show',1,'2023-08-29 10:09:00',NULL,NULL),(11,'Damian','Fox','2004-09-09','m','2311457825',NULL,'escritores.book',1,'2023-08-29 10:10:00',NULL,NULL),(12,'Poe','Verne','2001-09-09','m','2313698457',NULL,'economia.money',1,'2023-08-29 10:11:00',NULL,NULL),(13,'Tatiana','Jasson','2002-05-19','f','2311458769',NULL,'quimica.lab',1,'2023-08-29 10:12:00',NULL,NULL),(14,'Padme','Gray','2005-10-05','f','2314587269',NULL,'prensa.noti',1,'2023-08-29 10:13:00',NULL,NULL),(15,'Alicia','Thomson','2005-11-01','f','2314586239',NULL,'belleza.life',1,'2023-08-29 10:14:00',NULL,NULL),(16,'Eris','Shay','2005-09-09','f','2311457864',NULL,'documentadores.lupa',1,'2023-08-29 10:15:00',NULL,NULL),(17,'Jack','Ross','2002-06-02','m','2316587234',NULL,'cine.movie',1,'2023-08-29 10:16:00',NULL,NULL),(18,'Jen','Brown','2002-02-13','f','2311364895',NULL,'Psicologa.sal',1,'2023-08-29 10:17:00',NULL,NULL),(19,'Naya','Tonali','2003-12-15','f','2316589742',NULL,'secreto.chisme',1,'2023-08-29 10:18:00',NULL,NULL),(20,'Will','Clark','2002-04-11','m','2314369871',NULL,'consejero.help',1,'2023-08-29 10:19:00',NULL,NULL);
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `profile` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profile` (`profile`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`profile`) REFERENCES `profiles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Edgar','1234',1,1,'2015-03-17 09:40:00',NULL,NULL),(2,'Gael','45875',1,2,'2018-06-23 09:43:00',NULL,NULL),(3,'Leo','87563',0,3,'2020-08-05 09:44:00',NULL,NULL),(4,'Jonathan','45239',1,4,'2019-07-29 09:45:00',NULL,NULL),(5,'Judith','21456',1,5,'2017-04-21 09:46:00',NULL,NULL),(6,'Natalia','36987',0,6,'2015-11-07 09:47:00',NULL,NULL),(7,'Lizbeth','78952',1,2,'2014-08-02 09:48:00',NULL,NULL),(8,'Luke','54789',1,3,'2019-12-12 09:49:00',NULL,NULL),(9,'Kathia','25798',0,4,'2018-07-17 09:50:00',NULL,NULL),(10,'Hasley','36140',1,5,'2020-01-26 09:51:00',NULL,NULL),(11,'Damian','12547',1,6,'2014-02-18 09:52:00',NULL,NULL),(12,'Poe','03654',0,2,'2020-09-14 09:53:00',NULL,NULL),(13,'Tatiana','78546',1,3,'2015-10-09 09:54:00',NULL,NULL),(14,'Padme','35484',1,4,'2012-10-30 09:55:00',NULL,NULL),(15,'Alicia','85252',0,5,'2019-04-12 09:56:00',NULL,NULL),(16,'Eris','15549',1,6,'2016-11-12 09:55:00',NULL,NULL),(17,'Jack','66555',1,2,'2011-08-23 09:58:00',NULL,NULL),(18,'Jen','76594',0,3,'2017-05-15 09:59:00',NULL,NULL),(19,'Naya','85965',1,4,'2020-06-10 10:00:00',NULL,NULL),(20,'Will','46455',1,5,'2021-08-05 10:01:00',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-26 23:06:50
