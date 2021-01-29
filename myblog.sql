/*
 Navicat Premium Data Transfer

 Source Server         : MySql
 Source Server Type    : MySQL
 Source Server Version : 50517
 Source Host           : localhost:3306
 Source Schema         : myblog

 Target Server Type    : MySQL
 Target Server Version : 50517
 File Encoding         : 65001

 Date: 29/01/2021 16:34:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_blog
-- ----------------------------
DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog`  (
  `blog_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `post_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NULL DEFAULT NULL,
  `outline` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`blog_id`) USING BTREE,
  INDEX `fk_user_blog_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `fk_user_blog_user_id` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_blog
-- ----------------------------
INSERT INTO `t_blog` VALUES (13, '哎', '<p><strong>This is test</strong></p>\n<ul>\n<li>vue</li>\n<li>element</li>\n<li>webpack</li>\n</ul>\n', '2021-01-24 10:53:54', 5, '简介');
INSERT INTO `t_blog` VALUES (14, '1111', '<p><strong>This is test</strong></p>\n<ul>\n<li>vue</li>\n<li>element</li>\n<li>webpack</li>\n</ul>\n', '2021-01-24 10:55:06', 5, '简介');
INSERT INTO `t_blog` VALUES (16, '啊哈哈哈哈哈', '<p><em>规划开发公司开发</em></p>\n', '2021-01-24 12:20:51', 5, '简介');
INSERT INTO `t_blog` VALUES (17, '111', '11111111111111111111111111111111111111111111111111111111111111111111', '2021-01-24 20:02:38', 5, '简介');
INSERT INTO `t_blog` VALUES (19, '测试', '<p><strong>This is test</strong></p>\n<ul>\n<li>vue</li>\n<li>element</li>\n<li>webpack</li>\n</ul>\n', '2021-01-28 20:12:22', 5, '这个是手动输入的简介');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `comm_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `post_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `blog_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`comm_id`) USING BTREE,
  INDEX `fk_blog_comment_blog_id`(`blog_id`) USING BTREE,
  INDEX `fk_user_comment_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `fk_blog_comment_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `t_blog` (`blog_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_comment_user_id` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (2, '测试评论', '2021-01-28 21:24:14', 19, 5);
INSERT INTO `t_comment` VALUES (3, '测试评论2', '2021-01-28 21:55:43', 19, 5);
INSERT INTO `t_comment` VALUES (5, '哈哈哈', '2021-01-28 22:23:46', 19, 5);
INSERT INTO `t_comment` VALUES (8, '诶呀', '2021-01-29 15:02:39', 19, 5);

-- ----------------------------
-- Table structure for t_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_detail`;
CREATE TABLE `t_detail`  (
  `detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`detail_id`) USING BTREE,
  INDEX `fk_user_detail_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `fk_user_detail_user_id` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_detail
-- ----------------------------
INSERT INTO `t_detail` VALUES (1, 'hahahah', '123456', '地球', 2);
INSERT INTO `t_detail` VALUES (2, '我很好', '123456789', '地球村', 5);
INSERT INTO `t_detail` VALUES (3, NULL, '111', '1111', 5);
INSERT INTO `t_detail` VALUES (4, NULL, '111', '1111', 5);
INSERT INTO `t_detail` VALUES (5, '11111111111111111111111111111', '111', '111', 5);

-- ----------------------------
-- Table structure for t_res
-- ----------------------------
DROP TABLE IF EXISTS `t_res`;
CREATE TABLE `t_res`  (
  `res_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `post_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `comm_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`res_id`) USING BTREE,
  INDEX `fk_comment_res_comm_id`(`comm_id`) USING BTREE,
  CONSTRAINT `fk_comment_res_comm_id` FOREIGN KEY (`comm_id`) REFERENCES `t_comment` (`comm_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_res
-- ----------------------------
INSERT INTO `t_res` VALUES (1, '2222222', '2021-01-29 14:35:44', 2);
INSERT INTO `t_res` VALUES (2, '111111111111', '2021-01-29 14:37:30', 2);
INSERT INTO `t_res` VALUES (3, 'pinglun', '2021-01-29 15:20:00', 8);
INSERT INTO `t_res` VALUES (4, '回复啊', '2021-01-29 15:20:33', 8);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '昵称',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户名' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (2, 'wangwu', '王五', '123456', '2020-10-23 19:53:47');
INSERT INTO `t_user` VALUES (5, 'lisi', '李四', '123456', '2020-10-23 20:23:59');
INSERT INTO `t_user` VALUES (6, 'zhaoliu', '赵六', '123456', '2020-10-23 20:24:09');
INSERT INTO `t_user` VALUES (21, '111', '3333', '2222', '2021-01-18 16:25:37');
INSERT INTO `t_user` VALUES (22, 'aaa', 'cccc', 'bbb', '2021-01-18 16:32:55');
INSERT INTO `t_user` VALUES (23, 'aaa333', '3333', '333', '2021-01-18 16:38:51');
INSERT INTO `t_user` VALUES (24, 'aaa333666', '3333444', '4444', '2021-01-18 16:39:53');
INSERT INTO `t_user` VALUES (25, '89888', '777', '888', '2021-01-19 09:44:58');
INSERT INTO `t_user` VALUES (26, '9999', '999', '999', '2021-01-19 10:54:27');
INSERT INTO `t_user` VALUES (27, '5454545', '4545', '4545', '2021-01-19 11:15:04');
INSERT INTO `t_user` VALUES (28, 'xuhe', '', '', '2021-01-22 21:15:30');
INSERT INTO `t_user` VALUES (29, 'xuhe', '', '', '2021-01-22 21:19:54');

SET FOREIGN_KEY_CHECKS = 1;
