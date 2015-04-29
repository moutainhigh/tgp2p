/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.0.106
 Source Server Type    : MySQL
 Source Server Version : 50621
 Source Host           : 192.168.0.106
 Source Database       : p2p

 Target Server Type    : MySQL
 Target Server Version : 50621
 File Encoding         : utf-8

 Date: 12/01/2014 22:45:50 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `outline`
-- ----------------------------
DROP TABLE IF EXISTS `outline`;
CREATE TABLE `outline` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `imgUrl` varchar(100) DEFAULT NULL,
  `isShow` int(11) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `content` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
