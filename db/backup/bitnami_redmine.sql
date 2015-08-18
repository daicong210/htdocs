# SQL-Front 5.1  (Build 4.16)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: bitnami_redmine
# ------------------------------------------------------
# Server version 5.5.28

DROP DATABASE IF EXISTS `bitnami_redmine`;
CREATE DATABASE `bitnami_redmine` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bitnami_redmine`;

#
# Source for table attachments
#

DROP TABLE IF EXISTS `attachments`;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `container_id` int(11) DEFAULT NULL,
  `container_type` varchar(30) DEFAULT NULL,
  `filename` varchar(255) NOT NULL DEFAULT '',
  `disk_filename` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `content_type` varchar(255) DEFAULT '',
  `digest` varchar(40) NOT NULL DEFAULT '',
  `downloads` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attachments_on_author_id` (`author_id`),
  KEY `index_attachments_on_created_on` (`created_on`),
  KEY `index_attachments_on_container_id_and_container_type` (`container_id`,`container_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Dumping data for table attachments
#

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
INSERT INTO `attachments` VALUES (1,1,'Issue','cb0320dbs03s.jpg','150701211825_cb0320dbs03s.jpg',113901,'image/jpeg','1eaf6d9cf365ec2577eb2397afd16397',0,1,'2015-07-01 21:18:25','');
INSERT INTO `attachments` VALUES (2,3,'Issue','QQ截图20150312103050.png','150702102603_fe11b0390065cc7ccff54a6d2ede40e0.png',590876,'image/png','a0515ae9baa09f008d3274052ad31f87',0,1,'2015-07-02 10:26:04','');
INSERT INTO `attachments` VALUES (3,1,'Message','7c432848d3b105e.jpg','150706122358_7c432848d3b105e.jpg',75639,'image/jpeg','444243ec356cce9ee200d02cc47f68d3',0,1,'2015-07-06 12:23:58','');
INSERT INTO `attachments` VALUES (4,2,'Message','7c432848d3b105e.jpg','150707123121_7c432848d3b105e.jpg',75639,'image/jpeg','444243ec356cce9ee200d02cc47f68d3',0,1,'2015-07-07 12:31:21','');
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table auth_sources
#

DROP TABLE IF EXISTS `auth_sources`;
CREATE TABLE `auth_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL DEFAULT '',
  `host` varchar(60) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `account_password` varchar(255) DEFAULT '',
  `base_dn` varchar(255) DEFAULT NULL,
  `attr_login` varchar(30) DEFAULT NULL,
  `attr_firstname` varchar(30) DEFAULT NULL,
  `attr_lastname` varchar(30) DEFAULT NULL,
  `attr_mail` varchar(30) DEFAULT NULL,
  `onthefly_register` tinyint(1) NOT NULL DEFAULT '0',
  `tls` tinyint(1) NOT NULL DEFAULT '0',
  `filter` varchar(255) DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_auth_sources_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table auth_sources
#

LOCK TABLES `auth_sources` WRITE;
/*!40000 ALTER TABLE `auth_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sources` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table boards
#

DROP TABLE IF EXISTS `boards`;
CREATE TABLE `boards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT '1',
  `topics_count` int(11) NOT NULL DEFAULT '0',
  `messages_count` int(11) NOT NULL DEFAULT '0',
  `last_message_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `boards_project_id` (`project_id`),
  KEY `index_boards_on_last_message_id` (`last_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Dumping data for table boards
#

LOCK TABLES `boards` WRITE;
/*!40000 ALTER TABLE `boards` DISABLE KEYS */;
INSERT INTO `boards` VALUES (1,1,'灌水','吐槽',2,0,0,NULL,NULL);
INSERT INTO `boards` VALUES (2,1,'贴图','美女',1,0,0,NULL,1);
INSERT INTO `boards` VALUES (3,1,'汽车','汽车',3,0,0,NULL,1);
INSERT INTO `boards` VALUES (4,1,'技术交流','技术交流学习',1,0,0,NULL,NULL);
INSERT INTO `boards` VALUES (5,1,'自拍','爱臭美',1,7,7,7,2);
INSERT INTO `boards` VALUES (6,1,'下午茶','悠闲自在',4,0,0,NULL,1);
INSERT INTO `boards` VALUES (7,1,'游戏','游戏天地',2,0,0,NULL,1);
/*!40000 ALTER TABLE `boards` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table changes
#

DROP TABLE IF EXISTS `changes`;
CREATE TABLE `changes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changeset_id` int(11) NOT NULL,
  `action` varchar(1) NOT NULL DEFAULT '',
  `path` text NOT NULL,
  `from_path` text,
  `from_revision` varchar(255) DEFAULT NULL,
  `revision` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `changesets_changeset_id` (`changeset_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

#
# Dumping data for table changes
#

LOCK TABLES `changes` WRITE;
/*!40000 ALTER TABLE `changes` DISABLE KEYS */;
INSERT INTO `changes` VALUES (1,1,'A','/MyRails',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (2,2,'A','/MyRails/blog',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (3,2,'A','/MyRails/blog/.gitignore',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (4,2,'A','/MyRails/blog/Gemfile',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (5,2,'A','/MyRails/blog/Gemfile.lock',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (6,2,'A','/MyRails/blog/README.rdoc',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (7,2,'A','/MyRails/blog/Rakefile',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (8,2,'A','/MyRails/blog/app',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (9,2,'A','/MyRails/blog/app/assets',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (10,2,'A','/MyRails/blog/app/assets/images',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (11,2,'A','/MyRails/blog/app/assets/images/rails.png',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (12,2,'A','/MyRails/blog/app/assets/javascripts',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (13,2,'A','/MyRails/blog/app/assets/javascripts/application.js',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (14,2,'A','/MyRails/blog/app/assets/stylesheets',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (15,2,'A','/MyRails/blog/app/assets/stylesheets/application.css',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (16,2,'A','/MyRails/blog/app/controllers',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (17,2,'A','/MyRails/blog/app/controllers/application_controller.rb',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (18,2,'A','/MyRails/blog/app/helpers',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (19,2,'A','/MyRails/blog/app/helpers/application_helper.rb',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (20,2,'A','/MyRails/blog/app/mailers',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (21,2,'A','/MyRails/blog/app/mailers/.gitkeep',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (22,2,'A','/MyRails/blog/app/models',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (23,2,'A','/MyRails/blog/app/models/.gitkeep',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (24,2,'A','/MyRails/blog/app/views',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (25,2,'A','/MyRails/blog/app/views/layouts',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (26,2,'A','/MyRails/blog/app/views/layouts/application.html.erb',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (27,2,'A','/MyRails/blog/config',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (28,2,'A','/MyRails/blog/config.ru',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (29,2,'A','/MyRails/blog/config/application.rb',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (30,2,'A','/MyRails/blog/config/boot.rb',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (31,2,'A','/MyRails/blog/config/database.yml',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (32,2,'A','/MyRails/blog/config/environment.rb',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (33,2,'A','/MyRails/blog/config/environments',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (34,2,'A','/MyRails/blog/config/environments/development.rb',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (35,2,'A','/MyRails/blog/config/environments/production.rb',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (36,2,'A','/MyRails/blog/config/environments/test.rb',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (37,2,'A','/MyRails/blog/config/initializers',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (38,2,'A','/MyRails/blog/config/initializers/backtrace_silencers.rb',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (39,2,'A','/MyRails/blog/config/initializers/inflections.rb',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (40,2,'A','/MyRails/blog/config/initializers/mime_types.rb',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (41,2,'A','/MyRails/blog/config/initializers/secret_token.rb',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (42,2,'A','/MyRails/blog/config/initializers/session_store.rb',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (43,2,'A','/MyRails/blog/config/initializers/wrap_parameters.rb',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (44,2,'A','/MyRails/blog/config/locales',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (45,2,'A','/MyRails/blog/config/locales/en.yml',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (46,2,'A','/MyRails/blog/config/routes.rb',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (47,2,'A','/MyRails/blog/db',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (48,2,'A','/MyRails/blog/db/seeds.rb',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (49,2,'A','/MyRails/blog/doc',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (50,2,'A','/MyRails/blog/doc/README_FOR_APP',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (51,2,'A','/MyRails/blog/lib',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (52,2,'A','/MyRails/blog/lib/assets',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (53,2,'A','/MyRails/blog/lib/assets/.gitkeep',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (54,2,'A','/MyRails/blog/lib/tasks',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (55,2,'A','/MyRails/blog/lib/tasks/.gitkeep',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (56,2,'A','/MyRails/blog/log',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (57,2,'A','/MyRails/blog/log/.gitkeep',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (58,2,'A','/MyRails/blog/public',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (59,2,'A','/MyRails/blog/public/404.html',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (60,2,'A','/MyRails/blog/public/422.html',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (61,2,'A','/MyRails/blog/public/500.html',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (62,2,'A','/MyRails/blog/public/favicon.ico',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (63,2,'A','/MyRails/blog/public/index.html',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (64,2,'A','/MyRails/blog/public/robots.txt',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (65,2,'A','/MyRails/blog/script',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (66,2,'A','/MyRails/blog/script/rails',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (67,2,'A','/MyRails/blog/test',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (68,2,'A','/MyRails/blog/test/fixtures',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (69,2,'A','/MyRails/blog/test/fixtures/.gitkeep',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (70,2,'A','/MyRails/blog/test/functional',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (71,2,'A','/MyRails/blog/test/functional/.gitkeep',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (72,2,'A','/MyRails/blog/test/integration',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (73,2,'A','/MyRails/blog/test/integration/.gitkeep',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (74,2,'A','/MyRails/blog/test/performance',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (75,2,'A','/MyRails/blog/test/performance/browsing_test.rb',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (76,2,'A','/MyRails/blog/test/test_helper.rb',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (77,2,'A','/MyRails/blog/test/unit',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (78,2,'A','/MyRails/blog/test/unit/.gitkeep',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (79,2,'A','/MyRails/blog/tmp',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (80,2,'A','/MyRails/blog/tmp/cache',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (81,2,'A','/MyRails/blog/tmp/cache/assets',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (82,2,'A','/MyRails/blog/vendor',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (83,2,'A','/MyRails/blog/vendor/assets',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (84,2,'A','/MyRails/blog/vendor/assets/javascripts',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (85,2,'A','/MyRails/blog/vendor/assets/javascripts/.gitkeep',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (86,2,'A','/MyRails/blog/vendor/assets/stylesheets',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (87,2,'A','/MyRails/blog/vendor/assets/stylesheets/.gitkeep',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (88,2,'A','/MyRails/blog/vendor/plugins',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (89,2,'A','/MyRails/blog/vendor/plugins/.gitkeep',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (90,3,'A','/MyRails/blog/.idea',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (91,3,'A','/MyRails/blog/.idea/.generators',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (92,3,'A','/MyRails/blog/.idea/.name',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (93,3,'A','/MyRails/blog/.idea/.rakeTasks',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (94,3,'A','/MyRails/blog/.idea/blog.iml',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (95,3,'A','/MyRails/blog/.idea/dictionaries',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (96,3,'A','/MyRails/blog/.idea/dictionaries/luobo.xml',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (97,3,'A','/MyRails/blog/.idea/misc.xml',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (98,3,'A','/MyRails/blog/.idea/modules.xml',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (99,3,'A','/MyRails/blog/.idea/vcs.xml',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (100,3,'A','/MyRails/blog/.idea/workspace.xml',NULL,NULL,NULL,NULL);
INSERT INTO `changes` VALUES (101,3,'D','/MyRails/blog/log',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `changes` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table changeset_parents
#

DROP TABLE IF EXISTS `changeset_parents`;
CREATE TABLE `changeset_parents` (
  `changeset_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  KEY `changeset_parents_changeset_ids` (`changeset_id`),
  KEY `changeset_parents_parent_ids` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table changeset_parents
#

LOCK TABLES `changeset_parents` WRITE;
/*!40000 ALTER TABLE `changeset_parents` DISABLE KEYS */;
/*!40000 ALTER TABLE `changeset_parents` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table changesets
#

DROP TABLE IF EXISTS `changesets`;
CREATE TABLE `changesets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repository_id` int(11) NOT NULL,
  `revision` varchar(255) NOT NULL,
  `committer` varchar(255) DEFAULT NULL,
  `committed_on` datetime NOT NULL,
  `comments` text,
  `commit_date` date DEFAULT NULL,
  `scmid` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `changesets_repos_rev` (`repository_id`,`revision`),
  KEY `index_changesets_on_user_id` (`user_id`),
  KEY `index_changesets_on_repository_id` (`repository_id`),
  KEY `index_changesets_on_committed_on` (`committed_on`),
  KEY `changesets_repos_scmid` (`repository_id`,`scmid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Dumping data for table changesets
#

LOCK TABLES `changesets` WRITE;
/*!40000 ALTER TABLE `changesets` DISABLE KEYS */;
INSERT INTO `changesets` VALUES (1,1,'2','luobo','2015-06-06 11:55:26','','2015-06-06',NULL,NULL);
INSERT INTO `changesets` VALUES (2,1,'3','luobo','2015-06-06 11:56:57','','2015-06-06',NULL,NULL);
INSERT INTO `changesets` VALUES (3,1,'4','luobo','2015-06-06 11:58:26','','2015-06-06',NULL,NULL);
/*!40000 ALTER TABLE `changesets` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table changesets_issues
#

DROP TABLE IF EXISTS `changesets_issues`;
CREATE TABLE `changesets_issues` (
  `changeset_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  UNIQUE KEY `changesets_issues_ids` (`changeset_id`,`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table changesets_issues
#

LOCK TABLES `changesets_issues` WRITE;
/*!40000 ALTER TABLE `changesets_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `changesets_issues` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table comments
#

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commented_type` varchar(30) NOT NULL DEFAULT '',
  `commented_id` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `comments` text,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_commented_id_and_commented_type` (`commented_id`,`commented_type`),
  KEY `index_comments_on_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table comments
#

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table custom_fields
#

DROP TABLE IF EXISTS `custom_fields`;
CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `field_format` varchar(30) NOT NULL DEFAULT '',
  `possible_values` text,
  `regexp` varchar(255) DEFAULT '',
  `min_length` int(11) NOT NULL DEFAULT '0',
  `max_length` int(11) NOT NULL DEFAULT '0',
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_for_all` tinyint(1) NOT NULL DEFAULT '0',
  `is_filter` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT '1',
  `searchable` tinyint(1) DEFAULT '0',
  `default_value` text,
  `editable` tinyint(1) DEFAULT '1',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `multiple` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_custom_fields_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table custom_fields
#

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table custom_fields_projects
#

DROP TABLE IF EXISTS `custom_fields_projects`;
CREATE TABLE `custom_fields_projects` (
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  KEY `index_custom_fields_projects_on_custom_field_id_and_project_id` (`custom_field_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table custom_fields_projects
#

LOCK TABLES `custom_fields_projects` WRITE;
/*!40000 ALTER TABLE `custom_fields_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_projects` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table custom_fields_trackers
#

DROP TABLE IF EXISTS `custom_fields_trackers`;
CREATE TABLE `custom_fields_trackers` (
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  KEY `index_custom_fields_trackers_on_custom_field_id_and_tracker_id` (`custom_field_id`,`tracker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table custom_fields_trackers
#

LOCK TABLES `custom_fields_trackers` WRITE;
/*!40000 ALTER TABLE `custom_fields_trackers` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_trackers` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table custom_values
#

DROP TABLE IF EXISTS `custom_values`;
CREATE TABLE `custom_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customized_type` varchar(30) NOT NULL DEFAULT '',
  `customized_id` int(11) NOT NULL DEFAULT '0',
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `value` text,
  PRIMARY KEY (`id`),
  KEY `custom_values_customized` (`customized_type`,`customized_id`),
  KEY `index_custom_values_on_custom_field_id` (`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table custom_values
#

LOCK TABLES `custom_values` WRITE;
/*!40000 ALTER TABLE `custom_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_values` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table department_members
#

DROP TABLE IF EXISTS `department_members`;
CREATE TABLE `department_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `leader` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

#
# Dumping data for table department_members
#

LOCK TABLES `department_members` WRITE;
/*!40000 ALTER TABLE `department_members` DISABLE KEYS */;
INSERT INTO `department_members` VALUES (1,10,7,1,'0000-00-00 00:00:00','2015-07-13 19:11:50');
INSERT INTO `department_members` VALUES (90,5,1,1,'2015-07-21 14:53:52','2015-07-21 14:53:52');
INSERT INTO `department_members` VALUES (92,11,10,0,'2015-07-28 14:33:47','2015-07-28 14:33:47');
INSERT INTO `department_members` VALUES (93,10,9,0,'2015-07-28 16:09:51','2015-08-04 18:00:46');
/*!40000 ALTER TABLE `department_members` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table departments
#

DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `members_count` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

#
# Dumping data for table departments
#

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (3,1,0,'顶级部门',NULL,2,'2015-07-06 14:51:09','2015-07-06 15:57:24');
INSERT INTO `departments` VALUES (5,1,0,'top1',NULL,1,'2015-07-06 14:55:31','2015-07-06 15:38:59');
INSERT INTO `departments` VALUES (7,1,0,'1top1',3,2,'2015-07-06 15:42:21','2015-07-14 17:07:35');
INSERT INTO `departments` VALUES (8,1,0,'sub2',3,1,'2015-07-06 15:42:42','2015-07-17 11:47:32');
INSERT INTO `departments` VALUES (10,1,0,'TTest',5,1,'2015-07-07 11:48:12','2015-07-07 11:48:12');
INSERT INTO `departments` VALUES (11,1,0,'top3',7,1,'2015-07-08 16:43:00','2015-07-08 16:43:00');
INSERT INTO `departments` VALUES (12,2,0,'OGame',NULL,1,'2015-07-14 16:55:24','2015-07-14 16:55:24');
INSERT INTO `departments` VALUES (13,2,0,'OGame1',NULL,2,'2015-07-14 16:56:02','2015-07-14 16:56:02');
INSERT INTO `departments` VALUES (14,2,0,'GQ',12,1,'2015-07-14 16:56:28','2015-07-14 16:56:28');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table documents
#

DROP TABLE IF EXISTS `documents`;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(60) NOT NULL DEFAULT '',
  `description` text,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_project_id` (`project_id`),
  KEY `index_documents_on_category_id` (`category_id`),
  KEY `index_documents_on_created_on` (`created_on`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Dumping data for table documents
#

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,1,6,'select用法','uers\\_mail_notifitications.html.erb中有如下代码：\r\n<%= select_tag(\r\n      \'user[mail_notification]\',\r\n      options_for_select(\r\n         user_mail_notification_options(@user), @user.mail_notification),\r\n      :onchange => \'if (this.value == \"selected\") {$(\"#notified-projects\").show();} else {$(\"#notified-projects\").hide();}\'\r\n     ) %>\r\n</p>\r\n此处并未用到f.select\r\nf.select是在块儿中运用，需指明url，一般是在同一文件中用，此处是因为是局部模板\r\n属于此模板的调用模板\r\n<%= labelled_form_for @user do |f| %>\r\n  <%= render :partial => \'form\', :locals => { :f => f } %>\r\n  <% if @user.active? && email_delivery_enabled? -%>\r\n    <p><label><%= check_box_tag \'send_information\', 1, true %> <%= l(:label_send_information) %></label></p>\r\n  <% end -%>\r\n  <p><%= submit_tag l(:button_save) %></p>\r\n<% end %>\r\n所以用user[mail_notification]指明对应的数据库字段即可','2015-07-02 11:49:05');
INSERT INTO `documents` VALUES (2,1,6,'跳转到某个切页','项目>>配置>>讨论区>> 置顶/上移等按钮操作\r\ndef redirect_to_settings_in_projects\r\n    redirect_to :controller => \'projects\', :action => \'settings\', :id => @project, :tab => \'boards\'\r\nend\r\n','2015-07-02 17:26:46');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table enabled_modules
#

DROP TABLE IF EXISTS `enabled_modules`;
CREATE TABLE `enabled_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enabled_modules_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

#
# Dumping data for table enabled_modules
#

LOCK TABLES `enabled_modules` WRITE;
/*!40000 ALTER TABLE `enabled_modules` DISABLE KEYS */;
INSERT INTO `enabled_modules` VALUES (11,2,'issue_tracking');
INSERT INTO `enabled_modules` VALUES (12,2,'time_tracking');
INSERT INTO `enabled_modules` VALUES (13,2,'news');
INSERT INTO `enabled_modules` VALUES (14,2,'documents');
INSERT INTO `enabled_modules` VALUES (15,2,'files');
INSERT INTO `enabled_modules` VALUES (16,2,'wiki');
INSERT INTO `enabled_modules` VALUES (17,2,'repository');
INSERT INTO `enabled_modules` VALUES (18,2,'boards');
INSERT INTO `enabled_modules` VALUES (19,2,'calendar');
INSERT INTO `enabled_modules` VALUES (20,2,'gantt');
INSERT INTO `enabled_modules` VALUES (47,1,'issue_tracking');
INSERT INTO `enabled_modules` VALUES (52,1,'news');
INSERT INTO `enabled_modules` VALUES (54,1,'time_tracking');
INSERT INTO `enabled_modules` VALUES (55,1,'documents');
INSERT INTO `enabled_modules` VALUES (57,1,'wiki');
INSERT INTO `enabled_modules` VALUES (58,1,'repository');
INSERT INTO `enabled_modules` VALUES (59,1,'boards');
INSERT INTO `enabled_modules` VALUES (60,1,'calendar');
INSERT INTO `enabled_modules` VALUES (61,1,'gantt');
INSERT INTO `enabled_modules` VALUES (65,2,'departments');
INSERT INTO `enabled_modules` VALUES (66,3,'issue_tracking');
INSERT INTO `enabled_modules` VALUES (67,3,'time_tracking');
INSERT INTO `enabled_modules` VALUES (68,3,'news');
INSERT INTO `enabled_modules` VALUES (69,3,'documents');
INSERT INTO `enabled_modules` VALUES (70,3,'files');
INSERT INTO `enabled_modules` VALUES (71,3,'wiki');
INSERT INTO `enabled_modules` VALUES (72,3,'repository');
INSERT INTO `enabled_modules` VALUES (73,3,'boards');
INSERT INTO `enabled_modules` VALUES (74,3,'calendar');
INSERT INTO `enabled_modules` VALUES (75,3,'gantt');
INSERT INTO `enabled_modules` VALUES (76,3,'departments');
INSERT INTO `enabled_modules` VALUES (77,1,'departments');
INSERT INTO `enabled_modules` VALUES (78,1,'files');
INSERT INTO `enabled_modules` VALUES (81,1,'performances');
/*!40000 ALTER TABLE `enabled_modules` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table enumerations
#

DROP TABLE IF EXISTS `enumerations`;
CREATE TABLE `enumerations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `position` int(11) DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `project_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_enumerations_on_project_id` (`project_id`),
  KEY `index_enumerations_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

#
# Dumping data for table enumerations
#

LOCK TABLES `enumerations` WRITE;
/*!40000 ALTER TABLE `enumerations` DISABLE KEYS */;
INSERT INTO `enumerations` VALUES (1,'低',1,0,'IssuePriority',1,NULL,NULL,'lowest');
INSERT INTO `enumerations` VALUES (2,'普通',2,1,'IssuePriority',1,NULL,NULL,'default');
INSERT INTO `enumerations` VALUES (3,'高',3,0,'IssuePriority',1,NULL,NULL,'high3');
INSERT INTO `enumerations` VALUES (4,'紧急',4,0,'IssuePriority',1,NULL,NULL,'high2');
INSERT INTO `enumerations` VALUES (5,'立刻',5,0,'IssuePriority',1,NULL,NULL,'highest');
INSERT INTO `enumerations` VALUES (6,'用户文档',1,0,'DocumentCategory',1,NULL,NULL,NULL);
INSERT INTO `enumerations` VALUES (7,'技术文档',2,0,'DocumentCategory',1,NULL,NULL,NULL);
INSERT INTO `enumerations` VALUES (8,'设计',1,0,'TimeEntryActivity',1,NULL,NULL,NULL);
INSERT INTO `enumerations` VALUES (9,'开发',2,0,'TimeEntryActivity',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `enumerations` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table groups_users
#

DROP TABLE IF EXISTS `groups_users`;
CREATE TABLE `groups_users` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  UNIQUE KEY `groups_users_ids` (`group_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table groups_users
#

LOCK TABLES `groups_users` WRITE;
/*!40000 ALTER TABLE `groups_users` DISABLE KEYS */;
INSERT INTO `groups_users` VALUES (5,8);
INSERT INTO `groups_users` VALUES (6,7);
/*!40000 ALTER TABLE `groups_users` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table issue_categories
#

DROP TABLE IF EXISTS `issue_categories`;
CREATE TABLE `issue_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL DEFAULT '',
  `assigned_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issue_categories_project_id` (`project_id`),
  KEY `index_issue_categories_on_assigned_to_id` (`assigned_to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Dumping data for table issue_categories
#

LOCK TABLES `issue_categories` WRITE;
/*!40000 ALTER TABLE `issue_categories` DISABLE KEYS */;
INSERT INTO `issue_categories` VALUES (1,1,'多鹤的问题类别A',1);
/*!40000 ALTER TABLE `issue_categories` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table issue_relations
#

DROP TABLE IF EXISTS `issue_relations`;
CREATE TABLE `issue_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_from_id` int(11) NOT NULL,
  `issue_to_id` int(11) NOT NULL,
  `relation_type` varchar(255) NOT NULL DEFAULT '',
  `delay` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_issue_relations_on_issue_from_id_and_issue_to_id` (`issue_from_id`,`issue_to_id`),
  KEY `index_issue_relations_on_issue_from_id` (`issue_from_id`),
  KEY `index_issue_relations_on_issue_to_id` (`issue_to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table issue_relations
#

LOCK TABLES `issue_relations` WRITE;
/*!40000 ALTER TABLE `issue_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_relations` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table issue_statuses
#

DROP TABLE IF EXISTS `issue_statuses`;
CREATE TABLE `issue_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT '1',
  `default_done_ratio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_statuses_on_position` (`position`),
  KEY `index_issue_statuses_on_is_closed` (`is_closed`),
  KEY `index_issue_statuses_on_is_default` (`is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Dumping data for table issue_statuses
#

LOCK TABLES `issue_statuses` WRITE;
/*!40000 ALTER TABLE `issue_statuses` DISABLE KEYS */;
INSERT INTO `issue_statuses` VALUES (1,'新建',0,1,1,NULL);
INSERT INTO `issue_statuses` VALUES (2,'进行中',0,0,2,NULL);
INSERT INTO `issue_statuses` VALUES (3,'已解决',0,0,3,NULL);
INSERT INTO `issue_statuses` VALUES (4,'反馈',0,0,4,NULL);
INSERT INTO `issue_statuses` VALUES (5,'已关闭',1,0,5,NULL);
INSERT INTO `issue_statuses` VALUES (6,'已拒绝',1,0,6,NULL);
/*!40000 ALTER TABLE `issue_statuses` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table issues
#

DROP TABLE IF EXISTS `issues`;
CREATE TABLE `issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `due_date` date DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL DEFAULT '0',
  `assigned_to_id` int(11) DEFAULT NULL,
  `priority_id` int(11) NOT NULL DEFAULT '0',
  `fixed_version_id` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL DEFAULT '0',
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `done_ratio` int(11) NOT NULL DEFAULT '0',
  `estimated_hours` float DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `issues_project_id` (`project_id`),
  KEY `index_issues_on_status_id` (`status_id`),
  KEY `index_issues_on_category_id` (`category_id`),
  KEY `index_issues_on_assigned_to_id` (`assigned_to_id`),
  KEY `index_issues_on_fixed_version_id` (`fixed_version_id`),
  KEY `index_issues_on_tracker_id` (`tracker_id`),
  KEY `index_issues_on_priority_id` (`priority_id`),
  KEY `index_issues_on_author_id` (`author_id`),
  KEY `index_issues_on_created_on` (`created_on`),
  KEY `index_issues_on_root_id_and_lft_and_rgt` (`root_id`,`lft`,`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

#
# Dumping data for table issues
#

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (1,2,1,'用rails generate scaffold 生成部门相关的rails框架内容','1.使用rails generate scaffold Department','2015-07-02',NULL,5,1,3,2,1,4,'2015-07-01 21:18:25','2015-07-06 15:53:37','2015-07-01',100,NULL,NULL,1,9,10,0);
INSERT INTO `issues` VALUES (2,1,1,'管理员配置选项增加部门管理tab页','1.需做权限控制，非管理员无权限不作显示','2015-07-02',NULL,5,1,3,2,1,3,'2015-07-01 21:23:56','2015-07-06 15:52:46','2015-07-01',100,NULL,NULL,2,7,8,0);
INSERT INTO `issues` VALUES (3,2,1,'备份开发环境','1.替换所有http://rubygems.org为http://ruby.taobao.org\r\n2.',NULL,NULL,5,1,3,2,1,4,'2015-07-02 10:26:07','2015-07-02 15:21:38','2015-07-02',100,2,NULL,3,9,10,0);
INSERT INTO `issues` VALUES (5,1,1,'iconv deprecation warning with ruby 1.9.3','rubymine中运行会有如下报错：\r\nD:/BitNami/redmine-2.2.2-0/ruby/lib/ruby/gems/1.9.1/gems/activesupport-3.2.11/lib/active_support/dependencies.rb:252:in `block in require\': iconv will be deprecated in the future, use String#encode instead\r\n定位到文件具体行，加上p caller if file =~ /iconv/语句看查看是具体哪个文件 \r\n原因查看：http://stackoverflow.com/questions/8148762/iconv-deprecation-warning-with-ruby-1-9-3','2015-07-02',NULL,5,1,3,2,1,4,'2015-07-02 11:11:25','2015-07-06 10:23:58','2015-07-02',100,1,NULL,5,9,10,0);
INSERT INTO `issues` VALUES (6,1,1,'新建问题和更新问题，等待时间过长的问题','',NULL,NULL,5,1,2,2,1,3,'2015-07-02 11:19:44','2015-07-06 10:24:16','2015-07-02',100,NULL,NULL,6,7,8,0);
INSERT INTO `issues` VALUES (7,2,1,'添加部门人员管理','1.人员要求可在同一页面添加多个，然后一起提交\r\n2.入口在点击部门之后\r\n3.参考讨论区message','2015-07-07',NULL,3,1,3,2,1,2,'2015-07-06 16:04:10','2015-07-15 11:08:33','2015-07-06',10,8,NULL,7,3,4,0);
INSERT INTO `issues` VALUES (8,3,1,'用rails generate scaffold 生成部门成员相关的rails框架内容','1.rails generate scaffold department_member \r\n2.department_id:integer user_id:integer leader:boolean \r\n','2015-07-07',NULL,3,NULL,3,2,1,2,'2015-07-07 15:04:59','2015-07-15 11:08:17','2015-07-07',0,NULL,NULL,8,5,6,0);
INSERT INTO `issues` VALUES (9,2,1,'增加绩效管理表','1.包含\r\nuser_id：用户ID;\r\nproject_id：所属项目ID;\r\ndepartment_member_id：所属部门ID;\r\nstatus：状态; \r\ndate：日期; \r\nself_assessment：自我评价\r\nself_mark：自我评分\r\nleader_assessment：领导评价\r\nleader_mark：领导评分\r\nleader_rating：领导评级\r\nrails generate scaffold user_id:integer project_id:integer department_member_id:integer status:integer date:date self_assessment:text self_mark:integer leader_assessment:text leader_mark:integer leader_rating:string','2015-07-20',NULL,1,1,2,2,1,0,'2015-07-20 10:28:00','2015-07-20 10:28:00','2015-07-17',0,NULL,NULL,9,1,2,0);
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table journal_details
#

DROP TABLE IF EXISTS `journal_details`;
CREATE TABLE `journal_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journal_id` int(11) NOT NULL DEFAULT '0',
  `property` varchar(30) NOT NULL DEFAULT '',
  `prop_key` varchar(30) NOT NULL DEFAULT '',
  `old_value` text,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `journal_details_journal_id` (`journal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

#
# Dumping data for table journal_details
#

LOCK TABLES `journal_details` WRITE;
/*!40000 ALTER TABLE `journal_details` DISABLE KEYS */;
INSERT INTO `journal_details` VALUES (1,1,'attr','fixed_version_id',NULL,'2');
INSERT INTO `journal_details` VALUES (2,2,'attr','priority_id','2','1');
INSERT INTO `journal_details` VALUES (3,3,'attr','priority_id','1','3');
INSERT INTO `journal_details` VALUES (4,4,'attr','done_ratio','0','40');
INSERT INTO `journal_details` VALUES (5,5,'attr','done_ratio','0','10');
INSERT INTO `journal_details` VALUES (6,6,'attr','tracker_id','1','2');
INSERT INTO `journal_details` VALUES (7,6,'attr','status_id','1','2');
INSERT INTO `journal_details` VALUES (8,6,'attr','assigned_to_id',NULL,'1');
INSERT INTO `journal_details` VALUES (9,6,'attr','fixed_version_id',NULL,'2');
INSERT INTO `journal_details` VALUES (10,6,'attr','done_ratio','0','20');
INSERT INTO `journal_details` VALUES (11,7,'attr','done_ratio','10','50');
INSERT INTO `journal_details` VALUES (12,8,'attr','status_id','1','3');
INSERT INTO `journal_details` VALUES (13,8,'attr','done_ratio','0','100');
INSERT INTO `journal_details` VALUES (14,9,'attr','status_id','3','6');
INSERT INTO `journal_details` VALUES (15,10,'attr','status_id','6','5');
INSERT INTO `journal_details` VALUES (16,13,'attr','status_id','1','5');
INSERT INTO `journal_details` VALUES (17,13,'attr','done_ratio','40','100');
INSERT INTO `journal_details` VALUES (18,14,'attr','status_id','1','5');
INSERT INTO `journal_details` VALUES (19,14,'attr','done_ratio','50','100');
INSERT INTO `journal_details` VALUES (20,16,'attr','status_id','1','5');
INSERT INTO `journal_details` VALUES (21,16,'attr','done_ratio','0','100');
INSERT INTO `journal_details` VALUES (22,17,'attr','status_id','2','5');
INSERT INTO `journal_details` VALUES (23,17,'attr','done_ratio','20','100');
INSERT INTO `journal_details` VALUES (24,18,'attr','done_ratio','0','10');
INSERT INTO `journal_details` VALUES (25,20,'attr','status_id','1','3');
INSERT INTO `journal_details` VALUES (26,21,'attr','status_id','2','3');
/*!40000 ALTER TABLE `journal_details` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table journals
#

DROP TABLE IF EXISTS `journals`;
CREATE TABLE `journals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journalized_id` int(11) NOT NULL DEFAULT '0',
  `journalized_type` varchar(30) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `notes` text,
  `created_on` datetime NOT NULL,
  `private_notes` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `journals_journalized_id` (`journalized_id`,`journalized_type`),
  KEY `index_journals_on_user_id` (`user_id`),
  KEY `index_journals_on_journalized_id` (`journalized_id`),
  KEY `index_journals_on_created_on` (`created_on`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

#
# Dumping data for table journals
#

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
INSERT INTO `journals` VALUES (1,2,'Issue',1,'','2015-07-02 10:18:36',0);
INSERT INTO `journals` VALUES (2,5,'Issue',1,'','2015-07-02 11:13:13',0);
INSERT INTO `journals` VALUES (3,5,'Issue',1,'','2015-07-02 11:14:37',0);
INSERT INTO `journals` VALUES (4,5,'Issue',1,'','2015-07-02 11:18:48',0);
INSERT INTO `journals` VALUES (5,6,'Issue',1,'','2015-07-02 11:21:46',0);
INSERT INTO `journals` VALUES (6,1,'Issue',1,'','2015-07-02 11:52:52',0);
INSERT INTO `journals` VALUES (7,6,'Issue',1,'目前的解决办法是top menu>>管理>>配置>>默认提取选项=>不收取任何通知','2015-07-02 11:56:04',0);
INSERT INTO `journals` VALUES (8,3,'Issue',1,'','2015-07-02 14:25:29',0);
INSERT INTO `journals` VALUES (9,3,'Issue',1,'','2015-07-02 14:25:46',0);
INSERT INTO `journals` VALUES (10,3,'Issue',1,'','2015-07-02 14:26:00',0);
INSERT INTO `journals` VALUES (11,3,'Issue',1,'包括ruby，rubymine 等，避免新建或者打开其他的rails项目造成开发环境的破坏','2015-07-02 15:21:38',0);
INSERT INTO `journals` VALUES (12,1,'Issue',1,'Leo Admin wrote:\r\n> 1.使用rails generate scaffold Department\r\n\r\n2.数据行\r\n  project_id:integer name:string parent_id:integer position:integer','2015-07-06 10:23:06',0);
INSERT INTO `journals` VALUES (13,5,'Issue',1,'','2015-07-06 10:23:58',0);
INSERT INTO `journals` VALUES (14,6,'Issue',1,'','2015-07-06 10:24:16',0);
INSERT INTO `journals` VALUES (15,2,'Issue',1,'1.redmine.rb中增加   map.project_module :departments do |map|... 起控制权限的作用和模块选择的功能(权限分配)\r\n2.控制器中增加  menu_item :settings, :only => [:new, :create, :edit, :update, :destroy]，起控制跳转后是否还在之前的tab页','2015-07-06 15:52:32',0);
INSERT INTO `journals` VALUES (16,2,'Issue',1,'','2015-07-06 15:52:46',0);
INSERT INTO `journals` VALUES (17,1,'Issue',1,'','2015-07-06 15:53:38',0);
INSERT INTO `journals` VALUES (18,7,'Issue',1,NULL,'2015-07-07 14:59:27',0);
INSERT INTO `journals` VALUES (19,8,'Issue',1,'Leo Admin wrote:\r\n> 1.rails generate scaffold DepartmentMember \r\n> 2.department_id:integer user_id:integer leader:boolean\r\n\r\n','2015-07-07 15:06:41',0);
INSERT INTO `journals` VALUES (20,8,'Issue',1,'','2015-07-15 11:08:17',0);
INSERT INTO `journals` VALUES (21,7,'Issue',1,'','2015-07-15 11:08:33',0);
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table member_roles
#

DROP TABLE IF EXISTS `member_roles`;
CREATE TABLE `member_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `inherited_from` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_member_roles_on_member_id` (`member_id`),
  KEY `index_member_roles_on_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

#
# Dumping data for table member_roles
#

LOCK TABLES `member_roles` WRITE;
/*!40000 ALTER TABLE `member_roles` DISABLE KEYS */;
INSERT INTO `member_roles` VALUES (1,1,3,NULL);
INSERT INTO `member_roles` VALUES (9,6,4,NULL);
INSERT INTO `member_roles` VALUES (11,7,5,NULL);
INSERT INTO `member_roles` VALUES (12,2,4,NULL);
INSERT INTO `member_roles` VALUES (13,2,5,NULL);
INSERT INTO `member_roles` VALUES (20,14,3,NULL);
INSERT INTO `member_roles` VALUES (21,15,3,NULL);
INSERT INTO `member_roles` VALUES (22,16,3,NULL);
INSERT INTO `member_roles` VALUES (23,17,4,NULL);
INSERT INTO `member_roles` VALUES (24,18,4,NULL);
INSERT INTO `member_roles` VALUES (25,19,4,NULL);
/*!40000 ALTER TABLE `member_roles` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table members
#

DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `mail_notification` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_members_on_user_id_and_project_id` (`user_id`,`project_id`),
  KEY `index_members_on_user_id` (`user_id`),
  KEY `index_members_on_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

#
# Dumping data for table members
#

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,1,1,'2015-07-01 21:14:29',0);
INSERT INTO `members` VALUES (2,7,1,'2015-07-02 14:38:53',0);
INSERT INTO `members` VALUES (6,9,3,'2015-07-09 17:58:31',0);
INSERT INTO `members` VALUES (7,10,1,'2015-07-10 17:36:04',0);
INSERT INTO `members` VALUES (14,10,2,'2015-07-14 17:01:26',0);
INSERT INTO `members` VALUES (15,4,2,'2015-07-14 17:01:26',0);
INSERT INTO `members` VALUES (16,3,2,'2015-07-14 17:01:26',0);
INSERT INTO `members` VALUES (17,8,1,'2015-07-28 16:09:43',0);
INSERT INTO `members` VALUES (18,9,1,'2015-07-28 16:09:43',0);
INSERT INTO `members` VALUES (19,11,1,'2015-08-04 11:14:22',0);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table messages
#

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `board_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `content` text,
  `author_id` int(11) DEFAULT NULL,
  `replies_count` int(11) NOT NULL DEFAULT '0',
  `last_reply_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `locked` tinyint(1) DEFAULT '0',
  `sticky` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `messages_board_id` (`board_id`),
  KEY `messages_parent_id` (`parent_id`),
  KEY `index_messages_on_last_reply_id` (`last_reply_id`),
  KEY `index_messages_on_author_id` (`author_id`),
  KEY `index_messages_on_created_on` (`created_on`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

#
# Dumping data for table messages
#

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,5,NULL,'爆个照','(*^__^*) 嘻嘻……',1,0,NULL,'2015-07-06 12:23:58','2015-07-06 12:23:58',0,0);
INSERT INTO `messages` VALUES (2,5,NULL,'美女','O(∩_∩)O~',1,0,NULL,'2015-07-07 12:31:21','2015-07-07 12:31:21',0,0);
INSERT INTO `messages` VALUES (3,5,NULL,'show1','show1',1,0,NULL,'2015-07-08 12:18:32','2015-07-08 12:18:32',0,0);
INSERT INTO `messages` VALUES (4,5,NULL,'show2','show2',1,0,NULL,'2015-07-08 12:18:52','2015-07-08 12:18:52',0,0);
INSERT INTO `messages` VALUES (5,5,NULL,'show3','show3',1,0,NULL,'2015-07-08 12:19:10','2015-07-08 12:19:10',0,0);
INSERT INTO `messages` VALUES (6,5,NULL,'show4','show4',1,0,NULL,'2015-07-08 12:19:21','2015-07-08 12:19:21',0,0);
INSERT INTO `messages` VALUES (7,5,NULL,'show5','show5',1,0,NULL,'2015-07-08 12:19:40','2015-07-08 12:19:40',0,0);
INSERT INTO `messages` VALUES (8,5,NULL,'show5','show5',1,0,NULL,'2015-07-08 12:19:40','2015-07-08 12:19:40',0,0);
INSERT INTO `messages` VALUES (9,5,NULL,'show5','show5',1,0,NULL,'2015-07-08 12:19:40','2015-07-08 12:19:40',0,0);
INSERT INTO `messages` VALUES (10,5,NULL,'show5','show5',1,0,NULL,'2015-07-08 12:19:40','2015-07-08 12:19:40',0,0);
INSERT INTO `messages` VALUES (11,5,NULL,'show5','show5',1,0,NULL,'2015-07-08 12:19:40','2015-07-08 12:19:40',0,0);
INSERT INTO `messages` VALUES (12,5,NULL,'show5','show5',1,0,NULL,'2015-07-08 12:19:40','2015-07-08 12:19:40',0,0);
INSERT INTO `messages` VALUES (13,5,NULL,'show5','show5',1,0,NULL,'2015-07-08 12:19:40','2015-07-08 12:19:40',0,0);
INSERT INTO `messages` VALUES (14,5,NULL,'show5','show5',1,0,NULL,'2015-07-08 12:19:40','2015-07-08 12:19:40',0,0);
INSERT INTO `messages` VALUES (15,5,NULL,'show5','show5',1,0,NULL,'2015-07-08 12:19:40','2015-07-08 12:19:40',0,0);
INSERT INTO `messages` VALUES (16,5,NULL,'show5','show5',1,0,NULL,'2015-07-08 12:19:40','2015-07-08 12:19:40',0,0);
INSERT INTO `messages` VALUES (17,5,NULL,'show5','show5',1,0,NULL,'2015-07-08 12:19:40','2015-07-08 12:19:40',0,0);
INSERT INTO `messages` VALUES (18,5,NULL,'show5','show5',1,0,NULL,'2015-07-08 12:19:40','2015-07-08 12:19:40',0,0);
INSERT INTO `messages` VALUES (19,5,NULL,'show5','show5',1,0,NULL,'2015-07-08 12:19:40','2015-07-08 12:19:40',0,0);
INSERT INTO `messages` VALUES (20,5,NULL,'show5','show5',1,0,NULL,'2015-07-08 12:19:40','2015-07-08 12:19:40',0,0);
INSERT INTO `messages` VALUES (21,5,NULL,'show5','show5',1,0,NULL,'2015-07-08 12:19:40','2015-07-08 12:19:40',0,0);
INSERT INTO `messages` VALUES (22,5,NULL,'show5','show5',1,0,NULL,'2015-07-08 12:19:40','2015-07-08 12:19:40',0,0);
INSERT INTO `messages` VALUES (23,5,NULL,'show5','show5',1,0,NULL,'2015-07-08 12:19:40','2015-07-08 12:19:40',0,0);
INSERT INTO `messages` VALUES (24,5,NULL,'show5','show5',1,0,NULL,'2015-07-08 12:19:40','2015-07-08 12:19:40',0,0);
INSERT INTO `messages` VALUES (25,5,NULL,'show5','show5',1,0,NULL,'2015-07-08 12:19:40','2015-07-08 12:19:40',0,0);
INSERT INTO `messages` VALUES (26,5,NULL,'show5','show5',1,0,NULL,'2015-07-08 12:19:40','2015-07-08 12:19:40',0,0);
INSERT INTO `messages` VALUES (27,5,NULL,'show5','show5',1,0,NULL,'2015-07-08 12:19:40','2015-07-08 12:19:40',0,0);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table news
#

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `title` varchar(60) NOT NULL DEFAULT '',
  `summary` varchar(255) DEFAULT '',
  `description` text,
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `comments_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `news_project_id` (`project_id`),
  KEY `index_news_on_author_id` (`author_id`),
  KEY `index_news_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table news
#

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table open_id_authentication_associations
#

DROP TABLE IF EXISTS `open_id_authentication_associations`;
CREATE TABLE `open_id_authentication_associations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issued` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `assoc_type` varchar(255) DEFAULT NULL,
  `server_url` blob,
  `secret` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table open_id_authentication_associations
#

LOCK TABLES `open_id_authentication_associations` WRITE;
/*!40000 ALTER TABLE `open_id_authentication_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_id_authentication_associations` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table open_id_authentication_nonces
#

DROP TABLE IF EXISTS `open_id_authentication_nonces`;
CREATE TABLE `open_id_authentication_nonces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL,
  `server_url` varchar(255) DEFAULT NULL,
  `salt` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table open_id_authentication_nonces
#

LOCK TABLES `open_id_authentication_nonces` WRITE;
/*!40000 ALTER TABLE `open_id_authentication_nonces` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_id_authentication_nonces` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table performance_subjects
#

DROP TABLE IF EXISTS `performance_subjects`;
CREATE TABLE `performance_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `performance_id` int(11) DEFAULT NULL,
  `subject` text,
  `priority_id` int(11) DEFAULT NULL,
  `aim` text,
  `comment` text,
  `assessment` text,
  `score` int(11) DEFAULT NULL,
  `leader_mark` int(11) DEFAULT NULL,
  `subject_type` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

#
# Dumping data for table performance_subjects
#

LOCK TABLES `performance_subjects` WRITE;
/*!40000 ALTER TABLE `performance_subjects` DISABLE KEYS */;
INSERT INTO `performance_subjects` VALUES (17,4,'新增礼包兑换功能',2,'5.5放外网，其他参见《产品组日常工作标准》','22222222222222','xxxxxxxxxxxx',30,24,1,'2015-07-24 13:07:55','2015-07-24 15:21:47');
INSERT INTO `performance_subjects` VALUES (20,4,'调整金币福利金币兑换和功勋领取',2,'5.12放外网，其他参见《产品组日常工作标准》','','',5,4,1,'2015-07-24 15:25:15','2015-07-24 15:25:15');
INSERT INTO `performance_subjects` VALUES (21,4,'兑换礼品界面增加微信二维码',1,'5.12放外网，其他参见《产品组日常工作标准》','','',10,8,1,'2015-07-24 15:55:31','2015-07-24 15:55:31');
INSERT INTO `performance_subjects` VALUES (23,4,'边境任务增加任务累积',1,'边境任务增加任务累积','','',5,4,1,'2015-07-24 16:46:57','2015-07-24 16:46:57');
INSERT INTO `performance_subjects` VALUES (24,4,'其他计划完成情况：各种bug修XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX啥啥啥啥啥啥啥啥啥啥啥啥啥啥啥啥啥啥啥啥啥啥啥啥啥啥啥啥啥啥啥啥啥啥',1,'其他计划完成情况：各种bug修正','','',25,23,1,'2015-07-24 16:48:38','2015-07-30 16:25:15');
INSERT INTO `performance_subjects` VALUES (25,4,'执行力\r\n积极主动性',1,'','加班+2','',20,5,2,'2015-07-24 17:16:33','2015-07-30 17:59:24');
INSERT INTO `performance_subjects` VALUES (26,16,'商城坐骑试乘增加品阶选项',1,'商城坐骑试乘增加品阶选项','','',55,33,1,'2015-07-28 15:13:00','2015-07-28 15:13:00');
INSERT INTO `performance_subjects` VALUES (27,17,'日本开拓团遗孤',1,'回日本','','',44,33,1,'2015-07-28 15:36:38','2015-07-28 15:36:38');
INSERT INTO `performance_subjects` VALUES (31,20,'11',1,'11','','',80,55,1,'2015-07-29 11:08:59','2015-07-31 10:34:06');
INSERT INTO `performance_subjects` VALUES (32,21,'aaaaaaaaa',1,'aaaaaaaaaaaaaaaaaa','','',22,11,1,'2015-07-30 11:25:50','2015-07-30 18:11:52');
INSERT INTO `performance_subjects` VALUES (33,21,'www',1,'222','','',NULL,NULL,1,'2015-07-30 11:27:52','2015-07-30 11:27:52');
INSERT INTO `performance_subjects` VALUES (34,21,'xxxxxx',1,'xxxxxxxx','','',NULL,NULL,1,'2015-07-30 11:39:36','2015-07-30 11:39:36');
INSERT INTO `performance_subjects` VALUES (35,21,'ttttttt',1,'ttttttt','','',NULL,NULL,1,'2015-07-30 11:40:10','2015-07-30 11:40:10');
INSERT INTO `performance_subjects` VALUES (36,24,'12312312',1,'41411241','','',22,22,1,'2015-07-30 17:19:30','2015-07-30 17:58:33');
INSERT INTO `performance_subjects` VALUES (37,24,'214444444444',1,'','','',20,11,2,'2015-07-30 17:19:38','2015-07-30 17:20:11');
INSERT INTO `performance_subjects` VALUES (38,19,'切切切切切切',1,'切切切切切切切','','',78,77,1,'2015-07-30 18:02:08','2015-07-30 18:02:08');
INSERT INTO `performance_subjects` VALUES (40,24,'uuuuuuuuuu',1,'uuuuuuuuuuuuuu','','',11,11,1,'2015-07-30 18:09:35','2015-07-30 18:09:35');
INSERT INTO `performance_subjects` VALUES (41,4,'将建军节建军节将',1,'','','',NULL,NULL,1,'2015-07-31 11:34:46','2015-07-31 11:34:46');
INSERT INTO `performance_subjects` VALUES (44,18,'www',1,'wwwww','','',80,70,1,'2015-07-31 16:09:00','2015-07-31 18:34:56');
INSERT INTO `performance_subjects` VALUES (48,18,'tttttt',1,'','','',20,12,2,'2015-07-31 17:19:36','2015-08-14 12:07:24');
INSERT INTO `performance_subjects` VALUES (52,25,'xxx',1,'xxx','','',55,-11,1,'2015-08-04 14:40:15','2015-08-10 12:25:05');
INSERT INTO `performance_subjects` VALUES (53,25,'哈啊 aaaa啊\r\n\r\nadfaf啊\r\nadf啊\r\nf阿达\r\naf \r\n是\r\n',1,'嘻嘻嘻嘻嘻嘻嘻嘻嘻','','',NULL,NULL,1,'2015-08-04 15:25:55','2015-08-04 15:25:55');
INSERT INTO `performance_subjects` VALUES (54,25,'adfa',1,'fafdafasfda','s','',24,22,1,'2015-08-04 16:20:45','2015-08-08 11:39:39');
INSERT INTO `performance_subjects` VALUES (61,25,'惺惺惜惺惺',3,'小小小','','',NULL,NULL,1,'2015-08-13 11:52:35','2015-08-13 11:52:35');
INSERT INTO `performance_subjects` VALUES (78,19,'11',3,'22','','',NULL,NULL,1,'2015-08-14 12:06:14','2015-08-14 12:06:14');
INSERT INTO `performance_subjects` VALUES (79,19,'1、执行力。\n2、积极主动性。',3,'1、各类规章命令的执行情况。\n2、主动、有效的反馈沟通，主动奉献，多做一点，多走一步。',NULL,NULL,20,NULL,2,'2015-08-14 12:06:14','2015-08-14 12:06:14');
INSERT INTO `performance_subjects` VALUES (80,18,'xx',3,'xx','','',0,-11,1,'2015-08-14 12:07:14','2015-08-14 12:07:14');
/*!40000 ALTER TABLE `performance_subjects` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table performances
#

DROP TABLE IF EXISTS `performances`;
CREATE TABLE `performances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `department_member_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `self_assessment` text,
  `leader_assessment` text,
  `leader_mark` int(11) DEFAULT NULL,
  `leader_rating` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

#
# Dumping data for table performances
#

LOCK TABLES `performances` WRITE;
/*!40000 ALTER TABLE `performances` DISABLE KEYS */;
INSERT INTO `performances` VALUES (4,1,1,90,2,'2015-07-21','呵呵呵呵呵呵','呵呵呵呵呵呵呵呵呵呵呵呵',68,'优秀','2015-07-21 16:31:42','2015-07-31 11:34:46');
INSERT INTO `performances` VALUES (16,10,1,92,3,'2015-07-01','玉匠大师','好好啊好好',33,'优秀','2015-07-28 15:06:44','2015-07-28 15:13:06');
INSERT INTO `performances` VALUES (17,7,1,1,3,'2015-07-01','竹内多鹤','小日本',33,'良民','2015-07-28 15:36:01','2015-07-28 15:37:05');
INSERT INTO `performances` VALUES (18,1,1,90,0,'2015-07-01','的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶大','的顶顶顶顶顶顶顶顶顶顶大',71,'','2015-07-28 16:06:24','2015-08-14 12:07:24');
INSERT INTO `performances` VALUES (19,9,1,93,2,'2015-07-01','韩子奇的师傅','啥啥啥啥啥啥啥',77,'','2015-07-28 16:10:29','2015-08-14 12:06:14');
INSERT INTO `performances` VALUES (20,7,1,1,2,'2015-07-01','行行行行行行行行行行新行行行行行行行行行行','asdfasdf',55,'','2015-07-29 09:53:24','2015-08-03 12:24:54');
INSERT INTO `performances` VALUES (21,1,1,90,0,'2015-07-01','','',11,'','2015-07-29 10:11:31','2015-07-30 18:11:53');
INSERT INTO `performances` VALUES (24,7,1,1,1,'2015-07-01','行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行行','',44,'C','2015-07-30 17:19:14','2015-08-04 19:24:27');
INSERT INTO `performances` VALUES (25,9,1,93,0,'2015-08-01','','',11,'','2015-08-03 14:55:38','2015-08-10 12:25:05');
INSERT INTO `performances` VALUES (29,7,1,1,2,'2015-08-01','','',NULL,'B','2015-08-04 19:39:11','2015-08-05 14:48:48');
/*!40000 ALTER TABLE `performances` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table projects
#

DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `homepage` varchar(255) DEFAULT '',
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_projects_on_lft` (`lft`),
  KEY `index_projects_on_rgt` (`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Dumping data for table projects
#

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Ogame','计划：\r\n  1.完成部门管理功能\r\n  2.完成绩效考核功能\r\n要求：\r\n   各个功能应该都在一个页面完成','',1,NULL,'2015-07-01 21:08:18','2015-07-01 21:08:18','ogame',1,1,4);
INSERT INTO `projects` VALUES (2,'Ogame_sub','OGame子项目\r\n7月计划','',1,1,'2015-07-01 21:09:48','2015-07-01 21:09:48','game_sub',1,2,3);
INSERT INTO `projects` VALUES (3,'其他项目','其他项目','',1,NULL,'2015-07-09 17:56:10','2015-07-09 17:56:10','other',1,5,6);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table projects_trackers
#

DROP TABLE IF EXISTS `projects_trackers`;
CREATE TABLE `projects_trackers` (
  `project_id` int(11) NOT NULL DEFAULT '0',
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `projects_trackers_unique` (`project_id`,`tracker_id`),
  KEY `projects_trackers_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table projects_trackers
#

LOCK TABLES `projects_trackers` WRITE;
/*!40000 ALTER TABLE `projects_trackers` DISABLE KEYS */;
INSERT INTO `projects_trackers` VALUES (1,1);
INSERT INTO `projects_trackers` VALUES (1,2);
INSERT INTO `projects_trackers` VALUES (1,3);
INSERT INTO `projects_trackers` VALUES (2,1);
INSERT INTO `projects_trackers` VALUES (2,2);
INSERT INTO `projects_trackers` VALUES (2,3);
INSERT INTO `projects_trackers` VALUES (3,1);
INSERT INTO `projects_trackers` VALUES (3,2);
INSERT INTO `projects_trackers` VALUES (3,3);
/*!40000 ALTER TABLE `projects_trackers` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table queries
#

DROP TABLE IF EXISTS `queries`;
CREATE TABLE `queries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `filters` text,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `column_names` text,
  `sort_criteria` text,
  `group_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_queries_on_project_id` (`project_id`),
  KEY `index_queries_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table queries
#

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table repositories
#

DROP TABLE IF EXISTS `repositories`;
CREATE TABLE `repositories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `login` varchar(60) DEFAULT '',
  `password` varchar(255) DEFAULT '',
  `root_url` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT NULL,
  `path_encoding` varchar(64) DEFAULT NULL,
  `log_encoding` varchar(64) DEFAULT NULL,
  `extra_info` text,
  `identifier` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_repositories_on_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Dumping data for table repositories
#

LOCK TABLES `repositories` WRITE;
/*!40000 ALTER TABLE `repositories` DISABLE KEYS */;
INSERT INTO `repositories` VALUES (1,1,'file:///D:/local_svn/MyRails','admin','daicong','file:///D:/local_svn','Repository::Subversion',NULL,NULL,'--- \n...\n','my_rails',1);
/*!40000 ALTER TABLE `repositories` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table roles
#

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `position` int(11) DEFAULT '1',
  `assignable` tinyint(1) DEFAULT '1',
  `builtin` int(11) NOT NULL DEFAULT '0',
  `permissions` text,
  `issues_visibility` varchar(30) NOT NULL DEFAULT 'default',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Dumping data for table roles
#

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Non member',1,1,1,'---\n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :view_time_entries\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :add_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n','default');
INSERT INTO `roles` VALUES (2,'Anonymous',2,1,2,'---\n- :view_issues\n- :view_gantt\n- :view_calendar\n- :view_time_entries\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :view_files\n- :browse_repository\n- :view_changesets\n','default');
INSERT INTO `roles` VALUES (3,'管理人员',3,1,0,'---\n- :add_project\n- :edit_project\n- :close_project\n- :select_project_modules\n- :manage_members\n- :manage_versions\n- :add_subprojects\n- :manage_boards\n- :add_messages\n- :edit_messages\n- :edit_own_messages\n- :delete_messages\n- :delete_own_messages\n- :view_calendar\n- :manage_departments\n- :manage_department_members\n- :manage_documents\n- :view_documents\n- :manage_files\n- :view_files\n- :view_gantt\n- :manage_categories\n- :view_issues\n- :add_issues\n- :edit_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :set_issues_private\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_issue_notes\n- :edit_own_issue_notes\n- :view_private_notes\n- :set_notes_private\n- :move_issues\n- :delete_issues\n- :manage_public_queries\n- :save_queries\n- :view_issue_watchers\n- :add_issue_watchers\n- :delete_issue_watchers\n- :manage_news\n- :comment_news\n- :manage_performances\n- :manage_repository\n- :browse_repository\n- :view_changesets\n- :commit_access\n- :manage_related_issues\n- :log_time\n- :view_time_entries\n- :edit_time_entries\n- :edit_own_time_entries\n- :manage_project_activities\n- :manage_wiki\n- :rename_wiki_pages\n- :delete_wiki_pages\n- :view_wiki_pages\n- :export_wiki_pages\n- :view_wiki_edits\n- :edit_wiki_pages\n- :delete_wiki_pages_attachments\n- :protect_wiki_pages\n','all');
INSERT INTO `roles` VALUES (4,'开发人员',4,1,0,'---\n- :manage_versions\n- :add_messages\n- :edit_own_messages\n- :view_calendar\n- :view_documents\n- :manage_files\n- :view_files\n- :view_gantt\n- :manage_categories\n- :view_issues\n- :add_issues\n- :edit_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :add_issue_notes\n- :view_private_notes\n- :set_notes_private\n- :save_queries\n- :comment_news\n- :manage_performances\n- :browse_repository\n- :view_changesets\n- :commit_access\n- :manage_related_issues\n- :log_time\n- :view_time_entries\n- :delete_wiki_pages\n- :view_wiki_pages\n- :view_wiki_edits\n- :edit_wiki_pages\n','default');
INSERT INTO `roles` VALUES (5,'报告人员',5,1,0,'---\n- :add_messages\n- :edit_own_messages\n- :view_calendar\n- :view_documents\n- :view_files\n- :view_gantt\n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :save_queries\n- :comment_news\n- :manage_performances\n- :browse_repository\n- :view_changesets\n- :log_time\n- :view_time_entries\n- :view_wiki_pages\n- :view_wiki_edits\n','default');
INSERT INTO `roles` VALUES (6,'绩效归档人员',6,1,0,'---\n- :add_messages\n- :view_calendar\n- :view_documents\n- :view_files\n- :view_gantt\n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :save_queries\n- :comment_news\n- :archive_performances\n- :browse_repository\n- :view_changesets\n- :view_time_entries\n- :view_wiki_pages\n- :view_wiki_edits\n','default');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table schema_migrations
#

DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table schema_migrations
#

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('1');
INSERT INTO `schema_migrations` VALUES ('10');
INSERT INTO `schema_migrations` VALUES ('100');
INSERT INTO `schema_migrations` VALUES ('101');
INSERT INTO `schema_migrations` VALUES ('102');
INSERT INTO `schema_migrations` VALUES ('103');
INSERT INTO `schema_migrations` VALUES ('104');
INSERT INTO `schema_migrations` VALUES ('105');
INSERT INTO `schema_migrations` VALUES ('106');
INSERT INTO `schema_migrations` VALUES ('107');
INSERT INTO `schema_migrations` VALUES ('108');
INSERT INTO `schema_migrations` VALUES ('11');
INSERT INTO `schema_migrations` VALUES ('12');
INSERT INTO `schema_migrations` VALUES ('13');
INSERT INTO `schema_migrations` VALUES ('14');
INSERT INTO `schema_migrations` VALUES ('15');
INSERT INTO `schema_migrations` VALUES ('16');
INSERT INTO `schema_migrations` VALUES ('17');
INSERT INTO `schema_migrations` VALUES ('18');
INSERT INTO `schema_migrations` VALUES ('19');
INSERT INTO `schema_migrations` VALUES ('2');
INSERT INTO `schema_migrations` VALUES ('20');
INSERT INTO `schema_migrations` VALUES ('20090214190337');
INSERT INTO `schema_migrations` VALUES ('20090312172426');
INSERT INTO `schema_migrations` VALUES ('20090312194159');
INSERT INTO `schema_migrations` VALUES ('20090318181151');
INSERT INTO `schema_migrations` VALUES ('20090323224724');
INSERT INTO `schema_migrations` VALUES ('20090401221305');
INSERT INTO `schema_migrations` VALUES ('20090401231134');
INSERT INTO `schema_migrations` VALUES ('20090403001910');
INSERT INTO `schema_migrations` VALUES ('20090406161854');
INSERT INTO `schema_migrations` VALUES ('20090425161243');
INSERT INTO `schema_migrations` VALUES ('20090503121501');
INSERT INTO `schema_migrations` VALUES ('20090503121505');
INSERT INTO `schema_migrations` VALUES ('20090503121510');
INSERT INTO `schema_migrations` VALUES ('20090614091200');
INSERT INTO `schema_migrations` VALUES ('20090704172350');
INSERT INTO `schema_migrations` VALUES ('20090704172355');
INSERT INTO `schema_migrations` VALUES ('20090704172358');
INSERT INTO `schema_migrations` VALUES ('20091010093521');
INSERT INTO `schema_migrations` VALUES ('20091017212227');
INSERT INTO `schema_migrations` VALUES ('20091017212457');
INSERT INTO `schema_migrations` VALUES ('20091017212644');
INSERT INTO `schema_migrations` VALUES ('20091017212938');
INSERT INTO `schema_migrations` VALUES ('20091017213027');
INSERT INTO `schema_migrations` VALUES ('20091017213113');
INSERT INTO `schema_migrations` VALUES ('20091017213151');
INSERT INTO `schema_migrations` VALUES ('20091017213228');
INSERT INTO `schema_migrations` VALUES ('20091017213257');
INSERT INTO `schema_migrations` VALUES ('20091017213332');
INSERT INTO `schema_migrations` VALUES ('20091017213444');
INSERT INTO `schema_migrations` VALUES ('20091017213536');
INSERT INTO `schema_migrations` VALUES ('20091017213642');
INSERT INTO `schema_migrations` VALUES ('20091017213716');
INSERT INTO `schema_migrations` VALUES ('20091017213757');
INSERT INTO `schema_migrations` VALUES ('20091017213835');
INSERT INTO `schema_migrations` VALUES ('20091017213910');
INSERT INTO `schema_migrations` VALUES ('20091017214015');
INSERT INTO `schema_migrations` VALUES ('20091017214107');
INSERT INTO `schema_migrations` VALUES ('20091017214136');
INSERT INTO `schema_migrations` VALUES ('20091017214236');
INSERT INTO `schema_migrations` VALUES ('20091017214308');
INSERT INTO `schema_migrations` VALUES ('20091017214336');
INSERT INTO `schema_migrations` VALUES ('20091017214406');
INSERT INTO `schema_migrations` VALUES ('20091017214440');
INSERT INTO `schema_migrations` VALUES ('20091017214519');
INSERT INTO `schema_migrations` VALUES ('20091017214611');
INSERT INTO `schema_migrations` VALUES ('20091017214644');
INSERT INTO `schema_migrations` VALUES ('20091017214720');
INSERT INTO `schema_migrations` VALUES ('20091017214750');
INSERT INTO `schema_migrations` VALUES ('20091025163651');
INSERT INTO `schema_migrations` VALUES ('20091108092559');
INSERT INTO `schema_migrations` VALUES ('20091114105931');
INSERT INTO `schema_migrations` VALUES ('20091123212029');
INSERT INTO `schema_migrations` VALUES ('20091205124427');
INSERT INTO `schema_migrations` VALUES ('20091220183509');
INSERT INTO `schema_migrations` VALUES ('20091220183727');
INSERT INTO `schema_migrations` VALUES ('20091220184736');
INSERT INTO `schema_migrations` VALUES ('20091225164732');
INSERT INTO `schema_migrations` VALUES ('20091227112908');
INSERT INTO `schema_migrations` VALUES ('20100129193402');
INSERT INTO `schema_migrations` VALUES ('20100129193813');
INSERT INTO `schema_migrations` VALUES ('20100221100219');
INSERT INTO `schema_migrations` VALUES ('20100313132032');
INSERT INTO `schema_migrations` VALUES ('20100313171051');
INSERT INTO `schema_migrations` VALUES ('20100705164950');
INSERT INTO `schema_migrations` VALUES ('20100819172912');
INSERT INTO `schema_migrations` VALUES ('20101104182107');
INSERT INTO `schema_migrations` VALUES ('20101107130441');
INSERT INTO `schema_migrations` VALUES ('20101114115114');
INSERT INTO `schema_migrations` VALUES ('20101114115359');
INSERT INTO `schema_migrations` VALUES ('20110220160626');
INSERT INTO `schema_migrations` VALUES ('20110223180944');
INSERT INTO `schema_migrations` VALUES ('20110223180953');
INSERT INTO `schema_migrations` VALUES ('20110224000000');
INSERT INTO `schema_migrations` VALUES ('20110226120112');
INSERT INTO `schema_migrations` VALUES ('20110226120132');
INSERT INTO `schema_migrations` VALUES ('20110227125750');
INSERT INTO `schema_migrations` VALUES ('20110228000000');
INSERT INTO `schema_migrations` VALUES ('20110228000100');
INSERT INTO `schema_migrations` VALUES ('20110401192910');
INSERT INTO `schema_migrations` VALUES ('20110408103312');
INSERT INTO `schema_migrations` VALUES ('20110412065600');
INSERT INTO `schema_migrations` VALUES ('20110511000000');
INSERT INTO `schema_migrations` VALUES ('20110902000000');
INSERT INTO `schema_migrations` VALUES ('20111201201315');
INSERT INTO `schema_migrations` VALUES ('20120115143024');
INSERT INTO `schema_migrations` VALUES ('20120115143100');
INSERT INTO `schema_migrations` VALUES ('20120115143126');
INSERT INTO `schema_migrations` VALUES ('20120127174243');
INSERT INTO `schema_migrations` VALUES ('20120205111326');
INSERT INTO `schema_migrations` VALUES ('20120223110929');
INSERT INTO `schema_migrations` VALUES ('20120301153455');
INSERT INTO `schema_migrations` VALUES ('20120422150750');
INSERT INTO `schema_migrations` VALUES ('20120705074331');
INSERT INTO `schema_migrations` VALUES ('20120707064544');
INSERT INTO `schema_migrations` VALUES ('20120714122000');
INSERT INTO `schema_migrations` VALUES ('20120714122100');
INSERT INTO `schema_migrations` VALUES ('20120714122200');
INSERT INTO `schema_migrations` VALUES ('20120731164049');
INSERT INTO `schema_migrations` VALUES ('20120930112914');
INSERT INTO `schema_migrations` VALUES ('20121026002032');
INSERT INTO `schema_migrations` VALUES ('20121026003537');
INSERT INTO `schema_migrations` VALUES ('20150706023714');
INSERT INTO `schema_migrations` VALUES ('20150707073504');
INSERT INTO `schema_migrations` VALUES ('20150720023255');
INSERT INTO `schema_migrations` VALUES ('20150723032726');
INSERT INTO `schema_migrations` VALUES ('20150805032724');
INSERT INTO `schema_migrations` VALUES ('21');
INSERT INTO `schema_migrations` VALUES ('22');
INSERT INTO `schema_migrations` VALUES ('23');
INSERT INTO `schema_migrations` VALUES ('24');
INSERT INTO `schema_migrations` VALUES ('25');
INSERT INTO `schema_migrations` VALUES ('26');
INSERT INTO `schema_migrations` VALUES ('27');
INSERT INTO `schema_migrations` VALUES ('28');
INSERT INTO `schema_migrations` VALUES ('29');
INSERT INTO `schema_migrations` VALUES ('3');
INSERT INTO `schema_migrations` VALUES ('30');
INSERT INTO `schema_migrations` VALUES ('31');
INSERT INTO `schema_migrations` VALUES ('32');
INSERT INTO `schema_migrations` VALUES ('33');
INSERT INTO `schema_migrations` VALUES ('34');
INSERT INTO `schema_migrations` VALUES ('35');
INSERT INTO `schema_migrations` VALUES ('36');
INSERT INTO `schema_migrations` VALUES ('37');
INSERT INTO `schema_migrations` VALUES ('38');
INSERT INTO `schema_migrations` VALUES ('39');
INSERT INTO `schema_migrations` VALUES ('4');
INSERT INTO `schema_migrations` VALUES ('40');
INSERT INTO `schema_migrations` VALUES ('41');
INSERT INTO `schema_migrations` VALUES ('42');
INSERT INTO `schema_migrations` VALUES ('43');
INSERT INTO `schema_migrations` VALUES ('44');
INSERT INTO `schema_migrations` VALUES ('45');
INSERT INTO `schema_migrations` VALUES ('46');
INSERT INTO `schema_migrations` VALUES ('47');
INSERT INTO `schema_migrations` VALUES ('48');
INSERT INTO `schema_migrations` VALUES ('49');
INSERT INTO `schema_migrations` VALUES ('5');
INSERT INTO `schema_migrations` VALUES ('50');
INSERT INTO `schema_migrations` VALUES ('51');
INSERT INTO `schema_migrations` VALUES ('52');
INSERT INTO `schema_migrations` VALUES ('53');
INSERT INTO `schema_migrations` VALUES ('54');
INSERT INTO `schema_migrations` VALUES ('55');
INSERT INTO `schema_migrations` VALUES ('56');
INSERT INTO `schema_migrations` VALUES ('57');
INSERT INTO `schema_migrations` VALUES ('58');
INSERT INTO `schema_migrations` VALUES ('59');
INSERT INTO `schema_migrations` VALUES ('6');
INSERT INTO `schema_migrations` VALUES ('60');
INSERT INTO `schema_migrations` VALUES ('61');
INSERT INTO `schema_migrations` VALUES ('62');
INSERT INTO `schema_migrations` VALUES ('63');
INSERT INTO `schema_migrations` VALUES ('64');
INSERT INTO `schema_migrations` VALUES ('65');
INSERT INTO `schema_migrations` VALUES ('66');
INSERT INTO `schema_migrations` VALUES ('67');
INSERT INTO `schema_migrations` VALUES ('68');
INSERT INTO `schema_migrations` VALUES ('69');
INSERT INTO `schema_migrations` VALUES ('7');
INSERT INTO `schema_migrations` VALUES ('70');
INSERT INTO `schema_migrations` VALUES ('71');
INSERT INTO `schema_migrations` VALUES ('72');
INSERT INTO `schema_migrations` VALUES ('73');
INSERT INTO `schema_migrations` VALUES ('74');
INSERT INTO `schema_migrations` VALUES ('75');
INSERT INTO `schema_migrations` VALUES ('76');
INSERT INTO `schema_migrations` VALUES ('77');
INSERT INTO `schema_migrations` VALUES ('78');
INSERT INTO `schema_migrations` VALUES ('79');
INSERT INTO `schema_migrations` VALUES ('8');
INSERT INTO `schema_migrations` VALUES ('80');
INSERT INTO `schema_migrations` VALUES ('81');
INSERT INTO `schema_migrations` VALUES ('82');
INSERT INTO `schema_migrations` VALUES ('83');
INSERT INTO `schema_migrations` VALUES ('84');
INSERT INTO `schema_migrations` VALUES ('85');
INSERT INTO `schema_migrations` VALUES ('86');
INSERT INTO `schema_migrations` VALUES ('87');
INSERT INTO `schema_migrations` VALUES ('88');
INSERT INTO `schema_migrations` VALUES ('89');
INSERT INTO `schema_migrations` VALUES ('9');
INSERT INTO `schema_migrations` VALUES ('90');
INSERT INTO `schema_migrations` VALUES ('91');
INSERT INTO `schema_migrations` VALUES ('92');
INSERT INTO `schema_migrations` VALUES ('93');
INSERT INTO `schema_migrations` VALUES ('94');
INSERT INTO `schema_migrations` VALUES ('95');
INSERT INTO `schema_migrations` VALUES ('96');
INSERT INTO `schema_migrations` VALUES ('97');
INSERT INTO `schema_migrations` VALUES ('98');
INSERT INTO `schema_migrations` VALUES ('99');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table settings
#

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_settings_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

#
# Dumping data for table settings
#

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'mail_handler_body_delimiters','','2015-07-02 11:18:04');
INSERT INTO `settings` VALUES (2,'mail_handler_api_enabled','0','2015-07-02 11:18:04');
INSERT INTO `settings` VALUES (3,'mail_from','redmine@example.net','2015-07-02 11:18:15');
INSERT INTO `settings` VALUES (4,'bcc_recipients','0','2015-07-02 11:18:15');
INSERT INTO `settings` VALUES (5,'plain_text_mail','0','2015-07-02 11:18:15');
INSERT INTO `settings` VALUES (6,'default_notification_option','none','2015-07-02 11:18:15');
INSERT INTO `settings` VALUES (7,'notified_events','--- []\n','2015-07-02 11:18:15');
INSERT INTO `settings` VALUES (8,'emails_header','','2015-07-02 11:18:16');
INSERT INTO `settings` VALUES (9,'emails_footer','You have received this notification because you have either subscribed to it, or are involved in it.\r\nTo change your notification preferences, please click here: http://hostname/my/account','2015-07-02 11:18:16');
INSERT INTO `settings` VALUES (10,'app_title','不败传说','2015-07-07 12:19:46');
INSERT INTO `settings` VALUES (11,'welcome_text','','2015-07-03 09:57:16');
INSERT INTO `settings` VALUES (12,'attachment_max_size','5120','2015-07-03 09:57:16');
INSERT INTO `settings` VALUES (13,'per_page_options','25,50,100','2015-07-03 09:57:16');
INSERT INTO `settings` VALUES (14,'activity_days_default','30','2015-07-03 09:57:17');
INSERT INTO `settings` VALUES (15,'host_name','localhost:3000','2015-07-03 09:57:17');
INSERT INTO `settings` VALUES (16,'protocol','http','2015-07-03 09:57:17');
INSERT INTO `settings` VALUES (17,'text_formatting','textile','2015-07-03 09:57:17');
INSERT INTO `settings` VALUES (18,'cache_formatted_text','0','2015-07-03 09:57:17');
INSERT INTO `settings` VALUES (19,'wiki_compression','','2015-07-03 09:57:17');
INSERT INTO `settings` VALUES (20,'feeds_limit','15','2015-07-03 09:57:17');
INSERT INTO `settings` VALUES (21,'file_max_size_displayed','512','2015-07-03 09:57:17');
INSERT INTO `settings` VALUES (22,'diff_max_lines_displayed','1500','2015-07-03 09:57:17');
INSERT INTO `settings` VALUES (23,'repositories_encodings','','2015-07-03 09:57:17');
INSERT INTO `settings` VALUES (24,'ui_theme','','2015-07-07 14:30:59');
INSERT INTO `settings` VALUES (25,'default_language','en','2015-07-07 14:30:50');
INSERT INTO `settings` VALUES (26,'start_of_week','','2015-07-07 14:30:50');
INSERT INTO `settings` VALUES (27,'date_format','','2015-07-07 14:30:50');
INSERT INTO `settings` VALUES (28,'time_format','','2015-07-07 14:30:50');
INSERT INTO `settings` VALUES (29,'user_format','firstname_lastname','2015-07-07 14:30:50');
INSERT INTO `settings` VALUES (30,'gravatar_enabled','0','2015-07-07 14:30:50');
INSERT INTO `settings` VALUES (31,'gravatar_default','','2015-07-07 14:30:50');
INSERT INTO `settings` VALUES (32,'thumbnails_enabled','0','2015-07-07 14:30:50');
INSERT INTO `settings` VALUES (33,'thumbnails_size','100','2015-07-07 14:30:50');
INSERT INTO `settings` VALUES (34,'default_projects_public','1','2015-07-13 14:45:50');
INSERT INTO `settings` VALUES (35,'default_projects_modules','---\n- issue_tracking\n- time_tracking\n- news\n- documents\n- files\n- wiki\n- repository\n- boards\n- calendar\n- gantt\n- departments\n- performances\n','2015-08-03 09:59:09');
INSERT INTO `settings` VALUES (36,'sequential_project_identifiers','0','2015-07-13 14:45:50');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table time_entries
#

DROP TABLE IF EXISTS `time_entries`;
CREATE TABLE `time_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `hours` float NOT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `activity_id` int(11) NOT NULL,
  `spent_on` date NOT NULL,
  `tyear` int(11) NOT NULL,
  `tmonth` int(11) NOT NULL,
  `tweek` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time_entries_project_id` (`project_id`),
  KEY `time_entries_issue_id` (`issue_id`),
  KEY `index_time_entries_on_activity_id` (`activity_id`),
  KEY `index_time_entries_on_user_id` (`user_id`),
  KEY `index_time_entries_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table time_entries
#

LOCK TABLES `time_entries` WRITE;
/*!40000 ALTER TABLE `time_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_entries` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table tokens
#

DROP TABLE IF EXISTS `tokens`;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `action` varchar(30) NOT NULL DEFAULT '',
  `value` varchar(40) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tokens_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Dumping data for table tokens
#

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (1,1,'feeds','2be75e012e4605c5942264675bbe93191f70b52e','2015-07-01 18:38:59');
INSERT INTO `tokens` VALUES (2,7,'feeds','92a082ada6fbb5c1a3cc62dea4a53d74483fadd4','2015-07-03 14:34:23');
INSERT INTO `tokens` VALUES (3,10,'feeds','848dd057e20f6545c49bc51c887feccaaced75ed','2015-07-28 14:35:44');
INSERT INTO `tokens` VALUES (4,9,'feeds','a20d44c3b7b2ee28588e04fe497d1597cea98375','2015-07-28 16:10:05');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table trackers
#

DROP TABLE IF EXISTS `trackers`;
CREATE TABLE `trackers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `is_in_chlog` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT '1',
  `is_in_roadmap` tinyint(1) NOT NULL DEFAULT '1',
  `fields_bits` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Dumping data for table trackers
#

LOCK TABLES `trackers` WRITE;
/*!40000 ALTER TABLE `trackers` DISABLE KEYS */;
INSERT INTO `trackers` VALUES (1,'错误',1,1,0,0);
INSERT INTO `trackers` VALUES (2,'功能',1,2,1,0);
INSERT INTO `trackers` VALUES (3,'支持',0,3,0,0);
/*!40000 ALTER TABLE `trackers` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table user_preferences
#

DROP TABLE IF EXISTS `user_preferences`;
CREATE TABLE `user_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `others` text,
  `hide_mail` tinyint(1) DEFAULT '0',
  `time_zone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_preferences_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Dumping data for table user_preferences
#

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES (1,1,'---\n:gantt_zoom: 2\n:gantt_months: 6\n',0,NULL);
INSERT INTO `user_preferences` VALUES (2,7,'---\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:no_self_notified: false\n:gantt_zoom: 2\n:gantt_months: 6\n',0,'');
INSERT INTO `user_preferences` VALUES (3,8,'---\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:no_self_notified: false\n',0,'');
INSERT INTO `user_preferences` VALUES (4,9,'---\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:no_self_notified: false\n',0,'');
INSERT INTO `user_preferences` VALUES (5,10,'---\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:no_self_notified: false\n',0,'');
INSERT INTO `user_preferences` VALUES (6,11,'---\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:no_self_notified: false\n',0,'');
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table users
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL DEFAULT '',
  `hashed_password` varchar(40) NOT NULL DEFAULT '',
  `firstname` varchar(30) NOT NULL DEFAULT '',
  `lastname` varchar(30) NOT NULL DEFAULT '',
  `mail` varchar(60) NOT NULL DEFAULT '',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `last_login_on` datetime DEFAULT NULL,
  `language` varchar(5) DEFAULT '',
  `auth_source_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `identity_url` varchar(255) DEFAULT NULL,
  `mail_notification` varchar(255) NOT NULL DEFAULT '',
  `salt` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_on_id_and_type` (`id`,`type`),
  KEY `index_users_on_auth_source_id` (`auth_source_id`),
  KEY `index_users_on_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Dumping data for table users
#

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','386600868e49f8db111f649dacd40ea9fb089a8b','Leo','Admin','mail@example.com',1,1,'2015-08-18 10:11:22','zh',NULL,'2015-07-01 18:09:29','2015-08-18 10:11:22','User',NULL,'all','9bd7d3e3bb5df73d013d7a72eedb8b3d');
INSERT INTO `users` VALUES (2,'','','','Anonymous','',0,0,NULL,'',NULL,'2015-07-01 18:38:51','2015-07-01 18:38:51','AnonymousUser',NULL,'only_my_events',NULL);
INSERT INTO `users` VALUES (3,'','','','程序','',0,1,NULL,'',NULL,'2015-07-01 21:11:17','2015-07-01 21:11:17','Group',NULL,'',NULL);
INSERT INTO `users` VALUES (4,'','','','测试','',0,1,NULL,'',NULL,'2015-07-01 21:11:25','2015-07-01 21:11:25','Group',NULL,'',NULL);
INSERT INTO `users` VALUES (5,'','','','策划','',0,1,NULL,'',NULL,'2015-07-01 21:11:38','2015-07-01 21:11:38','Group',NULL,'',NULL);
INSERT INTO `users` VALUES (6,'','','','美术','',0,1,NULL,'',NULL,'2015-07-01 21:11:46','2015-07-01 21:11:46','Group',NULL,'',NULL);
INSERT INTO `users` VALUES (7,'duohe','684d0073abe2d53f1bdd184088324e1bc4cd943d','朱','多鹤','123@qq.com',0,1,'2015-08-18 10:10:14','zh',NULL,'2015-07-02 14:37:27','2015-08-18 10:10:14','User',NULL,'none','e7050e872f832a2eb248e7e542022775');
INSERT INTO `users` VALUES (8,'zhuxiaohuan','c515db014bd239f20f657ad95b79a59e824f7735','朱','小环','1234@qq.com',0,1,NULL,'zh',NULL,'2015-07-08 10:21:51','2015-07-08 10:21:51','User',NULL,'none','38030e3162a07d529e9020d6af4ea082');
INSERT INTO `users` VALUES (9,'liangyiqing','a5ee12c363f21eee5c74543025d7cd5389553640','梁','亦清','12312312@qq.com',0,1,'2015-08-18 09:44:50','zh',NULL,'2015-07-09 17:54:20','2015-08-18 09:44:50','User',NULL,'none','b157190310659c06892971c1d129a42a');
INSERT INTO `users` VALUES (10,'hanziqi','82430673fdd6a13d8f7e106e121a730cc4e3a479','韩','子奇','12313141@qq.com',0,1,'2015-08-03 15:10:45','zh',NULL,'2015-07-10 17:35:50','2015-08-03 15:10:45','User',NULL,'none','d04b53945cb03f9ab93109b307d389c6');
INSERT INTO `users` VALUES (11,'hanxinyue','9328c196aa971089fdd53466f5e251bc8af0f279','韩','新月','123123x12@qq.com',0,1,NULL,'en',NULL,'2015-08-04 11:13:26','2015-08-04 11:13:26','User',NULL,'none','a8bb34928aa4af56f96f96a8c38bff69');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table versions
#

DROP TABLE IF EXISTS `versions`;
CREATE TABLE `versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `effective_date` date DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `wiki_page_title` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'open',
  `sharing` varchar(255) NOT NULL DEFAULT 'none',
  PRIMARY KEY (`id`),
  KEY `versions_project_id` (`project_id`),
  KEY `index_versions_on_sharing` (`sharing`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Dumping data for table versions
#

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,1,'7月版本','','2015-07-01','2015-07-01 22:02:37','2015-07-01 22:02:37','','open','none');
INSERT INTO `versions` VALUES (2,1,'【7月25版本】','',NULL,'2015-07-02 10:18:16','2015-07-02 10:18:16','','open','none');
INSERT INTO `versions` VALUES (3,1,'测试版本','测试功能','2015-07-31','2015-07-22 17:49:00','2015-07-22 17:49:00','','open','none');
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table watchers
#

DROP TABLE IF EXISTS `watchers`;
CREATE TABLE `watchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `watchable_type` varchar(255) NOT NULL DEFAULT '',
  `watchable_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `watchers_user_id_type` (`user_id`,`watchable_type`),
  KEY `index_watchers_on_user_id` (`user_id`),
  KEY `index_watchers_on_watchable_id_and_watchable_type` (`watchable_id`,`watchable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

#
# Dumping data for table watchers
#

LOCK TABLES `watchers` WRITE;
/*!40000 ALTER TABLE `watchers` DISABLE KEYS */;
INSERT INTO `watchers` VALUES (1,'Issue',1,1);
INSERT INTO `watchers` VALUES (2,'Issue',2,1);
INSERT INTO `watchers` VALUES (3,'Issue',3,1);
INSERT INTO `watchers` VALUES (4,'Issue',5,1);
INSERT INTO `watchers` VALUES (5,'Issue',6,1);
INSERT INTO `watchers` VALUES (6,'Message',1,1);
INSERT INTO `watchers` VALUES (7,'Issue',7,1);
INSERT INTO `watchers` VALUES (8,'Message',2,1);
INSERT INTO `watchers` VALUES (9,'Issue',8,1);
INSERT INTO `watchers` VALUES (10,'Message',3,1);
INSERT INTO `watchers` VALUES (11,'Message',4,1);
INSERT INTO `watchers` VALUES (12,'Message',5,1);
INSERT INTO `watchers` VALUES (13,'Message',6,1);
INSERT INTO `watchers` VALUES (14,'Message',7,1);
/*!40000 ALTER TABLE `watchers` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table wiki_content_versions
#

DROP TABLE IF EXISTS `wiki_content_versions`;
CREATE TABLE `wiki_content_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_content_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `data` longblob,
  `compression` varchar(6) DEFAULT '',
  `comments` varchar(255) DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_content_versions_wcid` (`wiki_content_id`),
  KEY `index_wiki_content_versions_on_updated_on` (`updated_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table wiki_content_versions
#

LOCK TABLES `wiki_content_versions` WRITE;
/*!40000 ALTER TABLE `wiki_content_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_content_versions` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table wiki_contents
#

DROP TABLE IF EXISTS `wiki_contents`;
CREATE TABLE `wiki_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `text` longtext,
  `comments` varchar(255) DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_contents_page_id` (`page_id`),
  KEY `index_wiki_contents_on_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table wiki_contents
#

LOCK TABLES `wiki_contents` WRITE;
/*!40000 ALTER TABLE `wiki_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_contents` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table wiki_pages
#

DROP TABLE IF EXISTS `wiki_pages`;
CREATE TABLE `wiki_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  `protected` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_pages_wiki_id_title` (`wiki_id`,`title`),
  KEY `index_wiki_pages_on_wiki_id` (`wiki_id`),
  KEY `index_wiki_pages_on_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table wiki_pages
#

LOCK TABLES `wiki_pages` WRITE;
/*!40000 ALTER TABLE `wiki_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_pages` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table wiki_redirects
#

DROP TABLE IF EXISTS `wiki_redirects`;
CREATE TABLE `wiki_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `redirects_to` varchar(255) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_redirects_wiki_id_title` (`wiki_id`,`title`),
  KEY `index_wiki_redirects_on_wiki_id` (`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table wiki_redirects
#

LOCK TABLES `wiki_redirects` WRITE;
/*!40000 ALTER TABLE `wiki_redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_redirects` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table wikis
#

DROP TABLE IF EXISTS `wikis`;
CREATE TABLE `wikis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `start_page` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `wikis_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Dumping data for table wikis
#

LOCK TABLES `wikis` WRITE;
/*!40000 ALTER TABLE `wikis` DISABLE KEYS */;
INSERT INTO `wikis` VALUES (1,1,'Wiki',1);
INSERT INTO `wikis` VALUES (2,2,'Wiki',1);
INSERT INTO `wikis` VALUES (3,3,'Wiki',1);
/*!40000 ALTER TABLE `wikis` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table workflows
#

DROP TABLE IF EXISTS `workflows`;
CREATE TABLE `workflows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  `old_status_id` int(11) NOT NULL DEFAULT '0',
  `new_status_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `assignee` tinyint(1) NOT NULL DEFAULT '0',
  `author` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(30) DEFAULT NULL,
  `field_name` varchar(30) DEFAULT NULL,
  `rule` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wkfs_role_tracker_old_status` (`role_id`,`tracker_id`,`old_status_id`),
  KEY `index_workflows_on_old_status_id` (`old_status_id`),
  KEY `index_workflows_on_role_id` (`role_id`),
  KEY `index_workflows_on_new_status_id` (`new_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

#
# Dumping data for table workflows
#

LOCK TABLES `workflows` WRITE;
/*!40000 ALTER TABLE `workflows` DISABLE KEYS */;
INSERT INTO `workflows` VALUES (1,1,1,2,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (2,1,1,3,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (3,1,1,4,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (4,1,1,5,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (5,1,1,6,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (6,1,2,1,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (7,1,2,3,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (8,1,2,4,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (9,1,2,5,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (10,1,2,6,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (11,1,3,1,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (12,1,3,2,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (13,1,3,4,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (14,1,3,5,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (15,1,3,6,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (16,1,4,1,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (17,1,4,2,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (18,1,4,3,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (19,1,4,5,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (20,1,4,6,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (21,1,5,1,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (22,1,5,2,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (23,1,5,3,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (24,1,5,4,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (25,1,5,6,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (26,1,6,1,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (27,1,6,2,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (28,1,6,3,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (29,1,6,4,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (30,1,6,5,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (31,2,1,2,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (32,2,1,3,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (33,2,1,4,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (34,2,1,5,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (35,2,1,6,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (36,2,2,1,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (37,2,2,3,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (38,2,2,4,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (39,2,2,5,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (40,2,2,6,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (41,2,3,1,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (42,2,3,2,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (43,2,3,4,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (44,2,3,5,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (45,2,3,6,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (46,2,4,1,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (47,2,4,2,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (48,2,4,3,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (49,2,4,5,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (50,2,4,6,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (51,2,5,1,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (52,2,5,2,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (53,2,5,3,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (54,2,5,4,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (55,2,5,6,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (56,2,6,1,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (57,2,6,2,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (58,2,6,3,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (59,2,6,4,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (60,2,6,5,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (61,3,1,2,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (62,3,1,3,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (63,3,1,4,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (64,3,1,5,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (65,3,1,6,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (66,3,2,1,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (67,3,2,3,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (68,3,2,4,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (69,3,2,5,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (70,3,2,6,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (71,3,3,1,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (72,3,3,2,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (73,3,3,4,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (74,3,3,5,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (75,3,3,6,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (76,3,4,1,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (77,3,4,2,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (78,3,4,3,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (79,3,4,5,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (80,3,4,6,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (81,3,5,1,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (82,3,5,2,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (83,3,5,3,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (84,3,5,4,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (85,3,5,6,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (86,3,6,1,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (87,3,6,2,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (88,3,6,3,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (89,3,6,4,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (90,3,6,5,3,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (91,1,1,2,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (92,1,1,3,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (93,1,1,4,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (94,1,1,5,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (95,1,2,3,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (96,1,2,4,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (97,1,2,5,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (98,1,3,2,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (99,1,3,4,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (100,1,3,5,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (101,1,4,2,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (102,1,4,3,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (103,1,4,5,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (104,2,1,2,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (105,2,1,3,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (106,2,1,4,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (107,2,1,5,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (108,2,2,3,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (109,2,2,4,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (110,2,2,5,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (111,2,3,2,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (112,2,3,4,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (113,2,3,5,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (114,2,4,2,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (115,2,4,3,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (116,2,4,5,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (117,3,1,2,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (118,3,1,3,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (119,3,1,4,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (120,3,1,5,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (121,3,2,3,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (122,3,2,4,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (123,3,2,5,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (124,3,3,2,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (125,3,3,4,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (126,3,3,5,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (127,3,4,2,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (128,3,4,3,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (129,3,4,5,4,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (130,1,1,5,5,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (131,1,2,5,5,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (132,1,3,5,5,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (133,1,4,5,5,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (134,1,3,4,5,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (135,2,1,5,5,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (136,2,2,5,5,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (137,2,3,5,5,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (138,2,4,5,5,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (139,2,3,4,5,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (140,3,1,5,5,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (141,3,2,5,5,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (142,3,3,5,5,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (143,3,4,5,5,0,0,'WorkflowTransition',NULL,NULL);
INSERT INTO `workflows` VALUES (144,3,3,4,5,0,0,'WorkflowTransition',NULL,NULL);
/*!40000 ALTER TABLE `workflows` ENABLE KEYS */;
UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
