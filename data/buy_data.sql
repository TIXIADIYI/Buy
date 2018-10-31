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

 Date: 31/10/2018 11:55:43
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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES (1, 'admin', '123456');
INSERT INTO `admins` VALUES (2, 'admin2', '123');
INSERT INTO `admins` VALUES (3, 'nan', '123');
INSERT INTO `admins` VALUES (4, 'nan2', '123');

-- ----------------------------
-- Table structure for product_comment
-- ----------------------------
DROP TABLE IF EXISTS `product_comment`;
CREATE TABLE `product_comment`  (
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `user_id` int(20) NULL DEFAULT NULL,
  `product_id` int(20) NULL DEFAULT NULL,
  `time` date NULL DEFAULT NULL,
  `praise` bit(1) NULL DEFAULT NULL,
  `id` int(100) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  CONSTRAINT `product_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_comment_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_comment
-- ----------------------------
INSERT INTO `product_comment` VALUES ('这个手机很赞！', 2, 1, '2018-10-16', b'0', 1);
INSERT INTO `product_comment` VALUES ('辣鸡玩意', 1, 6, '2018-10-25', b'1', 2);
INSERT INTO `product_comment` VALUES ('安全啊啊啊啊啊', 2, 4, '2018-10-11', b'1', 3);
INSERT INTO `product_comment` VALUES ('坎坎坷坷', 1, 12, '2018-10-30', b'1', 4);
INSERT INTO `product_comment` VALUES ('å°æ¶è¯µè¯ä¹¦ææææææææ', NULL, 10, '2018-10-30', b'1', 5);
INSERT INTO `product_comment` VALUES ('哦哦哦', 2, 1, '2018-10-11', b'0', 6);
INSERT INTO `product_comment` VALUES ('呀呀呀呀呀呀晕晕晕晕晕晕晕晕晕晕晕', 2, 1, '2018-10-03', b'1', 7);
INSERT INTO `product_comment` VALUES ('噢噢噢噢哦哦哦哦哦哦哦哦哦哦哦哦', 3, 1, '2018-10-04', b'0', 8);
INSERT INTO `product_comment` VALUES ('啦啦啦啦啦啦啦啦绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿', NULL, 10, '2018-10-30', b'1', 9);
INSERT INTO `product_comment` VALUES ('55555', NULL, 1, '2018-10-30', b'1', 10);
INSERT INTO `product_comment` VALUES ('999999999', NULL, 1, '2018-10-30', b'0', 11);
INSERT INTO `product_comment` VALUES ('那你那你女', NULL, 6, '2018-10-30', b'1', 12);
INSERT INTO `product_comment` VALUES ('123', 1, 11, '2018-10-30', b'1', 13);
INSERT INTO `product_comment` VALUES ('好极了', 1, 12, '2018-10-30', b'1', 14);

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type`  (
  `id` tinyint(20) NOT NULL AUTO_INCREMENT,
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
  `phone` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
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
  `weixin` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `p_type`(`product_type_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (NULL, NULL, 1, '楠神旗舰电脑', 0, NULL, NULL, NULL, '2018-10-02', 12, 2, 0, b'1', 1, NULL);
INSERT INTO `products` VALUES (NULL, NULL, 2, '楠神的商品', NULL, NULL, '1111111', NULL, '2018-10-17', 5, 1, NULL, b'1', 1, NULL);
INSERT INTO `products` VALUES (NULL, NULL, 3, '楠神手机', 0, NULL, 'img/shop02.png', NULL, '2018-06-06', 101, 1, 0, b'1', 1, NULL);
INSERT INTO `products` VALUES (NULL, NULL, 4, '海飞丝', 50, '要毕业了用不完，还有400多毫升', NULL, 5, '2018-10-09', 40, 23, 100, b'1', 2, NULL);
INSERT INTO `products` VALUES (NULL, NULL, 5, '测试专用商品', 99, '测试专用哦', NULL, 999, '2018-10-31', 55, 5, 999, b'1', 2, NULL);
INSERT INTO `products` VALUES (NULL, NULL, 6, '测试专用商品2', 88, NULL, NULL, NULL, '2018-10-30', 5, 6, NULL, b'1', NULL, NULL);
INSERT INTO `products` VALUES (NULL, NULL, 7, '测试专用商品3', 77, NULL, NULL, NULL, NULL, 66, 7, NULL, b'1', NULL, NULL);
INSERT INTO `products` VALUES (NULL, NULL, 8, '测试专用商品4', NULL, NULL, NULL, NULL, NULL, 7, 8, NULL, b'0', NULL, NULL);
INSERT INTO `products` VALUES (NULL, NULL, 9, '测试专用商品5', 66, NULL, NULL, NULL, NULL, 3, 23, 1, b'1', NULL, NULL);
INSERT INTO `products` VALUES ('123', '123', 10, '哈哈哈', 123, '123', '', 213, NULL, 123, 1, 123, b'1', 2, '123');
INSERT INTO `products` VALUES ('123', '1234567890', 11, '哈哈哈', 500, '牛逼哄哄吊炸天', '', 500, '2018-10-11', 124, 4, 123, b'1', 1, '123');
INSERT INTO `products` VALUES ('123', '1234567890', 12, 'hhh', 500, '', '', 500, '2018-10-13', 126, 8, 123, b'1', 2, '123');
INSERT INTO `products` VALUES (NULL, '55', 13, '好吃的呀呀呀呀呀呀', 500, '废话', '/Buy/upload/image/20180707/20180707003628_837.jpg', NULL, '2018-10-30', 2, 23, 0, b'1', 1, '55');

-- ----------------------------
-- Table structure for recommend
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend`  (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `commend` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `admin_id` int(20) NULL DEFAULT NULL,
  `value` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE,
  CONSTRAINT `recommend_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recommend
-- ----------------------------
INSERT INTO `recommend` VALUES (1, '你对楠神手机的看法？', 1, '楠神手机');
INSERT INTO `recommend` VALUES (2, '限时销售!楠神手机尊享版', 1, '楠神手机');
INSERT INTO `recommend` VALUES (3, '全球限量版楠神手机探索版', 1, '楠神手机');
INSERT INTO `recommend` VALUES (4, '美滋滋电脑你值得拥有!', 1, '电脑');

-- ----------------------------
-- Table structure for user_collection
-- ----------------------------
DROP TABLE IF EXISTS `user_collection`;
CREATE TABLE `user_collection`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(50) NULL DEFAULT NULL,
  `product_id` int(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  CONSTRAINT `user_collection_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_collection_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_collection
-- ----------------------------
INSERT INTO `user_collection` VALUES (1, 1, 1);
INSERT INTO `user_collection` VALUES (3, 2, 11);
INSERT INTO `user_collection` VALUES (4, 1, 11);
INSERT INTO `user_collection` VALUES (5, 1, 10);
INSERT INTO `user_collection` VALUES (8, 1, 12);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `user` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pass` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `header` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remake` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` bit(1) NULL DEFAULT b'1',
  `address` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'user', '123456', '小煞笔', '/Buy/upload/image/20180707/20180707003628_837.jpg', '123', b'0', '', '2018-10-03');
INSERT INTO `users` VALUES (2, '12345678900', '123456', '楠神', '', '牛逼哄哄吊炸天', b'1', '', NULL);
INSERT INTO `users` VALUES (3, '111', '123', 'you盘2', '', '牛逼哄哄吊炸天', b'0', '', '2018-10-16');

SET FOREIGN_KEY_CHECKS = 1;
