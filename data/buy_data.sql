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

 Date: 22/10/2018 12:45:01
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `y` int(20) NULL DEFAULT NULL,
  `n` int(20) NULL DEFAULT NULL,
  `praise` bit(1) NULL DEFAULT NULL,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  CONSTRAINT `product_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_comment_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_comment
-- ----------------------------
INSERT INTO `product_comment` VALUES ('这个手机很赞！', 2, 1, '2018-10-16', NULL, NULL, b'1');

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type`  (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_type`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_type
-- ----------------------------
INSERT INTO `product_type` VALUES (6, 'U盘');
INSERT INTO `product_type` VALUES (4, '书籍');
INSERT INTO `product_type` VALUES (8, '彩妆');
INSERT INTO `product_type` VALUES (1, '智能手机');
INSERT INTO `product_type` VALUES (5, '服装');
INSERT INTO `product_type` VALUES (23, '生活用品');
INSERT INTO `product_type` VALUES (3, '相机');
INSERT INTO `product_type` VALUES (2, '笔记本电脑');
INSERT INTO `product_type` VALUES (7, '背包');

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
  `click` int(20) NOT NULL DEFAULT 0,
  `product_type_id` tinyint(20) NULL DEFAULT NULL,
  `prices` float(50, 0) NULL DEFAULT NULL,
  `display` bit(1) NOT NULL,
  `user_id` int(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `p_type`(`product_type_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, '楠神旗舰电脑', NULL, NULL, NULL, NULL, '2018-10-02', 1, 2, NULL, b'1', 1);
INSERT INTO `products` VALUES (2, '楠神的商品', NULL, NULL, '1111111', NULL, '2018-10-17', 5, 1, NULL, b'1', 1);
INSERT INTO `products` VALUES (3, '楠神手机', NULL, NULL, 'img/shop02.png', NULL, '2018-06-06', 99, 1, NULL, b'1', 1);
INSERT INTO `products` VALUES (4, '海飞丝', 50, '要毕业了用不完，还有400多毫升', NULL, 5, '2018-10-09', 40, 23, 100, b'1', 2);
INSERT INTO `products` VALUES (5, '测试专用商品', 99, '测试专用哦', NULL, 999, '2018-10-31', 55, 5, 999, b'1', 2);
INSERT INTO `products` VALUES (6, '测试专用商品2', 88, NULL, NULL, NULL, '2018-10-30', 5, 6, NULL, b'1', NULL);
INSERT INTO `products` VALUES (7, '测试专用商品3', 77, NULL, NULL, NULL, NULL, 66, 7, NULL, b'1', NULL);
INSERT INTO `products` VALUES (8, '测试专用商品4', NULL, NULL, NULL, NULL, NULL, 7, 8, NULL, b'1', NULL);
INSERT INTO `products` VALUES (9, '测试专用商品5', 66, NULL, NULL, NULL, NULL, 3, 23, 1, b'1', NULL);

-- ----------------------------
-- Table structure for recommend
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend`  (
  `commend` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `admin_id` int(20) NULL DEFAULT NULL,
  `value` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `admin_id`(`admin_id`) USING BTREE,
  CONSTRAINT `recommend_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recommend
-- ----------------------------
INSERT INTO `recommend` VALUES ('你对楠神手机的看法？', 1, '楠神手机');
INSERT INTO `recommend` VALUES ('限时销售!楠神手机尊享版', 1, '楠神手机');
INSERT INTO `recommend` VALUES ('全球限量版楠神手机探索版', 1, '楠神手机');
INSERT INTO `recommend` VALUES ('美滋滋电脑你值得拥有!', 1, '电脑');

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'user', '123456', '小王', NULL);
INSERT INTO `users` VALUES (2, '12345678900', '123456', '楠神', NULL);

SET FOREIGN_KEY_CHECKS = 1;
