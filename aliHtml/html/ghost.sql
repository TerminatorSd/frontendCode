/*
 Navicat Premium Data Transfer

 Source Server         : macSql
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : ghost

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 04/07/2018 19:18:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accesstokens
-- ----------------------------
DROP TABLE IF EXISTS `accesstokens`;
CREATE TABLE `accesstokens` (
  `id` varchar(24) NOT NULL,
  `token` varchar(191) NOT NULL,
  `user_id` varchar(24) NOT NULL,
  `client_id` varchar(24) NOT NULL,
  `issued_by` varchar(24) DEFAULT NULL,
  `expires` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accesstokens_token_unique` (`token`),
  KEY `accesstokens_user_id_foreign` (`user_id`),
  KEY `accesstokens_client_id_foreign` (`client_id`),
  CONSTRAINT `accesstokens_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `accesstokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of accesstokens
-- ----------------------------
BEGIN;
INSERT INTO `accesstokens` VALUES ('5b24a70ee559f926ca13e23f', 'oP8Eis1RInPAWdXqFRIHhJCAKVPVAs2ihoZbZ5guaYjAIg8dGY5GANgUad3WxBreDaU2waDyW5qvncPV0YY7BRzqliDuV718mtC4Iy0qGsv07du7tQaoeQ8plf0AYxP86XDl2oCxESVDyOGZaW6jLykitb1tfwCn8NH1HDL9jwiNgdryPJ1j6wbsRRLeKou', '1', '5b23b28fd932101eaa669304', '5b24a70ee559f926ca13e23e', 1531756718383);
INSERT INTO `accesstokens` VALUES ('5b3b5d348facc40c13169de0', 'i4AGiEDjLxR40XYru2UgR2izFX6KnIElbHxVOG3jLzNr504Qb5IWqkzh2qNtQKiASgym2PqF7VIcer80RryHRTXRTRtyPcDqq5VxLrmierDu7O8k84zV305e7AuqrOIAHfZV8C6jm1bqBryb6Ofx9Bgn1teDKNbRZ1De2N7Wu6mmtHuBSOiSgi4oUedOALd', '1', '5b23b28fd932101eaa669304', '5b24ac694e8adf50af795b08', 1530682708523);
INSERT INTO `accesstokens` VALUES ('5b3c5c28fef595188b88e299', 'K1uaL7xEGHV6POKeBHvPdBTptsW5DPQNg4F9dxyOIUrytnpQRBfErarqBb7bi8Gb1isrAIUUSml4SznnSoVUPeHGNzlEcvjWA90bqLNy2t1ACDAYm2I3fepGba5BVkKSXVWhulLECDamkXcb5Ax1StX9wsZs7GnOBetmkQW3yNl7cbRV85TcA8h1RphaXOA', '1', '5b23b28fd932101eaa669304', '5b24ac694e8adf50af795b08', 1530701123821);
INSERT INTO `accesstokens` VALUES ('5b3ca417fef595188b88e29a', 'w0DOcJ8HeBBMmrhvp27UDyMwxD6oJ1SBRJnP8WrXyqq8bYEid9MfVvcBRHKgUhw28zSlgNHyPzQi9eNFBlQt1w6oXZ16G4hSvgoZDn2GMP4dDK6WUNtQiFV0ubztSSDAID236XfIamEbeZqgvCKRDKiMM1LgOUSVT39pJa6eDk1U3xMTGkmrcyHZoCL0Bba', '1', '5b23b28fd932101eaa669304', '5b24ac694e8adf50af795b08', 1533328823819);
COMMIT;

-- ----------------------------
-- Table structure for app_fields
-- ----------------------------
DROP TABLE IF EXISTS `app_fields`;
CREATE TABLE `app_fields` (
  `id` varchar(24) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` text,
  `type` varchar(50) NOT NULL DEFAULT 'html',
  `app_id` varchar(24) NOT NULL,
  `relatable_id` varchar(24) NOT NULL,
  `relatable_type` varchar(50) NOT NULL DEFAULT 'posts',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_fields_app_id_foreign` (`app_id`),
  CONSTRAINT `app_fields_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for app_settings
-- ----------------------------
DROP TABLE IF EXISTS `app_settings`;
CREATE TABLE `app_settings` (
  `id` varchar(24) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` text,
  `app_id` varchar(24) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_settings_key_unique` (`key`),
  KEY `app_settings_app_id_foreign` (`app_id`),
  CONSTRAINT `app_settings_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for apps
-- ----------------------------
DROP TABLE IF EXISTS `apps`;
CREATE TABLE `apps` (
  `id` varchar(24) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `version` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'inactive',
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `apps_name_unique` (`name`),
  UNIQUE KEY `apps_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for brute
-- ----------------------------
DROP TABLE IF EXISTS `brute`;
CREATE TABLE `brute` (
  `key` varchar(191) NOT NULL,
  `firstRequest` bigint(20) NOT NULL,
  `lastRequest` bigint(20) NOT NULL,
  `lifetime` bigint(20) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of brute
-- ----------------------------
BEGIN;
INSERT INTO `brute` VALUES ('cRPpHvdy8sfL5UFWTquKywpwNrBuEQ6gQngGed2hJr4=', 1530700823803, 1530700823803, 1530704423805, 1);
COMMIT;

-- ----------------------------
-- Table structure for client_trusted_domains
-- ----------------------------
DROP TABLE IF EXISTS `client_trusted_domains`;
CREATE TABLE `client_trusted_domains` (
  `id` varchar(24) NOT NULL,
  `client_id` varchar(24) NOT NULL,
  `trusted_domain` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_trusted_domains_client_id_foreign` (`client_id`),
  CONSTRAINT `client_trusted_domains_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for clients
-- ----------------------------
DROP TABLE IF EXISTS `clients`;
CREATE TABLE `clients` (
  `id` varchar(24) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `redirection_uri` varchar(2000) DEFAULT NULL,
  `client_uri` varchar(2000) DEFAULT NULL,
  `auth_uri` varchar(2000) DEFAULT NULL,
  `logo` varchar(2000) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'development',
  `type` varchar(50) NOT NULL DEFAULT 'ua',
  `description` varchar(2000) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_name_unique` (`name`),
  UNIQUE KEY `clients_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of clients
-- ----------------------------
BEGIN;
INSERT INTO `clients` VALUES ('5b23b28fd932101eaa669304', '92863221-fb32-4a50-bf04-893819bd7cb4', 'Ghost Admin', 'ghost-admin', 'afc69606a64f', NULL, NULL, NULL, NULL, 'enabled', 'ua', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `clients` VALUES ('5b23b28fd932101eaa669305', 'fd59c094-3e60-4bd8-b351-3999f6ee9b8b', 'Ghost Frontend', 'ghost-frontend', '341ba64ac718', NULL, NULL, NULL, NULL, 'enabled', 'ua', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `clients` VALUES ('5b23b28fd932101eaa669306', '9006eb01-2f1c-47f2-85ff-88962b387504', 'Ghost Scheduler', 'ghost-scheduler', '89d7dc347676', NULL, NULL, NULL, NULL, 'enabled', 'web', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `clients` VALUES ('5b23b28fd932101eaa669307', '02bd6b7a-a185-47d5-b38c-17d2cc677cfc', 'Ghost Backup', 'ghost-backup', 'c2fc854e9e89', NULL, NULL, NULL, NULL, 'enabled', 'web', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
COMMIT;

-- ----------------------------
-- Table structure for invites
-- ----------------------------
DROP TABLE IF EXISTS `invites`;
CREATE TABLE `invites` (
  `id` varchar(24) NOT NULL,
  `role_id` varchar(24) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `token` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `expires` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invites_token_unique` (`token`),
  UNIQUE KEY `invites_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `version` varchar(70) NOT NULL,
  `currentVersion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `migrations_name_version_unique` (`name`,`version`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1, '1-create-tables.js', 'init', '1.24');
INSERT INTO `migrations` VALUES (2, '2-create-fixtures.js', 'init', '1.24');
INSERT INTO `migrations` VALUES (3, '1-post-excerpt.js', '1.3', '1.24');
INSERT INTO `migrations` VALUES (4, '1-codeinjection-post.js', '1.4', '1.24');
INSERT INTO `migrations` VALUES (5, '1-og-twitter-post.js', '1.5', '1.24');
INSERT INTO `migrations` VALUES (6, '1-add-backup-client.js', '1.7', '1.24');
INSERT INTO `migrations` VALUES (7, '1-add-permissions-redirect.js', '1.9', '1.24');
INSERT INTO `migrations` VALUES (8, '1-custom-template-post.js', '1.13', '1.24');
INSERT INTO `migrations` VALUES (9, '2-theme-permissions.js', '1.13', '1.24');
INSERT INTO `migrations` VALUES (10, '1-add-webhooks-table.js', '1.18', '1.24');
INSERT INTO `migrations` VALUES (11, '1-webhook-permissions.js', '1.19', '1.24');
INSERT INTO `migrations` VALUES (12, '1-remove-settings-keys.js', '1.20', '1.24');
INSERT INTO `migrations` VALUES (13, '1-add-contributor-role.js', '1.21', '1.24');
INSERT INTO `migrations` VALUES (14, '1-multiple-authors-DDL.js', '1.22', '1.24');
INSERT INTO `migrations` VALUES (15, '1-multiple-authors-DML.js', '1.22', '1.24');
COMMIT;

-- ----------------------------
-- Table structure for migrations_lock
-- ----------------------------
DROP TABLE IF EXISTS `migrations_lock`;
CREATE TABLE `migrations_lock` (
  `lock_key` varchar(191) NOT NULL,
  `locked` tinyint(1) DEFAULT '0',
  `acquired_at` datetime DEFAULT NULL,
  `released_at` datetime DEFAULT NULL,
  UNIQUE KEY `migrations_lock_lock_key_unique` (`lock_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of migrations_lock
-- ----------------------------
BEGIN;
INSERT INTO `migrations_lock` VALUES ('km01', 0, '2018-06-15 12:35:23', '2018-06-15 12:35:30');
COMMIT;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` varchar(24) NOT NULL,
  `name` varchar(50) NOT NULL,
  `object_type` varchar(50) NOT NULL,
  `action_type` varchar(50) NOT NULL,
  `object_id` varchar(24) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of permissions
-- ----------------------------
BEGIN;
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa66930d', 'Export database', 'db', 'exportContent', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa66930e', 'Import database', 'db', 'importContent', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa66930f', 'Delete all content', 'db', 'deleteAllContent', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669310', 'Send mail', 'mail', 'send', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669311', 'Browse notifications', 'notification', 'browse', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669312', 'Add notifications', 'notification', 'add', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669313', 'Delete notifications', 'notification', 'destroy', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669314', 'Browse posts', 'post', 'browse', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669315', 'Read posts', 'post', 'read', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669316', 'Edit posts', 'post', 'edit', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669317', 'Add posts', 'post', 'add', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669318', 'Delete posts', 'post', 'destroy', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669319', 'Browse settings', 'setting', 'browse', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa66931a', 'Read settings', 'setting', 'read', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa66931b', 'Edit settings', 'setting', 'edit', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa66931c', 'Generate slugs', 'slug', 'generate', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa66931d', 'Browse tags', 'tag', 'browse', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa66931e', 'Read tags', 'tag', 'read', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa66931f', 'Edit tags', 'tag', 'edit', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669320', 'Add tags', 'tag', 'add', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669321', 'Delete tags', 'tag', 'destroy', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669322', 'Browse themes', 'theme', 'browse', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669323', 'Edit themes', 'theme', 'edit', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669324', 'Activate themes', 'theme', 'activate', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669325', 'Upload themes', 'theme', 'add', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669326', 'Download themes', 'theme', 'read', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669327', 'Delete themes', 'theme', 'destroy', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669328', 'Browse users', 'user', 'browse', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669329', 'Read users', 'user', 'read', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa66932a', 'Edit users', 'user', 'edit', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa66932b', 'Add users', 'user', 'add', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa66932c', 'Delete users', 'user', 'destroy', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa66932d', 'Assign a role', 'role', 'assign', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa66932e', 'Browse roles', 'role', 'browse', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa66932f', 'Browse clients', 'client', 'browse', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669330', 'Read clients', 'client', 'read', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669331', 'Edit clients', 'client', 'edit', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669332', 'Add clients', 'client', 'add', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669333', 'Delete clients', 'client', 'destroy', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669334', 'Browse subscribers', 'subscriber', 'browse', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669335', 'Read subscribers', 'subscriber', 'read', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669336', 'Edit subscribers', 'subscriber', 'edit', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669337', 'Add subscribers', 'subscriber', 'add', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669338', 'Delete subscribers', 'subscriber', 'destroy', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669339', 'Browse invites', 'invite', 'browse', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa66933a', 'Read invites', 'invite', 'read', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa66933b', 'Edit invites', 'invite', 'edit', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa66933c', 'Add invites', 'invite', 'add', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa66933d', 'Delete invites', 'invite', 'destroy', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa66933e', 'Download redirects', 'redirect', 'download', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa66933f', 'Upload redirects', 'redirect', 'upload', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669340', 'Add webhooks', 'webhook', 'add', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `permissions` VALUES ('5b23b28fd932101eaa669341', 'Delete webhooks', 'webhook', 'destroy', NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
COMMIT;

-- ----------------------------
-- Table structure for permissions_apps
-- ----------------------------
DROP TABLE IF EXISTS `permissions_apps`;
CREATE TABLE `permissions_apps` (
  `id` varchar(24) NOT NULL,
  `app_id` varchar(24) NOT NULL,
  `permission_id` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for permissions_roles
-- ----------------------------
DROP TABLE IF EXISTS `permissions_roles`;
CREATE TABLE `permissions_roles` (
  `id` varchar(24) NOT NULL,
  `role_id` varchar(24) NOT NULL,
  `permission_id` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of permissions_roles
-- ----------------------------
BEGIN;
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669351', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa66930d');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669352', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa66930e');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669353', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa66930f');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669354', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669310');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669355', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669311');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669356', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669312');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669357', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669313');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669358', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669314');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669359', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669315');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66935a', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669316');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66935b', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669317');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66935c', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669318');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66935d', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669319');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66935e', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa66931a');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66935f', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa66931b');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669360', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa66931c');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669361', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa66931d');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669362', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa66931e');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669363', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa66931f');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669364', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669320');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669365', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669321');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669366', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669322');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669367', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669323');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669368', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669324');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669369', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669325');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66936a', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669326');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66936b', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669327');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66936c', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669328');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66936d', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669329');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66936e', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa66932a');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66936f', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa66932b');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669370', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa66932c');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669371', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa66932d');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669372', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa66932e');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669373', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa66932f');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669374', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669330');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669375', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669331');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669376', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669332');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669377', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669333');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669378', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669334');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669379', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669335');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66937a', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669336');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66937b', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669337');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66937c', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669338');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66937d', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669339');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66937e', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa66933a');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66937f', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa66933b');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669380', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa66933c');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669381', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa66933d');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669382', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa66933e');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669383', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa66933f');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669384', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669340');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669385', '5b23b28fd932101eaa669308', '5b23b28fd932101eaa669341');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669386', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa669314');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669387', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa669315');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669388', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa669316');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669389', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa669317');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66938a', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa669318');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66938b', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa669319');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66938c', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa66931a');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66938d', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa66931c');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66938e', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa66931d');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66938f', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa66931e');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669390', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa66931f');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669391', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa669320');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669392', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa669321');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669393', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa669328');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669394', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa669329');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669395', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa66932a');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669396', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa66932b');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669397', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa66932c');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669398', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa66932d');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa669399', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa66932e');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66939a', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa66932f');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66939b', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa669330');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66939c', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa669331');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66939d', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa669332');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66939e', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa669333');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa66939f', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa669337');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693a0', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa669339');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693a1', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa66933a');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693a2', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa66933b');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693a3', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa66933c');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693a4', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa66933d');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693a5', '5b23b28fd932101eaa669309', '5b23b28fd932101eaa669322');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693a6', '5b23b28fd932101eaa66930a', '5b23b28fd932101eaa669314');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693a7', '5b23b28fd932101eaa66930a', '5b23b28fd932101eaa669315');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693a8', '5b23b28fd932101eaa66930a', '5b23b28fd932101eaa669317');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693a9', '5b23b28fd932101eaa66930a', '5b23b28fd932101eaa669319');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693aa', '5b23b28fd932101eaa66930a', '5b23b28fd932101eaa66931a');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693ab', '5b23b28fd932101eaa66930a', '5b23b28fd932101eaa66931c');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693ac', '5b23b28fd932101eaa66930a', '5b23b28fd932101eaa66931d');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693ad', '5b23b28fd932101eaa66930a', '5b23b28fd932101eaa66931e');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693ae', '5b23b28fd932101eaa66930a', '5b23b28fd932101eaa669320');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693af', '5b23b28fd932101eaa66930a', '5b23b28fd932101eaa669328');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693b0', '5b23b28fd932101eaa66930a', '5b23b28fd932101eaa669329');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693b1', '5b23b28fd932101eaa66930a', '5b23b28fd932101eaa66932e');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693b2', '5b23b28fd932101eaa66930a', '5b23b28fd932101eaa66932f');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693b3', '5b23b28fd932101eaa66930a', '5b23b28fd932101eaa669330');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693b4', '5b23b28fd932101eaa66930a', '5b23b28fd932101eaa669331');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693b5', '5b23b28fd932101eaa66930a', '5b23b28fd932101eaa669332');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693b6', '5b23b28fd932101eaa66930a', '5b23b28fd932101eaa669333');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693b7', '5b23b28fd932101eaa66930a', '5b23b28fd932101eaa669337');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693b8', '5b23b28fd932101eaa66930a', '5b23b28fd932101eaa669322');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693b9', '5b23b28fd932101eaa66930b', '5b23b28fd932101eaa669314');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693ba', '5b23b28fd932101eaa66930b', '5b23b28fd932101eaa669315');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693bb', '5b23b28fd932101eaa66930b', '5b23b28fd932101eaa669317');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693bc', '5b23b28fd932101eaa66930b', '5b23b28fd932101eaa669319');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693bd', '5b23b28fd932101eaa66930b', '5b23b28fd932101eaa66931a');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693be', '5b23b28fd932101eaa66930b', '5b23b28fd932101eaa66931c');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693bf', '5b23b28fd932101eaa66930b', '5b23b28fd932101eaa66931d');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693c0', '5b23b28fd932101eaa66930b', '5b23b28fd932101eaa66931e');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693c1', '5b23b28fd932101eaa66930b', '5b23b28fd932101eaa669328');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693c2', '5b23b28fd932101eaa66930b', '5b23b28fd932101eaa669329');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693c3', '5b23b28fd932101eaa66930b', '5b23b28fd932101eaa66932e');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693c4', '5b23b28fd932101eaa66930b', '5b23b28fd932101eaa66932f');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693c5', '5b23b28fd932101eaa66930b', '5b23b28fd932101eaa669330');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693c6', '5b23b28fd932101eaa66930b', '5b23b28fd932101eaa669331');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693c7', '5b23b28fd932101eaa66930b', '5b23b28fd932101eaa669332');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693c8', '5b23b28fd932101eaa66930b', '5b23b28fd932101eaa669333');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693c9', '5b23b28fd932101eaa66930b', '5b23b28fd932101eaa669337');
INSERT INTO `permissions_roles` VALUES ('5b23b291d932101eaa6693ca', '5b23b28fd932101eaa66930b', '5b23b28fd932101eaa669322');
COMMIT;

-- ----------------------------
-- Table structure for permissions_users
-- ----------------------------
DROP TABLE IF EXISTS `permissions_users`;
CREATE TABLE `permissions_users` (
  `id` varchar(24) NOT NULL,
  `user_id` varchar(24) NOT NULL,
  `permission_id` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` varchar(24) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `title` varchar(2000) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `mobiledoc` longtext,
  `html` longtext,
  `amp` longtext,
  `plaintext` longtext,
  `feature_image` varchar(2000) DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `page` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(50) NOT NULL DEFAULT 'draft',
  `locale` varchar(6) DEFAULT NULL,
  `visibility` varchar(50) NOT NULL DEFAULT 'public',
  `meta_title` varchar(2000) DEFAULT NULL,
  `meta_description` varchar(2000) DEFAULT NULL,
  `author_id` varchar(24) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `published_by` varchar(24) DEFAULT NULL,
  `custom_excerpt` varchar(2000) DEFAULT NULL,
  `codeinjection_head` text,
  `codeinjection_foot` text,
  `og_image` varchar(2000) DEFAULT NULL,
  `og_title` varchar(300) DEFAULT NULL,
  `og_description` varchar(500) DEFAULT NULL,
  `twitter_image` varchar(2000) DEFAULT NULL,
  `twitter_title` varchar(300) DEFAULT NULL,
  `twitter_description` varchar(500) DEFAULT NULL,
  `custom_template` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of posts
-- ----------------------------
BEGIN;
INSERT INTO `posts` VALUES ('5b24a790e559f926ca13e241', '60759c29-54fe-4d41-8f5e-be5ef789331b', '佛山行', 'fo-shan-xing', '{\"version\":\"0.3.1\",\"markups\":[],\"atoms\":[],\"cards\":[[\"card-markdown\",{\"cardName\":\"card-markdown\",\"markdown\":\"2018 年第一天，孤身一人游佛山。\\n\\n为什么要去佛山，大概是受到“佛山无影脚”和黄飞鸿的影响，影视和文学对人的影响由此可见一斑。\\n\\n走在南风古灶狭窄的小道上，两边是灰砖砌成的高墙，远处的高楼依然可见。我在想，是什么让我觉得城市和这里的风格迥异，单单是因为这里的砖墙、小路、斗拱和其他不知名的材料吗？直觉告诉我并不是，但是一时半会又想不到其他原因。再往前走几步，灵光一闪，是路！城市的路占了大部分的面积，所以才成为了城市。\\n\\n在神榕旁的一家陶笛店里看到一件很漂亮的陶笛，蜗牛壳般的圆形和简单的花纹，有点喜欢。但是看了一下价格，要七十多块，略一衡量，还是转身离去，惋惜在所难免。\\n\\n可能是因为受到诚健之前所说的台湾骑行计划的影响，我也想尝试在不同的城市街头骑行，尤其是在如今共享单车之风盛行的情况下。所以从祖庙到良缘到南风古灶再回到祖庙，一路我都是骑过去的。尽管骑了也有十几公里，可惜我不太知道该怎么品味一座城市的底蕴和文化。\\n\\n祖庙里面有座庙。一踏进庙门，就能闻到厚重的燃香味，似乎是存在了好久好久。身旁是虔诚祈祷的游客和好奇张望着四周的人群。一束光从门栏上方照进来，透过丁达尔效应展示出它的存在，真的有寺庙中香火缭绕的感觉。\\n\\n出了那座庙就是锦香池了，锦香池里除了一座玄武石雕外，还生活着大量的乌龟。有的在水里游来游去，有的爬到木架上晒太阳。还有一只体型明显偏大，大概活了很多年的老龟，独自躲在角落里，一动不动，似乎对这种被很多人围观的场景早已习以为常。至于水中散落的大量小额纸币和硬币，不知是否为当时的游客带来了些许幸运呢？\\n\\n......\\n\\n一个人出游，有些时候难免有些不便，但更多的时候却能获得跟自己对话的机会。一个人，慢慢地游一座城。我觉得，挺好。\"}]],\"sections\":[[10,0]]}', '<div class=\"kg-card-markdown\"><p>2018 年第一天，孤身一人游佛山。</p>\n<p>为什么要去佛山，大概是受到“佛山无影脚”和黄飞鸿的影响，影视和文学对人的影响由此可见一斑。</p>\n<p>走在南风古灶狭窄的小道上，两边是灰砖砌成的高墙，远处的高楼依然可见。我在想，是什么让我觉得城市和这里的风格迥异，单单是因为这里的砖墙、小路、斗拱和其他不知名的材料吗？直觉告诉我并不是，但是一时半会又想不到其他原因。再往前走几步，灵光一闪，是路！城市的路占了大部分的面积，所以才成为了城市。</p>\n<p>在神榕旁的一家陶笛店里看到一件很漂亮的陶笛，蜗牛壳般的圆形和简单的花纹，有点喜欢。但是看了一下价格，要七十多块，略一衡量，还是转身离去，惋惜在所难免。</p>\n<p>可能是因为受到诚健之前所说的台湾骑行计划的影响，我也想尝试在不同的城市街头骑行，尤其是在如今共享单车之风盛行的情况下。所以从祖庙到良缘到南风古灶再回到祖庙，一路我都是骑过去的。尽管骑了也有十几公里，可惜我不太知道该怎么品味一座城市的底蕴和文化。</p>\n<p>祖庙里面有座庙。一踏进庙门，就能闻到厚重的燃香味，似乎是存在了好久好久。身旁是虔诚祈祷的游客和好奇张望着四周的人群。一束光从门栏上方照进来，透过丁达尔效应展示出它的存在，真的有寺庙中香火缭绕的感觉。</p>\n<p>出了那座庙就是锦香池了，锦香池里除了一座玄武石雕外，还生活着大量的乌龟。有的在水里游来游去，有的爬到木架上晒太阳。还有一只体型明显偏大，大概活了很多年的老龟，独自躲在角落里，一动不动，似乎对这种被很多人围观的场景早已习以为常。至于水中散落的大量小额纸币和硬币，不知是否为当时的游客带来了些许幸运呢？</p>\n<p>......</p>\n<p>一个人出游，有些时候难免有些不便，但更多的时候却能获得跟自己对话的机会。一个人，慢慢地游一座城。我觉得，挺好。</p>\n</div>', NULL, '2018 年第一天，孤身一人游佛山。\n\n为什么要去佛山，大概是受到“佛山无影脚”和黄飞鸿的影响，影视和文学对人的影响由此可见一斑。\n\n走在南风古灶狭窄的小道上，两边是灰砖砌成的高墙，远处的高楼依然可见。我在想，是什么让我觉得城市和这里的风格迥异，单单是因为这里的砖墙、小路、斗拱和其他不知名的材料吗？直觉告诉我并不是，但是一时半会又想不到其他原因。再往前走几步，灵光一闪，是路！城市的路占了大部分的面积，所以才成为了城市。\n\n在神榕旁的一家陶笛店里看到一件很漂亮的陶笛，蜗牛壳般的圆形和简单的花纹，有点喜欢。但是看了一下价格，要七十多块，略一衡量，还是转身离去，惋惜在所难免。\n\n可能是因为受到诚健之前所说的台湾骑行计划的影响，我也想尝试在不同的城市街头骑行，尤其是在如今共享单车之风盛行的情况下。所以从祖庙到良缘到南风古灶再回到祖庙，一路我都是骑过去的。尽管骑了也有十几公里，可惜我不太知道该怎么品味一座城市的底蕴和文化。\n\n祖庙里面有座庙。一踏进庙门，就能闻到厚重的燃香味，似乎是存在了好久好久。身旁是虔诚祈祷的游客和好奇张望着四周的人群。一束光从门栏上方照进来，透过丁达尔效应展示出它的存在，真的有寺庙中香火缭绕的感觉。\n\n出了那座庙就是锦香池了，锦香池里除了一座玄武石雕外，还生活着大量的乌龟。有的在水里游来游去，有的爬到木架上晒太阳。还有一只体型明显偏大，大概活了很多年的老龟，独自躲在角落里，一动不动，似乎对这种被很多人围观的场景早已习以为常。至于水中散落的大量小额纸币和硬币，不知是否为当时的游客带来了些许幸运呢？\n\n......\n\n一个人出游，有些时候难免有些不便，但更多的时候却能获得跟自己对话的机会。一个人，慢慢地游一座城。我觉得，挺好。', '/content/images/2018/06/WechatIMG128-1.jpeg', 0, 0, 'published', NULL, 'public', NULL, NULL, '1', '2018-01-01 06:00:48', '1', '2018-01-01 06:07:27', '1', '2018-01-01 06:00:59', '1', NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `posts` VALUES ('5b24a935e559f926ca13e245', '1feddf84-b2e6-432e-8e52-691588c99860', '小程序：配置Https服务器（Nginx）', 'xiao-cheng-xu-pei-zhi-httpsfu-wu-qi-nginx', '{\"version\":\"0.3.1\",\"markups\":[],\"atoms\":[],\"cards\":[[\"card-markdown\",{\"cardName\":\"card-markdown\",\"markdown\":\"小程序与普通移动端开发的一个很大的不同之处就在于小程序的ajax 请求是使用https 协议与服务器端进行通信的。所以要开发小程序，首先要搭建https 服务器。这篇文章记录了在nginx 做转发的服务器中如何一步步完成https 配置。\\n\\n#### 1. http 和https\\n\\n在开始行动之前，我们必须先搞清一个问题，http 和https 的区别是什么？要配置https 需要执行哪些步骤的操作？关于http 和https 网上也是有大量的文章来讨论，也是面试时非常常见的一个问题，所以这里就不细讲。简单来说，https 相对于http 的区别就在于https 是使用密文传输，而http 是使用明文传输的，这也是https 比http 更安全的原因。\\n\\n既然是密文传输，那么是用什么进行加密的？加密操作是由服务器主导的，那我们又凭什么相信服务器不是由坏人冒充的？这就是https 要解决的事情。具体细节可参考: https 原理详解\\n\\n看完以上加密细节操作可以得出一个阶段性的结论，要完成https 的配置实际上就是在服务器上安装一个由CA（公信机构）颁发的证书和一对非对称秘钥（包含公钥和私钥）。于是在小程序应用中完成https 的配置流程可以概括为以下几步：获取证书、在服务器上安装证书、小程序后台添加合法域名。\\n\\n#### 2. 开始行动\\n\\n**2.1 获取证书**\\n一般服务器提供商（比如说阿里云）都会提供证书服务，但是通常是需要花钱购买的。而通过FreeSSL 我们可以获得免费的证书，具体操作流程如下：\\n+ 注册并登录：https://freessl.org\\n![2018052310581395](/content/images/2018/06/2018052310581395.png)\\n+ 输入你的域名（域名需要已经备案，具体怎么备案可以去服务器提供商管理平台查看），点击创建证书，会获得以下结果：\\n![2018052311000663](/content/images/2018/06/2018052311000663.png)\\n+ 登录域名管理网站（我的是阿里云），选择域名与网站 -> 云解析DNS -> 添加解析，并将上图中的信息填写到相应的位置，然后点击确认。\\n![20180523110320304](/content/images/2018/06/20180523110320304.png)\\n\\n几分钟后，在FreeSSL 页面中点击验证，验证通过后可以下载证书，下载下来的证书中包含了CA 证书和对称秘钥（私钥只会在第一次被下载下来，所以要做好备份！）\\n\\n**2.2 服务器安装证书**\\n获取到证书以后，我们再来到服务器上进行安装，所谓的安装实际上就是将上一步中下载下来的证书（包含两个文件，一个是.pem，一个是.key，.pem 中包含两个证书）放在服务器上的某一个位置，然后修改nginx 配置文件使之以https 协议与客户端进行通信。\\n\\n证书文件放置位置可以选择：/etc/nginx/certs，没有这个位置的话可以新建。\\n\\nnginx 配置文件主要修改如下（如果没有自行修改的话，nginx 配置文件位置为 /usr/local/nginx/conf/nginx.conf）：\\n```\\nserver {  \\n    listen 80;  \\n    # about ssl  \\n    listen 443 ssl;  \\n    ssl_certificate /etc/nginx/certs/full_chain.pem;  \\n    ssl_certificate_key /etc/nginx/certs/private.key;  \\n    ssl_session_timeout 5m;  \\n    ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE:ECDH:AES:HIGH:!NULL:!aNULL:!MD5:!ADH:!RC4;  \\n    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;  \\n    ssl_prefer_server_ciphers on;  \\n \\n    # server name \\n    server_name  xxx.xxx.xxx;  \\n  \\n    location / {  \\n        proxy_pass http://127.0.0.1:3000;  \\n    }  \\n}  \\n```\\n**2.3 小程序后台配置合法域名**\\n\\n登录小程序后台，点击设置 -> 开发设置，添加你自己的域名为合法域名即可。\\n\\n这里要注意的一个问题是，微信公众平台和小程序后台是不能绑定一个邮箱的，所以两个平台如果都有账号的话不要记混了。\\n\\n#### 3. 可能遇到的问题\\n\\n*3.1 问题一：the \\\"ssl\\\" parameter requires ngxhttpsslmodule in /usr/local/nginx/conf/ng...*\\n解决办法：参考 https://www.cnblogs.com/ghjbk/p/6744131.html 安装ssl_module 即可\\n\\n*3.2 问题二：\\\"/usr/local/nginx/logs/nginx.pid\\\" failed (2: No such file or directory)*\\n解决办法：\\n```\\n// 使用nginx -c的参数指定nginx.conf文件的位置  \\n/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf  \\n```\\n\\n*3.3 问题三：配置完成后无法通过https 访问页面，并且在nginx access log 中接收不到访问记录*\\n解决办法：记得阿里云开放443 端口！\"}]],\"sections\":[[10,0]]}', '<div class=\"kg-card-markdown\"><p>小程序与普通移动端开发的一个很大的不同之处就在于小程序的ajax 请求是使用https 协议与服务器端进行通信的。所以要开发小程序，首先要搭建https 服务器。这篇文章记录了在nginx 做转发的服务器中如何一步步完成https 配置。</p>\n<h4 id=\"1httphttps\">1. http 和https</h4>\n<p>在开始行动之前，我们必须先搞清一个问题，http 和https 的区别是什么？要配置https 需要执行哪些步骤的操作？关于http 和https 网上也是有大量的文章来讨论，也是面试时非常常见的一个问题，所以这里就不细讲。简单来说，https 相对于http 的区别就在于https 是使用密文传输，而http 是使用明文传输的，这也是https 比http 更安全的原因。</p>\n<p>既然是密文传输，那么是用什么进行加密的？加密操作是由服务器主导的，那我们又凭什么相信服务器不是由坏人冒充的？这就是https 要解决的事情。具体细节可参考: https 原理详解</p>\n<p>看完以上加密细节操作可以得出一个阶段性的结论，要完成https 的配置实际上就是在服务器上安装一个由CA（公信机构）颁发的证书和一对非对称秘钥（包含公钥和私钥）。于是在小程序应用中完成https 的配置流程可以概括为以下几步：获取证书、在服务器上安装证书、小程序后台添加合法域名。</p>\n<h4 id=\"2\">2. 开始行动</h4>\n<p><strong>2.1 获取证书</strong><br>\n一般服务器提供商（比如说阿里云）都会提供证书服务，但是通常是需要花钱购买的。而通过FreeSSL 我们可以获得免费的证书，具体操作流程如下：</p>\n<ul>\n<li>注册并登录：<a href=\"https://freessl.org\">https://freessl.org</a><br>\n<img src=\"/content/images/2018/06/2018052310581395.png\" alt=\"2018052310581395\"></li>\n<li>输入你的域名（域名需要已经备案，具体怎么备案可以去服务器提供商管理平台查看），点击创建证书，会获得以下结果：<br>\n<img src=\"/content/images/2018/06/2018052311000663.png\" alt=\"2018052311000663\"></li>\n<li>登录域名管理网站（我的是阿里云），选择域名与网站 -&gt; 云解析DNS -&gt; 添加解析，并将上图中的信息填写到相应的位置，然后点击确认。<br>\n<img src=\"/content/images/2018/06/20180523110320304.png\" alt=\"20180523110320304\"></li>\n</ul>\n<p>几分钟后，在FreeSSL 页面中点击验证，验证通过后可以下载证书，下载下来的证书中包含了CA 证书和对称秘钥（私钥只会在第一次被下载下来，所以要做好备份！）</p>\n<p><strong>2.2 服务器安装证书</strong><br>\n获取到证书以后，我们再来到服务器上进行安装，所谓的安装实际上就是将上一步中下载下来的证书（包含两个文件，一个是.pem，一个是.key，.pem 中包含两个证书）放在服务器上的某一个位置，然后修改nginx 配置文件使之以https 协议与客户端进行通信。</p>\n<p>证书文件放置位置可以选择：/etc/nginx/certs，没有这个位置的话可以新建。</p>\n<p>nginx 配置文件主要修改如下（如果没有自行修改的话，nginx 配置文件位置为 /usr/local/nginx/conf/nginx.conf）：</p>\n<pre><code>server {  \n    listen 80;  \n    # about ssl  \n    listen 443 ssl;  \n    ssl_certificate /etc/nginx/certs/full_chain.pem;  \n    ssl_certificate_key /etc/nginx/certs/private.key;  \n    ssl_session_timeout 5m;  \n    ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE:ECDH:AES:HIGH:!NULL:!aNULL:!MD5:!ADH:!RC4;  \n    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;  \n    ssl_prefer_server_ciphers on;  \n \n    # server name \n    server_name  xxx.xxx.xxx;  \n  \n    location / {  \n        proxy_pass http://127.0.0.1:3000;  \n    }  \n}  \n</code></pre>\n<p><strong>2.3 小程序后台配置合法域名</strong></p>\n<p>登录小程序后台，点击设置 -&gt; 开发设置，添加你自己的域名为合法域名即可。</p>\n<p>这里要注意的一个问题是，微信公众平台和小程序后台是不能绑定一个邮箱的，所以两个平台如果都有账号的话不要记混了。</p>\n<h4 id=\"3\">3. 可能遇到的问题</h4>\n<p><em>3.1 问题一：the &quot;ssl&quot; parameter requires ngxhttpsslmodule in /usr/local/nginx/conf/ng...</em><br>\n解决办法：参考 <a href=\"https://www.cnblogs.com/ghjbk/p/6744131.html\">https://www.cnblogs.com/ghjbk/p/6744131.html</a> 安装ssl_module 即可</p>\n<p><em>3.2 问题二：&quot;/usr/local/nginx/logs/nginx.pid&quot; failed (2: No such file or directory)</em><br>\n解决办法：</p>\n<pre><code>// 使用nginx -c的参数指定nginx.conf文件的位置  \n/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf  \n</code></pre>\n<p><em>3.3 问题三：配置完成后无法通过https 访问页面，并且在nginx access log 中接收不到访问记录</em><br>\n解决办法：记得阿里云开放443 端口！</p>\n</div>', NULL, '小程序与普通移动端开发的一个很大的不同之处就在于小程序的ajax 请求是使用https 协议与服务器端进行通信的。所以要开发小程序，首先要搭建https\n服务器。这篇文章记录了在nginx 做转发的服务器中如何一步步完成https 配置。\n\n1. http 和https\n在开始行动之前，我们必须先搞清一个问题，http 和https 的区别是什么？要配置https 需要执行哪些步骤的操作？关于http 和https\n网上也是有大量的文章来讨论，也是面试时非常常见的一个问题，所以这里就不细讲。简单来说，https 相对于http 的区别就在于https\n是使用密文传输，而http 是使用明文传输的，这也是https 比http 更安全的原因。\n\n既然是密文传输，那么是用什么进行加密的？加密操作是由服务器主导的，那我们又凭什么相信服务器不是由坏人冒充的？这就是https 要解决的事情。具体细节可参考:\nhttps 原理详解\n\n看完以上加密细节操作可以得出一个阶段性的结论，要完成https\n的配置实际上就是在服务器上安装一个由CA（公信机构）颁发的证书和一对非对称秘钥（包含公钥和私钥）。于是在小程序应用中完成https\n的配置流程可以概括为以下几步：获取证书、在服务器上安装证书、小程序后台添加合法域名。\n\n2. 开始行动\n2.1 获取证书\n一般服务器提供商（比如说阿里云）都会提供证书服务，但是通常是需要花钱购买的。而通过FreeSSL 我们可以获得免费的证书，具体操作流程如下：\n\n * 注册并登录：https://freessl.org\n   \n * 输入你的域名（域名需要已经备案，具体怎么备案可以去服务器提供商管理平台查看），点击创建证书，会获得以下结果：\n   \n * 登录域名管理网站（我的是阿里云），选择域名与网站 -> 云解析DNS -> 添加解析，并将上图中的信息填写到相应的位置，然后点击确认。\n   \n\n几分钟后，在FreeSSL 页面中点击验证，验证通过后可以下载证书，下载下来的证书中包含了CA 证书和对称秘钥（私钥只会在第一次被下载下来，所以要做好备份！）\n\n2.2 服务器安装证书\n获取到证书以后，我们再来到服务器上进行安装，所谓的安装实际上就是将上一步中下载下来的证书（包含两个文件，一个是.pem，一个是.key，.pem\n中包含两个证书）放在服务器上的某一个位置，然后修改nginx 配置文件使之以https 协议与客户端进行通信。\n\n证书文件放置位置可以选择：/etc/nginx/certs，没有这个位置的话可以新建。\n\nnginx 配置文件主要修改如下（如果没有自行修改的话，nginx 配置文件位置为 /usr/local/nginx/conf/nginx.conf）：\n\nserver {  \n    listen 80;  \n    # about ssl  \n    listen 443 ssl;  \n    ssl_certificate /etc/nginx/certs/full_chain.pem;  \n    ssl_certificate_key /etc/nginx/certs/private.key;  \n    ssl_session_timeout 5m;  \n    ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE:ECDH:AES:HIGH:!NULL:!aNULL:!MD5:!ADH:!RC4;  \n    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;  \n    ssl_prefer_server_ciphers on;  \n \n    # server name \n    server_name  xxx.xxx.xxx;  \n  \n    location / {  \n        proxy_pass http://127.0.0.1:3000;  \n    }  \n}  \n\n\n2.3 小程序后台配置合法域名\n\n登录小程序后台，点击设置 -> 开发设置，添加你自己的域名为合法域名即可。\n\n这里要注意的一个问题是，微信公众平台和小程序后台是不能绑定一个邮箱的，所以两个平台如果都有账号的话不要记混了。\n\n3. 可能遇到的问题\n3.1 问题一：the \"ssl\" parameter requires ngxhttpsslmodule in\n/usr/local/nginx/conf/ng...\n解决办法：参考 https://www.cnblogs.com/ghjbk/p/6744131.html  安装ssl_module 即可\n\n3.2 问题二：\"/usr/local/nginx/logs/nginx.pid\" failed (2: No such file or directory)\n解决办法：\n\n// 使用nginx -c的参数指定nginx.conf文件的位置  \n/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf  \n\n\n3.3 问题三：配置完成后无法通过https 访问页面，并且在nginx access log 中接收不到访问记录\n解决办法：记得阿里云开放443 端口！', '/content/images/2018/06/u-1659927319-191769622-fm-27-gp-0-1.jpg', 0, 0, 'published', NULL, 'public', NULL, NULL, '1', '2018-05-23 06:07:49', '1', '2018-07-01 15:15:49', '1', '2018-05-23 06:08:28', '1', NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `posts` VALUES ('5b24a967e559f926ca13e247', '076a4183-8be0-4682-b98f-1770d10863af', '把事情做好的三条边', 'ba-shi-qing-zuo-hao-de-san-tiao-bian', '{\"version\":\"0.3.1\",\"markups\":[],\"atoms\":[],\"cards\":[[\"card-markdown\",{\"cardName\":\"card-markdown\",\"markdown\":\"最初接触到这个概念是在《得到》中的吴军老师的谷歌方法论系列音频里。听到这个理论的时候其实对我的影响颇大，也算是这么多年来我第一次听到的可以说是对于“为什么要读书”这个问题的正面回答。\\n\\n#### 1. 吴军老师的理论\\n\\n首先来复述一下吴军老师的观点，他认为做好一件事情的基础有三条边。我们可以把这三条边想象成一个“Z”字。\\n\\n“Z”字的底边代表着每个人的基线，我们所做的一切努力，所取得的一起回报都是基于这个基线的。在音频里听吴军老师讲解完基线之后，我突然就想到了“为什么要读书”这个问题，为什么要读大学，为什么要读研究生？其实回顾自己的求学经历，我们可以看到，随着我们从小学转到初中，再到高中，到大学，到研究生，我们身边会有越来越多更优秀的人出现，我们所处环境横向和纵向的维度都被拉伸了。人际关系学中有一个非常重要的理论，“150法则”。即人的精力是有限的，我们最多只能维持150个经常往来的人际关系，而我们日常的生活和行为习惯都会或多或少地受这150个人的影响，于是这150个人的共同作用就产生了这里我们所讲的基线。\\n\\n“Z”字的斜边代表我们做事情的方法，和我们所使用的工具。人与动物最大的区别就是人可以制造并使用工具，所以如果能有效地利用工具可以极大地提高生活和工作中的效率，而方法更是一个不可忽视的存在。记得之前看到过一篇文章叫做《你95%的勤奋，都在浪费时间》，文中非常强调的一个观点是人与人之间的差异主要在于“思维方式的”的不同。在我看来，方法就是“思维方式”的外化于形。\\n\\n而“Z”字的顶边代表着我们所能达到的极限，极限并不是一个固定的存在，我们可以通过提升基线和效率来提升所能达到的极限。\\n\\n#### 2. 腾讯的T4大佬\\n\\n最近公司来了一个新的技术人员，相比于技术而言，他的个人魅力更值得说道一番。他是一个执行力很强的人，而且做事十分讲究方法。一次聊天中，他将曾经共事过的腾讯T4大佬传授给他的经验传授给我。于是我心中对于“把事情做好的三条边”这个概念又有了一个新的定义，在这里也跟大家分享一下。\\n\\n第一条边：给自己一个明确的定义。是否一心想做技术，还是说想从技术转产品、设计或者管理？毕竟在这个时代，做一个“纯”的技术人员并不是长久之计。以web开发为例，如果不是在单一领域起步很早或是技术很牛，那么可以考虑一下同时培养前端与后端的能力，养成“全栈思维”，从更高的角度来看一件事情。当然这里的全栈思维不光可以包括开发中的前端与后端，甚至可以包括产品、设计、市场、运营等。这大概是从技术转管理的必经之路。\\n\\n第二条边：学会做计划。计划是提高效率最直接的一种方式，而且计划的粒度要合适，保证可以精确到天，精确到人，那样才会经常性地得到反馈，不断改进自己的工作方向。简单一点可以使用一个Excel表格做一个阶段性计划，精细一点，可以使用teambition等在线管理工具制定日计划甚至小时计划。\\n\\n第三条边：学会总结。不论是学习，还是工作，乃至是生活。有计划，有总结。才能形成一种良性循环，持续提高办事效率。计划告诉我们需要做哪些事情，而总结可以告诉我们不需要再做哪些事情。就技术而言，我们可以将踩过的每一次坑记录下来，一方面可以方便日后查阅，另一方面可以让后来人绕“道”而行。\"}]],\"sections\":[[10,0]]}', '<div class=\"kg-card-markdown\"><p>最初接触到这个概念是在《得到》中的吴军老师的谷歌方法论系列音频里。听到这个理论的时候其实对我的影响颇大，也算是这么多年来我第一次听到的可以说是对于“为什么要读书”这个问题的正面回答。</p>\n<h4 id=\"1\">1. 吴军老师的理论</h4>\n<p>首先来复述一下吴军老师的观点，他认为做好一件事情的基础有三条边。我们可以把这三条边想象成一个“Z”字。</p>\n<p>“Z”字的底边代表着每个人的基线，我们所做的一切努力，所取得的一起回报都是基于这个基线的。在音频里听吴军老师讲解完基线之后，我突然就想到了“为什么要读书”这个问题，为什么要读大学，为什么要读研究生？其实回顾自己的求学经历，我们可以看到，随着我们从小学转到初中，再到高中，到大学，到研究生，我们身边会有越来越多更优秀的人出现，我们所处环境横向和纵向的维度都被拉伸了。人际关系学中有一个非常重要的理论，“150法则”。即人的精力是有限的，我们最多只能维持150个经常往来的人际关系，而我们日常的生活和行为习惯都会或多或少地受这150个人的影响，于是这150个人的共同作用就产生了这里我们所讲的基线。</p>\n<p>“Z”字的斜边代表我们做事情的方法，和我们所使用的工具。人与动物最大的区别就是人可以制造并使用工具，所以如果能有效地利用工具可以极大地提高生活和工作中的效率，而方法更是一个不可忽视的存在。记得之前看到过一篇文章叫做《你95%的勤奋，都在浪费时间》，文中非常强调的一个观点是人与人之间的差异主要在于“思维方式的”的不同。在我看来，方法就是“思维方式”的外化于形。</p>\n<p>而“Z”字的顶边代表着我们所能达到的极限，极限并不是一个固定的存在，我们可以通过提升基线和效率来提升所能达到的极限。</p>\n<h4 id=\"2t4\">2. 腾讯的T4大佬</h4>\n<p>最近公司来了一个新的技术人员，相比于技术而言，他的个人魅力更值得说道一番。他是一个执行力很强的人，而且做事十分讲究方法。一次聊天中，他将曾经共事过的腾讯T4大佬传授给他的经验传授给我。于是我心中对于“把事情做好的三条边”这个概念又有了一个新的定义，在这里也跟大家分享一下。</p>\n<p>第一条边：给自己一个明确的定义。是否一心想做技术，还是说想从技术转产品、设计或者管理？毕竟在这个时代，做一个“纯”的技术人员并不是长久之计。以web开发为例，如果不是在单一领域起步很早或是技术很牛，那么可以考虑一下同时培养前端与后端的能力，养成“全栈思维”，从更高的角度来看一件事情。当然这里的全栈思维不光可以包括开发中的前端与后端，甚至可以包括产品、设计、市场、运营等。这大概是从技术转管理的必经之路。</p>\n<p>第二条边：学会做计划。计划是提高效率最直接的一种方式，而且计划的粒度要合适，保证可以精确到天，精确到人，那样才会经常性地得到反馈，不断改进自己的工作方向。简单一点可以使用一个Excel表格做一个阶段性计划，精细一点，可以使用teambition等在线管理工具制定日计划甚至小时计划。</p>\n<p>第三条边：学会总结。不论是学习，还是工作，乃至是生活。有计划，有总结。才能形成一种良性循环，持续提高办事效率。计划告诉我们需要做哪些事情，而总结可以告诉我们不需要再做哪些事情。就技术而言，我们可以将踩过的每一次坑记录下来，一方面可以方便日后查阅，另一方面可以让后来人绕“道”而行。</p>\n</div>', NULL, '最初接触到这个概念是在《得到》中的吴军老师的谷歌方法论系列音频里。听到这个理论的时候其实对我的影响颇大，也算是这么多年来我第一次听到的可以说是对于“为什么要读书”这个问题的正面回答。\n\n1. 吴军老师的理论\n首先来复述一下吴军老师的观点，他认为做好一件事情的基础有三条边。我们可以把这三条边想象成一个“Z”字。\n\n“Z”字的底边代表着每个人的基线，我们所做的一切努力，所取得的一起回报都是基于这个基线的。在音频里听吴军老师讲解完基线之后，我突然就想到了“为什么要读书”这个问题，为什么要读大学，为什么要读研究生？其实回顾自己的求学经历，我们可以看到，随着我们从小学转到初中，再到高中，到大学，到研究生，我们身边会有越来越多更优秀的人出现，我们所处环境横向和纵向的维度都被拉伸了。人际关系学中有一个非常重要的理论，“150法则”。即人的精力是有限的，我们最多只能维持150个经常往来的人际关系，而我们日常的生活和行为习惯都会或多或少地受这150个人的影响，于是这150个人的共同作用就产生了这里我们所讲的基线。\n\n“Z”字的斜边代表我们做事情的方法，和我们所使用的工具。人与动物最大的区别就是人可以制造并使用工具，所以如果能有效地利用工具可以极大地提高生活和工作中的效率，而方法更是一个不可忽视的存在。记得之前看到过一篇文章叫做《你95%的勤奋，都在浪费时间》，文中非常强调的一个观点是人与人之间的差异主要在于“思维方式的”的不同。在我看来，方法就是“思维方式”的外化于形。\n\n而“Z”字的顶边代表着我们所能达到的极限，极限并不是一个固定的存在，我们可以通过提升基线和效率来提升所能达到的极限。\n\n2. 腾讯的T4大佬\n最近公司来了一个新的技术人员，相比于技术而言，他的个人魅力更值得说道一番。他是一个执行力很强的人，而且做事十分讲究方法。一次聊天中，他将曾经共事过的腾讯T4大佬传授给他的经验传授给我。于是我心中对于“把事情做好的三条边”这个概念又有了一个新的定义，在这里也跟大家分享一下。\n\n第一条边：给自己一个明确的定义。是否一心想做技术，还是说想从技术转产品、设计或者管理？毕竟在这个时代，做一个“纯”的技术人员并不是长久之计。以web开发为例，如果不是在单一领域起步很早或是技术很牛，那么可以考虑一下同时培养前端与后端的能力，养成“全栈思维”，从更高的角度来看一件事情。当然这里的全栈思维不光可以包括开发中的前端与后端，甚至可以包括产品、设计、市场、运营等。这大概是从技术转管理的必经之路。\n\n第二条边：学会做计划。计划是提高效率最直接的一种方式，而且计划的粒度要合适，保证可以精确到天，精确到人，那样才会经常性地得到反馈，不断改进自己的工作方向。简单一点可以使用一个Excel表格做一个阶段性计划，精细一点，可以使用teambition等在线管理工具制定日计划甚至小时计划。\n\n第三条边：学会总结。不论是学习，还是工作，乃至是生活。有计划，有总结。才能形成一种良性循环，持续提高办事效率。计划告诉我们需要做哪些事情，而总结可以告诉我们不需要再做哪些事情。就技术而言，我们可以将踩过的每一次坑记录下来，一方面可以方便日后查阅，另一方面可以让后来人绕“道”而行。', '/content/images/2018/06/u-1716797859-3003234315-fm-27-gp-0-1.jpg', 1, 0, 'published', NULL, 'public', NULL, NULL, '1', '2018-03-14 06:08:39', '1', '2018-03-14 06:11:17', '1', '2018-03-14 06:09:17', '1', NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `posts` VALUES ('5b24a9cde559f926ca13e24b', 'fec28c87-cd49-4912-a0d8-603063879364', '产品的尽头是什么？', 'chan-pin-de-jin-tou-shi-shi-yao', '{\"version\":\"0.3.1\",\"markups\":[],\"atoms\":[],\"cards\":[[\"card-markdown\",{\"cardName\":\"card-markdown\",\"markdown\":\"闲来无事，点开微信订阅账号翻看有什么比较有趣的文章，结果被一个好久不曾浏览过的公众号的最新推文吸引住了眼球，“为什么我建议你卸载抖音“。只看了前几行，便觉得互联网产品对生活的影响已经堪称不可抗力因素了，部分原文摘抄如下：\\n\\n凌晨1点15，我习惯性地打开抖音。2小时后，伴随胸口的绞痛，我听到了自己巨大的心跳声。记不清这是本周第几次了，我总觉得自己会猝死在屏幕前……\\n\\n”抖音 or life“，作为一个伪海贼迷，这是我看完这篇文章的第一个念头，同时”大妈“的形象出现在心头，挥之不去。随之而来的另一个问题便是，产品的尽头是什么？\\n\\n《逻辑思维》里面有两期提到了内心边界这个概念。大概意思就是一个人的真实状态是由两个方面规定的。一为”存在感“，一 为”恐惧“。而这两个方面又被内心边界所分割开，边界之内是存在，边界之外是恐惧。好的产品基本上都是针对这两个方面下功夫。泛娱乐类的产品针对的是人的存在感，像我玩了好多年，现在也会偶尔刷几局副本的“神武”就是如此。花了这么多的时间在升级装备和宠物上，都是为了得到在现实世界中无法得到的存在和满足感。殊不知，在游戏中，有更多人会愿意付出比我更多的时间和精力，因此我实际上并没有得到想要得到的存在感，往往在玩了好久以后刷完了一天的日常和所有活动，关上游戏却只会觉得空虚与失落。而教育类产品则是针对人的恐惧，像“得到”、“微信读书”，大抵都是此类。“人们会为了解决恐惧，毫不犹豫地花钱”。对生存的“恐惧”，对缺乏竞争力的“恐惧”，对青春流逝的“恐惧”......\\n\\n前不久，从别人那里获得了一个“古典互联网人”的称号。虽然作为一个华南某知名高校计算机专业的学生，也会参与到互联网人的日常生活中去，但是我实际上真的算不上是一个互联网人，我也觉得这个称呼非常适合我。作为一个“古典互联网人”，我每天都生活在焦虑与矛盾之中。一方面，我会为自己的学识浅薄，聊天时搭不上话而苦恼。另一方面，又不愿意将吃饭、走路等生活中的空闲时间都花在手机上、花在互联网产品上来提升自己的见识。我并不是说不应该利用互联网和产品的福利来提高自己，只是觉得是否适合在所有的场合都捧着手机，像一个重度xx患者。本来我就是一个不擅长寻找聊天话题的人，在这样的环境下，这种缺点似乎变得格外严重也格外没有什么影响了。\\n\\n我不知道该怎么形容这种不像是生活的“生活”。我所认为的生活大概是可以一下午坐在村头看两个老人下象棋或者闲暇时跟朋友坐在一起喝茶聊天，哪怕是什么都不做，一起感受当下与存在。“纸上得来终觉浅，绝知此事要躬行”，与从互联网上获取海量的信息相比，我更愿意花时间、花精力去经历一些事情，我很看重经历和由实践带来的阅历。可是互联网产品正在将这些事情变得越来越简单，唾手可得，代价恰恰也是时间和精力。越来越多的人走在路上、吃饭时、地铁上，随时随地都在低头盯着手机屏幕。或娱乐，或”社交“，或学习，像是电影中的行尸走肉。也同时牵动着我内心的焦虑和不安。我的同龄人正在抛弃我，真的是言之有物。\\n\\n产品的尽头是什么？是无休止地满足欲望（来自一位优秀的产品经理）\"}]],\"sections\":[[10,0]]}', '<div class=\"kg-card-markdown\"><p>闲来无事，点开微信订阅账号翻看有什么比较有趣的文章，结果被一个好久不曾浏览过的公众号的最新推文吸引住了眼球，“为什么我建议你卸载抖音“。只看了前几行，便觉得互联网产品对生活的影响已经堪称不可抗力因素了，部分原文摘抄如下：</p>\n<p>凌晨1点15，我习惯性地打开抖音。2小时后，伴随胸口的绞痛，我听到了自己巨大的心跳声。记不清这是本周第几次了，我总觉得自己会猝死在屏幕前……</p>\n<p>”抖音 or life“，作为一个伪海贼迷，这是我看完这篇文章的第一个念头，同时”大妈“的形象出现在心头，挥之不去。随之而来的另一个问题便是，产品的尽头是什么？</p>\n<p>《逻辑思维》里面有两期提到了内心边界这个概念。大概意思就是一个人的真实状态是由两个方面规定的。一为”存在感“，一 为”恐惧“。而这两个方面又被内心边界所分割开，边界之内是存在，边界之外是恐惧。好的产品基本上都是针对这两个方面下功夫。泛娱乐类的产品针对的是人的存在感，像我玩了好多年，现在也会偶尔刷几局副本的“神武”就是如此。花了这么多的时间在升级装备和宠物上，都是为了得到在现实世界中无法得到的存在和满足感。殊不知，在游戏中，有更多人会愿意付出比我更多的时间和精力，因此我实际上并没有得到想要得到的存在感，往往在玩了好久以后刷完了一天的日常和所有活动，关上游戏却只会觉得空虚与失落。而教育类产品则是针对人的恐惧，像“得到”、“微信读书”，大抵都是此类。“人们会为了解决恐惧，毫不犹豫地花钱”。对生存的“恐惧”，对缺乏竞争力的“恐惧”，对青春流逝的“恐惧”......</p>\n<p>前不久，从别人那里获得了一个“古典互联网人”的称号。虽然作为一个华南某知名高校计算机专业的学生，也会参与到互联网人的日常生活中去，但是我实际上真的算不上是一个互联网人，我也觉得这个称呼非常适合我。作为一个“古典互联网人”，我每天都生活在焦虑与矛盾之中。一方面，我会为自己的学识浅薄，聊天时搭不上话而苦恼。另一方面，又不愿意将吃饭、走路等生活中的空闲时间都花在手机上、花在互联网产品上来提升自己的见识。我并不是说不应该利用互联网和产品的福利来提高自己，只是觉得是否适合在所有的场合都捧着手机，像一个重度xx患者。本来我就是一个不擅长寻找聊天话题的人，在这样的环境下，这种缺点似乎变得格外严重也格外没有什么影响了。</p>\n<p>我不知道该怎么形容这种不像是生活的“生活”。我所认为的生活大概是可以一下午坐在村头看两个老人下象棋或者闲暇时跟朋友坐在一起喝茶聊天，哪怕是什么都不做，一起感受当下与存在。“纸上得来终觉浅，绝知此事要躬行”，与从互联网上获取海量的信息相比，我更愿意花时间、花精力去经历一些事情，我很看重经历和由实践带来的阅历。可是互联网产品正在将这些事情变得越来越简单，唾手可得，代价恰恰也是时间和精力。越来越多的人走在路上、吃饭时、地铁上，随时随地都在低头盯着手机屏幕。或娱乐，或”社交“，或学习，像是电影中的行尸走肉。也同时牵动着我内心的焦虑和不安。我的同龄人正在抛弃我，真的是言之有物。</p>\n<p>产品的尽头是什么？是无休止地满足欲望（来自一位优秀的产品经理）</p>\n</div>', NULL, '闲来无事，点开微信订阅账号翻看有什么比较有趣的文章，结果被一个好久不曾浏览过的公众号的最新推文吸引住了眼球，“为什么我建议你卸载抖音“。只看了前几行，便觉得互联网产品对生活的影响已经堪称不可抗力因素了，部分原文摘抄如下：\n\n凌晨1点15，我习惯性地打开抖音。2小时后，伴随胸口的绞痛，我听到了自己巨大的心跳声。记不清这是本周第几次了，我总觉得自己会猝死在屏幕前……\n\n”抖音 or life“，作为一个伪海贼迷，这是我看完这篇文章的第一个念头，同时”大妈“的形象出现在心头，挥之不去。随之而来的另一个问题便是，产品的尽头是什么？\n\n《逻辑思维》里面有两期提到了内心边界这个概念。大概意思就是一个人的真实状态是由两个方面规定的。一为”存在感“，一\n为”恐惧“。而这两个方面又被内心边界所分割开，边界之内是存在，边界之外是恐惧。好的产品基本上都是针对这两个方面下功夫。泛娱乐类的产品针对的是人的存在感，像我玩了好多年，现在也会偶尔刷几局副本的“神武”就是如此。花了这么多的时间在升级装备和宠物上，都是为了得到在现实世界中无法得到的存在和满足感。殊不知，在游戏中，有更多人会愿意付出比我更多的时间和精力，因此我实际上并没有得到想要得到的存在感，往往在玩了好久以后刷完了一天的日常和所有活动，关上游戏却只会觉得空虚与失落。而教育类产品则是针对人的恐惧，像“得到”、“微信读书”，大抵都是此类。“人们会为了解决恐惧，毫不犹豫地花钱”。对生存的“恐惧”，对缺乏竞争力的“恐惧”，对青春流逝的“恐惧”......\n\n前不久，从别人那里获得了一个“古典互联网人”的称号。虽然作为一个华南某知名高校计算机专业的学生，也会参与到互联网人的日常生活中去，但是我实际上真的算不上是一个互联网人，我也觉得这个称呼非常适合我。作为一个“古典互联网人”，我每天都生活在焦虑与矛盾之中。一方面，我会为自己的学识浅薄，聊天时搭不上话而苦恼。另一方面，又不愿意将吃饭、走路等生活中的空闲时间都花在手机上、花在互联网产品上来提升自己的见识。我并不是说不应该利用互联网和产品的福利来提高自己，只是觉得是否适合在所有的场合都捧着手机，像一个重度xx患者。本来我就是一个不擅长寻找聊天话题的人，在这样的环境下，这种缺点似乎变得格外严重也格外没有什么影响了。\n\n我不知道该怎么形容这种不像是生活的“生活”。我所认为的生活大概是可以一下午坐在村头看两个老人下象棋或者闲暇时跟朋友坐在一起喝茶聊天，哪怕是什么都不做，一起感受当下与存在。“纸上得来终觉浅，绝知此事要躬行”，与从互联网上获取海量的信息相比，我更愿意花时间、花精力去经历一些事情，我很看重经历和由实践带来的阅历。可是互联网产品正在将这些事情变得越来越简单，唾手可得，代价恰恰也是时间和精力。越来越多的人走在路上、吃饭时、地铁上，随时随地都在低头盯着手机屏幕。或娱乐，或”社交“，或学习，像是电影中的行尸走肉。也同时牵动着我内心的焦虑和不安。我的同龄人正在抛弃我，真的是言之有物。\n\n产品的尽头是什么？是无休止地满足欲望（来自一位优秀的产品经理）', '/content/images/2018/06/u-391479474-3106704218-fm-27-gp-0-1.jpg', 0, 0, 'published', NULL, 'public', NULL, NULL, '1', '2018-04-24 06:10:21', '1', '2018-04-24 06:10:59', '1', '2018-04-24 06:10:59', '1', NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `posts` VALUES ('5b3385bb22e5ab1d5c83b0d3', 'd029a9fe-7f50-4536-b1af-f65998d1b687', 'About Me', 'about', '{\"version\":\"0.3.1\",\"markups\":[],\"atoms\":[],\"cards\":[[\"card-markdown\",{\"cardName\":\"card-markdown\",\"markdown\":\"Hello，It\'s shaodong.\"}]],\"sections\":[[10,0]]}', '<div class=\"kg-card-markdown\"><p>Hello，It\'s shaodong.</p>\n</div>', NULL, 'Hello，It\'s shaodong.', NULL, 0, 1, 'published', NULL, 'public', NULL, NULL, '1', '2018-06-27 12:40:27', '1', '2018-06-29 13:36:34', '1', '2018-06-27 12:41:20', '1', NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `posts` VALUES ('5b3394f0458d482ba2cf50fb', '74b3c62b-a94c-48c4-adfe-6bc087e5fb79', 'Something in Life', 'life', '{\"version\":\"0.3.1\",\"markups\":[],\"atoms\":[],\"cards\":[[\"card-markdown\",{\"cardName\":\"card-markdown\",\"markdown\":\" This is a story about life.\"}]],\"sections\":[[10,0]]}', '<div class=\"kg-card-markdown\"><p>This is a story about life.</p>\n</div>', NULL, 'This is a story about life.', NULL, 0, 1, 'published', NULL, 'public', NULL, NULL, '1', '2018-06-27 13:45:20', '1', '2018-06-29 14:59:25', '1', '2018-06-27 13:45:46', '1', NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `posts` VALUES ('5b3b762efef595188b88e292', '00ad3c8c-0ae1-4327-ae5d-a74eaa2deeda', 'Layui：设置select下拉框自动选中某项', 'layui-she-zhi-selectxia-la-kuang-zi-dong-xuan-zhong-mou-xiang', '{\"version\":\"0.3.1\",\"markups\":[],\"atoms\":[],\"cards\":[[\"card-markdown\",{\"cardName\":\"card-markdown\",\"markdown\":\"#### 1. 需求场景分析\\n用户需要更改某一项活动的信息，活动信息中包含需要用下拉框选择的字段A。在用户点击进行修改弹出对话框的瞬间需要填补已有的活动信息，自动选择字段A已经存在的值。\\n\\n#### 2. Layui的select下拉框是怎么实现的\\n为了获得一个select标配的下拉框，我们需要在html中填写的内容如下：\\n```\\n<div class=\\\"layui-form-item\\\">\\n  <label class=\\\"layui-form-label\\\"><span class=\\\"color-red\\\">* </span>发送对象：</label>\\n  <div class=\\\"layui-input-inline\\\">\\n    <select id=\\\"edit_exam_school\\\">\\n      <option value=\\\"\\\">请选择</option>\\n      <option value=\\\"1\\\">华南理工大学大学城</option>\\n      <option value=\\\"2\\\">华南理工大学五山校区</option>\\n      <option value=\\\"3\\\">中山大学珠海校区</option>\\n      <option value=\\\"4\\\">中山大学大学城校区</option>\\n    </select>\\n  </div>\\n</div>\\n```\\nlayui对以上html的渲染结果如何？\\n![layui-html](/content/images/2018/07/layui-html.png)\\n此处select可供选择的元素是通过ajax从后台请求获得的，需要根据动态结果决定选择哪一个。分析一下渲染结果的结构，得到dom树如下：\\n![layui-tree](/content/images/2018/07/layui-tree.png)\\n发现在layui-input-inline之下除了select之外又多了个layui-form-select的div。该div包含layui-select-title和dl两个孩子元素，select的选择事件可以通过点击dl下某个确定的dd元素实现。\\n\\n#### 3. 如何实现自动选择？\\n通过以上的分析结果可以得知，我们只要拿到自己想要选择的内容所在的dd元素并对它触发点击事件，即可实现select加载时自动选择操作。\\n\\n首先需要使用lay-value来确定需要设置哪个元素自动选择\\n```\\nvar select = \'dd[lay-value=\' + data.schoolId + \']\';\\n```\\n触发点击事件，实现自动选择\\n```\\n$(\'#edit_exam_school\').siblings(\\\"div.layui-form-select\\\").find(\'dl\').find(select).click();\\n```\"}]],\"sections\":[[10,0]]}', '<div class=\"kg-card-markdown\"><h4 id=\"1\">1. 需求场景分析</h4>\n<p>用户需要更改某一项活动的信息，活动信息中包含需要用下拉框选择的字段A。在用户点击进行修改弹出对话框的瞬间需要填补已有的活动信息，自动选择字段A已经存在的值。</p>\n<h4 id=\"2layuiselect\">2. Layui的select下拉框是怎么实现的</h4>\n<p>为了获得一个select标配的下拉框，我们需要在html中填写的内容如下：</p>\n<pre><code>&lt;div class=&quot;layui-form-item&quot;&gt;\n  &lt;label class=&quot;layui-form-label&quot;&gt;&lt;span class=&quot;color-red&quot;&gt;* &lt;/span&gt;发送对象：&lt;/label&gt;\n  &lt;div class=&quot;layui-input-inline&quot;&gt;\n    &lt;select id=&quot;edit_exam_school&quot;&gt;\n      &lt;option value=&quot;&quot;&gt;请选择&lt;/option&gt;\n      &lt;option value=&quot;1&quot;&gt;华南理工大学大学城&lt;/option&gt;\n      &lt;option value=&quot;2&quot;&gt;华南理工大学五山校区&lt;/option&gt;\n      &lt;option value=&quot;3&quot;&gt;中山大学珠海校区&lt;/option&gt;\n      &lt;option value=&quot;4&quot;&gt;中山大学大学城校区&lt;/option&gt;\n    &lt;/select&gt;\n  &lt;/div&gt;\n&lt;/div&gt;\n</code></pre>\n<p>layui对以上html的渲染结果如何？<br>\n<img src=\"/content/images/2018/07/layui-html.png\" alt=\"layui-html\"><br>\n此处select可供选择的元素是通过ajax从后台请求获得的，需要根据动态结果决定选择哪一个。分析一下渲染结果的结构，得到dom树如下：<br>\n<img src=\"/content/images/2018/07/layui-tree.png\" alt=\"layui-tree\"><br>\n发现在layui-input-inline之下除了select之外又多了个layui-form-select的div。该div包含layui-select-title和dl两个孩子元素，select的选择事件可以通过点击dl下某个确定的dd元素实现。</p>\n<h4 id=\"3\">3. 如何实现自动选择？</h4>\n<p>通过以上的分析结果可以得知，我们只要拿到自己想要选择的内容所在的dd元素并对它触发点击事件，即可实现select加载时自动选择操作。</p>\n<p>首先需要使用lay-value来确定需要设置哪个元素自动选择</p>\n<pre><code>var select = \'dd[lay-value=\' + data.schoolId + \']\';\n</code></pre>\n<p>触发点击事件，实现自动选择</p>\n<pre><code>$(\'#edit_exam_school\').siblings(&quot;div.layui-form-select&quot;).find(\'dl\').find(select).click();\n</code></pre>\n</div>', NULL, '1. 需求场景分析\n用户需要更改某一项活动的信息，活动信息中包含需要用下拉框选择的字段A。在用户点击进行修改弹出对话框的瞬间需要填补已有的活动信息，自动选择字段A已经存在的值。\n\n2. Layui的select下拉框是怎么实现的\n为了获得一个select标配的下拉框，我们需要在html中填写的内容如下：\n\n<div class=\"layui-form-item\">\n  <label class=\"layui-form-label\"><span class=\"color-red\">* </span>发送对象：</label>\n  <div class=\"layui-input-inline\">\n    <select id=\"edit_exam_school\">\n      <option value=\"\">请选择</option>\n      <option value=\"1\">华南理工大学大学城</option>\n      <option value=\"2\">华南理工大学五山校区</option>\n      <option value=\"3\">中山大学珠海校区</option>\n      <option value=\"4\">中山大学大学城校区</option>\n    </select>\n  </div>\n</div>\n\n\nlayui对以上html的渲染结果如何？\n\n此处select可供选择的元素是通过ajax从后台请求获得的，需要根据动态结果决定选择哪一个。分析一下渲染结果的结构，得到dom树如下：\n\n发现在layui-input-inline之下除了select之外又多了个layui-form-select的div。该div包含layui-select-title和dl两个孩子元素，select的选择事件可以通过点击dl下某个确定的dd元素实现。\n\n3. 如何实现自动选择？\n通过以上的分析结果可以得知，我们只要拿到自己想要选择的内容所在的dd元素并对它触发点击事件，即可实现select加载时自动选择操作。\n\n首先需要使用lay-value来确定需要设置哪个元素自动选择\n\nvar select = \'dd[lay-value=\' + data.schoolId + \']\';\n\n\n触发点击事件，实现自动选择\n\n$(\'#edit_exam_school\').siblings(\"div.layui-form-select\").find(\'dl\').find(select).click();', '/content/images/2018/07/layui.jpeg', 0, 0, 'published', NULL, 'public', NULL, NULL, '1', '2018-07-03 13:12:14', '1', '2018-07-03 13:36:13', '1', '2018-03-04 17:32:00', '1', NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `posts` VALUES ('5b3b78d9fef595188b88e296', '17cd81e3-ceb3-4827-96a6-b5353d88b6cc', 'Vue: 打开弹框的正确姿势', 'vue-da-kai-dan-kuang-de-zheng-que-zi-shi', '{\"version\":\"0.3.1\",\"markups\":[],\"atoms\":[],\"cards\":[[\"card-markdown\",{\"cardName\":\"card-markdown\",\"markdown\":\"#### 1. 技术选型\\nVue + ElementUI\\n\\n#### 2. 需求功能分析\\n点击按钮，出现弹框。点击取消或者弹框右上角叉号，关闭弹框。\\n\\n#### 3. 组件树结构\\n![vue-tree](/content/images/2018/07/vue-tree.png)\\n\\n#### 4. 实现思路 \\n**4.1 方案一 (wrong)**\\n用户点击MainContent触发点击事件\\nMainContent通知父组件显示弹框\\n```\\nthis.$emit(\'showAlertModal\')\\n```\\n父组件接收通知并改变showAlertModal变量的值\\n```\\nthis.showAlertModal = true\\n```\\n父组件传值给AlertModal告诉它：请开始你的表演\\n```\\n<AlertModal :show=\\\"showAlertModal\\\"></AlertModal>\\n```\\n子组件拿到这个值之后，脱掉隐身衣\\n```\\n<el-dialog title=\\\"title\\\" :visible.sync=\\\"show\\\"></el-dialog>\\n```\\n当用户点击到取消按钮或者弹出框右上角的叉号时，子组件更改show的值隐藏自己\\n```\\nCloseThis () {\\n  this.show = false\\n}\\n```\\n这个方案是可以正常运行的，但是会报错，因为Vue不允许子组件更改父组件的变量。\\n\\n**4.2 方案二 (wrong)**\\n子组件中不直接更改父组件传过来的show值，而是在computed中使用一个变量来接收它\\n```\\ncomputed: {\\n  showThis: {\\n    get: function () {\\n      return this.show\\n    }\\n  }\\n}\\n```\\n子组件通过showThis变量来操作隐身衣\\n```\\n<el-dialog title=\\\"title\\\" :visible.sync=\\\"showThis\\\"></el-dialog>\\n```\\n在用户点击取消按钮的时候通过改变showThis的值来达到隐藏效果\\n```\\nCloseThis () {\\n  this.showThis = false\\n}\\n```\\n结果表现为弹出框能点开，但是关不上，报错信息为：Computed property \\\"showThis\\\" was assigned to but it has no setter.\\n\\n好吧，查了一下官方文档发现需要如果需要读取和设置computed中的属性需要同时具备get和set方法，就像下面这样\\n![vue-set](/content/images/2018/07/vue-set.png)\\n但是继续观察这个写法，发现set方法中修改的变量值正是get方法中返回的变量值。平移到我们这个场景中则表现为set方法中需要修改this.show的值，而this.show是父元素传下来的，是不能修改的，所以这个方法也不可行！\\n\\n**4.3 方案三 (right)**\\n子组件在data中定义一个showThis变量，初始值为null\\n```\\ndata () {\\n  return {\\n    showThis: null\\n  }\\n}\\n```\\n在组件挂载的时候将父元素传来的show赋值给showThis \\n```\\nmounted () {\\n    this.showThis = this.show\\n}\\n```\\n为show和showThis两个变量添加监听，每当它们发生变化的时候就进行相应的操作\\n```\\nwatch: {\\n  showThis: function(newV, oldV){\\n    // 告诉父元素改变show的值\\n    this.$emit(\'closeModal\', newV)\\n  },\\n  show: function (newV, oldV) {\\n    this.showThis = newV\\n  }\\n}\\n```\\n父元素拿到子元素传来的closeModal事件的dom及事件触发的函数内容如下\\n```\\n<AlertModal \\n    @closeModal=\\\"CloseModal\\\"\\n    :show=\\\"showAlertModal\\\"></AlertModal>\\nCloseModal(...data) {\\n  this.showAlertModal = data[0]\\n}\\n```\"}]],\"sections\":[[10,0]]}', '<div class=\"kg-card-markdown\"><h4 id=\"1\">1. 技术选型</h4>\n<p>Vue + ElementUI</p>\n<h4 id=\"2\">2. 需求功能分析</h4>\n<p>点击按钮，出现弹框。点击取消或者弹框右上角叉号，关闭弹框。</p>\n<h4 id=\"3\">3. 组件树结构</h4>\n<p><img src=\"/content/images/2018/07/vue-tree.png\" alt=\"vue-tree\"></p>\n<h4 id=\"4\">4. 实现思路</h4>\n<p><strong>4.1 方案一 (wrong)</strong><br>\n用户点击MainContent触发点击事件<br>\nMainContent通知父组件显示弹框</p>\n<pre><code>this.$emit(\'showAlertModal\')\n</code></pre>\n<p>父组件接收通知并改变showAlertModal变量的值</p>\n<pre><code>this.showAlertModal = true\n</code></pre>\n<p>父组件传值给AlertModal告诉它：请开始你的表演</p>\n<pre><code>&lt;AlertModal :show=&quot;showAlertModal&quot;&gt;&lt;/AlertModal&gt;\n</code></pre>\n<p>子组件拿到这个值之后，脱掉隐身衣</p>\n<pre><code>&lt;el-dialog title=&quot;title&quot; :visible.sync=&quot;show&quot;&gt;&lt;/el-dialog&gt;\n</code></pre>\n<p>当用户点击到取消按钮或者弹出框右上角的叉号时，子组件更改show的值隐藏自己</p>\n<pre><code>CloseThis () {\n  this.show = false\n}\n</code></pre>\n<p>这个方案是可以正常运行的，但是会报错，因为Vue不允许子组件更改父组件的变量。</p>\n<p><strong>4.2 方案二 (wrong)</strong><br>\n子组件中不直接更改父组件传过来的show值，而是在computed中使用一个变量来接收它</p>\n<pre><code>computed: {\n  showThis: {\n    get: function () {\n      return this.show\n    }\n  }\n}\n</code></pre>\n<p>子组件通过showThis变量来操作隐身衣</p>\n<pre><code>&lt;el-dialog title=&quot;title&quot; :visible.sync=&quot;showThis&quot;&gt;&lt;/el-dialog&gt;\n</code></pre>\n<p>在用户点击取消按钮的时候通过改变showThis的值来达到隐藏效果</p>\n<pre><code>CloseThis () {\n  this.showThis = false\n}\n</code></pre>\n<p>结果表现为弹出框能点开，但是关不上，报错信息为：Computed property &quot;showThis&quot; was assigned to but it has no setter.</p>\n<p>好吧，查了一下官方文档发现需要如果需要读取和设置computed中的属性需要同时具备get和set方法，就像下面这样<br>\n<img src=\"/content/images/2018/07/vue-set.png\" alt=\"vue-set\"><br>\n但是继续观察这个写法，发现set方法中修改的变量值正是get方法中返回的变量值。平移到我们这个场景中则表现为set方法中需要修改this.show的值，而this.show是父元素传下来的，是不能修改的，所以这个方法也不可行！</p>\n<p><strong>4.3 方案三 (right)</strong><br>\n子组件在data中定义一个showThis变量，初始值为null</p>\n<pre><code>data () {\n  return {\n    showThis: null\n  }\n}\n</code></pre>\n<p>在组件挂载的时候将父元素传来的show赋值给showThis</p>\n<pre><code>mounted () {\n    this.showThis = this.show\n}\n</code></pre>\n<p>为show和showThis两个变量添加监听，每当它们发生变化的时候就进行相应的操作</p>\n<pre><code>watch: {\n  showThis: function(newV, oldV){\n    // 告诉父元素改变show的值\n    this.$emit(\'closeModal\', newV)\n  },\n  show: function (newV, oldV) {\n    this.showThis = newV\n  }\n}\n</code></pre>\n<p>父元素拿到子元素传来的closeModal事件的dom及事件触发的函数内容如下</p>\n<pre><code>&lt;AlertModal \n    @closeModal=&quot;CloseModal&quot;\n    :show=&quot;showAlertModal&quot;&gt;&lt;/AlertModal&gt;\nCloseModal(...data) {\n  this.showAlertModal = data[0]\n}\n</code></pre>\n</div>', NULL, '1. 技术选型\nVue + ElementUI\n\n2. 需求功能分析\n点击按钮，出现弹框。点击取消或者弹框右上角叉号，关闭弹框。\n\n3. 组件树结构\n\n\n4. 实现思路\n4.1 方案一 (wrong)\n用户点击MainContent触发点击事件\nMainContent通知父组件显示弹框\n\nthis.$emit(\'showAlertModal\')\n\n\n父组件接收通知并改变showAlertModal变量的值\n\nthis.showAlertModal = true\n\n\n父组件传值给AlertModal告诉它：请开始你的表演\n\n<AlertModal :show=\"showAlertModal\"></AlertModal>\n\n\n子组件拿到这个值之后，脱掉隐身衣\n\n<el-dialog title=\"title\" :visible.sync=\"show\"></el-dialog>\n\n\n当用户点击到取消按钮或者弹出框右上角的叉号时，子组件更改show的值隐藏自己\n\nCloseThis () {\n  this.show = false\n}\n\n\n这个方案是可以正常运行的，但是会报错，因为Vue不允许子组件更改父组件的变量。\n\n4.2 方案二 (wrong)\n子组件中不直接更改父组件传过来的show值，而是在computed中使用一个变量来接收它\n\ncomputed: {\n  showThis: {\n    get: function () {\n      return this.show\n    }\n  }\n}\n\n\n子组件通过showThis变量来操作隐身衣\n\n<el-dialog title=\"title\" :visible.sync=\"showThis\"></el-dialog>\n\n\n在用户点击取消按钮的时候通过改变showThis的值来达到隐藏效果\n\nCloseThis () {\n  this.showThis = false\n}\n\n\n结果表现为弹出框能点开，但是关不上，报错信息为：Computed property \"showThis\" was assigned to but it has\nno setter.\n\n好吧，查了一下官方文档发现需要如果需要读取和设置computed中的属性需要同时具备get和set方法，就像下面这样\n\n但是继续观察这个写法，发现set方法中修改的变量值正是get方法中返回的变量值。平移到我们这个场景中则表现为set方法中需要修改this.show的值，而this.show是父元素传下来的，是不能修改的，所以这个方法也不可行！\n\n4.3 方案三 (right)\n子组件在data中定义一个showThis变量，初始值为null\n\ndata () {\n  return {\n    showThis: null\n  }\n}\n\n\n在组件挂载的时候将父元素传来的show赋值给showThis\n\nmounted () {\n    this.showThis = this.show\n}\n\n\n为show和showThis两个变量添加监听，每当它们发生变化的时候就进行相应的操作\n\nwatch: {\n  showThis: function(newV, oldV){\n    // 告诉父元素改变show的值\n    this.$emit(\'closeModal\', newV)\n  },\n  show: function (newV, oldV) {\n    this.showThis = newV\n  }\n}\n\n\n父元素拿到子元素传来的closeModal事件的dom及事件触发的函数内容如下\n\n<AlertModal \n    @closeModal=\"CloseModal\"\n    :show=\"showAlertModal\"></AlertModal>\nCloseModal(...data) {\n  this.showAlertModal = data[0]\n}', '/content/images/2018/07/vue-alert.jpg', 0, 0, 'published', NULL, 'public', NULL, NULL, '1', '2018-07-03 13:23:37', '1', '2018-07-03 13:35:56', '1', '2018-03-23 23:26:00', '1', NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for posts_authors
-- ----------------------------
DROP TABLE IF EXISTS `posts_authors`;
CREATE TABLE `posts_authors` (
  `id` varchar(24) NOT NULL,
  `post_id` varchar(24) NOT NULL,
  `author_id` varchar(24) NOT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `posts_authors_post_id_foreign` (`post_id`),
  KEY `posts_authors_author_id_foreign` (`author_id`),
  CONSTRAINT `posts_authors_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
  CONSTRAINT `posts_authors_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of posts_authors
-- ----------------------------
BEGIN;
INSERT INTO `posts_authors` VALUES ('5b24a790e559f926ca13e242', '5b24a790e559f926ca13e241', '1', 0);
INSERT INTO `posts_authors` VALUES ('5b24a935e559f926ca13e246', '5b24a935e559f926ca13e245', '1', 0);
INSERT INTO `posts_authors` VALUES ('5b24a967e559f926ca13e248', '5b24a967e559f926ca13e247', '1', 0);
INSERT INTO `posts_authors` VALUES ('5b24a9cde559f926ca13e24c', '5b24a9cde559f926ca13e24b', '1', 0);
INSERT INTO `posts_authors` VALUES ('5b3385bb22e5ab1d5c83b0d4', '5b3385bb22e5ab1d5c83b0d3', '1', 0);
INSERT INTO `posts_authors` VALUES ('5b3394f0458d482ba2cf50fc', '5b3394f0458d482ba2cf50fb', '1', 0);
INSERT INTO `posts_authors` VALUES ('5b3b762efef595188b88e293', '5b3b762efef595188b88e292', '1', 0);
INSERT INTO `posts_authors` VALUES ('5b3b78d9fef595188b88e297', '5b3b78d9fef595188b88e296', '1', 0);
COMMIT;

-- ----------------------------
-- Table structure for posts_tags
-- ----------------------------
DROP TABLE IF EXISTS `posts_tags`;
CREATE TABLE `posts_tags` (
  `id` varchar(24) NOT NULL,
  `post_id` varchar(24) NOT NULL,
  `tag_id` varchar(24) NOT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `posts_tags_post_id_foreign` (`post_id`),
  KEY `posts_tags_tag_id_foreign` (`tag_id`),
  CONSTRAINT `posts_tags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `posts_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of posts_tags
-- ----------------------------
BEGIN;
INSERT INTO `posts_tags` VALUES ('5b24a913e559f926ca13e244', '5b24a790e559f926ca13e241', '5b24a913e559f926ca13e243', 0);
INSERT INTO `posts_tags` VALUES ('5b24a98de559f926ca13e24a', '5b24a967e559f926ca13e247', '5b24a98de559f926ca13e249', 0);
INSERT INTO `posts_tags` VALUES ('5b24a9f3e559f926ca13e24e', '5b24a9cde559f926ca13e24b', '5b24a9f3e559f926ca13e24d', 0);
INSERT INTO `posts_tags` VALUES ('5b3b76eafef595188b88e295', '5b3b762efef595188b88e292', '5b3b76eafef595188b88e294', 0);
INSERT INTO `posts_tags` VALUES ('5b3b7b55fef595188b88e298', '5b3b78d9fef595188b88e296', '5b3b76eafef595188b88e294', 0);
COMMIT;

-- ----------------------------
-- Table structure for refreshtokens
-- ----------------------------
DROP TABLE IF EXISTS `refreshtokens`;
CREATE TABLE `refreshtokens` (
  `id` varchar(24) NOT NULL,
  `token` varchar(191) NOT NULL,
  `user_id` varchar(24) NOT NULL,
  `client_id` varchar(24) NOT NULL,
  `expires` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refreshtokens_token_unique` (`token`),
  KEY `refreshtokens_user_id_foreign` (`user_id`),
  KEY `refreshtokens_client_id_foreign` (`client_id`),
  CONSTRAINT `refreshtokens_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `refreshtokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of refreshtokens
-- ----------------------------
BEGIN;
INSERT INTO `refreshtokens` VALUES ('5b24a70ee559f926ca13e23e', 'M5LtDCnwEg4WLGL2bZRZ7p00J2vljwXZYQEYtH9rh4hiAxsuIbpUWPxRZKNbWc5XOplXR1zBe4D4MYw6epsYLnGxVJEHJiZV4y39DNnFa9BPuisCpIBtnvu0KnYyzuPSs80s1ZsjM3NOAJIQaTINur5QLYUIBh5CGJfRlwhG3XSfsqNl7P37gLHuC4jY0C8', '1', '5b23b28fd932101eaa669304', 1544896718383);
INSERT INTO `refreshtokens` VALUES ('5b24ac694e8adf50af795b08', 'Zfc6BVVqMQ9wXvtRaefcFqfeiU0Xb78daY2KjfTd58tLPue5FvsNo52IM28ZTj0gFkByrtusMKl4lJp2HEWyowZnaqUrj4fSSRJ04KriA7i2Edn5WFNFX9ppZciDJIcC1OFYjPk5FuRcYpOFeBkTS1HRgEICNvf7XrVETeBl4NJxslceruFRZwbItGSdFF1', '1', '5b23b28fd932101eaa669304', 1546468823819);
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` varchar(24) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES ('5b23b28fd932101eaa669308', 'Administrator', 'Administrators', '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `roles` VALUES ('5b23b28fd932101eaa669309', 'Editor', 'Editors', '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `roles` VALUES ('5b23b28fd932101eaa66930a', 'Author', 'Authors', '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `roles` VALUES ('5b23b28fd932101eaa66930b', 'Contributor', 'Contributors', '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `roles` VALUES ('5b23b28fd932101eaa66930c', 'Owner', 'Blog Owner', '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
COMMIT;

-- ----------------------------
-- Table structure for roles_users
-- ----------------------------
DROP TABLE IF EXISTS `roles_users`;
CREATE TABLE `roles_users` (
  `id` varchar(24) NOT NULL,
  `role_id` varchar(24) NOT NULL,
  `user_id` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of roles_users
-- ----------------------------
BEGIN;
INSERT INTO `roles_users` VALUES ('5b23b291d932101eaa669342', '5b23b28fd932101eaa66930a', '5951f5fca366002ebd5dbef7');
INSERT INTO `roles_users` VALUES ('5b23b292d932101eaa6693d2', '5b23b28fd932101eaa66930c', '1');
COMMIT;

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` varchar(24) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` text,
  `type` varchar(50) NOT NULL DEFAULT 'core',
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of settings
-- ----------------------------
BEGIN;
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb63', 'db_hash', 'da6851fa-b018-461b-8097-d074959a18ba', 'core', '2018-06-15 12:38:24', '1', '2018-06-15 12:38:24', '1');
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb64', 'next_update_check', '1530543675', 'core', '2018-06-15 12:38:24', '1', '2018-07-01 15:01:15', '1');
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb65', 'notifications', '[{\"dismissible\":true,\"location\":\"bottom\",\"status\":\"alert\",\"id\":\"5b24a78ae559f926ca13e240\",\"type\":\"warn\",\"message\":\"Ghost is currently unable to send email. See https://docs.ghost.org/v1/docs/mail-config for instructions.\",\"seen\":false,\"addedAt\":\"2018-06-16T06:00:42.433Z\"}]', 'core', '2018-06-15 12:38:24', '1', '2018-06-16 06:00:42', '1');
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb66', 'title', '少东', 'blog', '2018-06-15 12:38:24', '1', '2018-07-03 13:06:41', '1');
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb67', 'description', 'It\'s shaoDong\'s blog.', 'blog', '2018-06-15 12:38:24', '1', '2018-07-03 12:56:42', '1');
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb68', 'logo', '/content/images/2018/06/1-1.jpg', 'blog', '2018-06-15 12:38:24', '1', '2018-06-27 13:23:21', '1');
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb69', 'cover_image', 'https://casper.ghost.org/v1.0.0/images/blog-cover.jpg', 'blog', '2018-06-15 12:38:24', '1', '2018-06-15 12:38:24', '1');
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb6a', 'icon', '', 'blog', '2018-06-15 12:38:24', '1', '2018-06-15 12:38:24', '1');
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb6b', 'default_locale', 'en', 'blog', '2018-06-15 12:38:24', '1', '2018-06-15 12:38:24', '1');
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb6c', 'active_timezone', 'Etc/UTC', 'blog', '2018-06-15 12:38:24', '1', '2018-06-15 12:38:24', '1');
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb6d', 'force_i18n', 'true', 'blog', '2018-06-15 12:38:24', '1', '2018-06-15 12:38:24', '1');
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb6e', 'permalinks', '/:slug/', 'blog', '2018-06-15 12:38:24', '1', '2018-06-15 12:38:24', '1');
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb6f', 'amp', 'true', 'blog', '2018-06-15 12:38:24', '1', '2018-06-15 12:38:24', '1');
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb70', 'ghost_head', '', 'blog', '2018-06-15 12:38:24', '1', '2018-06-15 12:38:24', '1');
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb71', 'ghost_foot', '', 'blog', '2018-06-15 12:38:24', '1', '2018-06-15 12:38:24', '1');
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb72', 'facebook', '', 'blog', '2018-06-15 12:38:24', '1', '2018-06-15 12:38:24', '1');
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb73', 'twitter', '', 'blog', '2018-06-15 12:38:24', '1', '2018-06-15 12:38:24', '1');
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb74', 'labs', '{\"publicAPI\": true}', 'blog', '2018-06-15 12:38:24', '1', '2018-06-15 12:38:24', '1');
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb75', 'navigation', '[{\"label\":\"Home\",\"url\":\"/\"},{\"label\":\"About\",\"url\":\"/about/\"}]', 'blog', '2018-06-15 12:38:24', '1', '2018-07-03 13:05:50', '1');
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb76', 'slack', '[{\"url\":\"\"}]', 'blog', '2018-06-15 12:38:24', '1', '2018-06-15 12:38:24', '1');
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb77', 'unsplash', '{\"isActive\":true}', 'blog', '2018-06-15 12:38:24', '1', '2018-06-16 05:59:08', '1');
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb78', 'active_theme', 'casper', 'theme', '2018-06-15 12:38:24', '1', '2018-06-15 12:38:24', '1');
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb79', 'active_apps', '[]', 'app', '2018-06-15 12:38:24', '1', '2018-06-15 12:38:24', '1');
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb7a', 'installed_apps', '[]', 'app', '2018-06-15 12:38:24', '1', '2018-06-15 12:38:24', '1');
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb7b', 'is_private', 'false', 'private', '2018-06-15 12:38:24', '1', '2018-06-15 12:38:24', '1');
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb7c', 'password', '', 'private', '2018-06-15 12:38:24', '1', '2018-06-15 12:38:24', '1');
INSERT INTO `settings` VALUES ('5b23b340a79c931ebd90cb7d', 'public_hash', '35fe07ca609d54a5bb9b3dac7d3496', 'private', '2018-06-15 12:38:24', '1', '2018-06-15 12:38:24', '1');
COMMIT;

-- ----------------------------
-- Table structure for subscribers
-- ----------------------------
DROP TABLE IF EXISTS `subscribers`;
CREATE TABLE `subscribers` (
  `id` varchar(24) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `post_id` varchar(24) DEFAULT NULL,
  `subscribed_url` varchar(2000) DEFAULT NULL,
  `subscribed_referrer` varchar(2000) DEFAULT NULL,
  `unsubscribed_url` varchar(2000) DEFAULT NULL,
  `unsubscribed_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscribers_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` varchar(24) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text,
  `feature_image` varchar(2000) DEFAULT NULL,
  `parent_id` varchar(191) DEFAULT NULL,
  `visibility` varchar(50) NOT NULL DEFAULT 'public',
  `meta_title` varchar(2000) DEFAULT NULL,
  `meta_description` varchar(2000) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tags
-- ----------------------------
BEGIN;
INSERT INTO `tags` VALUES ('5b23b28fd932101eaa669303', 'Getting Started', 'getting-started', NULL, NULL, NULL, 'public', NULL, NULL, '2018-06-15 12:35:27', '1', '2018-06-15 12:35:27', '1');
INSERT INTO `tags` VALUES ('5b24a913e559f926ca13e243', 'Travel', 'travel', NULL, NULL, NULL, 'public', NULL, NULL, '2018-06-16 06:07:15', '1', '2018-06-16 06:07:15', '1');
INSERT INTO `tags` VALUES ('5b24a98de559f926ca13e249', 'Theory', 'theory', NULL, NULL, NULL, 'public', NULL, NULL, '2018-06-16 06:09:17', '1', '2018-06-16 06:09:17', '1');
INSERT INTO `tags` VALUES ('5b24a9f3e559f926ca13e24d', 'Product', 'product', NULL, NULL, NULL, 'public', NULL, NULL, '2018-06-16 06:10:59', '1', '2018-06-16 06:10:59', '1');
INSERT INTO `tags` VALUES ('5b3b76eafef595188b88e294', 'Practice', 'practice', NULL, NULL, NULL, 'public', NULL, NULL, '2018-07-03 13:15:22', '1', '2018-07-03 13:15:22', '1');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` varchar(24) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `ghost_auth_access_token` varchar(32) DEFAULT NULL,
  `ghost_auth_id` varchar(24) DEFAULT NULL,
  `password` varchar(60) NOT NULL,
  `email` varchar(191) NOT NULL,
  `profile_image` varchar(2000) DEFAULT NULL,
  `cover_image` varchar(2000) DEFAULT NULL,
  `bio` text,
  `website` varchar(2000) DEFAULT NULL,
  `location` text,
  `facebook` varchar(2000) DEFAULT NULL,
  `twitter` varchar(2000) DEFAULT NULL,
  `accessibility` text,
  `status` varchar(50) NOT NULL DEFAULT 'active',
  `locale` varchar(6) DEFAULT NULL,
  `visibility` varchar(50) NOT NULL DEFAULT 'public',
  `meta_title` varchar(2000) DEFAULT NULL,
  `meta_description` varchar(2000) DEFAULT NULL,
  `tour` text,
  `last_seen` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_slug_unique` (`slug`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('1', 'freeStyle shaoDong', 'xu', NULL, NULL, '$2a$10$ul708lwW1fWSUbmv1etRtee.gCzCkTmHtCnjFGLUCsXwY85thKDGS', 'scut_sd@163.com', '/content/images/2018/06/----1.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', NULL, 'public', NULL, NULL, '[\"getting-started\",\"upload-a-theme\"]', '2018-07-04 10:40:23', '2018-06-15 12:35:27', '1', '2018-07-04 10:40:23', '1');
COMMIT;

-- ----------------------------
-- Table structure for webhooks
-- ----------------------------
DROP TABLE IF EXISTS `webhooks`;
CREATE TABLE `webhooks` (
  `id` varchar(24) NOT NULL,
  `event` varchar(50) NOT NULL,
  `target_url` varchar(2000) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;
