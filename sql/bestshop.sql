/*
 Navicat Premium Data Transfer

 Source Server         : bestkit_shop
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : 172.16.2.163:3306
 Source Schema         : bestshop

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 26/10/2018 18:21:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '国家编码',
  `province_code` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '省/州 编码',
  `province_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '城市',
  `street` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '详细地址',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '当user_id存在时则为地址簿地址,否则为订单冗余地址',
  `defaulted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of addresses
-- ----------------------------
BEGIN;
INSERT INTO `addresses` VALUES (1, '吕', '本龙', '17683927887', '568000', 'CN', 'guangdong', 'guangdong', '深圳', '深圳湾科技生态园', 2, 0, '2018-10-22 07:31:41', '2018-10-22 07:31:41');
INSERT INTO `addresses` VALUES (2, '吕', '本龙', '17683927887', '568000', 'CN', 'guangdong', 'guangdong', '深圳', '深圳湾科技生态园', NULL, 0, '2018-10-22 09:28:34', '2018-10-22 09:28:34');
INSERT INTO `addresses` VALUES (3, '吕', '本龙', '17683927887', '568000', 'CN', 'guangdong', 'guangdong', '深圳', '深圳湾科技生态园', NULL, 0, '2018-10-22 09:36:18', '2018-10-22 09:36:18');
INSERT INTO `addresses` VALUES (4, '吕', '本龙', '17683927887', '568000', 'CN', 'guangdong', 'guangdong', '深圳', '深圳湾科技生态园', NULL, 0, '2018-10-22 09:48:35', '2018-10-22 09:48:35');
INSERT INTO `addresses` VALUES (5, '吕', '本龙', '17683927887', '568000', 'CN', 'guangdong', 'guangdong', '深圳', '深圳湾科技生态园', NULL, 0, '2018-10-23 06:19:05', '2018-10-23 06:19:05');
INSERT INTO `addresses` VALUES (6, 'first namre', 'last name', '110', 'code zip', 'AS', 'california', 'california', 'city', 'street', 6, 0, '2018-10-24 06:40:25', '2018-10-24 06:40:25');
COMMIT;

-- ----------------------------
-- Table structure for adjustments
-- ----------------------------
DROP TABLE IF EXISTS `adjustments`;
CREATE TABLE `adjustments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` tinyint(3) unsigned DEFAULT NULL,
  `order_item_id` tinyint(3) unsigned DEFAULT NULL,
  `order_item_unit_id` tinyint(3) unsigned DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调整的类型 shipping/order_promotion/tax等',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '由调整type决定',
  `origin_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '某些label存在code.如promotion',
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adjustments_order_id_index` (`order_id`),
  KEY `adjustments_order_item_id_index` (`order_item_id`),
  KEY `adjustments_order_item_unit_id_index` (`order_item_unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of adjustments
-- ----------------------------
BEGIN;
INSERT INTO `adjustments` VALUES (1, 31, NULL, NULL, 'shipping', 'youzhengxiaobao', NULL, 1000, '2018-10-22 08:11:37', '2018-10-22 08:11:37');
INSERT INTO `adjustments` VALUES (2, 33, NULL, NULL, 'shipping', 'youzhengxiaobao', NULL, 1000, '2018-10-22 08:58:14', '2018-10-22 08:58:14');
INSERT INTO `adjustments` VALUES (4, 34, NULL, NULL, 'shipping', 'youzhengxiaobao', NULL, 1000, '2018-10-22 08:58:30', '2018-10-22 08:58:30');
INSERT INTO `adjustments` VALUES (6, 35, NULL, NULL, 'shipping', 'youzhengxiaobao', NULL, 1000, '2018-10-22 08:58:44', '2018-10-22 08:58:44');
INSERT INTO `adjustments` VALUES (8, 36, NULL, NULL, 'shipping', 'youzhengxiaobao', NULL, 1000, '2018-10-22 09:20:05', '2018-10-22 09:20:05');
INSERT INTO `adjustments` VALUES (10, 37, NULL, NULL, 'shipping', 'youzhengxiaobao', NULL, 1000, '2018-10-22 09:36:12', '2018-10-22 09:36:12');
INSERT INTO `adjustments` VALUES (12, 38, NULL, NULL, 'shipping', 'youzhengxiaobao', NULL, 1000, '2018-10-22 09:48:33', '2018-10-22 09:48:33');
INSERT INTO `adjustments` VALUES (13, 39, NULL, NULL, 'shipping', 'youzhengxiaobao', NULL, 1000, '2018-10-23 02:05:57', '2018-10-23 02:05:57');
INSERT INTO `adjustments` VALUES (14, 40, NULL, NULL, 'shipping', 'youzhengxiaobao', NULL, 1000, '2018-10-23 02:10:46', '2018-10-23 02:10:46');
INSERT INTO `adjustments` VALUES (15, 41, NULL, NULL, 'shipping', 'youzhengxiaobao', NULL, 1000, '2018-10-23 02:11:41', '2018-10-23 02:11:41');
INSERT INTO `adjustments` VALUES (16, 42, NULL, NULL, 'shipping', 'youzhengxiaobao', NULL, 1000, '2018-10-23 02:12:16', '2018-10-23 02:12:16');
INSERT INTO `adjustments` VALUES (17, 43, NULL, NULL, 'shipping', 'youzhengxiaobao', NULL, 1000, '2018-10-23 06:18:56', '2018-10-23 06:18:56');
INSERT INTO `adjustments` VALUES (18, 44, NULL, NULL, 'shipping', 'youzhengxiaobao', NULL, 1000, '2018-10-24 01:57:24', '2018-10-24 01:57:24');
INSERT INTO `adjustments` VALUES (19, 45, NULL, NULL, 'shipping', 'youzhengxiaobao', NULL, 1000, '2018-10-24 06:30:41', '2018-10-24 06:30:41');
INSERT INTO `adjustments` VALUES (20, 46, NULL, NULL, 'shipping', 'youzhengxiaobao', NULL, 1000, '2018-10-24 06:33:38', '2018-10-24 06:33:38');
INSERT INTO `adjustments` VALUES (22, 47, NULL, NULL, 'shipping', 'youzhengxiaobao', NULL, 1000, '2018-10-24 06:34:56', '2018-10-24 06:34:56');
INSERT INTO `adjustments` VALUES (23, 48, NULL, NULL, 'shipping', 'youzhengxiaobao', NULL, 1000, '2018-10-24 06:35:31', '2018-10-24 06:35:31');
INSERT INTO `adjustments` VALUES (24, 49, NULL, NULL, 'shipping', 'youzhengxiaobao', NULL, 1000, '2018-10-24 06:35:54', '2018-10-24 06:35:54');
INSERT INTO `adjustments` VALUES (93, 50, NULL, NULL, 'shipping', 'youzhengxiaobao', NULL, 1000, '2018-10-24 07:43:39', '2018-10-24 07:43:39');
COMMIT;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`),
  UNIQUE KEY `admins_phone_number_unique` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admins
-- ----------------------------
BEGIN;
INSERT INTO `admins` VALUES (1, 'http://maxwei.me/logo.png', 'admin@qq.com', '$2y$10$riPhrtAhJNpNm5vsSPnV.eC0QlTI2PrCEKyCEv9O5jvhpkIYIvWBS', '13168065609', '魏文豪', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for cart_items
-- ----------------------------
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '代替不存在user_id的情况',
  `user_id` int(10) unsigned DEFAULT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `state` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'new',
  `quantity` int(11) NOT NULL DEFAULT '1' COMMENT '数量',
  `product_id` int(10) unsigned DEFAULT NULL,
  `variant_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_items_user_id_variant_id_unique` (`user_id`,`variant_id`),
  KEY `cart_items_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cart_items
-- ----------------------------
BEGIN;
INSERT INTO `cart_items` VALUES (23, NULL, 1, 1, '1', 4, 14, 22, '2018-10-23 01:53:21', '2018-10-23 02:05:31');
INSERT INTO `cart_items` VALUES (24, NULL, 1, 1, '1', 4, 14, 24, '2018-10-23 01:53:36', '2018-10-23 02:05:31');
INSERT INTO `cart_items` VALUES (25, NULL, 1, 1, '1', 2, 16, 30, '2018-10-23 01:54:47', '2018-10-23 02:05:31');
INSERT INTO `cart_items` VALUES (26, NULL, 1, 1, '1', 4, 38, 165, '2018-10-23 01:56:07', '2018-10-23 02:05:31');
INSERT INTO `cart_items` VALUES (27, NULL, 3, 1, '0', 0, 25, 54, '2018-10-23 01:58:31', '2018-10-23 02:12:05');
INSERT INTO `cart_items` VALUES (28, 'BE3ADE0F-E8B0-404D-92A6-B8748B260BB4', 3, 1, '0', 1, 22, 46, '2018-10-23 02:07:59', '2018-10-23 02:12:13');
INSERT INTO `cart_items` VALUES (29, 'BE3ADE0F-E8B0-404D-92A6-B8748B260BB4', 3, 1, '0', 1, 4, 5, '2018-10-23 02:09:47', '2018-10-23 02:12:16');
INSERT INTO `cart_items` VALUES (30, 'BE3ADE0F-E8B0-404D-92A6-B8748B260BB4', 3, 1, '0', 2, 38, 165, '2018-10-23 02:10:14', '2018-10-23 02:12:19');
INSERT INTO `cart_items` VALUES (31, 'BE3ADE0F-E8B0-404D-92A6-B8748B260BB4', 3, 1, '0', 1, 39, 168, '2018-10-23 02:10:37', '2018-10-23 02:12:20');
INSERT INTO `cart_items` VALUES (33, '1ceb5814-c1c2-4ab9-90da-5be88b314154', NULL, 1, '1', 1, 22, NULL, '2018-10-23 03:31:00', '2018-10-23 03:31:00');
INSERT INTO `cart_items` VALUES (34, 'cec0569eaaf10c43', NULL, 1, '1', 1, 9, 9, '2018-10-23 03:32:23', '2018-10-23 03:32:23');
INSERT INTO `cart_items` VALUES (35, 'cec0569eaaf10c43', NULL, 1, '1', 1, 22, 46, '2018-10-23 03:32:36', '2018-10-23 03:32:36');
INSERT INTO `cart_items` VALUES (36, NULL, 2, 1, '1', 1, 58, 230, '2018-10-23 03:56:16', '2018-10-23 06:44:31');
INSERT INTO `cart_items` VALUES (37, NULL, 2, 1, '0', 1, 9, NULL, '2018-10-23 03:57:51', '2018-10-23 06:44:31');
INSERT INTO `cart_items` VALUES (38, NULL, 2, 1, '1', 1, 13, 21, '2018-10-23 03:57:56', '2018-10-23 06:44:31');
INSERT INTO `cart_items` VALUES (40, NULL, 2, 1, '1', 2, 27, 58, '2018-10-23 07:26:59', '2018-10-23 09:43:45');
INSERT INTO `cart_items` VALUES (41, NULL, 2, 1, '1', 1, 84, 302, '2018-10-23 07:33:45', '2018-10-23 09:43:45');
INSERT INTO `cart_items` VALUES (42, 'fa0e7d30-10f5-4e04-8355-824dbde2ed92', NULL, 1, '1', 1, 22, NULL, '2018-10-23 08:43:06', '2018-10-23 08:43:06');
INSERT INTO `cart_items` VALUES (43, 'fa0e7d30-10f5-4e04-8355-824dbde2ed92', NULL, 1, '1', 2, 58, 230, '2018-10-23 08:43:13', '2018-10-23 08:43:13');
INSERT INTO `cart_items` VALUES (44, NULL, 2, 1, '1', 1, 22, 46, '2018-10-23 08:50:01', '2018-10-23 08:50:14');
INSERT INTO `cart_items` VALUES (45, NULL, 2, 1, '1', 1, 22, 47, '2018-10-23 09:08:24', '2018-10-24 06:34:35');
INSERT INTO `cart_items` VALUES (46, NULL, 2, 1, '1', 2, 4, 5, '2018-10-23 09:12:12', '2018-10-24 06:34:35');
INSERT INTO `cart_items` VALUES (47, NULL, 2, 1, '1', 2, 23, 50, '2018-10-23 09:12:25', '2018-10-24 06:34:35');
INSERT INTO `cart_items` VALUES (48, NULL, 4, 1, '1', 1, 26, 56, '2018-10-23 09:15:54', '2018-10-24 06:30:35');
INSERT INTO `cart_items` VALUES (49, NULL, 4, 1, '1', 1, 23, 49, '2018-10-23 09:16:24', '2018-10-24 06:30:35');
INSERT INTO `cart_items` VALUES (50, NULL, 2, 1, '0', 1, 26, NULL, '2018-10-23 10:34:15', '2018-10-24 06:34:44');
INSERT INTO `cart_items` VALUES (51, NULL, 2, 1, '0', 1, 83, NULL, '2018-10-23 10:34:33', '2018-10-24 06:34:45');
INSERT INTO `cart_items` VALUES (52, '9159a400-bbf5-47f1-a9e8-63399883a518', 2, 1, '1', 1, 67, 259, '2018-10-24 01:56:12', '2018-10-24 01:56:12');
INSERT INTO `cart_items` VALUES (53, '9159a400-bbf5-47f1-a9e8-63399883a518', 2, 1, '1', 1, 86, 306, '2018-10-24 01:56:56', '2018-10-24 01:57:21');
INSERT INTO `cart_items` VALUES (54, 'fa0e7d30-10f5-4e04-8355-824dbde2ed92', NULL, 1, '1', 1, 37, 163, '2018-10-24 02:09:13', '2018-10-24 02:09:13');
INSERT INTO `cart_items` VALUES (55, 'fa0e7d30-10f5-4e04-8355-824dbde2ed92', NULL, 1, '1', 1, 84, NULL, '2018-10-24 02:16:02', '2018-10-24 02:16:02');
INSERT INTO `cart_items` VALUES (56, '9159a400-bbf5-47f1-a9e8-63399883a518', 2, 1, '1', 3, 90, 313, '2018-10-24 06:22:02', '2018-10-24 06:22:02');
INSERT INTO `cart_items` VALUES (57, NULL, 4, 1, '1', 2, 57, 229, '2018-10-24 06:28:33', '2018-10-24 06:30:35');
INSERT INTO `cart_items` VALUES (58, 'f4696075-81fa-4d96-a6dc-d9bc6884772b', 6, 1, '1', 1, 22, 46, '2018-10-24 06:38:42', '2018-10-24 06:38:47');
COMMIT;

-- ----------------------------
-- Table structure for channel_currency
-- ----------------------------
DROP TABLE IF EXISTS `channel_currency`;
CREATE TABLE `channel_currency` (
  `channel_id` int(10) unsigned NOT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  KEY `channel_currency_channel_id_index` (`channel_id`),
  KEY `channel_currency_currency_id_index` (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of channel_currency
-- ----------------------------
BEGIN;
INSERT INTO `channel_currency` VALUES (1, 1);
COMMIT;

-- ----------------------------
-- Table structure for channel_deal
-- ----------------------------
DROP TABLE IF EXISTS `channel_deal`;
CREATE TABLE `channel_deal` (
  `channel_id` int(10) unsigned NOT NULL,
  `deal_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `channel_deal_channel_id_deal_id_unique` (`channel_id`,`deal_id`),
  KEY `channel_deal_channel_id_index` (`channel_id`),
  KEY `channel_deal_deal_id_index` (`deal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of channel_deal
-- ----------------------------
BEGIN;
INSERT INTO `channel_deal` VALUES (1, 1);
INSERT INTO `channel_deal` VALUES (1, 2);
INSERT INTO `channel_deal` VALUES (1, 3);
INSERT INTO `channel_deal` VALUES (1, 4);
COMMIT;

-- ----------------------------
-- Table structure for channel_locale
-- ----------------------------
DROP TABLE IF EXISTS `channel_locale`;
CREATE TABLE `channel_locale` (
  `channel_id` int(10) unsigned NOT NULL,
  `locale_id` int(10) unsigned NOT NULL,
  KEY `channel_locale_channel_id_index` (`channel_id`),
  KEY `channel_locale_locale_id_index` (`locale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of channel_locale
-- ----------------------------
BEGIN;
INSERT INTO `channel_locale` VALUES (1, 1);
COMMIT;

-- ----------------------------
-- Table structure for channel_payment_method
-- ----------------------------
DROP TABLE IF EXISTS `channel_payment_method`;
CREATE TABLE `channel_payment_method` (
  `channel_id` int(10) unsigned NOT NULL,
  `method_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `channel_payment_method_method_id_channel_id_unique` (`method_id`,`channel_id`),
  KEY `channel_payment_method_method_id_index` (`method_id`),
  KEY `channel_payment_method_channel_id_index` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of channel_payment_method
-- ----------------------------
BEGIN;
INSERT INTO `channel_payment_method` VALUES (1, 1);
COMMIT;

-- ----------------------------
-- Table structure for channel_product
-- ----------------------------
DROP TABLE IF EXISTS `channel_product`;
CREATE TABLE `channel_product` (
  `channel_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  KEY `channel_product_channel_id_index` (`channel_id`),
  KEY `channel_product_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of channel_product
-- ----------------------------
BEGIN;
INSERT INTO `channel_product` VALUES (1, 2);
INSERT INTO `channel_product` VALUES (1, 3);
INSERT INTO `channel_product` VALUES (1, 4);
INSERT INTO `channel_product` VALUES (1, 6);
INSERT INTO `channel_product` VALUES (1, 5);
INSERT INTO `channel_product` VALUES (1, 7);
INSERT INTO `channel_product` VALUES (1, 8);
INSERT INTO `channel_product` VALUES (1, 9);
INSERT INTO `channel_product` VALUES (1, 10);
INSERT INTO `channel_product` VALUES (1, 11);
INSERT INTO `channel_product` VALUES (1, 12);
INSERT INTO `channel_product` VALUES (1, 13);
INSERT INTO `channel_product` VALUES (1, 14);
INSERT INTO `channel_product` VALUES (1, 15);
INSERT INTO `channel_product` VALUES (1, 16);
INSERT INTO `channel_product` VALUES (1, 17);
INSERT INTO `channel_product` VALUES (1, 18);
INSERT INTO `channel_product` VALUES (1, 19);
INSERT INTO `channel_product` VALUES (1, 20);
INSERT INTO `channel_product` VALUES (1, 21);
INSERT INTO `channel_product` VALUES (1, 22);
INSERT INTO `channel_product` VALUES (1, 23);
INSERT INTO `channel_product` VALUES (1, 24);
INSERT INTO `channel_product` VALUES (1, 25);
INSERT INTO `channel_product` VALUES (1, 26);
INSERT INTO `channel_product` VALUES (1, 27);
INSERT INTO `channel_product` VALUES (1, 28);
INSERT INTO `channel_product` VALUES (1, 29);
INSERT INTO `channel_product` VALUES (1, 30);
INSERT INTO `channel_product` VALUES (1, 31);
INSERT INTO `channel_product` VALUES (1, 32);
INSERT INTO `channel_product` VALUES (1, 33);
INSERT INTO `channel_product` VALUES (1, 34);
INSERT INTO `channel_product` VALUES (1, 35);
INSERT INTO `channel_product` VALUES (1, 36);
INSERT INTO `channel_product` VALUES (1, 37);
INSERT INTO `channel_product` VALUES (1, 38);
INSERT INTO `channel_product` VALUES (1, 39);
INSERT INTO `channel_product` VALUES (1, 40);
INSERT INTO `channel_product` VALUES (1, 41);
INSERT INTO `channel_product` VALUES (1, 42);
INSERT INTO `channel_product` VALUES (1, 43);
INSERT INTO `channel_product` VALUES (1, 44);
INSERT INTO `channel_product` VALUES (1, 45);
INSERT INTO `channel_product` VALUES (1, 46);
INSERT INTO `channel_product` VALUES (1, 47);
INSERT INTO `channel_product` VALUES (1, 48);
INSERT INTO `channel_product` VALUES (1, 49);
INSERT INTO `channel_product` VALUES (1, 50);
INSERT INTO `channel_product` VALUES (1, 51);
INSERT INTO `channel_product` VALUES (1, 52);
INSERT INTO `channel_product` VALUES (1, 53);
INSERT INTO `channel_product` VALUES (1, 54);
INSERT INTO `channel_product` VALUES (1, 55);
INSERT INTO `channel_product` VALUES (1, 56);
INSERT INTO `channel_product` VALUES (1, 57);
INSERT INTO `channel_product` VALUES (1, 58);
INSERT INTO `channel_product` VALUES (1, 59);
INSERT INTO `channel_product` VALUES (1, 60);
INSERT INTO `channel_product` VALUES (1, 61);
INSERT INTO `channel_product` VALUES (1, 62);
INSERT INTO `channel_product` VALUES (1, 63);
INSERT INTO `channel_product` VALUES (1, 64);
INSERT INTO `channel_product` VALUES (1, 65);
INSERT INTO `channel_product` VALUES (1, 66);
INSERT INTO `channel_product` VALUES (1, 67);
INSERT INTO `channel_product` VALUES (1, 68);
INSERT INTO `channel_product` VALUES (1, 69);
INSERT INTO `channel_product` VALUES (1, 70);
INSERT INTO `channel_product` VALUES (1, 71);
INSERT INTO `channel_product` VALUES (1, 72);
INSERT INTO `channel_product` VALUES (1, 73);
INSERT INTO `channel_product` VALUES (1, 74);
INSERT INTO `channel_product` VALUES (1, 75);
INSERT INTO `channel_product` VALUES (1, 76);
INSERT INTO `channel_product` VALUES (1, 77);
INSERT INTO `channel_product` VALUES (1, 78);
INSERT INTO `channel_product` VALUES (1, 79);
INSERT INTO `channel_product` VALUES (1, 80);
INSERT INTO `channel_product` VALUES (1, 81);
INSERT INTO `channel_product` VALUES (1, 82);
INSERT INTO `channel_product` VALUES (1, 83);
INSERT INTO `channel_product` VALUES (1, 84);
INSERT INTO `channel_product` VALUES (1, 85);
INSERT INTO `channel_product` VALUES (1, 86);
INSERT INTO `channel_product` VALUES (1, 87);
INSERT INTO `channel_product` VALUES (1, 88);
INSERT INTO `channel_product` VALUES (1, 89);
INSERT INTO `channel_product` VALUES (1, 90);
COMMIT;

-- ----------------------------
-- Table structure for channel_promotion
-- ----------------------------
DROP TABLE IF EXISTS `channel_promotion`;
CREATE TABLE `channel_promotion` (
  `channel_id` int(10) unsigned NOT NULL,
  `promotion_id` int(10) unsigned NOT NULL,
  KEY `channel_promotion_channel_id_index` (`channel_id`),
  KEY `channel_promotion_promotion_id_index` (`promotion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of channel_promotion
-- ----------------------------
BEGIN;
INSERT INTO `channel_promotion` VALUES (1, 1);
INSERT INTO `channel_promotion` VALUES (1, 2);
INSERT INTO `channel_promotion` VALUES (1, 3);
INSERT INTO `channel_promotion` VALUES (1, 4);
COMMIT;

-- ----------------------------
-- Table structure for channel_shipping_method
-- ----------------------------
DROP TABLE IF EXISTS `channel_shipping_method`;
CREATE TABLE `channel_shipping_method` (
  `channel_id` int(10) unsigned NOT NULL,
  `method_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `channel_shipping_method_method_id_channel_id_unique` (`method_id`,`channel_id`),
  KEY `channel_shipping_method_channel_id_index` (`channel_id`),
  KEY `channel_shipping_method_method_id_index` (`method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of channel_shipping_method
-- ----------------------------
BEGIN;
INSERT INTO `channel_shipping_method` VALUES (1, 1);
COMMIT;

-- ----------------------------
-- Table structure for channels
-- ----------------------------
DROP TABLE IF EXISTS `channels`;
CREATE TABLE `channels` (
  `deleted_at` timestamp NULL DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channels_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of channels
-- ----------------------------
BEGIN;
INSERT INTO `channels` VALUES (NULL, 1, 'en-US', 'USD', 'default_shop', '默认商店', NULL, 1, 'ay1101140857@gmail.com', NULL, '2018-10-19 06:48:01');
COMMIT;

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `countries_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of countries
-- ----------------------------
BEGIN;
INSERT INTO `countries` VALUES (1, 'AS', 1, '2018-10-22 07:15:20', '2018-10-22 07:15:23');
INSERT INTO `countries` VALUES (2, 'CN', 1, '2018-10-22 07:15:58', '2018-10-22 07:16:00');
INSERT INTO `countries` VALUES (3, 'AU', 1, '2018-10-22 07:16:18', '2018-10-22 07:16:20');
COMMIT;

-- ----------------------------
-- Table structure for coupons
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `promotion_coupon_id` int(10) unsigned NOT NULL,
  `promotion_id` int(10) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '优惠卷码',
  `used_at` timestamp NULL DEFAULT NULL COMMENT '使用日期',
  `began_at` timestamp NULL DEFAULT NULL COMMENT '可是使用日期/ 通过coupon config 计算',
  `ended_at` timestamp NULL DEFAULT NULL COMMENT '截止使用日期/ 通过coupon config 计算',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupons_code_unique` (`code`),
  KEY `coupons_order_id_index` (`order_id`),
  KEY `coupons_user_id_index` (`user_id`),
  KEY `coupons_channel_id_index` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of coupons
-- ----------------------------
BEGIN;
INSERT INTO `coupons` VALUES (1, 2, NULL, 1, 5, 4, 'cash-105bcfdf5fe343b', NULL, '2018-10-15 16:00:00', '2018-11-29 16:00:00', '2018-10-24 02:56:31', '2018-10-24 02:56:31');
INSERT INTO `coupons` VALUES (2, 2, NULL, 1, 3, 2, 'full-50-minus-205bcfe1e1946f3', NULL, '2018-10-21 16:00:00', '2018-11-29 16:00:00', '2018-10-24 03:07:13', '2018-10-24 03:07:13');
INSERT INTO `coupons` VALUES (3, 4, NULL, 1, 5, 4, 'cash-105bcfe3c4e0647', NULL, '2018-10-15 16:00:00', '2018-11-29 16:00:00', '2018-10-24 03:15:16', '2018-10-24 03:15:16');
INSERT INTO `coupons` VALUES (4, 4, NULL, 1, 4, 3, 'cash-55bcfe5337e2da', NULL, '2018-10-24 03:21:23', '2018-11-13 03:21:23', '2018-10-24 03:21:23', '2018-10-24 03:21:23');
INSERT INTO `coupons` VALUES (5, 4, NULL, 1, 3, 2, 'full-50-minus-205bcfe649e2a56', NULL, '2018-10-21 16:00:00', '2018-11-29 16:00:00', '2018-10-24 03:26:01', '2018-10-24 07:15:55');
INSERT INTO `coupons` VALUES (6, 4, NULL, 1, 2, 1, 'full-100-minus-205bcfe680935f6', NULL, '2018-10-24 03:26:56', '2018-11-23 03:26:56', '2018-10-24 03:26:56', '2018-10-24 03:26:56');
INSERT INTO `coupons` VALUES (7, 5, NULL, 1, 5, 4, 'cash-105bcfe88724042', NULL, '2018-10-15 16:00:00', '2018-11-29 16:00:00', '2018-10-24 03:35:35', '2018-10-24 03:35:35');
INSERT INTO `coupons` VALUES (8, 5, NULL, 1, 4, 3, 'cash-55bcfe8aff29d6', NULL, '2018-10-24 03:36:15', '2018-11-13 03:36:15', '2018-10-24 03:36:15', '2018-10-24 07:43:38');
INSERT INTO `coupons` VALUES (9, 5, NULL, 1, 3, 2, 'full-50-minus-205bcfe92ec3767', NULL, '2018-10-21 16:00:00', '2018-11-29 16:00:00', '2018-10-24 03:38:22', '2018-10-24 03:38:22');
INSERT INTO `coupons` VALUES (10, 5, NULL, 1, 2, 1, 'full-100-minus-205bcfe99a66bf4', NULL, '2018-10-24 03:40:10', '2018-11-23 03:40:10', '2018-10-24 03:40:10', '2018-10-24 03:40:10');
INSERT INTO `coupons` VALUES (11, 6, NULL, 1, 5, 4, 'cash-105bcfea4acd23b', NULL, '2018-10-15 16:00:00', '2018-11-29 16:00:00', '2018-10-24 03:43:06', '2018-10-24 07:43:09');
INSERT INTO `coupons` VALUES (12, 6, NULL, 1, 4, 3, 'cash-55bcfeb390419a', NULL, '2018-10-24 03:47:05', '2018-11-13 03:47:05', '2018-10-24 03:47:05', '2018-10-24 07:27:27');
INSERT INTO `coupons` VALUES (13, 6, NULL, 1, 3, 2, 'full-50-minus-205bcfeb712e995', NULL, '2018-10-21 16:00:00', '2018-11-29 16:00:00', '2018-10-24 03:48:01', '2018-10-24 03:48:01');
INSERT INTO `coupons` VALUES (14, 6, NULL, 1, 2, 1, 'full-100-minus-205bcfeb73af0bb', NULL, '2018-10-24 03:48:03', '2018-11-23 03:48:03', '2018-10-24 03:48:03', '2018-10-24 03:48:03');
COMMIT;

-- ----------------------------
-- Table structure for currencies
-- ----------------------------
DROP TABLE IF EXISTS `currencies`;
CREATE TABLE `currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currencies_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of currencies
-- ----------------------------
BEGIN;
INSERT INTO `currencies` VALUES (1, 'USD', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for deal_translations
-- ----------------------------
DROP TABLE IF EXISTS `deal_translations`;
CREATE TABLE `deal_translations` (
  `translatable_id` int(10) unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `items` json DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '优先通过该字段检索',
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `unique_tl` (`translatable_id`,`locale_code`),
  UNIQUE KEY `unique_ls` (`locale_code`,`slug`),
  KEY `deal_translations_translatable_id_index` (`translatable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of deal_translations
-- ----------------------------
BEGIN;
INSERT INTO `deal_translations` VALUES (1, 'http://pbfh6sbp9.bkt.clouddn.com/zTz8HKEK215cxfyQqYqiM47Pn44hegG5ZhOtq4Zs.jpeg', 'Double 11', '', '', 'Double 11', NULL, '[{\"image\": \"http://pbfh6sbp9.bkt.clouddn.com/Y8va7nxBP0r2oaZH1fIAsv8cvb59Clkd0Zgk3q7u.png\", \"product_id\": 87, \"description\": \"Ice and fire magic subdivision thermos cup\"}]', 'double-11', NULL, NULL, NULL, 'en-US', '2018-10-22 10:31:54', '2018-10-22 10:34:51');
INSERT INTO `deal_translations` VALUES (2, 'http://pbfh6sbp9.bkt.clouddn.com/Fg8yZGrlsf0wWfcDpAdIrMctsglE', 'Bestkit 618', 'http://pbfh6sbp9.bkt.clouddn.com/FleJmP0j-A1VjtRJ9l5tYDAFyWlY', '', 'There are all kinds of discounts and promotions', NULL, '[{\"image\": \"http://pbfh6sbp9.bkt.clouddn.com/Ftf5RuDW74uKEKjtcCiTwUSvincD\", \"product\": {\"id\": 84, \"code\": \"double-color-double-sided-absorbent-dish-cloth-oil-wipe-towel-thickened-cloth-wipe-table-cloth-kitchen-ragdouble-color-double-sided-absorbent-dish-cloth-oil-wipe-towel-thickened-cloth-wipe-table-cloth-kitchen-rag\", \"name\": \"Double color double sided absorbent dish cloth oil wipe towel thickened cloth wipe table cloth kitchen ragdouble color double sided absorbent dish cloth oil wipe towel thickened cloth wipe table cloth kitchen rag\", \"slug\": \"double-color-double-sided-absorbent-dish-cloth-oil-wipe-towel-thickened-cloth-wipe-table-cloth-kitchen-ragdouble-color-double-sided-absorbent-dish-cloth-oil-wipe-towel-thickened-cloth-wipe-table-cloth-kitchen-rag\", \"variant\": {\"price\": 2010, \"deal_price\": null, \"original_price\": 3510}}, \"product_id\": 84, \"description\": \"Double color double sided absorbent dish cloth oil wipe towel thickened cloth wipe table cloth kitchen ragdouble color double sided absorbent dish cloth oil wipe towel thickened cloth wipe table cloth kitchen rag.\\nColor double sided absorbent dish cloth oil wipe towel thickened cloth wipe table cloth kitchen ragdouble color double sided absorbent dish cloth oil wipe towel thickened cloth wipe table cloth kitchen rag\"}, {\"image\": \"http://pbfh6sbp9.bkt.clouddn.com/FmNupmYjZ43cdynMy9vnT68CwBQu\", \"product\": {\"id\": 86, \"code\": \"kitchen-brush-pan-brush-creative-soap-brush-hand-soap-brush-press-on-the-pan-and-wash-the-dishes\", \"name\": \"Kitchen brush pan brush creative soap brush hand soap brush press on the pan and wash the dishes\", \"slug\": \"kitchen-brush-pan-brush-creative-soap-brush-hand-soap-brush-press-on-the-pan-and-wash-the-dishes\", \"variant\": {\"price\": 2296, \"deal_price\": null, \"original_price\": 3796}}, \"product_id\": 86, \"description\": \"Kitchen brush pan brush creative soap brush hand soap brush press on the pan and wash the dishes\"}, {\"image\": \"http://pbfh6sbp9.bkt.clouddn.com/Fl51yWYeWXyMmAhLSoxyq5EQxlHr\", \"product_id\": 82, \"description\": \"Original wood too round wooden cutting board solid wood healthy cutting board multi functional environmental protection mould proof wooden kitchen cutting board\"}]', 'bestkit-618', NULL, NULL, NULL, 'en-US', '2018-10-23 06:49:26', '2018-10-23 07:17:40');
INSERT INTO `deal_translations` VALUES (3, 'http://pbfh6sbp9.bkt.clouddn.com/Fv-bIOkc-fmFc7-EicXJGbx1D8-g', 'Domestic Outfit', 'http://pbfh6sbp9.bkt.clouddn.com/FtmZyDzBd2BZN-0X_n1rmYFRYQfg', '', 'Domestic Outfit There are huge advantages', NULL, '[{\"image\": \"http://pbfh6sbp9.bkt.clouddn.com/FtwaA72vJ4Fq6qysMIwA4GgwdyCD\", \"product\": {\"id\": 85, \"code\": \"nylon-pot-brush-with-long-handle-wood-does-not-hurt-the-pot-brush-does-not-stick-oil-wash-dishes-wash-creative-brush\", \"name\": \"Nylon pot brush with long handle wood does not hurt the pot brush does not stick oil wash dishes wash creative brush\", \"slug\": \"nylon-pot-brush-with-long-handle-wood-does-not-hurt-the-pot-brush-does-not-stick-oil-wash-dishes-wash-creative-brush\", \"variant\": {\"price\": 2224, \"deal_price\": null, \"original_price\": 3724}}, \"product_id\": 85, \"description\": \"Nylon pot brush with long handle wood does not hurt the pot brush does not stick oil wash dishes wash creative brush\"}]', 'domestic-outfit', NULL, NULL, NULL, 'en-US', '2018-10-23 07:27:18', '2018-10-23 07:52:39');
INSERT INTO `deal_translations` VALUES (4, 'http://pbfh6sbp9.bkt.clouddn.com/FjV6ils7z3eSrdTghxu43Hf6nqzy', 'Outdoor Sports', '', '', 'A very affordable event', NULL, '[{\"image\": \"http://pbfh6sbp9.bkt.clouddn.com/FpehhkDW3UTEMgaCQFiy5XNRlzDq\", \"product_id\": 86, \"description\": \"A very useful product\"}]', 'outdoor-sports', NULL, NULL, NULL, 'en-US', '2018-10-23 07:53:34', '2018-10-23 07:55:15');
COMMIT;

-- ----------------------------
-- Table structure for deals
-- ----------------------------
DROP TABLE IF EXISTS `deals`;
CREATE TABLE `deals` (
  `deleted_at` timestamp NULL DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `began_at` timestamp NULL DEFAULT NULL,
  `ended_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of deals
-- ----------------------------
BEGIN;
INSERT INTO `deals` VALUES (NULL, 2, 'bestkit-618', 0, '2018-10-07 16:00:00', '2018-11-29 16:00:00', '2018-10-23 06:47:55', '2018-10-23 06:49:26');
INSERT INTO `deals` VALUES (NULL, 3, 'domestic outfit', 0, '2018-10-21 16:00:00', '2018-11-29 16:00:00', '2018-10-23 07:23:24', '2018-10-23 07:27:18');
INSERT INTO `deals` VALUES (NULL, 4, 'outdoor-sports', 0, '2018-10-21 16:00:00', '2018-11-29 16:00:00', '2018-10-23 07:53:25', '2018-10-23 07:53:34');
COMMIT;

-- ----------------------------
-- Table structure for exchange_rates
-- ----------------------------
DROP TABLE IF EXISTS `exchange_rates`;
CREATE TABLE `exchange_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for gateway_configs
-- ----------------------------
DROP TABLE IF EXISTS `gateway_configs`;
CREATE TABLE `gateway_configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_method_id` int(10) unsigned NOT NULL,
  `gateway_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `factory_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of gateway_configs
-- ----------------------------
BEGIN;
INSERT INTO `gateway_configs` VALUES (1, 1, 'paipay_checkout', 'paypal_express_checkout', '{\"sandbox\": true, \"password\": \"CBQ33T7AA39Q6FJ4\", \"username\": \"1101140857-facilitator-1_api1.qq.com\", \"signature\": \"A.DdylXDZAeOcQPbztqMY48DyXc2AbOusTP0jYYcmAeVty3IbQHLhE-i\"}', NULL, '2018-10-23 02:32:38');
COMMIT;

-- ----------------------------
-- Table structure for locales
-- ----------------------------
DROP TABLE IF EXISTS `locales`;
CREATE TABLE `locales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locales_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of locales
-- ----------------------------
BEGIN;
INSERT INTO `locales` VALUES (1, 'en-US', NULL, NULL);
INSERT INTO `locales` VALUES (2, 'zh_CN', '2018-10-24 16:25:54', '2018-10-24 16:27:17');
INSERT INTO `locales` VALUES (3, 'zh-Hans-CN', '2018-10-24 08:58:21', '2018-10-24 08:58:21');
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1556 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1491, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (1492, '2018_06_01_061448_create_channels_table', 1);
INSERT INTO `migrations` VALUES (1493, '2018_06_20_094444_create_cart_items_table', 1);
INSERT INTO `migrations` VALUES (1494, '2018_06_21_090517_create_orders_table', 1);
INSERT INTO `migrations` VALUES (1495, '2018_06_21_091730_create_order_items_table', 1);
INSERT INTO `migrations` VALUES (1496, '2018_06_21_091740_create_order_item_units_table', 1);
INSERT INTO `migrations` VALUES (1497, '2018_06_22_095626_create_promotion_coupons_table', 1);
INSERT INTO `migrations` VALUES (1498, '2018_06_22_102056_create_promotion_coupon_translations_table', 1);
INSERT INTO `migrations` VALUES (1499, '2018_06_22_102628_create_coupons_table', 1);
INSERT INTO `migrations` VALUES (1500, '2018_06_25_033653_create_promotions_table', 1);
INSERT INTO `migrations` VALUES (1501, '2018_06_25_035912_create_user_groups_table', 1);
INSERT INTO `migrations` VALUES (1502, '2018_06_25_035938_create_user_group_user_table', 1);
INSERT INTO `migrations` VALUES (1503, '2018_06_25_061551_create_addresses_table', 1);
INSERT INTO `migrations` VALUES (1504, '2018_06_25_105144_create_product_reviews_table', 1);
INSERT INTO `migrations` VALUES (1505, '2018_06_26_061501_create_locales_table', 1);
INSERT INTO `migrations` VALUES (1506, '2018_06_26_061546_create_channel_locale_table', 1);
INSERT INTO `migrations` VALUES (1507, '2018_06_26_063047_create_countries_table', 1);
INSERT INTO `migrations` VALUES (1508, '2018_06_26_063108_create_provinces_table', 1);
INSERT INTO `migrations` VALUES (1509, '2018_06_26_063213_create_payment_security_tokens_table', 1);
INSERT INTO `migrations` VALUES (1510, '2018_06_26_064252_create_currencies_table', 1);
INSERT INTO `migrations` VALUES (1511, '2018_06_26_064310_create_channel_currency_table', 1);
INSERT INTO `migrations` VALUES (1512, '2018_06_26_064323_create_exchange_rates_table', 1);
INSERT INTO `migrations` VALUES (1513, '2018_06_26_065052_create_promotion_order_table', 1);
INSERT INTO `migrations` VALUES (1514, '2018_06_26_065246_create_channel_promotion_table', 1);
INSERT INTO `migrations` VALUES (1515, '2018_06_26_065418_create_payments_table', 1);
INSERT INTO `migrations` VALUES (1516, '2018_06_26_065428_create_payment_methods_table', 1);
INSERT INTO `migrations` VALUES (1517, '2018_06_26_065439_create_channel_payment_method_table', 1);
INSERT INTO `migrations` VALUES (1518, '2018_06_26_070723_create_payment_method_translations_table', 1);
INSERT INTO `migrations` VALUES (1519, '2018_06_26_073003_create_shipments_table', 1);
INSERT INTO `migrations` VALUES (1520, '2018_06_26_073028_create_shipping_methods_table', 1);
INSERT INTO `migrations` VALUES (1521, '2018_06_26_073040_create_shipping_method_translations_table', 1);
INSERT INTO `migrations` VALUES (1522, '2018_06_26_073105_create_channel_shipping_method_table', 1);
INSERT INTO `migrations` VALUES (1523, '2018_06_26_083114_create_shipping_categories_table', 1);
INSERT INTO `migrations` VALUES (1524, '2018_06_26_083455_create_adjustments_table', 1);
INSERT INTO `migrations` VALUES (1525, '2018_06_26_085231_create_zones_table', 1);
INSERT INTO `migrations` VALUES (1526, '2018_06_26_090720_create_zone_members_table', 1);
INSERT INTO `migrations` VALUES (1527, '2018_06_26_095556_create_products_table', 1);
INSERT INTO `migrations` VALUES (1528, '2018_06_26_100344_create_product_translations_table', 1);
INSERT INTO `migrations` VALUES (1529, '2018_06_26_101637_create_product_attribute_translations_table', 1);
INSERT INTO `migrations` VALUES (1530, '2018_06_26_101652_create_product_attributes_table', 1);
INSERT INTO `migrations` VALUES (1531, '2018_06_26_101659_create_product_attribute_values_table', 1);
INSERT INTO `migrations` VALUES (1532, '2018_06_27_032823_create_product_images_table', 1);
INSERT INTO `migrations` VALUES (1533, '2018_06_27_033700_create_taxons_table', 1);
INSERT INTO `migrations` VALUES (1534, '2018_06_27_033737_create_channel_product_table', 1);
INSERT INTO `migrations` VALUES (1535, '2018_06_27_060526_create_taxon_translations_table', 1);
INSERT INTO `migrations` VALUES (1536, '2018_06_27_061121_create_product_taxon_table', 1);
INSERT INTO `migrations` VALUES (1537, '2018_06_27_061648_create_product_options_table', 1);
INSERT INTO `migrations` VALUES (1538, '2018_06_27_061723_create_product_option_translations_table', 1);
INSERT INTO `migrations` VALUES (1539, '2018_06_27_061912_create_product_product_option_table', 1);
INSERT INTO `migrations` VALUES (1540, '2018_06_27_061937_create_product_variants_table', 1);
INSERT INTO `migrations` VALUES (1541, '2018_06_27_061948_create_product_variant_translations_table', 1);
INSERT INTO `migrations` VALUES (1542, '2018_06_27_063827_create_product_option_values_table', 1);
INSERT INTO `migrations` VALUES (1543, '2018_06_27_064336_create_product_option_value_translations_table', 1);
INSERT INTO `migrations` VALUES (1544, '2018_06_27_071950_create_product_variant_prices_table', 1);
INSERT INTO `migrations` VALUES (1545, '2018_06_27_104418_create_product_variant_option_value_table', 1);
INSERT INTO `migrations` VALUES (1546, '2018_06_28_081120_create_videos_table', 1);
INSERT INTO `migrations` VALUES (1547, '2018_07_26_033424_create_promotion_rules_table', 1);
INSERT INTO `migrations` VALUES (1548, '2018_07_26_033436_create_promotion_actions_table', 1);
INSERT INTO `migrations` VALUES (1549, '2018_07_26_104912_create_deals_table', 1);
INSERT INTO `migrations` VALUES (1550, '2018_07_27_074907_create_gateway_configs_table', 1);
INSERT INTO `migrations` VALUES (1551, '2018_08_13_014312_create_feedback_table', 1);
INSERT INTO `migrations` VALUES (1552, '2018_08_21_024644_create_deal_translations_table', 1);
INSERT INTO `migrations` VALUES (1553, '2018_08_21_025034_create_channel_deal_table', 1);
INSERT INTO `migrations` VALUES (1554, '2018_08_27_083226_create_product_related_product_table', 1);
INSERT INTO `migrations` VALUES (1555, '2018_08_31_160209_create_admins_table', 1);
COMMIT;

-- ----------------------------
-- Table structure for order_item_units
-- ----------------------------
DROP TABLE IF EXISTS `order_item_units`;
CREATE TABLE `order_item_units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `shipment_id` int(10) unsigned NOT NULL COMMENT '运输号id',
  `adjustments_total` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_item_units
-- ----------------------------
BEGIN;
INSERT INTO `order_item_units` VALUES (70, 72, 27, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (71, 73, 27, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (72, 74, 27, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (73, 75, 28, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (74, 76, 29, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (94, 87, 32, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (95, 88, 32, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (96, 89, 32, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (97, 89, 32, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (98, 90, 32, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (113, 95, 34, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (114, 95, 34, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (115, 95, 34, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (116, 95, 34, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (135, 111, 38, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (136, 111, 38, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (137, 112, 38, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (138, 113, 38, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (139, 114, 38, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (140, 115, 38, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (141, 115, 38, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (142, 116, 38, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (143, 116, 38, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (144, 117, 38, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (145, 118, 38, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (146, 119, 38, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (147, 120, 38, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (148, 121, 38, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (149, 121, 38, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (150, 121, 38, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (159, 128, 41, 0, NULL, '2018-10-24 07:43:39');
INSERT INTO `order_item_units` VALUES (160, 129, 41, 0, NULL, '2018-10-24 07:43:39');
INSERT INTO `order_item_units` VALUES (161, 130, 41, 0, NULL, '2018-10-24 07:43:39');
INSERT INTO `order_item_units` VALUES (162, 130, 41, 0, NULL, '2018-10-24 07:43:39');
INSERT INTO `order_item_units` VALUES (164, 132, 43, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (165, 133, 44, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (166, 133, 44, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (167, 133, 44, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (168, 133, 44, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (169, 134, 44, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (170, 134, 44, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (171, 134, 44, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (172, 134, 44, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (173, 135, 44, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (174, 135, 44, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (175, 136, 44, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (176, 136, 44, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (177, 136, 44, 0, NULL, NULL);
INSERT INTO `order_item_units` VALUES (178, 136, 44, 0, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cart_item_id` tinyint(3) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `variant_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `units_total` int(11) NOT NULL DEFAULT '0' COMMENT 'unit/分 unit表adjustments_total + unit_price*quantity',
  `adjustments_total` int(11) NOT NULL DEFAULT '0' COMMENT '调整总数/通常促销活动需要下发到units中',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT 'units_total + adjustments_total',
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_price` int(11) NOT NULL DEFAULT '0' COMMENT '单价/冗余字段',
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品名称/冗余字段',
  `option_values` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '冗余销售属性',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片/变体图片/冗余字段',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_cart_item_id_index` (`cart_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_items
-- ----------------------------
BEGIN;
INSERT INTO `order_items` VALUES (72, 18, 36, 36, 18, 1, 1966, 0, 1966, 'bcase-is-a-different-selfie-stick', 'bcase-is-a-different-selfie-stick', 1966, 'Bcase is a different selfie stick', '[\"Yellow\"]', 'http://pbfh6sbp9.bkt.clouddn.com/lElzseUWRDuI1Z2xhe3Ljhw8xnkkbPgQwXO9l7ub.png', '2018-10-22 09:20:04', '2018-10-22 09:20:04');
INSERT INTO `order_items` VALUES (73, 19, 36, 58, 27, 1, 1028, 0, 1028, 'a-cotton-face-towel', 'a-cotton-face-towel', 1028, 'A cotton face towel', '[]', 'http://pbfh6sbp9.bkt.clouddn.com/5SKK3uPRPIQpQm7YgSqiNe4r3q3n5KLXKKwedt2S.png', '2018-10-22 09:20:04', '2018-10-22 09:20:04');
INSERT INTO `order_items` VALUES (74, 20, 36, 46, 22, 1, 2028, 0, 2028, 'portable-wireless-bluetooth-speaker', 'portable-wireless-bluetooth-speaker', 2028, 'Portable wireless bluetooth speaker', '[\"Red\"]', 'http://pbfh6sbp9.bkt.clouddn.com/RIw0RmfNAOY2i304LqJrue7fGO4lagICs8QbZNT8.png', '2018-10-22 09:20:04', '2018-10-22 09:20:04');
INSERT INTO `order_items` VALUES (75, 21, 37, 35, 18, 1, 1900, 0, 1900, 'bcase-is-a-different-selfie-stick', 'bcase-is-a-different-selfie-stick', 1900, 'Bcase is a different selfie stick', '[\"Green\"]', 'http://pbfh6sbp9.bkt.clouddn.com/lElzseUWRDuI1Z2xhe3Ljhw8xnkkbPgQwXO9l7ub.png', '2018-10-22 09:36:10', '2018-10-22 09:36:10');
INSERT INTO `order_items` VALUES (76, 22, 38, 7, 7, 1, 5742, 0, 5742, 'toolbox-set', 'toolbox-set', 5742, 'Toolbox set', '[\"black\"]', 'http://pbfh6sbp9.bkt.clouddn.com/etEgC7W3vqCZRgHkwO8kpkMGFcK2tuWG3wdXrdt8.jpeg', '2018-10-22 09:48:32', '2018-10-22 09:48:32');
INSERT INTO `order_items` VALUES (86, 27, 41, 54, 25, 0, 0, 0, 0, 'small-procedure-body-fat-scale', 'small-procedure-body-fat-scale', 2400, 'Small procedure body fat scale', '[]', 'http://pbfh6sbp9.bkt.clouddn.com/MZ40Tbp8z28zTluzJC9UvEnmGprVKcROqWMqdyK8.png', '2018-10-23 02:11:41', '2018-10-23 02:11:41');
INSERT INTO `order_items` VALUES (87, 28, 41, 46, 22, 1, 2028, 0, 2028, 'portable-wireless-bluetooth-speaker', 'portable-wireless-bluetooth-speaker', 2028, 'Portable wireless bluetooth speaker', '[\"Red\"]', 'http://pbfh6sbp9.bkt.clouddn.com/RIw0RmfNAOY2i304LqJrue7fGO4lagICs8QbZNT8.png', '2018-10-23 02:11:41', '2018-10-23 02:11:41');
INSERT INTO `order_items` VALUES (88, 29, 41, 5, 4, 1, 4025, 0, 4025, 'Intelligent-bilateral-electric-breast-pump-breast-pump', 'Intelligent-bilateral-electric-breast-pump-breast-pump', 4025, 'Intelligent bilateral electric breast pump breast pump', '[\"bilateral\"]', 'http://pbfh6sbp9.bkt.clouddn.com/sQlVK9dZ68MAbfB0uwtsiT1yi8UBHBU2icnIXhq6.jpeg', '2018-10-23 02:11:41', '2018-10-23 02:11:41');
INSERT INTO `order_items` VALUES (89, 30, 41, 165, 38, 2, 11598, 0, 11598, 'the-antarctic-peoples-60-satins-long-plush-cotton-four-piece-cotton-plain-womens-bed-sheet-and-quilt-cover-20m-bedding', 'the-antarctic-peoples-60-satins-long-plush-cotton-four-piece-cotton-plain-womens-bed-sheet-and-quilt-cover-20m-bedding', 5799, 'The antarctic peoples 60 satins long plush cotton four piece cotton plain womens bed sheet and quilt cover 20m bedding', '[\"15m 5ft bedding covers\"]', 'http://pbfh6sbp9.bkt.clouddn.com/y2gQAuCaLKf5rmQg58hgOh1ExtyEZWsnGSd2ALwn.png', '2018-10-23 02:11:41', '2018-10-23 02:11:41');
INSERT INTO `order_items` VALUES (90, 31, 41, 168, 39, 1, 3468, 0, 3468, 'non-printed-cotton-acorns-embroidered-plaid-washed-cotton-fine-cotton-four-piece-sheet-bed-bonnets', 'non-printed-cotton-acorns-embroidered-plaid-washed-cotton-fine-cotton-four-piece-sheet-bed-bonnets', 3468, 'Non printed cotton acorns embroidered plaid washed cotton fine cotton four piece sheet bed bonnets', '[\"Gray\"]', 'http://pbfh6sbp9.bkt.clouddn.com/9sWqhsIleLNdSmhdbkbsmk8EtvO2TqCWZid7HPMy.png', '2018-10-23 02:11:41', '2018-10-23 02:11:41');
INSERT INTO `order_items` VALUES (95, 39, 43, 47, 22, 4, 8000, 0, 8000, 'portable-wireless-bluetooth-speaker', 'portable-wireless-bluetooth-speaker', 2000, 'Portable wireless bluetooth speaker', '[\"Blue\"]', 'http://pbfh6sbp9.bkt.clouddn.com/RIw0RmfNAOY2i304LqJrue7fGO4lagICs8QbZNT8.png', '2018-10-23 06:18:56', '2018-10-23 06:18:56');
INSERT INTO `order_items` VALUES (111, 46, 47, 5, 4, 2, 7996, 0, 7996, 'Intelligent-bilateral-electric-breast-pump-breast-pump', 'Intelligent-bilateral-electric-breast-pump-breast-pump', 3998, 'Intelligent bilateral electric breast pump breast pump', '[\"bilateral\"]', 'http://pbfh6sbp9.bkt.clouddn.com/sQlVK9dZ68MAbfB0uwtsiT1yi8UBHBU2icnIXhq6.jpeg', '2018-10-24 06:34:54', '2018-10-24 06:34:54');
INSERT INTO `order_items` VALUES (112, 38, 47, 21, 13, 1, 1395, 0, 1395, 'corbo-light-and-thin-aesthetic-nail-clippers', 'corbo-light-and-thin-aesthetic-nail-clippers', 1395, 'Corbo light and thin aesthetic nail clippers', '[\"black\"]', 'http://pbfh6sbp9.bkt.clouddn.com/84HxCBM5jlBMPdmDSbPypLzSRm17KLtnNzh8AJ4h.png', '2018-10-24 06:34:54', '2018-10-24 06:34:54');
INSERT INTO `order_items` VALUES (113, 44, 47, 46, 22, 1, 1688, 0, 1688, 'portable-wireless-bluetooth-speaker', 'portable-wireless-bluetooth-speaker', 1688, 'Portable wireless bluetooth speaker', '[\"Red\"]', 'http://pbfh6sbp9.bkt.clouddn.com/RIw0RmfNAOY2i304LqJrue7fGO4lagICs8QbZNT8.png', '2018-10-24 06:34:54', '2018-10-24 06:34:54');
INSERT INTO `order_items` VALUES (114, 45, 47, 47, 22, 1, 2059, 0, 2059, 'portable-wireless-bluetooth-speaker', 'portable-wireless-bluetooth-speaker', 2059, 'Portable wireless bluetooth speaker', '[\"Blue\"]', 'http://pbfh6sbp9.bkt.clouddn.com/RIw0RmfNAOY2i304LqJrue7fGO4lagICs8QbZNT8.png', '2018-10-24 06:34:54', '2018-10-24 06:34:54');
INSERT INTO `order_items` VALUES (115, 47, 47, 50, 23, 2, 8600, 0, 8600, 'mondrian-music-canvas-wireless-bluetooth-speaker', 'mondrian-music-canvas-wireless-bluetooth-speaker', 4300, 'Mondrian music canvas wireless bluetooth speaker', '[\"Blue\"]', 'http://pbfh6sbp9.bkt.clouddn.com/OBGetGuiq0NlJLevtEMpamEHhFMAE5BKNB3gDgxt.png', '2018-10-24 06:34:54', '2018-10-24 06:34:54');
INSERT INTO `order_items` VALUES (116, 40, 47, 58, 27, 2, 2056, 0, 2056, 'a-cotton-face-towel', 'a-cotton-face-towel', 1028, 'A cotton face towel', '[]', 'http://pbfh6sbp9.bkt.clouddn.com/5SKK3uPRPIQpQm7YgSqiNe4r3q3n5KLXKKwedt2S.png', '2018-10-24 06:34:54', '2018-10-24 06:34:54');
INSERT INTO `order_items` VALUES (117, 36, 47, 230, 58, 1, 4315, 0, 4315, 'add-water-to-the-humidifier-on-the-delmar-purification', 'add-water-to-the-humidifier-on-the-delmar-purification', 4315, 'Add water to the humidifier on the delmar purification', '[]', 'http://pbfh6sbp9.bkt.clouddn.com/y72gIXntSvvnURLZcTXeGkx9r7ohiojZjtIQcJGS.png', '2018-10-24 06:34:54', '2018-10-24 06:34:54');
INSERT INTO `order_items` VALUES (118, 52, 47, 259, 67, 1, 805, 0, 805, 'lena-hair-straightening-rollers', 'lena-hair-straightening-rollers', 805, 'Lena hair straightening rollers', '[]', 'http://pbfh6sbp9.bkt.clouddn.com/056Wii2vIsr93Xt6VT8kLH0IgI0ctk9RaKKXQFpJ.png', '2018-10-24 06:34:54', '2018-10-24 06:34:54');
INSERT INTO `order_items` VALUES (119, 41, 47, 302, 84, 1, 1974, 0, 1974, 'double-color-double-sided-absorbent-dish-cloth-oil-wipe-towel-thickened-cloth-wipe-table-cloth-kitchen-ragdouble-color-double-sided-absorbent-dish-cloth-oil-wipe-towel-thickened-cloth-wipe-table-cloth-kitchen-rag', 'double-color-double-sided-absorbent-dish-cloth-oil-wipe-towel-thickened-cloth-wipe-table-cloth-kitchen-ragdouble-color-double-sided-absorbent-dish-cloth-oil-wipe-towel-thickened-cloth-wipe-table-cloth-kitchen-rag', 1974, 'Double color double sided absorbent dish cloth oil wipe towel thickened cloth wipe table cloth kitchen ragdouble color double sided absorbent dish cloth oil wipe towel thickened cloth wipe table cloth kitchen rag', '[\"Orange\"]', 'http://pbfh6sbp9.bkt.clouddn.com/HBDdmvNULQHXWXvYRfOoe6DhnPLZHD18wUO4mzBx.png', '2018-10-24 06:34:54', '2018-10-24 06:34:54');
INSERT INTO `order_items` VALUES (120, 53, 47, 306, 86, 1, 2296, 0, 2296, 'kitchen-brush-pan-brush-creative-soap-brush-hand-soap-brush-press-on-the-pan-and-wash-the-dishes', 'kitchen-brush-pan-brush-creative-soap-brush-hand-soap-brush-press-on-the-pan-and-wash-the-dishes', 2296, 'Kitchen brush pan brush creative soap brush hand soap brush press on the pan and wash the dishes', '[\"Gray\"]', 'http://pbfh6sbp9.bkt.clouddn.com/TDlkkxKn72Kv2vpfWbp1U7C9SZhQkDZMZHoYWomk.png', '2018-10-24 06:34:54', '2018-10-24 06:34:54');
INSERT INTO `order_items` VALUES (121, 56, 47, 313, 90, 3, 51294, 0, 51294, 'household-portable-projector', 'household-portable-projector', 17098, 'Household portable projector', '[]', 'http://pbfh6sbp9.bkt.clouddn.com/ciFmikiAIAkGTfdH93mwMj4XGkj8MlCyREIUtVlb.png', '2018-10-24 06:34:54', '2018-10-24 06:34:54');
INSERT INTO `order_items` VALUES (128, 49, 50, 49, 23, 1, 4264, 0, 4264, 'mondrian-music-canvas-wireless-bluetooth-speaker', 'mondrian-music-canvas-wireless-bluetooth-speaker', 4264, 'Mondrian music canvas wireless bluetooth speaker', '[\"Pink\"]', 'http://pbfh6sbp9.bkt.clouddn.com/OBGetGuiq0NlJLevtEMpamEHhFMAE5BKNB3gDgxt.png', '2018-10-24 06:37:13', '2018-10-24 07:43:39');
INSERT INTO `order_items` VALUES (129, 48, 50, 56, 26, 1, 1461, 0, 1461, 'pma-graphene-thermal-silk-eye-mask', 'pma-graphene-thermal-silk-eye-mask', 1461, 'Pma graphene thermal silk eye mask', '[\"Green\"]', 'http://pbfh6sbp9.bkt.clouddn.com/eu2dPALUr6zZKkJW0ZGQAOOgE1UKoRIcdaDWCM76.png', '2018-10-24 06:37:13', '2018-10-24 07:43:39');
INSERT INTO `order_items` VALUES (130, 57, 50, 229, 57, 2, 224, 0, 224, 'bath-and-back-bath-balls', 'bath-and-back-bath-balls', 112, 'Bath and back bath balls', '[]', 'http://pbfh6sbp9.bkt.clouddn.com/vqkZF95aaKzzqHsODzWjVtwIvVD2s2unxeNDLNHR.png', '2018-10-24 06:37:13', '2018-10-24 07:43:39');
INSERT INTO `order_items` VALUES (132, 58, 52, 46, 22, 1, 1688, 0, 1688, 'portable-wireless-bluetooth-speaker', 'portable-wireless-bluetooth-speaker', 1688, 'Portable wireless bluetooth speaker', '[\"Red\"]', 'http://pbfh6sbp9.bkt.clouddn.com/RIw0RmfNAOY2i304LqJrue7fGO4lagICs8QbZNT8.png', '2018-10-24 06:40:33', '2018-10-24 06:40:33');
INSERT INTO `order_items` VALUES (133, 23, 53, 22, 14, 4, 7072, 0, 7072, 'ultra-thin-mini-20000-mah-mobile-power-supply', 'ultra-thin-mini-20000-mah-mobile-power-supply', 1768, 'Ultra thin mini 20000 mah mobile power supply', '[\"Red\"]', 'http://pbfh6sbp9.bkt.clouddn.com/sKf1rynA5U5xL1DwGr5a0rIZc4KsVGkRSjfnktFs.png', '2018-10-24 06:50:54', '2018-10-24 06:50:54');
INSERT INTO `order_items` VALUES (134, 24, 53, 24, 14, 4, 7152, 0, 7152, 'ultra-thin-mini-20000-mah-mobile-power-supply', 'ultra-thin-mini-20000-mah-mobile-power-supply', 1788, 'Ultra thin mini 20000 mah mobile power supply', '[\"black\"]', 'http://pbfh6sbp9.bkt.clouddn.com/sKf1rynA5U5xL1DwGr5a0rIZc4KsVGkRSjfnktFs.png', '2018-10-24 06:50:54', '2018-10-24 06:50:54');
INSERT INTO `order_items` VALUES (135, 25, 53, 30, 16, 2, 2332, 0, 2332, 'wireless-smart-quick-charge', 'wireless-smart-quick-charge', 1166, 'Wireless smart quick charge', '[\"black\"]', 'http://pbfh6sbp9.bkt.clouddn.com/kp9jtrXskXir21F6qx7H6Z8b6o4Mwwtr8j4ha0Fn.png', '2018-10-24 06:50:54', '2018-10-24 06:50:54');
INSERT INTO `order_items` VALUES (136, 26, 53, 165, 38, 4, 23196, 0, 23196, 'the-antarctic-peoples-60-satins-long-plush-cotton-four-piece-cotton-plain-womens-bed-sheet-and-quilt-cover-20m-bedding', 'the-antarctic-peoples-60-satins-long-plush-cotton-four-piece-cotton-plain-womens-bed-sheet-and-quilt-cover-20m-bedding', 5799, 'The antarctic peoples 60 satins long plush cotton four piece cotton plain womens bed sheet and quilt cover 20m bedding', '[\"15m 5ft bedding covers\"]', 'http://pbfh6sbp9.bkt.clouddn.com/y2gQAuCaLKf5rmQg58hgOh1ExtyEZWsnGSd2ALwn.png', '2018-10-24 06:50:54', '2018-10-24 06:50:54');
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'order number',
  `address_id` int(10) unsigned DEFAULT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `items_total` int(11) NOT NULL DEFAULT '0' COMMENT '订单总金额 unit/分',
  `adjustments_total` int(11) NOT NULL DEFAULT '0' COMMENT '调整金额 unit/分',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '需支付金额 unit/分',
  `local_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '语言编号',
  `currency_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '货币编号',
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'new, cancelled, fulfilled',
  `payment_state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '购买用户ip',
  `payment_method_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'confirm后冗余',
  `coupon_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'confirm后冗余',
  `paid_at` timestamp NULL DEFAULT NULL COMMENT '支付时间',
  `confirmed_at` timestamp NULL DEFAULT NULL COMMENT '确认订单时间',
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `fulfilled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO `orders` VALUES (36, '18102209285083', 2, 1, 2, 5022, 1000, 6022, 'en-US', 'USD', 'new', 'awaiting_payment', 'ready', '121.35.101.250', 'PaiPay Checkout', NULL, NULL, '2018-10-22 09:28:34', NULL, NULL, '2018-10-22 09:20:04', '2018-10-22 09:28:34');
INSERT INTO `orders` VALUES (37, '18102209363382', 3, 1, 2, 1900, 1000, 2900, 'en-US', 'USD', 'new', 'paid', 'ready', '121.35.101.250', 'PaiPay Checkout', NULL, '2018-10-22 09:39:46', '2018-10-22 09:36:18', NULL, NULL, '2018-10-22 09:36:10', '2018-10-22 09:39:46');
INSERT INTO `orders` VALUES (38, '18102209486065', 4, 1, 2, 5742, 1000, 6742, 'en-US', 'USD', 'new', 'awaiting_payment', 'ready', '121.35.101.250', 'PaiPay Checkout', NULL, NULL, '2018-10-22 09:48:35', NULL, NULL, '2018-10-22 09:48:32', '2018-10-22 09:48:35');
INSERT INTO `orders` VALUES (41, NULL, NULL, 1, 3, 21119, 1000, 22119, 'en-US', 'USD', 'checkout', 'checkout', 'checkout', '121.35.101.76', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-23 02:11:41', '2018-10-23 02:11:41');
INSERT INTO `orders` VALUES (43, '18102306198965', 5, 1, 2, 8000, 1000, 9000, 'en-US', 'USD', 'new', 'paid', 'ready', '121.35.101.76', 'PaiPay Checkout', NULL, '2018-10-23 06:20:12', '2018-10-23 06:19:05', NULL, NULL, '2018-10-23 06:18:56', '2018-10-23 06:20:12');
INSERT INTO `orders` VALUES (47, NULL, 1, 1, 2, 84478, 1000, 85478, 'en-US', 'USD', 'checkout', 'checkout', 'checkout', '121.35.101.76', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-24 06:34:54', '2018-10-24 06:34:56');
INSERT INTO `orders` VALUES (50, NULL, NULL, 1, 4, 5949, 1000, 6949, 'en-US', 'USD', 'checkout', 'checkout', 'checkout', '121.35.101.76', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-24 06:37:13', '2018-10-24 07:43:39');
INSERT INTO `orders` VALUES (52, NULL, 6, 1, 6, 1688, 0, 1688, 'en-US', 'USD', 'checkout', 'checkout', 'checkout', '121.35.101.76', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-24 06:40:33', '2018-10-24 06:40:41');
INSERT INTO `orders` VALUES (53, NULL, NULL, 1, 1, 39752, 0, 39752, 'en-US', 'USD', 'checkout', 'checkout', 'checkout', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-24 06:50:54', '2018-10-24 07:04:01');
COMMIT;

-- ----------------------------
-- Table structure for payment_method_translations
-- ----------------------------
DROP TABLE IF EXISTS `payment_method_translations`;
CREATE TABLE `payment_method_translations` (
  `translatable_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `unique_tl` (`translatable_id`,`locale_code`),
  KEY `payment_method_translations_translatable_id_index` (`translatable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of payment_method_translations
-- ----------------------------
BEGIN;
INSERT INTO `payment_method_translations` VALUES (1, 'PaiPay Checkout', '贝宝即时付款服务', 'en-US', NULL, '2018-10-23 02:32:38');
COMMIT;

-- ----------------------------
-- Table structure for payment_methods
-- ----------------------------
DROP TABLE IF EXISTS `payment_methods`;
CREATE TABLE `payment_methods` (
  `deleted_at` timestamp NULL DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of payment_methods
-- ----------------------------
BEGIN;
INSERT INTO `payment_methods` VALUES (NULL, 1, 'paipay_checkout', 1, 0, 'http://pbfh6sbp9.bkt.clouddn.com/edteHWpnsROQos9ksUvBC2qkr6kqg4gmCnIqMX3m.png', NULL, '2018-10-23 02:32:38');
COMMIT;

-- ----------------------------
-- Table structure for payment_security_tokens
-- ----------------------------
DROP TABLE IF EXISTS `payment_security_tokens`;
CREATE TABLE `payment_security_tokens` (
  `hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `after_url` text COLLATE utf8mb4_unicode_ci,
  `target_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gateway_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of payment_security_tokens
-- ----------------------------
BEGIN;
INSERT INTO `payment_security_tokens` VALUES ('tHVgMLv6OAtSqDaRo99f_2XXzlBz-qr-ys-aA-4ZUjY', 'C:25:\"Payum\\Core\\Model\\Identity\":45:{a:2:{i:0;i:29;i:1;s:18:\"App\\Models\\Payment\";}}', NULL, 'http://123.207.65.111:8001/payment/done/tHVgMLv6OAtSqDaRo99f_2XXzlBz-qr-ys-aA-4ZUjY', 'paipay_checkout', '2018-10-22 09:36:29', '2018-10-22 09:36:29');
INSERT INTO `payment_security_tokens` VALUES ('s0dRHfhqmKU8pVGpc9HS8WmBXwxqtpDPw2nO36lsXCE', 'C:25:\"Payum\\Core\\Model\\Identity\":45:{a:2:{i:0;i:29;i:1;s:18:\"App\\Models\\Payment\";}}', NULL, 'http://123.207.65.111:8001/notify/s0dRHfhqmKU8pVGpc9HS8WmBXwxqtpDPw2nO36lsXCE', 'paipay_checkout', '2018-10-22 09:36:29', '2018-10-22 09:36:29');
INSERT INTO `payment_security_tokens` VALUES ('PczE8ggi6QqFdkUxbRldCfRXhKpBMPfrR7E9QN5Yuq0', 'C:25:\"Payum\\Core\\Model\\Identity\":45:{a:2:{i:0;i:31;i:1;s:18:\"App\\Models\\Payment\";}}', NULL, 'http://123.207.65.111:8001/payment/done/PczE8ggi6QqFdkUxbRldCfRXhKpBMPfrR7E9QN5Yuq0', 'paipay_checkout', '2018-10-22 09:48:36', '2018-10-22 09:48:36');
INSERT INTO `payment_security_tokens` VALUES ('xJqMOJcFE9tvuwT8hJ0pVS-bMOlsTRIcqnBU3yLFSeo', 'C:25:\"Payum\\Core\\Model\\Identity\":45:{a:2:{i:0;i:31;i:1;s:18:\"App\\Models\\Payment\";}}', 'http://123.207.65.111:8001/payment/done/PczE8ggi6QqFdkUxbRldCfRXhKpBMPfrR7E9QN5Yuq0', 'http://123.207.65.111:8001/capture/xJqMOJcFE9tvuwT8hJ0pVS-bMOlsTRIcqnBU3yLFSeo', 'paipay_checkout', '2018-10-22 09:48:36', '2018-10-22 09:48:36');
INSERT INTO `payment_security_tokens` VALUES ('UevtthNl-DJoPWIHm9l8qe-vhFpGYOI9LCvNLNmkkhA', 'C:25:\"Payum\\Core\\Model\\Identity\":45:{a:2:{i:0;i:31;i:1;s:18:\"App\\Models\\Payment\";}}', NULL, 'http://123.207.65.111:8001/notify/UevtthNl-DJoPWIHm9l8qe-vhFpGYOI9LCvNLNmkkhA', 'paipay_checkout', '2018-10-22 09:48:36', '2018-10-22 09:48:36');
INSERT INTO `payment_security_tokens` VALUES ('5dscHgBVzeCqWaQTj7Gb8ynwLLDf52CwI57duUMmXq8', 'C:25:\"Payum\\Core\\Model\\Identity\":45:{a:2:{i:0;i:37;i:1;s:18:\"App\\Models\\Payment\";}}', NULL, 'http://123.207.65.111:8001/payment/done/5dscHgBVzeCqWaQTj7Gb8ynwLLDf52CwI57duUMmXq8', 'paipay_checkout', '2018-10-23 06:19:07', '2018-10-23 06:19:07');
INSERT INTO `payment_security_tokens` VALUES ('ArhbMQbgRZDEJ_dGUZ0Wke37cuzv-7f4kH8uq7BRmoI', 'C:25:\"Payum\\Core\\Model\\Identity\":45:{a:2:{i:0;i:37;i:1;s:18:\"App\\Models\\Payment\";}}', NULL, 'http://123.207.65.111:8001/notify/ArhbMQbgRZDEJ_dGUZ0Wke37cuzv-7f4kH8uq7BRmoI', 'paipay_checkout', '2018-10-23 06:19:08', '2018-10-23 06:19:08');
INSERT INTO `payment_security_tokens` VALUES ('mjWpSyCA4NQyw1oUMW4mUGgppY13qzQqQEL9CeeSm6E', 'C:25:\"Payum\\Core\\Model\\Identity\":45:{a:2:{i:0;i:39;i:1;s:18:\"App\\Models\\Payment\";}}', NULL, 'http://123.207.65.111:8001/payment/done/mjWpSyCA4NQyw1oUMW4mUGgppY13qzQqQEL9CeeSm6E', 'paipay_checkout', '2018-10-24 01:57:38', '2018-10-24 01:57:38');
INSERT INTO `payment_security_tokens` VALUES ('OQpHV07Yo6e5qO_v_TsDbQSSQczEC8XjDNopeL-v2A8', 'C:25:\"Payum\\Core\\Model\\Identity\":45:{a:2:{i:0;i:39;i:1;s:18:\"App\\Models\\Payment\";}}', 'http://123.207.65.111:8001/payment/done/mjWpSyCA4NQyw1oUMW4mUGgppY13qzQqQEL9CeeSm6E', 'http://123.207.65.111:8001/capture/OQpHV07Yo6e5qO_v_TsDbQSSQczEC8XjDNopeL-v2A8', 'paipay_checkout', '2018-10-24 01:57:38', '2018-10-24 01:57:38');
INSERT INTO `payment_security_tokens` VALUES ('Z_4p_A_JiRfbD4XNEFFAP8WhZ82RTObfF-fpBB0mbks', 'C:25:\"Payum\\Core\\Model\\Identity\":45:{a:2:{i:0;i:39;i:1;s:18:\"App\\Models\\Payment\";}}', NULL, 'http://123.207.65.111:8001/notify/Z_4p_A_JiRfbD4XNEFFAP8WhZ82RTObfF-fpBB0mbks', 'paipay_checkout', '2018-10-24 01:57:38', '2018-10-24 01:57:38');
COMMIT;

-- ----------------------------
-- Table structure for payments
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '冗余作用',
  `amount` int(10) unsigned NOT NULL DEFAULT '0',
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_order_id_index` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of payments
-- ----------------------------
BEGIN;
INSERT INTO `payments` VALUES (27, 1, 36, 'USD', 0, 'new', NULL, '2018-10-22 09:20:04', '2018-10-22 09:28:34');
INSERT INTO `payments` VALUES (28, 1, 37, 'USD', 0, 'new', NULL, '2018-10-22 09:36:10', '2018-10-22 09:36:18');
INSERT INTO `payments` VALUES (29, 1, 37, 'USD', 2900, 'completed', '{\"INVNUM\":null,\"PAYMENTREQUEST_0_CURRENCYCODE\":\"USD\",\"PAYMENTREQUEST_0_AMT\":\"29.00\",\"PAYMENTREQUEST_0_DESC\":null,\"PAYMENTREQUEST_0_PAYMENTACTION\":\"Sale\",\"AUTHORIZE_TOKEN_USERACTION\":\"commit\",\"RETURNURL\":\"http:\\/\\/123.207.65.111:8001\\/capture\\/_hfWcVMGQUlYULHcphzV7woBtrEX35uoDM6ZJxo8T_0\",\"CANCELURL\":\"http:\\/\\/123.207.65.111:8001\\/capture\\/_hfWcVMGQUlYULHcphzV7woBtrEX35uoDM6ZJxo8T_0?cancelled=1\",\"PAYMENTREQUEST_0_NOTIFYURL\":\"http:\\/\\/123.207.65.111:8001\\/notify\\/s0dRHfhqmKU8pVGpc9HS8WmBXwxqtpDPw2nO36lsXCE\",\"TOKEN\":\"EC-2CN90657NM319981S\",\"TIMESTAMP\":\"2018-10-22T09:39:43Z\",\"CORRELATIONID\":\"2a1c05209ba38\",\"ACK\":\"Success\",\"VERSION\":\"65.1\",\"BUILD\":\"49798231\",\"BILLINGAGREEMENTACCEPTEDSTATUS\":\"0\",\"CHECKOUTSTATUS\":\"PaymentActionCompleted\",\"CURRENCYCODE\":\"USD\",\"AMT\":\"29.00\",\"SHIPPINGAMT\":\"0.00\",\"HANDLINGAMT\":\"0.00\",\"TAXAMT\":\"0.00\",\"NOTIFYURL\":\"http:\\/\\/123.207.65.111:8001\\/notify\\/s0dRHfhqmKU8pVGpc9HS8WmBXwxqtpDPw2nO36lsXCE\",\"INSURANCEAMT\":\"0.00\",\"SHIPDISCAMT\":\"0.00\",\"PAYMENTREQUEST_0_SHIPPINGAMT\":\"0.00\",\"PAYMENTREQUEST_0_HANDLINGAMT\":\"0.00\",\"PAYMENTREQUEST_0_TAXAMT\":\"0.00\",\"PAYMENTREQUEST_0_INSURANCEAMT\":\"0.00\",\"PAYMENTREQUEST_0_SHIPDISCAMT\":\"0.00\",\"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\":\"false\",\"PAYMENTREQUESTINFO_0_ERRORCODE\":\"0\",\"EMAIL\":\"bestkit@qq.com\",\"PAYERID\":\"MGSS6G33N9BQL\",\"PAYERSTATUS\":\"verified\",\"FIRSTNAME\":\"\\u6587\\u8c6a\",\"LASTNAME\":\"\\u9b4f\",\"COUNTRYCODE\":\"US\",\"SHIPTONAME\":\"\\u6587\\u8c6a \\u9b4f\",\"SHIPTOSTREET\":\"1 Main St\",\"SHIPTOCITY\":\"San Jose\",\"SHIPTOSTATE\":\"CA\",\"SHIPTOZIP\":\"95131\",\"SHIPTOCOUNTRYCODE\":\"US\",\"SHIPTOCOUNTRYNAME\":\"United States\",\"ADDRESSSTATUS\":\"Confirmed\",\"ITEMAMT\":\"29.00\",\"INSURANCEOPTIONOFFERED\":\"false\",\"PAYMENTREQUEST_0_ITEMAMT\":\"29.00\",\"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\":\"1101140857-facilitator-1@qq.com\",\"PAYMENTREQUEST_0_SHIPTONAME\":\"\\u6587\\u8c6a \\u9b4f\",\"PAYMENTREQUEST_0_SHIPTOSTREET\":\"1 Main St\",\"PAYMENTREQUEST_0_SHIPTOCITY\":\"San Jose\",\"PAYMENTREQUEST_0_SHIPTOSTATE\":\"CA\",\"PAYMENTREQUEST_0_SHIPTOZIP\":\"95131\",\"PAYMENTREQUEST_0_SHIPTOCOUNTRYCODE\":\"US\",\"PAYMENTREQUEST_0_SHIPTOCOUNTRYNAME\":\"United States\",\"PAYMENTREQUEST_0_ADDRESSSTATUS\":\"Confirmed\",\"SUCCESSPAGEREDIRECTREQUESTED\":\"false\",\"INSURANCEOPTIONSELECTED\":\"false\",\"SHIPPINGOPTIONISDEFAULT\":\"false\",\"PAYMENTINFO_0_TRANSACTIONID\":\"80B42257KG5501214\",\"PAYMENTINFO_0_TRANSACTIONTYPE\":\"expresscheckout\",\"PAYMENTINFO_0_PAYMENTTYPE\":\"instant\",\"PAYMENTINFO_0_ORDERTIME\":\"2018-10-22T09:39:41Z\",\"PAYMENTINFO_0_AMT\":\"29.00\",\"PAYMENTINFO_0_FEEAMT\":\"1.43\",\"PAYMENTINFO_0_TAXAMT\":\"0.00\",\"PAYMENTINFO_0_CURRENCYCODE\":\"USD\",\"PAYMENTINFO_0_PAYMENTSTATUS\":\"Completed\",\"PAYMENTINFO_0_PENDINGREASON\":\"None\",\"PAYMENTINFO_0_REASONCODE\":\"None\",\"PAYMENTINFO_0_PROTECTIONELIGIBILITY\":\"Eligible\",\"PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE\":\"ItemNotReceivedEligible,UnauthorizedPaymentEligible\",\"PAYMENTINFO_0_SELLERPAYPALACCOUNTID\":\"1101140857-facilitator-1@qq.com\",\"PAYMENTINFO_0_ERRORCODE\":\"0\",\"PAYMENTINFO_0_ACK\":\"Success\",\"TRANSACTIONID\":\"80B42257KG5501214\",\"PAYMENTREQUEST_0_TRANSACTIONID\":\"80B42257KG5501214\",\"PAYMENTREQUESTINFO_0_TRANSACTIONID\":\"80B42257KG5501214\",\"PAYMENTREQUEST_0_TRANSACTIONTYPE\":\"expresscheckout\",\"PAYMENTREQUEST_0_PAYMENTTYPE\":\"instant\",\"PAYMENTREQUEST_0_ORDERTIME\":\"2018-10-22T09:39:41Z\",\"PAYMENTREQUEST_0_FEEAMT\":\"1.43\",\"PAYMENTREQUEST_0_PAYMENTSTATUS\":\"Completed\",\"PAYMENTREQUEST_0_PENDINGREASON\":\"None\",\"PAYMENTREQUEST_0_REASONCODE\":\"None\"}', '2018-10-22 09:36:29', '2018-10-22 09:39:46');
INSERT INTO `payments` VALUES (30, 1, 38, 'USD', 0, 'new', NULL, '2018-10-22 09:48:32', '2018-10-22 09:48:35');
INSERT INTO `payments` VALUES (31, 1, 38, 'USD', 6742, 'new', '{\"INVNUM\":null,\"PAYMENTREQUEST_0_CURRENCYCODE\":\"USD\",\"PAYMENTREQUEST_0_AMT\":\"67.42\",\"PAYMENTREQUEST_0_DESC\":null,\"PAYMENTREQUEST_0_PAYMENTACTION\":\"Sale\",\"AUTHORIZE_TOKEN_USERACTION\":\"commit\",\"RETURNURL\":\"http:\\/\\/123.207.65.111:8001\\/capture\\/xJqMOJcFE9tvuwT8hJ0pVS-bMOlsTRIcqnBU3yLFSeo\",\"CANCELURL\":\"http:\\/\\/123.207.65.111:8001\\/capture\\/xJqMOJcFE9tvuwT8hJ0pVS-bMOlsTRIcqnBU3yLFSeo?cancelled=1\",\"PAYMENTREQUEST_0_NOTIFYURL\":\"http:\\/\\/123.207.65.111:8001\\/notify\\/UevtthNl-DJoPWIHm9l8qe-vhFpGYOI9LCvNLNmkkhA\",\"TOKEN\":\"EC-8MG22999UT038034S\",\"TIMESTAMP\":\"2018-10-22T09:48:39Z\",\"CORRELATIONID\":\"b876383a33ac8\",\"ACK\":\"Success\",\"VERSION\":\"65.1\",\"BUILD\":\"49798231\",\"BILLINGAGREEMENTACCEPTEDSTATUS\":\"0\",\"CHECKOUTSTATUS\":\"PaymentActionNotInitiated\",\"CURRENCYCODE\":\"USD\",\"AMT\":\"67.42\",\"SHIPPINGAMT\":\"0.00\",\"HANDLINGAMT\":\"0.00\",\"TAXAMT\":\"0.00\",\"NOTIFYURL\":\"http:\\/\\/123.207.65.111:8001\\/notify\\/UevtthNl-DJoPWIHm9l8qe-vhFpGYOI9LCvNLNmkkhA\",\"INSURANCEAMT\":\"0.00\",\"SHIPDISCAMT\":\"0.00\",\"PAYMENTREQUEST_0_SHIPPINGAMT\":\"0.00\",\"PAYMENTREQUEST_0_HANDLINGAMT\":\"0.00\",\"PAYMENTREQUEST_0_TAXAMT\":\"0.00\",\"PAYMENTREQUEST_0_INSURANCEAMT\":\"0.00\",\"PAYMENTREQUEST_0_SHIPDISCAMT\":\"0.00\",\"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\":\"false\",\"PAYMENTREQUESTINFO_0_ERRORCODE\":\"0\"}', '2018-10-22 09:48:36', '2018-10-22 09:48:39');
INSERT INTO `payments` VALUES (34, 1, 41, 'USD', 0, 'checkout', NULL, '2018-10-23 02:11:41', '2018-10-23 02:11:41');
INSERT INTO `payments` VALUES (36, 1, 43, 'USD', 0, 'new', NULL, '2018-10-23 06:18:56', '2018-10-23 06:19:05');
INSERT INTO `payments` VALUES (37, 1, 43, 'USD', 9000, 'completed', '{\"INVNUM\":null,\"PAYMENTREQUEST_0_CURRENCYCODE\":\"USD\",\"PAYMENTREQUEST_0_AMT\":\"90.00\",\"PAYMENTREQUEST_0_DESC\":null,\"PAYMENTREQUEST_0_PAYMENTACTION\":\"Sale\",\"AUTHORIZE_TOKEN_USERACTION\":\"commit\",\"RETURNURL\":\"http:\\/\\/123.207.65.111:8001\\/capture\\/uflpiLvTIM1NI0mxy7VNnQCXfpa-sJhh5sJNBs87fws\",\"CANCELURL\":\"http:\\/\\/123.207.65.111:8001\\/capture\\/uflpiLvTIM1NI0mxy7VNnQCXfpa-sJhh5sJNBs87fws?cancelled=1\",\"PAYMENTREQUEST_0_NOTIFYURL\":\"http:\\/\\/123.207.65.111:8001\\/notify\\/ArhbMQbgRZDEJ_dGUZ0Wke37cuzv-7f4kH8uq7BRmoI\",\"TOKEN\":\"EC-0UD50278C0501993L\",\"TIMESTAMP\":\"2018-10-23T06:20:10Z\",\"CORRELATIONID\":\"aa4de831e334f\",\"ACK\":\"Success\",\"VERSION\":\"65.1\",\"BUILD\":\"49798231\",\"BILLINGAGREEMENTACCEPTEDSTATUS\":\"0\",\"CHECKOUTSTATUS\":\"PaymentActionCompleted\",\"CURRENCYCODE\":\"USD\",\"AMT\":\"90.00\",\"SHIPPINGAMT\":\"0.00\",\"HANDLINGAMT\":\"0.00\",\"TAXAMT\":\"0.00\",\"NOTIFYURL\":\"http:\\/\\/123.207.65.111:8001\\/notify\\/ArhbMQbgRZDEJ_dGUZ0Wke37cuzv-7f4kH8uq7BRmoI\",\"INSURANCEAMT\":\"0.00\",\"SHIPDISCAMT\":\"0.00\",\"PAYMENTREQUEST_0_SHIPPINGAMT\":\"0.00\",\"PAYMENTREQUEST_0_HANDLINGAMT\":\"0.00\",\"PAYMENTREQUEST_0_TAXAMT\":\"0.00\",\"PAYMENTREQUEST_0_INSURANCEAMT\":\"0.00\",\"PAYMENTREQUEST_0_SHIPDISCAMT\":\"0.00\",\"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\":\"false\",\"PAYMENTREQUESTINFO_0_ERRORCODE\":\"0\",\"EMAIL\":\"bestkit@qq.com\",\"PAYERID\":\"MGSS6G33N9BQL\",\"PAYERSTATUS\":\"verified\",\"FIRSTNAME\":\"\\u6587\\u8c6a\",\"LASTNAME\":\"\\u9b4f\",\"COUNTRYCODE\":\"US\",\"SHIPTONAME\":\"\\u6587\\u8c6a \\u9b4f\",\"SHIPTOSTREET\":\"1 Main St\",\"SHIPTOCITY\":\"San Jose\",\"SHIPTOSTATE\":\"CA\",\"SHIPTOZIP\":\"95131\",\"SHIPTOCOUNTRYCODE\":\"US\",\"SHIPTOCOUNTRYNAME\":\"United States\",\"ADDRESSSTATUS\":\"Confirmed\",\"ITEMAMT\":\"90.00\",\"INSURANCEOPTIONOFFERED\":\"false\",\"PAYMENTREQUEST_0_ITEMAMT\":\"90.00\",\"PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID\":\"1101140857-facilitator-1@qq.com\",\"PAYMENTREQUEST_0_SHIPTONAME\":\"\\u6587\\u8c6a \\u9b4f\",\"PAYMENTREQUEST_0_SHIPTOSTREET\":\"1 Main St\",\"PAYMENTREQUEST_0_SHIPTOCITY\":\"San Jose\",\"PAYMENTREQUEST_0_SHIPTOSTATE\":\"CA\",\"PAYMENTREQUEST_0_SHIPTOZIP\":\"95131\",\"PAYMENTREQUEST_0_SHIPTOCOUNTRYCODE\":\"US\",\"PAYMENTREQUEST_0_SHIPTOCOUNTRYNAME\":\"United States\",\"PAYMENTREQUEST_0_ADDRESSSTATUS\":\"Confirmed\",\"SUCCESSPAGEREDIRECTREQUESTED\":\"false\",\"INSURANCEOPTIONSELECTED\":\"false\",\"SHIPPINGOPTIONISDEFAULT\":\"false\",\"PAYMENTINFO_0_TRANSACTIONID\":\"46F14001A4909864D\",\"PAYMENTINFO_0_TRANSACTIONTYPE\":\"expresscheckout\",\"PAYMENTINFO_0_PAYMENTTYPE\":\"instant\",\"PAYMENTINFO_0_ORDERTIME\":\"2018-10-23T06:20:08Z\",\"PAYMENTINFO_0_AMT\":\"90.00\",\"PAYMENTINFO_0_FEEAMT\":\"3.81\",\"PAYMENTINFO_0_TAXAMT\":\"0.00\",\"PAYMENTINFO_0_CURRENCYCODE\":\"USD\",\"PAYMENTINFO_0_PAYMENTSTATUS\":\"Completed\",\"PAYMENTINFO_0_PENDINGREASON\":\"None\",\"PAYMENTINFO_0_REASONCODE\":\"None\",\"PAYMENTINFO_0_PROTECTIONELIGIBILITY\":\"Eligible\",\"PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE\":\"ItemNotReceivedEligible,UnauthorizedPaymentEligible\",\"PAYMENTINFO_0_SELLERPAYPALACCOUNTID\":\"1101140857-facilitator-1@qq.com\",\"PAYMENTINFO_0_ERRORCODE\":\"0\",\"PAYMENTINFO_0_ACK\":\"Success\",\"TRANSACTIONID\":\"46F14001A4909864D\",\"PAYMENTREQUEST_0_TRANSACTIONID\":\"46F14001A4909864D\",\"PAYMENTREQUESTINFO_0_TRANSACTIONID\":\"46F14001A4909864D\",\"PAYMENTREQUEST_0_TRANSACTIONTYPE\":\"expresscheckout\",\"PAYMENTREQUEST_0_PAYMENTTYPE\":\"instant\",\"PAYMENTREQUEST_0_ORDERTIME\":\"2018-10-23T06:20:08Z\",\"PAYMENTREQUEST_0_FEEAMT\":\"3.81\",\"PAYMENTREQUEST_0_PAYMENTSTATUS\":\"Completed\",\"PAYMENTREQUEST_0_PENDINGREASON\":\"None\",\"PAYMENTREQUEST_0_REASONCODE\":\"None\"}', '2018-10-23 06:19:07', '2018-10-23 06:20:12');
INSERT INTO `payments` VALUES (39, 1, 38, 'USD', 6742, 'new', '{\"INVNUM\":null,\"PAYMENTREQUEST_0_CURRENCYCODE\":\"USD\",\"PAYMENTREQUEST_0_AMT\":\"67.42\",\"PAYMENTREQUEST_0_DESC\":null,\"PAYMENTREQUEST_0_PAYMENTACTION\":\"Sale\",\"AUTHORIZE_TOKEN_USERACTION\":\"commit\",\"RETURNURL\":\"http:\\/\\/123.207.65.111:8001\\/capture\\/OQpHV07Yo6e5qO_v_TsDbQSSQczEC8XjDNopeL-v2A8\",\"CANCELURL\":\"http:\\/\\/123.207.65.111:8001\\/capture\\/OQpHV07Yo6e5qO_v_TsDbQSSQczEC8XjDNopeL-v2A8?cancelled=1\",\"PAYMENTREQUEST_0_NOTIFYURL\":\"http:\\/\\/123.207.65.111:8001\\/notify\\/Z_4p_A_JiRfbD4XNEFFAP8WhZ82RTObfF-fpBB0mbks\",\"TOKEN\":\"EC-2WH90555937985354\",\"TIMESTAMP\":\"2018-10-24T01:57:51Z\",\"CORRELATIONID\":\"24a4f1919103e\",\"ACK\":\"Success\",\"VERSION\":\"65.1\",\"BUILD\":\"49798231\",\"BILLINGAGREEMENTACCEPTEDSTATUS\":\"0\",\"CHECKOUTSTATUS\":\"PaymentActionNotInitiated\",\"CURRENCYCODE\":\"USD\",\"AMT\":\"67.42\",\"SHIPPINGAMT\":\"0.00\",\"HANDLINGAMT\":\"0.00\",\"TAXAMT\":\"0.00\",\"NOTIFYURL\":\"http:\\/\\/123.207.65.111:8001\\/notify\\/Z_4p_A_JiRfbD4XNEFFAP8WhZ82RTObfF-fpBB0mbks\",\"INSURANCEAMT\":\"0.00\",\"SHIPDISCAMT\":\"0.00\",\"PAYMENTREQUEST_0_SHIPPINGAMT\":\"0.00\",\"PAYMENTREQUEST_0_HANDLINGAMT\":\"0.00\",\"PAYMENTREQUEST_0_TAXAMT\":\"0.00\",\"PAYMENTREQUEST_0_INSURANCEAMT\":\"0.00\",\"PAYMENTREQUEST_0_SHIPDISCAMT\":\"0.00\",\"PAYMENTREQUEST_0_INSURANCEOPTIONOFFERED\":\"false\",\"PAYMENTREQUESTINFO_0_ERRORCODE\":\"0\"}', '2018-10-24 01:57:38', '2018-10-24 01:57:52');
INSERT INTO `payments` VALUES (42, 1, 47, 'USD', 0, 'checkout', NULL, '2018-10-24 06:34:54', '2018-10-24 06:34:54');
INSERT INTO `payments` VALUES (45, 1, 50, 'USD', 0, 'checkout', NULL, '2018-10-24 06:37:13', '2018-10-24 06:37:13');
INSERT INTO `payments` VALUES (47, 1, 52, 'USD', 0, 'checkout', NULL, '2018-10-24 06:40:33', '2018-10-24 06:40:33');
INSERT INTO `payments` VALUES (48, 1, 53, 'USD', 0, 'checkout', NULL, '2018-10-24 06:50:54', '2018-10-24 06:50:54');
COMMIT;

-- ----------------------------
-- Table structure for product_attribute_translations
-- ----------------------------
DROP TABLE IF EXISTS `product_attribute_translations`;
CREATE TABLE `product_attribute_translations` (
  `translatable_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_tl` (`translatable_id`,`locale_code`),
  KEY `product_attribute_translations_translatable_id_index` (`translatable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_attribute_translations
-- ----------------------------
BEGIN;
INSERT INTO `product_attribute_translations` VALUES (1, 'Texture', 'en-US', '2018-10-19 06:48:11', '2018-10-19 07:22:00', 1);
INSERT INTO `product_attribute_translations` VALUES (1, '文本', 'zh_CN', '2018-10-24 16:12:28', '2018-10-24 16:12:28', 2);
INSERT INTO `product_attribute_translations` VALUES (2, 'Function', 'en-US', '2018-10-19 07:21:00', '2018-10-19 07:21:00', 3);
INSERT INTO `product_attribute_translations` VALUES (3, 'Hair dryer stall', 'en-US', '2018-10-19 07:24:20', '2018-10-19 07:24:20', 4);
INSERT INTO `product_attribute_translations` VALUES (4, 'Place', 'en-US', '2018-10-19 07:25:05', '2018-10-19 07:25:05', 5);
INSERT INTO `product_attribute_translations` VALUES (6, 'Applicable', 'en-US', '2018-10-19 08:58:02', '2018-10-22 09:17:13', 6);
INSERT INTO `product_attribute_translations` VALUES (7, 'Way', 'en-US', '2018-10-19 08:58:36', '2018-10-22 09:19:54', 7);
INSERT INTO `product_attribute_translations` VALUES (8, 'Brand', 'en-US', '2018-10-19 10:07:29', '2018-10-22 09:19:49', 8);
INSERT INTO `product_attribute_translations` VALUES (9, 'Model', 'en-US', '2018-10-19 10:08:40', '2018-10-22 09:19:24', 9);
INSERT INTO `product_attribute_translations` VALUES (10, 'Style', 'en-US', '2018-10-19 10:22:53', '2018-10-22 09:19:19', 10);
INSERT INTO `product_attribute_translations` VALUES (11, 'Color', 'en-US', '2018-10-19 10:23:45', '2018-10-22 09:22:15', 11);
INSERT INTO `product_attribute_translations` VALUES (12, 'Weight', 'en-US', '2018-10-19 10:40:04', '2018-10-22 09:18:56', 12);
INSERT INTO `product_attribute_translations` VALUES (13, 'Category', 'en-US', '2018-10-19 10:40:34', '2018-10-22 09:18:42', 13);
INSERT INTO `product_attribute_translations` VALUES (14, 'Format', 'en-US', '2018-10-20 02:37:18', '2018-10-22 09:18:14', 14);
INSERT INTO `product_attribute_translations` VALUES (15, 'The product weight', 'en-US', '2018-10-20 10:00:48', '2018-10-20 10:00:48', 15);
INSERT INTO `product_attribute_translations` VALUES (16, 'Product specification', 'en-US', '2018-10-20 10:00:48', '2018-10-20 10:00:48', 16);
INSERT INTO `product_attribute_translations` VALUES (17, 'The material', 'en-US', '2018-10-20 10:00:49', '2018-10-20 10:00:49', 17);
INSERT INTO `product_attribute_translations` VALUES (18, 'Shell material', 'en-US', '2018-10-20 10:00:51', '2018-10-20 10:00:51', 18);
INSERT INTO `product_attribute_translations` VALUES (19, 'The battery capacity', 'en-US', '2018-10-20 10:00:51', '2018-10-20 10:00:51', 19);
INSERT INTO `product_attribute_translations` VALUES (20, 'Battery capacity', 'en-US', '2018-10-20 10:00:53', '2018-10-20 10:00:53', 20);
INSERT INTO `product_attribute_translations` VALUES (21, 'The weight of the', 'en-US', '2018-10-20 10:00:55', '2018-10-20 10:00:55', 21);
INSERT INTO `product_attribute_translations` VALUES (22, 'The output power', 'en-US', '2018-10-20 10:00:55', '2018-10-20 10:00:55', 22);
INSERT INTO `product_attribute_translations` VALUES (23, 'Charging distance', 'en-US', '2018-10-20 10:00:55', '2018-10-20 10:00:55', 23);
INSERT INTO `product_attribute_translations` VALUES (24, 'Suitable model', 'en-US', '2018-10-20 10:00:56', '2018-10-20 10:00:56', 24);
INSERT INTO `product_attribute_translations` VALUES (25, 'Product size', 'en-US', '2018-10-20 10:00:57', '2018-10-20 10:00:57', 25);
INSERT INTO `product_attribute_translations` VALUES (26, 'Charging time', 'en-US', '2018-10-20 10:00:58', '2018-10-20 10:00:58', 26);
INSERT INTO `product_attribute_translations` VALUES (27, 'Size', 'en-US', '2018-10-20 10:00:59', '2018-10-20 10:00:59', 27);
INSERT INTO `product_attribute_translations` VALUES (28, 'To support the weight', 'en-US', '2018-10-20 10:01:01', '2018-10-20 10:01:01', 28);
INSERT INTO `product_attribute_translations` VALUES (29, 'Support the diameter', 'en-US', '2018-10-20 10:01:01', '2018-10-20 10:01:01', 29);
INSERT INTO `product_attribute_translations` VALUES (30, 'Equipment support', 'en-US', '2018-10-20 10:01:01', '2018-10-20 10:01:01', 30);
INSERT INTO `product_attribute_translations` VALUES (31, 'The tip of', 'en-US', '2018-10-20 10:01:04', '2018-10-20 10:01:04', 31);
INSERT INTO `product_attribute_translations` VALUES (32, 'Bluetooth', 'en-US', '2018-10-20 10:01:04', '2018-10-20 10:01:04', 32);
INSERT INTO `product_attribute_translations` VALUES (33, 'Pins jack', 'en-US', '2018-10-20 10:01:06', '2018-10-20 10:01:06', 33);
INSERT INTO `product_attribute_translations` VALUES (34, 'Product material', 'en-US', '2018-10-20 10:01:07', '2018-10-20 10:01:07', 34);
INSERT INTO `product_attribute_translations` VALUES (35, 'Rated power', 'en-US', '2018-10-20 10:01:07', '2018-10-20 10:01:07', 35);
INSERT INTO `product_attribute_translations` VALUES (36, 'The input', 'en-US', '2018-10-20 10:01:07', '2018-10-20 10:01:07', 36);
INSERT INTO `product_attribute_translations` VALUES (37, 'Battery life', 'en-US', '2018-10-20 10:01:09', '2018-10-20 10:01:09', 37);
INSERT INTO `product_attribute_translations` VALUES (38, 'Hands free calls', 'en-US', '2018-10-20 10:01:09', '2018-10-20 10:01:09', 38);
INSERT INTO `product_attribute_translations` VALUES (39, 'Support audio format', 'en-US', '2018-10-20 10:01:10', '2018-10-20 10:01:10', 39);
INSERT INTO `product_attribute_translations` VALUES (40, 'Infinite transmission range', 'en-US', '2018-10-20 10:01:10', '2018-10-20 10:01:10', 40);
INSERT INTO `product_attribute_translations` VALUES (41, 'Transmission power', 'en-US', '2018-10-20 10:01:11', '2018-10-20 10:01:11', 41);
INSERT INTO `product_attribute_translations` VALUES (42, 'Signal to noise ratio', 'en-US', '2018-10-20 10:01:11', '2018-10-20 10:01:11', 42);
INSERT INTO `product_attribute_translations` VALUES (43, 'Charging box', 'en-US', '2018-10-20 10:01:16', '2018-10-20 10:01:16', 43);
INSERT INTO `product_attribute_translations` VALUES (44, 'Smoking time', 'en-US', '2018-10-20 10:01:16', '2018-10-20 10:01:16', 44);
INSERT INTO `product_attribute_translations` VALUES (45, 'The number of smoking', 'en-US', '2018-10-20 10:01:17', '2018-10-20 10:01:17', 45);
INSERT INTO `product_attribute_translations` VALUES (46, 'Charging box size', 'en-US', '2018-10-20 10:01:17', '2018-10-20 10:01:17', 46);
INSERT INTO `product_attribute_translations` VALUES (47, 'Heating rod size', 'en-US', '2018-10-20 10:01:18', '2018-10-20 10:01:18', 47);
INSERT INTO `product_attribute_translations` VALUES (48, 'The biggest weighing', 'en-US', '2018-10-20 10:01:19', '2018-10-20 10:01:19', 48);
INSERT INTO `product_attribute_translations` VALUES (49, 'Led display size', 'en-US', '2018-10-20 10:01:19', '2018-10-20 10:01:19', 49);
INSERT INTO `product_attribute_translations` VALUES (50, 'The power supply', 'en-US', '2018-10-20 10:01:20', '2018-10-20 10:01:20', 50);
INSERT INTO `product_attribute_translations` VALUES (51, 'Receive the size', 'en-US', '2018-10-20 10:01:21', '2018-10-20 10:01:21', 51);
INSERT INTO `product_attribute_translations` VALUES (52, 'Temperature setting', 'en-US', '2018-10-20 10:01:21', '2018-10-20 10:01:21', 52);
INSERT INTO `product_attribute_translations` VALUES (53, 'The output voltage', 'en-US', '2018-10-20 10:01:22', '2018-10-20 10:01:22', 53);
INSERT INTO `product_attribute_translations` VALUES (54, 'Working part', 'en-US', '2018-10-20 10:01:22', '2018-10-20 10:01:22', 54);
INSERT INTO `product_attribute_translations` VALUES (55, 'The dimensions', 'en-US', '2018-10-20 10:01:24', '2018-10-20 10:01:24', 55);
INSERT INTO `product_attribute_translations` VALUES (56, 'Commodity fabrics', 'en-US', '2018-10-20 10:01:24', '2018-10-20 10:01:24', 56);
INSERT INTO `product_attribute_translations` VALUES (57, 'Goods process', 'en-US', '2018-10-20 10:01:25', '2018-10-20 10:01:25', 57);
INSERT INTO `product_attribute_translations` VALUES (58, 'Commercial grade', 'en-US', '2018-10-20 10:01:25', '2018-10-20 10:01:25', 58);
INSERT INTO `product_attribute_translations` VALUES (59, 'The name of the', 'en-US', '2018-10-22 03:30:01', '2018-10-22 03:30:01', 59);
INSERT INTO `product_attribute_translations` VALUES (60, 'With the body', 'en-US', '2018-10-22 03:30:01', '2018-10-22 03:30:01', 60);
INSERT INTO `product_attribute_translations` VALUES (61, 'Agio', 'en-US', '2018-10-22 03:30:03', '2018-10-22 03:30:03', 61);
INSERT INTO `product_attribute_translations` VALUES (62, 'Material', 'en-US', '2018-10-22 03:30:03', '2018-10-22 03:30:03', 62);
INSERT INTO `product_attribute_translations` VALUES (63, 'The product name', 'en-US', '2018-10-22 03:30:05', '2018-10-22 03:30:05', 63);
INSERT INTO `product_attribute_translations` VALUES (64, 'Product net weight', 'en-US', '2018-10-22 03:30:06', '2018-10-22 03:30:06', 64);
INSERT INTO `product_attribute_translations` VALUES (65, 'Product model', 'en-US', '2018-10-22 03:30:06', '2018-10-22 03:30:06', 65);
INSERT INTO `product_attribute_translations` VALUES (66, 'Execution standard', 'en-US', '2018-10-22 03:30:07', '2018-10-22 03:30:07', 66);
INSERT INTO `product_attribute_translations` VALUES (67, 'The applicable objects', 'en-US', '2018-10-22 03:30:08', '2018-10-22 03:30:08', 67);
INSERT INTO `product_attribute_translations` VALUES (68, 'Gender', 'en-US', '2018-10-22 03:30:08', '2018-10-22 03:30:08', 68);
INSERT INTO `product_attribute_translations` VALUES (69, 'Fold the number', 'en-US', '2018-10-22 03:30:09', '2018-10-22 03:30:09', 69);
INSERT INTO `product_attribute_translations` VALUES (70, 'The internal structure', 'en-US', '2018-10-22 03:30:09', '2018-10-22 03:30:09', 70);
INSERT INTO `product_attribute_translations` VALUES (71, 'Quality of a material', 'en-US', '2018-10-22 03:30:09', '2018-10-22 03:30:09', 71);
INSERT INTO `product_attribute_translations` VALUES (72, 'Pattern', 'en-US', '2018-10-22 03:30:10', '2018-10-22 03:30:10', 72);
INSERT INTO `product_attribute_translations` VALUES (73, 'The colour', 'en-US', '2018-10-22 03:30:11', '2018-10-22 03:30:11', 73);
INSERT INTO `product_attribute_translations` VALUES (74, 'Closed way', 'en-US', '2018-10-22 03:30:11', '2018-10-22 03:30:11', 74);
INSERT INTO `product_attribute_translations` VALUES (75, 'The shape of', 'en-US', '2018-10-22 03:30:12', '2018-10-22 03:30:12', 75);
INSERT INTO `product_attribute_translations` VALUES (76, 'Color classification', 'en-US', '2018-10-22 03:30:12', '2018-10-22 03:30:12', 76);
INSERT INTO `product_attribute_translations` VALUES (77, 'The article number', 'en-US', '2018-10-22 03:30:13', '2018-10-22 03:30:13', 77);
INSERT INTO `product_attribute_translations` VALUES (78, 'Characteristics of the', 'en-US', '2018-10-22 03:30:15', '2018-10-22 03:30:15', 78);
INSERT INTO `product_attribute_translations` VALUES (79, 'Popular element', 'en-US', '2018-10-22 03:30:18', '2018-10-22 03:30:18', 79);
INSERT INTO `product_attribute_translations` VALUES (80, 'Material in the material', 'en-US', '2018-10-22 03:30:20', '2018-10-22 03:30:20', 80);
INSERT INTO `product_attribute_translations` VALUES (81, 'Name of commodity', 'en-US', '2018-10-22 03:30:24', '2018-10-22 03:30:24', 81);
INSERT INTO `product_attribute_translations` VALUES (82, 'The store', 'en-US', '2018-10-22 03:30:24', '2018-10-22 03:30:24', 82);
INSERT INTO `product_attribute_translations` VALUES (83, 'Goods gross weight', 'en-US', '2018-10-22 03:30:25', '2018-10-22 03:30:25', 83);
INSERT INTO `product_attribute_translations` VALUES (84, 'Goods origin', 'en-US', '2018-10-22 03:30:25', '2018-10-22 03:30:25', 84);
INSERT INTO `product_attribute_translations` VALUES (85, 'Shoe materials', 'en-US', '2018-10-22 03:30:26', '2018-10-22 03:30:26', 85);
INSERT INTO `product_attribute_translations` VALUES (86, 'The sole material', 'en-US', '2018-10-22 03:30:28', '2018-10-22 03:30:28', 86);
INSERT INTO `product_attribute_translations` VALUES (87, 'Apply to season', 'en-US', '2018-10-22 03:30:28', '2018-10-22 03:30:28', 87);
INSERT INTO `product_attribute_translations` VALUES (88, 'Production process', 'en-US', '2018-10-22 03:30:29', '2018-10-22 03:30:29', 88);
INSERT INTO `product_attribute_translations` VALUES (89, 'Applicable scenario', 'en-US', '2018-10-22 03:30:30', '2018-10-22 03:30:30', 89);
INSERT INTO `product_attribute_translations` VALUES (90, 'Type of sales channel', 'en-US', '2018-10-22 03:30:33', '2018-10-22 03:30:33', 90);
INSERT INTO `product_attribute_translations` VALUES (91, 'The vamp material', 'en-US', '2018-10-22 03:30:34', '2018-10-22 03:30:34', 91);
INSERT INTO `product_attribute_translations` VALUES (92, 'Followed by a high', 'en-US', '2018-10-22 03:30:35', '2018-10-22 03:30:35', 92);
INSERT INTO `product_attribute_translations` VALUES (93, 'With bottom style', 'en-US', '2018-10-22 03:30:35', '2018-10-22 03:30:35', 93);
INSERT INTO `product_attribute_translations` VALUES (94, 'Suitable for situations', 'en-US', '2018-10-22 03:30:36', '2018-10-22 03:30:36', 94);
INSERT INTO `product_attribute_translations` VALUES (95, 'The thickness of the', 'en-US', '2018-10-22 03:30:40', '2018-10-22 03:30:40', 95);
INSERT INTO `product_attribute_translations` VALUES (96, 'Get model', 'en-US', '2018-10-22 03:30:40', '2018-10-22 03:30:40', 96);
INSERT INTO `product_attribute_translations` VALUES (97, 'Combination of specifications', 'en-US', '2018-10-22 03:30:42', '2018-10-22 03:30:42', 97);
INSERT INTO `product_attribute_translations` VALUES (98, 'Sleeve length', 'en-US', '2018-10-22 03:30:43', '2018-10-22 03:30:43', 98);
INSERT INTO `product_attribute_translations` VALUES (99, 'Placket', 'en-US', '2018-10-22 03:30:43', '2018-10-22 03:30:43', 99);
INSERT INTO `product_attribute_translations` VALUES (100, 'Height', 'en-US', '2018-10-22 03:30:44', '2018-10-22 03:30:44', 100);
INSERT INTO `product_attribute_translations` VALUES (101, 'Fabric is known as', 'en-US', '2018-10-22 03:30:47', '2018-10-22 03:30:47', 101);
INSERT INTO `product_attribute_translations` VALUES (102, 'Main material of fabric', 'en-US', '2018-10-22 03:30:47', '2018-10-22 03:30:47', 102);
INSERT INTO `product_attribute_translations` VALUES (103, 'Component content', 'en-US', '2018-10-22 03:30:48', '2018-10-22 03:30:48', 103);
INSERT INTO `product_attribute_translations` VALUES (104, 'Thickness', 'en-US', '2018-10-22 03:30:48', '2018-10-22 03:30:48', 104);
INSERT INTO `product_attribute_translations` VALUES (105, 'Garment style details', 'en-US', '2018-10-22 03:30:49', '2018-10-22 03:30:49', 105);
INSERT INTO `product_attribute_translations` VALUES (106, 'Home dress style', 'en-US', '2018-10-22 03:30:50', '2018-10-22 03:30:50', 106);
INSERT INTO `product_attribute_translations` VALUES (107, 'Suitable for season', 'en-US', '2018-10-22 03:30:52', '2018-10-22 03:30:52', 107);
INSERT INTO `product_attribute_translations` VALUES (108, 'The fabric name', 'en-US', '2018-10-22 03:30:52', '2018-10-22 03:30:52', 108);
INSERT INTO `product_attribute_translations` VALUES (109, 'The waist type', 'en-US', '2018-10-22 03:30:58', '2018-10-22 03:30:58', 109);
INSERT INTO `product_attribute_translations` VALUES (110, 'Number', 'en-US', '2018-10-22 03:31:00', '2018-10-22 03:31:00', 110);
INSERT INTO `product_attribute_translations` VALUES (111, 'Stopped by the material', 'en-US', '2018-10-22 03:31:01', '2018-10-22 03:31:01', 111);
INSERT INTO `product_attribute_translations` VALUES (112, 'Cotton variety', 'en-US', '2018-10-22 03:31:01', '2018-10-22 03:31:01', 112);
INSERT INTO `product_attribute_translations` VALUES (113, 'Bedding process', 'en-US', '2018-10-22 03:31:02', '2018-10-22 03:31:02', 113);
INSERT INTO `product_attribute_translations` VALUES (114, 'The density of the fabric', 'en-US', '2018-10-22 03:31:03', '2018-10-22 03:31:03', 114);
INSERT INTO `product_attribute_translations` VALUES (115, 'Applicable bed size', 'en-US', '2018-10-22 03:31:04', '2018-10-22 03:31:04', 115);
INSERT INTO `product_attribute_translations` VALUES (116, 'Bedding fabric', 'en-US', '2018-10-22 03:31:05', '2018-10-22 03:31:05', 116);
INSERT INTO `product_attribute_translations` VALUES (117, 'The fabric count', 'en-US', '2018-10-22 03:31:06', '2018-10-22 03:31:06', 117);
INSERT INTO `product_attribute_translations` VALUES (118, 'Dyeing and printing process', 'en-US', '2018-10-22 03:31:06', '2018-10-22 03:31:06', 118);
INSERT INTO `product_attribute_translations` VALUES (119, 'Weaving process', 'en-US', '2018-10-22 03:31:06', '2018-10-22 03:31:06', 119);
INSERT INTO `product_attribute_translations` VALUES (120, 'Main components of fabric', 'en-US', '2018-10-22 03:31:07', '2018-10-22 03:31:07', 120);
INSERT INTO `product_attribute_translations` VALUES (121, 'Main component content of fabric', 'en-US', '2018-10-22 03:31:07', '2018-10-22 03:31:07', 121);
INSERT INTO `product_attribute_translations` VALUES (122, 'Packing list', 'en-US', '2018-10-22 03:31:09', '2018-10-22 03:31:09', 122);
INSERT INTO `product_attribute_translations` VALUES (123, 'Width', 'en-US', '2018-10-22 03:31:09', '2018-10-22 03:31:09', 123);
INSERT INTO `product_attribute_translations` VALUES (124, 'Skirt hem', 'en-US', '2018-10-22 03:31:10', '2018-10-22 03:31:10', 124);
INSERT INTO `product_attribute_translations` VALUES (125, 'Pillowcase', 'en-US', '2018-10-22 03:31:10', '2018-10-22 03:31:10', 125);
INSERT INTO `product_attribute_translations` VALUES (126, 'Process', 'en-US', '2018-10-22 03:31:13', '2018-10-22 03:31:13', 126);
INSERT INTO `product_attribute_translations` VALUES (127, 'Washing instructions', 'en-US', '2018-10-22 03:31:13', '2018-10-22 03:31:13', 127);
INSERT INTO `product_attribute_translations` VALUES (128, 'Classification', 'en-US', '2018-10-22 03:31:17', '2018-10-22 03:31:17', 128);
INSERT INTO `product_attribute_translations` VALUES (129, 'The fabric', 'en-US', '2018-10-22 03:31:17', '2018-10-22 03:31:17', 129);
INSERT INTO `product_attribute_translations` VALUES (130, 'Specifications', 'en-US', '2018-10-22 03:31:21', '2018-10-22 03:31:21', 130);
INSERT INTO `product_attribute_translations` VALUES (131, 'Composition', 'en-US', '2018-10-22 03:31:22', '2018-10-22 03:31:22', 131);
INSERT INTO `product_attribute_translations` VALUES (132, 'Specific material', 'en-US', '2018-10-22 03:31:25', '2018-10-22 03:31:25', 132);
INSERT INTO `product_attribute_translations` VALUES (133, 'New material proportion of plastic', 'en-US', '2018-10-22 03:31:25', '2018-10-22 03:31:25', 133);
INSERT INTO `product_attribute_translations` VALUES (134, 'Commodity characteristics', 'en-US', '2018-10-22 03:31:26', '2018-10-22 03:31:26', 134);
INSERT INTO `product_attribute_translations` VALUES (135, 'Scope of application', 'en-US', '2018-10-22 03:31:28', '2018-10-22 03:31:28', 135);
INSERT INTO `product_attribute_translations` VALUES (136, 'Receive a scenario', 'en-US', '2018-10-22 03:31:28', '2018-10-22 03:31:28', 136);
INSERT INTO `product_attribute_translations` VALUES (137, 'Applicable for gift occasions', 'en-US', '2018-10-22 03:31:32', '2018-10-22 03:31:32', 137);
INSERT INTO `product_attribute_translations` VALUES (138, 'Appearance of size', 'en-US', '2018-10-22 03:31:32', '2018-10-22 03:31:32', 138);
INSERT INTO `product_attribute_translations` VALUES (139, 'Apply to gender', 'en-US', '2018-10-22 03:31:33', '2018-10-22 03:31:33', 139);
INSERT INTO `product_attribute_translations` VALUES (140, 'General style', 'en-US', '2018-10-22 03:31:34', '2018-10-22 03:31:34', 140);
INSERT INTO `product_attribute_translations` VALUES (141, 'Outdoor project', 'en-US', '2018-10-22 03:31:36', '2018-10-22 03:31:36', 141);
INSERT INTO `product_attribute_translations` VALUES (142, 'Phase', 'en-US', '2018-10-22 03:31:38', '2018-10-22 03:31:38', 142);
INSERT INTO `product_attribute_translations` VALUES (143, 'Applicable age', 'en-US', '2018-10-22 03:31:41', '2018-10-22 03:31:41', 143);
INSERT INTO `product_attribute_translations` VALUES (144, 'Internal material', 'en-US', '2018-10-22 08:24:43', '2018-10-22 08:24:43', 144);
INSERT INTO `product_attribute_translations` VALUES (145, 'The external material', 'en-US', '2018-10-22 08:24:43', '2018-10-22 08:24:43', 145);
INSERT INTO `product_attribute_translations` VALUES (146, 'Capacity', 'en-US', '2018-10-22 08:24:46', '2018-10-22 08:24:46', 146);
INSERT INTO `product_attribute_translations` VALUES (147, 'Working voltage', 'en-US', '2018-10-22 08:24:46', '2018-10-22 08:24:46', 147);
INSERT INTO `product_attribute_translations` VALUES (148, 'Security and protection', 'en-US', '2018-10-22 08:24:47', '2018-10-22 08:24:47', 148);
INSERT INTO `product_attribute_translations` VALUES (149, 'The quantity of the fog', 'en-US', '2018-10-22 08:24:47', '2018-10-22 08:24:47', 149);
INSERT INTO `product_attribute_translations` VALUES (150, 'Db', 'en-US', '2018-10-22 08:24:47', '2018-10-22 08:24:47', 150);
INSERT INTO `product_attribute_translations` VALUES (151, 'Applicable area', 'en-US', '2018-10-22 08:24:47', '2018-10-22 08:24:47', 151);
INSERT INTO `product_attribute_translations` VALUES (152, 'The thickness of the product', 'en-US', '2018-10-22 08:24:48', '2018-10-22 08:24:48', 152);
INSERT INTO `product_attribute_translations` VALUES (153, 'Stent size', 'en-US', '2018-10-22 08:24:48', '2018-10-22 08:24:48', 153);
INSERT INTO `product_attribute_translations` VALUES (154, 'Power interface cable', 'en-US', '2018-10-22 08:24:50', '2018-10-22 08:24:50', 154);
INSERT INTO `product_attribute_translations` VALUES (155, 'Input voltage requirement', 'en-US', '2018-10-22 08:24:51', '2018-10-22 08:24:51', 155);
INSERT INTO `product_attribute_translations` VALUES (156, 'Input current requirement', 'en-US', '2018-10-22 08:24:51', '2018-10-22 08:24:51', 156);
INSERT INTO `product_attribute_translations` VALUES (157, 'Working frequency', 'en-US', '2018-10-22 08:24:51', '2018-10-22 08:24:51', 157);
INSERT INTO `product_attribute_translations` VALUES (158, 'Working temperature', 'en-US', '2018-10-22 08:24:51', '2018-10-22 08:24:51', 158);
INSERT INTO `product_attribute_translations` VALUES (159, 'Bluetooth version', 'en-US', '2018-10-22 08:24:51', '2018-10-22 08:24:51', 159);
INSERT INTO `product_attribute_translations` VALUES (160, 'Support', 'en-US', '2018-10-22 08:24:52', '2018-10-22 08:24:52', 160);
INSERT INTO `product_attribute_translations` VALUES (161, 'Wireless charging transmission distance', 'en-US', '2018-10-22 08:24:52', '2018-10-22 08:24:52', 161);
INSERT INTO `product_attribute_translations` VALUES (162, 'The packing way', 'en-US', '2018-10-22 08:24:54', '2018-10-22 08:24:54', 162);
INSERT INTO `product_attribute_translations` VALUES (163, 'Product packaging', 'en-US', '2018-10-22 08:24:56', '2018-10-22 08:24:56', 163);
INSERT INTO `product_attribute_translations` VALUES (164, 'Applicable people', 'en-US', '2018-10-22 08:24:58', '2018-10-22 08:24:58', 164);
INSERT INTO `product_attribute_translations` VALUES (165, 'Fillers', 'en-US', '2018-10-22 08:24:59', '2018-10-22 08:24:59', 165);
INSERT INTO `product_attribute_translations` VALUES (166, 'The interface type', 'en-US', '2018-10-22 08:25:02', '2018-10-22 08:25:02', 166);
INSERT INTO `product_attribute_translations` VALUES (167, 'The key number', 'en-US', '2018-10-22 08:25:02', '2018-10-22 08:25:02', 167);
INSERT INTO `product_attribute_translations` VALUES (168, 'Wireless distance', 'en-US', '2018-10-22 08:25:02', '2018-10-22 08:25:02', 168);
INSERT INTO `product_attribute_translations` VALUES (169, 'Wireless technology', 'en-US', '2018-10-22 08:25:03', '2018-10-22 08:25:03', 169);
INSERT INTO `product_attribute_translations` VALUES (170, 'The battery model', 'en-US', '2018-10-22 08:25:03', '2018-10-22 08:25:03', 170);
INSERT INTO `product_attribute_translations` VALUES (171, 'Roller number', 'en-US', '2018-10-22 08:25:03', '2018-10-22 08:25:03', 171);
INSERT INTO `product_attribute_translations` VALUES (172, 'Way to work', 'en-US', '2018-10-22 08:25:04', '2018-10-22 08:25:04', 172);
INSERT INTO `product_attribute_translations` VALUES (173, 'The connection method', 'en-US', '2018-10-22 08:25:07', '2018-10-22 08:25:07', 173);
INSERT INTO `product_attribute_translations` VALUES (174, 'Line length', 'en-US', '2018-10-22 08:25:07', '2018-10-22 08:25:07', 174);
INSERT INTO `product_attribute_translations` VALUES (175, 'The product type', 'en-US', '2018-10-22 08:25:08', '2018-10-22 08:25:08', 175);
INSERT INTO `product_attribute_translations` VALUES (176, 'Product categories', 'en-US', '2018-10-22 08:25:10', '2018-10-22 08:25:10', 176);
INSERT INTO `product_attribute_translations` VALUES (177, 'Wrist joe', 'en-US', '2018-10-22 08:25:11', '2018-10-22 08:25:11', 177);
INSERT INTO `product_attribute_translations` VALUES (178, 'Product characteristics', 'en-US', '2018-10-22 08:25:13', '2018-10-22 08:25:13', 178);
INSERT INTO `product_attribute_translations` VALUES (179, 'Product category', 'en-US', '2018-10-22 08:25:14', '2018-10-22 08:25:14', 179);
INSERT INTO `product_attribute_translations` VALUES (180, 'Diameter of heat conducting body', 'en-US', '2018-10-22 08:25:14', '2018-10-22 08:25:14', 180);
INSERT INTO `product_attribute_translations` VALUES (181, 'For modelling', 'en-US', '2018-10-22 08:25:14', '2018-10-22 08:25:14', 181);
INSERT INTO `product_attribute_translations` VALUES (182, 'Warm up time', 'en-US', '2018-10-22 08:25:15', '2018-10-22 08:25:15', 182);
INSERT INTO `product_attribute_translations` VALUES (183, 'Iron plate temperature', 'en-US', '2018-10-22 08:25:16', '2018-10-22 08:25:16', 183);
INSERT INTO `product_attribute_translations` VALUES (184, 'Wooden handle material', 'en-US', '2018-10-22 08:25:16', '2018-10-22 08:25:16', 184);
INSERT INTO `product_attribute_translations` VALUES (185, 'Air cushion material', 'en-US', '2018-10-22 08:25:17', '2018-10-22 08:25:17', 185);
INSERT INTO `product_attribute_translations` VALUES (186, 'Woolen material', 'en-US', '2018-10-22 08:25:17', '2018-10-22 08:25:17', 186);
INSERT INTO `product_attribute_translations` VALUES (187, 'Massage material', 'en-US', '2018-10-22 08:25:18', '2018-10-22 08:25:18', 187);
INSERT INTO `product_attribute_translations` VALUES (188, 'Origin', 'en-US', '2018-10-22 08:26:35', '2018-10-22 08:26:35', 188);
INSERT INTO `product_attribute_translations` VALUES (189, 'The length of the', 'en-US', '2018-10-22 08:26:37', '2018-10-22 08:26:37', 189);
INSERT INTO `product_attribute_translations` VALUES (190, 'Length of stainless steel blade', 'en-US', '2018-10-22 08:26:43', '2018-10-22 08:26:43', 190);
INSERT INTO `product_attribute_translations` VALUES (191, 'Security category', 'en-US', '2018-10-22 08:26:45', '2018-10-22 08:26:45', 191);
INSERT INTO `product_attribute_translations` VALUES (192, 'Classification of motion', 'en-US', '2018-10-22 08:26:49', '2018-10-22 08:26:49', 192);
INSERT INTO `product_attribute_translations` VALUES (193, 'Top material', 'en-US', '2018-10-22 08:26:50', '2018-10-22 08:26:50', 193);
INSERT INTO `product_attribute_translations` VALUES (194, 'Use', 'en-US', '2018-10-22 08:26:56', '2018-10-22 08:26:56', 194);
INSERT INTO `product_attribute_translations` VALUES (195, 'Goods size', 'en-US', '2018-10-22 08:27:02', '2018-10-22 08:27:02', 195);
INSERT INTO `product_attribute_translations` VALUES (196, 'Weight of goods', 'en-US', '2018-10-22 08:27:02', '2018-10-22 08:27:02', 196);
INSERT INTO `product_attribute_translations` VALUES (197, 'Material goods', 'en-US', '2018-10-22 08:27:02', '2018-10-22 08:27:02', 197);
INSERT INTO `product_attribute_translations` VALUES (198, 'Commodity packaging', 'en-US', '2018-10-22 08:27:03', '2018-10-22 08:27:03', 198);
INSERT INTO `product_attribute_translations` VALUES (199, 'Heat preservation performance', 'en-US', '2018-10-22 08:27:09', '2018-10-22 08:27:09', 199);
INSERT INTO `product_attribute_translations` VALUES (200, 'Subdivision capacity', 'en-US', '2018-10-22 08:27:10', '2018-10-22 08:27:10', 200);
INSERT INTO `product_attribute_translations` VALUES (201, 'Gross weight', 'en-US', '2018-10-22 08:27:10', '2018-10-22 08:27:10', 201);
INSERT INTO `product_attribute_translations` VALUES (202, 'The net weight', 'en-US', '2018-10-22 08:27:13', '2018-10-22 08:27:13', 202);
INSERT INTO `product_attribute_translations` VALUES (203, 'The screen', 'en-US', '2018-10-22 08:27:14', '2018-10-22 08:27:14', 203);
INSERT INTO `product_attribute_translations` VALUES (204, 'Standby Time', 'en-US', '2018-10-22 08:27:15', '2018-10-24 17:37:57', 204);
INSERT INTO `product_attribute_translations` VALUES (204, '使用时间', 'zh_CN', '2018-10-24 17:37:57', '2018-10-24 17:37:57', 205);
INSERT INTO `product_attribute_translations` VALUES (203, '显示屏', 'zh_CN', '2018-10-24 17:43:25', '2018-10-24 17:43:25', 206);
COMMIT;

-- ----------------------------
-- Table structure for product_attribute_values
-- ----------------------------
DROP TABLE IF EXISTS `product_attribute_values`;
CREATE TABLE `product_attribute_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `locale_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int(11) DEFAULT NULL,
  `float_value` double(8,2) DEFAULT NULL,
  `datetime_value` date DEFAULT NULL,
  `date_value` datetime DEFAULT NULL,
  `json_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_attribute_values_locale_code_index` (`locale_code`),
  KEY `product_attribute_values_product_id_index` (`product_id`),
  KEY `product_attribute_values_attribute_id_index` (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=442 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_attribute_values
-- ----------------------------
BEGIN;
INSERT INTO `product_attribute_values` VALUES (1, 2, 4, 'en-US', 'Chinese Mainland', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-19 07:27:59', '2018-10-19 07:27:59');
INSERT INTO `product_attribute_values` VALUES (2, 2, 4, 'en-US', 'Chinese Mainland', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-19 07:28:23', '2018-10-19 07:28:23');
INSERT INTO `product_attribute_values` VALUES (3, 2, 3, 'en-US', '2~4档', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-19 07:28:23', '2018-10-19 07:28:23');
INSERT INTO `product_attribute_values` VALUES (4, 2, 4, 'en-US', 'Chinese Mainland', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-19 07:29:05', '2018-10-19 07:29:05');
INSERT INTO `product_attribute_values` VALUES (5, 2, 3, 'en-US', '2~4档', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-19 07:29:05', '2018-10-19 07:29:05');
INSERT INTO `product_attribute_values` VALUES (6, 4, 6, 'en-US', 'unlimited', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-19 09:48:05', '2018-10-19 09:59:26');
INSERT INTO `product_attribute_values` VALUES (7, 4, 7, 'en-US', 'Bilateral electric', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-19 09:48:05', '2018-10-19 09:59:26');
INSERT INTO `product_attribute_values` VALUES (8, 3, 8, 'en-US', 'suoruier', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-19 10:07:54', '2018-10-19 10:09:14');
INSERT INTO `product_attribute_values` VALUES (9, 3, 9, 'en-US', 'SRE-C89', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-19 10:09:14', '2018-10-19 10:09:14');
INSERT INTO `product_attribute_values` VALUES (10, 6, 8, 'en-US', 'MUBO', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-19 10:28:41', '2018-10-19 10:28:41');
INSERT INTO `product_attribute_values` VALUES (11, 6, 8, 'en-US', 'MUBO', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-19 10:29:34', '2018-10-19 10:29:34');
INSERT INTO `product_attribute_values` VALUES (12, 6, 11, 'en-US', '黑色/米色', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-19 10:29:34', '2018-10-19 10:29:34');
INSERT INTO `product_attribute_values` VALUES (13, 6, 10, 'en-US', '简约时尚', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-19 10:29:34', '2018-10-19 10:29:34');
INSERT INTO `product_attribute_values` VALUES (14, 6, 8, 'en-US', 'MUBO', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-19 10:29:59', '2018-10-19 10:29:59');
INSERT INTO `product_attribute_values` VALUES (15, 6, 11, 'en-US', '黑色/米色', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-19 10:29:59', '2018-10-19 10:29:59');
INSERT INTO `product_attribute_values` VALUES (16, 6, 10, 'en-US', '简约时尚', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-19 10:29:59', '2018-10-19 10:29:59');
INSERT INTO `product_attribute_values` VALUES (17, 6, 8, 'en-US', 'MUBO', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-19 10:30:10', '2018-10-19 10:30:10');
INSERT INTO `product_attribute_values` VALUES (18, 6, 11, 'en-US', '黑色/米色', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-19 10:30:10', '2018-10-19 10:30:10');
INSERT INTO `product_attribute_values` VALUES (19, 6, 10, 'en-US', '简约时尚', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-19 10:30:10', '2018-10-19 10:30:10');
INSERT INTO `product_attribute_values` VALUES (20, 6, 6, 'en-US', '10', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-19 10:30:10', '2018-10-19 10:30:10');
INSERT INTO `product_attribute_values` VALUES (21, 7, 12, 'en-US', '1.2', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-19 10:44:11', '2018-10-19 10:44:11');
INSERT INTO `product_attribute_values` VALUES (22, 7, 13, 'en-US', 'Household tools', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-19 10:44:11', '2018-10-19 10:44:11');
INSERT INTO `product_attribute_values` VALUES (23, 7, 8, 'en-US', 'CREST', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-19 10:44:11', '2018-10-19 10:44:11');
INSERT INTO `product_attribute_values` VALUES (24, 9, 12, 'en-US', '30g', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-20 02:38:13', '2018-10-20 03:04:50');
INSERT INTO `product_attribute_values` VALUES (25, 9, 14, 'en-US', '9mm', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-20 02:38:13', '2018-10-20 03:04:50');
INSERT INTO `product_attribute_values` VALUES (27, 9, 13, 'en-US', 'aa', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-20 03:04:24', '2018-10-20 03:04:50');
INSERT INTO `product_attribute_values` VALUES (28, 10, 12, 'en-US', '0.2kg', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-20 07:51:16', '2018-10-20 07:51:16');
INSERT INTO `product_attribute_values` VALUES (29, 10, 12, 'en-US', '0.2kg', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-20 07:51:34', '2018-10-20 07:51:34');
INSERT INTO `product_attribute_values` VALUES (30, 10, 4, 'en-US', 'China', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-20 07:51:34', '2018-10-20 07:51:34');
INSERT INTO `product_attribute_values` VALUES (31, 10, 12, 'en-US', '0.2kg', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-20 07:51:43', '2018-10-20 07:51:43');
INSERT INTO `product_attribute_values` VALUES (32, 10, 4, 'en-US', 'China', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-20 07:51:43', '2018-10-20 07:51:43');
INSERT INTO `product_attribute_values` VALUES (33, 11, 8, 'en-US', 'qingniao', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-20 08:02:32', '2018-10-20 08:03:32');
INSERT INTO `product_attribute_values` VALUES (34, 12, 12, 'en-US', '1.2kg', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-20 08:43:11', '2018-10-20 08:43:11');
INSERT INTO `product_attribute_values` VALUES (35, 12, 12, 'en-US', '1.2kg', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-20 08:43:21', '2018-10-20 08:43:21');
INSERT INTO `product_attribute_values` VALUES (36, 12, 4, 'en-US', 'China', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-20 08:43:21', '2018-10-20 08:43:21');
INSERT INTO `product_attribute_values` VALUES (37, 12, 12, 'en-US', '1.2kg', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-20 08:46:28', '2018-10-20 08:46:28');
INSERT INTO `product_attribute_values` VALUES (38, 12, 4, 'en-US', 'China', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-20 08:46:28', '2018-10-20 08:46:28');
INSERT INTO `product_attribute_values` VALUES (39, 12, 8, 'en-US', 'zhongYuan', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-20 08:46:28', '2018-10-20 08:46:28');
INSERT INTO `product_attribute_values` VALUES (40, 13, 15, 'en-US', '30g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (41, 13, 16, 'en-US', '9mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (42, 13, 17, 'en-US', 'Cowhide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (43, 14, 18, 'en-US', 'Alloy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (44, 14, 19, 'en-US', '20000mAh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (45, 15, 17, 'en-US', 'Cortical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (46, 15, 20, 'en-US', '6000mAh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (47, 16, 21, 'en-US', '165g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (48, 16, 22, 'en-US', '10w、7.5w、5w', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (49, 16, 23, 'en-US', '8mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (50, 16, 24, 'en-US', 'Apple android', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (51, 17, 25, 'en-US', '136*44*24mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (52, 17, 21, 'en-US', '142g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (53, 17, 20, 'en-US', '6000mAh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (54, 17, 26, 'en-US', 'About 4 h', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (55, 18, 27, 'en-US', '123cm*30cm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (56, 19, 15, 'en-US', '90g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (57, 19, 28, 'en-US', 'In the 1000 g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (58, 19, 29, 'en-US', '0 270mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (59, 19, 30, 'en-US', 'The phones 35 7 inch tablet is compatible with a full digital camera 1kg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (60, 20, 25, 'en-US', '119.9mm*4.3mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (61, 20, 21, 'en-US', '9.5g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (62, 20, 31, 'en-US', '1.9mm PixelPoint', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (63, 20, 32, 'en-US', '40 shutter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (64, 21, 8, 'en-US', 'Benks bunker shi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (65, 21, 33, 'en-US', 'Eu uk aus usa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (66, 21, 34, 'en-US', 'PC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (67, 21, 25, 'en-US', '72.9*54.2*52.6(mm)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (68, 21, 35, 'en-US', '880W 110V~1840W 230V', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (69, 21, 36, 'en-US', '100 240V~50Hz/60hZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (70, 21, 11, 'en-US', 'The phantom black', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (71, 21, 15, 'en-US', '145g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (72, 22, 37, 'en-US', 'Over 5 hours of super long endurance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (73, 22, 38, 'en-US', 'Cvc echo cancellation clear callmic call distance 60cm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (74, 22, 20, 'en-US', '700MAH/3.7V', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (75, 22, 39, 'en-US', 'Support wmaapeflacwav and other formats', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (76, 22, 40, 'en-US', '10min the open air', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (77, 22, 41, 'en-US', 'CLASS2, 6DBM~+4DBM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (78, 22, 42, 'en-US', '>70DB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (79, 22, 21, 'en-US', '156g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (80, 22, 27, 'en-US', '111*81*35mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (81, 23, 8, 'en-US', 'Musicanvas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (82, 23, 9, 'en-US', 'Mondrian', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (83, 23, 27, 'en-US', '280*110*133mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (84, 23, 21, 'en-US', '1500g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (85, 24, 8, 'en-US', 'LAMBDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (86, 24, 43, 'en-US', '2600mAH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (87, 24, 9, 'en-US', 'A1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (88, 24, 26, 'en-US', '2.5h/4min', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (89, 24, 44, 'en-US', '40 times', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (90, 24, 45, 'en-US', '4min', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (91, 24, 17, 'en-US', 'Pcaluminumpeek', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (92, 24, 46, 'en-US', '105.8*51.8*21.8mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (93, 24, 47, 'en-US', '14.5*91mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (94, 25, 48, 'en-US', '180kg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (95, 25, 49, 'en-US', '78*28mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (96, 25, 17, 'en-US', '5mm fully tempered glass', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (97, 25, 50, 'en-US', '6V（4*1.5V）', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (98, 25, 25, 'en-US', '300*300*23mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (99, 26, 25, 'en-US', '23cm*10.5cm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (100, 26, 51, 'en-US', '13cm*16cm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (101, 26, 52, 'en-US', 'High document 45 50 the temperature profile in the 42 45 low temperature shift in 37 42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (102, 26, 53, 'en-US', '5V', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (103, 26, 54, 'en-US', 'Eyes and around the eyes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (104, 27, 55, 'en-US', '75cm*40cm*180g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (105, 27, 56, 'en-US', '100 cotton except for decoration', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (106, 27, 57, 'en-US', 'Plain satin embroidery', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (107, 27, 58, 'en-US', 'Grade a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (108, 28, 8, 'en-US', 'SXLLNS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (109, 28, 59, 'en-US', 'Natural cowhide casual fashion vintage pin button', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (110, 28, 9, 'en-US', 'Sx zH344', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (111, 28, 60, 'en-US', 'Dimension length 105 130cm width 38cm thickness 04cm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (112, 28, 10, 'en-US', 'Fashionable joker', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (113, 28, 61, 'en-US', 'The size is 69cm long 5cm wide 07cm thick', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (114, 28, 62, 'en-US', 'Head layer cowhide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (115, 28, 11, 'en-US', 'Brown black', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (116, 29, 63, 'en-US', '90 min light business top layer cattle pickup bag with horizontal rebate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (117, 29, 25, 'en-US', '100×76mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (118, 29, 34, 'en-US', 'The top layer of cross cut cowhide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (119, 29, 64, 'en-US', '288g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (120, 29, 65, 'en-US', 'RMST03QB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (121, 29, 66, 'en-US', 'QB/T 1619 2006', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (122, 30, 8, 'en-US', 'FIVEDIRECTION', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (123, 30, 67, 'en-US', 'Youth', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (124, 30, 68, 'en-US', 'Female', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (125, 30, 69, 'en-US', '2 fold', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (126, 30, 70, 'en-US', 'Large bills with small change card position', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (127, 30, 71, 'en-US', 'Sheepskin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (128, 30, 10, 'en-US', 'Short a wallet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-22 06:22:45');
INSERT INTO `product_attribute_values` VALUES (129, 30, 72, 'en-US', 'Pure color', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (130, 30, 73, 'en-US', 'New', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (131, 30, 10, 'en-US', 'Short a wallet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (132, 30, 74, 'en-US', 'Exposure to', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (133, 30, 75, 'en-US', 'Cross section', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (134, 30, 76, 'en-US', 'Gray black pale grassy green', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (135, 30, 77, 'en-US', 'SA013', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (136, 31, 8, 'en-US', 'Class and the slave', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (137, 31, 71, 'en-US', 'Cowhide leather', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (138, 31, 78, 'en-US', 'And skin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (139, 31, 74, 'en-US', 'Buckles', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (140, 31, 72, 'en-US', 'Stripe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (141, 31, 10, 'en-US', 'Long wallet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-22 06:26:35');
INSERT INTO `product_attribute_values` VALUES (142, 31, 75, 'en-US', 'Cross section', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (143, 31, 73, 'en-US', 'New', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (144, 31, 68, 'en-US', 'Female', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (145, 31, 79, 'en-US', 'Car suture', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (146, 31, 76, 'en-US', 'Black pink red rose red purple blue gold', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (147, 31, 70, 'en-US', 'Large banknote holder photo pocket change zip case card pocket check pocket', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (148, 31, 77, 'en-US', 'BYN 1611', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (149, 31, 80, 'en-US', 'Tc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (150, 31, 67, 'en-US', 'Youth', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (151, 31, 69, 'en-US', '3 fold', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (152, 31, 10, 'en-US', 'Long wallet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (153, 32, 81, 'en-US', 'Luladi flip flops mens beach slippers mens non slip slippers black', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (154, 32, 82, 'en-US', 'The luadi flagship store', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (155, 32, 83, 'en-US', '500.00g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (156, 32, 84, 'en-US', 'The chinese mainland', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (157, 32, 77, 'en-US', 'L049AM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (158, 32, 27, 'en-US', '38,39,40,41,42,43,44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (159, 32, 10, 'en-US', 'Flip flops', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-22 06:34:05');
INSERT INTO `product_attribute_values` VALUES (160, 32, 85, 'en-US', 'Pvc chemical fiber', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (161, 32, 11, 'en-US', 'Black white brown', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (162, 32, 10, 'en-US', 'Flip flops', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (163, 32, 72, 'en-US', 'Pure color', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (164, 32, 86, 'en-US', 'Rubber', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (165, 32, 87, 'en-US', 'In the summer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (166, 32, 2, 'en-US', 'Non slip', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (167, 32, 88, 'en-US', 'Sticky shoes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (168, 32, 89, 'en-US', 'The beach', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (169, 33, 90, 'en-US', 'Same store both online and offline', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (170, 33, 10, 'en-US', 'Leisure', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (171, 33, 91, 'en-US', 'Plastic', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (172, 33, 86, 'en-US', 'Rubber', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (174, 33, 92, 'en-US', 'Flat heel less than or equal to 1cm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (175, 33, 93, 'en-US', 'Flats', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (176, 33, 88, 'en-US', 'Injection molding shoes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (177, 33, 94, 'en-US', 'The beach', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (178, 33, 72, 'en-US', 'Pure color', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (179, 33, 67, 'en-US', 'Youth ages 18 40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (180, 33, 76, 'en-US', 'Black size', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (181, 33, 8, 'en-US', 'Havaianas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (182, 34, 9, 'en-US', 'Set head', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (183, 34, 10, 'en-US', 'Contracted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (184, 34, 95, 'en-US', 'Thin section', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (185, 34, 96, 'en-US', 'Round collar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (186, 34, 11, 'en-US', 'Green blue and pink', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (187, 34, 17, 'en-US', 'Modal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (188, 34, 87, 'en-US', 'In the fall', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (189, 34, 27, 'en-US', 'S,M,L,XL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (190, 34, 97, 'en-US', 'Dress and trousers in two pieces', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (191, 34, 79, 'en-US', 'Pocket', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (192, 34, 98, 'en-US', '7 minutes of sleeve clothes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (193, 34, 99, 'en-US', 'Set head', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (194, 34, 100, 'en-US', 'Trousers', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (195, 34, 72, 'en-US', 'Pure color', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (196, 35, 89, 'en-US', 'Leisure household', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (197, 35, 67, 'en-US', 'Youth', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (198, 35, 101, 'en-US', 'Pure cotton', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (199, 35, 102, 'en-US', 'Cotton', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (200, 35, 103, 'en-US', 'More than 95', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (201, 35, 104, 'en-US', 'Conventional', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (202, 35, 72, 'en-US', 'Pure color', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (203, 35, 105, 'en-US', 'Printing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (204, 35, 96, 'en-US', 'Big coat lapels', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (205, 35, 99, 'en-US', 'Mandarin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (206, 35, 106, 'en-US', 'Contracted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (207, 36, 72, 'en-US', 'Pure color', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (208, 36, 107, 'en-US', 'Autumn winter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (209, 36, 108, 'en-US', 'Cotton kind of blended', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (210, 37, 2, 'en-US', 'Hygroscopic perspiration rate dry breathable super flexibility', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (211, 37, 17, 'en-US', 'Spandex', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (212, 37, 109, 'en-US', 'In the waist', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (213, 38, 110, 'en-US', '4 pieces', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (214, 38, 111, 'en-US', 'Cotton', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (215, 38, 112, 'en-US', 'G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (216, 38, 103, 'en-US', '100%', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (217, 38, 113, 'en-US', 'Quilting other', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (218, 38, 72, 'en-US', 'Pure color', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (219, 38, 10, 'en-US', 'Sheet type', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (220, 38, 76, 'en-US', 'Purple grey powder light stone blue ice silver gentleman grey dark green blue orchid gold light blue grey red grey', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (221, 38, 114, 'en-US', '200*98', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (222, 38, 115, 'en-US', '15m 5ft bedding covers', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (223, 39, 116, 'en-US', 'Pure cotton', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (224, 39, 114, 'en-US', '8474', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (225, 39, 117, 'en-US', '32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (226, 39, 118, 'en-US', 'Reactive dyeing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (227, 39, 119, 'en-US', 'The jet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (228, 39, 120, 'en-US', 'Cotton', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (229, 39, 121, 'en-US', '100', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (230, 39, 72, 'en-US', 'Stripe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (231, 40, 122, 'en-US', 'Bed li 1 pillowcase 2 storage bag 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (232, 40, 123, 'en-US', '180cm×200cm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-22 08:17:39');
INSERT INTO `product_attribute_values` VALUES (233, 40, 124, 'en-US', '30cm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (234, 40, 125, 'en-US', '48cm×74cm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-22 08:17:39');
INSERT INTO `product_attribute_values` VALUES (235, 40, 11, 'en-US', 'White', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (236, 40, 123, 'en-US', '180cm×200cm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (237, 40, 124, 'en-US', '30cm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (238, 40, 125, 'en-US', '48cm×74cm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (239, 40, 11, 'en-US', 'White', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (240, 41, 17, 'en-US', 'G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (241, 41, 126, 'en-US', 'Reactive dyeing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (242, 41, 127, 'en-US', 'Hang dry low temperature ironing cannot be dry cleaned', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (243, 42, 10, 'en-US', 'Contracted', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (244, 42, 72, 'en-US', 'Pure color', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (245, 42, 128, 'en-US', 'The sheets', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (246, 42, 129, 'en-US', 'Cotton', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (247, 43, 11, 'en-US', 'Pink black', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (248, 43, 130, 'en-US', 'Length 56 width 36 height 10cm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (249, 43, 21, 'en-US', '500g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (250, 44, 27, 'en-US', '61*31*12~7cm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (251, 44, 131, 'en-US', '150d high density polyurethane', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (252, 44, 126, 'en-US', 'Molding process', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (253, 45, 9, 'en-US', 'DH208', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (254, 45, 17, 'en-US', 'Plastic', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (255, 45, 132, 'en-US', 'New pp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (256, 45, 133, 'en-US', '100 new material', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (257, 45, 134, 'en-US', 'Theres a lid theres a grid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (258, 45, 2, 'en-US', 'Finishing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (259, 46, 135, 'en-US', 'Toys underwear clothing magazines tissues clutter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (260, 46, 136, 'en-US', 'The sitting room', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (261, 46, 17, 'en-US', 'Cloth art', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (262, 46, 132, 'en-US', 'Cotton and linen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (263, 47, 17, 'en-US', 'Plastic', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (264, 47, 10, 'en-US', 'Folding', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (265, 47, 137, 'en-US', 'Opening ceremony employee benefits award ceremony anniversary celebration exhibition advertising promotion', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (266, 47, 138, 'en-US', 'Middle band cover', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (267, 48, 139, 'en-US', 'Men and women', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (268, 48, 140, 'en-US', 'Leisure', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (269, 48, 128, 'en-US', 'Travel kit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (270, 48, 89, 'en-US', 'Travel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (271, 49, 67, 'en-US', 'Adult movement', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (272, 49, 141, 'en-US', 'Tourism', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (273, 50, 83, 'en-US', '320.00g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (274, 50, 142, 'en-US', 'Pregnancy period', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (275, 50, 128, 'en-US', 'Production test pantsphysiological pants', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (276, 51, 8, 'en-US', 'Aag', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (277, 51, 17, 'en-US', 'The silicone', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (278, 51, 143, 'en-US', 'More than 6 months', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (279, 51, 11, 'en-US', 'Ice cypress blue twilight powder monsoon ash', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (280, 52, 11, 'en-US', 'Marble grey', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (281, 52, 67, 'en-US', 'General', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (282, 53, 67, 'en-US', 'General', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (283, 53, 8, 'en-US', 'Kimpets', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (284, 53, 77, 'en-US', 'CF8121', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (285, 54, 130, 'en-US', '350ml,550ml', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (286, 54, 11, 'en-US', 'Blue white pink', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (287, 55, 8, 'en-US', 'Tuffhound', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (288, 55, 11, 'en-US', 'Gray', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (289, 56, 8, 'en-US', 'Royal pet lane', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (290, 56, 77, 'en-US', 'YCFSDSM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (291, 56, 67, 'en-US', 'General', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (292, 57, 144, 'en-US', 'The sponge', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (293, 57, 145, 'en-US', 'Cotton terry cloth', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (294, 57, 27, 'en-US', '160mm*110mm*50mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (295, 58, 65, 'en-US', 'DEM SJS600', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (296, 58, 2, 'en-US', 'Ultrasonic atomizing humidifier', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (297, 58, 25, 'en-US', '224mm*208mm*330mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (298, 58, 34, 'en-US', 'ABS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (299, 58, 146, 'en-US', '5L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (300, 58, 35, 'en-US', '25W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (301, 58, 147, 'en-US', '220V~50Hz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (302, 58, 148, 'en-US', 'Water and power supply protection', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (303, 58, 149, 'en-US', '270ml/h', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (304, 58, 150, 'en-US', '<34db', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (305, 58, 151, 'en-US', '20 25㎡', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (306, 59, 152, 'en-US', '1mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (307, 59, 153, 'en-US', '24*11.4cm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (308, 59, 15, 'en-US', '40g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (309, 59, 28, 'en-US', '20kg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (310, 60, 154, 'en-US', 'MicroUSB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (311, 60, 155, 'en-US', 'DC4.5V~DC5V', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (312, 60, 156, 'en-US', '≤2.4A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (313, 60, 157, 'en-US', '110~250Hz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (314, 60, 158, 'en-US', '10℃~60℃', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-22 09:04:16');
INSERT INTO `product_attribute_values` VALUES (315, 60, 159, 'en-US', '4.2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (316, 60, 160, 'en-US', 'Android5.0+/IOS8.0+', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (317, 60, 161, 'en-US', '2mm~4mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (318, 61, 34, 'en-US', 'Abs nylon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (319, 61, 25, 'en-US', '10*10*4cm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (320, 61, 15, 'en-US', '106g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (321, 61, 162, 'en-US', 'Single carton containing about 136g of carton', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (322, 62, 25, 'en-US', '45*14.5cm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (323, 62, 34, 'en-US', 'Wheat platycodon grandiflorum', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (324, 62, 163, 'en-US', 'Carton packing per pack', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (325, 62, 15, 'en-US', '50g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (326, 63, 164, 'en-US', 'Adult', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (327, 63, 165, 'en-US', 'Polyester polyester', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (328, 63, 34, 'en-US', 'Cotton', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (329, 63, 75, 'en-US', 'U', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (330, 64, 9, 'en-US', '3520P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (331, 64, 166, 'en-US', 'USB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (332, 64, 167, 'en-US', 'Three', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (333, 64, 168, 'en-US', '10m', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (334, 64, 169, 'en-US', '2.4GHz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (335, 64, 170, 'en-US', 'The 5th battery', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (336, 64, 171, 'en-US', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (337, 64, 172, 'en-US', 'Photoelectric', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (338, 65, 15, 'en-US', '93g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (339, 65, 34, 'en-US', 'The mirror', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (340, 65, 25, 'en-US', '100mm~120mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (341, 65, 173, 'en-US', 'The cable', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (342, 65, 167, 'en-US', 'Five', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (343, 65, 174, 'en-US', '2m', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (344, 65, 175, 'en-US', 'Wired mouse game mouse ergonomic mouse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (345, 66, 63, 'en-US', 'Steelseries', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (346, 66, 34, 'en-US', 'Non slip rubber base and optimized surface', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (347, 66, 176, 'en-US', 'Cloth mat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (348, 66, 177, 'en-US', 'There is no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (349, 67, 63, 'en-US', 'LenaLN S6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (350, 67, 15, 'en-US', '0.54kg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (351, 67, 34, 'en-US', 'Tourmaline ceramic coating', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (352, 67, 178, 'en-US', 'Both dry and wet anti hot portable', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (353, 67, 179, 'en-US', 'Multi function hair dresser', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (354, 67, 180, 'en-US', '26 30mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (355, 67, 181, 'en-US', 'Short hair big waves pear head straight hair curly hair', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (356, 67, 25, 'en-US', '340*60*42mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (357, 67, 182, 'en-US', '10s', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (358, 67, 183, 'en-US', '160 200°', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (359, 68, 184, 'en-US', 'Ju wood', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (360, 68, 185, 'en-US', 'The pig mane', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (361, 68, 186, 'en-US', 'Trp soft rubber', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (362, 68, 187, 'en-US', 'Heat resisting nylon needle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (363, 68, 25, 'en-US', '22.9*7*1.6cm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (364, 68, 15, 'en-US', '76g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (365, 69, 8, 'en-US', 'Petsfamily', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (366, 69, 77, 'en-US', 'PF 0016', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (367, 70, 8, 'en-US', 'Hoopet hua yuan pets', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (368, 70, 11, 'en-US', 'Dark brown matching mat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (369, 70, 130, 'en-US', 'XS,S,M,L,XL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (370, 71, 67, 'en-US', 'General', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (371, 71, 76, 'en-US', 'Warm brown red and pastel blue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (372, 72, 17, 'en-US', 'Plastic', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (373, 72, 188, 'en-US', 'Zhejiang', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (374, 72, 179, 'en-US', 'Pet waterloo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (375, 72, 130, 'en-US', '67x40CM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (376, 73, 189, 'en-US', '30mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (377, 73, 17, 'en-US', '50cr15mov', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (378, 74, 81, 'en-US', 'Qiao ah po kitchen knife', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (379, 74, 83, 'en-US', '170.00g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (380, 74, 17, 'en-US', 'Ceramic', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (381, 75, 17, 'en-US', 'Zirconia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (382, 75, 179, 'en-US', 'Tool kit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (383, 76, 110, 'en-US', 'Seven times', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (384, 76, 17, 'en-US', 'The 400 series', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (385, 76, 190, 'en-US', '151mm 220mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (386, 77, 11, 'en-US', 'Nude blue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (387, 77, 129, 'en-US', 'Spandex', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (388, 77, 191, 'en-US', 'Class b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (389, 78, 17, 'en-US', 'Cotton 95 spandex 5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (390, 78, 191, 'en-US', 'Class b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (391, 79, 164, 'en-US', 'Men', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (392, 79, 192, 'en-US', 'Leisure', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (393, 79, 11, 'en-US', 'Black white and grey', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (394, 79, 193, 'en-US', '67 cotton30 polyester3 spandex', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (395, 79, 130, 'en-US', '26 28cm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (396, 80, 10, 'en-US', 'Simple korean version is sweet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-22 09:30:31');
INSERT INTO `product_attribute_values` VALUES (397, 80, 10, 'en-US', 'Simple korean version is sweet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (398, 80, 87, 'en-US', 'The four seasons general', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (399, 80, 72, 'en-US', 'Pure color', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (400, 81, 83, 'en-US', '1.095kg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (401, 81, 17, 'en-US', 'Bamboo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (402, 81, 194, 'en-US', 'Chopping board', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (403, 82, 17, 'en-US', 'Wooden', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (404, 82, 75, 'en-US', 'Utan wood round plate full wood trumpet utan wood round plate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (405, 83, 17, 'en-US', 'Superfine fiber', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (406, 83, 67, 'en-US', 'Panbowl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (407, 83, 72, 'en-US', 'Pure color', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (408, 84, 195, 'en-US', '27*16cm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (409, 84, 196, 'en-US', '30g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (410, 84, 197, 'en-US', 'Coral fleece', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (411, 84, 198, 'en-US', 'Opp bag', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (412, 85, 59, 'en-US', 'Long handled brush reed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (413, 85, 17, 'en-US', 'European beech handle nylon brush head', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (414, 85, 130, 'en-US', 'The length is 320mm and the width is 70mm and the length is 65mm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (415, 85, 21, 'en-US', '0.25kg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (416, 86, 11, 'en-US', 'Gray green', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (417, 86, 17, 'en-US', 'Pp plastic nylon rubber', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (418, 86, 21, 'en-US', '195g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (419, 87, 17, 'en-US', 'Inner and outer 304 stainless steel import tritan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (420, 87, 199, 'en-US', '5h 8h', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (421, 87, 146, 'en-US', '390ml', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (422, 87, 200, 'en-US', '90ml', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (423, 87, 201, 'en-US', '256g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (424, 88, 65, 'en-US', 'S U45W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (425, 88, 63, 'en-US', 'Light smart accompanying vacuum cup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (426, 88, 146, 'en-US', '430ML', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (427, 88, 17, 'en-US', 'Food grade 304 stainless steel cup body food grade ppcup cover component pcscreen mask', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (428, 88, 202, 'en-US', '310G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (429, 88, 27, 'en-US', '228×75×84MM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (430, 88, 199, 'en-US', 'More than 6 hours 42 0 c five hours below 10 0 c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (431, 88, 203, 'en-US', 'Oled display', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (432, 88, 170, 'en-US', 'Cr2032replaceable', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (433, 88, 204, 'en-US', 'Standby time is greater than or equal to 1 year', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (434, 88, 66, 'en-US', 'GB/T29606 2013', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product_attribute_values` VALUES (435, 90, 12, 'en-US', '0.35kg', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-24 03:44:26', '2018-10-24 03:44:26');
INSERT INTO `product_attribute_values` VALUES (436, 90, 195, 'en-US', '87*87*18mm', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-24 03:44:26', '2018-10-24 03:44:26');
INSERT INTO `product_attribute_values` VALUES (437, 90, 204, 'en-US', 'jjjkkkslsf', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-24 08:58:28', '2018-10-24 08:58:28');
INSERT INTO `product_attribute_values` VALUES (438, 90, 201, 'en-US', 'dfdfdf', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-24 08:58:51', '2018-10-24 08:58:51');
INSERT INTO `product_attribute_values` VALUES (439, 85, 130, 'zh_CN', '长度320毫米', NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-26 15:45:37', '2018-10-26 15:45:37');
COMMIT;

-- ----------------------------
-- Table structure for product_attributes
-- ----------------------------
DROP TABLE IF EXISTS `product_attributes`;
CREATE TABLE `product_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration` json DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_attributes_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_attributes
-- ----------------------------
BEGIN;
INSERT INTO `product_attributes` VALUES (1, 'texture', 'text', 'text', NULL, 0, '2018-10-19 06:35:13', '2018-10-19 06:35:13');
INSERT INTO `product_attributes` VALUES (2, 'function', 'text', 'text', NULL, 0, '2018-10-19 07:20:45', '2018-10-19 07:20:45');
INSERT INTO `product_attributes` VALUES (3, 'hair-dryer-stall', 'text', 'text', NULL, 0, '2018-10-19 07:24:05', '2018-10-19 07:24:05');
INSERT INTO `product_attributes` VALUES (4, 'place', 'text', 'text', NULL, 0, '2018-10-19 07:25:00', '2018-10-19 07:25:00');
INSERT INTO `product_attributes` VALUES (6, 'applicable', 'text', 'text', NULL, 0, '2018-10-19 08:57:55', '2018-10-19 08:57:55');
INSERT INTO `product_attributes` VALUES (7, 'way', 'text', 'text', NULL, 0, '2018-10-19 08:58:29', '2018-10-19 08:58:29');
INSERT INTO `product_attributes` VALUES (8, 'brand', 'text', 'text', NULL, 0, '2018-10-19 10:07:17', '2018-10-19 10:07:17');
INSERT INTO `product_attributes` VALUES (9, 'model', 'text', 'text', NULL, 0, '2018-10-19 10:08:36', '2018-10-19 10:08:36');
INSERT INTO `product_attributes` VALUES (10, 'style', 'text', 'text', NULL, 0, '2018-10-19 10:22:48', '2018-10-19 10:22:48');
INSERT INTO `product_attributes` VALUES (11, 'color', 'text', 'text', NULL, 0, '2018-10-19 10:23:39', '2018-10-19 10:23:39');
INSERT INTO `product_attributes` VALUES (12, 'weight', 'text', 'text', NULL, 0, '2018-10-19 10:39:57', '2018-10-19 10:39:57');
INSERT INTO `product_attributes` VALUES (13, 'category', 'text', 'text', NULL, 0, '2018-10-19 10:40:28', '2018-10-19 10:40:28');
INSERT INTO `product_attributes` VALUES (14, 'format', 'text', 'text', NULL, 0, '2018-10-20 02:37:08', '2018-10-20 02:37:08');
INSERT INTO `product_attributes` VALUES (15, 'the-product-weight', 'text', 'text', NULL, 0, '2018-10-20 10:00:48', '2018-10-20 10:00:48');
INSERT INTO `product_attributes` VALUES (16, 'product-specification', 'text', 'text', NULL, 0, '2018-10-20 10:00:48', '2018-10-20 10:00:48');
INSERT INTO `product_attributes` VALUES (17, 'the-material', 'text', 'text', NULL, 0, '2018-10-20 10:00:49', '2018-10-20 10:00:49');
INSERT INTO `product_attributes` VALUES (18, 'shell-material', 'text', 'text', NULL, 0, '2018-10-20 10:00:51', '2018-10-20 10:00:51');
INSERT INTO `product_attributes` VALUES (19, 'the-battery-capacity', 'text', 'text', NULL, 0, '2018-10-20 10:00:51', '2018-10-20 10:00:51');
INSERT INTO `product_attributes` VALUES (20, 'battery-capacity', 'text', 'text', NULL, 0, '2018-10-20 10:00:53', '2018-10-20 10:00:53');
INSERT INTO `product_attributes` VALUES (21, 'the-weight-of-the', 'text', 'text', NULL, 0, '2018-10-20 10:00:55', '2018-10-20 10:00:55');
INSERT INTO `product_attributes` VALUES (22, 'the-output-power', 'text', 'text', NULL, 0, '2018-10-20 10:00:55', '2018-10-20 10:00:55');
INSERT INTO `product_attributes` VALUES (23, 'charging-distance', 'text', 'text', NULL, 0, '2018-10-20 10:00:55', '2018-10-20 10:00:55');
INSERT INTO `product_attributes` VALUES (24, 'suitable-model', 'text', 'text', NULL, 0, '2018-10-20 10:00:56', '2018-10-20 10:00:56');
INSERT INTO `product_attributes` VALUES (25, 'product-size', 'text', 'text', NULL, 0, '2018-10-20 10:00:57', '2018-10-20 10:00:57');
INSERT INTO `product_attributes` VALUES (26, 'charging-time', 'text', 'text', NULL, 0, '2018-10-20 10:00:58', '2018-10-20 10:00:58');
INSERT INTO `product_attributes` VALUES (27, 'size', 'text', 'text', NULL, 0, '2018-10-20 10:00:59', '2018-10-20 10:00:59');
INSERT INTO `product_attributes` VALUES (28, 'to-support-the-weight', 'text', 'text', NULL, 0, '2018-10-20 10:01:01', '2018-10-20 10:01:01');
INSERT INTO `product_attributes` VALUES (29, 'support-the-diameter', 'text', 'text', NULL, 0, '2018-10-20 10:01:01', '2018-10-20 10:01:01');
INSERT INTO `product_attributes` VALUES (30, 'equipment-support', 'text', 'text', NULL, 0, '2018-10-20 10:01:01', '2018-10-20 10:01:01');
INSERT INTO `product_attributes` VALUES (31, 'the-tip-of', 'text', 'text', NULL, 0, '2018-10-20 10:01:04', '2018-10-20 10:01:04');
INSERT INTO `product_attributes` VALUES (32, 'bluetooth', 'text', 'text', NULL, 0, '2018-10-20 10:01:04', '2018-10-20 10:01:04');
INSERT INTO `product_attributes` VALUES (33, 'pins-jack', 'text', 'text', NULL, 0, '2018-10-20 10:01:06', '2018-10-20 10:01:06');
INSERT INTO `product_attributes` VALUES (34, 'product-material', 'text', 'text', NULL, 0, '2018-10-20 10:01:07', '2018-10-20 10:01:07');
INSERT INTO `product_attributes` VALUES (35, 'rated-power', 'text', 'text', NULL, 0, '2018-10-20 10:01:07', '2018-10-20 10:01:07');
INSERT INTO `product_attributes` VALUES (36, 'the-input', 'text', 'text', NULL, 0, '2018-10-20 10:01:07', '2018-10-20 10:01:07');
INSERT INTO `product_attributes` VALUES (37, 'battery-life', 'text', 'text', NULL, 0, '2018-10-20 10:01:09', '2018-10-20 10:01:09');
INSERT INTO `product_attributes` VALUES (38, 'hands-free-calls', 'text', 'text', NULL, 0, '2018-10-20 10:01:09', '2018-10-20 10:01:09');
INSERT INTO `product_attributes` VALUES (39, 'support-audio-format', 'text', 'text', NULL, 0, '2018-10-20 10:01:10', '2018-10-20 10:01:10');
INSERT INTO `product_attributes` VALUES (40, 'infinite-transmission-range', 'text', 'text', NULL, 0, '2018-10-20 10:01:10', '2018-10-20 10:01:10');
INSERT INTO `product_attributes` VALUES (41, 'transmission-power', 'text', 'text', NULL, 0, '2018-10-20 10:01:11', '2018-10-20 10:01:11');
INSERT INTO `product_attributes` VALUES (42, 'signal-to-noise-ratio', 'text', 'text', NULL, 0, '2018-10-20 10:01:11', '2018-10-20 10:01:11');
INSERT INTO `product_attributes` VALUES (43, 'charging-box', 'text', 'text', NULL, 0, '2018-10-20 10:01:15', '2018-10-20 10:01:15');
INSERT INTO `product_attributes` VALUES (44, 'smoking-time', 'text', 'text', NULL, 0, '2018-10-20 10:01:16', '2018-10-20 10:01:16');
INSERT INTO `product_attributes` VALUES (45, 'the-number-of-smoking', 'text', 'text', NULL, 0, '2018-10-20 10:01:17', '2018-10-20 10:01:17');
INSERT INTO `product_attributes` VALUES (46, 'charging-box-size', 'text', 'text', NULL, 0, '2018-10-20 10:01:17', '2018-10-20 10:01:17');
INSERT INTO `product_attributes` VALUES (47, 'heating-rod-size', 'text', 'text', NULL, 0, '2018-10-20 10:01:18', '2018-10-20 10:01:18');
INSERT INTO `product_attributes` VALUES (48, 'the-biggest-weighing', 'text', 'text', NULL, 0, '2018-10-20 10:01:19', '2018-10-20 10:01:19');
INSERT INTO `product_attributes` VALUES (49, 'led-display-size', 'text', 'text', NULL, 0, '2018-10-20 10:01:19', '2018-10-20 10:01:19');
INSERT INTO `product_attributes` VALUES (50, 'the-power-supply', 'text', 'text', NULL, 0, '2018-10-20 10:01:20', '2018-10-20 10:01:20');
INSERT INTO `product_attributes` VALUES (51, 'receive-the-size', 'text', 'text', NULL, 0, '2018-10-20 10:01:21', '2018-10-20 10:01:21');
INSERT INTO `product_attributes` VALUES (52, 'temperature-setting', 'text', 'text', NULL, 0, '2018-10-20 10:01:21', '2018-10-20 10:01:21');
INSERT INTO `product_attributes` VALUES (53, 'the-output-voltage', 'text', 'text', NULL, 0, '2018-10-20 10:01:22', '2018-10-20 10:01:22');
INSERT INTO `product_attributes` VALUES (54, 'working-part', 'text', 'text', NULL, 0, '2018-10-20 10:01:22', '2018-10-20 10:01:22');
INSERT INTO `product_attributes` VALUES (55, 'the-dimensions', 'text', 'text', NULL, 0, '2018-10-20 10:01:24', '2018-10-20 10:01:24');
INSERT INTO `product_attributes` VALUES (56, 'commodity-fabrics', 'text', 'text', NULL, 0, '2018-10-20 10:01:24', '2018-10-20 10:01:24');
INSERT INTO `product_attributes` VALUES (57, 'goods-process', 'text', 'text', NULL, 0, '2018-10-20 10:01:25', '2018-10-20 10:01:25');
INSERT INTO `product_attributes` VALUES (58, 'commercial-grade', 'text', 'text', NULL, 0, '2018-10-20 10:01:25', '2018-10-20 10:01:25');
INSERT INTO `product_attributes` VALUES (59, 'the-name-of-the', 'text', 'text', NULL, 0, '2018-10-22 03:30:01', '2018-10-22 03:30:01');
INSERT INTO `product_attributes` VALUES (60, 'with-the-body', 'text', 'text', NULL, 0, '2018-10-22 03:30:01', '2018-10-22 03:30:01');
INSERT INTO `product_attributes` VALUES (61, 'agio', 'text', 'text', NULL, 0, '2018-10-22 03:30:03', '2018-10-22 03:30:03');
INSERT INTO `product_attributes` VALUES (62, 'material', 'text', 'text', NULL, 0, '2018-10-22 03:30:03', '2018-10-22 03:30:03');
INSERT INTO `product_attributes` VALUES (63, 'the-product-name', 'text', 'text', NULL, 0, '2018-10-22 03:30:05', '2018-10-22 03:30:05');
INSERT INTO `product_attributes` VALUES (64, 'product-net-weight', 'text', 'text', NULL, 0, '2018-10-22 03:30:06', '2018-10-22 03:30:06');
INSERT INTO `product_attributes` VALUES (65, 'product-model', 'text', 'text', NULL, 0, '2018-10-22 03:30:06', '2018-10-22 03:30:06');
INSERT INTO `product_attributes` VALUES (66, 'execution-standard', 'text', 'text', NULL, 0, '2018-10-22 03:30:07', '2018-10-22 03:30:07');
INSERT INTO `product_attributes` VALUES (67, 'the-applicable-objects', 'text', 'text', NULL, 0, '2018-10-22 03:30:08', '2018-10-22 03:30:08');
INSERT INTO `product_attributes` VALUES (68, 'gender', 'text', 'text', NULL, 0, '2018-10-22 03:30:08', '2018-10-22 03:30:08');
INSERT INTO `product_attributes` VALUES (69, 'fold-the-number', 'text', 'text', NULL, 0, '2018-10-22 03:30:09', '2018-10-22 03:30:09');
INSERT INTO `product_attributes` VALUES (70, 'the-internal-structure', 'text', 'text', NULL, 0, '2018-10-22 03:30:09', '2018-10-22 03:30:09');
INSERT INTO `product_attributes` VALUES (71, 'quality-of-a-material', 'text', 'text', NULL, 0, '2018-10-22 03:30:09', '2018-10-22 03:30:09');
INSERT INTO `product_attributes` VALUES (72, 'pattern', 'text', 'text', NULL, 0, '2018-10-22 03:30:10', '2018-10-22 03:30:10');
INSERT INTO `product_attributes` VALUES (73, 'the-colour', 'text', 'text', NULL, 0, '2018-10-22 03:30:11', '2018-10-22 03:30:11');
INSERT INTO `product_attributes` VALUES (74, 'closed-way', 'text', 'text', NULL, 0, '2018-10-22 03:30:11', '2018-10-22 03:30:11');
INSERT INTO `product_attributes` VALUES (75, 'the-shape-of', 'text', 'text', NULL, 0, '2018-10-22 03:30:12', '2018-10-22 03:30:12');
INSERT INTO `product_attributes` VALUES (76, 'color-classification', 'text', 'text', NULL, 0, '2018-10-22 03:30:12', '2018-10-22 03:30:12');
INSERT INTO `product_attributes` VALUES (77, 'the-article-number', 'text', 'text', NULL, 0, '2018-10-22 03:30:13', '2018-10-22 03:30:13');
INSERT INTO `product_attributes` VALUES (78, 'characteristics-of-the', 'text', 'text', NULL, 0, '2018-10-22 03:30:15', '2018-10-22 03:30:15');
INSERT INTO `product_attributes` VALUES (79, 'popular-element', 'text', 'text', NULL, 0, '2018-10-22 03:30:18', '2018-10-22 03:30:18');
INSERT INTO `product_attributes` VALUES (80, 'material-in-the-material', 'text', 'text', NULL, 0, '2018-10-22 03:30:20', '2018-10-22 03:30:20');
INSERT INTO `product_attributes` VALUES (81, 'name-of-commodity', 'text', 'text', NULL, 0, '2018-10-22 03:30:24', '2018-10-22 03:30:24');
INSERT INTO `product_attributes` VALUES (82, 'the-store', 'text', 'text', NULL, 0, '2018-10-22 03:30:24', '2018-10-22 03:30:24');
INSERT INTO `product_attributes` VALUES (83, 'goods-gross-weight', 'text', 'text', NULL, 0, '2018-10-22 03:30:25', '2018-10-22 03:30:25');
INSERT INTO `product_attributes` VALUES (84, 'goods-origin', 'text', 'text', NULL, 0, '2018-10-22 03:30:25', '2018-10-22 03:30:25');
INSERT INTO `product_attributes` VALUES (85, 'shoe-materials', 'text', 'text', NULL, 0, '2018-10-22 03:30:26', '2018-10-22 03:30:26');
INSERT INTO `product_attributes` VALUES (86, 'the-sole-material', 'text', 'text', NULL, 0, '2018-10-22 03:30:28', '2018-10-22 03:30:28');
INSERT INTO `product_attributes` VALUES (87, 'apply-to-season', 'text', 'text', NULL, 0, '2018-10-22 03:30:28', '2018-10-22 03:30:28');
INSERT INTO `product_attributes` VALUES (88, 'production-process', 'text', 'text', NULL, 0, '2018-10-22 03:30:29', '2018-10-22 03:30:29');
INSERT INTO `product_attributes` VALUES (89, 'applicable-scenario', 'text', 'text', NULL, 0, '2018-10-22 03:30:30', '2018-10-22 03:30:30');
INSERT INTO `product_attributes` VALUES (90, 'type-of-sales-channel', 'text', 'text', NULL, 0, '2018-10-22 03:30:33', '2018-10-22 03:30:33');
INSERT INTO `product_attributes` VALUES (91, 'the-vamp-material', 'text', 'text', NULL, 0, '2018-10-22 03:30:34', '2018-10-22 03:30:34');
INSERT INTO `product_attributes` VALUES (92, 'followed-by-a-high', 'text', 'text', NULL, 0, '2018-10-22 03:30:35', '2018-10-22 03:30:35');
INSERT INTO `product_attributes` VALUES (93, 'with-bottom-style', 'text', 'text', NULL, 0, '2018-10-22 03:30:35', '2018-10-22 03:30:35');
INSERT INTO `product_attributes` VALUES (94, 'suitable-for-situations', 'text', 'text', NULL, 0, '2018-10-22 03:30:36', '2018-10-22 03:30:36');
INSERT INTO `product_attributes` VALUES (95, 'the-thickness-of-the', 'text', 'text', NULL, 0, '2018-10-22 03:30:40', '2018-10-22 03:30:40');
INSERT INTO `product_attributes` VALUES (96, 'get-model', 'text', 'text', NULL, 0, '2018-10-22 03:30:40', '2018-10-22 03:30:40');
INSERT INTO `product_attributes` VALUES (97, 'combination-of-specifications', 'text', 'text', NULL, 0, '2018-10-22 03:30:42', '2018-10-22 03:30:42');
INSERT INTO `product_attributes` VALUES (98, 'sleeve-length', 'text', 'text', NULL, 0, '2018-10-22 03:30:43', '2018-10-22 03:30:43');
INSERT INTO `product_attributes` VALUES (99, 'placket', 'text', 'text', NULL, 0, '2018-10-22 03:30:43', '2018-10-22 03:30:43');
INSERT INTO `product_attributes` VALUES (100, 'height', 'text', 'text', NULL, 0, '2018-10-22 03:30:44', '2018-10-22 03:30:44');
INSERT INTO `product_attributes` VALUES (101, 'fabric-is-known-as', 'text', 'text', NULL, 0, '2018-10-22 03:30:47', '2018-10-22 03:30:47');
INSERT INTO `product_attributes` VALUES (102, 'main-material-of-fabric', 'text', 'text', NULL, 0, '2018-10-22 03:30:47', '2018-10-22 03:30:47');
INSERT INTO `product_attributes` VALUES (103, 'component-content', 'text', 'text', NULL, 0, '2018-10-22 03:30:48', '2018-10-22 03:30:48');
INSERT INTO `product_attributes` VALUES (104, 'thickness', 'text', 'text', NULL, 0, '2018-10-22 03:30:48', '2018-10-22 03:30:48');
INSERT INTO `product_attributes` VALUES (105, 'garment-style-details', 'text', 'text', NULL, 0, '2018-10-22 03:30:49', '2018-10-22 03:30:49');
INSERT INTO `product_attributes` VALUES (106, 'home-dress-style', 'text', 'text', NULL, 0, '2018-10-22 03:30:50', '2018-10-22 03:30:50');
INSERT INTO `product_attributes` VALUES (107, 'suitable-for-season', 'text', 'text', NULL, 0, '2018-10-22 03:30:52', '2018-10-22 03:30:52');
INSERT INTO `product_attributes` VALUES (108, 'the-fabric-name', 'text', 'text', NULL, 0, '2018-10-22 03:30:52', '2018-10-22 03:30:52');
INSERT INTO `product_attributes` VALUES (109, 'the-waist-type', 'text', 'text', NULL, 0, '2018-10-22 03:30:58', '2018-10-22 03:30:58');
INSERT INTO `product_attributes` VALUES (110, 'number', 'text', 'text', NULL, 0, '2018-10-22 03:31:00', '2018-10-22 03:31:00');
INSERT INTO `product_attributes` VALUES (111, 'stopped-by-the-material', 'text', 'text', NULL, 0, '2018-10-22 03:31:01', '2018-10-22 03:31:01');
INSERT INTO `product_attributes` VALUES (112, 'cotton-variety', 'text', 'text', NULL, 0, '2018-10-22 03:31:01', '2018-10-22 03:31:01');
INSERT INTO `product_attributes` VALUES (113, 'bedding-process', 'text', 'text', NULL, 0, '2018-10-22 03:31:02', '2018-10-22 03:31:02');
INSERT INTO `product_attributes` VALUES (114, 'the-density-of-the-fabric', 'text', 'text', NULL, 0, '2018-10-22 03:31:03', '2018-10-22 03:31:03');
INSERT INTO `product_attributes` VALUES (115, 'applicable-bed-size', 'text', 'text', NULL, 0, '2018-10-22 03:31:04', '2018-10-22 03:31:04');
INSERT INTO `product_attributes` VALUES (116, 'bedding-fabric', 'text', 'text', NULL, 0, '2018-10-22 03:31:05', '2018-10-22 03:31:05');
INSERT INTO `product_attributes` VALUES (117, 'the-fabric-count', 'text', 'text', NULL, 0, '2018-10-22 03:31:06', '2018-10-22 03:31:06');
INSERT INTO `product_attributes` VALUES (118, 'dyeing-and-printing-process', 'text', 'text', NULL, 0, '2018-10-22 03:31:06', '2018-10-22 03:31:06');
INSERT INTO `product_attributes` VALUES (119, 'weaving-process', 'text', 'text', NULL, 0, '2018-10-22 03:31:06', '2018-10-22 03:31:06');
INSERT INTO `product_attributes` VALUES (120, 'main-components-of-fabric', 'text', 'text', NULL, 0, '2018-10-22 03:31:07', '2018-10-22 03:31:07');
INSERT INTO `product_attributes` VALUES (121, 'main-component-content-of-fabric', 'text', 'text', NULL, 0, '2018-10-22 03:31:07', '2018-10-22 03:31:07');
INSERT INTO `product_attributes` VALUES (122, 'packing-list', 'text', 'text', NULL, 0, '2018-10-22 03:31:09', '2018-10-22 03:31:09');
INSERT INTO `product_attributes` VALUES (123, 'width', 'text', 'text', NULL, 0, '2018-10-22 03:31:09', '2018-10-22 03:31:09');
INSERT INTO `product_attributes` VALUES (124, 'skirt-hem', 'text', 'text', NULL, 0, '2018-10-22 03:31:10', '2018-10-22 03:31:10');
INSERT INTO `product_attributes` VALUES (125, 'pillowcase', 'text', 'text', NULL, 0, '2018-10-22 03:31:10', '2018-10-22 03:31:10');
INSERT INTO `product_attributes` VALUES (126, 'process', 'text', 'text', NULL, 0, '2018-10-22 03:31:13', '2018-10-22 03:31:13');
INSERT INTO `product_attributes` VALUES (127, 'washing-instructions', 'text', 'text', NULL, 0, '2018-10-22 03:31:13', '2018-10-22 03:31:13');
INSERT INTO `product_attributes` VALUES (128, 'classification', 'text', 'text', NULL, 0, '2018-10-22 03:31:17', '2018-10-22 03:31:17');
INSERT INTO `product_attributes` VALUES (129, 'the-fabric', 'text', 'text', NULL, 0, '2018-10-22 03:31:17', '2018-10-22 03:31:17');
INSERT INTO `product_attributes` VALUES (130, 'specifications', 'text', 'text', NULL, 0, '2018-10-22 03:31:21', '2018-10-22 03:31:21');
INSERT INTO `product_attributes` VALUES (131, 'composition', 'text', 'text', NULL, 0, '2018-10-22 03:31:22', '2018-10-22 03:31:22');
INSERT INTO `product_attributes` VALUES (132, 'specific-material', 'text', 'text', NULL, 0, '2018-10-22 03:31:25', '2018-10-22 03:31:25');
INSERT INTO `product_attributes` VALUES (133, 'new-material-proportion-of-plastic', 'text', 'text', NULL, 0, '2018-10-22 03:31:25', '2018-10-22 03:31:25');
INSERT INTO `product_attributes` VALUES (134, 'commodity-characteristics', 'text', 'text', NULL, 0, '2018-10-22 03:31:26', '2018-10-22 03:31:26');
INSERT INTO `product_attributes` VALUES (135, 'scope-of-application', 'text', 'text', NULL, 0, '2018-10-22 03:31:28', '2018-10-22 03:31:28');
INSERT INTO `product_attributes` VALUES (136, 'receive-a-scenario', 'text', 'text', NULL, 0, '2018-10-22 03:31:28', '2018-10-22 03:31:28');
INSERT INTO `product_attributes` VALUES (137, 'applicable-for-gift-occasions', 'text', 'text', NULL, 0, '2018-10-22 03:31:32', '2018-10-22 03:31:32');
INSERT INTO `product_attributes` VALUES (138, 'appearance-of-size', 'text', 'text', NULL, 0, '2018-10-22 03:31:32', '2018-10-22 03:31:32');
INSERT INTO `product_attributes` VALUES (139, 'apply-to-gender', 'text', 'text', NULL, 0, '2018-10-22 03:31:33', '2018-10-22 03:31:33');
INSERT INTO `product_attributes` VALUES (140, 'general-style', 'text', 'text', NULL, 0, '2018-10-22 03:31:34', '2018-10-22 03:31:34');
INSERT INTO `product_attributes` VALUES (141, 'outdoor-project', 'text', 'text', NULL, 0, '2018-10-22 03:31:36', '2018-10-22 03:31:36');
INSERT INTO `product_attributes` VALUES (142, 'phase', 'text', 'text', NULL, 0, '2018-10-22 03:31:38', '2018-10-22 03:31:38');
INSERT INTO `product_attributes` VALUES (143, 'applicable-age', 'text', 'text', NULL, 0, '2018-10-22 03:31:41', '2018-10-22 03:31:41');
INSERT INTO `product_attributes` VALUES (144, 'internal-material', 'text', 'text', NULL, 0, '2018-10-22 08:24:43', '2018-10-22 08:24:43');
INSERT INTO `product_attributes` VALUES (145, 'the-external-material', 'text', 'text', NULL, 0, '2018-10-22 08:24:43', '2018-10-22 08:24:43');
INSERT INTO `product_attributes` VALUES (146, 'capacity', 'text', 'text', NULL, 0, '2018-10-22 08:24:46', '2018-10-22 08:24:46');
INSERT INTO `product_attributes` VALUES (147, 'working-voltage', 'text', 'text', NULL, 0, '2018-10-22 08:24:46', '2018-10-22 08:24:46');
INSERT INTO `product_attributes` VALUES (148, 'security-and-protection', 'text', 'text', NULL, 0, '2018-10-22 08:24:46', '2018-10-22 08:24:46');
INSERT INTO `product_attributes` VALUES (149, 'the-quantity-of-the-fog', 'text', 'text', NULL, 0, '2018-10-22 08:24:47', '2018-10-22 08:24:47');
INSERT INTO `product_attributes` VALUES (150, 'db', 'text', 'text', NULL, 0, '2018-10-22 08:24:47', '2018-10-22 08:24:47');
INSERT INTO `product_attributes` VALUES (151, 'applicable-area', 'text', 'text', NULL, 0, '2018-10-22 08:24:47', '2018-10-22 08:24:47');
INSERT INTO `product_attributes` VALUES (152, 'the-thickness-of-the-product', 'text', 'text', NULL, 0, '2018-10-22 08:24:48', '2018-10-22 08:24:48');
INSERT INTO `product_attributes` VALUES (153, 'stent-size', 'text', 'text', NULL, 0, '2018-10-22 08:24:48', '2018-10-22 08:24:48');
INSERT INTO `product_attributes` VALUES (154, 'power-interface-cable', 'text', 'text', NULL, 0, '2018-10-22 08:24:50', '2018-10-22 08:24:50');
INSERT INTO `product_attributes` VALUES (155, 'input-voltage-requirement', 'text', 'text', NULL, 0, '2018-10-22 08:24:51', '2018-10-22 08:24:51');
INSERT INTO `product_attributes` VALUES (156, 'input-current-requirement', 'text', 'text', NULL, 0, '2018-10-22 08:24:51', '2018-10-22 08:24:51');
INSERT INTO `product_attributes` VALUES (157, 'working-frequency', 'text', 'text', NULL, 0, '2018-10-22 08:24:51', '2018-10-22 08:24:51');
INSERT INTO `product_attributes` VALUES (158, 'working-temperature', 'text', 'text', NULL, 0, '2018-10-22 08:24:51', '2018-10-22 08:24:51');
INSERT INTO `product_attributes` VALUES (159, 'bluetooth-version', 'text', 'text', NULL, 0, '2018-10-22 08:24:51', '2018-10-22 08:24:51');
INSERT INTO `product_attributes` VALUES (160, 'support', 'text', 'text', NULL, 0, '2018-10-22 08:24:52', '2018-10-22 08:24:52');
INSERT INTO `product_attributes` VALUES (161, 'wireless-charging-transmission-distance', 'text', 'text', NULL, 0, '2018-10-22 08:24:52', '2018-10-22 08:24:52');
INSERT INTO `product_attributes` VALUES (162, 'the-packing-way', 'text', 'text', NULL, 0, '2018-10-22 08:24:54', '2018-10-22 08:24:54');
INSERT INTO `product_attributes` VALUES (163, 'product-packaging', 'text', 'text', NULL, 0, '2018-10-22 08:24:56', '2018-10-22 08:24:56');
INSERT INTO `product_attributes` VALUES (164, 'applicable-people', 'text', 'text', NULL, 0, '2018-10-22 08:24:58', '2018-10-22 08:24:58');
INSERT INTO `product_attributes` VALUES (165, 'fillers', 'text', 'text', NULL, 0, '2018-10-22 08:24:59', '2018-10-22 08:24:59');
INSERT INTO `product_attributes` VALUES (166, 'the-interface-type', 'text', 'text', NULL, 0, '2018-10-22 08:25:02', '2018-10-22 08:25:02');
INSERT INTO `product_attributes` VALUES (167, 'the-key-number', 'text', 'text', NULL, 0, '2018-10-22 08:25:02', '2018-10-22 08:25:02');
INSERT INTO `product_attributes` VALUES (168, 'wireless-distance', 'text', 'text', NULL, 0, '2018-10-22 08:25:02', '2018-10-22 08:25:02');
INSERT INTO `product_attributes` VALUES (169, 'wireless-technology', 'text', 'text', NULL, 0, '2018-10-22 08:25:03', '2018-10-22 08:25:03');
INSERT INTO `product_attributes` VALUES (170, 'the-battery-model', 'text', 'text', NULL, 0, '2018-10-22 08:25:03', '2018-10-22 08:25:03');
INSERT INTO `product_attributes` VALUES (171, 'roller-number', 'text', 'text', NULL, 0, '2018-10-22 08:25:03', '2018-10-22 08:25:03');
INSERT INTO `product_attributes` VALUES (172, 'way-to-work', 'text', 'text', NULL, 0, '2018-10-22 08:25:04', '2018-10-22 08:25:04');
INSERT INTO `product_attributes` VALUES (173, 'the-connection-method', 'text', 'text', NULL, 0, '2018-10-22 08:25:07', '2018-10-22 08:25:07');
INSERT INTO `product_attributes` VALUES (174, 'line-length', 'text', 'text', NULL, 0, '2018-10-22 08:25:07', '2018-10-22 08:25:07');
INSERT INTO `product_attributes` VALUES (175, 'the-product-type', 'text', 'text', NULL, 0, '2018-10-22 08:25:08', '2018-10-22 08:25:08');
INSERT INTO `product_attributes` VALUES (176, 'product-categories', 'text', 'text', NULL, 0, '2018-10-22 08:25:10', '2018-10-22 08:25:10');
INSERT INTO `product_attributes` VALUES (177, 'wrist-joe', 'text', 'text', NULL, 0, '2018-10-22 08:25:11', '2018-10-22 08:25:11');
INSERT INTO `product_attributes` VALUES (178, 'product-characteristics', 'text', 'text', NULL, 0, '2018-10-22 08:25:13', '2018-10-22 08:25:13');
INSERT INTO `product_attributes` VALUES (179, 'product-category', 'text', 'text', NULL, 0, '2018-10-22 08:25:14', '2018-10-22 08:25:14');
INSERT INTO `product_attributes` VALUES (180, 'diameter-of-heat-conducting-body', 'text', 'text', NULL, 0, '2018-10-22 08:25:14', '2018-10-22 08:25:14');
INSERT INTO `product_attributes` VALUES (181, 'for-modelling', 'text', 'text', NULL, 0, '2018-10-22 08:25:14', '2018-10-22 08:25:14');
INSERT INTO `product_attributes` VALUES (182, 'warm-up-time', 'text', 'text', NULL, 0, '2018-10-22 08:25:15', '2018-10-22 08:25:15');
INSERT INTO `product_attributes` VALUES (183, 'iron-plate-temperature', 'text', 'text', NULL, 0, '2018-10-22 08:25:16', '2018-10-22 08:25:16');
INSERT INTO `product_attributes` VALUES (184, 'wooden-handle-material', 'text', 'text', NULL, 0, '2018-10-22 08:25:16', '2018-10-22 08:25:16');
INSERT INTO `product_attributes` VALUES (185, 'air-cushion-material', 'text', 'text', NULL, 0, '2018-10-22 08:25:17', '2018-10-22 08:25:17');
INSERT INTO `product_attributes` VALUES (186, 'woolen-material', 'text', 'text', NULL, 0, '2018-10-22 08:25:17', '2018-10-22 08:25:17');
INSERT INTO `product_attributes` VALUES (187, 'massage-material', 'text', 'text', NULL, 0, '2018-10-22 08:25:18', '2018-10-22 08:25:18');
INSERT INTO `product_attributes` VALUES (188, 'origin', 'text', 'text', NULL, 0, '2018-10-22 08:26:35', '2018-10-22 08:26:35');
INSERT INTO `product_attributes` VALUES (189, 'the-length-of-the', 'text', 'text', NULL, 0, '2018-10-22 08:26:37', '2018-10-22 08:26:37');
INSERT INTO `product_attributes` VALUES (190, 'length-of-stainless-steel-blade', 'text', 'text', NULL, 0, '2018-10-22 08:26:43', '2018-10-22 08:26:43');
INSERT INTO `product_attributes` VALUES (191, 'security-category', 'text', 'text', NULL, 0, '2018-10-22 08:26:45', '2018-10-22 08:26:45');
INSERT INTO `product_attributes` VALUES (192, 'classification-of-motion', 'text', 'text', NULL, 0, '2018-10-22 08:26:49', '2018-10-22 08:26:49');
INSERT INTO `product_attributes` VALUES (193, 'top-material', 'text', 'text', NULL, 0, '2018-10-22 08:26:50', '2018-10-22 08:26:50');
INSERT INTO `product_attributes` VALUES (194, 'use', 'text', 'text', NULL, 0, '2018-10-22 08:26:56', '2018-10-22 08:26:56');
INSERT INTO `product_attributes` VALUES (195, 'goods-size', 'text', 'text', NULL, 0, '2018-10-22 08:27:02', '2018-10-22 08:27:02');
INSERT INTO `product_attributes` VALUES (196, 'weight-of-goods', 'text', 'text', NULL, 0, '2018-10-22 08:27:02', '2018-10-22 08:27:02');
INSERT INTO `product_attributes` VALUES (197, 'material-goods', 'text', 'text', NULL, 0, '2018-10-22 08:27:02', '2018-10-22 08:27:02');
INSERT INTO `product_attributes` VALUES (198, 'commodity-packaging', 'text', 'text', NULL, 0, '2018-10-22 08:27:03', '2018-10-22 08:27:03');
INSERT INTO `product_attributes` VALUES (199, 'heat-preservation-performance', 'text', 'text', NULL, 0, '2018-10-22 08:27:09', '2018-10-22 08:27:09');
INSERT INTO `product_attributes` VALUES (200, 'subdivision-capacity', 'text', 'text', NULL, 0, '2018-10-22 08:27:10', '2018-10-22 08:27:10');
INSERT INTO `product_attributes` VALUES (201, 'gross-weight', 'text', 'text', NULL, 0, '2018-10-22 08:27:10', '2018-10-22 08:27:10');
INSERT INTO `product_attributes` VALUES (202, 'the-net-weight', 'text', 'text', NULL, 0, '2018-10-22 08:27:13', '2018-10-22 08:27:13');
INSERT INTO `product_attributes` VALUES (203, 'the-screen', 'text', 'text', NULL, 0, '2018-10-22 08:27:14', '2018-10-22 08:27:14');
INSERT INTO `product_attributes` VALUES (204, 'standby-time', 'text', 'text', NULL, 1, '2018-10-22 08:27:15', '2018-10-24 17:39:17');
COMMIT;

-- ----------------------------
-- Table structure for product_images
-- ----------------------------
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) unsigned DEFAULT NULL COMMENT '一个产品存在多个图片,当然图片也可能属于变体,因此设置为可以为null',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=407 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_images
-- ----------------------------
BEGIN;
INSERT INTO `product_images` VALUES (3, 'http://pbfh6sbp9.bkt.clouddn.com/A1JJZ2tlayeKNlYB5VifS9njXOAGqeRXHqTEl06D.jpeg', 3, '2018-10-19 09:19:07', '2018-10-19 09:19:07');
INSERT INTO `product_images` VALUES (4, 'http://pbfh6sbp9.bkt.clouddn.com/sQlVK9dZ68MAbfB0uwtsiT1yi8UBHBU2icnIXhq6.jpeg', 4, '2018-10-19 09:20:08', '2018-10-19 09:20:08');
INSERT INTO `product_images` VALUES (5, 'http://pbfh6sbp9.bkt.clouddn.com/dyc5Iyz31fioV0HHBVLYkRiVN67HCNVAHFZYjBGl.png', 4, '2018-10-19 09:20:12', '2018-10-19 09:20:12');
INSERT INTO `product_images` VALUES (6, 'http://pbfh6sbp9.bkt.clouddn.com/QFdj8ErEoNKcVpDJsaqJCABdZKufj9cIOwpZRadz.jpeg', 4, '2018-10-19 09:20:15', '2018-10-19 09:20:15');
INSERT INTO `product_images` VALUES (7, 'http://pbfh6sbp9.bkt.clouddn.com/3eruzg0VJQG1gDZHaYkpQ5cTtuetK8wGOKvJshTC.jpeg', 4, '2018-10-19 09:20:18', '2018-10-19 09:20:18');
INSERT INTO `product_images` VALUES (8, 'http://pbfh6sbp9.bkt.clouddn.com/w5F1EkeDiitUHAVNTiUdW1vEe8eVigDL7wK854v6.jpeg', 4, '2018-10-19 09:50:58', '2018-10-19 09:50:58');
INSERT INTO `product_images` VALUES (9, 'http://pbfh6sbp9.bkt.clouddn.com/qsmpdZ8ADFyfdZ3ElGTcyWPl8qkNCzALnNNPGIdV.jpeg', 6, '2018-10-19 10:21:33', '2018-10-19 10:21:33');
INSERT INTO `product_images` VALUES (10, 'http://pbfh6sbp9.bkt.clouddn.com/etEgC7W3vqCZRgHkwO8kpkMGFcK2tuWG3wdXrdt8.jpeg', 7, '2018-10-19 10:38:38', '2018-10-19 10:38:38');
INSERT INTO `product_images` VALUES (11, 'http://pbfh6sbp9.bkt.clouddn.com/OImd7AeFQWdXr158ou9gh14T7UUImIJarC2Qb2pQ.jpeg', 7, '2018-10-19 10:38:41', '2018-10-19 10:38:41');
INSERT INTO `product_images` VALUES (12, 'http://pbfh6sbp9.bkt.clouddn.com/kkJLnXVwIDIueqP61sBu6LadsMZg0VUZSIjNRiEn.jpeg', 7, '2018-10-19 10:38:46', '2018-10-19 10:38:46');
INSERT INTO `product_images` VALUES (13, 'http://pbfh6sbp9.bkt.clouddn.com/wUFqIq5BjMpCKHXqDsnjLBhKMOoLMXp5gJUIUhZZ.png', 9, '2018-10-20 02:33:31', '2018-10-20 02:33:31');
INSERT INTO `product_images` VALUES (14, 'http://pbfh6sbp9.bkt.clouddn.com/SdAvuDf7uLezo266tobBdTuGjava4v6PcIA0lRMF.png', 9, '2018-10-20 02:33:44', '2018-10-20 02:33:44');
INSERT INTO `product_images` VALUES (15, 'http://pbfh6sbp9.bkt.clouddn.com/tCsOzPs9GBJLoRh0LXob7ySSqGTCX5AucqhQUWGk.png', 9, '2018-10-20 02:33:54', '2018-10-20 02:33:54');
INSERT INTO `product_images` VALUES (16, 'http://pbfh6sbp9.bkt.clouddn.com/fFLw53I776EAzFchAVpy6J6bNWEJhtJ5trc9AKHp.png', 9, '2018-10-20 02:33:56', '2018-10-20 02:33:56');
INSERT INTO `product_images` VALUES (17, 'http://pbfh6sbp9.bkt.clouddn.com/j29dIJKom7QqJvjvg8ZCJIAF0rQGEp9P7OUxanfP.jpeg', 10, '2018-10-20 07:48:09', '2018-10-20 07:48:09');
INSERT INTO `product_images` VALUES (18, 'http://pbfh6sbp9.bkt.clouddn.com/Aqky7LBFTqnKEmPSASXvfxggWnS3UP6LbkW9eGY4.jpeg', 10, '2018-10-20 07:48:12', '2018-10-20 07:48:12');
INSERT INTO `product_images` VALUES (19, 'http://pbfh6sbp9.bkt.clouddn.com/AXL8FyrbN20LEDSniK5kC2H4QMVGI1p6UOsVg5NL.jpeg', 10, '2018-10-20 07:48:17', '2018-10-20 07:48:17');
INSERT INTO `product_images` VALUES (20, 'http://pbfh6sbp9.bkt.clouddn.com/WXAQm633Szxk8Qg8a07GpmJXxzprW3bI6Z24LMBK.jpeg', 10, '2018-10-20 07:48:21', '2018-10-20 07:48:21');
INSERT INTO `product_images` VALUES (21, 'http://pbfh6sbp9.bkt.clouddn.com/bVyHdCfveWz19vb047RTolesd8SkxMHQeT9BhBMb.jpeg', 10, '2018-10-20 07:48:31', '2018-10-20 07:48:31');
INSERT INTO `product_images` VALUES (22, 'http://pbfh6sbp9.bkt.clouddn.com/9mRXCBTF1TJni2t0bo2xWfmqHkeZ9k6VdzSfNhDg.jpeg', 11, '2018-10-20 08:00:41', '2018-10-20 08:00:41');
INSERT INTO `product_images` VALUES (23, 'http://pbfh6sbp9.bkt.clouddn.com/NpoxniLjbI7jeYA4ig5x5zwWBcsqQ4aysnhuOrew.jpeg', 11, '2018-10-20 08:00:45', '2018-10-20 08:00:45');
INSERT INTO `product_images` VALUES (24, 'http://pbfh6sbp9.bkt.clouddn.com/WnSUvnf5856zGQR1kLmhOznKPcxO5s2IdgwT99oN.jpeg', 11, '2018-10-20 08:00:56', '2018-10-20 08:00:56');
INSERT INTO `product_images` VALUES (25, 'http://pbfh6sbp9.bkt.clouddn.com/6p8kPtN8tpnCFBvtBXRneFu7t11ZqbKWnxvYj0OQ.jpeg', 11, '2018-10-20 08:01:02', '2018-10-20 08:01:02');
INSERT INTO `product_images` VALUES (26, 'http://pbfh6sbp9.bkt.clouddn.com/K3QnYjY0fD4zZgcmakx5Q38Ws71uKEIp52RAaNfN.jpeg', 11, '2018-10-20 08:01:06', '2018-10-20 08:01:06');
INSERT INTO `product_images` VALUES (27, 'http://pbfh6sbp9.bkt.clouddn.com/mKeY005VCHK5GHyDXO9ReP2Y4KYXH5xMHE4jNTpZ.jpeg', 12, '2018-10-20 08:39:31', '2018-10-20 08:39:31');
INSERT INTO `product_images` VALUES (28, 'http://pbfh6sbp9.bkt.clouddn.com/agEvqk1ran1P22F0BqNOG93k2AKOEycGPvOeL43g.jpeg', 12, '2018-10-20 08:39:35', '2018-10-20 08:39:35');
INSERT INTO `product_images` VALUES (29, 'http://pbfh6sbp9.bkt.clouddn.com/S6PfF2VrIoTAAmEBYGvRj8NtpuvvKDLsXLF3VJke.jpeg', 12, '2018-10-20 08:39:40', '2018-10-20 08:39:40');
INSERT INTO `product_images` VALUES (30, 'http://pbfh6sbp9.bkt.clouddn.com/ANwPRJQhXjyRZgIM4oqfhGEOs9JwIqx8YknDgNe5.jpeg', 12, '2018-10-20 08:39:44', '2018-10-20 08:39:44');
INSERT INTO `product_images` VALUES (31, 'http://pbfh6sbp9.bkt.clouddn.com/UXcuvw0QW0LyYhQn7ApyYhedyD87wrDUGL9GxLSX.jpeg', 12, '2018-10-20 08:39:48', '2018-10-20 08:39:48');
INSERT INTO `product_images` VALUES (32, 'http://pbfh6sbp9.bkt.clouddn.com/84HxCBM5jlBMPdmDSbPypLzSRm17KLtnNzh8AJ4h.png', 13, '2018-10-20 10:03:37', '2018-10-20 10:03:37');
INSERT INTO `product_images` VALUES (33, 'http://pbfh6sbp9.bkt.clouddn.com/Ub4ASqyeQjNCoAgRLxq5PENmiIlkLcObKkSNkIIA.png', 13, '2018-10-20 10:03:38', '2018-10-20 10:03:38');
INSERT INTO `product_images` VALUES (34, 'http://pbfh6sbp9.bkt.clouddn.com/BPV7sOTtMGySVqr2NwJjEBj2kL0mL4lNhXHmBPrO.png', 13, '2018-10-20 10:03:41', '2018-10-20 10:03:41');
INSERT INTO `product_images` VALUES (35, 'http://pbfh6sbp9.bkt.clouddn.com/K5F3Ge9cx6cXBHxaJu2MJunf05oIFOlGA6pIWHnV.png', 13, '2018-10-20 10:03:42', '2018-10-20 10:03:42');
INSERT INTO `product_images` VALUES (36, 'http://pbfh6sbp9.bkt.clouddn.com/sKf1rynA5U5xL1DwGr5a0rIZc4KsVGkRSjfnktFs.png', 14, '2018-10-20 10:22:24', '2018-10-20 10:22:24');
INSERT INTO `product_images` VALUES (37, 'http://pbfh6sbp9.bkt.clouddn.com/JtaUebfCJwXjPJIxBDMzue17dcbS9bkzrUMjcdVm.png', 14, '2018-10-20 10:22:27', '2018-10-20 10:22:27');
INSERT INTO `product_images` VALUES (38, 'http://pbfh6sbp9.bkt.clouddn.com/ABtnOgW3F0Bj0783tkb0M5PvcVnAmpypsjXDnURK.png', 14, '2018-10-20 10:22:28', '2018-10-20 10:22:28');
INSERT INTO `product_images` VALUES (39, 'http://pbfh6sbp9.bkt.clouddn.com/peaA8DhxtSAFNWGbaEfyxqieCk4FydW6BdwXyqmC.png', 14, '2018-10-20 10:22:33', '2018-10-20 10:22:33');
INSERT INTO `product_images` VALUES (40, 'http://pbfh6sbp9.bkt.clouddn.com/3tzXZigGDAjlJUmYWS3iFWoqqsa0XMXMhMt4igel.png', 14, '2018-10-20 10:22:35', '2018-10-20 10:22:35');
INSERT INTO `product_images` VALUES (41, 'http://pbfh6sbp9.bkt.clouddn.com/eUInqPJSpEuvbFTwazRKktHnUsl8JjZFTDU6n98R.jpeg', 15, '2018-10-20 10:28:32', '2018-10-20 10:28:32');
INSERT INTO `product_images` VALUES (42, 'http://pbfh6sbp9.bkt.clouddn.com/9w0BuxuO4uzLyJbqfqt0rcSqDwEpvaQ1oy0WNyZB.jpeg', 15, '2018-10-20 10:28:32', '2018-10-20 10:28:32');
INSERT INTO `product_images` VALUES (43, 'http://pbfh6sbp9.bkt.clouddn.com/Ky4RFP8Tnr0KLo7QuB6yDOKCxJG5aXMqKr1RiinS.jpeg', 15, '2018-10-20 10:28:32', '2018-10-20 10:28:32');
INSERT INTO `product_images` VALUES (44, 'http://pbfh6sbp9.bkt.clouddn.com/bzMke1HeDAram4VLWGrg6EbMscw10LkQ3schq5nX.jpeg', 15, '2018-10-20 10:28:33', '2018-10-20 10:28:33');
INSERT INTO `product_images` VALUES (45, 'http://pbfh6sbp9.bkt.clouddn.com/fbn07myjLVCbNf4HrjgGexAk8mTfnAvUK54Xyh6u.jpeg', 15, '2018-10-20 10:28:34', '2018-10-20 10:28:34');
INSERT INTO `product_images` VALUES (46, 'http://pbfh6sbp9.bkt.clouddn.com/kp9jtrXskXir21F6qx7H6Z8b6o4Mwwtr8j4ha0Fn.png', 16, '2018-10-20 10:33:48', '2018-10-20 10:33:48');
INSERT INTO `product_images` VALUES (47, 'http://pbfh6sbp9.bkt.clouddn.com/CqHqBTN1NIqNbKyi0GOPELPBFm4EhTrcIZTVkYZG.png', 16, '2018-10-20 10:33:58', '2018-10-20 10:33:58');
INSERT INTO `product_images` VALUES (48, 'http://pbfh6sbp9.bkt.clouddn.com/E4pjVpO16uqw5MKS4bGZJXyn2MZqUJW36YZGB7qP.png', 16, '2018-10-20 10:34:01', '2018-10-20 10:34:01');
INSERT INTO `product_images` VALUES (49, 'http://pbfh6sbp9.bkt.clouddn.com/xdF7QQQQ3WvJCuq9SlFjFZcaoF6G5Er7MLgKQ8ks.jpeg', 17, '2018-10-20 10:45:58', '2018-10-20 10:45:58');
INSERT INTO `product_images` VALUES (50, 'http://pbfh6sbp9.bkt.clouddn.com/6hu50ajt41pkEeRSIUsNyJEHA2R5D883Trf9Ddh7.jpeg', 17, '2018-10-20 10:45:58', '2018-10-20 10:45:58');
INSERT INTO `product_images` VALUES (51, 'http://pbfh6sbp9.bkt.clouddn.com/tbNvPWPoBf4i4ntdTuXxTT3t05v4KDbawgc7XQ1q.jpeg', 17, '2018-10-20 10:45:59', '2018-10-20 10:45:59');
INSERT INTO `product_images` VALUES (52, 'http://pbfh6sbp9.bkt.clouddn.com/lElzseUWRDuI1Z2xhe3Ljhw8xnkkbPgQwXO9l7ub.png', 18, '2018-10-22 01:47:43', '2018-10-22 01:47:43');
INSERT INTO `product_images` VALUES (53, 'http://pbfh6sbp9.bkt.clouddn.com/04qgUokwZj9bfPnjf2SDJKwMTrA0ee97EhRj4mrp.png', 18, '2018-10-22 01:47:44', '2018-10-22 01:47:44');
INSERT INTO `product_images` VALUES (54, 'http://pbfh6sbp9.bkt.clouddn.com/FH5yE4lGofRHRK8EwX4IgQ0C1pfIjZNLVauJ0QVl.png', 18, '2018-10-22 01:47:47', '2018-10-22 01:47:47');
INSERT INTO `product_images` VALUES (55, 'http://pbfh6sbp9.bkt.clouddn.com/WJScx06uP9qcoeA52XWf4luB44MaKinVI7mbuCzg.png', 18, '2018-10-22 01:47:48', '2018-10-22 01:47:48');
INSERT INTO `product_images` VALUES (56, 'http://pbfh6sbp9.bkt.clouddn.com/1gULEpktQrM5ovK9RdbZH6ZCtiqqahyPlQ0mCNeu.png', 19, '2018-10-22 02:02:03', '2018-10-22 02:02:03');
INSERT INTO `product_images` VALUES (57, 'http://pbfh6sbp9.bkt.clouddn.com/TMrjAlfUapBYvnyrlMtXqqD1PMjm4ZXmgMg9zneq.png', 19, '2018-10-22 02:02:07', '2018-10-22 02:02:07');
INSERT INTO `product_images` VALUES (58, 'http://pbfh6sbp9.bkt.clouddn.com/g6en2ejcydgDs7hRMETBbAOhL3Ij6BUUKWvwYWXB.png', 19, '2018-10-22 02:02:10', '2018-10-22 02:02:10');
INSERT INTO `product_images` VALUES (59, 'http://pbfh6sbp9.bkt.clouddn.com/hzqMHUOR3dwFm4TStPbIFqAsAS7WoiB89yxcsoCp.png', 19, '2018-10-22 02:02:11', '2018-10-22 02:02:11');
INSERT INTO `product_images` VALUES (60, 'http://pbfh6sbp9.bkt.clouddn.com/EKn1PCip6a7NH0lw1dEwE4pXrbUpZIpYiILaES92.png', 20, '2018-10-22 02:05:33', '2018-10-22 02:05:33');
INSERT INTO `product_images` VALUES (61, 'http://pbfh6sbp9.bkt.clouddn.com/gIGBkYyLg0jPXhDXqWUPtqhcNJLnlmu2jXnJCURH.png', 20, '2018-10-22 02:05:36', '2018-10-22 02:05:36');
INSERT INTO `product_images` VALUES (62, 'http://pbfh6sbp9.bkt.clouddn.com/L2Fx7oz6rRY032wb5DheIC1vkyHUcSocGwnJz1sq.png', 20, '2018-10-22 02:05:43', '2018-10-22 02:05:43');
INSERT INTO `product_images` VALUES (63, 'http://pbfh6sbp9.bkt.clouddn.com/qZCit1lSWahnBrquO7rD7Z82Nh2GbqlhOO3MggBJ.png', 21, '2018-10-22 02:07:57', '2018-10-22 02:07:57');
INSERT INTO `product_images` VALUES (64, 'http://pbfh6sbp9.bkt.clouddn.com/PQKmiYv3RnZtL6XX2TyoxGA9pj6UAbh8MoXJGPZp.png', 21, '2018-10-22 02:08:02', '2018-10-22 02:08:02');
INSERT INTO `product_images` VALUES (65, 'http://pbfh6sbp9.bkt.clouddn.com/KP4BLPvv5thZKDZd80D7rxCzwvSV9bYWrHLkfODz.png', 21, '2018-10-22 02:08:04', '2018-10-22 02:08:04');
INSERT INTO `product_images` VALUES (66, 'http://pbfh6sbp9.bkt.clouddn.com/tQ9NqmUDAWHVSgooVVO7CSfPQkC4rRFxvxCvUjn4.png', 21, '2018-10-22 02:08:04', '2018-10-22 02:08:04');
INSERT INTO `product_images` VALUES (67, 'http://pbfh6sbp9.bkt.clouddn.com/RIw0RmfNAOY2i304LqJrue7fGO4lagICs8QbZNT8.png', 22, '2018-10-22 02:39:35', '2018-10-22 02:39:35');
INSERT INTO `product_images` VALUES (68, 'http://pbfh6sbp9.bkt.clouddn.com/gT9KCEiQinbLsWZBsk0cB5la75FfDDSMm8qFiqix.png', 22, '2018-10-22 02:39:42', '2018-10-22 02:39:42');
INSERT INTO `product_images` VALUES (69, 'http://pbfh6sbp9.bkt.clouddn.com/41cxIIp5Gg7JVEoZWLfWW2qABGr5GtkFR7OeQrvM.png', 22, '2018-10-22 02:39:42', '2018-10-22 02:39:42');
INSERT INTO `product_images` VALUES (70, 'http://pbfh6sbp9.bkt.clouddn.com/LfF6FNXxXoJrsNXV49Gio95oDcPcjx7x7pOWq8DX.png', 22, '2018-10-22 02:39:42', '2018-10-22 02:39:42');
INSERT INTO `product_images` VALUES (71, 'http://pbfh6sbp9.bkt.clouddn.com/OBGetGuiq0NlJLevtEMpamEHhFMAE5BKNB3gDgxt.png', 23, '2018-10-22 02:44:04', '2018-10-22 02:44:04');
INSERT INTO `product_images` VALUES (72, 'http://pbfh6sbp9.bkt.clouddn.com/wyzJyZ5SLUcve2WjI7Gn3FGvZtG1bqZH4XRvqci7.png', 23, '2018-10-22 02:44:12', '2018-10-22 02:44:12');
INSERT INTO `product_images` VALUES (73, 'http://pbfh6sbp9.bkt.clouddn.com/RAtf6OcWC3bzFmPTmrnA2NrVPpSGkwCE8EILYX2D.png', 23, '2018-10-22 02:44:12', '2018-10-22 02:44:12');
INSERT INTO `product_images` VALUES (74, 'http://pbfh6sbp9.bkt.clouddn.com/7vuqAFQXX5ROJnfKhQlaNqXcEyjFGPai6dbN5WF9.png', 24, '2018-10-22 02:45:37', '2018-10-22 02:45:37');
INSERT INTO `product_images` VALUES (75, 'http://pbfh6sbp9.bkt.clouddn.com/buRes9zAHJ6vhLK1G2hZxv5SPRKoHUKpYPqYiiSg.png', 24, '2018-10-22 02:45:38', '2018-10-22 02:45:38');
INSERT INTO `product_images` VALUES (76, 'http://pbfh6sbp9.bkt.clouddn.com/HImmI0rhoYO4vhsHtmeliMxosrVanWXrd4jKjk7X.png', 24, '2018-10-22 02:45:41', '2018-10-22 02:45:41');
INSERT INTO `product_images` VALUES (77, 'http://pbfh6sbp9.bkt.clouddn.com/MZ40Tbp8z28zTluzJC9UvEnmGprVKcROqWMqdyK8.png', 25, '2018-10-22 02:48:36', '2018-10-22 02:48:36');
INSERT INTO `product_images` VALUES (78, 'http://pbfh6sbp9.bkt.clouddn.com/v0kzraGBOGoBhlVVr36Poup2J2d7dZxkViBpFGmi.png', 25, '2018-10-22 02:48:38', '2018-10-22 02:48:38');
INSERT INTO `product_images` VALUES (79, 'http://pbfh6sbp9.bkt.clouddn.com/NE5eO9tKZXUwbkwtkIAMLgJKbzGM9L3DzYVIW6bz.png', 25, '2018-10-22 02:48:45', '2018-10-22 02:48:45');
INSERT INTO `product_images` VALUES (80, 'http://pbfh6sbp9.bkt.clouddn.com/VcEbjbzDa2ZNAH7w0HWzO7k1VCS573KK2QGY3F2O.png', 25, '2018-10-22 02:48:47', '2018-10-22 02:48:47');
INSERT INTO `product_images` VALUES (81, 'http://pbfh6sbp9.bkt.clouddn.com/eu2dPALUr6zZKkJW0ZGQAOOgE1UKoRIcdaDWCM76.png', 26, '2018-10-22 02:51:19', '2018-10-22 02:51:19');
INSERT INTO `product_images` VALUES (82, 'http://pbfh6sbp9.bkt.clouddn.com/uCEYvtXpogZTCyNJYCYBgI1H3y0rCDGHDsLCbja8.png', 26, '2018-10-22 02:51:19', '2018-10-22 02:51:19');
INSERT INTO `product_images` VALUES (83, 'http://pbfh6sbp9.bkt.clouddn.com/ZAWA5UJecOfHZOr0gG6UzY38yrWEikyqniJlItCG.png', 26, '2018-10-22 02:51:25', '2018-10-22 02:51:25');
INSERT INTO `product_images` VALUES (84, 'http://pbfh6sbp9.bkt.clouddn.com/rUtm7D00ah0F2lV7Q0otlZqI5DQuDLoBLYfVoz0a.png', 26, '2018-10-22 02:51:27', '2018-10-22 02:51:27');
INSERT INTO `product_images` VALUES (85, 'http://pbfh6sbp9.bkt.clouddn.com/5SKK3uPRPIQpQm7YgSqiNe4r3q3n5KLXKKwedt2S.png', 27, '2018-10-22 02:53:21', '2018-10-22 02:53:21');
INSERT INTO `product_images` VALUES (86, 'http://pbfh6sbp9.bkt.clouddn.com/bQx60h8lo3syFVcvB5kX22rH523bIAoPrdIcriAE.png', 27, '2018-10-22 02:53:25', '2018-10-22 02:53:25');
INSERT INTO `product_images` VALUES (87, 'http://pbfh6sbp9.bkt.clouddn.com/IHkNo9yX0IWmp6qSaakv8WMqMOkEpGjo8rXuu5ql.png', 27, '2018-10-22 02:53:32', '2018-10-22 02:53:32');
INSERT INTO `product_images` VALUES (88, 'http://pbfh6sbp9.bkt.clouddn.com/S5O5mbZhNVwhNIt3c3TOCinG847Hq4QGFMxQTqYW.png', 28, '2018-10-22 06:10:50', '2018-10-22 06:10:50');
INSERT INTO `product_images` VALUES (89, 'http://pbfh6sbp9.bkt.clouddn.com/qrlRbNvgh5UuIzcUpRnQD07AADnTwRbZVrAHF7LX.png', 28, '2018-10-22 06:10:53', '2018-10-22 06:10:53');
INSERT INTO `product_images` VALUES (90, 'http://pbfh6sbp9.bkt.clouddn.com/oVxlWJrcSyOCvqqB25KnH2b6QM5xTdHan3mI1OGf.png', 28, '2018-10-22 06:10:57', '2018-10-22 06:10:57');
INSERT INTO `product_images` VALUES (91, 'http://pbfh6sbp9.bkt.clouddn.com/dCYtZ7Vr65ZUEcvT8aFz6WCU79jO7BqJ3mkA2pXe.png', 28, '2018-10-22 06:11:01', '2018-10-22 06:11:01');
INSERT INTO `product_images` VALUES (92, 'http://pbfh6sbp9.bkt.clouddn.com/EJPKA7zQKZ44yBCSBMvPVs95ZeoWx5K9RiKjGlTG.png', 28, '2018-10-22 06:11:01', '2018-10-22 06:11:01');
INSERT INTO `product_images` VALUES (93, 'http://pbfh6sbp9.bkt.clouddn.com/0F1GRVDOEdfbQxNJYpWGmZvyr2dlUbEdbDS6UX4A.png', 29, '2018-10-22 06:17:51', '2018-10-22 06:17:51');
INSERT INTO `product_images` VALUES (94, 'http://pbfh6sbp9.bkt.clouddn.com/WRefNZQCJpCrebp5PKSKigbdJ7l3Orex154aqJgo.png', 29, '2018-10-22 06:17:51', '2018-10-22 06:17:51');
INSERT INTO `product_images` VALUES (95, 'http://pbfh6sbp9.bkt.clouddn.com/Xn8RLoCXoHSM3hNy1PSOuEFEGgFSn5hDBd5l9sxa.png', 29, '2018-10-22 06:17:52', '2018-10-22 06:17:52');
INSERT INTO `product_images` VALUES (96, 'http://pbfh6sbp9.bkt.clouddn.com/f91MEx5H31TQZF5tmcKvaMKTJQF9VFlGJ2Hby5eB.png', 29, '2018-10-22 06:17:54', '2018-10-22 06:17:54');
INSERT INTO `product_images` VALUES (97, 'http://pbfh6sbp9.bkt.clouddn.com/yk0SCFgGXmkCZJWsFWzZQ1UCAAUQ9FBABj72mnm2.png', 29, '2018-10-22 06:17:58', '2018-10-22 06:17:58');
INSERT INTO `product_images` VALUES (98, 'http://pbfh6sbp9.bkt.clouddn.com/vBz2E326519TdLeZr47FSd9vBqUFv3pJScpq1zC7.png', 30, '2018-10-22 06:20:52', '2018-10-22 06:20:52');
INSERT INTO `product_images` VALUES (99, 'http://pbfh6sbp9.bkt.clouddn.com/zTUNkS6Ui55Neb5p70775aagPUESREwQC8Hc7uBO.png', 30, '2018-10-22 06:20:52', '2018-10-22 06:20:52');
INSERT INTO `product_images` VALUES (100, 'http://pbfh6sbp9.bkt.clouddn.com/NMdMwPXI7cq03v1e4LdRgjIypjEzxCtvgWPo4UNn.png', 30, '2018-10-22 06:20:52', '2018-10-22 06:20:52');
INSERT INTO `product_images` VALUES (101, 'http://pbfh6sbp9.bkt.clouddn.com/Y8UkJl9LDH3RcUszyLpQejoV5K3ZDr3v0dPLhqAw.png', 30, '2018-10-22 06:20:52', '2018-10-22 06:20:52');
INSERT INTO `product_images` VALUES (102, 'http://pbfh6sbp9.bkt.clouddn.com/qZMgdQrb16XEynx3flNxuiqnlDLvJ8L3lvvol8DQ.png', 30, '2018-10-22 06:20:54', '2018-10-22 06:20:54');
INSERT INTO `product_images` VALUES (103, 'http://pbfh6sbp9.bkt.clouddn.com/S4ImHsUS4R4KqiVdIMOemuY7iqtY6dOJtda5gzyC.png', 30, '2018-10-22 06:20:55', '2018-10-22 06:20:55');
INSERT INTO `product_images` VALUES (104, 'http://pbfh6sbp9.bkt.clouddn.com/fShFXbCisasd4vsxoOcJl5fIrvlXRfstAdVkrM4W.png', 30, '2018-10-22 06:20:56', '2018-10-22 06:20:56');
INSERT INTO `product_images` VALUES (105, 'http://pbfh6sbp9.bkt.clouddn.com/oWONeLzFAx9zrOesimUOT9nFOrOaCnUcBYBvS8kg.png', 31, '2018-10-22 06:24:38', '2018-10-22 06:24:38');
INSERT INTO `product_images` VALUES (106, 'http://pbfh6sbp9.bkt.clouddn.com/qi2ggW70O9j4NFkvwDrKAYUBGf7EolsOAJTmWT1n.png', 31, '2018-10-22 06:24:38', '2018-10-22 06:24:38');
INSERT INTO `product_images` VALUES (107, 'http://pbfh6sbp9.bkt.clouddn.com/wVoMcly1ReENE0DXo4j2SiIOQj8jXlBrXp2wlME1.png', 31, '2018-10-22 06:24:46', '2018-10-22 06:24:46');
INSERT INTO `product_images` VALUES (108, 'http://pbfh6sbp9.bkt.clouddn.com/XzFpKthtOdGU388R2dT0lMwioToSwk7gj8oiNMGT.png', 31, '2018-10-22 06:24:46', '2018-10-22 06:24:46');
INSERT INTO `product_images` VALUES (109, 'http://pbfh6sbp9.bkt.clouddn.com/I12Gm0Js7tiqwqXBlgDdzKi4lNpLXTtD6Uj8nBU6.png', 31, '2018-10-22 06:24:46', '2018-10-22 06:24:46');
INSERT INTO `product_images` VALUES (110, 'http://pbfh6sbp9.bkt.clouddn.com/pSKuDYxelXwRtezNezONmw1ejxqKRnReVGc1sfna.png', 32, '2018-10-22 06:32:26', '2018-10-22 06:32:26');
INSERT INTO `product_images` VALUES (111, 'http://pbfh6sbp9.bkt.clouddn.com/vWtIIOhkKOPjrvbihprpNArtjnuzf4rnVrDPxg7V.png', 32, '2018-10-22 06:32:26', '2018-10-22 06:32:26');
INSERT INTO `product_images` VALUES (112, 'http://pbfh6sbp9.bkt.clouddn.com/ZicN8D3FF8V765BVhtk9VUkRjbbYALKWq0h4a5wR.png', 32, '2018-10-22 06:32:30', '2018-10-22 06:32:30');
INSERT INTO `product_images` VALUES (113, 'http://pbfh6sbp9.bkt.clouddn.com/JcviaU49GBsRQ44EW089znAoUM593eY4BAP6YByU.png', 32, '2018-10-22 06:32:33', '2018-10-22 06:32:33');
INSERT INTO `product_images` VALUES (114, 'http://pbfh6sbp9.bkt.clouddn.com/6brs7sxyY2UVtn8ahHuKnwG8LLANYN1VtqQNFojt.png', 32, '2018-10-22 06:32:36', '2018-10-22 06:32:36');
INSERT INTO `product_images` VALUES (115, 'http://pbfh6sbp9.bkt.clouddn.com/V1dncQo38tJgxJLkslGMfnp7PqZangQB7D5vRW4h.png', 33, '2018-10-22 06:35:30', '2018-10-22 06:35:30');
INSERT INTO `product_images` VALUES (116, 'http://pbfh6sbp9.bkt.clouddn.com/N7UijZ4ce373XWwt5z8h5gwn1Fmh1ju3jC2mUYW6.png', 33, '2018-10-22 06:35:31', '2018-10-22 06:35:31');
INSERT INTO `product_images` VALUES (117, 'http://pbfh6sbp9.bkt.clouddn.com/9W2z83oDJxM3KxGaE4jnfx3w9PVP3mbO8YQGCMWJ.png', 33, '2018-10-22 06:35:36', '2018-10-22 06:35:36');
INSERT INTO `product_images` VALUES (118, 'http://pbfh6sbp9.bkt.clouddn.com/V51nb3OBTGAehCbb8XFWMAxUdxiRHeASbowMs4ST.png', 33, '2018-10-22 06:35:36', '2018-10-22 06:35:36');
INSERT INTO `product_images` VALUES (119, 'http://pbfh6sbp9.bkt.clouddn.com/8FEGZKXNpXwVSMuUUw76DNlA8lyFUHvkZwx3v2td.png', 34, '2018-10-22 06:43:40', '2018-10-22 06:43:40');
INSERT INTO `product_images` VALUES (120, 'http://pbfh6sbp9.bkt.clouddn.com/N8bxaTOpqVffSmVVOoTlDZax9G7rmyaR9sK9ys2v.png', 34, '2018-10-22 06:43:44', '2018-10-22 06:43:44');
INSERT INTO `product_images` VALUES (121, 'http://pbfh6sbp9.bkt.clouddn.com/EKkrOroSCFsi4WAOG7T6aJcDsJdlpey4S9EPZ2qL.png', 34, '2018-10-22 06:43:46', '2018-10-22 06:43:46');
INSERT INTO `product_images` VALUES (122, 'http://pbfh6sbp9.bkt.clouddn.com/TffmsjFq6V9sNakPZBnqpPUrSKBmSwfTES8NMEqw.png', 34, '2018-10-22 06:43:46', '2018-10-22 06:43:46');
INSERT INTO `product_images` VALUES (124, 'http://pbfh6sbp9.bkt.clouddn.com/N9Pzk0arWfuiXevJ2yexeHl6Jetueu1X3HENNO5U.png', 35, '2018-10-22 06:48:17', '2018-10-22 06:48:17');
INSERT INTO `product_images` VALUES (125, 'http://pbfh6sbp9.bkt.clouddn.com/v6J31t05gCGq2QnffDlpZBgSOd1MGLlmaKKisxj3.png', 35, '2018-10-22 06:48:20', '2018-10-22 06:48:20');
INSERT INTO `product_images` VALUES (126, 'http://pbfh6sbp9.bkt.clouddn.com/Q3zlHZdom3rarqlfRNfKEwmMtNcP4YuSlAsi71UC.png', 35, '2018-10-22 06:48:22', '2018-10-22 06:48:22');
INSERT INTO `product_images` VALUES (127, 'http://pbfh6sbp9.bkt.clouddn.com/sOcDK8wbfWI8H67vgCxv0IjZH5ecghNmHaD1JSz8.png', 35, '2018-10-22 06:48:22', '2018-10-22 06:48:22');
INSERT INTO `product_images` VALUES (128, 'http://pbfh6sbp9.bkt.clouddn.com/KeConQeUIkU2PWmSvUq76kxKm7LHAV7lXg8ziqY9.png', 35, '2018-10-22 06:48:25', '2018-10-22 06:48:25');
INSERT INTO `product_images` VALUES (129, 'http://pbfh6sbp9.bkt.clouddn.com/BKKXRLscmafZVbFePiF7gwxVEQ45GTyG25PCZAQ0.png', 36, '2018-10-22 06:49:28', '2018-10-22 06:49:28');
INSERT INTO `product_images` VALUES (130, 'http://pbfh6sbp9.bkt.clouddn.com/f1OVej7Uslsi0GJ99V575oSOFvUsl7M6NiZCHyBY.png', 36, '2018-10-22 06:49:34', '2018-10-22 06:49:34');
INSERT INTO `product_images` VALUES (131, 'http://pbfh6sbp9.bkt.clouddn.com/BjBEgpwUSr5FWJ7ErLu9oh3Jjgr1ynxirbdQmzdw.png', 36, '2018-10-22 06:49:35', '2018-10-22 06:49:35');
INSERT INTO `product_images` VALUES (132, 'http://pbfh6sbp9.bkt.clouddn.com/Pfqqno8hV5YbRpMDUofwzJgUoTpZqmtMXV4uVWHR.png', 36, '2018-10-22 06:49:35', '2018-10-22 06:49:35');
INSERT INTO `product_images` VALUES (133, 'http://pbfh6sbp9.bkt.clouddn.com/uYqFaFdAZI1JORxwdDAldH3zSfDF1l4BOAp1n2RZ.png', 36, '2018-10-22 06:49:36', '2018-10-22 06:49:36');
INSERT INTO `product_images` VALUES (134, 'http://pbfh6sbp9.bkt.clouddn.com/zdA5ARzzr7lk4w07MrouUV7zFZxCM6CyhZVjPahX.png', 37, '2018-10-22 06:53:00', '2018-10-22 06:53:00');
INSERT INTO `product_images` VALUES (135, 'http://pbfh6sbp9.bkt.clouddn.com/FiQLS8VamJ5ptNx4w9IOn4CQGxtYlv1eOwohfDy0.png', 37, '2018-10-22 06:53:02', '2018-10-22 06:53:02');
INSERT INTO `product_images` VALUES (136, 'http://pbfh6sbp9.bkt.clouddn.com/0VsAgOmf35XbqypYWbzWYy4jEUFkDnWtEH8BOn8P.png', 37, '2018-10-22 06:53:02', '2018-10-22 06:53:02');
INSERT INTO `product_images` VALUES (137, 'http://pbfh6sbp9.bkt.clouddn.com/Jns96h9c4rY7hQb2LtFehMNo9GTI33Z4w0svjJW1.png', 37, '2018-10-22 06:53:04', '2018-10-22 06:53:04');
INSERT INTO `product_images` VALUES (138, 'http://pbfh6sbp9.bkt.clouddn.com/WC5CHzoQNzhdnHJenGll3TJvIaulP9Kp5UXESVae.png', 37, '2018-10-22 06:53:06', '2018-10-22 06:53:06');
INSERT INTO `product_images` VALUES (139, 'http://pbfh6sbp9.bkt.clouddn.com/y2gQAuCaLKf5rmQg58hgOh1ExtyEZWsnGSd2ALwn.png', 38, '2018-10-22 08:08:10', '2018-10-22 08:08:10');
INSERT INTO `product_images` VALUES (140, 'http://pbfh6sbp9.bkt.clouddn.com/IY6CzSPvG8IbTtHHQNSbsZloQto9PSKZEBySApdG.png', 38, '2018-10-22 08:08:13', '2018-10-22 08:08:13');
INSERT INTO `product_images` VALUES (141, 'http://pbfh6sbp9.bkt.clouddn.com/rIBt2YHTR2S4Jnr1mesSriOExr5WPmvXbx9YGeir.png', 38, '2018-10-22 08:08:16', '2018-10-22 08:08:16');
INSERT INTO `product_images` VALUES (142, 'http://pbfh6sbp9.bkt.clouddn.com/2yxZorDrkwYkfIkXK9ufiRfdV4tHNA65ejP1M9JV.png', 38, '2018-10-22 08:08:20', '2018-10-22 08:08:20');
INSERT INTO `product_images` VALUES (143, 'http://pbfh6sbp9.bkt.clouddn.com/3vFcBQzlgDv9h8rqnv2UUkry4Vc1kEtRNSQSckXv.png', 38, '2018-10-22 08:08:25', '2018-10-22 08:08:25');
INSERT INTO `product_images` VALUES (144, 'http://pbfh6sbp9.bkt.clouddn.com/0TbwCpCiuN2UQSKjHV7tSiO9ctsJL2RMfszFvrVm.png', 38, '2018-10-22 08:08:27', '2018-10-22 08:08:27');
INSERT INTO `product_images` VALUES (145, 'http://pbfh6sbp9.bkt.clouddn.com/limIz3dUvBiQlFwgPwkXOQIShzYQCZa05wOGAwNX.png', 38, '2018-10-22 08:08:31', '2018-10-22 08:08:31');
INSERT INTO `product_images` VALUES (146, 'http://pbfh6sbp9.bkt.clouddn.com/9sWqhsIleLNdSmhdbkbsmk8EtvO2TqCWZid7HPMy.png', 39, '2018-10-22 08:12:17', '2018-10-22 08:12:17');
INSERT INTO `product_images` VALUES (147, 'http://pbfh6sbp9.bkt.clouddn.com/27w3tSUSKKQiElgqhc0TaZCgsnvRwpTQyTcIUiJB.png', 39, '2018-10-22 08:12:24', '2018-10-22 08:12:24');
INSERT INTO `product_images` VALUES (148, 'http://pbfh6sbp9.bkt.clouddn.com/F3a3a5jsU2c1OvVYJ21krEsU0YtqIHIHch6xPaWK.png', 39, '2018-10-22 08:12:28', '2018-10-22 08:12:28');
INSERT INTO `product_images` VALUES (149, 'http://pbfh6sbp9.bkt.clouddn.com/gfqe2nuB1q4jGzYa4iGgRlAo4XnZaX1bSmImO7DW.png', 39, '2018-10-22 08:12:34', '2018-10-22 08:12:34');
INSERT INTO `product_images` VALUES (150, 'http://pbfh6sbp9.bkt.clouddn.com/y5cy5wHMMAfZPcvQgzuevtfeQWQW1a7Thed59qkR.png', 39, '2018-10-22 08:12:38', '2018-10-22 08:12:38');
INSERT INTO `product_images` VALUES (151, 'http://pbfh6sbp9.bkt.clouddn.com/JPc3gcx4uPVZAwSOlBBlDTR9Rxy636Otq4WUTjWV.png', 39, '2018-10-22 08:12:41', '2018-10-22 08:12:41');
INSERT INTO `product_images` VALUES (152, 'http://pbfh6sbp9.bkt.clouddn.com/sBPV9ee2uVvjlAhBdddeJ5ObPTtNTreAwuTCKGhC.png', 40, '2018-10-22 08:16:32', '2018-10-22 08:16:32');
INSERT INTO `product_images` VALUES (153, 'http://pbfh6sbp9.bkt.clouddn.com/NaVyhH8vGP7BK1ycWXIJ02jpCxvhENAUfyyWFUYu.png', 40, '2018-10-22 08:16:39', '2018-10-22 08:16:39');
INSERT INTO `product_images` VALUES (154, 'http://pbfh6sbp9.bkt.clouddn.com/GyVuZ4vRLKslKefZj0LpaEBTKL5iiteRcANN0kDp.png', 40, '2018-10-22 08:16:43', '2018-10-22 08:16:43');
INSERT INTO `product_images` VALUES (155, 'http://pbfh6sbp9.bkt.clouddn.com/LLOLRA07OU1JrNjS1GZXQ3NmkpLesyJd0y1apll7.png', 40, '2018-10-22 08:16:46', '2018-10-22 08:16:46');
INSERT INTO `product_images` VALUES (156, 'http://pbfh6sbp9.bkt.clouddn.com/PtYjXRpzDM3HZrShkWVcNZKDhCqmyGGTxNotWJPE.png', 41, '2018-10-22 08:18:36', '2018-10-22 08:18:36');
INSERT INTO `product_images` VALUES (157, 'http://pbfh6sbp9.bkt.clouddn.com/HiklJ6SwyOMEkEFbOz5onKrQJCVVvvs8lwuxynWI.png', 41, '2018-10-22 08:18:39', '2018-10-22 08:18:39');
INSERT INTO `product_images` VALUES (158, 'http://pbfh6sbp9.bkt.clouddn.com/VNyRNN2hzJGmfbdsJzv6OjfouKRMpl2j4dmlpi7t.png', 41, '2018-10-22 08:18:42', '2018-10-22 08:18:42');
INSERT INTO `product_images` VALUES (159, 'http://pbfh6sbp9.bkt.clouddn.com/UuBoUoFHEyZob9aT2dMKiyaQrtmFx2SPk67dVBlY.png', 41, '2018-10-22 08:18:45', '2018-10-22 08:18:45');
INSERT INTO `product_images` VALUES (160, 'http://pbfh6sbp9.bkt.clouddn.com/sX8ZxYbu88nggCg9lOBnC476CJYQFMcP6RIPTdDT.png', 41, '2018-10-22 08:18:52', '2018-10-22 08:18:52');
INSERT INTO `product_images` VALUES (161, 'http://pbfh6sbp9.bkt.clouddn.com/6L4iXDogOnXC2Tf0cVS22mMI493WVVnup8P9taCF.png', 41, '2018-10-22 08:18:57', '2018-10-22 08:18:57');
INSERT INTO `product_images` VALUES (162, 'http://pbfh6sbp9.bkt.clouddn.com/YJZwnZ7Ztnzz4FeZx6J9JVjXkHmi2MM15Ba1xziX.png', 41, '2018-10-22 08:19:01', '2018-10-22 08:19:01');
INSERT INTO `product_images` VALUES (163, 'http://pbfh6sbp9.bkt.clouddn.com/ihZyEd80L1K1Dff5iV3JKd4Qo46RxWFMosE7730t.png', 41, '2018-10-22 08:19:05', '2018-10-22 08:19:05');
INSERT INTO `product_images` VALUES (164, 'http://pbfh6sbp9.bkt.clouddn.com/yCaZ4xa4EW1DJzDbxNPNM8JqfqrNZfNgDKo6IMKe.png', 42, '2018-10-22 08:20:29', '2018-10-22 08:20:29');
INSERT INTO `product_images` VALUES (165, 'http://pbfh6sbp9.bkt.clouddn.com/veBK20Y70l8iLsPX2l1LtJH8pzNSSjVpGOtd9QQF.png', 42, '2018-10-22 08:20:29', '2018-10-22 08:20:29');
INSERT INTO `product_images` VALUES (166, 'http://pbfh6sbp9.bkt.clouddn.com/40rp7H2QqKo1VXSvDlIgH3sagjCMsZ0glhkcq4HH.png', 42, '2018-10-22 08:20:29', '2018-10-22 08:20:29');
INSERT INTO `product_images` VALUES (167, 'http://pbfh6sbp9.bkt.clouddn.com/JI0aSJpn3mYXlPaNzuVJfIBd5pqDRFEEptMcf1xi.png', 42, '2018-10-22 08:20:29', '2018-10-22 08:20:29');
INSERT INTO `product_images` VALUES (168, 'http://pbfh6sbp9.bkt.clouddn.com/H8Gd3n55V6hNVXvIuuChYPt1Dt2YAK5K8My7U6A1.png', 42, '2018-10-22 08:20:38', '2018-10-22 08:20:38');
INSERT INTO `product_images` VALUES (169, 'http://pbfh6sbp9.bkt.clouddn.com/J55d36wNKmMQAN0ljjTjqnJh239Dplfnf0RXJPkD.png', 42, '2018-10-22 08:20:39', '2018-10-22 08:20:39');
INSERT INTO `product_images` VALUES (170, 'http://pbfh6sbp9.bkt.clouddn.com/mcye5nrbhUq4WZKiI6CADmLrYbZuEkG7PVbuijoU.png', 42, '2018-10-22 08:20:40', '2018-10-22 08:20:40');
INSERT INTO `product_images` VALUES (171, 'http://pbfh6sbp9.bkt.clouddn.com/VnhEoOZURNTOB1xWOAnPaI0wjzS1f0lGLQyztaDo.png', 42, '2018-10-22 08:20:42', '2018-10-22 08:20:42');
INSERT INTO `product_images` VALUES (172, 'http://pbfh6sbp9.bkt.clouddn.com/usGQFbhBAabC3Ebz2PM4L8LublIRzcRrhsm7uQNU.png', 43, '2018-10-22 08:21:34', '2018-10-22 08:21:34');
INSERT INTO `product_images` VALUES (173, 'http://pbfh6sbp9.bkt.clouddn.com/xMcZNNmr7BkD6HfqKHu34WQ1pvDFoCE4fuizEN1e.png', 43, '2018-10-22 08:21:39', '2018-10-22 08:21:39');
INSERT INTO `product_images` VALUES (174, 'http://pbfh6sbp9.bkt.clouddn.com/6acwRUN9YURRcAZaiiZfqmQ1NiZ9EkD5plFt7ubz.png', 43, '2018-10-22 08:21:40', '2018-10-22 08:21:40');
INSERT INTO `product_images` VALUES (175, 'http://pbfh6sbp9.bkt.clouddn.com/DMddtrU114MJt6FtWg6fz2DHpFWVT6QCqKpzZgzf.png', 43, '2018-10-22 08:21:41', '2018-10-22 08:21:41');
INSERT INTO `product_images` VALUES (176, 'http://pbfh6sbp9.bkt.clouddn.com/LF0IxPmbI6zpoocRYr91e3MpKMpM8aNnBOtzi0BH.png', 44, '2018-10-22 08:25:19', '2018-10-22 08:25:19');
INSERT INTO `product_images` VALUES (177, 'http://pbfh6sbp9.bkt.clouddn.com/JfDPbH26HnWw6yxRLkZPfx6MHUDABQm09i9TxeGe.png', 44, '2018-10-22 08:25:19', '2018-10-22 08:25:19');
INSERT INTO `product_images` VALUES (178, 'http://pbfh6sbp9.bkt.clouddn.com/L7p6hvU3K6sDlMwALjUEsG3j043cBaz7ANAOpaju.png', 44, '2018-10-22 08:25:20', '2018-10-22 08:25:20');
INSERT INTO `product_images` VALUES (179, 'http://pbfh6sbp9.bkt.clouddn.com/BWzqL7GCZbN3nuPwhfNY7rp3ydQJIZnPJUhRlh30.png', 44, '2018-10-22 08:25:23', '2018-10-22 08:25:23');
INSERT INTO `product_images` VALUES (180, 'http://pbfh6sbp9.bkt.clouddn.com/eZVFJuheLunzWmQ6UpgrNqmy9y1gDEdDnzUnYVl7.png', 44, '2018-10-22 08:25:24', '2018-10-22 08:25:24');
INSERT INTO `product_images` VALUES (181, 'http://pbfh6sbp9.bkt.clouddn.com/Dtc1VGLONoQDsCDjgWPagJiFZctAS39rUGrr8YJG.png', 45, '2018-10-22 08:26:37', '2018-10-22 08:26:37');
INSERT INTO `product_images` VALUES (182, 'http://pbfh6sbp9.bkt.clouddn.com/9kbRdd7trBRdTLewTD60HrKlLQDnEvJK6Ef3YFCR.png', 45, '2018-10-22 08:26:37', '2018-10-22 08:26:37');
INSERT INTO `product_images` VALUES (183, 'http://pbfh6sbp9.bkt.clouddn.com/X3mfi9D5edLGDiiDzpipuK6JUW4ZMCIEeJqODqqz.png', 45, '2018-10-22 08:26:42', '2018-10-22 08:26:42');
INSERT INTO `product_images` VALUES (184, 'http://pbfh6sbp9.bkt.clouddn.com/jW4myOtMZX3v9MS5YQlVIfZneWZkVDWg0y4d0QWO.png', 45, '2018-10-22 08:26:42', '2018-10-22 08:26:42');
INSERT INTO `product_images` VALUES (185, 'http://pbfh6sbp9.bkt.clouddn.com/hZnHVpuMz8OBGI0gE3Vth90hMnhycCwU5UTFK5VS.png', 45, '2018-10-22 08:26:44', '2018-10-22 08:26:44');
INSERT INTO `product_images` VALUES (186, 'http://pbfh6sbp9.bkt.clouddn.com/GHzeKfgaT4blFVLxXDm1NvSgpKTSw0IIXXPkBNve.png', 46, '2018-10-22 08:28:55', '2018-10-22 08:28:55');
INSERT INTO `product_images` VALUES (187, 'http://pbfh6sbp9.bkt.clouddn.com/oRhwfcdUdl4bRsZa3kI4qo55mKMmCqG21jwRcbmV.png', 46, '2018-10-22 08:29:00', '2018-10-22 08:29:00');
INSERT INTO `product_images` VALUES (189, 'http://pbfh6sbp9.bkt.clouddn.com/J9MYRFzvI6jNexy0dp1PJXtUC4HdS53DU02q3gCa.png', 46, '2018-10-22 08:29:01', '2018-10-22 08:29:01');
INSERT INTO `product_images` VALUES (190, 'http://pbfh6sbp9.bkt.clouddn.com/5BaYe6CZF9o52WUaZX2kF7MHfGdyX37U14ZRGVA9.png', 47, '2018-10-22 08:31:01', '2018-10-22 08:31:01');
INSERT INTO `product_images` VALUES (191, 'http://pbfh6sbp9.bkt.clouddn.com/bFQZYYDf65bkRFTvsDOLiEzJduZozLQ2vqCxi8an.png', 47, '2018-10-22 08:31:01', '2018-10-22 08:31:01');
INSERT INTO `product_images` VALUES (192, 'http://pbfh6sbp9.bkt.clouddn.com/j5vWcgt7jEzMNbMBRVro2pL78cy0Us9tf4PCmp8Q.png', 47, '2018-10-22 08:31:03', '2018-10-22 08:31:03');
INSERT INTO `product_images` VALUES (193, 'http://pbfh6sbp9.bkt.clouddn.com/BFHsPR8KJAqtw65F4i1YkhEtekNZI4lmeviNvloT.png', 48, '2018-10-22 08:32:36', '2018-10-22 08:32:36');
INSERT INTO `product_images` VALUES (194, 'http://pbfh6sbp9.bkt.clouddn.com/i03laQkgoc3aUJIyZ1Z0BQ6zFXamTFVk8xY9PmMJ.png', 48, '2018-10-22 08:32:37', '2018-10-22 08:32:37');
INSERT INTO `product_images` VALUES (195, 'http://pbfh6sbp9.bkt.clouddn.com/Zmin8pqoP7kJ1GgySsq3IvMH0LBgn1TvuIuY2ghA.png', 48, '2018-10-22 08:32:37', '2018-10-22 08:32:37');
INSERT INTO `product_images` VALUES (196, 'http://pbfh6sbp9.bkt.clouddn.com/I8XeOAO063GNedFDwtBuT5f5U2NrJy9NHdQk5s62.png', 48, '2018-10-22 08:32:38', '2018-10-22 08:32:38');
INSERT INTO `product_images` VALUES (197, 'http://pbfh6sbp9.bkt.clouddn.com/ckYazql5T1QQHEiKK1i3OyWPfcewFhW0fxta0OEK.png', 48, '2018-10-22 08:32:39', '2018-10-22 08:32:39');
INSERT INTO `product_images` VALUES (198, 'http://pbfh6sbp9.bkt.clouddn.com/7D0l0nuNJzHO6QcMeNRZNtnq55qjI3XvgqAjuWzR.png', 49, '2018-10-22 08:33:39', '2018-10-22 08:33:39');
INSERT INTO `product_images` VALUES (199, 'http://pbfh6sbp9.bkt.clouddn.com/CYoED3xYjwwnj6xLyjYWN0uOsptxpC284wM87RH6.png', 49, '2018-10-22 08:33:40', '2018-10-22 08:33:40');
INSERT INTO `product_images` VALUES (200, 'http://pbfh6sbp9.bkt.clouddn.com/53RKr7exb33x9DhFQVz0HX7dn1jOEmRNPQBCK0pE.png', 49, '2018-10-22 08:33:43', '2018-10-22 08:33:43');
INSERT INTO `product_images` VALUES (201, 'http://pbfh6sbp9.bkt.clouddn.com/7jNtsWHIy4DGRAnLXfk6gR5A8r3x27uDHkZrMsEP.png', 49, '2018-10-22 08:33:45', '2018-10-22 08:33:45');
INSERT INTO `product_images` VALUES (202, 'http://pbfh6sbp9.bkt.clouddn.com/AojrfbEa8Uc15mC69TZWfRBoi6QyH4vSshncWfZY.png', 49, '2018-10-22 08:33:46', '2018-10-22 08:33:46');
INSERT INTO `product_images` VALUES (203, 'http://pbfh6sbp9.bkt.clouddn.com/oVxetsNSVCnKKwWMLM7dvAxL2uR7mimuHVJb3fKN.png', 50, '2018-10-22 08:36:04', '2018-10-22 08:36:04');
INSERT INTO `product_images` VALUES (204, 'http://pbfh6sbp9.bkt.clouddn.com/pKQvsZ6tM1csPvZHJSoL9Yf3JuhLOvNFbqzAArCf.png', 50, '2018-10-22 08:36:06', '2018-10-22 08:36:06');
INSERT INTO `product_images` VALUES (206, 'http://pbfh6sbp9.bkt.clouddn.com/SyGzJlvAnZnvegOQrzgAr01c4fVRAWxggirhfWIw.png', 50, '2018-10-22 08:36:10', '2018-10-22 08:36:10');
INSERT INTO `product_images` VALUES (207, 'http://pbfh6sbp9.bkt.clouddn.com/eLG84skQUYgrMnXuDdMtfMpsHs9T6RWOGS9VSozu.png', 50, '2018-10-22 08:36:10', '2018-10-22 08:36:10');
INSERT INTO `product_images` VALUES (208, 'http://pbfh6sbp9.bkt.clouddn.com/eSStwrqRHxBocQuSgUuDPJ1Z76HTySilLmtqktOS.png', 51, '2018-10-22 08:37:55', '2018-10-22 08:37:55');
INSERT INTO `product_images` VALUES (209, 'http://pbfh6sbp9.bkt.clouddn.com/pisxkOVEdWCtYDovplawCk3m5wbeagXdosILFUPi.png', 51, '2018-10-22 08:37:55', '2018-10-22 08:37:55');
INSERT INTO `product_images` VALUES (210, 'http://pbfh6sbp9.bkt.clouddn.com/VsZtH0koXAMPHNHuDdWq18kKlmME4Kw1mEkSAlwR.png', 51, '2018-10-22 08:37:55', '2018-10-22 08:37:55');
INSERT INTO `product_images` VALUES (211, 'http://pbfh6sbp9.bkt.clouddn.com/TRAQCP2YJffrCHc2FOiUzVivoZlZuNkYjlJEEvqa.png', 51, '2018-10-22 08:37:58', '2018-10-22 08:37:58');
INSERT INTO `product_images` VALUES (212, 'http://pbfh6sbp9.bkt.clouddn.com/xQI78dUHsxIgN28C0h3C8HjM5xNAcZbA7S1DLYsQ.png', 51, '2018-10-22 08:37:59', '2018-10-22 08:37:59');
INSERT INTO `product_images` VALUES (213, 'http://pbfh6sbp9.bkt.clouddn.com/XEO9sCiaNV3TeKO2EURUfs9zDsGAfrXxG5hnM7d9.png', 51, '2018-10-22 08:38:00', '2018-10-22 08:38:00');
INSERT INTO `product_images` VALUES (214, 'http://pbfh6sbp9.bkt.clouddn.com/MvQvVapGd5xKliQM3fcFijAYTyOUmugALYU4NKyr.png', 52, '2018-10-22 08:40:34', '2018-10-22 08:40:34');
INSERT INTO `product_images` VALUES (215, 'http://pbfh6sbp9.bkt.clouddn.com/rSSMPMql6nfRZFwrCA5toQbjypmrjxF2EDIGNyP2.png', 52, '2018-10-22 08:40:36', '2018-10-22 08:40:36');
INSERT INTO `product_images` VALUES (216, 'http://pbfh6sbp9.bkt.clouddn.com/FhpF0Z1ZqIi2JADgKOBuKKZFtQs6uy0S5uXZEjnh.png', 52, '2018-10-22 08:40:37', '2018-10-22 08:40:37');
INSERT INTO `product_images` VALUES (217, 'http://pbfh6sbp9.bkt.clouddn.com/5pgqEXyK4DOnVCM4GQX9bp98yGv9psuML5m2P6Bv.png', 53, '2018-10-22 08:42:44', '2018-10-22 08:42:44');
INSERT INTO `product_images` VALUES (218, 'http://pbfh6sbp9.bkt.clouddn.com/bKSH4kvN3MwLnsiKJBFFY64CbOZmsEHPtiaIp2wS.png', 53, '2018-10-22 08:42:44', '2018-10-22 08:42:44');
INSERT INTO `product_images` VALUES (219, 'http://pbfh6sbp9.bkt.clouddn.com/HsBs3kh4ztgqAsQ2kd1J63BVSXgSLivpWzNe8jPT.png', 53, '2018-10-22 08:42:57', '2018-10-22 08:42:57');
INSERT INTO `product_images` VALUES (220, 'http://pbfh6sbp9.bkt.clouddn.com/yR0OzXsbM0pgtJSEShUQbrSqVw5h6CAHRbUGOrrz.png', 53, '2018-10-22 08:42:57', '2018-10-22 08:42:57');
INSERT INTO `product_images` VALUES (221, 'http://pbfh6sbp9.bkt.clouddn.com/a0oiCPpDrlLMztyWdr6qV4WxkMjZIgXxPMmmgMkB.png', 69, '2018-10-22 08:44:38', '2018-10-22 08:44:38');
INSERT INTO `product_images` VALUES (222, 'http://pbfh6sbp9.bkt.clouddn.com/nWrXpdRy8ZLCopG5kyyRlJPvSHeFKMybXm7ApSMR.png', 69, '2018-10-22 08:44:42', '2018-10-22 08:44:42');
INSERT INTO `product_images` VALUES (223, 'http://pbfh6sbp9.bkt.clouddn.com/5YOhj5qw2mxC8WxW2BV7skotM3kYKSD90SxS9dSR.png', 69, '2018-10-22 08:44:45', '2018-10-22 08:44:45');
INSERT INTO `product_images` VALUES (224, 'http://pbfh6sbp9.bkt.clouddn.com/m3LXPWVDW6qyLYKejGyBqb0IZZdCi8t2GZt0YM6y.png', 69, '2018-10-22 08:44:51', '2018-10-22 08:44:51');
INSERT INTO `product_images` VALUES (225, 'http://pbfh6sbp9.bkt.clouddn.com/Duo1X5hKDrjx3SjCW30cr41PdTpFunze4Hy5y2Mj.png', 54, '2018-10-22 08:50:39', '2018-10-22 08:50:39');
INSERT INTO `product_images` VALUES (226, 'http://pbfh6sbp9.bkt.clouddn.com/pneeKrT8PAEh9ykHJ65DTIX5qQVxttT0ajWgBjcQ.png', 54, '2018-10-22 08:50:51', '2018-10-22 08:50:51');
INSERT INTO `product_images` VALUES (227, 'http://pbfh6sbp9.bkt.clouddn.com/BkGvD2Bb9e1L05uDG7QBGUTYafM2u4dqReL1ri7k.png', 54, '2018-10-22 08:51:01', '2018-10-22 08:51:01');
INSERT INTO `product_images` VALUES (228, 'http://pbfh6sbp9.bkt.clouddn.com/o80wBmWyspQF7mg8icybpHPguQZvgydLgv0Anaxy.png', 54, '2018-10-22 08:51:02', '2018-10-22 08:51:02');
INSERT INTO `product_images` VALUES (229, 'http://pbfh6sbp9.bkt.clouddn.com/li92aO7n6lRSRXW3a2i0DIwzMETMbi7wQwGPgXge.png', 54, '2018-10-22 08:51:02', '2018-10-22 08:51:02');
INSERT INTO `product_images` VALUES (230, 'http://pbfh6sbp9.bkt.clouddn.com/UNz3PllGuO0bV1npZtjJE2znWuRB0UubYCJPcNPW.png', 55, '2018-10-22 08:51:30', '2018-10-22 08:51:30');
INSERT INTO `product_images` VALUES (231, 'http://pbfh6sbp9.bkt.clouddn.com/nxHivw3Zg6jb1eUl7i9prU3Cio7TWHuuQwSc9ujB.png', 55, '2018-10-22 08:51:30', '2018-10-22 08:51:30');
INSERT INTO `product_images` VALUES (232, 'http://pbfh6sbp9.bkt.clouddn.com/6yJZYoECJvGd7bH9sfsvzNt1lQOQ8DiUTKnzGbGx.png', 55, '2018-10-22 08:51:37', '2018-10-22 08:51:37');
INSERT INTO `product_images` VALUES (233, 'http://pbfh6sbp9.bkt.clouddn.com/gTmKZ75A6F4fybQeWNkdsHBvKc5Ppfoi76BAfksb.png', 55, '2018-10-22 08:51:38', '2018-10-22 08:51:38');
INSERT INTO `product_images` VALUES (234, 'http://pbfh6sbp9.bkt.clouddn.com/6G71RjvFDBCqlXozG1uecmK1KeTTTXRiYUJAps8C.png', 55, '2018-10-22 08:51:40', '2018-10-22 08:51:40');
INSERT INTO `product_images` VALUES (235, 'http://pbfh6sbp9.bkt.clouddn.com/vqkZF95aaKzzqHsODzWjVtwIvVD2s2unxeNDLNHR.png', 57, '2018-10-22 08:55:17', '2018-10-22 08:55:17');
INSERT INTO `product_images` VALUES (236, 'http://pbfh6sbp9.bkt.clouddn.com/yffEvvY5GeeRT0mPJ5JMNoaIN6hMvqXNDAzoctCm.png', 57, '2018-10-22 08:55:26', '2018-10-22 08:55:26');
INSERT INTO `product_images` VALUES (237, 'http://pbfh6sbp9.bkt.clouddn.com/KsQyMUJzyr29PDtAUVTqgqDq2zIxmlUi7F4O2Il7.png', 57, '2018-10-22 08:55:27', '2018-10-22 08:55:27');
INSERT INTO `product_images` VALUES (238, 'http://pbfh6sbp9.bkt.clouddn.com/AgUmbJJKmVkR0YJL2Tl7KwQaLs71PM9YCcxnabbn.png', 57, '2018-10-22 08:55:27', '2018-10-22 08:55:27');
INSERT INTO `product_images` VALUES (239, 'http://pbfh6sbp9.bkt.clouddn.com/YTL1dKOIodIrOmNUGJOmNeRtvtRAX5pxzQLVoZof.png', 57, '2018-10-22 08:55:27', '2018-10-22 08:55:27');
INSERT INTO `product_images` VALUES (240, 'http://pbfh6sbp9.bkt.clouddn.com/3AoHUpyc33UhrmXrlMCEr2ggvMLuUNLyWoUBdsS5.png', 56, '2018-10-22 08:55:28', '2018-10-22 08:55:28');
INSERT INTO `product_images` VALUES (241, 'http://pbfh6sbp9.bkt.clouddn.com/SFIgzERmaaJJEPtLaqwQGBeyjhvUfoj50mktBnB0.png', 56, '2018-10-22 08:55:28', '2018-10-22 08:55:28');
INSERT INTO `product_images` VALUES (242, 'http://pbfh6sbp9.bkt.clouddn.com/j7YgjdCOUe6JV1ll4hM6BmtZvhjfooTi5PMDwEWm.png', 56, '2018-10-22 08:55:33', '2018-10-22 08:55:33');
INSERT INTO `product_images` VALUES (243, 'http://pbfh6sbp9.bkt.clouddn.com/wYp7d58XQueoGlHubSjjBaKmQn5bvz5S2ykSWHhC.png', 56, '2018-10-22 08:55:35', '2018-10-22 08:55:35');
INSERT INTO `product_images` VALUES (244, 'http://pbfh6sbp9.bkt.clouddn.com/nDK8X5iOHvF7WtTgtElbNMnUqWHitNp3ZRRptLV8.png', 56, '2018-10-22 08:55:39', '2018-10-22 08:55:39');
INSERT INTO `product_images` VALUES (245, 'http://pbfh6sbp9.bkt.clouddn.com/en4f2tXePeZTphsBQcAmTPpQeYei4TJt4rjOBWzG.png', 56, '2018-10-22 08:55:42', '2018-10-22 08:55:42');
INSERT INTO `product_images` VALUES (250, 'http://pbfh6sbp9.bkt.clouddn.com/y72gIXntSvvnURLZcTXeGkx9r7ohiojZjtIQcJGS.png', 58, '2018-10-22 09:01:24', '2018-10-22 09:01:24');
INSERT INTO `product_images` VALUES (251, 'http://pbfh6sbp9.bkt.clouddn.com/9XzifRncblSyc3cRrCm9FyJMpSbzIHo0qdzWP6sQ.png', 58, '2018-10-22 09:01:30', '2018-10-22 09:01:30');
INSERT INTO `product_images` VALUES (252, 'http://pbfh6sbp9.bkt.clouddn.com/mRbTNaqZf3bl00xcx1CgSYWv2i8SPy7i1KRjU33B.png', 58, '2018-10-22 09:01:30', '2018-10-22 09:01:30');
INSERT INTO `product_images` VALUES (253, 'http://pbfh6sbp9.bkt.clouddn.com/DSy4nxP3DwPeliBrlASxwauP5y11yYiqoKzvzJze.png', 71, '2018-10-22 09:01:59', '2018-10-22 09:01:59');
INSERT INTO `product_images` VALUES (254, 'http://pbfh6sbp9.bkt.clouddn.com/iwWOpWqjgyNMtWAhVQqwfGrsZm9OW0w7TRz6S9WU.png', 71, '2018-10-22 09:01:59', '2018-10-22 09:01:59');
INSERT INTO `product_images` VALUES (255, 'http://pbfh6sbp9.bkt.clouddn.com/moOSkdZlC689yUusnHr9wMRDq5bu3CEOaBofnuyh.png', 71, '2018-10-22 09:02:01', '2018-10-22 09:02:01');
INSERT INTO `product_images` VALUES (256, 'http://pbfh6sbp9.bkt.clouddn.com/VOzrLrjBceY7J5OPYt4NDgHDJFfaplqLQotpH2AF.png', 71, '2018-10-22 09:02:02', '2018-10-22 09:02:02');
INSERT INTO `product_images` VALUES (257, 'http://pbfh6sbp9.bkt.clouddn.com/TURC5d2dSQfHgLWBRIlwnLchp0p7014t4fKDmI45.png', 71, '2018-10-22 09:02:02', '2018-10-22 09:02:02');
INSERT INTO `product_images` VALUES (258, 'http://pbfh6sbp9.bkt.clouddn.com/xp8mzSeWTZ4xBjfXtzyQn472QupihjvMqWlypABf.png', 59, '2018-10-22 09:02:37', '2018-10-22 09:02:37');
INSERT INTO `product_images` VALUES (259, 'http://pbfh6sbp9.bkt.clouddn.com/7Of8MeyQTHrsKs1e9dsrADfObNHqtUsBfDYfPuCi.png', 59, '2018-10-22 09:02:43', '2018-10-22 09:02:43');
INSERT INTO `product_images` VALUES (260, 'http://pbfh6sbp9.bkt.clouddn.com/xYg7dtyohfyjXcXffnCt6UUg6pzRKua6jOeO4GLy.png', 60, '2018-10-22 09:03:45', '2018-10-22 09:03:45');
INSERT INTO `product_images` VALUES (261, 'http://pbfh6sbp9.bkt.clouddn.com/Dsvf0oxGEW80bARaE1s9mghs7TcdhZ5lgRHZQ8ke.png', 60, '2018-10-22 09:03:45', '2018-10-22 09:03:45');
INSERT INTO `product_images` VALUES (262, 'http://pbfh6sbp9.bkt.clouddn.com/UJcJeogGdF86JyWyLmwDRjIgRoYWdpxkyXNNidrh.png', 72, '2018-10-22 09:04:18', '2018-10-22 09:04:18');
INSERT INTO `product_images` VALUES (263, 'http://pbfh6sbp9.bkt.clouddn.com/3HBkQHTVRhHfKUuiDE2PhMwYllJoZxPQNFjWGGyK.png', 72, '2018-10-22 09:04:19', '2018-10-22 09:04:19');
INSERT INTO `product_images` VALUES (264, 'http://pbfh6sbp9.bkt.clouddn.com/PPXUr3SA6qyN5A53ExC4l6LKxvdkS234FjlrfCrk.png', 72, '2018-10-22 09:04:26', '2018-10-22 09:04:26');
INSERT INTO `product_images` VALUES (265, 'http://pbfh6sbp9.bkt.clouddn.com/PtJ2bSIPzHErNsKUmupvQSo4x4ga4CkNMiubrsDL.png', 72, '2018-10-22 09:04:26', '2018-10-22 09:04:26');
INSERT INTO `product_images` VALUES (266, 'http://pbfh6sbp9.bkt.clouddn.com/x3D4gQBjVNUZtsMLBoBvHDanBK6Nxj5abmtxPC2r.png', 61, '2018-10-22 09:05:16', '2018-10-22 09:05:16');
INSERT INTO `product_images` VALUES (267, 'http://pbfh6sbp9.bkt.clouddn.com/l8V49nw9vdbW0iaQM09JviIzDJx7S2yehTk0ofvw.png', 61, '2018-10-22 09:05:20', '2018-10-22 09:05:20');
INSERT INTO `product_images` VALUES (268, 'http://pbfh6sbp9.bkt.clouddn.com/gklgjc9tWNcrylTyGFcI7DzGRMFuTioeI0f7mYha.png', 61, '2018-10-22 09:05:21', '2018-10-22 09:05:21');
INSERT INTO `product_images` VALUES (269, 'http://pbfh6sbp9.bkt.clouddn.com/7dwmkNaxlI3FEer2DXo7Bk0783dsZfwflZ2NnveE.png', 62, '2018-10-22 09:06:20', '2018-10-22 09:06:20');
INSERT INTO `product_images` VALUES (270, 'http://pbfh6sbp9.bkt.clouddn.com/FV5MKEgLxpRJufiwptX1ViJ9k7ijXj4jYkrPcraF.png', 62, '2018-10-22 09:06:30', '2018-10-22 09:06:30');
INSERT INTO `product_images` VALUES (271, 'http://pbfh6sbp9.bkt.clouddn.com/80fXRINmpu89uNs0xvMUuQxjyjPpVBwfnhZt25uR.png', 63, '2018-10-22 09:07:56', '2018-10-22 09:07:56');
INSERT INTO `product_images` VALUES (272, 'http://pbfh6sbp9.bkt.clouddn.com/cTxr9witKAXxn8cVHqkeK9p8DZs692bIUSeIzYjI.png', 63, '2018-10-22 09:07:59', '2018-10-22 09:07:59');
INSERT INTO `product_images` VALUES (273, 'http://pbfh6sbp9.bkt.clouddn.com/zlXsXtAbH4ZAI4Dm7vpxulvOqKfScruMi9AY185r.png', 63, '2018-10-22 09:08:00', '2018-10-22 09:08:00');
INSERT INTO `product_images` VALUES (274, 'http://pbfh6sbp9.bkt.clouddn.com/ZKKbC3OjsoUf5DtCY5X8R7h5WZJ03ZT3nPdVeagI.png', 63, '2018-10-22 09:08:02', '2018-10-22 09:08:02');
INSERT INTO `product_images` VALUES (275, 'http://pbfh6sbp9.bkt.clouddn.com/0OPfUGFFRV9xwuCcf5e6ykIT2ukJ7ABY4td3MgN3.png', 63, '2018-10-22 09:08:08', '2018-10-22 09:08:08');
INSERT INTO `product_images` VALUES (276, 'http://pbfh6sbp9.bkt.clouddn.com/l5FDXFZ29u0SFU172poqpF4DSwZzEZ5XsF9bj56Z.png', 64, '2018-10-22 09:08:46', '2018-10-22 09:08:46');
INSERT INTO `product_images` VALUES (277, 'http://pbfh6sbp9.bkt.clouddn.com/QtMN3E2DLKZQMeqgpJuZVPKRs4HL48aYcU5fb97C.png', 64, '2018-10-22 09:08:51', '2018-10-22 09:08:51');
INSERT INTO `product_images` VALUES (278, 'http://pbfh6sbp9.bkt.clouddn.com/XLpa3YGu7ywKI8mLYH3IqiFj9P16XkIZosggqxht.png', 64, '2018-10-22 09:08:52', '2018-10-22 09:08:52');
INSERT INTO `product_images` VALUES (279, 'http://pbfh6sbp9.bkt.clouddn.com/pUdBSoejp4wEpDZZWeILCNVekOIvtochZpL9nTOo.png', 66, '2018-10-22 09:11:32', '2018-10-22 09:11:32');
INSERT INTO `product_images` VALUES (280, 'http://pbfh6sbp9.bkt.clouddn.com/YQjaSGUhcrGIPk2IOQ5xUMCWJJFAIDKHfWDgYbop.png', 66, '2018-10-22 09:11:34', '2018-10-22 09:11:34');
INSERT INTO `product_images` VALUES (281, 'http://pbfh6sbp9.bkt.clouddn.com/24iQT3EDDeQaEfEy8rqkWTO0M5LEywK51KtwU1O7.png', 66, '2018-10-22 09:11:34', '2018-10-22 09:11:34');
INSERT INTO `product_images` VALUES (282, 'http://pbfh6sbp9.bkt.clouddn.com/BoHLAHoBU4pfCHiHiJFxSz9i4dxn6gvA4hiXhxt1.png', 65, '2018-10-22 09:12:00', '2018-10-22 09:12:00');
INSERT INTO `product_images` VALUES (283, 'http://pbfh6sbp9.bkt.clouddn.com/sFss1wYDsFxEcaiyEkvazVw6klppfwsxmmWcPHTi.png', 65, '2018-10-22 09:12:00', '2018-10-22 09:12:00');
INSERT INTO `product_images` VALUES (284, 'http://pbfh6sbp9.bkt.clouddn.com/hIfLZl3D6pv4mCeEMQWXRYFcYJAUYggr6r5KJXag.png', 65, '2018-10-22 09:12:01', '2018-10-22 09:12:01');
INSERT INTO `product_images` VALUES (285, 'http://pbfh6sbp9.bkt.clouddn.com/tTJOJ5T1Fed4M5QQotyc6ENLz3ka3J56rs1l5xoQ.png', 65, '2018-10-22 09:12:04', '2018-10-22 09:12:04');
INSERT INTO `product_images` VALUES (286, 'http://pbfh6sbp9.bkt.clouddn.com/fZpSgLmsPD6r70QGWRE6f6z4cuI4TAf13AFM5n9v.png', 65, '2018-10-22 09:12:10', '2018-10-22 09:12:10');
INSERT INTO `product_images` VALUES (287, 'http://pbfh6sbp9.bkt.clouddn.com/RXODJGHZhqYA60kYrwkr5pAQ33WDkGVfx4mmbRF2.png', 73, '2018-10-22 09:13:38', '2018-10-22 09:13:38');
INSERT INTO `product_images` VALUES (288, 'http://pbfh6sbp9.bkt.clouddn.com/2rFFqrHo9GjRwdX3HDYXy818ovaBurwmkI94Ik7g.png', 73, '2018-10-22 09:13:38', '2018-10-22 09:13:38');
INSERT INTO `product_images` VALUES (289, 'http://pbfh6sbp9.bkt.clouddn.com/jviCZ5NtQCFmh7TctNvbZfQYgbbgyoZPVjTy9aDO.png', 73, '2018-10-22 09:13:39', '2018-10-22 09:13:39');
INSERT INTO `product_images` VALUES (290, 'http://pbfh6sbp9.bkt.clouddn.com/Kf2wlPxoXJoeKYVEv5yhnyIhyIhe6Nt0e0AAysEn.png', 73, '2018-10-22 09:13:39', '2018-10-22 09:13:39');
INSERT INTO `product_images` VALUES (291, 'http://pbfh6sbp9.bkt.clouddn.com/RRcs63us84eHAiE45mCORsiamEFUeiJxe3lhI7Y2.png', 73, '2018-10-22 09:13:39', '2018-10-22 09:13:39');
INSERT INTO `product_images` VALUES (292, 'http://pbfh6sbp9.bkt.clouddn.com/ZZ80dYdhTqatq3uc8NAkeVRPNhwhE7Nd6Hvtgahq.png', 73, '2018-10-22 09:13:40', '2018-10-22 09:13:40');
INSERT INTO `product_images` VALUES (293, 'http://pbfh6sbp9.bkt.clouddn.com/Kr5nLtkXysRKUokHdSRBlxIuPBZgPBqUqGakH8kB.png', 73, '2018-10-22 09:13:44', '2018-10-22 09:13:44');
INSERT INTO `product_images` VALUES (294, 'http://pbfh6sbp9.bkt.clouddn.com/h08lyVv6D871xIpY3Q9c9HnSpfklDUvd1efbkgux.png', 73, '2018-10-22 09:13:49', '2018-10-22 09:13:49');
INSERT INTO `product_images` VALUES (295, 'http://pbfh6sbp9.bkt.clouddn.com/iaeDwZFykcUeIZEaZKcXHNIeuL7OIcqgMDVtvjMF.png', 74, '2018-10-22 09:14:29', '2018-10-22 09:14:29');
INSERT INTO `product_images` VALUES (296, 'http://pbfh6sbp9.bkt.clouddn.com/K67gUwf5Ilbc2FnNedV03Skx6xfZjZWukqOfHjPq.png', 74, '2018-10-22 09:14:29', '2018-10-22 09:14:29');
INSERT INTO `product_images` VALUES (297, 'http://pbfh6sbp9.bkt.clouddn.com/Gx02oAgErWkdbSuhXeYY7QCv9673ABwvKDFiSHGw.png', 74, '2018-10-22 09:14:30', '2018-10-22 09:14:30');
INSERT INTO `product_images` VALUES (298, 'http://pbfh6sbp9.bkt.clouddn.com/PpbtnSgNHEGTv4ezLGsQspqS8CBUogEZ8HCTtiFq.png', 74, '2018-10-22 09:14:31', '2018-10-22 09:14:31');
INSERT INTO `product_images` VALUES (299, 'http://pbfh6sbp9.bkt.clouddn.com/056Wii2vIsr93Xt6VT8kLH0IgI0ctk9RaKKXQFpJ.png', 67, '2018-10-22 09:15:25', '2018-10-22 09:15:25');
INSERT INTO `product_images` VALUES (300, 'http://pbfh6sbp9.bkt.clouddn.com/qsZPdgC5cpb8UyycAWeppymofs0B9OWxZI6m38x9.png', 67, '2018-10-22 09:15:38', '2018-10-22 09:15:38');
INSERT INTO `product_images` VALUES (301, 'http://pbfh6sbp9.bkt.clouddn.com/I38uqpX8X0TigMhZtnbzOO4sVVqbnXG6pHR7t40K.png', 67, '2018-10-22 09:16:05', '2018-10-22 09:16:05');
INSERT INTO `product_images` VALUES (302, 'http://pbfh6sbp9.bkt.clouddn.com/SSDnMPODF0uhPsGjkBlepeH8WYju5SZwqkDNTeEM.png', 68, '2018-10-22 09:16:05', '2018-10-22 09:16:05');
INSERT INTO `product_images` VALUES (303, 'http://pbfh6sbp9.bkt.clouddn.com/MAkC60CyIBzUvlleOwUzRAmHkHd4pXMbwCq8Cj51.png', 67, '2018-10-22 09:16:05', '2018-10-22 09:16:05');
INSERT INTO `product_images` VALUES (304, 'http://pbfh6sbp9.bkt.clouddn.com/4BM5cSB7myfXV9CSL8WhALWylmxcyidwNK7xdK2i.png', 68, '2018-10-22 09:16:11', '2018-10-22 09:16:11');
INSERT INTO `product_images` VALUES (305, 'http://pbfh6sbp9.bkt.clouddn.com/KGReYOqEtO5D8xe1KSMbCqcIZTTp9Iyzqg2y6LE3.png', 68, '2018-10-22 09:16:11', '2018-10-22 09:16:11');
INSERT INTO `product_images` VALUES (306, 'http://pbfh6sbp9.bkt.clouddn.com/dF8o7lnX1PtzaKuNdJnkAyWcDFH6FA1vGTRSvFmN.png', 68, '2018-10-22 09:16:12', '2018-10-22 09:16:12');
INSERT INTO `product_images` VALUES (307, 'http://pbfh6sbp9.bkt.clouddn.com/irgjHXOfutmdmjtNffvRkJWjaVObZf3IUfGbYBGV.png', 68, '2018-10-22 09:16:15', '2018-10-22 09:16:15');
INSERT INTO `product_images` VALUES (308, 'http://pbfh6sbp9.bkt.clouddn.com/lup3aSfDCEx4T7r8NnN8DOq80Mb0qiGV0IcmRkHN.png', 75, '2018-10-22 09:17:00', '2018-10-22 09:17:00');
INSERT INTO `product_images` VALUES (309, 'http://pbfh6sbp9.bkt.clouddn.com/Lm5KEGb08yWH4Xv4SRhhiPeOKO4PALMLLgfu7lhC.png', 75, '2018-10-22 09:17:00', '2018-10-22 09:17:00');
INSERT INTO `product_images` VALUES (310, 'http://pbfh6sbp9.bkt.clouddn.com/azcEfX6wznAHy5r6Lg4EEo9A4DobKjs4yA6XU0Mn.png', 75, '2018-10-22 09:17:00', '2018-10-22 09:17:00');
INSERT INTO `product_images` VALUES (311, 'http://pbfh6sbp9.bkt.clouddn.com/ibApSt1Aw5dLcyCqzwW07hVJ2QIDFFO6hlygCovp.png', 75, '2018-10-22 09:17:03', '2018-10-22 09:17:03');
INSERT INTO `product_images` VALUES (312, 'http://pbfh6sbp9.bkt.clouddn.com/Grm81nWGFGh95xfQV69ARgiyja6iVNmxQRRzlpCW.png', NULL, '2018-10-22 09:18:10', '2018-10-22 09:18:10');
INSERT INTO `product_images` VALUES (313, 'http://pbfh6sbp9.bkt.clouddn.com/XhV4xmJlAmUa4khSuUMoYPdL2iEj4kkyaBuZSmP0.png', NULL, '2018-10-22 09:18:13', '2018-10-22 09:18:13');
INSERT INTO `product_images` VALUES (314, 'http://pbfh6sbp9.bkt.clouddn.com/u1LkjDMAUQdMybmmjxNmKwcSdl0FCyRrqwrf85CM.png', NULL, '2018-10-22 09:18:15', '2018-10-22 09:18:15');
INSERT INTO `product_images` VALUES (315, 'http://pbfh6sbp9.bkt.clouddn.com/dfHuTRe0xBNYmCZ8NjQec9c40tZ5f9QTzbNYeBSx.png', 78, '2018-10-22 09:21:23', '2018-10-22 09:21:23');
INSERT INTO `product_images` VALUES (316, 'http://pbfh6sbp9.bkt.clouddn.com/ExiGPsrYUrua0GzcDuQJyiqRSfhj2yooBQ9JyCgH.png', 78, '2018-10-22 09:21:43', '2018-10-22 09:21:43');
INSERT INTO `product_images` VALUES (317, 'http://pbfh6sbp9.bkt.clouddn.com/Pml81wlNTCr0Jjk7WEIPVLTFa1qyZshMT1H1Eo9u.png', 78, '2018-10-22 09:21:43', '2018-10-22 09:21:43');
INSERT INTO `product_images` VALUES (318, 'http://pbfh6sbp9.bkt.clouddn.com/51Re8WCLLCW7hYVTxcm2Yyp31AhvQWJ3Ke0EDBsg.png', 78, '2018-10-22 09:21:43', '2018-10-22 09:21:43');
INSERT INTO `product_images` VALUES (319, 'http://pbfh6sbp9.bkt.clouddn.com/hX7REqMTx70MEB4IzY4QKQa5wVeCA55PT2mLUFPj.png', 78, '2018-10-22 09:21:44', '2018-10-22 09:21:44');
INSERT INTO `product_images` VALUES (320, 'http://pbfh6sbp9.bkt.clouddn.com/5ime5d85zPgxYT0zBQR7aRSxbm5EpYxnqxHT1DP7.png', 78, '2018-10-22 09:21:45', '2018-10-22 09:21:45');
INSERT INTO `product_images` VALUES (321, 'http://pbfh6sbp9.bkt.clouddn.com/lAR5Hk8bLp0ioK7MCTAlkPtSg55krbu3gP8wNPTb.png', 77, '2018-10-22 09:23:30', '2018-10-22 09:23:30');
INSERT INTO `product_images` VALUES (322, 'http://pbfh6sbp9.bkt.clouddn.com/IqIeK6eME4IHweHzMVzCkWTTyjnMWck4l9FlwDt3.png', 77, '2018-10-22 09:23:47', '2018-10-22 09:23:47');
INSERT INTO `product_images` VALUES (323, 'http://pbfh6sbp9.bkt.clouddn.com/3vWmHpdAdGI1KpHGlU1XgO7bxzuFNCWgSqCDHjgM.png', 77, '2018-10-22 09:23:52', '2018-10-22 09:23:52');
INSERT INTO `product_images` VALUES (324, 'http://pbfh6sbp9.bkt.clouddn.com/GxusFCVNYZIrLJ3w86ir0KPSrwFlcyvB8rk7jHgm.png', 77, '2018-10-22 09:23:53', '2018-10-22 09:23:53');
INSERT INTO `product_images` VALUES (325, 'http://pbfh6sbp9.bkt.clouddn.com/zObVtVGPrEW1F7bs2gkEQ2vQA6nEHJz0Tb3pIdfF.png', 77, '2018-10-22 09:23:53', '2018-10-22 09:23:53');
INSERT INTO `product_images` VALUES (326, 'http://pbfh6sbp9.bkt.clouddn.com/WjyFDfdGyvFtYWsmo89ggYacxZ81QDByKzumn9z8.png', 77, '2018-10-22 09:23:54', '2018-10-22 09:23:54');
INSERT INTO `product_images` VALUES (327, 'http://pbfh6sbp9.bkt.clouddn.com/eSAL6RKLb4smMXIjnJz80SxaTGG7bOGk8O2gfHZp.png', 76, '2018-10-22 09:24:16', '2018-10-22 09:24:16');
INSERT INTO `product_images` VALUES (328, 'http://pbfh6sbp9.bkt.clouddn.com/lscjvjdDZKbpmQQRJ8H0iMWgD4OdbpPJ8slfNwRM.png', 76, '2018-10-22 09:24:20', '2018-10-22 09:24:20');
INSERT INTO `product_images` VALUES (329, 'http://pbfh6sbp9.bkt.clouddn.com/yyZ7MnVV0sEj4VR0TfaZqfxK4EiYWlQPUhLOvSRU.png', 76, '2018-10-22 09:24:29', '2018-10-22 09:24:29');
INSERT INTO `product_images` VALUES (330, 'http://pbfh6sbp9.bkt.clouddn.com/1aZ3GS2IPh7qsY0uMq9Yh237mYGvTroygOL4y0to.png', 76, '2018-10-22 09:24:30', '2018-10-22 09:24:30');
INSERT INTO `product_images` VALUES (331, 'http://pbfh6sbp9.bkt.clouddn.com/uwAwSGXJC6MWeiGr4dpUhzfE0yNtolCkqF84swjn.png', 76, '2018-10-22 09:24:33', '2018-10-22 09:24:33');
INSERT INTO `product_images` VALUES (332, 'http://pbfh6sbp9.bkt.clouddn.com/rAhSIGgE14LT20HQStQc60WA4MgUD3vNCcc41ChZ.png', 76, '2018-10-22 09:24:34', '2018-10-22 09:24:34');
INSERT INTO `product_images` VALUES (333, 'http://pbfh6sbp9.bkt.clouddn.com/j29xNgp1LNf0qKH7IY4WHwREloDvjs7FXldSkmzF.png', 80, '2018-10-22 09:29:17', '2018-10-22 09:29:17');
INSERT INTO `product_images` VALUES (334, 'http://pbfh6sbp9.bkt.clouddn.com/eHLYTpBAdZZDFaIG2hOEKKtwwytKcybr6OI9EFeh.png', 80, '2018-10-22 09:29:36', '2018-10-22 09:29:36');
INSERT INTO `product_images` VALUES (335, 'http://pbfh6sbp9.bkt.clouddn.com/poxtSNhXTs1DSjkxmaog49l7rYY95LiaPf6uhYI0.png', 80, '2018-10-22 09:29:36', '2018-10-22 09:29:36');
INSERT INTO `product_images` VALUES (336, 'http://pbfh6sbp9.bkt.clouddn.com/dEnV6X6DfdCioSFBGgNP5gKlZbTqpePpgSPS76n7.png', 80, '2018-10-22 09:29:36', '2018-10-22 09:29:36');
INSERT INTO `product_images` VALUES (337, 'http://pbfh6sbp9.bkt.clouddn.com/y9v2UmZybPqnJMlfMLZJ2GAwNyZGG4K94IJMYg8Q.png', 80, '2018-10-22 09:29:39', '2018-10-22 09:29:39');
INSERT INTO `product_images` VALUES (338, 'http://pbfh6sbp9.bkt.clouddn.com/awCBcN5LxUBPxAFQEpWtgY1KWIfAtFa87uc86BKj.png', 80, '2018-10-22 09:29:43', '2018-10-22 09:29:43');
INSERT INTO `product_images` VALUES (339, 'http://pbfh6sbp9.bkt.clouddn.com/3Oemaxm96WwtEsccWAknY8s8KvQT5jtSn4YuAb47.png', 80, '2018-10-22 09:29:45', '2018-10-22 09:29:45');
INSERT INTO `product_images` VALUES (340, 'http://pbfh6sbp9.bkt.clouddn.com/R0m4EJINmZsySQfg2yQDlgkZG7aiQObLiRARuU84.png', 80, '2018-10-22 09:29:45', '2018-10-22 09:29:45');
INSERT INTO `product_images` VALUES (341, 'http://pbfh6sbp9.bkt.clouddn.com/hevFJPjBFT4XjDtG1G4W6c0XkOYH4wjCqz7E3a0t.png', 79, '2018-10-22 09:30:04', '2018-10-22 09:30:04');
INSERT INTO `product_images` VALUES (342, 'http://pbfh6sbp9.bkt.clouddn.com/LKy2pgkozZeNYmLtumbS82D1Av5Nf9UX8USy039p.png', 79, '2018-10-22 09:30:14', '2018-10-22 09:30:14');
INSERT INTO `product_images` VALUES (343, 'http://pbfh6sbp9.bkt.clouddn.com/5jkqlcCaSfWRi8XXWcAuQrmmhgCXLNYUlXdMty3a.png', 79, '2018-10-22 09:30:14', '2018-10-22 09:30:14');
INSERT INTO `product_images` VALUES (344, 'http://pbfh6sbp9.bkt.clouddn.com/HczvrVLKya90wn4vv0QSc5s277d5TegNwfVEKUBL.png', 79, '2018-10-22 09:30:15', '2018-10-22 09:30:15');
INSERT INTO `product_images` VALUES (345, 'http://pbfh6sbp9.bkt.clouddn.com/C7gJm9upWF6Vq4BxTK6QiwVqrUNZDbqr2nko4RCk.png', 79, '2018-10-22 09:30:15', '2018-10-22 09:30:15');
INSERT INTO `product_images` VALUES (346, 'http://pbfh6sbp9.bkt.clouddn.com/rwwZftvlI6El8r5NPTsyaQbCHuRfDsMMecEklLcS.png', 79, '2018-10-22 09:30:15', '2018-10-22 09:30:15');
INSERT INTO `product_images` VALUES (347, 'http://pbfh6sbp9.bkt.clouddn.com/tynjVys439CwAoASrxftTBMdE9GXgODHR3TGzNJF.png', 79, '2018-10-22 09:30:16', '2018-10-22 09:30:16');
INSERT INTO `product_images` VALUES (348, 'http://pbfh6sbp9.bkt.clouddn.com/c0HCtWVjc3V1ZnOl1x1U2nkmACKljO7moaUi7hIF.png', 81, '2018-10-22 09:32:42', '2018-10-22 09:32:42');
INSERT INTO `product_images` VALUES (349, 'http://pbfh6sbp9.bkt.clouddn.com/qyo9DoPQ812dACPB3mxnU3xvZ3QPe6JN5SuPGDhj.png', 81, '2018-10-22 09:32:45', '2018-10-22 09:32:45');
INSERT INTO `product_images` VALUES (350, 'http://pbfh6sbp9.bkt.clouddn.com/3SVEoKhqAmwbOadtBWpwi9myez0Pao88Y7SJbrB2.png', 81, '2018-10-22 09:32:48', '2018-10-22 09:32:48');
INSERT INTO `product_images` VALUES (351, 'http://pbfh6sbp9.bkt.clouddn.com/gRmr7Gr8to7O1qdaVF9W2OpgnALzTdp9wEaQmwzR.png', 81, '2018-10-22 09:32:49', '2018-10-22 09:32:49');
INSERT INTO `product_images` VALUES (352, 'http://pbfh6sbp9.bkt.clouddn.com/aZ0u9ul2xFXbWmeRmrB4dfaSCrIDo6anuYqm6wu3.png', 83, '2018-10-22 09:37:10', '2018-10-22 09:37:10');
INSERT INTO `product_images` VALUES (353, 'http://pbfh6sbp9.bkt.clouddn.com/R4UpUEpfDnxQjAjhvmlCZ8MhuG2oZ4u6oanJvIDy.png', 83, '2018-10-22 09:37:16', '2018-10-22 09:37:16');
INSERT INTO `product_images` VALUES (354, 'http://pbfh6sbp9.bkt.clouddn.com/NPYuRJJVxISeyQ6Mk0DjyG3Yc38QGnfQrW9NYQHF.png', 83, '2018-10-22 09:37:17', '2018-10-22 09:37:17');
INSERT INTO `product_images` VALUES (355, 'http://pbfh6sbp9.bkt.clouddn.com/n4jQFXL23JLwwTJTgSGTONFKVbtz7dLe4bSOhFbj.png', 83, '2018-10-22 09:37:20', '2018-10-22 09:37:20');
INSERT INTO `product_images` VALUES (356, 'http://pbfh6sbp9.bkt.clouddn.com/nEpzMmtxFUrqOVHw6cSeSG6IdUKZdYwmvFxJgBqW.png', 83, '2018-10-22 09:37:21', '2018-10-22 09:37:21');
INSERT INTO `product_images` VALUES (357, 'http://pbfh6sbp9.bkt.clouddn.com/Y1rE1dXlD9qibobi0rgm4pzvoqFlhUgA1WtOy0bY.png', 82, '2018-10-22 09:37:39', '2018-10-22 09:37:39');
INSERT INTO `product_images` VALUES (358, 'http://pbfh6sbp9.bkt.clouddn.com/xdXvH7X3GmypK1KkpFRhuMUY3j5zQM54eMGLM6U1.png', 82, '2018-10-22 09:38:01', '2018-10-22 09:38:01');
INSERT INTO `product_images` VALUES (359, 'http://pbfh6sbp9.bkt.clouddn.com/Pc02GFZKLFZWXaT3umPWSC40MD9wF6IqrKGvJ5FU.png', 82, '2018-10-22 09:38:03', '2018-10-22 09:38:03');
INSERT INTO `product_images` VALUES (360, 'http://pbfh6sbp9.bkt.clouddn.com/fEkiKKSXUUMGFgl2DNePgaOfY8ZojBGERKxFNNlj.png', 82, '2018-10-22 09:38:04', '2018-10-22 09:38:04');
INSERT INTO `product_images` VALUES (361, 'http://pbfh6sbp9.bkt.clouddn.com/HBDdmvNULQHXWXvYRfOoe6DhnPLZHD18wUO4mzBx.png', 84, '2018-10-22 09:39:25', '2018-10-22 09:39:25');
INSERT INTO `product_images` VALUES (362, 'http://pbfh6sbp9.bkt.clouddn.com/Cs6PAkcz0yocS5lOrti3oEHEFbuMhixTGksd5kna.png', 84, '2018-10-22 09:39:25', '2018-10-22 09:39:25');
INSERT INTO `product_images` VALUES (363, 'http://pbfh6sbp9.bkt.clouddn.com/x3oTOctQBMRBkiNU2mTRLy6SL1jVTcFdZQE2pIkF.png', 84, '2018-10-22 09:39:26', '2018-10-22 09:39:26');
INSERT INTO `product_images` VALUES (364, 'http://pbfh6sbp9.bkt.clouddn.com/eqKW4DSN6dI8wUiVOUHUsuB6wlcVfX4eNgIhfAie.png', 84, '2018-10-22 09:39:27', '2018-10-22 09:39:27');
INSERT INTO `product_images` VALUES (365, 'http://pbfh6sbp9.bkt.clouddn.com/5ro6F3aZhqoKgTmzg7jyEsNFcKXmaJoxWS94g1YC.png', 84, '2018-10-22 09:39:30', '2018-10-22 09:39:30');
INSERT INTO `product_images` VALUES (366, 'http://pbfh6sbp9.bkt.clouddn.com/JftRgoUC9xbpvsYXwLsoH3H3gxzxSEaBN1G5pKcM.png', 84, '2018-10-22 09:39:31', '2018-10-22 09:39:31');
INSERT INTO `product_images` VALUES (367, 'http://pbfh6sbp9.bkt.clouddn.com/oPCmyjxMdr6NLNEgSThBenQAhYs9rmFqzgZXKCTq.png', 84, '2018-10-22 09:39:35', '2018-10-22 09:39:35');
INSERT INTO `product_images` VALUES (368, 'http://pbfh6sbp9.bkt.clouddn.com/N1DDLzadLCVhCHhVxRU55nV9nePXf4Y1gLQLhtqJ.png', 85, '2018-10-22 09:42:28', '2018-10-22 09:42:28');
INSERT INTO `product_images` VALUES (369, 'http://pbfh6sbp9.bkt.clouddn.com/RWMtnvW0WdPLdhZja9A0zjcssMuQbhy26VZDzjr6.png', 85, '2018-10-22 09:42:28', '2018-10-22 09:42:28');
INSERT INTO `product_images` VALUES (370, 'http://pbfh6sbp9.bkt.clouddn.com/4oA2useNi5e4kubADshsuDQqlsbOxqVFfrp3mboO.png', 85, '2018-10-22 09:42:28', '2018-10-22 09:42:28');
INSERT INTO `product_images` VALUES (371, 'http://pbfh6sbp9.bkt.clouddn.com/tnzYm0UeRJxg9feZbljbLZc4VEAT9d9NcqXuMF9F.png', 85, '2018-10-22 09:42:29', '2018-10-22 09:42:29');
INSERT INTO `product_images` VALUES (372, 'http://pbfh6sbp9.bkt.clouddn.com/0uio2tEYCQGYtJza7ZH25vVt8ayjn3sBxlyniMJO.png', 85, '2018-10-22 09:42:30', '2018-10-22 09:42:30');
INSERT INTO `product_images` VALUES (373, 'http://pbfh6sbp9.bkt.clouddn.com/bFYbz7d0mEryVlZKb2mGE4wfXzmZczZTEdakl2Iu.png', 85, '2018-10-22 09:42:31', '2018-10-22 09:42:31');
INSERT INTO `product_images` VALUES (374, 'http://pbfh6sbp9.bkt.clouddn.com/G2HeD8NQzo9gV01Y0t4imHPql3Dir7PLVhkygga4.png', 85, '2018-10-22 09:42:31', '2018-10-22 09:42:31');
INSERT INTO `product_images` VALUES (375, 'http://pbfh6sbp9.bkt.clouddn.com/fZM4qPFYYEsDyrW8j69xBSQNZABXF1n9RQPyvtot.png', 85, '2018-10-22 09:42:43', '2018-10-22 09:42:43');
INSERT INTO `product_images` VALUES (376, 'http://pbfh6sbp9.bkt.clouddn.com/DciDQss81X1HhmPGjEM3HRyFF7ehzSobDkneDrWt.png', 85, '2018-10-22 09:42:50', '2018-10-22 09:42:50');
INSERT INTO `product_images` VALUES (377, 'http://pbfh6sbp9.bkt.clouddn.com/Q3GxltiPBG2wHg5AGVTgPtzKNGFDwhFMPzrOPRNi.png', 85, '2018-10-22 09:43:02', '2018-10-22 09:43:02');
INSERT INTO `product_images` VALUES (378, 'http://pbfh6sbp9.bkt.clouddn.com/r5C9TpsmYhQ6QQKSuzewbTYLvUtKZ8igIvUh0gw0.png', 87, '2018-10-22 09:43:52', '2018-10-22 09:43:52');
INSERT INTO `product_images` VALUES (379, 'http://pbfh6sbp9.bkt.clouddn.com/mP7lXtC98cTro2mF3ykPd2088bLx2DvZXeUfbMXY.png', 87, '2018-10-22 09:43:52', '2018-10-22 09:43:52');
INSERT INTO `product_images` VALUES (380, 'http://pbfh6sbp9.bkt.clouddn.com/1F54Xym43MaLXS3yNI0zJtGVzLr35CwOouqv3W7d.png', 87, '2018-10-22 09:43:53', '2018-10-22 09:43:53');
INSERT INTO `product_images` VALUES (381, 'http://pbfh6sbp9.bkt.clouddn.com/MIEiNWMtrroJeXDbao2YBM8iuI46cDch6rhfeGhr.png', 87, '2018-10-22 09:43:53', '2018-10-22 09:43:53');
INSERT INTO `product_images` VALUES (382, 'http://pbfh6sbp9.bkt.clouddn.com/5tsHdMFNKLSSV9HjRCBATnJK42p0K1p6DJmTiZiu.png', 87, '2018-10-22 09:43:55', '2018-10-22 09:43:55');
INSERT INTO `product_images` VALUES (383, 'http://pbfh6sbp9.bkt.clouddn.com/rBg0IsaZuH9WhGYK5AI92ZKfGlQPV3aQldCVqr0n.png', 87, '2018-10-22 09:43:55', '2018-10-22 09:43:55');
INSERT INTO `product_images` VALUES (384, 'http://pbfh6sbp9.bkt.clouddn.com/iN4oRFwVvzTa66ttZ3UNLRH0Hcz0scNW3EAGQYZz.png', 87, '2018-10-22 09:44:08', '2018-10-22 09:44:08');
INSERT INTO `product_images` VALUES (385, 'http://pbfh6sbp9.bkt.clouddn.com/TDlkkxKn72Kv2vpfWbp1U7C9SZhQkDZMZHoYWomk.png', 86, '2018-10-22 09:50:15', '2018-10-22 09:50:15');
INSERT INTO `product_images` VALUES (386, 'http://pbfh6sbp9.bkt.clouddn.com/n0vgB95xW1WXvw6G53UZfgwcgaGEALzupDAJkmqG.png', 86, '2018-10-22 09:50:18', '2018-10-22 09:50:18');
INSERT INTO `product_images` VALUES (387, 'http://pbfh6sbp9.bkt.clouddn.com/sICRYLHqsHXw9r0EqtZYkzWHpWLr6w6VU9oh4GjQ.png', 86, '2018-10-22 09:50:19', '2018-10-22 09:50:19');
INSERT INTO `product_images` VALUES (388, 'http://pbfh6sbp9.bkt.clouddn.com/hL0hNdC2HioAOL58DTfIGXWhQ67ms2xJ9kwKWnHg.png', 86, '2018-10-22 09:50:20', '2018-10-22 09:50:20');
INSERT INTO `product_images` VALUES (389, 'http://pbfh6sbp9.bkt.clouddn.com/ZEkmatnoNsfQHmucPCYhyt7a6XAiqHmVLubDBLqA.png', 88, '2018-10-22 09:52:30', '2018-10-22 09:52:30');
INSERT INTO `product_images` VALUES (390, 'http://pbfh6sbp9.bkt.clouddn.com/cL4jWUjay3d8V1r3Ygi41Myb3POhfk0PaZoMpqMe.png', 88, '2018-10-22 09:52:55', '2018-10-22 09:52:55');
INSERT INTO `product_images` VALUES (391, 'http://pbfh6sbp9.bkt.clouddn.com/r5u869hd0xeWzWcFmmZJzipeMh5YGNKeEMsqagem.png', 88, '2018-10-22 09:53:00', '2018-10-22 09:53:00');
INSERT INTO `product_images` VALUES (392, 'http://pbfh6sbp9.bkt.clouddn.com/LFhv0Ma3Tnzm117lKSa5isnSjmnHiXLyD6VIR4bD.png', 88, '2018-10-22 09:53:02', '2018-10-22 09:53:02');
INSERT INTO `product_images` VALUES (393, 'http://pbfh6sbp9.bkt.clouddn.com/QCW2k59Qe59fu6Ho9OTPAAO0UwWu2X8iw2ZOYcxJ.png', 88, '2018-10-22 09:53:03', '2018-10-22 09:53:03');
INSERT INTO `product_images` VALUES (394, 'http://pbfh6sbp9.bkt.clouddn.com/WgOieeeNIwDG6KA2nmXAO6PKPVVBpFsqUAVlH8FL.png', 88, '2018-10-22 09:53:05', '2018-10-22 09:53:05');
INSERT INTO `product_images` VALUES (395, 'http://pbfh6sbp9.bkt.clouddn.com/ehSFrk272wncdwhe7BQ12DKsoM2cQTNacfDntf4r.png', 70, '2018-10-22 10:06:46', '2018-10-22 10:06:46');
INSERT INTO `product_images` VALUES (396, 'http://pbfh6sbp9.bkt.clouddn.com/i7E3QEF4do0DRVhh5koVc6JFUq3s2eNbuLdINo7t.png', 70, '2018-10-22 10:06:46', '2018-10-22 10:06:46');
INSERT INTO `product_images` VALUES (397, 'http://pbfh6sbp9.bkt.clouddn.com/7muEHHwq9ztF8TysHZG6cLa6Sxxlr8K6lGOYh9h7.png', 70, '2018-10-22 10:06:48', '2018-10-22 10:06:48');
INSERT INTO `product_images` VALUES (398, 'http://pbfh6sbp9.bkt.clouddn.com/xla8VjBEhErLRWLymmDFxPh5hHGhYoakyYErLEMh.png', 70, '2018-10-22 10:06:51', '2018-10-22 10:06:51');
INSERT INTO `product_images` VALUES (399, 'http://pbfh6sbp9.bkt.clouddn.com/0kMiWLo2QYiKVIQzKrH3yTJvwMQmpi9jQWittUH6.png', 70, '2018-10-22 10:06:55', '2018-10-22 10:06:55');
INSERT INTO `product_images` VALUES (400, 'http://pbfh6sbp9.bkt.clouddn.com/2sJP7ySxUWkr53JYHfAQxgHo2IutwQM6wJoeFHOP.png', 70, '2018-10-22 10:06:56', '2018-10-22 10:06:56');
INSERT INTO `product_images` VALUES (401, 'http://pbfh6sbp9.bkt.clouddn.com/ciFmikiAIAkGTfdH93mwMj4XGkj8MlCyREIUtVlb.png', 90, '2018-10-24 03:41:16', '2018-10-24 03:41:16');
INSERT INTO `product_images` VALUES (402, 'http://pbfh6sbp9.bkt.clouddn.com/mn7bgCuTvpExxjaLdmJao2sKESA67VrZJ4Zfwz5e.png', 90, '2018-10-24 03:41:18', '2018-10-24 03:41:18');
INSERT INTO `product_images` VALUES (403, 'http://pbfh6sbp9.bkt.clouddn.com/832AlOBT8F1aw92pgy9PY2XERw7f0i0roNWekEHD.png', 90, '2018-10-24 03:41:27', '2018-10-24 03:41:27');
INSERT INTO `product_images` VALUES (404, 'http://pbfh6sbp9.bkt.clouddn.com/LKIKj4S62wZT19XWnCbVdbCMr5R42Lh7UNekSKdO.png', 90, '2018-10-24 03:41:28', '2018-10-24 03:41:28');
INSERT INTO `product_images` VALUES (405, 'http://pbfh6sbp9.bkt.clouddn.com/o00oSDFrYD4jRs5YkxPGRBLeinNGn9CxAuTGdzD5.png', 90, '2018-10-24 03:41:33', '2018-10-24 03:41:33');
INSERT INTO `product_images` VALUES (406, 'http://pbfh6sbp9.bkt.clouddn.com/GSEATQVznmYUFUJdrecz9sriJvXC3AjP1CRCk8ag.png', 90, '2018-10-24 03:41:36', '2018-10-24 03:41:36');
COMMIT;

-- ----------------------------
-- Table structure for product_option_translations
-- ----------------------------
DROP TABLE IF EXISTS `product_option_translations`;
CREATE TABLE `product_option_translations` (
  `translatable_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_tl` (`translatable_id`,`locale_code`),
  KEY `product_option_translations_translatable_id_index` (`translatable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_option_translations
-- ----------------------------
BEGIN;
INSERT INTO `product_option_translations` VALUES (1, 'Color', 'en-US', '2018-10-19 06:57:20', '2018-10-19 07:30:52', 1);
INSERT INTO `product_option_translations` VALUES (2, 'Suite', 'en-US', '2018-10-19 08:59:11', '2018-10-19 09:01:43', 2);
INSERT INTO `product_option_translations` VALUES (3, '厚度', 'en-US', '2018-10-20 08:02:57', '2018-10-20 08:07:51', 3);
INSERT INTO `product_option_translations` VALUES (4, 'Model', 'en-US', '2018-10-20 10:00:54', '2018-10-20 10:00:54', 4);
INSERT INTO `product_option_translations` VALUES (5, 'Size', 'en-US', '2018-10-22 03:30:31', '2018-10-22 03:30:31', 5);
INSERT INTO `product_option_translations` VALUES (6, 'Width', 'en-US', '2018-10-22 03:31:12', '2018-10-22 03:31:12', 6);
INSERT INTO `product_option_translations` VALUES (7, 'Style', 'en-US', '2018-10-22 03:31:14', '2018-10-22 03:31:14', 7);
INSERT INTO `product_option_translations` VALUES (8, 'Appearance of size', 'en-US', '2018-10-22 03:31:33', '2018-10-22 03:31:33', 8);
INSERT INTO `product_option_translations` VALUES (9, 'Specifications', 'en-US', '2018-10-22 03:31:49', '2018-10-22 03:31:49', 9);
INSERT INTO `product_option_translations` VALUES (10, 'The shape of', 'en-US', '2018-10-22 08:26:58', '2018-10-22 08:26:58', 10);
INSERT INTO `product_option_translations` VALUES (11, 'Produced', 'en-US', '2018-10-24 18:03:24', '2018-10-24 18:03:24', 11);
INSERT INTO `product_option_translations` VALUES (11, '生产地', 'zh_CN', '2018-10-24 18:03:24', '2018-10-24 18:05:22', 12);
COMMIT;

-- ----------------------------
-- Table structure for product_option_value_translations
-- ----------------------------
DROP TABLE IF EXISTS `product_option_value_translations`;
CREATE TABLE `product_option_value_translations` (
  `translatable_id` int(10) unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_tl` (`translatable_id`,`locale_code`),
  KEY `product_option_value_translations_translatable_id_index` (`translatable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_option_value_translations
-- ----------------------------
BEGIN;
INSERT INTO `product_option_value_translations` VALUES (1, 'Red', 'en-US', '2018-10-19 07:01:38', '2018-10-19 07:30:52', 1);
INSERT INTO `product_option_value_translations` VALUES (2, 'White', 'en-US', '2018-10-19 07:02:26', '2018-10-19 07:30:52', 2);
INSERT INTO `product_option_value_translations` VALUES (3, 'Pink', 'en-US', '2018-10-19 07:03:35', '2018-10-19 07:30:52', 3);
INSERT INTO `product_option_value_translations` VALUES (4, 'Yellow', 'en-US', '2018-10-19 07:03:35', '2018-10-19 07:30:52', 4);
INSERT INTO `product_option_value_translations` VALUES (5, 'black', 'en-US', '2018-10-19 07:30:52', '2018-10-19 07:30:52', 5);
INSERT INTO `product_option_value_translations` VALUES (6, 'bilateral', 'en-US', '2018-10-19 08:59:46', '2018-10-19 09:01:43', 6);
INSERT INTO `product_option_value_translations` VALUES (7, '10mm', 'en-US', '2018-10-20 08:06:35', '2018-10-20 08:07:51', 7);
INSERT INTO `product_option_value_translations` VALUES (8, '20mm', 'en-US', '2018-10-20 08:07:51', '2018-10-20 08:07:51', 8);
INSERT INTO `product_option_value_translations` VALUES (9, 'Blue', 'en-US', '2018-10-20 10:00:49', '2018-10-20 10:00:49', 9);
INSERT INTO `product_option_value_translations` VALUES (10, 'Orange', 'en-US', '2018-10-20 10:00:50', '2018-10-20 10:00:50', 10);
INSERT INTO `product_option_value_translations` VALUES (11, 'Silver', 'en-US', '2018-10-20 10:00:52', '2018-10-20 10:00:52', 11);
INSERT INTO `product_option_value_translations` VALUES (12, 'Apple', 'en-US', '2018-10-20 10:00:54', '2018-10-20 10:00:54', 12);
INSERT INTO `product_option_value_translations` VALUES (13, 'Type C', 'en-US', '2018-10-20 10:00:54', '2018-10-20 10:00:54', 13);
INSERT INTO `product_option_value_translations` VALUES (14, 'Green', 'en-US', '2018-10-20 10:00:59', '2018-10-20 10:00:59', 14);
INSERT INTO `product_option_value_translations` VALUES (15, 'Gray', 'en-US', '2018-10-20 10:01:00', '2018-10-20 10:01:00', 15);
INSERT INTO `product_option_value_translations` VALUES (16, 'Gray space', 'en-US', '2018-10-20 10:01:05', '2018-10-20 10:01:05', 16);
INSERT INTO `product_option_value_translations` VALUES (17, 'Sapphire blue', 'en-US', '2018-10-20 10:01:05', '2018-10-20 10:01:05', 17);
INSERT INTO `product_option_value_translations` VALUES (18, 'Rose gold', 'en-US', '2018-10-20 10:01:05', '2018-10-20 10:01:05', 18);
INSERT INTO `product_option_value_translations` VALUES (19, 'Brown', 'en-US', '2018-10-22 03:30:04', '2018-10-22 03:30:04', 19);
INSERT INTO `product_option_value_translations` VALUES (20, 'Pale pinkish grey', 'en-US', '2018-10-22 03:30:13', '2018-10-22 03:30:13', 20);
INSERT INTO `product_option_value_translations` VALUES (21, 'Grass green', 'en-US', '2018-10-22 03:30:14', '2018-10-22 03:30:14', 21);
INSERT INTO `product_option_value_translations` VALUES (22, 'Mei red', 'en-US', '2018-10-22 03:30:22', '2018-10-22 03:30:22', 22);
INSERT INTO `product_option_value_translations` VALUES (23, 'Purple', 'en-US', '2018-10-22 03:30:23', '2018-10-22 03:30:23', 23);
INSERT INTO `product_option_value_translations` VALUES (24, 'Golden', 'en-US', '2018-10-22 03:30:23', '2018-10-22 03:30:23', 24);
INSERT INTO `product_option_value_translations` VALUES (25, '38', 'en-US', '2018-10-22 03:30:31', '2018-10-22 03:30:31', 25);
INSERT INTO `product_option_value_translations` VALUES (26, '39 40', 'en-US', '2018-10-22 03:30:31', '2018-10-22 03:30:31', 26);
INSERT INTO `product_option_value_translations` VALUES (27, '41 42', 'en-US', '2018-10-22 03:30:31', '2018-10-22 03:30:31', 27);
INSERT INTO `product_option_value_translations` VALUES (28, '43 44', 'en-US', '2018-10-22 03:30:31', '2018-10-22 03:30:31', 28);
INSERT INTO `product_option_value_translations` VALUES (29, '45 46', 'en-US', '2018-10-22 03:30:31', '2018-10-22 03:30:31', 29);
INSERT INTO `product_option_value_translations` VALUES (30, '33 34', 'en-US', '2018-10-22 03:30:38', '2018-10-22 03:30:38', 30);
INSERT INTO `product_option_value_translations` VALUES (31, '35 36', 'en-US', '2018-10-22 03:30:38', '2018-10-22 03:30:38', 31);
INSERT INTO `product_option_value_translations` VALUES (32, '37 38', 'en-US', '2018-10-22 03:30:38', '2018-10-22 03:30:38', 32);
INSERT INTO `product_option_value_translations` VALUES (33, '47 48', 'en-US', '2018-10-22 03:30:38', '2018-10-22 03:30:38', 33);
INSERT INTO `product_option_value_translations` VALUES (34, 'Light green', 'en-US', '2018-10-22 03:30:45', '2018-10-22 03:30:45', 34);
INSERT INTO `product_option_value_translations` VALUES (35, 'Light blue', 'en-US', '2018-10-22 03:30:45', '2018-10-22 03:30:45', 35);
INSERT INTO `product_option_value_translations` VALUES (36, 'Light pink', 'en-US', '2018-10-22 03:30:45', '2018-10-22 03:30:45', 36);
INSERT INTO `product_option_value_translations` VALUES (37, 'S', 'en-US', '2018-10-22 03:30:45', '2018-10-22 03:30:45', 37);
INSERT INTO `product_option_value_translations` VALUES (38, 'M', 'en-US', '2018-10-22 03:30:45', '2018-10-22 03:30:45', 38);
INSERT INTO `product_option_value_translations` VALUES (39, 'L', 'en-US', '2018-10-22 03:30:45', '2018-10-22 03:30:45', 39);
INSERT INTO `product_option_value_translations` VALUES (40, 'XL', 'en-US', '2018-10-22 03:30:45', '2018-10-22 03:30:45', 40);
INSERT INTO `product_option_value_translations` VALUES (41, 'XXL', 'en-US', '2018-10-22 03:30:51', '2018-10-22 03:30:51', 41);
INSERT INTO `product_option_value_translations` VALUES (42, 'XXXL', 'en-US', '2018-10-22 03:30:51', '2018-10-22 03:30:51', 42);
INSERT INTO `product_option_value_translations` VALUES (43, 'Coffee', 'en-US', '2018-10-22 03:30:54', '2018-10-22 03:30:54', 43);
INSERT INTO `product_option_value_translations` VALUES (44, '4', 'en-US', '2018-10-22 03:30:55', '2018-10-22 03:30:55', 44);
INSERT INTO `product_option_value_translations` VALUES (45, '6', 'en-US', '2018-10-22 03:30:55', '2018-10-22 03:30:55', 45);
INSERT INTO `product_option_value_translations` VALUES (46, '8', 'en-US', '2018-10-22 03:30:55', '2018-10-22 03:30:55', 46);
INSERT INTO `product_option_value_translations` VALUES (47, '10', 'en-US', '2018-10-22 03:30:55', '2018-10-22 03:30:55', 47);
INSERT INTO `product_option_value_translations` VALUES (48, '12', 'en-US', '2018-10-22 03:30:55', '2018-10-22 03:30:55', 48);
INSERT INTO `product_option_value_translations` VALUES (49, 'Sbelow 100 kg', 'en-US', '2018-10-22 03:30:58', '2018-10-22 03:30:58', 49);
INSERT INTO `product_option_value_translations` VALUES (50, 'M 100 120 jins', 'en-US', '2018-10-22 03:30:58', '2018-10-22 03:30:58', 50);
INSERT INTO `product_option_value_translations` VALUES (51, 'L 120 140 jins', 'en-US', '2018-10-22 03:30:59', '2018-10-22 03:30:59', 51);
INSERT INTO `product_option_value_translations` VALUES (52, 'Xl 140 160 kg', 'en-US', '2018-10-22 03:30:59', '2018-10-22 03:30:59', 52);
INSERT INTO `product_option_value_translations` VALUES (53, 'Xxl 160 180 kg', 'en-US', '2018-10-22 03:30:59', '2018-10-22 03:30:59', 53);
INSERT INTO `product_option_value_translations` VALUES (54, 'Xxxl 180 200 kg', 'en-US', '2018-10-22 03:30:59', '2018-10-22 03:30:59', 54);
INSERT INTO `product_option_value_translations` VALUES (55, '4 xl 200 220 jins', 'en-US', '2018-10-22 03:31:00', '2018-10-22 03:31:00', 55);
INSERT INTO `product_option_value_translations` VALUES (56, '15m 5ft bedding covers', 'en-US', '2018-10-22 03:31:04', '2018-10-22 03:31:04', 56);
INSERT INTO `product_option_value_translations` VALUES (57, '150cm×200cm', 'en-US', '2018-10-22 03:31:12', '2018-10-22 03:31:12', 57);
INSERT INTO `product_option_value_translations` VALUES (58, 'The sheets', 'en-US', '2018-10-22 03:31:15', '2018-10-22 03:31:15', 58);
INSERT INTO `product_option_value_translations` VALUES (59, 'The fitted', 'en-US', '2018-10-22 03:31:15', '2018-10-22 03:31:15', 59);
INSERT INTO `product_option_value_translations` VALUES (60, '1.5m', 'en-US', '2018-10-22 03:31:15', '2018-10-22 03:31:15', 60);
INSERT INTO `product_option_value_translations` VALUES (61, '1.8m', 'en-US', '2018-10-22 03:31:15', '2018-10-22 03:31:15', 61);
INSERT INTO `product_option_value_translations` VALUES (62, '120x230cmsuitable for 10m wide', 'en-US', '2018-10-22 03:31:18', '2018-10-22 03:31:18', 62);
INSERT INTO `product_option_value_translations` VALUES (63, '160x230cm suitable for 12m wide', 'en-US', '2018-10-22 03:31:18', '2018-10-22 03:31:18', 63);
INSERT INTO `product_option_value_translations` VALUES (64, '180x230cm suitable for 135m wide', 'en-US', '2018-10-22 03:31:19', '2018-10-22 03:31:19', 64);
INSERT INTO `product_option_value_translations` VALUES (65, '200x230cm suitable for 15m wide', 'en-US', '2018-10-22 03:31:19', '2018-10-22 03:31:19', 65);
INSERT INTO `product_option_value_translations` VALUES (66, '230x250cm suitable for 18m wide', 'en-US', '2018-10-22 03:31:19', '2018-10-22 03:31:19', 66);
INSERT INTO `product_option_value_translations` VALUES (67, '250x250cm suitable for a 2 meter wide bed', 'en-US', '2018-10-22 03:31:19', '2018-10-22 03:31:19', 67);
INSERT INTO `product_option_value_translations` VALUES (68, 'Pink black', 'en-US', '2018-10-22 03:31:21', '2018-10-22 03:31:21', 68);
INSERT INTO `product_option_value_translations` VALUES (69, 'Small 322418cm', 'en-US', '2018-10-22 03:31:29', '2018-10-22 03:31:29', 69);
INSERT INTO `product_option_value_translations` VALUES (70, 'Medium 372726cm', 'en-US', '2018-10-22 03:31:30', '2018-10-22 03:31:30', 70);
INSERT INTO `product_option_value_translations` VALUES (71, 'Large size 442930cm', 'en-US', '2018-10-22 03:31:30', '2018-10-22 03:31:30', 71);
INSERT INTO `product_option_value_translations` VALUES (72, 'Extra large size 50 35 31 cm', 'en-US', '2018-10-22 03:31:30', '2018-10-22 03:31:30', 72);
INSERT INTO `product_option_value_translations` VALUES (73, 'Oversized 58 40 35 cm', 'en-US', '2018-10-22 03:31:30', '2018-10-22 03:31:30', 73);
INSERT INTO `product_option_value_translations` VALUES (74, 'Middle band cover', 'en-US', '2018-10-22 03:31:33', '2018-10-22 03:31:33', 74);
INSERT INTO `product_option_value_translations` VALUES (75, 'Transparent', 'en-US', '2018-10-22 03:31:35', '2018-10-22 03:31:35', 75);
INSERT INTO `product_option_value_translations` VALUES (76, 'Female', 'en-US', '2018-10-22 03:31:37', '2018-10-22 03:31:37', 76);
INSERT INTO `product_option_value_translations` VALUES (77, 'Male money', 'en-US', '2018-10-22 03:31:37', '2018-10-22 03:31:37', 77);
INSERT INTO `product_option_value_translations` VALUES (78, 'Xl underpants 4 pairs 2 boxes', 'en-US', '2018-10-22 03:31:39', '2018-10-22 03:31:39', 78);
INSERT INTO `product_option_value_translations` VALUES (79, 'Underwear xxl4 pairs 2 boxes', 'en-US', '2018-10-22 03:31:39', '2018-10-22 03:31:39', 79);
INSERT INTO `product_option_value_translations` VALUES (80, 'Underwear xxxl4 pairs 2 boxes', 'en-US', '2018-10-22 03:31:39', '2018-10-22 03:31:39', 80);
INSERT INTO `product_option_value_translations` VALUES (81, 'Xl underpants 4 pairs 7 boxes', 'en-US', '2018-10-22 03:31:39', '2018-10-22 03:31:39', 81);
INSERT INTO `product_option_value_translations` VALUES (82, 'Underwear xxl4 x 7 boxes', 'en-US', '2018-10-22 03:31:40', '2018-10-22 03:31:40', 82);
INSERT INTO `product_option_value_translations` VALUES (83, 'Underwear xxxl4 pieces 7 boxes', 'en-US', '2018-10-22 03:31:40', '2018-10-22 03:31:40', 83);
INSERT INTO `product_option_value_translations` VALUES (84, 'Normal 75 105 cm', 'en-US', '2018-10-22 03:31:49', '2018-10-22 03:31:49', 84);
INSERT INTO `product_option_value_translations` VALUES (85, 'Extended edition 120 150 cm', 'en-US', '2018-10-22 03:31:50', '2018-10-22 03:31:50', 85);
INSERT INTO `product_option_value_translations` VALUES (86, 'Beige', 'en-US', '2018-10-22 08:24:57', '2018-10-22 08:24:57', 86);
INSERT INTO `product_option_value_translations` VALUES (87, 'Pure color cowboy', 'en-US', '2018-10-22 08:25:00', '2018-10-22 08:25:00', 87);
INSERT INTO `product_option_value_translations` VALUES (88, 'Pinstripe', 'en-US', '2018-10-22 08:25:00', '2018-10-22 08:25:00', 88);
INSERT INTO `product_option_value_translations` VALUES (89, 'Bluish gray streak', 'en-US', '2018-10-22 08:25:01', '2018-10-22 08:25:01', 89);
INSERT INTO `product_option_value_translations` VALUES (90, 'Light grey coarse streak', 'en-US', '2018-10-22 08:25:01', '2018-10-22 08:25:01', 90);
INSERT INTO `product_option_value_translations` VALUES (91, 'EC1 A', 'en-US', '2018-10-22 08:25:08', '2018-10-22 08:25:08', 91);
INSERT INTO `product_option_value_translations` VALUES (92, 'EC2 A', 'en-US', '2018-10-22 08:25:08', '2018-10-22 08:25:08', 92);
INSERT INTO `product_option_value_translations` VALUES (93, '250*210mm', 'en-US', '2018-10-22 08:25:11', '2018-10-22 08:25:11', 93);
INSERT INTO `product_option_value_translations` VALUES (94, '290*240mm', 'en-US', '2018-10-22 08:25:11', '2018-10-22 08:25:11', 94);
INSERT INTO `product_option_value_translations` VALUES (95, '320*270mm', 'en-US', '2018-10-22 08:25:11', '2018-10-22 08:25:11', 95);
INSERT INTO `product_option_value_translations` VALUES (96, '320*285mm', 'en-US', '2018-10-22 08:25:12', '2018-10-22 08:25:12', 96);
INSERT INTO `product_option_value_translations` VALUES (97, 'XS', 'en-US', '2018-10-22 08:26:31', '2018-10-22 08:26:31', 97);
INSERT INTO `product_option_value_translations` VALUES (98, 'S no', 'en-US', '2018-10-22 08:26:34', '2018-10-22 08:26:34', 98);
INSERT INTO `product_option_value_translations` VALUES (99, '67 x40CM', 'en-US', '2018-10-22 08:26:36', '2018-10-22 08:26:36', 99);
INSERT INTO `product_option_value_translations` VALUES (100, 'Esthers seven piece suit', 'en-US', '2018-10-22 08:26:44', '2018-10-22 08:26:44', 100);
INSERT INTO `product_option_value_translations` VALUES (101, '7 piece black blade sleeve', 'en-US', '2018-10-22 08:26:44', '2018-10-22 08:26:44', 101);
INSERT INTO `product_option_value_translations` VALUES (102, 'Nude', 'en-US', '2018-10-22 08:26:46', '2018-10-22 08:26:46', 102);
INSERT INTO `product_option_value_translations` VALUES (103, 'Black with white', 'en-US', '2018-10-22 08:26:48', '2018-10-22 08:26:48', 103);
INSERT INTO `product_option_value_translations` VALUES (104, 'Lime powder', 'en-US', '2018-10-22 08:26:48', '2018-10-22 08:26:48', 104);
INSERT INTO `product_option_value_translations` VALUES (105, 'Wooden lubricious', 'en-US', '2018-10-22 08:26:56', '2018-10-22 08:26:56', 105);
INSERT INTO `product_option_value_translations` VALUES (106, 'Utan wood round plate full wood trumpet', 'en-US', '2018-10-22 08:26:58', '2018-10-22 08:26:58', 106);
INSERT INTO `product_option_value_translations` VALUES (107, 'Wutan wood round plate wood medium', 'en-US', '2018-10-22 08:26:58', '2018-10-22 08:26:58', 107);
INSERT INTO `product_option_value_translations` VALUES (108, 'Wutan wood round plate large size', 'en-US', '2018-10-22 08:26:59', '2018-10-22 08:26:59', 108);
INSERT INTO `product_option_value_translations` VALUES (109, 'Cyan', 'en-US', '2018-10-22 08:27:11', '2018-10-22 08:27:11', 109);
INSERT INTO `product_option_value_translations` VALUES (110, 'Grapefruit color', 'en-US', '2018-10-22 08:27:11', '2018-10-22 08:27:11', 110);
COMMIT;

-- ----------------------------
-- Table structure for product_option_values
-- ----------------------------
DROP TABLE IF EXISTS `product_option_values`;
CREATE TABLE `product_option_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_option_values_code_unique` (`code`),
  KEY `product_option_values_option_id_index` (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_option_values
-- ----------------------------
BEGIN;
INSERT INTO `product_option_values` VALUES (1, 1, 'red', '2018-10-19 07:01:38', '2018-10-19 07:01:38');
INSERT INTO `product_option_values` VALUES (2, 1, 'white', '2018-10-19 07:02:26', '2018-10-19 07:02:26');
INSERT INTO `product_option_values` VALUES (3, 1, 'pink', '2018-10-19 07:03:35', '2018-10-19 07:03:35');
INSERT INTO `product_option_values` VALUES (4, 1, 'yellow', '2018-10-19 07:03:35', '2018-10-19 07:03:35');
INSERT INTO `product_option_values` VALUES (5, 1, 'black', '2018-10-19 07:30:52', '2018-10-19 07:30:52');
INSERT INTO `product_option_values` VALUES (6, 2, 'bilateral', '2018-10-19 08:59:46', '2018-10-19 08:59:46');
INSERT INTO `product_option_values` VALUES (7, 3, '10mm', '2018-10-20 08:06:35', '2018-10-20 08:06:35');
INSERT INTO `product_option_values` VALUES (8, 3, '20mm', '2018-10-20 08:07:51', '2018-10-20 08:07:51');
INSERT INTO `product_option_values` VALUES (9, 1, 'blue', '2018-10-20 10:00:49', '2018-10-20 10:00:49');
INSERT INTO `product_option_values` VALUES (10, 1, 'orange', '2018-10-20 10:00:50', '2018-10-20 10:00:50');
INSERT INTO `product_option_values` VALUES (11, 1, 'silver', '2018-10-20 10:00:52', '2018-10-20 10:00:52');
INSERT INTO `product_option_values` VALUES (12, 4, 'apple', '2018-10-20 10:00:54', '2018-10-20 10:00:54');
INSERT INTO `product_option_values` VALUES (13, 4, 'Type-C', '2018-10-20 10:00:54', '2018-10-20 10:00:54');
INSERT INTO `product_option_values` VALUES (14, 1, 'green', '2018-10-20 10:00:59', '2018-10-20 10:00:59');
INSERT INTO `product_option_values` VALUES (15, 1, 'gray', '2018-10-20 10:01:00', '2018-10-20 10:01:00');
INSERT INTO `product_option_values` VALUES (16, 1, 'gray-space', '2018-10-20 10:01:05', '2018-10-20 10:01:05');
INSERT INTO `product_option_values` VALUES (17, 1, 'sapphire-blue', '2018-10-20 10:01:05', '2018-10-20 10:01:05');
INSERT INTO `product_option_values` VALUES (18, 1, 'rose-gold', '2018-10-20 10:01:05', '2018-10-20 10:01:05');
INSERT INTO `product_option_values` VALUES (19, 1, 'brown', '2018-10-22 03:30:04', '2018-10-22 03:30:04');
INSERT INTO `product_option_values` VALUES (20, 1, 'pale-pinkish-grey', '2018-10-22 03:30:13', '2018-10-22 03:30:13');
INSERT INTO `product_option_values` VALUES (21, 1, 'grass-green', '2018-10-22 03:30:14', '2018-10-22 03:30:14');
INSERT INTO `product_option_values` VALUES (22, 1, 'mei-red', '2018-10-22 03:30:22', '2018-10-22 03:30:22');
INSERT INTO `product_option_values` VALUES (23, 1, 'purple', '2018-10-22 03:30:23', '2018-10-22 03:30:23');
INSERT INTO `product_option_values` VALUES (24, 1, 'golden', '2018-10-22 03:30:23', '2018-10-22 03:30:23');
INSERT INTO `product_option_values` VALUES (25, 5, '38', '2018-10-22 03:30:31', '2018-10-22 03:30:31');
INSERT INTO `product_option_values` VALUES (26, 5, '39-40', '2018-10-22 03:30:31', '2018-10-22 03:30:31');
INSERT INTO `product_option_values` VALUES (27, 5, '41-42', '2018-10-22 03:30:31', '2018-10-22 03:30:31');
INSERT INTO `product_option_values` VALUES (28, 5, '43-44', '2018-10-22 03:30:31', '2018-10-22 03:30:31');
INSERT INTO `product_option_values` VALUES (29, 5, '45-46', '2018-10-22 03:30:31', '2018-10-22 03:30:31');
INSERT INTO `product_option_values` VALUES (30, 5, '33-34', '2018-10-22 03:30:38', '2018-10-22 03:30:38');
INSERT INTO `product_option_values` VALUES (31, 5, '35-36', '2018-10-22 03:30:38', '2018-10-22 03:30:38');
INSERT INTO `product_option_values` VALUES (32, 5, '37-38', '2018-10-22 03:30:38', '2018-10-22 03:30:38');
INSERT INTO `product_option_values` VALUES (33, 5, '47-48', '2018-10-22 03:30:38', '2018-10-22 03:30:38');
INSERT INTO `product_option_values` VALUES (34, 1, 'light-green', '2018-10-22 03:30:45', '2018-10-22 03:30:45');
INSERT INTO `product_option_values` VALUES (35, 1, 'light-blue', '2018-10-22 03:30:45', '2018-10-22 03:30:45');
INSERT INTO `product_option_values` VALUES (36, 1, 'light-pink', '2018-10-22 03:30:45', '2018-10-22 03:30:45');
INSERT INTO `product_option_values` VALUES (37, 5, 'S', '2018-10-22 03:30:45', '2018-10-22 03:30:45');
INSERT INTO `product_option_values` VALUES (38, 5, 'M', '2018-10-22 03:30:45', '2018-10-22 03:30:45');
INSERT INTO `product_option_values` VALUES (39, 5, 'L', '2018-10-22 03:30:45', '2018-10-22 03:30:45');
INSERT INTO `product_option_values` VALUES (40, 5, 'XL', '2018-10-22 03:30:45', '2018-10-22 03:30:45');
INSERT INTO `product_option_values` VALUES (41, 5, 'XXL', '2018-10-22 03:30:51', '2018-10-22 03:30:51');
INSERT INTO `product_option_values` VALUES (42, 5, 'XXXL', '2018-10-22 03:30:51', '2018-10-22 03:30:51');
INSERT INTO `product_option_values` VALUES (43, 1, 'coffee', '2018-10-22 03:30:54', '2018-10-22 03:30:54');
INSERT INTO `product_option_values` VALUES (44, 5, '4', '2018-10-22 03:30:55', '2018-10-22 03:30:55');
INSERT INTO `product_option_values` VALUES (45, 5, '6', '2018-10-22 03:30:55', '2018-10-22 03:30:55');
INSERT INTO `product_option_values` VALUES (46, 5, '8', '2018-10-22 03:30:55', '2018-10-22 03:30:55');
INSERT INTO `product_option_values` VALUES (47, 5, '10', '2018-10-22 03:30:55', '2018-10-22 03:30:55');
INSERT INTO `product_option_values` VALUES (48, 5, '12', '2018-10-22 03:30:55', '2018-10-22 03:30:55');
INSERT INTO `product_option_values` VALUES (49, 5, 'sbelow-100-kg', '2018-10-22 03:30:58', '2018-10-22 03:30:58');
INSERT INTO `product_option_values` VALUES (50, 5, 'm-100-120-jins', '2018-10-22 03:30:58', '2018-10-22 03:30:58');
INSERT INTO `product_option_values` VALUES (51, 5, 'l-120-140-jins', '2018-10-22 03:30:59', '2018-10-22 03:30:59');
INSERT INTO `product_option_values` VALUES (52, 5, 'xl-140-160-kg', '2018-10-22 03:30:59', '2018-10-22 03:30:59');
INSERT INTO `product_option_values` VALUES (53, 5, 'xxl-160-180-kg', '2018-10-22 03:30:59', '2018-10-22 03:30:59');
INSERT INTO `product_option_values` VALUES (54, 5, 'xxxl-180-200-kg', '2018-10-22 03:30:59', '2018-10-22 03:30:59');
INSERT INTO `product_option_values` VALUES (55, 5, '4-xl-200-220-jins', '2018-10-22 03:31:00', '2018-10-22 03:31:00');
INSERT INTO `product_option_values` VALUES (56, 5, '15m-5ft-bedding-covers', '2018-10-22 03:31:04', '2018-10-22 03:31:04');
INSERT INTO `product_option_values` VALUES (57, 6, '150cm×200cm', '2018-10-22 03:31:12', '2018-10-22 03:31:12');
INSERT INTO `product_option_values` VALUES (58, 7, 'the-sheets', '2018-10-22 03:31:15', '2018-10-22 03:31:15');
INSERT INTO `product_option_values` VALUES (59, 7, 'the-fitted', '2018-10-22 03:31:15', '2018-10-22 03:31:15');
INSERT INTO `product_option_values` VALUES (60, 5, '1.5m', '2018-10-22 03:31:15', '2018-10-22 03:31:15');
INSERT INTO `product_option_values` VALUES (61, 5, '1.8m', '2018-10-22 03:31:15', '2018-10-22 03:31:15');
INSERT INTO `product_option_values` VALUES (62, 5, '120x230cmsuitable-for-10m-wide', '2018-10-22 03:31:18', '2018-10-22 03:31:18');
INSERT INTO `product_option_values` VALUES (63, 5, '160x230cm-suitable-for-12m-wide', '2018-10-22 03:31:18', '2018-10-22 03:31:18');
INSERT INTO `product_option_values` VALUES (64, 5, '180x230cm-suitable-for-135m-wide', '2018-10-22 03:31:19', '2018-10-22 03:31:19');
INSERT INTO `product_option_values` VALUES (65, 5, '200x230cm-suitable-for-15m-wide', '2018-10-22 03:31:19', '2018-10-22 03:31:19');
INSERT INTO `product_option_values` VALUES (66, 5, '230x250cm-suitable-for-18m-wide', '2018-10-22 03:31:19', '2018-10-22 03:31:19');
INSERT INTO `product_option_values` VALUES (67, 5, '250x250cm-suitable-for-a-2-meter-wide-bed', '2018-10-22 03:31:19', '2018-10-22 03:31:19');
INSERT INTO `product_option_values` VALUES (68, 1, 'pink-black', '2018-10-22 03:31:21', '2018-10-22 03:31:21');
INSERT INTO `product_option_values` VALUES (69, 5, 'small-322418cm', '2018-10-22 03:31:29', '2018-10-22 03:31:29');
INSERT INTO `product_option_values` VALUES (70, 5, 'medium-372726cm', '2018-10-22 03:31:30', '2018-10-22 03:31:30');
INSERT INTO `product_option_values` VALUES (71, 5, 'large-size-442930cm', '2018-10-22 03:31:30', '2018-10-22 03:31:30');
INSERT INTO `product_option_values` VALUES (72, 5, 'extra-large-size-50-35-31-cm', '2018-10-22 03:31:30', '2018-10-22 03:31:30');
INSERT INTO `product_option_values` VALUES (73, 5, 'oversized-58-40-35-cm', '2018-10-22 03:31:30', '2018-10-22 03:31:30');
INSERT INTO `product_option_values` VALUES (74, 8, 'middle-band-cover', '2018-10-22 03:31:33', '2018-10-22 03:31:33');
INSERT INTO `product_option_values` VALUES (75, 1, 'transparent', '2018-10-22 03:31:35', '2018-10-22 03:31:35');
INSERT INTO `product_option_values` VALUES (76, 7, 'female', '2018-10-22 03:31:37', '2018-10-22 03:31:37');
INSERT INTO `product_option_values` VALUES (77, 7, 'male-money', '2018-10-22 03:31:37', '2018-10-22 03:31:37');
INSERT INTO `product_option_values` VALUES (78, 5, 'xl-underpants-4-pairs-2-boxes', '2018-10-22 03:31:39', '2018-10-22 03:31:39');
INSERT INTO `product_option_values` VALUES (79, 5, 'underwear-xxl4-pairs-2-boxes', '2018-10-22 03:31:39', '2018-10-22 03:31:39');
INSERT INTO `product_option_values` VALUES (80, 5, 'underwear-xxxl4-pairs-2-boxes', '2018-10-22 03:31:39', '2018-10-22 03:31:39');
INSERT INTO `product_option_values` VALUES (81, 5, 'xl-underpants-4-pairs-7-boxes', '2018-10-22 03:31:39', '2018-10-22 03:31:39');
INSERT INTO `product_option_values` VALUES (82, 5, 'underwear-xxl4-x-7-boxes', '2018-10-22 03:31:40', '2018-10-22 03:31:40');
INSERT INTO `product_option_values` VALUES (83, 5, 'underwear-xxxl4-pieces-7-boxes', '2018-10-22 03:31:40', '2018-10-22 03:31:40');
INSERT INTO `product_option_values` VALUES (84, 9, 'normal-75-105-cm', '2018-10-22 03:31:49', '2018-10-22 03:31:49');
INSERT INTO `product_option_values` VALUES (85, 9, 'extended-edition-120-150-cm', '2018-10-22 03:31:50', '2018-10-22 03:31:50');
INSERT INTO `product_option_values` VALUES (86, 1, 'beige', '2018-10-22 08:24:57', '2018-10-22 08:24:57');
INSERT INTO `product_option_values` VALUES (87, 1, 'pure-color-cowboy', '2018-10-22 08:25:00', '2018-10-22 08:25:00');
INSERT INTO `product_option_values` VALUES (88, 1, 'pinstripe', '2018-10-22 08:25:00', '2018-10-22 08:25:00');
INSERT INTO `product_option_values` VALUES (89, 1, 'bluish-gray-streak', '2018-10-22 08:25:01', '2018-10-22 08:25:01');
INSERT INTO `product_option_values` VALUES (90, 1, 'light-grey-coarse-streak', '2018-10-22 08:25:01', '2018-10-22 08:25:01');
INSERT INTO `product_option_values` VALUES (91, 4, 'EC1-A', '2018-10-22 08:25:08', '2018-10-22 08:25:08');
INSERT INTO `product_option_values` VALUES (92, 4, 'EC2-A', '2018-10-22 08:25:08', '2018-10-22 08:25:08');
INSERT INTO `product_option_values` VALUES (93, 5, '250*210mm', '2018-10-22 08:25:11', '2018-10-22 08:25:11');
INSERT INTO `product_option_values` VALUES (94, 5, '290*240mm', '2018-10-22 08:25:11', '2018-10-22 08:25:11');
INSERT INTO `product_option_values` VALUES (95, 5, '320*270mm', '2018-10-22 08:25:11', '2018-10-22 08:25:11');
INSERT INTO `product_option_values` VALUES (96, 5, '320*285mm', '2018-10-22 08:25:12', '2018-10-22 08:25:12');
INSERT INTO `product_option_values` VALUES (97, 5, 'XS', '2018-10-22 08:26:31', '2018-10-22 08:26:31');
INSERT INTO `product_option_values` VALUES (98, 5, 's-no', '2018-10-22 08:26:34', '2018-10-22 08:26:34');
INSERT INTO `product_option_values` VALUES (99, 9, '67 x40CM', '2018-10-22 08:26:36', '2018-10-22 08:26:36');
INSERT INTO `product_option_values` VALUES (100, 9, 'esthers-seven-piece-suit', '2018-10-22 08:26:44', '2018-10-22 08:26:44');
INSERT INTO `product_option_values` VALUES (101, 9, '7-piece-black-blade-sleeve', '2018-10-22 08:26:44', '2018-10-22 08:26:44');
INSERT INTO `product_option_values` VALUES (102, 1, 'nude', '2018-10-22 08:26:46', '2018-10-22 08:26:46');
INSERT INTO `product_option_values` VALUES (103, 7, 'black-with-white', '2018-10-22 08:26:48', '2018-10-22 08:26:48');
INSERT INTO `product_option_values` VALUES (104, 7, 'lime-powder', '2018-10-22 08:26:48', '2018-10-22 08:26:48');
INSERT INTO `product_option_values` VALUES (105, 1, 'wooden-lubricious', '2018-10-22 08:26:56', '2018-10-22 08:26:56');
INSERT INTO `product_option_values` VALUES (106, 10, 'utan-wood-round-plate-full-wood-trumpet', '2018-10-22 08:26:58', '2018-10-22 08:26:58');
INSERT INTO `product_option_values` VALUES (107, 10, 'wutan-wood-round-plate-wood-medium', '2018-10-22 08:26:58', '2018-10-22 08:26:58');
INSERT INTO `product_option_values` VALUES (108, 10, 'wutan-wood-round-plate-large-size', '2018-10-22 08:26:59', '2018-10-22 08:26:59');
INSERT INTO `product_option_values` VALUES (109, 1, 'cyan', '2018-10-22 08:27:11', '2018-10-22 08:27:11');
INSERT INTO `product_option_values` VALUES (110, 1, 'grapefruit-color', '2018-10-22 08:27:11', '2018-10-22 08:27:11');
COMMIT;

-- ----------------------------
-- Table structure for product_options
-- ----------------------------
DROP TABLE IF EXISTS `product_options`;
CREATE TABLE `product_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_options
-- ----------------------------
BEGIN;
INSERT INTO `product_options` VALUES (1, 'color', 0, '2018-10-19 06:55:36', '2018-10-19 06:55:36');
INSERT INTO `product_options` VALUES (2, 'suite', 0, '2018-10-19 08:59:03', '2018-10-19 08:59:03');
INSERT INTO `product_options` VALUES (3, 'houdu', 0, '2018-10-20 08:02:52', '2018-10-20 08:02:52');
INSERT INTO `product_options` VALUES (4, 'model', 0, '2018-10-20 10:00:54', '2018-10-20 10:00:54');
INSERT INTO `product_options` VALUES (5, 'size', 0, '2018-10-22 03:30:31', '2018-10-22 03:30:31');
INSERT INTO `product_options` VALUES (6, 'width', 0, '2018-10-22 03:31:12', '2018-10-22 03:31:12');
INSERT INTO `product_options` VALUES (7, 'style', 0, '2018-10-22 03:31:14', '2018-10-22 03:31:14');
INSERT INTO `product_options` VALUES (8, 'appearance-of-size', 0, '2018-10-22 03:31:33', '2018-10-22 03:31:33');
INSERT INTO `product_options` VALUES (9, 'specifications', 0, '2018-10-22 03:31:49', '2018-10-22 03:31:49');
INSERT INTO `product_options` VALUES (10, 'the-shape-of', 0, '2018-10-22 08:26:58', '2018-10-22 08:26:58');
INSERT INTO `product_options` VALUES (11, 'produced', 0, '2018-10-24 18:03:24', '2018-10-24 18:03:24');
COMMIT;

-- ----------------------------
-- Table structure for product_product_option
-- ----------------------------
DROP TABLE IF EXISTS `product_product_option`;
CREATE TABLE `product_product_option` (
  `option_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  KEY `product_product_option_option_id_index` (`option_id`),
  KEY `product_product_option_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_product_option
-- ----------------------------
BEGIN;
INSERT INTO `product_product_option` VALUES (1, 2);
INSERT INTO `product_product_option` VALUES (1, 3);
INSERT INTO `product_product_option` VALUES (2, 4);
INSERT INTO `product_product_option` VALUES (1, 6);
INSERT INTO `product_product_option` VALUES (1, 7);
INSERT INTO `product_product_option` VALUES (1, 8);
INSERT INTO `product_product_option` VALUES (1, 9);
INSERT INTO `product_product_option` VALUES (1, 10);
INSERT INTO `product_product_option` VALUES (1, 11);
INSERT INTO `product_product_option` VALUES (3, 11);
INSERT INTO `product_product_option` VALUES (1, 12);
INSERT INTO `product_product_option` VALUES (1, 13);
INSERT INTO `product_product_option` VALUES (1, 14);
INSERT INTO `product_product_option` VALUES (1, 15);
INSERT INTO `product_product_option` VALUES (4, 15);
INSERT INTO `product_product_option` VALUES (1, 16);
INSERT INTO `product_product_option` VALUES (1, 17);
INSERT INTO `product_product_option` VALUES (1, 18);
INSERT INTO `product_product_option` VALUES (1, 19);
INSERT INTO `product_product_option` VALUES (1, 20);
INSERT INTO `product_product_option` VALUES (1, 22);
INSERT INTO `product_product_option` VALUES (1, 23);
INSERT INTO `product_product_option` VALUES (1, 24);
INSERT INTO `product_product_option` VALUES (1, 26);
INSERT INTO `product_product_option` VALUES (1, 28);
INSERT INTO `product_product_option` VALUES (1, 29);
INSERT INTO `product_product_option` VALUES (1, 30);
INSERT INTO `product_product_option` VALUES (1, 31);
INSERT INTO `product_product_option` VALUES (1, 32);
INSERT INTO `product_product_option` VALUES (5, 32);
INSERT INTO `product_product_option` VALUES (5, 33);
INSERT INTO `product_product_option` VALUES (1, 34);
INSERT INTO `product_product_option` VALUES (5, 34);
INSERT INTO `product_product_option` VALUES (5, 35);
INSERT INTO `product_product_option` VALUES (1, 36);
INSERT INTO `product_product_option` VALUES (5, 36);
INSERT INTO `product_product_option` VALUES (5, 37);
INSERT INTO `product_product_option` VALUES (5, 38);
INSERT INTO `product_product_option` VALUES (1, 39);
INSERT INTO `product_product_option` VALUES (1, 40);
INSERT INTO `product_product_option` VALUES (6, 40);
INSERT INTO `product_product_option` VALUES (1, 41);
INSERT INTO `product_product_option` VALUES (7, 41);
INSERT INTO `product_product_option` VALUES (5, 41);
INSERT INTO `product_product_option` VALUES (1, 42);
INSERT INTO `product_product_option` VALUES (5, 42);
INSERT INTO `product_product_option` VALUES (1, 43);
INSERT INTO `product_product_option` VALUES (1, 44);
INSERT INTO `product_product_option` VALUES (1, 45);
INSERT INTO `product_product_option` VALUES (5, 46);
INSERT INTO `product_product_option` VALUES (8, 47);
INSERT INTO `product_product_option` VALUES (1, 48);
INSERT INTO `product_product_option` VALUES (7, 49);
INSERT INTO `product_product_option` VALUES (5, 50);
INSERT INTO `product_product_option` VALUES (1, 51);
INSERT INTO `product_product_option` VALUES (1, 52);
INSERT INTO `product_product_option` VALUES (1, 53);
INSERT INTO `product_product_option` VALUES (1, 54);
INSERT INTO `product_product_option` VALUES (9, 55);
INSERT INTO `product_product_option` VALUES (1, 56);
INSERT INTO `product_product_option` VALUES (1, 59);
INSERT INTO `product_product_option` VALUES (1, 60);
INSERT INTO `product_product_option` VALUES (1, 61);
INSERT INTO `product_product_option` VALUES (1, 62);
INSERT INTO `product_product_option` VALUES (1, 63);
INSERT INTO `product_product_option` VALUES (1, 64);
INSERT INTO `product_product_option` VALUES (4, 65);
INSERT INTO `product_product_option` VALUES (5, 66);
INSERT INTO `product_product_option` VALUES (1, 69);
INSERT INTO `product_product_option` VALUES (5, 70);
INSERT INTO `product_product_option` VALUES (1, 71);
INSERT INTO `product_product_option` VALUES (5, 71);
INSERT INTO `product_product_option` VALUES (9, 72);
INSERT INTO `product_product_option` VALUES (1, 73);
INSERT INTO `product_product_option` VALUES (1, 74);
INSERT INTO `product_product_option` VALUES (1, 75);
INSERT INTO `product_product_option` VALUES (9, 76);
INSERT INTO `product_product_option` VALUES (1, 77);
INSERT INTO `product_product_option` VALUES (7, 78);
INSERT INTO `product_product_option` VALUES (5, 78);
INSERT INTO `product_product_option` VALUES (1, 79);
INSERT INTO `product_product_option` VALUES (1, 80);
INSERT INTO `product_product_option` VALUES (1, 81);
INSERT INTO `product_product_option` VALUES (10, 82);
INSERT INTO `product_product_option` VALUES (1, 83);
INSERT INTO `product_product_option` VALUES (1, 84);
INSERT INTO `product_product_option` VALUES (1, 85);
INSERT INTO `product_product_option` VALUES (1, 86);
INSERT INTO `product_product_option` VALUES (1, 87);
INSERT INTO `product_product_option` VALUES (1, 88);
COMMIT;

-- ----------------------------
-- Table structure for product_related_product
-- ----------------------------
DROP TABLE IF EXISTS `product_related_product`;
CREATE TABLE `product_related_product` (
  `product_id` int(10) unsigned NOT NULL,
  `related_id` int(10) unsigned NOT NULL,
  KEY `product_related_product_product_id_index` (`product_id`),
  KEY `product_related_product_related_id_index` (`related_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_related_product
-- ----------------------------
BEGIN;
INSERT INTO `product_related_product` VALUES (3, 14);
INSERT INTO `product_related_product` VALUES (3, 15);
INSERT INTO `product_related_product` VALUES (3, 16);
INSERT INTO `product_related_product` VALUES (3, 17);
INSERT INTO `product_related_product` VALUES (3, 18);
INSERT INTO `product_related_product` VALUES (4, 51);
INSERT INTO `product_related_product` VALUES (6, 49);
INSERT INTO `product_related_product` VALUES (6, 50);
INSERT INTO `product_related_product` VALUES (9, 13);
INSERT INTO `product_related_product` VALUES (9, 27);
INSERT INTO `product_related_product` VALUES (9, 57);
INSERT INTO `product_related_product` VALUES (9, 68);
INSERT INTO `product_related_product` VALUES (10, 11);
INSERT INTO `product_related_product` VALUES (10, 12);
INSERT INTO `product_related_product` VALUES (10, 25);
INSERT INTO `product_related_product` VALUES (10, 63);
INSERT INTO `product_related_product` VALUES (11, 10);
INSERT INTO `product_related_product` VALUES (11, 12);
INSERT INTO `product_related_product` VALUES (11, 25);
INSERT INTO `product_related_product` VALUES (11, 63);
INSERT INTO `product_related_product` VALUES (12, 10);
INSERT INTO `product_related_product` VALUES (12, 11);
INSERT INTO `product_related_product` VALUES (12, 25);
INSERT INTO `product_related_product` VALUES (12, 63);
INSERT INTO `product_related_product` VALUES (13, 9);
INSERT INTO `product_related_product` VALUES (13, 27);
INSERT INTO `product_related_product` VALUES (13, 57);
INSERT INTO `product_related_product` VALUES (13, 68);
INSERT INTO `product_related_product` VALUES (14, 3);
INSERT INTO `product_related_product` VALUES (14, 15);
INSERT INTO `product_related_product` VALUES (14, 16);
INSERT INTO `product_related_product` VALUES (14, 17);
INSERT INTO `product_related_product` VALUES (14, 18);
INSERT INTO `product_related_product` VALUES (15, 3);
INSERT INTO `product_related_product` VALUES (15, 14);
INSERT INTO `product_related_product` VALUES (15, 16);
INSERT INTO `product_related_product` VALUES (15, 17);
INSERT INTO `product_related_product` VALUES (15, 18);
INSERT INTO `product_related_product` VALUES (16, 3);
INSERT INTO `product_related_product` VALUES (16, 14);
INSERT INTO `product_related_product` VALUES (16, 15);
INSERT INTO `product_related_product` VALUES (16, 17);
INSERT INTO `product_related_product` VALUES (16, 18);
INSERT INTO `product_related_product` VALUES (17, 3);
INSERT INTO `product_related_product` VALUES (17, 14);
INSERT INTO `product_related_product` VALUES (17, 15);
INSERT INTO `product_related_product` VALUES (17, 16);
INSERT INTO `product_related_product` VALUES (17, 18);
INSERT INTO `product_related_product` VALUES (18, 3);
INSERT INTO `product_related_product` VALUES (18, 14);
INSERT INTO `product_related_product` VALUES (18, 15);
INSERT INTO `product_related_product` VALUES (18, 16);
INSERT INTO `product_related_product` VALUES (18, 17);
INSERT INTO `product_related_product` VALUES (19, 3);
INSERT INTO `product_related_product` VALUES (19, 14);
INSERT INTO `product_related_product` VALUES (19, 15);
INSERT INTO `product_related_product` VALUES (19, 16);
INSERT INTO `product_related_product` VALUES (19, 17);
INSERT INTO `product_related_product` VALUES (20, 3);
INSERT INTO `product_related_product` VALUES (20, 14);
INSERT INTO `product_related_product` VALUES (20, 15);
INSERT INTO `product_related_product` VALUES (20, 16);
INSERT INTO `product_related_product` VALUES (20, 17);
INSERT INTO `product_related_product` VALUES (21, 3);
INSERT INTO `product_related_product` VALUES (21, 14);
INSERT INTO `product_related_product` VALUES (21, 15);
INSERT INTO `product_related_product` VALUES (21, 16);
INSERT INTO `product_related_product` VALUES (21, 17);
INSERT INTO `product_related_product` VALUES (22, 3);
INSERT INTO `product_related_product` VALUES (22, 14);
INSERT INTO `product_related_product` VALUES (22, 15);
INSERT INTO `product_related_product` VALUES (22, 16);
INSERT INTO `product_related_product` VALUES (22, 17);
INSERT INTO `product_related_product` VALUES (23, 3);
INSERT INTO `product_related_product` VALUES (23, 14);
INSERT INTO `product_related_product` VALUES (23, 15);
INSERT INTO `product_related_product` VALUES (23, 16);
INSERT INTO `product_related_product` VALUES (23, 17);
INSERT INTO `product_related_product` VALUES (24, 3);
INSERT INTO `product_related_product` VALUES (24, 14);
INSERT INTO `product_related_product` VALUES (24, 15);
INSERT INTO `product_related_product` VALUES (24, 16);
INSERT INTO `product_related_product` VALUES (24, 17);
INSERT INTO `product_related_product` VALUES (25, 10);
INSERT INTO `product_related_product` VALUES (25, 11);
INSERT INTO `product_related_product` VALUES (25, 12);
INSERT INTO `product_related_product` VALUES (25, 63);
INSERT INTO `product_related_product` VALUES (27, 9);
INSERT INTO `product_related_product` VALUES (27, 13);
INSERT INTO `product_related_product` VALUES (27, 57);
INSERT INTO `product_related_product` VALUES (27, 68);
INSERT INTO `product_related_product` VALUES (28, 29);
INSERT INTO `product_related_product` VALUES (28, 32);
INSERT INTO `product_related_product` VALUES (28, 35);
INSERT INTO `product_related_product` VALUES (28, 37);
INSERT INTO `product_related_product` VALUES (28, 79);
INSERT INTO `product_related_product` VALUES (29, 28);
INSERT INTO `product_related_product` VALUES (29, 32);
INSERT INTO `product_related_product` VALUES (29, 35);
INSERT INTO `product_related_product` VALUES (29, 37);
INSERT INTO `product_related_product` VALUES (29, 79);
INSERT INTO `product_related_product` VALUES (30, 31);
INSERT INTO `product_related_product` VALUES (30, 33);
INSERT INTO `product_related_product` VALUES (30, 34);
INSERT INTO `product_related_product` VALUES (30, 36);
INSERT INTO `product_related_product` VALUES (30, 77);
INSERT INTO `product_related_product` VALUES (31, 30);
INSERT INTO `product_related_product` VALUES (31, 33);
INSERT INTO `product_related_product` VALUES (31, 34);
INSERT INTO `product_related_product` VALUES (31, 36);
INSERT INTO `product_related_product` VALUES (31, 77);
INSERT INTO `product_related_product` VALUES (32, 28);
INSERT INTO `product_related_product` VALUES (32, 29);
INSERT INTO `product_related_product` VALUES (32, 35);
INSERT INTO `product_related_product` VALUES (32, 37);
INSERT INTO `product_related_product` VALUES (32, 79);
INSERT INTO `product_related_product` VALUES (33, 30);
INSERT INTO `product_related_product` VALUES (33, 31);
INSERT INTO `product_related_product` VALUES (33, 34);
INSERT INTO `product_related_product` VALUES (33, 36);
INSERT INTO `product_related_product` VALUES (33, 77);
INSERT INTO `product_related_product` VALUES (34, 30);
INSERT INTO `product_related_product` VALUES (34, 31);
INSERT INTO `product_related_product` VALUES (34, 33);
INSERT INTO `product_related_product` VALUES (34, 36);
INSERT INTO `product_related_product` VALUES (34, 77);
INSERT INTO `product_related_product` VALUES (35, 28);
INSERT INTO `product_related_product` VALUES (35, 29);
INSERT INTO `product_related_product` VALUES (35, 32);
INSERT INTO `product_related_product` VALUES (35, 37);
INSERT INTO `product_related_product` VALUES (35, 79);
INSERT INTO `product_related_product` VALUES (36, 30);
INSERT INTO `product_related_product` VALUES (36, 31);
INSERT INTO `product_related_product` VALUES (36, 33);
INSERT INTO `product_related_product` VALUES (36, 34);
INSERT INTO `product_related_product` VALUES (36, 77);
INSERT INTO `product_related_product` VALUES (37, 28);
INSERT INTO `product_related_product` VALUES (37, 29);
INSERT INTO `product_related_product` VALUES (37, 32);
INSERT INTO `product_related_product` VALUES (37, 35);
INSERT INTO `product_related_product` VALUES (37, 79);
INSERT INTO `product_related_product` VALUES (38, 39);
INSERT INTO `product_related_product` VALUES (38, 40);
INSERT INTO `product_related_product` VALUES (38, 41);
INSERT INTO `product_related_product` VALUES (38, 42);
INSERT INTO `product_related_product` VALUES (38, 43);
INSERT INTO `product_related_product` VALUES (39, 38);
INSERT INTO `product_related_product` VALUES (39, 40);
INSERT INTO `product_related_product` VALUES (39, 41);
INSERT INTO `product_related_product` VALUES (39, 42);
INSERT INTO `product_related_product` VALUES (39, 43);
INSERT INTO `product_related_product` VALUES (40, 38);
INSERT INTO `product_related_product` VALUES (40, 39);
INSERT INTO `product_related_product` VALUES (40, 41);
INSERT INTO `product_related_product` VALUES (40, 42);
INSERT INTO `product_related_product` VALUES (40, 43);
INSERT INTO `product_related_product` VALUES (41, 38);
INSERT INTO `product_related_product` VALUES (41, 39);
INSERT INTO `product_related_product` VALUES (41, 40);
INSERT INTO `product_related_product` VALUES (41, 42);
INSERT INTO `product_related_product` VALUES (41, 43);
INSERT INTO `product_related_product` VALUES (42, 38);
INSERT INTO `product_related_product` VALUES (42, 39);
INSERT INTO `product_related_product` VALUES (42, 40);
INSERT INTO `product_related_product` VALUES (42, 41);
INSERT INTO `product_related_product` VALUES (42, 43);
INSERT INTO `product_related_product` VALUES (43, 38);
INSERT INTO `product_related_product` VALUES (43, 39);
INSERT INTO `product_related_product` VALUES (43, 40);
INSERT INTO `product_related_product` VALUES (43, 41);
INSERT INTO `product_related_product` VALUES (43, 42);
INSERT INTO `product_related_product` VALUES (44, 38);
INSERT INTO `product_related_product` VALUES (44, 39);
INSERT INTO `product_related_product` VALUES (44, 40);
INSERT INTO `product_related_product` VALUES (44, 41);
INSERT INTO `product_related_product` VALUES (44, 42);
INSERT INTO `product_related_product` VALUES (45, 46);
INSERT INTO `product_related_product` VALUES (45, 47);
INSERT INTO `product_related_product` VALUES (45, 48);
INSERT INTO `product_related_product` VALUES (45, 61);
INSERT INTO `product_related_product` VALUES (45, 62);
INSERT INTO `product_related_product` VALUES (46, 45);
INSERT INTO `product_related_product` VALUES (46, 47);
INSERT INTO `product_related_product` VALUES (46, 48);
INSERT INTO `product_related_product` VALUES (46, 61);
INSERT INTO `product_related_product` VALUES (46, 62);
INSERT INTO `product_related_product` VALUES (47, 45);
INSERT INTO `product_related_product` VALUES (47, 46);
INSERT INTO `product_related_product` VALUES (47, 48);
INSERT INTO `product_related_product` VALUES (47, 61);
INSERT INTO `product_related_product` VALUES (47, 62);
INSERT INTO `product_related_product` VALUES (48, 45);
INSERT INTO `product_related_product` VALUES (48, 46);
INSERT INTO `product_related_product` VALUES (48, 47);
INSERT INTO `product_related_product` VALUES (48, 61);
INSERT INTO `product_related_product` VALUES (48, 62);
INSERT INTO `product_related_product` VALUES (49, 6);
INSERT INTO `product_related_product` VALUES (49, 50);
INSERT INTO `product_related_product` VALUES (50, 6);
INSERT INTO `product_related_product` VALUES (50, 49);
INSERT INTO `product_related_product` VALUES (51, 4);
INSERT INTO `product_related_product` VALUES (52, 53);
INSERT INTO `product_related_product` VALUES (52, 54);
INSERT INTO `product_related_product` VALUES (52, 55);
INSERT INTO `product_related_product` VALUES (52, 56);
INSERT INTO `product_related_product` VALUES (52, 69);
INSERT INTO `product_related_product` VALUES (53, 52);
INSERT INTO `product_related_product` VALUES (53, 54);
INSERT INTO `product_related_product` VALUES (53, 55);
INSERT INTO `product_related_product` VALUES (53, 56);
INSERT INTO `product_related_product` VALUES (53, 69);
INSERT INTO `product_related_product` VALUES (54, 52);
INSERT INTO `product_related_product` VALUES (54, 53);
INSERT INTO `product_related_product` VALUES (54, 55);
INSERT INTO `product_related_product` VALUES (54, 56);
INSERT INTO `product_related_product` VALUES (54, 69);
INSERT INTO `product_related_product` VALUES (55, 52);
INSERT INTO `product_related_product` VALUES (55, 53);
INSERT INTO `product_related_product` VALUES (55, 54);
INSERT INTO `product_related_product` VALUES (55, 56);
INSERT INTO `product_related_product` VALUES (55, 69);
INSERT INTO `product_related_product` VALUES (56, 52);
INSERT INTO `product_related_product` VALUES (56, 53);
INSERT INTO `product_related_product` VALUES (56, 54);
INSERT INTO `product_related_product` VALUES (56, 55);
INSERT INTO `product_related_product` VALUES (56, 69);
INSERT INTO `product_related_product` VALUES (57, 9);
INSERT INTO `product_related_product` VALUES (57, 13);
INSERT INTO `product_related_product` VALUES (57, 27);
INSERT INTO `product_related_product` VALUES (57, 68);
INSERT INTO `product_related_product` VALUES (59, 3);
INSERT INTO `product_related_product` VALUES (59, 14);
INSERT INTO `product_related_product` VALUES (59, 15);
INSERT INTO `product_related_product` VALUES (59, 16);
INSERT INTO `product_related_product` VALUES (59, 17);
INSERT INTO `product_related_product` VALUES (60, 3);
INSERT INTO `product_related_product` VALUES (60, 14);
INSERT INTO `product_related_product` VALUES (60, 15);
INSERT INTO `product_related_product` VALUES (60, 16);
INSERT INTO `product_related_product` VALUES (60, 17);
INSERT INTO `product_related_product` VALUES (61, 45);
INSERT INTO `product_related_product` VALUES (61, 46);
INSERT INTO `product_related_product` VALUES (61, 47);
INSERT INTO `product_related_product` VALUES (61, 48);
INSERT INTO `product_related_product` VALUES (61, 62);
INSERT INTO `product_related_product` VALUES (62, 45);
INSERT INTO `product_related_product` VALUES (62, 46);
INSERT INTO `product_related_product` VALUES (62, 47);
INSERT INTO `product_related_product` VALUES (62, 48);
INSERT INTO `product_related_product` VALUES (62, 61);
INSERT INTO `product_related_product` VALUES (63, 10);
INSERT INTO `product_related_product` VALUES (63, 11);
INSERT INTO `product_related_product` VALUES (63, 12);
INSERT INTO `product_related_product` VALUES (63, 25);
INSERT INTO `product_related_product` VALUES (64, 65);
INSERT INTO `product_related_product` VALUES (64, 66);
INSERT INTO `product_related_product` VALUES (65, 64);
INSERT INTO `product_related_product` VALUES (65, 66);
INSERT INTO `product_related_product` VALUES (66, 64);
INSERT INTO `product_related_product` VALUES (66, 65);
INSERT INTO `product_related_product` VALUES (69, 52);
INSERT INTO `product_related_product` VALUES (69, 53);
INSERT INTO `product_related_product` VALUES (69, 54);
INSERT INTO `product_related_product` VALUES (69, 55);
INSERT INTO `product_related_product` VALUES (69, 56);
INSERT INTO `product_related_product` VALUES (70, 52);
INSERT INTO `product_related_product` VALUES (70, 53);
INSERT INTO `product_related_product` VALUES (70, 54);
INSERT INTO `product_related_product` VALUES (70, 55);
INSERT INTO `product_related_product` VALUES (70, 56);
INSERT INTO `product_related_product` VALUES (71, 52);
INSERT INTO `product_related_product` VALUES (71, 53);
INSERT INTO `product_related_product` VALUES (71, 54);
INSERT INTO `product_related_product` VALUES (71, 55);
INSERT INTO `product_related_product` VALUES (71, 56);
INSERT INTO `product_related_product` VALUES (72, 52);
INSERT INTO `product_related_product` VALUES (72, 53);
INSERT INTO `product_related_product` VALUES (72, 54);
INSERT INTO `product_related_product` VALUES (72, 55);
INSERT INTO `product_related_product` VALUES (72, 56);
INSERT INTO `product_related_product` VALUES (73, 74);
INSERT INTO `product_related_product` VALUES (73, 75);
INSERT INTO `product_related_product` VALUES (73, 76);
INSERT INTO `product_related_product` VALUES (73, 81);
INSERT INTO `product_related_product` VALUES (73, 82);
INSERT INTO `product_related_product` VALUES (74, 73);
INSERT INTO `product_related_product` VALUES (74, 75);
INSERT INTO `product_related_product` VALUES (74, 76);
INSERT INTO `product_related_product` VALUES (74, 81);
INSERT INTO `product_related_product` VALUES (74, 82);
INSERT INTO `product_related_product` VALUES (76, 73);
INSERT INTO `product_related_product` VALUES (76, 74);
INSERT INTO `product_related_product` VALUES (76, 75);
INSERT INTO `product_related_product` VALUES (76, 81);
INSERT INTO `product_related_product` VALUES (76, 82);
INSERT INTO `product_related_product` VALUES (77, 30);
INSERT INTO `product_related_product` VALUES (77, 31);
INSERT INTO `product_related_product` VALUES (77, 33);
INSERT INTO `product_related_product` VALUES (77, 34);
INSERT INTO `product_related_product` VALUES (77, 36);
INSERT INTO `product_related_product` VALUES (78, 30);
INSERT INTO `product_related_product` VALUES (78, 31);
INSERT INTO `product_related_product` VALUES (78, 33);
INSERT INTO `product_related_product` VALUES (78, 34);
INSERT INTO `product_related_product` VALUES (78, 36);
INSERT INTO `product_related_product` VALUES (79, 28);
INSERT INTO `product_related_product` VALUES (79, 29);
INSERT INTO `product_related_product` VALUES (79, 32);
INSERT INTO `product_related_product` VALUES (79, 35);
INSERT INTO `product_related_product` VALUES (79, 37);
INSERT INTO `product_related_product` VALUES (80, 30);
INSERT INTO `product_related_product` VALUES (80, 31);
INSERT INTO `product_related_product` VALUES (80, 33);
INSERT INTO `product_related_product` VALUES (80, 34);
INSERT INTO `product_related_product` VALUES (80, 36);
INSERT INTO `product_related_product` VALUES (81, 73);
INSERT INTO `product_related_product` VALUES (81, 74);
INSERT INTO `product_related_product` VALUES (81, 75);
INSERT INTO `product_related_product` VALUES (81, 76);
INSERT INTO `product_related_product` VALUES (81, 82);
INSERT INTO `product_related_product` VALUES (82, 73);
INSERT INTO `product_related_product` VALUES (82, 74);
INSERT INTO `product_related_product` VALUES (82, 75);
INSERT INTO `product_related_product` VALUES (82, 76);
INSERT INTO `product_related_product` VALUES (82, 81);
INSERT INTO `product_related_product` VALUES (83, 84);
INSERT INTO `product_related_product` VALUES (83, 85);
INSERT INTO `product_related_product` VALUES (83, 86);
INSERT INTO `product_related_product` VALUES (84, 83);
INSERT INTO `product_related_product` VALUES (84, 85);
INSERT INTO `product_related_product` VALUES (84, 86);
INSERT INTO `product_related_product` VALUES (85, 83);
INSERT INTO `product_related_product` VALUES (85, 84);
INSERT INTO `product_related_product` VALUES (85, 86);
INSERT INTO `product_related_product` VALUES (86, 83);
INSERT INTO `product_related_product` VALUES (86, 84);
INSERT INTO `product_related_product` VALUES (86, 85);
INSERT INTO `product_related_product` VALUES (87, 88);
INSERT INTO `product_related_product` VALUES (88, 87);
INSERT INTO `product_related_product` VALUES (90, 70);
INSERT INTO `product_related_product` VALUES (90, 35);
COMMIT;

-- ----------------------------
-- Table structure for product_reviews
-- ----------------------------
DROP TABLE IF EXISTS `product_reviews`;
CREATE TABLE `product_reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `variant_id` int(10) unsigned NOT NULL,
  `order_item_id` int(10) unsigned NOT NULL,
  `option_values` json DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` tinyint(3) unsigned NOT NULL COMMENT '评分 1~5',
  `state` tinyint(3) unsigned NOT NULL COMMENT '评论状态',
  `channel_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_reviews_order_item_id_unique` (`order_item_id`),
  KEY `product_reviews_channel_id_index` (`channel_id`),
  KEY `product_reviews_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for product_taxon
-- ----------------------------
DROP TABLE IF EXISTS `product_taxon`;
CREATE TABLE `product_taxon` (
  `taxon_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  KEY `product_taxon_taxon_id_index` (`taxon_id`),
  KEY `product_taxon_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_taxon
-- ----------------------------
BEGIN;
INSERT INTO `product_taxon` VALUES (64, 3);
INSERT INTO `product_taxon` VALUES (69, 4);
INSERT INTO `product_taxon` VALUES (70, 4);
INSERT INTO `product_taxon` VALUES (55, 6);
INSERT INTO `product_taxon` VALUES (69, 5);
INSERT INTO `product_taxon` VALUES (70, 5);
INSERT INTO `product_taxon` VALUES (8, 7);
INSERT INTO `product_taxon` VALUES (64, 8);
INSERT INTO `product_taxon` VALUES (22, 9);
INSERT INTO `product_taxon` VALUES (32, 10);
INSERT INTO `product_taxon` VALUES (32, 11);
INSERT INTO `product_taxon` VALUES (32, 12);
COMMIT;

-- ----------------------------
-- Table structure for product_translations
-- ----------------------------
DROP TABLE IF EXISTS `product_translations`;
CREATE TABLE `product_translations` (
  `translatable_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '优先通过该字段检索',
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_tl` (`translatable_id`,`locale_code`),
  UNIQUE KEY `unique_ls` (`locale_code`,`slug`),
  KEY `product_translations_translatable_id_index` (`translatable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_translations
-- ----------------------------
BEGIN;
INSERT INTO `product_translations` VALUES (3, 'Car phone holder car bracket car navigation frame car support frame suction cup type air outlet car multifunction', 'car-phone-holder', '<p><img src=\"https://img.alicdn.com/imgextra/i2/475437642/TB2x02GrNSYBuNjSsphXXbGvVXa_!!475437642.jpg\" alt=\"\" width=\"790\" height=\"1358\" /></p>\n<p><img src=\"https://img.alicdn.com/imgextra/i1/475437642/TB2F6LaBKuSBuNjy1XcXXcYjFXa_!!475437642.jpg\" alt=\"\" /></p>', 'car-phone-holder', 'car-phone-holder', 'car-phone-holder', 'car-phone-holder', 'en-US', '2018-10-19 09:05:59', '2018-10-19 10:09:14', 1);
INSERT INTO `product_translations` VALUES (4, 'Intelligent bilateral electric breast pump breast pump', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/HHjJCA4w1X0aFgIQyyUkIjUsJfRpGSPwAD9XgjbO.png\" alt=\"\" width=\"733\" height=\"3242\" /></p>', 'Intelligent-bilateral-electric-breast-pump-breast-pump', NULL, NULL, NULL, 'en-US', '2018-10-19 09:05:17', '2018-10-19 09:59:26', 2);
INSERT INTO `product_translations` VALUES (5, '', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/xyoSx35OLK9HRRJZnArgD8K1HAAVFTJ6kpHEkzqc.png\" alt=\"\" width=\"771\" height=\"2965\" /></p>', NULL, NULL, NULL, NULL, 'en-US', '2018-10-19 10:19:17', '2018-10-19 10:19:17', 3);
INSERT INTO `product_translations` VALUES (6, 'Negative ion car seat cushion', 'negative-ion-car-seat-cushion', '<p><img src=\"http://img30.360buyimg.com/cf/jfs/t5695/32/4692842872/227189/717ea95b/59532c6dNe39ef6ca.jpg\" alt=\"\" /></p>\n<p><img src=\"http://img30.360buyimg.com/cf/jfs/t5995/118/3638791717/337596/98a5efa8/59534d05Nd12cb30f.jpg\" alt=\"\" /></p>\n<p><img src=\"http://img30.360buyimg.com/cf/jfs/t6097/340/3472356891/304989/7f863fc2/59533302Na52529f0.jpg\" alt=\"\" /></p>', 'negative-ion-car-seat-cushion', 'negative-ion-car-seat-cushion', 'negative-ion-car-seat-cushion', 'negative-ion-car-seat-cushion', 'en-US', '2018-10-19 10:20:09', '2018-10-20 09:11:50', 4);
INSERT INTO `product_translations` VALUES (7, 'Toolbox set', 'toolbox-set', '<p><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t9625/279/980191498/276078/937f4ec/59db14e3N7e057820.jpg\" alt=\"\" width=\"790\" height=\"652\" /></p>\n<p><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t9337/251/2577392021/626104/50706b5d/59db14e7Nfd92c2f2.jpg\" alt=\"\" /></p>', 'toolbox-set', 'toolbox-set', 'toolbox-set', 'toolbox-set', 'en-US', '2018-10-19 10:37:04', '2018-10-22 10:23:56', 5);
INSERT INTO `product_translations` VALUES (9, 'Coco lightweight aesthetic nail clippers', 'coco-lightweight-aesthetic-nail-clippers', '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/UlxFxOhKm1RejPAOSDsyiCUB06n9l9IopsTf7bqS.png\" alt=\"\" width=\"754\" height=\"9620\" /></p>\n<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/UhZhkmYc9TXKIVVkwNk0sV48h59qpdoGmditiL1P.png\" alt=\"\" width=\"755\" height=\"780\" /></p>\n<p>&nbsp;</p>', 'coco-lightweight-aesthetic-nail-clippers', 'coco-lightweight-aesthetic-nail-clippers', 'coco-lightweight-aesthetic-nail-clippers', 'coco-lightweight-aesthetic-nail-clippers', 'en-US', '2018-10-20 02:32:55', '2018-10-20 03:04:50', 6);
INSERT INTO `product_translations` VALUES (10, 'massage-yoga-ball', 'massage-yoga-ball', NULL, 'massage-yoga-ball', 'massage-yoga-ball', 'massage-yoga-ball', 'massage-yoga-ball', 'en-US', '2018-10-20 07:44:11', '2018-10-22 10:24:51', 7);
INSERT INTO `product_translations` VALUES (11, 'Yoga mat', 'Yoga mat', NULL, 'yoga-mat', 'Yoga mat', 'Yoga mat', 'Yoga mat', 'en-US', '2018-10-20 08:00:33', '2018-10-22 10:24:20', 8);
INSERT INTO `product_translations` VALUES (12, 'Rubber ball', 'Rubber ball', NULL, 'rubber-ball', 'Rubber ball', 'Rubber ball', 'Rubber ball', 'en-US', '2018-10-20 08:39:24', '2018-10-20 08:46:28', 9);
INSERT INTO `product_translations` VALUES (13, 'Corbo light and thin aesthetic nail clippers', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/5.png\" alt=\"\" /></p>', 'corbo-light-and-thin-aesthetic-nail-clippers', NULL, NULL, NULL, 'en-US', '2018-10-20 10:00:48', '2018-10-20 10:26:26', 10);
INSERT INTO `product_translations` VALUES (14, 'Ultra thin mini 20000 mah mobile power supply', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/7.png\" alt=\"\" /></p>', 'ultra-thin-mini-20000-mah-mobile-power-supply', NULL, NULL, NULL, 'en-US', '2018-10-20 10:00:50', '2018-10-20 10:23:27', 11);
INSERT INTO `product_translations` VALUES (15, 'Compact multi function mobile power supply', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/dzuku4vn1sxvk8eoakhmCjP4gFRer38u9cvisd3f.jpeg\" alt=\"\" width=\"730\" height=\"1166\" /><img src=\"http://pbfh6sbp9.bkt.clouddn.com/gkDC5KkQbUpPdzkFSGgMGcdARRr8IxJgoK5YLt49.jpeg\" alt=\"\" width=\"730\" height=\"1255\" /><img src=\"http://pbfh6sbp9.bkt.clouddn.com/YuY2Pxorki4e5Qt9s8FPQOYue41ateMp3t2FWyc1.jpeg\" alt=\"\" width=\"730\" height=\"1030\" /><img src=\"http://pbfh6sbp9.bkt.clouddn.com/g9rhgOtSorjX8VkiajI9K71Ux0VmsU9qKgBCKLrZ.jpeg\" alt=\"\" width=\"730\" height=\"1490\" /></p>', 'compact-multi-function-mobile-power-supply', NULL, NULL, NULL, 'en-US', '2018-10-20 10:00:53', '2018-10-20 10:32:50', 12);
INSERT INTO `product_translations` VALUES (16, 'Wireless smart quick charge', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/nuzTna3Ht1Y2XQrAhtDCpmUNsrwzzL8ayxghM3h0.png\" alt=\"\" width=\"748\" height=\"4892\" /><img src=\"http://pbfh6sbp9.bkt.clouddn.com/Nw4iwFlTeSW59SB3N7DEDNSow2b62hFFe5JzEl9L.png\" alt=\"\" width=\"739\" height=\"5970\" /></p>', 'wireless-smart-quick-charge', NULL, NULL, NULL, 'en-US', '2018-10-20 10:00:55', '2018-10-20 10:44:58', 13);
INSERT INTO `product_translations` VALUES (17, '12 constellation night light mobile power supply', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/2obLWyScIHUQaavdfZadCpiwTtm9SmPQLS8BZPYm.png\" alt=\"\" width=\"905\" height=\"12512\" /></p>', '12-constellation-night-light-mobile-power-supply', NULL, NULL, NULL, 'en-US', '2018-10-20 10:00:57', '2018-10-22 02:09:31', 14);
INSERT INTO `product_translations` VALUES (18, 'Bcase is a different selfie stick', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/z9QUCPwCjpTqOsL2f7M8GUJ9rlDpEWiJE6fZjchi.png\" alt=\"\" width=\"905\" height=\"4107\" /></p>', 'bcase-is-a-different-selfie-stick', NULL, NULL, NULL, 'en-US', '2018-10-20 10:00:59', '2018-10-22 02:35:46', 15);
INSERT INTO `product_translations` VALUES (19, 'Flexible robot support', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/00UgP4msqXK76Id63JZBNoo7oUYAaVGzogI3OooI.png\" alt=\"\" width=\"905\" height=\"9560\" /></p>', 'flexible-robot-support', NULL, NULL, NULL, 'en-US', '2018-10-20 10:01:00', '2018-10-22 02:03:42', 16);
INSERT INTO `product_translations` VALUES (20, 'Smart pen for taking photos', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/Krq6rnalrUBTYFaJE4E7UUyHLuYpGcASyJq2RcJH.png\" alt=\"\" width=\"905\" height=\"6125\" /></p>', 'smart-pen-for-taking-photos', NULL, NULL, NULL, 'en-US', '2018-10-20 10:01:03', '2018-10-22 02:06:05', 17);
INSERT INTO `product_translations` VALUES (21, 'The little box is everything', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/LMjCeMst4SSf7fBQrC48wTp19GWh0PBZeL8SUonz.png\" alt=\"\" width=\"905\" height=\"5068\" /></p>', 'the-little-box-is-everything', NULL, NULL, NULL, 'en-US', '2018-10-20 10:01:05', '2018-10-22 02:36:03', 18);
INSERT INTO `product_translations` VALUES (22, 'Portable wireless bluetooth speaker', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/okWfJzBTGxLYW6fNAApzpolDKH6a3E8qZ8V5P4Z5.png\" alt=\"\" width=\"905\" /></p>', 'portable-wireless-bluetooth-speaker', NULL, NULL, NULL, 'en-US', '2018-10-20 10:01:08', '2018-10-22 10:25:47', 19);
INSERT INTO `product_translations` VALUES (23, 'Mondrian music canvas wireless bluetooth speaker', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/bPlViRUEyEdTgN9clW17gRAMTUk71hqXcA03geyV.png\" alt=\"\" width=\"905\" height=\"3804\" /></p>', 'mondrian-music-canvas-wireless-bluetooth-speaker', NULL, NULL, NULL, 'en-US', '2018-10-20 10:01:13', '2018-10-22 10:26:16', 20);
INSERT INTO `product_translations` VALUES (24, 'High pretend bility electronic cigarette holder', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/GrejVAwF0ZcVK1QTYt4uxUEer6CJhC4AM2Na3pDt.png\" alt=\"\" width=\"905\" height=\"5397\" /></p>', 'high-pretend-bility-electronic-cigarette-holder', NULL, NULL, NULL, 'en-US', '2018-10-20 10:01:15', '2018-10-22 03:36:09', 21);
INSERT INTO `product_translations` VALUES (25, 'Small procedure body fat scale', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/FHZBpiikTd8fBNWkh9y7sqXAqNgw1pne5Yp29quj.png\" alt=\"\" width=\"905\" height=\"5653\" /></p>', 'small-procedure-body-fat-scale', NULL, NULL, NULL, 'en-US', '2018-10-20 10:01:19', '2018-10-22 02:49:18', 22);
INSERT INTO `product_translations` VALUES (26, 'Pma graphene thermal silk eye mask', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/x11khr98ptCnyLco6cjegdwQUcx4qa2kBqTMlecN.png\" alt=\"\" width=\"905\" height=\"5107\" /></p>', 'pma-graphene-thermal-silk-eye-mask', NULL, NULL, NULL, 'en-US', '2018-10-20 10:01:21', '2018-10-22 10:26:57', 23);
INSERT INTO `product_translations` VALUES (27, 'A cotton face towel', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/WM3BTW7GbYweeOLKJlPprk7lj6BLRLFP2dNVUiAR.png\" alt=\"\" width=\"905\" height=\"3211\" /><img src=\"http://pbfh6sbp9.bkt.clouddn.com/WyItmKAowv63Dd7KzHpz2iVIQn4B6pvdoNUmbnY3.png\" alt=\"\" width=\"905\" height=\"4306\" /></p>', 'a-cotton-face-towel', NULL, NULL, NULL, 'en-US', '2018-10-20 10:01:24', '2018-10-22 02:55:36', 24);
INSERT INTO `product_translations` VALUES (28, 'Top layer cowhide run vehicle belt', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/UoZpJv9Mjzj06T7RGBn0kzGtUcL8T6wPUaw4WKCi.png\" alt=\"\" width=\"905\" height=\"7204\" /></p>', 'top-layer-cowhide-run-vehicle-belt', NULL, NULL, NULL, 'en-US', '2018-10-22 03:30:00', '2018-10-22 06:11:14', 25);
INSERT INTO `product_translations` VALUES (29, '90 split cow pickup bag folded', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/7BaC4HGkYDwJlmywzL7n3jnYtZgNzZBLPHsesDZs.png\" alt=\"\" width=\"905\" height=\"13186\" /></p>', '90-split-cow-pickup-bag-folded', NULL, NULL, NULL, 'en-US', '2018-10-22 03:30:05', '2018-10-22 06:18:06', 26);
INSERT INTO `product_translations` VALUES (30, 'Leather purse womens 2018 new fashionable sheepskin short mini multi functional wallet pocket fold zero wallet', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/6y4RJGzlOy2g1jvLYOTvJBt530Jn2A0V7Ks2Ma6z.png\" alt=\"\" width=\"905\" height=\"15310\" /></p>', 'leather-purse-womens-2018-new-fashionable-sheepskin-short-mini-multi-functional-wallet-pocket-fold-zero-wallet', NULL, NULL, NULL, 'en-US', '2018-10-22 03:30:07', '2018-10-22 10:27:25', 27);
INSERT INTO `product_translations` VALUES (31, '2018 new korean womens purse womens long style multi functional real wallet childrens money hand bag wallet tide', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/xRBaKxpEtJrRqlwHrjiYKFFuE8SXDjjdo3Q0fMRe.png\" alt=\"\" width=\"905\" height=\"9961\" /></p>', '2018-new-korean-womens-purse-womens-long-style-multi-functional-real-wallet-childrens-money-hand-bag-wallet-tide', NULL, NULL, NULL, 'en-US', '2018-10-22 03:30:14', '2018-10-22 06:26:35', 28);
INSERT INTO `product_translations` VALUES (32, 'Luladi flip flops mens beach slippers mens non slip slippers black', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/XiXGZsujLh6KGXBwPGqcbqaWDN8Hd3EnKMCCkRqr.png\" alt=\"\" width=\"905\" height=\"12099\" /></p>', 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black', NULL, NULL, NULL, 'en-US', '2018-10-22 03:30:23', '2018-10-22 06:34:05', 29);
INSERT INTO `product_translations` VALUES (33, 'Havaianas brazil 2018 classic flip flops top black slip resistant slipper for men and women havana', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/Z19X5aBQ5UivAVFC0kWeWHrzmPQJTXDKTZuffM0f.png\" alt=\"\" width=\"905\" height=\"9673\" /></p>', 'havaianas-brazil-2018-classic-flip-flops-top-black-slip-resistant-slipper-for-men-and-women-havana', NULL, NULL, NULL, 'en-US', '2018-10-22 03:30:33', '2018-10-22 06:38:28', 30);
INSERT INTO `product_translations` VALUES (34, 'Warm shadow home female home dress spring and autumn mo dyer home dress seven sleeves long pants two pieces of nordic beauty when you can wear a home dress suit', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/1xLx26NTNIntm4JtVHpNmProf1HSJV2PEO1FhNjI.png\" alt=\"\" width=\"905\" height=\"17097\" /></p>', 'warm-shadow-home-female-home-dress-spring-and-autumn-mo-dyer-home-dress-seven-sleeves-long-pants-two-pieces-of-nordic-beauty-when-you-can-wear-a-home-dress-suit', NULL, NULL, NULL, 'en-US', '2018-10-22 03:30:39', '2018-10-22 06:45:30', 31);
INSERT INTO `product_translations` VALUES (35, 'Mens pajamas long sleeved cotton spring and autumn cardigan men plus size autumn winter household suit mens young man', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/hQpwiGrkPUDcaW1b6UQOyh2kSES2HzVMeT5zQQ64.png\" alt=\"\" width=\"905\" height=\"11893\" /></p>', 'mens-pajamas-long-sleeved-cotton-spring-and-autumn-cardigan-men-plus-size-autumn-winter-household-suit-mens-young-man', NULL, NULL, NULL, 'en-US', '2018-10-22 03:30:46', '2018-10-22 06:48:30', 32);
INSERT INTO `product_translations` VALUES (36, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/KoTX5Jug9TynjyZHLu27f4U5dWDGHJyAqX91cRn6.png\" alt=\"\" width=\"905\" height=\"14046\" /></p>', 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers', NULL, NULL, NULL, 'en-US', '2018-10-22 03:30:51', '2018-10-22 06:51:38', 33);
INSERT INTO `product_translations` VALUES (37, 'Tight pants male gym suit high bounce speed dry run sports compression basketball leggings long pants seven points plus pile training', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/j4m1HdHSVlPFJeM4iskexwuQnNLSqDXM6ulmzmko.png\" alt=\"\" width=\"905\" height=\"13831\" /></p>', 'tight-pants-male-gym-suit-high-bounce-speed-dry-run-sports-compression-basketball-leggings-long-pants-seven-points-plus-pile-training', NULL, NULL, NULL, 'en-US', '2018-10-22 03:30:57', '2018-10-22 06:54:57', 34);
INSERT INTO `product_translations` VALUES (38, 'The antarctic peoples 60 satins long plush cotton four piece cotton plain womens bed sheet and quilt cover 20m bedding', NULL, NULL, 'the-antarctic-peoples-60-satins-long-plush-cotton-four-piece-cotton-plain-womens-bed-sheet-and-quilt-cover-20m-bedding', NULL, NULL, NULL, 'en-US', '2018-10-22 03:31:00', '2018-10-22 08:47:14', 35);
INSERT INTO `product_translations` VALUES (39, 'Non printed cotton acorns embroidered plaid washed cotton fine cotton four piece sheet bed bonnets', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/SKWLPRprXrSfeX5kNeYAQpk8mNCNImbNHEtqHkOg.bin\" alt=\"\" /><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/hxV3PqpZswrSqLYFRwYYVNmNuLw4S6B0XpmSn4wn.png\" alt=\"\" width=\"778\" height=\"9815\" /></p>', 'non-printed-cotton-acorns-embroidered-plaid-washed-cotton-fine-cotton-four-piece-sheet-bed-bonnets', NULL, NULL, NULL, 'en-US', '2018-10-22 03:31:05', '2018-10-22 08:17:02', 36);
INSERT INTO `product_translations` VALUES (40, 'Shuxiang home anti bacterial anti mite waterproof bed li three pieces set', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/0s08Lad24qYKHVEaLsywPh1AYcNPnDNOXq5RunF7.png\" alt=\"\" width=\"747\" height=\"1035\" /></p>', 'shuxiang-home-anti-bacterial-anti-mite-waterproof-bed-li-three-pieces-set', NULL, NULL, NULL, 'en-US', '2018-10-22 03:31:09', '2018-10-22 08:17:39', 37);
INSERT INTO `product_translations` VALUES (41, 'Double bed made of silk and cotton of egypt', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/ALJ8MyiGwM0zAah8kZn4vYWrFwkW9TuXWl465XtJ.png\" alt=\"\" width=\"726\" height=\"5946\" /></p>', 'double-bed-made-of-silk-and-cotton-of-egypt', NULL, NULL, NULL, 'en-US', '2018-10-22 03:31:12', '2018-10-22 08:20:30', 38);
INSERT INTO `product_translations` VALUES (42, 'Lequan pure color cotton bed sheet single 15182 m double bed sheet student 12m springsummer bed sheet', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/aFCPxTMwkqDRUoCsEQu5wpXHeskFpjPictvNaPnK.png\" alt=\"\" width=\"696\" height=\"1498\" /></p>', 'lequan-pure-color-cotton-bed-sheet-single-15182-m-double-bed-sheet-student-12m-springsummer-bed-sheet', NULL, NULL, NULL, 'en-US', '2018-10-22 03:31:16', '2018-10-22 08:24:05', 39);
INSERT INTO `product_translations` VALUES (43, 'A sleep saving pillow', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/khB1wSnQkgh8EMe1bhGppIxlpdIeVR9GCizfA7ED.png\" alt=\"\" width=\"721\" height=\"7095\" /></p>', 'a-sleep-saving-pillow', NULL, NULL, NULL, 'en-US', '2018-10-22 03:31:20', '2018-10-22 08:24:27', 40);
INSERT INTO `product_translations` VALUES (44, '150d density relief of cervical pain', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/DH3otUPsLSe6iuHgkBc2LCe4JyjQ9ig1sWI2b60i.png\" alt=\"\" width=\"734\" height=\"3865\" /></p>', '150d-density-relief-of-cervical-pain', NULL, NULL, NULL, 'en-US', '2018-10-22 03:31:22', '2018-10-22 08:26:49', 41);
INSERT INTO `product_translations` VALUES (45, 'Web celebrity cosmetic storage box extra large drawer type portable transparent table clean skin care products shelf dustproof', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/UFKOVblgZePdL08ipnAcdOWchLKOAVPEBSiBIx30.png\" alt=\"\" width=\"695\" height=\"7218\" /></p>', 'web-celebrity-cosmetic-storage-box-extra-large-drawer-type-portable-transparent-table-clean-skin-care-products-shelf-dustproof', NULL, NULL, NULL, 'en-US', '2018-10-22 03:31:24', '2018-10-22 08:29:47', 42);
INSERT INTO `product_translations` VALUES (46, 'Cotton and linen folding bin bag packing case home goods bin chest cloth bra drawer', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/2Gor6xqSJqgTgTX9m5dRtrbROsQ7JZvDFOq62gvJ.png\" alt=\"\" width=\"720\" height=\"7417\" /></p>', 'cotton-and-linen-folding-bin-bag-packing-case-home-goods-bin-chest-cloth-bra-drawer', NULL, NULL, NULL, 'en-US', '2018-10-22 03:31:27', '2018-10-22 08:31:34', 43);
INSERT INTO `product_translations` VALUES (47, 'Car trunk storage box plastic storage box multi functional storage box folding packaging box car rear box', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/AW9eZf4JUrkQhGShTEkvDgthfYVQrMzKnhRs6iP7.png\" alt=\"\" width=\"698\" height=\"580\" /></p>', 'car-trunk-storage-box-plastic-storage-box-multi-functional-storage-box-folding-packaging-box-car-rear-box', NULL, NULL, NULL, 'en-US', '2018-10-22 03:31:31', '2018-10-22 08:32:02', 44);
INSERT INTO `product_translations` VALUES (48, 'Merope cosmetics sub bottle spray bottle shampoo travel sub bottle emulsion 6 sets transparent color', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/EFPkj96IO3aPBPMZwEWffecegknkQ3FMrBsHFWnP.png\" alt=\"\" width=\"688\" height=\"7791\" /></p>', 'merope-cosmetics-sub-bottle-spray-bottle-shampoo-travel-sub-bottle-emulsion-6-sets-transparent-color', NULL, NULL, NULL, 'en-US', '2018-10-22 03:31:33', '2018-10-22 08:33:53', 45);
INSERT INTO `product_translations` VALUES (49, 'Five pairs of disposable underwear men and women travelling bei an pure cotton non paper underwear postpartum cotton children wash free shorts', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/IFrYazjiS2kYpm9SqwbpYAN2IJZah3OYgUC3ACGk.bin\" alt=\"\" /><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/CuAYxBIaBONOBzWMGmuBQj7Fn4h9Qv0BbiuCeSu2.png\" alt=\"\" width=\"304\" height=\"273\" /></p>', 'five-pairs-of-disposable-underwear-men-and-women-travelling-bei-an-pure-cotton-non-paper-underwear-postpartum-cotton-children-wash-free-shorts', NULL, NULL, NULL, 'en-US', '2018-10-22 03:31:35', '2018-10-22 08:48:48', 46);
INSERT INTO `product_translations` VALUES (50, 'Zichu pregnant womens pure cotton sanitary underwear disposable cotton products postpartum', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/9Ej9ZgMj35fPnYQcwb7DZI8L1u0uKHRUnOplWNDQ.png\" alt=\"\" width=\"629\" height=\"2799\" /></p>', 'zichu-pregnant-womens-pure-cotton-sanitary-underwear-disposable-cotton-products-postpartum', NULL, NULL, NULL, 'en-US', '2018-10-22 03:31:37', '2018-10-22 08:48:58', 47);
INSERT INTO `product_translations` VALUES (51, 'Aag baby rice paste scoop bottle squeeze baby feeding spoon silica gel feeder complementary spoon wholesale', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/zafSQE3hH7TbC3itjclyZvfMCzN2yJ6qM0m8gHbh.png\" alt=\"\" width=\"761\" height=\"7198\" /></p>', 'aag-baby-rice-paste-scoop-bottle-squeeze-baby-feeding-spoon-silica-gel-feeder-complementary-spoon-wholesale', NULL, NULL, NULL, 'en-US', '2018-10-22 03:31:40', '2018-10-22 10:28:17', 48);
INSERT INTO `product_translations` VALUES (52, 'Pet water dispenser pet water dispenser cat water dispenser hanging teddy automatic feeder water bowl toiletries', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/Vce5Kvns5grtK1I4Y4JwFcuqPfQ5lYQD8xaOfDJf.png\" alt=\"\" width=\"763\" height=\"8809\" /></p>', 'pet-water-dispenser-pet-water-dispenser-cat-water-dispenser-hanging-teddy-automatic-feeder-water-bowl-toiletries', NULL, NULL, NULL, 'en-US', '2018-10-22 03:31:43', '2018-10-22 08:49:23', 49);
INSERT INTO `product_translations` VALUES (53, 'Pet out food cup dog teddy big dog portable feeder water feeder outdoor kettle out supplies', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/FXSmDXi0WZlcyyXcNML5RB2w86jwnbBhq1IRhmJM.png\" alt=\"\" width=\"753\" height=\"581\" /></p>', 'pet-out-food-cup-dog-teddy-big-dog-portable-feeder-water-feeder-outdoor-kettle-out-supplies', NULL, NULL, NULL, 'en-US', '2018-10-22 03:31:44', '2018-10-22 08:44:53', 50);
INSERT INTO `product_translations` VALUES (54, 'Hartley pet accompanying cup outside water cup outdoor portable water jug water bowl dog water dispenser', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/xgX4d1UO4maMIFmtFylgXeOh8ARquYWdmoiGKmeE.png\" alt=\"\" width=\"774\" height=\"8763\" /></p>', 'hartley-pet-accompanying-cup-outside-water-cup-outdoor-portable-water-jug-water-bowl-dog-water-dispenser', NULL, NULL, NULL, 'en-US', '2018-10-22 03:31:46', '2018-10-22 08:58:57', 51);
INSERT INTO `product_translations` VALUES (55, 'Dog chain dog leash large and medium sized dog teddy golden hair dog rope pet supplies', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/Ny8I8ZWuik1OXld9kj4vxCAL0Mi3rptuzt5bvbnB.png\" alt=\"\" width=\"751\" height=\"7208\" /></p>', 'dog-chain-dog-leash-large-and-medium-sized-dog-teddy-golden-hair-dog-rope-pet-supplies', NULL, NULL, NULL, 'en-US', '2018-10-22 03:31:48', '2018-10-22 08:54:16', 52);
INSERT INTO `product_translations` VALUES (56, 'Sleeping bag four seasons general purpose cat pad deep sleep cat litter kennel web celebrity dog litter supplies warm in winter', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/OayN8IYKYcpBUCsaWD4obEV7ansPVr2G8foI5U7P.png\" alt=\"\" width=\"807\" height=\"3262\" /></p>', 'sleeping-bag-four-seasons-general-purpose-cat-pad-deep-sleep-cat-litter-kennel-web-celebrity-dog-litter-supplies-warm-in-winter', NULL, NULL, NULL, 'en-US', '2018-10-22 03:31:50', '2018-10-22 08:57:03', 53);
INSERT INTO `product_translations` VALUES (57, 'Bath and back bath balls', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/AW4KWDE5M27azFYD4A0VdXKCDZlcULW5QXCLGXN7.png\" alt=\"\" width=\"747\" height=\"2107\" /><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/kWoEzc9ruIPPl8ZNOYvIDG6MkDyzioCHIX5Ngdzg.png\" alt=\"\" width=\"748\" height=\"2952\" /></p>', 'bath-and-back-bath-balls', NULL, NULL, NULL, 'en-US', '2018-10-22 08:24:42', '2018-10-22 08:55:30', 54);
INSERT INTO `product_translations` VALUES (58, 'Add water to the humidifier on the delmar purification', NULL, '<p><img style=\"float: right;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/81FxVKbWbwzK4BUjabCiNLv5rLHIhYiDBXAS5Ko1.png\" alt=\"\" width=\"774\" height=\"6429\" /></p>', 'add-water-to-the-humidifier-on-the-delmar-purification', NULL, NULL, NULL, 'en-US', '2018-10-22 08:24:44', '2018-10-22 09:02:44', 55);
INSERT INTO `product_translations` VALUES (59, 'Creative slim desktop stand', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/lqsSwO1KMh9VbBVvcixUyAqWzRxIMdMyqK9uW6j5.png\" alt=\"\" width=\"749\" height=\"4180\" /></p>', 'creative-slim-desktop-stand', NULL, NULL, NULL, 'en-US', '2018-10-22 08:24:48', '2018-10-22 09:03:57', 56);
INSERT INTO `product_translations` VALUES (60, 'Small magic clip on car wireless charging mobile phone stand', NULL, NULL, 'small-magic-clip-on-car-wireless-charging-mobile-phone-stand', NULL, NULL, NULL, 'en-US', '2018-10-22 08:24:50', '2018-10-22 09:04:16', 57);
INSERT INTO `product_translations` VALUES (61, 'Rotating shopping bag folding storage bag', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/IQWfwSDvgeG3kYi73nimqvbi8koElhnjd2Su1kUD.png\" alt=\"\" width=\"765\" height=\"2162\" /></p>', 'rotating-shopping-bag-folding-storage-bag', NULL, NULL, NULL, 'en-US', '2018-10-22 08:24:53', '2018-10-22 09:06:14', 58);
INSERT INTO `product_translations` VALUES (62, 'Traveling wheat straw folding hanger', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/9dQp1v8E51NiYZOLB1RHRF8eLo04b2kn6Hviq7cV.png\" alt=\"\" width=\"750\" height=\"3198\" /></p>', 'traveling-wheat-straw-folding-hanger', NULL, NULL, NULL, 'en-US', '2018-10-22 08:24:55', '2018-10-22 09:07:54', 59);
INSERT INTO `product_translations` VALUES (63, 'Simple and versatile neck pillow', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/vWXBwcNjaLP3byGwZGY3AkiYKMznMcIcAdd1BnhP.png\" alt=\"\" width=\"790\" height=\"3449\" /></p>', 'simple-and-versatile-neck-pillow', NULL, NULL, NULL, 'en-US', '2018-10-22 08:24:58', '2018-10-22 09:10:43', 60);
INSERT INTO `product_translations` VALUES (64, 'Apoo rebers wireless thin mouse', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/lVKNabweAKSa0jMD2Sa0ZViyyMN5ohDz7BHCUJXW.png\" alt=\"\" width=\"789\" height=\"6718\" /></p>', 'apoo-rebers-wireless-thin-mouse', NULL, NULL, NULL, 'en-US', '2018-10-22 08:25:01', '2018-10-22 09:10:59', 61);
INSERT INTO `product_translations` VALUES (65, 'White white wire game mouse', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/6wp8DpEY5IL367zqiXJk9QJO29z2s5KcIYSLfZHX.png\" alt=\"\" width=\"747\" height=\"6811\" /></p>', 'white-white-wire-game-mouse', NULL, NULL, NULL, 'en-US', '2018-10-22 08:25:06', '2018-10-22 09:14:29', 62);
INSERT INTO `product_translations` VALUES (66, 'Qck mass mouse pad', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/D1YzCwBn5vBbmXJNqMXjmc5EPkgI1OVfGCqmYqfW.png\" alt=\"\" width=\"774\" height=\"5630\" /></p>', 'qck-mass-mouse-pad', NULL, NULL, NULL, 'en-US', '2018-10-22 08:25:09', '2018-10-22 09:14:43', 63);
INSERT INTO `product_translations` VALUES (67, 'Lena hair straightening rollers', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/YCp2RKQnez6A00XEEtk3tNjlDGVeqQJJOtCGEzCx.png\" alt=\"\" width=\"832\" height=\"3895\" /></p>', 'lena-hair-straightening-rollers', NULL, NULL, NULL, 'en-US', '2018-10-22 08:25:12', '2018-10-22 10:28:49', 64);
INSERT INTO `product_translations` VALUES (68, 'Bristle air mattress massage comb', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/vQXDuJU9JIdxiSCWEhHFsRHD3hOflTvSL4pkTnhP.png\" alt=\"\" width=\"769\" height=\"836\" /></p>', 'bristle-air-mattress-massage-comb', NULL, NULL, NULL, 'en-US', '2018-10-22 08:25:16', '2018-10-22 09:18:30', 65);
INSERT INTO `product_translations` VALUES (69, 'Cats cradle cats cradle cats cradle cats cradle', NULL, '<p style=\"text-align: center;\"><img src=\"http://pbfh6sbp9.bkt.clouddn.com/P0ko7XMQbK1PUHvyPqLQLWRSzsICrtR7qjZ3bELW.png\" alt=\"\" width=\"905\" height=\"8657\" /></p>', 'cats-cradle-cats-cradle-cats-cradle-cats-cradle', NULL, NULL, NULL, 'en-US', '2018-10-22 08:26:28', '2018-10-22 08:45:21', 66);
INSERT INTO `product_translations` VALUES (70, 'The doghouse can be removable and washed for large pet kennel teddy samo pet bed small dog kennel', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/KospSR31qPOLAx2aJlruscN05n44KooRxLvEJuMG.png\" alt=\"\" width=\"762\" height=\"4783\" /></p>', 'the-doghouse-can-be-removable-and-washed-for-large-pet-kennel-teddy-samo-pet-bed-small-dog-kennel', NULL, NULL, NULL, 'en-US', '2018-10-22 08:26:30', '2018-10-22 10:07:01', 67);
INSERT INTO `product_translations` VALUES (71, 'Teddy kennel can be removable and washed four seasons universal pet mat for large medium and small dogs to keep warm in winter web celebrity supplies', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/JGK9NtuI8PBEggHHLFOFExZiU39o8ShhZpGk3JoP.png\" alt=\"\" width=\"784\" height=\"10667\" /></p>', 'teddy-kennel-can-be-removable-and-washed-four-seasons-universal-pet-mat-for-large-medium-and-small-dogs-to-keep-warm-in-winter-web-celebrity-supplies', NULL, NULL, NULL, 'en-US', '2018-10-22 08:26:32', '2018-10-22 09:02:12', 68);
INSERT INTO `product_translations` VALUES (72, 'New american air permeable cat hammock sucker cat litter cat cage cat bed to support 26 kg', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/C1NO9es0rSfAlAj1d4WXKVaQLeFexpWZflcCauPS.png\" alt=\"\" width=\"739\" height=\"3585\" /></p>', 'new-american-air-permeable-cat-hammock-sucker-cat-litter-cat-cage-cat-bed-to-support-26-kg', NULL, NULL, NULL, 'en-US', '2018-10-22 08:26:35', '2018-10-22 09:04:41', 69);
INSERT INTO `product_translations` VALUES (73, 'Hot black non stick steel knife set', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/HyUPPuxLzQY89mtORkXcc6bmYyz7fKOxDwPiSJxv.png\" alt=\"\" width=\"762\" height=\"7331\" /></p>', 'hot-black-non-stick-steel-knife-set', NULL, NULL, NULL, 'en-US', '2018-10-22 08:26:37', '2018-10-22 09:13:55', 70);
INSERT INTO `product_translations` VALUES (74, 'Qiao ah po ceramic kitchen knife black blade cut vegetables fruit knife kitchen narrow chef slice slice watermelon ceramic knife', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/xye21ousQfv6VI6RsONC0eRERG6xtS3FgMKUXDc1.png\" alt=\"\" width=\"661\" height=\"4110\" /></p>', 'qiao-ah-po-ceramic-kitchen-knife-black-blade-cut-vegetables-fruit-knife-kitchen-narrow-chef-slice-slice-watermelon-ceramic-knife', NULL, NULL, NULL, 'en-US', '2018-10-22 08:26:38', '2018-10-22 09:14:37', 71);
INSERT INTO `product_translations` VALUES (75, 'Ceramic knife set kitchen knife knife fruit peeler black blade', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/8dZTCBn04FqLkXryF5HKEOmIU0Q9dZ49ikY4mCYL.png\" alt=\"\" width=\"722\" height=\"688\" /></p>\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/ckYtYhed6xrJxOg0wScrN82pnh0dKFcxLOCzk1Ks.png\" alt=\"\" width=\"696\" height=\"714\" /></p>\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/Gsyfu5oDlIr53JEMbzfU37KaCGgTYGEvAOxPWaOG.png\" alt=\"\" width=\"523\" height=\"121\" /></p>\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/A9wSGiB9TzqB64tWfDwYMI2RSQOEIlN174OsrD5J.png\" alt=\"\" width=\"743\" height=\"642\" /></p>\n<p>&nbsp;</p>', 'ceramic-knife-set-kitchen-knife-knife-fruit-peeler-black-blade', NULL, NULL, NULL, 'en-US', '2018-10-22 08:26:40', '2018-10-22 09:17:08', 72);
INSERT INTO `product_translations` VALUES (76, 'Oou knife set stainless steel 7 piece set knife kitchen kitchen knife set esther solid wood 7 piece set', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/fQgboMJsMHIeSBhyRqqesLl8UdrKbeDx9e671X0s.png\" alt=\"\" width=\"693\" height=\"11898\" /></p>', 'oou-knife-set-stainless-steel-7-piece-set-knife-kitchen-kitchen-knife-set-esther-solid-wood-7-piece-set', NULL, NULL, NULL, 'en-US', '2018-10-22 08:26:42', '2018-10-22 09:24:47', 73);
INSERT INTO `product_translations` VALUES (77, 'Touch series ultra rose sliding underpants sharing outfit', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/iB0C1Z5a7ZX6Wpzcl3QBNfY8jPuh5zSYJaWpfUik.png\" alt=\"\" width=\"760\" height=\"4301\" /></p>\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/i9eOa6L03cXmyuRo2UfS5mZW76ARXq3wcc5e1o1R.png\" alt=\"\" width=\"739\" height=\"4838\" /></p>', 'touch-series-ultra-rose-sliding-underpants-sharing-outfit', NULL, NULL, NULL, 'en-US', '2018-10-22 08:26:44', '2018-10-22 09:25:00', 74);
INSERT INTO `product_translations` VALUES (78, 'Cottonsmith mini window dry womens panties 3 pieces whitelight pink single box m', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/TANOLCAryi5QRoLM5iT74N6kuSjzHQ1iKxd64NJt.png\" alt=\"\" width=\"789\" height=\"7597\" /></p>\n<p>&nbsp;</p>', 'cottonsmith-mini-window-dry-womens-panties-3-pieces-whitelight-pink-single-box-m', NULL, NULL, NULL, 'en-US', '2018-10-22 08:26:46', '2018-10-22 09:22:56', 75);
INSERT INTO `product_translations` VALUES (79, 'Simple mens casual socks', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/kUn9jtLqqtQtSdZxmIBn0fSM3fsIvUkfDGG3k8wi.png\" alt=\"\" width=\"737\" height=\"6669\" /></p>', 'simple-mens-casual-socks', NULL, NULL, NULL, 'en-US', '2018-10-22 08:26:49', '2018-10-22 09:30:25', 76);
INSERT INTO `product_translations` VALUES (80, 'Menna ship socks women socks summer invisible socks shallow mouth anti skid silicone spring summer day thin skin to prevent heel', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/xj7H4DSwLJx7iMyXxedWvWo4BoyMsW9b9xZTg4n1.png\" alt=\"\" width=\"392\" height=\"364\" /></p>\n<p style=\"text-align: center;\"><img src=\"http://pbfh6sbp9.bkt.clouddn.com/yiXhrTmdM1OUozFawQiDBaTJxWGMjnlsqowOaF0D.png\" alt=\"\" width=\"387\" height=\"306\" /></p>\n<p style=\"text-align: center;\"><img src=\"http://pbfh6sbp9.bkt.clouddn.com/DNzhVPeg5um05Nkv9xvuHXjkmBO1TU1w6EVfkg6L.png\" alt=\"\" width=\"393\" height=\"311\" /></p>\n<p style=\"text-align: center;\"><img src=\"http://pbfh6sbp9.bkt.clouddn.com/81fhAFL7Qp7TySNJayobbrQnnR6z3GNC4sbLotEy.png\" alt=\"\" width=\"695\" height=\"437\" /></p>\n<p style=\"text-align: center;\"><img src=\"http://pbfh6sbp9.bkt.clouddn.com/UthEThj0AicTJ1pFKkj1qPDGIaiFd6vfQKQFqub8.png\" alt=\"\" width=\"696\" height=\"492\" /></p>\n<p style=\"text-align: center;\"><img src=\"http://pbfh6sbp9.bkt.clouddn.com/z0JouKhI6aOg4DTNDcE3Xac46BkSvgnSnhaLFgoo.png\" alt=\"\" width=\"632\" height=\"597\" /></p>\n<p style=\"text-align: center;\"><img src=\"http://pbfh6sbp9.bkt.clouddn.com/E4NWFUONUGob6A1kbaUUSNbrjfKwBUXC49NXe0Hd.png\" alt=\"\" width=\"394\" height=\"343\" /></p>\n<p style=\"text-align: center;\"><img src=\"http://pbfh6sbp9.bkt.clouddn.com/uKmeddZfc9jQKqMtF4Hd1wo9hJEERjsexzC7U8sy.png\" alt=\"\" width=\"683\" height=\"362\" /></p>\n<p style=\"text-align: center;\"><img src=\"http://pbfh6sbp9.bkt.clouddn.com/sJ5WLUykh03hqS72H3cMWA0FeK3icXH5dwiBqvLW.png\" alt=\"\" width=\"668\" height=\"563\" /></p>', 'menna-ship-socks-women-socks-summer-invisible-socks-shallow-mouth-anti-skid-silicone-spring-summer-day-thin-skin-to-prevent-heel', NULL, NULL, NULL, 'en-US', '2018-10-22 08:26:52', '2018-10-22 09:30:31', 77);
INSERT INTO `product_translations` VALUES (81, 'Natural bamboo cutting board thickened non joint non slip cutting board', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/3AzltO1NXkcs1VvSrXwKoNODiSffK5Fp5VfWyhHI.png\" alt=\"\" width=\"511\" height=\"376\" /><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/LOqJPYY183y3CGv7b0F2y4jKsNjcwmHWVR6GcNcS.png\" alt=\"\" width=\"466\" height=\"405\" /><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/TY6w61W0eGgLfB3pbeWOUbDFC3ykjYaTCBKcxEol.png\" alt=\"\" width=\"477\" height=\"469\" /><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/iDEvCy8EVBjE3sQgiVw1JeEgWt7xuoI2cSuQ4K6U.png\" alt=\"\" width=\"477\" height=\"364\" /></p>', 'natural-bamboo-cutting-board-thickened-non-joint-non-slip-cutting-board', NULL, NULL, NULL, 'en-US', '2018-10-22 08:26:55', '2018-10-22 09:32:58', 78);
INSERT INTO `product_translations` VALUES (82, 'Original wood too round wooden cutting board solid wood healthy cutting board multi functional environmental protection mould proof wooden kitchen cutting board', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/wrPYexH8jR5xeNHv5MuQADLztVWvxcdSeFSssOMY.png\" alt=\"\" width=\"735\" height=\"4067\" /></p>\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/djcnTllO2ohvZs6Ce6bwtfvUE2CluV4vW0aqzkUn.png\" alt=\"\" width=\"729\" height=\"4325\" /></p>', 'original-wood-too-round-wooden-cutting-board-solid-wood-healthy-cutting-board-multi-functional-environmental-protection-mould-proof-wooden-kitchen-cutting-board', NULL, NULL, NULL, 'en-US', '2018-10-22 08:26:57', '2018-10-22 10:29:18', 79);
INSERT INTO `product_translations` VALUES (83, 'Non shedding water absorbent cloth thickened double layer fine fiber wipe table cloth kitchen cleaning dish towel washing dish cloth', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/UNjcEqbap6Zn9ePz9TPzCyyXqiAK1mXS9A6n6Ov9.png\" alt=\"\" width=\"758\" height=\"5701\" /></p>', 'non-shedding-water-absorbent-cloth-thickened-double-layer-fine-fiber-wipe-table-cloth-kitchen-cleaning-dish-towel-washing-dish-cloth', NULL, NULL, NULL, 'en-US', '2018-10-22 08:26:59', '2018-10-22 10:29:45', 80);
INSERT INTO `product_translations` VALUES (84, 'Double color double sided absorbent dish cloth oil wipe towel thickened cloth wipe table cloth kitchen ragdouble color double sided absorbent dish cloth oil wipe towel thickened cloth wipe table cloth kitchen rag', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/Xz0801AYc9Pw50E8SKc2bx0fRTpqdVWBQylP02XA.png\" alt=\"\" width=\"763\" height=\"7991\" /></p>', 'double-color-double-sided-absorbent-dish-cloth-oil-wipe-towel-thickened-cloth-wipe-table-cloth-kitchen-ragdouble-color-double-sided-absorbent-dish-cloth-oil-wipe-towel-thickened-cloth-wipe-table-cloth-kitchen-rag', NULL, NULL, NULL, 'en-US', '2018-10-22 08:27:02', '2018-10-22 09:40:11', 81);
INSERT INTO `product_translations` VALUES (85, 'Nylon pot brush with long handle wood does not hurt the pot brush does not stick oil wash dishes wash creative brush', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/cc24KXi7I9wOpO1ipIT9TIDPK9egDEbFIML51C11.png\" alt=\"\" width=\"770\" height=\"11872\" /></p>', 'nylon-pot-brush-with-long-handle-wood-does-not-hurt-the-pot-brush-does-not-stick-oil-wash-dishes-wash-creative-brush', NULL, NULL, NULL, 'en-US', '2018-10-22 08:27:04', '2018-10-22 09:49:28', 82);
INSERT INTO `product_translations` VALUES (86, 'Kitchen brush pan brush creative soap brush hand soap brush press on the pan and wash the dishes', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/mKU7Sk8iMEfmpOC8I9ESUFZDLcL1V2L8dEIMCfDZ.png\" alt=\"\" width=\"749\" height=\"5895\" /></p>', 'kitchen-brush-pan-brush-creative-soap-brush-hand-soap-brush-press-on-the-pan-and-wash-the-dishes', NULL, NULL, NULL, 'en-US', '2018-10-22 08:27:06', '2018-10-22 09:50:33', 83);
INSERT INTO `product_translations` VALUES (87, 'Ice and fire magic subdivision thermos cup', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/ZZkffU6DTzs0DH3ZzWVlRZVdCkF6NGVrLzwU9n7o.png\" alt=\"\" width=\"765\" height=\"11719\" /></p>', 'ice-and-fire-magic-subdivision-thermos-cup', NULL, NULL, NULL, 'en-US', '2018-10-22 08:27:08', '2018-10-22 09:50:25', 84);
INSERT INTO `product_translations` VALUES (88, 'Light smart accompanying vacuum cup', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/AifJI5VFcp53HbYsCj2MN4obWqt8B9IdqUogejn3.png\" alt=\"\" width=\"760\" height=\"11520\" /></p>\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://pbfh6sbp9.bkt.clouddn.com/KWPPBil0GSgRWUTVBlxo2N1I7JuofqFQ7z8rGm29.png\" alt=\"\" width=\"763\" height=\"6219\" /></p>', 'light-smart-accompanying-vacuum-cup', NULL, NULL, NULL, 'en-US', '2018-10-22 08:27:11', '2018-10-22 10:30:12', 85);
INSERT INTO `product_translations` VALUES (90, 'Household portable projector', NULL, '<p><img src=\"http://pbfh6sbp9.bkt.clouddn.com/LtVZmiSvEKWAC2ySL9ljax5Vdrn4FP1JB1FbwhJP.png\" alt=\"\" width=\"700\" height=\"4819\" /></p>', 'household-portable-projector', NULL, NULL, NULL, 'en-US', '2018-10-24 03:40:46', '2018-10-24 08:58:51', 86);
COMMIT;

-- ----------------------------
-- Table structure for product_variant_option_value
-- ----------------------------
DROP TABLE IF EXISTS `product_variant_option_value`;
CREATE TABLE `product_variant_option_value` (
  `variant_id` int(10) unsigned NOT NULL,
  `option_value_id` int(10) unsigned NOT NULL,
  KEY `product_variant_option_value_variant_id_index` (`variant_id`),
  KEY `product_variant_option_value_option_value_id_index` (`option_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_variant_option_value
-- ----------------------------
BEGIN;
INSERT INTO `product_variant_option_value` VALUES (1, 5);
INSERT INTO `product_variant_option_value` VALUES (2, 5);
INSERT INTO `product_variant_option_value` VALUES (3, 2);
INSERT INTO `product_variant_option_value` VALUES (4, 3);
INSERT INTO `product_variant_option_value` VALUES (5, 6);
INSERT INTO `product_variant_option_value` VALUES (6, 5);
INSERT INTO `product_variant_option_value` VALUES (7, 5);
INSERT INTO `product_variant_option_value` VALUES (8, 5);
INSERT INTO `product_variant_option_value` VALUES (9, 1);
INSERT INTO `product_variant_option_value` VALUES (10, 5);
INSERT INTO `product_variant_option_value` VALUES (11, 5);
INSERT INTO `product_variant_option_value` VALUES (12, 5);
INSERT INTO `product_variant_option_value` VALUES (12, 7);
INSERT INTO `product_variant_option_value` VALUES (13, 1);
INSERT INTO `product_variant_option_value` VALUES (13, 7);
INSERT INTO `product_variant_option_value` VALUES (14, 1);
INSERT INTO `product_variant_option_value` VALUES (14, 8);
INSERT INTO `product_variant_option_value` VALUES (15, 5);
INSERT INTO `product_variant_option_value` VALUES (15, 8);
INSERT INTO `product_variant_option_value` VALUES (16, 1);
INSERT INTO `product_variant_option_value` VALUES (17, 5);
INSERT INTO `product_variant_option_value` VALUES (18, 1);
INSERT INTO `product_variant_option_value` VALUES (19, 9);
INSERT INTO `product_variant_option_value` VALUES (20, 10);
INSERT INTO `product_variant_option_value` VALUES (21, 5);
INSERT INTO `product_variant_option_value` VALUES (22, 1);
INSERT INTO `product_variant_option_value` VALUES (23, 3);
INSERT INTO `product_variant_option_value` VALUES (24, 5);
INSERT INTO `product_variant_option_value` VALUES (25, 11);
INSERT INTO `product_variant_option_value` VALUES (26, 2);
INSERT INTO `product_variant_option_value` VALUES (26, 12);
INSERT INTO `product_variant_option_value` VALUES (27, 2);
INSERT INTO `product_variant_option_value` VALUES (27, 13);
INSERT INTO `product_variant_option_value` VALUES (28, 5);
INSERT INTO `product_variant_option_value` VALUES (28, 12);
INSERT INTO `product_variant_option_value` VALUES (29, 5);
INSERT INTO `product_variant_option_value` VALUES (29, 13);
INSERT INTO `product_variant_option_value` VALUES (30, 5);
INSERT INTO `product_variant_option_value` VALUES (31, 2);
INSERT INTO `product_variant_option_value` VALUES (32, 5);
INSERT INTO `product_variant_option_value` VALUES (33, 2);
INSERT INTO `product_variant_option_value` VALUES (34, 1);
INSERT INTO `product_variant_option_value` VALUES (35, 14);
INSERT INTO `product_variant_option_value` VALUES (36, 4);
INSERT INTO `product_variant_option_value` VALUES (37, 15);
INSERT INTO `product_variant_option_value` VALUES (38, 1);
INSERT INTO `product_variant_option_value` VALUES (39, 9);
INSERT INTO `product_variant_option_value` VALUES (40, 10);
INSERT INTO `product_variant_option_value` VALUES (41, 14);
INSERT INTO `product_variant_option_value` VALUES (42, 16);
INSERT INTO `product_variant_option_value` VALUES (43, 17);
INSERT INTO `product_variant_option_value` VALUES (44, 18);
INSERT INTO `product_variant_option_value` VALUES (46, 1);
INSERT INTO `product_variant_option_value` VALUES (47, 9);
INSERT INTO `product_variant_option_value` VALUES (48, 2);
INSERT INTO `product_variant_option_value` VALUES (49, 3);
INSERT INTO `product_variant_option_value` VALUES (50, 9);
INSERT INTO `product_variant_option_value` VALUES (51, 9);
INSERT INTO `product_variant_option_value` VALUES (52, 2);
INSERT INTO `product_variant_option_value` VALUES (53, 1);
INSERT INTO `product_variant_option_value` VALUES (55, 3);
INSERT INTO `product_variant_option_value` VALUES (56, 14);
INSERT INTO `product_variant_option_value` VALUES (57, 15);
INSERT INTO `product_variant_option_value` VALUES (59, 19);
INSERT INTO `product_variant_option_value` VALUES (60, 5);
INSERT INTO `product_variant_option_value` VALUES (61, 5);
INSERT INTO `product_variant_option_value` VALUES (62, 15);
INSERT INTO `product_variant_option_value` VALUES (63, 5);
INSERT INTO `product_variant_option_value` VALUES (64, 20);
INSERT INTO `product_variant_option_value` VALUES (65, 21);
INSERT INTO `product_variant_option_value` VALUES (66, 5);
INSERT INTO `product_variant_option_value` VALUES (67, 3);
INSERT INTO `product_variant_option_value` VALUES (68, 1);
INSERT INTO `product_variant_option_value` VALUES (69, 22);
INSERT INTO `product_variant_option_value` VALUES (70, 23);
INSERT INTO `product_variant_option_value` VALUES (71, 9);
INSERT INTO `product_variant_option_value` VALUES (72, 24);
INSERT INTO `product_variant_option_value` VALUES (73, 1);
INSERT INTO `product_variant_option_value` VALUES (73, 25);
INSERT INTO `product_variant_option_value` VALUES (74, 1);
INSERT INTO `product_variant_option_value` VALUES (74, 26);
INSERT INTO `product_variant_option_value` VALUES (75, 1);
INSERT INTO `product_variant_option_value` VALUES (75, 27);
INSERT INTO `product_variant_option_value` VALUES (76, 1);
INSERT INTO `product_variant_option_value` VALUES (76, 28);
INSERT INTO `product_variant_option_value` VALUES (77, 1);
INSERT INTO `product_variant_option_value` VALUES (77, 29);
INSERT INTO `product_variant_option_value` VALUES (78, 19);
INSERT INTO `product_variant_option_value` VALUES (78, 25);
INSERT INTO `product_variant_option_value` VALUES (79, 19);
INSERT INTO `product_variant_option_value` VALUES (79, 26);
INSERT INTO `product_variant_option_value` VALUES (80, 19);
INSERT INTO `product_variant_option_value` VALUES (80, 27);
INSERT INTO `product_variant_option_value` VALUES (81, 19);
INSERT INTO `product_variant_option_value` VALUES (81, 28);
INSERT INTO `product_variant_option_value` VALUES (82, 19);
INSERT INTO `product_variant_option_value` VALUES (82, 29);
INSERT INTO `product_variant_option_value` VALUES (83, 2);
INSERT INTO `product_variant_option_value` VALUES (83, 25);
INSERT INTO `product_variant_option_value` VALUES (84, 2);
INSERT INTO `product_variant_option_value` VALUES (84, 26);
INSERT INTO `product_variant_option_value` VALUES (85, 2);
INSERT INTO `product_variant_option_value` VALUES (85, 27);
INSERT INTO `product_variant_option_value` VALUES (86, 2);
INSERT INTO `product_variant_option_value` VALUES (86, 28);
INSERT INTO `product_variant_option_value` VALUES (87, 2);
INSERT INTO `product_variant_option_value` VALUES (87, 29);
INSERT INTO `product_variant_option_value` VALUES (88, 15);
INSERT INTO `product_variant_option_value` VALUES (88, 25);
INSERT INTO `product_variant_option_value` VALUES (89, 15);
INSERT INTO `product_variant_option_value` VALUES (89, 26);
INSERT INTO `product_variant_option_value` VALUES (90, 15);
INSERT INTO `product_variant_option_value` VALUES (90, 27);
INSERT INTO `product_variant_option_value` VALUES (91, 15);
INSERT INTO `product_variant_option_value` VALUES (91, 28);
INSERT INTO `product_variant_option_value` VALUES (92, 15);
INSERT INTO `product_variant_option_value` VALUES (92, 29);
INSERT INTO `product_variant_option_value` VALUES (93, 5);
INSERT INTO `product_variant_option_value` VALUES (93, 25);
INSERT INTO `product_variant_option_value` VALUES (94, 5);
INSERT INTO `product_variant_option_value` VALUES (94, 26);
INSERT INTO `product_variant_option_value` VALUES (95, 5);
INSERT INTO `product_variant_option_value` VALUES (95, 27);
INSERT INTO `product_variant_option_value` VALUES (96, 5);
INSERT INTO `product_variant_option_value` VALUES (96, 28);
INSERT INTO `product_variant_option_value` VALUES (97, 5);
INSERT INTO `product_variant_option_value` VALUES (97, 29);
INSERT INTO `product_variant_option_value` VALUES (98, 30);
INSERT INTO `product_variant_option_value` VALUES (99, 31);
INSERT INTO `product_variant_option_value` VALUES (100, 32);
INSERT INTO `product_variant_option_value` VALUES (101, 26);
INSERT INTO `product_variant_option_value` VALUES (102, 27);
INSERT INTO `product_variant_option_value` VALUES (103, 28);
INSERT INTO `product_variant_option_value` VALUES (104, 29);
INSERT INTO `product_variant_option_value` VALUES (105, 33);
INSERT INTO `product_variant_option_value` VALUES (106, 34);
INSERT INTO `product_variant_option_value` VALUES (106, 37);
INSERT INTO `product_variant_option_value` VALUES (107, 34);
INSERT INTO `product_variant_option_value` VALUES (107, 38);
INSERT INTO `product_variant_option_value` VALUES (108, 34);
INSERT INTO `product_variant_option_value` VALUES (108, 39);
INSERT INTO `product_variant_option_value` VALUES (109, 34);
INSERT INTO `product_variant_option_value` VALUES (109, 40);
INSERT INTO `product_variant_option_value` VALUES (110, 35);
INSERT INTO `product_variant_option_value` VALUES (110, 37);
INSERT INTO `product_variant_option_value` VALUES (111, 35);
INSERT INTO `product_variant_option_value` VALUES (111, 38);
INSERT INTO `product_variant_option_value` VALUES (112, 35);
INSERT INTO `product_variant_option_value` VALUES (112, 39);
INSERT INTO `product_variant_option_value` VALUES (113, 35);
INSERT INTO `product_variant_option_value` VALUES (113, 40);
INSERT INTO `product_variant_option_value` VALUES (114, 36);
INSERT INTO `product_variant_option_value` VALUES (114, 37);
INSERT INTO `product_variant_option_value` VALUES (115, 36);
INSERT INTO `product_variant_option_value` VALUES (115, 38);
INSERT INTO `product_variant_option_value` VALUES (116, 36);
INSERT INTO `product_variant_option_value` VALUES (116, 39);
INSERT INTO `product_variant_option_value` VALUES (117, 36);
INSERT INTO `product_variant_option_value` VALUES (117, 40);
INSERT INTO `product_variant_option_value` VALUES (118, 38);
INSERT INTO `product_variant_option_value` VALUES (119, 39);
INSERT INTO `product_variant_option_value` VALUES (120, 40);
INSERT INTO `product_variant_option_value` VALUES (121, 41);
INSERT INTO `product_variant_option_value` VALUES (122, 42);
INSERT INTO `product_variant_option_value` VALUES (123, 15);
INSERT INTO `product_variant_option_value` VALUES (123, 44);
INSERT INTO `product_variant_option_value` VALUES (124, 15);
INSERT INTO `product_variant_option_value` VALUES (124, 45);
INSERT INTO `product_variant_option_value` VALUES (125, 15);
INSERT INTO `product_variant_option_value` VALUES (125, 46);
INSERT INTO `product_variant_option_value` VALUES (126, 15);
INSERT INTO `product_variant_option_value` VALUES (126, 47);
INSERT INTO `product_variant_option_value` VALUES (127, 15);
INSERT INTO `product_variant_option_value` VALUES (127, 48);
INSERT INTO `product_variant_option_value` VALUES (128, 9);
INSERT INTO `product_variant_option_value` VALUES (128, 44);
INSERT INTO `product_variant_option_value` VALUES (129, 9);
INSERT INTO `product_variant_option_value` VALUES (129, 45);
INSERT INTO `product_variant_option_value` VALUES (130, 9);
INSERT INTO `product_variant_option_value` VALUES (130, 46);
INSERT INTO `product_variant_option_value` VALUES (131, 9);
INSERT INTO `product_variant_option_value` VALUES (131, 47);
INSERT INTO `product_variant_option_value` VALUES (132, 9);
INSERT INTO `product_variant_option_value` VALUES (132, 48);
INSERT INTO `product_variant_option_value` VALUES (133, 5);
INSERT INTO `product_variant_option_value` VALUES (133, 44);
INSERT INTO `product_variant_option_value` VALUES (134, 5);
INSERT INTO `product_variant_option_value` VALUES (134, 45);
INSERT INTO `product_variant_option_value` VALUES (135, 5);
INSERT INTO `product_variant_option_value` VALUES (135, 46);
INSERT INTO `product_variant_option_value` VALUES (136, 5);
INSERT INTO `product_variant_option_value` VALUES (136, 47);
INSERT INTO `product_variant_option_value` VALUES (137, 5);
INSERT INTO `product_variant_option_value` VALUES (137, 48);
INSERT INTO `product_variant_option_value` VALUES (138, 3);
INSERT INTO `product_variant_option_value` VALUES (138, 44);
INSERT INTO `product_variant_option_value` VALUES (139, 3);
INSERT INTO `product_variant_option_value` VALUES (139, 45);
INSERT INTO `product_variant_option_value` VALUES (140, 3);
INSERT INTO `product_variant_option_value` VALUES (140, 46);
INSERT INTO `product_variant_option_value` VALUES (141, 3);
INSERT INTO `product_variant_option_value` VALUES (141, 47);
INSERT INTO `product_variant_option_value` VALUES (142, 3);
INSERT INTO `product_variant_option_value` VALUES (142, 48);
INSERT INTO `product_variant_option_value` VALUES (143, 20);
INSERT INTO `product_variant_option_value` VALUES (143, 44);
INSERT INTO `product_variant_option_value` VALUES (144, 20);
INSERT INTO `product_variant_option_value` VALUES (144, 45);
INSERT INTO `product_variant_option_value` VALUES (145, 20);
INSERT INTO `product_variant_option_value` VALUES (145, 46);
INSERT INTO `product_variant_option_value` VALUES (146, 20);
INSERT INTO `product_variant_option_value` VALUES (146, 47);
INSERT INTO `product_variant_option_value` VALUES (147, 20);
INSERT INTO `product_variant_option_value` VALUES (147, 48);
INSERT INTO `product_variant_option_value` VALUES (148, 14);
INSERT INTO `product_variant_option_value` VALUES (148, 44);
INSERT INTO `product_variant_option_value` VALUES (149, 14);
INSERT INTO `product_variant_option_value` VALUES (149, 45);
INSERT INTO `product_variant_option_value` VALUES (150, 14);
INSERT INTO `product_variant_option_value` VALUES (150, 46);
INSERT INTO `product_variant_option_value` VALUES (151, 14);
INSERT INTO `product_variant_option_value` VALUES (151, 47);
INSERT INTO `product_variant_option_value` VALUES (152, 14);
INSERT INTO `product_variant_option_value` VALUES (152, 48);
INSERT INTO `product_variant_option_value` VALUES (153, 43);
INSERT INTO `product_variant_option_value` VALUES (153, 44);
INSERT INTO `product_variant_option_value` VALUES (154, 43);
INSERT INTO `product_variant_option_value` VALUES (154, 45);
INSERT INTO `product_variant_option_value` VALUES (155, 43);
INSERT INTO `product_variant_option_value` VALUES (155, 46);
INSERT INTO `product_variant_option_value` VALUES (156, 43);
INSERT INTO `product_variant_option_value` VALUES (156, 47);
INSERT INTO `product_variant_option_value` VALUES (157, 43);
INSERT INTO `product_variant_option_value` VALUES (157, 48);
INSERT INTO `product_variant_option_value` VALUES (158, 49);
INSERT INTO `product_variant_option_value` VALUES (159, 50);
INSERT INTO `product_variant_option_value` VALUES (160, 51);
INSERT INTO `product_variant_option_value` VALUES (161, 52);
INSERT INTO `product_variant_option_value` VALUES (162, 53);
INSERT INTO `product_variant_option_value` VALUES (163, 54);
INSERT INTO `product_variant_option_value` VALUES (164, 55);
INSERT INTO `product_variant_option_value` VALUES (165, 56);
INSERT INTO `product_variant_option_value` VALUES (166, 2);
INSERT INTO `product_variant_option_value` VALUES (167, 9);
INSERT INTO `product_variant_option_value` VALUES (168, 15);
INSERT INTO `product_variant_option_value` VALUES (169, 5);
INSERT INTO `product_variant_option_value` VALUES (170, 2);
INSERT INTO `product_variant_option_value` VALUES (170, 57);
INSERT INTO `product_variant_option_value` VALUES (171, 9);
INSERT INTO `product_variant_option_value` VALUES (171, 58);
INSERT INTO `product_variant_option_value` VALUES (171, 60);
INSERT INTO `product_variant_option_value` VALUES (172, 9);
INSERT INTO `product_variant_option_value` VALUES (172, 58);
INSERT INTO `product_variant_option_value` VALUES (172, 61);
INSERT INTO `product_variant_option_value` VALUES (173, 9);
INSERT INTO `product_variant_option_value` VALUES (173, 59);
INSERT INTO `product_variant_option_value` VALUES (173, 60);
INSERT INTO `product_variant_option_value` VALUES (174, 9);
INSERT INTO `product_variant_option_value` VALUES (174, 59);
INSERT INTO `product_variant_option_value` VALUES (174, 61);
INSERT INTO `product_variant_option_value` VALUES (175, 15);
INSERT INTO `product_variant_option_value` VALUES (175, 58);
INSERT INTO `product_variant_option_value` VALUES (175, 60);
INSERT INTO `product_variant_option_value` VALUES (176, 15);
INSERT INTO `product_variant_option_value` VALUES (176, 58);
INSERT INTO `product_variant_option_value` VALUES (176, 61);
INSERT INTO `product_variant_option_value` VALUES (177, 15);
INSERT INTO `product_variant_option_value` VALUES (177, 59);
INSERT INTO `product_variant_option_value` VALUES (177, 60);
INSERT INTO `product_variant_option_value` VALUES (178, 15);
INSERT INTO `product_variant_option_value` VALUES (178, 59);
INSERT INTO `product_variant_option_value` VALUES (178, 61);
INSERT INTO `product_variant_option_value` VALUES (179, 3);
INSERT INTO `product_variant_option_value` VALUES (179, 62);
INSERT INTO `product_variant_option_value` VALUES (180, 3);
INSERT INTO `product_variant_option_value` VALUES (180, 63);
INSERT INTO `product_variant_option_value` VALUES (181, 3);
INSERT INTO `product_variant_option_value` VALUES (181, 64);
INSERT INTO `product_variant_option_value` VALUES (182, 3);
INSERT INTO `product_variant_option_value` VALUES (182, 65);
INSERT INTO `product_variant_option_value` VALUES (183, 3);
INSERT INTO `product_variant_option_value` VALUES (183, 66);
INSERT INTO `product_variant_option_value` VALUES (184, 3);
INSERT INTO `product_variant_option_value` VALUES (184, 67);
INSERT INTO `product_variant_option_value` VALUES (185, 10);
INSERT INTO `product_variant_option_value` VALUES (185, 62);
INSERT INTO `product_variant_option_value` VALUES (186, 10);
INSERT INTO `product_variant_option_value` VALUES (186, 63);
INSERT INTO `product_variant_option_value` VALUES (187, 10);
INSERT INTO `product_variant_option_value` VALUES (187, 64);
INSERT INTO `product_variant_option_value` VALUES (188, 10);
INSERT INTO `product_variant_option_value` VALUES (188, 65);
INSERT INTO `product_variant_option_value` VALUES (189, 10);
INSERT INTO `product_variant_option_value` VALUES (189, 66);
INSERT INTO `product_variant_option_value` VALUES (190, 10);
INSERT INTO `product_variant_option_value` VALUES (190, 67);
INSERT INTO `product_variant_option_value` VALUES (191, 68);
INSERT INTO `product_variant_option_value` VALUES (192, 2);
INSERT INTO `product_variant_option_value` VALUES (193, 9);
INSERT INTO `product_variant_option_value` VALUES (194, 3);
INSERT INTO `product_variant_option_value` VALUES (195, 15);
INSERT INTO `product_variant_option_value` VALUES (196, 2);
INSERT INTO `product_variant_option_value` VALUES (197, 69);
INSERT INTO `product_variant_option_value` VALUES (198, 70);
INSERT INTO `product_variant_option_value` VALUES (199, 71);
INSERT INTO `product_variant_option_value` VALUES (200, 72);
INSERT INTO `product_variant_option_value` VALUES (201, 73);
INSERT INTO `product_variant_option_value` VALUES (202, 74);
INSERT INTO `product_variant_option_value` VALUES (203, 75);
INSERT INTO `product_variant_option_value` VALUES (204, 76);
INSERT INTO `product_variant_option_value` VALUES (205, 77);
INSERT INTO `product_variant_option_value` VALUES (206, 78);
INSERT INTO `product_variant_option_value` VALUES (207, 79);
INSERT INTO `product_variant_option_value` VALUES (208, 80);
INSERT INTO `product_variant_option_value` VALUES (209, 81);
INSERT INTO `product_variant_option_value` VALUES (210, 82);
INSERT INTO `product_variant_option_value` VALUES (211, 83);
INSERT INTO `product_variant_option_value` VALUES (212, 9);
INSERT INTO `product_variant_option_value` VALUES (213, 3);
INSERT INTO `product_variant_option_value` VALUES (214, 15);
INSERT INTO `product_variant_option_value` VALUES (215, 15);
INSERT INTO `product_variant_option_value` VALUES (216, 9);
INSERT INTO `product_variant_option_value` VALUES (217, 2);
INSERT INTO `product_variant_option_value` VALUES (218, 1);
INSERT INTO `product_variant_option_value` VALUES (219, 4);
INSERT INTO `product_variant_option_value` VALUES (220, 9);
INSERT INTO `product_variant_option_value` VALUES (221, 2);
INSERT INTO `product_variant_option_value` VALUES (222, 3);
INSERT INTO `product_variant_option_value` VALUES (223, 84);
INSERT INTO `product_variant_option_value` VALUES (224, 85);
INSERT INTO `product_variant_option_value` VALUES (225, 2);
INSERT INTO `product_variant_option_value` VALUES (226, 4);
INSERT INTO `product_variant_option_value` VALUES (227, 1);
INSERT INTO `product_variant_option_value` VALUES (228, 3);
INSERT INTO `product_variant_option_value` VALUES (231, 5);
INSERT INTO `product_variant_option_value` VALUES (232, 2);
INSERT INTO `product_variant_option_value` VALUES (233, 14);
INSERT INTO `product_variant_option_value` VALUES (234, 9);
INSERT INTO `product_variant_option_value` VALUES (235, 2);
INSERT INTO `product_variant_option_value` VALUES (236, 5);
INSERT INTO `product_variant_option_value` VALUES (237, 9);
INSERT INTO `product_variant_option_value` VALUES (238, 2);
INSERT INTO `product_variant_option_value` VALUES (239, 15);
INSERT INTO `product_variant_option_value` VALUES (240, 9);
INSERT INTO `product_variant_option_value` VALUES (241, 3);
INSERT INTO `product_variant_option_value` VALUES (242, 86);
INSERT INTO `product_variant_option_value` VALUES (243, 14);
INSERT INTO `product_variant_option_value` VALUES (244, 87);
INSERT INTO `product_variant_option_value` VALUES (245, 88);
INSERT INTO `product_variant_option_value` VALUES (246, 89);
INSERT INTO `product_variant_option_value` VALUES (247, 90);
INSERT INTO `product_variant_option_value` VALUES (248, 4);
INSERT INTO `product_variant_option_value` VALUES (249, 9);
INSERT INTO `product_variant_option_value` VALUES (250, 2);
INSERT INTO `product_variant_option_value` VALUES (251, 5);
INSERT INTO `product_variant_option_value` VALUES (252, 3);
INSERT INTO `product_variant_option_value` VALUES (253, 91);
INSERT INTO `product_variant_option_value` VALUES (254, 92);
INSERT INTO `product_variant_option_value` VALUES (255, 93);
INSERT INTO `product_variant_option_value` VALUES (256, 94);
INSERT INTO `product_variant_option_value` VALUES (257, 95);
INSERT INTO `product_variant_option_value` VALUES (258, 96);
INSERT INTO `product_variant_option_value` VALUES (261, 2);
INSERT INTO `product_variant_option_value` VALUES (262, 15);
INSERT INTO `product_variant_option_value` VALUES (263, 5);
INSERT INTO `product_variant_option_value` VALUES (264, 97);
INSERT INTO `product_variant_option_value` VALUES (265, 37);
INSERT INTO `product_variant_option_value` VALUES (266, 38);
INSERT INTO `product_variant_option_value` VALUES (267, 39);
INSERT INTO `product_variant_option_value` VALUES (268, 40);
INSERT INTO `product_variant_option_value` VALUES (269, 19);
INSERT INTO `product_variant_option_value` VALUES (269, 98);
INSERT INTO `product_variant_option_value` VALUES (270, 1);
INSERT INTO `product_variant_option_value` VALUES (270, 98);
INSERT INTO `product_variant_option_value` VALUES (271, 9);
INSERT INTO `product_variant_option_value` VALUES (271, 98);
INSERT INTO `product_variant_option_value` VALUES (272, 99);
INSERT INTO `product_variant_option_value` VALUES (273, 5);
INSERT INTO `product_variant_option_value` VALUES (274, 5);
INSERT INTO `product_variant_option_value` VALUES (275, 5);
INSERT INTO `product_variant_option_value` VALUES (276, 100);
INSERT INTO `product_variant_option_value` VALUES (277, 101);
INSERT INTO `product_variant_option_value` VALUES (278, 102);
INSERT INTO `product_variant_option_value` VALUES (279, 9);
INSERT INTO `product_variant_option_value` VALUES (280, 103);
INSERT INTO `product_variant_option_value` VALUES (280, 37);
INSERT INTO `product_variant_option_value` VALUES (281, 103);
INSERT INTO `product_variant_option_value` VALUES (281, 38);
INSERT INTO `product_variant_option_value` VALUES (282, 103);
INSERT INTO `product_variant_option_value` VALUES (282, 39);
INSERT INTO `product_variant_option_value` VALUES (283, 103);
INSERT INTO `product_variant_option_value` VALUES (283, 40);
INSERT INTO `product_variant_option_value` VALUES (284, 104);
INSERT INTO `product_variant_option_value` VALUES (284, 37);
INSERT INTO `product_variant_option_value` VALUES (285, 104);
INSERT INTO `product_variant_option_value` VALUES (285, 38);
INSERT INTO `product_variant_option_value` VALUES (286, 104);
INSERT INTO `product_variant_option_value` VALUES (286, 39);
INSERT INTO `product_variant_option_value` VALUES (287, 104);
INSERT INTO `product_variant_option_value` VALUES (287, 40);
INSERT INTO `product_variant_option_value` VALUES (288, 5);
INSERT INTO `product_variant_option_value` VALUES (289, 2);
INSERT INTO `product_variant_option_value` VALUES (290, 15);
INSERT INTO `product_variant_option_value` VALUES (291, 102);
INSERT INTO `product_variant_option_value` VALUES (292, 5);
INSERT INTO `product_variant_option_value` VALUES (293, 2);
INSERT INTO `product_variant_option_value` VALUES (294, 14);
INSERT INTO `product_variant_option_value` VALUES (295, 105);
INSERT INTO `product_variant_option_value` VALUES (296, 106);
INSERT INTO `product_variant_option_value` VALUES (297, 107);
INSERT INTO `product_variant_option_value` VALUES (298, 108);
INSERT INTO `product_variant_option_value` VALUES (299, 3);
INSERT INTO `product_variant_option_value` VALUES (300, 14);
INSERT INTO `product_variant_option_value` VALUES (301, 23);
INSERT INTO `product_variant_option_value` VALUES (302, 10);
INSERT INTO `product_variant_option_value` VALUES (303, 14);
INSERT INTO `product_variant_option_value` VALUES (304, 23);
INSERT INTO `product_variant_option_value` VALUES (305, 105);
INSERT INTO `product_variant_option_value` VALUES (306, 15);
INSERT INTO `product_variant_option_value` VALUES (307, 14);
INSERT INTO `product_variant_option_value` VALUES (308, 4);
INSERT INTO `product_variant_option_value` VALUES (309, 109);
INSERT INTO `product_variant_option_value` VALUES (310, 110);
INSERT INTO `product_variant_option_value` VALUES (311, 2);
INSERT INTO `product_variant_option_value` VALUES (312, 15);
COMMIT;

-- ----------------------------
-- Table structure for product_variant_prices
-- ----------------------------
DROP TABLE IF EXISTS `product_variant_prices`;
CREATE TABLE `product_variant_prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `variant_id` int(10) unsigned NOT NULL,
  `original_price` int(10) unsigned NOT NULL COMMENT '原价 单位/分',
  `price` int(10) unsigned NOT NULL COMMENT '销售价格 单位/分',
  `deal_price` int(10) unsigned DEFAULT NULL,
  `deal_id` int(10) unsigned DEFAULT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_variant_prices_variant_id_channel_id_unique` (`variant_id`,`channel_id`),
  KEY `product_variant_prices_variant_id_index` (`variant_id`),
  KEY `product_variant_prices_channel_id_index` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_variant_prices
-- ----------------------------
BEGIN;
INSERT INTO `product_variant_prices` VALUES (1, 1, 25600, 19900, 19862, 4, 1, '2018-10-19 07:32:49', '2018-10-19 07:32:49');
INSERT INTO `product_variant_prices` VALUES (2, 2, 650, 288, NULL, NULL, 1, '2018-10-19 09:24:37', '2018-10-19 09:24:37');
INSERT INTO `product_variant_prices` VALUES (3, 3, 650, 288, NULL, NULL, 1, '2018-10-19 09:26:22', '2018-10-19 09:26:22');
INSERT INTO `product_variant_prices` VALUES (4, 4, 650, 288, NULL, NULL, 1, '2018-10-19 09:26:26', '2018-10-19 09:26:26');
INSERT INTO `product_variant_prices` VALUES (5, 5, 5756, 4025, 3998, 4, 1, '2018-10-19 09:49:43', '2018-10-19 09:49:43');
INSERT INTO `product_variant_prices` VALUES (6, 6, 14400, 6784, 6760, 4, 1, '2018-10-19 10:27:04', '2018-10-19 10:27:48');
INSERT INTO `product_variant_prices` VALUES (7, 7, 5742, 5742, 5713, 4, 1, '2018-10-19 10:42:19', '2018-10-19 10:42:19');
INSERT INTO `product_variant_prices` VALUES (8, 8, 100000, 100000, 99977, 4, 1, '2018-10-20 02:05:32', '2018-10-20 02:05:32');
INSERT INTO `product_variant_prices` VALUES (9, 9, 1988, 1413, 1384, 3, 1, '2018-10-20 02:40:35', '2018-10-20 02:40:35');
INSERT INTO `product_variant_prices` VALUES (10, 10, 1999, 1555, NULL, NULL, 1, '2018-10-20 02:45:27', '2018-10-20 02:45:27');
INSERT INTO `product_variant_prices` VALUES (11, 11, 1268, 588, 567, 3, 1, '2018-10-20 07:54:03', '2018-10-20 07:54:03');
INSERT INTO `product_variant_prices` VALUES (12, 12, 2400, 1200, NULL, NULL, 1, '2018-10-20 08:08:34', '2018-10-20 08:08:34');
INSERT INTO `product_variant_prices` VALUES (13, 13, 2400, 1200, 1168, 3, 1, '2018-10-20 08:08:57', '2018-10-20 08:08:57');
INSERT INTO `product_variant_prices` VALUES (14, 14, 2800, 1600, 1569, 2, 1, '2018-10-20 08:11:03', '2018-10-20 08:11:03');
INSERT INTO `product_variant_prices` VALUES (15, 15, 2800, 1600, 1571, 2, 1, '2018-10-20 08:11:14', '2018-10-20 08:11:14');
INSERT INTO `product_variant_prices` VALUES (16, 16, 1100, 720, 687, 4, 1, '2018-10-20 08:42:25', '2018-10-20 08:42:25');
INSERT INTO `product_variant_prices` VALUES (17, 17, 1100, 720, 688, 3, 1, '2018-10-20 08:42:35', '2018-10-20 08:42:35');
INSERT INTO `product_variant_prices` VALUES (18, 18, 1639, 1439, 1409, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (19, 19, 1688, 1488, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (20, 20, 1688, 1488, 1463, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (21, 21, 1628, 1428, 1395, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (22, 22, 2066, 1768, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (23, 23, 2066, 1799, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (24, 24, 2088, 1788, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (25, 25, 2088, 1766, 1729, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (26, 26, 2900, 2768, 2732, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (27, 27, 2900, 2700, 2674, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (28, 28, 2968, 2728, 2698, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (29, 29, 2999, 2768, 2733, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (30, 30, 1668, 1166, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (31, 31, 1699, 1199, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (32, 32, 1900, 1768, 1728, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (33, 33, 1900, 1700, 1667, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (34, 34, 2100, 1988, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (35, 35, 2168, 1900, 1877, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (36, 36, 2100, 1966, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (37, 37, 2168, 1988, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (38, 38, 2328, 928, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (39, 39, 2366, 999, 972, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (40, 40, 2328, 966, 927, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (41, 41, 2368, 968, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (42, 42, 3300, 2468, 2435, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (43, 43, 3300, 2499, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (44, 44, 3399, 2428, 2404, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (45, 45, 1928, 1768, 1732, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (46, 46, 2488, 2028, 1688, 2, 1, NULL, '2018-10-23 07:57:27');
INSERT INTO `product_variant_prices` VALUES (47, 47, 2488, 2088, 2059, 3, 1, NULL, '2018-10-23 07:57:53');
INSERT INTO `product_variant_prices` VALUES (48, 48, 4628, 4368, 4348, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (49, 49, 4628, 4300, 4264, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (50, 50, 4688, 4300, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (51, 51, 5800, 5368, 5343, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (52, 52, 5866, 5366, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (53, 53, 5800, 5399, 5369, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (54, 54, 2788, 2400, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (55, 55, 1600, 1466, 1436, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (56, 56, 1668, 1488, 1461, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (57, 57, 1688, 1499, 1460, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (58, 58, 1166, 1028, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (59, 59, 3066, 2528, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (60, 60, 3088, 2528, 2502, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (61, 61, 2088, 1599, 1561, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (62, 62, 2166, 1699, 1665, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (63, 63, 2128, 1600, 1568, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (64, 64, 2168, 1600, 1572, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (65, 65, 2188, 1668, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (66, 66, 2028, 1500, 1464, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (67, 67, 2068, 1566, 1545, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (68, 68, 2099, 1500, 1475, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (69, 69, 2099, 1528, 1488, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (70, 70, 2028, 1568, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (71, 71, 2099, 1566, 1542, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (72, 72, 2000, 1599, 1578, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (73, 73, 1668, 1188, 1159, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (74, 74, 1688, 1166, 1127, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (75, 75, 1699, 1100, 1073, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (76, 76, 1688, 1199, 1162, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (77, 77, 1628, 1168, 1142, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (78, 78, 1699, 1199, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (79, 79, 1668, 1100, 1061, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (80, 80, 1699, 1100, 1076, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (81, 81, 1666, 1168, 1144, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (82, 82, 1600, 1168, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (83, 83, 1600, 1100, 1078, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (84, 84, 1628, 1168, 1142, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (85, 85, 1699, 1128, 1092, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (86, 86, 1628, 1168, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (87, 87, 1666, 1168, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (88, 88, 1666, 1188, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (89, 89, 1688, 1188, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (90, 90, 1628, 1100, 1078, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (91, 91, 1600, 1188, 1168, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (92, 92, 1666, 1199, 1169, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (93, 93, 1688, 1166, 1128, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (94, 94, 1666, 1188, 1150, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (95, 95, 1688, 1199, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (96, 96, 1688, 1168, 1128, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (97, 97, 1628, 1128, 1107, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (98, 98, 2100, 1688, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (99, 99, 2128, 1668, 1641, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (100, 100, 2168, 1666, 1631, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (101, 101, 2166, 1668, 1629, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (102, 102, 2168, 1666, 1644, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (103, 103, 2199, 1600, 1574, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (104, 104, 2188, 1628, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (105, 105, 2199, 1600, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (106, 106, 2868, 2388, 2368, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (107, 107, 2866, 2300, 2280, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (108, 108, 2888, 2366, 2339, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (109, 109, 2800, 2399, 2364, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (110, 110, 2899, 2399, 2361, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (111, 111, 2899, 2366, 2340, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (112, 112, 2800, 2388, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (113, 113, 2866, 2300, 2260, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (114, 114, 2800, 2388, 2353, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (115, 115, 2868, 2368, 2339, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (116, 116, 2828, 2388, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (117, 117, 2828, 2300, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (118, 118, 3068, 2500, 2474, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (119, 119, 3068, 2500, 2462, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (120, 120, 3099, 2588, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (121, 121, 3066, 2588, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (122, 122, 3068, 2599, 2567, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (123, 123, 1928, 1428, 1389, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (124, 124, 1966, 1488, 1456, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (125, 125, 1966, 1468, 1431, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (126, 126, 1966, 1466, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (127, 127, 1968, 1488, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (128, 128, 1968, 1400, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (129, 129, 1999, 1488, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (130, 130, 1988, 1488, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (131, 131, 1928, 1466, 1430, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (132, 132, 1966, 1499, 1470, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (133, 133, 1928, 1488, 1459, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (134, 134, 1968, 1466, 1442, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (135, 135, 1988, 1400, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (136, 136, 1999, 1428, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (137, 137, 1988, 1499, 1472, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (138, 138, 1900, 1499, 1470, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (139, 139, 1968, 1428, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (140, 140, 1928, 1400, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (141, 141, 1900, 1468, 1428, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (142, 142, 1988, 1499, 1461, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (143, 143, 1988, 1400, 1363, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (144, 144, 1966, 1499, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (145, 145, 1968, 1488, 1448, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (146, 146, 1966, 1428, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (147, 147, 1968, 1499, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (148, 148, 1900, 1468, 1429, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (149, 149, 1968, 1468, 1433, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (150, 150, 1968, 1466, 1428, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (151, 151, 1968, 1488, 1451, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (152, 152, 1968, 1488, 1458, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (153, 153, 1999, 1468, 1433, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (154, 154, 1928, 1468, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (155, 155, 1928, 1488, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (156, 156, 1928, 1468, 1430, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (157, 157, 1900, 1466, 1439, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (158, 158, 1568, 1099, 1070, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (159, 159, 1588, 1000, 975, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (160, 160, 1588, 1088, 1056, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (161, 161, 1500, 1066, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (162, 162, 1500, 1028, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (163, 163, 1588, 1000, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (164, 164, 1528, 1066, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (165, 165, 6200, 5799, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (166, 166, 3999, 3466, 3426, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (167, 167, 3928, 3499, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (168, 168, 3966, 3468, 3447, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (169, 169, 3966, 3499, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (170, 170, 4988, 4488, 4466, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (171, 171, 3699, 3166, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (172, 172, 3668, 3199, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (173, 173, 3668, 3188, 3157, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (174, 174, 3600, 3166, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (175, 175, 3668, 3128, 3107, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (176, 176, 3666, 3166, 3143, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (177, 177, 3600, 3100, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (178, 178, 3699, 3128, 3106, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (179, 179, 1628, 1199, 1169, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (180, 180, 1600, 1100, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (181, 181, 1699, 1166, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (182, 182, 1699, 1199, 1159, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (183, 183, 1628, 1199, 1168, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (184, 184, 1628, 1166, 1126, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (185, 185, 1666, 1128, 1102, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (186, 186, 1600, 1100, 1072, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (187, 187, 1668, 1128, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (188, 188, 1628, 1100, 1068, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (189, 189, 1600, 1100, 1060, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (190, 190, 1600, 1199, 1170, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (191, 191, 3968, 3466, 3434, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (192, 192, 8228, 7700, 7670, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (193, 193, 8268, 7799, 7769, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (194, 194, 1188, 1468, 1428, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (195, 195, 1166, 1466, 1429, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (196, 196, 1168, 1488, 1449, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (197, 197, 600, 900, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (198, 198, 668, 968, 944, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (199, 199, 688, 988, 964, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (200, 200, 666, 928, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (201, 201, 668, 999, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (202, 202, 1388, 1666, 1646, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (203, 203, 488, 788, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (204, 204, 528, 888, 858, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (205, 205, 599, 866, 827, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (206, 206, 728, 1099, 1068, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (207, 207, 700, 1028, 1003, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (208, 208, 788, 1000, 968, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (209, 209, 768, 1099, 1075, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (210, 210, 788, 1099, 1060, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (211, 211, 766, 1099, 1067, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (212, 212, 766, 1000, 979, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (213, 213, 768, 1000, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (214, 214, 728, 1088, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (215, 215, 499, 788, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (216, 216, 628, 988, 950, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (217, 217, 668, 988, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (218, 218, 699, 999, 960, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (219, 219, 688, 988, 951, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (220, 220, 828, 1128, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (221, 221, 868, 1166, 1129, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (222, 222, 888, 1199, 1171, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (223, 223, 1068, 1366, 1335, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (224, 224, 1066, 1300, 1272, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (225, 225, 666, 999, 974, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (226, 226, 668, 966, 926, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (227, 227, 600, 988, 951, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (228, 228, 668, 966, 933, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (229, 229, 279, 139, 112, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (230, 230, 4688, 4315, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (231, 231, 2843, 1991, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (232, 232, 2843, 1991, 1957, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (233, 233, 2843, 1991, 1955, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (234, 234, 2843, 1991, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (235, 235, 2888, 1588, 1562, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (236, 236, 2888, 1588, 1568, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (237, 237, 2888, 1588, 1565, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (238, 238, 230, 187, 163, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (239, 239, 230, 187, 148, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (240, 240, 375, 287, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (241, 241, 375, 287, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (242, 242, 375, 287, 248, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (243, 243, 375, 287, 247, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (244, 244, 1060, 880, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (245, 245, 1060, 880, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (246, 246, 1060, 880, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (247, 247, 1060, 880, 845, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (248, 248, 2438, 995, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (249, 249, 2438, 995, 967, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (250, 250, 2438, 995, 966, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (251, 251, 2438, 995, 966, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (252, 252, 2438, 995, 971, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (253, 253, 5688, 5467, 5438, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (254, 254, 5688, 5467, 5446, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (255, 255, 1668, 1284, 1260, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (256, 256, 1668, 1284, 1246, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (257, 257, 1668, 1284, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (258, 258, 1668, 1284, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (259, 259, 1080, 837, 805, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (260, 260, 1140, 995, 972, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (261, 261, 4914, 3414, 3378, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (262, 262, 4914, 3414, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (263, 263, 4914, 3414, 3377, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (264, 264, 4871, 3371, 3332, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (265, 265, 4871, 3371, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (266, 266, 4871, 3371, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (267, 267, 4871, 3371, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (268, 268, 4871, 3371, 3341, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (269, 269, 4496, 2996, 2961, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (270, 270, 4496, 2996, 2974, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (271, 271, 4496, 2996, 2964, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (272, 272, 3962, 2462, 2422, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (273, 273, 5650, 4150, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (274, 274, 4496, 2996, 2970, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (275, 275, 4193, 2693, 2668, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (276, 276, 7815, 6315, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (277, 277, 7815, 6315, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (278, 278, 4640, 3140, 3113, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (279, 279, 4640, 3140, 3106, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (280, 280, 4784, 3284, 3259, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (281, 281, 4784, 3284, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (282, 282, 4784, 3284, 3254, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (283, 283, 4784, 3284, 3263, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (284, 284, 4784, 3284, 3261, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (285, 285, 4784, 3284, 3263, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (286, 286, 4784, 3284, 3261, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (287, 287, 4784, 3284, 3255, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (288, 288, 4135, 2635, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (289, 289, 4135, 2635, 2604, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (290, 290, 4135, 2635, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (291, 291, 4020, 2520, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (292, 292, 4020, 2520, 2483, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (293, 293, 4020, 2520, 2484, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (294, 294, 4020, 2520, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (295, 295, 4207, 2707, 2679, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (296, 296, 5463, 3963, 3939, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (297, 297, 5463, 3963, 3940, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (298, 298, 5463, 3963, 3932, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (299, 299, 3522, 2022, 2001, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (300, 300, 3522, 2022, 2002, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (301, 301, 3522, 2022, 1990, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (302, 302, 3510, 2010, 1974, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (303, 303, 3510, 2010, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (304, 304, 3510, 2010, 1989, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (305, 305, 3724, 2224, 2193, 3, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (306, 306, 3796, 2296, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (307, 307, 3796, 2296, 2276, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (308, 308, 5939, 4439, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (309, 309, 5939, 4439, 4413, 4, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (310, 310, 5939, 4439, 4417, 2, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (311, 311, 5795, 4295, 4274, 2, 1, NULL, '2018-10-24 06:13:40');
INSERT INTO `product_variant_prices` VALUES (312, 312, 5795, 4295, NULL, NULL, 1, NULL, NULL);
INSERT INTO `product_variant_prices` VALUES (313, 313, 17426, 17286, 17098, 2, 1, '2018-10-24 06:13:49', '2018-10-24 06:13:49');
COMMIT;

-- ----------------------------
-- Table structure for product_variant_translations
-- ----------------------------
DROP TABLE IF EXISTS `product_variant_translations`;
CREATE TABLE `product_variant_translations` (
  `translatable_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_tl` (`translatable_id`,`locale_code`),
  KEY `product_variant_translations_translatable_id_index` (`translatable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_variant_translations
-- ----------------------------
BEGIN;
INSERT INTO `product_variant_translations` VALUES (1, 'SMATE/须眉电吹风机女家用不伤发冷热风筒大功率负离子小米生态链', 'en-US', '2018-10-19 07:32:49', '2018-10-19 07:32:49', 1);
INSERT INTO `product_variant_translations` VALUES (2, 'Car phone holder car bracket car navigation frame car support frame suction cup type air outlet car multifunction', 'en-US', '2018-10-19 09:24:37', '2018-10-19 09:24:37', 2);
INSERT INTO `product_variant_translations` VALUES (3, 'Car phone holder car bracket car navigation frame car support frame suction cup type air outlet car multifunction', 'en-US', '2018-10-19 09:26:22', '2018-10-19 09:26:22', 3);
INSERT INTO `product_variant_translations` VALUES (4, 'Car phone holder car bracket car navigation frame car support frame suction cup type air outlet car multifunction', 'en-US', '2018-10-19 09:26:26', '2018-10-19 09:26:26', 4);
INSERT INTO `product_variant_translations` VALUES (6, 'Negative ion car seat cushion', 'en-US', '2018-10-19 10:27:04', '2018-10-19 10:27:48', 5);
INSERT INTO `product_variant_translations` VALUES (7, 'Toolbox set', 'en-US', '2018-10-19 10:42:19', '2018-10-19 10:42:19', 6);
INSERT INTO `product_variant_translations` VALUES (8, 'iPhoneXS black', 'en-US', '2018-10-20 02:05:32', '2018-10-20 02:05:32', 7);
INSERT INTO `product_variant_translations` VALUES (9, 'Coco lightweight aesthetic nail clippers red', 'en-US', '2018-10-20 02:40:35', '2018-10-20 02:40:35', 8);
INSERT INTO `product_variant_translations` VALUES (10, 'Coco lightweight aesthetic nail clippers black', 'en-US', '2018-10-20 02:45:27', '2018-10-20 02:45:27', 9);
INSERT INTO `product_variant_translations` VALUES (11, 'Massage yoga ball', 'en-US', '2018-10-20 07:54:03', '2018-10-20 07:54:03', 10);
INSERT INTO `product_variant_translations` VALUES (12, 'Yoga mat black 10', 'en-US', '2018-10-20 08:08:34', '2018-10-20 08:08:34', 11);
INSERT INTO `product_variant_translations` VALUES (13, 'Yoga mat red 10', 'en-US', '2018-10-20 08:08:57', '2018-10-20 08:08:57', 12);
INSERT INTO `product_variant_translations` VALUES (14, 'Yoga mat black 20', 'en-US', '2018-10-20 08:11:03', '2018-10-20 08:11:03', 13);
INSERT INTO `product_variant_translations` VALUES (15, 'Yoga mat black 20', 'en-US', '2018-10-20 08:11:14', '2018-10-20 08:11:14', 14);
INSERT INTO `product_variant_translations` VALUES (16, 'Rubber ball red', 'en-US', '2018-10-20 08:42:25', '2018-10-20 08:42:25', 15);
INSERT INTO `product_variant_translations` VALUES (17, 'Rubber ball red', 'en-US', '2018-10-20 08:42:35', '2018-10-20 08:42:35', 16);
INSERT INTO `product_variant_translations` VALUES (18, 'Corbo light and thin aesthetic nail clippers370637', 'en-US', '2018-10-20 10:00:50', '2018-10-20 10:00:50', 17);
INSERT INTO `product_variant_translations` VALUES (19, 'Corbo light and thin aesthetic nail clippers279873', 'en-US', '2018-10-20 10:00:50', '2018-10-20 10:00:50', 18);
INSERT INTO `product_variant_translations` VALUES (20, 'Corbo light and thin aesthetic nail clippers543805', 'en-US', '2018-10-20 10:00:50', '2018-10-20 10:00:50', 19);
INSERT INTO `product_variant_translations` VALUES (21, 'Corbo light and thin aesthetic nail clippers536986', 'en-US', '2018-10-20 10:00:50', '2018-10-20 10:00:50', 20);
INSERT INTO `product_variant_translations` VALUES (22, 'Ultra thin mini 20000 mah mobile power supply265065', 'en-US', '2018-10-20 10:00:52', '2018-10-20 10:00:52', 21);
INSERT INTO `product_variant_translations` VALUES (23, 'Ultra thin mini 20000 mah mobile power supply370440', 'en-US', '2018-10-20 10:00:52', '2018-10-20 10:00:52', 22);
INSERT INTO `product_variant_translations` VALUES (24, 'Ultra thin mini 20000 mah mobile power supply314254', 'en-US', '2018-10-20 10:00:52', '2018-10-20 10:00:52', 23);
INSERT INTO `product_variant_translations` VALUES (25, 'Ultra thin mini 20000 mah mobile power supply571922', 'en-US', '2018-10-20 10:00:52', '2018-10-20 10:00:52', 24);
INSERT INTO `product_variant_translations` VALUES (26, 'Compact multi function mobile power supply720456', 'en-US', '2018-10-20 10:00:54', '2018-10-20 10:00:54', 25);
INSERT INTO `product_variant_translations` VALUES (27, 'Compact multi function mobile power supply630518', 'en-US', '2018-10-20 10:00:54', '2018-10-20 10:00:54', 26);
INSERT INTO `product_variant_translations` VALUES (28, 'Compact multi function mobile power supply423482', 'en-US', '2018-10-20 10:00:54', '2018-10-20 10:00:54', 27);
INSERT INTO `product_variant_translations` VALUES (29, 'Compact multi function mobile power supply709750', 'en-US', '2018-10-20 10:00:55', '2018-10-20 10:00:55', 28);
INSERT INTO `product_variant_translations` VALUES (30, 'Wireless smart quick charge349609', 'en-US', '2018-10-20 10:00:56', '2018-10-20 10:00:56', 29);
INSERT INTO `product_variant_translations` VALUES (31, 'Wireless smart quick charge737112', 'en-US', '2018-10-20 10:00:57', '2018-10-20 10:00:57', 30);
INSERT INTO `product_variant_translations` VALUES (32, '12 constellation night light mobile power supply670372', 'en-US', '2018-10-20 10:00:58', '2018-10-20 10:00:58', 31);
INSERT INTO `product_variant_translations` VALUES (33, '12 constellation night light mobile power supply522660', 'en-US', '2018-10-20 10:00:58', '2018-10-20 10:00:58', 32);
INSERT INTO `product_variant_translations` VALUES (34, 'Bcase is a different selfie stick182613', 'en-US', '2018-10-20 10:01:00', '2018-10-20 10:01:00', 33);
INSERT INTO `product_variant_translations` VALUES (35, 'Bcase is a different selfie stick832124', 'en-US', '2018-10-20 10:01:00', '2018-10-20 10:01:00', 34);
INSERT INTO `product_variant_translations` VALUES (36, 'Bcase is a different selfie stick788801', 'en-US', '2018-10-20 10:01:00', '2018-10-20 10:01:00', 35);
INSERT INTO `product_variant_translations` VALUES (37, 'Bcase is a different selfie stick926181', 'en-US', '2018-10-20 10:01:00', '2018-10-20 10:01:00', 36);
INSERT INTO `product_variant_translations` VALUES (38, 'Flexible robot support308515', 'en-US', '2018-10-20 10:01:03', '2018-10-20 10:01:03', 37);
INSERT INTO `product_variant_translations` VALUES (39, 'Flexible robot support844478', 'en-US', '2018-10-20 10:01:03', '2018-10-20 10:01:03', 38);
INSERT INTO `product_variant_translations` VALUES (40, 'Flexible robot support268417', 'en-US', '2018-10-20 10:01:03', '2018-10-20 10:01:03', 39);
INSERT INTO `product_variant_translations` VALUES (41, 'Flexible robot support229866', 'en-US', '2018-10-20 10:01:03', '2018-10-20 10:01:03', 40);
INSERT INTO `product_variant_translations` VALUES (42, 'Smart pen for taking photos426823', 'en-US', '2018-10-20 10:01:05', '2018-10-20 10:01:05', 41);
INSERT INTO `product_variant_translations` VALUES (43, 'Smart pen for taking photos481434', 'en-US', '2018-10-20 10:01:05', '2018-10-20 10:01:05', 42);
INSERT INTO `product_variant_translations` VALUES (44, 'Smart pen for taking photos806884', 'en-US', '2018-10-20 10:01:05', '2018-10-20 10:01:05', 43);
INSERT INTO `product_variant_translations` VALUES (45, 'The little box is everything367345', 'en-US', '2018-10-20 10:01:08', '2018-10-20 10:01:08', 44);
INSERT INTO `product_variant_translations` VALUES (46, 'Portable wireless bluetooth speaker560682', 'en-US', '2018-10-20 10:01:12', '2018-10-23 07:57:27', 45);
INSERT INTO `product_variant_translations` VALUES (47, 'Portable wireless bluetooth speaker435460', 'en-US', '2018-10-20 10:01:12', '2018-10-23 07:57:53', 46);
INSERT INTO `product_variant_translations` VALUES (48, 'Mondrian music canvas wireless bluetooth speaker501506', 'en-US', '2018-10-20 10:01:14', '2018-10-20 10:01:14', 47);
INSERT INTO `product_variant_translations` VALUES (49, 'Mondrian music canvas wireless bluetooth speaker559481', 'en-US', '2018-10-20 10:01:15', '2018-10-20 10:01:15', 48);
INSERT INTO `product_variant_translations` VALUES (50, 'Mondrian music canvas wireless bluetooth speaker665754', 'en-US', '2018-10-20 10:01:15', '2018-10-20 10:01:15', 49);
INSERT INTO `product_variant_translations` VALUES (51, 'High pretend bility electronic cigarette holder799737', 'en-US', '2018-10-20 10:01:18', '2018-10-20 10:01:18', 50);
INSERT INTO `product_variant_translations` VALUES (52, 'High pretend bility electronic cigarette holder713509', 'en-US', '2018-10-20 10:01:19', '2018-10-20 10:01:19', 51);
INSERT INTO `product_variant_translations` VALUES (53, 'High pretend bility electronic cigarette holder123149', 'en-US', '2018-10-20 10:01:19', '2018-10-20 10:01:19', 52);
INSERT INTO `product_variant_translations` VALUES (54, 'Small procedure body fat scale762246', 'en-US', '2018-10-20 10:01:20', '2018-10-20 10:01:20', 53);
INSERT INTO `product_variant_translations` VALUES (55, 'Pma graphene thermal silk eye mask377838', 'en-US', '2018-10-20 10:01:23', '2018-10-20 10:01:23', 54);
INSERT INTO `product_variant_translations` VALUES (56, 'Pma graphene thermal silk eye mask425403', 'en-US', '2018-10-20 10:01:23', '2018-10-20 10:01:23', 55);
INSERT INTO `product_variant_translations` VALUES (57, 'Pma graphene thermal silk eye mask655878', 'en-US', '2018-10-20 10:01:23', '2018-10-20 10:01:23', 56);
INSERT INTO `product_variant_translations` VALUES (58, 'A cotton face towel952480', 'en-US', '2018-10-20 10:01:25', '2018-10-20 10:01:25', 57);
INSERT INTO `product_variant_translations` VALUES (59, 'Top layer cowhide run vehicle belt452041', 'en-US', '2018-10-22 03:30:04', '2018-10-22 03:30:04', 58);
INSERT INTO `product_variant_translations` VALUES (60, 'Top layer cowhide run vehicle belt833395', 'en-US', '2018-10-22 03:30:04', '2018-10-22 03:30:04', 59);
INSERT INTO `product_variant_translations` VALUES (61, '90 split cow pickup bag folded885907', 'en-US', '2018-10-22 03:30:07', '2018-10-22 03:30:07', 60);
INSERT INTO `product_variant_translations` VALUES (62, 'Leather purse womens 2018 new fashionable sheepskin short mini multi functional wallet pocket fold zero wallet187705', 'en-US', '2018-10-22 03:30:14', '2018-10-22 03:30:14', 61);
INSERT INTO `product_variant_translations` VALUES (63, 'Leather purse womens 2018 new fashionable sheepskin short mini multi functional wallet pocket fold zero wallet444268', 'en-US', '2018-10-22 03:30:14', '2018-10-22 03:30:14', 62);
INSERT INTO `product_variant_translations` VALUES (64, 'Leather purse womens 2018 new fashionable sheepskin short mini multi functional wallet pocket fold zero wallet998572', 'en-US', '2018-10-22 03:30:14', '2018-10-22 03:30:14', 63);
INSERT INTO `product_variant_translations` VALUES (65, 'Leather purse womens 2018 new fashionable sheepskin short mini multi functional wallet pocket fold zero wallet891115', 'en-US', '2018-10-22 03:30:14', '2018-10-22 03:30:14', 64);
INSERT INTO `product_variant_translations` VALUES (66, '2018 new korean womens purse womens long style multi functional real wallet childrens money hand bag wallet tide709469', 'en-US', '2018-10-22 03:30:23', '2018-10-22 03:30:23', 65);
INSERT INTO `product_variant_translations` VALUES (67, '2018 new korean womens purse womens long style multi functional real wallet childrens money hand bag wallet tide143223', 'en-US', '2018-10-22 03:30:23', '2018-10-22 03:30:23', 66);
INSERT INTO `product_variant_translations` VALUES (68, '2018 new korean womens purse womens long style multi functional real wallet childrens money hand bag wallet tide334189', 'en-US', '2018-10-22 03:30:23', '2018-10-22 03:30:23', 67);
INSERT INTO `product_variant_translations` VALUES (69, '2018 new korean womens purse womens long style multi functional real wallet childrens money hand bag wallet tide526756', 'en-US', '2018-10-22 03:30:23', '2018-10-22 03:30:23', 68);
INSERT INTO `product_variant_translations` VALUES (70, '2018 new korean womens purse womens long style multi functional real wallet childrens money hand bag wallet tide455138', 'en-US', '2018-10-22 03:30:23', '2018-10-22 03:30:23', 69);
INSERT INTO `product_variant_translations` VALUES (71, '2018 new korean womens purse womens long style multi functional real wallet childrens money hand bag wallet tide915538', 'en-US', '2018-10-22 03:30:23', '2018-10-22 03:30:23', 70);
INSERT INTO `product_variant_translations` VALUES (72, '2018 new korean womens purse womens long style multi functional real wallet childrens money hand bag wallet tide617254', 'en-US', '2018-10-22 03:30:23', '2018-10-22 03:30:23', 71);
INSERT INTO `product_variant_translations` VALUES (73, 'Luladi flip flops mens beach slippers mens non slip slippers black119518', 'en-US', '2018-10-22 03:30:31', '2018-10-22 03:30:31', 72);
INSERT INTO `product_variant_translations` VALUES (74, 'Luladi flip flops mens beach slippers mens non slip slippers black302818', 'en-US', '2018-10-22 03:30:31', '2018-10-22 03:30:31', 73);
INSERT INTO `product_variant_translations` VALUES (75, 'Luladi flip flops mens beach slippers mens non slip slippers black689434', 'en-US', '2018-10-22 03:30:31', '2018-10-22 03:30:31', 74);
INSERT INTO `product_variant_translations` VALUES (76, 'Luladi flip flops mens beach slippers mens non slip slippers black410386', 'en-US', '2018-10-22 03:30:32', '2018-10-22 03:30:32', 75);
INSERT INTO `product_variant_translations` VALUES (77, 'Luladi flip flops mens beach slippers mens non slip slippers black830189', 'en-US', '2018-10-22 03:30:32', '2018-10-22 03:30:32', 76);
INSERT INTO `product_variant_translations` VALUES (78, 'Luladi flip flops mens beach slippers mens non slip slippers black108719', 'en-US', '2018-10-22 03:30:32', '2018-10-22 03:30:32', 77);
INSERT INTO `product_variant_translations` VALUES (79, 'Luladi flip flops mens beach slippers mens non slip slippers black881004', 'en-US', '2018-10-22 03:30:32', '2018-10-22 03:30:32', 78);
INSERT INTO `product_variant_translations` VALUES (80, 'Luladi flip flops mens beach slippers mens non slip slippers black876953', 'en-US', '2018-10-22 03:30:32', '2018-10-22 03:30:32', 79);
INSERT INTO `product_variant_translations` VALUES (81, 'Luladi flip flops mens beach slippers mens non slip slippers black237055', 'en-US', '2018-10-22 03:30:32', '2018-10-22 03:30:32', 80);
INSERT INTO `product_variant_translations` VALUES (82, 'Luladi flip flops mens beach slippers mens non slip slippers black550150', 'en-US', '2018-10-22 03:30:32', '2018-10-22 03:30:32', 81);
INSERT INTO `product_variant_translations` VALUES (83, 'Luladi flip flops mens beach slippers mens non slip slippers black716177', 'en-US', '2018-10-22 03:30:32', '2018-10-22 03:30:32', 82);
INSERT INTO `product_variant_translations` VALUES (84, 'Luladi flip flops mens beach slippers mens non slip slippers black284223', 'en-US', '2018-10-22 03:30:32', '2018-10-22 03:30:32', 83);
INSERT INTO `product_variant_translations` VALUES (85, 'Luladi flip flops mens beach slippers mens non slip slippers black974527', 'en-US', '2018-10-22 03:30:32', '2018-10-22 03:30:32', 84);
INSERT INTO `product_variant_translations` VALUES (86, 'Luladi flip flops mens beach slippers mens non slip slippers black573272', 'en-US', '2018-10-22 03:30:32', '2018-10-22 03:30:32', 85);
INSERT INTO `product_variant_translations` VALUES (87, 'Luladi flip flops mens beach slippers mens non slip slippers black309423', 'en-US', '2018-10-22 03:30:32', '2018-10-22 03:30:32', 86);
INSERT INTO `product_variant_translations` VALUES (88, 'Luladi flip flops mens beach slippers mens non slip slippers black543743', 'en-US', '2018-10-22 03:30:32', '2018-10-22 03:30:32', 87);
INSERT INTO `product_variant_translations` VALUES (89, 'Luladi flip flops mens beach slippers mens non slip slippers black528206', 'en-US', '2018-10-22 03:30:32', '2018-10-22 03:30:32', 88);
INSERT INTO `product_variant_translations` VALUES (90, 'Luladi flip flops mens beach slippers mens non slip slippers black457359', 'en-US', '2018-10-22 03:30:32', '2018-10-22 03:30:32', 89);
INSERT INTO `product_variant_translations` VALUES (91, 'Luladi flip flops mens beach slippers mens non slip slippers black843874', 'en-US', '2018-10-22 03:30:32', '2018-10-22 03:30:32', 90);
INSERT INTO `product_variant_translations` VALUES (92, 'Luladi flip flops mens beach slippers mens non slip slippers black726241', 'en-US', '2018-10-22 03:30:32', '2018-10-22 03:30:32', 91);
INSERT INTO `product_variant_translations` VALUES (93, 'Luladi flip flops mens beach slippers mens non slip slippers black220111', 'en-US', '2018-10-22 03:30:32', '2018-10-22 03:30:32', 92);
INSERT INTO `product_variant_translations` VALUES (94, 'Luladi flip flops mens beach slippers mens non slip slippers black465012', 'en-US', '2018-10-22 03:30:32', '2018-10-22 03:30:32', 93);
INSERT INTO `product_variant_translations` VALUES (95, 'Luladi flip flops mens beach slippers mens non slip slippers black682050', 'en-US', '2018-10-22 03:30:32', '2018-10-22 03:30:32', 94);
INSERT INTO `product_variant_translations` VALUES (96, 'Luladi flip flops mens beach slippers mens non slip slippers black544787', 'en-US', '2018-10-22 03:30:32', '2018-10-22 03:30:32', 95);
INSERT INTO `product_variant_translations` VALUES (97, 'Luladi flip flops mens beach slippers mens non slip slippers black563826', 'en-US', '2018-10-22 03:30:32', '2018-10-22 03:30:32', 96);
INSERT INTO `product_variant_translations` VALUES (98, 'Havaianas brazil 2018 classic flip flops top black slip resistant slipper for men and women havana856369', 'en-US', '2018-10-22 03:30:38', '2018-10-22 03:30:38', 97);
INSERT INTO `product_variant_translations` VALUES (99, 'Havaianas brazil 2018 classic flip flops top black slip resistant slipper for men and women havana587123', 'en-US', '2018-10-22 03:30:38', '2018-10-22 03:30:38', 98);
INSERT INTO `product_variant_translations` VALUES (100, 'Havaianas brazil 2018 classic flip flops top black slip resistant slipper for men and women havana125881', 'en-US', '2018-10-22 03:30:38', '2018-10-22 03:30:38', 99);
INSERT INTO `product_variant_translations` VALUES (101, 'Havaianas brazil 2018 classic flip flops top black slip resistant slipper for men and women havana147898', 'en-US', '2018-10-22 03:30:38', '2018-10-22 03:30:38', 100);
INSERT INTO `product_variant_translations` VALUES (102, 'Havaianas brazil 2018 classic flip flops top black slip resistant slipper for men and women havana480642', 'en-US', '2018-10-22 03:30:38', '2018-10-22 03:30:38', 101);
INSERT INTO `product_variant_translations` VALUES (103, 'Havaianas brazil 2018 classic flip flops top black slip resistant slipper for men and women havana850759', 'en-US', '2018-10-22 03:30:38', '2018-10-22 03:30:38', 102);
INSERT INTO `product_variant_translations` VALUES (104, 'Havaianas brazil 2018 classic flip flops top black slip resistant slipper for men and women havana482096', 'en-US', '2018-10-22 03:30:38', '2018-10-22 03:30:38', 103);
INSERT INTO `product_variant_translations` VALUES (105, 'Havaianas brazil 2018 classic flip flops top black slip resistant slipper for men and women havana434419', 'en-US', '2018-10-22 03:30:38', '2018-10-22 03:30:38', 104);
INSERT INTO `product_variant_translations` VALUES (106, 'Warm shadow home female home dress spring and autumn mo dyer home dress seven sleeves long pants two pieces of nordic beauty when you can wear a home dress suit279385', 'en-US', '2018-10-22 03:30:45', '2018-10-22 03:30:45', 105);
INSERT INTO `product_variant_translations` VALUES (107, 'Warm shadow home female home dress spring and autumn mo dyer home dress seven sleeves long pants two pieces of nordic beauty when you can wear a home dress suit212033', 'en-US', '2018-10-22 03:30:45', '2018-10-22 03:30:45', 106);
INSERT INTO `product_variant_translations` VALUES (108, 'Warm shadow home female home dress spring and autumn mo dyer home dress seven sleeves long pants two pieces of nordic beauty when you can wear a home dress suit609833', 'en-US', '2018-10-22 03:30:45', '2018-10-22 03:30:45', 107);
INSERT INTO `product_variant_translations` VALUES (109, 'Warm shadow home female home dress spring and autumn mo dyer home dress seven sleeves long pants two pieces of nordic beauty when you can wear a home dress suit300057', 'en-US', '2018-10-22 03:30:45', '2018-10-22 03:30:45', 108);
INSERT INTO `product_variant_translations` VALUES (110, 'Warm shadow home female home dress spring and autumn mo dyer home dress seven sleeves long pants two pieces of nordic beauty when you can wear a home dress suit613845', 'en-US', '2018-10-22 03:30:46', '2018-10-22 03:30:46', 109);
INSERT INTO `product_variant_translations` VALUES (111, 'Warm shadow home female home dress spring and autumn mo dyer home dress seven sleeves long pants two pieces of nordic beauty when you can wear a home dress suit677168', 'en-US', '2018-10-22 03:30:46', '2018-10-22 03:30:46', 110);
INSERT INTO `product_variant_translations` VALUES (112, 'Warm shadow home female home dress spring and autumn mo dyer home dress seven sleeves long pants two pieces of nordic beauty when you can wear a home dress suit400272', 'en-US', '2018-10-22 03:30:46', '2018-10-22 03:30:46', 111);
INSERT INTO `product_variant_translations` VALUES (113, 'Warm shadow home female home dress spring and autumn mo dyer home dress seven sleeves long pants two pieces of nordic beauty when you can wear a home dress suit903128', 'en-US', '2018-10-22 03:30:46', '2018-10-22 03:30:46', 112);
INSERT INTO `product_variant_translations` VALUES (114, 'Warm shadow home female home dress spring and autumn mo dyer home dress seven sleeves long pants two pieces of nordic beauty when you can wear a home dress suit269106', 'en-US', '2018-10-22 03:30:46', '2018-10-22 03:30:46', 113);
INSERT INTO `product_variant_translations` VALUES (115, 'Warm shadow home female home dress spring and autumn mo dyer home dress seven sleeves long pants two pieces of nordic beauty when you can wear a home dress suit258047', 'en-US', '2018-10-22 03:30:46', '2018-10-22 03:30:46', 114);
INSERT INTO `product_variant_translations` VALUES (116, 'Warm shadow home female home dress spring and autumn mo dyer home dress seven sleeves long pants two pieces of nordic beauty when you can wear a home dress suit647508', 'en-US', '2018-10-22 03:30:46', '2018-10-22 03:30:46', 115);
INSERT INTO `product_variant_translations` VALUES (117, 'Warm shadow home female home dress spring and autumn mo dyer home dress seven sleeves long pants two pieces of nordic beauty when you can wear a home dress suit541265', 'en-US', '2018-10-22 03:30:46', '2018-10-22 03:30:46', 116);
INSERT INTO `product_variant_translations` VALUES (118, 'Mens pajamas long sleeved cotton spring and autumn cardigan men plus size autumn winter household suit mens young man353068', 'en-US', '2018-10-22 03:30:51', '2018-10-22 03:30:51', 117);
INSERT INTO `product_variant_translations` VALUES (119, 'Mens pajamas long sleeved cotton spring and autumn cardigan men plus size autumn winter household suit mens young man576874', 'en-US', '2018-10-22 03:30:51', '2018-10-22 03:30:51', 118);
INSERT INTO `product_variant_translations` VALUES (120, 'Mens pajamas long sleeved cotton spring and autumn cardigan men plus size autumn winter household suit mens young man434889', 'en-US', '2018-10-22 03:30:51', '2018-10-22 03:30:51', 119);
INSERT INTO `product_variant_translations` VALUES (121, 'Mens pajamas long sleeved cotton spring and autumn cardigan men plus size autumn winter household suit mens young man876299', 'en-US', '2018-10-22 03:30:51', '2018-10-22 03:30:51', 120);
INSERT INTO `product_variant_translations` VALUES (122, 'Mens pajamas long sleeved cotton spring and autumn cardigan men plus size autumn winter household suit mens young man241575', 'en-US', '2018-10-22 03:30:51', '2018-10-22 03:30:51', 121);
INSERT INTO `product_variant_translations` VALUES (123, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers704085', 'en-US', '2018-10-22 03:30:55', '2018-10-22 03:30:55', 122);
INSERT INTO `product_variant_translations` VALUES (124, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers691746', 'en-US', '2018-10-22 03:30:55', '2018-10-22 03:30:55', 123);
INSERT INTO `product_variant_translations` VALUES (125, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers398225', 'en-US', '2018-10-22 03:30:55', '2018-10-22 03:30:55', 124);
INSERT INTO `product_variant_translations` VALUES (126, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers753180', 'en-US', '2018-10-22 03:30:55', '2018-10-22 03:30:55', 125);
INSERT INTO `product_variant_translations` VALUES (127, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers838677', 'en-US', '2018-10-22 03:30:55', '2018-10-22 03:30:55', 126);
INSERT INTO `product_variant_translations` VALUES (128, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers290056', 'en-US', '2018-10-22 03:30:55', '2018-10-22 03:30:55', 127);
INSERT INTO `product_variant_translations` VALUES (129, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers192775', 'en-US', '2018-10-22 03:30:55', '2018-10-22 03:30:55', 128);
INSERT INTO `product_variant_translations` VALUES (130, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers888575', 'en-US', '2018-10-22 03:30:55', '2018-10-22 03:30:55', 129);
INSERT INTO `product_variant_translations` VALUES (131, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers656134', 'en-US', '2018-10-22 03:30:55', '2018-10-22 03:30:55', 130);
INSERT INTO `product_variant_translations` VALUES (132, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers551872', 'en-US', '2018-10-22 03:30:55', '2018-10-22 03:30:55', 131);
INSERT INTO `product_variant_translations` VALUES (133, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers567852', 'en-US', '2018-10-22 03:30:55', '2018-10-22 03:30:55', 132);
INSERT INTO `product_variant_translations` VALUES (134, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers162808', 'en-US', '2018-10-22 03:30:55', '2018-10-22 03:30:55', 133);
INSERT INTO `product_variant_translations` VALUES (135, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers960642', 'en-US', '2018-10-22 03:30:55', '2018-10-22 03:30:55', 134);
INSERT INTO `product_variant_translations` VALUES (136, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers710559', 'en-US', '2018-10-22 03:30:55', '2018-10-22 03:30:55', 135);
INSERT INTO `product_variant_translations` VALUES (137, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers453812', 'en-US', '2018-10-22 03:30:55', '2018-10-22 03:30:55', 136);
INSERT INTO `product_variant_translations` VALUES (138, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers906688', 'en-US', '2018-10-22 03:30:55', '2018-10-22 03:30:55', 137);
INSERT INTO `product_variant_translations` VALUES (139, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers168875', 'en-US', '2018-10-22 03:30:56', '2018-10-22 03:30:56', 138);
INSERT INTO `product_variant_translations` VALUES (140, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers214027', 'en-US', '2018-10-22 03:30:56', '2018-10-22 03:30:56', 139);
INSERT INTO `product_variant_translations` VALUES (141, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers467473', 'en-US', '2018-10-22 03:30:56', '2018-10-22 03:30:56', 140);
INSERT INTO `product_variant_translations` VALUES (142, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers595854', 'en-US', '2018-10-22 03:30:56', '2018-10-22 03:30:56', 141);
INSERT INTO `product_variant_translations` VALUES (143, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers600777', 'en-US', '2018-10-22 03:30:56', '2018-10-22 03:30:56', 142);
INSERT INTO `product_variant_translations` VALUES (144, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers321876', 'en-US', '2018-10-22 03:30:56', '2018-10-22 03:30:56', 143);
INSERT INTO `product_variant_translations` VALUES (145, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers998549', 'en-US', '2018-10-22 03:30:56', '2018-10-22 03:30:56', 144);
INSERT INTO `product_variant_translations` VALUES (146, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers580879', 'en-US', '2018-10-22 03:30:56', '2018-10-22 03:30:56', 145);
INSERT INTO `product_variant_translations` VALUES (147, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers286789', 'en-US', '2018-10-22 03:30:56', '2018-10-22 03:30:56', 146);
INSERT INTO `product_variant_translations` VALUES (148, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers251281', 'en-US', '2018-10-22 03:30:56', '2018-10-22 03:30:56', 147);
INSERT INTO `product_variant_translations` VALUES (149, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers296458', 'en-US', '2018-10-22 03:30:56', '2018-10-22 03:30:56', 148);
INSERT INTO `product_variant_translations` VALUES (150, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers511093', 'en-US', '2018-10-22 03:30:56', '2018-10-22 03:30:56', 149);
INSERT INTO `product_variant_translations` VALUES (151, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers121391', 'en-US', '2018-10-22 03:30:56', '2018-10-22 03:30:56', 150);
INSERT INTO `product_variant_translations` VALUES (152, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers461600', 'en-US', '2018-10-22 03:30:56', '2018-10-22 03:30:56', 151);
INSERT INTO `product_variant_translations` VALUES (153, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers824167', 'en-US', '2018-10-22 03:30:56', '2018-10-22 03:30:56', 152);
INSERT INTO `product_variant_translations` VALUES (154, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers863971', 'en-US', '2018-10-22 03:30:56', '2018-10-22 03:30:56', 153);
INSERT INTO `product_variant_translations` VALUES (155, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers955770', 'en-US', '2018-10-22 03:30:56', '2018-10-22 03:30:56', 154);
INSERT INTO `product_variant_translations` VALUES (156, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers637600', 'en-US', '2018-10-22 03:30:56', '2018-10-22 03:30:56', 155);
INSERT INTO `product_variant_translations` VALUES (157, 'Spring yoga pants womens hip raises exercise suit slim tight height waist small foot nine trousers714103', 'en-US', '2018-10-22 03:30:56', '2018-10-22 03:30:56', 156);
INSERT INTO `product_variant_translations` VALUES (158, 'Tight pants male gym suit high bounce speed dry run sports compression basketball leggings long pants seven points plus pile training297571', 'en-US', '2018-10-22 03:31:00', '2018-10-22 03:31:00', 157);
INSERT INTO `product_variant_translations` VALUES (159, 'Tight pants male gym suit high bounce speed dry run sports compression basketball leggings long pants seven points plus pile training697599', 'en-US', '2018-10-22 03:31:00', '2018-10-22 03:31:00', 158);
INSERT INTO `product_variant_translations` VALUES (160, 'Tight pants male gym suit high bounce speed dry run sports compression basketball leggings long pants seven points plus pile training656785', 'en-US', '2018-10-22 03:31:00', '2018-10-22 03:31:00', 159);
INSERT INTO `product_variant_translations` VALUES (161, 'Tight pants male gym suit high bounce speed dry run sports compression basketball leggings long pants seven points plus pile training869778', 'en-US', '2018-10-22 03:31:00', '2018-10-22 03:31:00', 160);
INSERT INTO `product_variant_translations` VALUES (162, 'Tight pants male gym suit high bounce speed dry run sports compression basketball leggings long pants seven points plus pile training581481', 'en-US', '2018-10-22 03:31:00', '2018-10-22 03:31:00', 161);
INSERT INTO `product_variant_translations` VALUES (163, 'Tight pants male gym suit high bounce speed dry run sports compression basketball leggings long pants seven points plus pile training841156', 'en-US', '2018-10-22 03:31:00', '2018-10-22 03:31:00', 162);
INSERT INTO `product_variant_translations` VALUES (164, 'Tight pants male gym suit high bounce speed dry run sports compression basketball leggings long pants seven points plus pile training218481', 'en-US', '2018-10-22 03:31:00', '2018-10-22 03:31:00', 163);
INSERT INTO `product_variant_translations` VALUES (165, 'The antarctic peoples 60 satins long plush cotton four piece cotton plain womens bed sheet and quilt cover 20m bedding664825', 'en-US', '2018-10-22 03:31:04', '2018-10-22 03:31:04', 164);
INSERT INTO `product_variant_translations` VALUES (166, 'Non printed cotton acorns embroidered plaid washed cotton fine cotton four piece sheet bed bonnets891413', 'en-US', '2018-10-22 03:31:08', '2018-10-22 03:31:08', 165);
INSERT INTO `product_variant_translations` VALUES (167, 'Non printed cotton acorns embroidered plaid washed cotton fine cotton four piece sheet bed bonnets594235', 'en-US', '2018-10-22 03:31:09', '2018-10-22 03:31:09', 166);
INSERT INTO `product_variant_translations` VALUES (168, 'Non printed cotton acorns embroidered plaid washed cotton fine cotton four piece sheet bed bonnets514994', 'en-US', '2018-10-22 03:31:09', '2018-10-22 03:31:09', 167);
INSERT INTO `product_variant_translations` VALUES (169, 'Non printed cotton acorns embroidered plaid washed cotton fine cotton four piece sheet bed bonnets972484', 'en-US', '2018-10-22 03:31:09', '2018-10-22 03:31:09', 168);
INSERT INTO `product_variant_translations` VALUES (170, 'Shuxiang home anti bacterial anti mite waterproof bed li three pieces set964018', 'en-US', '2018-10-22 03:31:12', '2018-10-22 03:31:12', 169);
INSERT INTO `product_variant_translations` VALUES (171, 'Double bed made of silk and cotton of egypt431161', 'en-US', '2018-10-22 03:31:15', '2018-10-22 03:31:15', 170);
INSERT INTO `product_variant_translations` VALUES (172, 'Double bed made of silk and cotton of egypt421418', 'en-US', '2018-10-22 03:31:15', '2018-10-22 03:31:15', 171);
INSERT INTO `product_variant_translations` VALUES (173, 'Double bed made of silk and cotton of egypt678859', 'en-US', '2018-10-22 03:31:15', '2018-10-22 03:31:15', 172);
INSERT INTO `product_variant_translations` VALUES (174, 'Double bed made of silk and cotton of egypt158052', 'en-US', '2018-10-22 03:31:15', '2018-10-22 03:31:15', 173);
INSERT INTO `product_variant_translations` VALUES (175, 'Double bed made of silk and cotton of egypt537623', 'en-US', '2018-10-22 03:31:15', '2018-10-22 03:31:15', 174);
INSERT INTO `product_variant_translations` VALUES (176, 'Double bed made of silk and cotton of egypt604832', 'en-US', '2018-10-22 03:31:15', '2018-10-22 03:31:15', 175);
INSERT INTO `product_variant_translations` VALUES (177, 'Double bed made of silk and cotton of egypt242759', 'en-US', '2018-10-22 03:31:15', '2018-10-22 03:31:15', 176);
INSERT INTO `product_variant_translations` VALUES (178, 'Double bed made of silk and cotton of egypt467261', 'en-US', '2018-10-22 03:31:15', '2018-10-22 03:31:15', 177);
INSERT INTO `product_variant_translations` VALUES (179, 'Lequan pure color cotton bed sheet single 15182 m double bed sheet student 12m springsummer bed sheet875862', 'en-US', '2018-10-22 03:31:19', '2018-10-22 03:31:19', 178);
INSERT INTO `product_variant_translations` VALUES (180, 'Lequan pure color cotton bed sheet single 15182 m double bed sheet student 12m springsummer bed sheet530549', 'en-US', '2018-10-22 03:31:19', '2018-10-22 03:31:19', 179);
INSERT INTO `product_variant_translations` VALUES (181, 'Lequan pure color cotton bed sheet single 15182 m double bed sheet student 12m springsummer bed sheet261212', 'en-US', '2018-10-22 03:31:19', '2018-10-22 03:31:19', 180);
INSERT INTO `product_variant_translations` VALUES (182, 'Lequan pure color cotton bed sheet single 15182 m double bed sheet student 12m springsummer bed sheet477098', 'en-US', '2018-10-22 03:31:19', '2018-10-22 03:31:19', 181);
INSERT INTO `product_variant_translations` VALUES (183, 'Lequan pure color cotton bed sheet single 15182 m double bed sheet student 12m springsummer bed sheet949604', 'en-US', '2018-10-22 03:31:19', '2018-10-22 03:31:19', 182);
INSERT INTO `product_variant_translations` VALUES (184, 'Lequan pure color cotton bed sheet single 15182 m double bed sheet student 12m springsummer bed sheet883812', 'en-US', '2018-10-22 03:31:20', '2018-10-22 03:31:20', 183);
INSERT INTO `product_variant_translations` VALUES (185, 'Lequan pure color cotton bed sheet single 15182 m double bed sheet student 12m springsummer bed sheet521876', 'en-US', '2018-10-22 03:31:20', '2018-10-22 03:31:20', 184);
INSERT INTO `product_variant_translations` VALUES (186, 'Lequan pure color cotton bed sheet single 15182 m double bed sheet student 12m springsummer bed sheet869327', 'en-US', '2018-10-22 03:31:20', '2018-10-22 03:31:20', 185);
INSERT INTO `product_variant_translations` VALUES (187, 'Lequan pure color cotton bed sheet single 15182 m double bed sheet student 12m springsummer bed sheet495208', 'en-US', '2018-10-22 03:31:20', '2018-10-22 03:31:20', 186);
INSERT INTO `product_variant_translations` VALUES (188, 'Lequan pure color cotton bed sheet single 15182 m double bed sheet student 12m springsummer bed sheet661924', 'en-US', '2018-10-22 03:31:20', '2018-10-22 03:31:20', 187);
INSERT INTO `product_variant_translations` VALUES (189, 'Lequan pure color cotton bed sheet single 15182 m double bed sheet student 12m springsummer bed sheet438284', 'en-US', '2018-10-22 03:31:20', '2018-10-22 03:31:20', 188);
INSERT INTO `product_variant_translations` VALUES (190, 'Lequan pure color cotton bed sheet single 15182 m double bed sheet student 12m springsummer bed sheet555190', 'en-US', '2018-10-22 03:31:20', '2018-10-22 03:31:20', 189);
INSERT INTO `product_variant_translations` VALUES (191, 'A sleep saving pillow269984', 'en-US', '2018-10-22 03:31:22', '2018-10-22 03:31:22', 190);
INSERT INTO `product_variant_translations` VALUES (192, '150d density relief of cervical pain113721', 'en-US', '2018-10-22 03:31:24', '2018-10-22 03:31:24', 191);
INSERT INTO `product_variant_translations` VALUES (193, '150d density relief of cervical pain827681', 'en-US', '2018-10-22 03:31:24', '2018-10-22 03:31:24', 192);
INSERT INTO `product_variant_translations` VALUES (194, 'Web celebrity cosmetic storage box extra large drawer type portable transparent table clean skin care products shelf dustproof959084', 'en-US', '2018-10-22 03:31:27', '2018-10-22 03:31:27', 193);
INSERT INTO `product_variant_translations` VALUES (195, 'Web celebrity cosmetic storage box extra large drawer type portable transparent table clean skin care products shelf dustproof462468', 'en-US', '2018-10-22 03:31:27', '2018-10-22 03:31:27', 194);
INSERT INTO `product_variant_translations` VALUES (196, 'Web celebrity cosmetic storage box extra large drawer type portable transparent table clean skin care products shelf dustproof432417', 'en-US', '2018-10-22 03:31:27', '2018-10-22 03:31:27', 195);
INSERT INTO `product_variant_translations` VALUES (197, 'Cotton and linen folding bin bag packing case home goods bin chest cloth bra drawer250210', 'en-US', '2018-10-22 03:31:30', '2018-10-22 03:31:30', 196);
INSERT INTO `product_variant_translations` VALUES (198, 'Cotton and linen folding bin bag packing case home goods bin chest cloth bra drawer562055', 'en-US', '2018-10-22 03:31:30', '2018-10-22 03:31:30', 197);
INSERT INTO `product_variant_translations` VALUES (199, 'Cotton and linen folding bin bag packing case home goods bin chest cloth bra drawer437279', 'en-US', '2018-10-22 03:31:30', '2018-10-22 03:31:30', 198);
INSERT INTO `product_variant_translations` VALUES (200, 'Cotton and linen folding bin bag packing case home goods bin chest cloth bra drawer382253', 'en-US', '2018-10-22 03:31:30', '2018-10-22 03:31:30', 199);
INSERT INTO `product_variant_translations` VALUES (201, 'Cotton and linen folding bin bag packing case home goods bin chest cloth bra drawer935534', 'en-US', '2018-10-22 03:31:30', '2018-10-22 03:31:30', 200);
INSERT INTO `product_variant_translations` VALUES (202, 'Car trunk storage box plastic storage box multi functional storage box folding packaging box car rear box176710', 'en-US', '2018-10-22 03:31:33', '2018-10-22 03:31:33', 201);
INSERT INTO `product_variant_translations` VALUES (203, 'Merope cosmetics sub bottle spray bottle shampoo travel sub bottle emulsion 6 sets transparent color643181', 'en-US', '2018-10-22 03:31:35', '2018-10-22 03:31:35', 202);
INSERT INTO `product_variant_translations` VALUES (204, 'Five pairs of disposable underwear men and women travelling bei an pure cotton non paper underwear postpartum cotton children wash free shorts598403', 'en-US', '2018-10-22 03:31:37', '2018-10-22 03:31:37', 203);
INSERT INTO `product_variant_translations` VALUES (205, 'Five pairs of disposable underwear men and women travelling bei an pure cotton non paper underwear postpartum cotton children wash free shorts804962', 'en-US', '2018-10-22 03:31:37', '2018-10-22 03:31:37', 204);
INSERT INTO `product_variant_translations` VALUES (206, 'Zichu pregnant womens pure cotton sanitary underwear disposable cotton products postpartum811368', 'en-US', '2018-10-22 03:31:40', '2018-10-22 03:31:40', 205);
INSERT INTO `product_variant_translations` VALUES (207, 'Zichu pregnant womens pure cotton sanitary underwear disposable cotton products postpartum156373', 'en-US', '2018-10-22 03:31:40', '2018-10-22 03:31:40', 206);
INSERT INTO `product_variant_translations` VALUES (208, 'Zichu pregnant womens pure cotton sanitary underwear disposable cotton products postpartum919163', 'en-US', '2018-10-22 03:31:40', '2018-10-22 03:31:40', 207);
INSERT INTO `product_variant_translations` VALUES (209, 'Zichu pregnant womens pure cotton sanitary underwear disposable cotton products postpartum287974', 'en-US', '2018-10-22 03:31:40', '2018-10-22 03:31:40', 208);
INSERT INTO `product_variant_translations` VALUES (210, 'Zichu pregnant womens pure cotton sanitary underwear disposable cotton products postpartum645656', 'en-US', '2018-10-22 03:31:40', '2018-10-22 03:31:40', 209);
INSERT INTO `product_variant_translations` VALUES (211, 'Zichu pregnant womens pure cotton sanitary underwear disposable cotton products postpartum306711', 'en-US', '2018-10-22 03:31:40', '2018-10-22 03:31:40', 210);
INSERT INTO `product_variant_translations` VALUES (212, 'Aag baby rice paste scoop bottle squeeze baby feeding spoon silica gel feeder complementary spoon wholesale291354', 'en-US', '2018-10-22 03:31:43', '2018-10-22 03:31:43', 211);
INSERT INTO `product_variant_translations` VALUES (213, 'Aag baby rice paste scoop bottle squeeze baby feeding spoon silica gel feeder complementary spoon wholesale995387', 'en-US', '2018-10-22 03:31:43', '2018-10-22 03:31:43', 212);
INSERT INTO `product_variant_translations` VALUES (214, 'Aag baby rice paste scoop bottle squeeze baby feeding spoon silica gel feeder complementary spoon wholesale692106', 'en-US', '2018-10-22 03:31:43', '2018-10-22 03:31:43', 213);
INSERT INTO `product_variant_translations` VALUES (215, 'Pet water dispenser pet water dispenser cat water dispenser hanging teddy automatic feeder water bowl toiletries176677', 'en-US', '2018-10-22 03:31:44', '2018-10-22 03:31:44', 214);
INSERT INTO `product_variant_translations` VALUES (216, 'Pet out food cup dog teddy big dog portable feeder water feeder outdoor kettle out supplies602247', 'en-US', '2018-10-22 03:31:46', '2018-10-22 03:31:46', 215);
INSERT INTO `product_variant_translations` VALUES (217, 'Pet out food cup dog teddy big dog portable feeder water feeder outdoor kettle out supplies233643', 'en-US', '2018-10-22 03:31:46', '2018-10-22 03:31:46', 216);
INSERT INTO `product_variant_translations` VALUES (218, 'Pet out food cup dog teddy big dog portable feeder water feeder outdoor kettle out supplies874276', 'en-US', '2018-10-22 03:31:46', '2018-10-22 03:31:46', 217);
INSERT INTO `product_variant_translations` VALUES (219, 'Pet out food cup dog teddy big dog portable feeder water feeder outdoor kettle out supplies489627', 'en-US', '2018-10-22 03:31:46', '2018-10-22 03:31:46', 218);
INSERT INTO `product_variant_translations` VALUES (220, 'Hartley pet accompanying cup outside water cup outdoor portable water jug water bowl dog water dispenser792919', 'en-US', '2018-10-22 03:31:48', '2018-10-22 03:31:48', 219);
INSERT INTO `product_variant_translations` VALUES (221, 'Hartley pet accompanying cup outside water cup outdoor portable water jug water bowl dog water dispenser403420', 'en-US', '2018-10-22 03:31:48', '2018-10-22 03:31:48', 220);
INSERT INTO `product_variant_translations` VALUES (222, 'Hartley pet accompanying cup outside water cup outdoor portable water jug water bowl dog water dispenser894258', 'en-US', '2018-10-22 03:31:48', '2018-10-22 03:31:48', 221);
INSERT INTO `product_variant_translations` VALUES (223, 'Dog chain dog leash large and medium sized dog teddy golden hair dog rope pet supplies361879', 'en-US', '2018-10-22 03:31:50', '2018-10-22 03:31:50', 222);
INSERT INTO `product_variant_translations` VALUES (224, 'Dog chain dog leash large and medium sized dog teddy golden hair dog rope pet supplies119117', 'en-US', '2018-10-22 03:31:50', '2018-10-22 03:31:50', 223);
INSERT INTO `product_variant_translations` VALUES (225, 'Sleeping bag four seasons general purpose cat pad deep sleep cat litter kennel web celebrity dog litter supplies warm in winter235690', 'en-US', '2018-10-22 03:31:52', '2018-10-22 03:31:52', 224);
INSERT INTO `product_variant_translations` VALUES (226, 'Sleeping bag four seasons general purpose cat pad deep sleep cat litter kennel web celebrity dog litter supplies warm in winter586265', 'en-US', '2018-10-22 03:31:52', '2018-10-22 03:31:52', 225);
INSERT INTO `product_variant_translations` VALUES (227, 'Sleeping bag four seasons general purpose cat pad deep sleep cat litter kennel web celebrity dog litter supplies warm in winter956534', 'en-US', '2018-10-22 03:31:52', '2018-10-22 03:31:52', 226);
INSERT INTO `product_variant_translations` VALUES (228, 'Sleeping bag four seasons general purpose cat pad deep sleep cat litter kennel web celebrity dog litter supplies warm in winter210314', 'en-US', '2018-10-22 03:31:52', '2018-10-22 03:31:52', 227);
INSERT INTO `product_variant_translations` VALUES (229, 'Bath and back bath balls394264', 'en-US', '2018-10-22 08:24:44', '2018-10-22 08:24:44', 228);
INSERT INTO `product_variant_translations` VALUES (230, 'Add water to the humidifier on the delmar purification625188', 'en-US', '2018-10-22 08:24:48', '2018-10-22 08:24:48', 229);
INSERT INTO `product_variant_translations` VALUES (231, 'Creative slim desktop stand930487', 'en-US', '2018-10-22 08:24:50', '2018-10-22 08:24:50', 230);
INSERT INTO `product_variant_translations` VALUES (232, 'Creative slim desktop stand472808', 'en-US', '2018-10-22 08:24:50', '2018-10-22 08:24:50', 231);
INSERT INTO `product_variant_translations` VALUES (233, 'Creative slim desktop stand438486', 'en-US', '2018-10-22 08:24:50', '2018-10-22 08:24:50', 232);
INSERT INTO `product_variant_translations` VALUES (234, 'Creative slim desktop stand781600', 'en-US', '2018-10-22 08:24:50', '2018-10-22 08:24:50', 233);
INSERT INTO `product_variant_translations` VALUES (235, 'Small magic clip on car wireless charging mobile phone stand701577', 'en-US', '2018-10-22 08:24:53', '2018-10-22 08:24:53', 234);
INSERT INTO `product_variant_translations` VALUES (236, 'Small magic clip on car wireless charging mobile phone stand853389', 'en-US', '2018-10-22 08:24:53', '2018-10-22 08:24:53', 235);
INSERT INTO `product_variant_translations` VALUES (237, 'Small magic clip on car wireless charging mobile phone stand999033', 'en-US', '2018-10-22 08:24:53', '2018-10-22 08:24:53', 236);
INSERT INTO `product_variant_translations` VALUES (238, 'Rotating shopping bag folding storage bag894833', 'en-US', '2018-10-22 08:24:55', '2018-10-22 08:24:55', 237);
INSERT INTO `product_variant_translations` VALUES (239, 'Rotating shopping bag folding storage bag948315', 'en-US', '2018-10-22 08:24:55', '2018-10-22 08:24:55', 238);
INSERT INTO `product_variant_translations` VALUES (240, 'Traveling wheat straw folding hanger632890', 'en-US', '2018-10-22 08:24:58', '2018-10-22 08:24:58', 239);
INSERT INTO `product_variant_translations` VALUES (241, 'Traveling wheat straw folding hanger890625', 'en-US', '2018-10-22 08:24:58', '2018-10-22 08:24:58', 240);
INSERT INTO `product_variant_translations` VALUES (242, 'Traveling wheat straw folding hanger275190', 'en-US', '2018-10-22 08:24:58', '2018-10-22 08:24:58', 241);
INSERT INTO `product_variant_translations` VALUES (243, 'Traveling wheat straw folding hanger186204', 'en-US', '2018-10-22 08:24:58', '2018-10-22 08:24:58', 242);
INSERT INTO `product_variant_translations` VALUES (244, 'Simple and versatile neck pillow979188', 'en-US', '2018-10-22 08:25:01', '2018-10-22 08:25:01', 243);
INSERT INTO `product_variant_translations` VALUES (245, 'Simple and versatile neck pillow186607', 'en-US', '2018-10-22 08:25:01', '2018-10-22 08:25:01', 244);
INSERT INTO `product_variant_translations` VALUES (246, 'Simple and versatile neck pillow317654', 'en-US', '2018-10-22 08:25:01', '2018-10-22 08:25:01', 245);
INSERT INTO `product_variant_translations` VALUES (247, 'Simple and versatile neck pillow501239', 'en-US', '2018-10-22 08:25:01', '2018-10-22 08:25:01', 246);
INSERT INTO `product_variant_translations` VALUES (248, 'Apoo rebers wireless thin mouse513225', 'en-US', '2018-10-22 08:25:05', '2018-10-22 08:25:05', 247);
INSERT INTO `product_variant_translations` VALUES (249, 'Apoo rebers wireless thin mouse477334', 'en-US', '2018-10-22 08:25:05', '2018-10-22 08:25:05', 248);
INSERT INTO `product_variant_translations` VALUES (250, 'Apoo rebers wireless thin mouse846201', 'en-US', '2018-10-22 08:25:05', '2018-10-22 08:25:05', 249);
INSERT INTO `product_variant_translations` VALUES (251, 'Apoo rebers wireless thin mouse370711', 'en-US', '2018-10-22 08:25:05', '2018-10-22 08:25:05', 250);
INSERT INTO `product_variant_translations` VALUES (252, 'Apoo rebers wireless thin mouse627695', 'en-US', '2018-10-22 08:25:05', '2018-10-22 08:25:05', 251);
INSERT INTO `product_variant_translations` VALUES (253, 'White white wire game mouse348451', 'en-US', '2018-10-22 08:25:08', '2018-10-22 08:25:08', 252);
INSERT INTO `product_variant_translations` VALUES (254, 'White white wire game mouse178294', 'en-US', '2018-10-22 08:25:08', '2018-10-22 08:25:08', 253);
INSERT INTO `product_variant_translations` VALUES (255, 'Qck mass mouse pad912120', 'en-US', '2018-10-22 08:25:12', '2018-10-22 08:25:12', 254);
INSERT INTO `product_variant_translations` VALUES (256, 'Qck mass mouse pad194645', 'en-US', '2018-10-22 08:25:12', '2018-10-22 08:25:12', 255);
INSERT INTO `product_variant_translations` VALUES (257, 'Qck mass mouse pad999009', 'en-US', '2018-10-22 08:25:12', '2018-10-22 08:25:12', 256);
INSERT INTO `product_variant_translations` VALUES (258, 'Qck mass mouse pad896769', 'en-US', '2018-10-22 08:25:12', '2018-10-22 08:25:12', 257);
INSERT INTO `product_variant_translations` VALUES (259, 'Lena hair straightening rollers904102', 'en-US', '2018-10-22 08:25:16', '2018-10-22 08:25:16', 258);
INSERT INTO `product_variant_translations` VALUES (260, 'Bristle air mattress massage comb763869', 'en-US', '2018-10-22 08:25:18', '2018-10-22 08:25:18', 259);
INSERT INTO `product_variant_translations` VALUES (261, 'Cats cradle cats cradle cats cradle cats cradle703449', 'en-US', '2018-10-22 08:26:30', '2018-10-22 08:26:30', 260);
INSERT INTO `product_variant_translations` VALUES (262, 'Cats cradle cats cradle cats cradle cats cradle146310', 'en-US', '2018-10-22 08:26:30', '2018-10-22 08:26:30', 261);
INSERT INTO `product_variant_translations` VALUES (263, 'Cats cradle cats cradle cats cradle cats cradle743686', 'en-US', '2018-10-22 08:26:30', '2018-10-22 08:26:30', 262);
INSERT INTO `product_variant_translations` VALUES (264, 'The doghouse can be removable and washed for large pet kennel teddy samo pet bed small dog kennel828456', 'en-US', '2018-10-22 08:26:31', '2018-10-22 08:26:31', 263);
INSERT INTO `product_variant_translations` VALUES (265, 'The doghouse can be removable and washed for large pet kennel teddy samo pet bed small dog kennel820453', 'en-US', '2018-10-22 08:26:31', '2018-10-22 08:26:31', 264);
INSERT INTO `product_variant_translations` VALUES (266, 'The doghouse can be removable and washed for large pet kennel teddy samo pet bed small dog kennel153095', 'en-US', '2018-10-22 08:26:31', '2018-10-22 08:26:31', 265);
INSERT INTO `product_variant_translations` VALUES (267, 'The doghouse can be removable and washed for large pet kennel teddy samo pet bed small dog kennel513805', 'en-US', '2018-10-22 08:26:32', '2018-10-22 08:26:32', 266);
INSERT INTO `product_variant_translations` VALUES (268, 'The doghouse can be removable and washed for large pet kennel teddy samo pet bed small dog kennel799861', 'en-US', '2018-10-22 08:26:32', '2018-10-22 08:26:32', 267);
INSERT INTO `product_variant_translations` VALUES (269, 'Teddy kennel can be removable and washed four seasons universal pet mat for large medium and small dogs to keep warm in winter web celebrity supplies338851', 'en-US', '2018-10-22 08:26:34', '2018-10-22 08:26:34', 268);
INSERT INTO `product_variant_translations` VALUES (270, 'Teddy kennel can be removable and washed four seasons universal pet mat for large medium and small dogs to keep warm in winter web celebrity supplies604622', 'en-US', '2018-10-22 08:26:34', '2018-10-22 08:26:34', 269);
INSERT INTO `product_variant_translations` VALUES (271, 'Teddy kennel can be removable and washed four seasons universal pet mat for large medium and small dogs to keep warm in winter web celebrity supplies355169', 'en-US', '2018-10-22 08:26:34', '2018-10-22 08:26:34', 270);
INSERT INTO `product_variant_translations` VALUES (272, 'New american air permeable cat hammock sucker cat litter cat cage cat bed to support 26 kg239683', 'en-US', '2018-10-22 08:26:36', '2018-10-22 08:26:36', 271);
INSERT INTO `product_variant_translations` VALUES (273, 'Hot black non stick steel knife set663800', 'en-US', '2018-10-22 08:26:38', '2018-10-22 08:26:38', 272);
INSERT INTO `product_variant_translations` VALUES (274, 'Qiao ah po ceramic kitchen knife black blade cut vegetables fruit knife kitchen narrow chef slice slice watermelon ceramic knife585817', 'en-US', '2018-10-22 08:26:40', '2018-10-22 08:26:40', 273);
INSERT INTO `product_variant_translations` VALUES (275, 'Ceramic knife set kitchen knife knife fruit peeler black blade888447', 'en-US', '2018-10-22 08:26:42', '2018-10-22 08:26:42', 274);
INSERT INTO `product_variant_translations` VALUES (276, 'Oou knife set stainless steel 7 piece set knife kitchen kitchen knife set esther solid wood 7 piece set575841', 'en-US', '2018-10-22 08:26:44', '2018-10-22 08:26:44', 275);
INSERT INTO `product_variant_translations` VALUES (277, 'Oou knife set stainless steel 7 piece set knife kitchen kitchen knife set esther solid wood 7 piece set142899', 'en-US', '2018-10-22 08:26:44', '2018-10-22 08:26:44', 276);
INSERT INTO `product_variant_translations` VALUES (278, 'Touch series ultra rose sliding underpants sharing outfit832853', 'en-US', '2018-10-22 08:26:46', '2018-10-22 08:26:46', 277);
INSERT INTO `product_variant_translations` VALUES (279, 'Touch series ultra rose sliding underpants sharing outfit554704', 'en-US', '2018-10-22 08:26:46', '2018-10-22 08:26:46', 278);
INSERT INTO `product_variant_translations` VALUES (280, 'Cottonsmith mini window dry womens panties 3 pieces whitelight pink single box m131074', 'en-US', '2018-10-22 08:26:48', '2018-10-22 08:26:48', 279);
INSERT INTO `product_variant_translations` VALUES (281, 'Cottonsmith mini window dry womens panties 3 pieces whitelight pink single box m810238', 'en-US', '2018-10-22 08:26:48', '2018-10-22 08:26:48', 280);
INSERT INTO `product_variant_translations` VALUES (282, 'Cottonsmith mini window dry womens panties 3 pieces whitelight pink single box m255095', 'en-US', '2018-10-22 08:26:48', '2018-10-22 08:26:48', 281);
INSERT INTO `product_variant_translations` VALUES (283, 'Cottonsmith mini window dry womens panties 3 pieces whitelight pink single box m529554', 'en-US', '2018-10-22 08:26:48', '2018-10-22 08:26:48', 282);
INSERT INTO `product_variant_translations` VALUES (284, 'Cottonsmith mini window dry womens panties 3 pieces whitelight pink single box m726789', 'en-US', '2018-10-22 08:26:48', '2018-10-22 08:26:48', 283);
INSERT INTO `product_variant_translations` VALUES (285, 'Cottonsmith mini window dry womens panties 3 pieces whitelight pink single box m481626', 'en-US', '2018-10-22 08:26:48', '2018-10-22 08:26:48', 284);
INSERT INTO `product_variant_translations` VALUES (286, 'Cottonsmith mini window dry womens panties 3 pieces whitelight pink single box m599738', 'en-US', '2018-10-22 08:26:48', '2018-10-22 08:26:48', 285);
INSERT INTO `product_variant_translations` VALUES (287, 'Cottonsmith mini window dry womens panties 3 pieces whitelight pink single box m616201', 'en-US', '2018-10-22 08:26:48', '2018-10-22 08:26:48', 286);
INSERT INTO `product_variant_translations` VALUES (288, 'Simple mens casual socks610119', 'en-US', '2018-10-22 08:26:51', '2018-10-22 08:26:51', 287);
INSERT INTO `product_variant_translations` VALUES (289, 'Simple mens casual socks147073', 'en-US', '2018-10-22 08:26:51', '2018-10-22 08:26:51', 288);
INSERT INTO `product_variant_translations` VALUES (290, 'Simple mens casual socks556168', 'en-US', '2018-10-22 08:26:52', '2018-10-22 08:26:52', 289);
INSERT INTO `product_variant_translations` VALUES (291, 'Menna ship socks women socks summer invisible socks shallow mouth anti skid silicone spring summer day thin skin to prevent heel245616', 'en-US', '2018-10-22 08:26:54', '2018-10-22 08:26:54', 290);
INSERT INTO `product_variant_translations` VALUES (292, 'Menna ship socks women socks summer invisible socks shallow mouth anti skid silicone spring summer day thin skin to prevent heel760870', 'en-US', '2018-10-22 08:26:55', '2018-10-22 08:26:55', 291);
INSERT INTO `product_variant_translations` VALUES (293, 'Menna ship socks women socks summer invisible socks shallow mouth anti skid silicone spring summer day thin skin to prevent heel110817', 'en-US', '2018-10-22 08:26:55', '2018-10-22 08:26:55', 292);
INSERT INTO `product_variant_translations` VALUES (294, 'Menna ship socks women socks summer invisible socks shallow mouth anti skid silicone spring summer day thin skin to prevent heel534036', 'en-US', '2018-10-22 08:26:55', '2018-10-22 08:26:55', 293);
INSERT INTO `product_variant_translations` VALUES (295, 'Natural bamboo cutting board thickened non joint non slip cutting board252459', 'en-US', '2018-10-22 08:26:56', '2018-10-22 08:26:56', 294);
INSERT INTO `product_variant_translations` VALUES (296, 'Original wood too round wooden cutting board solid wood healthy cutting board multi functional environmental protection mould proof wooden kitchen cutting board976824', 'en-US', '2018-10-22 08:26:59', '2018-10-22 08:26:59', 295);
INSERT INTO `product_variant_translations` VALUES (297, 'Original wood too round wooden cutting board solid wood healthy cutting board multi functional environmental protection mould proof wooden kitchen cutting board898092', 'en-US', '2018-10-22 08:26:59', '2018-10-22 08:26:59', 296);
INSERT INTO `product_variant_translations` VALUES (298, 'Original wood too round wooden cutting board solid wood healthy cutting board multi functional environmental protection mould proof wooden kitchen cutting board719625', 'en-US', '2018-10-22 08:26:59', '2018-10-22 08:26:59', 297);
INSERT INTO `product_variant_translations` VALUES (299, 'Non shedding water absorbent cloth thickened double layer fine fiber wipe table cloth kitchen cleaning dish towel washing dish cloth217292', 'en-US', '2018-10-22 08:27:01', '2018-10-22 08:27:01', 298);
INSERT INTO `product_variant_translations` VALUES (300, 'Non shedding water absorbent cloth thickened double layer fine fiber wipe table cloth kitchen cleaning dish towel washing dish cloth147671', 'en-US', '2018-10-22 08:27:01', '2018-10-22 08:27:01', 299);
INSERT INTO `product_variant_translations` VALUES (301, 'Non shedding water absorbent cloth thickened double layer fine fiber wipe table cloth kitchen cleaning dish towel washing dish cloth355262', 'en-US', '2018-10-22 08:27:01', '2018-10-22 08:27:01', 300);
INSERT INTO `product_variant_translations` VALUES (302, 'Double color double sided absorbent dish cloth oil wipe towel thickened cloth wipe table cloth kitchen ragdouble color double sided absorbent dish cloth oil wipe towel thickened cloth wipe table cloth kitchen rag150474', 'en-US', '2018-10-22 08:27:04', '2018-10-22 08:27:04', 301);
INSERT INTO `product_variant_translations` VALUES (303, 'Double color double sided absorbent dish cloth oil wipe towel thickened cloth wipe table cloth kitchen ragdouble color double sided absorbent dish cloth oil wipe towel thickened cloth wipe table cloth kitchen rag453749', 'en-US', '2018-10-22 08:27:04', '2018-10-22 08:27:04', 302);
INSERT INTO `product_variant_translations` VALUES (304, 'Double color double sided absorbent dish cloth oil wipe towel thickened cloth wipe table cloth kitchen ragdouble color double sided absorbent dish cloth oil wipe towel thickened cloth wipe table cloth kitchen rag697729', 'en-US', '2018-10-22 08:27:04', '2018-10-22 08:27:04', 303);
INSERT INTO `product_variant_translations` VALUES (305, 'Nylon pot brush with long handle wood does not hurt the pot brush does not stick oil wash dishes wash creative brush531651', 'en-US', '2018-10-22 08:27:06', '2018-10-22 08:27:06', 304);
INSERT INTO `product_variant_translations` VALUES (306, 'Kitchen brush pan brush creative soap brush hand soap brush press on the pan and wash the dishes894875', 'en-US', '2018-10-22 08:27:08', '2018-10-22 08:27:08', 305);
INSERT INTO `product_variant_translations` VALUES (307, 'Kitchen brush pan brush creative soap brush hand soap brush press on the pan and wash the dishes948666', 'en-US', '2018-10-22 08:27:08', '2018-10-22 08:27:08', 306);
INSERT INTO `product_variant_translations` VALUES (308, 'Ice and fire magic subdivision thermos cup783292', 'en-US', '2018-10-22 08:27:11', '2018-10-22 08:27:11', 307);
INSERT INTO `product_variant_translations` VALUES (309, 'Ice and fire magic subdivision thermos cup375936', 'en-US', '2018-10-22 08:27:11', '2018-10-22 08:27:11', 308);
INSERT INTO `product_variant_translations` VALUES (310, 'Ice and fire magic subdivision thermos cup973633', 'en-US', '2018-10-22 08:27:11', '2018-10-22 08:27:11', 309);
INSERT INTO `product_variant_translations` VALUES (311, 'Light smart accompanying vacuum cup551412', 'en-US', '2018-10-22 08:27:16', '2018-10-24 06:13:40', 310);
INSERT INTO `product_variant_translations` VALUES (312, 'Light smart accompanying vacuum cup229346', 'en-US', '2018-10-22 08:27:16', '2018-10-22 08:27:16', 311);
INSERT INTO `product_variant_translations` VALUES (313, 'household-portable-projector', 'en-US', '2018-10-24 06:13:49', '2018-10-24 06:13:49', 312);
COMMIT;

-- ----------------------------
-- Table structure for product_variants
-- ----------------------------
DROP TABLE IF EXISTS `product_variants`;
CREATE TABLE `product_variants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `shipping_category_id` int(10) unsigned DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `width` double NOT NULL COMMENT '单位厘米',
  `height` double NOT NULL COMMENT '单位厘米',
  `length` double NOT NULL COMMENT '单位厘米',
  `weight` double NOT NULL COMMENT '单位 kg',
  `stock` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `sold` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '售出的数量',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_variants_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_variants
-- ----------------------------
BEGIN;
INSERT INTO `product_variants` VALUES (1, 2, NULL, 'xumei-dianchuifeng', 0, 12, 12, 12, 12, 12, 0, '2018-10-19 07:32:49', '2018-10-19 07:32:49');
INSERT INTO `product_variants` VALUES (2, 3, NULL, '118E1A2A249CD7F6FE2CFA57D788A8BE-1', 0, 100, 100, 100, 0.2, 10, 0, '2018-10-19 09:24:37', '2018-10-19 09:24:37');
INSERT INTO `product_variants` VALUES (3, 3, NULL, '118E1A2A249CD7F6FE2CFA57D788A8BE-1', 0, 100, 100, 100, 0.2, 10, 0, '2018-10-19 09:26:22', '2018-10-19 09:26:22');
INSERT INTO `product_variants` VALUES (4, 3, NULL, '118E1A2A249CD7F6FE2CFA57D788A8BE-1', 0, 100, 100, 100, 0.2, 10, 0, '2018-10-19 09:26:26', '2018-10-19 09:26:26');
INSERT INTO `product_variants` VALUES (5, 4, NULL, 'Intelligent-bilateral-electric-breast-pump-breast-pump-1', 0, 23523, 424, 23423, 234, 124, 0, '2018-10-19 09:49:43', '2018-10-19 09:49:43');
INSERT INTO `product_variants` VALUES (6, 6, NULL, '3D0C2B9C02B19F74D37085C9A55B9252-1', 0, 10, 10, 10, 10, 10, 0, '2018-10-19 10:27:04', '2018-10-19 10:27:04');
INSERT INTO `product_variants` VALUES (7, 7, NULL, '3D0C2B9C02B19F74D37085C9A55B9252-1', 0, 10, 10, 10, 10, 10, 0, '2018-10-19 10:42:19', '2018-10-19 10:42:19');
INSERT INTO `product_variants` VALUES (8, 8, NULL, '087d27b26b5522af-1', 0, 10, 10, 101, 10, 100, 0, '2018-10-20 02:05:32', '2018-10-20 02:05:32');
INSERT INTO `product_variants` VALUES (9, 9, NULL, '33b2158d6f26a22cb9681491d4932ed1-red', 0, 10, 10, 10, 10, 999, 0, '2018-10-20 02:40:35', '2018-10-20 02:40:35');
INSERT INTO `product_variants` VALUES (10, 9, NULL, '33b2158d6f26a22cb9681491d4932ed1-black', 0, 10, 10, 10, 10, 999, 0, '2018-10-20 02:45:27', '2018-10-20 02:45:27');
INSERT INTO `product_variants` VALUES (11, 10, NULL, '7291a09701c7425e-black', 0, 10, 10, 10, 10, 999, 0, '2018-10-20 07:54:03', '2018-10-20 07:54:03');
INSERT INTO `product_variants` VALUES (12, 11, NULL, '1520e070b76eb7b9-black-10', 0, 10, 10, 10, 10, 999, 0, '2018-10-20 08:08:34', '2018-10-20 08:08:34');
INSERT INTO `product_variants` VALUES (13, 11, NULL, '1520e070b76eb7b9-red-10', 0, 10, 10, 10, 10, 999, 0, '2018-10-20 08:08:57', '2018-10-20 08:08:57');
INSERT INTO `product_variants` VALUES (14, 11, NULL, '1520e070b76eb7b9-red-20', 0, 10, 10, 10, 10, 999, 0, '2018-10-20 08:11:03', '2018-10-20 08:11:03');
INSERT INTO `product_variants` VALUES (15, 11, NULL, '1520e070b76eb7b9-black-20', 0, 10, 10, 10, 10, 999, 0, '2018-10-20 08:11:14', '2018-10-20 08:11:14');
INSERT INTO `product_variants` VALUES (16, 12, NULL, '4042dc1b2966fce8-red', 0, 10, 10, 10, 10, 999, 0, '2018-10-20 08:42:25', '2018-10-20 08:42:25');
INSERT INTO `product_variants` VALUES (17, 12, NULL, '4042dc1b2966fce8-black', 0, 10, 10, 10, 10, 999, 0, '2018-10-20 08:42:35', '2018-10-20 08:42:35');
INSERT INTO `product_variants` VALUES (18, 13, NULL, 'corbo-light-and-thin-aesthetic-nail-clippers370637', 0, 32, 58, 19, 0, 912, 0, '2018-10-20 10:00:50', '2018-10-20 10:00:50');
INSERT INTO `product_variants` VALUES (19, 13, NULL, 'corbo-light-and-thin-aesthetic-nail-clippers279873', 0, 27, 70, 70, 0, 116, 0, '2018-10-20 10:00:50', '2018-10-20 10:00:50');
INSERT INTO `product_variants` VALUES (20, 13, NULL, 'corbo-light-and-thin-aesthetic-nail-clippers543805', 0, 97, 87, 69, 0, 527, 0, '2018-10-20 10:00:50', '2018-10-20 10:00:50');
INSERT INTO `product_variants` VALUES (21, 13, NULL, 'corbo-light-and-thin-aesthetic-nail-clippers536986', 0, 75, 24, 88, 0, 455, 0, '2018-10-20 10:00:50', '2018-10-20 10:00:50');
INSERT INTO `product_variants` VALUES (22, 14, NULL, 'ultra-thin-mini-20000-mah-mobile-power-supply265065', 0, 64, 26, 67, 0, 807, 0, '2018-10-20 10:00:52', '2018-10-20 10:00:52');
INSERT INTO `product_variants` VALUES (23, 14, NULL, 'ultra-thin-mini-20000-mah-mobile-power-supply370440', 0, 55, 97, 72, 0, 240, 0, '2018-10-20 10:00:52', '2018-10-20 10:00:52');
INSERT INTO `product_variants` VALUES (24, 14, NULL, 'ultra-thin-mini-20000-mah-mobile-power-supply314254', 0, 12, 96, 31, 0, 489, 0, '2018-10-20 10:00:52', '2018-10-20 10:00:52');
INSERT INTO `product_variants` VALUES (25, 14, NULL, 'ultra-thin-mini-20000-mah-mobile-power-supply571922', 0, 73, 83, 61, 0, 487, 0, '2018-10-20 10:00:52', '2018-10-20 10:00:52');
INSERT INTO `product_variants` VALUES (26, 15, NULL, 'compact-multi-function-mobile-power-supply720456', 0, 51, 75, 62, 0, 722, 0, '2018-10-20 10:00:54', '2018-10-20 10:00:54');
INSERT INTO `product_variants` VALUES (27, 15, NULL, 'compact-multi-function-mobile-power-supply630518', 0, 77, 57, 96, 0, 697, 0, '2018-10-20 10:00:54', '2018-10-20 10:00:54');
INSERT INTO `product_variants` VALUES (28, 15, NULL, 'compact-multi-function-mobile-power-supply423482', 0, 10, 71, 85, 0, 817, 0, '2018-10-20 10:00:54', '2018-10-20 10:00:54');
INSERT INTO `product_variants` VALUES (29, 15, NULL, 'compact-multi-function-mobile-power-supply709750', 0, 13, 54, 67, 0, 426, 0, '2018-10-20 10:00:54', '2018-10-20 10:00:54');
INSERT INTO `product_variants` VALUES (30, 16, NULL, 'wireless-smart-quick-charge349609', 0, 11, 71, 43, 0, 868, 0, '2018-10-20 10:00:56', '2018-10-20 10:00:56');
INSERT INTO `product_variants` VALUES (31, 16, NULL, 'wireless-smart-quick-charge737112', 0, 62, 94, 30, 0, 910, 0, '2018-10-20 10:00:57', '2018-10-20 10:00:57');
INSERT INTO `product_variants` VALUES (32, 17, NULL, '12-constellation-night-light-mobile-power-supply670372', 0, 50, 71, 60, 0, 269, 0, '2018-10-20 10:00:58', '2018-10-20 10:00:58');
INSERT INTO `product_variants` VALUES (33, 17, NULL, '12-constellation-night-light-mobile-power-supply522660', 0, 13, 100, 82, 0, 425, 0, '2018-10-20 10:00:58', '2018-10-20 10:00:58');
INSERT INTO `product_variants` VALUES (34, 18, NULL, 'bcase-is-a-different-selfie-stick182613', 0, 56, 27, 69, 0, 658, 0, '2018-10-20 10:01:00', '2018-10-20 10:01:00');
INSERT INTO `product_variants` VALUES (35, 18, NULL, 'bcase-is-a-different-selfie-stick832124', 0, 44, 98, 20, 0, 161, 0, '2018-10-20 10:01:00', '2018-10-20 10:01:00');
INSERT INTO `product_variants` VALUES (36, 18, NULL, 'bcase-is-a-different-selfie-stick788801', 0, 68, 26, 40, 0, 224, 0, '2018-10-20 10:01:00', '2018-10-20 10:01:00');
INSERT INTO `product_variants` VALUES (37, 18, NULL, 'bcase-is-a-different-selfie-stick926181', 0, 52, 87, 76, 0, 652, 0, '2018-10-20 10:01:00', '2018-10-20 10:01:00');
INSERT INTO `product_variants` VALUES (38, 19, NULL, 'flexible-robot-support308515', 0, 47, 76, 14, 0, 437, 0, '2018-10-20 10:01:03', '2018-10-20 10:01:03');
INSERT INTO `product_variants` VALUES (39, 19, NULL, 'flexible-robot-support844478', 0, 72, 53, 89, 0, 822, 0, '2018-10-20 10:01:03', '2018-10-20 10:01:03');
INSERT INTO `product_variants` VALUES (40, 19, NULL, 'flexible-robot-support268417', 0, 99, 18, 14, 0, 914, 0, '2018-10-20 10:01:03', '2018-10-20 10:01:03');
INSERT INTO `product_variants` VALUES (41, 19, NULL, 'flexible-robot-support229866', 0, 41, 92, 94, 0, 771, 0, '2018-10-20 10:01:03', '2018-10-20 10:01:03');
INSERT INTO `product_variants` VALUES (42, 20, NULL, 'smart-pen-for-taking-photos426823', 0, 43, 64, 88, 0, 268, 0, '2018-10-20 10:01:05', '2018-10-20 10:01:05');
INSERT INTO `product_variants` VALUES (43, 20, NULL, 'smart-pen-for-taking-photos481434', 0, 82, 50, 10, 0, 511, 0, '2018-10-20 10:01:05', '2018-10-20 10:01:05');
INSERT INTO `product_variants` VALUES (44, 20, NULL, 'smart-pen-for-taking-photos806884', 0, 36, 62, 53, 0, 362, 0, '2018-10-20 10:01:05', '2018-10-20 10:01:05');
INSERT INTO `product_variants` VALUES (45, 21, NULL, 'the-little-box-is-everything367345', 0, 33, 86, 35, 0, 306, 0, '2018-10-20 10:01:08', '2018-10-20 10:01:08');
INSERT INTO `product_variants` VALUES (46, 22, NULL, 'portable-wireless-bluetooth-speaker560682', 0, 84, 45, 37, 0, 509, 0, '2018-10-20 10:01:12', '2018-10-20 10:01:12');
INSERT INTO `product_variants` VALUES (47, 22, NULL, 'portable-wireless-bluetooth-speaker435460', 0, 45, 94, 59, 0, 785, 0, '2018-10-20 10:01:12', '2018-10-20 10:01:12');
INSERT INTO `product_variants` VALUES (48, 23, NULL, 'mondrian-music-canvas-wireless-bluetooth-speaker501506', 0, 57, 23, 79, 0, 855, 0, '2018-10-20 10:01:14', '2018-10-20 10:01:14');
INSERT INTO `product_variants` VALUES (49, 23, NULL, 'mondrian-music-canvas-wireless-bluetooth-speaker559481', 0, 40, 27, 98, 0, 576, 0, '2018-10-20 10:01:15', '2018-10-20 10:01:15');
INSERT INTO `product_variants` VALUES (50, 23, NULL, 'mondrian-music-canvas-wireless-bluetooth-speaker665754', 0, 79, 30, 48, 0, 189, 0, '2018-10-20 10:01:15', '2018-10-20 10:01:15');
INSERT INTO `product_variants` VALUES (51, 24, NULL, 'high-pretend-bility-electronic-cigarette-holder799737', 0, 20, 15, 95, 0, 279, 0, '2018-10-20 10:01:18', '2018-10-20 10:01:18');
INSERT INTO `product_variants` VALUES (52, 24, NULL, 'high-pretend-bility-electronic-cigarette-holder713509', 0, 21, 29, 69, 0, 263, 0, '2018-10-20 10:01:18', '2018-10-20 10:01:18');
INSERT INTO `product_variants` VALUES (53, 24, NULL, 'high-pretend-bility-electronic-cigarette-holder123149', 0, 53, 43, 52, 0, 562, 0, '2018-10-20 10:01:19', '2018-10-20 10:01:19');
INSERT INTO `product_variants` VALUES (54, 25, NULL, 'small-procedure-body-fat-scale762246', 0, 60, 32, 64, 0, 637, 0, '2018-10-20 10:01:20', '2018-10-20 10:01:20');
INSERT INTO `product_variants` VALUES (55, 26, NULL, 'pma-graphene-thermal-silk-eye-mask377838', 0, 62, 55, 100, 0, 359, 0, '2018-10-20 10:01:23', '2018-10-20 10:01:23');
INSERT INTO `product_variants` VALUES (56, 26, NULL, 'pma-graphene-thermal-silk-eye-mask425403', 0, 32, 16, 66, 0, 791, 0, '2018-10-20 10:01:23', '2018-10-20 10:01:23');
INSERT INTO `product_variants` VALUES (57, 26, NULL, 'pma-graphene-thermal-silk-eye-mask655878', 0, 73, 84, 56, 0, 496, 0, '2018-10-20 10:01:23', '2018-10-20 10:01:23');
INSERT INTO `product_variants` VALUES (58, 27, NULL, 'a-cotton-face-towel952480', 0, 41, 13, 27, 0, 623, 0, '2018-10-20 10:01:25', '2018-10-20 10:01:25');
INSERT INTO `product_variants` VALUES (59, 28, NULL, 'top-layer-cowhide-run-vehicle-belt452041', 0, 35, 99, 77, 0, 735, 0, '2018-10-22 03:30:04', '2018-10-22 03:30:04');
INSERT INTO `product_variants` VALUES (60, 28, NULL, 'top-layer-cowhide-run-vehicle-belt833395', 0, 54, 83, 88, 0, 544, 0, '2018-10-22 03:30:04', '2018-10-22 03:30:04');
INSERT INTO `product_variants` VALUES (61, 29, NULL, '90-split-cow-pickup-bag-folded885907', 0, 71, 76, 12, 0, 442, 0, '2018-10-22 03:30:07', '2018-10-22 03:30:07');
INSERT INTO `product_variants` VALUES (62, 30, NULL, 'leather-purse-womens-2018-new-fashionable-sheepskin-short-mini-multi-functional-wallet-pocket-fold-zero-wallet187705', 0, 77, 92, 62, 0, 992, 0, '2018-10-22 03:30:14', '2018-10-22 03:30:14');
INSERT INTO `product_variants` VALUES (63, 30, NULL, 'leather-purse-womens-2018-new-fashionable-sheepskin-short-mini-multi-functional-wallet-pocket-fold-zero-wallet444268', 0, 82, 39, 98, 0, 827, 0, '2018-10-22 03:30:14', '2018-10-22 03:30:14');
INSERT INTO `product_variants` VALUES (64, 30, NULL, 'leather-purse-womens-2018-new-fashionable-sheepskin-short-mini-multi-functional-wallet-pocket-fold-zero-wallet998572', 0, 19, 10, 65, 0, 656, 0, '2018-10-22 03:30:14', '2018-10-22 03:30:14');
INSERT INTO `product_variants` VALUES (65, 30, NULL, 'leather-purse-womens-2018-new-fashionable-sheepskin-short-mini-multi-functional-wallet-pocket-fold-zero-wallet891115', 0, 80, 25, 25, 0, 944, 0, '2018-10-22 03:30:14', '2018-10-22 03:30:14');
INSERT INTO `product_variants` VALUES (66, 31, NULL, '2018-new-korean-womens-purse-womens-long-style-multi-functional-real-wallet-childrens-money-hand-bag-wallet-tide709469', 0, 64, 32, 37, 0, 580, 0, '2018-10-22 03:30:23', '2018-10-22 03:30:23');
INSERT INTO `product_variants` VALUES (67, 31, NULL, '2018-new-korean-womens-purse-womens-long-style-multi-functional-real-wallet-childrens-money-hand-bag-wallet-tide143223', 0, 76, 32, 18, 0, 664, 0, '2018-10-22 03:30:23', '2018-10-22 03:30:23');
INSERT INTO `product_variants` VALUES (68, 31, NULL, '2018-new-korean-womens-purse-womens-long-style-multi-functional-real-wallet-childrens-money-hand-bag-wallet-tide334189', 0, 69, 21, 28, 0, 614, 0, '2018-10-22 03:30:23', '2018-10-22 03:30:23');
INSERT INTO `product_variants` VALUES (69, 31, NULL, '2018-new-korean-womens-purse-womens-long-style-multi-functional-real-wallet-childrens-money-hand-bag-wallet-tide526756', 0, 63, 70, 37, 0, 962, 0, '2018-10-22 03:30:23', '2018-10-22 03:30:23');
INSERT INTO `product_variants` VALUES (70, 31, NULL, '2018-new-korean-womens-purse-womens-long-style-multi-functional-real-wallet-childrens-money-hand-bag-wallet-tide455138', 0, 78, 80, 18, 0, 544, 0, '2018-10-22 03:30:23', '2018-10-22 03:30:23');
INSERT INTO `product_variants` VALUES (71, 31, NULL, '2018-new-korean-womens-purse-womens-long-style-multi-functional-real-wallet-childrens-money-hand-bag-wallet-tide915538', 0, 60, 90, 86, 0, 154, 0, '2018-10-22 03:30:23', '2018-10-22 03:30:23');
INSERT INTO `product_variants` VALUES (72, 31, NULL, '2018-new-korean-womens-purse-womens-long-style-multi-functional-real-wallet-childrens-money-hand-bag-wallet-tide617254', 0, 80, 63, 99, 0, 458, 0, '2018-10-22 03:30:23', '2018-10-22 03:30:23');
INSERT INTO `product_variants` VALUES (73, 32, NULL, 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black119518', 0, 18, 16, 21, 0, 480, 0, '2018-10-22 03:30:31', '2018-10-22 03:30:31');
INSERT INTO `product_variants` VALUES (74, 32, NULL, 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black302818', 0, 90, 33, 95, 0, 979, 0, '2018-10-22 03:30:31', '2018-10-22 03:30:31');
INSERT INTO `product_variants` VALUES (75, 32, NULL, 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black689434', 0, 20, 18, 49, 0, 780, 0, '2018-10-22 03:30:31', '2018-10-22 03:30:31');
INSERT INTO `product_variants` VALUES (76, 32, NULL, 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black410386', 0, 82, 92, 55, 0, 782, 0, '2018-10-22 03:30:31', '2018-10-22 03:30:31');
INSERT INTO `product_variants` VALUES (77, 32, NULL, 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black830189', 0, 92, 72, 94, 0, 376, 0, '2018-10-22 03:30:32', '2018-10-22 03:30:32');
INSERT INTO `product_variants` VALUES (78, 32, NULL, 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black108719', 0, 92, 60, 97, 0, 453, 0, '2018-10-22 03:30:32', '2018-10-22 03:30:32');
INSERT INTO `product_variants` VALUES (79, 32, NULL, 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black881004', 0, 95, 41, 54, 0, 584, 0, '2018-10-22 03:30:32', '2018-10-22 03:30:32');
INSERT INTO `product_variants` VALUES (80, 32, NULL, 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black876953', 0, 71, 55, 63, 0, 557, 0, '2018-10-22 03:30:32', '2018-10-22 03:30:32');
INSERT INTO `product_variants` VALUES (81, 32, NULL, 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black237055', 0, 61, 48, 98, 0, 424, 0, '2018-10-22 03:30:32', '2018-10-22 03:30:32');
INSERT INTO `product_variants` VALUES (82, 32, NULL, 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black550150', 0, 88, 67, 30, 0, 477, 0, '2018-10-22 03:30:32', '2018-10-22 03:30:32');
INSERT INTO `product_variants` VALUES (83, 32, NULL, 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black716177', 0, 64, 64, 60, 0, 101, 0, '2018-10-22 03:30:32', '2018-10-22 03:30:32');
INSERT INTO `product_variants` VALUES (84, 32, NULL, 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black284223', 0, 60, 91, 57, 0, 709, 0, '2018-10-22 03:30:32', '2018-10-22 03:30:32');
INSERT INTO `product_variants` VALUES (85, 32, NULL, 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black974527', 0, 57, 74, 62, 0, 971, 0, '2018-10-22 03:30:32', '2018-10-22 03:30:32');
INSERT INTO `product_variants` VALUES (86, 32, NULL, 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black573272', 0, 52, 52, 61, 0, 799, 0, '2018-10-22 03:30:32', '2018-10-22 03:30:32');
INSERT INTO `product_variants` VALUES (87, 32, NULL, 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black309423', 0, 97, 57, 54, 0, 896, 0, '2018-10-22 03:30:32', '2018-10-22 03:30:32');
INSERT INTO `product_variants` VALUES (88, 32, NULL, 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black543743', 0, 16, 88, 93, 0, 228, 0, '2018-10-22 03:30:32', '2018-10-22 03:30:32');
INSERT INTO `product_variants` VALUES (89, 32, NULL, 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black528206', 0, 69, 78, 25, 0, 881, 0, '2018-10-22 03:30:32', '2018-10-22 03:30:32');
INSERT INTO `product_variants` VALUES (90, 32, NULL, 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black457359', 0, 37, 50, 96, 0, 430, 0, '2018-10-22 03:30:32', '2018-10-22 03:30:32');
INSERT INTO `product_variants` VALUES (91, 32, NULL, 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black843874', 0, 77, 81, 80, 0, 743, 0, '2018-10-22 03:30:32', '2018-10-22 03:30:32');
INSERT INTO `product_variants` VALUES (92, 32, NULL, 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black726241', 0, 69, 66, 64, 0, 957, 0, '2018-10-22 03:30:32', '2018-10-22 03:30:32');
INSERT INTO `product_variants` VALUES (93, 32, NULL, 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black220111', 0, 41, 46, 43, 0, 644, 0, '2018-10-22 03:30:32', '2018-10-22 03:30:32');
INSERT INTO `product_variants` VALUES (94, 32, NULL, 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black465012', 0, 55, 65, 84, 0, 495, 0, '2018-10-22 03:30:32', '2018-10-22 03:30:32');
INSERT INTO `product_variants` VALUES (95, 32, NULL, 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black682050', 0, 70, 24, 86, 0, 414, 0, '2018-10-22 03:30:32', '2018-10-22 03:30:32');
INSERT INTO `product_variants` VALUES (96, 32, NULL, 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black544787', 0, 91, 56, 88, 0, 920, 0, '2018-10-22 03:30:32', '2018-10-22 03:30:32');
INSERT INTO `product_variants` VALUES (97, 32, NULL, 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black563826', 0, 74, 78, 33, 0, 906, 0, '2018-10-22 03:30:32', '2018-10-22 03:30:32');
INSERT INTO `product_variants` VALUES (98, 33, NULL, 'havaianas-brazil-2018-classic-flip-flops-top-black-slip-resistant-slipper-for-men-and-women-havana856369', 0, 27, 67, 13, 0, 748, 0, '2018-10-22 03:30:38', '2018-10-22 03:30:38');
INSERT INTO `product_variants` VALUES (99, 33, NULL, 'havaianas-brazil-2018-classic-flip-flops-top-black-slip-resistant-slipper-for-men-and-women-havana587123', 0, 85, 34, 62, 0, 170, 0, '2018-10-22 03:30:38', '2018-10-22 03:30:38');
INSERT INTO `product_variants` VALUES (100, 33, NULL, 'havaianas-brazil-2018-classic-flip-flops-top-black-slip-resistant-slipper-for-men-and-women-havana125881', 0, 35, 45, 70, 0, 876, 0, '2018-10-22 03:30:38', '2018-10-22 03:30:38');
INSERT INTO `product_variants` VALUES (101, 33, NULL, 'havaianas-brazil-2018-classic-flip-flops-top-black-slip-resistant-slipper-for-men-and-women-havana147898', 0, 91, 99, 40, 0, 770, 0, '2018-10-22 03:30:38', '2018-10-22 03:30:38');
INSERT INTO `product_variants` VALUES (102, 33, NULL, 'havaianas-brazil-2018-classic-flip-flops-top-black-slip-resistant-slipper-for-men-and-women-havana480642', 0, 72, 56, 67, 0, 554, 0, '2018-10-22 03:30:38', '2018-10-22 03:30:38');
INSERT INTO `product_variants` VALUES (103, 33, NULL, 'havaianas-brazil-2018-classic-flip-flops-top-black-slip-resistant-slipper-for-men-and-women-havana850759', 0, 35, 27, 58, 0, 643, 0, '2018-10-22 03:30:38', '2018-10-22 03:30:38');
INSERT INTO `product_variants` VALUES (104, 33, NULL, 'havaianas-brazil-2018-classic-flip-flops-top-black-slip-resistant-slipper-for-men-and-women-havana482096', 0, 38, 62, 57, 0, 919, 0, '2018-10-22 03:30:38', '2018-10-22 03:30:38');
INSERT INTO `product_variants` VALUES (105, 33, NULL, 'havaianas-brazil-2018-classic-flip-flops-top-black-slip-resistant-slipper-for-men-and-women-havana434419', 0, 40, 47, 85, 0, 173, 0, '2018-10-22 03:30:38', '2018-10-22 03:30:38');
INSERT INTO `product_variants` VALUES (106, 34, NULL, 'warm-shadow-home-female-home-dress-spring-and-autumn-mo-dyer-home-dress-seven-sleeves-long-pants-two-pieces-of-nordic-beauty-when-you-can-wear-a-home-dress-suit279385', 0, 35, 52, 26, 0, 990, 0, '2018-10-22 03:30:45', '2018-10-22 03:30:45');
INSERT INTO `product_variants` VALUES (107, 34, NULL, 'warm-shadow-home-female-home-dress-spring-and-autumn-mo-dyer-home-dress-seven-sleeves-long-pants-two-pieces-of-nordic-beauty-when-you-can-wear-a-home-dress-suit212033', 0, 64, 18, 69, 0, 904, 0, '2018-10-22 03:30:45', '2018-10-22 03:30:45');
INSERT INTO `product_variants` VALUES (108, 34, NULL, 'warm-shadow-home-female-home-dress-spring-and-autumn-mo-dyer-home-dress-seven-sleeves-long-pants-two-pieces-of-nordic-beauty-when-you-can-wear-a-home-dress-suit609833', 0, 17, 49, 70, 0, 298, 0, '2018-10-22 03:30:45', '2018-10-22 03:30:45');
INSERT INTO `product_variants` VALUES (109, 34, NULL, 'warm-shadow-home-female-home-dress-spring-and-autumn-mo-dyer-home-dress-seven-sleeves-long-pants-two-pieces-of-nordic-beauty-when-you-can-wear-a-home-dress-suit300057', 0, 75, 83, 10, 0, 239, 0, '2018-10-22 03:30:45', '2018-10-22 03:30:45');
INSERT INTO `product_variants` VALUES (110, 34, NULL, 'warm-shadow-home-female-home-dress-spring-and-autumn-mo-dyer-home-dress-seven-sleeves-long-pants-two-pieces-of-nordic-beauty-when-you-can-wear-a-home-dress-suit613845', 0, 41, 20, 57, 0, 634, 0, '2018-10-22 03:30:46', '2018-10-22 03:30:46');
INSERT INTO `product_variants` VALUES (111, 34, NULL, 'warm-shadow-home-female-home-dress-spring-and-autumn-mo-dyer-home-dress-seven-sleeves-long-pants-two-pieces-of-nordic-beauty-when-you-can-wear-a-home-dress-suit677168', 0, 11, 13, 30, 0, 636, 0, '2018-10-22 03:30:46', '2018-10-22 03:30:46');
INSERT INTO `product_variants` VALUES (112, 34, NULL, 'warm-shadow-home-female-home-dress-spring-and-autumn-mo-dyer-home-dress-seven-sleeves-long-pants-two-pieces-of-nordic-beauty-when-you-can-wear-a-home-dress-suit400272', 0, 57, 94, 60, 0, 636, 0, '2018-10-22 03:30:46', '2018-10-22 03:30:46');
INSERT INTO `product_variants` VALUES (113, 34, NULL, 'warm-shadow-home-female-home-dress-spring-and-autumn-mo-dyer-home-dress-seven-sleeves-long-pants-two-pieces-of-nordic-beauty-when-you-can-wear-a-home-dress-suit903128', 0, 10, 44, 63, 0, 905, 0, '2018-10-22 03:30:46', '2018-10-22 03:30:46');
INSERT INTO `product_variants` VALUES (114, 34, NULL, 'warm-shadow-home-female-home-dress-spring-and-autumn-mo-dyer-home-dress-seven-sleeves-long-pants-two-pieces-of-nordic-beauty-when-you-can-wear-a-home-dress-suit269106', 0, 44, 38, 55, 0, 196, 0, '2018-10-22 03:30:46', '2018-10-22 03:30:46');
INSERT INTO `product_variants` VALUES (115, 34, NULL, 'warm-shadow-home-female-home-dress-spring-and-autumn-mo-dyer-home-dress-seven-sleeves-long-pants-two-pieces-of-nordic-beauty-when-you-can-wear-a-home-dress-suit258047', 0, 65, 87, 28, 0, 638, 0, '2018-10-22 03:30:46', '2018-10-22 03:30:46');
INSERT INTO `product_variants` VALUES (116, 34, NULL, 'warm-shadow-home-female-home-dress-spring-and-autumn-mo-dyer-home-dress-seven-sleeves-long-pants-two-pieces-of-nordic-beauty-when-you-can-wear-a-home-dress-suit647508', 0, 100, 33, 33, 0, 416, 0, '2018-10-22 03:30:46', '2018-10-22 03:30:46');
INSERT INTO `product_variants` VALUES (117, 34, NULL, 'warm-shadow-home-female-home-dress-spring-and-autumn-mo-dyer-home-dress-seven-sleeves-long-pants-two-pieces-of-nordic-beauty-when-you-can-wear-a-home-dress-suit541265', 0, 43, 32, 14, 0, 828, 0, '2018-10-22 03:30:46', '2018-10-22 03:30:46');
INSERT INTO `product_variants` VALUES (118, 35, NULL, 'mens-pajamas-long-sleeved-cotton-spring-and-autumn-cardigan-men-plus-size-autumn-winter-household-suit-mens-young-man353068', 0, 63, 29, 98, 0, 308, 0, '2018-10-22 03:30:51', '2018-10-22 03:30:51');
INSERT INTO `product_variants` VALUES (119, 35, NULL, 'mens-pajamas-long-sleeved-cotton-spring-and-autumn-cardigan-men-plus-size-autumn-winter-household-suit-mens-young-man576874', 0, 80, 86, 59, 0, 977, 0, '2018-10-22 03:30:51', '2018-10-22 03:30:51');
INSERT INTO `product_variants` VALUES (120, 35, NULL, 'mens-pajamas-long-sleeved-cotton-spring-and-autumn-cardigan-men-plus-size-autumn-winter-household-suit-mens-young-man434889', 0, 59, 97, 79, 0, 686, 0, '2018-10-22 03:30:51', '2018-10-22 03:30:51');
INSERT INTO `product_variants` VALUES (121, 35, NULL, 'mens-pajamas-long-sleeved-cotton-spring-and-autumn-cardigan-men-plus-size-autumn-winter-household-suit-mens-young-man876299', 0, 54, 10, 51, 0, 443, 0, '2018-10-22 03:30:51', '2018-10-22 03:30:51');
INSERT INTO `product_variants` VALUES (122, 35, NULL, 'mens-pajamas-long-sleeved-cotton-spring-and-autumn-cardigan-men-plus-size-autumn-winter-household-suit-mens-young-man241575', 0, 68, 56, 84, 0, 355, 0, '2018-10-22 03:30:51', '2018-10-22 03:30:51');
INSERT INTO `product_variants` VALUES (123, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers704085', 0, 74, 53, 36, 0, 744, 0, '2018-10-22 03:30:55', '2018-10-22 03:30:55');
INSERT INTO `product_variants` VALUES (124, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers691746', 0, 19, 77, 12, 0, 525, 0, '2018-10-22 03:30:55', '2018-10-22 03:30:55');
INSERT INTO `product_variants` VALUES (125, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers398225', 0, 20, 73, 17, 0, 112, 0, '2018-10-22 03:30:55', '2018-10-22 03:30:55');
INSERT INTO `product_variants` VALUES (126, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers753180', 0, 15, 13, 32, 0, 268, 0, '2018-10-22 03:30:55', '2018-10-22 03:30:55');
INSERT INTO `product_variants` VALUES (127, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers838677', 0, 68, 19, 61, 0, 830, 0, '2018-10-22 03:30:55', '2018-10-22 03:30:55');
INSERT INTO `product_variants` VALUES (128, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers290056', 0, 83, 77, 80, 0, 143, 0, '2018-10-22 03:30:55', '2018-10-22 03:30:55');
INSERT INTO `product_variants` VALUES (129, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers192775', 0, 75, 96, 49, 0, 352, 0, '2018-10-22 03:30:55', '2018-10-22 03:30:55');
INSERT INTO `product_variants` VALUES (130, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers888575', 0, 59, 51, 46, 0, 566, 0, '2018-10-22 03:30:55', '2018-10-22 03:30:55');
INSERT INTO `product_variants` VALUES (131, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers656134', 0, 39, 41, 68, 0, 190, 0, '2018-10-22 03:30:55', '2018-10-22 03:30:55');
INSERT INTO `product_variants` VALUES (132, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers551872', 0, 50, 85, 41, 0, 112, 0, '2018-10-22 03:30:55', '2018-10-22 03:30:55');
INSERT INTO `product_variants` VALUES (133, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers567852', 0, 100, 16, 33, 0, 497, 0, '2018-10-22 03:30:55', '2018-10-22 03:30:55');
INSERT INTO `product_variants` VALUES (134, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers162808', 0, 62, 56, 23, 0, 730, 0, '2018-10-22 03:30:55', '2018-10-22 03:30:55');
INSERT INTO `product_variants` VALUES (135, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers960642', 0, 67, 91, 25, 0, 228, 0, '2018-10-22 03:30:55', '2018-10-22 03:30:55');
INSERT INTO `product_variants` VALUES (136, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers710559', 0, 95, 48, 79, 0, 355, 0, '2018-10-22 03:30:55', '2018-10-22 03:30:55');
INSERT INTO `product_variants` VALUES (137, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers453812', 0, 65, 15, 96, 0, 541, 0, '2018-10-22 03:30:55', '2018-10-22 03:30:55');
INSERT INTO `product_variants` VALUES (138, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers906688', 0, 70, 75, 40, 0, 677, 0, '2018-10-22 03:30:55', '2018-10-22 03:30:55');
INSERT INTO `product_variants` VALUES (139, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers168875', 0, 89, 23, 100, 0, 993, 0, '2018-10-22 03:30:56', '2018-10-22 03:30:56');
INSERT INTO `product_variants` VALUES (140, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers214027', 0, 23, 72, 60, 0, 312, 0, '2018-10-22 03:30:56', '2018-10-22 03:30:56');
INSERT INTO `product_variants` VALUES (141, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers467473', 0, 40, 84, 38, 0, 879, 0, '2018-10-22 03:30:56', '2018-10-22 03:30:56');
INSERT INTO `product_variants` VALUES (142, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers595854', 0, 39, 83, 57, 0, 709, 0, '2018-10-22 03:30:56', '2018-10-22 03:30:56');
INSERT INTO `product_variants` VALUES (143, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers600777', 0, 39, 27, 71, 0, 526, 0, '2018-10-22 03:30:56', '2018-10-22 03:30:56');
INSERT INTO `product_variants` VALUES (144, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers321876', 0, 44, 64, 25, 0, 961, 0, '2018-10-22 03:30:56', '2018-10-22 03:30:56');
INSERT INTO `product_variants` VALUES (145, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers998549', 0, 81, 62, 11, 0, 778, 0, '2018-10-22 03:30:56', '2018-10-22 03:30:56');
INSERT INTO `product_variants` VALUES (146, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers580879', 0, 28, 42, 13, 0, 689, 0, '2018-10-22 03:30:56', '2018-10-22 03:30:56');
INSERT INTO `product_variants` VALUES (147, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers286789', 0, 88, 65, 91, 0, 529, 0, '2018-10-22 03:30:56', '2018-10-22 03:30:56');
INSERT INTO `product_variants` VALUES (148, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers251281', 0, 21, 27, 23, 0, 252, 0, '2018-10-22 03:30:56', '2018-10-22 03:30:56');
INSERT INTO `product_variants` VALUES (149, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers296458', 0, 80, 94, 50, 0, 302, 0, '2018-10-22 03:30:56', '2018-10-22 03:30:56');
INSERT INTO `product_variants` VALUES (150, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers511093', 0, 32, 36, 68, 0, 381, 0, '2018-10-22 03:30:56', '2018-10-22 03:30:56');
INSERT INTO `product_variants` VALUES (151, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers121391', 0, 99, 17, 69, 0, 487, 0, '2018-10-22 03:30:56', '2018-10-22 03:30:56');
INSERT INTO `product_variants` VALUES (152, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers461600', 0, 96, 26, 56, 0, 689, 0, '2018-10-22 03:30:56', '2018-10-22 03:30:56');
INSERT INTO `product_variants` VALUES (153, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers824167', 0, 59, 53, 27, 0, 489, 0, '2018-10-22 03:30:56', '2018-10-22 03:30:56');
INSERT INTO `product_variants` VALUES (154, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers863971', 0, 95, 77, 43, 0, 110, 0, '2018-10-22 03:30:56', '2018-10-22 03:30:56');
INSERT INTO `product_variants` VALUES (155, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers955770', 0, 93, 75, 15, 0, 309, 0, '2018-10-22 03:30:56', '2018-10-22 03:30:56');
INSERT INTO `product_variants` VALUES (156, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers637600', 0, 71, 20, 94, 0, 946, 0, '2018-10-22 03:30:56', '2018-10-22 03:30:56');
INSERT INTO `product_variants` VALUES (157, 36, NULL, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers714103', 0, 98, 17, 68, 0, 296, 0, '2018-10-22 03:30:56', '2018-10-22 03:30:56');
INSERT INTO `product_variants` VALUES (158, 37, NULL, 'tight-pants-male-gym-suit-high-bounce-speed-dry-run-sports-compression-basketball-leggings-long-pants-seven-points-plus-pile-training297571', 0, 28, 85, 19, 0, 242, 0, '2018-10-22 03:31:00', '2018-10-22 03:31:00');
INSERT INTO `product_variants` VALUES (159, 37, NULL, 'tight-pants-male-gym-suit-high-bounce-speed-dry-run-sports-compression-basketball-leggings-long-pants-seven-points-plus-pile-training697599', 0, 49, 90, 45, 0, 876, 0, '2018-10-22 03:31:00', '2018-10-22 03:31:00');
INSERT INTO `product_variants` VALUES (160, 37, NULL, 'tight-pants-male-gym-suit-high-bounce-speed-dry-run-sports-compression-basketball-leggings-long-pants-seven-points-plus-pile-training656785', 0, 42, 53, 96, 0, 867, 0, '2018-10-22 03:31:00', '2018-10-22 03:31:00');
INSERT INTO `product_variants` VALUES (161, 37, NULL, 'tight-pants-male-gym-suit-high-bounce-speed-dry-run-sports-compression-basketball-leggings-long-pants-seven-points-plus-pile-training869778', 0, 88, 52, 45, 0, 823, 0, '2018-10-22 03:31:00', '2018-10-22 03:31:00');
INSERT INTO `product_variants` VALUES (162, 37, NULL, 'tight-pants-male-gym-suit-high-bounce-speed-dry-run-sports-compression-basketball-leggings-long-pants-seven-points-plus-pile-training581481', 0, 73, 62, 33, 0, 879, 0, '2018-10-22 03:31:00', '2018-10-22 03:31:00');
INSERT INTO `product_variants` VALUES (163, 37, NULL, 'tight-pants-male-gym-suit-high-bounce-speed-dry-run-sports-compression-basketball-leggings-long-pants-seven-points-plus-pile-training841156', 0, 65, 77, 48, 0, 190, 0, '2018-10-22 03:31:00', '2018-10-22 03:31:00');
INSERT INTO `product_variants` VALUES (164, 37, NULL, 'tight-pants-male-gym-suit-high-bounce-speed-dry-run-sports-compression-basketball-leggings-long-pants-seven-points-plus-pile-training218481', 0, 54, 67, 59, 0, 563, 0, '2018-10-22 03:31:00', '2018-10-22 03:31:00');
INSERT INTO `product_variants` VALUES (165, 38, NULL, 'the-antarctic-peoples-60-satins-long-plush-cotton-four-piece-cotton-plain-womens-bed-sheet-and-quilt-cover-20m-bedding664825', 0, 26, 78, 38, 0, 610, 0, '2018-10-22 03:31:04', '2018-10-22 03:31:04');
INSERT INTO `product_variants` VALUES (166, 39, NULL, 'non-printed-cotton-acorns-embroidered-plaid-washed-cotton-fine-cotton-four-piece-sheet-bed-bonnets891413', 0, 72, 81, 32, 0, 755, 0, '2018-10-22 03:31:08', '2018-10-22 03:31:08');
INSERT INTO `product_variants` VALUES (167, 39, NULL, 'non-printed-cotton-acorns-embroidered-plaid-washed-cotton-fine-cotton-four-piece-sheet-bed-bonnets594235', 0, 62, 49, 61, 0, 199, 0, '2018-10-22 03:31:08', '2018-10-22 03:31:08');
INSERT INTO `product_variants` VALUES (168, 39, NULL, 'non-printed-cotton-acorns-embroidered-plaid-washed-cotton-fine-cotton-four-piece-sheet-bed-bonnets514994', 0, 85, 47, 22, 0, 533, 0, '2018-10-22 03:31:09', '2018-10-22 03:31:09');
INSERT INTO `product_variants` VALUES (169, 39, NULL, 'non-printed-cotton-acorns-embroidered-plaid-washed-cotton-fine-cotton-four-piece-sheet-bed-bonnets972484', 0, 50, 61, 79, 0, 588, 0, '2018-10-22 03:31:09', '2018-10-22 03:31:09');
INSERT INTO `product_variants` VALUES (170, 40, NULL, 'shuxiang-home-anti-bacterial-anti-mite-waterproof-bed-li-three-pieces-set964018', 0, 76, 12, 96, 0, 954, 0, '2018-10-22 03:31:12', '2018-10-22 03:31:12');
INSERT INTO `product_variants` VALUES (171, 41, NULL, 'double-bed-made-of-silk-and-cotton-of-egypt431161', 0, 75, 84, 75, 0, 341, 0, '2018-10-22 03:31:15', '2018-10-22 03:31:15');
INSERT INTO `product_variants` VALUES (172, 41, NULL, 'double-bed-made-of-silk-and-cotton-of-egypt421418', 0, 13, 60, 24, 0, 487, 0, '2018-10-22 03:31:15', '2018-10-22 03:31:15');
INSERT INTO `product_variants` VALUES (173, 41, NULL, 'double-bed-made-of-silk-and-cotton-of-egypt678859', 0, 59, 97, 23, 0, 212, 0, '2018-10-22 03:31:15', '2018-10-22 03:31:15');
INSERT INTO `product_variants` VALUES (174, 41, NULL, 'double-bed-made-of-silk-and-cotton-of-egypt158052', 0, 29, 48, 83, 0, 912, 0, '2018-10-22 03:31:15', '2018-10-22 03:31:15');
INSERT INTO `product_variants` VALUES (175, 41, NULL, 'double-bed-made-of-silk-and-cotton-of-egypt537623', 0, 42, 13, 33, 0, 394, 0, '2018-10-22 03:31:15', '2018-10-22 03:31:15');
INSERT INTO `product_variants` VALUES (176, 41, NULL, 'double-bed-made-of-silk-and-cotton-of-egypt604832', 0, 62, 48, 59, 0, 468, 0, '2018-10-22 03:31:15', '2018-10-22 03:31:15');
INSERT INTO `product_variants` VALUES (177, 41, NULL, 'double-bed-made-of-silk-and-cotton-of-egypt242759', 0, 58, 93, 69, 0, 219, 0, '2018-10-22 03:31:15', '2018-10-22 03:31:15');
INSERT INTO `product_variants` VALUES (178, 41, NULL, 'double-bed-made-of-silk-and-cotton-of-egypt467261', 0, 77, 65, 62, 0, 949, 0, '2018-10-22 03:31:15', '2018-10-22 03:31:15');
INSERT INTO `product_variants` VALUES (179, 42, NULL, 'lequan-pure-color-cotton-bed-sheet-single-15182-m-double-bed-sheet-student-12m-springsummer-bed-sheet875862', 0, 42, 95, 91, 0, 245, 0, '2018-10-22 03:31:19', '2018-10-22 03:31:19');
INSERT INTO `product_variants` VALUES (180, 42, NULL, 'lequan-pure-color-cotton-bed-sheet-single-15182-m-double-bed-sheet-student-12m-springsummer-bed-sheet530549', 0, 43, 43, 65, 0, 398, 0, '2018-10-22 03:31:19', '2018-10-22 03:31:19');
INSERT INTO `product_variants` VALUES (181, 42, NULL, 'lequan-pure-color-cotton-bed-sheet-single-15182-m-double-bed-sheet-student-12m-springsummer-bed-sheet261212', 0, 84, 20, 29, 0, 566, 0, '2018-10-22 03:31:19', '2018-10-22 03:31:19');
INSERT INTO `product_variants` VALUES (182, 42, NULL, 'lequan-pure-color-cotton-bed-sheet-single-15182-m-double-bed-sheet-student-12m-springsummer-bed-sheet477098', 0, 89, 48, 12, 0, 836, 0, '2018-10-22 03:31:19', '2018-10-22 03:31:19');
INSERT INTO `product_variants` VALUES (183, 42, NULL, 'lequan-pure-color-cotton-bed-sheet-single-15182-m-double-bed-sheet-student-12m-springsummer-bed-sheet949604', 0, 99, 57, 23, 0, 804, 0, '2018-10-22 03:31:19', '2018-10-22 03:31:19');
INSERT INTO `product_variants` VALUES (184, 42, NULL, 'lequan-pure-color-cotton-bed-sheet-single-15182-m-double-bed-sheet-student-12m-springsummer-bed-sheet883812', 0, 19, 90, 86, 0, 735, 0, '2018-10-22 03:31:19', '2018-10-22 03:31:19');
INSERT INTO `product_variants` VALUES (185, 42, NULL, 'lequan-pure-color-cotton-bed-sheet-single-15182-m-double-bed-sheet-student-12m-springsummer-bed-sheet521876', 0, 51, 30, 89, 0, 534, 0, '2018-10-22 03:31:20', '2018-10-22 03:31:20');
INSERT INTO `product_variants` VALUES (186, 42, NULL, 'lequan-pure-color-cotton-bed-sheet-single-15182-m-double-bed-sheet-student-12m-springsummer-bed-sheet869327', 0, 35, 12, 72, 0, 947, 0, '2018-10-22 03:31:20', '2018-10-22 03:31:20');
INSERT INTO `product_variants` VALUES (187, 42, NULL, 'lequan-pure-color-cotton-bed-sheet-single-15182-m-double-bed-sheet-student-12m-springsummer-bed-sheet495208', 0, 84, 50, 59, 0, 206, 0, '2018-10-22 03:31:20', '2018-10-22 03:31:20');
INSERT INTO `product_variants` VALUES (188, 42, NULL, 'lequan-pure-color-cotton-bed-sheet-single-15182-m-double-bed-sheet-student-12m-springsummer-bed-sheet661924', 0, 25, 28, 16, 0, 457, 0, '2018-10-22 03:31:20', '2018-10-22 03:31:20');
INSERT INTO `product_variants` VALUES (189, 42, NULL, 'lequan-pure-color-cotton-bed-sheet-single-15182-m-double-bed-sheet-student-12m-springsummer-bed-sheet438284', 0, 90, 51, 79, 0, 702, 0, '2018-10-22 03:31:20', '2018-10-22 03:31:20');
INSERT INTO `product_variants` VALUES (190, 42, NULL, 'lequan-pure-color-cotton-bed-sheet-single-15182-m-double-bed-sheet-student-12m-springsummer-bed-sheet555190', 0, 14, 64, 77, 0, 245, 0, '2018-10-22 03:31:20', '2018-10-22 03:31:20');
INSERT INTO `product_variants` VALUES (191, 43, NULL, 'a-sleep-saving-pillow269984', 0, 42, 84, 59, 0, 545, 0, '2018-10-22 03:31:22', '2018-10-22 03:31:22');
INSERT INTO `product_variants` VALUES (192, 44, NULL, '150d-density-relief-of-cervical-pain113721', 0, 21, 52, 45, 0, 367, 0, '2018-10-22 03:31:24', '2018-10-22 03:31:24');
INSERT INTO `product_variants` VALUES (193, 44, NULL, '150d-density-relief-of-cervical-pain827681', 0, 31, 60, 57, 0, 753, 0, '2018-10-22 03:31:24', '2018-10-22 03:31:24');
INSERT INTO `product_variants` VALUES (194, 45, NULL, 'web-celebrity-cosmetic-storage-box-extra-large-drawer-type-portable-transparent-table-clean-skin-care-products-shelf-dustproof959084', 0, 48, 31, 59, 0, 931, 0, '2018-10-22 03:31:27', '2018-10-22 03:31:27');
INSERT INTO `product_variants` VALUES (195, 45, NULL, 'web-celebrity-cosmetic-storage-box-extra-large-drawer-type-portable-transparent-table-clean-skin-care-products-shelf-dustproof462468', 0, 70, 30, 25, 0, 166, 0, '2018-10-22 03:31:27', '2018-10-22 03:31:27');
INSERT INTO `product_variants` VALUES (196, 45, NULL, 'web-celebrity-cosmetic-storage-box-extra-large-drawer-type-portable-transparent-table-clean-skin-care-products-shelf-dustproof432417', 0, 72, 71, 12, 0, 408, 0, '2018-10-22 03:31:27', '2018-10-22 03:31:27');
INSERT INTO `product_variants` VALUES (197, 46, NULL, 'cotton-and-linen-folding-bin-bag-packing-case-home-goods-bin-chest-cloth-bra-drawer250210', 0, 15, 48, 26, 0, 227, 0, '2018-10-22 03:31:30', '2018-10-22 03:31:30');
INSERT INTO `product_variants` VALUES (198, 46, NULL, 'cotton-and-linen-folding-bin-bag-packing-case-home-goods-bin-chest-cloth-bra-drawer562055', 0, 78, 81, 37, 0, 560, 0, '2018-10-22 03:31:30', '2018-10-22 03:31:30');
INSERT INTO `product_variants` VALUES (199, 46, NULL, 'cotton-and-linen-folding-bin-bag-packing-case-home-goods-bin-chest-cloth-bra-drawer437279', 0, 28, 58, 19, 0, 746, 0, '2018-10-22 03:31:30', '2018-10-22 03:31:30');
INSERT INTO `product_variants` VALUES (200, 46, NULL, 'cotton-and-linen-folding-bin-bag-packing-case-home-goods-bin-chest-cloth-bra-drawer382253', 0, 82, 50, 54, 0, 844, 0, '2018-10-22 03:31:30', '2018-10-22 03:31:30');
INSERT INTO `product_variants` VALUES (201, 46, NULL, 'cotton-and-linen-folding-bin-bag-packing-case-home-goods-bin-chest-cloth-bra-drawer935534', 0, 41, 83, 10, 0, 128, 0, '2018-10-22 03:31:30', '2018-10-22 03:31:30');
INSERT INTO `product_variants` VALUES (202, 47, NULL, 'car-trunk-storage-box-plastic-storage-box-multi-functional-storage-box-folding-packaging-box-car-rear-box176710', 0, 39, 39, 70, 0, 200, 0, '2018-10-22 03:31:33', '2018-10-22 03:31:33');
INSERT INTO `product_variants` VALUES (203, 48, NULL, 'merope-cosmetics-sub-bottle-spray-bottle-shampoo-travel-sub-bottle-emulsion-6-sets-transparent-color643181', 0, 66, 51, 60, 0, 174, 0, '2018-10-22 03:31:35', '2018-10-22 03:31:35');
INSERT INTO `product_variants` VALUES (204, 49, NULL, 'five-pairs-of-disposable-underwear-men-and-women-travelling-bei-an-pure-cotton-non-paper-underwear-postpartum-cotton-children-wash-free-shorts598403', 0, 60, 96, 92, 0, 945, 0, '2018-10-22 03:31:37', '2018-10-22 03:31:37');
INSERT INTO `product_variants` VALUES (205, 49, NULL, 'five-pairs-of-disposable-underwear-men-and-women-travelling-bei-an-pure-cotton-non-paper-underwear-postpartum-cotton-children-wash-free-shorts804962', 0, 55, 56, 12, 0, 718, 0, '2018-10-22 03:31:37', '2018-10-22 03:31:37');
INSERT INTO `product_variants` VALUES (206, 50, NULL, 'zichu-pregnant-womens-pure-cotton-sanitary-underwear-disposable-cotton-products-postpartum811368', 0, 69, 72, 48, 0, 194, 0, '2018-10-22 03:31:40', '2018-10-22 03:31:40');
INSERT INTO `product_variants` VALUES (207, 50, NULL, 'zichu-pregnant-womens-pure-cotton-sanitary-underwear-disposable-cotton-products-postpartum156373', 0, 66, 55, 86, 0, 741, 0, '2018-10-22 03:31:40', '2018-10-22 03:31:40');
INSERT INTO `product_variants` VALUES (208, 50, NULL, 'zichu-pregnant-womens-pure-cotton-sanitary-underwear-disposable-cotton-products-postpartum919163', 0, 97, 25, 51, 0, 987, 0, '2018-10-22 03:31:40', '2018-10-22 03:31:40');
INSERT INTO `product_variants` VALUES (209, 50, NULL, 'zichu-pregnant-womens-pure-cotton-sanitary-underwear-disposable-cotton-products-postpartum287974', 0, 61, 91, 32, 0, 614, 0, '2018-10-22 03:31:40', '2018-10-22 03:31:40');
INSERT INTO `product_variants` VALUES (210, 50, NULL, 'zichu-pregnant-womens-pure-cotton-sanitary-underwear-disposable-cotton-products-postpartum645656', 0, 14, 82, 13, 0, 805, 0, '2018-10-22 03:31:40', '2018-10-22 03:31:40');
INSERT INTO `product_variants` VALUES (211, 50, NULL, 'zichu-pregnant-womens-pure-cotton-sanitary-underwear-disposable-cotton-products-postpartum306711', 0, 86, 39, 77, 0, 491, 0, '2018-10-22 03:31:40', '2018-10-22 03:31:40');
INSERT INTO `product_variants` VALUES (212, 51, NULL, 'aag-baby-rice-paste-scoop-bottle-squeeze-baby-feeding-spoon-silica-gel-feeder-complementary-spoon-wholesale291354', 0, 46, 58, 15, 0, 195, 0, '2018-10-22 03:31:42', '2018-10-22 03:31:42');
INSERT INTO `product_variants` VALUES (213, 51, NULL, 'aag-baby-rice-paste-scoop-bottle-squeeze-baby-feeding-spoon-silica-gel-feeder-complementary-spoon-wholesale995387', 0, 28, 22, 11, 0, 184, 0, '2018-10-22 03:31:43', '2018-10-22 03:31:43');
INSERT INTO `product_variants` VALUES (214, 51, NULL, 'aag-baby-rice-paste-scoop-bottle-squeeze-baby-feeding-spoon-silica-gel-feeder-complementary-spoon-wholesale692106', 0, 71, 90, 35, 0, 956, 0, '2018-10-22 03:31:43', '2018-10-22 03:31:43');
INSERT INTO `product_variants` VALUES (215, 52, NULL, 'pet-water-dispenser-pet-water-dispenser-cat-water-dispenser-hanging-teddy-automatic-feeder-water-bowl-toiletries176677', 0, 23, 14, 36, 0, 563, 0, '2018-10-22 03:31:44', '2018-10-22 03:31:44');
INSERT INTO `product_variants` VALUES (216, 53, NULL, 'pet-out-food-cup-dog-teddy-big-dog-portable-feeder-water-feeder-outdoor-kettle-out-supplies602247', 0, 59, 28, 77, 0, 598, 0, '2018-10-22 03:31:46', '2018-10-22 03:31:46');
INSERT INTO `product_variants` VALUES (217, 53, NULL, 'pet-out-food-cup-dog-teddy-big-dog-portable-feeder-water-feeder-outdoor-kettle-out-supplies233643', 0, 92, 26, 46, 0, 356, 0, '2018-10-22 03:31:46', '2018-10-22 03:31:46');
INSERT INTO `product_variants` VALUES (218, 53, NULL, 'pet-out-food-cup-dog-teddy-big-dog-portable-feeder-water-feeder-outdoor-kettle-out-supplies874276', 0, 100, 75, 30, 0, 734, 0, '2018-10-22 03:31:46', '2018-10-22 03:31:46');
INSERT INTO `product_variants` VALUES (219, 53, NULL, 'pet-out-food-cup-dog-teddy-big-dog-portable-feeder-water-feeder-outdoor-kettle-out-supplies489627', 0, 19, 84, 12, 0, 705, 0, '2018-10-22 03:31:46', '2018-10-22 03:31:46');
INSERT INTO `product_variants` VALUES (220, 54, NULL, 'hartley-pet-accompanying-cup-outside-water-cup-outdoor-portable-water-jug-water-bowl-dog-water-dispenser792919', 0, 67, 38, 58, 0, 749, 0, '2018-10-22 03:31:48', '2018-10-22 03:31:48');
INSERT INTO `product_variants` VALUES (221, 54, NULL, 'hartley-pet-accompanying-cup-outside-water-cup-outdoor-portable-water-jug-water-bowl-dog-water-dispenser403420', 0, 100, 15, 45, 0, 441, 0, '2018-10-22 03:31:48', '2018-10-22 03:31:48');
INSERT INTO `product_variants` VALUES (222, 54, NULL, 'hartley-pet-accompanying-cup-outside-water-cup-outdoor-portable-water-jug-water-bowl-dog-water-dispenser894258', 0, 79, 96, 56, 0, 489, 0, '2018-10-22 03:31:48', '2018-10-22 03:31:48');
INSERT INTO `product_variants` VALUES (223, 55, NULL, 'dog-chain-dog-leash-large-and-medium-sized-dog-teddy-golden-hair-dog-rope-pet-supplies361879', 0, 98, 73, 38, 0, 364, 0, '2018-10-22 03:31:50', '2018-10-22 03:31:50');
INSERT INTO `product_variants` VALUES (224, 55, NULL, 'dog-chain-dog-leash-large-and-medium-sized-dog-teddy-golden-hair-dog-rope-pet-supplies119117', 0, 11, 59, 24, 0, 219, 0, '2018-10-22 03:31:50', '2018-10-22 03:31:50');
INSERT INTO `product_variants` VALUES (225, 56, NULL, 'sleeping-bag-four-seasons-general-purpose-cat-pad-deep-sleep-cat-litter-kennel-web-celebrity-dog-litter-supplies-warm-in-winter235690', 0, 94, 47, 80, 0, 251, 0, '2018-10-22 03:31:52', '2018-10-22 03:31:52');
INSERT INTO `product_variants` VALUES (226, 56, NULL, 'sleeping-bag-four-seasons-general-purpose-cat-pad-deep-sleep-cat-litter-kennel-web-celebrity-dog-litter-supplies-warm-in-winter586265', 0, 17, 12, 73, 0, 400, 0, '2018-10-22 03:31:52', '2018-10-22 03:31:52');
INSERT INTO `product_variants` VALUES (227, 56, NULL, 'sleeping-bag-four-seasons-general-purpose-cat-pad-deep-sleep-cat-litter-kennel-web-celebrity-dog-litter-supplies-warm-in-winter956534', 0, 99, 51, 54, 0, 167, 0, '2018-10-22 03:31:52', '2018-10-22 03:31:52');
INSERT INTO `product_variants` VALUES (228, 56, NULL, 'sleeping-bag-four-seasons-general-purpose-cat-pad-deep-sleep-cat-litter-kennel-web-celebrity-dog-litter-supplies-warm-in-winter210314', 0, 35, 21, 69, 0, 225, 0, '2018-10-22 03:31:52', '2018-10-22 03:31:52');
INSERT INTO `product_variants` VALUES (229, 57, NULL, 'bath-and-back-bath-balls394264', 0, 60, 24, 19, 0, 586, 0, '2018-10-22 08:24:44', '2018-10-22 08:24:44');
INSERT INTO `product_variants` VALUES (230, 58, NULL, 'add-water-to-the-humidifier-on-the-delmar-purification625188', 0, 39, 31, 92, 0, 225, 0, '2018-10-22 08:24:48', '2018-10-22 08:24:48');
INSERT INTO `product_variants` VALUES (231, 59, NULL, 'creative-slim-desktop-stand930487', 0, 85, 29, 82, 0, 346, 0, '2018-10-22 08:24:50', '2018-10-22 08:24:50');
INSERT INTO `product_variants` VALUES (232, 59, NULL, 'creative-slim-desktop-stand472808', 0, 79, 97, 84, 0, 590, 0, '2018-10-22 08:24:50', '2018-10-22 08:24:50');
INSERT INTO `product_variants` VALUES (233, 59, NULL, 'creative-slim-desktop-stand438486', 0, 33, 24, 90, 0, 535, 0, '2018-10-22 08:24:50', '2018-10-22 08:24:50');
INSERT INTO `product_variants` VALUES (234, 59, NULL, 'creative-slim-desktop-stand781600', 0, 11, 46, 51, 0, 463, 0, '2018-10-22 08:24:50', '2018-10-22 08:24:50');
INSERT INTO `product_variants` VALUES (235, 60, NULL, 'small-magic-clip-on-car-wireless-charging-mobile-phone-stand701577', 0, 62, 42, 17, 0, 863, 0, '2018-10-22 08:24:53', '2018-10-22 08:24:53');
INSERT INTO `product_variants` VALUES (236, 60, NULL, 'small-magic-clip-on-car-wireless-charging-mobile-phone-stand853389', 0, 47, 24, 93, 0, 810, 0, '2018-10-22 08:24:53', '2018-10-22 08:24:53');
INSERT INTO `product_variants` VALUES (237, 60, NULL, 'small-magic-clip-on-car-wireless-charging-mobile-phone-stand999033', 0, 95, 98, 80, 0, 668, 0, '2018-10-22 08:24:53', '2018-10-22 08:24:53');
INSERT INTO `product_variants` VALUES (238, 61, NULL, 'rotating-shopping-bag-folding-storage-bag894833', 0, 16, 23, 34, 0, 678, 0, '2018-10-22 08:24:55', '2018-10-22 08:24:55');
INSERT INTO `product_variants` VALUES (239, 61, NULL, 'rotating-shopping-bag-folding-storage-bag948315', 0, 63, 42, 67, 0, 716, 0, '2018-10-22 08:24:55', '2018-10-22 08:24:55');
INSERT INTO `product_variants` VALUES (240, 62, NULL, 'traveling-wheat-straw-folding-hanger632890', 0, 39, 69, 23, 0, 516, 0, '2018-10-22 08:24:58', '2018-10-22 08:24:58');
INSERT INTO `product_variants` VALUES (241, 62, NULL, 'traveling-wheat-straw-folding-hanger890625', 0, 43, 96, 48, 0, 731, 0, '2018-10-22 08:24:58', '2018-10-22 08:24:58');
INSERT INTO `product_variants` VALUES (242, 62, NULL, 'traveling-wheat-straw-folding-hanger275190', 0, 28, 99, 75, 0, 692, 0, '2018-10-22 08:24:58', '2018-10-22 08:24:58');
INSERT INTO `product_variants` VALUES (243, 62, NULL, 'traveling-wheat-straw-folding-hanger186204', 0, 55, 76, 17, 0, 179, 0, '2018-10-22 08:24:58', '2018-10-22 08:24:58');
INSERT INTO `product_variants` VALUES (244, 63, NULL, 'simple-and-versatile-neck-pillow979188', 0, 37, 20, 68, 0, 485, 0, '2018-10-22 08:25:01', '2018-10-22 08:25:01');
INSERT INTO `product_variants` VALUES (245, 63, NULL, 'simple-and-versatile-neck-pillow186607', 0, 18, 86, 16, 0, 803, 0, '2018-10-22 08:25:01', '2018-10-22 08:25:01');
INSERT INTO `product_variants` VALUES (246, 63, NULL, 'simple-and-versatile-neck-pillow317654', 0, 87, 33, 53, 0, 391, 0, '2018-10-22 08:25:01', '2018-10-22 08:25:01');
INSERT INTO `product_variants` VALUES (247, 63, NULL, 'simple-and-versatile-neck-pillow501239', 0, 44, 37, 75, 0, 887, 0, '2018-10-22 08:25:01', '2018-10-22 08:25:01');
INSERT INTO `product_variants` VALUES (248, 64, NULL, 'apoo-rebers-wireless-thin-mouse513225', 0, 30, 35, 86, 0, 133, 0, '2018-10-22 08:25:05', '2018-10-22 08:25:05');
INSERT INTO `product_variants` VALUES (249, 64, NULL, 'apoo-rebers-wireless-thin-mouse477334', 0, 74, 50, 83, 0, 159, 0, '2018-10-22 08:25:05', '2018-10-22 08:25:05');
INSERT INTO `product_variants` VALUES (250, 64, NULL, 'apoo-rebers-wireless-thin-mouse846201', 0, 44, 99, 40, 0, 312, 0, '2018-10-22 08:25:05', '2018-10-22 08:25:05');
INSERT INTO `product_variants` VALUES (251, 64, NULL, 'apoo-rebers-wireless-thin-mouse370711', 0, 51, 69, 32, 0, 794, 0, '2018-10-22 08:25:05', '2018-10-22 08:25:05');
INSERT INTO `product_variants` VALUES (252, 64, NULL, 'apoo-rebers-wireless-thin-mouse627695', 0, 37, 79, 68, 0, 940, 0, '2018-10-22 08:25:05', '2018-10-22 08:25:05');
INSERT INTO `product_variants` VALUES (253, 65, NULL, 'white-white-wire-game-mouse348451', 0, 12, 76, 91, 0, 778, 0, '2018-10-22 08:25:08', '2018-10-22 08:25:08');
INSERT INTO `product_variants` VALUES (254, 65, NULL, 'white-white-wire-game-mouse178294', 0, 43, 39, 58, 0, 270, 0, '2018-10-22 08:25:08', '2018-10-22 08:25:08');
INSERT INTO `product_variants` VALUES (255, 66, NULL, 'qck-mass-mouse-pad912120', 0, 35, 74, 99, 0, 604, 0, '2018-10-22 08:25:12', '2018-10-22 08:25:12');
INSERT INTO `product_variants` VALUES (256, 66, NULL, 'qck-mass-mouse-pad194645', 0, 46, 43, 50, 0, 694, 0, '2018-10-22 08:25:12', '2018-10-22 08:25:12');
INSERT INTO `product_variants` VALUES (257, 66, NULL, 'qck-mass-mouse-pad999009', 0, 70, 33, 25, 0, 307, 0, '2018-10-22 08:25:12', '2018-10-22 08:25:12');
INSERT INTO `product_variants` VALUES (258, 66, NULL, 'qck-mass-mouse-pad896769', 0, 30, 65, 64, 0, 891, 0, '2018-10-22 08:25:12', '2018-10-22 08:25:12');
INSERT INTO `product_variants` VALUES (259, 67, NULL, 'lena-hair-straightening-rollers904102', 0, 96, 55, 21, 0, 790, 0, '2018-10-22 08:25:16', '2018-10-22 08:25:16');
INSERT INTO `product_variants` VALUES (260, 68, NULL, 'bristle-air-mattress-massage-comb763869', 0, 45, 62, 100, 0, 665, 0, '2018-10-22 08:25:18', '2018-10-22 08:25:18');
INSERT INTO `product_variants` VALUES (261, 69, NULL, 'cats-cradle-cats-cradle-cats-cradle-cats-cradle703449', 0, 53, 37, 75, 0, 397, 0, '2018-10-22 08:26:30', '2018-10-22 08:26:30');
INSERT INTO `product_variants` VALUES (262, 69, NULL, 'cats-cradle-cats-cradle-cats-cradle-cats-cradle146310', 0, 30, 13, 23, 0, 848, 0, '2018-10-22 08:26:30', '2018-10-22 08:26:30');
INSERT INTO `product_variants` VALUES (263, 69, NULL, 'cats-cradle-cats-cradle-cats-cradle-cats-cradle743686', 0, 84, 54, 19, 0, 511, 0, '2018-10-22 08:26:30', '2018-10-22 08:26:30');
INSERT INTO `product_variants` VALUES (264, 70, NULL, 'the-doghouse-can-be-removable-and-washed-for-large-pet-kennel-teddy-samo-pet-bed-small-dog-kennel828456', 0, 29, 57, 13, 0, 778, 0, '2018-10-22 08:26:31', '2018-10-22 08:26:31');
INSERT INTO `product_variants` VALUES (265, 70, NULL, 'the-doghouse-can-be-removable-and-washed-for-large-pet-kennel-teddy-samo-pet-bed-small-dog-kennel820453', 0, 46, 48, 55, 0, 900, 0, '2018-10-22 08:26:31', '2018-10-22 08:26:31');
INSERT INTO `product_variants` VALUES (266, 70, NULL, 'the-doghouse-can-be-removable-and-washed-for-large-pet-kennel-teddy-samo-pet-bed-small-dog-kennel153095', 0, 88, 28, 22, 0, 184, 0, '2018-10-22 08:26:31', '2018-10-22 08:26:31');
INSERT INTO `product_variants` VALUES (267, 70, NULL, 'the-doghouse-can-be-removable-and-washed-for-large-pet-kennel-teddy-samo-pet-bed-small-dog-kennel513805', 0, 29, 20, 61, 0, 413, 0, '2018-10-22 08:26:32', '2018-10-22 08:26:32');
INSERT INTO `product_variants` VALUES (268, 70, NULL, 'the-doghouse-can-be-removable-and-washed-for-large-pet-kennel-teddy-samo-pet-bed-small-dog-kennel799861', 0, 53, 87, 78, 0, 216, 0, '2018-10-22 08:26:32', '2018-10-22 08:26:32');
INSERT INTO `product_variants` VALUES (269, 71, NULL, 'teddy-kennel-can-be-removable-and-washed-four-seasons-universal-pet-mat-for-large-medium-and-small-dogs-to-keep-warm-in-winter-web-celebrity-supplies338851', 0, 57, 97, 12, 0, 970, 0, '2018-10-22 08:26:34', '2018-10-22 08:26:34');
INSERT INTO `product_variants` VALUES (270, 71, NULL, 'teddy-kennel-can-be-removable-and-washed-four-seasons-universal-pet-mat-for-large-medium-and-small-dogs-to-keep-warm-in-winter-web-celebrity-supplies604622', 0, 100, 82, 83, 0, 807, 0, '2018-10-22 08:26:34', '2018-10-22 08:26:34');
INSERT INTO `product_variants` VALUES (271, 71, NULL, 'teddy-kennel-can-be-removable-and-washed-four-seasons-universal-pet-mat-for-large-medium-and-small-dogs-to-keep-warm-in-winter-web-celebrity-supplies355169', 0, 75, 77, 28, 0, 642, 0, '2018-10-22 08:26:34', '2018-10-22 08:26:34');
INSERT INTO `product_variants` VALUES (272, 72, NULL, 'new-american-air-permeable-cat-hammock-sucker-cat-litter-cat-cage-cat-bed-to-support-26-kg239683', 0, 23, 96, 72, 0, 742, 0, '2018-10-22 08:26:36', '2018-10-22 08:26:36');
INSERT INTO `product_variants` VALUES (273, 73, NULL, 'hot-black-non-stick-steel-knife-set663800', 0, 71, 42, 30, 0, 215, 0, '2018-10-22 08:26:38', '2018-10-22 08:26:38');
INSERT INTO `product_variants` VALUES (274, 74, NULL, 'qiao-ah-po-ceramic-kitchen-knife-black-blade-cut-vegetables-fruit-knife-kitchen-narrow-chef-slice-slice-watermelon-ceramic-knife585817', 0, 42, 33, 94, 0, 399, 0, '2018-10-22 08:26:40', '2018-10-22 08:26:40');
INSERT INTO `product_variants` VALUES (275, 75, NULL, 'ceramic-knife-set-kitchen-knife-knife-fruit-peeler-black-blade888447', 0, 12, 81, 63, 0, 676, 0, '2018-10-22 08:26:42', '2018-10-22 08:26:42');
INSERT INTO `product_variants` VALUES (276, 76, NULL, 'oou-knife-set-stainless-steel-7-piece-set-knife-kitchen-kitchen-knife-set-esther-solid-wood-7-piece-set575841', 0, 54, 17, 100, 0, 466, 0, '2018-10-22 08:26:44', '2018-10-22 08:26:44');
INSERT INTO `product_variants` VALUES (277, 76, NULL, 'oou-knife-set-stainless-steel-7-piece-set-knife-kitchen-kitchen-knife-set-esther-solid-wood-7-piece-set142899', 0, 26, 47, 63, 0, 744, 0, '2018-10-22 08:26:44', '2018-10-22 08:26:44');
INSERT INTO `product_variants` VALUES (278, 77, NULL, 'touch-series-ultra-rose-sliding-underpants-sharing-outfit832853', 0, 98, 27, 65, 0, 642, 0, '2018-10-22 08:26:46', '2018-10-22 08:26:46');
INSERT INTO `product_variants` VALUES (279, 77, NULL, 'touch-series-ultra-rose-sliding-underpants-sharing-outfit554704', 0, 32, 74, 81, 0, 941, 0, '2018-10-22 08:26:46', '2018-10-22 08:26:46');
INSERT INTO `product_variants` VALUES (280, 78, NULL, 'cottonsmith-mini-window-dry-womens-panties-3-pieces-whitelight-pink-single-box-m131074', 0, 83, 18, 52, 0, 679, 0, '2018-10-22 08:26:48', '2018-10-22 08:26:48');
INSERT INTO `product_variants` VALUES (281, 78, NULL, 'cottonsmith-mini-window-dry-womens-panties-3-pieces-whitelight-pink-single-box-m810238', 0, 62, 57, 78, 0, 587, 0, '2018-10-22 08:26:48', '2018-10-22 08:26:48');
INSERT INTO `product_variants` VALUES (282, 78, NULL, 'cottonsmith-mini-window-dry-womens-panties-3-pieces-whitelight-pink-single-box-m255095', 0, 84, 22, 16, 0, 620, 0, '2018-10-22 08:26:48', '2018-10-22 08:26:48');
INSERT INTO `product_variants` VALUES (283, 78, NULL, 'cottonsmith-mini-window-dry-womens-panties-3-pieces-whitelight-pink-single-box-m529554', 0, 60, 60, 72, 0, 100, 0, '2018-10-22 08:26:48', '2018-10-22 08:26:48');
INSERT INTO `product_variants` VALUES (284, 78, NULL, 'cottonsmith-mini-window-dry-womens-panties-3-pieces-whitelight-pink-single-box-m726789', 0, 48, 35, 43, 0, 586, 0, '2018-10-22 08:26:48', '2018-10-22 08:26:48');
INSERT INTO `product_variants` VALUES (285, 78, NULL, 'cottonsmith-mini-window-dry-womens-panties-3-pieces-whitelight-pink-single-box-m481626', 0, 100, 67, 81, 0, 735, 0, '2018-10-22 08:26:48', '2018-10-22 08:26:48');
INSERT INTO `product_variants` VALUES (286, 78, NULL, 'cottonsmith-mini-window-dry-womens-panties-3-pieces-whitelight-pink-single-box-m599738', 0, 96, 58, 91, 0, 943, 0, '2018-10-22 08:26:48', '2018-10-22 08:26:48');
INSERT INTO `product_variants` VALUES (287, 78, NULL, 'cottonsmith-mini-window-dry-womens-panties-3-pieces-whitelight-pink-single-box-m616201', 0, 78, 74, 49, 0, 168, 0, '2018-10-22 08:26:48', '2018-10-22 08:26:48');
INSERT INTO `product_variants` VALUES (288, 79, NULL, 'simple-mens-casual-socks610119', 0, 89, 96, 25, 0, 455, 0, '2018-10-22 08:26:51', '2018-10-22 08:26:51');
INSERT INTO `product_variants` VALUES (289, 79, NULL, 'simple-mens-casual-socks147073', 0, 79, 80, 77, 0, 514, 0, '2018-10-22 08:26:51', '2018-10-22 08:26:51');
INSERT INTO `product_variants` VALUES (290, 79, NULL, 'simple-mens-casual-socks556168', 0, 42, 98, 23, 0, 562, 0, '2018-10-22 08:26:52', '2018-10-22 08:26:52');
INSERT INTO `product_variants` VALUES (291, 80, NULL, 'menna-ship-socks-women-socks-summer-invisible-socks-shallow-mouth-anti-skid-silicone-spring-summer-day-thin-skin-to-prevent-heel245616', 0, 51, 55, 85, 0, 139, 0, '2018-10-22 08:26:54', '2018-10-22 08:26:54');
INSERT INTO `product_variants` VALUES (292, 80, NULL, 'menna-ship-socks-women-socks-summer-invisible-socks-shallow-mouth-anti-skid-silicone-spring-summer-day-thin-skin-to-prevent-heel760870', 0, 22, 17, 56, 0, 941, 0, '2018-10-22 08:26:55', '2018-10-22 08:26:55');
INSERT INTO `product_variants` VALUES (293, 80, NULL, 'menna-ship-socks-women-socks-summer-invisible-socks-shallow-mouth-anti-skid-silicone-spring-summer-day-thin-skin-to-prevent-heel110817', 0, 10, 33, 17, 0, 390, 0, '2018-10-22 08:26:55', '2018-10-22 08:26:55');
INSERT INTO `product_variants` VALUES (294, 80, NULL, 'menna-ship-socks-women-socks-summer-invisible-socks-shallow-mouth-anti-skid-silicone-spring-summer-day-thin-skin-to-prevent-heel534036', 0, 41, 94, 57, 0, 468, 0, '2018-10-22 08:26:55', '2018-10-22 08:26:55');
INSERT INTO `product_variants` VALUES (295, 81, NULL, 'natural-bamboo-cutting-board-thickened-non-joint-non-slip-cutting-board252459', 0, 41, 39, 63, 0, 175, 0, '2018-10-22 08:26:56', '2018-10-22 08:26:56');
INSERT INTO `product_variants` VALUES (296, 82, NULL, 'original-wood-too-round-wooden-cutting-board-solid-wood-healthy-cutting-board-multi-functional-environmental-protection-mould-proof-wooden-kitchen-cutting-board976824', 0, 27, 23, 79, 0, 756, 0, '2018-10-22 08:26:59', '2018-10-22 08:26:59');
INSERT INTO `product_variants` VALUES (297, 82, NULL, 'original-wood-too-round-wooden-cutting-board-solid-wood-healthy-cutting-board-multi-functional-environmental-protection-mould-proof-wooden-kitchen-cutting-board898092', 0, 26, 92, 62, 0, 665, 0, '2018-10-22 08:26:59', '2018-10-22 08:26:59');
INSERT INTO `product_variants` VALUES (298, 82, NULL, 'original-wood-too-round-wooden-cutting-board-solid-wood-healthy-cutting-board-multi-functional-environmental-protection-mould-proof-wooden-kitchen-cutting-board719625', 0, 14, 64, 54, 0, 897, 0, '2018-10-22 08:26:59', '2018-10-22 08:26:59');
INSERT INTO `product_variants` VALUES (299, 83, NULL, 'non-shedding-water-absorbent-cloth-thickened-double-layer-fine-fiber-wipe-table-cloth-kitchen-cleaning-dish-towel-washing-dish-cloth217292', 0, 58, 82, 34, 0, 326, 0, '2018-10-22 08:27:01', '2018-10-22 08:27:01');
INSERT INTO `product_variants` VALUES (300, 83, NULL, 'non-shedding-water-absorbent-cloth-thickened-double-layer-fine-fiber-wipe-table-cloth-kitchen-cleaning-dish-towel-washing-dish-cloth147671', 0, 83, 61, 25, 0, 379, 0, '2018-10-22 08:27:01', '2018-10-22 08:27:01');
INSERT INTO `product_variants` VALUES (301, 83, NULL, 'non-shedding-water-absorbent-cloth-thickened-double-layer-fine-fiber-wipe-table-cloth-kitchen-cleaning-dish-towel-washing-dish-cloth355262', 0, 39, 75, 17, 0, 493, 0, '2018-10-22 08:27:01', '2018-10-22 08:27:01');
INSERT INTO `product_variants` VALUES (302, 84, NULL, 'double-color-double-sided-absorbent-dish-cloth-oil-wipe-towel-thickened-cloth-wipe-table-cloth-kitchen-ragdouble-color-double-sided-absorbent-dish-cloth-oil-wipe-towel-thickened-cloth-wipe-table-cloth-kitchen-rag150474', 0, 83, 11, 98, 0, 551, 0, '2018-10-22 08:27:04', '2018-10-22 08:27:04');
INSERT INTO `product_variants` VALUES (303, 84, NULL, 'double-color-double-sided-absorbent-dish-cloth-oil-wipe-towel-thickened-cloth-wipe-table-cloth-kitchen-ragdouble-color-double-sided-absorbent-dish-cloth-oil-wipe-towel-thickened-cloth-wipe-table-cloth-kitchen-rag453749', 0, 68, 89, 90, 0, 935, 0, '2018-10-22 08:27:04', '2018-10-22 08:27:04');
INSERT INTO `product_variants` VALUES (304, 84, NULL, 'double-color-double-sided-absorbent-dish-cloth-oil-wipe-towel-thickened-cloth-wipe-table-cloth-kitchen-ragdouble-color-double-sided-absorbent-dish-cloth-oil-wipe-towel-thickened-cloth-wipe-table-cloth-kitchen-rag697729', 0, 81, 20, 70, 0, 206, 0, '2018-10-22 08:27:04', '2018-10-22 08:27:04');
INSERT INTO `product_variants` VALUES (305, 85, NULL, 'nylon-pot-brush-with-long-handle-wood-does-not-hurt-the-pot-brush-does-not-stick-oil-wash-dishes-wash-creative-brush531651', 0, 34, 72, 68, 0, 456, 0, '2018-10-22 08:27:06', '2018-10-22 08:27:06');
INSERT INTO `product_variants` VALUES (306, 86, NULL, 'kitchen-brush-pan-brush-creative-soap-brush-hand-soap-brush-press-on-the-pan-and-wash-the-dishes894875', 0, 85, 40, 86, 0, 701, 0, '2018-10-22 08:27:08', '2018-10-22 08:27:08');
INSERT INTO `product_variants` VALUES (307, 86, NULL, 'kitchen-brush-pan-brush-creative-soap-brush-hand-soap-brush-press-on-the-pan-and-wash-the-dishes948666', 0, 39, 84, 26, 0, 339, 0, '2018-10-22 08:27:08', '2018-10-22 08:27:08');
INSERT INTO `product_variants` VALUES (308, 87, NULL, 'ice-and-fire-magic-subdivision-thermos-cup783292', 0, 27, 32, 54, 0, 545, 0, '2018-10-22 08:27:11', '2018-10-22 08:27:11');
INSERT INTO `product_variants` VALUES (309, 87, NULL, 'ice-and-fire-magic-subdivision-thermos-cup375936', 0, 65, 53, 34, 0, 483, 0, '2018-10-22 08:27:11', '2018-10-22 08:27:11');
INSERT INTO `product_variants` VALUES (310, 87, NULL, 'ice-and-fire-magic-subdivision-thermos-cup973633', 0, 28, 87, 100, 0, 458, 0, '2018-10-22 08:27:11', '2018-10-22 08:27:11');
INSERT INTO `product_variants` VALUES (311, 88, NULL, 'light-smart-accompanying-vacuum-cup551412', 0, 100, 97, 31, 0, 350, 0, '2018-10-22 08:27:16', '2018-10-22 08:27:16');
INSERT INTO `product_variants` VALUES (312, 88, NULL, 'light-smart-accompanying-vacuum-cup229346', 0, 94, 23, 100, 0, 969, 0, '2018-10-22 08:27:16', '2018-10-22 08:27:16');
INSERT INTO `product_variants` VALUES (313, 90, NULL, 'household-portable-projector', 0, 0.87, 18, 0.87, 0.35, 119, 0, '2018-10-24 06:13:49', '2018-10-24 06:13:49');
COMMIT;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxon_id` int(10) unsigned DEFAULT NULL COMMENT '主taxon_id 用于面包屑',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `average_rating` decimal(8,2) NOT NULL DEFAULT '0.00',
  `rating_counts` json DEFAULT NULL COMMENT '评分分布',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
BEGIN;
INSERT INTO `products` VALUES (3, '118E1A2A249CD7F6FE2CFA57D788A8BE', 64, 0, 0.00, NULL, '2018-10-19 08:53:18', '2018-10-22 10:50:10');
INSERT INTO `products` VALUES (4, 'Intelligent-bilateral-electric-breast-pump-breast-pump', 70, 1, 0.00, NULL, '2018-10-19 09:00:31', '2018-10-19 09:02:54');
INSERT INTO `products` VALUES (6, '3D0C2B9C02B19F74D37085C9A55B9252', 55, 1, 0.00, NULL, '2018-10-19 10:11:53', '2018-10-19 10:14:23');
INSERT INTO `products` VALUES (7, 'toolbox-set', 8, 1, 0.00, NULL, '2018-10-19 10:35:11', '2018-10-19 10:36:04');
INSERT INTO `products` VALUES (9, '33b2158d6f26a22cb9681491d4932ed1', 22, 1, 0.00, NULL, '2018-10-20 02:13:47', '2018-10-20 02:20:26');
INSERT INTO `products` VALUES (10, '7291a09701c7425e', 32, 1, 0.00, NULL, '2018-10-20 07:43:16', '2018-10-20 07:43:39');
INSERT INTO `products` VALUES (11, '1520e070b76eb7b9', 32, 0, 0.00, NULL, '2018-10-20 07:59:22', '2018-10-22 10:23:18');
INSERT INTO `products` VALUES (12, '4042dc1b2966fce8', 32, 1, 0.00, NULL, '2018-10-20 08:37:37', '2018-10-20 08:38:05');
INSERT INTO `products` VALUES (13, 'corbo-light-and-thin-aesthetic-nail-clippers', 22, 1, 0.00, NULL, '2018-10-20 10:00:48', '2018-10-20 10:27:09');
INSERT INTO `products` VALUES (14, 'ultra-thin-mini-20000-mah-mobile-power-supply', 64, 1, 0.00, NULL, '2018-10-20 10:00:50', '2018-10-20 10:27:10');
INSERT INTO `products` VALUES (15, 'compact-multi-function-mobile-power-supply', 64, 1, 0.00, NULL, '2018-10-20 10:00:53', '2018-10-20 10:33:00');
INSERT INTO `products` VALUES (16, 'wireless-smart-quick-charge', 64, 1, 0.00, NULL, '2018-10-20 10:00:55', '2018-10-20 10:44:57');
INSERT INTO `products` VALUES (17, '12-constellation-night-light-mobile-power-supply', 64, 1, 0.00, NULL, '2018-10-20 10:00:57', '2018-10-20 10:47:04');
INSERT INTO `products` VALUES (18, 'bcase-is-a-different-selfie-stick', 64, 1, 0.00, NULL, '2018-10-20 10:00:59', '2018-10-22 01:57:08');
INSERT INTO `products` VALUES (19, 'flexible-robot-support', 64, 1, 0.00, NULL, '2018-10-20 10:01:00', '2018-10-22 02:03:03');
INSERT INTO `products` VALUES (20, 'smart-pen-for-taking-photos', 64, 1, 0.00, NULL, '2018-10-20 10:01:03', '2018-10-22 02:06:05');
INSERT INTO `products` VALUES (21, 'the-little-box-is-everything', 64, 1, 0.00, NULL, '2018-10-20 10:01:05', '2018-10-22 02:36:03');
INSERT INTO `products` VALUES (22, 'portable-wireless-bluetooth-speaker', 64, 1, 0.00, NULL, '2018-10-20 10:01:08', '2018-10-22 02:43:01');
INSERT INTO `products` VALUES (23, 'mondrian-music-canvas-wireless-bluetooth-speaker', 64, 1, 0.00, NULL, '2018-10-20 10:01:12', '2018-10-22 02:45:07');
INSERT INTO `products` VALUES (24, 'high-pretend-bility-electronic-cigarette-holder', 64, 1, 0.00, NULL, '2018-10-20 10:01:15', '2018-10-22 03:36:09');
INSERT INTO `products` VALUES (25, 'small-procedure-body-fat-scale', 32, 1, 0.00, NULL, '2018-10-20 10:01:19', '2018-10-22 02:49:18');
INSERT INTO `products` VALUES (26, 'pma-graphene-thermal-silk-eye-mask', 25, 1, 0.00, NULL, '2018-10-20 10:01:21', '2018-10-22 02:51:44');
INSERT INTO `products` VALUES (27, 'a-cotton-face-towel', 22, 1, 0.00, NULL, '2018-10-20 10:01:24', '2018-10-22 02:55:36');
INSERT INTO `products` VALUES (28, 'top-layer-cowhide-run-vehicle-belt', 38, 1, 0.00, NULL, '2018-10-22 03:30:00', '2018-10-22 06:11:14');
INSERT INTO `products` VALUES (29, '90-split-cow-pickup-bag-folded', 38, 1, 0.00, NULL, '2018-10-22 03:30:05', '2018-10-22 06:18:06');
INSERT INTO `products` VALUES (30, 'leather-purse-womens-2018-new-fashionable-sheepskin-short-mini-multi-functional-wallet-pocket-fold-zero-wallet', 39, 1, 0.00, NULL, '2018-10-22 03:30:07', '2018-10-22 06:23:14');
INSERT INTO `products` VALUES (31, '2018-new-korean-womens-purse-womens-long-style-multi-functional-real-wallet-childrens-money-hand-bag-wallet-tide', 39, 1, 0.00, NULL, '2018-10-22 03:30:14', '2018-10-22 06:26:35');
INSERT INTO `products` VALUES (32, 'luladi-flip-flops-mens-beach-slippers-mens-non-slip-slippers-black', 38, 1, 0.00, NULL, '2018-10-22 03:30:23', '2018-10-22 06:34:05');
INSERT INTO `products` VALUES (33, 'havaianas-brazil-2018-classic-flip-flops-top-black-slip-resistant-slipper-for-men-and-women-havana', 39, 1, 0.00, NULL, '2018-10-22 03:30:33', '2018-10-22 06:38:28');
INSERT INTO `products` VALUES (34, 'warm-shadow-home-female-home-dress-spring-and-autumn-mo-dyer-home-dress-seven-sleeves-long-pants-two-pieces-of-nordic-beauty-when-you-can-wear-a-home-dress-suit', 39, 1, 0.00, NULL, '2018-10-22 03:30:39', '2018-10-22 06:43:50');
INSERT INTO `products` VALUES (35, 'mens-pajamas-long-sleeved-cotton-spring-and-autumn-cardigan-men-plus-size-autumn-winter-household-suit-mens-young-man', 38, 1, 0.00, NULL, '2018-10-22 03:30:46', '2018-10-22 06:48:30');
INSERT INTO `products` VALUES (36, 'spring-yoga-pants-womens-hip-raises-exercise-suit-slim-tight-height-waist-small-foot-nine-trousers', 39, 1, 0.00, NULL, '2018-10-22 03:30:51', '2018-10-22 06:51:38');
INSERT INTO `products` VALUES (37, 'tight-pants-male-gym-suit-high-bounce-speed-dry-run-sports-compression-basketball-leggings-long-pants-seven-points-plus-pile-training', 38, 1, 0.00, NULL, '2018-10-22 03:30:57', '2018-10-22 06:54:57');
INSERT INTO `products` VALUES (38, 'the-antarctic-peoples-60-satins-long-plush-cotton-four-piece-cotton-plain-womens-bed-sheet-and-quilt-cover-20m-bedding', 44, 1, 0.00, NULL, '2018-10-22 03:31:00', '2018-10-22 08:10:08');
INSERT INTO `products` VALUES (39, 'non-printed-cotton-acorns-embroidered-plaid-washed-cotton-fine-cotton-four-piece-sheet-bed-bonnets', 44, 1, 0.00, NULL, '2018-10-22 03:31:05', '2018-10-22 08:17:15');
INSERT INTO `products` VALUES (40, 'shuxiang-home-anti-bacterial-anti-mite-waterproof-bed-li-three-pieces-set', 44, 1, 0.00, NULL, '2018-10-22 03:31:09', '2018-10-22 08:17:49');
INSERT INTO `products` VALUES (41, 'double-bed-made-of-silk-and-cotton-of-egypt', 44, 1, 0.00, NULL, '2018-10-22 03:31:12', '2018-10-22 08:21:00');
INSERT INTO `products` VALUES (42, 'lequan-pure-color-cotton-bed-sheet-single-15182-m-double-bed-sheet-student-12m-springsummer-bed-sheet', 44, 1, 0.00, NULL, '2018-10-22 03:31:16', '2018-10-22 08:24:14');
INSERT INTO `products` VALUES (43, 'a-sleep-saving-pillow', 44, 1, 0.00, NULL, '2018-10-22 03:31:20', '2018-10-22 08:27:25');
INSERT INTO `products` VALUES (44, '150d-density-relief-of-cervical-pain', 44, 1, 0.00, NULL, '2018-10-22 03:31:22', '2018-10-22 08:27:27');
INSERT INTO `products` VALUES (45, 'web-celebrity-cosmetic-storage-box-extra-large-drawer-type-portable-transparent-table-clean-skin-care-products-shelf-dustproof', 48, 1, 0.00, NULL, '2018-10-22 03:31:24', '2018-10-22 08:29:57');
INSERT INTO `products` VALUES (46, 'cotton-and-linen-folding-bin-bag-packing-case-home-goods-bin-chest-cloth-bra-drawer', 48, 1, 0.00, NULL, '2018-10-22 03:31:27', '2018-10-22 08:31:44');
INSERT INTO `products` VALUES (47, 'car-trunk-storage-box-plastic-storage-box-multi-functional-storage-box-folding-packaging-box-car-rear-box', 48, 1, 0.00, NULL, '2018-10-22 03:31:31', '2018-10-22 08:33:01');
INSERT INTO `products` VALUES (48, 'merope-cosmetics-sub-bottle-spray-bottle-shampoo-travel-sub-bottle-emulsion-6-sets-transparent-color', 48, 1, 0.00, NULL, '2018-10-22 03:31:33', '2018-10-22 08:34:01');
INSERT INTO `products` VALUES (49, 'five-pairs-of-disposable-underwear-men-and-women-travelling-bei-an-pure-cotton-non-paper-underwear-postpartum-cotton-children-wash-free-shorts', 55, 1, 0.00, NULL, '2018-10-22 03:31:35', '2018-10-22 08:35:26');
INSERT INTO `products` VALUES (50, 'zichu-pregnant-womens-pure-cotton-sanitary-underwear-disposable-cotton-products-postpartum', 55, 1, 0.00, NULL, '2018-10-22 03:31:37', '2018-10-22 08:39:17');
INSERT INTO `products` VALUES (51, 'aag-baby-rice-paste-scoop-bottle-squeeze-baby-feeding-spoon-silica-gel-feeder-complementary-spoon-wholesale', 70, 1, 0.00, NULL, '2018-10-22 03:31:40', '2018-10-22 08:39:38');
INSERT INTO `products` VALUES (52, 'pet-water-dispenser-pet-water-dispenser-cat-water-dispenser-hanging-teddy-automatic-feeder-water-bowl-toiletries', 57, 1, 0.00, NULL, '2018-10-22 03:31:43', '2018-10-22 08:49:31');
INSERT INTO `products` VALUES (53, 'pet-out-food-cup-dog-teddy-big-dog-portable-feeder-water-feeder-outdoor-kettle-out-supplies', 57, 1, 0.00, NULL, '2018-10-22 03:31:44', '2018-10-22 08:49:41');
INSERT INTO `products` VALUES (54, 'hartley-pet-accompanying-cup-outside-water-cup-outdoor-portable-water-jug-water-bowl-dog-water-dispenser', 57, 1, 0.00, NULL, '2018-10-22 03:31:46', '2018-10-22 08:59:10');
INSERT INTO `products` VALUES (55, 'dog-chain-dog-leash-large-and-medium-sized-dog-teddy-golden-hair-dog-rope-pet-supplies', 57, 1, 0.00, NULL, '2018-10-22 03:31:48', '2018-10-22 08:54:24');
INSERT INTO `products` VALUES (56, 'sleeping-bag-four-seasons-general-purpose-cat-pad-deep-sleep-cat-litter-kennel-web-celebrity-dog-litter-supplies-warm-in-winter', 57, 1, 0.00, NULL, '2018-10-22 03:31:50', '2018-10-22 08:59:12');
INSERT INTO `products` VALUES (57, 'bath-and-back-bath-balls', 22, 1, 0.00, NULL, '2018-10-22 08:24:42', '2018-10-22 08:55:30');
INSERT INTO `products` VALUES (58, 'add-water-to-the-humidifier-on-the-delmar-purification', 5, 1, 0.00, NULL, '2018-10-22 08:24:44', '2018-10-22 09:03:06');
INSERT INTO `products` VALUES (59, 'creative-slim-desktop-stand', 64, 1, 0.00, NULL, '2018-10-22 08:24:48', '2018-10-22 09:04:06');
INSERT INTO `products` VALUES (60, 'small-magic-clip-on-car-wireless-charging-mobile-phone-stand', 64, 1, 0.00, NULL, '2018-10-22 08:24:50', '2018-10-22 09:04:30');
INSERT INTO `products` VALUES (61, 'rotating-shopping-bag-folding-storage-bag', 48, 1, 0.00, NULL, '2018-10-22 08:24:53', '2018-10-22 09:06:20');
INSERT INTO `products` VALUES (62, 'traveling-wheat-straw-folding-hanger', 48, 1, 0.00, NULL, '2018-10-22 08:24:55', '2018-10-22 09:07:55');
INSERT INTO `products` VALUES (63, 'simple-and-versatile-neck-pillow', 32, 1, 0.00, NULL, '2018-10-22 08:24:58', '2018-10-22 09:10:50');
INSERT INTO `products` VALUES (64, 'apoo-rebers-wireless-thin-mouse', 65, 1, 0.00, NULL, '2018-10-22 08:25:01', '2018-10-22 09:11:05');
INSERT INTO `products` VALUES (65, 'white-white-wire-game-mouse', 65, 1, 0.00, NULL, '2018-10-22 08:25:05', '2018-10-22 09:14:36');
INSERT INTO `products` VALUES (66, 'qck-mass-mouse-pad', 65, 1, 0.00, NULL, '2018-10-22 08:25:09', '2018-10-22 09:14:49');
INSERT INTO `products` VALUES (67, 'lena-hair-straightening-rollers', 34, 1, 0.00, NULL, '2018-10-22 08:25:12', '2018-10-22 09:18:26');
INSERT INTO `products` VALUES (68, 'bristle-air-mattress-massage-comb', 22, 1, 0.00, NULL, '2018-10-22 08:25:16', '2018-10-22 09:18:35');
INSERT INTO `products` VALUES (69, 'cats-cradle-cats-cradle-cats-cradle-cats-cradle', 57, 1, 0.00, NULL, '2018-10-22 08:26:28', '2018-10-22 08:45:14');
INSERT INTO `products` VALUES (70, 'the-doghouse-can-be-removable-and-washed-for-large-pet-kennel-teddy-samo-pet-bed-small-dog-kennel', 57, 1, 0.00, NULL, '2018-10-22 08:26:30', '2018-10-22 08:58:25');
INSERT INTO `products` VALUES (71, 'teddy-kennel-can-be-removable-and-washed-four-seasons-universal-pet-mat-for-large-medium-and-small-dogs-to-keep-warm-in-winter-web-celebrity-supplies', 57, 1, 0.00, NULL, '2018-10-22 08:26:32', '2018-10-22 09:02:12');
INSERT INTO `products` VALUES (72, 'new-american-air-permeable-cat-hammock-sucker-cat-litter-cat-cage-cat-bed-to-support-26-kg', 57, 1, 0.00, NULL, '2018-10-22 08:26:35', '2018-10-22 09:04:38');
INSERT INTO `products` VALUES (73, 'hot-black-non-stick-steel-knife-set', 63, 1, 0.00, NULL, '2018-10-22 08:26:37', '2018-10-22 09:13:55');
INSERT INTO `products` VALUES (74, 'qiao-ah-po-ceramic-kitchen-knife-black-blade-cut-vegetables-fruit-knife-kitchen-narrow-chef-slice-slice-watermelon-ceramic-knife', 63, 1, 0.00, NULL, '2018-10-22 08:26:38', '2018-10-22 09:14:37');
INSERT INTO `products` VALUES (75, 'ceramic-knife-set-kitchen-knife-knife-fruit-peeler-black-blade', 63, 1, 0.00, NULL, '2018-10-22 08:26:40', '2018-10-22 09:17:08');
INSERT INTO `products` VALUES (76, 'oou-knife-set-stainless-steel-7-piece-set-knife-kitchen-kitchen-knife-set-esther-solid-wood-7-piece-set', 63, 1, 0.00, NULL, '2018-10-22 08:26:42', '2018-10-22 09:24:47');
INSERT INTO `products` VALUES (77, 'touch-series-ultra-rose-sliding-underpants-sharing-outfit', 39, 1, 0.00, NULL, '2018-10-22 08:26:44', '2018-10-22 09:25:00');
INSERT INTO `products` VALUES (78, 'cottonsmith-mini-window-dry-womens-panties-3-pieces-whitelight-pink-single-box-m', 39, 1, 0.00, NULL, '2018-10-22 08:26:46', '2018-10-22 09:22:56');
INSERT INTO `products` VALUES (79, 'simple-mens-casual-socks', 38, 1, 0.00, NULL, '2018-10-22 08:26:49', '2018-10-22 09:30:25');
INSERT INTO `products` VALUES (80, 'menna-ship-socks-women-socks-summer-invisible-socks-shallow-mouth-anti-skid-silicone-spring-summer-day-thin-skin-to-prevent-heel', 39, 1, 0.00, NULL, '2018-10-22 08:26:52', '2018-10-22 09:30:31');
INSERT INTO `products` VALUES (81, 'natural-bamboo-cutting-board-thickened-non-joint-non-slip-cutting-board', 63, 1, 0.00, NULL, '2018-10-22 08:26:55', '2018-10-22 09:32:58');
INSERT INTO `products` VALUES (82, 'original-wood-too-round-wooden-cutting-board-solid-wood-healthy-cutting-board-multi-functional-environmental-protection-mould-proof-wooden-kitchen-cutting-board', 63, 1, 0.00, NULL, '2018-10-22 08:26:57', '2018-10-22 09:40:03');
INSERT INTO `products` VALUES (83, 'non-shedding-water-absorbent-cloth-thickened-double-layer-fine-fiber-wipe-table-cloth-kitchen-cleaning-dish-towel-washing-dish-cloth', 66, 1, 0.00, NULL, '2018-10-22 08:26:59', '2018-10-22 09:38:20');
INSERT INTO `products` VALUES (84, 'double-color-double-sided-absorbent-dish-cloth-oil-wipe-towel-thickened-cloth-wipe-table-cloth-kitchen-ragdouble-color-double-sided-absorbent-dish-cloth-oil-wipe-towel-thickened-cloth-wipe-table-cloth-kitchen-rag', 66, 1, 0.00, NULL, '2018-10-22 08:27:01', '2018-10-22 09:40:11');
INSERT INTO `products` VALUES (85, 'nylon-pot-brush-with-long-handle-wood-does-not-hurt-the-pot-brush-does-not-stick-oil-wash-dishes-wash-creative-brush', 66, 1, 0.00, NULL, '2018-10-22 08:27:04', '2018-10-22 09:49:28');
INSERT INTO `products` VALUES (86, 'kitchen-brush-pan-brush-creative-soap-brush-hand-soap-brush-press-on-the-pan-and-wash-the-dishes', 66, 1, 0.00, NULL, '2018-10-22 08:27:06', '2018-10-22 09:50:33');
INSERT INTO `products` VALUES (87, 'ice-and-fire-magic-subdivision-thermos-cup', 67, 1, 0.00, NULL, '2018-10-22 08:27:08', '2018-10-22 09:50:25');
INSERT INTO `products` VALUES (88, 'light-smart-accompanying-vacuum-cup', 67, 1, 0.00, NULL, '2018-10-22 08:27:11', '2018-10-22 09:53:13');
INSERT INTO `products` VALUES (90, 'household-portable-projector', 86, 1, 0.00, NULL, '2018-10-24 03:36:03', '2018-10-24 03:50:54');
INSERT INTO `products` VALUES (91, 'test-nova-crate-product', NULL, 0, 0.00, NULL, '2018-10-25 15:56:33', '2018-10-25 15:56:33');
COMMIT;

-- ----------------------------
-- Table structure for promotion_actions
-- ----------------------------
DROP TABLE IF EXISTS `promotion_actions`;
CREATE TABLE `promotion_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `promotion_id` int(10) unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `promotion_actions_promotion_id_index` (`promotion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of promotion_actions
-- ----------------------------
BEGIN;
INSERT INTO `promotion_actions` VALUES (1, 1, 'order_fixed_discount', '{\"default_shop\": {\"amount\": 2000}}', '2018-10-23 02:34:17', '2018-10-23 06:36:34');
INSERT INTO `promotion_actions` VALUES (4, 2, 'order_fixed_discount', '{\"default_shop\": {\"amount\": 1000}}', '2018-10-23 06:37:59', '2018-10-23 06:37:59');
INSERT INTO `promotion_actions` VALUES (5, 2, 'order_fixed_discount', '{\"default_shop\": {\"amount\": 1000}}', '2018-10-23 06:39:26', '2018-10-23 06:39:26');
INSERT INTO `promotion_actions` VALUES (6, 3, 'order_fixed_discount', '{\"default_shop\": {\"amount\": 500}}', '2018-10-23 06:41:12', '2018-10-23 06:41:12');
INSERT INTO `promotion_actions` VALUES (7, 3, 'order_fixed_discount', '{\"default_shop\": {\"amount\": 500}}', '2018-10-23 06:41:31', '2018-10-23 06:41:31');
INSERT INTO `promotion_actions` VALUES (8, 4, 'order_fixed_discount', '{\"default_shop\": {\"amount\": 1000}}', '2018-10-23 06:43:44', '2018-10-23 06:43:44');
INSERT INTO `promotion_actions` VALUES (9, 4, 'order_fixed_discount', '{\"default_shop\": {\"amount\": 1000}}', '2018-10-23 06:44:04', '2018-10-23 06:44:04');
INSERT INTO `promotion_actions` VALUES (10, 4, 'order_fixed_discount', '{\"default_shop\": {\"amount\": 1000}}', '2018-10-23 06:44:14', '2018-10-23 06:44:14');
COMMIT;

-- ----------------------------
-- Table structure for promotion_coupon_translations
-- ----------------------------
DROP TABLE IF EXISTS `promotion_coupon_translations`;
CREATE TABLE `promotion_coupon_translations` (
  `locale_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translatable_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `unique_tl` (`translatable_id`,`locale_code`),
  KEY `promotion_coupon_translations_translatable_id_index` (`translatable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of promotion_coupon_translations
-- ----------------------------
BEGIN;
INSERT INTO `promotion_coupon_translations` VALUES ('en-US', '2', 'Full 100 minus 20', 'His general', '2018-10-23 06:27:59', '2018-10-23 06:36:34');
INSERT INTO `promotion_coupon_translations` VALUES ('en-US', '3', 'Full 50 minus 20', 'His general', '2018-10-23 06:39:26', '2018-10-23 06:39:26');
INSERT INTO `promotion_coupon_translations` VALUES ('en-US', '4', 'Cash 5 Dollar', 'His general', '2018-10-23 06:41:12', '2018-10-23 06:41:12');
INSERT INTO `promotion_coupon_translations` VALUES ('en-US', '5', 'Cash 10 Dollar', 'His general', '2018-10-23 06:43:44', '2018-10-23 06:43:44');
COMMIT;

-- ----------------------------
-- Table structure for promotion_coupons
-- ----------------------------
DROP TABLE IF EXISTS `promotion_coupons`;
CREATE TABLE `promotion_coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `promotion_id` int(10) unsigned NOT NULL,
  `stock` int(10) unsigned NOT NULL COMMENT '库存',
  `thrown_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已经发放的数量',
  `throw_began_at` timestamp NULL DEFAULT NULL COMMENT '可以被领取的日期',
  `throw_ended_at` timestamp NULL DEFAULT NULL COMMENT '截止发放日期',
  `catch_limit` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '领取限制',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '优惠价类型 满减卷,代金券',
  `configuration` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `promotion_coupons_code_unique` (`code`),
  KEY `promotion_coupons_promotion_id_index` (`promotion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of promotion_coupons
-- ----------------------------
BEGIN;
INSERT INTO `promotion_coupons` VALUES (1, 'full-100-20', 0, 1000, 0, NULL, NULL, 1, '', 'null', '2018-10-23 02:34:17', '2018-10-23 02:34:17');
INSERT INTO `promotion_coupons` VALUES (2, 'full-100-minus-20', 1, 999, 3, '2018-10-21 16:00:00', '2018-11-29 16:00:00', 1, 'discount', '{\"default_shop\": {\"fix_term\": \"30\", \"date_type\": \"fix_term\", \"least_amount\": 10000, \"reduce_amount\": 2000}}', '2018-10-23 02:35:34', '2018-10-24 03:48:03');
INSERT INTO `promotion_coupons` VALUES (3, 'full-50-minus-20', 2, 999, 4, '2018-10-21 16:00:00', '2018-11-29 16:00:00', 1, 'discount', '{\"default_shop\": {\"amount\": 1000, \"began_at\": \"2018-10-21 16:00:00\", \"ended_at\": \"2018-11-29 16:00:00\", \"date_type\": \"fix_time_range\", \"least_amount\": 5000, \"reduce_amount\": 1000}}', '2018-10-23 06:39:26', '2018-10-24 03:48:01');
INSERT INTO `promotion_coupons` VALUES (4, 'cash-5', 3, 999, 3, '2018-10-21 16:00:00', '2018-11-29 16:00:00', 1, 'cash', '{\"default_shop\": {\"amount\": 500, \"fix_term\": \"20\", \"date_type\": \"fix_term\", \"reduce_amount\": 500}}', '2018-10-23 06:41:12', '2018-10-24 03:47:05');
INSERT INTO `promotion_coupons` VALUES (5, 'cash-10', 4, 999, 4, '2018-10-21 16:00:00', '2018-11-29 16:00:00', 1, 'cash', '{\"default_shop\": {\"amount\": 1000, \"began_at\": \"2018-10-15 16:00:00\", \"ended_at\": \"2018-11-29 16:00:00\", \"date_type\": \"fix_time_range\", \"reduce_amount\": 1000}}', '2018-10-23 06:43:44', '2018-10-24 03:43:06');
COMMIT;

-- ----------------------------
-- Table structure for promotion_order
-- ----------------------------
DROP TABLE IF EXISTS `promotion_order`;
CREATE TABLE `promotion_order` (
  `order_id` int(10) unsigned NOT NULL,
  `promotion_id` int(10) unsigned NOT NULL,
  KEY `promotion_order_order_id_index` (`order_id`),
  KEY `promotion_order_promotion_id_index` (`promotion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for promotion_rules
-- ----------------------------
DROP TABLE IF EXISTS `promotion_rules`;
CREATE TABLE `promotion_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `promotion_id` int(10) unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `promotion_rules_promotion_id_index` (`promotion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of promotion_rules
-- ----------------------------
BEGIN;
INSERT INTO `promotion_rules` VALUES (1, 1, 'items_total', '{\"default_shop\": {\"amount\": 10000}}', '2018-10-23 02:34:17', '2018-10-23 06:36:34');
INSERT INTO `promotion_rules` VALUES (4, 2, 'items_total', '{\"default_shop\": {\"amount\": 5000}}', '2018-10-23 06:37:59', '2018-10-23 06:37:59');
INSERT INTO `promotion_rules` VALUES (5, 2, 'items_total', '{\"default_shop\": {\"amount\": 5000}}', '2018-10-23 06:39:26', '2018-10-23 06:39:26');
INSERT INTO `promotion_rules` VALUES (6, 3, 'items_total', '{\"default_shop\": {\"amount\": 0}}', '2018-10-23 06:41:12', '2018-10-23 06:41:12');
INSERT INTO `promotion_rules` VALUES (7, 3, 'items_total', '{\"default_shop\": {\"amount\": 0}}', '2018-10-23 06:41:31', '2018-10-23 06:41:31');
INSERT INTO `promotion_rules` VALUES (8, 4, 'items_total', '{\"default_shop\": {\"amount\": 0}}', '2018-10-23 06:43:44', '2018-10-23 06:43:44');
INSERT INTO `promotion_rules` VALUES (9, 4, 'items_total', '{\"default_shop\": {\"amount\": 0}}', '2018-10-23 06:44:04', '2018-10-23 06:44:04');
INSERT INTO `promotion_rules` VALUES (10, 4, 'items_total', '{\"default_shop\": {\"amount\": 0}}', '2018-10-23 06:44:14', '2018-10-23 06:44:14');
COMMIT;

-- ----------------------------
-- Table structure for promotions
-- ----------------------------
DROP TABLE IF EXISTS `promotions`;
CREATE TABLE `promotions` (
  `deleted_at` timestamp NULL DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `exclusive` tinyint(1) NOT NULL COMMENT '是否独有/排外',
  `coupon_based` tinyint(1) NOT NULL COMMENT '是否为优惠卷的基础',
  `began_at` timestamp NULL DEFAULT NULL COMMENT '促销开始时间',
  `ended_at` timestamp NULL DEFAULT NULL COMMENT '促销结束时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of promotions
-- ----------------------------
BEGIN;
INSERT INTO `promotions` VALUES (NULL, 1, '100-20', '', '', 0, 1, 1, NULL, NULL, '2018-10-23 02:30:43', '2018-10-23 06:36:34');
INSERT INTO `promotions` VALUES (NULL, 2, '50-10', '', '', 0, 1, 1, NULL, NULL, '2018-10-23 06:37:27', '2018-10-23 06:39:26');
INSERT INTO `promotions` VALUES (NULL, 3, 'cash-5', '', '', 0, 1, 1, NULL, NULL, '2018-10-23 06:40:24', '2018-10-23 06:41:31');
INSERT INTO `promotions` VALUES (NULL, 4, 'cash-10', '', '', 2, 1, 1, NULL, NULL, '2018-10-23 06:42:30', '2018-10-23 06:44:14');
COMMIT;

-- ----------------------------
-- Table structure for provinces
-- ----------------------------
DROP TABLE IF EXISTS `provinces`;
CREATE TABLE `provinces` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `provinces_code_unique` (`code`),
  KEY `provinces_country_id_index` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of provinces
-- ----------------------------
BEGIN;
INSERT INTO `provinces` VALUES (1, 2, 'guangdong', 'guangdong', '2018-10-22 07:28:32', '2018-10-22 07:28:32');
INSERT INTO `provinces` VALUES (2, 2, 'beijing', 'beijing', '2018-10-22 07:28:42', '2018-10-22 07:28:42');
INSERT INTO `provinces` VALUES (3, 3, 'Au1', 'Au1', '2018-10-22 07:28:57', '2018-10-22 07:28:57');
INSERT INTO `provinces` VALUES (4, 3, 'Au2', 'Au2', '2018-10-22 07:29:07', '2018-10-22 07:29:07');
INSERT INTO `provinces` VALUES (5, 1, 'california', 'california', '2018-10-22 07:29:18', '2018-10-22 07:29:18');
COMMIT;

-- ----------------------------
-- Table structure for shipments
-- ----------------------------
DROP TABLE IF EXISTS `shipments`;
CREATE TABLE `shipments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tracking_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipments_order_id_index` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of shipments
-- ----------------------------
BEGIN;
INSERT INTO `shipments` VALUES (27, 1, 36, 'ready', NULL, '2018-10-22 09:20:04', '2018-10-22 09:28:34');
INSERT INTO `shipments` VALUES (28, 1, 37, 'ready', NULL, '2018-10-22 09:36:10', '2018-10-22 09:36:18');
INSERT INTO `shipments` VALUES (29, 1, 38, 'ready', NULL, '2018-10-22 09:48:32', '2018-10-22 09:48:35');
INSERT INTO `shipments` VALUES (32, 1, 41, 'checkout', NULL, '2018-10-23 02:11:41', '2018-10-23 02:11:41');
INSERT INTO `shipments` VALUES (34, 1, 43, 'ready', NULL, '2018-10-23 06:18:56', '2018-10-23 06:19:05');
INSERT INTO `shipments` VALUES (38, 1, 47, 'checkout', NULL, '2018-10-24 06:34:54', '2018-10-24 06:34:54');
INSERT INTO `shipments` VALUES (41, 1, 50, 'checkout', NULL, '2018-10-24 06:37:13', '2018-10-24 06:37:13');
INSERT INTO `shipments` VALUES (43, 1, 52, 'checkout', NULL, '2018-10-24 06:40:33', '2018-10-24 06:40:33');
INSERT INTO `shipments` VALUES (44, 1, 53, 'checkout', NULL, '2018-10-24 06:50:54', '2018-10-24 06:50:54');
COMMIT;

-- ----------------------------
-- Table structure for shipping_categories
-- ----------------------------
DROP TABLE IF EXISTS `shipping_categories`;
CREATE TABLE `shipping_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for shipping_method_translations
-- ----------------------------
DROP TABLE IF EXISTS `shipping_method_translations`;
CREATE TABLE `shipping_method_translations` (
  `translatable_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `unique_tl` (`translatable_id`,`locale_code`),
  KEY `shipping_method_translations_translatable_id_index` (`translatable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for shipping_methods
-- ----------------------------
DROP TABLE IF EXISTS `shipping_methods`;
CREATE TABLE `shipping_methods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `zone_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `category_matched_pattern` tinyint(3) unsigned NOT NULL COMMENT '商品运输种类别匹配',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'configuration由具体的计算器规则得出',
  `calculator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '对应一个运费计算类',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of shipping_methods
-- ----------------------------
BEGIN;
INSERT INTO `shipping_methods` VALUES (1, 1, NULL, 1, 'youzhengxiaobao', '{\"default_shop\":{\"amount\":1000}}', 'flat_rate', 1, 0, '2018-10-20 12:04:14', '2018-10-20 12:04:18');
COMMIT;

-- ----------------------------
-- Table structure for taxon_translations
-- ----------------------------
DROP TABLE IF EXISTS `taxon_translations`;
CREATE TABLE `taxon_translations` (
  `translatable_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '优先通过该字段检索',
  `locale_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_tl` (`translatable_id`,`locale_code`),
  UNIQUE KEY `unique_ls` (`locale_code`,`slug`),
  KEY `taxon_translations_translatable_id_index` (`translatable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of taxon_translations
-- ----------------------------
BEGIN;
INSERT INTO `taxon_translations` VALUES (1, 'Classification Root Not Removable', NULL, 'category', 'en-US', NULL, NULL, 1);
INSERT INTO `taxon_translations` VALUES (2, 'Household Appliances', 'household-appliances', 'household-appliances', 'en-US', '2018-10-19 07:51:17', '2018-10-19 07:51:17', 2);
INSERT INTO `taxon_translations` VALUES (3, 'Clean Appliances', 'cleaning-appliances', 'cleaning-appliances', 'en-US', '2018-10-19 07:55:01', '2018-10-19 07:55:01', 3);
INSERT INTO `taxon_translations` VALUES (4, 'Sanitary Appliances', 'bathroom-appliances', 'bathroom-appliances', 'en-US', '2018-10-19 07:55:54', '2018-10-19 07:55:54', 4);
INSERT INTO `taxon_translations` VALUES (5, 'Air Appliances', 'air-appliances', 'air-appliances', 'en-US', '2018-10-19 07:56:48', '2018-10-19 07:56:48', 5);
INSERT INTO `taxon_translations` VALUES (6, 'Kitchen Appliances', 'kitchen-appliances', 'kitchen-appliances', 'en-US', '2018-10-19 07:57:23', '2018-10-19 07:57:23', 6);
INSERT INTO `taxon_translations` VALUES (7, 'Av Appliances', 'audi-video-appliances', 'audi-video-appliances', 'en-US', '2018-10-19 08:00:32', '2018-10-19 08:00:32', 7);
INSERT INTO `taxon_translations` VALUES (8, 'Other Accessories', 'other-accessories', 'other-accessories', 'en-US', '2018-10-19 08:01:29', '2018-10-19 08:01:29', 8);
INSERT INTO `taxon_translations` VALUES (9, 'Personal Care', NULL, 'personal', 'en-US', '2018-10-19 08:07:00', '2018-10-24 08:46:31', 9);
INSERT INTO `taxon_translations` VALUES (13, 'Other Cleaning Appliances', 'other-appliances', 'other-appliances', 'en-US', '2018-10-19 08:08:54', '2018-10-19 08:08:54', 10);
INSERT INTO `taxon_translations` VALUES (14, 'Smart Toilet Lid', 'smart-toilet-lid', 'smart-toilet-lid', 'en-US', '2018-10-19 08:09:38', '2018-10-19 08:09:38', 11);
INSERT INTO `taxon_translations` VALUES (15, 'Electric Heaters', 'electric-heating', 'electric-heating', 'en-US', '2018-10-19 08:10:07', '2018-10-19 08:11:43', 12);
INSERT INTO `taxon_translations` VALUES (16, 'Humidifier', 'humidifiers', 'humidifiers', 'en-US', '2018-10-19 08:11:15', '2018-10-19 08:11:57', 13);
INSERT INTO `taxon_translations` VALUES (17, 'Electric Fan', 'household-fans', 'household-fans', 'en-US', '2018-10-19 08:12:41', '2018-10-19 08:12:41', 14);
INSERT INTO `taxon_translations` VALUES (18, 'The Air Conditioning', 'air-conditioners', 'air-conditioners', 'en-US', '2018-10-19 08:13:09', '2018-10-19 08:13:09', 15);
INSERT INTO `taxon_translations` VALUES (19, 'The New Fan', 'ventilation-system', 'ventilation-system', 'en-US', '2018-10-19 08:15:22', '2018-10-19 08:15:22', 16);
INSERT INTO `taxon_translations` VALUES (20, 'Air Cleaner', 'air-purifiers', 'air-purifiers', 'en-US', '2018-10-19 08:15:56', '2018-10-19 08:15:56', 17);
INSERT INTO `taxon_translations` VALUES (21, 'Water Purifier', 'water-purifiers', 'water-purifiers', 'en-US', '2018-10-19 08:17:01', '2018-10-19 08:17:01', 18);
INSERT INTO `taxon_translations` VALUES (22, 'Regular Wash Protect', NULL, 'regular-wash-protect', 'en-US', '2018-10-19 08:17:37', '2018-10-19 08:17:37', 19);
INSERT INTO `taxon_translations` VALUES (23, 'The Refrigerator', 'refrigerators', 'refrigerators', 'en-US', '2018-10-19 08:17:40', '2018-10-19 08:17:40', 20);
INSERT INTO `taxon_translations` VALUES (24, 'The Coffee Machine', 'coffee-grinders', 'coffee-grinders', 'en-US', '2018-10-19 08:18:21', '2018-10-19 08:18:21', 21);
INSERT INTO `taxon_translations` VALUES (25, 'Sleep Aids', NULL, 'sleep-AIDS', 'en-US', '2018-10-19 08:18:38', '2018-10-19 08:18:38', 22);
INSERT INTO `taxon_translations` VALUES (26, 'Lampblack Machine', 'range-hoods', 'range-hoods', 'en-US', '2018-10-19 08:19:15', '2018-10-19 08:19:15', 23);
INSERT INTO `taxon_translations` VALUES (27, 'The Microwave Oven', 'microwave-ovens', 'microwave-ovens', 'en-US', '2018-10-19 08:20:11', '2018-10-19 08:20:11', 24);
INSERT INTO `taxon_translations` VALUES (28, 'Electric Oven', 'household-oven', 'household-oven', 'en-US', '2018-10-19 08:20:43', '2018-10-19 08:20:43', 25);
INSERT INTO `taxon_translations` VALUES (30, 'Cooking Machine', 'cooking-machines', 'cooking-machines', 'en-US', '2018-10-19 08:21:17', '2018-10-19 08:21:17', 26);
INSERT INTO `taxon_translations` VALUES (31, 'The Wall Machine', 'centrifugal-juicers', 'centrifugal-juicers', 'en-US', '2018-10-19 08:21:48', '2018-10-19 08:21:48', 27);
INSERT INTO `taxon_translations` VALUES (32, 'Massage And Rehabilitation', NULL, 'massage-rehabilitation', 'en-US', '2018-10-19 08:22:11', '2018-10-19 08:22:11', 28);
INSERT INTO `taxon_translations` VALUES (33, 'Juicer', 'juicers', 'juicers', 'en-US', '2018-10-19 08:22:49', '2018-10-19 08:24:02', 29);
INSERT INTO `taxon_translations` VALUES (34, 'Beauty Equipment', NULL, 'beauty-equipment', 'en-US', '2018-10-19 08:23:23', '2018-10-19 08:23:23', 30);
INSERT INTO `taxon_translations` VALUES (35, 'Electric Rice Cooker', 'electric-cookware', 'electric-cookware', 'en-US', '2018-10-19 08:23:51', '2018-10-19 08:23:51', 31);
INSERT INTO `taxon_translations` VALUES (36, 'Adult Supplies', NULL, 'adult-supplies', 'en-US', '2018-10-19 08:24:26', '2018-10-19 08:24:26', 32);
INSERT INTO `taxon_translations` VALUES (37, 'Dress', NULL, 'dress', 'en-US', '2018-10-19 08:25:38', '2018-10-19 08:25:38', 33);
INSERT INTO `taxon_translations` VALUES (38, 'Men', NULL, 'male', 'en-US', '2018-10-19 08:26:28', '2018-10-19 08:26:28', 34);
INSERT INTO `taxon_translations` VALUES (39, 'Ms', NULL, 'madam', 'en-US', '2018-10-19 08:26:57', '2018-10-19 08:26:57', 35);
INSERT INTO `taxon_translations` VALUES (42, 'Electric Kettle', 'electric-kettles', 'electric-kettles', 'en-US', '2018-10-19 08:30:21', '2018-10-19 08:30:21', 36);
INSERT INTO `taxon_translations` VALUES (43, 'Household', NULL, 'house', 'en-US', '2018-10-19 08:30:23', '2018-10-19 08:30:23', 37);
INSERT INTO `taxon_translations` VALUES (44, 'Bed Is Tasted', NULL, 'bedding', 'en-US', '2018-10-19 08:30:49', '2018-10-19 08:30:49', 38);
INSERT INTO `taxon_translations` VALUES (45, 'Rice Cooker', 'rice-cookers', 'rice-cookers', 'en-US', '2018-10-19 08:30:59', '2018-10-19 08:30:59', 39);
INSERT INTO `taxon_translations` VALUES (46, 'Lamps And Lanterns', NULL, 'lamps', 'en-US', '2018-10-19 08:31:17', '2018-10-19 08:31:17', 40);
INSERT INTO `taxon_translations` VALUES (47, 'Induction Cooker', 'induction-cooking', 'induction-cooking', 'en-US', '2018-10-19 08:31:23', '2018-10-19 08:31:23', 41);
INSERT INTO `taxon_translations` VALUES (48, 'To Receive A', NULL, 'accept', 'en-US', '2018-10-19 08:31:33', '2018-10-19 08:31:53', 42);
INSERT INTO `taxon_translations` VALUES (49, 'The Dishwasher', 'dishwashers', 'dishwashers', 'en-US', '2018-10-19 08:31:49', '2018-10-19 08:31:49', 43);
INSERT INTO `taxon_translations` VALUES (50, 'Bread Machine', 'bread-machines', 'bread-machines', 'en-US', '2018-10-19 08:32:21', '2018-10-19 08:32:21', 44);
INSERT INTO `taxon_translations` VALUES (51, 'Act The Role Ofing Is Tasted', NULL, 'decoration', 'en-US', '2018-10-19 08:32:48', '2018-10-19 08:32:48', 45);
INSERT INTO `taxon_translations` VALUES (52, 'Other Kitchen Appliances', 'other-kitchen-appliances', 'other-kitchen-appliances', 'en-US', '2018-10-19 08:32:49', '2018-10-19 08:32:49', 46);
INSERT INTO `taxon_translations` VALUES (53, 'Tv', 'televisions', 'televisions', 'en-US', '2018-10-19 08:33:17', '2018-10-19 08:33:17', 47);
INSERT INTO `taxon_translations` VALUES (54, 'The Projector', 'video-projectors', 'video-projectors', 'en-US', '2018-10-19 08:33:53', '2018-10-19 08:33:53', 48);
INSERT INTO `taxon_translations` VALUES (55, 'Travel', NULL, 'going', 'en-US', '2018-10-19 08:34:11', '2018-10-19 08:34:11', 49);
INSERT INTO `taxon_translations` VALUES (56, 'The Stereo', 'bluetooth-speakers', 'bluetooth-speakers', 'en-US', '2018-10-19 08:34:24', '2018-10-19 08:34:24', 50);
INSERT INTO `taxon_translations` VALUES (57, 'Pet', NULL, 'pet', 'en-US', '2018-10-19 08:34:33', '2018-10-19 08:34:33', 51);
INSERT INTO `taxon_translations` VALUES (58, 'Lug Plate', 'power-strips', 'power-strips', 'en-US', '2018-10-19 08:34:55', '2018-10-19 08:34:55', 52);
INSERT INTO `taxon_translations` VALUES (59, 'Kitchen Supplies', NULL, 'kitchen-supplies', 'en-US', '2018-10-19 08:35:12', '2018-10-19 08:35:12', 53);
INSERT INTO `taxon_translations` VALUES (60, 'Mosquito Lamp', 'bug-zappers', 'bug-zappers', 'en-US', '2018-10-19 08:35:18', '2018-10-19 08:35:18', 54);
INSERT INTO `taxon_translations` VALUES (61, 'Pots', NULL, 'cookware', 'en-US', '2018-10-19 08:35:42', '2018-10-19 08:35:42', 55);
INSERT INTO `taxon_translations` VALUES (62, '3C Digital', '3C-digital', '3C-digital', 'en-US', '2018-10-19 08:35:57', '2018-10-23 02:59:22', 56);
INSERT INTO `taxon_translations` VALUES (63, 'Kitchen Utensils And Appliances', NULL, 'cooking', 'en-US', '2018-10-19 08:36:04', '2018-10-19 08:36:16', 57);
INSERT INTO `taxon_translations` VALUES (64, 'Mobile Phone Accessories', 'mobile-phone-accessories', 'mobile-phone-accessories', 'en-US', '2018-10-19 08:36:46', '2018-10-19 08:36:46', 58);
INSERT INTO `taxon_translations` VALUES (65, 'Computer Accessories', 'computer-accessories', 'computer-accessories', 'en-US', '2018-10-19 08:37:16', '2018-10-19 08:37:16', 59);
INSERT INTO `taxon_translations` VALUES (66, 'Clean', NULL, 'clean', 'en-US', '2018-10-19 08:37:16', '2018-10-19 08:37:16', 60);
INSERT INTO `taxon_translations` VALUES (67, 'Tableware', NULL, 'tableware', 'en-US', '2018-10-19 08:37:37', '2018-10-19 08:37:37', 61);
INSERT INTO `taxon_translations` VALUES (68, 'Smart Wear', 'smart-wear', 'smart-wear', 'en-US', '2018-10-19 08:37:48', '2018-10-19 08:37:48', 62);
INSERT INTO `taxon_translations` VALUES (69, 'The Infant Child', NULL, 'baby', 'en-US', '2018-10-19 08:38:54', '2018-10-19 08:38:54', 63);
INSERT INTO `taxon_translations` VALUES (70, 'Feeding', NULL, 'feed', 'en-US', '2018-10-19 08:39:44', '2018-10-19 08:39:44', 64);
INSERT INTO `taxon_translations` VALUES (72, 'Photographic Camera', 'photography', 'photography', 'en-US', '2018-10-19 08:41:45', '2018-10-19 08:41:45', 65);
INSERT INTO `taxon_translations` VALUES (73, 'Exercise Outdoors', NULL, 'exercise/outdoors', 'en-US', '2018-10-19 08:41:48', '2018-10-19 08:41:48', 66);
INSERT INTO `taxon_translations` VALUES (75, 'Travel', NULL, 'travel', 'en-US', '2018-10-19 08:43:31', '2018-10-19 08:43:31', 67);
INSERT INTO `taxon_translations` VALUES (76, 'Photographic Drone', 'photography-drone', 'photography-drone', 'en-US', '2018-10-19 08:43:52', '2018-10-19 08:43:52', 68);
INSERT INTO `taxon_translations` VALUES (77, 'Movement', NULL, 'movement', 'en-US', '2018-10-19 08:43:53', '2018-10-19 08:43:53', 69);
INSERT INTO `taxon_translations` VALUES (78, 'Smart', NULL, 'smart', 'en-US', '2018-10-19 08:44:42', '2018-10-19 08:44:42', 70);
INSERT INTO `taxon_translations` VALUES (79, 'Cell Phone Video', 'mobile-phone-shooting', 'mobile-phone-shooting', 'en-US', '2018-10-19 08:44:58', '2018-10-19 08:44:58', 71);
INSERT INTO `taxon_translations` VALUES (80, 'Unmanned Aerial Vehicle Uav', NULL, 'UAV', 'en-US', '2018-10-19 08:45:01', '2018-10-19 08:45:01', 72);
INSERT INTO `taxon_translations` VALUES (81, 'The Robot', NULL, 'robot', 'en-US', '2018-10-19 08:45:41', '2018-10-19 08:45:41', 73);
INSERT INTO `taxon_translations` VALUES (82, 'Photography Auxiliary', 'photography-aid', 'photography-aid', 'en-US', '2018-10-19 08:45:48', '2018-10-19 08:45:48', 74);
INSERT INTO `taxon_translations` VALUES (83, 'Sports Camera', 'sports-camera', 'sports-camera', 'en-US', '2018-10-19 08:46:37', '2018-10-19 08:46:37', 75);
INSERT INTO `taxon_translations` VALUES (84, 'Virtual Reality', NULL, 'VR', 'en-US', '2018-10-19 08:47:40', '2018-10-19 08:47:40', 76);
INSERT INTO `taxon_translations` VALUES (85, '3 D Printing', NULL, '3D-print', 'en-US', '2018-10-19 08:48:23', '2018-10-19 08:48:31', 77);
INSERT INTO `taxon_translations` VALUES (86, 'Audio Appliances', 'audio appliances', 'audio appliances', 'en-US', '2018-10-24 03:29:11', '2018-10-24 03:29:11', 78);
INSERT INTO `taxon_translations` VALUES (87, 'Power Bank', NULL, NULL, 'en-US', '2018-10-24 18:36:45', '2018-10-24 18:36:45', 79);
INSERT INTO `taxon_translations` VALUES (87, '移动电源', NULL, NULL, 'zh_CN', '2018-10-24 18:36:45', '2018-10-24 18:36:45', 80);
COMMIT;

-- ----------------------------
-- Table structure for taxons
-- ----------------------------
DROP TABLE IF EXISTS `taxons`;
CREATE TABLE `taxons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `tree_left` int(10) unsigned DEFAULT NULL,
  `tree_right` int(10) unsigned DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `taxons_code_unique` (`code`),
  KEY `taxons_parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of taxons
-- ----------------------------
BEGIN;
INSERT INTO `taxons` VALUES (1, NULL, 1, 166, 0, 'category', '', NULL, '2018-10-19 06:32:50', NULL);
INSERT INTO `taxons` VALUES (2, 1, 2, 81, 0, 'household-appliances', NULL, '2018-10-19 07:51:17', '2018-10-19 07:51:17', NULL);
INSERT INTO `taxons` VALUES (3, 2, 3, 12, 0, 'cleaning-appliances', NULL, '2018-10-19 07:55:01', '2018-10-22 09:36:20', '2018-10-22 09:36:20');
INSERT INTO `taxons` VALUES (4, 2, 13, 16, 0, 'bathroom-appliances', NULL, '2018-10-19 07:55:54', '2018-10-22 09:36:42', '2018-10-22 09:36:42');
INSERT INTO `taxons` VALUES (5, 2, 17, 30, 0, 'air-appliances', NULL, '2018-10-19 07:56:48', '2018-10-19 07:56:48', NULL);
INSERT INTO `taxons` VALUES (6, 2, 31, 64, 0, 'kitchen-appliances', NULL, '2018-10-19 07:57:23', '2018-10-22 09:38:43', '2018-10-22 09:38:43');
INSERT INTO `taxons` VALUES (7, 2, 65, 72, 0, 'audi-video-appliances', NULL, '2018-10-19 08:00:32', '2018-10-22 09:40:37', '2018-10-22 09:40:37');
INSERT INTO `taxons` VALUES (8, 2, 73, 78, 0, 'other-accessories', NULL, '2018-10-19 08:01:29', '2018-10-19 08:01:29', NULL);
INSERT INTO `taxons` VALUES (9, 1, 82, 93, 10, 'personal', NULL, '2018-10-19 08:07:00', '2018-10-24 08:46:30', NULL);
INSERT INTO `taxons` VALUES (13, 3, 10, 11, 0, 'other-appliances', NULL, '2018-10-19 08:08:54', '2018-10-22 09:35:04', '2018-10-22 09:35:04');
INSERT INTO `taxons` VALUES (14, 4, 14, 15, 0, 'smart-toilet-lid', NULL, '2018-10-19 08:09:38', '2018-10-22 09:36:39', '2018-10-22 09:36:39');
INSERT INTO `taxons` VALUES (15, 5, 18, 19, 0, 'electric-heating', NULL, '2018-10-19 08:10:07', '2018-10-22 09:39:57', '2018-10-22 09:39:57');
INSERT INTO `taxons` VALUES (16, 5, 20, 21, 0, 'humidifiers', NULL, '2018-10-19 08:11:15', '2018-10-22 09:39:59', '2018-10-22 09:39:59');
INSERT INTO `taxons` VALUES (17, 5, 22, 23, 0, 'household-fans', NULL, '2018-10-19 08:12:41', '2018-10-22 09:40:02', '2018-10-22 09:40:02');
INSERT INTO `taxons` VALUES (18, 5, 24, 25, 0, 'air-conditioners', NULL, '2018-10-19 08:13:09', '2018-10-22 09:40:04', '2018-10-22 09:40:04');
INSERT INTO `taxons` VALUES (19, 5, 26, 27, 0, 'ventilation-system', NULL, '2018-10-19 08:15:21', '2018-10-22 09:40:06', '2018-10-22 09:40:06');
INSERT INTO `taxons` VALUES (20, 5, 28, 29, 0, 'air-purifiers', NULL, '2018-10-19 08:15:56', '2018-10-22 09:40:09', '2018-10-22 09:40:09');
INSERT INTO `taxons` VALUES (21, 6, 32, 33, 0, 'water-purifiers', NULL, '2018-10-19 08:17:01', '2018-10-22 09:37:43', '2018-10-22 09:37:43');
INSERT INTO `taxons` VALUES (22, 9, 83, 84, 0, 'regular-wash-protect', NULL, '2018-10-19 08:17:37', '2018-10-19 08:17:37', NULL);
INSERT INTO `taxons` VALUES (23, 6, 34, 35, 0, 'refrigerators', NULL, '2018-10-19 08:17:40', '2018-10-22 09:37:51', '2018-10-22 09:37:51');
INSERT INTO `taxons` VALUES (24, 6, 36, 37, 0, 'coffee-grinders', NULL, '2018-10-19 08:18:21', '2018-10-22 09:37:54', '2018-10-22 09:37:54');
INSERT INTO `taxons` VALUES (25, 9, 85, 86, 0, 'sleep-AIDS', NULL, '2018-10-19 08:18:38', '2018-10-19 08:18:38', NULL);
INSERT INTO `taxons` VALUES (26, 6, 38, 39, 0, 'range-hoods', NULL, '2018-10-19 08:19:15', '2018-10-22 09:37:59', '2018-10-22 09:37:59');
INSERT INTO `taxons` VALUES (27, 6, 40, 41, 0, 'microwave-ovens', NULL, '2018-10-19 08:20:10', '2018-10-22 09:38:03', '2018-10-22 09:38:03');
INSERT INTO `taxons` VALUES (28, 6, 42, 43, 0, 'household-oven', NULL, '2018-10-19 08:20:43', '2018-10-22 09:38:10', '2018-10-22 09:38:10');
INSERT INTO `taxons` VALUES (30, 6, 44, 45, 0, 'cooking-machines', NULL, '2018-10-19 08:21:17', '2018-10-22 09:38:08', '2018-10-22 09:38:08');
INSERT INTO `taxons` VALUES (31, 6, 46, 47, 0, 'centrifugal-juicers', NULL, '2018-10-19 08:21:48', '2018-10-22 09:38:14', '2018-10-22 09:38:14');
INSERT INTO `taxons` VALUES (32, 9, 87, 88, 0, 'massage-rehabilitation', NULL, '2018-10-19 08:22:11', '2018-10-19 08:22:11', NULL);
INSERT INTO `taxons` VALUES (33, 6, 50, 51, 0, 'juicers', NULL, '2018-10-19 08:22:49', '2018-10-22 09:38:17', '2018-10-22 09:38:17');
INSERT INTO `taxons` VALUES (34, 9, 89, 90, 0, 'beauty-equipment', NULL, '2018-10-19 08:23:23', '2018-10-19 08:23:23', NULL);
INSERT INTO `taxons` VALUES (35, 6, 48, 49, 0, 'electric-cookware', NULL, '2018-10-19 08:23:51', '2018-10-22 09:38:20', '2018-10-22 09:38:20');
INSERT INTO `taxons` VALUES (36, 9, 91, 92, 0, 'adult-supplies', NULL, '2018-10-19 08:24:26', '2018-10-22 09:43:11', '2018-10-22 09:43:11');
INSERT INTO `taxons` VALUES (37, 1, 94, 99, 0, 'dress', NULL, '2018-10-19 08:25:38', '2018-10-19 08:25:38', NULL);
INSERT INTO `taxons` VALUES (38, 37, 95, 96, 0, 'male', NULL, '2018-10-19 08:26:28', '2018-10-19 08:26:28', NULL);
INSERT INTO `taxons` VALUES (39, 37, 97, 98, 0, 'madam', NULL, '2018-10-19 08:26:57', '2018-10-19 08:26:57', NULL);
INSERT INTO `taxons` VALUES (42, 6, 52, 53, 0, 'electric-kettles', NULL, '2018-10-19 08:30:21', '2018-10-22 09:38:23', '2018-10-22 09:38:23');
INSERT INTO `taxons` VALUES (43, 1, 100, 113, 0, 'house', NULL, '2018-10-19 08:30:22', '2018-10-19 08:30:22', NULL);
INSERT INTO `taxons` VALUES (44, 43, 101, 102, 0, 'bedding', NULL, '2018-10-19 08:30:49', '2018-10-19 08:30:49', NULL);
INSERT INTO `taxons` VALUES (45, 6, 54, 55, 0, 'rice-cookers', NULL, '2018-10-19 08:30:59', '2018-10-22 09:38:32', '2018-10-22 09:38:32');
INSERT INTO `taxons` VALUES (46, 43, 103, 104, 0, 'lamps', NULL, '2018-10-19 08:31:17', '2018-10-22 09:47:18', '2018-10-22 09:47:18');
INSERT INTO `taxons` VALUES (47, 6, 56, 57, 0, 'induction-cooking', NULL, '2018-10-19 08:31:23', '2018-10-22 09:38:34', '2018-10-22 09:38:34');
INSERT INTO `taxons` VALUES (48, 43, 105, 106, 0, 'accept', NULL, '2018-10-19 08:31:33', '2018-10-19 08:31:53', NULL);
INSERT INTO `taxons` VALUES (49, 6, 58, 59, 0, 'dishwashers', NULL, '2018-10-19 08:31:49', '2018-10-22 09:38:37', '2018-10-22 09:38:37');
INSERT INTO `taxons` VALUES (50, 6, 60, 61, 0, 'bread-machines', NULL, '2018-10-19 08:32:21', '2018-10-22 09:38:28', '2018-10-22 09:38:28');
INSERT INTO `taxons` VALUES (51, 43, 107, 108, 0, 'decoration', NULL, '2018-10-19 08:32:48', '2018-10-22 09:47:34', '2018-10-22 09:47:34');
INSERT INTO `taxons` VALUES (52, 6, 62, 63, 0, 'other-kitchen-appliances', NULL, '2018-10-19 08:32:49', '2018-10-22 09:38:39', '2018-10-22 09:38:39');
INSERT INTO `taxons` VALUES (53, 7, 66, 67, 0, 'televisions', NULL, '2018-10-19 08:33:17', '2018-10-22 09:40:29', '2018-10-22 09:40:29');
INSERT INTO `taxons` VALUES (54, 7, 68, 69, 0, 'video-projectors', NULL, '2018-10-19 08:33:53', '2018-10-22 09:40:31', '2018-10-22 09:40:31');
INSERT INTO `taxons` VALUES (55, 43, 109, 110, 0, 'going', NULL, '2018-10-19 08:34:11', '2018-10-19 08:34:11', NULL);
INSERT INTO `taxons` VALUES (56, 7, 70, 71, 0, 'bluetooth-speakers', NULL, '2018-10-19 08:34:24', '2018-10-22 09:40:34', '2018-10-22 09:40:34');
INSERT INTO `taxons` VALUES (57, 43, 111, 112, 0, 'pet', NULL, '2018-10-19 08:34:33', '2018-10-19 08:34:33', NULL);
INSERT INTO `taxons` VALUES (58, 8, 74, 75, 0, 'power-strips', NULL, '2018-10-19 08:34:55', '2018-10-22 09:41:12', '2018-10-22 09:41:12');
INSERT INTO `taxons` VALUES (59, 1, 114, 123, 0, 'kitchen-supplies', NULL, '2018-10-19 08:35:12', '2018-10-19 08:35:12', NULL);
INSERT INTO `taxons` VALUES (60, 8, 76, 77, 0, 'bug-zappers', NULL, '2018-10-19 08:35:18', '2018-10-22 09:41:20', '2018-10-22 09:41:20');
INSERT INTO `taxons` VALUES (61, 59, 115, 116, 0, 'cookware', NULL, '2018-10-19 08:35:42', '2018-10-22 09:48:03', '2018-10-22 09:48:03');
INSERT INTO `taxons` VALUES (62, 1, 124, 133, 0, '3C-digital', NULL, '2018-10-19 08:35:57', '2018-10-19 08:38:26', NULL);
INSERT INTO `taxons` VALUES (63, 59, 117, 118, 0, 'cooking', NULL, '2018-10-19 08:36:04', '2018-10-19 08:36:16', NULL);
INSERT INTO `taxons` VALUES (64, 62, 125, 126, 0, 'mobile-phone-accessories', NULL, '2018-10-19 08:36:46', '2018-10-19 08:36:46', NULL);
INSERT INTO `taxons` VALUES (65, 62, 127, 128, 0, 'computer-accessories', NULL, '2018-10-19 08:37:16', '2018-10-19 08:37:16', NULL);
INSERT INTO `taxons` VALUES (66, 59, 119, 120, 0, 'clean', NULL, '2018-10-19 08:37:16', '2018-10-19 08:37:16', NULL);
INSERT INTO `taxons` VALUES (67, 59, 121, 122, 0, 'tableware', NULL, '2018-10-19 08:37:37', '2018-10-22 09:48:17', '2018-10-22 09:48:17');
INSERT INTO `taxons` VALUES (68, 62, 129, 130, 0, 'smart-wear', NULL, '2018-10-19 08:37:48', '2018-10-22 09:48:30', '2018-10-22 09:48:30');
INSERT INTO `taxons` VALUES (69, 1, 134, 139, 0, 'baby', NULL, '2018-10-19 08:38:54', '2018-10-19 08:38:54', NULL);
INSERT INTO `taxons` VALUES (70, 69, 135, 136, 0, 'feed', NULL, '2018-10-19 08:39:44', '2018-10-19 08:39:44', NULL);
INSERT INTO `taxons` VALUES (72, 1, 140, 149, 0, 'photography', NULL, '2018-10-19 08:41:45', '2018-10-22 09:48:59', '2018-10-22 09:48:59');
INSERT INTO `taxons` VALUES (73, 1, 150, 155, 0, 'exercise/outdoors', NULL, '2018-10-19 08:41:48', '2018-10-19 08:41:48', NULL);
INSERT INTO `taxons` VALUES (75, 73, 151, 152, 0, 'travel', NULL, '2018-10-19 08:43:31', '2018-10-22 09:49:14', '2018-10-22 09:49:14');
INSERT INTO `taxons` VALUES (76, 72, 141, 142, 0, 'photography-drone', NULL, '2018-10-19 08:43:52', '2018-10-22 09:48:48', '2018-10-22 09:48:48');
INSERT INTO `taxons` VALUES (77, 73, 153, 154, 0, 'movement', NULL, '2018-10-19 08:43:53', '2018-10-22 09:49:12', '2018-10-22 09:49:12');
INSERT INTO `taxons` VALUES (78, 1, 156, 165, 0, 'smart', NULL, '2018-10-19 08:44:42', '2018-10-22 09:49:42', '2018-10-22 09:49:42');
INSERT INTO `taxons` VALUES (79, 72, 143, 144, 0, 'mobile-phone-shooting', NULL, '2018-10-19 08:44:58', '2018-10-22 09:48:51', '2018-10-22 09:48:51');
INSERT INTO `taxons` VALUES (80, 78, 157, 158, 0, 'UAV', NULL, '2018-10-19 08:45:01', '2018-10-22 09:49:39', '2018-10-22 09:49:39');
INSERT INTO `taxons` VALUES (81, 78, 159, 160, 0, 'robot', NULL, '2018-10-19 08:45:41', '2018-10-22 09:49:37', '2018-10-22 09:49:37');
INSERT INTO `taxons` VALUES (82, 72, 145, 146, 0, 'photography-aid', NULL, '2018-10-19 08:45:48', '2018-10-22 09:48:53', '2018-10-22 09:48:53');
INSERT INTO `taxons` VALUES (83, 72, 147, 148, 0, 'sports-camera', NULL, '2018-10-19 08:46:37', '2018-10-22 09:48:55', '2018-10-22 09:48:55');
INSERT INTO `taxons` VALUES (84, 78, 161, 162, 0, 'VR', NULL, '2018-10-19 08:47:40', '2018-10-22 09:49:34', '2018-10-22 09:49:34');
INSERT INTO `taxons` VALUES (85, 78, 163, 164, 0, '3D-print', NULL, '2018-10-19 08:48:23', '2018-10-22 09:49:32', '2018-10-22 09:49:32');
INSERT INTO `taxons` VALUES (86, 2, 79, 80, 0, 'audio-appliances', NULL, '2018-10-24 03:29:11', '2018-10-24 03:29:11', NULL);
INSERT INTO `taxons` VALUES (87, 62, 131, 132, 0, 'power-bank', NULL, '2018-10-24 18:36:45', '2018-10-24 18:36:45', NULL);
COMMIT;

-- ----------------------------
-- Table structure for user_group_user
-- ----------------------------
DROP TABLE IF EXISTS `user_group_user`;
CREATE TABLE `user_group_user` (
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  KEY `user_group_user_user_id_index` (`user_id`),
  KEY `user_group_user_group_id_index` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for user_groups
-- ----------------------------
DROP TABLE IF EXISTS `user_groups`;
CREATE TABLE `user_groups` (
  `deleted_at` timestamp NULL DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `birthday` timestamp NULL DEFAULT NULL,
  `lasted_at` timestamp NULL DEFAULT NULL,
  `lasted_ip` int(10) unsigned DEFAULT NULL,
  `integral` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oauth` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_number_unique` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'http://maxwei.me/logo.png', '1251553881@qq.com', '$2y$10$3BgV0B7BdAW0gbAJ8uXAWeih2Y95ylkbFlIBsmgB8jBDttUTVCRd2', NULL, 'coco', 'lee', 1, '2018-10-12 00:00:00', NULL, NULL, 0, NULL, NULL, '2018-10-19 06:53:16', '2018-10-23 02:05:18');
INSERT INTO `users` VALUES (2, 'http://maxwei.me/logo.png', '522407532@qq.com', '$2y$10$zpg4OuTDF.HDtjOod39uUuV1nh3cc5T0vGghEoLA7LBTh9MKsia/q', NULL, 'benlong', 'lv', 0, '2018-10-02 00:00:00', NULL, NULL, 119, NULL, NULL, '2018-10-19 07:03:37', '2018-10-23 10:20:05');
INSERT INTO `users` VALUES (3, 'http://maxwei.me/logo.png', '862726779@qq.com', '$2y$10$qgU5xfQPl83ZWvxft0wJz.84V4oLSu4kEqt2qj8VqmF4f469VXx1y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2018-10-19 10:32:20', '2018-10-19 10:32:20');
INSERT INTO `users` VALUES (4, 'http://maxwei.me/logo.png', 'root@qq.com', '$2y$10$ON0l2cyghENHJR0L05exSORR1NwlZlJ4LlbezMNHSLHkCYdtC7lYe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2018-10-24 03:14:21', '2018-10-24 03:14:21');
INSERT INTO `users` VALUES (5, 'http://maxwei.me/logo.png', '11@q1.com', '$2y$10$uDCWGYpOjgOdKkn/nlY4teqTl3AlQa5seEghFd.pYre.0jrX9HiVi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2018-10-24 03:35:12', '2018-10-24 03:35:12');
INSERT INTO `users` VALUES (6, 'http://maxwei.me/logo.png', '10@10.com', '$2y$10$yzePsMsN5C6KGpiZs3iLneenE2dxkLWxXpct6ozWsILT9gnvL.pde', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2018-10-24 03:42:52', '2018-10-24 03:42:52');
COMMIT;

-- ----------------------------
-- Table structure for videos
-- ----------------------------
DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `deleted_at` timestamp NULL DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL COMMENT '产品id',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '视频介绍',
  `video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '视频地址',
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '视频封面',
  `length` int(10) unsigned DEFAULT NULL COMMENT '时间长度 unit/s',
  `size` double DEFAULT NULL COMMENT '视频大小 unit/M',
  `short_video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '短视频',
  `short_size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '短视频大小',
  `short_length` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '短视频长度',
  `type` tinyint(3) unsigned NOT NULL COMMENT '视频类型 official/kol',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `videos_user_id_index` (`user_id`),
  KEY `videos_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of videos
-- ----------------------------
BEGIN;
INSERT INTO `videos` VALUES (NULL, 6, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-19 09:46:23', '2018-10-19 09:46:38');
INSERT INTO `videos` VALUES (NULL, 7, NULL, 3, NULL, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/g7NFFTo6WVl1qAF29zK57ab6YRvfqZf4pN6RHjkz.jpeg', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-19 09:46:57', '2018-10-19 10:03:43');
INSERT INTO `videos` VALUES (NULL, 9, NULL, 6, NULL, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/BoAdpJQ9Bvn6HB9XY1nLKfjJK9NE0MVH9d4BLG2n.jpeg', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-19 10:11:53', '2018-10-20 09:11:50');
INSERT INTO `videos` VALUES (NULL, 10, NULL, 7, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/lt4T4_AaADyjYOKUwvf29LCAceep', 'http://pbfh6sbp9.bkt.clouddn.com/JCDh8SejPAI7UZbE8pQWQaRjRGHunV4Vi5s91CAB.jpeg', NULL, NULL, NULL, NULL, NULL, 0, 1, -222, '2018-10-19 10:35:11', '2018-10-22 10:23:56');
INSERT INTO `videos` VALUES (NULL, 12, NULL, 9, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/lrGdq8kt_FYvGuANXlYh2meXbN1T', 'http://pbfh6sbp9.bkt.clouddn.com/Us01JRekyhG0cUr3AkEPiLoXAfilfZ5IuFkYLWHF.png', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-20 02:13:47', '2018-10-20 02:34:35');
INSERT INTO `videos` VALUES (NULL, 14, NULL, 10, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/Fico71kPrI6nfY7J83WwV6yY9U3h', 'http://pbfh6sbp9.bkt.clouddn.com/BUNeNYoV2EqMDrCItuXjVZINqOSJKzh4JohqBBFO.jpeg', NULL, NULL, NULL, NULL, NULL, 0, 1, -20, '2018-10-20 07:43:16', '2018-10-22 10:24:51');
INSERT INTO `videos` VALUES (NULL, 15, NULL, 11, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/lsYfYERA0T3aKbSNepGzq9UU8PLI', 'http://pbfh6sbp9.bkt.clouddn.com/E2PSVoHy7rI93rpOngG539EhbQ77h7q9rCqZtuaS.jpeg', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-20 07:59:22', '2018-10-22 10:24:20');
INSERT INTO `videos` VALUES (NULL, 16, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-20 08:37:37', '2018-10-20 08:37:37');
INSERT INTO `videos` VALUES (NULL, 17, NULL, 13, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/lrGdq8kt_FYvGuANXlYh2meXbN1T', 'http://pbfh6sbp9.bkt.clouddn.com/FsUcBHpcXs2XmKcVlm9ZeJReXMpE', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-20 10:00:48', '2018-10-20 10:09:00');
INSERT INTO `videos` VALUES (NULL, 18, NULL, 14, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/FoWyi2rVb1t4qiQhoePbdH5Zj5Y5', 'http://pbfh6sbp9.bkt.clouddn.com/FrksWIi13dLmpR9xAViH0Es3ERUY', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-20 10:00:50', '2018-10-20 10:22:36');
INSERT INTO `videos` VALUES (NULL, 19, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-20 10:00:53', '2018-10-20 10:00:53');
INSERT INTO `videos` VALUES (NULL, 20, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-20 10:00:55', '2018-10-20 10:00:55');
INSERT INTO `videos` VALUES (NULL, 21, NULL, 17, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/Fqd4inM4zUDfO2pUnGH5i4BEmJQU', 'http://pbfh6sbp9.bkt.clouddn.com/Fnt56UcybP47bOoIh443cJD5pB7y', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-20 10:00:57', '2018-10-20 10:46:12');
INSERT INTO `videos` VALUES (NULL, 22, NULL, 18, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/lrtfTLRKL0_Hz4CD7JpHL63emKap', 'http://pbfh6sbp9.bkt.clouddn.com/FpzINhRj_yUwnZ8ydWS8rVgu48TW', NULL, NULL, NULL, NULL, NULL, 0, 1, 1, '2018-10-20 10:00:59', '2018-10-22 01:48:02');
INSERT INTO `videos` VALUES (NULL, 23, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-20 10:01:00', '2018-10-20 10:01:00');
INSERT INTO `videos` VALUES (NULL, 24, NULL, 20, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/lpUSub-pT1HnGbiULIMCvKknakYe', 'http://pbfh6sbp9.bkt.clouddn.com/Fv--fgkjWqdj-j0pJWfZbASL7T_X', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-20 10:01:03', '2018-10-22 02:06:01');
INSERT INTO `videos` VALUES (NULL, 25, NULL, 21, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/Ft8uZRwXX_Eux2U7JDgjFffsTfTW', 'http://pbfh6sbp9.bkt.clouddn.com/Fh-Xg4ATWNQ4Quy4eU0B1xGA6FmR', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-20 10:01:05', '2018-10-22 02:08:10');
INSERT INTO `videos` VALUES (NULL, 26, NULL, 22, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/Ft8uZRwXX_Eux2U7JDgjFffsTfTW', 'http://pbfh6sbp9.bkt.clouddn.com/FvLzabw3sI1_fNlPaPqIWqH8X2f_', NULL, NULL, NULL, NULL, NULL, 0, 1, 5, '2018-10-20 10:01:08', '2018-10-22 10:25:47');
INSERT INTO `videos` VALUES (NULL, 27, NULL, 23, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/FhCSgMSbtBNdUplDlF1EpX23dMyw', 'http://pbfh6sbp9.bkt.clouddn.com/FkKk7wKjMTp_D6i15ZCm1ROHFDjt', NULL, NULL, NULL, NULL, NULL, 0, 1, 5, '2018-10-20 10:01:13', '2018-10-22 10:26:16');
INSERT INTO `videos` VALUES (NULL, 28, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-20 10:01:15', '2018-10-20 10:01:15');
INSERT INTO `videos` VALUES (NULL, 29, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-20 10:01:19', '2018-10-20 10:01:19');
INSERT INTO `videos` VALUES (NULL, 30, NULL, 26, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/FsD0ymIhPAfQnGL9p3AuN_jMubUh', 'http://pbfh6sbp9.bkt.clouddn.com/FgGSh0gqLQQTW4Vo6V3761G54buX', NULL, NULL, NULL, NULL, NULL, 0, 1, 5, '2018-10-20 10:01:21', '2018-10-22 10:26:57');
INSERT INTO `videos` VALUES (NULL, 31, NULL, 27, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/luE32b9RrLqT9Ayvr8spVHllgOL_', 'http://pbfh6sbp9.bkt.clouddn.com/FiWjAUH97sGyvcqXDw8qdA-fjaOm', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-20 10:01:24', '2018-10-22 02:55:29');
INSERT INTO `videos` VALUES (NULL, 32, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 03:30:00', '2018-10-22 03:30:00');
INSERT INTO `videos` VALUES (NULL, 33, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 03:30:05', '2018-10-22 03:30:05');
INSERT INTO `videos` VALUES (NULL, 34, NULL, 30, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/luCbfZt3oVfU6hNvgqVhUkYxDns7', 'http://pbfh6sbp9.bkt.clouddn.com/Ft17diVYbtHnIaN8own-rf6tyuKt', NULL, NULL, NULL, NULL, NULL, 0, 1, 5, '2018-10-22 03:30:07', '2018-10-22 10:27:25');
INSERT INTO `videos` VALUES (NULL, 35, NULL, 31, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/lvIpQI79LMlEjVJuTTXhYF03Wu2n', 'http://pbfh6sbp9.bkt.clouddn.com/FtF8xJ-qI_S6IT4ZYb4uTS44fdpA', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-22 03:30:14', '2018-10-22 06:26:35');
INSERT INTO `videos` VALUES (NULL, 36, NULL, 32, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/lja02vgI3vY34KjFqgvaFMH3NqFP', 'http://pbfh6sbp9.bkt.clouddn.com/FtcIUol-di3_qjV3sLBhOJW4FN2L', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-22 03:30:23', '2018-10-22 06:34:05');
INSERT INTO `videos` VALUES (NULL, 37, NULL, 33, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/FmjSd-E1B8WhamVPJ52BekA6ras3', 'http://pbfh6sbp9.bkt.clouddn.com/FsXxhzNGNU93EXX5C8nAPcU2Z8jG', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-22 03:30:33', '2018-10-22 06:38:28');
INSERT INTO `videos` VALUES (NULL, 38, NULL, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 03:30:39', '2018-10-22 03:30:39');
INSERT INTO `videos` VALUES (NULL, 39, NULL, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 03:30:46', '2018-10-22 03:30:46');
INSERT INTO `videos` VALUES (NULL, 40, NULL, 36, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/FuO819_UvneCDeXBXPVZYQAtwWFm', 'http://pbfh6sbp9.bkt.clouddn.com/FtrE8WPMTpBtaG6tABqSJ2oP3_79', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-22 03:30:51', '2018-10-22 06:50:36');
INSERT INTO `videos` VALUES (NULL, 41, NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 03:30:57', '2018-10-22 03:30:57');
INSERT INTO `videos` VALUES (NULL, 42, NULL, 38, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/FswZXME4KjMC06W8FAFcYVSBiwFU', 'http://pbfh6sbp9.bkt.clouddn.com/FldX7YvvrrPCDPLXXQ-vrLUiBtor', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-22 03:31:00', '2018-10-22 08:47:14');
INSERT INTO `videos` VALUES (NULL, 43, NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 03:31:05', '2018-10-22 03:31:05');
INSERT INTO `videos` VALUES (NULL, 44, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 03:31:09', '2018-10-22 03:31:09');
INSERT INTO `videos` VALUES (NULL, 45, NULL, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 03:31:12', '2018-10-22 03:31:12');
INSERT INTO `videos` VALUES (NULL, 46, NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 03:31:16', '2018-10-22 03:31:16');
INSERT INTO `videos` VALUES (NULL, 47, NULL, 43, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/ljRiO4yeDQE4fvIHvBPH8WmueQ1K', 'http://pbfh6sbp9.bkt.clouddn.com/FqpzwO4JwfVorxH5N24Q1yvFaxzk', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-22 03:31:20', '2018-10-22 08:22:50');
INSERT INTO `videos` VALUES (NULL, 48, NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 03:31:22', '2018-10-22 03:31:22');
INSERT INTO `videos` VALUES (NULL, 49, NULL, 45, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/FpeVObC5ia4KDWa3-wbRVTDgOxRj', 'http://pbfh6sbp9.bkt.clouddn.com/FpNPgXW-z3ILYLq5cXK8OSZYY7UT', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-22 03:31:24', '2018-10-22 08:27:38');
INSERT INTO `videos` VALUES (NULL, 50, NULL, 46, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/lrmQMxSjtW8t624Yu1Okt4RpKXnB', 'http://pbfh6sbp9.bkt.clouddn.com/FlQjEqF6bTHH7tuuCceh7G03MUhg', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-22 03:31:27', '2018-10-22 08:29:24');
INSERT INTO `videos` VALUES (NULL, 51, NULL, 47, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/lmpJ5ASDIi9jI3lya9x9P62HRpiT', 'http://pbfh6sbp9.bkt.clouddn.com/FpQd24VPDMcv1PHEjEaoIGHGU1Tq', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-22 03:31:31', '2018-10-22 08:31:06');
INSERT INTO `videos` VALUES (NULL, 52, NULL, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 03:31:33', '2018-10-22 03:31:33');
INSERT INTO `videos` VALUES (NULL, 53, NULL, 49, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/lqNhTLJchydmpf6jQnaV_giMZTKZ', 'http://pbfh6sbp9.bkt.clouddn.com/Fpa_9P7S55XSzeI5eSKObK14JVDi', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-22 03:31:35', '2018-10-22 08:48:48');
INSERT INTO `videos` VALUES (NULL, 54, NULL, 50, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/Fi5MzgeouwxNPiqxlPBVq5xRkU2R', 'http://pbfh6sbp9.bkt.clouddn.com/Fsomeq6jC2OaJctYi0d1dCxt4uNy', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-22 03:31:37', '2018-10-22 08:48:58');
INSERT INTO `videos` VALUES (NULL, 55, NULL, 51, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/FqgZYEdCypUjlX_aNbcDGrlotn3q', 'http://pbfh6sbp9.bkt.clouddn.com/Fs7GnxzpBv0BGbm-Wko5IPpLNi0A', NULL, NULL, NULL, NULL, NULL, 0, 1, 5, '2018-10-22 03:31:40', '2018-10-22 10:28:17');
INSERT INTO `videos` VALUES (NULL, 56, NULL, 52, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/FiPCEIqZzke-RoPQiOEZKs6xow-G', 'http://pbfh6sbp9.bkt.clouddn.com/Fk5fNy7NbW9O5ROobNp0aGWHUhec', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-22 03:31:43', '2018-10-22 08:49:23');
INSERT INTO `videos` VALUES (NULL, 57, NULL, 53, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/FsGqEO7naj8Qs_t8oGshufu18U92', 'http://pbfh6sbp9.bkt.clouddn.com/Ft--lOHNdVOT6VrOtim9dBEFnXvH', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-22 03:31:44', '2018-10-22 08:43:23');
INSERT INTO `videos` VALUES (NULL, 58, NULL, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 03:31:46', '2018-10-22 03:31:46');
INSERT INTO `videos` VALUES (NULL, 59, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 03:31:48', '2018-10-22 03:31:48');
INSERT INTO `videos` VALUES (NULL, 60, NULL, 56, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/lqPvyzcF1Z_0zXs4VXel8UllS7Z8', 'http://pbfh6sbp9.bkt.clouddn.com/FtEI_80rho9GRTyXL82I2rPCXAtp', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 03:31:50', '2018-10-22 08:55:52');
INSERT INTO `videos` VALUES (NULL, 61, NULL, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 08:24:42', '2018-10-22 08:24:42');
INSERT INTO `videos` VALUES (NULL, 62, NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 08:24:44', '2018-10-22 08:24:44');
INSERT INTO `videos` VALUES (NULL, 63, NULL, 59, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/FgroO33NYjHJgaQGnJTil23W1YEA', 'http://pbfh6sbp9.bkt.clouddn.com/FjtwtOubOZUTTAIxHqfIQWwlubaO', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 08:24:48', '2018-10-22 09:02:47');
INSERT INTO `videos` VALUES (NULL, 64, NULL, 60, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/luQPtu0SIRvu-S4T4P8qQA5K6JYY', 'http://pbfh6sbp9.bkt.clouddn.com/FsPC2T7jumBGPTp_pg6uU3sQUTmK', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-22 08:24:50', '2018-10-22 09:04:16');
INSERT INTO `videos` VALUES (NULL, 65, NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 08:24:53', '2018-10-22 08:24:53');
INSERT INTO `videos` VALUES (NULL, 66, NULL, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 08:24:55', '2018-10-22 08:24:55');
INSERT INTO `videos` VALUES (NULL, 67, NULL, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 08:24:58', '2018-10-22 08:24:58');
INSERT INTO `videos` VALUES (NULL, 68, NULL, 64, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/Fn0rKp0PP-JmwMkFETZ5LAxJyu8x', 'http://pbfh6sbp9.bkt.clouddn.com/FvAswZkPqlj29j5XKtvz9iIySY8-', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-22 08:25:01', '2018-10-22 09:09:08');
INSERT INTO `videos` VALUES (NULL, 69, NULL, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 08:25:06', '2018-10-22 08:25:06');
INSERT INTO `videos` VALUES (NULL, 70, NULL, 66, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/lltUNOGBtJV2JEyV7e6Q_SKPsdzW', 'http://pbfh6sbp9.bkt.clouddn.com/FrcKsyZN1xIpxmOgosUZi-R1jk7f', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-22 08:25:09', '2018-10-22 09:12:00');
INSERT INTO `videos` VALUES (NULL, 71, NULL, 67, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/lnD-HJVop_IyGu3mcq7yXDb_x9gJ', 'http://pbfh6sbp9.bkt.clouddn.com/FjTGTBoWxlGLvSbxkdhaQCLRMHj9', NULL, NULL, NULL, NULL, NULL, 0, 1, 5, '2018-10-22 08:25:12', '2018-10-22 10:28:49');
INSERT INTO `videos` VALUES (NULL, 72, NULL, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 08:25:16', '2018-10-22 08:25:16');
INSERT INTO `videos` VALUES (NULL, 73, NULL, 69, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/FrMkmOS6MpVN8WK0OoLR50f__qI9', 'http://pbfh6sbp9.bkt.clouddn.com/Fj5KCE1knV8dp_c6JUXLd0afsqM1', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-22 08:26:28', '2018-10-22 08:45:14');
INSERT INTO `videos` VALUES (NULL, 74, NULL, 70, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/FnyXkqYQfRXCL5SSpJiWl9sp7X97', 'http://pbfh6sbp9.bkt.clouddn.com/FuWMQ5xpg-3ROe9aD5Lyk8QGWPe9', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-22 08:26:30', '2018-10-22 10:07:01');
INSERT INTO `videos` VALUES (NULL, 75, NULL, 71, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/FoHTocH4hQhu-FjVz_TYirWL3d2I', 'http://pbfh6sbp9.bkt.clouddn.com/FnWWEuAgsKMdxRxR7eLteDuZeb2T', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-22 08:26:32', '2018-10-22 09:02:08');
INSERT INTO `videos` VALUES (NULL, 76, NULL, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 08:26:35', '2018-10-22 08:26:35');
INSERT INTO `videos` VALUES (NULL, 77, NULL, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 08:26:37', '2018-10-22 08:26:37');
INSERT INTO `videos` VALUES (NULL, 78, NULL, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 08:26:38', '2018-10-22 08:26:38');
INSERT INTO `videos` VALUES (NULL, 79, NULL, 75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 08:26:40', '2018-10-22 08:26:40');
INSERT INTO `videos` VALUES (NULL, 80, NULL, 76, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 08:26:42', '2018-10-22 08:26:42');
INSERT INTO `videos` VALUES (NULL, 81, NULL, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 08:26:44', '2018-10-22 08:26:44');
INSERT INTO `videos` VALUES (NULL, 82, NULL, 78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 08:26:46', '2018-10-22 08:26:46');
INSERT INTO `videos` VALUES (NULL, 83, NULL, 79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 08:26:49', '2018-10-22 08:26:49');
INSERT INTO `videos` VALUES (NULL, 84, NULL, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 08:26:52', '2018-10-22 08:26:52');
INSERT INTO `videos` VALUES (NULL, 85, NULL, 81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 08:26:55', '2018-10-22 08:26:55');
INSERT INTO `videos` VALUES (NULL, 86, NULL, 82, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/FmSqa6zZy3edaSw3OpOf51stEo4X', 'http://pbfh6sbp9.bkt.clouddn.com/FmnDaNmASwBUncOKBhvc0oo7sFAa', NULL, NULL, NULL, NULL, NULL, 0, 1, 5, '2018-10-22 08:26:57', '2018-10-22 10:29:18');
INSERT INTO `videos` VALUES (NULL, 87, NULL, 83, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/loA4MgTgW1q5WUVzDm18QmaD63Mb', 'http://pbfh6sbp9.bkt.clouddn.com/FmAZkqRNASZCI-EgprYyDxfHC8fi', NULL, NULL, NULL, NULL, NULL, 0, 1, 5, '2018-10-22 08:26:59', '2018-10-22 10:29:45');
INSERT INTO `videos` VALUES (NULL, 88, NULL, 84, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/FjVFc_XyHK4TaUEnJ_kCx1MZt_tc', 'http://pbfh6sbp9.bkt.clouddn.com/Fm_E752YGUNiUdkHOFG_g-WXRTka', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-22 08:27:01', '2018-10-22 09:40:11');
INSERT INTO `videos` VALUES (NULL, 89, NULL, 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 08:27:04', '2018-10-22 08:27:04');
INSERT INTO `videos` VALUES (NULL, 90, NULL, 86, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/FtpOsHDlfW9NAJmyzJePTyy8CYY2', 'http://pbfh6sbp9.bkt.clouddn.com/FvFSKCybJL15j-ILKg5RWinyEmr5', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-22 08:27:06', '2018-10-22 09:50:30');
INSERT INTO `videos` VALUES (NULL, 91, NULL, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2018-10-22 08:27:08', '2018-10-22 08:27:08');
INSERT INTO `videos` VALUES (NULL, 92, NULL, 88, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/lozbsXFNtUSBQlfZldZ-6M6RfrOy', 'http://pbfh6sbp9.bkt.clouddn.com/FnGBrCmyiAoiVeUiT9egqmtYNvig', NULL, NULL, NULL, NULL, NULL, 0, 1, 5, '2018-10-22 08:27:11', '2018-10-22 10:30:12');
INSERT INTO `videos` VALUES (NULL, 94, NULL, 90, NULL, 'http://pbfh6sbp9.bkt.clouddn.com/FhFPJ1F_5-kVSfQ01v9mpRYn9szJ', 'http://pbfh6sbp9.bkt.clouddn.com/FmDWorgDhTzFrdF4cTABO2gwrqru', NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2018-10-24 03:36:03', '2018-10-24 03:55:21');
COMMIT;

-- ----------------------------
-- Table structure for zone_members
-- ----------------------------
DROP TABLE IF EXISTS `zone_members`;
CREATE TABLE `zone_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `zone_members_member_type_member_id_index` (`member_type`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for zones
-- ----------------------------
DROP TABLE IF EXISTS `zones`;
CREATE TABLE `zones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
