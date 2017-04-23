/*
Navicat MySQL Data Transfer

Source Server         : lol
Source Server Version : 100119
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 100119
File Encoding         : 65001

Date: 2017-03-27 12:41:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auto
-- ----------------------------
DROP TABLE IF EXISTS `auto`;
CREATE TABLE `auto` (
  `id_samochodu` int(5) NOT NULL AUTO_INCREMENT,
  `data_dodania` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_user` int(5) NOT NULL,
  `rok` year(4) NOT NULL,
  `moc` int(5) NOT NULL,
  `przyspieszenie` varchar(5) NOT NULL,
  `silnik` varchar(15) NOT NULL,
  `Vmax` int(4) NOT NULL,
  `opis` varchar(970) NOT NULL,
  `model` varchar(20) NOT NULL,
  `marka` varchar(20) NOT NULL,
  `typ` enum('racing','cabrio','hatchback','suv','off-road','coupe','combi','sedan') NOT NULL,
  `naped` enum('RWD','FWD','4x4') NOT NULL,
  `foto` varchar(20) NOT NULL,
  PRIMARY KEY (`id_samochodu`),
  KEY `Auto_Dodający` (`id_user`),
  CONSTRAINT `Auto_Dodający` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auto
-- ----------------------------
INSERT INTO `auto` VALUES ('53', '2017-01-25 19:20:54', '46', '2015', '320', '5.4', 'V8', '260', 'Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. Mustang GT random decribtion. ', 'Mustang GT', 'Ford', 'coupe', 'FWD', 'car.jpg');
INSERT INTO `auto` VALUES ('54', '2017-01-25 19:41:21', '51', '2012', '800', '12', 'V8 Turbo', '190', 'Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. Some txt. ', 'F-150 RAPTOR', 'Ford', 'off-road', '4x4', 'raptor.jpg');
INSERT INTO `auto` VALUES ('55', '2017-02-06 10:43:35', '51', '2006', '0', '5.4', 'V8 Turbo', '260', '  Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text. Some Text.  ;<noscript>\' ', 'EVO IX', 'Mitsubishi', 'sedan', 'FWD', 'tYwUPdz.jpg');

-- ----------------------------
-- Table structure for auto_archive
-- ----------------------------
DROP TABLE IF EXISTS `auto_archive`;
CREATE TABLE `auto_archive` (
  `id_auto_OLD` int(5) NOT NULL AUTO_INCREMENT,
  `iduserOLD` int(5) NOT NULL,
  `idOLD` int(5) NOT NULL,
  `markaOLD` varchar(20) NOT NULL,
  `modelOLD` varchar(20) NOT NULL,
  `delete_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id_auto_OLD`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auto_archive
-- ----------------------------
INSERT INTO `auto_archive` VALUES ('1', '46', '50', 'd', 'd', '2017-01-24 16:31:56', 'deleted');
INSERT INTO `auto_archive` VALUES ('2', '46', '51', 'f', 'f', '2017-01-25 16:45:58', 'deleted');
INSERT INTO `auto_archive` VALUES ('3', '46', '46', 'Ford', 'Mustang GT', '2017-01-25 17:23:56', 'updated');
INSERT INTO `auto_archive` VALUES ('4', '46', '46', 'Ford', 'Mustang GT', '2017-01-25 19:17:23', 'deleted');
INSERT INTO `auto_archive` VALUES ('5', '46', '47', 'Audi', 'A4', '2017-01-25 19:17:27', 'deleted');
INSERT INTO `auto_archive` VALUES ('6', '54', '56', 'a', 'a', '2017-01-25 19:51:19', 'deleted');
INSERT INTO `auto_archive` VALUES ('7', '46', '52', 'Audi', 'A6', '2017-01-26 09:42:53', 'deleted');
INSERT INTO `auto_archive` VALUES ('8', '51', '55', 'Mitsubishi', 'EVO IX', '2017-01-30 10:24:50', 'updated');
INSERT INTO `auto_archive` VALUES ('9', '51', '55', 'Mitsubishi', 'EVO IX', '2017-02-06 10:43:35', 'updated');

-- ----------------------------
-- Table structure for login_details
-- ----------------------------
DROP TABLE IF EXISTS `login_details`;
CREATE TABLE `login_details` (
  `id_ip` int(5) NOT NULL AUTO_INCREMENT,
  `user` varchar(20) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `OS` varchar(30) NOT NULL,
  `browser` varchar(20) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_usr` int(5) DEFAULT NULL,
  PRIMARY KEY (`id_ip`),
  KEY `usr_det` (`id_usr`),
  CONSTRAINT `usr_det` FOREIGN KEY (`id_usr`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_details
-- ----------------------------
INSERT INTO `login_details` VALUES ('4', '', '89.70.216.146', 'Windows 10', 'Chrome', '2016-11-27 17:08:30', null);
INSERT INTO `login_details` VALUES ('5', '', '89.70.216.146', 'iPad', 'Handheld Browser', '2016-11-27 17:10:47', null);
INSERT INTO `login_details` VALUES ('6', '', '149.156.136.213', 'Windows 8.1', 'Firefox', '2016-11-28 10:21:16', null);
INSERT INTO `login_details` VALUES ('7', '', '149.156.136.213', 'Windows 8.1', 'Firefox', '2016-11-28 10:21:27', null);
INSERT INTO `login_details` VALUES ('8', '', '149.156.136.213', 'Windows 8.1', 'Firefox', '2016-11-28 10:23:12', null);
INSERT INTO `login_details` VALUES ('9', '', '149.156.136.213', 'Windows 8.1', 'Firefox', '2016-11-28 10:40:42', null);
INSERT INTO `login_details` VALUES ('10', '', '149.156.136.213', 'Windows 8.1', 'Firefox', '2016-11-28 10:40:59', null);
INSERT INTO `login_details` VALUES ('11', '', '149.156.136.213', 'Windows 8.1', 'Firefox', '2016-11-28 10:41:18', null);
INSERT INTO `login_details` VALUES ('12', '', '149.156.136.213', 'Windows 8.1', 'Firefox', '2016-11-28 10:41:29', null);
INSERT INTO `login_details` VALUES ('13', '', '149.156.136.213', 'Windows 8.1', 'Firefox', '2016-11-28 10:42:07', null);
INSERT INTO `login_details` VALUES ('14', '', '149.156.136.213', 'Windows 8.1', 'Firefox', '2016-12-05 09:31:23', null);
INSERT INTO `login_details` VALUES ('15', '', '149.156.136.213', 'Windows 8.1', 'Firefox', '2016-12-05 10:06:53', null);
INSERT INTO `login_details` VALUES ('16', '', '149.156.136.213', 'Windows 8.1', 'Firefox', '2016-12-05 10:09:51', null);
INSERT INTO `login_details` VALUES ('17', '', '149.156.136.213', 'Windows 8.1', 'Firefox', '2016-12-05 10:14:30', null);
INSERT INTO `login_details` VALUES ('18', '', '149.156.136.213', 'Windows 8.1', 'Firefox', '2016-12-05 10:16:14', null);
INSERT INTO `login_details` VALUES ('19', '', '149.156.136.213', 'Windows 8.1', 'Firefox', '2016-12-05 10:18:16', null);
INSERT INTO `login_details` VALUES ('20', '', '149.156.136.213', 'Windows 8.1', 'Firefox', '2016-12-05 10:26:32', null);
INSERT INTO `login_details` VALUES ('21', '', '149.156.136.213', 'Windows 8.1', 'Firefox', '2016-12-05 10:31:26', null);
INSERT INTO `login_details` VALUES ('22', '', '149.156.136.213', 'Windows 8.1', 'Firefox', '2016-12-05 10:34:51', null);
INSERT INTO `login_details` VALUES ('23', '', '149.156.136.213', 'Windows 8.1', 'Firefox', '2016-12-05 10:36:05', null);
INSERT INTO `login_details` VALUES ('24', '', '149.156.136.213', 'Windows 8.1', 'Firefox', '2016-12-05 10:36:51', null);
INSERT INTO `login_details` VALUES ('25', '', '149.156.136.213', 'Windows 8.1', 'Firefox', '2016-12-05 10:37:40', null);
INSERT INTO `login_details` VALUES ('26', '', '149.156.136.213', 'Windows 8.1', 'Firefox', '2016-12-05 10:38:23', null);
INSERT INTO `login_details` VALUES ('27', '', '185.18.133.5', 'Windows 10', 'Chrome', '2016-12-07 23:21:35', null);
INSERT INTO `login_details` VALUES ('28', '', '185.18.133.5', 'Windows 10', 'Chrome', '2016-12-10 15:35:48', null);
INSERT INTO `login_details` VALUES ('29', '', '185.18.133.5', 'Windows 10', 'Chrome', '2016-12-10 15:37:24', null);
INSERT INTO `login_details` VALUES ('30', '', '185.18.133.5', 'Windows 10', 'Chrome', '2016-12-10 17:03:35', null);
INSERT INTO `login_details` VALUES ('31', '', '185.18.133.5', 'Windows 10', 'Chrome', '2016-12-10 17:03:46', null);
INSERT INTO `login_details` VALUES ('32', '', '185.18.133.5', 'Windows 10', 'Chrome', '2016-12-10 17:04:00', null);
INSERT INTO `login_details` VALUES ('33', '', '185.18.133.5', 'Windows 10', 'Chrome', '2016-12-10 17:04:13', null);
INSERT INTO `login_details` VALUES ('34', '', '185.18.133.5', 'Windows 10', 'Chrome', '2016-12-10 17:07:06', null);
INSERT INTO `login_details` VALUES ('35', '', '149.156.136.213', 'Windows 8.1', 'Firefox', '2016-12-12 09:35:44', null);
INSERT INTO `login_details` VALUES ('36', '', '149.156.136.213', 'Windows 8.1', 'Firefox', '2016-12-12 09:36:41', null);
INSERT INTO `login_details` VALUES ('37', '', '149.156.136.213', 'Windows 8.1', 'Firefox', '2016-12-12 10:30:10', null);
INSERT INTO `login_details` VALUES ('38', '', '89.70.216.146', 'Windows 10', 'Chrome', '2016-12-17 17:38:13', null);
INSERT INTO `login_details` VALUES ('39', '', '89.70.216.146', 'Windows 10', 'Chrome', '2016-12-17 17:39:57', null);
INSERT INTO `login_details` VALUES ('40', '', '89.70.216.146', 'Windows 10', 'Chrome', '2016-12-18 16:52:35', null);
INSERT INTO `login_details` VALUES ('41', '', '89.70.216.146', 'Windows 10', 'Chrome', '2016-12-18 16:55:08', null);
INSERT INTO `login_details` VALUES ('42', '', '89.70.216.146', 'Windows 10', 'Chrome', '2016-12-18 16:57:01', null);
INSERT INTO `login_details` VALUES ('43', '', '89.70.216.146', 'Windows 10', 'Chrome', '2016-12-18 17:06:09', null);
INSERT INTO `login_details` VALUES ('44', '', '89.70.216.146', 'Windows 10', 'Chrome', '2016-12-18 17:09:44', null);
INSERT INTO `login_details` VALUES ('45', '', '89.70.216.146', 'Windows 10', 'Chrome', '2016-12-18 17:35:31', null);
INSERT INTO `login_details` VALUES ('46', '', '89.70.216.146', 'Windows 10', 'Chrome', '2016-12-18 17:47:50', null);
INSERT INTO `login_details` VALUES ('47', '', '89.70.216.146', 'Windows 10', 'Chrome', '2016-12-18 17:48:31', null);
INSERT INTO `login_details` VALUES ('48', '', '89.70.216.146', 'Windows 10', 'Chrome', '2016-12-18 17:50:26', null);
INSERT INTO `login_details` VALUES ('49', '', '89.70.216.146', 'Windows 10', 'Chrome', '2016-12-18 17:53:01', null);
INSERT INTO `login_details` VALUES ('50', '', '89.70.216.146', 'Windows 10', 'Chrome', '2016-12-18 17:56:36', null);
INSERT INTO `login_details` VALUES ('51', '', '89.70.216.146', 'Windows 10', 'Chrome', '2016-12-18 17:57:40', null);
INSERT INTO `login_details` VALUES ('52', '', '89.70.216.146', 'Windows 10', 'Chrome', '2016-12-18 17:57:41', null);
INSERT INTO `login_details` VALUES ('53', '', '149.156.136.213', 'Windows 8.1', 'Firefox', '2016-12-19 09:39:36', null);
INSERT INTO `login_details` VALUES ('54', '', '185.18.133.5', 'Windows 10', 'Chrome', '2016-12-24 21:49:55', null);
INSERT INTO `login_details` VALUES ('55', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-06 12:28:50', null);
INSERT INTO `login_details` VALUES ('56', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-07 13:38:49', null);
INSERT INTO `login_details` VALUES ('57', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-07 14:15:07', null);
INSERT INTO `login_details` VALUES ('58', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-07 14:27:52', null);
INSERT INTO `login_details` VALUES ('59', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-08 17:29:59', null);
INSERT INTO `login_details` VALUES ('60', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-08 17:43:22', null);
INSERT INTO `login_details` VALUES ('61', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-10 15:03:21', null);
INSERT INTO `login_details` VALUES ('62', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-10 16:22:45', null);
INSERT INTO `login_details` VALUES ('63', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-10 16:26:54', null);
INSERT INTO `login_details` VALUES ('64', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-10 16:31:31', null);
INSERT INTO `login_details` VALUES ('65', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-10 16:38:43', null);
INSERT INTO `login_details` VALUES ('66', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-12 13:37:24', null);
INSERT INTO `login_details` VALUES ('67', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-13 16:01:53', null);
INSERT INTO `login_details` VALUES ('68', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-13 16:24:45', null);
INSERT INTO `login_details` VALUES ('69', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-15 15:39:06', null);
INSERT INTO `login_details` VALUES ('70', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-15 16:35:29', null);
INSERT INTO `login_details` VALUES ('71', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-15 17:02:54', null);
INSERT INTO `login_details` VALUES ('72', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-17 15:00:11', null);
INSERT INTO `login_details` VALUES ('73', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-17 15:47:10', null);
INSERT INTO `login_details` VALUES ('74', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-19 16:19:06', null);
INSERT INTO `login_details` VALUES ('75', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-19 17:11:03', null);
INSERT INTO `login_details` VALUES ('76', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-19 17:38:46', null);
INSERT INTO `login_details` VALUES ('77', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-20 15:26:53', null);
INSERT INTO `login_details` VALUES ('78', '', '89.70.216.146', 'iPad', 'Handheld Browser', '2017-01-20 16:12:18', null);
INSERT INTO `login_details` VALUES ('79', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-20 16:16:00', null);
INSERT INTO `login_details` VALUES ('80', '', '89.70.216.146', 'Android', 'Handheld Browser', '2017-01-20 16:29:14', null);
INSERT INTO `login_details` VALUES ('81', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-20 16:37:09', null);
INSERT INTO `login_details` VALUES ('82', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-20 16:38:59', null);
INSERT INTO `login_details` VALUES ('83', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-22 16:36:08', null);
INSERT INTO `login_details` VALUES ('84', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-22 17:18:20', null);
INSERT INTO `login_details` VALUES ('85', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-22 17:20:56', null);
INSERT INTO `login_details` VALUES ('86', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-22 17:27:17', null);
INSERT INTO `login_details` VALUES ('87', '', '89.70.216.146', 'Android', 'Handheld Browser', '2017-01-22 17:28:29', null);
INSERT INTO `login_details` VALUES ('88', '', '89.70.216.146', 'iPad', 'Handheld Browser', '2017-01-22 17:31:43', null);
INSERT INTO `login_details` VALUES ('89', '', '89.70.216.146', 'Android', 'Handheld Browser', '2017-01-22 17:38:29', null);
INSERT INTO `login_details` VALUES ('90', '', '89.70.216.146', 'Android', 'Handheld Browser', '2017-01-22 17:43:38', null);
INSERT INTO `login_details` VALUES ('91', '', '89.70.216.146', 'Android', 'Handheld Browser', '2017-01-22 17:46:41', null);
INSERT INTO `login_details` VALUES ('92', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-22 18:04:28', null);
INSERT INTO `login_details` VALUES ('93', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-24 14:41:05', null);
INSERT INTO `login_details` VALUES ('94', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-24 14:42:33', null);
INSERT INTO `login_details` VALUES ('95', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-24 14:55:58', null);
INSERT INTO `login_details` VALUES ('96', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-24 14:57:51', null);
INSERT INTO `login_details` VALUES ('97', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-24 15:51:24', null);
INSERT INTO `login_details` VALUES ('98', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-24 16:06:18', null);
INSERT INTO `login_details` VALUES ('99', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-24 16:06:55', null);
INSERT INTO `login_details` VALUES ('100', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-25 16:10:27', null);
INSERT INTO `login_details` VALUES ('101', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-25 16:51:30', null);
INSERT INTO `login_details` VALUES ('102', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-25 17:43:58', null);
INSERT INTO `login_details` VALUES ('103', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-25 18:40:30', null);
INSERT INTO `login_details` VALUES ('104', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-25 18:44:27', null);
INSERT INTO `login_details` VALUES ('105', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-25 18:45:19', null);
INSERT INTO `login_details` VALUES ('106', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-25 18:46:04', null);
INSERT INTO `login_details` VALUES ('107', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-25 18:53:43', null);
INSERT INTO `login_details` VALUES ('108', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-25 19:03:53', null);
INSERT INTO `login_details` VALUES ('109', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-25 19:17:07', null);
INSERT INTO `login_details` VALUES ('110', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-25 19:36:47', null);
INSERT INTO `login_details` VALUES ('111', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-25 19:42:35', null);
INSERT INTO `login_details` VALUES ('112', '', '89.70.216.146', 'Windows 10', 'Chrome', '2017-01-25 21:59:24', null);
INSERT INTO `login_details` VALUES ('113', '', '37.47.82.111', 'Windows 10', 'Chrome', '2017-01-26 08:16:12', null);
INSERT INTO `login_details` VALUES ('114', '', '37.47.82.111', 'Windows 10', 'Chrome', '2017-01-26 09:28:44', null);
INSERT INTO `login_details` VALUES ('115', '', '37.47.82.111', 'Windows 10', 'Chrome', '2017-01-26 09:42:36', null);
INSERT INTO `login_details` VALUES ('116', '', '37.47.82.111', 'Windows 10', 'Chrome', '2017-01-26 09:43:39', null);
INSERT INTO `login_details` VALUES ('117', '', '185.18.133.5', 'Windows 10', 'Chrome', '2017-01-27 15:29:41', null);
INSERT INTO `login_details` VALUES ('118', '', '185.18.133.5', 'Windows 10', 'Chrome', '2017-01-27 15:50:57', null);
INSERT INTO `login_details` VALUES ('119', '', '185.18.133.5', 'Windows 10', 'Chrome', '2017-01-27 15:53:36', null);
INSERT INTO `login_details` VALUES ('120', '', '185.18.133.5', 'Windows 10', 'Chrome', '2017-01-27 15:57:30', null);
INSERT INTO `login_details` VALUES ('121', '', '::1', 'Windows 10', 'Chrome', '2017-02-06 10:37:46', null);
INSERT INTO `login_details` VALUES ('122', '', '::1', 'Windows 10', 'Chrome', '2017-02-06 10:38:23', null);
INSERT INTO `login_details` VALUES ('123', '', '::1', 'Windows 10', 'Chrome', '2017-02-06 10:43:13', null);
INSERT INTO `login_details` VALUES ('124', '', '::1', 'Windows 10', 'Chrome', '2017-02-06 11:21:29', null);
INSERT INTO `login_details` VALUES ('125', '', '::1', 'Windows 10', 'Chrome', '2017-03-03 12:03:59', null);
INSERT INTO `login_details` VALUES ('126', '', '::1', 'Windows 10', 'Chrome', '2017-03-03 12:49:39', null);
INSERT INTO `login_details` VALUES ('127', '', '::1', 'Windows 10', 'Chrome', '2017-03-03 12:56:04', null);
INSERT INTO `login_details` VALUES ('128', '', '::1', 'Windows 10', 'Chrome', '2017-03-03 13:09:07', null);
INSERT INTO `login_details` VALUES ('129', '', '::1', 'Windows 10', 'Chrome', '2017-03-03 13:09:58', null);
INSERT INTO `login_details` VALUES ('130', '', '::1', 'Windows 10', 'Chrome', '2017-03-10 11:01:47', null);
INSERT INTO `login_details` VALUES ('131', 'CaeMeS', '::1', 'Windows 10', 'Chrome', '2017-03-10 11:22:39', null);
INSERT INTO `login_details` VALUES ('132', 'CaeMeS', '::1', 'Windows 10', 'Chrome', '2017-03-10 13:01:36', null);
INSERT INTO `login_details` VALUES ('133', 'CaeMeS', '::1', 'Windows 10', 'Chrome', '2017-03-12 13:51:45', null);
INSERT INTO `login_details` VALUES ('134', 'CaeMeS', '::1', 'Windows 10', 'Chrome', '2017-03-12 16:10:05', null);
INSERT INTO `login_details` VALUES ('135', 'CaeMeS', '::1', 'Windows 10', 'Chrome', '2017-03-12 16:18:11', null);
INSERT INTO `login_details` VALUES ('136', 'CaeMeS', '::1', 'Windows 10', 'Chrome', '2017-03-13 09:59:12', null);
INSERT INTO `login_details` VALUES ('137', 'admin', '::1', 'Windows 10', 'Chrome', '2017-03-13 10:00:36', null);
INSERT INTO `login_details` VALUES ('138', 'CaeMeS', '::1', 'Windows 10', 'Chrome', '2017-03-13 11:11:26', null);
INSERT INTO `login_details` VALUES ('139', 'admin', '::1', 'Windows 10', 'Chrome', '2017-03-13 11:13:10', null);
INSERT INTO `login_details` VALUES ('140', 'admin', '::1', 'Windows 10', 'Chrome', '2017-03-13 21:17:26', null);
INSERT INTO `login_details` VALUES ('141', 'CaeMeS', '::1', 'Windows 10', 'Chrome', '2017-03-13 21:19:39', null);
INSERT INTO `login_details` VALUES ('142', 'admin', '::1', 'Windows 10', 'Chrome', '2017-03-13 21:20:38', null);
INSERT INTO `login_details` VALUES ('143', 'admin', '::1', 'Windows 10', 'Chrome', '2017-03-19 13:35:49', null);
INSERT INTO `login_details` VALUES ('144', 'qwerty', '::1', 'Windows 10', 'Chrome', '2017-03-19 14:03:34', null);
INSERT INTO `login_details` VALUES ('145', 'admin', '::1', 'Windows 10', 'Chrome', '2017-03-19 14:03:42', null);
INSERT INTO `login_details` VALUES ('146', 'CaeMeS', '::1', 'Windows 10', 'Chrome', '2017-03-19 14:17:03', null);
INSERT INTO `login_details` VALUES ('147', 'CaeMeS', '::1', 'Windows 10', 'Chrome', '2017-03-19 14:29:33', null);
INSERT INTO `login_details` VALUES ('148', 'CaeMeS', '::1', 'Windows 10', 'Chrome', '2017-03-19 14:45:47', null);
INSERT INTO `login_details` VALUES ('149', 'admin', '::1', 'Windows 10', 'Chrome', '2017-03-19 14:52:02', null);
INSERT INTO `login_details` VALUES ('150', 'admin', '::1', 'Windows 10', 'Chrome', '2017-03-19 14:52:25', null);
INSERT INTO `login_details` VALUES ('151', 'admin', '::1', 'Windows 10', 'Chrome', '2017-03-19 14:57:04', null);
INSERT INTO `login_details` VALUES ('152', 'admin', '::1', 'Windows 10', 'Chrome', '2017-03-19 14:57:47', null);
INSERT INTO `login_details` VALUES ('153', 'admin', '::1', 'Windows 10', 'Chrome', '2017-03-21 11:29:26', null);
INSERT INTO `login_details` VALUES ('154', 'admin', '::1', 'Windows 10', 'Chrome', '2017-03-21 12:21:47', null);
INSERT INTO `login_details` VALUES ('155', 'admin', '::1', 'Windows 10', 'Chrome', '2017-03-21 12:23:59', null);
INSERT INTO `login_details` VALUES ('156', 'admin', '::1', 'Windows 10', 'Chrome', '2017-03-24 09:42:35', null);
INSERT INTO `login_details` VALUES ('157', 'CaeMeS', '::1', 'Windows 10', 'Chrome', '2017-03-24 09:43:09', null);
INSERT INTO `login_details` VALUES ('158', 'admin', '::1', 'Windows 10', 'Chrome', '2017-03-24 09:47:20', null);
INSERT INTO `login_details` VALUES ('159', 'CaeMeS', '::1', 'Windows 10', 'Chrome', '2017-03-24 09:47:43', null);
INSERT INTO `login_details` VALUES ('160', 'CaeMeS', '::1', 'Windows 10', 'Chrome', '2017-03-24 09:49:18', null);
INSERT INTO `login_details` VALUES ('161', 'admin', '::1', 'Windows 10', 'Chrome', '2017-03-24 09:49:33', null);
INSERT INTO `login_details` VALUES ('162', 'CaeMeS', '::1', 'Windows 10', 'Chrome', '2017-03-24 09:50:33', null);
INSERT INTO `login_details` VALUES ('163', 'CaeMeS', '::1', 'Windows 10', 'Chrome', '2017-03-24 09:51:10', null);
INSERT INTO `login_details` VALUES ('164', 'CaeMeS', '::1', 'Windows 10', 'Chrome', '2017-03-24 09:51:40', null);
INSERT INTO `login_details` VALUES ('165', 'admin', '::1', 'Windows 10', 'Chrome', '2017-03-24 11:23:43', null);

-- ----------------------------
-- Table structure for opinia
-- ----------------------------
DROP TABLE IF EXISTS `opinia`;
CREATE TABLE `opinia` (
  `id_opinii` int(5) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(30) NOT NULL,
  `tresc` varchar(180) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_komentarza` int(5) DEFAULT NULL,
  `id_kom_auto` int(5) DEFAULT NULL,
  PRIMARY KEY (`id_opinii`),
  KEY `Opinie_User` (`nazwa`),
  KEY `Opinie_Tekst` (`id_komentarza`),
  KEY `Opinia_Auto` (`id_kom_auto`),
  CONSTRAINT `Opinia_Auto` FOREIGN KEY (`id_kom_auto`) REFERENCES `auto` (`id_samochodu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Opinie_Tekst` FOREIGN KEY (`id_komentarza`) REFERENCES `tekst` (`id_tekstu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of opinia
-- ----------------------------
INSERT INTO `opinia` VALUES ('19', 'a@b.c', 'Ford Mustang GT random comment', '2017-01-25 19:21:08', null, '53');
INSERT INTO `opinia` VALUES ('20', 'a@b.c', 'Some test text comment', '2017-01-25 19:23:12', '29', null);
INSERT INTO `opinia` VALUES ('21', 'caemes', 'Some nice comment', '2017-01-25 19:37:12', '33', null);
INSERT INTO `opinia` VALUES ('22', 'caemes', 'Nice one!', '2017-01-25 19:37:23', null, '53');
INSERT INTO `opinia` VALUES ('23', 'caemes', 'Nice news you got here', '2017-01-25 19:39:40', '34', null);
INSERT INTO `opinia` VALUES ('24', 'caemes', 'Wow, that\'s nice', '2017-01-25 19:41:38', null, '54');
INSERT INTO `opinia` VALUES ('29', 'caemes', 'lkjhgf', '2017-01-26 10:11:19', null, '54');
INSERT INTO `opinia` VALUES ('30', 'qwerty', 'Awesome', '2017-01-27 15:57:55', null, '54');
INSERT INTO `opinia` VALUES ('31', 'caemes', '<noscript>', '2017-01-29 13:00:02', null, '54');
INSERT INTO `opinia` VALUES ('32', 'caemes', 'Nice', '2017-01-29 13:00:20', null, '54');
INSERT INTO `opinia` VALUES ('33', 'caemes', 'Dat is awesome!!!', '2017-01-29 13:24:41', null, '55');
INSERT INTO `opinia` VALUES ('34', 'caemes', 'winwekjfnaewfnluwifn3,f\'p3f[l-3i', '2017-01-29 13:30:01', '35', null);
INSERT INTO `opinia` VALUES ('35', 'caemes', '<noscript>', '2017-01-29 14:04:41', '35', null);
INSERT INTO `opinia` VALUES ('36', 'caemes', '<noscript>', '2017-01-30 10:22:48', null, '55');
INSERT INTO `opinia` VALUES ('37', 'qwerty3', '\'\'', '2017-02-04 13:13:16', null, '55');
INSERT INTO `opinia` VALUES ('38', 'qwerty3', 'lol<noscript>`;\'\'\'', '2017-02-04 13:13:28', null, '55');
INSERT INTO `opinia` VALUES ('40', 'qwerty', 'Gotcha', '2017-03-03 12:07:53', null, '53');
INSERT INTO `opinia` VALUES ('41', 'qwerty', 'Gotcha', '2017-03-03 12:14:07', null, '53');
INSERT INTO `opinia` VALUES ('51', 'CaeMeS', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2017-03-10 12:55:22', null, '55');
INSERT INTO `opinia` VALUES ('52', 'CaeMeS', 's', '2017-03-10 12:56:28', null, '55');
INSERT INTO `opinia` VALUES ('53', 'CaeMeS', 'max-width: 100px;max-width: 100px;max-width: 100px;max-width: 100px;max-width: 100px;max-width: 100px;', '2017-03-10 12:57:13', null, '55');
INSERT INTO `opinia` VALUES ('54', 'CaeMeS', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2017-03-10 12:57:18', null, '55');
INSERT INTO `opinia` VALUES ('55', 'CaeMeS', 'Nicccwwwww', '2017-03-12 14:49:50', '33', null);
INSERT INTO `opinia` VALUES ('56', 'CaeMeS', 'Nicccwwwww', '2017-03-12 14:49:54', '33', null);

-- ----------------------------
-- Table structure for tekst
-- ----------------------------
DROP TABLE IF EXISTS `tekst`;
CREATE TABLE `tekst` (
  `id_tekstu` int(5) NOT NULL AUTO_INCREMENT,
  `data_publikacji` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `temat` varchar(50) NOT NULL,
  `kategoria` enum('HISTORY','FIRSTLOOK','TEST','NEWS') NOT NULL,
  `intro` varchar(291) NOT NULL,
  `tresc` varchar(5820) NOT NULL,
  `id_tworcy` int(5) NOT NULL,
  PRIMARY KEY (`id_tekstu`),
  KEY `text-user` (`id_tworcy`),
  CONSTRAINT `text-user` FOREIGN KEY (`id_tworcy`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tekst
-- ----------------------------
INSERT INTO `tekst` VALUES ('29', '2017-01-25 19:22:38', 'Random test article', 'TEST', 'Random intro. Random intro. Random intro. Random intro. Random intro. Random intro. Random intro. Random intro. Random intro. Random intro. Random intro. Random intro. Random intro. Random intro. Random intro. Random intro. Random intro. Random intro. Random intro. Random intro. ', 'Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text. Random test text.', '46');
INSERT INTO `tekst` VALUES ('33', '2017-01-25 19:35:19', 'Random first look article', 'FIRSTLOOK', 'First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. ', 'First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. First look txt. ', '46');
INSERT INTO `tekst` VALUES ('34', '2017-01-25 19:39:12', 'Random news article', 'NEWS', 'Who want some NEWS?', 'NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS ', '51');
INSERT INTO `tekst` VALUES ('35', '2017-03-12 14:48:04', 'History text tryout', 'HISTORY', '      abcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyz      ', '      abcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghi jklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyza bcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmn oprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefg \r\nhijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmno prqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzab cdefghijklmnoprqstuvwxyzabcdefg hijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstu  vwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdef  ghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcde  fghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxy   zabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijk lmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijk\r\nlmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklm\r\nnoprqstuvwxyzabcdefghijklmnoprqstu vw  xyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcd  fff  efghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefg hijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghij klmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabc defghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyza  bcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghi jklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyzabcdefghijklmnoprqstuvwxyz;;;;;;;;;;;;;;2e82hJQNfi73hfp9yr74yglWNVSV       ', '51');

-- ----------------------------
-- Table structure for tekst_archive
-- ----------------------------
DROP TABLE IF EXISTS `tekst_archive`;
CREATE TABLE `tekst_archive` (
  `id_txt_OLD` int(5) NOT NULL AUTO_INCREMENT,
  `idOLD` int(5) NOT NULL,
  `idtworcyOLD` int(5) NOT NULL,
  `tematOLD` varchar(50) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id_txt_OLD`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8
/*!50100 PARTITION BY KEY (id_txt_OLD)
PARTITIONS 10 */;

-- ----------------------------
-- Records of tekst_archive
-- ----------------------------
INSERT INTO `tekst_archive` VALUES ('2', '28', '46', 'geg', '2017-01-24 16:18:34', '');
INSERT INTO `tekst_archive` VALUES ('4', '26', '46', 'Beginning of Ferrari', '2017-01-25 19:17:33', 'deleted');
INSERT INTO `tekst_archive` VALUES ('6', '30', '46', 'Random first look article', '2017-01-25 19:30:43', 'deleted');
INSERT INTO `tekst_archive` VALUES ('8', '31', '46', 'Random first look article', '2017-01-25 19:34:40', 'updated');
INSERT INTO `tekst_archive` VALUES ('10', '32', '46', 'Random first look article', '2017-01-25 19:35:03', 'deleted');
INSERT INTO `tekst_archive` VALUES ('12', '36', '54', 'Some history text', '2017-01-25 19:46:14', 'updated');
INSERT INTO `tekst_archive` VALUES ('14', '35', '51', 'History text tryout', '2017-01-29 13:29:12', 'updated');
INSERT INTO `tekst_archive` VALUES ('16', '35', '51', 'History text tryout', '2017-01-29 13:29:38', 'updated');
INSERT INTO `tekst_archive` VALUES ('18', '37', '51', 'dddd', '2017-03-10 11:18:17', 'deleted');
INSERT INTO `tekst_archive` VALUES ('20', '37', '51', '<script>     function auto_grow(element)          ', '2017-03-12 14:52:26', 'deleted');
INSERT INTO `tekst_archive` VALUES ('1', '27', '46', 'PrÃ³ba ogniowa', '2017-01-24 16:11:21', '');
INSERT INTO `tekst_archive` VALUES ('3', '26', '46', 'Beginning of Ferrari', '2017-01-25 17:38:58', 'updated');
INSERT INTO `tekst_archive` VALUES ('5', '25', '46', 'Test text 001', '2017-01-25 19:17:37', 'deleted');
INSERT INTO `tekst_archive` VALUES ('7', '31', '46', 'Random first look article', '2017-01-25 19:33:38', 'updated');
INSERT INTO `tekst_archive` VALUES ('9', '31', '46', 'Random first look article', '2017-01-25 19:34:45', 'deleted');
INSERT INTO `tekst_archive` VALUES ('11', '35', '54', 'Random history txt', '2017-01-25 19:45:28', 'deleted');
INSERT INTO `tekst_archive` VALUES ('13', '35', '51', 'History text tryout', '2017-01-29 13:29:03', 'updated');
INSERT INTO `tekst_archive` VALUES ('15', '35', '51', 'History text tryout', '2017-01-29 13:29:26', 'updated');
INSERT INTO `tekst_archive` VALUES ('17', '35', '51', 'History text tryout', '2017-01-30 10:28:25', 'updated');
INSERT INTO `tekst_archive` VALUES ('19', '35', '51', 'History text tryout', '2017-03-12 14:48:04', 'updated');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id_user` int(5) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `password` varchar(150) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `imie` varchar(15) DEFAULT NULL,
  `nazwisko` varchar(20) DEFAULT NULL,
  `gender` enum('other','female','male') DEFAULT 'male',
  `data_utworzenia` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletecomment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('46', 'a@b.c', 'f08ca31ea0ab4d07dcc3a5ec5f8d63dc418872e9', '1852148371584e618d1049b2.69712996', 'Random', 'Guy', 'male', '2017-01-27 15:50:18', null);
INSERT INTO `user` VALUES ('47', 'jsmiith@yahoo.com', '1ef227902056fbb39d53b9a5eccc10726820231f', '455188182587b96f7e675d9.87965619', 'John', 'Smith', 'male', '2017-01-15 16:35:20', null);
INSERT INTO `user` VALUES ('50', 'aafer', 'c44db6e86589c1bf7835bac8e2fedd67fc969df1', '1881144858820ad883d6c3.12049736', 'lol', 'omg', 'male', '2017-01-20 14:03:15', null);
INSERT INTO `user` VALUES ('51', 'CaeMeS', '96e2a58801f0d929d4884b26499b3872a62ee456', '10227799958822906718de3.83911267', 'Kamil', 'Szczepanski', 'male', '2017-01-30 10:33:49', null);
INSERT INTO `user` VALUES ('52', 'AbCdEf', 'd1571f7aed39a3ec5d39bd485aab4c49e3c30f4b', '5762727295888d6121df654.84166821', 'John', 'Doe', 'other', '2017-01-25 17:43:50', null);
INSERT INTO `user` VALUES ('53', 'Lolol', '1173b79ed112ab4e71346e323769660b7bcf1e86', '10760420155888e3441740a4.22773384', 'ff', 'ff', 'male', '2017-01-25 18:40:08', null);
INSERT INTO `user` VALUES ('62', 'qwerty3', 'a4d889bdd2ccaef186f512d794cb6e201f70daa6', '16808693265895c4f58b9ac1.62475989', 'asd\';\'`<noscrip', 'qwe', 'male', '2017-02-04 13:20:56', null);
INSERT INTO `user` VALUES ('66', 'admin', 'ecc2e0167393ab7344c27c6bdeb41da34bdcfdde', '72699030158c65fab29f5b7.07024730', 'admin', 'admin', 'other', '2017-03-13 10:00:27', null);

-- ----------------------------
-- Table structure for user_archive
-- ----------------------------
DROP TABLE IF EXISTS `user_archive`;
CREATE TABLE `user_archive` (
  `id_usrarch` int(5) NOT NULL AUTO_INCREMENT,
  `iduserOLD` int(5) NOT NULL,
  `loginOLD` varchar(20) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(15) NOT NULL,
  PRIMARY KEY (`id_usrarch`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8
/*!50100 PARTITION BY KEY (id_usrarch)
PARTITIONS 10 */;

-- ----------------------------
-- Records of user_archive
-- ----------------------------
INSERT INTO `user_archive` VALUES ('2', '55', 'abd', '2017-01-27 14:18:55', 'deleted');
INSERT INTO `user_archive` VALUES ('4', '54', 'Logmein', '2017-01-27 15:54:32', 'deleted');
INSERT INTO `user_archive` VALUES ('6', '51', 'caemes', '2017-01-28 12:36:37', 'updated');
INSERT INTO `user_archive` VALUES ('8', '51', 'caemes', '2017-01-28 12:36:49', 'updated');
INSERT INTO `user_archive` VALUES ('10', '51', 'caemes', '2017-01-30 10:21:56', 'updated');
INSERT INTO `user_archive` VALUES ('12', '54', 'aniewiarowski', '2017-01-31 11:37:04', 'deleted');
INSERT INTO `user_archive` VALUES ('14', '61', 'qwerty3', '2017-01-31 11:51:55', 'deleted');
INSERT INTO `user_archive` VALUES ('16', '59', 'qwerty1', '2017-01-31 11:52:02', 'deleted');
INSERT INTO `user_archive` VALUES ('18', '62', 'qwerty1', '2017-01-31 11:58:57', 'deleted');
INSERT INTO `user_archive` VALUES ('20', '59', 'qwerty12', '2017-02-04 13:03:19', 'deleted');
INSERT INTO `user_archive` VALUES ('22', '57', 'abcdefg', '2017-02-04 13:03:24', 'deleted');
INSERT INTO `user_archive` VALUES ('24', '62', 'qwerty3', '2017-02-04 13:12:32', 'updated');
INSERT INTO `user_archive` VALUES ('26', '62', 'qwerty3', '2017-02-04 13:12:49', 'updated');
INSERT INTO `user_archive` VALUES ('28', '62', 'qwerty3', '2017-02-04 13:13:09', 'updated');
INSERT INTO `user_archive` VALUES ('30', '62', 'qwerty3', '2017-02-04 13:20:35', 'updated');
INSERT INTO `user_archive` VALUES ('32', '62', 'qwerty3', '2017-02-04 13:20:56', 'updated');
INSERT INTO `user_archive` VALUES ('34', '64', 'qwerty31', '2017-02-06 10:37:57', 'deleted');
INSERT INTO `user_archive` VALUES ('36', '66', 'Loginv4', '2017-03-03 13:09:13', 'deleted');
INSERT INTO `user_archive` VALUES ('38', '61', 'qwerty2', '2017-03-13 11:08:08', 'deleted');
INSERT INTO `user_archive` VALUES ('40', '63', 'qwerty', '2017-03-19 14:13:06', 'updated');
INSERT INTO `user_archive` VALUES ('42', '71', 'qwerty', '2017-03-20 21:40:13', 'deleted');
INSERT INTO `user_archive` VALUES ('44', '72', 'qwerty', '2017-03-21 11:32:23', 'updated');
INSERT INTO `user_archive` VALUES ('1', '55', 'abc', '2017-01-27 14:18:49', 'updated');
INSERT INTO `user_archive` VALUES ('3', '46', 'a@b.c', '2017-01-27 15:50:18', 'updated');
INSERT INTO `user_archive` VALUES ('5', '56', 'qwerty', '2017-01-27 15:58:18', 'deleted');
INSERT INTO `user_archive` VALUES ('7', '51', 'caemes', '2017-01-28 12:36:43', 'updated');
INSERT INTO `user_archive` VALUES ('9', '51', 'caemes', '2017-01-30 10:21:49', 'updated');
INSERT INTO `user_archive` VALUES ('11', '51', 'caemes', '2017-01-30 10:33:49', 'updated');
INSERT INTO `user_archive` VALUES ('13', '56', 'qwerty', '2017-01-31 11:44:48', 'deleted');
INSERT INTO `user_archive` VALUES ('15', '60', 'qwerty2', '2017-01-31 11:51:58', 'deleted');
INSERT INTO `user_archive` VALUES ('17', '63', 'qwerty2', '2017-01-31 11:58:53', 'deleted');
INSERT INTO `user_archive` VALUES ('19', '58', 'qwerty', '2017-01-31 11:59:00', 'deleted');
INSERT INTO `user_archive` VALUES ('21', '58', 'qwerty11', '2017-02-04 13:03:21', 'deleted');
INSERT INTO `user_archive` VALUES ('23', '55', 'aniewiarowski', '2017-02-04 13:03:25', 'deleted');
INSERT INTO `user_archive` VALUES ('25', '62', 'qwerty3', '2017-02-04 13:12:41', 'updated');
INSERT INTO `user_archive` VALUES ('27', '62', 'qwerty3', '2017-02-04 13:12:55', 'updated');
INSERT INTO `user_archive` VALUES ('29', '62', 'qwerty3', '2017-02-04 13:16:49', 'updated');
INSERT INTO `user_archive` VALUES ('31', '62', 'qwerty3', '2017-02-04 13:20:45', 'updated');
INSERT INTO `user_archive` VALUES ('33', '62', 'qwerty3', '2017-02-04 13:21:05', 'updated');
INSERT INTO `user_archive` VALUES ('35', '63', 'qwerty', '2017-03-03 12:07:36', 'updated');
INSERT INTO `user_archive` VALUES ('37', '65', 'artur', '2017-03-13 10:52:30', 'deleted');
INSERT INTO `user_archive` VALUES ('39', '60', 'qwerty1', '2017-03-19 13:49:55', 'deleted');
INSERT INTO `user_archive` VALUES ('41', '63', 'qwerty', '2017-03-19 14:56:44', 'deleted');
INSERT INTO `user_archive` VALUES ('43', '72', 'qwerty', '2017-03-21 11:32:11', 'updated');
INSERT INTO `user_archive` VALUES ('45', '72', 'qwerty', '2017-03-21 11:32:42', 'deleted');

-- ----------------------------
-- Event structure for delete_account
-- ----------------------------
DROP EVENT IF EXISTS `delete_account`;
DELIMITER ;;
CREATE DEFINER=``@`localhost` EVENT `delete_account` ON SCHEDULE EVERY 1 DAY STARTS '2017-03-10 00:00:00' ON COMPLETION PRESERVE ENABLE DO delete from USER
where login = ( select user 
								from LOGIN_DETAILS
								where MAX(time) < (DATE_SUB(CURDATE(), INTERVAL 1 MONTH)))
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `AUTO_UPDATE`;
DELIMITER ;;
CREATE TRIGGER `AUTO_UPDATE` AFTER UPDATE ON `auto` FOR EACH ROW BEGIN
INSERT INTO AUTO_ARCHIVE
( iduserOLD, idOLD, markaOLD, modelOLD, type)
VALUES
( OLD.id_user, OLD.id_samochodu, OLD.marka, OLD.model, 'updated');
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `AUTO_DELETE`;
DELIMITER ;;
CREATE TRIGGER `AUTO_DELETE` AFTER DELETE ON `auto` FOR EACH ROW BEGIN
INSERT INTO AUTO_ARCHIVE
( iduserOLD, idOLD, markaOLD, modelOLD, type)
VALUES
( OLD.id_user, OLD.id_samochodu, OLD.marka, OLD.model, 'deleted');
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tekstupdate`;
DELIMITER ;;
CREATE TRIGGER `tekstupdate` AFTER UPDATE ON `tekst` FOR EACH ROW BEGIN
INSERT INTO TEKST_ARCHIVE
( idOLD, idtworcyOLD, tematOLD, type)
VALUES
( OLD.id_tekstu, OLD.id_tworcy, OLD.temat, 'updated');
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tekstdelete`;
DELIMITER ;;
CREATE TRIGGER `tekstdelete` AFTER DELETE ON `tekst` FOR EACH ROW BEGIN
INSERT INTO TEKST_ARCHIVE
( idOLD, idtworcyOLD, tematOLD, type)
VALUES
( OLD.id_tekstu, OLD.id_tworcy, OLD.temat, 'deleted');
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `userupdate`;
DELIMITER ;;
CREATE TRIGGER `userupdate` AFTER UPDATE ON `user` FOR EACH ROW BEGIN
INSERT INTO USER_ARCHIVE
( iduserOLD, loginOLD, type )
VALUES
( OLD.id_user, OLD.login, 'updated');
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `userdelete`;
DELIMITER ;;
CREATE TRIGGER `userdelete` AFTER DELETE ON `user` FOR EACH ROW BEGIN
INSERT INTO USER_ARCHIVE
( iduserOLD, loginOLD, type )
VALUES
( OLD.id_user, OLD.login, 'deleted');
END
;;
DELIMITER ;
