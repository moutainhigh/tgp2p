/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : tgp2p

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2015-02-27 14:52:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `accountinfo`
-- ----------------------------
DROP TABLE IF EXISTS `accountinfo`;
CREATE TABLE `accountinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `expenditure` decimal(18,4) DEFAULT NULL COMMENT '支出',
  `explan` varchar(80) DEFAULT NULL COMMENT '说明',
  `income` decimal(18,4) DEFAULT NULL COMMENT '收入',
  `loansign_id` bigint(20) DEFAULT NULL COMMENT '借款标编号',
  `money` decimal(18,4) NOT NULL COMMENT '余额',
  `time` varchar(30) DEFAULT NULL COMMENT '操作时间',
  `withdraw` varchar(30) DEFAULT NULL COMMENT '提现编号',
  `accounttype_id` bigint(20) NOT NULL COMMENT '类型',
  `userbasic_id` bigint(20) NOT NULL COMMENT '用户',
  `ipsNumber` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `FK33AA105BC6D3AF90` (`accounttype_id`) USING BTREE,
  KEY `FK33AA105BF9F79EDF` (`userbasic_id`) USING BTREE,
  CONSTRAINT `accountinfo_ibfk_1` FOREIGN KEY (`accounttype_id`) REFERENCES `accounttype` (`id`),
  CONSTRAINT `accountinfo_ibfk_2` FOREIGN KEY (`userbasic_id`) REFERENCES `userbasicsinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8 COMMENT='用户资金流水信息表; InnoDB free: 8192 kB; (`account; InnoDB free: 8192 kB; (`accounttype_';

-- ----------------------------
-- Records of accountinfo
-- ----------------------------
INSERT INTO `accountinfo` VALUES ('33', '0.0000', '在线充值', '100.0000', null, '0.0000', '2015-01-23 18:48:42', null, '8', '14', 'CZ20150123064743173296');
INSERT INTO `accountinfo` VALUES ('34', '100.0000', '投标', '0.0000', '8', '0.0000', '2015-01-23 19:00:46', null, '3', '14', null);
INSERT INTO `accountinfo` VALUES ('35', '0.0000', '满标放款', '100.0000', '8', '200.0000', '2015-01-23 07:01:14', null, '20', '13', null);
INSERT INTO `accountinfo` VALUES ('36', '100.0000', '借款人本金', '0.0000', '8', '99.5000', '2015-01-23 19:04:46', null, '3', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('37', '1.0000', '借款人利息', '0.0000', '8', '98.5000', '2015-01-23 19:04:46', null, '4', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('38', '0.5000', '借款人管理费', '0.0000', '8', '98.5000', '2015-01-23 19:04:46', null, '2', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('39', '0.0000', '投资人本金', '100.0000', '8', '-0.9000', '2015-01-23 19:04:46', null, '6', '14', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('40', '0.0000', '投资人利息', '1.0000', '8', '0.1000', '2015-01-23 19:04:46', null, '7', '14', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('41', '0.1000', '投资人管理费', '0.0000', '8', '0.0000', '2015-01-23 19:04:46', null, '5', '14', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('42', '100.0000', '投标', '0.0000', '9', '0.9000', '2015-01-26 11:55:44', null, '3', '14', null);
INSERT INTO `accountinfo` VALUES ('43', '0.0000', '满标放款', '100.0000', '9', '98.5000', '2015-01-26 11:57:53', null, '20', '13', null);
INSERT INTO `accountinfo` VALUES ('44', '100.0000', '借款人本金', '0.0000', '9', '98.0000', '2015-01-26 12:00:06', null, '3', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('45', '1.0000', '借款人利息', '0.0000', '9', '97.0000', '2015-01-26 12:00:06', null, '4', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('46', '0.5000', '借款人管理费', '0.0000', '9', '97.0000', '2015-01-26 12:00:06', null, '2', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('47', '0.0000', '投资人本金', '100.0000', '9', '0.0000', '2015-01-26 12:00:07', null, '6', '14', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('48', '0.0000', '投资人利息', '1.0000', '9', '1.0000', '2015-01-26 12:00:07', null, '7', '14', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('49', '0.1000', '投资人管理费', '0.0000', '9', '0.9000', '2015-01-26 12:00:07', null, '5', '14', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('50', '50.0000', '提现', '0.0000', null, '47.0000', '2015-01-27 13:50:49', null, '9', '13', '3_TX20150127014854185588');
INSERT INTO `accountinfo` VALUES ('51', '50.0000', '投标', '0.0000', '10', '51.8000', '2015-01-27 14:21:29', null, '3', '14', null);
INSERT INTO `accountinfo` VALUES ('52', '50.0000', '投标', '0.0000', '10', '1.8000', '2015-01-27 14:22:51', null, '3', '14', null);
INSERT INTO `accountinfo` VALUES ('53', '0.0000', '满标放款', '100.0000', '10', '47.0000', '2015-01-27 02:25:47', null, '20', '13', null);
INSERT INTO `accountinfo` VALUES ('54', '10.0000', '提现', '0.0000', null, '135.0000', '2015-01-27 16:01:01', null, '9', '13', '4_TX20150127040038385735');
INSERT INTO `accountinfo` VALUES ('55', '100.0000', '借款人本金', '0.0000', '10', '34.5000', '2015-01-28 10:49:22', null, '3', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('56', '1.0000', '借款人利息', '0.0000', '10', '33.5000', '2015-01-28 10:49:22', null, '4', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('57', '0.5000', '借款人管理费', '0.0000', '10', '33.5000', '2015-01-28 10:49:22', null, '2', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('58', '0.0000', '投资人本金', '100.0000', '10', '0.9000', '2015-01-28 10:49:23', null, '6', '14', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('59', '0.0000', '投资人利息', '1.0000', '10', '1.9000', '2015-01-28 10:49:23', null, '7', '14', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('60', '0.1000', '投资人管理费', '0.0000', '10', '1.8000', '2015-01-28 10:49:23', null, '5', '14', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('61', '50.0000', '投标', '0.0000', '11', '52.7000', '2015-01-28 11:04:49', null, '3', '14', null);
INSERT INTO `accountinfo` VALUES ('62', '0.0000', '在线充值', '100.0000', null, '0.0000', '2015-01-28 15:02:29', null, '8', '26', 'CZ20150128025843578354');
INSERT INTO `accountinfo` VALUES ('63', '0.0000', '在线充值', '500.0000', null, '0.0000', '2015-01-28 15:16:54', null, '8', '13', 'CZ20150128030916846431');
INSERT INTO `accountinfo` VALUES ('64', '100.0000', '投标', '0.0000', '12', '433.5000', '2015-01-28 15:29:18', null, '3', '13', null);
INSERT INTO `accountinfo` VALUES ('65', '0.0000', '满标放款', '100.0000', '12', '0.0000', '2015-01-28 03:34:32', null, '20', '16', null);
INSERT INTO `accountinfo` VALUES ('66', '100.0000', '投标', '0.0000', '13', '333.5000', '2015-01-28 15:42:17', null, '3', '13', null);
INSERT INTO `accountinfo` VALUES ('67', '0.0000', '满标放款', '100.0000', '13', '0.0000', '2015-01-28 03:42:35', null, '20', '22', null);
INSERT INTO `accountinfo` VALUES ('68', '100.0000', '投标', '0.0000', '14', '233.5000', '2015-01-28 15:43:56', null, '3', '13', null);
INSERT INTO `accountinfo` VALUES ('69', '0.0000', '满标放款', '100.0000', '14', '100.0000', '2015-01-28 03:45:56', null, '20', '23', null);
INSERT INTO `accountinfo` VALUES ('70', '100.0000', '投标', '0.0000', '15', '133.5000', '2015-01-28 15:50:42', null, '3', '13', null);
INSERT INTO `accountinfo` VALUES ('71', '0.0000', '满标放款', '100.0000', '15', '0.0000', '2015-01-28 03:52:36', null, '20', '24', null);
INSERT INTO `accountinfo` VALUES ('72', '100.0000', '投标', '0.0000', '16', '33.5000', '2015-01-28 15:55:47', null, '3', '13', null);
INSERT INTO `accountinfo` VALUES ('73', '0.0000', '满标放款', '100.0000', '16', '200.0000', '2015-01-28 03:57:52', null, '20', '26', null);
INSERT INTO `accountinfo` VALUES ('74', '100.0000', '投标', '0.0000', '19', '0.0000', '2015-01-28 16:18:24', null, '3', '16', null);
INSERT INTO `accountinfo` VALUES ('75', '50.0000', '投标', '0.0000', '18', '50.0000', '2015-01-28 16:22:20', null, '3', '22', null);
INSERT INTO `accountinfo` VALUES ('76', '50.0000', '投标', '0.0000', '18', '50.0000', '2015-01-28 16:22:25', null, '3', '24', null);
INSERT INTO `accountinfo` VALUES ('77', '50.0000', '投标', '0.0000', '18', '150.0000', '2015-01-28 16:23:19', null, '3', '26', null);
INSERT INTO `accountinfo` VALUES ('78', '50.0000', '投标', '0.0000', '17', '0.0000', '2015-01-28 16:25:14', null, '3', '22', null);
INSERT INTO `accountinfo` VALUES ('79', '50.0000', '投标', '0.0000', '17', '0.0000', '2015-01-28 16:25:34', null, '3', '24', null);
INSERT INTO `accountinfo` VALUES ('80', '50.0000', '投标', '0.0000', '17', '50.0000', '2015-01-28 16:26:02', null, '3', '23', null);
INSERT INTO `accountinfo` VALUES ('81', '50.0000', '投标', '0.0000', '17', '100.0000', '2015-01-28 16:26:24', null, '3', '26', null);
INSERT INTO `accountinfo` VALUES ('82', '0.0000', '满标放款', '100.0000', '19', '33.5000', '2015-01-28 04:32:46', null, '20', '13', null);
INSERT INTO `accountinfo` VALUES ('83', '100.0000', '借款人本金', '0.0000', '19', '33.0000', '2015-01-28 16:33:46', null, '3', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('84', '1.0000', '借款人利息', '0.0000', '19', '32.0000', '2015-01-28 16:33:46', null, '4', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('85', '0.5000', '借款人管理费', '0.0000', '19', '32.0000', '2015-01-28 16:33:46', null, '2', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('86', '0.0000', '投资人本金', '100.0000', '19', '-0.9000', '2015-01-28 16:33:48', null, '6', '16', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('87', '0.0000', '投资人利息', '1.0000', '19', '0.1000', '2015-01-28 16:33:48', null, '7', '16', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('88', '0.1000', '投资人管理费', '0.0000', '19', '0.0000', '2015-01-28 16:33:48', null, '5', '16', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('89', '0.0000', '满标放款', '200.0000', '17', '32.0000', '2015-01-28 05:02:50', null, '20', '13', null);
INSERT INTO `accountinfo` VALUES ('90', '200.0000', '借款人本金', '0.0000', '17', '31.0000', '2015-01-28 17:05:49', null, '3', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('91', '2.0000', '借款人利息', '0.0000', '17', '29.0000', '2015-01-28 17:05:49', null, '4', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('92', '1.0000', '借款人管理费', '0.0000', '17', '29.0000', '2015-01-28 17:05:49', null, '2', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('93', '0.0000', '投资人本金', '50.0000', '17', '50.0000', '2015-01-28 17:05:50', null, '6', '22', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('94', '0.0000', '投资人利息', '0.5000', '17', '50.5000', '2015-01-28 17:05:50', null, '7', '22', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('95', '0.0500', '投资人管理费', '0.0000', '17', '50.4500', '2015-01-28 17:05:50', null, '5', '22', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('96', '0.0000', '投资人本金', '50.0000', '17', '100.0000', '2015-01-28 17:05:51', null, '6', '23', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('97', '0.0000', '投资人利息', '0.5000', '17', '100.5000', '2015-01-28 17:05:51', null, '7', '23', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('98', '0.0500', '投资人管理费', '0.0000', '17', '100.4500', '2015-01-28 17:05:51', null, '5', '23', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('99', '0.0000', '投资人本金', '50.0000', '17', '50.0000', '2015-01-28 17:05:51', null, '6', '24', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('100', '0.0000', '投资人利息', '0.5000', '17', '50.5000', '2015-01-28 17:05:51', null, '7', '24', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('101', '0.0500', '投资人管理费', '0.0000', '17', '50.4500', '2015-01-28 17:05:51', null, '5', '24', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('102', '0.0000', '投资人本金', '50.0000', '17', '150.0000', '2015-01-28 17:05:52', null, '6', '26', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('103', '0.0000', '投资人利息', '0.5000', '17', '150.5000', '2015-01-28 17:05:52', null, '7', '26', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('104', '0.0500', '投资人管理费', '0.0000', '17', '150.4500', '2015-01-28 17:05:52', null, '5', '26', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('105', '50.0000', '投标', '0.0000', '11', '2.7000', '2015-01-29 09:41:37', null, '3', '14', null);
INSERT INTO `accountinfo` VALUES ('106', '0.0000', '满标放款', '100.0000', '11', '29.0000', '2015-01-29 09:41:52', null, '20', '13', null);
INSERT INTO `accountinfo` VALUES ('107', '100.0000', '借款人本金', '0.0000', '11', '28.5000', '2015-01-29 09:42:44', null, '3', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('108', '1.0000', '借款人利息', '0.0000', '11', '27.5000', '2015-01-29 09:42:44', null, '4', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('109', '0.5000', '借款人管理费', '0.0000', '11', '27.5000', '2015-01-29 09:42:44', null, '2', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('110', '0.0000', '投资人本金', '100.0000', '11', '1.8000', '2015-01-29 09:42:44', null, '6', '14', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('111', '0.0000', '投资人利息', '1.0000', '11', '2.8000', '2015-01-29 09:42:44', null, '7', '14', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('112', '0.1000', '投资人管理费', '0.0000', '11', '2.7000', '2015-01-29 09:42:44', null, '5', '14', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('113', '50.0000', '投标', '0.0000', '18', '53.6000', '2015-01-29 09:46:37', null, '3', '14', null);
INSERT INTO `accountinfo` VALUES ('114', '0.0000', '满标放款', '200.0000', '18', '27.5000', '2015-01-29 09:46:56', null, '20', '13', null);
INSERT INTO `accountinfo` VALUES ('115', '200.0000', '借款人本金', '0.0000', '18', '26.5000', '2015-01-29 09:47:13', null, '3', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('116', '2.0000', '借款人利息', '0.0000', '18', '24.5000', '2015-01-29 09:47:13', null, '4', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('117', '1.0000', '借款人管理费', '0.0000', '18', '24.5000', '2015-01-29 09:47:13', null, '2', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('118', '0.0000', '投资人本金', '50.0000', '18', '53.1500', '2015-01-29 09:47:14', null, '6', '14', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('119', '0.0000', '投资人利息', '0.5000', '18', '53.6500', '2015-01-29 09:47:14', null, '7', '14', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('120', '0.0500', '投资人管理费', '0.0000', '18', '53.6000', '2015-01-29 09:47:14', null, '5', '14', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('121', '0.0000', '投资人本金', '50.0000', '18', '50.0000', '2015-01-29 09:47:15', null, '6', '22', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('122', '0.0000', '投资人利息', '0.5000', '18', '50.5000', '2015-01-29 09:47:15', null, '7', '22', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('123', '0.0500', '投资人管理费', '0.0000', '18', '50.4500', '2015-01-29 09:47:15', null, '5', '22', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('124', '0.0000', '投资人本金', '50.0000', '18', '50.0000', '2015-01-29 09:47:15', null, '6', '24', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('125', '0.0000', '投资人利息', '0.5000', '18', '50.5000', '2015-01-29 09:47:15', null, '7', '24', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('126', '0.0500', '投资人管理费', '0.0000', '18', '50.4500', '2015-01-29 09:47:15', null, '5', '24', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('127', '0.0000', '投资人本金', '50.0000', '18', '150.0000', '2015-01-29 09:47:16', null, '6', '26', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('128', '0.0000', '投资人利息', '0.5000', '18', '150.5000', '2015-01-29 09:47:16', null, '7', '26', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('129', '0.0500', '投资人管理费', '0.0000', '18', '150.4500', '2015-01-29 09:47:16', null, '5', '26', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('130', '50.0000', '投标', '0.0000', '20', '54.0500', '2015-01-29 09:48:48', null, '3', '14', null);
INSERT INTO `accountinfo` VALUES ('131', '50.0000', '投标', '0.0000', '21', '50.9000', '2015-01-29 16:59:00', null, '3', '24', null);
INSERT INTO `accountinfo` VALUES ('132', '100.0000', '投标', '0.0000', '24', '0.9000', '2015-01-29 16:59:01', null, '3', '16', null);
INSERT INTO `accountinfo` VALUES ('133', '50.0000', '投标', '0.0000', '21', '50.9000', '2015-01-29 16:59:34', null, '3', '22', null);
INSERT INTO `accountinfo` VALUES ('134', '50.0000', '投标', '0.0000', '21', '150.9000', '2015-01-29 17:01:08', null, '3', '26', null);
INSERT INTO `accountinfo` VALUES ('135', '0.0000', '满标放款', '100.0000', '24', '24.5000', '2015-01-29 05:01:18', null, '20', '13', null);
INSERT INTO `accountinfo` VALUES ('136', '100.0000', '借款人本金', '0.0000', '24', '24.0000', '2015-01-29 17:04:11', null, '3', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('137', '1.0000', '借款人利息', '0.0000', '24', '23.0000', '2015-01-29 17:04:11', null, '4', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('138', '0.5000', '借款人管理费', '0.0000', '24', '23.0000', '2015-01-29 17:04:11', null, '2', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('139', '0.0000', '投资人本金', '100.0000', '24', '0.0000', '2015-01-29 17:04:11', null, '6', '16', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('140', '0.0000', '投资人利息', '1.0000', '24', '1.0000', '2015-01-29 17:04:11', null, '7', '16', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('141', '0.1000', '投资人管理费', '0.0000', '24', '0.9000', '2015-01-29 17:04:11', null, '5', '16', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('142', '100.0000', '投标', '0.0000', '28', '1.8000', '2015-01-30 11:40:18', null, '3', '16', null);
INSERT INTO `accountinfo` VALUES ('143', '0.0000', '满标放款', '100.0000', '28', '23.0000', '2015-01-30 11:40:53', null, '20', '13', null);
INSERT INTO `accountinfo` VALUES ('144', '100.0000', '借款人本金', '0.0000', '28', '22.5000', '2015-01-30 11:41:58', null, '3', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('145', '1.0000', '借款人利息', '0.0000', '28', '21.5000', '2015-01-30 11:41:58', null, '4', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('146', '0.5000', '借款人管理费', '0.0000', '28', '21.5000', '2015-01-30 11:41:58', null, '2', '13', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('147', '0.0000', '投资人本金', '100.0000', '28', '0.9000', '2015-01-30 11:41:58', null, '6', '16', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('148', '0.0000', '投资人利息', '1.0000', '28', '1.9000', '2015-01-30 11:41:58', null, '7', '16', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('149', '0.1000', '投资人管理费', '0.0000', '28', '1.8000', '2015-01-30 11:41:58', null, '5', '16', 'KH20150123063424651007');
INSERT INTO `accountinfo` VALUES ('150', '50.0000', '投标', '0.0000', '30', '52.7000', '2015-01-30 15:10:43', null, '3', '16', null);
INSERT INTO `accountinfo` VALUES ('151', '50.0000', '投标', '0.0000', '29', '50.9000', '2015-01-30 15:11:06', null, '3', '22', null);
INSERT INTO `accountinfo` VALUES ('152', '50.0000', '投标', '0.0000', '29', '50.9000', '2015-01-30 15:11:17', null, '3', '24', null);
INSERT INTO `accountinfo` VALUES ('153', '50.0000', '投标', '0.0000', '29', '150.9000', '2015-01-30 15:11:59', null, '3', '26', null);
INSERT INTO `accountinfo` VALUES ('154', '0.0000', '在线充值', '200.0000', null, '0.0000', '2015-02-03 17:40:39', null, '8', '27', 'CZ20150203053915692717');
INSERT INTO `accountinfo` VALUES ('155', '200.0000', '投标', '0.0000', '31', '0.0000', '2015-02-03 17:41:48', null, '3', '27', null);
INSERT INTO `accountinfo` VALUES ('156', '0.0000', '在线充值', '2550.0000', null, '0.0000', '2015-02-04 15:31:37', null, '8', '34', 'CZ20150204032427544810');
INSERT INTO `accountinfo` VALUES ('157', '2550.0000', '投标', '0.0000', '31', '0.0000', '2015-02-04 15:41:10', null, '3', '34', null);
INSERT INTO `accountinfo` VALUES ('158', '0.0000', '在线充值', '200.0000', null, '0.0000', '2015-02-04 15:47:00', null, '8', '27', 'CZ20150204034507811315');
INSERT INTO `accountinfo` VALUES ('159', '200.0000', '投标', '0.0000', '31', '0.0000', '2015-02-04 15:47:37', null, '3', '27', null);
INSERT INTO `accountinfo` VALUES ('160', '0.0000', '在线充值', '200.0000', null, '0.0000', '2015-02-04 16:31:51', null, '8', '41', 'CZ20150204042929616410');
INSERT INTO `accountinfo` VALUES ('161', '0.0000', '在线充值', '0.0100', null, '0.0000', '2015-02-26 12:00:52', null, '8', '7', '150226100019820645');
INSERT INTO `accountinfo` VALUES ('162', '0.0000', '在线充值', '0.0100', null, '0.0000', '2015-02-26 12:17:25', null, '8', '7', '150226100019821734');
INSERT INTO `accountinfo` VALUES ('163', '50.0000', '投标', '0.0000', '32', '4586.3200', '2015-02-26 18:05:18', null, '21', '44', null);
INSERT INTO `accountinfo` VALUES ('164', '50.0000', '投标', '0.0000', '32', '3273742.6700', '2015-02-26 19:02:35', null, '21', '1', null);

-- ----------------------------
-- Table structure for `accounttype`
-- ----------------------------
DROP TABLE IF EXISTS `accounttype`;
CREATE TABLE `accounttype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(60) DEFAULT NULL COMMENT '类型名',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='流水账类型表';

-- ----------------------------
-- Records of accounttype
-- ----------------------------
INSERT INTO `accounttype` VALUES ('1', '会员缴费', '会员VIP升级');
INSERT INTO `accounttype` VALUES ('2', '借款人管理费', '借款人管理费');
INSERT INTO `accounttype` VALUES ('3', '借款人本金', '借款人本金');
INSERT INTO `accounttype` VALUES ('4', '借款人利息', '借款人利息');
INSERT INTO `accounttype` VALUES ('5', '投资人管理费', '投资人管理费');
INSERT INTO `accounttype` VALUES ('6', '投资人本金', '投资人本金');
INSERT INTO `accounttype` VALUES ('7', '投资人利息', '投资人利息');
INSERT INTO `accounttype` VALUES ('8', '充值', '在线充值金额');
INSERT INTO `accounttype` VALUES ('9', '提现', '在线提现金额');
INSERT INTO `accounttype` VALUES ('10', '充值手续费', '充值手续费');
INSERT INTO `accounttype` VALUES ('11', '提现手续费', '提现手续费');
INSERT INTO `accounttype` VALUES ('12', '提前还款违约金', '提前还款违约金');
INSERT INTO `accounttype` VALUES ('13', '逾期还款违约金', '逾期还款违约金');
INSERT INTO `accounttype` VALUES ('14', '奖励', '奖励');
INSERT INTO `accounttype` VALUES ('15', '推广奖金', '推广奖金');
INSERT INTO `accounttype` VALUES ('16', '待确认提现', '待确认提现');
INSERT INTO `accounttype` VALUES ('17', '待确认充值', '待确认充值');
INSERT INTO `accounttype` VALUES ('18', '自动投标认购', '自动投标认购');
INSERT INTO `accounttype` VALUES ('19', '借款标回款', '借款标回款');
INSERT INTO `accounttype` VALUES ('20', '满标放款', '满标放款');
INSERT INTO `accounttype` VALUES ('21', '投标', '手动投标');

-- ----------------------------
-- Table structure for `adminmessage`
-- ----------------------------
DROP TABLE IF EXISTS `adminmessage`;
CREATE TABLE `adminmessage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context` varchar(300) DEFAULT NULL COMMENT '发送内容',
  `isread` int(1) DEFAULT NULL COMMENT '是否已读（0未读 1已读）',
  `receivetime` varchar(30) DEFAULT NULL COMMENT '发送时间',
  `title` varchar(256) DEFAULT NULL COMMENT '标题',
  `adminuser_id` varchar(20) DEFAULT NULL COMMENT '接收人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='客服消息表';

-- ----------------------------
-- Records of adminmessage
-- ----------------------------
INSERT INTO `adminmessage` VALUES ('1', '罗淳雅申请了一笔额度为1000.0的提现', '0', '2015-01-22 23:10:21', '提现申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('2', '朱德厚申请了一笔额度为8.0的提现', '0', '2015-01-23 00:44:38', '提现申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('3', '用户guo555申请成为借款人', '0', '2015-01-23 02:04:26', '借款人申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('4', '用户guo555申请了一笔额度为1000.0的借款', '0', '2015-01-23 02:24:07', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('5', '用户guo555申请了一笔额度为1000.0的借款', '0', '2015-01-23 08:55:25', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('6', '用户guo555申请了一笔额度为1000.0的借款', '0', '2015-01-23 09:16:52', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('7', '用户guo555申请了一笔额度为1000.0的借款', '0', '2015-01-23 10:16:32', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('8', '用户guo555申请了一笔额度为1000.0的借款', '0', '2015-01-23 10:41:18', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('9', '用户guo555申请了一笔额度为1000.0的借款', '0', '2015-01-23 10:47:19', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('10', '用户guo555申请了一笔额度为1000.0的借款', '0', '2015-01-23 10:47:20', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('11', '用户sodagreen28申请成为借款人', '0', '2015-01-23 18:51:11', '借款人申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('12', '用户sodagreen28申请了一笔额度为50.0的借款', '0', '2015-01-23 18:53:11', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('13', '用户sodagreen28申请了一笔额度为100.0的借款', '0', '2015-01-23 18:57:59', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('14', '吴锦培申请了一笔额度为50.0的提现', '0', '2015-01-24 19:54:55', '提现申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('15', '用户sodagreen28申请了一笔额度为100.0的借款', '0', '2015-01-25 11:47:46', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('16', '用户sodagreen28申请了一笔额度为100.0的借款', '0', '2015-01-27 14:17:51', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('17', '吴锦培申请了一笔额度为10.0的提现', '0', '2015-01-27 16:00:07', '提现申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('18', '用户sodagreen28申请了一笔额度为100.0的借款', '0', '2015-01-28 10:52:15', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('19', '用户baby申请成为借款人', '0', '2015-01-28 15:02:19', '借款人申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('20', '用户zoe申请成为借款人', '0', '2015-01-28 15:02:55', '借款人申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('21', '用户15089693925申请成为借款人', '0', '2015-01-28 15:02:55', '借款人申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('22', '用户15089693925申请成为借款人', '0', '2015-01-28 15:03:03', '借款人申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('23', '用户Amy00申请成为借款人', '0', '2015-01-28 15:04:33', '借款人申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('24', '用户Amy00申请成为借款人', '0', '2015-01-28 15:04:47', '借款人申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('25', '用户lichengxia申请成为借款人', '0', '2015-01-28 15:06:04', '借款人申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('26', '用户zoe申请了一笔额度为100.0的借款', '0', '2015-01-28 15:21:32', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('27', '用户baby申请了一笔额度为100.0的借款', '0', '2015-01-28 15:21:51', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('28', '用户lichengxia申请了一笔额度为100.0的借款', '0', '2015-01-28 15:23:31', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('29', '用户15089693925申请了一笔额度为100.0的借款', '0', '2015-01-28 15:23:36', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('30', '用户liangyk申请成为借款人', '0', '2015-01-28 15:24:27', '借款人申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('31', '用户Amy00申请了一笔额度为100.0的借款', '0', '2015-01-28 15:25:09', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('32', '用户sodagreen28申请了一笔额度为100.0的借款', '0', '2015-01-28 15:35:32', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('33', '用户liangyk申请了一笔额度为100.0的借款', '0', '2015-01-28 15:42:23', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('34', '用户sodagreen28申请了一笔额度为200.0的借款', '0', '2015-01-28 16:10:22', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('35', '用户sodagreen28申请了一笔额度为200.0的借款', '0', '2015-01-28 16:13:17', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('36', '用户sodagreen28申请了一笔额度为100.0的借款', '0', '2015-01-28 16:15:33', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('37', '用户sodagreen28申请了一笔额度为100.0的借款', '0', '2015-01-29 09:40:48', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('38', '用户sodagreen28申请了一笔额度为200.0的借款', '0', '2015-01-29 09:48:55', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('39', '用户sodagreen28申请了一笔额度为100.0的借款', '0', '2015-01-29 16:36:56', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('40', '用户sodagreen28申请了一笔额度为100.0的借款', '0', '2015-01-29 16:49:37', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('41', '用户sodagreen28申请了一笔额度为100.0的借款', '0', '2015-01-30 08:36:48', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('42', '用户sodagreen28申请了一笔额度为100.0的借款', '0', '2015-01-30 08:44:16', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('43', '用户sodagreen28申请了一笔额度为100.0的借款', '0', '2015-01-30 10:37:30', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('44', '用户sodagreen28申请了一笔额度为100.0的借款', '0', '2015-01-30 11:36:03', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('45', '用户sodagreen28申请了一笔额度为200.0的借款', '0', '2015-01-30 15:06:28', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('46', '用户sodagreen28申请了一笔额度为100.0的借款', '0', '2015-01-30 15:07:47', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('47', '用户liqijia申请成为借款人', '0', '2015-02-03 16:06:16', '借款人申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('48', '用户liqijia申请了一笔额度为100000.0的借款', '0', '2015-02-03 16:24:30', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('49', '李成霞申请了一笔额度为50.0的提现', '0', '2015-02-05 17:27:59', '提现申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('50', '用户sodagreen28申请了一笔额度为100.0的借款', '0', '2015-02-06 14:13:04', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('51', '用户guo555申请了一笔额度为120.0的借款', '0', '2015-02-25 16:30:49', '借款申请', 'null,2');
INSERT INTO `adminmessage` VALUES ('52', '用户guo555申请了一笔额度为10000.0的借款', '0', '2015-02-25 17:01:34', '借款申请', 'null,2');

-- ----------------------------
-- Table structure for `adminuser`
-- ----------------------------
DROP TABLE IF EXISTS `adminuser`;
CREATE TABLE `adminuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(20) DEFAULT NULL COMMENT '登陆名',
  `realname` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `sex` int(1) DEFAULT NULL COMMENT '性别',
  `age` int(3) DEFAULT NULL COMMENT '年龄',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色id',
  `email` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `status` int(1) DEFAULT NULL COMMENT '(0未启用 1启用)',
  `password` varchar(255) DEFAULT NULL COMMENT '密码 MD5 加密',
  `qq` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `imgUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`) USING BTREE,
  CONSTRAINT `adminuser_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='后台登陆用户信息表; InnoDB free: 8192 kB; (`role_id; InnoDB free: 8192 kB; (`role_id`) RE';

-- ----------------------------
-- Records of adminuser
-- ----------------------------
INSERT INTO `adminuser` VALUES ('2', 'admin', '管理员', '0755-86707492', '1', '28', '1', 'gaowuming@tpyp2p.com', '1', 'e10adc3949ba59abbe56e057f20f883e', null, '深圳市', null);
INSERT INTO `adminuser` VALUES ('12', '小麦', '小麦', '0755-86707492', '0', '22', '2', 'gaowuming@tpyp2p.com', '1', '257c146d70c5f9546aa009363eaf66c3', '3214785792', '深圳市', '\\resources\\images\\headimg.jpg');
INSERT INTO `adminuser` VALUES ('13', '小云', '小云', '0755-86707492', '0', '22', '2', 'gaowuming@tpyp2p.com', '1', '257c146d70c5f9546aa009363eaf66c3', '1925855177', '深圳市', '\\resources\\images\\headimg.jpg');
INSERT INTO `adminuser` VALUES ('14', '小云', '小云', '0755-86707492', '0', '22', '2', 'gaowuming@tpyp2p.com', '1', '257c146d70c5f9546aa009363eaf66c3', '2484792950', '深圳市', '\\resources\\images\\headimg.jpg');
INSERT INTO `adminuser` VALUES ('15', '小郭', '小郭', '0755-86707492', '0', '22', '2', 'gaowuming@tpyp2p.com', '1', '257c146d70c5f9546aa009363eaf66c3', '1513804766', '深圳市', '\\resources\\images\\headimg.jpg');
INSERT INTO `adminuser` VALUES ('16', '小清', '小清', '0755-86707492', '0', '22', '2', 'gaowuming@tpyp2p.com', '1', '257c146d70c5f9546aa009363eaf66c3', '3143480144', '深圳市', '\\resources\\images\\headimg.jpg');
INSERT INTO `adminuser` VALUES ('17', '小梅', '小梅', '0755-86707492', '0', '22', '2', 'gaowuming@tpyp2p.com', '1', '257c146d70c5f9546aa009363eaf66c3', '1722707526', '深圳市', '\\resources\\images\\headimg.jpg');
INSERT INTO `adminuser` VALUES ('18', 'wujinpei', '吴锦培', '0755-86707492', '1', '28', '5', 'gaowuming@tpyp2p.com', '1', '257c146d70c5f9546aa009363eaf66c3', null, '御景台', null);
INSERT INTO `adminuser` VALUES ('26', 'cdbdai_kefu', '客服专员', '0755-86707492', '0', '22', '4', 'gaowuming@tpyp2p.com', '1', '257c146d70c5f9546aa009363eaf66c3', null, '深圳市', null);

-- ----------------------------
-- Table structure for `adminuseraccountinfo`
-- ----------------------------
DROP TABLE IF EXISTS `adminuseraccountinfo`;
CREATE TABLE `adminuseraccountinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `expenditure` double DEFAULT NULL,
  `explan` varchar(80) DEFAULT NULL,
  `income` double DEFAULT NULL,
  `money` double NOT NULL,
  `time` varchar(30) DEFAULT NULL,
  `withdraw` varchar(30) DEFAULT NULL,
  `accounttype_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `FK11B77C814BE26A67` (`accounttype_id`) USING BTREE,
  CONSTRAINT `adminuseraccountinfo_ibfk_1` FOREIGN KEY (`accounttype_id`) REFERENCES `accounttype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 8192 kB; (`accounttype_id`) REFER `tgp2p/accoun';

-- ----------------------------
-- Records of adminuseraccountinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `adminuserfundinfo`
-- ----------------------------
DROP TABLE IF EXISTS `adminuserfundinfo`;
CREATE TABLE `adminuserfundinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cashBalance` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminuserfundinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deputysection_id` bigint(20) DEFAULT NULL COMMENT '所属二级栏目',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `isShow` int(2) DEFAULT NULL COMMENT '是否显示 1 显示 0不显示',
  `isRecommend` int(2) DEFAULT NULL COMMENT ' 是否推荐1推荐 0不推荐',
  `context` varchar(5000) DEFAULT NULL COMMENT '内容',
  `createTime` varchar(80) DEFAULT NULL COMMENT '创建时间',
  `orderNum` int(11) DEFAULT NULL COMMENT '显示顺序',
  `filePath` varchar(255) DEFAULT NULL COMMENT '文章路径',
  `url` varchar(255) DEFAULT NULL COMMENT '文件路径',
  PRIMARY KEY (`id`),
  KEY `deputysection_id` (`deputysection_id`) USING BTREE,
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`deputysection_id`) REFERENCES `deputysection` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='文章信息表; InnoDB free: 8192 kB; (`deputysection_id`) ; InnoDB free: 8192 kB; (`depu';

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('31', '60', '监管应兼顾金融和网络特征', '1', '1', '细数那些“看不见”的影子银行01', '2014-03-31 14:35:02', null, null, 'to/article-1-60-31.htm');
INSERT INTO `article` VALUES ('32', '60', '银监会与央行联合下发《关于加强商业银行与第三方支付机构合作业务管理的通知》', '1', '1', '细数那些“看不见”的影子银行02', '2014-03-31 14:35:21', null, null, 'to/article-1-60-32.htm');
INSERT INTO `article` VALUES ('33', '60', '浅谈2014年P2P网贷行业关键词：跑马圈地', '1', '1', '细数那些“看不见”的影子银行03', '2014-03-31 14:35:35', null, null, 'to/article-1-60-33.htm');
INSERT INTO `article` VALUES ('34', '60', '细数那些“看不见”的影子银行04', '0', '0', '细数那些“看不见”的影子银行04', '2014-03-31 14:35:49', null, null, 'to/article-1-60-34.htm');
INSERT INTO `article` VALUES ('35', '60', '细数那些“看不见”的影子银行05', '0', '0', '细数那些“看不见”的影子银行05', '2014-03-31 14:36:01', null, null, 'to/article-1-60-35.htm');
INSERT INTO `article` VALUES ('43', '61', '什么是P2P网贷？P2P网贷违法吗', '1', '1', '什么是P2P网贷？P2P网贷违法吗？', '2014-04-04 15:14:18', null, null, 'to/article-1-61-43.htm');
INSERT INTO `article` VALUES ('44', '61', 'P2P网贷有哪些风险？', '1', '1', 'P2P网贷有哪些风险？', '2014-07-17 14:49:34', null, null, 'to/article-1-61-44.htm');
INSERT INTO `article` VALUES ('45', '61', '会员为什么要进行身份认证？', '1', '1', '会员为什么要进行身份认证？', '2014-07-17 14:49:57', null, null, 'to/article-1-61-45.htm');
INSERT INTO `article` VALUES ('46', '61', '电子合同有效吗？', '1', '1', '电子合同有效吗？', '2014-07-17 14:50:17', null, null, 'to/article-1-61-46.htm');
INSERT INTO `article` VALUES ('47', '61', '什么是按月等额本息还款？', '1', '1', '什么是按月等额本息还款？', '2014-07-17 14:50:44', null, null, 'to/article-1-61-47.htm');
INSERT INTO `article` VALUES ('51', '118', '家庭财务健康诊断', '1', '1', '<p style=\"text-align: center;\">家庭财务健康诊断</p><p style=\"text-align: left;\">家庭财务健康诊断文章内容！<br /></p>', '2014-08-09 11:38:28', null, null, 'to/article-1-118-51.htm');
INSERT INTO `article` VALUES ('52', '118', '风险偏好测试', '1', '1', '<div style=\"text-align: center;\">风险偏好测试</div><div style=\"text-align: left;\">风险偏好测试~~~~~~~~~~~~<br /></div>', '2014-08-09 11:52:25', null, null, 'to/article-1-118-52.htm');
INSERT INTO `article` VALUES ('54', '20', '深圳市“台湾城杯”2014年海峡两岸青年创新创业大赛', '0', '0', '<p><span style=\"font-size:12px;\">8<span style=\"font-family:\'微软雅黑\',\'sans-serif\';\">月</span>25<span style=\"font-family:\'微软雅黑\',\'sans-serif\';\">日上午，广东省首个由共青团广东省委员会、广东省青年创业就业联合会授予的省级创业孵化基地</span>——<span style=\"font-family:\'微软雅黑\',\'sans-serif\';\">广东省</span>“<span style=\"font-family:\'微软雅黑\',\'sans-serif\';\">台湾城</span>·<span style=\"font-family:\'微软雅黑\',\'sans-serif\';\">深圳市站</span>”<span style=\"font-family:\'微软雅黑\',\'sans-serif\';\">海峡两岸青年创业孵化基地正式成立，这是全省首个面向台湾青年和当地青年的创业孵化基地。当天上午</span>10<span style=\"font-family:\'微软雅黑\',\'sans-serif\';\">点整，由深圳市副市长陈宣群、广东青年就业创业联合会秘书长李颂国、省台办交流处处长刘小青、团深圳市委书记唐莹等出席了揭牌仪式；同时</span>2014<span style=\"font-family:\'微软雅黑\',\'sans-serif\';\">年海峡两岸青年创新创业大赛“台湾城杯<strong>·</strong>深圳市站”正式启航。</span></span></p><p><span style=\"font-size:12px;\"><span style=\"font-family:\'微软雅黑\',\'sans-serif\';\">活动得到深圳市、台湾两地青年的积极响应，共有</span>30<span style=\"font-family:\'微软雅黑\',\'sans-serif\';\">名创业青年参加大赛。大赛分为创意组及创业组，参赛青年带上创新、创意产品、商业计划书等相关资料，到参赛现场进行展示。大赛邀请了成功的创业精英、实力雄厚的投资人、企业评审专家加入评审团，旨在发现和挖掘本土优秀的创业项目和创新的创业人才，并为优秀创业青年提供创业帮扶。<span style=\"color:#E36C0A;\">积极响应本次创业大赛的宗旨，太平洋电子商务有限公司（太平洋理财</span></span><a href=\"http://www.cdbdai.com/\"><span style=\"color:#E36C0A;\">www.cdbdai.com</span></a><span style=\"font-family:\'微软雅黑\',\'sans-serif\';color:#E36C0A;\">）也参加了创业组的比赛，希望给台湾及深圳市的创业者们提供一种新的融资渠道，有效的解决创业者融资难的问题。</span></span></p><p><span style=\"font-size:12px;\"><span style=\"font-family:\'微软雅黑\',\'sans-serif\';\">在比赛中，太平洋理财法人王永从</span>P2P<span style=\"font-family:\'微软雅黑\',\'sans-serif\';\">行业背景、团队介绍、产品介绍等六个方面对太平洋理财平台的创业历程进行阐述，并着重对</span>P2P<span style=\"font-family:\'微软雅黑\',\'sans-serif\';\">的运营模式进行了详细的介绍。太平洋理财做为深圳市第一家互联网金融投融资服务平台，其创新的运营模式及开阔的发展前景，让评委们及其他创业队伍感到眼前一亮，同时也获得了现场观众的一致肯定。比赛结束后，太平洋理财获得了本次大赛的“优秀项目奖”，并推报参加团省委</span>9<span style=\"font-family:\'微软雅黑\',\'sans-serif\';\">月</span>7<span style=\"font-family:\'微软雅黑\',\'sans-serif\';\">日举办的</span>“<span style=\"font-family:\'微软雅黑\',\'sans-serif\';\">南海<strong>·</strong>大沥杯</span>”<span style=\"font-family:\'微软雅黑\',\'sans-serif\';\">——</span><span style=\"color:red;\">2014</span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';color:red;\">广东青年创新创业大赛暨盐商杯中国青年创新创业大赛。</span></span></p><p><span style=\"font-size:12px;\"><span style=\"font-family:\'微软雅黑\',\'sans-serif\';\">此次青年创业大赛之行，让我们有机会吸取其他优秀创业队伍的创业经验及想法，同时也是一次很好的对外宣传机会，让更多外界的人了解到</span>P2P<span style=\"font-family:\'微软雅黑\',\'sans-serif\';\">的行业相比与传统金融行业的创新点和优势。</span></span> </p><div id=\"gallery\" style=\"min-height:130px;_height:130px;\"><ul>       <li>    <img src=\"/upload/default/columnimg/20150108172952.JPG\" alt=\"\" height=\"201\" />       </li>       <li>         <img src=\"/upload/default/columnimg/20150108173007.JPG\" alt=\"\" height=\"201\" />          </li>       <li>         <img src=\"/upload/default/columnimg/20150108173021.JPG\" alt=\"\" height=\"201\" />        	   </li>         	           </ul>         </div><style>.#gallery{ width:100%; display:inline-block; margin-top:15px;}\r\n#gallery ul li{ float:left; padding:5px 5px; width:226px; text-align:center; line-height:20px; font-size:13px; overflow:hidden;}\r\n#gallery ul li a img{ float:left; padding:2px;width:215px; border:1px solid #cecece;}\r\n\r\n#gallery1{ width:100%; display:inline-block; margin-top:15px;}\r\n#gallery1 ul li{ float:left; padding:5px 5px; width:226px; text-align:center; line-height:20px; font-size:13px; overflow:hidden;}\r\n#gallery1 ul li a img{ float:left; padding:2px;width:215px; border:1px solid #cecece;}\r\n\r\n#gallery2{ width:100%; display:inline-block; margin-top:15px;}\r\n#gallery2 ul li{ float:left; padding:5px 5px; width:226px; text-align:center; line-height:20px; font-size:13px; overflow:hidden;}\r\n#gallery2 ul li a img{ float:left; padding:2px;width:215px; border:1px solid #cecece;}\r\n\r\n#gallery3{ width:100%; display:inline-block; margin-top:15px;}\r\n#gallery3 ul li{ float:left; padding:5px 5px; width:226px; text-align:center; line-height:20px; font-size:13px; overflow:hidden;}\r\n#gallery3 ul li a img{ float:left; padding:2px;width:215px; border:1px solid #cecece;}</style>', '2015-01-08 16:03:15', null, null, 'to/article-1-20-54.htm');
INSERT INTO `article` VALUES ('55', '20', '太平洋理财8月5日首登西江日报财经周刊版', '0', '0', '<p><span style=\"font-family:\'Microsoft YaHei\';font-size:12px;\">2015年1月12日</span></p><p><span style=\"font-family:\'Microsoft YaHei\';\"><span style=\"font-size:16px;\">&nbsp; &nbsp; &nbsp; &nbsp; <span style=\"color:#3e3e3e;line-height: 25px; text-indent: 32px; white-space: pre-wrap;\">作为近年新兴的一种借贷模式，P2P小额借贷已经风行网络。上周，由深圳市一家公司开发推出的P2P网络借贷平台正式上线，为本地中小微企业融资提供额另一新选择。</span></span></span></p><p style=\"margin: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); line-height: 25px; text-indent: 32px; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"font-family:Microsoft YaHei;\"><span style=\"font-size:16px;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">据悉，该名为“太平洋理财”的服务平台是深圳市太平洋电子商务有限公司旗下网站。据该公司负责人介绍，平台由国内大型商业银行、担保公司、网络信贷从业人员发起筹建，是深圳市地区第一家高科技互联网金融投融资服务平台。“作为金融创新产品，‘太平洋理财’丰富了个人和企业的投融资渠道，有利缓解企业融资难题，也有利促进金融惠普化。”<br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\" />    所谓P2P小额借贷，是指将非常小额度的资金聚集起来，通过第三方平台借贷给有资金需求的人群。这里的第三方平台客户包括将资金借出的客户和需要贷款的客户。<br style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\" />                                                                                                                                                                                                 西江日报记者潘粤华</span></span></span></p><p style=\"margin: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); line-height: 25px; text-indent: 32px; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"font-family:Microsoft YaHei;\"><span style=\"font-size:16px;\"><span style=\"font-size:12px;\"> 相关链接</span>→<a href=\"http://www.xjrb.net/xjrb/20140805/index.htm\" target=\"_blank\">http://www.xjrb.net/xjrb/20140805/index.htm</a></span></span></p><p style=\"margin: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); line-height: 25px; text-indent: 32px; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"font-family:Microsoft YaHei;\"><span style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"font-size:16px;\"><img src=\"/upload/default/columnimg/20150112110137.png\" alt=\"\" /><br /></span></span></span></p><span style=\"font-family:Microsoft YaHei;\"><br /></span>', '2015-01-12 11:01:51', null, null, 'to/article-1-20-55.htm');
INSERT INTO `article` VALUES ('56', '20', '太平洋理财于2014年8月1号隆重上线~', '1', '1', '<p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:#3E3E3E;font-size:9.0pt;\">　<span style=\"font-family:\'微软雅黑\',\'sans-serif\';\">2014年8月<span style=\"font-family:\'微软雅黑\',\'sans-serif\';\">1日</span></span></span></p><p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:#3E3E3E;font-size:9.0pt;\">　太平洋理财（</span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:blue;font-size:9.0pt;\">www.cdbdai.com</span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:#3E3E3E;font-size:9.0pt;\">）系广东省深圳市首家P2P网贷平台，经深圳市国家经济贸易和科技局引入，由深圳市国家政府审核批准成立，于2014年8月1日火热上线，系列活动霸气来袭，红包礼品拿到手软，多家大型担保公司本息保障，年化达到15%-20%。赶紧启动你的小金库加入我们吧！</span></p><p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:#3E3E3E;font-size:9.0pt;\"><img src=\"/upload/default/columnimg/20150112153440.jpg\" alt=\"\" /><br /></span></p><p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:#3E3E3E;font-size:9.0pt;\">　　太平洋理财（</span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:blue;font-size:9.0pt;\">cdbdai.com</span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:#3E3E3E;font-size:9.0pt;\">），系深圳市高 新区太平洋电子商务有限公司旗下网站，成立于2014年6月，实收注册资本金：壹仟壹佰万人民币，是深圳市地区第一家高科技互联网金融投融资服务平台，经深圳市国家经济贸易和科技局引入，由深圳市国家政府审核批准成立，公司总部位于深圳市国家高新科技产业开发区创业服务中心大楼三楼。</span></p><p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:#3E3E3E;font-size:9.0pt;\">　　太平洋理财服务平台由国内大型商业银行、担保公司、网络信贷从业人员发起筹建，拥有资深IT工程师团队，具备先进的后台管理系统和严格的风险控制体系，致力于打造安全、高效、可信赖的网络投融资服务平台。</span></p><p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:#3E3E3E;font-size:9.0pt;\">　　为响应“促进互联网金融健康发展”的精神，根据《广东省金融改革发展“十二五”规划》和《深圳市国民经济和社会发展第十二个五年规划纲要》的指导意见，太平洋理财依托传统金融体系，结合互联网技术特点，为个人、中小微企业等资金供需双方提供一个安全、高效、便捷的网络投融资服务平台。</span></p><p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:#3E3E3E;font-size:9.0pt;\"><img src=\"/upload/default/columnimg/20150112153823.jpg\" alt=\"\" /></span></p><p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:#3E3E3E;font-size:9.0pt;\"></span></p><p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';color:#3E3E3E;font-size:9.0pt;\">网址：www.cdbdai.com</span></p><p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';color:#3E3E3E;font-size:9.0pt;\">地址：深圳市国家创业服务中心大楼3楼</span></p><p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';color:#3E3E3E;font-size:9.0pt;\">免费服务热线：400 833 0758</span></p><br />', '2015-01-12 15:39:34', null, null, 'to/article-1-20-56.htm');
INSERT INTO `article` VALUES ('57', '20', '未来互联网金融在肇或“大展拳脚”', '1', '1', '<p align=\"center\"><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:black;font-size:9.0pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8</span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:black;font-size:9.0pt;\">月1日，深圳市第一家互联网金融投融资服务平台正式上线</span></p><p style=\"text-align:center;\" align=\"center\"><span style=\"font-size:12px;\"><strong><span style=\"font-family:\'微软雅黑\',\'sans-serif\';color:black;font-size:9.0pt;\">未来互联网金融在肇或“大展拳脚”</span></strong></span></p><p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:black;font-size:9.0pt;\">&nbsp; &nbsp;&nbsp; 时间踏入8月1日，精心筹备两年之久的“太平洋电子商务有限公司”正式上线运营，与市面上一般的金融中介机构不同的是，太平洋理财是深圳市地区第一家高科技互联网金融投融资服务平台，经深圳市国家经济贸易和科技局引入，继而由深圳市国家政府审核批准成立。</span></p><p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:black;font-size:9.0pt;\">&nbsp; &nbsp;&nbsp; 其“来势汹汹”之状，足以彰显实力的厚重，对此，有业内专家表示，互联网金融领域在肇或不会再是一片“蛮荒之地”。（记者夏紫怡实习生 冼瑞奋）</span></p><p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:black;font-size:9.0pt;\">&nbsp;</span></p><p><span style=\"font-size:12px;\"><strong><span style=\"font-family:\'微软雅黑\',\'sans-serif\';color:black;font-size:9.0pt;\">时机</span></strong></span></p><p><span style=\"font-size:12px;\"><strong><span style=\"font-family:\'微软雅黑\',\'sans-serif\';color:black;font-size:9.0pt;\">“中国合伙人”造就端城首家线上P2P金融服务交易平台</span></strong></span></p><p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:black;font-size:9.0pt;\">&nbsp; &nbsp;&nbsp; 2012</span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:black;font-size:9.0pt;\">年，是中国互联网金融的元年，在这一年里，金融企业全面向网络化发展，与此同时，亦是互联网企业向金融领域拓展的一年。以阿里巴巴为代表的传统电商企业纷纷展开供应链融资业务，以求在资金流转层面更好的服务会员，而大批新形式的投融资产品也在互联网上出现。</span></p><p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:black;font-size:9.0pt;\">&nbsp;&nbsp;&nbsp;&nbsp; 深圳市生活已有二十多年的周明道先生于2010年也对P2P网络借贷等投融资服务产生开办公司的想法，但由于缺乏技术型人才，迟迟未能如愿。2013年，在一位共同好友的“穿针引线“下，从事互联网金融四年之久平台运营的肖国强先生和天使投资人周明道先生一拍即合，运用肖国强先生的一句话，“我们都一致发现对方是自己要找的人”。和很多抱有创业梦想的年轻人一样，凭着经验觉察到这行业里悄然地带有革命性的变化，以及其背后的一支技术团队开启了创业之路。</span></p><p><span style=\"font-size:12px;\"><strong><span style=\"font-family:\'微软雅黑\',\'sans-serif\';color:black;font-size:9.0pt;\">&nbsp;</span></strong></span></p><p><span style=\"font-size:12px;\"><strong><span style=\"font-family:\'微软雅黑\',\'sans-serif\';color:black;font-size:9.0pt;\">方向</span></strong></span></p><p><span style=\"font-size:12px;\"><strong><span style=\"font-family:\'微软雅黑\',\'sans-serif\';color:black;font-size:9.0pt;\">做“开荒牛”的目标是为了树立金融品牌</span></strong></span></p><p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:black;font-size:9.0pt;\">&nbsp; &nbsp;&nbsp; 在一个月以前，深圳市还没有一家以线上投融资服务为主体的金融中介机构，而仅有的一家“融资超市”则是协助促进完善中小企业投融资市场，牵头引导和推动中小企业改制上市的金融服务平台，两者虽然在本质上没有区别，但就创新性而言，“融资超市”更多的是为融资需求者对接到传统金融行业内；而太平洋理财则是在提供传统金融行业对接的同时，融合了个人理财的创新模式。</span></p><p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:black;font-size:9.0pt;\">&nbsp; “P2P信贷是随着互联网的发展和民间借贷的兴起而发展起来的一种新的金融模式，亦是未来互联网发展的趋势。深圳市在该线上金融服务行业还处于尚待开发的状态；目前而言，深圳市在互联网金融行业方面竞争力较为薄弱，选址在这里，很大原因是看到其中的发展生存空间大。”运营总监肖国强介绍说。</span></p><p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:black;font-size:9.0pt;\">&nbsp; 据了解，太平洋电子商务有限公司目前在线上推出产品的背后都有严格的风险审核评估。如太平洋宝产品中，在融资客户向平台提出融资申请后，由第三方专业融资担保机构及太平洋理财联合开展贷前审核，并出具独立调研风险评估报告后才批以准入。</span></p><p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:black;font-size:9.0pt;\">&nbsp;</span></p><p><span style=\"font-size:12px;\"><strong><span style=\"font-family:\'微软雅黑\',\'sans-serif\';color:black;font-size:9.0pt;\">突破</span></strong></span></p><p><span style=\"font-size:12px;\"><strong><span style=\"font-family:\'微软雅黑\',\'sans-serif\';color:black;font-size:9.0pt;\">本息保障、系统保障、客户针对性是优势</span></strong></span></p><p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:black;font-size:9.0pt;\">&nbsp;&nbsp;&nbsp;&nbsp; </span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:black;font-size:9.0pt;\">据网贷之家监测数据显示，截至2014年6月中旬，全国各类P2P借贷平台1184家，共有55家网贷公司出现提现困难、关闭甚至跑路的现象，但是不可否认这个创新的模式带动了周边经济发展，提高了经济效益。同时政府正出台相关的监管政策，也逐步使互联网金融行业规范化、合理化。</span></p><p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:black;font-size:9.0pt;\">&nbsp;&nbsp;&nbsp;&nbsp; 深圳市本地由于互联网发展较为缓慢，似乎P2P借贷跑路事件“不容易”发生，究其原因，不得不探讨其为何发展“慢”。肖国强先生指出：“科技型企业少，导致互联网金融等新兴行业创新性甚微；其次，传统产业里惠及企业的条件太少，再者就是市民理财的观念比较薄弱。”</span></p><p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:black;font-size:9.0pt;\">&nbsp; </span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:12px;color:black;font-size:9.0pt;\">“科技创新少，我们就引进大批专业技术人员，从自主研发针对性产品开始，做到创新立足。而为了让投资者放心，做到本息保障，完善风险控制体系，严格控制融资者的准入门槛是最为关键，亦是我们的突破口。”太平洋理财执行董事长周明道先生满怀信心地介绍。</span></p><span style=\"font-size:12px;\"><img src=\"/upload/default/columnimg/20150112155335.jpg\" alt=\"\" /><br /></span>', '2015-01-12 15:54:27', null, null, 'to/article-1-20-57.htm');
INSERT INTO `article` VALUES ('58', '20', '庆开业，送大礼，您来我就送！', '1', '1', '<p><span style=\"font-size:12px;\"><span style=\"font-size:10px;\">2014年7月31日</span><br /></span></p><p><span style=\"font-size:12px;\"><strong>活动一：注册有礼，VIP享不停！</strong><br /></span></p><p><span style=\"font-size:12px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在2014年8月1日至2015年2月28日活动期间，前一千名新注册用户成功关注太平洋理财官方微信号（cdbdai/太平洋电子商务）并绑定手机号码、银行卡、通过实名认证，我们赠送您价值120元VIP一年(直接申请后系统自动赠送)。<br /></span></p><p><span style=\"font-size:12px;\"><strong>活动二：推荐好友，红包任你拿！</strong><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;推 荐送大礼活动开始啦，在&nbsp;2014年8月01日至2014年8月30日开业期间，前三百名累计投资满500元的VIP客户在活动期间成功通过个人“推荐链 接”推荐一名新用户注册并关注太平洋理财官方微信号（cdbdai/太平洋电子商务）并绑定手机号码、银行卡、通过实名认证、申请VIP，推荐人可获得太平洋理财赠 送的5元现金红包（以成功填写推荐人为准）。</span></p><p><strong><span style=\"font-size:12px;\">活动说明：</span></strong></p><p><span style=\"font-size:12px;\">1、在活动结束后三个工作日内统计并发放到您太平洋理财的账户内；</span></p><p><span style=\"font-size:12px;\">2、为不影响您的奖励发放，请按照活动规定的流程操作，如未按照流程操作则视为自动放弃活动奖励。</span></p><p><span style=\"font-size:12px;\"><strong>活动三：浪漫七夕，翡翠传情</strong><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;七夕将至，送TA一份独一无二礼物吧！&nbsp;在2014年8月1日至2014年8月30日活动期间，前三百名客户累计投资满以下金额，太平洋理财将赠送您翡翠珠宝、现金等大礼，具体如下：</span></p><p><span style=\"font-size:12px;\"><img src=\"/upload/default/columnimg/20150112161355.png\" alt=\"\" /><br /></span></p><p><span style=\"font-size:12px;\"></span></p><p><strong><span style=\"font-size:12px;\">活动说明：</span></strong></p><p><span style=\"font-size:12px;\">1、每个ID只能参与一次</span></p><p><span style=\"font-size:12px;\">2、活动结束五个工作日内官方工作人员会与您取得联系，并安排快递配送。</span></p><p><span style=\"font-size:12px;\">3、奖品以寄出实物为准，恕不提供实物折现。</span></p><p><span style=\"font-size:12px;\"><strong>活动四：多重体验，“金”喜不断</strong><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在2014年8月1日至2014年8月15日活动期间，前三百名新注册用户成功关注太平洋理财官方微信号（太平洋电子商务）并绑定手机号码、银行卡、通过实名认证，将获得2000元新手体验金(注册完成后找在线客服申请后即可获得)。<br />活动说明：</span></p><p><span style=\"font-size:12px;\">1、新手体验金2000元只限于投资太平洋理财推出的新手体验项目，不能用于其他用途；</span></p><p><span style=\"font-size:12px;\">2、新手体验金使用期限为1个月，期间所获得的收益归投资者，本金在到期后由系统自动扣除，其他事项在后期活动中公布；</span></p><p><span style=\"font-size:12px;\">3、新手体验金领取完成后，预计2014年8月16日安排新手体验标，领取完体验金后请先使用新手体验金投标，体验金使用后才能操作新充值的资金。</span></p><p><strong><span style=\"font-size:12px;\">注意事项：</span></strong></p><p><span style=\"font-size:12px;\">1、太平洋理财官方微信号：太平洋电子商务（或者搜索：cdbdai）；</span></p><p><span style=\"font-size:12px;\">2、注册流程引导图：</span></p><span style=\"font-size:12px;\"><img src=\"/upload/default/columnimg/20150112161907.png\" alt=\"\" /></span><p><span style=\"font-size:12px;\">3、现金红包于活动结束后三个工作日内系统自动发放到您太平洋理财的账户内；</span></p><p><span style=\"font-size:12px;\">4、每个活动同一个ID只限参与一次；</span></p><p><span style=\"font-size:12px;\">5、个人推荐链接位于：我的账户&nbsp;→&nbsp;信息中心&nbsp;→&nbsp;我的推荐；</span></p><p><span style=\"font-size:12px;\">6、在活动期间，如规则有所调整，以本平台公布的新公告或公告刷新的内容为准，恕不再另外单独向用户进行提醒；</span></p><p><span style=\"font-size:12px;\">7、本次活动的最终解释权归深圳市太平洋电子商务有限公司所有。</span></p><p style=\"text-align:right;\"><span style=\"font-size:12px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;深圳市太平洋电子商务有限公司</span></p><p style=\"text-align:right;\"><span style=\"font-size:12px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;二〇一四年七月三十一日</span></p><span style=\"font-size:12px;\"><br /></span><br />', '2015-01-12 16:05:58', null, null, 'to/article-1-20-58.htm');
INSERT INTO `article` VALUES ('59', '20', '太平洋理财8月5日首登西江日报财经周刊版', '1', '1', '<p style=\"text-align:center;\"><span style=\"font-size:12px;\">太平洋理财8月5日首登西江日报财经周刊版</span></p><p><span style=\"font-size:12px;\">&nbsp;&nbsp; &nbsp; &nbsp; 作为近年新兴的一种借贷模式，P2P小额借贷已经风行网络。上周，由深圳市一家公司开发推出的P2P网络借贷平台正式上线，为本地中小微企业融资提供额另一新选择。</span></p><p><span style=\"font-size:12px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 据 悉，该名为“太平洋理财”的服务平台是深圳市太平洋电子商务有限公司旗下网站。据该公司负责人介绍，平台由国内大型商业银行、担保公司、网络信贷从业人员发起筹建，是深圳市地区第一家高科技互联网金融投融资服务平台。“作为金融创新产品，‘太平洋理财’丰富了个人和企业的投融资渠道，有利缓解企业融资难题，也有利 促进金融惠普化。”<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 所谓P2P小额借贷，是指将非常小额度的资金聚集起来，通过第三方平台借贷给有资金需求的人群。这里的第三方平台客户包括将资金借出的客户和需要贷款的客户。<br />西江日报记者潘粤华</span></p><p><span style=\"font-size:12px;\">相关链接→<a href=\"http://www.xjrb.net/xjrb/20140805/index.htm\">http://www.xjrb.net/xjrb/20140805/index.htm</a></span></p><p><span style=\"font-size:12px;\"><a href=\"http://www.xjrb.net/xjrb/20140805/index.htm\"><img src=\"/upload/default/columnimg/20150112162604.png\" alt=\"\" /><br /></a></span></p>', '2015-01-12 16:26:33', null, null, 'to/article-1-20-59.htm');
INSERT INTO `article` VALUES ('60', '20', '金融创新 “解渴”小微企业', '1', '1', '<h5 style=\"margin: 0px; padding: 0px; font-style: normal; font-weight: 400; font-size: 16px; max-width: 100%; box-sizing: border-box ! important; word-wrap: break-word ! important; color: rgb(62, 62, 62); font-variant: normal; letter-spacing: normal; line-height: 25px; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; background-color: rgb(255, 255, 255);\"><span style=\"font-family:Microsoft YaHei;font-size:10px;\">2014年8月5日</span><span style=\"font-family:Microsoft YaHei;\"><br /></span></h5><h5 style=\"margin: 0px; padding: 0px; font-style: normal; font-weight: 400; font-size: 16px; max-width: 100%; box-sizing: border-box ! important; word-wrap: break-word ! important; color: rgb(62, 62, 62); font-variant: normal; letter-spacing: normal; line-height: 25px; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; background-color: rgb(255, 255, 255);\"><span style=\"font-family:Microsoft YaHei;font-size:12px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 深圳市是国家、广东省吸收外资重点工业园区和示范区，位于珠三角中心区西部，属广佛半小时经济生活圈，到香港、澳门仅需2个多小时车程，交通便利。近年来，在省政府的重视和支持下，招商引资成效显著，多所世界五百强企业在此落户。</span></h5><h5 style=\"margin: 0px; padding: 0px; font-style: normal; font-weight: 400; font-size: 16px; max-width: 100%; box-sizing: border-box ! important; word-wrap: break-word ! important; color: rgb(62, 62, 62); font-variant: normal; letter-spacing: normal; line-height: 25px; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; background-color: rgb(255, 255, 255);\"><span style=\"font-family:Microsoft YaHei;font-size:12px;\">&nbsp;&nbsp;&nbsp; 《广东省金融改革发展“十二五”规划》是建设现代金融产业体系、全面建设金融强时期的重要指导思想，根据十二五规划纲要，我市积极响应鼓励和引进优秀、创业的金融项目。</span></h5><h5 style=\"margin: 0px; padding: 0px; font-style: normal; font-weight: 400; font-size: 16px; max-width: 100%; box-sizing: border-box ! important; word-wrap: break-word ! important; color: rgb(62, 62, 62); font-variant: normal; letter-spacing: normal; line-height: 25px; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; background-color: rgb(255, 255, 255);\"><span style=\"font-family:Microsoft YaHei;font-size:12px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 太平洋理财（ www.cdbdai.com ） 是深圳市太平洋电子商务有限公司旗下网站，是我市首家互联网金融投融资服务平台。公司总部位于深圳市国家创业服务中心三楼，经深圳市国家经济贸 易和科技局引入，由深圳市国家政府审核批准成立，在广东工商行政管理局登记成立。2013年以来，互联网金融在我国的发展如火如荼，P2P网贷平台以 其先进的网络技术和公平透明的特性更是风头无两，行业发展前景十分广阔。</span></h5><h5 style=\"margin: 0px; padding: 0px; font-style: normal; font-weight: 400; font-size: 16px; max-width: 100%; box-sizing: border-box ! important; word-wrap: break-word ! important; color: rgb(62, 62, 62); font-variant: normal; letter-spacing: normal; line-height: 25px; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; background-color: rgb(255, 255, 255);\"><span style=\"font-family:Microsoft YaHei;font-size:12px;\">&nbsp;&nbsp;&nbsp;&nbsp; 我市支持和鼓励P2P网贷的创业模式，结合园区的发展把有资金并且有理财投资想法的个人或者企业，通过第三方平台牵线搭桥，使用信用贷款的方式将资金贷给其他有借款需求的人，加快资金的流动，同时提高了资金的使用率。通过P2P网贷将现代信用理念和风险管理手段有机结合，构建严谨的服务体系，有效的控制融资项目的风险性，是未来金融发展的良好的趋势。</span></h5><h5 style=\"margin: 0px; padding: 0px; font-style: normal; font-weight: 400; font-size: 16px; max-width: 100%; box-sizing: border-box ! important; word-wrap: break-word ! important; color: rgb(62, 62, 62); font-variant: normal; letter-spacing: normal; line-height: 25px; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; background-color: rgb(255, 255, 255);\"><span style=\"font-family:Microsoft YaHei;font-size:12px;\">&nbsp;&nbsp;&nbsp;&nbsp; 随着深圳市转型升级以及吸收外资规模不断扩大，越来越多的中小科技企业落户，将产生更大的融资需求。太平洋理财平台的成立为中小微企业解决融资难的 问题，为广大老百姓提供了一个安全、收益相对较高的理财通道，这不仅能够产生巨大的社会效益，使市场参与者更为大众化，而且能有利推动互联网金融改革升 级，促进经济增长。</span></h5><p><span style=\"font-family:Microsoft YaHei;\"><img src=\"/upload/default/columnimg/20150112163133.png\" alt=\"\" /><br /></span></p>', '2015-01-12 16:32:34', null, null, 'to/article-1-20-60.htm');
INSERT INTO `article` VALUES ('61', '20', '深圳市“台湾城杯”2014年海峡两岸青年创新创业大赛', '1', '1', '<p><span style=\"font-size:9.0pt;\">&nbsp;&nbsp;&nbsp;&nbsp; 8</span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:9.0pt;\">月</span><span style=\"font-size:9.0pt;\">25</span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:9.0pt;\">日上午，广东省首个由共青团广东省委员会、广东省青年创业就业联合会授予的省级创业孵化基地</span><span style=\"font-size:9.0pt;\">——</span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:9.0pt;\">广东省</span><span style=\"font-size:9.0pt;\">“</span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:9.0pt;\">台湾城</span><span style=\"font-size:9.0pt;\">·</span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:9.0pt;\">深圳市站</span><span style=\"font-size:9.0pt;\">”</span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:9.0pt;\">海峡两岸青年创业孵化基地正式成立，这是全省首个面向台湾青年和当地青年的创业孵化基地。当天上午</span><span style=\"font-size:9.0pt;\">10</span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:9.0pt;\">点整，由深圳市副市长陈宣群、广东青年就业创业联合会秘书长李颂国、省台办交流处处长刘小青、团深圳市委书记唐莹等出席了揭牌仪式；同时</span><span style=\"font-size:9.0pt;\">2014</span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:9.0pt;\">年海峡两岸青年创新创业大赛“台湾城杯<strong><span style=\"font-family:\'微软雅黑\',\'sans-serif\';\">·</span></strong>深圳市站”正式启航。</span></p><p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:9.0pt;\">&nbsp;&nbsp;&nbsp;&nbsp; 活动得到深圳市、台湾两地青年的积极响应，共有</span><span style=\"font-size:9.0pt;\">30</span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:9.0pt;\">名 创业青年参加大赛。大赛分为创意组及创业组，参赛青年带上创新、创意产品、商业计划书等相关资料，到参赛现场进行展示。大赛邀请了成功的创业精英、实力雄厚的投资人、企业评审专家加入评审团，旨在发现和挖掘本土优秀的创业项目和创新的创业人才，并为优秀创业青年提供创业帮扶。<span style=\"color:#E36C0A;\">积极响应本次创业大赛的宗旨，太平洋电子商务有限公司（太平洋理财</span></span><span style=\"font-size:9.0pt;\"><a href=\"http://www.cdbdai.com/\"><span style=\"color:#E36C0A;\">www.cdbdai.com</span></a></span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';color:#E36C0A;font-size:9.0pt;\">）也参加了创业组的比赛，希望给台湾及深圳市的创业者们提供一种新的融资渠道，有效的解决创业者融资难的问题。</span></p><p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:9.0pt;\">&nbsp;&nbsp;&nbsp;&nbsp; 在比赛中，太平洋理财法人王永从</span><span style=\"font-size:9.0pt;\">P2P</span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:9.0pt;\">行业背景、团队介绍、产品介绍等六个方面对太平洋理财平台的创业历程进行阐述，并着重对</span><span style=\"font-size:9.0pt;\">P2P</span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:9.0pt;\">的运营模式进行了详细的介绍。太平洋理财做为深圳市第一家互联网金融投融资服务平台，其创新的运营模式及开阔的发展前景，让评委们及其他创业队伍感到眼前一亮，同时也获得了现场观众的一致肯定。比赛结束后，太平洋理财获得了本次大赛的“优秀项目奖”，并推报参加团省委</span><span style=\"font-size:9.0pt;\">9</span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:9.0pt;\">月</span><span style=\"font-size:9.0pt;\">7</span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:9.0pt;\">日举办的</span><span style=\"font-size:9.0pt;\">“</span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:9.0pt;\">南海<strong><span style=\"font-family:\'微软雅黑\',\'sans-serif\';\">·</span></strong>大沥杯</span><span style=\"font-size:9.0pt;\">”</span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:9.0pt;\">——</span><span style=\"color:red;font-size:9.0pt;\">2014</span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';color:red;font-size:9.0pt;\">广东青年创新创业大赛暨盐商杯中国青年创新创业大赛。</span></p><p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:9.0pt;\">&nbsp;&nbsp;&nbsp;&nbsp; 此次青年创业大赛之行，让我们有机会吸取其他优秀创业队伍的创业经验及想法，同时也是一次很好的对外宣传机会，让更多外界的人了解到</span><span style=\"font-size:9.0pt;\">P2P</span><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:9.0pt;\">的行业相比与传统金融行业的创新点和优势。</span></p><p><span style=\"font-family:\'微软雅黑\',\'sans-serif\';font-size:9.0pt;\"><img src=\"/upload/default/columnimg/20150112163655.JPG\" alt=\"\" /><img src=\"/upload/default/columnimg/20150112163702.JPG\" alt=\"\" /><img src=\"/upload/default/columnimg/20150112163706.JPG\" alt=\"\" /><br /></span></p>', '2015-01-12 16:37:52', null, null, 'to/article-1-20-61.htm');
INSERT INTO `article` VALUES ('62', '20', '开业活动结束公告', '1', '1', '<p><span style=\"font-size:12px;\">&nbsp; &nbsp;&nbsp; “庆开业，送大礼，您来我就送！”开业活动已经于2014年8月28日中午12点整圆满结束，感谢大家对太平洋理财的大力支持和参与！由于本次参与活动的人数较多，整个活动流程出现小瑕疵，给大家带来不便，敬请谅解！我们会认真听取广大客户朋友们的建议，在后续活动中进行改进，推出更多的活动来回馈大家的给力支持。活动中的“推荐好友，红包任你拿”和“浪漫七夕，翡翠传情”红包奖励将在三个工作日内发到您太平洋理财的账户，同时实物奖励将在五个工作日内由官方工作人员与您取得联系，并安排快递配送，请耐心等待！最后，祝大家财源滚滚，工作顺利，生活幸福！</span></p><p style=\"text-align:right;\"><span style=\"font-size:12px;\">&nbsp;</span></p><p style=\"text-align:right;\"><span style=\"font-size:12px;\">&nbsp; 深圳市太平洋电子商务有限公司（客服部）</span></p><p style=\"text-align:right;\"><span style=\"font-size:12px;\"><span style=\"font-size:12px;\"><span style=\"font-family:\'Microsoft YaHei\';line-height: 24px;\">客服热线：400-833-0758</span></span><br /></span></p><p style=\"text-align:right;\"><span style=\"font-size:12px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2014年8月28日</span></p><p></p>', '2015-01-12 16:46:59', null, null, 'to/article-1-20-62.htm');
INSERT INTO `article` VALUES ('63', '20', '情满中秋欢乐送，太平洋豪礼乐翻天', '1', '1', '<div><p style=\"text-align:center;\">&nbsp;<a href=\"http://www.cdbdai.com/\">太平洋理财  http://www.cdbdai.com/</a></p></div><p>&nbsp;&nbsp;&nbsp;&nbsp; 今年的九月是一个感恩的季节，一年一度的中秋佳节马上就要来临了，您准备好回家团聚了吗？在外工作的您有多久没有见过年迈的老母亲，您有多久没有回过那熟悉的家乡？也许时时刻刻您都想着要回家乡看望生您的父母，但是由于生活、工作的繁忙只能在心里默默的许愿下次一定回去；既然不能回家，那就给您的亲人打个电话吧！太平洋理财现已准备好“百万话费”等您来领取！（这么好的事，不要忘记将这个好消息通知您身边的小伙伴哦。）&nbsp;</p><p><strong>活动一：百万话费免费送（第一波）&nbsp;</strong></p><p>&nbsp;&nbsp;&nbsp;&nbsp; 在9月1日至9月30日活动期间，前500名新注册用户成功关注太平洋理财官方微信（太平洋电子商务）并绑定手机号码、银行卡、通过实名认证，我们将赠送您价值5元话费；新老客户满足以下累计投资金额同样可获得百万话费。&nbsp;（需要找客服登记）</p><p><img src=\"/upload/default/columnimg/20150112164936.png\" alt=\"\" /><br /></p><p><strong>活动二：续投有奖&nbsp;</strong></p><p>&nbsp;&nbsp;&nbsp;&nbsp; 在9月1日至9月30日活动期间，成功回款的VIP客户不提现，在同一个标内同一个ID续投金额大于等于一万元，可获得续投金额的千分之一奖励。（需要找客服登记）&nbsp;</p><p><strong>活动三：无敌幸运星，欢乐大乐透&nbsp;</strong></p><p>&nbsp;&nbsp;&nbsp;&nbsp; 在9月1日至9月30日活动期间，新老客户同一个ID同一个标内，累计投资满3000元，即可向在线客服免费领取一个幸运中奖号码，累计投资满8000元可免费领取两个幸运中奖号码，具体规则如下：</p><p>1、获奖规则为：客户抽取幸运号码，以中国体育彩票活动“天天体彩，大乐透“中公布的号码为中奖号码，抽到中奖号码的客户不分红、蓝球即可获得由本平台送出的38元现金奖励。</p><p>2、客户索取号码规则为：颜色+号码，红球1-35号，篮球1-12号，每期活动客户最多可选择两个幸运号码，每个号码每期只能领取一次，先到先得。&nbsp;</p><p>3、如投标符合选号条件没有及时跟客服联系登记您的幸运抽奖号码则视为自动放弃抽奖机会。&nbsp;</p><p>4、开奖时间为每周一、三、六晚，每周三期，CCTV－5《天天体彩》21:50～22:00播出开奖节目。&nbsp;</p><p>5、所有幸运号码选完即开奖，开奖日期为最近一期大乐透。中奖奖金在官方公布中奖名单后三个工作日内充值到您太平洋理财的账号内。&nbsp;</p><p><strong>注意事项：&nbsp;</strong></p><p>1、太平洋理财官方微信号：太平洋电子商务（或者搜索：cdbdai）。&nbsp;</p><p>2、注册流程引导图：</p><p><img src=\"/upload/default/columnimg/20150112164925.png\" alt=\"\" /><br /></p><p>3、参与活动一的客户，需要找在线客服登记，活动结束后三个工作日充值到您太平洋理财账户绑定的手机内；一个手机号码只限参与一次。&nbsp;</p><p>4、参与活动二的客户，需要找在线客服登记，活动结束后三个工作日内充值到您太平洋理财的账户内；&nbsp;</p><p>5、在活动期间，如规则有所调整，以本平台公布的最新公告或公告刷新的内容为准，恕不再另外单独向用户进行提醒。&nbsp;</p><p>6、本次活动的最终解释权归深圳市太平洋电子商务有限公司所有。&nbsp;</p><p>&nbsp;</p><p style=\"text-align:right;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;深圳市太平洋电子商务有限公司</p><p style=\"text-align:right;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;二〇一四年八月二十八日</p>', '2015-01-12 16:50:33', null, null, 'to/article-1-20-63.htm');
INSERT INTO `article` VALUES ('64', '20', '关于“情满中秋欢乐送，太平洋豪礼乐翻天”活动结束通知', '1', '1', '<p><span style=\"font-family:Microsoft YaHei;font-size:12px;\">各位尊敬的太平洋理财客户：</span></p><p><span style=\"font-family:Microsoft YaHei;font-size:12px;\">&nbsp;&nbsp;&nbsp;&nbsp; “情满中秋欢乐送，太平洋豪礼乐翻天”活动将于</span><span style=\"font-family:Microsoft YaHei;font-size:12px;\">2014年9月30日下午3点整圆满结束，“百万话费免费送”活动奖励的话费将在今天内充值到各位的手机，请注意查看手机短信，如有任何问题请咨询在线客服或者拨打客服热线：400-833-0758，感谢大家对本次活动的大力支持和参与！</span></p><p><span style=\"font-family:Microsoft YaHei;font-size:12px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 最后，祝大家财源滚滚，工作顺利，生活幸福！</span></p><p><span style=\"font-family:Microsoft YaHei;font-size:12px;\">&nbsp;</span></p><p align=\"right\"><span style=\"font-family:Microsoft YaHei;font-size:12px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;深圳市太平洋电子商务有限公司（客服部）</span></p><p style=\"text-align:right;\"><span style=\"font-family:Microsoft YaHei;font-size:12px;\">客服热线：400-833-0758</span></p><p align=\"right\"><span style=\"font-family:Microsoft YaHei;font-size:12px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2014年9月30日</span></p>', '2015-01-12 16:55:22', null, null, 'to/article-1-20-64.htm');
INSERT INTO `article` VALUES ('65', '20', '太平洋理财国庆放假工作安排通知', '1', '1', '<p>尊敬的太平洋理财会员：</p><p>&nbsp;&nbsp;&nbsp;&nbsp; 国庆长假即将来临，太平洋理财全体员工祝您国庆快乐！</p><p>&nbsp;&nbsp;&nbsp;&nbsp; 根据国务院对2014年节假日安排的通知，并结合我司实际情况，我司国庆期间将做如下安排：</p><p>1）10月1日至10月7日放假；（提现申请正常）。为了方便大家及时收款，建议您使用工商银行、招商银行、农业银行、交通银行提现。</p><p>2）假期前最后的审核时间为9月30日18:00，未处理放款将会在10月7日10；00之后放款。</p><p>3）国庆期间充值还款功能正常，请需到期还款的用户提前做好相应安排，以免造成不必要的损失。</p><p>金秋十月国庆至，送你十一种祝福：快乐、开心、平安、健康、甜蜜、美丽、魅力、成功、顺利、如意、幸福，世间所有的美好都送给你，愿你事业顺利，家庭幸福，爱情甜蜜，友情永伴，平安一生，国庆快乐！</p><p>感谢您对太平洋理财长久以来的支持！</p><p style=\"text-align:right;\" align=\"right\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;深圳市太平洋电子商务有限公司（客服部）</p><p style=\"text-align:right;\" align=\"right\">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 客服热线：400-833-0758</p><p style=\"text-align:right;\" align=\"right\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2014年9月30日</p>', '2015-01-12 16:57:57', null, null, 'to/article-1-20-65.htm');
INSERT INTO `article` VALUES ('66', '20', '太平洋理财系统升级公告', '1', '1', '<p><span style=\"font-size:12px;\">尊敬的用户：</span></p><p><span style=\"font-size:12px;\">您好！</span></p><p><span style=\"font-size:12px;\">&nbsp;&nbsp;&nbsp;&nbsp; 为提升网站运营质量，深圳市太平洋电子商务有限公司（以下简称“太平洋理财”）于近日采购了新的服务器，并重新对系统进行了部署和升级。</span></p><p><span style=\"font-size:12px;\">此次升级预计将于2014年10月7日上午9:00完成。在此过程中，由于系统调试个别用户可能会遇到网站无法登陆或还款失败导致逾期的问题。如果您在进行充值或还款操作的过程中遇到任何问题请直接联系太平洋理财客服人员，我们会在系统升级完成后第一时间为您解决。</span></p><p><span style=\"font-size:12px;\">&nbsp;&nbsp;&nbsp;&nbsp; 对于此次升级过程中给您造成的不便我们深表歉意！</span></p><p><span style=\"font-size:12px;\">&nbsp;&nbsp;&nbsp;&nbsp; 同时，感谢您在我们的发展过程中一直给予的帮助和支持！我们会不断努力完善为您提供更加优质的服务！</span></p><p><span style=\"font-size:12px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p style=\"text-align:right;\" align=\"right\"><span style=\"font-size:12px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;深圳太平洋金融信息咨询有限责任公司（客服部）</span></p><p style=\"text-align:right;\" align=\"right\"><span style=\"font-size:12px;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客服热线；400-833-0758</span></p><p style=\"text-align:right;\" align=\"right\"><span style=\"font-size:12px;\">　　　　　　　　　　　　　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2014年10月7日</span></p><p><span style=\"font-size:12px;\">&nbsp;</span></p>', '2015-01-12 16:59:56', null, null, 'to/article-1-20-66.htm');
INSERT INTO `article` VALUES ('67', '20', '【活动】迎新春，红包现金奖不停！', '1', '1', '<p><strong>活动一：注册有礼，VIP享不停！</strong><br />在2015年2月6日至2015年3月6日活动期间，前一千名新注册用户成功关注太平洋理财官方微信号（cdbdai/太平洋电子商务）并绑定手机号码、银行卡、通过实名认证和通过平台快速注册宝付账户，我们赠送您价值120元VIP一年(直接申请后系统自动赠送)。</p><p>结算时间：申请后系统自动发放</p><p><br /></p><p><strong></strong></p><p></p><p><strong>活动二：新手入门礼</strong></p><p><span style=\"font-size:12px;background:white;\">在</span><span style=\"font-size:12px;\"><span style=\"background:white;\">2015</span><span style=\"background:white;\">年</span><span style=\"background:white;\">2</span><span style=\"background:white;\">月</span><span style=\"background:white;\">6</span><span style=\"background:white;\">日至</span><span style=\"background:white;\">2015</span><span style=\"background:white;\">年</span><span style=\"background:white;\">3</span><span style=\"background:white;\">月</span><span style=\"background:white;\">6</span><span style=\"background:white;\">日活动期间，</span>关注太平洋理财官方微信号（cdbdai/太平洋电子商务）并绑定手机号码、银行卡、通过实名认证、和通过平台快速注册宝付账户。</span></p><p>新用户首次投资100-999，即送8元现金红包。</p><p>新用户首次投资1000-4999，即送18元现金红包。</p><p>新用户首次投资5000-9999，即送38元现金红包。</p><p>新用户首次投资10000以上，即送68元现金红包</p><p>（以上活动投资金额不可累加，每个新用户仅有一次机会）</p><p><strong>活动说明：</strong></p><p>参加活动二的用户必须关注太平洋理财官方微信号：太平洋电子商务（或者搜索：cdbdai）并发送您的太平洋理财用户名；</p><p>麻烦请按照活动规定的流程操作，如未按照流程操作则视为自动放弃活动奖励。</p><p><br /></p><p></p><p><strong>活动三&nbsp;、投标排名奖励活动</strong></p><p>在2015年2月6日至2015年3月6日活动期间，用户单标投标按时间先后排名前10名有现金红包奖励，奖励其投资金额的0.2%（前10名投资者ID不重复计算，投资奖励可累计）</p><p>&nbsp;</p><p><strong>注意事项：&nbsp;</strong><br />1、在活动二、活动三在结束后三个工作日内统计奖励的现金并发发放到您宝付的个人账户内的账户余额中。</p><p>可以登录宝付个人用户平台进行查询、提现。</p><p>宝付个人用户平台地址：<a href=\"https://my.baofoo.com/\">https://my.baofoo.com/</a></p><p><img src=\"/upload/default/columnimg/20150206103553.jpg\" alt=\"\" height=\"198\" width=\"614\" /><br /></p><p>2、太平洋理财官方微信号：太平洋电子商务（或者搜索：cdbdai）。&nbsp;</p><p>3、注册流程引导图：</p><p><img src=\"/upload/default/columnimg/20150206103620.png\" alt=\"\" /><br /></p><p>4、在活动期间，如规则有所调整，以本平台公布的最新公告或公告刷新的内容为准，恕不再另外单独向用户进行提醒。&nbsp;</p><p>5、本次活动的最终解释权归深圳市太平洋电子商务有限公司所有。 <br /></p><p align=\"right\">深圳市太平洋电子商务有限公司<br /></p><p align=\"right\">二〇一五年二月六日<br /></p><br />', '2015-02-06 11:11:16', null, null, 'to/article-1-20-67.htm');

-- ----------------------------
-- Table structure for `attachment`
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `originalName` varchar(255) DEFAULT NULL COMMENT '附件原始名称',
  `attachmentName` varchar(255) DEFAULT NULL COMMENT '附件名称',
  `attachmentType` int(11) DEFAULT NULL COMMENT 'attachmentType',
  `uploadTime` varchar(30) DEFAULT NULL COMMENT '上传时间',
  `adminuser_id` bigint(20) DEFAULT NULL COMMENT '上传人',
  `loansign_id` bigint(20) DEFAULT NULL COMMENT '标的编号',
  PRIMARY KEY (`id`),
  KEY `loansign_id` (`loansign_id`) USING BTREE,
  KEY `attachment_ibfk_1` (`adminuser_id`) USING BTREE,
  CONSTRAINT `attachment_ibfk_1` FOREIGN KEY (`adminuser_id`) REFERENCES `adminuser` (`id`),
  CONSTRAINT `attachment_ibfk_2` FOREIGN KEY (`loansign_id`) REFERENCES `loansign` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件表; InnoDB free: 8192 kB; (`adminuser_id`) REFER `tgp; InnoDB free: 8192 kB; (`';

-- ----------------------------
-- Records of attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `autointegral`
-- ----------------------------
DROP TABLE IF EXISTS `autointegral`;
CREATE TABLE `autointegral` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `predictintegral` int(11) NOT NULL COMMENT '预计积分',
  `realityintegral` int(11) unsigned NOT NULL COMMENT '实得积分',
  `loansign_id` bigint(11) DEFAULT NULL COMMENT '借款标编号',
  `repayment_id` bigint(11) DEFAULT NULL COMMENT '还款计划编号',
  `isover` int(11) DEFAULT NULL COMMENT '是否逾期(1逾期、0 按期）',
  `user_id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loansign_id` (`loansign_id`) USING BTREE,
  KEY `repayment_id` (`repayment_id`) USING BTREE,
  KEY `user_Id` (`user_id`) USING BTREE,
  CONSTRAINT `autointegral_ibfk_1` FOREIGN KEY (`loansign_id`) REFERENCES `loansign` (`id`),
  CONSTRAINT `autointegral_ibfk_2` FOREIGN KEY (`repayment_id`) REFERENCES `repaymentrecord` (`id`),
  CONSTRAINT `autointegral_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `userbasicsinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自动积分表; InnoDB free: 8192 kB; (`loansign_id`) REFER; InnoDB free: 8192 kB; (`loan';

-- ----------------------------
-- Records of autointegral
-- ----------------------------

-- ----------------------------
-- Table structure for `automatic`
-- ----------------------------
DROP TABLE IF EXISTS `automatic`;
CREATE TABLE `automatic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userbasicinfo_id` bigint(20) DEFAULT NULL,
  `pMerBillNo` varchar(50) DEFAULT NULL COMMENT '商户签约订单号',
  `pSigningDate` date DEFAULT NULL COMMENT '签约日期',
  `pIdentNo` varchar(30) DEFAULT NULL COMMENT '债权人证件号码',
  `pRealName` varchar(50) DEFAULT NULL COMMENT '债权人姓名',
  `pIpsAcctNo` varchar(50) DEFAULT NULL COMMENT '债权人IPS账号',
  `pValidType` varchar(2) DEFAULT NULL COMMENT '有效期类型',
  `pValidDate` date DEFAULT NULL COMMENT '有效期',
  `pTrdCycleType` varchar(2) DEFAULT NULL COMMENT '标的借款周期类型',
  `pSTrdCycleValue` int(4) DEFAULT NULL,
  `pETrdCycleValue` int(4) DEFAULT NULL COMMENT '借款周期最大值',
  `pSAmtQuota` decimal(12,2) DEFAULT NULL COMMENT '标的借款额度限额最小值',
  `pEAmtQuota` decimal(12,2) DEFAULT NULL COMMENT '标的借款额度限额最大值',
  `pSIRQuota` decimal(12,2) DEFAULT NULL COMMENT '标的利率限额最小值',
  `pEIRQuota` decimal(12,2) DEFAULT NULL COMMENT '标的利率限额最大值',
  `state` int(1) DEFAULT NULL COMMENT '状态：1：启用 2：停用',
  `entrytime` datetime DEFAULT NULL COMMENT '录入时间',
  `updatetime` datetime DEFAULT NULL COMMENT '修改时间',
  `pIpsAuthNo` varchar(50) DEFAULT NULL,
  `pP2PBillNo` varchar(50) DEFAULT NULL,
  `pMemo1` varchar(255) DEFAULT NULL,
  `pMemo2` varchar(255) DEFAULT NULL,
  `pMemo3` varchar(255) DEFAULT NULL,
  `pS2SUrl` varchar(255) DEFAULT NULL,
  `pWebUrl` varchar(255) DEFAULT NULL,
  `pIpsTime` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userbasicinfo_id` (`userbasicinfo_id`) USING BTREE,
  CONSTRAINT `automatic_ibfk_1` FOREIGN KEY (`userbasicinfo_id`) REFERENCES `userbasicsinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自动投标参数表; InnoDB free: 8192 kB; (`userbasicinfo; InnoDB free: 8192 kB; (`userbasi';

-- ----------------------------
-- Records of automatic
-- ----------------------------

-- ----------------------------
-- Table structure for `banktype`
-- ----------------------------
DROP TABLE IF EXISTS `banktype`;
CREATE TABLE `banktype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL COMMENT '银行名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='银行卡类型';

-- ----------------------------
-- Records of banktype
-- ----------------------------
INSERT INTO `banktype` VALUES ('1', '招商银行');
INSERT INTO `banktype` VALUES ('2', '中国银行');
INSERT INTO `banktype` VALUES ('3', '交通银行');
INSERT INTO `banktype` VALUES ('4', '平安银行');
INSERT INTO `banktype` VALUES ('5', '兴业银行');
INSERT INTO `banktype` VALUES ('6', '光大银行');
INSERT INTO `banktype` VALUES ('7', '华夏银行');
INSERT INTO `banktype` VALUES ('8', '中信银行');
INSERT INTO `banktype` VALUES ('9', '中国农业银行');
INSERT INTO `banktype` VALUES ('10', '中国工商银行');
INSERT INTO `banktype` VALUES ('11', '中国民生银行');
INSERT INTO `banktype` VALUES ('12', '深圳发展银行');
INSERT INTO `banktype` VALUES ('13', '广东发展银行');
INSERT INTO `banktype` VALUES ('14', '中国建设银行');
INSERT INTO `banktype` VALUES ('15', '上海浦东发展银行');
INSERT INTO `banktype` VALUES ('16', '中国储蓄邮政银行');
INSERT INTO `banktype` VALUES ('17', '其他银行');

-- ----------------------------
-- Table structure for `bank_rate`
-- ----------------------------
DROP TABLE IF EXISTS `bank_rate`;
CREATE TABLE `bank_rate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `during` varchar(30) NOT NULL,
  `rate` double NOT NULL,
  `time_update` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `during` (`during`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='银行利率表';

-- ----------------------------
-- Records of bank_rate
-- ----------------------------
INSERT INTO `bank_rate` VALUES ('1', '活期存款', '0.0035', '2014-02-25');
INSERT INTO `bank_rate` VALUES ('2', '三个月定期存款', '0.026', '2014-02-25');
INSERT INTO `bank_rate` VALUES ('3', '半年定期存款', '0.028', '2014-02-25');
INSERT INTO `bank_rate` VALUES ('4', '一年定期存款', '0.03', '2014-02-25');
INSERT INTO `bank_rate` VALUES ('5', '两年定期存款', '0.0375', '2014-02-25');
INSERT INTO `bank_rate` VALUES ('6', '三年定期存款', '0.0425', '2014-02-25');
INSERT INTO `bank_rate` VALUES ('7', '五年定期存款', '0.0475', '2014-02-25');

-- ----------------------------
-- Table structure for `banner`
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` int(20) DEFAULT NULL COMMENT '排序号',
  `picturename` varchar(30) DEFAULT NULL COMMENT '图片名称',
  `url` varchar(50) DEFAULT NULL COMMENT '链接地址',
  `imgurl` varchar(100) DEFAULT NULL COMMENT '图片路径',
  `places` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='banner图片表';

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('16', '1', '1111111', '', 'http://www.tpyjr.com.cn:80/upload/banner/20150213173928.JPG', null, '1');
INSERT INTO `banner` VALUES ('17', '2', '33333333', '', 'http://www.tpyjr.com.cn:80/upload/banner/20150213173936.JPG', null, '1');
INSERT INTO `banner` VALUES ('18', '3', '66666666', '', 'http://www.tpyjr.com.cn:80/upload/banner/20150213173948.JPG', null, '1');

-- ----------------------------
-- Table structure for `black_ip`
-- ----------------------------
DROP TABLE IF EXISTS `black_ip`;
CREATE TABLE `black_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL COMMENT '内容',
  `ip` varchar(15) DEFAULT NULL COMMENT 'iP',
  `lockTime` varchar(18) DEFAULT NULL COMMENT '锁定时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='黑名单ip';

-- ----------------------------
-- Records of black_ip
-- ----------------------------

-- ----------------------------
-- Table structure for `borrowersbase`
-- ----------------------------
DROP TABLE IF EXISTS `borrowersbase`;
CREATE TABLE `borrowersbase` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userbasicinfo_id` bigint(20) DEFAULT NULL COMMENT '会员信息',
  `addTime` varchar(50) DEFAULT NULL COMMENT '提交时间',
  `age` varchar(10) DEFAULT NULL COMMENT '年龄',
  `auditResult` int(11) DEFAULT NULL COMMENT '审核结果 1通过 0不通过',
  `auditStatus` int(11) DEFAULT NULL COMMENT '审核状态  1"未提交",2"未审核",3"正在审核",4"已审核"',
  `committime` varchar(50) DEFAULT NULL COMMENT '审核时间',
  `income` varchar(255) DEFAULT NULL COMMENT '月收入',
  `isCard` varchar(30) DEFAULT NULL COMMENT '身份证号',
  `marryStatus` varchar(10) DEFAULT NULL COMMENT '婚姻状态',
  `money` double(18,4) DEFAULT NULL COMMENT '申请的借款金额',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `qualifications` varchar(50) DEFAULT NULL COMMENT '最高学历',
  `realName` varchar(20) DEFAULT NULL COMMENT '真实姓名	',
  `remark` longtext COMMENT '个人描述',
  `sex` int(2) DEFAULT NULL COMMENT '性别[0:女,1:男]',
  `credit` int(11) DEFAULT NULL COMMENT '授信额度',
  `suminte` int(11) DEFAULT '0' COMMENT '用户积分总和',
  `apply_money` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `userbasicinfo_id` (`userbasicinfo_id`) USING BTREE,
  CONSTRAINT `borrowersbase_ibfk_1` FOREIGN KEY (`userbasicinfo_id`) REFERENCES `userbasicsinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='借款人基础信息表; InnoDB free: 8192 kB; (`userbasici; InnoDB free: 8192 kB; (`userbasici';

-- ----------------------------
-- Records of borrowersbase
-- ----------------------------
INSERT INTO `borrowersbase` VALUES ('1', '7', '2015-01-23 02:03:10', null, '1', '4', '2015-01-23 02:04:26', '5000以下', null, '已婚', null, '13527862661', '高中以下', null, '111111111111111111', '1', '1000000', '0', null);
INSERT INTO `borrowersbase` VALUES ('2', '13', '2015-01-23 18:51:00', null, '1', '4', '2015-01-23 18:51:11', '5000-10000', null, '已婚', null, '13826886985', '高中以下', null, '', '1', '10000000', '0', null);
INSERT INTO `borrowersbase` VALUES ('3', '15', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowersbase` VALUES ('4', '14', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowersbase` VALUES ('5', '16', '2015-01-28 15:02:02', null, '1', '4', '2015-01-28 15:02:19', '5000以下', null, '已婚', null, '18319322106', '高中以下', null, '', '1', '100000', '0', null);
INSERT INTO `borrowersbase` VALUES ('6', '22', '2015-01-28 15:02:28', null, '1', '4', '2015-01-28 15:02:55', '5000以下', null, '未婚', null, '18300172547', '大专或本科', null, '', '0', '100000', '0', null);
INSERT INTO `borrowersbase` VALUES ('7', '23', null, null, '1', '4', '2015-01-28 15:03:03', null, null, null, null, null, null, null, null, null, '100000', null, null);
INSERT INTO `borrowersbase` VALUES ('8', '24', null, null, '1', '4', '2015-01-28 15:06:04', null, null, null, null, null, null, null, null, null, '100000', null, null);
INSERT INTO `borrowersbase` VALUES ('9', '26', null, null, '1', '4', '2015-01-28 15:04:47', null, null, null, null, null, null, null, null, null, '100000', null, null);
INSERT INTO `borrowersbase` VALUES ('10', '21', null, null, '1', '4', '2015-01-28 15:24:27', null, null, null, null, null, null, null, null, null, '100000', null, null);
INSERT INTO `borrowersbase` VALUES ('11', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowersbase` VALUES ('12', '29', '2015-02-03 15:58:59', null, '1', '4', '2015-02-03 16:06:16', '50000以上', null, '已婚', null, '13450160221', '高中以下', null, '广东巨大重型机械有限公司法人，总经理', '1', '1000000', '0', null);
INSERT INTO `borrowersbase` VALUES ('13', '44', '2015-02-27 13:58:57', null, '0', '1', null, '10000-50000', null, '已婚', null, '15507586703', '大专或本科', null, '', '1', '0', '0', null);

-- ----------------------------
-- Table structure for `borrowerscompany`
-- ----------------------------
DROP TABLE IF EXISTS `borrowerscompany`;
CREATE TABLE `borrowerscompany` (
  `id` bigint(20) NOT NULL,
  `companyName` varchar(60) DEFAULT NULL COMMENT '单位名称',
  `companyPhone` varchar(20) DEFAULT NULL COMMENT '电话',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `workYear` varchar(50) DEFAULT NULL COMMENT '工作年限',
  `referenceMan` varchar(50) DEFAULT NULL COMMENT '证明人',
  `referencePhone` varchar(20) DEFAULT NULL COMMENT '证明人手机',
  `addTime` varchar(50) DEFAULT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  CONSTRAINT `borrowerscompany_ibfk_1` FOREIGN KEY (`id`) REFERENCES `borrowersbase` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='借款人单位资料; InnoDB free: 8192 kB; (`id`) REFER `t; InnoDB free: 8192 kB; (`id`) REF';

-- ----------------------------
-- Records of borrowerscompany
-- ----------------------------
INSERT INTO `borrowerscompany` VALUES ('1', '', '', '', '1年以下', '', '', '2015-01-23 02:12:59');
INSERT INTO `borrowerscompany` VALUES ('2', null, null, null, null, null, null, null);
INSERT INTO `borrowerscompany` VALUES ('3', null, null, null, null, null, null, null);
INSERT INTO `borrowerscompany` VALUES ('4', null, null, null, null, null, null, null);
INSERT INTO `borrowerscompany` VALUES ('5', '', '', '', '1年以下', '', '', '2015-01-28 15:02:07');
INSERT INTO `borrowerscompany` VALUES ('6', null, null, null, null, null, null, null);
INSERT INTO `borrowerscompany` VALUES ('7', null, null, null, null, null, null, null);
INSERT INTO `borrowerscompany` VALUES ('8', null, null, null, null, null, null, null);
INSERT INTO `borrowerscompany` VALUES ('9', null, null, null, null, null, null, null);
INSERT INTO `borrowerscompany` VALUES ('10', null, null, null, null, null, null, null);
INSERT INTO `borrowerscompany` VALUES ('11', null, null, null, null, null, null, null);
INSERT INTO `borrowerscompany` VALUES ('12', '', '', '', '10年以上', '', '', '2015-02-03 15:59:53');
INSERT INTO `borrowerscompany` VALUES ('13', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `borrowerscontact`
-- ----------------------------
DROP TABLE IF EXISTS `borrowerscontact`;
CREATE TABLE `borrowerscontact` (
  `id` bigint(20) NOT NULL,
  `newaddress` varchar(100) DEFAULT NULL COMMENT '现居住地址',
  `addressPhone` varchar(20) DEFAULT NULL COMMENT '住宅电话',
  `linkman1` varchar(20) DEFAULT NULL COMMENT '联系人1',
  `relation1` varchar(50) DEFAULT NULL COMMENT '关系1',
  `phone1` varchar(50) DEFAULT NULL COMMENT '手机号码1',
  `other1` varchar(400) DEFAULT NULL COMMENT '第一联系人的其它信息',
  `linkman2` varchar(50) DEFAULT NULL COMMENT '第二联系人',
  `relation2` varchar(20) DEFAULT NULL COMMENT '第二联系人关系',
  `phone2` varchar(20) DEFAULT NULL COMMENT '第二联系人电话',
  `other2` varchar(400) DEFAULT NULL COMMENT '第二联系人其它信息',
  `addTime` varchar(50) DEFAULT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  CONSTRAINT `borrowerscontact_ibfk_1` FOREIGN KEY (`id`) REFERENCES `borrowersbase` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='借款人联系方式; InnoDB free: 8192 kB; (`id`) REFER `t; InnoDB free: 8192 kB; (`id`) REF';

-- ----------------------------
-- Records of borrowerscontact
-- ----------------------------
INSERT INTO `borrowerscontact` VALUES ('1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowerscontact` VALUES ('2', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowerscontact` VALUES ('3', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowerscontact` VALUES ('4', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowerscontact` VALUES ('5', '', '', '', '家庭成员', '', '', '', '家庭成员', '', '', '2015-01-28 15:02:06');
INSERT INTO `borrowerscontact` VALUES ('6', '', '', '', '家庭成员', '', '', '', '家庭成员', '', '', '2015-01-28 15:02:36');
INSERT INTO `borrowerscontact` VALUES ('7', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowerscontact` VALUES ('8', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowerscontact` VALUES ('9', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowerscontact` VALUES ('10', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowerscontact` VALUES ('11', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowerscontact` VALUES ('12', '', '', '', '家庭成员', '', '', '', '家庭成员', '', '', '2015-02-03 15:59:11');
INSERT INTO `borrowerscontact` VALUES ('13', null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `borrowersfiles`
-- ----------------------------
DROP TABLE IF EXISTS `borrowersfiles`;
CREATE TABLE `borrowersfiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(200) DEFAULT NULL COMMENT '文件名称',
  `filePath` varchar(500) DEFAULT NULL COMMENT '文件路径',
  `fileType` varchar(500) DEFAULT NULL COMMENT '文件类型',
  `fileRemark` varchar(500) DEFAULT NULL COMMENT '文件说明',
  `addTime` varchar(50) DEFAULT NULL COMMENT '提交时间',
  `base_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `files_id_base` (`base_id`) USING BTREE,
  CONSTRAINT `borrowersfiles_ibfk_1` FOREIGN KEY (`base_id`) REFERENCES `borrowersbase` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='借款人上传文件图片信息; InnoDB free: 8192 kB; (`b; InnoDB free: 8192 kB; (`base_id`) REFER ';

-- ----------------------------
-- Records of borrowersfiles
-- ----------------------------
INSERT INTO `borrowersfiles` VALUES ('1', '20150123020422.jpg', '/user/7/20150123020422.jpg', '', '', '2015-01-23 02:04:22', '1');
INSERT INTO `borrowersfiles` VALUES ('2', '20150203160314.jpg', '/user/29/20150203160314.jpg', '', '', '2015-02-03 16:03:14', '12');
INSERT INTO `borrowersfiles` VALUES ('3', '20150203160332.jpg', '/user/29/20150203160332.jpg', '', '', '2015-02-03 16:03:32', '12');
INSERT INTO `borrowersfiles` VALUES ('4', '20150203160350.jpg', '/user/29/20150203160350.jpg', '', '', '2015-02-03 16:03:50', '12');
INSERT INTO `borrowersfiles` VALUES ('5', '20150203160359.jpg', '/user/29/20150203160359.jpg', '', '', '2015-02-03 16:03:59', '12');
INSERT INTO `borrowersfiles` VALUES ('6', '20150203160414.jpg', '/user/29/20150203160414.jpg', '', '', '2015-02-03 16:04:14', '12');
INSERT INTO `borrowersfiles` VALUES ('7', '20150203160433.jpg', '/user/29/20150203160433.jpg', '', '', '2015-02-03 16:04:33', '12');
INSERT INTO `borrowersfiles` VALUES ('8', '20150203160538.jpg', '/user/29/20150203160538.jpg', '', '', '2015-02-03 16:05:38', '12');
INSERT INTO `borrowersfiles` VALUES ('9', '20150203160601.jpg', '/user/29/20150203160601.jpg', '', '', '2015-02-03 16:06:01', '12');
INSERT INTO `borrowersfiles` VALUES ('10', '20150203160728.jpg', '/user/29/20150203160728.jpg', '', '', '2015-02-03 16:07:28', '12');

-- ----------------------------
-- Table structure for `borrowersfinanes`
-- ----------------------------
DROP TABLE IF EXISTS `borrowersfinanes`;
CREATE TABLE `borrowersfinanes` (
  `id` bigint(20) NOT NULL,
  `income` decimal(18,4) DEFAULT NULL COMMENT '月均收入',
  `incomeRemark` varchar(400) DEFAULT NULL COMMENT '收入构成描述',
  `pay` decimal(18,4) DEFAULT NULL COMMENT '月均支出',
  `payRemark` varchar(500) DEFAULT NULL COMMENT '支出构成描述',
  `housecondition` varchar(200) DEFAULT NULL COMMENT '住房条件',
  `propertyValue` decimal(18,4) DEFAULT NULL COMMENT '房产价值',
  `isbuycar` varchar(255) DEFAULT NULL COMMENT '是否购车',
  `carValue` decimal(18,4) DEFAULT NULL COMMENT '车辆价值',
  `companyName` varchar(200) DEFAULT NULL COMMENT '参股企业名称',
  `companyPayMoney` decimal(18,4) DEFAULT NULL COMMENT '参股企业出金额',
  `otherPropertyDescribe` varchar(800) DEFAULT NULL COMMENT '其它资产描述',
  `addTime` varchar(50) DEFAULT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`),
  CONSTRAINT `borrowersfinanes_ibfk_1` FOREIGN KEY (`id`) REFERENCES `borrowersbase` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='借款人财务情况; InnoDB free: 8192 kB; (`id`) REFER `t; InnoDB free: 8192 kB; (`id`) REF';

-- ----------------------------
-- Records of borrowersfinanes
-- ----------------------------
INSERT INTO `borrowersfinanes` VALUES ('1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowersfinanes` VALUES ('2', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowersfinanes` VALUES ('3', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowersfinanes` VALUES ('4', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowersfinanes` VALUES ('5', null, '', null, '', '有商品房', null, '是', null, '', null, '', '2015-01-28 15:02:11');
INSERT INTO `borrowersfinanes` VALUES ('6', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowersfinanes` VALUES ('7', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowersfinanes` VALUES ('8', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowersfinanes` VALUES ('9', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowersfinanes` VALUES ('10', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowersfinanes` VALUES ('11', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowersfinanes` VALUES ('12', null, '', null, '', '有商品房', null, '是', null, '', null, '', '2015-02-03 16:00:00');
INSERT INTO `borrowersfinanes` VALUES ('13', null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `borrowersothercontact`
-- ----------------------------
DROP TABLE IF EXISTS `borrowersothercontact`;
CREATE TABLE `borrowersothercontact` (
  `id` bigint(20) NOT NULL,
  `linkman1` varchar(50) DEFAULT NULL COMMENT '第一联保人',
  `relation1` varchar(50) DEFAULT NULL COMMENT '关系1',
  `phone1` varchar(20) DEFAULT NULL COMMENT '手机号码1',
  `linkman2` varchar(50) DEFAULT NULL COMMENT '第二联保人',
  `relation2` varchar(50) DEFAULT NULL COMMENT '关系2',
  `phone2` varchar(20) DEFAULT NULL COMMENT '手机号码2',
  `linkman3` varchar(50) DEFAULT NULL COMMENT '第三联保人',
  `relation3` varchar(50) DEFAULT NULL COMMENT '关系3',
  `phone3` varchar(20) DEFAULT NULL COMMENT '手机号码3',
  `addTime` varchar(50) DEFAULT NULL COMMENT '提交时间',
  `linkman4` varchar(50) DEFAULT NULL COMMENT '第四联保人',
  `phone4` varchar(20) DEFAULT NULL COMMENT '第四联保人电话',
  `relation4` varchar(50) DEFAULT NULL COMMENT '第四联保人关系',
  PRIMARY KEY (`id`),
  CONSTRAINT `borrowersothercontact_ibfk_1` FOREIGN KEY (`id`) REFERENCES `borrowersbase` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='借款人联保信息; InnoDB free: 8192 kB; (`id`) REFER `t; InnoDB free: 8192 kB; (`id`) REF';

-- ----------------------------
-- Records of borrowersothercontact
-- ----------------------------
INSERT INTO `borrowersothercontact` VALUES ('1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowersothercontact` VALUES ('2', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowersothercontact` VALUES ('3', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowersothercontact` VALUES ('4', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowersothercontact` VALUES ('5', '', '家庭成员', '', '', '家庭成员', '', null, null, null, '2015-01-28 15:02:13', null, null, null);
INSERT INTO `borrowersothercontact` VALUES ('6', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowersothercontact` VALUES ('7', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowersothercontact` VALUES ('8', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowersothercontact` VALUES ('9', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowersothercontact` VALUES ('10', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowersothercontact` VALUES ('11', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `borrowersothercontact` VALUES ('12', '', '家庭成员', '', '', '家庭成员', '', null, null, null, '2015-02-03 16:00:11', null, null, null);
INSERT INTO `borrowersothercontact` VALUES ('13', null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `borrowers_apply`
-- ----------------------------
DROP TABLE IF EXISTS `borrowers_apply`;
CREATE TABLE `borrowers_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `base_id` bigint(20) NOT NULL,
  `time` varchar(20) NOT NULL COMMENT '申请时间',
  `money` decimal(20,4) NOT NULL COMMENT '申请金额',
  `type` int(11) NOT NULL COMMENT '类型[0:助人贷,1:助企贷,2:企业群联保贷,3:投资人周转贷;]',
  `status` int(11) NOT NULL COMMENT '状态[0:审核中,1:已通过,2:未通过]',
  `remark` text COMMENT '备注',
  `state` int(11) DEFAULT '0',
  `user_id` bigint(20) NOT NULL,
  `refunway` varchar(20) NOT NULL COMMENT '还款方式',
  `borrowmonth` int(20) DEFAULT NULL COMMENT '借款期限',
  `behoof` varchar(500) DEFAULT NULL COMMENT '借款用途',
  `rate` decimal(20,4) DEFAULT NULL COMMENT '年利率',
  `cash` decimal(20,4) DEFAULT '0.0000' COMMENT '保证金',
  PRIMARY KEY (`id`),
  KEY `base_id_apply` (`base_id`) USING BTREE,
  CONSTRAINT `borrowers_apply_ibfk_1` FOREIGN KEY (`base_id`) REFERENCES `borrowersbase` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='借款申请表; InnoDB free: 8192 kB; (`base_id`) REFER `tg; InnoDB free: 8192 kB; (`base';

-- ----------------------------
-- Records of borrowers_apply
-- ----------------------------
INSERT INTO `borrowers_apply` VALUES ('1', '1', '2015-01-23 02:24:07', '1000.0000', '1', '1', '批量处理', '1', '7', '2', '3', '11111111111111', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('2', '1', '2015-01-23 08:55:24', '1000.0000', '2', '1', '批量处理', '1', '7', '2', '3', '1111111111111111111111111', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('3', '1', '2015-01-23 09:16:51', '1000.0000', '1', '1', '批量处理', '1', '7', '2', '3', '1111111111111111111111', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('4', '1', '2015-01-23 10:16:32', '1000.0000', '1', '1', '批量处理', '1', '7', '2', '3', '1111111111111111111111', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('5', '1', '2015-01-23 10:41:18', '1000.0000', '2', '1', '批量处理', '1', '7', '2', '3', '11111111111111111', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('6', '1', '2015-01-23 10:47:19', '1000.0000', '1', '1', '批量处理', '1', '7', '2', '3', '11111111111111', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('7', '1', '2015-01-23 10:47:19', '1000.0000', '1', '1', '批量处理', '1', '7', '2', '3', '11111111111111', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('8', '2', '2015-01-23 18:53:11', '50.0000', '1', '1', '批量处理', '0', '13', '2', '1', '测试正式环境测试正式环境', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('9', '2', '2015-01-23 18:57:59', '100.0000', '1', '1', '批量处理', '1', '13', '2', '1', '阿打发大水缸飞个梵蒂冈腹股沟管', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('10', '2', '2015-01-25 11:47:46', '100.0000', '1', '1', '批量处理', '1', '13', '2', '1', 'dfasdfasdgasdgfagafgdf', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('11', '2', '2015-01-27 14:17:51', '100.0000', '1', '1', '批量处理', '1', '13', '2', '1', '测试担保公司测试担保公司', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('12', '2', '2015-01-28 10:52:15', '100.0000', '1', '1', '批量处理', '1', '13', '2', '1', '测试流标测试流标测试流标', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('13', '6', '2015-01-28 15:21:32', '100.0000', '1', '1', '批量处理', '1', '22', '2', '1', '我 要借款12312323', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('14', '5', '2015-01-28 15:21:51', '100.0000', '1', '1', '批量处理', '1', '16', '2', '1', '15215125262156156156156156156233333', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('15', '8', '2015-01-28 15:23:31', '100.0000', '1', '1', '批量处理', '1', '24', '2', '1', '太平洋理财我要借款你懂的哈哈', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('16', '7', '2015-01-28 15:23:36', '100.0000', '1', '1', '批量处理', '1', '23', '2', '1', '太平洋理财我要借款你懂得', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('17', '9', '2015-01-28 15:25:09', '100.0000', '1', '1', '批量处理', '1', '26', '3', '1', '太平洋理财我要借款买衣服啦', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('18', '2', '2015-01-28 15:35:32', '100.0000', '1', '2', '批量处理', '0', '13', '2', '1', 'sdfdfghdghfghfgasgffghfgf', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('19', '10', '2015-01-28 15:42:23', '100.0000', '1', '2', '批量处理', '0', '21', '2', '1', '等钱洗等钱洗等钱洗等钱洗等钱洗等钱洗等钱洗等钱洗等钱洗等钱洗等钱洗等钱洗', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('20', '2', '2015-01-28 16:10:22', '200.0000', '1', '1', '批量处理', '1', '13', '2', '1', '测试多人投资满标放款', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('21', '2', '2015-01-28 16:13:17', '200.0000', '1', '1', '批量处理', '1', '13', '2', '1', '测试多人投标流标情况', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('22', '2', '2015-01-28 16:15:33', '100.0000', '1', '1', '批量处理', '1', '13', '2', '1', '测试一人投标满标放款还款情况', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('23', '2', '2015-01-29 09:40:48', '100.0000', '1', '1', '批量处理', '1', '13', '2', '1', '测试一人投标流标情况', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('24', '2', '2015-01-29 09:48:55', '200.0000', '1', '1', '批量处理', '1', '13', '2', '1', '测试多人投标流标情况', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('25', '2', '2015-01-29 16:36:56', '100.0000', '1', '1', '批量处理', '1', '13', '2', '1', '测试借款期限测试借款期限', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('26', '2', '2015-01-29 16:49:37', '100.0000', '1', '1', '批量处理', '1', '13', '2', '1', '测试添加标的标的重复情况', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('27', '2', '2015-01-30 08:36:48', '100.0000', '1', '1', '批量处理', '1', '13', '2', '1', '测试招标期限测试招标期限', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('28', '2', '2015-01-30 08:44:16', '100.0000', '1', '1', '批量处理', '1', '13', '2', '1', '测试招标期限测试招标期限', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('29', '2', '2015-01-30 10:37:30', '100.0000', '1', '1', '批量处理', '1', '13', '2', '1', '测试还款提示框服务费', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('30', '2', '2015-01-30 11:36:03', '100.0000', '1', '1', '批量处理', '1', '13', '2', '1', '测试还款提示框的情况', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('31', '2', '2015-01-30 15:06:28', '200.0000', '1', '1', '批量处理', '1', '13', '2', '1', '测试多人投标流标情况', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('32', '2', '2015-01-30 15:07:47', '100.0000', '1', '1', '批量处理', '1', '13', '2', '1', '测试一人投标流标情况', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('33', '12', '2015-02-03 16:24:30', '100000.0000', '1', '1', '批量处理', '1', '29', '2', '3', '招标项目中标需要资金采购材料', '0.1560', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('34', '2', '2015-02-06 14:13:04', '100.0000', '1', '1', '批量处理', '1', '13', '2', '1', 'dfsdgafgafgdfgasdfadsf', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('35', '1', '2015-02-25 16:30:49', '120.0000', '1', '1', '批量处理', '0', '7', '1', '3', '用于公司短期资金周转', '0.1200', '0.0000');
INSERT INTO `borrowers_apply` VALUES ('36', '1', '2015-02-25 17:01:34', '10000.0000', '1', '1', '批量处理', '1', '7', '1', '9', '用于公司短期内资金周转', '0.1200', '0.0000');

-- ----------------------------
-- Table structure for `city`
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `city_id` bigint(20) DEFAULT NULL,
  `province_id` bigint(20) DEFAULT NULL COMMENT '所属省',
  `name` varchar(60) DEFAULT NULL COMMENT '市名',
  PRIMARY KEY (`id`),
  KEY `province_id` (`province_id`) USING BTREE,
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=392 DEFAULT CHARSET=utf8 COMMENT='城市表; InnoDB free: 8192 kB; (`province_id`) REFER `tgp2; InnoDB free: 8192 kB; (`';

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '1', '1', '北京市');
INSERT INTO `city` VALUES ('2', '1', '2', '天津市');
INSERT INTO `city` VALUES ('3', '1', '3', '上海市');
INSERT INTO `city` VALUES ('4', '1', '4', '重庆市');
INSERT INTO `city` VALUES ('5', '1', '5', '石家庄市');
INSERT INTO `city` VALUES ('6', '2', '5', '唐山市');
INSERT INTO `city` VALUES ('7', '3', '5', '秦皇岛市');
INSERT INTO `city` VALUES ('8', '4', '5', '邯郸市');
INSERT INTO `city` VALUES ('9', '5', '5', '邢台市');
INSERT INTO `city` VALUES ('10', '6', '5', '保定市');
INSERT INTO `city` VALUES ('11', '7', '5', '张家口市');
INSERT INTO `city` VALUES ('12', '8', '5', '承德市');
INSERT INTO `city` VALUES ('13', '9', '5', '沧州市');
INSERT INTO `city` VALUES ('14', '10', '5', '廊坊市');
INSERT INTO `city` VALUES ('15', '11', '5', '衡水市');
INSERT INTO `city` VALUES ('16', '1', '6', '太原市');
INSERT INTO `city` VALUES ('17', '2', '6', '大同市');
INSERT INTO `city` VALUES ('18', '3', '6', '阳泉市');
INSERT INTO `city` VALUES ('19', '4', '6', '长治市');
INSERT INTO `city` VALUES ('20', '5', '6', '晋城市');
INSERT INTO `city` VALUES ('21', '6', '6', '朔州市');
INSERT INTO `city` VALUES ('22', '7', '6', '晋中市');
INSERT INTO `city` VALUES ('23', '8', '6', '运城市');
INSERT INTO `city` VALUES ('24', '9', '6', '忻州市');
INSERT INTO `city` VALUES ('25', '10', '6', '临汾市');
INSERT INTO `city` VALUES ('26', '11', '6', '吕梁市');
INSERT INTO `city` VALUES ('27', '1', '7', '台北市');
INSERT INTO `city` VALUES ('28', '2', '7', '高雄市');
INSERT INTO `city` VALUES ('29', '3', '7', '基隆市');
INSERT INTO `city` VALUES ('30', '4', '7', '台中市');
INSERT INTO `city` VALUES ('31', '5', '7', '台南市');
INSERT INTO `city` VALUES ('32', '6', '7', '新竹市');
INSERT INTO `city` VALUES ('33', '7', '7', '嘉义市');
INSERT INTO `city` VALUES ('34', '8', '7', '台北县');
INSERT INTO `city` VALUES ('35', '9', '7', '宜兰县');
INSERT INTO `city` VALUES ('36', '10', '7', '桃园县');
INSERT INTO `city` VALUES ('37', '11', '7', '新竹县');
INSERT INTO `city` VALUES ('38', '12', '7', '苗栗县');
INSERT INTO `city` VALUES ('39', '13', '7', '台中县');
INSERT INTO `city` VALUES ('40', '14', '7', '彰化县');
INSERT INTO `city` VALUES ('41', '15', '7', '南投县');
INSERT INTO `city` VALUES ('42', '16', '7', '云林县');
INSERT INTO `city` VALUES ('43', '17', '7', '嘉义县');
INSERT INTO `city` VALUES ('44', '18', '7', '台南县');
INSERT INTO `city` VALUES ('45', '19', '7', '高雄县');
INSERT INTO `city` VALUES ('46', '20', '7', '屏东县');
INSERT INTO `city` VALUES ('47', '21', '7', '澎湖县');
INSERT INTO `city` VALUES ('48', '22', '7', '台东县');
INSERT INTO `city` VALUES ('49', '23', '7', '花莲县');
INSERT INTO `city` VALUES ('50', '1', '8', '沈阳市');
INSERT INTO `city` VALUES ('51', '2', '8', '大连市');
INSERT INTO `city` VALUES ('52', '3', '8', '鞍山市');
INSERT INTO `city` VALUES ('53', '4', '8', '抚顺市');
INSERT INTO `city` VALUES ('54', '5', '8', '本溪市');
INSERT INTO `city` VALUES ('55', '6', '8', '丹东市');
INSERT INTO `city` VALUES ('56', '7', '8', '锦州市');
INSERT INTO `city` VALUES ('57', '8', '8', '营口市');
INSERT INTO `city` VALUES ('58', '9', '8', '阜新市');
INSERT INTO `city` VALUES ('59', '10', '8', '辽阳市');
INSERT INTO `city` VALUES ('60', '11', '8', '盘锦市');
INSERT INTO `city` VALUES ('61', '12', '8', '铁岭市');
INSERT INTO `city` VALUES ('62', '13', '8', '朝阳市');
INSERT INTO `city` VALUES ('63', '14', '8', '葫芦岛市');
INSERT INTO `city` VALUES ('64', '1', '9', '长春市');
INSERT INTO `city` VALUES ('65', '2', '9', '吉林市');
INSERT INTO `city` VALUES ('66', '3', '9', '四平市');
INSERT INTO `city` VALUES ('67', '4', '9', '辽源市');
INSERT INTO `city` VALUES ('68', '5', '9', '通化市');
INSERT INTO `city` VALUES ('69', '6', '9', '白山市');
INSERT INTO `city` VALUES ('70', '7', '9', '松原市');
INSERT INTO `city` VALUES ('71', '8', '9', '白城市');
INSERT INTO `city` VALUES ('72', '9', '9', '延边朝鲜族自治州');
INSERT INTO `city` VALUES ('73', '1', '10', '哈尔滨市');
INSERT INTO `city` VALUES ('74', '2', '10', '齐齐哈尔市');
INSERT INTO `city` VALUES ('75', '3', '10', '鹤岗市');
INSERT INTO `city` VALUES ('76', '4', '10', '双鸭山市');
INSERT INTO `city` VALUES ('77', '5', '10', '鸡西市');
INSERT INTO `city` VALUES ('78', '6', '10', '大庆市');
INSERT INTO `city` VALUES ('79', '7', '10', '伊春市');
INSERT INTO `city` VALUES ('80', '8', '10', '牡丹江市');
INSERT INTO `city` VALUES ('81', '9', '10', '佳木斯市');
INSERT INTO `city` VALUES ('82', '10', '10', '七台河市');
INSERT INTO `city` VALUES ('83', '11', '10', '黑河市');
INSERT INTO `city` VALUES ('84', '12', '10', '绥化市');
INSERT INTO `city` VALUES ('85', '13', '10', '大兴安岭地区');
INSERT INTO `city` VALUES ('86', '1', '11', '南京市');
INSERT INTO `city` VALUES ('87', '2', '11', '无锡市');
INSERT INTO `city` VALUES ('88', '3', '11', '徐州市');
INSERT INTO `city` VALUES ('89', '4', '11', '常州市');
INSERT INTO `city` VALUES ('90', '5', '11', '苏州市');
INSERT INTO `city` VALUES ('91', '6', '11', '南通市');
INSERT INTO `city` VALUES ('92', '7', '11', '连云港市');
INSERT INTO `city` VALUES ('93', '8', '11', '淮安市');
INSERT INTO `city` VALUES ('94', '9', '11', '盐城市');
INSERT INTO `city` VALUES ('95', '10', '11', '扬州市');
INSERT INTO `city` VALUES ('96', '11', '11', '镇江市');
INSERT INTO `city` VALUES ('97', '12', '11', '泰州市');
INSERT INTO `city` VALUES ('98', '13', '11', '宿迁市');
INSERT INTO `city` VALUES ('99', '1', '12', '杭州市');
INSERT INTO `city` VALUES ('100', '2', '12', '宁波市');
INSERT INTO `city` VALUES ('101', '3', '12', '温州市');
INSERT INTO `city` VALUES ('102', '4', '12', '嘉兴市');
INSERT INTO `city` VALUES ('103', '5', '12', '湖州市');
INSERT INTO `city` VALUES ('104', '6', '12', '绍兴市');
INSERT INTO `city` VALUES ('105', '7', '12', '金华市');
INSERT INTO `city` VALUES ('106', '8', '12', '衢州市');
INSERT INTO `city` VALUES ('107', '9', '12', '舟山市');
INSERT INTO `city` VALUES ('108', '10', '12', '台州市');
INSERT INTO `city` VALUES ('109', '11', '12', '丽水市');
INSERT INTO `city` VALUES ('110', '1', '13', '合肥市');
INSERT INTO `city` VALUES ('111', '2', '13', '芜湖市');
INSERT INTO `city` VALUES ('112', '3', '13', '蚌埠市');
INSERT INTO `city` VALUES ('113', '4', '13', '淮南市');
INSERT INTO `city` VALUES ('114', '5', '13', '马鞍山市');
INSERT INTO `city` VALUES ('115', '6', '13', '淮北市');
INSERT INTO `city` VALUES ('116', '7', '13', '铜陵市');
INSERT INTO `city` VALUES ('117', '8', '13', '安庆市');
INSERT INTO `city` VALUES ('118', '9', '13', '黄山市');
INSERT INTO `city` VALUES ('119', '10', '13', '滁州市');
INSERT INTO `city` VALUES ('120', '11', '13', '阜阳市');
INSERT INTO `city` VALUES ('121', '12', '13', '宿州市');
INSERT INTO `city` VALUES ('122', '13', '13', '巢湖市');
INSERT INTO `city` VALUES ('123', '14', '13', '六安市');
INSERT INTO `city` VALUES ('124', '15', '13', '亳州市');
INSERT INTO `city` VALUES ('125', '16', '13', '池州市');
INSERT INTO `city` VALUES ('126', '17', '13', '宣城市');
INSERT INTO `city` VALUES ('127', '1', '14', '福州市');
INSERT INTO `city` VALUES ('128', '2', '14', '厦门市');
INSERT INTO `city` VALUES ('129', '3', '14', '莆田市');
INSERT INTO `city` VALUES ('130', '4', '14', '三明市');
INSERT INTO `city` VALUES ('131', '5', '14', '泉州市');
INSERT INTO `city` VALUES ('132', '6', '14', '漳州市');
INSERT INTO `city` VALUES ('133', '7', '14', '南平市');
INSERT INTO `city` VALUES ('134', '8', '14', '龙岩市');
INSERT INTO `city` VALUES ('135', '9', '14', '宁德市');
INSERT INTO `city` VALUES ('136', '1', '15', '南昌市');
INSERT INTO `city` VALUES ('137', '2', '15', '景德镇市');
INSERT INTO `city` VALUES ('138', '3', '15', '萍乡市');
INSERT INTO `city` VALUES ('139', '4', '15', '九江市');
INSERT INTO `city` VALUES ('140', '5', '15', '新余市');
INSERT INTO `city` VALUES ('141', '6', '15', '鹰潭市');
INSERT INTO `city` VALUES ('142', '7', '15', '赣州市');
INSERT INTO `city` VALUES ('143', '8', '15', '吉安市');
INSERT INTO `city` VALUES ('144', '9', '15', '宜春市');
INSERT INTO `city` VALUES ('145', '10', '15', '抚州市');
INSERT INTO `city` VALUES ('146', '11', '15', '上饶市');
INSERT INTO `city` VALUES ('147', '1', '16', '济南市');
INSERT INTO `city` VALUES ('148', '2', '16', '青岛市');
INSERT INTO `city` VALUES ('149', '3', '16', '淄博市');
INSERT INTO `city` VALUES ('150', '4', '16', '枣庄市');
INSERT INTO `city` VALUES ('151', '5', '16', '东营市');
INSERT INTO `city` VALUES ('152', '6', '16', '烟台市');
INSERT INTO `city` VALUES ('153', '7', '16', '潍坊市');
INSERT INTO `city` VALUES ('154', '8', '16', '济宁市');
INSERT INTO `city` VALUES ('155', '9', '16', '泰安市');
INSERT INTO `city` VALUES ('156', '10', '16', '威海市');
INSERT INTO `city` VALUES ('157', '11', '16', '日照市');
INSERT INTO `city` VALUES ('158', '12', '16', '莱芜市');
INSERT INTO `city` VALUES ('159', '13', '16', '临沂市');
INSERT INTO `city` VALUES ('160', '14', '16', '德州市');
INSERT INTO `city` VALUES ('161', '15', '16', '聊城市');
INSERT INTO `city` VALUES ('162', '16', '16', '滨州市');
INSERT INTO `city` VALUES ('163', '17', '16', '菏泽市');
INSERT INTO `city` VALUES ('164', '1', '17', '郑州市');
INSERT INTO `city` VALUES ('165', '2', '17', '开封市');
INSERT INTO `city` VALUES ('166', '3', '17', '洛阳市');
INSERT INTO `city` VALUES ('167', '4', '17', '平顶山市');
INSERT INTO `city` VALUES ('168', '5', '17', '安阳市');
INSERT INTO `city` VALUES ('169', '6', '17', '鹤壁市');
INSERT INTO `city` VALUES ('170', '7', '17', '新乡市');
INSERT INTO `city` VALUES ('171', '8', '17', '焦作市');
INSERT INTO `city` VALUES ('172', '9', '17', '濮阳市');
INSERT INTO `city` VALUES ('173', '10', '17', '许昌市');
INSERT INTO `city` VALUES ('174', '11', '17', '漯河市');
INSERT INTO `city` VALUES ('175', '12', '17', '三门峡市');
INSERT INTO `city` VALUES ('176', '13', '17', '南阳市');
INSERT INTO `city` VALUES ('177', '14', '17', '商丘市');
INSERT INTO `city` VALUES ('178', '15', '17', '信阳市');
INSERT INTO `city` VALUES ('179', '16', '17', '周口市');
INSERT INTO `city` VALUES ('180', '17', '17', '驻马店市');
INSERT INTO `city` VALUES ('181', '18', '17', '济源市');
INSERT INTO `city` VALUES ('182', '1', '18', '武汉市');
INSERT INTO `city` VALUES ('183', '2', '18', '黄石市');
INSERT INTO `city` VALUES ('184', '3', '18', '十堰市');
INSERT INTO `city` VALUES ('185', '4', '18', '荆州市');
INSERT INTO `city` VALUES ('186', '5', '18', '宜昌市');
INSERT INTO `city` VALUES ('187', '6', '18', '襄樊市');
INSERT INTO `city` VALUES ('188', '7', '18', '鄂州市');
INSERT INTO `city` VALUES ('189', '8', '18', '荆门市');
INSERT INTO `city` VALUES ('190', '9', '18', '孝感市');
INSERT INTO `city` VALUES ('191', '10', '18', '黄冈市');
INSERT INTO `city` VALUES ('192', '11', '18', '咸宁市');
INSERT INTO `city` VALUES ('193', '12', '18', '随州市');
INSERT INTO `city` VALUES ('194', '13', '18', '仙桃市');
INSERT INTO `city` VALUES ('195', '14', '18', '天门市');
INSERT INTO `city` VALUES ('196', '15', '18', '潜江市');
INSERT INTO `city` VALUES ('197', '16', '18', '神农架林区');
INSERT INTO `city` VALUES ('198', '17', '18', '恩施土家族苗族自治州');
INSERT INTO `city` VALUES ('199', '1', '19', '长沙市');
INSERT INTO `city` VALUES ('200', '2', '19', '株洲市');
INSERT INTO `city` VALUES ('201', '3', '19', '湘潭市');
INSERT INTO `city` VALUES ('202', '4', '19', '衡阳市');
INSERT INTO `city` VALUES ('203', '5', '19', '邵阳市');
INSERT INTO `city` VALUES ('204', '6', '19', '岳阳市');
INSERT INTO `city` VALUES ('205', '7', '19', '常德市');
INSERT INTO `city` VALUES ('206', '8', '19', '张家界市');
INSERT INTO `city` VALUES ('207', '9', '19', '益阳市');
INSERT INTO `city` VALUES ('208', '10', '19', '郴州市');
INSERT INTO `city` VALUES ('209', '11', '19', '永州市');
INSERT INTO `city` VALUES ('210', '12', '19', '怀化市');
INSERT INTO `city` VALUES ('211', '13', '19', '娄底市');
INSERT INTO `city` VALUES ('212', '14', '19', '湘西土家族苗族自治州');
INSERT INTO `city` VALUES ('213', '1', '20', '广州市');
INSERT INTO `city` VALUES ('214', '2', '20', '深圳市');
INSERT INTO `city` VALUES ('215', '3', '20', '珠海市');
INSERT INTO `city` VALUES ('216', '4', '20', '汕头市');
INSERT INTO `city` VALUES ('217', '5', '20', '韶关市');
INSERT INTO `city` VALUES ('218', '6', '20', '佛山市');
INSERT INTO `city` VALUES ('219', '7', '20', '江门市');
INSERT INTO `city` VALUES ('220', '8', '20', '湛江市');
INSERT INTO `city` VALUES ('221', '9', '20', '茂名市');
INSERT INTO `city` VALUES ('222', '10', '20', '深圳市');
INSERT INTO `city` VALUES ('223', '11', '20', '惠州市');
INSERT INTO `city` VALUES ('224', '12', '20', '梅州市');
INSERT INTO `city` VALUES ('225', '13', '20', '汕尾市');
INSERT INTO `city` VALUES ('226', '14', '20', '河源市');
INSERT INTO `city` VALUES ('227', '15', '20', '阳江市');
INSERT INTO `city` VALUES ('228', '16', '20', '清远市');
INSERT INTO `city` VALUES ('229', '17', '20', '东莞市');
INSERT INTO `city` VALUES ('230', '18', '20', '中山市');
INSERT INTO `city` VALUES ('231', '19', '20', '潮州市');
INSERT INTO `city` VALUES ('232', '20', '20', '揭阳市');
INSERT INTO `city` VALUES ('233', '21', '20', '云浮市');
INSERT INTO `city` VALUES ('234', '1', '21', '兰州市');
INSERT INTO `city` VALUES ('235', '2', '21', '金昌市');
INSERT INTO `city` VALUES ('236', '3', '21', '白银市');
INSERT INTO `city` VALUES ('237', '4', '21', '天水市');
INSERT INTO `city` VALUES ('238', '5', '21', '嘉峪关市');
INSERT INTO `city` VALUES ('239', '6', '21', '武威市');
INSERT INTO `city` VALUES ('240', '7', '21', '张掖市');
INSERT INTO `city` VALUES ('241', '8', '21', '平凉市');
INSERT INTO `city` VALUES ('242', '9', '21', '酒泉市');
INSERT INTO `city` VALUES ('243', '10', '21', '庆阳市');
INSERT INTO `city` VALUES ('244', '11', '21', '定西市');
INSERT INTO `city` VALUES ('245', '12', '21', '陇南市');
INSERT INTO `city` VALUES ('246', '13', '21', '临夏回族自治州');
INSERT INTO `city` VALUES ('247', '14', '21', '甘南藏族自治州');
INSERT INTO `city` VALUES ('248', '1', '22', '成都市');
INSERT INTO `city` VALUES ('249', '2', '22', '自贡市');
INSERT INTO `city` VALUES ('250', '3', '22', '攀枝花市');
INSERT INTO `city` VALUES ('251', '4', '22', '泸州市');
INSERT INTO `city` VALUES ('252', '5', '22', '德阳市');
INSERT INTO `city` VALUES ('253', '6', '22', '绵阳市');
INSERT INTO `city` VALUES ('254', '7', '22', '广元市');
INSERT INTO `city` VALUES ('255', '8', '22', '遂宁市');
INSERT INTO `city` VALUES ('256', '9', '22', '内江市');
INSERT INTO `city` VALUES ('257', '10', '22', '乐山市');
INSERT INTO `city` VALUES ('258', '11', '22', '南充市');
INSERT INTO `city` VALUES ('259', '12', '22', '眉山市');
INSERT INTO `city` VALUES ('260', '13', '22', '宜宾市');
INSERT INTO `city` VALUES ('261', '14', '22', '广安市');
INSERT INTO `city` VALUES ('262', '15', '22', '达州市');
INSERT INTO `city` VALUES ('263', '16', '22', '雅安市');
INSERT INTO `city` VALUES ('264', '17', '22', '巴中市');
INSERT INTO `city` VALUES ('265', '18', '22', '资阳市');
INSERT INTO `city` VALUES ('266', '19', '22', '阿坝藏族羌族自治州');
INSERT INTO `city` VALUES ('267', '20', '22', '甘孜藏族自治州');
INSERT INTO `city` VALUES ('268', '21', '22', '凉山彝族自治州');
INSERT INTO `city` VALUES ('269', '1', '23', '贵阳市');
INSERT INTO `city` VALUES ('270', '2', '23', '六盘水市');
INSERT INTO `city` VALUES ('271', '3', '23', '遵义市');
INSERT INTO `city` VALUES ('272', '4', '23', '安顺市');
INSERT INTO `city` VALUES ('273', '5', '23', '铜仁地区');
INSERT INTO `city` VALUES ('274', '6', '23', '毕节地区');
INSERT INTO `city` VALUES ('275', '7', '23', '黔西南布依族苗族自治州');
INSERT INTO `city` VALUES ('276', '8', '23', '黔东南苗族侗族自治州');
INSERT INTO `city` VALUES ('277', '9', '23', '黔南布依族苗族自治州');
INSERT INTO `city` VALUES ('278', '1', '24', '海口市');
INSERT INTO `city` VALUES ('279', '2', '24', '三亚市');
INSERT INTO `city` VALUES ('280', '3', '24', '五指山市');
INSERT INTO `city` VALUES ('281', '4', '24', '琼海市');
INSERT INTO `city` VALUES ('282', '5', '24', '儋州市');
INSERT INTO `city` VALUES ('283', '6', '24', '文昌市');
INSERT INTO `city` VALUES ('284', '7', '24', '万宁市');
INSERT INTO `city` VALUES ('285', '8', '24', '东方市');
INSERT INTO `city` VALUES ('286', '9', '24', '澄迈县');
INSERT INTO `city` VALUES ('287', '10', '24', '定安县');
INSERT INTO `city` VALUES ('288', '11', '24', '屯昌县');
INSERT INTO `city` VALUES ('289', '12', '24', '临高县');
INSERT INTO `city` VALUES ('290', '13', '24', '白沙黎族自治县');
INSERT INTO `city` VALUES ('291', '14', '24', '昌江黎族自治县');
INSERT INTO `city` VALUES ('292', '15', '24', '乐东黎族自治县');
INSERT INTO `city` VALUES ('293', '16', '24', '陵水黎族自治县');
INSERT INTO `city` VALUES ('294', '17', '24', '保亭黎族苗族自治县');
INSERT INTO `city` VALUES ('295', '18', '24', '琼中黎族苗族自治县');
INSERT INTO `city` VALUES ('296', '1', '25', '昆明市');
INSERT INTO `city` VALUES ('297', '2', '25', '曲靖市');
INSERT INTO `city` VALUES ('298', '3', '25', '玉溪市');
INSERT INTO `city` VALUES ('299', '4', '25', '保山市');
INSERT INTO `city` VALUES ('300', '5', '25', '昭通市');
INSERT INTO `city` VALUES ('301', '6', '25', '丽江市');
INSERT INTO `city` VALUES ('302', '7', '25', '思茅市');
INSERT INTO `city` VALUES ('303', '8', '25', '临沧市');
INSERT INTO `city` VALUES ('304', '9', '25', '文山壮族苗族自治州');
INSERT INTO `city` VALUES ('305', '10', '25', '红河哈尼族彝族自治州');
INSERT INTO `city` VALUES ('306', '11', '25', '西双版纳傣族自治州');
INSERT INTO `city` VALUES ('307', '12', '25', '楚雄彝族自治州');
INSERT INTO `city` VALUES ('308', '13', '25', '大理白族自治州');
INSERT INTO `city` VALUES ('309', '14', '25', '德宏傣族景颇族自治州');
INSERT INTO `city` VALUES ('310', '15', '25', '怒江傈傈族自治州');
INSERT INTO `city` VALUES ('311', '16', '25', '迪庆藏族自治州');
INSERT INTO `city` VALUES ('312', '1', '26', '西宁市');
INSERT INTO `city` VALUES ('313', '2', '26', '海东地区');
INSERT INTO `city` VALUES ('314', '3', '26', '海北藏族自治州');
INSERT INTO `city` VALUES ('315', '4', '26', '黄南藏族自治州');
INSERT INTO `city` VALUES ('316', '5', '26', '海南藏族自治州');
INSERT INTO `city` VALUES ('317', '6', '26', '果洛藏族自治州');
INSERT INTO `city` VALUES ('318', '7', '26', '玉树藏族自治州');
INSERT INTO `city` VALUES ('319', '8', '26', '海西蒙古族藏族自治州');
INSERT INTO `city` VALUES ('320', '1', '27', '西安市');
INSERT INTO `city` VALUES ('321', '2', '27', '铜川市');
INSERT INTO `city` VALUES ('322', '3', '27', '宝鸡市');
INSERT INTO `city` VALUES ('323', '4', '27', '咸阳市');
INSERT INTO `city` VALUES ('324', '5', '27', '渭南市');
INSERT INTO `city` VALUES ('325', '6', '27', '延安市');
INSERT INTO `city` VALUES ('326', '7', '27', '汉中市');
INSERT INTO `city` VALUES ('327', '8', '27', '榆林市');
INSERT INTO `city` VALUES ('328', '9', '27', '安康市');
INSERT INTO `city` VALUES ('329', '10', '27', '商洛市');
INSERT INTO `city` VALUES ('330', '1', '28', '南宁市');
INSERT INTO `city` VALUES ('331', '2', '28', '柳州市');
INSERT INTO `city` VALUES ('332', '3', '28', '桂林市');
INSERT INTO `city` VALUES ('333', '4', '28', '梧州市');
INSERT INTO `city` VALUES ('334', '5', '28', '北海市');
INSERT INTO `city` VALUES ('335', '6', '28', '防城港市');
INSERT INTO `city` VALUES ('336', '7', '28', '钦州市');
INSERT INTO `city` VALUES ('337', '8', '28', '贵港市');
INSERT INTO `city` VALUES ('338', '9', '28', '玉林市');
INSERT INTO `city` VALUES ('339', '10', '28', '百色市');
INSERT INTO `city` VALUES ('340', '11', '28', '贺州市');
INSERT INTO `city` VALUES ('341', '12', '28', '河池市');
INSERT INTO `city` VALUES ('342', '13', '28', '来宾市');
INSERT INTO `city` VALUES ('343', '14', '28', '崇左市');
INSERT INTO `city` VALUES ('344', '1', '29', '拉萨市');
INSERT INTO `city` VALUES ('345', '2', '29', '那曲地区');
INSERT INTO `city` VALUES ('346', '3', '29', '昌都地区');
INSERT INTO `city` VALUES ('347', '4', '29', '山南地区');
INSERT INTO `city` VALUES ('348', '5', '29', '日喀则地区');
INSERT INTO `city` VALUES ('349', '6', '29', '阿里地区');
INSERT INTO `city` VALUES ('350', '7', '29', '林芝地区');
INSERT INTO `city` VALUES ('351', '1', '30', '银川市');
INSERT INTO `city` VALUES ('352', '2', '30', '石嘴山市');
INSERT INTO `city` VALUES ('353', '3', '30', '吴忠市');
INSERT INTO `city` VALUES ('354', '4', '30', '固原市');
INSERT INTO `city` VALUES ('355', '5', '30', '中卫市');
INSERT INTO `city` VALUES ('356', '1', '31', '乌鲁木齐市');
INSERT INTO `city` VALUES ('357', '2', '31', '克拉玛依市');
INSERT INTO `city` VALUES ('358', '3', '31', '石河子市　');
INSERT INTO `city` VALUES ('359', '4', '31', '阿拉尔市');
INSERT INTO `city` VALUES ('360', '5', '31', '图木舒克市');
INSERT INTO `city` VALUES ('361', '6', '31', '五家渠市');
INSERT INTO `city` VALUES ('362', '7', '31', '吐鲁番市');
INSERT INTO `city` VALUES ('363', '8', '31', '阿克苏市');
INSERT INTO `city` VALUES ('364', '9', '31', '喀什市');
INSERT INTO `city` VALUES ('365', '10', '31', '哈密市');
INSERT INTO `city` VALUES ('366', '11', '31', '和田市');
INSERT INTO `city` VALUES ('367', '12', '31', '阿图什市');
INSERT INTO `city` VALUES ('368', '13', '31', '库尔勒市');
INSERT INTO `city` VALUES ('369', '14', '31', '昌吉市　');
INSERT INTO `city` VALUES ('370', '15', '31', '阜康市');
INSERT INTO `city` VALUES ('371', '16', '31', '米泉市');
INSERT INTO `city` VALUES ('372', '17', '31', '博乐市');
INSERT INTO `city` VALUES ('373', '18', '31', '伊宁市');
INSERT INTO `city` VALUES ('374', '19', '31', '奎屯市');
INSERT INTO `city` VALUES ('375', '20', '31', '塔城市');
INSERT INTO `city` VALUES ('376', '21', '31', '乌苏市');
INSERT INTO `city` VALUES ('377', '22', '31', '阿勒泰市');
INSERT INTO `city` VALUES ('378', '1', '32', '呼和浩特市');
INSERT INTO `city` VALUES ('379', '2', '32', '包头市');
INSERT INTO `city` VALUES ('380', '3', '32', '乌海市');
INSERT INTO `city` VALUES ('381', '4', '32', '赤峰市');
INSERT INTO `city` VALUES ('382', '5', '32', '通辽市');
INSERT INTO `city` VALUES ('383', '6', '32', '鄂尔多斯市');
INSERT INTO `city` VALUES ('384', '7', '32', '呼伦贝尔市');
INSERT INTO `city` VALUES ('385', '8', '32', '巴彦淖尔市');
INSERT INTO `city` VALUES ('386', '9', '32', '乌兰察布市');
INSERT INTO `city` VALUES ('387', '10', '32', '锡林郭勒盟');
INSERT INTO `city` VALUES ('388', '11', '32', '兴安盟');
INSERT INTO `city` VALUES ('389', '12', '32', '阿拉善盟');
INSERT INTO `city` VALUES ('390', '1', '33', '澳门特别行政区');
INSERT INTO `city` VALUES ('391', '1', '34', '香港特别行政区');

-- ----------------------------
-- Table structure for `collectrecord`
-- ----------------------------
DROP TABLE IF EXISTS `collectrecord`;
CREATE TABLE `collectrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loanSign_id` bigint(20) DEFAULT NULL COMMENT '借款标编号',
  `userbasicinfo_id` bigint(20) DEFAULT NULL COMMENT '会员编号',
  `collecttime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDDD6C5FBF0EB5EBA` (`userbasicinfo_id`) USING BTREE,
  KEY `FKDDD6C5FB554723AD` (`loanSign_id`) USING BTREE,
  CONSTRAINT `collectrecord_ibfk_1` FOREIGN KEY (`loanSign_id`) REFERENCES `loansign` (`id`),
  CONSTRAINT `collectrecord_ibfk_2` FOREIGN KEY (`userbasicinfo_id`) REFERENCES `userbasicsinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 8192 kB; (`loanSign_id`) REFER `tgp2p/loansign`';

-- ----------------------------
-- Records of collectrecord
-- ----------------------------

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cmtContent` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `cmtIsShow` varchar(255) DEFAULT NULL COMMENT '是否显示：1显示、0屏蔽',
  `cmtReply` varchar(255) DEFAULT NULL COMMENT '回复内容',
  `commentTime` varchar(255) DEFAULT NULL COMMENT '评论时间',
  `replyTime` varchar(255) DEFAULT NULL COMMENT '回复时间',
  `commentator_id` bigint(20) DEFAULT NULL COMMENT '评论人',
  `loanSign_id` bigint(20) DEFAULT NULL COMMENT '借款标',
  `replyer_id` bigint(20) DEFAULT NULL COMMENT '回复人',
  PRIMARY KEY (`id`),
  KEY `FK38A5EE5F491B7540` (`replyer_id`) USING BTREE,
  KEY `FK38A5EE5F840DD79B` (`commentator_id`) USING BTREE,
  KEY `FK38A5EE5F9C6DA5F7` (`loanSign_id`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`replyer_id`) REFERENCES `adminuser` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`commentator_id`) REFERENCES `userbasicsinfo` (`id`),
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`loanSign_id`) REFERENCES `loansign` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='借款标评论信息表; InnoDB free: 8192 kB; (`replyer_id; InnoDB free: 8192 kB; (`replyer_id';

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `common_problems`
-- ----------------------------
DROP TABLE IF EXISTS `common_problems`;
CREATE TABLE `common_problems` (
  `id` bigint(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) DEFAULT NULL,
  `replyContent` varchar(1000) DEFAULT NULL,
  `isShow` varchar(10) DEFAULT NULL,
  `type` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_problems
-- ----------------------------
INSERT INTO `common_problems` VALUES ('1', '如何成为太平洋理财的投资人？', '年满18周岁，具有完全民事权利能力和民事行为能力，通过提交注册、通过实名认证即可成为太平洋理财投资人。', '1', '0');
INSERT INTO `common_problems` VALUES ('2', '如何成为太平洋理财的投资人？', '年满18周岁，具有完全民事权利能力和民事行为能力，通过提交注册、通过实名认证即可成为太平洋理财投资人。', '1', '0');
INSERT INTO `common_problems` VALUES ('4', '常见问题3', '内容回复3', '1', '1');
INSERT INTO `common_problems` VALUES ('5', '常见问题4', '内容回复4', '1', '1');
INSERT INTO `common_problems` VALUES ('6', '常见问题5', '内容回复5', '1', '2');
INSERT INTO `common_problems` VALUES ('7', '常见问题6', '内容回复6', '0', '2');

-- ----------------------------
-- Table structure for `costratio`
-- ----------------------------
DROP TABLE IF EXISTS `costratio`;
CREATE TABLE `costratio` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bouns` double DEFAULT NULL COMMENT '推广奖金',
  `dayRate` double DEFAULT NULL COMMENT '天标管理费',
  `highLines` double DEFAULT NULL COMMENT '借款者上线(VIP用户上限金额)',
  `mfeeratio` double DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `oneyear` double DEFAULT NULL,
  `other` double DEFAULT NULL,
  `overdueRepayment` double DEFAULT NULL,
  `pmfeeratio` double DEFAULT NULL,
  `prepaymentRate` double DEFAULT NULL,
  `pwfeeratio` double DEFAULT NULL,
  `pwfeetop` double DEFAULT NULL,
  `threeyear` double DEFAULT NULL,
  `pmfeetop` double DEFAULT NULL,
  `mfeetop` double DEFAULT NULL,
  `twoyear` double DEFAULT NULL,
  `wfeeratio` double DEFAULT NULL,
  `wfeetop` double DEFAULT NULL,
  `withinTwoMonths` double DEFAULT NULL,
  `recharge` double DEFAULT NULL,
  `viprecharge` double DEFAULT NULL,
  `vipwithdraw` double DEFAULT NULL,
  `withdraw` double DEFAULT NULL,
  `vip_pmfeeratio` double DEFAULT NULL COMMENT 'vip借款管理费比例',
  `vip_pmfeetop` double DEFAULT NULL COMMENT 'vip借款管理费上限',
  `vip_mfeeratio` double DEFAULT NULL COMMENT 'vip投资管理费比例',
  `vip_mfeetop` double DEFAULT NULL COMMENT 'vip投资管理费上限',
  `vipwithdrawtop` double DEFAULT NULL COMMENT 'vip提现手续费上限',
  `vip_upgrade` double DEFAULT NULL COMMENT '升级vip费用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of costratio
-- ----------------------------
INSERT INTO `costratio` VALUES ('1', null, null, '500', '0.015', null, '0.1', '0.02', '0.003', '0.015', '0.005', null, '100', null, '1000', '0.01', null, null, null, '0.02', '0.001', '0.001', '0.01', '0.01', '0.01', '10000000', '0.01', '10000000', '500', '100');

-- ----------------------------
-- Table structure for `creditor`
-- ----------------------------
DROP TABLE IF EXISTS `creditor`;
CREATE TABLE `creditor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `serial` varchar(20) NOT NULL COMMENT '债权编号',
  `userbasic_id` bigint(20) NOT NULL COMMENT '用户编号',
  `money` decimal(18,4) NOT NULL COMMENT '债权金额',
  `money_min` decimal(5,4) NOT NULL COMMENT '最小债权单位',
  `time_start` varchar(25) NOT NULL COMMENT '债权开始日期',
  `time_end` varchar(25) NOT NULL COMMENT '债权结束日期',
  `time_during` int(20) NOT NULL COMMENT '债权期限',
  `status` int(5) NOT NULL COMMENT '状态[0:未发布，1:进行中，2:已完成，3:已过期]',
  `lend_end_time` varchar(255) DEFAULT NULL,
  `lend_sum_money` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userbasic_id` (`userbasic_id`) USING BTREE,
  CONSTRAINT `creditor_ibfk_1` FOREIGN KEY (`userbasic_id`) REFERENCES `userbasicsinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='债券信息表; InnoDB free: 8192 kB; (`userbasic_id`) REFE; InnoDB free: 8192 kB; (`user';

-- ----------------------------
-- Records of creditor
-- ----------------------------

-- ----------------------------
-- Table structure for `creditor_info`
-- ----------------------------
DROP TABLE IF EXISTS `creditor_info`;
CREATE TABLE `creditor_info` (
  `id` bigint(20) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `borrow_use` varchar(200) DEFAULT NULL,
  `epayment_origin` varchar(50) DEFAULT NULL,
  `friend_five` varchar(20) DEFAULT NULL,
  `friend_four` varchar(20) DEFAULT NULL,
  `friend_one` varchar(20) DEFAULT NULL,
  `friend_three` varchar(20) DEFAULT NULL,
  `friend_two` varchar(20) DEFAULT NULL,
  `id_card` varchar(20) DEFAULT NULL,
  `interest` varchar(255) DEFAULT NULL,
  `money` varchar(255) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `people_common_id_card` varchar(20) DEFAULT NULL,
  `people_common_name` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `release_money_name` varchar(20) DEFAULT NULL,
  `release_money_phone` varchar(20) DEFAULT NULL,
  `repayment_type` varchar(50) DEFAULT NULL,
  `risk_control_one` varchar(20) DEFAULT NULL,
  `risk_control_two` varchar(20) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `time_end` varchar(20) DEFAULT NULL,
  `time_start` varchar(20) DEFAULT NULL,
  `work_company` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of creditor_info
-- ----------------------------

-- ----------------------------
-- Table structure for `creditor_link`
-- ----------------------------
DROP TABLE IF EXISTS `creditor_link`;
CREATE TABLE `creditor_link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `balance` double NOT NULL,
  `time_frost` varchar(20) DEFAULT NULL,
  `creditor_id` bigint(20) NOT NULL,
  `creditor_room_id` bigint(20) NOT NULL,
  `id_frost` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `FK6E954BBD8C4F37B1` (`id_frost`) USING BTREE,
  KEY `FK6E954BBDCDFD5986` (`creditor_room_id`) USING BTREE,
  KEY `FK6E954BBD38A2E94D` (`creditor_id`) USING BTREE,
  CONSTRAINT `creditor_link_ibfk_1` FOREIGN KEY (`creditor_id`) REFERENCES `creditor` (`id`),
  CONSTRAINT `creditor_link_ibfk_2` FOREIGN KEY (`id_frost`) REFERENCES `userbasicsinfo` (`id`),
  CONSTRAINT `creditor_link_ibfk_3` FOREIGN KEY (`creditor_room_id`) REFERENCES `creditor_room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 8192 kB; (`creditor_id`) REFER `tgp2p/creditor`';

-- ----------------------------
-- Records of creditor_link
-- ----------------------------

-- ----------------------------
-- Table structure for `creditor_pay_record`
-- ----------------------------
DROP TABLE IF EXISTS `creditor_pay_record`;
CREATE TABLE `creditor_pay_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `day_during` int(11) NOT NULL,
  `money` double NOT NULL,
  `status` int(11) DEFAULT NULL,
  `time_end` varchar(20) NOT NULL,
  `time_start` varchar(20) NOT NULL,
  `creditor_id` bigint(20) NOT NULL,
  `product_pay_record_id` bigint(20) NOT NULL,
  `userbasic_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `FKDF55A94B7774069F` (`product_pay_record_id`) USING BTREE,
  KEY `FKDF55A94B71860A8` (`userbasic_id`) USING BTREE,
  KEY `FKDF55A94B38A2E94D` (`creditor_id`) USING BTREE,
  CONSTRAINT `creditor_pay_record_ibfk_1` FOREIGN KEY (`creditor_id`) REFERENCES `creditor` (`id`),
  CONSTRAINT `creditor_pay_record_ibfk_2` FOREIGN KEY (`userbasic_id`) REFERENCES `userbasicsinfo` (`id`),
  CONSTRAINT `creditor_pay_record_ibfk_3` FOREIGN KEY (`product_pay_record_id`) REFERENCES `product_pay_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 8192 kB; (`creditor_id`) REFER `tgp2p/creditor`';

-- ----------------------------
-- Records of creditor_pay_record
-- ----------------------------

-- ----------------------------
-- Table structure for `creditor_release_money_record`
-- ----------------------------
DROP TABLE IF EXISTS `creditor_release_money_record`;
CREATE TABLE `creditor_release_money_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `money` double NOT NULL,
  `pIpsBillNo` varchar(30) DEFAULT NULL,
  `pMerBillNo` varchar(30) DEFAULT NULL,
  `time_end` varchar(20) NOT NULL,
  `time_execute` varchar(20) NOT NULL,
  `admin_id` bigint(20) NOT NULL,
  `creditor_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `FK4806BAB90537CF2` (`admin_id`) USING BTREE,
  KEY `FK4806BAB38A2E94D` (`creditor_id`) USING BTREE,
  CONSTRAINT `creditor_release_money_record_ibfk_1` FOREIGN KEY (`creditor_id`) REFERENCES `creditor` (`id`),
  CONSTRAINT `creditor_release_money_record_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `adminuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 8192 kB; (`creditor_id`) REFER `tgp2p/creditor`';

-- ----------------------------
-- Records of creditor_release_money_record
-- ----------------------------

-- ----------------------------
-- Table structure for `creditor_room`
-- ----------------------------
DROP TABLE IF EXISTS `creditor_room`;
CREATE TABLE `creditor_room` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cur_time` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of creditor_room
-- ----------------------------

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(20) DEFAULT NULL,
  `phone` varchar(18) DEFAULT NULL,
  `qq_num` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------

-- ----------------------------
-- Table structure for `deputysection`
-- ----------------------------
DROP TABLE IF EXISTS `deputysection`;
CREATE TABLE `deputysection` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `isRecommend` int(11) DEFAULT NULL COMMENT '是否推荐',
  `isShow` int(11) DEFAULT NULL COMMENT '是否显示1 显示 0不显示',
  `name` longtext COMMENT '名称',
  `orderNum` int(11) NOT NULL COMMENT '显示顺序',
  `pageHTML` longtext COMMENT '页面内容',
  `pageTitile` longtext COMMENT '网页标题',
  `url` longtext COMMENT '路径',
  `sectiontype_id` bigint(20) DEFAULT NULL COMMENT '栏目类型',
  `topic_id` bigint(20) NOT NULL COMMENT '一级菜单编号',
  `isfixed` int(11) DEFAULT NULL COMMENT '1表示是不可以删除  2表示不能修改 0表示可以删除',
  `isfooter` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sectiontype_id_fk` (`sectiontype_id`) USING BTREE,
  KEY `topic_id_fk` (`topic_id`) USING BTREE,
  CONSTRAINT `deputysection_ibfk_1` FOREIGN KEY (`sectiontype_id`) REFERENCES `sectiontype` (`id`),
  CONSTRAINT `deputysection_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COMMENT='二级栏目信息表; InnoDB free: 8192 kB; (`sectiontype_i; InnoDB free: 8192 kB; (`sectiont';

-- ----------------------------
-- Records of deputysection
-- ----------------------------
INSERT INTO `deputysection` VALUES ('16', '0', '0', '首页', '16', '首页首页', '首页', 'to/single-1-17.htm', '1', '1', '0', '0');
INSERT INTO `deputysection` VALUES ('20', '1', '1', '最新公告', '20', '', '最新公告', 'to/list-1-20.htm', '2', '1', '0', '1');
INSERT INTO `deputysection` VALUES ('60', '0', '0', '热点动态', '60', '', '热点动态', 'to/list-1-60.htm', '2', '1', '0', '0');
INSERT INTO `deputysection` VALUES ('61', '0', '0', '问题解答', '61', '', '问题解答', 'to/list-1-61.htm', '2', '1', '0', '0');
INSERT INTO `deputysection` VALUES ('71', '0', '1', '太平洋宝', '71', '<span style=\"font-family:Microsoft YaHei;font-size:15px;line-height:25px;color:#333\"></span><h3 style=\"box-sizing: border-box; margin: 10px 0px; padding: 0px; border: 0px; outline: 0px; font-family: \'Microsoft YaHei\', Helvetica, Arial, sans-serif; font-stretch: inherit; line-height: 24px; vertical-align: baseline; color: rgb(51, 51, 51); text-rendering: optimizelegibility;\"><span style=\"font-size: 18px;\"></span></h3><h3 style=\"box-sizing: border-box; margin: 10px 0px; padding: 0px; border: 0px; outline: 0px; font-family: \'Microsoft YaHei\', Helvetica, Arial, sans-serif; font-stretch: inherit; line-height: 24px; vertical-align: baseline; color: rgb(51, 51, 51); text-rendering: optimizelegibility;\"><span style=\"font-size: 18px;\"></span></h3><h3 style=\"box-sizing: border-box; margin: 10px 0px; padding: 0px; border: 0px; outline: 0px; font-family: \'Microsoft YaHei\', Helvetica, Arial, sans-serif; font-stretch: inherit; line-height: 24px; vertical-align: baseline; color: rgb(51, 51, 51); text-rendering: optimizelegibility;\"></h3><h3 style=\"font-family: Simsun;\"><span style=\"font-size: 16px; font-weight: normal; font-family: Arial, Helvetica, sans-serif;\"></span></h3><h3><span style=\"font-family:Microsoft YaHei;\"><span style=\"font-weight: normal;\"><span style=\"line-height: 30px;\"><span style=\"font-size:16px;\">产品介绍</span></span></span><br /></span></h3><div style=\"text-indent: 2em;\"><span style=\"font-weight: normal;\"><span style=\"line-height: 30px;\"><span style=\"font-family:Microsoft YaHei;font-size:12px;\">太平洋宝是太平洋理财联合第三方专业机构推出的核心业务，主要为中小微企业客户提供短期周转资金，并由第三方专业机构（包括小额贷款公司、担保公司、典当公司、股权公司等）提供全程连带保证担保，第三方专业机构在贷款发生逾期后承诺三个工作日内垫付本金和收益。</span></span></span></div><h3><span style=\"font-family: \'Microsoft YaHei\'; font-weight: normal;\"><span style=\"line-height: 30px;\"><span style=\"font-size:16px;\">准入机制</span></span></span></h3><div style=\"text-indent: 2em;\"><span style=\"font-weight: normal;\"><span style=\"line-height: 30px;\"><span style=\"font-family:Microsoft YaHei;font-size:12px;\">在严格准入标准前提下，融资客户向平台提出融资申请后由第三方专业机构及太平洋理财联合开展贷前审核并出具独立调研风险评估报告。一般采用：信贷征信查询、实地调研、财务分析、企业发展规划分析、企业现有财产调查、企业负责人面谈、资金用途分析等多种专业调研方式，并召开风险评审会，全面分析项目可行性，最终确定准入资格和授信额度。</span></span></span></div><h3><span style=\"font-family: \'Microsoft YaHei\'; font-weight: normal;\"><span style=\"line-height: 30px;\"><span style=\"font-size:16px;\">监管和保障</span></span></span></h3><div style=\"text-indent: 2em;\"><span style=\"font-weight: normal;\"><span style=\"line-height: 30px;\"><span style=\"font-family:Microsoft YaHei;font-size:12px;\">本产品的最终发布均要求融资客户签订反担保方案并办理相关的抵押登记手续，由平台严格监控贷后资金流向，保障反担保方案的落实和抵押物风险敞口全额覆盖，并由第三方专业机构为项目提供全程连带保证担保。</span></span></span></div><h3><span style=\"line-height: 30px;\"><span style=\"font-family: \'Microsoft YaHei\'; font-weight: normal;\"><span style=\"font-size:16px;\">担保资格</span></span></span></h3><div style=\"text-indent: 2em;\"><span style=\"font-weight: normal;\"><span style=\"line-height: 30px;\"><span style=\"font-family:Microsoft YaHei;font-size:12px;\">为人民政府金融工作办公室登记在册并具备&quot;经营许可证&quot;的小额贷款公司、担保公司、典当公司、产权交易机构等。</span></span></span></div><h3><span style=\"line-height: 30px;\"><span style=\"font-family: \'Microsoft YaHei\'; font-weight: normal;\"><span style=\"font-size:16px;\">标类型包括</span></span></span></h3><p></p><div style=\"width: 250px;\"><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:16px;\">担保标</span></span></span></div><div style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-stretch: inherit; line-height: 25px; vertical-align: baseline; color: rgb(102, 102, 102);\"></div><div style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-stretch: inherit; vertical-align: baseline; color: rgb(102, 102, 102);\"><span style=\"line-height: 25px; margin: 15px 0px 0px 30px; padding: 0px; list-style: none; outline: none; color: rgb(51, 51, 51); display: block; width: 765px;\"><a href=\"/borrow/start-apply?type=1\" style=\"margin: 0px; padding: 0px; list-style: none; text-decoration: none; outline: none; color: rgb(102, 102, 102); cursor: pointer;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 18px; cursor: pointer; display: block; width: 185px; height: 40px; line-height: 40px; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; text-align: center; color: rgb(255, 255, 255); text-shadow: rgb(102, 102, 102) 1px 0px 1px; float: left; background-color: #E70012 ;\"><span style=\"font-family:Microsoft YaHei;\">立即申请</span></span></a></span><div class=\"clear\" style=\"line-height: 18px; font-size: 16px; margin: 0px; padding: 0px; list-style: none; outline: none; clear: both; color: rgb(51, 51, 51);\"></div><span style=\"line-height: 25px; margin: 15px 0px 0px 30px; padding: 0px; list-style: none; outline: none; color: rgb(51, 51, 51); display: block; width: 765px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; float: left;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; float: left;\"><span style=\"font-family:Microsoft YaHei;\"><span style=\"font-size:16px;\"></span></span></span></span></span><p style=\"line-height: 25px;\"><span style=\"color: rgb(51, 51, 51);\"><span style=\"font-family:Microsoft YaHei;\"><span style=\"font-size:16px;\"></span></span></span></p><div style=\"margin: 0px; padding: 0px; list-style: none; outline: none; color: rgb(51, 51, 51);\"><span style=\"line-height: 25px; margin: 15px 0px 0px 30px; padding: 0px; list-style: none; outline: none; display: block; width: 765px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; float: left;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; float: left;\"><span style=\"font-size:16px;\"><span style=\"font-family:Microsoft YaHei;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"></span></span></span></span></span></span><div><span style=\"font-family:Microsoft YaHei;\"><br /></span></div><div><span style=\"line-height: 25px;\"><span style=\"color: rgb(51, 51, 51); line-height: 25px; margin: 0px; padding: 0px; list-style: none; outline: none; float: none; display: inline;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"font-family:Microsoft YaHei;font-size:12px;\">申请资料：</span></span></span></span></div><div><span style=\"line-height: 25px;\"><span style=\"font-family:Microsoft YaHei;\"><span style=\"color: rgb(51, 51, 51); line-height: 25px; margin: 0px; padding: 0px; list-style: none; outline: none; float: none; display: inline;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"font-size:12px;\">（1）身份证、社保卡、行驶证（如有）、房产证（如有）。<br style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\" />（2）营业执照、税务登记证、组织机构代码证、公司章程（如有）公司最近的验资报告（如有）开户许可证，资产负债表，财务报表。<br style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\" />（3）公司有效租赁合同、近3个月交租发票。<br style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\" />（4）近6个月企业对公银行流水、6个月个人流水。<br style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\" />（5）企业近3个月大额购销合同、企业现有固定资产清单（有助于高额度）。<br style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\" />（6）近三个月员工工资单及企业通讯录（管理层）。<br style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\" />（7）个人住址的房产证或者租赁合同和近2期水电费单据。</span></span></span><br /><br /></span></span></div><div><span style=\"font-size: 16px;\"><span style=\"font-family:Microsoft YaHei;\"><span style=\"line-height: 25px;\"></span></span></span></div><div><span style=\"font-family:Microsoft YaHei;\"><br /></span></div><span style=\"font-family:Microsoft YaHei;\"><span style=\"font-size: 16px; line-height: 18px;\"></span><span style=\"color: rgb(51, 51, 51); margin: 15px 0px 0px 30px; display: inline; line-height: 25px;\"></span></span><span style=\"line-height: 18px; margin: 0px; padding: 0px; list-style: none; outline: none; float: left;\"><span style=\"font-family:Microsoft YaHei;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 16px;\"></span></span></span><span style=\"line-height: 18px; margin: 0px; padding: 0px; list-style: none; outline: none; float: left;\"><span style=\"font-family:Microsoft YaHei;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 16px;\"></span></span></span></div><br /></div><div></div><div class=\"clear\"></div>', '太平洋宝', 'to/single-3-71.htm', '1', '3', '0', '0');
INSERT INTO `deputysection` VALUES ('72', '0', '1', '转盈宝', '72', '<span style=\"font-family:Microsoft YaHei;color:#333333;font-size:15px;line-height:25px;\"></span><h3 style=\"box-sizing: border-box; margin: 10px 0px; padding: 0px; border: 0px; outline: 0px; font-family: \'Microsoft YaHei\', Helvetica, Arial, sans-serif; font-size: 16px; font-stretch: inherit; line-height: 24px; vertical-align: baseline; color: rgb(51, 51, 51); text-rendering: optimizelegibility;\"></h3><h3 style=\"box-sizing: border-box; margin: 10px 0px; padding: 0px; border: 0px; outline: 0px; font-stretch: inherit; line-height: 24px; vertical-align: baseline; color: rgb(51, 51, 51); text-rendering: optimizelegibility;\"></h3><h3><span style=\"font-weight: normal;\"><span style=\"line-height: 30px;\"><span style=\"font-family:Microsoft YaHei;font-size:16px;\">产品介绍</span></span></span></h3><div style=\"text-indent: 2em;\"><span style=\"font-family:Microsoft YaHei;font-size:12px;\"><span style=\"line-height: 30px;\">转盈宝系由第三方专业机构（小额贷款公司、担保公司、典当公司、产权交易机构等）推荐的短期债权流转类产品，采取&quot;线下放款，线上流转&quot;的方式，通过太平洋理财服务平台合法地将债权流转到其他出资人名下，由债权流转主体和第三方专业机构提供全程连带保证担保，并承诺按期回购原有债权。</span></span></div><h3><span style=\"font-weight: normal;\"><span style=\"line-height: 30px;\"><span style=\"font-family:Microsoft YaHei;font-size:16px;\">回购流程</span></span></span></h3><div style=\"text-indent: 2em;\"><span style=\"font-family:Microsoft YaHei;font-size:12px;\"><span style=\"line-height: 30px;\">第一回购方为债权转让人、第二回购方为第三方专业机构；如债权到期时第一回购方未能回购全部债权，由第二回购方承诺在三个工作日内垫付剩余的本金和收益。</span></span></div><h3><span style=\"font-weight: normal;\"><span style=\"line-height: 30px;\"><span style=\"font-family:Microsoft YaHei;font-size:16px;\">准入机制</span></span></span></h3><div style=\"text-indent: 2em;\"><span style=\"font-family:Microsoft YaHei;font-size:12px;\"><span style=\"line-height: 30px;\">在严格准入标准前提下，融资客户向平台提出融资申请后由第三方专业机构及太平洋理财联合开展贷前审核并出具独立调研风险评估报告。一般采用：信贷征信查询、实地调研、财务分析、企业发展规划分析、企业现有财产调查、企业负责人面谈、资金用途分析等多种专业调研方式，并召开风险评审会，全面分析项目可行性，最终确定准入资格和授信额度。</span></span></div><h3><span style=\"font-weight: normal;\"><span style=\"line-height: 30px;\"><span style=\"font-family:Microsoft YaHei;font-size:16px;\">监管和保障</span></span></span></h3><div style=\"text-indent: 2em;\"><span style=\"font-family:Microsoft YaHei;font-size:12px;\"><span style=\"line-height: 30px;\">本产品的最终发布均要求债权流转主体签订反担保方案、债权回购协议和办理相关的抵押登记手续；由平台严格监控贷后资金流向，保障反担保方案的落实和抵押物风险敞口全额覆盖，并由第三方专业机构为项目提供全程连带保证担保。</span></span></div><h3><span style=\"font-weight: normal;\"><span style=\"line-height: 30px;\"><span style=\"font-family:Microsoft YaHei;font-size:16px;\">第三方专业机构资格</span></span></span></h3><div style=\"text-indent: 2em;\"><span style=\"font-family:Microsoft YaHei;font-size:12px;\"><span style=\"line-height: 30px;\">为人民政府金融工作办公室登记在册并具备&quot;经营许可证&quot;的小额贷款公司、担保公司、典当公司、产权交易机构等。</span></span></div><h3><span style=\"font-weight: normal;\"><span style=\"line-height: 30px;\"><span style=\"font-family:Microsoft YaHei;font-size:16px;\">标类型包括</span></span></span></h3><span style=\"font-family:Microsoft YaHei;font-size:16px;\">流转标</span><div><span style=\"margin: 15px 0px 0px 30px; padding: 0px; list-style: none; outline: none; color: rgb(51, 51, 51); display: block; line-height: 25px; width: 765px;\"><a href=\"/borrow/start-apply?type=2\" style=\"margin: 0px; padding: 0px; list-style: none; text-decoration: none; outline: none; color: rgb(102, 102, 102); cursor: pointer;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; cursor: pointer; display: block; width: 185px; height: 40px; line-height: 40px; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; text-align: center; color: rgb(255, 255, 255); text-shadow: rgb(102, 102, 102) 1px 0px 1px; float: left; background-color: #E70012;\"><span style=\"font-family:Microsoft YaHei;font-size:12px;\">立即申请</span></span></a></span><div class=\"clear\" style=\"margin: 0px; padding: 0px; list-style: none; outline: none; clear: both; color: rgb(51, 51, 51); line-height: 18px;\"></div><span style=\"margin: 15px 0px 0px 30px; padding: 0px; list-style: none; outline: none; color: rgb(51, 51, 51); display: block; line-height: 25px; width: 765px;\"><span style=\"font-family:Microsoft YaHei;font-size:12px;\"><br /></span></span><span style=\"font-family:Microsoft YaHei;font-size:12px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; color: rgb(51, 51, 51); line-height: 25px; float: left;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">申请资料：</span></span><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; color: rgb(51, 51, 51); line-height: 25px; float: left;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">（1）身份证、社保卡、行驶证（如有）、房产证（如有）。<br style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\" />（2）营业执照、税务登记证、组织机构代码证、公司章程（如有）公司最近的验资报告（如有）开户许可证，资产负债表，财务报表。<br style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\" />（3）公司有效租赁合同、近3个月交租发票。<br style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\" />（4）近6个月企业对公银行流水、6个月个人流水。<br style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\" />（5）企业近3个月大额购销合同、企业现有固定资产清单（有助于高额度）。<br style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\" />（6）近三个月员工工资单及企业通讯录（管理层）。<br style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\" />（7）个人住址的房产证或者租赁合同和近2期水电费单据。</span></span><br /></span></div><span style=\"font-family:Microsoft YaHei;font-size:12px;\"><span style=\"color: rgb(51, 51, 51); margin: 15px 0px 0px 30px; display: inline; line-height: 25px; width: 680px;\"></span></span><span style=\"color: rgb(51, 51, 51); margin: 15px 0px 0px 30px; display: block; line-height: 25px;\"><span style=\"float: left;\"><span style=\"font-family:Microsoft YaHei;color:#333333;float:left;font-size:15px;\"><br /></span></span></span><div class=\"clear\"></div>', '转盈宝', 'to/single-3-72.htm', '1', '3', '0', '0');
INSERT INTO `deputysection` VALUES ('82', '0', '0', '合法合规', '82', '', '', 'to/list-1-82.htm', '2', '1', '0', '0');
INSERT INTO `deputysection` VALUES ('84', '0', '0', '会员体系', '84', '<div class=\"listBannerTo\"> <div class=\"w960px\"><br /></div></div><div class=\"projectRightBox\">      <!--TxList Cont-->        <div class=\"pjRightCont\">         <table cellpadding=\"0\" cellspacing=\"0\" class=\"vipTXTab   \">            <thead>             <tr><th> </th><th>普通会员（永久免费）</th><th>VIP会员（188/年）</th></tr>            </thead>            <tbody>             <tr><th>慧投网担保范围</th><td> </td><td> </td></tr>             <tr><th>投资人服务费</th><td> </td><td> </td></tr>             <tr><th>提现时间提现费用</th><td> </td><td> </td></tr>             <tr><th>资金操作短信提醒</th><td> </td><td> </td></tr>             <tr><th>月末邮件对账单</th><td> </td><td> </td></tr>             <tr><th>自动投标设置</th><td> </td><td> </td></tr>             <tr><th>借款人逾期代偿</th><td> </td><td> </td></tr>             <tr><th>资人周转贷</th><td> </td><td> </td></tr>            </tbody>           </table></div>        <!--End TxList Cont-->      </div>', '会员体系', 'to/single-1-84.htm', '1', '1', '0', '0');
INSERT INTO `deputysection` VALUES ('85', '0', '0', '资费标准', '85', '', '资费标准', 'to/single-1-85.htm', '1', '1', '0', '0');
INSERT INTO `deputysection` VALUES ('87', '0', '0', '万绿产品', '87', '<div>            <h1>助人贷</h1>            <label>一款为广大工薪阶层白领精英人群提供的无抵押信用贷款产品</label>            <table class=\"porjectTable_one \" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">             <tbody>              <tr><th>借款金额:</th><td>1-30 万元</td><th>年利率:</th><td>12%</td><th>还款期限:</th><td>24 个月</td></tr>              <tr><th>借款标期:</th><td>10 天</td><th>还款方式:</th><td>每月等额本息还款</td><th> </th><td> </td></tr>             </tbody>            </table>             <a href=\"#\" class=\"application curvyCorners_5\">立即申请</a>            </div>            <div>            <h4 class=\"porcListHxBox\"><span class=\"curvyCorners_t5\">申请条件</span></h4>            <p>             1、年龄在22周岁（含）至55周岁之间的中国公民，具有完全民事行为能力；（是否限地区）。<br />             2、在现单位连续工作满6个月，且工资是以工资卡形式发放。<br />             3、本人具有合法稳定的职业和收入，借款人的税后月薪在4000元人民币以上，有独立还款能力。<br />             4、本人诚实守信，遵纪守法，无不良信用记录，无违法违纪行为。            </p>            </div>             <div>            <h4 class=\"porcListHxBox\"><span class=\"curvyCorners_t5\">申请资料</span></h4>            <p>             （1）正面、免冠、清晰的本人照片。<br />             （2）本人第二代身份证扫描件正、反面各一张（姓名和身份证号码清晰可见）。<br />             （3）已婚证明或未婚证明。<br />             （4）个人信用报告；（可以去银行打印）<br />             （5）盖有单位公章的劳动合同或工作证明。<br />             （6）连续近6个月工资卡银行流水。<br />             （7）其他有价资产及证明。            </p>              <a href=\"#\" class=\"porjectInfoMore curvyCorners_5\">查看详细信息</a>            </div>           ', '万绿产品', 'to/single-1-87.htm', '1', '1', '0', '0');
INSERT INTO `deputysection` VALUES ('91', '1', '0', '问题解答', '0', null, '问题解答', 'to/list-1-91.htm', '2', '1', '0', '0');
INSERT INTO `deputysection` VALUES ('92', '0', '1', '公司简介', '92', '<div style=\"margin-bottom: 20px;\"><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;太平洋金融（<a href=\"http://www.tpyjr.com.cn/\">www.tpyjr.com.cn</a>),深圳太平洋金融信息咨询有限公司旗下网站，成立于2014年9月，注册资本2000万人民币，是深圳市专业的互联网金融投融资服务平台，由深圳市福田区政府审核批准成立，公司总部位于深圳市南山区田厦国际中心。</span></span></p><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;太平洋金融服务平台由国内大型商业银行、担保公司、网络信贷从业人员发起筹建，拥有资深IT工程师团队，具备先进的后台管理系统和严格的风险控制体系，致力于打造安全、高效、可信赖的网络投融资服务平台。</span></span></p><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;为响应“促进互联网金融健康发展”的精神，根据《广东省金融改革发展“十二五”规划》的指导意见，太平洋金融依托传统金融体系，结合互联网技术特点，为个人、中小微企业等资金供需双方提供一个安全、高效、便捷的网络投融资服务平台。</span></span></p></div>', '公司简介', 'to/single-10-92.htm', '1', '10', '0', '1');
INSERT INTO `deputysection` VALUES ('93', '0', '1', '团队介绍', '93', '<div class=\"box\"><div class=\"img\"><img src=\"/upload/teamPic/gao.jpg\" alt=\"\" />    </div>    <ul class=\"list\" style=\"padding:0;\">        <li style=\"font-size:16px;line-height:24px;list-style:none;\"><span style=\"font-size:16px;\">高武明</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-size:16px;\">CEO</span></li>        <li style=\"font-size:12px;line-height:24px;list-style:none;\"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;前人人聚财COO，人人聚财是南方通过互联网做大的2家p2p公司之一，也是南方盈利能力最强的p2p公司,是南方以最低的利息募集资金的公司，创始人在人人聚财负责产品团队、运营团队、社区团队和在线营销工作</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;前新浪微博用户激励和增值业务负责人，负责新浪微博用户体系和个人增值业务，经历微博用户从千万到2亿的过程</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;前腾讯QQ会员产品经理，所在期间QQ会员获得腾讯重大业务突破奖，也是腾讯至今最赚钱的产品</p></li>    </ul></div><style>.box{width:745px;margin:0px auto; border: 0px solid #ddd;}\r\n		.box .img{float:left;}\r\n		.box .img{width:150px;height:150px;}\r\n		.box .list{float:left;width:500px;margin-left:20px; margin-top: 0px; display:inline;}\r\n		.box .list{line-height:24px;}</style><br /><br /><div class=\"box2\">    <div class=\"img2\"><img src=\"/upload/teamPic/tou.png\" alt=\"\" />    </div>    <ul class=\"list2\" style=\"\">        <li style=\"line-height:24px;font-size:14px;list-style:none;\"><span style=\"font-size:16px;\">许昭林</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-size:16px;\">首席架构师和首席运营官</span></li>        <li style=\"font-size:12px;line-height:24px;list-style:none;\"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;中国第一批程序员，早年就职 阿里巴巴、腾讯 公司</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;曾任职金蝶软件事业部开发负责人，带领超过100人技术团队</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;曾任职中信银行总行架构师6年</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;对金融系统架构和业务非常熟悉，对于目前技术发展前沿非常敏感</p></li>    </ul></div><style>.box2{width:765px;margin:172px auto; border: 0px solid #ddd;}\r\n		.box2 .img2{float:left; margin-left: 11px;}\r\n		.box2 .img2 {width:150px;height:150px;}\r\n		.box2 .list2{float:left;width:500px;margin-left:20px; margin-top:60px; display:inline;}\r\n		.box2 .list2{line-height:24px;}</style><div class=\"box3\">    <div class=\"img3\"><img src=\"/upload/teamPic/tou.png\" alt=\"\" />    </div>    <ul class=\"list3\" style=\"\">        <li style=\"line-height:24px;font-size:14px;list-style:none;\"><span style=\"font-size:16px;\">林振轩</span></li>        <li style=\"font-size:12px;line-height:24px;list-style:none;\"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10年技术工作经验</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2年中国前10名p2p网贷公司架构师经验</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;从零构建整套p2p网贷系统，持续解决各种问题，带领30人技术团队经验</p></li>    </ul></div><style>.box3{width:785px;margin:390px auto; border: 0px solid #ddd;}\r\n		.box3 .img3{float:left; margin-left: 11px;}\r\n		.box3 .img3 {width:150px;height:150px;}\r\n		.box3 .list3{float:left;width:500px;margin-left:20px; margin-top:85px; display:inline;}\r\n		.box3 .list3{line-height:24px;}</style><div class=\"box4\">    <div class=\"img4\"><img src=\"/upload/teamPic/tou.png\" alt=\"\" />    </div>    <ul class=\"list4\" style=\"\">        <li style=\"line-height:24px;font-size:14px;list-style:none;\"><span style=\"font-size:16px;\">曾海云</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-size:16px;\">高级Java工程师</span></li>        <li style=\"font-size:12px;line-height:24px;list-style:none;\"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电子科技大学毕业，曾在火球网任职，开发过火球计划S的债权生成、火球计划App</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2年中国前10名p2p网贷公司架构师经验</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;从零构建整套p2p网贷系统，持续解决各种问题，带领30人技术团队经验</p></li>    </ul></div><style>.box4{width:785px;margin:606px auto; border: 0px solid #ddd;}\r\n		.box4 .img4{float:left; margin-left: 11px;}\r\n		.box4 .img4 {width:150px;height:150px;}\r\n		.box4 .list4{float:left;width:500px;margin-left:20px; margin-top:85px; display:inline;}\r\n		.box4 .list4{line-height:24px;}</style><div style=\"margin: 820px auto 20px;\">        <hr /><br /><p><span style=\"font-family:Microsoft YaHei;font-size:18px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"font-size:16px;\">团队优势：团队成员有来自腾讯、新浪等互联网公司；有来自有利网、人人聚财等p2p top10；有来自中信银行的架构师</span></span></p><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业务优势：团队中成员都来自人人聚财、人人贷等知名的互联网金融公司，开发的系统更加符合业务逻辑</span></span></p><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;产品优势：来自腾讯的产品、设计、技术团队，他们负责提供更佳的用户体验和设计，还有业内前端技术，还有提升整套系统的安全级别</span></span></p><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;运营优势：来自top10的有利网、人人聚财的技术骨干，均具有从零开始开发整套p2p网贷系统的经验，他们负责提供成熟的技术框架、技术经验</span></span></p></div>', '团队介绍', 'to/single-10-93.htm', '1', '10', '0', '1');
INSERT INTO `deputysection` VALUES ('94', '0', '0', '专家顾问', '94', '<div style=\"text-align: center;\"><span style=\"font-family: \'Microsoft YaHei\';font-size:48px;\">待定</span></div><!-- <div class=\"box\"><div class=\"img\"><img src=\"/upload/default/columnimg/20150109104600.png\" alt=\"\" />    </div>    <ul class=\"list\" style=\"padding:0;font-family:微软雅黑\">        <li style=\"font-size:16px;line-height:24px;list-style:none;\"><span style=\"font-family:微软雅黑;font-size:16px;\">葛立祥</span>    <span style=\"font-size:16px;\">金融顾问 经济学博士（南开大学）</span></li>        <li style=\"font-size:12px;line-height:24px;list-style:none;\">       现任深圳市委政研室政策信息中心主任，深圳市政策研究学会会长。参加国家社科基金项目一项，参与省部级课题和研究所的各项课题多项，在经济类核心期刊已发文章四篇。在国家级研究学会年刊中主笔文章两篇，研究方向主要是在区域发展战略、区域发展规划、融投资环境评价、产业竞争力、企业生产布局等。</li>                    <li style=\"font-size:12px;line-height:24px;list-style:none;\">       2004年至2009年，在中国人寿保险公司、联融投资咨询(天津)有限公司、大公国际资信评估有限公司等知名金融公司任职，负责融资放款业务、外汇避险咨询、原材料价格避险咨询等工作。</li>                 <li style=\"font-size:12px;line-height:24px;list-style:none;\">       2009年至2011年供职于深圳市政府，历任深圳市国家龙湖和南部商务区综合部部长、常务副主任秘书等职位，长期从事招商引资、项目建设等工作，熟悉政府运作。</li>  </ul><style>.box{width:765px;margin:0px auto; border: 0px solid #ddd;}\r\n		.box .img{float:left;}\r\n		.box .img{width:150px;height:150px;;margin-top:4px}\r\n		.box .list{float:left;width:550px;margin-left:20px;margin-top:0px;  display:inline;}\r\n		.box .list{line-height:14px;}</style><br /><br /><div class=\"box2\">    <div class=\"img2\"><img src=\"/upload/default/columnimg/20150109104616.png\" alt=\"\" />    </div>    <ul class=\"list2\" style=\"font-family:微软雅黑\">        <li style=\"line-height:24px;font-size:14px;list-style:none;\"><span style=\"font-size:16px;\">钟永能</span>    <span style=\"font-size:16px;\">风控顾问 中信银行四会支行 行长</span></li>                         <li style=\"font-size:12px;line-height:24px;list-style:none;\">       现任中信银行四会支行行长，曾任中信银行东莞分行银行产品部负责人、分行风险管理部个贷专职信审官、分行风险委员会委员等职务。熟悉银行各类授信业务流程，在产品设计、风险防控、资产保全、法务合规等领域具备丰富的实战经验。</li>  </ul></div><style>.box2{width:785px;margin:180px auto; border: 0px solid #ddd;}\r\n		.box2 .img2{float:left; margin-left: 10px;}\r\n		.box2 .img2 {width:111px;height:150px;margin-top:16px}\r\n		.box2 .list2{float:left;width:550px;margin-left:62px;  display:inline;margin-top:18px}\r\n		.box2 .list2{line-height:24px;}</style><div class=\"box3\">    <div class=\"img2\"><img src=\"/upload/default/columnimg/20150109104628.png\" alt=\"\" />    </div>    <ul class=\"list2\" style=\"font-family:微软雅黑\">        <li style=\"line-height:24px;font-size:14px;list-style:none;\"><span style=\"font-size:16px;\">张   杰</span>    <span style=\"font-size:16px;\">法律顾问 广东明浩律师事务所四会分所所长</span></li>        <li style=\"font-size:12px;line-height:24px;list-style:none;\">       司法专职律师执业证号：14401201310017121；一直以&quot;依法维护委托人的合法权益&quot;做为自己的执业理念。曾担任深圳市建华管桩有限公司、深圳市奥利华园房地产有限公司、四会市凤山房地产有限公司等多家公司的法律顾问。</li>                    <li style=\"font-size:12px;line-height:24px;list-style:none;\">       非诉讼业务主要有：公司重组、并购；对外收购和对内管理的风险把控；公司高管的法律讲座；参与重大项目的外事谈判等。诉讼业务中涉及多种案件，在业界赢得良好口碑，专注于：公司股权转让纠纷、资产转让纠纷、拆迁安置纠纷、不良资产清收等。</li>   </ul></div><style>.box3{width:785px;margin:420px auto; border: 0px solid #ddd;}\r\n		.box3 .img2{float:left; margin-left: 10px;}\r\n		.box3 .img2 {width:111px;height:150px;;margin-top:13px}\r\n		.box3 .list2{float:left;width:550px;margin-left:62px;  display:inline;margin-top:10px}\r\n		.box3 .list2{line-height:24px;}</style> --&gt;--&gt;--&gt;', '专家顾问', 'to/single-10-94.htm', '1', '10', '0', '0');
INSERT INTO `deputysection` VALUES ('95', '0', '0', '办公环境', '95', '<div style=\"text-align: center;\"><span style=\"font-family: \'Microsoft YaHei\';font-size:48px;\">待定</span></div>', '办公环境', 'to/single-10-95.htm', '1', '10', '0', '0');
INSERT INTO `deputysection` VALUES ('96', '0', '1', '合作伙伴', '96', '<div style=\"margin-bottom: 20px;\"><p><span style=\"font-family: \'Microsoft YaHei\'; er;\"><strong><span style=\"font-size:16px;\">宝付网络科技（上海）有限公司</span></strong></span></p><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;宝付作为国内领先的第三方支付公司，通过了全球最严格的PCI DSS安全认证。宝付电子支付平台采用了国际上最先进的应用服务器和安全防护系统，为每一笔支付交易提供了最大的安全保障。</span></span></p><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;与国内近三十家金融机构合作，覆盖国内90%以上银行的网银与电子支付服务。宝付与众多国内外知名企业达成战略合作，同时还有多家私募股权基金有意向与宝付结成战略合作伙伴。</span></span></p><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;宝付始终把社会责任感放在首位、致力于电子支付和电子商务领域，秉承专业、领先、优质的行业发展经验及优势，将“宝付”打造成为支付行业的第一品牌。</span></span></p></div>', '合作伙伴', 'to/single-10-96.htm', '1', '10', '0', '1');
INSERT INTO `deputysection` VALUES ('97', '0', '0', '园区概况', '97', '<div style=\"text-align: center;\"><span style=\"font-family: \'Microsoft YaHei\';font-size:48px;\">待定</span></div>', '园区概况', 'to/single-10-97.htm', '1', '10', '0', '0');
INSERT INTO `deputysection` VALUES ('98', '0', '1', '平台公告', '98', '<p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"font-family:Microsoft YaHei;font-size:16px;\">活动一：注册有礼，VIP享不停！<br />&nbsp; &nbsp; &nbsp; 在2014年8月1日至2015年2月28日活动期间，前一千名新注册用户成功关注太平洋官方微信号（18665947793/太平洋）并绑定手机号码、银行卡、通过实名认证，我们赠送您价值120元VIP一年(直接申请后系统自动赠送)。<br /><br /><br />活动二：推荐好友，红包任你拿！<br />&nbsp; &nbsp; &nbsp;推荐送大礼活动开始啦，在 2014年8月01日至2014年8月30日开业期间，前三百名累计投资满500元的VIP客户在活动期间成功通过个人“推荐链接”推荐一名新用户注册并关注太平洋官方微信号（cdbdai/太平洋）并绑定手机号码、银行卡、通过实名认证、申请VIP，推荐人可获得太平洋赠送的5元现金红包（以成功填写推荐人为准）。<br />活动说明：<br />1、在活动结束后三个工作日内统计并发放到您太平洋的账户内；<br />2、为不影响您的奖励发放，请按照活动规定的流程操作，如未按照流程操作则视为自动放弃活动奖励。<br /><br /><br />活动三：浪漫七夕，翡翠传情<br />&nbsp; &nbsp; &nbsp; &nbsp;七夕将至，送TA一份独一无二礼物吧！ 在2014年8月1日至2014年8月30日活动期间，前三百名客户累计投资满以下金额，太平洋将赠送您翡翠珠宝、现金等大礼，具体如下：<br /><br /><br />活动说明：<br />1、每个ID只能参与一次<br />2、活动结束五个工作日内官方工作人员会与您取得联系，并安排快递配送。<br />3、奖品以寄出实物为准，恕不提供实物折现。<br /><br /><br />活动四：多重体验，“金”喜不断<br />&nbsp; &nbsp; &nbsp; &nbsp;在2014年8月1日至2014年8月15日活动期间，前三百名新注册用户成功关注太平洋官方微信号（太平洋）并绑定手机号码、银行卡、通过实名认证，将获得2000元新手体验金(注册完成后找在线客服申请后即可获得)。<br />活动说明：<br />1、新手体验金2000元只限于投资太平洋推出的新手体验项目，不能用于其他用途；<br />2、新手体验金使用期限为1个月，期间所获得的收益归投资者，本金在到期后由系统自动扣除，其他事项在后期活动中公布；<br />3、新手体验金领取完成后，预计2014年8月16日安排新手体验标，领取完体验金后请先使用新手体验金投标，体验金使用后才能操作新充值的资金。<br /><br /><br />注意事项：<br />1、太平洋官方微信号：太平洋（或者搜索：18665947793）；<br />2、注册流程引导图：<br /><br /><br />3、现金红包于活动结束后三个工作日内系统自动发放到您太平洋的账户内；<br />4、每个活动同一个ID只限参与一次；<br />5、个人推荐链接位于：我的账户 → 信息中心 → 我的推荐；<br />6、在活动期间，如规则有所调整，以本平台公布的新公告或公告刷新的内容为准，恕不再另外单独向用户进行提醒；<br />7、本次活动的最终解释权归深圳太平洋金融信息咨询有限公司所有。<br />&nbsp;<br />&nbsp;<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 深圳太平洋金融信息咨询有限公司<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;二〇一五年二月十一日</span><br /></p>', '庆开业，送大礼，您来我就送！', 'to/single-11-98.htm', '1', '11', '0', '1');
INSERT INTO `deputysection` VALUES ('99', '0', '1', '行业新闻', '99', '<h1 style=\"text-align: center; margin: 0px; padding: 20px 0px 0px; list-style: none; outline: none; width: 660px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"font-size:24px;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2014新增P2P超900家 平均注册资金为2784万元</span></span></span></span></h1><div><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"font-size:24px;\"><br /></span></span></span></span></div><div style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><ul style=\"margin: 0px; padding: 0px; list-style: none outside none; outline: none;\"><li class=\"news_con_p\" style=\"margin: 0px; padding: 0px 0px 15px; list-style: none; outline: none; clear: both; overflow: hidden;\"><p style=\"margin: 0px; padding: 0px 0px 10px; list-style: none; outline: none; word-wrap: break-word;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"font-family:Microsoft YaHei;font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;全年累计成交量超过2500亿，是2013年的2.39倍;与此同时，全年共出现问题平台275家，是2013年的3.6倍……2014年，中国P2P金融可谓经历“冰火两重天”。</span></span></span></p><p style=\"margin: 0px; padding: 0px 0px 10px; list-style: none; outline: none; word-wrap: break-word;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"font-family:Microsoft YaHei;font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;中国网贷行业正呈现平台“百花齐放”的态势。网贷之家数据显示，截至2014年年底，中国网贷运营平台达1575家，全年新上线的网贷平台超900家(含问题平台)，这些平台平均注册资金约为2784万元，相对于2013年的1357万元，增长了1倍。</span></span></span></p><p style=\"margin: 0px; padding: 0px 0px 10px; list-style: none; outline: none; word-wrap: break-word;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"font-family:Microsoft YaHei;font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;P2P(个人与个人之间的小额借贷交易)人气也日渐火爆，数据显示，2014年网贷行业投资人数与借款人数分别达116万人和63万人，较2013年分别增加364%和320%。“当前，P2P网贷行业呈现高速稳定增长，多项网贷行业指标数据显示，网贷已告别萌芽期，进入成长期。”网贷之家首席研究员马骏说。</span></span></span></p><p style=\"margin: 0px; padding: 0px 0px 10px; list-style: none; outline: none; word-wrap: break-word;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"font-family:Microsoft YaHei;font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;然而，一半是海水，一半是火焰。在P2P金融日益“人气爆棚”的同时，诈骗、跑路、提现困难等问题频频出现，日渐成为P2P行业的“新常态”。统计数据显示，2014年全年问题平台达275家，是2013年的3.6倍，仅2014年12月就出现问题平台92家，超过2013年全年问题平台的总和。</span></span></span></p><p style=\"margin: 0px; padding: 0px 0px 10px; list-style: none; outline: none; word-wrap: break-word;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"font-family:Microsoft YaHei;font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;“2014年底，受经济和金融大环境影响，借款人逾期、展期现象频繁，加之一系列平台倒闭和股市走牛影响，投资人纷纷撤出资金，网贷行业面临高兑付压力，许多平台被曝光出现提现困难。”马骏认为。</span></span></span></p><p style=\"margin: 0px; padding: 0px 0px 10px; list-style: none; outline: none; word-wrap: break-word;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"font-family:Microsoft YaHei;font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;观察人士认为，“跑路”等行业乱象与中国至今仍未出台P2P相关监管细则有关。从2014年初到年末，业界对P2P监管问题进行了广泛的讨论，但直至今日，关于P2P监管的细则仍未推出。</span></span></span></p><p style=\"margin: 0px; padding: 0px 0px 10px; list-style: none; outline: none; word-wrap: break-word;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"font-family:Microsoft YaHei;font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;目前，已经明确的信息是P2P监管将由银监会主导，银监会相关人士也已提出P2P十大“监管红线”：即明确平台的中介性质;明确平台本身不得提供担保;不得搞资金池;不得非法吸收公众存款;落实实名制;设立行业门槛;资金由第三方托管;不承诺本息、不自保自融;开展外部审计;坚持小额化、支持个人和小微企业等。</span></span></span></p><p style=\"margin: 0px; padding: 0px 0px 10px; list-style: none; outline: none; word-wrap: break-word;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"font-family:Microsoft YaHei;font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;实际上，原则性的“监管红线”，正体现了当前不断推进的“负面清单”式包容性监管理念。“互联网金融创新太快，过早地监管很容易扼杀创新，所以监管比较审慎。”中国人民大学法学院副院长杨东说。</span></span></span></p><p style=\"margin: 0px; padding: 0px 0px 10px; list-style: none; outline: none; word-wrap: break-word;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"font-family:Microsoft YaHei;font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;中央财经大学金融法研究所所长黄震等学者认为，当前P2P网贷的行业周期性特点和系统性风险状况仍未完全暴露，同时也没有为学界和监管者完全掌握，相关监管细则的出台可能还需要一段时间的“观察期”。</span></span></span></p><p style=\"margin: 0px; padding: 0px 0px 10px; list-style: none; outline: none; word-wrap: break-word;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"font-family:Microsoft YaHei;font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;尽管监管政策仍处“空中楼阁”、行业“乱象”不断，但资本市场对P2P金融仍“宠爱有加”。据统计，2014年全年至少有38家线上P2P平台完成融资，涉及资金在40亿元以上。</span></span></span></p><p style=\"margin: 0px; padding: 0px 0px 10px; list-style: none; outline: none; word-wrap: break-word;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"font-family:Microsoft YaHei;font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业内人士预计，大量资本的进入将使P2P行业竞争更加激烈，甚至会使大部分平台退出P2P舞台。“风投的进入，只是一部分，主要还要看行业的发展以及企业自身的功力。”投之家CEO黄诗樵说。</span></span></span></p></li></ul></div>', '行业新闻', 'to/single-11-99.htm', '1', '11', '0', '1');
INSERT INTO `deputysection` VALUES ('100', '0', '1', '投资技巧', '100', '<div style=\"font-family:\" font-size:=\"\" 22px=\"\"><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;随着互联网金融的发展，P2P平台规模不断壮大，成为其中最为抢眼的明星。因为其高收益的原因，越来越多的投资者也逐渐将P2P网贷投资作为闲散资金的首选项目。如果你对互联网金融有一定认识，乐于追求高收益且对风险控制有比较好的把控，那幺你可以通过下面的几招，选择合适的P2P网贷平台进行投资。</span></span></p><br /><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第一，平台的选择。平台的品牌、传播度、评价，这是最重要的。当你在投资之前对各平台眼花缭乱不知如何选择的时候，选择一些知名度较高、背靠机构较为权威、经营时间较久、页面制作精良、资费明细清晰的等这类平台，发生损失的概率会相对较小。另外，目前主流的P2P网贷平台都有自己的本金保障计划,当投资出现问题时，平台会先行垫付本金或本息，投资人可以省去追债、讨债的麻烦。</span></span></p><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第二，资金的控制。因为网贷的风险相对较高，所以，用于投资的资金最好为小额闲置资金，这也是所有高风险投资都须遵守的规律。作为典型的互联网金融产品,P2P网贷的投资简便,流程快捷,经过一两次的投资成功后,很容易产生麻痹大意心理,忽视某些显而易见的风险或问题。</span></span></p><br /><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第三，切勿贪图高收益。P2P网贷给出的收益率普遍要高于银行,年收益也大都保持在12%左右,远高于银行定期存款或理财产品。但是这并不意味着P2P网贷就一定可以给出20%、30%的逆天收益。高收益一定承担着高风险,通常来说，12%左右的年化收益率是P2P网贷的安全范围，如果回报率高得离谱，就需要慎重考虑了。动辄20%~30%的年华收益，在笔者来看，基本属于最不靠谱的一类。</span></span></p><br /><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第四，见好就收。除了正常投融资，很多P2P网贷平台推出各种各样的产品和活动来吸引客户。在这里就需要各位投资者进行理智选择了，因为不少平台的活动都具有投机性质的行为，并不符合P2P固有的特点，所以，切忌投机。</span></span></p><br /><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作为刚刚入行的投资者，p2p投资或许暂时只是一个尝试，并不建议作为主要投资项。当你对这行认识到了一定地步时，就可以逐渐加大你的投资力度了。毕竟，P2P的收益算高的。</span></span></p></div>', '投资技巧', 'to/single-11-100.htm', '1', '11', '0', '1');
INSERT INTO `deputysection` VALUES ('101', '0', '1', '常见问题', '101', '<h3 class=\"bbr\" style=\"box-sizing: border-box; margin: 10px 0px; padding: 0px; border-width: 0px 0px 1px; border-bottom-style: solid; border-bottom-color: rgb(232, 236, 239); outline: 0px; font-stretch: inherit; vertical-align: baseline; text-rendering: optimizelegibility; position: relative;\" align=\"left\"><p style=\"color: rgb(51, 51, 51); font-family: \'Microsoft YaHei\', Helvetica, Arial, sans-serif; font-size: 16px; font-weight: inherit; line-height: 30px;\"><span style=\"font-family:Microsoft YaHei;font-size:16px;\"><span style=\"color: black; font-weight: normal;\"></span></span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\">1、太平洋理财平台主要产品是什么？</span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\">A:平台主要有太平洋宝、转盈宝、存抵宝。</span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\"><br /></span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\">2、太平洋理财从投标开始到还款具体的操作流程是？</span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\">A:注册、认证、充值、投标、回款、提现。</span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\"><br /></span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\">3、平台的投标周期有哪几种？</span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\">A:一个月到6个月不等，具体看详细的项目。</span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\"><br /></span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\">4、平台多少元起投？</span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\">A:50元起投，无上限。</span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\"><br /></span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\">５、充值是否需要收取手续费？</span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\">A：充值都是免费的。线上充值立刻到账，线下充值一般15分钟内到账，客户提交充值申请，财务审核后充值。</span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\"><br /></span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\">６、提现是否扣除手续费吗？提现到账时间？</span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\">A：回款提现扣取为五万元内一笔2元手续费，工作日24小时内到账。</span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\"><br /></span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\">７、是否能申请提前还款？</span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\">A：提前还款为借款客户的意愿决定，投资客户不能申请提前还款。</span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\"><br /></span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\">８、关于活动奖励是什么时候发放的？</span></p><p><span style=\"font-weight: normal;\"><span style=\"font-family:Microsoft YaHei;font-size:16px;\">A：投标奖励是满标后一次性发放，其他活动奖励发放详情参考该活动公告</span><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px;\">。</span></span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\"><br /></span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\">９、<span style=\"background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;\">本息垫付针对哪些会员？本息垫付条件及垫付时间？</span></span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\">A：本息垫付针对申请的VIP客户，承诺三个工作日内垫付。</span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\"><br /></span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\">１０、充值后不投资，需要提现如何收费？</span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\">A：充值后不投资15天后可正常提现，收费按正常手续。</span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\"><br /></span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\">１１、投资人投标后，如果流标，后续如何处理？</span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\">A：流标后，冻结的投资者资金直接归还到您的账户中。</span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\"><br /></span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\">１２、平台对投资人提出注销帐户时具体是怎么处理的？</span></p><p><span style=\"font-family: \'Microsoft YaHei\'; font-size: 16px; font-weight: normal;\">A：客户向客服申请，填写注销理由，审核后即可注销。</span></p><span style=\"color: rgb(51, 51, 51); font-family: \'Microsoft YaHei\', Helvetica, Arial, sans-serif; font-size: 12px; font-weight: inherit; line-height: 30px;\"><br /></span></h3>', '常见问题', '/to/single-11-101.htm', '1', '11', '0', '1');
INSERT INTO `deputysection` VALUES ('102', '0', '1', '平台优势', '102', '<p><span style=\"font-family:\" font-size:16px=\"\"></span></p><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"font-weight: bold;\"><span style=\"line-height: 30px;\"><span style=\"font-size:16px;\">&nbsp; &nbsp; &nbsp; 100%本息保障</span></span></span></span></p><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:12px;\">&nbsp; &nbsp; &nbsp; &nbsp;太平洋理财（<a href=\"http://www.tpyjr.com.cn/\"><span style=\"color: rgb(255, 0, 0);\">www.tpyjr.com.cn</span></a>）始终以保障投资者资金安全为首任，投资者通过太平洋理财平台把资金出借给融资者后，投资本金及利息可获得第三方担保机构提供的连带保证担保；若融资者在融资到期后不能及时偿付本金及利息，第三方担保机构将严格按照太平洋理财平台公布的垫付机制对投资者到期款项（本金及利息）进行偿付。 </span></span></span></p><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:12px;\">&nbsp; &nbsp; &nbsp; &nbsp;太平洋理财具有完善的风险控制体系，核心人员均来自大型商业银行风险控制部门，信贷经验丰富、作风踏实；风控团队能够娴熟运用多种风险控制措施对融资者开展尽职调查（包括但不限于：信贷征信查询、实地调研、财务分析、企业发展规划分析、融资企业现有资产调查、融资企业负责人面 谈、资金用途分析等），确保融资者具有偿还能力且融资款项用途合理；出具专业评审意见，充分揭示项目风险，建立项目风险评估报告，确定最终授信额度。</span></span></span></p><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:12px;\">&nbsp; &nbsp; &nbsp; &nbsp;太平洋理财在现有的安全保障机制下，严格控制融资者的准入门槛，同时筛选、考核具备条件的专业融资担保机构作为我们的合作伙伴，通过控制合作伙伴担保额度的杠杆比例，最大程度降低风险。</span></span></span><br /></p><p style=\"text-align: left;\"><span style=\" font-family: \'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><strong><span style=\"font-size:16px;\">&nbsp; &nbsp; &nbsp; 系统保障</span></strong></span></span><br /></p><p><span style=\"font-weight: bold;\"><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:16px;\">1.硬件故障容灾：</span></span></span></span></p><p><span style=\"font-family:Microsoft YaHei;font-size:18px;\">&nbsp; &nbsp; &nbsp; </span><span style=\"line-height: 30px;\"><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"font-size:12px;\">双服务器实时热备份，专业BGP线路IDC机房异地托管，具备优秀的异地容灾性；单台服务器做阵列，任意一个硬盘损坏不影响单台数据存储和备份，双机做主从架构可保证一台烧坏即时切换至另一台服务器，并实现双机负载均衡，保证系统高性能与不间断运行；服务器经过顶级网络安全处理，高效运行的 前提下，能更大程度上保障服务器和系统的安全；系统数据每天不同时段备份，并及时线下存档；自动化的服务器自检异常机制，确保系统正常运行。</span></span></span></p><p><span style=\"font-weight: bold;\"><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:16px;\">2.软件设计安全：</span></span></span></span></p><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:12px;\">&nbsp; &nbsp; &nbsp; 本平台，运用 Java稳定、高效、安全的框架技术，具有卓越的处理并发事务的能力，采用多种顶级加密技术，严密的网络安全处理技术等。</span></span></span></p><p><span style=\"font-weight: bold;\"><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:16px;\">3.人工检查防备:</span></span></span></span></p><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:12px;\">&nbsp; &nbsp; &nbsp; 服务器运维人员每天例行检查服务器运行情况，可及时发现异常登录及非法侵入操作记录；数据库密码、各系统管理账号密码不定期更新；太平洋理财系统内置平台数据异常自动检测系统，可随时发现平台账户数据异常。</span></span></span></p><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><strong><span style=\"font-size:16px;\">&nbsp; &nbsp; &nbsp; 理财随心</span></strong></span></span></p><p><span style=\"font-family:Microsoft YaHei;font-size:18px;\">&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:12px;\">太平洋理财投融资服务平台是一个开放性平台，针对不同类型客户需求设定了多种融资产品及融资期限，在满足融资客户需求的同时，投资理财者可根据融资项目的融资金额、融资期限、还款方式、收益回报等条件合理安排自己的资金；</span></span></span></p><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:12px;\">&nbsp; &nbsp; &nbsp; &nbsp;太平洋理财秉承普惠金融服务理念，切实践行&quot;50元理财&quot;理念，有效降低投资门槛，让更多人能够参与到投资理财的行列，拓宽民众的投资理财渠道。</span></span></span></p><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:12px;\">&nbsp; &nbsp; &nbsp; &nbsp;用户快速注册太平洋理财只需10秒钟，平台已提供7X24小时不间断服务；方便、快捷的充值通道，可随时随地将您闲置的资金充值到平台账户内，项目回款后可立即申请提现。&nbsp;</span></span></span></p><p><span style=\"font-family:\" font-size:16px=\"\"></span></p> ', '平台优势', 'to/single-12-102.htm', '1', '12', '0', '1');
INSERT INTO `deputysection` VALUES ('103', '0', '1', '平台原理', '103', '<ul><li><span style=\"color:red;\"><span style=\"font-family:\'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:16px;\">网络借贷原理</span></span></span></span></li></ul><p><span style=\"font-family:\'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:16px;\">网络投融资</span></span></span></p><p><span style=\"font-family:\'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:12px;\">&nbsp; &nbsp; &nbsp; &nbsp;网络借贷服务是民间借贷商业诚信的一种创新融资方式；传统民间借贷中熟人之间以诚信为主达成融资的契约关系，但是因为法律知识欠缺以及本息保障问题，对于融资借据的形成缺乏了解，导致双方利益难以得到保障，太平洋理财建立安全、高效、诚信的网络借贷平台，通过专业的法律知识使之规范化，使借贷流程透明化、简单化，使借入者和借出者双方均受益。</span></span></span></p><p><span style=\"font-family:Microsoft YaHei;font-size:18px;\"><span style=\"line-height: 30px;\"><br /></span></span></p><p><span style=\"font-family:\'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:12px;\">融资者：个人融资者需要资金，可通过太平洋理财服务平台，发出融资需求，向理财者借贷。一旦借贷关系成立，融资者借入资金，对理财者承担还本付息的义务。</span></span></span></p><p><span style=\"font-family:\'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:12px;\">理财者：个人理财者通过太平洋理财服务平台，借出资金给融资者，获得一定的利息回报。一旦借贷关系成立，理财者对融资者拥有债权。</span></span></span></p><p><span style=\"font-family:\'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:12px;\">第三方担保机构：依据中华人民共和国法律合法成立并有效存续的法人实体机构，可以依法提供对外第三方担保服务，第三方担保机构对融资者的融资承担连带担保责任。</span></span></span></p><ul> <li><span style=\"color:red;\"><span style=\"font-family:\'Microsoft YaHei\';\"><span style=\"font-size:16px;\">债权流转原理</span></span></span></li></ul><p><span style=\"font-family:\'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:16px;\">流转标</span></span></span></p><p><span style=\"font-family:Microsoft YaHei;font-size:18px;\">&nbsp; &nbsp; &nbsp; &nbsp; </span><span style=\"font-family:\'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:12px;\">流转标是指债权人在发生借贷关系之后，通过太平洋理财服务平台将手中的优质债权分割 成多个份额，其他理财者可通过太平洋理财平台收购转让的债权，并且债权人承诺在一定期限内回购该债权的理财品种。在债权人转让债权的期限内，理财人本金和收益的安全由合作第三方专业担保机构提供连带担保，在债权人转让债权届满时，债权人如约回购债权。</span></span></span></p><p><span style=\"font-family:\'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:16px;\">实例分析</span></span></span></p><p><span style=\"font-family:Microsoft YaHei;font-size:18px;\">&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=\"font-family:\'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:12px;\">小王借款给小霞10万人民币，为期两年。由于小王临时需要一笔资金周转，通过太平洋理财服务平台小王将对小霞的10万债权分成了20份，每份人民币5仟元，转让给太平洋理财平台上的其他理财人，小王承诺三个月内回购原来出让的债权。</span></span></span></p><p><span style=\"font-family:\'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:12px;\">&nbsp; &nbsp; &nbsp; &nbsp;在理财人受让债权后到小王回购债权期间，流转标产生的利息归认购的理财人所有，并由第三方专业担保机构提供本息担保；三个月内小王回购出让的债权，并返还10万元本金给理财人。</span></span></span></p><p><br /></p>', '平台原理', 'to/single-12-103.htm', '1', '12', '0', '1');
INSERT INTO `deputysection` VALUES ('104', '0', '1', '费用说明', '104', '<p><span lang=\"EN-US\" style=\"font-size: 16px; line-height: 30px; font-family: \'Microsoft YaHei\';\">[</span><span style=\"font-size: 16px; line-height: 30px; font-family: \'Microsoft YaHei\';\">其他说明</span><span lang=\"EN-US\" style=\"font-size: 16px; line-height: 30px; font-family: \'Microsoft YaHei\';\">]</span></p><p style=\"background-position: initial initial; background-repeat: initial initial;\"><span style=\"font-family:Microsoft YaHei;font-size:12px;\">1、充值：通过第三方支付平台充值的资金全部免手续费；通过线下充值的资金，金额达一万元以上的奖励<span lang=\"EN-US\">0.1%</span>的补贴。<span lang=\"EN-US\"><o:p></o:p></span></span></p><p style=\"background-position: initial initial; background-repeat: initial initial;\"><span style=\"font-family:Microsoft YaHei;font-size:12px;\"><span style=\"line-height: 30px;\">2、提现账户：太平洋理财服务平台的提现银行账户必须为本人实名登记的有效的银行借记卡，不提供其他转账方式。<span lang=\"EN-US\"><o:p></o:p></span></span></span></p><p style=\"background-position: initial initial; background-repeat: initial initial;\"><span style=\"line-height: 30px;\"><span style=\"font-family:Microsoft YaHei;font-size:12px;\">3、提现计划：每次提现最低金额为<span lang=\"EN-US\">50</span>元，客户提现时间为星期一到星期五下午四点止，每天处理两次，分别为上午<span lang=\"EN-US\">11:00</span>和下午<span lang=\"EN-US\">16:30</span>，下午四点后申请提现次日处理；累计申请提现金额内当天处理，<span lang=\"EN-US\">24</span>小时内到账，周末及节假日顺延处理，谢谢。<span lang=\"EN-US\"><o:p></o:p></span></span></span></p><p style=\"background-position: initial initial; background-repeat: initial initial;\"><span style=\"line-height: 30px;\"><span style=\"font-family:Microsoft YaHei;font-size:12px;\">4、信用卡说明：太平洋理财禁止信用卡套现、虚假交易等行为<span lang=\"EN-US\">,</span>一经发现将予以处罚<span lang=\"EN-US\">,</span>包括但不限于：限制收款、冻结账户、永久停止服务<span lang=\"EN-US\">,</span>并有可能影响相关信用记录。为了防止信用卡套现，所有充值到网站的资金无投资十五天后可正常提现。<span lang=\"EN-US\"><o:p></o:p></span></span></span></p><p style=\"background-position: initial initial; background-repeat: initial initial;\"><span style=\"line-height: 30px;\"><span style=\"font-family:Microsoft YaHei;font-size:12px;\">5、逾期处理：太平洋理财有权将借款人的有关资料正式备案在<span lang=\"EN-US\">&quot;</span>不良信用记录<span lang=\"EN-US\">&quot;</span>，列入全国个人信用评级体系的黑名单 （<span lang=\"EN-US\">&quot;</span>不良信用记录<span lang=\"EN-US\">&quot;</span>数据将为银行、电信、担保公司、人才中心等有关机构提供个人不良信用信息），同时 保留对借款人采取法律措施的权利，由此所产生的所有法律后果将由借款人承担。<span lang=\"EN-US\"><o:p></o:p></span></span></span></p><span style=\"font-family:Microsoft YaHei;font-size:16px;\"><br /></span><p><br /></p>', '费用说明', 'to/single-12-104.htm', '1', '12', '0', '1');
INSERT INTO `deputysection` VALUES ('105', '0', '1', '法律法规', '105', '<p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:16px;\">关于民间借贷规定的合法性 </span></span></span></p><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:12px;\">&nbsp; &nbsp; &nbsp; &nbsp;根据《合同法》第二百一十一条：自然人之间的借款合同对支付利息没有约定或者约定不明确的，视为不支付利息。自然人之间的借款合同约定支付利息的，借款的利率不得违反国家有关限制借款利率的规定。</span></span></span></p><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:12px;\">&nbsp; &nbsp; &nbsp; &nbsp;根据《最高人民法院关于人民法院审理借贷案件的若干意见》第六条：民间借贷的利率可以适当高于银行的利率，各地人民法院可根据本地区的实际情况具体掌握，但最高不得超过银行同类贷款利率的四倍（包含利率本数）。超出此限度的，超出部分的利息不予保护。</span></span></span></p><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:16px;\">关于电子合同的合法性及可执行性 </span></span></span></p><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:12px;\">&nbsp; &nbsp; &nbsp; &nbsp;根据《合同法》第十条：当事人订立合同，有书面形式、口头形式和其他形式。第十一条：书面形式是指合同书、信件和数据电文（包括电报、电传、传真、电子数据交 换和电子邮件）等可以有形地表现所载内容的形式。依据上述法律规定可见电子合同是我国法律明确认可的一种合同形式，所以效力可以等同于传统的纸质合同。</span></span></span></p><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:16px;\">关于提供居间撮合服务的合法性</span></span></span></p><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:12px;\">&nbsp; &nbsp; &nbsp; &nbsp;根据《合同法》第23章关于&quot;居间合同&quot;的规定，特别是第424条规定的&quot;居间合同是居间人向委托人报告订立合同的机会或者提供订立合同的媒介服务，委托人支付报酬的合同&quot;，为民间借贷提供撮合借贷双方形成借贷关系的居间服务有着明确的法律基础。</span></span></span></p><p><span style=\"line-height: 30px;\"><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"font-size:16px;\">关于保证人的规定和责任</span></span></span></p><p><span style=\"font-family: \'Microsoft YaHei\';\"><span style=\"line-height: 30px;\"><span style=\"font-size:12px;\">&nbsp; &nbsp; &nbsp; &nbsp;根据《最高人民法院关于人民法院审理借贷案件的若干意见》第十六条：有保证人的借贷债务到期后，债务人有清偿能力的，由债务人承担责任；债务人无能力清偿、无法清偿或者债务人下落不明的，由保证人承担连带责任。</span></span></span></p>', '法律法规', 'to/single-12-105.htm', '1', '12', '0', '1');
INSERT INTO `deputysection` VALUES ('109', '0', '1', '开放式平台介绍', '109', '', '开放式平台介绍', 'to/single-4-109.htm', '1', '4', '0', '0');
INSERT INTO `deputysection` VALUES ('110', '0', '0', '理财产品介绍', '110', '', '理财产品介绍', 'to/single-2-110.htm', '1', '2', '0', '0');
INSERT INTO `deputysection` VALUES ('111', '0', '0', '理财计划', '111', '', '理财计划', 'loaninfo/getYouxuanInfo.htm', '1', '2', '0', '0');
INSERT INTO `deputysection` VALUES ('112', '0', '1', '散标投资', '112', '', '散标投资', 'loaninfo/openLoan.htm', '1', '2', '0', '0');
INSERT INTO `deputysection` VALUES ('113', '0', '1', '债权转让', '113', '', '债权转让', 'loaninfo/openLoanCir.htm', '1', '2', '0', '0');
INSERT INTO `deputysection` VALUES ('114', '0', '0', '还款黑名单', '114', '', '还款黑名单', 'to/single-2-114.htm', '1', '2', '0', '0');
INSERT INTO `deputysection` VALUES ('115', '0', '1', '进入开发式平台', '0', null, '进入开发式平台', 'to/single-4-115.htm', '1', '4', '0', '0');
INSERT INTO `deputysection` VALUES ('118', '1', '1', '理财方案', '0', null, '理财方案', 'to/list-1-118.htm', '2', '1', '0', '1');
INSERT INTO `deputysection` VALUES ('123', '0', '0', '存抵宝', '123', '<span style=\"font-family:Microsoft YaHei;color:#333333;font-size:15px;line-height:25px;\"></span><h3 style=\"box-sizing: border-box; margin: 10px 0px; padding: 0px; border: 0px; outline: 0px; font-family: \'Microsoft YaHei\', Helvetica, Arial, sans-serif; font-size: 16px; font-stretch: inherit; line-height: 24px; vertical-align: baseline; color: rgb(51, 51, 51); text-rendering: optimizelegibility;\"></h3><h3 style=\"box-sizing: border-box; margin: 10px 0px; padding: 0px; border: 0px; outline: 0px; font-stretch: inherit; line-height: 24px; vertical-align: baseline; color: rgb(51, 51, 51); text-rendering: optimizelegibility;\"></h3><h3 style=\"font-family: Simsun;\"><span style=\"font-size: 18px;\">产品介绍</span></h3><div style=\"font-family: Simsun; text-indent: 2em;\"><span style=\"font-size:16px;font-weight: normal;\">存抵宝业务主要为中小微企业客户提供短期周转资金，平台重点支持200万元以下特别是50-100万小微客户的融资需求；融资客户以自有财产或第三方提供的财产（包括房产、车产等）及保证金作抵质押担保，第三方承诺项目逾期三个工作日内全额垫付本金和收益，如未能全额垫付，平台承诺在十个工作日内通过快速变现的方式处理融资主体或第三方提供的抵押物，以偿还投资人本金及利息。</span></div><h3 style=\"font-family: Simsun;\"><span style=\"font-size: 18px;\">准入机制</span></h3><div style=\"font-family: Simsun; text-indent: 2em;\"><span style=\"font-weight: normal;\"><span style=\"font-size:16px;\">在严格准入标准前提下，融资客户向平台提出融资申请后由太平洋理财开展贷前审核并出具独立调研风险评估报告。一般采用：信贷征信查询、实地调研、财务分析、融资主体发展规划分析、融资主体现有财产调查、融资主体负责人面谈、资金用途分析等多种专业调研方式，并召开风险评审会，全面分析项目可行性，最终确定准入资格和授信额度。</span></span></div><h3 style=\"font-family: Simsun;\"><span style=\"font-size: 18px;\">准入机制</span></h3><div style=\"font-family: Simsun; text-indent: 2em;\"><span style=\"font-weight: normal;\"><span style=\"font-size:16px;\">在严格准入标准前提下，融资客户向平台提出融资申请后由第三方专业机构及太平洋理财联合开展贷前审核并出具独立调研风险评估报告。一般采用：信贷征信查询、实地调研、财务分析、企业发展规划分析、企业现有财产调查、企业负责人面谈、资金用途分析等多种专业调研方式，并召开风险评审会，全面分析项目可行性，最终确定准入资格和授信额度。</span></span></div><h3 style=\"font-family: Simsun;\"><span style=\"font-size: 18px;\">监管和保障</span></h3><div style=\"font-family: Simsun; text-indent: 2em;\"><span style=\"font-weight: normal;\"><span style=\"font-size:16px;\">本产品的最终发布均要求融资主体和关联担保企业办妥相关抵押登记手续及签订反担保方案；抵押物严格按照中国人民共和国颁布的《物权法》、《担保法》规定，将抵押物抵押于平台相关人员名下，由平台严格监控贷后资金流向，保证抵押物全额覆盖风险敞口。</span></span></div><div><span style=\"margin: 15px 0px 0px 30px; padding: 0px; list-style: none; outline: none; font-family: \'Microsoft YaHei\'; color: rgb(51, 51, 51); display: block; line-height: 25px; width: 765px;\"><a href=\"http://221.5.96.71:9091/borrow/start-apply?type=2\" style=\"margin: 0px; padding: 0px; list-style: none; text-decoration: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); cursor: pointer;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 18px; font-family: \'Microsoft YaHei\'; cursor: pointer; display: block; width: 185px; height: 40px; line-height: 40px; border-radius: 5px; text-align: center; color: rgb(255, 255, 255); text-shadow: rgb(102, 102, 102) 1px 0px 1px; float: left; background-color: rgb(59, 139, 212);\">立即申请</span></a></span><div class=\"clear\" style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; clear: both; color: rgb(51, 51, 51); line-height: 18px;\"></div><span style=\"margin: 15px 0px 0px 30px; padding: 0px; list-style: none; outline: none; font-family: \'Microsoft YaHei\'; color: rgb(51, 51, 51); display: block; line-height: 25px; width: 765px;\"><br /></span><span style=\"font-size:16px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: \'Microsoft YaHei\'; color: rgb(51, 51, 51); line-height: 25px; float: left;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 16px; font-family: 微软雅黑, \'Microsoft YaHei\';\">申请资料：</span></span><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: \'Microsoft YaHei\'; color: rgb(51, 51, 51); line-height: 25px; float: left;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 16px; font-family: 微软雅黑, \'Microsoft YaHei\';\">（1）身份证、社保卡、行驶证（如有）、房产证（如有）。<br style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12px;\" />（2）营业执照、税务登记证、组织机构代码证、公司章程（如有）公司最近的验资报告（如有）开户许可证，资产负债表，财务报表。<br style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12px;\" />（3）公司有效租赁合同、近3个月交租发票。<br style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12px;\" />（4）近6个月企业对公银行流水、6个月个人流水。<br style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12px;\" />（5）企业近3个月大额购销合同、企业现有固定资产清单（有助于高额度）。<br style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12px;\" />（6）近三个月员工工资单及企业通讯录（管理层）。<br style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12px;\" />（7）个人住址的房产证或者租赁合同和近2期水电费单据。</span></span><br /></span></div><span style=\"font-size:16px;\"><span style=\"font-family: \'Microsoft YaHei\'; color: rgb(51, 51, 51); margin: 15px 0px 0px 30px; display: inline; line-height: 25px; width: 680px;\"></span></span><span style=\"font-family: \'Microsoft YaHei\'; color: rgb(51, 51, 51); margin: 15px 0px 0px 30px; display: block; line-height: 25px;\"><span style=\"font-family: \'Microsoft YaHei\'; float: left;\"><span style=\"font-family:Microsoft YaHei;color:#333333;float:left;font-size:15px;\"><br /></span></span></span><div class=\"clear\"></div>', '存抵宝', 'to/single-3-123.htm', '1', '3', '0', '0');
INSERT INTO `deputysection` VALUES ('124', '0', '1', '加入我们', '124', '<div style=\"font-family:\" font-size:=\"\" 16px=\"\"><p><span style=\"font-family:Microsoft YaHei;font-size:16px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;太平洋金融拥有充满激情和梦想的创业团队，吸引了来自金融及信息科技领域的顶尖人才，我们致力于在潜力巨大的互联网金融领域成为行业领袖。在公司迅速扩张期，我们需要更多优秀人才加入，在这里您可以获得宝贵的互联网金融创新领域工作经历，实现自我增值。</span></p><br /><hr /><br /><p style=\"font-size: 18px; font-weight: border;\">网页设计师</p><br /><p style=\"font-size: 15px; font-weight: border;\">岗位职责：</p><p>1、负责公司软件产品UI设计及软件界面设计等；</p><p>2、负责将页面效果与研发人员结合，共同探讨用户体验相关；</p><p>3、负责WEB界面需求绘制成完整的页面效果图；</p><p>4、重新设计、美化现有的软件系统界面。</p><br /><p style=\"font-size: 15px; font-weight: border;\">任职资格：</p><p>1、两年以上设计经验，有独立完成项目设计的能力，对用户体验设计有一定的理解；</p><p>2、有探索与创新精神，善于沟通，能与团队成员密切沟通与协作，与公司一起成长；</p><p>3、精通PS、AI等常用设计软件；</p><p>4、有互联网公司设计工作经验者优先。</p><br /><hr /><br /><p style=\"font-size: 18px; font-weight: border;\">高级产品经理</p><br /><p style=\"font-size: 15px; font-weight: border;\">岗位职责：</p><p>1、负责分析市场和用户的需求。</p><p>2、负责对竞争产品、行业产品、行业相关信息的收集整理和深度分析。</p><p>3、负责设计满足用户需求的新产品和新功能，优化已有功能或策略以提升用户体验（逻辑修改、用户体验改善、各操作流程优化），持续性优化产品。</p><p>4、负责项目文档的撰写，与研发团队密切配合，驱动项目的开发进度，保证完成质量。</p><p>5、负责产品的原型设计与产品规划。</p><br /><p style=\"font-size: 15px; font-weight: border;\">任职资格：</p><p>1、本科以上学历，金融类相关专业者优先，2年以上PC/互联网/移动互联网产品相关工作经验，对产品设计工作充满热情和梦想，思维活跃，富有创新精神，能承受较大的工作压力。</p><p>2、熟悉互联网或客户端软件产品整体实现过程，包括从需求分析到产品发布。有敏锐的市场洞察能力，严密的逻辑分析能力，良好的沟通协作能力，以及一定的技术理解能力。</p><p>3、能够独立完成对产品的设计，撰写产品文档。包括产品原型（Axure原型、visio原型）、说明文档等。擅长交互设计者优先。</p><br /><hr /><br /><p style=\"font-size: 18px; font-weight: border;\">Web前端工程师</p><br /><p style=\"font-size: 15px; font-weight: border;\">职位描述：</p><p>1. 负责网站 Web 前端开发工作， 开发的系统具有高性能和高可靠性；</p><p>2. 制定并使用通用的CSS开发框架,编写JS界面交互程序;</p><p>3. 优化各类产品前端页面的执行效率。</p><p>4. 维护及优化网站前端性能，优化前端开发模式和规范；</p><p>5. JavaScript程序模块开发，通用类库、框架编写，主导前端交互框架的开发和推广；</p><br /><p style=\"font-size: 15px; font-weight: border;\">任职资格：</p><p>1. 2年以上WEB前端开发工作经验；</p><p>2. 精通HTML/XHTML、CSS，熟悉页面架构和布局，对Web标准和标签语义化有深入理解，至少了解一种 Web 开发语言（PHP、Java）;</p><p>3. 熟悉各种 Web 客户端，尤其是主流 Web 浏览器的开发模式和特性，了解常用浏览器兼容性问题的处理办法;</p><p>4. 对JavaScript性能、多浏览器兼容性、面对组件开发有独到的解决方案；</p><p>5. 理解 AJAX 运作机制，了解常见 JS 开发框架（如 jQuery、Mootools、YUI等）；</p><p>6. 对 Web 前台的性能优化以及 Web 常见漏洞有一定的理解和相关实践；对于大型 Web 站点性能问题的定位和解决有经验者更佳；</p><p>7. 对HTML5技术领域、新兴Web标准和Web发展趋势有良好洞察力和极高的关注度，有强烈的求知欲；</p><p>8. 代码开发规范整洁，拥有严谨的工作态度，工作自主驱动，具备良好的问题定位分析能力；</p><br /><hr /><br /><p style=\"font-size: 18px; font-weight: border;\">JAVA工程师</p><br /><p style=\"font-size: 15px; font-weight: border;\">岗位职责：</p><p>1、负责/参与技术架构设计、重构、优化，根据业务规划及技术规划制定应用架构方案；</p><p>2、负责/参与网贷平台系统的架构设计和系统设计、详细设计；</p><p>3、主导/参与技术难题攻关，持续提升核心系统在高并发、海量请求数下的高处理性能；</p><p>4、核心功能的架构与代码模板编写，开发与维护系统公用核心模块；</p><p>5、审核和评估相关方案与设计，以确保其符合架构规划，满足业务需求；</p><p>6、分析系统瓶颈，解决各种疑难杂症，对系统进行性能调优；</p><p>7、通过对团队的培训与指导，提高整个团队的技术水平。</p><br /><p style=\"font-size: 15px; font-weight: border;\">任职资格：</p><p>1、本科及以上学历，计算机相关专业，2年以上相关经验；</p><p>2、具有深厚的专业技术基础，精通Java EE相关技术，熟悉Spring, iBatis，Hibernate，Struts等开源框架；</p><p>3、熟悉页面开发相关技术，熟悉Linux操作系统使用；</p><p>4、熟悉MySQL、MongoDB等数据库开发与设计以及缓存系统REDIS或 Memcached的设计和研发；</p>    <p>5、具备良好的需求分析能力、业务和技术方案策划和设计能力；思路清晰，具备很强的文档撰写能力和良好的语言表达能力；</p>    <p>6、有创业创新精神者优先</p><br /><hr /><br /><p><span style=\"font-family:Microsoft YaHei;font-size:16px;\">公司将提供优厚的福利及广阔的事业发展空间</span></p><span style=\"font-family:Microsoft YaHei;font-size:16px;\"><br /></span><p><span style=\"font-family:Microsoft YaHei;font-size:16px;\">1、假期安排：享受法定节假日。</span></p><p><span style=\"font-family:Microsoft YaHei;font-size:16px;\">2、公司活动：定期组织员工外出旅游</span></p><p><span style=\"font-family:Microsoft YaHei;font-size:16px;\">3、薪酬福利：年终奖金、通讯补贴，按国家规定购买社会保险、为员工额外购买人身意外保险。</span></p><p><span style=\"font-family:Microsoft YaHei;font-size:16px;\">4、工作时间：9：30—18：30，周末双休；工作地点：深圳市南山区桃园地铁口田厦国际中心B座2038。</span></p><span style=\"font-family:Microsoft YaHei;font-size:16px;\"><br /></span><p><span style=\"font-family:Microsoft YaHei;font-size:16px;\">应聘简历发送至xionglingling@tpyp2p.com并注明申请职位</span></p></div>', '加入我们', 'to/single-10-124.htm', '1', '10', '0', '0');
INSERT INTO `deputysection` VALUES ('125', '0', '1', '联系我们', '125', '<div style=\"font-family:\" font-size:=\"\" 18px=\"\"><p><span style=\"font-family:Microsoft YaHei;font-size:16px;\">全国免费客服热线：0755-86707492</span></p><p><span style=\"font-family:Microsoft YaHei;font-size:16px;\">网址：www.tpyp2p.com</span></p><p><span style=\"font-family:Microsoft YaHei;font-size:16px;\">官方群：待定</span></p><p><span style=\"font-family:Microsoft YaHei;font-size:16px;\">地址：广东省深圳市南山区桃园地铁口田厦国际中心B座2038</span></p></div>', '联系我们', 'to/single-10-125.htm', '1', '10', '0', '1');
INSERT INTO `deputysection` VALUES ('126', '0', '1', '公司地图', '126', '<div style=\"text-align: center;\"><img src=\"/upload/map/map.png\" alt=\"\" /><br /></div>', '公司地图', 'to/single-10-126.htm', '1', '10', '0', '0');
INSERT INTO `deputysection` VALUES ('128', '0', '1', '太平洋理财网站服务协议', '128', '<p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px; text-align: center;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">最后更新时间：2014年12月25日</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">本网站由</span><span style=\"font-family: 微软雅黑; font-size: 10.5pt;\">深圳市</span><span style=\"font-family: 微软雅黑; font-size: 10.5pt;\">太平洋理财电子商务有限公司负责并运营（以下“本网站”均指网站及<span style=\"color: rgb(102, 102, 102); font-family: 微软雅黑; font-size: 14px; line-height: 25px;\">深圳市</span>太平洋理财电子商务有限公司（以下简称“太平洋理财”））。在您注册成为本网站用户前请务必仔细阅读以下条款。若您一旦注册，则表示您同意接受本网站的服务并受以下条款的约束。若您不接受以下条款，请您立即停止注册或主动停止使用本网站的服务。</span></p><h2 style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12px; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">一</span><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">、</span><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">本协议的签署和修订</span></h2><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">1.1</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">本网站只接受持有中国有效身份证明的18周岁以上具有完全民事行为能力的自然人成为网站用户。如您不符合资格，请勿注册，否则本网站有权随时中止或终止您的用户资格。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">1.2</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">本协议内容包括以下条款及本网站已经发布的或将来可能发布的各类规则。所有规则为本协议不可分割的一部分，与协议正文具有同等法律效力。本协议是您与本网站共同签订的，适用于您在本网站的全部活动。在您注册成为用户时，您已经阅读、理解并接受本协议的全部条款及各类规则，并承诺遵守中国的各类法律规定，如有违反而导致任何法律后果的发生，您将以自己的名义独立承担所有相应的法律责任。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">1.3</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">本网站有权根据需要不时地修改本协议或根据本协议制定、修改各类具体规则并在本网站相关系统板块发布，无需另行单独通知您。您应不时地注意本协议及具体规则的变更，若您在本协议及具体规则内容公告变更后继续使用本服务的，表示您已充分阅读、理解并接受修改后的协议和具体规则内容，也将遵循修改后的协议和具体规则使用本网站的服务；同时就您在协议和具体规则修订前通过本网站进行的交易及其效力，视为您已同意并已按照本协议及有关规则进行了相应的授权和追认。若您不同意修改后的协议内容，您应停止使用本网站的服务。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">1.4</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">您通过自行或授权有关方根据本协议及本网站有关规则、说明操作确认本协议后，本协议即在您和本网站之间产生法律效力。本协议不涉及您与本网站的其他用户之间因网上交易而产生的法律关系或法律纠纷，但您在此同意将全面接受和履行与本网站其他用户在本网站签订的任何电子法律文本，并承诺按该等法律文本享有和/或放弃相应的权利、承担和/或豁免相应的义务。</span></p><h2 style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12px; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">二</span><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">、</span><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">服务的提供</span></h2><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">2.1</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">本网站提供的服务包括但不限于：发布借款需求、查阅交易机会、签订和查阅合同、资金充值、提现、代收、代付等，具体详情以本网站当时提供的服务内容为准。您同意，针对借款人用户，本网站有权根据借款人提供的各项信息及本网站独立获得的信息评定借款人在本网站所拥有的个人信用等级，或决定是否审核通过借款人的借款申请。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">2.2</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">基于运行和交易安全的需要，本网站可以暂时停止提供、限制或改变本网站服务的部分功能，或提供新的功能。在任何功能减少、增加或者变化时，只要您仍然使用本网站的服务，表示您仍然同意本协议或者变更后的协议。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">2.3</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">您确认，您在本网站上按本网站服务流程所确认的交易状态将成为本网站为您进行相关交易或操作（包括但不限于冻结资金、代为支付或收取款项、订立合同等）的明确指令。您同意本网站有权按相关指令依据本协议和/或有关文件和规则对相关事项进行处理。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">2.4</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">您未能及时对交易状态进行修改或确认或未能提交相关申请所引起的任何纠纷或损失由您本人负责，本网站不承担任何责任。</span></p><h2 style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12px; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">三</span><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">、</span><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">交易管理及费用</span></h2><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">3.1</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">在您成功注册后，您可以自行或授权您的代理人根据本网站有关规则和说明，通过本网站确认签署有关协议并经本网站审核通过后实现借款需求或资金的出借（出借方式包括但不限于向借款人直接出借或受让债权等形式）。详细操作规则及方式请见有关协议及本网站相关页面的规则和说明。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">3.2</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">本网站将为您的借款、还款或资金的出借、回收等交易提供服务，并在服务过程中根据有关文件、协议和/或本网站页面的相关规则、说明等收取必要的服务或管理费用，其具体内容、比例、金额等事项请参见有关文件及本网站相关页面的规则和说明（包括但不限于，就您每一笔成功转让的债权，本网站有权基于您所转让债权的金额向您收取一定比例的转让管理费等款项作为服务费用，具体比例及金额等请参见本网站的债权转让相关规则和说明）。您同意，本网站有权不时调整前述服务或管理费用的类型或金额等具体事项并根据本协议和相关规则进行公告、修改。</span></p><h2 style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12px; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">四</span><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">、</span><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">资金管理</span></h2><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">4.1</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">就您在本网站进行的借款或出借，本网站和/或本网站委托的第三方机构将为您提供“资金管理服务”，主要包括但不限于：资金的充值、提现、代收、代付、查询等。您可以通过本网站有关页面的具体规则或说明详细了解。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">4.2</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">您了解，上述充值、提现、代收、代付以及查询等服务涉及本网站与第三方支付机构或金融机构的合作。您同意：(a) 受第三方支付机构或金融机构可能仅在工作日进行资金代扣及划转的现状等各种原因所限，本网站不对前述服务的资金到账时间做任何承诺，也不承担与此相关的责任，包括但不限于由此产生的利息、货币贬值等损失；(b) 一经您使用前述服务，即表示您不可撤销地授权本网站进行相关操作，且该等操作是不可逆转的，您不能以任何理由拒绝付款或要求取消交易。就前述服务，您应按照有关文件及第三方支付机构或金融机构的规定支付第三方的费用，您与第三方之间就费用支付事项产生的争议或纠纷，与本网站无关。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">4.3</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">您保证并承诺您通过本网站平台进行交易的资金来源合法。您同意，本公司有权按照包括但不限于公安机关、检察机关、法院等司法机关、行政机关、军事机关的要求协助对您的账户及资金等进行查询、冻结或扣划等操作。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">4.4</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">本网站有权基于交易安全等方面的考虑不时设定涉及交易的相关事项，包括但不限于交易限额、交易次数等。您了解，本网站的前述设定可能会对您的交易造成一定不便，您对此没有异议。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">4.5</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">如果本网站发现了因系统故障或其他原因导致的处理错误，无论有利于本网站还是有利于您，本网站都有权在根据本协议规定通知您后纠正该错误。如果该错误导致您实际收到的金额少于您应获得的金额，则本网站在确认该处理错误后会尽快将您应收金额与实收金额之间的差额存入您的用户账户。如果该错误导致您实际收到的金额多于您应获得的金额，则无论错误的性质和原因为何，您都应及时根据本网站向您发出的有关纠正错误的通知的具体要求返还多收的款项或进行其他操作。您理解并同意，您因前述处理错误而多付或少付的款项均不计利息，本网站不承担因前述处理错误而导致的任何损失或责任（包括您可能因前述错误导致的利息、汇率等损失），但因本网站恶意而导致的处理错误除外。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">4.6</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">在任何情况下，对于您使用本网站服务过程中涉及由第三方提供相关服务的责任由该第三方承担，本网站不承担该等责任。因您自身的原因导致本网站服务无法提供或提供时发生任何错误而产生的任何损失或责任，由您自行负责，本网站不承担责任。</span></p><h2 style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12px; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">五</span><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">、</span><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">电子合同</span></h2><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">5.1</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">在本网站平台交易需订立的协议采用电子合同方式，可以有一份或者多份并且每一份具有同等法律效力。您或您的代理人根据有关协议及本网站的相关规则在本网站确认签署的电子合同即视为您本人真实意愿并以您本人名义签署的合同，具有法律效力。您应妥善保管自己的账户密码等账户信息，您通过前述方式订立的电子合同对合同各方具有法律约束力，您不得以账户密码等账户信息被盗用或其他理由否认已订立的合同的效力或不按照该等合同履行相关义务。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">5.2</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">您根据本协议以及本网站的相关规则签署电子合同后，不得擅自修改该合同。本网站向您提供电子合同的保管查询、核对等服务，如对电子合同真伪或电子合同的内容有任何疑问，您可通过本网站的相关系统板块查阅有关合同并进行核对。如对此有任何争议，应以本网站记录的合同为准。</span></p><h2 style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12px; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">六</span><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">、</span><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">用户信息及隐私权保护</span></h2><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">6.1</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">用户信息的提供、搜集及核实</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">6.1.1</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">您有义务在注册时提供自己的真实资料，并保证诸如电子邮件地址、联系电话、联系地址、邮政编码等内容的有效性、安全性和及时更新，以便本网站为您提供服务并与您进行及时、有效的联系。您应完全独自承担因通过这些联系方式无法与您取得联系而导致的您在使用本服务过程中遭受的任何损失或增加任何费用等不利后果。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">6.1.2</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">本网站可能自公开及私人资料来源收集您的额外资料，以更好地了解本网站用户，并为其度身订造本网站服务、解决争议和确保在网站进行交易的安全性。本网站仅收集本网站认为就此目的及达成该目的所必须的关于您的个人资料。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">6.1.3</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">您同意本网站可以自行或通过合作的第三方机构对您提交或本网站搜集的用户信息（包括但不限于您的个人身份证信息等）进行核实，并对获得的核实结果根据本协议及有关文件进行查看、使用和留存等操作。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">6.1.4</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">本网站按照您在本网站上的行为自动追踪关于您的某些资料。本网站利用这些资料进行有关本网站之用户的人口统计、兴趣及行为的内部研究，以更好地了解您以便向您和本网站的其他用户提供更好的服务。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">6.1.5</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">本网站在本网站的某些网页上使用诸如“Cookies”的资料收集装置。“Cookies”是设置在您的硬盘上的小档案，以协助本网站为您提供度身订造的服务。本网站亦提供某些只能通过使用“Cookies”才可得到的功能。本网站还利用“Cookies”使您能够在某段期间内减少输入密码的次数。“Cookies”还可以协助本网站提供专门针对您的兴趣而提供的资料。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">6.1.6</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">如果您将个人通讯信息（例如：手机短信、电邮或信件）交付给本网站，或如果其他用户或第三方向本网站发出关于您在本网站上的活动或登录事项的通讯信息，本网站可以将这些资料收集在您的专门档案中。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">6.2</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">用户信息的使用和披露</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">6.2.1</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">您同意本网站可使用关于您的个人资料（包括但不限于本网站持有的有关您的档案中的资料，及本网站从您目前及以前在本网站上的活动所获取的其他资料）以解决争议、对纠纷进行调停、确保在本网站进行安全交易，并执行本网站的服务协议及相关规则。本网站有时候可能调查多个用户以识别问题或解决争议，特别是本网站可审查您的资料以区分使用多个用户名或别名的用户。为限制在网站上的欺诈、非法或其他刑事犯罪活动，使本网站免受其害，您同意本网站可通过人工或自动程序对您的个人资料进行评价。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">6.2.2</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">您同意本网站可以使用您的个人资料以改进本网站的推广和促销工作、分析网站的使用率、改善本网站的内容和产品推广形式，并使本网站的网站内容、设计和服务更能符合用户的要求。这些使用能改善本网站的网页，以调整本网站的网页使其更能符合您的需求，从而使您在使用本网站服务时得到更为顺利、有效、安全及度身订造的交易体验。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">6.2.3</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">您同意本网站利用您的资料与您联络并（在某些情况下）向您传递针对您的兴趣而提供的信息，例如：有针对性的广告条、行政管理方面的通知、产品提供以及有关您使用本网站的通讯。您接受本协议即视为您同意收取这些资料。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">6.2.4</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">您注册成功后应妥善保管您的用户名和密码。您确认，无论是您还是您的代理人，用您的用户名和密码登录本网站后在本网站的一切行为均代表您并由您承担相应的法律后果。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">6.2.5</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">本网站对于您提供的、自行收集到的、经认证的个人信息将按照本协议及有关规则予以保护、使用或者披露。本网站将采用行业标准惯例以保护您的个人资料，但鉴于技术限制，本网站不能确保您的全部私人通讯及其他个人资料不会通过本协议中未列明的途径泄露出去。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">6.2.6</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">您使用本网站服务进行交易时，您即授权本公司将您的包括但不限于真实姓名、联系方式、信用状况等必要的个人信息和交易信息披露给与您交易的另一方或本网站的合作机构（仅限于本网站为完成拟向您提供的服务而合作的机构）。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">6.2.7</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">本网站有义务根据有关法律要求向司法机关和政府部门提供您的个人资料。在您未能按照与本协议、本网站有关规则或者与本网站其他用户签订的有关协议的约定履行自己应尽的义务时（包括但不限于当您作为借款人借款逾期或有其他违约时），本网站有权根据自己的判断、有关协议和规则、国家生效裁决文书或者与该笔交易有关的其他用户的合理请求披露您的个人资料（包括但不限于在本网站及互联网络上公布您的违法、违约行为，并有关将该内容记入任何与您相关的信用资料、档案或数据库），并且作为出借人的其他用户可以采取发布您的个人信息的方式追索债权或通过司法部门要求本网站提供相关资料，本网站对此不承担任何责任。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">6.3</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">您对其他用户信息的使用</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">6.3.1</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">在本网站提供的交易活动中，您无权要求本网站提供其他用户的个人资料，除非符合以下条件：</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">（1） 您已向法院起诉其他用户的在本网站活动中的违约行为；</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">（2） 与您有关的其他用户逾期未归还借款本息；</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">（3） 本网站被吊销营业执照、解散、清算、宣告破产或者其他有碍于您收回借款本息的情形。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">6.3.2</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">如您通过签署有关协议等方式获得其他用户的个人信息，您同意不将该等个人信息用于除还本付息或向借款人追索债权以外的其他任何用途，除非该等信息根据适用的法律规定、被有管辖权的法院或政府部门要求披露。</span></p><h2 style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12px; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">七</span><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">、</span><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">不保证及使用限制</span></h2><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">7.1</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">不保证</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">7.1.1</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">在任何情况下，本网站及其股东、创建人、高级职员、董事、代理人、关联公司、母公司、子公司和雇员（以下称“本网站方”）均不以任何明示或默示的方式对您使用本网站服务而产生的任何形式的直接或间接损失承担法律责任，包括但不限于资金损失、利润损失、营业中断损失等，无论您通过本网站形成的借贷关系是否适用本网站的风险备用金规则或者是否存在第三方担保，并且本网站方不保证网站内容的真实性、充分性、及时性、可靠性、完整性和有效性，并且免除任何由此引起的法律责任。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">7.1.2</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">本网站不能保证也没有义务保证第三方网站上的信息的真实性和有效性。您应按照第三方网站的服务协议使用第三方网站，而不是按照本协议。第三方网站的内容、产品、广告和其他任何信息均由您自行判断并承担风险，而与本网站无关。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">7.1.3</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">因为本网站或者涉及的第三方网站的设备、系统存在缺陷、黑客攻击、网络故障、电力中断、计算机病毒或其他不可抗力因素造成的损失，本网站均不负责赔偿，您的补救措施只能是与本网站协商终止本协议并停止使用本网站。但是，中国现行法律、法规另有规定的除外。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">7.2</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">使用限制</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">7.2.1</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">您承诺合法使用本网站提供的服务及网站内容。您不得利用本服务从事侵害他人合法权益之行为，不得在本网站从事任何可能违反中国的法律、法规、规章和政府规范性文件的行为或者任何未经授权的行为，如擅自进入本网站的未公开的系统、不正当的使用账号密码和网站的任何内容等。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">7.2.2</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">您不得使用本网站提供的服务或其他电子邮件转发服务发出垃圾邮件或其他可能违反本协议的内容。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">7.2.3</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">本网站没有义务监测网站内容，但是您确认并同意本网站有权不时地根据法律、法规、政府要求透露、修改或者删除必要的信息，以便更好地运营本网站并保护自身及本网站的其他合法用户。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">7.2.4</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">本网站中全部内容的版权均属于本网站所有，该等内容包括但不限于文本、数据、文章、设计、源代码、软件、图片、照片及其他全部信息（以下称“网站内容”）。网站内容受中华人民共和国著作权法及各国际版权公约的保护。未经本网站事先书面同意，您承诺不以任何方式、不以任何形式复制、模仿、传播、出版、公布、展示网站内容，包括但不限于电子的、机械的、复印的、录音录像的方式和形式等。您承认网站内容是属于本网站的财产。未经本网站书面同意，您亦不得将本网站包含的资料等任何内容镜像到任何其他网站或者服务器。任何未经授权对网站内容的使用均属于违法行为，本网站将追究您的法律责任。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">7.2.5</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">由于您违反本协议或任何法律、法规或侵害第三方的权利，而引起第三方对本网站提出的任何形式的索赔、要求、诉讼，本网站有权向您追偿相关损失，包括但不限于本网站的法律费用、名誉损失、及向第三方支付的补偿金等。</span></p><h2 style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12px; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">八</span><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">、</span><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">协议终止及账户的暂停、注销或终止</span></h2><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">8.1</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">除非本网站终止本协议或者您申请终止本协议且经本网站同意，否则本协议始终有效。在您违反了本协议、相关规则，或在相关法律法规、政府部门的要求下，本网站有权通过站内信、电子邮件通知等方式终止本协议、关闭您的账户或者限制您使用本网站。但本网站的终止行为不能免除您根据本协议或在本网站生成的其他协议项下的还未履行完毕的义务。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">8.2</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">您若发现有第三人冒用或盗用您的用户账户及密码，或其他任何未经合法授权的情形，应立即以有效方式通知本网站，要求本网站暂停相关服务，否则由此产生的一切责任由您本人承担。同时，您理解本网站对您的请求采取行动需要合理期限，在此之前，本网站对第三人使用该服务所导致的损失不承担任何责任。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">8.3</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">您决定不再使用用户账户时，应首先清偿所有应付款项（包括但不限于借款本金、利息、罚息、违约金、服务费、管理费等），再将用户账户中的可用款项（如有）全部提现或者向本网站发出其它合法的支付指令，并向本网站申请注销该用户账户，经本网站审核同意后可正式注销用户账户。会员死亡或被宣告死亡的，其在本协议项下的各项权利义务由其继承人承担。若会员丧失全部或部分民事权利能力或民事行为能力，本网站有权根据有效法律文书（包括但不限于生效的法院判决等）或其法定监护人的指示处置与用户账户相关的款项。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">8.4</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">本网站有权基于单方独立判断，在认为可能发生危害交易安全等情形时，不经通知而先行暂停、中断或终止向您提供本协议项下的全部或部分会员服务，并将注册资料移除或删除，且无需对您或任何第三方承担任何责任。前述情形包括但不限于：</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">（1） 本网站认为您提供的个人资料不具有真实性、有效性或完整性；</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">（2） 本网站发现异常交易或有疑义或有违法之虞时；</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">（3） 本网站认为您的账户涉嫌洗钱、套现、传销、被冒用或其他本网站认为有风险之情形；</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">（4） 本网站认为您已经违反本协议中规定的各类规则及精神；</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">（5） 本网站基于交易安全等原因，根据其单独判断需先行暂停、中断或终止向您提供本协议项下的全部或部分会员服务，并将注册资料移除或删除的其他情形。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">8.5</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">您同意在必要时，本网站无需进行事先通知即有权终止提供用户账户服务，并可能立即暂停、关闭或删除您的用户账户及该用户账户中的所有相关资料及档案，并将您滞留在这些账户的全部合法资金退回到您的银行账户。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">8.6</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">您同意，用户账户的暂停、中断或终止不代表您责任的终止，您仍应对您使用本网站服务期间的行为承担可能的违约或损害赔偿责任，同时本网站仍可保有您的相关信息。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">8.7</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">若您使用第三方网站账号注册本网站用户账户，则您应对您本网站用户账户所对应的第三方网站账号拥有合法的使用权，如您因故对该第三方网站账号丧失使用权的，则本网站可停止为您的该用户账户提供服务。但如该用户账户尚存有余额的，本网站将会为您妥善保管。此时，如您欲取回其原有余额，本网站将提供更换本网站账户名的服务，即您可把您原本网站账户下余额转移到您另外合法注册的本网站账户中；如因故无法自助完成更换账户名，您可以向本网站提出以银行账户接受原有资金的请求，经核验属实后，本网站可配合您将原有资金转移到以您真实姓名登记的银行账户下。</span></p><h2 style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12px; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">九</span><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">、</span><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">通知</span></h2><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">本协议项下的通知如以公示方式作出，一经在本网站公示即视为已经送达。除此之外，其他向您个人发布的具有专属性的通知将由本网站向您在注册时提供的电子邮箱，或本网站在您的个人账户中为您设置的站内消息系统栏，或您在注册后在本网站绑定的手机发送，一经发送即视为已经送达。请您密切关注您的电子邮箱 、站内消息系统栏中的邮件、信息及手机中的短信信息。您同意本网站出于向您提供服务之目的，可以向您的电子邮箱、站内消息系统栏和手机发送有关通知或提醒；若您不愿意接收，请在本网站相应系统板块进行设置。但您同时同意并确认，若您设置了不接收有关通知或提醒，则您有可能收不到该等通知信息，您不得以您未收到或未阅读该等通知信息主张相关通知未送达于您。</span></p><h2 style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12px; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">十</span><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">、</span><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">适用法律和管辖</span></h2><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">因本网站所提供服务而产生的争议均适用中华人民共和国法律，并由本网站住所地的人民法院管辖。</span></p><h2 style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12px; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">十一</span><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">、</span><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">其他</span></h2><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">本网站对本协议拥有最终的解释权。本协议及本网站有关页面的相关名词可互相引用参照，如有不同理解，则以本协议条款为准。此外，若本协议的部分条款被认定为无效或者无法实施时，本协议中的其他条款仍然有效。</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\"> </span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\"></span></p><h2 style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12px; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 14pt; font-family: 微软雅黑;\">附件一 </span><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 14pt; font-family: 微软雅黑;\">太平洋理财论坛守则</span></h2><h2 style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12px; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">第一章 总则</span><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">1 第一条</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">太平洋理财论坛是一个供所有太平洋理财用户使用的综合性社区。</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">2 第二条</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">太平洋理财论坛的各项网络服务由深圳太平洋金融信息咨询有限责任公司提供。</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">3 第三条</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">太平洋理财论坛用户默认接受本条款约束。</p></h2><h2 style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12px; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">第二章 太平洋理财论坛用户的基本权利和义务</span><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">1 第四条</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">使用太平洋理财账号成功登陆论坛后即可成为太平洋理财论坛用户。</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">2 第五条</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">太平洋理财论坛用户在不违反国家有关法规和论坛规定的前提下享有言论自由权利。在一个月内可以修改、删除自己发表的文章。</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">3 第六条</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">发贴前请看清所在版面讨论的主题，不要发表与版面无关主题、与主题无关回复、上传与内容无关图片，链接与本主题无关的网址。</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">4 第七条</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">发表文章及转载时请注明出处，禁止转载或引用涉及版权问题的文章。</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">5 第八条</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">太平洋理财论坛用户有义务提供详尽、准确的个人资料，并不断更新注册资料，符合及时、详尽、准确的要求。</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">6 第九条</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">太平洋理财论坛对用户提供的个人资料的保密，以下情况除外：</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">1.	太平洋理财论坛用户授权太平洋理财公司透露这些信息。</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">2.	相应的法律及程序要求太平洋理财提供论坛用户的个人资料。</p></h2><h2 style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12px; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">第三章 太平洋理财言论规范及处罚规则</span><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">1 第十条</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">太平洋理财论坛用户言论包括：发表的文章（原帖和回复）、论坛昵称、个人说明、签名档、论坛留言等。</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">2 第十一条</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">太平洋理财论坛用户言论若出现下列任意一种或几种情况，根据违法情节和危害后果，太平洋理财论坛将做永久限制全论坛发表权限处理，并将有关电子信息证据提交国法司法机关。</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">1.	反对宪法所确定的基本原则的；</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">2.	危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">3.	损害国家荣誉和利益的；</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">4.	煽动民族仇恨、民族歧视，破坏民族团结的；</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">5.	破坏国家宗教政策，宣扬邪教和封建迷信的；</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">6.	散布谣言，扰乱社会秩序，破坏社会稳定的；</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">7.	散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">8.	侮辱或者诽谤他人，侵害他人合法权益的；</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">9.	含有法律、行政法规禁止的其他内容的。</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">3 第十二条</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">太平洋理财论坛用户发表的文章若出现下列任意一种或几种情况，论坛管理人员有权不通知作者直接删除或锁帖，并依照有关规定作出封禁版面发表权限、全论坛发表权限甚至永久性发表限制权限处理。</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">1.	恶意灌水：包括：a.24小时之内在本论坛同一版面发表内容相同或相似文章或回帖5篇以上者；b. 24小时之内在本论坛5个及以上的版面发表内容相同或相似的文章者；c.及其他不当行为。</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">2.	未经允许转载和抄袭他人作品，包括但不限于： a.转载他人声明不得转载的作品； b. 转载他人作品并未注明文章来源的； c.抄袭他人作品；d.根据权利人的举报和提交的证据，证明论坛用户未经允许转载和抄袭权利人作品的；</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">3.	广告贴（广告版除外）和软文：非与太平洋理财公司签订广告合同的宣传其他以机构的文章；</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">4.	与版面主题无关的文章（包括文章内含有大量和版面主题无关或者负面的回帖）；</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">5.	不雅昵称：包括但不限于a.含有反动、色情、侮辱字眼的 b.与名人名字相同的c.有广告性质的d. 冒充太平洋理财论坛管理员和太平洋理财公司官方人员的；</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">6.	损害太平洋理财公司利益的。</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">4 第十三条</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">太平洋理财论坛用户发表的图片若出现下列任意一种或几种情况，论坛管理人员有权不通知作者直接删除，并依照有关规定作出封禁版面发表权限、全论坛发表权限甚至永久性发表限制权限处理。</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">1.	张贴含一切色情、反动、恶意恐怖、人身攻击、青少年不宜的和其它不符合我国法律、法规的图片；</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">2.	张贴攻击政治、二战战犯/著名反动人物肖像及其近似体、著名政治人物/明星/公司肖像及其近似体的图片；</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">3.	张贴任何非法、有害、淫秽、粗俗、猥亵的，胁迫、骚扰、中伤他人的，诽谤、侵害他人隐私或诋毁他人名誉或商誉的，种族歧视或其他不适当的图片；</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">4.	张贴不雅、暴力、邪教等不良内容及图片；</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">5.	张贴侵犯任何人专利、商标、著作权、商业秘密或其他专属权利图片；</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">6.	张贴与主题无关，没有咨询主题，以及完全由表情符号或者其他符号构成的图片；</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">7.	损害太平洋理财公司利益的。</p></h2><h2 style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12px; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">第四章 版权声明</span><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">1 第十四条</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">太平洋理财论坛用户（包括论坛管理员、版主）在太平洋理财论坛交流和发表的任何言论，只代表用户自身的观点，与太平洋理财公司的观点无关。 作者文责自负。</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">2 第十五条</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">2 信息版权归作者本人所有，太平洋理财论坛有权将在太平洋理财论坛发表的信息用于其他用途，（包括但不限于）网站、电子期刊等，文章有附带版权声明者除外。</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">3 第十六条</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">因太平洋理财论坛用户抄袭引起的版权纠纷，请用户自行与原作者交涉版权问题。</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">4 第十七条</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">本论坛文章、图片（包括转贴）版权仅归原作者所有，若作者有版权声明的或从其它网站转载而附带有原网站的版权声明者，其版权归属以附带声明为准。</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">5 第十八条</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">任何试图转载、引用发表于本论坛的版权文章、图片须符合以下规范：</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">1.	在用于非商业、非盈利、非广告性目的时需注明作者及文章、图片出处“太平洋理财论坛 http://bbs.jiuniu.com”</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">2.	在用于商业、盈利、广告性目的时需事先和太平洋理财网站以及文章、图片原作者取得联系，获得书面许可后方可使用。</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">3.	任何修改与部份删除均需事先获得作者书面许可，并注明授权范围。</p></h2><h2 style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12px; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">第五章 免责声明</span><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">1 第十九条</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">太平洋理财论坛用户之间通过论坛相识、交往中所发生或可能发生的任何心理、生理上的伤害和经济上的纠纷与损失，太平洋理财公司不承担任何责任。</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">2 第二十条</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">太平洋理财论坛用户发表的文章、信息、内容违反法律规定，或侵犯他人合法权益的，由内容提供方承担法律责任，太平洋理财公司不承担任何责任。</p></h2><h2 style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12px; font-family: 微软雅黑, \'Microsoft YaHei\'; color: rgb(102, 102, 102); line-height: 25px;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 12pt; font-family: 微软雅黑;\">第六章 附则</span><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">1 第二十一条</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">太平洋理财论坛规章制度条款未涉及的问题参见国家相关法律法规,当论坛规章制度与国家法律法规冲突时，以国家法律法规为准。</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">2 第二十二条</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">论坛各级管理人员可根据本基本法制定适用于自己管辖区域内的相关法规、条例、规则、制度，所有区域性的法规、条例、规则、制度必须报论坛管理部审核通过后方可发布实施。</p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\"><span style=\"margin: 0px; padding: 0px; list-style: none; outline: none; font-size: 10.5pt; font-family: 微软雅黑;\">3 第二十三条</span></p><p style=\"margin: 0px; padding: 0px; list-style: none; outline: none;\">太平洋理财公司保留对《太平洋理财论坛守则》的最终解释权。</p></h2>', '太平洋理财网站服务协议', 'to/single-15-128.htm', '1', '15', '0', '0');

-- ----------------------------
-- Table structure for `exception_note_info`
-- ----------------------------
DROP TABLE IF EXISTS `exception_note_info`;
CREATE TABLE `exception_note_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cur_time` varchar(20) NOT NULL,
  `error_type` varchar(20) DEFAULT NULL,
  `money_exchange` varchar(255) DEFAULT NULL,
  `remark` longtext,
  `status` int(11) NOT NULL,
  `user_aim_balance` varchar(255) DEFAULT NULL,
  `user_cur_balance` varchar(255) DEFAULT NULL,
  `user_ips` varchar(32) DEFAULT NULL,
  `user_login_name` varchar(20) DEFAULT NULL,
  `user_real_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exception_note_info
-- ----------------------------

-- ----------------------------
-- Table structure for `feedbackinfo`
-- ----------------------------
DROP TABLE IF EXISTS `feedbackinfo`;
CREATE TABLE `feedbackinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '反馈人姓名',
  `email` varchar(60) DEFAULT NULL COMMENT '反馈人邮件',
  `Phone` varchar(30) DEFAULT NULL COMMENT '反馈人电话',
  `context` varchar(2080) DEFAULT NULL COMMENT '反馈内容',
  `addTime` varchar(50) DEFAULT NULL COMMENT '添加时间',
  `file_id` bigint(20) DEFAULT NULL COMMENT '上传附件',
  `feedbacktype_id` bigint(20) DEFAULT NULL COMMENT '邮件还款类型',
  `replyStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file_id4` (`file_id`) USING BTREE,
  KEY `FK992C05B3146A8A17` (`feedbacktype_id`) USING BTREE,
  CONSTRAINT `feedbackinfo_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `uploadfile` (`id`),
  CONSTRAINT `feedbackinfo_ibfk_2` FOREIGN KEY (`feedbacktype_id`) REFERENCES `feedbacktype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件反馈信息; InnoDB free: 8192 kB; (`file_id`) REFER ; InnoDB free: 8192 kB; (`file_i';

-- ----------------------------
-- Records of feedbackinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `feedbacktype`
-- ----------------------------
DROP TABLE IF EXISTS `feedbacktype`;
CREATE TABLE `feedbacktype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(60) DEFAULT NULL COMMENT '名称',
  `isShow` int(1) DEFAULT NULL COMMENT '是否显示（1显示,0不显示）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='反馈类型信息表';

-- ----------------------------
-- Records of feedbacktype
-- ----------------------------
INSERT INTO `feedbacktype` VALUES ('1', '注册登录', '1');
INSERT INTO `feedbacktype` VALUES ('2', '借入借出', '1');
INSERT INTO `feedbacktype` VALUES ('3', '资金账户', '1');
INSERT INTO `feedbacktype` VALUES ('4', '推广奖金', '1');
INSERT INTO `feedbacktype` VALUES ('5', '其他问题', '1');
INSERT INTO `feedbacktype` VALUES ('6', '充值提现', '1');
INSERT INTO `feedbacktype` VALUES ('7', '不限', '1');

-- ----------------------------
-- Table structure for `footer`
-- ----------------------------
DROP TABLE IF EXISTS `footer`;
CREATE TABLE `footer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(2048) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL COMMENT '公司名称',
  `address` varchar(128) DEFAULT NULL COMMENT '公司地址',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `copyright` varchar(128) DEFAULT NULL COMMENT '版权所有',
  `records` varchar(128) DEFAULT NULL COMMENT '备案号',
  `context` varchar(256) DEFAULT NULL COMMENT '其他',
  `phone400` varchar(30) DEFAULT NULL,
  `qqGroupNumber` varchar(255) DEFAULT NULL,
  `workTime` varchar(30) DEFAULT NULL,
  `xlurl` varchar(256) DEFAULT NULL COMMENT '新浪微博',
  `txurl` varchar(256) DEFAULT NULL COMMENT '腾讯微博',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='前台底部信息表(系统信息设置)';

-- ----------------------------
-- Records of footer
-- ----------------------------
INSERT INTO `footer` VALUES ('1', 'http://www.tpyp2p.com', '深圳太平洋金融信息咨询有限公司', '广东省深圳市南山区桃园地铁口田厦国际中心B座2038', '0755-86707492', 'gaowuming@tpyp2p.com', 'Copyright 2014-2015', '粤ICP备15007685号', 'All Rights Reserved', null, '297889205', '9：30-18：30', 'http://weibo.com/u/5510617791', '11');

-- ----------------------------
-- Table structure for `gathering`
-- ----------------------------
DROP TABLE IF EXISTS `gathering`;
CREATE TABLE `gathering` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loansignname` varchar(20) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `pmethod` varchar(20) DEFAULT NULL,
  `recoil_id` bigint(20) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `time` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gathering
-- ----------------------------

-- ----------------------------
-- Table structure for `generalize`
-- ----------------------------
DROP TABLE IF EXISTS `generalize`;
CREATE TABLE `generalize` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adddate` varchar(32) DEFAULT NULL COMMENT '推广时间',
  `genuid` bigint(20) DEFAULT NULL COMMENT '推广人编号',
  `uid` bigint(20) DEFAULT NULL COMMENT '被推广人编号',
  `uanme` varchar(32) DEFAULT NULL COMMENT '被推广人用户名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `genid` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推广信息';

-- ----------------------------
-- Records of generalize
-- ----------------------------

-- ----------------------------
-- Table structure for `generalizemoney`
-- ----------------------------
DROP TABLE IF EXISTS `generalizemoney`;
CREATE TABLE `generalizemoney` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` varchar(32) DEFAULT NULL COMMENT '发生日期',
  `bonuses` varchar(32) DEFAULT NULL COMMENT '奖金',
  `umoney` varchar(32) DEFAULT NULL COMMENT '被推广人金额',
  `uname` varchar(32) DEFAULT NULL COMMENT '被推广人用户名',
  `genuid` bigint(20) DEFAULT NULL COMMENT '推广人编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gmid` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推广资金记录';

-- ----------------------------
-- Records of generalizemoney
-- ----------------------------

-- ----------------------------
-- Table structure for `keyword_management`
-- ----------------------------
DROP TABLE IF EXISTS `keyword_management`;
CREATE TABLE `keyword_management` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) DEFAULT NULL,
  `keywords` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of keyword_management
-- ----------------------------
INSERT INTO `keyword_management` VALUES ('1', '撒地方撒谎发静安寺飓风桑迪', '慧投网，关键字,慧投网');
INSERT INTO `keyword_management` VALUES ('2', '撒地方撒谎发静安寺飓风桑迪', '慧投网，关键字');
INSERT INTO `keyword_management` VALUES ('3', '撒地方撒谎发静安寺飓风桑迪', '慧投网，关键字');

-- ----------------------------
-- Table structure for `link`
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL COMMENT ' 连接名称',
  `url` varchar(2048) DEFAULT NULL COMMENT '链接地址',
  `isShow` int(1) DEFAULT NULL COMMENT '是否显示',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `verifyImg` varchar(100) DEFAULT NULL COMMENT '网站认证图片',
  `type` int(5) DEFAULT NULL COMMENT '类型：0、友情链接；1、网站认证',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES ('4', '财新网', 'http://www.caixin.com/', '1', '', 'http://www.tpyjr.com.cn:80/upload/verifyimg/20150213174053.JPG', '1');
INSERT INTO `link` VALUES ('5', '中国证券报', 'http://epaper.cs.com.cn/dnis/', '1', '', 'http://www.tpyjr.com.cn:80/upload/verifyimg/20150213174048.JPG', '1');
INSERT INTO `link` VALUES ('6', '网易财经', 'http://money.163.com/', '1', '', 'http://www.tpyjr.com.cn:80/upload/verifyimg/20150213174042.JPG', '1');
INSERT INTO `link` VALUES ('7', '宝付支付', 'https://www.baofoo.com/', '1', '宝付支付', 'http://221.5.96.71:9091/upload/verifyimg/20141216035236.JPG', '1');
INSERT INTO `link` VALUES ('8', '时代商家', 'http://www.sdsj.cc/', '1', '时代商家', 'http://www.tpyjr.com.cn:80/upload/verifyimg/20150213174035.JPG', '1');
INSERT INTO `link` VALUES ('9', '深圳卫视财经频道', 'http://www.s1979.com/caijing/', '1', 'http://www.s1979.com/caijing/', 'http://www.tpyjr.com.cn:80/upload/verifyimg/20150213174011.JPG', '1');

-- ----------------------------
-- Table structure for `loanrecord`
-- ----------------------------
DROP TABLE IF EXISTS `loanrecord`;
CREATE TABLE `loanrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `isSucceed` int(1) DEFAULT NULL COMMENT '购买是否成功',
  `tenderMoney` decimal(18,4) DEFAULT NULL COMMENT '购买金额',
  `tenderTime` varchar(50) DEFAULT NULL COMMENT '购买时间',
  `loanSign_id` bigint(20) DEFAULT NULL COMMENT '购买借款标编号',
  `userbasicinfo_id` bigint(20) DEFAULT NULL COMMENT '会员编号',
  `isPrivilege` int(2) DEFAULT NULL COMMENT ',购买时是否是特权会员（0不是,1.是）',
  `management` double DEFAULT NULL,
  `pMerBillNo` varchar(50) DEFAULT NULL,
  `loan_id` bigint(20) DEFAULT NULL COMMENT '原标ID',
  `isAutomatic` int(2) DEFAULT NULL COMMENT '是否是自动投标，1自动投标',
  PRIMARY KEY (`id`),
  KEY `FK192A9619C6DA5F7` (`loanSign_id`) USING BTREE,
  KEY `userbasicinfo_id` (`userbasicinfo_id`) USING BTREE,
  CONSTRAINT `loanrecord_ibfk_1` FOREIGN KEY (`loanSign_id`) REFERENCES `loansign` (`id`),
  CONSTRAINT `loanrecord_ibfk_2` FOREIGN KEY (`userbasicinfo_id`) REFERENCES `userbasicsinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='出借记录; InnoDB free: 8192 kB; (`loanSign_id`) REFER `t; InnoDB free: 8192 kB; (`lo';

-- ----------------------------
-- Records of loanrecord
-- ----------------------------
INSERT INTO `loanrecord` VALUES ('1', '1', '1000.0000', '2015-01-23 09:06:09', '1', '2', '0', null, '2ae51ba142154d19a1c0696e75ce9a6a', null, '1');
INSERT INTO `loanrecord` VALUES ('2', '1', '50.0000', '2015-01-23 09:15:47', '2', '2', '0', null, '5e6b35550c6c4254a4033cd36a0d77be', null, '1');
INSERT INTO `loanrecord` VALUES ('3', '1', '1000.0000', '2015-01-23 09:19:26', '3', '2', '0', null, '4b0bc08f1dcb4abaa5197ebbbf5d2ebf', null, '1');
INSERT INTO `loanrecord` VALUES ('4', '1', '1000.0000', '2015-01-23 10:51:10', '4', '2', '0', null, '41315eca3c3e4cdea5aee501a20092c6', null, '1');
INSERT INTO `loanrecord` VALUES ('5', '1', '1000.0000', '2015-01-23 10:54:40', '7', '2', '0', null, 'db93f0b8980b440cac026912312e8881', null, '1');
INSERT INTO `loanrecord` VALUES ('6', '1', '100.0000', '2015-01-23 19:00:46', '8', '14', '0', null, 'e289f5bbe85c4a2ca2b70f776c57abf2', null, '1');
INSERT INTO `loanrecord` VALUES ('7', '1', '100.0000', '2015-01-26 11:55:44', '9', '14', '0', null, '60f63e5ea726497a90dd8b14bc46ffdc', null, '1');
INSERT INTO `loanrecord` VALUES ('8', '1', '50.0000', '2015-01-27 14:21:29', '10', '14', '0', null, 'fb07dc9decc84739a8e9d061798ba2a6', null, '1');
INSERT INTO `loanrecord` VALUES ('9', '1', '50.0000', '2015-01-27 14:22:51', '10', '14', '0', null, '9cacfb25520f43f692890ebe040ef4e4', null, '1');
INSERT INTO `loanrecord` VALUES ('10', '1', '50.0000', '2015-01-28 11:04:49', '11', '14', '0', null, 'BID20150128110421829326', null, '1');
INSERT INTO `loanrecord` VALUES ('11', '1', '100.0000', '2015-01-28 15:29:18', '12', '13', '1', null, 'BID20150128032900695947', null, '1');
INSERT INTO `loanrecord` VALUES ('12', '1', '100.0000', '2015-01-28 15:42:17', '13', '13', '1', null, 'BID20150128034156559425', null, '1');
INSERT INTO `loanrecord` VALUES ('13', '1', '100.0000', '2015-01-28 15:43:56', '14', '13', '1', null, 'BID20150128034340658756', null, '1');
INSERT INTO `loanrecord` VALUES ('14', '1', '100.0000', '2015-01-28 15:50:42', '15', '13', '1', null, 'BID20150128035029851032', null, '1');
INSERT INTO `loanrecord` VALUES ('15', '1', '100.0000', '2015-01-28 15:55:47', '16', '13', '1', null, 'BID20150128035532207989', null, '1');
INSERT INTO `loanrecord` VALUES ('16', '1', '100.0000', '2015-01-28 16:18:24', '19', '16', '0', null, 'BID20150128041751557861', null, '1');
INSERT INTO `loanrecord` VALUES ('17', '1', '50.0000', '2015-01-28 16:22:20', '18', '22', '0', null, 'BID20150128042043181606', null, '1');
INSERT INTO `loanrecord` VALUES ('18', '1', '50.0000', '2015-01-28 16:22:25', '18', '24', '0', null, 'BID20150128041936448915', null, '1');
INSERT INTO `loanrecord` VALUES ('19', '1', '50.0000', '2015-01-28 16:23:19', '18', '26', '0', null, 'BID20150128042207106090', null, '1');
INSERT INTO `loanrecord` VALUES ('20', '1', '50.0000', '2015-01-28 16:25:14', '17', '22', '0', null, 'BID20150128042458233636', null, '1');
INSERT INTO `loanrecord` VALUES ('21', '1', '50.0000', '2015-01-28 16:25:34', '17', '24', '0', null, 'BID20150128042517901277', null, '1');
INSERT INTO `loanrecord` VALUES ('22', '1', '50.0000', '2015-01-28 16:26:02', '17', '23', '0', null, 'BID20150128042542904466', null, '1');
INSERT INTO `loanrecord` VALUES ('23', '1', '50.0000', '2015-01-28 16:26:24', '17', '26', '0', null, 'BID20150128042531713115', null, '1');
INSERT INTO `loanrecord` VALUES ('24', '1', '50.0000', '2015-01-29 09:41:37', '11', '14', '0', null, 'BID20150129094124794429', null, '1');
INSERT INTO `loanrecord` VALUES ('25', '1', '50.0000', '2015-01-29 09:46:37', '18', '14', '0', null, 'BID20150129094546750379', null, '1');
INSERT INTO `loanrecord` VALUES ('26', '1', '50.0000', '2015-01-29 09:48:48', '20', '14', '0', null, 'BID20150129094828615126', null, '1');
INSERT INTO `loanrecord` VALUES ('27', '1', '50.0000', '2015-01-29 16:59:00', '21', '24', '0', null, 'BID20150129045842969338', null, '1');
INSERT INTO `loanrecord` VALUES ('28', '1', '100.0000', '2015-01-29 16:59:01', '24', '16', '0', null, 'BID20150129045832423107', null, '1');
INSERT INTO `loanrecord` VALUES ('29', '1', '50.0000', '2015-01-29 16:59:34', '21', '22', '0', null, 'BID20150129045903685990', null, '1');
INSERT INTO `loanrecord` VALUES ('30', '1', '50.0000', '2015-01-29 17:01:08', '21', '26', '0', null, 'BID20150129050031438948', null, '1');
INSERT INTO `loanrecord` VALUES ('31', '1', '100.0000', '2015-01-30 11:40:18', '28', '16', '0', null, 'BID20150130114001887525', null, '1');
INSERT INTO `loanrecord` VALUES ('32', '1', '50.0000', '2015-01-30 15:10:43', '30', '16', '0', null, 'BID20150130031023641109', null, '1');
INSERT INTO `loanrecord` VALUES ('33', '1', '50.0000', '2015-01-30 15:11:06', '29', '22', '0', null, 'BID20150130031051376233', null, '1');
INSERT INTO `loanrecord` VALUES ('34', '1', '50.0000', '2015-01-30 15:11:17', '29', '24', '0', null, 'BID20150130031102548887', null, '1');
INSERT INTO `loanrecord` VALUES ('35', '1', '50.0000', '2015-01-30 15:11:59', '29', '26', '0', null, 'BID20150130031139678605', null, '1');
INSERT INTO `loanrecord` VALUES ('36', '1', '200.0000', '2015-02-03 17:41:48', '31', '27', '1', null, 'BID20150203054106741536', null, '1');
INSERT INTO `loanrecord` VALUES ('37', '1', '2550.0000', '2015-02-04 15:41:10', '31', '34', '0', null, 'BID20150204034033850953', null, '1');
INSERT INTO `loanrecord` VALUES ('38', '1', '200.0000', '2015-02-04 15:47:37', '31', '27', '1', null, 'BID20150204034726718058', null, '1');
INSERT INTO `loanrecord` VALUES ('39', '1', '50.0000', '2015-02-26 18:05:18', '32', '44', '0', null, 'BID20150226060517389879', null, '1');
INSERT INTO `loanrecord` VALUES ('40', '1', '50.0000', '2015-02-26 19:02:35', '32', '1', '0', null, 'BID20150226070235149101', null, '1');

-- ----------------------------
-- Table structure for `loansign`
-- ----------------------------
DROP TABLE IF EXISTS `loansign`;
CREATE TABLE `loansign` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rate` decimal(18,4) DEFAULT NULL COMMENT '利率，存时已/100.如0.06',
  `issueLoan` decimal(18,4) DEFAULT NULL COMMENT '本期借款额',
  `userbasicinfo_id` bigint(20) DEFAULT NULL COMMENT '借款人',
  `loanType` int(11) DEFAULT NULL COMMENT '借款标类型：1普通标、2天标、3秒标、4流转标',
  `loanstate` int(11) DEFAULT NULL COMMENT '借款标状态：1未发布、2进行中、3回款中、4已完成',
  `useDay` int(11) DEFAULT NULL COMMENT '预计使用天数',
  `realDay` int(11) DEFAULT NULL COMMENT '实际借款天数',
  `isShow` int(2) DEFAULT NULL COMMENT '//是否显示：1显示，2不显示',
  `isRecommand` int(2) DEFAULT NULL COMMENT '是否推荐到首页：1推荐，2不推荐',
  `refundWay` int(11) DEFAULT NULL COMMENT '还款方式：1按月等额本息、2按月付息到期还本、3到期一次性还本息',
  `loanUnit` int(11) DEFAULT NULL COMMENT '最小出借单位：100、200、300、500、1000',
  `month` int(11) DEFAULT NULL COMMENT '还款期限',
  `publishTime` varchar(50) DEFAULT NULL COMMENT '发布时间',
  `endTime` varchar(50) DEFAULT NULL COMMENT '结束时间',
  `mfeeratio` decimal(18,4) DEFAULT NULL COMMENT '管理费比例',
  `pmfeeratio` decimal(18,4) DEFAULT NULL COMMENT '服务费比例',
  `loansignType_id` bigint(20) DEFAULT NULL,
  `overdueRepayment` double DEFAULT NULL,
  `prepaymentRate` double DEFAULT NULL,
  `counterparts` int(11) DEFAULT NULL,
  `vipCounterparts` int(11) DEFAULT NULL,
  `mfeetop` double DEFAULT NULL,
  `pmfeetop` double DEFAULT NULL,
  `dayRate` double DEFAULT NULL,
  `highLines` double DEFAULT NULL,
  `other` double DEFAULT NULL,
  `withinTwoMonths` double DEFAULT NULL,
  `borrowersApply_id` bigint(20) DEFAULT NULL,
  `borrowMFeeRatio` decimal(8,4) DEFAULT NULL COMMENT '借款管理费率',
  `borrowSFeeRatio` decimal(8,4) DEFAULT NULL COMMENT '借款服务费率',
  `overdueRepayMRatio0` decimal(8,4) DEFAULT NULL COMMENT '逾期还款管理费率(30天内)',
  `overdueRepayMRatio1` decimal(8,4) DEFAULT NULL COMMENT '逾期还款管理费率(31天以上)',
  `overdueRepayRate0` decimal(8,4) DEFAULT NULL COMMENT '逾期还款罚息利率(30天以内)',
  `overdueRepayRate1` decimal(8,4) DEFAULT NULL COMMENT '逾期还款罚息利率(30天以上)',
  `vipMfeeratio` double DEFAULT NULL COMMENT 'vip投资管理费比例',
  `vipMfeeTop` double DEFAULT NULL COMMENT 'vip投资管理费上限',
  `vipPmfeeratio` double DEFAULT NULL COMMENT 'vip借款管理费比例',
  `vipPmfeetop` double DEFAULT NULL COMMENT 'vip借款管理费上限',
  `shouldPmfee` double DEFAULT NULL COMMENT '应收取借款管理费',
  `subType` int(2) DEFAULT NULL COMMENT '标种子类型：1富担标，2担保，3抵押，4信用，5实地',
  PRIMARY KEY (`id`),
  KEY `userbasicinfo_id` (`userbasicinfo_id`) USING BTREE,
  KEY `FK6E9CAAADC3B4640D` (`loansignType_id`) USING BTREE,
  KEY `FK6E9CAAAD9FB19F4D` (`borrowersApply_id`) USING BTREE,
  CONSTRAINT `loansign_ibfk_1` FOREIGN KEY (`borrowersApply_id`) REFERENCES `borrowers_apply` (`id`),
  CONSTRAINT `loansign_ibfk_2` FOREIGN KEY (`loansignType_id`) REFERENCES `loansign_type` (`id`),
  CONSTRAINT `loansign_ibfk_3` FOREIGN KEY (`userbasicinfo_id`) REFERENCES `userbasicsinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='借款标信息表; InnoDB free: 8192 kB; (`borrowersApply_i; InnoDB free: 8192 kB; (`borrow';

-- ----------------------------
-- Records of loansign
-- ----------------------------
INSERT INTO `loansign` VALUES ('1', '0.1200', '1000.0000', '7', '1', '2', null, null, '2', '2', '2', '1000', '3', '2015-01-23 02:34:22', null, '0.1000', '0.0050', '1', '0.003', '0', '1', '1', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '5', '1');
INSERT INTO `loansign` VALUES ('2', '0.1200', '1000.0000', '7', '1', '4', null, null, '2', '2', '2', '50', '3', '2015-01-23 09:14:36', '2015-02-13 00:00', '0.1000', '0.0050', '2', '0.003', '0', '1', '1', null, null, null, null, null, null, '2', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '5', '1');
INSERT INTO `loansign` VALUES ('3', '0.1200', '1000.0000', '7', '1', '2', null, null, '2', '2', '2', '1000', '3', '2015-01-23 09:18:14', null, '0.1000', '0.0050', '1', '0.003', '0', '1', '1', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '5', '1');
INSERT INTO `loansign` VALUES ('4', '0.1200', '1000.0000', '7', '1', '3', null, null, '2', '2', '2', '1000', '3', '2015-01-23 10:17:36', null, '0.1000', '0.0050', '1', '0.003', '0', '1', '1', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '5', '1');
INSERT INTO `loansign` VALUES ('5', '0.1200', '1000.0000', '7', '1', '2', null, null, '2', '2', '2', '50', '3', '2015-01-23 10:52:32', null, '0.1000', '0.0050', '2', '0.003', '0', '1', '1', null, null, null, null, null, null, '2', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '5', '1');
INSERT INTO `loansign` VALUES ('6', '0.1200', '1000.0000', '7', '1', '2', null, null, '2', '2', '2', '1000', '3', '2015-01-23 10:52:44', null, '0.1000', '0.0050', '1', '0.003', '0', '1', '1', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '5', '1');
INSERT INTO `loansign` VALUES ('7', '0.1200', '1000.0000', '7', '1', '3', null, null, '2', '2', '2', '1000', '3', '2015-01-23 10:52:52', null, '0.1000', '0.0050', '1', '0.003', '0', '1', '1', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '5', '1');
INSERT INTO `loansign` VALUES ('8', '0.1200', '100.0000', '13', '1', '3', null, null, '2', '2', '2', '50', '1', '2015-01-23 18:59:33', null, '0.1000', '0.0050', '1', '0.003', '0', '2', '2', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '0.5', '1');
INSERT INTO `loansign` VALUES ('9', '0.1200', '100.0000', '13', '1', '3', null, null, '2', '2', '2', '50', '1', '2015-01-25 12:33:26', null, '0.1000', '0.0050', '1', '0.003', '0', '2', '2', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '0.5', '1');
INSERT INTO `loansign` VALUES ('10', '0.1200', '100.0000', '13', '1', '3', null, null, '2', '2', '2', '50', '1', '2015-01-27 14:20:22', null, '0.1000', '0.0050', '1', '0.003', '0', '2', '2', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '0.5', '1');
INSERT INTO `loansign` VALUES ('11', '0.1200', '100.0000', '13', '1', '3', null, null, '2', '2', '2', '50', '1', '2015-01-28 10:58:17', null, '0.1000', '0.0050', '1', '0.003', '0', '2', '2', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '0.5', '1');
INSERT INTO `loansign` VALUES ('12', '0.1200', '100.0000', '16', '1', '3', null, null, '2', '2', '2', '50', '1', '2015-01-28 15:28:27', null, '0.1000', '0.0050', '1', '0.003', '0', '2', '2', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '0.5', '1');
INSERT INTO `loansign` VALUES ('13', '0.1200', '100.0000', '22', '1', '3', null, null, '2', '2', '2', '50', '1', '2015-01-28 15:40:44', null, '0.1000', '0.0050', '1', '0.003', '0', '2', '2', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '0.5', '1');
INSERT INTO `loansign` VALUES ('14', '0.1200', '100.0000', '23', '1', '3', null, null, '2', '2', '2', '50', '1', '2015-01-28 15:43:27', null, '0.1000', '0.0050', '1', '0.003', '0', '2', '2', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '0.5', '1');
INSERT INTO `loansign` VALUES ('15', '0.1200', '100.0000', '24', '1', '3', null, null, '2', '2', '2', '50', '1', '2015-01-28 15:50:07', null, '0.1000', '0.0050', '1', '0.003', '0', '2', '2', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '0.5', '1');
INSERT INTO `loansign` VALUES ('16', '0.1200', '100.0000', '26', '1', '3', null, null, '2', '2', '3', '50', '1', '2015-01-28 15:55:20', null, '0.1000', '0.0050', '1', '0.003', '0', '2', '2', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '0.5', '3');
INSERT INTO `loansign` VALUES ('17', '0.1200', '200.0000', '13', '1', '3', null, null, '2', '2', '2', '50', '1', '2015-01-28 16:11:57', null, '0.1000', '0.0050', '1', '0.003', '0', '1', '1', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '1', '1');
INSERT INTO `loansign` VALUES ('18', '0.1200', '200.0000', '13', '1', '3', null, null, '2', '2', '2', '50', '1', '2015-01-28 16:14:22', null, '0.1000', '0.0050', '1', '0.003', '0', '1', '1', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '1', '1');
INSERT INTO `loansign` VALUES ('19', '0.1200', '100.0000', '13', '1', '3', null, null, '2', '2', '2', '50', '1', '2015-01-28 16:16:32', null, '0.1000', '0.0050', '1', '0.003', '0', '2', '2', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '0.5', '1');
INSERT INTO `loansign` VALUES ('20', '0.1200', '100.0000', '13', '1', '4', null, null, '2', '2', '2', '50', '1', '2015-01-20 02:34:22', '2015-01-30 14:51', '0.1000', '0.0050', '1', '0.003', '0', '1', '1', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '0.5', '1');
INSERT INTO `loansign` VALUES ('21', '0.1200', '200.0000', '13', '1', '4', null, null, '2', '2', '2', '50', '1', '2015-01-28 00:00:00', '2015-01-30 15:00', '0.1000', '0.0050', '1', '0.003', '0', '1', '1', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '1', '1');
INSERT INTO `loansign` VALUES ('23', '0.1200', '100.0000', '13', '1', '2', null, null, '2', '2', '2', '50', '1', '2015-01-29 16:39:03', null, '0.1000', '0.0050', '1', '0.003', '0', '1', '1', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '0.5', '1');
INSERT INTO `loansign` VALUES ('24', '0.1200', '100.0000', '13', '1', '3', null, null, '2', '2', '2', '50', '1', '2015-01-29 16:55:11', null, '0.1000', '0.0050', '1', '0.003', '0', '2', '2', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '0.5', '1');
INSERT INTO `loansign` VALUES ('27', '0.1200', '100.0000', '13', '1', '2', null, null, '2', '2', '2', '50', '1', '2015-01-30 10:38:21', null, '0.1000', '0.0050', '1', '0.003', '0', '2', '2', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '0.5', '1');
INSERT INTO `loansign` VALUES ('28', '0.1200', '100.0000', '13', '1', '3', null, null, '2', '2', '2', '50', '1', '2015-01-30 11:37:02', null, '0.1000', '0.0050', '1', '0.003', '0', '2', '2', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '0.5', '3');
INSERT INTO `loansign` VALUES ('29', '0.1200', '200.0000', '13', '1', '4', null, null, '2', '2', '2', '50', '1', '2015-01-27 02:34:22', '2015-02-03 12:08', '0.1000', '0.0050', '1', '0.003', '0', '1', '1', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '1', '1');
INSERT INTO `loansign` VALUES ('30', '0.1200', '100.0000', '13', '1', '4', null, null, '2', '2', '2', '50', '1', '2015-01-27 02:34:22', '2015-02-03 12:08', '0.1000', '0.0050', '1', '0.003', '0', '1', '1', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.1', '10000000', '0.005', '10000000', '0.5', '1');
INSERT INTO `loansign` VALUES ('31', '0.1800', '100000.0000', '29', '1', '2', null, null, '1', '1', '2', '50', '3', '2015-02-03 17:22:15', null, '0.1000', '0.0000', '1', '0.003', '0', '2000', '2000', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.1', '10000000', '0', '10000000', '0', '3');
INSERT INTO `loansign` VALUES ('32', '0.1200', '10000.0000', '7', '1', '2', null, null, '1', '1', '1', '50', '9', '2015-02-26 14:52:16', null, '0.0150', '0.0150', '1', '0.003', '0.005', '1', '2', null, null, null, null, null, null, '1', null, null, null, null, null, null, '0.01', '10000000', '0.01', '10000000', '150', '3');

-- ----------------------------
-- Table structure for `loansignbasics`
-- ----------------------------
DROP TABLE IF EXISTS `loansignbasics`;
CREATE TABLE `loansignbasics` (
  `id` bigint(20) NOT NULL,
  `loansign_id` bigint(20) DEFAULT NULL COMMENT '借款标',
  `loanNumber` varchar(255) DEFAULT NULL COMMENT '借款标号',
  `loanTitle` varchar(255) DEFAULT NULL COMMENT '标题',
  `unassureWay` varchar(255) DEFAULT NULL COMMENT '反担保方式',
  `assure` varchar(255) DEFAULT NULL COMMENT '担保方名称',
  `reward` decimal(18,4) DEFAULT NULL COMMENT '平台奖励',
  `behoof` varchar(500) DEFAULT NULL COMMENT '借款方借款用途',
  `loanOrigin` varchar(500) DEFAULT NULL COMMENT '借款方还款来源',
  `overview` varchar(500) DEFAULT NULL COMMENT '借款方商业概述',
  `riskCtrlWay` varchar(500) DEFAULT NULL COMMENT '风险控制措施',
  `speech` varchar(500) DEFAULT NULL COMMENT '借款人感言',
  `riskAssess` int(11) DEFAULT NULL COMMENT '风险评估：1低、2中、3高',
  `creditTime` varchar(50) DEFAULT NULL COMMENT '放款时间',
  `loanExplain` varchar(50) DEFAULT NULL COMMENT '借款说明',
  `loanSignTime` varchar(50) DEFAULT NULL COMMENT '创建时间',
  `loanCategory` int(2) DEFAULT NULL COMMENT '借款标类型：1信用、2抵押',
  `mgtMoney` decimal(18,4) DEFAULT NULL COMMENT '借款管理费',
  `mgtMoneyScale` decimal(18,4) DEFAULT NULL COMMENT '借款管理费比例',
  `pBidNo` varchar(30) DEFAULT NULL COMMENT '标的号',
  `pIpsTime` varchar(30) DEFAULT NULL COMMENT 'IPS 处理时间',
  `pIpsBillNo` varchar(30) DEFAULT NULL COMMENT 'IPS P2P 订单号',
  `pContractNo` varchar(30) DEFAULT NULL COMMENT '合同编号',
  `pMerBillNo` varchar(30) DEFAULT NULL COMMENT '商户订单号',
  `bidTime` int(11) DEFAULT NULL COMMENT '招标期限',
  `views` bigint(20) DEFAULT NULL COMMENT '浏览数',
  `guaranteesAmt` decimal(18,4) DEFAULT NULL COMMENT '保证金',
  PRIMARY KEY (`id`),
  KEY `FK5952E6F2554723AD` (`loansign_id`) USING BTREE,
  CONSTRAINT `loansignbasics_ibfk_1` FOREIGN KEY (`loansign_id`) REFERENCES `loansign` (`id`),
  CONSTRAINT `loansignbasics_ibfk_2` FOREIGN KEY (`id`) REFERENCES `loansign` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='借款标基础信息表; InnoDB free: 8192 kB; (`loansign_i; InnoDB free: 8192 kB; (`loansign_i';

-- ----------------------------
-- Records of loansignbasics
-- ----------------------------
INSERT INTO `loansignbasics` VALUES ('1', null, '1', '1', '1', '1', '0.0000', '11111111111111', '1', '1', '1', '1', '1', null, null, '2015-01-23 02:33:59', null, '0.0000', null, '11043047654', null, null, 'HT20150123023359393731', null, '1', '3', '0.0000');
INSERT INTO `loansignbasics` VALUES ('2', null, '1', '1', '1', '1', '0.0000', '1111111111111111111111111', '1', '1', '1', '1', '1', null, null, '2015-01-23 09:14:13', null, '0.0000', null, '21043047654', null, 'DDH1423756800044', 'HT20150123091413655685', null, '1', '4', '0.0000');
INSERT INTO `loansignbasics` VALUES ('3', null, '1', '1', '1', '1', '0.0000', '1111111111111111111111', '1', '1', '1', '1', '1', null, null, '2015-01-23 09:17:58', null, '0.0000', null, '31043047654', null, null, 'HT20150123091758171116', null, '1', '4', '0.0000');
INSERT INTO `loansignbasics` VALUES ('4', null, '1', '1', '1', '1', '0.0000', '1111111111111111111111', '1', '1', '1', '1', '1', '2015-01-23 10:53:22', null, '2015-01-23 10:17:22', null, '0.0000', null, '41043047653', null, null, 'HT20150123101722862222', null, '1', '13', '0.0000');
INSERT INTO `loansignbasics` VALUES ('5', null, '1', '1', '1', '1', '0.0000', '11111111111111111', '1', '1', '1', '1', '1', null, null, '2015-01-23 10:43:04', null, '0.0000', null, '51043047654', null, null, 'HT20150123104304899264', null, '1', '14', '0.0000');
INSERT INTO `loansignbasics` VALUES ('6', null, '1', '1', '1', '1', '0.0000', '11111111111111', '1', '1', '1', '1', '1', null, null, '2015-01-23 10:48:01', null, '0.0000', null, '61048018669', null, null, 'HT20150123104801999399', null, '1', '44', '0.0000');
INSERT INTO `loansignbasics` VALUES ('7', null, '1', '1', '1', '1', '0.0000', '11111111111111', '1', '1', '1', '1', '1', '2015-01-23 11:15:58', null, '2015-01-23 10:48:28', null, '0.0000', null, '71048284844', null, null, 'HT20150123104828719399', null, '1', '22', '0.0000');
INSERT INTO `loansignbasics` VALUES ('8', null, '20150123001', '测试正式环境', '无', '深圳市融资担保有限公司', '0.0000', '阿打发大水缸飞个梵蒂冈腹股沟管', '阿打发大水缸飞个梵蒂冈腹股沟管', '阿打发大水缸飞个梵蒂冈腹股沟管', '阿打发大水缸飞个梵蒂冈腹股沟管', '阿打发大水缸飞个梵蒂冈腹股沟管', '1', '2015-01-23 07:01:14', null, '2015-01-23 18:59:19', null, '0.0000', null, '80659198465', null, null, 'HT20150123065919808576', null, '1', '26', '0.0000');
INSERT INTO `loansignbasics` VALUES ('9', null, '20150125001', '测试合同下载', '无', '深圳市融资担保有限公司', '0.0000', 'dfasdfasdgasdgfagafgdf', 'dfasdfasdgasdgfagafgdf', 'dfasdfasdgasdgfagafgdf', 'dfasdfasdgasdgfagafgdf', 'dfasdfasdgasdgfagafgdf', '1', '2015-01-26 11:57:53', null, '2015-01-25 11:50:08', null, '0.0000', null, '91150081556', null, null, 'HT20150125115008749747', null, '1', '58', '0.0000');
INSERT INTO `loansignbasics` VALUES ('10', null, '20150127001', '测试担保公司', '无', '深圳市融资担保有限公司', '0.0000', '测试担保公司测试担保公司', '测试担保公司测试担保公司', '测试担保公司测试担保公司', '测试担保公司测试担保公司', '测试担保公司测试担保公司', '1', '2015-01-27 02:25:47', null, '2015-01-27 14:20:13', null, '0.0000', null, '100220139094', null, null, 'HT20150127022013989536', null, '1', '13', '0.0000');
INSERT INTO `loansignbasics` VALUES ('11', null, '20150128001', '测试流标请不要满标', '无', '吴锦培', '0.0000', '测试流标测试流标测试流标', '测试流标测试流标测试流标', '测试流标测试流标测试流标', '测试流标测试流标测试流标', '测试流标测试流标测试流标', '1', '2015-01-29 09:41:52', null, '2015-01-28 10:58:13', null, '0.0000', null, '111058135852', null, null, 'HT20150128105813529161', null, '1', '5', '0.0000');
INSERT INTO `loansignbasics` VALUES ('12', null, '20150128002', '李敏', '无', '李敏', '0.0000', '15215125262156156156156156156233333', '15215125262156156156156156156233333', '15215125262156156156156156156233333', '15215125262156156156156156156233333', '15215125262156156156156156156233333', '1', '2015-01-28 03:34:32', null, '2015-01-28 15:28:18', null, '0.0000', null, '120328184494', null, null, 'HT20150128032818343276', null, '1', '5', '0.0000');
INSERT INTO `loansignbasics` VALUES ('13', null, '20150128003', '淑贤', '无', '淑贤', '0.0000', '我 要借款12312323', '我 要借款12312323', '我 要借款12312323', '我 要借款12312323', '我 要借款12312323', '1', '2015-01-28 03:42:35', null, '2015-01-28 15:40:38', null, '0.0000', null, '130340384898', null, null, 'HT20150128034038820838', null, '1', '2', '0.0000');
INSERT INTO `loansignbasics` VALUES ('14', null, '20150128005', '潘颖', '无', '潘颖', '0.0000', '太平洋理财我要借款你懂得', '太平洋理财我要借款你懂得', '太平洋理财我要借款你懂得', '太平洋理财我要借款你懂得', '太平洋理财我要借款你懂得', '1', '2015-01-28 03:45:56', null, '2015-01-28 15:43:23', null, '0.0000', null, '140343233820', null, null, 'HT20150128034323800569', null, '1', '12', '0.0000');
INSERT INTO `loansignbasics` VALUES ('15', null, '20150128007', '成霞', '无', '成霞', '0.0000', '太平洋理财我要借款你懂的哈哈', '太平洋理财我要借款你懂的哈哈', '太平洋理财我要借款你懂的哈哈', '太平洋理财我要借款你懂的哈哈', '太平洋理财我要借款你懂的哈哈', '1', '2015-01-28 03:52:36', null, '2015-01-28 15:50:04', null, '0.0000', null, '150350047065', null, null, 'HT20150128035004427195', null, '1', '19', '0.0000');
INSERT INTO `loansignbasics` VALUES ('16', null, '20150128008', '永红', '无', '永红', '0.0000', '太平洋理财我要借款买衣服啦', '太平洋理财我要借款买衣服啦', '太平洋理财我要借款买衣服啦', '太平洋理财我要借款买衣服啦', '太平洋理财我要借款买衣服啦', '1', '2015-01-28 03:57:52', null, '2015-01-28 15:55:13', null, '0.0000', null, '160355139948', null, null, 'HT20150128035513913650', null, '1', '24', '0.0000');
INSERT INTO `loansignbasics` VALUES ('17', null, '20150128009', '测试多人投资满标放款', '无', '吴锦培', '0.0000', '测试多人投资满标放款', '测试多人投资满标放款', '测试多人投资满标放款', '测试多人投资满标放款', '测试多人投资满标放款', '1', '2015-01-28 05:02:50', null, '2015-01-28 16:11:51', null, '0.0000', null, '170411516035', null, null, 'HT20150128041151359712', null, '1', '13', '0.0000');
INSERT INTO `loansignbasics` VALUES ('18', null, '20150128010', '测试多人投标流标情况', '无', '吴锦培', '0.0000', '测试多人投标流标情况', '测试多人投标流标情况', '测试多人投标流标情况', '测试多人投标流标情况', '测试多人投标流标情况', '1', '2015-01-29 09:46:56', null, '2015-01-28 16:14:18', null, '0.0000', null, '180414183302', null, null, 'HT20150128041418924285', null, '1', '19', '0.0000');
INSERT INTO `loansignbasics` VALUES ('19', null, '20150128011', '测试一人投标满标放款还款情况', '无', '吴锦培', '0.0000', '测试一人投标满标放款还款情况', '测试一人投标满标放款还款情况', '测试一人投标满标放款还款情况', '测试一人投标满标放款还款情况', '测试一人投标满标放款还款情况', '1', '2015-01-28 04:32:46', null, '2015-01-28 16:16:26', null, '0.0000', null, '190416264523', null, null, 'HT20150128041626760630', null, '1', '7', '0.0000');
INSERT INTO `loansignbasics` VALUES ('20', null, '20150129001', '测试一人投标流标情况', '无', '吴锦培', '0.0000', '测试一人投标流标情况', '测试一人投标流标情况', '测试一人投标流标情况', '测试一人投标流标情况', '测试一人投标流标情况', '1', null, null, '2015-01-29 09:48:02', null, '0.0000', null, '200948028234', null, 'DDH1422600667733', 'HT20150129094802802847', null, '1', '22', '0.0000');
INSERT INTO `loansignbasics` VALUES ('21', null, '20150129002', '测试多人投标流标情况', '无', '吴锦培', '0.0000', '测试多人投标流标情况', '测试多人投标流标情况', '测试多人投标流标情况', '测试多人投标流标情况', '测试多人投标流标情况', '1', null, null, '2015-01-29 09:55:29', null, '0.0000', null, '210955297160', null, 'DDH1422601226778', 'HT20150129095529267192', null, '1', '36', '0.0000');
INSERT INTO `loansignbasics` VALUES ('23', null, '20150129005', '测试招标期限和流标', '无', '五金配', '0.0000', '测试借款期限测试借款期限', '测试借款期限测试借款期限', '测试招标期限测试借款期限', '测试借款期限测试借款期限', '测试借款期限测试借款期限', '1', null, null, '2015-01-29 16:38:56', null, '0.0000', null, '230438566072', null, null, 'HT20150129043856925610', null, '1', '0', '0.0000');
INSERT INTO `loansignbasics` VALUES ('24', null, '20150129007', '测试添加标的标的重复情况', '无', '吴锦培', '0.0000', '测试添加标的标的重复情况', '测试添加标的标的重复情况', '测试添加标的标的重复情况', '测试添加标的标的重复情况', '测试添加标的标的重复情况', '1', '2015-01-29 05:01:18', null, '2015-01-29 16:51:51', null, '0.0000', null, '240451519858', null, null, 'HT20150129045151402107', null, '1', '6', '0.0000');
INSERT INTO `loansignbasics` VALUES ('27', null, '20150130003', '测试还款提示框服务费', '无', '吴锦培', '0.0000', '测试还款提示框服务费', '测试还款提示框服务费', '测试还款提示框服务费', '测试还款提示框服务费', '测试还款提示框服务费', '1', null, null, '2015-01-30 10:38:15', null, '0.0000', null, '271038154281', null, null, 'HT20150130103815697319', null, '1', '6', '0.0000');
INSERT INTO `loansignbasics` VALUES ('28', null, '20150130006', '测试还款提示框的情况', '无', '吴锦培', '0.0000', '测试还款提示框的情况', '测试还款提示框的情况', '测试还款提示框的情况', '测试还款提示框的情况', '', '1', '2015-01-30 11:40:53', null, '2015-01-30 11:36:58', null, '0.0000', null, '281136586436', null, null, 'HT20150130113658530304', null, '1', '28', '0.0000');
INSERT INTO `loansignbasics` VALUES ('29', null, '20150130008', '测试多人投标流标情况', '无', '吴锦培', '0.0000', '测试多人投标流标情况', '测试多人投标流标情况', '测试多人投标流标情况', '测试多人投标流标情况', '测试多人投标流标情况', '1', null, null, '2015-01-30 15:07:17', null, '0.0000', null, '290307175078', null, 'DDH1422936523637', 'HT20150130030717937207', null, null, '25', '0.0000');
INSERT INTO `loansignbasics` VALUES ('30', null, '20150130009', '测试一人投标流标情况', '无', '吴锦培', '0.0000', '测试一人投标流标情况', '测试一人投标流标情况', '测试一人投标流标情况', '测试一人投标流标情况', '测试一人投标流标情况', '1', null, null, '2015-01-30 15:08:47', null, '0.0000', null, '300308471534', null, 'DDH1422936514533', 'HT20150130030847674196', null, null, '28', '0.0000');
INSERT INTO `loansignbasics` VALUES ('31', null, '20150203001', '材料采购第一期', '无', '无', '0.0000', '招标项目中标需要资金采购材料', '已与湘潭瑞通球团有限公司签订设备采购合同，按照合同条款交付产品后，即可收回合同款项', '广东巨大重型机械有限公司，是一家研发和制造高精度、高技术含量产品的重型装备制造企业。公司技术力量雄厚，工程技术人员占职工总数比例达69%，其中博士2人，硕士6人，高级职称7人，中级职称52人，年研发经费占销售收入3%，且与多所高等院校和设计院、科研所建立了良好合作关系，长期以来，一直得到了他们技术上的鼎力支持。同时，公司实行严格的国际质量控制体系，从而保证了我们产品在国内处于领先水平并有相当的品牌影响力。\r\n', '1、签订三方合作协议，确保合同条款落实后的资金回收\r\n2、鉴定公证书，以实物作为抵押', '', '1', null, null, '2015-02-03 16:58:06', null, '0.0000', null, '310458065418', null, null, 'HT20150203045806774226', null, '5', '284', '0.0000');
INSERT INTO `loansignbasics` VALUES ('32', null, '20150226145036', '资金周转', '1111', '111111', '0.0000', '用于公司短期内资金周转', '公司经营利润', '11111111111111', '车产抵押', '', '1', null, null, '2015-02-26 14:51:40', null, '0.0000', null, '320251403253', null, null, 'HT20150226025140206495', null, '15', '33', '0.0000');

-- ----------------------------
-- Table structure for `loansignflow`
-- ----------------------------
DROP TABLE IF EXISTS `loansignflow`;
CREATE TABLE `loansignflow` (
  `flowid` bigint(20) NOT NULL AUTO_INCREMENT,
  `auditResult` int(1) DEFAULT NULL COMMENT '审核结果0"不通过",1"通过",2"待定" ',
  `auditStatus` int(1) DEFAULT NULL COMMENT '审核状态1"未审核",2"正在审核",3"已审核"',
  `flowstate` int(11) DEFAULT NULL,
  `loanCount` varchar(255) DEFAULT NULL,
  `publish_time` varchar(255) DEFAULT NULL,
  `shift_time` varchar(255) DEFAULT NULL,
  `tenderMoney` double(20,2) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `loanSign_id` bigint(20) DEFAULT NULL,
  `loan_id` bigint(20) DEFAULT NULL,
  `user_auth` bigint(20) DEFAULT NULL,
  `user_debt` bigint(20) DEFAULT NULL,
  `pcrettype` int(1) DEFAULT NULL,
  `share` int(2) DEFAULT NULL,
  `distype` int(1) DEFAULT NULL COMMENT '折扣',
  `appreciation` decimal(18,4) DEFAULT NULL COMMENT '上升值',
  `discountMoney` decimal(18,4) DEFAULT NULL COMMENT '折扣金额',
  PRIMARY KEY (`flowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loansignflow
-- ----------------------------

-- ----------------------------
-- Table structure for `loansignrecord`
-- ----------------------------
DROP TABLE IF EXISTS `loansignrecord`;
CREATE TABLE `loansignrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gradeNo` bigint(20) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `tenderMoney` double DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `lixi` double DEFAULT NULL,
  `loanSign_id` bigint(20) DEFAULT NULL COMMENT '记录债权转让新的id',
  `loanState` int(1) DEFAULT NULL COMMENT '状态1-债权转让',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loansignrecord
-- ----------------------------

-- ----------------------------
-- Table structure for `loansign_type`
-- ----------------------------
DROP TABLE IF EXISTS `loansign_type`;
CREATE TABLE `loansign_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `typename` varchar(20) DEFAULT NULL COMMENT '类型名称',
  `mincredit` decimal(18,4) DEFAULT NULL COMMENT '最小借款额度',
  `maxcredit` decimal(18,4) DEFAULT NULL COMMENT '最大借款额度',
  `minmoney` int(11) DEFAULT NULL COMMENT '最小借款期限',
  `maxmoney` int(11) DEFAULT NULL COMMENT '最大借款期限',
  `minrate` decimal(18,4) DEFAULT NULL COMMENT '最低借款利率',
  `maxrate` decimal(18,4) DEFAULT NULL COMMENT '最高借款利率',
  `money` int(11) DEFAULT NULL COMMENT '借款标期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loansign_type
-- ----------------------------
INSERT INTO `loansign_type` VALUES ('1', '太平洋宝', '50.0000', '1000000.0000', '1', '24', '0.1200', '0.2400', '12');
INSERT INTO `loansign_type` VALUES ('2', '转盈宝', '50.0000', '1000000.0000', '1', '24', '0.1200', '0.2400', '12');
INSERT INTO `loansign_type` VALUES ('7', '太平洋理财计划', '50.0000', '100000.0000', '3', '6', '0.1200', '0.2000', '12');
INSERT INTO `loansign_type` VALUES ('8', '抵押宝', '50.0000', '1000000.0000', '3', '24', '0.1200', '0.2000', '12');

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL COMMENT '登陆ip',
  `logTime` varchar(255) DEFAULT NULL COMMENT '登陆时间',
  `loginId` varchar(255) DEFAULT NULL COMMENT '登陆人',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `userName` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='后台管理员登陆日志';

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', '127.0.0.1', '2015-01-22 23:11:16', '2', null, '管理员');
INSERT INTO `log` VALUES ('2', '127.0.0.1', '2015-01-23 01:31:10', '2', null, '管理员');
INSERT INTO `log` VALUES ('3', '127.0.0.1', '2015-01-23 02:09:23', '2', null, '管理员');
INSERT INTO `log` VALUES ('4', '127.0.0.1', '2015-01-23 02:22:53', '2', null, '管理员');
INSERT INTO `log` VALUES ('5', '127.0.0.1', '2015-01-23 08:56:54', '2', null, '管理员');
INSERT INTO `log` VALUES ('6', '127.0.0.1', '2015-01-23 10:12:50', '2', null, '管理员');
INSERT INTO `log` VALUES ('7', '127.0.0.1', '2015-01-23 10:42:11', '2', null, '管理员');
INSERT INTO `log` VALUES ('8', '59.34.2.254', '2015-01-23 18:25:26', '2', null, '管理员');
INSERT INTO `log` VALUES ('9', '59.34.2.254', '2015-01-23 18:54:27', '2', null, '管理员');
INSERT INTO `log` VALUES ('10', '59.34.2.254', '2015-01-24 13:53:02', '2', null, '管理员');
INSERT INTO `log` VALUES ('11', '59.34.2.254', '2015-01-24 19:43:15', '2', null, '管理员');
INSERT INTO `log` VALUES ('12', '59.34.2.254', '2015-01-25 11:48:19', '2', null, '管理员');
INSERT INTO `log` VALUES ('13', '59.34.2.254', '2015-01-26 11:56:47', '2', null, '管理员');
INSERT INTO `log` VALUES ('14', '59.34.2.254', '2015-01-27 13:40:47', '2', null, '管理员');
INSERT INTO `log` VALUES ('15', '59.34.2.254', '2015-01-27 14:11:44', '2', null, '管理员');
INSERT INTO `log` VALUES ('16', '14.153.242.226', '2015-01-27 15:03:02', '2', null, '管理员');
INSERT INTO `log` VALUES ('17', '14.153.242.226', '2015-01-27 16:24:24', '2', null, '管理员');
INSERT INTO `log` VALUES ('18', '14.153.242.226', '2015-01-27 17:10:57', '2', null, '管理员');
INSERT INTO `log` VALUES ('19', '59.34.2.254', '2015-01-28 08:59:55', '2', null, '管理员');
INSERT INTO `log` VALUES ('20', '59.34.2.254', '2015-01-28 09:43:22', '2', null, '管理员');
INSERT INTO `log` VALUES ('21', '59.34.2.254', '2015-01-28 10:50:36', '2', null, '管理员');
INSERT INTO `log` VALUES ('22', '14.153.242.226', '2015-01-28 11:04:26', '2', null, '管理员');
INSERT INTO `log` VALUES ('23', '14.153.242.226', '2015-01-28 14:05:50', '2', null, '管理员');
INSERT INTO `log` VALUES ('24', '59.34.2.254', '2015-01-28 15:15:19', '2', null, '管理员');
INSERT INTO `log` VALUES ('25', '14.153.242.226', '2015-01-28 15:40:03', '2', null, '管理员');
INSERT INTO `log` VALUES ('26', '59.34.2.254', '2015-01-28 18:07:24', '2', null, '管理员');
INSERT INTO `log` VALUES ('27', '59.34.2.254', '2015-01-29 09:37:24', '2', null, '管理员');
INSERT INTO `log` VALUES ('28', '14.153.240.255', '2015-01-29 10:08:31', '2', null, '管理员');
INSERT INTO `log` VALUES ('29', '59.34.2.254', '2015-01-29 10:48:24', '2', null, '管理员');
INSERT INTO `log` VALUES ('30', '59.34.2.254', '2015-01-29 10:49:21', '2', null, '管理员');
INSERT INTO `log` VALUES ('31', '14.153.240.255', '2015-01-29 13:43:01', '2', null, '管理员');
INSERT INTO `log` VALUES ('32', '59.34.2.254', '2015-01-29 14:18:32', '2', null, '管理员');
INSERT INTO `log` VALUES ('33', '14.153.240.255', '2015-01-29 15:31:08', '2', null, '管理员');
INSERT INTO `log` VALUES ('34', '59.34.2.254', '2015-01-29 16:36:24', '2', null, '管理员');
INSERT INTO `log` VALUES ('35', '59.34.2.254', '2015-01-30 08:37:10', '2', null, '管理员');
INSERT INTO `log` VALUES ('36', '59.34.2.254', '2015-01-30 10:14:37', '2', null, '管理员');
INSERT INTO `log` VALUES ('37', '14.153.247.107', '2015-01-30 10:41:23', '2', null, '管理员');
INSERT INTO `log` VALUES ('38', '59.34.2.254', '2015-01-30 14:18:48', '2', null, '管理员');
INSERT INTO `log` VALUES ('39', '59.34.2.254', '2015-01-30 14:32:49', '2', null, '管理员');
INSERT INTO `log` VALUES ('40', '59.34.2.254', '2015-01-30 17:03:20', '2', null, '管理员');
INSERT INTO `log` VALUES ('41', '183.38.0.60', '2015-01-31 15:01:23', '2', null, '管理员');
INSERT INTO `log` VALUES ('42', '59.34.2.254', '2015-02-02 08:51:48', '2', null, '管理员');
INSERT INTO `log` VALUES ('43', '59.34.2.254', '2015-02-02 10:40:05', '2', null, '管理员');
INSERT INTO `log` VALUES ('44', '59.34.2.254', '2015-02-02 10:40:20', '18', null, '吴锦培');
INSERT INTO `log` VALUES ('45', '59.34.2.254', '2015-02-02 18:37:25', '18', null, '吴锦培');
INSERT INTO `log` VALUES ('46', '59.34.2.254', '2015-02-03 09:07:33', '18', null, '吴锦培');
INSERT INTO `log` VALUES ('47', '59.34.2.254', '2015-02-03 09:35:47', '18', null, '吴锦培');
INSERT INTO `log` VALUES ('48', '59.34.2.254', '2015-02-03 10:18:33', '21', null, '淑贤');
INSERT INTO `log` VALUES ('49', '59.34.2.254', '2015-02-03 10:22:29', '18', null, '吴锦培');
INSERT INTO `log` VALUES ('50', '59.34.2.254', '2015-02-03 10:25:46', '21', null, '淑贤');
INSERT INTO `log` VALUES ('51', '59.34.2.254', '2015-02-03 10:26:56', '23', null, '成霞');
INSERT INTO `log` VALUES ('52', '59.34.2.254', '2015-02-03 10:28:15', '23', null, '成霞');
INSERT INTO `log` VALUES ('53', '59.34.2.254', '2015-02-03 10:31:36', '24', null, '宁永红');
INSERT INTO `log` VALUES ('54', '59.34.2.254', '2015-02-03 10:32:01', '22', null, '堃姐');
INSERT INTO `log` VALUES ('55', '59.34.2.254', '2015-02-03 10:38:30', '25', null, '潘颖');
INSERT INTO `log` VALUES ('56', '59.34.2.254', '2015-02-03 11:15:37', '18', null, '吴锦培');
INSERT INTO `log` VALUES ('57', '59.34.2.254', '2015-02-03 15:54:14', '18', null, '吴锦培');
INSERT INTO `log` VALUES ('58', '59.34.2.254', '2015-02-03 16:29:30', '18', null, '吴锦培');
INSERT INTO `log` VALUES ('59', '59.34.2.254', '2015-02-03 17:44:33', '23', null, '成霞');
INSERT INTO `log` VALUES ('60', '59.34.2.254', '2015-02-03 17:46:07', '21', null, '淑贤');
INSERT INTO `log` VALUES ('61', '59.34.2.254', '2015-02-03 17:52:32', '22', null, '堃姐');
INSERT INTO `log` VALUES ('62', '59.34.2.254', '2015-02-04 09:25:21', '25', null, '潘颖');
INSERT INTO `log` VALUES ('63', '59.34.2.254', '2015-02-04 09:25:52', '25', null, '潘颖');
INSERT INTO `log` VALUES ('64', '59.34.2.254', '2015-02-04 09:50:40', '18', null, '吴锦培');
INSERT INTO `log` VALUES ('65', '59.34.2.254', '2015-02-04 10:24:42', '23', null, '成霞');
INSERT INTO `log` VALUES ('66', '59.34.2.254', '2015-02-04 10:39:11', '20', null, '李敏');
INSERT INTO `log` VALUES ('67', '59.34.2.254', '2015-02-04 14:10:44', '18', null, '吴锦培');
INSERT INTO `log` VALUES ('68', '59.34.2.254', '2015-02-04 14:19:06', '26', null, '客服专员');
INSERT INTO `log` VALUES ('69', '59.34.2.254', '2015-02-04 14:20:30', '26', null, '客服专员');
INSERT INTO `log` VALUES ('70', '59.34.2.254', '2015-02-04 14:42:21', '26', null, '客服专员');
INSERT INTO `log` VALUES ('71', '59.34.2.254', '2015-02-04 14:48:07', '26', null, '客服专员');
INSERT INTO `log` VALUES ('72', '59.34.2.254', '2015-02-04 14:49:54', '26', null, '客服专员');
INSERT INTO `log` VALUES ('73', '59.34.2.254', '2015-02-04 15:00:06', '2', null, '管理员');
INSERT INTO `log` VALUES ('74', '59.34.2.254', '2015-02-04 15:36:48', '26', null, '客服专员');
INSERT INTO `log` VALUES ('75', '59.34.2.254', '2015-02-05 09:28:52', '26', null, '客服专员');
INSERT INTO `log` VALUES ('76', '59.34.2.254', '2015-02-05 09:30:00', '26', null, '客服专员');
INSERT INTO `log` VALUES ('77', '59.34.2.254', '2015-02-05 09:38:29', '26', null, '客服专员');
INSERT INTO `log` VALUES ('78', '59.34.2.254', '2015-02-05 11:27:50', '18', null, '吴锦培');
INSERT INTO `log` VALUES ('79', '59.34.2.254', '2015-02-05 14:21:41', '26', null, '客服专员');
INSERT INTO `log` VALUES ('80', '59.34.2.254', '2015-02-05 14:59:12', '2', null, '管理员');
INSERT INTO `log` VALUES ('81', '59.34.2.254', '2015-02-05 17:28:36', '2', null, '管理员');
INSERT INTO `log` VALUES ('82', '59.34.2.254', '2015-02-06 09:12:56', '2', null, '管理员');
INSERT INTO `log` VALUES ('83', '59.34.2.254', '2015-02-06 09:22:13', '26', null, '客服专员');
INSERT INTO `log` VALUES ('84', '59.34.2.254', '2015-02-06 10:17:47', '26', null, '客服专员');
INSERT INTO `log` VALUES ('85', '59.34.2.254', '2015-02-06 10:37:06', '2', null, '管理员');
INSERT INTO `log` VALUES ('86', '59.34.2.254', '2015-02-06 10:40:52', '26', null, '客服专员');
INSERT INTO `log` VALUES ('87', '59.34.2.254', '2015-02-06 12:43:10', '2', null, '管理员');
INSERT INTO `log` VALUES ('88', '59.34.2.254', '2015-02-06 17:26:45', '2', null, '管理员');
INSERT INTO `log` VALUES ('89', '127.0.0.1', '2015-02-06 19:01:07', '2', null, '管理员');
INSERT INTO `log` VALUES ('90', '127.0.0.1', '2015-02-06 20:42:39', '2', null, '管理员');
INSERT INTO `log` VALUES ('91', '127.0.0.1', '2015-02-07 11:25:23', '2', null, '管理员');
INSERT INTO `log` VALUES ('92', '127.0.0.1', '2015-02-07 11:32:47', '2', null, '管理员');
INSERT INTO `log` VALUES ('93', '127.0.0.1', '2015-02-10 15:26:27', '2', null, '管理员');
INSERT INTO `log` VALUES ('94', '127.0.0.1', '2015-02-10 18:14:25', '2', null, '管理员');
INSERT INTO `log` VALUES ('95', '127.0.0.1', '2015-02-10 18:14:34', '2', null, '管理员');
INSERT INTO `log` VALUES ('96', '127.0.0.1', '2015-02-11 11:34:36', '2', null, '管理员');
INSERT INTO `log` VALUES ('97', '127.0.0.1', '2015-02-11 12:02:24', '2', null, '管理员');
INSERT INTO `log` VALUES ('98', '127.0.0.1', '2015-02-11 13:52:05', '2', null, '管理员');
INSERT INTO `log` VALUES ('99', '14.153.244.163', '2015-02-11 15:55:49', '2', null, '管理员');
INSERT INTO `log` VALUES ('100', '14.153.244.163', '2015-02-11 18:15:59', '2', null, '管理员');
INSERT INTO `log` VALUES ('101', '14.153.240.128', '2015-02-13 17:39:11', '2', null, '管理员');
INSERT INTO `log` VALUES ('102', '127.0.0.1', '2015-02-25 16:14:59', '2', null, '管理员');
INSERT INTO `log` VALUES ('103', '127.0.0.1', '2015-02-25 16:47:33', '2', null, '管理员');
INSERT INTO `log` VALUES ('104', '127.0.0.1', '2015-02-25 18:27:22', '2', null, '管理员');
INSERT INTO `log` VALUES ('105', '127.0.0.1', '2015-02-25 18:32:16', '2', null, '管理员');
INSERT INTO `log` VALUES ('106', '127.0.0.1', '2015-02-25 19:04:00', '2', null, '管理员');
INSERT INTO `log` VALUES ('107', '127.0.0.1', '2015-02-26 12:13:38', '2', null, '管理员');
INSERT INTO `log` VALUES ('108', '127.0.0.1', '2015-02-26 14:01:30', '2', null, '管理员');
INSERT INTO `log` VALUES ('109', '127.0.0.1', '2015-02-26 17:36:39', '2', null, '管理员');
INSERT INTO `log` VALUES ('110', '127.0.0.1', '2015-02-26 18:50:32', '2', null, '管理员');

-- ----------------------------
-- Table structure for `manual`
-- ----------------------------
DROP TABLE IF EXISTS `manual`;
CREATE TABLE `manual` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isShow` int(11) DEFAULT '1',
  `title` varchar(200) DEFAULT NULL,
  `imgExplain` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manual
-- ----------------------------

-- ----------------------------
-- Table structure for `manualintegral`
-- ----------------------------
DROP TABLE IF EXISTS `manualintegral`;
CREATE TABLE `manualintegral` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户编号',
  `amountPoints` int(11) DEFAULT NULL COMMENT '合计',
  `bankWaterPoints` int(11) DEFAULT NULL COMMENT '银行流水',
  `ckVaule` longtext COMMENT '复选框的值',
  `creditCardPoints` int(11) DEFAULT NULL COMMENT '信用卡账单',
  `houseCardPoints` int(11) DEFAULT NULL COMMENT '房产证得分',
  `salesContractInvoicePoints` int(11) DEFAULT NULL COMMENT '销售合同及发票',
  `socialPoints` int(11) DEFAULT NULL COMMENT '社保',
  `tgPoints` int(11) DEFAULT NULL COMMENT '推广积分',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `manualintegral_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userbasicsinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手动积分表; InnoDB free: 8192 kB; (`user_id`) REFER `tg; InnoDB free: 8192 kB; (`user';

-- ----------------------------
-- Records of manualintegral
-- ----------------------------

-- ----------------------------
-- Table structure for `member_number`
-- ----------------------------
DROP TABLE IF EXISTS `member_number`;
CREATE TABLE `member_number` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `number` varchar(10) DEFAULT NULL COMMENT '会员编码',
  `adminuser_id` bigint(11) DEFAULT NULL COMMENT '所属服务人员',
  `isuse` int(1) DEFAULT NULL COMMENT '是否使用 1使用  0未使用',
  PRIMARY KEY (`id`),
  KEY `adminuser_id` (`adminuser_id`) USING BTREE,
  CONSTRAINT `member_number_ibfk_1` FOREIGN KEY (`adminuser_id`) REFERENCES `adminuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员编码表; InnoDB free: 8192 kB; (`adminuser_id`) REFE; InnoDB free: 8192 kB; (`admi';

-- ----------------------------
-- Records of member_number
-- ----------------------------

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `systemMenu` bigint(20) DEFAULT NULL COMMENT '上级菜单',
  `resourceURL` varchar(100) DEFAULT NULL COMMENT '访问资源路径',
  `smenCaption` varchar(100) DEFAULT NULL COMMENT '标题',
  `smenIndex` int(20) DEFAULT NULL COMMENT '排列顺序',
  `smenHint` varchar(200) DEFAULT NULL COMMENT '提示',
  `smenIcon` varchar(200) DEFAULT NULL COMMENT '图标路径',
  `engSmenCaption` varchar(255) DEFAULT NULL,
  `mlevel` int(11) DEFAULT NULL COMMENT '菜单级别1(一级菜单)2(二级菜单)3(功能点)',
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `systemMenu` (`systemMenu`) USING BTREE,
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`systemMenu`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='菜单表; InnoDB free: 8192 kB; (`systemMenu`) REFER `tgp2p; InnoDB free: 8192 kB; (`';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', null, null, '栏目管理', null, null, 'smt-application_cascade', null, '1', null);
INSERT INTO `menu` VALUES ('2', null, null, '会员中心', null, null, 'smt-systemRole', null, '1', null);
INSERT INTO `menu` VALUES ('3', null, '', '借款标管理', null, null, 'smt-shape_flip', null, '1', null);
INSERT INTO `menu` VALUES ('4', null, null, '资金管理', null, null, 'smt-coins', null, '1', null);
INSERT INTO `menu` VALUES ('5', null, null, '系统管理', null, null, 'smt-systemMenu', null, '1', null);
INSERT INTO `menu` VALUES ('6', null, null, '本机管理', null, null, 'smt-welcome', null, '1', null);
INSERT INTO `menu` VALUES ('7', '1', '/topic/queryAllTopics', '一级栏目管理', '1', '栏目管理', 'smt-application_osx', null, '2', null);
INSERT INTO `menu` VALUES ('8', '1', '/deputysection/queryAllDeputysections', '二级栏目管理', '2', null, 'smt-application_osx', null, '2', null);
INSERT INTO `menu` VALUES ('9', '1', '/single/queryAllDepuy1', '单页内容管理', '2', null, 'smt-application_osx', null, '2', null);
INSERT INTO `menu` VALUES ('10', '1', '/article/openArticles', '文章管理', '3', null, 'smt-book_edit', null, '2', null);
INSERT INTO `menu` VALUES ('12', '1', '/feedback/open', '邮件反馈', '1', '', 'smt-computer', '', '2', null);
INSERT INTO `menu` VALUES ('13', '7', '/topic/update.do', '编辑一级栏目', '1', '一级栏目管理', null, null, '3', null);
INSERT INTO `menu` VALUES ('14', '8', '/deputysection/add.do', '新增二级栏目', '2', '二级栏目管理', null, null, '3', null);
INSERT INTO `menu` VALUES ('15', '8', '/deputysection/update.do', '编辑二级栏目', '2', '二级栏目管理', null, null, '3', null);
INSERT INTO `menu` VALUES ('16', '8', '/deputysection/del.do', '删除二级栏目', '2', '二级栏目管理', null, null, '3', null);
INSERT INTO `menu` VALUES ('17', '9', '/deputysection/setHTML.do', '编辑单页列表内容', '2', '单页内容管理', null, null, '3', null);
INSERT INTO `menu` VALUES ('18', '10', '/article/add.do', '添加文章信息', '3', '文章管理', null, null, '3', null);
INSERT INTO `menu` VALUES ('19', '10', '/article/update.do', '编辑文章信息', '3', '文章管理', null, null, '3', null);
INSERT INTO `menu` VALUES ('20', '10', '/article/del.do', '删除文章信息', '3', '文章管理', null, null, '3', null);
INSERT INTO `menu` VALUES ('25', '5', '/link/linkpage', '友情链接设置', '1', null, 'smt-welcome', null, '2', null);
INSERT INTO `menu` VALUES ('26', '5', 'menurole/jume?url=role_menu', '角色权限管理', '3', null, 'smt-userEdit', null, '2', null);
INSERT INTO `menu` VALUES ('27', '5', 'menurole/jume?url=adminmanager/adminlist', '用户管理', '2', null, 'smt-systemRole', null, '2', null);
INSERT INTO `menu` VALUES ('28', '5', '/footer/getfooter', '系统信息设置', '1', null, 'smt-welcome', null, '2', null);
INSERT INTO `menu` VALUES ('29', '6', '/log/loglist', '日志管理', '4', null, 'smt-systemTime', null, '2', null);
INSERT INTO `menu` VALUES ('30', '2', 'menurole/jume?url=usermanager/userlist', '会员管理', '1', '会员信息', 'smt-systemRole', null, '2', null);
INSERT INTO `menu` VALUES ('31', '4', '/expenseRatio/openRatio.htm', '费用比例设置', '1', null, 'smt-chart', null, '2', null);
INSERT INTO `menu` VALUES ('32', '26', '/menu/uri.do', '新增角色', '1', null, null, null, '3', null);
INSERT INTO `menu` VALUES ('34', '3', '/loanSign/index', '普通标', '2', '', '', null, '2', null);
INSERT INTO `menu` VALUES ('35', '4', '/recharge/open', '充值记录', '4', null, 'smt-smt-layers', null, '2', null);
INSERT INTO `menu` VALUES ('36', '4', '/fund/fundlist', '资金统计', '2', '', 'smt-money', null, '2', null);
INSERT INTO `menu` VALUES ('37', '5', '/banner/bannerpage', 'Banner图片设置', '5', null, 'smt-images', null, '2', null);
INSERT INTO `menu` VALUES ('38', '4', '/withdraw/openRatio', '提现记录', '5', null, 'smt-application_role', null, '2', null);
INSERT INTO `menu` VALUES ('39', '2', 'menurole/jume?url=usermanager/borrowlist', '借款人管理', '1', '借款人管理', 'smt-systemRole', null, '2', null);
INSERT INTO `menu` VALUES ('43', '3', '/loansigntype/index', '标的类型管理', '1', null, null, null, '2', null);
INSERT INTO `menu` VALUES ('54', '2', 'menurole/jume?url=usermanager/applylist', '借款申请管理', '1', '借款申请管理', null, null, '2', null);
INSERT INTO `menu` VALUES ('56', '1', '/commonproblem/open', '常见问题', '1', null, 'smt-computer', null, '2', null);
INSERT INTO `menu` VALUES ('58', '3', '/loanSignOfCir/index', '债权转让', '5', null, null, null, '2', null);
INSERT INTO `menu` VALUES ('59', '2', 'menurole/jume?url=usermanager/assignmenter', '债权转让申请审核', '4', '债权转让申请审核', null, null, '2', null);
INSERT INTO `menu` VALUES ('60', '1', '/pdfManage/pdfList', 'pdf管理', '4', null, 'smt-book_edit', null, '2', null);
INSERT INTO `menu` VALUES ('61', '4', '/merUserInfo/open', '借款人与投资人开户信息', '3', null, 'smt-user', null, '2', null);
INSERT INTO `menu` VALUES ('62', '4', '/withdraw_apply/open', '会员提现审核', '6', '会员提现审核', null, null, '2', null);
INSERT INTO `menu` VALUES ('63', null, null, '催收管理', null, null, 'smt-remind_repayment', null, '1', null);
INSERT INTO `menu` VALUES ('64', '63', '/remindRepaymentList/open', '催收列表', '1', '催收列表', null, null, '2', null);
INSERT INTO `menu` VALUES ('65', null, null, '理财产品管理', null, '理财产品管理', 'smt-remind_repayment', null, '1', null);
INSERT INTO `menu` VALUES ('66', '65', '/loanSign/youxuan', '理财产品列表', '1', '理财产品列表', 'smt-remind_repayment', null, '2', null);
INSERT INTO `menu` VALUES ('67', '65', '/loanSign/openUser', '理财用户列表', '2', '理财用户列表', 'smt-remind_repayment', null, '2', null);

-- ----------------------------
-- Table structure for `menurole`
-- ----------------------------
DROP TABLE IF EXISTS `menurole`;
CREATE TABLE `menurole` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` varchar(50) DEFAULT NULL COMMENT '创建时间',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单Id',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色Id',
  PRIMARY KEY (`id`),
  KEY `FK146B07F0904D0E64` (`menu_id`) USING BTREE,
  KEY `FK146B07F099637AD2` (`role_id`) USING BTREE,
  CONSTRAINT `menurole_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  CONSTRAINT `menurole_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2622 DEFAULT CHARSET=utf8 COMMENT='菜单角色关系表; InnoDB free: 8192 kB; (`menu_id`) REF; InnoDB free: 8192 kB; (`menu_id`';

-- ----------------------------
-- Records of menurole
-- ----------------------------
INSERT INTO `menurole` VALUES ('2214', '2014-10-10 16:30:13', '1', '1');
INSERT INTO `menurole` VALUES ('2215', '2014-10-10 16:30:13', '2', '1');
INSERT INTO `menurole` VALUES ('2216', '2014-10-10 16:30:13', '3', '1');
INSERT INTO `menurole` VALUES ('2217', '2014-10-10 16:30:13', '4', '1');
INSERT INTO `menurole` VALUES ('2218', '2014-10-10 16:30:13', '5', '1');
INSERT INTO `menurole` VALUES ('2219', '2014-10-10 16:30:13', '6', '1');
INSERT INTO `menurole` VALUES ('2220', '2014-10-10 16:30:13', '7', '1');
INSERT INTO `menurole` VALUES ('2221', '2014-10-10 16:30:13', '8', '1');
INSERT INTO `menurole` VALUES ('2222', '2014-10-10 16:30:13', '9', '1');
INSERT INTO `menurole` VALUES ('2223', '2014-10-10 16:30:13', '10', '1');
INSERT INTO `menurole` VALUES ('2224', '2014-10-10 16:30:13', '12', '1');
INSERT INTO `menurole` VALUES ('2225', '2014-10-10 16:30:13', '13', '1');
INSERT INTO `menurole` VALUES ('2226', '2014-10-10 16:30:13', '14', '1');
INSERT INTO `menurole` VALUES ('2227', '2014-10-10 16:30:13', '15', '1');
INSERT INTO `menurole` VALUES ('2228', '2014-10-10 16:30:13', '16', '1');
INSERT INTO `menurole` VALUES ('2229', '2014-10-10 16:30:13', '17', '1');
INSERT INTO `menurole` VALUES ('2230', '2014-10-10 16:30:13', '18', '1');
INSERT INTO `menurole` VALUES ('2231', '2014-10-10 16:30:13', '19', '1');
INSERT INTO `menurole` VALUES ('2232', '2014-10-10 16:30:13', '20', '1');
INSERT INTO `menurole` VALUES ('2233', '2014-10-10 16:30:13', '25', '1');
INSERT INTO `menurole` VALUES ('2234', '2014-10-10 16:30:13', '26', '1');
INSERT INTO `menurole` VALUES ('2235', '2014-10-10 16:30:13', '27', '1');
INSERT INTO `menurole` VALUES ('2236', '2014-10-10 16:30:13', '28', '1');
INSERT INTO `menurole` VALUES ('2237', '2014-10-10 16:30:13', '29', '1');
INSERT INTO `menurole` VALUES ('2238', '2014-10-10 16:30:13', '30', '1');
INSERT INTO `menurole` VALUES ('2239', '2014-10-10 16:30:13', '31', '1');
INSERT INTO `menurole` VALUES ('2240', '2014-10-10 16:30:13', '32', '1');
INSERT INTO `menurole` VALUES ('2241', '2014-10-10 16:30:13', '34', '1');
INSERT INTO `menurole` VALUES ('2242', '2014-10-10 16:30:13', '35', '1');
INSERT INTO `menurole` VALUES ('2243', '2014-10-10 16:30:13', '36', '1');
INSERT INTO `menurole` VALUES ('2244', '2014-10-10 16:30:13', '37', '1');
INSERT INTO `menurole` VALUES ('2245', '2014-10-10 16:30:13', '38', '1');
INSERT INTO `menurole` VALUES ('2246', '2014-10-10 16:30:13', '39', '1');
INSERT INTO `menurole` VALUES ('2247', '2014-10-10 16:30:13', '43', '1');
INSERT INTO `menurole` VALUES ('2248', '2014-10-10 16:30:13', '54', '1');
INSERT INTO `menurole` VALUES ('2249', '2014-10-10 16:30:13', '56', '1');
INSERT INTO `menurole` VALUES ('2251', '2014-10-10 16:30:13', '58', '1');
INSERT INTO `menurole` VALUES ('2252', '2014-10-10 16:30:13', '59', '1');
INSERT INTO `menurole` VALUES ('2253', '2014-10-10 16:30:13', '60', '1');
INSERT INTO `menurole` VALUES ('2254', '2014-10-10 16:30:13', '61', '1');
INSERT INTO `menurole` VALUES ('2255', '2014-10-10 16:30:13', '62', '1');
INSERT INTO `menurole` VALUES ('2256', '2014-10-10 16:30:13', '63', '1');
INSERT INTO `menurole` VALUES ('2257', '2014-10-10 16:30:13', '64', '1');
INSERT INTO `menurole` VALUES ('2258', '2014-10-10 16:30:13', '65', '1');
INSERT INTO `menurole` VALUES ('2259', '2014-10-10 16:30:13', '66', '1');
INSERT INTO `menurole` VALUES ('2260', '2014-10-10 16:30:13', '67', '1');
INSERT INTO `menurole` VALUES ('2454', '2015-02-02 10:35:28', '1', '5');
INSERT INTO `menurole` VALUES ('2455', '2015-02-02 10:35:28', '2', '5');
INSERT INTO `menurole` VALUES ('2456', '2015-02-02 10:35:28', '3', '5');
INSERT INTO `menurole` VALUES ('2457', '2015-02-02 10:35:28', '4', '5');
INSERT INTO `menurole` VALUES ('2458', '2015-02-02 10:35:28', '5', '5');
INSERT INTO `menurole` VALUES ('2459', '2015-02-02 10:35:28', '6', '5');
INSERT INTO `menurole` VALUES ('2460', '2015-02-02 10:35:28', '7', '5');
INSERT INTO `menurole` VALUES ('2461', '2015-02-02 10:35:28', '8', '5');
INSERT INTO `menurole` VALUES ('2462', '2015-02-02 10:35:28', '9', '5');
INSERT INTO `menurole` VALUES ('2463', '2015-02-02 10:35:28', '10', '5');
INSERT INTO `menurole` VALUES ('2464', '2015-02-02 10:35:28', '12', '5');
INSERT INTO `menurole` VALUES ('2465', '2015-02-02 10:35:28', '13', '5');
INSERT INTO `menurole` VALUES ('2466', '2015-02-02 10:35:28', '14', '5');
INSERT INTO `menurole` VALUES ('2467', '2015-02-02 10:35:28', '15', '5');
INSERT INTO `menurole` VALUES ('2468', '2015-02-02 10:35:28', '16', '5');
INSERT INTO `menurole` VALUES ('2469', '2015-02-02 10:35:28', '17', '5');
INSERT INTO `menurole` VALUES ('2470', '2015-02-02 10:35:28', '18', '5');
INSERT INTO `menurole` VALUES ('2471', '2015-02-02 10:35:28', '19', '5');
INSERT INTO `menurole` VALUES ('2472', '2015-02-02 10:35:28', '20', '5');
INSERT INTO `menurole` VALUES ('2473', '2015-02-02 10:35:28', '25', '5');
INSERT INTO `menurole` VALUES ('2474', '2015-02-02 10:35:28', '26', '5');
INSERT INTO `menurole` VALUES ('2475', '2015-02-02 10:35:28', '27', '5');
INSERT INTO `menurole` VALUES ('2476', '2015-02-02 10:35:28', '28', '5');
INSERT INTO `menurole` VALUES ('2477', '2015-02-02 10:35:28', '29', '5');
INSERT INTO `menurole` VALUES ('2478', '2015-02-02 10:35:28', '30', '5');
INSERT INTO `menurole` VALUES ('2479', '2015-02-02 10:35:28', '31', '5');
INSERT INTO `menurole` VALUES ('2480', '2015-02-02 10:35:28', '32', '5');
INSERT INTO `menurole` VALUES ('2481', '2015-02-02 10:35:28', '34', '5');
INSERT INTO `menurole` VALUES ('2482', '2015-02-02 10:35:28', '35', '5');
INSERT INTO `menurole` VALUES ('2483', '2015-02-02 10:35:28', '36', '5');
INSERT INTO `menurole` VALUES ('2484', '2015-02-02 10:35:28', '37', '5');
INSERT INTO `menurole` VALUES ('2485', '2015-02-02 10:35:28', '38', '5');
INSERT INTO `menurole` VALUES ('2486', '2015-02-02 10:35:28', '39', '5');
INSERT INTO `menurole` VALUES ('2487', '2015-02-02 10:35:28', '43', '5');
INSERT INTO `menurole` VALUES ('2488', '2015-02-02 10:35:28', '54', '5');
INSERT INTO `menurole` VALUES ('2489', '2015-02-02 10:35:28', '56', '5');
INSERT INTO `menurole` VALUES ('2490', '2015-02-02 10:35:28', '58', '5');
INSERT INTO `menurole` VALUES ('2491', '2015-02-02 10:35:28', '59', '5');
INSERT INTO `menurole` VALUES ('2492', '2015-02-02 10:35:28', '60', '5');
INSERT INTO `menurole` VALUES ('2493', '2015-02-02 10:35:28', '61', '5');
INSERT INTO `menurole` VALUES ('2494', '2015-02-02 10:35:28', '62', '5');
INSERT INTO `menurole` VALUES ('2495', '2015-02-02 10:35:28', '63', '5');
INSERT INTO `menurole` VALUES ('2496', '2015-02-02 10:35:28', '64', '5');
INSERT INTO `menurole` VALUES ('2497', '2015-02-02 10:35:28', '65', '5');
INSERT INTO `menurole` VALUES ('2498', '2015-02-02 10:35:28', '66', '5');
INSERT INTO `menurole` VALUES ('2499', '2015-02-02 10:35:28', '67', '5');
INSERT INTO `menurole` VALUES ('2500', '2015-02-03 10:04:10', '1', '2');
INSERT INTO `menurole` VALUES ('2501', '2015-02-03 10:04:10', '2', '2');
INSERT INTO `menurole` VALUES ('2502', '2015-02-03 10:04:10', '6', '2');
INSERT INTO `menurole` VALUES ('2503', '2015-02-03 10:04:10', '7', '2');
INSERT INTO `menurole` VALUES ('2504', '2015-02-03 10:04:10', '8', '2');
INSERT INTO `menurole` VALUES ('2505', '2015-02-03 10:04:10', '9', '2');
INSERT INTO `menurole` VALUES ('2506', '2015-02-03 10:04:10', '10', '2');
INSERT INTO `menurole` VALUES ('2507', '2015-02-03 10:04:10', '12', '2');
INSERT INTO `menurole` VALUES ('2508', '2015-02-03 10:04:10', '13', '2');
INSERT INTO `menurole` VALUES ('2509', '2015-02-03 10:04:10', '14', '2');
INSERT INTO `menurole` VALUES ('2510', '2015-02-03 10:04:10', '15', '2');
INSERT INTO `menurole` VALUES ('2511', '2015-02-03 10:04:10', '16', '2');
INSERT INTO `menurole` VALUES ('2512', '2015-02-03 10:04:10', '17', '2');
INSERT INTO `menurole` VALUES ('2513', '2015-02-03 10:04:10', '18', '2');
INSERT INTO `menurole` VALUES ('2514', '2015-02-03 10:04:10', '19', '2');
INSERT INTO `menurole` VALUES ('2515', '2015-02-03 10:04:10', '20', '2');
INSERT INTO `menurole` VALUES ('2516', '2015-02-03 10:04:10', '29', '2');
INSERT INTO `menurole` VALUES ('2517', '2015-02-03 10:04:10', '30', '2');
INSERT INTO `menurole` VALUES ('2518', '2015-02-03 10:04:10', '39', '2');
INSERT INTO `menurole` VALUES ('2519', '2015-02-03 10:04:10', '54', '2');
INSERT INTO `menurole` VALUES ('2520', '2015-02-03 10:04:10', '56', '2');
INSERT INTO `menurole` VALUES ('2521', '2015-02-03 10:04:10', '59', '2');
INSERT INTO `menurole` VALUES ('2522', '2015-02-03 10:04:10', '60', '2');
INSERT INTO `menurole` VALUES ('2523', '2015-02-03 10:04:10', '63', '2');
INSERT INTO `menurole` VALUES ('2524', '2015-02-03 10:04:10', '64', '2');
INSERT INTO `menurole` VALUES ('2525', '2015-02-03 10:04:10', '65', '2');
INSERT INTO `menurole` VALUES ('2526', '2015-02-03 10:04:10', '66', '2');
INSERT INTO `menurole` VALUES ('2527', '2015-02-03 10:04:10', '67', '2');
INSERT INTO `menurole` VALUES ('2528', '2015-02-03 10:04:20', '1', '3');
INSERT INTO `menurole` VALUES ('2529', '2015-02-03 10:04:20', '2', '3');
INSERT INTO `menurole` VALUES ('2530', '2015-02-03 10:04:20', '7', '3');
INSERT INTO `menurole` VALUES ('2531', '2015-02-03 10:04:20', '8', '3');
INSERT INTO `menurole` VALUES ('2532', '2015-02-03 10:04:20', '9', '3');
INSERT INTO `menurole` VALUES ('2533', '2015-02-03 10:04:20', '10', '3');
INSERT INTO `menurole` VALUES ('2534', '2015-02-03 10:04:20', '12', '3');
INSERT INTO `menurole` VALUES ('2535', '2015-02-03 10:04:20', '13', '3');
INSERT INTO `menurole` VALUES ('2536', '2015-02-03 10:04:20', '14', '3');
INSERT INTO `menurole` VALUES ('2537', '2015-02-03 10:04:20', '15', '3');
INSERT INTO `menurole` VALUES ('2538', '2015-02-03 10:04:20', '16', '3');
INSERT INTO `menurole` VALUES ('2539', '2015-02-03 10:04:20', '17', '3');
INSERT INTO `menurole` VALUES ('2540', '2015-02-03 10:04:20', '18', '3');
INSERT INTO `menurole` VALUES ('2541', '2015-02-03 10:04:20', '19', '3');
INSERT INTO `menurole` VALUES ('2542', '2015-02-03 10:04:20', '20', '3');
INSERT INTO `menurole` VALUES ('2543', '2015-02-03 10:04:20', '30', '3');
INSERT INTO `menurole` VALUES ('2544', '2015-02-03 10:04:20', '39', '3');
INSERT INTO `menurole` VALUES ('2545', '2015-02-03 10:04:20', '54', '3');
INSERT INTO `menurole` VALUES ('2546', '2015-02-03 10:04:20', '56', '3');
INSERT INTO `menurole` VALUES ('2547', '2015-02-03 10:04:20', '59', '3');
INSERT INTO `menurole` VALUES ('2548', '2015-02-03 10:04:20', '60', '3');
INSERT INTO `menurole` VALUES ('2549', '2015-02-03 10:04:20', '63', '3');
INSERT INTO `menurole` VALUES ('2550', '2015-02-03 10:04:20', '64', '3');
INSERT INTO `menurole` VALUES ('2551', '2015-02-03 10:04:20', '65', '3');
INSERT INTO `menurole` VALUES ('2552', '2015-02-03 10:04:20', '66', '3');
INSERT INTO `menurole` VALUES ('2553', '2015-02-03 10:04:20', '67', '3');
INSERT INTO `menurole` VALUES ('2596', '2015-02-04 14:20:03', '1', '4');
INSERT INTO `menurole` VALUES ('2597', '2015-02-04 14:20:03', '2', '4');
INSERT INTO `menurole` VALUES ('2598', '2015-02-04 14:20:03', '7', '4');
INSERT INTO `menurole` VALUES ('2599', '2015-02-04 14:20:03', '8', '4');
INSERT INTO `menurole` VALUES ('2600', '2015-02-04 14:20:03', '9', '4');
INSERT INTO `menurole` VALUES ('2601', '2015-02-04 14:20:03', '10', '4');
INSERT INTO `menurole` VALUES ('2602', '2015-02-04 14:20:03', '12', '4');
INSERT INTO `menurole` VALUES ('2603', '2015-02-04 14:20:03', '13', '4');
INSERT INTO `menurole` VALUES ('2604', '2015-02-04 14:20:03', '14', '4');
INSERT INTO `menurole` VALUES ('2605', '2015-02-04 14:20:03', '15', '4');
INSERT INTO `menurole` VALUES ('2606', '2015-02-04 14:20:03', '16', '4');
INSERT INTO `menurole` VALUES ('2607', '2015-02-04 14:20:03', '17', '4');
INSERT INTO `menurole` VALUES ('2608', '2015-02-04 14:20:03', '18', '4');
INSERT INTO `menurole` VALUES ('2609', '2015-02-04 14:20:03', '19', '4');
INSERT INTO `menurole` VALUES ('2610', '2015-02-04 14:20:03', '20', '4');
INSERT INTO `menurole` VALUES ('2611', '2015-02-04 14:20:03', '30', '4');
INSERT INTO `menurole` VALUES ('2612', '2015-02-04 14:20:03', '39', '4');
INSERT INTO `menurole` VALUES ('2613', '2015-02-04 14:20:03', '54', '4');
INSERT INTO `menurole` VALUES ('2614', '2015-02-04 14:20:03', '56', '4');
INSERT INTO `menurole` VALUES ('2615', '2015-02-04 14:20:03', '59', '4');
INSERT INTO `menurole` VALUES ('2616', '2015-02-04 14:20:03', '60', '4');
INSERT INTO `menurole` VALUES ('2617', '2015-02-04 14:20:03', '63', '4');
INSERT INTO `menurole` VALUES ('2618', '2015-02-04 14:20:03', '64', '4');
INSERT INTO `menurole` VALUES ('2619', '2015-02-04 14:20:03', '65', '4');
INSERT INTO `menurole` VALUES ('2620', '2015-02-04 14:20:03', '66', '4');
INSERT INTO `menurole` VALUES ('2621', '2015-02-04 14:20:03', '67', '4');

-- ----------------------------
-- Table structure for `messagesetting`
-- ----------------------------
DROP TABLE IF EXISTS `messagesetting`;
CREATE TABLE `messagesetting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `messagetype_id` bigint(255) DEFAULT NULL COMMENT '类型',
  `user_id` bigint(20) DEFAULT NULL COMMENT '会员编号',
  `sysIsEnable` bit(1) DEFAULT NULL,
  `emailIsEnable` bit(1) DEFAULT NULL,
  `smsIsEnable` bit(1) DEFAULT NULL,
  `expand_guid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `messagetype_id` (`messagetype_id`) USING BTREE,
  KEY `user_guid` (`user_id`) USING BTREE,
  CONSTRAINT `messagesetting_ibfk_1` FOREIGN KEY (`messagetype_id`) REFERENCES `messagetype` (`id`),
  CONSTRAINT `messagesetting_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `userbasicsinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='信息提示表; InnoDB free: 8192 kB; (`messagetype_id`) RE; InnoDB free: 8192 kB; (`mess';

-- ----------------------------
-- Records of messagesetting
-- ----------------------------
INSERT INTO `messagesetting` VALUES ('1', '2', '13', '', '', '', null);
INSERT INTO `messagesetting` VALUES ('2', '3', '13', '', '', '', null);
INSERT INTO `messagesetting` VALUES ('3', '4', '13', '', '', '', null);
INSERT INTO `messagesetting` VALUES ('4', '5', '13', '', '', '', null);
INSERT INTO `messagesetting` VALUES ('5', '6', '13', '', '', '', null);
INSERT INTO `messagesetting` VALUES ('6', '7', '13', '', '', '', null);
INSERT INTO `messagesetting` VALUES ('7', '8', '13', '', '', '', null);
INSERT INTO `messagesetting` VALUES ('8', '9', '13', '', '', '', null);
INSERT INTO `messagesetting` VALUES ('9', '10', '13', '', '', '', null);
INSERT INTO `messagesetting` VALUES ('10', '11', '13', '', '', '', null);
INSERT INTO `messagesetting` VALUES ('11', '12', '13', '', '', '', null);
INSERT INTO `messagesetting` VALUES ('12', '13', '13', '', '', '', null);
INSERT INTO `messagesetting` VALUES ('13', '2', '21', '', '', '', null);
INSERT INTO `messagesetting` VALUES ('14', '3', '21', '', '', '', null);
INSERT INTO `messagesetting` VALUES ('15', '4', '21', '', '', '', null);
INSERT INTO `messagesetting` VALUES ('16', '5', '21', '', '', '', null);
INSERT INTO `messagesetting` VALUES ('17', '6', '21', '', '', '', null);
INSERT INTO `messagesetting` VALUES ('18', '7', '21', '', '', '', null);
INSERT INTO `messagesetting` VALUES ('19', '8', '21', '', '', '', null);
INSERT INTO `messagesetting` VALUES ('20', '9', '21', '', '', '', null);
INSERT INTO `messagesetting` VALUES ('21', '10', '21', '', '', '', null);
INSERT INTO `messagesetting` VALUES ('22', '11', '21', '', '', '', null);
INSERT INTO `messagesetting` VALUES ('23', '12', '21', '', '', '', null);
INSERT INTO `messagesetting` VALUES ('24', '13', '21', '', '', '', null);

-- ----------------------------
-- Table structure for `messagetype`
-- ----------------------------
DROP TABLE IF EXISTS `messagetype`;
CREATE TABLE `messagetype` (
  `id` bigint(20) NOT NULL,
  `name` varchar(256) DEFAULT NULL COMMENT '类型',
  `explan` varchar(1024) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信息提示类型(短信、站内、邮件)';

-- ----------------------------
-- Records of messagetype
-- ----------------------------
INSERT INTO `messagetype` VALUES ('2', '申请提现', '申请提现');
INSERT INTO `messagetype` VALUES ('3', '修改密码', '密码修改');
INSERT INTO `messagetype` VALUES ('4', '重置安全问题', '安全问题重置');
INSERT INTO `messagetype` VALUES ('5', '修改手机号码', '手机号码修改');
INSERT INTO `messagetype` VALUES ('6', '修改邮箱地址', '邮箱地址修改');
INSERT INTO `messagetype` VALUES ('7', '修改银行帐号', '银行帐号修改');
INSERT INTO `messagetype` VALUES ('8', '升级会员', '会员升级');
INSERT INTO `messagetype` VALUES ('9', '线上充值', '线上充值');
INSERT INTO `messagetype` VALUES ('10', '线下充值', '线下充值');
INSERT INTO `messagetype` VALUES ('11', '借出成功', '成功出借');
INSERT INTO `messagetype` VALUES ('12', '新上标提醒', '新上标提醒');
INSERT INTO `messagetype` VALUES ('13', '标的结束提醒', '标的结束提醒');

-- ----------------------------
-- Table structure for `online_apply_info`
-- ----------------------------
DROP TABLE IF EXISTS `online_apply_info`;
CREATE TABLE `online_apply_info` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) DEFAULT NULL COMMENT '真实名字',
  `provinceId` bigint(11) DEFAULT NULL COMMENT ' 省',
  `cityId` bigint(11) DEFAULT NULL COMMENT '市',
  `phone` varchar(15) DEFAULT NULL COMMENT '电话',
  `money` decimal(18,4) DEFAULT NULL COMMENT '投资金额 ',
  `content` varchar(20) DEFAULT NULL COMMENT '服务内容',
  `state` int(1) DEFAULT NULL COMMENT '状态  1 已联系 0 未联系',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线申请';

-- ----------------------------
-- Records of online_apply_info
-- ----------------------------

-- ----------------------------
-- Table structure for `outline`
-- ----------------------------
DROP TABLE IF EXISTS `outline`;
CREATE TABLE `outline` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `imgUrl` varchar(100) DEFAULT NULL,
  `isShow` int(11) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `content` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of outline
-- ----------------------------
INSERT INTO `outline` VALUES ('1', '/upload/banner/intro_1.png', '1', '', '<div style=\"width:200px;float:left;\"><h2 style=\"text-align:left\">100%本息保障</h2><p style=\"text-align: left;\">当理财人（借出者）投资的借款出现逾期，太平洋理财将向理财人垫付本期应回收本息。</p></div>');
INSERT INTO `outline` VALUES ('2', '/upload/banner/intro_2.png', '1', '', '<div style=\"width:200px;float:left;\"><h2 style=\"text-align:left\">安全高效系统</h2><p style=\"text-align: left;\">太平洋理财网站采用了多项网络安全技术，以保障理财人资金安全。</p></div>');
INSERT INTO `outline` VALUES ('3', '/upload/banner/intro_3.png', '1', '', '<div style=\"width:200px;float:left;\"><h2 style=\"text-align:left\">安全高效系统</h2><p style=\"text-align: left;\">在太平洋理财，我们提供了高质量的不同期限、不同利率、不同用途的借款项目，随心选择。</p></div>');

-- ----------------------------
-- Table structure for `partner`
-- ----------------------------
DROP TABLE IF EXISTS `partner`;
CREATE TABLE `partner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `img_url` varchar(80) DEFAULT NULL,
  `is_show` int(11) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of partner
-- ----------------------------

-- ----------------------------
-- Table structure for `preset`
-- ----------------------------
DROP TABLE IF EXISTS `preset`;
CREATE TABLE `preset` (
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `loanSign_id` bigint(20) NOT NULL COMMENT '理财计划Id',
  `presetTime` varchar(64) DEFAULT NULL COMMENT '预定时间',
  `payTime` varchar(32) DEFAULT NULL COMMENT '剩余支付时间',
  `bargainMoney` decimal(18,4) DEFAULT NULL COMMENT '定金',
  `loanMoney` decimal(18,4) DEFAULT NULL COMMENT '投入金额',
  `state` bigint(32) DEFAULT '0' COMMENT '状态：0未预定 ，1预定成功，2已加入',
  `userbaseinfo_id` bigint(16) NOT NULL COMMENT '用户id',
  `ucode` varchar(32) DEFAULT NULL,
  `success` bigint(32) DEFAULT NULL COMMENT '兑换成功',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of preset
-- ----------------------------

-- ----------------------------
-- Table structure for `product_apply`
-- ----------------------------
DROP TABLE IF EXISTS `product_apply`;
CREATE TABLE `product_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `money` double DEFAULT NULL,
  `principal_pay_type` varchar(20) DEFAULT NULL,
  `rate_pay_type` varchar(20) DEFAULT NULL,
  `rate_percent_year` decimal(20,0) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `time_during` varchar(20) DEFAULT NULL,
  `time_end` varchar(20) DEFAULT NULL,
  `time_start` varchar(20) DEFAULT NULL,
  `userbasic_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK519E041E71860A8` (`userbasic_id`) USING BTREE,
  CONSTRAINT `product_apply_ibfk_1` FOREIGN KEY (`userbasic_id`) REFERENCES `userbasicsinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 8192 kB; (`userbasic_id`) REFER `tgp2p/userbasi';

-- ----------------------------
-- Records of product_apply
-- ----------------------------

-- ----------------------------
-- Table structure for `product_pay_record`
-- ----------------------------
DROP TABLE IF EXISTS `product_pay_record`;
CREATE TABLE `product_pay_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `all_sum` double DEFAULT NULL,
  `already_date` varchar(255) DEFAULT NULL,
  `award` double DEFAULT NULL,
  `endTime` varchar(255) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `money_manager` double DEFAULT NULL,
  `pBidNo` varchar(30) DEFAULT NULL,
  `pContractNo` varchar(30) DEFAULT NULL,
  `pMerBillNo` varchar(30) DEFAULT NULL,
  `pay_type` int(11) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_rate_percent_year` double DEFAULT NULL,
  `product_time_during` bigint(20) DEFAULT NULL,
  `rate_sum` double DEFAULT NULL,
  `shows` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `time_pay_start` varchar(20) DEFAULT NULL,
  `time_principal_pay` varchar(20) DEFAULT NULL,
  `time_rate_pay_first` varchar(20) DEFAULT NULL,
  `time_start` varchar(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `userbasic_id` bigint(20) DEFAULT NULL,
  `userbasic_creditor_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `FK990699187D1947B3` (`userbasic_creditor_id`) USING BTREE,
  KEY `FK9906991890537CF2` (`admin_id`) USING BTREE,
  KEY `FK9906991871860A8` (`userbasic_id`) USING BTREE,
  CONSTRAINT `product_pay_record_ibfk_1` FOREIGN KEY (`userbasic_id`) REFERENCES `userbasicsinfo` (`id`),
  CONSTRAINT `product_pay_record_ibfk_2` FOREIGN KEY (`userbasic_creditor_id`) REFERENCES `userbasicsinfo` (`id`),
  CONSTRAINT `product_pay_record_ibfk_3` FOREIGN KEY (`admin_id`) REFERENCES `adminuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 8192 kB; (`userbasic_id`) REFER `tgp2p/userbasi';

-- ----------------------------
-- Records of product_pay_record
-- ----------------------------

-- ----------------------------
-- Table structure for `product_repay_money_record`
-- ----------------------------
DROP TABLE IF EXISTS `product_repay_money_record`;
CREATE TABLE `product_repay_money_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NOT NULL,
  `pIpsBillNo` varchar(30) DEFAULT NULL,
  `pMerBillNo` varchar(30) DEFAULT NULL,
  `repay_content` varchar(20) NOT NULL,
  `repay_meney` double NOT NULL,
  `time_execute` varchar(20) DEFAULT NULL,
  `time_repay` varchar(20) NOT NULL,
  `product_pay_record` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `FKBA5B606AE2DCC4C7` (`product_pay_record`) USING BTREE,
  CONSTRAINT `product_repay_money_record_ibfk_1` FOREIGN KEY (`product_pay_record`) REFERENCES `creditor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 8192 kB; (`product_pay_record`) REFER `tgp2p/cr';

-- ----------------------------
-- Records of product_repay_money_record
-- ----------------------------

-- ----------------------------
-- Table structure for `province`
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` bigint(20) NOT NULL COMMENT '编号',
  `name` varchar(60) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='省表';

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES ('1', '北京市');
INSERT INTO `province` VALUES ('2', '天津市');
INSERT INTO `province` VALUES ('3', '上海市');
INSERT INTO `province` VALUES ('4', '重庆市');
INSERT INTO `province` VALUES ('5', '河北省');
INSERT INTO `province` VALUES ('6', '山西省');
INSERT INTO `province` VALUES ('7', '台湾省');
INSERT INTO `province` VALUES ('8', '辽宁省');
INSERT INTO `province` VALUES ('9', '吉林省');
INSERT INTO `province` VALUES ('10', '黑龙江省');
INSERT INTO `province` VALUES ('11', '江苏省');
INSERT INTO `province` VALUES ('12', '浙江省');
INSERT INTO `province` VALUES ('13', '安徽省');
INSERT INTO `province` VALUES ('14', '福建省');
INSERT INTO `province` VALUES ('15', '江西省');
INSERT INTO `province` VALUES ('16', '山东省');
INSERT INTO `province` VALUES ('17', '河南省');
INSERT INTO `province` VALUES ('18', '湖北省');
INSERT INTO `province` VALUES ('19', '湖南省');
INSERT INTO `province` VALUES ('20', '广东省');
INSERT INTO `province` VALUES ('21', '甘肃省');
INSERT INTO `province` VALUES ('22', '四川省');
INSERT INTO `province` VALUES ('23', '贵州省');
INSERT INTO `province` VALUES ('24', '海南省');
INSERT INTO `province` VALUES ('25', '云南省');
INSERT INTO `province` VALUES ('26', '青海省');
INSERT INTO `province` VALUES ('27', '陕西省');
INSERT INTO `province` VALUES ('28', '广西壮族自治区');
INSERT INTO `province` VALUES ('29', '西藏自治区');
INSERT INTO `province` VALUES ('30', '宁夏回族自治区');
INSERT INTO `province` VALUES ('31', '新疆维吾尔自治区');
INSERT INTO `province` VALUES ('32', '内蒙古自治区');
INSERT INTO `province` VALUES ('33', '澳门特别行政区');
INSERT INTO `province` VALUES ('34', '香港特别行政区');

-- ----------------------------
-- Table structure for `recharge`
-- ----------------------------
DROP TABLE IF EXISTS `recharge`;
CREATE TABLE `recharge` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `time` varchar(32) DEFAULT NULL COMMENT '充值时间',
  `rechargeAmount` decimal(18,4) DEFAULT NULL COMMENT '充值金额',
  `reAccount` decimal(18,4) DEFAULT NULL COMMENT '到账金额',
  `orderNum` varchar(30) DEFAULT NULL COMMENT '订单号',
  `pIpsBillNo` varchar(255) DEFAULT NULL COMMENT 'ips充值编号',
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `recharge_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userbasicsinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='用户充值信息表; InnoDB free: 8192 kB; (`user_id`) REF; InnoDB free: 8192 kB; (`user_id`';

-- ----------------------------
-- Records of recharge
-- ----------------------------
INSERT INTO `recharge` VALUES ('1', '2', '2015-01-22 23:08:02', '9999.0000', '9999.0000', 'CZ20150122110729457468', 'CZ20150122110729457468', '1');
INSERT INTO `recharge` VALUES ('2', '2', '2015-01-22 23:08:19', '9999.0000', '9999.0000', 'CZ20150122110808130475', 'CZ20150122110808130475', '1');
INSERT INTO `recharge` VALUES ('3', '2', '2015-01-22 23:09:18', '1002.0000', '1002.0000', 'CZ20150122110847174165', 'CZ20150122110847174165', '1');
INSERT INTO `recharge` VALUES ('4', '7', '2015-01-23 00:39:02', '9999.0000', '9999.0000', 'CZ20150123123829831346', 'CZ20150123123829831346', '1');
INSERT INTO `recharge` VALUES ('5', '7', '2015-01-23 00:40:27', '9999.0000', '9999.0000', 'CZ20150123123952802174', 'CZ20150123123952802174', '1');
INSERT INTO `recharge` VALUES ('6', '7', '2015-01-23 08:56:23', '9999.0000', '9999.0000', 'CZ20150123085550953169', 'CZ20150123085550953169', '1');
INSERT INTO `recharge` VALUES ('7', '14', '2015-01-23 18:48:42', '100.0000', '100.0000', 'CZ20150123064743173296', 'CZ20150123064743173296', '1');
INSERT INTO `recharge` VALUES ('8', '26', '2015-01-28 15:02:29', '100.0000', '100.0000', 'CZ20150128025843578354', 'CZ20150128025843578354', '1');
INSERT INTO `recharge` VALUES ('9', '13', '2015-01-28 15:16:54', '500.0000', '500.0000', 'CZ20150128030916846431', 'CZ20150128030916846431', '1');
INSERT INTO `recharge` VALUES ('10', '27', '2015-02-03 17:40:39', '200.0000', '200.0000', 'CZ20150203053915692717', 'CZ20150203053915692717', '1');
INSERT INTO `recharge` VALUES ('11', '34', '2015-02-04 15:31:37', '2550.0000', '2550.0000', 'CZ20150204032427544810', 'CZ20150204032427544810', '1');
INSERT INTO `recharge` VALUES ('12', '27', '2015-02-04 15:47:00', '200.0000', '200.0000', 'CZ20150204034507811315', 'CZ20150204034507811315', '1');
INSERT INTO `recharge` VALUES ('13', '41', '2015-02-04 16:31:51', '200.0000', '200.0000', 'CZ20150204042929616410', 'CZ20150204042929616410', '1');
INSERT INTO `recharge` VALUES ('14', '7', '2015-02-26 12:00:52', '0.0100', '0.0100', '142492317375', '150226100019820645', '1');
INSERT INTO `recharge` VALUES ('15', '7', '2015-02-26 12:17:25', '0.0100', '0.0100', '142492419272', '150226100019821734', '1');

-- ----------------------------
-- Table structure for `repaymentrecord`
-- ----------------------------
DROP TABLE IF EXISTS `repaymentrecord`;
CREATE TABLE `repaymentrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `periods` int(2) DEFAULT NULL COMMENT '期数',
  `preRepayDate` varchar(255) DEFAULT NULL COMMENT '预计还款日期',
  `money` decimal(18,4) DEFAULT NULL COMMENT '本金',
  `preRepayMoney` decimal(18,4) DEFAULT NULL COMMENT '预计还款利息',
  `repayState` int(1) DEFAULT NULL COMMENT '还款状态：1未还款、2按时还款、3逾期未还款、4逾期已还款、5提前还款',
  `repayTime` varchar(255) DEFAULT NULL COMMENT '实际还款时间',
  `loanSign_id` bigint(20) DEFAULT NULL COMMENT '借款标',
  `realMoney` decimal(18,4) DEFAULT NULL COMMENT '实际还款利息',
  `pIpsBillNo` varchar(30) DEFAULT NULL,
  `pMerBillNo` varchar(30) DEFAULT NULL,
  `pIpsTime1` varchar(50) DEFAULT NULL COMMENT 'IPS受理日期',
  `pIpsTime2` varchar(50) DEFAULT NULL COMMENT 'IPS处理完成日期',
  `overdueInterest` decimal(18,4) DEFAULT '0.0000',
  `remindEmailCount` int(1) DEFAULT '0' COMMENT '催收提配邮件发送次数',
  `remindSMSCount` int(1) DEFAULT '0' COMMENT '催收提醒短信发送次数',
  `autoRepayAdvice` int(1) DEFAULT '0' COMMENT '自动还款通知;0:未通知,1:已通知;(用于后台发送邮件及短信通知)',
  `fee` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK72F54AA49C6DA5F7` (`loanSign_id`) USING BTREE,
  CONSTRAINT `repaymentrecord_ibfk_1` FOREIGN KEY (`loanSign_id`) REFERENCES `loansign` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='还款记录; InnoDB free: 8192 kB; (`loanSign_id`) REFER `t; InnoDB free: 8192 kB; (`lo';

-- ----------------------------
-- Records of repaymentrecord
-- ----------------------------
INSERT INTO `repaymentrecord` VALUES ('1', '1', '2015-02-23', '0.0000', '10.0000', '5', '2015-01-23 10:57:09', '4', '10.0000', '1_KH20150123123805318438', '1_KH20150123123805318438', '2015-01-23 10:57:10', '2015-01-23 10:57:09', '0.0000', '0', '0', '0', null);
INSERT INTO `repaymentrecord` VALUES ('2', '2', '2015-03-23', '0.0000', '10.0000', '5', '2015-01-23 10:57:46', '4', '10.0000', '2_KH20150123123805318438', '2_KH20150123123805318438', '2015-01-23 10:57:47', '2015-01-23 10:57:46', '0.0000', '0', '0', '0', null);
INSERT INTO `repaymentrecord` VALUES ('3', '3', '2015-04-23', '1000.0000', '10.0000', '5', '2015-01-23 11:12:14', '4', '10.0000', '3_KH20150123123805318438', '3_KH20150123123805318438', '2015-01-23 11:12:15', '2015-01-23 11:12:14', '0.0000', '0', '0', '0', null);
INSERT INTO `repaymentrecord` VALUES ('4', '1', '2015-02-23', '0.0000', '10.0000', '1', null, '7', null, null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `repaymentrecord` VALUES ('5', '2', '2015-03-23', '0.0000', '10.0000', '1', null, '7', null, null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `repaymentrecord` VALUES ('6', '3', '2015-04-23', '1000.0000', '10.0000', '1', null, '7', null, null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `repaymentrecord` VALUES ('7', '1', '2015-02-23', '100.0000', '1.0000', '5', '2015-01-23 19:04:45', '8', '1.0000', '7_KH20150123063424651007', '7_KH20150123063424651007', '2015-01-23 19:04:46', '2015-01-23 19:04:45', '0.0000', '0', '0', '0', null);
INSERT INTO `repaymentrecord` VALUES ('8', '1', '2015-02-26', '100.0000', '1.0000', '5', '2015-01-26 12:00:06', '9', '1.0000', '8_KH20150123063424651007', '8_KH20150123063424651007', '2015-01-26 12:00:07', '2015-01-26 12:00:06', '0.0000', '0', '0', '0', null);
INSERT INTO `repaymentrecord` VALUES ('9', '1', '2015-02-27', '100.0000', '1.0000', '5', '2015-01-28 10:49:22', '10', '1.0000', '9_1422413361169', '9_1422413361169', '2015-01-28 10:49:23', '2015-01-28 10:49:22', '0.0000', '0', '0', '0', null);
INSERT INTO `repaymentrecord` VALUES ('10', '1', '2015-02-28', '100.0000', '1.0000', '1', null, '12', null, null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `repaymentrecord` VALUES ('11', '1', '2015-02-28', '100.0000', '1.0000', '1', null, '13', null, null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `repaymentrecord` VALUES ('12', '1', '2015-02-28', '100.0000', '1.0000', '1', null, '14', null, null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `repaymentrecord` VALUES ('13', '1', '2015-02-28', '100.0000', '1.0000', '1', null, '15', null, null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `repaymentrecord` VALUES ('14', '1', '2015-02-28', '100.0000', '1.0000', '1', null, '16', null, null, null, null, null, null, '0', '0', '0', null);
INSERT INTO `repaymentrecord` VALUES ('15', '1', '2015-02-28', '100.0000', '1.0000', '5', '2015-01-28 16:33:45', '19', '1.0000', '15_1422434023903', '15_1422434023903', '2015-01-28 16:33:48', '2015-01-28 16:33:45', '0.0000', '0', '0', '0', null);
INSERT INTO `repaymentrecord` VALUES ('16', '1', '2015-02-28', '200.0000', '2.0000', '5', '2015-01-28 17:05:48', '17', '2.0000', '16_1422435948017', '16_1422435948017', '2015-01-28 17:05:52', '2015-01-28 17:05:48', '0.0000', '0', '0', '0', null);
INSERT INTO `repaymentrecord` VALUES ('17', '1', '2015-02-28', '100.0000', '1.0000', '5', '2015-01-29 09:42:43', '11', '1.0000', '17_1422495762859', '17_1422495762859', '2015-01-29 09:42:44', '2015-01-29 09:42:43', '0.0000', '0', '0', '0', null);
INSERT INTO `repaymentrecord` VALUES ('18', '1', '2015-02-28', '200.0000', '2.0000', '5', '2015-01-29 09:47:13', '18', '2.0000', '18_1422496032554', '18_1422496032554', '2015-01-29 09:47:16', '2015-01-29 09:47:13', '0.0000', '0', '0', '0', null);
INSERT INTO `repaymentrecord` VALUES ('19', '1', '2015-02-28', '100.0000', '1.0000', '5', '2015-01-29 17:04:10', '24', '1.0000', '19_1422522242793', '19_1422522242793', '2015-01-29 17:04:11', '2015-01-29 17:04:10', '0.0000', '0', '0', '0', '0.5000');
INSERT INTO `repaymentrecord` VALUES ('20', '1', '2015-02-28', '100.0000', '1.0000', '5', '2015-01-30 11:41:57', '28', '1.0000', '20_1422589317027', '20_1422589317027', '2015-01-30 11:41:58', '2015-01-30 11:41:57', '0.0000', '0', '0', '0', '0.5000');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `roleRemark` varchar(300) DEFAULT NULL COMMENT '备注',
  `createTime` varchar(50) DEFAULT NULL COMMENT '创建时间',
  `createUser` varchar(50) DEFAULT NULL COMMENT '创建人',
  `roleCode` varchar(20) DEFAULT NULL COMMENT '角色代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '后台管理员', '后台管理员', '2014-02-20', '1', '1');
INSERT INTO `role` VALUES ('2', '客服人员', '客服统一使用账号，用于客服后台管理', '2015-01-08 16:02:31', '2', null);
INSERT INTO `role` VALUES ('3', '财务人员', '财务人员', '', '', null);
INSERT INTO `role` VALUES ('4', '其他人员', '其他人员，打杂', '2014-08-08 17:47:34', '2', null);
INSERT INTO `role` VALUES ('5', '运维', '负责后台所有管理', '2015-02-02 10:36:58', '2', null);

-- ----------------------------
-- Table structure for `sectiontype`
-- ----------------------------
DROP TABLE IF EXISTS `sectiontype`;
CREATE TABLE `sectiontype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '栏目类型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='栏目类型信息表';

-- ----------------------------
-- Records of sectiontype
-- ----------------------------
INSERT INTO `sectiontype` VALUES ('1', '单页');
INSERT INTO `sectiontype` VALUES ('2', '列表');

-- ----------------------------
-- Table structure for `securityproblem`
-- ----------------------------
DROP TABLE IF EXISTS `securityproblem`;
CREATE TABLE `securityproblem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `verifyproblem_id` bigint(20) DEFAULT NULL COMMENT '问题',
  `answer` varchar(256) DEFAULT NULL COMMENT '答案',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `verifyproblem_id` (`verifyproblem_id`) USING BTREE,
  CONSTRAINT `securityproblem_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userbasicsinfo` (`id`),
  CONSTRAINT `securityproblem_ibfk_2` FOREIGN KEY (`verifyproblem_id`) REFERENCES `verifyproblem` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='用户安全问题表; InnoDB free: 8192 kB; (`user_id`) REF; InnoDB free: 8192 kB; (`user_id`';

-- ----------------------------
-- Records of securityproblem
-- ----------------------------
INSERT INTO `securityproblem` VALUES ('1', '1', '3', '1');
INSERT INTO `securityproblem` VALUES ('2', '1', '4', '1');
INSERT INTO `securityproblem` VALUES ('3', '2', '3', '1');
INSERT INTO `securityproblem` VALUES ('4', '2', '4', '1');
INSERT INTO `securityproblem` VALUES ('5', '3', '3', '1');
INSERT INTO `securityproblem` VALUES ('6', '3', '4', '1');
INSERT INTO `securityproblem` VALUES ('7', '4', '3', '1');
INSERT INTO `securityproblem` VALUES ('8', '4', '4', '1');
INSERT INTO `securityproblem` VALUES ('9', '5', '3', '1');
INSERT INTO `securityproblem` VALUES ('10', '5', '4', '1');
INSERT INTO `securityproblem` VALUES ('11', '6', '3', '1');
INSERT INTO `securityproblem` VALUES ('12', '6', '4', '1');
INSERT INTO `securityproblem` VALUES ('13', '7', '3', '1');
INSERT INTO `securityproblem` VALUES ('14', '7', '4', '1');
INSERT INTO `securityproblem` VALUES ('15', '13', '3', '吴奕窝');
INSERT INTO `securityproblem` VALUES ('16', '13', '4', '陈三妹');
INSERT INTO `securityproblem` VALUES ('17', '14', '1', '广东高州');
INSERT INTO `securityproblem` VALUES ('18', '14', '10', '广东高州');
INSERT INTO `securityproblem` VALUES ('19', '15', '1', '湖南湘乡');
INSERT INTO `securityproblem` VALUES ('20', '15', '4', '陈爱华');
INSERT INTO `securityproblem` VALUES ('21', '18', '1', '1');
INSERT INTO `securityproblem` VALUES ('22', '18', '2', '2');
INSERT INTO `securityproblem` VALUES ('23', '16', '1', '大旺');
INSERT INTO `securityproblem` VALUES ('24', '16', '10', '大旺');
INSERT INTO `securityproblem` VALUES ('25', '20', '1', '湛江');
INSERT INTO `securityproblem` VALUES ('26', '20', '3', 'CZB');
INSERT INTO `securityproblem` VALUES ('27', '23', '1', '老家');
INSERT INTO `securityproblem` VALUES ('28', '23', '10', '老家');
INSERT INTO `securityproblem` VALUES ('29', '22', '3', '周发海');
INSERT INTO `securityproblem` VALUES ('30', '22', '1', '深圳市大旺');
INSERT INTO `securityproblem` VALUES ('31', '24', '1', '大旺');
INSERT INTO `securityproblem` VALUES ('32', '24', '10', '大旺');
INSERT INTO `securityproblem` VALUES ('33', '21', '10', '榕园');
INSERT INTO `securityproblem` VALUES ('34', '21', '1', '赤坎街');
INSERT INTO `securityproblem` VALUES ('35', '25', '4', '宁菊香');
INSERT INTO `securityproblem` VALUES ('36', '25', '3', '陈国良');
INSERT INTO `securityproblem` VALUES ('37', '26', '3', '陈国良');
INSERT INTO `securityproblem` VALUES ('38', '26', '4', '宁菊香');
INSERT INTO `securityproblem` VALUES ('39', '27', '3', '廖明亮');
INSERT INTO `securityproblem` VALUES ('40', '27', '1', '云浮');
INSERT INTO `securityproblem` VALUES ('41', '30', '1', '海南');
INSERT INTO `securityproblem` VALUES ('42', '30', '2', '搜狗');
INSERT INTO `securityproblem` VALUES ('43', '31', '4', '郑华珍');
INSERT INTO `securityproblem` VALUES ('44', '31', '1', '沙朗');
INSERT INTO `securityproblem` VALUES ('45', '29', '1', '湖南');
INSERT INTO `securityproblem` VALUES ('46', '29', '2', '搜狗');
INSERT INTO `securityproblem` VALUES ('47', '35', '1', '抚顺');
INSERT INTO `securityproblem` VALUES ('48', '35', '3', '刘一兵');
INSERT INTO `securityproblem` VALUES ('49', '36', '1', '四会');
INSERT INTO `securityproblem` VALUES ('50', '36', '3', '邵英华');
INSERT INTO `securityproblem` VALUES ('51', '37', '1', '高要');
INSERT INTO `securityproblem` VALUES ('52', '37', '10', '高要');
INSERT INTO `securityproblem` VALUES ('53', '40', '1', '都昌');
INSERT INTO `securityproblem` VALUES ('54', '40', '10', '大旺');
INSERT INTO `securityproblem` VALUES ('55', '39', '1', '大旺');
INSERT INTO `securityproblem` VALUES ('56', '39', '10', '兴隆');
INSERT INTO `securityproblem` VALUES ('57', '34', '1', '大旺');
INSERT INTO `securityproblem` VALUES ('58', '34', '10', '大旺');
INSERT INTO `securityproblem` VALUES ('59', '41', '1', '湖南');
INSERT INTO `securityproblem` VALUES ('60', '41', '10', '湖南');
INSERT INTO `securityproblem` VALUES ('61', '42', '1', 'sss');
INSERT INTO `securityproblem` VALUES ('62', '42', '2', 'sss');
INSERT INTO `securityproblem` VALUES ('63', '44', '1', '萍乡');
INSERT INTO `securityproblem` VALUES ('64', '44', '2', '五笔');

-- ----------------------------
-- Table structure for `topic`
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号，主键，自动增长',
  `name` varchar(50) DEFAULT NULL COMMENT '栏目名称',
  `isShow` int(11) DEFAULT NULL COMMENT '是否显示(0不显示,1显示)',
  `orderNum` int(11) DEFAULT NULL COMMENT '显示顺序标识符',
  `url` varchar(200) DEFAULT NULL COMMENT '该栏目URL',
  `pageTitle` varchar(30) DEFAULT NULL COMMENT '网页标题',
  `isfooter` int(11) DEFAULT NULL COMMENT '是否显示在页脚(0不显示,1显示)',
  `engName` varchar(50) DEFAULT NULL COMMENT '英文',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='一级栏目信息表';

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('1', '首页', '1', null, 'to/list-1-20.htm', '首页', '0', 'Home');
INSERT INTO `topic` VALUES ('2', '我要理财', '1', '2', 'loaninfo/openLoan.htm', '我要理财', '0', 'Investment');
INSERT INTO `topic` VALUES ('3', '产品中心', '1', '3', 'to/single-3-71.htm', '产品中心', '0', 'Product');
INSERT INTO `topic` VALUES ('4', '开放式平台', '0', '4', 'to/single-4-109.htm', '开放式平台', '0', 'OpenPlatform');
INSERT INTO `topic` VALUES ('5', '我的账户', '1', '5', 'to/single-5-121.htm', '我的账户', '0', 'MyAccount');
INSERT INTO `topic` VALUES ('10', '关于我们', '1', null, 'to/single-10-92.htm', '关于我们', '1', 'AboutUs');
INSERT INTO `topic` VALUES ('11', '行业关注', '0', null, 'to/single-11-98.htm', '行业关注', '1', 'Industry');
INSERT INTO `topic` VALUES ('12', '安全保障', '0', null, 'to/single-12-102.htm', '安全保障', '1', 'Security');
INSERT INTO `topic` VALUES ('14', '客服中心', '1', null, 'to/single-6-69.htm', '客服中心', '0', 'Service');
INSERT INTO `topic` VALUES ('15', '协议', '0', null, 'to/single-15-128.htm', '', '0', '');
INSERT INTO `topic` VALUES ('16', '标的合同', '0', null, null, '', '0', '');

-- ----------------------------
-- Table structure for `uploadfile`
-- ----------------------------
DROP TABLE IF EXISTS `uploadfile`;
CREATE TABLE `uploadfile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL COMMENT '上传pdf文件名',
  `savePath` varchar(400) DEFAULT NULL COMMENT '保存路径',
  `saveName` varchar(500) DEFAULT NULL COMMENT '保存的原pdf文件名',
  `addTime` varchar(100) DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上传pdf文件信息';

-- ----------------------------
-- Records of uploadfile
-- ----------------------------

-- ----------------------------
-- Table structure for `userbank`
-- ----------------------------
DROP TABLE IF EXISTS `userbank`;
CREATE TABLE `userbank` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bankAccount` varchar(128) DEFAULT NULL COMMENT '银行卡账号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户编号',
  `bankname` varchar(120) DEFAULT NULL COMMENT '银行卡名称',
  `bankNumber` varchar(30) DEFAULT NULL COMMENT '银行卡编号',
  `banktype_id` bigint(20) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `province_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `FKF0241487CD56F684` (`banktype_id`) USING BTREE,
  KEY `FKF0241487102EA444` (`province_id`) USING BTREE,
  KEY `FKF024148749048B64` (`city_id`) USING BTREE,
  CONSTRAINT `userbank_ibfk_1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`),
  CONSTRAINT `userbank_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `userbank_ibfk_3` FOREIGN KEY (`banktype_id`) REFERENCES `banktype` (`id`),
  CONSTRAINT `userbank_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `userbasicsinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户银行卡账号信息表; InnoDB free: 8192 kB; (`prov; InnoDB free: 8192 kB; (`province_id`) ';

-- ----------------------------
-- Records of userbank
-- ----------------------------

-- ----------------------------
-- Table structure for `userbasicsinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userbasicsinfo`;
CREATE TABLE `userbasicsinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) DEFAULT NULL COMMENT '登陆用户名',
  `name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(255) DEFAULT NULL COMMENT '登陆密码',
  `transPassword` varchar(255) DEFAULT NULL COMMENT '交易密码',
  `randomCode` varchar(255) DEFAULT NULL COMMENT '邮箱激活验证码',
  `createTime` varchar(80) DEFAULT NULL COMMENT '注册时间',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `isLock` int(2) DEFAULT NULL COMMENT '是否被锁',
  `lockTime` varchar(80) DEFAULT NULL COMMENT '锁定时间',
  `failTime` varchar(80) DEFAULT NULL COMMENT '上次登陆失败时间',
  `errorNum` int(20) DEFAULT NULL COMMENT '登录错误次数',
  `isCreditor` int(11) DEFAULT NULL COMMENT '用户类型 1借款者2投资者',
  `pIpsAcctDate` varchar(50) DEFAULT NULL COMMENT '开户时间',
  `pMerBillNo` varchar(50) DEFAULT NULL COMMENT '商户开户流水单号',
  `member_number_id` bigint(20) DEFAULT NULL,
  `valicodeinfo_id` bigint(20) DEFAULT NULL,
  `userrelation_id` bigint(20) DEFAULT NULL,
  `valideinfo_id` bigint(20) DEFAULT NULL,
  `isLoanState` int(11) DEFAULT NULL,
  `repaySignStatus` int(1) DEFAULT '0' COMMENT '自动还款签约状态;0:未签约，1:已签约;',
  `isespecialuser` int(11) DEFAULT NULL COMMENT '优金用户',
  `repayAuthNo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK743D763E83ED479` (`member_number_id`) USING BTREE,
  KEY `valicodeinfo_id` (`valicodeinfo_id`) USING BTREE,
  KEY `userrelation_id` (`userrelation_id`) USING BTREE,
  CONSTRAINT `userbasicsinfo_ibfk_1` FOREIGN KEY (`member_number_id`) REFERENCES `member_number` (`id`),
  CONSTRAINT `userbasicsinfo_ibfk_2` FOREIGN KEY (`valicodeinfo_id`) REFERENCES `validcodeinfo` (`id`),
  CONSTRAINT `userbasicsinfo_ibfk_3` FOREIGN KEY (`userrelation_id`) REFERENCES `userrelationinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='用户基础信息表; InnoDB free: 8192 kB; (`member_number; InnoDB free: 8192 kB; (`member_n';

-- ----------------------------
-- Records of userbasicsinfo
-- ----------------------------
INSERT INTO `userbasicsinfo` VALUES ('1', 'zemei', '郭钊铭', 'e10adc3949ba59abbe56e057f20f883e', '257c146d70c5f9546aa009363eaf66c3', '953519', '2015-01-22 22:53:12', null, '0', null, '', '0', '1', '20150122', 'KH20150122105605734723', null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('2', 'zemei1', '罗淳雅', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '415419', '2015-01-22 22:59:31', null, '0', null, '', '0', '1', '20150122', 'KH20150122110515905605', null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('3', 'guo111', '朱德厚', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '797159', '2015-01-22 23:54:38', null, '0', null, null, '0', '1', '20150122', 'KH20150122115702875380', null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('4', 'guo222', '朱德厚', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '782025', '2015-01-22 23:58:41', null, '0', null, null, '0', '1', '20150123', 'KH20150123120103209628', null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('5', 'guo333', '朱德厚', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '404359', '2015-01-23 00:02:15', null, '0', null, '', '0', '1', '20150123', 'KH20150123121159662310', null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('6', 'guo444', '朱德厚', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '344054', '2015-01-23 00:27:14', null, '0', null, null, '0', '1', '20150123', 'KH20150123123203122072', null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('7', 'guo555', '朱德厚', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '605876', '2015-01-23 00:33:43', null, '0', null, '', '0', '1', '20150123', 'KH20150123123805318438', null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('8', '8', null, 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '860960', '2015-01-23 18:26:21', null, '0', null, null, '0', '1', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('9', '9', null, 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '238505', '2015-01-23 18:26:48', null, '0', null, null, '0', '1', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('10', '10', null, 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '685564', '2015-01-23 18:27:16', null, '0', null, null, '0', '1', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('11', '11', null, 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '480927', '2015-01-23 18:28:03', null, '0', null, null, '0', '1', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('12', 'guotest', '郭钊铭', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '353626', '2015-01-23 18:29:10', null, '0', null, null, '0', '1', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('13', 'sodagreen28', '吴锦培', '6fcdc8336c288980cf77fe2226dddcca', '8166413bc92b4d182a6c6a10200a6e03', '511180', '2015-01-23 18:32:40', null, '0', null, '', '0', '1', '20150123', 'KH20150123063424651007', null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('14', 'lmjgkd92', '黎明杰', '19bd23f6c5bf8a140333d1d3c170036a', '19bd23f6c5bf8a140333d1d3c170036a', '746775', '2015-01-23 18:32:48', null, '0', null, '', '0', '1', '20150123', 'KH20150123063537846269', null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('15', 'daodaodao', '周明道', '457b0bc12906531bb9a60d5b3d06357b', '457b0bc12906531bb9a60d5b3d06357b', '177468', '2015-01-23 22:06:31', null, '0', null, '', '0', '1', '20150123', 'KH20150123100942686877', null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('16', 'baby', '李敏', '98efd2e334a298f67ff0e75a8d1058e4', '98efd2e334a298f67ff0e75a8d1058e4', '846840', '2015-01-24 14:15:15', null, '0', null, '', '0', '1', '20150124', 'KH20150124022721402984', null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('17', 'sodagreen1', null, '8166413bc92b4d182a6c6a10200a6e03', '8166413bc92b4d182a6c6a10200a6e03', '368696', '2015-01-24 14:16:34', null, '0', null, null, '0', '1', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('18', 'sodagreen2', '吴锦培', '8166413bc92b4d182a6c6a10200a6e03', '8166413bc92b4d182a6c6a10200a6e03', '848248', '2015-01-24 14:17:19', null, '0', null, null, '0', '1', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('19', 'sodagreen3', null, '8166413bc92b4d182a6c6a10200a6e03', '8166413bc92b4d182a6c6a10200a6e03', '184243', '2015-01-24 19:25:48', null, '0', null, null, '0', '1', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('20', 'hiowai', '陈晓惠', '19377cad7e64cb2f8973bc6375cd90b9', '19377cad7e64cb2f8973bc6375cd90b9', '279983', '2015-01-26 16:06:29', null, '0', null, '', '0', '1', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('21', 'liangyk', '梁蕴堃', '2ab3b6747e2fc244db36f8416a019eb3', '2ab3b6747e2fc244db36f8416a019eb3', '120634', '2015-01-28 09:14:45', 'liangyk', '0', null, '', '0', '1', '20150128', 'KH20150128094036595618', null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('22', 'zoe', '周淑贤', 'c2a7bf6ffe38c753fe23d48ed9d496b5', 'c2a7bf6ffe38c753fe23d48ed9d496b5', '792013', '2015-01-28 09:39:00', null, '0', null, '', '0', '1', '20150128', 'KH20150128094811330479', null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('23', '15089693925', '潘颖', 'fd877cf59be6a35cdc0e0caee485deb0', 'fd877cf59be6a35cdc0e0caee485deb0', '839317', '2015-01-28 09:41:07', null, '0', null, '', '0', '1', '20150128', 'KH20150128094707271702', null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('24', 'lichengxia', '李成霞', '4b0873071802129910a95c31c877dc96', '4b0873071802129910a95c31c877dc96', '563011', '2015-01-28 09:44:12', null, '0', null, '', '0', '1', '20150128', 'KH20150128095156607663', null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('25', '00', '宁玲', '6f3ff963a5acbfa8aa5a1a52921acc25', '6f3ff963a5acbfa8aa5a1a52921acc25', '230027', '2015-01-28 09:55:04', null, '0', null, null, '0', '1', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('26', 'Amy00', '宁永红', '6f3ff963a5acbfa8aa5a1a52921acc25', '6f3ff963a5acbfa8aa5a1a52921acc25', '479880', '2015-01-28 10:51:34', null, '0', null, '', '0', '1', '20150128', 'KH20150128105714551421', null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('27', 'me322@163.com', '廖捷', 'd778eb1c1c631bef6695f86a03d7c1be', 'd778eb1c1c631bef6695f86a03d7c1be', '679850', '2015-01-29 09:38:49', null, '0', null, '', '0', '1', '20150129', 'KH20150129094246813528', null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('28', 'soft123', '苟玉琳', '8fcba633cde7058d24349114bcfac123', '8fcba633cde7058d24349114bcfac123', '786478', '2015-01-29 14:40:08', null, '0', null, null, '0', '1', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('29', 'liqijia', '李齐家', '3ec6061ca1e0dc135e4e0af3fb352238', '3ec6061ca1e0dc135e4e0af3fb352238', '184561', '2015-02-02 15:05:42', null, '0', null, '', '0', '2', '20150203', 'KH20150203024132482052', null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('30', 'panshihao', '盘世豪', 'b5be656a7060dd3525027d6763c33ca0', 'b5be656a7060dd3525027d6763c33ca0', '434168', '2015-02-02 15:11:53', null, '0', null, null, '0', '1', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('31', '13580375452', '王剑峰', 'b6fd3d11a2e01947ce0908daf623850c', 'b6fd3d11a2e01947ce0908daf623850c', '871679', '2015-02-02 16:16:02', null, '0', null, '', '0', '1', '20150202', 'KH20150202042357901896', null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('32', '骑着鸵鸟去上班', null, 'c8768f68f90209dd9abec398f081aef1', 'c8768f68f90209dd9abec398f081aef1', '317347', '2015-02-03 15:35:52', null, '0', null, null, '0', '1', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('33', 'babym', null, '98efd2e334a298f67ff0e75a8d1058e4', '98efd2e334a298f67ff0e75a8d1058e4', '922811', '2015-02-03 15:42:06', null, '0', null, null, '0', '1', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('34', 'mmnn', '吴嘉琪', '13ad45f3faca03f2880f0f41d736c054', '13ad45f3faca03f2880f0f41d736c054', '566074', '2015-02-03 16:02:07', null, '0', null, '', '0', '1', '20150204', 'KH20150204030727552473', null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('35', '好韵', '刘伟', '969f58dbcbd31cf7bf874218b3140eaf', '969f58dbcbd31cf7bf874218b3140eaf', '261198', '2015-02-04 09:22:37', null, '0', null, '', '0', '1', '20150204', 'KH20150204092859881069', null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('36', '13620369840', '邵明', '196c18b83e7bfd8a50c6adc9e3032b5d', '196c18b83e7bfd8a50c6adc9e3032b5d', '550674', '2015-02-04 10:23:20', null, '0', null, null, '0', '1', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('37', '等等我的菜心', '邓凤仪', 'd584804dd821b80979450668a99574f1', 'd584804dd821b80979450668a99574f1', '524616', '2015-02-04 10:32:55', null, '0', null, '', '0', '1', '20150204', 'KH20150204114518204853', null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('38', 'chenjie2323', null, '55ad941f31503d04d865ed7fe4cc7f31', '55ad941f31503d04d865ed7fe4cc7f31', '534037', '2015-02-04 11:03:35', null, '0', null, null, '0', '1', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('39', '13425399507', '周少斌', '6f8c5e55f7a1fdf916765c5aa27f7b3d', '6f8c5e55f7a1fdf916765c5aa27f7b3d', '680194', '2015-02-04 12:18:51', null, '0', null, null, '0', '1', '20150204', 'KH20150204125906118941', null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('40', 'yu', '余金华', '64304130a6eae7564c5f8efa54af4776', '64304130a6eae7564c5f8efa54af4776', '510041', '2015-02-04 12:22:08', null, '0', null, null, '0', '1', '20150204', 'KH20150204122607447225', null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('41', 'wancan', '王灿', 'a0068ce02b7da9d1c9fd87f03b5b37b1', 'a0068ce02b7da9d1c9fd87f03b5b37b1', '455697', '2015-02-04 16:09:10', null, '0', null, '', '0', '1', '20150204', 'KH20150204041959140790', null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('42', '18820204809', '曾海云', '94fe5e60b762a9b400eb09a8db2e700c', '94fe5e60b762a9b400eb09a8db2e700c', '894842', '2015-02-06 11:47:52', null, '0', null, '', '0', '1', '20150206', 'KH20150206115045492639', null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('43', 'jasonwan', '陈海贤', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '611626', '2015-02-06 17:25:02', null, '0', null, null, '0', '1', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('44', 'hsqsoft', '黄绍清', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '841351', '2015-02-06 17:57:27', null, '0', null, '', '0', '1', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('45', 'ab', null, '0cfc1fbe4ef3df76aa95bdf9f8c81995', '0cfc1fbe4ef3df76aa95bdf9f8c81995', '658214', '2015-02-13 10:05:58', null, '0', null, null, '0', '1', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `userbasicsinfo` VALUES ('46', 'huangshaoqing', null, 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '616725', '2015-02-13 10:12:26', null, '0', null, null, '0', '1', null, null, null, null, null, null, null, '0', null, null);

-- ----------------------------
-- Table structure for `userfundinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userfundinfo`;
CREATE TABLE `userfundinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cashBalance` decimal(18,4) DEFAULT NULL COMMENT '可用余额',
  `bonusBalance` decimal(18,4) DEFAULT NULL COMMENT '奖金余额',
  `credit` decimal(18,4) DEFAULT NULL COMMENT '授信额度',
  `pIdentNo` varchar(50) DEFAULT NULL,
  `frost_balance` double DEFAULT NULL,
  `userbasic_id` bigint(20) DEFAULT NULL,
  `frozenAmtN` decimal(18,4) unsigned zerofill DEFAULT NULL,
  `money` decimal(18,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fund_id` (`id`) USING BTREE,
  UNIQUE KEY `userbasic_id` (`userbasic_id`) USING BTREE,
  KEY `FK20B88DBEF9F79EDF` (`userbasic_id`) USING BTREE,
  CONSTRAINT `userfundinfo_ibfk_1` FOREIGN KEY (`userbasic_id`) REFERENCES `userbasicsinfo` (`id`),
  CONSTRAINT `userfundinfo_ibfk_2` FOREIGN KEY (`id`) REFERENCES `userbasicsinfo` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='用户资金信息表; InnoDB free: 8192 kB; (`userbasic_id`; InnoDB free: 8192 kB; (`userbasi';

-- ----------------------------
-- Records of userfundinfo
-- ----------------------------
INSERT INTO `userfundinfo` VALUES ('1', '3273742.6700', '0.0000', '0.0000', '15875155098', null, null, '00000000000050.0000', '3273742.6700');
INSERT INTO `userfundinfo` VALUES ('2', '17977.0000', '0.0000', '0.0000', '15875155098', null, null, '00000000000000.0000', '17977.0000');
INSERT INTO `userfundinfo` VALUES ('3', '0.0000', '0.0000', '0.0000', '13527862661', null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('4', '0.0000', '0.0000', '0.0000', '13527862661', null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('5', '23753.0700', '0.0000', '0.0000', '13527862661', null, null, '00000000000000.0000', '23753.0700');
INSERT INTO `userfundinfo` VALUES ('6', '0.0000', '0.0000', '0.0000', '13527862661', null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('7', '37457.9200', '0.0000', '1000000.0000', '13527862661', null, null, '00000000000000.0000', '30944.0000');
INSERT INTO `userfundinfo` VALUES ('8', '0.0000', '0.0000', '0.0000', null, null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('9', '0.0000', '0.0000', '0.0000', null, null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('10', '0.0000', '0.0000', '0.0000', null, null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('11', '0.0000', '0.0000', '0.0000', null, null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('12', '0.0000', '0.0000', '0.0000', '13527862661', null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('13', '21.5000', '0.0000', '10000000.0000', '13826886985', null, null, '00000000000000.0000', '21.5000');
INSERT INTO `userfundinfo` VALUES ('14', '104.0500', '0.0000', '0.0000', '18924271835', null, null, '00000000000000.0000', '104.0500');
INSERT INTO `userfundinfo` VALUES ('15', '0.0000', '0.0000', '0.0000', '15875807588', null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('16', '102.7000', '0.0000', '100000.0000', '18319322106', null, null, '00000000000000.0000', '102.7000');
INSERT INTO `userfundinfo` VALUES ('17', '0.0000', '0.0000', '0.0000', null, null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('18', '0.0000', '0.0000', '0.0000', null, null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('19', '0.0000', '0.0000', '0.0000', null, null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('20', '0.0000', '0.0000', '0.0000', null, null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('21', '0.0000', '0.0000', '100000.0000', '15113695638', null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('22', '100.9000', '0.0000', '100000.0000', '18300172547', null, null, '00000000000000.0000', '100.9000');
INSERT INTO `userfundinfo` VALUES ('23', '100.4500', '0.0000', '100000.0000', '15089693925', null, null, '00000000000000.0000', '100.4500');
INSERT INTO `userfundinfo` VALUES ('24', '100.9000', '0.0000', '100000.0000', '13425390913', null, null, '00000000000000.0000', '100.9000');
INSERT INTO `userfundinfo` VALUES ('25', '0.0000', '0.0000', '0.0000', null, null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('26', '200.9000', '0.0000', '100000.0000', '15580822848', null, null, '00000000000000.0000', '200.9000');
INSERT INTO `userfundinfo` VALUES ('27', '0.0000', '0.0000', '0.0000', '15119841692', null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('28', '0.0000', '0.0000', '0.0000', null, null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('29', '0.0000', '0.0000', '1000000.0000', '13450160221', null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('30', '0.0000', '0.0000', '0.0000', null, null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('31', '0.0000', '0.0000', '0.0000', '13580375452', null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('32', '0.0000', '0.0000', '0.0000', null, null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('33', '0.0000', '0.0000', '0.0000', null, null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('34', '0.0000', '0.0000', '0.0000', '15602366881', null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('35', '0.0000', '0.0000', '0.0000', '18988635315', null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('36', '0.0000', '0.0000', '0.0000', null, null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('37', '0.0000', '0.0000', '0.0000', '15089680056', null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('38', '0.0000', '0.0000', '0.0000', null, null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('39', '0.0000', '0.0000', '0.0000', '13425399507', null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('40', '0.0000', '0.0000', '0.0000', '15813982529', null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('41', '200.0000', '0.0000', '0.0000', '13875835914', null, null, '00000000000000.0000', '200.0000');
INSERT INTO `userfundinfo` VALUES ('42', '0.0000', '0.0000', '0.0000', '18820204809', null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('43', '0.0000', '0.0000', '0.0000', null, null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('44', '4586.3200', '0.0000', '0.0000', '15507586703', null, null, '00000000000050.0000', '4586.3200');
INSERT INTO `userfundinfo` VALUES ('45', '0.0000', '0.0000', '0.0000', null, null, null, '00000000000000.0000', '0.0000');
INSERT INTO `userfundinfo` VALUES ('46', '0.0000', '0.0000', '0.0000', null, null, null, '00000000000000.0000', '0.0000');

-- ----------------------------
-- Table structure for `userloginlog`
-- ----------------------------
DROP TABLE IF EXISTS `userloginlog`;
CREATE TABLE `userloginlog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `logintime` varchar(50) DEFAULT NULL COMMENT '登录时间',
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP',
  `user_id` bigint(20) NOT NULL COMMENT '会员编号',
  `address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `userloginlog_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userbasicsinfo` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8 COMMENT='登录日志表; InnoDB free: 8192 kB; (`user_id`) REFER `tg; InnoDB free: 8192 kB; (`user';

-- ----------------------------
-- Records of userloginlog
-- ----------------------------
INSERT INTO `userloginlog` VALUES ('1', '2015-01-23 00:08:17', '127.0.0.1', '5', '未知');
INSERT INTO `userloginlog` VALUES ('2', '2015-01-23 01:30:07', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('3', '2015-01-23 02:19:32', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('4', '2015-01-23 08:32:42', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('5', '2015-01-23 08:53:42', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('6', '2015-01-23 08:59:54', '127.0.0.1', '2', '未知');
INSERT INTO `userloginlog` VALUES ('7', '2015-01-23 09:04:34', '127.0.0.1', '2', '未知');
INSERT INTO `userloginlog` VALUES ('8', '2015-01-23 10:11:08', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('9', '2015-01-23 10:11:35', '127.0.0.1', '2', '未知');
INSERT INTO `userloginlog` VALUES ('10', '2015-01-23 10:40:46', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('11', '2015-01-23 10:44:58', '127.0.0.1', '2', '未知');
INSERT INTO `userloginlog` VALUES ('12', '2015-01-23 11:36:35', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('13', '2015-01-23 11:47:29', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('14', '2015-01-23 11:51:51', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('15', '2015-01-23 11:52:44', '127.0.0.1', '2', '未知');
INSERT INTO `userloginlog` VALUES ('16', '2015-01-23 12:03:26', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('17', '2015-01-23 12:13:21', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('18', '2015-01-23 12:14:50', '127.0.0.1', '2', '未知');
INSERT INTO `userloginlog` VALUES ('19', '2015-01-23 18:35:18', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('20', '2015-01-23 18:36:07', '59.34.2.254', '14', '深圳市');
INSERT INTO `userloginlog` VALUES ('21', '2015-01-23 18:47:25', '59.34.2.254', '14', '深圳市');
INSERT INTO `userloginlog` VALUES ('22', '2015-01-23 18:49:43', '59.34.2.254', '14', '深圳市');
INSERT INTO `userloginlog` VALUES ('23', '2015-01-23 18:49:45', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('24', '2015-01-23 22:34:12', '59.34.2.254', '15', '深圳市');
INSERT INTO `userloginlog` VALUES ('25', '2015-01-24 14:21:04', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('26', '2015-01-24 14:22:55', '14.28.16.90', '16', '深圳市');
INSERT INTO `userloginlog` VALUES ('27', '2015-01-24 19:19:02', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('28', '2015-01-24 19:38:54', '163.125.117.6', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('29', '2015-01-24 19:41:08', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('30', '2015-01-24 19:41:57', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('31', '2015-01-24 19:44:56', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('32', '2015-01-24 23:08:02', '163.125.99.41', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('33', '2015-01-25 11:47:22', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('34', '2015-01-25 12:32:46', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('35', '2015-01-25 12:34:59', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('36', '2015-01-25 18:33:06', '14.153.242.78', '15', '深圳');
INSERT INTO `userloginlog` VALUES ('37', '2015-01-25 19:53:24', '163.125.242.27', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('38', '2015-01-26 01:38:36', '163.125.242.42', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('39', '2015-01-26 02:26:34', '163.125.240.252', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('40', '2015-01-26 03:35:50', '163.125.240.252', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('41', '2015-01-26 09:04:58', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('42', '2015-01-26 10:25:45', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('43', '2015-01-26 10:49:35', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('44', '2015-01-26 10:59:01', '59.34.2.254', '14', '深圳市');
INSERT INTO `userloginlog` VALUES ('45', '2015-01-26 10:59:20', '14.153.242.78', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('46', '2015-01-26 11:50:48', '14.153.242.78', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('47', '2015-01-26 11:56:04', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('48', '2015-01-26 11:56:14', '59.34.2.254', '14', '深圳市');
INSERT INTO `userloginlog` VALUES ('49', '2015-01-26 16:19:05', '14.153.242.78', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('50', '2015-01-26 16:19:13', '14.153.242.78', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('51', '2015-01-26 17:11:32', '14.153.242.78', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('52', '2015-01-26 19:05:16', '14.153.242.78', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('53', '2015-01-26 19:25:35', '14.153.242.78', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('54', '2015-01-26 20:04:12', '14.153.242.78', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('55', '2015-01-27 09:56:31', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('56', '2015-01-27 11:48:16', '14.153.242.226', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('57', '2015-01-27 12:08:25', '14.153.242.226', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('58', '2015-01-27 12:11:38', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('59', '2015-01-27 12:29:24', '59.34.2.254', '14', '深圳市');
INSERT INTO `userloginlog` VALUES ('60', '2015-01-27 13:40:09', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('61', '2015-01-27 14:04:07', '14.153.242.226', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('62', '2015-01-27 14:09:42', '59.34.2.254', '14', '深圳市');
INSERT INTO `userloginlog` VALUES ('63', '2015-01-27 14:22:09', '59.34.2.254', '14', '深圳市');
INSERT INTO `userloginlog` VALUES ('64', '2015-01-27 15:34:04', '59.34.2.254', '14', '深圳市');
INSERT INTO `userloginlog` VALUES ('65', '2015-01-27 16:59:32', '121.10.238.94', '20', '深圳市');
INSERT INTO `userloginlog` VALUES ('66', '2015-01-27 17:08:43', '14.153.242.226', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('67', '2015-01-27 17:52:38', '59.34.2.254', '14', '深圳市');
INSERT INTO `userloginlog` VALUES ('68', '2015-01-27 18:20:56', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('69', '2015-01-28 09:08:01', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('70', '2015-01-28 09:34:59', '59.34.2.254', '16', '深圳市');
INSERT INTO `userloginlog` VALUES ('71', '2015-01-28 10:06:06', '59.34.2.254', '14', '深圳市');
INSERT INTO `userloginlog` VALUES ('72', '2015-01-28 10:06:35', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('73', '2015-01-28 10:45:53', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('74', '2015-01-28 10:50:09', '59.34.2.254', '14', '深圳市');
INSERT INTO `userloginlog` VALUES ('75', '2015-01-28 11:11:05', '59.34.2.254', '23', '深圳市');
INSERT INTO `userloginlog` VALUES ('76', '2015-01-28 14:58:12', '59.34.2.254', '16', '深圳市');
INSERT INTO `userloginlog` VALUES ('77', '2015-01-28 14:58:14', '59.34.2.254', '23', '深圳市');
INSERT INTO `userloginlog` VALUES ('78', '2015-01-28 14:58:33', '59.34.2.254', '26', '深圳市');
INSERT INTO `userloginlog` VALUES ('79', '2015-01-28 14:59:11', '59.34.2.254', '22', '深圳市');
INSERT INTO `userloginlog` VALUES ('80', '2015-01-28 14:59:26', '59.34.2.254', '24', '深圳市');
INSERT INTO `userloginlog` VALUES ('81', '2015-01-28 15:08:56', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('82', '2015-01-28 15:23:05', '59.34.2.254', '21', '深圳市');
INSERT INTO `userloginlog` VALUES ('83', '2015-01-28 15:40:41', '14.153.242.226', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('84', '2015-01-28 15:50:10', '59.34.2.254', '15', '深圳市');
INSERT INTO `userloginlog` VALUES ('85', '2015-01-28 16:18:56', '59.34.2.254', '22', '深圳市');
INSERT INTO `userloginlog` VALUES ('86', '2015-01-28 16:19:03', '59.34.2.254', '24', '深圳市');
INSERT INTO `userloginlog` VALUES ('87', '2015-01-28 16:19:15', '59.34.2.254', '16', '深圳市');
INSERT INTO `userloginlog` VALUES ('88', '2015-01-28 16:25:29', '59.34.2.254', '23', '深圳市');
INSERT INTO `userloginlog` VALUES ('89', '2015-01-28 17:11:57', '59.34.2.254', '22', '深圳市');
INSERT INTO `userloginlog` VALUES ('90', '2015-01-29 09:22:54', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('91', '2015-01-29 09:40:32', '59.34.2.254', '14', '深圳市');
INSERT INTO `userloginlog` VALUES ('92', '2015-01-29 09:45:24', '59.34.2.254', '14', '深圳市');
INSERT INTO `userloginlog` VALUES ('93', '2015-01-29 10:26:52', '120.198.147.211', '27', '深圳市');
INSERT INTO `userloginlog` VALUES ('94', '2015-01-29 10:27:06', '120.198.147.211', '27', '深圳市');
INSERT INTO `userloginlog` VALUES ('95', '2015-01-29 10:27:32', '120.198.147.211', '27', '深圳市');
INSERT INTO `userloginlog` VALUES ('96', '2015-01-29 14:13:23', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('97', '2015-01-29 16:35:28', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('98', '2015-01-29 16:35:49', '14.153.240.255', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('99', '2015-01-29 16:57:12', '10.155.48.220', '16', '未知');
INSERT INTO `userloginlog` VALUES ('100', '2015-01-29 16:58:18', '59.34.2.254', '24', '深圳市');
INSERT INTO `userloginlog` VALUES ('101', '2015-01-29 16:58:49', '59.34.2.254', '22', '深圳市');
INSERT INTO `userloginlog` VALUES ('102', '2015-01-29 16:59:53', '59.34.2.254', '26', '深圳市');
INSERT INTO `userloginlog` VALUES ('103', '2015-01-29 17:05:46', '59.34.2.254', '14', '深圳市');
INSERT INTO `userloginlog` VALUES ('104', '2015-01-29 17:15:42', '10.155.48.220', '16', '未知');
INSERT INTO `userloginlog` VALUES ('105', '2015-01-29 17:34:18', '59.34.2.254', '26', '深圳市');
INSERT INTO `userloginlog` VALUES ('106', '2015-01-30 08:36:21', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('107', '2015-01-30 10:36:55', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('108', '2015-01-30 11:35:21', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('109', '2015-01-30 11:37:26', '59.34.2.254', '14', '深圳市');
INSERT INTO `userloginlog` VALUES ('110', '2015-01-30 11:39:39', '59.34.2.254', '16', '深圳市');
INSERT INTO `userloginlog` VALUES ('111', '2015-01-30 14:24:24', '59.34.2.254', '14', '深圳市');
INSERT INTO `userloginlog` VALUES ('112', '2015-01-30 15:06:02', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('113', '2015-01-30 15:10:08', '59.34.2.254', '16', '深圳市');
INSERT INTO `userloginlog` VALUES ('114', '2015-01-30 15:10:33', '59.34.2.254', '22', '深圳市');
INSERT INTO `userloginlog` VALUES ('115', '2015-01-30 15:10:33', '59.34.2.254', '24', '深圳市');
INSERT INTO `userloginlog` VALUES ('116', '2015-01-30 15:10:52', '59.34.2.254', '26', '深圳市');
INSERT INTO `userloginlog` VALUES ('117', '2015-01-30 15:46:29', '59.34.2.254', '26', '深圳市');
INSERT INTO `userloginlog` VALUES ('118', '2015-01-31 15:00:13', '183.38.0.60', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('119', '2015-01-31 15:05:26', '183.38.0.60', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('120', '2015-02-02 11:20:27', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('121', '2015-02-02 12:47:29', '183.14.159.158', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('122', '2015-02-02 15:24:40', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('123', '2015-02-02 16:24:19', '27.46.137.14', '31', '广州');
INSERT INTO `userloginlog` VALUES ('124', '2015-02-02 16:48:43', '59.34.2.254', '22', '深圳市');
INSERT INTO `userloginlog` VALUES ('125', '2015-02-02 19:20:45', '113.95.157.211', '16', '深圳市');
INSERT INTO `userloginlog` VALUES ('126', '2015-02-03 09:21:41', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('127', '2015-02-03 09:53:36', '59.34.2.254', '16', '深圳市');
INSERT INTO `userloginlog` VALUES ('128', '2015-02-03 10:20:12', '59.34.2.254', '24', '深圳市');
INSERT INTO `userloginlog` VALUES ('129', '2015-02-03 10:22:21', '59.34.2.254', '26', '深圳市');
INSERT INTO `userloginlog` VALUES ('130', '2015-02-03 10:26:23', '59.34.2.254', '14', '深圳市');
INSERT INTO `userloginlog` VALUES ('131', '2015-02-03 10:28:40', '14.153.241.96', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('132', '2015-02-03 10:35:40', '59.34.2.254', '21', '深圳市');
INSERT INTO `userloginlog` VALUES ('133', '2015-02-03 13:16:52', '27.46.137.156', '31', '广州');
INSERT INTO `userloginlog` VALUES ('134', '2015-02-03 13:25:33', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('135', '2015-02-03 14:05:02', '59.34.2.254', '29', '深圳市');
INSERT INTO `userloginlog` VALUES ('136', '2015-02-03 14:59:08', '183.233.152.70', '29', '深圳市');
INSERT INTO `userloginlog` VALUES ('137', '2015-02-03 15:06:25', '59.34.2.254', '14', '深圳市');
INSERT INTO `userloginlog` VALUES ('138', '2015-02-03 15:07:41', '119.125.233.118', '27', '深圳市');
INSERT INTO `userloginlog` VALUES ('139', '2015-02-03 15:08:50', '59.34.2.254', '29', '深圳市');
INSERT INTO `userloginlog` VALUES ('140', '2015-02-03 15:41:24', '59.34.2.254', '29', '深圳市');
INSERT INTO `userloginlog` VALUES ('141', '2015-02-03 17:28:24', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('142', '2015-02-03 17:37:37', '59.34.2.254', '24', '深圳市');
INSERT INTO `userloginlog` VALUES ('143', '2015-02-03 17:37:43', '59.34.2.254', '16', '深圳市');
INSERT INTO `userloginlog` VALUES ('144', '2015-02-03 17:38:57', '120.198.147.211', '27', '深圳市');
INSERT INTO `userloginlog` VALUES ('145', '2015-02-03 17:39:41', '59.34.2.254', '22', '深圳市');
INSERT INTO `userloginlog` VALUES ('146', '2015-02-03 17:40:42', '59.34.2.254', '21', '深圳市');
INSERT INTO `userloginlog` VALUES ('147', '2015-02-03 17:43:32', '59.34.2.254', '24', '深圳市');
INSERT INTO `userloginlog` VALUES ('148', '2015-02-04 09:10:39', '59.34.2.254', '22', '深圳市');
INSERT INTO `userloginlog` VALUES ('149', '2015-02-04 09:51:31', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('150', '2015-02-04 09:53:36', '121.10.238.94', '20', '深圳市');
INSERT INTO `userloginlog` VALUES ('151', '2015-02-04 10:11:18', '59.34.2.254', '26', '深圳市');
INSERT INTO `userloginlog` VALUES ('152', '2015-02-04 10:19:00', '59.34.2.254', '23', '深圳市');
INSERT INTO `userloginlog` VALUES ('153', '2015-02-04 10:26:10', '59.34.2.254', '24', '深圳市');
INSERT INTO `userloginlog` VALUES ('154', '2015-02-04 10:40:41', '14.153.246.109', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('155', '2015-02-04 10:41:15', '27.46.137.98', '31', '广州');
INSERT INTO `userloginlog` VALUES ('156', '2015-02-04 10:45:32', '59.34.2.254', '21', '深圳市');
INSERT INTO `userloginlog` VALUES ('157', '2015-02-04 11:21:22', '119.145.134.16', '35', '佛山');
INSERT INTO `userloginlog` VALUES ('158', '2015-02-04 11:22:29', '59.34.2.254', '24', '深圳市');
INSERT INTO `userloginlog` VALUES ('159', '2015-02-04 11:36:52', '59.34.2.254', '37', '深圳市');
INSERT INTO `userloginlog` VALUES ('160', '2015-02-04 14:46:33', '124.42.194.5', '34', '深圳');
INSERT INTO `userloginlog` VALUES ('161', '2015-02-04 14:48:53', '59.34.2.254', '24', '深圳市');
INSERT INTO `userloginlog` VALUES ('162', '2015-02-04 14:49:39', '113.85.221.89', '34', '深圳市');
INSERT INTO `userloginlog` VALUES ('163', '2015-02-04 14:56:42', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('164', '2015-02-04 15:17:04', '58.135.67.204', '34', '北京');
INSERT INTO `userloginlog` VALUES ('165', '2015-02-04 15:23:25', '58.135.67.204', '34', '北京');
INSERT INTO `userloginlog` VALUES ('166', '2015-02-04 15:28:56', '120.198.147.211', '27', '深圳市');
INSERT INTO `userloginlog` VALUES ('167', '2015-02-04 15:39:03', '112.90.239.193', '34', '广州');
INSERT INTO `userloginlog` VALUES ('168', '2015-02-04 15:39:57', '112.90.239.193', '34', '广州');
INSERT INTO `userloginlog` VALUES ('169', '2015-02-04 15:44:47', '120.198.147.211', '27', '深圳市');
INSERT INTO `userloginlog` VALUES ('170', '2015-02-04 15:44:59', '120.198.147.211', '27', '深圳市');
INSERT INTO `userloginlog` VALUES ('171', '2015-02-04 15:49:15', '59.34.2.254', '26', '深圳市');
INSERT INTO `userloginlog` VALUES ('172', '2015-02-04 15:53:42', '59.34.2.254', '16', '深圳市');
INSERT INTO `userloginlog` VALUES ('173', '2015-02-04 16:02:24', '59.34.2.254', '16', '深圳市');
INSERT INTO `userloginlog` VALUES ('174', '2015-02-04 16:08:22', '121.10.238.94', '20', '深圳市');
INSERT INTO `userloginlog` VALUES ('175', '2015-02-05 05:02:15', '163.125.147.20', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('176', '2015-02-05 05:18:23', '163.125.147.20', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('177', '2015-02-05 09:03:58', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('178', '2015-02-05 09:17:35', '59.34.2.254', '24', '深圳市');
INSERT INTO `userloginlog` VALUES ('179', '2015-02-05 09:26:45', '59.34.2.254', '22', '深圳市');
INSERT INTO `userloginlog` VALUES ('180', '2015-02-05 09:32:35', '59.34.2.254', '16', '深圳市');
INSERT INTO `userloginlog` VALUES ('181', '2015-02-05 09:55:48', '59.34.2.254', '22', '深圳市');
INSERT INTO `userloginlog` VALUES ('182', '2015-02-05 11:53:45', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('183', '2015-02-05 14:32:35', '59.34.2.254', '16', '深圳市');
INSERT INTO `userloginlog` VALUES ('184', '2015-02-05 15:38:45', '59.34.2.254', '22', '深圳市');
INSERT INTO `userloginlog` VALUES ('185', '2015-02-05 15:44:27', '59.34.2.254', '24', '深圳市');
INSERT INTO `userloginlog` VALUES ('186', '2015-02-05 16:21:56', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('187', '2015-02-05 16:41:08', '59.34.2.254', '26', '深圳市');
INSERT INTO `userloginlog` VALUES ('188', '2015-02-05 17:27:28', '59.34.2.254', '24', '深圳市');
INSERT INTO `userloginlog` VALUES ('189', '2015-02-05 19:16:28', '14.29.113.4', '26', '成都');
INSERT INTO `userloginlog` VALUES ('190', '2015-02-06 06:14:01', '58.251.171.26', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('191', '2015-02-06 06:34:54', '58.251.171.26', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('192', '2015-02-06 06:36:01', '58.251.171.26', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('193', '2015-02-06 09:09:31', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('194', '2015-02-06 09:46:24', '59.34.2.254', '21', '深圳市');
INSERT INTO `userloginlog` VALUES ('195', '2015-02-06 09:54:03', '119.145.134.16', '35', '佛山');
INSERT INTO `userloginlog` VALUES ('196', '2015-02-06 10:14:34', '59.34.2.254', '16', '深圳市');
INSERT INTO `userloginlog` VALUES ('197', '2015-02-06 10:40:16', '59.34.2.254', '24', '深圳市');
INSERT INTO `userloginlog` VALUES ('198', '2015-02-06 10:54:05', '59.34.2.254', '21', '深圳市');
INSERT INTO `userloginlog` VALUES ('199', '2015-02-06 11:28:05', '59.34.2.254', '16', '深圳市');
INSERT INTO `userloginlog` VALUES ('200', '2015-02-06 11:58:43', '59.34.2.254', '41', '深圳市');
INSERT INTO `userloginlog` VALUES ('201', '2015-02-06 13:47:53', '14.153.246.205', '42', '深圳');
INSERT INTO `userloginlog` VALUES ('202', '2015-02-06 14:01:52', '14.153.246.205', '42', '深圳');
INSERT INTO `userloginlog` VALUES ('203', '2015-02-06 14:08:51', '120.198.147.211', '27', '深圳市');
INSERT INTO `userloginlog` VALUES ('204', '2015-02-06 14:12:46', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('205', '2015-02-06 14:20:34', '14.153.246.205', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('206', '2015-02-06 14:24:10', '120.198.147.211', '27', '深圳市');
INSERT INTO `userloginlog` VALUES ('207', '2015-02-06 14:49:51', '14.153.246.205', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('208', '2015-02-06 17:23:53', '14.153.246.205', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('209', '2015-02-06 17:24:27', '59.34.2.254', '13', '深圳市');
INSERT INTO `userloginlog` VALUES ('210', '2015-02-06 17:25:35', '59.34.2.254', '14', '深圳市');
INSERT INTO `userloginlog` VALUES ('211', '2015-02-09 10:54:53', '127.0.0.1', '1', '未知');
INSERT INTO `userloginlog` VALUES ('212', '2015-02-10 18:03:59', '127.0.0.1', '1', '未知');
INSERT INTO `userloginlog` VALUES ('213', '2015-02-10 18:04:11', '127.0.0.1', '1', '未知');
INSERT INTO `userloginlog` VALUES ('214', '2015-02-10 18:36:12', '127.0.0.1', '1', '未知');
INSERT INTO `userloginlog` VALUES ('215', '2015-02-10 18:40:02', '127.0.0.1', '1', '未知');
INSERT INTO `userloginlog` VALUES ('216', '2015-02-11 16:11:36', '14.153.244.163', '1', '深圳');
INSERT INTO `userloginlog` VALUES ('217', '2015-02-11 18:22:33', '14.153.244.163', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('218', '2015-02-12 14:24:45', '61.152.127.18', '7', '上海');
INSERT INTO `userloginlog` VALUES ('219', '2015-02-12 14:59:41', '61.152.127.18', '7', '上海');
INSERT INTO `userloginlog` VALUES ('220', '2015-02-12 15:02:30', '61.152.127.18', '7', '上海');
INSERT INTO `userloginlog` VALUES ('221', '2015-02-12 15:04:35', '14.153.244.163', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('222', '2015-02-12 19:06:40', '14.153.244.163', '1', '深圳');
INSERT INTO `userloginlog` VALUES ('223', '2015-02-13 12:07:29', '14.153.240.128', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('224', '2015-02-16 12:28:36', '14.153.94.3', '7', '深圳');
INSERT INTO `userloginlog` VALUES ('225', '2015-02-17 18:40:25', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('226', '2015-02-17 18:58:43', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('227', '2015-02-17 18:58:52', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('228', '2015-02-17 19:11:02', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('229', '2015-02-25 13:51:51', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('230', '2015-02-25 14:33:13', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('231', '2015-02-25 14:33:39', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('232', '2015-02-25 15:03:44', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('233', '2015-02-25 15:16:17', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('234', '2015-02-25 15:27:37', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('235', '2015-02-25 16:16:23', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('236', '2015-02-25 16:55:14', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('237', '2015-02-26 11:09:13', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('238', '2015-02-26 11:50:29', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('239', '2015-02-26 11:58:38', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('240', '2015-02-26 16:24:27', '127.0.0.1', '44', '未知');
INSERT INTO `userloginlog` VALUES ('241', '2015-02-26 17:09:17', '127.0.0.1', '44', '未知');
INSERT INTO `userloginlog` VALUES ('242', '2015-02-26 17:16:21', '127.0.0.1', '44', '未知');
INSERT INTO `userloginlog` VALUES ('243', '2015-02-26 17:18:58', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('244', '2015-02-26 17:19:20', '127.0.0.1', '44', '未知');
INSERT INTO `userloginlog` VALUES ('245', '2015-02-26 17:22:01', '127.0.0.1', '44', '未知');
INSERT INTO `userloginlog` VALUES ('246', '2015-02-26 17:26:51', '127.0.0.1', '44', '未知');
INSERT INTO `userloginlog` VALUES ('247', '2015-02-26 17:31:36', '127.0.0.1', '44', '未知');
INSERT INTO `userloginlog` VALUES ('248', '2015-02-26 17:32:02', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('249', '2015-02-26 18:37:07', '127.0.0.1', '44', '未知');
INSERT INTO `userloginlog` VALUES ('250', '2015-02-26 18:58:19', '127.0.0.1', '1', '未知');
INSERT INTO `userloginlog` VALUES ('251', '2015-02-26 18:59:38', '127.0.0.1', '7', '未知');
INSERT INTO `userloginlog` VALUES ('252', '2015-02-26 19:01:21', '127.0.0.1', '44', '未知');
INSERT INTO `userloginlog` VALUES ('253', '2015-02-26 19:02:17', '127.0.0.1', '1', '未知');
INSERT INTO `userloginlog` VALUES ('254', '2015-02-26 19:15:31', '127.0.0.1', '44', '未知');
INSERT INTO `userloginlog` VALUES ('255', '2015-02-26 19:26:42', '127.0.0.1', '44', '未知');
INSERT INTO `userloginlog` VALUES ('256', '2015-02-26 19:29:40', '127.0.0.1', '44', '未知');
INSERT INTO `userloginlog` VALUES ('257', '2015-02-27 11:03:01', '127.0.0.1', '44', '未知');
INSERT INTO `userloginlog` VALUES ('258', '2015-02-27 13:58:37', '127.0.0.1', '44', '未知');
INSERT INTO `userloginlog` VALUES ('259', '2015-02-27 14:14:24', '127.0.0.1', '44', '未知');
INSERT INTO `userloginlog` VALUES ('260', '2015-02-27 14:20:39', '127.0.0.1', '44', '未知');
INSERT INTO `userloginlog` VALUES ('261', '2015-02-27 14:44:11', '127.0.0.1', '44', '未知');

-- ----------------------------
-- Table structure for `usermessage`
-- ----------------------------
DROP TABLE IF EXISTS `usermessage`;
CREATE TABLE `usermessage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context` varchar(300) DEFAULT NULL COMMENT '发送内容',
  `isread` int(1) DEFAULT NULL COMMENT '是否已读（0未读 1已读）',
  `receivetime` varchar(30) DEFAULT NULL COMMENT '发送时间',
  `title` varchar(256) DEFAULT NULL COMMENT '标题',
  `user_id` bigint(20) DEFAULT NULL COMMENT '接收人',
  PRIMARY KEY (`id`),
  KEY `FKC3B449DC892F9557` (`user_id`) USING BTREE,
  CONSTRAINT `usermessage_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userbasicsinfo` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='用户站内消息表; InnoDB free: 8192 kB; (`user_id`) REF; InnoDB free: 8192 kB; (`user_id`';

-- ----------------------------
-- Records of usermessage
-- ----------------------------
INSERT INTO `usermessage` VALUES ('1', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:zemei 手机号是:15875155098', '0', '2015-01-22 22:53:12', '注册成功', '1');
INSERT INTO `usermessage` VALUES ('2', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:zemei1 手机号是:15875155098', '0', '2015-01-22 22:59:31', '注册成功', '2');
INSERT INTO `usermessage` VALUES ('3', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:guo111 手机号是:13527862661', '0', '2015-01-22 23:54:38', '注册成功', '3');
INSERT INTO `usermessage` VALUES ('4', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:guo222 手机号是:13527862661', '0', '2015-01-22 23:58:41', '注册成功', '4');
INSERT INTO `usermessage` VALUES ('5', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:guo333 手机号是:13527862661', '0', '2015-01-23 00:02:15', '注册成功', '5');
INSERT INTO `usermessage` VALUES ('6', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:guo444 手机号是:13527862661', '0', '2015-01-23 00:27:14', '注册成功', '6');
INSERT INTO `usermessage` VALUES ('7', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:guo555 手机号是:13527862661', '0', '2015-01-23 00:33:43', '注册成功', '7');
INSERT INTO `usermessage` VALUES ('8', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:8 手机号是:13527862661', '0', '2015-01-23 18:26:21', '注册成功', '8');
INSERT INTO `usermessage` VALUES ('9', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:9 手机号是:13527862661', '0', '2015-01-23 18:26:48', '注册成功', '9');
INSERT INTO `usermessage` VALUES ('10', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:10 手机号是:13527862661', '0', '2015-01-23 18:27:16', '注册成功', '10');
INSERT INTO `usermessage` VALUES ('11', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:11 手机号是:13527862661', '0', '2015-01-23 18:28:03', '注册成功', '11');
INSERT INTO `usermessage` VALUES ('12', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:12 手机号是:13527862661', '0', '2015-01-23 18:29:10', '注册成功', '12');
INSERT INTO `usermessage` VALUES ('13', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:sodagreen28 手机号是:13826886985', '0', '2015-01-23 18:32:40', '注册成功', '13');
INSERT INTO `usermessage` VALUES ('14', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:lmjgkd92 手机号是:18924271835', '1', '2015-01-23 18:32:48', '注册成功', '14');
INSERT INTO `usermessage` VALUES ('15', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:daodaodao 手机号是:15875807588', '1', '2015-01-23 22:06:31', '注册成功', '15');
INSERT INTO `usermessage` VALUES ('16', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:baby 手机号是:18319322106', '1', '2015-01-24 14:15:15', '注册成功', '16');
INSERT INTO `usermessage` VALUES ('17', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:sodagreen1 手机号是:13826886985', '0', '2015-01-24 14:16:34', '注册成功', '17');
INSERT INTO `usermessage` VALUES ('18', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:sodagreen2 手机号是:13826886985', '0', '2015-01-24 14:17:19', '注册成功', '18');
INSERT INTO `usermessage` VALUES ('19', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:sodagreen3 手机号是:13826886985', '0', '2015-01-24 19:25:48', '注册成功', '19');
INSERT INTO `usermessage` VALUES ('20', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:hiowai 手机号是:13560938732', '1', '2015-01-26 16:06:29', '注册成功', '20');
INSERT INTO `usermessage` VALUES ('21', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:liangyk 手机号是:15113695638', '1', '2015-01-28 09:14:45', '注册成功', '21');
INSERT INTO `usermessage` VALUES ('22', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:zoe 手机号是:18300172547', '1', '2015-01-28 09:39:00', '注册成功', '22');
INSERT INTO `usermessage` VALUES ('23', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:15089693925 手机号是:15089693925', '1', '2015-01-28 09:41:07', '注册成功', '23');
INSERT INTO `usermessage` VALUES ('24', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:lichengxia 手机号是:13425390913', '1', '2015-01-28 09:44:12', '注册成功', '24');
INSERT INTO `usermessage` VALUES ('25', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:00 手机号是:15580822848', '0', '2015-01-28 09:55:04', '注册成功', '25');
INSERT INTO `usermessage` VALUES ('26', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:Amy00 手机号是:15580822848', '1', '2015-01-28 10:51:34', '注册成功', '26');
INSERT INTO `usermessage` VALUES ('27', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:me322@163.com 手机号是:15119841692', '1', '2015-01-29 09:38:49', '注册成功', '27');
INSERT INTO `usermessage` VALUES ('28', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:soft123 手机号是:13281863467', '0', '2015-01-29 14:40:08', '注册成功', '28');
INSERT INTO `usermessage` VALUES ('29', '尊敬的客户：您好，标号为测试一人投标流标情况，已经结束，请您留意。【太平洋理财】', '0', '2015-01-30 14:51:09', '标的结束', '13');
INSERT INTO `usermessage` VALUES ('30', '尊敬的客户：您好，标号为测试多人投标流标情况，已经结束，请您留意。【太平洋理财】', '0', '2015-01-30 15:00:27', '标的结束', '13');
INSERT INTO `usermessage` VALUES ('31', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:liqijia 手机号是:13450160221', '0', '2015-02-02 15:05:42', '注册成功', '29');
INSERT INTO `usermessage` VALUES ('32', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:panshihao 手机号是:13583613758', '0', '2015-02-02 15:11:53', '注册成功', '30');
INSERT INTO `usermessage` VALUES ('33', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:13580375452 手机号是:13580375452', '0', '2015-02-02 16:16:02', '注册成功', '31');
INSERT INTO `usermessage` VALUES ('34', '尊敬的客户：您好，标号为测试一人投标流标情况，已经结束，请您留意。【太平洋理财】', '0', '2015-02-03 12:08:35', '标的结束', '13');
INSERT INTO `usermessage` VALUES ('35', '尊敬的客户：您好，标号为测试多人投标流标情况，已经结束，请您留意。【太平洋理财】', '0', '2015-02-03 12:08:44', '标的结束', '13');
INSERT INTO `usermessage` VALUES ('36', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:骑着鸵鸟去上班 手机号是:15367948200', '0', '2015-02-03 15:35:52', '注册成功', '32');
INSERT INTO `usermessage` VALUES ('37', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:babym 手机号是:18718704602', '0', '2015-02-03 15:42:06', '注册成功', '33');
INSERT INTO `usermessage` VALUES ('38', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:mmnn 手机号是:15602366881', '0', '2015-02-03 16:02:07', '注册成功', '34');
INSERT INTO `usermessage` VALUES ('39', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:好韵 手机号是:18988635315', '0', '2015-02-04 09:22:37', '注册成功', '35');
INSERT INTO `usermessage` VALUES ('40', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:13620369840 手机号是:13620369840', '0', '2015-02-04 10:23:20', '注册成功', '36');
INSERT INTO `usermessage` VALUES ('41', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:等等我的菜心 手机号是:15089680056', '1', '2015-02-04 10:32:55', '注册成功', '37');
INSERT INTO `usermessage` VALUES ('42', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:chenjie2323 手机号是:13560933730', '0', '2015-02-04 11:03:35', '注册成功', '38');
INSERT INTO `usermessage` VALUES ('43', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:13425399507 手机号是:13425399507', '0', '2015-02-04 12:18:51', '注册成功', '39');
INSERT INTO `usermessage` VALUES ('44', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:yu 手机号是:15813982529', '0', '2015-02-04 12:22:08', '注册成功', '40');
INSERT INTO `usermessage` VALUES ('45', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:wancan 手机号是:13875835914', '1', '2015-02-04 16:09:10', '注册成功', '41');
INSERT INTO `usermessage` VALUES ('46', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:18820204809 手机号是:18820204809', '0', '2015-02-06 11:47:52', '注册成功', '42');
INSERT INTO `usermessage` VALUES ('47', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:jasonwan 手机号是:15112393726', '0', '2015-02-06 17:25:02', '注册成功', '43');
INSERT INTO `usermessage` VALUES ('48', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:hsqsoft 手机号是:15507586703', '0', '2015-02-06 17:57:27', '注册成功', '44');
INSERT INTO `usermessage` VALUES ('49', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:ab 手机号是:18565612860', '0', '2015-02-13 10:05:58', '注册成功', '45');
INSERT INTO `usermessage` VALUES ('50', '恭喜您成功注册成为太平洋理财的用户！您的注册帐户是:huangshaoqing 手机号是:15507586703', '0', '2015-02-13 10:12:26', '注册成功', '46');

-- ----------------------------
-- Table structure for `userrelationinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userrelationinfo`;
CREATE TABLE `userrelationinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '关联用户资金信息表',
  `adminuser_id` bigint(20) DEFAULT NULL COMMENT '客服',
  `companyName` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `business` varchar(255) DEFAULT NULL COMMENT '主要业务',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `cardId` varchar(50) DEFAULT NULL COMMENT '身份证号码',
  `imgUrl` varchar(255) DEFAULT NULL COMMENT '个人头像路径',
  `emailisPass` int(2) DEFAULT NULL COMMENT '邮箱是否通过验证 1通过 0不通过',
  `cardImg` varchar(255) DEFAULT NULL COMMENT '身份证扫描件路径',
  `qqNum` varchar(255) DEFAULT NULL COMMENT 'qq号码',
  `birth_day` varchar(15) DEFAULT NULL,
  `industry` varchar(30) DEFAULT NULL,
  `institutions` varchar(30) DEFAULT NULL,
  `post` varchar(20) DEFAULT NULL,
  `scale` varchar(30) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `ncome` varchar(20) DEFAULT NULL,
  `marriage` varchar(10) DEFAULT NULL,
  `newaddress` varchar(30) DEFAULT NULL,
  `qualifications` varchar(20) DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL,
  `recommend` varchar(20) DEFAULT NULL COMMENT '推荐人',
  PRIMARY KEY (`id`),
  KEY `adminuser_id` (`adminuser_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `userrelationinfo_ibfk_1` FOREIGN KEY (`adminuser_id`) REFERENCES `adminuser` (`id`),
  CONSTRAINT `userrelationinfo_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `userbasicsinfo` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='用户关联信息表; InnoDB free: 8192 kB; (`adminuser_id`; InnoDB free: 8192 kB; (`adminuse';

-- ----------------------------
-- Records of userrelationinfo
-- ----------------------------
INSERT INTO `userrelationinfo` VALUES ('1', '1', null, null, null, '15875155099', 'guotufu@126.com', '440982198610302092', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('2', '2', '17', null, null, '15875155098', 'guotufu@126.com', '431381198109106573', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('3', '3', null, null, null, '13527862663', 'guotufu@126.com', '431381197903117478', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('4', '4', null, null, null, '13527862664', 'guotufu@126.com', '431381197903117478', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('5', '5', null, null, null, '13527862662', 'guotufu@126.com', '431381197903117478', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('6', '6', null, null, null, '13527862662', 'guotufu@126.com', '431381197903117478', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('7', '7', null, null, null, '13527862661', 'guotufu@126.com', '431381197903117478', 'http://localhost:8080/resources/images/img/user5.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('8', '8', null, null, null, null, null, null, '/resources/images/headimg.jpg', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('9', '9', null, null, null, null, null, null, '/resources/images/headimg.jpg', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('10', '10', null, null, null, null, null, null, '/resources/images/headimg.jpg', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('11', '11', null, null, null, null, null, null, '/resources/images/headimg.jpg', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('12', '12', null, null, null, '13527862661', 'guotufu@126.com', '440982198610302092', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('13', '13', null, null, null, '13826886985', '13826886985@139.com', '441284198604193411', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('14', '14', null, null, null, '18924271835', '524486162@qq.com', '440981199205310417', 'http://www.cdbdai.com:80/resources/images/img/user5.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('15', '15', null, null, null, '15875807588', 'cdbdai@qq.com', '430381198109035014', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('16', '16', null, null, null, '18319322106', '70857857@qq.com', '441284199503164720', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('17', '17', null, null, null, null, null, null, '/resources/images/headimg.jpg', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('18', '18', null, null, null, '13826886987', '13826886985@139.com', '441284198604193411', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('19', '19', null, null, null, '13826886985', '13826886985@139.com', null, '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('20', '20', null, null, null, '13560938732', 'hiowai@vip.qq.com', '44080219840619041X', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '猫姐');
INSERT INTO `userrelationinfo` VALUES ('21', '21', null, null, null, '15113695638', '965927512@qq.com', '440802198303221922', 'http://www.cdbdai.com:80/upload/user/20150128091654.jpg', '1', null, null, '1983-03-22', '金融', '广州大学', '行政', '50以下', '女', '5000以下', '已婚', '榕园', '大专或本科', null, '');
INSERT INTO `userrelationinfo` VALUES ('22', '22', null, null, null, '18300172547', '505551540@qq.com', '441284199312214721', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('23', '23', null, null, null, '15089693925', '1063144130@QQ.com', '440683199307045120', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('24', '24', null, null, null, '13425390913', '496927348@qq.com', '441284199503294728', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('25', '25', null, null, null, '15500000000', '30000000@qq.com', '430381199212105046', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('26', '26', null, null, null, '15580822848', '302658604@qq.com', '430381199212105046', 'http://www.cdbdai.com:80/upload/user/20150128105941.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('27', '27', null, null, null, '15119841692', 'me322@163.com', '445302198502050318', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('28', '28', null, null, null, '13281863467', '3052606301@qq.com', '51372319891214312X', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('29', '29', null, null, null, '13450160221', '693654902@qq.com', '432501195606271015', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('30', '30', null, null, null, '13583613758', '2319627199@qq.com', '460035197107171318', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('31', '31', null, null, null, '13580375452', 'pray1110@qq.com', '440923198609125439', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('32', '32', null, null, null, '15367948200', null, null, '/resources/images/headimg.jpg', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, 'Baby');
INSERT INTO `userrelationinfo` VALUES ('33', '33', null, null, null, null, null, null, '/resources/images/headimg.jpg', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '李敏');
INSERT INTO `userrelationinfo` VALUES ('34', '34', null, null, null, '15602366881', '569609377@qq.com', '441284199511134724', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, 'baby');
INSERT INTO `userrelationinfo` VALUES ('35', '35', null, null, null, '18988635315', '914993847@qq.com', '440622196001174353', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('36', '36', null, null, null, '13620369840', '996011325@qq.com', '441284198005275212', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '李成霞');
INSERT INTO `userrelationinfo` VALUES ('37', '37', null, null, null, '15089680056', '869719683@qq.com', '441283199201084649', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('38', '38', null, null, null, null, null, null, '/resources/images/headimg.jpg', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('39', '39', null, null, null, '13425399507', '464332520@qq.com', '441284199205174736', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '周淑贤');
INSERT INTO `userrelationinfo` VALUES ('40', '40', null, null, null, '15813982529', '469608813@qq.com', '360428198412195315', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('41', '41', null, null, null, '13875835914', '1094256083@qq.com', '430381199201065018', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '默默');
INSERT INTO `userrelationinfo` VALUES ('42', '42', null, null, null, '18820204809', 'candle_1667@163.com', '43252219890507405x', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('43', '43', null, null, null, '15507586705', '1406024738@qq.com', '211002199210173131', '/resources/images/headimg.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('44', '44', null, null, null, '15507586703', '896259559@qq.com', '360313198407181015', 'http://localhost:8080/resources/images/img/user5.jpg', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('45', '45', null, null, null, '', null, null, '/resources/images/headimg.jpg', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '');
INSERT INTO `userrelationinfo` VALUES ('46', '46', null, null, null, '15507586704', null, null, '/resources/images/headimg.jpg', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '');

-- ----------------------------
-- Table structure for `validcodeinfo`
-- ----------------------------
DROP TABLE IF EXISTS `validcodeinfo`;
CREATE TABLE `validcodeinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号，主键，自动增长',
  `emailagaintime` bigint(50) DEFAULT NULL COMMENT 'email再次发送时间',
  `emailcode` bigint(50) DEFAULT NULL COMMENT '邮件验证码',
  `emailovertime` varchar(50) DEFAULT NULL COMMENT 'email发送超时时间',
  `smsCode` varchar(50) DEFAULT NULL COMMENT '短信验证码',
  `smsagainTime` bigint(50) DEFAULT NULL COMMENT '再次发送短信提示时间',
  `smsoverTime` bigint(50) DEFAULT NULL COMMENT '短信超时时间',
  `user_id` bigint(20) DEFAULT NULL COMMENT '会员信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `FK94582817BC6BC45` (`user_id`) USING BTREE,
  CONSTRAINT `validcodeinfo_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userbasicsinfo` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='邮件限制信息; InnoDB free: 8192 kB; (`user_id`) REFER ; InnoDB free: 8192 kB; (`user_i';

-- ----------------------------
-- Records of validcodeinfo
-- ----------------------------
INSERT INTO `validcodeinfo` VALUES ('1', null, null, null, '738157', '1421938528842', null, '1');
INSERT INTO `validcodeinfo` VALUES ('2', null, null, null, '848054', '1421938899082', null, '2');
INSERT INTO `validcodeinfo` VALUES ('3', null, null, null, '220195', '1421942205857', null, '3');
INSERT INTO `validcodeinfo` VALUES ('4', null, null, null, '125063', '1421942447549', null, '4');
INSERT INTO `validcodeinfo` VALUES ('5', null, null, null, '203909', '1421942661282', null, '5');
INSERT INTO `validcodeinfo` VALUES ('6', null, null, null, '583553', '1421944192711', null, '6');
INSERT INTO `validcodeinfo` VALUES ('7', null, null, null, '867305', '1421944585067', null, '7');
INSERT INTO `validcodeinfo` VALUES ('8', null, null, null, null, null, null, '8');
INSERT INTO `validcodeinfo` VALUES ('9', null, null, null, null, null, null, '9');
INSERT INTO `validcodeinfo` VALUES ('10', null, null, null, null, null, null, '10');
INSERT INTO `validcodeinfo` VALUES ('11', null, null, null, null, null, null, '11');
INSERT INTO `validcodeinfo` VALUES ('12', null, null, null, null, null, null, '12');
INSERT INTO `validcodeinfo` VALUES ('13', null, null, null, '581187', '1422009282331', null, '13');
INSERT INTO `validcodeinfo` VALUES ('14', null, null, null, '605629', '1422009291174', null, '14');
INSERT INTO `validcodeinfo` VALUES ('15', null, null, null, '666245', '1422022136285', null, '15');
INSERT INTO `validcodeinfo` VALUES ('16', null, null, null, '774842', '1422080240958', null, '16');
INSERT INTO `validcodeinfo` VALUES ('17', null, null, null, null, null, null, '17');
INSERT INTO `validcodeinfo` VALUES ('18', null, null, null, '975160', '1422080361928', null, '18');
INSERT INTO `validcodeinfo` VALUES ('19', null, null, null, '639580', '1422098871378', null, '19');
INSERT INTO `validcodeinfo` VALUES ('20', null, null, null, '249955', '1422259712585', null, '20');
INSERT INTO `validcodeinfo` VALUES ('21', null, null, null, '340689', '1422407842901', null, '21');
INSERT INTO `validcodeinfo` VALUES ('22', null, null, null, '571235', '1422409305263', null, '22');
INSERT INTO `validcodeinfo` VALUES ('23', null, null, null, '656583', '1422409393620', null, '23');
INSERT INTO `validcodeinfo` VALUES ('24', null, null, null, '820485', '1422409581503', null, '24');
INSERT INTO `validcodeinfo` VALUES ('25', null, null, null, '841425', '1422410228754', null, '25');
INSERT INTO `validcodeinfo` VALUES ('26', null, null, null, '930442', '1422413618028', null, '26');
INSERT INTO `validcodeinfo` VALUES ('27', null, null, null, '393910', '1422495660062', null, '27');
INSERT INTO `validcodeinfo` VALUES ('28', null, null, null, '938261', '1422513735232', null, '28');
INSERT INTO `validcodeinfo` VALUES ('29', null, null, null, '182763', '1422860866032', null, '29');
INSERT INTO `validcodeinfo` VALUES ('30', null, null, null, '657939', '1422861268561', null, '30');
INSERT INTO `validcodeinfo` VALUES ('31', null, null, null, '710593', '1422865198964', null, '31');
INSERT INTO `validcodeinfo` VALUES ('32', null, null, null, '739687', '1422949085684', null, '32');
INSERT INTO `validcodeinfo` VALUES ('33', null, null, null, null, null, null, '33');
INSERT INTO `validcodeinfo` VALUES ('34', null, null, null, '432215', '1423033313255', null, '34');
INSERT INTO `validcodeinfo` VALUES ('35', null, null, null, '293188', '1423013082275', null, '35');
INSERT INTO `validcodeinfo` VALUES ('36', null, null, null, '558413', '1423016816418', null, '36');
INSERT INTO `validcodeinfo` VALUES ('37', null, null, null, '119463', '1423021136401', null, '37');
INSERT INTO `validcodeinfo` VALUES ('38', null, null, null, null, null, null, '38');
INSERT INTO `validcodeinfo` VALUES ('39', null, null, null, '229703', '1423023658301', null, '39');
INSERT INTO `validcodeinfo` VALUES ('40', null, null, null, '733549', '1423023852002', null, '40');
INSERT INTO `validcodeinfo` VALUES ('41', null, null, null, '821786', '1423037473719', null, '41');
INSERT INTO `validcodeinfo` VALUES ('42', null, null, null, '421382', '1423194594955', null, '42');
INSERT INTO `validcodeinfo` VALUES ('43', null, null, null, '584859', '1423214827209', null, '43');
INSERT INTO `validcodeinfo` VALUES ('44', null, null, null, null, null, null, '44');
INSERT INTO `validcodeinfo` VALUES ('45', null, null, null, '173072', '1423793332175', null, '45');
INSERT INTO `validcodeinfo` VALUES ('46', null, null, null, '806133', '1423793673724', null, '46');

-- ----------------------------
-- Table structure for `verifyproblem`
-- ----------------------------
DROP TABLE IF EXISTS `verifyproblem`;
CREATE TABLE `verifyproblem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `problem` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='问题库-找回密码相关问题';

-- ----------------------------
-- Records of verifyproblem
-- ----------------------------
INSERT INTO `verifyproblem` VALUES ('1', '出生地是哪里？');
INSERT INTO `verifyproblem` VALUES ('2', '打字经常用什么输入法？');
INSERT INTO `verifyproblem` VALUES ('3', '父亲的名字？');
INSERT INTO `verifyproblem` VALUES ('4', '母亲的名字？');
INSERT INTO `verifyproblem` VALUES ('5', '父亲的生日？');
INSERT INTO `verifyproblem` VALUES ('6', '母亲的生日？');
INSERT INTO `verifyproblem` VALUES ('7', '初中班主任是谁？');
INSERT INTO `verifyproblem` VALUES ('8', '高中班主任是谁？');
INSERT INTO `verifyproblem` VALUES ('9', '最敬佩的老师叫什么名字？');
INSERT INTO `verifyproblem` VALUES ('10', '现在居住在哪里？');

-- ----------------------------
-- Table structure for `videobroadcast`
-- ----------------------------
DROP TABLE IF EXISTS `videobroadcast`;
CREATE TABLE `videobroadcast` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) DEFAULT NULL COMMENT '标题',
  `url` varchar(500) DEFAULT NULL COMMENT '视频地址',
  `filePath` varchar(500) DEFAULT NULL COMMENT '文件路径',
  `isShow` int(5) DEFAULT NULL COMMENT '是否显示(1显示 0不显示)',
  `showNum` int(11) DEFAULT NULL COMMENT '显示顺序',
  `addTime` varchar(50) DEFAULT NULL COMMENT '提交时间',
  `Remark` varchar(5002) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='视频播报信息表';

-- ----------------------------
-- Records of videobroadcast
-- ----------------------------

-- ----------------------------
-- Table structure for `vipinfo`
-- ----------------------------
DROP TABLE IF EXISTS `vipinfo`;
CREATE TABLE `vipinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `begintime` varchar(255) DEFAULT NULL COMMENT '开始时间',
  `endtime` varchar(255) DEFAULT NULL COMMENT '结束时间',
  `user_id` bigint(20) DEFAULT NULL COMMENT '会员',
  `viptype_id` bigint(20) DEFAULT NULL COMMENT '特权会员类型',
  `time` varchar(30) DEFAULT NULL COMMENT '缴费时间',
  `bankbillno` varchar(30) DEFAULT NULL,
  `ipsbillno` varchar(30) DEFAULT NULL,
  `number` varchar(30) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `viptype_id` (`viptype_id`) USING BTREE,
  CONSTRAINT `vipinfo_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userbasicsinfo` (`id`),
  CONSTRAINT `vipinfo_ibfk_2` FOREIGN KEY (`viptype_id`) REFERENCES `viptype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='特权会员信息表; InnoDB free: 8192 kB; (`user_id`) REF; InnoDB free: 8192 kB; (`user_id`';

-- ----------------------------
-- Records of vipinfo
-- ----------------------------
INSERT INTO `vipinfo` VALUES ('1', '2015-01-23 22:36:01', '2015-07-23 22:36:01', '15', '1', '2015-01-23 22:36:01', null, null, null, '2');
INSERT INTO `vipinfo` VALUES ('2', '2015-01-24 19:44:00', '2015-07-24 19:44:00', '13', '1', '2015-01-24 19:44:00', null, null, null, '2');
INSERT INTO `vipinfo` VALUES ('3', '2015-01-26 16:21:26', '2015-07-26 16:21:26', '20', '1', '2015-01-26 16:21:26', null, null, null, '2');
INSERT INTO `vipinfo` VALUES ('4', '2015-01-28 15:39:56', '2015-07-28 15:39:56', '21', '1', '2015-01-28 15:39:56', null, null, null, '2');
INSERT INTO `vipinfo` VALUES ('5', '2015-01-28 15:40:14', '2015-07-28 15:40:14', '21', '1', '2015-01-28 15:40:14', null, null, null, '2');
INSERT INTO `vipinfo` VALUES ('6', '2015-01-29 10:28:42', '2015-07-29 10:28:42', '27', '1', '2015-01-29 10:28:42', null, null, null, '2');
INSERT INTO `vipinfo` VALUES ('7', '2015-02-06 10:31:10', '2015-08-06 10:31:10', '16', '1', '2015-02-06 10:31:10', null, null, null, '2');

-- ----------------------------
-- Table structure for `viptype`
-- ----------------------------
DROP TABLE IF EXISTS `viptype`;
CREATE TABLE `viptype` (
  `id` bigint(20) NOT NULL,
  `money` decimal(18,4) DEFAULT NULL COMMENT '钱',
  `month` int(11) DEFAULT NULL COMMENT '月份',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='特权会员类型表';

-- ----------------------------
-- Records of viptype
-- ----------------------------
INSERT INTO `viptype` VALUES ('1', '188.0000', '12');

-- ----------------------------
-- Table structure for `withdraw`
-- ----------------------------
DROP TABLE IF EXISTS `withdraw`;
CREATE TABLE `withdraw` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `withdrawAmount` decimal(18,4) DEFAULT NULL COMMENT '提现金额',
  `deposit` decimal(18,4) DEFAULT NULL COMMENT '提现费用',
  `withdrawstate` int(1) DEFAULT NULL COMMENT '0 提现申请中  1审核通过 2审核未通过3转账成功 4 转账失败',
  `user_id` bigint(20) DEFAULT NULL COMMENT '提现用户',
  `strNum` varchar(50) DEFAULT NULL COMMENT '打款流水号',
  `remark` varchar(200) DEFAULT NULL COMMENT '详细结果',
  `time` varchar(30) DEFAULT NULL COMMENT '提现审核时间',
  `bank_id` bigint(20) DEFAULT NULL COMMENT '提现银行卡号',
  `pIpsBillNo` varchar(30) DEFAULT NULL COMMENT 'ips提现编号',
  `applytime` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `bank_id` (`bank_id`) USING BTREE,
  CONSTRAINT `withdraw_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userbasicsinfo` (`id`),
  CONSTRAINT `withdraw_ibfk_2` FOREIGN KEY (`bank_id`) REFERENCES `userbank` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='提现申请-转帐结果表; InnoDB free: 8192 kB; (`user_i; InnoDB free: 8192 kB; (`user_id`) RE';

-- ----------------------------
-- Records of withdraw
-- ----------------------------
INSERT INTO `withdraw` VALUES ('1', '8.0000', null, null, '7', '2_TX20150123015645708700', null, '2015-01-23 01:59:22', null, '2_TX20150123015645708700', null);
INSERT INTO `withdraw` VALUES ('2', '50.0000', null, null, '13', '3_TX20150127014854185588', null, '2015-01-27 13:50:49', null, '3_TX20150127014854185588', null);
INSERT INTO `withdraw` VALUES ('3', '10.0000', null, null, '13', '4_TX20150127040038385735', null, '2015-01-27 16:01:01', null, '4_TX20150127040038385735', null);

-- ----------------------------
-- Table structure for `withdraw_apply`
-- ----------------------------
DROP TABLE IF EXISTS `withdraw_apply`;
CREATE TABLE `withdraw_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cash` decimal(18,4) DEFAULT NULL COMMENT '可提现总额',
  `userbasic_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `apply_num` decimal(18,4) DEFAULT NULL COMMENT '申请提现数目',
  `result` int(2) DEFAULT NULL COMMENT '审核结果: 0不通过，1通过',
  `status` int(2) DEFAULT NULL COMMENT '审核状态:0未审核，1已审核',
  `apply_time` varchar(20) DEFAULT NULL COMMENT '申请时间',
  `answer_time` varchar(20) DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of withdraw_apply
-- ----------------------------
INSERT INTO `withdraw_apply` VALUES ('1', '21000.0000', '2', '1000.0000', '1', '1', '2015-01-22 23:10:21', '2015-01-22 23:11:53');
INSERT INTO `withdraw_apply` VALUES ('2', '19998.0000', '7', '8.0000', '2', '1', '2015-01-23 00:44:37', '2015-01-23 01:31:46');
INSERT INTO `withdraw_apply` VALUES ('3', '98.5000', '13', '50.0000', '2', '1', '2015-01-24 19:54:55', '2015-01-27 13:48:41');
INSERT INTO `withdraw_apply` VALUES ('4', '147.0000', '13', '10.0000', '2', '1', '2015-01-27 16:00:07', '2015-01-27 16:00:30');
INSERT INTO `withdraw_apply` VALUES ('5', '100.9000', '24', '50.0000', '3', '1', '2015-02-05 17:27:59', '2015-02-05 17:28:57');

-- ----------------------------
-- Table structure for `yjkcost`
-- ----------------------------
DROP TABLE IF EXISTS `yjkcost`;
CREATE TABLE `yjkcost` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lv0` double DEFAULT NULL COMMENT 'HR客户',
  `lv1` double DEFAULT NULL COMMENT 'E级客户',
  `lv2` double DEFAULT NULL COMMENT 'D 级客户',
  `lv3` double DEFAULT NULL COMMENT 'C 级客户',
  `lv4` double DEFAULT NULL COMMENT 'B 级客户',
  `lv5` double DEFAULT NULL COMMENT 'A 级客户',
  `lv6` double DEFAULT NULL COMMENT 'AA 级客户',
  `lv7` double DEFAULT NULL COMMENT 'AAA级客户',
  `repay_manage_ratio` double DEFAULT NULL COMMENT '借款管理费比例',
  `overdue_repay_ratio1` double DEFAULT NULL COMMENT '借款逾期30天以内',
  `overdue_repay_ratio2` double DEFAULT NULL COMMENT '借款逾期31天以上',
  `overdue_repay_mngmt1` double DEFAULT NULL COMMENT '借款逾期管理费30天以内',
  `overdue_repay_mngmt2` double DEFAULT NULL COMMENT '借款逾期管理费31天以上',
  `id_verify_fee` double DEFAULT NULL COMMENT '身份验证费',
  `ips_reg_fee` double DEFAULT NULL COMMENT 'IPS开户费',
  `borrow_audit_fee` double DEFAULT NULL COMMENT '借款审核费',
  `ips_sms_fee` double DEFAULT NULL COMMENT 'IPS短息服务费',
  `recharge_ratio` double DEFAULT NULL COMMENT '充值费率(手续费上限100）',
  `recharge_fee_top` double DEFAULT NULL COMMENT '充值手续费上限',
  `withdraw_fee0` double DEFAULT NULL COMMENT '提现费用(2万元以下)',
  `withdraw_fee1` double DEFAULT NULL COMMENT '提现费用(2万(含)-5万元)',
  `withdraw_fee2` double DEFAULT NULL COMMENT '提现费用(5万(含)-100万元)',
  `tg_base_score` int(2) NOT NULL DEFAULT '5' COMMENT '推广基础分数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='优金库费用表';

-- ----------------------------
-- Records of yjkcost
-- ----------------------------
INSERT INTO `yjkcost` VALUES ('1', '0.08', '0.06', '0.04', '0.03', '0.02', '0.01', '0.005', '0', '0.005', '0.0005', '0.001', '0.001', '0.005', '5', '16', '15', '2', '0.005', '100', '3', '5', '10', '5');

-- ----------------------------
-- Procedure structure for `PROCEDURE_LIANS_INSERT`
-- ----------------------------
DROP PROCEDURE IF EXISTS `PROCEDURE_LIANS_INSERT`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROCEDURE_LIANS_INSERT`(IN money DECIMAL(18,4),IN time_execute VARCHAR(30),IN admin_id BIGINT,IN loanid BIGINT,IN userbasicsId BIGINT,IN mymoney DECIMAL(18,4),IN pMerBillNo VARCHAR(30),IN pIpsBillNo VARCHAR(30),IN mymoneys DECIMAL(18,4))
BEGIN
	UPDATE userfundinfo u SET u.cashBalance=mymoney WHERE u.id=userbasicsId;
	UPDATE loansign l SET l.loanstate=3 WHERE l.id=loanid;
  UPDATE loansignbasics b SET b.creditTime=time_execute WHERE b.id=loanid;
	INSERT INTO accountinfo(userbasic_id,accounttype_id,money,time,expenditure,income,explan,withdraw,loansign_id,ipsNumber) VALUES(userbasicsId,20,mymoney+mymoneys,time_execute,0.00,money,'满标放款',NULL,loanid,pIpsBillNo);
	-- INSERT INTO accountinfo(userbasic_id,accounttype_id,money,time,expenditure,income,explan,withdraw,loansign_id,ipsNumber) VALUES(userbasicsId,2,mymoney,time_execute,mymoneys,0.00,'借款人管理费',NULL,loanid,pIpsBillNo);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `PROCEDURE_MONEY_UPDATE`
-- ----------------------------
DROP PROCEDURE IF EXISTS `PROCEDURE_MONEY_UPDATE`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROCEDURE_MONEY_UPDATE`(
	IN mymoney decimal(18,4),IN typeid INT,IN mytime VARCHAR(20),IN userid INT,IN explan VARCHAR(50),IN wid VARCHAR(30),IN loanid INT
)
BEGIN
UPDATE userfundinfo SET cashBalance=@value:=cashBalance+mymoney WHERE userbasic_id= userid;

if mymoney>0.00 THEN
	INSERT INTO accountinfo (userbasic_id,accounttype_id,money,time,expenditure,income,explan,withdraw,loansign_id)VALUES(userid,typeid,@value,mytime,NULL,mymoney,explan,wid,loanid);
else
	INSERT INTO accountinfo (userbasic_id,accounttype_id,money,time,expenditure,income,explan,withdraw,loansign_id)VALUES(userid,typeid,@value,mytime,ABS(mymoney),NULL,explan,wid,loanid);
end IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `PROCEDURE_MONEY_UPDATEADMINUSER`
-- ----------------------------
DROP PROCEDURE IF EXISTS `PROCEDURE_MONEY_UPDATEADMINUSER`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROCEDURE_MONEY_UPDATEADMINUSER`(IN mymoney decimal(18,4),IN typeid INT,IN mytime VARCHAR(20),IN explan VARCHAR(50),IN wid VARCHAR(30))
BEGIN
UPDATE adminuserfundinfo SET cashBalance=@value:=cashBalance+mymoney;
if mymoney>0.00 THEN
	INSERT INTO adminuseraccountinfo(accounttype_id,money,time,expenditure,income,explan,withdraw) VALUES(typeid,@value,mytime,NULL,mymoney,explan,wid);
else
	INSERT INTO adminuseraccountinfo(accounttype_id,money,time,expenditure,income,explan,withdraw) VALUES(typeid,@value,mytime,ABS(mymoney),NULL,explan,wid);
end IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `PROCEDURE_RECHARGE_UPDATE`
-- ----------------------------
DROP PROCEDURE IF EXISTS `PROCEDURE_RECHARGE_UPDATE`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROCEDURE_RECHARGE_UPDATE`(IN money DECIMAL(18,4),IN orderNum VARCHAR(30),IN ipsBillNo VARCHAR(30),IN time VARCHAR(30),IN userbasicsId BIGINT,IN mymoney DECIMAL(18,4))
BEGIN
INSERT INTO recharge(user_id,time,rechargeAmount,reAccount,orderNum,pIpsBillNo,status) VALUES(userbasicsId,time,money,money,orderNum,ipsBillNo,1);
UPDATE userfundinfo u SET u.cashBalance=u.cashBalance + money WHERE u.id=userbasicsId;
INSERT INTO accountinfo(userbasic_id,accounttype_id,money,time,expenditure,income,explan,withdraw,loansign_id,ipsNumber) VALUES(userbasicsId,8,mymoney,time,0.00,money,'在线充值',NULL,NULL,ipsBillNo);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `PROCEDURE_REGISTRATION_UPDATE`
-- ----------------------------
DROP PROCEDURE IF EXISTS `PROCEDURE_REGISTRATION_UPDATE`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROCEDURE_REGISTRATION_UPDATE`(IN userId BIGINT,IN time VARCHAR(20),IN pMerBillNo VARCHAR(30),IN pIdentNo VARCHAR(30))
BEGIN
		UPDATE userbasicsinfo u SET u.pMerBillNo=pMerBillNo,u.pIpsAcctDate=time where u.id=userId;
		UPDATE userfundinfo userf SET userf.pIdentNo=pIdentNo where userf.id=userId;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `PROCEDURE_REPAYMENT_MONEY`
-- ----------------------------
DROP PROCEDURE IF EXISTS `PROCEDURE_REPAYMENT_MONEY`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROCEDURE_REPAYMENT_MONEY`(IN mymoney DECIMAL(18,4),IN ipsNumber VARCHAR(30),IN interest DECIMAL(18,4),IN money DECIMAL(18,4),IN penalty DECIMAL(18,4),IN time VARCHAR(30),IN userid BIGINT,IN loanid BIGINT,IN state INT,IN managementFee DECIMAL(18,4),IN type INT)
BEGIN
	UPDATE userfundinfo SET cashBalance=mymoney WHERE id=userid; 
-- 借款人
	IF type=0 THEN
		INSERT INTO accountinfo(money,income,expenditure,loansign_id,userbasic_id,time,explan,accounttype_id,ipsNumber) VALUES(mymoney+interest+penalty,0.00,ABS(money),loanid,userid,time,'借款人本金',3,ipsNumber);
		INSERT INTO accountinfo(money,income,expenditure,loansign_id,userbasic_id,time,explan,accounttype_id,ipsNumber) VALUES(mymoney+penalty,0.00,ABS(interest),loanid,userid,time,'借款人利息',4,ipsNumber);
    INSERT INTO accountinfo(money,income,expenditure,loansign_id,userbasic_id,time,explan,accounttype_id,ipsNumber) VALUES(mymoney+penalty,0.00,managementFee,loanid,userid,time,'借款人管理费',2,ipsNumber);
		IF penalty>0 THEN
			INSERT INTO accountinfo(money,income,expenditure,loansign_id,userbasic_id,time,explan,accounttype_id,ipsNumber) VALUES(mymoney,0.00,ABS(penalty),loanid,userid,time,'提前还款违约金',12,ipsNumber);
		END IF;
	ELSE
		INSERT INTO accountinfo(money,income,expenditure,loansign_id,userbasic_id,time,explan,accounttype_id,ipsNumber) VALUES(mymoney-interest-penalty+managementFee,money,0.00,loanid,userid,time,'投资人本金',6,ipsNumber);
		INSERT INTO accountinfo(money,income,expenditure,loansign_id,userbasic_id,time,explan,accounttype_id,ipsNumber) VALUES(mymoney-penalty+managementFee,interest,0.00,loanid,userid,time,'投资人利息',7,ipsNumber);
		INSERT INTO accountinfo(money,income,expenditure,loansign_id,userbasic_id,time,explan,accounttype_id,ipsNumber) VALUES(mymoney-penalty,0.00,managementFee,loanid,userid,time,'投资人管理费',5,ipsNumber);
		IF penalty>0 THEN
			INSERT INTO accountinfo(money,income,expenditure,loansign_id,userbasic_id,time,explan,accounttype_id,ipsNumber) VALUES(mymoney,penalty,0.00,loanid,userid,time,'逾期还款违约金',13,ipsNumber);
		END IF;
	END IF;
	IF state=1 THEN
	-- 修改用户的冻结金额
		UPDATE userfundinfo SET frozenAmtN=frozenAmtN+money+interest+penalty WHERE id=userid;  
	END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `PROCEDURE_WITHDRAWAL_INSERT`
-- ----------------------------
DROP PROCEDURE IF EXISTS `PROCEDURE_WITHDRAWAL_INSERT`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROCEDURE_WITHDRAWAL_INSERT`(IN id BIGINT,IN money DECIMAL(18,4),IN strNum VARCHAR(30),IN ipsBillNo VARCHAR(30),IN time VARCHAR(30),IN myMoney DECIMAL(18,4))
BEGIN
		INSERT INTO withdraw(user_id,withdrawAmount,time,strNum,pIpsBilNo) VALUES(id,money,time,strNum,ipsBillNo); 
		UPDATE userfundinfo u SET u.cashBalance=myMoney WHERE u.id=userbasicesId;
		INSERT INTO accountinfo(user_id,accounttype_id,money,time,expenditure,income,explan,withdraw,loansign_id) VALUES(userbasicesId,9,myMoney,time,money,0.00,'提现',NULL,NULL);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `PROCEDURE_WITHDRAWAL_MONEY`
-- ----------------------------
DROP PROCEDURE IF EXISTS `PROCEDURE_WITHDRAWAL_MONEY`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROCEDURE_WITHDRAWAL_MONEY`(IN id BIGINT,IN money DECIMAL(18,4),IN time VARCHAR(30),IN myMoney DECIMAL(18,4),IN ips VARCHAR(30),IN withdrawID BIGINT)
BEGIN
		UPDATE userfundinfo u SET u.cashBalance=myMoney WHERE u.id=id;
		INSERT INTO accountinfo(userbasic_id,accounttype_id,money,time,expenditure,income,explan,withdraw,loansign_id,ipsNumber) VALUES(id,9,myMoney,time,money,0.00,'提现',NULL,NULL,ips);
    UPDATE withdraw_apply w SET w.result=2 WHERE w.userbasic_id=id and w.id=withdrawID;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `PROCEDURE_WITHDRAWAL_RECORD`
-- ----------------------------
DROP PROCEDURE IF EXISTS `PROCEDURE_WITHDRAWAL_RECORD`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROCEDURE_WITHDRAWAL_RECORD`(IN id BIGINT,IN money DECIMAL(18,4),IN strNum VARCHAR(30),IN ipsBillNo VARCHAR(30),IN time VARCHAR(30))
BEGIN
		INSERT INTO withdraw(user_id,withdrawAmount,time,strNum,pIpsBillNo) VALUES(id,money,time,strNum,ipsBillNo); 
END
;;
DELIMITER ;
