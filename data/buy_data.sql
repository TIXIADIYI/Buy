/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : buy_data

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 15/10/2018 22:39:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pass` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES (1, 'admin', '123456');

-- ----------------------------
-- Table structure for product_comment
-- ----------------------------
DROP TABLE IF EXISTS `product_comment`;
CREATE TABLE `product_comment`  (
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `user_id` int(20) NULL DEFAULT NULL,
  `product_id` int(20) NULL DEFAULT NULL,
  `time` date NULL DEFAULT NULL,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  CONSTRAINT `product_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `product_comment_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type`  (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_type`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_type
-- ----------------------------
INSERT INTO `product_type` VALUES (11, '小吃快餐');
INSERT INTO `product_type` VALUES (13, '新鲜果蔬');
INSERT INTO `product_type` VALUES (12, '烧烤烤肉');
INSERT INTO `product_type` VALUES (10, '甜点饮品');
INSERT INTO `product_type` VALUES (14, '美味火锅');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` float(20, 0) NULL DEFAULT NULL,
  `remake` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `image` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sum` int(50) NULL DEFAULT NULL,
  `time` date NULL DEFAULT NULL,
  `click` int(20) NULL DEFAULT NULL,
  `type` tinyint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `p_type`(`type`) USING BTREE,
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`type`) REFERENCES `product_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, '一个测试的二手商品', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pass` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `header` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'user', '123456', '小王', NULL);

SET FOREIGN_KEY_CHECKS = 1;
