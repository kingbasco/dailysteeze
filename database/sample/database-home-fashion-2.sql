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
INSERT INTO `activations` VALUES (1,1,'zeEnglN6qkSC2dpA5dq13AGtBXHiEKe0',1,'2026-05-28 19:02:43','2026-05-28 19:02:43','2026-05-28 19:02:43');
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
INSERT INTO `categories` VALUES (1,'Style Guides',0,'Editor-led notes on outfit composition, color, and seasonal layering.','published',1,'Botble\\ACL\\Models\\User',NULL,0,0,1,'2026-05-28 19:02:44','2026-05-28 19:02:44'),(2,'Trend Watch',0,'What is rising on the runway and reaching everyday wardrobes this season.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2026-05-28 19:02:44','2026-05-28 19:02:44'),(3,'Wardrobe Building',0,'Capsule strategy, investment pieces, and how to make a small wardrobe go further.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2026-05-28 19:02:44','2026-05-28 19:02:44'),(4,'Care &amp; Maintenance',0,'How to wash, store, and extend the life of knitwear, leather, and silk.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2026-05-28 19:02:44','2026-05-28 19:02:44'),(5,'Editor Picks',0,'Curated finds, behind-the-piece stories, and craft notes from the team.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2026-05-28 19:02:44','2026-05-28 19:02:44');
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
INSERT INTO `categories_translations` VALUES ('ar',1,'أدلة النمط','يتم تنسيق أفكار الأزياء وخزانة الملابس وتقارير الاتجاهات الموسمية من قبل فريق التحرير في Amerce.'),('ar',2,'مراقبة الاتجاه','ما يظهر على منصات العرض ويتسلل إلى خزانات الملابس اليومية هذا الموسم.'),('ar',3,'مبنى خزانة الملابس','استراتيجيات خزانة الملابس البسيطة، والعناصر التي تستحق الاستثمار فيها وكيفية جعل خزانة الملابس الصغيرة أكثر فعالية.'),('ar',4,'Care &amp; Maintenance','How to wash, store, and extend the life of knitwear, leather, and silk.'),('ar',5,'اختيارات المحرر','الاكتشافات المنسقة والقصة وراء كل عنصر وملاحظات حول الحرفة من الفريق.'),('fr',1,'Guides de style','Les idées de tenues, la garde-robe capsule et les rapports sur les tendances saisonnières sont sélectionnés par l\'équipe éditoriale d\'Amerce.'),('fr',2,'Surveillance des tendances','Ce qui émerge sur les podiums et s\'insinue dans les garde-robes de tous les jours cette saison.'),('fr',3,'Bâtiment de garde-robe','Stratégies de garde-robe minimalistes, articles dans lesquels il vaut la peine d\'investir et comment rendre une petite garde-robe plus efficace.'),('fr',4,'Care &amp; Maintenance','How to wash, store, and extend the life of knitwear, leather, and silk.'),('fr',5,'Choix de l\'éditeur','Des trouvailles organisées, l\'histoire derrière chaque objet et des notes sur le métier de l\'équipe.'),('id',1,'Panduan Gaya','Ide pakaian, lemari pakaian kapsul, dan laporan tren musiman dikurasi oleh tim editorial Amerce.'),('id',2,'Tontonan Tren','Apa yang muncul di runway dan memasuki lemari pakaian sehari-hari musim ini.'),('id',3,'Gedung Lemari Pakaian','Strategi lemari pakaian minimalis, barang-barang yang layak untuk diinvestasikan, dan cara membuat lemari pakaian kecil lebih efektif.'),('id',4,'Care &amp; Maintenance','How to wash, store, and extend the life of knitwear, leather, and silk.'),('id',5,'Pilihan Editor','Temuan yang dikurasi, kisah di balik setiap item, dan catatan kerajinan dari tim.'),('tr',1,'Stil Kılavuzları','Kıyafet fikirleri, kapsül gardırop ve sezonluk trend raporları Amerce editör ekibi tarafından küratörlüğünü yapıyor.'),('tr',2,'Trend İzleme','Bu sezon podyumlarda ortaya çıkan ve gündelik gardıroplara sızan şeyler.'),('tr',3,'Gardırop Binası','Minimalist gardırop stratejileri, yatırım yapmaya değer öğeler ve küçük bir gardırobun nasıl daha etkili hale getirilebileceği.'),('tr',4,'Care &amp; Maintenance','How to wash, store, and extend the life of knitwear, leather, and silk.'),('tr',5,'Editörün Seçimleri','Seçilmiş buluntular, her bir öğenin arkasındaki hikaye ve ekibin el sanatına ilişkin notları.'),('vi',1,'Hướng dẫn phối đồ','Ý tưởng outfit, capsule wardrobe và báo cáo xu hướng theo mùa được tuyển chọn bởi đội ngũ biên tập Amerce.'),('vi',2,'Theo Dõi Xu Hướng','Điều gì đang nổi lên trên sàn diễn và len lỏi vào tủ đồ thường ngày mùa này.'),('vi',3,'Xây Dựng Tủ Đồ','Chiến lược tủ đồ tối giản, những món đồ đáng đầu tư và cách để một tủ đồ nhỏ phát huy nhiều hơn.'),('vi',4,'Care &amp; Maintenance','How to wash, store, and extend the life of knitwear, leather, and silk.'),('vi',5,'Lựa Chọn Của Biên Tập Viên','Những phát hiện được tuyển chọn, câu chuyện đằng sau từng món đồ và ghi chú về thủ công từ đội ngũ.');
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
INSERT INTO `contacts` VALUES (1,'Sophia Bennett','sophia.bennett@example.com','+1-415-555-0142','124 Folsom Street, San Francisco, CA','Question about international shipping rates','Hi team — could you tell me whether you ship to Singapore and what the typical delivery window is for the spring outerwear collection? Many thanks.',NULL,'read','2026-05-28 19:02:43','2026-05-28 19:02:43'),(2,'Marcus Tan','marcus.tan@example.com','+44-20-7946-0312','47 Hatton Garden, London EC1N','Wholesale enquiry — boutique partnership','Good morning. I run a curated mens boutique in central London. We would love to discuss stocking a small selection of your accessories range. Could you send over your wholesale lookbook and minimum order quantities?',NULL,'unread','2026-05-28 19:02:43','2026-05-28 19:02:43'),(3,'Elena Rodriguez','elena.rodriguez@example.com','+34-93-555-0188','Carrer de Mallorca 287, Barcelona','Order #AM-10458 — color confirmation','Could you confirm the exact shade of the walnut side table I ordered last week? I want to make sure it matches the rest of my living room before it ships.',NULL,'read','2026-05-28 19:02:43','2026-05-28 19:02:43');
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
INSERT INTO `ec_brands` VALUES (1,'Anthro','Eclectic apparel and home goods inspired by global craftsmanship traditions.','https://example.com/anthro','brands/anthro.png','published',0,1,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(2,'Anvouge','Modern fashion essentials cut from sustainable fibers.','https://example.com/anvouge','brands/anvouge.png','published',1,1,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(3,'Bohome','Bohemian-inspired homewares and textiles for the relaxed modern home.','https://example.com/bohome','brands/bohome.png','published',2,1,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(4,'Carolin','Demi-fine jewelry made by hand in small Italian ateliers.','https://example.com/carolin','brands/carolin.png','published',3,1,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(5,'Cheryl','Bold prints and silhouettes for the contemporary woman.','https://example.com/cheryl','brands/cheryl.png','published',4,0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(6,'Crate','Mid-century-inspired furniture built to last generations.','https://example.com/crate','brands/crate.png','published',5,1,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(7,'Findr','Audio gear engineered for studio-grade clarity in everyday environments.','https://example.com/findr','brands/findr.png','published',6,0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(8,'Intdeco','Interior accents that bridge minimalism and warmth.','https://example.com/intdeco','brands/intdeco.png','published',7,0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(9,'Modave','Performance activewear made with recycled high-stretch knits.','https://example.com/modave','brands/modave.png','published',8,0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(10,'Panadoxn','Botanical skincare formulated by clinical herbalists.','https://example.com/panadoxn','brands/panadoxn.png','published',9,0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(11,'Shangxi','Heritage tea, ceramics, and meditation accessories.','https://example.com/shangxi','brands/shangxi.png','published',10,0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(12,'Sopify','Smart home devices designed for renters and travelers.','https://example.com/sopify','brands/sopify.png','published',11,0,'2026-05-28 19:02:43','2026-05-28 19:02:43');
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
INSERT INTO `ec_currencies` VALUES (1,'USD','$',1,2,'western',0,0,1,1,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(2,'EUR','€',0,2,'western',0,1,0,0.84,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(3,'VND','₫',0,0,'western',0,2,0,23203,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(4,'NGN','₦',1,2,'western',0,2,0,895.52,'2026-05-28 19:02:43','2026-05-28 19:02:43');
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
INSERT INTO `ec_customer_addresses` VALUES (1,'Emma Collins','customer@botble.com','+1-555-0105','AU','Pennsylvania','Los Angeles','741 Spruce Street',1,1,'2026-05-28 19:02:52','2026-05-28 19:02:52','10001'),(2,'Emma Collins','customer@botble.com','+1-555-0108','CA','Florida','Miami','987 Birch Boulevard',1,0,'2026-05-28 19:02:52','2026-05-28 19:02:52','33101'),(3,'Sophia Ramirez','vendor@botble.com','+1-555-0110','AU','Michigan','Austin','741 Spruce Street',2,1,'2026-05-28 19:02:53','2026-05-28 19:02:53','85001'),(4,'Sophia Ramirez','vendor@botble.com','+1-555-0108','US','Ohio','San Diego','258 Walnut Way',2,0,'2026-05-28 19:02:53','2026-05-28 19:02:53','19101'),(5,'Olivia Carter','customer1@example.com','+1-555-0101','US','Florida','New York','147 Elm Court',3,1,'2026-05-28 19:02:53','2026-05-28 19:02:53','85001'),(6,'Ava Mitchell','customer2@example.com','+1-555-0105','AU','New York','Dallas','741 Spruce Street',4,1,'2026-05-28 19:02:53','2026-05-28 19:02:53','60601'),(7,'Isabella Brooks','customer3@example.com','+1-555-0101','CA','New York','Phoenix','123 Main Street',5,1,'2026-05-28 19:02:53','2026-05-28 19:02:53','19101'),(8,'James Whitfield','customer4@example.com','+1-555-0104','AU','Illinois','Phoenix','147 Elm Court',6,1,'2026-05-28 19:02:54','2026-05-28 19:02:54','90210'),(9,'Liam Bennett','customer5@example.com','+1-555-0103','US','California','Houston','456 Oak Avenue',7,1,'2026-05-28 19:02:54','2026-05-28 19:02:54','19101'),(10,'Noah Patterson','customer6@example.com','+1-555-0106','US','Georgia','Los Angeles','369 Cherry Circle',8,1,'2026-05-28 19:02:54','2026-05-28 19:02:54','77001'),(11,'Charlotte Reed','customer7@example.com','+1-555-0105','CA','Illinois','Dallas','147 Elm Court',9,1,'2026-05-28 19:02:55','2026-05-28 19:02:55','30301'),(12,'Amelia Foster','customer8@example.com','+1-555-0107','DE','New York','Houston','258 Walnut Way',10,1,'2026-05-28 19:02:55','2026-05-28 19:02:55','48201');
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
INSERT INTO `ec_customers` VALUES (1,'Emma Collins','customer@botble.com','$2y$12$9wFpcP5sfoGnQ3cx2CarceFppjtiSCW/L7hnbDUssT3wOowuBUXla','testimonials/avatar-1.jpg','2002-05-18','regular',NULL,'+1-555-0101',NULL,'2026-05-28 19:02:52','2026-05-28 19:02:52','2026-05-29 02:02:52',NULL,0,NULL,'activated',NULL,NULL,NULL,0),(2,'Sophia Ramirez','vendor@botble.com','$2y$12$uvhq3TCCw02cgVjOxDK8GuA.ATH0TEVoKrwub0cFJjzqgzOwf4MFu','testimonials/avatar-2.jpg','2002-05-13','regular',NULL,'+1-555-0102',NULL,'2026-05-28 19:02:53','2026-05-28 19:02:56','2026-05-29 02:02:52',NULL,1,'2026-05-29 02:02:56','activated',NULL,NULL,NULL,0),(3,'Olivia Carter','customer1@example.com','$2y$12$kCE0mhZNzfl5hWzFXLFcaOVHZXXEHYDHglzba0HXRLLVDszRmv3zi','testimonials/avatar-3.jpg','1999-05-06','regular',NULL,'+1-555-0110',NULL,'2026-05-28 19:02:53','2026-05-28 19:02:56','2026-05-29 02:02:52',NULL,1,'2026-05-29 02:02:56','activated',NULL,NULL,NULL,0),(4,'Ava Mitchell','customer2@example.com','$2y$12$IAYPNvuTDkwFPRfr/nVaeevwYUKrIHQKspbAi0Hzzfi3NiT68Luw6','testimonials/avatar-4.jpg','2006-05-11','regular',NULL,'+1-555-0107',NULL,'2026-05-28 19:02:53','2026-05-28 19:02:56','2026-05-29 02:02:52',NULL,1,'2026-05-29 02:02:56','activated',NULL,NULL,NULL,0),(5,'Isabella Brooks','customer3@example.com','$2y$12$d43IeM0gkXxwrlpV0Ywluef3ydIchl96HURM1W/SLZGJLdgVNXnh.','testimonials/avatar-5.jpg','1992-05-07','regular',NULL,'+1-555-0103',NULL,'2026-05-28 19:02:53','2026-05-28 19:02:56','2026-05-29 02:02:52',NULL,1,'2026-05-29 02:02:56','activated',NULL,NULL,NULL,0),(6,'James Whitfield','customer4@example.com','$2y$12$098PElaEcgDEF.dczHvENOCBdm5Yt5wmfN6IjDKty/.FQpOPJuhZO','testimonials/avatar-6.jpg','1984-05-20','regular',NULL,'+1-555-0102',NULL,'2026-05-28 19:02:54','2026-05-28 19:02:57','2026-05-29 02:02:52',NULL,1,'2026-05-29 02:02:56','activated',NULL,NULL,NULL,0),(7,'Liam Bennett','customer5@example.com','$2y$12$VaChnEW4vQPsJpUfXlwXLuR2iUc6cwm9vgKJuXTJhlRTAvRHTkLl2','testimonials/avatar-7.jpg','1997-05-07','regular',NULL,'+1-555-0103',NULL,'2026-05-28 19:02:54','2026-05-28 19:02:57','2026-05-29 02:02:52',NULL,1,'2026-05-29 02:02:56','activated',NULL,NULL,NULL,0),(8,'Noah Patterson','customer6@example.com','$2y$12$KmSKQUDSdodGKXDkSBOOoe6M7zrdsruJaBdJktKxu0XNtcnDiQDFm','testimonials/avatar-8.jpg','1978-05-19','regular',NULL,'+1-555-0110',NULL,'2026-05-28 19:02:54','2026-05-28 19:02:57','2026-05-29 02:02:52',NULL,1,'2026-05-29 02:02:56','activated',NULL,NULL,NULL,0),(9,'Charlotte Reed','customer7@example.com','$2y$12$3ic25plkjvIrV4uygZj60OSvL2iWKDMei/E.E/ulnKW44Q/iIaLWa','testimonials/avatar-9.jpg','1999-05-22','regular',NULL,'+1-555-0104',NULL,'2026-05-28 19:02:55','2026-05-28 19:02:58','2026-05-29 02:02:52',NULL,1,'2026-05-29 02:02:56','activated',NULL,NULL,NULL,0),(10,'Amelia Foster','customer8@example.com','$2y$12$41MdprjJOS/x16RLiDOlMuQqX6C8n8H7hfoC9Ddwx0aOiX9VxhVz2','testimonials/avatar-10.jpg','1984-05-19','regular',NULL,'+1-555-0103',NULL,'2026-05-28 19:02:55','2026-05-28 19:02:58','2026-05-29 02:02:52',NULL,0,NULL,'activated',NULL,NULL,NULL,0);
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
INSERT INTO `ec_discounts` VALUES (1,'Welcome 10% Off','WELCOME10','2026-05-28 02:02:55','2026-07-28 02:02:55',NULL,0,10,'coupon',0,0,NULL,NULL,'percentage','all-orders',0.00,0,1,'2026-05-28 19:02:55','2026-05-28 19:02:55',NULL,'A welcome discount for first-time shoppers — 10% off any order.'),(2,'Free Shipping Over $50','FREESHIP','2026-05-28 02:02:55',NULL,NULL,0,100,'coupon',0,0,NULL,NULL,'shipping','all-orders',50.00,0,1,'2026-05-28 19:02:55','2026-05-28 19:02:55',NULL,'Free shipping on any order $50 or above.'),(3,'Spring Sale — $25 Off','SPRING25','2026-05-28 02:02:55','2026-06-28 02:02:55',500,0,25,'coupon',0,0,NULL,NULL,'amount','all-orders',150.00,0,1,'2026-05-28 19:02:56','2026-05-28 19:02:56',NULL,'A flat $25 off orders over $150.'),(4,'VIP Member 20% Off','VIP20','2026-05-28 02:02:55','2026-08-27 02:02:55',NULL,0,20,'coupon',0,0,NULL,NULL,'percentage','all-orders',100.00,0,1,'2026-05-28 19:02:56','2026-05-28 19:02:56',NULL,'Exclusive 20% off for newsletter subscribers.'),(5,'Bundle & Save $50','BUNDLE50','2026-05-28 02:02:55','2026-07-13 02:02:55',NULL,0,50,'coupon',0,0,NULL,NULL,'amount','all-orders',300.00,0,1,'2026-05-28 19:02:56','2026-05-28 19:02:56',NULL,'Save $50 when you spend $300 or more.');
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
INSERT INTO `ec_flash_sale_products` VALUES (1,9,153.3,50,0),(1,12,188.3,50,0),(1,7,83.3,50,0),(1,5,244.3,50,0),(1,10,132.3,50,0),(1,6,265.3,50,0),(1,3,90.3,50,0),(1,8,419.3,50,0),(1,11,181.3,50,0),(1,4,111.3,50,0),(1,1,34.3,50,0),(1,2,202.3,50,0),(2,9,164.25,75,0),(2,7,89.25,75,0),(2,1,36.75,75,0),(2,8,449.25,75,0),(2,10,141.75,75,0),(2,2,216.75,75,0),(2,4,119.25,75,0),(2,5,261.75,75,0);
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
INSERT INTO `ec_flash_sales` VALUES (1,'48-Hour Flash Sale','2026-05-31 02:02:55','published','2026-05-28 19:02:55','2026-05-28 19:02:55'),(2,'Weekend Doorbusters','2026-06-03 02:02:55','published','2026-05-28 19:02:55','2026-05-28 19:02:55');
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
INSERT INTO `ec_global_option_value` VALUES (1,1,'No gift wrap',0,0,0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(2,1,'Standard kraft wrap',4.99,1,0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(3,1,'Premium silk-ribbon wrap',9.99,2,0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(4,2,'Up to 20 characters',14.99,0,0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(5,3,'Standard 1-year warranty',0,0,0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(6,3,'2-year extended warranty',29.99,1,0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(7,3,'3-year premium care',59.99,2,0,'2026-05-28 19:02:43','2026-05-28 19:02:43');
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
INSERT INTO `ec_global_options` VALUES (1,'Gift Wrapping','Botble\\Ecommerce\\Option\\OptionType\\Dropdown',0,0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(2,'Engraving','Botble\\Ecommerce\\Option\\OptionType\\Field',0,0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(3,'Extended Warranty','Botble\\Ecommerce\\Option\\OptionType\\RadioButton',0,0,'2026-05-28 19:02:43','2026-05-28 19:02:43');
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
INSERT INTO `ec_product_attribute_sets` VALUES (1,'Color','color','visual',1,1,1,'published',0,'2026-05-28 19:02:43','2026-05-28 19:02:43',1),(2,'Size','size','text',1,1,1,'published',1,'2026-05-28 19:02:43','2026-05-28 19:02:43',0),(3,'Material','material','text',1,1,1,'published',2,'2026-05-28 19:02:43','2026-05-28 19:02:43',0);
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
INSERT INTO `ec_product_attributes` VALUES (1,1,'Black','black','#000000',NULL,1,0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(2,1,'White','white','#FFFFFF',NULL,0,1,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(3,1,'Beige','beige','#D6BFA0',NULL,0,2,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(4,1,'Olive','olive','#6B7843',NULL,0,3,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(5,1,'Navy','navy','#10243F',NULL,0,4,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(6,1,'Burgundy','burgundy','#7B1F2B',NULL,0,5,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(7,1,'Charcoal','charcoal','#374049',NULL,0,6,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(8,1,'Cream','cream','#F1E8D7',NULL,0,7,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(9,1,'Pink','pink','#F2C2BB',NULL,0,8,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(10,1,'Brown','brown','#905D5D',NULL,0,9,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(11,1,'Green','green','#B2BD9F',NULL,0,10,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(12,1,'Blue','blue','#87CEEB',NULL,0,11,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(13,2,'XS','xs',NULL,NULL,1,0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(14,2,'S','s',NULL,NULL,0,1,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(15,2,'M','m',NULL,NULL,0,2,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(16,2,'L','l',NULL,NULL,0,3,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(17,2,'XL','xl',NULL,NULL,0,4,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(18,2,'XXL','xxl',NULL,NULL,0,5,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(19,3,'Cotton','cotton',NULL,NULL,1,0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(20,3,'Linen','linen',NULL,NULL,0,1,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(21,3,'Wool','wool',NULL,NULL,0,2,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(22,3,'Tencel','tencel',NULL,NULL,0,3,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(23,3,'Recycled Polyester','recycled-polyester',NULL,NULL,0,4,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(24,3,'Full-Grain Leather','full-grain-leather',NULL,NULL,0,5,'2026-05-28 19:02:43','2026-05-28 19:02:43');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categories`
--

LOCK TABLES `ec_product_categories` WRITE;
/*!40000 ALTER TABLE `ec_product_categories` DISABLE KEYS */;
INSERT INTO `ec_product_categories` VALUES (1,'Clothing',NULL,0,'Cotton tees, knits, coats, and seasonal staples for the modern wardrobe.','published',0,'categories/fashion-2/cate-1.jpg',1,'2026-05-28 19:02:44','2026-05-28 19:02:44',NULL,NULL),(2,'Jewelry',NULL,0,'Pearl, gold, and statement pieces curated for everyday elegance.','published',1,'categories/fashion-2/cate-2.jpg',1,'2026-05-28 19:02:45','2026-05-28 19:02:45',NULL,NULL),(3,'Shoes',NULL,0,'Leather boots, loafers, and heels that pair with every season.','published',2,'categories/fashion-2/cate-3.jpg',1,'2026-05-28 19:02:45','2026-05-28 19:02:45',NULL,NULL),(4,'Bags',NULL,0,'Shoulder bags, totes, and crossbody silhouettes crafted from premium leather.','published',3,'categories/fashion-2/cate-4.jpg',1,'2026-05-28 19:02:45','2026-05-28 19:02:45',NULL,NULL),(5,'Wallets',NULL,0,'Embossed wallets, cardholders, and coin purses for refined daily carry.','published',4,'categories/fashion-2/cate-5.jpg',1,'2026-05-28 19:02:45','2026-05-28 19:02:45',NULL,NULL),(6,'Accessories',NULL,0,'Silk scarves, belts, and finishing touches that elevate any outfit.','published',5,NULL,0,'2026-05-28 19:02:45','2026-05-28 19:02:45',NULL,NULL),(7,'Outerwear',NULL,0,'Wool coats, denim jackets, and layering essentials for transitional weather.','published',6,NULL,0,'2026-05-28 19:02:45','2026-05-28 19:02:45',NULL,NULL);
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
INSERT INTO `ec_product_categories_translations` VALUES ('ar',1,'ملابس',NULL,'القمصان القطنية والسترات الصوفية والسترات والأساسيات الموسمية لخزانة الملابس الحديثة.'),('ar',2,'مجوهرات',NULL,'أقراط مميزة وقلائد متعددة الطبقات وخواتم متعددة الطبقات لكل موسم.'),('ar',3,'أحذية',NULL,'الأحذية الجلدية والأحذية بدون كعب وأنماط الأحذية ذات القطع المنخفضة مناسبة لجميع المواسم.'),('ar',4,'أكياس',NULL,'حقائب كبيرة، وحقائب هوبو، وحقائب كروس، وحقائب يد من جلد الغزال الناعم والجلد المحبب بالكامل.'),('ar',5,'محافظ',NULL,'محافظ منقوشة، وحاملات للبطاقات، وحاملات للعملات المعدنية للحمل اليومي المتطور.'),('ar',6,'مُكَمِّلات',NULL,'حقائب اليد والمحافظ والأحزمة والمجوهرات لإكمال أي ملابس.'),('ar',7,'ملابس خارجية',NULL,'المعاطف والسترات والقمصان لكل موسم.'),('fr',1,'Vêtements',NULL,'T-shirts, pulls, vestes et basiques de saison en coton pour la garde-robe moderne.'),('fr',2,'Bijoux',NULL,'Boucles d\'oreilles accentuées, colliers superposés et bagues superposées pour chaque saison.'),('fr',3,'Chaussures',NULL,'Les bottes en cuir, les mocassins et les chaussures basses conviennent à toutes les saisons.'),('fr',4,'Sacs',NULL,'Sacs fourre-tout, sacs hobo, sacs à bandoulière et pochettes en daim souple et cuir pleine fleur.'),('fr',5,'Portefeuilles',NULL,'Portefeuilles, porte-cartes et porte-monnaie en relief pour un transport sophistiqué au quotidien.'),('fr',6,'Accessoires',NULL,'Sacs à main, portefeuilles, ceintures et bijoux pour compléter n\'importe quelle tenue.'),('fr',7,'Vêtements d\'extérieur',NULL,'Des manteaux, vestes et surchemises pour toutes les saisons.'),('id',1,'Pakaian',NULL,'Kaos katun, sweater, jaket, dan pakaian musiman untuk lemari pakaian modern.'),('id',2,'Perhiasan',NULL,'Anting beraksen, kalung berlapis, dan cincin berlapis untuk setiap musim.'),('id',3,'Sepatu',NULL,'Sepatu bot kulit, sepatu pantofel, dan model sepatu berpotongan rendah cocok untuk segala musim.'),('id',4,'Tas',NULL,'Tas jinjing, tas hobo, tas selempang, dan tas genggam dari bahan suede lembut dan kulit gandum utuh.'),('id',5,'Dompet',NULL,'Dompet timbul, tempat kartu, dan tempat koin untuk dibawa sehari-hari yang canggih.'),('id',6,'Aksesoris',NULL,'Tas tangan, dompet, ikat pinggang, dan perhiasan untuk melengkapi pakaian apa pun.'),('id',7,'Pakaian luar',NULL,'Mantel, jaket, dan kaos luar untuk setiap musim.'),('tr',1,'Giyim',NULL,'Modern gardırop için pamuklu tişörtler, kazaklar, ceketler ve mevsimsel temeller.'),('tr',2,'Takı',NULL,'Her mevsime uygun vurgulu küpeler, katmanlı kolyeler ve katmanlı yüzükler.'),('tr',3,'Ayakkabı',NULL,'Deri çizme, loafer ve dekolte ayakkabı modelleri her mevsime uygundur.'),('tr',4,'Çantalar',NULL,'Yumuşak süet ve sırçalı deriden bez çantalar, hobo çantalar, çapraz çantalar ve el çantaları.'),('tr',5,'Cüzdanlar',NULL,'Sofistike günlük taşıma için kabartmalı cüzdanlar, kart sahipleri ve madeni para sahipleri.'),('tr',6,'Aksesuarlar',NULL,'Her türlü kıyafeti tamamlayacak çantalar, cüzdanlar, kemerler ve takılar.'),('tr',7,'Dış giyim',NULL,'Her mevsime uygun montlar, ceketler ve kabanlar.'),('vi',1,'Quần Áo',NULL,'Áo thun cotton, áo len, áo khoác và những món đồ cơ bản theo mùa cho tủ đồ hiện đại.'),('vi',2,'Trang Sức',NULL,'Bông tai tạo điểm nhấn, vòng cổ nhiều lớp và nhẫn xếp tầng cho mọi mùa.'),('vi',3,'Giày Dép',NULL,'Bốt da, giày lười và các dáng giày cổ thấp phù hợp qua mọi mùa.'),('vi',4,'Túi Xách',NULL,'Túi tote, túi hobo, túi đeo chéo và ví cầm tay bằng da lộn mềm mại và da nguyên tấm.'),('vi',5,'Ví',NULL,'Ví dập nổi, ví đựng thẻ và ví đựng tiền xu cho việc mang theo hằng ngày tinh tế.'),('vi',6,'Phụ kiện',NULL,'Túi xách, ví, thắt lưng và trang sức để hoàn thiện mọi outfit.'),('vi',7,'Áo khoác',NULL,'Áo khoác, jacket và áo overshirt cho mọi mùa.');
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
INSERT INTO `ec_product_category_product` VALUES (1,4),(1,7),(1,8),(1,9),(1,11),(1,12),(2,1),(2,3),(2,5),(2,8),(2,9),(2,10),(2,11),(2,12),(3,1),(3,4),(3,5),(3,7),(3,11),(4,1),(4,2),(4,3),(4,6),(4,9),(4,10),(4,12),(5,2),(5,3),(5,4),(5,6),(5,10),(5,11),(6,1),(6,2),(6,3),(6,4),(6,5),(6,6),(6,7),(6,8),(6,9),(6,10),(7,2),(7,5),(7,6),(7,7),(7,8),(7,12);
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
INSERT INTO `ec_product_collection_products` VALUES (1,12),(2,9),(3,1),(3,11),(4,2),(4,3),(4,4),(4,6),(5,10),(7,8),(8,5),(9,7);
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
INSERT INTO `ec_product_collections` VALUES (1,'New Arrivals','new-arrivals','Fresh drops curated each week.','collection/cls-1.jpg','published','2026-05-28 19:02:45','2026-05-28 19:02:45',1),(2,'Best Sellers','best-sellers','Pieces our community keeps coming back for.','collection/cls-10.jpg','published','2026-05-28 19:02:45','2026-05-28 19:02:45',1),(3,'Limited Edition','limited-edition','Exclusive drops once they sell out, they are gone.','collection/cls-11.jpg','published','2026-05-28 19:02:45','2026-05-28 19:02:45',1),(4,'Outerwear','outerwear','Coats, jackets, and layering essentials for any season.','collection/cls-12.jpg','published','2026-05-28 19:02:45','2026-05-28 19:02:45',1),(5,'Knitwear','knitwear','Soft sweaters and cardigans for cooler days.','collection/cls-13.jpg','published','2026-05-28 19:02:45','2026-05-28 19:02:45',0),(6,'Bottoms','bottoms','Denim, trousers, and skirts for everyday wear.','collection/cls-14.jpg','published','2026-05-28 19:02:45','2026-05-28 19:02:45',0),(7,'Footwear','footwear','Boots, sneakers, and heels to complete the look.','collection/cls-15.jpg','published','2026-05-28 19:02:45','2026-05-28 19:02:45',0),(8,'Accessories','accessories','Bags, scarves, and finishing touches.','collection/cls-16.jpg','published','2026-05-28 19:02:45','2026-05-28 19:02:45',0),(9,'Sale','sale','End-of-season prices on customer favorites.','collection/cls-17.jpg','published','2026-05-28 19:02:45','2026-05-28 19:02:45',0);
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
INSERT INTO `ec_product_collections_translations` VALUES ('ar',1,'الوافدون الجدد','يتم اختيار نماذج جديدة كل أسبوع.'),('ar',2,'أفضل البائعين','المنتجات التي يثق بها العملاء ويعيدون طلبها في كل موسم.'),('ar',3,'طبعة محدودة','الشحنات الوحيدة من الشركات المصنعة المستقلة. إذا تم بيعه، فقد ذهب.'),('ar',4,'ملابس خارجية','معاطف وسترات وطبقات أساسية لكل موسم.'),('ar',5,'تريكو','سترات وسترات ناعمة للأيام الباردة.'),('ar',6,'قيعان','الجينز والسراويل والتنانير للارتداء اليومي.'),('ar',7,'الأحذية','الأحذية والأحذية الرياضية والكعب لإكمال المظهر.'),('ar',8,'مُكَمِّلات','الحقائب والأوشحة واللمسات النهائية.'),('ar',9,'أُوكَازيُون','أسعار نهاية الموسم للمنتجات التي يحبها العملاء.'),('fr',1,'Nouveautés','De nouveaux modèles sont sélectionnés chaque semaine.'),('fr',2,'Meilleures ventes','Des produits auxquels les clients font confiance et qui les commandent chaque saison.'),('fr',3,'Édition limitée','Expéditions exclusives de fabricants indépendants. S\'il est épuisé, il est parti.'),('fr',4,'Vêtements d\'extérieur','Trenchs, vestes et pièces superposées essentielles pour chaque saison.'),('fr',5,'Tricots','Pulls et cardigans doux pour les journées froides.'),('fr',6,'Bas','Jeans, pantalons et jupes à porter au quotidien.'),('fr',7,'Chaussure','Des bottes, des baskets et des talons pour compléter le look.'),('fr',8,'Accessoires','Sacs, foulards et finitions.'),('fr',9,'Vente','Prix ​​de fin de saison pour les produits que les clients adorent.'),('id',1,'Pendatang Baru','Model-model baru dipilih setiap minggu.'),('id',2,'Terlaris','Produk yang dipercaya dan dipesan ulang oleh pelanggan setiap musim.'),('id',3,'Edisi Terbatas','Pengiriman tunggal dari produsen independen. Kalau sudah terjual habis.'),('id',4,'Pakaian luar','Jas hujan, jaket, dan pakaian pelapis penting untuk setiap musim.'),('id',5,'Pakaian rajut','Sweater dan kardigan lembut untuk hari dingin.'),('id',6,'Bawahan','Jeans, celana dan rok untuk dipakai sehari-hari.'),('id',7,'Alas kaki','Sepatu bot, sepatu kets, dan sepatu hak untuk melengkapi tampilan.'),('id',8,'Aksesoris','Tas, syal dan sentuhan akhir.'),('id',9,'Penjualan','Harga akhir musim untuk produk yang disukai pelanggan.'),('tr',1,'Yeni Gelenler','Her hafta yeni modeller seçiliyor.'),('tr',2,'En Çok Satanlar','Müşterilerin güvendiği ve her sezon yeniden sipariş ettiği ürünler.'),('tr',3,'Sınırlı sayıda','Bağımsız üreticilerden tek gönderi. Eğer tükendiyse, gitmiştir.'),('tr',4,'Dış giyim','Trençkotlar, ceketler ve her mevsimin vazgeçilmez katman parçaları.'),('tr',5,'Triko','Soğuk günler için yumuşak kazaklar ve hırkalar.'),('tr',6,'Dipler','Günlük kullanım için kot pantolon, pantolon ve etekler.'),('tr',7,'Ayakkabı','Görünümü tamamlamak için botlar, spor ayakkabılar ve topuklu ayakkabılar.'),('tr',8,'Aksesuarlar','Çantalar, eşarplar ve son rötuşlar.'),('tr',9,'Satış','Müşterilerin beğendiği ürünlerin sezon sonu fiyatları.'),('vi',1,'Hàng Mới Về','Những mẫu mới được tuyển chọn mỗi tuần.'),('vi',2,'Bán chạy nhất','Những sản phẩm được khách hàng tin dùng và đặt lại qua từng mùa.'),('vi',3,'Phiên bản giới hạn','Những lô hàng duy nhất từ các nhà sản xuất độc lập. Bán hết là không còn nữa.'),('vi',4,'Đồ Khoác Ngoài','Áo khoác dài, áo khoác và những món đồ lớp thiết yếu cho mọi mùa.'),('vi',5,'Đồ Len','Áo len và áo cardigan mềm mại cho những ngày se lạnh.'),('vi',6,'Trang Phục Phần Dưới','Quần jeans, quần âu và chân váy cho mặc hằng ngày.'),('vi',7,'Giày Dép','Bốt, giày sneaker và giày cao gót để hoàn thiện diện mạo.'),('vi',8,'Phụ Kiện','Túi xách, khăn quàng và những chi tiết hoàn thiện.'),('vi',9,'Khuyến Mãi','Giá cuối mùa cho những sản phẩm khách hàng yêu thích.');
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
INSERT INTO `ec_product_cross_sale_relations` VALUES (1,3,0,0.00,'fixed',1),(1,4,0,0.00,'fixed',1),(1,7,0,0.00,'fixed',1),(1,8,0,0.00,'fixed',1),(1,12,0,0.00,'fixed',1),(2,3,0,0.00,'fixed',1),(2,7,0,0.00,'fixed',1),(2,10,0,0.00,'fixed',1),(2,12,0,0.00,'fixed',1),(3,2,0,0.00,'fixed',1),(3,5,0,0.00,'fixed',1),(3,7,0,0.00,'fixed',1),(3,8,0,0.00,'fixed',1),(3,10,0,0.00,'fixed',1),(4,1,0,0.00,'fixed',1),(4,2,0,0.00,'fixed',1),(4,5,0,0.00,'fixed',1),(4,10,0,0.00,'fixed',1),(4,12,0,0.00,'fixed',1),(5,3,0,0.00,'fixed',1),(5,4,0,0.00,'fixed',1),(5,6,0,0.00,'fixed',1),(5,9,0,0.00,'fixed',1),(5,10,0,0.00,'fixed',1),(5,12,0,0.00,'fixed',1),(6,2,0,0.00,'fixed',1),(6,4,0,0.00,'fixed',1),(6,5,0,0.00,'fixed',1),(6,7,0,0.00,'fixed',1),(6,8,0,0.00,'fixed',1),(6,11,0,0.00,'fixed',1),(6,12,0,0.00,'fixed',1),(7,1,0,0.00,'fixed',1),(7,3,0,0.00,'fixed',1),(7,4,0,0.00,'fixed',1),(7,5,0,0.00,'fixed',1),(7,12,0,0.00,'fixed',1),(8,1,0,0.00,'fixed',1),(8,2,0,0.00,'fixed',1),(8,3,0,0.00,'fixed',1),(8,7,0,0.00,'fixed',1),(8,11,0,0.00,'fixed',1),(8,12,0,0.00,'fixed',1),(9,1,0,0.00,'fixed',1),(9,3,0,0.00,'fixed',1),(9,7,0,0.00,'fixed',1),(9,8,0,0.00,'fixed',1),(9,10,0,0.00,'fixed',1),(9,11,0,0.00,'fixed',1),(10,1,0,0.00,'fixed',1),(10,3,0,0.00,'fixed',1),(10,6,0,0.00,'fixed',1),(10,7,0,0.00,'fixed',1),(10,11,0,0.00,'fixed',1),(11,1,0,0.00,'fixed',1),(11,4,0,0.00,'fixed',1),(11,7,0,0.00,'fixed',1),(11,8,0,0.00,'fixed',1),(11,12,0,0.00,'fixed',1),(12,5,0,0.00,'fixed',1),(12,7,0,0.00,'fixed',1),(12,9,0,0.00,'fixed',1),(12,11,0,0.00,'fixed',1);
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
INSERT INTO `ec_product_label_products` VALUES (1,3),(3,6),(5,9),(5,12);
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
INSERT INTO `ec_product_labels` VALUES (1,'Hot','#F0460E','published','2026-05-28 19:02:43','2026-05-28 19:02:43','#FFFFFF'),(2,'New','#22C55E','published','2026-05-28 19:02:43','2026-05-28 19:02:43','#FFFFFF'),(3,'Sale','#EF4444','published','2026-05-28 19:02:43','2026-05-28 19:02:43','#FFFFFF'),(4,'Best Seller','#1E1E1E','published','2026-05-28 19:02:43','2026-05-28 19:02:43','#FFFFFF'),(5,'Limited','#7B1F2B','published','2026-05-28 19:02:43','2026-05-28 19:02:43','#FFFFFF'),(6,'Eco','#6B7843','published','2026-05-28 19:02:43','2026-05-28 19:02:43','#FFFFFF');
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
INSERT INTO `ec_product_tag_product` VALUES (1,4),(1,5),(1,14),(2,1),(2,10),(2,11),(3,4),(3,7),(3,15),(4,3),(4,4),(4,9),(5,11),(5,13),(5,15),(6,2),(6,8),(6,11),(7,2),(7,10),(7,12),(8,3),(8,5),(8,10),(9,6),(9,7),(9,12),(10,1),(10,9),(10,13),(11,2),(11,7),(11,11),(12,5),(12,6),(12,10);
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
INSERT INTO `ec_product_tags` VALUES (1,'Cotton','Products tagged with Cotton.',NULL,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(2,'Linen','Products tagged with Linen.',NULL,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(3,'Wool','Products tagged with Wool.',NULL,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(4,'Leather','Products tagged with Leather.',NULL,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(5,'Tencel','Products tagged with Tencel.',NULL,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(6,'Recycled','Products tagged with Recycled.',NULL,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(7,'Made in Portugal','Products tagged with Made in Portugal.',NULL,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(8,'Made in Italy','Products tagged with Made in Italy.',NULL,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(9,'Hand-Crafted','Products tagged with Hand-Crafted.',NULL,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(10,'Vegan','Products tagged with Vegan.',NULL,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(11,'Limited Run','Products tagged with Limited Run.',NULL,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(12,'Best Seller','Products tagged with Best Seller.',NULL,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(13,'New Arrival','Products tagged with New Arrival.',NULL,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(14,'Editor Pick','Products tagged with Editor Pick.',NULL,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(15,'Eco-Friendly','Products tagged with Eco-Friendly.',NULL,'published','2026-05-28 19:02:43','2026-05-28 19:02:43');
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
INSERT INTO `ec_product_up_sale_relations` VALUES (1,10,0,15.00,'percent',1),(1,11,0,10.00,'percent',1),(2,7,0,15.00,'percent',1),(3,5,0,20.00,'percent',1),(3,10,0,10.00,'percent',1),(4,7,0,10.00,'fixed',1),(4,8,0,10.00,'percent',1),(5,8,0,20.00,'fixed',1),(5,10,0,50.00,'fixed',1),(6,7,0,5.00,'fixed',1),(6,10,0,50.00,'fixed',1),(7,2,0,20.00,'percent',1),(7,11,0,50.00,'fixed',1),(8,5,0,20.00,'fixed',1),(9,7,0,5.00,'fixed',1),(9,10,0,20.00,'percent',1),(10,1,0,50.00,'fixed',1),(10,11,0,20.00,'percent',1),(11,2,0,20.00,'fixed',1),(11,12,0,10.00,'fixed',1),(12,3,0,50.00,'fixed',1),(12,7,0,50.00,'fixed',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_variation_items`
--

LOCK TABLES `ec_product_variation_items` WRITE;
/*!40000 ALTER TABLE `ec_product_variation_items` DISABLE KEYS */;
INSERT INTO `ec_product_variation_items` VALUES (1,2,1),(17,2,9),(23,2,12),(7,4,4),(15,5,8),(19,5,10),(13,7,7),(11,8,6),(21,8,11),(5,9,3),(3,10,2),(9,10,5),(6,13,3),(18,13,9),(22,14,11),(2,15,1),(12,15,6),(8,16,4),(14,16,7),(24,16,12),(16,17,8),(20,17,10),(4,18,2),(10,18,5),(26,19,14),(25,20,13),(28,20,16),(32,20,20),(30,21,18),(31,21,19),(27,23,15),(29,24,17);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_variations`
--

LOCK TABLES `ec_product_variations` WRITE;
/*!40000 ALTER TABLE `ec_product_variations` DISABLE KEYS */;
INSERT INTO `ec_product_variations` VALUES (1,13,1,1),(2,14,1,0),(3,15,2,1),(4,16,2,0),(5,17,2,0),(6,18,2,0),(7,19,2,0),(8,20,3,1),(9,21,4,1),(10,22,4,0),(11,23,4,0),(12,24,4,0),(13,25,6,1),(14,26,6,0),(15,27,6,0),(16,28,7,1),(17,29,7,0),(18,30,8,1),(19,31,11,1),(20,32,11,0);
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
INSERT INTO `ec_product_with_attribute_set` VALUES (1,1,0),(2,1,0),(1,2,0),(2,2,0),(1,3,0),(2,3,0),(1,4,0),(2,4,0),(3,6,0),(3,7,0),(3,8,0),(3,11,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_products`
--

LOCK TABLES `ec_products` WRITE;
/*!40000 ALTER TABLE `ec_products` DISABLE KEYS */;
INSERT INTO `ec_products` VALUES (1,'Cotton Tee','cotton-tee','Soft combed cotton tee with a relaxed silhouette and reinforced neckline.','<p>100% organic cotton, pre-washed for a lived-in feel. Available in black, ivory, and stone. Garment-dyed with low-impact dyes.</p>','published','[\"products\\/fashion-2\\/product-1.jpg\"]',NULL,'FJ-150-A1',0,17,0,1,'in_stock',1,NULL,6,0,2,10,2.90,0,49,39,NULL,NULL,17,15,19,805,NULL,'standard',37516,'2026-05-28 19:02:48','2026-05-28 19:02:58',1,0,'Botble\\ACL\\Models\\User',0,'products/fashion-2/product-1.jpg','physical','4709942651665',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(2,'Shopping Bag','shopping-bag','Structured leather shopping bag with twin top handles and an unlined interior.','<p>Full-grain Italian leather. Holds a 13-inch laptop, water bottle, and daily essentials. Brass hardware develops a patina over time.</p>','published','[\"products\\/fashion-2\\/product-2.jpg\"]',NULL,'K0-149-A1',0,11,0,1,'in_stock',0,NULL,12,0,5,10,3.40,0,289,229,NULL,NULL,13,15,17,741,NULL,'standard',182925,'2026-05-28 19:02:48','2026-05-28 19:02:58',2,0,'Botble\\ACL\\Models\\User',0,'products/fashion-2/product-2.jpg','physical','4265224180471',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(3,'Embossed Wallet','embossed-wallet','Bifold wallet with subtle embossed monogram, six card slots, and a coin pocket.','<p>Vegetable-tanned leather. RFID-blocking lining. Refined at the edges with hand-painted finish.</p>','published','[\"products\\/fashion-2\\/product-3.jpg\"]',NULL,'HS-104-A1',0,13,0,1,'in_stock',1,NULL,4,0,1,10,2.90,0,129,99,NULL,NULL,18,17,13,592,NULL,'standard',155189,'2026-05-28 19:02:48','2026-05-28 19:02:58',3,0,'Botble\\ACL\\Models\\User',0,'products/fashion-2/product-3.jpg','physical','5046282458059',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(4,'Turtleneck Knit','turtleneck-knit','Fine-gauge merino turtleneck with a relaxed fit and ribbed trims.','<p>Extrafine merino wool, machine-washable on the wool cycle. Available in espresso, oat, and storm grey.</p>','published','[\"products\\/fashion-2\\/product-4.jpg\"]',NULL,'PP-123-A1',0,19,0,1,'in_stock',0,NULL,10,0,4,10,3.00,0,159,119,NULL,NULL,20,10,19,622,NULL,'standard',152457,'2026-05-28 19:02:48','2026-05-28 19:02:58',4,0,'Botble\\ACL\\Models\\User',0,'products/fashion-2/product-4.jpg','physical','0490179197975',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(5,'Shoulder Bag','shoulder-bag','Slouchy shoulder bag in pebbled leather with a magnetic snap closure.','<p>Adjustable strap with two carry options. Interior zip pocket and two slip pockets. Made in Spain.</p>','published','[\"products\\/fashion-2\\/product-5.jpg\"]',NULL,'YH-137',0,19,0,1,'in_stock',0,NULL,5,0,0,10,2.50,0,349,269,NULL,NULL,17,12,18,577,NULL,'standard',198757,'2026-05-28 19:02:48','2026-05-28 19:02:58',1,0,'Botble\\ACL\\Models\\User',0,'products/fashion-2/product-5.jpg','physical','7990237030150',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(6,'Leather Boots','leather-boots','Almond-toe ankle boots on a stacked block heel with a side zip.','<p>Smooth calfskin upper, leather-lined footbed, and a Vibram rubber sole for traction. Hand-finished in Portugal.</p>','published','[\"products\\/fashion-2\\/product-6.jpg\"]',NULL,'JO-118-A1',0,15,0,1,'in_stock',1,NULL,1,0,3,10,3.00,0,379,299,NULL,NULL,16,20,10,526,NULL,'standard',192664,'2026-05-28 19:02:49','2026-05-28 19:02:58',2,0,'Botble\\ACL\\Models\\User',0,'products/fashion-2/product-6.jpg','physical','5575211493965',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(7,'Silk Scarf','silk-scarf','Hand-rolled mulberry silk scarf with a printed botanical motif.','<p>90x90cm twill silk. Machine-printed with low-impact dyes. Includes a recycled paper gift sleeve.</p>','published','[\"products\\/fashion-2\\/product-7.jpg\"]',NULL,'TP-181-A1',0,20,0,1,'in_stock',1,NULL,1,0,2,10,2.90,0,119,89,NULL,NULL,15,19,20,892,NULL,'standard',124218,'2026-05-28 19:02:49','2026-05-28 19:02:58',3,0,'Botble\\ACL\\Models\\User',0,'products/fashion-2/product-7.jpg','physical','9725193252005',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(8,'Wool Coat','wool-coat','Double-breasted wool coat with notched lapels and welt pockets.','<p>80% wool, 20% cashmere. Cupro lining. Tailored fit through the shoulders with room to layer underneath.</p>','published','[\"products\\/fashion-2\\/product-8.jpg\"]',NULL,'ZI-184-A1',0,13,0,1,'in_stock',0,NULL,10,0,1,10,2.50,0,599,449,NULL,NULL,15,18,19,561,NULL,'standard',39472,'2026-05-28 19:02:49','2026-05-28 19:02:58',4,0,'Botble\\ACL\\Models\\User',0,'products/fashion-2/product-8.jpg','physical','1100140423796',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(9,'Denim Jacket','denim-jacket','Classic trucker-style denim jacket in a vintage-blue rigid wash.','<p>14oz Japanese denim. Selvedge inner seams. Softens with wear and develops natural fades.</p>','published','[\"products\\/fashion-2\\/product-9.jpg\"]',NULL,'CF-190',0,16,0,1,'in_stock',1,NULL,7,0,0,10,2.30,0,219,169,NULL,NULL,16,11,12,566,NULL,'standard',165664,'2026-05-28 19:02:49','2026-05-28 19:02:58',1,0,'Botble\\ACL\\Models\\User',0,'products/fashion-2/product-9.jpg','physical','0284942787421',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(10,'Pearl Necklace','pearl-necklace','Freshwater pearl necklace with a 14k gold-fill clasp and 18-inch length.','<p>Hand-knotted between each pearl. Pearls average 7-8mm. Comes in a velvet pouch with care card.</p>','published','[\"products\\/fashion-2\\/product-10.jpg\"]',NULL,'QH-126',0,14,0,1,'in_stock',1,NULL,12,0,0,10,3.10,0,189,149,NULL,NULL,14,19,18,735,NULL,'standard',101898,'2026-05-28 19:02:49','2026-05-28 19:02:58',2,0,'Botble\\ACL\\Models\\User',0,'products/fashion-2/product-10.jpg','physical','8313840666773',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(11,'Mini Crossbody','mini-crossbody','Small leather crossbody with a curb-chain strap and gold-tone hardware.','<p>Holds a phone, cards, and lipstick. Adjustable strap from 22 to 24 inches. Cotton drill lining.</p>','published','[\"products\\/fashion-2\\/product-11.jpg\"]',NULL,'RK-191-A1',0,18,0,1,'in_stock',1,NULL,9,0,2,10,2.40,0,259,199,NULL,NULL,13,12,15,656,NULL,'standard',142819,'2026-05-28 19:02:49','2026-05-28 19:02:58',3,0,'Botble\\ACL\\Models\\User',0,'products/fashion-2/product-11.jpg','physical','1470248272238',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(12,'Cashmere Cardigan','cashmere-cardigan','Open-front cashmere cardigan with drop shoulders and a relaxed silhouette.','<p>100% Mongolian cashmere. Two patch pockets. Layer over a tee or under a coat for transitional weather.</p>','published','[\"products\\/fashion-2\\/product-12.jpg\"]',NULL,'XW-110',0,13,0,1,'in_stock',1,NULL,3,0,0,10,2.70,0,269,209,NULL,NULL,14,20,16,534,NULL,'standard',127528,'2026-05-28 19:02:49','2026-05-28 19:02:58',4,0,'Botble\\ACL\\Models\\User',0,'products/fashion-2/product-12.jpg','physical','4872315947495',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(13,'Cotton Tee',NULL,NULL,NULL,'published','[\"products\\/fashion-2\\/product-1.jpg\"]',NULL,'FJ-150-A1',0,17,0,1,'in_stock',0,NULL,6,1,0,0,0.00,0,49,NULL,NULL,NULL,17,15,19,805,NULL,'standard',0,'2026-05-28 19:02:49','2026-05-28 19:02:58',1,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','8585263861084',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(14,'Cotton Tee',NULL,NULL,NULL,'published','[\"products\\/fashion-2\\/product-1.jpg\"]',NULL,'FJ-150-A1-A2',0,17,0,1,'in_stock',0,NULL,6,1,0,0,0.00,0,49,NULL,NULL,NULL,17,15,19,805,NULL,'standard',0,'2026-05-28 19:02:50','2026-05-28 19:02:58',1,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','2314259891165',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(15,'Shopping Bag',NULL,NULL,NULL,'published','[\"products\\/fashion-2\\/product-2.jpg\"]',NULL,'K0-149-A1',0,11,0,1,'in_stock',0,NULL,12,1,0,0,0.00,0,289,NULL,NULL,NULL,13,15,17,741,NULL,'standard',0,'2026-05-28 19:02:50','2026-05-28 19:02:58',2,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','5309694893710',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(16,'Shopping Bag',NULL,NULL,NULL,'published','[\"products\\/fashion-2\\/product-2.jpg\"]',NULL,'K0-149-A1-A2',0,11,0,1,'in_stock',0,NULL,12,1,0,0,0.00,0,289,NULL,NULL,NULL,13,15,17,741,NULL,'standard',0,'2026-05-28 19:02:50','2026-05-28 19:02:58',2,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','0071304086915',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(17,'Shopping Bag',NULL,NULL,NULL,'published','[\"products\\/fashion-2\\/product-2.jpg\"]',NULL,'K0-149-A1-A3',0,11,0,1,'in_stock',0,NULL,12,1,0,0,0.00,0,289,NULL,NULL,NULL,13,15,17,741,NULL,'standard',0,'2026-05-28 19:02:50','2026-05-28 19:02:58',2,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','4627829586247',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(18,'Shopping Bag',NULL,NULL,NULL,'published','[\"products\\/fashion-2\\/product-2.jpg\"]',NULL,'K0-149-A1-A4',0,11,0,1,'in_stock',0,NULL,12,1,0,0,0.00,0,289,NULL,NULL,NULL,13,15,17,741,NULL,'standard',0,'2026-05-28 19:02:50','2026-05-28 19:02:58',2,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','5723087911421',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(19,'Shopping Bag',NULL,NULL,NULL,'published','[\"products\\/fashion-2\\/product-2.jpg\"]',NULL,'K0-149-A1-A5',0,11,0,1,'in_stock',0,NULL,12,1,0,0,0.00,0,289,NULL,NULL,NULL,13,15,17,741,NULL,'standard',0,'2026-05-28 19:02:50','2026-05-28 19:02:58',2,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','4846751512722',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(20,'Embossed Wallet',NULL,NULL,NULL,'published','[\"products\\/fashion-2\\/product-3.jpg\"]',NULL,'HS-104-A1',0,13,0,1,'in_stock',0,NULL,4,1,0,0,0.00,0,129,NULL,NULL,NULL,18,17,13,592,NULL,'standard',0,'2026-05-28 19:02:50','2026-05-28 19:02:58',3,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','6136050310838',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(21,'Turtleneck Knit',NULL,NULL,NULL,'published','[\"products\\/fashion-2\\/product-4.jpg\"]',NULL,'PP-123-A1',0,19,0,1,'in_stock',0,NULL,10,1,0,0,0.00,0,159,111.3,NULL,NULL,20,10,19,622,NULL,'standard',0,'2026-05-28 19:02:50','2026-05-28 19:02:58',4,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','5922472161179',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(22,'Turtleneck Knit',NULL,NULL,NULL,'published','[\"products\\/fashion-2\\/product-4.jpg\"]',NULL,'PP-123-A1-A2',0,19,0,1,'in_stock',0,NULL,10,1,0,0,0.00,0,159,141.51,NULL,NULL,20,10,19,622,NULL,'standard',0,'2026-05-28 19:02:50','2026-05-28 19:02:58',4,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','1586368781014',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(23,'Turtleneck Knit',NULL,NULL,NULL,'published','[\"products\\/fashion-2\\/product-4.jpg\"]',NULL,'PP-123-A1-A3',0,19,0,1,'in_stock',0,NULL,10,1,0,0,0.00,0,159,135.15,NULL,NULL,20,10,19,622,NULL,'standard',0,'2026-05-28 19:02:50','2026-05-28 19:02:58',4,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','1400333093097',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(24,'Turtleneck Knit',NULL,NULL,NULL,'published','[\"products\\/fashion-2\\/product-4.jpg\"]',NULL,'PP-123-A1-A4',0,19,0,1,'in_stock',0,NULL,10,1,0,0,0.00,0,159,125.61,NULL,NULL,20,10,19,622,NULL,'standard',0,'2026-05-28 19:02:50','2026-05-28 19:02:58',4,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','3441422037033',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(25,'Leather Boots',NULL,NULL,NULL,'published','[\"products\\/fashion-2\\/product-6.jpg\"]',NULL,'JO-118-A1',0,15,0,1,'in_stock',0,NULL,1,1,0,0,0.00,0,379,NULL,NULL,NULL,16,20,10,526,NULL,'standard',0,'2026-05-28 19:02:50','2026-05-28 19:02:58',2,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','5819610720148',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(26,'Leather Boots',NULL,NULL,NULL,'published','[\"products\\/fashion-2\\/product-6.jpg\"]',NULL,'JO-118-A1-A2',0,15,0,1,'in_stock',0,NULL,1,1,0,0,0.00,0,379,NULL,NULL,NULL,16,20,10,526,NULL,'standard',0,'2026-05-28 19:02:51','2026-05-28 19:02:58',2,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','2319009872333',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(27,'Leather Boots',NULL,NULL,NULL,'published','[\"products\\/fashion-2\\/product-6.jpg\"]',NULL,'JO-118-A1-A3',0,15,0,1,'in_stock',0,NULL,1,1,0,0,0.00,0,379,NULL,NULL,NULL,16,20,10,526,NULL,'standard',0,'2026-05-28 19:02:51','2026-05-28 19:02:58',2,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','9605931513257',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(28,'Silk Scarf',NULL,NULL,NULL,'published','[\"products\\/fashion-2\\/product-7.jpg\"]',NULL,'TP-181-A1',0,20,0,1,'in_stock',0,NULL,1,1,0,0,0.00,0,119,NULL,NULL,NULL,15,19,20,892,NULL,'standard',0,'2026-05-28 19:02:51','2026-05-28 19:02:58',3,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','7450904902666',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(29,'Silk Scarf',NULL,NULL,NULL,'published','[\"products\\/fashion-2\\/product-7.jpg\"]',NULL,'TP-181-A1-A2',0,20,0,1,'in_stock',0,NULL,1,1,0,0,0.00,0,119,NULL,NULL,NULL,15,19,20,892,NULL,'standard',0,'2026-05-28 19:02:51','2026-05-28 19:02:58',3,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','0541633462211',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(30,'Wool Coat',NULL,NULL,NULL,'published','[\"products\\/fashion-2\\/product-8.jpg\"]',NULL,'ZI-184-A1',0,13,0,1,'in_stock',0,NULL,10,1,0,0,0.00,0,599,443.26,NULL,NULL,15,18,19,561,NULL,'standard',0,'2026-05-28 19:02:51','2026-05-28 19:02:58',4,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','4428014728400',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(31,'Mini Crossbody',NULL,NULL,NULL,'published','[\"products\\/fashion-2\\/product-11.jpg\"]',NULL,'RK-191-A1',0,18,0,1,'in_stock',0,NULL,9,1,0,0,0.00,0,259,NULL,NULL,NULL,13,12,15,656,NULL,'standard',0,'2026-05-28 19:02:51','2026-05-28 19:02:58',3,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','0017363316679',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(32,'Mini Crossbody',NULL,NULL,NULL,'published','[\"products\\/fashion-2\\/product-11.jpg\"]',NULL,'RK-191-A1-A2',0,18,0,1,'in_stock',0,NULL,9,1,0,0,0.00,0,259,NULL,NULL,NULL,13,12,15,656,NULL,'standard',0,'2026-05-28 19:02:51','2026-05-28 19:02:58',3,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','0421076592914',NULL,NULL,0,0,'auto_generate',0,0,0,NULL);
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
INSERT INTO `ec_products_translations` VALUES ('ar',1,'تي شيرت قطن',NULL,'تي شيرت من القطن الممشط الناعم بقصة مريحة وخط عنق معزز.','<p> قطن عضوي بنسبة 100%، مغسول مسبقًا ليمنحك ملمسًا ناعمًا كما لو تم ارتداؤه لفترة طويلة. متوفر باللون الأسود والعاجي والرمادي الأردوازي. صبغ المنتج النهائي بأصباغ منخفضة التأثير.</p>'),('ar',2,'كيس التسوق',NULL,'حقيبة تسوق جلدية على شكل مقبض علوي مزدوج وحقيبة غير مبطنة.','<p>جلد إيطالي محبب بالكامل. يمكنه حمل كمبيوتر محمول مقاس 13 بوصة وزجاجة مياه وأدوات يومية. أبازيم معدنية نحاسية تتلون بمرور الوقت.</p>'),('ar',3,'محفظة منقوشة',NULL,'محفظة جلدية ثنائية الطي مع نقش مونوغرام منقوش رقيق، وستة أقسام للبطاقات وقسم واحد للعملات المعدنية.','<p>جلد نباتي. بطانة مضادة للسرقة RFID. حواف مرسومة يدويًا ونقاط ضغط معززة.</p>'),('ar',4,'الياقة المدورة متماسكة',NULL,'سترة بياقة مدورة من ميرينو منسوجة بسلاسة مع مقاس مريح وحاشية مضلعة.','<p> صوف ميرينو فائق النعومة، يمكن غسله في الغسالة في وضع الصوف. متوفر باللون البني الإسبريسو والشوفان والرمادي العاصفة.</p>'),('ar',5,'حقيبة الكتف',NULL,'حقيبة كتف ناعمة من الجلد المحبب مع إغلاق مغناطيسي.','<p> حزام قابل للتعديل بطريقتين للارتداء. حجرة داخلية بسحاب وحجرتين إضافيتين. صنع في اسبانيا.</p>'),('ar',6,'أحذية جلدية',NULL,'حذاء منخفض بمقدمة مدببة متوسطة على كعب كتلة متعدد الطبقات مع سحاب جانبي.','<p> جسم من جلد العجل الناعم، ونعل داخلي من الجلد ونعل مطاطي Vibram مضاد للانزلاق. تم تشطيبه يدويًا في البرتغال.</p>'),('ar',7,'وشاح حريري',NULL,'وشاح حريري ملفوف يدويًا بزخارف نباتية مطبوعة.','<p>تويل حرير 90×90 سم. مطبوعة آليًا باستخدام صبغات منخفضة التأثير. يأتي مع كيس ورقي معاد تدويره كهدية.</p>'),('ar',8,'معطف من الصوف',NULL,'معطف من الصوف بصفي أزرار وطية صدر مدببة وجيوب بأهداب.','<p>80% صوف، 20% كشمير. بطانة كوبرو. يتناسب المقاس بشكل مريح مع الأكتاف مع مساحة لارتداء بطانة داخلية.</p>'),('ar',9,'سترة الدنيم',NULL,'سترة جينز كلاسيكية بنمط سائق الشاحنة باللون الأزرق الخام العتيق.','<p>دينيم ياباني 14 أونصة. طبقات في selvedge. ينعم تدريجيًا بمرور الوقت ويتلاشى بشكل طبيعي.</p>'),('ar',10,'قلادة اللؤلؤ',NULL,'عقد من لؤلؤ المياه العذبة مع مشبك مطلي بالذهب عيار 14 قيراط وطول 18 بوصة.','<p> اربط عقدة يدويًا بين كل لؤلؤة. لآلئ متوسطة الحجم 7-8 ملم. تأتي مع حقيبة مخملية وبطاقة تعليمات العناية.</p>'),('ar',11,'حقيبة كروس صغيرة',NULL,'حقيبة كروس صغيرة من الجلد مزودة بحزام سلسلة وإبزيم معدني ذهبي اللون.','<p>يمكنه حمل الهاتف والبطاقات وأحمر الشفاه. يمكن تعديل الحزام من 22 إلى 24 بوصة. حفر بطانة من نسيج القطن.</p>'),('ar',12,'سترة الكشمير',NULL,'سترة من الكشمير مفتوحة من الأمام بأكتاف منسدلة وقصة مريحة.','<p>100% كشمير منغولي. جيبان للغطاء. ارتديه فوق تي شيرت أو تحت سترة للطقس الموسمي.</p>'),('ar',13,'تي شيرت قطن',NULL,'تي شيرت من القطن الممشط الناعم بقصة مريحة وخط عنق معزز.','<p> قطن عضوي بنسبة 100%، مغسول مسبقًا ليمنحك ملمسًا ناعمًا كما لو تم ارتداؤه لفترة طويلة. متوفر باللون الأسود والعاجي والرمادي الأردوازي. صبغ المنتج النهائي بأصباغ منخفضة التأثير.</p>'),('ar',14,'تي شيرت قطن',NULL,'تي شيرت من القطن الممشط الناعم بقصة مريحة وخط عنق معزز.','<p> قطن عضوي بنسبة 100%، مغسول مسبقًا ليمنحك ملمسًا ناعمًا كما لو تم ارتداؤه لفترة طويلة. متوفر باللون الأسود والعاجي والرمادي الأردوازي. صبغ المنتج النهائي بأصباغ منخفضة التأثير.</p>'),('ar',15,'كيس التسوق',NULL,'حقيبة تسوق جلدية على شكل مقبض علوي مزدوج وحقيبة غير مبطنة.','<p>جلد إيطالي محبب بالكامل. يمكنه حمل كمبيوتر محمول مقاس 13 بوصة وزجاجة مياه وأدوات يومية. أبازيم معدنية نحاسية تتلون بمرور الوقت.</p>'),('ar',16,'كيس التسوق',NULL,'حقيبة تسوق جلدية على شكل مقبض علوي مزدوج وحقيبة غير مبطنة.','<p>جلد إيطالي محبب بالكامل. يمكنه حمل كمبيوتر محمول مقاس 13 بوصة وزجاجة مياه وأدوات يومية. أبازيم معدنية نحاسية تتلون بمرور الوقت.</p>'),('ar',17,'كيس التسوق',NULL,'حقيبة تسوق جلدية على شكل مقبض علوي مزدوج وحقيبة غير مبطنة.','<p>جلد إيطالي محبب بالكامل. يمكنه حمل كمبيوتر محمول مقاس 13 بوصة وزجاجة مياه وأدوات يومية. أبازيم معدنية نحاسية تتلون بمرور الوقت.</p>'),('ar',18,'كيس التسوق',NULL,'حقيبة تسوق جلدية على شكل مقبض علوي مزدوج وحقيبة غير مبطنة.','<p>جلد إيطالي محبب بالكامل. يمكنه حمل كمبيوتر محمول مقاس 13 بوصة وزجاجة مياه وأدوات يومية. أبازيم معدنية نحاسية تتلون بمرور الوقت.</p>'),('ar',19,'كيس التسوق',NULL,'حقيبة تسوق جلدية على شكل مقبض علوي مزدوج وحقيبة غير مبطنة.','<p>جلد إيطالي محبب بالكامل. يمكنه حمل كمبيوتر محمول مقاس 13 بوصة وزجاجة مياه وأدوات يومية. أبازيم معدنية نحاسية تتلون بمرور الوقت.</p>'),('ar',20,'محفظة منقوشة',NULL,'محفظة جلدية ثنائية الطي مع نقش مونوغرام منقوش رقيق، وستة أقسام للبطاقات وقسم واحد للعملات المعدنية.','<p>جلد نباتي. بطانة مضادة للسرقة RFID. حواف مرسومة يدويًا ونقاط ضغط معززة.</p>'),('ar',21,'الياقة المدورة متماسكة',NULL,'سترة بياقة مدورة من ميرينو منسوجة بسلاسة مع مقاس مريح وحاشية مضلعة.','<p> صوف ميرينو فائق النعومة، يمكن غسله في الغسالة في وضع الصوف. متوفر باللون البني الإسبريسو والشوفان والرمادي العاصفة.</p>'),('ar',22,'الياقة المدورة متماسكة',NULL,'سترة بياقة مدورة من ميرينو منسوجة بسلاسة مع مقاس مريح وحاشية مضلعة.','<p> صوف ميرينو فائق النعومة، يمكن غسله في الغسالة في وضع الصوف. متوفر باللون البني الإسبريسو والشوفان والرمادي العاصفة.</p>'),('ar',23,'الياقة المدورة متماسكة',NULL,'سترة بياقة مدورة من ميرينو منسوجة بسلاسة مع مقاس مريح وحاشية مضلعة.','<p> صوف ميرينو فائق النعومة، يمكن غسله في الغسالة في وضع الصوف. متوفر باللون البني الإسبريسو والشوفان والرمادي العاصفة.</p>'),('ar',24,'الياقة المدورة متماسكة',NULL,'سترة بياقة مدورة من ميرينو منسوجة بسلاسة مع مقاس مريح وحاشية مضلعة.','<p> صوف ميرينو فائق النعومة، يمكن غسله في الغسالة في وضع الصوف. متوفر باللون البني الإسبريسو والشوفان والرمادي العاصفة.</p>'),('ar',25,'أحذية جلدية',NULL,'حذاء منخفض بمقدمة مدببة متوسطة على كعب كتلة متعدد الطبقات مع سحاب جانبي.','<p> جسم من جلد العجل الناعم، ونعل داخلي من الجلد ونعل مطاطي Vibram مضاد للانزلاق. تم تشطيبه يدويًا في البرتغال.</p>'),('ar',26,'أحذية جلدية',NULL,'حذاء منخفض بمقدمة مدببة متوسطة على كعب كتلة متعدد الطبقات مع سحاب جانبي.','<p> جسم من جلد العجل الناعم، ونعل داخلي من الجلد ونعل مطاطي Vibram مضاد للانزلاق. تم تشطيبه يدويًا في البرتغال.</p>'),('ar',27,'أحذية جلدية',NULL,'حذاء منخفض بمقدمة مدببة متوسطة على كعب كتلة متعدد الطبقات مع سحاب جانبي.','<p> جسم من جلد العجل الناعم، ونعل داخلي من الجلد ونعل مطاطي Vibram مضاد للانزلاق. تم تشطيبه يدويًا في البرتغال.</p>'),('ar',28,'وشاح حريري',NULL,'وشاح حريري ملفوف يدويًا بزخارف نباتية مطبوعة.','<p>تويل حرير 90×90 سم. مطبوعة آليًا باستخدام صبغات منخفضة التأثير. يأتي مع كيس ورقي معاد تدويره كهدية.</p>'),('ar',29,'وشاح حريري',NULL,'وشاح حريري ملفوف يدويًا بزخارف نباتية مطبوعة.','<p>تويل حرير 90×90 سم. مطبوعة آليًا باستخدام صبغات منخفضة التأثير. يأتي مع كيس ورقي معاد تدويره كهدية.</p>'),('ar',30,'معطف من الصوف',NULL,'معطف من الصوف بصفي أزرار وطية صدر مدببة وجيوب بأهداب.','<p>80% صوف، 20% كشمير. بطانة كوبرو. يتناسب المقاس بشكل مريح مع الأكتاف مع مساحة لارتداء بطانة داخلية.</p>'),('ar',31,'حقيبة كروس صغيرة',NULL,'حقيبة كروس صغيرة من الجلد مزودة بحزام سلسلة وإبزيم معدني ذهبي اللون.','<p>يمكنه حمل الهاتف والبطاقات وأحمر الشفاه. يمكن تعديل الحزام من 22 إلى 24 بوصة. حفر بطانة من نسيج القطن.</p>'),('ar',32,'حقيبة كروس صغيرة',NULL,'حقيبة كروس صغيرة من الجلد مزودة بحزام سلسلة وإبزيم معدني ذهبي اللون.','<p>يمكنه حمل الهاتف والبطاقات وأحمر الشفاه. يمكن تعديل الحزام من 22 إلى 24 بوصة. حفر بطانة من نسيج القطن.</p>'),('fr',1,'T-shirt en coton',NULL,'T-shirt en coton brossé doux avec une coupe décontractée et une encolure renforcée.','<p>100% coton biologique, prélavé pour un toucher doux comme s\'il avait été porté longtemps. Disponible en noir, ivoire et gris ardoise. Teindre le produit fini avec des colorants à faible impact.</p>'),('fr',2,'Sac à provisions',NULL,'Sac shopping en cuir façonné avec double poignée supérieure et sac non doublé.','<p>Cuir italien pleine fleur. Peut contenir un ordinateur portable de 13 pouces, une bouteille d\'eau et des objets du quotidien. Les boucles métalliques en laiton se colorent avec le temps.</p>'),('fr',3,'Portefeuille en relief',NULL,'Portefeuille en cuir à deux volets avec délicat motif monogramme en relief, six compartiments pour cartes et un compartiment pour la monnaie.','<p>Cuir végétal. Doublure antivol RFID. Bords peints à la main et points de pression renforcés.</p>'),('fr',4,'Tricot à col roulé',NULL,'Pull à col roulé en mérinos tissé lisse avec une coupe décontractée et un ourlet côtelé.','<p>Laine mérinos super fine, lavable en machine en mode laine. Disponible en brun expresso, avoine et gris tempête.</p>'),('fr',5,'Sac à bandoulière',NULL,'Sac bandoulière souple en cuir fleur avec fermeture magnétique.','<p>Sangle réglable avec deux façons de le porter. Compartiment interne à fermeture éclair et deux compartiments supplémentaires. Fabriqué en Espagne.</p>'),('fr',6,'Bottes en cuir',NULL,'Bottines basses à bout pointu de taille moyenne sur un talon bloc étagé avec fermeture éclair latérale.','<p>Corps en cuir de veau lisse, semelle intérieure en cuir et semelle antidérapante en caoutchouc Vibram. Fini à la main au Portugal.</p>'),('fr',7,'Foulard en soie',NULL,'Foulard en soie roulé à la main avec motifs botaniques imprimés.','<p>Sergé de soie 90x90cm. Imprimé à la machine avec des colorants à faible impact. Livré avec un sac en papier recyclé en cadeau.</p>'),('fr',8,'Manteau en laine',NULL,'Manteau en laine à double boutonnage avec revers crantés et poches à franges.','<p>80% laine, 20% cachemire. Doublure en cupro. La coupe s\'ajuste parfaitement aux épaules avec de la place pour porter une doublure intérieure.</p>'),('fr',9,'Veste en jean',NULL,'Veste en jean de style camionneur classique en bleu brut vintage.','<p>Denim japonais 14oz. Coutures en lisière. S\'adoucit progressivement avec le temps et s\'estompe naturellement.</p>'),('fr',10,'Collier de perles',NULL,'Collier de perles d\'eau douce avec fermoir plaqué or 14 carats et longueur de 18 pouces.','<p>Faites un nœud à la main entre chaque perle. Perles taille moyenne 7-8mm. Livré avec une pochette en velours et une carte d\'instructions d\'entretien.</p>'),('fr',11,'Mini bandoulière',NULL,'Petit sac bandoulière en cuir avec bandoulière chaîne et boucle en métal doré.','<p>Peut contenir un téléphone, des cartes et du rouge à lèvres. La sangle s\'ajuste de 22 à 24 pouces. Doublure en tissu de coton Drill.</p>'),('fr',12,'Cardigan en Cachemire',NULL,'Cardigan ouvert en cachemire avec épaules tombantes et coupe décontractée.','<p>100% cachemire mongol. Deux poches couvertes. À porter sur un t-shirt ou sous une veste selon la saison.</p>'),('fr',13,'T-shirt en coton',NULL,'T-shirt en coton brossé doux avec une coupe décontractée et une encolure renforcée.','<p>100% coton biologique, prélavé pour un toucher doux comme s\'il avait été porté longtemps. Disponible en noir, ivoire et gris ardoise. Teindre le produit fini avec des colorants à faible impact.</p>'),('fr',14,'T-shirt en coton',NULL,'T-shirt en coton brossé doux avec une coupe décontractée et une encolure renforcée.','<p>100% coton biologique, prélavé pour un toucher doux comme s\'il avait été porté longtemps. Disponible en noir, ivoire et gris ardoise. Teindre le produit fini avec des colorants à faible impact.</p>'),('fr',15,'Sac à provisions',NULL,'Sac shopping en cuir façonné avec double poignée supérieure et sac non doublé.','<p>Cuir italien pleine fleur. Peut contenir un ordinateur portable de 13 pouces, une bouteille d\'eau et des objets du quotidien. Les boucles métalliques en laiton se colorent avec le temps.</p>'),('fr',16,'Sac à provisions',NULL,'Sac shopping en cuir façonné avec double poignée supérieure et sac non doublé.','<p>Cuir italien pleine fleur. Peut contenir un ordinateur portable de 13 pouces, une bouteille d\'eau et des objets du quotidien. Les boucles métalliques en laiton se colorent avec le temps.</p>'),('fr',17,'Sac à provisions',NULL,'Sac shopping en cuir façonné avec double poignée supérieure et sac non doublé.','<p>Cuir italien pleine fleur. Peut contenir un ordinateur portable de 13 pouces, une bouteille d\'eau et des objets du quotidien. Les boucles métalliques en laiton se colorent avec le temps.</p>'),('fr',18,'Sac à provisions',NULL,'Sac shopping en cuir façonné avec double poignée supérieure et sac non doublé.','<p>Cuir italien pleine fleur. Peut contenir un ordinateur portable de 13 pouces, une bouteille d\'eau et des objets du quotidien. Les boucles métalliques en laiton se colorent avec le temps.</p>'),('fr',19,'Sac à provisions',NULL,'Sac shopping en cuir façonné avec double poignée supérieure et sac non doublé.','<p>Cuir italien pleine fleur. Peut contenir un ordinateur portable de 13 pouces, une bouteille d\'eau et des objets du quotidien. Les boucles métalliques en laiton se colorent avec le temps.</p>'),('fr',20,'Portefeuille en relief',NULL,'Portefeuille en cuir à deux volets avec délicat motif monogramme en relief, six compartiments pour cartes et un compartiment pour la monnaie.','<p>Cuir végétal. Doublure antivol RFID. Bords peints à la main et points de pression renforcés.</p>'),('fr',21,'Tricot à col roulé',NULL,'Pull à col roulé en mérinos tissé lisse avec une coupe décontractée et un ourlet côtelé.','<p>Laine mérinos super fine, lavable en machine en mode laine. Disponible en brun expresso, avoine et gris tempête.</p>'),('fr',22,'Tricot à col roulé',NULL,'Pull à col roulé en mérinos tissé lisse avec une coupe décontractée et un ourlet côtelé.','<p>Laine mérinos super fine, lavable en machine en mode laine. Disponible en brun expresso, avoine et gris tempête.</p>'),('fr',23,'Tricot à col roulé',NULL,'Pull à col roulé en mérinos tissé lisse avec une coupe décontractée et un ourlet côtelé.','<p>Laine mérinos super fine, lavable en machine en mode laine. Disponible en brun expresso, avoine et gris tempête.</p>'),('fr',24,'Tricot à col roulé',NULL,'Pull à col roulé en mérinos tissé lisse avec une coupe décontractée et un ourlet côtelé.','<p>Laine mérinos super fine, lavable en machine en mode laine. Disponible en brun expresso, avoine et gris tempête.</p>'),('fr',25,'Bottes en cuir',NULL,'Bottines basses à bout pointu de taille moyenne sur un talon bloc étagé avec fermeture éclair latérale.','<p>Corps en cuir de veau lisse, semelle intérieure en cuir et semelle antidérapante en caoutchouc Vibram. Fini à la main au Portugal.</p>'),('fr',26,'Bottes en cuir',NULL,'Bottines basses à bout pointu de taille moyenne sur un talon bloc étagé avec fermeture éclair latérale.','<p>Corps en cuir de veau lisse, semelle intérieure en cuir et semelle antidérapante en caoutchouc Vibram. Fini à la main au Portugal.</p>'),('fr',27,'Bottes en cuir',NULL,'Bottines basses à bout pointu de taille moyenne sur un talon bloc étagé avec fermeture éclair latérale.','<p>Corps en cuir de veau lisse, semelle intérieure en cuir et semelle antidérapante en caoutchouc Vibram. Fini à la main au Portugal.</p>'),('fr',28,'Foulard en soie',NULL,'Foulard en soie roulé à la main avec motifs botaniques imprimés.','<p>Sergé de soie 90x90cm. Imprimé à la machine avec des colorants à faible impact. Livré avec un sac en papier recyclé en cadeau.</p>'),('fr',29,'Foulard en soie',NULL,'Foulard en soie roulé à la main avec motifs botaniques imprimés.','<p>Sergé de soie 90x90cm. Imprimé à la machine avec des colorants à faible impact. Livré avec un sac en papier recyclé en cadeau.</p>'),('fr',30,'Manteau en laine',NULL,'Manteau en laine à double boutonnage avec revers crantés et poches à franges.','<p>80% laine, 20% cachemire. Doublure en cupro. La coupe s\'ajuste parfaitement aux épaules avec de la place pour porter une doublure intérieure.</p>'),('fr',31,'Mini bandoulière',NULL,'Petit sac bandoulière en cuir avec bandoulière chaîne et boucle en métal doré.','<p>Peut contenir un téléphone, des cartes et du rouge à lèvres. La sangle s\'ajuste de 22 à 24 pouces. Doublure en tissu de coton Drill.</p>'),('fr',32,'Mini bandoulière',NULL,'Petit sac bandoulière en cuir avec bandoulière chaîne et boucle en métal doré.','<p>Peut contenir un téléphone, des cartes et du rouge à lèvres. La sangle s\'ajuste de 22 à 24 pouces. Doublure en tissu de coton Drill.</p>'),('id',1,'Kaos Katun',NULL,'T-shirt katun lembut dengan potongan santai dan garis leher yang diperkuat.','<p>100% katun organik, sudah dicuci sebelumnya sehingga terasa lembut seperti dipakai dalam waktu lama. Tersedia dalam warna hitam, gading, dan abu-abu batu. Warnai produk jadi dengan pewarna berdampak rendah.</p>'),('id',2,'Tas Belanja',NULL,'Tas belanja berbahan kulit dengan pegangan double top dan tas tidak bergaris.','<p>Kulit Italia gandum penuh. Dapat menampung laptop 13 inci, botol air, dan barang sehari-hari. Gesper logam kuningan berubah warna seiring waktu.</p>'),('id',3,'Dompet Timbul',NULL,'Dompet kulit lipat dua dengan pola monogram timbul halus, enam kompartemen kartu, dan satu kompartemen koin.','<p>Kulit sayur. Lapisan anti maling RFID. Tepi yang dilukis dengan tangan dan titik tekanan yang diperkuat.</p>'),('id',4,'Rajutan Turtleneck',NULL,'Sweater turtleneck merino tenun halus dengan potongan santai dan kelim bergaris.','<p>Wol merino super halus, dapat dicuci dengan mesin dalam mode wol. Tersedia dalam warna espresso brown, oatmeal, dan storm grey.</p>'),('id',5,'Tas Bahu',NULL,'Tas bahu berdraping lembut dari kulit gandum dengan penutup magnet.','<p>Tali yang dapat disesuaikan dengan dua cara pemakaian. Kompartemen ritsleting internal dan dua kompartemen tambahan. Buatan Spanyol.</p>'),('id',6,'Sepatu Bot Kulit',NULL,'Sepatu bot rendah ujung lancip sedang dengan tumit blok berjenjang dengan ritsleting samping.','<p>Bodi kulit anak sapi halus, sol dalam kulit, dan sol karet Vibram anti selip. Selesai dengan tangan di Portugal.</p>'),('id',7,'Syal Sutra',NULL,'Syal sutra linting tangan dengan motif botani yang dicetak.','<p>Kepar sutra 90x90cm. Dicetak dengan mesin dengan pewarna berdampak rendah. Dilengkapi dengan kantong kertas daur ulang sebagai hadiah.</p>'),('id',8,'Mantel Wol',NULL,'Mantel wol model double-breasted dengan kerah berlekuk dan saku di pinggiran.','<p>80% wol, 20% kasmir. lapisan cupro. Ukurannya pas di bahu dengan ruang untuk memakai lapisan dalam.</p>'),('id',9,'Jaket Denim',NULL,'Jaket denim gaya pengemudi truk klasik dengan warna biru mentah vintage.','<p>Denim Jepang 14oz. Jahitan di selvedge. Secara bertahap melunak seiring waktu dan memudar secara alami.</p>'),('id',10,'Kalung Mutiara',NULL,'Kalung mutiara air tawar dengan gesper berlapis emas 14 karat dan panjang 18 inci.','<p>Ikat tangan dengan simpul di antara masing-masing mutiara. Mutiara berukuran rata-rata 7-8mm. Dilengkapi dengan tas beludru dan kartu petunjuk perawatan.</p>'),('id',11,'Selempang Mini',NULL,'Tas selempang kulit kecil dengan tali rantai dan gesper logam berwarna emas.','<p>Dapat menampung ponsel, kartu, dan lipstik. Tali menyesuaikan dari 22 hingga 24 inci. Lapisan kain katun bor.</p>'),('id',12,'Kardigan Kasmir',NULL,'Kardigan kasmir bagian depan terbuka dengan bahu menurun dan model pas santai.','<p>100% kasmir Mongolia. Dua kantong penutup. Kenakan di atas kaos atau di bawah jaket untuk cuaca musiman.</p>'),('id',13,'Kaos Katun',NULL,'T-shirt katun lembut dengan potongan santai dan garis leher yang diperkuat.','<p>100% katun organik, sudah dicuci sebelumnya sehingga terasa lembut seperti dipakai dalam waktu lama. Tersedia dalam warna hitam, gading, dan abu-abu batu. Warnai produk jadi dengan pewarna berdampak rendah.</p>'),('id',14,'Kaos Katun',NULL,'T-shirt katun lembut dengan potongan santai dan garis leher yang diperkuat.','<p>100% katun organik, sudah dicuci sebelumnya sehingga terasa lembut seperti dipakai dalam waktu lama. Tersedia dalam warna hitam, gading, dan abu-abu batu. Warnai produk jadi dengan pewarna berdampak rendah.</p>'),('id',15,'Tas Belanja',NULL,'Tas belanja berbahan kulit dengan pegangan double top dan tas tidak bergaris.','<p>Kulit Italia gandum penuh. Dapat menampung laptop 13 inci, botol air, dan barang sehari-hari. Gesper logam kuningan berubah warna seiring waktu.</p>'),('id',16,'Tas Belanja',NULL,'Tas belanja berbahan kulit dengan pegangan double top dan tas tidak bergaris.','<p>Kulit Italia gandum penuh. Dapat menampung laptop 13 inci, botol air, dan barang sehari-hari. Gesper logam kuningan berubah warna seiring waktu.</p>'),('id',17,'Tas Belanja',NULL,'Tas belanja berbahan kulit dengan pegangan double top dan tas tidak bergaris.','<p>Kulit Italia gandum penuh. Dapat menampung laptop 13 inci, botol air, dan barang sehari-hari. Gesper logam kuningan berubah warna seiring waktu.</p>'),('id',18,'Tas Belanja',NULL,'Tas belanja berbahan kulit dengan pegangan double top dan tas tidak bergaris.','<p>Kulit Italia gandum penuh. Dapat menampung laptop 13 inci, botol air, dan barang sehari-hari. Gesper logam kuningan berubah warna seiring waktu.</p>'),('id',19,'Tas Belanja',NULL,'Tas belanja berbahan kulit dengan pegangan double top dan tas tidak bergaris.','<p>Kulit Italia gandum penuh. Dapat menampung laptop 13 inci, botol air, dan barang sehari-hari. Gesper logam kuningan berubah warna seiring waktu.</p>'),('id',20,'Dompet Timbul',NULL,'Dompet kulit lipat dua dengan pola monogram timbul halus, enam kompartemen kartu, dan satu kompartemen koin.','<p>Kulit sayur. Lapisan anti maling RFID. Tepi yang dilukis dengan tangan dan titik tekanan yang diperkuat.</p>'),('id',21,'Rajutan Turtleneck',NULL,'Sweater turtleneck merino tenun halus dengan potongan santai dan kelim bergaris.','<p>Wol merino super halus, dapat dicuci dengan mesin dalam mode wol. Tersedia dalam warna espresso brown, oatmeal, dan storm grey.</p>'),('id',22,'Rajutan Turtleneck',NULL,'Sweater turtleneck merino tenun halus dengan potongan santai dan kelim bergaris.','<p>Wol merino super halus, dapat dicuci dengan mesin dalam mode wol. Tersedia dalam warna espresso brown, oatmeal, dan storm grey.</p>'),('id',23,'Rajutan Turtleneck',NULL,'Sweater turtleneck merino tenun halus dengan potongan santai dan kelim bergaris.','<p>Wol merino super halus, dapat dicuci dengan mesin dalam mode wol. Tersedia dalam warna espresso brown, oatmeal, dan storm grey.</p>'),('id',24,'Rajutan Turtleneck',NULL,'Sweater turtleneck merino tenun halus dengan potongan santai dan kelim bergaris.','<p>Wol merino super halus, dapat dicuci dengan mesin dalam mode wol. Tersedia dalam warna espresso brown, oatmeal, dan storm grey.</p>'),('id',25,'Sepatu Bot Kulit',NULL,'Sepatu bot rendah ujung lancip sedang dengan tumit blok berjenjang dengan ritsleting samping.','<p>Bodi kulit anak sapi halus, sol dalam kulit, dan sol karet Vibram anti selip. Selesai dengan tangan di Portugal.</p>'),('id',26,'Sepatu Bot Kulit',NULL,'Sepatu bot rendah ujung lancip sedang dengan tumit blok berjenjang dengan ritsleting samping.','<p>Bodi kulit anak sapi halus, sol dalam kulit, dan sol karet Vibram anti selip. Selesai dengan tangan di Portugal.</p>'),('id',27,'Sepatu Bot Kulit',NULL,'Sepatu bot rendah ujung lancip sedang dengan tumit blok berjenjang dengan ritsleting samping.','<p>Bodi kulit anak sapi halus, sol dalam kulit, dan sol karet Vibram anti selip. Selesai dengan tangan di Portugal.</p>'),('id',28,'Syal Sutra',NULL,'Syal sutra linting tangan dengan motif botani yang dicetak.','<p>Kepar sutra 90x90cm. Dicetak dengan mesin dengan pewarna berdampak rendah. Dilengkapi dengan kantong kertas daur ulang sebagai hadiah.</p>'),('id',29,'Syal Sutra',NULL,'Syal sutra linting tangan dengan motif botani yang dicetak.','<p>Kepar sutra 90x90cm. Dicetak dengan mesin dengan pewarna berdampak rendah. Dilengkapi dengan kantong kertas daur ulang sebagai hadiah.</p>'),('id',30,'Mantel Wol',NULL,'Mantel wol model double-breasted dengan kerah berlekuk dan saku di pinggiran.','<p>80% wol, 20% kasmir. lapisan cupro. Ukurannya pas di bahu dengan ruang untuk memakai lapisan dalam.</p>'),('id',31,'Selempang Mini',NULL,'Tas selempang kulit kecil dengan tali rantai dan gesper logam berwarna emas.','<p>Dapat menampung ponsel, kartu, dan lipstik. Tali menyesuaikan dari 22 hingga 24 inci. Lapisan kain katun bor.</p>'),('id',32,'Selempang Mini',NULL,'Tas selempang kulit kecil dengan tali rantai dan gesper logam berwarna emas.','<p>Dapat menampung ponsel, kartu, dan lipstik. Tali menyesuaikan dari 22 hingga 24 inci. Lapisan kain katun bor.</p>'),('tr',1,'Pamuklu Tişört',NULL,'Rahat kesimli, güçlendirilmiş yakalı, yumuşak fırçalanmış pamuklu tişört.','<p>%100 organik pamuk, uzun süre giyilmiş gibi yumuşak bir his için önceden yıkanmış. Siyah, fildişi ve barut grisi renkleri mevcuttur. Bitmiş ürünü düşük etkili boyalarla boyayın.</p>'),('tr',2,'Alışveriş Çantası',NULL,'Üstten çift saplı, astarsız, şekilli deri alışveriş çantası.','<p>Tam sırçalı İtalyan derisi. 13 inçlik bir dizüstü bilgisayar, su şişesi ve günlük eşyaları barındırabilir. Pirinç metal tokalar zamanla renklenir.</p>'),('tr',3,'Kabartmalı Cüzdan',NULL,'Narin kabartmalı monogram desenli, altı kart bölmeli ve bir bozuk para bölmeli, ikiye katlanmış deri cüzdan.','<p>Bitkisel deri. RFID hırsızlığa karşı astar. Elle boyanmış kenarlar ve güçlendirilmiş baskı noktaları.</p>'),('tr',4,'Balıkçı Yaka Örgü',NULL,'Rahat kesimli, etek kısmı ribanalı, pürüzsüz dokuma merinos balıkçı yaka kazak.','<p>Süper ince merinos yünü, yün modunda makinede yıkanabilir. Espresso kahvesi, yulaf ezmesi ve fırtına grisi renkleri mevcuttur.</p>'),('tr',5,'Omuz çantası',NULL,'Sırça deriden, mıknatıs kapamalı, yumuşak dökümlü omuz çantası.','<p>İki şekilde takılabilen ayarlanabilir askı. İç fermuarlı bölme ve iki ek bölme. İspanya\'da üretilmiştir.</p>'),('tr',6,'Deri Çizme',NULL,'Yandan fermuarlı, katlı blok topuklu, orta sivri burunlu alçak bot.','<p>Pürüzsüz dana derisi gövde, deri iç taban ve kaymaz Vibram kauçuk taban. Portekiz\'de elle tamamlandı.</p>'),('tr',7,'İpek Eşarp',NULL,'Baskılı botanik motifli, elle kıvrılmış ipek eşarp.','<p>İpek dimi 90x90cm. Düşük etkili boyalarla makinede basılmıştır. Hediye olarak geri dönüştürülmüş kağıt torbayla birlikte gelir.</p>'),('tr',8,'Yün Ceket',NULL,'Yakası çentikli, püsküllü cepli kruvaze yün kaban.','<p>%80 yün, %20 kaşmir. Cupro astarı. Kesim omuzlara tam oturur ve iç astar giymek için yer sağlar.</p>'),('tr',9,'Kot Ceket',NULL,'Vintage ham mavi renkte klasik kamyon şoförü tarzı denim ceket.','<p>Japon kotu 14oz. Kenardaki dikişler. Zamanla yavaş yavaş yumuşar ve doğal olarak solar.</p>'),('tr',10,'İnci Kolye',NULL,'14 ayar altın kaplama tokalı ve 18 inç uzunluğunda tatlı su incisi kolye.','<p>Her incinin arasına elle bir düğüm atın. İncilerin ortalama boyutu 7-8 mm\'dir. Kadife çanta ve bakım talimatları kartıyla birlikte gelir.</p>'),('tr',11,'Mini Çapraz Askı',NULL,'Zincir askılı, altın rengi metal tokalı küçük deri çapraz askılı çanta.','<p>Telefonu, kartları ve ruju tutabilir. Kayış 22 ila 24 inç arasında ayarlanır. Pamuklu kumaş astarı delin.</p>'),('tr',12,'Kaşmir Hırka',NULL,'Düşük omuzlu, rahat kesimli, önü açık kaşmir hırka.','<p>100% Moğol kaşmiri. İki kapak cepli. Mevsim şartlarına göre tişörtün üzerine veya ceketin altına giyin.</p>'),('tr',13,'Pamuklu Tişört',NULL,'Rahat kesimli, güçlendirilmiş yakalı, yumuşak fırçalanmış pamuklu tişört.','<p>%100 organik pamuk, uzun süre giyilmiş gibi yumuşak bir his için önceden yıkanmış. Siyah, fildişi ve barut grisi renkleri mevcuttur. Bitmiş ürünü düşük etkili boyalarla boyayın.</p>'),('tr',14,'Pamuklu Tişört',NULL,'Rahat kesimli, güçlendirilmiş yakalı, yumuşak fırçalanmış pamuklu tişört.','<p>%100 organik pamuk, uzun süre giyilmiş gibi yumuşak bir his için önceden yıkanmış. Siyah, fildişi ve barut grisi renkleri mevcuttur. Bitmiş ürünü düşük etkili boyalarla boyayın.</p>'),('tr',15,'Alışveriş Çantası',NULL,'Üstten çift saplı, astarsız, şekilli deri alışveriş çantası.','<p>Tam sırçalı İtalyan derisi. 13 inçlik bir dizüstü bilgisayar, su şişesi ve günlük eşyaları barındırabilir. Pirinç metal tokalar zamanla renklenir.</p>'),('tr',16,'Alışveriş Çantası',NULL,'Üstten çift saplı, astarsız, şekilli deri alışveriş çantası.','<p>Tam sırçalı İtalyan derisi. 13 inçlik bir dizüstü bilgisayar, su şişesi ve günlük eşyaları barındırabilir. Pirinç metal tokalar zamanla renklenir.</p>'),('tr',17,'Alışveriş Çantası',NULL,'Üstten çift saplı, astarsız, şekilli deri alışveriş çantası.','<p>Tam sırçalı İtalyan derisi. 13 inçlik bir dizüstü bilgisayar, su şişesi ve günlük eşyaları barındırabilir. Pirinç metal tokalar zamanla renklenir.</p>'),('tr',18,'Alışveriş Çantası',NULL,'Üstten çift saplı, astarsız, şekilli deri alışveriş çantası.','<p>Tam sırçalı İtalyan derisi. 13 inçlik bir dizüstü bilgisayar, su şişesi ve günlük eşyaları barındırabilir. Pirinç metal tokalar zamanla renklenir.</p>'),('tr',19,'Alışveriş Çantası',NULL,'Üstten çift saplı, astarsız, şekilli deri alışveriş çantası.','<p>Tam sırçalı İtalyan derisi. 13 inçlik bir dizüstü bilgisayar, su şişesi ve günlük eşyaları barındırabilir. Pirinç metal tokalar zamanla renklenir.</p>'),('tr',20,'Kabartmalı Cüzdan',NULL,'Narin kabartmalı monogram desenli, altı kart bölmeli ve bir bozuk para bölmeli, ikiye katlanmış deri cüzdan.','<p>Bitkisel deri. RFID hırsızlığa karşı astar. Elle boyanmış kenarlar ve güçlendirilmiş baskı noktaları.</p>'),('tr',21,'Balıkçı Yaka Örgü',NULL,'Rahat kesimli, etek kısmı ribanalı, pürüzsüz dokuma merinos balıkçı yaka kazak.','<p>Süper ince merinos yünü, yün modunda makinede yıkanabilir. Espresso kahvesi, yulaf ezmesi ve fırtına grisi renkleri mevcuttur.</p>'),('tr',22,'Balıkçı Yaka Örgü',NULL,'Rahat kesimli, etek kısmı ribanalı, pürüzsüz dokuma merinos balıkçı yaka kazak.','<p>Süper ince merinos yünü, yün modunda makinede yıkanabilir. Espresso kahvesi, yulaf ezmesi ve fırtına grisi renkleri mevcuttur.</p>'),('tr',23,'Balıkçı Yaka Örgü',NULL,'Rahat kesimli, etek kısmı ribanalı, pürüzsüz dokuma merinos balıkçı yaka kazak.','<p>Süper ince merinos yünü, yün modunda makinede yıkanabilir. Espresso kahvesi, yulaf ezmesi ve fırtına grisi renkleri mevcuttur.</p>'),('tr',24,'Balıkçı Yaka Örgü',NULL,'Rahat kesimli, etek kısmı ribanalı, pürüzsüz dokuma merinos balıkçı yaka kazak.','<p>Süper ince merinos yünü, yün modunda makinede yıkanabilir. Espresso kahvesi, yulaf ezmesi ve fırtına grisi renkleri mevcuttur.</p>'),('tr',25,'Deri Çizme',NULL,'Yandan fermuarlı, katlı blok topuklu, orta sivri burunlu alçak bot.','<p>Pürüzsüz dana derisi gövde, deri iç taban ve kaymaz Vibram kauçuk taban. Portekiz\'de elle tamamlandı.</p>'),('tr',26,'Deri Çizme',NULL,'Yandan fermuarlı, katlı blok topuklu, orta sivri burunlu alçak bot.','<p>Pürüzsüz dana derisi gövde, deri iç taban ve kaymaz Vibram kauçuk taban. Portekiz\'de elle tamamlandı.</p>'),('tr',27,'Deri Çizme',NULL,'Yandan fermuarlı, katlı blok topuklu, orta sivri burunlu alçak bot.','<p>Pürüzsüz dana derisi gövde, deri iç taban ve kaymaz Vibram kauçuk taban. Portekiz\'de elle tamamlandı.</p>'),('tr',28,'İpek Eşarp',NULL,'Baskılı botanik motifli, elle kıvrılmış ipek eşarp.','<p>İpek dimi 90x90cm. Düşük etkili boyalarla makinede basılmıştır. Hediye olarak geri dönüştürülmüş kağıt torbayla birlikte gelir.</p>'),('tr',29,'İpek Eşarp',NULL,'Baskılı botanik motifli, elle kıvrılmış ipek eşarp.','<p>İpek dimi 90x90cm. Düşük etkili boyalarla makinede basılmıştır. Hediye olarak geri dönüştürülmüş kağıt torbayla birlikte gelir.</p>'),('tr',30,'Yün Ceket',NULL,'Yakası çentikli, püsküllü cepli kruvaze yün kaban.','<p>%80 yün, %20 kaşmir. Cupro astarı. Kesim omuzlara tam oturur ve iç astar giymek için yer sağlar.</p>'),('tr',31,'Mini Çapraz Askı',NULL,'Zincir askılı, altın rengi metal tokalı küçük deri çapraz askılı çanta.','<p>Telefonu, kartları ve ruju tutabilir. Kayış 22 ila 24 inç arasında ayarlanır. Pamuklu kumaş astarı delin.</p>'),('tr',32,'Mini Çapraz Askı',NULL,'Zincir askılı, altın rengi metal tokalı küçük deri çapraz askılı çanta.','<p>Telefonu, kartları ve ruju tutabilir. Kayış 22 ila 24 inç arasında ayarlanır. Pamuklu kumaş astarı delin.</p>'),('vi',1,'Áo Thun Cotton',NULL,'Áo thun cotton chải mềm mại với phom dáng thoải mái và viền cổ gia cố.','<p>100% cotton hữu cơ, giặt sẵn cho cảm giác mềm mại như đã mặc lâu. Có các màu đen, ngà và xám đá. Nhuộm thành phẩm bằng thuốc nhuộm ít tác động.</p>'),('vi',2,'Túi Mua Sắm',NULL,'Túi mua sắm da định hình với quai cầm đôi trên đỉnh và lòng túi không lót.','<p>Da Ý nguyên tấm. Đựng được laptop 13 inch, bình nước và vật dụng hằng ngày. Khóa kim loại đồng thau lên màu theo thời gian.</p>'),('vi',3,'Ví Dập Nổi',NULL,'Ví da gập đôi với họa tiết monogram dập nổi tinh tế, sáu ngăn đựng thẻ và một ngăn đựng tiền xu.','<p>Da thuộc thực vật. Lớp lót chống đọc trộm RFID. Cạnh sơn thủ công và các điểm chịu lực được may gia cố.</p>'),('vi',4,'Áo Len Cổ Lọ',NULL,'Áo len cổ lọ merino dệt mịn với phom dáng thoải mái và viền bo gân.','<p>Len merino siêu mịn, giặt máy được ở chế độ len. Có các màu nâu espresso, màu yến mạch và xám bão.</p>'),('vi',5,'Túi Đeo Vai',NULL,'Túi đeo vai mềm rủ bằng da hột với khóa nam châm.','<p>Dây đeo điều chỉnh được với hai cách đeo. Ngăn khóa kéo bên trong và hai ngăn phụ. Sản xuất tại Tây Ban Nha.</p>'),('vi',6,'Bốt Da',NULL,'Bốt cổ thấp mũi nhọn vừa trên đế gót vuông xếp tầng với khóa kéo bên hông.','<p>Thân da bê mịn, lót đế da và đế cao su Vibram chống trơn trượt. Hoàn thiện thủ công tại Bồ Đào Nha.</p>'),('vi',7,'Khăn Lụa',NULL,'Khăn lụa tơ tằm viền cuốn tay với họa tiết thực vật in.','<p>Lụa twill 90x90cm. In máy bằng thuốc nhuộm ít tác động. Kèm theo bao giấy tái chế làm quà tặng.</p>'),('vi',8,'Áo Khoác Len',NULL,'Áo khoác len hai hàng khuy với ve áo khía và túi viền.','<p>80% len, 20% cashmere. Lớp lót cupro. Phom may ôm vừa ở vai với khoảng rộng để mặc lớp lót bên trong.</p>'),('vi',9,'Áo Khoác Denim',NULL,'Áo khoác denim kiểu trucker cổ điển với màu xanh thô vintage.','<p>Denim Nhật 14oz. Đường may trong selvedge. Mềm dần theo thời gian mặc và phai màu tự nhiên.</p>'),('vi',10,'Vòng Cổ Ngọc Trai',NULL,'Vòng cổ ngọc trai nước ngọt với khóa mạ vàng 14k và độ dài 18 inch.','<p>Thắt nút thủ công giữa mỗi viên ngọc. Ngọc trai kích thước trung bình 7-8mm. Đi kèm túi nhung và thẻ hướng dẫn bảo quản.</p>'),('vi',11,'Túi Đeo Chéo Mini',NULL,'Túi đeo chéo da nhỏ với dây đeo xích và khóa kim loại tông vàng.','<p>Đựng được điện thoại, thẻ và son. Dây đeo điều chỉnh từ 22 đến 24 inch. Lớp lót vải drill cotton.</p>'),('vi',12,'Áo Cardigan Cashmere',NULL,'Áo cardigan cashmere mở trước với vai trễ và phom dáng thoải mái.','<p>100% cashmere Mông Cổ. Hai túi ốp. Khoác ngoài áo thun hoặc trong áo khoác cho thời tiết giao mùa.</p>'),('vi',13,'Áo Thun Cotton',NULL,'Áo thun cotton chải mềm mại với phom dáng thoải mái và viền cổ gia cố.','<p>100% cotton hữu cơ, giặt sẵn cho cảm giác mềm mại như đã mặc lâu. Có các màu đen, ngà và xám đá. Nhuộm thành phẩm bằng thuốc nhuộm ít tác động.</p>'),('vi',14,'Áo Thun Cotton',NULL,'Áo thun cotton chải mềm mại với phom dáng thoải mái và viền cổ gia cố.','<p>100% cotton hữu cơ, giặt sẵn cho cảm giác mềm mại như đã mặc lâu. Có các màu đen, ngà và xám đá. Nhuộm thành phẩm bằng thuốc nhuộm ít tác động.</p>'),('vi',15,'Túi Mua Sắm',NULL,'Túi mua sắm da định hình với quai cầm đôi trên đỉnh và lòng túi không lót.','<p>Da Ý nguyên tấm. Đựng được laptop 13 inch, bình nước và vật dụng hằng ngày. Khóa kim loại đồng thau lên màu theo thời gian.</p>'),('vi',16,'Túi Mua Sắm',NULL,'Túi mua sắm da định hình với quai cầm đôi trên đỉnh và lòng túi không lót.','<p>Da Ý nguyên tấm. Đựng được laptop 13 inch, bình nước và vật dụng hằng ngày. Khóa kim loại đồng thau lên màu theo thời gian.</p>'),('vi',17,'Túi Mua Sắm',NULL,'Túi mua sắm da định hình với quai cầm đôi trên đỉnh và lòng túi không lót.','<p>Da Ý nguyên tấm. Đựng được laptop 13 inch, bình nước và vật dụng hằng ngày. Khóa kim loại đồng thau lên màu theo thời gian.</p>'),('vi',18,'Túi Mua Sắm',NULL,'Túi mua sắm da định hình với quai cầm đôi trên đỉnh và lòng túi không lót.','<p>Da Ý nguyên tấm. Đựng được laptop 13 inch, bình nước và vật dụng hằng ngày. Khóa kim loại đồng thau lên màu theo thời gian.</p>'),('vi',19,'Túi Mua Sắm',NULL,'Túi mua sắm da định hình với quai cầm đôi trên đỉnh và lòng túi không lót.','<p>Da Ý nguyên tấm. Đựng được laptop 13 inch, bình nước và vật dụng hằng ngày. Khóa kim loại đồng thau lên màu theo thời gian.</p>'),('vi',20,'Ví Dập Nổi',NULL,'Ví da gập đôi với họa tiết monogram dập nổi tinh tế, sáu ngăn đựng thẻ và một ngăn đựng tiền xu.','<p>Da thuộc thực vật. Lớp lót chống đọc trộm RFID. Cạnh sơn thủ công và các điểm chịu lực được may gia cố.</p>'),('vi',21,'Áo Len Cổ Lọ',NULL,'Áo len cổ lọ merino dệt mịn với phom dáng thoải mái và viền bo gân.','<p>Len merino siêu mịn, giặt máy được ở chế độ len. Có các màu nâu espresso, màu yến mạch và xám bão.</p>'),('vi',22,'Áo Len Cổ Lọ',NULL,'Áo len cổ lọ merino dệt mịn với phom dáng thoải mái và viền bo gân.','<p>Len merino siêu mịn, giặt máy được ở chế độ len. Có các màu nâu espresso, màu yến mạch và xám bão.</p>'),('vi',23,'Áo Len Cổ Lọ',NULL,'Áo len cổ lọ merino dệt mịn với phom dáng thoải mái và viền bo gân.','<p>Len merino siêu mịn, giặt máy được ở chế độ len. Có các màu nâu espresso, màu yến mạch và xám bão.</p>'),('vi',24,'Áo Len Cổ Lọ',NULL,'Áo len cổ lọ merino dệt mịn với phom dáng thoải mái và viền bo gân.','<p>Len merino siêu mịn, giặt máy được ở chế độ len. Có các màu nâu espresso, màu yến mạch và xám bão.</p>'),('vi',25,'Bốt Da',NULL,'Bốt cổ thấp mũi nhọn vừa trên đế gót vuông xếp tầng với khóa kéo bên hông.','<p>Thân da bê mịn, lót đế da và đế cao su Vibram chống trơn trượt. Hoàn thiện thủ công tại Bồ Đào Nha.</p>'),('vi',26,'Bốt Da',NULL,'Bốt cổ thấp mũi nhọn vừa trên đế gót vuông xếp tầng với khóa kéo bên hông.','<p>Thân da bê mịn, lót đế da và đế cao su Vibram chống trơn trượt. Hoàn thiện thủ công tại Bồ Đào Nha.</p>'),('vi',27,'Bốt Da',NULL,'Bốt cổ thấp mũi nhọn vừa trên đế gót vuông xếp tầng với khóa kéo bên hông.','<p>Thân da bê mịn, lót đế da và đế cao su Vibram chống trơn trượt. Hoàn thiện thủ công tại Bồ Đào Nha.</p>'),('vi',28,'Khăn Lụa',NULL,'Khăn lụa tơ tằm viền cuốn tay với họa tiết thực vật in.','<p>Lụa twill 90x90cm. In máy bằng thuốc nhuộm ít tác động. Kèm theo bao giấy tái chế làm quà tặng.</p>'),('vi',29,'Khăn Lụa',NULL,'Khăn lụa tơ tằm viền cuốn tay với họa tiết thực vật in.','<p>Lụa twill 90x90cm. In máy bằng thuốc nhuộm ít tác động. Kèm theo bao giấy tái chế làm quà tặng.</p>'),('vi',30,'Áo Khoác Len',NULL,'Áo khoác len hai hàng khuy với ve áo khía và túi viền.','<p>80% len, 20% cashmere. Lớp lót cupro. Phom may ôm vừa ở vai với khoảng rộng để mặc lớp lót bên trong.</p>'),('vi',31,'Túi Đeo Chéo Mini',NULL,'Túi đeo chéo da nhỏ với dây đeo xích và khóa kim loại tông vàng.','<p>Đựng được điện thoại, thẻ và son. Dây đeo điều chỉnh từ 22 đến 24 inch. Lớp lót vải drill cotton.</p>'),('vi',32,'Túi Đeo Chéo Mini',NULL,'Túi đeo chéo da nhỏ với dây đeo xích và khóa kim loại tông vàng.','<p>Đựng được điện thoại, thẻ và son. Dây đeo điều chỉnh từ 22 đến 24 inch. Lớp lót vải drill cotton.</p>');
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
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_reviews`
--

LOCK TABLES `ec_reviews` WRITE;
/*!40000 ALTER TABLE `ec_reviews` DISABLE KEYS */;
INSERT INTO `ec_reviews` VALUES (1,4,NULL,NULL,3,4,'Clean & perfect source code','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(2,2,NULL,NULL,11,3,'Good app, good backup service and support. Good documentation.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(3,8,NULL,NULL,6,5,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(4,8,NULL,NULL,4,5,'The code is good, in general, if you like it, can you give it 5 stars?','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(5,10,NULL,NULL,6,1,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(6,2,NULL,NULL,7,3,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(7,8,NULL,NULL,7,3,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(8,2,NULL,NULL,10,2,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(9,2,NULL,NULL,1,3,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(10,7,NULL,NULL,9,1,'Clean & perfect source code','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(11,6,NULL,NULL,11,1,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(12,9,NULL,NULL,3,4,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(13,4,NULL,NULL,5,3,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(14,9,NULL,NULL,5,1,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(15,9,NULL,NULL,8,1,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(16,4,NULL,NULL,10,2,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(17,3,NULL,NULL,8,3,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(18,5,NULL,NULL,6,2,'The code is good, in general, if you like it, can you give it 5 stars?','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(19,9,NULL,NULL,11,1,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(20,7,NULL,NULL,10,4,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(21,10,NULL,NULL,10,4,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(22,9,NULL,NULL,1,1,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(23,7,NULL,NULL,7,2,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(24,6,NULL,NULL,3,3,'Great E-commerce system. And much more : Wonderful Customer Support.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(25,2,NULL,NULL,4,4,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(26,9,NULL,NULL,12,3,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(27,3,NULL,NULL,4,3,'Great E-commerce system. And much more : Wonderful Customer Support.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(28,6,NULL,NULL,9,2,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(29,1,NULL,NULL,6,5,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(30,8,NULL,NULL,5,4,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(31,7,NULL,NULL,11,4,'Clean & perfect source code','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(32,1,NULL,NULL,1,5,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(33,10,NULL,NULL,7,4,'The code is good, in general, if you like it, can you give it 5 stars?','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(34,5,NULL,NULL,4,3,'Best ecommerce CMS online store!','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(35,1,NULL,NULL,11,3,'The code is good, in general, if you like it, can you give it 5 stars?','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(36,10,NULL,NULL,4,1,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(37,6,NULL,NULL,2,3,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(38,9,NULL,NULL,4,4,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(39,2,NULL,NULL,5,5,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(40,4,NULL,NULL,9,2,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(41,10,NULL,NULL,1,5,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(42,2,NULL,NULL,2,3,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(43,5,NULL,NULL,11,1,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(44,10,NULL,NULL,9,5,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(45,3,NULL,NULL,2,4,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(46,8,NULL,NULL,8,3,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(47,3,NULL,NULL,9,3,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(48,6,NULL,NULL,10,4,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(49,9,NULL,NULL,6,3,'Great E-commerce system. And much more : Wonderful Customer Support.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(50,10,NULL,NULL,5,2,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(51,7,NULL,NULL,4,4,'Clean & perfect source code','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(52,2,NULL,NULL,8,3,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(53,1,NULL,NULL,8,3,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(54,6,NULL,NULL,6,2,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(55,1,NULL,NULL,9,5,'Clean & perfect source code','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(56,5,NULL,NULL,3,3,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(57,4,NULL,NULL,1,2,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(58,8,NULL,NULL,3,1,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(59,8,NULL,NULL,12,1,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(60,8,NULL,NULL,11,2,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(61,7,NULL,NULL,8,5,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(62,2,NULL,NULL,3,2,'Good app, good backup service and support. Good documentation.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(63,4,NULL,NULL,6,3,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(64,8,NULL,NULL,9,2,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(65,9,NULL,NULL,9,1,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(66,7,NULL,NULL,6,5,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(67,2,NULL,NULL,12,2,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(68,10,NULL,NULL,12,3,'Best ecommerce CMS online store!','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(69,7,NULL,NULL,3,1,'Great E-commerce system. And much more : Wonderful Customer Support.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(70,5,NULL,NULL,1,4,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(71,10,NULL,NULL,11,5,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(72,6,NULL,NULL,8,3,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(73,6,NULL,NULL,7,1,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(74,5,NULL,NULL,7,2,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(75,1,NULL,NULL,4,2,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(76,4,NULL,NULL,8,2,'Great E-commerce system. And much more : Wonderful Customer Support.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(77,10,NULL,NULL,2,3,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(78,1,NULL,NULL,2,5,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(79,4,NULL,NULL,7,3,'Great E-commerce system. And much more : Wonderful Customer Support.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(80,5,NULL,NULL,5,1,'Clean & perfect source code','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(81,5,NULL,NULL,9,1,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(82,8,NULL,NULL,2,1,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(83,1,NULL,NULL,7,4,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(84,1,NULL,NULL,3,5,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(85,10,NULL,NULL,3,1,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(86,3,NULL,NULL,6,1,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(87,4,NULL,NULL,4,2,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(88,9,NULL,NULL,2,3,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(89,5,NULL,NULL,8,1,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(90,3,NULL,NULL,7,4,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(91,7,NULL,NULL,2,5,'Great E-commerce system. And much more : Wonderful Customer Support.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(92,8,NULL,NULL,10,2,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(93,6,NULL,NULL,5,2,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(94,6,NULL,NULL,12,4,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(95,6,NULL,NULL,4,2,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(96,3,NULL,NULL,11,1,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(97,4,NULL,NULL,2,2,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(98,3,NULL,NULL,10,4,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(99,2,NULL,NULL,6,3,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(100,2,NULL,NULL,9,1,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(101,5,NULL,NULL,10,3,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(102,3,NULL,NULL,5,1,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(103,7,NULL,NULL,12,1,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(104,6,NULL,NULL,1,3,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(105,5,NULL,NULL,12,5,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(106,3,NULL,NULL,3,5,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(107,7,NULL,NULL,5,4,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(108,4,NULL,NULL,12,4,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(109,7,NULL,NULL,1,1,'Clean & perfect source code','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(110,3,NULL,NULL,1,2,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(111,9,NULL,NULL,10,1,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(112,3,NULL,NULL,12,3,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(113,4,NULL,NULL,11,3,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(114,5,NULL,NULL,2,5,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(115,1,NULL,NULL,5,2,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(116,1,NULL,NULL,12,1,'Best ecommerce CMS online store!','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(117,1,NULL,NULL,10,5,'Great E-commerce system. And much more : Wonderful Customer Support.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(118,10,NULL,NULL,8,1,'Best ecommerce CMS online store!','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(119,9,NULL,NULL,7,3,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL),(120,8,NULL,NULL,1,3,'The code is good, in general, if you like it, can you give it 5 stars?','published','auto','2026-05-28 19:02:55','2026-05-28 19:02:55',NULL);
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
INSERT INTO `ec_shipping` VALUES (1,'Domestic',NULL,'2026-05-28 19:02:56','2026-05-28 19:02:56'),(2,'International',NULL,'2026-05-28 19:02:56','2026-05-28 19:02:56');
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
INSERT INTO `ec_shipping_rules` VALUES (1,'Free Standard Shipping (orders $99+)',1,'based_on_price',99.00,NULL,0.00,'2026-05-28 19:02:56','2026-05-28 19:02:56'),(2,'Standard (3-5 business days)',1,'based_on_price',0.00,NULL,7.99,'2026-05-28 19:02:56','2026-05-28 19:02:56'),(3,'Express (1-2 business days)',1,'based_on_price',0.00,NULL,19.99,'2026-05-28 19:02:56','2026-05-28 19:02:56'),(4,'Local Pickup',1,'based_on_price',0.00,NULL,0.00,'2026-05-28 19:02:56','2026-05-28 19:02:56'),(5,'International Standard (7-12 days)',2,'based_on_price',0.00,NULL,24.99,'2026-05-28 19:02:56','2026-05-28 19:02:56'),(6,'International Express (3-5 days)',2,'based_on_price',0.00,NULL,49.99,'2026-05-28 19:02:56','2026-05-28 19:02:56');
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
INSERT INTO `ec_specification_attributes` VALUES (1,1,'Composition','text',NULL,'55% Polyester, 30% Acrylic, 13% Polyamide, 2% Elastane','2026-05-28 19:02:43','2026-05-28 19:02:43',NULL,NULL),(2,1,'Origin','text',NULL,'Made in Portugal','2026-05-28 19:02:43','2026-05-28 19:02:43',NULL,NULL),(3,1,'Care','text',NULL,'Machine wash cold. Tumble dry low. Do not bleach.','2026-05-28 19:02:43','2026-05-28 19:02:43',NULL,NULL),(4,2,'Designed In','text',NULL,'Barcelona, Spain','2026-05-28 19:02:43','2026-05-28 19:02:43',NULL,NULL),(5,2,'Warranty','text',NULL,'12 months manufacturer warranty','2026-05-28 19:02:43','2026-05-28 19:02:43',NULL,NULL),(6,2,'Made From Recycled Materials','checkbox',NULL,'1','2026-05-28 19:02:43','2026-05-28 19:02:43',NULL,NULL);
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
INSERT INTO `ec_specification_groups` VALUES (1,'Material & Composition','Fibre breakdown, origin and care guidance.','2026-05-28 19:02:43','2026-05-28 19:02:43',NULL,NULL),(2,'Product Details','Provenance, warranty and sustainability.','2026-05-28 19:02:43','2026-05-28 19:02:43',NULL,NULL);
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
INSERT INTO `ec_specification_tables` VALUES (1,'Default Specifications','Default specification layout applied to all products.','2026-05-28 19:02:43','2026-05-28 19:02:43',NULL,NULL);
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
INSERT INTO `faq_categories` VALUES (1,'Orders &amp; Shipping',0,'published','2026-05-28 19:02:43','2026-05-28 19:02:43','Everything about placing, tracking, and receiving your order.'),(2,'Returns &amp; Refunds',1,'published','2026-05-28 19:02:43','2026-05-28 19:02:43','Our 30-day return policy and how to start a return.'),(3,'Products &amp; Stock',2,'published','2026-05-28 19:02:43','2026-05-28 19:02:43','Sizing, materials, restocks, and product care.'),(4,'Account &amp; Payment',3,'published','2026-05-28 19:02:43','2026-05-28 19:02:43','Managing your account and accepted payment methods.');
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
INSERT INTO `faqs` VALUES (1,'How long does standard shipping take?','Standard shipping arrives within 3-5 business days for domestic orders and 7-12 business days for international destinations. Express options are available at checkout.',1,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(2,'Do you offer free shipping?','Yes — orders above $99 ship free within the continental US. International free-shipping thresholds vary by destination and are shown at checkout.',1,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(3,'How can I track my order?','You will receive a tracking link by email as soon as your order is dispatched. You can also follow the parcel from your account dashboard under My Orders.',1,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(4,'Can I change the shipping address after I place my order?','Address changes are possible if your order has not yet entered fulfilment. Contact us within two hours of placing the order for the best chance of a successful update.',1,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(5,'What is your return policy?','We offer 30 days from delivery to return any unworn item in its original condition. Sale items and intimate apparel are final sale.',2,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(6,'How do I start a return?','Start a return from your account dashboard or email returns@amerce.test with your order number. We will send a prepaid return label for domestic orders.',2,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(7,'When will I receive my refund?','Refunds are processed within 3-5 business days of us receiving your return. The funds typically appear on your statement within an additional 5-7 days, depending on your bank.',2,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(8,'How do I find the right size?','Each product page includes a size chart based on actual garment measurements. If you are between sizes, we generally recommend sizing up for our knitwear and outerwear.',3,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(9,'When will sold-out items be restocked?','Most styles restock within 2-4 weeks. Click the Notify Me button on any sold-out variant to be alerted by email the moment it returns.',3,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(10,'Are your products ethically sourced?','Yes. We work only with manufacturing partners who meet our supplier code of conduct, covering fair wages, safe conditions, and verified material provenance.',3,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(11,'Which payment methods do you accept?','We accept Visa, Mastercard, American Express, Apple Pay, Google Pay, PayPal, and Klarna for eligible markets.',4,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(12,'Is it safe to enter my card details?','All payments are processed by PCI-DSS Level 1 certified providers using TLS 1.3 encryption. We never store full card numbers on our servers.',4,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(13,'How do I reset my password?','Use the Forgot Password link on the login page. A reset link will be sent to your registered email address and is valid for 30 minutes.',4,'published','2026-05-28 19:02:43','2026-05-28 19:02:43');
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
INSERT INTO `fob_product_size_guides` VALUES (1,'Default Size Chart','<h6>Bust</h6><p>Measure around the fullest part of your bust.</p><h6>Waist</h6><p>Measure around the narrowest part of your torso.</p><h6>Low Hip</h6><p>With your feet together measure around the fullest part of your hips/rear.</p>',NULL,'[\"size\", \"us\", \"bust\", \"waist\", \"low-hip\"]','[[\"XS\", \"2\", \"32\", \"24 - 25\", \"33 - 34\"], [\"S\", \"4\", \"34 - 35\", \"26 - 27\", \"35 - 26\"], [\"M\", \"6\", \"36 - 37\", \"28 - 29\", \"38 - 40\"], [\"L\", \"8\", \"38 - 29\", \"30 - 31\", \"42 - 44\"], [\"XL\", \"10\", \"40 - 41\", \"32 - 33\", \"45 - 47\"], [\"XXL\", \"12\", \"42 - 43\", \"34 - 35\", \"48 - 50\"]]','published',0,'2026-05-28 19:02:43','2026-05-28 19:02:43');
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
INSERT INTO `fob_size_guide_headers` VALUES (1,'Size','size','general',0,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(2,'US','us','general',1,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(3,'Bust','bust','general',2,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(4,'Waist','waist','general',3,'published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(5,'Low Hip','low-hip','general',4,'published','2026-05-28 19:02:43','2026-05-28 19:02:43');
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
INSERT INTO `language_meta` VALUES (7,'en','c6b1b4b65a59b1b8a2b946bf75e2ae77',3,'Botble\\Menu\\Models\\Menu'),(8,'en','aff38d2f6c5daa6dc635a3561f84d63e',2,'Botble\\Menu\\Models\\Menu'),(9,'en','02de64652034728fb68b0900711091fd',1,'Botble\\Menu\\Models\\Menu'),(10,'en','4b01550a18ce190040f23cdb7d35c03d',1,'Botble\\Menu\\Models\\MenuLocation'),(11,'en','4201e651b0de7d0486753694d1d20686',2,'Botble\\Menu\\Models\\MenuLocation'),(12,'en','b899175c320dd0597ee8ba02403142bf',3,'Botble\\Menu\\Models\\MenuLocation'),(13,'vi','4b01550a18ce190040f23cdb7d35c03d',4,'Botble\\Menu\\Models\\MenuLocation'),(14,'vi','02de64652034728fb68b0900711091fd',4,'Botble\\Menu\\Models\\Menu'),(15,'vi','4201e651b0de7d0486753694d1d20686',5,'Botble\\Menu\\Models\\MenuLocation'),(16,'vi','aff38d2f6c5daa6dc635a3561f84d63e',5,'Botble\\Menu\\Models\\Menu'),(17,'vi','b899175c320dd0597ee8ba02403142bf',6,'Botble\\Menu\\Models\\MenuLocation'),(18,'vi','c6b1b4b65a59b1b8a2b946bf75e2ae77',6,'Botble\\Menu\\Models\\Menu'),(19,'ar','4b01550a18ce190040f23cdb7d35c03d',7,'Botble\\Menu\\Models\\MenuLocation'),(20,'ar','02de64652034728fb68b0900711091fd',7,'Botble\\Menu\\Models\\Menu'),(21,'ar','4201e651b0de7d0486753694d1d20686',8,'Botble\\Menu\\Models\\MenuLocation'),(22,'ar','aff38d2f6c5daa6dc635a3561f84d63e',8,'Botble\\Menu\\Models\\Menu'),(23,'ar','b899175c320dd0597ee8ba02403142bf',9,'Botble\\Menu\\Models\\MenuLocation'),(24,'ar','c6b1b4b65a59b1b8a2b946bf75e2ae77',9,'Botble\\Menu\\Models\\Menu'),(25,'fr','4b01550a18ce190040f23cdb7d35c03d',10,'Botble\\Menu\\Models\\MenuLocation'),(26,'fr','02de64652034728fb68b0900711091fd',10,'Botble\\Menu\\Models\\Menu'),(27,'fr','4201e651b0de7d0486753694d1d20686',11,'Botble\\Menu\\Models\\MenuLocation'),(28,'fr','aff38d2f6c5daa6dc635a3561f84d63e',11,'Botble\\Menu\\Models\\Menu'),(29,'fr','b899175c320dd0597ee8ba02403142bf',12,'Botble\\Menu\\Models\\MenuLocation'),(30,'fr','c6b1b4b65a59b1b8a2b946bf75e2ae77',12,'Botble\\Menu\\Models\\Menu'),(31,'id','4b01550a18ce190040f23cdb7d35c03d',13,'Botble\\Menu\\Models\\MenuLocation'),(32,'id','02de64652034728fb68b0900711091fd',13,'Botble\\Menu\\Models\\Menu'),(33,'id','4201e651b0de7d0486753694d1d20686',14,'Botble\\Menu\\Models\\MenuLocation'),(34,'id','aff38d2f6c5daa6dc635a3561f84d63e',14,'Botble\\Menu\\Models\\Menu'),(35,'id','b899175c320dd0597ee8ba02403142bf',15,'Botble\\Menu\\Models\\MenuLocation'),(36,'id','c6b1b4b65a59b1b8a2b946bf75e2ae77',15,'Botble\\Menu\\Models\\Menu'),(37,'tr','4b01550a18ce190040f23cdb7d35c03d',16,'Botble\\Menu\\Models\\MenuLocation'),(38,'tr','02de64652034728fb68b0900711091fd',16,'Botble\\Menu\\Models\\Menu'),(39,'tr','4201e651b0de7d0486753694d1d20686',17,'Botble\\Menu\\Models\\MenuLocation'),(40,'tr','aff38d2f6c5daa6dc635a3561f84d63e',17,'Botble\\Menu\\Models\\Menu'),(41,'tr','b899175c320dd0597ee8ba02403142bf',18,'Botble\\Menu\\Models\\MenuLocation'),(42,'tr','c6b1b4b65a59b1b8a2b946bf75e2ae77',18,'Botble\\Menu\\Models\\Menu');
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'cod','cod',1,'image/png',12121,'payments/cod-9.png','[]','2026-05-28 19:02:40','2026-05-28 19:02:40',NULL,'public'),(2,0,'bank-transfer','bank-transfer',1,'image/png',29089,'payments/bank-transfer-9.png','[]','2026-05-28 19:02:41','2026-05-28 19:02:41',NULL,'public'),(3,0,'stripe','stripe',1,'image/webp',7516,'payments/stripe-9.webp','[]','2026-05-28 19:02:41','2026-05-28 19:02:41',NULL,'public'),(4,0,'paypal','paypal',1,'image/png',3001,'payments/paypal-9.png','[]','2026-05-28 19:02:41','2026-05-28 19:02:41',NULL,'public'),(5,0,'mollie','mollie',1,'image/png',8968,'payments/mollie-9.png','[]','2026-05-28 19:02:42','2026-05-28 19:02:42',NULL,'public'),(6,0,'paystack','paystack',1,'image/png',31015,'payments/paystack-9.png','[]','2026-05-28 19:02:42','2026-05-28 19:02:42',NULL,'public'),(7,0,'razorpay','razorpay',1,'image/png',8489,'payments/razorpay-9.png','[]','2026-05-28 19:02:42','2026-05-28 19:02:42',NULL,'public'),(8,0,'sslcommerz','sslcommerz',1,'image/png',3482,'payments/sslcommerz-9.png','[]','2026-05-28 19:02:42','2026-05-28 19:02:42',NULL,'public'),(9,0,'slider-1','slider-1',3,'image/jpeg',32887,'slider/fashion-2/slider-1.jpg','[]','2026-05-28 19:02:43','2026-05-28 19:02:43',NULL,'public'),(10,0,'slider-2','slider-2',3,'image/jpeg',32887,'slider/fashion-2/slider-2.jpg','[]','2026-05-28 19:02:44','2026-05-28 19:02:44',NULL,'public'),(11,0,'slider-3','slider-3',3,'image/jpeg',32887,'slider/fashion-2/slider-3.jpg','[]','2026-05-28 19:02:44','2026-05-28 19:02:44',NULL,'public'),(12,0,'cate-1','cate-1',5,'image/jpeg',18443,'categories/fashion-2/cate-1.jpg','[]','2026-05-28 19:02:44','2026-05-28 19:02:44',NULL,'public'),(13,0,'cate-2','cate-2',5,'image/jpeg',18443,'categories/fashion-2/cate-2.jpg','[]','2026-05-28 19:02:44','2026-05-28 19:02:44',NULL,'public'),(14,0,'cate-3','cate-3',5,'image/jpeg',18443,'categories/fashion-2/cate-3.jpg','[]','2026-05-28 19:02:45','2026-05-28 19:02:45',NULL,'public'),(15,0,'cate-4','cate-4',5,'image/jpeg',18443,'categories/fashion-2/cate-4.jpg','[]','2026-05-28 19:02:45','2026-05-28 19:02:45',NULL,'public'),(16,0,'cate-5','cate-5',5,'image/jpeg',18443,'categories/fashion-2/cate-5.jpg','[]','2026-05-28 19:02:45','2026-05-28 19:02:45',NULL,'public'),(17,0,'product-1','product-1',7,'image/jpeg',13655,'products/fashion-2/product-1.jpg','[]','2026-05-28 19:02:45','2026-05-28 19:02:45',NULL,'public'),(18,0,'product-2','product-2',7,'image/jpeg',13655,'products/fashion-2/product-2.jpg','[]','2026-05-28 19:02:46','2026-05-28 19:02:46',NULL,'public'),(19,0,'product-3','product-3',7,'image/jpeg',13655,'products/fashion-2/product-3.jpg','[]','2026-05-28 19:02:46','2026-05-28 19:02:46',NULL,'public'),(20,0,'product-4','product-4',7,'image/jpeg',13655,'products/fashion-2/product-4.jpg','[]','2026-05-28 19:02:46','2026-05-28 19:02:46',NULL,'public'),(21,0,'product-5','product-5',7,'image/jpeg',13655,'products/fashion-2/product-5.jpg','[]','2026-05-28 19:02:46','2026-05-28 19:02:46',NULL,'public'),(22,0,'product-6','product-6',7,'image/jpeg',13655,'products/fashion-2/product-6.jpg','[]','2026-05-28 19:02:46','2026-05-28 19:02:46',NULL,'public'),(23,0,'product-7','product-7',7,'image/jpeg',13655,'products/fashion-2/product-7.jpg','[]','2026-05-28 19:02:47','2026-05-28 19:02:47',NULL,'public'),(24,0,'product-8','product-8',7,'image/jpeg',13655,'products/fashion-2/product-8.jpg','[]','2026-05-28 19:02:47','2026-05-28 19:02:47',NULL,'public'),(25,0,'product-9','product-9',7,'image/jpeg',13655,'products/fashion-2/product-9.jpg','[]','2026-05-28 19:02:47','2026-05-28 19:02:47',NULL,'public'),(26,0,'product-10','product-10',7,'image/jpeg',13655,'products/fashion-2/product-10.jpg','[]','2026-05-28 19:02:47','2026-05-28 19:02:47',NULL,'public'),(27,0,'product-11','product-11',7,'image/jpeg',13655,'products/fashion-2/product-11.jpg','[]','2026-05-28 19:02:48','2026-05-28 19:02:48',NULL,'public'),(28,0,'product-12','product-12',7,'image/jpeg',13655,'products/fashion-2/product-12.jpg','[]','2026-05-28 19:02:48','2026-05-28 19:02:48',NULL,'public'),(29,0,'tes-1','tes-1',8,'image/jpeg',3439,'testimonials/tes-1.jpg','[]','2026-05-28 19:02:58','2026-05-28 19:02:58',NULL,'public'),(30,0,'tes-2','tes-2',8,'image/jpeg',3439,'testimonials/tes-2.jpg','[]','2026-05-28 19:02:58','2026-05-28 19:02:58',NULL,'public'),(31,0,'member-1','member-1',9,'image/jpeg',3439,'member/member-1.jpg','[]','2026-05-28 19:02:58','2026-05-28 19:02:58',NULL,'public'),(32,0,'member-2','member-2',9,'image/jpeg',3439,'member/member-2.jpg','[]','2026-05-28 19:02:58','2026-05-28 19:02:58',NULL,'public'),(33,0,'member-3','member-3',9,'image/jpeg',3439,'member/member-3.jpg','[]','2026-05-28 19:02:58','2026-05-28 19:02:58',NULL,'public'),(34,0,'member-4','member-4',9,'image/jpeg',3439,'member/member-4.jpg','[]','2026-05-28 19:02:58','2026-05-28 19:02:58',NULL,'public'),(35,0,'s-contact-1','s-contact-1',10,'image/jpeg',41514,'section/s-contact-1.jpg','[]','2026-05-28 19:02:58','2026-05-28 19:02:58',NULL,'public'),(36,0,'s-contact-2','s-contact-2',10,'image/jpeg',16643,'section/s-contact-2.jpg','[]','2026-05-28 19:02:58','2026-05-28 19:02:58',NULL,'public'),(37,0,'banner-12','banner-12',10,'image/jpeg',22623,'section/banner-12.jpg','[]','2026-05-28 19:02:58','2026-05-28 19:02:58',NULL,'public'),(38,0,'product-1_2','product-1_2',11,'image/jpeg',21916,'products/fashion-2/square/product-1-2.jpg','[]','2026-05-28 19:02:58','2026-05-28 19:02:58',NULL,'public'),(39,0,'product-2_2','product-2_2',11,'image/jpeg',21916,'products/fashion-2/square/product-2-2.jpg','[]','2026-05-28 19:02:58','2026-05-28 19:02:58',NULL,'public'),(40,0,'product-4_2','product-4_2',11,'image/jpeg',21916,'products/fashion-2/square/product-4-2.jpg','[]','2026-05-28 19:02:59','2026-05-28 19:02:59',NULL,'public'),(41,0,'cls-34','cls-34',12,'image/jpeg',7374,'collection/cls-34.jpg','[]','2026-05-28 19:02:59','2026-05-28 19:02:59',NULL,'public'),(42,0,'cls-35','cls-35',12,'image/jpeg',7374,'collection/cls-35.jpg','[]','2026-05-28 19:02:59','2026-05-28 19:02:59',NULL,'public'),(43,0,'cls-36','cls-36',12,'image/jpeg',7374,'collection/cls-36.jpg','[]','2026-05-28 19:02:59','2026-05-28 19:02:59',NULL,'public'),(44,0,'cls-37','cls-37',12,'image/jpeg',7374,'collection/cls-37.jpg','[]','2026-05-28 19:02:59','2026-05-28 19:02:59',NULL,'public'),(45,0,'cls-38','cls-38',12,'image/jpeg',7374,'collection/cls-38.jpg','[]','2026-05-28 19:03:00','2026-05-28 19:03:00',NULL,'public'),(46,0,'cls-3','cls-3',12,'image/jpeg',5065,'collection/cls-3.jpg','[]','2026-05-28 19:03:00','2026-05-28 19:03:00',NULL,'public'),(47,0,'gallery-52','gallery-52',13,'image/jpeg',21916,'gallery/gallery-52.jpg','[]','2026-05-28 19:03:00','2026-05-28 19:03:00',NULL,'public'),(48,0,'gallery-53','gallery-53',13,'image/jpeg',21916,'gallery/gallery-53.jpg','[]','2026-05-28 19:03:00','2026-05-28 19:03:00',NULL,'public'),(49,0,'gallery-54','gallery-54',13,'image/jpeg',21916,'gallery/gallery-54.jpg','[]','2026-05-28 19:03:00','2026-05-28 19:03:00',NULL,'public'),(50,0,'gallery-55','gallery-55',13,'image/jpeg',21916,'gallery/gallery-55.jpg','[]','2026-05-28 19:03:00','2026-05-28 19:03:00',NULL,'public'),(51,0,'gallery-56','gallery-56',13,'image/jpeg',21916,'gallery/gallery-56.jpg','[]','2026-05-28 19:03:01','2026-05-28 19:03:01',NULL,'public');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'payments',NULL,'payments',0,'2026-05-28 19:02:40','2026-05-28 19:02:40',NULL),(2,0,'slider',NULL,'slider',0,'2026-05-28 19:02:43','2026-05-28 19:02:43',NULL),(3,0,'fashion-2',NULL,'fashion-2',2,'2026-05-28 19:02:43','2026-05-28 19:02:43',NULL),(4,0,'categories',NULL,'categories',0,'2026-05-28 19:02:44','2026-05-28 19:02:44',NULL),(5,0,'fashion-2',NULL,'fashion-2',4,'2026-05-28 19:02:44','2026-05-28 19:02:44',NULL),(6,0,'products',NULL,'products',0,'2026-05-28 19:02:45','2026-05-28 19:02:45',NULL),(7,0,'fashion-2',NULL,'fashion-2',6,'2026-05-28 19:02:45','2026-05-28 19:02:45',NULL),(8,0,'testimonials',NULL,'testimonials',0,'2026-05-28 19:02:58','2026-05-28 19:02:58',NULL),(9,0,'member',NULL,'member',0,'2026-05-28 19:02:58','2026-05-28 19:02:58',NULL),(10,0,'section',NULL,'section',0,'2026-05-28 19:02:58','2026-05-28 19:02:58',NULL),(11,0,'square',NULL,'square',7,'2026-05-28 19:02:58','2026-05-28 19:02:58',NULL),(12,0,'collection',NULL,'collection',0,'2026-05-28 19:02:59','2026-05-28 19:02:59',NULL),(13,0,'gallery',NULL,'gallery',0,'2026-05-28 19:03:00','2026-05-28 19:03:00',NULL);
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
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2026-05-28 19:02:43','2026-05-28 19:02:43'),(2,2,'footer-menu-1','2026-05-28 19:02:43','2026-05-28 19:02:43'),(3,3,'footer-menu-2','2026-05-28 19:02:43','2026-05-28 19:02:43'),(4,4,'main-menu','2026-05-28 19:03:01','2026-05-28 19:03:01'),(5,5,'footer-menu-1','2026-05-28 19:03:01','2026-05-28 19:03:01'),(6,6,'footer-menu-2','2026-05-28 19:03:01','2026-05-28 19:03:01'),(7,7,'main-menu','2026-05-28 19:03:01','2026-05-28 19:03:01'),(8,8,'footer-menu-1','2026-05-28 19:03:01','2026-05-28 19:03:01'),(9,9,'footer-menu-2','2026-05-28 19:03:01','2026-05-28 19:03:01'),(10,10,'main-menu','2026-05-28 19:03:01','2026-05-28 19:03:01'),(11,11,'footer-menu-1','2026-05-28 19:03:01','2026-05-28 19:03:01'),(12,12,'footer-menu-2','2026-05-28 19:03:01','2026-05-28 19:03:01'),(13,13,'main-menu','2026-05-28 19:03:01','2026-05-28 19:03:01'),(14,14,'footer-menu-1','2026-05-28 19:03:01','2026-05-28 19:03:01'),(15,15,'footer-menu-2','2026-05-28 19:03:02','2026-05-28 19:03:02'),(16,16,'main-menu','2026-05-28 19:03:02','2026-05-28 19:03:02'),(17,17,'footer-menu-1','2026-05-28 19:03:02','2026-05-28 19:03:02'),(18,18,'footer-menu-2','2026-05-28 19:03:02','2026-05-28 19:03:02');
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
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'https://amerce.botble.com',NULL,0,'Home','has-mega-menu','_self',1,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(2,1,1,NULL,NULL,'https://amerce.botble.com',NULL,0,'Main Demo',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(3,1,1,NULL,NULL,'https://amerce-mental.botble.com',NULL,1,'Home Mental',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(4,1,1,NULL,NULL,'https://amerce-electronics.botble.com',NULL,2,'Home Electronics',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(5,1,1,NULL,NULL,'https://amerce-pod.botble.com',NULL,3,'Home POD',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(6,1,1,NULL,NULL,'https://amerce-pet-care.botble.com',NULL,4,'Home Pet Care',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(7,1,1,NULL,NULL,'https://amerce-baby.botble.com',NULL,5,'Home Baby',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(8,1,1,NULL,NULL,'https://amerce-auto.botble.com',NULL,6,'Home Auto',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(9,1,1,NULL,NULL,'https://amerce-decor.botble.com',NULL,7,'Home Decor',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(10,1,1,NULL,NULL,'https://amerce-cosmetic.botble.com',NULL,8,'Home Cosmetic',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(11,1,1,NULL,NULL,'https://amerce-organic.botble.com',NULL,9,'Home Organic',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(12,1,1,NULL,NULL,'https://amerce-fashion.botble.com',NULL,10,'Home Fashion',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(13,1,1,NULL,NULL,'https://amerce-headphone.botble.com',NULL,11,'Home Headphone',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(14,1,1,NULL,NULL,'https://amerce-jewelry.botble.com',NULL,12,'Home Jewelry',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(15,1,1,NULL,NULL,'https://amerce-garden.botble.com',NULL,13,'Home Garden',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(16,1,1,NULL,NULL,'https://amerce-construct.botble.com',NULL,14,'Home Construct',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(17,1,1,NULL,NULL,'https://amerce-furniture.botble.com',NULL,15,'Home Furniture',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(18,1,1,NULL,NULL,'https://amerce-fashion-2.botble.com',NULL,16,'Home Fashion 2',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(19,1,1,NULL,NULL,'https://amerce-bag.botble.com',NULL,17,'Home Bag',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(20,1,1,NULL,NULL,'https://amerce-sport.botble.com',NULL,18,'Home Sport',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(21,1,1,NULL,NULL,'https://amerce-office.botble.com',NULL,19,'Home Office',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(22,1,1,NULL,NULL,'https://amerce-sneaker.botble.com',NULL,20,'Home Sneaker',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(23,1,0,NULL,NULL,'/products',NULL,1,'Shop','has-mega-menu','_self',1,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(24,1,23,NULL,NULL,'#',NULL,0,'Shop Layout',NULL,'_self',1,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(25,1,24,NULL,NULL,'/products',NULL,0,'Default',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(26,1,24,NULL,NULL,'/products?layout=left-sidebar',NULL,1,'Left Sidebar',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(27,1,24,NULL,NULL,'/products?layout=right-sidebar',NULL,2,'Right Sidebar',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(28,1,24,NULL,NULL,'/products?layout=full-width',NULL,3,'Full Width',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(29,1,24,NULL,NULL,'/products?layout=sub-collection',NULL,4,'Sub Collection',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(30,1,24,NULL,NULL,'/collections',NULL,5,'Collection List',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(31,1,23,NULL,NULL,'#',NULL,1,'View Style',NULL,'_self',1,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(32,1,31,NULL,NULL,'/products',NULL,0,'Default',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(33,1,31,NULL,NULL,'/products?layout=grid',NULL,1,'Grid View',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(34,1,31,NULL,NULL,'/products?layout=list',NULL,2,'List View',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(35,1,23,NULL,NULL,'#',NULL,2,'Browse',NULL,'_self',1,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(36,1,35,NULL,NULL,'/products',NULL,0,'All Products',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(37,1,35,NULL,NULL,'/products?source=latest',NULL,1,'New Arrivals',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(38,1,35,NULL,NULL,'/products?sort=best-seller',NULL,2,'Best Sellers',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(39,1,35,NULL,NULL,'/products?source=featured',NULL,3,'Featured',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(40,1,35,NULL,NULL,'/products?on_sale=1',NULL,4,'On Sale',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(41,1,0,NULL,NULL,'/products',NULL,2,'Product','has-mega-menu','_self',1,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(42,1,41,NULL,NULL,'#',NULL,0,'Product Layout',NULL,'_self',1,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(43,1,42,NULL,NULL,'/products',NULL,0,'Default',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(44,1,42,NULL,NULL,'/products?layout=right-thumbnail',NULL,1,'Right Thumbnail',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(45,1,42,NULL,NULL,'/products?layout=bottom-thumbnail',NULL,2,'Bottom Thumbnail',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(46,1,42,NULL,NULL,'/products?layout=grid',NULL,3,'Product Grid',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(47,1,42,NULL,NULL,'/products?layout=grid-2',NULL,4,'Product Grid 2',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(48,1,42,NULL,NULL,'/products?layout=stacked',NULL,5,'Product Stacked',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(49,1,42,NULL,NULL,'/products?layout=description-accordion',NULL,6,'Description Accordion',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(50,1,0,NULL,NULL,'/blog',NULL,3,'Blog',NULL,'_self',1,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(51,1,50,NULL,NULL,'/blog',NULL,0,'Blog',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(52,1,50,NULL,NULL,'/blog',NULL,1,'Blog Single',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(53,1,0,NULL,NULL,'/about',NULL,4,'Pages',NULL,'_self',1,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(54,1,53,NULL,NULL,'/about',NULL,0,'About Us',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(55,1,53,NULL,NULL,'/contact',NULL,1,'Contact Us',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(56,1,53,NULL,NULL,'/our-stores',NULL,2,'Our Store',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(57,1,53,NULL,NULL,'/orders/tracking',NULL,3,'Invoice',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(58,1,53,NULL,NULL,'/page-not-found',NULL,4,'404',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(59,1,53,NULL,NULL,'/compare',NULL,5,'Compare',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(60,1,53,NULL,NULL,'/customer/overview',NULL,6,'My Account',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(61,2,0,NULL,NULL,'/shipping',NULL,0,'Shipping',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(62,2,0,NULL,NULL,'/returns-refunds',NULL,1,'Return & Refund',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(63,2,0,NULL,NULL,'/privacy-policy',NULL,2,'Privacy Policy',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(64,2,0,NULL,NULL,'/terms-of-service',NULL,3,'Terms & Conditions',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(65,2,0,NULL,NULL,'/faq',NULL,4,'Orders FAQs',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(66,3,0,NULL,NULL,'/about',NULL,0,'About Us',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(67,3,0,NULL,NULL,'/our-stores',NULL,1,'Our Stories',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(68,3,0,NULL,NULL,'/contact',NULL,2,'Contact us',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(69,3,0,NULL,NULL,'/blog',NULL,3,'Latest New',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(70,3,0,NULL,NULL,'/customer/overview',NULL,4,'My Account',NULL,'_self',0,'2026-05-28 19:02:43','2026-05-28 19:02:43'),(71,4,0,NULL,NULL,'/',NULL,0,'Trang chủ',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(72,4,0,NULL,NULL,'/products',NULL,1,'Mua sắm',NULL,'_self',1,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(73,4,72,NULL,NULL,'/products?source=latest',NULL,0,'Hàng mới về',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(74,4,72,NULL,NULL,'/products?sort=best-seller',NULL,1,'Bán chạy nhất',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(75,4,72,NULL,NULL,'/products?on_sale=1',NULL,2,'Giảm giá',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(76,4,72,NULL,NULL,'/products',NULL,3,'Tất cả sản phẩm',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(77,4,0,NULL,NULL,'/products',NULL,2,'Danh mục',NULL,'_self',1,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(78,4,77,NULL,NULL,'/product-categories/outerwear',NULL,0,'Áo khoác',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(79,4,77,NULL,NULL,'/product-categories/tops-shirts',NULL,1,'Áo & Sơ mi',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(80,4,77,NULL,NULL,'/product-categories/bottoms',NULL,2,'Quần & Váy',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(81,4,77,NULL,NULL,'/product-categories/dresses',NULL,3,'Đầm',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(82,4,77,NULL,NULL,'/product-categories/footwear',NULL,4,'Giày dép',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(83,4,77,NULL,NULL,'/product-categories/accessories',NULL,5,'Phụ kiện',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(84,4,0,NULL,NULL,'/brands',NULL,3,'Thương hiệu',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(85,4,0,NULL,NULL,'/blog',NULL,4,'Tạp chí',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(86,4,0,NULL,NULL,'/about',NULL,5,'Giới thiệu',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(87,4,0,NULL,NULL,'/contact',NULL,6,'Liên hệ',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(88,5,0,NULL,NULL,'/contact',NULL,0,'Liên hệ với chúng tôi',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(89,5,0,NULL,NULL,'/faq',NULL,1,'Câu hỏi thường gặp',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(90,5,0,NULL,NULL,'/shipping',NULL,2,'Vận chuyển',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(91,5,0,NULL,NULL,'/returns-refunds',NULL,3,'Đổi trả & Hoàn tiền',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(92,5,0,NULL,NULL,'/customer/orders',NULL,4,'Theo dõi đơn hàng',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(93,6,0,NULL,NULL,'/about',NULL,0,'Giới thiệu',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(94,6,0,NULL,NULL,'/our-stores',NULL,1,'Cửa hàng',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(95,6,0,NULL,NULL,'/sustainability',NULL,2,'Phát triển bền vững',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(96,6,0,NULL,NULL,'/careers',NULL,3,'Tuyển dụng',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(97,6,0,NULL,NULL,'/privacy-policy',NULL,4,'Chính sách bảo mật',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(98,6,0,NULL,NULL,'/terms-conditions',NULL,5,'Điều khoản & Điều kiện',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(99,7,0,NULL,NULL,'/',NULL,0,'الصفحة الرئيسية',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(100,7,0,NULL,NULL,'/products',NULL,1,'التسوق',NULL,'_self',1,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(101,7,100,NULL,NULL,'/products?source=latest',NULL,0,'الوافدون الجدد',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(102,7,100,NULL,NULL,'/products?sort=best-seller',NULL,1,'الأكثر مبيعًا',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(103,7,100,NULL,NULL,'/products?on_sale=1',NULL,2,'تخفيض',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(104,7,100,NULL,NULL,'/products',NULL,3,'جميع المنتجات',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(105,7,0,NULL,NULL,'/products',NULL,2,'فئة',NULL,'_self',1,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(106,7,105,NULL,NULL,'/product-categories/outerwear',NULL,0,'سترة',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(107,7,105,NULL,NULL,'/product-categories/tops-shirts',NULL,1,'قميص',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(108,7,105,NULL,NULL,'/product-categories/bottoms',NULL,2,'السراويل والتنانير',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(109,7,105,NULL,NULL,'/product-categories/dresses',NULL,3,'فستان',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(110,7,105,NULL,NULL,'/product-categories/footwear',NULL,4,'أحذية',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(111,7,105,NULL,NULL,'/product-categories/accessories',NULL,5,'ملحق',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(112,7,0,NULL,NULL,'/brands',NULL,3,'علامة تجارية',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(113,7,0,NULL,NULL,'/blog',NULL,4,'مجلة',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(114,7,0,NULL,NULL,'/about',NULL,5,'يقدم',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(115,7,0,NULL,NULL,'/contact',NULL,6,'اتصال',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(116,8,0,NULL,NULL,'/contact',NULL,0,'اتصل بنا',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(117,8,0,NULL,NULL,'/faq',NULL,1,'الأسئلة المتداولة',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(118,8,0,NULL,NULL,'/shipping',NULL,2,'ينقل',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(119,8,0,NULL,NULL,'/returns-refunds',NULL,3,'العوائد والمبالغ المستردة',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(120,8,0,NULL,NULL,'/customer/orders',NULL,4,'تتبع الطلب',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(121,9,0,NULL,NULL,'/about',NULL,0,'يقدم',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(122,9,0,NULL,NULL,'/our-stores',NULL,1,'محل',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(123,9,0,NULL,NULL,'/sustainability',NULL,2,'التنمية المستدامة',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(124,9,0,NULL,NULL,'/careers',NULL,3,'توظيف',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(125,9,0,NULL,NULL,'/privacy-policy',NULL,4,'سياسة الخصوصية',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(126,9,0,NULL,NULL,'/terms-conditions',NULL,5,'الشروط والأحكام',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(127,10,0,NULL,NULL,'/',NULL,0,'Page d\'accueil',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(128,10,0,NULL,NULL,'/products',NULL,1,'Achats',NULL,'_self',1,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(129,10,128,NULL,NULL,'/products?source=latest',NULL,0,'Nouveautés',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(130,10,128,NULL,NULL,'/products?sort=best-seller',NULL,1,'Meilleur vendeur',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(131,10,128,NULL,NULL,'/products?on_sale=1',NULL,2,'Rabais',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(132,10,128,NULL,NULL,'/products',NULL,3,'Tous les produits',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(133,10,0,NULL,NULL,'/products',NULL,2,'Catégorie',NULL,'_self',1,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(134,10,133,NULL,NULL,'/product-categories/outerwear',NULL,0,'Veste',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(135,10,133,NULL,NULL,'/product-categories/tops-shirts',NULL,1,'Chemise',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(136,10,133,NULL,NULL,'/product-categories/bottoms',NULL,2,'Pantalons et jupes',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(137,10,133,NULL,NULL,'/product-categories/dresses',NULL,3,'Robe',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(138,10,133,NULL,NULL,'/product-categories/footwear',NULL,4,'Chaussures',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(139,10,133,NULL,NULL,'/product-categories/accessories',NULL,5,'Accessoire',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(140,10,0,NULL,NULL,'/brands',NULL,3,'Marque déposée',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(141,10,0,NULL,NULL,'/blog',NULL,4,'Revue',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(142,10,0,NULL,NULL,'/about',NULL,5,'Introduire',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(143,10,0,NULL,NULL,'/contact',NULL,6,'Contact',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(144,11,0,NULL,NULL,'/contact',NULL,0,'Contactez-nous',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(145,11,0,NULL,NULL,'/faq',NULL,1,'Questions fréquemment posées',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(146,11,0,NULL,NULL,'/shipping',NULL,2,'Transport',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(147,11,0,NULL,NULL,'/returns-refunds',NULL,3,'Retours et remboursements',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(148,11,0,NULL,NULL,'/customer/orders',NULL,4,'Suivi des commandes',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(149,12,0,NULL,NULL,'/about',NULL,0,'Introduire',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(150,12,0,NULL,NULL,'/our-stores',NULL,1,'Boutique',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(151,12,0,NULL,NULL,'/sustainability',NULL,2,'Développement durable',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(152,12,0,NULL,NULL,'/careers',NULL,3,'Recrutement',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(153,12,0,NULL,NULL,'/privacy-policy',NULL,4,'Politique de confidentialité',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(154,12,0,NULL,NULL,'/terms-conditions',NULL,5,'Conditions générales',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(155,13,0,NULL,NULL,'/',NULL,0,'Halaman rumah',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(156,13,0,NULL,NULL,'/products',NULL,1,'Belanja',NULL,'_self',1,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(157,13,156,NULL,NULL,'/products?source=latest',NULL,0,'Pendatang baru',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(158,13,156,NULL,NULL,'/products?sort=best-seller',NULL,1,'Penjual terbaik',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(159,13,156,NULL,NULL,'/products?on_sale=1',NULL,2,'Diskon',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(160,13,156,NULL,NULL,'/products',NULL,3,'Semua produk',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(161,13,0,NULL,NULL,'/products',NULL,2,'Kategori',NULL,'_self',1,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(162,13,161,NULL,NULL,'/product-categories/outerwear',NULL,0,'Jaket',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(163,13,161,NULL,NULL,'/product-categories/tops-shirts',NULL,1,'Kemeja',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(164,13,161,NULL,NULL,'/product-categories/bottoms',NULL,2,'Celana & Rok',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(165,13,161,NULL,NULL,'/product-categories/dresses',NULL,3,'Gaun',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(166,13,161,NULL,NULL,'/product-categories/footwear',NULL,4,'Sepatu',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(167,13,161,NULL,NULL,'/product-categories/accessories',NULL,5,'Aksesori',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(168,13,0,NULL,NULL,'/brands',NULL,3,'Merek dagang',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(169,13,0,NULL,NULL,'/blog',NULL,4,'Majalah',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(170,13,0,NULL,NULL,'/about',NULL,5,'Memperkenalkan',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(171,13,0,NULL,NULL,'/contact',NULL,6,'Kontak',NULL,'_self',0,'2026-05-28 19:03:01','2026-05-28 19:03:01'),(172,14,0,NULL,NULL,'/contact',NULL,0,'Hubungi kami',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(173,14,0,NULL,NULL,'/faq',NULL,1,'Pertanyaan yang sering diajukan',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(174,14,0,NULL,NULL,'/shipping',NULL,2,'Mengangkut',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(175,14,0,NULL,NULL,'/returns-refunds',NULL,3,'Pengembalian & Pengembalian Dana',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(176,14,0,NULL,NULL,'/customer/orders',NULL,4,'Pelacakan pesanan',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(177,15,0,NULL,NULL,'/about',NULL,0,'Memperkenalkan',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(178,15,0,NULL,NULL,'/our-stores',NULL,1,'Toko',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(179,15,0,NULL,NULL,'/sustainability',NULL,2,'Pembangunan berkelanjutan',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(180,15,0,NULL,NULL,'/careers',NULL,3,'Rekrutmen',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(181,15,0,NULL,NULL,'/privacy-policy',NULL,4,'Kebijakan privasi',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(182,15,0,NULL,NULL,'/terms-conditions',NULL,5,'Syarat & Ketentuan',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(183,16,0,NULL,NULL,'/',NULL,0,'Ana sayfa',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(184,16,0,NULL,NULL,'/products',NULL,1,'Alışveriş',NULL,'_self',1,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(185,16,184,NULL,NULL,'/products?source=latest',NULL,0,'Yeni gelenler',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(186,16,184,NULL,NULL,'/products?sort=best-seller',NULL,1,'En çok satan kitap',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(187,16,184,NULL,NULL,'/products?on_sale=1',NULL,2,'İndirim',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(188,16,184,NULL,NULL,'/products',NULL,3,'Tüm ürünler',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(189,16,0,NULL,NULL,'/products',NULL,2,'Kategori',NULL,'_self',1,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(190,16,189,NULL,NULL,'/product-categories/outerwear',NULL,0,'Ceket',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(191,16,189,NULL,NULL,'/product-categories/tops-shirts',NULL,1,'Gömlek',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(192,16,189,NULL,NULL,'/product-categories/bottoms',NULL,2,'Pantolon ve Etekler',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(193,16,189,NULL,NULL,'/product-categories/dresses',NULL,3,'Elbise',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(194,16,189,NULL,NULL,'/product-categories/footwear',NULL,4,'Ayakkabı',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(195,16,189,NULL,NULL,'/product-categories/accessories',NULL,5,'Aksesuar',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(196,16,0,NULL,NULL,'/brands',NULL,3,'Ticari marka',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(197,16,0,NULL,NULL,'/blog',NULL,4,'Dergi',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(198,16,0,NULL,NULL,'/about',NULL,5,'Tanıtmak',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(199,16,0,NULL,NULL,'/contact',NULL,6,'Temas etmek',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(200,17,0,NULL,NULL,'/contact',NULL,0,'Bize Ulaşın',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(201,17,0,NULL,NULL,'/faq',NULL,1,'Sık sorulan sorular',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(202,17,0,NULL,NULL,'/shipping',NULL,2,'Taşıma',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(203,17,0,NULL,NULL,'/returns-refunds',NULL,3,'İade ve Para İadeleri',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(204,17,0,NULL,NULL,'/customer/orders',NULL,4,'Sipariş takibi',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(205,18,0,NULL,NULL,'/about',NULL,0,'Tanıtmak',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(206,18,0,NULL,NULL,'/our-stores',NULL,1,'Mağaza',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(207,18,0,NULL,NULL,'/sustainability',NULL,2,'Sürdürülebilir kalkınma',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(208,18,0,NULL,NULL,'/careers',NULL,3,'işe alım',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(209,18,0,NULL,NULL,'/privacy-policy',NULL,4,'Gizlilik politikası',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02'),(210,18,0,NULL,NULL,'/terms-conditions',NULL,5,'Şartlar ve Koşullar',NULL,'_self',0,'2026-05-28 19:03:02','2026-05-28 19:03:02');
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
INSERT INTO `menus` VALUES (1,'Main Menu','main-menu','published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(2,'Footer Help','footer-help','published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(3,'Footer Company','footer-company','published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(4,'Menu chính','main-menu-vi','published','2026-05-28 19:03:01','2026-05-28 19:03:01'),(5,'Hỗ trợ','footer-help-vi','published','2026-05-28 19:03:01','2026-05-28 19:03:01'),(6,'Công ty','footer-company-vi','published','2026-05-28 19:03:01','2026-05-28 19:03:01'),(7,'القائمة الرئيسية','main-menu-ar','published','2026-05-28 19:03:01','2026-05-28 19:03:01'),(8,'مساعدة التذييل','footer-help-ar','published','2026-05-28 19:03:01','2026-05-28 19:03:01'),(9,'شركة التذييل','footer-company-ar','published','2026-05-28 19:03:01','2026-05-28 19:03:01'),(10,'menu principal','main-menu-fr','published','2026-05-28 19:03:01','2026-05-28 19:03:01'),(11,'aide-pied de page','footer-help-fr','published','2026-05-28 19:03:01','2026-05-28 19:03:01'),(12,'société de pied de page','footer-company-fr','published','2026-05-28 19:03:01','2026-05-28 19:03:01'),(13,'menu utama','main-menu-id','published','2026-05-28 19:03:01','2026-05-28 19:03:01'),(14,'bantuan footer','footer-help-id','published','2026-05-28 19:03:01','2026-05-28 19:03:01'),(15,'perusahaan footer','footer-company-id','published','2026-05-28 19:03:02','2026-05-28 19:03:02'),(16,'ana menü','main-menu-tr','published','2026-05-28 19:03:02','2026-05-28 19:03:02'),(17,'alt bilgi yardımı','footer-help-tr','published','2026-05-28 19:03:02','2026-05-28 19:03:02'),(18,'alt bilgi şirketi','footer-company-tr','published','2026-05-28 19:03:02','2026-05-28 19:03:02');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'subtitle','[\"DISCOVER THE ART OF MODERN DRESSING\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 19:02:44','2026-05-28 19:02:44'),(2,'button_label','[\"Shop Styles\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 19:02:44','2026-05-28 19:02:44'),(3,'alignment','[\"left\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 19:02:44','2026-05-28 19:02:44'),(4,'text_color','[\"dark\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 19:02:44','2026-05-28 19:02:44'),(5,'button_style','[\"pill-dark\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 19:02:44','2026-05-28 19:02:44'),(6,'subtitle','[\"DISCOVER THE ART OF MODERN DRESSING\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 19:02:44','2026-05-28 19:02:44'),(7,'button_label','[\"Shop Styles\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 19:02:44','2026-05-28 19:02:44'),(8,'alignment','[\"left\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 19:02:44','2026-05-28 19:02:44'),(9,'text_color','[\"dark\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 19:02:44','2026-05-28 19:02:44'),(10,'button_style','[\"pill-dark\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 19:02:44','2026-05-28 19:02:44'),(11,'subtitle','[\"DISCOVER THE ART OF MODERN DRESSING\"]',3,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 19:02:44','2026-05-28 19:02:44'),(12,'button_label','[\"Shop Styles\"]',3,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 19:02:44','2026-05-28 19:02:44'),(13,'alignment','[\"left\"]',3,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 19:02:44','2026-05-28 19:02:44'),(14,'text_color','[\"dark\"]',3,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 19:02:44','2026-05-28 19:02:44'),(15,'button_style','[\"pill-dark\"]',3,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 19:02:44','2026-05-28 19:02:44'),(16,'faq_ids','[[2,4,9,10,12]]',1,'Botble\\Ecommerce\\Models\\Product','2026-05-28 19:02:48','2026-05-28 19:02:48'),(17,'faq_ids','[[3,4,8,11,12]]',2,'Botble\\Ecommerce\\Models\\Product','2026-05-28 19:02:48','2026-05-28 19:02:48'),(18,'faq_ids','[[6,9,10,11,12]]',3,'Botble\\Ecommerce\\Models\\Product','2026-05-28 19:02:48','2026-05-28 19:02:48'),(19,'faq_ids','[[1,4,6,8,9]]',4,'Botble\\Ecommerce\\Models\\Product','2026-05-28 19:02:48','2026-05-28 19:02:48'),(20,'faq_ids','[[1,2,6,8,13]]',5,'Botble\\Ecommerce\\Models\\Product','2026-05-28 19:02:49','2026-05-28 19:02:49'),(21,'faq_ids','[[1,4,5,7,12]]',6,'Botble\\Ecommerce\\Models\\Product','2026-05-28 19:02:49','2026-05-28 19:02:49'),(22,'faq_ids','[[1,3,6,9,12]]',7,'Botble\\Ecommerce\\Models\\Product','2026-05-28 19:02:49','2026-05-28 19:02:49'),(23,'faq_ids','[[2,3,6,12,13]]',8,'Botble\\Ecommerce\\Models\\Product','2026-05-28 19:02:49','2026-05-28 19:02:49'),(24,'faq_ids','[[1,2,5,6,8]]',9,'Botble\\Ecommerce\\Models\\Product','2026-05-28 19:02:49','2026-05-28 19:02:49'),(25,'faq_ids','[[4,5,6,8,12]]',10,'Botble\\Ecommerce\\Models\\Product','2026-05-28 19:02:49','2026-05-28 19:02:49'),(26,'faq_ids','[[1,5,8,11,13]]',11,'Botble\\Ecommerce\\Models\\Product','2026-05-28 19:02:49','2026-05-28 19:02:49'),(27,'faq_ids','[[3,9,11,12,13]]',12,'Botble\\Ecommerce\\Models\\Product','2026-05-28 19:02:49','2026-05-28 19:02:49');
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
INSERT INTO `mp_stores` VALUES (1,'Anthro Studio','hello@anthro.example.com','+1-415-555-0142','512 Valencia Street','US','California','San Francisco',2,'testimonials/avatar-1.jpg',NULL,NULL,'Eclectic apparel and home goods inspired by global craftsmanship traditions.','<p>Anthro Studio sources from independent artisans across four continents. Every piece is checked by hand before it ships from our San Francisco fulfilment center.</p>','published',1,NULL,NULL,NULL,NULL,'2026-05-28 19:02:58','2026-05-28 19:02:58','94110','Anthro Studio Inc.',NULL,NULL,NULL,NULL,NULL),(2,'Crate Furniture Co.','orders@crate.example.com','+1-503-555-0188','1840 NE Alberta Street','US','Oregon','Portland',5,'testimonials/avatar-2.jpg',NULL,NULL,'Mid-century-inspired furniture built to last generations.','<p>Every Crate piece is built one at a time in our Portland workshop using sustainably harvested American hardwoods.</p>','published',1,NULL,NULL,NULL,NULL,'2026-05-28 19:02:58','2026-05-28 19:02:58','97211','Crate Furniture Co.',NULL,NULL,NULL,NULL,NULL),(3,'Findr Audio','support@findr.example.com','+44-20-7946-0310','17 Hanbury Street','GB','Greater London','London',3,'testimonials/avatar-3.jpg',NULL,NULL,'Audio gear engineered for studio-grade clarity in everyday environments.','<p>Founded by ex-studio engineers, Findr brings reference-quality sound to wireless headphones and earbuds.</p>','published',1,NULL,NULL,NULL,NULL,'2026-05-28 19:02:58','2026-05-28 19:02:58','E1 6QR','Findr Audio Ltd.',NULL,NULL,NULL,NULL,NULL),(4,'Bohome Living','hello@bohome.example.com','+34-93-555-0122','Carrer de Sepulveda 102','ES','Catalonia','Barcelona',7,'testimonials/avatar-4.jpg',NULL,NULL,'Bohemian-inspired homewares and textiles for the relaxed modern home.','<p>Bohome partners with co-operatives in Morocco, Turkey, and India to bring you authentic, fair-traded textiles.</p>','published',1,NULL,NULL,NULL,NULL,'2026-05-28 19:02:58','2026-05-28 19:02:58','08015','Bohome Living S.L.',NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `pages` VALUES (1,'About','[page-banner heading=\"About Us\" subtitle=\"With over 15 years of experience, we craft timeless collections that transcend<br class=\\\"d-none d-lg-block\\\">trends and inspire lasting elegance.\"][/page-banner]\n[stats-counter hero_image=\"section/s-contact-1.jpg\" heading=\"Design, attention to detail & efficiency to delight the world\" description=\"From the moment it is conceived to the moment it is worn, every one of our garments follows this path. We could do it at a fast pace. However, at Amerce, we choose to take care of all those who are walking this path with us.\" quantity=\"4\" value_1=\"8.2k\" animate_to_1=\"\" suffix_1=\"\" label_1=\"Products Available\" desc_1=\"We offer a wide selection of high-quality products to meet every need.\" value_2=\"\" animate_to_2=\"10\" suffix_2=\"k\" label_2=\"Happy Customers\" desc_2=\"Serving over 10,000 delighted customers who trust us for quality and service.\" value_3=\"\" animate_to_3=\"96\" suffix_3=\"\" label_3=\"Partner Brand\" desc_3=\"Our top-brand partnerships bring a trusted collection for your store and home.\" value_4=\"\" animate_to_4=\"16\" suffix_4=\"k\" label_4=\"Products For Sale\" desc_4=\"That\'s why we strive to offer a diverse range of products that cater to all styles.\"][/stats-counter]\n[image-accordion image=\"section/s-contact-2.jpg\" heading=\"Offering Rare And Beautiful Items Worldwide\" quantity=\"4\" title_1=\"Introduction\" body_1=\"Welcome to Amerce Store, your premier destination for fashion-forward clothing and accessories. We pride ourselves on offering a curated selection of rare and beautiful items sourced both locally and globally.\" title_2=\"Our Vision\" body_2=\"We envision a world where thoughtful design meets everyday life — pieces that age gracefully, partners we trust, and customers we treat as people, not transactions.\" title_3=\"What Sets Us Apart\" body_3=\"Independently audited suppliers, hand-checked products, and a 30-day no-questions return policy backed by a human customer support team.\" title_4=\"Our Commitment\" body_4=\"Quality goods, transparent supply chains, and fair labor — every order, every time.\"][/image-accordion]\n[about-testimonials heading=\"Customer Say!\" subtitle=\"Our customers adore our products, and we constantly aim to delight them.\" quantity=\"2\" image_1=\"testimonials/tes-1.jpg\" name_1=\"Emma Collins\" text_1=\"\\\"Totally obsessed with this outfit! The fit is perfect, the fabric feels premium, and I\'ve been getting compliments non-stop. It instantly lifts my confidence — such a great find!\\\"\" image_2=\"testimonials/tes-2.jpg\" name_2=\"Sophia Ramirez\" text_2=\"\\\"I\'m amazed by how comfortable yet stylish this piece is. It pairs effortlessly with everything, and the quality really stands out. Definitely becoming my go-to for everyday looks!\\\"\"][/about-testimonials]\n[about-team heading=\"Meet Our Teams\" subtitle=\"Experts committed to excellence in every detail.\" quantity=\"4\" image_1=\"member/member-1.jpg\" name_1=\"Annette Black\" role_1=\"Founder/CEO\" social_links_1=\"\" image_2=\"member/member-2.jpg\" name_2=\"Brooklyn Simmons\" role_2=\"Manager\" social_links_2=\"\" image_3=\"member/member-3.jpg\" name_3=\"Jane Cooper\" role_3=\"Sales Director\" social_links_3=\"\" image_4=\"member/member-4.jpg\" name_4=\"Lisa Bonet\" role_4=\"Sales Director\" social_links_4=\"\"][/about-team]',1,NULL,'landing','About Amerce — our story, sourcing standards, and the people behind every product.','published','2026-05-28 19:02:58','2026-05-28 19:02:58'),(2,'Contact','',1,NULL,'landing','Reach the Amerce customer support and partnerships teams.','published','2026-05-28 19:02:58','2026-05-28 19:02:58'),(3,'FAQ','[page-banner heading=\"FAQs\" subtitle=\"Got questions? We\'ve got answers! Browse our FAQs to find information on orders, shipping,<br class=\\\"d-none d-lg-block\\\">returns, and more. If you need further assistance, feel free to contact our team.\"][/page-banner]\n[faq-page sidebar_image=\"section/banner-12.jpg\" sidebar_title=\"Save 25% <br class=\\\"d-none d-sm-block\\\">Today\" sidebar_subtitle=\"T-Shirts, Hoodies & More\" sidebar_cta=\"View More\" sidebar_url=\"/products\" quantity=\"16\" category_1=\"My Account\" category_id_1=\"myAccount\" question_1=\"1. What can I do if I forgot my password?\" answer_1=\"Use the \\\"Forgot password\\\" link on the sign-in page. We will email you a one-time link to set a new password — it expires in 30 minutes for security.\" category_2=\"My Account\" category_id_2=\"myAccount\" question_2=\"2. How do I update my email address?\" answer_2=\"Sign in, open Account → Settings, and change the email field. We send a confirmation email to the new address; the change takes effect once you click that link.\" category_3=\"My Account\" category_id_3=\"myAccount\" question_3=\"3. Can I delete my account?\" answer_3=\"Yes. From Account → Settings, scroll to Delete account. We retain order history for tax/legal reasons but personal contact details are removed within 30 days.\" category_4=\"Orders & Purchases\" category_id_4=\"ordersPurchases\" question_4=\"1. How do I place an order?\" answer_4=\"Add items to your cart, click checkout, choose a shipping method, then enter your payment details. You will receive an order confirmation email immediately.\" category_5=\"Orders & Purchases\" category_id_5=\"ordersPurchases\" question_5=\"2. Can I edit or cancel an order?\" answer_5=\"Orders can be edited or cancelled from your account dashboard within 1 hour of placement. After that the warehouse has begun picking and we cannot intercept.\" category_6=\"Orders & Purchases\" category_id_6=\"ordersPurchases\" question_6=\"3. What payment methods are accepted?\" answer_6=\"We accept Visa, Mastercard, American Express, Apple Pay, Google Pay, and PayPal. All transactions use TLS 1.3 encryption.\" category_7=\"Returns & Refunds\" category_id_7=\"returnsRefunds\" question_7=\"1. What is the return window?\" answer_7=\"30 days from delivery for any unworn item in original condition. Sale items, intimate apparel, and final-sale flash sale purchases are excluded.\" category_8=\"Returns & Refunds\" category_id_8=\"returnsRefunds\" question_8=\"2. How do I start a return?\" answer_8=\"Open the order in your account dashboard and click \\\"Start return\\\". We email a prepaid label for domestic orders within one business day.\" category_9=\"Returns & Refunds\" category_id_9=\"returnsRefunds\" question_9=\"3. When will I see my refund?\" answer_9=\"Refunds are processed within 3-5 business days of us receiving the return. Bank posting times vary; allow up to 10 business days for the credit to appear.\" category_10=\"Shipping & Tracking\" category_id_10=\"shippingTracking\" question_10=\"1. How long does shipping take?\" answer_10=\"Domestic standard ships in 3-5 business days. Express in 1-2. International standard takes 7-12 business days; express options are available at checkout.\" category_11=\"Shipping & Tracking\" category_id_11=\"shippingTracking\" question_11=\"2. How do I track my order?\" answer_11=\"A tracking link is included in your shipment confirmation email. You can also see status from Account → Orders → Track.\" category_12=\"Shipping & Tracking\" category_id_12=\"shippingTracking\" question_12=\"3. Do you ship internationally?\" answer_12=\"Yes — to most countries. Duties and taxes are pre-paid at checkout for select destinations; otherwise the courier may collect them on delivery.\" category_13=\"Fees & Billing\" category_id_13=\"feesBilling\" question_13=\"1. Are duties and taxes included?\" answer_13=\"Domestic prices include sales tax shown at checkout. International orders to supported destinations include duties and taxes; otherwise the courier collects on delivery.\" category_14=\"Fees & Billing\" category_id_14=\"feesBilling\" question_14=\"2. Why was I charged twice?\" answer_14=\"You likely see a temporary authorization hold plus the actual charge. The authorization drops off in 3-5 business days. Email billing@amerce.test if you still see two charges after that.\" category_15=\"Other Topic\" category_id_15=\"otherTopic\" question_15=\"1. Do you have physical stores?\" answer_15=\"Yes — visit our Stores page for a list of flagship and partner locations.\" category_16=\"Other Topic\" category_id_16=\"otherTopic\" question_16=\"2. How can I contact customer support?\" answer_16=\"Email hello@amerce.test or use the contact form. We reply within one business day.\"][/faq-page]',1,NULL,'landing','Frequently asked questions about orders, shipping, returns, and account management.','published','2026-05-28 19:02:58','2026-05-28 19:02:58'),(4,'Privacy Policy','[page-banner heading=\"Privacy Policy\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Information We Collect\" body_1=\"<p class=\\\"term-text cl-text-2\\\">When you visit the Site, we automatically collect certain information about your device — web browser, IP address, time zone, and some of the cookies installed on your device. As you browse, we also collect data about the pages or products you view, what referred you to the Site, and how you interact with it. We refer to this as \\\"Device Information\\\".</p><p class=\\\"term-text cl-text-2\\\">When you make a purchase or attempt to purchase through the Site, we collect your name, billing address, shipping address, and payment information (including card number, email address, and phone number). We refer to this as \\\"Order Information\\\".</p>\" title_2=\"2. How We Use Your Information\" body_2=\"<p class=\\\"term-text cl-text-2\\\">We use Order Information to fulfil orders placed through the Site (process payment, arrange shipping, provide invoices and order confirmations). We use it to communicate with you, screen orders for fraud, and — in line with your preferences — share marketing about products you may like.</p><p class=\\\"term-text cl-text-2\\\">We use Device Information to screen for fraud and to improve the Site through analytics about how customers browse and interact with us.</p>\" title_3=\"3. Sharing Your Personal Information\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We share Personal Information with third-party service providers who help us run the Site. We may also share information to comply with applicable laws, respond to a subpoena or lawful request, or otherwise protect our rights.</p>\" title_4=\"4. Data Retention\" body_4=\"<p class=\\\"term-text cl-text-2\\\">When you place an order, we maintain the Order Information for our records unless and until you ask us to delete it.</p>\" title_5=\"5. Your Rights\" body_5=\"<p class=\\\"term-text cl-text-2\\\">You can request access, correction, or deletion of any personal data we hold about you. Email privacy@amerce.test from the address on file and we will respond within 30 days.</p>\" title_6=\"6. Cookies\" body_6=\"<p class=\\\"term-text cl-text-2\\\">Cookies are used to keep your cart between visits, remember your preferences, and measure aggregate traffic. You can disable cookies in your browser, though some Site features may stop working.</p>\" title_7=\"7. Changes\" body_7=\"<p class=\\\"term-text cl-text-2\\\">We may update this policy from time to time to reflect changes to our practices or for operational, legal, or regulatory reasons. The latest version will always be on this page.</p>\"][/term-content]',1,NULL,'landing','How Amerce collects, uses, and protects your personal information.','published','2026-05-28 19:02:58','2026-05-28 19:02:58'),(5,'Terms &amp; Conditions','[page-banner heading=\"Terms & Conditions\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Acceptance of Terms\" body_1=\"<p class=\\\"term-text cl-text-2\\\">By accessing or using the Amerce store you agree to these terms. We reserve the right to update them with reasonable notice; the latest version is always available on this page.</p>\" title_2=\"2. Orders & Payment\" body_2=\"<p class=\\\"term-text cl-text-2\\\">All prices are in USD unless otherwise stated. We accept the payment methods displayed at checkout. An order becomes binding once you receive an order confirmation email.</p>\" title_3=\"3. Shipping\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Shipping options, lead times, and rates are listed on our Shipping page. Risk passes to you on delivery.</p>\" title_4=\"4. Returns\" body_4=\"<p class=\\\"term-text cl-text-2\\\">You have 30 days from delivery to return any unworn item for a refund. See our Returns &amp; Refunds page for the full process.</p>\" title_5=\"5. Intellectual Property\" body_5=\"<p class=\\\"term-text cl-text-2\\\">All content on the Site — text, photography, logos, code — is owned by Amerce or its licensors and may not be reproduced without written permission.</p>\" title_6=\"6. Limitation of Liability\" body_6=\"<p class=\\\"term-text cl-text-2\\\">To the maximum extent permitted by law, Amerce is not liable for indirect or consequential damages arising from use of the Site or the products purchased through it.</p>\" title_7=\"7. Governing Law\" body_7=\"<p class=\\\"term-text cl-text-2\\\">These terms are governed by the laws of the State of New York. Any dispute will be resolved in the state or federal courts located in New York County.</p>\"][/term-content]',1,NULL,'landing','The legal terms governing your use of the Amerce store.','published','2026-05-28 19:02:58','2026-05-28 19:02:58'),(6,'Returns &amp; Refunds','[page-banner heading=\"Returns & Refunds\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Returns\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We want you to be completely satisfied with your purchase. If for any reason you are not, you may return any unworn item within 30 days of receiving your order for a refund or exchange. Items must be in original packaging and the same condition as you received them.</p>\" title_2=\"2. How to Start a Return\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Open the order in your account dashboard and click \\\"Start return\\\", or email returns@amerce.test with your order number. We will send a prepaid return label for domestic orders within one business day.</p>\" title_3=\"3. Refunds\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Refunds are processed within 3-5 business days of us receiving the return and applied to the original payment method. Bank posting times vary; allow up to 10 business days for the credit to appear.</p>\" title_4=\"4. Exclusions\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Sale items, intimate apparel, and final-sale flash sale purchases are excluded from returns. Personalised or made-to-order items are also non-returnable unless faulty.</p>\" title_5=\"5. Damaged or Faulty Items\" body_5=\"<p class=\\\"term-text cl-text-2\\\">If your order arrives damaged or faulty, email us within 7 days with photos. We will replace the item or issue a full refund — including any return shipping cost — at our expense.</p>\" title_6=\"6. International Returns\" body_6=\"<p class=\\\"term-text cl-text-2\\\">International customers are responsible for return shipping unless the item is faulty. We do not refund original shipping or duty charges on international returns.</p>\"][/term-content]',1,NULL,'landing','Our 30-day return policy and the step-by-step return process.','published','2026-05-28 19:02:58','2026-05-28 19:02:58'),(7,'Shipping','[page-banner heading=\"Shipping\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Shipping Methods\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We offer the following shipping methods for domestic and international orders: standard ground, expedited 2-day, and priority overnight (where available).</p>\" title_2=\"2. Domestic Rates\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Standard ground is free on orders over $99. Express 1-2 day shipping is $19.99 flat. Priority overnight is calculated by weight at checkout.</p>\" title_3=\"3. International\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We ship to most countries. International standard shipping is $24.99 with 7-12 business day delivery. Express options appear at checkout. Duties and taxes are pre-paid for select destinations; otherwise the courier collects them on delivery.</p>\" title_4=\"4. Processing Time\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Orders placed before 2pm EST on business days ship the same day. Orders placed after 2pm or on weekends/holidays ship the next business day.</p>\" title_5=\"5. Tracking\" body_5=\"<p class=\\\"term-text cl-text-2\\\">A tracking link is included in your shipment confirmation email. You can also see live status from Account → Orders → Track.</p>\" title_6=\"6. Lost or Stuck Shipments\" body_6=\"<p class=\\\"term-text cl-text-2\\\">If a tracking number has not updated for more than 7 business days, email shipping@amerce.test. We will open an investigation with the carrier and either refund or reship the order at our expense.</p>\"][/term-content]',1,NULL,'landing','Domestic and international shipping options, lead times, and rates.','published','2026-05-28 19:02:58','2026-05-28 19:02:58'),(8,'Our Stores','',1,NULL,'landing','Visit Amerce in person — flagship locations and partner boutiques worldwide.','published','2026-05-28 19:02:58','2026-05-28 19:02:58'),(9,'Blog','<div class=\"container py-5\"><h1>Journal</h1><p>Browse our latest stories — style guides, product spotlights, sustainability deep-dives, and more.</p></div>',1,NULL,'default','Style guides, product spotlights, and stories from the Amerce team.','published','2026-05-28 19:02:58','2026-05-28 19:02:58'),(10,'Careers','<div class=\"container py-5\"><h1>Careers at Amerce</h1><p>We are a small, distributed team building a more thoughtful kind of retail. We hire across product, engineering, supply chain, and customer experience.</p><p>Open roles are posted to our company LinkedIn page. To apply, send a short note and your resume to <a href=\"mailto:careers@amerce.test\">careers@amerce.test</a>.</p></div>',1,NULL,'default','Open roles and what it is like to work at Amerce.','published','2026-05-28 19:02:58','2026-05-28 19:02:58'),(11,'Sustainability','<div class=\"container py-5\"><h1>Sustainability at Amerce</h1><p>Every product carries a story. We work directly with mills and ateliers, prioritise recycled and traceable materials, and ship in plastic-free packaging.</p><p>Our 2026 goal: 90% of materials with a verified chain of custody, and a transparent annual impact report.</p></div>',1,NULL,'default','How Amerce sources responsibly and reduces its environmental footprint.','published','2026-05-28 19:02:58','2026-05-28 19:02:58'),(12,'Homepage','[simple-slider key=\"home-hero\" style=\"style-1\" is_autoplay=\"yes\" autoplay_speed=\"5000\" show_arrows=\"yes\" show_dots=\"yes\" nav_arrow_class=\"tf-sw-nav-2 d-lg-flex d-none\" nav_arrow_icon_prev=\"icon-ArrowLeft\" nav_arrow_icon_next=\"icon-ArrowRight\"][/simple-slider]\n[categories-grid style=\"style-slider\" limit=\"5\" show_count=\"yes\" wrapper_class=\"container-layout-right\" card_extra_modifier=\"style-2\" swiper_preview=\"4.3605\" swiper_preview_lg=\"4.3605\" card_image_size=\"original\" count_overrides=\"78,120,48,62,36\" count_label=\"items\"][/categories-grid]\n[ecommerce-products style=\"style-tabs\" limit=\"8\" items_per_row=\"4\" grid_rows=\"2\" section_class=\"ecommerce-products ecommerce-products--style-tabs flat-spacing pt-0\" tab_labels=\"New Arrivals|Best Sellers|On Sale\" tab_categories=\"||\" tab_sources=\"latest|best-seller|sale\" tab_nav_style=\"v3\" tab_nav_class_extra=\"style-4 justify-content-sm-center mb-0\" tab_btn_class_extra=\"py-4\" tab_label_class=\"h4\"][/ecommerce-products]\n[banner-thumbs-product style=\"style-thumbs-v2\" heading=\"Slim Ribbed Cotton T-Shirt\" subheading=\"Slim Ribbed Cotton T-Shirt top\'s minimal design focuses on user needs and allows to adapt and support many environments.\" product_ids=\"1,2,3\" square_image_1=\"products/fashion-2/square/product-1-2.jpg\" square_image_2=\"products/fashion-2/square/product-2-2.jpg\" square_image_3=\"products/fashion-2/square/product-4-2.jpg\"][/banner-thumbs-product]\n[ecommerce-collections style=\"style-accordion-tabs\" title=\"Curated Collections For Style\" subtitle=\"Thoughtfully designed fashion pieces defining modern elegance.\" collection_ids=\"1,2,3,4\" container_class=\"container\" card_modifier=\"style-2 st-2_2\" accordion_modifier=\"style-2\" title_class=\"h5 fw-medium\" button_text=\"Shop Collections\" button_url=\"/products\" image_size=\"original\"][/ecommerce-collections]\n[infinity-marquee style=\"style-1\" background_class=\"bg-main-2\" spacing_class=\"\" clone_count=\"3\" quantity=\"6\" heading_1=\"Modern Minimalism\" image_1=\"collection/cls-34.jpg\" link_1=\"/products\" heading_2=\"Artisan Craftsmanship\" image_2=\"collection/cls-35.jpg\" link_2=\"/products\" heading_3=\"Sustainable Luxury\" image_3=\"collection/cls-36.jpg\" link_3=\"/products\" heading_4=\"Luxe and Livable\" image_4=\"collection/cls-37.jpg\" link_4=\"/products\" heading_5=\"Confidence in Every Step\" image_5=\"collection/cls-38.jpg\" link_5=\"/products\" heading_6=\"Curated Confidence\" image_6=\"collection/cls-3.jpg\" link_6=\"/products\"][/infinity-marquee]\n[ecommerce-products style=\"style-slider-side-heading\" title=\"Featured Sweaters and Knits\" subtitle=\"Our curated knitwear collection for maximum warmth and flawless style.\" source=\"featured\" limit=\"6\" items_per_row=\"3\" view_all_url=\"/products\" view_all_text=\"View All Products\"][/ecommerce-products]\n[testimonials style=\"style-v4\" title=\"What Our Customers Say\" subtitle=\"Real stories from people who love our products.\" autoplay=\"yes\" limit=\"6\" card_modifier=\"style-2\" container_class=\"container-full\" preview=\"3\" bg_main=\"yes\" view_all_url=\"/products\" view_all_text=\"Read All Reviews\" section_class=\"flat-spacing pt-0\" testimonial_product_ids=\"1,4,9\"][/testimonials]\n[image-gallery style=\"style-default\" title=\"Follow Us On Instagram\" subtitle=\"@Amerce\" skip_spacing=\"yes\" extra_section_class=\"px-10 pb-40\" quantity=\"5\" image_1=\"gallery/gallery-52.jpg\" link_1=\"/products\" image_2=\"gallery/gallery-53.jpg\" link_2=\"/products\" image_3=\"gallery/gallery-54.jpg\" link_3=\"/products\" image_4=\"gallery/gallery-55.jpg\" link_4=\"/products\" image_5=\"gallery/gallery-56.jpg\" link_5=\"/products\"][/image-gallery]',NULL,NULL,'homepage','Amerce — multi-purpose ecommerce homepage demo.','published','2026-05-28 19:03:01','2026-05-28 19:03:01');
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
INSERT INTO `pages_translations` VALUES ('ar',1,'عن','تقديم Amerce - قصة العلامة التجارية ومعايير التوريد والفريق الذي يقف وراء كل منتج.','[page-banner heading=\"معلومات عنا\" subtitle=\"With over 15 years of experience, we craft timeless collections that transcend<br class=\\\"d-none d-lg-block\\\">trends and inspire lasting elegance.\"][/page-banner]\n[stats-counter hero_image=\"section/s-contact-1.jpg\" heading=\"التصميم والاهتمام بالتفاصيل والكفاءة يرضي العالم\" description=\"منذ لحظة تصورها وحتى لحظة ارتدائها، يتبع كل منتج من منتجاتنا هذه الرحلة. يمكننا أن نفعل ذلك بمعدل أسرع. ومع ذلك، في Amerce، نختار الاعتناء بكل من يشارك معنا في هذه الرحلة.\" quantity=\"4\" value_1=\"8.2k\" animate_to_1=\"\" suffix_1=\"\" label_1=\"المنتجات الموجودة\" desc_1=\"نحن نقدم مجموعة متنوعة من المنتجات عالية الجودة لتلبية جميع الاحتياجات.\" value_2=\"\" animate_to_2=\"10\" suffix_2=\"k\" label_2=\"العملاء الراضين\" desc_2=\"نخدم أكثر من 10,000 عميل راضٍ يثقون بنا من حيث الجودة والخدمة.\" value_3=\"\" animate_to_3=\"96\" suffix_3=\"\" label_3=\"العلامة التجارية الشريكة\" desc_3=\"تجلب الشراكات مع العلامات التجارية الرائدة مجموعات موثوقة إلى متجرك ومنزلك.\" value_4=\"\" animate_to_4=\"16\" suffix_4=\"k\" label_4=\"منتجات للبيع\" desc_4=\"ولهذا السبب نسعى جاهدين لتقديم مجموعة متنوعة من خطوط الإنتاج، المناسبة لكل نمط.\"][/stats-counter]\n[image-accordion image=\"section/s-contact-2.jpg\" heading=\"جلب العناصر النادرة والرائعة إلى جميع أنحاء العالم\" quantity=\"4\" title_1=\"يقدم\" body_1=\"مرحبًا بك في متجر Amerce، وجهتك الأولى للأزياء والإكسسوارات العصرية. نحن فخورون بتقديم مجموعة مختارة بعناية من القطع النادرة والرائعة المطلوبة على الصعيدين الوطني والدولي.\" title_2=\"رؤيتنا\" body_2=\"نحن نهدف إلى عالم يمتزج فيه التصميم المتطور مع الحياة اليومية - المنتجات التي تصمد أمام اختبار الزمن، والشركاء الموثوق بهم، والعملاء الذين يتم التعامل معهم مثل الأشخاص، وليس المعاملات.\" title_3=\"ما الذي يجعل الفرق\" body_3=\"يتم تدقيق الموردين بشكل مستقل، ويتم اختبار المنتجات يدويًا، وتوجد سياسة إرجاع بدون سبب لمدة 30 يومًا، مدعومة بفريق خدمة عملاء متخصص.\" title_4=\"التزامنا\" body_4=\"منتجات عالية الجودة وسلاسل توريد شفافة وظروف عمل عادلة - في كل طلب وفي كل مرة.\"][/image-accordion]\n[about-testimonials heading=\"ماذا يقول العملاء!\" subtitle=\"العملاء يحبون منتجاتنا، ونحن نسعى جاهدين لإرضائهم.\" quantity=\"2\" image_1=\"testimonials/tes-1.jpg\" name_1=\"إيما كولينز\" text_1=\"\\\"Totally obsessed with this outfit! The fit is perfect, the fabric feels premium, and I\'ve been getting compliments non-stop. It instantly lifts my confidence — such a great find!\\\"\" image_2=\"testimonials/tes-2.jpg\" name_2=\"صوفيا راميريز\" text_2=\"\\\"I\'m amazed by how comfortable yet stylish this piece is. It pairs effortlessly with everything, and the quality really stands out. Definitely becoming my go-to for everyday looks!\\\"\"][/about-testimonials]\n[about-team heading=\"تعرف على الفريق\" subtitle=\"محترفون ملتزمون بالإتقان في كل التفاصيل.\" quantity=\"4\" image_1=\"member/member-1.jpg\" name_1=\"أنيت بلاك\" role_1=\"المؤسس/الرئيس التنفيذي\" social_links_1=\"\" image_2=\"member/member-2.jpg\" name_2=\"بروكلين سيمونز\" role_2=\"يدير\" social_links_2=\"\" image_3=\"member/member-3.jpg\" name_3=\"جين كوبر\" role_3=\"مدير المبيعات\" social_links_3=\"\" image_4=\"member/member-4.jpg\" name_4=\"ليزا بونيت\" role_4=\"مدير المبيعات\" social_links_4=\"\"][/about-team]'),('ar',2,'اتصال','اتصل بفريق خدمة العملاء والتعاون في Amerce.',''),('ar',3,'FAQ','الأسئلة المتداولة حول الطلبات والشحن والمرتجعات وإدارة الحساب.','[page-banner heading=\"الأسئلة المتداولة\" subtitle=\"Got questions? We\'ve got answers! Browse our الأسئلة المتداولة to find information on orders, shipping,<br class=\\\"d-none d-lg-block\\\">returns, and more. If you need further assistance, feel free to contact our team.\"][/page-banner]\n[faq-page sidebar_image=\"section/banner-12.jpg\" sidebar_title=\"Save 25% <br class=\\\"d-none d-sm-block\\\">Today\" sidebar_subtitle=\"قمصان، هوديس وأكثر\" sidebar_cta=\"شاهد المزيد\" sidebar_url=\"/products\" quantity=\"16\" category_1=\"حسابي\" category_id_1=\"myAccount\" question_1=\"1. ماذا يمكنني أن أفعل إذا نسيت كلمة المرور الخاصة بي؟\" answer_1=\"Use the \\\"Forgot password\\\" link on the sign-in page. We will email you a one-time link to set a new password — it expires in 30 minutes for security.\" category_2=\"حسابي\" category_id_2=\"myAccount\" question_2=\"2. كيفية تحديث عنوان البريد الإلكتروني؟\" answer_2=\"قم بتسجيل الدخول، افتح الحساب → الإعدادات وقم بتغيير حقول البريد الإلكتروني. سنرسل رسالة تأكيد بالبريد الإلكتروني إلى العنوان الجديد؛ سيصبح التغيير ساري المفعول عندما تنقر على هذا الرابط.\" category_3=\"حسابي\" category_id_3=\"myAccount\" question_3=\"3. هل يمكنني حذف حسابي؟\" answer_3=\"يملك. من الحساب → الإعدادات، قم بالتمرير لأسفل إلى حذف الحساب. نحن نحتفظ بسجل الطلبات لأسباب ضريبية/قانونية، ولكن يتم حذف معلومات الاتصال الشخصية خلال 30 يومًا.\" category_4=\"الطلبات والتسوق\" category_id_4=\"ordersPurchases\" question_4=\"1. كيف تطلب؟\" answer_4=\"قم بإضافة المنتجات إلى سلة التسوق، ثم انقر فوق إتمام الطلب، ثم حدد طريقة الشحن، ثم أدخل معلومات الدفع. سوف تتلقى رسالة تأكيد الطلب عبر البريد الإلكتروني على الفور.\" category_5=\"الطلبات والتسوق\" category_id_5=\"ordersPurchases\" question_5=\"2. هل يمكنني تعديل أو إلغاء طلبي؟\" answer_5=\"يمكن تعديل الطلبات أو إلغاؤها من لوحة تحكم حسابك خلال ساعة واحدة من تقديمها. بعد ذلك بدأ المستودع بالتعبئة ولم نتمكن من التدخل.\" category_6=\"الطلبات والتسوق\" category_id_6=\"ordersPurchases\" question_6=\"3. ما هي طرق الدفع المقبولة؟\" answer_6=\"نحن نقبل Visa وMastercard وAmerican Express وApple Pay وGoogle Pay وPayPal. تستخدم جميع المعاملات تشفير TLS 1.3.\" category_7=\"العوائد والمبالغ المستردة\" category_id_7=\"returnsRefunds\" question_7=\"1. ما هي مدة الإرجاع؟\" answer_7=\"30 يومًا من تاريخ الاستلام للمنتجات غير المستخدمة وغير المستهلكة. لا ينطبق على سلع البيع والملابس الداخلية وعناصر البيع الفوري.\" category_8=\"العوائد والمبالغ المستردة\" category_id_8=\"returnsRefunds\" question_8=\"2. كيف أبدأ عملية الإرجاع؟\" answer_8=\"Open the order in your account dashboard and click \\\"Start return\\\". We email a prepaid label for domestic orders within one business day.\" category_9=\"العوائد والمبالغ المستردة\" category_id_9=\"returnsRefunds\" question_9=\"3. متى سأسترد أموالي؟\" answer_9=\"تتم معالجة المبالغ المستردة في غضون 3-5 أيام عمل من تاريخ استلامنا للمنتج المرتجع. قد تختلف أوقات الائتمان البنكي؛ يُرجى الانتظار لمدة تصل إلى 10 أيام عمل حتى تظهر دفعتك.\" category_10=\"الشحن والتتبع\" category_id_10=\"shippingTracking\" question_10=\"1. كم من الوقت يستغرق الشحن؟\" answer_10=\"يستغرق الشحن المحلي القياسي من 3 إلى 5 أيام عمل. الشحن السريع 1-2 أيام. يستغرق الشحن القياسي الدولي من 7 إلى 12 يوم عمل؛ تتوفر خيارات الشحن المعجل في صفحة الخروج.\" category_11=\"الشحن والتتبع\" category_id_11=\"shippingTracking\" question_11=\"2. كيفية تتبع الطلبات؟\" answer_11=\"يتم تضمين رابط التتبع في رسالة البريد الإلكتروني لتأكيد الشحن. يمكنك أيضًا عرض الحالة من الحساب → الطلبات → التتبع.\" category_12=\"الشحن والتتبع\" category_id_12=\"shippingTracking\" question_12=\"3. هل تشحن دوليًا؟\" answer_12=\"نعم – لمعظم البلدان. يتم دفع الضرائب والرسوم مسبقًا في صفحة الخروج لوجهات معينة؛ إذا لم يكن الأمر كذلك، يجوز لوحدة الشحن جمعها عند التسليم.\" category_13=\"الرسوم والمدفوعات\" category_id_13=\"feesBilling\" question_13=\"1. هل يشمل السعر الضرائب والرسوم؟\" answer_13=\"الأسعار المحلية تشمل ضريبة المبيعات الموضحة عند الخروج. تشمل الطلبات الدولية للوجهات المدعومة الضرائب والرسوم؛ وبخلاف ذلك، ستقوم وحدة الشحن باستلامها عند التسليم.\" category_14=\"الرسوم والمدفوعات\" category_id_14=\"feesBilling\" question_14=\"2. لماذا تم محاسبتي مرتين؟\" answer_14=\"ربما ترى تعليقًا للتفويض بالإضافة إلى الرسوم الفعلية. سيتم إلغاء الحجز تلقائيًا خلال 3-5 أيام عمل. أرسل بريدًا إلكترونيًا إلى billing@amerce.test إذا كنت لا تزال ترى رسومين بعد ذلك الوقت.\" category_15=\"موضوعات أخرى\" category_id_15=\"otherTopic\" question_15=\"1. هل لديك متجر فعلي؟\" answer_15=\"نعم — يرجى زيارة صفحة المتاجر للحصول على قائمة بالمتاجر الرئيسية والشركاء.\" category_16=\"موضوعات أخرى\" category_id_16=\"otherTopic\" question_16=\"2. كيفية الاتصال بخدمة العملاء؟\" answer_16=\"أرسل بريدًا إلكترونيًا إلى hello@amerce.test أو استخدم نموذج الاتصال. سوف نقوم بالرد خلال يوم عمل واحد.\"][/faq-page]'),('ar',4,'سياسة الخصوصية','كيف تقوم Amerce بجمع معلوماتك الشخصية واستخدامها وحمايتها.','[page-banner heading=\"سياسة الخصوصية\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. المعلومات التي نجمعها\" body_1=\"<p class=\\\"term-text cl-text-2\\\">When you visit the Site, we automatically collect certain information about your device — web browser, IP address, time zone, and some of the cookies installed on your device. As you browse, we also collect data about the pages or products you view, what referred you to the Site, and how you interact with it. We refer to this as \\\"Device Information\\\".</p><p class=\\\"term-text cl-text-2\\\">When you make a purchase or attempt to purchase through the Site, we collect your name, billing address, shipping address, and payment information (including card number, email address, and phone number). We refer to this as \\\"Order Information\\\".</p>\" title_2=\"2. كيف نستخدم معلوماتك\" body_2=\"<p class=\\\"term-text cl-text-2\\\">We use Order Information to fulfil orders placed through the Site (process payment, arrange shipping, provide invoices and order confirmations). We use it to communicate with you, screen orders for fraud, and — in line with your preferences — share marketing about products you may like.</p><p class=\\\"term-text cl-text-2\\\">We use Device Information to screen for fraud and to improve the Site through analytics about how customers browse and interact with us.</p>\" title_3=\"3. مشاركة معلوماتك الشخصية\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We share Personal Information with third-party service providers who help us run the Site. We may also share information to comply with applicable laws, respond to a subpoena or lawful request, or otherwise protect our rights.</p>\" title_4=\"4. تخزين البيانات\" body_4=\"<p class=\\\"term-text cl-text-2\\\">When you place an order, we maintain the Order Information for our records unless and until you ask us to delete it.</p>\" title_5=\"5. حقوقك\" body_5=\"<p class=\\\"term-text cl-text-2\\\">You can request access, correction, or deletion of any personal data we hold about you. Email privacy@amerce.test from the address on file and we will respond within 30 days.</p>\" title_6=\"6. ملفات تعريف الارتباط\" body_6=\"<p class=\\\"term-text cl-text-2\\\">Cookies are used to keep your cart between visits, remember your preferences, and measure aggregate traffic. You can disable cookies in your browser, though some Site features may stop working.</p>\" title_7=\"7. التغيير\" body_7=\"<p class=\\\"term-text cl-text-2\\\">We may update this policy from time to time to reflect changes to our practices or for operational, legal, or regulatory reasons. The latest version will always be on this page.</p>\"][/term-content]'),('ar',5,'الشروط والأحكام','تنطبق الشروط القانونية عند استخدام متجر Amerce.','[page-banner heading=\"الشروط والأحكام\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. قبول الشروط\" body_1=\"<p class=\\\"term-text cl-text-2\\\">By accessing or using the أميرس store you agree to these terms. We reserve the right to update them with reasonable notice; the latest version is always available on this page.</p>\" title_2=\"2. الطلبات والدفع\" body_2=\"<p class=\\\"term-text cl-text-2\\\">All prices are in USD unless otherwise stated. We accept the payment methods displayed at checkout. An order becomes binding once you receive an order confirmation email.</p>\" title_3=\"3. الشحن\" body_3=\"<p class=\\\"term-text cl-text-2\\\">ينقل options, lead times, and rates are listed on our ينقل page. Risk passes to you on delivery.</p>\" title_4=\"4. المرتجعات\" body_4=\"<p class=\\\"term-text cl-text-2\\\">You have 30 days from delivery to return any unworn item for a refund. See our العوائد والمبالغ المستردة page for the full process.</p>\" title_5=\"5. الملكية الفكرية\" body_5=\"<p class=\\\"term-text cl-text-2\\\">All content on the Site — text, photography, logos, code — is owned by أميرس or its licensors and may not be reproduced without written permission.</p>\" title_6=\"6. حدود المسؤولية\" body_6=\"<p class=\\\"term-text cl-text-2\\\">To the maximum extent permitted by law, أميرس is not liable for indirect or consequential damages arising from use of the Site or the products purchased through it.</p>\" title_7=\"7. القانون المعمول به\" body_7=\"<p class=\\\"term-text cl-text-2\\\">These terms are governed by the laws of the State of New York. Any dispute will be resolved in the state or federal courts located in New York County.</p>\"][/term-content]'),('ar',6,'العوائد والمبالغ المستردة','سياسة الإرجاع الخاصة بنا لمدة 30 يومًا وعملية الإرجاع خطوة بخطوة.','[page-banner heading=\"العوائد والمبالغ المستردة\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. المرتجعات\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We want you to be completely satisfied with your purchase. If for any reason you are not, you may return any unworn item within 30 days of receiving your order for a refund or exchange. أغراض must be in original packaging and the same condition as you received them.</p>\" title_2=\"2. كيف تبدأ عملية الإرجاع\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Open the order in your account dashboard and click \\\"Start return\\\", or email returns@amerce.test with your order number. We will send a prepaid return label for domestic orders within one business day.</p>\" title_3=\"3. استرداد الأموال\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Refunds are processed within 3-5 business days of us receiving the return and applied to the original payment method. Bank posting times vary; allow up to 10 business days for the credit to appear.</p>\" title_4=\"4. الاستثناءات\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Sale items, intimate apparel, and final-sale flash sale purchases are excluded from returns. Personalised or made-to-order items are also non-returnable unless faulty.</p>\" title_5=\"5. المنتجات التالفة أو المعيبة\" body_5=\"<p class=\\\"term-text cl-text-2\\\">If your order arrives damaged or faulty, email us within 7 days with photos. We will replace the item or issue a full refund — including any return shipping cost — at our expense.</p>\" title_6=\"6. العودة الدولية\" body_6=\"<p class=\\\"term-text cl-text-2\\\">International customers are responsible for return shipping unless the item is faulty. We do not refund original shipping or duty charges on international returns.</p>\"][/term-content]'),('ar',7,'شحن','طرق الشحن المحلي والدولي وأوقاته ورسومه.','[page-banner heading=\"ينقل\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. طريقة الشحن\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We offer the following shipping methods for domestic and international orders: standard ground, expedited 2-day, and priority overnight (where available).</p>\" title_2=\"2. الرسوم المحلية\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Standard ground is free on orders over $99. Express 1-2 day shipping is $19.99 flat. Priority overnight is calculated by weight at checkout.</p>\" title_3=\"3. الدولية\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We ship to most countries. International standard shipping is $24.99 with 7-12 business day delivery. Express options appear at checkout. Duties and taxes are pre-paid for select destinations; otherwise the courier collects them on delivery.</p>\" title_4=\"4. وقت المعالجة\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Orders placed before 2pm EST on business days ship the same day. Orders placed after 2pm or on weekends/holidays ship the next business day.</p>\" title_5=\"5. التتبع\" body_5=\"<p class=\\\"term-text cl-text-2\\\">A tracking link is included in your shipment confirmation email. You can also see live status from Account → Orders → Track.</p>\" title_6=\"6. الطلبات المفقودة أو المعلقة\" body_6=\"<p class=\\\"term-text cl-text-2\\\">If a tracking number has not updated for more than 7 business days, email shipping@amerce.test. We will open an investigation with the carrier and either refund or reship the order at our expense.</p>\"][/term-content]'),('ar',8,'متاجرنا','قم بزيارة Amerce مباشرة — المتاجر الرئيسية والشركاء في جميع أنحاء العالم.',''),('ar',9,'Blog','تعليمات الزي وقصص العلامات التجارية والمحتوى من وراء الكواليس من فريق تحرير Amerce.','<div class=\"container py-5\"><h1>مذكرة</h1><p>اكتشف أحدث قصصنا - أدلة الأسلوب، وأبرز المنتجات، وتحليل الاستدامة المتعمق والمزيد.</p></div>'),('ar',10,'وظائف','انضم إلى Amerce - المناصب المفتوحة والقيم الثقافية وفوائد الفريق.','<div class=\"container py-5\"><h1>التوظيف في Amerce</h1><p>نحن فريق صغير وموزع لبناء نموذج بيع بالتجزئة أكثر دقة. نقوم بالتوظيف عبر المنتجات والهندسة وسلسلة التوريد وتجربة العملاء.</p><p>يتم نشر الوظائف المفتوحة على صفحة LinkedIn الخاصة بالشركة. للتقديم، أرسل خطابًا قصيرًا واستأنفه إلى <a href=\"mailto:careers@amerce.test\">careers@amerce.test</a>.</p></div>'),('ar',11,'Sustainability','How Amerce sources responsibly and reduces its environmental footprint.','<div class=\"container py-5\"><h1>التنمية المستدامة في أمريكا</h1><p>كل منتج يحمل قصة. نحن نعمل مباشرة مع المصانع وورش العمل الحرفية، ونعطي الأولوية للمواد المعاد تدويرها والتي يمكن تتبعها، ونقوم بتغليف عبوات خالية من البلاستيك.</p><p>هدفنا لعام 2026: أن يكون لدى 90% من المواد سلسلة توريد تم التحقق منها وتقارير تأثير سنوية شفافة.</p></div>'),('ar',12,'الصفحة الرئيسية','Amerce — موطن لتجربة التجارة الإلكترونية المتنوعة.','[simple-slider key=\"home-hero\" style=\"style-1\" is_autoplay=\"yes\" autoplay_speed=\"5000\" show_arrows=\"yes\" show_dots=\"yes\" nav_arrow_class=\"tf-sw-nav-2 d-lg-flex d-none\" nav_arrow_icon_prev=\"icon-ArrowLeft\" nav_arrow_icon_next=\"icon-ArrowRight\"][/simple-slider]\n[categories-grid style=\"style-slider\" limit=\"5\" show_count=\"yes\" wrapper_class=\"container-layout-right\" card_extra_modifier=\"style-2\" swiper_preview=\"4.3605\" swiper_preview_lg=\"4.3605\" card_image_size=\"original\" count_overrides=\"78,120,48,62,36\" count_label=\"items\"][/categories-grid]\n[ecommerce-products style=\"style-tabs\" limit=\"8\" items_per_row=\"4\" grid_rows=\"2\" section_class=\"ecommerce-products ecommerce-products--style-tabs flat-spacing pt-0\" tab_labels=\"الوافدون الجدد|الأكثر مبيعًا|للبيع\" tab_categories=\"||\" tab_sources=\"latest|best-seller|sale\" tab_nav_style=\"v3\" tab_nav_class_extra=\"style-4 justify-content-sm-center mb-0\" tab_btn_class_extra=\"py-4\" tab_label_class=\"h4\"][/ecommerce-products]\n[banner-thumbs-product style=\"style-thumbs-v2\" heading=\"تي شيرت قطن مضلع رفيع\" subheading=\"يركز التصميم البسيط للقميص القطني المضلع على احتياجات المستخدم، مما يسمح له بالتكيف ومناسب للعديد من البيئات.\" product_ids=\"1,2,3\" square_image_1=\"products/fashion-2/square/product-1-2.jpg\" square_image_2=\"products/fashion-2/square/product-2-2.jpg\" square_image_3=\"products/fashion-2/square/product-4-2.jpg\"][/banner-thumbs-product]\n[ecommerce-collections style=\"style-accordion-tabs\" title=\"مجموعة منسقة للأسلوب\" subtitle=\"تحدد عناصر الموضة المصممة بدقة الأناقة الحديثة.\" collection_ids=\"1,2,3,4\" container_class=\"container\" card_modifier=\"style-2 st-2_2\" accordion_modifier=\"style-2\" title_class=\"h5 fw-medium\" button_text=\"شراء المجموعة\" button_url=\"/products\" image_size=\"original\"][/ecommerce-collections]\n[infinity-marquee style=\"style-1\" background_class=\"bg-main-2\" spacing_class=\"\" clone_count=\"3\" quantity=\"6\" heading_1=\"بساطتها الحديثة\" image_1=\"collection/cls-34.jpg\" link_1=\"/products\" heading_2=\"براعة\" image_2=\"collection/cls-35.jpg\" link_2=\"/products\" heading_3=\"الرفاهية المستدامة\" image_3=\"collection/cls-36.jpg\" link_3=\"/products\" heading_4=\"فاخرة ومريحة\" image_4=\"collection/cls-37.jpg\" link_4=\"/products\" heading_5=\"الثقة في كل خطوة\" image_5=\"collection/cls-38.jpg\" link_5=\"/products\" heading_6=\"الثقة المنسقة\" image_6=\"collection/cls-3.jpg\" link_6=\"/products\"][/infinity-marquee]\n[ecommerce-products style=\"style-slider-side-heading\" title=\"البلوزات والأشياء الصوفية المتميزة\" subtitle=\"توفر مجموعتنا الصوفية المنسقة أقصى قدر من الدفء والأناقة التي لا تشوبها شائبة.\" source=\"featured\" limit=\"6\" items_per_row=\"3\" view_all_url=\"/products\" view_all_text=\"عرض جميع المنتجات\"][/ecommerce-products]\n[testimonials style=\"style-v4\" title=\"ماذا يقول العملاء عنا\" subtitle=\"قصص حقيقية من الأشخاص الذين يحبون منتجاتنا.\" autoplay=\"yes\" limit=\"6\" card_modifier=\"style-2\" container_class=\"container-full\" preview=\"3\" bg_main=\"yes\" view_all_url=\"/products\" view_all_text=\"قراءة جميع التقييمات\" section_class=\"flat-spacing pt-0\" testimonial_product_ids=\"1,4,9\"][/testimonials]\n[image-gallery style=\"style-default\" title=\"تابعونا على الانستقرام\" subtitle=\"@أميرسي\" skip_spacing=\"yes\" extra_section_class=\"px-10 pb-40\" quantity=\"5\" image_1=\"gallery/gallery-52.jpg\" link_1=\"/products\" image_2=\"gallery/gallery-53.jpg\" link_2=\"/products\" image_3=\"gallery/gallery-54.jpg\" link_3=\"/products\" image_4=\"gallery/gallery-55.jpg\" link_4=\"/products\" image_5=\"gallery/gallery-56.jpg\" link_5=\"/products\"][/image-gallery]'),('fr',1,'À propos','Présentation d\'Amerce - histoire de la marque, normes d\'approvisionnement et équipe derrière chaque produit.','[page-banner heading=\"À propos de nous\" subtitle=\"With over 15 years of experience, we craft timeless collections that transcend<br class=\\\"d-none d-lg-block\\\">trends and inspire lasting elegance.\"][/page-banner]\n[stats-counter hero_image=\"section/s-contact-1.jpg\" heading=\"Le design, l’attention aux détails et l’efficacité plaisent au monde\" description=\"De sa conception jusqu\'à son port, chacun de nos produits suit ce voyage. Nous pouvons le faire à un rythme plus rapide. Cependant, chez Amerce, nous choisissons de prendre soin de tous ceux qui font ce voyage avec nous.\" quantity=\"4\" value_1=\"8.2k\" animate_to_1=\"\" suffix_1=\"\" label_1=\"Produits existants\" desc_1=\"Nous proposons une variété de produits de haute qualité pour répondre à tous les besoins.\" value_2=\"\" animate_to_2=\"10\" suffix_2=\"k\" label_2=\"Clients satisfaits\" desc_2=\"Au service de plus de 10 000 clients satisfaits qui nous font confiance pour la qualité et le service.\" value_3=\"\" animate_to_3=\"96\" suffix_3=\"\" label_3=\"Marque partenaire\" desc_3=\"Les partenariats avec de grandes marques apportent des collections de confiance dans votre magasin et chez vous.\" value_4=\"\" animate_to_4=\"16\" suffix_4=\"k\" label_4=\"Produits à vendre\" desc_4=\"C\'est pourquoi nous nous efforçons de proposer une variété de gammes de produits, adaptées à chaque style.\"][/stats-counter]\n[image-accordion image=\"section/s-contact-2.jpg\" heading=\"Apporter des objets rares et exquis dans le monde entier\" quantity=\"4\" title_1=\"Introduire\" body_1=\"Bienvenue chez Amerce Store, votre destination privilégiée pour la mode et les accessoires avant-gardistes. Nous sommes fiers d\'offrir une collection soigneusement sélectionnée de pièces rares et exquises recherchées tant au niveau national qu\'international.\" title_2=\"Notre vision\" body_2=\"Nous visons un monde où le design sophistiqué se mêle à la vie quotidienne : des produits qui résistent à l\'épreuve du temps, des partenaires de confiance et des clients traités comme des personnes et non comme des transactions.\" title_3=\"Ce qui fait la différence\" body_3=\"Les fournisseurs sont audités de manière indépendante, les produits sont testés manuellement et il existe une politique de retour sans motif de 30 jours, soutenue par une équipe de service client dédiée.\" title_4=\"Notre engagement\" body_4=\"Des produits de qualité, des chaînes d\'approvisionnement transparentes et des conditions de travail équitables : à chaque commande, à chaque fois.\"][/image-accordion]\n[about-testimonials heading=\"Ce que disent les clients !\" subtitle=\"Les clients aiment nos produits et nous nous efforçons de leur plaire.\" quantity=\"2\" image_1=\"testimonials/tes-1.jpg\" name_1=\"Emma Collins\" text_1=\"\\\"Totally obsessed with this outfit! The fit is perfect, the fabric feels premium, and I\'ve been getting compliments non-stop. It instantly lifts my confidence — such a great find!\\\"\" image_2=\"testimonials/tes-2.jpg\" name_2=\"Sophie Ramírez\" text_2=\"\\\"I\'m amazed by how comfortable yet stylish this piece is. It pairs effortlessly with everything, and the quality really stands out. Definitely becoming my go-to for everyday looks!\\\"\"][/about-testimonials]\n[about-team heading=\"Rencontrez l\'équipe\" subtitle=\"Des professionnels dédiés à la perfection dans les moindres détails.\" quantity=\"4\" image_1=\"member/member-1.jpg\" name_1=\"Annette Noir\" role_1=\"Fondateur/PDG\" social_links_1=\"\" image_2=\"member/member-2.jpg\" name_2=\"Brooklyn Simmons\" role_2=\"Gérer\" social_links_2=\"\" image_3=\"member/member-3.jpg\" name_3=\"Jane Cooper\" role_3=\"Directeur des ventes\" social_links_3=\"\" image_4=\"member/member-4.jpg\" name_4=\"Lisa Bonet\" role_4=\"Directeur des ventes\" social_links_4=\"\"][/about-team]'),('fr',2,'Contact','Contactez l\'équipe de service client et de coopération d\'Amerce.',''),('fr',3,'FAQ','Questions fréquemment posées sur les commandes, l\'expédition, les retours et la gestion des comptes.','[page-banner heading=\"Foire aux questions\" subtitle=\"Got questions? We\'ve got answers! Browse our Foire aux questions to find information on orders, shipping,<br class=\\\"d-none d-lg-block\\\">returns, and more. If you need further assistance, feel free to contact our team.\"][/page-banner]\n[faq-page sidebar_image=\"section/banner-12.jpg\" sidebar_title=\"Save 25% <br class=\\\"d-none d-sm-block\\\">Today\" sidebar_subtitle=\"T-shirts, sweats à capuche et plus\" sidebar_cta=\"Voir plus\" sidebar_url=\"/products\" quantity=\"16\" category_1=\"Mon compte\" category_id_1=\"myAccount\" question_1=\"1. Que puis-je faire si j\'oublie mon mot de passe ?\" answer_1=\"Use the \\\"Forgot password\\\" link on the sign-in page. We will email you a one-time link to set a new password — it expires in 30 minutes for security.\" category_2=\"Mon compte\" category_id_2=\"myAccount\" question_2=\"2. Comment mettre à jour l\'adresse e-mail ?\" answer_2=\"Connectez-vous, ouvrez Compte → Paramètres et modifiez les champs de courrier électronique. Nous enverrons un e-mail de confirmation à la nouvelle adresse ; Le changement prendra effet lorsque vous cliquerez sur ce lien.\" category_3=\"Mon compte\" category_id_3=\"myAccount\" question_3=\"3. Puis-je supprimer mon compte ?\" answer_3=\"Avoir. Dans Compte → Paramètres, faites défiler jusqu\'à Supprimer le compte. Nous conservons l\'historique des commandes pour des raisons fiscales/légales, mais les coordonnées personnelles sont supprimées dans les 30 jours.\" category_4=\"Commandes et achats\" category_id_4=\"ordersPurchases\" question_4=\"1. Comment commander ?\" answer_4=\"Ajoutez des produits au panier, cliquez sur Commander, sélectionnez le mode d\'expédition, puis saisissez les informations de paiement. Vous recevrez immédiatement un e-mail de confirmation de commande.\" category_5=\"Commandes et achats\" category_id_5=\"ordersPurchases\" question_5=\"2. Puis-je modifier ou annuler ma commande ?\" answer_5=\"Les commandes peuvent être modifiées ou annulées à partir du tableau de bord de votre compte dans l\'heure suivant leur passation. Après cela, l\'entrepôt a commencé à emballer et nous n\'avons pas pu intervenir.\" category_6=\"Commandes et achats\" category_id_6=\"ordersPurchases\" question_6=\"3. Quels modes de paiement sont acceptés ?\" answer_6=\"Nous acceptons Visa, Mastercard, American Express, Apple Pay, Google Pay et PayPal. Toutes les transactions utilisent le cryptage TLS 1.3.\" category_7=\"Retours et remboursements\" category_id_7=\"returnsRefunds\" question_7=\"1. Quelle est la durée du délai de retour ?\" answer_7=\"30 jours à compter de la date de réception pour les produits non utilisés et non portés. Non applicable aux articles soldés, aux sous-vêtements et aux articles en vente flash en vente finale.\" category_8=\"Retours et remboursements\" category_id_8=\"returnsRefunds\" question_8=\"2. Comment démarrer le processus de retour ?\" answer_8=\"Open the order in your account dashboard and click \\\"Start return\\\". We email a prepaid label for domestic orders within one business day.\" category_9=\"Retours et remboursements\" category_id_9=\"returnsRefunds\" question_9=\"3. Quand recevrai-je mon remboursement ?\" answer_9=\"Les remboursements sont traités dans les 3 à 5 jours ouvrables à compter de la réception de l\'article retourné. Les délais de crédit bancaire peuvent varier ; Veuillez prévoir jusqu\'à 10 jours ouvrables pour voir votre paiement reflété.\" category_10=\"Expédition et suivi\" category_id_10=\"shippingTracking\" question_10=\"1. Combien de temps prend l’expédition ?\" answer_10=\"L\'expédition nationale standard prend 3 à 5 jours ouvrables. Expédition rapide 1-2 jours. L\'expédition standard internationale prend 7 à 12 jours ouvrables ; Des options d\'expédition accélérée sont disponibles sur la page de paiement.\" category_11=\"Expédition et suivi\" category_id_11=\"shippingTracking\" question_11=\"2. Comment suivre les commandes ?\" answer_11=\"Le lien de suivi est inclus dans l\'e-mail de confirmation d\'expédition. Vous pouvez également afficher le statut depuis Compte → Commandes → Suivi.\" category_12=\"Expédition et suivi\" category_id_12=\"shippingTracking\" question_12=\"3. Expédiez-vous à l’international ?\" answer_12=\"Oui, dans la plupart des pays. Les taxes et frais sont prépayés sur la page de paiement pour certaines destinations ; Dans le cas contraire, l\'unité d\'expédition pourra le récupérer à la livraison.\" category_13=\"Frais et paiements\" category_id_13=\"feesBilling\" question_13=\"1. Les taxes et frais sont-ils inclus ?\" answer_13=\"Les prix nationaux incluent la taxe de vente indiquée au moment du paiement. Les commandes internationales vers les destinations prises en charge incluent les taxes et les frais ; Dans le cas contraire, l\'unité d\'expédition le récupérera à la livraison.\" category_14=\"Frais et paiements\" category_id_14=\"feesBilling\" question_14=\"2. Pourquoi ai-je été facturé deux fois ?\" answer_14=\"Vous voyez peut-être une autorisation retenue avec le montant réel des frais. La retenue sera automatiquement annulée dans un délai de 3 à 5 jours ouvrables. Envoyez un e-mail à billing@amerce.test si vous voyez toujours deux frais après cette heure.\" category_15=\"Autres sujets\" category_id_15=\"otherTopic\" question_15=\"1. Avez-vous un magasin physique ?\" answer_15=\"Oui, veuillez visiter la page Magasins pour une liste des principaux magasins et partenaires.\" category_16=\"Autres sujets\" category_id_16=\"otherTopic\" question_16=\"2. Comment contacter le service client ?\" answer_16=\"Envoyez un e-mail à hello@amerce.test ou utilisez le formulaire de contact. Nous vous répondrons dans un délai d\'un jour ouvrable.\"][/faq-page]'),('fr',4,'politique de confidentialité','Comment Amerce collecte, utilise et protège vos informations personnelles.','[page-banner heading=\"politique de confidentialité\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Informations que nous collectons\" body_1=\"<p class=\\\"term-text cl-text-2\\\">When you visit the Site, we automatically collect certain information about your device — web browser, IP address, time zone, and some of the cookies installed on your device. As you browse, we also collect data about the pages or products you view, what referred you to the Site, and how you interact with it. We refer to this as \\\"Device Information\\\".</p><p class=\\\"term-text cl-text-2\\\">When you make a purchase or attempt to purchase through the Site, we collect your name, billing address, shipping address, and payment information (including card number, email address, and phone number). We refer to this as \\\"Order Information\\\".</p>\" title_2=\"2. Comment nous utilisons vos informations\" body_2=\"<p class=\\\"term-text cl-text-2\\\">We use Order Information to fulfil orders placed through the Site (process payment, arrange shipping, provide invoices and order confirmations). We use it to communicate with you, screen orders for fraud, and — in line with your preferences — share marketing about products you may like.</p><p class=\\\"term-text cl-text-2\\\">We use Device Information to screen for fraud and to improve the Site through analytics about how customers browse and interact with us.</p>\" title_3=\"3. Partage de vos informations personnelles\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We share Personal Information with third-party service providers who help us run the Site. We may also share information to comply with applicable laws, respond to a subpoena or lawful request, or otherwise protect our rights.</p>\" title_4=\"4. Stockage des données\" body_4=\"<p class=\\\"term-text cl-text-2\\\">When you place an order, we maintain the Order Information for our records unless and until you ask us to delete it.</p>\" title_5=\"5. Vos droits\" body_5=\"<p class=\\\"term-text cl-text-2\\\">You can request access, correction, or deletion of any personal data we hold about you. Email privacy@amerce.test from the address on file and we will respond within 30 days.</p>\" title_6=\"6. Cookies\" body_6=\"<p class=\\\"term-text cl-text-2\\\">Cookies are used to keep your cart between visits, remember your preferences, and measure aggregate traffic. You can disable cookies in your browser, though some Site features may stop working.</p>\" title_7=\"7. Changement\" body_7=\"<p class=\\\"term-text cl-text-2\\\">We may update this policy from time to time to reflect changes to our practices or for operational, legal, or regulatory reasons. The latest version will always be on this page.</p>\"][/term-content]'),('fr',5,'Conditions générales','Les conditions légales s\'appliquent lorsque vous utilisez la boutique Amerce.','[page-banner heading=\"Conditions générales\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Acceptation des conditions\" body_1=\"<p class=\\\"term-text cl-text-2\\\">By accessing or using the Amérique store you agree to these terms. We reserve the right to update them with reasonable notice; the latest version is always available on this page.</p>\" title_2=\"2. Commandes et paiement\" body_2=\"<p class=\\\"term-text cl-text-2\\\">All prices are in USD unless otherwise stated. We accept the payment methods displayed at checkout. An order becomes binding once you receive an order confirmation email.</p>\" title_3=\"3. Expédition\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Transport options, lead times, and rates are listed on our Transport page. Risk passes to you on delivery.</p>\" title_4=\"4. Retours\" body_4=\"<p class=\\\"term-text cl-text-2\\\">You have 30 days from delivery to return any unworn item for a refund. See our Retours et remboursements page for the full process.</p>\" title_5=\"5. Propriété intellectuelle\" body_5=\"<p class=\\\"term-text cl-text-2\\\">All content on the Site — text, photography, logos, code — is owned by Amérique or its licensors and may not be reproduced without written permission.</p>\" title_6=\"6. Limitation de responsabilité\" body_6=\"<p class=\\\"term-text cl-text-2\\\">To the maximum extent permitted by law, Amérique is not liable for indirect or consequential damages arising from use of the Site or the products purchased through it.</p>\" title_7=\"7. Loi applicable\" body_7=\"<p class=\\\"term-text cl-text-2\\\">These terms are governed by the laws of the State of New York. Any dispute will be resolved in the state or federal courts located in New York County.</p>\"][/term-content]'),('fr',6,'Retours et remboursements','Notre politique de retour de 30 jours et notre processus de retour étape par étape.','[page-banner heading=\"Retours et remboursements\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Retours\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We want you to be completely satisfied with your purchase. If for any reason you are not, you may return any unworn item within 30 days of receiving your order for a refund or exchange. Articles must be in original packaging and the same condition as you received them.</p>\" title_2=\"2. Comment démarrer un retour\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Open the order in your account dashboard and click \\\"Start return\\\", or email returns@amerce.test with your order number. We will send a prepaid return label for domestic orders within one business day.</p>\" title_3=\"3. Remboursement\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Refunds are processed within 3-5 business days of us receiving the return and applied to the original payment method. Bank posting times vary; allow up to 10 business days for the credit to appear.</p>\" title_4=\"4. Exclusions\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Sale items, intimate apparel, and final-sale flash sale purchases are excluded from returns. Personalised or made-to-order items are also non-returnable unless faulty.</p>\" title_5=\"5. Produits endommagés ou défectueux\" body_5=\"<p class=\\\"term-text cl-text-2\\\">If your order arrives damaged or faulty, email us within 7 days with photos. We will replace the item or issue a full refund — including any return shipping cost — at our expense.</p>\" title_6=\"6. Retours internationaux\" body_6=\"<p class=\\\"term-text cl-text-2\\\">International customers are responsible for return shipping unless the item is faulty. We do not refund original shipping or duty charges on international returns.</p>\"][/term-content]'),('fr',7,'Expédition','Méthodes, délais et frais d\'expédition nationaux et internationaux.','[page-banner heading=\"Transport\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Méthode d\'expédition\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We offer the following shipping methods for domestic and international orders: standard ground, expedited 2-day, and priority overnight (where available).</p>\" title_2=\"2. Frais nationaux\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Standard ground is free on orders over $99. Express 1-2 day shipping is $19.99 flat. Priority overnight is calculated by weight at checkout.</p>\" title_3=\"3. Internationale\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We ship to most countries. International standard shipping is $24.99 with 7-12 business day delivery. Express options appear at checkout. Duties and taxes are pre-paid for select destinations; otherwise the courier collects them on delivery.</p>\" title_4=\"4. Délai de traitement\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Orders placed before 2pm EST on business days ship the same day. Orders placed after 2pm or on weekends/holidays ship the next business day.</p>\" title_5=\"5. Suivi\" body_5=\"<p class=\\\"term-text cl-text-2\\\">A tracking link is included in your shipment confirmation email. You can also see live status from Account → Orders → Track.</p>\" title_6=\"6. Commandes perdues ou bloquées\" body_6=\"<p class=\\\"term-text cl-text-2\\\">If a tracking number has not updated for more than 7 business days, email shipping@amerce.test. We will open an investigation with the carrier and either refund or reship the order at our expense.</p>\"][/term-content]'),('fr',8,'Nos magasins','Visitez Amerce directement – ​​magasins phares et partenaires dans le monde entier.',''),('fr',9,'Blog','Instructions de tenue, histoires de marque et contenu en coulisses de l\'équipe éditoriale d\'Amerce.','<div class=\"container py-5\"><h1>Agenda</h1><p>Découvrez nos dernières histoires : guides de style, produits phares, analyse approfondie de la durabilité et bien plus encore.</p></div>'),('fr',10,'Carrières','Rejoignez Amerce - postes ouverts, valeurs culturelles et avantages d\'équipe.','<div class=\"container py-5\"><h1>Recrutement chez Amerce</h1><p>Nous sommes une petite équipe distribuée construisant un modèle de vente au détail plus raffiné. Nous recrutons dans les domaines des produits, de l\'ingénierie, de la chaîne d\'approvisionnement et de l\'expérience client.</p><p>Les postes vacants sont publiés sur la page LinkedIn de l\'entreprise. Pour postuler, envoyez une courte lettre et un curriculum vitae à <a href=\"mailto:careers@amerce.test\">careers@amerce.test</a>.</p></div>'),('fr',11,'Sustainability','How Amerce sources responsibly and reduces its environmental footprint.','<div class=\"container py-5\"><h1>Développement durable en Amérique</h1><p>Chaque produit porte une histoire. Nous travaillons directement avec des usines et des ateliers d\'artisans, priorisons les matériaux recyclés et traçables et emballons sans plastique.</p><p>Notre objectif 2026 : 90 % des matériaux disposent d\'une chaîne d\'approvisionnement vérifiée et d\'un rapport d\'impact annuel transparent.</p></div>'),('fr',12,'Page d\'accueil','Amerce – abrite une expérience de commerce électronique polyvalente.','[simple-slider key=\"home-hero\" style=\"style-1\" is_autoplay=\"yes\" autoplay_speed=\"5000\" show_arrows=\"yes\" show_dots=\"yes\" nav_arrow_class=\"tf-sw-nav-2 d-lg-flex d-none\" nav_arrow_icon_prev=\"icon-ArrowLeft\" nav_arrow_icon_next=\"icon-ArrowRight\"][/simple-slider]\n[categories-grid style=\"style-slider\" limit=\"5\" show_count=\"yes\" wrapper_class=\"container-layout-right\" card_extra_modifier=\"style-2\" swiper_preview=\"4.3605\" swiper_preview_lg=\"4.3605\" card_image_size=\"original\" count_overrides=\"78,120,48,62,36\" count_label=\"items\"][/categories-grid]\n[ecommerce-products style=\"style-tabs\" limit=\"8\" items_per_row=\"4\" grid_rows=\"2\" section_class=\"ecommerce-products ecommerce-products--style-tabs flat-spacing pt-0\" tab_labels=\"Nouveautés|Meilleur vendeur|En vente\" tab_categories=\"||\" tab_sources=\"latest|best-seller|sale\" tab_nav_style=\"v3\" tab_nav_class_extra=\"style-4 justify-content-sm-center mb-0\" tab_btn_class_extra=\"py-4\" tab_label_class=\"h4\"][/ecommerce-products]\n[banner-thumbs-product style=\"style-thumbs-v2\" heading=\"T-shirt slim en coton côtelé\" subheading=\"Le design minimaliste du t-shirt en coton côtelé se concentre sur les besoins de l\'utilisateur, lui permettant de s\'adapter et de s\'adapter à de nombreux environnements.\" product_ids=\"1,2,3\" square_image_1=\"products/fashion-2/square/product-1-2.jpg\" square_image_2=\"products/fashion-2/square/product-2-2.jpg\" square_image_3=\"products/fashion-2/square/product-4-2.jpg\"][/banner-thumbs-product]\n[ecommerce-collections style=\"style-accordion-tabs\" title=\"Collection organisée pour le style\" subtitle=\"Des articles de mode méticuleusement conçus définissent l’élégance moderne.\" collection_ids=\"1,2,3,4\" container_class=\"container\" card_modifier=\"style-2 st-2_2\" accordion_modifier=\"style-2\" title_class=\"h5 fw-medium\" button_text=\"Acheter une collection\" button_url=\"/products\" image_size=\"original\"][/ecommerce-collections]\n[infinity-marquee style=\"style-1\" background_class=\"bg-main-2\" spacing_class=\"\" clone_count=\"3\" quantity=\"6\" heading_1=\"Minimalisme moderne\" image_1=\"collection/cls-34.jpg\" link_1=\"/products\" heading_2=\"Artisanat\" image_2=\"collection/cls-35.jpg\" link_2=\"/products\" heading_3=\"Luxe durable\" image_3=\"collection/cls-36.jpg\" link_3=\"/products\" heading_4=\"Luxueux et pratique\" image_4=\"collection/cls-37.jpg\" link_4=\"/products\" heading_5=\"Confiance à chaque étape\" image_5=\"collection/cls-38.jpg\" link_5=\"/products\" heading_6=\"Confiance organisée\" image_6=\"collection/cls-3.jpg\" link_6=\"/products\"][/infinity-marquee]\n[ecommerce-products style=\"style-slider-side-heading\" title=\"Pulls et articles en laine remarquables\" subtitle=\"Notre collection de laine sélectionnée offre une chaleur maximale et un style impeccable.\" source=\"featured\" limit=\"6\" items_per_row=\"3\" view_all_url=\"/products\" view_all_text=\"Voir tous les produits\"][/ecommerce-products]\n[testimonials style=\"style-v4\" title=\"Ce que les clients disent de nous\" subtitle=\"Des histoires vraies de personnes qui aiment nos produits.\" autoplay=\"yes\" limit=\"6\" card_modifier=\"style-2\" container_class=\"container-full\" preview=\"3\" bg_main=\"yes\" view_all_url=\"/products\" view_all_text=\"Lire tous les avis\" section_class=\"flat-spacing pt-0\" testimonial_product_ids=\"1,4,9\"][/testimonials]\n[image-gallery style=\"style-default\" title=\"Suivez-nous sur Instagram\" subtitle=\"@Amerce\" skip_spacing=\"yes\" extra_section_class=\"px-10 pb-40\" quantity=\"5\" image_1=\"gallery/gallery-52.jpg\" link_1=\"/products\" image_2=\"gallery/gallery-53.jpg\" link_2=\"/products\" image_3=\"gallery/gallery-54.jpg\" link_3=\"/products\" image_4=\"gallery/gallery-55.jpg\" link_4=\"/products\" image_5=\"gallery/gallery-56.jpg\" link_5=\"/products\"][/image-gallery]'),('id',1,'Tentang','Memperkenalkan Amerce — kisah merek, standar pasokan, dan tim di balik setiap produk.','[page-banner heading=\"Tentang Kami\" subtitle=\"With over 15 years of experience, we craft timeless collections that transcend<br class=\\\"d-none d-lg-block\\\">trends and inspire lasting elegance.\"][/page-banner]\n[stats-counter hero_image=\"section/s-contact-1.jpg\" heading=\"Desain, perhatian terhadap detail dan efisiensi menyenangkan dunia\" description=\"Dari saat dirancang hingga dipakai, setiap produk kami mengikuti perjalanan ini. Kita bisa melakukannya dengan lebih cepat. Namun, di Amerce, kami memilih untuk menjaga semua orang yang melakukan perjalanan bersama kami.\" quantity=\"4\" value_1=\"8.2k\" animate_to_1=\"\" suffix_1=\"\" label_1=\"Produk yang Ada\" desc_1=\"Kami menawarkan berbagai produk berkualitas tinggi untuk memenuhi setiap kebutuhan.\" value_2=\"\" animate_to_2=\"10\" suffix_2=\"k\" label_2=\"Pelanggan yang Puas\" desc_2=\"Melayani lebih dari 10.000 pelanggan yang puas dan mempercayai kami untuk kualitas dan layanan.\" value_3=\"\" animate_to_3=\"96\" suffix_3=\"\" label_3=\"Merek Mitra\" desc_3=\"Kemitraan dengan merek terkemuka menghadirkan koleksi tepercaya ke toko dan rumah Anda.\" value_4=\"\" animate_to_4=\"16\" suffix_4=\"k\" label_4=\"Produk Dijual\" desc_4=\"Itu sebabnya kami berusaha menghadirkan beragam lini produk, cocok untuk setiap gaya.\"][/stats-counter]\n[image-accordion image=\"section/s-contact-2.jpg\" heading=\"Membawa Barang Langka dan Indah ke Seluruh Dunia\" quantity=\"4\" title_1=\"Memperkenalkan\" body_1=\"Selamat datang di Amerce Store, tujuan utama Anda untuk fashion dan aksesoris penentu tren. Kami bangga menawarkan koleksi barang langka dan indah yang dipilih dengan cermat yang dicari baik secara nasional maupun internasional.\" title_2=\"Visi kami\" body_2=\"Kami bertujuan untuk mewujudkan dunia di mana desain canggih berpadu dengan kehidupan sehari-hari — produk yang bertahan dalam ujian waktu, mitra yang tepercaya, dan pelanggan yang diperlakukan seperti manusia, bukan transaksi.\" title_3=\"Apa yang Membuat Perbedaan\" body_3=\"Pemasok diaudit secara independen, produk diuji secara manual, dan terdapat kebijakan pengembalian tanpa alasan selama 30 hari, yang didukung oleh tim layanan pelanggan khusus.\" title_4=\"Komitmen kami\" body_4=\"Produk berkualitas, rantai pasokan yang transparan, dan kondisi tenaga kerja yang adil — setiap pesanan, setiap saat.\"][/image-accordion]\n[about-testimonials heading=\"Apa Kata Pelanggan!\" subtitle=\"Pelanggan menyukai produk kami, dan kami berusaha menyenangkan mereka.\" quantity=\"2\" image_1=\"testimonials/tes-1.jpg\" name_1=\"Emma Collins\" text_1=\"\\\"Totally obsessed with this outfit! The fit is perfect, the fabric feels premium, and I\'ve been getting compliments non-stop. It instantly lifts my confidence — such a great find!\\\"\" image_2=\"testimonials/tes-2.jpg\" name_2=\"Sophia Ramirez\" text_2=\"\\\"I\'m amazed by how comfortable yet stylish this piece is. It pairs effortlessly with everything, and the quality really stands out. Definitely becoming my go-to for everyday looks!\\\"\"][/about-testimonials]\n[about-team heading=\"Temui Tim\" subtitle=\"Profesional yang berdedikasi pada kesempurnaan dalam setiap detail.\" quantity=\"4\" image_1=\"member/member-1.jpg\" name_1=\"Annette Hitam\" role_1=\"Pendiri/CEO\" social_links_1=\"\" image_2=\"member/member-2.jpg\" name_2=\"Brooklyn Simmons\" role_2=\"Mengelola\" social_links_2=\"\" image_3=\"member/member-3.jpg\" name_3=\"Jane Cooper\" role_3=\"Direktur Penjualan\" social_links_3=\"\" image_4=\"member/member-4.jpg\" name_4=\"Lisa Bonet\" role_4=\"Direktur Penjualan\" social_links_4=\"\"][/about-team]'),('id',2,'Kontak','Hubungi tim layanan pelanggan dan kerja sama Amerce.',''),('id',3,'FAQ','Pertanyaan yang sering diajukan tentang pesanan, pengiriman, pengembalian, dan manajemen akun.','[page-banner heading=\"Pertanyaan yang Sering Diajukan\" subtitle=\"Got questions? We\'ve got answers! Browse our Pertanyaan yang Sering Diajukan to find information on orders, shipping,<br class=\\\"d-none d-lg-block\\\">returns, and more. If you need further assistance, feel free to contact our team.\"][/page-banner]\n[faq-page sidebar_image=\"section/banner-12.jpg\" sidebar_title=\"Save 25% <br class=\\\"d-none d-sm-block\\\">Today\" sidebar_subtitle=\"T-Shirt, Hoodie, dan Lainnya\" sidebar_cta=\"Lihat Lebih Banyak\" sidebar_url=\"/products\" quantity=\"16\" category_1=\"Akun Saya\" category_id_1=\"myAccount\" question_1=\"1. Apa yang dapat saya lakukan jika saya lupa kata sandi?\" answer_1=\"Use the \\\"Forgot password\\\" link on the sign-in page. We will email you a one-time link to set a new password — it expires in 30 minutes for security.\" category_2=\"Akun Saya\" category_id_2=\"myAccount\" question_2=\"2. Bagaimana cara memperbarui alamat email?\" answer_2=\"Masuk, buka Akun → Pengaturan dan ubah bidang email. Kami akan mengirimkan email konfirmasi ke alamat baru; Perubahan akan berlaku ketika Anda mengeklik tautan itu.\" category_3=\"Akun Saya\" category_id_3=\"myAccount\" question_3=\"3. Bisakah saya menghapus akun saya?\" answer_3=\"Memiliki. Dari Akun → Pengaturan, gulir ke bawah ke Hapus akun. Kami menyimpan riwayat pesanan karena alasan pajak/hukum, tetapi informasi kontak pribadi akan dihapus dalam waktu 30 hari.\" category_4=\"Pemesanan & Belanja\" category_id_4=\"ordersPurchases\" question_4=\"1. Bagaimana cara memesannya?\" answer_4=\"Tambahkan produk ke keranjang, klik checkout, pilih metode pengiriman, lalu masukkan informasi pembayaran. Anda akan segera menerima email konfirmasi pesanan.\" category_5=\"Pemesanan & Belanja\" category_id_5=\"ordersPurchases\" question_5=\"2. Bisakah saya mengedit atau membatalkan pesanan saya?\" answer_5=\"Pesanan dapat diedit atau dibatalkan dari dasbor akun Anda dalam waktu 1 jam setelah penempatan. Setelah itu, gudang mulai berkemas dan kami tidak bisa campur tangan.\" category_6=\"Pemesanan & Belanja\" category_id_6=\"ordersPurchases\" question_6=\"3. Metode pembayaran apa yang diterima?\" answer_6=\"Kami menerima Visa, Mastercard, American Express, Apple Pay, Google Pay, dan PayPal. Semua transaksi menggunakan enkripsi TLS 1.3.\" category_7=\"Pengembalian & Pengembalian Dana\" category_id_7=\"returnsRefunds\" question_7=\"1. Berapa lama periode pengembaliannya?\" answer_7=\"30 hari sejak tanggal penerimaan untuk produk yang belum terpakai dan belum dipakai. Tidak berlaku untuk item sale, pakaian dalam, dan item flash sale penjualan akhir.\" category_8=\"Pengembalian & Pengembalian Dana\" category_id_8=\"returnsRefunds\" question_8=\"2. Bagaimana cara memulai proses pengembalian?\" answer_8=\"Open the order in your account dashboard and click \\\"Start return\\\". We email a prepaid label for domestic orders within one business day.\" category_9=\"Pengembalian & Pengembalian Dana\" category_id_9=\"returnsRefunds\" question_9=\"3. Kapan saya akan menerima pengembalian dana saya?\" answer_9=\"Pengembalian dana diproses dalam 3-5 hari kerja sejak kami menerima barang yang dikembalikan. Waktu kredit bank mungkin berbeda; Harap tunggu hingga 10 hari kerja agar pembayaran Anda terlihat.\" category_10=\"Pengiriman & Pelacakan\" category_id_10=\"shippingTracking\" question_10=\"1. Berapa lama waktu pengiriman?\" answer_10=\"Pengiriman domestik standar memakan waktu 3-5 hari kerja. Pengiriman cepat 1-2 hari. Pengiriman standar internasional memakan waktu 7-12 hari kerja; Opsi pengiriman yang dipercepat tersedia di halaman checkout.\" category_11=\"Pengiriman & Pelacakan\" category_id_11=\"shippingTracking\" question_11=\"2. Bagaimana cara melacak pesanan?\" answer_11=\"Tautan pelacakan disertakan dalam email konfirmasi pengiriman. Anda juga dapat melihat status dari Akun → Pesanan → Pelacakan.\" category_12=\"Pengiriman & Pelacakan\" category_id_12=\"shippingTracking\" question_12=\"3. Apakah Anda mengirim secara internasional?\" answer_12=\"Ya — di sebagian besar negara. Pajak dan biaya dibayar di muka di halaman checkout untuk tujuan tertentu; Jika tidak, unit pengiriman dapat mengambilnya pada saat pengiriman.\" category_13=\"Biaya & Pembayaran\" category_id_13=\"feesBilling\" question_13=\"1. Apakah sudah termasuk pajak dan biaya?\" answer_13=\"Harga domestik termasuk pajak penjualan yang ditunjukkan saat checkout. Pesanan internasional ke tujuan yang didukung sudah termasuk pajak dan biaya; Jika tidak, unit pengiriman akan mengambilnya pada saat pengiriman.\" category_14=\"Biaya & Pembayaran\" category_id_14=\"feesBilling\" question_14=\"2. Mengapa saya ditagih dua kali?\" answer_14=\"Anda mungkin melihat penangguhan otorisasi bersama dengan tagihan sebenarnya. Penangguhan akan otomatis dibatalkan dalam 3-5 hari kerja. Kirim email ke billing@amerce.test jika Anda masih melihat dua tagihan setelah waktu tersebut.\" category_15=\"Topik Lainnya\" category_id_15=\"otherTopic\" question_15=\"1. Apakah Anda memiliki toko fisik?\" answer_15=\"Ya — silakan kunjungi halaman Toko untuk melihat daftar toko dan mitra utama.\" category_16=\"Topik Lainnya\" category_id_16=\"otherTopic\" question_16=\"2. Bagaimana cara menghubungi layanan pelanggan?\" answer_16=\"Email hello@amerce.test atau gunakan formulir kontak. Kami akan merespons dalam satu hari kerja.\"][/faq-page]'),('id',4,'Kebijakan Privasi','Bagaimana Amerce mengumpulkan, menggunakan dan melindungi informasi pribadi Anda.','[page-banner heading=\"Kebijakan Privasi\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Informasi yang Kami Kumpulkan\" body_1=\"<p class=\\\"term-text cl-text-2\\\">When you visit the Site, we automatically collect certain information about your device — web browser, IP address, time zone, and some of the cookies installed on your device. As you browse, we also collect data about the pages or products you view, what referred you to the Site, and how you interact with it. We refer to this as \\\"Device Information\\\".</p><p class=\\\"term-text cl-text-2\\\">When you make a purchase or attempt to purchase through the Site, we collect your name, billing address, shipping address, and payment information (including card number, email address, and phone number). We refer to this as \\\"Order Information\\\".</p>\" title_2=\"2. Bagaimana Kami Menggunakan Informasi Anda\" body_2=\"<p class=\\\"term-text cl-text-2\\\">We use Order Information to fulfil orders placed through the Site (process payment, arrange shipping, provide invoices and order confirmations). We use it to communicate with you, screen orders for fraud, and — in line with your preferences — share marketing about products you may like.</p><p class=\\\"term-text cl-text-2\\\">We use Device Information to screen for fraud and to improve the Site through analytics about how customers browse and interact with us.</p>\" title_3=\"3. Berbagi Informasi Pribadi Anda\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We share Personal Information with third-party service providers who help us run the Site. We may also share information to comply with applicable laws, respond to a subpoena or lawful request, or otherwise protect our rights.</p>\" title_4=\"4. Penyimpanan Data\" body_4=\"<p class=\\\"term-text cl-text-2\\\">When you place an order, we maintain the Order Information for our records unless and until you ask us to delete it.</p>\" title_5=\"5. Hak Anda\" body_5=\"<p class=\\\"term-text cl-text-2\\\">You can request access, correction, or deletion of any personal data we hold about you. Email privacy@amerce.test from the address on file and we will respond within 30 days.</p>\" title_6=\"6. Kue\" body_6=\"<p class=\\\"term-text cl-text-2\\\">Cookies are used to keep your cart between visits, remember your preferences, and measure aggregate traffic. You can disable cookies in your browser, though some Site features may stop working.</p>\" title_7=\"7. Perubahan\" body_7=\"<p class=\\\"term-text cl-text-2\\\">We may update this policy from time to time to reflect changes to our practices or for operational, legal, or regulatory reasons. The latest version will always be on this page.</p>\"][/term-content]'),('id',5,'Syarat & Ketentuan','Ketentuan hukum berlaku saat Anda menggunakan toko Amerce.','[page-banner heading=\"Syarat & Ketentuan\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Penerimaan Persyaratan\" body_1=\"<p class=\\\"term-text cl-text-2\\\">By accessing or using the Mendenda store you agree to these terms. We reserve the right to update them with reasonable notice; the latest version is always available on this page.</p>\" title_2=\"2. Pemesanan & Pembayaran\" body_2=\"<p class=\\\"term-text cl-text-2\\\">All prices are in USD unless otherwise stated. We accept the payment methods displayed at checkout. An order becomes binding once you receive an order confirmation email.</p>\" title_3=\"3. Pengiriman\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Mengangkut options, lead times, and rates are listed on our Mengangkut page. Risk passes to you on delivery.</p>\" title_4=\"4. Pengembalian\" body_4=\"<p class=\\\"term-text cl-text-2\\\">You have 30 days from delivery to return any unworn item for a refund. See our Pengembalian &amp; Pengembalian Dana page for the full process.</p>\" title_5=\"5. Kekayaan Intelektual\" body_5=\"<p class=\\\"term-text cl-text-2\\\">All content on the Site — text, photography, logos, code — is owned by Mendenda or its licensors and may not be reproduced without written permission.</p>\" title_6=\"6. Batasan Tanggung Jawab\" body_6=\"<p class=\\\"term-text cl-text-2\\\">To the maximum extent permitted by law, Mendenda is not liable for indirect or consequential damages arising from use of the Site or the products purchased through it.</p>\" title_7=\"7. Hukum yang Berlaku\" body_7=\"<p class=\\\"term-text cl-text-2\\\">These terms are governed by the laws of the State of New York. Any dispute will be resolved in the state or federal courts located in New York County.</p>\"][/term-content]'),('id',6,'Pengembalian & Pengembalian Dana','Kebijakan pengembalian 30 hari kami dan proses pengembalian langkah demi langkah.','[page-banner heading=\"Pengembalian & Pengembalian Dana\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Pengembalian\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We want you to be completely satisfied with your purchase. If for any reason you are not, you may return any unworn item within 30 days of receiving your order for a refund or exchange. Barang must be in original packaging and the same condition as you received them.</p>\" title_2=\"2. Bagaimana Memulai Pengembalian\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Open the order in your account dashboard and click \\\"Start return\\\", or email returns@amerce.test with your order number. We will send a prepaid return label for domestic orders within one business day.</p>\" title_3=\"3. Pengembalian dana\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Refunds are processed within 3-5 business days of us receiving the return and applied to the original payment method. Bank posting times vary; allow up to 10 business days for the credit to appear.</p>\" title_4=\"4. Pengecualian\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Sale items, intimate apparel, and final-sale flash sale purchases are excluded from returns. Personalised or made-to-order items are also non-returnable unless faulty.</p>\" title_5=\"5. Produk Rusak atau Cacat\" body_5=\"<p class=\\\"term-text cl-text-2\\\">If your order arrives damaged or faulty, email us within 7 days with photos. We will replace the item or issue a full refund — including any return shipping cost — at our expense.</p>\" title_6=\"6. Pengembalian Internasional\" body_6=\"<p class=\\\"term-text cl-text-2\\\">International customers are responsible for return shipping unless the item is faulty. We do not refund original shipping or duty charges on international returns.</p>\"][/term-content]'),('id',7,'Pengiriman','Metode pengiriman domestik dan internasional, waktu dan biaya.','[page-banner heading=\"Mengangkut\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Metode Pengiriman\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We offer the following shipping methods for domestic and international orders: standard ground, expedited 2-day, and priority overnight (where available).</p>\" title_2=\"2. Biaya Domestik\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Standard ground is free on orders over $99. Express 1-2 day shipping is $19.99 flat. Priority overnight is calculated by weight at checkout.</p>\" title_3=\"3. Internasional\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We ship to most countries. International standard shipping is $24.99 with 7-12 business day delivery. Express options appear at checkout. Duties and taxes are pre-paid for select destinations; otherwise the courier collects them on delivery.</p>\" title_4=\"4. Waktu Pemrosesan\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Orders placed before 2pm EST on business days ship the same day. Orders placed after 2pm or on weekends/holidays ship the next business day.</p>\" title_5=\"5. Pelacakan\" body_5=\"<p class=\\\"term-text cl-text-2\\\">A tracking link is included in your shipment confirmation email. You can also see live status from Account → Orders → Track.</p>\" title_6=\"6. Pesanan Hilang atau Terjebak\" body_6=\"<p class=\\\"term-text cl-text-2\\\">If a tracking number has not updated for more than 7 business days, email shipping@amerce.test. We will open an investigation with the carrier and either refund or reship the order at our expense.</p>\"][/term-content]'),('id',8,'Toko kami','Kunjungi Amerce secara langsung — toko utama dan mitra di seluruh dunia.',''),('id',9,'Blog','Instruksi pakaian, cerita merek, dan konten di balik layar dari tim editorial Amerce.','<div class=\"container py-5\"><h1>Buku harian</h1><p>Jelajahi kisah terbaru kami — panduan gaya, sorotan produk, analisis keberlanjutan mendalam, dan banyak lagi.</p></div>'),('id',10,'Karir','Bergabunglah dengan Amerce — posisi terbuka, nilai budaya, dan keuntungan tim.','<div class=\"container py-5\"><h1>Rekrutmen Di Amerce</h1><p>Kami adalah tim kecil terdistribusi yang membangun model ritel yang lebih baik. Kami merekrut seluruh produk, teknik, rantai pasokan, dan pengalaman pelanggan.</p><p>Posisi terbuka diposting di halaman LinkedIn perusahaan. Untuk melamar, kirim surat pendek dan resume ke <a href=\"mailto:careers@amerce.test\">careers@amerce.test</a>.</p></div>'),('id',11,'Sustainability','How Amerce sources responsibly and reduces its environmental footprint.','<div class=\"container py-5\"><h1>Pembangunan Berkelanjutan di Amerika</h1><p>Setiap produk membawa cerita. Kami bekerja sama langsung dengan pabrik dan bengkel pengrajin, memprioritaskan bahan daur ulang dan dapat dilacak, serta mengemas bebas plastik.</p><p>Sasaran kami pada tahun 2026: 90% material memiliki rantai pasokan yang terverifikasi, dan pelaporan dampak tahunan yang transparan.</p></div>'),('id',12,'Beranda','Amerce — rumah bagi pengalaman e-commerce yang serbaguna.','[simple-slider key=\"home-hero\" style=\"style-1\" is_autoplay=\"yes\" autoplay_speed=\"5000\" show_arrows=\"yes\" show_dots=\"yes\" nav_arrow_class=\"tf-sw-nav-2 d-lg-flex d-none\" nav_arrow_icon_prev=\"icon-ArrowLeft\" nav_arrow_icon_next=\"icon-ArrowRight\"][/simple-slider]\n[categories-grid style=\"style-slider\" limit=\"5\" show_count=\"yes\" wrapper_class=\"container-layout-right\" card_extra_modifier=\"style-2\" swiper_preview=\"4.3605\" swiper_preview_lg=\"4.3605\" card_image_size=\"original\" count_overrides=\"78,120,48,62,36\" count_label=\"items\"][/categories-grid]\n[ecommerce-products style=\"style-tabs\" limit=\"8\" items_per_row=\"4\" grid_rows=\"2\" section_class=\"ecommerce-products ecommerce-products--style-tabs flat-spacing pt-0\" tab_labels=\"Pendatang Baru|Penjual Terbaik|Di jual\" tab_categories=\"||\" tab_sources=\"latest|best-seller|sale\" tab_nav_style=\"v3\" tab_nav_class_extra=\"style-4 justify-content-sm-center mb-0\" tab_btn_class_extra=\"py-4\" tab_label_class=\"h4\"][/ecommerce-products]\n[banner-thumbs-product style=\"style-thumbs-v2\" heading=\"Kaos Katun Berusuk Ramping\" subheading=\"Desain kaos katun ribbed yang minimalis berfokus pada kebutuhan pengguna sehingga dapat disesuaikan dan cocok untuk banyak lingkungan.\" product_ids=\"1,2,3\" square_image_1=\"products/fashion-2/square/product-1-2.jpg\" square_image_2=\"products/fashion-2/square/product-2-2.jpg\" square_image_3=\"products/fashion-2/square/product-4-2.jpg\"][/banner-thumbs-product]\n[ecommerce-collections style=\"style-accordion-tabs\" title=\"Koleksi Pilihan Untuk Gaya\" subtitle=\"Item fesyen yang dirancang dengan cermat mendefinisikan keanggunan modern.\" collection_ids=\"1,2,3,4\" container_class=\"container\" card_modifier=\"style-2 st-2_2\" accordion_modifier=\"style-2\" title_class=\"h5 fw-medium\" button_text=\"Beli Koleksi\" button_url=\"/products\" image_size=\"original\"][/ecommerce-collections]\n[infinity-marquee style=\"style-1\" background_class=\"bg-main-2\" spacing_class=\"\" clone_count=\"3\" quantity=\"6\" heading_1=\"Minimalis Modern\" image_1=\"collection/cls-34.jpg\" link_1=\"/products\" heading_2=\"Keahlian\" image_2=\"collection/cls-35.jpg\" link_2=\"/products\" heading_3=\"Kemewahan Berkelanjutan\" image_3=\"collection/cls-36.jpg\" link_3=\"/products\" heading_4=\"Mewah Dan Nyaman\" image_4=\"collection/cls-37.jpg\" link_4=\"/products\" heading_5=\"Keyakinan Dalam Setiap Langkah\" image_5=\"collection/cls-38.jpg\" link_5=\"/products\" heading_6=\"Keyakinan yang Dikurasi\" image_6=\"collection/cls-3.jpg\" link_6=\"/products\"][/infinity-marquee]\n[ecommerce-products style=\"style-slider-side-heading\" title=\"Sweater dan Barang Wol yang Luar Biasa\" subtitle=\"Koleksi wol pilihan kami menawarkan kehangatan maksimal dan gaya sempurna.\" source=\"featured\" limit=\"6\" items_per_row=\"3\" view_all_url=\"/products\" view_all_text=\"Lihat Semua Produk\"][/ecommerce-products]\n[testimonials style=\"style-v4\" title=\"Apa Kata Pelanggan Tentang Kami\" subtitle=\"Kisah nyata dari orang-orang yang menyukai produk kami.\" autoplay=\"yes\" limit=\"6\" card_modifier=\"style-2\" container_class=\"container-full\" preview=\"3\" bg_main=\"yes\" view_all_url=\"/products\" view_all_text=\"Baca Semua Ulasan\" section_class=\"flat-spacing pt-0\" testimonial_product_ids=\"1,4,9\"][/testimonials]\n[image-gallery style=\"style-default\" title=\"Ikuti Kami Di Instagram\" subtitle=\"@Mendenda\" skip_spacing=\"yes\" extra_section_class=\"px-10 pb-40\" quantity=\"5\" image_1=\"gallery/gallery-52.jpg\" link_1=\"/products\" image_2=\"gallery/gallery-53.jpg\" link_2=\"/products\" image_3=\"gallery/gallery-54.jpg\" link_3=\"/products\" image_4=\"gallery/gallery-55.jpg\" link_4=\"/products\" image_5=\"gallery/gallery-56.jpg\" link_5=\"/products\"][/image-gallery]'),('tr',1,'Hakkında','Amerce ile tanışın - marka hikayesi, tedarik standartları ve her ürünün arkasındaki ekip.','[page-banner heading=\"Hakkımızda\" subtitle=\"With over 15 years of experience, we craft timeless collections that transcend<br class=\\\"d-none d-lg-block\\\">trends and inspire lasting elegance.\"][/page-banner]\n[stats-counter hero_image=\"section/s-contact-1.jpg\" heading=\"Tasarım, detaylara verilen önem ve verimlilik dünyayı memnun ediyor\" description=\"Tasarlandığı andan giyildiği ana kadar her ürünümüz bu yolculuğu takip ediyor. Bunu daha hızlı bir şekilde yapabiliriz. Ancak Amerce olarak bu yolculukta bizimle birlikte olan herkesle ilgilenmeyi seçiyoruz.\" quantity=\"4\" value_1=\"8.2k\" animate_to_1=\"\" suffix_1=\"\" label_1=\"Mevcut Ürünler\" desc_1=\"Her türlü ihtiyacı karşılamak için yüksek kaliteli ürünler sunuyoruz.\" value_2=\"\" animate_to_2=\"10\" suffix_2=\"k\" label_2=\"Memnun Müşteriler\" desc_2=\"Kalite ve hizmet konusunda bize güvenen 10.000\'den fazla memnun müşteriye hizmet veriyoruz.\" value_3=\"\" animate_to_3=\"96\" suffix_3=\"\" label_3=\"İş Ortağı Markası\" desc_3=\"Önde gelen markalarla yapılan ortaklıklar, güvenilir koleksiyonları mağazanıza ve evinize getirir.\" value_4=\"\" animate_to_4=\"16\" suffix_4=\"k\" label_4=\"Satılık Ürünler\" desc_4=\"Bu nedenle her tarza uygun çeşitli ürün grupları sunmaya çalışıyoruz.\"][/stats-counter]\n[image-accordion image=\"section/s-contact-2.jpg\" heading=\"Nadir ve Enfes Ürünleri Dünya Çapına Getiriyoruz\" quantity=\"4\" title_1=\"Tanıtmak\" body_1=\"Trend belirleyen moda ve aksesuarlar için ilk adresiniz olan Amerce Store\'a hoş geldiniz. Hem ulusal hem de uluslararası alanda aranan, nadir ve seçkin parçalardan özenle seçilmiş bir koleksiyon sunmaktan gurur duyuyoruz.\" title_2=\"Vizyonumuz\" body_2=\"Sofistike tasarımın günlük yaşamla harmanlandığı bir dünyayı hedefliyoruz; zamana karşı dayanıklı ürünler, güvenilen ortaklar ve işlem değil, insan gibi davranılan müşteriler.\" title_3=\"Farkı Yaratan Nedir?\" body_3=\"Tedarikçiler bağımsız olarak denetlenir, ürünler elle test edilir ve özel bir müşteri hizmetleri ekibi tarafından desteklenen 30 günlük sebepsiz iade politikası vardır.\" title_4=\"Taahhüdümüz\" body_4=\"Kaliteli ürünler, şeffaf tedarik zincirleri ve adil çalışma koşulları - her siparişte, her zaman.\"][/image-accordion]\n[about-testimonials heading=\"Müşteriler Ne Diyor?\" subtitle=\"Müşterilerimiz ürünlerimizi seviyor ve biz de onları memnun etmeye çalışıyoruz.\" quantity=\"2\" image_1=\"testimonials/tes-1.jpg\" name_1=\"Emma Collins\" text_1=\"\\\"Totally obsessed with this outfit! The fit is perfect, the fabric feels premium, and I\'ve been getting compliments non-stop. It instantly lifts my confidence — such a great find!\\\"\" image_2=\"testimonials/tes-2.jpg\" name_2=\"Sofya Ramirez\" text_2=\"\\\"I\'m amazed by how comfortable yet stylish this piece is. It pairs effortlessly with everything, and the quality really stands out. Definitely becoming my go-to for everyday looks!\\\"\"][/about-testimonials]\n[about-team heading=\"Ekiple Tanışın\" subtitle=\"Her ayrıntıda mükemmelliğe kendini adamış profesyoneller.\" quantity=\"4\" image_1=\"member/member-1.jpg\" name_1=\"Annette Siyah\" role_1=\"Kurucu/CEO\" social_links_1=\"\" image_2=\"member/member-2.jpg\" name_2=\"Brooklyn Simmons\" role_2=\"Üstesinden gelmek\" social_links_2=\"\" image_3=\"member/member-3.jpg\" name_3=\"Jane Cooper\" role_3=\"Satış Direktörü\" social_links_3=\"\" image_4=\"member/member-4.jpg\" name_4=\"Lisa Bonet\" role_4=\"Satış Direktörü\" social_links_4=\"\"][/about-team]'),('tr',2,'Temas etmek','Amerce\'in müşteri hizmetleri ve işbirliği ekibiyle iletişime geçin.',''),('tr',3,'FAQ','Siparişler, gönderim, iadeler ve hesap yönetimi hakkında sık sorulan sorular.','[page-banner heading=\"Sıkça Sorulan Sorular\" subtitle=\"Got questions? We\'ve got answers! Browse our Sıkça Sorulan Sorular to find information on orders, shipping,<br class=\\\"d-none d-lg-block\\\">returns, and more. If you need further assistance, feel free to contact our team.\"][/page-banner]\n[faq-page sidebar_image=\"section/banner-12.jpg\" sidebar_title=\"Save 25% <br class=\\\"d-none d-sm-block\\\">Today\" sidebar_subtitle=\"Tişörtler, Kapüşonlular ve Daha Fazlası\" sidebar_cta=\"Daha Fazlasını Gör\" sidebar_url=\"/products\" quantity=\"16\" category_1=\"Hesabım\" category_id_1=\"myAccount\" question_1=\"1. Şifremi unutursam ne yapabilirim?\" answer_1=\"Use the \\\"Forgot password\\\" link on the sign-in page. We will email you a one-time link to set a new password — it expires in 30 minutes for security.\" category_2=\"Hesabım\" category_id_2=\"myAccount\" question_2=\"2. E-posta adresi nasıl güncellenir?\" answer_2=\"Oturum açın, Hesap → Ayarlar\'ı açın ve e-posta alanlarını değiştirin. Yeni adrese bir onay e-postası göndereceğiz; Bu bağlantıya tıkladığınızda değişiklik geçerli olacaktır.\" category_3=\"Hesabım\" category_id_3=\"myAccount\" question_3=\"3. Hesabımı silebilir miyim?\" answer_3=\"Sahip olmak. Hesap → Ayarlar\'dan Hesabı sil seçeneğine ilerleyin. Sipariş geçmişini vergi/yasal nedenlerden dolayı saklıyoruz ancak kişisel iletişim bilgileri 30 gün içinde silinir.\" category_4=\"Siparişler ve Alışveriş\" category_id_4=\"ordersPurchases\" question_4=\"1. Nasıl sipariş verilir?\" answer_4=\"Ürünleri sepete ekleyin, ödeme seçeneğini tıklayın, gönderim yöntemini seçin ve ardından ödeme bilgilerini girin. Hemen bir sipariş onay e-postası alacaksınız.\" category_5=\"Siparişler ve Alışveriş\" category_id_5=\"ordersPurchases\" question_5=\"2. Siparişimi düzenleyebilir veya iptal edebilir miyim?\" answer_5=\"Siparişler, verildikten sonraki 1 saat içinde hesap kontrol panelinizden düzenlenebilir veya iptal edilebilir. Daha sonra depo toplanmaya başladı ve biz müdahale edemedik.\" category_6=\"Siparişler ve Alışveriş\" category_id_6=\"ordersPurchases\" question_6=\"3. Hangi ödeme yöntemleri kabul ediliyor?\" answer_6=\"Visa, Mastercard, American Express, Apple Pay, Google Pay ve PayPal\'ı kabul ediyoruz. Tüm işlemlerde TLS 1.3 şifrelemesi kullanılır.\" category_7=\"İade ve Para İadeleri\" category_id_7=\"returnsRefunds\" question_7=\"1. İade süresi ne kadardır?\" answer_7=\"Kullanılmamış ve giyilmemiş ürünler için teslim tarihinden itibaren 30 gün. İndirimli ürünler, iç giyim ve son indirim flaş indirim ürünleri için geçerli değildir.\" category_8=\"İade ve Para İadeleri\" category_id_8=\"returnsRefunds\" question_8=\"2. İade sürecini nasıl başlatabilirim?\" answer_8=\"Open the order in your account dashboard and click \\\"Start return\\\". We email a prepaid label for domestic orders within one business day.\" category_9=\"İade ve Para İadeleri\" category_id_9=\"returnsRefunds\" question_9=\"3. Geri ödememi ne zaman alacağım?\" answer_9=\"Geri ödemeler, iade edilen ürünün tarafımıza ulaşmasından itibaren 3-5 iş günü içerisinde gerçekleştirilir. Banka kredi süreleri değişiklik gösterebilir; Ödemenizin yansıtıldığını görmek için lütfen 10 iş gününe kadar bekleyin.\" category_10=\"Nakliye ve Takip\" category_id_10=\"shippingTracking\" question_10=\"1. Nakliye ne kadar sürer?\" answer_10=\"Standart yurt içi kargo 3-5 iş günü sürmektedir. Hızlı kargo 1-2 gün. Uluslararası standart nakliye 7-12 iş günü sürer; Ödeme sayfasında hızlandırılmış gönderim seçenekleri mevcuttur.\" category_11=\"Nakliye ve Takip\" category_id_11=\"shippingTracking\" question_11=\"2. Siparişler nasıl takip edilir?\" answer_11=\"Takip bağlantısı gönderim onayı e-postasına dahildir. Durumu Hesap → Siparişler → Takip bölümünden de görüntüleyebilirsiniz.\" category_12=\"Nakliye ve Takip\" category_id_12=\"shippingTracking\" question_12=\"3. Uluslararası gönderim yapıyor musunuz?\" answer_12=\"Evet — çoğu ülkeye. Belirli destinasyonlar için vergi ve harçlar ödeme sayfasında önceden ödenir; Aksi takdirde nakliye birimi teslimat sırasında ürünü teslim alabilir.\" category_13=\"Ücretler ve Ödemeler\" category_id_13=\"feesBilling\" question_13=\"1. Vergi ve harçlar dahil mi?\" answer_13=\"Yurt içi fiyatlara ödeme sırasında gösterilen satış vergisi dahildir. Desteklenen varış noktalarına verilen uluslararası siparişlere vergiler ve harçlar dahildir; Aksi takdirde kargo birimi teslimat sırasında ürünü teslim alacaktır.\" category_14=\"Ücretler ve Ödemeler\" category_id_14=\"feesBilling\" question_14=\"2. Neden iki kez ücretlendirildim?\" answer_14=\"Gerçek ödemeyle birlikte bir provizyon bekletmesi görüyor olabilirsiniz. Durdurma 3-5 iş günü içinde otomatik olarak iptal edilecektir. Bu sürenin sonunda hala iki ödeme görüyorsanız billing@amerce.test adresine e-posta gönderin.\" category_15=\"Diğer Konular\" category_id_15=\"otherTopic\" question_15=\"1. Fiziksel bir mağazanız var mı?\" answer_15=\"Evet — önemli mağazaların ve iş ortaklarının listesi için lütfen Mağazalar sayfasını ziyaret edin.\" category_16=\"Diğer Konular\" category_id_16=\"otherTopic\" question_16=\"2. Müşteri hizmetleriyle nasıl iletişime geçilir?\" answer_16=\"hello@amerce.test adresine e-posta gönderin veya iletişim formunu kullanın. Bir iş günü içinde yanıt vereceğiz.\"][/faq-page]'),('tr',4,'Gizlilik Politikası','Amerce kişisel bilgilerinizi nasıl toplar, kullanır ve korur.','[page-banner heading=\"Gizlilik Politikası\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Topladığımız Bilgiler\" body_1=\"<p class=\\\"term-text cl-text-2\\\">When you visit the Site, we automatically collect certain information about your device — web browser, IP address, time zone, and some of the cookies installed on your device. As you browse, we also collect data about the pages or products you view, what referred you to the Site, and how you interact with it. We refer to this as \\\"Device Information\\\".</p><p class=\\\"term-text cl-text-2\\\">When you make a purchase or attempt to purchase through the Site, we collect your name, billing address, shipping address, and payment information (including card number, email address, and phone number). We refer to this as \\\"Order Information\\\".</p>\" title_2=\"2. Bilgilerinizi Nasıl Kullanıyoruz\" body_2=\"<p class=\\\"term-text cl-text-2\\\">We use Order Information to fulfil orders placed through the Site (process payment, arrange shipping, provide invoices and order confirmations). We use it to communicate with you, screen orders for fraud, and — in line with your preferences — share marketing about products you may like.</p><p class=\\\"term-text cl-text-2\\\">We use Device Information to screen for fraud and to improve the Site through analytics about how customers browse and interact with us.</p>\" title_3=\"3. Kişisel Bilgilerinizin Paylaşılması\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We share Personal Information with third-party service providers who help us run the Site. We may also share information to comply with applicable laws, respond to a subpoena or lawful request, or otherwise protect our rights.</p>\" title_4=\"4. Veri Depolama\" body_4=\"<p class=\\\"term-text cl-text-2\\\">When you place an order, we maintain the Order Information for our records unless and until you ask us to delete it.</p>\" title_5=\"5. Haklarınız\" body_5=\"<p class=\\\"term-text cl-text-2\\\">You can request access, correction, or deletion of any personal data we hold about you. Email privacy@amerce.test from the address on file and we will respond within 30 days.</p>\" title_6=\"6. Çerezler\" body_6=\"<p class=\\\"term-text cl-text-2\\\">Cookies are used to keep your cart between visits, remember your preferences, and measure aggregate traffic. You can disable cookies in your browser, though some Site features may stop working.</p>\" title_7=\"7. Değişim\" body_7=\"<p class=\\\"term-text cl-text-2\\\">We may update this policy from time to time to reflect changes to our practices or for operational, legal, or regulatory reasons. The latest version will always be on this page.</p>\"][/term-content]'),('tr',5,'Şartlar ve Koşullar','Amerce mağazasını kullandığınızda yasal şartlar geçerlidir.','[page-banner heading=\"Şartlar ve Koşullar\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Şartların Kabulü\" body_1=\"<p class=\\\"term-text cl-text-2\\\">By accessing or using the Amerika store you agree to these terms. We reserve the right to update them with reasonable notice; the latest version is always available on this page.</p>\" title_2=\"2. Siparişler ve Ödeme\" body_2=\"<p class=\\\"term-text cl-text-2\\\">All prices are in USD unless otherwise stated. We accept the payment methods displayed at checkout. An order becomes binding once you receive an order confirmation email.</p>\" title_3=\"3. Nakliye\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Taşıma options, lead times, and rates are listed on our Taşıma page. Risk passes to you on delivery.</p>\" title_4=\"4. İade\" body_4=\"<p class=\\\"term-text cl-text-2\\\">You have 30 days from delivery to return any unworn item for a refund. See our İade ve Para İadeleri page for the full process.</p>\" title_5=\"5. Fikri Mülkiyet\" body_5=\"<p class=\\\"term-text cl-text-2\\\">All content on the Site — text, photography, logos, code — is owned by Amerika or its licensors and may not be reproduced without written permission.</p>\" title_6=\"6. Sorumluluğun Sınırlandırılması\" body_6=\"<p class=\\\"term-text cl-text-2\\\">To the maximum extent permitted by law, Amerika is not liable for indirect or consequential damages arising from use of the Site or the products purchased through it.</p>\" title_7=\"7. Geçerli Kanun\" body_7=\"<p class=\\\"term-text cl-text-2\\\">These terms are governed by the laws of the State of New York. Any dispute will be resolved in the state or federal courts located in New York County.</p>\"][/term-content]'),('tr',6,'İade ve Para İadeleri','30 günlük iade politikamız ve adım adım iade sürecimiz.','[page-banner heading=\"İade ve Para İadeleri\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. İade\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We want you to be completely satisfied with your purchase. If for any reason you are not, you may return any unworn item within 30 days of receiving your order for a refund or exchange. Öğeler must be in original packaging and the same condition as you received them.</p>\" title_2=\"2. İade Nasıl Başlatılır\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Open the order in your account dashboard and click \\\"Start return\\\", or email returns@amerce.test with your order number. We will send a prepaid return label for domestic orders within one business day.</p>\" title_3=\"3. İade\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Refunds are processed within 3-5 business days of us receiving the return and applied to the original payment method. Bank posting times vary; allow up to 10 business days for the credit to appear.</p>\" title_4=\"4. İstisnalar\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Sale items, intimate apparel, and final-sale flash sale purchases are excluded from returns. Personalised or made-to-order items are also non-returnable unless faulty.</p>\" title_5=\"5. Hasarlı veya Arızalı Ürünler\" body_5=\"<p class=\\\"term-text cl-text-2\\\">If your order arrives damaged or faulty, email us within 7 days with photos. We will replace the item or issue a full refund — including any return shipping cost — at our expense.</p>\" title_6=\"6. Uluslararası İadeler\" body_6=\"<p class=\\\"term-text cl-text-2\\\">International customers are responsible for return shipping unless the item is faulty. We do not refund original shipping or duty charges on international returns.</p>\"][/term-content]'),('tr',7,'Nakliye','Yurt içi ve yurt dışı gönderim yöntemleri, süreleri ve ücretleri.','[page-banner heading=\"Taşıma\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Nakliye Yöntemi\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We offer the following shipping methods for domestic and international orders: standard ground, expedited 2-day, and priority overnight (where available).</p>\" title_2=\"2. Yurtiçi Ücretler\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Standard ground is free on orders over $99. Express 1-2 day shipping is $19.99 flat. Priority overnight is calculated by weight at checkout.</p>\" title_3=\"3. Uluslararası\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We ship to most countries. International standard shipping is $24.99 with 7-12 business day delivery. Express options appear at checkout. Duties and taxes are pre-paid for select destinations; otherwise the courier collects them on delivery.</p>\" title_4=\"4. İşlem Süresi\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Orders placed before 2pm EST on business days ship the same day. Orders placed after 2pm or on weekends/holidays ship the next business day.</p>\" title_5=\"5. Takip\" body_5=\"<p class=\\\"term-text cl-text-2\\\">A tracking link is included in your shipment confirmation email. You can also see live status from Account → Orders → Track.</p>\" title_6=\"6. Kayıp veya Takılan Siparişler\" body_6=\"<p class=\\\"term-text cl-text-2\\\">If a tracking number has not updated for more than 7 business days, email shipping@amerce.test. We will open an investigation with the carrier and either refund or reship the order at our expense.</p>\"][/term-content]'),('tr',8,'Mağazalarımız','Amerce\'i doğrudan ziyaret edin; dünya çapındaki amiral mağazaları ve ortakları.',''),('tr',9,'Blog','Amerce editör ekibinden kıyafet talimatları, marka hikayeleri ve kamera arkası içerikleri.','<div class=\"container py-5\"><h1>Günlük</h1><p>Stil kılavuzları, öne çıkan ürünler, derinlemesine sürdürülebilirlik analizi ve daha fazlasını içeren en son hikayelerimizi keşfedin.</p></div>'),('tr',10,'Kariyer','Amerce\'e katılın — açık pozisyonlar, kültürel değerler ve takım avantajları.','<div class=\"container py-5\"><h1>Amerce\'de İşe Alım</h1><p>Biz daha rafine bir perakende modeli inşa eden küçük, dağınık bir ekibiz. Ürün, mühendislik, tedarik zinciri ve müşteri deneyimi genelinde işe alım yapıyoruz.</p><p>Açık pozisyonlar şirketin LinkedIn sayfasında yayınlanmaktadır. Başvurmak için <a href=\"mailto:careers@amerce.test\">careers@amerce.test</a> adresine kısa bir mektup ve özgeçmiş gönderin.</p></div>'),('tr',11,'Sustainability','How Amerce sources responsibly and reduces its environmental footprint.','<div class=\"container py-5\"><h1>Amerika\'da Sürdürülebilir Kalkınma</h1><p>Her ürün bir hikaye taşır. Doğrudan fabrikalar ve zanaatkar atölyeleriyle çalışıyoruz, geri dönüştürülmüş ve izlenebilir malzemelere öncelik veriyoruz ve plastik içermeyen ambalajlar yapıyoruz.</p><p>2026 hedefimiz: Malzemelerin %90\'ının doğrulanmış bir tedarik zincirine ve şeffaf yıllık etki raporlamasına sahip olması.</p></div>'),('tr',12,'Ana sayfa','Amerce — çok yönlü bir e-ticaret deneyimine ev sahipliği yapıyor.','[simple-slider key=\"home-hero\" style=\"style-1\" is_autoplay=\"yes\" autoplay_speed=\"5000\" show_arrows=\"yes\" show_dots=\"yes\" nav_arrow_class=\"tf-sw-nav-2 d-lg-flex d-none\" nav_arrow_icon_prev=\"icon-ArrowLeft\" nav_arrow_icon_next=\"icon-ArrowRight\"][/simple-slider]\n[categories-grid style=\"style-slider\" limit=\"5\" show_count=\"yes\" wrapper_class=\"container-layout-right\" card_extra_modifier=\"style-2\" swiper_preview=\"4.3605\" swiper_preview_lg=\"4.3605\" card_image_size=\"original\" count_overrides=\"78,120,48,62,36\" count_label=\"items\"][/categories-grid]\n[ecommerce-products style=\"style-tabs\" limit=\"8\" items_per_row=\"4\" grid_rows=\"2\" section_class=\"ecommerce-products ecommerce-products--style-tabs flat-spacing pt-0\" tab_labels=\"Yeni Gelenler|En çok satan kitap|İndirimde\" tab_categories=\"||\" tab_sources=\"latest|best-seller|sale\" tab_nav_style=\"v3\" tab_nav_class_extra=\"style-4 justify-content-sm-center mb-0\" tab_btn_class_extra=\"py-4\" tab_label_class=\"h4\"][/ecommerce-products]\n[banner-thumbs-product style=\"style-thumbs-v2\" heading=\"İnce Fitilli Pamuklu Tişört\" subheading=\"Fitilli pamuklu tişörtün minimalist tasarımı, kullanıcı ihtiyaçlarına odaklanarak birçok ortama uyum sağlamasına ve uygun olmasına olanak tanıyor.\" product_ids=\"1,2,3\" square_image_1=\"products/fashion-2/square/product-1-2.jpg\" square_image_2=\"products/fashion-2/square/product-2-2.jpg\" square_image_3=\"products/fashion-2/square/product-4-2.jpg\"][/banner-thumbs-product]\n[ecommerce-collections style=\"style-accordion-tabs\" title=\"Stil için Seçilmiş Koleksiyon\" subtitle=\"Titizlikle tasarlanmış moda ürünleri modern zarafeti tanımlar.\" collection_ids=\"1,2,3,4\" container_class=\"container\" card_modifier=\"style-2 st-2_2\" accordion_modifier=\"style-2\" title_class=\"h5 fw-medium\" button_text=\"Koleksiyonu Satın Al\" button_url=\"/products\" image_size=\"original\"][/ecommerce-collections]\n[infinity-marquee style=\"style-1\" background_class=\"bg-main-2\" spacing_class=\"\" clone_count=\"3\" quantity=\"6\" heading_1=\"Modern Minimalizm\" image_1=\"collection/cls-34.jpg\" link_1=\"/products\" heading_2=\"İşçilik\" image_2=\"collection/cls-35.jpg\" link_2=\"/products\" heading_3=\"Sürdürülebilir Lüks\" image_3=\"collection/cls-36.jpg\" link_3=\"/products\" heading_4=\"Lüks ve Kullanışlı\" image_4=\"collection/cls-37.jpg\" link_4=\"/products\" heading_5=\"Her Adımda Güven\" image_5=\"collection/cls-38.jpg\" link_5=\"/products\" heading_6=\"Seçilmiş Güven\" image_6=\"collection/cls-3.jpg\" link_6=\"/products\"][/infinity-marquee]\n[ecommerce-products style=\"style-slider-side-heading\" title=\"Olağanüstü Kazaklar ve Yünlü Ürünler\" subtitle=\"Küratörlü yün koleksiyonumuz maksimum sıcaklık ve kusursuz stil sunar.\" source=\"featured\" limit=\"6\" items_per_row=\"3\" view_all_url=\"/products\" view_all_text=\"Tüm Ürünleri Görüntüle\"][/ecommerce-products]\n[testimonials style=\"style-v4\" title=\"Müşteriler Hakkımızda Ne Diyor?\" subtitle=\"Ürünlerimizi seven insanlardan gerçek hikayeler.\" autoplay=\"yes\" limit=\"6\" card_modifier=\"style-2\" container_class=\"container-full\" preview=\"3\" bg_main=\"yes\" view_all_url=\"/products\" view_all_text=\"Tüm İncelemeleri Oku\" section_class=\"flat-spacing pt-0\" testimonial_product_ids=\"1,4,9\"][/testimonials]\n[image-gallery style=\"style-default\" title=\"Bizi Instagram\'da Takip Edin\" subtitle=\"@Amerce\" skip_spacing=\"yes\" extra_section_class=\"px-10 pb-40\" quantity=\"5\" image_1=\"gallery/gallery-52.jpg\" link_1=\"/products\" image_2=\"gallery/gallery-53.jpg\" link_2=\"/products\" image_3=\"gallery/gallery-54.jpg\" link_3=\"/products\" image_4=\"gallery/gallery-55.jpg\" link_4=\"/products\" image_5=\"gallery/gallery-56.jpg\" link_5=\"/products\"][/image-gallery]'),('vi',1,'Giới thiệu','Giới thiệu Amerce — câu chuyện thương hiệu, tiêu chuẩn nguồn cung và đội ngũ đứng sau từng sản phẩm.','[page-banner heading=\"Về Chúng Tôi\" subtitle=\"With over 15 years of experience, we craft timeless collections that transcend<br class=\\\"d-none d-lg-block\\\">trends and inspire lasting elegance.\"][/page-banner]\n[stats-counter hero_image=\"section/s-contact-1.jpg\" heading=\"Thiết kế, sự tỉ mỉ trong từng chi tiết và hiệu quả làm hài lòng thế giới\" description=\"Từ khoảnh khắc được hình thành đến khi được khoác lên người, mỗi sản phẩm của chúng tôi đều đi theo hành trình này. Chúng tôi có thể làm điều đó với tốc độ nhanh hơn. Tuy nhiên, tại Amerce, chúng tôi chọn chăm sóc tất cả những ai đang đồng hành cùng chúng tôi trên hành trình này.\" quantity=\"4\" value_1=\"8.2k\" animate_to_1=\"\" suffix_1=\"\" label_1=\"Sản Phẩm Hiện Có\" desc_1=\"Chúng tôi cung cấp đa dạng sản phẩm chất lượng cao để đáp ứng mọi nhu cầu.\" value_2=\"\" animate_to_2=\"10\" suffix_2=\"k\" label_2=\"Khách Hàng Hài Lòng\" desc_2=\"Phục vụ hơn 10.000 khách hàng hài lòng tin tưởng chúng tôi về chất lượng và dịch vụ.\" value_3=\"\" animate_to_3=\"96\" suffix_3=\"\" label_3=\"Thương Hiệu Đối Tác\" desc_3=\"Quan hệ đối tác với các thương hiệu hàng đầu mang đến bộ sưu tập đáng tin cậy cho cửa hàng và ngôi nhà của bạn.\" value_4=\"\" animate_to_4=\"16\" suffix_4=\"k\" label_4=\"Sản Phẩm Đang Bán\" desc_4=\"Đó là lý do chúng tôi nỗ lực mang đến nhiều dòng sản phẩm đa dạng, phù hợp với mọi phong cách.\"][/stats-counter]\n[image-accordion image=\"section/s-contact-2.jpg\" heading=\"Mang Đến Những Món Đồ Quý Hiếm Và Tinh Tế Trên Toàn Thế Giới\" quantity=\"4\" title_1=\"Giới Thiệu\" body_1=\"Chào mừng đến với Cửa hàng Amerce, điểm đến hàng đầu cho thời trang và phụ kiện đi đầu xu hướng. Chúng tôi tự hào mang đến bộ sưu tập được tuyển chọn kỹ lưỡng những món đồ quý hiếm và tinh tế được tìm kiếm cả trong nước lẫn quốc tế.\" title_2=\"Tầm Nhìn Của Chúng Tôi\" body_2=\"Chúng tôi hướng đến một thế giới nơi thiết kế tinh tế hòa quyện cùng cuộc sống thường ngày — những sản phẩm bền đẹp theo thời gian, những đối tác đáng tin cậy, và những khách hàng được đối xử như con người, không phải giao dịch.\" title_3=\"Điều Làm Nên Sự Khác Biệt\" body_3=\"Nhà cung cấp được kiểm toán độc lập, sản phẩm được kiểm tra thủ công, và chính sách đổi trả 30 ngày không cần lý do, hỗ trợ bởi đội ngũ chăm sóc khách hàng tận tâm.\" title_4=\"Cam Kết Của Chúng Tôi\" body_4=\"Sản phẩm chất lượng, chuỗi cung ứng minh bạch và điều kiện lao động công bằng — mỗi đơn hàng, mỗi lần đặt.\"][/image-accordion]\n[about-testimonials heading=\"Khách Hàng Nói Gì!\" subtitle=\"Khách hàng yêu thích sản phẩm của chúng tôi, và chúng tôi luôn nỗ lực làm hài lòng họ.\" quantity=\"2\" image_1=\"testimonials/tes-1.jpg\" name_1=\"Emma Collins\" text_1=\"\\\"Totally obsessed with this outfit! The fit is perfect, the fabric feels premium, and I\'ve been getting compliments non-stop. It instantly lifts my confidence — such a great find!\\\"\" image_2=\"testimonials/tes-2.jpg\" name_2=\"Sophia Ramirez\" text_2=\"\\\"I\'m amazed by how comfortable yet stylish this piece is. It pairs effortlessly with everything, and the quality really stands out. Definitely becoming my go-to for everyday looks!\\\"\"][/about-testimonials]\n[about-team heading=\"Gặp Gỡ Đội Ngũ\" subtitle=\"Những chuyên gia tận tâm với sự hoàn hảo trong từng chi tiết.\" quantity=\"4\" image_1=\"member/member-1.jpg\" name_1=\"Annette Black\" role_1=\"Nhà Sáng Lập/CEO\" social_links_1=\"\" image_2=\"member/member-2.jpg\" name_2=\"Brooklyn Simmons\" role_2=\"Quản Lý\" social_links_2=\"\" image_3=\"member/member-3.jpg\" name_3=\"Jane Cooper\" role_3=\"Giám Đốc Kinh Doanh\" social_links_3=\"\" image_4=\"member/member-4.jpg\" name_4=\"Lisa Bonet\" role_4=\"Giám Đốc Kinh Doanh\" social_links_4=\"\"][/about-team]'),('vi',2,'Liên hệ','Liên hệ với đội ngũ chăm sóc khách hàng và hợp tác của Amerce.',''),('vi',3,'Câu hỏi thường gặp','Câu hỏi thường gặp về đơn hàng, vận chuyển, đổi trả và quản lý tài khoản.','[page-banner heading=\"Câu Hỏi Thường Gặp\" subtitle=\"Got questions? We\'ve got answers! Browse our Câu Hỏi Thường Gặp to find information on orders, shipping,<br class=\\\"d-none d-lg-block\\\">returns, and more. If you need further assistance, feel free to contact our team.\"][/page-banner]\n[faq-page sidebar_image=\"section/banner-12.jpg\" sidebar_title=\"Save 25% <br class=\\\"d-none d-sm-block\\\">Today\" sidebar_subtitle=\"Áo Thun, Áo Hoodie Và Hơn Thế Nữa\" sidebar_cta=\"Xem Thêm\" sidebar_url=\"/products\" quantity=\"16\" category_1=\"Tài Khoản Của Tôi\" category_id_1=\"myAccount\" question_1=\"1. Tôi có thể làm gì nếu quên mật khẩu?\" answer_1=\"Use the \\\"Forgot password\\\" link on the sign-in page. We will email you a one-time link to set a new password — it expires in 30 minutes for security.\" category_2=\"Tài Khoản Của Tôi\" category_id_2=\"myAccount\" question_2=\"2. Làm thế nào để cập nhật địa chỉ email?\" answer_2=\"Đăng nhập, mở Tài khoản → Cài đặt và thay đổi trường email. Chúng tôi sẽ gửi email xác nhận đến địa chỉ mới; thay đổi sẽ có hiệu lực khi bạn nhấp vào liên kết đó.\" category_3=\"Tài Khoản Của Tôi\" category_id_3=\"myAccount\" question_3=\"3. Tôi có thể xóa tài khoản của mình không?\" answer_3=\"Có. Từ Tài khoản → Cài đặt, kéo xuống mục Xóa tài khoản. Chúng tôi giữ lại lịch sử đơn hàng vì lý do thuế/pháp lý, nhưng thông tin liên hệ cá nhân sẽ được xóa trong vòng 30 ngày.\" category_4=\"Đơn Hàng & Mua Sắm\" category_id_4=\"ordersPurchases\" question_4=\"1. Làm thế nào để đặt hàng?\" answer_4=\"Thêm sản phẩm vào giỏ hàng, nhấp thanh toán, chọn phương thức vận chuyển, sau đó nhập thông tin thanh toán. Bạn sẽ nhận được email xác nhận đơn hàng ngay lập tức.\" category_5=\"Đơn Hàng & Mua Sắm\" category_id_5=\"ordersPurchases\" question_5=\"2. Tôi có thể chỉnh sửa hoặc hủy đơn hàng không?\" answer_5=\"Đơn hàng có thể được chỉnh sửa hoặc hủy từ bảng điều khiển tài khoản của bạn trong vòng 1 giờ sau khi đặt. Sau đó, kho hàng đã bắt đầu soạn hàng và chúng tôi không thể can thiệp.\" category_6=\"Đơn Hàng & Mua Sắm\" category_id_6=\"ordersPurchases\" question_6=\"3. Những phương thức thanh toán nào được chấp nhận?\" answer_6=\"Chúng tôi chấp nhận Visa, Mastercard, American Express, Apple Pay, Google Pay và PayPal. Mọi giao dịch đều sử dụng mã hóa TLS 1.3.\" category_7=\"Đổi Trả & Hoàn Tiền\" category_id_7=\"returnsRefunds\" question_7=\"1. Thời hạn đổi trả là bao lâu?\" answer_7=\"30 ngày kể từ ngày nhận hàng đối với sản phẩm chưa qua sử dụng, còn nguyên trạng. Không áp dụng cho hàng giảm giá, đồ lót và các mặt hàng flash sale bán cuối cùng.\" category_8=\"Đổi Trả & Hoàn Tiền\" category_id_8=\"returnsRefunds\" question_8=\"2. Làm thế nào để bắt đầu quy trình đổi trả?\" answer_8=\"Open the order in your account dashboard and click \\\"Start return\\\". We email a prepaid label for domestic orders within one business day.\" category_9=\"Đổi Trả & Hoàn Tiền\" category_id_9=\"returnsRefunds\" question_9=\"3. Khi nào tôi sẽ nhận được tiền hoàn lại?\" answer_9=\"Tiền hoàn được xử lý trong vòng 3-5 ngày làm việc kể từ khi chúng tôi nhận được hàng trả lại. Thời gian ghi có của ngân hàng có thể khác nhau; vui lòng đợi tối đa 10 ngày làm việc để thấy khoản tiền được ghi nhận.\" category_10=\"Vận Chuyển & Theo Dõi\" category_id_10=\"shippingTracking\" question_10=\"1. Vận chuyển mất bao lâu?\" answer_10=\"Vận chuyển tiêu chuẩn nội địa mất 3-5 ngày làm việc. Vận chuyển nhanh 1-2 ngày. Vận chuyển tiêu chuẩn quốc tế mất 7-12 ngày làm việc; tùy chọn vận chuyển nhanh có sẵn ở trang thanh toán.\" category_11=\"Vận Chuyển & Theo Dõi\" category_id_11=\"shippingTracking\" question_11=\"2. Làm thế nào để theo dõi đơn hàng?\" answer_11=\"Liên kết theo dõi được đính kèm trong email xác nhận vận chuyển. Bạn cũng có thể xem trạng thái từ Tài khoản → Đơn hàng → Theo dõi.\" category_12=\"Vận Chuyển & Theo Dõi\" category_id_12=\"shippingTracking\" question_12=\"3. Bạn có vận chuyển quốc tế không?\" answer_12=\"Có — đến hầu hết các quốc gia. Thuế và phí được trả trước ở trang thanh toán cho một số điểm đến nhất định; nếu không, đơn vị vận chuyển có thể thu khi giao hàng.\" category_13=\"Phí & Thanh Toán\" category_id_13=\"feesBilling\" question_13=\"1. Thuế và phí đã được bao gồm chưa?\" answer_13=\"Giá nội địa bao gồm thuế bán hàng hiển thị ở trang thanh toán. Đơn hàng quốc tế đến các điểm đến được hỗ trợ đã bao gồm thuế và phí; nếu không, đơn vị vận chuyển sẽ thu khi giao hàng.\" category_14=\"Phí & Thanh Toán\" category_id_14=\"feesBilling\" question_14=\"2. Tại sao tôi bị tính phí hai lần?\" answer_14=\"Có thể bạn đang thấy khoản tạm giữ ủy quyền cùng với khoản phí thực tế. Khoản tạm giữ sẽ tự hủy trong 3-5 ngày làm việc. Hãy gửi email đến billing@amerce.test nếu sau thời gian đó bạn vẫn thấy hai khoản phí.\" category_15=\"Chủ Đề Khác\" category_id_15=\"otherTopic\" question_15=\"1. Bạn có cửa hàng vật lý không?\" answer_15=\"Có — vui lòng truy cập trang Cửa hàng để xem danh sách các cửa hàng chính và đối tác.\" category_16=\"Chủ Đề Khác\" category_id_16=\"otherTopic\" question_16=\"2. Làm thế nào để liên hệ bộ phận chăm sóc khách hàng?\" answer_16=\"Gửi email đến hello@amerce.test hoặc sử dụng biểu mẫu liên hệ. Chúng tôi sẽ phản hồi trong vòng một ngày làm việc.\"][/faq-page]'),('vi',4,'Chính sách bảo mật','Cách Amerce thu thập, sử dụng và bảo vệ thông tin cá nhân của bạn.','[page-banner heading=\"Chính Sách Bảo Mật\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Thông Tin Chúng Tôi Thu Thập\" body_1=\"<p class=\\\"term-text cl-text-2\\\">When you visit the Site, we automatically collect certain information about your device — web browser, IP address, time zone, and some of the cookies installed on your device. As you browse, we also collect data about the pages or products you view, what referred you to the Site, and how you interact with it. We refer to this as \\\"Device Information\\\".</p><p class=\\\"term-text cl-text-2\\\">When you make a purchase or attempt to purchase through the Site, we collect your name, billing address, shipping address, and payment information (including card number, email address, and phone number). We refer to this as \\\"Order Information\\\".</p>\" title_2=\"2. Cách Chúng Tôi Sử Dụng Thông Tin Của Bạn\" body_2=\"<p class=\\\"term-text cl-text-2\\\">We use Order Information to fulfil orders placed through the Site (process payment, arrange shipping, provide invoices and order confirmations). We use it to communicate with you, screen orders for fraud, and — in line with your preferences — share marketing about products you may like.</p><p class=\\\"term-text cl-text-2\\\">We use Device Information to screen for fraud and to improve the Site through analytics about how customers browse and interact with us.</p>\" title_3=\"3. Chia Sẻ Thông Tin Cá Nhân Của Bạn\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We share Personal Information with third-party service providers who help us run the Site. We may also share information to comply with applicable laws, respond to a subpoena or lawful request, or otherwise protect our rights.</p>\" title_4=\"4. Lưu Trữ Dữ Liệu\" body_4=\"<p class=\\\"term-text cl-text-2\\\">When you place an order, we maintain the Order Information for our records unless and until you ask us to delete it.</p>\" title_5=\"5. Quyền Của Bạn\" body_5=\"<p class=\\\"term-text cl-text-2\\\">You can request access, correction, or deletion of any personal data we hold about you. Email privacy@amerce.test from the address on file and we will respond within 30 days.</p>\" title_6=\"6. Cookie\" body_6=\"<p class=\\\"term-text cl-text-2\\\">Cookies are used to keep your cart between visits, remember your preferences, and measure aggregate traffic. You can disable cookies in your browser, though some Site features may stop working.</p>\" title_7=\"7. Thay Đổi\" body_7=\"<p class=\\\"term-text cl-text-2\\\">We may update this policy from time to time to reflect changes to our practices or for operational, legal, or regulatory reasons. The latest version will always be on this page.</p>\"][/term-content]'),('vi',5,'Điều khoản & Điều kiện','Các điều khoản pháp lý áp dụng khi bạn sử dụng cửa hàng Amerce.','[page-banner heading=\"Điều Khoản & Điều Kiện\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Chấp Thuận Điều Khoản\" body_1=\"<p class=\\\"term-text cl-text-2\\\">By accessing or using the Mỹ store you agree to these terms. We reserve the right to update them with reasonable notice; the latest version is always available on this page.</p>\" title_2=\"2. Đơn Hàng & Thanh Toán\" body_2=\"<p class=\\\"term-text cl-text-2\\\">All prices are in USD unless otherwise stated. We accept the payment methods displayed at checkout. An order becomes binding once you receive an order confirmation email.</p>\" title_3=\"3. Vận Chuyển\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Vận Chuyển options, lead times, and rates are listed on our Vận Chuyển page. Risk passes to you on delivery.</p>\" title_4=\"4. Đổi Trả\" body_4=\"<p class=\\\"term-text cl-text-2\\\">You have 30 days from delivery to return any unworn item for a refund. See our Đổi Trả &amp; Hoàn Tiền page for the full process.</p>\" title_5=\"5. Sở Hữu Trí Tuệ\" body_5=\"<p class=\\\"term-text cl-text-2\\\">All content on the Site — text, photography, logos, code — is owned by Mỹ or its licensors and may not be reproduced without written permission.</p>\" title_6=\"6. Giới Hạn Trách Nhiệm\" body_6=\"<p class=\\\"term-text cl-text-2\\\">To the maximum extent permitted by law, Mỹ is not liable for indirect or consequential damages arising from use of the Site or the products purchased through it.</p>\" title_7=\"7. Luật Áp Dụng\" body_7=\"<p class=\\\"term-text cl-text-2\\\">These terms are governed by the laws of the State of New York. Any dispute will be resolved in the state or federal courts located in New York County.</p>\"][/term-content]'),('vi',6,'Đổi trả & Hoàn tiền','Chính sách đổi trả 30 ngày và quy trình đổi trả từng bước của chúng tôi.','[page-banner heading=\"Đổi Trả & Hoàn Tiền\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Đổi Trả\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We want you to be completely satisfied with your purchase. If for any reason you are not, you may return any unworn item within 30 days of receiving your order for a refund or exchange. Mặt hàng must be in original packaging and the same condition as you received them.</p>\" title_2=\"2. Cách Bắt Đầu Đổi Trả\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Open the order in your account dashboard and click \\\"Start return\\\", or email returns@amerce.test with your order number. We will send a prepaid return label for domestic orders within one business day.</p>\" title_3=\"3. Hoàn Tiền\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Refunds are processed within 3-5 business days of us receiving the return and applied to the original payment method. Bank posting times vary; allow up to 10 business days for the credit to appear.</p>\" title_4=\"4. Các Trường Hợp Loại Trừ\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Sale items, intimate apparel, and final-sale flash sale purchases are excluded from returns. Personalised or made-to-order items are also non-returnable unless faulty.</p>\" title_5=\"5. Sản Phẩm Bị Hư Hỏng Hoặc Lỗi\" body_5=\"<p class=\\\"term-text cl-text-2\\\">If your order arrives damaged or faulty, email us within 7 days with photos. We will replace the item or issue a full refund — including any return shipping cost — at our expense.</p>\" title_6=\"6. Đổi Trả Quốc Tế\" body_6=\"<p class=\\\"term-text cl-text-2\\\">International customers are responsible for return shipping unless the item is faulty. We do not refund original shipping or duty charges on international returns.</p>\"][/term-content]'),('vi',7,'Vận chuyển','Các phương thức vận chuyển trong nước và quốc tế, thời gian và cước phí.','[page-banner heading=\"Vận Chuyển\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Phương Thức Vận Chuyển\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We offer the following shipping methods for domestic and international orders: standard ground, expedited 2-day, and priority overnight (where available).</p>\" title_2=\"2. Phí Nội Địa\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Standard ground is free on orders over $99. Express 1-2 day shipping is $19.99 flat. Priority overnight is calculated by weight at checkout.</p>\" title_3=\"3. Quốc Tế\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We ship to most countries. International standard shipping is $24.99 with 7-12 business day delivery. Express options appear at checkout. Duties and taxes are pre-paid for select destinations; otherwise the courier collects them on delivery.</p>\" title_4=\"4. Thời Gian Xử Lý\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Orders placed before 2pm EST on business days ship the same day. Orders placed after 2pm or on weekends/holidays ship the next business day.</p>\" title_5=\"5. Theo Dõi\" body_5=\"<p class=\\\"term-text cl-text-2\\\">A tracking link is included in your shipment confirmation email. You can also see live status from Account → Orders → Track.</p>\" title_6=\"6. Đơn Hàng Bị Thất Lạc Hoặc Bị Kẹt\" body_6=\"<p class=\\\"term-text cl-text-2\\\">If a tracking number has not updated for more than 7 business days, email shipping@amerce.test. We will open an investigation with the carrier and either refund or reship the order at our expense.</p>\"][/term-content]'),('vi',8,'Hệ thống cửa hàng','Ghé thăm Amerce trực tiếp — các cửa hàng chính và đối tác trên toàn thế giới.',''),('vi',9,'Tạp chí','Hướng dẫn phối đồ, câu chuyện thương hiệu và nội dung hậu trường từ đội ngũ biên tập Amerce.','<div class=\"container py-5\"><h1>Nhật Ký</h1><p>Khám phá những câu chuyện mới nhất của chúng tôi — hướng dẫn phong cách, điểm nhấn sản phẩm, phân tích chuyên sâu về bền vững và nhiều hơn nữa.</p></div>'),('vi',10,'Tuyển dụng','Tham gia Amerce — các vị trí đang mở, giá trị văn hóa và quyền lợi dành cho đội ngũ.','<div class=\"container py-5\"><h1>Tuyển Dụng Tại Amerce</h1><p>Chúng tôi là một đội ngũ nhỏ, làm việc phân tán, đang xây dựng một mô hình bán lẻ tinh tế hơn. Chúng tôi tuyển dụng trong các mảng sản phẩm, kỹ thuật, chuỗi cung ứng và trải nghiệm khách hàng.</p><p>Các vị trí đang tuyển được đăng trên trang LinkedIn của công ty. Để ứng tuyển, hãy gửi một thư ngắn và sơ yếu lý lịch đến <a href=\"mailto:careers@amerce.test\">careers@amerce.test</a>.</p></div>'),('vi',11,'Sustainability','How Amerce sources responsibly and reduces its environmental footprint.','<div class=\"container py-5\"><h1>Phát Triển Bền Vững Tại Amerce</h1><p>Mỗi sản phẩm đều mang một câu chuyện. Chúng tôi làm việc trực tiếp với các nhà máy và xưởng thủ công, ưu tiên vật liệu tái chế và có thể truy xuất nguồn gốc, và đóng gói không sử dụng nhựa.</p><p>Mục tiêu năm 2026 của chúng tôi: 90% nguyên vật liệu có chuỗi cung ứng được xác minh, và báo cáo tác động hằng năm minh bạch.</p></div>'),('vi',12,'Trang chủ','Amerce — trang chủ trải nghiệm thương mại điện tử đa năng.','[simple-slider key=\"home-hero\" style=\"style-1\" is_autoplay=\"yes\" autoplay_speed=\"5000\" show_arrows=\"yes\" show_dots=\"yes\" nav_arrow_class=\"tf-sw-nav-2 d-lg-flex d-none\" nav_arrow_icon_prev=\"icon-ArrowLeft\" nav_arrow_icon_next=\"icon-ArrowRight\"][/simple-slider]\n[categories-grid style=\"style-slider\" limit=\"5\" show_count=\"yes\" wrapper_class=\"container-layout-right\" card_extra_modifier=\"style-2\" swiper_preview=\"4.3605\" swiper_preview_lg=\"4.3605\" card_image_size=\"original\" count_overrides=\"78,120,48,62,36\" count_label=\"items\"][/categories-grid]\n[ecommerce-products style=\"style-tabs\" limit=\"8\" items_per_row=\"4\" grid_rows=\"2\" section_class=\"ecommerce-products ecommerce-products--style-tabs flat-spacing pt-0\" tab_labels=\"Hàng Mới Về|Bán Chạy Nhất|Đang Khuyến Mãi\" tab_categories=\"||\" tab_sources=\"latest|best-seller|sale\" tab_nav_style=\"v3\" tab_nav_class_extra=\"style-4 justify-content-sm-center mb-0\" tab_btn_class_extra=\"py-4\" tab_label_class=\"h4\"][/ecommerce-products]\n[banner-thumbs-product style=\"style-thumbs-v2\" heading=\"Áo Thun Cotton Gân Ôm\" subheading=\"Thiết kế tối giản của áo thun cotton gân ôm tập trung vào nhu cầu người dùng, cho phép thích ứng và phù hợp với nhiều môi trường.\" product_ids=\"1,2,3\" square_image_1=\"products/fashion-2/square/product-1-2.jpg\" square_image_2=\"products/fashion-2/square/product-2-2.jpg\" square_image_3=\"products/fashion-2/square/product-4-2.jpg\"][/banner-thumbs-product]\n[ecommerce-collections style=\"style-accordion-tabs\" title=\"Bộ Sưu Tập Tuyển Chọn Cho Phong Cách\" subtitle=\"Những món thời trang được thiết kế tỉ mỉ, định nghĩa vẻ thanh lịch hiện đại.\" collection_ids=\"1,2,3,4\" container_class=\"container\" card_modifier=\"style-2 st-2_2\" accordion_modifier=\"style-2\" title_class=\"h5 fw-medium\" button_text=\"Mua Bộ Sưu Tập\" button_url=\"/products\" image_size=\"original\"][/ecommerce-collections]\n[infinity-marquee style=\"style-1\" background_class=\"bg-main-2\" spacing_class=\"\" clone_count=\"3\" quantity=\"6\" heading_1=\"Tối Giản Hiện Đại\" image_1=\"collection/cls-34.jpg\" link_1=\"/products\" heading_2=\"Thủ Công Nghệ Nhân\" image_2=\"collection/cls-35.jpg\" link_2=\"/products\" heading_3=\"Xa Xỉ Bền Vững\" image_3=\"collection/cls-36.jpg\" link_3=\"/products\" heading_4=\"Sang Trọng Và Tiện Dụng\" image_4=\"collection/cls-37.jpg\" link_4=\"/products\" heading_5=\"Tự Tin Trong Từng Bước Đi\" image_5=\"collection/cls-38.jpg\" link_5=\"/products\" heading_6=\"Sự Tự Tin Được Tuyển Chọn\" image_6=\"collection/cls-3.jpg\" link_6=\"/products\"][/infinity-marquee]\n[ecommerce-products style=\"style-slider-side-heading\" title=\"Áo Len Và Đồ Len Nổi Bật\" subtitle=\"Bộ sưu tập đồ len được tuyển chọn của chúng tôi mang lại sự ấm áp tối đa và phong cách hoàn hảo.\" source=\"featured\" limit=\"6\" items_per_row=\"3\" view_all_url=\"/products\" view_all_text=\"Xem Tất Cả Sản Phẩm\"][/ecommerce-products]\n[testimonials style=\"style-v4\" title=\"Khách Hàng Nói Gì Về Chúng Tôi\" subtitle=\"Những câu chuyện thật từ những người yêu thích sản phẩm của chúng tôi.\" autoplay=\"yes\" limit=\"6\" card_modifier=\"style-2\" container_class=\"container-full\" preview=\"3\" bg_main=\"yes\" view_all_url=\"/products\" view_all_text=\"Đọc Tất Cả Đánh Giá\" section_class=\"flat-spacing pt-0\" testimonial_product_ids=\"1,4,9\"][/testimonials]\n[image-gallery style=\"style-default\" title=\"Theo Dõi Chúng Tôi Trên Instagram\" subtitle=\"@Amerce\" skip_spacing=\"yes\" extra_section_class=\"px-10 pb-40\" quantity=\"5\" image_1=\"gallery/gallery-52.jpg\" link_1=\"/products\" image_2=\"gallery/gallery-53.jpg\" link_2=\"/products\" image_3=\"gallery/gallery-54.jpg\" link_3=\"/products\" image_4=\"gallery/gallery-55.jpg\" link_4=\"/products\" image_5=\"gallery/gallery-56.jpg\" link_5=\"/products\"][/image-gallery]');
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
INSERT INTO `post_categories` VALUES (4,1),(3,1),(3,2),(1,2),(3,3),(4,3),(2,4),(4,4),(1,5),(3,5),(4,6);
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
INSERT INTO `post_tags` VALUES (1,1),(6,1),(7,1),(3,2),(6,2),(7,2),(12,3),(5,3),(8,4),(5,4),(3,4),(8,5),(4,5),(11,5),(3,6),(8,6),(2,6);
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
INSERT INTO `posts` VALUES (1,'The Style Edit: Fall Essentials','Six pieces that anchor a fall wardrobe without competing with one another.','<p>Fall dressing rewards restraint. Start with a wool coat that fits across the shoulders, a pair of leather boots that get better with wear, and a knit you reach for twice a week. Add a pleated trouser, a structured tote, and a silk scarf — that is the whole edit.</p><p>Trends are rented. The pieces above are owned.</p>','published',1,'Botble\\ACL\\Models\\User',1,NULL,615,NULL,'2026-05-28 19:02:44','2026-05-28 19:02:44'),(2,'Building a Capsule Wardrobe That Actually Works','A capsule is a system, not a count. Heres how to build one that survives the season.','<p>Stop counting hangers. Start counting outfits. A working capsule produces 15-20 looks from 25-30 pieces — every item must combine with at least three others. If a piece only goes with one outfit, it is a costume, not a wardrobe item.</p><p>Edit by use, not by aspiration.</p>','published',1,'Botble\\ACL\\Models\\User',1,NULL,352,NULL,'2026-05-28 19:02:44','2026-05-28 19:02:44'),(3,'Investment Pieces: What Is Actually Worth It','Where to spend, where to save, and the four items that earn their cost-per-wear.','<p>Spend on what touches your skin every day and what holds the shape of an outfit: a tailored coat, leather shoes, a quality bag, and a perfectly-fitted denim. Save on trend layers, accessories with limited combinations, and anything photographed for a single event.</p><p>Cost per wear is the only honest math.</p>','published',1,'Botble\\ACL\\Models\\User',1,NULL,2263,NULL,'2026-05-28 19:02:44','2026-05-28 19:02:44'),(4,'How to Mix Vintage with Modern Without Looking Costumed','One vintage piece per outfit. Modern fit. The two rules that keep the look intentional.','<p>The trick to mixing vintage with modern is committing to one era per outfit. A 70s blouse pairs cleanly with a contemporary trouser; pair it with a 70s flare and it becomes a costume. Let the vintage piece be the loudest voice in the room.</p><p>Keep the silhouette modern. The story is in the fabric.</p>','published',1,'Botble\\ACL\\Models\\User',1,NULL,1420,NULL,'2026-05-28 19:02:44','2026-05-28 19:02:44'),(5,'Jewelry Layering: A Practical Guide','Three lengths, two metals, one statement. The math behind a layered look that lasts the day.','<p>Stick to three necklace lengths separated by at least two inches. Mix gold and silver with intention — keep one as the dominant tone (60% of the metal), and let the other accent. Coordinate hardware on bags and belts to one of those tones.</p><p>The goal is curated, not crowded.</p>','published',1,'Botble\\ACL\\Models\\User',1,NULL,306,NULL,'2026-05-28 19:02:44','2026-05-28 19:02:44'),(6,'Caring for Knitwear So It Lasts More Than One Winter','Cold water, fold dont hang, and the cedar block trick that costs less than a coffee.','<p>Wash knitwear inside-out on a wool cycle, lay flat to dry, and never hang on the shoulder — gravity destroys the silhouette. Store with cedar blocks in a breathable cotton bag. Pill remover on cuffs and elbows once a month keeps fabric looking new for years.</p><p>Good knit habits add seasons of wear.</p>','published',1,'Botble\\ACL\\Models\\User',0,NULL,2199,NULL,'2026-05-28 19:02:44','2026-05-28 19:02:44');
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
INSERT INTO `posts_translations` VALUES ('ar',1,'تحرير النمط: أساسيات الخريف','ست قطع ترسيخ خزانة ملابسك الخريفية دون أن تغلب بعضها البعض.','<p> أزياء الخريف تكافئ الاعتدال. ابدأ بمعطف من الصوف يناسب كتفيك، وزوج من الأحذية الجلدية التي تتحسن مع ارتدائها، وسترة تخرجها وترتديها مرتين في الأسبوع. أضف زوجًا من السراويل ذات الثنيات، وحقيبة كبيرة أنيقة ووشاحًا حريريًا - هذه هي المجموعة بأكملها.</p><p>الاتجاه السائد هو الإيجارات. العناصر المذكورة أعلاه هي ملكية.</p>'),('ar',2,'بناء خزانة كبسولة تعمل بالفعل','خزانة الملابس البسيطة هي نظام، وليس رقمًا. فيما يلي كيفية بناء خزانة ملابس تصمد أمام الموسم.','<p> لا تحسب الشماعات. دعونا نحسب الملابس. تخلق خزانة الملابس البسيطة الفعالة ما بين 15 إلى 20 مظهرًا من 25 إلى 30 قطعة - يجب أن يقترن كل عنصر بثلاثة عناصر أخرى على الأقل. إذا كان أحد العناصر يناسب زيًا واحدًا فقط، فهو زي، وليس قطعة خزانة ملابس.</p><p>اختر بناءً على الوظيفة، وليس الأحلام.</p>'),('ar',3,'القطع الاستثمارية: ما الذي يستحق ذلك بالفعل؟','أين تنفق أموالك، وأين تدخر، وأربع قطع تستحق التكلفة لكل ارتداء.','<p> أنفق على ما يلامس بشرتك كل يوم وما يحافظ على مظهرك: سترة مصممة خصيصًا، وأحذية جلدية، وحقيبة عالية الجودة، وزوج من الجينز الذي يناسبك تمامًا. وفّر على الطبقات العصرية والإكسسوارات منخفضة المزيج وأي شيء تم تصويره لحدث واحد.</p><p>تكلفة كل ارتداء هي الحساب الصادق الوحيد.</p>'),('ar',4,'كيفية المزج بين الطراز القديم والحديث دون أن تبدو أنيقًا','عنصر واحد عتيق لكل جماعة. شكل حديث. هناك قاعدتان تحافظان على المظهر المتعمد.','<p> السر في المزج بين الملابس القديمة والحديثة هو الالتزام بفترة معينة لكل زي. تم دمج بلوزة السبعينيات بشكل أنيق مع بنطال معاصر؛ ارتديه مع بنطال واسع من السبعينيات وسيصبح زيًا. اجعل الطراز القديم هو الصوت الأبرز في الغرفة.</p><p>حافظ على المظهر العصري. القصة تكمن في مادة القماش.</p>'),('ar',5,'طبقات المجوهرات: دليل عملي','ثلاثة أطوال، معدنان، لهجة واحدة. الرياضيات وراء المظهر متعدد الطبقات طوال اليوم.','<p> حافظ على أطوال القلادة الثلاثة متباعدة بوصتين على الأقل. امزجي الذهب والفضة بشكل هادف - احتفظي بدرجة واحدة مهيمنة (60% معدنية)، واتركي اللون الآخر هو الأبرز. قم بمطابقة الأبازيم المعدنية الموجودة على الحقيبة والحزام بأحد هذه الألوان.</p><p>الهدف هو أن يتم اختيارك وليس الازدحام.</p>'),('ar',6,'العناية بالملابس المحبوكة حتى تدوم لأكثر من شتاء واحد','الماء البارد لا تتعجل، وخدعة كتلة الأرز التي تكلف أقل من فنجان قهوة.','<p> اغسل الملابس الصوفية من الداخل إلى الخارج على إعداد الصوف، وعلقها حتى تجف، ولا تعلقها أبدًا على كتفيك - فالجاذبية تدمر الشكل. قم بتخزين كتل الأرز في كيس قطني قابل للتنفس. إن استخدام أداة إزالة الكشكشة على الأساور والمرفقين مرة واحدة شهريًا سيبقي القماش يبدو وكأنه جديد لسنوات عديدة.</p><p>ستساعد عادات العناية الجيدة بالصوف على الاستمرار في مواسم عديدة من الاستخدام.</p>'),('fr',1,'L\'édition de style : les essentiels de l\'automne','Six pièces qui ancrent votre garde-robe d’automne sans se dominer.','<p>Les tenues d\'automne récompensent la modération. Commencez avec un manteau en laine qui s\'adapte à vos épaules, une paire de bottes en cuir qui s\'améliorent avec l\'usure et un pull que vous sortez et portez deux fois par semaine. Ajoutez un pantalon plissé, un sac fourre-tout galbé et un foulard en soie : c\'est toute la collection.</p><p>La tendance est à la location. Les éléments ci-dessus sont la propriété.</p>'),('fr',2,'Construire une armoire capsule qui fonctionne réellement','Une garde-robe minimaliste est un système, pas un numéro. Voici comment construire une garde-robe qui survit à la saison.','<p>Ne comptez pas les cintres. Comptons les tenues. Une garde-robe minimaliste efficace crée 15 à 20 looks à partir de 25 à 30 articles — chaque article doit être associé à au moins trois autres articles. Si un article ne convient qu\'à une seule tenue, c\'est un costume, pas un article de garde-robe.</p><p>Choisissez en fonction de la fonction, pas des rêves.</p>'),('fr',3,'Pièces d\'investissement : ce qui en vaut réellement la peine','Où dépenser votre argent, où économiser et quatre pièces qui valent le coût par usure.','<p>Dépensez pour ce qui touche votre peau au quotidien et ce qui maintient une tenue en forme : une veste ajustée, des chaussures en cuir, un sac de qualité et un jean parfaitement ajusté. Économisez sur les superpositions tendance, les accessoires à faible mélange et tout ce qui est photographié pour un seul événement.</p><p>Le coût par tenue est le seul calcul honnête.</p>'),('fr',4,'Comment mélanger le vintage avec le moderne sans avoir l\'air costumé','Un article vintage par tenue. Forme moderne. Deux règles gardent le look intentionnel.','<p>Le secret pour mélanger vêtements vintage et modernes est de s\'engager sur une période pour chaque tenue. Un chemisier des années 70 se combine parfaitement avec un pantalon contemporain ; Associez-le à un pantalon évasé des années 70 et il deviendra un costume. Laissez le vintage être la voix la plus importante dans la pièce.</p><p>Gardez un look moderne. L\'histoire réside dans le matériau du tissu.</p>'),('fr',5,'Superposition de bijoux : un guide pratique','Trois longueurs, deux métaux, un accent. Le calcul derrière le look superposé qui dure toute la journée.','<p>Gardez les trois longueurs de collier à au moins deux pouces l\'une de l\'autre. Mélangez délibérément l’or et l’argent – ​​gardez un ton dominant (60 % métallique) et laissez l’autre ton être le point culminant. Assortissez les boucles métalliques du sac et de la ceinture dans l\'une de ces couleurs.</p><p>L\'objectif est d\'être sélectionné, pas encombré.</p>'),('fr',6,'Prendre soin des tricots pour qu’ils durent plus d’un hiver','De l\'eau froide, ne vous précipitez pas, et une astuce en blocs de cèdre qui coûte moins cher qu\'une tasse de café.','<p>Lavez les vêtements en laine à l’envers sur le programme laine, suspendez-les pour les faire sécher et ne les suspendez jamais sur vos épaules – la gravité détruit leur forme. Conserver avec des blocs de cèdre dans un sac en coton respirant. L\'utilisation d\'un outil anti-ébouriffage sur les poignets et les coudes une fois par mois permettra au tissu de conserver son aspect neuf pendant de nombreuses années.</p><p>De bonnes habitudes d\'entretien de la laine aideront à durer de nombreuses saisons d\'utilisation.</p>'),('id',1,'Pengeditan Gaya: Esensi Musim Gugur','Enam potong pakaian yang menjadi sandaran lemari pakaian musim gugur Anda tanpa saling membebani.','<p>Pakaian musim gugur menghargai moderasi. Mulailah dengan mantel wol yang pas di bahu Anda, sepasang sepatu bot kulit yang semakin cocok jika dipakai, dan sweter yang Anda lepas dan kenakan dua kali seminggu. Tambahkan celana lipit, tas jinjing yang indah, dan syal sutra — itulah keseluruhan koleksinya.</p><p>Trennya adalah rental. Barang-barang di atas adalah properti.</p>'),('id',2,'Membangun Lemari Pakaian Kapsul yang Benar-benar Berfungsi','Lemari pakaian minimalis adalah sebuah sistem, bukan angka. Inilah cara membuat lemari pakaian yang tahan musim.','<p>Jangan hitung gantungannya. Mari kita hitung pakaiannya. Lemari pakaian minimalis yang efektif menghasilkan 15-20 tampilan dari 25-30 item — setiap item harus dipasangkan dengan setidaknya tiga item lainnya. Jika suatu barang hanya muat untuk satu pakaian, itu adalah kostum, bukan item lemari pakaian.</p><p>Pilih berdasarkan fungsi, bukan impian.</p>'),('id',3,'Potongan Investasi: Apa yang Sebenarnya Bermanfaat','Di mana harus membelanjakan uang Anda, di mana harus menabung, dan empat potong pakaian yang sepadan dengan biaya per pemakaiannya.','<p>Belanjakan apa yang menyentuh kulit Anda setiap hari dan apa yang menjaga bentuk pakaian: jaket khusus, sepatu kulit, tas berkualitas, dan celana jeans yang pas. Menghemat layering yang sedang tren, aksesori low-mix, dan apa pun yang difoto untuk satu acara.</p><p>Biaya per pemakaian adalah satu-satunya perhitungan yang jujur.</p>'),('id',4,'Cara Memadukan Vintage dengan Modern Tanpa Terlihat Berkostum','Satu item vintage per pakaian. Bentuk masa kini. Ada dua aturan yang membuat tampilan tetap disengaja.','<p>Rahasia memadukan pakaian vintage dan modern adalah dengan memberikan jangka waktu pada setiap pakaian. Blus tahun 70-an dipadukan rapi dengan celana kekinian; Padukan dengan celana flare tahun 70an dan itu akan menjadi kostum. Biarkan gaya vintage menjadi suara paling menonjol di ruangan.</p><p>Pertahankan tampilan modern. Ceritanya terletak pada bahan kainnya.</p>'),('id',5,'Pelapisan Perhiasan: Panduan Praktis','Tiga panjang, dua logam, satu aksen. Perhitungan di balik tampilan berlapis sepanjang hari.','<p>Jauhkan jarak ketiga panjang kalung setidaknya dua inci. Campurkan emas dan perak dengan sengaja — pertahankan satu nada dominan (60% metalik), dan biarkan nada lainnya menjadi sorotan. Koordinasikan gesper logam pada tas dan ikat pinggang dengan salah satu warna tersebut.</p><p>Tujuannya agar terpilih, tidak ramai.</p>'),('id',6,'Merawat Pakaian Rajut Agar Tahan Lebih Dari Satu Musim Dingin','Air dingin, jangan terburu-buru, dan trik balok kayu cedar yang harganya kurang dari secangkir kopi.','<p>Cuci pakaian wol bagian dalam ke luar pada pengaturan wol, gantung hingga kering, dan jangan pernah menggantungkannya di bahu Anda — gravitasi merusak bentuk. Simpan dengan balok kayu cedar di dalam kantong katun yang dapat menyerap keringat. Menggunakan alat penghilang kerutan pada manset dan siku sebulan sekali akan membuat kain tampak seperti baru selama bertahun-tahun.</p><p>Kebiasaan merawat wol yang baik akan membantu penggunaan selama beberapa musim.</p>'),('tr',1,'Stil Düzenlemesi: Sonbaharın Temelleri','Sonbahar gardırobunuzu birbirini zorlamadan sabitleyen altı parça.','<p>Sonbahar kıyafetleri ölçülü olmayı ödüllendirir. Omuzlarınıza tam oturan bir yün ceket, giydikçe güzelleşen bir çift deri çizme ve haftada iki kez çıkarıp giyeceğiniz bir kazakla başlayın. Bir çift pilili pantolon, düzgün bir tote çanta ve ipek bir eşarp ekleyin; koleksiyonun tamamı budur.</p><p>Trend kiralamadır. Yukarıdaki öğeler mülktür.</p>'),('tr',2,'Gerçekten İşe Yarayan Bir Kapsül Gardırop İnşa Etmek','Minimalist bir gardırop bir sayı değil, bir sistemdir. Sezonu atlatabilecek bir gardırobun nasıl oluşturulacağı aşağıda açıklanmıştır.','<p>Askıları saymayın. Kıyafetleri sayalım. Etkili bir minimalist gardırop, 25-30 parçadan 15-20 görünüm yaratır; her parça en az diğer üç parçayla eşleşmelidir. Bir ürün yalnızca tek bir kıyafete uyuyorsa bu bir gardırop ürünü değil, bir kostümdür.</p><p>Hayallere göre değil, işleve göre seçim yapın.</p>'),('tr',3,'Yatırım Parçaları: Aslında Buna Değer','Paranızı nereye harcayacağınız, nereye tasarruf edeceğiniz ve aşınma başına maliyete değecek dört parça.','<p>Her gün cildinize dokunan ve kıyafetinizi formda tutan şeylere harcayın: dikilmiş bir ceket, deri ayakkabılar, kaliteli bir çanta ve üzerinize tam oturan bir kot pantolon. Trend olan katmanlardan, düşük karışımlı aksesuarlardan ve tek bir etkinlik için fotoğraflanan her şeyden tasarruf edin.</p><p>Aşınma başına maliyet tek dürüst hesaplamadır.</p>'),('tr',4,'Kostümlü Görünmeden Vintage ile Modern Nasıl Karıştırılır?','Kıyafet başına bir vintage ürün. Modern şekil. İki kural görünümü kasıtlı tutar.','<p>Vintage ve modern kıyafetleri karıştırmanın sırrı, her kıyafet için bir dönem ayırmaktır. 70\'lerden kalma bir bluz, bir çift çağdaş pantolonla zarif bir şekilde birleştirilmiştir; Bunu 70\'lerin geniş pantolonuyla eşleştirdiğinizde kostüm haline gelir. Vintage odadaki en öne çıkan ses olsun.</p><p>Modern bir görünüm sağlayın. Hikaye kumaş malzemesinde yatıyor.</p>'),('tr',5,'Jewelry Layering: A Practical Guide','Üç uzunluk, iki metal, bir vurgu. Tüm gün süren katmanlı görünümün ardındaki matematik.','<p>Üç kolye uzunluğunu en az beş inç aralıklı tutun. Altın ve gümüşü bilinçli bir şekilde karıştırın; bir tonu baskın tutun (%60 metalik) ve diğer tonun öne çıkmasına izin verin. Çanta ve kemerlerdeki metal tokaları bu tonlardan birinde koordine edin.</p><p>Amaç kalabalık değil, seçilmek.</p>'),('tr',6,'Caring for Knitwear So It Lasts More Than One Winter','Soğuk su, acele etmeyin ve bir fincan kahveden daha ucuza mal olan sedir blok numarası.','<p>Yünlü giysileri yünlü ayarında tersten yıkayın, kuruması için asın ve asla omuzlarınızın üzerine asmayın; yer çekimi şekli bozar. Sedir bloklarıyla birlikte nefes alabilen pamuklu bir çantada saklayın. Manşet ve dirseklerde ayda bir kez kırışık giderme aleti kullanmak, kumaşın uzun yıllar yeni gibi görünmesini sağlayacaktır.</p><p>İyi yün bakım alışkanlıkları, kullanımın birçok sezon sürmesine yardımcı olacaktır.</p>'),('vi',1,'Tuyển Chọn Phong Cách: Những Món Đồ Thiết Yếu Mùa Thu','Sáu món đồ làm trụ cột cho tủ đồ mùa thu mà không lấn át nhau.','<p>Trang phục mùa thu tưởng thưởng cho sự tiết chế. Bắt đầu với một chiếc áo khoác len vừa vai, một đôi bốt da càng đi càng đẹp, và một chiếc áo len bạn lấy ra mặc hai lần mỗi tuần. Thêm một chiếc quần xếp ly, một chiếc túi tote định hình và một chiếc khăn lụa — đó là toàn bộ tuyển tập.</p><p>Xu hướng là đồ đi thuê. Những món đồ trên là đồ sở hữu.</p>'),('vi',2,'Xây Dựng Tủ Đồ Tối Giản Thật Sự Hiệu Quả','Tủ đồ tối giản là một hệ thống, không phải con số. Đây là cách xây dựng một tủ đồ sống sót qua mùa.','<p>Đừng đếm móc treo. Hãy đếm bộ trang phục. Một tủ đồ tối giản hiệu quả tạo ra 15-20 diện mạo từ 25-30 món đồ — mỗi món phải kết hợp được với ít nhất ba món khác. Nếu một món chỉ hợp với một bộ trang phục, đó là trang phục hóa trang, không phải món đồ trong tủ.</p><p>Hãy chọn lọc theo công năng, không phải theo mơ ước.</p>'),('vi',3,'Những Món Đồ Đáng Đầu Tư: Điều Gì Thật Sự Xứng Đáng','Nên chi tiền ở đâu, nên tiết kiệm ở đâu, và bốn món đồ xứng đáng với chi phí trên mỗi lần mặc.','<p>Hãy chi cho những gì chạm vào da bạn mỗi ngày và những gì giữ phom dáng cho một bộ trang phục: áo khoác may đo, giày da, một chiếc túi chất lượng và một chiếc quần jeans vừa vặn hoàn hảo. Tiết kiệm với những lớp đồ theo xu hướng, phụ kiện ít khả năng kết hợp và bất cứ thứ gì chụp ảnh cho một sự kiện duy nhất.</p><p>Chi phí trên mỗi lần mặc là phép toán trung thực duy nhất.</p>'),('vi',4,'Cách Phối Đồ Vintage Với Hiện Đại Mà Không Trông Như Hóa Trang','Một món vintage mỗi bộ trang phục. Phom dáng hiện đại. Hai quy tắc giữ cho diện mạo có chủ đích.','<p>Bí quyết phối đồ vintage với hiện đại là cam kết một thời kỳ cho mỗi bộ trang phục. Một chiếc áo blouse thập niên 70 phối gọn gàng với một chiếc quần âu đương đại; phối nó với một chiếc quần loe thập niên 70 thì nó trở thành trang phục hóa trang. Hãy để món vintage là tiếng nói nổi bật nhất trong căn phòng.</p><p>Giữ phom dáng hiện đại. Câu chuyện nằm ở chất liệu vải.</p>'),('vi',5,'Phối Lớp Trang Sức: Cẩm Nang Thực Tế','Ba độ dài, hai loại kim loại, một điểm nhấn. Phép toán đằng sau diện mạo phối lớp bền cả ngày.','<p>Hãy giữ ba độ dài vòng cổ cách nhau ít nhất hai inch. Phối vàng và bạc một cách có chủ đích — giữ một tông làm chủ đạo (60% kim loại), và để tông kia làm điểm nhấn. Phối khóa kim loại trên túi và thắt lưng theo một trong những tông đó.</p><p>Mục tiêu là được tuyển chọn, không phải chen chúc.</p>'),('vi',6,'Chăm Sóc Đồ Len Để Dùng Được Hơn Một Mùa Đông','Nước lạnh, gấp đừng treo, và mẹo dùng khối gỗ tuyết tùng có giá rẻ hơn một ly cà phê.','<p>Giặt đồ len lộn trái ở chế độ len, phơi nằm cho khô, và đừng bao giờ treo trên vai — trọng lực phá hủy phom dáng. Cất giữ với khối gỗ tuyết tùng trong túi cotton thoáng khí. Dùng dụng cụ gỡ xù trên cổ tay áo và khuỷu tay mỗi tháng một lần giúp vải trông như mới trong nhiều năm.</p><p>Thói quen chăm sóc đồ len tốt giúp kéo dài thêm nhiều mùa sử dụng.</p>');
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
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.cms\":true,\"core.manage.license\":true,\"systems.cronjob\":true,\"core.tools\":true,\"tools.data-synchronize\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.common\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"settings.phone-number\":true,\"settings.others\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"pages.export\":true,\"pages.import\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"sitemap.settings\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"theme.robots-txt\":true,\"settings.website-tracking\":true,\"widgets.index\":true,\"ads.index\":true,\"ads.create\":true,\"ads.edit\":true,\"ads.destroy\":true,\"ads.settings\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"announcements.index\":true,\"announcements.create\":true,\"announcements.edit\":true,\"announcements.destroy\":true,\"announcements.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"blog.reports\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"posts.export\":true,\"posts.import\":true,\"captcha.settings\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.custom-fields\":true,\"contact.settings\":true,\"plugins.ecommerce\":true,\"ecommerce.report.index\":true,\"products.index\":true,\"products.create\":true,\"products.edit\":true,\"products.destroy\":true,\"products.duplicate\":true,\"ecommerce.product-prices.index\":true,\"ecommerce.product-prices.edit\":true,\"ecommerce.product-inventory.index\":true,\"ecommerce.product-inventory.edit\":true,\"product-categories.index\":true,\"product-categories.create\":true,\"product-categories.edit\":true,\"product-categories.destroy\":true,\"product-tag.index\":true,\"product-tag.create\":true,\"product-tag.edit\":true,\"product-tag.destroy\":true,\"brands.index\":true,\"brands.create\":true,\"brands.edit\":true,\"brands.destroy\":true,\"product-collections.index\":true,\"product-collections.create\":true,\"product-collections.edit\":true,\"product-collections.destroy\":true,\"product-attribute-sets.index\":true,\"product-attribute-sets.create\":true,\"product-attribute-sets.edit\":true,\"product-attribute-sets.destroy\":true,\"product-attributes.index\":true,\"product-attributes.create\":true,\"product-attributes.edit\":true,\"product-attributes.destroy\":true,\"tax.index\":true,\"tax.create\":true,\"tax.edit\":true,\"tax.destroy\":true,\"reviews.index\":true,\"reviews.create\":true,\"reviews.destroy\":true,\"reviews.publish\":true,\"reviews.reply\":true,\"ecommerce.shipments.index\":true,\"ecommerce.shipments.create\":true,\"ecommerce.shipments.edit\":true,\"ecommerce.shipments.destroy\":true,\"orders.index\":true,\"orders.create\":true,\"orders.edit\":true,\"orders.destroy\":true,\"discounts.index\":true,\"discounts.create\":true,\"discounts.edit\":true,\"discounts.destroy\":true,\"customers.index\":true,\"customers.create\":true,\"customers.edit\":true,\"customers.destroy\":true,\"ecommerce.customers.import\":true,\"ecommerce.customers.export\":true,\"ecommerce.customer-carts.index\":true,\"ecommerce.customer-carts.destroy\":true,\"flash-sale.index\":true,\"flash-sale.create\":true,\"flash-sale.edit\":true,\"flash-sale.destroy\":true,\"product-label.index\":true,\"product-label.create\":true,\"product-label.edit\":true,\"product-label.destroy\":true,\"ecommerce.import.products.index\":true,\"ecommerce.export.products.index\":true,\"order_returns.index\":true,\"order_returns.edit\":true,\"order_returns.destroy\":true,\"global-option.index\":true,\"global-option.create\":true,\"global-option.edit\":true,\"global-option.destroy\":true,\"ecommerce.invoice.index\":true,\"ecommerce.invoice.edit\":true,\"ecommerce.invoice.destroy\":true,\"ecommerce.settings\":true,\"ecommerce.settings.general\":true,\"ecommerce.invoice-template.index\":true,\"ecommerce.settings.currencies\":true,\"ecommerce.settings.products\":true,\"ecommerce.settings.product-search\":true,\"ecommerce.settings.digital-products\":true,\"ecommerce.settings.store-locators\":true,\"ecommerce.settings.invoices\":true,\"ecommerce.settings.product-reviews\":true,\"ecommerce.settings.customers\":true,\"ecommerce.settings.shopping\":true,\"ecommerce.settings.taxes\":true,\"ecommerce.settings.shipping\":true,\"ecommerce.shipping-rule-items.index\":true,\"ecommerce.shipping-rule-items.create\":true,\"ecommerce.shipping-rule-items.edit\":true,\"ecommerce.shipping-rule-items.destroy\":true,\"ecommerce.shipping-rule-items.bulk-import\":true,\"ecommerce.settings.tracking\":true,\"ecommerce.settings.standard-and-format\":true,\"ecommerce.settings.checkout\":true,\"ecommerce.settings.return\":true,\"ecommerce.settings.flash-sale\":true,\"ecommerce.settings.pending-orders\":true,\"ecommerce.settings.product-specification\":true,\"product-categories.export\":true,\"product-categories.import\":true,\"product-license-codes.import\":true,\"orders.export\":true,\"ecommerce.product-specification.index\":true,\"ecommerce.specification-groups.index\":true,\"ecommerce.specification-groups.create\":true,\"ecommerce.specification-groups.edit\":true,\"ecommerce.specification-groups.destroy\":true,\"ecommerce.specification-attributes.index\":true,\"ecommerce.specification-attributes.create\":true,\"ecommerce.specification-attributes.edit\":true,\"ecommerce.specification-attributes.destroy\":true,\"ecommerce.specification-tables.index\":true,\"ecommerce.specification-tables.create\":true,\"ecommerce.specification-tables.edit\":true,\"ecommerce.specification-tables.destroy\":true,\"ecommerce.product-specifications.import\":true,\"ecommerce.product-specifications.export\":true,\"plugin.faq\":true,\"faq.index\":true,\"faq.create\":true,\"faq.edit\":true,\"faq.destroy\":true,\"faq_category.index\":true,\"faq_category.create\":true,\"faq_category.edit\":true,\"faq_category.destroy\":true,\"faqs.settings\":true,\"product-size-guide.index\":true,\"product-size-guide.create\":true,\"product-size-guide.edit\":true,\"product-size-guide.destroy\":true,\"size-guide-headers.index\":true,\"size-guide-headers.create\":true,\"size-guide-headers.edit\":true,\"size-guide-headers.destroy\":true,\"product-size-guide.settings\":true,\"galleries.index\":true,\"galleries.create\":true,\"galleries.edit\":true,\"galleries.destroy\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"translations.import\":true,\"translations.export\":true,\"property-translations.import\":true,\"property-translations.export\":true,\"page-translations.export\":true,\"page-translations.import\":true,\"plugin.location\":true,\"country.index\":true,\"country.create\":true,\"country.edit\":true,\"country.destroy\":true,\"state.index\":true,\"state.create\":true,\"state.edit\":true,\"state.destroy\":true,\"city.index\":true,\"city.create\":true,\"city.edit\":true,\"city.destroy\":true,\"marketplace.index\":true,\"marketplace.store.index\":true,\"marketplace.store.create\":true,\"marketplace.store.edit\":true,\"marketplace.store.destroy\":true,\"marketplace.store.view\":true,\"marketplace.store.revenue.create\":true,\"marketplace.withdrawal.index\":true,\"marketplace.withdrawal.edit\":true,\"marketplace.withdrawal.destroy\":true,\"marketplace.withdrawal.invoice\":true,\"marketplace.vendors.index\":true,\"marketplace.unverified-vendors.index\":true,\"marketplace.vendors.control\":true,\"marketplace.unverified-vendors.edit\":true,\"marketplace.reports\":true,\"marketplace.settings\":true,\"marketplace.messages.index\":true,\"marketplace.messages.edit\":true,\"marketplace.messages.destroy\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"newsletter.settings\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"payments.logs\":true,\"payments.logs.show\":true,\"payments.logs.destroy\":true,\"request-log.index\":true,\"request-log.destroy\":true,\"sale-popup.settings\":true,\"simple-slider.index\":true,\"simple-slider.create\":true,\"simple-slider.edit\":true,\"simple-slider.destroy\":true,\"simple-slider-item.index\":true,\"simple-slider-item.create\":true,\"simple-slider-item.edit\":true,\"simple-slider-item.destroy\":true,\"social-login.settings\":true,\"testimonial.index\":true,\"testimonial.create\":true,\"testimonial.edit\":true,\"testimonial.destroy\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true,\"theme-translations.export\":true,\"other-translations.export\":true,\"theme-translations.import\":true,\"other-translations.import\":true,\"api.settings\":true,\"api.sanctum-token.index\":true,\"api.sanctum-token.create\":true,\"api.sanctum-token.destroy\":true}','Admin users role',1,1,1,'2026-05-28 19:02:43','2026-05-28 19:02:43');
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
INSERT INTO `settings` VALUES (2,'api_enabled','0',NULL,'2026-05-28 19:03:15'),(3,'activated_plugins','[\"language\",\"language-advanced\",\"ads\",\"analytics\",\"announcement\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"ecommerce\",\"faq\",\"fob-product-size-guide\",\"gallery\",\"location\",\"marketplace\",\"mollie\",\"newsletter\",\"payment\",\"paypal\",\"paypal-payout\",\"paystack\",\"razorpay\",\"request-log\",\"sale-popup\",\"shippo\",\"simple-slider\",\"social-login\",\"sslcommerz\",\"stripe\",\"stripe-connect\",\"testimonial\",\"translation\"]',NULL,'2026-05-28 19:03:15'),(8,'media_random_hash','52df498236e58a2c702b50149ccc3fe1',NULL,'2026-05-28 19:03:15'),(9,'theme','amerce',NULL,'2026-05-28 19:03:15'),(10,'show_admin_bar','1',NULL,'2026-05-28 19:03:15'),(11,'admin_email.0','support@amerce.test',NULL,'2026-05-28 19:03:15'),(12,'admin_logo',NULL,NULL,'2026-05-28 19:03:15'),(13,'admin_favicon',NULL,NULL,'2026-05-28 19:03:15'),(14,'admin_title','Amerce',NULL,'2026-05-28 19:03:15'),(15,'enable_change_admin_theme','1',NULL,'2026-05-28 19:03:15'),(16,'language_hide_default','1',NULL,'2026-05-28 19:03:15'),(17,'language_switcher_display','dropdown',NULL,'2026-05-28 19:03:15'),(18,'language_display','all',NULL,'2026-05-28 19:03:15'),(19,'language_hide_languages','[]',NULL,'2026-05-28 19:03:15'),(20,'locale','en',NULL,'2026-05-28 19:03:15'),(21,'locale_direction','ltr',NULL,'2026-05-28 19:03:15'),(22,'enable_send_error_reporting_via_email','0',NULL,'2026-05-28 19:03:15'),(23,'enable_https','0',NULL,'2026-05-28 19:03:15'),(24,'enable_cache','0',NULL,'2026-05-28 19:03:15'),(25,'cache_admin_menu_enable','1',NULL,'2026-05-28 19:03:15'),(26,'cache_time_site_map','3600',NULL,'2026-05-28 19:03:15'),(27,'enable_send_mail_when_new_user_registered','0',NULL,'2026-05-28 19:03:15'),(28,'enable_send_mail_user_registered_to_admin','0',NULL,'2026-05-28 19:03:15'),(29,'enable_change_password','1',NULL,'2026-05-28 19:03:15'),(30,'enable_register','1',NULL,'2026-05-28 19:03:15'),(31,'enable_recaptcha','0',NULL,'2026-05-28 19:03:15'),(32,'enable_captcha','0',NULL,'2026-05-28 19:03:15'),(33,'show_site_name_when_logged_in','1',NULL,'2026-05-28 19:03:15'),(34,'time_zone','UTC',NULL,'2026-05-28 19:03:15'),(35,'enable_multi_language_in_admin','0',NULL,'2026-05-28 19:03:15'),(36,'media_chunk_enabled','0',NULL,'2026-05-28 19:03:15'),(37,'media_chunk_size','1048576',NULL,'2026-05-28 19:03:15'),(38,'media_max_upload_filesize',NULL,NULL,'2026-05-28 19:03:15'),(39,'media_aws_use_signed_urls','0',NULL,'2026-05-28 19:03:15'),(40,'media_aws_signed_url_expiry','60',NULL,'2026-05-28 19:03:15'),(41,'enable_geo_ip','0',NULL,'2026-05-28 19:03:15'),(42,'enable_audit_log','1',NULL,'2026-05-28 19:03:15'),(43,'payment_cod_status','1',NULL,'2026-05-28 19:03:15'),(44,'payment_bank_transfer_status','1',NULL,'2026-05-28 19:03:15'),(45,'payment_cod_description','Please pay money directly to the postman, if you choose cash on delivery method (COD).',NULL,'2026-05-28 19:03:15'),(46,'payment_bank_transfer_description','Please send money to our bank account: AMERCE - 0123 4567 8901.',NULL,'2026-05-28 19:03:15'),(47,'payment_stripe_payment_type','stripe_checkout',NULL,'2026-05-28 19:03:15'),(48,'plugins_ecommerce_customer_new_order_status','0',NULL,'2026-05-28 19:03:15'),(49,'plugins_ecommerce_admin_new_order_status','0',NULL,'2026-05-28 19:03:15'),(50,'ecommerce_is_enabled_support_digital_products','1',NULL,'2026-05-28 19:03:15'),(51,'ecommerce_enable_license_codes_for_digital_products','1',NULL,'2026-05-28 19:03:15'),(52,'ecommerce_auto_complete_digital_orders_after_payment','1',NULL,'2026-05-28 19:03:15'),(53,'ecommerce_load_countries_states_cities_from_location_plugin','0',NULL,'2026-05-28 19:03:15'),(54,'ecommerce_product_sku_format','AM-%s%s%s%s',NULL,'2026-05-28 19:03:15'),(55,'ecommerce_store_order_prefix','AM',NULL,'2026-05-28 19:03:15'),(56,'ecommerce_enable_product_specification','1',NULL,'2026-05-28 19:03:15'),(57,'payment_bank_transfer_display_bank_info_at_the_checkout_success_page','1',NULL,'2026-05-28 19:03:15'),(58,'payment_cod_logo','payments/cod.png',NULL,'2026-05-28 19:03:15'),(59,'payment_bank_transfer_logo','payments/bank-transfer.png',NULL,'2026-05-28 19:03:15'),(60,'payment_stripe_logo','payments/stripe.webp',NULL,'2026-05-28 19:03:15'),(61,'payment_paypal_logo','payments/paypal.png',NULL,'2026-05-28 19:03:15'),(62,'payment_mollie_logo','payments/mollie.png',NULL,'2026-05-28 19:03:15'),(63,'payment_paystack_logo','payments/paystack.png',NULL,'2026-05-28 19:03:15'),(64,'payment_razorpay_logo','payments/razorpay.png',NULL,'2026-05-28 19:03:15'),(65,'payment_sslcommerz_logo','payments/sslcommerz.png',NULL,'2026-05-28 19:03:15'),(66,'product_size_guide_display_mode','popup',NULL,'2026-05-28 19:03:15'),(67,'show_on_front','12',NULL,'2026-05-28 19:03:15'),(68,'blog_page_id','9',NULL,'2026-05-28 19:03:15'),(69,'theme-amerce-homepage_id','12',NULL,'2026-05-28 19:03:15'),(70,'theme-amerce-blog_page_id','9',NULL,'2026-05-28 19:03:15'),(71,'theme-amerce-logo','general/logo.png',NULL,'2026-05-28 19:03:15'),(72,'theme-amerce-logo_dark','general/logo-white.png',NULL,'2026-05-28 19:03:15'),(73,'theme-amerce-logo_text','Amerce',NULL,'2026-05-28 19:03:15'),(74,'theme-amerce-favicon','general/favicon.png',NULL,'2026-05-28 19:03:15'),(75,'theme-amerce-default_theme_mode','light',NULL,'2026-05-28 19:03:15'),(76,'theme-amerce-header_style','style-9',NULL,'2026-05-28 19:03:15'),(77,'theme-amerce-show_topbar','1',NULL,'2026-05-28 19:03:15'),(78,'theme-amerce-contact_phone','(+01) 1234 8888',NULL,'2026-05-28 19:03:15'),(79,'theme-amerce-topbar_slides','Midseason Sale: 20% Off - Auto Applied at Checkout - Limited Time Only\n20% Off - Auto Applied at Checkout - Limited Time Only',NULL,'2026-05-28 19:03:15'),(80,'theme-amerce-sticky_header','1',NULL,'2026-05-28 19:03:15'),(81,'theme-amerce-header_transparent_on_homepage','0',NULL,'2026-05-28 19:03:15'),(82,'theme-amerce-header_top_background_color','#010F1C',NULL,'2026-05-28 19:03:15'),(83,'theme-amerce-header_top_text_color','#FFFFFF',NULL,'2026-05-28 19:03:15'),(84,'theme-amerce-header_main_background_color','#FFFFFF',NULL,'2026-05-28 19:03:15'),(85,'theme-amerce-header_main_text_color','#1E1E1E',NULL,'2026-05-28 19:03:15'),(86,'theme-amerce-primary_color','#DC4646',NULL,'2026-05-28 19:03:15'),(87,'theme-amerce-secondary_color','#70857A',NULL,'2026-05-28 19:03:15'),(88,'theme-amerce-heading_color','#101010',NULL,'2026-05-28 19:03:15'),(89,'theme-amerce-body_text_color','#696E73',NULL,'2026-05-28 19:03:15'),(90,'theme-amerce-link_color','#DC4646',NULL,'2026-05-28 19:03:15'),(91,'theme-amerce-link_hover_color','#B83838',NULL,'2026-05-28 19:03:15'),(92,'theme-amerce-border_color','#E9E9E9',NULL,'2026-05-28 19:03:15'),(93,'theme-amerce-success_color','#3DAB25',NULL,'2026-05-28 19:03:15'),(94,'theme-amerce-danger_color','#F03E3E',NULL,'2026-05-28 19:03:15'),(95,'theme-amerce-footer_style','style-8',NULL,'2026-05-28 19:03:15'),(96,'theme-amerce-footer_payment_icons','payment/visa.png,payment/master-card.png,payment/amex.png,payment/paypal.png,payment/water.png,payment/discover.png',NULL,'2026-05-28 19:03:15'),(97,'theme-amerce-footer_address','600 N Michigan Ave, Chicago, IL 60611, USA',NULL,'2026-05-28 19:03:15'),(98,'theme-amerce-footer_email','hi.amere@gmail.com',NULL,'2026-05-28 19:03:15'),(99,'theme-amerce-footer_phone','315-666-6688',NULL,'2026-05-28 19:03:15'),(100,'theme-amerce-facebook_url','https://facebook.com',NULL,'2026-05-28 19:03:15'),(101,'theme-amerce-twitter_url','https://x.com',NULL,'2026-05-28 19:03:15'),(102,'theme-amerce-instagram_url','https://instagram.com',NULL,'2026-05-28 19:03:15'),(103,'theme-amerce-tiktok_url','https://tiktok.com',NULL,'2026-05-28 19:03:15'),(104,'theme-amerce-snapchat_url','https://snapchat.com',NULL,'2026-05-28 19:03:15'),(105,'theme-amerce-product_card_default_style','style-1',NULL,'2026-05-28 19:03:15'),(106,'theme-amerce-product_card_hover_style','hover-01',NULL,'2026-05-28 19:03:15'),(107,'theme-amerce-product_card_show_color_swatches','1',NULL,'2026-05-28 19:03:15'),(108,'theme-amerce-default_filter_position','sidebar',NULL,'2026-05-28 19:03:15'),(109,'theme-amerce-default_pagination_style','numbered',NULL,'2026-05-28 19:03:15'),(110,'theme-amerce-ecommerce_product_item_layout','grid',NULL,'2026-05-28 19:03:15'),(111,'theme-amerce-ecommerce_products_per_row','4',NULL,'2026-05-28 19:03:15'),(112,'theme-amerce-ecommerce_products_per_row_tablet','3',NULL,'2026-05-28 19:03:15'),(113,'theme-amerce-ecommerce_products_per_row_mobile','2',NULL,'2026-05-28 19:03:15'),(114,'theme-amerce-enable_quick_view','1',NULL,'2026-05-28 19:03:15'),(115,'theme-amerce-enable_quick_shop','1',NULL,'2026-05-28 19:03:15'),(116,'theme-amerce-preloader_enabled','1',NULL,'2026-05-28 19:03:15'),(117,'theme-amerce-scroll_to_top_enabled','1',NULL,'2026-05-28 19:03:15'),(118,'theme-amerce-homepage_body_class','',NULL,'2026-05-28 19:03:15'),(119,'theme-amerce-site_title','Amerce',NULL,'2026-05-28 19:03:15'),(120,'theme-amerce-seo_title','Amerce — Multi-Purpose eCommerce Theme',NULL,'2026-05-28 19:03:15'),(121,'theme-amerce-seo_description','Amerce is a multi-purpose eCommerce and marketplace theme for Botble CMS — 21 niche presets, sustainable shopping, and fast checkout.',NULL,'2026-05-28 19:03:15'),(122,'theme-amerce-copyright','©2026 Amerce. All Rights Reserved.',NULL,'2026-05-28 19:03:15'),(123,'theme-amerce-newsletter_popup_enable','1',NULL,'2026-05-28 19:03:15'),(124,'theme-amerce-newsletter_popup_image','section/banner-newsletter.jpg',NULL,'2026-05-28 19:03:15'),(125,'theme-amerce-newsletter_popup_subtitle','Subscribe & Enjoy',NULL,'2026-05-28 19:03:15'),(126,'theme-amerce-newsletter_popup_title','10% OFF',NULL,'2026-05-28 19:03:15'),(127,'theme-amerce-newsletter_popup_description','Join our email list & be first to Receive 10% OFF your next order, exclusive offers & more!',NULL,'2026-05-28 19:03:15'),(128,'theme-amerce-newsletter_popup_delay','5',NULL,'2026-05-28 19:03:15'),(129,'theme-amerce-newsletter_popup_display_pages','[\"public.index\"]',NULL,'2026-05-28 19:03:15'),(130,'theme-amerce-store_phone','+1 666 234 8888',NULL,'2026-05-28 19:03:15'),(131,'theme-amerce-store_email','hi.amere@gmail.com',NULL,'2026-05-28 19:03:15'),(132,'theme-amerce-store_address','2163 Phillips Gap Rd, West Jefferson, North Carolina, United States',NULL,'2026-05-28 19:03:15'),(133,'theme-amerce-store_business_hours_weekday','Mon - Sat: 7:30am - 8:00pm PST',NULL,'2026-05-28 19:03:15'),(134,'theme-amerce-store_business_hours_weekend','Sunday: 9:00am - 5:00pm PST',NULL,'2026-05-28 19:03:15'),(135,'theme-amerce-store_map_address','2163 Phillips Gap Rd, West Jefferson, NC',NULL,'2026-05-28 19:03:15'),(136,'theme-amerce-store_locations','[{\"name\":\"New York Office\",\"image\":\"section\\/store-1.jpg\",\"address\":\"900 Ocean Dr, Miami Beach, FL 33139, US\",\"phone\":\"+1 305 555 2468\",\"email\":\"hi.amerce@gmail.com\"},{\"name\":\"Los Angeles Store\",\"image\":\"section\\/store-2.jpg\",\"address\":\"8723 Melrose Avenue, CA 90069, USA\",\"phone\":\"+1 305 555 2468\",\"email\":\"hi.amerce@gmail.com\"},{\"name\":\"Chicago Boutique\",\"image\":\"section\\/store-3.jpg\",\"address\":\"415 North Clark Street, Chicago, IL 60654, USA\",\"phone\":\"+1 305 555 2468\",\"email\":\"hi.amerce@gmail.com\"},{\"name\":\"Miami Showroom\",\"image\":\"section\\/store-4.jpg\",\"address\":\"1101 Brickell Avenue, Miami, FL 33131, USA\",\"phone\":\"+1 305 555 2468\",\"email\":\"hi.amerce@gmail.com\"},{\"name\":\"London Flagship Store\",\"image\":\"section\\/store-5.jpg\",\"address\":\"152 Regent Street, London W1B 5TF, UK\",\"phone\":\"+44 20 555 2468\",\"email\":\"hi.amerce@gmail.com\"},{\"name\":\"Paris Atelier\",\"image\":\"section\\/store-6.jpg\",\"address\":\"18 Rue du Faubourg Saint-Honor\\u00e9, Paris, France\",\"phone\":\"+33 1 555 2468\",\"email\":\"hi.amerce@gmail.com\"}]',NULL,'2026-05-28 19:03:15'),(137,'theme-amerce-vi-topbar_text','Miễn phí vận chuyển cho đơn hàng trên 99$',NULL,'2026-05-28 19:03:15'),(138,'theme-amerce-vi-site_title','Amerce',NULL,'2026-05-28 19:03:15'),(139,'theme-amerce-vi-seo_title','Amerce — Theme Thương mại điện tử Đa năng',NULL,'2026-05-28 19:03:15'),(140,'theme-amerce-vi-seo_description','Amerce là theme thương mại điện tử và marketplace đa năng dành cho Botble CMS — 21 preset theo từng ngách, mua sắm bền vững và thanh toán nhanh.',NULL,'2026-05-28 19:03:15'),(141,'theme-amerce-vi-copyright','© 2026 Amerce. Bảo lưu mọi quyền.',NULL,'2026-05-28 19:03:15'),(142,'theme-amerce-vi-header_account_label','Đăng nhập/Đăng ký',NULL,'2026-05-28 19:03:15'),(143,'theme-amerce-vi-header_bottom_offer_text','Ưu Đãi Đặc Biệt!',NULL,'2026-05-28 19:03:15'),(144,'theme-amerce-vi-footer_marquee_text','AMERCE THƯƠNG MẠI ĐIỆN TỬ ĐA NĂNG',NULL,'2026-05-28 19:03:15'),(145,'theme-amerce-vi-header_announcement_slides','Khuyến Mãi Giữa Mùa: Giảm 20% - Tự Động Áp Dụng Khi Thanh Toán - Số Lượng Có Hạn\nGiảm 20% - Tự Động Áp Dụng Khi Thanh Toán - Số Lượng Có Hạn',NULL,'2026-05-28 19:03:15'),(146,'theme-amerce-vi-topbar_slides','Khuyến Mãi Giữa Mùa: Giảm 20% - Tự Động Áp Dụng Khi Thanh Toán - Chỉ Trong Thời Gian Giới Hạn\nGiảm 20% - Tự Động Áp Dụng Khi Thanh Toán - Chỉ Trong Thời Gian Giới Hạn',NULL,'2026-05-28 19:03:15'),(147,'theme-amerce-ar-topbar_text','شحن مجاني للطلبات التي تزيد عن 99 دولارًا',NULL,'2026-05-28 19:03:15'),(148,'theme-amerce-ar-site_title','أميرس',NULL,'2026-05-28 19:03:15'),(149,'theme-amerce-ar-seo_title','Amerce — موضوع التجارة الإلكترونية متعدد الأغراض',NULL,'2026-05-28 19:03:15'),(150,'theme-amerce-ar-seo_description','Amerce هو موضوع متعدد الأغراض للتجارة الإلكترونية والسوق لـ Botble CMS - 21 إعدادًا مسبقًا متخصصًا وتسوقًا مستدامًا وسداد سريع.',NULL,'2026-05-28 19:03:15'),(151,'theme-amerce-ar-copyright','© 2026 أمريكا. جميع الحقوق محفوظة.',NULL,'2026-05-28 19:03:15'),(152,'theme-amerce-ar-header_account_label','تسجيل الدخول / التسجيل',NULL,'2026-05-28 19:03:15'),(153,'theme-amerce-ar-header_bottom_offer_text','عرض خاص!',NULL,'2026-05-28 19:03:15'),(154,'theme-amerce-ar-footer_marquee_text','AMERCE التجارة الإلكترونية متعددة الوظائف',NULL,'2026-05-28 19:03:15'),(155,'theme-amerce-ar-header_announcement_slides','عرض منتصف الموسم: خصم 20% - يتم تطبيقه تلقائيًا عند الدفع - الكمية محدودة\nخصم 20% - يتم تطبيقه تلقائيًا عند الدفع - الكمية محدودة',NULL,'2026-05-28 19:03:15'),(156,'theme-amerce-ar-topbar_slides','عرض منتصف الموسم: خصم 20% - يُطبق تلقائيًا عند الدفع - لفترة محدودة فقط\nخصم 20% - يُطبق تلقائيًا عند الدفع - لفترة محدودة فقط',NULL,'2026-05-28 19:03:15'),(157,'theme-amerce-fr-topbar_text','Livraison gratuite pour les commandes de plus de 99 $',NULL,'2026-05-28 19:03:15'),(158,'theme-amerce-fr-site_title','Amérique',NULL,'2026-05-28 19:03:15'),(159,'theme-amerce-fr-seo_title','Amerce — Thème de commerce électronique polyvalent',NULL,'2026-05-28 19:03:15'),(160,'theme-amerce-fr-seo_description','Amerce est un thème polyvalent de commerce électronique et de marché pour Botble CMS : 21 préréglages de niche, achats durables et paiement rapide.',NULL,'2026-05-28 19:03:15'),(161,'theme-amerce-fr-copyright','© 2026 Amérique. Tous droits réservés.',NULL,'2026-05-28 19:03:15'),(162,'theme-amerce-fr-header_account_label','Connexion/Inscription',NULL,'2026-05-28 19:03:15'),(163,'theme-amerce-fr-header_bottom_offer_text','Offre spéciale!',NULL,'2026-05-28 19:03:15'),(164,'theme-amerce-fr-footer_marquee_text','COMMERCE ÉLECTRONIQUE MULTIFONCTIONNEL AMERCE',NULL,'2026-05-28 19:03:15'),(165,'theme-amerce-fr-header_announcement_slides','Promotion mi-saison : 20 % de réduction - Appliquée automatiquement à la caisse - Quantité limitée\n20 % de réduction - Appliqué automatiquement à la caisse - Quantité limitée',NULL,'2026-05-28 19:03:15'),(166,'theme-amerce-fr-topbar_slides','Promotion de mi-saison : 20 % de réduction - Appliquée automatiquement à la caisse - Durée limitée seulement\n20 % de réduction - Appliqué automatiquement à la caisse - Durée limitée uniquement',NULL,'2026-05-28 19:03:15'),(167,'theme-amerce-id-topbar_text','Pengiriman gratis untuk pesanan di atas $99',NULL,'2026-05-28 19:03:15'),(168,'theme-amerce-id-site_title','Mendenda',NULL,'2026-05-28 19:03:15'),(169,'theme-amerce-id-seo_title','Amerce — Tema eCommerce Serbaguna',NULL,'2026-05-28 19:03:15'),(170,'theme-amerce-id-seo_description','Amerce adalah tema e-niaga dan pasar multiguna untuk Botble CMS — 21 preset khusus, belanja berkelanjutan, dan pembayaran cepat.',NULL,'2026-05-28 19:03:15'),(171,'theme-amerce-id-copyright','© 2026 Amerika. Semua hak dilindungi undang-undang.',NULL,'2026-05-28 19:03:15'),(172,'theme-amerce-id-header_account_label','Masuk/Daftar',NULL,'2026-05-28 19:03:15'),(173,'theme-amerce-id-header_bottom_offer_text','Penawaran khusus!',NULL,'2026-05-28 19:03:15'),(174,'theme-amerce-id-footer_marquee_text','E-COMMERCE MULTI-FUNGSIONAL AMERCE',NULL,'2026-05-28 19:03:15'),(175,'theme-amerce-id-header_announcement_slides','Promosi Pertengahan Musim: Diskon 20% - Otomatis diterapkan saat checkout - Jumlah terbatas\nDiskon 20% - Diterapkan Secara Otomatis Saat Checkout - Jumlah Terbatas',NULL,'2026-05-28 19:03:15'),(176,'theme-amerce-id-topbar_slides','Promosi Pertengahan Musim: Diskon 20% - Berlaku Otomatis saat Checkout - Hanya Waktu Terbatas\nDiskon 20% - Berlaku Otomatis saat Checkout - Hanya Waktu Terbatas',NULL,'2026-05-28 19:03:15'),(177,'theme-amerce-tr-topbar_text','99$ üzeri siparişlerde ücretsiz gönderim',NULL,'2026-05-28 19:03:15'),(178,'theme-amerce-tr-site_title','Amerce',NULL,'2026-05-28 19:03:15'),(179,'theme-amerce-tr-seo_title','Amerce — Çok Amaçlı e-Ticaret Teması',NULL,'2026-05-28 19:03:15'),(180,'theme-amerce-tr-seo_description','Amerce, Botble CMS için çok amaçlı bir e-ticaret ve pazar yeri temasıdır - 21 niş ön ayar, sürdürülebilir alışveriş ve hızlı ödeme.',NULL,'2026-05-28 19:03:15'),(181,'theme-amerce-tr-copyright','© 2026 Amerika. Her hakkı saklıdır.',NULL,'2026-05-28 19:03:15'),(182,'theme-amerce-tr-header_account_label','Giriş yap/Kayıt ol',NULL,'2026-05-28 19:03:15'),(183,'theme-amerce-tr-header_bottom_offer_text','Özel Teklif!',NULL,'2026-05-28 19:03:15'),(184,'theme-amerce-tr-footer_marquee_text','AMERCE ÇOK FONKSİYONLU E-TİCARET',NULL,'2026-05-28 19:03:15'),(185,'theme-amerce-tr-header_announcement_slides','Sezon Ortası Promosyonu: %20 indirim - Ödeme sırasında otomatik olarak uygulanır - Sınırlı miktar\n%20 İndirim - Ödeme Sırasında Otomatik Olarak Uygulanır - Sınırlı Adet',NULL,'2026-05-28 19:03:15'),(186,'theme-amerce-tr-topbar_slides','Sezon Ortası Promosyonu: %20 İndirim - Ödeme Sırasında Otomatik Olarak Uygulanır - Yalnızca Sınırlı Süre için\n%20 İndirim - Ödeme Sırasında Otomatik Olarak Uygulanır - Yalnızca Sınırlı Süre için',NULL,'2026-05-28 19:03:15'),(187,'media_sizes_hero-sm_height','0',NULL,'2026-05-28 19:03:15'),(188,'media_sizes_hero-md_height','0',NULL,NULL);
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
INSERT INTO `simple_slider_items` VALUES (1,1,'Find Your\nSignature Style','slider/fashion-2/slider-1.jpg','/products','',0,'published','2026-05-28 19:02:44','2026-05-28 19:02:44'),(2,1,'Your Ultimate\nStyle Destination','slider/fashion-2/slider-2.jpg','/products','',1,'published','2026-05-28 19:02:44','2026-05-28 19:02:44'),(3,1,'Find Your\nSignature Style','slider/fashion-2/slider-3.jpg','/products','',2,'published','2026-05-28 19:02:44','2026-05-28 19:02:44');
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
INSERT INTO `simple_sliders` VALUES (1,'Homepage Hero','home-hero','Hero slider for the home-fashion-2 preset.','published','2026-05-28 19:02:44','2026-05-28 19:02:44');
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
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'trends',1,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 19:02:43','2026-05-28 19:02:43'),(2,'styling-tips',2,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 19:02:43','2026-05-28 19:02:43'),(3,'sustainable',3,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 19:02:43','2026-05-28 19:02:43'),(4,'new-arrivals',4,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 19:02:43','2026-05-28 19:02:43'),(5,'limited-edition',5,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 19:02:43','2026-05-28 19:02:43'),(6,'behind-the-scenes',6,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 19:02:43','2026-05-28 19:02:43'),(7,'buyer-guide',7,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 19:02:43','2026-05-28 19:02:43'),(8,'care-tips',8,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 19:02:43','2026-05-28 19:02:43'),(9,'capsule-wardrobe',9,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 19:02:43','2026-05-28 19:02:43'),(10,'material-stories',10,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 19:02:43','2026-05-28 19:02:43'),(11,'holiday-gifting',11,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 19:02:43','2026-05-28 19:02:43'),(12,'editor-picks',12,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 19:02:43','2026-05-28 19:02:43'),(13,'style-guides',1,'Botble\\Blog\\Models\\Category','','2026-05-28 19:02:44','2026-05-28 19:02:44'),(14,'trend-watch',2,'Botble\\Blog\\Models\\Category','','2026-05-28 19:02:44','2026-05-28 19:02:44'),(15,'wardrobe-building',3,'Botble\\Blog\\Models\\Category','','2026-05-28 19:02:44','2026-05-28 19:02:44'),(16,'care-maintenance',4,'Botble\\Blog\\Models\\Category','','2026-05-28 19:02:44','2026-05-28 19:02:44'),(17,'editor-picks',5,'Botble\\Blog\\Models\\Category','','2026-05-28 19:02:44','2026-05-28 19:02:44'),(18,'the-style-edit-fall-essentials',1,'Botble\\Blog\\Models\\Post','','2026-05-28 19:02:44','2026-05-28 19:02:44'),(19,'building-a-capsule-wardrobe-that-actually-works',2,'Botble\\Blog\\Models\\Post','','2026-05-28 19:02:44','2026-05-28 19:02:44'),(20,'investment-pieces-what-is-actually-worth-it',3,'Botble\\Blog\\Models\\Post','','2026-05-28 19:02:44','2026-05-28 19:02:44'),(21,'how-to-mix-vintage-with-modern-without-looking-costumed',4,'Botble\\Blog\\Models\\Post','','2026-05-28 19:02:44','2026-05-28 19:02:44'),(22,'jewelry-layering-a-practical-guide',5,'Botble\\Blog\\Models\\Post','','2026-05-28 19:02:44','2026-05-28 19:02:44'),(23,'caring-for-knitwear-so-it-lasts-more-than-one-winter',6,'Botble\\Blog\\Models\\Post','','2026-05-28 19:02:44','2026-05-28 19:02:44'),(24,'clothing',1,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 19:02:44','2026-05-28 19:02:44'),(25,'jewelry',2,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 19:02:45','2026-05-28 19:02:45'),(26,'shoes',3,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 19:02:45','2026-05-28 19:02:45'),(27,'bags',4,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 19:02:45','2026-05-28 19:02:45'),(28,'wallets',5,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 19:02:45','2026-05-28 19:02:45'),(29,'accessories',6,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 19:02:45','2026-05-28 19:02:45'),(30,'outerwear',7,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 19:02:45','2026-05-28 19:02:45'),(31,'cotton-tee',1,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:02:48','2026-05-28 19:02:48'),(32,'shopping-bag',2,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:02:48','2026-05-28 19:02:48'),(33,'embossed-wallet',3,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:02:48','2026-05-28 19:02:48'),(34,'turtleneck-knit',4,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:02:48','2026-05-28 19:02:48'),(35,'shoulder-bag',5,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:02:49','2026-05-28 19:02:49'),(36,'leather-boots',6,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:02:49','2026-05-28 19:02:49'),(37,'silk-scarf',7,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:02:49','2026-05-28 19:02:49'),(38,'wool-coat',8,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:02:49','2026-05-28 19:02:49'),(39,'denim-jacket',9,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:02:49','2026-05-28 19:02:49'),(40,'pearl-necklace',10,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:02:49','2026-05-28 19:02:49'),(41,'mini-crossbody',11,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:02:49','2026-05-28 19:02:49'),(42,'cashmere-cardigan',12,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:02:49','2026-05-28 19:02:49'),(43,'anthro-studio',1,'Botble\\Marketplace\\Models\\Store','stores','2026-05-28 19:02:58','2026-05-28 19:02:58'),(44,'crate-furniture-co',2,'Botble\\Marketplace\\Models\\Store','stores','2026-05-28 19:02:58','2026-05-28 19:02:58'),(45,'findr-audio',3,'Botble\\Marketplace\\Models\\Store','stores','2026-05-28 19:02:58','2026-05-28 19:02:58'),(46,'bohome-living',4,'Botble\\Marketplace\\Models\\Store','stores','2026-05-28 19:02:58','2026-05-28 19:02:58'),(47,'about',1,'Botble\\Page\\Models\\Page','','2026-05-28 19:02:58','2026-05-28 19:02:58'),(48,'contact',2,'Botble\\Page\\Models\\Page','','2026-05-28 19:02:58','2026-05-28 19:02:58'),(49,'faq',3,'Botble\\Page\\Models\\Page','','2026-05-28 19:02:58','2026-05-28 19:02:58'),(50,'privacy-policy',4,'Botble\\Page\\Models\\Page','','2026-05-28 19:02:58','2026-05-28 19:02:58'),(51,'terms-conditions',5,'Botble\\Page\\Models\\Page','','2026-05-28 19:02:58','2026-05-28 19:02:58'),(52,'returns-refunds',6,'Botble\\Page\\Models\\Page','','2026-05-28 19:02:58','2026-05-28 19:02:58'),(53,'shipping',7,'Botble\\Page\\Models\\Page','','2026-05-28 19:02:58','2026-05-28 19:02:58'),(54,'our-stores',8,'Botble\\Page\\Models\\Page','','2026-05-28 19:02:58','2026-05-28 19:02:58'),(55,'blog',9,'Botble\\Page\\Models\\Page','','2026-05-28 19:02:58','2026-05-28 19:02:58'),(56,'careers',10,'Botble\\Page\\Models\\Page','','2026-05-28 19:02:58','2026-05-28 19:02:58'),(57,'sustainability',11,'Botble\\Page\\Models\\Page','','2026-05-28 19:02:58','2026-05-28 19:02:58'),(58,'homepage',12,'Botble\\Page\\Models\\Page','','2026-05-28 19:03:01','2026-05-28 19:03:01'),(59,'cotton-tee',13,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:03:14','2026-05-28 19:03:14'),(60,'cotton-tee',14,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:03:14','2026-05-28 19:03:14'),(61,'shopping-bag',15,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:03:14','2026-05-28 19:03:14'),(62,'shopping-bag',16,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:03:14','2026-05-28 19:03:14'),(63,'shopping-bag',17,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:03:14','2026-05-28 19:03:14'),(64,'shopping-bag',18,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:03:14','2026-05-28 19:03:14'),(65,'shopping-bag',19,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:03:14','2026-05-28 19:03:14'),(66,'embossed-wallet',20,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:03:14','2026-05-28 19:03:14'),(67,'turtleneck-knit',21,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:03:14','2026-05-28 19:03:14'),(68,'turtleneck-knit',22,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:03:14','2026-05-28 19:03:14'),(69,'turtleneck-knit',23,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:03:14','2026-05-28 19:03:14'),(70,'turtleneck-knit',24,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:03:14','2026-05-28 19:03:14'),(71,'leather-boots',25,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:03:14','2026-05-28 19:03:14'),(72,'leather-boots',26,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:03:14','2026-05-28 19:03:14'),(73,'leather-boots',27,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:03:14','2026-05-28 19:03:14'),(74,'silk-scarf',28,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:03:14','2026-05-28 19:03:14'),(75,'silk-scarf',29,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:03:14','2026-05-28 19:03:14'),(76,'wool-coat',30,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:03:14','2026-05-28 19:03:14'),(77,'mini-crossbody',31,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:03:14','2026-05-28 19:03:14'),(78,'mini-crossbody',32,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:03:14','2026-05-28 19:03:14'),(79,'anthro',1,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 19:03:14','2026-05-28 19:03:14'),(80,'anvouge',2,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 19:03:14','2026-05-28 19:03:14'),(81,'bohome',3,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 19:03:14','2026-05-28 19:03:14'),(82,'carolin',4,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 19:03:14','2026-05-28 19:03:14'),(83,'cheryl',5,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 19:03:14','2026-05-28 19:03:14'),(84,'crate',6,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 19:03:14','2026-05-28 19:03:14'),(85,'findr',7,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 19:03:14','2026-05-28 19:03:14'),(86,'intdeco',8,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 19:03:14','2026-05-28 19:03:14'),(87,'modave',9,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 19:03:14','2026-05-28 19:03:14'),(88,'panadoxn',10,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 19:03:14','2026-05-28 19:03:14'),(89,'shangxi',11,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 19:03:14','2026-05-28 19:03:14'),(90,'sopify',12,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 19:03:14','2026-05-28 19:03:14'),(91,'cotton',1,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:03:14','2026-05-28 19:03:14'),(92,'linen',2,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:03:14','2026-05-28 19:03:14'),(93,'wool',3,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:03:14','2026-05-28 19:03:14'),(94,'leather',4,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:03:14','2026-05-28 19:03:14'),(95,'tencel',5,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:03:14','2026-05-28 19:03:14'),(96,'recycled',6,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:03:14','2026-05-28 19:03:14'),(97,'made-in-portugal',7,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:03:14','2026-05-28 19:03:14'),(98,'made-in-italy',8,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:03:14','2026-05-28 19:03:14'),(99,'hand-crafted',9,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:03:14','2026-05-28 19:03:14'),(100,'vegan',10,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:03:14','2026-05-28 19:03:14'),(101,'limited-run',11,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:03:14','2026-05-28 19:03:14'),(102,'best-seller',12,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:03:14','2026-05-28 19:03:14'),(103,'new-arrival',13,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:03:14','2026-05-28 19:03:14'),(104,'editor-pick',14,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:03:14','2026-05-28 19:03:14'),(105,'eco-friendly',15,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:03:14','2026-05-28 19:03:14'),(106,'new-arrivals',1,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 19:03:14','2026-05-28 19:03:14'),(107,'best-sellers',2,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 19:03:14','2026-05-28 19:03:14'),(108,'limited-edition',3,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 19:03:14','2026-05-28 19:03:14'),(109,'outerwear',4,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 19:03:14','2026-05-28 19:03:14'),(110,'knitwear',5,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 19:03:14','2026-05-28 19:03:14'),(111,'bottoms',6,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 19:03:14','2026-05-28 19:03:14'),(112,'footwear',7,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 19:03:14','2026-05-28 19:03:14'),(113,'accessories',8,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 19:03:14','2026-05-28 19:03:14'),(114,'sale',9,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 19:03:14','2026-05-28 19:03:14');
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
INSERT INTO `slugs_translations` VALUES ('ar',1,'alatgahat','tag'),('fr',1,'tendances','tag'),('id',1,'tren','tag'),('tr',1,'trends','tag'),('vi',1,'xu-huong','tag'),('fr',2,'conseils-de-style','tag'),('vi',2,'meo-phoi-do','tag'),('ar',2,'nsayh-altsmym','tag'),('tr',2,'styling-tips','tag'),('id',2,'tip-penataan-gaya','tag'),('vi',3,'ben-vung','tag'),('id',3,'berkelanjutan','tag'),('fr',3,'durable','tag'),('ar',3,'mstmr','tag'),('tr',3,'sustainable','tag'),('ar',4,'aloafdon-algdd','tag'),('vi',4,'hang-moi-ve','tag'),('tr',4,'new-arrivals','tag'),('fr',4,'nouveautes','tag'),('id',4,'pendatang-baru','tag'),('id',5,'edisi-terbatas','tag'),('fr',5,'edition-limitee','tag'),('tr',5,'limited-edition','tag'),('vi',5,'phien-ban-gioi-han','tag'),('ar',5,'tbaa-mhdod','tag'),('tr',6,'behind-the-scenes','tag'),('fr',6,'dans-les-coulisses','tag'),('id',6,'di-belakang-layar','tag'),('vi',6,'hau-truong','tag'),('ar',6,'khlf-alkoalys','tag'),('tr',7,'buyer-guide','tag'),('vi',7,'cam-nang-mua-sam','tag'),('ar',7,'dlyl-almshtry','tag'),('fr',7,'guide-de-lacheteur','tag'),('id',7,'panduan-pembeli','tag'),('tr',8,'care-tips','tag'),('fr',8,'conseils-dentretien','tag'),('vi',8,'meo-bao-quan','tag'),('ar',8,'nsayh-alaanay','tag'),('id',8,'tip-perawatan','tag'),('fr',9,'armoire-capsule','tag'),('tr',9,'capsule-wardrobe','tag'),('ar',9,'khzan-kbsol','tag'),('id',9,'lemari-kapsul','tag'),('vi',9,'tu-do-capsule','tag'),('id',10,'cerita-materi','tag'),('vi',10,'chuyen-vat-lieu','tag'),('fr',10,'histoires-materielles','tag'),('ar',10,'kss-mady','tag'),('tr',10,'material-stories','tag'),('fr',11,'cadeaux-de-vacances','tag'),('id',11,'hadiah-liburan','tag'),('ar',11,'hdaya-alaayd','tag'),('tr',11,'holiday-gifting','tag'),('vi',11,'qua-tang-dip-le','tag'),('ar',12,'akhtyarat-almhrr','tag'),('vi',12,'bien-tap-vien-chon','tag'),('fr',12,'choix-de-lediteur','tag'),('tr',12,'editor-picks','tag'),('id',12,'pilihan-editor','tag'),('ar',13,'adl-alnmt',''),('fr',13,'guides-de-style',''),('vi',13,'huong-dan-phoi-do',''),('id',13,'panduan-gaya',''),('tr',13,'stil-kilavuzlari',''),('ar',14,'mrakb-alatgah',''),('fr',14,'surveillance-des-tendances',''),('vi',14,'theo-doi-xu-huong',''),('id',14,'tontonan-tren',''),('tr',14,'trend-izleme',''),('fr',15,'batiment-de-garde-robe',''),('tr',15,'gardirop-binasi',''),('id',15,'gedung-lemari-pakaian',''),('ar',15,'mbn-khzan-almlabs',''),('vi',15,'xay-dung-tu-do',''),('ar',16,'care-amp-maintenance',''),('fr',16,'care-amp-maintenance',''),('id',16,'care-amp-maintenance',''),('tr',16,'care-amp-maintenance',''),('vi',16,'care-amp-maintenance',''),('ar',17,'akhtyarat-almhrr',''),('fr',17,'choix-de-lediteur',''),('tr',17,'editorun-secimleri',''),('vi',17,'lua-chon-cua-bien-tap-vien',''),('id',17,'pilihan-editor',''),('fr',18,'ledition-de-style-les-essentiels-de-lautomne',''),('id',18,'pengeditan-gaya-esensi-musim-gugur',''),('tr',18,'stil-duzenlemesi-sonbaharin-temelleri',''),('ar',18,'thryr-alnmt-asasyat-alkhryf',''),('vi',18,'tuyen-chon-phong-cach-nhung-mon-do-thiet-yeu-mua-thu',''),('ar',19,'bnaaa-khzan-kbsol-taaml-balfaal',''),('fr',19,'construire-une-armoire-capsule-qui-fonctionne-reellement',''),('tr',19,'gercekten-ise-yarayan-bir-kapsul-gardirop-insa-etmek',''),('id',19,'membangun-lemari-pakaian-kapsul-yang-benar-benar-berfungsi',''),('vi',19,'xay-dung-tu-do-toi-gian-that-su-hieu-qua',''),('ar',20,'alktaa-alastthmary-ma-althy-ysthk-thlk-balfaal',''),('vi',20,'nhung-mon-do-dang-dau-tu-dieu-gi-that-su-xung-dang',''),('fr',20,'pieces-dinvestissement-ce-qui-en-vaut-reellement-la-peine',''),('id',20,'potongan-investasi-apa-yang-sebenarnya-bermanfaat',''),('tr',20,'yatirim-parcalari-aslinda-buna-deger',''),('vi',21,'cach-phoi-do-vintage-voi-hien-dai-ma-khong-trong-nhu-hoa-trang',''),('id',21,'cara-memadukan-vintage-dengan-modern-tanpa-terlihat-berkostum',''),('fr',21,'comment-melanger-le-vintage-avec-le-moderne-sans-avoir-lair-costume',''),('tr',21,'kostumlu-gorunmeden-vintage-ile-modern-nasil-karistirilir',''),('ar',21,'kyfy-almzg-byn-altraz-alkdym-oalhdyth-don-an-tbdo-anyka',''),('tr',22,'jewelry-layering-a-practical-guide',''),('id',22,'pelapisan-perhiasan-panduan-praktis',''),('vi',22,'phoi-lop-trang-suc-cam-nang-thuc-te',''),('fr',22,'superposition-de-bijoux-un-guide-pratique',''),('ar',22,'tbkat-almgohrat-dlyl-aamly',''),('ar',23,'alaanay-balmlabs-almhbok-ht-tdom-lakthr-mn-shtaaa-oahd',''),('tr',23,'caring-for-knitwear-so-it-lasts-more-than-one-winter',''),('vi',23,'cham-soc-do-len-de-dung-duoc-hon-mot-mua-dong',''),('id',23,'merawat-pakaian-rajut-agar-tahan-lebih-dari-satu-musim-dingin',''),('fr',23,'prendre-soin-des-tricots-pour-quils-durent-plus-dun-hiver',''),('tr',24,'giyim','product-categories'),('ar',24,'mlabs','product-categories'),('id',24,'pakaian','product-categories'),('vi',24,'quan-ao','product-categories'),('fr',24,'vetements','product-categories'),('fr',25,'bijoux','product-categories'),('ar',25,'mgohrat','product-categories'),('id',25,'perhiasan','product-categories'),('tr',25,'taki','product-categories'),('vi',25,'trang-suc','product-categories'),('ar',26,'ahthy','product-categories'),('tr',26,'ayakkabi','product-categories'),('fr',26,'chaussures','product-categories'),('vi',26,'giay-dep','product-categories'),('id',26,'sepatu','product-categories'),('ar',27,'akyas','product-categories'),('tr',27,'cantalar','product-categories'),('fr',27,'sacs','product-categories'),('id',27,'tas','product-categories'),('vi',27,'tui-xach','product-categories'),('tr',28,'cuzdanlar','product-categories'),('id',28,'dompet','product-categories'),('ar',28,'mhafth','product-categories'),('fr',28,'portefeuilles','product-categories'),('vi',28,'vi','product-categories'),('fr',29,'accessoires','product-categories'),('id',29,'aksesoris','product-categories'),('tr',29,'aksesuarlar','product-categories'),('ar',29,'mkmlat','product-categories'),('vi',29,'phu-kien','product-categories'),('vi',30,'ao-khoac','product-categories'),('tr',30,'dis-giyim','product-categories'),('ar',30,'mlabs-khargy','product-categories'),('id',30,'pakaian-luar','product-categories'),('fr',30,'vetements-dexterieur','product-categories'),('vi',31,'ao-thun-cotton','products'),('id',31,'kaos-katun','products'),('tr',31,'pamuklu-tisort','products'),('fr',31,'t-shirt-en-coton','products'),('ar',31,'ty-shyrt-ktn','products'),('tr',32,'alisveris-cantasi','products'),('ar',32,'kys-altsok','products'),('fr',32,'sac-a-provisions','products'),('id',32,'tas-belanja','products'),('vi',32,'tui-mua-sam','products'),('id',33,'dompet-timbul','products'),('tr',33,'kabartmali-cuzdan','products'),('ar',33,'mhfth-mnkosh','products'),('fr',33,'portefeuille-en-relief','products'),('vi',33,'vi-dap-noi','products'),('ar',34,'alyak-almdor-mtmask','products'),('vi',34,'ao-len-co-lo','products'),('tr',34,'balikci-yaka-orgu','products'),('id',34,'rajutan-turtleneck','products'),('fr',34,'tricot-a-col-roule','products'),('ar',35,'hkyb-alktf','products'),('tr',35,'omuz-cantasi','products'),('fr',35,'sac-a-bandouliere','products'),('id',35,'tas-bahu','products'),('vi',35,'tui-deo-vai','products'),('ar',36,'ahthy-gldy','products'),('vi',36,'bot-da','products'),('fr',36,'bottes-en-cuir','products'),('tr',36,'deri-cizme','products'),('id',36,'sepatu-bot-kulit','products'),('fr',37,'foulard-en-soie','products'),('tr',37,'ipek-esarp','products'),('vi',37,'khan-lua','products'),('ar',37,'oshah-hryry','products'),('id',37,'syal-sutra','products'),('vi',38,'ao-khoac-len','products'),('ar',38,'maatf-mn-alsof','products'),('fr',38,'manteau-en-laine','products'),('id',38,'mantel-wol','products'),('tr',38,'yun-ceket','products'),('vi',39,'ao-khoac-denim','products'),('id',39,'jaket-denim','products'),('tr',39,'kot-ceket','products'),('ar',39,'str-aldnym','products'),('fr',39,'veste-en-jean','products'),('fr',40,'collier-de-perles','products'),('tr',40,'inci-kolye','products'),('id',40,'kalung-mutiara','products'),('ar',40,'klad-allolo','products'),('vi',40,'vong-co-ngoc-trai','products'),('ar',41,'hkyb-kros-sghyr','products'),('fr',41,'mini-bandouliere','products'),('tr',41,'mini-capraz-aski','products'),('id',41,'selempang-mini','products'),('vi',41,'tui-deo-cheo-mini','products'),('vi',42,'ao-cardigan-cashmere','products'),('fr',42,'cardigan-en-cachemire','products'),('id',42,'kardigan-kasmir','products'),('tr',42,'kasmir-hirka','products'),('ar',42,'str-alkshmyr','products'),('fr',47,'a-propos',''),('ar',47,'aan',''),('vi',47,'gioi-thieu',''),('tr',47,'hakkinda',''),('id',47,'tentang',''),('ar',48,'atsal',''),('fr',48,'contact',''),('id',48,'kontak',''),('vi',48,'lien-he',''),('tr',48,'temas-etmek',''),('vi',49,'cau-hoi-thuong-gap',''),('ar',49,'faq',''),('fr',49,'faq',''),('id',49,'faq',''),('tr',49,'faq',''),('vi',50,'chinh-sach-bao-mat',''),('tr',50,'gizlilik-politikasi',''),('id',50,'kebijakan-privasi',''),('fr',50,'politique-de-confidentialite',''),('ar',50,'syas-alkhsosy',''),('ar',51,'alshrot-oalahkam',''),('fr',51,'conditions-generales',''),('vi',51,'dieu-khoan-dieu-kien',''),('tr',51,'sartlar-ve-kosullar',''),('id',51,'syarat-ketentuan',''),('ar',52,'alaaoayd-oalmbalgh-almstrd',''),('vi',52,'doi-tra-hoan-tien',''),('tr',52,'iade-ve-para-iadeleri',''),('id',52,'pengembalian-pengembalian-dana',''),('fr',52,'retours-et-remboursements',''),('fr',53,'expedition',''),('tr',53,'nakliye',''),('id',53,'pengiriman',''),('ar',53,'shhn',''),('vi',53,'van-chuyen',''),('vi',54,'he-thong-cua-hang',''),('tr',54,'magazalarimiz',''),('ar',54,'mtagrna',''),('fr',54,'nos-magasins',''),('id',54,'toko-kami',''),('ar',55,'blog',''),('fr',55,'blog',''),('id',55,'blog',''),('tr',55,'blog',''),('vi',55,'tap-chi',''),('fr',56,'carrieres',''),('id',56,'karir',''),('tr',56,'kariyer',''),('ar',56,'othayf',''),('vi',56,'tuyen-dung',''),('ar',57,'sustainability',''),('fr',57,'sustainability',''),('id',57,'sustainability',''),('tr',57,'sustainability',''),('vi',57,'sustainability',''),('ar',58,'alsfh-alryysy',''),('tr',58,'ana-sayfa',''),('id',58,'beranda',''),('fr',58,'page-daccueil',''),('vi',58,'trang-chu','');
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
INSERT INTO `tags` VALUES (1,'Trends',1,'Botble\\ACL\\Models\\User','Articles tagged with Trends.','published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(2,'Styling Tips',1,'Botble\\ACL\\Models\\User','Articles tagged with Styling Tips.','published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(3,'Sustainable',1,'Botble\\ACL\\Models\\User','Articles tagged with Sustainable.','published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(4,'New Arrivals',1,'Botble\\ACL\\Models\\User','Articles tagged with New Arrivals.','published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(5,'Limited Edition',1,'Botble\\ACL\\Models\\User','Articles tagged with Limited Edition.','published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(6,'Behind the Scenes',1,'Botble\\ACL\\Models\\User','Articles tagged with Behind the Scenes.','published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(7,'Buyer Guide',1,'Botble\\ACL\\Models\\User','Articles tagged with Buyer Guide.','published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(8,'Care Tips',1,'Botble\\ACL\\Models\\User','Articles tagged with Care Tips.','published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(9,'Capsule Wardrobe',1,'Botble\\ACL\\Models\\User','Articles tagged with Capsule Wardrobe.','published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(10,'Material Stories',1,'Botble\\ACL\\Models\\User','Articles tagged with Material Stories.','published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(11,'Holiday Gifting',1,'Botble\\ACL\\Models\\User','Articles tagged with Holiday Gifting.','published','2026-05-28 19:02:43','2026-05-28 19:02:43'),(12,'Editor Picks',1,'Botble\\ACL\\Models\\User','Articles tagged with Editor Picks.','published','2026-05-28 19:02:43','2026-05-28 19:02:43');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'Cara Wang','\"I am genuinely impressed with this jacket. The material is fantastic — it feels durable and high-quality, and the outer shell provides great wind and light water resistance, which is perfect for my morning commute.\"','testimonials/avatar-3.jpg','Verified Buyer','published','2026-05-28 19:02:58','2026-05-28 19:02:58'),(2,'Evelyn Taylor','\"The fit is fantastic — I ordered my usual size (Small) and it is just the right length and fitted perfectly without being too tight. The neckline and armholes are cut modestly, which is a huge plus. I am extremely satisfied.\"','testimonials/avatar-2.jpg','Verified Buyer','published','2026-05-28 19:02:58','2026-05-28 19:02:58'),(3,'Emma Collins','\"I am extremely satisfied with this T-shirt! The cotton material is softer and more breathable than I expected. After many washes, the shirt still holds its shape very well and does not pill or stretch. I like the product material.\"','testimonials/avatar-1.jpg','Verified Buyer','published','2026-05-28 19:02:58','2026-05-28 19:02:58');
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
INSERT INTO `testimonials_translations` VALUES ('ar',1,'كارا وانغ','\"أنا معجب حقًا بهذه السترة. المواد رائعة - إنها متينة وعالية الجودة، والغلاف الخارجي مقاوم للرياح للغاية وخفيف الوزن، مما يجعله مثاليًا للتنقلات الصباحية.\"','عميل تم التحقق منه'),('ar',2,'إيفلين تايلور','\"الملاءمة رائعة - لقد طلبت مقاسي المعتاد (صغير) وهو الطول المناسب تمامًا ويتناسب بشكل جيد دون أن يكون ضيقًا جدًا. تم قطع خط العنق وفتحات الذراع بشكل خفي، وهي إضافة كبيرة. أنا سعيد للغاية.\"','عميل تم التحقق منه'),('ar',3,'إيما كولينز','\"إن ملابس الأطفال ناعمة للغاية ودافئة للغاية ولطيفة على البشرة الرقيقة - ينام مولودي الجديد بشكل سليم الآن!\"','تم التحقق من المشتري'),('fr',1,'Cara Wang','\"Je suis vraiment impressionné par cette veste. Les matériaux sont excellents : elle est durable et de haute qualité, la coque extérieure est très coupe-vent et légère, parfaite pour mes déplacements matinaux.\"','Client vérifié'),('fr',2,'Evelyne Taylor','\"La coupe est excellente — j\'ai commandé ma taille habituelle (Small) et elle est juste à la bonne longueur et s\'ajuste bien sans être trop serrée. L\'encolure et les emmanchures sont discrètement coupées, ce qui est un gros plus. Je suis extrêmement satisfaite.\"','Client vérifié'),('fr',3,'Emma Collins','\"Les bodys pour bébé sont extrêmement doux, très chauds et doux pour la peau tendre — mon nouveau-né dort si profondément maintenant !\"','Acheteur vérifié'),('id',1,'Cara Wang','\"Saya sangat terkesan dengan jaket ini. Bahannya bagus — terasa tahan lama dan berkualitas tinggi, kulit luarnya sangat tahan angin dan ringan, cocok untuk perjalanan pagi saya.\"','Pelanggan Terverifikasi'),('id',2,'Evelyn Taylor','\"Paketnya pas sekali — Saya memesan ukuran biasa (Kecil) dan panjangnya pas serta pas tanpa terlalu ketat. Garis leher dan lubang lengannya dipotong secara tersembunyi, yang merupakan nilai tambah yang besar. Saya sangat senang.\"','Pelanggan Terverifikasi'),('id',3,'Emma Collins','\"Baju bayi ini sangat lembut, sangat hangat, dan lembut pada kulit yang lembut - bayi saya yang baru lahir tidur sangat nyenyak sekarang!\"','Pembeli Terverifikasi'),('tr',1,'Cara Wang','\"Bu ceketten gerçekten etkilendim. Malzemeler harika; dayanıklı ve kaliteli bir his veriyor, dış kabuk çok rüzgar geçirmez ve hafif, sabah işe gidiş gelişlerim için mükemmel.\"','Doğrulanmış Müşteri'),('tr',2,'Evelyn Taylor','\"Kalımı harika - her zamanki bedenimi (Küçük) sipariş ettim ve bu tam olarak doğru uzunlukta ve çok dar olmadan iyi uyuyor. Yaka ve kol delikleri dikkat çekmeden kesilmiş, bu büyük bir artı. Son derece memnunum.\"','Doğrulanmış Müşteri'),('tr',3,'Emma Collins','\"Bebek tulumları son derece yumuşak, süper sıcak ve hassas ciltlere karşı hassastır; yeni doğan bebeğim artık o kadar rahat uyuyor ki!\"','Doğrulanmış Alıcı'),('vi',1,'Cara Wang','\"Tôi thật sự ấn tượng với chiếc áo khoác này. Chất liệu tuyệt vời — cảm giác bền và chất lượng cao, lớp vỏ ngoài chống gió và chống nước nhẹ rất tốt, hoàn hảo cho quãng đường đi làm buổi sáng của tôi.\"','Khách Hàng Đã Xác Thực'),('vi',2,'Evelyn Taylor','\"Form dáng tuyệt vời — tôi đặt cỡ thường mặc của mình (Small) và nó vừa đúng độ dài, ôm vừa vặn mà không quá chật. Đường viền cổ và nách áo được cắt kín đáo, đó là một điểm cộng lớn. Tôi cực kỳ hài lòng.\"','Khách Hàng Đã Xác Thực'),('vi',3,'Emma Collins','\"Những bộ bodysuit cho bé cực kỳ mềm mại, siêu ấm áp và dịu nhẹ với làn da non nớt — bé sơ sinh nhà tôi giờ ngủ ngon lành đến vậy!\"','Người Mua Đã Xác Thực');
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
INSERT INTO `users` VALUES (1,'admin@company.com',NULL,NULL,'$2y$12$9w0GbGsXeSk.D3IhX0P5/eyTN4EK2b02yt91ja6VE5CUVU6Dn4G32',NULL,'2026-05-28 19:02:43','2026-05-28 19:02:43','System','Admin','admin',NULL,1,1,NULL,NULL,NULL);
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
INSERT INTO `widgets` VALUES (1,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_company_sidebar','amerce',0,'{\"name\":\"Company\",\"menu_id\":\"footer-company\"}','2026-05-28 19:02:43','2026-05-28 19:02:43'),(2,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_customer_sidebar','amerce',0,'{\"name\":\"Customer\",\"menu_id\":\"footer-help\"}','2026-05-28 19:02:43','2026-05-28 19:02:43'),(3,'Theme\\Amerce\\Widgets\\BlogAboutMeWidget','blog_sidebar','amerce',0,'{\"name\":\"Amerce Editorial\",\"title\":\"About Me\",\"image\":null,\"bio\":\"Style notes, product spotlights, and how we curate the catalog \\u2014 written by the Amerce team.\",\"social_links\":[{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\"},{\"platform\":\"instagram\",\"url\":\"https:\\/\\/instagram.com\"},{\"platform\":\"tiktok\",\"url\":\"https:\\/\\/tiktok.com\"}]}','2026-05-28 19:02:43','2026-05-28 19:02:43'),(4,'Theme\\Amerce\\Widgets\\BlogSearchWidget','blog_sidebar','amerce',1,'{\"name\":\"Search\",\"placeholder\":\"Search...\"}','2026-05-28 19:02:43','2026-05-28 19:02:43'),(5,'Theme\\Amerce\\Widgets\\BlogCategoriesWidget','blog_sidebar','amerce',2,'{\"name\":\"Categories\",\"title\":\"Categories\",\"display_posts_count\":\"yes\",\"category_ids\":[]}','2026-05-28 19:02:43','2026-05-28 19:02:43'),(6,'Theme\\Amerce\\Widgets\\BlogPostsWidget','blog_sidebar','amerce',3,'{\"name\":\"Recent Posts\",\"title\":\"Recent Posts\",\"type\":\"recent\",\"number_display\":4}','2026-05-28 19:02:43','2026-05-28 19:02:43'),(7,'Theme\\Amerce\\Widgets\\BlogTagsWidget','blog_sidebar','amerce',4,'{\"name\":\"Tags\",\"title\":\"Popular Tags\",\"number_display\":11}','2026-05-28 19:02:43','2026-05-28 19:02:43'),(8,'Theme\\Amerce\\Widgets\\ProductDeliveryInfoWidget','product_details_sidebar','amerce',0,'{\"name\":\"Product Delivery & Return\",\"estimated_intl\":\"12-26 Days\",\"estimated_intl_label\":\"International\",\"estimated_local\":\"3-6 Days\",\"estimated_local_label\":\"United States\",\"return_within\":\"45 Days\",\"return_text\":\"of purchase. Duties & taxes are non-refundable.\"}','2026-05-28 19:02:43','2026-05-28 19:02:43'),(9,'Theme\\Amerce\\Widgets\\PaymentMethodsWidget','product_details_sidebar','amerce',1,'{\"name\":\"Payment Methods\",\"title\":\"Guaranteed Safe Checkout:\",\"images\":[]}','2026-05-28 19:02:43','2026-05-28 19:02:43'),(10,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_company_sidebar','amerce-vi',0,'{\"name\":\"C\\u00f4ng ty\",\"menu_id\":\"footer-company-vi\"}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(11,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_customer_sidebar','amerce-vi',0,'{\"name\":\"Kh\\u00e1ch h\\u00e0ng\",\"menu_id\":\"footer-help-vi\"}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(12,'Theme\\Amerce\\Widgets\\BlogAboutMeWidget','blog_sidebar','amerce-vi',0,'{\"name\":\"Bi\\u00ean t\\u1eadp c\\u1ee7a America\",\"title\":\"Gi\\u1edbi thi\\u1ec7u v\\u1ec1 t\\u00f4i\",\"image\":null,\"bio\":\"Style notes, product spotlights, and how we curate the catalog \\u2014 written by the Amerce team.\",\"social_links\":[{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\"},{\"platform\":\"instagram\",\"url\":\"https:\\/\\/instagram.com\"},{\"platform\":\"tiktok\",\"url\":\"https:\\/\\/tiktok.com\"}]}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(13,'Theme\\Amerce\\Widgets\\BlogSearchWidget','blog_sidebar','amerce-vi',1,'{\"name\":\"T\\u00ecm ki\\u1ebfm\",\"placeholder\":\"Search...\"}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(14,'Theme\\Amerce\\Widgets\\BlogCategoriesWidget','blog_sidebar','amerce-vi',2,'{\"name\":\"Danh m\\u1ee5c\",\"title\":\"Danh m\\u1ee5c\",\"display_posts_count\":\"yes\",\"category_ids\":[]}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(15,'Theme\\Amerce\\Widgets\\BlogPostsWidget','blog_sidebar','amerce-vi',3,'{\"name\":\"B\\u00e0i vi\\u1ebft m\\u1edbi\",\"title\":\"B\\u00e0i vi\\u1ebft m\\u1edbi\",\"type\":\"recent\",\"number_display\":4}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(16,'Theme\\Amerce\\Widgets\\BlogTagsWidget','blog_sidebar','amerce-vi',4,'{\"name\":\"Th\\u1ebb\",\"title\":\"Th\\u1ebb ph\\u1ed5 bi\\u1ebfn\",\"number_display\":11}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(17,'Theme\\Amerce\\Widgets\\ProductDeliveryInfoWidget','product_details_sidebar','amerce-vi',0,'{\"name\":\"Giao h\\u00e0ng v\\u00e0 tr\\u1ea3 l\\u1ea1i s\\u1ea3n ph\\u1ea9m\",\"estimated_intl\":\"12-26 Days\",\"estimated_intl_label\":\"International\",\"estimated_local\":\"3-6 Days\",\"estimated_local_label\":\"United States\",\"return_within\":\"45 Days\",\"return_text\":\"of purchase. Duties & taxes are non-refundable.\"}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(18,'Theme\\Amerce\\Widgets\\PaymentMethodsWidget','product_details_sidebar','amerce-vi',1,'{\"name\":\"Ph\\u01b0\\u01a1ng th\\u1ee9c thanh to\\u00e1n\",\"title\":\"\\u0110\\u1ea3m b\\u1ea3o thanh to\\u00e1n an to\\u00e0n:\",\"images\":[]}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(19,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_company_sidebar','amerce-ar',0,'{\"name\":\"\\u0634\\u0631\\u0643\\u0629\",\"menu_id\":\"footer-company-ar\"}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(20,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_customer_sidebar','amerce-ar',0,'{\"name\":\"\\u0639\\u0645\\u064a\\u0644\",\"menu_id\":\"footer-help-ar\"}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(21,'Theme\\Amerce\\Widgets\\BlogAboutMeWidget','blog_sidebar','amerce-ar',0,'{\"name\":\"\\u0627\\u0641\\u062a\\u062a\\u0627\\u062d\\u064a\\u0629 \\u0623\\u0645\\u064a\\u0631\\u0633\",\"title\":\"\\u0652\\u0639\\u064e\\u0646\\u0651\\u0650\\u064a\",\"image\":null,\"bio\":\"Style notes, product spotlights, and how we curate the catalog \\u2014 written by the Amerce team.\",\"social_links\":[{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\"},{\"platform\":\"instagram\",\"url\":\"https:\\/\\/instagram.com\"},{\"platform\":\"tiktok\",\"url\":\"https:\\/\\/tiktok.com\"}]}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(22,'Theme\\Amerce\\Widgets\\BlogSearchWidget','blog_sidebar','amerce-ar',1,'{\"name\":\"\\u064a\\u0628\\u062d\\u062b\",\"placeholder\":\"Search...\"}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(23,'Theme\\Amerce\\Widgets\\BlogCategoriesWidget','blog_sidebar','amerce-ar',2,'{\"name\":\"\\u0641\\u0626\\u0629\",\"title\":\"\\u0641\\u0626\\u0629\",\"display_posts_count\":\"yes\",\"category_ids\":[]}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(24,'Theme\\Amerce\\Widgets\\BlogPostsWidget','blog_sidebar','amerce-ar',3,'{\"name\":\"\\u0645\\u0642\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629\",\"title\":\"\\u0645\\u0642\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629\",\"type\":\"recent\",\"number_display\":4}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(25,'Theme\\Amerce\\Widgets\\BlogTagsWidget','blog_sidebar','amerce-ar',4,'{\"name\":\"\\u0628\\u0637\\u0627\\u0642\\u0629\",\"title\":\"\\u0627\\u0644\\u0639\\u0644\\u0627\\u0645\\u0627\\u062a \\u0627\\u0644\\u0634\\u0639\\u0628\\u064a\\u0629\",\"number_display\":11}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(26,'Theme\\Amerce\\Widgets\\ProductDeliveryInfoWidget','product_details_sidebar','amerce-ar',0,'{\"name\":\"\\u062a\\u0633\\u0644\\u064a\\u0645 \\u0627\\u0644\\u0645\\u0646\\u062a\\u062c \\u0648\\u0625\\u0639\\u0627\\u062f\\u062a\\u0647\",\"estimated_intl\":\"12-26 Days\",\"estimated_intl_label\":\"International\",\"estimated_local\":\"3-6 Days\",\"estimated_local_label\":\"United States\",\"return_within\":\"45 Days\",\"return_text\":\"of purchase. Duties & taxes are non-refundable.\"}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(27,'Theme\\Amerce\\Widgets\\PaymentMethodsWidget','product_details_sidebar','amerce-ar',1,'{\"name\":\"\\u0637\\u0631\\u064a\\u0642\\u0629 \\u0627\\u0644\\u062f\\u0641\\u0639\",\"title\":\"\\u0627\\u0644\\u062e\\u0631\\u0648\\u062c \\u0627\\u0644\\u0622\\u0645\\u0646 \\u0627\\u0644\\u0645\\u0636\\u0645\\u0648\\u0646:\",\"images\":[]}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(28,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_company_sidebar','amerce-fr',0,'{\"name\":\"Entreprise\",\"menu_id\":\"footer-company-fr\"}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(29,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_customer_sidebar','amerce-fr',0,'{\"name\":\"Client\",\"menu_id\":\"footer-help-fr\"}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(30,'Theme\\Amerce\\Widgets\\BlogAboutMeWidget','blog_sidebar','amerce-fr',0,'{\"name\":\"\\u00c9ditorial am\\u00e9ricain\",\"title\":\"Sur moi\",\"image\":null,\"bio\":\"Style notes, product spotlights, and how we curate the catalog \\u2014 written by the Amerce team.\",\"social_links\":[{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\"},{\"platform\":\"instagram\",\"url\":\"https:\\/\\/instagram.com\"},{\"platform\":\"tiktok\",\"url\":\"https:\\/\\/tiktok.com\"}]}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(31,'Theme\\Amerce\\Widgets\\BlogSearchWidget','blog_sidebar','amerce-fr',1,'{\"name\":\"Recherche\",\"placeholder\":\"Search...\"}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(32,'Theme\\Amerce\\Widgets\\BlogCategoriesWidget','blog_sidebar','amerce-fr',2,'{\"name\":\"Cat\\u00e9gorie\",\"title\":\"Cat\\u00e9gorie\",\"display_posts_count\":\"yes\",\"category_ids\":[]}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(33,'Theme\\Amerce\\Widgets\\BlogPostsWidget','blog_sidebar','amerce-fr',3,'{\"name\":\"Nouvel article\",\"title\":\"Nouvel article\",\"type\":\"recent\",\"number_display\":4}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(34,'Theme\\Amerce\\Widgets\\BlogTagsWidget','blog_sidebar','amerce-fr',4,'{\"name\":\"Carte\",\"title\":\"Balises populaires\",\"number_display\":11}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(35,'Theme\\Amerce\\Widgets\\ProductDeliveryInfoWidget','product_details_sidebar','amerce-fr',0,'{\"name\":\"Livraison et retour du produit\",\"estimated_intl\":\"12-26 Days\",\"estimated_intl_label\":\"International\",\"estimated_local\":\"3-6 Days\",\"estimated_local_label\":\"United States\",\"return_within\":\"45 Days\",\"return_text\":\"of purchase. Duties & taxes are non-refundable.\"}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(36,'Theme\\Amerce\\Widgets\\PaymentMethodsWidget','product_details_sidebar','amerce-fr',1,'{\"name\":\"Mode de paiement\",\"title\":\"Paiement s\\u00e9curis\\u00e9 garanti\\u00a0:\",\"images\":[]}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(37,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_company_sidebar','amerce-id',0,'{\"name\":\"Perusahaan\",\"menu_id\":\"footer-company-id\"}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(38,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_customer_sidebar','amerce-id',0,'{\"name\":\"Pelanggan\",\"menu_id\":\"footer-help-id\"}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(39,'Theme\\Amerce\\Widgets\\BlogAboutMeWidget','blog_sidebar','amerce-id',0,'{\"name\":\"Editorial Amerika\",\"title\":\"Tentang Saya\",\"image\":null,\"bio\":\"Style notes, product spotlights, and how we curate the catalog \\u2014 written by the Amerce team.\",\"social_links\":[{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\"},{\"platform\":\"instagram\",\"url\":\"https:\\/\\/instagram.com\"},{\"platform\":\"tiktok\",\"url\":\"https:\\/\\/tiktok.com\"}]}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(40,'Theme\\Amerce\\Widgets\\BlogSearchWidget','blog_sidebar','amerce-id',1,'{\"name\":\"Mencari\",\"placeholder\":\"Search...\"}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(41,'Theme\\Amerce\\Widgets\\BlogCategoriesWidget','blog_sidebar','amerce-id',2,'{\"name\":\"Kategori\",\"title\":\"Kategori\",\"display_posts_count\":\"yes\",\"category_ids\":[]}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(42,'Theme\\Amerce\\Widgets\\BlogPostsWidget','blog_sidebar','amerce-id',3,'{\"name\":\"Artikel baru\",\"title\":\"Artikel baru\",\"type\":\"recent\",\"number_display\":4}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(43,'Theme\\Amerce\\Widgets\\BlogTagsWidget','blog_sidebar','amerce-id',4,'{\"name\":\"Kartu\",\"title\":\"Tag populer\",\"number_display\":11}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(44,'Theme\\Amerce\\Widgets\\ProductDeliveryInfoWidget','product_details_sidebar','amerce-id',0,'{\"name\":\"Pengiriman & Pengembalian Produk\",\"estimated_intl\":\"12-26 Days\",\"estimated_intl_label\":\"International\",\"estimated_local\":\"3-6 Days\",\"estimated_local_label\":\"United States\",\"return_within\":\"45 Days\",\"return_text\":\"of purchase. Duties & taxes are non-refundable.\"}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(45,'Theme\\Amerce\\Widgets\\PaymentMethodsWidget','product_details_sidebar','amerce-id',1,'{\"name\":\"Metode pembayaran\",\"title\":\"Checkout Aman Terjamin:\",\"images\":[]}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(46,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_company_sidebar','amerce-tr',0,'{\"name\":\"\\u015eirket\",\"menu_id\":\"footer-company-tr\"}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(47,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_customer_sidebar','amerce-tr',0,'{\"name\":\"M\\u00fc\\u015fteri\",\"menu_id\":\"footer-help-tr\"}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(48,'Theme\\Amerce\\Widgets\\BlogAboutMeWidget','blog_sidebar','amerce-tr',0,'{\"name\":\"Amerce Editoryal\",\"title\":\"Hakk\\u0131mda\",\"image\":null,\"bio\":\"Style notes, product spotlights, and how we curate the catalog \\u2014 written by the Amerce team.\",\"social_links\":[{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\"},{\"platform\":\"instagram\",\"url\":\"https:\\/\\/instagram.com\"},{\"platform\":\"tiktok\",\"url\":\"https:\\/\\/tiktok.com\"}]}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(49,'Theme\\Amerce\\Widgets\\BlogSearchWidget','blog_sidebar','amerce-tr',1,'{\"name\":\"Aramak\",\"placeholder\":\"Search...\"}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(50,'Theme\\Amerce\\Widgets\\BlogCategoriesWidget','blog_sidebar','amerce-tr',2,'{\"name\":\"Kategori\",\"title\":\"Kategori\",\"display_posts_count\":\"yes\",\"category_ids\":[]}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(51,'Theme\\Amerce\\Widgets\\BlogPostsWidget','blog_sidebar','amerce-tr',3,'{\"name\":\"Yeni makale\",\"title\":\"Yeni makale\",\"type\":\"recent\",\"number_display\":4}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(52,'Theme\\Amerce\\Widgets\\BlogTagsWidget','blog_sidebar','amerce-tr',4,'{\"name\":\"Kart\",\"title\":\"Pop\\u00fcler etiketler\",\"number_display\":11}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(53,'Theme\\Amerce\\Widgets\\ProductDeliveryInfoWidget','product_details_sidebar','amerce-tr',0,'{\"name\":\"\\u00dcr\\u00fcn Teslimat\\u0131 & \\u0130ade\",\"estimated_intl\":\"12-26 Days\",\"estimated_intl_label\":\"International\",\"estimated_local\":\"3-6 Days\",\"estimated_local_label\":\"United States\",\"return_within\":\"45 Days\",\"return_text\":\"of purchase. Duties & taxes are non-refundable.\"}','2026-05-28 19:03:02','2026-05-28 19:03:02'),(54,'Theme\\Amerce\\Widgets\\PaymentMethodsWidget','product_details_sidebar','amerce-tr',1,'{\"name\":\"\\u00d6deme y\\u00f6ntemi\",\"title\":\"Garantili G\\u00fcvenli \\u00d6deme:\",\"images\":[]}','2026-05-28 19:03:02','2026-05-28 19:03:02');
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

-- Dump completed on 2026-05-29  9:03:16
