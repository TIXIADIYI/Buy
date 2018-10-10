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

 Date: 10/10/2018 11:32:20
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
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type`  (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_type`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `click` int(20) NOT NULL,
  `type` tinyint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `p_type`(`type`) USING BTREE,
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`type`) REFERENCES `product_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (16, '布丁热奶', 9, '中世纪的修道院，则把“水果和燕麦粥的混合物”称为“布丁”。这种布丁的正式出现，是在16世纪伊丽莎白一世时代，它与肉汁、果汁、水果干及面粉一起调配制造。', '/N', 999, '2018-07-09', 0, 10);
INSERT INTO `products` VALUES (17, '草莓之恋芝士蛋糕', 15, '每公斤芝士制品都是由10公斤的牛奶浓缩而成，含有丰富的蛋白质、钙、脂肪、磷和维生素等营养成分，是纯天然的食品。就工艺而言，芝士是发酵的牛奶；就营养而言，芝士是浓缩的牛奶。', '/Nan/upload/image/20180709/20180709105144_654.jpg', 754, '2018-07-09', 0, 10);
INSERT INTO `products` VALUES (18, '美味芒果奶昔', 20, '奶昔是牛奶、水果、冰块的混合物。奶昔（Milk shake）最先出现于美国，主要有“机制奶昔”和“手摇奶昔”两种。', '/Nan/upload/image/20180709/20180709105214_656.jpg', 583, '2018-07-09', 0, 10);
INSERT INTO `products` VALUES (19, '烧仙草', 5, '烧仙草是福建闽南地区及台湾地区的传统特色饮品，其中在国内正宗的古早做法有用草直接烧煮的，而其他有用仙草粉，仙草液制作。烧仙草除了流行福建台湾之外，并风靡于日本和东南亚地区。', '/Nan/upload/image/20180709/20180709105225_980.jpg', 999, '2018-07-09', 0, 10);
INSERT INTO `products` VALUES (20, '香醇咖啡', 50, '午后一杯，品味香醇', '/Nan/upload/image/20180709/20180709105235_789.jpg', 89, '2018-07-09', 0, 10);
INSERT INTO `products` VALUES (21, '蛋花炒面', 10, '炒面是流行于大江南北的中国传统小吃，制作原料主要有面条、鸡蛋、肉丝、小油菜、葱段等，口味鲜美，营养丰富。', '/Nan/upload/image/20180709/20180709105756_158.jpg', 999, '2018-07-09', 0, 11);
INSERT INTO `products` VALUES (22, '炸龙虾虾米', 5, '美味肯德基原味。油炸带来不一样的快乐！', '/Nan/upload/image/20180709/20180709105313_717.jpg', 999, '2018-07-09', 0, 11);
INSERT INTO `products` VALUES (23, '美味炸鸡', 20, '炸鸡，很多快餐店的招牌食品之一。金黄香脆的外皮，鲜嫩多汁的鸡肉，还有香辣咸麻的味道，掀起了一股男女老幼吃炸鸡的热浪。吃一份原味炸鸡几乎相当于摄取了人体一天所需的饱和脂肪。', '/Nan/upload/image/20180709/20180709105324_588.jpg', 999, '2018-07-09', 0, 11);
INSERT INTO `products` VALUES (24, '烤肉饭', 15, '烤肉饭是一道由土豆，烤肉、青豆等食材制成的美食。等电饭锅跳转至保温状态时继续保温状态5分钟左右即可。', '/Nan/upload/image/20180709/20180709105344_879.jpg', 999, '2018-07-09', 0, 11);
INSERT INTO `products` VALUES (25, '酸皮豆腐块', 15, '楠柳商城自创招牌！', '/Nan/upload/image/20180709/20180709105359_987.jpg', 999, '2018-07-09', 0, 11);
INSERT INTO `products` VALUES (26, '烤牛肉', 55, '独具风味，历史悠久，有浓郁的香味和鲜美的味道，可大大提高食欲。', '/Nan/upload/image/20180709/20180709105529_979.jpg', 999, '2018-07-09', 0, 12);
INSERT INTO `products` VALUES (27, '烤龙虾', 99, '值得一提的是，现代烤肉与刀耕火种时的烤肉并不相同。据《汉代画象全集》可知，早在两汉时期就有体系完备的烤肉烤食讲究 ', '/Nan/upload/image/20180709/20180709105431_764.jpg', 999, '2018-07-09', 0, 12);
INSERT INTO `products` VALUES (28, '烤鸡翅', 30, '经过不断改进和发展，烤肉技术日臻完美。', '/Nan/upload/image/20180709/20180709105442_808.jpg', 999, '2018-07-09', 0, 12);
INSERT INTO `products` VALUES (29, '烤豆腐皮', 5, '火炙最宜生嗜嫩，雪天争得醉烧刀。', '/Nan/upload/image/20180709/20180709105452_255.jpg', 9999, '2018-07-09', 0, 12);
INSERT INTO `products` VALUES (30, '烤鱿鱼', 999, '肉类经烹调后，可制成多种多样的美味佳肴，又有浓郁的香味和鲜美的味道，可大大提高食欲。', '/Nan/upload/image/20180709/20180709105418_148.jpg', 9999, '2018-07-09', 0, 12);
INSERT INTO `products` VALUES (31, '金桔柠檬', 1, '柠檬因其味极酸，肝虚孕妇最喜食，故称益母果或益母子。柠檬中含有丰富的柠檬酸，因此被誉为“柠檬酸仓库”。它的果实汁多肉脆，有浓郁的芳香气。因为味道特酸，故只能作为上等调味料，用来调制饮料菜肴、化妆品和药品。', '/Nan/upload/image/20180709/20180709105539_393.jpg', 999, '2018-07-09', 0, 13);
INSERT INTO `products` VALUES (32, '亮丽草莓', 5, '含有多种营养物质 ，且有保健功效', '/Nan/upload/image/20180709/20180709105550_333.jpg', 999, '2018-07-09', 0, 13);
INSERT INTO `products` VALUES (33, '透红苹果', 99, '苹果中营养成分可溶性大，易被人体吸收，故有“活水”之称。其有利于溶解硫元素，使皮肤润滑柔嫩  。据说“每天一苹果，医生远离我”。', '/Nan/upload/image/20180709/20180709105715_137.jpg', 999, '2018-07-09', 0, 13);
INSERT INTO `products` VALUES (34, '太阳伞西蓝花', 1, '在各种各样的蔬菜中，哪种营养价值最高？你可能觉得很难比较。 西蓝花 西蓝花(4张)  不过，日本最近一项研究得出结论：西蓝花的平均营养价值及防病作用远远超出其他蔬菜，名列第一。', '/Nan/upload/image/20180709/20180709105704_718.jpg', 999, '2018-07-09', 0, 13);
INSERT INTO `products` VALUES (35, '双生甜椒', 50, '甜椒是非常适合生吃的蔬菜，含丰富维他命C和B及胡萝卜素为强抗氧化剂，可抗白内障、心脏病和癌症。越红的甜椒营养越多，所含的维他命C远胜于其他柑橘类水果，所以较适合生吃。', '/Nan/upload/image/20180709/20180709105654_862.jpg', 999, '2018-07-09', 0, 13);
INSERT INTO `products` VALUES (36, '海鲜火锅大盛宴', 999, '海鲜（Seafood）又称海产食物，是指利用海洋动物作成的料理，包括了鱼类、虾类、贝类这些等等。虽然海带这类海洋生物也常是被料理成食物，但是海鲜主要还是针对动物制成的料理为主。', '/Nan/upload/image/20180709/20180709105644_458.jpg', 999, '2018-07-09', 0, 14);
INSERT INTO `products` VALUES (37, '相爱相杀鸳鸯锅', 99, '鸳鸯锅作为火锅锅底的 一种，因其可使人享受不同的口味而备受顾客喜爱。它可以满足不同口味人的需要，解决了众口难调的问题。', '/Nan/upload/image/20180709/20180709105635_815.jpg', 999, '2018-07-09', 0, 14);
INSERT INTO `products` VALUES (38, '爆辣龙虾火锅', 666, '辣火锅，起源于重庆市江北区江北嘴一带。当时挑担子工人买来水牛的内脏，洗净干净后，将肝、肚切成小块，担头设有炉具，上设一只大洋铁盆，成为多格，盛载一种麻、辣、咸的卤汁，专向码头工人兜售。', '/Nan/upload/image/20180709/20180709105626_571.jpg', 999, '2018-07-09', 0, 14);
INSERT INTO `products` VALUES (39, '佛系火锅', 1, '简单又快乐的火锅！', '/Nan/upload/image/20180709/20180709105615_277.jpg', 1, '2018-07-09', 0, 14);
INSERT INTO `products` VALUES (40, '不知名的小火锅', 5, '', '/Nan/upload/image/20180709/20180709105603_707.jpg', 99, '2018-07-09', 0, 14);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pass` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `header` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'user', '123456', '小王', NULL);

SET FOREIGN_KEY_CHECKS = 1;
