/*
Navicat MySQL Data Transfer

Source Server         : student
Source Server Version : 60011
Source Host           : localhost:3306
Source Database       : buy_data

Target Server Type    : MYSQL
Target Server Version : 60011
File Encoding         : 65001

Date: 2018-10-17 17:34:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admins`
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(10) DEFAULT NULL,
  `pass` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'admin', '123456');

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `price` float(20,0) DEFAULT NULL,
  `remake` text,
  `image` char(100) DEFAULT NULL,
  `sum` int(50) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `click` int(20) DEFAULT NULL,
  `product_type_id` tinyint(20) DEFAULT NULL,
  `prices` float(50,0) DEFAULT NULL,
  `display` bit(1) NOT NULL,
  `user_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `p_type` (`product_type_id`) USING BTREE,
  KEY `user_id` (`user_id`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', '楠神旗舰电脑', null, null, null, null, '2018-10-02', '1', '2', null, '', '1');
INSERT INTO `products` VALUES ('2', '楠神的商品', null, null, null, null, '2018-10-17', '5', '1', null, '', '1');
INSERT INTO `products` VALUES ('3', '楠神手机', null, null, null, null, '2018-06-06', '99', '1', null, '', '1');
INSERT INTO `products` VALUES ('4', '海飞丝', '50', '要毕业了用不完，还有400多毫升', null, '5', '2018-10-09', '40', '23', '100', '', '2');

-- ----------------------------
-- Table structure for `product_comment`
-- ----------------------------
DROP TABLE IF EXISTS `product_comment`;
CREATE TABLE `product_comment` (
  `comment` text,
  `user_id` int(20) DEFAULT NULL,
  `product_id` int(20) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `y` int(20) DEFAULT NULL,
  `n` int(20) DEFAULT NULL,
  `praise` bit(1) DEFAULT NULL,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE,
  CONSTRAINT `product_comment_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_comment
-- ----------------------------
INSERT INTO `product_comment` VALUES ('这个手机很赞！', '2', '1', '2018-10-16', null, null, '');

-- ----------------------------
-- Table structure for `product_type`
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `t_type` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product_type
-- ----------------------------
INSERT INTO `product_type` VALUES ('6', 'U盘');
INSERT INTO `product_type` VALUES ('4', '书籍');
INSERT INTO `product_type` VALUES ('8', '彩妆');
INSERT INTO `product_type` VALUES ('1', '智能手机');
INSERT INTO `product_type` VALUES ('5', '服装');
INSERT INTO `product_type` VALUES ('23', '生活用品');
INSERT INTO `product_type` VALUES ('3', '相机');
INSERT INTO `product_type` VALUES ('2', '笔记本电脑');
INSERT INTO `product_type` VALUES ('7', '背包');

-- ----------------------------
-- Table structure for `recommend`
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend` (
  `commend` text,
  `admin_id` int(20) DEFAULT NULL,
  `value` char(200) DEFAULT NULL,
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `recommend_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recommend
-- ----------------------------
INSERT INTO `recommend` VALUES ('你对楠神手机的看法？', '1', '楠神手机');
INSERT INTO `recommend` VALUES ('限时销售!楠神手机尊享版', '1', '楠神手机');
INSERT INTO `recommend` VALUES ('全球限量版楠神手机探索版', '1', '楠神手机');
INSERT INTO `recommend` VALUES ('美滋滋电脑你值得拥有!', '1', '电脑');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user` char(30) NOT NULL,
  `pass` char(30) NOT NULL,
  `name` char(30) DEFAULT NULL,
  `header` char(200) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'user', '123456', '小王', null);
INSERT INTO `users` VALUES ('2', '12345678900', '123456', '楠神', null);
