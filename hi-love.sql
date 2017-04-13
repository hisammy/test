/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : hi-love

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-04-14 00:49:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `hl_hobby`
-- ----------------------------
DROP TABLE IF EXISTS `hl_hobby`;
CREATE TABLE `hl_hobby` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '标签名称',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '保留字段',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hl_hobby
-- ----------------------------

-- ----------------------------
-- Table structure for `hl_session`
-- ----------------------------
DROP TABLE IF EXISTS `hl_session`;
CREATE TABLE `hl_session` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户UUID',
  `createdAt` timestamp NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` varchar(255) NOT NULL DEFAULT '' COMMENT '用户TOKEN',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hl_session
-- ----------------------------

-- ----------------------------
-- Table structure for `hl_tag`
-- ----------------------------
DROP TABLE IF EXISTS `hl_tag`;
CREATE TABLE `hl_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '标签名称',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '保留字段',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hl_tag
-- ----------------------------

-- ----------------------------
-- Table structure for `hl_user`
-- ----------------------------
DROP TABLE IF EXISTS `hl_user`;
CREATE TABLE `hl_user` (
  `uuid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户主键',
  `openid` varchar(255) NOT NULL DEFAULT '' COMMENT '微信openId',
  `avatar` varchar(255) DEFAULT '' COMMENT '用户头像地址url',
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '用户昵称',
  `birthday` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '出生年月',
  `age` tinyint(1) NOT NULL,
  `gender` enum('未知','男','女') NOT NULL DEFAULT '男' COMMENT '性别',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机',
  `height` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '身高kg',
  `weight` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '体重',
  `constellation` char(10) NOT NULL DEFAULT '' COMMENT '星座',
  `city` char(40) DEFAULT '' COMMENT '城市',
  `maritalStatus` varchar(255) DEFAULT '' COMMENT '婚姻状况',
  `homeNo` char(40) DEFAULT '' COMMENT '家中排行',
  `homeBg` char(40) DEFAULT '' COMMENT '家庭背景',
  `education` char(40) DEFAULT '' COMMENT '学历',
  `salary` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '年薪',
  `other` varchar(255) DEFAULT '' COMMENT '其他 有车,有房',
  `hobby` varchar(255) DEFAULT '' COMMENT '兴趣爱好 逗号分开',
  `movie` varchar(255) DEFAULT '' COMMENT '喜爱的电影',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '保留字段',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `oftenLocal` varchar(255) NOT NULL DEFAULT '' COMMENT '常去地',
  `about` text CHARACTER SET utf8mb4 COMMENT '自我介绍',
  `tag` varchar(255) NOT NULL DEFAULT '' COMMENT '标签',
  `isAuth` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否实名认证 0 否 1 是',
  PRIMARY KEY (`uuid`)
) ENGINE=MyISAM AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hl_user
-- ----------------------------
INSERT INTO `hl_user` VALUES ('1', '112', '123', '123', '2017-04-14 00:13:12', '0', '男', '13798211177', '160', '90', '', '深圳', '未婚', '12312', '3123', '123', '0', '123', '123', '123', '1', '2017-04-14 00:13:12', '123', '123', '123', '0');
INSERT INTO `hl_user` VALUES ('2', '2', '', '', '2017-04-14 00:13:28', '0', '男', '', '0', '0', '', '', '', '', '', '', '0', '', '', '', '1', '2017-04-14 00:13:28', '', null, '', '0');
INSERT INTO `hl_user` VALUES ('3', '3', '', '', '2017-04-14 00:13:28', '0', '男', '', '0', '0', '', '', '', '', '', '', '0', '', '', '', '1', '2017-04-14 00:13:28', '', null, '', '0');
INSERT INTO `hl_user` VALUES ('4', '4', '', '', '2017-04-14 00:13:29', '0', '男', '', '0', '0', '', '', '', '', '', '', '0', '', '', '', '1', '2017-04-14 00:13:29', '', null, '', '0');

-- ----------------------------
-- Table structure for `hl_user_image`
-- ----------------------------
DROP TABLE IF EXISTS `hl_user_image`;
CREATE TABLE `hl_user_image` (
  `userImageId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `imagesUrl` text NOT NULL COMMENT '用户相片url',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`userImageId`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hl_user_image
-- ----------------------------

-- ----------------------------
-- Table structure for `hl_user_like`
-- ----------------------------
DROP TABLE IF EXISTS `hl_user_like`;
CREATE TABLE `hl_user_like` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发起like uuid',
  `toUuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被like uuid',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '匹配时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0解除匹配 1单向like  2 双向like 匹配成功 3上次x 4约见中',
  `dislikeCount` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '不喜欢次数',
  PRIMARY KEY (`id`),
  KEY `INDEX_MINE` (`uuid`) USING BTREE,
  KEY `INDEX_THEM` (`toUuid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hl_user_like
-- ----------------------------
INSERT INTO `hl_user_like` VALUES ('1', '1', '2', '2017-03-29 23:16:10', '1', '0');
INSERT INTO `hl_user_like` VALUES ('2', '2', '1', '2017-04-14 00:15:25', '0', '0');
INSERT INTO `hl_user_like` VALUES ('3', '3', '1', '2017-04-14 00:11:51', '1', '0');

-- ----------------------------
-- Table structure for `hl_user_need`
-- ----------------------------
DROP TABLE IF EXISTS `hl_user_need`;
CREATE TABLE `hl_user_need` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `age` char(40) NOT NULL,
  `height` char(40) NOT NULL DEFAULT '0' COMMENT '身高kg',
  `weight` char(40) NOT NULL DEFAULT '0' COMMENT '体重',
  `city` char(20) DEFAULT '' COMMENT '城市',
  `maritalStatus` char(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hl_user_need
-- ----------------------------
