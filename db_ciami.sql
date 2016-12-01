/*
SQLyog Ultimate v10.41 
MySQL - 5.5.16 : Database - db_ciami
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_ciami` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_ciami`;

/*Table structure for table `a_app` */

DROP TABLE IF EXISTS `a_app`;

CREATE TABLE `a_app` (
  `id_app` int(11) NOT NULL AUTO_INCREMENT,
  `app_brand` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_version` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sector_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `st_access` enum('external','internal') COLLATE utf8_unicode_ci DEFAULT NULL,
  `mdb` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mdd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_app`),
  KEY `team_id` (`team_id`),
  KEY `sector_id` (`sector_id`),
  CONSTRAINT `a_app_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `a_team_member` (`id_team`),
  CONSTRAINT `a_app_ibfk_2` FOREIGN KEY (`sector_id`) REFERENCES `a_app_sector` (`id_sector`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `a_app` */

/*Table structure for table `a_app_portal` */

DROP TABLE IF EXISTS `a_app_portal`;

CREATE TABLE `a_app_portal` (
  `id_portalapp` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) DEFAULT NULL,
  `portal_id` int(11) DEFAULT NULL,
  `st_active` enum('0','1') COLLATE utf8_unicode_ci DEFAULT NULL,
  `mdb` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mdd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_portalapp`),
  KEY `app_id` (`app_id`),
  KEY `portal_id` (`portal_id`),
  CONSTRAINT `a_app_portal_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `a_app` (`id_app`),
  CONSTRAINT `a_app_portal_ibfk_2` FOREIGN KEY (`portal_id`) REFERENCES `a_type_portal` (`id_portal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `a_app_portal` */

/*Table structure for table `a_app_pref` */

DROP TABLE IF EXISTS `a_app_pref`;

CREATE TABLE `a_app_pref` (
  `pref_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL,
  `pref_type` enum('color','datetime','date','time','text','textarea','number','radio','checkbox','select') COLLATE utf8_unicode_ci DEFAULT NULL,
  `pref_group` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pref_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pref_value` text COLLATE utf8_unicode_ci,
  `pref_desc` text COLLATE utf8_unicode_ci,
  `mdb` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mdd` datetime DEFAULT NULL,
  PRIMARY KEY (`pref_id`),
  KEY `app_id` (`app_id`),
  CONSTRAINT `a_app_pref_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `a_app` (`id_app`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `a_app_pref` */

/*Table structure for table `a_app_sector` */

DROP TABLE IF EXISTS `a_app_sector`;

CREATE TABLE `a_app_sector` (
  `id_sector` int(11) NOT NULL AUTO_INCREMENT,
  `sector_cd` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sector_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sector_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active_st` enum('0','1') COLLATE utf8_unicode_ci DEFAULT NULL,
  `mdb` int(11) DEFAULT NULL,
  `mdd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_sector`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `a_app_sector` */

insert  into `a_app_sector`(`id_sector`,`sector_cd`,`sector_name`,`sector_desc`,`active_st`,`mdb`,`mdd`) values (1,'EDU','Education','Pendidikan','1',1,'2015-09-23 15:09:00'),(2,'FIN','Finance','Keuangan','1',1,'2015-09-23 15:10:42'),(3,'REL','Religion','Keagamaan','1',1,'2015-09-23 15:12:06'),(4,'GOV','Government','Pemerintahan','1',1,'2015-09-23 15:12:40'),(5,'UKM','UKM','Usaha Kecil Menengah','1',1,'2015-09-23 15:13:40'),(6,'HEA','Health','Kesehatan','1',1,'2015-09-23 15:14:28'),(7,'MAN','Manufacture','Industri','1',1,'2015-09-23 15:15:05'),(8,'SOC','Social','Masyarakat umum','1',1,'2015-09-23 15:15:29');

/*Table structure for table `a_app_tech` */

DROP TABLE IF EXISTS `a_app_tech`;

CREATE TABLE `a_app_tech` (
  `id_tech` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL,
  `tech_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `tech_version` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `tech_description` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `st_active` enum('0','1') CHARACTER SET latin1 DEFAULT NULL,
  `mdb` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `mdd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tech`),
  KEY `app_id` (`app_id`),
  CONSTRAINT `a_app_tech_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `a_app` (`id_app`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `a_app_tech` */

/*Table structure for table `a_company` */

DROP TABLE IF EXISTS `a_company`;

CREATE TABLE `a_company` (
  `id_company` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) DEFAULT NULL,
  `company_email` varchar(50) DEFAULT NULL,
  `company_phone` varchar(20) DEFAULT NULL,
  `company_address` varchar(255) DEFAULT NULL,
  `company_type` enum('private','government','ngo') DEFAULT NULL,
  `mdb` varchar(20) DEFAULT NULL,
  `mdd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_company`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `a_company` */

/*Table structure for table `a_company_person` */

DROP TABLE IF EXISTS `a_company_person`;

CREATE TABLE `a_company_person` (
  `id_person` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `person_name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `person_gender` enum('M','F') CHARACTER SET latin1 NOT NULL,
  `person_phone` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `person_email` varchar(50) CHARACTER SET latin1 NOT NULL,
  `person_address` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `person_birthdate` date DEFAULT NULL,
  `person_birthplace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_department` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_position` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `mdb` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `mdd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_person`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `a_company_person_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `a_company` (`id_company`),
  CONSTRAINT `a_company_person_ibfk_2` FOREIGN KEY (`id_person`) REFERENCES `a_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `a_company_person` */

/*Table structure for table `a_groupapp` */

DROP TABLE IF EXISTS `a_groupapp`;

CREATE TABLE `a_groupapp` (
  `id_group` int(11) NOT NULL AUTO_INCREMENT,
  `group_cd` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `st_active` enum('0','1') COLLATE utf8_unicode_ci DEFAULT NULL,
  `mdb` int(11) DEFAULT NULL,
  `mdd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `a_groupapp` */

/*Table structure for table `a_groupapp_member` */

DROP TABLE IF EXISTS `a_groupapp_member`;

CREATE TABLE `a_groupapp_member` (
  `group_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `mdb` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mdd` datetime DEFAULT NULL,
  PRIMARY KEY (`group_id`,`app_id`),
  KEY `app_id` (`app_id`),
  CONSTRAINT `a_groupapp_member_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `a_app` (`id_app`),
  CONSTRAINT `a_groupapp_member_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `a_groupapp` (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `a_groupapp_member` */

/*Table structure for table `a_team` */

DROP TABLE IF EXISTS `a_team`;

CREATE TABLE `a_team` (
  `id_team` int(11) NOT NULL AUTO_INCREMENT,
  `team_cd` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `team_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `team_desc` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `st_active` enum('0','1') CHARACTER SET latin1 DEFAULT NULL,
  `mdb` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `mdd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_team`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `a_team` */

/*Table structure for table `a_team_member` */

DROP TABLE IF EXISTS `a_team_member`;

CREATE TABLE `a_team_member` (
  `id_team` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `team_id` int(11) NOT NULL,
  `mdb` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mdd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_team`),
  KEY `person_id` (`person_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `a_team_member_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `a_company_person` (`id_person`),
  CONSTRAINT `a_team_member_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `a_team` (`id_team`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `a_team_member` */

/*Table structure for table `a_type_action` */

DROP TABLE IF EXISTS `a_type_action`;

CREATE TABLE `a_type_action` (
  `id_action` int(11) NOT NULL AUTO_INCREMENT,
  `action_cd` varchar(20) DEFAULT NULL,
  `action_name` varchar(100) DEFAULT NULL,
  `st_active` enum('0','1') DEFAULT NULL,
  `mdb` varchar(20) DEFAULT NULL,
  `mdd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_action`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `a_type_action` */

insert  into `a_type_action`(`id_action`,`action_cd`,`action_name`,`st_active`,`mdb`,`mdd`) values (1,'ADD','Tambah','1',NULL,'2015-09-23 16:02:22'),(2,'ADD_PROCESS','Proses Tambah','1',NULL,'2015-09-23 16:07:35'),(3,'VIEW_ALL','Lihat Keselurahan','1',NULL,'2015-09-23 16:07:37'),(4,'VIEW_ONE','Lihat Data','1',NULL,'2015-09-23 16:07:40'),(5,'EDIT','Ubah','1',NULL,'2015-09-23 16:07:42'),(6,'EDIT_PROCESS','Proses Ubah','1',NULL,'2015-09-23 16:07:44'),(7,'DELETE','Hapus','1',NULL,'2015-09-23 16:07:46'),(8,'DELETE_PROCESS','Proses Hapus','1',NULL,'2015-09-23 16:07:48'),(9,'SEARCH','Pencarian','1',NULL,'2015-09-23 16:07:49'),(10,'POP_UP','Kotak Dialog','1',NULL,'2015-09-23 16:07:51'),(11,'AJAX_GET','Retrieve Data','1',NULL,'2015-09-23 16:07:53'),(12,'AJAX_POST','Send Data','1',NULL,'2015-09-23 16:07:55'),(13,'UPLOAD','Mengunggah','1',NULL,'2015-09-23 23:03:56'),(14,'DOWNLOAD','Mengunduh','1',NULL,'2015-09-23 23:03:57');

/*Table structure for table `a_type_portal` */

DROP TABLE IF EXISTS `a_type_portal`;

CREATE TABLE `a_type_portal` (
  `id_portal` int(11) NOT NULL AUTO_INCREMENT,
  `portal_cd` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `portal_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `st_active` enum('0','1') COLLATE utf8_unicode_ci DEFAULT NULL,
  `mdb` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mdd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_portal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `a_type_portal` */

/*Table structure for table `a_type_user` */

DROP TABLE IF EXISTS `a_type_user`;

CREATE TABLE `a_type_user` (
  `id_access` int(11) NOT NULL AUTO_INCREMENT,
  `access_cd` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `st_active` enum('0','1') COLLATE utf8_unicode_ci DEFAULT NULL,
  `mdb` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mdd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_access`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `a_type_user` */

insert  into `a_type_user`(`id_access`,`access_cd`,`access_name`,`st_active`,`mdb`,`mdd`) values (1,'DEV','App Developer','1',NULL,'2015-09-23 16:13:41'),(2,'QA','App Tester','1',NULL,'2015-09-23 16:13:43'),(3,'USER_PUBLIC','Pengguna umum','1',NULL,'2015-09-23 16:13:45'),(4,'USER_PRIVATE','Pengguna internal','1',NULL,'2015-09-23 16:13:47');

/*Table structure for table `a_user` */

DROP TABLE IF EXISTS `a_user`;

CREATE TABLE `a_user` (
  `id_user` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `st_lock` enum('0','1') COLLATE utf8_unicode_ci NOT NULL,
  `mdb` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mdd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `a_user` */

/*Table structure for table `a_user_login` */

DROP TABLE IF EXISTS `a_user_login`;

CREATE TABLE `a_user_login` (
  `app_id` int(11) NOT NULL,
  `user_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `login_date` datetime DEFAULT NULL,
  `logout_date` datetime DEFAULT NULL,
  PRIMARY KEY (`app_id`,`user_id`,`ip_address`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `a_user_login_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `a_app` (`id_app`),
  CONSTRAINT `a_user_login_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `a_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `a_user_login` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
