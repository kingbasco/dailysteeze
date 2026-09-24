-- MySQL dump 10.13  Distrib 8.4.4, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: amerce
-- ------------------------------------------------------
-- Server version	8.4.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'vf8vsKuQWjcTWSGhrpwNGfaE0u8kcqwK',1,'2026-05-28 18:59:07','2026-05-28 18:59:07','2026-05-28 18:59:07');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` datetime DEFAULT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicked` bigint NOT NULL DEFAULT '0',
  `order` int DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `open_in_new_tab` tinyint(1) NOT NULL DEFAULT '1',
  `tablet_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ads_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_adsense_slot_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ads_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads_translations`
--

DROP TABLE IF EXISTS `ads_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ads_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tablet_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ads_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads_translations`
--

LOCK TABLES `ads_translations` WRITE;
/*!40000 ALTER TABLE `ads_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ads_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_action` tinyint(1) NOT NULL DEFAULT '0',
  `action_label` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_open_new_tab` tinyint(1) NOT NULL DEFAULT '0',
  `dismissible` tinyint(1) NOT NULL DEFAULT '0',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements_translations`
--

DROP TABLE IF EXISTS `announcements_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `announcements_id` bigint unsigned NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `action_label` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`announcements_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements_translations`
--

LOCK TABLES `announcements_translations` WRITE;
/*!40000 ALTER TABLE `announcements_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'Botble\\ACL\\Models\\User',
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actor_id` bigint unsigned NOT NULL,
  `actor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'Botble\\ACL\\Models\\User',
  `reference_id` bigint unsigned NOT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_index` (`parent_id`),
  KEY `categories_status_index` (`status`),
  KEY `categories_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'New Parents',0,'Guides and reassurance for the first weeks and months with a newborn.','published',1,'Botble\\ACL\\Models\\User',NULL,0,0,1,'2026-05-28 18:59:09','2026-05-28 18:59:09'),(2,'Baby Care',0,'Daily care, gentle products, and habits that support a healthy little one.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2026-05-28 18:59:09','2026-05-28 18:59:09'),(3,'Sleep &amp; Routines',0,'Soothing rituals, nap schedules, and tools for calmer nights.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2026-05-28 18:59:09','2026-05-28 18:59:09'),(4,'Nutrition',0,'Feeding milestones, weaning, and clean nutrition for growing babies.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2026-05-28 18:59:09','2026-05-28 18:59:09'),(5,'Safety',0,'Practical safety advice, gear checks, and peace-of-mind essentials.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2026-05-28 18:59:09','2026-05-28 18:59:09');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`categories_id`),
  KEY `idx_categories_trans_categories_id` (`categories_id`),
  KEY `idx_categories_trans_category_lang` (`categories_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
INSERT INTO `categories_translations` VALUES ('ar',1,'الآباء الجدد','الإرشاد والطمأنينة في الأسابيع والأشهر الأولى مع مولودك الجديد.'),('ar',2,'رعاية الطفل','العناية اليومية والمنتجات والعادات اللطيفة التي تدعم صحة الطفل.'),('ar',3,'Sleep &amp; Routines','Soothing rituals, nap schedules, and tools for calmer nights.'),('ar',4,'تَغذِيَة','مراحل الأكل والفطام والتغذية الصحية لنمو الأطفال.'),('ar',5,'أمان','نصائح عملية تتعلق بالسلامة، وفحص العتاد، وأساسيات راحة البال.'),('fr',1,'Nouveaux parents','Conseils et réconfort pendant les premières semaines et mois avec votre nouveau-né.'),('fr',2,'Soins de bébé','Des soins quotidiens, des produits doux et des habitudes qui favorisent un bébé en bonne santé.'),('fr',3,'Sleep &amp; Routines','Soothing rituals, nap schedules, and tools for calmer nights.'),('fr',4,'Nutrition','Étapes d’alimentation, de sevrage et de nutrition saine pour les bébés en pleine croissance.'),('fr',5,'Sécurité','Conseils pratiques de sécurité, contrôle du matériel et essentiels pour la tranquillité d\'esprit.'),('id',1,'Orang Tua Baru','Bimbingan dan kepastian untuk minggu dan bulan pertama bersama bayi baru lahir Anda.'),('id',2,'Perawatan Bayi','Perawatan sehari-hari, produk lembut dan kebiasaan yang mendukung bayi sehat.'),('id',3,'Sleep &amp; Routines','Soothing rituals, nap schedules, and tools for calmer nights.'),('id',4,'Nutrisi','Pola makan, penyapihan, dan nutrisi yang sehat merupakan tonggak sejarah bagi pertumbuhan bayi.'),('id',5,'Keamanan','Saran keselamatan praktis, pemeriksaan perlengkapan, dan hal-hal penting yang menenangkan pikiran.'),('tr',1,'Yeni Ebeveynler','Yeni doğmuş bebeğinizle ilk haftalar ve aylar için rehberlik ve güvence.'),('tr',2,'Bebek Bakımı','Sağlıklı bir bebeği destekleyen günlük bakım, nazik ürünler ve alışkanlıklar.'),('tr',3,'Sleep &amp; Routines','Soothing rituals, nap schedules, and tools for calmer nights.'),('tr',4,'Beslenme','Büyüyen bebekler için yemek yeme, sütten kesme ve sağlıklı beslenme kilometre taşları.'),('tr',5,'Emniyet','Pratik güvenlik tavsiyeleri, vites kontrolleri ve gönül rahatlığıyla ilgili temel bilgiler.'),('vi',1,'Cha Mẹ Mới','Hướng dẫn và lời trấn an cho những tuần và tháng đầu tiên cùng trẻ sơ sinh.'),('vi',2,'Chăm Sóc Bé','Chăm sóc hằng ngày, sản phẩm dịu nhẹ và những thói quen hỗ trợ một em bé khỏe mạnh.'),('vi',3,'Sleep &amp; Routines','Soothing rituals, nap schedules, and tools for calmer nights.'),('vi',4,'Dinh Dưỡng','Các cột mốc ăn uống, cai sữa và dinh dưỡng lành mạnh cho bé đang lớn.'),('vi',5,'An Toàn','Lời khuyên an toàn thiết thực, kiểm tra đồ dùng và những điều thiết yếu giúp yên tâm.');
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` bigint unsigned DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `record_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cities_slug_unique` (`slug`),
  KEY `idx_cities_name` (`name`),
  KEY `idx_cities_state_status` (`state_id`,`status`),
  KEY `idx_cities_status` (`status`),
  KEY `idx_cities_state_id` (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_translations`
--

DROP TABLE IF EXISTS `cities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cities_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`cities_id`),
  KEY `idx_cities_trans_city_lang` (`cities_id`,`lang_code`),
  KEY `idx_cities_trans_name` (`name`),
  KEY `idx_cities_trans_cities_id` (`cities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_translations`
--

LOCK TABLES `cities_translations` WRITE;
/*!40000 ALTER TABLE `cities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options`
--

DROP TABLE IF EXISTS `contact_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options`
--

LOCK TABLES `contact_custom_field_options` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options_translations`
--

DROP TABLE IF EXISTS `contact_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options_translations` (
  `contact_custom_field_options_id` bigint unsigned NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_field_options_id`),
  KEY `idx_contact_cfo_trans_cfo_id` (`contact_custom_field_options_id`),
  KEY `idx_contact_cfo_trans_cfo_lang` (`contact_custom_field_options_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options_translations`
--

LOCK TABLES `contact_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields`
--

DROP TABLE IF EXISTS `contact_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '999',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields`
--

LOCK TABLES `contact_custom_fields` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields_translations`
--

DROP TABLE IF EXISTS `contact_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields_translations` (
  `contact_custom_fields_id` bigint unsigned NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_fields_id`),
  KEY `idx_contact_cf_trans_cf_id` (`contact_custom_fields_id`),
  KEY `idx_contact_cf_trans_cf_lang` (`contact_custom_fields_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields_translations`
--

LOCK TABLES `contact_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Sophia Bennett','sophia.bennett@example.com','+1-415-555-0142','124 Folsom Street, San Francisco, CA','Question about international shipping rates','Hi team — could you tell me whether you ship to Singapore and what the typical delivery window is for the spring outerwear collection? Many thanks.',NULL,'read','2026-05-28 18:59:07','2026-05-28 18:59:07'),(2,'Marcus Tan','marcus.tan@example.com','+44-20-7946-0312','47 Hatton Garden, London EC1N','Wholesale enquiry — boutique partnership','Good morning. I run a curated mens boutique in central London. We would love to discuss stocking a small selection of your accessories range. Could you send over your wholesale lookbook and minimum order quantities?',NULL,'unread','2026-05-28 18:59:07','2026-05-28 18:59:07'),(3,'Elena Rodriguez','elena.rodriguez@example.com','+34-93-555-0188','Carrer de Mallorca 287, Barcelona','Order #AM-10458 — color confirmation','Could you confirm the exact shade of the walnut side table I ordered last week? I want to make sure it matches the rest of my living room before it ships.',NULL,'read','2026-05-28 18:59:07','2026-05-28 18:59:07');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_countries_name` (`name`),
  KEY `idx_countries_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_translations`
--

DROP TABLE IF EXISTS `countries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`countries_id`),
  KEY `idx_countries_trans_country_lang` (`countries_id`,`lang_code`),
  KEY `idx_countries_trans_name` (`name`),
  KEY `idx_countries_trans_countries_id` (`countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_translations`
--

LOCK TABLES `countries_translations` WRITE;
/*!40000 ALTER TABLE `countries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `widget_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_tokens`
--

DROP TABLE IF EXISTS `device_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_tokens_token_unique` (`token`),
  KEY `device_tokens_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `device_tokens_platform_is_active_index` (`platform`,`is_active`),
  KEY `device_tokens_is_active_index` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_tokens`
--

LOCK TABLES `device_tokens` WRITE;
/*!40000 ALTER TABLE `device_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_abandoned_carts`
--

DROP TABLE IF EXISTS `ec_abandoned_carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_abandoned_carts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned DEFAULT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_data` json NOT NULL,
  `total_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `items_count` int NOT NULL DEFAULT '0',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abandoned_at` timestamp NULL DEFAULT NULL,
  `reminder_sent_at` timestamp NULL DEFAULT NULL,
  `reminders_sent` int NOT NULL DEFAULT '0',
  `last_email_sequence` tinyint unsigned NOT NULL DEFAULT '0',
  `recovery_token` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicked_at` timestamp NULL DEFAULT NULL,
  `unsubscribe_token` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unsubscribed_at` timestamp NULL DEFAULT NULL,
  `is_recovered` tinyint(1) NOT NULL DEFAULT '0',
  `recovered_at` timestamp NULL DEFAULT NULL,
  `recovered_order_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_abandoned_carts_recovery_token_unique` (`recovery_token`),
  UNIQUE KEY `ec_abandoned_carts_unsubscribe_token_unique` (`unsubscribe_token`),
  KEY `ec_abandoned_carts_abandoned_at_is_recovered_index` (`abandoned_at`,`is_recovered`),
  KEY `ec_abandoned_carts_created_at_is_recovered_index` (`created_at`,`is_recovered`),
  KEY `ec_abandoned_carts_customer_id_index` (`customer_id`),
  KEY `ec_abandoned_carts_session_id_index` (`session_id`),
  KEY `ec_abandoned_carts_email_index` (`email`),
  KEY `ec_abandoned_carts_recovered_order_id_index` (`recovered_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_abandoned_carts`
--

LOCK TABLES `ec_abandoned_carts` WRITE;
/*!40000 ALTER TABLE `ec_abandoned_carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_abandoned_carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_brands`
--

DROP TABLE IF EXISTS `ec_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_brands` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_brands`
--

LOCK TABLES `ec_brands` WRITE;
/*!40000 ALTER TABLE `ec_brands` DISABLE KEYS */;
INSERT INTO `ec_brands` VALUES (1,'Anthro','Eclectic apparel and home goods inspired by global craftsmanship traditions.','https://example.com/anthro','brands/anthro.png','published',0,1,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(2,'Anvouge','Modern fashion essentials cut from sustainable fibers.','https://example.com/anvouge','brands/anvouge.png','published',1,1,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(3,'Bohome','Bohemian-inspired homewares and textiles for the relaxed modern home.','https://example.com/bohome','brands/bohome.png','published',2,1,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(4,'Carolin','Demi-fine jewelry made by hand in small Italian ateliers.','https://example.com/carolin','brands/carolin.png','published',3,1,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(5,'Cheryl','Bold prints and silhouettes for the contemporary woman.','https://example.com/cheryl','brands/cheryl.png','published',4,0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(6,'Crate','Mid-century-inspired furniture built to last generations.','https://example.com/crate','brands/crate.png','published',5,1,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(7,'Findr','Audio gear engineered for studio-grade clarity in everyday environments.','https://example.com/findr','brands/findr.png','published',6,0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(8,'Intdeco','Interior accents that bridge minimalism and warmth.','https://example.com/intdeco','brands/intdeco.png','published',7,0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(9,'Modave','Performance activewear made with recycled high-stretch knits.','https://example.com/modave','brands/modave.png','published',8,0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(10,'Panadoxn','Botanical skincare formulated by clinical herbalists.','https://example.com/panadoxn','brands/panadoxn.png','published',9,0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(11,'Shangxi','Heritage tea, ceramics, and meditation accessories.','https://example.com/shangxi','brands/shangxi.png','published',10,0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(12,'Sopify','Smart home devices designed for renters and travelers.','https://example.com/sopify','brands/sopify.png','published',11,0,'2026-05-28 18:59:08','2026-05-28 18:59:08');
/*!40000 ALTER TABLE `ec_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_brands_translations`
--

DROP TABLE IF EXISTS `ec_brands_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_brands_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_brands_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ec_brands_id`),
  KEY `idx_brands_fk` (`ec_brands_id`),
  KEY `idx_brands_brands_lang` (`ec_brands_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_brands_translations`
--

LOCK TABLES `ec_brands_translations` WRITE;
/*!40000 ALTER TABLE `ec_brands_translations` DISABLE KEYS */;
INSERT INTO `ec_brands_translations` VALUES ('ar',1,'أنثرو','ملابس وأدوات منزلية متعددة الأنماط مستوحاة من التقاليد الحرفية العالمية.'),('ar',2,'أنفوج','أساسيات الموضة الحديثة مقطوعة من ألياف مستدامة.'),('ar',3,'بوهوم','أدوات منزلية ومنسوجات مستوحاة من الطراز البوهيمي للمنزل العصري المريح.'),('ar',4,'كارولين','تُصنع المجوهرات نصف الفاخرة يدويًا في ورش صغيرة في إيطاليا.'),('ar',5,'شيريل','أنماط وأشكال متميزة للمرأة العصرية.'),('ar',6,'قفص','تم تصميم الأثاث المستوحى من منتصف القرن ليدوم لأجيال.'),('ar',7,'مكتشف','معدات صوتية مصممة لتحقيق وضوح بجودة الاستوديو في البيئات اليومية.'),('ar',8,'انتديكو','تجمع المزايا الداخلية بين البساطة والراحة.'),('ar',9,'موداف','معدات تدريب عالية الأداء مصنوعة من نسيج مطاطي مُعاد تدويره.'),('ar',10,'بانادوكسن','مستحضرات التجميل الطبيعية التي بحثها خبراء الأعشاب السريرية.'),('ar',11,'شانغشى','الشاي التراثي والسيراميك وإكسسوارات التأمل.'),('ar',12,'سوبيفاي','أجهزة منزلية ذكية مصممة للمستأجرين والزوار.'),('fr',1,'Anthro','Vêtements et articles pour la maison multi-styles inspirés des traditions artisanales mondiales.'),('fr',2,'Anvouge','Des essentiels de la mode moderne coupés à partir de fibres durables.'),('fr',3,'Bohème','Articles de maison et textiles d\'inspiration bohème pour une maison moderne et décontractée.'),('fr',4,'Caroline','Les bijoux demi-fins sont fabriqués à la main dans de petits ateliers en Italie.'),('fr',5,'Cheryl','Des motifs et des formes exceptionnels pour les femmes modernes.'),('fr',6,'Caisse','Les meubles inspirés du milieu du siècle sont conçus pour durer des générations.'),('fr',7,'Trouver','Équipement audio conçu pour une clarté de qualité studio dans les environnements quotidiens.'),('fr',8,'Intdéco','Les points forts de l\'intérieur allient minimalisme et confort.'),('fr',9,'Modave','Équipement d\'entraînement haute performance fabriqué à partir de tissu extensible recyclé.'),('fr',10,'Panadoxn','Cosmétiques naturels recherchés par des experts cliniques en plantes médicinales.'),('fr',11,'Shangxi','Thé du patrimoine, céramiques et accessoires de méditation.'),('fr',12,'Sopifier','Appareils domestiques intelligents conçus pour les locataires et les visiteurs.'),('id',1,'Antro','Pakaian dan peralatan rumah tangga multi-gaya yang terinspirasi oleh tradisi kerajinan global.'),('id',2,'Anvouge','Perlengkapan fesyen modern yang dipotong dari serat ramah lingkungan.'),('id',3,'Bohome','Peralatan rumah tangga dan tekstil yang terinspirasi bohemian untuk rumah modern yang santai.'),('id',4,'Karolina','Perhiasan demi-fine dibuat dengan tangan di bengkel-bengkel kecil di Italia.'),('id',5,'Cheryl','Pola dan bentuk luar biasa untuk wanita modern.'),('id',6,'Peti','Furnitur yang terinspirasi abad pertengahan dibuat untuk bertahan selama beberapa generasi.'),('id',7,'Temukan','Perlengkapan audio dirancang untuk kejernihan kualitas studio di lingkungan sehari-hari.'),('id',8,'Intdeco','Sorotan interior memadukan minimalis dan kenyamanan.'),('id',9,'Modifikasi','Perlengkapan latihan berperforma tinggi yang terbuat dari kain stretch daur ulang.'),('id',10,'Panadoxn','Kosmetik alami yang diteliti oleh para ahli herbal klinis.'),('id',11,'Shangxi','Teh warisan, keramik, dan aksesoris meditasi.'),('id',12,'Sopify','Perangkat rumah pintar yang dirancang untuk penyewa dan pengunjung.'),('tr',1,'Antropo','Küresel zanaat geleneklerinden ilham alan çok stilde giysiler ve ev eşyaları.'),('tr',2,'Anvouge','Sürdürülebilir elyaflardan kesilmiş modern moda temelleri.'),('tr',3,'Bohome','Rahat ve modern ev için bohem esintili ev eşyaları ve tekstil ürünleri.'),('tr',4,'Carolin','Yarı kaliteli takılar İtalya\'daki küçük atölyelerde el yapımıdır.'),('tr',5,'Cheryl','Modern kadınlar için olağanüstü desenler ve şekiller.'),('tr',6,'Sandık','Yüzyılın ortasından ilham alan mobilyalar nesiller boyu dayanacak şekilde tasarlandı.'),('tr',7,'Bulucu','Günlük ortamlarda stüdyo kalitesinde netlik için tasarlanmış ses ekipmanı.'),('tr',8,'Indeco','İç mekandaki vurgular minimalizm ve rahatlığı birleştiriyor.'),('tr',9,'modave','Geri dönüştürülmüş esnek kumaştan yapılmış yüksek performanslı antrenman ekipmanı.'),('tr',10,'Panadoxn','Klinik bitkisel uzmanlar tarafından araştırılan doğal kozmetikler.'),('tr',11,'Şangxi','Miras çay, seramik ve meditasyon aksesuarları.'),('tr',12,'sopify','Kiracılar ve ziyaretçiler için tasarlanmış akıllı ev cihazları.'),('vi',1,'Anthro','Trang phục và đồ gia dụng đa phong cách lấy cảm hứng từ truyền thống thủ công toàn cầu.'),('vi',2,'Anvouge','Đồ thời trang thiết yếu hiện đại được cắt may từ sợi bền vững.'),('vi',3,'Bohome','Đồ gia dụng và dệt may cảm hứng bohemian cho ngôi nhà hiện đại thư thái.'),('vi',4,'Carolin','Trang sức demi-fine làm thủ công tại các xưởng nhỏ ở Ý.'),('vi',5,'Cheryl','Họa tiết và phom dáng nổi bật dành cho phụ nữ hiện đại.'),('vi',6,'Crate','Nội thất cảm hứng mid-century được chế tác bền vững qua nhiều thế hệ.'),('vi',7,'Findr','Thiết bị âm thanh thiết kế cho độ rõ chuẩn studio trong môi trường thường ngày.'),('vi',8,'Intdeco','Điểm nhấn nội thất kết hợp giữa tối giản và ấm cúng.'),('vi',9,'Modave','Đồ tập hiệu năng cao làm từ vải thun co giãn tái chế.'),('vi',10,'Panadoxn','Mỹ phẩm thiên nhiên được nghiên cứu bởi các chuyên gia thảo dược lâm sàng.'),('vi',11,'Shangxi','Trà di sản, gốm sứ và phụ kiện thiền.'),('vi',12,'Sopify','Thiết bị nhà thông minh thiết kế dành cho người thuê nhà và du khách.');
/*!40000 ALTER TABLE `ec_brands_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_cart`
--

DROP TABLE IF EXISTS `ec_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_cart` (
  `identifier` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint unsigned DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`identifier`,`instance`),
  KEY `ec_cart_customer_instance_index` (`customer_id`,`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_cart`
--

LOCK TABLES `ec_cart` WRITE;
/*!40000 ALTER TABLE `ec_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_currencies`
--

DROP TABLE IF EXISTS `ec_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint unsigned DEFAULT '0',
  `number_format_style` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'western',
  `space_between_price_and_currency` tinyint(1) NOT NULL DEFAULT '0',
  `order` int unsigned DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_currencies`
--

LOCK TABLES `ec_currencies` WRITE;
/*!40000 ALTER TABLE `ec_currencies` DISABLE KEYS */;
INSERT INTO `ec_currencies` VALUES (1,'USD','$',1,2,'western',0,0,1,1,'2026-05-28 18:59:07','2026-05-28 18:59:07'),(2,'EUR','€',0,2,'western',0,1,0,0.84,'2026-05-28 18:59:07','2026-05-28 18:59:07'),(3,'VND','₫',0,0,'western',0,2,0,23203,'2026-05-28 18:59:07','2026-05-28 18:59:07'),(4,'NGN','₦',1,2,'western',0,2,0,895.52,'2026-05-28 18:59:07','2026-05-28 18:59:07');
/*!40000 ALTER TABLE `ec_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_addresses`
--

DROP TABLE IF EXISTS `ec_customer_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` bigint unsigned NOT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_addresses`
--

LOCK TABLES `ec_customer_addresses` WRITE;
/*!40000 ALTER TABLE `ec_customer_addresses` DISABLE KEYS */;
INSERT INTO `ec_customer_addresses` VALUES (1,'Emma Collins','customer@botble.com','+1-555-0105','CA','Michigan','Austin','987 Birch Boulevard',1,1,'2026-05-28 18:59:15','2026-05-28 18:59:15','19101'),(2,'Emma Collins','customer@botble.com','+1-555-0102','GB','Ohio','Chicago','789 Pine Road',1,0,'2026-05-28 18:59:15','2026-05-28 18:59:15','10001'),(3,'Sophia Ramirez','vendor@botble.com','+1-555-0107','CA','Pennsylvania','Phoenix','741 Spruce Street',2,1,'2026-05-28 18:59:16','2026-05-28 18:59:16','10001'),(4,'Sophia Ramirez','vendor@botble.com','+1-555-0103','GB','Texas','Los Angeles','258 Walnut Way',2,0,'2026-05-28 18:59:16','2026-05-28 18:59:16','30301'),(5,'Olivia Carter','customer1@example.com','+1-555-0101','GB','Florida','Houston','321 Maple Drive',3,1,'2026-05-28 18:59:16','2026-05-28 18:59:16','60601'),(6,'Ava Mitchell','customer2@example.com','+1-555-0109','GB','Illinois','Miami','987 Birch Boulevard',4,1,'2026-05-28 18:59:16','2026-05-28 18:59:16','30301'),(7,'Isabella Brooks','customer3@example.com','+1-555-0108','AU','Ohio','Austin','369 Cherry Circle',5,1,'2026-05-28 18:59:16','2026-05-28 18:59:16','85001'),(8,'James Whitfield','customer4@example.com','+1-555-0103','GB','Ohio','Dallas','789 Pine Road',6,1,'2026-05-28 18:59:17','2026-05-28 18:59:17','90210'),(9,'Liam Bennett','customer5@example.com','+1-555-0107','GB','New York','Houston','147 Elm Court',7,1,'2026-05-28 18:59:17','2026-05-28 18:59:17','80201'),(10,'Noah Patterson','customer6@example.com','+1-555-0108','GB','Arizona','Dallas','456 Oak Avenue',8,1,'2026-05-28 18:59:17','2026-05-28 18:59:17','30301'),(11,'Charlotte Reed','customer7@example.com','+1-555-0105','GB','Ohio','Phoenix','123 Main Street',9,1,'2026-05-28 18:59:17','2026-05-28 18:59:17','80201'),(12,'Amelia Foster','customer8@example.com','+1-555-0108','DE','California','San Diego','456 Oak Avenue',10,1,'2026-05-28 18:59:18','2026-05-28 18:59:18','48201');
/*!40000 ALTER TABLE `ec_customer_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_deletion_requests`
--

DROP TABLE IF EXISTS `ec_customer_deletion_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_deletion_requests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verification_code` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_expires_at` timestamp NULL DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'waiting_for_confirmation',
  `reason` text COLLATE utf8mb4_unicode_ci,
  `confirmed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_customer_deletion_requests_token_unique` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_deletion_requests`
--

LOCK TABLES `ec_customer_deletion_requests` WRITE;
/*!40000 ALTER TABLE `ec_customer_deletion_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_deletion_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_password_resets`
--

DROP TABLE IF EXISTS `ec_customer_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `ec_customer_password_resets_email_index` (`email`),
  KEY `ec_customer_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_password_resets`
--

LOCK TABLES `ec_customer_password_resets` WRITE;
/*!40000 ALTER TABLE `ec_customer_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_recently_viewed_products`
--

DROP TABLE IF EXISTS `ec_customer_recently_viewed_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_recently_viewed_products` (
  `customer_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`customer_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_recently_viewed_products`
--

LOCK TABLES `ec_customer_recently_viewed_products` WRITE;
/*!40000 ALTER TABLE `ec_customer_recently_viewed_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_recently_viewed_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_used_coupons`
--

DROP TABLE IF EXISTS `ec_customer_used_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_used_coupons` (
  `discount_id` bigint unsigned NOT NULL,
  `customer_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_used_coupons`
--

LOCK TABLES `ec_customer_used_coupons` WRITE;
/*!40000 ALTER TABLE `ec_customer_used_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_used_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customers`
--

DROP TABLE IF EXISTS `ec_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `tax_class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'regular',
  `tax_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_vendor` tinyint(1) NOT NULL DEFAULT '0',
  `vendor_verified_at` datetime DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activated',
  `block_reason` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `private_notes` text COLLATE utf8mb4_unicode_ci,
  `stripe_account_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_account_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ec_customers_is_vendor_index` (`is_vendor`),
  KEY `ec_customers_vendor_verified_at_index` (`vendor_verified_at`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customers`
--

LOCK TABLES `ec_customers` WRITE;
/*!40000 ALTER TABLE `ec_customers` DISABLE KEYS */;
INSERT INTO `ec_customers` VALUES (1,'Emma Collins','customer@botble.com','$2y$12$QLLOJu2fPObsZWNTGu0V1eKvZIg4mPbr6xFzZzswHDnGfOuUZyIK.','testimonials/avatar-1.jpg','1983-04-30','regular',NULL,'+1-555-0101',NULL,'2026-05-28 18:59:15','2026-05-28 18:59:15','2026-05-29 01:59:15',NULL,0,NULL,'activated',NULL,NULL,NULL,0),(2,'Sophia Ramirez','vendor@botble.com','$2y$12$JMJZX4mGlmpydungawM3uONlyFPYOhmUcoJkp66BX5brUc24SpoKq','testimonials/avatar-2.jpg','1992-05-26','regular',NULL,'+1-555-0102',NULL,'2026-05-28 18:59:16','2026-05-28 18:59:18','2026-05-29 01:59:15',NULL,1,'2026-05-29 01:59:18','activated',NULL,NULL,NULL,0),(3,'Olivia Carter','customer1@example.com','$2y$12$aMKW1RDFQRosuBU75YiY3Oo3ojBDY8ix7Bz9b8eLSRRUSloVB7A2K','testimonials/avatar-3.jpg','1980-04-29','regular',NULL,'+1-555-0109',NULL,'2026-05-28 18:59:16','2026-05-28 18:59:18','2026-05-29 01:59:15',NULL,1,'2026-05-29 01:59:18','activated',NULL,NULL,NULL,0),(4,'Ava Mitchell','customer2@example.com','$2y$12$UQjTHyFbczFf8JckEucSd.OUYvJrDF.8ctBSI8yYUtzkQ3JfdB8cO','testimonials/avatar-4.jpg','1996-05-07','regular',NULL,'+1-555-0106',NULL,'2026-05-28 18:59:16','2026-05-28 18:59:18','2026-05-29 01:59:15',NULL,1,'2026-05-29 01:59:18','activated',NULL,NULL,NULL,0),(5,'Isabella Brooks','customer3@example.com','$2y$12$j/dugM2W4M1HvIhH0VDz2OfgGLS7olQQqW8fh7zp9Gg3K9j1zNieC','testimonials/avatar-5.jpg','1996-05-26','regular',NULL,'+1-555-0107',NULL,'2026-05-28 18:59:16','2026-05-28 18:59:19','2026-05-29 01:59:15',NULL,1,'2026-05-29 01:59:18','activated',NULL,NULL,NULL,0),(6,'James Whitfield','customer4@example.com','$2y$12$CW7MV54Em7V8CsyY25hee.IloRReelVkFYtvLlk/wRIxR6qgEYrva','testimonials/avatar-6.jpg','1984-05-14','regular',NULL,'+1-555-0101',NULL,'2026-05-28 18:59:17','2026-05-28 18:59:19','2026-05-29 01:59:15',NULL,1,'2026-05-29 01:59:18','activated',NULL,NULL,NULL,0),(7,'Liam Bennett','customer5@example.com','$2y$12$mOe3hefjbUhi.B.5LqOR7umiWALshnEa.laQK9YLXT9leSJPQgYP6','testimonials/avatar-7.jpg','1996-04-29','regular',NULL,'+1-555-0102',NULL,'2026-05-28 18:59:17','2026-05-28 18:59:19','2026-05-29 01:59:15',NULL,1,'2026-05-29 01:59:18','activated',NULL,NULL,NULL,0),(8,'Noah Patterson','customer6@example.com','$2y$12$tu97u6qnr9CmCZX0K.D4z.7v8mHHTFZLyDHMl.AHmVDi4oi0MTom.','testimonials/avatar-8.jpg','1988-05-20','regular',NULL,'+1-555-0108',NULL,'2026-05-28 18:59:17','2026-05-28 18:59:19','2026-05-29 01:59:15',NULL,1,'2026-05-29 01:59:18','activated',NULL,NULL,NULL,0),(9,'Charlotte Reed','customer7@example.com','$2y$12$3k2KPBGpwnYDHn5rAov2SOtMuw8EuLT5pWUubSI4dbWBpnxVI5r7C','testimonials/avatar-9.jpg','2002-04-29','regular',NULL,'+1-555-0108',NULL,'2026-05-28 18:59:17','2026-05-28 18:59:20','2026-05-29 01:59:15',NULL,1,'2026-05-29 01:59:18','activated',NULL,NULL,NULL,0),(10,'Amelia Foster','customer8@example.com','$2y$12$/Z42LOdyFj0qJPbdJbhiQ.6zjmm5d7RBfEV2qpqD.FpJjVzuyLHNO','testimonials/avatar-10.jpg','1982-05-04','regular',NULL,'+1-555-0104',NULL,'2026-05-28 18:59:18','2026-05-28 18:59:20','2026-05-29 01:59:15',NULL,0,NULL,'activated',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `ec_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_customers`
--

DROP TABLE IF EXISTS `ec_discount_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_customers` (
  `discount_id` bigint unsigned NOT NULL,
  `customer_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_customers`
--

LOCK TABLES `ec_discount_customers` WRITE;
/*!40000 ALTER TABLE `ec_discount_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_product_categories`
--

DROP TABLE IF EXISTS `ec_discount_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_product_categories` (
  `discount_id` bigint unsigned NOT NULL,
  `product_category_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`product_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_product_categories`
--

LOCK TABLES `ec_discount_product_categories` WRITE;
/*!40000 ALTER TABLE `ec_discount_product_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_product_collections`
--

DROP TABLE IF EXISTS `ec_discount_product_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_product_collections` (
  `discount_id` bigint unsigned NOT NULL,
  `product_collection_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`product_collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_product_collections`
--

LOCK TABLES `ec_discount_product_collections` WRITE;
/*!40000 ALTER TABLE `ec_discount_product_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_product_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_products`
--

DROP TABLE IF EXISTS `ec_discount_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_products` (
  `discount_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_products`
--

LOCK TABLES `ec_discount_products` WRITE;
/*!40000 ALTER TABLE `ec_discount_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discounts`
--

DROP TABLE IF EXISTS `ec_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `total_used` int unsigned NOT NULL DEFAULT '0',
  `value` double DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'coupon',
  `can_use_with_promotion` tinyint(1) NOT NULL DEFAULT '0',
  `can_use_with_flash_sale` tinyint(1) NOT NULL DEFAULT '0',
  `discount_on` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` int unsigned DEFAULT NULL,
  `type_option` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `target` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all-orders',
  `min_order_price` decimal(15,2) DEFAULT NULL,
  `apply_via_url` tinyint(1) NOT NULL DEFAULT '0',
  `display_at_checkout` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint unsigned DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_discounts_code_unique` (`code`),
  KEY `ec_discounts_store_id_index` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discounts`
--

LOCK TABLES `ec_discounts` WRITE;
/*!40000 ALTER TABLE `ec_discounts` DISABLE KEYS */;
INSERT INTO `ec_discounts` VALUES (1,'Welcome 10% Off','WELCOME10','2026-05-28 01:59:18','2026-07-28 01:59:18',NULL,0,10,'coupon',0,0,NULL,NULL,'percentage','all-orders',0.00,0,1,'2026-05-28 18:59:18','2026-05-28 18:59:18',NULL,'A welcome discount for first-time shoppers — 10% off any order.'),(2,'Free Shipping Over $50','FREESHIP','2026-05-28 01:59:18',NULL,NULL,0,100,'coupon',0,0,NULL,NULL,'shipping','all-orders',50.00,0,1,'2026-05-28 18:59:18','2026-05-28 18:59:18',NULL,'Free shipping on any order $50 or above.'),(3,'Spring Sale — $25 Off','SPRING25','2026-05-28 01:59:18','2026-06-28 01:59:18',500,0,25,'coupon',0,0,NULL,NULL,'amount','all-orders',150.00,0,1,'2026-05-28 18:59:18','2026-05-28 18:59:18',NULL,'A flat $25 off orders over $150.'),(4,'VIP Member 20% Off','VIP20','2026-05-28 01:59:18','2026-08-27 01:59:18',NULL,0,20,'coupon',0,0,NULL,NULL,'percentage','all-orders',100.00,0,1,'2026-05-28 18:59:18','2026-05-28 18:59:18',NULL,'Exclusive 20% off for newsletter subscribers.'),(5,'Bundle & Save $50','BUNDLE50','2026-05-28 01:59:18','2026-07-13 01:59:18',NULL,0,50,'coupon',0,0,NULL,NULL,'amount','all-orders',300.00,0,1,'2026-05-28 18:59:18','2026-05-28 18:59:18',NULL,'Save $50 when you spend $300 or more.');
/*!40000 ALTER TABLE `ec_discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sale_products`
--

DROP TABLE IF EXISTS `ec_flash_sale_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sale_products` (
  `flash_sale_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `price` double unsigned DEFAULT NULL,
  `quantity` int unsigned DEFAULT NULL,
  `sold` int unsigned NOT NULL DEFAULT '0',
  KEY `ec_flash_sale_products_product_id_flash_sale_id_index` (`product_id`,`flash_sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sale_products`
--

LOCK TABLES `ec_flash_sale_products` WRITE;
/*!40000 ALTER TABLE `ec_flash_sale_products` DISABLE KEYS */;
INSERT INTO `ec_flash_sale_products` VALUES (1,5,41.3,50,0),(1,7,15.4,50,0),(1,8,13.3,50,0),(1,6,62.3,50,0),(1,10,30.8,50,0),(1,3,34.3,50,0),(1,2,23.8,50,0),(1,9,16.8,50,0),(1,1,27.3,50,0),(2,8,14.25,75,0),(2,1,29.25,75,0),(2,7,16.5,75,0),(2,9,18,75,0),(2,10,33,75,0),(2,2,25.5,75,0),(2,5,44.25,75,0);
/*!40000 ALTER TABLE `ec_flash_sale_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sales`
--

DROP TABLE IF EXISTS `ec_flash_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` datetime NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sales`
--

LOCK TABLES `ec_flash_sales` WRITE;
/*!40000 ALTER TABLE `ec_flash_sales` DISABLE KEYS */;
INSERT INTO `ec_flash_sales` VALUES (1,'48-Hour Flash Sale','2026-05-31 01:59:18','published','2026-05-28 18:59:18','2026-05-28 18:59:18'),(2,'Weekend Doorbusters','2026-06-03 01:59:18','published','2026-05-28 18:59:18','2026-05-28 18:59:18');
/*!40000 ALTER TABLE `ec_flash_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sales_translations`
--

DROP TABLE IF EXISTS `ec_flash_sales_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sales_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_flash_sales_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_flash_sales_id`),
  KEY `idx_flash_sales_fk` (`ec_flash_sales_id`),
  KEY `idx_flash_sales_flash_sales_lang` (`ec_flash_sales_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sales_translations`
--

LOCK TABLES `ec_flash_sales_translations` WRITE;
/*!40000 ALTER TABLE `ec_flash_sales_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_flash_sales_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_option_value`
--

DROP TABLE IF EXISTS `ec_global_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_option_value` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `option_id` bigint unsigned NOT NULL COMMENT 'option id',
  `option_value` tinytext COLLATE utf8mb4_unicode_ci COMMENT 'option value',
  `affect_price` double DEFAULT NULL COMMENT 'value of price of this option affect',
  `order` int NOT NULL DEFAULT '9999',
  `affect_type` tinyint NOT NULL DEFAULT '0' COMMENT '0. fixed 1. percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_option_value`
--

LOCK TABLES `ec_global_option_value` WRITE;
/*!40000 ALTER TABLE `ec_global_option_value` DISABLE KEYS */;
INSERT INTO `ec_global_option_value` VALUES (1,1,'No gift wrap',0,0,0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(2,1,'Standard kraft wrap',4.99,1,0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(3,1,'Premium silk-ribbon wrap',9.99,2,0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(4,2,'Up to 20 characters',14.99,0,0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(5,3,'Standard 1-year warranty',0,0,0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(6,3,'2-year extended warranty',29.99,1,0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(7,3,'3-year premium care',59.99,2,0,'2026-05-28 18:59:08','2026-05-28 18:59:08');
/*!40000 ALTER TABLE `ec_global_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_option_value_translations`
--

DROP TABLE IF EXISTS `ec_global_option_value_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_option_value_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_global_option_value_id` bigint unsigned NOT NULL,
  `option_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_global_option_value_id`),
  KEY `idx_global_option_value_fk` (`ec_global_option_value_id`),
  KEY `idx_global_option_value_global_option_value_lang` (`ec_global_option_value_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_option_value_translations`
--

LOCK TABLES `ec_global_option_value_translations` WRITE;
/*!40000 ALTER TABLE `ec_global_option_value_translations` DISABLE KEYS */;
INSERT INTO `ec_global_option_value_translations` VALUES ('ar',1,'لا يوجد تغليف هدايا'),('ar',2,'حزمة ورق الكرافت القياسية'),('ar',3,'حزمة الشريط الحريري الفاخر'),('ar',4,'الحد الأقصى 20 حرفا'),('ar',5,'ضمان قياسي لمدة سنة واحدة'),('ar',6,'ضمان ممتد لمدة عامين'),('ar',7,'رعاية متميزة لمدة 3 سنوات'),('fr',1,'Pas d\'emballage cadeau'),('fr',2,'Emballage en papier kraft standard'),('fr',3,'Paquet de rubans de soie haut de gamme'),('fr',4,'20 caractères maximum'),('fr',5,'Garantie standard 1 an'),('fr',6,'Garantie prolongée de 2 ans'),('fr',7,'Soins premium pendant 3 ans'),('id',1,'Tidak ada bungkus kado'),('id',2,'Paket kertas kraft standar'),('id',3,'Paket pita sutra premium'),('id',4,'Maksimum 20 karakter'),('id',5,'Garansi standar 1 tahun'),('id',6,'Garansi diperpanjang 2 tahun'),('id',7,'Perawatan premium selama 3 tahun'),('tr',1,'Hediye paketi yok'),('tr',2,'Standart kraft kağıt paketi'),('tr',3,'Premium ipek kurdele paketi'),('tr',4,'Maksimum 20 karakter'),('tr',5,'Standart 1 yıl garanti'),('tr',6,'2 yıl uzatılmış garanti'),('tr',7,'3 yıl boyunca premium bakım'),('vi',1,'Không gói quà'),('vi',2,'Gói giấy kraft tiêu chuẩn'),('vi',3,'Gói ruy băng lụa cao cấp'),('vi',4,'Tối đa 20 ký tự'),('vi',5,'Bảo hành tiêu chuẩn 1 năm'),('vi',6,'Bảo hành mở rộng 2 năm'),('vi',7,'Chăm sóc cao cấp 3 năm');
/*!40000 ALTER TABLE `ec_global_option_value_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_options`
--

DROP TABLE IF EXISTS `ec_global_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name of options',
  `option_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'option type',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Checked if this option is required',
  `price_per_product` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_options`
--

LOCK TABLES `ec_global_options` WRITE;
/*!40000 ALTER TABLE `ec_global_options` DISABLE KEYS */;
INSERT INTO `ec_global_options` VALUES (1,'Gift Wrapping','Botble\\Ecommerce\\Option\\OptionType\\Dropdown',0,0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(2,'Engraving','Botble\\Ecommerce\\Option\\OptionType\\Field',0,0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(3,'Extended Warranty','Botble\\Ecommerce\\Option\\OptionType\\RadioButton',0,0,'2026-05-28 18:59:08','2026-05-28 18:59:08');
/*!40000 ALTER TABLE `ec_global_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_options_translations`
--

DROP TABLE IF EXISTS `ec_global_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_options_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_global_options_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_global_options_id`),
  KEY `idx_global_options_fk` (`ec_global_options_id`),
  KEY `idx_global_options_global_options_lang` (`ec_global_options_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_options_translations`
--

LOCK TABLES `ec_global_options_translations` WRITE;
/*!40000 ALTER TABLE `ec_global_options_translations` DISABLE KEYS */;
INSERT INTO `ec_global_options_translations` VALUES ('ar',1,'تغليف الهدايا'),('ar',2,'نقش'),('ar',3,'الضمان الممتد'),('fr',1,'Emballage cadeau'),('fr',2,'Gravure'),('fr',3,'Garantie prolongée'),('id',1,'Pembungkus Kado'),('id',2,'Ukiran'),('id',3,'Perpanjangan Garansi'),('tr',1,'Hediye Paketleme'),('tr',2,'Oymak'),('tr',3,'Uzatılmış Garanti'),('vi',1,'Gói quà'),('vi',2,'Khắc tên'),('vi',3,'Bảo hành mở rộng');
/*!40000 ALTER TABLE `ec_global_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_grouped_products`
--

DROP TABLE IF EXISTS `ec_grouped_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_grouped_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_product_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `fixed_qty` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_grouped_products`
--

LOCK TABLES `ec_grouped_products` WRITE;
/*!40000 ALTER TABLE `ec_grouped_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_grouped_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_invoice_item_tax_components`
--

DROP TABLE IF EXISTS `ec_invoice_item_tax_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_invoice_item_tax_components` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_item_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jurisdiction` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_iitc_invoice_item` (`invoice_item_id`),
  CONSTRAINT `ec_invoice_item_tax_components_invoice_item_id_foreign` FOREIGN KEY (`invoice_item_id`) REFERENCES `ec_invoice_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_invoice_item_tax_components`
--

LOCK TABLES `ec_invoice_item_tax_components` WRITE;
/*!40000 ALTER TABLE `ec_invoice_item_tax_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_invoice_item_tax_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_invoice_items`
--

DROP TABLE IF EXISTS `ec_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint unsigned NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int unsigned NOT NULL,
  `price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) unsigned NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_invoice_items_reference_type_reference_id_index` (`reference_type`,`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_invoice_items`
--

LOCK TABLES `ec_invoice_items` WRITE;
/*!40000 ALTER TABLE `ec_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_invoices`
--

DROP TABLE IF EXISTS `ec_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_zip_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address_line` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_tax_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) DEFAULT '0.00',
  `shipping_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `shipping_tax_amount` decimal(15,2) DEFAULT '0.00',
  `payment_fee` decimal(15,2) DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `shipping_option` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `coupon_code` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `payment_id` bigint unsigned DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_invoices_code_unique` (`code`),
  KEY `ec_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `ec_invoices_payment_id_index` (`payment_id`),
  KEY `ec_invoices_status_index` (`status`),
  KEY `ec_invoices_reference_id_reference_type_index` (`reference_id`,`reference_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_invoices`
--

LOCK TABLES `ec_invoices` WRITE;
/*!40000 ALTER TABLE `ec_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_option_value`
--

DROP TABLE IF EXISTS `ec_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_option_value` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `option_id` bigint unsigned NOT NULL COMMENT 'option id',
  `option_value` tinytext COLLATE utf8mb4_unicode_ci COMMENT 'option value',
  `affect_price` double DEFAULT NULL COMMENT 'value of price of this option affect',
  `order` int NOT NULL DEFAULT '9999',
  `affect_type` tinyint NOT NULL DEFAULT '0' COMMENT '0. fixed 1. percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_option_value`
--

LOCK TABLES `ec_option_value` WRITE;
/*!40000 ALTER TABLE `ec_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_option_value_translations`
--

DROP TABLE IF EXISTS `ec_option_value_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_option_value_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_option_value_id` bigint unsigned NOT NULL,
  `option_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_option_value_id`),
  KEY `idx_option_value_fk` (`ec_option_value_id`),
  KEY `idx_option_value_option_value_lang` (`ec_option_value_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_option_value_translations`
--

LOCK TABLES `ec_option_value_translations` WRITE;
/*!40000 ALTER TABLE `ec_option_value_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_option_value_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_options`
--

DROP TABLE IF EXISTS `ec_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name of options',
  `option_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'option type',
  `product_id` bigint unsigned NOT NULL DEFAULT '0',
  `order` int NOT NULL DEFAULT '9999',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Checked if this option is required',
  `price_per_product` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_options`
--

LOCK TABLES `ec_options` WRITE;
/*!40000 ALTER TABLE `ec_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_options_translations`
--

DROP TABLE IF EXISTS `ec_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_options_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_options_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_options_id`),
  KEY `idx_options_fk` (`ec_options_id`),
  KEY `idx_options_options_lang` (`ec_options_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_options_translations`
--

LOCK TABLES `ec_options_translations` WRITE;
/*!40000 ALTER TABLE `ec_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_addresses`
--

DROP TABLE IF EXISTS `ec_order_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint unsigned NOT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'shipping_address',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_order_addresses_order_id_type_unique` (`order_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_addresses`
--

LOCK TABLES `ec_order_addresses` WRITE;
/*!40000 ALTER TABLE `ec_order_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_histories`
--

DROP TABLE IF EXISTS `ec_order_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `order_id` bigint unsigned NOT NULL,
  `extras` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_histories`
--

LOCK TABLES `ec_order_histories` WRITE;
/*!40000 ALTER TABLE `ec_order_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_metadata`
--

DROP TABLE IF EXISTS `ec_order_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_metadata` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_order_metadata_order_id_meta_key_index` (`order_id`,`meta_key`),
  KEY `ec_order_metadata_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_metadata`
--

LOCK TABLES `ec_order_metadata` WRITE;
/*!40000 ALTER TABLE `ec_order_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_product`
--

DROP TABLE IF EXISTS `ec_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_product` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `qty` int NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) DEFAULT '0.00',
  `tax_breakdown` json DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `product_options` text COLLATE utf8mb4_unicode_ci COMMENT 'product option data',
  `product_id` bigint unsigned DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` double DEFAULT '0',
  `restock_quantity` int unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'physical',
  `times_downloaded` int NOT NULL DEFAULT '0',
  `license_code` text COLLATE utf8mb4_unicode_ci,
  `downloaded_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_order_product_order_id_product_id_index` (`order_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_product`
--

LOCK TABLES `ec_order_product` WRITE;
/*!40000 ALTER TABLE `ec_order_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_product_tax_components`
--

DROP TABLE IF EXISTS `ec_order_product_tax_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_product_tax_components` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_product_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jurisdiction` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_opt_order_product` (`order_product_id`),
  KEY `idx_opt_order_product_code` (`order_product_id`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_product_tax_components`
--

LOCK TABLES `ec_order_product_tax_components` WRITE;
/*!40000 ALTER TABLE `ec_order_product_tax_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_product_tax_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_referrals`
--

DROP TABLE IF EXISTS `ec_order_referrals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_referrals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_page` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_params` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referral` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gclid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fclid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_campaign` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_medium` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_term` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer_url` text COLLATE utf8mb4_unicode_ci,
  `referrer_domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_order_referrals_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_referrals`
--

LOCK TABLES `ec_order_referrals` WRITE;
/*!40000 ALTER TABLE `ec_order_referrals` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_referrals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_return_histories`
--

DROP TABLE IF EXISTS `ec_order_return_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_return_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `order_return_id` bigint unsigned NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_return_histories`
--

LOCK TABLES `ec_order_return_histories` WRITE;
/*!40000 ALTER TABLE `ec_order_return_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_return_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_return_items`
--

DROP TABLE IF EXISTS `ec_order_return_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_return_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_return_id` bigint unsigned NOT NULL COMMENT 'Order return id',
  `order_product_id` bigint unsigned NOT NULL COMMENT 'Order product id',
  `product_id` bigint unsigned NOT NULL COMMENT 'Product id',
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int NOT NULL COMMENT 'Quantity return',
  `price` decimal(15,2) NOT NULL COMMENT 'Price Product',
  `reason` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refund_amount` decimal(12,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_return_items`
--

LOCK TABLES `ec_order_return_items` WRITE;
/*!40000 ALTER TABLE `ec_order_return_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_return_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_returns`
--

DROP TABLE IF EXISTS `ec_order_returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_returns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint unsigned NOT NULL COMMENT 'Order ID',
  `store_id` bigint unsigned DEFAULT NULL COMMENT 'Store ID',
  `user_id` bigint unsigned NOT NULL COMMENT 'Customer ID',
  `reason` text COLLATE utf8mb4_unicode_ci COMMENT 'Reason return order',
  `images` json DEFAULT NULL,
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Order current status',
  `return_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Return status',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_order_returns_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_returns`
--

LOCK TABLES `ec_order_returns` WRITE;
/*!40000 ALTER TABLE `ec_order_returns` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_returns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_tax_information`
--

DROP TABLE IF EXISTS `ec_order_tax_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_tax_information` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `company_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_tax_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_order_tax_information_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_tax_information`
--

LOCK TABLES `ec_order_tax_information` WRITE;
/*!40000 ALTER TABLE `ec_order_tax_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_tax_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_orders`
--

DROP TABLE IF EXISTS `ec_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `shipping_option` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `amount` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) DEFAULT '0.00',
  `shipping_amount` decimal(15,2) DEFAULT NULL,
  `shipping_tax_amount` decimal(15,2) DEFAULT '0.00',
  `payment_fee` decimal(15,2) DEFAULT '0.00',
  `description` text COLLATE utf8mb4_unicode_ci,
  `coupon_code` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(15,2) DEFAULT NULL,
  `sub_total` decimal(15,2) NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `discount_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_finished` tinyint(1) DEFAULT '0',
  `cancellation_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancellation_reason_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint unsigned DEFAULT NULL,
  `proof_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `private_notes` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_orders_code_unique` (`code`),
  KEY `ec_orders_user_id_status_created_at_index` (`user_id`,`status`,`created_at`),
  KEY `ec_orders_store_id_index` (`store_id`),
  KEY `ec_orders_store_finished_index` (`store_id`,`is_finished`),
  KEY `ec_orders_status_created_at_index` (`status`,`created_at`),
  KEY `ec_orders_user_id_is_finished_index` (`user_id`,`is_finished`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_orders`
--

LOCK TABLES `ec_orders` WRITE;
/*!40000 ALTER TABLE `ec_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attribute_sets`
--

DROP TABLE IF EXISTS `ec_product_attribute_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attribute_sets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_layout` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dropdown',
  `is_searchable` tinyint unsigned NOT NULL DEFAULT '1',
  `is_comparable` tinyint unsigned NOT NULL DEFAULT '1',
  `is_use_in_product_listing` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `use_image_from_product_variation` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attribute_sets`
--

LOCK TABLES `ec_product_attribute_sets` WRITE;
/*!40000 ALTER TABLE `ec_product_attribute_sets` DISABLE KEYS */;
INSERT INTO `ec_product_attribute_sets` VALUES (1,'Color','color','visual',1,1,1,'published',0,'2026-05-28 18:59:07','2026-05-28 18:59:07',1),(2,'Size','size','text',1,1,1,'published',1,'2026-05-28 18:59:07','2026-05-28 18:59:07',0),(3,'Material','material','text',1,1,1,'published',2,'2026-05-28 18:59:07','2026-05-28 18:59:07',0);
/*!40000 ALTER TABLE `ec_product_attribute_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attribute_sets_translations`
--

DROP TABLE IF EXISTS `ec_product_attribute_sets_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attribute_sets_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_attribute_sets_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_attribute_sets_id`),
  KEY `idx_product_attribute_sets_fk` (`ec_product_attribute_sets_id`),
  KEY `idx_product_attribute_sets_product_attribute_sets_lang` (`ec_product_attribute_sets_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attribute_sets_translations`
--

LOCK TABLES `ec_product_attribute_sets_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_attribute_sets_translations` DISABLE KEYS */;
INSERT INTO `ec_product_attribute_sets_translations` VALUES ('ar',1,'لون'),('ar',2,'مقاس'),('ar',3,'مادة'),('fr',1,'Couleur'),('fr',2,'Taille'),('fr',3,'Matériel'),('id',1,'Warna'),('id',2,'Ukuran'),('id',3,'Bahan'),('tr',1,'Renk'),('tr',2,'Boyut'),('tr',3,'Malzeme'),('vi',1,'Màu sắc'),('vi',2,'Kích cỡ'),('vi',3,'Chất liệu');
/*!40000 ALTER TABLE `ec_product_attribute_sets_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attributes`
--

DROP TABLE IF EXISTS `ec_product_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` bigint unsigned NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_set_status_index` (`attribute_set_id`),
  KEY `idx_attribute_set_id` (`attribute_set_id`),
  KEY `idx_attribute_set_order_id` (`attribute_set_id`,`order`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attributes`
--

LOCK TABLES `ec_product_attributes` WRITE;
/*!40000 ALTER TABLE `ec_product_attributes` DISABLE KEYS */;
INSERT INTO `ec_product_attributes` VALUES (1,1,'Black','black','#000000',NULL,1,0,'2026-05-28 18:59:07','2026-05-28 18:59:07'),(2,1,'White','white','#FFFFFF',NULL,0,1,'2026-05-28 18:59:07','2026-05-28 18:59:07'),(3,1,'Beige','beige','#D6BFA0',NULL,0,2,'2026-05-28 18:59:07','2026-05-28 18:59:07'),(4,1,'Olive','olive','#6B7843',NULL,0,3,'2026-05-28 18:59:07','2026-05-28 18:59:07'),(5,1,'Navy','navy','#10243F',NULL,0,4,'2026-05-28 18:59:07','2026-05-28 18:59:07'),(6,1,'Burgundy','burgundy','#7B1F2B',NULL,0,5,'2026-05-28 18:59:07','2026-05-28 18:59:07'),(7,1,'Charcoal','charcoal','#374049',NULL,0,6,'2026-05-28 18:59:07','2026-05-28 18:59:07'),(8,1,'Cream','cream','#F1E8D7',NULL,0,7,'2026-05-28 18:59:07','2026-05-28 18:59:07'),(9,1,'Pink','pink','#F2C2BB',NULL,0,8,'2026-05-28 18:59:07','2026-05-28 18:59:07'),(10,1,'Brown','brown','#905D5D',NULL,0,9,'2026-05-28 18:59:07','2026-05-28 18:59:07'),(11,1,'Green','green','#B2BD9F',NULL,0,10,'2026-05-28 18:59:07','2026-05-28 18:59:07'),(12,1,'Blue','blue','#87CEEB',NULL,0,11,'2026-05-28 18:59:07','2026-05-28 18:59:07'),(13,2,'XS','xs',NULL,NULL,1,0,'2026-05-28 18:59:07','2026-05-28 18:59:07'),(14,2,'S','s',NULL,NULL,0,1,'2026-05-28 18:59:07','2026-05-28 18:59:07'),(15,2,'M','m',NULL,NULL,0,2,'2026-05-28 18:59:07','2026-05-28 18:59:07'),(16,2,'L','l',NULL,NULL,0,3,'2026-05-28 18:59:07','2026-05-28 18:59:07'),(17,2,'XL','xl',NULL,NULL,0,4,'2026-05-28 18:59:07','2026-05-28 18:59:07'),(18,2,'XXL','xxl',NULL,NULL,0,5,'2026-05-28 18:59:07','2026-05-28 18:59:07'),(19,3,'Cotton','cotton',NULL,NULL,1,0,'2026-05-28 18:59:07','2026-05-28 18:59:07'),(20,3,'Linen','linen',NULL,NULL,0,1,'2026-05-28 18:59:07','2026-05-28 18:59:07'),(21,3,'Wool','wool',NULL,NULL,0,2,'2026-05-28 18:59:07','2026-05-28 18:59:07'),(22,3,'Tencel','tencel',NULL,NULL,0,3,'2026-05-28 18:59:07','2026-05-28 18:59:07'),(23,3,'Recycled Polyester','recycled-polyester',NULL,NULL,0,4,'2026-05-28 18:59:07','2026-05-28 18:59:07'),(24,3,'Full-Grain Leather','full-grain-leather',NULL,NULL,0,5,'2026-05-28 18:59:07','2026-05-28 18:59:07');
/*!40000 ALTER TABLE `ec_product_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attributes_translations`
--

DROP TABLE IF EXISTS `ec_product_attributes_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attributes_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_attributes_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_attributes_id`),
  KEY `idx_product_attributes_fk` (`ec_product_attributes_id`),
  KEY `idx_product_attributes_product_attributes_lang` (`ec_product_attributes_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attributes_translations`
--

LOCK TABLES `ec_product_attributes_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_attributes_translations` DISABLE KEYS */;
INSERT INTO `ec_product_attributes_translations` VALUES ('ar',1,'أسود'),('ar',2,'أبيض'),('ar',3,'البيج'),('ar',4,'زيتون'),('ar',5,'البحرية'),('ar',6,'بورجوندي'),('ar',7,'فحم'),('ar',8,'كريم'),('ar',9,'Pink'),('ar',10,'Brown'),('ar',11,'Green'),('ar',12,'Blue'),('ar',13,'XS'),('ar',14,'S'),('ar',15,'M'),('ar',16,'L'),('ar',17,'XL'),('ar',18,'XXL'),('ar',19,'قطن'),('ar',20,'الكتان'),('ar',21,'صوف'),('ar',22,'ايوسل'),('ar',23,'البوليستر المعاد تدويره'),('ar',24,'جلد محبب بالكامل'),('fr',1,'Noir'),('fr',2,'Blanc'),('fr',3,'Beige'),('fr',4,'Olive'),('fr',5,'Marine'),('fr',6,'Bourgogne'),('fr',7,'Charbon de bois'),('fr',8,'Crème'),('fr',9,'Pink'),('fr',10,'Brown'),('fr',11,'Green'),('fr',12,'Blue'),('fr',13,'XS'),('fr',14,'S'),('fr',15,'M'),('fr',16,'L'),('fr',17,'XL'),('fr',18,'XXL'),('fr',19,'Coton'),('fr',20,'Lin'),('fr',21,'Laine'),('fr',22,'Tencel'),('fr',23,'Polyester recyclé'),('fr',24,'Cuir pleine fleur'),('id',1,'Hitam'),('id',2,'Putih'),('id',3,'Krem'),('id',4,'Zaitun'),('id',5,'Angkatan laut'),('id',6,'merah anggur'),('id',7,'Arang'),('id',8,'Krim'),('id',9,'Pink'),('id',10,'Brown'),('id',11,'Green'),('id',12,'Blue'),('id',13,'XS'),('id',14,'S'),('id',15,'M'),('id',16,'L'),('id',17,'XL'),('id',18,'XXL'),('id',19,'Kapas'),('id',20,'Linen'),('id',21,'Wol'),('id',22,'Tencel'),('id',23,'Poliester Daur Ulang'),('id',24,'Kulit Gandum Penuh'),('tr',1,'Siyah'),('tr',2,'Beyaz'),('tr',3,'Bej'),('tr',4,'Zeytin'),('tr',5,'Donanma'),('tr',6,'Bordo'),('tr',7,'Kömür'),('tr',8,'Krem'),('tr',9,'Pink'),('tr',10,'Brown'),('tr',11,'Green'),('tr',12,'Blue'),('tr',13,'XS'),('tr',14,'S'),('tr',15,'M'),('tr',16,'L'),('tr',17,'XL'),('tr',18,'XXL'),('tr',19,'Pamuk'),('tr',20,'Keten'),('tr',21,'Yün'),('tr',22,'Tencel'),('tr',23,'Geri Dönüştürülmüş Polyester'),('tr',24,'Tam Sırçalı Deri'),('vi',1,'Đen'),('vi',2,'Trắng'),('vi',3,'Be'),('vi',4,'Ô-liu'),('vi',5,'Xanh navy'),('vi',6,'Đỏ burgundy'),('vi',7,'Xám than'),('vi',8,'Kem'),('vi',9,'Pink'),('vi',10,'Brown'),('vi',11,'Green'),('vi',12,'Blue'),('vi',13,'XS'),('vi',14,'S'),('vi',15,'M'),('vi',16,'L'),('vi',17,'XL'),('vi',18,'XXL'),('vi',19,'Cotton'),('vi',20,'Linen'),('vi',21,'Len'),('vi',22,'Tencel'),('vi',23,'Polyester tái chế'),('vi',24,'Da nguyên tấm');
/*!40000 ALTER TABLE `ec_product_attributes_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_categories`
--

DROP TABLE IF EXISTS `ec_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` int unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_categories_parent_id_status_created_at_index` (`parent_id`,`status`,`created_at`),
  KEY `ec_product_categories_parent_id_status_index` (`parent_id`,`status`),
  KEY `idx_categories_status_order` (`status`,`order`),
  KEY `idx_categories_order` (`order`),
  KEY `ec_product_categories_slug_index` (`slug`),
  KEY `idx_ec_product_categories_status` (`status`),
  KEY `idx_ec_product_categories_parent_id` (`parent_id`),
  KEY `idx_ec_product_categories_status_parent_order` (`status`,`parent_id`,`order`),
  KEY `idx_ec_product_categories_is_featured` (`is_featured`),
  KEY `idx_ec_product_categories_name` (`name`),
  KEY `idx_ec_product_categories_slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categories`
--

LOCK TABLES `ec_product_categories` WRITE;
/*!40000 ALTER TABLE `ec_product_categories` DISABLE KEYS */;
INSERT INTO `ec_product_categories` VALUES (1,'Feeding Gear',NULL,0,'Bottles, bibs, and feeding essentials designed for safe and easy mealtimes.','published',0,'categories/cate-16.jpg',1,'2026-05-28 18:59:10','2026-05-28 18:59:10',NULL,NULL),(2,'Bottles & Teats',NULL,1,NULL,'published',0,NULL,0,'2026-05-28 18:59:10','2026-05-28 18:59:10',NULL,NULL),(3,'Bibs & Burp Cloths',NULL,1,NULL,'published',1,NULL,0,'2026-05-28 18:59:10','2026-05-28 18:59:10',NULL,NULL),(4,'Pacifiers & Soothers',NULL,1,NULL,'published',2,NULL,0,'2026-05-28 18:59:10','2026-05-28 18:59:10',NULL,NULL),(5,'Feeding Sets & Utensils',NULL,1,NULL,'published',3,NULL,0,'2026-05-28 18:59:10','2026-05-28 18:59:10',NULL,NULL),(6,'Baby Wear',NULL,0,'Soft cotton onesies, booties, and everyday outfits for delicate baby skin.','published',1,'categories/cate-17.jpg',1,'2026-05-28 18:59:10','2026-05-28 18:59:10',NULL,NULL),(7,'Bodysuits & Onesies',NULL,6,NULL,'published',0,NULL,0,'2026-05-28 18:59:10','2026-05-28 18:59:10',NULL,NULL),(8,'Booties & Socks',NULL,6,NULL,'published',1,NULL,0,'2026-05-28 18:59:10','2026-05-28 18:59:10',NULL,NULL),(9,'Hats & Mittens',NULL,6,NULL,'published',2,NULL,0,'2026-05-28 18:59:10','2026-05-28 18:59:10',NULL,NULL),(10,'Sleepwear',NULL,6,NULL,'published',3,NULL,0,'2026-05-28 18:59:10','2026-05-28 18:59:10',NULL,NULL),(11,'Play Time',NULL,0,'Wooden teethers, plush toys, and gentle play companions for early development.','published',2,'categories/cate-18.jpg',1,'2026-05-28 18:59:10','2026-05-28 18:59:10',NULL,NULL),(12,'Teethers',NULL,11,NULL,'published',0,NULL,0,'2026-05-28 18:59:10','2026-05-28 18:59:10',NULL,NULL),(13,'Plush Toys',NULL,11,NULL,'published',1,NULL,0,'2026-05-28 18:59:10','2026-05-28 18:59:10',NULL,NULL),(14,'Activity Gyms',NULL,11,NULL,'published',2,NULL,0,'2026-05-28 18:59:10','2026-05-28 18:59:10',NULL,NULL),(15,'Wooden Toys',NULL,11,NULL,'published',3,NULL,0,'2026-05-28 18:59:10','2026-05-28 18:59:10',NULL,NULL),(16,'Bath Care',NULL,0,'Hooded towels, lotions, and bath time essentials that keep skin soft and calm.','published',3,'categories/cate-19.jpg',1,'2026-05-28 18:59:11','2026-05-28 18:59:11',NULL,NULL),(17,'Hooded Towels',NULL,16,NULL,'published',0,NULL,0,'2026-05-28 18:59:11','2026-05-28 18:59:11',NULL,NULL),(18,'Lotions & Oils',NULL,16,NULL,'published',1,NULL,0,'2026-05-28 18:59:11','2026-05-28 18:59:11',NULL,NULL),(19,'Bath Tubs & Seats',NULL,16,NULL,'published',2,NULL,0,'2026-05-28 18:59:11','2026-05-28 18:59:11',NULL,NULL),(20,'Washcloths & Sponges',NULL,16,NULL,'published',3,NULL,0,'2026-05-28 18:59:11','2026-05-28 18:59:11',NULL,NULL),(21,'Baby Room',NULL,0,'Cribs, mobiles, sleeping bags, and nursery essentials that shape a soothing space.','published',4,'categories/cate-20.jpg',1,'2026-05-28 18:59:11','2026-05-28 18:59:11',NULL,NULL),(22,'Cribs & Bassinets',NULL,21,NULL,'published',0,NULL,0,'2026-05-28 18:59:11','2026-05-28 18:59:11',NULL,NULL),(23,'Sleeping Bags',NULL,21,NULL,'published',1,NULL,0,'2026-05-28 18:59:11','2026-05-28 18:59:11',NULL,NULL),(24,'Mobiles & Night Lights',NULL,21,NULL,'published',2,NULL,0,'2026-05-28 18:59:11','2026-05-28 18:59:11',NULL,NULL),(25,'Nursery Decor',NULL,21,NULL,'published',3,NULL,0,'2026-05-28 18:59:11','2026-05-28 18:59:11',NULL,NULL);
/*!40000 ALTER TABLE `ec_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_categories_translations`
--

DROP TABLE IF EXISTS `ec_product_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_categories_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_categories_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ec_product_categories_id`),
  KEY `idx_product_categories_fk` (`ec_product_categories_id`),
  KEY `idx_product_categories_product_categories_lang` (`ec_product_categories_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categories_translations`
--

LOCK TABLES `ec_product_categories_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_categories_translations` DISABLE KEYS */;
INSERT INTO `ec_product_categories_translations` VALUES ('ar',1,'معدات التغذية',NULL,'تم تصميم الزجاجات والمرايل وغيرها من مستلزمات التغذية لجعل أوقات الوجبات آمنة وسهلة.'),('ar',2,'الزجاجات والحلمات',NULL,''),('ar',3,'المرايل وملابس التجشؤ',NULL,''),('ar',4,'اللهايات واللهايات',NULL,''),('ar',5,'مجموعات وأدوات التغذية',NULL,''),('ar',6,'ملابس اطفال',NULL,'ملابس داخلية وأحذية وملابس يومية مصنوعة من القطن الناعم لبشرة طفلك الرقيقة.'),('ar',7,'ملابس داخلية وملابس داخلية',NULL,''),('ar',8,'الجوارب والجوارب',NULL,''),('ar',9,'القبعات والقفازات',NULL,''),('ar',10,'ملابس نوم',NULL,''),('ar',11,'وقت اللعب',NULL,'عضاضات خشبية وحيوانات محشوة وأصدقاء ألعاب لطيفة للنمو المبكر.'),('ar',12,'التسنين',NULL,''),('ar',13,'ألعاب قطيفة',NULL,''),('ar',14,'صالات رياضية للأنشطة',NULL,''),('ar',15,'ألعاب خشبية',NULL,''),('ar',16,'العناية بالحمام',NULL,'تساعد المناشف ذات القلنسوة والغسول وأدوات الاستحمام الأساسية في الحفاظ على بشرة الطفل ناعمة ولطيفة.'),('ar',17,'مناشف مقنعين',NULL,''),('ar',18,'المستحضرات والزيوت',NULL,''),('ar',19,'أحواض الاستحمام والمقاعد',NULL,''),('ar',20,'المناشف والإسفنج',NULL,''),('ar',21,'غرفة الطفل',NULL,'توفر أسرة الأطفال والشماعات وأكياس النوم وغيرها من مستلزمات غرفة الطفل مساحة مريحة.'),('ar',22,'أسرة وأسرّة أطفال',NULL,''),('ar',23,'أكياس النوم',NULL,''),('ar',24,'الهواتف النقالة وأضواء الليل',NULL,''),('ar',25,'ديكور الحضانة',NULL,''),('fr',1,'Équipement d\'alimentation',NULL,'Les biberons, bavoirs et autres articles essentiels pour l\'alimentation sont conçus pour rendre les repas sûrs et faciles.'),('fr',2,'Biberons et tétines',NULL,''),('fr',3,'Bavoirs et torchons',NULL,''),('fr',4,'Sucettes et sucettes',NULL,''),('fr',5,'Ensembles d\'alimentation et ustensiles',NULL,''),('fr',6,'Vêtements pour bébé',NULL,'Body, chaussures et vêtements de tous les jours en coton doux pour la peau tendre de votre bébé.'),('fr',7,'Bodys et combinaisons',NULL,''),('fr',8,'Chaussons et chaussettes',NULL,''),('fr',9,'Chapeaux et mitaines',NULL,''),('fr',10,'Vêtement de nuit',NULL,''),('fr',11,'Temps de jeu',NULL,'Anneaux de dentition en bois, animaux en peluche et amis jouets doux pour le développement précoce.'),('fr',12,'Anneaux de dentition',NULL,''),('fr',13,'Jouets en peluche',NULL,''),('fr',14,'Salles d\'activités',NULL,''),('fr',15,'Jouets en bois',NULL,''),('fr',16,'Soins du bain',NULL,'Les serviettes à capuche, la lotion et les articles de bain essentiels aident à garder la peau de bébé douce et douce.'),('fr',17,'Serviettes à capuche',NULL,''),('fr',18,'Lotions & Oils',NULL,''),('fr',19,'Baignoires et sièges',NULL,''),('fr',20,'Débarbouillettes et éponges',NULL,''),('fr',21,'Chambre bébé',NULL,'Berceaux, cintres, gigoteuses et autres essentiels de la chambre de bébé créent un espace apaisant.'),('fr',22,'Berceaux et berceaux',NULL,''),('fr',23,'Sacs de couchage',NULL,''),('fr',24,'Mobiles et veilleuses',NULL,''),('fr',25,'Décor de chambre d\'enfant',NULL,''),('id',1,'Perlengkapan Makan',NULL,'Botol, celemek, dan perlengkapan makan lainnya dirancang untuk membuat waktu makan aman dan mudah.'),('id',2,'Botol & Dot',NULL,''),('id',3,'Kain Oto & Sendawa',NULL,''),('id',4,'Dot & Empeng',NULL,''),('id',5,'Set & Peralatan Makan',NULL,''),('id',6,'Pakaian Bayi',NULL,'Bodysuit, sepatu dan pakaian sehari-hari terbuat dari bahan katun lembut untuk kulit lembut bayi Anda.'),('id',7,'Bodysuit & Onesie',NULL,''),('id',8,'Sepatu Bot & Kaus Kaki',NULL,''),('id',9,'Topi & Sarung Tangan',NULL,''),('id',10,'Pakaian tidur',NULL,''),('id',11,'Waktu Bermain',NULL,'Teether kayu, boneka binatang, dan mainan teman yang lembut untuk pengembangan awal.'),('id',12,'Teether',NULL,''),('id',13,'Mainan Mewah',NULL,''),('id',14,'Pusat Aktivitas',NULL,''),('id',15,'Mainan Kayu',NULL,''),('id',16,'Perawatan Mandi',NULL,'Handuk bertudung, losion, dan perlengkapan mandi penting membantu menjaga kulit bayi tetap lembut dan lembut.'),('id',17,'Handuk Berkerudung',NULL,''),('id',18,'Lotion & Minyak',NULL,''),('id',19,'Bak Mandi & Kursi',NULL,''),('id',20,'Kain lap & Spons',NULL,''),('id',21,'Kamar Bayi',NULL,'Tempat tidur bayi, gantungan baju, kantong tidur, dan perlengkapan kamar bayi lainnya menciptakan ruangan yang menenangkan.'),('id',22,'Tempat Tidur Bayi & Bassinets',NULL,''),('id',23,'Kantong Tidur',NULL,''),('id',24,'Ponsel & Lampu Malam',NULL,''),('id',25,'Dekorasi Kamar Anak',NULL,''),('tr',1,'Besleme Dişlisi',NULL,'Biberonlar, önlükler ve diğer beslenme malzemeleri yemek zamanlarını güvenli ve kolay hale getirmek için tasarlanmıştır.'),('tr',2,'Şişeler ve Emzikler',NULL,''),('tr',3,'Önlükler ve Geğirme Bezleri',NULL,''),('tr',4,'Emzikler ve Emzikler',NULL,''),('tr',5,'Besleme Setleri ve Gereçleri',NULL,''),('tr',6,'Bebek Giyim',NULL,'Bebeğinizin hassas cildine uygun, yumuşak pamuklu tulum, ayakkabı ve günlük kıyafetler.'),('tr',7,'Bodysuits ve Onesies',NULL,''),('tr',8,'Patik ve Çorap',NULL,''),('tr',9,'Şapkalar ve Eldivenler',NULL,''),('tr',10,'pijama',NULL,''),('tr',11,'Oyun Zamanı',NULL,'Erken gelişim için ahşap dişlikler, doldurulmuş hayvanlar ve yumuşak oyuncak arkadaşlar.'),('tr',12,'Diş kaşıyıcılar',NULL,''),('tr',13,'Peluş Oyuncaklar',NULL,''),('tr',14,'Aktivite Spor Salonları',NULL,''),('tr',15,'Ahşap Oyuncaklar',NULL,''),('tr',16,'Banyo Bakımı',NULL,'Kapüşonlu havlular, losyon ve temel banyo malzemeleri bebeğin cildinin yumuşak ve yumuşak kalmasına yardımcı olur.'),('tr',17,'Kapşonlu Havlular',NULL,''),('tr',18,'Losyonlar ve Yağlar',NULL,''),('tr',19,'Banyo Küvetleri ve Koltuklar',NULL,''),('tr',20,'Keseler ve Süngerler',NULL,''),('tr',21,'Bebek Odası',NULL,'Beşikler, askılar, uyku tulumları ve diğer bebek odası malzemeleri rahatlatıcı bir alan yaratır.'),('tr',22,'Beşikler ve Beşikler',NULL,''),('tr',23,'Sleeping Bags',NULL,''),('tr',24,'Cep Telefonları ve Gece Işıkları',NULL,''),('tr',25,'Kreş Dekoru',NULL,''),('vi',1,'Dụng Cụ Cho Bé Ăn',NULL,'Bình sữa, yếm và những vật dụng thiết yếu khi cho bé ăn được thiết kế để bữa ăn an toàn và dễ dàng.'),('vi',2,'Bình Sữa & Núm Ti',NULL,''),('vi',3,'Yếm & Khăn Ợ Sữa',NULL,''),('vi',4,'Ti Giả & Đồ Trấn An',NULL,''),('vi',5,'Bộ Đồ Ăn & Dụng Cụ',NULL,''),('vi',6,'Trang Phục Cho Bé',NULL,'Bodysuit, giày và trang phục hằng ngày bằng cotton mềm mại cho làn da non nớt của bé.'),('vi',7,'Bodysuit & Áo Liền Quần',NULL,''),('vi',8,'Giày & Tất',NULL,''),('vi',9,'Mũ & Bao Tay',NULL,''),('vi',10,'Đồ Ngủ',NULL,''),('vi',11,'Giờ Vui Chơi',NULL,'Vòng ngậm nướu bằng gỗ, thú bông và những người bạn đồ chơi nhẹ nhàng cho sự phát triển sớm.'),('vi',12,'Vòng Ngậm Nướu',NULL,''),('vi',13,'Thú Bông',NULL,''),('vi',14,'Thảm Chơi Vận Động',NULL,''),('vi',15,'Đồ Chơi Gỗ',NULL,''),('vi',16,'Chăm Sóc Khi Tắm',NULL,'Khăn tắm có mũ, lotion và những vật dụng thiết yếu khi tắm giúp da bé mềm mại và dịu nhẹ.'),('vi',17,'Khăn Tắm Có Mũ',NULL,''),('vi',18,'Lotion & Dầu',NULL,''),('vi',19,'Chậu & Ghế Tắm',NULL,''),('vi',20,'Khăn Lau & Bọt Biển',NULL,''),('vi',21,'Phòng Của Bé',NULL,'Nôi, đồ treo, túi ngủ và những vật dụng thiết yếu cho phòng bé tạo nên không gian êm dịu.'),('vi',22,'Cũi & Nôi',NULL,''),('vi',23,'Túi Ngủ',NULL,''),('vi',24,'Đồ Treo & Đèn Ngủ',NULL,''),('vi',25,'Trang Trí Phòng Bé',NULL,'');
/*!40000 ALTER TABLE `ec_product_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_categorizables`
--

DROP TABLE IF EXISTS `ec_product_categorizables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_categorizables` (
  `category_id` bigint unsigned NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`,`reference_id`,`reference_type`),
  KEY `ec_product_categorizables_category_id_index` (`category_id`),
  KEY `ec_product_categorizables_reference_id_index` (`reference_id`),
  KEY `ec_product_categorizables_reference_type_index` (`reference_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categorizables`
--

LOCK TABLES `ec_product_categorizables` WRITE;
/*!40000 ALTER TABLE `ec_product_categorizables` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_categorizables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_category_product`
--

DROP TABLE IF EXISTS `ec_product_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_category_product` (
  `category_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `ec_product_category_product_category_id_index` (`category_id`),
  KEY `ec_product_category_product_product_id_index` (`product_id`),
  KEY `idx_product_category_composite` (`product_id`,`category_id`),
  KEY `idx_product_category` (`product_id`,`category_id`),
  KEY `idx_product_id_category_id` (`product_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_category_product`
--

LOCK TABLES `ec_product_category_product` WRITE;
/*!40000 ALTER TABLE `ec_product_category_product` DISABLE KEYS */;
INSERT INTO `ec_product_category_product` VALUES (1,7),(2,1),(2,2),(2,5),(2,6),(3,10),(4,1),(4,4),(4,8),(6,1),(6,3),(6,10),(7,9),(10,5),(10,9),(11,2),(11,6),(12,8),(13,6),(13,7),(14,3),(14,7),(14,8),(15,2),(15,5),(15,7),(15,9),(16,4),(17,9),(18,1),(18,10),(19,4),(20,2),(20,6),(21,8),(22,3),(23,5),(24,3),(24,10),(25,4);
/*!40000 ALTER TABLE `ec_product_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collection_products`
--

DROP TABLE IF EXISTS `ec_product_collection_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collection_products` (
  `product_collection_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`product_collection_id`),
  KEY `ec_product_collection_products_product_collection_id_index` (`product_collection_id`),
  KEY `ec_product_collection_products_product_id_index` (`product_id`),
  KEY `idx_product_id_collection_id` (`product_id`,`product_collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collection_products`
--

LOCK TABLES `ec_product_collection_products` WRITE;
/*!40000 ALTER TABLE `ec_product_collection_products` DISABLE KEYS */;
INSERT INTO `ec_product_collection_products` VALUES (1,6),(1,7),(2,9),(3,8),(4,3),(6,10),(7,5),(8,1),(8,2),(9,4);
/*!40000 ALTER TABLE `ec_product_collection_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collections`
--

DROP TABLE IF EXISTS `ec_product_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collections`
--

LOCK TABLES `ec_product_collections` WRITE;
/*!40000 ALTER TABLE `ec_product_collections` DISABLE KEYS */;
INSERT INTO `ec_product_collections` VALUES (1,'Spring Essentials','spring-essentials','Lightweight layers, fluid silhouettes, and the colors driving this seasons mood boards.','collection/cls-1.jpg','published','2026-05-28 18:59:07','2026-05-28 18:59:07',1),(2,'Limited Edition','limited-edition','One-time runs from independent makers. Once they sell through, they are gone.','collection/cls-10.jpg','published','2026-05-28 18:59:08','2026-05-28 18:59:08',1),(3,'Best Sellers','best-sellers','The pieces our customers reorder season after season.','collection/cls-11.jpg','published','2026-05-28 18:59:08','2026-05-28 18:59:08',1),(4,'Sustainable Picks','sustainable-picks','Products with a verified sustainability story — recycled materials, low-impact dyes, or fair-wage manufacturing.','collection/cls-12.jpg','published','2026-05-28 18:59:08','2026-05-28 18:59:08',1),(5,'Workwear','workwear','Tailored basics ready for the office, the studio, and everything in between.','collection/cls-1.jpg','published','2026-05-28 18:59:08','2026-05-28 18:59:08',0),(6,'Weekend','weekend','Off-duty essentials that elevate the simplest jeans-and-tee uniform.','collection/cls-10.jpg','published','2026-05-28 18:59:08','2026-05-28 18:59:08',0),(7,'Shop Women','shop-women','Curated wardrobes for every season — dresses, layering pieces, and weekend staples.','collection/cls-6.jpg','published','2026-05-28 18:59:08','2026-05-28 18:59:08',0),(8,'Shop Men','shop-men','Tailored essentials and modern basics — built to last beyond the trend cycle.','collection/cls-7.jpg','published','2026-05-28 18:59:08','2026-05-28 18:59:08',0),(9,'Shop Essentials','shop-essentials','The everyday pieces our customers reorder — denim, knits, and timeless outerwear.','collection/cls-8.jpg','published','2026-05-28 18:59:08','2026-05-28 18:59:08',0);
/*!40000 ALTER TABLE `ec_product_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collections_translations`
--

DROP TABLE IF EXISTS `ec_product_collections_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collections_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_collections_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_collections_id`),
  KEY `idx_product_collections_fk` (`ec_product_collections_id`),
  KEY `idx_product_collections_product_collections_lang` (`ec_product_collections_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collections_translations`
--

LOCK TABLES `ec_product_collections_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_collections_translations` DISABLE KEYS */;
INSERT INTO `ec_product_collections_translations` VALUES ('ar',1,'أساسيات الربيع','الملابس الخفيفة والفضفاضة والألوان الزاهية هي التي تتصدر المزاج العام هذا الموسم.'),('ar',2,'طبعة محدودة','الشحنات الوحيدة من الشركات المصنعة المستقلة. إذا تم بيعه، فقد ذهب.'),('ar',3,'أفضل البائعين','المنتجات التي يثق بها العملاء ويعيدون طلبها في كل موسم.'),('ar',4,'اللقطات المستدامة','منتجات ذات قصص استدامة مثبتة - مواد معاد تدويرها، أو أصباغ منخفضة التأثير، أو مصنوعة بأجور عادلة.'),('ar',5,'ملابس العمل','الأساسيات المتطورة جاهزة للمكتب والاستوديو وفي كل مكان بينهما.'),('ar',6,'عطلة نهاية الأسبوع','تعمل الأساسيات خارج أوقات العمل على رفع مستوى أبسط أطقم الجينز والقمصان.'),('ar',7,'تسوق النساء','خزانة ملابس منسقة لكل موسم - الفساتين والطبقات وأساسيات عطلة نهاية الأسبوع.'),('ar',8,'تسوق الرجال','أساسيات متطورة وأساسيات حديثة - تدوم إلى ما بعد دورات الموضة.'),('ar',9,'تسوق الأساسيات','يعيد العملاء طلب القطع اليومية - الدنيم والحياكة والمعاطف الخالدة.'),('fr',1,'Les essentiels du printemps','Des tenues légères, des coupes amples et des couleurs vives sont en tête du mood board cette saison.'),('fr',2,'Édition limitée','Expéditions exclusives de fabricants indépendants. S\'il est épuisé, il est parti.'),('fr',3,'Meilleures ventes','Des produits auxquels les clients font confiance et qui les commandent chaque saison.'),('fr',4,'Choix durables','Des produits avec des histoires de durabilité éprouvées : matériaux recyclés, colorants à faible impact ou fabriqués avec des salaires équitables.'),('fr',5,'Vêtements de travail','Les basiques sophistiqués sont prêts pour le bureau, le studio et partout ailleurs.'),('fr',6,'Fin de semaine','Les essentiels décontractés rehaussent les ensembles jeans et t-shirts les plus simples.'),('fr',7,'Magasinez les femmes','Une garde-robe organisée pour chaque saison : robes, superpositions et essentiels du week-end.'),('fr',8,'Acheter des hommes','Des essentiels sophistiqués et des basiques modernes – qui durent au-delà des cycles de la mode.'),('fr',9,'Achetez les essentiels','Les clients commandent des pièces du quotidien : jeans, tricots et manteaux intemporels.'),('id',1,'Hal Penting Musim Semi','Pakaian ringan, pakaian longgar, dan warna-warna cerah memimpin mood board musim ini.'),('id',2,'Edisi Terbatas','Pengiriman tunggal dari produsen independen. Kalau sudah terjual habis.'),('id',3,'Terlaris','Produk yang dipercaya dan dipesan ulang oleh pelanggan setiap musim.'),('id',4,'Pilihan Berkelanjutan','Produk dengan kisah keberlanjutan yang terbukti — bahan daur ulang, pewarna berdampak rendah, atau dibuat dengan upah yang wajar.'),('id',5,'Pakaian kerja','Perlengkapan dasar yang canggih siap digunakan di kantor, studio, dan di mana pun di antaranya.'),('id',6,'Akhir pekan','Barang-barang penting di luar tugas menonjolkan set jeans dan T-shirt paling sederhana.'),('id',7,'Belanja Wanita','Lemari pakaian pilihan untuk setiap musim — gaun, pakaian berlapis, dan kebutuhan akhir pekan.'),('id',8,'Toko Pria','Hal-hal penting yang canggih dan dasar-dasar modern — bertahan melampaui siklus mode.'),('id',9,'Belanja Penting','Barang sehari-hari yang dipesan ulang oleh pelanggan — denim, rajutan, dan mantel yang tak lekang oleh waktu.'),('tr',1,'Baharın Temelleri','Hafif kıyafetler, bol kesimler ve parlak renkler bu sezon mood board\'un başını çekiyor.'),('tr',2,'Sınırlı sayıda','Bağımsız üreticilerden tek gönderi. Eğer tükendiyse, gitmiştir.'),('tr',3,'En Çok Satanlar','Müşterilerin güvendiği ve her sezon yeniden sipariş ettiği ürünler.'),('tr',4,'Sürdürülebilir Seçimler','Kanıtlanmış sürdürülebilirlik öykülerine sahip ürünler: geri dönüştürülmüş malzemeler, düşük etkili boyalar veya adil ücretlerle üretilen ürünler.'),('tr',5,'İş kıyafeti','Ofis, stüdyo ve aradaki her yer için gelişmiş temel öğeler hazır.'),('tr',6,'Hafta sonu','İş dışında giyilen malzemeler, en basit kot pantolon ve tişört takımlarını öne çıkarıyor.'),('tr',7,'Kadın Alışverişi','Her mevsime uygun seçilmiş bir gardırop; elbiseler, üst üste binmeler ve hafta sonu vazgeçilmezleri.'),('tr',8,'Erkek Alışverişi','Moda döngülerinin ötesinde kalıcı, sofistike temeller ve modern temeller.'),('tr',9,'Temel Eşyaları Satın Alın','Müşterilerin yeniden sipariş ettiği gündelik parçalar: denim, örgüler ve zamansız montlar.'),('vi',1,'Thiết yếu mùa Xuân','Lớp trang phục nhẹ, phom rộng rãi và những gam màu đang dẫn dắt mood board mùa này.'),('vi',2,'Phiên bản giới hạn','Những lô hàng duy nhất từ các nhà sản xuất độc lập. Bán hết là không còn nữa.'),('vi',3,'Bán chạy nhất','Những sản phẩm được khách hàng tin dùng và đặt lại qua từng mùa.'),('vi',4,'Lựa chọn bền vững','Sản phẩm có câu chuyện bền vững được kiểm chứng — vật liệu tái chế, thuốc nhuộm ít tác động hoặc sản xuất với mức lương công bằng.'),('vi',5,'Trang phục công sở','Đồ cơ bản tinh tế sẵn sàng cho văn phòng, studio và mọi nơi khác.'),('vi',6,'Cuối tuần','Đồ off-duty thiết yếu nâng tầm những bộ jeans-và-áo thun đơn giản nhất.'),('vi',7,'Mua đồ Nữ','Tủ đồ tuyển chọn cho mọi mùa — đầm, đồ layering và đồ thiết yếu cuối tuần.'),('vi',8,'Mua đồ Nam','Đồ thiết yếu tinh tế và đồ cơ bản hiện đại — bền vượt qua chu kỳ thời trang.'),('vi',9,'Mua đồ thiết yếu','Những món đồ hàng ngày khách hàng đặt lại — denim, đồ dệt kim và áo khoác vượt thời gian.');
/*!40000 ALTER TABLE `ec_product_collections_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_cross_sale_relations`
--

DROP TABLE IF EXISTS `ec_product_cross_sale_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_cross_sale_relations` (
  `from_product_id` bigint unsigned NOT NULL,
  `to_product_id` bigint unsigned NOT NULL,
  `is_variant` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(15,2) DEFAULT '0.00',
  `price_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `apply_to_all_variations` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`from_product_id`,`to_product_id`),
  KEY `ec_product_cross_sale_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_cross_sale_relations_to_product_id_index` (`to_product_id`),
  KEY `idx_product_cross_sale` (`from_product_id`,`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_cross_sale_relations`
--

LOCK TABLES `ec_product_cross_sale_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_cross_sale_relations` DISABLE KEYS */;
INSERT INTO `ec_product_cross_sale_relations` VALUES (1,5,0,0.00,'fixed',1),(1,7,0,0.00,'fixed',1),(1,8,0,0.00,'fixed',1),(1,9,0,0.00,'fixed',1),(1,10,0,0.00,'fixed',1),(2,3,0,0.00,'fixed',1),(2,4,0,0.00,'fixed',1),(2,6,0,0.00,'fixed',1),(2,7,0,0.00,'fixed',1),(2,8,0,0.00,'fixed',1),(2,10,0,0.00,'fixed',1),(3,4,0,0.00,'fixed',1),(3,5,0,0.00,'fixed',1),(3,6,0,0.00,'fixed',1),(3,8,0,0.00,'fixed',1),(3,9,0,0.00,'fixed',1),(3,10,0,0.00,'fixed',1),(4,3,0,0.00,'fixed',1),(4,5,0,0.00,'fixed',1),(4,7,0,0.00,'fixed',1),(4,8,0,0.00,'fixed',1),(4,9,0,0.00,'fixed',1),(4,10,0,0.00,'fixed',1),(5,4,0,0.00,'fixed',1),(5,6,0,0.00,'fixed',1),(5,9,0,0.00,'fixed',1),(5,10,0,0.00,'fixed',1),(6,2,0,0.00,'fixed',1),(6,4,0,0.00,'fixed',1),(6,5,0,0.00,'fixed',1),(6,7,0,0.00,'fixed',1),(6,8,0,0.00,'fixed',1),(6,9,0,0.00,'fixed',1),(7,3,0,0.00,'fixed',1),(7,6,0,0.00,'fixed',1),(7,8,0,0.00,'fixed',1),(7,10,0,0.00,'fixed',1),(8,4,0,0.00,'fixed',1),(8,6,0,0.00,'fixed',1),(8,7,0,0.00,'fixed',1),(8,9,0,0.00,'fixed',1),(9,1,0,0.00,'fixed',1),(9,2,0,0.00,'fixed',1),(9,3,0,0.00,'fixed',1),(9,4,0,0.00,'fixed',1),(9,7,0,0.00,'fixed',1),(10,2,0,0.00,'fixed',1),(10,3,0,0.00,'fixed',1),(10,5,0,0.00,'fixed',1),(10,6,0,0.00,'fixed',1),(10,7,0,0.00,'fixed',1),(10,9,0,0.00,'fixed',1);
/*!40000 ALTER TABLE `ec_product_cross_sale_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_files`
--

DROP TABLE IF EXISTS `ec_product_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned DEFAULT NULL,
  `url` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extras` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_files_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_files`
--

LOCK TABLES `ec_product_files` WRITE;
/*!40000 ALTER TABLE `ec_product_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_label_products`
--

DROP TABLE IF EXISTS `ec_product_label_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_label_products` (
  `product_label_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_label_id`,`product_id`),
  KEY `ec_product_label_products_product_label_id_index` (`product_label_id`),
  KEY `ec_product_label_products_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_label_products`
--

LOCK TABLES `ec_product_label_products` WRITE;
/*!40000 ALTER TABLE `ec_product_label_products` DISABLE KEYS */;
INSERT INTO `ec_product_label_products` VALUES (4,9),(6,3),(6,6);
/*!40000 ALTER TABLE `ec_product_label_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_labels`
--

DROP TABLE IF EXISTS `ec_product_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_labels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `text_color` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_labels_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_labels`
--

LOCK TABLES `ec_product_labels` WRITE;
/*!40000 ALTER TABLE `ec_product_labels` DISABLE KEYS */;
INSERT INTO `ec_product_labels` VALUES (1,'Hot','#F0460E','published','2026-05-28 18:59:07','2026-05-28 18:59:07','#FFFFFF'),(2,'New','#22C55E','published','2026-05-28 18:59:07','2026-05-28 18:59:07','#FFFFFF'),(3,'Sale','#EF4444','published','2026-05-28 18:59:07','2026-05-28 18:59:07','#FFFFFF'),(4,'Best Seller','#1E1E1E','published','2026-05-28 18:59:07','2026-05-28 18:59:07','#FFFFFF'),(5,'Limited','#7B1F2B','published','2026-05-28 18:59:07','2026-05-28 18:59:07','#FFFFFF'),(6,'Eco','#6B7843','published','2026-05-28 18:59:07','2026-05-28 18:59:07','#FFFFFF');
/*!40000 ALTER TABLE `ec_product_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_labels_translations`
--

DROP TABLE IF EXISTS `ec_product_labels_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_labels_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_labels_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_labels_id`),
  KEY `idx_product_labels_fk` (`ec_product_labels_id`),
  KEY `idx_product_labels_product_labels_lang` (`ec_product_labels_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_labels_translations`
--

LOCK TABLES `ec_product_labels_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_labels_translations` DISABLE KEYS */;
INSERT INTO `ec_product_labels_translations` VALUES ('ar',1,'حار',NULL),('ar',2,'جديد',NULL),('ar',3,'أُوكَازيُون',NULL),('ar',4,'الأكثر مبيعًا',NULL),('ar',5,'محدود',NULL),('ar',6,'سابقة بمعنى البِيْئَة',NULL),('fr',1,'Chaud',NULL),('fr',2,'Nouveau',NULL),('fr',3,'Vente',NULL),('fr',4,'Meilleur vendeur',NULL),('fr',5,'Limité',NULL),('fr',6,'Écologique',NULL),('id',1,'Panas',NULL),('id',2,'Baru',NULL),('id',3,'Penjualan',NULL),('id',4,'Penjual Terbaik',NULL),('id',5,'Terbatas',NULL),('id',6,'ramah lingkungan',NULL),('tr',1,'Sıcak',NULL),('tr',2,'Yeni',NULL),('tr',3,'Satış',NULL),('tr',4,'En çok satan kitap',NULL),('tr',5,'Sınırlı',NULL),('tr',6,'Eko',NULL),('vi',1,'Hot',NULL),('vi',2,'Mới',NULL),('vi',3,'Giảm giá',NULL),('vi',4,'Bán chạy nhất',NULL),('vi',5,'Giới hạn',NULL),('vi',6,'Eco',NULL);
/*!40000 ALTER TABLE `ec_product_labels_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_license_codes`
--

DROP TABLE IF EXISTS `ec_product_license_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_license_codes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `license_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'available',
  `assigned_order_product_id` bigint unsigned DEFAULT NULL,
  `assigned_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_license_codes_product_id_status_index` (`product_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_license_codes`
--

LOCK TABLES `ec_product_license_codes` WRITE;
/*!40000 ALTER TABLE `ec_product_license_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_license_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_related_relations`
--

DROP TABLE IF EXISTS `ec_product_related_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_related_relations` (
  `from_product_id` bigint unsigned NOT NULL,
  `to_product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`from_product_id`,`to_product_id`),
  KEY `ec_product_related_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_related_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_related_relations`
--

LOCK TABLES `ec_product_related_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_related_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_related_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_specification_attribute`
--

DROP TABLE IF EXISTS `ec_product_specification_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_specification_attribute` (
  `product_id` bigint unsigned NOT NULL,
  `attribute_id` bigint unsigned NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `order` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_specification_attribute`
--

LOCK TABLES `ec_product_specification_attribute` WRITE;
/*!40000 ALTER TABLE `ec_product_specification_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_specification_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_specification_attribute_translations`
--

DROP TABLE IF EXISTS `ec_product_specification_attribute_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_specification_attribute_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `attribute_id` bigint unsigned NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `psat_unique` (`product_id`,`attribute_id`,`lang_code`),
  KEY `psat_product_attribute_index` (`product_id`,`attribute_id`),
  KEY `psat_product_id_index` (`product_id`),
  KEY `psat_attribute_id_index` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_specification_attribute_translations`
--

LOCK TABLES `ec_product_specification_attribute_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_specification_attribute_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_specification_attribute_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tag_product`
--

DROP TABLE IF EXISTS `ec_product_tag_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tag_product` (
  `product_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`tag_id`),
  KEY `ec_product_tag_product_product_id_index` (`product_id`),
  KEY `ec_product_tag_product_tag_id_index` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tag_product`
--

LOCK TABLES `ec_product_tag_product` WRITE;
/*!40000 ALTER TABLE `ec_product_tag_product` DISABLE KEYS */;
INSERT INTO `ec_product_tag_product` VALUES (1,9),(1,12),(1,14),(2,2),(2,6),(2,8),(3,7),(3,8),(3,9),(4,3),(4,6),(4,8),(5,4),(5,11),(5,12),(6,4),(6,11),(6,14),(7,7),(7,9),(7,15),(8,3),(8,5),(8,12),(9,1),(9,2),(9,6),(10,1),(10,5),(10,13);
/*!40000 ALTER TABLE `ec_product_tag_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tags`
--

DROP TABLE IF EXISTS `ec_product_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tags`
--

LOCK TABLES `ec_product_tags` WRITE;
/*!40000 ALTER TABLE `ec_product_tags` DISABLE KEYS */;
INSERT INTO `ec_product_tags` VALUES (1,'Cotton','Products tagged with Cotton.',NULL,'published','2026-05-28 18:59:08','2026-05-28 18:59:08'),(2,'Linen','Products tagged with Linen.',NULL,'published','2026-05-28 18:59:08','2026-05-28 18:59:08'),(3,'Wool','Products tagged with Wool.',NULL,'published','2026-05-28 18:59:08','2026-05-28 18:59:08'),(4,'Leather','Products tagged with Leather.',NULL,'published','2026-05-28 18:59:08','2026-05-28 18:59:08'),(5,'Tencel','Products tagged with Tencel.',NULL,'published','2026-05-28 18:59:08','2026-05-28 18:59:08'),(6,'Recycled','Products tagged with Recycled.',NULL,'published','2026-05-28 18:59:08','2026-05-28 18:59:08'),(7,'Made in Portugal','Products tagged with Made in Portugal.',NULL,'published','2026-05-28 18:59:08','2026-05-28 18:59:08'),(8,'Made in Italy','Products tagged with Made in Italy.',NULL,'published','2026-05-28 18:59:08','2026-05-28 18:59:08'),(9,'Hand-Crafted','Products tagged with Hand-Crafted.',NULL,'published','2026-05-28 18:59:08','2026-05-28 18:59:08'),(10,'Vegan','Products tagged with Vegan.',NULL,'published','2026-05-28 18:59:08','2026-05-28 18:59:08'),(11,'Limited Run','Products tagged with Limited Run.',NULL,'published','2026-05-28 18:59:08','2026-05-28 18:59:08'),(12,'Best Seller','Products tagged with Best Seller.',NULL,'published','2026-05-28 18:59:08','2026-05-28 18:59:08'),(13,'New Arrival','Products tagged with New Arrival.',NULL,'published','2026-05-28 18:59:08','2026-05-28 18:59:08'),(14,'Editor Pick','Products tagged with Editor Pick.',NULL,'published','2026-05-28 18:59:08','2026-05-28 18:59:08'),(15,'Eco-Friendly','Products tagged with Eco-Friendly.',NULL,'published','2026-05-28 18:59:08','2026-05-28 18:59:08');
/*!40000 ALTER TABLE `ec_product_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tags_translations`
--

DROP TABLE IF EXISTS `ec_product_tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tags_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_tags_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ec_product_tags_id`),
  KEY `idx_product_tags_fk` (`ec_product_tags_id`),
  KEY `idx_product_tags_product_tags_lang` (`ec_product_tags_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tags_translations`
--

LOCK TABLES `ec_product_tags_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_tags_translations` DISABLE KEYS */;
INSERT INTO `ec_product_tags_translations` VALUES ('ar',1,'قطن',NULL),('ar',2,'الكتان',NULL),('ar',3,'صوف',NULL),('ar',4,'جلد',NULL),('ar',5,'ايوسل',NULL),('ar',6,'المعاد تدويرها',NULL),('ar',7,'صنع في البرتغال',NULL),('ar',8,'صنع في إيطاليا',NULL),('ar',9,'مصنوع يدويًا',NULL),('ar',10,'نباتي',NULL),('ar',11,'تشغيل محدود',NULL),('ar',12,'الأكثر مبيعًا',NULL),('ar',13,'وصول جديد',NULL),('ar',14,'اختيار المحرر',NULL),('ar',15,'صديقة للبيئة',NULL),('fr',1,'Coton',NULL),('fr',2,'Lin',NULL),('fr',3,'Laine',NULL),('fr',4,'Cuir',NULL),('fr',5,'Tencel',NULL),('fr',6,'Recyclé',NULL),('fr',7,'Fabriqué au Portugal',NULL),('fr',8,'Fabriqué en Italie',NULL),('fr',9,'Fabriqué à la main',NULL),('fr',10,'Végétalien',NULL),('fr',11,'Série limitée',NULL),('fr',12,'Meilleur vendeur',NULL),('fr',13,'Nouvelle Arrivée',NULL),('fr',14,'Choix de l\'éditeur',NULL),('fr',15,'Respectueux de l\'environnement',NULL),('id',1,'Kapas',NULL),('id',2,'Linen',NULL),('id',3,'Wol',NULL),('id',4,'Kulit',NULL),('id',5,'Tencel',NULL),('id',6,'Daur ulang',NULL),('id',7,'Dibuat di Portugal',NULL),('id',8,'Dibuat di Italia',NULL),('id',9,'Kerajinan Tangan',NULL),('id',10,'vegan',NULL),('id',11,'Jangka Terbatas',NULL),('id',12,'Penjual Terbaik',NULL),('id',13,'Kedatangan Baru',NULL),('id',14,'Pilihan Editor',NULL),('id',15,'Ramah Lingkungan',NULL),('tr',1,'Pamuk',NULL),('tr',2,'Keten',NULL),('tr',3,'Yün',NULL),('tr',4,'Deri',NULL),('tr',5,'Tencel',NULL),('tr',6,'Geri dönüştürülmüş',NULL),('tr',7,'Portekiz\'de yapıldı',NULL),('tr',8,'İtalya\'da yapıldı',NULL),('tr',9,'El Yapımı',NULL),('tr',10,'vegan',NULL),('tr',11,'Sınırlı Çalıştırma',NULL),('tr',12,'En çok satan kitap',NULL),('tr',13,'Yeni gelen',NULL),('tr',14,'Editörün Seçimi',NULL),('tr',15,'Çevre Dostu',NULL),('vi',1,'Cotton',NULL),('vi',2,'Linen',NULL),('vi',3,'Len',NULL),('vi',4,'Da',NULL),('vi',5,'Tencel',NULL),('vi',6,'Tái chế',NULL),('vi',7,'Sản xuất tại Bồ Đào Nha',NULL),('vi',8,'Sản xuất tại Ý',NULL),('vi',9,'Thủ công',NULL),('vi',10,'Thuần chay',NULL),('vi',11,'Lô giới hạn',NULL),('vi',12,'Bán chạy nhất',NULL),('vi',13,'Hàng mới về',NULL),('vi',14,'Biên tập viên chọn',NULL),('vi',15,'Thân thiện môi trường',NULL);
/*!40000 ALTER TABLE `ec_product_tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_up_sale_relations`
--

DROP TABLE IF EXISTS `ec_product_up_sale_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_up_sale_relations` (
  `from_product_id` bigint unsigned NOT NULL,
  `to_product_id` bigint unsigned NOT NULL,
  `is_variant` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(15,2) DEFAULT '0.00',
  `price_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `apply_to_all_variations` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`from_product_id`,`to_product_id`),
  KEY `ec_product_up_sale_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_up_sale_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_up_sale_relations`
--

LOCK TABLES `ec_product_up_sale_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_up_sale_relations` DISABLE KEYS */;
INSERT INTO `ec_product_up_sale_relations` VALUES (1,3,0,10.00,'percent',1),(1,6,0,5.00,'fixed',1),(2,4,0,10.00,'fixed',1),(2,8,0,20.00,'percent',1),(3,7,0,10.00,'percent',1),(3,9,0,5.00,'percent',1),(4,3,0,50.00,'fixed',1),(4,10,0,50.00,'fixed',1),(5,4,0,15.00,'percent',1),(5,9,0,20.00,'percent',1),(6,7,0,50.00,'fixed',1),(6,8,0,20.00,'fixed',1),(7,6,0,15.00,'percent',1),(7,8,0,20.00,'fixed',1),(8,1,0,15.00,'percent',1),(8,4,0,20.00,'percent',1),(9,4,0,50.00,'fixed',1),(9,8,0,5.00,'fixed',1),(10,2,0,5.00,'percent',1),(10,4,0,50.00,'fixed',1);
/*!40000 ALTER TABLE `ec_product_up_sale_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_variation_items`
--

DROP TABLE IF EXISTS `ec_product_variation_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_variation_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` bigint unsigned NOT NULL,
  `variation_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_product_variation_items_attribute_id_variation_id_unique` (`attribute_id`,`variation_id`),
  KEY `attribute_variation_index` (`attribute_id`,`variation_id`),
  KEY `idx_variation_id` (`variation_id`),
  KEY `idx_variation_attribute_covering` (`variation_id`,`attribute_id`),
  KEY `ec_product_variation_items_variation_id_attribute_id_index` (`variation_id`,`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_variation_items`
--

LOCK TABLES `ec_product_variation_items` WRITE;
/*!40000 ALTER TABLE `ec_product_variation_items` DISABLE KEYS */;
INSERT INTO `ec_product_variation_items` VALUES (5,21,5),(6,21,6),(7,21,7),(3,22,3),(2,23,2),(1,24,1),(4,24,4);
/*!40000 ALTER TABLE `ec_product_variation_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_variations`
--

DROP TABLE IF EXISTS `ec_product_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_variations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned DEFAULT NULL,
  `configurable_product_id` bigint unsigned NOT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_product_variations_product_id_configurable_product_id_unique` (`product_id`,`configurable_product_id`),
  KEY `configurable_product_index` (`product_id`,`configurable_product_id`),
  KEY `idx_configurable_product_id` (`configurable_product_id`),
  KEY `idx_product_variations_config` (`configurable_product_id`,`is_default`),
  KEY `ec_product_variations_product_id_index` (`product_id`),
  KEY `ec_product_variations_configurable_product_id_index` (`configurable_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_variations`
--

LOCK TABLES `ec_product_variations` WRITE;
/*!40000 ALTER TABLE `ec_product_variations` DISABLE KEYS */;
INSERT INTO `ec_product_variations` VALUES (1,11,6,1),(2,12,6,0),(3,13,8,1),(4,14,8,0),(5,15,8,0),(6,16,9,1),(7,17,9,0);
/*!40000 ALTER TABLE `ec_product_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_views`
--

DROP TABLE IF EXISTS `ec_product_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_views` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `views` int NOT NULL DEFAULT '1',
  `date` date NOT NULL DEFAULT '2026-05-29',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_product_views_product_id_date_unique` (`product_id`,`date`),
  KEY `ec_product_views_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_views`
--

LOCK TABLES `ec_product_views` WRITE;
/*!40000 ALTER TABLE `ec_product_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_with_attribute_set`
--

DROP TABLE IF EXISTS `ec_product_with_attribute_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_with_attribute_set` (
  `attribute_set_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`attribute_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_with_attribute_set`
--

LOCK TABLES `ec_product_with_attribute_set` WRITE;
/*!40000 ALTER TABLE `ec_product_with_attribute_set` DISABLE KEYS */;
INSERT INTO `ec_product_with_attribute_set` VALUES (3,6,0),(3,8,0),(3,9,0);
/*!40000 ALTER TABLE `ec_product_with_attribute_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_products`
--

DROP TABLE IF EXISTS `ec_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `images` text COLLATE utf8mb4_unicode_ci,
  `video_media` text COLLATE utf8mb4_unicode_ci,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `quantity` int unsigned DEFAULT NULL,
  `allow_checkout_when_out_of_stock` tinyint unsigned NOT NULL DEFAULT '0',
  `with_storehouse_management` tinyint unsigned NOT NULL DEFAULT '0',
  `stock_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'in_stock',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `is_new_until` date DEFAULT NULL,
  `brand_id` bigint unsigned DEFAULT NULL,
  `is_variation` tinyint NOT NULL DEFAULT '0',
  `variations_count` int unsigned NOT NULL DEFAULT '0',
  `reviews_count` int unsigned NOT NULL DEFAULT '0',
  `reviews_avg` decimal(3,2) NOT NULL DEFAULT '0.00',
  `sale_type` tinyint NOT NULL DEFAULT '0',
  `price` double unsigned DEFAULT NULL,
  `sale_price` double unsigned DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `length` double DEFAULT NULL,
  `wide` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `tax_id` bigint unsigned DEFAULT NULL,
  `tax_class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'standard',
  `views` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint unsigned DEFAULT NULL,
  `created_by_id` bigint unsigned DEFAULT '0',
  `created_by_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `approved_by` bigint unsigned DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'physical',
  `barcode` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost_per_item` double DEFAULT NULL,
  `currency_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_includes_tax` tinyint(1) NOT NULL DEFAULT '0',
  `generate_license_code` tinyint(1) NOT NULL DEFAULT '0',
  `license_code_type` enum('auto_generate','pick_from_list') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'auto_generate',
  `minimum_order_quantity` int unsigned DEFAULT '0',
  `maximum_order_quantity` int unsigned DEFAULT '0',
  `notify_attachment_updated` tinyint(1) NOT NULL DEFAULT '0',
  `specification_table_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_products_brand_id_status_is_variation_created_at_index` (`brand_id`,`status`,`is_variation`,`created_at`),
  KEY `sale_type_index` (`sale_type`),
  KEY `start_date_index` (`start_date`),
  KEY `end_date_index` (`end_date`),
  KEY `sale_price_index` (`sale_price`),
  KEY `is_variation_index` (`is_variation`),
  KEY `ec_products_sku_index` (`sku`),
  KEY `idx_products_export` (`id`,`is_variation`),
  KEY `idx_store_variation_status` (`store_id`,`is_variation`,`status`),
  KEY `idx_variation_name_id` (`is_variation`,`name`,`id`),
  KEY `ec_products_variations_count_index` (`variations_count`),
  KEY `ec_products_slug_index` (`slug`),
  KEY `idx_products_status_variation` (`status`,`is_variation`,`id`),
  KEY `idx_products_price_sale` (`sale_type`,`sale_price`,`price`),
  KEY `idx_products_order_created` (`order`,`created_at`),
  KEY `idx_products_stock` (`with_storehouse_management`,`stock_status`,`quantity`),
  KEY `ec_products_reviews_count_index` (`reviews_count`),
  KEY `ec_products_reviews_avg_index` (`reviews_avg`),
  KEY `ec_products_status_is_variation_index` (`status`,`is_variation`),
  KEY `ec_products_storehouse_quantity_index` (`with_storehouse_management`,`quantity`),
  KEY `ec_products_currency_code_index` (`currency_code`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_products`
--

LOCK TABLES `ec_products` WRITE;
/*!40000 ALTER TABLE `ec_products` DISABLE KEYS */;
INSERT INTO `ec_products` VALUES (1,'Merino Wool Knit Booties with Drawstring – Snug Comfort for Newborns','merino-wool-knit-booties-with-drawstring-snug-comfort-for-newborns','Soft merino wool booties that keep tiny feet warm without overheating.','<p>Naturally breathable merino lining with elasticated cuffs. Machine washable on a gentle cycle. Sizes 0-12 months.</p>','published','[\"products\\/baby\\/product-1.jpg\"]',NULL,'FU-147',0,13,0,1,'in_stock',1,NULL,3,0,0,10,4.00,0,39.99,29.99,NULL,NULL,13,19,18,553,NULL,'standard',3233,'2026-05-28 18:59:13','2026-05-28 18:59:20',1,0,'Botble\\ACL\\Models\\User',0,'products/baby/product-1.jpg','physical','6455319259474',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(2,'Soft Cotton Dribble Bibs 3 Pack – Gentle Protection for Little Messes','soft-cotton-dribble-bibs-3-pack-gentle-protection-for-little-messes','Three-pack of organic cotton dribble bibs with adjustable nickel-free snaps.','<p>Triple-layered absorbent core with a waterproof inner barrier. OEKO-TEX certified prints. Fits 3-24 months.</p>','published','[\"products\\/baby\\/product-2.jpg\"]',NULL,'YX-122',0,14,0,1,'in_stock',0,NULL,4,0,0,10,2.40,0,34.99,24.99,NULL,NULL,11,16,17,874,NULL,'standard',171272,'2026-05-28 18:59:13','2026-05-28 18:59:20',2,0,'Botble\\ACL\\Models\\User',0,'products/baby/product-2.jpg','physical','7633896789211',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(3,'Cozy Bunny Hooded Towel for Newborns and Toddlers','cozy-bunny-hooded-towel-for-newborns-and-toddlers','Plush bamboo-cotton hooded towel that keeps baby cozy after every bath.','<p>500gsm bamboo-cotton terry. Generous 90x90cm size. Soft hood with embroidered ear detail. Hypoallergenic and chlorine-free.</p>','published','[\"products\\/baby\\/product-3.jpg\"]',NULL,'J8-127',0,15,0,1,'in_stock',0,NULL,10,0,0,10,2.20,0,49.99,39.99,NULL,NULL,11,18,14,554,NULL,'standard',117215,'2026-05-28 18:59:13','2026-05-28 18:59:20',3,0,'Botble\\ACL\\Models\\User',0,'products/baby/product-3.jpg','physical','7631065497127',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(4,'MUSHIE Frigg Baby\'s First Pacifier Floral Heart | Kido Bebe','mushie-frigg-babys-first-pacifier-floral-heart-kido-bebe','One-piece medical-grade silicone pacifier shaped to support natural latch.','<p>BPA, BPS, PVC, and phthalate-free. Symmetrical orthodontic shape. Boil-sterilizable and dishwasher safe.</p>','published','[\"products\\/baby\\/product-4.jpg\"]',NULL,'VY-167',0,12,0,1,'in_stock',1,NULL,5,0,0,10,2.90,0,19.99,14.99,NULL,NULL,14,10,11,852,NULL,'standard',52649,'2026-05-28 18:59:14','2026-05-28 18:59:20',4,0,'Botble\\ACL\\Models\\User',0,'products/baby/product-4.jpg','physical','8998950525723',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(5,'Baby Glass Bottle Set 4oz with Latex Nipple – Blush Pink for Little Moments','baby-glass-bottle-set-4oz-with-latex-nipple-blush-pink-for-little-moments','Twin-pack borosilicate glass bottles with anti-colic silicone teats.','<p>Heat-shock resistant glass with a soft silicone sleeve. Wide-neck design for easy cleaning. 240ml capacity.</p>','published','[\"products\\/baby\\/product-5.jpg\"]',NULL,'RB-115',0,15,0,1,'in_stock',1,NULL,11,0,0,10,3.00,0,59.99,49.99,NULL,NULL,17,17,15,631,NULL,'standard',39839,'2026-05-28 18:59:14','2026-05-28 18:59:20',1,0,'Botble\\ACL\\Models\\User',0,'products/baby/product-5.jpg','physical','8399326682604',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(6,'Silicone Fork and Spoon Set – Perfect for Self-Feeding Babies','silicone-fork-and-spoon-set-perfect-for-self-feeding-babies','Organic cotton sleeping bag with TOG 2.5 rating for cooler nights.','<p>GOTS-certified outer with hypoallergenic fill. Two-way zip for easy nappy changes. Sizes 0-6, 6-18, and 18-36 months.</p>','published','[\"products\\/baby\\/product-6.jpg\"]',NULL,'WM-198-A1',0,14,0,1,'in_stock',0,NULL,3,0,2,10,2.20,0,89.99,69.99,NULL,NULL,10,10,18,701,NULL,'standard',58088,'2026-05-28 18:59:14','2026-05-28 18:59:20',2,0,'Botble\\ACL\\Models\\User',0,'products/baby/product-6.jpg','physical','0968122168100',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(7,'Teal Blue 5 Pack Baby Bodysuits – 100% Cotton for Everyday Comfort','teal-blue-5-pack-baby-bodysuits-100-cotton-for-everyday-comfort','GOTS-certified organic cotton onesie with envelope shoulders for easy dressing.','<p>Soft single-jersey knit. Nickel-free press studs. Machine washable. Available in newborn through 18 months.</p>','published','[\"products\\/baby\\/product-7.jpg\"]',NULL,'DD-160',0,19,0,1,'in_stock',1,NULL,8,0,0,10,3.10,0,22.99,16.99,NULL,NULL,19,17,15,680,NULL,'standard',107431,'2026-05-28 18:59:14','2026-05-28 18:59:20',3,0,'Botble\\ACL\\Models\\User',0,'products/baby/product-7.jpg','physical','5699635391857',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(8,'White Delicate Double Pom Baby Hat – Soft &amp; Cozy Warmth for Little Heads','white-delicate-double-pom-baby-hat-soft-cozy-warmth-for-little-heads','Beech wood teether finished with food-grade beeswax, sized for tiny hands.','<p>Sustainably harvested European beech. Naturally antibacterial. Pair with a silicone clip to keep it close to baby.</p>','published','[\"products\\/baby\\/product-8.jpg\"]',NULL,'AT-117-A1',0,13,0,1,'in_stock',0,NULL,11,0,3,10,2.50,0,19.99,14.99,NULL,NULL,12,10,14,817,NULL,'standard',107145,'2026-05-28 18:59:14','2026-05-28 18:59:20',4,0,'Botble\\ACL\\Models\\User',0,'products/baby/product-8.jpg','physical','1715564388547',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(9,'Frigg Moon Natural Rubber Baby Pacifier Gentle Comfort','frigg-moon-natural-rubber-baby-pacifier-gentle-comfort','Fragrance-free lotion with oat extract and shea butter for sensitive baby skin.','<p>Dermatologist-tested. No parabens, sulphates, or synthetic fragrance. 200ml pump bottle.</p>','published','[\"products\\/baby\\/product-9.jpg\"]',NULL,'RA-147-A1',0,15,0,1,'in_stock',0,NULL,4,0,2,10,3.20,0,24.99,18.99,NULL,NULL,18,13,17,854,NULL,'standard',20689,'2026-05-28 18:59:14','2026-05-28 18:59:20',1,0,'Botble\\ACL\\Models\\User',0,'products/baby/product-9.jpg','physical','2634367481158',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(10,'Little Dine Wooden High Chair Elegant Comfort for Tiny Foodies','little-dine-wooden-high-chair-elegant-comfort-for-tiny-foodies','Hand-knit organic cotton plush companion sized perfectly for little arms.','<p>Hypoallergenic recycled fill. Embroidered facial details — no small parts. Surface washable.</p>','published','[\"products\\/baby\\/product-10.jpg\"]',NULL,'7R-181',0,18,0,1,'in_stock',0,NULL,9,0,0,10,3.10,0,44.99,34.99,NULL,NULL,10,12,16,637,NULL,'standard',90749,'2026-05-28 18:59:14','2026-05-28 18:59:20',2,0,'Botble\\ACL\\Models\\User',0,'products/baby/product-10.jpg','physical','9893239434729',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(11,'Silicone Fork and Spoon Set – Perfect for Self-Feeding Babies',NULL,NULL,NULL,'published','[\"products\\/baby\\/product-6.jpg\"]',NULL,'WM-198-A1',0,14,0,1,'in_stock',0,NULL,3,1,0,0,0.00,0,89.99,NULL,NULL,NULL,10,10,18,701,NULL,'standard',0,'2026-05-28 18:59:14','2026-05-28 18:59:20',2,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','1184758826125',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(12,'Silicone Fork and Spoon Set – Perfect for Self-Feeding Babies',NULL,NULL,NULL,'published','[\"products\\/baby\\/product-6.jpg\"]',NULL,'WM-198-A1-A2',0,14,0,1,'in_stock',0,NULL,3,1,0,0,0.00,0,89.99,NULL,NULL,NULL,10,10,18,701,NULL,'standard',0,'2026-05-28 18:59:14','2026-05-28 18:59:20',2,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','4870233000117',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(13,'White Delicate Double Pom Baby Hat – Soft & Cozy Warmth for Little Heads',NULL,NULL,NULL,'published','[\"products\\/baby\\/product-8.jpg\"]',NULL,'AT-117-A1',0,13,0,1,'in_stock',0,NULL,11,1,0,0,0.00,0,19.99,16.1919,NULL,NULL,12,10,14,817,NULL,'standard',0,'2026-05-28 18:59:14','2026-05-28 18:59:20',4,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','7375264313627',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(14,'White Delicate Double Pom Baby Hat – Soft & Cozy Warmth for Little Heads',NULL,NULL,NULL,'published','[\"products\\/baby\\/product-8.jpg\"]',NULL,'AT-117-A1-A2',0,13,0,1,'in_stock',0,NULL,11,1,0,0,0.00,0,19.99,17.5912,NULL,NULL,12,10,14,817,NULL,'standard',0,'2026-05-28 18:59:15','2026-05-28 18:59:20',4,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','2305267260975',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(15,'White Delicate Double Pom Baby Hat – Soft & Cozy Warmth for Little Heads',NULL,NULL,NULL,'published','[\"products\\/baby\\/product-8.jpg\"]',NULL,'AT-117-A1-A3',0,13,0,1,'in_stock',0,NULL,11,1,0,0,0.00,0,19.99,14.1929,NULL,NULL,12,10,14,817,NULL,'standard',0,'2026-05-28 18:59:15','2026-05-28 18:59:20',4,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','0915702685496',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(16,'Frigg Moon Natural Rubber Baby Pacifier Gentle Comfort',NULL,NULL,NULL,'published','[\"products\\/baby\\/product-9.jpg\"]',NULL,'RA-147-A1',0,15,0,1,'in_stock',0,NULL,4,1,0,0,0.00,0,24.99,NULL,NULL,NULL,18,13,17,854,NULL,'standard',0,'2026-05-28 18:59:15','2026-05-28 18:59:20',1,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','7858713975718',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(17,'Frigg Moon Natural Rubber Baby Pacifier Gentle Comfort',NULL,NULL,NULL,'published','[\"products\\/baby\\/product-9.jpg\"]',NULL,'RA-147-A1-A2',0,15,0,1,'in_stock',0,NULL,4,1,0,0,0.00,0,24.99,NULL,NULL,NULL,18,13,17,854,NULL,'standard',0,'2026-05-28 18:59:15','2026-05-28 18:59:20',1,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','4986962010782',NULL,NULL,0,0,'auto_generate',0,0,0,NULL);
/*!40000 ALTER TABLE `ec_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_products_translations`
--

DROP TABLE IF EXISTS `ec_products_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_products_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_products_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ec_products_id`),
  KEY `idx_products_fk` (`ec_products_id`),
  KEY `idx_products_products_lang` (`ec_products_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_products_translations`
--

LOCK TABLES `ec_products_translations` WRITE;
/*!40000 ALTER TABLE `ec_products_translations` DISABLE KEYS */;
INSERT INTO `ec_products_translations` VALUES ('ar',1,'أحذية طويلة من صوف ميرينو مع رباط - راحة تامة لحديثي الولادة',NULL,'أحذية صوف ميرينو الناعمة تحافظ على دفء الأقدام الصغيرة دون التسبب في الحرارة.','<p> بطانة صوف ميرينو طبيعية مسامية مع ياقة مرنة. يمكن غسله في الغسالة على دورة لطيفة. المقاسات 0-12 شهر.</p>'),('ar',2,'صدريات قطنية ناعمة مكونة من 3 قطع - حماية لطيفة من الفوضى الصغيرة',NULL,'مجموعة من ثلاث مرايل من القطن العضوي مع أزرار كبس قابلة للتعديل خالية من النيكل.','<p> قلب ماص من ثلاث طبقات مع بطانة داخلية مقاومة للماء. الأنماط معتمدة من OEKO-TEX. مناسب للأطفال من 3 إلى 24 شهرًا.</p>'),('ar',3,'منشفة مريحة بغطاء رأس على شكل أرنب لحديثي الولادة والأطفال الصغار',NULL,'تحتوي منشفة الحمام على غطاء ناعم من القطن والخيزران للحفاظ على دفء طفلك بعد كل حمام.','<p>500gsm منشفة من الخيزران القطني المختلط. مقاس واسع 90×90 سم. قبعة ناعمة مع تفاصيل أذن مطرزة. لا يسبب الحساسية وخالي من الكلور.</p>'),('ar',4,'لهاية الأطفال الأولى من موشي فريغ على شكل قلب زهري | كيدو بيبي',NULL,'اللهايات المصنوعة من السيليكون الطبي الصلب مصممة لدعم المزلاج الطبيعي.','<p>خالي من BPA وBPS وPVC والفثالات. شكل الأسنان متماثل. يمكن تعقيمها بالغليان وغسلها في غسالة الأطباق.</p>'),('ar',5,'مجموعة زجاجات الأطفال الزجاجية سعة 4 أونصة مع حلمة من اللاتكس - وردي فاتح للحظات صغيرة',NULL,'زجاجة أطفال ثنائية من زجاج البورسليكات مع حلمة سيليكون مضادة للمغص.','<p> زجاج حراري مقاوم للصدمات مع غلاف سيليكون ناعم. تصميم رقبة واسعة لسهولة التنظيف. السعة 240 مل.</p>'),('ar',6,'مجموعة شوكة وملعقة من السيليكون - مثالية للأطفال الذين يتناولون طعامهم ذاتيًا',NULL,'كيس نوم من القطن العضوي مع TOG 2.5 لليالي الباردة.','<p> الطبقة الخارجية معتمدة من GOTS مع بطانة داخلية مضادة للحساسية. سحاب ثنائي الاتجاه يجعل تغيير الحفاضات سهلاً. المقاسات 0-6، 6-18، 18-36 شهر.</p>'),('ar',7,'طقم من 5 ملابس داخلية للأطفال باللون الأزرق المخضر - 100% قطن لراحة يومية',NULL,'بدلة للجسم من القطن العضوي المعتمد من GOTS مع أكتاف مغلف لسهولة الارتداء.','<p>قماش ناعم ومتماسك. الأزرار خالية من النيكل. يمكن غسله في الغسالة. متوفر من مقاسات حديثي الولادة حتى 18 شهرًا.</p>'),('ar',8,'White Delicate Double Pom Baby Hat – Soft &amp; Cozy Warmth for Little Heads',NULL,'Beech wood teether finished with food-grade beeswax, sized for tiny hands.','<p>Sustainably harvested European beech. Naturally antibacterial. Pair with a silicone clip to keep it close to baby.</p>'),('ar',9,'لهاية أطفال من المطاط الطبيعي من فريج مون، مريحة ولطيفة',NULL,'لوشن خالي من العطور بخلاصة الشوفان وزبدة الشيا لبشرة الطفل الحساسة.','<p> تم اختباره من قبل أطباء الجلدية. لا يحتوي على بارابين أو كبريتات أو عطور صناعية. زجاجة مضخة 200 مل.</p>'),('ar',10,'كرسي مرتفع خشبي من Little Dine مريح وأنيق لمحبي الطعام الصغار',NULL,'حيوان محشو بالقطن العضوي محبوك يدويًا بحجم مثالي للأذرع الصغيرة.','<p>أمعاء معاد تدويرها مضادة للحساسية. تفاصيل وجه مطرزة - بدون تفاصيل صغيرة. يمكن مسح السطح.</p>'),('ar',11,'مجموعة شوكة وملعقة من السيليكون - مثالية للأطفال الذين يتناولون طعامهم ذاتيًا',NULL,'كيس نوم من القطن العضوي مع TOG 2.5 لليالي الباردة.','<p> الطبقة الخارجية معتمدة من GOTS مع بطانة داخلية مضادة للحساسية. سحاب ثنائي الاتجاه يجعل تغيير الحفاضات سهلاً. المقاسات 0-6، 6-18، 18-36 شهر.</p>'),('ar',12,'مجموعة شوكة وملعقة من السيليكون - مثالية للأطفال الذين يتناولون طعامهم ذاتيًا',NULL,'كيس نوم من القطن العضوي مع TOG 2.5 لليالي الباردة.','<p> الطبقة الخارجية معتمدة من GOTS مع بطانة داخلية مضادة للحساسية. سحاب ثنائي الاتجاه يجعل تغيير الحفاضات سهلاً. المقاسات 0-6، 6-18، 18-36 شهر.</p>'),('ar',13,'قبعة أطفال بيضاء رقيقة مزدوجة بوم - دفء ناعم ومريح للرؤوس الصغيرة',NULL,'حلقة العلكة مصنوعة من خشب البلوط، مع لمسة نهائية من شمع العسل الصالح للطعام، وتناسب الأيدي الصغيرة.','<p> بلوط أوروبي يتم حصاده بشكل مستدام. مضاد طبيعي للجراثيم. مدمج مع مشبك سيليكون لإبقاء الحلقة قريبة من طفلك.</p>'),('ar',14,'قبعة أطفال بيضاء رقيقة مزدوجة بوم - دفء ناعم ومريح للرؤوس الصغيرة',NULL,'حلقة العلكة مصنوعة من خشب البلوط، مع لمسة نهائية من شمع العسل الصالح للطعام، وتناسب الأيدي الصغيرة.','<p> بلوط أوروبي يتم حصاده بشكل مستدام. مضاد طبيعي للجراثيم. مدمج مع مشبك سيليكون لإبقاء الحلقة قريبة من طفلك.</p>'),('ar',15,'قبعة أطفال بيضاء رقيقة مزدوجة بوم - دفء ناعم ومريح للرؤوس الصغيرة',NULL,'حلقة العلكة مصنوعة من خشب البلوط، مع لمسة نهائية من شمع العسل الصالح للطعام، وتناسب الأيدي الصغيرة.','<p> بلوط أوروبي يتم حصاده بشكل مستدام. مضاد طبيعي للجراثيم. مدمج مع مشبك سيليكون لإبقاء الحلقة قريبة من طفلك.</p>'),('ar',16,'لهاية أطفال من المطاط الطبيعي من فريج مون، مريحة ولطيفة',NULL,'لوشن خالي من العطور بخلاصة الشوفان وزبدة الشيا لبشرة الطفل الحساسة.','<p> تم اختباره من قبل أطباء الجلدية. لا يحتوي على بارابين أو كبريتات أو عطور صناعية. زجاجة مضخة 200 مل.</p>'),('ar',17,'لهاية أطفال من المطاط الطبيعي من فريج مون، مريحة ولطيفة',NULL,'لوشن خالي من العطور بخلاصة الشوفان وزبدة الشيا لبشرة الطفل الحساسة.','<p> تم اختباره من قبل أطباء الجلدية. لا يحتوي على بارابين أو كبريتات أو عطور صناعية. زجاجة مضخة 200 مل.</p>'),('fr',1,'Chaussons tricotés en laine mérinos avec cordon de serrage – Confort douillet pour les nouveau-nés',NULL,'Les chaussures douces en laine mérinos gardent les petits pieds au chaud sans provoquer de chaleur.','<p>Doublure en laine mérinos naturelle respirante avec col élastique. Lavable en machine sur cycle délicat. Tailles 0-12 mois.</p>'),('fr',2,'Lot de 3 bavoirs en coton doux – Protection douce pour les petits dégâts',NULL,'Lot de trois bavoirs en coton bio avec boutons pression réglables sans nickel.','<p>Noyau absorbant à trois couches avec doublure intérieure imperméable. Les motifs sont certifiés OEKO-TEX. Convient pour 3-24 mois.</p>'),('fr',3,'Serviette à capuche Cozy Bunny pour nouveau-nés et tout-petits',NULL,'La serviette de bain est dotée d\'une capuche douce en coton et bambou pour garder votre bébé au chaud après chaque bain.','<p>Serviette en bambou mélangé de coton 500 g/m². Dimensions spacieuses 90x90cm. Chapeau doux avec détails d\'oreilles brodés. Hypoallergénique et sans chlore.</p>'),('fr',4,'MUSHIE Frigg Première sucette cœur floral pour bébé | Kido Bébé',NULL,'Les sucettes solides en silicone de qualité médicale sont conçues pour soutenir une prise naturelle du sein.','<p>Sans BPA, BPS, PVC et phtalates. Forme dentaire symétrique. Peut être stérilisé par ébullition et lavé au lave-vaisselle.</p>'),('fr',5,'Ensemble de biberons en verre 4 oz avec tétine en latex – Rose blush pour les petits moments',NULL,'Duo de biberons en verre borosilicate avec tétine en silicone anti-colique.','<p>Verre résistant aux chocs thermiques avec coque en silicone souple. Conception à col large pour un nettoyage facile. Capacité 240 ml.</p>'),('fr',6,'Ensemble fourchette et cuillère en silicone – Parfait pour les bébés auto-alimentés',NULL,'Gigoteuse en coton biologique avec TOG 2,5 pour les nuits fraîches.','<p>La couche extérieure est certifiée GOTS avec un intérieur antiallergénique. La fermeture éclair bidirectionnelle facilite le changement des couches. Tailles 0-6, 6-18 et 18-36 mois.</p>'),('fr',7,'Lot de 5 bodys bébé bleu sarcelle – 100 % coton pour un confort au quotidien',NULL,'Body en coton biologique certifié GOTS avec épaules enveloppes pour un port facile.','<p>Tissu tricoté simple doux. Les boutons sont sans nickel. Lavable en machine. Disponible de la taille du nouveau-né au 18 mois.</p>'),('fr',8,'White Delicate Double Pom Baby Hat – Soft &amp; Cozy Warmth for Little Heads',NULL,'Beech wood teether finished with food-grade beeswax, sized for tiny hands.','<p>Sustainably harvested European beech. Naturally antibacterial. Pair with a silicone clip to keep it close to baby.</p>'),('fr',9,'Sucette pour bébé en caoutchouc naturel Frigg Moon Confort doux',NULL,'Lotion sans parfum à l\'extrait d\'avoine et au beurre de karité pour la peau sensible de bébé.','<p>Testé dermatologiquement. Ne contient pas de parabènes, de sulfates ou de parfums synthétiques. Flacon pompe 200ml.</p>'),('fr',10,'Chaise haute en bois Little Dine, confort élégant pour les petits gourmets',NULL,'Peluche en coton biologique tricotée à la main, parfaitement dimensionnée pour les petits bras.','<p>Intestin anti-allergique recyclé. Détail du visage brodé – pas de petits détails. La surface peut être essuyée.</p>'),('fr',11,'Ensemble fourchette et cuillère en silicone – Parfait pour les bébés auto-alimentés',NULL,'Gigoteuse en coton biologique avec TOG 2,5 pour les nuits fraîches.','<p>La couche extérieure est certifiée GOTS avec un intérieur antiallergénique. La fermeture éclair bidirectionnelle facilite le changement des couches. Tailles 0-6, 6-18 et 18-36 mois.</p>'),('fr',12,'Ensemble fourchette et cuillère en silicone – Parfait pour les bébés auto-alimentés',NULL,'Gigoteuse en coton biologique avec TOG 2,5 pour les nuits fraîches.','<p>La couche extérieure est certifiée GOTS avec un intérieur antiallergénique. La fermeture éclair bidirectionnelle facilite le changement des couches. Tailles 0-6, 6-18 et 18-36 mois.</p>'),('fr',13,'Bonnet bébé blanc délicat à double pompon – Chaleur douce et confortable pour les petites têtes',NULL,'L\'anneau de gomme est fait de bois de chêne, fini avec de la cire d\'abeille de qualité alimentaire, et s\'adapte aux petites mains.','<p>Chêne européen récolté de manière durable. Antibactérien naturel. Combiné avec un clip en silicone pour maintenir l\'anneau près de votre bébé.</p>'),('fr',14,'Bonnet bébé blanc délicat à double pompon – Chaleur douce et confortable pour les petites têtes',NULL,'L\'anneau de gomme est fait de bois de chêne, fini avec de la cire d\'abeille de qualité alimentaire, et s\'adapte aux petites mains.','<p>Chêne européen récolté de manière durable. Antibactérien naturel. Combiné avec un clip en silicone pour maintenir l\'anneau près de votre bébé.</p>'),('fr',15,'Bonnet bébé blanc délicat à double pompon – Chaleur douce et confortable pour les petites têtes',NULL,'L\'anneau de gomme est fait de bois de chêne, fini avec de la cire d\'abeille de qualité alimentaire, et s\'adapte aux petites mains.','<p>Chêne européen récolté de manière durable. Antibactérien naturel. Combiné avec un clip en silicone pour maintenir l\'anneau près de votre bébé.</p>'),('fr',16,'Sucette pour bébé en caoutchouc naturel Frigg Moon Confort doux',NULL,'Lotion sans parfum à l\'extrait d\'avoine et au beurre de karité pour la peau sensible de bébé.','<p>Testé dermatologiquement. Ne contient pas de parabènes, de sulfates ou de parfums synthétiques. Flacon pompe 200ml.</p>'),('fr',17,'Sucette pour bébé en caoutchouc naturel Frigg Moon Confort doux',NULL,'Lotion sans parfum à l\'extrait d\'avoine et au beurre de karité pour la peau sensible de bébé.','<p>Testé dermatologiquement. Ne contient pas de parabènes, de sulfates ou de parfums synthétiques. Flacon pompe 200ml.</p>'),('id',1,'Sepatu Bot Rajut Wol Merino dengan Tali – Kenyamanan Nyaman untuk Bayi Baru Lahir',NULL,'Sepatu berbahan wol merino yang lembut menjaga kaki si kecil tetap hangat tanpa menimbulkan rasa panas.','<p>Lapisan wol merino bernapas alami dengan kerah elastis. Bisa dicuci dengan mesin dengan siklus lembut. Ukuran 0-12 bulan.</p>'),('id',2,'Soft Cotton Dribble Bibs 3 Pack – Perlindungan Lembut untuk Kekacauan Kecil',NULL,'Set tiga oto air liur katun organik dengan kancing bebas nikel yang dapat disesuaikan.','<p>Inti penyerap tiga lapis dengan lapisan dalam tahan air. Polanya bersertifikat OEKO-TEX. Cocok untuk 3-24 bulan.</p>'),('id',3,'Handuk Berkerudung Kelinci yang Nyaman untuk Bayi Baru Lahir dan Balita',NULL,'Handuk mandinya dilengkapi tudung katun-bambu yang lembut untuk menjaga bayi Anda tetap hangat setiap habis mandi.','<p>500gsm handuk bambu campuran katun. Luas ukuran 90x90cm. Topi lembut dengan detail bordir telinga. Hypoallergenic dan bebas klorin.</p>'),('id',4,'Dot Bunga Pertama Bayi MUSHIE Frigg | Kido Bebe',NULL,'Dot silikon padat kelas medis dibentuk untuk mendukung pelekatan alami.','<p>Bebas BPA, BPS, PVC, dan ftalat. Bentuk gigi simetris. Dapat disterilkan dengan cara direbus dan dicuci di mesin pencuci piring.</p>'),('id',5,'Set Botol Kaca Bayi 4oz dengan Puting Lateks – Blush Pink untuk Momen Kecil',NULL,'Duo botol bayi berbahan kaca borosilikat dengan dot silikon anti kolik.','<p>Kaca tahan guncangan termal dengan cangkang silikon lembut. Desain leher lebar agar mudah dibersihkan. Kapasitas 240ml.</p>'),('id',6,'Set Garpu dan Sendok Silikon – Sempurna untuk Bayi yang Makan Sendiri',NULL,'Kantong tidur katun organik dengan TOG 2.5 untuk malam yang dingin.','<p>Lapisan luar bersertifikat GOTS dengan interior anti-alergi. Ritsleting dua arah memudahkan penggantian popok. Ukuran 0-6, 6-18 dan 18-36 bulan.</p>'),('id',7,'Bodysuit Bayi 5 Paket Biru Teal – 100% Katun untuk Kenyamanan Sehari-hari',NULL,'Bodysuit katun organik bersertifikat GOTS dengan bahu amplop agar mudah dipakai.','<p>Kain rajutan tunggal yang lembut. Tombol-tombolnya bebas nikel. Bisa dicuci dengan mesin. Tersedia dari ukuran bayi baru lahir hingga 18 bulan.</p>'),('id',8,'White Delicate Double Pom Baby Hat – Soft &amp; Cozy Warmth for Little Heads',NULL,'Beech wood teether finished with food-grade beeswax, sized for tiny hands.','<p>Sustainably harvested European beech. Naturally antibacterial. Pair with a silicone clip to keep it close to baby.</p>'),('id',9,'Dot Bayi Karet Alam Frigg Moon Kenyamanan Lembut',NULL,'Lotion bebas pewangi dengan ekstrak oat dan shea butter untuk kulit sensitif bayi.','<p>Teruji secara dermatologis. Tidak mengandung paraben, sulfat, atau pewangi sintetis. Botol pompa 200ml.</p>'),('id',10,'Kursi Tinggi Kayu Little Dine Kenyamanan Elegan untuk Pecinta Makanan Mungil',NULL,'Boneka binatang katun organik tenunan tangan berukuran sempurna untuk lengan kecil.','<p>Usus anti alergi daur ulang. Detail wajah yang dibordir — tidak ada detail kecil. Permukaannya bisa dilap.</p>'),('id',11,'Set Garpu dan Sendok Silikon – Sempurna untuk Bayi yang Makan Sendiri',NULL,'Kantong tidur katun organik dengan TOG 2.5 untuk malam yang dingin.','<p>Lapisan luar bersertifikat GOTS dengan interior anti-alergi. Ritsleting dua arah memudahkan penggantian popok. Ukuran 0-6, 6-18 dan 18-36 bulan.</p>'),('id',12,'Set Garpu dan Sendok Silikon – Sempurna untuk Bayi yang Makan Sendiri',NULL,'Kantong tidur katun organik dengan TOG 2.5 untuk malam yang dingin.','<p>Lapisan luar bersertifikat GOTS dengan interior anti-alergi. Ritsleting dua arah memudahkan penggantian popok. Ukuran 0-6, 6-18 dan 18-36 bulan.</p>'),('id',13,'Topi Bayi Pom Ganda Halus Putih – Kehangatan Lembut & Nyaman untuk Kepala Kecil',NULL,'Cincin permen karet terbuat dari kayu ek, diberi finishing lilin lebah food grade, dan pas untuk tangan si kecil.','<p>Ek Eropa yang dipanen secara lestari. Antibakteri alami. Dikombinasikan dengan klip silikon untuk menjaga cincin tetap dekat dengan bayi Anda.</p>'),('id',14,'Topi Bayi Pom Ganda Halus Putih – Kehangatan Lembut & Nyaman untuk Kepala Kecil',NULL,'Cincin permen karet terbuat dari kayu ek, diberi finishing lilin lebah food grade, dan pas untuk tangan si kecil.','<p>Ek Eropa yang dipanen secara lestari. Antibakteri alami. Dikombinasikan dengan klip silikon untuk menjaga cincin tetap dekat dengan bayi Anda.</p>'),('id',15,'Topi Bayi Pom Ganda Halus Putih – Kehangatan Lembut & Nyaman untuk Kepala Kecil',NULL,'Cincin permen karet terbuat dari kayu ek, diberi finishing lilin lebah food grade, dan pas untuk tangan si kecil.','<p>Ek Eropa yang dipanen secara lestari. Antibakteri alami. Dikombinasikan dengan klip silikon untuk menjaga cincin tetap dekat dengan bayi Anda.</p>'),('id',16,'Dot Bayi Karet Alam Frigg Moon Kenyamanan Lembut',NULL,'Lotion bebas pewangi dengan ekstrak oat dan shea butter untuk kulit sensitif bayi.','<p>Teruji secara dermatologis. Tidak mengandung paraben, sulfat, atau pewangi sintetis. Botol pompa 200ml.</p>'),('id',17,'Dot Bayi Karet Alam Frigg Moon Kenyamanan Lembut',NULL,'Lotion bebas pewangi dengan ekstrak oat dan shea butter untuk kulit sensitif bayi.','<p>Teruji secara dermatologis. Tidak mengandung paraben, sulfat, atau pewangi sintetis. Botol pompa 200ml.</p>'),('tr',1,'Merinos Yünü Büzgülü Örgü Patik – Yeni Doğanlar İçin Rahat Rahatlık',NULL,'Yumuşak merinos yünü ayakkabılar minik ayakları ısıya neden olmadan sıcak tutar.','<p>Elastik yakalı doğal nefes alabilen merinos yünü astar. Makinede hassas programda yıkanabilir. 0-12 ay arası bedenler.</p>'),('tr',2,'Yumuşak Pamuklu Dribble Önlükler 3\'lü Paket - Küçük Sorunlar için Nazik Koruma',NULL,'Ayarlanabilir nikel içermeyen çıtçıtlı, üç adet organik pamuklu salya önlüğü seti.','<p>Su geçirmez iç astarlı üç katmanlı emici çekirdek. Desenler OEKO-TEX sertifikalıdır. 3-24 ay arası uygundur.</p>'),('tr',3,'Yeni Doğanlar ve Küçük Çocuklar için Cosy Bunny Kapşonlu Havlu',NULL,'Banyo havlusu, bebeğinizi her banyodan sonra sıcak tutmak için yumuşak pamuklu bambu kapüşonludur.','<p>500gsm pamuk karışımlı bambu havlu. 90x90cm geniş ebatlıdır. İşlemeli kulak detaylı yumuşak şapka. Hipoalerjenik ve klor içermez.</p>'),('tr',4,'MUSHIE Frigg Bebeğin İlk Emziği Çiçekli Kalp | Kido Bebe',NULL,'Katı tıbbi sınıf silikon emzikler, doğal bir mandalı destekleyecek şekilde şekillendirilmiştir.','<p>BPA, BPS, PVC ve ftalat içermez. Simetrik diş şekli. Kaynatılarak sterilize edilebilir ve bulaşık makinesinde yıkanabilir.</p>'),('tr',5,'Bebek Cam Biberon Seti 4oz Lateks Emzikli – Küçük Anlar için Allık Pembe',NULL,'Antikolik silikon emzikli borosilikat cam biberon ikilisi.','<p>Yumuşak silikon kabuklu, termal şoklara dayanıklı cam. Kolay temizlik için geniş boyun tasarımı. Kapasite 240ml.</p>'),('tr',6,'Silikon Çatal ve Kaşık Seti – Kendi Kendine Beslenen Bebekler için Mükemmel',NULL,'Serin geceler için TOG 2,5\'lu organik pamuklu uyku tulumu.','<p>Dış katman GOTS sertifikalıdır ve anti-alerjik iç kısıma sahiptir. İki yönlü fermuar, bebek bezi değişikliklerini kolaylaştırır. 0-6, 6-18 ve 18-36 ay bedenleri.</p>'),('tr',7,'Teal Blue 5\'li Bebek Tulumu – Günlük Konfor için %100 Pamuk',NULL,'GOTS sertifikalı, organik pamuklu, omuzları kolay giyilebilen body.','<p>Yumuşak tek örgü kumaş. Düğmeler nikel içermez. Makinede yıkanabilir. Yenidoğandan 18 aya kadar bedenleri mevcuttur.</p>'),('tr',8,'White Delicate Double Pom Baby Hat – Soft &amp; Cozy Warmth for Little Heads',NULL,'Beech wood teether finished with food-grade beeswax, sized for tiny hands.','<p>Sustainably harvested European beech. Naturally antibacterial. Pair with a silicone clip to keep it close to baby.</p>'),('tr',9,'Frigg Moon Doğal Kauçuk Bebek Emziği Nazik Konfor',NULL,'Bebeğinizin hassas cildi için yulaf özü ve shea yağı içeren kokusuz losyon.','<p>Dermatolojik olarak test edilmiştir. Paraben, sülfat veya sentetik koku içermez. Pompalı şişe 200ml.</p>'),('tr',10,'Little Dine Ahşap Mama Sandalyesi Minik Yemek Meraklıları için Zarif Konfor',NULL,'Küçük kollar için mükemmel boyutta, el örgüsü organik pamuktan doldurulmuş hayvan.','<p>Geri dönüştürülmüş anti-alerjik bağırsak. İşlemeli yüz detayı — küçük detaylar yok. Yüzey silinebilir.</p>'),('tr',11,'Silikon Çatal ve Kaşık Seti – Kendi Kendine Beslenen Bebekler için Mükemmel',NULL,'Serin geceler için TOG 2,5\'lu organik pamuklu uyku tulumu.','<p>Dış katman GOTS sertifikalıdır ve anti-alerjik iç kısıma sahiptir. İki yönlü fermuar, bebek bezi değişikliklerini kolaylaştırır. 0-6, 6-18 ve 18-36 ay bedenleri.</p>'),('tr',12,'Silikon Çatal ve Kaşık Seti – Kendi Kendine Beslenen Bebekler için Mükemmel',NULL,'Serin geceler için TOG 2,5\'lu organik pamuklu uyku tulumu.','<p>Dış katman GOTS sertifikalıdır ve anti-alerjik iç kısıma sahiptir. İki yönlü fermuar, bebek bezi değişikliklerini kolaylaştırır. 0-6, 6-18 ve 18-36 ay bedenleri.</p>'),('tr',13,'Beyaz Narin Çift Pom Bebek Şapkası – Küçük Kafalar için Yumuşak ve Rahat Sıcaklık',NULL,'Sakız halkası meşe ağacından yapılmıştır, gıdaya uygun balmumu ile kaplanmıştır ve küçük ellere uygundur.','<p>Sürdürülebilir şekilde hasat edilmiş Avrupa meşesi. Doğal antibakteriyel. Yüzüğü bebeğinize yakın tutmak için silikon klipsle birleştirilmiştir.</p>'),('tr',14,'Beyaz Narin Çift Pom Bebek Şapkası – Küçük Kafalar için Yumuşak ve Rahat Sıcaklık',NULL,'Sakız halkası meşe ağacından yapılmıştır, gıdaya uygun balmumu ile kaplanmıştır ve küçük ellere uygundur.','<p>Sürdürülebilir şekilde hasat edilmiş Avrupa meşesi. Doğal antibakteriyel. Yüzüğü bebeğinize yakın tutmak için silikon klipsle birleştirilmiştir.</p>'),('tr',15,'Beyaz Narin Çift Pom Bebek Şapkası – Küçük Kafalar için Yumuşak ve Rahat Sıcaklık',NULL,'Sakız halkası meşe ağacından yapılmıştır, gıdaya uygun balmumu ile kaplanmıştır ve küçük ellere uygundur.','<p>Sürdürülebilir şekilde hasat edilmiş Avrupa meşesi. Doğal antibakteriyel. Yüzüğü bebeğinize yakın tutmak için silikon klipsle birleştirilmiştir.</p>'),('tr',16,'Frigg Moon Doğal Kauçuk Bebek Emziği Nazik Konfor',NULL,'Bebeğinizin hassas cildi için yulaf özü ve shea yağı içeren kokusuz losyon.','<p>Dermatolojik olarak test edilmiştir. Paraben, sülfat veya sentetik koku içermez. Pompalı şişe 200ml.</p>'),('tr',17,'Frigg Moon Doğal Kauçuk Bebek Emziği Nazik Konfor',NULL,'Bebeğinizin hassas cildi için yulaf özü ve shea yağı içeren kokusuz losyon.','<p>Dermatolojik olarak test edilmiştir. Paraben, sülfat veya sentetik koku içermez. Pompalı şişe 200ml.</p>'),('vi',1,'Giày Len Merino Đan Có Dây Rút – Ấm Áp Êm Ái Cho Trẻ Sơ Sinh',NULL,'Giày len merino mềm mại giữ ấm đôi chân nhỏ xíu mà không gây nóng bức.','<p>Lớp lót len merino thoáng khí tự nhiên với cổ giày co giãn. Giặt máy được ở chế độ nhẹ. Kích cỡ 0-12 tháng.</p>'),('vi',2,'Bộ 3 Yếm Cotton Mềm Thấm Dãi – Bảo Vệ Nhẹ Nhàng Cho Những Lúc Lấm Lem',NULL,'Bộ ba chiếc yếm thấm dãi bằng cotton hữu cơ với nút bấm không chứa niken có thể điều chỉnh.','<p>Lõi thấm hút ba lớp với lớp lót trong chống thấm nước. Họa tiết đạt chứng nhận OEKO-TEX. Phù hợp 3-24 tháng.</p>'),('vi',3,'Khăn Tắm Có Mũ Hình Thỏ Ấm Áp Cho Trẻ Sơ Sinh Và Trẻ Tập Đi',NULL,'Khăn tắm có mũ bằng cotton pha tre mềm mịn giúp bé ấm áp sau mỗi lần tắm.','<p>Khăn bông cotton pha tre 500gsm. Kích thước rộng rãi 90x90cm. Mũ mềm với chi tiết tai thêu. Không gây dị ứng và không chứa clo.</p>'),('vi',4,'Ti Giả Đầu Đời MUSHIE Frigg Họa Tiết Hoa Trái Tim | Kido Bebe',NULL,'Ti giả silicone y tế nguyên khối được tạo hình để hỗ trợ khớp ngậm tự nhiên.','<p>Không chứa BPA, BPS, PVC và phthalate. Hình dáng nha khoa đối xứng. Có thể tiệt trùng bằng cách đun sôi và rửa được trong máy rửa bát.</p>'),('vi',5,'Bộ Bình Sữa Thủy Tinh 4oz Với Núm Latex – Hồng Phấn Cho Những Khoảnh Khắc Nhỏ Xinh',NULL,'Bộ đôi bình sữa thủy tinh borosilicate với núm ti silicone chống đầy hơi.','<p>Thủy tinh chịu sốc nhiệt với lớp vỏ silicone mềm. Thiết kế cổ rộng dễ vệ sinh. Dung tích 240ml.</p>'),('vi',6,'Bộ Nĩa Và Thìa Silicone – Hoàn Hảo Cho Bé Tập Tự Ăn',NULL,'Túi ngủ cotton hữu cơ với chỉ số TOG 2.5 cho những đêm se lạnh.','<p>Lớp ngoài đạt chứng nhận GOTS với ruột chống dị ứng. Khóa kéo hai chiều giúp dễ thay tã. Kích cỡ 0-6, 6-18 và 18-36 tháng.</p>'),('vi',7,'Bộ 5 Bodysuit Cho Bé Màu Xanh Mòng Két – 100% Cotton Cho Sự Thoải Mái Mỗi Ngày',NULL,'Bodysuit cotton hữu cơ đạt chứng nhận GOTS với vai dạng phong bì giúp mặc dễ dàng.','<p>Vải dệt kim đơn mềm mại. Nút bấm không chứa niken. Giặt máy được. Có sẵn từ size sơ sinh đến 18 tháng.</p>'),('vi',8,'White Delicate Double Pom Baby Hat – Soft &amp; Cozy Warmth for Little Heads',NULL,'Beech wood teether finished with food-grade beeswax, sized for tiny hands.','<p>Sustainably harvested European beech. Naturally antibacterial. Pair with a silicone clip to keep it close to baby.</p>'),('vi',9,'Ti Giả Cao Su Tự Nhiên Frigg Moon Êm Dịu Nhẹ Nhàng',NULL,'Lotion không hương liệu với chiết xuất yến mạch và bơ hạt mỡ cho làn da nhạy cảm của bé.','<p>Đã được kiểm nghiệm da liễu. Không chứa paraben, sulphate hay hương liệu tổng hợp. Chai bơm 200ml.</p>'),('vi',10,'Ghế Ăn Dặm Bằng Gỗ Little Dine Tinh Tế Thoải Mái Cho Những Thực Khách Nhí',NULL,'Thú bông cotton hữu cơ đan tay với kích thước hoàn hảo cho vòng tay nhỏ bé.','<p>Ruột tái chế chống dị ứng. Chi tiết khuôn mặt được thêu — không có chi tiết nhỏ. Có thể lau bề mặt.</p>'),('vi',11,'Bộ Nĩa Và Thìa Silicone – Hoàn Hảo Cho Bé Tập Tự Ăn',NULL,'Túi ngủ cotton hữu cơ với chỉ số TOG 2.5 cho những đêm se lạnh.','<p>Lớp ngoài đạt chứng nhận GOTS với ruột chống dị ứng. Khóa kéo hai chiều giúp dễ thay tã. Kích cỡ 0-6, 6-18 và 18-36 tháng.</p>'),('vi',12,'Bộ Nĩa Và Thìa Silicone – Hoàn Hảo Cho Bé Tập Tự Ăn',NULL,'Túi ngủ cotton hữu cơ với chỉ số TOG 2.5 cho những đêm se lạnh.','<p>Lớp ngoài đạt chứng nhận GOTS với ruột chống dị ứng. Khóa kéo hai chiều giúp dễ thay tã. Kích cỡ 0-6, 6-18 và 18-36 tháng.</p>'),('vi',13,'Mũ Cho Bé Hai Cục Bông Trắng Tinh Tế – Ấm Áp Êm Ái Cho Đầu Bé',NULL,'Vòng ngậm nướu bằng gỗ sồi hoàn thiện với sáp ong đạt chuẩn thực phẩm, vừa với bàn tay nhỏ xíu.','<p>Gỗ sồi châu Âu được thu hoạch bền vững. Kháng khuẩn tự nhiên. Kết hợp với kẹp silicone để giữ vòng ngậm gần bé.</p>'),('vi',14,'Mũ Cho Bé Hai Cục Bông Trắng Tinh Tế – Ấm Áp Êm Ái Cho Đầu Bé',NULL,'Vòng ngậm nướu bằng gỗ sồi hoàn thiện với sáp ong đạt chuẩn thực phẩm, vừa với bàn tay nhỏ xíu.','<p>Gỗ sồi châu Âu được thu hoạch bền vững. Kháng khuẩn tự nhiên. Kết hợp với kẹp silicone để giữ vòng ngậm gần bé.</p>'),('vi',15,'Mũ Cho Bé Hai Cục Bông Trắng Tinh Tế – Ấm Áp Êm Ái Cho Đầu Bé',NULL,'Vòng ngậm nướu bằng gỗ sồi hoàn thiện với sáp ong đạt chuẩn thực phẩm, vừa với bàn tay nhỏ xíu.','<p>Gỗ sồi châu Âu được thu hoạch bền vững. Kháng khuẩn tự nhiên. Kết hợp với kẹp silicone để giữ vòng ngậm gần bé.</p>'),('vi',16,'Ti Giả Cao Su Tự Nhiên Frigg Moon Êm Dịu Nhẹ Nhàng',NULL,'Lotion không hương liệu với chiết xuất yến mạch và bơ hạt mỡ cho làn da nhạy cảm của bé.','<p>Đã được kiểm nghiệm da liễu. Không chứa paraben, sulphate hay hương liệu tổng hợp. Chai bơm 200ml.</p>'),('vi',17,'Ti Giả Cao Su Tự Nhiên Frigg Moon Êm Dịu Nhẹ Nhàng',NULL,'Lotion không hương liệu với chiết xuất yến mạch và bơ hạt mỡ cho làn da nhạy cảm của bé.','<p>Đã được kiểm nghiệm da liễu. Không chứa paraben, sulphate hay hương liệu tổng hợp. Chai bơm 200ml.</p>');
/*!40000 ALTER TABLE `ec_products_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_review_replies`
--

DROP TABLE IF EXISTS `ec_review_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_review_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `customer_id` bigint unsigned DEFAULT NULL,
  `review_id` bigint unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_review_replies_review_id_unique` (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_review_replies`
--

LOCK TABLES `ec_review_replies` WRITE;
/*!40000 ALTER TABLE `ec_review_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_review_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_reviews`
--

DROP TABLE IF EXISTS `ec_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned DEFAULT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint unsigned NOT NULL,
  `star` double NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `badge_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'auto',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_reviews_product_id_customer_id_unique` (`product_id`,`customer_id`),
  KEY `ec_reviews_product_id_customer_id_status_created_at_index` (`product_id`,`customer_id`,`status`,`created_at`),
  KEY `review_relation_index` (`product_id`,`customer_id`,`status`),
  KEY `ec_reviews_product_id_status_index` (`product_id`,`status`),
  KEY `ec_reviews_customer_id_status_index` (`customer_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_reviews`
--

LOCK TABLES `ec_reviews` WRITE;
/*!40000 ALTER TABLE `ec_reviews` DISABLE KEYS */;
INSERT INTO `ec_reviews` VALUES (1,6,NULL,NULL,2,4,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(2,3,NULL,NULL,8,2,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(3,7,NULL,NULL,2,2,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(4,2,NULL,NULL,3,1,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(5,10,NULL,NULL,8,3,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(6,8,NULL,NULL,10,4,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(7,2,NULL,NULL,10,5,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(8,5,NULL,NULL,4,3,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(9,10,NULL,NULL,4,3,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(10,9,NULL,NULL,6,1,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(11,1,NULL,NULL,10,2,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(12,1,NULL,NULL,8,1,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(13,6,NULL,NULL,1,4,'Good app, good backup service and support. Good documentation.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(14,9,NULL,NULL,7,3,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(15,10,NULL,NULL,9,1,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(16,3,NULL,NULL,4,1,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(17,2,NULL,NULL,1,3,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(18,4,NULL,NULL,1,4,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(19,10,NULL,NULL,3,3,'Clean & perfect source code','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(20,5,NULL,NULL,1,3,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(21,8,NULL,NULL,4,2,'Good app, good backup service and support. Good documentation.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(22,1,NULL,NULL,9,4,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(23,5,NULL,NULL,7,5,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(24,6,NULL,NULL,7,2,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(25,9,NULL,NULL,2,1,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(26,6,NULL,NULL,4,4,'The code is good, in general, if you like it, can you give it 5 stars?','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(27,5,NULL,NULL,5,4,'Good app, good backup service and support. Good documentation.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(28,2,NULL,NULL,4,4,'The code is good, in general, if you like it, can you give it 5 stars?','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(29,4,NULL,NULL,5,4,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(30,8,NULL,NULL,3,2,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(31,3,NULL,NULL,6,5,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(32,9,NULL,NULL,10,1,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(33,10,NULL,NULL,1,5,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(34,6,NULL,NULL,10,1,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(35,5,NULL,NULL,3,2,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(36,3,NULL,NULL,3,3,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(37,5,NULL,NULL,2,3,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(38,8,NULL,NULL,8,3,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(39,10,NULL,NULL,6,1,'Good app, good backup service and support. Good documentation.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(40,1,NULL,NULL,4,4,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(41,10,NULL,NULL,5,5,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(42,10,NULL,NULL,7,3,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(43,6,NULL,NULL,9,2,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(44,2,NULL,NULL,8,1,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(45,8,NULL,NULL,9,5,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(46,2,NULL,NULL,6,5,'Good app, good backup service and support. Good documentation.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(47,6,NULL,NULL,6,1,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(48,9,NULL,NULL,8,3,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(49,4,NULL,NULL,6,1,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(50,2,NULL,NULL,7,5,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(51,4,NULL,NULL,7,4,'Good app, good backup service and support. Good documentation.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(52,3,NULL,NULL,10,4,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(53,1,NULL,NULL,3,2,'The code is good, in general, if you like it, can you give it 5 stars?','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(54,7,NULL,NULL,10,3,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(55,9,NULL,NULL,3,1,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(56,8,NULL,NULL,2,1,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(57,6,NULL,NULL,3,5,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(58,7,NULL,NULL,9,5,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(59,5,NULL,NULL,8,1,'Good app, good backup service and support. Good documentation.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(60,7,NULL,NULL,8,2,'The code is good, in general, if you like it, can you give it 5 stars?','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(61,4,NULL,NULL,2,1,'Good app, good backup service and support. Good documentation.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(62,3,NULL,NULL,9,5,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(63,4,NULL,NULL,4,1,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(64,9,NULL,NULL,5,4,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(65,8,NULL,NULL,7,2,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(66,7,NULL,NULL,7,3,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(67,6,NULL,NULL,8,4,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(68,6,NULL,NULL,5,1,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(69,5,NULL,NULL,10,2,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(70,2,NULL,NULL,2,2,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(71,8,NULL,NULL,5,3,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(72,7,NULL,NULL,4,4,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(73,9,NULL,NULL,4,3,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(74,10,NULL,NULL,10,5,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(75,4,NULL,NULL,10,4,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(76,8,NULL,NULL,6,3,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(77,1,NULL,NULL,5,2,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(78,9,NULL,NULL,9,2,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(79,7,NULL,NULL,3,1,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(80,1,NULL,NULL,2,3,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(81,8,NULL,NULL,1,5,'Best ecommerce CMS online store!','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(82,4,NULL,NULL,3,2,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(83,10,NULL,NULL,2,4,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(84,4,NULL,NULL,8,5,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(85,5,NULL,NULL,6,1,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(86,9,NULL,NULL,1,5,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(87,2,NULL,NULL,9,5,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(88,1,NULL,NULL,7,1,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(89,3,NULL,NULL,7,3,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(90,3,NULL,NULL,5,5,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(91,1,NULL,NULL,1,4,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(92,4,NULL,NULL,9,1,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(93,2,NULL,NULL,5,1,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(94,3,NULL,NULL,2,3,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(95,7,NULL,NULL,5,1,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(96,7,NULL,NULL,1,4,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(97,7,NULL,NULL,6,2,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(98,5,NULL,NULL,9,2,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(99,3,NULL,NULL,1,3,'Good app, good backup service and support. Good documentation.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL),(100,1,NULL,NULL,6,2,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','auto','2026-05-28 18:59:18','2026-05-28 18:59:18',NULL);
/*!40000 ALTER TABLE `ec_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shared_wishlists`
--

DROP TABLE IF EXISTS `ec_shared_wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shared_wishlists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_ids` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_shared_wishlists_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shared_wishlists`
--

LOCK TABLES `ec_shared_wishlists` WRITE;
/*!40000 ALTER TABLE `ec_shared_wishlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_shared_wishlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipment_histories`
--

DROP TABLE IF EXISTS `ec_shipment_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipment_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `shipment_id` bigint unsigned NOT NULL,
  `order_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipment_histories`
--

LOCK TABLES `ec_shipment_histories` WRITE;
/*!40000 ALTER TABLE `ec_shipment_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_shipment_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipments`
--

DROP TABLE IF EXISTS `ec_shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `weight` double DEFAULT '0',
  `shipment_id` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate_id` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cod_amount` decimal(15,2) DEFAULT '0.00',
  `cod_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cross_checking_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `price` decimal(15,2) DEFAULT '0.00',
  `store_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tracking_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estimate_date_shipped` datetime DEFAULT NULL,
  `date_shipped` datetime DEFAULT NULL,
  `customer_delivered_confirmed_at` timestamp NULL DEFAULT NULL,
  `label_url` text COLLATE utf8mb4_unicode_ci,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_shipments_order_id_unique` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipments`
--

LOCK TABLES `ec_shipments` WRITE;
/*!40000 ALTER TABLE `ec_shipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping`
--

DROP TABLE IF EXISTS `ec_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping`
--

LOCK TABLES `ec_shipping` WRITE;
/*!40000 ALTER TABLE `ec_shipping` DISABLE KEYS */;
INSERT INTO `ec_shipping` VALUES (1,'Domestic',NULL,'2026-05-28 18:59:18','2026-05-28 18:59:18'),(2,'International',NULL,'2026-05-28 18:59:18','2026-05-28 18:59:18');
/*!40000 ALTER TABLE `ec_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping_rule_items`
--

DROP TABLE IF EXISTS `ec_shipping_rule_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping_rule_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shipping_rule_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code_from` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code_to` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_price` decimal(15,2) DEFAULT '0.00',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_zip_range` (`zip_code_from`,`zip_code_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping_rule_items`
--

LOCK TABLES `ec_shipping_rule_items` WRITE;
/*!40000 ALTER TABLE `ec_shipping_rule_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_shipping_rule_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping_rules`
--

DROP TABLE IF EXISTS `ec_shipping_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping_rules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_id` bigint unsigned NOT NULL,
  `type` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT 'based_on_price',
  `from` decimal(15,2) DEFAULT '0.00',
  `to` decimal(15,2) DEFAULT '0.00',
  `price` decimal(15,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping_rules`
--

LOCK TABLES `ec_shipping_rules` WRITE;
/*!40000 ALTER TABLE `ec_shipping_rules` DISABLE KEYS */;
INSERT INTO `ec_shipping_rules` VALUES (1,'Free Standard Shipping (orders $99+)',1,'based_on_price',99.00,NULL,0.00,'2026-05-28 18:59:18','2026-05-28 18:59:18'),(2,'Standard (3-5 business days)',1,'based_on_price',0.00,NULL,7.99,'2026-05-28 18:59:18','2026-05-28 18:59:18'),(3,'Express (1-2 business days)',1,'based_on_price',0.00,NULL,19.99,'2026-05-28 18:59:18','2026-05-28 18:59:18'),(4,'Local Pickup',1,'based_on_price',0.00,NULL,0.00,'2026-05-28 18:59:18','2026-05-28 18:59:18'),(5,'International Standard (7-12 days)',2,'based_on_price',0.00,NULL,24.99,'2026-05-28 18:59:18','2026-05-28 18:59:18'),(6,'International Express (3-5 days)',2,'based_on_price',0.00,NULL,49.99,'2026-05-28 18:59:18','2026-05-28 18:59:18');
/*!40000 ALTER TABLE `ec_shipping_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_specification_attributes`
--

DROP TABLE IF EXISTS `ec_specification_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_specification_attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `group_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `default_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_index` (`author_type`,`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_specification_attributes`
--

LOCK TABLES `ec_specification_attributes` WRITE;
/*!40000 ALTER TABLE `ec_specification_attributes` DISABLE KEYS */;
INSERT INTO `ec_specification_attributes` VALUES (1,1,'Composition','text',NULL,'55% Polyester, 30% Acrylic, 13% Polyamide, 2% Elastane','2026-05-28 18:59:08','2026-05-28 18:59:08',NULL,NULL),(2,1,'Origin','text',NULL,'Made in Portugal','2026-05-28 18:59:08','2026-05-28 18:59:08',NULL,NULL),(3,1,'Care','text',NULL,'Machine wash cold. Tumble dry low. Do not bleach.','2026-05-28 18:59:08','2026-05-28 18:59:08',NULL,NULL),(4,2,'Designed In','text',NULL,'Barcelona, Spain','2026-05-28 18:59:08','2026-05-28 18:59:08',NULL,NULL),(5,2,'Warranty','text',NULL,'12 months manufacturer warranty','2026-05-28 18:59:08','2026-05-28 18:59:08',NULL,NULL),(6,2,'Made From Recycled Materials','checkbox',NULL,'1','2026-05-28 18:59:08','2026-05-28 18:59:08',NULL,NULL);
/*!40000 ALTER TABLE `ec_specification_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_specification_attributes_translations`
--

DROP TABLE IF EXISTS `ec_specification_attributes_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_specification_attributes_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_specification_attributes_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `default_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_specification_attributes_id`),
  KEY `idx_specification_attributes_fk` (`ec_specification_attributes_id`),
  KEY `idx_specification_attributes_specification_attributes_lang` (`ec_specification_attributes_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_specification_attributes_translations`
--

LOCK TABLES `ec_specification_attributes_translations` WRITE;
/*!40000 ALTER TABLE `ec_specification_attributes_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_specification_attributes_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_specification_groups`
--

DROP TABLE IF EXISTS `ec_specification_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_specification_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_index` (`author_type`,`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_specification_groups`
--

LOCK TABLES `ec_specification_groups` WRITE;
/*!40000 ALTER TABLE `ec_specification_groups` DISABLE KEYS */;
INSERT INTO `ec_specification_groups` VALUES (1,'Material & Composition','Fibre breakdown, origin and care guidance.','2026-05-28 18:59:08','2026-05-28 18:59:08',NULL,NULL),(2,'Product Details','Provenance, warranty and sustainability.','2026-05-28 18:59:08','2026-05-28 18:59:08',NULL,NULL);
/*!40000 ALTER TABLE `ec_specification_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_specification_groups_translations`
--

DROP TABLE IF EXISTS `ec_specification_groups_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_specification_groups_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_specification_groups_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_specification_groups_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_specification_groups_translations`
--

LOCK TABLES `ec_specification_groups_translations` WRITE;
/*!40000 ALTER TABLE `ec_specification_groups_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_specification_groups_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_specification_table_group`
--

DROP TABLE IF EXISTS `ec_specification_table_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_specification_table_group` (
  `table_id` bigint unsigned NOT NULL,
  `group_id` bigint unsigned NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`table_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_specification_table_group`
--

LOCK TABLES `ec_specification_table_group` WRITE;
/*!40000 ALTER TABLE `ec_specification_table_group` DISABLE KEYS */;
INSERT INTO `ec_specification_table_group` VALUES (1,1,0),(1,2,1);
/*!40000 ALTER TABLE `ec_specification_table_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_specification_tables`
--

DROP TABLE IF EXISTS `ec_specification_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_specification_tables` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_index` (`author_type`,`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_specification_tables`
--

LOCK TABLES `ec_specification_tables` WRITE;
/*!40000 ALTER TABLE `ec_specification_tables` DISABLE KEYS */;
INSERT INTO `ec_specification_tables` VALUES (1,'Default Specifications','Default specification layout applied to all products.','2026-05-28 18:59:08','2026-05-28 18:59:08',NULL,NULL);
/*!40000 ALTER TABLE `ec_specification_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_specification_tables_translations`
--

DROP TABLE IF EXISTS `ec_specification_tables_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_specification_tables_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_specification_tables_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_specification_tables_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_specification_tables_translations`
--

LOCK TABLES `ec_specification_tables_translations` WRITE;
/*!40000 ALTER TABLE `ec_specification_tables_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_specification_tables_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_store_locators`
--

DROP TABLE IF EXISTS `ec_store_locators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_store_locators` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT '0',
  `is_shipping_location` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_store_locators`
--

LOCK TABLES `ec_store_locators` WRITE;
/*!40000 ALTER TABLE `ec_store_locators` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_store_locators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_tax_products`
--

DROP TABLE IF EXISTS `ec_tax_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_tax_products` (
  `tax_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`tax_id`),
  KEY `ec_tax_products_tax_id_index` (`tax_id`),
  KEY `ec_tax_products_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_tax_products`
--

LOCK TABLES `ec_tax_products` WRITE;
/*!40000 ALTER TABLE `ec_tax_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_tax_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_tax_rules`
--

DROP TABLE IF EXISTS `ec_tax_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_tax_rules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tax_id` bigint unsigned NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `percentage` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_tax_rules`
--

LOCK TABLES `ec_tax_rules` WRITE;
/*!40000 ALTER TABLE `ec_tax_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_tax_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_taxes`
--

DROP TABLE IF EXISTS `ec_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` float DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_taxes`
--

LOCK TABLES `ec_taxes` WRITE;
/*!40000 ALTER TABLE `ec_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_taxes_translations`
--

DROP TABLE IF EXISTS `ec_taxes_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_taxes_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_taxes_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_taxes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_taxes_translations`
--

LOCK TABLES `ec_taxes_translations` WRITE;
/*!40000 ALTER TABLE `ec_taxes_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_taxes_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_wish_lists`
--

DROP TABLE IF EXISTS `ec_wish_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_wish_lists` (
  `customer_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`,`product_id`),
  KEY `wishlist_relation_index` (`product_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_wish_lists`
--

LOCK TABLES `ec_wish_lists` WRITE;
/*!40000 ALTER TABLE `ec_wish_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_wish_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories`
--

DROP TABLE IF EXISTS `faq_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories`
--

LOCK TABLES `faq_categories` WRITE;
/*!40000 ALTER TABLE `faq_categories` DISABLE KEYS */;
INSERT INTO `faq_categories` VALUES (1,'Orders &amp; Shipping',0,'published','2026-05-28 18:59:07','2026-05-28 18:59:07','Everything about placing, tracking, and receiving your order.'),(2,'Returns &amp; Refunds',1,'published','2026-05-28 18:59:07','2026-05-28 18:59:07','Our 30-day return policy and how to start a return.'),(3,'Products &amp; Stock',2,'published','2026-05-28 18:59:07','2026-05-28 18:59:07','Sizing, materials, restocks, and product care.'),(4,'Account &amp; Payment',3,'published','2026-05-28 18:59:07','2026-05-28 18:59:07','Managing your account and accepted payment methods.');
/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories_translations`
--

DROP TABLE IF EXISTS `faq_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_categories_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`faq_categories_id`),
  KEY `idx_faq_cat_trans_faq_cat_id` (`faq_categories_id`),
  KEY `idx_faq_cat_trans_faq_cat_lang` (`faq_categories_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories_translations`
--

LOCK TABLES `faq_categories_translations` WRITE;
/*!40000 ALTER TABLE `faq_categories_translations` DISABLE KEYS */;
INSERT INTO `faq_categories_translations` VALUES ('ar',1,'Orders &amp; Shipping'),('ar',2,'Returns &amp; Refunds'),('ar',3,'Products &amp; Stock'),('ar',4,'Account &amp; Payment'),('fr',1,'Orders &amp; Shipping'),('fr',2,'Returns &amp; Refunds'),('fr',3,'Products &amp; Stock'),('fr',4,'Account &amp; Payment'),('id',1,'Orders &amp; Shipping'),('id',2,'Returns &amp; Refunds'),('id',3,'Products &amp; Stock'),('id',4,'Account &amp; Payment'),('tr',1,'Orders &amp; Shipping'),('tr',2,'Returns &amp; Refunds'),('tr',3,'Products &amp; Stock'),('tr',4,'Account &amp; Payment'),('vi',1,'Orders &amp; Shipping'),('vi',2,'Returns &amp; Refunds'),('vi',3,'Products &amp; Stock'),('vi',4,'Account &amp; Payment');
/*!40000 ALTER TABLE `faq_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'How long does standard shipping take?','Standard shipping arrives within 3-5 business days for domestic orders and 7-12 business days for international destinations. Express options are available at checkout.',1,'published','2026-05-28 18:59:07','2026-05-28 18:59:07'),(2,'Do you offer free shipping?','Yes — orders above $99 ship free within the continental US. International free-shipping thresholds vary by destination and are shown at checkout.',1,'published','2026-05-28 18:59:07','2026-05-28 18:59:07'),(3,'How can I track my order?','You will receive a tracking link by email as soon as your order is dispatched. You can also follow the parcel from your account dashboard under My Orders.',1,'published','2026-05-28 18:59:07','2026-05-28 18:59:07'),(4,'Can I change the shipping address after I place my order?','Address changes are possible if your order has not yet entered fulfilment. Contact us within two hours of placing the order for the best chance of a successful update.',1,'published','2026-05-28 18:59:07','2026-05-28 18:59:07'),(5,'What is your return policy?','We offer 30 days from delivery to return any unworn item in its original condition. Sale items and intimate apparel are final sale.',2,'published','2026-05-28 18:59:07','2026-05-28 18:59:07'),(6,'How do I start a return?','Start a return from your account dashboard or email returns@amerce.test with your order number. We will send a prepaid return label for domestic orders.',2,'published','2026-05-28 18:59:07','2026-05-28 18:59:07'),(7,'When will I receive my refund?','Refunds are processed within 3-5 business days of us receiving your return. The funds typically appear on your statement within an additional 5-7 days, depending on your bank.',2,'published','2026-05-28 18:59:07','2026-05-28 18:59:07'),(8,'How do I find the right size?','Each product page includes a size chart based on actual garment measurements. If you are between sizes, we generally recommend sizing up for our knitwear and outerwear.',3,'published','2026-05-28 18:59:07','2026-05-28 18:59:07'),(9,'When will sold-out items be restocked?','Most styles restock within 2-4 weeks. Click the Notify Me button on any sold-out variant to be alerted by email the moment it returns.',3,'published','2026-05-28 18:59:07','2026-05-28 18:59:07'),(10,'Are your products ethically sourced?','Yes. We work only with manufacturing partners who meet our supplier code of conduct, covering fair wages, safe conditions, and verified material provenance.',3,'published','2026-05-28 18:59:07','2026-05-28 18:59:07'),(11,'Which payment methods do you accept?','We accept Visa, Mastercard, American Express, Apple Pay, Google Pay, PayPal, and Klarna for eligible markets.',4,'published','2026-05-28 18:59:07','2026-05-28 18:59:07'),(12,'Is it safe to enter my card details?','All payments are processed by PCI-DSS Level 1 certified providers using TLS 1.3 encryption. We never store full card numbers on our servers.',4,'published','2026-05-28 18:59:07','2026-05-28 18:59:07'),(13,'How do I reset my password?','Use the Forgot Password link on the login page. A reset link will be sent to your registered email address and is valid for 30 minutes.',4,'published','2026-05-28 18:59:07','2026-05-28 18:59:07');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs_translations`
--

DROP TABLE IF EXISTS `faqs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqs_id` bigint unsigned NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`faqs_id`),
  KEY `idx_faqs_trans_faqs_id` (`faqs_id`),
  KEY `idx_faqs_trans_faq_lang` (`faqs_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs_translations`
--

LOCK TABLES `faqs_translations` WRITE;
/*!40000 ALTER TABLE `faqs_translations` DISABLE KEYS */;
INSERT INTO `faqs_translations` VALUES ('ar',1,'كم من الوقت يستغرق الشحن القياسي؟','يصل الشحن القياسي خلال 3-5 أيام عمل للطلبات المحلية و7-12 يوم عمل للوجهات الدولية. تتوفر خيارات الشحن المعجل عند الخروج.'),('ar',2,'هل تقدمون الشحن المجاني؟','نعم - يتم شحن الطلبات التي تزيد قيمتها عن 99 دولارًا مجانًا داخل الولايات المتحدة القارية. يختلف الحد الأدنى للشحن الدولي المجاني حسب الوجهة ويتم عرضه عند الخروج.'),('ar',3,'كيف يمكنني تتبع طلبي؟','سوف تتلقى رابط تتبع عبر البريد الإلكتروني بمجرد شحن طلبك. يمكنك أيضًا تتبع الحزمة الخاصة بك من صفحة إدارة حسابك ضمن طلباتي.'),('ar',4,'هل يمكنني تغيير عنوان الشحن بعد تقديم طلبي؟','يمكن تغيير العنوان إذا لم تتم معالجة الطلب. اتصل بنا خلال ساعتين من تقديم طلبك للحصول على أفضل فرصة لتحديث ناجح.'),('ar',5,'ما هي سياسة الإرجاع الخاصة بك؟','نمنح 30 يومًا من تاريخ التسليم لإعادة أي منتج غير مستخدم بحالته الأصلية. العناصر والملابس الداخلية المخفضة نهائية - ولا توجد عوائد.'),('ar',6,'كيف أبدأ العودة؟','ابدأ عملية الإرجاع من صفحة إدارة حسابك أو أرسل بريدًا إلكترونيًا إلى return@amerce.test يتضمن رقم طلبك. سوف نرسل ملصق شحن الإرجاع المدفوع مسبقًا للطلبات المحلية.'),('ar',7,'متى سأستلم أموالي المستردة؟','تتم معالجة المبالغ المستردة في غضون 3-5 أيام عمل من تاريخ استلامنا للمنتج المرتجع. تظهر الأموال عادة في كشف حسابك بعد 5-7 أيام إضافية حسب البنك.'),('ar',8,'كيف أجد الحجم المناسب؟','تحتوي كل صفحة منتج على مخطط حجم يعتمد على قياسات المنتج الفعلية. إذا كان مقاسك بين مقاسين، فنوصي عادةً باختيار المقاس الأكبر للملابس المحبوكة والمعاطف.'),('ar',9,'متى سيتم إعادة تخزين العناصر المباعة؟','يتم إعادة تخزين معظم الأنماط في غضون 2-4 أسابيع. انقر فوق الزر \"أخطرني\" الموجود على أي إصدار غير متوفر في المخزون ليتم إعلامك عبر البريد الإلكتروني عندما يعود المنتج.'),('ar',10,'هل منتجاتك من مصادر أخلاقية؟','يملك. نحن نعمل فقط مع شركاء التصنيع الذين يستوفون قواعد سلوك الموردين الخاصة بنا، بما في ذلك الأجور العادلة والظروف الآمنة وأصول المواد التي تم التحقق منها.'),('ar',11,'ما هي طرق الدفع التي تقبلونها؟','نحن نقبل Visa وMastercard وAmerican Express وApple Pay وGoogle Pay وPayPal وKlarna للأسواق المدعومة.'),('ar',12,'هل من الآمن إدخال تفاصيل بطاقتي؟','تتم معالجة جميع المدفوعات بواسطة مزود معتمد من PCI-DSS من المستوى 1 مع تشفير TLS 1.3. لا نقوم مطلقًا بتخزين أرقام البطاقات الكاملة على خوادمنا.'),('ar',13,'كيف يمكنني إعادة تعيين كلمة المرور الخاصة بي؟','استخدم رابط نسيت كلمة المرور في صفحة تسجيل الدخول. سيتم إرسال رابط إعادة التعيين إلى بريدك الإلكتروني المسجل وهو صالح لمدة 30 دقيقة.'),('fr',1,'Combien de temps prend l\'expédition standard ?','L\'expédition standard arrive dans un délai de 3 à 5 jours ouvrables pour les commandes nationales et de 7 à 12 jours ouvrables pour les destinations internationales. Des options d’expédition accélérée sont disponibles à la caisse.'),('fr',2,'Offrez-vous la livraison gratuite ?','Oui, les commandes de plus de 99 $ sont expédiées gratuitement dans la zone continentale des États-Unis. Le seuil de livraison internationale gratuite varie selon la destination et est affiché au moment du paiement.'),('fr',3,'Comment puis-je suivre ma commande ?','Vous recevrez un lien de suivi par e-mail dès que votre commande sera expédiée. Vous pouvez également suivre votre colis depuis la page de gestion de votre compte sous Mes commandes.'),('fr',4,'Puis-je modifier l\'adresse de livraison après avoir passé ma commande ?','L\'adresse peut être modifiée si la commande n\'a pas été traitée. Contactez-nous dans les deux heures suivant votre commande pour avoir les meilleures chances de réussite de la mise à jour.'),('fr',5,'Quelle est votre politique de retour ?','Nous vous accordons 30 jours à compter de la date de livraison pour retourner tout produit non utilisé dans son état d\'origine. Les articles et sous-vêtements à prix réduit sont définitifs – aucun retour.'),('fr',6,'Comment démarrer un retour ?','Initiez un retour depuis la page de gestion de votre compte ou envoyez un e-mail à return@amerce.test avec votre numéro de commande. Nous enverrons une étiquette de retour prépayée pour les commandes nationales.'),('fr',7,'Quand vais-je recevoir mon remboursement ?','Les remboursements sont traités dans les 3 à 5 jours ouvrables à compter de la réception de l\'article retourné. Les fonds apparaissent généralement sur votre relevé après 5 à 7 jours supplémentaires selon la banque.'),('fr',8,'Comment trouver la bonne taille ?','Chaque page de produit comporte un tableau des tailles basé sur les mesures réelles du produit. Si vous êtes entre deux tailles, nous vous recommandons généralement de choisir la taille la plus grande pour les tricots et les manteaux.'),('fr',9,'Quand les articles épuisés seront-ils réapprovisionnés ?','La plupart des styles sont réapprovisionnés dans un délai de 2 à 4 semaines. Cliquez sur le bouton M\'avertir de toute variation en rupture de stock pour être averti par e-mail du retour du produit.'),('fr',10,'Vos produits sont-ils issus de sources éthiques ?','Avoir. Nous travaillons uniquement avec des partenaires de fabrication qui respectent notre code de conduite des fournisseurs, notamment des salaires équitables, des conditions sûres et des origines de matériaux vérifiées.'),('fr',11,'Quels modes de paiement acceptez-vous ?','Nous acceptons Visa, Mastercard, American Express, Apple Pay, Google Pay, PayPal et Klarna pour les marchés pris en charge.'),('fr',12,'Est-il sécuritaire de saisir les détails de ma carte ?','Tous les paiements sont traités par un fournisseur certifié PCI-DSS niveau 1 avec cryptage TLS 1.3. Nous ne stockons jamais les numéros de carte complets sur nos serveurs.'),('fr',13,'Comment réinitialiser mon mot de passe ?','Utilisez le lien Mot de passe oublié sur la page de connexion. Un lien de réinitialisation sera envoyé à votre adresse e-mail enregistrée et est valable 30 minutes.'),('id',1,'Berapa lama waktu pengiriman standar?','Pengiriman standar tiba dalam 3-5 hari kerja untuk pesanan domestik dan 7-12 hari kerja untuk tujuan internasional. Opsi pengiriman yang dipercepat tersedia saat checkout.'),('id',2,'Apakah Anda menawarkan pengiriman gratis?','Ya — pesanan di atas $99 dikirimkan gratis di wilayah AS. Ambang batas pengiriman internasional gratis bervariasi berdasarkan tujuan dan ditampilkan saat checkout.'),('id',3,'Bagaimana cara melacak pesanan saya?','Anda akan menerima tautan pelacakan melalui email segera setelah pesanan Anda dikirimkan. Anda juga dapat melacak paket Anda dari halaman manajemen akun Anda di bawah Pesanan Saya.'),('id',4,'Bisakah saya mengubah alamat pengiriman setelah saya melakukan pemesanan?','Alamat dapat diubah jika pesanan belum diproses. Hubungi kami dalam waktu dua jam setelah melakukan pemesanan untuk mendapatkan peluang terbaik agar pembaruan berhasil.'),('id',5,'Apa kebijakan pengembalian Anda?','Kami memberikan waktu 30 hari sejak tanggal pengiriman untuk mengembalikan produk yang tidak terpakai ke kondisi aslinya. Barang dan pakaian dalam yang didiskon bersifat final — tidak ada pengembalian.'),('id',6,'Bagaimana cara memulai pengembalian?','Lakukan pengembalian dari halaman manajemen akun Anda atau kirim email ke return@amerce.test dengan nomor pesanan Anda. Kami akan mengirimkan label pengiriman pengembalian prabayar untuk pesanan domestik.'),('id',7,'Kapan saya akan menerima pengembalian dana saya?','Pengembalian dana diproses dalam 3-5 hari kerja sejak kami menerima barang yang dikembalikan. Dana biasanya muncul di laporan Anda setelah 5-7 hari tambahan, tergantung banknya.'),('id',8,'Bagaimana cara menemukan ukuran yang tepat?','Setiap halaman produk memiliki tabel ukuran berdasarkan pengukuran produk sebenarnya. Jika Anda berada di antara dua ukuran, kami biasanya menyarankan memilih ukuran yang lebih besar untuk pakaian rajut dan mantel.'),('id',9,'Kapan barang yang terjual habis akan direstock?','Sebagian besar model diisi ulang dalam 2-4 minggu. Klik tombol Beritahu Saya pada variasi yang kehabisan stok untuk diberitahu melalui email ketika produk dikembalikan.'),('id',10,'Apakah produk Anda bersumber secara etis?','Memiliki. Kami hanya bekerja sama dengan mitra manufaktur yang memenuhi kode etik pemasok kami, termasuk upah yang adil, kondisi aman, dan asal bahan yang terverifikasi.'),('id',11,'Metode pembayaran apa yang Anda terima?','Kami menerima Visa, Mastercard, American Express, Apple Pay, Google Pay, PayPal, dan Klarna untuk pasar yang didukung.'),('id',12,'Apakah aman memasukkan detail kartu saya?','Semua pembayaran diproses oleh penyedia bersertifikat PCI-DSS Level 1 dengan enkripsi TLS 1.3. Kami tidak pernah menyimpan nomor kartu lengkap di server kami.'),('id',13,'Bagaimana cara mereset kata sandi saya?','Gunakan tautan Lupa Kata Sandi di halaman login. Tautan reset akan dikirimkan ke email Anda yang terdaftar dan berlaku selama 30 menit.'),('tr',1,'Standart gönderim ne kadar sürer?','Standart kargo, yurt içi siparişlerde 3-5 iş günü, yurt dışı siparişlerde ise 7-12 iş günü içerisinde ulaşır. Ödeme sırasında hızlandırılmış gönderim seçenekleri mevcuttur.'),('tr',2,'Ücretsiz kargo sunuyor musunuz?','Evet — 99$\'ın üzerindeki siparişler ABD kıtasında ücretsiz olarak gönderilir. Ücretsiz uluslararası gönderim eşiği varış noktasına göre değişir ve ödeme sırasında görüntülenir.'),('tr',3,'Siparişimi nasıl takip edebilirim?','Siparişiniz gönderilir gönderilmez e-posta yoluyla bir takip bağlantısı alacaksınız. Paketinizi ayrıca siparişlerim altındaki hesap yönetimi sayfanızdan da takip edebilirsiniz.'),('tr',4,'Siparişimi verdikten sonra teslimat adresini değiştirebilir miyim?','Siparişin işleme koyulmaması durumunda adres değiştirilebilir. Başarılı bir güncelleme şansı için siparişinizi verdikten sonraki iki saat içinde bizimle iletişime geçin.'),('tr',5,'İade politikanız nedir?','Kullanılmamış ürünü orijinal haliyle iade etmek için teslimat tarihinden itibaren 30 gün süre veriyoruz. İndirimli ürünler ve iç çamaşırları sondur; iade yoktur.'),('tr',6,'İade işlemini nasıl başlatabilirim?','Hesap yönetimi sayfanızdan bir iade işlemi başlatın veya sipariş numaranızla birlikte return@amerce.test adresine bir e-posta gönderin. Yurtiçi siparişlerde ön ödemeli iade nakliye etiketi göndereceğiz.'),('tr',7,'Geri ödememi ne zaman alacağım?','Geri ödemeler, iade edilen ürünün tarafımıza ulaşmasından itibaren 3-5 iş günü içerisinde gerçekleştirilir. Fonlar genellikle bankaya bağlı olarak ek 5-7 gün sonra ekstrenizde görünür.'),('tr',8,'Doğru boyutu nasıl bulurum?','Her ürün sayfasında gerçek ürün ölçülerine dayalı bir beden tablosu bulunur. Eğer iki beden arasında kaldıysanız triko ve kabanlarda genellikle büyük bedeni tercih etmenizi öneririz.'),('tr',9,'Tükenen ürünler ne zaman stoklara eklenecek?','Çoğu stil 2-4 hafta içinde yeniden stoklanır. Ürün iade edildiğinde e-postayla bilgilendirilmek için stokta olmayan herhangi bir varyasyonda Bana Bildir düğmesini tıklayın.'),('tr',10,'Ürünleriniz etik kurallara uygun mu?','Sahip olmak. Yalnızca adil ücretler, güvenli koşullar ve doğrulanmış malzeme menşeleri de dahil olmak üzere tedarikçi davranış kurallarımızı karşılayan üretim ortaklarıyla çalışıyoruz.'),('tr',11,'Hangi ödeme yöntemlerini kabul ediyorsunuz?','Desteklenen pazarlar için Visa, Mastercard, American Express, Apple Pay, Google Pay, PayPal ve Klarna\'yı kabul ediyoruz.'),('tr',12,'Kart bilgilerimi girmem güvenli mi?','Tüm ödemeler, TLS 1.3 şifrelemesine sahip PCI-DSS Seviye 1 sertifikalı bir sağlayıcı tarafından işlenir. Kart numaralarının tamamını hiçbir zaman sunucularımızda saklamayız.'),('tr',13,'Şifremi nasıl sıfırlarım?','Giriş sayfasındaki Şifremi Unuttum bağlantısını kullanın. Kayıtlı e-posta adresinize bir sıfırlama bağlantısı gönderilecek ve 30 dakika süreyle geçerlidir.'),('vi',1,'Vận chuyển tiêu chuẩn mất bao lâu?','Vận chuyển tiêu chuẩn đến trong vòng 3-5 ngày làm việc cho đơn hàng nội địa và 7-12 ngày làm việc cho điểm đến quốc tế. Lựa chọn vận chuyển nhanh có sẵn tại bước thanh toán.'),('vi',2,'Quý vị có hỗ trợ miễn phí vận chuyển không?','Có — đơn hàng trên 99$ được miễn phí vận chuyển trong khu vực Hoa Kỳ lục địa. Ngưỡng miễn phí vận chuyển quốc tế thay đổi theo điểm đến và được hiển thị tại bước thanh toán.'),('vi',3,'Làm thế nào để theo dõi đơn hàng?','Bạn sẽ nhận được liên kết theo dõi qua email ngay khi đơn hàng được gửi đi. Bạn cũng có thể theo dõi kiện hàng từ trang quản lý tài khoản trong mục Đơn hàng của tôi.'),('vi',4,'Tôi có thể đổi địa chỉ giao hàng sau khi đặt đơn không?','Có thể đổi địa chỉ nếu đơn hàng chưa được xử lý. Hãy liên hệ với chúng tôi trong vòng hai giờ kể từ khi đặt đơn để có cơ hội cập nhật thành công cao nhất.'),('vi',5,'Chính sách đổi trả của quý vị như thế nào?','Chúng tôi cho 30 ngày kể từ ngày giao hàng để trả lại bất kỳ sản phẩm nào chưa qua sử dụng trong tình trạng nguyên bản. Hàng giảm giá và đồ lót là hàng cuối — không đổi trả.'),('vi',6,'Làm thế nào để bắt đầu đổi trả?','Bắt đầu đổi trả từ trang quản lý tài khoản hoặc gửi email đến returns@amerce.test cùng số đơn hàng. Chúng tôi sẽ gửi nhãn vận chuyển trả hàng trả phí trước cho đơn hàng nội địa.'),('vi',7,'Khi nào tôi nhận được tiền hoàn lại?','Tiền hoàn được xử lý trong vòng 3-5 ngày làm việc kể từ khi chúng tôi nhận được hàng trả. Tiền thường xuất hiện trong sao kê của bạn sau thêm 5-7 ngày tùy ngân hàng.'),('vi',8,'Làm thế nào để tìm đúng kích cỡ?','Mỗi trang sản phẩm có bảng kích cỡ dựa trên số đo thực tế của sản phẩm. Nếu bạn ở giữa hai size, chúng tôi thường khuyên chọn size lớn hơn cho đồ dệt kim và áo khoác.'),('vi',9,'Khi nào sản phẩm hết hàng được nhập lại?','Hầu hết các kiểu được nhập lại trong vòng 2-4 tuần. Bấm nút Thông báo cho tôi trên bất kỳ biến thể nào hết hàng để được thông báo qua email khi sản phẩm trở lại.'),('vi',10,'Sản phẩm của quý vị có nguồn cung có đạo đức không?','Có. Chúng tôi chỉ làm việc với các đối tác sản xuất đáp ứng quy tắc ứng xử nhà cung cấp, bao gồm lương công bằng, điều kiện an toàn và nguồn gốc vật liệu được xác minh.'),('vi',11,'Quý vị chấp nhận những phương thức thanh toán nào?','Chúng tôi chấp nhận Visa, Mastercard, American Express, Apple Pay, Google Pay, PayPal và Klarna cho các thị trường được hỗ trợ.'),('vi',12,'Nhập thông tin thẻ có an toàn không?','Mọi thanh toán đều được xử lý bởi nhà cung cấp được chứng nhận PCI-DSS Level 1 với mã hóa TLS 1.3. Chúng tôi không bao giờ lưu trữ số thẻ đầy đủ trên máy chủ.'),('vi',13,'Làm thế nào để đặt lại mật khẩu?','Sử dụng liên kết Quên mật khẩu trên trang đăng nhập. Một liên kết đặt lại sẽ được gửi đến email đăng ký của bạn và có hiệu lực trong 30 phút.');
/*!40000 ALTER TABLE `faqs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fob_product_size_guide_relations`
--

DROP TABLE IF EXISTS `fob_product_size_guide_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fob_product_size_guide_relations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `size_guide_id` bigint unsigned NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fob_psg_relations_size_guide_id_idx` (`size_guide_id`),
  KEY `fob_psg_relations_ref_idx` (`reference_id`,`reference_type`),
  CONSTRAINT `fob_product_size_guide_relations_size_guide_id_foreign` FOREIGN KEY (`size_guide_id`) REFERENCES `fob_product_size_guides` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fob_product_size_guide_relations`
--

LOCK TABLES `fob_product_size_guide_relations` WRITE;
/*!40000 ALTER TABLE `fob_product_size_guide_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `fob_product_size_guide_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fob_product_size_guides`
--

DROP TABLE IF EXISTS `fob_product_size_guides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fob_product_size_guides` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_headers` json DEFAULT NULL,
  `table_rows` json DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fob_psg_status_idx` (`status`),
  KEY `fob_psg_order_idx` (`order`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fob_product_size_guides`
--

LOCK TABLES `fob_product_size_guides` WRITE;
/*!40000 ALTER TABLE `fob_product_size_guides` DISABLE KEYS */;
INSERT INTO `fob_product_size_guides` VALUES (1,'Default Size Chart','<h6>Bust</h6><p>Measure around the fullest part of your bust.</p><h6>Waist</h6><p>Measure around the narrowest part of your torso.</p><h6>Low Hip</h6><p>With your feet together measure around the fullest part of your hips/rear.</p>',NULL,'[\"size\", \"us\", \"bust\", \"waist\", \"low-hip\"]','[[\"XS\", \"2\", \"32\", \"24 - 25\", \"33 - 34\"], [\"S\", \"4\", \"34 - 35\", \"26 - 27\", \"35 - 26\"], [\"M\", \"6\", \"36 - 37\", \"28 - 29\", \"38 - 40\"], [\"L\", \"8\", \"38 - 29\", \"30 - 31\", \"42 - 44\"], [\"XL\", \"10\", \"40 - 41\", \"32 - 33\", \"45 - 47\"], [\"XXL\", \"12\", \"42 - 43\", \"34 - 35\", \"48 - 50\"]]','published',0,'2026-05-28 18:59:08','2026-05-28 18:59:08');
/*!40000 ALTER TABLE `fob_product_size_guides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fob_size_guide_headers`
--

DROP TABLE IF EXISTS `fob_size_guide_headers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fob_size_guide_headers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'general',
  `order` int NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fob_size_guide_headers_slug_unique` (`slug`),
  KEY `fob_psg_headers_status_idx` (`status`),
  KEY `fob_psg_headers_category_idx` (`category`),
  KEY `fob_psg_headers_order_idx` (`order`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fob_size_guide_headers`
--

LOCK TABLES `fob_size_guide_headers` WRITE;
/*!40000 ALTER TABLE `fob_size_guide_headers` DISABLE KEYS */;
INSERT INTO `fob_size_guide_headers` VALUES (1,'Size','size','general',0,'published','2026-05-28 18:59:08','2026-05-28 18:59:08'),(2,'US','us','general',1,'published','2026-05-28 18:59:08','2026-05-28 18:59:08'),(3,'Bust','bust','general',2,'published','2026-05-28 18:59:08','2026-05-28 18:59:08'),(4,'Waist','waist','general',3,'published','2026-05-28 18:59:08','2026-05-28 18:59:08'),(5,'Low Hip','low-hip','general',4,'published','2026-05-28 18:59:08','2026-05-28 18:59:08');
/*!40000 ALTER TABLE `fob_size_guide_headers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fob_size_guide_headers_translations`
--

DROP TABLE IF EXISTS `fob_size_guide_headers_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fob_size_guide_headers_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fob_size_guide_headers_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`fob_size_guide_headers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fob_size_guide_headers_translations`
--

LOCK TABLES `fob_size_guide_headers_translations` WRITE;
/*!40000 ALTER TABLE `fob_size_guide_headers_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `fob_size_guide_headers_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries_translations`
--

DROP TABLE IF EXISTS `galleries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `galleries_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`galleries_id`),
  KEY `idx_galleries_trans_galleries_id` (`galleries_id`),
  KEY `idx_galleries_trans_gallery_lang` (`galleries_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries_translations`
--

LOCK TABLES `galleries_translations` WRITE;
/*!40000 ALTER TABLE `galleries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `galleries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta`
--

DROP TABLE IF EXISTS `gallery_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `images` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta`
--

LOCK TABLES `gallery_meta` WRITE;
/*!40000 ALTER TABLE `gallery_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta_translations`
--

DROP TABLE IF EXISTS `gallery_meta_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gallery_meta_id` bigint unsigned NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`gallery_meta_id`),
  KEY `idx_gallery_meta_trans_gm_id` (`gallery_meta_id`),
  KEY `idx_gallery_meta_trans_gm_lang` (`gallery_meta_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta_translations`
--

LOCK TABLES `gallery_meta_translations` WRITE;
/*!40000 ALTER TABLE `gallery_meta_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_meta_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`),
  KEY `meta_code_index` (`lang_meta_code`),
  KEY `meta_origin_index` (`lang_meta_origin`),
  KEY `meta_reference_type_index` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (7,'en','0f92f92ae3aa3fb00f327faccdc9f11f',3,'Botble\\Menu\\Models\\Menu'),(8,'en','758cf01d05a1523112cc8a2af3990820',2,'Botble\\Menu\\Models\\Menu'),(9,'en','13e3db3b6cf39d735f3a43b64bc7dc01',1,'Botble\\Menu\\Models\\Menu'),(10,'en','9eddf1f89a41d6aaefdd16fe42606bdd',1,'Botble\\Menu\\Models\\MenuLocation'),(11,'en','861dc795494c30f609bb94a942ded72a',2,'Botble\\Menu\\Models\\MenuLocation'),(12,'en','7823a88d5f481ddb482f87e0f35effe6',3,'Botble\\Menu\\Models\\MenuLocation'),(13,'vi','9eddf1f89a41d6aaefdd16fe42606bdd',4,'Botble\\Menu\\Models\\MenuLocation'),(14,'vi','13e3db3b6cf39d735f3a43b64bc7dc01',4,'Botble\\Menu\\Models\\Menu'),(15,'vi','861dc795494c30f609bb94a942ded72a',5,'Botble\\Menu\\Models\\MenuLocation'),(16,'vi','758cf01d05a1523112cc8a2af3990820',5,'Botble\\Menu\\Models\\Menu'),(17,'vi','7823a88d5f481ddb482f87e0f35effe6',6,'Botble\\Menu\\Models\\MenuLocation'),(18,'vi','0f92f92ae3aa3fb00f327faccdc9f11f',6,'Botble\\Menu\\Models\\Menu'),(19,'ar','9eddf1f89a41d6aaefdd16fe42606bdd',7,'Botble\\Menu\\Models\\MenuLocation'),(20,'ar','13e3db3b6cf39d735f3a43b64bc7dc01',7,'Botble\\Menu\\Models\\Menu'),(21,'ar','861dc795494c30f609bb94a942ded72a',8,'Botble\\Menu\\Models\\MenuLocation'),(22,'ar','758cf01d05a1523112cc8a2af3990820',8,'Botble\\Menu\\Models\\Menu'),(23,'ar','7823a88d5f481ddb482f87e0f35effe6',9,'Botble\\Menu\\Models\\MenuLocation'),(24,'ar','0f92f92ae3aa3fb00f327faccdc9f11f',9,'Botble\\Menu\\Models\\Menu'),(25,'fr','9eddf1f89a41d6aaefdd16fe42606bdd',10,'Botble\\Menu\\Models\\MenuLocation'),(26,'fr','13e3db3b6cf39d735f3a43b64bc7dc01',10,'Botble\\Menu\\Models\\Menu'),(27,'fr','861dc795494c30f609bb94a942ded72a',11,'Botble\\Menu\\Models\\MenuLocation'),(28,'fr','758cf01d05a1523112cc8a2af3990820',11,'Botble\\Menu\\Models\\Menu'),(29,'fr','7823a88d5f481ddb482f87e0f35effe6',12,'Botble\\Menu\\Models\\MenuLocation'),(30,'fr','0f92f92ae3aa3fb00f327faccdc9f11f',12,'Botble\\Menu\\Models\\Menu'),(31,'id','9eddf1f89a41d6aaefdd16fe42606bdd',13,'Botble\\Menu\\Models\\MenuLocation'),(32,'id','13e3db3b6cf39d735f3a43b64bc7dc01',13,'Botble\\Menu\\Models\\Menu'),(33,'id','861dc795494c30f609bb94a942ded72a',14,'Botble\\Menu\\Models\\MenuLocation'),(34,'id','758cf01d05a1523112cc8a2af3990820',14,'Botble\\Menu\\Models\\Menu'),(35,'id','7823a88d5f481ddb482f87e0f35effe6',15,'Botble\\Menu\\Models\\MenuLocation'),(36,'id','0f92f92ae3aa3fb00f327faccdc9f11f',15,'Botble\\Menu\\Models\\Menu'),(37,'tr','9eddf1f89a41d6aaefdd16fe42606bdd',16,'Botble\\Menu\\Models\\MenuLocation'),(38,'tr','13e3db3b6cf39d735f3a43b64bc7dc01',16,'Botble\\Menu\\Models\\Menu'),(39,'tr','861dc795494c30f609bb94a942ded72a',17,'Botble\\Menu\\Models\\MenuLocation'),(40,'tr','758cf01d05a1523112cc8a2af3990820',17,'Botble\\Menu\\Models\\Menu'),(41,'tr','7823a88d5f481ddb482f87e0f35effe6',18,'Botble\\Menu\\Models\\MenuLocation'),(42,'tr','0f92f92ae3aa3fb00f327faccdc9f11f',18,'Botble\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_locale_index` (`lang_locale`),
  KEY `lang_code_index` (`lang_code`),
  KEY `lang_is_default_index` (`lang_is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en','us',1,0,0),(2,'Tiếng Việt','vi','vi','vn',0,1,0),(3,'العربية','ar','ar','sa',0,2,1),(4,'Français','fr','fr','fr',0,3,0),(5,'Bahasa Indonesia','id','id','id',0,4,0),(6,'Türkçe','tr','tr','tr',0,5,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `visibility` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`),
  KEY `media_files_folder_deleted_name` (`folder_id`,`deleted_at`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'cod','cod',1,'image/png',12121,'payments/cod-3.png','[]','2026-05-28 18:59:05','2026-05-28 18:59:05',NULL,'public'),(2,0,'bank-transfer','bank-transfer',1,'image/png',29089,'payments/bank-transfer-3.png','[]','2026-05-28 18:59:05','2026-05-28 18:59:05',NULL,'public'),(3,0,'stripe','stripe',1,'image/webp',7516,'payments/stripe-3.webp','[]','2026-05-28 18:59:05','2026-05-28 18:59:05',NULL,'public'),(4,0,'paypal','paypal',1,'image/png',3001,'payments/paypal-3.png','[]','2026-05-28 18:59:06','2026-05-28 18:59:06',NULL,'public'),(5,0,'mollie','mollie',1,'image/png',8968,'payments/mollie-3.png','[]','2026-05-28 18:59:06','2026-05-28 18:59:06',NULL,'public'),(6,0,'paystack','paystack',1,'image/png',31015,'payments/paystack-3.png','[]','2026-05-28 18:59:06','2026-05-28 18:59:06',NULL,'public'),(7,0,'razorpay','razorpay',1,'image/png',8489,'payments/razorpay-3.png','[]','2026-05-28 18:59:06','2026-05-28 18:59:06',NULL,'public'),(8,0,'sslcommerz','sslcommerz',1,'image/png',3482,'payments/sslcommerz-3.png','[]','2026-05-28 18:59:07','2026-05-28 18:59:07',NULL,'public'),(9,0,'slider-7','slider-7',2,'image/jpeg',27496,'slider/slider-7.jpg','[]','2026-05-28 18:59:08','2026-05-28 18:59:08',NULL,'public'),(10,0,'graphic-item','graphic-item',3,'image/png',15283,'item/graphic-item.png','[]','2026-05-28 18:59:08','2026-05-28 18:59:08',NULL,'public'),(11,0,'slider-8','slider-8',2,'image/jpeg',27496,'slider/slider-8.jpg','[]','2026-05-28 18:59:09','2026-05-28 18:59:09',NULL,'public'),(12,0,'slider-9','slider-9',2,'image/jpeg',27496,'slider/slider-9.jpg','[]','2026-05-28 18:59:09','2026-05-28 18:59:09',NULL,'public'),(13,0,'blog-16','blog-16',4,'image/jpeg',15306,'blog/blog-16.jpg','[]','2026-05-28 18:59:09','2026-05-28 18:59:09',NULL,'public'),(14,0,'blog-17','blog-17',4,'image/jpeg',15306,'blog/blog-17.jpg','[]','2026-05-28 18:59:09','2026-05-28 18:59:09',NULL,'public'),(15,0,'blog-18','blog-18',4,'image/jpeg',15306,'blog/blog-18.jpg','[]','2026-05-28 18:59:09','2026-05-28 18:59:09',NULL,'public'),(16,0,'cate-16','cate-16',5,'image/jpeg',10421,'categories/cate-16.jpg','[]','2026-05-28 18:59:10','2026-05-28 18:59:10',NULL,'public'),(17,0,'cate-17','cate-17',5,'image/jpeg',10421,'categories/cate-17.jpg','[]','2026-05-28 18:59:10','2026-05-28 18:59:10',NULL,'public'),(18,0,'cate-18','cate-18',5,'image/jpeg',10421,'categories/cate-18.jpg','[]','2026-05-28 18:59:10','2026-05-28 18:59:10',NULL,'public'),(19,0,'cate-19','cate-19',5,'image/jpeg',10421,'categories/cate-19.jpg','[]','2026-05-28 18:59:10','2026-05-28 18:59:10',NULL,'public'),(20,0,'cate-20','cate-20',5,'image/jpeg',10421,'categories/cate-20.jpg','[]','2026-05-28 18:59:11','2026-05-28 18:59:11',NULL,'public'),(21,0,'product-1','product-1',7,'image/jpeg',21916,'products/baby/product-1.jpg','[]','2026-05-28 18:59:11','2026-05-28 18:59:11',NULL,'public'),(22,0,'product-2','product-2',7,'image/jpeg',21916,'products/baby/product-2.jpg','[]','2026-05-28 18:59:11','2026-05-28 18:59:11',NULL,'public'),(23,0,'product-3','product-3',7,'image/jpeg',21916,'products/baby/product-3.jpg','[]','2026-05-28 18:59:11','2026-05-28 18:59:11',NULL,'public'),(24,0,'product-4','product-4',7,'image/jpeg',21916,'products/baby/product-4.jpg','[]','2026-05-28 18:59:12','2026-05-28 18:59:12',NULL,'public'),(25,0,'product-5','product-5',7,'image/jpeg',21916,'products/baby/product-5.jpg','[]','2026-05-28 18:59:12','2026-05-28 18:59:12',NULL,'public'),(26,0,'product-6','product-6',7,'image/jpeg',21916,'products/baby/product-6.jpg','[]','2026-05-28 18:59:12','2026-05-28 18:59:12',NULL,'public'),(27,0,'product-7','product-7',7,'image/jpeg',21916,'products/baby/product-7.jpg','[]','2026-05-28 18:59:12','2026-05-28 18:59:12',NULL,'public'),(28,0,'product-8','product-8',7,'image/jpeg',21916,'products/baby/product-8.jpg','[]','2026-05-28 18:59:12','2026-05-28 18:59:12',NULL,'public'),(29,0,'product-9','product-9',7,'image/jpeg',21916,'products/baby/product-9.jpg','[]','2026-05-28 18:59:13','2026-05-28 18:59:13',NULL,'public'),(30,0,'product-10','product-10',7,'image/jpeg',21916,'products/baby/product-10.jpg','[]','2026-05-28 18:59:13','2026-05-28 18:59:13',NULL,'public'),(31,0,'tes-1','tes-1',8,'image/jpeg',3439,'testimonials/tes-1.jpg','[]','2026-05-28 18:59:20','2026-05-28 18:59:20',NULL,'public'),(32,0,'tes-2','tes-2',8,'image/jpeg',3439,'testimonials/tes-2.jpg','[]','2026-05-28 18:59:20','2026-05-28 18:59:20',NULL,'public'),(33,0,'member-1','member-1',9,'image/jpeg',3439,'member/member-1.jpg','[]','2026-05-28 18:59:20','2026-05-28 18:59:20',NULL,'public'),(34,0,'member-2','member-2',9,'image/jpeg',3439,'member/member-2.jpg','[]','2026-05-28 18:59:20','2026-05-28 18:59:20',NULL,'public'),(35,0,'member-3','member-3',9,'image/jpeg',3439,'member/member-3.jpg','[]','2026-05-28 18:59:20','2026-05-28 18:59:20',NULL,'public'),(36,0,'member-4','member-4',9,'image/jpeg',3439,'member/member-4.jpg','[]','2026-05-28 18:59:20','2026-05-28 18:59:20',NULL,'public'),(37,0,'s-contact-1','s-contact-1',10,'image/jpeg',41514,'section/s-contact-1.jpg','[]','2026-05-28 18:59:20','2026-05-28 18:59:20',NULL,'public'),(38,0,'s-contact-2','s-contact-2',10,'image/jpeg',16643,'section/s-contact-2.jpg','[]','2026-05-28 18:59:20','2026-05-28 18:59:20',NULL,'public'),(39,0,'banner-12','banner-12',10,'image/jpeg',22623,'section/banner-12.jpg','[]','2026-05-28 18:59:20','2026-05-28 18:59:20',NULL,'public'),(40,0,'policy-1','policy-1',10,'image/jpeg',13641,'section/policy-1.jpg','[]','2026-05-28 18:59:20','2026-05-28 18:59:20',NULL,'public'),(41,0,'policy-2','policy-2',10,'image/jpeg',13641,'section/policy-2.jpg','[]','2026-05-28 18:59:20','2026-05-28 18:59:20',NULL,'public'),(42,0,'policy-3','policy-3',10,'image/jpeg',13641,'section/policy-3.jpg','[]','2026-05-28 18:59:21','2026-05-28 18:59:21',NULL,'public'),(43,0,'policy-4','policy-4',10,'image/jpeg',13641,'section/policy-4.jpg','[]','2026-05-28 18:59:21','2026-05-28 18:59:21',NULL,'public'),(44,0,'banner-19','banner-19',10,'image/jpeg',13792,'section/banner-19.jpg','[]','2026-05-28 18:59:21','2026-05-28 18:59:21',NULL,'public'),(45,0,'banner-20','banner-20',10,'image/jpeg',13792,'section/banner-20.jpg','[]','2026-05-28 18:59:21','2026-05-28 18:59:21',NULL,'public'),(46,0,'banner-21','banner-21',10,'image/jpeg',29374,'section/banner-21.jpg','[]','2026-05-28 18:59:21','2026-05-28 18:59:21',NULL,'public'),(47,0,'banner-lookbook-6','banner-lookbook-6',10,'image/jpeg',36245,'section/banner-lookbook-6.jpg','[]','2026-05-28 18:59:22','2026-05-28 18:59:22',NULL,'public'),(48,0,'banner-lookbook-7','banner-lookbook-7',10,'image/jpeg',36245,'section/banner-lookbook-7.jpg','[]','2026-05-28 18:59:22','2026-05-28 18:59:22',NULL,'public'),(49,0,'gallery-17','gallery-17',11,'image/jpeg',21916,'gallery/gallery-17.jpg','[]','2026-05-28 18:59:22','2026-05-28 18:59:22',NULL,'public'),(50,0,'gallery-18','gallery-18',11,'image/jpeg',21916,'gallery/gallery-18.jpg','[]','2026-05-28 18:59:22','2026-05-28 18:59:22',NULL,'public'),(51,0,'gallery-19','gallery-19',11,'image/jpeg',21916,'gallery/gallery-19.jpg','[]','2026-05-28 18:59:23','2026-05-28 18:59:23',NULL,'public'),(52,0,'gallery-20','gallery-20',11,'image/jpeg',21916,'gallery/gallery-20.jpg','[]','2026-05-28 18:59:23','2026-05-28 18:59:23',NULL,'public'),(53,0,'gallery-21','gallery-21',11,'image/jpeg',21916,'gallery/gallery-21.jpg','[]','2026-05-28 18:59:23','2026-05-28 18:59:23',NULL,'public');
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folder_permissions`
--

DROP TABLE IF EXISTS `media_folder_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folder_permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `folder_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `permission` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'view',
  `granted_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_folder_permissions_folder_id_user_id_unique` (`folder_id`,`user_id`),
  KEY `media_folder_permissions_folder_id_index` (`folder_id`),
  KEY `media_folder_permissions_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folder_permissions`
--

LOCK TABLES `media_folder_permissions` WRITE;
/*!40000 ALTER TABLE `media_folder_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_folder_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'payments',NULL,'payments',0,'2026-05-28 18:59:05','2026-05-28 18:59:05',NULL),(2,0,'slider',NULL,'slider',0,'2026-05-28 18:59:08','2026-05-28 18:59:08',NULL),(3,0,'item',NULL,'item',0,'2026-05-28 18:59:08','2026-05-28 18:59:08',NULL),(4,0,'blog',NULL,'blog',0,'2026-05-28 18:59:09','2026-05-28 18:59:09',NULL),(5,0,'categories',NULL,'categories',0,'2026-05-28 18:59:10','2026-05-28 18:59:10',NULL),(6,0,'products',NULL,'products',0,'2026-05-28 18:59:11','2026-05-28 18:59:11',NULL),(7,0,'baby',NULL,'baby',6,'2026-05-28 18:59:11','2026-05-28 18:59:11',NULL),(8,0,'testimonials',NULL,'testimonials',0,'2026-05-28 18:59:20','2026-05-28 18:59:20',NULL),(9,0,'member',NULL,'member',0,'2026-05-28 18:59:20','2026-05-28 18:59:20',NULL),(10,0,'section',NULL,'section',0,'2026-05-28 18:59:20','2026-05-28 18:59:20',NULL),(11,0,'gallery',NULL,'gallery',0,'2026-05-28 18:59:22','2026-05-28 18:59:22',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2026-05-28 18:59:08','2026-05-28 18:59:08'),(2,2,'footer-menu-1','2026-05-28 18:59:08','2026-05-28 18:59:08'),(3,3,'footer-menu-2','2026-05-28 18:59:08','2026-05-28 18:59:08'),(4,4,'main-menu','2026-05-28 18:59:23','2026-05-28 18:59:23'),(5,5,'footer-menu-1','2026-05-28 18:59:23','2026-05-28 18:59:23'),(6,6,'footer-menu-2','2026-05-28 18:59:23','2026-05-28 18:59:23'),(7,7,'main-menu','2026-05-28 18:59:23','2026-05-28 18:59:23'),(8,8,'footer-menu-1','2026-05-28 18:59:23','2026-05-28 18:59:23'),(9,9,'footer-menu-2','2026-05-28 18:59:23','2026-05-28 18:59:23'),(10,10,'main-menu','2026-05-28 18:59:23','2026-05-28 18:59:23'),(11,11,'footer-menu-1','2026-05-28 18:59:23','2026-05-28 18:59:23'),(12,12,'footer-menu-2','2026-05-28 18:59:24','2026-05-28 18:59:24'),(13,13,'main-menu','2026-05-28 18:59:24','2026-05-28 18:59:24'),(14,14,'footer-menu-1','2026-05-28 18:59:24','2026-05-28 18:59:24'),(15,15,'footer-menu-2','2026-05-28 18:59:24','2026-05-28 18:59:24'),(16,16,'main-menu','2026-05-28 18:59:24','2026-05-28 18:59:24'),(17,17,'footer-menu-1','2026-05-28 18:59:24','2026-05-28 18:59:24'),(18,18,'footer-menu-2','2026-05-28 18:59:24','2026-05-28 18:59:24');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'https://amerce.botble.com',NULL,0,'Home','has-mega-menu','_self',1,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(2,1,1,NULL,NULL,'https://amerce.botble.com',NULL,0,'Main Demo',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(3,1,1,NULL,NULL,'https://amerce-mental.botble.com',NULL,1,'Home Mental',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(4,1,1,NULL,NULL,'https://amerce-electronics.botble.com',NULL,2,'Home Electronics',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(5,1,1,NULL,NULL,'https://amerce-pod.botble.com',NULL,3,'Home POD',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(6,1,1,NULL,NULL,'https://amerce-pet-care.botble.com',NULL,4,'Home Pet Care',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(7,1,1,NULL,NULL,'https://amerce-baby.botble.com',NULL,5,'Home Baby',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(8,1,1,NULL,NULL,'https://amerce-auto.botble.com',NULL,6,'Home Auto',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(9,1,1,NULL,NULL,'https://amerce-decor.botble.com',NULL,7,'Home Decor',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(10,1,1,NULL,NULL,'https://amerce-cosmetic.botble.com',NULL,8,'Home Cosmetic',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(11,1,1,NULL,NULL,'https://amerce-organic.botble.com',NULL,9,'Home Organic',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(12,1,1,NULL,NULL,'https://amerce-fashion.botble.com',NULL,10,'Home Fashion',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(13,1,1,NULL,NULL,'https://amerce-headphone.botble.com',NULL,11,'Home Headphone',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(14,1,1,NULL,NULL,'https://amerce-jewelry.botble.com',NULL,12,'Home Jewelry',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(15,1,1,NULL,NULL,'https://amerce-garden.botble.com',NULL,13,'Home Garden',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(16,1,1,NULL,NULL,'https://amerce-construct.botble.com',NULL,14,'Home Construct',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(17,1,1,NULL,NULL,'https://amerce-furniture.botble.com',NULL,15,'Home Furniture',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(18,1,1,NULL,NULL,'https://amerce-fashion-2.botble.com',NULL,16,'Home Fashion 2',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(19,1,1,NULL,NULL,'https://amerce-bag.botble.com',NULL,17,'Home Bag',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(20,1,1,NULL,NULL,'https://amerce-sport.botble.com',NULL,18,'Home Sport',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(21,1,1,NULL,NULL,'https://amerce-office.botble.com',NULL,19,'Home Office',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(22,1,1,NULL,NULL,'https://amerce-sneaker.botble.com',NULL,20,'Home Sneaker',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(23,1,0,NULL,NULL,'/products',NULL,1,'Shop','has-mega-menu','_self',1,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(24,1,23,NULL,NULL,'#',NULL,0,'Shop Layout',NULL,'_self',1,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(25,1,24,NULL,NULL,'/products',NULL,0,'Default',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(26,1,24,NULL,NULL,'/products?layout=left-sidebar',NULL,1,'Left Sidebar',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(27,1,24,NULL,NULL,'/products?layout=right-sidebar',NULL,2,'Right Sidebar',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(28,1,24,NULL,NULL,'/products?layout=full-width',NULL,3,'Full Width',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(29,1,24,NULL,NULL,'/products?layout=sub-collection',NULL,4,'Sub Collection',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(30,1,24,NULL,NULL,'/collections',NULL,5,'Collection List',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(31,1,23,NULL,NULL,'#',NULL,1,'View Style',NULL,'_self',1,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(32,1,31,NULL,NULL,'/products',NULL,0,'Default',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(33,1,31,NULL,NULL,'/products?layout=grid',NULL,1,'Grid View',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(34,1,31,NULL,NULL,'/products?layout=list',NULL,2,'List View',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(35,1,23,NULL,NULL,'#',NULL,2,'Browse',NULL,'_self',1,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(36,1,35,NULL,NULL,'/products',NULL,0,'All Products',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(37,1,35,NULL,NULL,'/products?source=latest',NULL,1,'New Arrivals',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(38,1,35,NULL,NULL,'/products?sort=best-seller',NULL,2,'Best Sellers',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(39,1,35,NULL,NULL,'/products?source=featured',NULL,3,'Featured',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(40,1,35,NULL,NULL,'/products?on_sale=1',NULL,4,'On Sale',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(41,1,0,NULL,NULL,'/products',NULL,2,'Product','has-mega-menu','_self',1,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(42,1,41,NULL,NULL,'#',NULL,0,'Product Layout',NULL,'_self',1,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(43,1,42,NULL,NULL,'/products',NULL,0,'Default',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(44,1,42,NULL,NULL,'/products?layout=right-thumbnail',NULL,1,'Right Thumbnail',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(45,1,42,NULL,NULL,'/products?layout=bottom-thumbnail',NULL,2,'Bottom Thumbnail',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(46,1,42,NULL,NULL,'/products?layout=grid',NULL,3,'Product Grid',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(47,1,42,NULL,NULL,'/products?layout=grid-2',NULL,4,'Product Grid 2',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(48,1,42,NULL,NULL,'/products?layout=stacked',NULL,5,'Product Stacked',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(49,1,42,NULL,NULL,'/products?layout=description-accordion',NULL,6,'Description Accordion',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(50,1,0,NULL,NULL,'/blog',NULL,3,'Blog',NULL,'_self',1,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(51,1,50,NULL,NULL,'/blog',NULL,0,'Blog',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(52,1,50,NULL,NULL,'/blog',NULL,1,'Blog Single',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(53,1,0,NULL,NULL,'/about',NULL,4,'Pages',NULL,'_self',1,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(54,1,53,NULL,NULL,'/about',NULL,0,'About Us',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(55,1,53,NULL,NULL,'/contact',NULL,1,'Contact Us',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(56,1,53,NULL,NULL,'/our-stores',NULL,2,'Our Store',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(57,1,53,NULL,NULL,'/orders/tracking',NULL,3,'Invoice',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(58,1,53,NULL,NULL,'/page-not-found',NULL,4,'404',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(59,1,53,NULL,NULL,'/compare',NULL,5,'Compare',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(60,1,53,NULL,NULL,'/customer/overview',NULL,6,'My Account',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(61,2,0,NULL,NULL,'/shipping',NULL,0,'Shipping',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(62,2,0,NULL,NULL,'/returns-refunds',NULL,1,'Return & Refund',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(63,2,0,NULL,NULL,'/privacy-policy',NULL,2,'Privacy Policy',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(64,2,0,NULL,NULL,'/terms-of-service',NULL,3,'Terms & Conditions',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(65,2,0,NULL,NULL,'/faq',NULL,4,'Orders FAQs',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(66,3,0,NULL,NULL,'/about',NULL,0,'About Us',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(67,3,0,NULL,NULL,'/our-stores',NULL,1,'Our Stories',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(68,3,0,NULL,NULL,'/contact',NULL,2,'Contact us',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(69,3,0,NULL,NULL,'/blog',NULL,3,'Latest New',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(70,3,0,NULL,NULL,'/customer/overview',NULL,4,'My Account',NULL,'_self',0,'2026-05-28 18:59:08','2026-05-28 18:59:08'),(71,4,0,NULL,NULL,'/',NULL,0,'Trang chủ',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(72,4,0,NULL,NULL,'/products',NULL,1,'Mua sắm',NULL,'_self',1,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(73,4,72,NULL,NULL,'/products?source=latest',NULL,0,'Hàng mới về',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(74,4,72,NULL,NULL,'/products?sort=best-seller',NULL,1,'Bán chạy nhất',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(75,4,72,NULL,NULL,'/products?on_sale=1',NULL,2,'Giảm giá',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(76,4,72,NULL,NULL,'/products',NULL,3,'Tất cả sản phẩm',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(77,4,0,NULL,NULL,'/products',NULL,2,'Danh mục',NULL,'_self',1,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(78,4,77,NULL,NULL,'/product-categories/outerwear',NULL,0,'Áo khoác',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(79,4,77,NULL,NULL,'/product-categories/tops-shirts',NULL,1,'Áo & Sơ mi',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(80,4,77,NULL,NULL,'/product-categories/bottoms',NULL,2,'Quần & Váy',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(81,4,77,NULL,NULL,'/product-categories/dresses',NULL,3,'Đầm',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(82,4,77,NULL,NULL,'/product-categories/footwear',NULL,4,'Giày dép',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(83,4,77,NULL,NULL,'/product-categories/accessories',NULL,5,'Phụ kiện',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(84,4,0,NULL,NULL,'/brands',NULL,3,'Thương hiệu',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(85,4,0,NULL,NULL,'/blog',NULL,4,'Tạp chí',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(86,4,0,NULL,NULL,'/about',NULL,5,'Giới thiệu',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(87,4,0,NULL,NULL,'/contact',NULL,6,'Liên hệ',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(88,5,0,NULL,NULL,'/contact',NULL,0,'Liên hệ với chúng tôi',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(89,5,0,NULL,NULL,'/faq',NULL,1,'Câu hỏi thường gặp',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(90,5,0,NULL,NULL,'/shipping',NULL,2,'Vận chuyển',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(91,5,0,NULL,NULL,'/returns-refunds',NULL,3,'Đổi trả & Hoàn tiền',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(92,5,0,NULL,NULL,'/customer/orders',NULL,4,'Theo dõi đơn hàng',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(93,6,0,NULL,NULL,'/about',NULL,0,'Giới thiệu',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(94,6,0,NULL,NULL,'/our-stores',NULL,1,'Cửa hàng',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(95,6,0,NULL,NULL,'/sustainability',NULL,2,'Phát triển bền vững',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(96,6,0,NULL,NULL,'/careers',NULL,3,'Tuyển dụng',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(97,6,0,NULL,NULL,'/privacy-policy',NULL,4,'Chính sách bảo mật',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(98,6,0,NULL,NULL,'/terms-conditions',NULL,5,'Điều khoản & Điều kiện',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(99,7,0,NULL,NULL,'/',NULL,0,'الصفحة الرئيسية',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(100,7,0,NULL,NULL,'/products',NULL,1,'التسوق',NULL,'_self',1,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(101,7,100,NULL,NULL,'/products?source=latest',NULL,0,'الوافدون الجدد',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(102,7,100,NULL,NULL,'/products?sort=best-seller',NULL,1,'الأكثر مبيعًا',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(103,7,100,NULL,NULL,'/products?on_sale=1',NULL,2,'تخفيض',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(104,7,100,NULL,NULL,'/products',NULL,3,'جميع المنتجات',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(105,7,0,NULL,NULL,'/products',NULL,2,'فئة',NULL,'_self',1,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(106,7,105,NULL,NULL,'/product-categories/outerwear',NULL,0,'سترة',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(107,7,105,NULL,NULL,'/product-categories/tops-shirts',NULL,1,'قميص',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(108,7,105,NULL,NULL,'/product-categories/bottoms',NULL,2,'السراويل والتنانير',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(109,7,105,NULL,NULL,'/product-categories/dresses',NULL,3,'فستان',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(110,7,105,NULL,NULL,'/product-categories/footwear',NULL,4,'أحذية',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(111,7,105,NULL,NULL,'/product-categories/accessories',NULL,5,'ملحق',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(112,7,0,NULL,NULL,'/brands',NULL,3,'علامة تجارية',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(113,7,0,NULL,NULL,'/blog',NULL,4,'مجلة',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(114,7,0,NULL,NULL,'/about',NULL,5,'يقدم',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(115,7,0,NULL,NULL,'/contact',NULL,6,'اتصال',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(116,8,0,NULL,NULL,'/contact',NULL,0,'اتصل بنا',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(117,8,0,NULL,NULL,'/faq',NULL,1,'الأسئلة المتداولة',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(118,8,0,NULL,NULL,'/shipping',NULL,2,'ينقل',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(119,8,0,NULL,NULL,'/returns-refunds',NULL,3,'العوائد والمبالغ المستردة',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(120,8,0,NULL,NULL,'/customer/orders',NULL,4,'تتبع الطلب',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(121,9,0,NULL,NULL,'/about',NULL,0,'يقدم',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(122,9,0,NULL,NULL,'/our-stores',NULL,1,'محل',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(123,9,0,NULL,NULL,'/sustainability',NULL,2,'التنمية المستدامة',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(124,9,0,NULL,NULL,'/careers',NULL,3,'توظيف',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(125,9,0,NULL,NULL,'/privacy-policy',NULL,4,'سياسة الخصوصية',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(126,9,0,NULL,NULL,'/terms-conditions',NULL,5,'الشروط والأحكام',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(127,10,0,NULL,NULL,'/',NULL,0,'Page d\'accueil',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(128,10,0,NULL,NULL,'/products',NULL,1,'Achats',NULL,'_self',1,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(129,10,128,NULL,NULL,'/products?source=latest',NULL,0,'Nouveautés',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(130,10,128,NULL,NULL,'/products?sort=best-seller',NULL,1,'Meilleur vendeur',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(131,10,128,NULL,NULL,'/products?on_sale=1',NULL,2,'Rabais',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(132,10,128,NULL,NULL,'/products',NULL,3,'Tous les produits',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(133,10,0,NULL,NULL,'/products',NULL,2,'Catégorie',NULL,'_self',1,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(134,10,133,NULL,NULL,'/product-categories/outerwear',NULL,0,'Veste',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(135,10,133,NULL,NULL,'/product-categories/tops-shirts',NULL,1,'Chemise',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(136,10,133,NULL,NULL,'/product-categories/bottoms',NULL,2,'Pantalons et jupes',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(137,10,133,NULL,NULL,'/product-categories/dresses',NULL,3,'Robe',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(138,10,133,NULL,NULL,'/product-categories/footwear',NULL,4,'Chaussures',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(139,10,133,NULL,NULL,'/product-categories/accessories',NULL,5,'Accessoire',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(140,10,0,NULL,NULL,'/brands',NULL,3,'Marque déposée',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(141,10,0,NULL,NULL,'/blog',NULL,4,'Revue',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(142,10,0,NULL,NULL,'/about',NULL,5,'Introduire',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(143,10,0,NULL,NULL,'/contact',NULL,6,'Contact',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(144,11,0,NULL,NULL,'/contact',NULL,0,'Contactez-nous',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(145,11,0,NULL,NULL,'/faq',NULL,1,'Questions fréquemment posées',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(146,11,0,NULL,NULL,'/shipping',NULL,2,'Transport',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(147,11,0,NULL,NULL,'/returns-refunds',NULL,3,'Retours et remboursements',NULL,'_self',0,'2026-05-28 18:59:23','2026-05-28 18:59:23'),(148,11,0,NULL,NULL,'/customer/orders',NULL,4,'Suivi des commandes',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(149,12,0,NULL,NULL,'/about',NULL,0,'Introduire',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(150,12,0,NULL,NULL,'/our-stores',NULL,1,'Boutique',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(151,12,0,NULL,NULL,'/sustainability',NULL,2,'Développement durable',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(152,12,0,NULL,NULL,'/careers',NULL,3,'Recrutement',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(153,12,0,NULL,NULL,'/privacy-policy',NULL,4,'Politique de confidentialité',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(154,12,0,NULL,NULL,'/terms-conditions',NULL,5,'Conditions générales',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(155,13,0,NULL,NULL,'/',NULL,0,'Halaman rumah',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(156,13,0,NULL,NULL,'/products',NULL,1,'Belanja',NULL,'_self',1,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(157,13,156,NULL,NULL,'/products?source=latest',NULL,0,'Pendatang baru',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(158,13,156,NULL,NULL,'/products?sort=best-seller',NULL,1,'Penjual terbaik',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(159,13,156,NULL,NULL,'/products?on_sale=1',NULL,2,'Diskon',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(160,13,156,NULL,NULL,'/products',NULL,3,'Semua produk',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(161,13,0,NULL,NULL,'/products',NULL,2,'Kategori',NULL,'_self',1,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(162,13,161,NULL,NULL,'/product-categories/outerwear',NULL,0,'Jaket',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(163,13,161,NULL,NULL,'/product-categories/tops-shirts',NULL,1,'Kemeja',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(164,13,161,NULL,NULL,'/product-categories/bottoms',NULL,2,'Celana & Rok',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(165,13,161,NULL,NULL,'/product-categories/dresses',NULL,3,'Gaun',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(166,13,161,NULL,NULL,'/product-categories/footwear',NULL,4,'Sepatu',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(167,13,161,NULL,NULL,'/product-categories/accessories',NULL,5,'Aksesori',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(168,13,0,NULL,NULL,'/brands',NULL,3,'Merek dagang',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(169,13,0,NULL,NULL,'/blog',NULL,4,'Majalah',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(170,13,0,NULL,NULL,'/about',NULL,5,'Memperkenalkan',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(171,13,0,NULL,NULL,'/contact',NULL,6,'Kontak',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(172,14,0,NULL,NULL,'/contact',NULL,0,'Hubungi kami',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(173,14,0,NULL,NULL,'/faq',NULL,1,'Pertanyaan yang sering diajukan',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(174,14,0,NULL,NULL,'/shipping',NULL,2,'Mengangkut',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(175,14,0,NULL,NULL,'/returns-refunds',NULL,3,'Pengembalian & Pengembalian Dana',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(176,14,0,NULL,NULL,'/customer/orders',NULL,4,'Pelacakan pesanan',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(177,15,0,NULL,NULL,'/about',NULL,0,'Memperkenalkan',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(178,15,0,NULL,NULL,'/our-stores',NULL,1,'Toko',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(179,15,0,NULL,NULL,'/sustainability',NULL,2,'Pembangunan berkelanjutan',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(180,15,0,NULL,NULL,'/careers',NULL,3,'Rekrutmen',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(181,15,0,NULL,NULL,'/privacy-policy',NULL,4,'Kebijakan privasi',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(182,15,0,NULL,NULL,'/terms-conditions',NULL,5,'Syarat & Ketentuan',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(183,16,0,NULL,NULL,'/',NULL,0,'Ana sayfa',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(184,16,0,NULL,NULL,'/products',NULL,1,'Alışveriş',NULL,'_self',1,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(185,16,184,NULL,NULL,'/products?source=latest',NULL,0,'Yeni gelenler',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(186,16,184,NULL,NULL,'/products?sort=best-seller',NULL,1,'En çok satan kitap',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(187,16,184,NULL,NULL,'/products?on_sale=1',NULL,2,'İndirim',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(188,16,184,NULL,NULL,'/products',NULL,3,'Tüm ürünler',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(189,16,0,NULL,NULL,'/products',NULL,2,'Kategori',NULL,'_self',1,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(190,16,189,NULL,NULL,'/product-categories/outerwear',NULL,0,'Ceket',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(191,16,189,NULL,NULL,'/product-categories/tops-shirts',NULL,1,'Gömlek',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(192,16,189,NULL,NULL,'/product-categories/bottoms',NULL,2,'Pantolon ve Etekler',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(193,16,189,NULL,NULL,'/product-categories/dresses',NULL,3,'Elbise',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(194,16,189,NULL,NULL,'/product-categories/footwear',NULL,4,'Ayakkabı',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(195,16,189,NULL,NULL,'/product-categories/accessories',NULL,5,'Aksesuar',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(196,16,0,NULL,NULL,'/brands',NULL,3,'Ticari marka',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(197,16,0,NULL,NULL,'/blog',NULL,4,'Dergi',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(198,16,0,NULL,NULL,'/about',NULL,5,'Tanıtmak',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(199,16,0,NULL,NULL,'/contact',NULL,6,'Temas etmek',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(200,17,0,NULL,NULL,'/contact',NULL,0,'Bize Ulaşın',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(201,17,0,NULL,NULL,'/faq',NULL,1,'Sık sorulan sorular',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(202,17,0,NULL,NULL,'/shipping',NULL,2,'Taşıma',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(203,17,0,NULL,NULL,'/returns-refunds',NULL,3,'İade ve Para İadeleri',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(204,17,0,NULL,NULL,'/customer/orders',NULL,4,'Sipariş takibi',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(205,18,0,NULL,NULL,'/about',NULL,0,'Tanıtmak',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(206,18,0,NULL,NULL,'/our-stores',NULL,1,'Mağaza',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(207,18,0,NULL,NULL,'/sustainability',NULL,2,'Sürdürülebilir kalkınma',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(208,18,0,NULL,NULL,'/careers',NULL,3,'işe alım',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(209,18,0,NULL,NULL,'/privacy-policy',NULL,4,'Gizlilik politikası',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24'),(210,18,0,NULL,NULL,'/terms-conditions',NULL,5,'Şartlar ve Koşullar',NULL,'_self',0,'2026-05-28 18:59:24','2026-05-28 18:59:24');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main Menu','main-menu','published','2026-05-28 18:59:08','2026-05-28 18:59:08'),(2,'Footer Help','footer-help','published','2026-05-28 18:59:08','2026-05-28 18:59:08'),(3,'Footer Company','footer-company','published','2026-05-28 18:59:08','2026-05-28 18:59:08'),(4,'Menu chính','main-menu-vi','published','2026-05-28 18:59:23','2026-05-28 18:59:23'),(5,'Hỗ trợ','footer-help-vi','published','2026-05-28 18:59:23','2026-05-28 18:59:23'),(6,'Công ty','footer-company-vi','published','2026-05-28 18:59:23','2026-05-28 18:59:23'),(7,'القائمة الرئيسية','main-menu-ar','published','2026-05-28 18:59:23','2026-05-28 18:59:23'),(8,'مساعدة التذييل','footer-help-ar','published','2026-05-28 18:59:23','2026-05-28 18:59:23'),(9,'شركة التذييل','footer-company-ar','published','2026-05-28 18:59:23','2026-05-28 18:59:23'),(10,'menu principal','main-menu-fr','published','2026-05-28 18:59:23','2026-05-28 18:59:23'),(11,'aide-pied de page','footer-help-fr','published','2026-05-28 18:59:23','2026-05-28 18:59:23'),(12,'société de pied de page','footer-company-fr','published','2026-05-28 18:59:24','2026-05-28 18:59:24'),(13,'menu utama','main-menu-id','published','2026-05-28 18:59:24','2026-05-28 18:59:24'),(14,'bantuan footer','footer-help-id','published','2026-05-28 18:59:24','2026-05-28 18:59:24'),(15,'perusahaan footer','footer-company-id','published','2026-05-28 18:59:24','2026-05-28 18:59:24'),(16,'ana menü','main-menu-tr','published','2026-05-28 18:59:24','2026-05-28 18:59:24'),(17,'alt bilgi yardımı','footer-help-tr','published','2026-05-28 18:59:24','2026-05-28 18:59:24'),(18,'alt bilgi şirketi','footer-company-tr','published','2026-05-28 18:59:24','2026-05-28 18:59:24');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`),
  KEY `meta_boxes_ref_idx` (`reference_id`,`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'subtitle','[\"SALE UP TO 50% OFF\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 18:59:09','2026-05-28 18:59:09'),(2,'button_label','[\"View All Products\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 18:59:09','2026-05-28 18:59:09'),(3,'alignment','[\"left\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 18:59:09','2026-05-28 18:59:09'),(4,'decor_image','[\"item\\/graphic-item.png\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 18:59:09','2026-05-28 18:59:09'),(5,'subtitle','[\"SALE UP TO 50% OFF\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 18:59:09','2026-05-28 18:59:09'),(6,'button_label','[\"View All Products\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 18:59:09','2026-05-28 18:59:09'),(7,'alignment','[\"left\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 18:59:09','2026-05-28 18:59:09'),(8,'decor_image','[\"item\\/graphic-item.png\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 18:59:09','2026-05-28 18:59:09'),(9,'subtitle','[\"SALE UP TO 50% OFF\"]',3,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 18:59:09','2026-05-28 18:59:09'),(10,'button_label','[\"View All Products\"]',3,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 18:59:09','2026-05-28 18:59:09'),(11,'alignment','[\"left\"]',3,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 18:59:09','2026-05-28 18:59:09'),(12,'decor_image','[\"item\\/graphic-item.png\"]',3,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 18:59:09','2026-05-28 18:59:09'),(13,'faq_ids','[[1,2,3,7,13]]',1,'Botble\\Ecommerce\\Models\\Product','2026-05-28 18:59:13','2026-05-28 18:59:13'),(14,'faq_ids','[[3,5,7,10,13]]',2,'Botble\\Ecommerce\\Models\\Product','2026-05-28 18:59:13','2026-05-28 18:59:13'),(15,'faq_ids','[[1,5,6,10,12]]',3,'Botble\\Ecommerce\\Models\\Product','2026-05-28 18:59:14','2026-05-28 18:59:14'),(16,'faq_ids','[[4,5,6,11,13]]',4,'Botble\\Ecommerce\\Models\\Product','2026-05-28 18:59:14','2026-05-28 18:59:14'),(17,'faq_ids','[[2,5,6,8,13]]',5,'Botble\\Ecommerce\\Models\\Product','2026-05-28 18:59:14','2026-05-28 18:59:14'),(18,'faq_ids','[[1,5,7,8,12]]',6,'Botble\\Ecommerce\\Models\\Product','2026-05-28 18:59:14','2026-05-28 18:59:14'),(19,'faq_ids','[[3,7,10,11,13]]',7,'Botble\\Ecommerce\\Models\\Product','2026-05-28 18:59:14','2026-05-28 18:59:14'),(20,'faq_ids','[[2,3,4,7,13]]',8,'Botble\\Ecommerce\\Models\\Product','2026-05-28 18:59:14','2026-05-28 18:59:14'),(21,'faq_ids','[[1,4,7,8,9]]',9,'Botble\\Ecommerce\\Models\\Product','2026-05-28 18:59:14','2026-05-28 18:59:14'),(22,'faq_ids','[[1,3,8,11,12]]',10,'Botble\\Ecommerce\\Models\\Product','2026-05-28 18:59:14','2026-05-28 18:59:14');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000001_create_cache_table',1),(2,'2013_04_09_032329_create_base_tables',1),(3,'2013_04_09_062329_create_revisions_table',1),(4,'2014_10_12_000000_create_users_table',1),(5,'2014_10_12_100000_create_password_reset_tokens_table',1),(6,'2015_06_18_033822_create_blog_table',1),(7,'2015_06_29_025744_create_audit_history',1),(8,'2016_05_28_112028_create_system_request_logs_table',1),(9,'2016_06_10_230148_create_acl_tables',1),(10,'2016_06_14_230857_create_menus_table',1),(11,'2016_06_17_091537_create_contacts_table',1),(12,'2016_06_28_221418_create_pages_table',1),(13,'2016_10_03_032336_create_languages_table',1),(14,'2016_10_05_074239_create_setting_table',1),(15,'2016_10_07_193005_create_translations_table',1),(16,'2016_10_13_150201_create_galleries_table',1),(17,'2016_11_28_032840_create_dashboard_widget_tables',1),(18,'2016_12_16_084601_create_widgets_table',1),(19,'2017_05_09_070343_create_media_tables',1),(20,'2017_05_18_080441_create_payment_tables',1),(21,'2017_07_11_140018_create_simple_slider_table',1),(22,'2017_10_24_154832_create_newsletter_table',1),(23,'2017_11_03_070450_create_slug_table',1),(24,'2018_07_09_214610_create_testimonial_table',1),(25,'2018_07_09_221238_create_faq_table',1),(26,'2019_01_05_053554_create_jobs_table',1),(27,'2019_08_19_000000_create_failed_jobs_table',1),(28,'2019_11_18_061011_create_country_table',1),(29,'2019_12_14_000001_create_personal_access_tokens_table',1),(30,'2020_03_05_041139_create_ecommerce_tables',1),(31,'2020_11_18_150916_ads_create_ads_table',1),(32,'2021_01_01_044147_ecommerce_create_flash_sale_table',1),(33,'2021_01_17_082713_add_column_is_featured_to_product_collections_table',1),(34,'2021_01_18_024333_add_zip_code_into_table_customer_addresses',1),(35,'2021_02_16_092633_remove_default_value_for_author_type',1),(36,'2021_02_18_073505_update_table_ec_reviews',1),(37,'2021_03_10_024419_add_column_confirmed_at_to_table_ec_customers',1),(38,'2021_03_10_025153_change_column_tax_amount',1),(39,'2021_03_20_033103_add_column_availability_to_table_ec_products',1),(40,'2021_03_27_144913_add_customer_type_into_table_payments',1),(41,'2021_04_28_074008_ecommerce_create_product_label_table',1),(42,'2021_05_24_034720_make_column_currency_nullable',1),(43,'2021_05_31_173037_ecommerce_create_ec_products_translations',1),(44,'2021_07_06_030002_create_marketplace_table',1),(45,'2021_08_09_161302_add_metadata_column_to_payments_table',1),(46,'2021_08_17_105016_remove_column_currency_id_in_some_tables',1),(47,'2021_08_30_142128_add_images_column_to_ec_reviews_table',1),(48,'2021_09_04_150137_add_vendor_verified_at_to_ec_customers_table',1),(49,'2021_10_04_030050_add_column_created_by_to_table_ec_products',1),(50,'2021_10_04_033903_add_column_approved_by_into_table_ec_products',1),(51,'2021_10_05_122616_add_status_column_to_ec_customers_table',1),(52,'2021_10_06_124943_add_transaction_id_column_to_mp_customer_withdrawals_table',1),(53,'2021_10_10_054216_add_columns_to_mp_customer_revenues_table',1),(54,'2021_10_19_020859_update_metadata_field',1),(55,'2021_10_25_021023_fix-priority-load-for-language-advanced',1),(56,'2021_11_03_025806_nullable_phone_number_in_ec_customer_addresses',1),(57,'2021_11_23_071403_correct_languages_for_product_variations',1),(58,'2021_11_28_031808_add_product_tags_translations',1),(59,'2021_12_01_031123_add_featured_image_to_ec_products',1),(60,'2021_12_02_035301_add_ads_translations_table',1),(61,'2021_12_03_030600_create_blog_translations',1),(62,'2021_12_03_075608_create_page_translations',1),(63,'2021_12_03_082134_create_faq_translations',1),(64,'2021_12_03_082953_create_gallery_translations',1),(65,'2021_12_03_083642_create_testimonials_translations',1),(66,'2021_12_03_084118_create_location_translations',1),(67,'2021_12_03_094518_migrate_old_location_data',1),(68,'2021_12_06_031304_update_table_mp_customer_revenues',1),(69,'2021_12_10_034440_switch_plugin_location_to_use_language_advanced',1),(70,'2022_01_01_033107_update_table_ec_shipments',1),(71,'2022_01_16_085908_improve_plugin_location',1),(72,'2022_02_16_042457_improve_product_attribute_sets',1),(73,'2022_03_22_075758_correct_product_name',1),(74,'2022_04_19_113334_add_index_to_ec_products',1),(75,'2022_04_19_113923_add_index_to_table_posts',1),(76,'2022_04_20_100851_add_index_to_media_table',1),(77,'2022_04_20_101046_add_index_to_menu_table',1),(78,'2022_04_28_144405_remove_unused_table',1),(79,'2022_04_30_034048_create_gallery_meta_translations_table',1),(80,'2022_05_05_115015_create_ec_customer_recently_viewed_products_table',1),(81,'2022_05_18_143720_add_index_to_table_ec_product_categories',1),(82,'2022_06_16_095633_add_index_to_some_tables',1),(83,'2022_06_28_151901_activate_paypal_stripe_plugin',1),(84,'2022_06_30_035148_create_order_referrals_table',1),(85,'2022_07_07_153354_update_charge_id_in_table_payments',1),(86,'2022_07_10_034813_move_lang_folder_to_root',1),(87,'2022_07_24_153815_add_completed_at_to_ec_orders_table',1),(88,'2022_08_04_051940_add_missing_column_expires_at',1),(89,'2022_08_04_052122_delete_location_backup_tables',1),(90,'2022_08_14_032836_create_ec_order_returns_table',1),(91,'2022_08_14_033554_create_ec_order_return_items_table',1),(92,'2022_08_15_040324_add_billing_address',1),(93,'2022_08_30_091114_support_digital_products_table',1),(94,'2022_09_01_000001_create_admin_notifications_tables',1),(95,'2022_09_13_095744_create_options_table',1),(96,'2022_09_13_104347_create_option_value_table',1),(97,'2022_10_05_163518_alter_table_ec_order_product',1),(98,'2022_10_12_041517_create_invoices_table',1),(99,'2022_10_12_142226_update_orders_table',1),(100,'2022_10_13_024916_update_table_order_returns',1),(101,'2022_10_14_024629_drop_column_is_featured',1),(102,'2022_10_19_152916_add_columns_to_mp_stores_table',1),(103,'2022_10_20_062849_create_mp_category_sale_commissions_table',1),(104,'2022_10_21_030830_update_columns_in_ec_shipments_table',1),(105,'2022_10_28_021046_update_columns_in_ec_shipments_table',1),(106,'2022_11_02_071413_add_more_info_for_store',1),(107,'2022_11_02_080444_add_tax_info',1),(108,'2022_11_16_034522_update_type_column_in_ec_shipping_rules_table',1),(109,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(110,'2022_11_19_041643_add_ec_tax_product_table',1),(111,'2022_12_02_093615_update_slug_index_columns',1),(112,'2022_12_12_063830_update_tax_defadult_in_ec_tax_products_table',1),(113,'2022_12_17_041532_fix_address_in_order_invoice',1),(114,'2022_12_26_070329_create_ec_product_views_table',1),(115,'2023_01_04_033051_fix_product_categories',1),(116,'2023_01_09_050400_add_ec_global_options_translations_table',1),(117,'2023_01_10_093754_add_missing_option_value_id',1),(118,'2023_01_17_082713_add_column_barcode_and_cost_per_item_to_product_table',1),(119,'2023_01_26_021854_add_ec_customer_used_coupons_table',1),(120,'2023_01_30_024431_add_alt_to_media_table',1),(121,'2023_02_01_062030_add_store_translations',1),(122,'2023_02_08_015900_update_options_column_in_ec_order_product_table',1),(123,'2023_02_13_032133_update_fee_column_mp_customer_revenues_table',1),(124,'2023_02_16_042611_drop_table_password_resets',1),(125,'2023_02_17_023648_fix_store_prefix',1),(126,'2023_02_27_095752_remove_duplicate_reviews',1),(127,'2023_03_20_115757_add_user_type_column_to_ec_shipment_histories_table',1),(128,'2023_04_17_062645_add_open_in_new_tab',1),(129,'2023_04_21_082427_create_ec_product_categorizables_table',1),(130,'2023_04_23_005903_add_column_permissions_to_admin_notifications',1),(131,'2023_04_23_061847_increase_state_translations_abbreviation_column',1),(132,'2023_05_03_011331_add_missing_column_price_into_invoice_items_table',1),(133,'2023_05_10_075124_drop_column_id_in_role_users_table',1),(134,'2023_05_17_025812_fix_invoice_issue',1),(135,'2023_05_26_073140_move_option_make_phone_field_optional_at_checkout_page_to_mandatory_fields',1),(136,'2023_05_27_144611_fix_exchange_rate_setting',1),(137,'2023_06_22_084331_add_generate_license_code_to_ec_products_table',1),(138,'2023_06_30_042512_create_ec_order_tax_information_table',1),(139,'2023_07_06_011444_create_slug_translations_table',1),(140,'2023_07_14_022724_remove_column_id_from_ec_product_collection_products',1),(141,'2023_07_26_041451_add_more_columns_to_location_table',1),(142,'2023_07_27_041451_add_more_columns_to_location_translation_table',1),(143,'2023_08_09_012940_remove_column_status_in_ec_product_attributes',1),(144,'2023_08_11_060908_create_announcements_table',1),(145,'2023_08_15_064505_create_ec_tax_rules_table',1),(146,'2023_08_15_073307_drop_unique_in_states_cities_translations',1),(147,'2023_08_21_021819_make_column_address_in_ec_customer_addresses_nullable',1),(148,'2023_08_21_090810_make_page_content_nullable',1),(149,'2023_08_22_094114_drop_unique_for_barcode',1),(150,'2023_08_29_074620_make_column_author_id_nullable',1),(151,'2023_08_29_075308_make_column_user_id_nullable',1),(152,'2023_08_30_031811_add_apply_via_url_column_to_ec_discounts_table',1),(153,'2023_09_07_094312_add_index_to_product_sku_and_translations',1),(154,'2023_09_14_021936_update_index_for_slugs_table',1),(155,'2023_09_14_022423_add_index_for_language_table',1),(156,'2023_09_19_024955_create_discount_product_categories_table',1),(157,'2023_10_17_070728_add_icon_and_icon_image_to_product_categories_table',1),(158,'2023_10_21_065016_make_state_id_in_table_cities_nullable',1),(159,'2023_11_07_023805_add_tablet_mobile_image',1),(160,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',1),(161,'2023_11_14_033417_change_request_column_in_table_audit_histories',1),(162,'2023_11_17_063408_add_description_column_to_faq_categories_table',1),(163,'2023_11_22_154643_add_unique_in_table_ec_products_variations',1),(164,'2023_11_27_032313_add_price_columns_to_ec_product_cross_sale_relations_table',1),(165,'2023_12_06_023945_add_display_on_checkout_column_to_ec_discounts_table',1),(166,'2023_12_07_095130_add_color_column_to_media_folders_table',1),(167,'2023_12_12_105220_drop_translations_table',1),(168,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',1),(169,'2023_12_25_040604_ec_create_review_replies_table',1),(170,'2023_12_26_090340_add_private_notes_column_to_ec_customers_table',1),(171,'2024_01_15_000001_create_fob_product_size_guides_table',1),(172,'2024_01_15_000002_create_fob_product_size_guide_relations_table',1),(173,'2024_01_15_000003_create_fob_size_guide_headers_table',1),(174,'2024_01_15_000004_create_fob_size_guide_headers_translations_table',1),(175,'2024_01_16_070706_fix_translation_tables',1),(176,'2024_01_23_075227_add_proof_file_to_ec_orders_table',1),(177,'2024_03_14_041050_migrate_lazy_load_theme_options',1),(178,'2024_03_20_080001_migrate_change_attribute_email_to_nullable_form_contacts_table',1),(179,'2024_03_21_100334_update_section_title_shape',1),(180,'2024_03_25_000001_update_captcha_settings_for_contact',1),(181,'2024_03_25_000001_update_captcha_settings_for_newsletter',1),(182,'2024_03_26_041531_add_cancel_reason_to_ec_orders_table',1),(183,'2024_03_27_062402_create_ec_customer_deletion_requests_table',1),(184,'2024_03_29_042242_migrate_old_captcha_settings',1),(185,'2024_03_29_093946_create_ec_order_return_histories_table',1),(186,'2024_04_01_043317_add_google_adsense_slot_id_to_ads_table',1),(187,'2024_04_01_063523_add_customer_columns_to_ec_reviews_table',1),(188,'2024_04_03_062451_add_cover_image_to_table_mp_stores',1),(189,'2024_04_04_110758_update_value_column_in_user_meta_table',1),(190,'2024_04_15_092654_migrate_ecommerce_google_tag_manager_code_setting',1),(191,'2024_04_16_035713_add_min_max_order_quantity_columns_to_products_table',1),(192,'2024_04_19_063914_create_custom_fields_table',1),(193,'2024_04_27_100730_improve_analytics_setting',1),(194,'2024_05_07_073153_improve_table_wishlist',1),(195,'2024_05_07_082630_create_mp_messages_table',1),(196,'2024_05_07_093703_add_missing_zip_code_into_table_store_locators',1),(197,'2024_05_12_091229_add_column_visibility_to_table_media_files',1),(198,'2024_05_15_021503_fix_invoice_path',1),(199,'2024_06_20_160724_create_ec_shared_wishlists_table',1),(200,'2024_06_28_025104_add_notify_attachment_updated_column_to_ec_products_table',1),(201,'2024_07_03_030900_add_downloaded_at_column_to_ec_order_product_table',1),(202,'2024_07_04_083133_create_payment_logs_table',1),(203,'2024_07_07_091316_fix_column_url_in_menu_nodes_table',1),(204,'2024_07_12_100000_change_random_hash_for_media',1),(205,'2024_07_14_071826_make_customer_email_nullable',1),(206,'2024_07_15_104916_add_video_media_column_to_ec_products_table',1),(207,'2024_07_19_131849_add_documents_to_mp_stores_table',1),(208,'2024_07_26_052530_add_percentage_to_tax_rules_table',1),(209,'2024_07_30_091615_fix_order_column_in_categories_table',1),(210,'2024_08_14_123028_add_customer_delivered_confirmed_at_column_to_ec_shipments_table',1),(211,'2024_08_17_094600_add_image_into_countries',1),(212,'2024_08_18_083119_add_tax_id_column_to_mp_stores_table',1),(213,'2024_08_19_132849_create_specification_tables',1),(214,'2024_08_27_141244_add_block_reason_to_ec_customers_table',1),(215,'2024_09_07_060744_add_author_column_to_specification_tables',1),(216,'2024_09_14_064023_add_can_use_with_flash_sale_column_to_ec_discounts_table',1),(217,'2024_09_14_100108_add_stripe_connect_details_to_ec_customers_table',1),(218,'2024_09_17_125408_add_square_logo_to_stores_table',1),(219,'2024_09_25_073928_remove_wrong_product_slugs',1),(220,'2024_09_30_024515_create_sessions_table',1),(221,'2024_12_01_000000_add_indexes_to_blog_translations_tables',1),(222,'2024_12_01_000000_add_indexes_to_contact_translations_tables',1),(223,'2024_12_01_000000_add_indexes_to_ecommerce_translations_tables',1),(224,'2024_12_01_000000_add_indexes_to_faq_translations_tables',1),(225,'2024_12_01_000000_add_indexes_to_gallery_translations_tables',1),(226,'2024_12_01_000000_add_indexes_to_pages_translations_table',1),(227,'2024_12_01_000000_add_indexes_to_slugs_translations_table',1),(228,'2024_12_01_000000_add_indexes_to_testimonials_translations_table',1),(229,'2024_12_01_000000_add_key_prefix_index_to_slugs_table',1),(230,'2024_12_19_000001_create_device_tokens_table',1),(231,'2024_12_19_000002_create_push_notifications_table',1),(232,'2024_12_19_000003_create_push_notification_recipients_table',1),(233,'2024_12_30_000001_create_user_settings_table',1),(234,'2025_01_06_033807_add_default_value_for_categories_author_type',1),(235,'2025_01_08_093652_add_zip_code_to_cities',1),(236,'2025_01_10_000000_fix_order_invoice_rounding_issues',1),(237,'2025_01_12_094943_correct_blog_posts_images',1),(238,'2025_01_15_050230_migrate_old_theme_options',1),(239,'2025_01_15_optimize_products_export_index',1),(240,'2025_01_17_082713_correct_column_barcode_and_cost_per_item_to_product_table',1),(241,'2025_01_24_044641_migrate_old_country_data',1),(242,'2025_01_28_233602_add_private_notes_into_ec_orders_table',1),(243,'2025_02_11_153025_add_action_label_to_announcement_translations',1),(244,'2025_02_13_021247_add_tax_translations',1),(245,'2025_02_24_152621_add_text_color_to_product_labels_table',1),(246,'2025_04_08_040931_create_social_logins_table',1),(247,'2025_04_12_000001_add_payment_fee_to_ec_orders_table',1),(248,'2025_04_12_000002_add_payment_fee_to_ec_invoices_table',1),(249,'2025_04_12_000003_add_payment_fee_to_payments_table',1),(250,'2025_04_21_000000_add_tablet_mobile_image_to_ads_translations_table',1),(251,'2025_05_05_000001_add_user_type_to_audit_histories_table',1),(252,'2025_05_05_092036_make_user_id_and_tax_amount_nullable',1),(253,'2025_05_15_082342_drop_email_unique_index_in_ec_customers_table',1),(254,'2025_05_22_000001_add_payment_fee_type_to_settings_table',1),(255,'2025_06_07_081731_add_translations_for_specification_groups_and_tables',1),(256,'2025_06_17_091813_increase_note_in_shipments_table',1),(257,'2025_06_24_000001_create_ec_product_license_codes_table',1),(258,'2025_06_24_080427_add_license_code_type_to_products_table',1),(259,'2025_07_06_030754_add_phone_to_users_table',1),(260,'2025_07_06_062402_create_ec_customer_deletion_requests_table',1),(261,'2025_07_07_161729_change_license_code_to_text_in_ec_product_license_codes_table',1),(262,'2025_07_08_162756_increase_license_code_column_size_in_ec_order_product_table',1),(263,'2025_07_09_000001_add_customer_address_fields_to_ec_invoices_table',1),(264,'2025_07_15_090809_create_ec_abandoned_carts_table',1),(265,'2025_07_24_120510_increase_barcode_column_length_in_ec_products_table',1),(266,'2025_07_31_021805_add_indexes_for_vendor_categories_optimization',1),(267,'2025_07_31_083459_add_indexes_for_location_search_performance',1),(268,'2025_07_31_133600_add_performance_indexes_to_ec_product_categories_table',1),(269,'2025_07_31_add_performance_indexes_to_slugs_table',1),(270,'2025_08_01_161205_optimize_product_variation_query_indexes',1),(271,'2025_08_07_073854_add_verification_fields_to_mp_stores_table',1),(272,'2025_08_08_145059_correct_tax_amount_in_order_and_invoice_tables',1),(273,'2025_09_05_025247_create_ec_product_specification_attribute_translations_table',1),(274,'2025_09_08_025516_add_variations_count_to_ec_products_table',1),(275,'2025_09_08_080248_add_slug_column_to_ec_product_categories_table',1),(276,'2025_09_08_080330_add_slug_column_to_ec_product_categories_translations_table',1),(277,'2025_09_08_080443_populate_slug_column_for_product_categories',1),(278,'2025_09_08_081216_add_slug_column_to_ec_products_table',1),(279,'2025_09_08_081237_add_slug_column_to_ec_products_translations_table',1),(280,'2025_09_08_081321_populate_slug_column_for_products',1),(281,'2025_09_10_073321_add_performance_indexes_to_ecommerce_tables',1),(282,'2025_09_18_093922_fix_tax_rounding_in_order_products_and_invoices',1),(283,'2025_09_21_030756_add_reviews_cache_to_ec_products_table',1),(284,'2025_09_30_090432_add_performance_indexes_to_ec_product_categories_table',1),(285,'2025_10_10_090331_add_number_format_style_to_ec_currencies_table',1),(286,'2025_10_10_092235_add_space_between_price_and_currency_to_ec_currencies_table',1),(287,'2025_10_11_074318_add_price_includes_tax_to_ec_products_table',1),(288,'2025_10_13_043527_generate_slugs_for_product_collections',1),(289,'2025_10_22_020518_add_verification_code_to_ec_customer_deletion_requests_table',1),(290,'2025_10_22_090000_remove_duplicate_order_addresses',1),(291,'2025_10_28_133220_add_unique_order_id_to_shipments_table',1),(292,'2025_10_28_134738_fix_order_payment_shipment_discount_data_issues',1),(293,'2025_11_05_000001_add_indexes_for_marketplace_performance_optimization',1),(294,'2025_11_05_032148_add_performance_indexes_to_ecommerce_tables',1),(295,'2025_11_07_000001_add_actor_type_to_audit_histories_table',1),(296,'2025_11_10_000000_cleanup_duplicate_widgets',1),(297,'2025_11_10_100000_create_ec_order_metadata_table',1),(298,'2025_11_12_100000_improve_ec_customer_recently_viewed_products_table',1),(299,'2025_11_18_214150_add_covering_indexes_to_product_relation_tables',1),(300,'2025_12_02_045049_add_index_to_product_labels_table',1),(301,'2025_12_12_150000_add_sequence_columns_to_abandoned_carts',1),(302,'2025_12_16_160000_add_is_new_until_to_ec_products_table',1),(303,'2025_12_28_000628_add_images_column_to_ec_order_returns_table',1),(304,'2026_01_05_162601_update_missing_slugs_for_ec_product_categories_table',1),(305,'2026_01_09_024811_add_currency_code_to_ec_products_table',1),(306,'2026_01_10_000001_add_status_to_simple_slider_items_table',1),(307,'2026_01_11_221755_add_price_columns_to_ec_product_up_sale_relations_table',1),(308,'2026_01_14_035001_add_customer_id_to_ec_cart_table',1),(309,'2026_01_26_084750_add_customer_id_to_ec_review_replies_table',1),(310,'2026_01_31_144854_add_zip_code_range_to_ec_shipping_rule_items_table',1),(311,'2026_02_02_090000_add_tax_location_to_mp_stores_table',1),(312,'2026_02_02_090000_create_ec_order_product_tax_components_table',1),(313,'2026_02_02_090001_create_ec_invoice_item_tax_components_table',1),(314,'2026_02_02_090002_add_tax_class_to_ec_customers_table',1),(315,'2026_02_02_090003_add_tax_class_to_ec_products_table',1),(316,'2026_02_02_090004_add_tax_breakdown_to_ec_order_product_table',1),(317,'2026_02_03_090000_drop_foreign_key_from_ec_order_product_tax_components_table',1),(318,'2026_02_07_090000_remove_duplicate_product_variation_records',1),(319,'2026_02_11_090000_add_price_per_product_to_options_tables',1),(320,'2026_02_11_090000_add_shipping_tax_amount_to_ec_orders_and_invoices_table',1),(321,'2026_02_11_160300_convert_specification_options_to_id_based_format',1),(322,'2026_03_03_150041_add_content_to_ec_product_tags_table',1),(323,'2026_03_04_000001_add_name_to_ec_shipping_rule_items_table',1),(324,'2026_03_04_000002_normalize_zip_codes_in_ec_shipping_rule_items_table',1),(325,'2026_03_06_020547_make_comment_nullable_in_ec_reviews_table',1),(326,'2026_03_06_020805_fix_empty_status_in_ec_invoices_table',1),(327,'2026_03_07_153100_add_index_to_meta_boxes_table',1),(328,'2026_03_10_105000_add_badge_type_to_ec_reviews_table',1),(329,'2026_03_23_000000_create_media_folder_permissions_table',1),(330,'2026_03_27_085220_add_folder_deleted_name_index_to_media_files_table',1),(331,'2026_04_20_000000_add_sessions_invalidated_at_to_users_table',1),(332,'2026_04_24_000001_reconcile_payment_amount_with_order_total',1),(333,'2026_04_25_000001_backfill_missing_order_shipping_addresses',1),(334,'2026_05_12_000000_change_description_column_type_in_blog_tables',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_category_sale_commissions`
--

DROP TABLE IF EXISTS `mp_category_sale_commissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_category_sale_commissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_category_id` bigint unsigned NOT NULL,
  `commission_percentage` decimal(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mp_category_sale_commissions_product_category_id_unique` (`product_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_category_sale_commissions`
--

LOCK TABLES `mp_category_sale_commissions` WRITE;
/*!40000 ALTER TABLE `mp_category_sale_commissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_category_sale_commissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_customer_revenues`
--

DROP TABLE IF EXISTS `mp_customer_revenues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_customer_revenues` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned DEFAULT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `sub_amount` decimal(15,2) DEFAULT '0.00',
  `fee` decimal(15,2) unsigned DEFAULT '0.00',
  `amount` decimal(15,2) DEFAULT '0.00',
  `current_balance` decimal(15,2) DEFAULT '0.00',
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mp_customer_revenues_customer_id_index` (`customer_id`),
  KEY `mp_customer_revenues_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_customer_revenues`
--

LOCK TABLES `mp_customer_revenues` WRITE;
/*!40000 ALTER TABLE `mp_customer_revenues` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_customer_revenues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_customer_withdrawals`
--

DROP TABLE IF EXISTS `mp_customer_withdrawals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_customer_withdrawals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned DEFAULT NULL,
  `fee` decimal(15,2) unsigned DEFAULT '0.00',
  `amount` decimal(15,2) unsigned DEFAULT '0.00',
  `current_balance` decimal(15,2) unsigned DEFAULT '0.00',
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `bank_info` text COLLATE utf8mb4_unicode_ci,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `images` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `transaction_id` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mp_customer_withdrawals_customer_id_index` (`customer_id`),
  KEY `mp_customer_withdrawals_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_customer_withdrawals`
--

LOCK TABLES `mp_customer_withdrawals` WRITE;
/*!40000 ALTER TABLE `mp_customer_withdrawals` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_customer_withdrawals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_messages`
--

DROP TABLE IF EXISTS `mp_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` bigint unsigned NOT NULL,
  `customer_id` bigint unsigned DEFAULT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_messages`
--

LOCK TABLES `mp_messages` WRITE;
/*!40000 ALTER TABLE `mp_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_stores`
--

DROP TABLE IF EXISTS `mp_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_stores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` bigint unsigned DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_square` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `verified_at` timestamp NULL DEFAULT NULL,
  `verified_by` bigint unsigned DEFAULT NULL,
  `verification_note` text COLLATE utf8mb4_unicode_ci,
  `vendor_verified_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificate_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `government_id_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mp_stores_customer_id_index` (`customer_id`),
  KEY `mp_stores_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_stores`
--

LOCK TABLES `mp_stores` WRITE;
/*!40000 ALTER TABLE `mp_stores` DISABLE KEYS */;
INSERT INTO `mp_stores` VALUES (1,'Anthro Studio','hello@anthro.example.com','+1-415-555-0142','512 Valencia Street','US','California','San Francisco',2,'testimonials/avatar-1.jpg',NULL,NULL,'Eclectic apparel and home goods inspired by global craftsmanship traditions.','<p>Anthro Studio sources from independent artisans across four continents. Every piece is checked by hand before it ships from our San Francisco fulfilment center.</p>','published',1,NULL,NULL,NULL,NULL,'2026-05-28 18:59:20','2026-05-28 18:59:20','94110','Anthro Studio Inc.',NULL,NULL,NULL,NULL,NULL),(2,'Crate Furniture Co.','orders@crate.example.com','+1-503-555-0188','1840 NE Alberta Street','US','Oregon','Portland',5,'testimonials/avatar-2.jpg',NULL,NULL,'Mid-century-inspired furniture built to last generations.','<p>Every Crate piece is built one at a time in our Portland workshop using sustainably harvested American hardwoods.</p>','published',1,NULL,NULL,NULL,NULL,'2026-05-28 18:59:20','2026-05-28 18:59:20','97211','Crate Furniture Co.',NULL,NULL,NULL,NULL,NULL),(3,'Findr Audio','support@findr.example.com','+44-20-7946-0310','17 Hanbury Street','GB','Greater London','London',5,'testimonials/avatar-3.jpg',NULL,NULL,'Audio gear engineered for studio-grade clarity in everyday environments.','<p>Founded by ex-studio engineers, Findr brings reference-quality sound to wireless headphones and earbuds.</p>','published',1,NULL,NULL,NULL,NULL,'2026-05-28 18:59:20','2026-05-28 18:59:20','E1 6QR','Findr Audio Ltd.',NULL,NULL,NULL,NULL,NULL),(4,'Bohome Living','hello@bohome.example.com','+34-93-555-0122','Carrer de Sepulveda 102','ES','Catalonia','Barcelona',6,'testimonials/avatar-4.jpg',NULL,NULL,'Bohemian-inspired homewares and textiles for the relaxed modern home.','<p>Bohome partners with co-operatives in Morocco, Turkey, and India to bring you authentic, fair-traded textiles.</p>','published',1,NULL,NULL,NULL,NULL,'2026-05-28 18:59:20','2026-05-28 18:59:20','08015','Bohome Living S.L.',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `mp_stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_stores_translations`
--

DROP TABLE IF EXISTS `mp_stores_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_stores_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mp_stores_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`mp_stores_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_stores_translations`
--

LOCK TABLES `mp_stores_translations` WRITE;
/*!40000 ALTER TABLE `mp_stores_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_stores_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_vendor_info`
--

DROP TABLE IF EXISTS `mp_vendor_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_vendor_info` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL DEFAULT '0',
  `balance` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_revenue` decimal(15,2) NOT NULL DEFAULT '0.00',
  `signature` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_info` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payout_payment_method` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT 'bank_transfer',
  `tax_info` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mp_vendor_info_customer_id_index` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_vendor_info`
--

LOCK TABLES `mp_vendor_info` WRITE;
/*!40000 ALTER TABLE `mp_vendor_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_vendor_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'About','[page-banner heading=\"About Us\" subtitle=\"With over 15 years of experience, we craft timeless collections that transcend<br class=\\\"d-none d-lg-block\\\">trends and inspire lasting elegance.\"][/page-banner]\n[stats-counter hero_image=\"section/s-contact-1.jpg\" heading=\"Design, attention to detail & efficiency to delight the world\" description=\"From the moment it is conceived to the moment it is worn, every one of our garments follows this path. We could do it at a fast pace. However, at Amerce, we choose to take care of all those who are walking this path with us.\" quantity=\"4\" value_1=\"8.2k\" animate_to_1=\"\" suffix_1=\"\" label_1=\"Products Available\" desc_1=\"We offer a wide selection of high-quality products to meet every need.\" value_2=\"\" animate_to_2=\"10\" suffix_2=\"k\" label_2=\"Happy Customers\" desc_2=\"Serving over 10,000 delighted customers who trust us for quality and service.\" value_3=\"\" animate_to_3=\"96\" suffix_3=\"\" label_3=\"Partner Brand\" desc_3=\"Our top-brand partnerships bring a trusted collection for your store and home.\" value_4=\"\" animate_to_4=\"16\" suffix_4=\"k\" label_4=\"Products For Sale\" desc_4=\"That\'s why we strive to offer a diverse range of products that cater to all styles.\"][/stats-counter]\n[image-accordion image=\"section/s-contact-2.jpg\" heading=\"Offering Rare And Beautiful Items Worldwide\" quantity=\"4\" title_1=\"Introduction\" body_1=\"Welcome to Amerce Store, your premier destination for fashion-forward clothing and accessories. We pride ourselves on offering a curated selection of rare and beautiful items sourced both locally and globally.\" title_2=\"Our Vision\" body_2=\"We envision a world where thoughtful design meets everyday life — pieces that age gracefully, partners we trust, and customers we treat as people, not transactions.\" title_3=\"What Sets Us Apart\" body_3=\"Independently audited suppliers, hand-checked products, and a 30-day no-questions return policy backed by a human customer support team.\" title_4=\"Our Commitment\" body_4=\"Quality goods, transparent supply chains, and fair labor — every order, every time.\"][/image-accordion]\n[about-testimonials heading=\"Customer Say!\" subtitle=\"Our customers adore our products, and we constantly aim to delight them.\" quantity=\"2\" image_1=\"testimonials/tes-1.jpg\" name_1=\"Emma Collins\" text_1=\"\\\"Totally obsessed with this outfit! The fit is perfect, the fabric feels premium, and I\'ve been getting compliments non-stop. It instantly lifts my confidence — such a great find!\\\"\" image_2=\"testimonials/tes-2.jpg\" name_2=\"Sophia Ramirez\" text_2=\"\\\"I\'m amazed by how comfortable yet stylish this piece is. It pairs effortlessly with everything, and the quality really stands out. Definitely becoming my go-to for everyday looks!\\\"\"][/about-testimonials]\n[about-team heading=\"Meet Our Teams\" subtitle=\"Experts committed to excellence in every detail.\" quantity=\"4\" image_1=\"member/member-1.jpg\" name_1=\"Annette Black\" role_1=\"Founder/CEO\" social_links_1=\"\" image_2=\"member/member-2.jpg\" name_2=\"Brooklyn Simmons\" role_2=\"Manager\" social_links_2=\"\" image_3=\"member/member-3.jpg\" name_3=\"Jane Cooper\" role_3=\"Sales Director\" social_links_3=\"\" image_4=\"member/member-4.jpg\" name_4=\"Lisa Bonet\" role_4=\"Sales Director\" social_links_4=\"\"][/about-team]',1,NULL,'landing','About Amerce — our story, sourcing standards, and the people behind every product.','published','2026-05-28 18:59:20','2026-05-28 18:59:20'),(2,'Contact','',1,NULL,'landing','Reach the Amerce customer support and partnerships teams.','published','2026-05-28 18:59:20','2026-05-28 18:59:20'),(3,'FAQ','[page-banner heading=\"FAQs\" subtitle=\"Got questions? We\'ve got answers! Browse our FAQs to find information on orders, shipping,<br class=\\\"d-none d-lg-block\\\">returns, and more. If you need further assistance, feel free to contact our team.\"][/page-banner]\n[faq-page sidebar_image=\"section/banner-12.jpg\" sidebar_title=\"Save 25% <br class=\\\"d-none d-sm-block\\\">Today\" sidebar_subtitle=\"T-Shirts, Hoodies & More\" sidebar_cta=\"View More\" sidebar_url=\"/products\" quantity=\"16\" category_1=\"My Account\" category_id_1=\"myAccount\" question_1=\"1. What can I do if I forgot my password?\" answer_1=\"Use the \\\"Forgot password\\\" link on the sign-in page. We will email you a one-time link to set a new password — it expires in 30 minutes for security.\" category_2=\"My Account\" category_id_2=\"myAccount\" question_2=\"2. How do I update my email address?\" answer_2=\"Sign in, open Account → Settings, and change the email field. We send a confirmation email to the new address; the change takes effect once you click that link.\" category_3=\"My Account\" category_id_3=\"myAccount\" question_3=\"3. Can I delete my account?\" answer_3=\"Yes. From Account → Settings, scroll to Delete account. We retain order history for tax/legal reasons but personal contact details are removed within 30 days.\" category_4=\"Orders & Purchases\" category_id_4=\"ordersPurchases\" question_4=\"1. How do I place an order?\" answer_4=\"Add items to your cart, click checkout, choose a shipping method, then enter your payment details. You will receive an order confirmation email immediately.\" category_5=\"Orders & Purchases\" category_id_5=\"ordersPurchases\" question_5=\"2. Can I edit or cancel an order?\" answer_5=\"Orders can be edited or cancelled from your account dashboard within 1 hour of placement. After that the warehouse has begun picking and we cannot intercept.\" category_6=\"Orders & Purchases\" category_id_6=\"ordersPurchases\" question_6=\"3. What payment methods are accepted?\" answer_6=\"We accept Visa, Mastercard, American Express, Apple Pay, Google Pay, and PayPal. All transactions use TLS 1.3 encryption.\" category_7=\"Returns & Refunds\" category_id_7=\"returnsRefunds\" question_7=\"1. What is the return window?\" answer_7=\"30 days from delivery for any unworn item in original condition. Sale items, intimate apparel, and final-sale flash sale purchases are excluded.\" category_8=\"Returns & Refunds\" category_id_8=\"returnsRefunds\" question_8=\"2. How do I start a return?\" answer_8=\"Open the order in your account dashboard and click \\\"Start return\\\". We email a prepaid label for domestic orders within one business day.\" category_9=\"Returns & Refunds\" category_id_9=\"returnsRefunds\" question_9=\"3. When will I see my refund?\" answer_9=\"Refunds are processed within 3-5 business days of us receiving the return. Bank posting times vary; allow up to 10 business days for the credit to appear.\" category_10=\"Shipping & Tracking\" category_id_10=\"shippingTracking\" question_10=\"1. How long does shipping take?\" answer_10=\"Domestic standard ships in 3-5 business days. Express in 1-2. International standard takes 7-12 business days; express options are available at checkout.\" category_11=\"Shipping & Tracking\" category_id_11=\"shippingTracking\" question_11=\"2. How do I track my order?\" answer_11=\"A tracking link is included in your shipment confirmation email. You can also see status from Account → Orders → Track.\" category_12=\"Shipping & Tracking\" category_id_12=\"shippingTracking\" question_12=\"3. Do you ship internationally?\" answer_12=\"Yes — to most countries. Duties and taxes are pre-paid at checkout for select destinations; otherwise the courier may collect them on delivery.\" category_13=\"Fees & Billing\" category_id_13=\"feesBilling\" question_13=\"1. Are duties and taxes included?\" answer_13=\"Domestic prices include sales tax shown at checkout. International orders to supported destinations include duties and taxes; otherwise the courier collects on delivery.\" category_14=\"Fees & Billing\" category_id_14=\"feesBilling\" question_14=\"2. Why was I charged twice?\" answer_14=\"You likely see a temporary authorization hold plus the actual charge. The authorization drops off in 3-5 business days. Email billing@amerce.test if you still see two charges after that.\" category_15=\"Other Topic\" category_id_15=\"otherTopic\" question_15=\"1. Do you have physical stores?\" answer_15=\"Yes — visit our Stores page for a list of flagship and partner locations.\" category_16=\"Other Topic\" category_id_16=\"otherTopic\" question_16=\"2. How can I contact customer support?\" answer_16=\"Email hello@amerce.test or use the contact form. We reply within one business day.\"][/faq-page]',1,NULL,'landing','Frequently asked questions about orders, shipping, returns, and account management.','published','2026-05-28 18:59:20','2026-05-28 18:59:20'),(4,'Privacy Policy','[page-banner heading=\"Privacy Policy\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Information We Collect\" body_1=\"<p class=\\\"term-text cl-text-2\\\">When you visit the Site, we automatically collect certain information about your device — web browser, IP address, time zone, and some of the cookies installed on your device. As you browse, we also collect data about the pages or products you view, what referred you to the Site, and how you interact with it. We refer to this as \\\"Device Information\\\".</p><p class=\\\"term-text cl-text-2\\\">When you make a purchase or attempt to purchase through the Site, we collect your name, billing address, shipping address, and payment information (including card number, email address, and phone number). We refer to this as \\\"Order Information\\\".</p>\" title_2=\"2. How We Use Your Information\" body_2=\"<p class=\\\"term-text cl-text-2\\\">We use Order Information to fulfil orders placed through the Site (process payment, arrange shipping, provide invoices and order confirmations). We use it to communicate with you, screen orders for fraud, and — in line with your preferences — share marketing about products you may like.</p><p class=\\\"term-text cl-text-2\\\">We use Device Information to screen for fraud and to improve the Site through analytics about how customers browse and interact with us.</p>\" title_3=\"3. Sharing Your Personal Information\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We share Personal Information with third-party service providers who help us run the Site. We may also share information to comply with applicable laws, respond to a subpoena or lawful request, or otherwise protect our rights.</p>\" title_4=\"4. Data Retention\" body_4=\"<p class=\\\"term-text cl-text-2\\\">When you place an order, we maintain the Order Information for our records unless and until you ask us to delete it.</p>\" title_5=\"5. Your Rights\" body_5=\"<p class=\\\"term-text cl-text-2\\\">You can request access, correction, or deletion of any personal data we hold about you. Email privacy@amerce.test from the address on file and we will respond within 30 days.</p>\" title_6=\"6. Cookies\" body_6=\"<p class=\\\"term-text cl-text-2\\\">Cookies are used to keep your cart between visits, remember your preferences, and measure aggregate traffic. You can disable cookies in your browser, though some Site features may stop working.</p>\" title_7=\"7. Changes\" body_7=\"<p class=\\\"term-text cl-text-2\\\">We may update this policy from time to time to reflect changes to our practices or for operational, legal, or regulatory reasons. The latest version will always be on this page.</p>\"][/term-content]',1,NULL,'landing','How Amerce collects, uses, and protects your personal information.','published','2026-05-28 18:59:20','2026-05-28 18:59:20'),(5,'Terms &amp; Conditions','[page-banner heading=\"Terms & Conditions\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Acceptance of Terms\" body_1=\"<p class=\\\"term-text cl-text-2\\\">By accessing or using the Amerce store you agree to these terms. We reserve the right to update them with reasonable notice; the latest version is always available on this page.</p>\" title_2=\"2. Orders & Payment\" body_2=\"<p class=\\\"term-text cl-text-2\\\">All prices are in USD unless otherwise stated. We accept the payment methods displayed at checkout. An order becomes binding once you receive an order confirmation email.</p>\" title_3=\"3. Shipping\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Shipping options, lead times, and rates are listed on our Shipping page. Risk passes to you on delivery.</p>\" title_4=\"4. Returns\" body_4=\"<p class=\\\"term-text cl-text-2\\\">You have 30 days from delivery to return any unworn item for a refund. See our Returns &amp; Refunds page for the full process.</p>\" title_5=\"5. Intellectual Property\" body_5=\"<p class=\\\"term-text cl-text-2\\\">All content on the Site — text, photography, logos, code — is owned by Amerce or its licensors and may not be reproduced without written permission.</p>\" title_6=\"6. Limitation of Liability\" body_6=\"<p class=\\\"term-text cl-text-2\\\">To the maximum extent permitted by law, Amerce is not liable for indirect or consequential damages arising from use of the Site or the products purchased through it.</p>\" title_7=\"7. Governing Law\" body_7=\"<p class=\\\"term-text cl-text-2\\\">These terms are governed by the laws of the State of New York. Any dispute will be resolved in the state or federal courts located in New York County.</p>\"][/term-content]',1,NULL,'landing','The legal terms governing your use of the Amerce store.','published','2026-05-28 18:59:20','2026-05-28 18:59:20'),(6,'Returns &amp; Refunds','[page-banner heading=\"Returns & Refunds\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Returns\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We want you to be completely satisfied with your purchase. If for any reason you are not, you may return any unworn item within 30 days of receiving your order for a refund or exchange. Items must be in original packaging and the same condition as you received them.</p>\" title_2=\"2. How to Start a Return\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Open the order in your account dashboard and click \\\"Start return\\\", or email returns@amerce.test with your order number. We will send a prepaid return label for domestic orders within one business day.</p>\" title_3=\"3. Refunds\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Refunds are processed within 3-5 business days of us receiving the return and applied to the original payment method. Bank posting times vary; allow up to 10 business days for the credit to appear.</p>\" title_4=\"4. Exclusions\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Sale items, intimate apparel, and final-sale flash sale purchases are excluded from returns. Personalised or made-to-order items are also non-returnable unless faulty.</p>\" title_5=\"5. Damaged or Faulty Items\" body_5=\"<p class=\\\"term-text cl-text-2\\\">If your order arrives damaged or faulty, email us within 7 days with photos. We will replace the item or issue a full refund — including any return shipping cost — at our expense.</p>\" title_6=\"6. International Returns\" body_6=\"<p class=\\\"term-text cl-text-2\\\">International customers are responsible for return shipping unless the item is faulty. We do not refund original shipping or duty charges on international returns.</p>\"][/term-content]',1,NULL,'landing','Our 30-day return policy and the step-by-step return process.','published','2026-05-28 18:59:20','2026-05-28 18:59:20'),(7,'Shipping','[page-banner heading=\"Shipping\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Shipping Methods\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We offer the following shipping methods for domestic and international orders: standard ground, expedited 2-day, and priority overnight (where available).</p>\" title_2=\"2. Domestic Rates\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Standard ground is free on orders over $99. Express 1-2 day shipping is $19.99 flat. Priority overnight is calculated by weight at checkout.</p>\" title_3=\"3. International\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We ship to most countries. International standard shipping is $24.99 with 7-12 business day delivery. Express options appear at checkout. Duties and taxes are pre-paid for select destinations; otherwise the courier collects them on delivery.</p>\" title_4=\"4. Processing Time\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Orders placed before 2pm EST on business days ship the same day. Orders placed after 2pm or on weekends/holidays ship the next business day.</p>\" title_5=\"5. Tracking\" body_5=\"<p class=\\\"term-text cl-text-2\\\">A tracking link is included in your shipment confirmation email. You can also see live status from Account → Orders → Track.</p>\" title_6=\"6. Lost or Stuck Shipments\" body_6=\"<p class=\\\"term-text cl-text-2\\\">If a tracking number has not updated for more than 7 business days, email shipping@amerce.test. We will open an investigation with the carrier and either refund or reship the order at our expense.</p>\"][/term-content]',1,NULL,'landing','Domestic and international shipping options, lead times, and rates.','published','2026-05-28 18:59:20','2026-05-28 18:59:20'),(8,'Our Stores','',1,NULL,'landing','Visit Amerce in person — flagship locations and partner boutiques worldwide.','published','2026-05-28 18:59:20','2026-05-28 18:59:20'),(9,'Blog','<div class=\"container py-5\"><h1>Journal</h1><p>Browse our latest stories — style guides, product spotlights, sustainability deep-dives, and more.</p></div>',1,NULL,'default','Style guides, product spotlights, and stories from the Amerce team.','published','2026-05-28 18:59:20','2026-05-28 18:59:20'),(10,'Careers','<div class=\"container py-5\"><h1>Careers at Amerce</h1><p>We are a small, distributed team building a more thoughtful kind of retail. We hire across product, engineering, supply chain, and customer experience.</p><p>Open roles are posted to our company LinkedIn page. To apply, send a short note and your resume to <a href=\"mailto:careers@amerce.test\">careers@amerce.test</a>.</p></div>',1,NULL,'default','Open roles and what it is like to work at Amerce.','published','2026-05-28 18:59:20','2026-05-28 18:59:20'),(11,'Sustainability','<div class=\"container py-5\"><h1>Sustainability at Amerce</h1><p>Every product carries a story. We work directly with mills and ateliers, prioritise recycled and traceable materials, and ship in plastic-free packaging.</p><p>Our 2026 goal: 90% of materials with a verified chain of custody, and a transparent annual impact report.</p></div>',1,NULL,'default','How Amerce sources responsibly and reduces its environmental footprint.','published','2026-05-28 18:59:20','2026-05-28 18:59:20'),(12,'Homepage','[simple-slider key=\"home-hero\" style=\"style-baby\" is_autoplay=\"yes\" autoplay_speed=\"3000\" show_arrows=\"no\" show_dots=\"yes\" wrapper_class=\"pt-30 p-xl-0\" text_color=\"white\" button_style=\"pill-white\"][/simple-slider]\n[infinity-marquee style=\"style-1\" variant=\"policy\" background_class=\"\" spacing_class=\"flat-spacing\" use_container=\"yes\" clone_count=\"3\" quantity=\"4\" heading_1=\"Free shipping on all orders over $20.00\" image_1=\"section/policy-1.jpg\" heading_2=\"Returns are free within 14 days\" image_2=\"section/policy-2.jpg\" heading_3=\"Free shipping on all orders over $20.00\" image_3=\"section/policy-3.jpg\" heading_4=\"Returns are free within 14 days\" image_4=\"section/policy-4.jpg\"][/infinity-marquee]\n[categories-grid style=\"style-slider-wide-image\" spacing_class=\"themesFlat\" title=\"Shop By Categories\" subtitle=\"Explore trusted essentials to comfort and nurture your little one.\" limit=\"8\" show_count=\"yes\"][/categories-grid]\n[ecommerce-products style=\"style-tabs\" title=\"This Week&rsquo;s Highlights\" subtitle=\"Discover our most-loved baby essentials picked for comfort, safety, and style.\" source=\"latest\" limit=\"8\" items_per_row=\"4\" tab_labels=\"New|Popular|Sale|Baby|Kids\" tab_sources=\"latest|best-seller|sale|featured|latest\" tab_nav_class_extra=\"style-2\" grid_rows=\"2\" product_wrapper_class=\"square\"][/ecommerce-products]\n[image-gallery style=\"style-paired-banner-side\" quantity=\"2\" image_1=\"section/banner-19.jpg\" link_1=\"/products\" title_1=\"Little Joys, Big Savings!\" description_1=\"Up to 50% OFF on baby must-haves\" button_text_1=\"View All Products\" image_2=\"section/banner-20.jpg\" link_2=\"/products\" title_2=\"Fresh Finds for Little Smiles\" description_2=\"Soft, safe, and ready for every cuddle.\" button_text_2=\"Explore Now\"][/image-gallery]\n[ecommerce-products style=\"style-banner-carousel-side\" title=\"\" subtitle=\"\" custom_title=\"Parent &amp; Baby Favorites\" custom_subtitle=\"Discover the softest, most-loved essentials for your little world.\" view_all_url=\"/products\" view_all_text=\"View All Products\" banner_image=\"section/banner-21.jpg\" banner_subheading=\"LOVE IN EVERY LITTLE DETAIL\" banner_heading=\"Comfort And Care For Your Baby\" banner_button_text=\"View All Products\" banner_button_url=\"/products\" source=\"featured\" limit=\"6\" items_per_row=\"2\"][/ecommerce-products]\n[lookbook-hotspot style=\"style-bundle-slider\" title=\"The Ultimate Baby Bundle\" subtitle=\"A handpicked collection of premium baby must-haves for comfort, quality.\" image=\"section/banner-lookbook-6.jpg\" image_2=\"section/banner-lookbook-7.jpg\" quantity=\"4\" x_percent_1=\"32.5\" y_percent_1=\"61.2\" product_id_1=\"1\" column_1=\"1\" x_percent_2=\"61.7\" y_percent_2=\"51.8\" product_id_2=\"9\" column_2=\"1\" x_percent_3=\"32.5\" y_percent_3=\"61.2\" product_id_3=\"2\" column_3=\"2\" x_percent_4=\"61.7\" y_percent_4=\"51.8\" product_id_4=\"10\" column_4=\"2\"][/lookbook-hotspot]\n[testimonials style=\"style-v2-product\" card_type=\"type-2\" title=\"Loved By Happy Parents\" subtitle=\"Real stories from moms and dads who trust us with their baby\'s care.\" autoplay=\"yes\" limit=\"4\" view_all_url=\"/products\" view_all_text=\"View All Products\" testimonial_product_ids=\"1,9,10,3\"][/testimonials]\n[blog-posts style=\"style-slider\" title=\"Stories For Modern Parents\" subtitle=\"Thoughtful ideas and everyday inspiration for raising happy little ones.\" limit=\"6\" show_meta=\"yes\" show_excerpt=\"yes\"][/blog-posts]\n[image-gallery style=\"style-default\" skip_spacing=\"yes\" title=\"Shop Instagram\" subtitle=\"Elevate your wardrobe with fresh finds today!\" quantity=\"5\" image_1=\"gallery/gallery-17.jpg\" link_1=\"/products\" image_2=\"gallery/gallery-18.jpg\" link_2=\"/products\" image_3=\"gallery/gallery-19.jpg\" link_3=\"/products\" image_4=\"gallery/gallery-20.jpg\" link_4=\"/products\" image_5=\"gallery/gallery-21.jpg\" link_5=\"/products\"][/image-gallery]',NULL,NULL,'homepage','Amerce — multi-purpose ecommerce homepage demo.','published','2026-05-28 18:59:23','2026-05-28 18:59:23');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`),
  KEY `idx_pages_trans_pages_id` (`pages_id`),
  KEY `idx_pages_trans_page_lang` (`pages_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
INSERT INTO `pages_translations` VALUES ('ar',1,'عن','تقديم Amerce - قصة العلامة التجارية ومعايير التوريد والفريق الذي يقف وراء كل منتج.','[page-banner heading=\"معلومات عنا\" subtitle=\"With over 15 years of experience, we craft timeless collections that transcend<br class=\\\"d-none d-lg-block\\\">trends and inspire lasting elegance.\"][/page-banner]\n[stats-counter hero_image=\"section/s-contact-1.jpg\" heading=\"التصميم والاهتمام بالتفاصيل والكفاءة يرضي العالم\" description=\"منذ لحظة تصورها وحتى لحظة ارتدائها، يتبع كل منتج من منتجاتنا هذه الرحلة. يمكننا أن نفعل ذلك بمعدل أسرع. ومع ذلك، في Amerce، نختار الاعتناء بكل من يشارك معنا في هذه الرحلة.\" quantity=\"4\" value_1=\"8.2k\" animate_to_1=\"\" suffix_1=\"\" label_1=\"المنتجات الموجودة\" desc_1=\"نحن نقدم مجموعة متنوعة من المنتجات عالية الجودة لتلبية جميع الاحتياجات.\" value_2=\"\" animate_to_2=\"10\" suffix_2=\"k\" label_2=\"العملاء الراضين\" desc_2=\"نخدم أكثر من 10,000 عميل راضٍ يثقون بنا من حيث الجودة والخدمة.\" value_3=\"\" animate_to_3=\"96\" suffix_3=\"\" label_3=\"العلامة التجارية الشريكة\" desc_3=\"تجلب الشراكات مع العلامات التجارية الرائدة مجموعات موثوقة إلى متجرك ومنزلك.\" value_4=\"\" animate_to_4=\"16\" suffix_4=\"k\" label_4=\"منتجات للبيع\" desc_4=\"ولهذا السبب نسعى جاهدين لتقديم مجموعة متنوعة من خطوط الإنتاج، المناسبة لكل نمط.\"][/stats-counter]\n[image-accordion image=\"section/s-contact-2.jpg\" heading=\"جلب العناصر النادرة والرائعة إلى جميع أنحاء العالم\" quantity=\"4\" title_1=\"يقدم\" body_1=\"مرحبًا بك في متجر Amerce، وجهتك الأولى للأزياء والإكسسوارات العصرية. نحن فخورون بتقديم مجموعة مختارة بعناية من القطع النادرة والرائعة المطلوبة على الصعيدين الوطني والدولي.\" title_2=\"رؤيتنا\" body_2=\"نحن نهدف إلى عالم يمتزج فيه التصميم المتطور مع الحياة اليومية - المنتجات التي تصمد أمام اختبار الزمن، والشركاء الموثوق بهم، والعملاء الذين يتم التعامل معهم مثل الأشخاص، وليس المعاملات.\" title_3=\"ما الذي يجعل الفرق\" body_3=\"يتم تدقيق الموردين بشكل مستقل، ويتم اختبار المنتجات يدويًا، وتوجد سياسة إرجاع بدون سبب لمدة 30 يومًا، مدعومة بفريق خدمة عملاء متخصص.\" title_4=\"التزامنا\" body_4=\"منتجات عالية الجودة وسلاسل توريد شفافة وظروف عمل عادلة - في كل طلب وفي كل مرة.\"][/image-accordion]\n[about-testimonials heading=\"ماذا يقول العملاء!\" subtitle=\"العملاء يحبون منتجاتنا، ونحن نسعى جاهدين لإرضائهم.\" quantity=\"2\" image_1=\"testimonials/tes-1.jpg\" name_1=\"إيما كولينز\" text_1=\"\\\"Totally obsessed with this outfit! The fit is perfect, the fabric feels premium, and I\'ve been getting compliments non-stop. It instantly lifts my confidence — such a great find!\\\"\" image_2=\"testimonials/tes-2.jpg\" name_2=\"صوفيا راميريز\" text_2=\"\\\"I\'m amazed by how comfortable yet stylish this piece is. It pairs effortlessly with everything, and the quality really stands out. Definitely becoming my go-to for everyday looks!\\\"\"][/about-testimonials]\n[about-team heading=\"تعرف على الفريق\" subtitle=\"محترفون ملتزمون بالإتقان في كل التفاصيل.\" quantity=\"4\" image_1=\"member/member-1.jpg\" name_1=\"أنيت بلاك\" role_1=\"المؤسس/الرئيس التنفيذي\" social_links_1=\"\" image_2=\"member/member-2.jpg\" name_2=\"بروكلين سيمونز\" role_2=\"يدير\" social_links_2=\"\" image_3=\"member/member-3.jpg\" name_3=\"جين كوبر\" role_3=\"مدير المبيعات\" social_links_3=\"\" image_4=\"member/member-4.jpg\" name_4=\"ليزا بونيت\" role_4=\"مدير المبيعات\" social_links_4=\"\"][/about-team]'),('ar',2,'اتصال','اتصل بفريق خدمة العملاء والتعاون في Amerce.',''),('ar',3,'FAQ','الأسئلة المتداولة حول الطلبات والشحن والمرتجعات وإدارة الحساب.','[page-banner heading=\"الأسئلة المتداولة\" subtitle=\"Got questions? We\'ve got answers! Browse our الأسئلة المتداولة to find information on orders, shipping,<br class=\\\"d-none d-lg-block\\\">returns, and more. If you need further assistance, feel free to contact our team.\"][/page-banner]\n[faq-page sidebar_image=\"section/banner-12.jpg\" sidebar_title=\"Save 25% <br class=\\\"d-none d-sm-block\\\">Today\" sidebar_subtitle=\"قمصان، هوديس وأكثر\" sidebar_cta=\"شاهد المزيد\" sidebar_url=\"/products\" quantity=\"16\" category_1=\"حسابي\" category_id_1=\"myAccount\" question_1=\"1. ماذا يمكنني أن أفعل إذا نسيت كلمة المرور الخاصة بي؟\" answer_1=\"Use the \\\"Forgot password\\\" link on the sign-in page. We will email you a one-time link to set a new password — it expires in 30 minutes for security.\" category_2=\"حسابي\" category_id_2=\"myAccount\" question_2=\"2. كيفية تحديث عنوان البريد الإلكتروني؟\" answer_2=\"قم بتسجيل الدخول، افتح الحساب → الإعدادات وقم بتغيير حقول البريد الإلكتروني. سنرسل رسالة تأكيد بالبريد الإلكتروني إلى العنوان الجديد؛ سيصبح التغيير ساري المفعول عندما تنقر على هذا الرابط.\" category_3=\"حسابي\" category_id_3=\"myAccount\" question_3=\"3. هل يمكنني حذف حسابي؟\" answer_3=\"يملك. من الحساب → الإعدادات، قم بالتمرير لأسفل إلى حذف الحساب. نحن نحتفظ بسجل الطلبات لأسباب ضريبية/قانونية، ولكن يتم حذف معلومات الاتصال الشخصية خلال 30 يومًا.\" category_4=\"الطلبات والتسوق\" category_id_4=\"ordersPurchases\" question_4=\"1. كيف تطلب؟\" answer_4=\"قم بإضافة المنتجات إلى سلة التسوق، ثم انقر فوق إتمام الطلب، ثم حدد طريقة الشحن، ثم أدخل معلومات الدفع. سوف تتلقى رسالة تأكيد الطلب عبر البريد الإلكتروني على الفور.\" category_5=\"الطلبات والتسوق\" category_id_5=\"ordersPurchases\" question_5=\"2. هل يمكنني تعديل أو إلغاء طلبي؟\" answer_5=\"يمكن تعديل الطلبات أو إلغاؤها من لوحة تحكم حسابك خلال ساعة واحدة من تقديمها. بعد ذلك بدأ المستودع بالتعبئة ولم نتمكن من التدخل.\" category_6=\"الطلبات والتسوق\" category_id_6=\"ordersPurchases\" question_6=\"3. ما هي طرق الدفع المقبولة؟\" answer_6=\"نحن نقبل Visa وMastercard وAmerican Express وApple Pay وGoogle Pay وPayPal. تستخدم جميع المعاملات تشفير TLS 1.3.\" category_7=\"العوائد والمبالغ المستردة\" category_id_7=\"returnsRefunds\" question_7=\"1. ما هي مدة الإرجاع؟\" answer_7=\"30 يومًا من تاريخ الاستلام للمنتجات غير المستخدمة وغير المستهلكة. لا ينطبق على سلع البيع والملابس الداخلية وعناصر البيع الفوري.\" category_8=\"العوائد والمبالغ المستردة\" category_id_8=\"returnsRefunds\" question_8=\"2. كيف أبدأ عملية الإرجاع؟\" answer_8=\"Open the order in your account dashboard and click \\\"Start return\\\". We email a prepaid label for domestic orders within one business day.\" category_9=\"العوائد والمبالغ المستردة\" category_id_9=\"returnsRefunds\" question_9=\"3. متى سأسترد أموالي؟\" answer_9=\"تتم معالجة المبالغ المستردة في غضون 3-5 أيام عمل من تاريخ استلامنا للمنتج المرتجع. قد تختلف أوقات الائتمان البنكي؛ يُرجى الانتظار لمدة تصل إلى 10 أيام عمل حتى تظهر دفعتك.\" category_10=\"الشحن والتتبع\" category_id_10=\"shippingTracking\" question_10=\"1. كم من الوقت يستغرق الشحن؟\" answer_10=\"يستغرق الشحن المحلي القياسي من 3 إلى 5 أيام عمل. الشحن السريع 1-2 أيام. يستغرق الشحن القياسي الدولي من 7 إلى 12 يوم عمل؛ تتوفر خيارات الشحن المعجل في صفحة الخروج.\" category_11=\"الشحن والتتبع\" category_id_11=\"shippingTracking\" question_11=\"2. كيفية تتبع الطلبات؟\" answer_11=\"يتم تضمين رابط التتبع في رسالة البريد الإلكتروني لتأكيد الشحن. يمكنك أيضًا عرض الحالة من الحساب → الطلبات → التتبع.\" category_12=\"الشحن والتتبع\" category_id_12=\"shippingTracking\" question_12=\"3. هل تشحن دوليًا؟\" answer_12=\"نعم – لمعظم البلدان. يتم دفع الضرائب والرسوم مسبقًا في صفحة الخروج لوجهات معينة؛ إذا لم يكن الأمر كذلك، يجوز لوحدة الشحن جمعها عند التسليم.\" category_13=\"الرسوم والمدفوعات\" category_id_13=\"feesBilling\" question_13=\"1. هل يشمل السعر الضرائب والرسوم؟\" answer_13=\"الأسعار المحلية تشمل ضريبة المبيعات الموضحة عند الخروج. تشمل الطلبات الدولية للوجهات المدعومة الضرائب والرسوم؛ وبخلاف ذلك، ستقوم وحدة الشحن باستلامها عند التسليم.\" category_14=\"الرسوم والمدفوعات\" category_id_14=\"feesBilling\" question_14=\"2. لماذا تم محاسبتي مرتين؟\" answer_14=\"ربما ترى تعليقًا للتفويض بالإضافة إلى الرسوم الفعلية. سيتم إلغاء الحجز تلقائيًا خلال 3-5 أيام عمل. أرسل بريدًا إلكترونيًا إلى billing@amerce.test إذا كنت لا تزال ترى رسومين بعد ذلك الوقت.\" category_15=\"موضوعات أخرى\" category_id_15=\"otherTopic\" question_15=\"1. هل لديك متجر فعلي؟\" answer_15=\"نعم — يرجى زيارة صفحة المتاجر للحصول على قائمة بالمتاجر الرئيسية والشركاء.\" category_16=\"موضوعات أخرى\" category_id_16=\"otherTopic\" question_16=\"2. كيفية الاتصال بخدمة العملاء؟\" answer_16=\"أرسل بريدًا إلكترونيًا إلى hello@amerce.test أو استخدم نموذج الاتصال. سوف نقوم بالرد خلال يوم عمل واحد.\"][/faq-page]'),('ar',4,'سياسة الخصوصية','كيف تقوم Amerce بجمع معلوماتك الشخصية واستخدامها وحمايتها.','[page-banner heading=\"سياسة الخصوصية\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. المعلومات التي نجمعها\" body_1=\"<p class=\\\"term-text cl-text-2\\\">When you visit the Site, we automatically collect certain information about your device — web browser, IP address, time zone, and some of the cookies installed on your device. As you browse, we also collect data about the pages or products you view, what referred you to the Site, and how you interact with it. We refer to this as \\\"Device Information\\\".</p><p class=\\\"term-text cl-text-2\\\">When you make a purchase or attempt to purchase through the Site, we collect your name, billing address, shipping address, and payment information (including card number, email address, and phone number). We refer to this as \\\"Order Information\\\".</p>\" title_2=\"2. كيف نستخدم معلوماتك\" body_2=\"<p class=\\\"term-text cl-text-2\\\">We use Order Information to fulfil orders placed through the Site (process payment, arrange shipping, provide invoices and order confirmations). We use it to communicate with you, screen orders for fraud, and — in line with your preferences — share marketing about products you may like.</p><p class=\\\"term-text cl-text-2\\\">We use Device Information to screen for fraud and to improve the Site through analytics about how customers browse and interact with us.</p>\" title_3=\"3. مشاركة معلوماتك الشخصية\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We share Personal Information with third-party service providers who help us run the Site. We may also share information to comply with applicable laws, respond to a subpoena or lawful request, or otherwise protect our rights.</p>\" title_4=\"4. تخزين البيانات\" body_4=\"<p class=\\\"term-text cl-text-2\\\">When you place an order, we maintain the Order Information for our records unless and until you ask us to delete it.</p>\" title_5=\"5. حقوقك\" body_5=\"<p class=\\\"term-text cl-text-2\\\">You can request access, correction, or deletion of any personal data we hold about you. Email privacy@amerce.test from the address on file and we will respond within 30 days.</p>\" title_6=\"6. ملفات تعريف الارتباط\" body_6=\"<p class=\\\"term-text cl-text-2\\\">Cookies are used to keep your cart between visits, remember your preferences, and measure aggregate traffic. You can disable cookies in your browser, though some Site features may stop working.</p>\" title_7=\"7. التغيير\" body_7=\"<p class=\\\"term-text cl-text-2\\\">We may update this policy from time to time to reflect changes to our practices or for operational, legal, or regulatory reasons. The latest version will always be on this page.</p>\"][/term-content]'),('ar',5,'الشروط والأحكام','تنطبق الشروط القانونية عند استخدام متجر Amerce.','[page-banner heading=\"الشروط والأحكام\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. قبول الشروط\" body_1=\"<p class=\\\"term-text cl-text-2\\\">By accessing or using the أميرس store you agree to these terms. We reserve the right to update them with reasonable notice; the latest version is always available on this page.</p>\" title_2=\"2. الطلبات والدفع\" body_2=\"<p class=\\\"term-text cl-text-2\\\">All prices are in USD unless otherwise stated. We accept the payment methods displayed at checkout. An order becomes binding once you receive an order confirmation email.</p>\" title_3=\"3. الشحن\" body_3=\"<p class=\\\"term-text cl-text-2\\\">ينقل options, lead times, and rates are listed on our ينقل page. Risk passes to you on delivery.</p>\" title_4=\"4. المرتجعات\" body_4=\"<p class=\\\"term-text cl-text-2\\\">You have 30 days from delivery to return any unworn item for a refund. See our العوائد والمبالغ المستردة page for the full process.</p>\" title_5=\"5. الملكية الفكرية\" body_5=\"<p class=\\\"term-text cl-text-2\\\">All content on the Site — text, photography, logos, code — is owned by أميرس or its licensors and may not be reproduced without written permission.</p>\" title_6=\"6. حدود المسؤولية\" body_6=\"<p class=\\\"term-text cl-text-2\\\">To the maximum extent permitted by law, أميرس is not liable for indirect or consequential damages arising from use of the Site or the products purchased through it.</p>\" title_7=\"7. القانون المعمول به\" body_7=\"<p class=\\\"term-text cl-text-2\\\">These terms are governed by the laws of the State of New York. Any dispute will be resolved in the state or federal courts located in New York County.</p>\"][/term-content]'),('ar',6,'العوائد والمبالغ المستردة','سياسة الإرجاع الخاصة بنا لمدة 30 يومًا وعملية الإرجاع خطوة بخطوة.','[page-banner heading=\"العوائد والمبالغ المستردة\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. المرتجعات\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We want you to be completely satisfied with your purchase. If for any reason you are not, you may return any unworn item within 30 days of receiving your order for a refund or exchange. أغراض must be in original packaging and the same condition as you received them.</p>\" title_2=\"2. كيف تبدأ عملية الإرجاع\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Open the order in your account dashboard and click \\\"Start return\\\", or email returns@amerce.test with your order number. We will send a prepaid return label for domestic orders within one business day.</p>\" title_3=\"3. استرداد الأموال\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Refunds are processed within 3-5 business days of us receiving the return and applied to the original payment method. Bank posting times vary; allow up to 10 business days for the credit to appear.</p>\" title_4=\"4. الاستثناءات\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Sale items, intimate apparel, and final-sale flash sale purchases are excluded from returns. Personalised or made-to-order items are also non-returnable unless faulty.</p>\" title_5=\"5. المنتجات التالفة أو المعيبة\" body_5=\"<p class=\\\"term-text cl-text-2\\\">If your order arrives damaged or faulty, email us within 7 days with photos. We will replace the item or issue a full refund — including any return shipping cost — at our expense.</p>\" title_6=\"6. العودة الدولية\" body_6=\"<p class=\\\"term-text cl-text-2\\\">International customers are responsible for return shipping unless the item is faulty. We do not refund original shipping or duty charges on international returns.</p>\"][/term-content]'),('ar',7,'شحن','طرق الشحن المحلي والدولي وأوقاته ورسومه.','[page-banner heading=\"ينقل\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. طريقة الشحن\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We offer the following shipping methods for domestic and international orders: standard ground, expedited 2-day, and priority overnight (where available).</p>\" title_2=\"2. الرسوم المحلية\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Standard ground is free on orders over $99. Express 1-2 day shipping is $19.99 flat. Priority overnight is calculated by weight at checkout.</p>\" title_3=\"3. الدولية\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We ship to most countries. International standard shipping is $24.99 with 7-12 business day delivery. Express options appear at checkout. Duties and taxes are pre-paid for select destinations; otherwise the courier collects them on delivery.</p>\" title_4=\"4. وقت المعالجة\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Orders placed before 2pm EST on business days ship the same day. Orders placed after 2pm or on weekends/holidays ship the next business day.</p>\" title_5=\"5. التتبع\" body_5=\"<p class=\\\"term-text cl-text-2\\\">A tracking link is included in your shipment confirmation email. You can also see live status from Account → Orders → Track.</p>\" title_6=\"6. الطلبات المفقودة أو المعلقة\" body_6=\"<p class=\\\"term-text cl-text-2\\\">If a tracking number has not updated for more than 7 business days, email shipping@amerce.test. We will open an investigation with the carrier and either refund or reship the order at our expense.</p>\"][/term-content]'),('ar',8,'متاجرنا','قم بزيارة Amerce مباشرة — المتاجر الرئيسية والشركاء في جميع أنحاء العالم.',''),('ar',9,'Blog','تعليمات الزي وقصص العلامات التجارية والمحتوى من وراء الكواليس من فريق تحرير Amerce.','<div class=\"container py-5\"><h1>مذكرة</h1><p>اكتشف أحدث قصصنا - أدلة الأسلوب، وأبرز المنتجات، وتحليل الاستدامة المتعمق والمزيد.</p></div>'),('ar',10,'وظائف','انضم إلى Amerce - المناصب المفتوحة والقيم الثقافية وفوائد الفريق.','<div class=\"container py-5\"><h1>التوظيف في Amerce</h1><p>نحن فريق صغير وموزع لبناء نموذج بيع بالتجزئة أكثر دقة. نقوم بالتوظيف عبر المنتجات والهندسة وسلسلة التوريد وتجربة العملاء.</p><p>يتم نشر الوظائف المفتوحة على صفحة LinkedIn الخاصة بالشركة. للتقديم، أرسل خطابًا قصيرًا واستأنفه إلى <a href=\"mailto:careers@amerce.test\">careers@amerce.test</a>.</p></div>'),('ar',11,'Sustainability','How Amerce sources responsibly and reduces its environmental footprint.','<div class=\"container py-5\"><h1>التنمية المستدامة في أمريكا</h1><p>كل منتج يحمل قصة. نحن نعمل مباشرة مع المصانع وورش العمل الحرفية، ونعطي الأولوية للمواد المعاد تدويرها والتي يمكن تتبعها، ونقوم بتغليف عبوات خالية من البلاستيك.</p><p>هدفنا لعام 2026: أن يكون لدى 90% من المواد سلسلة توريد تم التحقق منها وتقارير تأثير سنوية شفافة.</p></div>'),('ar',12,'الصفحة الرئيسية','Amerce — موطن لتجربة التجارة الإلكترونية المتنوعة.','[simple-slider key=\"home-hero\" style=\"style-baby\" is_autoplay=\"yes\" autoplay_speed=\"3000\" show_arrows=\"no\" show_dots=\"yes\" wrapper_class=\"pt-30 p-xl-0\" text_color=\"white\" button_style=\"pill-white\"][/simple-slider]\n[infinity-marquee style=\"style-1\" variant=\"policy\" background_class=\"\" spacing_class=\"flat-spacing\" use_container=\"yes\" clone_count=\"3\" quantity=\"4\" heading_1=\"شحن مجاني لجميع الطلبات التي تزيد قيمتها عن 20.00 دولارًا\" image_1=\"section/policy-1.jpg\" heading_2=\"إرجاع مجاني خلال 14 يومًا\" image_2=\"section/policy-2.jpg\" heading_3=\"شحن مجاني لجميع الطلبات التي تزيد قيمتها عن 20.00 دولارًا\" image_3=\"section/policy-3.jpg\" heading_4=\"إرجاع مجاني خلال 14 يومًا\" image_4=\"section/policy-4.jpg\"][/infinity-marquee]\n[categories-grid style=\"style-slider-wide-image\" spacing_class=\"themesFlat\" title=\"تسوق حسب الفئة\" subtitle=\"اكتشف الأساسيات الموثوقة لراحة وتغذية طفلك.\" limit=\"8\" show_count=\"yes\"][/categories-grid]\n[ecommerce-products style=\"style-tabs\" title=\"This Week&rsquo;s Highlights\" subtitle=\"اكتشف مستلزمات الأطفال المفضلة لدينا والتي تم اختيارها لتوفير الراحة والأمان والأناقة.\" source=\"latest\" limit=\"8\" items_per_row=\"4\" tab_labels=\"New|شائع|Sale|طفل|أطفال\" tab_sources=\"latest|best-seller|sale|featured|latest\" tab_nav_class_extra=\"style-2\" grid_rows=\"2\" product_wrapper_class=\"square\"][/ecommerce-products]\n[image-gallery style=\"style-paired-banner-side\" quantity=\"2\" image_1=\"section/banner-19.jpg\" link_1=\"/products\" title_1=\"القليل من المرح، وفورات كبيرة!\" description_1=\"خصم يصل إلى 50% على مستلزمات الأطفال التي لا غنى عنها\" button_text_1=\"عرض جميع المنتجات\" image_2=\"section/banner-20.jpg\" link_2=\"/products\" title_2=\"نتائج جديدة لابتسامة الأطفال\" description_2=\"ناعمة وآمنة وجاهزة لكل عناق.\" button_text_2=\"اكتشف الآن\"][/image-gallery]\n[ecommerce-products style=\"style-banner-carousel-side\" title=\"\" subtitle=\"\" custom_title=\"مفضلة الوالدين والطفل\" custom_subtitle=\"اكتشف الأساسيات الأكثر نعومة والأكثر تفضيلاً لعالمك الصغير.\" view_all_url=\"/products\" view_all_text=\"عرض جميع المنتجات\" banner_image=\"section/banner-21.jpg\" banner_subheading=\"الحب في كل التفاصيل الصغيرة\" banner_heading=\"الراحة والرعاية لطفلك\" banner_button_text=\"عرض جميع المنتجات\" banner_button_url=\"/products\" source=\"featured\" limit=\"6\" items_per_row=\"2\"][/ecommerce-products]\n[lookbook-hotspot style=\"style-bundle-slider\" title=\"مجموعة منتجات مثالية للطفل\" subtitle=\"تم اختيار المجموعة بعناية مع عناصر متميزة لا غنى عنها لطفلك، من أجل الراحة والجودة.\" image=\"section/banner-lookbook-6.jpg\" image_2=\"section/banner-lookbook-7.jpg\" quantity=\"4\" x_percent_1=\"32.5\" y_percent_1=\"61.2\" product_id_1=\"1\" column_1=\"1\" x_percent_2=\"61.7\" y_percent_2=\"51.8\" product_id_2=\"9\" column_2=\"1\" x_percent_3=\"32.5\" y_percent_3=\"61.2\" product_id_3=\"2\" column_3=\"2\" x_percent_4=\"61.7\" y_percent_4=\"51.8\" product_id_4=\"10\" column_4=\"2\"][/lookbook-hotspot]\n[testimonials style=\"style-v2-product\" card_type=\"type-2\" title=\"محبوب من قبل الآباء السعداء\" subtitle=\"قصص حقيقية من أمهات وآباء يثقون بنا لرعاية أطفالهم.\" autoplay=\"yes\" limit=\"4\" view_all_url=\"/products\" view_all_text=\"عرض جميع المنتجات\" testimonial_product_ids=\"1,9,10,3\"][/testimonials]\n[blog-posts style=\"style-slider\" title=\"قصص للآباء المعاصرين\" subtitle=\"أفكار ثاقبة وإلهام يومي لتربية الملائكة الصغار السعداء.\" limit=\"6\" show_meta=\"yes\" show_excerpt=\"yes\"][/blog-posts]\n[image-gallery style=\"style-default\" skip_spacing=\"yes\" title=\"التسوق على انستغرام\" subtitle=\"قم بترقية خزانة ملابسك باكتشافات جديدة اليوم!\" quantity=\"5\" image_1=\"gallery/gallery-17.jpg\" link_1=\"/products\" image_2=\"gallery/gallery-18.jpg\" link_2=\"/products\" image_3=\"gallery/gallery-19.jpg\" link_3=\"/products\" image_4=\"gallery/gallery-20.jpg\" link_4=\"/products\" image_5=\"gallery/gallery-21.jpg\" link_5=\"/products\"][/image-gallery]'),('fr',1,'À propos','Présentation d\'Amerce - histoire de la marque, normes d\'approvisionnement et équipe derrière chaque produit.','[page-banner heading=\"À propos de nous\" subtitle=\"With over 15 years of experience, we craft timeless collections that transcend<br class=\\\"d-none d-lg-block\\\">trends and inspire lasting elegance.\"][/page-banner]\n[stats-counter hero_image=\"section/s-contact-1.jpg\" heading=\"Le design, l’attention aux détails et l’efficacité plaisent au monde\" description=\"De sa conception jusqu\'à son port, chacun de nos produits suit ce voyage. Nous pouvons le faire à un rythme plus rapide. Cependant, chez Amerce, nous choisissons de prendre soin de tous ceux qui font ce voyage avec nous.\" quantity=\"4\" value_1=\"8.2k\" animate_to_1=\"\" suffix_1=\"\" label_1=\"Produits existants\" desc_1=\"Nous proposons une variété de produits de haute qualité pour répondre à tous les besoins.\" value_2=\"\" animate_to_2=\"10\" suffix_2=\"k\" label_2=\"Clients satisfaits\" desc_2=\"Au service de plus de 10 000 clients satisfaits qui nous font confiance pour la qualité et le service.\" value_3=\"\" animate_to_3=\"96\" suffix_3=\"\" label_3=\"Marque partenaire\" desc_3=\"Les partenariats avec de grandes marques apportent des collections de confiance dans votre magasin et chez vous.\" value_4=\"\" animate_to_4=\"16\" suffix_4=\"k\" label_4=\"Produits à vendre\" desc_4=\"C\'est pourquoi nous nous efforçons de proposer une variété de gammes de produits, adaptées à chaque style.\"][/stats-counter]\n[image-accordion image=\"section/s-contact-2.jpg\" heading=\"Apporter des objets rares et exquis dans le monde entier\" quantity=\"4\" title_1=\"Introduire\" body_1=\"Bienvenue chez Amerce Store, votre destination privilégiée pour la mode et les accessoires avant-gardistes. Nous sommes fiers d\'offrir une collection soigneusement sélectionnée de pièces rares et exquises recherchées tant au niveau national qu\'international.\" title_2=\"Notre vision\" body_2=\"Nous visons un monde où le design sophistiqué se mêle à la vie quotidienne : des produits qui résistent à l\'épreuve du temps, des partenaires de confiance et des clients traités comme des personnes et non comme des transactions.\" title_3=\"Ce qui fait la différence\" body_3=\"Les fournisseurs sont audités de manière indépendante, les produits sont testés manuellement et il existe une politique de retour sans motif de 30 jours, soutenue par une équipe de service client dédiée.\" title_4=\"Notre engagement\" body_4=\"Des produits de qualité, des chaînes d\'approvisionnement transparentes et des conditions de travail équitables : à chaque commande, à chaque fois.\"][/image-accordion]\n[about-testimonials heading=\"Ce que disent les clients !\" subtitle=\"Les clients aiment nos produits et nous nous efforçons de leur plaire.\" quantity=\"2\" image_1=\"testimonials/tes-1.jpg\" name_1=\"Emma Collins\" text_1=\"\\\"Totally obsessed with this outfit! The fit is perfect, the fabric feels premium, and I\'ve been getting compliments non-stop. It instantly lifts my confidence — such a great find!\\\"\" image_2=\"testimonials/tes-2.jpg\" name_2=\"Sophie Ramírez\" text_2=\"\\\"I\'m amazed by how comfortable yet stylish this piece is. It pairs effortlessly with everything, and the quality really stands out. Definitely becoming my go-to for everyday looks!\\\"\"][/about-testimonials]\n[about-team heading=\"Rencontrez l\'équipe\" subtitle=\"Des professionnels dédiés à la perfection dans les moindres détails.\" quantity=\"4\" image_1=\"member/member-1.jpg\" name_1=\"Annette Noir\" role_1=\"Fondateur/PDG\" social_links_1=\"\" image_2=\"member/member-2.jpg\" name_2=\"Brooklyn Simmons\" role_2=\"Gérer\" social_links_2=\"\" image_3=\"member/member-3.jpg\" name_3=\"Jane Cooper\" role_3=\"Directeur des ventes\" social_links_3=\"\" image_4=\"member/member-4.jpg\" name_4=\"Lisa Bonet\" role_4=\"Directeur des ventes\" social_links_4=\"\"][/about-team]'),('fr',2,'Contact','Contactez l\'équipe de service client et de coopération d\'Amerce.',''),('fr',3,'FAQ','Questions fréquemment posées sur les commandes, l\'expédition, les retours et la gestion des comptes.','[page-banner heading=\"Foire aux questions\" subtitle=\"Got questions? We\'ve got answers! Browse our Foire aux questions to find information on orders, shipping,<br class=\\\"d-none d-lg-block\\\">returns, and more. If you need further assistance, feel free to contact our team.\"][/page-banner]\n[faq-page sidebar_image=\"section/banner-12.jpg\" sidebar_title=\"Save 25% <br class=\\\"d-none d-sm-block\\\">Today\" sidebar_subtitle=\"T-shirts, sweats à capuche et plus\" sidebar_cta=\"Voir plus\" sidebar_url=\"/products\" quantity=\"16\" category_1=\"Mon compte\" category_id_1=\"myAccount\" question_1=\"1. Que puis-je faire si j\'oublie mon mot de passe ?\" answer_1=\"Use the \\\"Forgot password\\\" link on the sign-in page. We will email you a one-time link to set a new password — it expires in 30 minutes for security.\" category_2=\"Mon compte\" category_id_2=\"myAccount\" question_2=\"2. Comment mettre à jour l\'adresse e-mail ?\" answer_2=\"Connectez-vous, ouvrez Compte → Paramètres et modifiez les champs de courrier électronique. Nous enverrons un e-mail de confirmation à la nouvelle adresse ; Le changement prendra effet lorsque vous cliquerez sur ce lien.\" category_3=\"Mon compte\" category_id_3=\"myAccount\" question_3=\"3. Puis-je supprimer mon compte ?\" answer_3=\"Avoir. Dans Compte → Paramètres, faites défiler jusqu\'à Supprimer le compte. Nous conservons l\'historique des commandes pour des raisons fiscales/légales, mais les coordonnées personnelles sont supprimées dans les 30 jours.\" category_4=\"Commandes et achats\" category_id_4=\"ordersPurchases\" question_4=\"1. Comment commander ?\" answer_4=\"Ajoutez des produits au panier, cliquez sur Commander, sélectionnez le mode d\'expédition, puis saisissez les informations de paiement. Vous recevrez immédiatement un e-mail de confirmation de commande.\" category_5=\"Commandes et achats\" category_id_5=\"ordersPurchases\" question_5=\"2. Puis-je modifier ou annuler ma commande ?\" answer_5=\"Les commandes peuvent être modifiées ou annulées à partir du tableau de bord de votre compte dans l\'heure suivant leur passation. Après cela, l\'entrepôt a commencé à emballer et nous n\'avons pas pu intervenir.\" category_6=\"Commandes et achats\" category_id_6=\"ordersPurchases\" question_6=\"3. Quels modes de paiement sont acceptés ?\" answer_6=\"Nous acceptons Visa, Mastercard, American Express, Apple Pay, Google Pay et PayPal. Toutes les transactions utilisent le cryptage TLS 1.3.\" category_7=\"Retours et remboursements\" category_id_7=\"returnsRefunds\" question_7=\"1. Quelle est la durée du délai de retour ?\" answer_7=\"30 jours à compter de la date de réception pour les produits non utilisés et non portés. Non applicable aux articles soldés, aux sous-vêtements et aux articles en vente flash en vente finale.\" category_8=\"Retours et remboursements\" category_id_8=\"returnsRefunds\" question_8=\"2. Comment démarrer le processus de retour ?\" answer_8=\"Open the order in your account dashboard and click \\\"Start return\\\". We email a prepaid label for domestic orders within one business day.\" category_9=\"Retours et remboursements\" category_id_9=\"returnsRefunds\" question_9=\"3. Quand recevrai-je mon remboursement ?\" answer_9=\"Les remboursements sont traités dans les 3 à 5 jours ouvrables à compter de la réception de l\'article retourné. Les délais de crédit bancaire peuvent varier ; Veuillez prévoir jusqu\'à 10 jours ouvrables pour voir votre paiement reflété.\" category_10=\"Expédition et suivi\" category_id_10=\"shippingTracking\" question_10=\"1. Combien de temps prend l’expédition ?\" answer_10=\"L\'expédition nationale standard prend 3 à 5 jours ouvrables. Expédition rapide 1-2 jours. L\'expédition standard internationale prend 7 à 12 jours ouvrables ; Des options d\'expédition accélérée sont disponibles sur la page de paiement.\" category_11=\"Expédition et suivi\" category_id_11=\"shippingTracking\" question_11=\"2. Comment suivre les commandes ?\" answer_11=\"Le lien de suivi est inclus dans l\'e-mail de confirmation d\'expédition. Vous pouvez également afficher le statut depuis Compte → Commandes → Suivi.\" category_12=\"Expédition et suivi\" category_id_12=\"shippingTracking\" question_12=\"3. Expédiez-vous à l’international ?\" answer_12=\"Oui, dans la plupart des pays. Les taxes et frais sont prépayés sur la page de paiement pour certaines destinations ; Dans le cas contraire, l\'unité d\'expédition pourra le récupérer à la livraison.\" category_13=\"Frais et paiements\" category_id_13=\"feesBilling\" question_13=\"1. Les taxes et frais sont-ils inclus ?\" answer_13=\"Les prix nationaux incluent la taxe de vente indiquée au moment du paiement. Les commandes internationales vers les destinations prises en charge incluent les taxes et les frais ; Dans le cas contraire, l\'unité d\'expédition le récupérera à la livraison.\" category_14=\"Frais et paiements\" category_id_14=\"feesBilling\" question_14=\"2. Pourquoi ai-je été facturé deux fois ?\" answer_14=\"Vous voyez peut-être une autorisation retenue avec le montant réel des frais. La retenue sera automatiquement annulée dans un délai de 3 à 5 jours ouvrables. Envoyez un e-mail à billing@amerce.test si vous voyez toujours deux frais après cette heure.\" category_15=\"Autres sujets\" category_id_15=\"otherTopic\" question_15=\"1. Avez-vous un magasin physique ?\" answer_15=\"Oui, veuillez visiter la page Magasins pour une liste des principaux magasins et partenaires.\" category_16=\"Autres sujets\" category_id_16=\"otherTopic\" question_16=\"2. Comment contacter le service client ?\" answer_16=\"Envoyez un e-mail à hello@amerce.test ou utilisez le formulaire de contact. Nous vous répondrons dans un délai d\'un jour ouvrable.\"][/faq-page]'),('fr',4,'politique de confidentialité','Comment Amerce collecte, utilise et protège vos informations personnelles.','[page-banner heading=\"politique de confidentialité\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Informations que nous collectons\" body_1=\"<p class=\\\"term-text cl-text-2\\\">When you visit the Site, we automatically collect certain information about your device — web browser, IP address, time zone, and some of the cookies installed on your device. As you browse, we also collect data about the pages or products you view, what referred you to the Site, and how you interact with it. We refer to this as \\\"Device Information\\\".</p><p class=\\\"term-text cl-text-2\\\">When you make a purchase or attempt to purchase through the Site, we collect your name, billing address, shipping address, and payment information (including card number, email address, and phone number). We refer to this as \\\"Order Information\\\".</p>\" title_2=\"2. Comment nous utilisons vos informations\" body_2=\"<p class=\\\"term-text cl-text-2\\\">We use Order Information to fulfil orders placed through the Site (process payment, arrange shipping, provide invoices and order confirmations). We use it to communicate with you, screen orders for fraud, and — in line with your preferences — share marketing about products you may like.</p><p class=\\\"term-text cl-text-2\\\">We use Device Information to screen for fraud and to improve the Site through analytics about how customers browse and interact with us.</p>\" title_3=\"3. Partage de vos informations personnelles\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We share Personal Information with third-party service providers who help us run the Site. We may also share information to comply with applicable laws, respond to a subpoena or lawful request, or otherwise protect our rights.</p>\" title_4=\"4. Stockage des données\" body_4=\"<p class=\\\"term-text cl-text-2\\\">When you place an order, we maintain the Order Information for our records unless and until you ask us to delete it.</p>\" title_5=\"5. Vos droits\" body_5=\"<p class=\\\"term-text cl-text-2\\\">You can request access, correction, or deletion of any personal data we hold about you. Email privacy@amerce.test from the address on file and we will respond within 30 days.</p>\" title_6=\"6. Cookies\" body_6=\"<p class=\\\"term-text cl-text-2\\\">Cookies are used to keep your cart between visits, remember your preferences, and measure aggregate traffic. You can disable cookies in your browser, though some Site features may stop working.</p>\" title_7=\"7. Changement\" body_7=\"<p class=\\\"term-text cl-text-2\\\">We may update this policy from time to time to reflect changes to our practices or for operational, legal, or regulatory reasons. The latest version will always be on this page.</p>\"][/term-content]'),('fr',5,'Conditions générales','Les conditions légales s\'appliquent lorsque vous utilisez la boutique Amerce.','[page-banner heading=\"Conditions générales\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Acceptation des conditions\" body_1=\"<p class=\\\"term-text cl-text-2\\\">By accessing or using the Amérique store you agree to these terms. We reserve the right to update them with reasonable notice; the latest version is always available on this page.</p>\" title_2=\"2. Commandes et paiement\" body_2=\"<p class=\\\"term-text cl-text-2\\\">All prices are in USD unless otherwise stated. We accept the payment methods displayed at checkout. An order becomes binding once you receive an order confirmation email.</p>\" title_3=\"3. Expédition\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Transport options, lead times, and rates are listed on our Transport page. Risk passes to you on delivery.</p>\" title_4=\"4. Retours\" body_4=\"<p class=\\\"term-text cl-text-2\\\">You have 30 days from delivery to return any unworn item for a refund. See our Retours et remboursements page for the full process.</p>\" title_5=\"5. Propriété intellectuelle\" body_5=\"<p class=\\\"term-text cl-text-2\\\">All content on the Site — text, photography, logos, code — is owned by Amérique or its licensors and may not be reproduced without written permission.</p>\" title_6=\"6. Limitation de responsabilité\" body_6=\"<p class=\\\"term-text cl-text-2\\\">To the maximum extent permitted by law, Amérique is not liable for indirect or consequential damages arising from use of the Site or the products purchased through it.</p>\" title_7=\"7. Loi applicable\" body_7=\"<p class=\\\"term-text cl-text-2\\\">These terms are governed by the laws of the State of New York. Any dispute will be resolved in the state or federal courts located in New York County.</p>\"][/term-content]'),('fr',6,'Retours et remboursements','Notre politique de retour de 30 jours et notre processus de retour étape par étape.','[page-banner heading=\"Retours et remboursements\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Retours\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We want you to be completely satisfied with your purchase. If for any reason you are not, you may return any unworn item within 30 days of receiving your order for a refund or exchange. Articles must be in original packaging and the same condition as you received them.</p>\" title_2=\"2. Comment démarrer un retour\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Open the order in your account dashboard and click \\\"Start return\\\", or email returns@amerce.test with your order number. We will send a prepaid return label for domestic orders within one business day.</p>\" title_3=\"3. Remboursement\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Refunds are processed within 3-5 business days of us receiving the return and applied to the original payment method. Bank posting times vary; allow up to 10 business days for the credit to appear.</p>\" title_4=\"4. Exclusions\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Sale items, intimate apparel, and final-sale flash sale purchases are excluded from returns. Personalised or made-to-order items are also non-returnable unless faulty.</p>\" title_5=\"5. Produits endommagés ou défectueux\" body_5=\"<p class=\\\"term-text cl-text-2\\\">If your order arrives damaged or faulty, email us within 7 days with photos. We will replace the item or issue a full refund — including any return shipping cost — at our expense.</p>\" title_6=\"6. Retours internationaux\" body_6=\"<p class=\\\"term-text cl-text-2\\\">International customers are responsible for return shipping unless the item is faulty. We do not refund original shipping or duty charges on international returns.</p>\"][/term-content]'),('fr',7,'Expédition','Méthodes, délais et frais d\'expédition nationaux et internationaux.','[page-banner heading=\"Transport\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Méthode d\'expédition\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We offer the following shipping methods for domestic and international orders: standard ground, expedited 2-day, and priority overnight (where available).</p>\" title_2=\"2. Frais nationaux\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Standard ground is free on orders over $99. Express 1-2 day shipping is $19.99 flat. Priority overnight is calculated by weight at checkout.</p>\" title_3=\"3. Internationale\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We ship to most countries. International standard shipping is $24.99 with 7-12 business day delivery. Express options appear at checkout. Duties and taxes are pre-paid for select destinations; otherwise the courier collects them on delivery.</p>\" title_4=\"4. Délai de traitement\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Orders placed before 2pm EST on business days ship the same day. Orders placed after 2pm or on weekends/holidays ship the next business day.</p>\" title_5=\"5. Suivi\" body_5=\"<p class=\\\"term-text cl-text-2\\\">A tracking link is included in your shipment confirmation email. You can also see live status from Account → Orders → Track.</p>\" title_6=\"6. Commandes perdues ou bloquées\" body_6=\"<p class=\\\"term-text cl-text-2\\\">If a tracking number has not updated for more than 7 business days, email shipping@amerce.test. We will open an investigation with the carrier and either refund or reship the order at our expense.</p>\"][/term-content]'),('fr',8,'Nos magasins','Visitez Amerce directement – ​​magasins phares et partenaires dans le monde entier.',''),('fr',9,'Blog','Instructions de tenue, histoires de marque et contenu en coulisses de l\'équipe éditoriale d\'Amerce.','<div class=\"container py-5\"><h1>Agenda</h1><p>Découvrez nos dernières histoires : guides de style, produits phares, analyse approfondie de la durabilité et bien plus encore.</p></div>'),('fr',10,'Carrières','Rejoignez Amerce - postes ouverts, valeurs culturelles et avantages d\'équipe.','<div class=\"container py-5\"><h1>Recrutement chez Amerce</h1><p>Nous sommes une petite équipe distribuée construisant un modèle de vente au détail plus raffiné. Nous recrutons dans les domaines des produits, de l\'ingénierie, de la chaîne d\'approvisionnement et de l\'expérience client.</p><p>Les postes vacants sont publiés sur la page LinkedIn de l\'entreprise. Pour postuler, envoyez une courte lettre et un curriculum vitae à <a href=\"mailto:careers@amerce.test\">careers@amerce.test</a>.</p></div>'),('fr',11,'Sustainability','How Amerce sources responsibly and reduces its environmental footprint.','<div class=\"container py-5\"><h1>Développement durable en Amérique</h1><p>Chaque produit porte une histoire. Nous travaillons directement avec des usines et des ateliers d\'artisans, priorisons les matériaux recyclés et traçables et emballons sans plastique.</p><p>Notre objectif 2026 : 90 % des matériaux disposent d\'une chaîne d\'approvisionnement vérifiée et d\'un rapport d\'impact annuel transparent.</p></div>'),('fr',12,'Page d\'accueil','Amerce – abrite une expérience de commerce électronique polyvalente.','[simple-slider key=\"home-hero\" style=\"style-baby\" is_autoplay=\"yes\" autoplay_speed=\"3000\" show_arrows=\"no\" show_dots=\"yes\" wrapper_class=\"pt-30 p-xl-0\" text_color=\"white\" button_style=\"pill-white\"][/simple-slider]\n[infinity-marquee style=\"style-1\" variant=\"policy\" background_class=\"\" spacing_class=\"flat-spacing\" use_container=\"yes\" clone_count=\"3\" quantity=\"4\" heading_1=\"Livraison gratuite sur toutes les commandes de plus de 20,00 $\" image_1=\"section/policy-1.jpg\" heading_2=\"Retours gratuits sous 14 jours\" image_2=\"section/policy-2.jpg\" heading_3=\"Livraison gratuite sur toutes les commandes de plus de 20,00 $\" image_3=\"section/policy-3.jpg\" heading_4=\"Retours gratuits sous 14 jours\" image_4=\"section/policy-4.jpg\"][/infinity-marquee]\n[categories-grid style=\"style-slider-wide-image\" spacing_class=\"themesFlat\" title=\"Acheter par catégorie\" subtitle=\"Découvrez des essentiels fiables pour réconforter et nourrir votre bébé.\" limit=\"8\" show_count=\"yes\"][/categories-grid]\n[ecommerce-products style=\"style-tabs\" title=\"This Week&rsquo;s Highlights\" subtitle=\"Découvrez nos essentiels pour bébé les plus appréciés, choisis pour leur confort, leur sécurité et leur style.\" source=\"latest\" limit=\"8\" items_per_row=\"4\" tab_labels=\"New|Populaire|Sale|Bébé|Enfants\" tab_sources=\"latest|best-seller|sale|featured|latest\" tab_nav_class_extra=\"style-2\" grid_rows=\"2\" product_wrapper_class=\"square\"][/ecommerce-products]\n[image-gallery style=\"style-paired-banner-side\" quantity=\"2\" image_1=\"section/banner-19.jpg\" link_1=\"/products\" title_1=\"Petit plaisir, grosses économies !\" description_1=\"Jusqu\'à 50% de réduction sur les articles indispensables pour bébé\" button_text_1=\"Voir tous les produits\" image_2=\"section/banner-20.jpg\" link_2=\"/products\" title_2=\"De nouvelles découvertes pour les sourires des enfants\" description_2=\"Doux, sûr et prêt pour chaque câlin.\" button_text_2=\"Explorez maintenant\"][/image-gallery]\n[ecommerce-products style=\"style-banner-carousel-side\" title=\"\" subtitle=\"\" custom_title=\"Favoris des parents et des bébés\" custom_subtitle=\"Découvrez les essentiels les plus doux et les plus appréciés pour votre petit monde.\" view_all_url=\"/products\" view_all_text=\"Voir tous les produits\" banner_image=\"section/banner-21.jpg\" banner_subheading=\"L\'AMOUR DANS CHAQUE PETIT DÉTAIL\" banner_heading=\"Confort et soins pour votre bébé\" banner_button_text=\"Voir tous les produits\" banner_button_url=\"/products\" source=\"featured\" limit=\"6\" items_per_row=\"2\"][/ecommerce-products]\n[lookbook-hotspot style=\"style-bundle-slider\" title=\"Ensemble de produits parfait pour bébé\" subtitle=\"La collection est soigneusement sélectionnée avec des articles premium et indispensables pour votre bébé, pour le confort et la qualité.\" image=\"section/banner-lookbook-6.jpg\" image_2=\"section/banner-lookbook-7.jpg\" quantity=\"4\" x_percent_1=\"32.5\" y_percent_1=\"61.2\" product_id_1=\"1\" column_1=\"1\" x_percent_2=\"61.7\" y_percent_2=\"51.8\" product_id_2=\"9\" column_2=\"1\" x_percent_3=\"32.5\" y_percent_3=\"61.2\" product_id_3=\"2\" column_3=\"2\" x_percent_4=\"61.7\" y_percent_4=\"51.8\" product_id_4=\"10\" column_4=\"2\"][/lookbook-hotspot]\n[testimonials style=\"style-v2-product\" card_type=\"type-2\" title=\"Aimé par des parents heureux\" subtitle=\"Des histoires vraies de mamans et de papas qui nous font confiance pour prendre soin de leurs bébés.\" autoplay=\"yes\" limit=\"4\" view_all_url=\"/products\" view_all_text=\"Voir tous les produits\" testimonial_product_ids=\"1,9,10,3\"][/testimonials]\n[blog-posts style=\"style-slider\" title=\"Histoires pour les parents modernes\" subtitle=\"Des idées perspicaces et une inspiration quotidienne pour élever des petits anges heureux.\" limit=\"6\" show_meta=\"yes\" show_excerpt=\"yes\"][/blog-posts]\n[image-gallery style=\"style-default\" skip_spacing=\"yes\" title=\"Faire du shopping sur Instagram\" subtitle=\"Améliorez votre garde-robe avec de nouvelles trouvailles dès aujourd\'hui !\" quantity=\"5\" image_1=\"gallery/gallery-17.jpg\" link_1=\"/products\" image_2=\"gallery/gallery-18.jpg\" link_2=\"/products\" image_3=\"gallery/gallery-19.jpg\" link_3=\"/products\" image_4=\"gallery/gallery-20.jpg\" link_4=\"/products\" image_5=\"gallery/gallery-21.jpg\" link_5=\"/products\"][/image-gallery]'),('id',1,'Tentang','Memperkenalkan Amerce — kisah merek, standar pasokan, dan tim di balik setiap produk.','[page-banner heading=\"Tentang Kami\" subtitle=\"With over 15 years of experience, we craft timeless collections that transcend<br class=\\\"d-none d-lg-block\\\">trends and inspire lasting elegance.\"][/page-banner]\n[stats-counter hero_image=\"section/s-contact-1.jpg\" heading=\"Desain, perhatian terhadap detail dan efisiensi menyenangkan dunia\" description=\"Dari saat dirancang hingga dipakai, setiap produk kami mengikuti perjalanan ini. Kita bisa melakukannya dengan lebih cepat. Namun, di Amerce, kami memilih untuk menjaga semua orang yang melakukan perjalanan bersama kami.\" quantity=\"4\" value_1=\"8.2k\" animate_to_1=\"\" suffix_1=\"\" label_1=\"Produk yang Ada\" desc_1=\"Kami menawarkan berbagai produk berkualitas tinggi untuk memenuhi setiap kebutuhan.\" value_2=\"\" animate_to_2=\"10\" suffix_2=\"k\" label_2=\"Pelanggan yang Puas\" desc_2=\"Melayani lebih dari 10.000 pelanggan yang puas dan mempercayai kami untuk kualitas dan layanan.\" value_3=\"\" animate_to_3=\"96\" suffix_3=\"\" label_3=\"Merek Mitra\" desc_3=\"Kemitraan dengan merek terkemuka menghadirkan koleksi tepercaya ke toko dan rumah Anda.\" value_4=\"\" animate_to_4=\"16\" suffix_4=\"k\" label_4=\"Produk Dijual\" desc_4=\"Itu sebabnya kami berusaha menghadirkan beragam lini produk, cocok untuk setiap gaya.\"][/stats-counter]\n[image-accordion image=\"section/s-contact-2.jpg\" heading=\"Membawa Barang Langka dan Indah ke Seluruh Dunia\" quantity=\"4\" title_1=\"Memperkenalkan\" body_1=\"Selamat datang di Amerce Store, tujuan utama Anda untuk fashion dan aksesoris penentu tren. Kami bangga menawarkan koleksi barang langka dan indah yang dipilih dengan cermat yang dicari baik secara nasional maupun internasional.\" title_2=\"Visi kami\" body_2=\"Kami bertujuan untuk mewujudkan dunia di mana desain canggih berpadu dengan kehidupan sehari-hari — produk yang bertahan dalam ujian waktu, mitra yang tepercaya, dan pelanggan yang diperlakukan seperti manusia, bukan transaksi.\" title_3=\"Apa yang Membuat Perbedaan\" body_3=\"Pemasok diaudit secara independen, produk diuji secara manual, dan terdapat kebijakan pengembalian tanpa alasan selama 30 hari, yang didukung oleh tim layanan pelanggan khusus.\" title_4=\"Komitmen kami\" body_4=\"Produk berkualitas, rantai pasokan yang transparan, dan kondisi tenaga kerja yang adil — setiap pesanan, setiap saat.\"][/image-accordion]\n[about-testimonials heading=\"Apa Kata Pelanggan!\" subtitle=\"Pelanggan menyukai produk kami, dan kami berusaha menyenangkan mereka.\" quantity=\"2\" image_1=\"testimonials/tes-1.jpg\" name_1=\"Emma Collins\" text_1=\"\\\"Totally obsessed with this outfit! The fit is perfect, the fabric feels premium, and I\'ve been getting compliments non-stop. It instantly lifts my confidence — such a great find!\\\"\" image_2=\"testimonials/tes-2.jpg\" name_2=\"Sophia Ramirez\" text_2=\"\\\"I\'m amazed by how comfortable yet stylish this piece is. It pairs effortlessly with everything, and the quality really stands out. Definitely becoming my go-to for everyday looks!\\\"\"][/about-testimonials]\n[about-team heading=\"Temui Tim\" subtitle=\"Profesional yang berdedikasi pada kesempurnaan dalam setiap detail.\" quantity=\"4\" image_1=\"member/member-1.jpg\" name_1=\"Annette Hitam\" role_1=\"Pendiri/CEO\" social_links_1=\"\" image_2=\"member/member-2.jpg\" name_2=\"Brooklyn Simmons\" role_2=\"Mengelola\" social_links_2=\"\" image_3=\"member/member-3.jpg\" name_3=\"Jane Cooper\" role_3=\"Direktur Penjualan\" social_links_3=\"\" image_4=\"member/member-4.jpg\" name_4=\"Lisa Bonet\" role_4=\"Direktur Penjualan\" social_links_4=\"\"][/about-team]'),('id',2,'Kontak','Hubungi tim layanan pelanggan dan kerja sama Amerce.',''),('id',3,'FAQ','Pertanyaan yang sering diajukan tentang pesanan, pengiriman, pengembalian, dan manajemen akun.','[page-banner heading=\"Pertanyaan yang Sering Diajukan\" subtitle=\"Got questions? We\'ve got answers! Browse our Pertanyaan yang Sering Diajukan to find information on orders, shipping,<br class=\\\"d-none d-lg-block\\\">returns, and more. If you need further assistance, feel free to contact our team.\"][/page-banner]\n[faq-page sidebar_image=\"section/banner-12.jpg\" sidebar_title=\"Save 25% <br class=\\\"d-none d-sm-block\\\">Today\" sidebar_subtitle=\"T-Shirt, Hoodie, dan Lainnya\" sidebar_cta=\"Lihat Lebih Banyak\" sidebar_url=\"/products\" quantity=\"16\" category_1=\"Akun Saya\" category_id_1=\"myAccount\" question_1=\"1. Apa yang dapat saya lakukan jika saya lupa kata sandi?\" answer_1=\"Use the \\\"Forgot password\\\" link on the sign-in page. We will email you a one-time link to set a new password — it expires in 30 minutes for security.\" category_2=\"Akun Saya\" category_id_2=\"myAccount\" question_2=\"2. Bagaimana cara memperbarui alamat email?\" answer_2=\"Masuk, buka Akun → Pengaturan dan ubah bidang email. Kami akan mengirimkan email konfirmasi ke alamat baru; Perubahan akan berlaku ketika Anda mengeklik tautan itu.\" category_3=\"Akun Saya\" category_id_3=\"myAccount\" question_3=\"3. Bisakah saya menghapus akun saya?\" answer_3=\"Memiliki. Dari Akun → Pengaturan, gulir ke bawah ke Hapus akun. Kami menyimpan riwayat pesanan karena alasan pajak/hukum, tetapi informasi kontak pribadi akan dihapus dalam waktu 30 hari.\" category_4=\"Pemesanan & Belanja\" category_id_4=\"ordersPurchases\" question_4=\"1. Bagaimana cara memesannya?\" answer_4=\"Tambahkan produk ke keranjang, klik checkout, pilih metode pengiriman, lalu masukkan informasi pembayaran. Anda akan segera menerima email konfirmasi pesanan.\" category_5=\"Pemesanan & Belanja\" category_id_5=\"ordersPurchases\" question_5=\"2. Bisakah saya mengedit atau membatalkan pesanan saya?\" answer_5=\"Pesanan dapat diedit atau dibatalkan dari dasbor akun Anda dalam waktu 1 jam setelah penempatan. Setelah itu, gudang mulai berkemas dan kami tidak bisa campur tangan.\" category_6=\"Pemesanan & Belanja\" category_id_6=\"ordersPurchases\" question_6=\"3. Metode pembayaran apa yang diterima?\" answer_6=\"Kami menerima Visa, Mastercard, American Express, Apple Pay, Google Pay, dan PayPal. Semua transaksi menggunakan enkripsi TLS 1.3.\" category_7=\"Pengembalian & Pengembalian Dana\" category_id_7=\"returnsRefunds\" question_7=\"1. Berapa lama periode pengembaliannya?\" answer_7=\"30 hari sejak tanggal penerimaan untuk produk yang belum terpakai dan belum dipakai. Tidak berlaku untuk item sale, pakaian dalam, dan item flash sale penjualan akhir.\" category_8=\"Pengembalian & Pengembalian Dana\" category_id_8=\"returnsRefunds\" question_8=\"2. Bagaimana cara memulai proses pengembalian?\" answer_8=\"Open the order in your account dashboard and click \\\"Start return\\\". We email a prepaid label for domestic orders within one business day.\" category_9=\"Pengembalian & Pengembalian Dana\" category_id_9=\"returnsRefunds\" question_9=\"3. Kapan saya akan menerima pengembalian dana saya?\" answer_9=\"Pengembalian dana diproses dalam 3-5 hari kerja sejak kami menerima barang yang dikembalikan. Waktu kredit bank mungkin berbeda; Harap tunggu hingga 10 hari kerja agar pembayaran Anda terlihat.\" category_10=\"Pengiriman & Pelacakan\" category_id_10=\"shippingTracking\" question_10=\"1. Berapa lama waktu pengiriman?\" answer_10=\"Pengiriman domestik standar memakan waktu 3-5 hari kerja. Pengiriman cepat 1-2 hari. Pengiriman standar internasional memakan waktu 7-12 hari kerja; Opsi pengiriman yang dipercepat tersedia di halaman checkout.\" category_11=\"Pengiriman & Pelacakan\" category_id_11=\"shippingTracking\" question_11=\"2. Bagaimana cara melacak pesanan?\" answer_11=\"Tautan pelacakan disertakan dalam email konfirmasi pengiriman. Anda juga dapat melihat status dari Akun → Pesanan → Pelacakan.\" category_12=\"Pengiriman & Pelacakan\" category_id_12=\"shippingTracking\" question_12=\"3. Apakah Anda mengirim secara internasional?\" answer_12=\"Ya — di sebagian besar negara. Pajak dan biaya dibayar di muka di halaman checkout untuk tujuan tertentu; Jika tidak, unit pengiriman dapat mengambilnya pada saat pengiriman.\" category_13=\"Biaya & Pembayaran\" category_id_13=\"feesBilling\" question_13=\"1. Apakah sudah termasuk pajak dan biaya?\" answer_13=\"Harga domestik termasuk pajak penjualan yang ditunjukkan saat checkout. Pesanan internasional ke tujuan yang didukung sudah termasuk pajak dan biaya; Jika tidak, unit pengiriman akan mengambilnya pada saat pengiriman.\" category_14=\"Biaya & Pembayaran\" category_id_14=\"feesBilling\" question_14=\"2. Mengapa saya ditagih dua kali?\" answer_14=\"Anda mungkin melihat penangguhan otorisasi bersama dengan tagihan sebenarnya. Penangguhan akan otomatis dibatalkan dalam 3-5 hari kerja. Kirim email ke billing@amerce.test jika Anda masih melihat dua tagihan setelah waktu tersebut.\" category_15=\"Topik Lainnya\" category_id_15=\"otherTopic\" question_15=\"1. Apakah Anda memiliki toko fisik?\" answer_15=\"Ya — silakan kunjungi halaman Toko untuk melihat daftar toko dan mitra utama.\" category_16=\"Topik Lainnya\" category_id_16=\"otherTopic\" question_16=\"2. Bagaimana cara menghubungi layanan pelanggan?\" answer_16=\"Email hello@amerce.test atau gunakan formulir kontak. Kami akan merespons dalam satu hari kerja.\"][/faq-page]'),('id',4,'Kebijakan Privasi','Bagaimana Amerce mengumpulkan, menggunakan dan melindungi informasi pribadi Anda.','[page-banner heading=\"Kebijakan Privasi\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Informasi yang Kami Kumpulkan\" body_1=\"<p class=\\\"term-text cl-text-2\\\">When you visit the Site, we automatically collect certain information about your device — web browser, IP address, time zone, and some of the cookies installed on your device. As you browse, we also collect data about the pages or products you view, what referred you to the Site, and how you interact with it. We refer to this as \\\"Device Information\\\".</p><p class=\\\"term-text cl-text-2\\\">When you make a purchase or attempt to purchase through the Site, we collect your name, billing address, shipping address, and payment information (including card number, email address, and phone number). We refer to this as \\\"Order Information\\\".</p>\" title_2=\"2. Bagaimana Kami Menggunakan Informasi Anda\" body_2=\"<p class=\\\"term-text cl-text-2\\\">We use Order Information to fulfil orders placed through the Site (process payment, arrange shipping, provide invoices and order confirmations). We use it to communicate with you, screen orders for fraud, and — in line with your preferences — share marketing about products you may like.</p><p class=\\\"term-text cl-text-2\\\">We use Device Information to screen for fraud and to improve the Site through analytics about how customers browse and interact with us.</p>\" title_3=\"3. Berbagi Informasi Pribadi Anda\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We share Personal Information with third-party service providers who help us run the Site. We may also share information to comply with applicable laws, respond to a subpoena or lawful request, or otherwise protect our rights.</p>\" title_4=\"4. Penyimpanan Data\" body_4=\"<p class=\\\"term-text cl-text-2\\\">When you place an order, we maintain the Order Information for our records unless and until you ask us to delete it.</p>\" title_5=\"5. Hak Anda\" body_5=\"<p class=\\\"term-text cl-text-2\\\">You can request access, correction, or deletion of any personal data we hold about you. Email privacy@amerce.test from the address on file and we will respond within 30 days.</p>\" title_6=\"6. Kue\" body_6=\"<p class=\\\"term-text cl-text-2\\\">Cookies are used to keep your cart between visits, remember your preferences, and measure aggregate traffic. You can disable cookies in your browser, though some Site features may stop working.</p>\" title_7=\"7. Perubahan\" body_7=\"<p class=\\\"term-text cl-text-2\\\">We may update this policy from time to time to reflect changes to our practices or for operational, legal, or regulatory reasons. The latest version will always be on this page.</p>\"][/term-content]'),('id',5,'Syarat & Ketentuan','Ketentuan hukum berlaku saat Anda menggunakan toko Amerce.','[page-banner heading=\"Syarat & Ketentuan\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Penerimaan Persyaratan\" body_1=\"<p class=\\\"term-text cl-text-2\\\">By accessing or using the Mendenda store you agree to these terms. We reserve the right to update them with reasonable notice; the latest version is always available on this page.</p>\" title_2=\"2. Pemesanan & Pembayaran\" body_2=\"<p class=\\\"term-text cl-text-2\\\">All prices are in USD unless otherwise stated. We accept the payment methods displayed at checkout. An order becomes binding once you receive an order confirmation email.</p>\" title_3=\"3. Pengiriman\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Mengangkut options, lead times, and rates are listed on our Mengangkut page. Risk passes to you on delivery.</p>\" title_4=\"4. Pengembalian\" body_4=\"<p class=\\\"term-text cl-text-2\\\">You have 30 days from delivery to return any unworn item for a refund. See our Pengembalian &amp; Pengembalian Dana page for the full process.</p>\" title_5=\"5. Kekayaan Intelektual\" body_5=\"<p class=\\\"term-text cl-text-2\\\">All content on the Site — text, photography, logos, code — is owned by Mendenda or its licensors and may not be reproduced without written permission.</p>\" title_6=\"6. Batasan Tanggung Jawab\" body_6=\"<p class=\\\"term-text cl-text-2\\\">To the maximum extent permitted by law, Mendenda is not liable for indirect or consequential damages arising from use of the Site or the products purchased through it.</p>\" title_7=\"7. Hukum yang Berlaku\" body_7=\"<p class=\\\"term-text cl-text-2\\\">These terms are governed by the laws of the State of New York. Any dispute will be resolved in the state or federal courts located in New York County.</p>\"][/term-content]'),('id',6,'Pengembalian & Pengembalian Dana','Kebijakan pengembalian 30 hari kami dan proses pengembalian langkah demi langkah.','[page-banner heading=\"Pengembalian & Pengembalian Dana\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Pengembalian\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We want you to be completely satisfied with your purchase. If for any reason you are not, you may return any unworn item within 30 days of receiving your order for a refund or exchange. Barang must be in original packaging and the same condition as you received them.</p>\" title_2=\"2. Bagaimana Memulai Pengembalian\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Open the order in your account dashboard and click \\\"Start return\\\", or email returns@amerce.test with your order number. We will send a prepaid return label for domestic orders within one business day.</p>\" title_3=\"3. Pengembalian dana\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Refunds are processed within 3-5 business days of us receiving the return and applied to the original payment method. Bank posting times vary; allow up to 10 business days for the credit to appear.</p>\" title_4=\"4. Pengecualian\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Sale items, intimate apparel, and final-sale flash sale purchases are excluded from returns. Personalised or made-to-order items are also non-returnable unless faulty.</p>\" title_5=\"5. Produk Rusak atau Cacat\" body_5=\"<p class=\\\"term-text cl-text-2\\\">If your order arrives damaged or faulty, email us within 7 days with photos. We will replace the item or issue a full refund — including any return shipping cost — at our expense.</p>\" title_6=\"6. Pengembalian Internasional\" body_6=\"<p class=\\\"term-text cl-text-2\\\">International customers are responsible for return shipping unless the item is faulty. We do not refund original shipping or duty charges on international returns.</p>\"][/term-content]'),('id',7,'Pengiriman','Metode pengiriman domestik dan internasional, waktu dan biaya.','[page-banner heading=\"Mengangkut\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Metode Pengiriman\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We offer the following shipping methods for domestic and international orders: standard ground, expedited 2-day, and priority overnight (where available).</p>\" title_2=\"2. Biaya Domestik\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Standard ground is free on orders over $99. Express 1-2 day shipping is $19.99 flat. Priority overnight is calculated by weight at checkout.</p>\" title_3=\"3. Internasional\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We ship to most countries. International standard shipping is $24.99 with 7-12 business day delivery. Express options appear at checkout. Duties and taxes are pre-paid for select destinations; otherwise the courier collects them on delivery.</p>\" title_4=\"4. Waktu Pemrosesan\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Orders placed before 2pm EST on business days ship the same day. Orders placed after 2pm or on weekends/holidays ship the next business day.</p>\" title_5=\"5. Pelacakan\" body_5=\"<p class=\\\"term-text cl-text-2\\\">A tracking link is included in your shipment confirmation email. You can also see live status from Account → Orders → Track.</p>\" title_6=\"6. Pesanan Hilang atau Terjebak\" body_6=\"<p class=\\\"term-text cl-text-2\\\">If a tracking number has not updated for more than 7 business days, email shipping@amerce.test. We will open an investigation with the carrier and either refund or reship the order at our expense.</p>\"][/term-content]'),('id',8,'Toko kami','Kunjungi Amerce secara langsung — toko utama dan mitra di seluruh dunia.',''),('id',9,'Blog','Instruksi pakaian, cerita merek, dan konten di balik layar dari tim editorial Amerce.','<div class=\"container py-5\"><h1>Buku harian</h1><p>Jelajahi kisah terbaru kami — panduan gaya, sorotan produk, analisis keberlanjutan mendalam, dan banyak lagi.</p></div>'),('id',10,'Karir','Bergabunglah dengan Amerce — posisi terbuka, nilai budaya, dan keuntungan tim.','<div class=\"container py-5\"><h1>Rekrutmen Di Amerce</h1><p>Kami adalah tim kecil terdistribusi yang membangun model ritel yang lebih baik. Kami merekrut seluruh produk, teknik, rantai pasokan, dan pengalaman pelanggan.</p><p>Posisi terbuka diposting di halaman LinkedIn perusahaan. Untuk melamar, kirim surat pendek dan resume ke <a href=\"mailto:careers@amerce.test\">careers@amerce.test</a>.</p></div>'),('id',11,'Sustainability','How Amerce sources responsibly and reduces its environmental footprint.','<div class=\"container py-5\"><h1>Pembangunan Berkelanjutan di Amerika</h1><p>Setiap produk membawa cerita. Kami bekerja sama langsung dengan pabrik dan bengkel pengrajin, memprioritaskan bahan daur ulang dan dapat dilacak, serta mengemas bebas plastik.</p><p>Sasaran kami pada tahun 2026: 90% material memiliki rantai pasokan yang terverifikasi, dan pelaporan dampak tahunan yang transparan.</p></div>'),('id',12,'Beranda','Amerce — rumah bagi pengalaman e-commerce yang serbaguna.','[simple-slider key=\"home-hero\" style=\"style-baby\" is_autoplay=\"yes\" autoplay_speed=\"3000\" show_arrows=\"no\" show_dots=\"yes\" wrapper_class=\"pt-30 p-xl-0\" text_color=\"white\" button_style=\"pill-white\"][/simple-slider]\n[infinity-marquee style=\"style-1\" variant=\"policy\" background_class=\"\" spacing_class=\"flat-spacing\" use_container=\"yes\" clone_count=\"3\" quantity=\"4\" heading_1=\"Pengiriman gratis untuk semua pesanan di atas $20,00\" image_1=\"section/policy-1.jpg\" heading_2=\"Pengembalian gratis dalam 14 hari\" image_2=\"section/policy-2.jpg\" heading_3=\"Pengiriman gratis untuk semua pesanan di atas $20,00\" image_3=\"section/policy-3.jpg\" heading_4=\"Pengembalian gratis dalam 14 hari\" image_4=\"section/policy-4.jpg\"][/infinity-marquee]\n[categories-grid style=\"style-slider-wide-image\" spacing_class=\"themesFlat\" title=\"Belanja Berdasarkan Kategori\" subtitle=\"Temukan hal-hal penting yang dipercaya untuk menenangkan dan memberi nutrisi pada bayi Anda.\" limit=\"8\" show_count=\"yes\"][/categories-grid]\n[ecommerce-products style=\"style-tabs\" title=\"This Week&rsquo;s Highlights\" subtitle=\"Temukan perlengkapan bayi favorit kami, dipilih berdasarkan kenyamanan, keamanan, dan gaya.\" source=\"latest\" limit=\"8\" items_per_row=\"4\" tab_labels=\"New|Populer|Sale|Bayi|Anak-anak\" tab_sources=\"latest|best-seller|sale|featured|latest\" tab_nav_class_extra=\"style-2\" grid_rows=\"2\" product_wrapper_class=\"square\"][/ecommerce-products]\n[image-gallery style=\"style-paired-banner-side\" quantity=\"2\" image_1=\"section/banner-19.jpg\" link_1=\"/products\" title_1=\"Kesenangan Kecil, Penghematan Besar!\" description_1=\"Diskon hingga 50% untuk perlengkapan bayi yang sangat diperlukan\" button_text_1=\"Lihat Semua Produk\" image_2=\"section/banner-20.jpg\" link_2=\"/products\" title_2=\"Temuan Baru untuk Senyuman Anak\" description_2=\"Lembut, aman dan siap untuk setiap pelukan.\" button_text_2=\"Jelajahi Sekarang\"][/image-gallery]\n[ecommerce-products style=\"style-banner-carousel-side\" title=\"\" subtitle=\"\" custom_title=\"Favorit Orang Tua &amp; Bayi\" custom_subtitle=\"Temukan hal-hal penting yang paling lembut dan paling disukai untuk dunia kecil Anda.\" view_all_url=\"/products\" view_all_text=\"Lihat Semua Produk\" banner_image=\"section/banner-21.jpg\" banner_subheading=\"CINTA DALAM SETIAP DETAIL KECIL\" banner_heading=\"Kenyamanan Dan Perawatan Untuk Bayi Anda\" banner_button_text=\"Lihat Semua Produk\" banner_button_url=\"/products\" source=\"featured\" limit=\"6\" items_per_row=\"2\"][/ecommerce-products]\n[lookbook-hotspot style=\"style-bundle-slider\" title=\"Set Produk Sempurna untuk Bayi\" subtitle=\"Koleksinya dipilih dengan cermat dengan barang-barang premium yang sangat diperlukan untuk bayi Anda, demi kenyamanan dan kualitas.\" image=\"section/banner-lookbook-6.jpg\" image_2=\"section/banner-lookbook-7.jpg\" quantity=\"4\" x_percent_1=\"32.5\" y_percent_1=\"61.2\" product_id_1=\"1\" column_1=\"1\" x_percent_2=\"61.7\" y_percent_2=\"51.8\" product_id_2=\"9\" column_2=\"1\" x_percent_3=\"32.5\" y_percent_3=\"61.2\" product_id_3=\"2\" column_3=\"2\" x_percent_4=\"61.7\" y_percent_4=\"51.8\" product_id_4=\"10\" column_4=\"2\"][/lookbook-hotspot]\n[testimonials style=\"style-v2-product\" card_type=\"type-2\" title=\"Dicintai oleh Orang Tua yang Bahagia\" subtitle=\"Kisah nyata dari para ayah dan ibu yang mempercayakan kami untuk merawat bayinya.\" autoplay=\"yes\" limit=\"4\" view_all_url=\"/products\" view_all_text=\"Lihat Semua Produk\" testimonial_product_ids=\"1,9,10,3\"][/testimonials]\n[blog-posts style=\"style-slider\" title=\"Cerita untuk Orang Tua Modern\" subtitle=\"Ide-ide mendalam dan inspirasi harian untuk membesarkan malaikat kecil yang bahagia.\" limit=\"6\" show_meta=\"yes\" show_excerpt=\"yes\"][/blog-posts]\n[image-gallery style=\"style-default\" skip_spacing=\"yes\" title=\"Belanja Di Instagram\" subtitle=\"Tingkatkan lemari pakaian Anda dengan temuan baru hari ini!\" quantity=\"5\" image_1=\"gallery/gallery-17.jpg\" link_1=\"/products\" image_2=\"gallery/gallery-18.jpg\" link_2=\"/products\" image_3=\"gallery/gallery-19.jpg\" link_3=\"/products\" image_4=\"gallery/gallery-20.jpg\" link_4=\"/products\" image_5=\"gallery/gallery-21.jpg\" link_5=\"/products\"][/image-gallery]'),('tr',1,'Hakkında','Amerce ile tanışın - marka hikayesi, tedarik standartları ve her ürünün arkasındaki ekip.','[page-banner heading=\"Hakkımızda\" subtitle=\"With over 15 years of experience, we craft timeless collections that transcend<br class=\\\"d-none d-lg-block\\\">trends and inspire lasting elegance.\"][/page-banner]\n[stats-counter hero_image=\"section/s-contact-1.jpg\" heading=\"Tasarım, detaylara verilen önem ve verimlilik dünyayı memnun ediyor\" description=\"Tasarlandığı andan giyildiği ana kadar her ürünümüz bu yolculuğu takip ediyor. Bunu daha hızlı bir şekilde yapabiliriz. Ancak Amerce olarak bu yolculukta bizimle birlikte olan herkesle ilgilenmeyi seçiyoruz.\" quantity=\"4\" value_1=\"8.2k\" animate_to_1=\"\" suffix_1=\"\" label_1=\"Mevcut Ürünler\" desc_1=\"Her türlü ihtiyacı karşılamak için yüksek kaliteli ürünler sunuyoruz.\" value_2=\"\" animate_to_2=\"10\" suffix_2=\"k\" label_2=\"Memnun Müşteriler\" desc_2=\"Kalite ve hizmet konusunda bize güvenen 10.000\'den fazla memnun müşteriye hizmet veriyoruz.\" value_3=\"\" animate_to_3=\"96\" suffix_3=\"\" label_3=\"İş Ortağı Markası\" desc_3=\"Önde gelen markalarla yapılan ortaklıklar, güvenilir koleksiyonları mağazanıza ve evinize getirir.\" value_4=\"\" animate_to_4=\"16\" suffix_4=\"k\" label_4=\"Satılık Ürünler\" desc_4=\"Bu nedenle her tarza uygun çeşitli ürün grupları sunmaya çalışıyoruz.\"][/stats-counter]\n[image-accordion image=\"section/s-contact-2.jpg\" heading=\"Nadir ve Enfes Ürünleri Dünya Çapına Getiriyoruz\" quantity=\"4\" title_1=\"Tanıtmak\" body_1=\"Trend belirleyen moda ve aksesuarlar için ilk adresiniz olan Amerce Store\'a hoş geldiniz. Hem ulusal hem de uluslararası alanda aranan, nadir ve seçkin parçalardan özenle seçilmiş bir koleksiyon sunmaktan gurur duyuyoruz.\" title_2=\"Vizyonumuz\" body_2=\"Sofistike tasarımın günlük yaşamla harmanlandığı bir dünyayı hedefliyoruz; zamana karşı dayanıklı ürünler, güvenilen ortaklar ve işlem değil, insan gibi davranılan müşteriler.\" title_3=\"Farkı Yaratan Nedir?\" body_3=\"Tedarikçiler bağımsız olarak denetlenir, ürünler elle test edilir ve özel bir müşteri hizmetleri ekibi tarafından desteklenen 30 günlük sebepsiz iade politikası vardır.\" title_4=\"Taahhüdümüz\" body_4=\"Kaliteli ürünler, şeffaf tedarik zincirleri ve adil çalışma koşulları - her siparişte, her zaman.\"][/image-accordion]\n[about-testimonials heading=\"Müşteriler Ne Diyor?\" subtitle=\"Müşterilerimiz ürünlerimizi seviyor ve biz de onları memnun etmeye çalışıyoruz.\" quantity=\"2\" image_1=\"testimonials/tes-1.jpg\" name_1=\"Emma Collins\" text_1=\"\\\"Totally obsessed with this outfit! The fit is perfect, the fabric feels premium, and I\'ve been getting compliments non-stop. It instantly lifts my confidence — such a great find!\\\"\" image_2=\"testimonials/tes-2.jpg\" name_2=\"Sofya Ramirez\" text_2=\"\\\"I\'m amazed by how comfortable yet stylish this piece is. It pairs effortlessly with everything, and the quality really stands out. Definitely becoming my go-to for everyday looks!\\\"\"][/about-testimonials]\n[about-team heading=\"Ekiple Tanışın\" subtitle=\"Her ayrıntıda mükemmelliğe kendini adamış profesyoneller.\" quantity=\"4\" image_1=\"member/member-1.jpg\" name_1=\"Annette Siyah\" role_1=\"Kurucu/CEO\" social_links_1=\"\" image_2=\"member/member-2.jpg\" name_2=\"Brooklyn Simmons\" role_2=\"Üstesinden gelmek\" social_links_2=\"\" image_3=\"member/member-3.jpg\" name_3=\"Jane Cooper\" role_3=\"Satış Direktörü\" social_links_3=\"\" image_4=\"member/member-4.jpg\" name_4=\"Lisa Bonet\" role_4=\"Satış Direktörü\" social_links_4=\"\"][/about-team]'),('tr',2,'Temas etmek','Amerce\'in müşteri hizmetleri ve işbirliği ekibiyle iletişime geçin.',''),('tr',3,'FAQ','Siparişler, gönderim, iadeler ve hesap yönetimi hakkında sık sorulan sorular.','[page-banner heading=\"Sıkça Sorulan Sorular\" subtitle=\"Got questions? We\'ve got answers! Browse our Sıkça Sorulan Sorular to find information on orders, shipping,<br class=\\\"d-none d-lg-block\\\">returns, and more. If you need further assistance, feel free to contact our team.\"][/page-banner]\n[faq-page sidebar_image=\"section/banner-12.jpg\" sidebar_title=\"Save 25% <br class=\\\"d-none d-sm-block\\\">Today\" sidebar_subtitle=\"Tişörtler, Kapüşonlular ve Daha Fazlası\" sidebar_cta=\"Daha Fazlasını Gör\" sidebar_url=\"/products\" quantity=\"16\" category_1=\"Hesabım\" category_id_1=\"myAccount\" question_1=\"1. Şifremi unutursam ne yapabilirim?\" answer_1=\"Use the \\\"Forgot password\\\" link on the sign-in page. We will email you a one-time link to set a new password — it expires in 30 minutes for security.\" category_2=\"Hesabım\" category_id_2=\"myAccount\" question_2=\"2. E-posta adresi nasıl güncellenir?\" answer_2=\"Oturum açın, Hesap → Ayarlar\'ı açın ve e-posta alanlarını değiştirin. Yeni adrese bir onay e-postası göndereceğiz; Bu bağlantıya tıkladığınızda değişiklik geçerli olacaktır.\" category_3=\"Hesabım\" category_id_3=\"myAccount\" question_3=\"3. Hesabımı silebilir miyim?\" answer_3=\"Sahip olmak. Hesap → Ayarlar\'dan Hesabı sil seçeneğine ilerleyin. Sipariş geçmişini vergi/yasal nedenlerden dolayı saklıyoruz ancak kişisel iletişim bilgileri 30 gün içinde silinir.\" category_4=\"Siparişler ve Alışveriş\" category_id_4=\"ordersPurchases\" question_4=\"1. Nasıl sipariş verilir?\" answer_4=\"Ürünleri sepete ekleyin, ödeme seçeneğini tıklayın, gönderim yöntemini seçin ve ardından ödeme bilgilerini girin. Hemen bir sipariş onay e-postası alacaksınız.\" category_5=\"Siparişler ve Alışveriş\" category_id_5=\"ordersPurchases\" question_5=\"2. Siparişimi düzenleyebilir veya iptal edebilir miyim?\" answer_5=\"Siparişler, verildikten sonraki 1 saat içinde hesap kontrol panelinizden düzenlenebilir veya iptal edilebilir. Daha sonra depo toplanmaya başladı ve biz müdahale edemedik.\" category_6=\"Siparişler ve Alışveriş\" category_id_6=\"ordersPurchases\" question_6=\"3. Hangi ödeme yöntemleri kabul ediliyor?\" answer_6=\"Visa, Mastercard, American Express, Apple Pay, Google Pay ve PayPal\'ı kabul ediyoruz. Tüm işlemlerde TLS 1.3 şifrelemesi kullanılır.\" category_7=\"İade ve Para İadeleri\" category_id_7=\"returnsRefunds\" question_7=\"1. İade süresi ne kadardır?\" answer_7=\"Kullanılmamış ve giyilmemiş ürünler için teslim tarihinden itibaren 30 gün. İndirimli ürünler, iç giyim ve son indirim flaş indirim ürünleri için geçerli değildir.\" category_8=\"İade ve Para İadeleri\" category_id_8=\"returnsRefunds\" question_8=\"2. İade sürecini nasıl başlatabilirim?\" answer_8=\"Open the order in your account dashboard and click \\\"Start return\\\". We email a prepaid label for domestic orders within one business day.\" category_9=\"İade ve Para İadeleri\" category_id_9=\"returnsRefunds\" question_9=\"3. Geri ödememi ne zaman alacağım?\" answer_9=\"Geri ödemeler, iade edilen ürünün tarafımıza ulaşmasından itibaren 3-5 iş günü içerisinde gerçekleştirilir. Banka kredi süreleri değişiklik gösterebilir; Ödemenizin yansıtıldığını görmek için lütfen 10 iş gününe kadar bekleyin.\" category_10=\"Nakliye ve Takip\" category_id_10=\"shippingTracking\" question_10=\"1. Nakliye ne kadar sürer?\" answer_10=\"Standart yurt içi kargo 3-5 iş günü sürmektedir. Hızlı kargo 1-2 gün. Uluslararası standart nakliye 7-12 iş günü sürer; Ödeme sayfasında hızlandırılmış gönderim seçenekleri mevcuttur.\" category_11=\"Nakliye ve Takip\" category_id_11=\"shippingTracking\" question_11=\"2. Siparişler nasıl takip edilir?\" answer_11=\"Takip bağlantısı gönderim onayı e-postasına dahildir. Durumu Hesap → Siparişler → Takip bölümünden de görüntüleyebilirsiniz.\" category_12=\"Nakliye ve Takip\" category_id_12=\"shippingTracking\" question_12=\"3. Uluslararası gönderim yapıyor musunuz?\" answer_12=\"Evet — çoğu ülkeye. Belirli destinasyonlar için vergi ve harçlar ödeme sayfasında önceden ödenir; Aksi takdirde nakliye birimi teslimat sırasında ürünü teslim alabilir.\" category_13=\"Ücretler ve Ödemeler\" category_id_13=\"feesBilling\" question_13=\"1. Vergi ve harçlar dahil mi?\" answer_13=\"Yurt içi fiyatlara ödeme sırasında gösterilen satış vergisi dahildir. Desteklenen varış noktalarına verilen uluslararası siparişlere vergiler ve harçlar dahildir; Aksi takdirde kargo birimi teslimat sırasında ürünü teslim alacaktır.\" category_14=\"Ücretler ve Ödemeler\" category_id_14=\"feesBilling\" question_14=\"2. Neden iki kez ücretlendirildim?\" answer_14=\"Gerçek ödemeyle birlikte bir provizyon bekletmesi görüyor olabilirsiniz. Durdurma 3-5 iş günü içinde otomatik olarak iptal edilecektir. Bu sürenin sonunda hala iki ödeme görüyorsanız billing@amerce.test adresine e-posta gönderin.\" category_15=\"Diğer Konular\" category_id_15=\"otherTopic\" question_15=\"1. Fiziksel bir mağazanız var mı?\" answer_15=\"Evet — önemli mağazaların ve iş ortaklarının listesi için lütfen Mağazalar sayfasını ziyaret edin.\" category_16=\"Diğer Konular\" category_id_16=\"otherTopic\" question_16=\"2. Müşteri hizmetleriyle nasıl iletişime geçilir?\" answer_16=\"hello@amerce.test adresine e-posta gönderin veya iletişim formunu kullanın. Bir iş günü içinde yanıt vereceğiz.\"][/faq-page]'),('tr',4,'Gizlilik Politikası','Amerce kişisel bilgilerinizi nasıl toplar, kullanır ve korur.','[page-banner heading=\"Gizlilik Politikası\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Topladığımız Bilgiler\" body_1=\"<p class=\\\"term-text cl-text-2\\\">When you visit the Site, we automatically collect certain information about your device — web browser, IP address, time zone, and some of the cookies installed on your device. As you browse, we also collect data about the pages or products you view, what referred you to the Site, and how you interact with it. We refer to this as \\\"Device Information\\\".</p><p class=\\\"term-text cl-text-2\\\">When you make a purchase or attempt to purchase through the Site, we collect your name, billing address, shipping address, and payment information (including card number, email address, and phone number). We refer to this as \\\"Order Information\\\".</p>\" title_2=\"2. Bilgilerinizi Nasıl Kullanıyoruz\" body_2=\"<p class=\\\"term-text cl-text-2\\\">We use Order Information to fulfil orders placed through the Site (process payment, arrange shipping, provide invoices and order confirmations). We use it to communicate with you, screen orders for fraud, and — in line with your preferences — share marketing about products you may like.</p><p class=\\\"term-text cl-text-2\\\">We use Device Information to screen for fraud and to improve the Site through analytics about how customers browse and interact with us.</p>\" title_3=\"3. Kişisel Bilgilerinizin Paylaşılması\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We share Personal Information with third-party service providers who help us run the Site. We may also share information to comply with applicable laws, respond to a subpoena or lawful request, or otherwise protect our rights.</p>\" title_4=\"4. Veri Depolama\" body_4=\"<p class=\\\"term-text cl-text-2\\\">When you place an order, we maintain the Order Information for our records unless and until you ask us to delete it.</p>\" title_5=\"5. Haklarınız\" body_5=\"<p class=\\\"term-text cl-text-2\\\">You can request access, correction, or deletion of any personal data we hold about you. Email privacy@amerce.test from the address on file and we will respond within 30 days.</p>\" title_6=\"6. Çerezler\" body_6=\"<p class=\\\"term-text cl-text-2\\\">Cookies are used to keep your cart between visits, remember your preferences, and measure aggregate traffic. You can disable cookies in your browser, though some Site features may stop working.</p>\" title_7=\"7. Değişim\" body_7=\"<p class=\\\"term-text cl-text-2\\\">We may update this policy from time to time to reflect changes to our practices or for operational, legal, or regulatory reasons. The latest version will always be on this page.</p>\"][/term-content]'),('tr',5,'Şartlar ve Koşullar','Amerce mağazasını kullandığınızda yasal şartlar geçerlidir.','[page-banner heading=\"Şartlar ve Koşullar\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Şartların Kabulü\" body_1=\"<p class=\\\"term-text cl-text-2\\\">By accessing or using the Amerika store you agree to these terms. We reserve the right to update them with reasonable notice; the latest version is always available on this page.</p>\" title_2=\"2. Siparişler ve Ödeme\" body_2=\"<p class=\\\"term-text cl-text-2\\\">All prices are in USD unless otherwise stated. We accept the payment methods displayed at checkout. An order becomes binding once you receive an order confirmation email.</p>\" title_3=\"3. Nakliye\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Taşıma options, lead times, and rates are listed on our Taşıma page. Risk passes to you on delivery.</p>\" title_4=\"4. İade\" body_4=\"<p class=\\\"term-text cl-text-2\\\">You have 30 days from delivery to return any unworn item for a refund. See our İade ve Para İadeleri page for the full process.</p>\" title_5=\"5. Fikri Mülkiyet\" body_5=\"<p class=\\\"term-text cl-text-2\\\">All content on the Site — text, photography, logos, code — is owned by Amerika or its licensors and may not be reproduced without written permission.</p>\" title_6=\"6. Sorumluluğun Sınırlandırılması\" body_6=\"<p class=\\\"term-text cl-text-2\\\">To the maximum extent permitted by law, Amerika is not liable for indirect or consequential damages arising from use of the Site or the products purchased through it.</p>\" title_7=\"7. Geçerli Kanun\" body_7=\"<p class=\\\"term-text cl-text-2\\\">These terms are governed by the laws of the State of New York. Any dispute will be resolved in the state or federal courts located in New York County.</p>\"][/term-content]'),('tr',6,'İade ve Para İadeleri','30 günlük iade politikamız ve adım adım iade sürecimiz.','[page-banner heading=\"İade ve Para İadeleri\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. İade\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We want you to be completely satisfied with your purchase. If for any reason you are not, you may return any unworn item within 30 days of receiving your order for a refund or exchange. Öğeler must be in original packaging and the same condition as you received them.</p>\" title_2=\"2. İade Nasıl Başlatılır\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Open the order in your account dashboard and click \\\"Start return\\\", or email returns@amerce.test with your order number. We will send a prepaid return label for domestic orders within one business day.</p>\" title_3=\"3. İade\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Refunds are processed within 3-5 business days of us receiving the return and applied to the original payment method. Bank posting times vary; allow up to 10 business days for the credit to appear.</p>\" title_4=\"4. İstisnalar\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Sale items, intimate apparel, and final-sale flash sale purchases are excluded from returns. Personalised or made-to-order items are also non-returnable unless faulty.</p>\" title_5=\"5. Hasarlı veya Arızalı Ürünler\" body_5=\"<p class=\\\"term-text cl-text-2\\\">If your order arrives damaged or faulty, email us within 7 days with photos. We will replace the item or issue a full refund — including any return shipping cost — at our expense.</p>\" title_6=\"6. Uluslararası İadeler\" body_6=\"<p class=\\\"term-text cl-text-2\\\">International customers are responsible for return shipping unless the item is faulty. We do not refund original shipping or duty charges on international returns.</p>\"][/term-content]'),('tr',7,'Nakliye','Yurt içi ve yurt dışı gönderim yöntemleri, süreleri ve ücretleri.','[page-banner heading=\"Taşıma\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Nakliye Yöntemi\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We offer the following shipping methods for domestic and international orders: standard ground, expedited 2-day, and priority overnight (where available).</p>\" title_2=\"2. Yurtiçi Ücretler\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Standard ground is free on orders over $99. Express 1-2 day shipping is $19.99 flat. Priority overnight is calculated by weight at checkout.</p>\" title_3=\"3. Uluslararası\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We ship to most countries. International standard shipping is $24.99 with 7-12 business day delivery. Express options appear at checkout. Duties and taxes are pre-paid for select destinations; otherwise the courier collects them on delivery.</p>\" title_4=\"4. İşlem Süresi\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Orders placed before 2pm EST on business days ship the same day. Orders placed after 2pm or on weekends/holidays ship the next business day.</p>\" title_5=\"5. Takip\" body_5=\"<p class=\\\"term-text cl-text-2\\\">A tracking link is included in your shipment confirmation email. You can also see live status from Account → Orders → Track.</p>\" title_6=\"6. Kayıp veya Takılan Siparişler\" body_6=\"<p class=\\\"term-text cl-text-2\\\">If a tracking number has not updated for more than 7 business days, email shipping@amerce.test. We will open an investigation with the carrier and either refund or reship the order at our expense.</p>\"][/term-content]'),('tr',8,'Mağazalarımız','Amerce\'i doğrudan ziyaret edin; dünya çapındaki amiral mağazaları ve ortakları.',''),('tr',9,'Blog','Amerce editör ekibinden kıyafet talimatları, marka hikayeleri ve kamera arkası içerikleri.','<div class=\"container py-5\"><h1>Günlük</h1><p>Stil kılavuzları, öne çıkan ürünler, derinlemesine sürdürülebilirlik analizi ve daha fazlasını içeren en son hikayelerimizi keşfedin.</p></div>'),('tr',10,'Kariyer','Amerce\'e katılın — açık pozisyonlar, kültürel değerler ve takım avantajları.','<div class=\"container py-5\"><h1>Amerce\'de İşe Alım</h1><p>Biz daha rafine bir perakende modeli inşa eden küçük, dağınık bir ekibiz. Ürün, mühendislik, tedarik zinciri ve müşteri deneyimi genelinde işe alım yapıyoruz.</p><p>Açık pozisyonlar şirketin LinkedIn sayfasında yayınlanmaktadır. Başvurmak için <a href=\"mailto:careers@amerce.test\">careers@amerce.test</a> adresine kısa bir mektup ve özgeçmiş gönderin.</p></div>'),('tr',11,'Sustainability','How Amerce sources responsibly and reduces its environmental footprint.','<div class=\"container py-5\"><h1>Amerika\'da Sürdürülebilir Kalkınma</h1><p>Her ürün bir hikaye taşır. Doğrudan fabrikalar ve zanaatkar atölyeleriyle çalışıyoruz, geri dönüştürülmüş ve izlenebilir malzemelere öncelik veriyoruz ve plastik içermeyen ambalajlar yapıyoruz.</p><p>2026 hedefimiz: Malzemelerin %90\'ının doğrulanmış bir tedarik zincirine ve şeffaf yıllık etki raporlamasına sahip olması.</p></div>'),('tr',12,'Ana sayfa','Amerce — çok yönlü bir e-ticaret deneyimine ev sahipliği yapıyor.','[simple-slider key=\"home-hero\" style=\"style-baby\" is_autoplay=\"yes\" autoplay_speed=\"3000\" show_arrows=\"no\" show_dots=\"yes\" wrapper_class=\"pt-30 p-xl-0\" text_color=\"white\" button_style=\"pill-white\"][/simple-slider]\n[infinity-marquee style=\"style-1\" variant=\"policy\" background_class=\"\" spacing_class=\"flat-spacing\" use_container=\"yes\" clone_count=\"3\" quantity=\"4\" heading_1=\"20,00 $ üzeri tüm siparişlerde ücretsiz kargo\" image_1=\"section/policy-1.jpg\" heading_2=\"14 gün içinde ücretsiz iade\" image_2=\"section/policy-2.jpg\" heading_3=\"20,00 $ üzeri tüm siparişlerde ücretsiz kargo\" image_3=\"section/policy-3.jpg\" heading_4=\"14 gün içinde ücretsiz iade\" image_4=\"section/policy-4.jpg\"][/infinity-marquee]\n[categories-grid style=\"style-slider-wide-image\" spacing_class=\"themesFlat\" title=\"Kategoriye Göre Alışveriş Yapın\" subtitle=\"Bebeğinizi rahatlatmak ve beslemek için güvenilir temelleri keşfedin.\" limit=\"8\" show_count=\"yes\"][/categories-grid]\n[ecommerce-products style=\"style-tabs\" title=\"This Week&rsquo;s Highlights\" subtitle=\"Konfor, güvenlik ve stil için seçilen, en sevilen bebek eşyalarımızı keşfedin.\" source=\"latest\" limit=\"8\" items_per_row=\"4\" tab_labels=\"New|Popüler|Sale|Bebek|Çocuklar\" tab_sources=\"latest|best-seller|sale|featured|latest\" tab_nav_class_extra=\"style-2\" grid_rows=\"2\" product_wrapper_class=\"square\"][/ecommerce-products]\n[image-gallery style=\"style-paired-banner-side\" quantity=\"2\" image_1=\"section/banner-19.jpg\" link_1=\"/products\" title_1=\"Biraz Eğlence, Büyük Tasarruf!\" description_1=\"Bebeklerin vazgeçilmez ürünlerinde %50\'ye varan indirim\" button_text_1=\"Tüm Ürünleri Görüntüle\" image_2=\"section/banner-20.jpg\" link_2=\"/products\" title_2=\"Çocukların Gülümsemesi İçin Yeni Bulgular\" description_2=\"Yumuşak, güvenli ve her kucaklaşmaya hazır.\" button_text_2=\"Şimdi Keşfet\"][/image-gallery]\n[ecommerce-products style=\"style-banner-carousel-side\" title=\"\" subtitle=\"\" custom_title=\"Ebeveyn ve Bebek Favorileri\" custom_subtitle=\"Küçük dünyanız için en yumuşak, en sevilen temel malzemeleri keşfedin.\" view_all_url=\"/products\" view_all_text=\"Tüm Ürünleri Görüntüle\" banner_image=\"section/banner-21.jpg\" banner_subheading=\"HER KÜÇÜK DETAYDA AŞK\" banner_heading=\"Bebeğiniz İçin Konfor ve Bakım\" banner_button_text=\"Tüm Ürünleri Görüntüle\" banner_button_url=\"/products\" source=\"featured\" limit=\"6\" items_per_row=\"2\"][/ecommerce-products]\n[lookbook-hotspot style=\"style-bundle-slider\" title=\"Bebek İçin Mükemmel Ürün Seti\" subtitle=\"Koleksiyon, bebeğinizin konforu ve kalitesi için premium, vazgeçilmez ürünlerden özenle seçilmiştir.\" image=\"section/banner-lookbook-6.jpg\" image_2=\"section/banner-lookbook-7.jpg\" quantity=\"4\" x_percent_1=\"32.5\" y_percent_1=\"61.2\" product_id_1=\"1\" column_1=\"1\" x_percent_2=\"61.7\" y_percent_2=\"51.8\" product_id_2=\"9\" column_2=\"1\" x_percent_3=\"32.5\" y_percent_3=\"61.2\" product_id_3=\"2\" column_3=\"2\" x_percent_4=\"61.7\" y_percent_4=\"51.8\" product_id_4=\"10\" column_4=\"2\"][/lookbook-hotspot]\n[testimonials style=\"style-v2-product\" card_type=\"type-2\" title=\"Mutlu Ebeveynler tarafından sevilir\" subtitle=\"Bebeklerinin bakımı konusunda bize güvenen anne ve babaların gerçek hikayeleri.\" autoplay=\"yes\" limit=\"4\" view_all_url=\"/products\" view_all_text=\"Tüm Ürünleri Görüntüle\" testimonial_product_ids=\"1,9,10,3\"][/testimonials]\n[blog-posts style=\"style-slider\" title=\"Modern Ebeveynler için Hikayeler\" subtitle=\"Mutlu küçük melekler yetiştirmek için anlayışlı fikirler ve günlük ilham.\" limit=\"6\" show_meta=\"yes\" show_excerpt=\"yes\"][/blog-posts]\n[image-gallery style=\"style-default\" skip_spacing=\"yes\" title=\"Instagram\'da Alışveriş\" subtitle=\"Gardırobunuzu bugün yeni buluntularla yükseltin!\" quantity=\"5\" image_1=\"gallery/gallery-17.jpg\" link_1=\"/products\" image_2=\"gallery/gallery-18.jpg\" link_2=\"/products\" image_3=\"gallery/gallery-19.jpg\" link_3=\"/products\" image_4=\"gallery/gallery-20.jpg\" link_4=\"/products\" image_5=\"gallery/gallery-21.jpg\" link_5=\"/products\"][/image-gallery]'),('vi',1,'Giới thiệu','Giới thiệu Amerce — câu chuyện thương hiệu, tiêu chuẩn nguồn cung và đội ngũ đứng sau từng sản phẩm.','[page-banner heading=\"Về Chúng Tôi\" subtitle=\"With over 15 years of experience, we craft timeless collections that transcend<br class=\\\"d-none d-lg-block\\\">trends and inspire lasting elegance.\"][/page-banner]\n[stats-counter hero_image=\"section/s-contact-1.jpg\" heading=\"Thiết kế, sự tỉ mỉ trong từng chi tiết và hiệu quả làm hài lòng thế giới\" description=\"Từ khoảnh khắc được hình thành đến khi được khoác lên người, mỗi sản phẩm của chúng tôi đều đi theo hành trình này. Chúng tôi có thể làm điều đó với tốc độ nhanh hơn. Tuy nhiên, tại Amerce, chúng tôi chọn chăm sóc tất cả những ai đang đồng hành cùng chúng tôi trên hành trình này.\" quantity=\"4\" value_1=\"8.2k\" animate_to_1=\"\" suffix_1=\"\" label_1=\"Sản Phẩm Hiện Có\" desc_1=\"Chúng tôi cung cấp đa dạng sản phẩm chất lượng cao để đáp ứng mọi nhu cầu.\" value_2=\"\" animate_to_2=\"10\" suffix_2=\"k\" label_2=\"Khách Hàng Hài Lòng\" desc_2=\"Phục vụ hơn 10.000 khách hàng hài lòng tin tưởng chúng tôi về chất lượng và dịch vụ.\" value_3=\"\" animate_to_3=\"96\" suffix_3=\"\" label_3=\"Thương Hiệu Đối Tác\" desc_3=\"Quan hệ đối tác với các thương hiệu hàng đầu mang đến bộ sưu tập đáng tin cậy cho cửa hàng và ngôi nhà của bạn.\" value_4=\"\" animate_to_4=\"16\" suffix_4=\"k\" label_4=\"Sản Phẩm Đang Bán\" desc_4=\"Đó là lý do chúng tôi nỗ lực mang đến nhiều dòng sản phẩm đa dạng, phù hợp với mọi phong cách.\"][/stats-counter]\n[image-accordion image=\"section/s-contact-2.jpg\" heading=\"Mang Đến Những Món Đồ Quý Hiếm Và Tinh Tế Trên Toàn Thế Giới\" quantity=\"4\" title_1=\"Giới Thiệu\" body_1=\"Chào mừng đến với Cửa hàng Amerce, điểm đến hàng đầu cho thời trang và phụ kiện đi đầu xu hướng. Chúng tôi tự hào mang đến bộ sưu tập được tuyển chọn kỹ lưỡng những món đồ quý hiếm và tinh tế được tìm kiếm cả trong nước lẫn quốc tế.\" title_2=\"Tầm Nhìn Của Chúng Tôi\" body_2=\"Chúng tôi hướng đến một thế giới nơi thiết kế tinh tế hòa quyện cùng cuộc sống thường ngày — những sản phẩm bền đẹp theo thời gian, những đối tác đáng tin cậy, và những khách hàng được đối xử như con người, không phải giao dịch.\" title_3=\"Điều Làm Nên Sự Khác Biệt\" body_3=\"Nhà cung cấp được kiểm toán độc lập, sản phẩm được kiểm tra thủ công, và chính sách đổi trả 30 ngày không cần lý do, hỗ trợ bởi đội ngũ chăm sóc khách hàng tận tâm.\" title_4=\"Cam Kết Của Chúng Tôi\" body_4=\"Sản phẩm chất lượng, chuỗi cung ứng minh bạch và điều kiện lao động công bằng — mỗi đơn hàng, mỗi lần đặt.\"][/image-accordion]\n[about-testimonials heading=\"Khách Hàng Nói Gì!\" subtitle=\"Khách hàng yêu thích sản phẩm của chúng tôi, và chúng tôi luôn nỗ lực làm hài lòng họ.\" quantity=\"2\" image_1=\"testimonials/tes-1.jpg\" name_1=\"Emma Collins\" text_1=\"\\\"Totally obsessed with this outfit! The fit is perfect, the fabric feels premium, and I\'ve been getting compliments non-stop. It instantly lifts my confidence — such a great find!\\\"\" image_2=\"testimonials/tes-2.jpg\" name_2=\"Sophia Ramirez\" text_2=\"\\\"I\'m amazed by how comfortable yet stylish this piece is. It pairs effortlessly with everything, and the quality really stands out. Definitely becoming my go-to for everyday looks!\\\"\"][/about-testimonials]\n[about-team heading=\"Gặp Gỡ Đội Ngũ\" subtitle=\"Những chuyên gia tận tâm với sự hoàn hảo trong từng chi tiết.\" quantity=\"4\" image_1=\"member/member-1.jpg\" name_1=\"Annette Black\" role_1=\"Nhà Sáng Lập/CEO\" social_links_1=\"\" image_2=\"member/member-2.jpg\" name_2=\"Brooklyn Simmons\" role_2=\"Quản Lý\" social_links_2=\"\" image_3=\"member/member-3.jpg\" name_3=\"Jane Cooper\" role_3=\"Giám Đốc Kinh Doanh\" social_links_3=\"\" image_4=\"member/member-4.jpg\" name_4=\"Lisa Bonet\" role_4=\"Giám Đốc Kinh Doanh\" social_links_4=\"\"][/about-team]'),('vi',2,'Liên hệ','Liên hệ với đội ngũ chăm sóc khách hàng và hợp tác của Amerce.',''),('vi',3,'Câu hỏi thường gặp','Câu hỏi thường gặp về đơn hàng, vận chuyển, đổi trả và quản lý tài khoản.','[page-banner heading=\"Câu Hỏi Thường Gặp\" subtitle=\"Got questions? We\'ve got answers! Browse our Câu Hỏi Thường Gặp to find information on orders, shipping,<br class=\\\"d-none d-lg-block\\\">returns, and more. If you need further assistance, feel free to contact our team.\"][/page-banner]\n[faq-page sidebar_image=\"section/banner-12.jpg\" sidebar_title=\"Save 25% <br class=\\\"d-none d-sm-block\\\">Today\" sidebar_subtitle=\"Áo Thun, Áo Hoodie Và Hơn Thế Nữa\" sidebar_cta=\"Xem Thêm\" sidebar_url=\"/products\" quantity=\"16\" category_1=\"Tài Khoản Của Tôi\" category_id_1=\"myAccount\" question_1=\"1. Tôi có thể làm gì nếu quên mật khẩu?\" answer_1=\"Use the \\\"Forgot password\\\" link on the sign-in page. We will email you a one-time link to set a new password — it expires in 30 minutes for security.\" category_2=\"Tài Khoản Của Tôi\" category_id_2=\"myAccount\" question_2=\"2. Làm thế nào để cập nhật địa chỉ email?\" answer_2=\"Đăng nhập, mở Tài khoản → Cài đặt và thay đổi trường email. Chúng tôi sẽ gửi email xác nhận đến địa chỉ mới; thay đổi sẽ có hiệu lực khi bạn nhấp vào liên kết đó.\" category_3=\"Tài Khoản Của Tôi\" category_id_3=\"myAccount\" question_3=\"3. Tôi có thể xóa tài khoản của mình không?\" answer_3=\"Có. Từ Tài khoản → Cài đặt, kéo xuống mục Xóa tài khoản. Chúng tôi giữ lại lịch sử đơn hàng vì lý do thuế/pháp lý, nhưng thông tin liên hệ cá nhân sẽ được xóa trong vòng 30 ngày.\" category_4=\"Đơn Hàng & Mua Sắm\" category_id_4=\"ordersPurchases\" question_4=\"1. Làm thế nào để đặt hàng?\" answer_4=\"Thêm sản phẩm vào giỏ hàng, nhấp thanh toán, chọn phương thức vận chuyển, sau đó nhập thông tin thanh toán. Bạn sẽ nhận được email xác nhận đơn hàng ngay lập tức.\" category_5=\"Đơn Hàng & Mua Sắm\" category_id_5=\"ordersPurchases\" question_5=\"2. Tôi có thể chỉnh sửa hoặc hủy đơn hàng không?\" answer_5=\"Đơn hàng có thể được chỉnh sửa hoặc hủy từ bảng điều khiển tài khoản của bạn trong vòng 1 giờ sau khi đặt. Sau đó, kho hàng đã bắt đầu soạn hàng và chúng tôi không thể can thiệp.\" category_6=\"Đơn Hàng & Mua Sắm\" category_id_6=\"ordersPurchases\" question_6=\"3. Những phương thức thanh toán nào được chấp nhận?\" answer_6=\"Chúng tôi chấp nhận Visa, Mastercard, American Express, Apple Pay, Google Pay và PayPal. Mọi giao dịch đều sử dụng mã hóa TLS 1.3.\" category_7=\"Đổi Trả & Hoàn Tiền\" category_id_7=\"returnsRefunds\" question_7=\"1. Thời hạn đổi trả là bao lâu?\" answer_7=\"30 ngày kể từ ngày nhận hàng đối với sản phẩm chưa qua sử dụng, còn nguyên trạng. Không áp dụng cho hàng giảm giá, đồ lót và các mặt hàng flash sale bán cuối cùng.\" category_8=\"Đổi Trả & Hoàn Tiền\" category_id_8=\"returnsRefunds\" question_8=\"2. Làm thế nào để bắt đầu quy trình đổi trả?\" answer_8=\"Open the order in your account dashboard and click \\\"Start return\\\". We email a prepaid label for domestic orders within one business day.\" category_9=\"Đổi Trả & Hoàn Tiền\" category_id_9=\"returnsRefunds\" question_9=\"3. Khi nào tôi sẽ nhận được tiền hoàn lại?\" answer_9=\"Tiền hoàn được xử lý trong vòng 3-5 ngày làm việc kể từ khi chúng tôi nhận được hàng trả lại. Thời gian ghi có của ngân hàng có thể khác nhau; vui lòng đợi tối đa 10 ngày làm việc để thấy khoản tiền được ghi nhận.\" category_10=\"Vận Chuyển & Theo Dõi\" category_id_10=\"shippingTracking\" question_10=\"1. Vận chuyển mất bao lâu?\" answer_10=\"Vận chuyển tiêu chuẩn nội địa mất 3-5 ngày làm việc. Vận chuyển nhanh 1-2 ngày. Vận chuyển tiêu chuẩn quốc tế mất 7-12 ngày làm việc; tùy chọn vận chuyển nhanh có sẵn ở trang thanh toán.\" category_11=\"Vận Chuyển & Theo Dõi\" category_id_11=\"shippingTracking\" question_11=\"2. Làm thế nào để theo dõi đơn hàng?\" answer_11=\"Liên kết theo dõi được đính kèm trong email xác nhận vận chuyển. Bạn cũng có thể xem trạng thái từ Tài khoản → Đơn hàng → Theo dõi.\" category_12=\"Vận Chuyển & Theo Dõi\" category_id_12=\"shippingTracking\" question_12=\"3. Bạn có vận chuyển quốc tế không?\" answer_12=\"Có — đến hầu hết các quốc gia. Thuế và phí được trả trước ở trang thanh toán cho một số điểm đến nhất định; nếu không, đơn vị vận chuyển có thể thu khi giao hàng.\" category_13=\"Phí & Thanh Toán\" category_id_13=\"feesBilling\" question_13=\"1. Thuế và phí đã được bao gồm chưa?\" answer_13=\"Giá nội địa bao gồm thuế bán hàng hiển thị ở trang thanh toán. Đơn hàng quốc tế đến các điểm đến được hỗ trợ đã bao gồm thuế và phí; nếu không, đơn vị vận chuyển sẽ thu khi giao hàng.\" category_14=\"Phí & Thanh Toán\" category_id_14=\"feesBilling\" question_14=\"2. Tại sao tôi bị tính phí hai lần?\" answer_14=\"Có thể bạn đang thấy khoản tạm giữ ủy quyền cùng với khoản phí thực tế. Khoản tạm giữ sẽ tự hủy trong 3-5 ngày làm việc. Hãy gửi email đến billing@amerce.test nếu sau thời gian đó bạn vẫn thấy hai khoản phí.\" category_15=\"Chủ Đề Khác\" category_id_15=\"otherTopic\" question_15=\"1. Bạn có cửa hàng vật lý không?\" answer_15=\"Có — vui lòng truy cập trang Cửa hàng để xem danh sách các cửa hàng chính và đối tác.\" category_16=\"Chủ Đề Khác\" category_id_16=\"otherTopic\" question_16=\"2. Làm thế nào để liên hệ bộ phận chăm sóc khách hàng?\" answer_16=\"Gửi email đến hello@amerce.test hoặc sử dụng biểu mẫu liên hệ. Chúng tôi sẽ phản hồi trong vòng một ngày làm việc.\"][/faq-page]'),('vi',4,'Chính sách bảo mật','Cách Amerce thu thập, sử dụng và bảo vệ thông tin cá nhân của bạn.','[page-banner heading=\"Chính Sách Bảo Mật\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Thông Tin Chúng Tôi Thu Thập\" body_1=\"<p class=\\\"term-text cl-text-2\\\">When you visit the Site, we automatically collect certain information about your device — web browser, IP address, time zone, and some of the cookies installed on your device. As you browse, we also collect data about the pages or products you view, what referred you to the Site, and how you interact with it. We refer to this as \\\"Device Information\\\".</p><p class=\\\"term-text cl-text-2\\\">When you make a purchase or attempt to purchase through the Site, we collect your name, billing address, shipping address, and payment information (including card number, email address, and phone number). We refer to this as \\\"Order Information\\\".</p>\" title_2=\"2. Cách Chúng Tôi Sử Dụng Thông Tin Của Bạn\" body_2=\"<p class=\\\"term-text cl-text-2\\\">We use Order Information to fulfil orders placed through the Site (process payment, arrange shipping, provide invoices and order confirmations). We use it to communicate with you, screen orders for fraud, and — in line with your preferences — share marketing about products you may like.</p><p class=\\\"term-text cl-text-2\\\">We use Device Information to screen for fraud and to improve the Site through analytics about how customers browse and interact with us.</p>\" title_3=\"3. Chia Sẻ Thông Tin Cá Nhân Của Bạn\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We share Personal Information with third-party service providers who help us run the Site. We may also share information to comply with applicable laws, respond to a subpoena or lawful request, or otherwise protect our rights.</p>\" title_4=\"4. Lưu Trữ Dữ Liệu\" body_4=\"<p class=\\\"term-text cl-text-2\\\">When you place an order, we maintain the Order Information for our records unless and until you ask us to delete it.</p>\" title_5=\"5. Quyền Của Bạn\" body_5=\"<p class=\\\"term-text cl-text-2\\\">You can request access, correction, or deletion of any personal data we hold about you. Email privacy@amerce.test from the address on file and we will respond within 30 days.</p>\" title_6=\"6. Cookie\" body_6=\"<p class=\\\"term-text cl-text-2\\\">Cookies are used to keep your cart between visits, remember your preferences, and measure aggregate traffic. You can disable cookies in your browser, though some Site features may stop working.</p>\" title_7=\"7. Thay Đổi\" body_7=\"<p class=\\\"term-text cl-text-2\\\">We may update this policy from time to time to reflect changes to our practices or for operational, legal, or regulatory reasons. The latest version will always be on this page.</p>\"][/term-content]'),('vi',5,'Điều khoản & Điều kiện','Các điều khoản pháp lý áp dụng khi bạn sử dụng cửa hàng Amerce.','[page-banner heading=\"Điều Khoản & Điều Kiện\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Chấp Thuận Điều Khoản\" body_1=\"<p class=\\\"term-text cl-text-2\\\">By accessing or using the Mỹ store you agree to these terms. We reserve the right to update them with reasonable notice; the latest version is always available on this page.</p>\" title_2=\"2. Đơn Hàng & Thanh Toán\" body_2=\"<p class=\\\"term-text cl-text-2\\\">All prices are in USD unless otherwise stated. We accept the payment methods displayed at checkout. An order becomes binding once you receive an order confirmation email.</p>\" title_3=\"3. Vận Chuyển\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Vận Chuyển options, lead times, and rates are listed on our Vận Chuyển page. Risk passes to you on delivery.</p>\" title_4=\"4. Đổi Trả\" body_4=\"<p class=\\\"term-text cl-text-2\\\">You have 30 days from delivery to return any unworn item for a refund. See our Đổi Trả &amp; Hoàn Tiền page for the full process.</p>\" title_5=\"5. Sở Hữu Trí Tuệ\" body_5=\"<p class=\\\"term-text cl-text-2\\\">All content on the Site — text, photography, logos, code — is owned by Mỹ or its licensors and may not be reproduced without written permission.</p>\" title_6=\"6. Giới Hạn Trách Nhiệm\" body_6=\"<p class=\\\"term-text cl-text-2\\\">To the maximum extent permitted by law, Mỹ is not liable for indirect or consequential damages arising from use of the Site or the products purchased through it.</p>\" title_7=\"7. Luật Áp Dụng\" body_7=\"<p class=\\\"term-text cl-text-2\\\">These terms are governed by the laws of the State of New York. Any dispute will be resolved in the state or federal courts located in New York County.</p>\"][/term-content]'),('vi',6,'Đổi trả & Hoàn tiền','Chính sách đổi trả 30 ngày và quy trình đổi trả từng bước của chúng tôi.','[page-banner heading=\"Đổi Trả & Hoàn Tiền\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Đổi Trả\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We want you to be completely satisfied with your purchase. If for any reason you are not, you may return any unworn item within 30 days of receiving your order for a refund or exchange. Mặt hàng must be in original packaging and the same condition as you received them.</p>\" title_2=\"2. Cách Bắt Đầu Đổi Trả\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Open the order in your account dashboard and click \\\"Start return\\\", or email returns@amerce.test with your order number. We will send a prepaid return label for domestic orders within one business day.</p>\" title_3=\"3. Hoàn Tiền\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Refunds are processed within 3-5 business days of us receiving the return and applied to the original payment method. Bank posting times vary; allow up to 10 business days for the credit to appear.</p>\" title_4=\"4. Các Trường Hợp Loại Trừ\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Sale items, intimate apparel, and final-sale flash sale purchases are excluded from returns. Personalised or made-to-order items are also non-returnable unless faulty.</p>\" title_5=\"5. Sản Phẩm Bị Hư Hỏng Hoặc Lỗi\" body_5=\"<p class=\\\"term-text cl-text-2\\\">If your order arrives damaged or faulty, email us within 7 days with photos. We will replace the item or issue a full refund — including any return shipping cost — at our expense.</p>\" title_6=\"6. Đổi Trả Quốc Tế\" body_6=\"<p class=\\\"term-text cl-text-2\\\">International customers are responsible for return shipping unless the item is faulty. We do not refund original shipping or duty charges on international returns.</p>\"][/term-content]'),('vi',7,'Vận chuyển','Các phương thức vận chuyển trong nước và quốc tế, thời gian và cước phí.','[page-banner heading=\"Vận Chuyển\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Phương Thức Vận Chuyển\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We offer the following shipping methods for domestic and international orders: standard ground, expedited 2-day, and priority overnight (where available).</p>\" title_2=\"2. Phí Nội Địa\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Standard ground is free on orders over $99. Express 1-2 day shipping is $19.99 flat. Priority overnight is calculated by weight at checkout.</p>\" title_3=\"3. Quốc Tế\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We ship to most countries. International standard shipping is $24.99 with 7-12 business day delivery. Express options appear at checkout. Duties and taxes are pre-paid for select destinations; otherwise the courier collects them on delivery.</p>\" title_4=\"4. Thời Gian Xử Lý\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Orders placed before 2pm EST on business days ship the same day. Orders placed after 2pm or on weekends/holidays ship the next business day.</p>\" title_5=\"5. Theo Dõi\" body_5=\"<p class=\\\"term-text cl-text-2\\\">A tracking link is included in your shipment confirmation email. You can also see live status from Account → Orders → Track.</p>\" title_6=\"6. Đơn Hàng Bị Thất Lạc Hoặc Bị Kẹt\" body_6=\"<p class=\\\"term-text cl-text-2\\\">If a tracking number has not updated for more than 7 business days, email shipping@amerce.test. We will open an investigation with the carrier and either refund or reship the order at our expense.</p>\"][/term-content]'),('vi',8,'Hệ thống cửa hàng','Ghé thăm Amerce trực tiếp — các cửa hàng chính và đối tác trên toàn thế giới.',''),('vi',9,'Tạp chí','Hướng dẫn phối đồ, câu chuyện thương hiệu và nội dung hậu trường từ đội ngũ biên tập Amerce.','<div class=\"container py-5\"><h1>Nhật Ký</h1><p>Khám phá những câu chuyện mới nhất của chúng tôi — hướng dẫn phong cách, điểm nhấn sản phẩm, phân tích chuyên sâu về bền vững và nhiều hơn nữa.</p></div>'),('vi',10,'Tuyển dụng','Tham gia Amerce — các vị trí đang mở, giá trị văn hóa và quyền lợi dành cho đội ngũ.','<div class=\"container py-5\"><h1>Tuyển Dụng Tại Amerce</h1><p>Chúng tôi là một đội ngũ nhỏ, làm việc phân tán, đang xây dựng một mô hình bán lẻ tinh tế hơn. Chúng tôi tuyển dụng trong các mảng sản phẩm, kỹ thuật, chuỗi cung ứng và trải nghiệm khách hàng.</p><p>Các vị trí đang tuyển được đăng trên trang LinkedIn của công ty. Để ứng tuyển, hãy gửi một thư ngắn và sơ yếu lý lịch đến <a href=\"mailto:careers@amerce.test\">careers@amerce.test</a>.</p></div>'),('vi',11,'Sustainability','How Amerce sources responsibly and reduces its environmental footprint.','<div class=\"container py-5\"><h1>Phát Triển Bền Vững Tại Amerce</h1><p>Mỗi sản phẩm đều mang một câu chuyện. Chúng tôi làm việc trực tiếp với các nhà máy và xưởng thủ công, ưu tiên vật liệu tái chế và có thể truy xuất nguồn gốc, và đóng gói không sử dụng nhựa.</p><p>Mục tiêu năm 2026 của chúng tôi: 90% nguyên vật liệu có chuỗi cung ứng được xác minh, và báo cáo tác động hằng năm minh bạch.</p></div>'),('vi',12,'Trang chủ','Amerce — trang chủ trải nghiệm thương mại điện tử đa năng.','[simple-slider key=\"home-hero\" style=\"style-baby\" is_autoplay=\"yes\" autoplay_speed=\"3000\" show_arrows=\"no\" show_dots=\"yes\" wrapper_class=\"pt-30 p-xl-0\" text_color=\"white\" button_style=\"pill-white\"][/simple-slider]\n[infinity-marquee style=\"style-1\" variant=\"policy\" background_class=\"\" spacing_class=\"flat-spacing\" use_container=\"yes\" clone_count=\"3\" quantity=\"4\" heading_1=\"Miễn phí vận chuyển cho mọi đơn hàng trên $20.00\" image_1=\"section/policy-1.jpg\" heading_2=\"Đổi trả miễn phí trong vòng 14 ngày\" image_2=\"section/policy-2.jpg\" heading_3=\"Miễn phí vận chuyển cho mọi đơn hàng trên $20.00\" image_3=\"section/policy-3.jpg\" heading_4=\"Đổi trả miễn phí trong vòng 14 ngày\" image_4=\"section/policy-4.jpg\"][/infinity-marquee]\n[categories-grid style=\"style-slider-wide-image\" spacing_class=\"themesFlat\" title=\"Mua Sắm Theo Danh Mục\" subtitle=\"Khám phá những vật dụng thiết yếu đáng tin cậy để vỗ về và nuôi dưỡng bé yêu của bạn.\" limit=\"8\" show_count=\"yes\"][/categories-grid]\n[ecommerce-products style=\"style-tabs\" title=\"This Week&rsquo;s Highlights\" subtitle=\"Khám phá những vật dụng thiết yếu cho bé được yêu thích nhất, tuyển chọn vì sự thoải mái, an toàn và phong cách.\" source=\"latest\" limit=\"8\" items_per_row=\"4\" tab_labels=\"New|Phổ biến|Sale|Đứa bé|trẻ em\" tab_sources=\"latest|best-seller|sale|featured|latest\" tab_nav_class_extra=\"style-2\" grid_rows=\"2\" product_wrapper_class=\"square\"][/ecommerce-products]\n[image-gallery style=\"style-paired-banner-side\" quantity=\"2\" image_1=\"section/banner-19.jpg\" link_1=\"/products\" title_1=\"Niềm Vui Nhỏ, Tiết Kiệm Lớn!\" description_1=\"Giảm tới 50% cho những món đồ không thể thiếu của bé\" button_text_1=\"Xem Tất Cả Sản Phẩm\" image_2=\"section/banner-20.jpg\" link_2=\"/products\" title_2=\"Những Phát Hiện Mới Cho Nụ Cười Bé Thơ\" description_2=\"Mềm mại, an toàn và sẵn sàng cho mọi cái ôm.\" button_text_2=\"Khám Phá Ngay\"][/image-gallery]\n[ecommerce-products style=\"style-banner-carousel-side\" title=\"\" subtitle=\"\" custom_title=\"Yêu Thích Của Cha Mẹ &amp; Bé\" custom_subtitle=\"Khám phá những vật dụng thiết yếu mềm mại nhất, được yêu thích nhất cho thế giới nhỏ bé của bạn.\" view_all_url=\"/products\" view_all_text=\"Xem Tất Cả Sản Phẩm\" banner_image=\"section/banner-21.jpg\" banner_subheading=\"TÌNH YÊU TRONG TỪNG CHI TIẾT NHỎ\" banner_heading=\"Thoải Mái Và Chăm Sóc Cho Bé Yêu\" banner_button_text=\"Xem Tất Cả Sản Phẩm\" banner_button_url=\"/products\" source=\"featured\" limit=\"6\" items_per_row=\"2\"][/ecommerce-products]\n[lookbook-hotspot style=\"style-bundle-slider\" title=\"Bộ Sản Phẩm Hoàn Hảo Cho Bé\" subtitle=\"Bộ sưu tập được tuyển chọn kỹ lưỡng những món đồ cao cấp không thể thiếu cho bé, vì sự thoải mái và chất lượng.\" image=\"section/banner-lookbook-6.jpg\" image_2=\"section/banner-lookbook-7.jpg\" quantity=\"4\" x_percent_1=\"32.5\" y_percent_1=\"61.2\" product_id_1=\"1\" column_1=\"1\" x_percent_2=\"61.7\" y_percent_2=\"51.8\" product_id_2=\"9\" column_2=\"1\" x_percent_3=\"32.5\" y_percent_3=\"61.2\" product_id_3=\"2\" column_3=\"2\" x_percent_4=\"61.7\" y_percent_4=\"51.8\" product_id_4=\"10\" column_4=\"2\"][/lookbook-hotspot]\n[testimonials style=\"style-v2-product\" card_type=\"type-2\" title=\"Được Những Bậc Cha Mẹ Hạnh Phúc Yêu Thích\" subtitle=\"Những câu chuyện thật từ các bà mẹ và ông bố tin tưởng giao việc chăm sóc bé yêu cho chúng tôi.\" autoplay=\"yes\" limit=\"4\" view_all_url=\"/products\" view_all_text=\"Xem Tất Cả Sản Phẩm\" testimonial_product_ids=\"1,9,10,3\"][/testimonials]\n[blog-posts style=\"style-slider\" title=\"Câu Chuyện Cho Cha Mẹ Hiện Đại\" subtitle=\"Những ý tưởng sâu sắc và nguồn cảm hứng mỗi ngày để nuôi dạy những thiên thần nhỏ hạnh phúc.\" limit=\"6\" show_meta=\"yes\" show_excerpt=\"yes\"][/blog-posts]\n[image-gallery style=\"style-default\" skip_spacing=\"yes\" title=\"Mua Sắm Trên Instagram\" subtitle=\"Nâng tầm tủ đồ của bạn với những phát hiện mới ngay hôm nay!\" quantity=\"5\" image_1=\"gallery/gallery-17.jpg\" link_1=\"/products\" image_2=\"gallery/gallery-18.jpg\" link_2=\"/products\" image_3=\"gallery/gallery-19.jpg\" link_3=\"/products\" image_4=\"gallery/gallery-20.jpg\" link_4=\"/products\" image_5=\"gallery/gallery-21.jpg\" link_5=\"/products\"][/image-gallery]');
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_logs`
--

DROP TABLE IF EXISTS `payment_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `response` longtext COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_logs`
--

LOCK TABLES `payment_logs` WRITE;
/*!40000 ALTER TABLE `payment_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `charge_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `payment_fee` decimal(15,2) DEFAULT '0.00',
  `order_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` bigint unsigned DEFAULT NULL,
  `refunded_amount` decimal(15,2) unsigned DEFAULT NULL,
  `refund_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `category_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_categories_category_id_index` (`category_id`),
  KEY `post_categories_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (1,1),(4,1),(4,2),(3,2),(2,3),(5,3),(5,4),(4,4),(3,5),(1,5),(3,6),(5,6);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_tags_tag_id_index` (`tag_id`),
  KEY `post_tags_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (3,1),(12,1),(5,1),(11,2),(10,2),(4,2),(4,3),(2,3),(8,3),(9,4),(2,4),(8,4),(3,5),(7,5),(11,5),(10,6),(2,6),(8,6);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_status_index` (`status`),
  KEY `posts_author_id_index` (`author_id`),
  KEY `posts_author_type_index` (`author_type`),
  KEY `posts_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Soothe Baby Before Sleep','Predictable cues, dim light, and a quiet voice — the building blocks of an easier bedtime.','<p>Most babies settle faster when the wind-down begins twenty minutes before the first yawn. Lights low, voices calm, and a consistent sequence — bath, lotion, sleep sack, story — train the nervous system to expect rest.</p><p>Skip the screens. Trade them for skin contact and white noise that mimics the womb.</p>','published',1,'Botble\\ACL\\Models\\User',1,'blog/blog-16.jpg',1643,NULL,'2026-05-28 18:59:10','2026-05-28 18:59:10'),(2,'Cozy Morning Routine','Gentle wake-ups, feeding cues, and warm clothes — building a slow start that babies love.','<p>Babies regulate by repetition. A predictable morning — diaper, feed, fresh outfit, daylight — anchors the rest of the day. Add a soft song you only sing in the morning to cue the transition.</p><p>The point is not to be early; it is to be unhurried.</p>','published',1,'Botble\\ACL\\Models\\User',1,'blog/blog-17.jpg',1896,NULL,'2026-05-28 18:59:10','2026-05-28 18:59:10'),(3,'Bonding Through Daily Care','Bath time, feeding, and gentle massage — the small moments that wire secure attachment.','<p>Bonding does not require special activities. The real work happens in the everyday: eye contact during feeds, a slow towel-dry after the bath, a calm voice when changing a diaper.</p><p>Choose presence over performance. Babies are not grading.</p>','published',1,'Botble\\ACL\\Models\\User',1,'blog/blog-18.jpg',586,NULL,'2026-05-28 18:59:10','2026-05-28 18:59:10'),(4,'Choosing Babys First Shoes','Soft soles, room to wiggle, and why structured shoes can wait until later.','<p>Pre-walkers do not need rigid shoes. Soft, flexible soles let little feet feel the ground and develop natural arch strength. Look for breathable leather or wool with a snug heel and roomy toe box.</p><p>Save the rugged trainers for confident walkers.</p>','published',1,'Botble\\ACL\\Models\\User',1,'blog/blog-16.jpg',2240,NULL,'2026-05-28 18:59:10','2026-05-28 18:59:10'),(5,'Safe Sleep Guidelines','Back to sleep, firm flat mattress, no loose bedding — a refresher worth re-reading.','<p>The ABCs of safe sleep: Alone, on the Back, in a Crib. Skip soft toys, blankets, and bumpers in the first year. A correctly fitted sleeping bag replaces every loose layer and keeps temperature steady.</p><p>If anything in the cot moves, it does not belong there.</p>','published',1,'Botble\\ACL\\Models\\User',1,'blog/blog-17.jpg',344,NULL,'2026-05-28 18:59:10','2026-05-28 18:59:10'),(6,'Bath Time Made Easy','Right water temperature, gentle products, and how to keep bath time short and sweet.','<p>Bath water should feel warm but not hot — about 37 degrees C. Skip soap until baby is mobile and sticky; plain water and a soft cloth do the job. Wrap straight into a hooded towel for the calmest transition.</p><p>Keep it under ten minutes; baby skin dries quickly.</p>','published',1,'Botble\\ACL\\Models\\User',0,'blog/blog-18.jpg',835,NULL,'2026-05-28 18:59:10','2026-05-28 18:59:10');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`),
  KEY `idx_posts_trans_posts_id` (`posts_id`),
  KEY `idx_posts_trans_post_lang` (`posts_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
INSERT INTO `posts_translations` VALUES ('ar',1,'تهدئة الطفل قبل النوم','الإشارات التي يمكن التنبؤ بها، والأضواء الخافتة، والأصوات الهادئة - هي العناصر الأساسية لوقت نوم أسهل.','<p> ينام معظم الأطفال بشكل أسرع عندما يبدأ الاسترخاء قبل عشرين دقيقة من التثاؤب الأول. الأضواء الخافتة، والأصوات الهادئة، والروتين المستمر - الحمام، والغسول، وحقيبة النوم، والقصة - سوف تدرب الجهاز العصبي على توقع الراحة. </p><p> ابتعد عن الشاشات. استبدلها بملامسة الجلد والضوضاء البيضاء التي تحاكي البيئة في الرحم.</p>'),('ar',2,'روتين صباحي مريح','الاستيقاظ اللطيف، وإشارات الجوع، والملابس المريحة – كل ذلك يبني بداية بطيئة يحبها الأطفال.','<p> ينظم الأطفال أنفسهم من خلال التكرار. إن الصباح الذي يمكن التنبؤ به - تغيير الحفاضات، والوجبات، والملابس الجديدة، وضوء النهار - سوف يشكل بقية اليوم. أضف أغنية هادئة تغنيها فقط في الصباح للإشارة إلى المرحلة الانتقالية.</p><p>الهدف ليس الاستيقاظ مبكرًا؛ ولكن ليس على عجل.</p>'),('ar',3,'الترابط من خلال الرعاية اليومية','وقت الاستحمام، والوجبات، والتدليك اللطيف - اللحظات الصغيرة التي تخلق رابطة آمنة.','<p> التماسك لا يتطلب أنشطة خاصة. ما يهم حقًا يحدث في الحياة اليومية: التواصل البصري أثناء الرضاعة، وتجفيف الطفل ببطء بعد الاستحمام، والصوت الهادئ أثناء تغيير الحفاضات.</p><p>اختر الحضور بدلًا من التعبير. لا يتم تصنيف الأطفال.</p>'),('ar',4,'اختيار أحذية الطفل الأول','النعل ناعم، ومساحة كافية لأصابع القدم للاهتزاز، والسبب في أن الحذاء ذو ​​بنية صلبة يمكن أن ينتظر حتى وقت لاحق.','<p>الأطفال الذين لا يستطيعون المشي بعد لا يحتاجون إلى أحذية صلبة. النعل الناعم والمرن يسمح للأقدام الصغيرة بالشعور بالأرض وتطوير قوة القوس الطبيعية. ابحث عن الجلد أو الصوف المسامي مع كعب مريح وغطاء واسع عند الأصابع.</p><p>وفر أحذية رياضية متينة للأطفال الذين يمشون جيدًا بالفعل.</p>'),('ar',5,'إرشادات النوم الآمن','نم على ظهرك، مع مرتبة مسطحة ثابتة، بدون فراش فضفاض - مراجعة تستحق إعادة القراءة.','<p> المبادئ الأساسية للنوم الآمن: النوم بمفردك، على ظهرك، في السرير. تجنب الدمى المحشوة الناعمة والبطانيات والمصدات خلال السنة الأولى. سوف تحل حقيبة النوم المجهزة بشكل صحيح محل أي أغطية فضفاضة وتحافظ على استقرار درجة الحرارة.</p><p>إذا كان أي شيء في السرير يمكن أن يتحرك، فلا ينبغي أن يكون هناك.</p>'),('ar',6,'أصبح وقت الاستحمام سهلاً','درجة حرارة الماء المناسبة والمنتجات اللطيفة وطرق الاستحمام لجعل وقت الاستحمام قصيرًا وممتعًا.','<p> يجب أن يكون ماء الاستحمام دافئًا ولكن ليس ساخنًا - حوالي 37 درجة مئوية. تخطي الصابون حتى يتمكن طفلك من الزحف والاتساخ؛ الماء النظيف ومنشفة ناعمة كافية. لفي طفلك على الفور بمنشفة مغطاة بغطاء للرأس من أجل انتقال سلس.</p><p>حافظي على وقت الاستحمام أقل من عشر دقائق؛ تجف بشرة الطفل بسرعة كبيرة.</p>'),('fr',1,'Apaiser bébé avant de dormir','Des signaux prévisibles, des lumières douces et des voix apaisantes : les éléments de base pour une heure de coucher plus facile.','<p>La plupart des bébés s\'endorment plus rapidement lorsque la relaxation commence vingt minutes avant le premier bâillement. Des lumières tamisées, des voix apaisantes et une routine cohérente (bain, lotion, sac de couchage, histoire) entraîneront le système nerveux à s\'attendre au repos.</p><p>Restez à l\'écart des écrans. Remplacez-les par un contact cutané et un bruit blanc qui simule l\'environnement dans l\'utérus.</p>'),('fr',2,'Routine matinale douillette','Des réveils en douceur, des signaux de faim et des vêtements confortables : créez un démarrage lent que les bébés adorent.','<p>Les bébés se régulent par la répétition. Une matinée prévisible – changements de couches, tétées, nouveaux vêtements, lumière du jour – façonnera le reste de la journée. Ajoutez une chanson apaisante que vous chantez uniquement le matin pour signaler la transition.</p><p>Le but n\'est pas de se réveiller tôt ; mais pas pressé.</p>'),('fr',3,'Créer des liens grâce aux soins quotidiens','L’heure du bain, les tétées et les massages doux : les petits moments qui créent un lien sécurisé.','<p>La cohésion ne nécessite pas d\'activités particulières. Ce qui compte vraiment se passe au quotidien : le contact visuel pendant les tétées, le séchage lent de bébé après le bain, une voix apaisante lors du changement de couche.</p><p>Choisissez la présence plutôt que l\'expression. Les enfants ne sont pas notés.</p>'),('fr',4,'Choisir les premières chaussures de bébé','La semelle est douce, suffisamment d\'espace pour que les orteils puissent bouger, et la raison pour laquelle la chaussure a une construction rigide peut attendre plus tard.','<p>Les bébés qui ne savent pas encore marcher n\'ont pas besoin de chaussures rigides. La semelle souple et flexible permet aux petits pieds de sentir le sol et de développer une force naturelle de la voûte plantaire. Recherchez du cuir ou de la laine respirant avec un talon bien ajusté et un bout spacieux.</p><p>Épargnez des baskets robustes pour les enfants qui marchent déjà bien.</p>'),('fr',5,'Directives pour un sommeil sécuritaire','Dormez sur le dos, avec un matelas plat et ferme, sans literie lâche – une critique qui mérite d\'être relue.','<p>Principes de base pour un sommeil sécuritaire : dormir seul, sur le dos, dans un berceau. Évitez les peluches, les couvertures et les pare-chocs pendant la première année. Un sac de couchage bien ajusté remplacera toutes les couvertures lâches et maintiendra la température stable.</p><p>Si quelque chose dans le berceau peut bouger, il ne devrait pas être là.</p>'),('fr',6,'L’heure du bain simplifiée','La bonne température de l’eau, des produits doux et des moyens de rendre le bain court et agréable.','<p>L\'eau du bain doit être tiède mais pas chaude – environ 37 degrés Celsius. Évitez le savon jusqu\'à ce que votre bébé puisse ramper et se salir ; De l’eau propre et une serviette douce suffisent. Enveloppez immédiatement votre bébé dans une serviette à capuche pour une transition en douceur.</p><p>Gardez l\'heure du bain en dessous de dix minutes ; La peau de bébé sèche très rapidement.</p>'),('id',1,'Tenangkan Bayi Sebelum Tidur','Isyarat yang dapat diprediksi, cahaya lembut, dan suara yang menenangkan — elemen penyusun untuk waktu tidur yang lebih mudah.','<p>Kebanyakan bayi akan tertidur lebih cepat ketika relaksasi dimulai dua puluh menit sebelum menguap pertama. Lampu redup, suara menenangkan, dan rutinitas yang konsisten — mandi, lotion, kantong tidur, cerita — akan melatih sistem saraf untuk mengharapkan istirahat.</p><p>Jauhi layar. Gantikan dengan kontak kulit dan white noise yang mensimulasikan lingkungan di dalam rahim.</p>'),('id',2,'Rutinitas Pagi yang Nyaman','Bangun tidur yang lembut, isyarat lapar, dan pakaian yang nyaman — membangun awal yang lambat yang disukai bayi.','<p>Bayi mengatur dirinya sendiri melalui pengulangan. Pagi hari yang dapat diprediksi—penggantian popok, menyusui, pakaian baru, siang hari—akan menentukan sisa hari itu. Tambahkan lagu menenangkan yang Anda nyanyikan hanya di pagi hari untuk menandakan transisi.</p><p>Tujuannya bukan untuk bangun pagi; tapi tidak terburu-buru.</p>'),('id',3,'Ikatan Melalui Perawatan Sehari-hari','Waktu mandi, menyusui, dan pijatan lembut — momen kecil yang menciptakan ikatan yang aman.','<p>Kohesi tidak memerlukan kegiatan khusus. Yang paling penting terjadi dalam keseharian: kontak mata saat menyusu, mengeringkan bayi secara perlahan setelah mandi, suara yang menenangkan saat mengganti popok.</p><p>Pilih kehadiran dibandingkan ekspresi. Anak tidak dinilai.</p>'),('id',4,'Memilih Sepatu Pertama Bayi','Solnya lembut, cukup ruang bagi jari-jari kaki untuk bergerak, dan alasan mengapa sepatu memiliki konstruksi yang kaku bisa menunggu sampai nanti.','<p>Bayi yang belum bisa berjalan tidak membutuhkan sepatu yang keras. Sol yang lembut dan fleksibel memungkinkan kaki si kecil merasakan tanah dan mengembangkan kekuatan lengkungan alami. Carilah bahan kulit atau wol yang menyerap keringat dengan hak yang pas dan penutup kaki yang lapang.</p><p>Simpan sepatu kets kokoh untuk anak yang sudah dapat berjalan dengan baik.</p>'),('id',5,'Pedoman Tidur yang Aman','Tidur telentang, dengan kasur datar yang kokoh, tanpa alas tidur yang longgar — ulasan ini layak untuk dibaca ulang.','<p>Prinsip dasar tidur yang aman: tidur sendirian, telentang, di tempat tidur bayi. Hindari boneka binatang yang lembut, selimut dan bumper untuk tahun pertama. Kantong tidur yang dipasang dengan benar akan menggantikan penutup yang longgar dan menjaga suhu tetap stabil.</p><p>Jika ada benda di dalam tempat tidur bayi yang bisa bergerak, seharusnya benda itu tidak ada di sana.</p>'),('id',6,'Waktu Mandi Menjadi Mudah','Suhu air yang tepat, produk yang lembut, dan cara agar waktu mandi tetap singkat dan menyenangkan.','<p>Air mandi harus hangat tetapi tidak panas — sekitar 37 derajat Celcius. Jangan gunakan sabun sampai bayi Anda bisa merangkak dan menjadi kotor; Air bersih dan handuk lembut sudah cukup. Segera bungkus bayi Anda dengan handuk bertudung untuk transisi yang paling lancar.</p><p>Jaga waktu mandi kurang dari sepuluh menit; Kulit bayi cepat kering.</p>'),('tr',1,'Bebeği Uyumadan Önce Yatıştırın','Tahmin edilebilir ipuçları, yumuşak ışıklar ve rahatlatıcı sesler; daha kolay bir yatma vaktinin yapı taşlarıdır.','<p>Bebeklerin çoğu, ilk esnemeden yirmi dakika önce gevşeme başladığında uykuya daha çabuk dalacaktır. Loş ışıklar, rahatlatıcı sesler ve tutarlı bir rutin (banyo, losyon, uyku tulumu, hikaye) sinir sistemini dinlenmeyi beklemesi için eğitecektir.</p><p>Ekranlardan uzak durun. Bunları, rahimdeki ortamı simüle eden cilt teması ve beyaz gürültü ile değiştirin.</p>'),('tr',2,'Rahat Sabah Rutini','Nazik uyandırmalar, acıkma işaretleri ve rahat kıyafetler; bebeklerin seveceği yavaş bir başlangıç ​​sağlar.','<p>Bebekler tekrarlama yoluyla kendilerini düzenlerler. Tahmin edilebilir bir sabah (bez değiştirme, emzirme, yeni kıyafetler, gün ışığı) günün geri kalanını şekillendirecek. Geçişin sinyalini vermek için yalnızca sabahları söyleyeceğiniz rahatlatıcı bir şarkı ekleyin.</p><p>Amaç erken kalkmak değil; ama acelesi yok.</p>'),('tr',3,'Günlük Bakım Sayesinde Bağlanma','Banyo zamanı, beslenme ve hafif masajlar; güvenli bir bağ oluşturan küçük anlar.','<p>Uyum özel aktivite gerektirmez. Her gün gerçekten önemli olan şeyler oluyor: Beslenme sırasında göz teması, banyodan sonra bebeği yavaşça kurulama, bez değiştirirken rahatlatıcı bir ses.</p><p>İfade yerine varlığı tercih edin. Çocuklara not verilmez.</p>'),('tr',4,'Bebeğin İlk Ayakkabısını Seçmek','Taban yumuşaktır, ayak parmaklarının hareket etmesine yetecek kadar yer vardır ve ayakkabının sert bir yapıya sahip olmasının nedeni daha sonraya kadar bekleyebilir.','<p>Henüz yürüyemeyen bebeklerin sert ayakkabılara ihtiyacı yoktur. Yumuşak, esnek taban, küçük ayakların yeri hissetmesini ve doğal ayak kemeri gücünü geliştirmesini sağlar. Sıkı topuklu ve geniş burunlu, nefes alabilen deri veya yün tercih edin.</p><p>Halihazırda iyi yürüyen çocuklar için sağlam spor ayakkabılardan tasarruf edin.</p>'),('tr',5,'Güvenli Uyku Kuralları','Sert, düz bir yatakla, bol yatak olmadan sırt üstü uyuyun; yeniden okumaya değer bir inceleme.','<p>Güvenli uykunun temel ilkeleri: Beşikte sırt üstü, yalnız uyuyun. İlk yıl yumuşak peluş hayvanlardan, battaniyelerden ve tamponlardan kaçının. Uygun şekilde yerleştirilmiş bir uyku tulumu, gevşek örtülerin yerini alacak ve sıcaklığı sabit tutacaktır.</p><p>Beşikte hareket edebilen bir şey varsa, orada olmamalıdır.</p>'),('tr',6,'Banyo Zamanı Kolaylaştı','Doğru su sıcaklığı, yumuşak ürünler ve banyo süresini kısa ve keyifli tutmanın yolları.','<p>Banyo suyu ılık olmalı ancak sıcak olmamalıdır - yaklaşık 37 santigrat derece. Bebeğiniz emekleyip kirlenene kadar sabunu atlayın; Temiz su ve yumuşak bir havlu yeterlidir. En yumuşak geçiş için bebeğinizi hemen kapüşonlu bir havluya sarın.</p><p>Banyo süresini on dakikanın altında tutun; Bebeğin cildi çok çabuk kurur.</p>'),('vi',1,'Vỗ Về Bé Trước Khi Ngủ','Tín hiệu dễ đoán, ánh đèn dịu nhẹ và giọng nói êm ái — những viên gạch nền tảng cho một giờ đi ngủ dễ dàng hơn.','<p>Hầu hết các bé sẽ vào giấc nhanh hơn khi việc thư giãn bắt đầu hai mươi phút trước cái ngáp đầu tiên. Đèn mờ, giọng nói êm dịu và một trình tự nhất quán — tắm, thoa lotion, mặc túi ngủ, kể chuyện — sẽ rèn luyện hệ thần kinh mong đợi sự nghỉ ngơi.</p><p>Tránh xa màn hình. Hãy thay thế chúng bằng sự tiếp xúc da và tiếng ồn trắng mô phỏng môi trường trong bụng mẹ.</p>'),('vi',2,'Nếp Sinh Hoạt Buổi Sáng Ấm Áp','Đánh thức nhẹ nhàng, tín hiệu đói bụng và quần áo ấm áp — xây dựng một khởi đầu chậm rãi mà các bé yêu thích.','<p>Các bé tự điều hòa nhờ sự lặp lại. Một buổi sáng dễ đoán — thay tã, cho ăn, mặc đồ mới, đón ánh sáng ban ngày — sẽ định hình phần còn lại của ngày. Hãy thêm một bài hát êm dịu mà bạn chỉ hát vào buổi sáng để báo hiệu sự chuyển tiếp.</p><p>Mục đích không phải là dậy sớm; mà là không vội vàng.</p>'),('vi',3,'Gắn Kết Qua Việc Chăm Sóc Hằng Ngày','Giờ tắm, cho ăn và mát-xa nhẹ nhàng — những khoảnh khắc nhỏ tạo nên sự gắn bó an toàn.','<p>Sự gắn kết không cần đến những hoạt động đặc biệt. Điều thực sự quan trọng diễn ra trong những việc thường ngày: giao tiếp bằng mắt khi cho ăn, lau khô người bé chậm rãi sau khi tắm, giọng nói êm dịu khi thay tã.</p><p>Hãy chọn sự hiện diện thay vì sự thể hiện. Các bé không chấm điểm đâu.</p>'),('vi',4,'Chọn Đôi Giày Đầu Tiên Cho Bé','Đế mềm, đủ chỗ cho ngón chân ngọ nguậy và lý do giày có cấu trúc cứng có thể đợi đến sau này.','<p>Các bé chưa biết đi không cần giày cứng. Đế mềm, dẻo cho phép đôi chân nhỏ cảm nhận mặt đất và phát triển sức mạnh vòm bàn chân tự nhiên. Hãy tìm loại da hoặc len thoáng khí với gót ôm vừa và mũi giày rộng rãi.</p><p>Hãy để dành những đôi giày thể thao chắc chắn cho những bé đã đi vững.</p>'),('vi',5,'Hướng Dẫn Ngủ An Toàn','Nằm ngửa khi ngủ, nệm phẳng cứng, không chăn gối lỏng lẻo — một bài ôn tập đáng đọc lại.','<p>Nguyên tắc cơ bản của giấc ngủ an toàn: ngủ một mình, nằm ngửa, trong cũi. Tránh thú bông mềm, chăn và đệm chắn trong năm đầu tiên. Một chiếc túi ngủ vừa vặn đúng cách sẽ thay thế mọi lớp phủ lỏng lẻo và giữ nhiệt độ ổn định.</p><p>Nếu bất cứ thứ gì trong cũi có thể xê dịch, nó không nên ở đó.</p>'),('vi',6,'Giờ Tắm Trở Nên Dễ Dàng','Nhiệt độ nước phù hợp, sản phẩm dịu nhẹ và cách giữ cho giờ tắm ngắn gọn và dễ chịu.','<p>Nước tắm nên ấm nhưng không nóng — khoảng 37 độ C. Hãy bỏ qua xà phòng cho đến khi bé biết bò và bị bám bẩn; nước sạch và một chiếc khăn mềm là đủ. Quấn bé ngay vào khăn tắm có mũ để có sự chuyển tiếp êm dịu nhất.</p><p>Hãy giữ thời gian tắm dưới mười phút; da bé khô rất nhanh.</p>');
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_notification_recipients`
--

DROP TABLE IF EXISTS `push_notification_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `push_notification_recipients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `push_notification_id` bigint unsigned NOT NULL,
  `user_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `device_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sent',
  `sent_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `clicked_at` timestamp NULL DEFAULT NULL,
  `fcm_response` json DEFAULT NULL,
  `error_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pnr_notification_user_index` (`push_notification_id`,`user_type`,`user_id`),
  KEY `pnr_user_status_index` (`user_type`,`user_id`,`status`),
  KEY `pnr_user_read_index` (`user_type`,`user_id`,`read_at`),
  KEY `pnr_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_notification_recipients`
--

LOCK TABLES `push_notification_recipients` WRITE;
/*!40000 ALTER TABLE `push_notification_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_notification_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_notifications`
--

DROP TABLE IF EXISTS `push_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `push_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'general',
  `target_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` json DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sent',
  `sent_count` int NOT NULL DEFAULT '0',
  `failed_count` int NOT NULL DEFAULT '0',
  `delivered_count` int NOT NULL DEFAULT '0',
  `read_count` int NOT NULL DEFAULT '0',
  `scheduled_at` timestamp NULL DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `push_notifications_type_created_at_index` (`type`,`created_at`),
  KEY `push_notifications_status_scheduled_at_index` (`status`,`scheduled_at`),
  KEY `push_notifications_created_by_index` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_notifications`
--

LOCK TABLES `push_notifications` WRITE;
/*!40000 ALTER TABLE `push_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_logs`
--

DROP TABLE IF EXISTS `request_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int unsigned NOT NULL DEFAULT '0',
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_logs`
--

LOCK TABLES `request_logs` WRITE;
/*!40000 ALTER TABLE `request_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.cms\":true,\"core.manage.license\":true,\"systems.cronjob\":true,\"core.tools\":true,\"tools.data-synchronize\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.common\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"settings.phone-number\":true,\"settings.others\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"pages.export\":true,\"pages.import\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"sitemap.settings\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"theme.robots-txt\":true,\"settings.website-tracking\":true,\"widgets.index\":true,\"ads.index\":true,\"ads.create\":true,\"ads.edit\":true,\"ads.destroy\":true,\"ads.settings\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"announcements.index\":true,\"announcements.create\":true,\"announcements.edit\":true,\"announcements.destroy\":true,\"announcements.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"blog.reports\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"posts.export\":true,\"posts.import\":true,\"captcha.settings\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.custom-fields\":true,\"contact.settings\":true,\"plugins.ecommerce\":true,\"ecommerce.report.index\":true,\"products.index\":true,\"products.create\":true,\"products.edit\":true,\"products.destroy\":true,\"products.duplicate\":true,\"ecommerce.product-prices.index\":true,\"ecommerce.product-prices.edit\":true,\"ecommerce.product-inventory.index\":true,\"ecommerce.product-inventory.edit\":true,\"product-categories.index\":true,\"product-categories.create\":true,\"product-categories.edit\":true,\"product-categories.destroy\":true,\"product-tag.index\":true,\"product-tag.create\":true,\"product-tag.edit\":true,\"product-tag.destroy\":true,\"brands.index\":true,\"brands.create\":true,\"brands.edit\":true,\"brands.destroy\":true,\"product-collections.index\":true,\"product-collections.create\":true,\"product-collections.edit\":true,\"product-collections.destroy\":true,\"product-attribute-sets.index\":true,\"product-attribute-sets.create\":true,\"product-attribute-sets.edit\":true,\"product-attribute-sets.destroy\":true,\"product-attributes.index\":true,\"product-attributes.create\":true,\"product-attributes.edit\":true,\"product-attributes.destroy\":true,\"tax.index\":true,\"tax.create\":true,\"tax.edit\":true,\"tax.destroy\":true,\"reviews.index\":true,\"reviews.create\":true,\"reviews.destroy\":true,\"reviews.publish\":true,\"reviews.reply\":true,\"ecommerce.shipments.index\":true,\"ecommerce.shipments.create\":true,\"ecommerce.shipments.edit\":true,\"ecommerce.shipments.destroy\":true,\"orders.index\":true,\"orders.create\":true,\"orders.edit\":true,\"orders.destroy\":true,\"discounts.index\":true,\"discounts.create\":true,\"discounts.edit\":true,\"discounts.destroy\":true,\"customers.index\":true,\"customers.create\":true,\"customers.edit\":true,\"customers.destroy\":true,\"ecommerce.customers.import\":true,\"ecommerce.customers.export\":true,\"ecommerce.customer-carts.index\":true,\"ecommerce.customer-carts.destroy\":true,\"flash-sale.index\":true,\"flash-sale.create\":true,\"flash-sale.edit\":true,\"flash-sale.destroy\":true,\"product-label.index\":true,\"product-label.create\":true,\"product-label.edit\":true,\"product-label.destroy\":true,\"ecommerce.import.products.index\":true,\"ecommerce.export.products.index\":true,\"order_returns.index\":true,\"order_returns.edit\":true,\"order_returns.destroy\":true,\"global-option.index\":true,\"global-option.create\":true,\"global-option.edit\":true,\"global-option.destroy\":true,\"ecommerce.invoice.index\":true,\"ecommerce.invoice.edit\":true,\"ecommerce.invoice.destroy\":true,\"ecommerce.settings\":true,\"ecommerce.settings.general\":true,\"ecommerce.invoice-template.index\":true,\"ecommerce.settings.currencies\":true,\"ecommerce.settings.products\":true,\"ecommerce.settings.product-search\":true,\"ecommerce.settings.digital-products\":true,\"ecommerce.settings.store-locators\":true,\"ecommerce.settings.invoices\":true,\"ecommerce.settings.product-reviews\":true,\"ecommerce.settings.customers\":true,\"ecommerce.settings.shopping\":true,\"ecommerce.settings.taxes\":true,\"ecommerce.settings.shipping\":true,\"ecommerce.shipping-rule-items.index\":true,\"ecommerce.shipping-rule-items.create\":true,\"ecommerce.shipping-rule-items.edit\":true,\"ecommerce.shipping-rule-items.destroy\":true,\"ecommerce.shipping-rule-items.bulk-import\":true,\"ecommerce.settings.tracking\":true,\"ecommerce.settings.standard-and-format\":true,\"ecommerce.settings.checkout\":true,\"ecommerce.settings.return\":true,\"ecommerce.settings.flash-sale\":true,\"ecommerce.settings.pending-orders\":true,\"ecommerce.settings.product-specification\":true,\"product-categories.export\":true,\"product-categories.import\":true,\"product-license-codes.import\":true,\"orders.export\":true,\"ecommerce.product-specification.index\":true,\"ecommerce.specification-groups.index\":true,\"ecommerce.specification-groups.create\":true,\"ecommerce.specification-groups.edit\":true,\"ecommerce.specification-groups.destroy\":true,\"ecommerce.specification-attributes.index\":true,\"ecommerce.specification-attributes.create\":true,\"ecommerce.specification-attributes.edit\":true,\"ecommerce.specification-attributes.destroy\":true,\"ecommerce.specification-tables.index\":true,\"ecommerce.specification-tables.create\":true,\"ecommerce.specification-tables.edit\":true,\"ecommerce.specification-tables.destroy\":true,\"ecommerce.product-specifications.import\":true,\"ecommerce.product-specifications.export\":true,\"plugin.faq\":true,\"faq.index\":true,\"faq.create\":true,\"faq.edit\":true,\"faq.destroy\":true,\"faq_category.index\":true,\"faq_category.create\":true,\"faq_category.edit\":true,\"faq_category.destroy\":true,\"faqs.settings\":true,\"product-size-guide.index\":true,\"product-size-guide.create\":true,\"product-size-guide.edit\":true,\"product-size-guide.destroy\":true,\"size-guide-headers.index\":true,\"size-guide-headers.create\":true,\"size-guide-headers.edit\":true,\"size-guide-headers.destroy\":true,\"product-size-guide.settings\":true,\"galleries.index\":true,\"galleries.create\":true,\"galleries.edit\":true,\"galleries.destroy\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"translations.import\":true,\"translations.export\":true,\"property-translations.import\":true,\"property-translations.export\":true,\"page-translations.export\":true,\"page-translations.import\":true,\"plugin.location\":true,\"country.index\":true,\"country.create\":true,\"country.edit\":true,\"country.destroy\":true,\"state.index\":true,\"state.create\":true,\"state.edit\":true,\"state.destroy\":true,\"city.index\":true,\"city.create\":true,\"city.edit\":true,\"city.destroy\":true,\"marketplace.index\":true,\"marketplace.store.index\":true,\"marketplace.store.create\":true,\"marketplace.store.edit\":true,\"marketplace.store.destroy\":true,\"marketplace.store.view\":true,\"marketplace.store.revenue.create\":true,\"marketplace.withdrawal.index\":true,\"marketplace.withdrawal.edit\":true,\"marketplace.withdrawal.destroy\":true,\"marketplace.withdrawal.invoice\":true,\"marketplace.vendors.index\":true,\"marketplace.unverified-vendors.index\":true,\"marketplace.vendors.control\":true,\"marketplace.unverified-vendors.edit\":true,\"marketplace.reports\":true,\"marketplace.settings\":true,\"marketplace.messages.index\":true,\"marketplace.messages.edit\":true,\"marketplace.messages.destroy\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"newsletter.settings\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"payments.logs\":true,\"payments.logs.show\":true,\"payments.logs.destroy\":true,\"request-log.index\":true,\"request-log.destroy\":true,\"sale-popup.settings\":true,\"simple-slider.index\":true,\"simple-slider.create\":true,\"simple-slider.edit\":true,\"simple-slider.destroy\":true,\"simple-slider-item.index\":true,\"simple-slider-item.create\":true,\"simple-slider-item.edit\":true,\"simple-slider-item.destroy\":true,\"social-login.settings\":true,\"testimonial.index\":true,\"testimonial.create\":true,\"testimonial.edit\":true,\"testimonial.destroy\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true,\"theme-translations.export\":true,\"other-translations.export\":true,\"theme-translations.import\":true,\"other-translations.import\":true,\"api.settings\":true,\"api.sanctum-token.index\":true,\"api.sanctum-token.create\":true,\"api.sanctum-token.destroy\":true}','Admin users role',1,1,1,'2026-05-28 18:59:07','2026-05-28 18:59:07');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (2,'api_enabled','0',NULL,'2026-05-28 18:59:37'),(3,'activated_plugins','[\"language\",\"language-advanced\",\"ads\",\"analytics\",\"announcement\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"ecommerce\",\"faq\",\"fob-product-size-guide\",\"gallery\",\"location\",\"marketplace\",\"mollie\",\"newsletter\",\"payment\",\"paypal\",\"paypal-payout\",\"paystack\",\"razorpay\",\"request-log\",\"sale-popup\",\"shippo\",\"simple-slider\",\"social-login\",\"sslcommerz\",\"stripe\",\"stripe-connect\",\"testimonial\",\"translation\"]',NULL,'2026-05-28 18:59:37'),(8,'media_random_hash','c712385c459d45b49a38410aa38631de',NULL,'2026-05-28 18:59:37'),(9,'theme','amerce',NULL,'2026-05-28 18:59:37'),(10,'show_admin_bar','1',NULL,'2026-05-28 18:59:37'),(11,'admin_email.0','support@amerce.test',NULL,'2026-05-28 18:59:37'),(12,'admin_logo',NULL,NULL,'2026-05-28 18:59:37'),(13,'admin_favicon',NULL,NULL,'2026-05-28 18:59:37'),(14,'admin_title','Amerce',NULL,'2026-05-28 18:59:37'),(15,'enable_change_admin_theme','1',NULL,'2026-05-28 18:59:37'),(16,'language_hide_default','1',NULL,'2026-05-28 18:59:37'),(17,'language_switcher_display','dropdown',NULL,'2026-05-28 18:59:37'),(18,'language_display','all',NULL,'2026-05-28 18:59:37'),(19,'language_hide_languages','[]',NULL,'2026-05-28 18:59:37'),(20,'locale','en',NULL,'2026-05-28 18:59:37'),(21,'locale_direction','ltr',NULL,'2026-05-28 18:59:37'),(22,'enable_send_error_reporting_via_email','0',NULL,'2026-05-28 18:59:37'),(23,'enable_https','0',NULL,'2026-05-28 18:59:37'),(24,'enable_cache','0',NULL,'2026-05-28 18:59:37'),(25,'cache_admin_menu_enable','1',NULL,'2026-05-28 18:59:37'),(26,'cache_time_site_map','3600',NULL,'2026-05-28 18:59:37'),(27,'enable_send_mail_when_new_user_registered','0',NULL,'2026-05-28 18:59:37'),(28,'enable_send_mail_user_registered_to_admin','0',NULL,'2026-05-28 18:59:37'),(29,'enable_change_password','1',NULL,'2026-05-28 18:59:37'),(30,'enable_register','1',NULL,'2026-05-28 18:59:37'),(31,'enable_recaptcha','0',NULL,'2026-05-28 18:59:37'),(32,'enable_captcha','0',NULL,'2026-05-28 18:59:37'),(33,'show_site_name_when_logged_in','1',NULL,'2026-05-28 18:59:37'),(34,'time_zone','UTC',NULL,'2026-05-28 18:59:37'),(35,'enable_multi_language_in_admin','0',NULL,'2026-05-28 18:59:37'),(36,'media_chunk_enabled','0',NULL,'2026-05-28 18:59:37'),(37,'media_chunk_size','1048576',NULL,'2026-05-28 18:59:37'),(38,'media_max_upload_filesize',NULL,NULL,'2026-05-28 18:59:37'),(39,'media_aws_use_signed_urls','0',NULL,'2026-05-28 18:59:37'),(40,'media_aws_signed_url_expiry','60',NULL,'2026-05-28 18:59:37'),(41,'enable_geo_ip','0',NULL,'2026-05-28 18:59:37'),(42,'enable_audit_log','1',NULL,'2026-05-28 18:59:37'),(43,'payment_cod_status','1',NULL,'2026-05-28 18:59:37'),(44,'payment_bank_transfer_status','1',NULL,'2026-05-28 18:59:37'),(45,'payment_cod_description','Please pay money directly to the postman, if you choose cash on delivery method (COD).',NULL,'2026-05-28 18:59:37'),(46,'payment_bank_transfer_description','Please send money to our bank account: AMERCE - 0123 4567 8901.',NULL,'2026-05-28 18:59:37'),(47,'payment_stripe_payment_type','stripe_checkout',NULL,'2026-05-28 18:59:37'),(48,'plugins_ecommerce_customer_new_order_status','0',NULL,'2026-05-28 18:59:37'),(49,'plugins_ecommerce_admin_new_order_status','0',NULL,'2026-05-28 18:59:37'),(50,'ecommerce_is_enabled_support_digital_products','1',NULL,'2026-05-28 18:59:37'),(51,'ecommerce_enable_license_codes_for_digital_products','1',NULL,'2026-05-28 18:59:37'),(52,'ecommerce_auto_complete_digital_orders_after_payment','1',NULL,'2026-05-28 18:59:37'),(53,'ecommerce_load_countries_states_cities_from_location_plugin','0',NULL,'2026-05-28 18:59:37'),(54,'ecommerce_product_sku_format','AM-%s%s%s%s',NULL,'2026-05-28 18:59:37'),(55,'ecommerce_store_order_prefix','AM',NULL,'2026-05-28 18:59:37'),(56,'ecommerce_enable_product_specification','1',NULL,'2026-05-28 18:59:37'),(57,'payment_bank_transfer_display_bank_info_at_the_checkout_success_page','1',NULL,'2026-05-28 18:59:37'),(58,'payment_cod_logo','payments/cod.png',NULL,'2026-05-28 18:59:37'),(59,'payment_bank_transfer_logo','payments/bank-transfer.png',NULL,'2026-05-28 18:59:37'),(60,'payment_stripe_logo','payments/stripe.webp',NULL,'2026-05-28 18:59:37'),(61,'payment_paypal_logo','payments/paypal.png',NULL,'2026-05-28 18:59:37'),(62,'payment_mollie_logo','payments/mollie.png',NULL,'2026-05-28 18:59:37'),(63,'payment_paystack_logo','payments/paystack.png',NULL,'2026-05-28 18:59:37'),(64,'payment_razorpay_logo','payments/razorpay.png',NULL,'2026-05-28 18:59:37'),(65,'payment_sslcommerz_logo','payments/sslcommerz.png',NULL,'2026-05-28 18:59:37'),(66,'product_size_guide_display_mode','popup',NULL,'2026-05-28 18:59:37'),(67,'show_on_front','12',NULL,'2026-05-28 18:59:37'),(68,'blog_page_id','9',NULL,'2026-05-28 18:59:37'),(69,'theme-amerce-homepage_id','12',NULL,'2026-05-28 18:59:37'),(70,'theme-amerce-blog_page_id','9',NULL,'2026-05-28 18:59:37'),(71,'theme-amerce-logo','general/logo.png',NULL,'2026-05-28 18:59:37'),(72,'theme-amerce-logo_dark','general/logo-white.png',NULL,'2026-05-28 18:59:37'),(73,'theme-amerce-logo_text','Amerce',NULL,'2026-05-28 18:59:37'),(74,'theme-amerce-favicon','general/favicon.png',NULL,'2026-05-28 18:59:37'),(75,'theme-amerce-default_theme_mode','light',NULL,'2026-05-28 18:59:37'),(76,'theme-amerce-header_style','style-8',NULL,'2026-05-28 18:59:37'),(77,'theme-amerce-show_topbar','0',NULL,'2026-05-28 18:59:37'),(78,'theme-amerce-contact_phone','(+01) 1234 8888',NULL,'2026-05-28 18:59:37'),(79,'theme-amerce-topbar_slides','Midseason Sale: 20% Off - Auto Applied at Checkout - Limited Time Only\n20% Off - Auto Applied at Checkout - Limited Time Only',NULL,'2026-05-28 18:59:37'),(80,'theme-amerce-sticky_header','1',NULL,'2026-05-28 18:59:37'),(81,'theme-amerce-header_transparent_on_homepage','0',NULL,'2026-05-28 18:59:37'),(82,'theme-amerce-header_top_background_color','#010F1C',NULL,'2026-05-28 18:59:37'),(83,'theme-amerce-header_top_text_color','#FFFFFF',NULL,'2026-05-28 18:59:37'),(84,'theme-amerce-header_main_background_color','#FFFFFF',NULL,'2026-05-28 18:59:37'),(85,'theme-amerce-header_main_text_color','#1E1E1E',NULL,'2026-05-28 18:59:37'),(86,'theme-amerce-primary_color','#DC4646',NULL,'2026-05-28 18:59:37'),(87,'theme-amerce-secondary_color','#A8C5D8',NULL,'2026-05-28 18:59:37'),(88,'theme-amerce-heading_color','#101010',NULL,'2026-05-28 18:59:37'),(89,'theme-amerce-body_text_color','#696E73',NULL,'2026-05-28 18:59:37'),(90,'theme-amerce-link_color','#DC4646',NULL,'2026-05-28 18:59:37'),(91,'theme-amerce-link_hover_color','#B83838',NULL,'2026-05-28 18:59:37'),(92,'theme-amerce-border_color','#E9E9E9',NULL,'2026-05-28 18:59:37'),(93,'theme-amerce-success_color','#3DAB25',NULL,'2026-05-28 18:59:37'),(94,'theme-amerce-danger_color','#F03E3E',NULL,'2026-05-28 18:59:37'),(95,'theme-amerce-footer_style','style-7',NULL,'2026-05-28 18:59:37'),(96,'theme-amerce-footer_payment_icons','payment/visa.png,payment/master-card.png,payment/amex.png,payment/paypal.png,payment/water.png,payment/discover.png',NULL,'2026-05-28 18:59:37'),(97,'theme-amerce-footer_address','600 N Michigan Ave, Chicago, IL 60611, USA',NULL,'2026-05-28 18:59:37'),(98,'theme-amerce-footer_email','hi.amere@gmail.com',NULL,'2026-05-28 18:59:37'),(99,'theme-amerce-footer_phone','315-666-6688',NULL,'2026-05-28 18:59:37'),(100,'theme-amerce-facebook_url','https://facebook.com',NULL,'2026-05-28 18:59:37'),(101,'theme-amerce-twitter_url','https://x.com',NULL,'2026-05-28 18:59:37'),(102,'theme-amerce-instagram_url','https://instagram.com',NULL,'2026-05-28 18:59:37'),(103,'theme-amerce-tiktok_url','https://tiktok.com',NULL,'2026-05-28 18:59:37'),(104,'theme-amerce-snapchat_url','https://snapchat.com',NULL,'2026-05-28 18:59:37'),(105,'theme-amerce-product_card_default_style','style-1',NULL,'2026-05-28 18:59:37'),(106,'theme-amerce-product_card_hover_style','hover-01',NULL,'2026-05-28 18:59:37'),(107,'theme-amerce-product_card_show_color_swatches','1',NULL,'2026-05-28 18:59:37'),(108,'theme-amerce-default_filter_position','sidebar',NULL,'2026-05-28 18:59:37'),(109,'theme-amerce-default_pagination_style','numbered',NULL,'2026-05-28 18:59:37'),(110,'theme-amerce-ecommerce_product_item_layout','grid',NULL,'2026-05-28 18:59:37'),(111,'theme-amerce-ecommerce_products_per_row','4',NULL,'2026-05-28 18:59:37'),(112,'theme-amerce-ecommerce_products_per_row_tablet','3',NULL,'2026-05-28 18:59:37'),(113,'theme-amerce-ecommerce_products_per_row_mobile','2',NULL,'2026-05-28 18:59:37'),(114,'theme-amerce-enable_quick_view','1',NULL,'2026-05-28 18:59:37'),(115,'theme-amerce-enable_quick_shop','1',NULL,'2026-05-28 18:59:37'),(116,'theme-amerce-preloader_enabled','1',NULL,'2026-05-28 18:59:37'),(117,'theme-amerce-scroll_to_top_enabled','1',NULL,'2026-05-28 18:59:37'),(118,'theme-amerce-homepage_body_class','home-baby',NULL,'2026-05-28 18:59:37'),(119,'theme-amerce-site_title','Amerce',NULL,'2026-05-28 18:59:37'),(120,'theme-amerce-seo_title','Amerce — Multi-Purpose eCommerce Theme',NULL,'2026-05-28 18:59:37'),(121,'theme-amerce-seo_description','Amerce is a multi-purpose eCommerce and marketplace theme for Botble CMS — 21 niche presets, sustainable shopping, and fast checkout.',NULL,'2026-05-28 18:59:37'),(122,'theme-amerce-copyright','©2026 Amerce. All Rights Reserved.',NULL,'2026-05-28 18:59:37'),(123,'theme-amerce-newsletter_popup_enable','1',NULL,'2026-05-28 18:59:37'),(124,'theme-amerce-newsletter_popup_image','section/banner-newsletter.jpg',NULL,'2026-05-28 18:59:37'),(125,'theme-amerce-newsletter_popup_subtitle','Subscribe & Enjoy',NULL,'2026-05-28 18:59:37'),(126,'theme-amerce-newsletter_popup_title','10% OFF',NULL,'2026-05-28 18:59:37'),(127,'theme-amerce-newsletter_popup_description','Join our email list & be first to Receive 10% OFF your next order, exclusive offers & more!',NULL,'2026-05-28 18:59:37'),(128,'theme-amerce-newsletter_popup_delay','5',NULL,'2026-05-28 18:59:37'),(129,'theme-amerce-newsletter_popup_display_pages','[\"public.index\"]',NULL,'2026-05-28 18:59:37'),(130,'theme-amerce-store_phone','+1 666 234 8888',NULL,'2026-05-28 18:59:37'),(131,'theme-amerce-store_email','hi.amere@gmail.com',NULL,'2026-05-28 18:59:37'),(132,'theme-amerce-store_address','2163 Phillips Gap Rd, West Jefferson, North Carolina, United States',NULL,'2026-05-28 18:59:37'),(133,'theme-amerce-store_business_hours_weekday','Mon - Sat: 7:30am - 8:00pm PST',NULL,'2026-05-28 18:59:37'),(134,'theme-amerce-store_business_hours_weekend','Sunday: 9:00am - 5:00pm PST',NULL,'2026-05-28 18:59:37'),(135,'theme-amerce-store_map_address','2163 Phillips Gap Rd, West Jefferson, NC',NULL,'2026-05-28 18:59:37'),(136,'theme-amerce-store_locations','[{\"name\":\"New York Office\",\"image\":\"section\\/store-1.jpg\",\"address\":\"900 Ocean Dr, Miami Beach, FL 33139, US\",\"phone\":\"+1 305 555 2468\",\"email\":\"hi.amerce@gmail.com\"},{\"name\":\"Los Angeles Store\",\"image\":\"section\\/store-2.jpg\",\"address\":\"8723 Melrose Avenue, CA 90069, USA\",\"phone\":\"+1 305 555 2468\",\"email\":\"hi.amerce@gmail.com\"},{\"name\":\"Chicago Boutique\",\"image\":\"section\\/store-3.jpg\",\"address\":\"415 North Clark Street, Chicago, IL 60654, USA\",\"phone\":\"+1 305 555 2468\",\"email\":\"hi.amerce@gmail.com\"},{\"name\":\"Miami Showroom\",\"image\":\"section\\/store-4.jpg\",\"address\":\"1101 Brickell Avenue, Miami, FL 33131, USA\",\"phone\":\"+1 305 555 2468\",\"email\":\"hi.amerce@gmail.com\"},{\"name\":\"London Flagship Store\",\"image\":\"section\\/store-5.jpg\",\"address\":\"152 Regent Street, London W1B 5TF, UK\",\"phone\":\"+44 20 555 2468\",\"email\":\"hi.amerce@gmail.com\"},{\"name\":\"Paris Atelier\",\"image\":\"section\\/store-6.jpg\",\"address\":\"18 Rue du Faubourg Saint-Honor\\u00e9, Paris, France\",\"phone\":\"+33 1 555 2468\",\"email\":\"hi.amerce@gmail.com\"}]',NULL,'2026-05-28 18:59:37'),(137,'theme-amerce-vi-topbar_text','Miễn phí vận chuyển cho đơn hàng trên 99$',NULL,'2026-05-28 18:59:37'),(138,'theme-amerce-vi-site_title','Amerce',NULL,'2026-05-28 18:59:37'),(139,'theme-amerce-vi-seo_title','Amerce — Theme Thương mại điện tử Đa năng',NULL,'2026-05-28 18:59:37'),(140,'theme-amerce-vi-seo_description','Amerce là theme thương mại điện tử và marketplace đa năng dành cho Botble CMS — 21 preset theo từng ngách, mua sắm bền vững và thanh toán nhanh.',NULL,'2026-05-28 18:59:37'),(141,'theme-amerce-vi-copyright','© 2026 Amerce. Bảo lưu mọi quyền.',NULL,'2026-05-28 18:59:37'),(142,'theme-amerce-vi-header_account_label','Đăng nhập/Đăng ký',NULL,'2026-05-28 18:59:37'),(143,'theme-amerce-vi-header_bottom_offer_text','Ưu Đãi Đặc Biệt!',NULL,'2026-05-28 18:59:37'),(144,'theme-amerce-vi-footer_marquee_text','AMERCE THƯƠNG MẠI ĐIỆN TỬ ĐA NĂNG',NULL,'2026-05-28 18:59:37'),(145,'theme-amerce-vi-header_announcement_slides','Khuyến Mãi Giữa Mùa: Giảm 20% - Tự Động Áp Dụng Khi Thanh Toán - Số Lượng Có Hạn\nGiảm 20% - Tự Động Áp Dụng Khi Thanh Toán - Số Lượng Có Hạn',NULL,'2026-05-28 18:59:37'),(146,'theme-amerce-vi-topbar_slides','Khuyến Mãi Giữa Mùa: Giảm 20% - Tự Động Áp Dụng Khi Thanh Toán - Chỉ Trong Thời Gian Giới Hạn\nGiảm 20% - Tự Động Áp Dụng Khi Thanh Toán - Chỉ Trong Thời Gian Giới Hạn',NULL,'2026-05-28 18:59:37'),(147,'theme-amerce-ar-topbar_text','شحن مجاني للطلبات التي تزيد عن 99 دولارًا',NULL,'2026-05-28 18:59:37'),(148,'theme-amerce-ar-site_title','أميرس',NULL,'2026-05-28 18:59:37'),(149,'theme-amerce-ar-seo_title','Amerce — موضوع التجارة الإلكترونية متعدد الأغراض',NULL,'2026-05-28 18:59:37'),(150,'theme-amerce-ar-seo_description','Amerce هو موضوع متعدد الأغراض للتجارة الإلكترونية والسوق لـ Botble CMS - 21 إعدادًا مسبقًا متخصصًا وتسوقًا مستدامًا وسداد سريع.',NULL,'2026-05-28 18:59:37'),(151,'theme-amerce-ar-copyright','© 2026 أمريكا. جميع الحقوق محفوظة.',NULL,'2026-05-28 18:59:37'),(152,'theme-amerce-ar-header_account_label','تسجيل الدخول / التسجيل',NULL,'2026-05-28 18:59:37'),(153,'theme-amerce-ar-header_bottom_offer_text','عرض خاص!',NULL,'2026-05-28 18:59:37'),(154,'theme-amerce-ar-footer_marquee_text','AMERCE التجارة الإلكترونية متعددة الوظائف',NULL,'2026-05-28 18:59:37'),(155,'theme-amerce-ar-header_announcement_slides','عرض منتصف الموسم: خصم 20% - يتم تطبيقه تلقائيًا عند الدفع - الكمية محدودة\nخصم 20% - يتم تطبيقه تلقائيًا عند الدفع - الكمية محدودة',NULL,'2026-05-28 18:59:37'),(156,'theme-amerce-ar-topbar_slides','عرض منتصف الموسم: خصم 20% - يُطبق تلقائيًا عند الدفع - لفترة محدودة فقط\nخصم 20% - يُطبق تلقائيًا عند الدفع - لفترة محدودة فقط',NULL,'2026-05-28 18:59:37'),(157,'theme-amerce-fr-topbar_text','Livraison gratuite pour les commandes de plus de 99 $',NULL,'2026-05-28 18:59:37'),(158,'theme-amerce-fr-site_title','Amérique',NULL,'2026-05-28 18:59:37'),(159,'theme-amerce-fr-seo_title','Amerce — Thème de commerce électronique polyvalent',NULL,'2026-05-28 18:59:37'),(160,'theme-amerce-fr-seo_description','Amerce est un thème polyvalent de commerce électronique et de marché pour Botble CMS : 21 préréglages de niche, achats durables et paiement rapide.',NULL,'2026-05-28 18:59:37'),(161,'theme-amerce-fr-copyright','© 2026 Amérique. Tous droits réservés.',NULL,'2026-05-28 18:59:37'),(162,'theme-amerce-fr-header_account_label','Connexion/Inscription',NULL,'2026-05-28 18:59:37'),(163,'theme-amerce-fr-header_bottom_offer_text','Offre spéciale!',NULL,'2026-05-28 18:59:37'),(164,'theme-amerce-fr-footer_marquee_text','COMMERCE ÉLECTRONIQUE MULTIFONCTIONNEL AMERCE',NULL,'2026-05-28 18:59:37'),(165,'theme-amerce-fr-header_announcement_slides','Promotion mi-saison : 20 % de réduction - Appliquée automatiquement à la caisse - Quantité limitée\n20 % de réduction - Appliqué automatiquement à la caisse - Quantité limitée',NULL,'2026-05-28 18:59:37'),(166,'theme-amerce-fr-topbar_slides','Promotion de mi-saison : 20 % de réduction - Appliquée automatiquement à la caisse - Durée limitée seulement\n20 % de réduction - Appliqué automatiquement à la caisse - Durée limitée uniquement',NULL,'2026-05-28 18:59:37'),(167,'theme-amerce-id-topbar_text','Pengiriman gratis untuk pesanan di atas $99',NULL,'2026-05-28 18:59:37'),(168,'theme-amerce-id-site_title','Mendenda',NULL,'2026-05-28 18:59:37'),(169,'theme-amerce-id-seo_title','Amerce — Tema eCommerce Serbaguna',NULL,'2026-05-28 18:59:37'),(170,'theme-amerce-id-seo_description','Amerce adalah tema e-niaga dan pasar multiguna untuk Botble CMS — 21 preset khusus, belanja berkelanjutan, dan pembayaran cepat.',NULL,'2026-05-28 18:59:37'),(171,'theme-amerce-id-copyright','© 2026 Amerika. Semua hak dilindungi undang-undang.',NULL,'2026-05-28 18:59:37'),(172,'theme-amerce-id-header_account_label','Masuk/Daftar',NULL,'2026-05-28 18:59:37'),(173,'theme-amerce-id-header_bottom_offer_text','Penawaran khusus!',NULL,'2026-05-28 18:59:37'),(174,'theme-amerce-id-footer_marquee_text','E-COMMERCE MULTI-FUNGSIONAL AMERCE',NULL,'2026-05-28 18:59:37'),(175,'theme-amerce-id-header_announcement_slides','Promosi Pertengahan Musim: Diskon 20% - Otomatis diterapkan saat checkout - Jumlah terbatas\nDiskon 20% - Diterapkan Secara Otomatis Saat Checkout - Jumlah Terbatas',NULL,'2026-05-28 18:59:37'),(176,'theme-amerce-id-topbar_slides','Promosi Pertengahan Musim: Diskon 20% - Berlaku Otomatis saat Checkout - Hanya Waktu Terbatas\nDiskon 20% - Berlaku Otomatis saat Checkout - Hanya Waktu Terbatas',NULL,'2026-05-28 18:59:37'),(177,'theme-amerce-tr-topbar_text','99$ üzeri siparişlerde ücretsiz gönderim',NULL,'2026-05-28 18:59:37'),(178,'theme-amerce-tr-site_title','Amerce',NULL,'2026-05-28 18:59:37'),(179,'theme-amerce-tr-seo_title','Amerce — Çok Amaçlı e-Ticaret Teması',NULL,'2026-05-28 18:59:37'),(180,'theme-amerce-tr-seo_description','Amerce, Botble CMS için çok amaçlı bir e-ticaret ve pazar yeri temasıdır - 21 niş ön ayar, sürdürülebilir alışveriş ve hızlı ödeme.',NULL,'2026-05-28 18:59:37'),(181,'theme-amerce-tr-copyright','© 2026 Amerika. Her hakkı saklıdır.',NULL,'2026-05-28 18:59:37'),(182,'theme-amerce-tr-header_account_label','Giriş yap/Kayıt ol',NULL,'2026-05-28 18:59:37'),(183,'theme-amerce-tr-header_bottom_offer_text','Özel Teklif!',NULL,'2026-05-28 18:59:37'),(184,'theme-amerce-tr-footer_marquee_text','AMERCE ÇOK FONKSİYONLU E-TİCARET',NULL,'2026-05-28 18:59:37'),(185,'theme-amerce-tr-header_announcement_slides','Sezon Ortası Promosyonu: %20 indirim - Ödeme sırasında otomatik olarak uygulanır - Sınırlı miktar\n%20 İndirim - Ödeme Sırasında Otomatik Olarak Uygulanır - Sınırlı Adet',NULL,'2026-05-28 18:59:37'),(186,'theme-amerce-tr-topbar_slides','Sezon Ortası Promosyonu: %20 İndirim - Ödeme Sırasında Otomatik Olarak Uygulanır - Yalnızca Sınırlı Süre için\n%20 İndirim - Ödeme Sırasında Otomatik Olarak Uygulanır - Yalnızca Sınırlı Süre için',NULL,'2026-05-28 18:59:37'),(187,'media_sizes_hero-sm_height','0',NULL,'2026-05-28 18:59:37'),(188,'media_sizes_hero-md_height','0',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_slider_items`
--

DROP TABLE IF EXISTS `simple_slider_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_slider_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `simple_slider_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `order` int unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_slider_items`
--

LOCK TABLES `simple_slider_items` WRITE;
/*!40000 ALTER TABLE `simple_slider_items` DISABLE KEYS */;
INSERT INTO `simple_slider_items` VALUES (1,1,'Play &amp; Learn\nTogether','slider/slider-7.jpg','/products','',0,'published','2026-05-28 18:59:09','2026-05-28 18:59:09'),(2,1,'Little Bites,\nBig Smiles','slider/slider-8.jpg','/products','',1,'published','2026-05-28 18:59:09','2026-05-28 18:59:09'),(3,1,'Cuteness,\nComfy &amp; Cozy','slider/slider-9.jpg','/products','',2,'published','2026-05-28 18:59:09','2026-05-28 18:59:09');
/*!40000 ALTER TABLE `simple_slider_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_sliders`
--

DROP TABLE IF EXISTS `simple_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_sliders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_sliders`
--

LOCK TABLES `simple_sliders` WRITE;
/*!40000 ALTER TABLE `simple_sliders` DISABLE KEYS */;
INSERT INTO `simple_sliders` VALUES (1,'Homepage Hero','home-hero','Hero slider for the home-baby preset.','published','2026-05-28 18:59:09','2026-05-28 18:59:09');
/*!40000 ALTER TABLE `simple_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`),
  KEY `slugs_key_index` (`key`),
  KEY `slugs_prefix_index` (`prefix`),
  KEY `slugs_reference_index` (`reference_id`,`reference_type`),
  KEY `idx_key_prefix` (`key`,`prefix`),
  KEY `idx_slugs_reference` (`reference_type`,`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'trends',1,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 18:59:07','2026-05-28 18:59:07'),(2,'styling-tips',2,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 18:59:07','2026-05-28 18:59:07'),(3,'sustainable',3,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 18:59:07','2026-05-28 18:59:07'),(4,'new-arrivals',4,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 18:59:07','2026-05-28 18:59:07'),(5,'limited-edition',5,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 18:59:07','2026-05-28 18:59:07'),(6,'behind-the-scenes',6,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 18:59:07','2026-05-28 18:59:07'),(7,'buyer-guide',7,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 18:59:07','2026-05-28 18:59:07'),(8,'care-tips',8,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 18:59:07','2026-05-28 18:59:07'),(9,'capsule-wardrobe',9,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 18:59:07','2026-05-28 18:59:07'),(10,'material-stories',10,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 18:59:07','2026-05-28 18:59:07'),(11,'holiday-gifting',11,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 18:59:07','2026-05-28 18:59:07'),(12,'editor-picks',12,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 18:59:07','2026-05-28 18:59:07'),(13,'new-parents',1,'Botble\\Blog\\Models\\Category','','2026-05-28 18:59:09','2026-05-28 18:59:09'),(14,'baby-care',2,'Botble\\Blog\\Models\\Category','','2026-05-28 18:59:09','2026-05-28 18:59:09'),(15,'sleep-routines',3,'Botble\\Blog\\Models\\Category','','2026-05-28 18:59:09','2026-05-28 18:59:09'),(16,'nutrition',4,'Botble\\Blog\\Models\\Category','','2026-05-28 18:59:09','2026-05-28 18:59:09'),(17,'safety',5,'Botble\\Blog\\Models\\Category','','2026-05-28 18:59:09','2026-05-28 18:59:09'),(18,'soothe-baby-before-sleep',1,'Botble\\Blog\\Models\\Post','','2026-05-28 18:59:10','2026-05-28 18:59:10'),(19,'cozy-morning-routine',2,'Botble\\Blog\\Models\\Post','','2026-05-28 18:59:10','2026-05-28 18:59:10'),(20,'bonding-through-daily-care',3,'Botble\\Blog\\Models\\Post','','2026-05-28 18:59:10','2026-05-28 18:59:10'),(21,'choosing-babys-first-shoes',4,'Botble\\Blog\\Models\\Post','','2026-05-28 18:59:10','2026-05-28 18:59:10'),(22,'safe-sleep-guidelines',5,'Botble\\Blog\\Models\\Post','','2026-05-28 18:59:10','2026-05-28 18:59:10'),(23,'bath-time-made-easy',6,'Botble\\Blog\\Models\\Post','','2026-05-28 18:59:10','2026-05-28 18:59:10'),(24,'feeding-gear',1,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 18:59:10','2026-05-28 18:59:10'),(25,'bottles-teats',2,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 18:59:10','2026-05-28 18:59:10'),(26,'bibs-burp-cloths',3,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 18:59:10','2026-05-28 18:59:10'),(27,'pacifiers-soothers',4,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 18:59:10','2026-05-28 18:59:10'),(28,'feeding-sets-utensils',5,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 18:59:10','2026-05-28 18:59:10'),(29,'baby-wear',6,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 18:59:10','2026-05-28 18:59:10'),(30,'bodysuits-onesies',7,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 18:59:10','2026-05-28 18:59:10'),(31,'booties-socks',8,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 18:59:10','2026-05-28 18:59:10'),(32,'hats-mittens',9,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 18:59:10','2026-05-28 18:59:10'),(33,'sleepwear',10,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 18:59:10','2026-05-28 18:59:10'),(34,'play-time',11,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 18:59:10','2026-05-28 18:59:10'),(35,'teethers',12,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 18:59:10','2026-05-28 18:59:10'),(36,'plush-toys',13,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 18:59:10','2026-05-28 18:59:10'),(37,'activity-gyms',14,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 18:59:10','2026-05-28 18:59:10'),(38,'wooden-toys',15,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 18:59:10','2026-05-28 18:59:10'),(39,'bath-care',16,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 18:59:11','2026-05-28 18:59:11'),(40,'hooded-towels',17,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 18:59:11','2026-05-28 18:59:11'),(41,'lotions-oils',18,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 18:59:11','2026-05-28 18:59:11'),(42,'bath-tubs-seats',19,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 18:59:11','2026-05-28 18:59:11'),(43,'washcloths-sponges',20,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 18:59:11','2026-05-28 18:59:11'),(44,'baby-room',21,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 18:59:11','2026-05-28 18:59:11'),(45,'cribs-bassinets',22,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 18:59:11','2026-05-28 18:59:11'),(46,'sleeping-bags',23,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 18:59:11','2026-05-28 18:59:11'),(47,'mobiles-night-lights',24,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 18:59:11','2026-05-28 18:59:11'),(48,'nursery-decor',25,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 18:59:11','2026-05-28 18:59:11'),(49,'merino-wool-knit-booties-with-drawstring-snug-comfort-for-newborns',1,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 18:59:13','2026-05-28 18:59:13'),(50,'soft-cotton-dribble-bibs-3-pack-gentle-protection-for-little-messes',2,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 18:59:13','2026-05-28 18:59:13'),(51,'cozy-bunny-hooded-towel-for-newborns-and-toddlers',3,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 18:59:14','2026-05-28 18:59:14'),(52,'mushie-frigg-babys-first-pacifier-floral-heart-kido-bebe',4,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 18:59:14','2026-05-28 18:59:14'),(53,'baby-glass-bottle-set-4oz-with-latex-nipple-blush-pink-for-little-moments',5,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 18:59:14','2026-05-28 18:59:14'),(54,'silicone-fork-and-spoon-set-perfect-for-self-feeding-babies',6,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 18:59:14','2026-05-28 18:59:14'),(55,'teal-blue-5-pack-baby-bodysuits-100-cotton-for-everyday-comfort',7,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 18:59:14','2026-05-28 18:59:14'),(56,'white-delicate-double-pom-baby-hat-soft-cozy-warmth-for-little-heads',8,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 18:59:14','2026-05-28 18:59:14'),(57,'frigg-moon-natural-rubber-baby-pacifier-gentle-comfort',9,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 18:59:14','2026-05-28 18:59:14'),(58,'little-dine-wooden-high-chair-elegant-comfort-for-tiny-foodies',10,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 18:59:14','2026-05-28 18:59:14'),(59,'anthro-studio',1,'Botble\\Marketplace\\Models\\Store','stores','2026-05-28 18:59:20','2026-05-28 18:59:20'),(60,'crate-furniture-co',2,'Botble\\Marketplace\\Models\\Store','stores','2026-05-28 18:59:20','2026-05-28 18:59:20'),(61,'findr-audio',3,'Botble\\Marketplace\\Models\\Store','stores','2026-05-28 18:59:20','2026-05-28 18:59:20'),(62,'bohome-living',4,'Botble\\Marketplace\\Models\\Store','stores','2026-05-28 18:59:20','2026-05-28 18:59:20'),(63,'about',1,'Botble\\Page\\Models\\Page','','2026-05-28 18:59:20','2026-05-28 18:59:20'),(64,'contact',2,'Botble\\Page\\Models\\Page','','2026-05-28 18:59:20','2026-05-28 18:59:20'),(65,'faq',3,'Botble\\Page\\Models\\Page','','2026-05-28 18:59:20','2026-05-28 18:59:20'),(66,'privacy-policy',4,'Botble\\Page\\Models\\Page','','2026-05-28 18:59:20','2026-05-28 18:59:20'),(67,'terms-conditions',5,'Botble\\Page\\Models\\Page','','2026-05-28 18:59:20','2026-05-28 18:59:20'),(68,'returns-refunds',6,'Botble\\Page\\Models\\Page','','2026-05-28 18:59:20','2026-05-28 18:59:20'),(69,'shipping',7,'Botble\\Page\\Models\\Page','','2026-05-28 18:59:20','2026-05-28 18:59:20'),(70,'our-stores',8,'Botble\\Page\\Models\\Page','','2026-05-28 18:59:20','2026-05-28 18:59:20'),(71,'blog',9,'Botble\\Page\\Models\\Page','','2026-05-28 18:59:20','2026-05-28 18:59:20'),(72,'careers',10,'Botble\\Page\\Models\\Page','','2026-05-28 18:59:20','2026-05-28 18:59:20'),(73,'sustainability',11,'Botble\\Page\\Models\\Page','','2026-05-28 18:59:20','2026-05-28 18:59:20'),(74,'homepage',12,'Botble\\Page\\Models\\Page','','2026-05-28 18:59:23','2026-05-28 18:59:23'),(75,'silicone-fork-and-spoon-set-perfect-for-self-feeding-babies',11,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 18:59:36','2026-05-28 18:59:36'),(76,'silicone-fork-and-spoon-set-perfect-for-self-feeding-babies',12,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 18:59:36','2026-05-28 18:59:36'),(77,'white-delicate-double-pom-baby-hat-soft-cozy-warmth-for-little-heads',13,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 18:59:36','2026-05-28 18:59:36'),(78,'white-delicate-double-pom-baby-hat-soft-cozy-warmth-for-little-heads',14,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 18:59:36','2026-05-28 18:59:36'),(79,'white-delicate-double-pom-baby-hat-soft-cozy-warmth-for-little-heads',15,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 18:59:36','2026-05-28 18:59:36'),(80,'frigg-moon-natural-rubber-baby-pacifier-gentle-comfort',16,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 18:59:36','2026-05-28 18:59:36'),(81,'frigg-moon-natural-rubber-baby-pacifier-gentle-comfort',17,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 18:59:36','2026-05-28 18:59:36'),(82,'anthro',1,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 18:59:36','2026-05-28 18:59:36'),(83,'anvouge',2,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 18:59:36','2026-05-28 18:59:36'),(84,'bohome',3,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 18:59:36','2026-05-28 18:59:36'),(85,'carolin',4,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 18:59:36','2026-05-28 18:59:36'),(86,'cheryl',5,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 18:59:36','2026-05-28 18:59:36'),(87,'crate',6,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 18:59:36','2026-05-28 18:59:36'),(88,'findr',7,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 18:59:36','2026-05-28 18:59:36'),(89,'intdeco',8,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 18:59:36','2026-05-28 18:59:36'),(90,'modave',9,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 18:59:36','2026-05-28 18:59:36'),(91,'panadoxn',10,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 18:59:36','2026-05-28 18:59:36'),(92,'shangxi',11,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 18:59:36','2026-05-28 18:59:36'),(93,'sopify',12,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 18:59:36','2026-05-28 18:59:36'),(94,'cotton',1,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 18:59:36','2026-05-28 18:59:36'),(95,'linen',2,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 18:59:36','2026-05-28 18:59:36'),(96,'wool',3,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 18:59:36','2026-05-28 18:59:36'),(97,'leather',4,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 18:59:36','2026-05-28 18:59:36'),(98,'tencel',5,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 18:59:36','2026-05-28 18:59:36'),(99,'recycled',6,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 18:59:36','2026-05-28 18:59:36'),(100,'made-in-portugal',7,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 18:59:36','2026-05-28 18:59:36'),(101,'made-in-italy',8,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 18:59:36','2026-05-28 18:59:36'),(102,'hand-crafted',9,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 18:59:36','2026-05-28 18:59:36'),(103,'vegan',10,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 18:59:36','2026-05-28 18:59:36'),(104,'limited-run',11,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 18:59:36','2026-05-28 18:59:36'),(105,'best-seller',12,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 18:59:36','2026-05-28 18:59:36'),(106,'new-arrival',13,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 18:59:36','2026-05-28 18:59:36'),(107,'editor-pick',14,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 18:59:36','2026-05-28 18:59:36'),(108,'eco-friendly',15,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 18:59:36','2026-05-28 18:59:36'),(109,'spring-essentials',1,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 18:59:36','2026-05-28 18:59:36'),(110,'limited-edition',2,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 18:59:36','2026-05-28 18:59:36'),(111,'best-sellers',3,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 18:59:36','2026-05-28 18:59:36'),(112,'sustainable-picks',4,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 18:59:36','2026-05-28 18:59:36'),(113,'workwear',5,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 18:59:36','2026-05-28 18:59:36'),(114,'weekend',6,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 18:59:36','2026-05-28 18:59:36'),(115,'shop-women',7,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 18:59:36','2026-05-28 18:59:36'),(116,'shop-men',8,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 18:59:36','2026-05-28 18:59:36'),(117,'shop-essentials',9,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 18:59:36','2026-05-28 18:59:36');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs_translations`
--

DROP TABLE IF EXISTS `slugs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint unsigned NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`lang_code`,`slugs_id`),
  KEY `idx_slugid_key_prefix` (`slugs_id`,`key`,`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs_translations`
--

LOCK TABLES `slugs_translations` WRITE;
/*!40000 ALTER TABLE `slugs_translations` DISABLE KEYS */;
INSERT INTO `slugs_translations` VALUES ('ar',1,'alatgahat','tag'),('fr',1,'tendances','tag'),('id',1,'tren','tag'),('tr',1,'trends','tag'),('vi',1,'xu-huong','tag'),('fr',2,'conseils-de-style','tag'),('vi',2,'meo-phoi-do','tag'),('ar',2,'nsayh-altsmym','tag'),('tr',2,'styling-tips','tag'),('id',2,'tip-penataan-gaya','tag'),('vi',3,'ben-vung','tag'),('id',3,'berkelanjutan','tag'),('fr',3,'durable','tag'),('ar',3,'mstmr','tag'),('tr',3,'sustainable','tag'),('ar',4,'aloafdon-algdd','tag'),('vi',4,'hang-moi-ve','tag'),('tr',4,'new-arrivals','tag'),('fr',4,'nouveautes','tag'),('id',4,'pendatang-baru','tag'),('id',5,'edisi-terbatas','tag'),('fr',5,'edition-limitee','tag'),('tr',5,'limited-edition','tag'),('vi',5,'phien-ban-gioi-han','tag'),('ar',5,'tbaa-mhdod','tag'),('tr',6,'behind-the-scenes','tag'),('fr',6,'dans-les-coulisses','tag'),('id',6,'di-belakang-layar','tag'),('vi',6,'hau-truong','tag'),('ar',6,'khlf-alkoalys','tag'),('tr',7,'buyer-guide','tag'),('vi',7,'cam-nang-mua-sam','tag'),('ar',7,'dlyl-almshtry','tag'),('fr',7,'guide-de-lacheteur','tag'),('id',7,'panduan-pembeli','tag'),('tr',8,'care-tips','tag'),('fr',8,'conseils-dentretien','tag'),('vi',8,'meo-bao-quan','tag'),('ar',8,'nsayh-alaanay','tag'),('id',8,'tip-perawatan','tag'),('fr',9,'armoire-capsule','tag'),('tr',9,'capsule-wardrobe','tag'),('ar',9,'khzan-kbsol','tag'),('id',9,'lemari-kapsul','tag'),('vi',9,'tu-do-capsule','tag'),('id',10,'cerita-materi','tag'),('vi',10,'chuyen-vat-lieu','tag'),('fr',10,'histoires-materielles','tag'),('ar',10,'kss-mady','tag'),('tr',10,'material-stories','tag'),('fr',11,'cadeaux-de-vacances','tag'),('id',11,'hadiah-liburan','tag'),('ar',11,'hdaya-alaayd','tag'),('tr',11,'holiday-gifting','tag'),('vi',11,'qua-tang-dip-le','tag'),('ar',12,'akhtyarat-almhrr','tag'),('vi',12,'bien-tap-vien-chon','tag'),('fr',12,'choix-de-lediteur','tag'),('tr',12,'editor-picks','tag'),('id',12,'pilihan-editor','tag'),('ar',13,'alabaaa-algdd',''),('vi',13,'cha-me-moi',''),('fr',13,'nouveaux-parents',''),('id',13,'orang-tua-baru',''),('tr',13,'yeni-ebeveynler',''),('tr',14,'bebek-bakimi',''),('vi',14,'cham-soc-be',''),('id',14,'perawatan-bayi',''),('ar',14,'raaay-altfl',''),('fr',14,'soins-de-bebe',''),('ar',15,'sleep-amp-routines',''),('fr',15,'sleep-amp-routines',''),('id',15,'sleep-amp-routines',''),('tr',15,'sleep-amp-routines',''),('vi',15,'sleep-amp-routines',''),('tr',16,'beslenme',''),('vi',16,'dinh-duong',''),('id',16,'nutrisi',''),('fr',16,'nutrition',''),('ar',16,'tghthy',''),('ar',17,'aman',''),('vi',17,'an-toan',''),('tr',17,'emniyet',''),('id',17,'keamanan',''),('fr',17,'securite',''),('fr',18,'apaiser-bebe-avant-de-dormir',''),('tr',18,'bebegi-uyumadan-once-yatistirin',''),('id',18,'tenangkan-bayi-sebelum-tidur',''),('ar',18,'thdy-altfl-kbl-alnom',''),('vi',18,'vo-ve-be-truoc-khi-ngu',''),('vi',19,'nep-sinh-hoat-buoi-sang-am-ap',''),('tr',19,'rahat-sabah-rutini',''),('ar',19,'rotyn-sbahy-mryh',''),('fr',19,'routine-matinale-douillette',''),('id',19,'rutinitas-pagi-yang-nyaman',''),('ar',20,'altrabt-mn-khlal-alraaay-alyomy',''),('fr',20,'creer-des-liens-grace-aux-soins-quotidiens',''),('vi',20,'gan-ket-qua-viec-cham-soc-hang-ngay',''),('tr',20,'gunluk-bakim-sayesinde-baglanma',''),('id',20,'ikatan-melalui-perawatan-sehari-hari',''),('ar',21,'akhtyar-ahthy-altfl-alaol',''),('tr',21,'bebegin-ilk-ayakkabisini-secmek',''),('fr',21,'choisir-les-premieres-chaussures-de-bebe',''),('vi',21,'chon-doi-giay-dau-tien-cho-be',''),('id',21,'memilih-sepatu-pertama-bayi',''),('ar',22,'arshadat-alnom-alamn',''),('fr',22,'directives-pour-un-sommeil-securitaire',''),('tr',22,'guvenli-uyku-kurallari',''),('vi',22,'huong-dan-ngu-an-toan',''),('id',22,'pedoman-tidur-yang-aman',''),('ar',23,'asbh-okt-alasthmam-shla',''),('tr',23,'banyo-zamani-kolaylasti',''),('vi',23,'gio-tam-tro-nen-de-dang',''),('fr',23,'lheure-du-bain-simplifiee',''),('id',23,'waktu-mandi-menjadi-mudah',''),('tr',24,'besleme-dislisi','product-categories'),('vi',24,'dung-cu-cho-be-an','product-categories'),('fr',24,'equipement-dalimentation','product-categories'),('ar',24,'maadat-altghthy','product-categories'),('id',24,'perlengkapan-makan','product-categories'),('ar',25,'alzgagat-oalhlmat','product-categories'),('fr',25,'biberons-et-tetines','product-categories'),('vi',25,'binh-sua-num-ti','product-categories'),('id',25,'botol-dot','product-categories'),('tr',25,'siseler-ve-emzikler','product-categories'),('ar',26,'almrayl-omlabs-altgsho','product-categories'),('fr',26,'bavoirs-et-torchons','product-categories'),('id',26,'kain-oto-sendawa','product-categories'),('tr',26,'onlukler-ve-gegirme-bezleri','product-categories'),('vi',26,'yem-khan-o-sua','product-categories'),('ar',27,'allhayat-oallhayat','product-categories'),('id',27,'dot-empeng','product-categories'),('tr',27,'emzikler-ve-emzikler','product-categories'),('fr',27,'sucettes-et-sucettes','product-categories'),('vi',27,'ti-gia-do-tran-an','product-categories'),('tr',28,'besleme-setleri-ve-gerecleri','product-categories'),('vi',28,'bo-do-an-dung-cu','product-categories'),('fr',28,'ensembles-dalimentation-et-ustensiles','product-categories'),('ar',28,'mgmoaaat-oadoat-altghthy','product-categories'),('id',28,'set-peralatan-makan','product-categories'),('tr',29,'bebek-giyim','product-categories'),('ar',29,'mlabs-atfal','product-categories'),('id',29,'pakaian-bayi','product-categories'),('vi',29,'trang-phuc-cho-be','product-categories'),('fr',29,'vetements-pour-bebe','product-categories'),('fr',30,'bodys-et-combinaisons','product-categories'),('vi',30,'bodysuit-ao-lien-quan','product-categories'),('id',30,'bodysuit-onesie','product-categories'),('tr',30,'bodysuits-ve-onesies','product-categories'),('ar',30,'mlabs-dakhly-omlabs-dakhly','product-categories'),('ar',31,'algoarb-oalgoarb','product-categories'),('fr',31,'chaussons-et-chaussettes','product-categories'),('vi',31,'giay-tat','product-categories'),('tr',31,'patik-ve-corap','product-categories'),('id',31,'sepatu-bot-kaus-kaki','product-categories'),('ar',32,'alkbaaat-oalkfazat','product-categories'),('fr',32,'chapeaux-et-mitaines','product-categories'),('vi',32,'mu-bao-tay','product-categories'),('tr',32,'sapkalar-ve-eldivenler','product-categories'),('id',32,'topi-sarung-tangan','product-categories'),('vi',33,'do-ngu','product-categories'),('ar',33,'mlabs-nom','product-categories'),('id',33,'pakaian-tidur','product-categories'),('tr',33,'pijama','product-categories'),('fr',33,'vetement-de-nuit','product-categories'),('vi',34,'gio-vui-choi','product-categories'),('ar',34,'okt-allaab','product-categories'),('tr',34,'oyun-zamani','product-categories'),('fr',34,'temps-de-jeu','product-categories'),('id',34,'waktu-bermain','product-categories'),('ar',35,'altsnyn','product-categories'),('fr',35,'anneaux-de-dentition','product-categories'),('tr',35,'dis-kasiyicilar','product-categories'),('id',35,'teether','product-categories'),('vi',35,'vong-ngam-nuou','product-categories'),('ar',36,'alaaab-ktyf','product-categories'),('fr',36,'jouets-en-peluche','product-categories'),('id',36,'mainan-mewah','product-categories'),('tr',36,'pelus-oyuncaklar','product-categories'),('vi',36,'thu-bong','product-categories'),('tr',37,'aktivite-spor-salonlari','product-categories'),('id',37,'pusat-aktivitas','product-categories'),('ar',37,'salat-ryady-llansht','product-categories'),('fr',37,'salles-dactivites','product-categories'),('vi',37,'tham-choi-van-dong','product-categories'),('tr',38,'ahsap-oyuncaklar','product-categories'),('ar',38,'alaaab-khshby','product-categories'),('vi',38,'do-choi-go','product-categories'),('fr',38,'jouets-en-bois','product-categories'),('id',38,'mainan-kayu','product-categories'),('ar',39,'alaanay-balhmam','product-categories'),('tr',39,'banyo-bakimi','product-categories'),('vi',39,'cham-soc-khi-tam','product-categories'),('id',39,'perawatan-mandi','product-categories'),('fr',39,'soins-du-bain','product-categories'),('id',40,'handuk-berkerudung','product-categories'),('tr',40,'kapsonlu-havlular','product-categories'),('vi',40,'khan-tam-co-mu','product-categories'),('ar',40,'mnashf-mknaayn','product-categories'),('fr',40,'serviettes-a-capuche','product-categories'),('ar',41,'almsthdrat-oalzyot','product-categories'),('tr',41,'losyonlar-ve-yaglar','product-categories'),('vi',41,'lotion-dau','product-categories'),('id',41,'lotion-minyak','product-categories'),('fr',41,'lotions-oils','product-categories'),('ar',42,'ahoad-alasthmam-oalmkaaad','product-categories'),('fr',42,'baignoires-et-sieges','product-categories'),('id',42,'bak-mandi-kursi','product-categories'),('tr',42,'banyo-kuvetleri-ve-koltuklar','product-categories'),('vi',42,'chau-ghe-tam','product-categories'),('ar',43,'almnashf-oalasfng','product-categories'),('fr',43,'debarbouillettes-et-eponges','product-categories'),('id',43,'kain-lap-spons','product-categories'),('tr',43,'keseler-ve-sungerler','product-categories'),('vi',43,'khan-lau-bot-bien','product-categories'),('tr',44,'bebek-odasi','product-categories'),('fr',44,'chambre-bebe','product-categories'),('ar',44,'ghrf-altfl','product-categories'),('id',44,'kamar-bayi','product-categories'),('vi',44,'phong-cua-be','product-categories'),('ar',45,'asr-oasr-atfal','product-categories'),('fr',45,'berceaux-et-berceaux','product-categories'),('tr',45,'besikler-ve-besikler','product-categories'),('vi',45,'cui-noi','product-categories'),('id',45,'tempat-tidur-bayi-bassinets','product-categories'),('ar',46,'akyas-alnom','product-categories'),('id',46,'kantong-tidur','product-categories'),('fr',46,'sacs-de-couchage','product-categories'),('tr',46,'sleeping-bags','product-categories'),('vi',46,'tui-ngu','product-categories'),('ar',47,'alhoatf-alnkal-oadoaaa-allyl','product-categories'),('tr',47,'cep-telefonlari-ve-gece-isiklari','product-categories'),('vi',47,'do-treo-den-ngu','product-categories'),('fr',47,'mobiles-et-veilleuses','product-categories'),('id',47,'ponsel-lampu-malam','product-categories'),('fr',48,'decor-de-chambre-denfant','product-categories'),('id',48,'dekorasi-kamar-anak','product-categories'),('ar',48,'dykor-alhdan','product-categories'),('tr',48,'kres-dekoru','product-categories'),('vi',48,'trang-tri-phong-be','product-categories'),('ar',49,'ahthy-toyl-mn-sof-myryno-maa-rbat-rah-tam-lhdythy-alolad','products'),('fr',49,'chaussons-tricotes-en-laine-merinos-avec-cordon-de-serrage-confort-douillet-pour-les-nouveau-nes','products'),('vi',49,'giay-len-merino-dan-co-day-rut-am-ap-em-ai-cho-tre-so-sinh','products'),('tr',49,'merinos-yunu-buzgulu-orgu-patik-yeni-doganlar-icin-rahat-rahatlik','products'),('id',49,'sepatu-bot-rajut-wol-merino-dengan-tali-kenyamanan-nyaman-untuk-bayi-baru-lahir','products'),('vi',50,'bo-3-yem-cotton-mem-tham-dai-bao-ve-nhe-nhang-cho-nhung-luc-lam-lem','products'),('fr',50,'lot-de-3-bavoirs-en-coton-doux-protection-douce-pour-les-petits-degats','products'),('ar',50,'sdryat-ktny-naaam-mkon-mn-3-ktaa-hmay-ltyf-mn-alfod-alsghyr','products'),('id',50,'soft-cotton-dribble-bibs-3-pack-perlindungan-lembut-untuk-kekacauan-kecil','products'),('tr',50,'yumusak-pamuklu-dribble-onlukler-3lu-paket-kucuk-sorunlar-icin-nazik-koruma','products'),('id',51,'handuk-berkerudung-kelinci-yang-nyaman-untuk-bayi-baru-lahir-dan-balita','products'),('vi',51,'khan-tam-co-mu-hinh-tho-am-ap-cho-tre-so-sinh-va-tre-tap-di','products'),('ar',51,'mnshf-mryh-bghtaaa-ras-aal-shkl-arnb-lhdythy-alolad-oalatfal-alsghar','products'),('fr',51,'serviette-a-capuche-cozy-bunny-pour-nouveau-nes-et-tout-petits','products'),('tr',51,'yeni-doganlar-ve-kucuk-cocuklar-icin-cosy-bunny-kapsonlu-havlu','products'),('id',52,'dot-bunga-pertama-bayi-mushie-frigg-kido-bebe','products'),('ar',52,'lhay-alatfal-alaol-mn-moshy-frygh-aal-shkl-klb-zhry-kydo-byby','products'),('tr',52,'mushie-frigg-bebegin-ilk-emzigi-cicekli-kalp-kido-bebe','products'),('fr',52,'mushie-frigg-premiere-sucette-coeur-floral-pour-bebe-kido-bebe','products'),('vi',52,'ti-gia-dau-doi-mushie-frigg-hoa-tiet-hoa-trai-tim-kido-bebe','products'),('tr',53,'bebek-cam-biberon-seti-4oz-lateks-emzikli-kucuk-anlar-icin-allik-pembe','products'),('vi',53,'bo-binh-sua-thuy-tinh-4oz-voi-num-latex-hong-phan-cho-nhung-khoanh-khac-nho-xinh','products'),('fr',53,'ensemble-de-biberons-en-verre-4-oz-avec-tetine-en-latex-rose-blush-pour-les-petits-moments','products'),('ar',53,'mgmoaa-zgagat-alatfal-alzgagy-saa-4-aons-maa-hlm-mn-allatks-ordy-fath-llhthat-sghyr','products'),('id',53,'set-botol-kaca-bayi-4oz-dengan-puting-lateks-blush-pink-untuk-momen-kecil','products'),('vi',54,'bo-nia-va-thia-silicone-hoan-hao-cho-be-tap-tu-an','products'),('fr',54,'ensemble-fourchette-et-cuillere-en-silicone-parfait-pour-les-bebes-auto-alimentes','products'),('ar',54,'mgmoaa-shok-omlaak-mn-alsylykon-mthaly-llatfal-althyn-ytnaolon-taaamhm-thatya','products'),('id',54,'set-garpu-dan-sendok-silikon-sempurna-untuk-bayi-yang-makan-sendiri','products'),('tr',54,'silikon-catal-ve-kasik-seti-kendi-kendine-beslenen-bebekler-icin-mukemmel','products'),('vi',55,'bo-5-bodysuit-cho-be-mau-xanh-mong-ket-100-cotton-cho-su-thoai-mai-moi-ngay','products'),('id',55,'bodysuit-bayi-5-paket-biru-teal-100-katun-untuk-kenyamanan-sehari-hari','products'),('fr',55,'lot-de-5-bodys-bebe-bleu-sarcelle-100-coton-pour-un-confort-au-quotidien','products'),('tr',55,'teal-blue-5li-bebek-tulumu-gunluk-konfor-icin-100-pamuk','products'),('ar',55,'tkm-mn-5-mlabs-dakhly-llatfal-ballon-alazrk-almkhdr-100-ktn-lrah-yomy','products'),('ar',56,'white-delicate-double-pom-baby-hat-soft-amp-cozy-warmth-for-little-heads','products'),('fr',56,'white-delicate-double-pom-baby-hat-soft-amp-cozy-warmth-for-little-heads','products'),('id',56,'white-delicate-double-pom-baby-hat-soft-amp-cozy-warmth-for-little-heads','products'),('tr',56,'white-delicate-double-pom-baby-hat-soft-amp-cozy-warmth-for-little-heads','products'),('vi',56,'white-delicate-double-pom-baby-hat-soft-amp-cozy-warmth-for-little-heads','products'),('id',57,'dot-bayi-karet-alam-frigg-moon-kenyamanan-lembut','products'),('tr',57,'frigg-moon-dogal-kaucuk-bebek-emzigi-nazik-konfor','products'),('ar',57,'lhay-atfal-mn-almtat-altbyaay-mn-fryg-mon-mryh-oltyf','products'),('fr',57,'sucette-pour-bebe-en-caoutchouc-naturel-frigg-moon-confort-doux','products'),('vi',57,'ti-gia-cao-su-tu-nhien-frigg-moon-em-diu-nhe-nhang','products'),('fr',58,'chaise-haute-en-bois-little-dine-confort-elegant-pour-les-petits-gourmets','products'),('vi',58,'ghe-an-dam-bang-go-little-dine-tinh-te-thoai-mai-cho-nhung-thuc-khach-nhi','products'),('ar',58,'krsy-mrtfaa-khshby-mn-little-dine-mryh-oanyk-lmhby-altaaam-alsghar','products'),('id',58,'kursi-tinggi-kayu-little-dine-kenyamanan-elegan-untuk-pecinta-makanan-mungil','products'),('tr',58,'little-dine-ahsap-mama-sandalyesi-minik-yemek-meraklilari-icin-zarif-konfor','products'),('fr',63,'a-propos',''),('ar',63,'aan',''),('vi',63,'gioi-thieu',''),('tr',63,'hakkinda',''),('id',63,'tentang',''),('ar',64,'atsal',''),('fr',64,'contact',''),('id',64,'kontak',''),('vi',64,'lien-he',''),('tr',64,'temas-etmek',''),('vi',65,'cau-hoi-thuong-gap',''),('ar',65,'faq',''),('fr',65,'faq',''),('id',65,'faq',''),('tr',65,'faq',''),('vi',66,'chinh-sach-bao-mat',''),('tr',66,'gizlilik-politikasi',''),('id',66,'kebijakan-privasi',''),('fr',66,'politique-de-confidentialite',''),('ar',66,'syas-alkhsosy',''),('ar',67,'alshrot-oalahkam',''),('fr',67,'conditions-generales',''),('vi',67,'dieu-khoan-dieu-kien',''),('tr',67,'sartlar-ve-kosullar',''),('id',67,'syarat-ketentuan',''),('ar',68,'alaaoayd-oalmbalgh-almstrd',''),('vi',68,'doi-tra-hoan-tien',''),('tr',68,'iade-ve-para-iadeleri',''),('id',68,'pengembalian-pengembalian-dana',''),('fr',68,'retours-et-remboursements',''),('fr',69,'expedition',''),('tr',69,'nakliye',''),('id',69,'pengiriman',''),('ar',69,'shhn',''),('vi',69,'van-chuyen',''),('vi',70,'he-thong-cua-hang',''),('tr',70,'magazalarimiz',''),('ar',70,'mtagrna',''),('fr',70,'nos-magasins',''),('id',70,'toko-kami',''),('ar',71,'blog',''),('fr',71,'blog',''),('id',71,'blog',''),('tr',71,'blog',''),('vi',71,'tap-chi',''),('fr',72,'carrieres',''),('id',72,'karir',''),('tr',72,'kariyer',''),('ar',72,'othayf',''),('vi',72,'tuyen-dung',''),('ar',73,'sustainability',''),('fr',73,'sustainability',''),('id',73,'sustainability',''),('tr',73,'sustainability',''),('vi',73,'sustainability',''),('ar',74,'alsfh-alryysy',''),('tr',74,'ana-sayfa',''),('id',74,'beranda',''),('fr',74,'page-daccueil',''),('vi',74,'trang-chu','');
/*!40000 ALTER TABLE `slugs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_logins`
--

DROP TABLE IF EXISTS `social_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_logins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci,
  `refresh_token` text COLLATE utf8mb4_unicode_ci,
  `token_expires_at` timestamp NULL DEFAULT NULL,
  `provider_data` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_logins_provider_provider_id_unique` (`provider`,`provider_id`),
  KEY `social_logins_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `social_logins_user_id_user_type_index` (`user_id`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_logins`
--

LOCK TABLES `social_logins` WRITE;
/*!40000 ALTER TABLE `social_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `states_slug_unique` (`slug`),
  KEY `idx_states_name` (`name`),
  KEY `idx_states_status` (`status`),
  KEY `idx_states_country_id` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_translations`
--

DROP TABLE IF EXISTS `states_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `states_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`states_id`),
  KEY `idx_states_trans_state_lang` (`states_id`,`lang_code`),
  KEY `idx_states_trans_name` (`name`),
  KEY `idx_states_trans_states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_translations`
--

LOCK TABLES `states_translations` WRITE;
/*!40000 ALTER TABLE `states_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Trends',1,'Botble\\ACL\\Models\\User','Articles tagged with Trends.','published','2026-05-28 18:59:07','2026-05-28 18:59:07'),(2,'Styling Tips',1,'Botble\\ACL\\Models\\User','Articles tagged with Styling Tips.','published','2026-05-28 18:59:07','2026-05-28 18:59:07'),(3,'Sustainable',1,'Botble\\ACL\\Models\\User','Articles tagged with Sustainable.','published','2026-05-28 18:59:07','2026-05-28 18:59:07'),(4,'New Arrivals',1,'Botble\\ACL\\Models\\User','Articles tagged with New Arrivals.','published','2026-05-28 18:59:07','2026-05-28 18:59:07'),(5,'Limited Edition',1,'Botble\\ACL\\Models\\User','Articles tagged with Limited Edition.','published','2026-05-28 18:59:07','2026-05-28 18:59:07'),(6,'Behind the Scenes',1,'Botble\\ACL\\Models\\User','Articles tagged with Behind the Scenes.','published','2026-05-28 18:59:07','2026-05-28 18:59:07'),(7,'Buyer Guide',1,'Botble\\ACL\\Models\\User','Articles tagged with Buyer Guide.','published','2026-05-28 18:59:07','2026-05-28 18:59:07'),(8,'Care Tips',1,'Botble\\ACL\\Models\\User','Articles tagged with Care Tips.','published','2026-05-28 18:59:07','2026-05-28 18:59:07'),(9,'Capsule Wardrobe',1,'Botble\\ACL\\Models\\User','Articles tagged with Capsule Wardrobe.','published','2026-05-28 18:59:07','2026-05-28 18:59:07'),(10,'Material Stories',1,'Botble\\ACL\\Models\\User','Articles tagged with Material Stories.','published','2026-05-28 18:59:07','2026-05-28 18:59:07'),(11,'Holiday Gifting',1,'Botble\\ACL\\Models\\User','Articles tagged with Holiday Gifting.','published','2026-05-28 18:59:07','2026-05-28 18:59:07'),(12,'Editor Picks',1,'Botble\\ACL\\Models\\User','Articles tagged with Editor Picks.','published','2026-05-28 18:59:07','2026-05-28 18:59:07');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`tags_id`),
  KEY `idx_tags_trans_tags_id` (`tags_id`),
  KEY `idx_tags_trans_tag_lang` (`tags_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
INSERT INTO `tags_translations` VALUES ('ar',1,'الاتجاهات','المقالات الموسومة مع الاتجاهات.'),('ar',2,'نصائح التصميم','المقالات الموسومة: نصائح لتنسيق الملابس.'),('ar',3,'مستمر','المشاركات الموسومة الاستدامة.'),('ar',4,'الوافدون الجدد','المشاركات الموسومة الوافدون الجدد.'),('ar',5,'طبعة محدودة','المشاركات الموسومة طبعة محدودة.'),('ar',6,'خلف الكواليس','المشاركات الموسومة خلف الكواليس.'),('ar',7,'دليل المشتري','المقالات الموسومة دليل التسوق.'),('ar',8,'نصائح العناية','المقالات الموسومة بنصائح التخزين.'),('ar',9,'خزانة كبسولة','المقالات الموسومة خزانة الكبسولة.'),('ar',10,'قصص مادية','المقالات الموسومة قصص مادية.'),('ar',11,'هدايا العيد','المشاركات الموسومة هدايا العيد.'),('ar',12,'اختيارات المحرر','المشاركات الموسومة اختيار المحرر.'),('fr',1,'Tendances','Articles taggés avec Tendances.'),('fr',2,'Conseils de style','Articles taggés : Conseils pour coordonner les tenues.'),('fr',3,'Durable','Articles étiquetés Durabilité.'),('fr',4,'Nouveautés','Articles tagués Nouveautés.'),('fr',5,'Édition limitée','Articles tagués Édition Limitée.'),('fr',6,'Dans les coulisses','Articles marqués dans les coulisses.'),('fr',7,'Guide de l\'acheteur','Articles tagués Guide d\'achat.'),('fr',8,'Conseils d\'entretien','Articles taggés avec Conseils de stockage.'),('fr',9,'Armoire Capsule','Articles taggés Armoire capsule.'),('fr',10,'Histoires matérielles','Articles tagués Histoires matérielles.'),('fr',11,'Cadeaux de vacances','Articles tagués Cadeaux de Noël.'),('fr',12,'Choix de l\'éditeur','Articles marqués Choix de l\'éditeur.'),('id',1,'Tren','Artikel yang diberi tag Tren.'),('id',2,'Tip Penataan Gaya','Artikel yang diberi tag: Tips mengoordinasikan pakaian.'),('id',3,'Berkelanjutan','Postingan dengan tag Keberlanjutan.'),('id',4,'Pendatang Baru','Postingan dengan tag Pendatang baru.'),('id',5,'Edisi Terbatas','Postingan dengan tag Edisi Terbatas.'),('id',6,'Di belakang layar','Postingan dengan tag Di balik layar.'),('id',7,'Panduan Pembeli','Artikel dengan tag Panduan belanja.'),('id',8,'Tip Perawatan','Artikel yang diberi tag Tips Penyimpanan.'),('id',9,'Lemari Kapsul','Artikel dengan tag Lemari pakaian kapsul.'),('id',10,'Cerita Materi','Artikel dengan tag Cerita material.'),('id',11,'Hadiah Liburan','Postingan dengan tag hadiah liburan.'),('id',12,'Pilihan Editor','Postingan dengan tag Pilihan Editor.'),('tr',1,'Trends','Trendler ile etiketlenen makaleler.'),('tr',2,'Styling Tips','Etiketlenen makaleler: Kıyafetleri koordine etmek için ipuçları.'),('tr',3,'Sustainable','Sürdürülebilirlik etiketli gönderiler.'),('tr',4,'New Arrivals','Yeni gelenler etiketli gönderiler.'),('tr',5,'Limited Edition','Sınırlı Üretim etiketli gönderiler.'),('tr',6,'Behind the Scenes','Kamera Arkası etiketli gönderiler'),('tr',7,'Buyer Guide','Alışveriş rehberi etiketli makaleler.'),('tr',8,'Care Tips','Depolama İpuçları ile etiketlenen makaleler.'),('tr',9,'Capsule Wardrobe','Kapsül gardırop etiketli makaleler.'),('tr',10,'Material Stories','Malzeme hikayeleri etiketli makaleler.'),('tr',11,'Holiday Gifting','Tatil hediyeleri etiketli gönderiler.'),('tr',12,'Editor Picks','Editörün Seçimi etiketli yazılar.'),('vi',1,'Xu hướng','Bài viết gắn thẻ Xu hướng.'),('vi',2,'Mẹo phối đồ','Bài viết gắn thẻ Mẹo phối đồ.'),('vi',3,'Bền vững','Bài viết gắn thẻ Bền vững.'),('vi',4,'Hàng mới về','Bài viết gắn thẻ Hàng mới về.'),('vi',5,'Phiên bản giới hạn','Bài viết gắn thẻ Phiên bản giới hạn.'),('vi',6,'Hậu trường','Bài viết gắn thẻ Hậu trường.'),('vi',7,'Cẩm nang mua sắm','Bài viết gắn thẻ Cẩm nang mua sắm.'),('vi',8,'Mẹo bảo quản','Bài viết gắn thẻ Mẹo bảo quản.'),('vi',9,'Tủ đồ capsule','Bài viết gắn thẻ Tủ đồ capsule.'),('vi',10,'Chuyện vật liệu','Bài viết gắn thẻ Chuyện vật liệu.'),('vi',11,'Quà tặng dịp lễ','Bài viết gắn thẻ Quà tặng dịp lễ.'),('vi',12,'Biên tập viên chọn','Bài viết gắn thẻ Biên tập viên chọn.');
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'Daniel Walker','\"Delivery was fast, packaging absolutely adorable, product quality truly amazing, every little detail felt genuinely cared for.\"','testimonials/avatar-7.jpg','Verified Buyer','published','2026-05-28 18:59:20','2026-05-28 18:59:20'),(2,'Olivia Brooks','\"Everything feels carefully designed, beautifully made, and filled with genuine care. You can tell parents built this brand with heart.\"','testimonials/avatar-6.jpg','Verified Buyer','published','2026-05-28 18:59:20','2026-05-28 18:59:20'),(3,'Michael Carter','\"Finally found bottles that don\'t leak, clean easily, save time, and make feeding so much simpler. Total lifesaver for busy parents!\"','testimonials/avatar-5.jpg','Verified Buyer','published','2026-05-28 18:59:20','2026-05-28 18:59:20'),(4,'Emma Collins','\"The baby onesies are incredibly soft, super cozy, and gentle on delicate skin — my newborn sleeps so peacefully now!\"','testimonials/avatar-4.jpg','Verified Buyer','published','2026-05-28 18:59:20','2026-05-28 18:59:20');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials_translations`
--

DROP TABLE IF EXISTS `testimonials_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonials_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`testimonials_id`),
  KEY `idx_testimonials_trans_testimonials_id` (`testimonials_id`),
  KEY `idx_testimonials_trans_testimonial_lang` (`testimonials_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials_translations`
--

LOCK TABLES `testimonials_translations` WRITE;
/*!40000 ALTER TABLE `testimonials_translations` DISABLE KEYS */;
INSERT INTO `testimonials_translations` VALUES ('ar',1,'دانيال ووكر','\"تسليم سريع، تغليف جميل للغاية، جودة المنتج مذهلة حقًا، كل التفاصيل الصغيرة تظهر العناية الصادقة.\"','تم التحقق من المشتري'),('ar',2,'أوليفيا بروكس','\"تم تصميم كل شيء بدقة، وصنعه بشكل جميل ومليء بالعناية الحقيقية. يمكنك أن تشعر بالآباء الذين بنوا هذه العلامة التجارية من كل قلوبهم.\"','تم التحقق من المشتري'),('ar',3,'مايكل كارتر','\"أخيرًا، وجدت زجاجة لا تتسرب، وسهلة التنظيف، وتوفر الوقت وتجعل تغذية طفلك أسهل بكثير. منقذ حقيقي للآباء المنشغلين!\"','تم التحقق من المشتري'),('ar',4,'إيما كولينز','\"إن ملابس الأطفال ناعمة للغاية ودافئة للغاية ولطيفة على البشرة الرقيقة - ينام مولودي الجديد بشكل سليم الآن!\"','تم التحقق من المشتري'),('fr',1,'Daniel Walker','\"Livraison rapide, emballage absolument charmant, la qualité du produit est vraiment incroyable, chaque petit détail témoigne d\'un soin sincère.\"','Acheteur vérifié'),('fr',2,'Olivia Brooks','\"Tout est méticuleusement conçu, magnifiquement réalisé et rempli de soins authentiques. Vous pouvez sentir les parents qui ont construit cette marque de tout leur cœur.\"','Acheteur vérifié'),('fr',3,'Michael Carter','\"J\'ai enfin trouvé un biberon qui ne fuit pas, qui est facile à nettoyer, qui fait gagner du temps et facilite grandement l\'alimentation de votre bébé. Un véritable sauveur pour les parents occupés !\"','Acheteur vérifié'),('fr',4,'Emma Collins','\"Les bodys pour bébé sont extrêmement doux, très chauds et doux pour la peau tendre — mon nouveau-né dort si profondément maintenant !\"','Acheteur vérifié'),('id',1,'Daniel Walker','\"Pengiriman cepat, kemasan yang sangat bagus, kualitas produk sungguh luar biasa, setiap detail kecil menunjukkan perhatian yang tulus.\"','Pembeli Terverifikasi'),('id',2,'Olivia Brooks','\"Semuanya dirancang dengan cermat, dibuat dengan indah, dan dipenuhi dengan perhatian yang tulus. Anda dapat merasakan orang tua yang membangun merek ini dengan sepenuh hati.\"','Pembeli Terverifikasi'),('id',3,'Michael Carter','\"Akhirnya ditemukan botol yang tidak bocor, mudah dibersihkan, menghemat waktu, dan mempermudah pemberian makan pada bayi Anda. Penyelamat nyata bagi orang tua yang sibuk!\"','Pembeli Terverifikasi'),('id',4,'Emma Collins','\"Baju bayi ini sangat lembut, sangat hangat, dan lembut pada kulit yang lembut - bayi saya yang baru lahir tidur sangat nyenyak sekarang!\"','Pembeli Terverifikasi'),('tr',1,'Daniel Walker','\"Hızlı teslimat, kesinlikle harika paketleme, ürün kalitesi gerçekten harika, her küçük ayrıntı samimi özeni gösteriyor.\"','Doğrulanmış Alıcı'),('tr',2,'Olivia Brooks','\"Her şey titizlikle tasarlanmış, güzel hazırlanmış ve gerçek bir özenle doldurulmuş. Bu markayı yaratan anne babaları tüm kalpleriyle hissedebiliyorsunuz.\"','Doğrulanmış Alıcı'),('tr',3,'Michael Carter','\"Sonunda sızdırmayan, temizlemesi kolay, zamandan tasarruf sağlayan ve bebeğinizin beslenmesini çok daha kolay hale getiren bir biberon buldum. Meşgul ebeveynler için gerçek bir kurtarıcı!\"','Doğrulanmış Alıcı'),('tr',4,'Emma Collins','\"Bebek tulumları son derece yumuşak, süper sıcak ve hassas ciltlere karşı hassastır; yeni doğan bebeğim artık o kadar rahat uyuyor ki!\"','Doğrulanmış Alıcı'),('vi',1,'Daniel Walker','\"Giao hàng nhanh chóng, đóng gói cực kỳ đáng yêu, chất lượng sản phẩm thực sự tuyệt vời, từng chi tiết nhỏ đều cho thấy sự chăm chút chân thành.\"','Người Mua Đã Xác Thực'),('vi',2,'Olivia Brooks','\"Mọi thứ đều được thiết kế tỉ mỉ, chế tác đẹp đẽ và tràn đầy sự quan tâm chân thành. Bạn có thể cảm nhận được những bậc cha mẹ đã xây dựng thương hiệu này bằng cả trái tim.\"','Người Mua Đã Xác Thực'),('vi',3,'Michael Carter','\"Cuối cùng cũng tìm được loại bình sữa không rò rỉ, dễ vệ sinh, tiết kiệm thời gian và giúp việc cho bé ăn đơn giản hơn nhiều. Vị cứu tinh thực sự cho những bậc cha mẹ bận rộn!\"','Người Mua Đã Xác Thực'),('vi',4,'Emma Collins','\"Những bộ bodysuit cho bé cực kỳ mềm mại, siêu ấm áp và dịu nhẹ với làn da non nớt — bé sơ sinh nhà tôi giờ ngủ ngon lành đến vậy!\"','Người Mua Đã Xác Thực');
/*!40000 ALTER TABLE `testimonials_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_settings_user_type_user_id_key_unique` (`user_type`,`user_id`,`key`),
  KEY `user_settings_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `user_settings_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  `sessions_invalidated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@company.com',NULL,NULL,'$2y$12$zgbYOu6087NWFcVF31pHL.5b8KKPMyrTOjOslqgre3bLvvuv7hKVK',NULL,'2026-05-28 18:59:07','2026-05-28 18:59:07','System','Admin','admin',NULL,1,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `widgets_unique_index` (`theme`,`sidebar_id`,`widget_id`,`position`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_company_sidebar','amerce',0,'{\"name\":\"Company\",\"menu_id\":\"footer-company\"}','2026-05-28 18:59:08','2026-05-28 18:59:08'),(2,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_customer_sidebar','amerce',0,'{\"name\":\"Customer\",\"menu_id\":\"footer-help\"}','2026-05-28 18:59:08','2026-05-28 18:59:08'),(3,'Theme\\Amerce\\Widgets\\BlogAboutMeWidget','blog_sidebar','amerce',0,'{\"name\":\"Amerce Editorial\",\"title\":\"About Me\",\"image\":null,\"bio\":\"Style notes, product spotlights, and how we curate the catalog \\u2014 written by the Amerce team.\",\"social_links\":[{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\"},{\"platform\":\"instagram\",\"url\":\"https:\\/\\/instagram.com\"},{\"platform\":\"tiktok\",\"url\":\"https:\\/\\/tiktok.com\"}]}','2026-05-28 18:59:08','2026-05-28 18:59:08'),(4,'Theme\\Amerce\\Widgets\\BlogSearchWidget','blog_sidebar','amerce',1,'{\"name\":\"Search\",\"placeholder\":\"Search...\"}','2026-05-28 18:59:08','2026-05-28 18:59:08'),(5,'Theme\\Amerce\\Widgets\\BlogCategoriesWidget','blog_sidebar','amerce',2,'{\"name\":\"Categories\",\"title\":\"Categories\",\"display_posts_count\":\"yes\",\"category_ids\":[]}','2026-05-28 18:59:08','2026-05-28 18:59:08'),(6,'Theme\\Amerce\\Widgets\\BlogPostsWidget','blog_sidebar','amerce',3,'{\"name\":\"Recent Posts\",\"title\":\"Recent Posts\",\"type\":\"recent\",\"number_display\":4}','2026-05-28 18:59:08','2026-05-28 18:59:08'),(7,'Theme\\Amerce\\Widgets\\BlogTagsWidget','blog_sidebar','amerce',4,'{\"name\":\"Tags\",\"title\":\"Popular Tags\",\"number_display\":11}','2026-05-28 18:59:08','2026-05-28 18:59:08'),(8,'Theme\\Amerce\\Widgets\\ProductDeliveryInfoWidget','product_details_sidebar','amerce',0,'{\"name\":\"Product Delivery & Return\",\"estimated_intl\":\"12-26 Days\",\"estimated_intl_label\":\"International\",\"estimated_local\":\"3-6 Days\",\"estimated_local_label\":\"United States\",\"return_within\":\"45 Days\",\"return_text\":\"of purchase. Duties & taxes are non-refundable.\"}','2026-05-28 18:59:08','2026-05-28 18:59:08'),(9,'Theme\\Amerce\\Widgets\\PaymentMethodsWidget','product_details_sidebar','amerce',1,'{\"name\":\"Payment Methods\",\"title\":\"Guaranteed Safe Checkout:\",\"images\":[]}','2026-05-28 18:59:08','2026-05-28 18:59:08'),(10,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_company_sidebar','amerce-vi',0,'{\"name\":\"C\\u00f4ng ty\",\"menu_id\":\"footer-company-vi\"}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(11,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_customer_sidebar','amerce-vi',0,'{\"name\":\"Kh\\u00e1ch h\\u00e0ng\",\"menu_id\":\"footer-help-vi\"}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(12,'Theme\\Amerce\\Widgets\\BlogAboutMeWidget','blog_sidebar','amerce-vi',0,'{\"name\":\"Bi\\u00ean t\\u1eadp c\\u1ee7a America\",\"title\":\"Gi\\u1edbi thi\\u1ec7u v\\u1ec1 t\\u00f4i\",\"image\":null,\"bio\":\"Style notes, product spotlights, and how we curate the catalog \\u2014 written by the Amerce team.\",\"social_links\":[{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\"},{\"platform\":\"instagram\",\"url\":\"https:\\/\\/instagram.com\"},{\"platform\":\"tiktok\",\"url\":\"https:\\/\\/tiktok.com\"}]}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(13,'Theme\\Amerce\\Widgets\\BlogSearchWidget','blog_sidebar','amerce-vi',1,'{\"name\":\"T\\u00ecm ki\\u1ebfm\",\"placeholder\":\"Search...\"}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(14,'Theme\\Amerce\\Widgets\\BlogCategoriesWidget','blog_sidebar','amerce-vi',2,'{\"name\":\"Danh m\\u1ee5c\",\"title\":\"Danh m\\u1ee5c\",\"display_posts_count\":\"yes\",\"category_ids\":[]}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(15,'Theme\\Amerce\\Widgets\\BlogPostsWidget','blog_sidebar','amerce-vi',3,'{\"name\":\"B\\u00e0i vi\\u1ebft m\\u1edbi\",\"title\":\"B\\u00e0i vi\\u1ebft m\\u1edbi\",\"type\":\"recent\",\"number_display\":4}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(16,'Theme\\Amerce\\Widgets\\BlogTagsWidget','blog_sidebar','amerce-vi',4,'{\"name\":\"Th\\u1ebb\",\"title\":\"Th\\u1ebb ph\\u1ed5 bi\\u1ebfn\",\"number_display\":11}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(17,'Theme\\Amerce\\Widgets\\ProductDeliveryInfoWidget','product_details_sidebar','amerce-vi',0,'{\"name\":\"Giao h\\u00e0ng v\\u00e0 tr\\u1ea3 l\\u1ea1i s\\u1ea3n ph\\u1ea9m\",\"estimated_intl\":\"12-26 Days\",\"estimated_intl_label\":\"International\",\"estimated_local\":\"3-6 Days\",\"estimated_local_label\":\"United States\",\"return_within\":\"45 Days\",\"return_text\":\"of purchase. Duties & taxes are non-refundable.\"}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(18,'Theme\\Amerce\\Widgets\\PaymentMethodsWidget','product_details_sidebar','amerce-vi',1,'{\"name\":\"Ph\\u01b0\\u01a1ng th\\u1ee9c thanh to\\u00e1n\",\"title\":\"\\u0110\\u1ea3m b\\u1ea3o thanh to\\u00e1n an to\\u00e0n:\",\"images\":[]}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(19,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_company_sidebar','amerce-ar',0,'{\"name\":\"\\u0634\\u0631\\u0643\\u0629\",\"menu_id\":\"footer-company-ar\"}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(20,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_customer_sidebar','amerce-ar',0,'{\"name\":\"\\u0639\\u0645\\u064a\\u0644\",\"menu_id\":\"footer-help-ar\"}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(21,'Theme\\Amerce\\Widgets\\BlogAboutMeWidget','blog_sidebar','amerce-ar',0,'{\"name\":\"\\u0627\\u0641\\u062a\\u062a\\u0627\\u062d\\u064a\\u0629 \\u0623\\u0645\\u064a\\u0631\\u0633\",\"title\":\"\\u0652\\u0639\\u064e\\u0646\\u0651\\u0650\\u064a\",\"image\":null,\"bio\":\"Style notes, product spotlights, and how we curate the catalog \\u2014 written by the Amerce team.\",\"social_links\":[{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\"},{\"platform\":\"instagram\",\"url\":\"https:\\/\\/instagram.com\"},{\"platform\":\"tiktok\",\"url\":\"https:\\/\\/tiktok.com\"}]}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(22,'Theme\\Amerce\\Widgets\\BlogSearchWidget','blog_sidebar','amerce-ar',1,'{\"name\":\"\\u064a\\u0628\\u062d\\u062b\",\"placeholder\":\"Search...\"}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(23,'Theme\\Amerce\\Widgets\\BlogCategoriesWidget','blog_sidebar','amerce-ar',2,'{\"name\":\"\\u0641\\u0626\\u0629\",\"title\":\"\\u0641\\u0626\\u0629\",\"display_posts_count\":\"yes\",\"category_ids\":[]}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(24,'Theme\\Amerce\\Widgets\\BlogPostsWidget','blog_sidebar','amerce-ar',3,'{\"name\":\"\\u0645\\u0642\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629\",\"title\":\"\\u0645\\u0642\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629\",\"type\":\"recent\",\"number_display\":4}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(25,'Theme\\Amerce\\Widgets\\BlogTagsWidget','blog_sidebar','amerce-ar',4,'{\"name\":\"\\u0628\\u0637\\u0627\\u0642\\u0629\",\"title\":\"\\u0627\\u0644\\u0639\\u0644\\u0627\\u0645\\u0627\\u062a \\u0627\\u0644\\u0634\\u0639\\u0628\\u064a\\u0629\",\"number_display\":11}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(26,'Theme\\Amerce\\Widgets\\ProductDeliveryInfoWidget','product_details_sidebar','amerce-ar',0,'{\"name\":\"\\u062a\\u0633\\u0644\\u064a\\u0645 \\u0627\\u0644\\u0645\\u0646\\u062a\\u062c \\u0648\\u0625\\u0639\\u0627\\u062f\\u062a\\u0647\",\"estimated_intl\":\"12-26 Days\",\"estimated_intl_label\":\"International\",\"estimated_local\":\"3-6 Days\",\"estimated_local_label\":\"United States\",\"return_within\":\"45 Days\",\"return_text\":\"of purchase. Duties & taxes are non-refundable.\"}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(27,'Theme\\Amerce\\Widgets\\PaymentMethodsWidget','product_details_sidebar','amerce-ar',1,'{\"name\":\"\\u0637\\u0631\\u064a\\u0642\\u0629 \\u0627\\u0644\\u062f\\u0641\\u0639\",\"title\":\"\\u0627\\u0644\\u062e\\u0631\\u0648\\u062c \\u0627\\u0644\\u0622\\u0645\\u0646 \\u0627\\u0644\\u0645\\u0636\\u0645\\u0648\\u0646:\",\"images\":[]}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(28,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_company_sidebar','amerce-fr',0,'{\"name\":\"Entreprise\",\"menu_id\":\"footer-company-fr\"}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(29,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_customer_sidebar','amerce-fr',0,'{\"name\":\"Client\",\"menu_id\":\"footer-help-fr\"}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(30,'Theme\\Amerce\\Widgets\\BlogAboutMeWidget','blog_sidebar','amerce-fr',0,'{\"name\":\"\\u00c9ditorial am\\u00e9ricain\",\"title\":\"Sur moi\",\"image\":null,\"bio\":\"Style notes, product spotlights, and how we curate the catalog \\u2014 written by the Amerce team.\",\"social_links\":[{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\"},{\"platform\":\"instagram\",\"url\":\"https:\\/\\/instagram.com\"},{\"platform\":\"tiktok\",\"url\":\"https:\\/\\/tiktok.com\"}]}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(31,'Theme\\Amerce\\Widgets\\BlogSearchWidget','blog_sidebar','amerce-fr',1,'{\"name\":\"Recherche\",\"placeholder\":\"Search...\"}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(32,'Theme\\Amerce\\Widgets\\BlogCategoriesWidget','blog_sidebar','amerce-fr',2,'{\"name\":\"Cat\\u00e9gorie\",\"title\":\"Cat\\u00e9gorie\",\"display_posts_count\":\"yes\",\"category_ids\":[]}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(33,'Theme\\Amerce\\Widgets\\BlogPostsWidget','blog_sidebar','amerce-fr',3,'{\"name\":\"Nouvel article\",\"title\":\"Nouvel article\",\"type\":\"recent\",\"number_display\":4}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(34,'Theme\\Amerce\\Widgets\\BlogTagsWidget','blog_sidebar','amerce-fr',4,'{\"name\":\"Carte\",\"title\":\"Balises populaires\",\"number_display\":11}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(35,'Theme\\Amerce\\Widgets\\ProductDeliveryInfoWidget','product_details_sidebar','amerce-fr',0,'{\"name\":\"Livraison et retour du produit\",\"estimated_intl\":\"12-26 Days\",\"estimated_intl_label\":\"International\",\"estimated_local\":\"3-6 Days\",\"estimated_local_label\":\"United States\",\"return_within\":\"45 Days\",\"return_text\":\"of purchase. Duties & taxes are non-refundable.\"}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(36,'Theme\\Amerce\\Widgets\\PaymentMethodsWidget','product_details_sidebar','amerce-fr',1,'{\"name\":\"Mode de paiement\",\"title\":\"Paiement s\\u00e9curis\\u00e9 garanti\\u00a0:\",\"images\":[]}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(37,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_company_sidebar','amerce-id',0,'{\"name\":\"Perusahaan\",\"menu_id\":\"footer-company-id\"}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(38,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_customer_sidebar','amerce-id',0,'{\"name\":\"Pelanggan\",\"menu_id\":\"footer-help-id\"}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(39,'Theme\\Amerce\\Widgets\\BlogAboutMeWidget','blog_sidebar','amerce-id',0,'{\"name\":\"Editorial Amerika\",\"title\":\"Tentang Saya\",\"image\":null,\"bio\":\"Style notes, product spotlights, and how we curate the catalog \\u2014 written by the Amerce team.\",\"social_links\":[{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\"},{\"platform\":\"instagram\",\"url\":\"https:\\/\\/instagram.com\"},{\"platform\":\"tiktok\",\"url\":\"https:\\/\\/tiktok.com\"}]}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(40,'Theme\\Amerce\\Widgets\\BlogSearchWidget','blog_sidebar','amerce-id',1,'{\"name\":\"Mencari\",\"placeholder\":\"Search...\"}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(41,'Theme\\Amerce\\Widgets\\BlogCategoriesWidget','blog_sidebar','amerce-id',2,'{\"name\":\"Kategori\",\"title\":\"Kategori\",\"display_posts_count\":\"yes\",\"category_ids\":[]}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(42,'Theme\\Amerce\\Widgets\\BlogPostsWidget','blog_sidebar','amerce-id',3,'{\"name\":\"Artikel baru\",\"title\":\"Artikel baru\",\"type\":\"recent\",\"number_display\":4}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(43,'Theme\\Amerce\\Widgets\\BlogTagsWidget','blog_sidebar','amerce-id',4,'{\"name\":\"Kartu\",\"title\":\"Tag populer\",\"number_display\":11}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(44,'Theme\\Amerce\\Widgets\\ProductDeliveryInfoWidget','product_details_sidebar','amerce-id',0,'{\"name\":\"Pengiriman & Pengembalian Produk\",\"estimated_intl\":\"12-26 Days\",\"estimated_intl_label\":\"International\",\"estimated_local\":\"3-6 Days\",\"estimated_local_label\":\"United States\",\"return_within\":\"45 Days\",\"return_text\":\"of purchase. Duties & taxes are non-refundable.\"}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(45,'Theme\\Amerce\\Widgets\\PaymentMethodsWidget','product_details_sidebar','amerce-id',1,'{\"name\":\"Metode pembayaran\",\"title\":\"Checkout Aman Terjamin:\",\"images\":[]}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(46,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_company_sidebar','amerce-tr',0,'{\"name\":\"\\u015eirket\",\"menu_id\":\"footer-company-tr\"}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(47,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_customer_sidebar','amerce-tr',0,'{\"name\":\"M\\u00fc\\u015fteri\",\"menu_id\":\"footer-help-tr\"}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(48,'Theme\\Amerce\\Widgets\\BlogAboutMeWidget','blog_sidebar','amerce-tr',0,'{\"name\":\"Amerce Editoryal\",\"title\":\"Hakk\\u0131mda\",\"image\":null,\"bio\":\"Style notes, product spotlights, and how we curate the catalog \\u2014 written by the Amerce team.\",\"social_links\":[{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\"},{\"platform\":\"instagram\",\"url\":\"https:\\/\\/instagram.com\"},{\"platform\":\"tiktok\",\"url\":\"https:\\/\\/tiktok.com\"}]}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(49,'Theme\\Amerce\\Widgets\\BlogSearchWidget','blog_sidebar','amerce-tr',1,'{\"name\":\"Aramak\",\"placeholder\":\"Search...\"}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(50,'Theme\\Amerce\\Widgets\\BlogCategoriesWidget','blog_sidebar','amerce-tr',2,'{\"name\":\"Kategori\",\"title\":\"Kategori\",\"display_posts_count\":\"yes\",\"category_ids\":[]}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(51,'Theme\\Amerce\\Widgets\\BlogPostsWidget','blog_sidebar','amerce-tr',3,'{\"name\":\"Yeni makale\",\"title\":\"Yeni makale\",\"type\":\"recent\",\"number_display\":4}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(52,'Theme\\Amerce\\Widgets\\BlogTagsWidget','blog_sidebar','amerce-tr',4,'{\"name\":\"Kart\",\"title\":\"Pop\\u00fcler etiketler\",\"number_display\":11}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(53,'Theme\\Amerce\\Widgets\\ProductDeliveryInfoWidget','product_details_sidebar','amerce-tr',0,'{\"name\":\"\\u00dcr\\u00fcn Teslimat\\u0131 & \\u0130ade\",\"estimated_intl\":\"12-26 Days\",\"estimated_intl_label\":\"International\",\"estimated_local\":\"3-6 Days\",\"estimated_local_label\":\"United States\",\"return_within\":\"45 Days\",\"return_text\":\"of purchase. Duties & taxes are non-refundable.\"}','2026-05-28 18:59:24','2026-05-28 18:59:24'),(54,'Theme\\Amerce\\Widgets\\PaymentMethodsWidget','product_details_sidebar','amerce-tr',1,'{\"name\":\"\\u00d6deme y\\u00f6ntemi\",\"title\":\"Garantili G\\u00fcvenli \\u00d6deme:\",\"images\":[]}','2026-05-28 18:59:24','2026-05-28 18:59:24');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-29  8:59:38
