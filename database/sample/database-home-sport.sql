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
INSERT INTO `activations` VALUES (1,1,'h081OKeVXRECheajbvWr6f064qH2eXq2',1,'2026-05-28 19:11:13','2026-05-28 19:11:13','2026-05-28 19:11:13');
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
INSERT INTO `categories` VALUES (1,'Training',0,'Programs, sets, and progressions for runners, lifters, and weekend athletes.','published',1,'Botble\\ACL\\Models\\User',NULL,0,0,1,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(2,'Recovery',0,'Sleep, mobility, and active recovery practices that keep you in the game.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(3,'Gear Reviews',0,'Honest takes on shoes, apparel, and training equipment — tested under load.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(4,'Lifestyle',0,'Habits, mindset, and stories from athletes balancing real life and the work.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(5,'Sports News',0,'Updates from the worlds of running, racquet sports, and emerging fitness movements.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2026-05-28 19:11:13','2026-05-28 19:11:13');
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
INSERT INTO `categories_translations` VALUES ('ar',1,'تمرين','نصائح تدريب التعزيز الإيجابي للكلاب والقطط والحيوانات الأليفة البالغة.'),('ar',2,'استعادة','النوم والتنقل وأساليب التعافي النشطة تبقيك في اللعبة.'),('ar',3,'مراجعات العتاد','مراجعات صادقة حول الأحذية والملابس ومعدات التمرين - تم اختبارها تحت الحمل.'),('ar',4,'نمط الحياة','نصائح وعادات لاستخدام التكنولوجيا عمدا كل يوم.'),('ar',5,'أخبار الرياضة','ابق على اطلاع دائم بعالم الجري ورياضات المضرب وحركات اللياقة البدنية الناشئة.'),('fr',1,'Entraînement','Conseils de formation au renforcement positif pour les chiots, les chatons et les animaux adultes.'),('fr',2,'Récupération','Les méthodes de sommeil, de mobilité et de récupération active vous maintiennent dans le jeu.'),('fr',3,'Avis sur les équipements','Commentaires honnêtes sur les chaussures, les vêtements et les équipements d\'entraînement – ​​testés sous charge.'),('fr',4,'Mode de vie','Conseils et habitudes pour utiliser la technologie intentionnellement au quotidien.'),('fr',5,'Actualités sportives','Restez informé du monde de la course à pied, des sports de raquette et des mouvements de fitness émergents.'),('id',1,'Pelatihan','Kiat pelatihan penguatan positif untuk anak anjing, anak kucing, dan hewan peliharaan dewasa.'),('id',2,'Pemulihan','Metode tidur, mobilitas, dan pemulihan aktif membuat Anda tetap bisa bermain.'),('id',3,'Ulasan Perlengkapan','Ulasan jujur ​​tentang sepatu, pakaian, dan peralatan olahraga — diuji di bawah beban.'),('id',4,'Gaya hidup','Tips dan kebiasaan memanfaatkan teknologi dengan sengaja setiap hari.'),('id',5,'Berita Olahraga','Ikuti perkembangan terkini dari dunia lari, olahraga raket, dan gerakan kebugaran yang sedang berkembang.'),('tr',1,'Eğitim','Yavru köpekler, yavru kediler ve yetişkin evcil hayvanlar için olumlu takviye eğitimi ipuçları.'),('tr',2,'İyileşmek','Uyku, hareketlilik ve aktif dinlenme yöntemleri sizi oyunda tutar.'),('tr',3,'Dişli İncelemeleri','Yük altında test edilen ayakkabılar, giysiler ve egzersiz ekipmanlarıyla ilgili dürüst incelemeler.'),('tr',4,'Yaşam Tarzı','Teknolojiyi her gün bilinçli olarak kullanmaya yönelik ipuçları ve alışkanlıklar.'),('tr',5,'Spor Haberleri','Koşu, raket sporları ve yeni ortaya çıkan fitness hareketleri dünyasından güncel kalın.'),('vi',1,'Huấn Luyện','Mẹo huấn luyện bằng phương pháp củng cố tích cực cho chó con, mèo con và thú cưng đã trưởng thành.'),('vi',2,'Phục Hồi','Giấc ngủ, sự vận động linh hoạt và các phương pháp phục hồi chủ động giữ bạn luôn trong cuộc chơi.'),('vi',3,'Đánh Giá Dụng Cụ','Những nhận định chân thực về giày, trang phục và thiết bị tập luyện — được kiểm chứng dưới tải trọng.'),('vi',4,'Phong Cách Sống','Mẹo và thói quen để sử dụng công nghệ một cách có chủ đích mỗi ngày.'),('vi',5,'Tin Tức Thể Thao','Cập nhật từ thế giới chạy bộ, thể thao dùng vợt và những phong trào thể hình mới nổi.');
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
INSERT INTO `contacts` VALUES (1,'Sophia Bennett','sophia.bennett@example.com','+1-415-555-0142','124 Folsom Street, San Francisco, CA','Question about international shipping rates','Hi team — could you tell me whether you ship to Singapore and what the typical delivery window is for the spring outerwear collection? Many thanks.',NULL,'read','2026-05-28 19:11:13','2026-05-28 19:11:13'),(2,'Marcus Tan','marcus.tan@example.com','+44-20-7946-0312','47 Hatton Garden, London EC1N','Wholesale enquiry — boutique partnership','Good morning. I run a curated mens boutique in central London. We would love to discuss stocking a small selection of your accessories range. Could you send over your wholesale lookbook and minimum order quantities?',NULL,'unread','2026-05-28 19:11:13','2026-05-28 19:11:13'),(3,'Elena Rodriguez','elena.rodriguez@example.com','+34-93-555-0188','Carrer de Mallorca 287, Barcelona','Order #AM-10458 — color confirmation','Could you confirm the exact shade of the walnut side table I ordered last week? I want to make sure it matches the rest of my living room before it ships.',NULL,'read','2026-05-28 19:11:13','2026-05-28 19:11:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_brands`
--

LOCK TABLES `ec_brands` WRITE;
/*!40000 ALTER TABLE `ec_brands` DISABLE KEYS */;
INSERT INTO `ec_brands` VALUES (1,'Carolin','Performance footwear designed for runners and everyday athletes.','https://example.com/carolin','brands/carolin.png','published',0,1,'2026-05-28 19:11:14','2026-05-28 19:11:14'),(2,'Cheryl','Studio-tested apparel for yoga, pilates, and modern movement practices.','https://example.com/cheryl','brands/cheryl.png','published',1,1,'2026-05-28 19:11:14','2026-05-28 19:11:14'),(3,'Panadoxn','Strength equipment built for at-home training and small-studio gyms.','https://example.com/panadoxn','brands/panadoxn.png','published',2,1,'2026-05-28 19:11:14','2026-05-28 19:11:14'),(4,'Shangxi','Recovery and mobility tools trusted by physical therapists and coaches.','https://example.com/shangxi','brands/shangxi.png','published',3,1,'2026-05-28 19:11:14','2026-05-28 19:11:14'),(5,'Textitles','Technical sports apparel and base layers for endurance athletes.','https://example.com/textitles','brands/textitles.png','published',4,0,'2026-05-28 19:11:14','2026-05-28 19:11:14'),(6,'Vanfaba','Racquet sports gear and pickleball equipment crafted for competitive play.','https://example.com/vanfaba','brands/vanfaba.png','published',5,0,'2026-05-28 19:11:14','2026-05-28 19:11:14');
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
INSERT INTO `ec_brands_translations` VALUES ('ar',1,'كارولين','تُصنع المجوهرات نصف الفاخرة يدويًا في ورش صغيرة في إيطاليا.'),('ar',2,'شيريل','أنماط وأشكال متميزة للمرأة العصرية.'),('ar',3,'بانادوكسن','مستحضرات التجميل الطبيعية التي بحثها خبراء الأعشاب السريرية.'),('ar',4,'شانغشى','الشاي التراثي والسيراميك وإكسسوارات التأمل.'),('ar',5,'المنسوجات','جلد سويدي ناعم ونسيج منسوج لصور ظلية غير رسمية لحقائب الكتف والهوب.'),('ar',6,'فانفابا','المجوهرات والأحزمة والسلع الجلدية الصغيرة تكمل مظهرك.'),('fr',1,'Caroline','Les bijoux demi-fins sont fabriqués à la main dans de petits ateliers en Italie.'),('fr',2,'Cheryl','Des motifs et des formes exceptionnels pour les femmes modernes.'),('fr',3,'Panadoxn','Cosmétiques naturels recherchés par des experts cliniques en plantes médicinales.'),('fr',4,'Shangxi','Thé du patrimoine, céramiques et accessoires de méditation.'),('fr',5,'Textes','Daim doux et tissu tissé pour des silhouettes décontractées de hobo et de sac à bandoulière.'),('fr',6,'Vanfaba','Bijoux décoratifs, ceintures et petite maroquinerie complètent votre look.'),('id',1,'Karolina','Perhiasan demi-fine dibuat dengan tangan di bengkel-bengkel kecil di Italia.'),('id',2,'Cheryl','Pola dan bentuk luar biasa untuk wanita modern.'),('id',3,'Panadoxn','Kosmetik alami yang diteliti oleh para ahli herbal klinis.'),('id',4,'Shangxi','Teh warisan, keramik, dan aksesoris meditasi.'),('id',5,'Tekstil','Suede lembut dan kain tenun untuk siluet hobo dan tas bahu kasual.'),('id',6,'Vanfaba','Perhiasan beraksen, ikat pinggang, dan barang-barang kulit kecil melengkapi penampilan Anda.'),('tr',1,'Carolin','Yarı kaliteli takılar İtalya\'daki küçük atölyelerde el yapımıdır.'),('tr',2,'Cheryl','Modern kadınlar için olağanüstü desenler ve şekiller.'),('tr',3,'Panadoxn','Klinik bitkisel uzmanlar tarafından araştırılan doğal kozmetikler.'),('tr',4,'Şangxi','Miras çay, seramik ve meditasyon aksesuarları.'),('tr',5,'Metinler','Gündelik serseri ve omuz çantası silüetleri için yumuşak süet ve dokuma kumaş.'),('tr',6,'Vanfaba','Vurgulu takılar, kemerler ve küçük deri eşyalar görünümünüzü tamamlıyor.'),('vi',1,'Carolin','Trang sức demi-fine làm thủ công tại các xưởng nhỏ ở Ý.'),('vi',2,'Cheryl','Họa tiết và phom dáng nổi bật dành cho phụ nữ hiện đại.'),('vi',3,'Panadoxn','Mỹ phẩm thiên nhiên được nghiên cứu bởi các chuyên gia thảo dược lâm sàng.'),('vi',4,'Shangxi','Trà di sản, gốm sứ và phụ kiện thiền.'),('vi',5,'Textitles','Da lộn mềm mại và vải dệt cho các dáng túi hobo và túi đeo vai thường ngày.'),('vi',6,'Vanfaba','Trang sức tạo điểm nhấn, thắt lưng và đồ da nhỏ hoàn thiện diện mạo của bạn.');
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
INSERT INTO `ec_currencies` VALUES (1,'USD','$',1,2,'western',0,0,1,1,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(2,'EUR','€',0,2,'western',0,1,0,0.84,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(3,'VND','₫',0,0,'western',0,2,0,23203,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(4,'NGN','₦',1,2,'western',0,2,0,895.52,'2026-05-28 19:11:13','2026-05-28 19:11:13');
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
INSERT INTO `ec_customer_addresses` VALUES (1,'Emma Collins','customer@botble.com','+1-555-0104','GB','Arizona','Phoenix','321 Maple Drive',1,1,'2026-05-28 19:11:30','2026-05-28 19:11:30','19101'),(2,'Emma Collins','customer@botble.com','+1-555-0103','GB','Michigan','San Diego','789 Pine Road',1,0,'2026-05-28 19:11:30','2026-05-28 19:11:30','33101'),(3,'Sophia Ramirez','vendor@botble.com','+1-555-0109','GB','Ohio','Denver','258 Walnut Way',2,1,'2026-05-28 19:11:31','2026-05-28 19:11:31','33101'),(4,'Sophia Ramirez','vendor@botble.com','+1-555-0101','US','Arizona','Chicago','369 Cherry Circle',2,0,'2026-05-28 19:11:31','2026-05-28 19:11:31','19101'),(5,'Olivia Carter','customer1@example.com','+1-555-0110','DE','New York','Miami','123 Main Street',3,1,'2026-05-28 19:11:31','2026-05-28 19:11:31','60601'),(6,'Ava Mitchell','customer2@example.com','+1-555-0109','US','California','New York','789 Pine Road',4,1,'2026-05-28 19:11:32','2026-05-28 19:11:32','90210'),(7,'Isabella Brooks','customer3@example.com','+1-555-0104','GB','Ohio','Chicago','456 Oak Avenue',5,1,'2026-05-28 19:11:32','2026-05-28 19:11:32','90210'),(8,'James Whitfield','customer4@example.com','+1-555-0109','AU','California','Miami','741 Spruce Street',6,1,'2026-05-28 19:11:33','2026-05-28 19:11:33','85001'),(9,'Liam Bennett','customer5@example.com','+1-555-0104','AU','Texas','Dallas','987 Birch Boulevard',7,1,'2026-05-28 19:11:33','2026-05-28 19:11:33','30301'),(10,'Noah Patterson','customer6@example.com','+1-555-0103','DE','Pennsylvania','Austin','123 Main Street',8,1,'2026-05-28 19:11:33','2026-05-28 19:11:33','60601'),(11,'Charlotte Reed','customer7@example.com','+1-555-0106','US','Georgia','New York','258 Walnut Way',9,1,'2026-05-28 19:11:34','2026-05-28 19:11:34','30301'),(12,'Amelia Foster','customer8@example.com','+1-555-0109','CA','Texas','Houston','321 Maple Drive',10,1,'2026-05-28 19:11:34','2026-05-28 19:11:34','30301');
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
INSERT INTO `ec_customers` VALUES (1,'Emma Collins','customer@botble.com','$2y$12$1QQ20FA2yF9oYD4/gh87d.NwjJyWUgxWlcwi9FtBjz7cLqUcI/zkO','testimonials/avatar-1.jpg','1993-05-23','regular',NULL,'+1-555-0101',NULL,'2026-05-28 19:11:30','2026-05-28 19:11:30','2026-05-29 02:11:29',NULL,0,NULL,'activated',NULL,NULL,NULL,0),(2,'Sophia Ramirez','vendor@botble.com','$2y$12$TjPTxWDNXO8WyYpY/Kls.uLZ76mWfr/uHDZvBtFYjTQBvkrz3kIyK','testimonials/avatar-2.jpg','1994-05-23','regular',NULL,'+1-555-0102',NULL,'2026-05-28 19:11:31','2026-05-28 19:11:35','2026-05-29 02:11:29',NULL,1,'2026-05-29 02:11:35','activated',NULL,NULL,NULL,0),(3,'Olivia Carter','customer1@example.com','$2y$12$aG8ArGsgNbUE6R/A5dU7U.73r.t219pUT.x4nZTe/GWV.Bb3qWXD2','testimonials/avatar-3.jpg','1987-05-15','regular',NULL,'+1-555-0110',NULL,'2026-05-28 19:11:31','2026-05-28 19:11:35','2026-05-29 02:11:29',NULL,1,'2026-05-29 02:11:35','activated',NULL,NULL,NULL,0),(4,'Ava Mitchell','customer2@example.com','$2y$12$/J7rjrSYB73rc.cjzZWoKeNmu2jqMJ3NRMfdU3xPKek9P4Ym3wNPm','testimonials/avatar-4.jpg','1983-05-28','regular',NULL,'+1-555-0104',NULL,'2026-05-28 19:11:32','2026-05-28 19:11:36','2026-05-29 02:11:29',NULL,1,'2026-05-29 02:11:35','activated',NULL,NULL,NULL,0),(5,'Isabella Brooks','customer3@example.com','$2y$12$jksFieySo7RRJkT4A/E6nu8FV6uKyP566oQBJJSgkQaIm8wB.U1TW','testimonials/avatar-5.jpg','1997-05-02','regular',NULL,'+1-555-0106',NULL,'2026-05-28 19:11:32','2026-05-28 19:11:37','2026-05-29 02:11:29',NULL,1,'2026-05-29 02:11:35','activated',NULL,NULL,NULL,0),(6,'James Whitfield','customer4@example.com','$2y$12$98NtdQcZaPWVPR/9edlX/On.Q60mFvJKiZ9lKT9CCbPe3eOIruFcG','testimonials/avatar-6.jpg','1994-05-06','regular',NULL,'+1-555-0102',NULL,'2026-05-28 19:11:33','2026-05-28 19:11:37','2026-05-29 02:11:29',NULL,1,'2026-05-29 02:11:35','activated',NULL,NULL,NULL,0),(7,'Liam Bennett','customer5@example.com','$2y$12$yHPo2LP4KMgMCvFFQlX01OLziSUa6ijZMnxsEDbKrS0F2KI3KeQSu','testimonials/avatar-7.jpg','2004-05-25','regular',NULL,'+1-555-0105',NULL,'2026-05-28 19:11:33','2026-05-28 19:11:38','2026-05-29 02:11:29',NULL,1,'2026-05-29 02:11:35','activated',NULL,NULL,NULL,0),(8,'Noah Patterson','customer6@example.com','$2y$12$hIwEv4GGf1eFMsknQEuD2O.vKjUXEs5B5bQdDEI2FHodlvDqZirJi','testimonials/avatar-8.jpg','1993-05-10','regular',NULL,'+1-555-0107',NULL,'2026-05-28 19:11:33','2026-05-28 19:11:38','2026-05-29 02:11:29',NULL,1,'2026-05-29 02:11:35','activated',NULL,NULL,NULL,0),(9,'Charlotte Reed','customer7@example.com','$2y$12$66n1y1DtzX8Q8asa6A9/jO8ije/qfswZPebaWcHXKZzJs.vBtwBUe','testimonials/avatar-9.jpg','1994-05-14','regular',NULL,'+1-555-0110',NULL,'2026-05-28 19:11:34','2026-05-28 19:11:39','2026-05-29 02:11:29',NULL,1,'2026-05-29 02:11:35','activated',NULL,NULL,NULL,0),(10,'Amelia Foster','customer8@example.com','$2y$12$Xb8p2.MbYN4naYGFJngE8uqXq8AkhY0cnftzNT14UHi6UzqnwOzlC','testimonials/avatar-10.jpg','1994-05-27','regular',NULL,'+1-555-0101',NULL,'2026-05-28 19:11:34','2026-05-28 19:11:39','2026-05-29 02:11:29',NULL,0,NULL,'activated',NULL,NULL,NULL,0);
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
INSERT INTO `ec_discounts` VALUES (1,'Welcome 10% Off','WELCOME10','2026-05-28 02:11:35','2026-07-28 02:11:35',NULL,0,10,'coupon',0,0,NULL,NULL,'percentage','all-orders',0.00,0,1,'2026-05-28 19:11:35','2026-05-28 19:11:35',NULL,'A welcome discount for first-time shoppers — 10% off any order.'),(2,'Free Shipping Over $50','FREESHIP','2026-05-28 02:11:35',NULL,NULL,0,100,'coupon',0,0,NULL,NULL,'shipping','all-orders',50.00,0,1,'2026-05-28 19:11:35','2026-05-28 19:11:35',NULL,'Free shipping on any order $50 or above.'),(3,'Spring Sale — $25 Off','SPRING25','2026-05-28 02:11:35','2026-06-28 02:11:35',500,0,25,'coupon',0,0,NULL,NULL,'amount','all-orders',150.00,0,1,'2026-05-28 19:11:35','2026-05-28 19:11:35',NULL,'A flat $25 off orders over $150.'),(4,'VIP Member 20% Off','VIP20','2026-05-28 02:11:35','2026-08-27 02:11:35',NULL,0,20,'coupon',0,0,NULL,NULL,'percentage','all-orders',100.00,0,1,'2026-05-28 19:11:35','2026-05-28 19:11:35',NULL,'Exclusive 20% off for newsletter subscribers.'),(5,'Bundle & Save $50','BUNDLE50','2026-05-28 02:11:35','2026-07-13 02:11:35',NULL,0,50,'coupon',0,0,NULL,NULL,'amount','all-orders',300.00,0,1,'2026-05-28 19:11:35','2026-05-28 19:11:35',NULL,'Save $50 when you spend $300 or more.');
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
INSERT INTO `ec_flash_sale_products` VALUES (1,6,41.3,50,0),(1,3,17.5,50,0),(1,4,55.3,50,0),(1,8,69.3,50,0),(1,7,27.3,50,0),(1,2,34.3,50,0),(1,5,13.3,50,0),(2,9,44.25,75,0),(2,2,36.75,75,0),(2,8,74.25,75,0),(2,3,18.75,75,0),(2,4,59.25,75,0),(2,5,14.25,75,0);
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
INSERT INTO `ec_flash_sales` VALUES (1,'48-Hour Flash Sale','2026-05-31 02:11:35','published','2026-05-28 19:11:35','2026-05-28 19:11:35'),(2,'Weekend Doorbusters','2026-06-03 02:11:35','published','2026-05-28 19:11:35','2026-05-28 19:11:35');
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
INSERT INTO `ec_global_option_value` VALUES (1,1,'No gift wrap',0,0,0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(2,1,'Standard kraft wrap',4.99,1,0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(3,1,'Premium silk-ribbon wrap',9.99,2,0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(4,2,'Up to 20 characters',14.99,0,0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(5,3,'Standard 1-year warranty',0,0,0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(6,3,'2-year extended warranty',29.99,1,0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(7,3,'3-year premium care',59.99,2,0,'2026-05-28 19:11:13','2026-05-28 19:11:13');
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
INSERT INTO `ec_global_options` VALUES (1,'Gift Wrapping','Botble\\Ecommerce\\Option\\OptionType\\Dropdown',0,0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(2,'Engraving','Botble\\Ecommerce\\Option\\OptionType\\Field',0,0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(3,'Extended Warranty','Botble\\Ecommerce\\Option\\OptionType\\RadioButton',0,0,'2026-05-28 19:11:13','2026-05-28 19:11:13');
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
INSERT INTO `ec_product_attribute_sets` VALUES (1,'Color','color','visual',1,1,1,'published',0,'2026-05-28 19:11:13','2026-05-28 19:11:13',1),(2,'Size','size','text',1,1,1,'published',1,'2026-05-28 19:11:13','2026-05-28 19:11:13',0),(3,'Material','material','text',1,1,1,'published',2,'2026-05-28 19:11:13','2026-05-28 19:11:13',0);
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
INSERT INTO `ec_product_attributes` VALUES (1,1,'Black','black','#000000',NULL,1,0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(2,1,'White','white','#FFFFFF',NULL,0,1,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(3,1,'Beige','beige','#D6BFA0',NULL,0,2,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(4,1,'Olive','olive','#6B7843',NULL,0,3,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(5,1,'Navy','navy','#10243F',NULL,0,4,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(6,1,'Burgundy','burgundy','#7B1F2B',NULL,0,5,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(7,1,'Charcoal','charcoal','#374049',NULL,0,6,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(8,1,'Cream','cream','#F1E8D7',NULL,0,7,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(9,1,'Pink','pink','#F2C2BB',NULL,0,8,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(10,1,'Brown','brown','#905D5D',NULL,0,9,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(11,1,'Green','green','#B2BD9F',NULL,0,10,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(12,1,'Blue','blue','#87CEEB',NULL,0,11,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(13,2,'XS','xs',NULL,NULL,1,0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(14,2,'S','s',NULL,NULL,0,1,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(15,2,'M','m',NULL,NULL,0,2,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(16,2,'L','l',NULL,NULL,0,3,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(17,2,'XL','xl',NULL,NULL,0,4,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(18,2,'XXL','xxl',NULL,NULL,0,5,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(19,3,'Cotton','cotton',NULL,NULL,1,0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(20,3,'Linen','linen',NULL,NULL,0,1,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(21,3,'Wool','wool',NULL,NULL,0,2,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(22,3,'Tencel','tencel',NULL,NULL,0,3,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(23,3,'Recycled Polyester','recycled-polyester',NULL,NULL,0,4,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(24,3,'Full-Grain Leather','full-grain-leather',NULL,NULL,0,5,'2026-05-28 19:11:13','2026-05-28 19:11:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categories`
--

LOCK TABLES `ec_product_categories` WRITE;
/*!40000 ALTER TABLE `ec_product_categories` DISABLE KEYS */;
INSERT INTO `ec_product_categories` VALUES (1,'Running Shoes',NULL,0,'Cushioned trainers and lightweight racers for every distance.','published',0,NULL,1,'2026-05-28 19:11:14','2026-05-28 19:11:14',NULL,NULL),(2,'Hand Weights',NULL,0,'Dumbbells, kettlebells, and grip-friendly weights for at-home strength work.','published',1,NULL,1,'2026-05-28 19:11:14','2026-05-28 19:11:14',NULL,NULL),(3,'Sports Apparel',NULL,0,'Performance shorts, tops, and layering pieces engineered for movement.','published',2,NULL,1,'2026-05-28 19:11:14','2026-05-28 19:11:14',NULL,NULL),(4,'Yoga Mats',NULL,0,'High-grip yoga and pilates mats for studio and home practice.','published',3,NULL,1,'2026-05-28 19:11:14','2026-05-28 19:11:14',NULL,NULL),(5,'Pickleball',NULL,0,'Paddles, balls, and pickleball gear for the fastest-growing sport.','published',4,NULL,1,'2026-05-28 19:11:14','2026-05-28 19:11:14',NULL,NULL);
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
INSERT INTO `ec_product_categories_translations` VALUES ('ar',1,'أحذية الجري',NULL,'أحذية رياضية مبطنة وأحذية سباق خفيفة الوزن لجميع المسافات.'),('ar',2,'أوزان اليد',NULL,'الدمبل، وأجراس الكيتل بيل، والدمبل سهلة الإمساك لتدريبات القوة في المنزل.'),('ar',3,'الملابس الرياضية',NULL,'شورتات وقمصان وملابس علوية عالية الأداء مصممة للحركة.'),('ar',4,'سجادات اليوغا',NULL,'سجادات اليوجا والبيلاتس عالية الإمساك للتمرين في الاستوديو والمنزل.'),('ar',5,'بيكلبول',NULL,'مضارب وكرات ومعدات كرة البيسبول للرياضة الأسرع نموًا.'),('fr',1,'Chaussures de course',NULL,'Baskets coussinées et chaussures de course légères pour toutes les distances.'),('fr',2,'Poids à main',NULL,'Haltères, kettlebells et haltères faciles à saisir pour l\'entraînement de force à la maison.'),('fr',3,'Vêtements de sport',NULL,'Shorts, hauts et vêtements superposés haute performance conçus pour le mouvement.'),('fr',4,'Tapis de yoga',NULL,'Tapis de yoga et de Pilates à haute adhérence pour la pratique en studio et à domicile.'),('fr',5,'Pickleball',NULL,'Raquettes, balles et équipements de pickleball pour le sport à la croissance la plus rapide.'),('id',1,'Sepatu Lari',NULL,'Sepatu kets berbantalan dan sepatu balap ringan untuk segala jarak.'),('id',2,'Beban Tangan',NULL,'Dumbel, kettlebell, dan dumbel yang mudah digenggam untuk latihan kekuatan di rumah.'),('id',3,'Pakaian Olahraga',NULL,'Celana pendek, atasan, dan perlengkapan pelapis berperforma tinggi yang dirancang untuk bergerak.'),('id',4,'Matras Yoga',NULL,'Matras yoga dan pilates dengan cengkeraman tinggi untuk latihan di studio dan di rumah.'),('id',5,'bola acar',NULL,'Raket, bola, dan perlengkapan Pickleball untuk olahraga yang paling cepat berkembang.'),('tr',1,'Koşu Ayakkabısı',NULL,'Tüm mesafeler için yastıklamalı spor ayakkabılar ve hafif yarış ayakkabıları.'),('tr',2,'El Ağırlıkları',NULL,'Evde kuvvet antrenmanı için dambıllar, kettlebell\'ler ve tutması kolay dambıllar.'),('tr',3,'Spor Giyim',NULL,'Hareket için tasarlanmış yüksek performanslı şortlar, üstler ve üstler.'),('tr',4,'Yoga Matları',NULL,'Stüdyo ve ev uygulamaları için yüksek tutuşlu yoga ve pilates matları.'),('tr',5,'Turşu topu',NULL,'En hızlı büyüyen spor için turşu raketleri, topları ve ekipmanları.'),('vi',1,'Giày Chạy Bộ',NULL,'Giày tập có đệm và giày đua nhẹ cho mọi cự ly.'),('vi',2,'Tạ Tay',NULL,'Tạ đơn, tạ ấm và tạ dễ cầm nắm cho bài tập sức mạnh tại nhà.'),('vi',3,'Trang Phục Thể Thao',NULL,'Quần short, áo và đồ mặc lớp hiệu năng cao được thiết kế cho chuyển động.'),('vi',4,'Thảm Yoga',NULL,'Thảm yoga và pilates độ bám cao cho luyện tập tại studio và tại nhà.'),('vi',5,'Pickleball',NULL,'Vợt, bóng và dụng cụ pickleball cho môn thể thao phát triển nhanh nhất.');
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
INSERT INTO `ec_product_category_product` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(2,1),(2,3),(2,4),(2,5),(2,8),(2,9),(2,10),(3,1),(3,2),(3,3),(3,6),(3,7),(3,8),(3,9),(3,10),(4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7),(4,8),(5,2),(5,4),(5,5),(5,6),(5,7),(5,9),(5,10);
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
INSERT INTO `ec_product_collection_products` VALUES (2,5),(3,9),(4,4),(4,7),(5,3),(5,8),(7,6),(8,1),(8,2),(9,10);
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
INSERT INTO `ec_product_collections` VALUES (1,'Performance','performance','Sport apparel and basics built for daily training — moisture-wicking tees, shorts, and active basics.','collection/cls-1.jpg','published','2026-05-28 19:11:14','2026-05-28 19:11:14',1),(2,'Precision Gear','precision-gear','High-performance equipment dialed in for your ultimate game.','collection/cls-10.jpg','published','2026-05-28 19:11:14','2026-05-28 19:11:14',1),(3,'Peak Performance','peak-performance','Pro-level gear for athletes chasing their best result.','collection/cls-11.jpg','published','2026-05-28 19:11:14','2026-05-28 19:11:14',1),(4,'Strength Training Essentials','strength-training-essentials','Build power and control','section/banner-62.jpg','published','2026-05-28 19:11:14','2026-05-28 19:11:14',1),(5,'Outdoor Active Protection Gear','outdoor-active-protection-gear','Move safely outdoors.','section/banner-63.jpg','published','2026-05-28 19:11:15','2026-05-28 19:11:15',0),(6,'Court Sports Game Gear','court-sports-game-gear','Play compete enjoy.','section/banner-64.jpg','published','2026-05-28 19:11:15','2026-05-28 19:11:15',0),(7,'Best Sellers','best-sellers','The sport picks our customers reorder season after season.','section/banner-1.jpg','published','2026-05-28 19:11:15','2026-05-28 19:11:15',0),(8,'New Arrivals','new-arrivals','Fresh drops from the brands powering elite athletes.','section/banner-2.jpg','published','2026-05-28 19:11:15','2026-05-28 19:11:15',0),(9,'Featured','featured','Hand-picked sport essentials our team is training in right now.','section/banner-3.jpg','published','2026-05-28 19:11:15','2026-05-28 19:11:15',0);
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
INSERT INTO `ec_product_collections_translations` VALUES ('ar',1,'أداء','مصنوع للتمارين اليومية - يتخلص من العرق، وداعم، ومتين.'),('ar',2,'معدات الدقة','معدات عالية الأداء تم ضبطها لتناسب لعبتك المثالية.'),('ar',3,'ذروة الأداء','معدات احترافية للرياضيين الذين يسعون لتحقيق أفضل أداء لهم.'),('ar',4,'أساسيات تدريب القوة','بناء القوة والسيطرة.'),('ar',5,'معدات الحماية النشطة في الهواء الطلق','التحرك بأمان في الهواء الطلق.'),('ar',6,'معدات لعبة المحكمة الرياضية','العب، تنافس، استمتع.'),('ar',7,'أفضل البائعين','المنتجات التي يثق بها العملاء ويعيدون طلبها في كل موسم.'),('ar',8,'الوافدون الجدد','يتم اختيار نماذج جديدة كل أسبوع.'),('ar',9,'مميز','أحذية رياضية أساسية اختارها فريقنا ويتم ارتداؤها الآن.'),('fr',1,'Performance','Conçu pour les entraînements quotidiens : évacuant la transpiration, offrant un bon maintien et durable.'),('fr',2,'Équipement de précision','Un équipement haute performance conçu pour votre jeu ultime.'),('fr',3,'Performances maximales','Équipement de qualité professionnelle pour les athlètes qui recherchent leurs meilleures performances.'),('fr',4,'Les essentiels de l’entraînement en force','Développez la force et le contrôle.'),('fr',5,'Équipement de protection active extérieure','Déplacez-vous à l’extérieur en toute sécurité.'),('fr',6,'Équipement de jeu de sports de terrain','Jouez, rivalisez, profitez-en.'),('fr',7,'Meilleures ventes','Des produits auxquels les clients font confiance et qui les commandent chaque saison.'),('fr',8,'Nouveautés','De nouveaux modèles sont sélectionnés chaque semaine.'),('fr',9,'En vedette','Des baskets incontournables sélectionnées par notre équipe et portées en ce moment.'),('id',1,'Pertunjukan','Dibuat untuk olahraga sehari-hari — menyerap keringat, suportif, dan tahan lama.'),('id',2,'Perlengkapan Presisi','Perlengkapan berperforma tinggi yang disesuaikan untuk permainan pamungkas Anda.'),('id',3,'Performa Puncak','Perlengkapan kelas profesional untuk atlet yang mengejar performa terbaiknya.'),('id',4,'Esensi Pelatihan Kekuatan','Bangun kekuatan dan kendali.'),('id',5,'Perlengkapan Perlindungan Aktif Luar Ruangan','Bergerak dengan aman di luar ruangan.'),('id',6,'Perlengkapan Permainan Olahraga Lapangan','Mainkan, berkompetisi, nikmati.'),('id',7,'Terlaris','Produk yang dipercaya dan dipesan ulang oleh pelanggan setiap musim.'),('id',8,'Pendatang Baru','Model-model baru dipilih setiap minggu.'),('id',9,'Unggulan','Sepatu kets esensial yang dipilih oleh tim kami dan sedang dipakai saat ini.'),('tr',1,'Performans','Günlük antrenmanlar için tasarlandı; ter tutmaz, destekleyici ve dayanıklıdır.'),('tr',2,'Hassas Dişli','En iyi oyununuz için ayarlanmış yüksek performanslı donanım.'),('tr',3,'En Yüksek Performans','En iyi performanslarını arayan sporcular için profesyonel kalitede ekipmanlar.'),('tr',4,'Güç Antrenmanının Temelleri','Güç ve kontrol oluşturun.'),('tr',5,'Dış Mekan Aktif Koruma Donanımı','Açık havada güvenle hareket edin.'),('tr',6,'Mahkeme Sporları Oyun Ekipmanı','Oynayın, yarışın, tadını çıkarın.'),('tr',7,'En Çok Satanlar','Müşterilerin güvendiği ve her sezon yeniden sipariş ettiği ürünler.'),('tr',8,'Yeni Gelenler','Her hafta yeni modeller seçiliyor.'),('tr',9,'Öne Çıkanlar','Ekibimiz tarafından seçilen ve şu anda giyilen vazgeçilmez spor ayakkabılar.'),('vi',1,'Hiệu Năng','Được làm cho tập luyện hàng ngày — thấm hút mồ hôi, hỗ trợ tốt, bền bỉ.'),('vi',2,'Dụng Cụ Chính Xác','Thiết bị hiệu năng cao được tinh chỉnh cho trận đấu đỉnh cao của bạn.'),('vi',3,'Hiệu Năng Đỉnh Cao','Dụng cụ cấp độ chuyên nghiệp cho những vận động viên theo đuổi thành tích tốt nhất.'),('vi',4,'Đồ Thiết Yếu Cho Tập Sức Mạnh','Xây dựng sức mạnh và sự kiểm soát.'),('vi',5,'Đồ Bảo Vệ Vận Động Ngoài Trời','Di chuyển an toàn ngoài trời.'),('vi',6,'Dụng Cụ Thi Đấu Thể Thao Sân','Chơi, thi đấu, tận hưởng.'),('vi',7,'Bán chạy nhất','Những sản phẩm được khách hàng tin dùng và đặt lại qua từng mùa.'),('vi',8,'Hàng Mới Về','Những mẫu mới được tuyển chọn mỗi tuần.'),('vi',9,'Nổi Bật','Những đôi sneaker thiết yếu được đội ngũ của chúng tôi tuyển chọn và đang mang ngay lúc này.');
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
INSERT INTO `ec_product_cross_sale_relations` VALUES (1,2,0,0.00,'fixed',1),(1,3,0,0.00,'fixed',1),(1,5,0,0.00,'fixed',1),(1,6,0,0.00,'fixed',1),(1,7,0,0.00,'fixed',1),(1,10,0,0.00,'fixed',1),(2,3,0,0.00,'fixed',1),(2,6,0,0.00,'fixed',1),(2,9,0,0.00,'fixed',1),(2,10,0,0.00,'fixed',1),(3,2,0,0.00,'fixed',1),(3,4,0,0.00,'fixed',1),(3,5,0,0.00,'fixed',1),(3,6,0,0.00,'fixed',1),(3,9,0,0.00,'fixed',1),(3,10,0,0.00,'fixed',1),(4,2,0,0.00,'fixed',1),(4,3,0,0.00,'fixed',1),(4,6,0,0.00,'fixed',1),(4,7,0,0.00,'fixed',1),(4,9,0,0.00,'fixed',1),(5,1,0,0.00,'fixed',1),(5,6,0,0.00,'fixed',1),(5,9,0,0.00,'fixed',1),(5,10,0,0.00,'fixed',1),(6,4,0,0.00,'fixed',1),(6,7,0,0.00,'fixed',1),(6,8,0,0.00,'fixed',1),(6,9,0,0.00,'fixed',1),(6,10,0,0.00,'fixed',1),(7,3,0,0.00,'fixed',1),(7,5,0,0.00,'fixed',1),(7,6,0,0.00,'fixed',1),(7,10,0,0.00,'fixed',1),(8,2,0,0.00,'fixed',1),(8,4,0,0.00,'fixed',1),(8,5,0,0.00,'fixed',1),(8,6,0,0.00,'fixed',1),(8,7,0,0.00,'fixed',1),(9,1,0,0.00,'fixed',1),(9,2,0,0.00,'fixed',1),(9,4,0,0.00,'fixed',1),(9,5,0,0.00,'fixed',1),(9,8,0,0.00,'fixed',1),(10,1,0,0.00,'fixed',1),(10,4,0,0.00,'fixed',1),(10,5,0,0.00,'fixed',1),(10,6,0,0.00,'fixed',1),(10,7,0,0.00,'fixed',1);
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
INSERT INTO `ec_product_label_products` VALUES (4,6),(5,3),(5,9);
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
INSERT INTO `ec_product_labels` VALUES (1,'Hot','#F0460E','published','2026-05-28 19:11:13','2026-05-28 19:11:13','#FFFFFF'),(2,'New','#22C55E','published','2026-05-28 19:11:13','2026-05-28 19:11:13','#FFFFFF'),(3,'Sale','#EF4444','published','2026-05-28 19:11:13','2026-05-28 19:11:13','#FFFFFF'),(4,'Best Seller','#1E1E1E','published','2026-05-28 19:11:13','2026-05-28 19:11:13','#FFFFFF'),(5,'Limited','#7B1F2B','published','2026-05-28 19:11:13','2026-05-28 19:11:13','#FFFFFF'),(6,'Eco','#6B7843','published','2026-05-28 19:11:13','2026-05-28 19:11:13','#FFFFFF');
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
INSERT INTO `ec_product_tag_product` VALUES (1,6),(1,9),(1,13),(2,1),(2,10),(2,13),(3,4),(3,5),(3,9),(4,1),(4,12),(4,13),(5,5),(5,7),(5,15),(6,3),(6,8),(6,11),(7,10),(7,11),(7,12),(8,4),(8,8),(8,13),(9,4),(9,10),(9,12),(10,10),(10,12),(10,14);
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
INSERT INTO `ec_product_tags` VALUES (1,'Cotton','Products tagged with Cotton.',NULL,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(2,'Linen','Products tagged with Linen.',NULL,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(3,'Wool','Products tagged with Wool.',NULL,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(4,'Leather','Products tagged with Leather.',NULL,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(5,'Tencel','Products tagged with Tencel.',NULL,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(6,'Recycled','Products tagged with Recycled.',NULL,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(7,'Made in Portugal','Products tagged with Made in Portugal.',NULL,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(8,'Made in Italy','Products tagged with Made in Italy.',NULL,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(9,'Hand-Crafted','Products tagged with Hand-Crafted.',NULL,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(10,'Vegan','Products tagged with Vegan.',NULL,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(11,'Limited Run','Products tagged with Limited Run.',NULL,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(12,'Best Seller','Products tagged with Best Seller.',NULL,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(13,'New Arrival','Products tagged with New Arrival.',NULL,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(14,'Editor Pick','Products tagged with Editor Pick.',NULL,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(15,'Eco-Friendly','Products tagged with Eco-Friendly.',NULL,'published','2026-05-28 19:11:13','2026-05-28 19:11:13');
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
INSERT INTO `ec_product_up_sale_relations` VALUES (1,7,0,5.00,'percent',1),(1,10,0,15.00,'percent',1),(2,1,0,15.00,'percent',1),(2,8,0,20.00,'fixed',1),(3,6,0,20.00,'fixed',1),(3,9,0,15.00,'percent',1),(4,3,0,50.00,'fixed',1),(4,10,0,10.00,'percent',1),(5,2,0,5.00,'fixed',1),(5,10,0,10.00,'fixed',1),(6,1,0,10.00,'fixed',1),(6,8,0,20.00,'percent',1),(7,6,0,5.00,'fixed',1),(7,9,0,15.00,'percent',1),(8,5,0,10.00,'percent',1),(9,4,0,20.00,'percent',1),(9,8,0,20.00,'fixed',1),(10,1,0,20.00,'percent',1),(10,3,0,20.00,'percent',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_variation_items`
--

LOCK TABLES `ec_product_variation_items` WRITE;
/*!40000 ALTER TABLE `ec_product_variation_items` DISABLE KEYS */;
INSERT INTO `ec_product_variation_items` VALUES (15,2,8),(5,6,3),(3,7,2),(13,8,7),(7,9,4),(9,9,5),(11,11,6),(1,12,1),(6,13,3),(12,13,6),(8,14,4),(2,15,1),(14,15,7),(10,16,5),(16,17,8),(4,18,2),(17,20,9),(19,21,11),(18,22,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_variations`
--

LOCK TABLES `ec_product_variations` WRITE;
/*!40000 ALTER TABLE `ec_product_variations` DISABLE KEYS */;
INSERT INTO `ec_product_variations` VALUES (1,11,1,1),(2,12,1,0),(3,13,1,0),(4,14,3,1),(5,15,3,0),(6,16,4,1),(7,17,4,0),(8,18,4,0),(9,19,7,1),(10,20,7,0),(11,21,7,0);
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
INSERT INTO `ec_product_with_attribute_set` VALUES (1,1,0),(2,1,0),(1,3,0),(2,3,0),(1,4,0),(2,4,0),(3,7,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_products`
--

LOCK TABLES `ec_products` WRITE;
/*!40000 ALTER TABLE `ec_products` DISABLE KEYS */;
INSERT INTO `ec_products` VALUES (1,'Men\'s Running JF190.1 Grip White','mens-running-jf1901-grip-white','Lightweight neutral trainer with responsive foam midsole and breathable mesh upper in clean white.','<p>Engineered for daily mileage, the JF190.1 balances cushion with energy return. Recycled-plastic upper, 8mm drop, suitable for road and groomed paths.</p>','published','[\"products\\/sport\\/product-1.jpg\"]',NULL,'JO-196-A1',0,17,0,1,'in_stock',0,NULL,3,0,3,10,3.60,0,99.99,69.99,NULL,NULL,11,17,20,752,NULL,'standard',47158,'2026-05-28 19:11:23','2026-05-28 19:11:39',1,0,'Botble\\ACL\\Models\\User',0,'products/sport/product-1.jpg','physical','0779490252052',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(2,'Set Of 2 3kg Hand Weights','set-of-2-3kg-hand-weights','Vinyl-coated 3kg dumbbell pair with hexagonal anti-roll heads. Sold as a matched set of two.','<p>Comfortable contoured grip, ideal for HIIT, sculpting, and rehab work. Hex heads keep the weights stable on any flat surface.</p>','published','[\"products\\/sport\\/product-2.jpg\"]',NULL,'IW-132',0,17,0,1,'in_stock',1,NULL,2,0,0,10,3.80,0,49.99,29.99,NULL,NULL,13,12,11,899,NULL,'standard',92418,'2026-05-28 19:11:24','2026-05-28 19:11:39',2,0,'Botble\\ACL\\Models\\User',0,'products/sport/product-2.jpg','physical','3202528983101',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(3,'Tennis Ball With Elastic String','tennis-ball-with-elastic-string','Solo trainer tennis ball tethered with an elastic cord — practice strokes anywhere.','<p>Felt-covered ball with a high-tension elastic return. Great for grooving forehands, backhands, and serves without a partner or court.</p>','published','[\"products\\/sport\\/product-3.jpg\"]',NULL,'GL-195-A1',0,19,0,1,'in_stock',0,NULL,6,0,2,10,3.50,0,25.99,15.99,NULL,NULL,11,12,12,666,NULL,'standard',69634,'2026-05-28 19:11:24','2026-05-28 19:11:39',3,0,'Botble\\ACL\\Models\\User',0,'products/sport/product-3.jpg','physical','9206069765886',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(4,'Pickleball Racket - Kuikma Open Blue','pickleball-racket-kuikma-open-blue','Tournament-ready pickleball paddle with graphite face and honeycomb polymer core.','<p>USAPA-approved, 8oz playing weight, perforated cushion grip for sweaty conditions. Great for control and finesse play.</p>','published','[\"products\\/sport\\/product-4.jpg\",\"products\\/sport\\/product-4-2.jpg\",\"products\\/sport\\/product-4-3.jpg\",\"products\\/sport\\/product-4-4.jpg\"]',NULL,'UW-127-A1',0,13,0,1,'in_stock',1,NULL,2,0,3,10,2.90,0,79.99,45.99,NULL,NULL,20,20,18,623,NULL,'standard',195772,'2026-05-28 19:11:24','2026-05-28 19:11:39',4,0,'Botble\\ACL\\Models\\User',0,'products/sport/product-4.jpg','physical','6942814839107',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(5,'Men\'s Sports T-Shirt - Dry Brown','mens-sports-t-shirt-dry-brown','Sweat-wicking active tee in dry brown — quick-dry knit with mesh side panels.','<p>Lightweight polyester blend keeps you cool through long sets. Flatlock seams reduce chafe and the dropped hem stays put through every rep.</p>','published','[\"products\\/sport\\/product-5.jpg\"]',NULL,'H3-123',0,17,0,1,'in_stock',0,NULL,1,0,0,10,3.30,0,19.99,9.99,NULL,NULL,13,18,20,875,NULL,'standard',90099,'2026-05-28 19:11:24','2026-05-28 19:11:39',1,0,'Botble\\ACL\\Models\\User',0,'products/sport/product-5.jpg','physical','2023700324977',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(6,'Women\'s Thin and Light Sports Shorts Black','womens-thin-and-light-sports-shorts-black','Featherweight running shorts with built-in liner and zippered key pocket.','<p>4-way stretch fabric, breathable mesh inner brief, and reflective hits for low-light visibility. Cut for natural stride and fast pace.</p>','published','[\"products\\/sport\\/product-6.jpg\"]',NULL,'MA-156',0,16,0,1,'in_stock',1,NULL,4,0,0,10,2.90,0,59.99,34.99,NULL,NULL,13,16,16,588,NULL,'standard',78594,'2026-05-28 19:11:25','2026-05-28 19:11:39',2,0,'Botble\\ACL\\Models\\User',0,'products/sport/product-6.jpg','physical','0977924058618',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(7,'4mm Ultra Grip Yoga Mat - Blue Grip','4mm-ultra-grip-yoga-mat-blue-grip','Eco-friendly natural rubber yoga mat with non-slip top texture in calm blue.','<p>4mm thick for joint cushion without losing floor feel. PVC-free, latex-free, and biodegradable. Carrying strap included.</p>','published','[\"products\\/sport\\/product-7.jpg\"]',NULL,'P1-151-A1',0,13,0,1,'in_stock',1,NULL,6,0,3,10,2.60,0,39.99,22.99,NULL,NULL,19,16,13,743,NULL,'standard',106293,'2026-05-28 19:11:25','2026-05-28 19:11:39',3,0,'Botble\\ACL\\Models\\User',0,'products/sport/product-7.jpg','physical','4782195672793',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(8,'20L Sports Bag - Gray','20l-sports-bag-gray','Compact 20L gym duffel in gray with ventilated shoe compartment and reinforced straps.','<p>Fits a full gym kit plus shoes. Zippered side pockets, water-resistant base panel, and a padded shoulder strap.</p>','published','[\"products\\/sport\\/product-8.jpg\"]',NULL,'PS-182',0,14,0,1,'in_stock',0,NULL,1,0,0,10,2.80,0,99.99,67.99,NULL,NULL,20,10,10,867,NULL,'standard',4872,'2026-05-28 19:11:25','2026-05-28 19:11:39',4,0,'Botble\\ACL\\Models\\User',0,'products/sport/product-8.jpg','physical','6043694020965',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(9,'Resistance Bands Set','resistance-bands-set','Five-band stackable resistance set with handles, ankle straps, and door anchor.','<p>Combine bands for up to 150lb resistance. Carry bag and printed exercise guide included.</p>','published','[\"products\\/sport\\/product-9.jpg\"]',NULL,'IC-133',0,20,0,1,'in_stock',0,NULL,1,0,0,10,3.10,0,59,39,NULL,NULL,15,13,14,697,NULL,'standard',104228,'2026-05-28 19:11:25','2026-05-28 19:11:39',1,0,'Botble\\ACL\\Models\\User',0,'products/sport/product-9.jpg','physical','5272133183942',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(10,'Foam Roller Pro','foam-roller-pro','High-density 24-inch foam roller with textured surface for deep tissue work.','<p>EVA construction holds shape under repeated heavy use. Targets quads, glutes, IT band, and upper back.</p>','published','[\"products\\/sport\\/product-10.jpg\"]',NULL,'SB-115',0,20,0,1,'in_stock',1,NULL,6,0,0,10,3.10,0,59,39,NULL,NULL,15,18,16,732,NULL,'standard',91066,'2026-05-28 19:11:26','2026-05-28 19:11:39',2,0,'Botble\\ACL\\Models\\User',0,'products/sport/product-10.jpg','physical','5787482635290',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(11,'Men\'s Running JF190.1 Grip White',NULL,NULL,NULL,'published','[\"products\\/sport\\/product-1.jpg\"]',NULL,'JO-196-A1',0,17,0,1,'in_stock',0,NULL,3,1,0,0,0.00,0,99.99,NULL,NULL,NULL,11,17,20,752,NULL,'standard',0,'2026-05-28 19:11:26','2026-05-28 19:11:39',1,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','6969567689810',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(12,'Men\'s Running JF190.1 Grip White',NULL,NULL,NULL,'published','[\"products\\/sport\\/product-1.jpg\"]',NULL,'JO-196-A1-A2',0,17,0,1,'in_stock',0,NULL,3,1,0,0,0.00,0,99.99,NULL,NULL,NULL,11,17,20,752,NULL,'standard',0,'2026-05-28 19:11:26','2026-05-28 19:11:39',1,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','8677021394597',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(13,'Men\'s Running JF190.1 Grip White',NULL,NULL,NULL,'published','[\"products\\/sport\\/product-1.jpg\"]',NULL,'JO-196-A1-A3',0,17,0,1,'in_stock',0,NULL,3,1,0,0,0.00,0,99.99,NULL,NULL,NULL,11,17,20,752,NULL,'standard',0,'2026-05-28 19:11:27','2026-05-28 19:11:39',1,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','2979667165699',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(14,'Tennis Ball With Elastic String',NULL,NULL,NULL,'published','[\"products\\/sport\\/product-3.jpg\"]',NULL,'GL-195-A1',0,19,0,1,'in_stock',0,NULL,6,1,0,0,0.00,0,25.99,NULL,NULL,NULL,11,12,12,666,NULL,'standard',0,'2026-05-28 19:11:27','2026-05-28 19:11:39',3,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','8240577440638',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(15,'Tennis Ball With Elastic String',NULL,NULL,NULL,'published','[\"products\\/sport\\/product-3.jpg\"]',NULL,'GL-195-A1-A2',0,19,0,1,'in_stock',0,NULL,6,1,0,0,0.00,0,25.99,NULL,NULL,NULL,11,12,12,666,NULL,'standard',0,'2026-05-28 19:11:27','2026-05-28 19:11:39',3,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','3046713631541',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(16,'Pickleball Racket - Kuikma Open Blue',NULL,NULL,NULL,'published','[\"products\\/sport\\/product-4-2.jpg\"]',NULL,'UW-127-A1',0,13,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,79.99,69.5913,NULL,NULL,20,20,18,623,NULL,'standard',0,'2026-05-28 19:11:27','2026-05-28 19:11:39',4,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','1213328710691',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(17,'Pickleball Racket - Kuikma Open Blue',NULL,NULL,NULL,'published','[\"products\\/sport\\/product-4-3.jpg\"]',NULL,'UW-127-A1-A2',0,13,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,79.99,61.5923,NULL,NULL,20,20,18,623,NULL,'standard',0,'2026-05-28 19:11:28','2026-05-28 19:11:39',4,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','9953343010858',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(18,'Pickleball Racket - Kuikma Open Blue',NULL,NULL,NULL,'published','[\"products\\/sport\\/product-4-4.jpg\"]',NULL,'UW-127-A1-A3',0,13,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,79.99,67.1916,NULL,NULL,20,20,18,623,NULL,'standard',0,'2026-05-28 19:11:28','2026-05-28 19:11:39',4,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','8804987154112',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(19,'4mm Ultra Grip Yoga Mat - Blue Grip',NULL,NULL,NULL,'published','[\"products\\/sport\\/product-7.jpg\"]',NULL,'P1-151-A1',0,13,0,1,'in_stock',0,NULL,6,1,0,0,0.00,0,39.99,NULL,NULL,NULL,19,16,13,743,NULL,'standard',0,'2026-05-28 19:11:28','2026-05-28 19:11:39',3,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','4608311539200',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(20,'4mm Ultra Grip Yoga Mat - Blue Grip',NULL,NULL,NULL,'published','[\"products\\/sport\\/product-7.jpg\"]',NULL,'P1-151-A1-A2',0,13,0,1,'in_stock',0,NULL,6,1,0,0,0.00,0,39.99,NULL,NULL,NULL,19,16,13,743,NULL,'standard',0,'2026-05-28 19:11:28','2026-05-28 19:11:39',3,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','1937809770409',NULL,NULL,0,0,'auto_generate',0,0,0,NULL),(21,'4mm Ultra Grip Yoga Mat - Blue Grip',NULL,NULL,NULL,'published','[\"products\\/sport\\/product-7.jpg\"]',NULL,'P1-151-A1-A3',0,13,0,1,'in_stock',0,NULL,6,1,0,0,0.00,0,39.99,NULL,NULL,NULL,19,16,13,743,NULL,'standard',0,'2026-05-28 19:11:28','2026-05-28 19:11:39',3,0,'Botble\\ACL\\Models\\User',0,NULL,'physical','5274871477659',NULL,NULL,0,0,'auto_generate',0,0,0,NULL);
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
INSERT INTO `ec_products_translations` VALUES ('ar',1,'حذاء جري للرجال JF190.1 باللون الأبيض',NULL,'يركز الحذاء على الخفة مع نعل أوسط من الفوم المرن وشبكة علوية بيضاء نظيفة قابلة للتنفس.','<p> مصمم للركوب اليومي، يوازن JF190.1 بين الراحة واستعادة الطاقة. الجسم مصنوع من البلاستيك المعاد تدويره، إزاحة 8 مم، مناسب للطرق الإسفلتية والممرات المسطحة.</p>'),('ar',2,'مجموعة من أوزان يدوية 3 كجم',NULL,'زوج من الدمبل المطلي بالفينيل بوزن 3 كجم مع أوزان سداسية مضادة للدوران. تباع في مجموعات من قطعتين متطابقتين.','<p> مقبض مريح، مثالي لتمارين HIIT والنحت والتعافي. يحافظ رأس الدمبل السداسي على ثبات الوزن على أي سطح مستو.</p>'),('ar',3,'كرة تنس بخيط مطاطي',NULL,'ترتبط كرات التنس الخاصة بالتدريب الشخصي بأربطة مطاطية، ويمكنك ممارسة التأرجح في أي مكان.','<p> كرة مغطاة باللباد مع شريط مطاطي عالي التمدد. رائعة للتدريب على الضربات الأمامية والخلفية والإرسال بدون شريك أو ملعب.</p>'),('ar',4,'مضرب كرة البيسبول - كويكما مفتوح باللون الأزرق',NULL,'مضرب كرة البيسبول جاهز للمنافسة مع وجه جرافيت وقلب بوليمر على شكل قرص العسل.','<p>USAPA معتمد، وزن اللعب 8 أونصة، مقبض مبطن مثقوب لظروف التعرق. رائعة للعب المتحكم والمحسن.</p>'),('ar',5,'تيشيرت رياضي رجالي - بني جاف',NULL,'تي شيرت رياضي بني جاف يتخلص من العرق — نسيج منسوج سريع الجفاف مع ألواح شبكية على الجوانب.','<p> مزيج من البوليستر خفيف الوزن يبقيك منتعشًا خلال المجموعات الطويلة. تعمل طبقات Flatlock على تقليل الاحتكاك وتبقى حاشية ao dai كما هي خلال كل تكرار.</p>'),('ar',6,'شورت رياضي رقيق وخفيف للسيدات باللون الأسود',NULL,'شورت جري خفيف للغاية مع بطانة مدمجة وجيب مفاتيح بسحاب.','<p> قماش مطاطي في 4 اتجاهات، وبطانة داخلية شبكية مسامية وتفاصيل عاكسة للرؤية في ظروف الإضاءة المنخفضة. قطع الشكل للخطوة الطبيعية والسرعة السريعة.</p>'),('ar',7,'سجادة يوجا ألترا جريب 4 ملم - قبضة زرقاء',NULL,'سجادة يوجا مطاطية طبيعية صديقة للبيئة مع سطح أزرق مضاد للانزلاق لافت للنظر.','<p>4 مم وسائد سميكة للمفاصل دون فقدان الشعور بالأرضية. خالية من PVC، وخالية من اللاتكس، وقابلة للتحلل البيولوجي. يأتي مع حزام حمل.</p>'),('ar',8,'حقيبة رياضية سعة 20 لتر – رمادي',NULL,'حقيبة رياضية رمادية صغيرة بسعة 20 لترًا مع حجرة أحذية قابلة للتنفس وأشرطة معززة.','<p> يمكن أن يحمل مجموعة كاملة من الملابس والأحذية الرياضية. جيوب جانبية بسحاب، جزء سفلي مقاوم للماء وحمالات كتف مبطنة.</p>'),('ar',9,'مجموعة عصابات المقاومة',NULL,'مجموعة من خمسة أشرطة مقاومة قابلة للتكديس مع مقابض وأشرطة للكاحل ومثبتات للأبواب.','<p> اجمع بين الأربطة لتحقيق مقاومة تصل إلى 150 رطلاً. تأتي مع حقيبة حمل وتعليمات تمرين مطبوعة.</p>'),('ar',10,'رغوة الرول برو',NULL,'أسطوانة إسفنجية عالية الكثافة بطول 60.96 سم مع سطح خشن لعمل الأنسجة العميقة.','هيكل <p>EVA يحافظ على شكله من خلال الاستخدام المكثف المتكرر. يعمل على تمرين عضلات الفخذ والأرداف وشريط IT وأعلى الظهر.</p>'),('ar',11,'حذاء جري للرجال JF190.1 باللون الأبيض',NULL,'يركز الحذاء على الخفة مع نعل أوسط من الفوم المرن وشبكة علوية بيضاء نظيفة قابلة للتنفس.','<p> مصمم للركوب اليومي، يوازن JF190.1 بين الراحة واستعادة الطاقة. الجسم مصنوع من البلاستيك المعاد تدويره، إزاحة 8 مم، مناسب للطرق الإسفلتية والممرات المسطحة.</p>'),('ar',12,'حذاء جري للرجال JF190.1 باللون الأبيض',NULL,'يركز الحذاء على الخفة مع نعل أوسط من الفوم المرن وشبكة علوية بيضاء نظيفة قابلة للتنفس.','<p> مصمم للركوب اليومي، يوازن JF190.1 بين الراحة واستعادة الطاقة. الجسم مصنوع من البلاستيك المعاد تدويره، إزاحة 8 مم، مناسب للطرق الإسفلتية والممرات المسطحة.</p>'),('ar',13,'حذاء جري للرجال JF190.1 باللون الأبيض',NULL,'يركز الحذاء على الخفة مع نعل أوسط من الفوم المرن وشبكة علوية بيضاء نظيفة قابلة للتنفس.','<p> مصمم للركوب اليومي، يوازن JF190.1 بين الراحة واستعادة الطاقة. الجسم مصنوع من البلاستيك المعاد تدويره، إزاحة 8 مم، مناسب للطرق الإسفلتية والممرات المسطحة.</p>'),('ar',14,'كرة تنس بخيط مطاطي',NULL,'ترتبط كرات التنس الخاصة بالتدريب الشخصي بأربطة مطاطية، ويمكنك ممارسة التأرجح في أي مكان.','<p> كرة مغطاة باللباد مع شريط مطاطي عالي التمدد. رائعة للتدريب على الضربات الأمامية والخلفية والإرسال بدون شريك أو ملعب.</p>'),('ar',15,'كرة تنس بخيط مطاطي',NULL,'ترتبط كرات التنس الخاصة بالتدريب الشخصي بأربطة مطاطية، ويمكنك ممارسة التأرجح في أي مكان.','<p> كرة مغطاة باللباد مع شريط مطاطي عالي التمدد. رائعة للتدريب على الضربات الأمامية والخلفية والإرسال بدون شريك أو ملعب.</p>'),('ar',16,'مضرب كرة البيسبول - كويكما مفتوح باللون الأزرق',NULL,'مضرب كرة البيسبول جاهز للمنافسة مع وجه جرافيت وقلب بوليمر على شكل قرص العسل.','<p>USAPA معتمد، وزن اللعب 8 أونصة، مقبض مبطن مثقوب لظروف التعرق. رائعة للعب المتحكم والمحسن.</p>'),('ar',17,'مضرب كرة البيسبول - كويكما مفتوح باللون الأزرق',NULL,'مضرب كرة البيسبول جاهز للمنافسة مع وجه جرافيت وقلب بوليمر على شكل قرص العسل.','<p>USAPA معتمد، وزن اللعب 8 أونصة، مقبض مبطن مثقوب لظروف التعرق. رائعة للعب المتحكم والمحسن.</p>'),('ar',18,'مضرب كرة البيسبول - كويكما مفتوح باللون الأزرق',NULL,'مضرب كرة البيسبول جاهز للمنافسة مع وجه جرافيت وقلب بوليمر على شكل قرص العسل.','<p>USAPA معتمد، وزن اللعب 8 أونصة، مقبض مبطن مثقوب لظروف التعرق. رائعة للعب المتحكم والمحسن.</p>'),('ar',19,'سجادة يوجا ألترا جريب 4 ملم - قبضة زرقاء',NULL,'سجادة يوجا مطاطية طبيعية صديقة للبيئة مع سطح أزرق مضاد للانزلاق لافت للنظر.','<p>4 مم وسائد سميكة للمفاصل دون فقدان الشعور بالأرضية. خالية من PVC، وخالية من اللاتكس، وقابلة للتحلل البيولوجي. يأتي مع حزام حمل.</p>'),('ar',20,'سجادة يوجا ألترا جريب 4 ملم - قبضة زرقاء',NULL,'سجادة يوجا مطاطية طبيعية صديقة للبيئة مع سطح أزرق مضاد للانزلاق لافت للنظر.','<p>4 مم وسائد سميكة للمفاصل دون فقدان الشعور بالأرضية. خالية من PVC، وخالية من اللاتكس، وقابلة للتحلل البيولوجي. يأتي مع حزام حمل.</p>'),('ar',21,'سجادة يوجا ألترا جريب 4 ملم - قبضة زرقاء',NULL,'سجادة يوجا مطاطية طبيعية صديقة للبيئة مع سطح أزرق مضاد للانزلاق لافت للنظر.','<p>4 مم وسائد سميكة للمفاصل دون فقدان الشعور بالأرضية. خالية من PVC، وخالية من اللاتكس، وقابلة للتحلل البيولوجي. يأتي مع حزام حمل.</p>'),('fr',1,'Homme Running JF190.1 Grip Blanc',NULL,'La chaussure met l\'accent sur la légèreté avec une semelle intercalaire en mousse résistante et une tige en maille respirante blanche et propre.','<p>Conçu pour la conduite quotidienne, le JF190.1 équilibre confort et retour d\'énergie. Carrosserie en plastique recyclé, déport de 8 mm, adaptée aux routes asphaltées et aux sentiers plats.</p>'),('fr',2,'Lot de 2 poids à main de 3 kg',NULL,'Paire d\'haltères de 3 kg recouverts de vinyle avec poids hexagonaux anti-roulement. Vendu par lot de deux pièces assorties.','<p>Poignée confortable, idéale pour les exercices HIIT, de sculpture et de récupération. La tête d\'haltère hexagonale maintient le poids stable sur toute surface plane.</p>'),('fr',3,'Balle de tennis avec corde élastique',NULL,'Les balles de tennis d\'entraînement personnel sont attachées avec des bandes élastiques : pratiquez votre swing n\'importe où.','<p>Ballon recouvert de feutre avec bande élastique hautement extensible. Idéal pour pratiquer les coups droits, les revers et les services sans partenaire ni terrain.</p>'),('fr',4,'Raquette de Pickleball - Kuikma Open Bleu',NULL,'Raquette de pickleball prête pour la compétition avec face en graphite et noyau en polymère nid d\'abeille.','<p>USAPA approuvé, poids de jeu de 8 oz, poignée rembourrée perforée pour les conditions de transpiration. Idéal pour un gameplay contrôlé et raffiné.</p>'),('fr',5,'T-Shirt de Sport Homme - Marron Sec',NULL,'T-shirt de sport marron sec qui évacue la transpiration — tissu tissé à séchage rapide avec empiècements en mesh sur les côtés.','<p>Un mélange de polyester léger vous garde au frais pendant les longues séries. Les coutures plates réduisent les frottements et l\'ourlet de l\'ao dai reste le même à chaque répétition.</p>'),('fr',6,'Short de sport fin et léger pour femme noir',NULL,'Short de course ultraléger avec doublure intégrée et poche zippée pour clés.','<p>Tissu extensible dans 4 directions, doublure intérieure en mesh respirant et détails réfléchissants pour une visibilité dans des conditions de faible luminosité. Forme coupée pour une foulée naturelle et une vitesse rapide.</p>'),('fr',7,'Tapis de yoga Ultra Grip 4 mm - Grip bleu',NULL,'Tapis de yoga en caoutchouc naturel respectueux de l\'environnement avec une surface antidérapante bleue attrayante.','<p>4 mm d\'épaisseur amortit les joints sans perdre la sensation du sol. Sans PVC, sans latex et biodégradable. Livré avec une sangle de transport.</p>'),('fr',8,'Sac de sport 20L - Gris',NULL,'Sac de sport gris compact 20 L avec compartiment à chaussures respirant et bretelles renforcées.','<p>Peut contenir un ensemble complet de vêtements et de chaussures de sport. Poches latérales zippées, fond imperméable et bretelles rembourrées.</p>'),('fr',9,'Ensemble de bandes de résistance',NULL,'Ensemble de cinq bandes de résistance empilables avec poignées, sangles de cheville et ancrages de porte.','<p>Combinez des bandes pour atteindre une résistance jusqu\'à 150 lb. Livré avec un sac de transport et des instructions d\'exercices imprimées.</p>'),('fr',10,'Rouleau en mousse Pro',NULL,'Rouleau en mousse haute densité de 24 pouces de long avec surface rugueuse pour le travail des tissus en profondeur.','La construction <p>EVA conserve sa forme grâce à une utilisation intensive et répétée. Travaille les quadriceps, les fessiers, la bande informatique et le haut du dos.</p>'),('fr',11,'Homme Running JF190.1 Grip Blanc',NULL,'La chaussure met l\'accent sur la légèreté avec une semelle intercalaire en mousse résistante et une tige en maille respirante blanche et propre.','<p>Conçu pour la conduite quotidienne, le JF190.1 équilibre confort et retour d\'énergie. Carrosserie en plastique recyclé, déport de 8 mm, adaptée aux routes asphaltées et aux sentiers plats.</p>'),('fr',12,'Homme Running JF190.1 Grip Blanc',NULL,'La chaussure met l\'accent sur la légèreté avec une semelle intercalaire en mousse résistante et une tige en maille respirante blanche et propre.','<p>Conçu pour la conduite quotidienne, le JF190.1 équilibre confort et retour d\'énergie. Carrosserie en plastique recyclé, déport de 8 mm, adaptée aux routes asphaltées et aux sentiers plats.</p>'),('fr',13,'Homme Running JF190.1 Grip Blanc',NULL,'La chaussure met l\'accent sur la légèreté avec une semelle intercalaire en mousse résistante et une tige en maille respirante blanche et propre.','<p>Conçu pour la conduite quotidienne, le JF190.1 équilibre confort et retour d\'énergie. Carrosserie en plastique recyclé, déport de 8 mm, adaptée aux routes asphaltées et aux sentiers plats.</p>'),('fr',14,'Balle de tennis avec corde élastique',NULL,'Les balles de tennis d\'entraînement personnel sont attachées avec des bandes élastiques : pratiquez votre swing n\'importe où.','<p>Ballon recouvert de feutre avec bande élastique hautement extensible. Idéal pour pratiquer les coups droits, les revers et les services sans partenaire ni terrain.</p>'),('fr',15,'Balle de tennis avec corde élastique',NULL,'Les balles de tennis d\'entraînement personnel sont attachées avec des bandes élastiques : pratiquez votre swing n\'importe où.','<p>Ballon recouvert de feutre avec bande élastique hautement extensible. Idéal pour pratiquer les coups droits, les revers et les services sans partenaire ni terrain.</p>'),('fr',16,'Raquette de Pickleball - Kuikma Open Bleu',NULL,'Raquette de pickleball prête pour la compétition avec face en graphite et noyau en polymère nid d\'abeille.','<p>USAPA approuvé, poids de jeu de 8 oz, poignée rembourrée perforée pour les conditions de transpiration. Idéal pour un gameplay contrôlé et raffiné.</p>'),('fr',17,'Raquette de Pickleball - Kuikma Open Bleu',NULL,'Raquette de pickleball prête pour la compétition avec face en graphite et noyau en polymère nid d\'abeille.','<p>USAPA approuvé, poids de jeu de 8 oz, poignée rembourrée perforée pour les conditions de transpiration. Idéal pour un gameplay contrôlé et raffiné.</p>'),('fr',18,'Raquette de Pickleball - Kuikma Open Bleu',NULL,'Raquette de pickleball prête pour la compétition avec face en graphite et noyau en polymère nid d\'abeille.','<p>USAPA approuvé, poids de jeu de 8 oz, poignée rembourrée perforée pour les conditions de transpiration. Idéal pour un gameplay contrôlé et raffiné.</p>'),('fr',19,'Tapis de yoga Ultra Grip 4 mm - Grip bleu',NULL,'Tapis de yoga en caoutchouc naturel respectueux de l\'environnement avec une surface antidérapante bleue attrayante.','<p>4 mm d\'épaisseur amortit les joints sans perdre la sensation du sol. Sans PVC, sans latex et biodégradable. Livré avec une sangle de transport.</p>'),('fr',20,'Tapis de yoga Ultra Grip 4 mm - Grip bleu',NULL,'Tapis de yoga en caoutchouc naturel respectueux de l\'environnement avec une surface antidérapante bleue attrayante.','<p>4 mm d\'épaisseur amortit les joints sans perdre la sensation du sol. Sans PVC, sans latex et biodégradable. Livré avec une sangle de transport.</p>'),('fr',21,'Tapis de yoga Ultra Grip 4 mm - Grip bleu',NULL,'Tapis de yoga en caoutchouc naturel respectueux de l\'environnement avec une surface antidérapante bleue attrayante.','<p>4 mm d\'épaisseur amortit les joints sans perdre la sensation du sol. Sans PVC, sans latex et biodégradable. Livré avec une sangle de transport.</p>'),('id',1,'Lari Pria JF190.1 Grip Putih',NULL,'Sepatu ini berfokus pada bobot ringan dengan midsole busa elastis dan bagian atas mesh bernapas berwarna putih bersih.','<p>Dirancang untuk berkendara sehari-hari, JF190.1 menyeimbangkan kenyamanan dan pengembalian energi. Bodi terbuat dari plastik daur ulang, offset 8mm, cocok untuk jalan aspal dan jalan datar.</p>'),('id',2,'Set 2 Beban Tangan 3kg',NULL,'Sepasang dumbel berlapis vinil seberat 3kg dengan beban heksagonal anti-bergulir. Dijual dalam set dua potong yang serasi.','<p>Pegangan pegangan yang nyaman, ideal untuk HIIT, latihan memahat, dan pemulihan. Kepala halter heksagonal menjaga beban tetap stabil di permukaan datar apa pun.</p>'),('id',3,'Bola Tenis Dengan Tali Elastis',NULL,'Bola tenis latihan pribadi diikat dengan karet gelang — latih ayunan Anda di mana saja.','<p>Bola terasa tertutup dengan karet gelang elastis tinggi. Cocok untuk berlatih forehand, backhand, dan servis tanpa partner atau lapangan.</p>'),('id',4,'Raket Pickleball - Kuikma Terbuka Biru',NULL,'Raket Pickleball siap kompetisi dengan permukaan grafit dan inti polimer sarang lebah.','<p>USAPA disetujui, bobot permainan 8oz, pegangan empuk berlubang untuk kondisi berkeringat. Bagus untuk gameplay yang terkontrol dan halus.</p>'),('id',5,'Kaos Olahraga Pria - Coklat Kering',NULL,'Kaos olahraga kering berwarna coklat yang menyerap keringat — kain tenun yang cepat kering dengan panel jaring di bagian samping.','<p> Campuran poliester yang ringan membuat Anda tetap sejuk selama set panjang. Jahitan flatlock mengurangi gesekan dan ujung ao dai tetap sama setiap kali diulang.</p>'),('id',6,'Celana Pendek Olahraga Wanita Tipis dan Ringan Warna Hitam',NULL,'Celana pendek lari ultraringan dengan lapisan terintegrasi dan saku kunci berritsleting.','<p>Kain elastis 4 arah, lapisan interior mesh bernapas, dan detail reflektif untuk visibilitas dalam kondisi cahaya redup. Bentuk potongan untuk langkah alami dan kecepatan cepat.</p>'),('id',7,'Matras Yoga Ultra Grip 4mm - Pegangan Biru',NULL,'Matras yoga karet alam ramah lingkungan dengan permukaan anti selip berwarna biru yang menarik.','Sambungan bantalan tebal <p>4mm tanpa menghilangkan kesan lantai. Bebas PVC, bebas lateks, dan dapat terurai secara hayati. Dilengkapi dengan tali jinjing.</p>'),('id',8,'Tas Olahraga 20L - Abu-abu',NULL,'Tas olahraga abu-abu 20L ringkas dengan kompartemen sepatu bernapas dan tali pengikat yang diperkuat.','<p>Dapat menampung satu set pakaian dan sepatu olahraga lengkap. Saku samping beritsleting, bagian bawah tahan air, dan tali bahu empuk.</p>'),('id',9,'Kumpulan Pita Perlawanan',NULL,'Set lima tali penahan yang dapat ditumpuk dengan pegangan, tali pergelangan kaki, dan jangkar pintu.','<p>Gabungkan tali untuk mencapai ketahanan hingga 150 pon. Dilengkapi dengan tas jinjing dan instruksi latihan tercetak.</p>'),('id',10,'Busa Rol Pro',NULL,'Rol busa kepadatan tinggi sepanjang 24 inci dengan permukaan kasar untuk pekerjaan jaringan dalam.','Konstruksi <p>EVA mempertahankan bentuknya melalui penggunaan berat yang berulang-ulang. Bekerja pada paha depan, bokong, pita IT, dan punggung atas.</p>'),('id',11,'Lari Pria JF190.1 Grip Putih',NULL,'Sepatu ini berfokus pada bobot ringan dengan midsole busa elastis dan bagian atas mesh bernapas berwarna putih bersih.','<p>Dirancang untuk berkendara sehari-hari, JF190.1 menyeimbangkan kenyamanan dan pengembalian energi. Bodi terbuat dari plastik daur ulang, offset 8mm, cocok untuk jalan aspal dan jalan datar.</p>'),('id',12,'Lari Pria JF190.1 Grip Putih',NULL,'Sepatu ini berfokus pada bobot ringan dengan midsole busa elastis dan bagian atas mesh bernapas berwarna putih bersih.','<p>Dirancang untuk berkendara sehari-hari, JF190.1 menyeimbangkan kenyamanan dan pengembalian energi. Bodi terbuat dari plastik daur ulang, offset 8mm, cocok untuk jalan aspal dan jalan datar.</p>'),('id',13,'Lari Pria JF190.1 Grip Putih',NULL,'Sepatu ini berfokus pada bobot ringan dengan midsole busa elastis dan bagian atas mesh bernapas berwarna putih bersih.','<p>Dirancang untuk berkendara sehari-hari, JF190.1 menyeimbangkan kenyamanan dan pengembalian energi. Bodi terbuat dari plastik daur ulang, offset 8mm, cocok untuk jalan aspal dan jalan datar.</p>'),('id',14,'Bola Tenis Dengan Tali Elastis',NULL,'Bola tenis latihan pribadi diikat dengan karet gelang — latih ayunan Anda di mana saja.','<p>Bola terasa tertutup dengan karet gelang elastis tinggi. Cocok untuk berlatih forehand, backhand, dan servis tanpa partner atau lapangan.</p>'),('id',15,'Bola Tenis Dengan Tali Elastis',NULL,'Bola tenis latihan pribadi diikat dengan karet gelang — latih ayunan Anda di mana saja.','<p>Bola terasa tertutup dengan karet gelang elastis tinggi. Cocok untuk berlatih forehand, backhand, dan servis tanpa partner atau lapangan.</p>'),('id',16,'Raket Pickleball - Kuikma Terbuka Biru',NULL,'Raket Pickleball siap kompetisi dengan permukaan grafit dan inti polimer sarang lebah.','<p>USAPA disetujui, bobot permainan 8oz, pegangan empuk berlubang untuk kondisi berkeringat. Bagus untuk gameplay yang terkontrol dan halus.</p>'),('id',17,'Raket Pickleball - Kuikma Terbuka Biru',NULL,'Raket Pickleball siap kompetisi dengan permukaan grafit dan inti polimer sarang lebah.','<p>USAPA disetujui, bobot permainan 8oz, pegangan empuk berlubang untuk kondisi berkeringat. Bagus untuk gameplay yang terkontrol dan halus.</p>'),('id',18,'Raket Pickleball - Kuikma Terbuka Biru',NULL,'Raket Pickleball siap kompetisi dengan permukaan grafit dan inti polimer sarang lebah.','<p>USAPA disetujui, bobot permainan 8oz, pegangan empuk berlubang untuk kondisi berkeringat. Bagus untuk gameplay yang terkontrol dan halus.</p>'),('id',19,'Matras Yoga Ultra Grip 4mm - Pegangan Biru',NULL,'Matras yoga karet alam ramah lingkungan dengan permukaan anti selip berwarna biru yang menarik.','Sambungan bantalan tebal <p>4mm tanpa menghilangkan kesan lantai. Bebas PVC, bebas lateks, dan dapat terurai secara hayati. Dilengkapi dengan tali jinjing.</p>'),('id',20,'Matras Yoga Ultra Grip 4mm - Pegangan Biru',NULL,'Matras yoga karet alam ramah lingkungan dengan permukaan anti selip berwarna biru yang menarik.','Sambungan bantalan tebal <p>4mm tanpa menghilangkan kesan lantai. Bebas PVC, bebas lateks, dan dapat terurai secara hayati. Dilengkapi dengan tali jinjing.</p>'),('id',21,'Matras Yoga Ultra Grip 4mm - Pegangan Biru',NULL,'Matras yoga karet alam ramah lingkungan dengan permukaan anti selip berwarna biru yang menarik.','Sambungan bantalan tebal <p>4mm tanpa menghilangkan kesan lantai. Bebas PVC, bebas lateks, dan dapat terurai secara hayati. Dilengkapi dengan tali jinjing.</p>'),('tr',1,'Erkek Koşu JF190.1 Grip Beyaz',NULL,'Ayakkabı, dayanıklı köpük orta tabanı ve temiz beyaz, nefes alabilen file üst kısmıyla hafifliğe odaklanıyor.','<p>Günlük sürüş için tasarlanan JF190.1, konfor ve enerji geri dönüşünü dengeler. Geri dönüştürülmüş plastikten yapılmış gövde, 8mm ofset, asfalt yollara ve düz yollara uygun.</p>'),('tr',2,'2\'li 3kg El Ağırlığı Seti',NULL,'Yuvarlanmayı önleyen altıgen ağırlıklara sahip 3 kg\'lık vinil kaplı dambıl çifti. İki eşleşen parçadan oluşan setler halinde satılır.','<p>Rahat kavrama sapı, HIIT, şekillendirme ve toparlanma egzersizleri için idealdir. Altıgen dambıl başlığı, ağırlığı her türlü düz yüzeyde sabit tutar.</p>'),('tr',3,'Elastik İpli Tenis Topu',NULL,'Kişisel antrenman tenis topları elastik bantlarla bağlanmıştır; vuruşunuzu istediğiniz yerde yapın.','<p>Yüksek esneme elastik bantlı, keçe kaplı top. Partneriniz veya kortunuz olmadan forehand, backhand ve servis antrenmanı yapmak için idealdir.</p>'),('tr',4,'Pickleball Raketi - Kuikma Açık Mavi',NULL,'Grafit yüzeyli ve petek polimer çekirdekli, yarışmaya hazır turşu raketi.','<p>USAPA onaylı, 8 oz oyun ağırlığı, terli koşullar için delikli yastıklı sap. Kontrollü ve gelişmiş oyun için harika.</p>'),('tr',5,'Erkek Spor Tişört - Kuru Kahverengi',NULL,'Ter tutmayan kuru kahverengi spor tişört - yanları file panelli, çabuk kuruyan dokuma kumaş.','<p>Hafif polyester karışımı, uzun setlerde serin kalmanızı sağlar. Yassı dikişler sürtünmeyi azaltır ve ao dai\'nin etek kısmı her tekrarda aynı kalır.</p>'),('tr',6,'Kadın İnce ve Hafif Spor Şort Siyah',NULL,'Entegre astarlı ve fermuarlı anahtar cepli, ultra hafif koşu şortu.','<p>4 yönlü streç kumaş, nefes alabilen file iç astar ve düşük ışık koşullarında görünürlük için yansıtıcı ayrıntılar. Doğal adım ve yüksek hız için kesilmiş form.</p>'),('tr',7,'4mm Ultra Grip Yoga Minderi - Mavi Grip',NULL,'Göz alıcı mavi kaymaz yüzeye sahip çevre dostu doğal kauçuk yoga matı.','<p>4mm kalınlığındaki yastık bağlantıları, zemin hissini kaybetmez. PVC içermez, lateks içermez ve biyolojik olarak parçalanabilir. Taşıma askısıyla birlikte gelir.</p>'),('tr',8,'20L Spor Çanta - Gri',NULL,'Nefes alabilen ayakkabı bölmeli ve güçlendirilmiş askılı, kompakt 20L gri spor çantası.','<p>Tam bir spor kıyafeti ve ayakkabı setini tutabilir. Fermuarlı yan cepler, su geçirmez alt kısım ve dolgulu omuz askıları.</p>'),('tr',9,'Direnç Bantları Seti',NULL,'Tutma yerleri, ayak bileği kayışları ve kapı ankrajlarından oluşan beş adet istiflenebilir direnç bandı seti.','<p>150 lb\'ye kadar direnç elde etmek için bantları birleştirin. Taşıma çantası ve basılı egzersiz talimatlarıyla birlikte gelir.</p>'),('tr',10,'Köpük Rulo Pro',NULL,'Derin doku çalışmaları için pürüzlü yüzeye sahip 24 inç uzunluğunda yüksek yoğunluklu köpük rulo.','<p>EVA yapısı defalarca yoğun kullanımla formunu korur. Dörtlü kasları, kalça kaslarını, IT bandını ve sırtın üst kısmını çalıştırır.</p>'),('tr',11,'Erkek Koşu JF190.1 Grip Beyaz',NULL,'Ayakkabı, dayanıklı köpük orta tabanı ve temiz beyaz, nefes alabilen file üst kısmıyla hafifliğe odaklanıyor.','<p>Günlük sürüş için tasarlanan JF190.1, konfor ve enerji geri dönüşünü dengeler. Geri dönüştürülmüş plastikten yapılmış gövde, 8mm ofset, asfalt yollara ve düz yollara uygun.</p>'),('tr',12,'Erkek Koşu JF190.1 Grip Beyaz',NULL,'Ayakkabı, dayanıklı köpük orta tabanı ve temiz beyaz, nefes alabilen file üst kısmıyla hafifliğe odaklanıyor.','<p>Günlük sürüş için tasarlanan JF190.1, konfor ve enerji geri dönüşünü dengeler. Geri dönüştürülmüş plastikten yapılmış gövde, 8mm ofset, asfalt yollara ve düz yollara uygun.</p>'),('tr',13,'Erkek Koşu JF190.1 Grip Beyaz',NULL,'Ayakkabı, dayanıklı köpük orta tabanı ve temiz beyaz, nefes alabilen file üst kısmıyla hafifliğe odaklanıyor.','<p>Günlük sürüş için tasarlanan JF190.1, konfor ve enerji geri dönüşünü dengeler. Geri dönüştürülmüş plastikten yapılmış gövde, 8mm ofset, asfalt yollara ve düz yollara uygun.</p>'),('tr',14,'Elastik İpli Tenis Topu',NULL,'Kişisel antrenman tenis topları elastik bantlarla bağlanmıştır; vuruşunuzu istediğiniz yerde yapın.','<p>Yüksek esneme elastik bantlı, keçe kaplı top. Partneriniz veya kortunuz olmadan forehand, backhand ve servis antrenmanı yapmak için idealdir.</p>'),('tr',15,'Elastik İpli Tenis Topu',NULL,'Kişisel antrenman tenis topları elastik bantlarla bağlanmıştır; vuruşunuzu istediğiniz yerde yapın.','<p>Yüksek esneme elastik bantlı, keçe kaplı top. Partneriniz veya kortunuz olmadan forehand, backhand ve servis antrenmanı yapmak için idealdir.</p>'),('tr',16,'Pickleball Raketi - Kuikma Açık Mavi',NULL,'Grafit yüzeyli ve petek polimer çekirdekli, yarışmaya hazır turşu raketi.','<p>USAPA onaylı, 8 oz oyun ağırlığı, terli koşullar için delikli yastıklı sap. Kontrollü ve gelişmiş oyun için harika.</p>'),('tr',17,'Pickleball Raketi - Kuikma Açık Mavi',NULL,'Grafit yüzeyli ve petek polimer çekirdekli, yarışmaya hazır turşu raketi.','<p>USAPA onaylı, 8 oz oyun ağırlığı, terli koşullar için delikli yastıklı sap. Kontrollü ve gelişmiş oyun için harika.</p>'),('tr',18,'Pickleball Raketi - Kuikma Açık Mavi',NULL,'Grafit yüzeyli ve petek polimer çekirdekli, yarışmaya hazır turşu raketi.','<p>USAPA onaylı, 8 oz oyun ağırlığı, terli koşullar için delikli yastıklı sap. Kontrollü ve gelişmiş oyun için harika.</p>'),('tr',19,'4mm Ultra Grip Yoga Minderi - Mavi Grip',NULL,'Göz alıcı mavi kaymaz yüzeye sahip çevre dostu doğal kauçuk yoga matı.','<p>4mm kalınlığındaki yastık bağlantıları, zemin hissini kaybetmez. PVC içermez, lateks içermez ve biyolojik olarak parçalanabilir. Taşıma askısıyla birlikte gelir.</p>'),('tr',20,'4mm Ultra Grip Yoga Minderi - Mavi Grip',NULL,'Göz alıcı mavi kaymaz yüzeye sahip çevre dostu doğal kauçuk yoga matı.','<p>4mm kalınlığındaki yastık bağlantıları, zemin hissini kaybetmez. PVC içermez, lateks içermez ve biyolojik olarak parçalanabilir. Taşıma askısıyla birlikte gelir.</p>'),('tr',21,'4mm Ultra Grip Yoga Minderi - Mavi Grip',NULL,'Göz alıcı mavi kaymaz yüzeye sahip çevre dostu doğal kauçuk yoga matı.','<p>4mm kalınlığındaki yastık bağlantıları, zemin hissini kaybetmez. PVC içermez, lateks içermez ve biyolojik olarak parçalanabilir. Taşıma askısıyla birlikte gelir.</p>'),('vi',1,'Giày Chạy Bộ Nam JF190.1 Grip White',NULL,'Giày tập trung tính nhẹ nhàng với đế giữa bằng mút đàn hồi và thân lưới thoáng khí màu trắng sạch sẽ.','<p>Được thiết kế cho quãng đường chạy hàng ngày, JF190.1 cân bằng giữa độ êm và hoàn trả năng lượng. Thân làm từ nhựa tái chế, độ chênh 8mm, phù hợp cho đường nhựa và đường mòn phẳng.</p>'),('vi',2,'Bộ 2 Tạ Tay 3kg',NULL,'Cặp tạ đơn 3kg phủ vinyl với đầu tạ lục giác chống lăn. Bán theo bộ hai chiếc đồng bộ.','<p>Tay cầm ôm sát thoải mái, lý tưởng cho HIIT, tạo dáng cơ và bài tập phục hồi. Đầu tạ lục giác giữ tạ ổn định trên mọi bề mặt phẳng.</p>'),('vi',3,'Bóng Tennis Có Dây Thun',NULL,'Bóng tennis tập luyện cá nhân được buộc với dây thun — luyện cú đánh ở bất cứ đâu.','<p>Bóng phủ nỉ với dây thun đàn hồi căng cao. Tuyệt vời để luyện cú thuận tay, trái tay và giao bóng mà không cần bạn tập hay sân.</p>'),('vi',4,'Vợt Pickleball - Kuikma Open Blue',NULL,'Vợt pickleball sẵn sàng thi đấu với mặt graphite và lõi polymer tổ ong.','<p>Được USAPA chứng nhận, trọng lượng chơi 8oz, tay cầm đệm đục lỗ cho điều kiện ra mồ hôi. Tuyệt vời cho lối chơi kiểm soát và tinh tế.</p>'),('vi',5,'Áo Thun Thể Thao Nam - Dry Brown',NULL,'Áo thun thể thao thấm hút mồ hôi màu nâu khô — vải dệt nhanh khô với các mảng lưới hai bên hông.','<p>Chất liệu pha polyester nhẹ giữ bạn mát mẻ qua những hiệp tập dài. Đường may flatlock giảm cọ xát và phần gấu áo dài giữ nguyên qua mọi lần lặp lại động tác.</p>'),('vi',6,'Quần Short Thể Thao Nữ Mỏng Nhẹ Màu Đen',NULL,'Quần short chạy bộ siêu nhẹ với lớp lót tích hợp và túi khóa kéo đựng chìa khóa.','<p>Vải co giãn 4 chiều, lớp lót lưới thoáng khí bên trong và các chi tiết phản quang giúp dễ thấy trong điều kiện thiếu sáng. Form cắt cho sải chân tự nhiên và tốc độ nhanh.</p>'),('vi',7,'Thảm Yoga Siêu Bám 4mm - Blue Grip',NULL,'Thảm yoga cao su tự nhiên thân thiện môi trường với bề mặt chống trượt màu xanh dịu mắt.','<p>Dày 4mm đệm cho khớp mà không mất cảm giác sàn. Không PVC, không latex và phân hủy sinh học. Kèm theo dây đeo mang theo.</p>'),('vi',8,'Túi Thể Thao 20L - Màu Xám',NULL,'Túi tập gym 20L nhỏ gọn màu xám với ngăn để giày thoáng khí và quai đeo được gia cố.','<p>Đựng được trọn bộ đồ tập gym kèm giày. Túi bên có khóa kéo, đáy túi chống nước và quai đeo vai có đệm.</p>'),('vi',9,'Bộ Dây Kháng Lực',NULL,'Bộ năm dây kháng lực xếp chồng được với tay cầm, đai cổ chân và móc neo cửa.','<p>Kết hợp các dây để đạt kháng lực lên đến 150lb. Kèm theo túi đựng và hướng dẫn bài tập được in sẵn.</p>'),('vi',10,'Con Lăn Mút Pro',NULL,'Con lăn mút mật độ cao dài 24 inch với bề mặt nhám cho bài tập mô sâu.','<p>Cấu trúc EVA giữ form qua nhiều lần sử dụng nặng lặp lại. Tác động vào cơ đùi trước, cơ mông, dải IT và phần lưng trên.</p>'),('vi',11,'Giày Chạy Bộ Nam JF190.1 Grip White',NULL,'Giày tập trung tính nhẹ nhàng với đế giữa bằng mút đàn hồi và thân lưới thoáng khí màu trắng sạch sẽ.','<p>Được thiết kế cho quãng đường chạy hàng ngày, JF190.1 cân bằng giữa độ êm và hoàn trả năng lượng. Thân làm từ nhựa tái chế, độ chênh 8mm, phù hợp cho đường nhựa và đường mòn phẳng.</p>'),('vi',12,'Giày Chạy Bộ Nam JF190.1 Grip White',NULL,'Giày tập trung tính nhẹ nhàng với đế giữa bằng mút đàn hồi và thân lưới thoáng khí màu trắng sạch sẽ.','<p>Được thiết kế cho quãng đường chạy hàng ngày, JF190.1 cân bằng giữa độ êm và hoàn trả năng lượng. Thân làm từ nhựa tái chế, độ chênh 8mm, phù hợp cho đường nhựa và đường mòn phẳng.</p>'),('vi',13,'Giày Chạy Bộ Nam JF190.1 Grip White',NULL,'Giày tập trung tính nhẹ nhàng với đế giữa bằng mút đàn hồi và thân lưới thoáng khí màu trắng sạch sẽ.','<p>Được thiết kế cho quãng đường chạy hàng ngày, JF190.1 cân bằng giữa độ êm và hoàn trả năng lượng. Thân làm từ nhựa tái chế, độ chênh 8mm, phù hợp cho đường nhựa và đường mòn phẳng.</p>'),('vi',14,'Bóng Tennis Có Dây Thun',NULL,'Bóng tennis tập luyện cá nhân được buộc với dây thun — luyện cú đánh ở bất cứ đâu.','<p>Bóng phủ nỉ với dây thun đàn hồi căng cao. Tuyệt vời để luyện cú thuận tay, trái tay và giao bóng mà không cần bạn tập hay sân.</p>'),('vi',15,'Bóng Tennis Có Dây Thun',NULL,'Bóng tennis tập luyện cá nhân được buộc với dây thun — luyện cú đánh ở bất cứ đâu.','<p>Bóng phủ nỉ với dây thun đàn hồi căng cao. Tuyệt vời để luyện cú thuận tay, trái tay và giao bóng mà không cần bạn tập hay sân.</p>'),('vi',16,'Vợt Pickleball - Kuikma Open Blue',NULL,'Vợt pickleball sẵn sàng thi đấu với mặt graphite và lõi polymer tổ ong.','<p>Được USAPA chứng nhận, trọng lượng chơi 8oz, tay cầm đệm đục lỗ cho điều kiện ra mồ hôi. Tuyệt vời cho lối chơi kiểm soát và tinh tế.</p>'),('vi',17,'Vợt Pickleball - Kuikma Open Blue',NULL,'Vợt pickleball sẵn sàng thi đấu với mặt graphite và lõi polymer tổ ong.','<p>Được USAPA chứng nhận, trọng lượng chơi 8oz, tay cầm đệm đục lỗ cho điều kiện ra mồ hôi. Tuyệt vời cho lối chơi kiểm soát và tinh tế.</p>'),('vi',18,'Vợt Pickleball - Kuikma Open Blue',NULL,'Vợt pickleball sẵn sàng thi đấu với mặt graphite và lõi polymer tổ ong.','<p>Được USAPA chứng nhận, trọng lượng chơi 8oz, tay cầm đệm đục lỗ cho điều kiện ra mồ hôi. Tuyệt vời cho lối chơi kiểm soát và tinh tế.</p>'),('vi',19,'Thảm Yoga Siêu Bám 4mm - Blue Grip',NULL,'Thảm yoga cao su tự nhiên thân thiện môi trường với bề mặt chống trượt màu xanh dịu mắt.','<p>Dày 4mm đệm cho khớp mà không mất cảm giác sàn. Không PVC, không latex và phân hủy sinh học. Kèm theo dây đeo mang theo.</p>'),('vi',20,'Thảm Yoga Siêu Bám 4mm - Blue Grip',NULL,'Thảm yoga cao su tự nhiên thân thiện môi trường với bề mặt chống trượt màu xanh dịu mắt.','<p>Dày 4mm đệm cho khớp mà không mất cảm giác sàn. Không PVC, không latex và phân hủy sinh học. Kèm theo dây đeo mang theo.</p>'),('vi',21,'Thảm Yoga Siêu Bám 4mm - Blue Grip',NULL,'Thảm yoga cao su tự nhiên thân thiện môi trường với bề mặt chống trượt màu xanh dịu mắt.','<p>Dày 4mm đệm cho khớp mà không mất cảm giác sàn. Không PVC, không latex và phân hủy sinh học. Kèm theo dây đeo mang theo.</p>');
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
INSERT INTO `ec_reviews` VALUES (1,5,NULL,NULL,7,5,'Clean & perfect source code','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(2,4,NULL,NULL,10,5,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(3,10,NULL,NULL,5,5,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(4,2,NULL,NULL,2,5,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(5,9,NULL,NULL,1,4,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(6,6,NULL,NULL,6,2,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(7,6,NULL,NULL,3,4,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(8,4,NULL,NULL,6,5,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(9,4,NULL,NULL,1,5,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(10,10,NULL,NULL,1,5,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(11,3,NULL,NULL,4,5,'Clean & perfect source code','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(12,3,NULL,NULL,5,3,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(13,1,NULL,NULL,9,5,'Best ecommerce CMS online store!','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(14,7,NULL,NULL,1,2,'The code is good, in general, if you like it, can you give it 5 stars?','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(15,10,NULL,NULL,9,2,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(16,7,NULL,NULL,9,4,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(17,1,NULL,NULL,3,1,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(18,3,NULL,NULL,8,3,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(19,10,NULL,NULL,6,1,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(20,6,NULL,NULL,1,4,'The code is good, in general, if you like it, can you give it 5 stars?','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(21,3,NULL,NULL,1,2,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(22,1,NULL,NULL,5,5,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(23,1,NULL,NULL,8,1,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(24,9,NULL,NULL,5,2,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(25,3,NULL,NULL,6,1,'Great E-commerce system. And much more : Wonderful Customer Support.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(26,5,NULL,NULL,2,4,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(27,5,NULL,NULL,9,1,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(28,8,NULL,NULL,6,3,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(29,9,NULL,NULL,2,4,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(30,8,NULL,NULL,2,5,'Good app, good backup service and support. Good documentation.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(31,2,NULL,NULL,4,5,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(32,10,NULL,NULL,10,2,'Best ecommerce CMS online store!','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(33,8,NULL,NULL,8,1,'Good app, good backup service and support. Good documentation.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(34,2,NULL,NULL,6,5,'Clean & perfect source code','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(35,10,NULL,NULL,8,3,'Good app, good backup service and support. Good documentation.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(36,1,NULL,NULL,7,3,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(37,8,NULL,NULL,10,2,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(38,7,NULL,NULL,10,5,'Best ecommerce CMS online store!','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(39,3,NULL,NULL,2,5,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(40,8,NULL,NULL,4,3,'Clean & perfect source code','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(41,3,NULL,NULL,9,4,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(42,5,NULL,NULL,3,1,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(43,1,NULL,NULL,4,3,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(44,8,NULL,NULL,1,1,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(45,4,NULL,NULL,4,1,'Great E-commerce system. And much more : Wonderful Customer Support.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(46,1,NULL,NULL,1,4,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(47,3,NULL,NULL,7,1,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(48,2,NULL,NULL,1,5,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(49,5,NULL,NULL,6,1,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(50,9,NULL,NULL,4,1,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(51,6,NULL,NULL,9,2,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(52,9,NULL,NULL,7,1,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(53,7,NULL,NULL,4,3,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(54,2,NULL,NULL,8,5,'Good app, good backup service and support. Good documentation.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(55,6,NULL,NULL,5,5,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(56,6,NULL,NULL,7,3,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(57,10,NULL,NULL,4,4,'Good app, good backup service and support. Good documentation.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(58,4,NULL,NULL,8,2,'Great E-commerce system. And much more : Wonderful Customer Support.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(59,10,NULL,NULL,2,2,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','auto','2026-05-28 19:11:34','2026-05-28 19:11:34',NULL),(60,5,NULL,NULL,4,2,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(61,1,NULL,NULL,10,3,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(62,6,NULL,NULL,10,2,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(63,7,NULL,NULL,8,4,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(64,10,NULL,NULL,3,3,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(65,2,NULL,NULL,7,1,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(66,7,NULL,NULL,5,3,'Great E-commerce system. And much more : Wonderful Customer Support.','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(67,1,NULL,NULL,6,3,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(68,1,NULL,NULL,2,5,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(69,8,NULL,NULL,9,4,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(70,7,NULL,NULL,7,3,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(71,2,NULL,NULL,3,3,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(72,8,NULL,NULL,7,3,'Best ecommerce CMS online store!','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(73,4,NULL,NULL,7,5,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(74,6,NULL,NULL,4,2,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(75,2,NULL,NULL,5,3,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(76,7,NULL,NULL,2,2,'Good app, good backup service and support. Good documentation.','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(77,9,NULL,NULL,3,4,'Best ecommerce CMS online store!','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(78,5,NULL,NULL,8,3,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(79,3,NULL,NULL,10,1,'The code is good, in general, if you like it, can you give it 5 stars?','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(80,4,NULL,NULL,9,5,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(81,4,NULL,NULL,2,5,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(82,5,NULL,NULL,5,4,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(83,3,NULL,NULL,3,5,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(84,4,NULL,NULL,5,1,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(85,8,NULL,NULL,3,5,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(86,5,NULL,NULL,1,4,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(87,10,NULL,NULL,7,1,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(88,4,NULL,NULL,3,5,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(89,9,NULL,NULL,9,3,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(90,2,NULL,NULL,9,1,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(91,7,NULL,NULL,3,4,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(92,9,NULL,NULL,6,4,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(93,5,NULL,NULL,10,2,'Best ecommerce CMS online store!','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(94,9,NULL,NULL,8,1,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(95,7,NULL,NULL,6,4,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(96,9,NULL,NULL,10,4,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(97,6,NULL,NULL,8,5,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(98,6,NULL,NULL,2,1,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(99,2,NULL,NULL,10,5,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL),(100,8,NULL,NULL,5,2,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','auto','2026-05-28 19:11:35','2026-05-28 19:11:35',NULL);
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
INSERT INTO `ec_shipping` VALUES (1,'Domestic',NULL,'2026-05-28 19:11:35','2026-05-28 19:11:35'),(2,'International',NULL,'2026-05-28 19:11:35','2026-05-28 19:11:35');
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
INSERT INTO `ec_shipping_rules` VALUES (1,'Free Standard Shipping (orders $99+)',1,'based_on_price',99.00,NULL,0.00,'2026-05-28 19:11:35','2026-05-28 19:11:35'),(2,'Standard (3-5 business days)',1,'based_on_price',0.00,NULL,7.99,'2026-05-28 19:11:35','2026-05-28 19:11:35'),(3,'Express (1-2 business days)',1,'based_on_price',0.00,NULL,19.99,'2026-05-28 19:11:35','2026-05-28 19:11:35'),(4,'Local Pickup',1,'based_on_price',0.00,NULL,0.00,'2026-05-28 19:11:35','2026-05-28 19:11:35'),(5,'International Standard (7-12 days)',2,'based_on_price',0.00,NULL,24.99,'2026-05-28 19:11:35','2026-05-28 19:11:35'),(6,'International Express (3-5 days)',2,'based_on_price',0.00,NULL,49.99,'2026-05-28 19:11:35','2026-05-28 19:11:35');
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
INSERT INTO `ec_specification_attributes` VALUES (1,1,'Composition','text',NULL,'55% Polyester, 30% Acrylic, 13% Polyamide, 2% Elastane','2026-05-28 19:11:13','2026-05-28 19:11:13',NULL,NULL),(2,1,'Origin','text',NULL,'Made in Portugal','2026-05-28 19:11:13','2026-05-28 19:11:13',NULL,NULL),(3,1,'Care','text',NULL,'Machine wash cold. Tumble dry low. Do not bleach.','2026-05-28 19:11:13','2026-05-28 19:11:13',NULL,NULL),(4,2,'Designed In','text',NULL,'Barcelona, Spain','2026-05-28 19:11:13','2026-05-28 19:11:13',NULL,NULL),(5,2,'Warranty','text',NULL,'12 months manufacturer warranty','2026-05-28 19:11:13','2026-05-28 19:11:13',NULL,NULL),(6,2,'Made From Recycled Materials','checkbox',NULL,'1','2026-05-28 19:11:13','2026-05-28 19:11:13',NULL,NULL);
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
INSERT INTO `ec_specification_groups` VALUES (1,'Material & Composition','Fibre breakdown, origin and care guidance.','2026-05-28 19:11:13','2026-05-28 19:11:13',NULL,NULL),(2,'Product Details','Provenance, warranty and sustainability.','2026-05-28 19:11:13','2026-05-28 19:11:13',NULL,NULL);
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
INSERT INTO `ec_specification_tables` VALUES (1,'Default Specifications','Default specification layout applied to all products.','2026-05-28 19:11:13','2026-05-28 19:11:13',NULL,NULL);
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
INSERT INTO `faq_categories` VALUES (1,'Orders &amp; Shipping',0,'published','2026-05-28 19:11:13','2026-05-28 19:11:13','Everything about placing, tracking, and receiving your order.'),(2,'Returns &amp; Refunds',1,'published','2026-05-28 19:11:13','2026-05-28 19:11:13','Our 30-day return policy and how to start a return.'),(3,'Products &amp; Stock',2,'published','2026-05-28 19:11:13','2026-05-28 19:11:13','Sizing, materials, restocks, and product care.'),(4,'Account &amp; Payment',3,'published','2026-05-28 19:11:13','2026-05-28 19:11:13','Managing your account and accepted payment methods.');
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
INSERT INTO `faqs` VALUES (1,'How long does standard shipping take?','Standard shipping arrives within 3-5 business days for domestic orders and 7-12 business days for international destinations. Express options are available at checkout.',1,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(2,'Do you offer free shipping?','Yes — orders above $99 ship free within the continental US. International free-shipping thresholds vary by destination and are shown at checkout.',1,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(3,'How can I track my order?','You will receive a tracking link by email as soon as your order is dispatched. You can also follow the parcel from your account dashboard under My Orders.',1,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(4,'Can I change the shipping address after I place my order?','Address changes are possible if your order has not yet entered fulfilment. Contact us within two hours of placing the order for the best chance of a successful update.',1,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(5,'What is your return policy?','We offer 30 days from delivery to return any unworn item in its original condition. Sale items and intimate apparel are final sale.',2,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(6,'How do I start a return?','Start a return from your account dashboard or email returns@amerce.test with your order number. We will send a prepaid return label for domestic orders.',2,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(7,'When will I receive my refund?','Refunds are processed within 3-5 business days of us receiving your return. The funds typically appear on your statement within an additional 5-7 days, depending on your bank.',2,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(8,'How do I find the right size?','Each product page includes a size chart based on actual garment measurements. If you are between sizes, we generally recommend sizing up for our knitwear and outerwear.',3,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(9,'When will sold-out items be restocked?','Most styles restock within 2-4 weeks. Click the Notify Me button on any sold-out variant to be alerted by email the moment it returns.',3,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(10,'Are your products ethically sourced?','Yes. We work only with manufacturing partners who meet our supplier code of conduct, covering fair wages, safe conditions, and verified material provenance.',3,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(11,'Which payment methods do you accept?','We accept Visa, Mastercard, American Express, Apple Pay, Google Pay, PayPal, and Klarna for eligible markets.',4,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(12,'Is it safe to enter my card details?','All payments are processed by PCI-DSS Level 1 certified providers using TLS 1.3 encryption. We never store full card numbers on our servers.',4,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(13,'How do I reset my password?','Use the Forgot Password link on the login page. A reset link will be sent to your registered email address and is valid for 30 minutes.',4,'published','2026-05-28 19:11:13','2026-05-28 19:11:13');
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
INSERT INTO `fob_product_size_guides` VALUES (1,'Default Size Chart','<h6>Bust</h6><p>Measure around the fullest part of your bust.</p><h6>Waist</h6><p>Measure around the narrowest part of your torso.</p><h6>Low Hip</h6><p>With your feet together measure around the fullest part of your hips/rear.</p>',NULL,'[\"size\", \"us\", \"bust\", \"waist\", \"low-hip\"]','[[\"XS\", \"2\", \"32\", \"24 - 25\", \"33 - 34\"], [\"S\", \"4\", \"34 - 35\", \"26 - 27\", \"35 - 26\"], [\"M\", \"6\", \"36 - 37\", \"28 - 29\", \"38 - 40\"], [\"L\", \"8\", \"38 - 29\", \"30 - 31\", \"42 - 44\"], [\"XL\", \"10\", \"40 - 41\", \"32 - 33\", \"45 - 47\"], [\"XXL\", \"12\", \"42 - 43\", \"34 - 35\", \"48 - 50\"]]','published',0,'2026-05-28 19:11:13','2026-05-28 19:11:13');
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
INSERT INTO `fob_size_guide_headers` VALUES (1,'Size','size','general',0,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(2,'US','us','general',1,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(3,'Bust','bust','general',2,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(4,'Waist','waist','general',3,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(5,'Low Hip','low-hip','general',4,'published','2026-05-28 19:11:13','2026-05-28 19:11:13');
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
INSERT INTO `language_meta` VALUES (7,'en','121263cfa1567b608996eba3fb1c7220',3,'Botble\\Menu\\Models\\Menu'),(8,'en','7230a946d3fb88ee41a7e462cae5232f',2,'Botble\\Menu\\Models\\Menu'),(9,'en','ce48841d4f0155041e54d0f6c31066ed',1,'Botble\\Menu\\Models\\Menu'),(10,'en','56bd8b973fa7c2f5838c990c2473be30',1,'Botble\\Menu\\Models\\MenuLocation'),(11,'en','25a3c10fd0a2e1e39cc4872316186f57',2,'Botble\\Menu\\Models\\MenuLocation'),(12,'en','01fb44fb70d5ae29f9f7877151ddfdbe',3,'Botble\\Menu\\Models\\MenuLocation'),(13,'vi','56bd8b973fa7c2f5838c990c2473be30',4,'Botble\\Menu\\Models\\MenuLocation'),(14,'vi','ce48841d4f0155041e54d0f6c31066ed',4,'Botble\\Menu\\Models\\Menu'),(15,'vi','25a3c10fd0a2e1e39cc4872316186f57',5,'Botble\\Menu\\Models\\MenuLocation'),(16,'vi','7230a946d3fb88ee41a7e462cae5232f',5,'Botble\\Menu\\Models\\Menu'),(17,'vi','01fb44fb70d5ae29f9f7877151ddfdbe',6,'Botble\\Menu\\Models\\MenuLocation'),(18,'vi','121263cfa1567b608996eba3fb1c7220',6,'Botble\\Menu\\Models\\Menu'),(19,'ar','56bd8b973fa7c2f5838c990c2473be30',7,'Botble\\Menu\\Models\\MenuLocation'),(20,'ar','ce48841d4f0155041e54d0f6c31066ed',7,'Botble\\Menu\\Models\\Menu'),(21,'ar','25a3c10fd0a2e1e39cc4872316186f57',8,'Botble\\Menu\\Models\\MenuLocation'),(22,'ar','7230a946d3fb88ee41a7e462cae5232f',8,'Botble\\Menu\\Models\\Menu'),(23,'ar','01fb44fb70d5ae29f9f7877151ddfdbe',9,'Botble\\Menu\\Models\\MenuLocation'),(24,'ar','121263cfa1567b608996eba3fb1c7220',9,'Botble\\Menu\\Models\\Menu'),(25,'fr','56bd8b973fa7c2f5838c990c2473be30',10,'Botble\\Menu\\Models\\MenuLocation'),(26,'fr','ce48841d4f0155041e54d0f6c31066ed',10,'Botble\\Menu\\Models\\Menu'),(27,'fr','25a3c10fd0a2e1e39cc4872316186f57',11,'Botble\\Menu\\Models\\MenuLocation'),(28,'fr','7230a946d3fb88ee41a7e462cae5232f',11,'Botble\\Menu\\Models\\Menu'),(29,'fr','01fb44fb70d5ae29f9f7877151ddfdbe',12,'Botble\\Menu\\Models\\MenuLocation'),(30,'fr','121263cfa1567b608996eba3fb1c7220',12,'Botble\\Menu\\Models\\Menu'),(31,'id','56bd8b973fa7c2f5838c990c2473be30',13,'Botble\\Menu\\Models\\MenuLocation'),(32,'id','ce48841d4f0155041e54d0f6c31066ed',13,'Botble\\Menu\\Models\\Menu'),(33,'id','25a3c10fd0a2e1e39cc4872316186f57',14,'Botble\\Menu\\Models\\MenuLocation'),(34,'id','7230a946d3fb88ee41a7e462cae5232f',14,'Botble\\Menu\\Models\\Menu'),(35,'id','01fb44fb70d5ae29f9f7877151ddfdbe',15,'Botble\\Menu\\Models\\MenuLocation'),(36,'id','121263cfa1567b608996eba3fb1c7220',15,'Botble\\Menu\\Models\\Menu'),(37,'tr','56bd8b973fa7c2f5838c990c2473be30',16,'Botble\\Menu\\Models\\MenuLocation'),(38,'tr','ce48841d4f0155041e54d0f6c31066ed',16,'Botble\\Menu\\Models\\Menu'),(39,'tr','25a3c10fd0a2e1e39cc4872316186f57',17,'Botble\\Menu\\Models\\MenuLocation'),(40,'tr','7230a946d3fb88ee41a7e462cae5232f',17,'Botble\\Menu\\Models\\Menu'),(41,'tr','01fb44fb70d5ae29f9f7877151ddfdbe',18,'Botble\\Menu\\Models\\MenuLocation'),(42,'tr','121263cfa1567b608996eba3fb1c7220',18,'Botble\\Menu\\Models\\Menu');
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'cod','cod',1,'image/png',12121,'payments/cod-20.png','[]','2026-05-28 19:11:09','2026-05-28 19:11:09',NULL,'public'),(2,0,'bank-transfer','bank-transfer',1,'image/png',29089,'payments/bank-transfer-20.png','[]','2026-05-28 19:11:10','2026-05-28 19:11:10',NULL,'public'),(3,0,'stripe','stripe',1,'image/webp',7516,'payments/stripe-20.webp','[]','2026-05-28 19:11:10','2026-05-28 19:11:10',NULL,'public'),(4,0,'paypal','paypal',1,'image/png',3001,'payments/paypal-20.png','[]','2026-05-28 19:11:11','2026-05-28 19:11:11',NULL,'public'),(5,0,'mollie','mollie',1,'image/png',8968,'payments/mollie-20.png','[]','2026-05-28 19:11:11','2026-05-28 19:11:11',NULL,'public'),(6,0,'paystack','paystack',1,'image/png',31015,'payments/paystack-20.png','[]','2026-05-28 19:11:11','2026-05-28 19:11:11',NULL,'public'),(7,0,'razorpay','razorpay',1,'image/png',8489,'payments/razorpay-20.png','[]','2026-05-28 19:11:12','2026-05-28 19:11:12',NULL,'public'),(8,0,'sslcommerz','sslcommerz',1,'image/png',3482,'payments/sslcommerz-20.png','[]','2026-05-28 19:11:12','2026-05-28 19:11:12',NULL,'public'),(9,0,'banner-62','banner-62',2,'image/jpeg',24447,'section/banner-62.jpg','[]','2026-05-28 19:11:14','2026-05-28 19:11:14',NULL,'public'),(10,0,'banner-63','banner-63',2,'image/jpeg',24447,'section/banner-63.jpg','[]','2026-05-28 19:11:14','2026-05-28 19:11:14',NULL,'public'),(11,0,'banner-64','banner-64',2,'image/jpeg',24447,'section/banner-64.jpg','[]','2026-05-28 19:11:15','2026-05-28 19:11:15',NULL,'public'),(12,0,'product-1','product-1',4,'image/jpeg',21916,'products/sport/product-1.jpg','[]','2026-05-28 19:11:15','2026-05-28 19:11:15',NULL,'public'),(13,0,'product-2','product-2',4,'image/jpeg',21916,'products/sport/product-2.jpg','[]','2026-05-28 19:11:16','2026-05-28 19:11:16',NULL,'public'),(14,0,'product-3','product-3',4,'image/jpeg',21916,'products/sport/product-3.jpg','[]','2026-05-28 19:11:16','2026-05-28 19:11:16',NULL,'public'),(15,0,'product-4','product-4',4,'image/jpeg',21916,'products/sport/product-4.jpg','[]','2026-05-28 19:11:17','2026-05-28 19:11:17',NULL,'public'),(16,0,'product-4_2','product-4_2',4,'image/jpeg',21916,'products/sport/product-4-2.jpg','[]','2026-05-28 19:11:18','2026-05-28 19:11:18',NULL,'public'),(17,0,'product-4_3','product-4_3',4,'image/jpeg',21916,'products/sport/product-4-3.jpg','[]','2026-05-28 19:11:18','2026-05-28 19:11:18',NULL,'public'),(18,0,'product-4_4','product-4_4',4,'image/jpeg',21916,'products/sport/product-4-4.jpg','[]','2026-05-28 19:11:19','2026-05-28 19:11:19',NULL,'public'),(19,0,'product-5','product-5',4,'image/jpeg',21916,'products/sport/product-5.jpg','[]','2026-05-28 19:11:20','2026-05-28 19:11:20',NULL,'public'),(20,0,'product-6','product-6',4,'image/jpeg',21916,'products/sport/product-6.jpg','[]','2026-05-28 19:11:20','2026-05-28 19:11:20',NULL,'public'),(21,0,'product-7','product-7',4,'image/jpeg',21916,'products/sport/product-7.jpg','[]','2026-05-28 19:11:21','2026-05-28 19:11:21',NULL,'public'),(22,0,'product-8','product-8',4,'image/jpeg',21916,'products/sport/product-8.jpg','[]','2026-05-28 19:11:21','2026-05-28 19:11:21',NULL,'public'),(23,0,'product-9','product-9',4,'image/jpeg',21916,'products/sport/product-9.jpg','[]','2026-05-28 19:11:22','2026-05-28 19:11:22',NULL,'public'),(24,0,'product-10','product-10',4,'image/jpeg',21916,'products/sport/product-10.jpg','[]','2026-05-28 19:11:23','2026-05-28 19:11:23',NULL,'public'),(25,0,'tes-28','tes-28',5,'image/jpeg',3439,'testimonials/tes-28.jpg','[]','2026-05-28 19:11:39','2026-05-28 19:11:39',NULL,'public'),(26,0,'tes-27','tes-27',5,'image/jpeg',3439,'testimonials/tes-27.jpg','[]','2026-05-28 19:11:40','2026-05-28 19:11:40',NULL,'public'),(27,0,'tes-1','tes-1',5,'image/jpeg',3439,'testimonials/tes-1.jpg','[]','2026-05-28 19:11:40','2026-05-28 19:11:40',NULL,'public'),(28,0,'tes-2','tes-2',5,'image/jpeg',3439,'testimonials/tes-2.jpg','[]','2026-05-28 19:11:40','2026-05-28 19:11:40',NULL,'public'),(29,0,'member-1','member-1',6,'image/jpeg',3439,'member/member-1.jpg','[]','2026-05-28 19:11:40','2026-05-28 19:11:40',NULL,'public'),(30,0,'member-2','member-2',6,'image/jpeg',3439,'member/member-2.jpg','[]','2026-05-28 19:11:40','2026-05-28 19:11:40',NULL,'public'),(31,0,'member-3','member-3',6,'image/jpeg',3439,'member/member-3.jpg','[]','2026-05-28 19:11:40','2026-05-28 19:11:40',NULL,'public'),(32,0,'member-4','member-4',6,'image/jpeg',3439,'member/member-4.jpg','[]','2026-05-28 19:11:40','2026-05-28 19:11:40',NULL,'public'),(33,0,'s-contact-1','s-contact-1',2,'image/jpeg',41514,'section/s-contact-1.jpg','[]','2026-05-28 19:11:40','2026-05-28 19:11:40',NULL,'public'),(34,0,'s-contact-2','s-contact-2',2,'image/jpeg',16643,'section/s-contact-2.jpg','[]','2026-05-28 19:11:40','2026-05-28 19:11:40',NULL,'public'),(35,0,'banner-12','banner-12',2,'image/jpeg',22623,'section/banner-12.jpg','[]','2026-05-28 19:11:40','2026-05-28 19:11:40',NULL,'public'),(36,0,'banner-59','banner-59',2,'image/jpeg',44996,'section/banner-59.jpg','[]','2026-05-28 19:11:40','2026-05-28 19:11:40',NULL,'public'),(37,0,'banner-60','banner-60',2,'image/jpeg',22483,'section/banner-60.jpg','[]','2026-05-28 19:11:41','2026-05-28 19:11:41',NULL,'public'),(38,0,'banner-61','banner-61',2,'image/jpeg',22483,'section/banner-61.jpg','[]','2026-05-28 19:11:41','2026-05-28 19:11:41',NULL,'public'),(39,0,'sport-tab-1','sport-tab-1',2,'image/jpeg',21916,'section/sport-tab-1.jpg','[]','2026-05-28 19:11:41','2026-05-28 19:11:41',NULL,'public'),(40,0,'sport-tab-2','sport-tab-2',2,'image/jpeg',21916,'section/sport-tab-2.jpg','[]','2026-05-28 19:11:41','2026-05-28 19:11:41',NULL,'public'),(41,0,'sport-tab-3','sport-tab-3',2,'image/jpeg',21916,'section/sport-tab-3.jpg','[]','2026-05-28 19:11:42','2026-05-28 19:11:42',NULL,'public'),(42,0,'sport-tab-4','sport-tab-4',2,'image/jpeg',21916,'section/sport-tab-4.jpg','[]','2026-05-28 19:11:42','2026-05-28 19:11:42',NULL,'public'),(43,0,'look-10','look-10',7,'image/jpeg',48182,'lookbook/look-10.jpg','[]','2026-05-28 19:11:43','2026-05-28 19:11:43',NULL,'public'),(44,0,'look-11','look-11',7,'image/jpeg',48182,'lookbook/look-11.jpg','[]','2026-05-28 19:11:43','2026-05-28 19:11:43',NULL,'public'),(45,0,'gallery-62','gallery-62',8,'image/jpeg',21916,'gallery/gallery-62.jpg','[]','2026-05-28 19:11:44','2026-05-28 19:11:44',NULL,'public'),(46,0,'gallery-63','gallery-63',8,'image/jpeg',21916,'gallery/gallery-63.jpg','[]','2026-05-28 19:11:44','2026-05-28 19:11:44',NULL,'public'),(47,0,'gallery-64','gallery-64',8,'image/jpeg',21916,'gallery/gallery-64.jpg','[]','2026-05-28 19:11:45','2026-05-28 19:11:45',NULL,'public'),(48,0,'gallery-65','gallery-65',8,'image/jpeg',21916,'gallery/gallery-65.jpg','[]','2026-05-28 19:11:45','2026-05-28 19:11:45',NULL,'public'),(49,0,'gallery-66','gallery-66',8,'image/jpeg',21916,'gallery/gallery-66.jpg','[]','2026-05-28 19:11:45','2026-05-28 19:11:45',NULL,'public');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'payments',NULL,'payments',0,'2026-05-28 19:11:09','2026-05-28 19:11:09',NULL),(2,0,'section',NULL,'section',0,'2026-05-28 19:11:14','2026-05-28 19:11:14',NULL),(3,0,'products',NULL,'products',0,'2026-05-28 19:11:15','2026-05-28 19:11:15',NULL),(4,0,'sport',NULL,'sport',3,'2026-05-28 19:11:15','2026-05-28 19:11:15',NULL),(5,0,'testimonials',NULL,'testimonials',0,'2026-05-28 19:11:39','2026-05-28 19:11:39',NULL),(6,0,'member',NULL,'member',0,'2026-05-28 19:11:40','2026-05-28 19:11:40',NULL),(7,0,'lookbook',NULL,'lookbook',0,'2026-05-28 19:11:43','2026-05-28 19:11:43',NULL),(8,0,'gallery',NULL,'gallery',0,'2026-05-28 19:11:44','2026-05-28 19:11:44',NULL);
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
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2026-05-28 19:11:13','2026-05-28 19:11:13'),(2,2,'footer-menu-1','2026-05-28 19:11:13','2026-05-28 19:11:13'),(3,3,'footer-menu-2','2026-05-28 19:11:13','2026-05-28 19:11:13'),(4,4,'main-menu','2026-05-28 19:11:46','2026-05-28 19:11:46'),(5,5,'footer-menu-1','2026-05-28 19:11:46','2026-05-28 19:11:46'),(6,6,'footer-menu-2','2026-05-28 19:11:46','2026-05-28 19:11:46'),(7,7,'main-menu','2026-05-28 19:11:46','2026-05-28 19:11:46'),(8,8,'footer-menu-1','2026-05-28 19:11:46','2026-05-28 19:11:46'),(9,9,'footer-menu-2','2026-05-28 19:11:46','2026-05-28 19:11:46'),(10,10,'main-menu','2026-05-28 19:11:46','2026-05-28 19:11:46'),(11,11,'footer-menu-1','2026-05-28 19:11:46','2026-05-28 19:11:46'),(12,12,'footer-menu-2','2026-05-28 19:11:46','2026-05-28 19:11:46'),(13,13,'main-menu','2026-05-28 19:11:46','2026-05-28 19:11:46'),(14,14,'footer-menu-1','2026-05-28 19:11:46','2026-05-28 19:11:46'),(15,15,'footer-menu-2','2026-05-28 19:11:46','2026-05-28 19:11:46'),(16,16,'main-menu','2026-05-28 19:11:46','2026-05-28 19:11:46'),(17,17,'footer-menu-1','2026-05-28 19:11:46','2026-05-28 19:11:46'),(18,18,'footer-menu-2','2026-05-28 19:11:46','2026-05-28 19:11:46');
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
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'https://amerce.botble.com',NULL,0,'Home','has-mega-menu','_self',1,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(2,1,1,NULL,NULL,'https://amerce.botble.com',NULL,0,'Main Demo',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(3,1,1,NULL,NULL,'https://amerce-mental.botble.com',NULL,1,'Home Mental',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(4,1,1,NULL,NULL,'https://amerce-electronics.botble.com',NULL,2,'Home Electronics',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(5,1,1,NULL,NULL,'https://amerce-pod.botble.com',NULL,3,'Home POD',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(6,1,1,NULL,NULL,'https://amerce-pet-care.botble.com',NULL,4,'Home Pet Care',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(7,1,1,NULL,NULL,'https://amerce-baby.botble.com',NULL,5,'Home Baby',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(8,1,1,NULL,NULL,'https://amerce-auto.botble.com',NULL,6,'Home Auto',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(9,1,1,NULL,NULL,'https://amerce-decor.botble.com',NULL,7,'Home Decor',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(10,1,1,NULL,NULL,'https://amerce-cosmetic.botble.com',NULL,8,'Home Cosmetic',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(11,1,1,NULL,NULL,'https://amerce-organic.botble.com',NULL,9,'Home Organic',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(12,1,1,NULL,NULL,'https://amerce-fashion.botble.com',NULL,10,'Home Fashion',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(13,1,1,NULL,NULL,'https://amerce-headphone.botble.com',NULL,11,'Home Headphone',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(14,1,1,NULL,NULL,'https://amerce-jewelry.botble.com',NULL,12,'Home Jewelry',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(15,1,1,NULL,NULL,'https://amerce-garden.botble.com',NULL,13,'Home Garden',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(16,1,1,NULL,NULL,'https://amerce-construct.botble.com',NULL,14,'Home Construct',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(17,1,1,NULL,NULL,'https://amerce-furniture.botble.com',NULL,15,'Home Furniture',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(18,1,1,NULL,NULL,'https://amerce-fashion-2.botble.com',NULL,16,'Home Fashion 2',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(19,1,1,NULL,NULL,'https://amerce-bag.botble.com',NULL,17,'Home Bag',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(20,1,1,NULL,NULL,'https://amerce-sport.botble.com',NULL,18,'Home Sport',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(21,1,1,NULL,NULL,'https://amerce-office.botble.com',NULL,19,'Home Office',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(22,1,1,NULL,NULL,'https://amerce-sneaker.botble.com',NULL,20,'Home Sneaker',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(23,1,0,NULL,NULL,'/products',NULL,1,'Shop','has-mega-menu','_self',1,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(24,1,23,NULL,NULL,'#',NULL,0,'Shop Layout',NULL,'_self',1,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(25,1,24,NULL,NULL,'/products',NULL,0,'Default',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(26,1,24,NULL,NULL,'/products?layout=left-sidebar',NULL,1,'Left Sidebar',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(27,1,24,NULL,NULL,'/products?layout=right-sidebar',NULL,2,'Right Sidebar',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(28,1,24,NULL,NULL,'/products?layout=full-width',NULL,3,'Full Width',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(29,1,24,NULL,NULL,'/products?layout=sub-collection',NULL,4,'Sub Collection',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(30,1,24,NULL,NULL,'/collections',NULL,5,'Collection List',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(31,1,23,NULL,NULL,'#',NULL,1,'View Style',NULL,'_self',1,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(32,1,31,NULL,NULL,'/products',NULL,0,'Default',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(33,1,31,NULL,NULL,'/products?layout=grid',NULL,1,'Grid View',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(34,1,31,NULL,NULL,'/products?layout=list',NULL,2,'List View',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(35,1,23,NULL,NULL,'#',NULL,2,'Browse',NULL,'_self',1,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(36,1,35,NULL,NULL,'/products',NULL,0,'All Products',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(37,1,35,NULL,NULL,'/products?source=latest',NULL,1,'New Arrivals',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(38,1,35,NULL,NULL,'/products?sort=best-seller',NULL,2,'Best Sellers',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(39,1,35,NULL,NULL,'/products?source=featured',NULL,3,'Featured',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(40,1,35,NULL,NULL,'/products?on_sale=1',NULL,4,'On Sale',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(41,1,0,NULL,NULL,'/products',NULL,2,'Product','has-mega-menu','_self',1,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(42,1,41,NULL,NULL,'#',NULL,0,'Product Layout',NULL,'_self',1,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(43,1,42,NULL,NULL,'/products',NULL,0,'Default',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(44,1,42,NULL,NULL,'/products?layout=right-thumbnail',NULL,1,'Right Thumbnail',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(45,1,42,NULL,NULL,'/products?layout=bottom-thumbnail',NULL,2,'Bottom Thumbnail',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(46,1,42,NULL,NULL,'/products?layout=grid',NULL,3,'Product Grid',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(47,1,42,NULL,NULL,'/products?layout=grid-2',NULL,4,'Product Grid 2',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(48,1,42,NULL,NULL,'/products?layout=stacked',NULL,5,'Product Stacked',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(49,1,42,NULL,NULL,'/products?layout=description-accordion',NULL,6,'Description Accordion',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(50,1,0,NULL,NULL,'/blog',NULL,3,'Blog',NULL,'_self',1,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(51,1,50,NULL,NULL,'/blog',NULL,0,'Blog',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(52,1,50,NULL,NULL,'/blog',NULL,1,'Blog Single',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(53,1,0,NULL,NULL,'/about',NULL,4,'Pages',NULL,'_self',1,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(54,1,53,NULL,NULL,'/about',NULL,0,'About Us',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(55,1,53,NULL,NULL,'/contact',NULL,1,'Contact Us',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(56,1,53,NULL,NULL,'/our-stores',NULL,2,'Our Store',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(57,1,53,NULL,NULL,'/orders/tracking',NULL,3,'Invoice',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(58,1,53,NULL,NULL,'/page-not-found',NULL,4,'404',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(59,1,53,NULL,NULL,'/compare',NULL,5,'Compare',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(60,1,53,NULL,NULL,'/customer/overview',NULL,6,'My Account',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(61,2,0,NULL,NULL,'/shipping',NULL,0,'Shipping',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(62,2,0,NULL,NULL,'/returns-refunds',NULL,1,'Return & Refund',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(63,2,0,NULL,NULL,'/privacy-policy',NULL,2,'Privacy Policy',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(64,2,0,NULL,NULL,'/terms-of-service',NULL,3,'Terms & Conditions',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(65,2,0,NULL,NULL,'/faq',NULL,4,'Orders FAQs',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(66,3,0,NULL,NULL,'/about',NULL,0,'About Us',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(67,3,0,NULL,NULL,'/our-stores',NULL,1,'Our Stories',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(68,3,0,NULL,NULL,'/contact',NULL,2,'Contact us',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(69,3,0,NULL,NULL,'/blog',NULL,3,'Latest New',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(70,3,0,NULL,NULL,'/customer/overview',NULL,4,'My Account',NULL,'_self',0,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(71,4,0,NULL,NULL,'/',NULL,0,'Trang chủ',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(72,4,0,NULL,NULL,'/products',NULL,1,'Mua sắm',NULL,'_self',1,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(73,4,72,NULL,NULL,'/products?source=latest',NULL,0,'Hàng mới về',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(74,4,72,NULL,NULL,'/products?sort=best-seller',NULL,1,'Bán chạy nhất',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(75,4,72,NULL,NULL,'/products?on_sale=1',NULL,2,'Giảm giá',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(76,4,72,NULL,NULL,'/products',NULL,3,'Tất cả sản phẩm',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(77,4,0,NULL,NULL,'/products',NULL,2,'Danh mục',NULL,'_self',1,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(78,4,77,NULL,NULL,'/product-categories/outerwear',NULL,0,'Áo khoác',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(79,4,77,NULL,NULL,'/product-categories/tops-shirts',NULL,1,'Áo & Sơ mi',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(80,4,77,NULL,NULL,'/product-categories/bottoms',NULL,2,'Quần & Váy',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(81,4,77,NULL,NULL,'/product-categories/dresses',NULL,3,'Đầm',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(82,4,77,NULL,NULL,'/product-categories/footwear',NULL,4,'Giày dép',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(83,4,77,NULL,NULL,'/product-categories/accessories',NULL,5,'Phụ kiện',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(84,4,0,NULL,NULL,'/brands',NULL,3,'Thương hiệu',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(85,4,0,NULL,NULL,'/blog',NULL,4,'Tạp chí',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(86,4,0,NULL,NULL,'/about',NULL,5,'Giới thiệu',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(87,4,0,NULL,NULL,'/contact',NULL,6,'Liên hệ',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(88,5,0,NULL,NULL,'/contact',NULL,0,'Liên hệ với chúng tôi',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(89,5,0,NULL,NULL,'/faq',NULL,1,'Câu hỏi thường gặp',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(90,5,0,NULL,NULL,'/shipping',NULL,2,'Vận chuyển',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(91,5,0,NULL,NULL,'/returns-refunds',NULL,3,'Đổi trả & Hoàn tiền',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(92,5,0,NULL,NULL,'/customer/orders',NULL,4,'Theo dõi đơn hàng',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(93,6,0,NULL,NULL,'/about',NULL,0,'Giới thiệu',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(94,6,0,NULL,NULL,'/our-stores',NULL,1,'Cửa hàng',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(95,6,0,NULL,NULL,'/sustainability',NULL,2,'Phát triển bền vững',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(96,6,0,NULL,NULL,'/careers',NULL,3,'Tuyển dụng',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(97,6,0,NULL,NULL,'/privacy-policy',NULL,4,'Chính sách bảo mật',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(98,6,0,NULL,NULL,'/terms-conditions',NULL,5,'Điều khoản & Điều kiện',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(99,7,0,NULL,NULL,'/',NULL,0,'الصفحة الرئيسية',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(100,7,0,NULL,NULL,'/products',NULL,1,'التسوق',NULL,'_self',1,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(101,7,100,NULL,NULL,'/products?source=latest',NULL,0,'الوافدون الجدد',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(102,7,100,NULL,NULL,'/products?sort=best-seller',NULL,1,'الأكثر مبيعًا',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(103,7,100,NULL,NULL,'/products?on_sale=1',NULL,2,'تخفيض',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(104,7,100,NULL,NULL,'/products',NULL,3,'جميع المنتجات',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(105,7,0,NULL,NULL,'/products',NULL,2,'فئة',NULL,'_self',1,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(106,7,105,NULL,NULL,'/product-categories/outerwear',NULL,0,'سترة',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(107,7,105,NULL,NULL,'/product-categories/tops-shirts',NULL,1,'قميص',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(108,7,105,NULL,NULL,'/product-categories/bottoms',NULL,2,'السراويل والتنانير',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(109,7,105,NULL,NULL,'/product-categories/dresses',NULL,3,'فستان',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(110,7,105,NULL,NULL,'/product-categories/footwear',NULL,4,'أحذية',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(111,7,105,NULL,NULL,'/product-categories/accessories',NULL,5,'ملحق',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(112,7,0,NULL,NULL,'/brands',NULL,3,'علامة تجارية',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(113,7,0,NULL,NULL,'/blog',NULL,4,'مجلة',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(114,7,0,NULL,NULL,'/about',NULL,5,'يقدم',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(115,7,0,NULL,NULL,'/contact',NULL,6,'اتصال',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(116,8,0,NULL,NULL,'/contact',NULL,0,'اتصل بنا',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(117,8,0,NULL,NULL,'/faq',NULL,1,'الأسئلة المتداولة',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(118,8,0,NULL,NULL,'/shipping',NULL,2,'ينقل',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(119,8,0,NULL,NULL,'/returns-refunds',NULL,3,'العوائد والمبالغ المستردة',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(120,8,0,NULL,NULL,'/customer/orders',NULL,4,'تتبع الطلب',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(121,9,0,NULL,NULL,'/about',NULL,0,'يقدم',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(122,9,0,NULL,NULL,'/our-stores',NULL,1,'محل',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(123,9,0,NULL,NULL,'/sustainability',NULL,2,'التنمية المستدامة',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(124,9,0,NULL,NULL,'/careers',NULL,3,'توظيف',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(125,9,0,NULL,NULL,'/privacy-policy',NULL,4,'سياسة الخصوصية',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(126,9,0,NULL,NULL,'/terms-conditions',NULL,5,'الشروط والأحكام',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(127,10,0,NULL,NULL,'/',NULL,0,'Page d\'accueil',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(128,10,0,NULL,NULL,'/products',NULL,1,'Achats',NULL,'_self',1,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(129,10,128,NULL,NULL,'/products?source=latest',NULL,0,'Nouveautés',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(130,10,128,NULL,NULL,'/products?sort=best-seller',NULL,1,'Meilleur vendeur',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(131,10,128,NULL,NULL,'/products?on_sale=1',NULL,2,'Rabais',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(132,10,128,NULL,NULL,'/products',NULL,3,'Tous les produits',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(133,10,0,NULL,NULL,'/products',NULL,2,'Catégorie',NULL,'_self',1,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(134,10,133,NULL,NULL,'/product-categories/outerwear',NULL,0,'Veste',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(135,10,133,NULL,NULL,'/product-categories/tops-shirts',NULL,1,'Chemise',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(136,10,133,NULL,NULL,'/product-categories/bottoms',NULL,2,'Pantalons et jupes',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(137,10,133,NULL,NULL,'/product-categories/dresses',NULL,3,'Robe',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(138,10,133,NULL,NULL,'/product-categories/footwear',NULL,4,'Chaussures',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(139,10,133,NULL,NULL,'/product-categories/accessories',NULL,5,'Accessoire',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(140,10,0,NULL,NULL,'/brands',NULL,3,'Marque déposée',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(141,10,0,NULL,NULL,'/blog',NULL,4,'Revue',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(142,10,0,NULL,NULL,'/about',NULL,5,'Introduire',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(143,10,0,NULL,NULL,'/contact',NULL,6,'Contact',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(144,11,0,NULL,NULL,'/contact',NULL,0,'Contactez-nous',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(145,11,0,NULL,NULL,'/faq',NULL,1,'Questions fréquemment posées',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(146,11,0,NULL,NULL,'/shipping',NULL,2,'Transport',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(147,11,0,NULL,NULL,'/returns-refunds',NULL,3,'Retours et remboursements',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(148,11,0,NULL,NULL,'/customer/orders',NULL,4,'Suivi des commandes',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(149,12,0,NULL,NULL,'/about',NULL,0,'Introduire',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(150,12,0,NULL,NULL,'/our-stores',NULL,1,'Boutique',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(151,12,0,NULL,NULL,'/sustainability',NULL,2,'Développement durable',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(152,12,0,NULL,NULL,'/careers',NULL,3,'Recrutement',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(153,12,0,NULL,NULL,'/privacy-policy',NULL,4,'Politique de confidentialité',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(154,12,0,NULL,NULL,'/terms-conditions',NULL,5,'Conditions générales',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(155,13,0,NULL,NULL,'/',NULL,0,'Halaman rumah',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(156,13,0,NULL,NULL,'/products',NULL,1,'Belanja',NULL,'_self',1,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(157,13,156,NULL,NULL,'/products?source=latest',NULL,0,'Pendatang baru',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(158,13,156,NULL,NULL,'/products?sort=best-seller',NULL,1,'Penjual terbaik',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(159,13,156,NULL,NULL,'/products?on_sale=1',NULL,2,'Diskon',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(160,13,156,NULL,NULL,'/products',NULL,3,'Semua produk',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(161,13,0,NULL,NULL,'/products',NULL,2,'Kategori',NULL,'_self',1,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(162,13,161,NULL,NULL,'/product-categories/outerwear',NULL,0,'Jaket',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(163,13,161,NULL,NULL,'/product-categories/tops-shirts',NULL,1,'Kemeja',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(164,13,161,NULL,NULL,'/product-categories/bottoms',NULL,2,'Celana & Rok',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(165,13,161,NULL,NULL,'/product-categories/dresses',NULL,3,'Gaun',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(166,13,161,NULL,NULL,'/product-categories/footwear',NULL,4,'Sepatu',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(167,13,161,NULL,NULL,'/product-categories/accessories',NULL,5,'Aksesori',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(168,13,0,NULL,NULL,'/brands',NULL,3,'Merek dagang',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(169,13,0,NULL,NULL,'/blog',NULL,4,'Majalah',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(170,13,0,NULL,NULL,'/about',NULL,5,'Memperkenalkan',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(171,13,0,NULL,NULL,'/contact',NULL,6,'Kontak',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(172,14,0,NULL,NULL,'/contact',NULL,0,'Hubungi kami',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(173,14,0,NULL,NULL,'/faq',NULL,1,'Pertanyaan yang sering diajukan',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(174,14,0,NULL,NULL,'/shipping',NULL,2,'Mengangkut',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(175,14,0,NULL,NULL,'/returns-refunds',NULL,3,'Pengembalian & Pengembalian Dana',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(176,14,0,NULL,NULL,'/customer/orders',NULL,4,'Pelacakan pesanan',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(177,15,0,NULL,NULL,'/about',NULL,0,'Memperkenalkan',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(178,15,0,NULL,NULL,'/our-stores',NULL,1,'Toko',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(179,15,0,NULL,NULL,'/sustainability',NULL,2,'Pembangunan berkelanjutan',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(180,15,0,NULL,NULL,'/careers',NULL,3,'Rekrutmen',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(181,15,0,NULL,NULL,'/privacy-policy',NULL,4,'Kebijakan privasi',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(182,15,0,NULL,NULL,'/terms-conditions',NULL,5,'Syarat & Ketentuan',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(183,16,0,NULL,NULL,'/',NULL,0,'Ana sayfa',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(184,16,0,NULL,NULL,'/products',NULL,1,'Alışveriş',NULL,'_self',1,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(185,16,184,NULL,NULL,'/products?source=latest',NULL,0,'Yeni gelenler',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(186,16,184,NULL,NULL,'/products?sort=best-seller',NULL,1,'En çok satan kitap',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(187,16,184,NULL,NULL,'/products?on_sale=1',NULL,2,'İndirim',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(188,16,184,NULL,NULL,'/products',NULL,3,'Tüm ürünler',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(189,16,0,NULL,NULL,'/products',NULL,2,'Kategori',NULL,'_self',1,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(190,16,189,NULL,NULL,'/product-categories/outerwear',NULL,0,'Ceket',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(191,16,189,NULL,NULL,'/product-categories/tops-shirts',NULL,1,'Gömlek',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(192,16,189,NULL,NULL,'/product-categories/bottoms',NULL,2,'Pantolon ve Etekler',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(193,16,189,NULL,NULL,'/product-categories/dresses',NULL,3,'Elbise',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(194,16,189,NULL,NULL,'/product-categories/footwear',NULL,4,'Ayakkabı',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(195,16,189,NULL,NULL,'/product-categories/accessories',NULL,5,'Aksesuar',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(196,16,0,NULL,NULL,'/brands',NULL,3,'Ticari marka',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(197,16,0,NULL,NULL,'/blog',NULL,4,'Dergi',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(198,16,0,NULL,NULL,'/about',NULL,5,'Tanıtmak',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(199,16,0,NULL,NULL,'/contact',NULL,6,'Temas etmek',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(200,17,0,NULL,NULL,'/contact',NULL,0,'Bize Ulaşın',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(201,17,0,NULL,NULL,'/faq',NULL,1,'Sık sorulan sorular',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(202,17,0,NULL,NULL,'/shipping',NULL,2,'Taşıma',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(203,17,0,NULL,NULL,'/returns-refunds',NULL,3,'İade ve Para İadeleri',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(204,17,0,NULL,NULL,'/customer/orders',NULL,4,'Sipariş takibi',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(205,18,0,NULL,NULL,'/about',NULL,0,'Tanıtmak',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(206,18,0,NULL,NULL,'/our-stores',NULL,1,'Mağaza',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(207,18,0,NULL,NULL,'/sustainability',NULL,2,'Sürdürülebilir kalkınma',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(208,18,0,NULL,NULL,'/careers',NULL,3,'işe alım',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(209,18,0,NULL,NULL,'/privacy-policy',NULL,4,'Gizlilik politikası',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46'),(210,18,0,NULL,NULL,'/terms-conditions',NULL,5,'Şartlar ve Koşullar',NULL,'_self',0,'2026-05-28 19:11:46','2026-05-28 19:11:46');
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
INSERT INTO `menus` VALUES (1,'Main Menu','main-menu','published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(2,'Footer Help','footer-help','published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(3,'Footer Company','footer-company','published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(4,'Menu chính','main-menu-vi','published','2026-05-28 19:11:46','2026-05-28 19:11:46'),(5,'Hỗ trợ','footer-help-vi','published','2026-05-28 19:11:46','2026-05-28 19:11:46'),(6,'Công ty','footer-company-vi','published','2026-05-28 19:11:46','2026-05-28 19:11:46'),(7,'القائمة الرئيسية','main-menu-ar','published','2026-05-28 19:11:46','2026-05-28 19:11:46'),(8,'مساعدة التذييل','footer-help-ar','published','2026-05-28 19:11:46','2026-05-28 19:11:46'),(9,'شركة التذييل','footer-company-ar','published','2026-05-28 19:11:46','2026-05-28 19:11:46'),(10,'menu principal','main-menu-fr','published','2026-05-28 19:11:46','2026-05-28 19:11:46'),(11,'aide-pied de page','footer-help-fr','published','2026-05-28 19:11:46','2026-05-28 19:11:46'),(12,'société de pied de page','footer-company-fr','published','2026-05-28 19:11:46','2026-05-28 19:11:46'),(13,'menu utama','main-menu-id','published','2026-05-28 19:11:46','2026-05-28 19:11:46'),(14,'bantuan footer','footer-help-id','published','2026-05-28 19:11:46','2026-05-28 19:11:46'),(15,'perusahaan footer','footer-company-id','published','2026-05-28 19:11:46','2026-05-28 19:11:46'),(16,'ana menü','main-menu-tr','published','2026-05-28 19:11:46','2026-05-28 19:11:46'),(17,'alt bilgi yardımı','footer-help-tr','published','2026-05-28 19:11:46','2026-05-28 19:11:46'),(18,'alt bilgi şirketi','footer-company-tr','published','2026-05-28 19:11:46','2026-05-28 19:11:46');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'subtitle','[\"Elevate Your Game Today\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 19:11:13','2026-05-28 19:11:13'),(2,'button_label','[\"Shop Styles\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 19:11:13','2026-05-28 19:11:13'),(3,'alignment','[\"center\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 19:11:13','2026-05-28 19:11:13'),(4,'subtitle','[\"Move with Confidence\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 19:11:13','2026-05-28 19:11:13'),(5,'button_label','[\"Shop Styles\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 19:11:13','2026-05-28 19:11:13'),(6,'alignment','[\"center\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 19:11:13','2026-05-28 19:11:13'),(7,'subtitle','[\"Built for Motion\"]',3,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 19:11:13','2026-05-28 19:11:13'),(8,'button_label','[\"Shop Styles\"]',3,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 19:11:13','2026-05-28 19:11:13'),(9,'alignment','[\"center\"]',3,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2026-05-28 19:11:13','2026-05-28 19:11:13'),(10,'faq_ids','[[3,4,7,9,11]]',1,'Botble\\Ecommerce\\Models\\Product','2026-05-28 19:11:24','2026-05-28 19:11:24'),(11,'faq_ids','[[6,8,9,10,11]]',2,'Botble\\Ecommerce\\Models\\Product','2026-05-28 19:11:24','2026-05-28 19:11:24'),(12,'faq_ids','[[1,3,7,12,13]]',3,'Botble\\Ecommerce\\Models\\Product','2026-05-28 19:11:24','2026-05-28 19:11:24'),(13,'faq_ids','[[2,8,9,10,11]]',4,'Botble\\Ecommerce\\Models\\Product','2026-05-28 19:11:24','2026-05-28 19:11:24'),(14,'faq_ids','[[2,5,6,12,13]]',5,'Botble\\Ecommerce\\Models\\Product','2026-05-28 19:11:25','2026-05-28 19:11:25'),(15,'faq_ids','[[3,4,5,9,10]]',6,'Botble\\Ecommerce\\Models\\Product','2026-05-28 19:11:25','2026-05-28 19:11:25'),(16,'faq_ids','[[3,6,7,10,11]]',7,'Botble\\Ecommerce\\Models\\Product','2026-05-28 19:11:25','2026-05-28 19:11:25'),(17,'faq_ids','[[2,3,7,8,13]]',8,'Botble\\Ecommerce\\Models\\Product','2026-05-28 19:11:25','2026-05-28 19:11:25'),(18,'faq_ids','[[5,9,10,12,13]]',9,'Botble\\Ecommerce\\Models\\Product','2026-05-28 19:11:26','2026-05-28 19:11:26'),(19,'faq_ids','[[4,5,6,9,11]]',10,'Botble\\Ecommerce\\Models\\Product','2026-05-28 19:11:26','2026-05-28 19:11:26');
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
INSERT INTO `mp_stores` VALUES (1,'Anthro Studio','hello@anthro.example.com','+1-415-555-0142','512 Valencia Street','US','California','San Francisco',2,'testimonials/avatar-1.jpg',NULL,NULL,'Eclectic apparel and home goods inspired by global craftsmanship traditions.','<p>Anthro Studio sources from independent artisans across four continents. Every piece is checked by hand before it ships from our San Francisco fulfilment center.</p>','published',1,NULL,NULL,NULL,NULL,'2026-05-28 19:11:39','2026-05-28 19:11:39','94110','Anthro Studio Inc.',NULL,NULL,NULL,NULL,NULL),(2,'Crate Furniture Co.','orders@crate.example.com','+1-503-555-0188','1840 NE Alberta Street','US','Oregon','Portland',4,'testimonials/avatar-2.jpg',NULL,NULL,'Mid-century-inspired furniture built to last generations.','<p>Every Crate piece is built one at a time in our Portland workshop using sustainably harvested American hardwoods.</p>','published',1,NULL,NULL,NULL,NULL,'2026-05-28 19:11:39','2026-05-28 19:11:39','97211','Crate Furniture Co.',NULL,NULL,NULL,NULL,NULL),(3,'Findr Audio','support@findr.example.com','+44-20-7946-0310','17 Hanbury Street','GB','Greater London','London',9,'testimonials/avatar-3.jpg',NULL,NULL,'Audio gear engineered for studio-grade clarity in everyday environments.','<p>Founded by ex-studio engineers, Findr brings reference-quality sound to wireless headphones and earbuds.</p>','published',1,NULL,NULL,NULL,NULL,'2026-05-28 19:11:39','2026-05-28 19:11:39','E1 6QR','Findr Audio Ltd.',NULL,NULL,NULL,NULL,NULL),(4,'Bohome Living','hello@bohome.example.com','+34-93-555-0122','Carrer de Sepulveda 102','ES','Catalonia','Barcelona',8,'testimonials/avatar-4.jpg',NULL,NULL,'Bohemian-inspired homewares and textiles for the relaxed modern home.','<p>Bohome partners with co-operatives in Morocco, Turkey, and India to bring you authentic, fair-traded textiles.</p>','published',1,NULL,NULL,NULL,NULL,'2026-05-28 19:11:39','2026-05-28 19:11:39','08015','Bohome Living S.L.',NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `pages` VALUES (1,'About','[page-banner heading=\"About Us\" subtitle=\"With over 15 years of experience, we craft timeless collections that transcend<br class=\\\"d-none d-lg-block\\\">trends and inspire lasting elegance.\"][/page-banner]\n[stats-counter hero_image=\"section/s-contact-1.jpg\" heading=\"Design, attention to detail & efficiency to delight the world\" description=\"From the moment it is conceived to the moment it is worn, every one of our garments follows this path. We could do it at a fast pace. However, at Amerce, we choose to take care of all those who are walking this path with us.\" quantity=\"4\" value_1=\"8.2k\" animate_to_1=\"\" suffix_1=\"\" label_1=\"Products Available\" desc_1=\"We offer a wide selection of high-quality products to meet every need.\" value_2=\"\" animate_to_2=\"10\" suffix_2=\"k\" label_2=\"Happy Customers\" desc_2=\"Serving over 10,000 delighted customers who trust us for quality and service.\" value_3=\"\" animate_to_3=\"96\" suffix_3=\"\" label_3=\"Partner Brand\" desc_3=\"Our top-brand partnerships bring a trusted collection for your store and home.\" value_4=\"\" animate_to_4=\"16\" suffix_4=\"k\" label_4=\"Products For Sale\" desc_4=\"That\'s why we strive to offer a diverse range of products that cater to all styles.\"][/stats-counter]\n[image-accordion image=\"section/s-contact-2.jpg\" heading=\"Offering Rare And Beautiful Items Worldwide\" quantity=\"4\" title_1=\"Introduction\" body_1=\"Welcome to Amerce Store, your premier destination for fashion-forward clothing and accessories. We pride ourselves on offering a curated selection of rare and beautiful items sourced both locally and globally.\" title_2=\"Our Vision\" body_2=\"We envision a world where thoughtful design meets everyday life — pieces that age gracefully, partners we trust, and customers we treat as people, not transactions.\" title_3=\"What Sets Us Apart\" body_3=\"Independently audited suppliers, hand-checked products, and a 30-day no-questions return policy backed by a human customer support team.\" title_4=\"Our Commitment\" body_4=\"Quality goods, transparent supply chains, and fair labor — every order, every time.\"][/image-accordion]\n[about-testimonials heading=\"Customer Say!\" subtitle=\"Our customers adore our products, and we constantly aim to delight them.\" quantity=\"2\" image_1=\"testimonials/tes-1.jpg\" name_1=\"Emma Collins\" text_1=\"\\\"Totally obsessed with this outfit! The fit is perfect, the fabric feels premium, and I\'ve been getting compliments non-stop. It instantly lifts my confidence — such a great find!\\\"\" image_2=\"testimonials/tes-2.jpg\" name_2=\"Sophia Ramirez\" text_2=\"\\\"I\'m amazed by how comfortable yet stylish this piece is. It pairs effortlessly with everything, and the quality really stands out. Definitely becoming my go-to for everyday looks!\\\"\"][/about-testimonials]\n[about-team heading=\"Meet Our Teams\" subtitle=\"Experts committed to excellence in every detail.\" quantity=\"4\" image_1=\"member/member-1.jpg\" name_1=\"Annette Black\" role_1=\"Founder/CEO\" social_links_1=\"\" image_2=\"member/member-2.jpg\" name_2=\"Brooklyn Simmons\" role_2=\"Manager\" social_links_2=\"\" image_3=\"member/member-3.jpg\" name_3=\"Jane Cooper\" role_3=\"Sales Director\" social_links_3=\"\" image_4=\"member/member-4.jpg\" name_4=\"Lisa Bonet\" role_4=\"Sales Director\" social_links_4=\"\"][/about-team]',1,NULL,'landing','About Amerce — our story, sourcing standards, and the people behind every product.','published','2026-05-28 19:11:40','2026-05-28 19:11:40'),(2,'Contact','',1,NULL,'landing','Reach the Amerce customer support and partnerships teams.','published','2026-05-28 19:11:40','2026-05-28 19:11:40'),(3,'FAQ','[page-banner heading=\"FAQs\" subtitle=\"Got questions? We\'ve got answers! Browse our FAQs to find information on orders, shipping,<br class=\\\"d-none d-lg-block\\\">returns, and more. If you need further assistance, feel free to contact our team.\"][/page-banner]\n[faq-page sidebar_image=\"section/banner-12.jpg\" sidebar_title=\"Save 25% <br class=\\\"d-none d-sm-block\\\">Today\" sidebar_subtitle=\"T-Shirts, Hoodies & More\" sidebar_cta=\"View More\" sidebar_url=\"/products\" quantity=\"16\" category_1=\"My Account\" category_id_1=\"myAccount\" question_1=\"1. What can I do if I forgot my password?\" answer_1=\"Use the \\\"Forgot password\\\" link on the sign-in page. We will email you a one-time link to set a new password — it expires in 30 minutes for security.\" category_2=\"My Account\" category_id_2=\"myAccount\" question_2=\"2. How do I update my email address?\" answer_2=\"Sign in, open Account → Settings, and change the email field. We send a confirmation email to the new address; the change takes effect once you click that link.\" category_3=\"My Account\" category_id_3=\"myAccount\" question_3=\"3. Can I delete my account?\" answer_3=\"Yes. From Account → Settings, scroll to Delete account. We retain order history for tax/legal reasons but personal contact details are removed within 30 days.\" category_4=\"Orders & Purchases\" category_id_4=\"ordersPurchases\" question_4=\"1. How do I place an order?\" answer_4=\"Add items to your cart, click checkout, choose a shipping method, then enter your payment details. You will receive an order confirmation email immediately.\" category_5=\"Orders & Purchases\" category_id_5=\"ordersPurchases\" question_5=\"2. Can I edit or cancel an order?\" answer_5=\"Orders can be edited or cancelled from your account dashboard within 1 hour of placement. After that the warehouse has begun picking and we cannot intercept.\" category_6=\"Orders & Purchases\" category_id_6=\"ordersPurchases\" question_6=\"3. What payment methods are accepted?\" answer_6=\"We accept Visa, Mastercard, American Express, Apple Pay, Google Pay, and PayPal. All transactions use TLS 1.3 encryption.\" category_7=\"Returns & Refunds\" category_id_7=\"returnsRefunds\" question_7=\"1. What is the return window?\" answer_7=\"30 days from delivery for any unworn item in original condition. Sale items, intimate apparel, and final-sale flash sale purchases are excluded.\" category_8=\"Returns & Refunds\" category_id_8=\"returnsRefunds\" question_8=\"2. How do I start a return?\" answer_8=\"Open the order in your account dashboard and click \\\"Start return\\\". We email a prepaid label for domestic orders within one business day.\" category_9=\"Returns & Refunds\" category_id_9=\"returnsRefunds\" question_9=\"3. When will I see my refund?\" answer_9=\"Refunds are processed within 3-5 business days of us receiving the return. Bank posting times vary; allow up to 10 business days for the credit to appear.\" category_10=\"Shipping & Tracking\" category_id_10=\"shippingTracking\" question_10=\"1. How long does shipping take?\" answer_10=\"Domestic standard ships in 3-5 business days. Express in 1-2. International standard takes 7-12 business days; express options are available at checkout.\" category_11=\"Shipping & Tracking\" category_id_11=\"shippingTracking\" question_11=\"2. How do I track my order?\" answer_11=\"A tracking link is included in your shipment confirmation email. You can also see status from Account → Orders → Track.\" category_12=\"Shipping & Tracking\" category_id_12=\"shippingTracking\" question_12=\"3. Do you ship internationally?\" answer_12=\"Yes — to most countries. Duties and taxes are pre-paid at checkout for select destinations; otherwise the courier may collect them on delivery.\" category_13=\"Fees & Billing\" category_id_13=\"feesBilling\" question_13=\"1. Are duties and taxes included?\" answer_13=\"Domestic prices include sales tax shown at checkout. International orders to supported destinations include duties and taxes; otherwise the courier collects on delivery.\" category_14=\"Fees & Billing\" category_id_14=\"feesBilling\" question_14=\"2. Why was I charged twice?\" answer_14=\"You likely see a temporary authorization hold plus the actual charge. The authorization drops off in 3-5 business days. Email billing@amerce.test if you still see two charges after that.\" category_15=\"Other Topic\" category_id_15=\"otherTopic\" question_15=\"1. Do you have physical stores?\" answer_15=\"Yes — visit our Stores page for a list of flagship and partner locations.\" category_16=\"Other Topic\" category_id_16=\"otherTopic\" question_16=\"2. How can I contact customer support?\" answer_16=\"Email hello@amerce.test or use the contact form. We reply within one business day.\"][/faq-page]',1,NULL,'landing','Frequently asked questions about orders, shipping, returns, and account management.','published','2026-05-28 19:11:40','2026-05-28 19:11:40'),(4,'Privacy Policy','[page-banner heading=\"Privacy Policy\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Information We Collect\" body_1=\"<p class=\\\"term-text cl-text-2\\\">When you visit the Site, we automatically collect certain information about your device — web browser, IP address, time zone, and some of the cookies installed on your device. As you browse, we also collect data about the pages or products you view, what referred you to the Site, and how you interact with it. We refer to this as \\\"Device Information\\\".</p><p class=\\\"term-text cl-text-2\\\">When you make a purchase or attempt to purchase through the Site, we collect your name, billing address, shipping address, and payment information (including card number, email address, and phone number). We refer to this as \\\"Order Information\\\".</p>\" title_2=\"2. How We Use Your Information\" body_2=\"<p class=\\\"term-text cl-text-2\\\">We use Order Information to fulfil orders placed through the Site (process payment, arrange shipping, provide invoices and order confirmations). We use it to communicate with you, screen orders for fraud, and — in line with your preferences — share marketing about products you may like.</p><p class=\\\"term-text cl-text-2\\\">We use Device Information to screen for fraud and to improve the Site through analytics about how customers browse and interact with us.</p>\" title_3=\"3. Sharing Your Personal Information\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We share Personal Information with third-party service providers who help us run the Site. We may also share information to comply with applicable laws, respond to a subpoena or lawful request, or otherwise protect our rights.</p>\" title_4=\"4. Data Retention\" body_4=\"<p class=\\\"term-text cl-text-2\\\">When you place an order, we maintain the Order Information for our records unless and until you ask us to delete it.</p>\" title_5=\"5. Your Rights\" body_5=\"<p class=\\\"term-text cl-text-2\\\">You can request access, correction, or deletion of any personal data we hold about you. Email privacy@amerce.test from the address on file and we will respond within 30 days.</p>\" title_6=\"6. Cookies\" body_6=\"<p class=\\\"term-text cl-text-2\\\">Cookies are used to keep your cart between visits, remember your preferences, and measure aggregate traffic. You can disable cookies in your browser, though some Site features may stop working.</p>\" title_7=\"7. Changes\" body_7=\"<p class=\\\"term-text cl-text-2\\\">We may update this policy from time to time to reflect changes to our practices or for operational, legal, or regulatory reasons. The latest version will always be on this page.</p>\"][/term-content]',1,NULL,'landing','How Amerce collects, uses, and protects your personal information.','published','2026-05-28 19:11:40','2026-05-28 19:11:40'),(5,'Terms &amp; Conditions','[page-banner heading=\"Terms & Conditions\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Acceptance of Terms\" body_1=\"<p class=\\\"term-text cl-text-2\\\">By accessing or using the Amerce store you agree to these terms. We reserve the right to update them with reasonable notice; the latest version is always available on this page.</p>\" title_2=\"2. Orders & Payment\" body_2=\"<p class=\\\"term-text cl-text-2\\\">All prices are in USD unless otherwise stated. We accept the payment methods displayed at checkout. An order becomes binding once you receive an order confirmation email.</p>\" title_3=\"3. Shipping\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Shipping options, lead times, and rates are listed on our Shipping page. Risk passes to you on delivery.</p>\" title_4=\"4. Returns\" body_4=\"<p class=\\\"term-text cl-text-2\\\">You have 30 days from delivery to return any unworn item for a refund. See our Returns &amp; Refunds page for the full process.</p>\" title_5=\"5. Intellectual Property\" body_5=\"<p class=\\\"term-text cl-text-2\\\">All content on the Site — text, photography, logos, code — is owned by Amerce or its licensors and may not be reproduced without written permission.</p>\" title_6=\"6. Limitation of Liability\" body_6=\"<p class=\\\"term-text cl-text-2\\\">To the maximum extent permitted by law, Amerce is not liable for indirect or consequential damages arising from use of the Site or the products purchased through it.</p>\" title_7=\"7. Governing Law\" body_7=\"<p class=\\\"term-text cl-text-2\\\">These terms are governed by the laws of the State of New York. Any dispute will be resolved in the state or federal courts located in New York County.</p>\"][/term-content]',1,NULL,'landing','The legal terms governing your use of the Amerce store.','published','2026-05-28 19:11:40','2026-05-28 19:11:40'),(6,'Returns &amp; Refunds','[page-banner heading=\"Returns & Refunds\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Returns\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We want you to be completely satisfied with your purchase. If for any reason you are not, you may return any unworn item within 30 days of receiving your order for a refund or exchange. Items must be in original packaging and the same condition as you received them.</p>\" title_2=\"2. How to Start a Return\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Open the order in your account dashboard and click \\\"Start return\\\", or email returns@amerce.test with your order number. We will send a prepaid return label for domestic orders within one business day.</p>\" title_3=\"3. Refunds\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Refunds are processed within 3-5 business days of us receiving the return and applied to the original payment method. Bank posting times vary; allow up to 10 business days for the credit to appear.</p>\" title_4=\"4. Exclusions\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Sale items, intimate apparel, and final-sale flash sale purchases are excluded from returns. Personalised or made-to-order items are also non-returnable unless faulty.</p>\" title_5=\"5. Damaged or Faulty Items\" body_5=\"<p class=\\\"term-text cl-text-2\\\">If your order arrives damaged or faulty, email us within 7 days with photos. We will replace the item or issue a full refund — including any return shipping cost — at our expense.</p>\" title_6=\"6. International Returns\" body_6=\"<p class=\\\"term-text cl-text-2\\\">International customers are responsible for return shipping unless the item is faulty. We do not refund original shipping or duty charges on international returns.</p>\"][/term-content]',1,NULL,'landing','Our 30-day return policy and the step-by-step return process.','published','2026-05-28 19:11:40','2026-05-28 19:11:40'),(7,'Shipping','[page-banner heading=\"Shipping\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Shipping Methods\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We offer the following shipping methods for domestic and international orders: standard ground, expedited 2-day, and priority overnight (where available).</p>\" title_2=\"2. Domestic Rates\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Standard ground is free on orders over $99. Express 1-2 day shipping is $19.99 flat. Priority overnight is calculated by weight at checkout.</p>\" title_3=\"3. International\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We ship to most countries. International standard shipping is $24.99 with 7-12 business day delivery. Express options appear at checkout. Duties and taxes are pre-paid for select destinations; otherwise the courier collects them on delivery.</p>\" title_4=\"4. Processing Time\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Orders placed before 2pm EST on business days ship the same day. Orders placed after 2pm or on weekends/holidays ship the next business day.</p>\" title_5=\"5. Tracking\" body_5=\"<p class=\\\"term-text cl-text-2\\\">A tracking link is included in your shipment confirmation email. You can also see live status from Account → Orders → Track.</p>\" title_6=\"6. Lost or Stuck Shipments\" body_6=\"<p class=\\\"term-text cl-text-2\\\">If a tracking number has not updated for more than 7 business days, email shipping@amerce.test. We will open an investigation with the carrier and either refund or reship the order at our expense.</p>\"][/term-content]',1,NULL,'landing','Domestic and international shipping options, lead times, and rates.','published','2026-05-28 19:11:40','2026-05-28 19:11:40'),(8,'Our Stores','',1,NULL,'landing','Visit Amerce in person — flagship locations and partner boutiques worldwide.','published','2026-05-28 19:11:40','2026-05-28 19:11:40'),(9,'Blog','<div class=\"container py-5\"><h1>Journal</h1><p>Browse our latest stories — style guides, product spotlights, sustainability deep-dives, and more.</p></div>',1,NULL,'default','Style guides, product spotlights, and stories from the Amerce team.','published','2026-05-28 19:11:40','2026-05-28 19:11:40'),(10,'Careers','<div class=\"container py-5\"><h1>Careers at Amerce</h1><p>We are a small, distributed team building a more thoughtful kind of retail. We hire across product, engineering, supply chain, and customer experience.</p><p>Open roles are posted to our company LinkedIn page. To apply, send a short note and your resume to <a href=\"mailto:careers@amerce.test\">careers@amerce.test</a>.</p></div>',1,NULL,'default','Open roles and what it is like to work at Amerce.','published','2026-05-28 19:11:40','2026-05-28 19:11:40'),(11,'Sustainability','<div class=\"container py-5\"><h1>Sustainability at Amerce</h1><p>Every product carries a story. We work directly with mills and ateliers, prioritise recycled and traceable materials, and ship in plastic-free packaging.</p><p>Our 2026 goal: 90% of materials with a verified chain of custody, and a transparent annual impact report.</p></div>',1,NULL,'default','How Amerce sources responsibly and reduces its environmental footprint.','published','2026-05-28 19:11:40','2026-05-28 19:11:40'),(12,'Homepage','[hero-grid-asymmetric hero_image=\"section/banner-59.jpg\" hero_title=\"Pickleball: Your &lt;br&gt;Next Obsession.\" hero_desc=\"Up to 50% Off Accessories\" hero_button_text=\"Shop Now\" hero_button_url=\"/products\" card_1_image=\"section/banner-60.jpg\" card_1_title=\"Precision Gear &lt;br&gt;Ultimate Game\" card_1_desc=\"Up to 50% Off Bestsellers\" card_1_button_text=\"Shop Now\" card_1_button_url=\"/products\" card_2_image=\"section/banner-61.jpg\" card_2_title=\"Peak Performance &lt;br&gt;Ultimate Style\" card_2_desc=\"Up to 50% Off Bestsellers\" card_2_button_text=\"Shop Now\" card_2_button_url=\"/products\"][/hero-grid-asymmetric]\n[site-features style=\"style-1\" compact=\"yes\" quantity=\"4\" icon_class_1=\"icon-ArrowUDownLeft\" title_1=\"14-Day Returns\" description_1=\"Risk-free shopping with easy returns.\" icon_class_2=\"icon-Package\" title_2=\"Free Shipping\" description_2=\"No extra costs, just the price you see.\" icon_class_3=\"icon-Headset\" title_3=\"24/7 Support\" description_3=\"24/7 support, always here just for you.\" icon_class_4=\"icon-SealPercent\" title_4=\"Member Discounts\" description_4=\"Special prices for our loyal customers.\"][/site-features]\n[ecommerce-products style=\"style-slider\" title=\"Performance Starts Here\" subtitle=\"Premium sports gear crafted for durability, comfort, and results.\" source=\"best-seller\" limit=\"8\" items_per_row=\"4\" grid_rows=\"2\" card_style=\"style-1\" product_wrapper_class=\"square\" pagination=\"2\" pagination_sm=\"2\" pagination_md=\"3\" pagination_lg=\"4\"][/ecommerce-products]\n[ecommerce-collections style=\"style-slider-overlay\" collection_ids=\"4,5,6\" limit=\"3\"][/ecommerce-collections]\n[tab-product-showcase title=\"Burn On Your Feet\" subtitle=\"Speed comfort endurance balance.\" view_all_url=\"/products\" view_all_text=\"View More\" tab_1_label=\"XT8 Running Shoes\" tab_1_image=\"section/sport-tab-1.jpg\" tab_1_product_id=\"1\" tab_2_label=\"Cushion 500 Running Shoes\" tab_2_image=\"section/sport-tab-2.jpg\" tab_2_product_id=\"1\" tab_3_label=\"Ekiden One Running Shoes\" tab_3_image=\"section/sport-tab-3.jpg\" tab_3_product_id=\"1\" tab_4_label=\"JF190.1 Running Shoes\" tab_4_image=\"section/sport-tab-4.jpg\" tab_4_product_id=\"1\"][/tab-product-showcase]\n[brand-logos style=\"style-infinite\" modifier_class=\"syle-3\" limit=\"6\"][/brand-logos]\n[lookbook-hotspot style=\"style-v3\" wide=\"yes\" image=\"lookbook/look-10.jpg\" image_2=\"lookbook/look-11.jpg\" quantity=\"2\" x_percent_1=\"39.5\" y_percent_1=\"27.2\" product_id_1=\"7\" column_1=\"1\" x_percent_2=\"34.5\" y_percent_2=\"48.2\" product_id_2=\"2\" column_2=\"2\"][/lookbook-hotspot]\n[product-feature-zoom style=\"style-3-pdp\" product_id=\"4\" detail_tag=\"Racquet Sports\" reviews_count=\"134\" urgency_text=\"18 sold in last 32 hours\" viewing_count=\"28\"][/product-feature-zoom]\n[testimonials style=\"style-v2-product\" card_type=\"style-8\" bg_main=\"yes\" title=\"Customer Say!\" subtitle=\"Our customers adore our products, and we constantly aim to delight them.\" autoplay=\"no\" limit=\"2\" testimonial_product_ids=\"8,2\"][/testimonials]\n[image-gallery style=\"style-default\" title=\"Shop Instagram\" subtitle=\"Connect with us on all platforms to get new information about products.\" quantity=\"5\" image_1=\"gallery/gallery-62.jpg\" link_1=\"/products\" image_2=\"gallery/gallery-63.jpg\" link_2=\"/products\" image_3=\"gallery/gallery-64.jpg\" link_3=\"/products\" image_4=\"gallery/gallery-65.jpg\" link_4=\"/products\" image_5=\"gallery/gallery-66.jpg\" link_5=\"/products\"][/image-gallery]',NULL,NULL,'homepage','Amerce — multi-purpose ecommerce homepage demo.','published','2026-05-28 19:11:46','2026-05-28 19:11:46');
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
INSERT INTO `pages_translations` VALUES ('ar',1,'عن','تقديم Amerce - قصة العلامة التجارية ومعايير التوريد والفريق الذي يقف وراء كل منتج.','[page-banner heading=\"معلومات عنا\" subtitle=\"With over 15 years of experience, we craft timeless collections that transcend<br class=\\\"d-none d-lg-block\\\">trends and inspire lasting elegance.\"][/page-banner]\n[stats-counter hero_image=\"section/s-contact-1.jpg\" heading=\"التصميم والاهتمام بالتفاصيل والكفاءة يرضي العالم\" description=\"منذ لحظة تصورها وحتى لحظة ارتدائها، يتبع كل منتج من منتجاتنا هذه الرحلة. يمكننا أن نفعل ذلك بمعدل أسرع. ومع ذلك، في Amerce، نختار الاعتناء بكل من يشارك معنا في هذه الرحلة.\" quantity=\"4\" value_1=\"8.2k\" animate_to_1=\"\" suffix_1=\"\" label_1=\"المنتجات الموجودة\" desc_1=\"نحن نقدم مجموعة متنوعة من المنتجات عالية الجودة لتلبية جميع الاحتياجات.\" value_2=\"\" animate_to_2=\"10\" suffix_2=\"k\" label_2=\"العملاء الراضين\" desc_2=\"نخدم أكثر من 10,000 عميل راضٍ يثقون بنا من حيث الجودة والخدمة.\" value_3=\"\" animate_to_3=\"96\" suffix_3=\"\" label_3=\"العلامة التجارية الشريكة\" desc_3=\"تجلب الشراكات مع العلامات التجارية الرائدة مجموعات موثوقة إلى متجرك ومنزلك.\" value_4=\"\" animate_to_4=\"16\" suffix_4=\"k\" label_4=\"منتجات للبيع\" desc_4=\"ولهذا السبب نسعى جاهدين لتقديم مجموعة متنوعة من خطوط الإنتاج، المناسبة لكل نمط.\"][/stats-counter]\n[image-accordion image=\"section/s-contact-2.jpg\" heading=\"جلب العناصر النادرة والرائعة إلى جميع أنحاء العالم\" quantity=\"4\" title_1=\"يقدم\" body_1=\"مرحبًا بك في متجر Amerce، وجهتك الأولى للأزياء والإكسسوارات العصرية. نحن فخورون بتقديم مجموعة مختارة بعناية من القطع النادرة والرائعة المطلوبة على الصعيدين الوطني والدولي.\" title_2=\"رؤيتنا\" body_2=\"نحن نهدف إلى عالم يمتزج فيه التصميم المتطور مع الحياة اليومية - المنتجات التي تصمد أمام اختبار الزمن، والشركاء الموثوق بهم، والعملاء الذين يتم التعامل معهم مثل الأشخاص، وليس المعاملات.\" title_3=\"ما الذي يجعل الفرق\" body_3=\"يتم تدقيق الموردين بشكل مستقل، ويتم اختبار المنتجات يدويًا، وتوجد سياسة إرجاع بدون سبب لمدة 30 يومًا، مدعومة بفريق خدمة عملاء متخصص.\" title_4=\"التزامنا\" body_4=\"منتجات عالية الجودة وسلاسل توريد شفافة وظروف عمل عادلة - في كل طلب وفي كل مرة.\"][/image-accordion]\n[about-testimonials heading=\"ماذا يقول العملاء!\" subtitle=\"العملاء يحبون منتجاتنا، ونحن نسعى جاهدين لإرضائهم.\" quantity=\"2\" image_1=\"testimonials/tes-1.jpg\" name_1=\"إيما كولينز\" text_1=\"\\\"Totally obsessed with this outfit! The fit is perfect, the fabric feels premium, and I\'ve been getting compliments non-stop. It instantly lifts my confidence — such a great find!\\\"\" image_2=\"testimonials/tes-2.jpg\" name_2=\"صوفيا راميريز\" text_2=\"\\\"I\'m amazed by how comfortable yet stylish this piece is. It pairs effortlessly with everything, and the quality really stands out. Definitely becoming my go-to for everyday looks!\\\"\"][/about-testimonials]\n[about-team heading=\"تعرف على الفريق\" subtitle=\"محترفون ملتزمون بالإتقان في كل التفاصيل.\" quantity=\"4\" image_1=\"member/member-1.jpg\" name_1=\"أنيت بلاك\" role_1=\"المؤسس/الرئيس التنفيذي\" social_links_1=\"\" image_2=\"member/member-2.jpg\" name_2=\"بروكلين سيمونز\" role_2=\"يدير\" social_links_2=\"\" image_3=\"member/member-3.jpg\" name_3=\"جين كوبر\" role_3=\"مدير المبيعات\" social_links_3=\"\" image_4=\"member/member-4.jpg\" name_4=\"ليزا بونيت\" role_4=\"مدير المبيعات\" social_links_4=\"\"][/about-team]'),('ar',2,'اتصال','اتصل بفريق خدمة العملاء والتعاون في Amerce.',''),('ar',3,'FAQ','الأسئلة المتداولة حول الطلبات والشحن والمرتجعات وإدارة الحساب.','[page-banner heading=\"الأسئلة المتداولة\" subtitle=\"Got questions? We\'ve got answers! Browse our الأسئلة المتداولة to find information on orders, shipping,<br class=\\\"d-none d-lg-block\\\">returns, and more. If you need further assistance, feel free to contact our team.\"][/page-banner]\n[faq-page sidebar_image=\"section/banner-12.jpg\" sidebar_title=\"Save 25% <br class=\\\"d-none d-sm-block\\\">Today\" sidebar_subtitle=\"قمصان، هوديس وأكثر\" sidebar_cta=\"شاهد المزيد\" sidebar_url=\"/products\" quantity=\"16\" category_1=\"حسابي\" category_id_1=\"myAccount\" question_1=\"1. ماذا يمكنني أن أفعل إذا نسيت كلمة المرور الخاصة بي؟\" answer_1=\"Use the \\\"Forgot password\\\" link on the sign-in page. We will email you a one-time link to set a new password — it expires in 30 minutes for security.\" category_2=\"حسابي\" category_id_2=\"myAccount\" question_2=\"2. كيفية تحديث عنوان البريد الإلكتروني؟\" answer_2=\"قم بتسجيل الدخول، افتح الحساب → الإعدادات وقم بتغيير حقول البريد الإلكتروني. سنرسل رسالة تأكيد بالبريد الإلكتروني إلى العنوان الجديد؛ سيصبح التغيير ساري المفعول عندما تنقر على هذا الرابط.\" category_3=\"حسابي\" category_id_3=\"myAccount\" question_3=\"3. هل يمكنني حذف حسابي؟\" answer_3=\"يملك. من الحساب → الإعدادات، قم بالتمرير لأسفل إلى حذف الحساب. نحن نحتفظ بسجل الطلبات لأسباب ضريبية/قانونية، ولكن يتم حذف معلومات الاتصال الشخصية خلال 30 يومًا.\" category_4=\"الطلبات والتسوق\" category_id_4=\"ordersPurchases\" question_4=\"1. كيف تطلب؟\" answer_4=\"قم بإضافة المنتجات إلى سلة التسوق، ثم انقر فوق إتمام الطلب، ثم حدد طريقة الشحن، ثم أدخل معلومات الدفع. سوف تتلقى رسالة تأكيد الطلب عبر البريد الإلكتروني على الفور.\" category_5=\"الطلبات والتسوق\" category_id_5=\"ordersPurchases\" question_5=\"2. هل يمكنني تعديل أو إلغاء طلبي؟\" answer_5=\"يمكن تعديل الطلبات أو إلغاؤها من لوحة تحكم حسابك خلال ساعة واحدة من تقديمها. بعد ذلك بدأ المستودع بالتعبئة ولم نتمكن من التدخل.\" category_6=\"الطلبات والتسوق\" category_id_6=\"ordersPurchases\" question_6=\"3. ما هي طرق الدفع المقبولة؟\" answer_6=\"نحن نقبل Visa وMastercard وAmerican Express وApple Pay وGoogle Pay وPayPal. تستخدم جميع المعاملات تشفير TLS 1.3.\" category_7=\"العوائد والمبالغ المستردة\" category_id_7=\"returnsRefunds\" question_7=\"1. ما هي مدة الإرجاع؟\" answer_7=\"30 يومًا من تاريخ الاستلام للمنتجات غير المستخدمة وغير المستهلكة. لا ينطبق على سلع البيع والملابس الداخلية وعناصر البيع الفوري.\" category_8=\"العوائد والمبالغ المستردة\" category_id_8=\"returnsRefunds\" question_8=\"2. كيف أبدأ عملية الإرجاع؟\" answer_8=\"Open the order in your account dashboard and click \\\"Start return\\\". We email a prepaid label for domestic orders within one business day.\" category_9=\"العوائد والمبالغ المستردة\" category_id_9=\"returnsRefunds\" question_9=\"3. متى سأسترد أموالي؟\" answer_9=\"تتم معالجة المبالغ المستردة في غضون 3-5 أيام عمل من تاريخ استلامنا للمنتج المرتجع. قد تختلف أوقات الائتمان البنكي؛ يُرجى الانتظار لمدة تصل إلى 10 أيام عمل حتى تظهر دفعتك.\" category_10=\"الشحن والتتبع\" category_id_10=\"shippingTracking\" question_10=\"1. كم من الوقت يستغرق الشحن؟\" answer_10=\"يستغرق الشحن المحلي القياسي من 3 إلى 5 أيام عمل. الشحن السريع 1-2 أيام. يستغرق الشحن القياسي الدولي من 7 إلى 12 يوم عمل؛ تتوفر خيارات الشحن المعجل في صفحة الخروج.\" category_11=\"الشحن والتتبع\" category_id_11=\"shippingTracking\" question_11=\"2. كيفية تتبع الطلبات؟\" answer_11=\"يتم تضمين رابط التتبع في رسالة البريد الإلكتروني لتأكيد الشحن. يمكنك أيضًا عرض الحالة من الحساب → الطلبات → التتبع.\" category_12=\"الشحن والتتبع\" category_id_12=\"shippingTracking\" question_12=\"3. هل تشحن دوليًا؟\" answer_12=\"نعم – لمعظم البلدان. يتم دفع الضرائب والرسوم مسبقًا في صفحة الخروج لوجهات معينة؛ إذا لم يكن الأمر كذلك، يجوز لوحدة الشحن جمعها عند التسليم.\" category_13=\"الرسوم والمدفوعات\" category_id_13=\"feesBilling\" question_13=\"1. هل يشمل السعر الضرائب والرسوم؟\" answer_13=\"الأسعار المحلية تشمل ضريبة المبيعات الموضحة عند الخروج. تشمل الطلبات الدولية للوجهات المدعومة الضرائب والرسوم؛ وبخلاف ذلك، ستقوم وحدة الشحن باستلامها عند التسليم.\" category_14=\"الرسوم والمدفوعات\" category_id_14=\"feesBilling\" question_14=\"2. لماذا تم محاسبتي مرتين؟\" answer_14=\"ربما ترى تعليقًا للتفويض بالإضافة إلى الرسوم الفعلية. سيتم إلغاء الحجز تلقائيًا خلال 3-5 أيام عمل. أرسل بريدًا إلكترونيًا إلى billing@amerce.test إذا كنت لا تزال ترى رسومين بعد ذلك الوقت.\" category_15=\"موضوعات أخرى\" category_id_15=\"otherTopic\" question_15=\"1. هل لديك متجر فعلي؟\" answer_15=\"نعم — يرجى زيارة صفحة المتاجر للحصول على قائمة بالمتاجر الرئيسية والشركاء.\" category_16=\"موضوعات أخرى\" category_id_16=\"otherTopic\" question_16=\"2. كيفية الاتصال بخدمة العملاء؟\" answer_16=\"أرسل بريدًا إلكترونيًا إلى hello@amerce.test أو استخدم نموذج الاتصال. سوف نقوم بالرد خلال يوم عمل واحد.\"][/faq-page]'),('ar',4,'سياسة الخصوصية','كيف تقوم Amerce بجمع معلوماتك الشخصية واستخدامها وحمايتها.','[page-banner heading=\"سياسة الخصوصية\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. المعلومات التي نجمعها\" body_1=\"<p class=\\\"term-text cl-text-2\\\">When you visit the Site, we automatically collect certain information about your device — web browser, IP address, time zone, and some of the cookies installed on your device. As you browse, we also collect data about the pages or products you view, what referred you to the Site, and how you interact with it. We refer to this as \\\"Device Information\\\".</p><p class=\\\"term-text cl-text-2\\\">When you make a purchase or attempt to purchase through the Site, we collect your name, billing address, shipping address, and payment information (including card number, email address, and phone number). We refer to this as \\\"Order Information\\\".</p>\" title_2=\"2. كيف نستخدم معلوماتك\" body_2=\"<p class=\\\"term-text cl-text-2\\\">We use Order Information to fulfil orders placed through the Site (process payment, arrange shipping, provide invoices and order confirmations). We use it to communicate with you, screen orders for fraud, and — in line with your preferences — share marketing about products you may like.</p><p class=\\\"term-text cl-text-2\\\">We use Device Information to screen for fraud and to improve the Site through analytics about how customers browse and interact with us.</p>\" title_3=\"3. مشاركة معلوماتك الشخصية\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We share Personal Information with third-party service providers who help us run the Site. We may also share information to comply with applicable laws, respond to a subpoena or lawful request, or otherwise protect our rights.</p>\" title_4=\"4. تخزين البيانات\" body_4=\"<p class=\\\"term-text cl-text-2\\\">When you place an order, we maintain the Order Information for our records unless and until you ask us to delete it.</p>\" title_5=\"5. حقوقك\" body_5=\"<p class=\\\"term-text cl-text-2\\\">You can request access, correction, or deletion of any personal data we hold about you. Email privacy@amerce.test from the address on file and we will respond within 30 days.</p>\" title_6=\"6. ملفات تعريف الارتباط\" body_6=\"<p class=\\\"term-text cl-text-2\\\">Cookies are used to keep your cart between visits, remember your preferences, and measure aggregate traffic. You can disable cookies in your browser, though some Site features may stop working.</p>\" title_7=\"7. التغيير\" body_7=\"<p class=\\\"term-text cl-text-2\\\">We may update this policy from time to time to reflect changes to our practices or for operational, legal, or regulatory reasons. The latest version will always be on this page.</p>\"][/term-content]'),('ar',5,'الشروط والأحكام','تنطبق الشروط القانونية عند استخدام متجر Amerce.','[page-banner heading=\"الشروط والأحكام\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. قبول الشروط\" body_1=\"<p class=\\\"term-text cl-text-2\\\">By accessing or using the أميرس store you agree to these terms. We reserve the right to update them with reasonable notice; the latest version is always available on this page.</p>\" title_2=\"2. الطلبات والدفع\" body_2=\"<p class=\\\"term-text cl-text-2\\\">All prices are in USD unless otherwise stated. We accept the payment methods displayed at checkout. An order becomes binding once you receive an order confirmation email.</p>\" title_3=\"3. الشحن\" body_3=\"<p class=\\\"term-text cl-text-2\\\">ينقل options, lead times, and rates are listed on our ينقل page. Risk passes to you on delivery.</p>\" title_4=\"4. المرتجعات\" body_4=\"<p class=\\\"term-text cl-text-2\\\">You have 30 days from delivery to return any unworn item for a refund. See our العوائد والمبالغ المستردة page for the full process.</p>\" title_5=\"5. الملكية الفكرية\" body_5=\"<p class=\\\"term-text cl-text-2\\\">All content on the Site — text, photography, logos, code — is owned by أميرس or its licensors and may not be reproduced without written permission.</p>\" title_6=\"6. حدود المسؤولية\" body_6=\"<p class=\\\"term-text cl-text-2\\\">To the maximum extent permitted by law, أميرس is not liable for indirect or consequential damages arising from use of the Site or the products purchased through it.</p>\" title_7=\"7. القانون المعمول به\" body_7=\"<p class=\\\"term-text cl-text-2\\\">These terms are governed by the laws of the State of New York. Any dispute will be resolved in the state or federal courts located in New York County.</p>\"][/term-content]'),('ar',6,'العوائد والمبالغ المستردة','سياسة الإرجاع الخاصة بنا لمدة 30 يومًا وعملية الإرجاع خطوة بخطوة.','[page-banner heading=\"العوائد والمبالغ المستردة\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. المرتجعات\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We want you to be completely satisfied with your purchase. If for any reason you are not, you may return any unworn item within 30 days of receiving your order for a refund or exchange. أغراض must be in original packaging and the same condition as you received them.</p>\" title_2=\"2. كيف تبدأ عملية الإرجاع\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Open the order in your account dashboard and click \\\"Start return\\\", or email returns@amerce.test with your order number. We will send a prepaid return label for domestic orders within one business day.</p>\" title_3=\"3. استرداد الأموال\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Refunds are processed within 3-5 business days of us receiving the return and applied to the original payment method. Bank posting times vary; allow up to 10 business days for the credit to appear.</p>\" title_4=\"4. الاستثناءات\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Sale items, intimate apparel, and final-sale flash sale purchases are excluded from returns. Personalised or made-to-order items are also non-returnable unless faulty.</p>\" title_5=\"5. المنتجات التالفة أو المعيبة\" body_5=\"<p class=\\\"term-text cl-text-2\\\">If your order arrives damaged or faulty, email us within 7 days with photos. We will replace the item or issue a full refund — including any return shipping cost — at our expense.</p>\" title_6=\"6. العودة الدولية\" body_6=\"<p class=\\\"term-text cl-text-2\\\">International customers are responsible for return shipping unless the item is faulty. We do not refund original shipping or duty charges on international returns.</p>\"][/term-content]'),('ar',7,'شحن','طرق الشحن المحلي والدولي وأوقاته ورسومه.','[page-banner heading=\"ينقل\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. طريقة الشحن\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We offer the following shipping methods for domestic and international orders: standard ground, expedited 2-day, and priority overnight (where available).</p>\" title_2=\"2. الرسوم المحلية\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Standard ground is free on orders over $99. Express 1-2 day shipping is $19.99 flat. Priority overnight is calculated by weight at checkout.</p>\" title_3=\"3. الدولية\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We ship to most countries. International standard shipping is $24.99 with 7-12 business day delivery. Express options appear at checkout. Duties and taxes are pre-paid for select destinations; otherwise the courier collects them on delivery.</p>\" title_4=\"4. وقت المعالجة\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Orders placed before 2pm EST on business days ship the same day. Orders placed after 2pm or on weekends/holidays ship the next business day.</p>\" title_5=\"5. التتبع\" body_5=\"<p class=\\\"term-text cl-text-2\\\">A tracking link is included in your shipment confirmation email. You can also see live status from Account → Orders → Track.</p>\" title_6=\"6. الطلبات المفقودة أو المعلقة\" body_6=\"<p class=\\\"term-text cl-text-2\\\">If a tracking number has not updated for more than 7 business days, email shipping@amerce.test. We will open an investigation with the carrier and either refund or reship the order at our expense.</p>\"][/term-content]'),('ar',8,'متاجرنا','قم بزيارة Amerce مباشرة — المتاجر الرئيسية والشركاء في جميع أنحاء العالم.',''),('ar',9,'Blog','تعليمات الزي وقصص العلامات التجارية والمحتوى من وراء الكواليس من فريق تحرير Amerce.','<div class=\"container py-5\"><h1>مذكرة</h1><p>اكتشف أحدث قصصنا - أدلة الأسلوب، وأبرز المنتجات، وتحليل الاستدامة المتعمق والمزيد.</p></div>'),('ar',10,'وظائف','انضم إلى Amerce - المناصب المفتوحة والقيم الثقافية وفوائد الفريق.','<div class=\"container py-5\"><h1>التوظيف في Amerce</h1><p>نحن فريق صغير وموزع لبناء نموذج بيع بالتجزئة أكثر دقة. نقوم بالتوظيف عبر المنتجات والهندسة وسلسلة التوريد وتجربة العملاء.</p><p>يتم نشر الوظائف المفتوحة على صفحة LinkedIn الخاصة بالشركة. للتقديم، أرسل خطابًا قصيرًا واستأنفه إلى <a href=\"mailto:careers@amerce.test\">careers@amerce.test</a>.</p></div>'),('ar',11,'Sustainability','How Amerce sources responsibly and reduces its environmental footprint.','<div class=\"container py-5\"><h1>التنمية المستدامة في أمريكا</h1><p>كل منتج يحمل قصة. نحن نعمل مباشرة مع المصانع وورش العمل الحرفية، ونعطي الأولوية للمواد المعاد تدويرها والتي يمكن تتبعها، ونقوم بتغليف عبوات خالية من البلاستيك.</p><p>هدفنا لعام 2026: أن يكون لدى 90% من المواد سلسلة توريد تم التحقق منها وتقارير تأثير سنوية شفافة.</p></div>'),('ar',12,'الصفحة الرئيسية','Amerce — موطن لتجربة التجارة الإلكترونية المتنوعة.','[hero-grid-asymmetric hero_image=\"section/banner-59.jpg\" hero_title=\"Pickleball: &lt;br&gt;شغفك التالي.\" hero_desc=\"خصم يصل إلى 50% على الإكسسوارات\" hero_button_text=\"اشتري الآن\" hero_button_url=\"/products\" card_1_image=\"section/banner-60.jpg\" card_1_title=\"أدوات الدقة &lt;br&gt;Top Battle\" card_1_desc=\"خصم يصل إلى 50% على المنتجات الأكثر مبيعًا\" card_1_button_text=\"اشتري الآن\" card_1_button_url=\"/products\" card_2_image=\"section/banner-61.jpg\" card_2_title=\"الأداء النهائي &lt;br&gt;الأسلوب النهائي\" card_2_desc=\"خصم يصل إلى 50% على المنتجات الأكثر مبيعًا\" card_2_button_text=\"اشتري الآن\" card_2_button_url=\"/products\"][/hero-grid-asymmetric]\n[site-features style=\"style-1\" compact=\"yes\" quantity=\"4\" icon_class_1=\"icon-ArrowUDownLeft\" title_1=\"العودة في غضون 14 يوما\" description_1=\"تسوق بدون مخاطر مع سياسة إرجاع سهلة.\" icon_class_2=\"icon-Package\" title_2=\"ًالشحن مجانا\" description_2=\"لا توجد رسوم إضافية، فقط السعر الذي تراه.\" icon_class_3=\"icon-Headset\" title_3=\"دعم 24/7\" description_3=\"دعم على مدار 24 ساعة طوال أيام الأسبوع، دائمًا هنا من أجلك.\" icon_class_4=\"icon-SealPercent\" title_4=\"عروض الأعضاء\" description_4=\"سعر خاص للعملاء الأوفياء.\"][/site-features]\n[ecommerce-products style=\"style-slider\" title=\"الأداء يبدأ هنا\" subtitle=\"معدات رياضية متميزة مصممة من أجل المتانة والراحة والنتائج.\" source=\"best-seller\" limit=\"8\" items_per_row=\"4\" grid_rows=\"2\" card_style=\"style-1\" product_wrapper_class=\"square\" pagination=\"2\" pagination_sm=\"2\" pagination_md=\"3\" pagination_lg=\"4\"][/ecommerce-products]\n[ecommerce-collections style=\"style-slider-overlay\" collection_ids=\"4,5,6\" limit=\"3\"][/ecommerce-collections]\n[tab-product-showcase title=\"حرق على القدمين\" subtitle=\"السرعة والراحة والتحمل والتوازن.\" view_all_url=\"/products\" view_all_text=\"شاهد المزيد\" tab_1_label=\"حذاء الجري XT8\" tab_1_image=\"section/sport-tab-1.jpg\" tab_1_product_id=\"1\" tab_2_label=\"حذاء جري كوشن 500\" tab_2_image=\"section/sport-tab-2.jpg\" tab_2_product_id=\"1\" tab_3_label=\"حذاء إيكيدن وان للجري\" tab_3_image=\"section/sport-tab-3.jpg\" tab_3_product_id=\"1\" tab_4_label=\"حذاء الجري JF190.1\" tab_4_image=\"section/sport-tab-4.jpg\" tab_4_product_id=\"1\"][/tab-product-showcase]\n[brand-logos style=\"style-infinite\" modifier_class=\"syle-3\" limit=\"6\"][/brand-logos]\n[lookbook-hotspot style=\"style-v3\" wide=\"yes\" image=\"lookbook/look-10.jpg\" image_2=\"lookbook/look-11.jpg\" quantity=\"2\" x_percent_1=\"39.5\" y_percent_1=\"27.2\" product_id_1=\"7\" column_1=\"1\" x_percent_2=\"34.5\" y_percent_2=\"48.2\" product_id_2=\"2\" column_2=\"2\"][/lookbook-hotspot]\n[product-feature-zoom style=\"style-3-pdp\" product_id=\"4\" detail_tag=\"رياضة المضرب\" reviews_count=\"134\" urgency_text=\"تم بيع 18 منتج خلال 32 ساعة الماضية\" viewing_count=\"28\"][/product-feature-zoom]\n[testimonials style=\"style-v2-product\" card_type=\"style-8\" bg_main=\"yes\" title=\"ماذا يقول العملاء!\" subtitle=\"العملاء يحبون منتجاتنا، ونحن نسعى جاهدين لإرضائهم.\" autoplay=\"no\" limit=\"2\" testimonial_product_ids=\"8,2\"][/testimonials]\n[image-gallery style=\"style-default\" title=\"التسوق على انستغرام\" subtitle=\"تواصل معنا على جميع المنصات لتبقى على اطلاع بمعلومات المنتجات الجديدة.\" quantity=\"5\" image_1=\"gallery/gallery-62.jpg\" link_1=\"/products\" image_2=\"gallery/gallery-63.jpg\" link_2=\"/products\" image_3=\"gallery/gallery-64.jpg\" link_3=\"/products\" image_4=\"gallery/gallery-65.jpg\" link_4=\"/products\" image_5=\"gallery/gallery-66.jpg\" link_5=\"/products\"][/image-gallery]'),('fr',1,'À propos','Présentation d\'Amerce - histoire de la marque, normes d\'approvisionnement et équipe derrière chaque produit.','[page-banner heading=\"À propos de nous\" subtitle=\"With over 15 years of experience, we craft timeless collections that transcend<br class=\\\"d-none d-lg-block\\\">trends and inspire lasting elegance.\"][/page-banner]\n[stats-counter hero_image=\"section/s-contact-1.jpg\" heading=\"Le design, l’attention aux détails et l’efficacité plaisent au monde\" description=\"De sa conception jusqu\'à son port, chacun de nos produits suit ce voyage. Nous pouvons le faire à un rythme plus rapide. Cependant, chez Amerce, nous choisissons de prendre soin de tous ceux qui font ce voyage avec nous.\" quantity=\"4\" value_1=\"8.2k\" animate_to_1=\"\" suffix_1=\"\" label_1=\"Produits existants\" desc_1=\"Nous proposons une variété de produits de haute qualité pour répondre à tous les besoins.\" value_2=\"\" animate_to_2=\"10\" suffix_2=\"k\" label_2=\"Clients satisfaits\" desc_2=\"Au service de plus de 10 000 clients satisfaits qui nous font confiance pour la qualité et le service.\" value_3=\"\" animate_to_3=\"96\" suffix_3=\"\" label_3=\"Marque partenaire\" desc_3=\"Les partenariats avec de grandes marques apportent des collections de confiance dans votre magasin et chez vous.\" value_4=\"\" animate_to_4=\"16\" suffix_4=\"k\" label_4=\"Produits à vendre\" desc_4=\"C\'est pourquoi nous nous efforçons de proposer une variété de gammes de produits, adaptées à chaque style.\"][/stats-counter]\n[image-accordion image=\"section/s-contact-2.jpg\" heading=\"Apporter des objets rares et exquis dans le monde entier\" quantity=\"4\" title_1=\"Introduire\" body_1=\"Bienvenue chez Amerce Store, votre destination privilégiée pour la mode et les accessoires avant-gardistes. Nous sommes fiers d\'offrir une collection soigneusement sélectionnée de pièces rares et exquises recherchées tant au niveau national qu\'international.\" title_2=\"Notre vision\" body_2=\"Nous visons un monde où le design sophistiqué se mêle à la vie quotidienne : des produits qui résistent à l\'épreuve du temps, des partenaires de confiance et des clients traités comme des personnes et non comme des transactions.\" title_3=\"Ce qui fait la différence\" body_3=\"Les fournisseurs sont audités de manière indépendante, les produits sont testés manuellement et il existe une politique de retour sans motif de 30 jours, soutenue par une équipe de service client dédiée.\" title_4=\"Notre engagement\" body_4=\"Des produits de qualité, des chaînes d\'approvisionnement transparentes et des conditions de travail équitables : à chaque commande, à chaque fois.\"][/image-accordion]\n[about-testimonials heading=\"Ce que disent les clients !\" subtitle=\"Les clients aiment nos produits et nous nous efforçons de leur plaire.\" quantity=\"2\" image_1=\"testimonials/tes-1.jpg\" name_1=\"Emma Collins\" text_1=\"\\\"Totally obsessed with this outfit! The fit is perfect, the fabric feels premium, and I\'ve been getting compliments non-stop. It instantly lifts my confidence — such a great find!\\\"\" image_2=\"testimonials/tes-2.jpg\" name_2=\"Sophie Ramírez\" text_2=\"\\\"I\'m amazed by how comfortable yet stylish this piece is. It pairs effortlessly with everything, and the quality really stands out. Definitely becoming my go-to for everyday looks!\\\"\"][/about-testimonials]\n[about-team heading=\"Rencontrez l\'équipe\" subtitle=\"Des professionnels dédiés à la perfection dans les moindres détails.\" quantity=\"4\" image_1=\"member/member-1.jpg\" name_1=\"Annette Noir\" role_1=\"Fondateur/PDG\" social_links_1=\"\" image_2=\"member/member-2.jpg\" name_2=\"Brooklyn Simmons\" role_2=\"Gérer\" social_links_2=\"\" image_3=\"member/member-3.jpg\" name_3=\"Jane Cooper\" role_3=\"Directeur des ventes\" social_links_3=\"\" image_4=\"member/member-4.jpg\" name_4=\"Lisa Bonet\" role_4=\"Directeur des ventes\" social_links_4=\"\"][/about-team]'),('fr',2,'Contact','Contactez l\'équipe de service client et de coopération d\'Amerce.',''),('fr',3,'FAQ','Questions fréquemment posées sur les commandes, l\'expédition, les retours et la gestion des comptes.','[page-banner heading=\"Foire aux questions\" subtitle=\"Got questions? We\'ve got answers! Browse our Foire aux questions to find information on orders, shipping,<br class=\\\"d-none d-lg-block\\\">returns, and more. If you need further assistance, feel free to contact our team.\"][/page-banner]\n[faq-page sidebar_image=\"section/banner-12.jpg\" sidebar_title=\"Save 25% <br class=\\\"d-none d-sm-block\\\">Today\" sidebar_subtitle=\"T-shirts, sweats à capuche et plus\" sidebar_cta=\"Voir plus\" sidebar_url=\"/products\" quantity=\"16\" category_1=\"Mon compte\" category_id_1=\"myAccount\" question_1=\"1. Que puis-je faire si j\'oublie mon mot de passe ?\" answer_1=\"Use the \\\"Forgot password\\\" link on the sign-in page. We will email you a one-time link to set a new password — it expires in 30 minutes for security.\" category_2=\"Mon compte\" category_id_2=\"myAccount\" question_2=\"2. Comment mettre à jour l\'adresse e-mail ?\" answer_2=\"Connectez-vous, ouvrez Compte → Paramètres et modifiez les champs de courrier électronique. Nous enverrons un e-mail de confirmation à la nouvelle adresse ; Le changement prendra effet lorsque vous cliquerez sur ce lien.\" category_3=\"Mon compte\" category_id_3=\"myAccount\" question_3=\"3. Puis-je supprimer mon compte ?\" answer_3=\"Avoir. Dans Compte → Paramètres, faites défiler jusqu\'à Supprimer le compte. Nous conservons l\'historique des commandes pour des raisons fiscales/légales, mais les coordonnées personnelles sont supprimées dans les 30 jours.\" category_4=\"Commandes et achats\" category_id_4=\"ordersPurchases\" question_4=\"1. Comment commander ?\" answer_4=\"Ajoutez des produits au panier, cliquez sur Commander, sélectionnez le mode d\'expédition, puis saisissez les informations de paiement. Vous recevrez immédiatement un e-mail de confirmation de commande.\" category_5=\"Commandes et achats\" category_id_5=\"ordersPurchases\" question_5=\"2. Puis-je modifier ou annuler ma commande ?\" answer_5=\"Les commandes peuvent être modifiées ou annulées à partir du tableau de bord de votre compte dans l\'heure suivant leur passation. Après cela, l\'entrepôt a commencé à emballer et nous n\'avons pas pu intervenir.\" category_6=\"Commandes et achats\" category_id_6=\"ordersPurchases\" question_6=\"3. Quels modes de paiement sont acceptés ?\" answer_6=\"Nous acceptons Visa, Mastercard, American Express, Apple Pay, Google Pay et PayPal. Toutes les transactions utilisent le cryptage TLS 1.3.\" category_7=\"Retours et remboursements\" category_id_7=\"returnsRefunds\" question_7=\"1. Quelle est la durée du délai de retour ?\" answer_7=\"30 jours à compter de la date de réception pour les produits non utilisés et non portés. Non applicable aux articles soldés, aux sous-vêtements et aux articles en vente flash en vente finale.\" category_8=\"Retours et remboursements\" category_id_8=\"returnsRefunds\" question_8=\"2. Comment démarrer le processus de retour ?\" answer_8=\"Open the order in your account dashboard and click \\\"Start return\\\". We email a prepaid label for domestic orders within one business day.\" category_9=\"Retours et remboursements\" category_id_9=\"returnsRefunds\" question_9=\"3. Quand recevrai-je mon remboursement ?\" answer_9=\"Les remboursements sont traités dans les 3 à 5 jours ouvrables à compter de la réception de l\'article retourné. Les délais de crédit bancaire peuvent varier ; Veuillez prévoir jusqu\'à 10 jours ouvrables pour voir votre paiement reflété.\" category_10=\"Expédition et suivi\" category_id_10=\"shippingTracking\" question_10=\"1. Combien de temps prend l’expédition ?\" answer_10=\"L\'expédition nationale standard prend 3 à 5 jours ouvrables. Expédition rapide 1-2 jours. L\'expédition standard internationale prend 7 à 12 jours ouvrables ; Des options d\'expédition accélérée sont disponibles sur la page de paiement.\" category_11=\"Expédition et suivi\" category_id_11=\"shippingTracking\" question_11=\"2. Comment suivre les commandes ?\" answer_11=\"Le lien de suivi est inclus dans l\'e-mail de confirmation d\'expédition. Vous pouvez également afficher le statut depuis Compte → Commandes → Suivi.\" category_12=\"Expédition et suivi\" category_id_12=\"shippingTracking\" question_12=\"3. Expédiez-vous à l’international ?\" answer_12=\"Oui, dans la plupart des pays. Les taxes et frais sont prépayés sur la page de paiement pour certaines destinations ; Dans le cas contraire, l\'unité d\'expédition pourra le récupérer à la livraison.\" category_13=\"Frais et paiements\" category_id_13=\"feesBilling\" question_13=\"1. Les taxes et frais sont-ils inclus ?\" answer_13=\"Les prix nationaux incluent la taxe de vente indiquée au moment du paiement. Les commandes internationales vers les destinations prises en charge incluent les taxes et les frais ; Dans le cas contraire, l\'unité d\'expédition le récupérera à la livraison.\" category_14=\"Frais et paiements\" category_id_14=\"feesBilling\" question_14=\"2. Pourquoi ai-je été facturé deux fois ?\" answer_14=\"Vous voyez peut-être une autorisation retenue avec le montant réel des frais. La retenue sera automatiquement annulée dans un délai de 3 à 5 jours ouvrables. Envoyez un e-mail à billing@amerce.test si vous voyez toujours deux frais après cette heure.\" category_15=\"Autres sujets\" category_id_15=\"otherTopic\" question_15=\"1. Avez-vous un magasin physique ?\" answer_15=\"Oui, veuillez visiter la page Magasins pour une liste des principaux magasins et partenaires.\" category_16=\"Autres sujets\" category_id_16=\"otherTopic\" question_16=\"2. Comment contacter le service client ?\" answer_16=\"Envoyez un e-mail à hello@amerce.test ou utilisez le formulaire de contact. Nous vous répondrons dans un délai d\'un jour ouvrable.\"][/faq-page]'),('fr',4,'politique de confidentialité','Comment Amerce collecte, utilise et protège vos informations personnelles.','[page-banner heading=\"politique de confidentialité\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Informations que nous collectons\" body_1=\"<p class=\\\"term-text cl-text-2\\\">When you visit the Site, we automatically collect certain information about your device — web browser, IP address, time zone, and some of the cookies installed on your device. As you browse, we also collect data about the pages or products you view, what referred you to the Site, and how you interact with it. We refer to this as \\\"Device Information\\\".</p><p class=\\\"term-text cl-text-2\\\">When you make a purchase or attempt to purchase through the Site, we collect your name, billing address, shipping address, and payment information (including card number, email address, and phone number). We refer to this as \\\"Order Information\\\".</p>\" title_2=\"2. Comment nous utilisons vos informations\" body_2=\"<p class=\\\"term-text cl-text-2\\\">We use Order Information to fulfil orders placed through the Site (process payment, arrange shipping, provide invoices and order confirmations). We use it to communicate with you, screen orders for fraud, and — in line with your preferences — share marketing about products you may like.</p><p class=\\\"term-text cl-text-2\\\">We use Device Information to screen for fraud and to improve the Site through analytics about how customers browse and interact with us.</p>\" title_3=\"3. Partage de vos informations personnelles\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We share Personal Information with third-party service providers who help us run the Site. We may also share information to comply with applicable laws, respond to a subpoena or lawful request, or otherwise protect our rights.</p>\" title_4=\"4. Stockage des données\" body_4=\"<p class=\\\"term-text cl-text-2\\\">When you place an order, we maintain the Order Information for our records unless and until you ask us to delete it.</p>\" title_5=\"5. Vos droits\" body_5=\"<p class=\\\"term-text cl-text-2\\\">You can request access, correction, or deletion of any personal data we hold about you. Email privacy@amerce.test from the address on file and we will respond within 30 days.</p>\" title_6=\"6. Cookies\" body_6=\"<p class=\\\"term-text cl-text-2\\\">Cookies are used to keep your cart between visits, remember your preferences, and measure aggregate traffic. You can disable cookies in your browser, though some Site features may stop working.</p>\" title_7=\"7. Changement\" body_7=\"<p class=\\\"term-text cl-text-2\\\">We may update this policy from time to time to reflect changes to our practices or for operational, legal, or regulatory reasons. The latest version will always be on this page.</p>\"][/term-content]'),('fr',5,'Conditions générales','Les conditions légales s\'appliquent lorsque vous utilisez la boutique Amerce.','[page-banner heading=\"Conditions générales\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Acceptation des conditions\" body_1=\"<p class=\\\"term-text cl-text-2\\\">By accessing or using the Amérique store you agree to these terms. We reserve the right to update them with reasonable notice; the latest version is always available on this page.</p>\" title_2=\"2. Commandes et paiement\" body_2=\"<p class=\\\"term-text cl-text-2\\\">All prices are in USD unless otherwise stated. We accept the payment methods displayed at checkout. An order becomes binding once you receive an order confirmation email.</p>\" title_3=\"3. Expédition\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Transport options, lead times, and rates are listed on our Transport page. Risk passes to you on delivery.</p>\" title_4=\"4. Retours\" body_4=\"<p class=\\\"term-text cl-text-2\\\">You have 30 days from delivery to return any unworn item for a refund. See our Retours et remboursements page for the full process.</p>\" title_5=\"5. Propriété intellectuelle\" body_5=\"<p class=\\\"term-text cl-text-2\\\">All content on the Site — text, photography, logos, code — is owned by Amérique or its licensors and may not be reproduced without written permission.</p>\" title_6=\"6. Limitation de responsabilité\" body_6=\"<p class=\\\"term-text cl-text-2\\\">To the maximum extent permitted by law, Amérique is not liable for indirect or consequential damages arising from use of the Site or the products purchased through it.</p>\" title_7=\"7. Loi applicable\" body_7=\"<p class=\\\"term-text cl-text-2\\\">These terms are governed by the laws of the State of New York. Any dispute will be resolved in the state or federal courts located in New York County.</p>\"][/term-content]'),('fr',6,'Retours et remboursements','Notre politique de retour de 30 jours et notre processus de retour étape par étape.','[page-banner heading=\"Retours et remboursements\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Retours\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We want you to be completely satisfied with your purchase. If for any reason you are not, you may return any unworn item within 30 days of receiving your order for a refund or exchange. Articles must be in original packaging and the same condition as you received them.</p>\" title_2=\"2. Comment démarrer un retour\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Open the order in your account dashboard and click \\\"Start return\\\", or email returns@amerce.test with your order number. We will send a prepaid return label for domestic orders within one business day.</p>\" title_3=\"3. Remboursement\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Refunds are processed within 3-5 business days of us receiving the return and applied to the original payment method. Bank posting times vary; allow up to 10 business days for the credit to appear.</p>\" title_4=\"4. Exclusions\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Sale items, intimate apparel, and final-sale flash sale purchases are excluded from returns. Personalised or made-to-order items are also non-returnable unless faulty.</p>\" title_5=\"5. Produits endommagés ou défectueux\" body_5=\"<p class=\\\"term-text cl-text-2\\\">If your order arrives damaged or faulty, email us within 7 days with photos. We will replace the item or issue a full refund — including any return shipping cost — at our expense.</p>\" title_6=\"6. Retours internationaux\" body_6=\"<p class=\\\"term-text cl-text-2\\\">International customers are responsible for return shipping unless the item is faulty. We do not refund original shipping or duty charges on international returns.</p>\"][/term-content]'),('fr',7,'Expédition','Méthodes, délais et frais d\'expédition nationaux et internationaux.','[page-banner heading=\"Transport\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Méthode d\'expédition\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We offer the following shipping methods for domestic and international orders: standard ground, expedited 2-day, and priority overnight (where available).</p>\" title_2=\"2. Frais nationaux\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Standard ground is free on orders over $99. Express 1-2 day shipping is $19.99 flat. Priority overnight is calculated by weight at checkout.</p>\" title_3=\"3. Internationale\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We ship to most countries. International standard shipping is $24.99 with 7-12 business day delivery. Express options appear at checkout. Duties and taxes are pre-paid for select destinations; otherwise the courier collects them on delivery.</p>\" title_4=\"4. Délai de traitement\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Orders placed before 2pm EST on business days ship the same day. Orders placed after 2pm or on weekends/holidays ship the next business day.</p>\" title_5=\"5. Suivi\" body_5=\"<p class=\\\"term-text cl-text-2\\\">A tracking link is included in your shipment confirmation email. You can also see live status from Account → Orders → Track.</p>\" title_6=\"6. Commandes perdues ou bloquées\" body_6=\"<p class=\\\"term-text cl-text-2\\\">If a tracking number has not updated for more than 7 business days, email shipping@amerce.test. We will open an investigation with the carrier and either refund or reship the order at our expense.</p>\"][/term-content]'),('fr',8,'Nos magasins','Visitez Amerce directement – ​​magasins phares et partenaires dans le monde entier.',''),('fr',9,'Blog','Instructions de tenue, histoires de marque et contenu en coulisses de l\'équipe éditoriale d\'Amerce.','<div class=\"container py-5\"><h1>Agenda</h1><p>Découvrez nos dernières histoires : guides de style, produits phares, analyse approfondie de la durabilité et bien plus encore.</p></div>'),('fr',10,'Carrières','Rejoignez Amerce - postes ouverts, valeurs culturelles et avantages d\'équipe.','<div class=\"container py-5\"><h1>Recrutement chez Amerce</h1><p>Nous sommes une petite équipe distribuée construisant un modèle de vente au détail plus raffiné. Nous recrutons dans les domaines des produits, de l\'ingénierie, de la chaîne d\'approvisionnement et de l\'expérience client.</p><p>Les postes vacants sont publiés sur la page LinkedIn de l\'entreprise. Pour postuler, envoyez une courte lettre et un curriculum vitae à <a href=\"mailto:careers@amerce.test\">careers@amerce.test</a>.</p></div>'),('fr',11,'Sustainability','How Amerce sources responsibly and reduces its environmental footprint.','<div class=\"container py-5\"><h1>Développement durable en Amérique</h1><p>Chaque produit porte une histoire. Nous travaillons directement avec des usines et des ateliers d\'artisans, priorisons les matériaux recyclés et traçables et emballons sans plastique.</p><p>Notre objectif 2026 : 90 % des matériaux disposent d\'une chaîne d\'approvisionnement vérifiée et d\'un rapport d\'impact annuel transparent.</p></div>'),('fr',12,'Page d\'accueil','Amerce – abrite une expérience de commerce électronique polyvalente.','[hero-grid-asymmetric hero_image=\"section/banner-59.jpg\" hero_title=\"Pickleball : votre prochaine &lt;br&gt;Passion.\" hero_desc=\"Jusqu\'à 50 % de réduction sur les accessoires\" hero_button_text=\"Acheter maintenant\" hero_button_url=\"/products\" card_1_image=\"section/banner-60.jpg\" card_1_title=\"Outils de précision &lt;br&gt;Top Battle\" card_1_desc=\"Jusqu\'à 50 % de réduction sur les produits les plus vendus\" card_1_button_text=\"Acheter maintenant\" card_1_button_url=\"/products\" card_2_image=\"section/banner-61.jpg\" card_2_title=\"Performance ultime &lt;br&gt;Style ultime\" card_2_desc=\"Jusqu\'à 50 % de réduction sur les produits les plus vendus\" card_2_button_text=\"Acheter maintenant\" card_2_button_url=\"/products\"][/hero-grid-asymmetric]\n[site-features style=\"style-1\" compact=\"yes\" quantity=\"4\" icon_class_1=\"icon-ArrowUDownLeft\" title_1=\"Retour sous 14 jours\" description_1=\"Achetez sans risque avec une politique de retour simple.\" icon_class_2=\"icon-Package\" title_2=\"Livraison gratuite\" description_2=\"Pas de frais supplémentaires, juste le prix que vous voyez.\" icon_class_3=\"icon-Headset\" title_3=\"Assistance 24h/24 et 7j/7\" description_3=\"Assistance 24h/24 et 7j/7, toujours là pour vous.\" icon_class_4=\"icon-SealPercent\" title_4=\"Offres membres\" description_4=\"Prix ​​spécial pour les clients fidèles.\"][/site-features]\n[ecommerce-products style=\"style-slider\" title=\"La performance commence ici\" subtitle=\"Équipement de sport haut de gamme conçu pour la durabilité, le confort et les résultats.\" source=\"best-seller\" limit=\"8\" items_per_row=\"4\" grid_rows=\"2\" card_style=\"style-1\" product_wrapper_class=\"square\" pagination=\"2\" pagination_sm=\"2\" pagination_md=\"3\" pagination_lg=\"4\"][/ecommerce-products]\n[ecommerce-collections style=\"style-slider-overlay\" collection_ids=\"4,5,6\" limit=\"3\"][/ecommerce-collections]\n[tab-product-showcase title=\"Brûler aux pieds\" subtitle=\"Vitesse, confort, endurance, équilibre.\" view_all_url=\"/products\" view_all_text=\"Voir plus\" tab_1_label=\"Chaussures de course XT8\" tab_1_image=\"section/sport-tab-1.jpg\" tab_1_product_id=\"1\" tab_2_label=\"Chaussures de course Coussin 500\" tab_2_image=\"section/sport-tab-2.jpg\" tab_2_product_id=\"1\" tab_3_label=\"Chaussures de course Ekiden One\" tab_3_image=\"section/sport-tab-3.jpg\" tab_3_product_id=\"1\" tab_4_label=\"Chaussures de course JF190.1\" tab_4_image=\"section/sport-tab-4.jpg\" tab_4_product_id=\"1\"][/tab-product-showcase]\n[brand-logos style=\"style-infinite\" modifier_class=\"syle-3\" limit=\"6\"][/brand-logos]\n[lookbook-hotspot style=\"style-v3\" wide=\"yes\" image=\"lookbook/look-10.jpg\" image_2=\"lookbook/look-11.jpg\" quantity=\"2\" x_percent_1=\"39.5\" y_percent_1=\"27.2\" product_id_1=\"7\" column_1=\"1\" x_percent_2=\"34.5\" y_percent_2=\"48.2\" product_id_2=\"2\" column_2=\"2\"][/lookbook-hotspot]\n[product-feature-zoom style=\"style-3-pdp\" product_id=\"4\" detail_tag=\"Sports de raquette\" reviews_count=\"134\" urgency_text=\"18 produits vendus au cours des dernières 32 heures\" viewing_count=\"28\"][/product-feature-zoom]\n[testimonials style=\"style-v2-product\" card_type=\"style-8\" bg_main=\"yes\" title=\"Ce que disent les clients !\" subtitle=\"Les clients aiment nos produits et nous nous efforçons de leur plaire.\" autoplay=\"no\" limit=\"2\" testimonial_product_ids=\"8,2\"][/testimonials]\n[image-gallery style=\"style-default\" title=\"Faire du shopping sur Instagram\" subtitle=\"Connectez-vous avec nous sur toutes les plateformes pour rester informé des nouvelles informations sur les produits.\" quantity=\"5\" image_1=\"gallery/gallery-62.jpg\" link_1=\"/products\" image_2=\"gallery/gallery-63.jpg\" link_2=\"/products\" image_3=\"gallery/gallery-64.jpg\" link_3=\"/products\" image_4=\"gallery/gallery-65.jpg\" link_4=\"/products\" image_5=\"gallery/gallery-66.jpg\" link_5=\"/products\"][/image-gallery]'),('id',1,'Tentang','Memperkenalkan Amerce — kisah merek, standar pasokan, dan tim di balik setiap produk.','[page-banner heading=\"Tentang Kami\" subtitle=\"With over 15 years of experience, we craft timeless collections that transcend<br class=\\\"d-none d-lg-block\\\">trends and inspire lasting elegance.\"][/page-banner]\n[stats-counter hero_image=\"section/s-contact-1.jpg\" heading=\"Desain, perhatian terhadap detail dan efisiensi menyenangkan dunia\" description=\"Dari saat dirancang hingga dipakai, setiap produk kami mengikuti perjalanan ini. Kita bisa melakukannya dengan lebih cepat. Namun, di Amerce, kami memilih untuk menjaga semua orang yang melakukan perjalanan bersama kami.\" quantity=\"4\" value_1=\"8.2k\" animate_to_1=\"\" suffix_1=\"\" label_1=\"Produk yang Ada\" desc_1=\"Kami menawarkan berbagai produk berkualitas tinggi untuk memenuhi setiap kebutuhan.\" value_2=\"\" animate_to_2=\"10\" suffix_2=\"k\" label_2=\"Pelanggan yang Puas\" desc_2=\"Melayani lebih dari 10.000 pelanggan yang puas dan mempercayai kami untuk kualitas dan layanan.\" value_3=\"\" animate_to_3=\"96\" suffix_3=\"\" label_3=\"Merek Mitra\" desc_3=\"Kemitraan dengan merek terkemuka menghadirkan koleksi tepercaya ke toko dan rumah Anda.\" value_4=\"\" animate_to_4=\"16\" suffix_4=\"k\" label_4=\"Produk Dijual\" desc_4=\"Itu sebabnya kami berusaha menghadirkan beragam lini produk, cocok untuk setiap gaya.\"][/stats-counter]\n[image-accordion image=\"section/s-contact-2.jpg\" heading=\"Membawa Barang Langka dan Indah ke Seluruh Dunia\" quantity=\"4\" title_1=\"Memperkenalkan\" body_1=\"Selamat datang di Amerce Store, tujuan utama Anda untuk fashion dan aksesoris penentu tren. Kami bangga menawarkan koleksi barang langka dan indah yang dipilih dengan cermat yang dicari baik secara nasional maupun internasional.\" title_2=\"Visi kami\" body_2=\"Kami bertujuan untuk mewujudkan dunia di mana desain canggih berpadu dengan kehidupan sehari-hari — produk yang bertahan dalam ujian waktu, mitra yang tepercaya, dan pelanggan yang diperlakukan seperti manusia, bukan transaksi.\" title_3=\"Apa yang Membuat Perbedaan\" body_3=\"Pemasok diaudit secara independen, produk diuji secara manual, dan terdapat kebijakan pengembalian tanpa alasan selama 30 hari, yang didukung oleh tim layanan pelanggan khusus.\" title_4=\"Komitmen kami\" body_4=\"Produk berkualitas, rantai pasokan yang transparan, dan kondisi tenaga kerja yang adil — setiap pesanan, setiap saat.\"][/image-accordion]\n[about-testimonials heading=\"Apa Kata Pelanggan!\" subtitle=\"Pelanggan menyukai produk kami, dan kami berusaha menyenangkan mereka.\" quantity=\"2\" image_1=\"testimonials/tes-1.jpg\" name_1=\"Emma Collins\" text_1=\"\\\"Totally obsessed with this outfit! The fit is perfect, the fabric feels premium, and I\'ve been getting compliments non-stop. It instantly lifts my confidence — such a great find!\\\"\" image_2=\"testimonials/tes-2.jpg\" name_2=\"Sophia Ramirez\" text_2=\"\\\"I\'m amazed by how comfortable yet stylish this piece is. It pairs effortlessly with everything, and the quality really stands out. Definitely becoming my go-to for everyday looks!\\\"\"][/about-testimonials]\n[about-team heading=\"Temui Tim\" subtitle=\"Profesional yang berdedikasi pada kesempurnaan dalam setiap detail.\" quantity=\"4\" image_1=\"member/member-1.jpg\" name_1=\"Annette Hitam\" role_1=\"Pendiri/CEO\" social_links_1=\"\" image_2=\"member/member-2.jpg\" name_2=\"Brooklyn Simmons\" role_2=\"Mengelola\" social_links_2=\"\" image_3=\"member/member-3.jpg\" name_3=\"Jane Cooper\" role_3=\"Direktur Penjualan\" social_links_3=\"\" image_4=\"member/member-4.jpg\" name_4=\"Lisa Bonet\" role_4=\"Direktur Penjualan\" social_links_4=\"\"][/about-team]'),('id',2,'Kontak','Hubungi tim layanan pelanggan dan kerja sama Amerce.',''),('id',3,'FAQ','Pertanyaan yang sering diajukan tentang pesanan, pengiriman, pengembalian, dan manajemen akun.','[page-banner heading=\"Pertanyaan yang Sering Diajukan\" subtitle=\"Got questions? We\'ve got answers! Browse our Pertanyaan yang Sering Diajukan to find information on orders, shipping,<br class=\\\"d-none d-lg-block\\\">returns, and more. If you need further assistance, feel free to contact our team.\"][/page-banner]\n[faq-page sidebar_image=\"section/banner-12.jpg\" sidebar_title=\"Save 25% <br class=\\\"d-none d-sm-block\\\">Today\" sidebar_subtitle=\"T-Shirt, Hoodie, dan Lainnya\" sidebar_cta=\"Lihat Lebih Banyak\" sidebar_url=\"/products\" quantity=\"16\" category_1=\"Akun Saya\" category_id_1=\"myAccount\" question_1=\"1. Apa yang dapat saya lakukan jika saya lupa kata sandi?\" answer_1=\"Use the \\\"Forgot password\\\" link on the sign-in page. We will email you a one-time link to set a new password — it expires in 30 minutes for security.\" category_2=\"Akun Saya\" category_id_2=\"myAccount\" question_2=\"2. Bagaimana cara memperbarui alamat email?\" answer_2=\"Masuk, buka Akun → Pengaturan dan ubah bidang email. Kami akan mengirimkan email konfirmasi ke alamat baru; Perubahan akan berlaku ketika Anda mengeklik tautan itu.\" category_3=\"Akun Saya\" category_id_3=\"myAccount\" question_3=\"3. Bisakah saya menghapus akun saya?\" answer_3=\"Memiliki. Dari Akun → Pengaturan, gulir ke bawah ke Hapus akun. Kami menyimpan riwayat pesanan karena alasan pajak/hukum, tetapi informasi kontak pribadi akan dihapus dalam waktu 30 hari.\" category_4=\"Pemesanan & Belanja\" category_id_4=\"ordersPurchases\" question_4=\"1. Bagaimana cara memesannya?\" answer_4=\"Tambahkan produk ke keranjang, klik checkout, pilih metode pengiriman, lalu masukkan informasi pembayaran. Anda akan segera menerima email konfirmasi pesanan.\" category_5=\"Pemesanan & Belanja\" category_id_5=\"ordersPurchases\" question_5=\"2. Bisakah saya mengedit atau membatalkan pesanan saya?\" answer_5=\"Pesanan dapat diedit atau dibatalkan dari dasbor akun Anda dalam waktu 1 jam setelah penempatan. Setelah itu, gudang mulai berkemas dan kami tidak bisa campur tangan.\" category_6=\"Pemesanan & Belanja\" category_id_6=\"ordersPurchases\" question_6=\"3. Metode pembayaran apa yang diterima?\" answer_6=\"Kami menerima Visa, Mastercard, American Express, Apple Pay, Google Pay, dan PayPal. Semua transaksi menggunakan enkripsi TLS 1.3.\" category_7=\"Pengembalian & Pengembalian Dana\" category_id_7=\"returnsRefunds\" question_7=\"1. Berapa lama periode pengembaliannya?\" answer_7=\"30 hari sejak tanggal penerimaan untuk produk yang belum terpakai dan belum dipakai. Tidak berlaku untuk item sale, pakaian dalam, dan item flash sale penjualan akhir.\" category_8=\"Pengembalian & Pengembalian Dana\" category_id_8=\"returnsRefunds\" question_8=\"2. Bagaimana cara memulai proses pengembalian?\" answer_8=\"Open the order in your account dashboard and click \\\"Start return\\\". We email a prepaid label for domestic orders within one business day.\" category_9=\"Pengembalian & Pengembalian Dana\" category_id_9=\"returnsRefunds\" question_9=\"3. Kapan saya akan menerima pengembalian dana saya?\" answer_9=\"Pengembalian dana diproses dalam 3-5 hari kerja sejak kami menerima barang yang dikembalikan. Waktu kredit bank mungkin berbeda; Harap tunggu hingga 10 hari kerja agar pembayaran Anda terlihat.\" category_10=\"Pengiriman & Pelacakan\" category_id_10=\"shippingTracking\" question_10=\"1. Berapa lama waktu pengiriman?\" answer_10=\"Pengiriman domestik standar memakan waktu 3-5 hari kerja. Pengiriman cepat 1-2 hari. Pengiriman standar internasional memakan waktu 7-12 hari kerja; Opsi pengiriman yang dipercepat tersedia di halaman checkout.\" category_11=\"Pengiriman & Pelacakan\" category_id_11=\"shippingTracking\" question_11=\"2. Bagaimana cara melacak pesanan?\" answer_11=\"Tautan pelacakan disertakan dalam email konfirmasi pengiriman. Anda juga dapat melihat status dari Akun → Pesanan → Pelacakan.\" category_12=\"Pengiriman & Pelacakan\" category_id_12=\"shippingTracking\" question_12=\"3. Apakah Anda mengirim secara internasional?\" answer_12=\"Ya — di sebagian besar negara. Pajak dan biaya dibayar di muka di halaman checkout untuk tujuan tertentu; Jika tidak, unit pengiriman dapat mengambilnya pada saat pengiriman.\" category_13=\"Biaya & Pembayaran\" category_id_13=\"feesBilling\" question_13=\"1. Apakah sudah termasuk pajak dan biaya?\" answer_13=\"Harga domestik termasuk pajak penjualan yang ditunjukkan saat checkout. Pesanan internasional ke tujuan yang didukung sudah termasuk pajak dan biaya; Jika tidak, unit pengiriman akan mengambilnya pada saat pengiriman.\" category_14=\"Biaya & Pembayaran\" category_id_14=\"feesBilling\" question_14=\"2. Mengapa saya ditagih dua kali?\" answer_14=\"Anda mungkin melihat penangguhan otorisasi bersama dengan tagihan sebenarnya. Penangguhan akan otomatis dibatalkan dalam 3-5 hari kerja. Kirim email ke billing@amerce.test jika Anda masih melihat dua tagihan setelah waktu tersebut.\" category_15=\"Topik Lainnya\" category_id_15=\"otherTopic\" question_15=\"1. Apakah Anda memiliki toko fisik?\" answer_15=\"Ya — silakan kunjungi halaman Toko untuk melihat daftar toko dan mitra utama.\" category_16=\"Topik Lainnya\" category_id_16=\"otherTopic\" question_16=\"2. Bagaimana cara menghubungi layanan pelanggan?\" answer_16=\"Email hello@amerce.test atau gunakan formulir kontak. Kami akan merespons dalam satu hari kerja.\"][/faq-page]'),('id',4,'Kebijakan Privasi','Bagaimana Amerce mengumpulkan, menggunakan dan melindungi informasi pribadi Anda.','[page-banner heading=\"Kebijakan Privasi\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Informasi yang Kami Kumpulkan\" body_1=\"<p class=\\\"term-text cl-text-2\\\">When you visit the Site, we automatically collect certain information about your device — web browser, IP address, time zone, and some of the cookies installed on your device. As you browse, we also collect data about the pages or products you view, what referred you to the Site, and how you interact with it. We refer to this as \\\"Device Information\\\".</p><p class=\\\"term-text cl-text-2\\\">When you make a purchase or attempt to purchase through the Site, we collect your name, billing address, shipping address, and payment information (including card number, email address, and phone number). We refer to this as \\\"Order Information\\\".</p>\" title_2=\"2. Bagaimana Kami Menggunakan Informasi Anda\" body_2=\"<p class=\\\"term-text cl-text-2\\\">We use Order Information to fulfil orders placed through the Site (process payment, arrange shipping, provide invoices and order confirmations). We use it to communicate with you, screen orders for fraud, and — in line with your preferences — share marketing about products you may like.</p><p class=\\\"term-text cl-text-2\\\">We use Device Information to screen for fraud and to improve the Site through analytics about how customers browse and interact with us.</p>\" title_3=\"3. Berbagi Informasi Pribadi Anda\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We share Personal Information with third-party service providers who help us run the Site. We may also share information to comply with applicable laws, respond to a subpoena or lawful request, or otherwise protect our rights.</p>\" title_4=\"4. Penyimpanan Data\" body_4=\"<p class=\\\"term-text cl-text-2\\\">When you place an order, we maintain the Order Information for our records unless and until you ask us to delete it.</p>\" title_5=\"5. Hak Anda\" body_5=\"<p class=\\\"term-text cl-text-2\\\">You can request access, correction, or deletion of any personal data we hold about you. Email privacy@amerce.test from the address on file and we will respond within 30 days.</p>\" title_6=\"6. Kue\" body_6=\"<p class=\\\"term-text cl-text-2\\\">Cookies are used to keep your cart between visits, remember your preferences, and measure aggregate traffic. You can disable cookies in your browser, though some Site features may stop working.</p>\" title_7=\"7. Perubahan\" body_7=\"<p class=\\\"term-text cl-text-2\\\">We may update this policy from time to time to reflect changes to our practices or for operational, legal, or regulatory reasons. The latest version will always be on this page.</p>\"][/term-content]'),('id',5,'Syarat & Ketentuan','Ketentuan hukum berlaku saat Anda menggunakan toko Amerce.','[page-banner heading=\"Syarat & Ketentuan\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Penerimaan Persyaratan\" body_1=\"<p class=\\\"term-text cl-text-2\\\">By accessing or using the Mendenda store you agree to these terms. We reserve the right to update them with reasonable notice; the latest version is always available on this page.</p>\" title_2=\"2. Pemesanan & Pembayaran\" body_2=\"<p class=\\\"term-text cl-text-2\\\">All prices are in USD unless otherwise stated. We accept the payment methods displayed at checkout. An order becomes binding once you receive an order confirmation email.</p>\" title_3=\"3. Pengiriman\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Mengangkut options, lead times, and rates are listed on our Mengangkut page. Risk passes to you on delivery.</p>\" title_4=\"4. Pengembalian\" body_4=\"<p class=\\\"term-text cl-text-2\\\">You have 30 days from delivery to return any unworn item for a refund. See our Pengembalian &amp; Pengembalian Dana page for the full process.</p>\" title_5=\"5. Kekayaan Intelektual\" body_5=\"<p class=\\\"term-text cl-text-2\\\">All content on the Site — text, photography, logos, code — is owned by Mendenda or its licensors and may not be reproduced without written permission.</p>\" title_6=\"6. Batasan Tanggung Jawab\" body_6=\"<p class=\\\"term-text cl-text-2\\\">To the maximum extent permitted by law, Mendenda is not liable for indirect or consequential damages arising from use of the Site or the products purchased through it.</p>\" title_7=\"7. Hukum yang Berlaku\" body_7=\"<p class=\\\"term-text cl-text-2\\\">These terms are governed by the laws of the State of New York. Any dispute will be resolved in the state or federal courts located in New York County.</p>\"][/term-content]'),('id',6,'Pengembalian & Pengembalian Dana','Kebijakan pengembalian 30 hari kami dan proses pengembalian langkah demi langkah.','[page-banner heading=\"Pengembalian & Pengembalian Dana\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Pengembalian\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We want you to be completely satisfied with your purchase. If for any reason you are not, you may return any unworn item within 30 days of receiving your order for a refund or exchange. Barang must be in original packaging and the same condition as you received them.</p>\" title_2=\"2. Bagaimana Memulai Pengembalian\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Open the order in your account dashboard and click \\\"Start return\\\", or email returns@amerce.test with your order number. We will send a prepaid return label for domestic orders within one business day.</p>\" title_3=\"3. Pengembalian dana\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Refunds are processed within 3-5 business days of us receiving the return and applied to the original payment method. Bank posting times vary; allow up to 10 business days for the credit to appear.</p>\" title_4=\"4. Pengecualian\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Sale items, intimate apparel, and final-sale flash sale purchases are excluded from returns. Personalised or made-to-order items are also non-returnable unless faulty.</p>\" title_5=\"5. Produk Rusak atau Cacat\" body_5=\"<p class=\\\"term-text cl-text-2\\\">If your order arrives damaged or faulty, email us within 7 days with photos. We will replace the item or issue a full refund — including any return shipping cost — at our expense.</p>\" title_6=\"6. Pengembalian Internasional\" body_6=\"<p class=\\\"term-text cl-text-2\\\">International customers are responsible for return shipping unless the item is faulty. We do not refund original shipping or duty charges on international returns.</p>\"][/term-content]'),('id',7,'Pengiriman','Metode pengiriman domestik dan internasional, waktu dan biaya.','[page-banner heading=\"Mengangkut\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Metode Pengiriman\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We offer the following shipping methods for domestic and international orders: standard ground, expedited 2-day, and priority overnight (where available).</p>\" title_2=\"2. Biaya Domestik\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Standard ground is free on orders over $99. Express 1-2 day shipping is $19.99 flat. Priority overnight is calculated by weight at checkout.</p>\" title_3=\"3. Internasional\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We ship to most countries. International standard shipping is $24.99 with 7-12 business day delivery. Express options appear at checkout. Duties and taxes are pre-paid for select destinations; otherwise the courier collects them on delivery.</p>\" title_4=\"4. Waktu Pemrosesan\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Orders placed before 2pm EST on business days ship the same day. Orders placed after 2pm or on weekends/holidays ship the next business day.</p>\" title_5=\"5. Pelacakan\" body_5=\"<p class=\\\"term-text cl-text-2\\\">A tracking link is included in your shipment confirmation email. You can also see live status from Account → Orders → Track.</p>\" title_6=\"6. Pesanan Hilang atau Terjebak\" body_6=\"<p class=\\\"term-text cl-text-2\\\">If a tracking number has not updated for more than 7 business days, email shipping@amerce.test. We will open an investigation with the carrier and either refund or reship the order at our expense.</p>\"][/term-content]'),('id',8,'Toko kami','Kunjungi Amerce secara langsung — toko utama dan mitra di seluruh dunia.',''),('id',9,'Blog','Instruksi pakaian, cerita merek, dan konten di balik layar dari tim editorial Amerce.','<div class=\"container py-5\"><h1>Buku harian</h1><p>Jelajahi kisah terbaru kami — panduan gaya, sorotan produk, analisis keberlanjutan mendalam, dan banyak lagi.</p></div>'),('id',10,'Karir','Bergabunglah dengan Amerce — posisi terbuka, nilai budaya, dan keuntungan tim.','<div class=\"container py-5\"><h1>Rekrutmen Di Amerce</h1><p>Kami adalah tim kecil terdistribusi yang membangun model ritel yang lebih baik. Kami merekrut seluruh produk, teknik, rantai pasokan, dan pengalaman pelanggan.</p><p>Posisi terbuka diposting di halaman LinkedIn perusahaan. Untuk melamar, kirim surat pendek dan resume ke <a href=\"mailto:careers@amerce.test\">careers@amerce.test</a>.</p></div>'),('id',11,'Sustainability','How Amerce sources responsibly and reduces its environmental footprint.','<div class=\"container py-5\"><h1>Pembangunan Berkelanjutan di Amerika</h1><p>Setiap produk membawa cerita. Kami bekerja sama langsung dengan pabrik dan bengkel pengrajin, memprioritaskan bahan daur ulang dan dapat dilacak, serta mengemas bebas plastik.</p><p>Sasaran kami pada tahun 2026: 90% material memiliki rantai pasokan yang terverifikasi, dan pelaporan dampak tahunan yang transparan.</p></div>'),('id',12,'Beranda','Amerce — rumah bagi pengalaman e-commerce yang serbaguna.','[hero-grid-asymmetric hero_image=\"section/banner-59.jpg\" hero_title=\"Pickleball: &lt;br&gt;Gairah Anda Berikutnya.\" hero_desc=\"Diskon Hingga 50% untuk Aksesori\" hero_button_text=\"Beli Sekarang\" hero_button_url=\"/products\" card_1_image=\"section/banner-60.jpg\" card_1_title=\"Alat Presisi &lt;br&gt;Pertempuran Teratas\" card_1_desc=\"Diskon hingga 50% untuk produk terlaris\" card_1_button_text=\"Beli Sekarang\" card_1_button_url=\"/products\" card_2_image=\"section/banner-61.jpg\" card_2_title=\"Performa Tertinggi &lt;br&gt;Gaya Tertinggi\" card_2_desc=\"Diskon hingga 50% untuk produk terlaris\" card_2_button_text=\"Beli Sekarang\" card_2_button_url=\"/products\"][/hero-grid-asymmetric]\n[site-features style=\"style-1\" compact=\"yes\" quantity=\"4\" icon_class_1=\"icon-ArrowUDownLeft\" title_1=\"Kembali dalam 14 Hari\" description_1=\"Berbelanja bebas risiko dengan kebijakan pengembalian yang mudah.\" icon_class_2=\"icon-Package\" title_2=\"Pengiriman Gratis\" description_2=\"Tidak ada biaya tambahan, hanya harga yang Anda lihat.\" icon_class_3=\"icon-Headset\" title_3=\"Dukungan 24/7\" description_3=\"Dukungan 24/7, selalu siap membantu Anda.\" icon_class_4=\"icon-SealPercent\" title_4=\"Penawaran Anggota\" description_4=\"Harga spesial untuk pelanggan setia.\"][/site-features]\n[ecommerce-products style=\"style-slider\" title=\"Kinerja Dimulai Di Sini\" subtitle=\"Perlengkapan olahraga premium dibuat untuk ketahanan, kenyamanan, dan hasil.\" source=\"best-seller\" limit=\"8\" items_per_row=\"4\" grid_rows=\"2\" card_style=\"style-1\" product_wrapper_class=\"square\" pagination=\"2\" pagination_sm=\"2\" pagination_md=\"3\" pagination_lg=\"4\"][/ecommerce-products]\n[ecommerce-collections style=\"style-slider-overlay\" collection_ids=\"4,5,6\" limit=\"3\"][/ecommerce-collections]\n[tab-product-showcase title=\"Terbakar Di Kaki\" subtitle=\"Kecepatan, kenyamanan, daya tahan, keseimbangan.\" view_all_url=\"/products\" view_all_text=\"Lihat Lebih Banyak\" tab_1_label=\"Sepatu Lari XT8\" tab_1_image=\"section/sport-tab-1.jpg\" tab_1_product_id=\"1\" tab_2_label=\"Bantalan 500 Sepatu Lari\" tab_2_image=\"section/sport-tab-2.jpg\" tab_2_product_id=\"1\" tab_3_label=\"Sepatu Lari Ekiden One\" tab_3_image=\"section/sport-tab-3.jpg\" tab_3_product_id=\"1\" tab_4_label=\"Sepatu Lari JF190.1\" tab_4_image=\"section/sport-tab-4.jpg\" tab_4_product_id=\"1\"][/tab-product-showcase]\n[brand-logos style=\"style-infinite\" modifier_class=\"syle-3\" limit=\"6\"][/brand-logos]\n[lookbook-hotspot style=\"style-v3\" wide=\"yes\" image=\"lookbook/look-10.jpg\" image_2=\"lookbook/look-11.jpg\" quantity=\"2\" x_percent_1=\"39.5\" y_percent_1=\"27.2\" product_id_1=\"7\" column_1=\"1\" x_percent_2=\"34.5\" y_percent_2=\"48.2\" product_id_2=\"2\" column_2=\"2\"][/lookbook-hotspot]\n[product-feature-zoom style=\"style-3-pdp\" product_id=\"4\" detail_tag=\"Olahraga Raket\" reviews_count=\"134\" urgency_text=\"18 produk terjual dalam 32 jam terakhir\" viewing_count=\"28\"][/product-feature-zoom]\n[testimonials style=\"style-v2-product\" card_type=\"style-8\" bg_main=\"yes\" title=\"Apa Kata Pelanggan!\" subtitle=\"Pelanggan menyukai produk kami, dan kami berusaha menyenangkan mereka.\" autoplay=\"no\" limit=\"2\" testimonial_product_ids=\"8,2\"][/testimonials]\n[image-gallery style=\"style-default\" title=\"Belanja Di Instagram\" subtitle=\"Terhubung dengan kami di semua platform untuk mendapatkan informasi produk baru.\" quantity=\"5\" image_1=\"gallery/gallery-62.jpg\" link_1=\"/products\" image_2=\"gallery/gallery-63.jpg\" link_2=\"/products\" image_3=\"gallery/gallery-64.jpg\" link_3=\"/products\" image_4=\"gallery/gallery-65.jpg\" link_4=\"/products\" image_5=\"gallery/gallery-66.jpg\" link_5=\"/products\"][/image-gallery]'),('tr',1,'Hakkında','Amerce ile tanışın - marka hikayesi, tedarik standartları ve her ürünün arkasındaki ekip.','[page-banner heading=\"Hakkımızda\" subtitle=\"With over 15 years of experience, we craft timeless collections that transcend<br class=\\\"d-none d-lg-block\\\">trends and inspire lasting elegance.\"][/page-banner]\n[stats-counter hero_image=\"section/s-contact-1.jpg\" heading=\"Tasarım, detaylara verilen önem ve verimlilik dünyayı memnun ediyor\" description=\"Tasarlandığı andan giyildiği ana kadar her ürünümüz bu yolculuğu takip ediyor. Bunu daha hızlı bir şekilde yapabiliriz. Ancak Amerce olarak bu yolculukta bizimle birlikte olan herkesle ilgilenmeyi seçiyoruz.\" quantity=\"4\" value_1=\"8.2k\" animate_to_1=\"\" suffix_1=\"\" label_1=\"Mevcut Ürünler\" desc_1=\"Her türlü ihtiyacı karşılamak için yüksek kaliteli ürünler sunuyoruz.\" value_2=\"\" animate_to_2=\"10\" suffix_2=\"k\" label_2=\"Memnun Müşteriler\" desc_2=\"Kalite ve hizmet konusunda bize güvenen 10.000\'den fazla memnun müşteriye hizmet veriyoruz.\" value_3=\"\" animate_to_3=\"96\" suffix_3=\"\" label_3=\"İş Ortağı Markası\" desc_3=\"Önde gelen markalarla yapılan ortaklıklar, güvenilir koleksiyonları mağazanıza ve evinize getirir.\" value_4=\"\" animate_to_4=\"16\" suffix_4=\"k\" label_4=\"Satılık Ürünler\" desc_4=\"Bu nedenle her tarza uygun çeşitli ürün grupları sunmaya çalışıyoruz.\"][/stats-counter]\n[image-accordion image=\"section/s-contact-2.jpg\" heading=\"Nadir ve Enfes Ürünleri Dünya Çapına Getiriyoruz\" quantity=\"4\" title_1=\"Tanıtmak\" body_1=\"Trend belirleyen moda ve aksesuarlar için ilk adresiniz olan Amerce Store\'a hoş geldiniz. Hem ulusal hem de uluslararası alanda aranan, nadir ve seçkin parçalardan özenle seçilmiş bir koleksiyon sunmaktan gurur duyuyoruz.\" title_2=\"Vizyonumuz\" body_2=\"Sofistike tasarımın günlük yaşamla harmanlandığı bir dünyayı hedefliyoruz; zamana karşı dayanıklı ürünler, güvenilen ortaklar ve işlem değil, insan gibi davranılan müşteriler.\" title_3=\"Farkı Yaratan Nedir?\" body_3=\"Tedarikçiler bağımsız olarak denetlenir, ürünler elle test edilir ve özel bir müşteri hizmetleri ekibi tarafından desteklenen 30 günlük sebepsiz iade politikası vardır.\" title_4=\"Taahhüdümüz\" body_4=\"Kaliteli ürünler, şeffaf tedarik zincirleri ve adil çalışma koşulları - her siparişte, her zaman.\"][/image-accordion]\n[about-testimonials heading=\"Müşteriler Ne Diyor?\" subtitle=\"Müşterilerimiz ürünlerimizi seviyor ve biz de onları memnun etmeye çalışıyoruz.\" quantity=\"2\" image_1=\"testimonials/tes-1.jpg\" name_1=\"Emma Collins\" text_1=\"\\\"Totally obsessed with this outfit! The fit is perfect, the fabric feels premium, and I\'ve been getting compliments non-stop. It instantly lifts my confidence — such a great find!\\\"\" image_2=\"testimonials/tes-2.jpg\" name_2=\"Sofya Ramirez\" text_2=\"\\\"I\'m amazed by how comfortable yet stylish this piece is. It pairs effortlessly with everything, and the quality really stands out. Definitely becoming my go-to for everyday looks!\\\"\"][/about-testimonials]\n[about-team heading=\"Ekiple Tanışın\" subtitle=\"Her ayrıntıda mükemmelliğe kendini adamış profesyoneller.\" quantity=\"4\" image_1=\"member/member-1.jpg\" name_1=\"Annette Siyah\" role_1=\"Kurucu/CEO\" social_links_1=\"\" image_2=\"member/member-2.jpg\" name_2=\"Brooklyn Simmons\" role_2=\"Üstesinden gelmek\" social_links_2=\"\" image_3=\"member/member-3.jpg\" name_3=\"Jane Cooper\" role_3=\"Satış Direktörü\" social_links_3=\"\" image_4=\"member/member-4.jpg\" name_4=\"Lisa Bonet\" role_4=\"Satış Direktörü\" social_links_4=\"\"][/about-team]'),('tr',2,'Temas etmek','Amerce\'in müşteri hizmetleri ve işbirliği ekibiyle iletişime geçin.',''),('tr',3,'FAQ','Siparişler, gönderim, iadeler ve hesap yönetimi hakkında sık sorulan sorular.','[page-banner heading=\"Sıkça Sorulan Sorular\" subtitle=\"Got questions? We\'ve got answers! Browse our Sıkça Sorulan Sorular to find information on orders, shipping,<br class=\\\"d-none d-lg-block\\\">returns, and more. If you need further assistance, feel free to contact our team.\"][/page-banner]\n[faq-page sidebar_image=\"section/banner-12.jpg\" sidebar_title=\"Save 25% <br class=\\\"d-none d-sm-block\\\">Today\" sidebar_subtitle=\"Tişörtler, Kapüşonlular ve Daha Fazlası\" sidebar_cta=\"Daha Fazlasını Gör\" sidebar_url=\"/products\" quantity=\"16\" category_1=\"Hesabım\" category_id_1=\"myAccount\" question_1=\"1. Şifremi unutursam ne yapabilirim?\" answer_1=\"Use the \\\"Forgot password\\\" link on the sign-in page. We will email you a one-time link to set a new password — it expires in 30 minutes for security.\" category_2=\"Hesabım\" category_id_2=\"myAccount\" question_2=\"2. E-posta adresi nasıl güncellenir?\" answer_2=\"Oturum açın, Hesap → Ayarlar\'ı açın ve e-posta alanlarını değiştirin. Yeni adrese bir onay e-postası göndereceğiz; Bu bağlantıya tıkladığınızda değişiklik geçerli olacaktır.\" category_3=\"Hesabım\" category_id_3=\"myAccount\" question_3=\"3. Hesabımı silebilir miyim?\" answer_3=\"Sahip olmak. Hesap → Ayarlar\'dan Hesabı sil seçeneğine ilerleyin. Sipariş geçmişini vergi/yasal nedenlerden dolayı saklıyoruz ancak kişisel iletişim bilgileri 30 gün içinde silinir.\" category_4=\"Siparişler ve Alışveriş\" category_id_4=\"ordersPurchases\" question_4=\"1. Nasıl sipariş verilir?\" answer_4=\"Ürünleri sepete ekleyin, ödeme seçeneğini tıklayın, gönderim yöntemini seçin ve ardından ödeme bilgilerini girin. Hemen bir sipariş onay e-postası alacaksınız.\" category_5=\"Siparişler ve Alışveriş\" category_id_5=\"ordersPurchases\" question_5=\"2. Siparişimi düzenleyebilir veya iptal edebilir miyim?\" answer_5=\"Siparişler, verildikten sonraki 1 saat içinde hesap kontrol panelinizden düzenlenebilir veya iptal edilebilir. Daha sonra depo toplanmaya başladı ve biz müdahale edemedik.\" category_6=\"Siparişler ve Alışveriş\" category_id_6=\"ordersPurchases\" question_6=\"3. Hangi ödeme yöntemleri kabul ediliyor?\" answer_6=\"Visa, Mastercard, American Express, Apple Pay, Google Pay ve PayPal\'ı kabul ediyoruz. Tüm işlemlerde TLS 1.3 şifrelemesi kullanılır.\" category_7=\"İade ve Para İadeleri\" category_id_7=\"returnsRefunds\" question_7=\"1. İade süresi ne kadardır?\" answer_7=\"Kullanılmamış ve giyilmemiş ürünler için teslim tarihinden itibaren 30 gün. İndirimli ürünler, iç giyim ve son indirim flaş indirim ürünleri için geçerli değildir.\" category_8=\"İade ve Para İadeleri\" category_id_8=\"returnsRefunds\" question_8=\"2. İade sürecini nasıl başlatabilirim?\" answer_8=\"Open the order in your account dashboard and click \\\"Start return\\\". We email a prepaid label for domestic orders within one business day.\" category_9=\"İade ve Para İadeleri\" category_id_9=\"returnsRefunds\" question_9=\"3. Geri ödememi ne zaman alacağım?\" answer_9=\"Geri ödemeler, iade edilen ürünün tarafımıza ulaşmasından itibaren 3-5 iş günü içerisinde gerçekleştirilir. Banka kredi süreleri değişiklik gösterebilir; Ödemenizin yansıtıldığını görmek için lütfen 10 iş gününe kadar bekleyin.\" category_10=\"Nakliye ve Takip\" category_id_10=\"shippingTracking\" question_10=\"1. Nakliye ne kadar sürer?\" answer_10=\"Standart yurt içi kargo 3-5 iş günü sürmektedir. Hızlı kargo 1-2 gün. Uluslararası standart nakliye 7-12 iş günü sürer; Ödeme sayfasında hızlandırılmış gönderim seçenekleri mevcuttur.\" category_11=\"Nakliye ve Takip\" category_id_11=\"shippingTracking\" question_11=\"2. Siparişler nasıl takip edilir?\" answer_11=\"Takip bağlantısı gönderim onayı e-postasına dahildir. Durumu Hesap → Siparişler → Takip bölümünden de görüntüleyebilirsiniz.\" category_12=\"Nakliye ve Takip\" category_id_12=\"shippingTracking\" question_12=\"3. Uluslararası gönderim yapıyor musunuz?\" answer_12=\"Evet — çoğu ülkeye. Belirli destinasyonlar için vergi ve harçlar ödeme sayfasında önceden ödenir; Aksi takdirde nakliye birimi teslimat sırasında ürünü teslim alabilir.\" category_13=\"Ücretler ve Ödemeler\" category_id_13=\"feesBilling\" question_13=\"1. Vergi ve harçlar dahil mi?\" answer_13=\"Yurt içi fiyatlara ödeme sırasında gösterilen satış vergisi dahildir. Desteklenen varış noktalarına verilen uluslararası siparişlere vergiler ve harçlar dahildir; Aksi takdirde kargo birimi teslimat sırasında ürünü teslim alacaktır.\" category_14=\"Ücretler ve Ödemeler\" category_id_14=\"feesBilling\" question_14=\"2. Neden iki kez ücretlendirildim?\" answer_14=\"Gerçek ödemeyle birlikte bir provizyon bekletmesi görüyor olabilirsiniz. Durdurma 3-5 iş günü içinde otomatik olarak iptal edilecektir. Bu sürenin sonunda hala iki ödeme görüyorsanız billing@amerce.test adresine e-posta gönderin.\" category_15=\"Diğer Konular\" category_id_15=\"otherTopic\" question_15=\"1. Fiziksel bir mağazanız var mı?\" answer_15=\"Evet — önemli mağazaların ve iş ortaklarının listesi için lütfen Mağazalar sayfasını ziyaret edin.\" category_16=\"Diğer Konular\" category_id_16=\"otherTopic\" question_16=\"2. Müşteri hizmetleriyle nasıl iletişime geçilir?\" answer_16=\"hello@amerce.test adresine e-posta gönderin veya iletişim formunu kullanın. Bir iş günü içinde yanıt vereceğiz.\"][/faq-page]'),('tr',4,'Gizlilik Politikası','Amerce kişisel bilgilerinizi nasıl toplar, kullanır ve korur.','[page-banner heading=\"Gizlilik Politikası\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Topladığımız Bilgiler\" body_1=\"<p class=\\\"term-text cl-text-2\\\">When you visit the Site, we automatically collect certain information about your device — web browser, IP address, time zone, and some of the cookies installed on your device. As you browse, we also collect data about the pages or products you view, what referred you to the Site, and how you interact with it. We refer to this as \\\"Device Information\\\".</p><p class=\\\"term-text cl-text-2\\\">When you make a purchase or attempt to purchase through the Site, we collect your name, billing address, shipping address, and payment information (including card number, email address, and phone number). We refer to this as \\\"Order Information\\\".</p>\" title_2=\"2. Bilgilerinizi Nasıl Kullanıyoruz\" body_2=\"<p class=\\\"term-text cl-text-2\\\">We use Order Information to fulfil orders placed through the Site (process payment, arrange shipping, provide invoices and order confirmations). We use it to communicate with you, screen orders for fraud, and — in line with your preferences — share marketing about products you may like.</p><p class=\\\"term-text cl-text-2\\\">We use Device Information to screen for fraud and to improve the Site through analytics about how customers browse and interact with us.</p>\" title_3=\"3. Kişisel Bilgilerinizin Paylaşılması\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We share Personal Information with third-party service providers who help us run the Site. We may also share information to comply with applicable laws, respond to a subpoena or lawful request, or otherwise protect our rights.</p>\" title_4=\"4. Veri Depolama\" body_4=\"<p class=\\\"term-text cl-text-2\\\">When you place an order, we maintain the Order Information for our records unless and until you ask us to delete it.</p>\" title_5=\"5. Haklarınız\" body_5=\"<p class=\\\"term-text cl-text-2\\\">You can request access, correction, or deletion of any personal data we hold about you. Email privacy@amerce.test from the address on file and we will respond within 30 days.</p>\" title_6=\"6. Çerezler\" body_6=\"<p class=\\\"term-text cl-text-2\\\">Cookies are used to keep your cart between visits, remember your preferences, and measure aggregate traffic. You can disable cookies in your browser, though some Site features may stop working.</p>\" title_7=\"7. Değişim\" body_7=\"<p class=\\\"term-text cl-text-2\\\">We may update this policy from time to time to reflect changes to our practices or for operational, legal, or regulatory reasons. The latest version will always be on this page.</p>\"][/term-content]'),('tr',5,'Şartlar ve Koşullar','Amerce mağazasını kullandığınızda yasal şartlar geçerlidir.','[page-banner heading=\"Şartlar ve Koşullar\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Şartların Kabulü\" body_1=\"<p class=\\\"term-text cl-text-2\\\">By accessing or using the Amerika store you agree to these terms. We reserve the right to update them with reasonable notice; the latest version is always available on this page.</p>\" title_2=\"2. Siparişler ve Ödeme\" body_2=\"<p class=\\\"term-text cl-text-2\\\">All prices are in USD unless otherwise stated. We accept the payment methods displayed at checkout. An order becomes binding once you receive an order confirmation email.</p>\" title_3=\"3. Nakliye\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Taşıma options, lead times, and rates are listed on our Taşıma page. Risk passes to you on delivery.</p>\" title_4=\"4. İade\" body_4=\"<p class=\\\"term-text cl-text-2\\\">You have 30 days from delivery to return any unworn item for a refund. See our İade ve Para İadeleri page for the full process.</p>\" title_5=\"5. Fikri Mülkiyet\" body_5=\"<p class=\\\"term-text cl-text-2\\\">All content on the Site — text, photography, logos, code — is owned by Amerika or its licensors and may not be reproduced without written permission.</p>\" title_6=\"6. Sorumluluğun Sınırlandırılması\" body_6=\"<p class=\\\"term-text cl-text-2\\\">To the maximum extent permitted by law, Amerika is not liable for indirect or consequential damages arising from use of the Site or the products purchased through it.</p>\" title_7=\"7. Geçerli Kanun\" body_7=\"<p class=\\\"term-text cl-text-2\\\">These terms are governed by the laws of the State of New York. Any dispute will be resolved in the state or federal courts located in New York County.</p>\"][/term-content]'),('tr',6,'İade ve Para İadeleri','30 günlük iade politikamız ve adım adım iade sürecimiz.','[page-banner heading=\"İade ve Para İadeleri\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. İade\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We want you to be completely satisfied with your purchase. If for any reason you are not, you may return any unworn item within 30 days of receiving your order for a refund or exchange. Öğeler must be in original packaging and the same condition as you received them.</p>\" title_2=\"2. İade Nasıl Başlatılır\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Open the order in your account dashboard and click \\\"Start return\\\", or email returns@amerce.test with your order number. We will send a prepaid return label for domestic orders within one business day.</p>\" title_3=\"3. İade\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Refunds are processed within 3-5 business days of us receiving the return and applied to the original payment method. Bank posting times vary; allow up to 10 business days for the credit to appear.</p>\" title_4=\"4. İstisnalar\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Sale items, intimate apparel, and final-sale flash sale purchases are excluded from returns. Personalised or made-to-order items are also non-returnable unless faulty.</p>\" title_5=\"5. Hasarlı veya Arızalı Ürünler\" body_5=\"<p class=\\\"term-text cl-text-2\\\">If your order arrives damaged or faulty, email us within 7 days with photos. We will replace the item or issue a full refund — including any return shipping cost — at our expense.</p>\" title_6=\"6. Uluslararası İadeler\" body_6=\"<p class=\\\"term-text cl-text-2\\\">International customers are responsible for return shipping unless the item is faulty. We do not refund original shipping or duty charges on international returns.</p>\"][/term-content]'),('tr',7,'Nakliye','Yurt içi ve yurt dışı gönderim yöntemleri, süreleri ve ücretleri.','[page-banner heading=\"Taşıma\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Nakliye Yöntemi\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We offer the following shipping methods for domestic and international orders: standard ground, expedited 2-day, and priority overnight (where available).</p>\" title_2=\"2. Yurtiçi Ücretler\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Standard ground is free on orders over $99. Express 1-2 day shipping is $19.99 flat. Priority overnight is calculated by weight at checkout.</p>\" title_3=\"3. Uluslararası\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We ship to most countries. International standard shipping is $24.99 with 7-12 business day delivery. Express options appear at checkout. Duties and taxes are pre-paid for select destinations; otherwise the courier collects them on delivery.</p>\" title_4=\"4. İşlem Süresi\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Orders placed before 2pm EST on business days ship the same day. Orders placed after 2pm or on weekends/holidays ship the next business day.</p>\" title_5=\"5. Takip\" body_5=\"<p class=\\\"term-text cl-text-2\\\">A tracking link is included in your shipment confirmation email. You can also see live status from Account → Orders → Track.</p>\" title_6=\"6. Kayıp veya Takılan Siparişler\" body_6=\"<p class=\\\"term-text cl-text-2\\\">If a tracking number has not updated for more than 7 business days, email shipping@amerce.test. We will open an investigation with the carrier and either refund or reship the order at our expense.</p>\"][/term-content]'),('tr',8,'Mağazalarımız','Amerce\'i doğrudan ziyaret edin; dünya çapındaki amiral mağazaları ve ortakları.',''),('tr',9,'Blog','Amerce editör ekibinden kıyafet talimatları, marka hikayeleri ve kamera arkası içerikleri.','<div class=\"container py-5\"><h1>Günlük</h1><p>Stil kılavuzları, öne çıkan ürünler, derinlemesine sürdürülebilirlik analizi ve daha fazlasını içeren en son hikayelerimizi keşfedin.</p></div>'),('tr',10,'Kariyer','Amerce\'e katılın — açık pozisyonlar, kültürel değerler ve takım avantajları.','<div class=\"container py-5\"><h1>Amerce\'de İşe Alım</h1><p>Biz daha rafine bir perakende modeli inşa eden küçük, dağınık bir ekibiz. Ürün, mühendislik, tedarik zinciri ve müşteri deneyimi genelinde işe alım yapıyoruz.</p><p>Açık pozisyonlar şirketin LinkedIn sayfasında yayınlanmaktadır. Başvurmak için <a href=\"mailto:careers@amerce.test\">careers@amerce.test</a> adresine kısa bir mektup ve özgeçmiş gönderin.</p></div>'),('tr',11,'Sustainability','How Amerce sources responsibly and reduces its environmental footprint.','<div class=\"container py-5\"><h1>Amerika\'da Sürdürülebilir Kalkınma</h1><p>Her ürün bir hikaye taşır. Doğrudan fabrikalar ve zanaatkar atölyeleriyle çalışıyoruz, geri dönüştürülmüş ve izlenebilir malzemelere öncelik veriyoruz ve plastik içermeyen ambalajlar yapıyoruz.</p><p>2026 hedefimiz: Malzemelerin %90\'ının doğrulanmış bir tedarik zincirine ve şeffaf yıllık etki raporlamasına sahip olması.</p></div>'),('tr',12,'Ana sayfa','Amerce — çok yönlü bir e-ticaret deneyimine ev sahipliği yapıyor.','[hero-grid-asymmetric hero_image=\"section/banner-59.jpg\" hero_title=\"Pickleball: Bir Sonraki &lt;br&gt;Tutkunuz.\" hero_desc=\"Aksesuarlarda %50\'ye Varan İndirim\" hero_button_text=\"Şimdi al\" hero_button_url=\"/products\" card_1_image=\"section/banner-60.jpg\" card_1_title=\"Hassas Aletler &lt;br&gt;En İyi Savaş\" card_1_desc=\"En çok satan ürünlerde %50\'ye varan indirim\" card_1_button_text=\"Şimdi al\" card_1_button_url=\"/products\" card_2_image=\"section/banner-61.jpg\" card_2_title=\"Üstün Performans &lt;br&gt;Üstün Stil\" card_2_desc=\"En çok satan ürünlerde %50\'ye varan indirim\" card_2_button_text=\"Şimdi al\" card_2_button_url=\"/products\"][/hero-grid-asymmetric]\n[site-features style=\"style-1\" compact=\"yes\" quantity=\"4\" icon_class_1=\"icon-ArrowUDownLeft\" title_1=\"14 Gün İçinde İade\" description_1=\"Kolay iade politikasıyla risksiz alışveriş yapın.\" icon_class_2=\"icon-Package\" title_2=\"Ücretsiz Kargo\" description_2=\"Hiçbir ek ücret yok, yalnızca gördüğünüz fiyat.\" icon_class_3=\"icon-Headset\" title_3=\"7/24 Destek\" description_3=\"7/24 destek, her zaman yanınızda.\" icon_class_4=\"icon-SealPercent\" title_4=\"Üye Teklifleri\" description_4=\"Sadık müşteriler için özel fiyat.\"][/site-features]\n[ecommerce-products style=\"style-slider\" title=\"Performans Burada Başlıyor\" subtitle=\"Dayanıklılık, konfor ve sonuç için tasarlanmış birinci sınıf spor ekipmanı.\" source=\"best-seller\" limit=\"8\" items_per_row=\"4\" grid_rows=\"2\" card_style=\"style-1\" product_wrapper_class=\"square\" pagination=\"2\" pagination_sm=\"2\" pagination_md=\"3\" pagination_lg=\"4\"][/ecommerce-products]\n[ecommerce-collections style=\"style-slider-overlay\" collection_ids=\"4,5,6\" limit=\"3\"][/ecommerce-collections]\n[tab-product-showcase title=\"Ayaklarda Yanma\" subtitle=\"Hız, konfor, dayanıklılık, denge.\" view_all_url=\"/products\" view_all_text=\"Daha Fazlasını Gör\" tab_1_label=\"XT8 Koşu Ayakkabısı\" tab_1_image=\"section/sport-tab-1.jpg\" tab_1_product_id=\"1\" tab_2_label=\"Cushion 500 Koşu Ayakkabısı\" tab_2_image=\"section/sport-tab-2.jpg\" tab_2_product_id=\"1\" tab_3_label=\"Ekiden One Koşu Ayakkabısı\" tab_3_image=\"section/sport-tab-3.jpg\" tab_3_product_id=\"1\" tab_4_label=\"JF190.1 Koşu Ayakkabısı\" tab_4_image=\"section/sport-tab-4.jpg\" tab_4_product_id=\"1\"][/tab-product-showcase]\n[brand-logos style=\"style-infinite\" modifier_class=\"syle-3\" limit=\"6\"][/brand-logos]\n[lookbook-hotspot style=\"style-v3\" wide=\"yes\" image=\"lookbook/look-10.jpg\" image_2=\"lookbook/look-11.jpg\" quantity=\"2\" x_percent_1=\"39.5\" y_percent_1=\"27.2\" product_id_1=\"7\" column_1=\"1\" x_percent_2=\"34.5\" y_percent_2=\"48.2\" product_id_2=\"2\" column_2=\"2\"][/lookbook-hotspot]\n[product-feature-zoom style=\"style-3-pdp\" product_id=\"4\" detail_tag=\"Raket Sporları\" reviews_count=\"134\" urgency_text=\"Son 32 saatte 18 ürün satıldı\" viewing_count=\"28\"][/product-feature-zoom]\n[testimonials style=\"style-v2-product\" card_type=\"style-8\" bg_main=\"yes\" title=\"Müşteriler Ne Diyor?\" subtitle=\"Müşterilerimiz ürünlerimizi seviyor ve biz de onları memnun etmeye çalışıyoruz.\" autoplay=\"no\" limit=\"2\" testimonial_product_ids=\"8,2\"][/testimonials]\n[image-gallery style=\"style-default\" title=\"Instagram\'da Alışveriş\" subtitle=\"Yeni ürün bilgilerinden haberdar olmak için tüm platformlarda bizimle bağlantı kurun.\" quantity=\"5\" image_1=\"gallery/gallery-62.jpg\" link_1=\"/products\" image_2=\"gallery/gallery-63.jpg\" link_2=\"/products\" image_3=\"gallery/gallery-64.jpg\" link_3=\"/products\" image_4=\"gallery/gallery-65.jpg\" link_4=\"/products\" image_5=\"gallery/gallery-66.jpg\" link_5=\"/products\"][/image-gallery]'),('vi',1,'Giới thiệu','Giới thiệu Amerce — câu chuyện thương hiệu, tiêu chuẩn nguồn cung và đội ngũ đứng sau từng sản phẩm.','[page-banner heading=\"Về Chúng Tôi\" subtitle=\"With over 15 years of experience, we craft timeless collections that transcend<br class=\\\"d-none d-lg-block\\\">trends and inspire lasting elegance.\"][/page-banner]\n[stats-counter hero_image=\"section/s-contact-1.jpg\" heading=\"Thiết kế, sự tỉ mỉ trong từng chi tiết và hiệu quả làm hài lòng thế giới\" description=\"Từ khoảnh khắc được hình thành đến khi được khoác lên người, mỗi sản phẩm của chúng tôi đều đi theo hành trình này. Chúng tôi có thể làm điều đó với tốc độ nhanh hơn. Tuy nhiên, tại Amerce, chúng tôi chọn chăm sóc tất cả những ai đang đồng hành cùng chúng tôi trên hành trình này.\" quantity=\"4\" value_1=\"8.2k\" animate_to_1=\"\" suffix_1=\"\" label_1=\"Sản Phẩm Hiện Có\" desc_1=\"Chúng tôi cung cấp đa dạng sản phẩm chất lượng cao để đáp ứng mọi nhu cầu.\" value_2=\"\" animate_to_2=\"10\" suffix_2=\"k\" label_2=\"Khách Hàng Hài Lòng\" desc_2=\"Phục vụ hơn 10.000 khách hàng hài lòng tin tưởng chúng tôi về chất lượng và dịch vụ.\" value_3=\"\" animate_to_3=\"96\" suffix_3=\"\" label_3=\"Thương Hiệu Đối Tác\" desc_3=\"Quan hệ đối tác với các thương hiệu hàng đầu mang đến bộ sưu tập đáng tin cậy cho cửa hàng và ngôi nhà của bạn.\" value_4=\"\" animate_to_4=\"16\" suffix_4=\"k\" label_4=\"Sản Phẩm Đang Bán\" desc_4=\"Đó là lý do chúng tôi nỗ lực mang đến nhiều dòng sản phẩm đa dạng, phù hợp với mọi phong cách.\"][/stats-counter]\n[image-accordion image=\"section/s-contact-2.jpg\" heading=\"Mang Đến Những Món Đồ Quý Hiếm Và Tinh Tế Trên Toàn Thế Giới\" quantity=\"4\" title_1=\"Giới Thiệu\" body_1=\"Chào mừng đến với Cửa hàng Amerce, điểm đến hàng đầu cho thời trang và phụ kiện đi đầu xu hướng. Chúng tôi tự hào mang đến bộ sưu tập được tuyển chọn kỹ lưỡng những món đồ quý hiếm và tinh tế được tìm kiếm cả trong nước lẫn quốc tế.\" title_2=\"Tầm Nhìn Của Chúng Tôi\" body_2=\"Chúng tôi hướng đến một thế giới nơi thiết kế tinh tế hòa quyện cùng cuộc sống thường ngày — những sản phẩm bền đẹp theo thời gian, những đối tác đáng tin cậy, và những khách hàng được đối xử như con người, không phải giao dịch.\" title_3=\"Điều Làm Nên Sự Khác Biệt\" body_3=\"Nhà cung cấp được kiểm toán độc lập, sản phẩm được kiểm tra thủ công, và chính sách đổi trả 30 ngày không cần lý do, hỗ trợ bởi đội ngũ chăm sóc khách hàng tận tâm.\" title_4=\"Cam Kết Của Chúng Tôi\" body_4=\"Sản phẩm chất lượng, chuỗi cung ứng minh bạch và điều kiện lao động công bằng — mỗi đơn hàng, mỗi lần đặt.\"][/image-accordion]\n[about-testimonials heading=\"Khách Hàng Nói Gì!\" subtitle=\"Khách hàng yêu thích sản phẩm của chúng tôi, và chúng tôi luôn nỗ lực làm hài lòng họ.\" quantity=\"2\" image_1=\"testimonials/tes-1.jpg\" name_1=\"Emma Collins\" text_1=\"\\\"Totally obsessed with this outfit! The fit is perfect, the fabric feels premium, and I\'ve been getting compliments non-stop. It instantly lifts my confidence — such a great find!\\\"\" image_2=\"testimonials/tes-2.jpg\" name_2=\"Sophia Ramirez\" text_2=\"\\\"I\'m amazed by how comfortable yet stylish this piece is. It pairs effortlessly with everything, and the quality really stands out. Definitely becoming my go-to for everyday looks!\\\"\"][/about-testimonials]\n[about-team heading=\"Gặp Gỡ Đội Ngũ\" subtitle=\"Những chuyên gia tận tâm với sự hoàn hảo trong từng chi tiết.\" quantity=\"4\" image_1=\"member/member-1.jpg\" name_1=\"Annette Black\" role_1=\"Nhà Sáng Lập/CEO\" social_links_1=\"\" image_2=\"member/member-2.jpg\" name_2=\"Brooklyn Simmons\" role_2=\"Quản Lý\" social_links_2=\"\" image_3=\"member/member-3.jpg\" name_3=\"Jane Cooper\" role_3=\"Giám Đốc Kinh Doanh\" social_links_3=\"\" image_4=\"member/member-4.jpg\" name_4=\"Lisa Bonet\" role_4=\"Giám Đốc Kinh Doanh\" social_links_4=\"\"][/about-team]'),('vi',2,'Liên hệ','Liên hệ với đội ngũ chăm sóc khách hàng và hợp tác của Amerce.',''),('vi',3,'Câu hỏi thường gặp','Câu hỏi thường gặp về đơn hàng, vận chuyển, đổi trả và quản lý tài khoản.','[page-banner heading=\"Câu Hỏi Thường Gặp\" subtitle=\"Got questions? We\'ve got answers! Browse our Câu Hỏi Thường Gặp to find information on orders, shipping,<br class=\\\"d-none d-lg-block\\\">returns, and more. If you need further assistance, feel free to contact our team.\"][/page-banner]\n[faq-page sidebar_image=\"section/banner-12.jpg\" sidebar_title=\"Save 25% <br class=\\\"d-none d-sm-block\\\">Today\" sidebar_subtitle=\"Áo Thun, Áo Hoodie Và Hơn Thế Nữa\" sidebar_cta=\"Xem Thêm\" sidebar_url=\"/products\" quantity=\"16\" category_1=\"Tài Khoản Của Tôi\" category_id_1=\"myAccount\" question_1=\"1. Tôi có thể làm gì nếu quên mật khẩu?\" answer_1=\"Use the \\\"Forgot password\\\" link on the sign-in page. We will email you a one-time link to set a new password — it expires in 30 minutes for security.\" category_2=\"Tài Khoản Của Tôi\" category_id_2=\"myAccount\" question_2=\"2. Làm thế nào để cập nhật địa chỉ email?\" answer_2=\"Đăng nhập, mở Tài khoản → Cài đặt và thay đổi trường email. Chúng tôi sẽ gửi email xác nhận đến địa chỉ mới; thay đổi sẽ có hiệu lực khi bạn nhấp vào liên kết đó.\" category_3=\"Tài Khoản Của Tôi\" category_id_3=\"myAccount\" question_3=\"3. Tôi có thể xóa tài khoản của mình không?\" answer_3=\"Có. Từ Tài khoản → Cài đặt, kéo xuống mục Xóa tài khoản. Chúng tôi giữ lại lịch sử đơn hàng vì lý do thuế/pháp lý, nhưng thông tin liên hệ cá nhân sẽ được xóa trong vòng 30 ngày.\" category_4=\"Đơn Hàng & Mua Sắm\" category_id_4=\"ordersPurchases\" question_4=\"1. Làm thế nào để đặt hàng?\" answer_4=\"Thêm sản phẩm vào giỏ hàng, nhấp thanh toán, chọn phương thức vận chuyển, sau đó nhập thông tin thanh toán. Bạn sẽ nhận được email xác nhận đơn hàng ngay lập tức.\" category_5=\"Đơn Hàng & Mua Sắm\" category_id_5=\"ordersPurchases\" question_5=\"2. Tôi có thể chỉnh sửa hoặc hủy đơn hàng không?\" answer_5=\"Đơn hàng có thể được chỉnh sửa hoặc hủy từ bảng điều khiển tài khoản của bạn trong vòng 1 giờ sau khi đặt. Sau đó, kho hàng đã bắt đầu soạn hàng và chúng tôi không thể can thiệp.\" category_6=\"Đơn Hàng & Mua Sắm\" category_id_6=\"ordersPurchases\" question_6=\"3. Những phương thức thanh toán nào được chấp nhận?\" answer_6=\"Chúng tôi chấp nhận Visa, Mastercard, American Express, Apple Pay, Google Pay và PayPal. Mọi giao dịch đều sử dụng mã hóa TLS 1.3.\" category_7=\"Đổi Trả & Hoàn Tiền\" category_id_7=\"returnsRefunds\" question_7=\"1. Thời hạn đổi trả là bao lâu?\" answer_7=\"30 ngày kể từ ngày nhận hàng đối với sản phẩm chưa qua sử dụng, còn nguyên trạng. Không áp dụng cho hàng giảm giá, đồ lót và các mặt hàng flash sale bán cuối cùng.\" category_8=\"Đổi Trả & Hoàn Tiền\" category_id_8=\"returnsRefunds\" question_8=\"2. Làm thế nào để bắt đầu quy trình đổi trả?\" answer_8=\"Open the order in your account dashboard and click \\\"Start return\\\". We email a prepaid label for domestic orders within one business day.\" category_9=\"Đổi Trả & Hoàn Tiền\" category_id_9=\"returnsRefunds\" question_9=\"3. Khi nào tôi sẽ nhận được tiền hoàn lại?\" answer_9=\"Tiền hoàn được xử lý trong vòng 3-5 ngày làm việc kể từ khi chúng tôi nhận được hàng trả lại. Thời gian ghi có của ngân hàng có thể khác nhau; vui lòng đợi tối đa 10 ngày làm việc để thấy khoản tiền được ghi nhận.\" category_10=\"Vận Chuyển & Theo Dõi\" category_id_10=\"shippingTracking\" question_10=\"1. Vận chuyển mất bao lâu?\" answer_10=\"Vận chuyển tiêu chuẩn nội địa mất 3-5 ngày làm việc. Vận chuyển nhanh 1-2 ngày. Vận chuyển tiêu chuẩn quốc tế mất 7-12 ngày làm việc; tùy chọn vận chuyển nhanh có sẵn ở trang thanh toán.\" category_11=\"Vận Chuyển & Theo Dõi\" category_id_11=\"shippingTracking\" question_11=\"2. Làm thế nào để theo dõi đơn hàng?\" answer_11=\"Liên kết theo dõi được đính kèm trong email xác nhận vận chuyển. Bạn cũng có thể xem trạng thái từ Tài khoản → Đơn hàng → Theo dõi.\" category_12=\"Vận Chuyển & Theo Dõi\" category_id_12=\"shippingTracking\" question_12=\"3. Bạn có vận chuyển quốc tế không?\" answer_12=\"Có — đến hầu hết các quốc gia. Thuế và phí được trả trước ở trang thanh toán cho một số điểm đến nhất định; nếu không, đơn vị vận chuyển có thể thu khi giao hàng.\" category_13=\"Phí & Thanh Toán\" category_id_13=\"feesBilling\" question_13=\"1. Thuế và phí đã được bao gồm chưa?\" answer_13=\"Giá nội địa bao gồm thuế bán hàng hiển thị ở trang thanh toán. Đơn hàng quốc tế đến các điểm đến được hỗ trợ đã bao gồm thuế và phí; nếu không, đơn vị vận chuyển sẽ thu khi giao hàng.\" category_14=\"Phí & Thanh Toán\" category_id_14=\"feesBilling\" question_14=\"2. Tại sao tôi bị tính phí hai lần?\" answer_14=\"Có thể bạn đang thấy khoản tạm giữ ủy quyền cùng với khoản phí thực tế. Khoản tạm giữ sẽ tự hủy trong 3-5 ngày làm việc. Hãy gửi email đến billing@amerce.test nếu sau thời gian đó bạn vẫn thấy hai khoản phí.\" category_15=\"Chủ Đề Khác\" category_id_15=\"otherTopic\" question_15=\"1. Bạn có cửa hàng vật lý không?\" answer_15=\"Có — vui lòng truy cập trang Cửa hàng để xem danh sách các cửa hàng chính và đối tác.\" category_16=\"Chủ Đề Khác\" category_id_16=\"otherTopic\" question_16=\"2. Làm thế nào để liên hệ bộ phận chăm sóc khách hàng?\" answer_16=\"Gửi email đến hello@amerce.test hoặc sử dụng biểu mẫu liên hệ. Chúng tôi sẽ phản hồi trong vòng một ngày làm việc.\"][/faq-page]'),('vi',4,'Chính sách bảo mật','Cách Amerce thu thập, sử dụng và bảo vệ thông tin cá nhân của bạn.','[page-banner heading=\"Chính Sách Bảo Mật\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Thông Tin Chúng Tôi Thu Thập\" body_1=\"<p class=\\\"term-text cl-text-2\\\">When you visit the Site, we automatically collect certain information about your device — web browser, IP address, time zone, and some of the cookies installed on your device. As you browse, we also collect data about the pages or products you view, what referred you to the Site, and how you interact with it. We refer to this as \\\"Device Information\\\".</p><p class=\\\"term-text cl-text-2\\\">When you make a purchase or attempt to purchase through the Site, we collect your name, billing address, shipping address, and payment information (including card number, email address, and phone number). We refer to this as \\\"Order Information\\\".</p>\" title_2=\"2. Cách Chúng Tôi Sử Dụng Thông Tin Của Bạn\" body_2=\"<p class=\\\"term-text cl-text-2\\\">We use Order Information to fulfil orders placed through the Site (process payment, arrange shipping, provide invoices and order confirmations). We use it to communicate with you, screen orders for fraud, and — in line with your preferences — share marketing about products you may like.</p><p class=\\\"term-text cl-text-2\\\">We use Device Information to screen for fraud and to improve the Site through analytics about how customers browse and interact with us.</p>\" title_3=\"3. Chia Sẻ Thông Tin Cá Nhân Của Bạn\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We share Personal Information with third-party service providers who help us run the Site. We may also share information to comply with applicable laws, respond to a subpoena or lawful request, or otherwise protect our rights.</p>\" title_4=\"4. Lưu Trữ Dữ Liệu\" body_4=\"<p class=\\\"term-text cl-text-2\\\">When you place an order, we maintain the Order Information for our records unless and until you ask us to delete it.</p>\" title_5=\"5. Quyền Của Bạn\" body_5=\"<p class=\\\"term-text cl-text-2\\\">You can request access, correction, or deletion of any personal data we hold about you. Email privacy@amerce.test from the address on file and we will respond within 30 days.</p>\" title_6=\"6. Cookie\" body_6=\"<p class=\\\"term-text cl-text-2\\\">Cookies are used to keep your cart between visits, remember your preferences, and measure aggregate traffic. You can disable cookies in your browser, though some Site features may stop working.</p>\" title_7=\"7. Thay Đổi\" body_7=\"<p class=\\\"term-text cl-text-2\\\">We may update this policy from time to time to reflect changes to our practices or for operational, legal, or regulatory reasons. The latest version will always be on this page.</p>\"][/term-content]'),('vi',5,'Điều khoản & Điều kiện','Các điều khoản pháp lý áp dụng khi bạn sử dụng cửa hàng Amerce.','[page-banner heading=\"Điều Khoản & Điều Kiện\"][/page-banner]\n[term-content quantity=\"7\" title_1=\"1. Chấp Thuận Điều Khoản\" body_1=\"<p class=\\\"term-text cl-text-2\\\">By accessing or using the Mỹ store you agree to these terms. We reserve the right to update them with reasonable notice; the latest version is always available on this page.</p>\" title_2=\"2. Đơn Hàng & Thanh Toán\" body_2=\"<p class=\\\"term-text cl-text-2\\\">All prices are in USD unless otherwise stated. We accept the payment methods displayed at checkout. An order becomes binding once you receive an order confirmation email.</p>\" title_3=\"3. Vận Chuyển\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Vận Chuyển options, lead times, and rates are listed on our Vận Chuyển page. Risk passes to you on delivery.</p>\" title_4=\"4. Đổi Trả\" body_4=\"<p class=\\\"term-text cl-text-2\\\">You have 30 days from delivery to return any unworn item for a refund. See our Đổi Trả &amp; Hoàn Tiền page for the full process.</p>\" title_5=\"5. Sở Hữu Trí Tuệ\" body_5=\"<p class=\\\"term-text cl-text-2\\\">All content on the Site — text, photography, logos, code — is owned by Mỹ or its licensors and may not be reproduced without written permission.</p>\" title_6=\"6. Giới Hạn Trách Nhiệm\" body_6=\"<p class=\\\"term-text cl-text-2\\\">To the maximum extent permitted by law, Mỹ is not liable for indirect or consequential damages arising from use of the Site or the products purchased through it.</p>\" title_7=\"7. Luật Áp Dụng\" body_7=\"<p class=\\\"term-text cl-text-2\\\">These terms are governed by the laws of the State of New York. Any dispute will be resolved in the state or federal courts located in New York County.</p>\"][/term-content]'),('vi',6,'Đổi trả & Hoàn tiền','Chính sách đổi trả 30 ngày và quy trình đổi trả từng bước của chúng tôi.','[page-banner heading=\"Đổi Trả & Hoàn Tiền\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Đổi Trả\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We want you to be completely satisfied with your purchase. If for any reason you are not, you may return any unworn item within 30 days of receiving your order for a refund or exchange. Mặt hàng must be in original packaging and the same condition as you received them.</p>\" title_2=\"2. Cách Bắt Đầu Đổi Trả\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Open the order in your account dashboard and click \\\"Start return\\\", or email returns@amerce.test with your order number. We will send a prepaid return label for domestic orders within one business day.</p>\" title_3=\"3. Hoàn Tiền\" body_3=\"<p class=\\\"term-text cl-text-2\\\">Refunds are processed within 3-5 business days of us receiving the return and applied to the original payment method. Bank posting times vary; allow up to 10 business days for the credit to appear.</p>\" title_4=\"4. Các Trường Hợp Loại Trừ\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Sale items, intimate apparel, and final-sale flash sale purchases are excluded from returns. Personalised or made-to-order items are also non-returnable unless faulty.</p>\" title_5=\"5. Sản Phẩm Bị Hư Hỏng Hoặc Lỗi\" body_5=\"<p class=\\\"term-text cl-text-2\\\">If your order arrives damaged or faulty, email us within 7 days with photos. We will replace the item or issue a full refund — including any return shipping cost — at our expense.</p>\" title_6=\"6. Đổi Trả Quốc Tế\" body_6=\"<p class=\\\"term-text cl-text-2\\\">International customers are responsible for return shipping unless the item is faulty. We do not refund original shipping or duty charges on international returns.</p>\"][/term-content]'),('vi',7,'Vận chuyển','Các phương thức vận chuyển trong nước và quốc tế, thời gian và cước phí.','[page-banner heading=\"Vận Chuyển\"][/page-banner]\n[term-content quantity=\"6\" title_1=\"1. Phương Thức Vận Chuyển\" body_1=\"<p class=\\\"term-text cl-text-2\\\">We offer the following shipping methods for domestic and international orders: standard ground, expedited 2-day, and priority overnight (where available).</p>\" title_2=\"2. Phí Nội Địa\" body_2=\"<p class=\\\"term-text cl-text-2\\\">Standard ground is free on orders over $99. Express 1-2 day shipping is $19.99 flat. Priority overnight is calculated by weight at checkout.</p>\" title_3=\"3. Quốc Tế\" body_3=\"<p class=\\\"term-text cl-text-2\\\">We ship to most countries. International standard shipping is $24.99 with 7-12 business day delivery. Express options appear at checkout. Duties and taxes are pre-paid for select destinations; otherwise the courier collects them on delivery.</p>\" title_4=\"4. Thời Gian Xử Lý\" body_4=\"<p class=\\\"term-text cl-text-2\\\">Orders placed before 2pm EST on business days ship the same day. Orders placed after 2pm or on weekends/holidays ship the next business day.</p>\" title_5=\"5. Theo Dõi\" body_5=\"<p class=\\\"term-text cl-text-2\\\">A tracking link is included in your shipment confirmation email. You can also see live status from Account → Orders → Track.</p>\" title_6=\"6. Đơn Hàng Bị Thất Lạc Hoặc Bị Kẹt\" body_6=\"<p class=\\\"term-text cl-text-2\\\">If a tracking number has not updated for more than 7 business days, email shipping@amerce.test. We will open an investigation with the carrier and either refund or reship the order at our expense.</p>\"][/term-content]'),('vi',8,'Hệ thống cửa hàng','Ghé thăm Amerce trực tiếp — các cửa hàng chính và đối tác trên toàn thế giới.',''),('vi',9,'Tạp chí','Hướng dẫn phối đồ, câu chuyện thương hiệu và nội dung hậu trường từ đội ngũ biên tập Amerce.','<div class=\"container py-5\"><h1>Nhật Ký</h1><p>Khám phá những câu chuyện mới nhất của chúng tôi — hướng dẫn phong cách, điểm nhấn sản phẩm, phân tích chuyên sâu về bền vững và nhiều hơn nữa.</p></div>'),('vi',10,'Tuyển dụng','Tham gia Amerce — các vị trí đang mở, giá trị văn hóa và quyền lợi dành cho đội ngũ.','<div class=\"container py-5\"><h1>Tuyển Dụng Tại Amerce</h1><p>Chúng tôi là một đội ngũ nhỏ, làm việc phân tán, đang xây dựng một mô hình bán lẻ tinh tế hơn. Chúng tôi tuyển dụng trong các mảng sản phẩm, kỹ thuật, chuỗi cung ứng và trải nghiệm khách hàng.</p><p>Các vị trí đang tuyển được đăng trên trang LinkedIn của công ty. Để ứng tuyển, hãy gửi một thư ngắn và sơ yếu lý lịch đến <a href=\"mailto:careers@amerce.test\">careers@amerce.test</a>.</p></div>'),('vi',11,'Sustainability','How Amerce sources responsibly and reduces its environmental footprint.','<div class=\"container py-5\"><h1>Phát Triển Bền Vững Tại Amerce</h1><p>Mỗi sản phẩm đều mang một câu chuyện. Chúng tôi làm việc trực tiếp với các nhà máy và xưởng thủ công, ưu tiên vật liệu tái chế và có thể truy xuất nguồn gốc, và đóng gói không sử dụng nhựa.</p><p>Mục tiêu năm 2026 của chúng tôi: 90% nguyên vật liệu có chuỗi cung ứng được xác minh, và báo cáo tác động hằng năm minh bạch.</p></div>'),('vi',12,'Trang chủ','Amerce — trang chủ trải nghiệm thương mại điện tử đa năng.','[hero-grid-asymmetric hero_image=\"section/banner-59.jpg\" hero_title=\"Pickleball: Niềm Đam Mê &lt;br&gt;Tiếp Theo Của Bạn.\" hero_desc=\"Giảm Đến 50% Cho Phụ Kiện\" hero_button_text=\"Mua Ngay\" hero_button_url=\"/products\" card_1_image=\"section/banner-60.jpg\" card_1_title=\"Dụng Cụ Chính Xác &lt;br&gt;Trận Đấu Đỉnh Cao\" card_1_desc=\"Giảm tới 50% sản phẩm bán chạy\" card_1_button_text=\"Mua Ngay\" card_1_button_url=\"/products\" card_2_image=\"section/banner-61.jpg\" card_2_title=\"Hiệu Năng Đỉnh Cao &lt;br&gt;Phong Cách Tuyệt Đỉnh\" card_2_desc=\"Giảm tới 50% sản phẩm bán chạy\" card_2_button_text=\"Mua Ngay\" card_2_button_url=\"/products\"][/hero-grid-asymmetric]\n[site-features style=\"style-1\" compact=\"yes\" quantity=\"4\" icon_class_1=\"icon-ArrowUDownLeft\" title_1=\"Đổi Trả Trong 14 Ngày\" description_1=\"Mua sắm không rủi ro với chính sách đổi trả dễ dàng.\" icon_class_2=\"icon-Package\" title_2=\"Miễn Phí Vận Chuyển\" description_2=\"Không phí phát sinh, chỉ đúng mức giá bạn thấy.\" icon_class_3=\"icon-Headset\" title_3=\"Hỗ Trợ 24/7\" description_3=\"Hỗ trợ 24/7, luôn ở đây vì bạn.\" icon_class_4=\"icon-SealPercent\" title_4=\"Ưu Đãi Thành Viên\" description_4=\"Giá đặc biệt dành cho khách hàng thân thiết.\"][/site-features]\n[ecommerce-products style=\"style-slider\" title=\"Hiệu Năng Bắt Đầu Từ Đây\" subtitle=\"Dụng cụ thể thao cao cấp được chế tác cho độ bền, sự thoải mái và kết quả.\" source=\"best-seller\" limit=\"8\" items_per_row=\"4\" grid_rows=\"2\" card_style=\"style-1\" product_wrapper_class=\"square\" pagination=\"2\" pagination_sm=\"2\" pagination_md=\"3\" pagination_lg=\"4\"][/ecommerce-products]\n[ecommerce-collections style=\"style-slider-overlay\" collection_ids=\"4,5,6\" limit=\"3\"][/ecommerce-collections]\n[tab-product-showcase title=\"Bùng Cháy Trên Đôi Chân\" subtitle=\"Tốc độ, thoải mái, sức bền, cân bằng.\" view_all_url=\"/products\" view_all_text=\"Xem Thêm\" tab_1_label=\"Giày Chạy Bộ XT8\" tab_1_image=\"section/sport-tab-1.jpg\" tab_1_product_id=\"1\" tab_2_label=\"Giày Chạy Bộ Cushion 500\" tab_2_image=\"section/sport-tab-2.jpg\" tab_2_product_id=\"1\" tab_3_label=\"Giày Chạy Bộ Ekiden One\" tab_3_image=\"section/sport-tab-3.jpg\" tab_3_product_id=\"1\" tab_4_label=\"Giày Chạy Bộ JF190.1\" tab_4_image=\"section/sport-tab-4.jpg\" tab_4_product_id=\"1\"][/tab-product-showcase]\n[brand-logos style=\"style-infinite\" modifier_class=\"syle-3\" limit=\"6\"][/brand-logos]\n[lookbook-hotspot style=\"style-v3\" wide=\"yes\" image=\"lookbook/look-10.jpg\" image_2=\"lookbook/look-11.jpg\" quantity=\"2\" x_percent_1=\"39.5\" y_percent_1=\"27.2\" product_id_1=\"7\" column_1=\"1\" x_percent_2=\"34.5\" y_percent_2=\"48.2\" product_id_2=\"2\" column_2=\"2\"][/lookbook-hotspot]\n[product-feature-zoom style=\"style-3-pdp\" product_id=\"4\" detail_tag=\"Thể Thao Dùng Vợt\" reviews_count=\"134\" urgency_text=\"18 sản phẩm đã bán trong 32 giờ qua\" viewing_count=\"28\"][/product-feature-zoom]\n[testimonials style=\"style-v2-product\" card_type=\"style-8\" bg_main=\"yes\" title=\"Khách Hàng Nói Gì!\" subtitle=\"Khách hàng yêu thích sản phẩm của chúng tôi, và chúng tôi luôn nỗ lực làm hài lòng họ.\" autoplay=\"no\" limit=\"2\" testimonial_product_ids=\"8,2\"][/testimonials]\n[image-gallery style=\"style-default\" title=\"Mua Sắm Trên Instagram\" subtitle=\"Kết nối với chúng tôi trên mọi nền tảng để cập nhật thông tin mới về sản phẩm.\" quantity=\"5\" image_1=\"gallery/gallery-62.jpg\" link_1=\"/products\" image_2=\"gallery/gallery-63.jpg\" link_2=\"/products\" image_3=\"gallery/gallery-64.jpg\" link_3=\"/products\" image_4=\"gallery/gallery-65.jpg\" link_4=\"/products\" image_5=\"gallery/gallery-66.jpg\" link_5=\"/products\"][/image-gallery]');
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
INSERT INTO `post_categories` VALUES (4,1),(1,1),(1,2),(2,2),(2,3),(1,3),(1,4),(4,4),(4,5),(2,6),(4,6);
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
INSERT INTO `post_tags` VALUES (1,1),(5,1),(9,2),(8,2),(3,2),(10,3),(5,3),(12,3),(10,4),(4,4),(6,4),(4,5),(5,5),(10,6),(4,6);
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
INSERT INTO `posts` VALUES (1,'Recovery Routines That Actually Work','Cold plunges trend, but sleep and mobility do the heavy lifting.','<p>The science is dull but conclusive: seven to nine hours of sleep, five minutes of mobility daily, and one to two harder protein-forward meals on training days handle 80 percent of recovery for most athletes.</p><p>Save the gadgets for after the basics are non-negotiable.</p>','published',1,'Botble\\ACL\\Models\\User',1,NULL,963,NULL,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(2,'Build a Routine That Sticks','Forget motivation. The athletes who keep showing up have engineered the friction out.','<p>Lay out clothes the night before. Stack workouts to a fixed cue (after morning coffee, before lunch). Track streaks visibly. Reward consistency, not intensity.</p><p>The boring habits are the ones that compound.</p>','published',1,'Botble\\ACL\\Models\\User',1,NULL,1820,NULL,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(3,'How to Pick the Right Yoga Mat','Thickness, grip, and material — what to optimize for based on your practice.','<p>Vinyasa and power flows benefit from grippier 3-5mm mats. Restorative and yin sessions feel better on 6-8mm cushion. Natural rubber grips best when wet but weighs more; PU and TPE are lighter for travel.</p><p>Buy once for your primary practice, then add a travel mat if needed.</p>','published',1,'Botble\\ACL\\Models\\User',1,NULL,1560,NULL,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(4,'Strength Training Basics','Five lifts, three sets, twice a week — and you covered the fundamentals.','<p>Squat, hinge, push, pull, carry. Build the program around these movement patterns and adjust load over months, not weeks. Add accessories only after the foundation is solid.</p><p>The simpler the program, the more consistently it actually gets done.</p>','published',1,'Botble\\ACL\\Models\\User',1,NULL,1318,NULL,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(5,'Pickleball for Beginners','Picking a paddle, learning the kitchen rule, and avoiding the most common faults.','<p>Start with a midweight composite paddle (7.5-8.0oz). Learn the non-volley zone (kitchen) rule first — it changes positioning and shot selection. Drill the dink before chasing aggressive returns.</p><p>The faster path to better is fewer power shots and more shot placement.</p>','published',1,'Botble\\ACL\\Models\\User',1,NULL,951,NULL,'2026-05-28 19:11:13','2026-05-28 19:11:13'),(6,'Hydration During Workouts','Plain water is fine for an hour. After that, electrolytes start to matter.','<p>For sessions under 60 minutes, sip plain water as needed. Above 60 minutes — especially in heat — replace sodium and potassium with an electrolyte mix or salt-forward snack.</p><p>Most cramping is a sodium issue, not a magnesium issue.</p>','published',1,'Botble\\ACL\\Models\\User',0,NULL,891,NULL,'2026-05-28 19:11:13','2026-05-28 19:11:13');
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
INSERT INTO `posts_translations` VALUES ('ar',1,'إجراءات الاسترداد التي تعمل بالفعل','أصبح الاستحمام بالماء البارد رائجًا، لكن النوم والمرونة يقومان بالعمل المهم.','<p>العلم ممل ولكنه حاسم: سبع إلى تسع ساعات من النوم، وخمس دقائق من الحركة الديناميكية يوميًا، ووجبة أو اثنتين من الوجبات الغنية بالبروتين في أيام التدريب تؤدي إلى 80 بالمائة من التعافي لمعظم الرياضيين.</p><p>احتفظ بالمعدات حتى تصبح الأساسيات أمرًا لا بد منه.</p>'),('ar',2,'قم ببناء روتين ثابت','ننسى الدافع. الرياضيون الذين يحافظون هم أولئك الذين أزالوا جميع العقبات.','<p> قم بتحضير الملابس في الليلة السابقة. اربط جلسة التمرين بإشارة ثابتة (بعد قهوة الصباح وقبل الغداء). تتبع تسلسل التاريخ بصريا. كافئ الانتظام وليس الشدة.</p><p>العادات المملة الجديدة هي تلك التي تتراكم بمرور الوقت.</p>'),('ar',3,'كيفية اختيار سجادة اليوغا المناسبة','السُمك والقبضة والمواد - ما يجب أن يكون الأمثل يعتمد على كيفية تدريبك.','<p>Vinyasa وتدفق الطاقة يستفيدان من الحصائر ذات المقبض بسمك 3-5 مم. تشعر جلسات التعافي والين براحة أكبر عند استخدام وسادات مقاس 6-8 مم. أفضل قبضة من المطاط الطبيعي عندما تكون مبللة ولكنها أثقل؛ يعتبر PU وTPE أخف وزنًا لحملهما أثناء التنقل.</p><p>اشتري واحدة لممارستك الرئيسية، ثم قم بإضافة بساط سفر إذا لزم الأمر.</p>'),('ar',4,'أساسيات تدريب القوة','خمس مصاعد، ثلاث مجموعات، مرتين في الأسبوع - وقد قمت بتغطية الأساسيات.','<p> القرفصاء، ثني الورك، الدفع، السحب، الحمل. قم ببناء برنامجك حول أنماط الحركة هذه واضبط حملك شهرًا بعد شهر، وليس أسبوعًا بعد أسبوع. أضف تمارين الدعم فقط بعد أن يصبح الأساس متينًا.</p><p>كلما كان البرنامج أبسط، كلما كان بإمكانك القيام به بشكل أكثر انتظامًا.</p>'),('ar',5,'كرة المخلل للمبتدئين','اختر مضربك، وتعلم قواعد المطبخ وتجنب الأخطاء الأكثر شيوعًا.','<p> ابدأ بمضرب مركب متوسط ​​الوزن (7.5-8.0 أونصة). تعرف على قاعدة المنطقة المحظورة (المطبخ) أولاً — فهي تغير الحركة واختيار التسديدة. تدرب على هذا الأمر قبل مطاردة المرتجعات الهجومية.</p><p>الطريق الأسرع للعب بشكل أفضل هو عدد أقل من التسديدات القوية والمزيد من الضربات.</p>'),('ar',6,'الترطيب أثناء التدريبات','الماء المصفى يكفي لمدة ساعة واحدة. ثم تبدأ الشوارد في أن تصبح مهمة.','<p> بالنسبة لجلسات التمرين التي تقل مدتها عن 60 دقيقة، ارتشف الماء حسب الحاجة. على مدى 60 دقيقة - خاصة في الظروف الحارة - استبدل الصوديوم والبوتاسيوم بخليط إلكتروليت أو وجبة خفيفة عالية الملح.</p><p>معظم التشنجات تكون مشكلة صوديوم، وليست مشكلة مغنيسيوم.</p>'),('fr',1,'Des routines de récupération qui fonctionnent réellement','Les douches froides sont à la mode, mais le sommeil et la flexibilité font le travail important.','<p>La science est ennuyeuse mais définitive : sept à neuf heures de sommeil, cinq minutes de mouvement dynamique par jour et un à deux repas riches en protéines les jours d\'entraînement assurent 80 % de la récupération pour la plupart des athlètes.</p><p>Conservez l\'équipement jusqu\'à ce que les bases soient devenues indispensables.</p>'),('fr',2,'Créez une routine qui colle','Oubliez la motivation. Les athlètes qui maintiennent sont ceux qui ont éliminé tous les obstacles.','<p>Préparez les vêtements la veille. Attachez votre séance d\'entraînement à un signal fixe (après votre café du matin, avant le déjeuner). Suivez visuellement la séquence de dates. Récompensez la régularité, pas l\'intensité.</p><p>Les nouvelles habitudes ennuyeuses sont celles qui s\'accumulent avec le temps.</p>'),('fr',3,'Comment choisir le bon tapis de yoga','Épaisseur, adhérence et matériau : ce qui doit être optimal dépend de la façon dont vous vous entraînez.','<p>Le Vinyasa et le Power Flow bénéficient de tapis plus adhérents de 3 à 5 mm d\'épaisseur. Les séances de récupération et de yin sont plus confortables avec un amorti de 6 à 8 mm. Le caoutchouc naturel adhère mieux lorsqu\'il est mouillé, mais il est plus lourd ; Le PU et le TPE sont plus légers à transporter.</p><p>Achetez-en un pour votre pratique principale, puis ajoutez un tapis de voyage si nécessaire.</p>'),('fr',4,'Bases de l’entraînement en force','Cinq levées, trois séries, deux fois par semaine – et vous avez couvert les bases.','<p>Squat, flexion de la hanche, pousser, tirer, porter. Construisez votre programme autour de ces schémas de mouvement et ajustez votre charge mois par mois, et non semaine par semaine. N\'ajoutez des exercices de soutien qu\'une fois que les bases sont solides.</p><p>Plus le programme est simple, plus vous pouvez le faire régulièrement.</p>'),('fr',5,'Pickleball pour les débutants','Choisissez votre raquette, apprenez les règles de la cuisine et évitez les erreurs les plus courantes.','<p>Commencez avec une raquette composite de poids moyen (7,5-8,0 oz). Apprenez d\'abord la règle de la zone de non-volée (galère) : elle modifie le mouvement et la sélection des tirs. Entraînez-vous à dink avant de courir après les retours offensifs.</p><p>Le chemin le plus rapide vers un meilleur jeu consiste à moins de coups puissants et plus de putts.</p>'),('fr',6,'Hydratation pendant les entraînements','L\'eau filtrée suffit pour une heure. Les électrolytes commencent alors à devenir importants.','<p>Pour les séances d\'exercice de moins de 60 minutes, buvez de l\'eau au besoin. Pendant 60 minutes, surtout par temps chaud, remplacez le sodium et le potassium par un mélange d\'électrolytes ou une collation riche en sel.</p><p>La plupart des crampes sont un problème de sodium et non de magnésium.</p>'),('id',1,'Rutinitas Pemulihan yang Benar-Benar Berfungsi','Mandi air dingin sedang tren, tetapi tidur dan fleksibilitas adalah hal yang penting.','<p>Ilmu pengetahuan ini membosankan namun pasti: tujuh hingga sembilan jam tidur, lima menit gerakan dinamis sehari, dan satu hingga dua kali makan kaya protein pada hari latihan menangani 80 persen pemulihan bagi sebagian besar atlet.</p><p>Simpan peralatan hingga hal-hal mendasar menjadi suatu keharusan.</p>'),('id',2,'Bangun Rutinitas yang Menempel','Lupakan motivasi. Atlet yang mempertahankan adalah mereka yang telah menghilangkan segala rintangan.','<p>Siapkan pakaian pada malam sebelumnya. Ikat sesi latihan Anda dengan isyarat tetap (setelah minum kopi pagi, sebelum makan siang). Lacak urutan tanggal secara visual. Hadiahi keteraturan, bukan intensitas.</p><p>Kebiasaan baru yang membosankan adalah kebiasaan yang terakumulasi seiring berjalannya waktu.</p>'),('id',3,'Cara Memilih Matras Yoga yang Tepat','Ketebalan, cengkeraman, dan bahan — yang perlu optimal bergantung pada cara Anda berlatih.','<p>Vinyasa dan aliran daya mendapat manfaat dari matras grippier setebal 3-5 mm. Sesi pemulihan dan yin terasa lebih nyaman dengan bantalan 6-8mm. Genggaman karet alam paling baik saat basah tetapi lebih berat; PU dan TPE lebih ringan untuk dibawa bepergian.</p><p>Beli satu untuk latihan utama Anda, lalu tambahkan matras perjalanan jika diperlukan.</p>'),('id',4,'Dasar-dasar Pelatihan Kekuatan','Lima lift, tiga set, dua kali seminggu — dan Anda telah mempelajari dasar-dasarnya.','<p>Jongkok, fleksi pinggul, mendorong, menarik, membawa. Bangun program Anda berdasarkan pola pergerakan ini dan sesuaikan beban Anda dari bulan ke bulan, bukan minggu ke minggu. Hanya tambahkan latihan pendukung setelah fondasinya kokoh.</p><p>Semakin sederhana programnya, semakin teratur Anda dapat melakukannya.</p>'),('id',5,'Pickleball untuk Pemula','Pilih raket Anda, pelajari aturan dapur dan hindari kesalahan paling umum.','<p>Mulailah dengan raket komposit berbobot sedang (7,5-8,0oz). Pelajari aturan zona larangan voli (dapur) terlebih dahulu — aturan ini mengubah pergerakan dan pemilihan tembakan. Latihlah dink sebelum mengejar pengembalian menyerang.</p><p>Jalan yang lebih cepat untuk bermain lebih baik adalah dengan lebih sedikit tembakan bertenaga dan lebih banyak putt.</p>'),('id',6,'Hidrasi Selama Latihan','Air yang disaring cukup untuk satu jam. Kemudian elektrolit mulai menjadi penting.','<p>Untuk sesi olahraga kurang dari 60 menit, minumlah air secukupnya. Lebih dari 60 menit — terutama dalam kondisi panas — ganti natrium dan kalium dengan campuran elektrolit atau camilan tinggi garam.</p><p>Kebanyakan kram disebabkan oleh masalah natrium, bukan masalah magnesium.</p>'),('tr',1,'Recovery Routines That Actually Work','Soğuk duşlar trend, ancak önemli olan uyku ve esnekliktir.','<p>Bilim sıkıcı ama kesindir: Yedi ila dokuz saat uyku, günde beş dakika dinamik hareket ve antrenman günlerinde bir ila iki protein açısından zengin yemek, çoğu sporcu için iyileşmenin yüzde 80\'ini karşılar.</p><p>Temeller bir zorunluluk haline gelene kadar ekipmanı saklayın.</p>'),('tr',2,'Build a Routine That Sticks','Motivasyonu unutun. Devam eden sporcular tüm engelleri ortadan kaldıranlardır.','<p>Kıyafetleri bir gece önceden hazırlayın. Egzersiz seansınızı sabit bir işarete bağlayın (sabah kahvenizden sonra, öğle yemeğinden önce). Tarih sırasını görsel olarak takip edin. Yoğunluğu değil, düzenliliği ödüllendirin.</p><p>Yeni sıkıcı alışkanlıklar, zamanla biriken alışkanlıklardır.</p>'),('tr',3,'How to Pick the Right Yoga Mat','Kalınlık, kavrama ve malzeme; neyin en iyi olması gerektiği nasıl antrenman yaptığınıza bağlıdır.','<p>Vinyasa ve güç akışı, 3-5 mm kalınlığındaki tutucu paspaslardan yararlanır. Dinlenme ve yin seansları 6-8 mm yastıklamayla daha rahat hissettirir. Doğal kauçuk ıslakken en iyi tutuşu sağlar ancak daha ağırdır; PU ve TPE, yolda taşımak için daha hafiftir.</p><p>Ana antrenmanınız için bir tane satın alın, ardından gerekirse bir seyahat matı ekleyin.</p>'),('tr',4,'Strength Training Basics','Haftada iki kez beş kaldırma, üç set — ve temel konuları ele aldınız.','<p>Çömelme, kalçayı bükme, itme, çekme, taşıma. Programınızı bu hareket kalıpları etrafında oluşturun ve yükünüzü hafta hafta değil, ay ay ayarlayın. Destek egzersizlerini ancak temel sağlamlaştıktan sonra ekleyin.</p><p>Program ne kadar basitse o kadar düzenli yapabilirsiniz.</p>'),('tr',5,'Pickleball for Beginners','Raketinizi seçin, mutfağın kurallarını öğrenin ve en sık yapılan hatalardan kaçının.','<p>Orta ağırlıkta bir kompozit raketle başlayın (7,5-8,0oz). Önce voleybolsuz bölge (mutfak) kuralını öğrenin; hareketi ve şut seçimini değiştirir. Hücum dönüşlerini kovalamadan önce vuruş alıştırması yapın.</p><p>Daha iyi oyuna giden daha hızlı yol, daha az güçlü şut ve daha fazla vuruştur.</p>'),('tr',6,'Hydration During Workouts','Filtrelenmiş su bir saat boyunca yeterlidir. Daha sonra elektrolitler önem kazanmaya başlar.','<p>60 dakikanın altındaki egzersiz seanslarında gerektiği kadar su yudumlayın. 60 dakika boyunca - özellikle sıcak koşullarda - sodyum ve potasyumu bir elektrolit karışımıyla veya yüksek tuzlu bir atıştırmalıkla değiştirin.</p><p>Çoğu kramp, magnezyum sorunu değil, sodyum sorunudur.</p>'),('vi',1,'Những Thói Quen Phục Hồi Thực Sự Hiệu Quả','Tắm nước lạnh đang là xu hướng, nhưng giấc ngủ và sự vận động linh hoạt mới làm phần việc quan trọng.','<p>Khoa học thì nhàm chán nhưng dứt khoát: bảy đến chín giờ ngủ, năm phút vận động linh hoạt mỗi ngày, và một đến hai bữa ăn giàu đạm vào những ngày tập xử lý được 80 phần trăm việc phục hồi cho hầu hết vận động viên.</p><p>Hãy để dành các thiết bị cho đến khi những điều cơ bản đã trở thành bắt buộc.</p>'),('vi',2,'Xây Dựng Thói Quen Bền Vững','Quên động lực đi. Những vận động viên luôn duy trì là những người đã loại bỏ mọi cản trở.','<p>Chuẩn bị quần áo từ tối hôm trước. Gắn buổi tập vào một tín hiệu cố định (sau ly cà phê buổi sáng, trước bữa trưa). Theo dõi chuỗi ngày một cách trực quan. Thưởng cho sự đều đặn, không phải cường độ.</p><p>Những thói quen nhàm chán mới là những thói quen tích lũy theo thời gian.</p>'),('vi',3,'Cách Chọn Thảm Yoga Phù Hợp','Độ dày, độ bám và chất liệu — những gì cần tối ưu dựa trên cách bạn luyện tập.','<p>Vinyasa và power flow hưởng lợi từ những tấm thảm bám hơn dày 3-5mm. Các buổi tập phục hồi và yin cảm thấy dễ chịu hơn trên lớp đệm 6-8mm. Cao su tự nhiên bám tốt nhất khi ẩm nhưng nặng hơn; PU và TPE nhẹ hơn để mang theo khi đi xa.</p><p>Hãy mua một lần cho cách luyện tập chính của bạn, rồi thêm một tấm thảm du lịch nếu cần.</p>'),('vi',4,'Kiến Thức Cơ Bản Về Tập Sức Mạnh','Năm bài nâng tạ, ba hiệp, hai lần một tuần — và bạn đã bao quát những điều nền tảng.','<p>Squat, gập hông, đẩy, kéo, mang vác. Xây dựng chương trình quanh những mẫu chuyển động này và điều chỉnh tải trọng theo từng tháng, không phải từng tuần. Chỉ thêm bài bổ trợ sau khi nền tảng đã vững chắc.</p><p>Chương trình càng đơn giản, bạn càng thực hiện nó đều đặn hơn.</p>'),('vi',5,'Pickleball Cho Người Mới Bắt Đầu','Chọn vợt, học luật khu bếp và tránh những lỗi phổ biến nhất.','<p>Hãy bắt đầu với một chiếc vợt composite trọng lượng trung bình (7,5-8,0oz). Học luật khu vực không vô lê (khu bếp) trước tiên — nó thay đổi cách di chuyển và lựa chọn cú đánh. Luyện cú dink trước khi đuổi theo những cú trả bóng tấn công.</p><p>Con đường nhanh hơn để chơi tốt hơn là ít cú đánh mạnh và nhiều cú đặt bóng hơn.</p>'),('vi',6,'Bổ Sung Nước Trong Khi Tập Luyện','Nước lọc là đủ cho một giờ. Sau đó, chất điện giải bắt đầu trở nên quan trọng.','<p>Với những buổi tập dưới 60 phút, hãy nhấp nước lọc khi cần. Trên 60 phút — đặc biệt trong điều kiện nóng — hãy bù natri và kali bằng hỗn hợp điện giải hoặc món ăn nhẹ giàu muối.</p><p>Hầu hết tình trạng chuột rút là vấn đề natri, không phải vấn đề magie.</p>');
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
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.cms\":true,\"core.manage.license\":true,\"systems.cronjob\":true,\"core.tools\":true,\"tools.data-synchronize\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.common\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"settings.phone-number\":true,\"settings.others\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"pages.export\":true,\"pages.import\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"sitemap.settings\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"theme.robots-txt\":true,\"settings.website-tracking\":true,\"widgets.index\":true,\"ads.index\":true,\"ads.create\":true,\"ads.edit\":true,\"ads.destroy\":true,\"ads.settings\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"announcements.index\":true,\"announcements.create\":true,\"announcements.edit\":true,\"announcements.destroy\":true,\"announcements.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"blog.reports\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"posts.export\":true,\"posts.import\":true,\"captcha.settings\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.custom-fields\":true,\"contact.settings\":true,\"plugins.ecommerce\":true,\"ecommerce.report.index\":true,\"products.index\":true,\"products.create\":true,\"products.edit\":true,\"products.destroy\":true,\"products.duplicate\":true,\"ecommerce.product-prices.index\":true,\"ecommerce.product-prices.edit\":true,\"ecommerce.product-inventory.index\":true,\"ecommerce.product-inventory.edit\":true,\"product-categories.index\":true,\"product-categories.create\":true,\"product-categories.edit\":true,\"product-categories.destroy\":true,\"product-tag.index\":true,\"product-tag.create\":true,\"product-tag.edit\":true,\"product-tag.destroy\":true,\"brands.index\":true,\"brands.create\":true,\"brands.edit\":true,\"brands.destroy\":true,\"product-collections.index\":true,\"product-collections.create\":true,\"product-collections.edit\":true,\"product-collections.destroy\":true,\"product-attribute-sets.index\":true,\"product-attribute-sets.create\":true,\"product-attribute-sets.edit\":true,\"product-attribute-sets.destroy\":true,\"product-attributes.index\":true,\"product-attributes.create\":true,\"product-attributes.edit\":true,\"product-attributes.destroy\":true,\"tax.index\":true,\"tax.create\":true,\"tax.edit\":true,\"tax.destroy\":true,\"reviews.index\":true,\"reviews.create\":true,\"reviews.destroy\":true,\"reviews.publish\":true,\"reviews.reply\":true,\"ecommerce.shipments.index\":true,\"ecommerce.shipments.create\":true,\"ecommerce.shipments.edit\":true,\"ecommerce.shipments.destroy\":true,\"orders.index\":true,\"orders.create\":true,\"orders.edit\":true,\"orders.destroy\":true,\"discounts.index\":true,\"discounts.create\":true,\"discounts.edit\":true,\"discounts.destroy\":true,\"customers.index\":true,\"customers.create\":true,\"customers.edit\":true,\"customers.destroy\":true,\"ecommerce.customers.import\":true,\"ecommerce.customers.export\":true,\"ecommerce.customer-carts.index\":true,\"ecommerce.customer-carts.destroy\":true,\"flash-sale.index\":true,\"flash-sale.create\":true,\"flash-sale.edit\":true,\"flash-sale.destroy\":true,\"product-label.index\":true,\"product-label.create\":true,\"product-label.edit\":true,\"product-label.destroy\":true,\"ecommerce.import.products.index\":true,\"ecommerce.export.products.index\":true,\"order_returns.index\":true,\"order_returns.edit\":true,\"order_returns.destroy\":true,\"global-option.index\":true,\"global-option.create\":true,\"global-option.edit\":true,\"global-option.destroy\":true,\"ecommerce.invoice.index\":true,\"ecommerce.invoice.edit\":true,\"ecommerce.invoice.destroy\":true,\"ecommerce.settings\":true,\"ecommerce.settings.general\":true,\"ecommerce.invoice-template.index\":true,\"ecommerce.settings.currencies\":true,\"ecommerce.settings.products\":true,\"ecommerce.settings.product-search\":true,\"ecommerce.settings.digital-products\":true,\"ecommerce.settings.store-locators\":true,\"ecommerce.settings.invoices\":true,\"ecommerce.settings.product-reviews\":true,\"ecommerce.settings.customers\":true,\"ecommerce.settings.shopping\":true,\"ecommerce.settings.taxes\":true,\"ecommerce.settings.shipping\":true,\"ecommerce.shipping-rule-items.index\":true,\"ecommerce.shipping-rule-items.create\":true,\"ecommerce.shipping-rule-items.edit\":true,\"ecommerce.shipping-rule-items.destroy\":true,\"ecommerce.shipping-rule-items.bulk-import\":true,\"ecommerce.settings.tracking\":true,\"ecommerce.settings.standard-and-format\":true,\"ecommerce.settings.checkout\":true,\"ecommerce.settings.return\":true,\"ecommerce.settings.flash-sale\":true,\"ecommerce.settings.pending-orders\":true,\"ecommerce.settings.product-specification\":true,\"product-categories.export\":true,\"product-categories.import\":true,\"product-license-codes.import\":true,\"orders.export\":true,\"ecommerce.product-specification.index\":true,\"ecommerce.specification-groups.index\":true,\"ecommerce.specification-groups.create\":true,\"ecommerce.specification-groups.edit\":true,\"ecommerce.specification-groups.destroy\":true,\"ecommerce.specification-attributes.index\":true,\"ecommerce.specification-attributes.create\":true,\"ecommerce.specification-attributes.edit\":true,\"ecommerce.specification-attributes.destroy\":true,\"ecommerce.specification-tables.index\":true,\"ecommerce.specification-tables.create\":true,\"ecommerce.specification-tables.edit\":true,\"ecommerce.specification-tables.destroy\":true,\"ecommerce.product-specifications.import\":true,\"ecommerce.product-specifications.export\":true,\"plugin.faq\":true,\"faq.index\":true,\"faq.create\":true,\"faq.edit\":true,\"faq.destroy\":true,\"faq_category.index\":true,\"faq_category.create\":true,\"faq_category.edit\":true,\"faq_category.destroy\":true,\"faqs.settings\":true,\"product-size-guide.index\":true,\"product-size-guide.create\":true,\"product-size-guide.edit\":true,\"product-size-guide.destroy\":true,\"size-guide-headers.index\":true,\"size-guide-headers.create\":true,\"size-guide-headers.edit\":true,\"size-guide-headers.destroy\":true,\"product-size-guide.settings\":true,\"galleries.index\":true,\"galleries.create\":true,\"galleries.edit\":true,\"galleries.destroy\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"translations.import\":true,\"translations.export\":true,\"property-translations.import\":true,\"property-translations.export\":true,\"page-translations.export\":true,\"page-translations.import\":true,\"plugin.location\":true,\"country.index\":true,\"country.create\":true,\"country.edit\":true,\"country.destroy\":true,\"state.index\":true,\"state.create\":true,\"state.edit\":true,\"state.destroy\":true,\"city.index\":true,\"city.create\":true,\"city.edit\":true,\"city.destroy\":true,\"marketplace.index\":true,\"marketplace.store.index\":true,\"marketplace.store.create\":true,\"marketplace.store.edit\":true,\"marketplace.store.destroy\":true,\"marketplace.store.view\":true,\"marketplace.store.revenue.create\":true,\"marketplace.withdrawal.index\":true,\"marketplace.withdrawal.edit\":true,\"marketplace.withdrawal.destroy\":true,\"marketplace.withdrawal.invoice\":true,\"marketplace.vendors.index\":true,\"marketplace.unverified-vendors.index\":true,\"marketplace.vendors.control\":true,\"marketplace.unverified-vendors.edit\":true,\"marketplace.reports\":true,\"marketplace.settings\":true,\"marketplace.messages.index\":true,\"marketplace.messages.edit\":true,\"marketplace.messages.destroy\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"newsletter.settings\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"payments.logs\":true,\"payments.logs.show\":true,\"payments.logs.destroy\":true,\"request-log.index\":true,\"request-log.destroy\":true,\"sale-popup.settings\":true,\"simple-slider.index\":true,\"simple-slider.create\":true,\"simple-slider.edit\":true,\"simple-slider.destroy\":true,\"simple-slider-item.index\":true,\"simple-slider-item.create\":true,\"simple-slider-item.edit\":true,\"simple-slider-item.destroy\":true,\"social-login.settings\":true,\"testimonial.index\":true,\"testimonial.create\":true,\"testimonial.edit\":true,\"testimonial.destroy\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true,\"theme-translations.export\":true,\"other-translations.export\":true,\"theme-translations.import\":true,\"other-translations.import\":true,\"api.settings\":true,\"api.sanctum-token.index\":true,\"api.sanctum-token.create\":true,\"api.sanctum-token.destroy\":true}','Admin users role',1,1,1,'2026-05-28 19:11:13','2026-05-28 19:11:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (2,'api_enabled','0',NULL,'2026-05-28 19:12:04'),(3,'activated_plugins','[\"language\",\"language-advanced\",\"ads\",\"analytics\",\"announcement\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"ecommerce\",\"faq\",\"fob-product-size-guide\",\"gallery\",\"location\",\"marketplace\",\"mollie\",\"newsletter\",\"payment\",\"paypal\",\"paypal-payout\",\"paystack\",\"razorpay\",\"request-log\",\"sale-popup\",\"shippo\",\"simple-slider\",\"social-login\",\"sslcommerz\",\"stripe\",\"stripe-connect\",\"testimonial\",\"translation\"]',NULL,'2026-05-28 19:12:04'),(8,'media_random_hash','0acdd88cae6969da4c9207d56b8ae1e0',NULL,'2026-05-28 19:12:04'),(9,'theme','amerce',NULL,'2026-05-28 19:12:04'),(10,'show_admin_bar','1',NULL,'2026-05-28 19:12:04'),(11,'admin_email.0','support@amerce.test',NULL,'2026-05-28 19:12:04'),(12,'admin_logo',NULL,NULL,'2026-05-28 19:12:04'),(13,'admin_favicon',NULL,NULL,'2026-05-28 19:12:04'),(14,'admin_title','Amerce',NULL,'2026-05-28 19:12:04'),(15,'enable_change_admin_theme','1',NULL,'2026-05-28 19:12:04'),(16,'language_hide_default','1',NULL,'2026-05-28 19:12:04'),(17,'language_switcher_display','dropdown',NULL,'2026-05-28 19:12:04'),(18,'language_display','all',NULL,'2026-05-28 19:12:04'),(19,'language_hide_languages','[]',NULL,'2026-05-28 19:12:04'),(20,'locale','en',NULL,'2026-05-28 19:12:04'),(21,'locale_direction','ltr',NULL,'2026-05-28 19:12:04'),(22,'enable_send_error_reporting_via_email','0',NULL,'2026-05-28 19:12:04'),(23,'enable_https','0',NULL,'2026-05-28 19:12:04'),(24,'enable_cache','0',NULL,'2026-05-28 19:12:04'),(25,'cache_admin_menu_enable','1',NULL,'2026-05-28 19:12:04'),(26,'cache_time_site_map','3600',NULL,'2026-05-28 19:12:04'),(27,'enable_send_mail_when_new_user_registered','0',NULL,'2026-05-28 19:12:04'),(28,'enable_send_mail_user_registered_to_admin','0',NULL,'2026-05-28 19:12:04'),(29,'enable_change_password','1',NULL,'2026-05-28 19:12:04'),(30,'enable_register','1',NULL,'2026-05-28 19:12:04'),(31,'enable_recaptcha','0',NULL,'2026-05-28 19:12:04'),(32,'enable_captcha','0',NULL,'2026-05-28 19:12:04'),(33,'show_site_name_when_logged_in','1',NULL,'2026-05-28 19:12:04'),(34,'time_zone','UTC',NULL,'2026-05-28 19:12:04'),(35,'enable_multi_language_in_admin','0',NULL,'2026-05-28 19:12:04'),(36,'media_chunk_enabled','0',NULL,'2026-05-28 19:12:04'),(37,'media_chunk_size','1048576',NULL,'2026-05-28 19:12:04'),(38,'media_max_upload_filesize',NULL,NULL,'2026-05-28 19:12:04'),(39,'media_aws_use_signed_urls','0',NULL,'2026-05-28 19:12:04'),(40,'media_aws_signed_url_expiry','60',NULL,'2026-05-28 19:12:04'),(41,'enable_geo_ip','0',NULL,'2026-05-28 19:12:04'),(42,'enable_audit_log','1',NULL,'2026-05-28 19:12:04'),(43,'payment_cod_status','1',NULL,'2026-05-28 19:12:04'),(44,'payment_bank_transfer_status','1',NULL,'2026-05-28 19:12:04'),(45,'payment_cod_description','Please pay money directly to the postman, if you choose cash on delivery method (COD).',NULL,'2026-05-28 19:12:04'),(46,'payment_bank_transfer_description','Please send money to our bank account: AMERCE - 0123 4567 8901.',NULL,'2026-05-28 19:12:04'),(47,'payment_stripe_payment_type','stripe_checkout',NULL,'2026-05-28 19:12:04'),(48,'plugins_ecommerce_customer_new_order_status','0',NULL,'2026-05-28 19:12:04'),(49,'plugins_ecommerce_admin_new_order_status','0',NULL,'2026-05-28 19:12:04'),(50,'ecommerce_is_enabled_support_digital_products','1',NULL,'2026-05-28 19:12:04'),(51,'ecommerce_enable_license_codes_for_digital_products','1',NULL,'2026-05-28 19:12:04'),(52,'ecommerce_auto_complete_digital_orders_after_payment','1',NULL,'2026-05-28 19:12:04'),(53,'ecommerce_load_countries_states_cities_from_location_plugin','0',NULL,'2026-05-28 19:12:04'),(54,'ecommerce_product_sku_format','AM-%s%s%s%s',NULL,'2026-05-28 19:12:04'),(55,'ecommerce_store_order_prefix','AM',NULL,'2026-05-28 19:12:04'),(56,'ecommerce_enable_product_specification','1',NULL,'2026-05-28 19:12:04'),(57,'payment_bank_transfer_display_bank_info_at_the_checkout_success_page','1',NULL,'2026-05-28 19:12:04'),(58,'payment_cod_logo','payments/cod.png',NULL,'2026-05-28 19:12:04'),(59,'payment_bank_transfer_logo','payments/bank-transfer.png',NULL,'2026-05-28 19:12:04'),(60,'payment_stripe_logo','payments/stripe.webp',NULL,'2026-05-28 19:12:04'),(61,'payment_paypal_logo','payments/paypal.png',NULL,'2026-05-28 19:12:04'),(62,'payment_mollie_logo','payments/mollie.png',NULL,'2026-05-28 19:12:04'),(63,'payment_paystack_logo','payments/paystack.png',NULL,'2026-05-28 19:12:04'),(64,'payment_razorpay_logo','payments/razorpay.png',NULL,'2026-05-28 19:12:04'),(65,'payment_sslcommerz_logo','payments/sslcommerz.png',NULL,'2026-05-28 19:12:04'),(66,'product_size_guide_display_mode','popup',NULL,'2026-05-28 19:12:04'),(67,'show_on_front','12',NULL,'2026-05-28 19:12:04'),(68,'blog_page_id','9',NULL,'2026-05-28 19:12:04'),(69,'theme-amerce-homepage_id','12',NULL,'2026-05-28 19:12:04'),(70,'theme-amerce-blog_page_id','9',NULL,'2026-05-28 19:12:04'),(71,'theme-amerce-logo','general/logo.png',NULL,'2026-05-28 19:12:04'),(72,'theme-amerce-logo_dark','general/logo-white.png',NULL,'2026-05-28 19:12:04'),(73,'theme-amerce-logo_text','Amerce',NULL,'2026-05-28 19:12:04'),(74,'theme-amerce-favicon','general/favicon.png',NULL,'2026-05-28 19:12:04'),(75,'theme-amerce-default_theme_mode','light',NULL,'2026-05-28 19:12:04'),(76,'theme-amerce-header_style','style-2',NULL,'2026-05-28 19:12:04'),(77,'theme-amerce-show_topbar','1',NULL,'2026-05-28 19:12:04'),(78,'theme-amerce-contact_phone','(+01) 1234 8888',NULL,'2026-05-28 19:12:04'),(79,'theme-amerce-topbar_slides','Midseason Sale: 20% Off - Auto Applied at Checkout - Limited Time Only\n20% Off - Auto Applied at Checkout - Limited Time Only',NULL,'2026-05-28 19:12:04'),(80,'theme-amerce-sticky_header','1',NULL,'2026-05-28 19:12:04'),(81,'theme-amerce-header_transparent_on_homepage','0',NULL,'2026-05-28 19:12:04'),(82,'theme-amerce-header_top_background_color','#010F1C',NULL,'2026-05-28 19:12:04'),(83,'theme-amerce-header_top_text_color','#FFFFFF',NULL,'2026-05-28 19:12:04'),(84,'theme-amerce-header_main_background_color','#FFFFFF',NULL,'2026-05-28 19:12:04'),(85,'theme-amerce-header_main_text_color','#1E1E1E',NULL,'2026-05-28 19:12:04'),(86,'theme-amerce-primary_color','#DC4646',NULL,'2026-05-28 19:12:04'),(87,'theme-amerce-secondary_color','#1E1E1E',NULL,'2026-05-28 19:12:04'),(88,'theme-amerce-heading_color','#101010',NULL,'2026-05-28 19:12:04'),(89,'theme-amerce-body_text_color','#696E73',NULL,'2026-05-28 19:12:04'),(90,'theme-amerce-link_color','#DC4646',NULL,'2026-05-28 19:12:04'),(91,'theme-amerce-link_hover_color','#B83838',NULL,'2026-05-28 19:12:04'),(92,'theme-amerce-border_color','#E9E9E9',NULL,'2026-05-28 19:12:04'),(93,'theme-amerce-success_color','#3DAB25',NULL,'2026-05-28 19:12:04'),(94,'theme-amerce-danger_color','#F03E3E',NULL,'2026-05-28 19:12:04'),(95,'theme-amerce-footer_style','style-5',NULL,'2026-05-28 19:12:04'),(96,'theme-amerce-footer_payment_icons','payment/visa.png,payment/master-card.png,payment/amex.png,payment/paypal.png,payment/water.png,payment/discover.png',NULL,'2026-05-28 19:12:04'),(97,'theme-amerce-footer_address','600 N Michigan Ave, Chicago, IL 60611, USA',NULL,'2026-05-28 19:12:04'),(98,'theme-amerce-footer_email','hi.amere@gmail.com',NULL,'2026-05-28 19:12:04'),(99,'theme-amerce-footer_phone','315-666-6688',NULL,'2026-05-28 19:12:04'),(100,'theme-amerce-facebook_url','https://facebook.com',NULL,'2026-05-28 19:12:04'),(101,'theme-amerce-twitter_url','https://x.com',NULL,'2026-05-28 19:12:04'),(102,'theme-amerce-instagram_url','https://instagram.com',NULL,'2026-05-28 19:12:04'),(103,'theme-amerce-tiktok_url','https://tiktok.com',NULL,'2026-05-28 19:12:04'),(104,'theme-amerce-snapchat_url','https://snapchat.com',NULL,'2026-05-28 19:12:04'),(105,'theme-amerce-product_card_default_style','style-2',NULL,'2026-05-28 19:12:04'),(106,'theme-amerce-product_card_hover_style','hover-01',NULL,'2026-05-28 19:12:04'),(107,'theme-amerce-product_card_show_color_swatches','1',NULL,'2026-05-28 19:12:04'),(108,'theme-amerce-default_filter_position','sidebar',NULL,'2026-05-28 19:12:04'),(109,'theme-amerce-default_pagination_style','numbered',NULL,'2026-05-28 19:12:04'),(110,'theme-amerce-ecommerce_product_item_layout','grid',NULL,'2026-05-28 19:12:04'),(111,'theme-amerce-ecommerce_products_per_row','4',NULL,'2026-05-28 19:12:04'),(112,'theme-amerce-ecommerce_products_per_row_tablet','3',NULL,'2026-05-28 19:12:04'),(113,'theme-amerce-ecommerce_products_per_row_mobile','2',NULL,'2026-05-28 19:12:04'),(114,'theme-amerce-enable_quick_view','1',NULL,'2026-05-28 19:12:04'),(115,'theme-amerce-enable_quick_shop','1',NULL,'2026-05-28 19:12:04'),(116,'theme-amerce-preloader_enabled','1',NULL,'2026-05-28 19:12:04'),(117,'theme-amerce-scroll_to_top_enabled','1',NULL,'2026-05-28 19:12:04'),(118,'theme-amerce-homepage_body_class','home-sport',NULL,'2026-05-28 19:12:04'),(119,'theme-amerce-site_title','Amerce',NULL,'2026-05-28 19:12:04'),(120,'theme-amerce-seo_title','Amerce — Multi-Purpose eCommerce Theme',NULL,'2026-05-28 19:12:04'),(121,'theme-amerce-seo_description','Amerce is a multi-purpose eCommerce and marketplace theme for Botble CMS — 21 niche presets, sustainable shopping, and fast checkout.',NULL,'2026-05-28 19:12:04'),(122,'theme-amerce-copyright','©2026 Amerce. All Rights Reserved.',NULL,'2026-05-28 19:12:04'),(123,'theme-amerce-newsletter_popup_enable','1',NULL,'2026-05-28 19:12:04'),(124,'theme-amerce-newsletter_popup_image','section/banner-newsletter.jpg',NULL,'2026-05-28 19:12:04'),(125,'theme-amerce-newsletter_popup_subtitle','Subscribe & Enjoy',NULL,'2026-05-28 19:12:04'),(126,'theme-amerce-newsletter_popup_title','10% OFF',NULL,'2026-05-28 19:12:04'),(127,'theme-amerce-newsletter_popup_description','Join our email list & be first to Receive 10% OFF your next order, exclusive offers & more!',NULL,'2026-05-28 19:12:04'),(128,'theme-amerce-newsletter_popup_delay','5',NULL,'2026-05-28 19:12:04'),(129,'theme-amerce-newsletter_popup_display_pages','[\"public.index\"]',NULL,'2026-05-28 19:12:04'),(130,'theme-amerce-store_phone','+1 666 234 8888',NULL,'2026-05-28 19:12:04'),(131,'theme-amerce-store_email','hi.amere@gmail.com',NULL,'2026-05-28 19:12:04'),(132,'theme-amerce-store_address','2163 Phillips Gap Rd, West Jefferson, North Carolina, United States',NULL,'2026-05-28 19:12:04'),(133,'theme-amerce-store_business_hours_weekday','Mon - Sat: 7:30am - 8:00pm PST',NULL,'2026-05-28 19:12:04'),(134,'theme-amerce-store_business_hours_weekend','Sunday: 9:00am - 5:00pm PST',NULL,'2026-05-28 19:12:04'),(135,'theme-amerce-store_map_address','2163 Phillips Gap Rd, West Jefferson, NC',NULL,'2026-05-28 19:12:04'),(136,'theme-amerce-store_locations','[{\"name\":\"New York Office\",\"image\":\"section\\/store-1.jpg\",\"address\":\"900 Ocean Dr, Miami Beach, FL 33139, US\",\"phone\":\"+1 305 555 2468\",\"email\":\"hi.amerce@gmail.com\"},{\"name\":\"Los Angeles Store\",\"image\":\"section\\/store-2.jpg\",\"address\":\"8723 Melrose Avenue, CA 90069, USA\",\"phone\":\"+1 305 555 2468\",\"email\":\"hi.amerce@gmail.com\"},{\"name\":\"Chicago Boutique\",\"image\":\"section\\/store-3.jpg\",\"address\":\"415 North Clark Street, Chicago, IL 60654, USA\",\"phone\":\"+1 305 555 2468\",\"email\":\"hi.amerce@gmail.com\"},{\"name\":\"Miami Showroom\",\"image\":\"section\\/store-4.jpg\",\"address\":\"1101 Brickell Avenue, Miami, FL 33131, USA\",\"phone\":\"+1 305 555 2468\",\"email\":\"hi.amerce@gmail.com\"},{\"name\":\"London Flagship Store\",\"image\":\"section\\/store-5.jpg\",\"address\":\"152 Regent Street, London W1B 5TF, UK\",\"phone\":\"+44 20 555 2468\",\"email\":\"hi.amerce@gmail.com\"},{\"name\":\"Paris Atelier\",\"image\":\"section\\/store-6.jpg\",\"address\":\"18 Rue du Faubourg Saint-Honor\\u00e9, Paris, France\",\"phone\":\"+33 1 555 2468\",\"email\":\"hi.amerce@gmail.com\"}]',NULL,'2026-05-28 19:12:04'),(137,'theme-amerce-topbar_wrapper_override','bg-dark tf-btn-swiper-main',NULL,'2026-05-28 19:12:04'),(138,'theme-amerce-footer_wrapper_override','footer-s5 type-2 bg-dark',NULL,'2026-05-28 19:12:04'),(139,'theme-amerce-header_show_currency_language','0',NULL,'2026-05-28 19:12:04'),(140,'theme-amerce-footer_hero_text','AMERCE STORE',NULL,'2026-05-28 19:12:04'),(141,'theme-amerce-vi-topbar_text','Miễn phí vận chuyển cho đơn hàng trên 99$',NULL,'2026-05-28 19:12:04'),(142,'theme-amerce-vi-site_title','Amerce',NULL,'2026-05-28 19:12:04'),(143,'theme-amerce-vi-seo_title','Amerce — Theme Thương mại điện tử Đa năng',NULL,'2026-05-28 19:12:04'),(144,'theme-amerce-vi-seo_description','Amerce là theme thương mại điện tử và marketplace đa năng dành cho Botble CMS — 21 preset theo từng ngách, mua sắm bền vững và thanh toán nhanh.',NULL,'2026-05-28 19:12:04'),(145,'theme-amerce-vi-copyright','© 2026 Amerce. Bảo lưu mọi quyền.',NULL,'2026-05-28 19:12:04'),(146,'theme-amerce-vi-header_account_label','Đăng nhập/Đăng ký',NULL,'2026-05-28 19:12:04'),(147,'theme-amerce-vi-header_bottom_offer_text','Ưu Đãi Đặc Biệt!',NULL,'2026-05-28 19:12:04'),(148,'theme-amerce-vi-footer_marquee_text','AMERCE THƯƠNG MẠI ĐIỆN TỬ ĐA NĂNG',NULL,'2026-05-28 19:12:04'),(149,'theme-amerce-vi-header_announcement_slides','Khuyến Mãi Giữa Mùa: Giảm 20% - Tự Động Áp Dụng Khi Thanh Toán - Số Lượng Có Hạn\nGiảm 20% - Tự Động Áp Dụng Khi Thanh Toán - Số Lượng Có Hạn',NULL,'2026-05-28 19:12:04'),(150,'theme-amerce-vi-topbar_slides','Khuyến Mãi Giữa Mùa: Giảm 20% - Tự Động Áp Dụng Khi Thanh Toán - Chỉ Trong Thời Gian Giới Hạn\nGiảm 20% - Tự Động Áp Dụng Khi Thanh Toán - Chỉ Trong Thời Gian Giới Hạn',NULL,'2026-05-28 19:12:04'),(151,'theme-amerce-ar-topbar_text','شحن مجاني للطلبات التي تزيد عن 99 دولارًا',NULL,'2026-05-28 19:12:04'),(152,'theme-amerce-ar-site_title','أميرس',NULL,'2026-05-28 19:12:04'),(153,'theme-amerce-ar-seo_title','Amerce — موضوع التجارة الإلكترونية متعدد الأغراض',NULL,'2026-05-28 19:12:04'),(154,'theme-amerce-ar-seo_description','Amerce هو موضوع متعدد الأغراض للتجارة الإلكترونية والسوق لـ Botble CMS - 21 إعدادًا مسبقًا متخصصًا وتسوقًا مستدامًا وسداد سريع.',NULL,'2026-05-28 19:12:04'),(155,'theme-amerce-ar-copyright','© 2026 أمريكا. جميع الحقوق محفوظة.',NULL,'2026-05-28 19:12:04'),(156,'theme-amerce-ar-header_account_label','تسجيل الدخول / التسجيل',NULL,'2026-05-28 19:12:04'),(157,'theme-amerce-ar-header_bottom_offer_text','عرض خاص!',NULL,'2026-05-28 19:12:04'),(158,'theme-amerce-ar-footer_marquee_text','AMERCE التجارة الإلكترونية متعددة الوظائف',NULL,'2026-05-28 19:12:04'),(159,'theme-amerce-ar-header_announcement_slides','عرض منتصف الموسم: خصم 20% - يتم تطبيقه تلقائيًا عند الدفع - الكمية محدودة\nخصم 20% - يتم تطبيقه تلقائيًا عند الدفع - الكمية محدودة',NULL,'2026-05-28 19:12:04'),(160,'theme-amerce-ar-topbar_slides','عرض منتصف الموسم: خصم 20% - يُطبق تلقائيًا عند الدفع - لفترة محدودة فقط\nخصم 20% - يُطبق تلقائيًا عند الدفع - لفترة محدودة فقط',NULL,'2026-05-28 19:12:04'),(161,'theme-amerce-fr-topbar_text','Livraison gratuite pour les commandes de plus de 99 $',NULL,'2026-05-28 19:12:04'),(162,'theme-amerce-fr-site_title','Amérique',NULL,'2026-05-28 19:12:04'),(163,'theme-amerce-fr-seo_title','Amerce — Thème de commerce électronique polyvalent',NULL,'2026-05-28 19:12:04'),(164,'theme-amerce-fr-seo_description','Amerce est un thème polyvalent de commerce électronique et de marché pour Botble CMS : 21 préréglages de niche, achats durables et paiement rapide.',NULL,'2026-05-28 19:12:04'),(165,'theme-amerce-fr-copyright','© 2026 Amérique. Tous droits réservés.',NULL,'2026-05-28 19:12:04'),(166,'theme-amerce-fr-header_account_label','Connexion/Inscription',NULL,'2026-05-28 19:12:04'),(167,'theme-amerce-fr-header_bottom_offer_text','Offre spéciale!',NULL,'2026-05-28 19:12:04'),(168,'theme-amerce-fr-footer_marquee_text','COMMERCE ÉLECTRONIQUE MULTIFONCTIONNEL AMERCE',NULL,'2026-05-28 19:12:04'),(169,'theme-amerce-fr-header_announcement_slides','Promotion mi-saison : 20 % de réduction - Appliquée automatiquement à la caisse - Quantité limitée\n20 % de réduction - Appliqué automatiquement à la caisse - Quantité limitée',NULL,'2026-05-28 19:12:04'),(170,'theme-amerce-fr-topbar_slides','Promotion de mi-saison : 20 % de réduction - Appliquée automatiquement à la caisse - Durée limitée seulement\n20 % de réduction - Appliqué automatiquement à la caisse - Durée limitée uniquement',NULL,'2026-05-28 19:12:04'),(171,'theme-amerce-id-topbar_text','Pengiriman gratis untuk pesanan di atas $99',NULL,'2026-05-28 19:12:04'),(172,'theme-amerce-id-site_title','Mendenda',NULL,'2026-05-28 19:12:04'),(173,'theme-amerce-id-seo_title','Amerce — Tema eCommerce Serbaguna',NULL,'2026-05-28 19:12:04'),(174,'theme-amerce-id-seo_description','Amerce adalah tema e-niaga dan pasar multiguna untuk Botble CMS — 21 preset khusus, belanja berkelanjutan, dan pembayaran cepat.',NULL,'2026-05-28 19:12:04'),(175,'theme-amerce-id-copyright','© 2026 Amerika. Semua hak dilindungi undang-undang.',NULL,'2026-05-28 19:12:04'),(176,'theme-amerce-id-header_account_label','Masuk/Daftar',NULL,'2026-05-28 19:12:04'),(177,'theme-amerce-id-header_bottom_offer_text','Penawaran khusus!',NULL,'2026-05-28 19:12:04'),(178,'theme-amerce-id-footer_marquee_text','E-COMMERCE MULTI-FUNGSIONAL AMERCE',NULL,'2026-05-28 19:12:04'),(179,'theme-amerce-id-header_announcement_slides','Promosi Pertengahan Musim: Diskon 20% - Otomatis diterapkan saat checkout - Jumlah terbatas\nDiskon 20% - Diterapkan Secara Otomatis Saat Checkout - Jumlah Terbatas',NULL,'2026-05-28 19:12:04'),(180,'theme-amerce-id-topbar_slides','Promosi Pertengahan Musim: Diskon 20% - Berlaku Otomatis saat Checkout - Hanya Waktu Terbatas\nDiskon 20% - Berlaku Otomatis saat Checkout - Hanya Waktu Terbatas',NULL,'2026-05-28 19:12:04'),(181,'theme-amerce-tr-topbar_text','99$ üzeri siparişlerde ücretsiz gönderim',NULL,'2026-05-28 19:12:04'),(182,'theme-amerce-tr-site_title','Amerce',NULL,'2026-05-28 19:12:04'),(183,'theme-amerce-tr-seo_title','Amerce — Çok Amaçlı e-Ticaret Teması',NULL,'2026-05-28 19:12:04'),(184,'theme-amerce-tr-seo_description','Amerce, Botble CMS için çok amaçlı bir e-ticaret ve pazar yeri temasıdır - 21 niş ön ayar, sürdürülebilir alışveriş ve hızlı ödeme.',NULL,'2026-05-28 19:12:04'),(185,'theme-amerce-tr-copyright','© 2026 Amerika. Her hakkı saklıdır.',NULL,'2026-05-28 19:12:04'),(186,'theme-amerce-tr-header_account_label','Giriş yap/Kayıt ol',NULL,'2026-05-28 19:12:04'),(187,'theme-amerce-tr-header_bottom_offer_text','Özel Teklif!',NULL,'2026-05-28 19:12:04'),(188,'theme-amerce-tr-footer_marquee_text','AMERCE ÇOK FONKSİYONLU E-TİCARET',NULL,'2026-05-28 19:12:04'),(189,'theme-amerce-tr-header_announcement_slides','Sezon Ortası Promosyonu: %20 indirim - Ödeme sırasında otomatik olarak uygulanır - Sınırlı miktar\n%20 İndirim - Ödeme Sırasında Otomatik Olarak Uygulanır - Sınırlı Adet',NULL,'2026-05-28 19:12:04'),(190,'theme-amerce-tr-topbar_slides','Sezon Ortası Promosyonu: %20 İndirim - Ödeme Sırasında Otomatik Olarak Uygulanır - Yalnızca Sınırlı Süre için\n%20 İndirim - Ödeme Sırasında Otomatik Olarak Uygulanır - Yalnızca Sınırlı Süre için',NULL,'2026-05-28 19:12:04'),(191,'media_sizes_hero-sm_height','0',NULL,'2026-05-28 19:12:04'),(192,'media_sizes_hero-md_height','0',NULL,NULL);
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
INSERT INTO `simple_slider_items` VALUES (1,1,'Unlock your strength\nand go beyond limits.','slider/slider-22.jpg','/products','',0,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(2,1,'Activewear that\nsupports every move.','slider/slider-23.jpg','/products','',1,'published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(3,1,'Premium sportswear built\nto power every move.','slider/slider-24.jpg','/products','',2,'published','2026-05-28 19:11:13','2026-05-28 19:11:13');
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
INSERT INTO `simple_sliders` VALUES (1,'Homepage Hero','home-hero','Primary hero slider used on the Main homepage.','published','2026-05-28 19:11:13','2026-05-28 19:11:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'trends',1,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 19:11:13','2026-05-28 19:11:13'),(2,'styling-tips',2,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 19:11:13','2026-05-28 19:11:13'),(3,'sustainable',3,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 19:11:13','2026-05-28 19:11:13'),(4,'new-arrivals',4,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 19:11:13','2026-05-28 19:11:13'),(5,'limited-edition',5,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 19:11:13','2026-05-28 19:11:13'),(6,'behind-the-scenes',6,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 19:11:13','2026-05-28 19:11:13'),(7,'buyer-guide',7,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 19:11:13','2026-05-28 19:11:13'),(8,'care-tips',8,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 19:11:13','2026-05-28 19:11:13'),(9,'capsule-wardrobe',9,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 19:11:13','2026-05-28 19:11:13'),(10,'material-stories',10,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 19:11:13','2026-05-28 19:11:13'),(11,'holiday-gifting',11,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 19:11:13','2026-05-28 19:11:13'),(12,'editor-picks',12,'Botble\\Blog\\Models\\Tag','tag','2026-05-28 19:11:13','2026-05-28 19:11:13'),(13,'training',1,'Botble\\Blog\\Models\\Category','','2026-05-28 19:11:13','2026-05-28 19:11:13'),(14,'recovery',2,'Botble\\Blog\\Models\\Category','','2026-05-28 19:11:13','2026-05-28 19:11:13'),(15,'gear-reviews',3,'Botble\\Blog\\Models\\Category','','2026-05-28 19:11:13','2026-05-28 19:11:13'),(16,'lifestyle',4,'Botble\\Blog\\Models\\Category','','2026-05-28 19:11:13','2026-05-28 19:11:13'),(17,'sports-news',5,'Botble\\Blog\\Models\\Category','','2026-05-28 19:11:13','2026-05-28 19:11:13'),(18,'recovery-routines-that-actually-work',1,'Botble\\Blog\\Models\\Post','','2026-05-28 19:11:13','2026-05-28 19:11:13'),(19,'build-a-routine-that-sticks',2,'Botble\\Blog\\Models\\Post','','2026-05-28 19:11:13','2026-05-28 19:11:13'),(20,'how-to-pick-the-right-yoga-mat',3,'Botble\\Blog\\Models\\Post','','2026-05-28 19:11:13','2026-05-28 19:11:13'),(21,'strength-training-basics',4,'Botble\\Blog\\Models\\Post','','2026-05-28 19:11:13','2026-05-28 19:11:13'),(22,'pickleball-for-beginners',5,'Botble\\Blog\\Models\\Post','','2026-05-28 19:11:13','2026-05-28 19:11:13'),(23,'hydration-during-workouts',6,'Botble\\Blog\\Models\\Post','','2026-05-28 19:11:14','2026-05-28 19:11:14'),(24,'running-shoes',1,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 19:11:14','2026-05-28 19:11:14'),(25,'hand-weights',2,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 19:11:14','2026-05-28 19:11:14'),(26,'sports-apparel',3,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 19:11:14','2026-05-28 19:11:14'),(27,'yoga-mats',4,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 19:11:14','2026-05-28 19:11:14'),(28,'pickleball',5,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2026-05-28 19:11:14','2026-05-28 19:11:14'),(29,'mens-running-jf1901-grip-white',1,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:11:23','2026-05-28 19:11:23'),(30,'set-of-2-3kg-hand-weights',2,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:11:24','2026-05-28 19:11:24'),(31,'tennis-ball-with-elastic-string',3,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:11:24','2026-05-28 19:11:24'),(32,'pickleball-racket-kuikma-open-blue',4,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:11:24','2026-05-28 19:11:24'),(33,'mens-sports-t-shirt-dry-brown',5,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:11:24','2026-05-28 19:11:24'),(34,'womens-thin-and-light-sports-shorts-black',6,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:11:25','2026-05-28 19:11:25'),(35,'4mm-ultra-grip-yoga-mat-blue-grip',7,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:11:25','2026-05-28 19:11:25'),(36,'20l-sports-bag-gray',8,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:11:25','2026-05-28 19:11:25'),(37,'resistance-bands-set',9,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:11:26','2026-05-28 19:11:26'),(38,'foam-roller-pro',10,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:11:26','2026-05-28 19:11:26'),(39,'anthro-studio',1,'Botble\\Marketplace\\Models\\Store','stores','2026-05-28 19:11:39','2026-05-28 19:11:39'),(40,'crate-furniture-co',2,'Botble\\Marketplace\\Models\\Store','stores','2026-05-28 19:11:39','2026-05-28 19:11:39'),(41,'findr-audio',3,'Botble\\Marketplace\\Models\\Store','stores','2026-05-28 19:11:39','2026-05-28 19:11:39'),(42,'bohome-living',4,'Botble\\Marketplace\\Models\\Store','stores','2026-05-28 19:11:39','2026-05-28 19:11:39'),(43,'about',1,'Botble\\Page\\Models\\Page','','2026-05-28 19:11:40','2026-05-28 19:11:40'),(44,'contact',2,'Botble\\Page\\Models\\Page','','2026-05-28 19:11:40','2026-05-28 19:11:40'),(45,'faq',3,'Botble\\Page\\Models\\Page','','2026-05-28 19:11:40','2026-05-28 19:11:40'),(46,'privacy-policy',4,'Botble\\Page\\Models\\Page','','2026-05-28 19:11:40','2026-05-28 19:11:40'),(47,'terms-conditions',5,'Botble\\Page\\Models\\Page','','2026-05-28 19:11:40','2026-05-28 19:11:40'),(48,'returns-refunds',6,'Botble\\Page\\Models\\Page','','2026-05-28 19:11:40','2026-05-28 19:11:40'),(49,'shipping',7,'Botble\\Page\\Models\\Page','','2026-05-28 19:11:40','2026-05-28 19:11:40'),(50,'our-stores',8,'Botble\\Page\\Models\\Page','','2026-05-28 19:11:40','2026-05-28 19:11:40'),(51,'blog',9,'Botble\\Page\\Models\\Page','','2026-05-28 19:11:40','2026-05-28 19:11:40'),(52,'careers',10,'Botble\\Page\\Models\\Page','','2026-05-28 19:11:40','2026-05-28 19:11:40'),(53,'sustainability',11,'Botble\\Page\\Models\\Page','','2026-05-28 19:11:40','2026-05-28 19:11:40'),(54,'homepage',12,'Botble\\Page\\Models\\Page','','2026-05-28 19:11:46','2026-05-28 19:11:46'),(55,'mens-running-jf1901-grip-white',11,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:12:03','2026-05-28 19:12:03'),(56,'mens-running-jf1901-grip-white',12,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:12:03','2026-05-28 19:12:03'),(57,'mens-running-jf1901-grip-white',13,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:12:03','2026-05-28 19:12:03'),(58,'tennis-ball-with-elastic-string',14,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:12:03','2026-05-28 19:12:03'),(59,'tennis-ball-with-elastic-string',15,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:12:03','2026-05-28 19:12:03'),(60,'pickleball-racket-kuikma-open-blue',16,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:12:03','2026-05-28 19:12:03'),(61,'pickleball-racket-kuikma-open-blue',17,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:12:03','2026-05-28 19:12:03'),(62,'pickleball-racket-kuikma-open-blue',18,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:12:03','2026-05-28 19:12:03'),(63,'4mm-ultra-grip-yoga-mat-blue-grip',19,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:12:03','2026-05-28 19:12:03'),(64,'4mm-ultra-grip-yoga-mat-blue-grip',20,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:12:03','2026-05-28 19:12:03'),(65,'4mm-ultra-grip-yoga-mat-blue-grip',21,'Botble\\Ecommerce\\Models\\Product','products','2026-05-28 19:12:03','2026-05-28 19:12:03'),(66,'carolin',1,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 19:12:03','2026-05-28 19:12:03'),(67,'cheryl',2,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 19:12:03','2026-05-28 19:12:03'),(68,'panadoxn',3,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 19:12:03','2026-05-28 19:12:03'),(69,'shangxi',4,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 19:12:03','2026-05-28 19:12:03'),(70,'textitles',5,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 19:12:03','2026-05-28 19:12:03'),(71,'vanfaba',6,'Botble\\Ecommerce\\Models\\Brand','brands','2026-05-28 19:12:03','2026-05-28 19:12:03'),(72,'cotton',1,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:12:03','2026-05-28 19:12:03'),(73,'linen',2,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:12:03','2026-05-28 19:12:03'),(74,'wool',3,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:12:03','2026-05-28 19:12:03'),(75,'leather',4,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:12:03','2026-05-28 19:12:03'),(76,'tencel',5,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:12:03','2026-05-28 19:12:03'),(77,'recycled',6,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:12:03','2026-05-28 19:12:03'),(78,'made-in-portugal',7,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:12:03','2026-05-28 19:12:03'),(79,'made-in-italy',8,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:12:03','2026-05-28 19:12:03'),(80,'hand-crafted',9,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:12:03','2026-05-28 19:12:03'),(81,'vegan',10,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:12:03','2026-05-28 19:12:03'),(82,'limited-run',11,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:12:03','2026-05-28 19:12:03'),(83,'best-seller',12,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:12:03','2026-05-28 19:12:03'),(84,'new-arrival',13,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:12:03','2026-05-28 19:12:03'),(85,'editor-pick',14,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:12:03','2026-05-28 19:12:03'),(86,'eco-friendly',15,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2026-05-28 19:12:03','2026-05-28 19:12:03'),(87,'performance',1,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 19:12:03','2026-05-28 19:12:03'),(88,'precision-gear',2,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 19:12:03','2026-05-28 19:12:03'),(89,'peak-performance',3,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 19:12:03','2026-05-28 19:12:03'),(90,'strength-training-essentials',4,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 19:12:03','2026-05-28 19:12:03'),(91,'outdoor-active-protection-gear',5,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 19:12:03','2026-05-28 19:12:03'),(92,'court-sports-game-gear',6,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 19:12:03','2026-05-28 19:12:03'),(93,'best-sellers',7,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 19:12:03','2026-05-28 19:12:03'),(94,'new-arrivals',8,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 19:12:03','2026-05-28 19:12:03'),(95,'featured',9,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2026-05-28 19:12:03','2026-05-28 19:12:03');
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
INSERT INTO `slugs_translations` VALUES ('ar',1,'alatgahat','tag'),('fr',1,'tendances','tag'),('id',1,'tren','tag'),('tr',1,'trends','tag'),('vi',1,'xu-huong','tag'),('fr',2,'conseils-de-style','tag'),('vi',2,'meo-phoi-do','tag'),('ar',2,'nsayh-altsmym','tag'),('tr',2,'styling-tips','tag'),('id',2,'tip-penataan-gaya','tag'),('vi',3,'ben-vung','tag'),('id',3,'berkelanjutan','tag'),('fr',3,'durable','tag'),('ar',3,'mstmr','tag'),('tr',3,'sustainable','tag'),('ar',4,'aloafdon-algdd','tag'),('vi',4,'hang-moi-ve','tag'),('tr',4,'new-arrivals','tag'),('fr',4,'nouveautes','tag'),('id',4,'pendatang-baru','tag'),('id',5,'edisi-terbatas','tag'),('fr',5,'edition-limitee','tag'),('tr',5,'limited-edition','tag'),('vi',5,'phien-ban-gioi-han','tag'),('ar',5,'tbaa-mhdod','tag'),('tr',6,'behind-the-scenes','tag'),('fr',6,'dans-les-coulisses','tag'),('id',6,'di-belakang-layar','tag'),('vi',6,'hau-truong','tag'),('ar',6,'khlf-alkoalys','tag'),('tr',7,'buyer-guide','tag'),('vi',7,'cam-nang-mua-sam','tag'),('ar',7,'dlyl-almshtry','tag'),('fr',7,'guide-de-lacheteur','tag'),('id',7,'panduan-pembeli','tag'),('tr',8,'care-tips','tag'),('fr',8,'conseils-dentretien','tag'),('vi',8,'meo-bao-quan','tag'),('ar',8,'nsayh-alaanay','tag'),('id',8,'tip-perawatan','tag'),('fr',9,'armoire-capsule','tag'),('tr',9,'capsule-wardrobe','tag'),('ar',9,'khzan-kbsol','tag'),('id',9,'lemari-kapsul','tag'),('vi',9,'tu-do-capsule','tag'),('id',10,'cerita-materi','tag'),('vi',10,'chuyen-vat-lieu','tag'),('fr',10,'histoires-materielles','tag'),('ar',10,'kss-mady','tag'),('tr',10,'material-stories','tag'),('fr',11,'cadeaux-de-vacances','tag'),('id',11,'hadiah-liburan','tag'),('ar',11,'hdaya-alaayd','tag'),('tr',11,'holiday-gifting','tag'),('vi',11,'qua-tang-dip-le','tag'),('ar',12,'akhtyarat-almhrr','tag'),('vi',12,'bien-tap-vien-chon','tag'),('fr',12,'choix-de-lediteur','tag'),('tr',12,'editor-picks','tag'),('id',12,'pilihan-editor','tag'),('tr',13,'egitim',''),('fr',13,'entrainement',''),('vi',13,'huan-luyen',''),('id',13,'pelatihan',''),('ar',13,'tmryn',''),('ar',14,'astaaad',''),('tr',14,'iyilesmek',''),('id',14,'pemulihan',''),('vi',14,'phuc-hoi',''),('fr',14,'recuperation',''),('fr',15,'avis-sur-les-equipements',''),('vi',15,'danh-gia-dung-cu',''),('tr',15,'disli-incelemeleri',''),('ar',15,'mragaaat-alaatad',''),('id',15,'ulasan-perlengkapan',''),('id',16,'gaya-hidup',''),('fr',16,'mode-de-vie',''),('ar',16,'nmt-alhya',''),('vi',16,'phong-cach-song',''),('tr',16,'yasam-tarzi',''),('fr',17,'actualites-sportives',''),('ar',17,'akhbar-alryad',''),('id',17,'berita-olahraga',''),('tr',17,'spor-haberleri',''),('vi',17,'tin-tuc-the-thao',''),('ar',18,'agraaaat-alastrdad-alty-taaml-balfaal',''),('fr',18,'des-routines-de-recuperation-qui-fonctionnent-reellement',''),('vi',18,'nhung-thoi-quen-phuc-hoi-thuc-su-hieu-qua',''),('tr',18,'recovery-routines-that-actually-work',''),('id',18,'rutinitas-pemulihan-yang-benar-benar-berfungsi',''),('id',19,'bangun-rutinitas-yang-menempel',''),('tr',19,'build-a-routine-that-sticks',''),('fr',19,'creez-une-routine-qui-colle',''),('ar',19,'km-bbnaaa-rotyn-thabt',''),('vi',19,'xay-dung-thoi-quen-ben-vung',''),('vi',20,'cach-chon-tham-yoga-phu-hop',''),('id',20,'cara-memilih-matras-yoga-yang-tepat',''),('fr',20,'comment-choisir-le-bon-tapis-de-yoga',''),('tr',20,'how-to-pick-the-right-yoga-mat',''),('ar',20,'kyfy-akhtyar-sgad-alyogha-almnasb',''),('ar',21,'asasyat-tdryb-alko',''),('fr',21,'bases-de-lentrainement-en-force',''),('id',21,'dasar-dasar-pelatihan-kekuatan',''),('vi',21,'kien-thuc-co-ban-ve-tap-suc-manh',''),('tr',21,'strength-training-basics',''),('ar',22,'kr-almkhll-llmbtdyyn',''),('vi',22,'pickleball-cho-nguoi-moi-bat-dau',''),('tr',22,'pickleball-for-beginners',''),('fr',22,'pickleball-pour-les-debutants',''),('id',22,'pickleball-untuk-pemula',''),('ar',23,'altrtyb-athnaaa-altdrybat',''),('vi',23,'bo-sung-nuoc-trong-khi-tap-luyen',''),('id',23,'hidrasi-selama-latihan',''),('fr',23,'hydratation-pendant-les-entrainements',''),('tr',23,'hydration-during-workouts',''),('ar',24,'ahthy-algry','product-categories'),('fr',24,'chaussures-de-course','product-categories'),('vi',24,'giay-chay-bo','product-categories'),('tr',24,'kosu-ayakkabisi','product-categories'),('id',24,'sepatu-lari','product-categories'),('ar',25,'aozan-alyd','product-categories'),('id',25,'beban-tangan','product-categories'),('tr',25,'el-agirliklari','product-categories'),('fr',25,'poids-a-main','product-categories'),('vi',25,'ta-tay','product-categories'),('ar',26,'almlabs-alryady','product-categories'),('id',26,'pakaian-olahraga','product-categories'),('tr',26,'spor-giyim','product-categories'),('vi',26,'trang-phuc-the-thao','product-categories'),('fr',26,'vetements-de-sport','product-categories'),('id',27,'matras-yoga','product-categories'),('ar',27,'sgadat-alyogha','product-categories'),('fr',27,'tapis-de-yoga','product-categories'),('vi',27,'tham-yoga','product-categories'),('tr',27,'yoga-matlari','product-categories'),('id',28,'bola-acar','product-categories'),('ar',28,'byklbol','product-categories'),('fr',28,'pickleball','product-categories'),('vi',28,'pickleball','product-categories'),('tr',28,'tursu-topu','product-categories'),('tr',29,'erkek-kosu-jf1901-grip-beyaz','products'),('vi',29,'giay-chay-bo-nam-jf1901-grip-white','products'),('fr',29,'homme-running-jf1901-grip-blanc','products'),('ar',29,'hthaaa-gry-llrgal-jf1901-ballon-alabyd','products'),('id',29,'lari-pria-jf1901-grip-putih','products'),('tr',30,'2li-3kg-el-agirligi-seti','products'),('vi',30,'bo-2-ta-tay-3kg','products'),('fr',30,'lot-de-2-poids-a-main-de-3-kg','products'),('ar',30,'mgmoaa-mn-aozan-ydoy-3-kgm','products'),('id',30,'set-2-beban-tangan-3kg','products'),('fr',31,'balle-de-tennis-avec-corde-elastique','products'),('id',31,'bola-tenis-dengan-tali-elastis','products'),('vi',31,'bong-tennis-co-day-thun','products'),('tr',31,'elastik-ipli-tenis-topu','products'),('ar',31,'kr-tns-bkhyt-mtaty','products'),('ar',32,'mdrb-kr-albysbol-koykma-mftoh-ballon-alazrk','products'),('tr',32,'pickleball-raketi-kuikma-acik-mavi','products'),('id',32,'raket-pickleball-kuikma-terbuka-biru','products'),('fr',32,'raquette-de-pickleball-kuikma-open-bleu','products'),('vi',32,'vot-pickleball-kuikma-open-blue','products'),('vi',33,'ao-thun-the-thao-nam-dry-brown','products'),('tr',33,'erkek-spor-tisort-kuru-kahverengi','products'),('id',33,'kaos-olahraga-pria-coklat-kering','products'),('fr',33,'t-shirt-de-sport-homme-marron-sec','products'),('ar',33,'tyshyrt-ryady-rgaly-bny-gaf','products'),('id',34,'celana-pendek-olahraga-wanita-tipis-dan-ringan-warna-hitam','products'),('tr',34,'kadin-ince-ve-hafif-spor-sort-siyah','products'),('vi',34,'quan-short-the-thao-nu-mong-nhe-mau-den','products'),('fr',34,'short-de-sport-fin-et-leger-pour-femme-noir','products'),('ar',34,'short-ryady-rkyk-okhfyf-llsydat-ballon-alasod','products'),('tr',35,'4mm-ultra-grip-yoga-minderi-mavi-grip','products'),('id',35,'matras-yoga-ultra-grip-4mm-pegangan-biru','products'),('ar',35,'sgad-yoga-altra-gryb-4-mlm-kbd-zrkaaa','products'),('fr',35,'tapis-de-yoga-ultra-grip-4-mm-grip-bleu','products'),('vi',35,'tham-yoga-sieu-bam-4mm-blue-grip','products'),('tr',36,'20l-spor-canta-gri','products'),('ar',36,'hkyb-ryady-saa-20-ltr-rmady','products'),('fr',36,'sac-de-sport-20l-gris','products'),('id',36,'tas-olahraga-20l-abu-abu','products'),('vi',36,'tui-the-thao-20l-mau-xam','products'),('vi',37,'bo-day-khang-luc','products'),('tr',37,'direnc-bantlari-seti','products'),('fr',37,'ensemble-de-bandes-de-resistance','products'),('id',37,'kumpulan-pita-perlawanan','products'),('ar',37,'mgmoaa-aasabat-almkaom','products'),('id',38,'busa-rol-pro','products'),('vi',38,'con-lan-mut-pro','products'),('tr',38,'kopuk-rulo-pro','products'),('ar',38,'rgho-alrol-bro','products'),('fr',38,'rouleau-en-mousse-pro','products'),('fr',43,'a-propos',''),('ar',43,'aan',''),('vi',43,'gioi-thieu',''),('tr',43,'hakkinda',''),('id',43,'tentang',''),('ar',44,'atsal',''),('fr',44,'contact',''),('id',44,'kontak',''),('vi',44,'lien-he',''),('tr',44,'temas-etmek',''),('vi',45,'cau-hoi-thuong-gap',''),('ar',45,'faq',''),('fr',45,'faq',''),('id',45,'faq',''),('tr',45,'faq',''),('vi',46,'chinh-sach-bao-mat',''),('tr',46,'gizlilik-politikasi',''),('id',46,'kebijakan-privasi',''),('fr',46,'politique-de-confidentialite',''),('ar',46,'syas-alkhsosy',''),('ar',47,'alshrot-oalahkam',''),('fr',47,'conditions-generales',''),('vi',47,'dieu-khoan-dieu-kien',''),('tr',47,'sartlar-ve-kosullar',''),('id',47,'syarat-ketentuan',''),('ar',48,'alaaoayd-oalmbalgh-almstrd',''),('vi',48,'doi-tra-hoan-tien',''),('tr',48,'iade-ve-para-iadeleri',''),('id',48,'pengembalian-pengembalian-dana',''),('fr',48,'retours-et-remboursements',''),('fr',49,'expedition',''),('tr',49,'nakliye',''),('id',49,'pengiriman',''),('ar',49,'shhn',''),('vi',49,'van-chuyen',''),('vi',50,'he-thong-cua-hang',''),('tr',50,'magazalarimiz',''),('ar',50,'mtagrna',''),('fr',50,'nos-magasins',''),('id',50,'toko-kami',''),('ar',51,'blog',''),('fr',51,'blog',''),('id',51,'blog',''),('tr',51,'blog',''),('vi',51,'tap-chi',''),('fr',52,'carrieres',''),('id',52,'karir',''),('tr',52,'kariyer',''),('ar',52,'othayf',''),('vi',52,'tuyen-dung',''),('ar',53,'sustainability',''),('fr',53,'sustainability',''),('id',53,'sustainability',''),('tr',53,'sustainability',''),('vi',53,'sustainability',''),('ar',54,'alsfh-alryysy',''),('tr',54,'ana-sayfa',''),('id',54,'beranda',''),('fr',54,'page-daccueil',''),('vi',54,'trang-chu','');
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
INSERT INTO `tags` VALUES (1,'Trends',1,'Botble\\ACL\\Models\\User','Articles tagged with Trends.','published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(2,'Styling Tips',1,'Botble\\ACL\\Models\\User','Articles tagged with Styling Tips.','published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(3,'Sustainable',1,'Botble\\ACL\\Models\\User','Articles tagged with Sustainable.','published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(4,'New Arrivals',1,'Botble\\ACL\\Models\\User','Articles tagged with New Arrivals.','published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(5,'Limited Edition',1,'Botble\\ACL\\Models\\User','Articles tagged with Limited Edition.','published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(6,'Behind the Scenes',1,'Botble\\ACL\\Models\\User','Articles tagged with Behind the Scenes.','published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(7,'Buyer Guide',1,'Botble\\ACL\\Models\\User','Articles tagged with Buyer Guide.','published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(8,'Care Tips',1,'Botble\\ACL\\Models\\User','Articles tagged with Care Tips.','published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(9,'Capsule Wardrobe',1,'Botble\\ACL\\Models\\User','Articles tagged with Capsule Wardrobe.','published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(10,'Material Stories',1,'Botble\\ACL\\Models\\User','Articles tagged with Material Stories.','published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(11,'Holiday Gifting',1,'Botble\\ACL\\Models\\User','Articles tagged with Holiday Gifting.','published','2026-05-28 19:11:13','2026-05-28 19:11:13'),(12,'Editor Picks',1,'Botble\\ACL\\Models\\User','Articles tagged with Editor Picks.','published','2026-05-28 19:11:13','2026-05-28 19:11:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'Sophia Ramirez','\"I\'m in love with this custom night light! It\'s the perfect little touch for our holiday decor, and my kids get excited seeing our names lit up every evening.\"','testimonials/tes-28.jpg','Verified Buyer','published','2026-05-28 19:11:40','2026-05-28 19:11:40'),(2,'Emma Collins','\"This suede bowling bag is an game-changer for everyday carry. The suede material feels incredibly luxurious and soft to the touch, instantly elevating any outfit.\"','testimonials/tes-27.jpg','Verified Buyer','published','2026-05-28 19:11:40','2026-05-28 19:11:40');
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
INSERT INTO `testimonials_translations` VALUES ('ar',1,'صوفيا راميريز','\"لم تبدو بشرتي أكثر تناسقًا من أي وقت مضى. في غضون أسبوعين فقط، أصبح الإشراق واضحًا بالفعل - يستمر الأصدقاء في سؤالي عما قمت بتغييره في روتيني.\"','تم التحقق من المشتري'),('ar',2,'إيما كولينز','\"إن ملابس الأطفال ناعمة للغاية ودافئة للغاية ولطيفة على البشرة الرقيقة - ينام مولودي الجديد بشكل سليم الآن!\"','تم التحقق من المشتري'),('fr',1,'Sophie Ramírez','\"Ma peau n\'a jamais été aussi uniforme. En seulement deux semaines, l\'éclat est déjà évident : mes amis n\'arrêtent pas de me demander ce que j\'ai changé dans ma routine.\"','Acheteur vérifié'),('fr',2,'Emma Collins','\"Les bodys pour bébé sont extrêmement doux, très chauds et doux pour la peau tendre — mon nouveau-né dort si profondément maintenant !\"','Acheteur vérifié'),('id',1,'Sophia Ramirez','\"Kulit saya tidak pernah tampak lebih rata lagi. Hanya dalam dua minggu kulit saya sudah terlihat bercahaya - teman-teman terus bertanya kepada saya apa yang telah saya ubah dalam rutinitas saya.\"','Pembeli Terverifikasi'),('id',2,'Emma Collins','\"Baju bayi ini sangat lembut, sangat hangat, dan lembut pada kulit yang lembut - bayi saya yang baru lahir tidur sangat nyenyak sekarang!\"','Pembeli Terverifikasi'),('tr',1,'Sophia Ramirez','\"Cildim hiç bu kadar eşit görünmemişti. Sadece iki hafta içinde parlaklık zaten belirgin; arkadaşlarım bana rutinimde neyi değiştirdiğimi sorup duruyor.\"','Doğrulanmış Alıcı'),('tr',2,'Emma Collins','\"Bebek tulumları son derece yumuşak, süper sıcak ve hassas ciltlere karşı hassastır; yeni doğan bebeğim artık o kadar rahat uyuyor ki!\"','Doğrulanmış Alıcı'),('vi',1,'Sophia Ramirez','\"Làn da tôi chưa bao giờ trông đều màu đến thế. Mới hai tuần mà độ rạng rỡ thấy rõ — bạn bè cứ hỏi tôi đã thay đổi điều gì trong quy trình của mình.\"','Người Mua Đã Xác Thực'),('vi',2,'Emma Collins','\"Những bộ bodysuit cho bé cực kỳ mềm mại, siêu ấm áp và dịu nhẹ với làn da non nớt — bé sơ sinh nhà tôi giờ ngủ ngon lành đến vậy!\"','Người Mua Đã Xác Thực');
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
INSERT INTO `users` VALUES (1,'admin@company.com',NULL,NULL,'$2y$12$aAceASLN9qkUmFqVrwW7Ku2QhPs7AUyjcJIjnncoRAVemuV9E1Cyu',NULL,'2026-05-28 19:11:13','2026-05-28 19:11:13','System','Admin','admin',NULL,1,1,NULL,NULL,NULL);
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
INSERT INTO `widgets` VALUES (1,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_company_sidebar','amerce',0,'{\"name\":\"Company\",\"menu_id\":\"footer-company\"}','2026-05-28 19:11:13','2026-05-28 19:11:13'),(2,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_customer_sidebar','amerce',0,'{\"name\":\"Customer\",\"menu_id\":\"footer-help\"}','2026-05-28 19:11:13','2026-05-28 19:11:13'),(3,'Theme\\Amerce\\Widgets\\BlogAboutMeWidget','blog_sidebar','amerce',0,'{\"name\":\"Amerce Editorial\",\"title\":\"About Me\",\"image\":null,\"bio\":\"Style notes, product spotlights, and how we curate the catalog \\u2014 written by the Amerce team.\",\"social_links\":[{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\"},{\"platform\":\"instagram\",\"url\":\"https:\\/\\/instagram.com\"},{\"platform\":\"tiktok\",\"url\":\"https:\\/\\/tiktok.com\"}]}','2026-05-28 19:11:13','2026-05-28 19:11:13'),(4,'Theme\\Amerce\\Widgets\\BlogSearchWidget','blog_sidebar','amerce',1,'{\"name\":\"Search\",\"placeholder\":\"Search...\"}','2026-05-28 19:11:13','2026-05-28 19:11:13'),(5,'Theme\\Amerce\\Widgets\\BlogCategoriesWidget','blog_sidebar','amerce',2,'{\"name\":\"Categories\",\"title\":\"Categories\",\"display_posts_count\":\"yes\",\"category_ids\":[]}','2026-05-28 19:11:13','2026-05-28 19:11:13'),(6,'Theme\\Amerce\\Widgets\\BlogPostsWidget','blog_sidebar','amerce',3,'{\"name\":\"Recent Posts\",\"title\":\"Recent Posts\",\"type\":\"recent\",\"number_display\":4}','2026-05-28 19:11:13','2026-05-28 19:11:13'),(7,'Theme\\Amerce\\Widgets\\BlogTagsWidget','blog_sidebar','amerce',4,'{\"name\":\"Tags\",\"title\":\"Popular Tags\",\"number_display\":11}','2026-05-28 19:11:13','2026-05-28 19:11:13'),(8,'Theme\\Amerce\\Widgets\\ProductDeliveryInfoWidget','product_details_sidebar','amerce',0,'{\"name\":\"Product Delivery & Return\",\"estimated_intl\":\"12-26 Days\",\"estimated_intl_label\":\"International\",\"estimated_local\":\"3-6 Days\",\"estimated_local_label\":\"United States\",\"return_within\":\"45 Days\",\"return_text\":\"of purchase. Duties & taxes are non-refundable.\"}','2026-05-28 19:11:13','2026-05-28 19:11:13'),(9,'Theme\\Amerce\\Widgets\\PaymentMethodsWidget','product_details_sidebar','amerce',1,'{\"name\":\"Payment Methods\",\"title\":\"Guaranteed Safe Checkout:\",\"images\":[]}','2026-05-28 19:11:13','2026-05-28 19:11:13'),(10,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_company_sidebar','amerce-vi',0,'{\"name\":\"C\\u00f4ng ty\",\"menu_id\":\"footer-company-vi\"}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(11,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_customer_sidebar','amerce-vi',0,'{\"name\":\"Kh\\u00e1ch h\\u00e0ng\",\"menu_id\":\"footer-help-vi\"}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(12,'Theme\\Amerce\\Widgets\\BlogAboutMeWidget','blog_sidebar','amerce-vi',0,'{\"name\":\"Bi\\u00ean t\\u1eadp c\\u1ee7a America\",\"title\":\"Gi\\u1edbi thi\\u1ec7u v\\u1ec1 t\\u00f4i\",\"image\":null,\"bio\":\"Style notes, product spotlights, and how we curate the catalog \\u2014 written by the Amerce team.\",\"social_links\":[{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\"},{\"platform\":\"instagram\",\"url\":\"https:\\/\\/instagram.com\"},{\"platform\":\"tiktok\",\"url\":\"https:\\/\\/tiktok.com\"}]}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(13,'Theme\\Amerce\\Widgets\\BlogSearchWidget','blog_sidebar','amerce-vi',1,'{\"name\":\"T\\u00ecm ki\\u1ebfm\",\"placeholder\":\"Search...\"}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(14,'Theme\\Amerce\\Widgets\\BlogCategoriesWidget','blog_sidebar','amerce-vi',2,'{\"name\":\"Danh m\\u1ee5c\",\"title\":\"Danh m\\u1ee5c\",\"display_posts_count\":\"yes\",\"category_ids\":[]}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(15,'Theme\\Amerce\\Widgets\\BlogPostsWidget','blog_sidebar','amerce-vi',3,'{\"name\":\"B\\u00e0i vi\\u1ebft m\\u1edbi\",\"title\":\"B\\u00e0i vi\\u1ebft m\\u1edbi\",\"type\":\"recent\",\"number_display\":4}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(16,'Theme\\Amerce\\Widgets\\BlogTagsWidget','blog_sidebar','amerce-vi',4,'{\"name\":\"Th\\u1ebb\",\"title\":\"Th\\u1ebb ph\\u1ed5 bi\\u1ebfn\",\"number_display\":11}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(17,'Theme\\Amerce\\Widgets\\ProductDeliveryInfoWidget','product_details_sidebar','amerce-vi',0,'{\"name\":\"Giao h\\u00e0ng v\\u00e0 tr\\u1ea3 l\\u1ea1i s\\u1ea3n ph\\u1ea9m\",\"estimated_intl\":\"12-26 Days\",\"estimated_intl_label\":\"International\",\"estimated_local\":\"3-6 Days\",\"estimated_local_label\":\"United States\",\"return_within\":\"45 Days\",\"return_text\":\"of purchase. Duties & taxes are non-refundable.\"}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(18,'Theme\\Amerce\\Widgets\\PaymentMethodsWidget','product_details_sidebar','amerce-vi',1,'{\"name\":\"Ph\\u01b0\\u01a1ng th\\u1ee9c thanh to\\u00e1n\",\"title\":\"\\u0110\\u1ea3m b\\u1ea3o thanh to\\u00e1n an to\\u00e0n:\",\"images\":[]}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(19,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_company_sidebar','amerce-ar',0,'{\"name\":\"\\u0634\\u0631\\u0643\\u0629\",\"menu_id\":\"footer-company-ar\"}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(20,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_customer_sidebar','amerce-ar',0,'{\"name\":\"\\u0639\\u0645\\u064a\\u0644\",\"menu_id\":\"footer-help-ar\"}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(21,'Theme\\Amerce\\Widgets\\BlogAboutMeWidget','blog_sidebar','amerce-ar',0,'{\"name\":\"\\u0627\\u0641\\u062a\\u062a\\u0627\\u062d\\u064a\\u0629 \\u0623\\u0645\\u064a\\u0631\\u0633\",\"title\":\"\\u0652\\u0639\\u064e\\u0646\\u0651\\u0650\\u064a\",\"image\":null,\"bio\":\"Style notes, product spotlights, and how we curate the catalog \\u2014 written by the Amerce team.\",\"social_links\":[{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\"},{\"platform\":\"instagram\",\"url\":\"https:\\/\\/instagram.com\"},{\"platform\":\"tiktok\",\"url\":\"https:\\/\\/tiktok.com\"}]}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(22,'Theme\\Amerce\\Widgets\\BlogSearchWidget','blog_sidebar','amerce-ar',1,'{\"name\":\"\\u064a\\u0628\\u062d\\u062b\",\"placeholder\":\"Search...\"}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(23,'Theme\\Amerce\\Widgets\\BlogCategoriesWidget','blog_sidebar','amerce-ar',2,'{\"name\":\"\\u0641\\u0626\\u0629\",\"title\":\"\\u0641\\u0626\\u0629\",\"display_posts_count\":\"yes\",\"category_ids\":[]}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(24,'Theme\\Amerce\\Widgets\\BlogPostsWidget','blog_sidebar','amerce-ar',3,'{\"name\":\"\\u0645\\u0642\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629\",\"title\":\"\\u0645\\u0642\\u0627\\u0644\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629\",\"type\":\"recent\",\"number_display\":4}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(25,'Theme\\Amerce\\Widgets\\BlogTagsWidget','blog_sidebar','amerce-ar',4,'{\"name\":\"\\u0628\\u0637\\u0627\\u0642\\u0629\",\"title\":\"\\u0627\\u0644\\u0639\\u0644\\u0627\\u0645\\u0627\\u062a \\u0627\\u0644\\u0634\\u0639\\u0628\\u064a\\u0629\",\"number_display\":11}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(26,'Theme\\Amerce\\Widgets\\ProductDeliveryInfoWidget','product_details_sidebar','amerce-ar',0,'{\"name\":\"\\u062a\\u0633\\u0644\\u064a\\u0645 \\u0627\\u0644\\u0645\\u0646\\u062a\\u062c \\u0648\\u0625\\u0639\\u0627\\u062f\\u062a\\u0647\",\"estimated_intl\":\"12-26 Days\",\"estimated_intl_label\":\"International\",\"estimated_local\":\"3-6 Days\",\"estimated_local_label\":\"United States\",\"return_within\":\"45 Days\",\"return_text\":\"of purchase. Duties & taxes are non-refundable.\"}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(27,'Theme\\Amerce\\Widgets\\PaymentMethodsWidget','product_details_sidebar','amerce-ar',1,'{\"name\":\"\\u0637\\u0631\\u064a\\u0642\\u0629 \\u0627\\u0644\\u062f\\u0641\\u0639\",\"title\":\"\\u0627\\u0644\\u062e\\u0631\\u0648\\u062c \\u0627\\u0644\\u0622\\u0645\\u0646 \\u0627\\u0644\\u0645\\u0636\\u0645\\u0648\\u0646:\",\"images\":[]}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(28,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_company_sidebar','amerce-fr',0,'{\"name\":\"Entreprise\",\"menu_id\":\"footer-company-fr\"}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(29,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_customer_sidebar','amerce-fr',0,'{\"name\":\"Client\",\"menu_id\":\"footer-help-fr\"}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(30,'Theme\\Amerce\\Widgets\\BlogAboutMeWidget','blog_sidebar','amerce-fr',0,'{\"name\":\"\\u00c9ditorial am\\u00e9ricain\",\"title\":\"Sur moi\",\"image\":null,\"bio\":\"Style notes, product spotlights, and how we curate the catalog \\u2014 written by the Amerce team.\",\"social_links\":[{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\"},{\"platform\":\"instagram\",\"url\":\"https:\\/\\/instagram.com\"},{\"platform\":\"tiktok\",\"url\":\"https:\\/\\/tiktok.com\"}]}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(31,'Theme\\Amerce\\Widgets\\BlogSearchWidget','blog_sidebar','amerce-fr',1,'{\"name\":\"Recherche\",\"placeholder\":\"Search...\"}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(32,'Theme\\Amerce\\Widgets\\BlogCategoriesWidget','blog_sidebar','amerce-fr',2,'{\"name\":\"Cat\\u00e9gorie\",\"title\":\"Cat\\u00e9gorie\",\"display_posts_count\":\"yes\",\"category_ids\":[]}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(33,'Theme\\Amerce\\Widgets\\BlogPostsWidget','blog_sidebar','amerce-fr',3,'{\"name\":\"Nouvel article\",\"title\":\"Nouvel article\",\"type\":\"recent\",\"number_display\":4}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(34,'Theme\\Amerce\\Widgets\\BlogTagsWidget','blog_sidebar','amerce-fr',4,'{\"name\":\"Carte\",\"title\":\"Balises populaires\",\"number_display\":11}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(35,'Theme\\Amerce\\Widgets\\ProductDeliveryInfoWidget','product_details_sidebar','amerce-fr',0,'{\"name\":\"Livraison et retour du produit\",\"estimated_intl\":\"12-26 Days\",\"estimated_intl_label\":\"International\",\"estimated_local\":\"3-6 Days\",\"estimated_local_label\":\"United States\",\"return_within\":\"45 Days\",\"return_text\":\"of purchase. Duties & taxes are non-refundable.\"}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(36,'Theme\\Amerce\\Widgets\\PaymentMethodsWidget','product_details_sidebar','amerce-fr',1,'{\"name\":\"Mode de paiement\",\"title\":\"Paiement s\\u00e9curis\\u00e9 garanti\\u00a0:\",\"images\":[]}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(37,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_company_sidebar','amerce-id',0,'{\"name\":\"Perusahaan\",\"menu_id\":\"footer-company-id\"}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(38,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_customer_sidebar','amerce-id',0,'{\"name\":\"Pelanggan\",\"menu_id\":\"footer-help-id\"}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(39,'Theme\\Amerce\\Widgets\\BlogAboutMeWidget','blog_sidebar','amerce-id',0,'{\"name\":\"Editorial Amerika\",\"title\":\"Tentang Saya\",\"image\":null,\"bio\":\"Style notes, product spotlights, and how we curate the catalog \\u2014 written by the Amerce team.\",\"social_links\":[{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\"},{\"platform\":\"instagram\",\"url\":\"https:\\/\\/instagram.com\"},{\"platform\":\"tiktok\",\"url\":\"https:\\/\\/tiktok.com\"}]}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(40,'Theme\\Amerce\\Widgets\\BlogSearchWidget','blog_sidebar','amerce-id',1,'{\"name\":\"Mencari\",\"placeholder\":\"Search...\"}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(41,'Theme\\Amerce\\Widgets\\BlogCategoriesWidget','blog_sidebar','amerce-id',2,'{\"name\":\"Kategori\",\"title\":\"Kategori\",\"display_posts_count\":\"yes\",\"category_ids\":[]}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(42,'Theme\\Amerce\\Widgets\\BlogPostsWidget','blog_sidebar','amerce-id',3,'{\"name\":\"Artikel baru\",\"title\":\"Artikel baru\",\"type\":\"recent\",\"number_display\":4}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(43,'Theme\\Amerce\\Widgets\\BlogTagsWidget','blog_sidebar','amerce-id',4,'{\"name\":\"Kartu\",\"title\":\"Tag populer\",\"number_display\":11}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(44,'Theme\\Amerce\\Widgets\\ProductDeliveryInfoWidget','product_details_sidebar','amerce-id',0,'{\"name\":\"Pengiriman & Pengembalian Produk\",\"estimated_intl\":\"12-26 Days\",\"estimated_intl_label\":\"International\",\"estimated_local\":\"3-6 Days\",\"estimated_local_label\":\"United States\",\"return_within\":\"45 Days\",\"return_text\":\"of purchase. Duties & taxes are non-refundable.\"}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(45,'Theme\\Amerce\\Widgets\\PaymentMethodsWidget','product_details_sidebar','amerce-id',1,'{\"name\":\"Metode pembayaran\",\"title\":\"Checkout Aman Terjamin:\",\"images\":[]}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(46,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_company_sidebar','amerce-tr',0,'{\"name\":\"\\u015eirket\",\"menu_id\":\"footer-company-tr\"}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(47,'Theme\\Amerce\\Widgets\\FooterMenuWidget','footer_customer_sidebar','amerce-tr',0,'{\"name\":\"M\\u00fc\\u015fteri\",\"menu_id\":\"footer-help-tr\"}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(48,'Theme\\Amerce\\Widgets\\BlogAboutMeWidget','blog_sidebar','amerce-tr',0,'{\"name\":\"Amerce Editoryal\",\"title\":\"Hakk\\u0131mda\",\"image\":null,\"bio\":\"Style notes, product spotlights, and how we curate the catalog \\u2014 written by the Amerce team.\",\"social_links\":[{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\"},{\"platform\":\"instagram\",\"url\":\"https:\\/\\/instagram.com\"},{\"platform\":\"tiktok\",\"url\":\"https:\\/\\/tiktok.com\"}]}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(49,'Theme\\Amerce\\Widgets\\BlogSearchWidget','blog_sidebar','amerce-tr',1,'{\"name\":\"Aramak\",\"placeholder\":\"Search...\"}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(50,'Theme\\Amerce\\Widgets\\BlogCategoriesWidget','blog_sidebar','amerce-tr',2,'{\"name\":\"Kategori\",\"title\":\"Kategori\",\"display_posts_count\":\"yes\",\"category_ids\":[]}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(51,'Theme\\Amerce\\Widgets\\BlogPostsWidget','blog_sidebar','amerce-tr',3,'{\"name\":\"Yeni makale\",\"title\":\"Yeni makale\",\"type\":\"recent\",\"number_display\":4}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(52,'Theme\\Amerce\\Widgets\\BlogTagsWidget','blog_sidebar','amerce-tr',4,'{\"name\":\"Kart\",\"title\":\"Pop\\u00fcler etiketler\",\"number_display\":11}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(53,'Theme\\Amerce\\Widgets\\ProductDeliveryInfoWidget','product_details_sidebar','amerce-tr',0,'{\"name\":\"\\u00dcr\\u00fcn Teslimat\\u0131 & \\u0130ade\",\"estimated_intl\":\"12-26 Days\",\"estimated_intl_label\":\"International\",\"estimated_local\":\"3-6 Days\",\"estimated_local_label\":\"United States\",\"return_within\":\"45 Days\",\"return_text\":\"of purchase. Duties & taxes are non-refundable.\"}','2026-05-28 19:11:46','2026-05-28 19:11:47'),(54,'Theme\\Amerce\\Widgets\\PaymentMethodsWidget','product_details_sidebar','amerce-tr',1,'{\"name\":\"\\u00d6deme y\\u00f6ntemi\",\"title\":\"Garantili G\\u00fcvenli \\u00d6deme:\",\"images\":[]}','2026-05-28 19:11:46','2026-05-28 19:11:47');
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

-- Dump completed on 2026-05-29  9:12:05
