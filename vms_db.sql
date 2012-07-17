/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50511
Source Host           : localhost:3306
Source Database       : vms_db

Target Server Type    : MYSQL
Target Server Version : 50511
File Encoding         : 65001

Date: 2012-07-17 12:02:46
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `contact`
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO `contact` VALUES ('49', 'ABC Street', 'bkite@x.com', 'Baddie', 'Kite', '+61-0404000000', 'Mr.');
INSERT INTO `contact` VALUES ('50', 'XYZ Street', 'nbango@y.com', 'Nuke', 'Bango', '+61-0404000001', 'Ms.');

-- ----------------------------
-- Table structure for `t_counsel`
-- ----------------------------
DROP TABLE IF EXISTS `t_counsel`;
CREATE TABLE `t_counsel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `end_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `driver_id` bigint(20) DEFAULT NULL,
  `users_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF4A9456A4F961CDE` (`driver_id`),
  KEY `FKF4A9456A4004E7A1` (`users_id`),
  CONSTRAINT `FKF4A9456A4004E7A1` FOREIGN KEY (`users_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FKF4A9456A4F961CDE` FOREIGN KEY (`driver_id`) REFERENCES `t_driver` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_counsel
-- ----------------------------
INSERT INTO `t_counsel` VALUES ('1', '2012-05-03 20:30:53', 'sdfasdf', '2012-05-02 15:30:21', '3', '1');
INSERT INTO `t_counsel` VALUES ('2', '2012-05-24 00:00:00', 'asdfasdf', '2012-05-02 00:00:00', '2', '1');
INSERT INTO `t_counsel` VALUES ('3', '2012-05-24 00:00:00', 'zzzzzz', '2012-05-02 00:00:00', '4', '1');
INSERT INTO `t_counsel` VALUES ('4', '2012-05-24 00:00:00', 'ggggg', '2012-05-02 00:00:00', '1', '1');
INSERT INTO `t_counsel` VALUES ('5', '2012-07-11 03:30:50', '123123', '2012-07-04 02:00:00', '2', '1');
INSERT INTO `t_counsel` VALUES ('7', '2012-07-18 06:00:00', '李靖什么的', '2012-07-01 02:30:00', '23', '1');
INSERT INTO `t_counsel` VALUES ('8', '2012-07-14 03:30:00', 'asdfasdf', '2012-07-11 02:00:00', '4', '5');
INSERT INTO `t_counsel` VALUES ('9', '2012-07-13 02:00:00', 'dddddddd', '2012-07-05 01:30:00', '9', '6');

-- ----------------------------
-- Table structure for `t_department`
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `FKEFEB87FD56BBBE46` (`parent_id`),
  CONSTRAINT `FKEFEB87FD56BBBE46` FOREIGN KEY (`parent_id`) REFERENCES `t_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES ('1', 'department_1', null);
INSERT INTO `t_department` VALUES ('2', 'department_1_1', '1');
INSERT INTO `t_department` VALUES ('3', 'department_2', null);
INSERT INTO `t_department` VALUES ('4', 'department_3', null);
INSERT INTO `t_department` VALUES ('5', 'department_4', null);
INSERT INTO `t_department` VALUES ('6', 'department_4_1', '5');
INSERT INTO `t_department` VALUES ('7', 'department_1_2', '1');
INSERT INTO `t_department` VALUES ('8', 'department_4_2', '5');

-- ----------------------------
-- Table structure for `t_device`
-- ----------------------------
DROP TABLE IF EXISTS `t_device`;
CREATE TABLE `t_device` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action` text,
  `alive` bit(1) NOT NULL,
  `host` varchar(255) DEFAULT NULL,
  `device_key` varchar(255) DEFAULT NULL,
  `misc` text,
  `name` varchar(255) DEFAULT NULL,
  `server_urls` text,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_key` (`device_key`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_device
-- ----------------------------
INSERT INTO `t_device` VALUES ('4', '', '', '203.117.40.138', '2', '{\"port\":80,\"login\":\"root\",\"password\":\"kaisquare7\",\"record_server\":\"http://203.116.12.44:50000\",\"internal_host\":\"\",\"address\":\"408868\",\"record_flag\":true,\"cloud_recording_server\":\"\"}', 'SHSembawang', 'http://www.baidu.com', 'online');
INSERT INTO `t_device` VALUES ('8', '', '', '203.117.251.162', '1', '{\"port\":2000,\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\"}', 'Planet-TPY', 'http://www.baidu.com', 'online');
INSERT INTO `t_device` VALUES ('11', '', '\0', '203.117.250.66', '3', '{\"port\":2000,\"record_server\":\"http://203.116.12.44:50000\",\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\"}', 'Star5-Jp1', 'http://www.baidu.com', 'online');
INSERT INTO `t_device` VALUES ('12', '', '', '203.117.251.156', '4', '{\"port\":2000,\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\"}', 'Star5-Jp2', 'http://www.baidu.com', 'online');
INSERT INTO `t_device` VALUES ('18', '', '\0', '203.117.250.134', '5', '{\"port\":2000,\"login\":\"\",\"password\":\"\",\"internal_host\":\"\",\"address\":\"\",\"cloud_recording_server\":\"\"}', 'Star5-Compass', 'http://www.baidu.com', 'online');
INSERT INTO `t_device` VALUES ('19', '', '', '203.117.40.133', '6', '{\"port\":80,\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\"}', 'SHPlazaSingapura', 'http://www.baidu.com', 'online');
INSERT INTO `t_device` VALUES ('31', null, '\0', '203.117.250.66', '001190251', '{\"password\":\"7473\",\"supportedtasktypes\":[\"live-image\",\"ptz-panleft\",\"ptz-panright\",\"ptz-tiltup\",\"ptz-tiltdown\",\"ptz-movehome\"],\"port\":0,\"record_server\":\"\",\"internal_host\":\"\",\"address\":\"33 Ubi Avenue 3\",\"login\":\"\",\"record_flag\":false,\"cloud_recording_server\":\"\"}', 'Office Juzz4Lite camera', 'http://www.baidu.com', 'online');
INSERT INTO `t_device` VALUES ('32', null, '', '203.117.250.134', '001014182', '{\"password\":\"ipcam\",\"supportedtasktypes\":[\"live-image\",\"ptz-panleft\",\"ptz-panright\",\"ptz-tiltup\",\"ptz-tiltdown\",\"ptz-movehome\"],\"port\":0,\"record_server\":\"\",\"internal_host\":\"\",\"address\":\"\",\"login\":\"\",\"record_flag\":false,\"cloud_recording_server\":\"\"}', 'Fish tank Juzz4Lite demo camera', 'http://www.baidu.com', 'online');
INSERT INTO `t_device` VALUES ('58', null, '\0', '203.117.250.134', 'B5143913', '{\"record_server\":\"\",\"record_flag\":false,\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"port\":0,\"cloud_recording_server\":\"\"}', 'B5143913 (Wifi)', 'http://www.baidu.com', 'online');
INSERT INTO `t_device` VALUES ('59', null, '\0', '203.117.250.134', 'B5155298', '{\"record_server\":\"\",\"record_flag\":false,\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"port\":0,\"cloud_recording_server\":\"\"}', 'B5155298 (Wifi)', 'http://www.baidu.com', 'online');
INSERT INTO `t_device` VALUES ('60', null, '\0', '203.117.250.134', '001001003', '{\"port\":80,\"record_flag\":false,\"password\":\"1234\",\"address\":\"somerset mrt singapore\",\"record_server\":\"\",\"internal_host\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\"}', 'Juzz4Lite Demo 2', 'http://www.baidu.com', 'online');
INSERT INTO `t_device` VALUES ('86', null, '\0', '203.117.250.134', '001067110', '{\"record_server\":\"\",\"record_flag\":false,\"internal_host\":\"\",\"password\":\"1234\",\"address\":\"\",\"login\":\"001067110\",\"port\":0,\"cloud_recording_server\":\"\"}', 'Taiwan Juzz4Lite demo camera', 'http://www.baidu.com', 'online');
INSERT INTO `t_device` VALUES ('89', null, '', '203.117.250.134', 'B5143706', '{\"record_server\":\"\",\"record_flag\":false,\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"port\":0,\"cloud_recording_server\":\"\"}', 'B5143706 (3G)', null, 'online');
INSERT INTO `t_device` VALUES ('91', null, '\0', '203.117.250.134', 'amk', '{\"port\":0,\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\"}', 'NHG Ang Mo Kio Polyclinic', null, 'online');
INSERT INTO `t_device` VALUES ('92', null, '', '203.117.250.134', 'bbk', '{\"port\":0,\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\"}', 'NHG Bukit Batok Polyclinic', null, 'online');
INSERT INTO `t_device` VALUES ('93', null, '\0', '203.117.250.134', 'cck', '{\"port\":0,\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\"}', 'NHG Choa Chu Kang Polyclinic', null, 'online');
INSERT INTO `t_device` VALUES ('94', null, '', '203.117.250.134', 'clm', '{\"port\":0,\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\"}', 'NHG Clementi Polyclinic', null, 'online');
INSERT INTO `t_device` VALUES ('95', null, '\0', '203.117.250.134', 'hou', '{\"port\":0,\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\"}', 'NHG Hougang Polyclinic', null, 'online');
INSERT INTO `t_device` VALUES ('96', null, '', '203.117.250.134', 'jur', '{\"port\":0,\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\"}', 'NHG Jurong Polyclinic', null, 'online');
INSERT INTO `t_device` VALUES ('97', null, '\0', '203.117.250.134', 'tpy', '{\"port\":0,\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\"}', 'NHG Toa Payoh Polyclinic', null, 'online');
INSERT INTO `t_device` VALUES ('98', null, '', '203.117.250.134', 'wds', '{\"port\":0,\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\"}', 'NHG Woodlands Polyclinic', null, 'online');
INSERT INTO `t_device` VALUES ('99', null, '\0', '203.117.250.134', 'yis', '{\"port\":0,\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\"}', 'NHG Yishun Polyclinic', null, 'online');
INSERT INTO `t_device` VALUES ('116', null, '\0', '203.117.250.134', '001080121', '{\"record_flag\":false,\"password\":\"1234\",\"address\":\"\",\"port\":111,\"record_server\":\"\",\"internal_host\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\"}', '001080121', null, 'online');
INSERT INTO `t_device` VALUES ('117', null, '', '203.117.250.134', '001015205', '{\"record_flag\":true,\"password\":\"1234\",\"address\":\"\",\"port\":0,\"record_server\":\"\",\"internal_host\":\"3123\",\"login\":\"13\",\"cloud_recording_server\":\"\"}', '001015205', null, 'online');
INSERT INTO `t_device` VALUES ('126', null, '\0', '203.117.250.134', '001067116', '{\"record_server\":\"\",\"record_flag\":false,\"internal_host\":\"\",\"password\":\"ipcam\",\"address\":\"\",\"login\":\"001067116\",\"port\":0,\"cloud_recording_server\":\"\"}', 'Thailand Juzz4Lite demo camera', null, 'online');
INSERT INTO `t_device` VALUES ('136', null, '', '203.117.250.134', '4799', '{\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\",\"port\":0}', 'Sentosa: View from Sentosa Gateway (Towards Sentosa)', null, 'online');
INSERT INTO `t_device` VALUES ('137', null, '\0', '203.117.250.134', '1003', '{\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\",\"port\":0}', 'KPE: View from KPE/PIE', null, 'online');
INSERT INTO `t_device` VALUES ('138', null, '', '203.117.250.134', '4706', '{\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\",\"port\":0}', 'AYE: Near NUS (Towards Tuas)', null, 'online');
INSERT INTO `t_device` VALUES ('139', null, '', '203.117.250.134', '1702', '{\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\",\"port\":0}', 'CTE: Braddell Flyover (Towards SLE) ', null, 'online');
INSERT INTO `t_device` VALUES ('140', null, '\0', '203.117.250.134', '5799', '{\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\",\"port\":0}', 'PIE: Woodsville Flyover (Towards Changi)', null, 'online');
INSERT INTO `t_device` VALUES ('141', null, '', '203.117.250.134', '2705', '{\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\",\"port\":0}', 'BKE: Diary Farm Flyover (Towards PIE) ', null, 'online');
INSERT INTO `t_device` VALUES ('142', null, '\0', '203.117.250.134', '3798', '{\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\",\"port\":0}', 'ECP: Benjamin Sheares Bridge', null, 'online');
INSERT INTO `t_device` VALUES ('143', null, '', '203.117.250.134', '9701', '{\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\",\"port\":0}', 'SLE: Lentor Flyover (Towards TPE) ', null, 'online');
INSERT INTO `t_device` VALUES ('144', null, '\0', '203.117.250.134', '7791', '{\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\",\"port\":0}', 'TPE: Upper Changi Flyover (Towards PIE)', null, 'online');
INSERT INTO `t_device` VALUES ('145', null, '\0', '203.117.250.134', '8701', '{\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\",\"port\":0}', 'KJE: Choa Chu Kang (Towards PIE)', null, 'online');

-- ----------------------------
-- Table structure for `t_driver`
-- ----------------------------
DROP TABLE IF EXISTS `t_driver`;
CREATE TABLE `t_driver` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `fleet_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `number` (`number`),
  KEY `FK6494EA5314A2A29E` (`department_id`),
  KEY `FK6494EA53116C3656` (`fleet_id`),
  CONSTRAINT `FK6494EA53116C3656` FOREIGN KEY (`fleet_id`) REFERENCES `t_fleet` (`id`),
  CONSTRAINT `FK6494EA5314A2A29E` FOREIGN KEY (`department_id`) REFERENCES `t_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_driver
-- ----------------------------
INSERT INTO `t_driver` VALUES ('1', 'TEST11111111', 'jack', '74689', '7', '11');
INSERT INTO `t_driver` VALUES ('2', '222asdfasfdsf', 'tangseng', '74652', '7', '11');
INSERT INTO `t_driver` VALUES ('3', '', 'zhulaoer', '74631', '2', null);
INSERT INTO `t_driver` VALUES ('4', 'jlk;jhkluy', 'xiaobai', '74571', '2', '2');
INSERT INTO `t_driver` VALUES ('8', 'asdf', 'xiaohei', '74538', '4', null);
INSERT INTO `t_driver` VALUES ('9', 'sadf', 'xiaoji', '74498', '4', '3');
INSERT INTO `t_driver` VALUES ('10', 'sf', 'xiaozhu', '74484', '6', '3');
INSERT INTO `t_driver` VALUES ('11', 'sdf', 'dahei', '74483', '6', '3');
INSERT INTO `t_driver` VALUES ('12', 'sdfs', 'dage', '74482', '7', null);
INSERT INTO `t_driver` VALUES ('13', 'dfsdfs', 'lixiaolong', '74423', '7', null);
INSERT INTO `t_driver` VALUES ('14', 'dfs', 'longwu', '74353', '8', null);
INSERT INTO `t_driver` VALUES ('15', 'df', 'zhanghanyun', '74291', '8', null);
INSERT INTO `t_driver` VALUES ('16', 'xv', 'chenglong', '74279', '2', null);
INSERT INTO `t_driver` VALUES ('17', 'xvx', 'shijun', '74270', '2', '2');
INSERT INTO `t_driver` VALUES ('18', 'xvxv', 'xiaodi', '74228', '3', null);
INSERT INTO `t_driver` VALUES ('19', 'xvxv', 'zhangtianhan', '74215', '3', null);
INSERT INTO `t_driver` VALUES ('20', 'xvxvx', 'longhaitian', '74106', '4', null);
INSERT INTO `t_driver` VALUES ('21', 'xcvsdf', 'husun', '74078', '4', null);
INSERT INTO `t_driver` VALUES ('22', 'xvxv', 'menghaoran', '73870', '6', null);
INSERT INTO `t_driver` VALUES ('23', 'sdf', 'lijing', '73859', '7', null);
INSERT INTO `t_driver` VALUES ('24', 'hdfh', 'lining', '73662', '8', null);
INSERT INTO `t_driver` VALUES ('26', 'heihei', 'fuckyourmm', '74690', null, null);

-- ----------------------------
-- Table structure for `t_driver_report`
-- ----------------------------
DROP TABLE IF EXISTS `t_driver_report`;
CREATE TABLE `t_driver_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `driving_time` float DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `high_way_max_speed` float DEFAULT NULL,
  `idling` bigint(20) NOT NULL,
  `non_high_way_max_speed` float DEFAULT NULL,
  `service_number` varchar(255) DEFAULT NULL,
  `speeding_count_on_high_way` bigint(20) DEFAULT NULL,
  `speeding_count` bigint(20) DEFAULT NULL,
  `speeding_total` bigint(20) DEFAULT NULL,
  `speeding_duration_on_high_way` float DEFAULT NULL,
  `speeding_duration_total` float DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `sudden_acceleration_near_bus_stop` bigint(20) DEFAULT NULL,
  `sudden_acceleration` bigint(20) DEFAULT NULL,
  `sudden_acceleration_total` bigint(20) DEFAULT NULL,
  `sudden_brake_near_bus_stop` bigint(20) DEFAULT NULL,
  `sudden_brake` bigint(20) DEFAULT NULL,
  `sudden_brake_total` bigint(20) DEFAULT NULL,
  `sudden_lane_change_near_bus_stop` bigint(20) DEFAULT NULL,
  `sudden_lane_change_total` bigint(20) DEFAULT NULL,
  `sudden_left_turn_near_bus_stop` bigint(20) DEFAULT NULL,
  `sudden_left_turn` bigint(20) DEFAULT NULL,
  `sudden_left_turn_total` bigint(20) DEFAULT NULL,
  `sudden_right_turn_near_bus_stop` bigint(20) DEFAULT NULL,
  `sudden_right_turn` bigint(20) DEFAULT NULL,
  `sudden_right_turn_total` bigint(20) DEFAULT NULL,
  `time_type` varchar(255) DEFAULT NULL,
  `driver_id` bigint(20) DEFAULT NULL,
  `vehicle_id` bigint(20) DEFAULT NULL,
  `performance_index` bigint(20) DEFAULT '0',
  `total` bigint(20) NOT NULL,
  `highest_performance_index` bigint(20) DEFAULT NULL,
  `lowest_performance_index` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF7ADB4A04F961CDE` (`driver_id`),
  KEY `FKF7ADB4A0CF7D1A96` (`vehicle_id`),
  CONSTRAINT `FKF7ADB4A04F961CDE` FOREIGN KEY (`driver_id`) REFERENCES `t_driver` (`id`),
  CONSTRAINT `FKF7ADB4A0CF7D1A96` FOREIGN KEY (`vehicle_id`) REFERENCES `t_vehicle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1527 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_driver_report
-- ----------------------------
INSERT INTO `t_driver_report` VALUES ('1329', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '1', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1330', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '2', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1331', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '3', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1332', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '4', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1333', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '8', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1334', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '9', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1335', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '10', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1336', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '11', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1337', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '12', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1338', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '13', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1339', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '14', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1340', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '15', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1341', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '16', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1342', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '17', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1343', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '18', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1344', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '19', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1345', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '20', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1346', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '21', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1347', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '22', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1348', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '23', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1349', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '24', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1350', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '26', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1351', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '1', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1352', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '1', '1', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '2', null, '96', '1', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1353', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '3', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1354', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '1', '1', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '4', null, '94', '1', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1355', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '8', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1356', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '9', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1357', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '10', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1358', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '11', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1359', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '12', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1360', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '13', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1361', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '14', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1362', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '15', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1363', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '16', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1364', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', 'weekly', '17', null, '98', '1', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1365', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', 'weekly', '18', null, '98', '1', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1366', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '19', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1367', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '20', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1368', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '21', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1369', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '22', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1370', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '23', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1371', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '24', null, '98', '1', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1372', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '26', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1373', '399397', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '1', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1374', '748627', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '2', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1375', '161855', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '3', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1376', '1285060', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '4', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1377', '248270', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '8', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1378', '773877', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '9', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1379', '1457890', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '10', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1380', '1198700', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '11', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1381', '147512', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '12', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1382', '680323', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '13', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1383', '75535', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '14', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1384', '2581140', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '15', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1385', '1889950', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '16', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1386', '2062760', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '17', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1387', '593962', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '18', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1388', '766769', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '19', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1389', '1976380', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '20', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1390', '0', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '21', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1391', '0', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '22', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1392', '680397', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '23', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1393', '2045550', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '24', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1394', '0', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '26', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1395', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '1', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1396', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '2', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1397', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '3', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1398', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '4', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1399', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '8', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1400', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '9', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1401', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '10', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1402', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '11', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1403', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '12', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1404', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '13', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1405', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '14', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1406', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '15', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1407', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '16', null, '98', '1', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1408', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '17', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1409', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '18', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1410', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '19', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1411', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '20', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1412', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '21', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1413', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '22', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1414', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '1', '1', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '23', null, '96', '1', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1415', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '24', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1416', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '26', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1417', '0', '2012-07-12 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-12 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '1', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1418', '0', '2012-07-12 23:59:59', '0', '0', '0', '', '0', '1', '1', '0', '0', '2012-07-12 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '2', null, '96', '1', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1419', '0', '2012-07-12 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-12 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '3', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1420', '0', '2012-07-12 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-12 00:00:00', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '4', null, '98', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1421', '0', '2012-07-12 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-12 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '8', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1422', '0', '2012-07-12 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-12 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '9', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1423', '0', '2012-07-12 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-12 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '10', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1424', '0', '2012-07-12 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-12 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '11', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1425', '0', '2012-07-12 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-12 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '12', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1426', '0', '2012-07-12 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-12 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '13', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1427', '0', '2012-07-12 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-12 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '14', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1428', '0', '2012-07-12 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-12 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '15', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1429', '0', '2012-07-12 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-12 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '16', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1430', '0', '2012-07-12 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-12 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '17', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1431', '0', '2012-07-12 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-12 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '18', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1432', '0', '2012-07-12 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-12 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '19', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1433', '0', '2012-07-12 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-12 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '20', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1434', '0', '2012-07-12 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-12 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '21', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1435', '0', '2012-07-12 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-12 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '22', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1436', '0', '2012-07-12 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-12 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '23', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1437', '0', '2012-07-12 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-12 00:00:00', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '24', null, '98', '1', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1438', '0', '2012-07-12 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-12 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '26', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1439', '0', '2012-07-13 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-13 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '1', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1440', '0', '2012-07-13 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-13 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '2', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1441', '0', '2012-07-13 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-13 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '3', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1442', '0', '2012-07-13 23:59:59', '0', '0', '0', '', '0', '1', '1', '0', '0', '2012-07-13 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '4', null, '96', '1', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1443', '0', '2012-07-13 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-13 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '8', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1444', '0', '2012-07-13 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-13 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '9', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1445', '0', '2012-07-13 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-13 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '10', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1446', '0', '2012-07-13 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-13 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '11', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1447', '0', '2012-07-13 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-13 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '12', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1448', '0', '2012-07-13 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-13 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '13', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1449', '0', '2012-07-13 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-13 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '14', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1450', '0', '2012-07-13 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-13 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '15', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1451', '0', '2012-07-13 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-13 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '16', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1452', '0', '2012-07-13 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-13 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', 'daily', '17', null, '98', '1', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1453', '0', '2012-07-13 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-13 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '18', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1454', '0', '2012-07-13 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-13 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '19', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1455', '0', '2012-07-13 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-13 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '20', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1456', '0', '2012-07-13 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-13 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '21', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1457', '0', '2012-07-13 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-13 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '22', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1458', '0', '2012-07-13 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-13 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '23', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1459', '0', '2012-07-13 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-13 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '24', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1460', '0', '2012-07-13 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-13 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '26', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1461', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-15 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '1', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1462', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-15 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '2', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1463', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-15 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '3', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1464', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-15 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '4', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1465', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-15 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '8', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1466', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-15 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '9', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1467', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-15 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '10', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1468', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-15 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '11', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1469', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-15 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '12', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1470', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-15 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '13', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1471', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-15 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '14', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1472', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-15 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '15', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1473', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-15 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '16', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1474', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-15 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '17', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1475', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-15 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', 'daily', '18', null, '98', '1', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1476', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-15 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '19', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1477', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-15 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '20', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1478', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-15 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '21', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1479', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-15 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '22', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1480', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-15 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '23', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1481', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-15 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '24', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1482', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-15 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '26', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1483', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '1', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1484', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '2', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1485', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '3', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1486', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '4', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1487', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '8', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1488', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '9', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1489', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '10', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1490', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '11', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1491', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '12', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1492', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '13', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1493', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '14', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1494', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '15', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1495', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '16', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1496', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '17', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1497', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '18', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1498', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '19', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1499', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '20', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1500', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '21', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1501', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '22', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1502', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '23', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1503', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '24', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1504', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '26', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1505', '0', '2012-07-16 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '1', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1506', '0', '2012-07-16 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '2', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1507', '0', '2012-07-16 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '3', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1508', '0', '2012-07-16 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '4', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1509', '0', '2012-07-16 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '8', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1510', '0', '2012-07-16 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '9', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1511', '0', '2012-07-16 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '10', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1512', '0', '2012-07-16 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '11', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1513', '0', '2012-07-16 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '12', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1514', '0', '2012-07-16 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '13', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1515', '0', '2012-07-16 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '14', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1516', '0', '2012-07-16 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '15', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1517', '0', '2012-07-16 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '16', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1518', '0', '2012-07-16 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '17', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1519', '0', '2012-07-16 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '18', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1520', '0', '2012-07-16 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '19', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1521', '0', '2012-07-16 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '20', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1522', '0', '2012-07-16 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '21', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1523', '0', '2012-07-16 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '22', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1524', '0', '2012-07-16 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '23', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1525', '0', '2012-07-16 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '24', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1526', '0', '2012-07-16 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-16 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '26', null, '100', '0', '0', '0');

-- ----------------------------
-- Table structure for `t_event`
-- ----------------------------
DROP TABLE IF EXISTS `t_event`;
CREATE TABLE `t_event` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_high_way` bit(1) DEFAULT NULL,
  `is_near_bus_stop` bit(1) DEFAULT NULL,
  `driver_id` bigint(20) DEFAULT NULL,
  `event_record_id` bigint(20) DEFAULT NULL,
  `service_number` varchar(255) DEFAULT NULL,
  `road` varchar(255) DEFAULT NULL,
  `fleet_id` bigint(20) DEFAULT NULL,
  `vehicle_id` bigint(20) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA035AF0F4F961CDE` (`driver_id`),
  KEY `FKA035AF0FC5D3364B` (`event_record_id`),
  KEY `FKA035AF0F116C3656` (`fleet_id`),
  KEY `FKA035AF0FCF7D1A96` (`vehicle_id`),
  KEY `FKA035AF0F14A2A29E` (`department_id`),
  CONSTRAINT `FKA035AF0F116C3656` FOREIGN KEY (`fleet_id`) REFERENCES `t_fleet` (`id`),
  CONSTRAINT `FKA035AF0F14A2A29E` FOREIGN KEY (`department_id`) REFERENCES `t_department` (`id`),
  CONSTRAINT `FKA035AF0F4F961CDE` FOREIGN KEY (`driver_id`) REFERENCES `t_driver` (`id`),
  CONSTRAINT `FKA035AF0FC5D3364B` FOREIGN KEY (`event_record_id`) REFERENCES `t_event_record` (`id`),
  CONSTRAINT `FKA035AF0FCF7D1A96` FOREIGN KEY (`vehicle_id`) REFERENCES `t_vehicle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_event
-- ----------------------------
INSERT INTO `t_event` VALUES ('24', '\0', '\0', '16', '2', 'route01', '', '6', '4', '2');
INSERT INTO `t_event` VALUES ('25', '\0', '\0', '2', '3', 'route01', '', '2', '2', '2');
INSERT INTO `t_event` VALUES ('26', '\0', '\0', '23', '4', 'route01', '', '2', '2', '7');
INSERT INTO `t_event` VALUES ('27', '\0', '\0', '4', '5', 'route02', '', '1', '1', '3');
INSERT INTO `t_event` VALUES ('28', '\0', '\0', '4', '6', 'route02', '', '1', '1', '3');
INSERT INTO `t_event` VALUES ('29', '\0', '\0', '17', '7', 'route04', '', '8', '5', '2');
INSERT INTO `t_event` VALUES ('30', '\0', '\0', '21', '8', 'route04', '', '6', '4', '4');
INSERT INTO `t_event` VALUES ('31', '\0', '\0', '18', '9', 'route02', '', '8', '5', '3');
INSERT INTO `t_event` VALUES ('32', '\0', '\0', '24', '10', 'route02', '', '7', '6', '8');

-- ----------------------------
-- Table structure for `t_event_record`
-- ----------------------------
DROP TABLE IF EXISTS `t_event_record`;
CREATE TABLE `t_event_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `detail` varchar(255) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `event_time` datetime NOT NULL,
  `g_value` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `speed` int(11) NOT NULL DEFAULT '0',
  `event_type_tech_name` varchar(255) NOT NULL,
  `device_key` varchar(255) NOT NULL,
  `event_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '0 待处理, 1 处理中, 2 处理成功, 3 处理失败',
  PRIMARY KEY (`id`),
  KEY `FK17BF7B81F8A19664` (`event_type_tech_name`),
  KEY `device_key` (`device_key`),
  CONSTRAINT `FK17BF7B81F8A19664` FOREIGN KEY (`event_type_tech_name`) REFERENCES `t_event_type` (`tech_name`),
  CONSTRAINT `t_event_record_ibfk_1` FOREIGN KEY (`device_key`) REFERENCES `t_device` (`device_key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_event_record
-- ----------------------------
INSERT INTO `t_event_record` VALUES ('2', 'asdf', '1', '2011-05-05 11:56:37', '3123', '34335.05990134846', '11791.630077000329', '12', 'event-sudden-acceleration', '4', '2');
INSERT INTO `t_event_record` VALUES ('3', 'xxxxx', '3', '2012-07-12 14:57:07', '341', '30157.030248655934', '30491.43855029164', '150', 'event-speeding', '1', '2');
INSERT INTO `t_event_record` VALUES ('4', 'xxfdds', '5', '2011-04-20 18:59:59', '1122', '34326.98701124093', '33399.50823299224', '200', 'event-speeding', '1', '2');
INSERT INTO `t_event_record` VALUES ('5', 'sfasfsf', '12', '2012-07-12 17:57:35', '3123', '36102.84347778058', '15826.84926458007', '120', 'event-sudden-braking', '2', '2');
INSERT INTO `t_event_record` VALUES ('6', 'xvxv', '23', '2012-07-13 20:01:12', '123', '30157.030248655934', '30491.43855029164', '125', 'event-speeding', '2', '2');
INSERT INTO `t_event_record` VALUES ('7', 'fffeee', '3', '2012-07-13 16:59:16', '42342', '30157.030248655934', '29191.01194041832', '34', 'event-sudden-right', '3', '2');
INSERT INTO `t_event_record` VALUES ('8', 'sdafsf', '2', '2012-07-14 17:57:33', '3423', '30491.43855029164', '30062.028758860608', '55', 'event-idle', '4', '2');
INSERT INTO `t_event_record` VALUES ('9', 'zzzzxxxx', '55', '2012-07-15 18:03:05', '654', '36162.84347778058', '32765.206346922685', '45', 'event-sudden-left', '3', '2');
INSERT INTO `t_event_record` VALUES ('10', 'asdfsaf', '23', '2012-07-12 16:10:29', '625', '36362.84347778058', '30062.028758860608', '32', 'event-sudden-acceleration', '5', '2');

-- ----------------------------
-- Table structure for `t_event_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_event_type`;
CREATE TABLE `t_event_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `tech_name` varchar(255) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `points` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `tech_name` (`tech_name`),
  UNIQUE KEY `column_name` (`field_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2052 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_event_type
-- ----------------------------
INSERT INTO `t_event_type` VALUES ('1024', 'Idle', 'event-idle', 'idling', '3');
INSERT INTO `t_event_type` VALUES ('1025', 'Speeding', 'event-speeding', 'speedingCount', '4');
INSERT INTO `t_event_type` VALUES ('2048', 'Sudden acceleration', 'event-sudden-acceleration', 'suddenAcceleration', '2');
INSERT INTO `t_event_type` VALUES ('2049', 'Sudden braking', 'event-sudden-braking', 'suddenBrake', '2');
INSERT INTO `t_event_type` VALUES ('2050', 'Sudden left', 'event-sudden-left', 'suddenLeftTurn', '2');
INSERT INTO `t_event_type` VALUES ('2051', 'Sudden right', 'event-sudden-right', 'suddenRightTurn', '2');

-- ----------------------------
-- Table structure for `t_fleet`
-- ----------------------------
DROP TABLE IF EXISTS `t_fleet`;
CREATE TABLE `t_fleet` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `place_number` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `FKA03F39C325DB1D7A` (`parent_id`),
  CONSTRAINT `FKA03F39C325DB1D7A` FOREIGN KEY (`parent_id`) REFERENCES `t_fleet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_fleet
-- ----------------------------
INSERT INTO `t_fleet` VALUES ('1', 'fleet_1', 'fleet_1', '21045', null);
INSERT INTO `t_fleet` VALUES ('2', 'fleet_2', 'fleet_2', '54681', null);
INSERT INTO `t_fleet` VALUES ('3', 'fleet_1_1', 'fleet_1_1', '21014', '1');
INSERT INTO `t_fleet` VALUES ('4', 'fleet_2_1', 'fleet_2_1', '54601', '2');
INSERT INTO `t_fleet` VALUES ('5', 'fleet_1_2', 'fleet_1_2', '12014', '1');
INSERT INTO `t_fleet` VALUES ('6', 'fleet_1_2_1', 'fleet_1_2_1', '12458', '5');
INSERT INTO `t_fleet` VALUES ('7', 'fleet_3', 'fleet_3', '32145', null);
INSERT INTO `t_fleet` VALUES ('8', 'fleet_4', 'fleet_4', '87452', null);
INSERT INTO `t_fleet` VALUES ('9', 'fleet_5', 'fleet_5', '65487', null);
INSERT INTO `t_fleet` VALUES ('10', 'fleet_6', 'fleet_6', '45712', null);
INSERT INTO `t_fleet` VALUES ('11', 'fleet_6_1 desc', 'fleet_6_1', '45732', '10');

-- ----------------------------
-- Table structure for `t_gps_data`
-- ----------------------------
DROP TABLE IF EXISTS `t_gps_data`;
CREATE TABLE `t_gps_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `direction` int(11) DEFAULT NULL,
  `fixed` bit(1) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `speed` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `device_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `device_key` (`device_key`) USING BTREE,
  CONSTRAINT `t_gps_data_ibfk_1` FOREIGN KEY (`device_key`) REFERENCES `t_device` (`device_key`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3357254 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_gps_data
-- ----------------------------
INSERT INTO `t_gps_data` VALUES ('3356754', '2012-07-17 11:58:36', '3', '', '41932.5463037587', '35497.482126703486', '39', '2012-07-17 11:58:36', '2');
INSERT INTO `t_gps_data` VALUES ('3356755', '2012-07-17 11:58:36', '3', '', '44085.3953723101', '26137.080105418852', '9', '2012-07-17 11:58:36', '1');
INSERT INTO `t_gps_data` VALUES ('3356756', '2012-07-17 11:58:36', '3', '', '30088.389963865182', '39043.548830668115', '71', '2012-07-17 11:58:36', '4');
INSERT INTO `t_gps_data` VALUES ('3356757', '2012-07-17 11:58:36', '3', '', '30536.445555243085', '22181.270414772465', '1', '2012-07-17 11:58:36', '3');
INSERT INTO `t_gps_data` VALUES ('3356758', '2012-07-17 11:58:36', '2', '', '37202.34377439208', '34142.414252693816', '28', '2012-07-17 11:58:36', '5');
INSERT INTO `t_gps_data` VALUES ('3356759', '2012-07-17 11:58:36', '2', '', '33898.92038319661', '36705.5537981747', '78', '2012-07-17 11:58:36', '6');
INSERT INTO `t_gps_data` VALUES ('3356760', '2012-07-17 11:58:36', '2', '', '44105.90099498618', '32071.496501704914', '51', '2012-07-17 11:58:36', '001190251');
INSERT INTO `t_gps_data` VALUES ('3356761', '2012-07-17 11:58:36', '2', '', '34649.57221914117', '29861.888444796044', '64', '2012-07-17 11:58:36', '001014182');
INSERT INTO `t_gps_data` VALUES ('3356762', '2012-07-17 11:58:36', '0', '', '39701.8544588774', '31490.07095674429', '50', '2012-07-17 11:58:36', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3356763', '2012-07-17 11:58:36', '2', '', '41423.31438831172', '38831.883081934124', '82', '2012-07-17 11:58:36', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3356764', '2012-07-17 11:58:36', '0', '', '34608.8386576153', '10677.172161698227', '69', '2012-07-17 11:58:36', '001001003');
INSERT INTO `t_gps_data` VALUES ('3356765', '2012-07-17 11:58:36', '2', '', '36841.083669376014', '29888.05014660468', '22', '2012-07-17 11:58:36', '001067110');
INSERT INTO `t_gps_data` VALUES ('3356766', '2012-07-17 11:58:36', '1', '', '33409.96172523181', '14987.297236371385', '14', '2012-07-17 11:58:36', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3356767', '2012-07-17 11:58:36', '1', '', '35319.797616918826', '10619.48039192038', '70', '2012-07-17 11:58:36', 'amk');
INSERT INTO `t_gps_data` VALUES ('3356768', '2012-07-17 11:58:36', '3', '', '44315.41444229676', '25533.895830160625', '72', '2012-07-17 11:58:36', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3356769', '2012-07-17 11:58:36', '3', '', '37863.664959002796', '16598.04219775409', '7', '2012-07-17 11:58:36', 'cck');
INSERT INTO `t_gps_data` VALUES ('3356770', '2012-07-17 11:58:36', '3', '', '31185.239545680066', '24193.186179076834', '4', '2012-07-17 11:58:36', 'clm');
INSERT INTO `t_gps_data` VALUES ('3356771', '2012-07-17 11:58:36', '2', '', '42630.26356943297', '27011.931747396902', '26', '2012-07-17 11:58:36', 'hou');
INSERT INTO `t_gps_data` VALUES ('3356772', '2012-07-17 11:58:36', '1', '', '44321.881567943376', '21350.98682293921', '18', '2012-07-17 11:58:36', 'jur');
INSERT INTO `t_gps_data` VALUES ('3356773', '2012-07-17 11:58:36', '0', '', '30902.379890114025', '21588.77617738964', '78', '2012-07-17 11:58:36', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3356774', '2012-07-17 11:58:46', '3', '', '41853.839577664505', '35470.09160020608', '39', '2012-07-17 11:58:46', '2');
INSERT INTO `t_gps_data` VALUES ('3356775', '2012-07-17 11:58:46', '3', '', '44039.00554073947', '26125.18790891245', '9', '2012-07-17 11:58:46', '1');
INSERT INTO `t_gps_data` VALUES ('3356776', '2012-07-17 11:58:46', '3', '', '30007.36987775386', '39033.24255881199', '71', '2012-07-17 11:58:46', '4');
INSERT INTO `t_gps_data` VALUES ('3356777', '2012-07-17 11:58:46', '3', '', '30494.29114112919', '22167.661072447954', '1', '2012-07-17 11:58:46', '3');
INSERT INTO `t_gps_data` VALUES ('3356778', '2012-07-17 11:58:46', '2', '', '37246.937975192384', '34155.824366233086', '28', '2012-07-17 11:58:46', '5');
INSERT INTO `t_gps_data` VALUES ('3356779', '2012-07-17 11:58:46', '2', '', '33951.0921773505', '36730.24966710571', '78', '2012-07-17 11:58:46', '6');
INSERT INTO `t_gps_data` VALUES ('3356780', '2012-07-17 11:58:46', '2', '', '44200.409218236164', '32094.607020702046', '51', '2012-07-17 11:58:46', '001190251');
INSERT INTO `t_gps_data` VALUES ('3356781', '2012-07-17 11:58:46', '2', '', '34736.49368189699', '29879.04215000125', '64', '2012-07-17 11:58:46', '001014182');
INSERT INTO `t_gps_data` VALUES ('3356782', '2012-07-17 11:58:46', '0', '', '39699.135479588505', '31391.412675229825', '50', '2012-07-17 11:58:46', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3356783', '2012-07-17 11:58:46', '2', '', '41515.54087140614', '38859.12756276773', '82', '2012-07-17 11:58:46', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3356784', '2012-07-17 11:58:46', '0', '', '34603.210150975625', '10610.930223281703', '69', '2012-07-17 11:58:46', '001001003');
INSERT INTO `t_gps_data` VALUES ('3356785', '2012-07-17 11:58:46', '2', '', '36894.512987147886', '29904.57173203153', '22', '2012-07-17 11:58:46', '001067110');
INSERT INTO `t_gps_data` VALUES ('3356786', '2012-07-17 11:58:46', '1', '', '33414.524515174315', '15063.501539812807', '14', '2012-07-17 11:58:46', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3356787', '2012-07-17 11:58:46', '1', '', '35342.88128019733', '10666.789429109109', '70', '2012-07-17 11:58:46', 'amk');
INSERT INTO `t_gps_data` VALUES ('3356788', '2012-07-17 11:58:46', '3', '', '44260.94656246569', '25509.00115391234', '72', '2012-07-17 11:58:46', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3356789', '2012-07-17 11:58:46', '3', '', '37792.04993673232', '16586.17342059509', '7', '2012-07-17 11:58:46', 'cck');
INSERT INTO `t_gps_data` VALUES ('3356790', '2012-07-17 11:58:46', '3', '', '31128.604611209223', '24183.369511328383', '4', '2012-07-17 11:58:46', 'clm');
INSERT INTO `t_gps_data` VALUES ('3356791', '2012-07-17 11:58:46', '2', '', '42673.590588159714', '27036.304955370197', '26', '2012-07-17 11:58:46', 'hou');
INSERT INTO `t_gps_data` VALUES ('3356792', '2012-07-17 11:58:46', '1', '', '44322.69687608393', '21391.975802692665', '18', '2012-07-17 11:58:46', 'jur');
INSERT INTO `t_gps_data` VALUES ('3356793', '2012-07-17 11:58:46', '0', '', '30873.074521536168', '21553.814799777236', '78', '2012-07-17 11:58:46', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3356794', '2012-07-17 11:58:56', '3', '', '41782.17570381675', '35456.63104656365', '39', '2012-07-17 11:58:56', '2');
INSERT INTO `t_gps_data` VALUES ('3356795', '2012-07-17 11:58:56', '3', '', '43982.12931970768', '26097.361828905985', '9', '2012-07-17 11:58:56', '1');
INSERT INTO `t_gps_data` VALUES ('3356796', '2012-07-17 11:58:56', '3', '', '29968.649734589984', '39025.686355345606', '71', '2012-07-17 11:58:56', '4');
INSERT INTO `t_gps_data` VALUES ('3356797', '2012-07-17 11:58:57', '3', '', '30457.294360499767', '22159.990442768933', '1', '2012-07-17 11:58:57', '3');
INSERT INTO `t_gps_data` VALUES ('3356798', '2012-07-17 11:58:57', '2', '', '37337.3654029137', '34179.45224969769', '28', '2012-07-17 11:58:57', '5');
INSERT INTO `t_gps_data` VALUES ('3356799', '2012-07-17 11:58:57', '2', '', '34004.71070698204', '36752.41168935366', '78', '2012-07-17 11:58:57', '6');
INSERT INTO `t_gps_data` VALUES ('3356800', '2012-07-17 11:58:57', '2', '', '44268.081209188924', '32101.069108363088', '51', '2012-07-17 11:58:57', '001190251');
INSERT INTO `t_gps_data` VALUES ('3356801', '2012-07-17 11:58:57', '2', '', '34767.62095022998', '29907.42231707162', '64', '2012-07-17 11:58:57', '001014182');
INSERT INTO `t_gps_data` VALUES ('3356802', '2012-07-17 11:58:57', '0', '', '39687.68557057218', '31292.549715144498', '50', '2012-07-17 11:58:57', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3356803', '2012-07-17 11:58:57', '2', '', '41585.79146534898', '38885.280953720256', '82', '2012-07-17 11:58:57', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3356804', '2012-07-17 11:58:57', '0', '', '34577.82143482319', '10512.745162090949', '69', '2012-07-17 11:58:57', '001001003');
INSERT INTO `t_gps_data` VALUES ('3356805', '2012-07-17 11:58:57', '2', '', '36977.46690893622', '29931.618838828424', '22', '2012-07-17 11:58:57', '001067110');
INSERT INTO `t_gps_data` VALUES ('3356806', '2012-07-17 11:58:57', '1', '', '33427.13977470341', '15119.6944977172', '14', '2012-07-17 11:58:57', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3356807', '2012-07-17 11:58:57', '1', '', '35358.11248227315', '10724.989201955294', '70', '2012-07-17 11:58:57', 'amk');
INSERT INTO `t_gps_data` VALUES ('3356808', '2012-07-17 11:58:57', '3', '', '44215.230859279494', '25507.617725149983', '72', '2012-07-17 11:58:57', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3356809', '2012-07-17 11:58:57', '3', '', '37742.45210709985', '16566.807469326024', '7', '2012-07-17 11:58:57', 'cck');
INSERT INTO `t_gps_data` VALUES ('3356810', '2012-07-17 11:58:57', '3', '', '31075.21100114592', '24183.200200380074', '4', '2012-07-17 11:58:57', 'clm');
INSERT INTO `t_gps_data` VALUES ('3356811', '2012-07-17 11:58:57', '2', '', '42707.18812280173', '27054.926527412594', '26', '2012-07-17 11:58:57', 'hou');
INSERT INTO `t_gps_data` VALUES ('3356812', '2012-07-17 11:58:57', '1', '', '44349.67677192347', '21473.74546016014', '18', '2012-07-17 11:58:57', 'jur');
INSERT INTO `t_gps_data` VALUES ('3356813', '2012-07-17 11:58:57', '0', '', '30869.593401852893', '21471.513387567906', '78', '2012-07-17 11:58:57', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3356814', '2012-07-17 11:59:07', '3', '', '41739.685576094314', '35430.68359237247', '39', '2012-07-17 11:59:07', '2');
INSERT INTO `t_gps_data` VALUES ('3356815', '2012-07-17 11:59:07', '3', '', '43896.28923048941', '26082.13796078929', '9', '2012-07-17 11:59:07', '1');
INSERT INTO `t_gps_data` VALUES ('3356816', '2012-07-17 11:59:07', '3', '', '29932.321455853322', '39021.14926220479', '71', '2012-07-17 11:59:07', '4');
INSERT INTO `t_gps_data` VALUES ('3356817', '2012-07-17 11:59:07', '3', '', '30388.50439006678', '22151.671322086844', '1', '2012-07-17 11:59:07', '3');
INSERT INTO `t_gps_data` VALUES ('3356818', '2012-07-17 11:59:07', '2', '', '37420.073440271044', '34201.884464341114', '28', '2012-07-17 11:59:07', '5');
INSERT INTO `t_gps_data` VALUES ('3356819', '2012-07-17 11:59:07', '2', '', '34097.08794477934', '36779.440829861305', '78', '2012-07-17 11:59:07', '6');
INSERT INTO `t_gps_data` VALUES ('3356820', '2012-07-17 11:59:07', '2', '', '44329.41236993063', '32105.203518000006', '51', '2012-07-17 11:59:07', '001190251');
INSERT INTO `t_gps_data` VALUES ('3356821', '2012-07-17 11:59:07', '2', '', '34849.541025677914', '29934.052200078284', '64', '2012-07-17 11:59:07', '001014182');
INSERT INTO `t_gps_data` VALUES ('3356822', '2012-07-17 11:59:07', '0', '', '39681.63875212022', '31223.67859343051', '50', '2012-07-17 11:59:07', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3356823', '2012-07-17 11:59:07', '2', '', '41665.51319373202', '38895.48493498642', '82', '2012-07-17 11:59:07', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3356824', '2012-07-17 11:59:07', '0', '', '34561.16112008669', '10480.25785370683', '69', '2012-07-17 11:59:07', '001001003');
INSERT INTO `t_gps_data` VALUES ('3356825', '2012-07-17 11:59:07', '2', '', '37051.99877021232', '29961.176725591453', '22', '2012-07-17 11:59:07', '001067110');
INSERT INTO `t_gps_data` VALUES ('3356826', '2012-07-17 11:59:07', '1', '', '33449.49807883126', '15167.707988088765', '14', '2012-07-17 11:59:07', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3356827', '2012-07-17 11:59:07', '1', '', '35370.55817888556', '10785.270779386696', '70', '2012-07-17 11:59:07', 'amk');
INSERT INTO `t_gps_data` VALUES ('3356828', '2012-07-17 11:59:07', '3', '', '44148.77204902998', '25480.750214167005', '72', '2012-07-17 11:59:07', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3356829', '2012-07-17 11:59:07', '3', '', '37672.08033083989', '16551.434786227357', '7', '2012-07-17 11:59:07', 'cck');
INSERT INTO `t_gps_data` VALUES ('3356830', '2012-07-17 11:59:07', '3', '', '31010.924542629098', '24161.59539828804', '4', '2012-07-17 11:59:07', 'clm');
INSERT INTO `t_gps_data` VALUES ('3356831', '2012-07-17 11:59:07', '2', '', '42754.493634496364', '27063.60102008289', '26', '2012-07-17 11:59:07', 'hou');
INSERT INTO `t_gps_data` VALUES ('3356832', '2012-07-17 11:59:07', '1', '', '44377.947401954196', '21553.6294446872', '18', '2012-07-17 11:59:07', 'jur');
INSERT INTO `t_gps_data` VALUES ('3356833', '2012-07-17 11:59:07', '0', '', '30841.72148537822', '21408.236381050254', '78', '2012-07-17 11:59:07', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3356834', '2012-07-17 11:59:17', '3', '', '41663.509674299756', '35411.29748705283', '39', '2012-07-17 11:59:17', '2');
INSERT INTO `t_gps_data` VALUES ('3356835', '2012-07-17 11:59:17', '3', '', '43804.046055795865', '26081.92011259359', '9', '2012-07-17 11:59:17', '1');
INSERT INTO `t_gps_data` VALUES ('3356836', '2012-07-17 11:59:17', '3', '', '29856.773228735703', '39003.17089862257', '71', '2012-07-17 11:59:17', '4');
INSERT INTO `t_gps_data` VALUES ('3356837', '2012-07-17 11:59:17', '3', '', '30325.361303934784', '22141.60160138754', '1', '2012-07-17 11:59:17', '3');
INSERT INTO `t_gps_data` VALUES ('3356838', '2012-07-17 11:59:17', '2', '', '37467.34575687672', '34219.13155310475', '28', '2012-07-17 11:59:17', '5');
INSERT INTO `t_gps_data` VALUES ('3356839', '2012-07-17 11:59:17', '2', '', '34158.95796949703', '36808.877879348605', '78', '2012-07-17 11:59:17', '6');
INSERT INTO `t_gps_data` VALUES ('3356840', '2012-07-17 11:59:17', '2', '', '44361.5804120002', '32106.175246135306', '51', '2012-07-17 11:59:17', '001190251');
INSERT INTO `t_gps_data` VALUES ('3356841', '2012-07-17 11:59:17', '2', '', '34885.62966331447', '29946.819279482243', '64', '2012-07-17 11:59:17', '001014182');
INSERT INTO `t_gps_data` VALUES ('3356842', '2012-07-17 11:59:17', '0', '', '39669.35874147285', '31137.518338699178', '50', '2012-07-17 11:59:17', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3356843', '2012-07-17 11:59:17', '2', '', '41712.30225626001', '38912.05118589721', '82', '2012-07-17 11:59:17', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3356844', '2012-07-17 11:59:17', '0', '', '34556.014684306436', '10397.656854311745', '69', '2012-07-17 11:59:17', '001001003');
INSERT INTO `t_gps_data` VALUES ('3356845', '2012-07-17 11:59:17', '2', '', '37139.984920583316', '29982.133813383232', '22', '2012-07-17 11:59:17', '001067110');
INSERT INTO `t_gps_data` VALUES ('3356846', '2012-07-17 11:59:17', '1', '', '33472.625186694546', '15220.46553719032', '14', '2012-07-17 11:59:17', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3356847', '2012-07-17 11:59:17', '1', '', '35393.72760000848', '10844.538440735378', '70', '2012-07-17 11:59:17', 'amk');
INSERT INTO `t_gps_data` VALUES ('3356848', '2012-07-17 11:59:17', '3', '', '44117.9940444315', '25460.698397693697', '72', '2012-07-17 11:59:17', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3356849', '2012-07-17 11:59:17', '3', '', '37600.96170748352', '16545.344312898273', '7', '2012-07-17 11:59:17', 'cck');
INSERT INTO `t_gps_data` VALUES ('3356850', '2012-07-17 11:59:17', '3', '', '30923.4325422381', '24134.67762442596', '4', '2012-07-17 11:59:17', 'clm');
INSERT INTO `t_gps_data` VALUES ('3356851', '2012-07-17 11:59:17', '2', '', '42839.68487975794', '27070.346978466594', '26', '2012-07-17 11:59:17', 'hou');
INSERT INTO `t_gps_data` VALUES ('3356852', '2012-07-17 11:59:17', '1', '', '44378.849239785755', '21618.1526186417', '18', '2012-07-17 11:59:17', 'jur');
INSERT INTO `t_gps_data` VALUES ('3356853', '2012-07-17 11:59:17', '0', '', '30838.388624321473', '21334.481627693014', '78', '2012-07-17 11:59:17', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3356854', '2012-07-17 11:59:27', '3', '', '41600.593831323655', '35405.75987580369', '39', '2012-07-17 11:59:27', '2');
INSERT INTO `t_gps_data` VALUES ('3356855', '2012-07-17 11:59:27', '3', '', '43713.84432392359', '26059.920702613173', '9', '2012-07-17 11:59:27', '1');
INSERT INTO `t_gps_data` VALUES ('3356856', '2012-07-17 11:59:27', '3', '', '29814.470191653203', '38992.02434328983', '71', '2012-07-17 11:59:27', '4');
INSERT INTO `t_gps_data` VALUES ('3356857', '2012-07-17 11:59:27', '3', '', '30229.03319695881', '22137.68491787635', '1', '2012-07-17 11:59:27', '3');
INSERT INTO `t_gps_data` VALUES ('3356858', '2012-07-17 11:59:27', '2', '', '37537.041180965825', '34242.90009913608', '28', '2012-07-17 11:59:27', '5');
INSERT INTO `t_gps_data` VALUES ('3356859', '2012-07-17 11:59:27', '2', '', '34192.27315610327', '36821.45856402611', '78', '2012-07-17 11:59:27', '6');
INSERT INTO `t_gps_data` VALUES ('3356860', '2012-07-17 11:59:27', '2', '', '44454.429746727634', '32135.165553352566', '51', '2012-07-17 11:59:27', '001190251');
INSERT INTO `t_gps_data` VALUES ('3356861', '2012-07-17 11:59:27', '2', '', '34945.703936143414', '29963.077742847625', '64', '2012-07-17 11:59:27', '001014182');
INSERT INTO `t_gps_data` VALUES ('3356862', '2012-07-17 11:59:27', '0', '', '39657.56674987833', '31085.25313947892', '50', '2012-07-17 11:59:27', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3356863', '2012-07-17 11:59:27', '2', '', '41773.58766346115', '38935.54103979915', '82', '2012-07-17 11:59:27', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3356864', '2012-07-17 11:59:27', '0', '', '34541.001669415346', '10344.449554742492', '69', '2012-07-17 11:59:27', '001001003');
INSERT INTO `t_gps_data` VALUES ('3356865', '2012-07-17 11:59:27', '2', '', '37237.79085042684', '29986.050524018443', '22', '2012-07-17 11:59:27', '001067110');
INSERT INTO `t_gps_data` VALUES ('3356866', '2012-07-17 11:59:27', '1', '', '33495.312265511035', '15278.930265592455', '14', '2012-07-17 11:59:27', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3356867', '2012-07-17 11:59:27', '1', '', '35407.68712816162', '10888.44226679388', '70', '2012-07-17 11:59:27', 'amk');
INSERT INTO `t_gps_data` VALUES ('3356868', '2012-07-17 11:59:27', '3', '', '44071.338727330876', '25432.605422129353', '72', '2012-07-17 11:59:27', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3356869', '2012-07-17 11:59:27', '3', '', '37519.63704618933', '16523.49848670595', '7', '2012-07-17 11:59:27', 'cck');
INSERT INTO `t_gps_data` VALUES ('3356870', '2012-07-17 11:59:27', '3', '', '30885.91740210988', '24132.85912178847', '4', '2012-07-17 11:59:27', 'clm');
INSERT INTO `t_gps_data` VALUES ('3356871', '2012-07-17 11:59:27', '2', '', '42876.15569461692', '27085.684151593046', '26', '2012-07-17 11:59:27', 'hou');
INSERT INTO `t_gps_data` VALUES ('3356872', '2012-07-17 11:59:27', '1', '', '44404.77445726077', '21702.35868837737', '18', '2012-07-17 11:59:27', 'jur');
INSERT INTO `t_gps_data` VALUES ('3356873', '2012-07-17 11:59:27', '0', '', '30810.056289442375', '21296.059286444353', '78', '2012-07-17 11:59:27', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3356874', '2012-07-17 11:59:37', '3', '', '41517.35957044796', '35397.16737329627', '39', '2012-07-17 11:59:37', '2');
INSERT INTO `t_gps_data` VALUES ('3356875', '2012-07-17 11:59:37', '3', '', '43679.80525416178', '26042.65864283981', '9', '2012-07-17 11:59:37', '1');
INSERT INTO `t_gps_data` VALUES ('3356876', '2012-07-17 11:59:37', '3', '', '29765.290216450183', '38974.35158686878', '71', '2012-07-17 11:59:37', '4');
INSERT INTO `t_gps_data` VALUES ('3356877', '2012-07-17 11:59:37', '3', '', '30171.373758080914', '22110.03720588472', '1', '2012-07-17 11:59:37', '3');
INSERT INTO `t_gps_data` VALUES ('3356878', '2012-07-17 11:59:37', '2', '', '37576.5940514469', '34251.44850293513', '28', '2012-07-17 11:59:37', '5');
INSERT INTO `t_gps_data` VALUES ('3356879', '2012-07-17 11:59:37', '2', '', '34256.103391405995', '36846.68325193137', '78', '2012-07-17 11:59:37', '6');
INSERT INTO `t_gps_data` VALUES ('3356880', '2012-07-17 11:59:37', '3', '', '44510.22775578957', '32135.2950367394', '51', '2012-07-17 11:59:37', '001190251');
INSERT INTO `t_gps_data` VALUES ('3356881', '2012-07-17 11:59:37', '2', '', '34996.38258995075', '29966.11645910746', '64', '2012-07-17 11:59:37', '001014182');
INSERT INTO `t_gps_data` VALUES ('3356882', '2012-07-17 11:59:37', '0', '', '39657.35141978858', '31050.37499553405', '50', '2012-07-17 11:59:37', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3356883', '2012-07-17 11:59:37', '2', '', '41854.591071077695', '38947.996770253034', '82', '2012-07-17 11:59:37', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3356884', '2012-07-17 11:59:37', '0', '', '34528.4874180521', '10273.928099656034', '69', '2012-07-17 11:59:37', '001001003');
INSERT INTO `t_gps_data` VALUES ('3356885', '2012-07-17 11:59:37', '2', '', '37293.52861789974', '29990.65027267906', '22', '2012-07-17 11:59:37', '001067110');
INSERT INTO `t_gps_data` VALUES ('3356886', '2012-07-17 11:59:37', '1', '', '33524.90924805389', '15349.735078996453', '14', '2012-07-17 11:59:37', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3356887', '2012-07-17 11:59:37', '1', '', '35420.08270318269', '10960.168381319163', '70', '2012-07-17 11:59:37', 'amk');
INSERT INTO `t_gps_data` VALUES ('3356888', '2012-07-17 11:59:37', '3', '', '43981.8910339802', '25429.389522062345', '72', '2012-07-17 11:59:37', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3356889', '2012-07-17 11:59:37', '3', '', '37425.25193302013', '16493.97993362424', '7', '2012-07-17 11:59:37', 'cck');
INSERT INTO `t_gps_data` VALUES ('3356890', '2012-07-17 11:59:37', '3', '', '30811.01043334157', '24132.843204881563', '4', '2012-07-17 11:59:37', 'clm');
INSERT INTO `t_gps_data` VALUES ('3356891', '2012-07-17 11:59:37', '2', '', '42970.41612977231', '27105.294580774153', '26', '2012-07-17 11:59:37', 'hou');
INSERT INTO `t_gps_data` VALUES ('3356892', '2012-07-17 11:59:37', '1', '', '44433.600901199745', '21741.7913198854', '18', '2012-07-17 11:59:37', 'jur');
INSERT INTO `t_gps_data` VALUES ('3356893', '2012-07-17 11:59:37', '0', '', '30800.24266814235', '21204.126583189824', '78', '2012-07-17 11:59:37', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3356894', '2012-07-17 11:59:47', '3', '', '41448.881517183174', '35368.33316562983', '39', '2012-07-17 11:59:47', '2');
INSERT INTO `t_gps_data` VALUES ('3356895', '2012-07-17 11:59:47', '3', '', '43609.22592993513', '26036.53218781301', '9', '2012-07-17 11:59:47', '1');
INSERT INTO `t_gps_data` VALUES ('3356896', '2012-07-17 11:59:47', '3', '', '29705.86821013095', '38956.697908362534', '71', '2012-07-17 11:59:47', '4');
INSERT INTO `t_gps_data` VALUES ('3356897', '2012-07-17 11:59:47', '3', '', '30095.738875162184', '22095.005031766945', '1', '2012-07-17 11:59:47', '3');
INSERT INTO `t_gps_data` VALUES ('3356898', '2012-07-17 11:59:47', '2', '', '37660.94248010114', '34258.00312311793', '28', '2012-07-17 11:59:47', '5');
INSERT INTO `t_gps_data` VALUES ('3356899', '2012-07-17 11:59:47', '2', '', '34353.327019113654', '36873.79878872858', '78', '2012-07-17 11:59:47', '6');
INSERT INTO `t_gps_data` VALUES ('3356900', '2012-07-17 11:59:47', '3', '', '44454.51699790126', '32112.247467792095', '51', '2012-07-17 11:59:47', '001190251');
INSERT INTO `t_gps_data` VALUES ('3356901', '2012-07-17 11:59:47', '2', '', '35070.74268663691', '29966.379670198978', '64', '2012-07-17 11:59:47', '001014182');
INSERT INTO `t_gps_data` VALUES ('3356902', '2012-07-17 11:59:47', '0', '', '39643.06959391597', '31018.106997683673', '50', '2012-07-17 11:59:47', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3356903', '2012-07-17 11:59:47', '2', '', '41890.6376591787', '38971.84745602964', '82', '2012-07-17 11:59:47', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3356904', '2012-07-17 11:59:47', '1', '', '34506.88964757738', '10202.78234727712', '69', '2012-07-17 11:59:47', '001001003');
INSERT INTO `t_gps_data` VALUES ('3356905', '2012-07-17 11:59:47', '2', '', '37386.486382497365', '30017.260383211215', '22', '2012-07-17 11:59:47', '001067110');
INSERT INTO `t_gps_data` VALUES ('3356906', '2012-07-17 11:59:47', '1', '', '33553.59560751509', '15415.409710465614', '14', '2012-07-17 11:59:47', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3356907', '2012-07-17 11:59:47', '1', '', '35443.4516625253', '11011.391355955857', '70', '2012-07-17 11:59:47', 'amk');
INSERT INTO `t_gps_data` VALUES ('3356908', '2012-07-17 11:59:47', '3', '', '43951.27794552144', '25401.944961330148', '72', '2012-07-17 11:59:47', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3356909', '2012-07-17 11:59:47', '3', '', '37332.800254559384', '16489.687949383184', '7', '2012-07-17 11:59:47', 'cck');
INSERT INTO `t_gps_data` VALUES ('3356910', '2012-07-17 11:59:47', '3', '', '30748.49846656144', '24103.676622449875', '4', '2012-07-17 11:59:47', 'clm');
INSERT INTO `t_gps_data` VALUES ('3356911', '2012-07-17 11:59:47', '2', '', '43020.13482048807', '27114.87619188916', '26', '2012-07-17 11:59:47', 'hou');
INSERT INTO `t_gps_data` VALUES ('3356912', '2012-07-17 11:59:47', '1', '', '44449.03106273663', '21819.316292583782', '18', '2012-07-17 11:59:47', 'jur');
INSERT INTO `t_gps_data` VALUES ('3356913', '2012-07-17 11:59:47', '0', '', '30774.511795281243', '21125.764200337904', '78', '2012-07-17 11:59:47', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3356914', '2012-07-17 11:59:57', '3', '', '41406.77135089397', '35344.58557841821', '39', '2012-07-17 11:59:57', '2');
INSERT INTO `t_gps_data` VALUES ('3356915', '2012-07-17 11:59:57', '3', '', '43521.20618932364', '26020.971168981043', '9', '2012-07-17 11:59:57', '1');
INSERT INTO `t_gps_data` VALUES ('3356916', '2012-07-17 11:59:57', '3', '', '29646.86312640898', '38945.47158682792', '71', '2012-07-17 11:59:57', '4');
INSERT INTO `t_gps_data` VALUES ('3356917', '2012-07-17 11:59:57', '3', '', '30037.317005587127', '22067.399981521947', '1', '2012-07-17 11:59:57', '3');
INSERT INTO `t_gps_data` VALUES ('3356918', '2012-07-17 11:59:57', '2', '', '37748.28569955247', '34277.81154890805', '28', '2012-07-17 11:59:57', '5');
INSERT INTO `t_gps_data` VALUES ('3356919', '2012-07-17 11:59:57', '2', '', '34397.77664852949', '36882.79065839016', '78', '2012-07-17 11:59:57', '6');
INSERT INTO `t_gps_data` VALUES ('3356920', '2012-07-17 11:59:57', '3', '', '44411.191909547466', '32086.052631095805', '51', '2012-07-17 11:59:57', '001190251');
INSERT INTO `t_gps_data` VALUES ('3356921', '2012-07-17 11:59:57', '2', '', '35112.10442734394', '29983.57519942214', '64', '2012-07-17 11:59:57', '001014182');
INSERT INTO `t_gps_data` VALUES ('3356922', '2012-07-17 11:59:57', '0', '', '39621.07600851416', '30944.253804109372', '50', '2012-07-17 11:59:57', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3356923', '2012-07-17 11:59:57', '2', '', '41978.09419215315', '38987.89216266316', '82', '2012-07-17 11:59:57', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3356924', '2012-07-17 11:59:57', '1', '', '34520.602395279275', '10253.628511933446', '69', '2012-07-17 11:59:57', '001001003');
INSERT INTO `t_gps_data` VALUES ('3356925', '2012-07-17 11:59:57', '2', '', '37421.408839295065', '30038.419672851476', '22', '2012-07-17 11:59:57', '001067110');
INSERT INTO `t_gps_data` VALUES ('3356926', '2012-07-17 11:59:57', '1', '', '33555.170614966664', '15500.235929919418', '14', '2012-07-17 11:59:57', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3356927', '2012-07-17 11:59:57', '1', '', '35456.565619098714', '11101.00097122917', '70', '2012-07-17 11:59:57', 'amk');
INSERT INTO `t_gps_data` VALUES ('3356928', '2012-07-17 11:59:57', '3', '', '43860.29770867628', '25372.946477417583', '72', '2012-07-17 11:59:57', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3356929', '2012-07-17 11:59:57', '3', '', '37281.3675621588', '16463.450374450855', '7', '2012-07-17 11:59:57', 'cck');
INSERT INTO `t_gps_data` VALUES ('3356930', '2012-07-17 11:59:57', '3', '', '30688.787862546375', '24085.096065913753', '4', '2012-07-17 11:59:57', 'clm');
INSERT INTO `t_gps_data` VALUES ('3356931', '2012-07-17 11:59:57', '2', '', '43057.33445592688', '27141.528118444905', '26', '2012-07-17 11:59:57', 'hou');
INSERT INTO `t_gps_data` VALUES ('3356932', '2012-07-17 11:59:57', '3', '', '44474.757010558955', '21854.82417762114', '18', '2012-07-17 11:59:57', 'jur');
INSERT INTO `t_gps_data` VALUES ('3356933', '2012-07-17 11:59:57', '0', '', '30751.19198758754', '21037.40632758639', '78', '2012-07-17 11:59:57', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3356934', '2012-07-17 12:00:07', '3', '', '41338.557894702964', '35322.099115367106', '39', '2012-07-17 12:00:07', '2');
INSERT INTO `t_gps_data` VALUES ('3356935', '2012-07-17 12:00:07', '3', '', '43447.38723280046', '26020.409174323384', '9', '2012-07-17 12:00:07', '1');
INSERT INTO `t_gps_data` VALUES ('3356936', '2012-07-17 12:00:07', '3', '', '29552.91816267759', '38921.164072208434', '71', '2012-07-17 12:00:07', '4');
INSERT INTO `t_gps_data` VALUES ('3356937', '2012-07-17 12:00:07', '3', '', '29985.960827091723', '22062.760607573957', '1', '2012-07-17 12:00:07', '3');
INSERT INTO `t_gps_data` VALUES ('3356938', '2012-07-17 12:00:07', '2', '', '37835.43709987971', '34289.118206322484', '28', '2012-07-17 12:00:07', '5');
INSERT INTO `t_gps_data` VALUES ('3356939', '2012-07-17 12:00:07', '2', '', '34467.317373207254', '36904.106004656285', '78', '2012-07-17 12:00:07', '6');
INSERT INTO `t_gps_data` VALUES ('3356940', '2012-07-17 12:00:07', '3', '', '44379.44663774977', '32070.12683666223', '51', '2012-07-17 12:00:07', '001190251');
INSERT INTO `t_gps_data` VALUES ('3356941', '2012-07-17 12:00:07', '2', '', '35155.139594153356', '30004.704486012342', '64', '2012-07-17 12:00:07', '001014182');
INSERT INTO `t_gps_data` VALUES ('3356942', '2012-07-17 12:00:07', '0', '', '39611.915876317944', '30893.643805072254', '50', '2012-07-17 12:00:07', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3356943', '2012-07-17 12:00:07', '2', '', '42033.01126624768', '39013.43026961181', '82', '2012-07-17 12:00:07', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3356944', '2012-07-17 12:00:07', '1', '', '34523.182546166376', '10316.277079303969', '69', '2012-07-17 12:00:07', '001001003');
INSERT INTO `t_gps_data` VALUES ('3356945', '2012-07-17 12:00:07', '2', '', '37478.12482158309', '30039.98139686731', '22', '2012-07-17 12:00:07', '001067110');
INSERT INTO `t_gps_data` VALUES ('3356946', '2012-07-17 12:00:07', '1', '', '33573.01894269029', '15563.360706573052', '14', '2012-07-17 12:00:07', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3356947', '2012-07-17 12:00:07', '1', '', '35468.757566293985', '11167.371060187299', '70', '2012-07-17 12:00:07', 'amk');
INSERT INTO `t_gps_data` VALUES ('3356948', '2012-07-17 12:00:07', '3', '', '43786.96984591724', '25368.67035020832', '72', '2012-07-17 12:00:07', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3356949', '2012-07-17 12:00:07', '3', '', '37215.157643140585', '16449.245529346797', '7', '2012-07-17 12:00:07', 'cck');
INSERT INTO `t_gps_data` VALUES ('3356950', '2012-07-17 12:00:07', '3', '', '30640.040803511794', '24068.272736178475', '4', '2012-07-17 12:00:07', 'clm');
INSERT INTO `t_gps_data` VALUES ('3356951', '2012-07-17 12:00:07', '2', '', '43095.01397537106', '27163.485775494504', '26', '2012-07-17 12:00:07', 'hou');
INSERT INTO `t_gps_data` VALUES ('3356952', '2012-07-17 12:00:07', '3', '', '44399.09961394864', '21849.997131766788', '18', '2012-07-17 12:00:07', 'jur');
INSERT INTO `t_gps_data` VALUES ('3356953', '2012-07-17 12:00:07', '0', '', '30725.378462264183', '20992.366462622893', '78', '2012-07-17 12:00:07', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3356954', '2012-07-17 12:00:17', '3', '', '41242.20661167482', '35300.190329794386', '39', '2012-07-17 12:00:17', '2');
INSERT INTO `t_gps_data` VALUES ('3356955', '2012-07-17 12:00:17', '3', '', '43375.80300271981', '26000.180614267312', '9', '2012-07-17 12:00:17', '1');
INSERT INTO `t_gps_data` VALUES ('3356956', '2012-07-17 12:00:17', '3', '', '29479.736861289097', '38892.01195153674', '71', '2012-07-17 12:00:17', '4');
INSERT INTO `t_gps_data` VALUES ('3356957', '2012-07-17 12:00:17', '3', '', '29926.034540007982', '22053.575104262185', '1', '2012-07-17 12:00:17', '3');
INSERT INTO `t_gps_data` VALUES ('3356958', '2012-07-17 12:00:17', '2', '', '37901.34989154973', '34311.61583388275', '28', '2012-07-17 12:00:17', '5');
INSERT INTO `t_gps_data` VALUES ('3356959', '2012-07-17 12:00:17', '2', '', '34537.86427214238', '36914.954498875784', '78', '2012-07-17 12:00:17', '6');
INSERT INTO `t_gps_data` VALUES ('3356960', '2012-07-17 12:00:17', '3', '', '44324.10089630155', '32047.3769039375', '51', '2012-07-17 12:00:17', '001190251');
INSERT INTO `t_gps_data` VALUES ('3356961', '2012-07-17 12:00:17', '2', '', '35185.88473691432', '30030.725514156926', '64', '2012-07-17 12:00:17', '001014182');
INSERT INTO `t_gps_data` VALUES ('3356962', '2012-07-17 12:00:17', '0', '', '39607.204273715004', '30795.376637693604', '50', '2012-07-17 12:00:17', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3356963', '2012-07-17 12:00:17', '2', '', '42086.65615964157', '39041.70606866139', '82', '2012-07-17 12:00:17', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3356964', '2012-07-17 12:00:17', '1', '', '34527.652036048356', '10377.065555335745', '69', '2012-07-17 12:00:17', '001001003');
INSERT INTO `t_gps_data` VALUES ('3356965', '2012-07-17 12:00:17', '2', '', '37524.47904158825', '30057.898595943236', '22', '2012-07-17 12:00:17', '001067110');
INSERT INTO `t_gps_data` VALUES ('3356966', '2012-07-17 12:00:17', '1', '', '33595.59340653853', '15598.553760161944', '14', '2012-07-17 12:00:17', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3356967', '2012-07-17 12:00:17', '1', '', '35472.97003496359', '11205.325589521182', '70', '2012-07-17 12:00:17', 'amk');
INSERT INTO `t_gps_data` VALUES ('3356968', '2012-07-17 12:00:17', '3', '', '43703.69465039388', '25349.907131235355', '72', '2012-07-17 12:00:17', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3356969', '2012-07-17 12:00:17', '3', '', '37144.88864724888', '16420.090167012473', '7', '2012-07-17 12:00:17', 'cck');
INSERT INTO `t_gps_data` VALUES ('3356970', '2012-07-17 12:00:17', '3', '', '30609.02335896796', '24066.206097145267', '4', '2012-07-17 12:00:17', 'clm');
INSERT INTO `t_gps_data` VALUES ('3356971', '2012-07-17 12:00:17', '2', '', '43174.52185863007', '27171.275494052472', '26', '2012-07-17 12:00:17', 'hou');
INSERT INTO `t_gps_data` VALUES ('3356972', '2012-07-17 12:00:17', '3', '', '44349.07311877813', '21820.77875124204', '18', '2012-07-17 12:00:17', 'jur');
INSERT INTO `t_gps_data` VALUES ('3356973', '2012-07-17 12:00:17', '0', '', '30704.47184797638', '20959.912684291212', '78', '2012-07-17 12:00:17', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3356974', '2012-07-17 12:00:27', '3', '', '41195.94534380705', '35298.081349953165', '39', '2012-07-17 12:00:27', '2');
INSERT INTO `t_gps_data` VALUES ('3356975', '2012-07-17 12:00:27', '3', '', '43297.194101653375', '25987.289488410825', '9', '2012-07-17 12:00:27', '1');
INSERT INTO `t_gps_data` VALUES ('3356976', '2012-07-17 12:00:27', '3', '', '29419.525141214865', '38882.6967125039', '71', '2012-07-17 12:00:27', '4');
INSERT INTO `t_gps_data` VALUES ('3356977', '2012-07-17 12:00:27', '3', '', '29857.924306998895', '22051.852732957133', '1', '2012-07-17 12:00:27', '3');
INSERT INTO `t_gps_data` VALUES ('3356978', '2012-07-17 12:00:27', '2', '', '37992.6710114531', '34323.14161567319', '28', '2012-07-17 12:00:27', '5');
INSERT INTO `t_gps_data` VALUES ('3356979', '2012-07-17 12:00:27', '2', '', '34625.517803270624', '36921.15123004531', '78', '2012-07-17 12:00:27', '6');
INSERT INTO `t_gps_data` VALUES ('3356980', '2012-07-17 12:00:27', '3', '', '44232.82030095614', '32019.039784991794', '51', '2012-07-17 12:00:27', '001190251');
INSERT INTO `t_gps_data` VALUES ('3356981', '2012-07-17 12:00:27', '2', '', '35264.790651364136', '30037.980914688153', '64', '2012-07-17 12:00:27', '001014182');
INSERT INTO `t_gps_data` VALUES ('3356982', '2012-07-17 12:00:27', '0', '', '39585.920354120055', '30720.2247535472', '50', '2012-07-17 12:00:27', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3356983', '2012-07-17 12:00:27', '2', '', '42153.020939464666', '39055.2533029764', '82', '2012-07-17 12:00:27', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3356984', '2012-07-17 12:00:27', '1', '', '34533.476877456786', '10471.37570714069', '69', '2012-07-17 12:00:27', '001001003');
INSERT INTO `t_gps_data` VALUES ('3356985', '2012-07-17 12:00:27', '2', '', '37615.51153866049', '30075.79257077064', '22', '2012-07-17 12:00:27', '001067110');
INSERT INTO `t_gps_data` VALUES ('3356986', '2012-07-17 12:00:27', '1', '', '33599.10200969885', '15654.28094357228', '14', '2012-07-17 12:00:27', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3356987', '2012-07-17 12:00:27', '1', '', '35477.256755437375', '11303.147627161014', '70', '2012-07-17 12:00:27', 'amk');
INSERT INTO `t_gps_data` VALUES ('3356988', '2012-07-17 12:00:27', '3', '', '43648.22104181451', '25339.64701369361', '72', '2012-07-17 12:00:27', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3356989', '2012-07-17 12:00:27', '3', '', '37088.502810495585', '16399.07302576121', '7', '2012-07-17 12:00:27', 'cck');
INSERT INTO `t_gps_data` VALUES ('3356990', '2012-07-17 12:00:27', '3', '', '30565.70206530449', '24050.95710084353', '4', '2012-07-17 12:00:27', 'clm');
INSERT INTO `t_gps_data` VALUES ('3356991', '2012-07-17 12:00:27', '2', '', '43243.18331549553', '27177.196182064843', '26', '2012-07-17 12:00:27', 'hou');
INSERT INTO `t_gps_data` VALUES ('3356992', '2012-07-17 12:00:27', '3', '', '44293.21997080811', '21810.56240284433', '18', '2012-07-17 12:00:27', 'jur');
INSERT INTO `t_gps_data` VALUES ('3356993', '2012-07-17 12:00:27', '0', '', '30696.933205281515', '20867.467303538153', '78', '2012-07-17 12:00:27', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3356994', '2012-07-17 12:00:37', '3', '', '41112.610221566676', '35269.653027176246', '39', '2012-07-17 12:00:37', '2');
INSERT INTO `t_gps_data` VALUES ('3356995', '2012-07-17 12:00:37', '3', '', '43226.79494616684', '25970.79220301756', '9', '2012-07-17 12:00:37', '1');
INSERT INTO `t_gps_data` VALUES ('3356996', '2012-07-17 12:00:37', '3', '', '29366.69038183878', '38872.850489284494', '71', '2012-07-17 12:00:37', '4');
INSERT INTO `t_gps_data` VALUES ('3356997', '2012-07-17 12:00:37', '3', '', '29772.927048281723', '22050.52831553147', '1', '2012-07-17 12:00:37', '3');
INSERT INTO `t_gps_data` VALUES ('3356998', '2012-07-17 12:00:37', '2', '', '38054.37685834412', '34335.21537822297', '28', '2012-07-17 12:00:37', '5');
INSERT INTO `t_gps_data` VALUES ('3356999', '2012-07-17 12:00:37', '2', '', '34691.009057757605', '36925.308529669135', '78', '2012-07-17 12:00:37', '6');
INSERT INTO `t_gps_data` VALUES ('3357000', '2012-07-17 12:00:37', '3', '', '44189.76654705138', '32006.232063814467', '51', '2012-07-17 12:00:37', '001190251');
INSERT INTO `t_gps_data` VALUES ('3357001', '2012-07-17 12:00:37', '2', '', '35338.256271569386', '30066.841886845785', '64', '2012-07-17 12:00:37', '001014182');
INSERT INTO `t_gps_data` VALUES ('3357002', '2012-07-17 12:00:37', '0', '', '39560.581715978726', '30641.91984738649', '50', '2012-07-17 12:00:37', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3357003', '2012-07-17 12:00:37', '2', '', '42238.048122650056', '39076.447850785036', '82', '2012-07-17 12:00:37', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3357004', '2012-07-17 12:00:37', '1', '', '34552.728565532256', '10569.347091300368', '69', '2012-07-17 12:00:37', '001001003');
INSERT INTO `t_gps_data` VALUES ('3357005', '2012-07-17 12:00:37', '2', '', '37686.901331366586', '30090.212524976097', '22', '2012-07-17 12:00:37', '001067110');
INSERT INTO `t_gps_data` VALUES ('3357006', '2012-07-17 12:00:37', '1', '', '33607.97340742535', '15722.110255269628', '14', '2012-07-17 12:00:37', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3357007', '2012-07-17 12:00:37', '1', '', '35498.831650104694', '11388.79742026977', '70', '2012-07-17 12:00:37', 'amk');
INSERT INTO `t_gps_data` VALUES ('3357008', '2012-07-17 12:00:37', '3', '', '43555.183101121', '25327.194239334123', '72', '2012-07-17 12:00:37', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3357009', '2012-07-17 12:00:37', '3', '', '37003.6810143603', '16372.325302742835', '7', '2012-07-17 12:00:37', 'cck');
INSERT INTO `t_gps_data` VALUES ('3357010', '2012-07-17 12:00:37', '3', '', '30474.757547442572', '24042.774716897024', '4', '2012-07-17 12:00:37', 'clm');
INSERT INTO `t_gps_data` VALUES ('3357011', '2012-07-17 12:00:37', '2', '', '43339.570303946086', '27188.11367176996', '26', '2012-07-17 12:00:37', 'hou');
INSERT INTO `t_gps_data` VALUES ('3357012', '2012-07-17 12:00:37', '3', '', '44260.08337655021', '21791.581419893748', '18', '2012-07-17 12:00:37', 'jur');
INSERT INTO `t_gps_data` VALUES ('3357013', '2012-07-17 12:00:37', '0', '', '30679.095786645223', '20798.84629597449', '78', '2012-07-17 12:00:37', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3357014', '2012-07-17 12:00:47', '3', '', '41025.37845815783', '35255.099010093436', '39', '2012-07-17 12:00:47', '2');
INSERT INTO `t_gps_data` VALUES ('3357015', '2012-07-17 12:00:47', '3', '', '43174.943392613386', '25963.545441772963', '9', '2012-07-17 12:00:47', '1');
INSERT INTO `t_gps_data` VALUES ('3357016', '2012-07-17 12:00:47', '3', '', '29268.82344163509', '38866.06919071056', '71', '2012-07-17 12:00:47', '4');
INSERT INTO `t_gps_data` VALUES ('3357017', '2012-07-17 12:00:47', '3', '', '29707.76053311288', '22050.075742119996', '1', '2012-07-17 12:00:47', '3');
INSERT INTO `t_gps_data` VALUES ('3357018', '2012-07-17 12:00:47', '2', '', '38092.259300212594', '34360.24860866499', '28', '2012-07-17 12:00:47', '5');
INSERT INTO `t_gps_data` VALUES ('3357019', '2012-07-17 12:00:47', '2', '', '34744.69110889441', '36930.07842243753', '78', '2012-07-17 12:00:47', '6');
INSERT INTO `t_gps_data` VALUES ('3357020', '2012-07-17 12:00:47', '3', '', '44112.98639962931', '31985.52327742228', '51', '2012-07-17 12:00:47', '001190251');
INSERT INTO `t_gps_data` VALUES ('3357021', '2012-07-17 12:00:47', '2', '', '35410.956930221946', '30086.41608062571', '64', '2012-07-17 12:00:47', '001014182');
INSERT INTO `t_gps_data` VALUES ('3357022', '2012-07-17 12:00:47', '0', '', '39558.258737564945', '30582.183371791223', '50', '2012-07-17 12:00:47', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3357023', '2012-07-17 12:00:47', '2', '', '42303.41284749552', '39098.02163470307', '82', '2012-07-17 12:00:47', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3357024', '2012-07-17 12:00:47', '1', '', '34578.59518417466', '10627.359637635696', '69', '2012-07-17 12:00:47', '001001003');
INSERT INTO `t_gps_data` VALUES ('3357025', '2012-07-17 12:00:47', '2', '', '37762.30691711342', '30090.90661700819', '22', '2012-07-17 12:00:47', '001067110');
INSERT INTO `t_gps_data` VALUES ('3357026', '2012-07-17 12:00:47', '1', '', '33622.87438326049', '15803.536006519958', '14', '2012-07-17 12:00:47', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3357027', '2012-07-17 12:00:47', '1', '', '35510.24715680773', '11471.508111445055', '70', '2012-07-17 12:00:47', 'amk');
INSERT INTO `t_gps_data` VALUES ('3357028', '2012-07-17 12:00:47', '3', '', '43512.18973568391', '25297.35790646177', '72', '2012-07-17 12:00:47', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3357029', '2012-07-17 12:00:47', '3', '', '36912.753621666', '16352.997010828669', '7', '2012-07-17 12:00:47', 'cck');
INSERT INTO `t_gps_data` VALUES ('3357030', '2012-07-17 12:00:47', '3', '', '30395.596565880252', '24019.87316980802', '4', '2012-07-17 12:00:47', 'clm');
INSERT INTO `t_gps_data` VALUES ('3357031', '2012-07-17 12:00:47', '2', '', '43405.436011806705', '27205.71235120818', '26', '2012-07-17 12:00:47', 'hou');
INSERT INTO `t_gps_data` VALUES ('3357032', '2012-07-17 12:00:47', '3', '', '44171.267416567345', '21774.441150266004', '18', '2012-07-17 12:00:47', 'jur');
INSERT INTO `t_gps_data` VALUES ('3357033', '2012-07-17 12:00:47', '0', '', '30665.34285239118', '20737.5362423373', '78', '2012-07-17 12:00:47', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3357034', '2012-07-17 12:00:57', '3', '', '40956.605169835355', '35253.48126582641', '39', '2012-07-17 12:00:57', '2');
INSERT INTO `t_gps_data` VALUES ('3357035', '2012-07-17 12:00:57', '3', '', '43088.409551809695', '25960.490637937324', '9', '2012-07-17 12:00:57', '1');
INSERT INTO `t_gps_data` VALUES ('3357036', '2012-07-17 12:00:57', '3', '', '29202.619904253428', '38843.30295141227', '71', '2012-07-17 12:00:57', '4');
INSERT INTO `t_gps_data` VALUES ('3357037', '2012-07-17 12:00:57', '3', '', '29640.429557530097', '22046.04933669995', '1', '2012-07-17 12:00:57', '3');
INSERT INTO `t_gps_data` VALUES ('3357038', '2012-07-17 12:00:57', '2', '', '38134.72489860217', '34388.64342263139', '28', '2012-07-17 12:00:57', '5');
INSERT INTO `t_gps_data` VALUES ('3357039', '2012-07-17 12:00:57', '2', '', '34777.786154745125', '36943.35631049278', '78', '2012-07-17 12:00:57', '6');
INSERT INTO `t_gps_data` VALUES ('3357040', '2012-07-17 12:00:57', '3', '', '44015.23969552844', '31966.212707732517', '51', '2012-07-17 12:00:57', '001190251');
INSERT INTO `t_gps_data` VALUES ('3357041', '2012-07-17 12:00:57', '2', '', '35501.859812603325', '30095.19931611762', '64', '2012-07-17 12:00:57', '001014182');
INSERT INTO `t_gps_data` VALUES ('3357042', '2012-07-17 12:00:58', '0', '', '39552.77578431745', '30541.103278371545', '50', '2012-07-17 12:00:58', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3357043', '2012-07-17 12:00:58', '2', '', '42347.34343587348', '39105.15570944536', '82', '2012-07-17 12:00:58', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3357044', '2012-07-17 12:00:58', '1', '', '34586.46414232532', '10683.564439078373', '69', '2012-07-17 12:00:58', '001001003');
INSERT INTO `t_gps_data` VALUES ('3357045', '2012-07-17 12:00:58', '2', '', '37799.46782978383', '30092.86989699808', '22', '2012-07-17 12:00:58', '001067110');
INSERT INTO `t_gps_data` VALUES ('3357046', '2012-07-17 12:00:58', '1', '', '33641.3181820959', '15862.361296484332', '14', '2012-07-17 12:00:58', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3357047', '2012-07-17 12:00:58', '1', '', '35525.86117471615', '11524.356646579832', '70', '2012-07-17 12:00:58', 'amk');
INSERT INTO `t_gps_data` VALUES ('3357048', '2012-07-17 12:00:58', '3', '', '43422.803713157125', '25289.89616865341', '72', '2012-07-17 12:00:58', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3357049', '2012-07-17 12:00:58', '3', '', '36852.625317232196', '16333.537666173246', '7', '2012-07-17 12:00:58', 'cck');
INSERT INTO `t_gps_data` VALUES ('3357050', '2012-07-17 12:00:58', '3', '', '30360.95045662325', '24005.516010045376', '4', '2012-07-17 12:00:58', 'clm');
INSERT INTO `t_gps_data` VALUES ('3357051', '2012-07-17 12:00:58', '2', '', '43503.93144148308', '27230.45784553736', '26', '2012-07-17 12:00:58', 'hou');
INSERT INTO `t_gps_data` VALUES ('3357052', '2012-07-17 12:00:58', '3', '', '44106.48391471817', '21758.634442021797', '18', '2012-07-17 12:00:58', 'jur');
INSERT INTO `t_gps_data` VALUES ('3357053', '2012-07-17 12:00:58', '0', '', '30638.30444417393', '20682.597421162664', '78', '2012-07-17 12:00:58', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3357054', '2012-07-17 12:01:08', '3', '', '40870.412266086896', '35245.870872370295', '39', '2012-07-17 12:01:08', '2');
INSERT INTO `t_gps_data` VALUES ('3357055', '2012-07-17 12:01:08', '3', '', '42991.07560008115', '25959.77365907781', '9', '2012-07-17 12:01:08', '1');
INSERT INTO `t_gps_data` VALUES ('3357056', '2012-07-17 12:01:08', '3', '', '29130.628626351096', '38840.49886246999', '71', '2012-07-17 12:01:08', '4');
INSERT INTO `t_gps_data` VALUES ('3357057', '2012-07-17 12:01:08', '3', '', '29545.402720970593', '22034.3801209829', '1', '2012-07-17 12:01:08', '3');
INSERT INTO `t_gps_data` VALUES ('3357058', '2012-07-17 12:01:08', '2', '', '38177.591163555786', '34416.61671192742', '28', '2012-07-17 12:01:08', '5');
INSERT INTO `t_gps_data` VALUES ('3357059', '2012-07-17 12:01:08', '2', '', '34808.826895073216', '36953.92094422047', '78', '2012-07-17 12:01:08', '6');
INSERT INTO `t_gps_data` VALUES ('3357060', '2012-07-17 12:01:08', '3', '', '43924.30524041452', '31950.01227876714', '51', '2012-07-17 12:01:08', '001190251');
INSERT INTO `t_gps_data` VALUES ('3357061', '2012-07-17 12:01:08', '2', '', '35557.414105517295', '30099.98878936298', '64', '2012-07-17 12:01:08', '001014182');
INSERT INTO `t_gps_data` VALUES ('3357062', '2012-07-17 12:01:08', '0', '', '39536.378807645946', '30474.585258395324', '50', '2012-07-17 12:01:08', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3357063', '2012-07-17 12:01:08', '2', '', '42446.905226308314', '39118.37597858058', '82', '2012-07-17 12:01:08', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3357064', '2012-07-17 12:01:08', '1', '', '34616.01985228436', '10778.847926882969', '69', '2012-07-17 12:01:08', '001001003');
INSERT INTO `t_gps_data` VALUES ('3357065', '2012-07-17 12:01:08', '2', '', '37850.68448050938', '30121.901488339307', '22', '2012-07-17 12:01:08', '001067110');
INSERT INTO `t_gps_data` VALUES ('3357066', '2012-07-17 12:01:08', '1', '', '33645.56304797241', '15911.65046107492', '14', '2012-07-17 12:01:08', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3357067', '2012-07-17 12:01:08', '1', '', '35532.675516279', '11600.670270915947', '70', '2012-07-17 12:01:08', 'amk');
INSERT INTO `t_gps_data` VALUES ('3357068', '2012-07-17 12:01:08', '3', '', '43367.32550520327', '25263.015343647363', '72', '2012-07-17 12:01:08', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3357069', '2012-07-17 12:01:08', '3', '', '36778.44830852224', '16325.811507859305', '7', '2012-07-17 12:01:08', 'cck');
INSERT INTO `t_gps_data` VALUES ('3357070', '2012-07-17 12:01:08', '3', '', '30278.50818037024', '23980.107793959436', '4', '2012-07-17 12:01:08', 'clm');
INSERT INTO `t_gps_data` VALUES ('3357071', '2012-07-17 12:01:08', '2', '', '43554.89416636344', '27234.826514182583', '26', '2012-07-17 12:01:08', 'hou');
INSERT INTO `t_gps_data` VALUES ('3357072', '2012-07-17 12:01:08', '3', '', '44073.0495693219', '21753.496588007794', '18', '2012-07-17 12:01:08', 'jur');
INSERT INTO `t_gps_data` VALUES ('3357073', '2012-07-17 12:01:08', '0', '', '30631.401779995344', '20648.423331290658', '78', '2012-07-17 12:01:08', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3357074', '2012-07-17 12:01:18', '3', '', '40796.14417834501', '35239.65011888335', '39', '2012-07-17 12:01:18', '2');
INSERT INTO `t_gps_data` VALUES ('3357075', '2012-07-17 12:01:18', '3', '', '42946.72824099812', '25933.87837352716', '9', '2012-07-17 12:01:18', '1');
INSERT INTO `t_gps_data` VALUES ('3357076', '2012-07-17 12:01:18', '3', '', '29087.039008081556', '38825.096860825666', '71', '2012-07-17 12:01:18', '4');
INSERT INTO `t_gps_data` VALUES ('3357077', '2012-07-17 12:01:18', '3', '', '29454.806740748885', '22012.75610680261', '1', '2012-07-17 12:01:18', '3');
INSERT INTO `t_gps_data` VALUES ('3357078', '2012-07-17 12:01:18', '2', '', '38243.660421655455', '34432.64766556063', '28', '2012-07-17 12:01:18', '5');
INSERT INTO `t_gps_data` VALUES ('3357079', '2012-07-17 12:01:18', '2', '', '34890.68714835387', '36980.07013344718', '78', '2012-07-17 12:01:18', '6');
INSERT INTO `t_gps_data` VALUES ('3357080', '2012-07-17 12:01:18', '3', '', '43890.02536687318', '31928.816965837384', '51', '2012-07-17 12:01:18', '001190251');
INSERT INTO `t_gps_data` VALUES ('3357081', '2012-07-17 12:01:18', '2', '', '35634.634782753215', '30120.551651551792', '64', '2012-07-17 12:01:18', '001014182');
INSERT INTO `t_gps_data` VALUES ('3357082', '2012-07-17 12:01:18', '0', '', '39507.20381145378', '30423.816469627684', '50', '2012-07-17 12:01:18', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3357083', '2012-07-17 12:01:18', '2', '', '42480.53467327295', '39145.608639820246', '82', '2012-07-17 12:01:18', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3357084', '2012-07-17 12:01:18', '1', '', '34629.62100262259', '10854.59616329038', '69', '2012-07-17 12:01:18', '001001003');
INSERT INTO `t_gps_data` VALUES ('3357085', '2012-07-17 12:01:18', '2', '', '37928.026949594096', '30129.284864683388', '22', '2012-07-17 12:01:18', '001067110');
INSERT INTO `t_gps_data` VALUES ('3357086', '2012-07-17 12:01:18', '1', '', '33656.55547402303', '15963.819541417028', '14', '2012-07-17 12:01:18', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3357087', '2012-07-17 12:01:18', '1', '', '35538.04452796599', '11661.763649491837', '70', '2012-07-17 12:01:18', 'amk');
INSERT INTO `t_gps_data` VALUES ('3357088', '2012-07-17 12:01:18', '3', '', '43309.119700986914', '25261.69064539471', '72', '2012-07-17 12:01:18', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3357089', '2012-07-17 12:01:18', '3', '', '36739.22158775467', '16297.082584965403', '7', '2012-07-17 12:01:18', 'cck');
INSERT INTO `t_gps_data` VALUES ('3357090', '2012-07-17 12:01:18', '3', '', '30247.734380168193', '23952.387511986908', '4', '2012-07-17 12:01:18', 'clm');
INSERT INTO `t_gps_data` VALUES ('3357091', '2012-07-17 12:01:18', '2', '', '43594.476597653746', '27259.31165942151', '26', '2012-07-17 12:01:18', 'hou');
INSERT INTO `t_gps_data` VALUES ('3357092', '2012-07-17 12:01:18', '3', '', '44039.406843289704', '21736.09066275661', '18', '2012-07-17 12:01:18', 'jur');
INSERT INTO `t_gps_data` VALUES ('3357093', '2012-07-17 12:01:18', '0', '', '30625.832327211', '20562.627975969455', '78', '2012-07-17 12:01:18', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3357094', '2012-07-17 12:01:28', '3', '', '40714.6163112912', '35221.64492992319', '39', '2012-07-17 12:01:28', '2');
INSERT INTO `t_gps_data` VALUES ('3357095', '2012-07-17 12:01:28', '3', '', '42889.966975184274', '25906.54051881385', '9', '2012-07-17 12:01:28', '1');
INSERT INTO `t_gps_data` VALUES ('3357096', '2012-07-17 12:01:28', '3', '', '29033.789863611677', '38823.25030690923', '71', '2012-07-17 12:01:28', '4');
INSERT INTO `t_gps_data` VALUES ('3357097', '2012-07-17 12:01:28', '3', '', '29365.757405377844', '21999.41092156197', '1', '2012-07-17 12:01:28', '3');
INSERT INTO `t_gps_data` VALUES ('3357098', '2012-07-17 12:01:28', '2', '', '38292.19548028054', '34459.67573909747', '28', '2012-07-17 12:01:28', '5');
INSERT INTO `t_gps_data` VALUES ('3357099', '2012-07-17 12:01:28', '2', '', '34982.61885044307', '37000.54720976216', '78', '2012-07-17 12:01:28', '6');
INSERT INTO `t_gps_data` VALUES ('3357100', '2012-07-17 12:01:28', '3', '', '43858.18160006801', '31909.541536331642', '51', '2012-07-17 12:01:28', '001190251');
INSERT INTO `t_gps_data` VALUES ('3357101', '2012-07-17 12:01:28', '2', '', '35677.34479164326', '30131.194237928452', '64', '2012-07-17 12:01:28', '001014182');
INSERT INTO `t_gps_data` VALUES ('3357102', '2012-07-17 12:01:28', '0', '', '39479.46477873984', '30372.13611184824', '50', '2012-07-17 12:01:28', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3357103', '2012-07-17 12:01:28', '2', '', '42515.09486693574', '39151.012252971996', '82', '2012-07-17 12:01:28', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3357104', '2012-07-17 12:01:28', '1', '', '34641.20723307616', '10938.985984101746', '69', '2012-07-17 12:01:28', '001001003');
INSERT INTO `t_gps_data` VALUES ('3357105', '2012-07-17 12:01:28', '2', '', '37966.5675214545', '30141.642153704877', '22', '2012-07-17 12:01:28', '001067110');
INSERT INTO `t_gps_data` VALUES ('3357106', '2012-07-17 12:01:28', '1', '', '33681.385529046755', '16063.548033553709', '14', '2012-07-17 12:01:28', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3357107', '2012-07-17 12:01:28', '1', '', '35549.78877336338', '11724.645645405728', '70', '2012-07-17 12:01:28', 'amk');
INSERT INTO `t_gps_data` VALUES ('3357108', '2012-07-17 12:01:28', '3', '', '43264.50024740169', '25254.972495996437', '72', '2012-07-17 12:01:28', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3357109', '2012-07-17 12:01:28', '3', '', '36685.3540800702', '16275.831641884166', '7', '2012-07-17 12:01:28', 'cck');
INSERT INTO `t_gps_data` VALUES ('3357110', '2012-07-17 12:01:28', '3', '', '30157.56529753838', '23946.170925504684', '4', '2012-07-17 12:01:28', 'clm');
INSERT INTO `t_gps_data` VALUES ('3357111', '2012-07-17 12:01:28', '2', '', '43650.22558655259', '27272.342525252832', '26', '2012-07-17 12:01:28', 'hou');
INSERT INTO `t_gps_data` VALUES ('3357112', '2012-07-17 12:01:28', '3', '', '43983.55282883109', '21720.856669268713', '18', '2012-07-17 12:01:28', 'jur');
INSERT INTO `t_gps_data` VALUES ('3357113', '2012-07-17 12:01:28', '0', '', '30602.90316365549', '20514.459408933653', '78', '2012-07-17 12:01:28', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3357114', '2012-07-17 12:01:38', '3', '', '40643.68120652855', '35203.57537917269', '39', '2012-07-17 12:01:38', '2');
INSERT INTO `t_gps_data` VALUES ('3357115', '2012-07-17 12:01:38', '3', '', '42793.59247082875', '25889.022943210664', '9', '2012-07-17 12:01:38', '1');
INSERT INTO `t_gps_data` VALUES ('3357116', '2012-07-17 12:01:38', '3', '', '28955.205820215368', '38801.37775999342', '71', '2012-07-17 12:01:38', '4');
INSERT INTO `t_gps_data` VALUES ('3357117', '2012-07-17 12:01:38', '3', '', '29275.248824408987', '21981.359581001132', '1', '2012-07-17 12:01:38', '3');
INSERT INTO `t_gps_data` VALUES ('3357118', '2012-07-17 12:01:38', '2', '', '38389.12294693718', '34464.63191047499', '28', '2012-07-17 12:01:38', '5');
INSERT INTO `t_gps_data` VALUES ('3357119', '2012-07-17 12:01:38', '2', '', '35018.72200113743', '37009.88178171678', '78', '2012-07-17 12:01:38', '6');
INSERT INTO `t_gps_data` VALUES ('3357120', '2012-07-17 12:01:38', '3', '', '43826.53437648211', '31884.20216322935', '51', '2012-07-17 12:01:38', '001190251');
INSERT INTO `t_gps_data` VALUES ('3357121', '2012-07-17 12:01:38', '2', '', '35746.649606833395', '30149.9884983144', '64', '2012-07-17 12:01:38', '001014182');
INSERT INTO `t_gps_data` VALUES ('3357122', '2012-07-17 12:01:38', '0', '', '39465.03615923113', '30308.067769020727', '50', '2012-07-17 12:01:38', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3357123', '2012-07-17 12:01:38', '2', '', '42557.3356667516', '39171.84158908618', '82', '2012-07-17 12:01:38', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3357124', '2012-07-17 12:01:38', '1', '', '34665.117748114644', '10994.557942734446', '69', '2012-07-17 12:01:38', '001001003');
INSERT INTO `t_gps_data` VALUES ('3357125', '2012-07-17 12:01:38', '2', '', '38006.807181439566', '30165.738874283197', '22', '2012-07-17 12:01:38', '001067110');
INSERT INTO `t_gps_data` VALUES ('3357126', '2012-07-17 12:01:38', '1', '', '33681.71268286989', '16156.217658585454', '14', '2012-07-17 12:01:38', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3357127', '2012-07-17 12:01:38', '1', '', '35564.60989085823', '11797.69407731995', '70', '2012-07-17 12:01:38', 'amk');
INSERT INTO `t_gps_data` VALUES ('3357128', '2012-07-17 12:01:38', '3', '', '43191.11692409456', '25228.865103541608', '72', '2012-07-17 12:01:38', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3357129', '2012-07-17 12:01:38', '3', '', '36634.73104176238', '16259.89605521017', '7', '2012-07-17 12:01:38', 'cck');
INSERT INTO `t_gps_data` VALUES ('3357130', '2012-07-17 12:01:38', '3', '', '30063.3471708123', '23934.077071729356', '4', '2012-07-17 12:01:38', 'clm');
INSERT INTO `t_gps_data` VALUES ('3357131', '2012-07-17 12:01:38', '2', '', '43735.051963225465', '27272.974610104164', '26', '2012-07-17 12:01:38', 'hou');
INSERT INTO `t_gps_data` VALUES ('3357132', '2012-07-17 12:01:38', '3', '', '43944.283687297335', '21701.890396350012', '18', '2012-07-17 12:01:38', 'jur');
INSERT INTO `t_gps_data` VALUES ('3357133', '2012-07-17 12:01:38', '0', '', '30592.057869839886', '20428.40710818869', '78', '2012-07-17 12:01:38', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3357134', '2012-07-17 12:01:48', '3', '', '40601.8839380777', '35179.57106176829', '39', '2012-07-17 12:01:48', '2');
INSERT INTO `t_gps_data` VALUES ('3357135', '2012-07-17 12:01:48', '3', '', '42718.9002233385', '25871.61466489018', '9', '2012-07-17 12:01:48', '1');
INSERT INTO `t_gps_data` VALUES ('3357136', '2012-07-17 12:01:48', '2', '', '28862.47407206633', '38794.523228965714', '71', '2012-07-17 12:01:48', '4');
INSERT INTO `t_gps_data` VALUES ('3357137', '2012-07-17 12:01:48', '3', '', '29200.830876107982', '21959.063414979108', '1', '2012-07-17 12:01:48', '3');
INSERT INTO `t_gps_data` VALUES ('3357138', '2012-07-17 12:01:48', '2', '', '38471.91995122253', '34487.315128511196', '28', '2012-07-17 12:01:48', '5');
INSERT INTO `t_gps_data` VALUES ('3357139', '2012-07-17 12:01:48', '2', '', '35082.49543345048', '37035.78585669396', '78', '2012-07-17 12:01:48', '6');
INSERT INTO `t_gps_data` VALUES ('3357140', '2012-07-17 12:01:48', '3', '', '43751.66150961336', '31879.98403139263', '51', '2012-07-17 12:01:48', '001190251');
INSERT INTO `t_gps_data` VALUES ('3357141', '2012-07-17 12:01:48', '2', '', '35807.73018300851', '30166.059900298944', '64', '2012-07-17 12:01:48', '001014182');
INSERT INTO `t_gps_data` VALUES ('3357142', '2012-07-17 12:01:48', '0', '', '39462.81964922204', '30251.215742799643', '50', '2012-07-17 12:01:48', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3357143', '2012-07-17 12:01:48', '2', '', '42613.908709244664', '39199.86551674191', '82', '2012-07-17 12:01:48', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3357144', '2012-07-17 12:01:48', '1', '', '34678.48215549905', '11056.568379159831', '69', '2012-07-17 12:01:48', '001001003');
INSERT INTO `t_gps_data` VALUES ('3357145', '2012-07-17 12:01:48', '2', '', '38053.70259532819', '30173.19770093606', '22', '2012-07-17 12:01:48', '001067110');
INSERT INTO `t_gps_data` VALUES ('3357146', '2012-07-17 12:01:48', '1', '', '33698.461446886286', '16249.305616205764', '14', '2012-07-17 12:01:48', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3357147', '2012-07-17 12:01:48', '1', '', '35572.76323653798', '11844.614404631187', '70', '2012-07-17 12:01:48', 'amk');
INSERT INTO `t_gps_data` VALUES ('3357148', '2012-07-17 12:01:48', '3', '', '43097.81062311689', '25215.063741453334', '72', '2012-07-17 12:01:48', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3357149', '2012-07-17 12:01:48', '3', '', '36576.10683200863', '16237.42685206224', '7', '2012-07-17 12:01:48', 'cck');
INSERT INTO `t_gps_data` VALUES ('3357150', '2012-07-17 12:01:48', '3', '', '30015.544341581342', '23930.193496604712', '4', '2012-07-17 12:01:48', 'clm');
INSERT INTO `t_gps_data` VALUES ('3357151', '2012-07-17 12:01:48', '2', '', '43823.724370607146', '27280.200723091086', '26', '2012-07-17 12:01:48', 'hou');
INSERT INTO `t_gps_data` VALUES ('3357152', '2012-07-17 12:01:48', '3', '', '43904.29484409635', '21701.606037033926', '18', '2012-07-17 12:01:48', 'jur');
INSERT INTO `t_gps_data` VALUES ('3357153', '2012-07-17 12:01:48', '0', '', '30567.093317190778', '20351.037830953872', '78', '2012-07-17 12:01:48', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3357154', '2012-07-17 12:01:58', '3', '', '40511.428960451405', '35173.2575356071', '39', '2012-07-17 12:01:58', '2');
INSERT INTO `t_gps_data` VALUES ('3357155', '2012-07-17 12:01:58', '3', '', '42662.999180468505', '25854.581144290547', '9', '2012-07-17 12:01:58', '1');
INSERT INTO `t_gps_data` VALUES ('3357156', '2012-07-17 12:01:58', '2', '', '28931.541197354418', '38800.45798656718', '71', '2012-07-17 12:01:58', '4');
INSERT INTO `t_gps_data` VALUES ('3357157', '2012-07-17 12:01:58', '3', '', '29125.4001157295', '21958.12691555931', '1', '2012-07-17 12:01:58', '3');
INSERT INTO `t_gps_data` VALUES ('3357158', '2012-07-17 12:01:58', '2', '', '38518.446121795525', '34505.30402139136', '28', '2012-07-17 12:01:58', '5');
INSERT INTO `t_gps_data` VALUES ('3357159', '2012-07-17 12:01:58', '2', '', '35156.795316624455', '37061.547077148374', '78', '2012-07-17 12:01:58', '6');
INSERT INTO `t_gps_data` VALUES ('3357160', '2012-07-17 12:01:58', '3', '', '43660.380329279054', '31868.455273229803', '51', '2012-07-17 12:01:58', '001190251');
INSERT INTO `t_gps_data` VALUES ('3357161', '2012-07-17 12:01:58', '2', '', '35879.40344363889', '30178.037289734275', '64', '2012-07-17 12:01:58', '001014182');
INSERT INTO `t_gps_data` VALUES ('3357162', '2012-07-17 12:01:58', '0', '', '39453.29236642372', '30205.001187839218', '50', '2012-07-17 12:01:58', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3357163', '2012-07-17 12:01:58', '2', '', '42681.77711315954', '39225.84929090853', '82', '2012-07-17 12:01:58', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3357164', '2012-07-17 12:01:58', '1', '', '34682.371413907866', '11119.34468192755', '69', '2012-07-17 12:01:58', '001001003');
INSERT INTO `t_gps_data` VALUES ('3357165', '2012-07-17 12:01:58', '2', '', '38086.1545357493', '30176.166381543244', '22', '2012-07-17 12:01:58', '001067110');
INSERT INTO `t_gps_data` VALUES ('3357166', '2012-07-17 12:01:58', '1', '', '33701.393463271525', '16300.284599032484', '14', '2012-07-17 12:01:58', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3357167', '2012-07-17 12:01:58', '1', '', '35585.34286441836', '11898.023144200864', '70', '2012-07-17 12:01:58', 'amk');
INSERT INTO `t_gps_data` VALUES ('3357168', '2012-07-17 12:01:58', '3', '', '43019.521414701376', '25200.380029286996', '72', '2012-07-17 12:01:58', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3357169', '2012-07-17 12:01:58', '3', '', '36535.05114805963', '16227.349508621775', '7', '2012-07-17 12:01:58', 'cck');
INSERT INTO `t_gps_data` VALUES ('3357170', '2012-07-17 12:01:58', '3', '', '29960.612716141284', '23901.45833080823', '4', '2012-07-17 12:01:58', 'clm');
INSERT INTO `t_gps_data` VALUES ('3357171', '2012-07-17 12:01:58', '2', '', '43867.96318659951', '27283.755666938483', '26', '2012-07-17 12:01:58', 'hou');
INSERT INTO `t_gps_data` VALUES ('3357172', '2012-07-17 12:01:58', '3', '', '43870.48157233536', '21678.88552727523', '18', '2012-07-17 12:01:58', 'jur');
INSERT INTO `t_gps_data` VALUES ('3357173', '2012-07-17 12:01:58', '0', '', '30546.941641930895', '20255.447616074664', '78', '2012-07-17 12:01:58', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3357174', '2012-07-17 12:02:08', '3', '', '40412.3708619652', '35154.24205434186', '39', '2012-07-17 12:02:08', '2');
INSERT INTO `t_gps_data` VALUES ('3357175', '2012-07-17 12:02:08', '3', '', '42619.17141514448', '25840.3917011144', '9', '2012-07-17 12:02:08', '1');
INSERT INTO `t_gps_data` VALUES ('3357176', '2012-07-17 12:02:08', '2', '', '28963.721111890303', '38813.099551830244', '71', '2012-07-17 12:02:08', '4');
INSERT INTO `t_gps_data` VALUES ('3357177', '2012-07-17 12:02:08', '3', '', '29064.040433226764', '21943.472155318042', '1', '2012-07-17 12:02:08', '3');
INSERT INTO `t_gps_data` VALUES ('3357178', '2012-07-17 12:02:08', '2', '', '38570.10930812681', '34533.66995363516', '28', '2012-07-17 12:02:08', '5');
INSERT INTO `t_gps_data` VALUES ('3357179', '2012-07-17 12:02:08', '2', '', '35213.651353204026', '37073.88053917279', '78', '2012-07-17 12:02:08', '6');
INSERT INTO `t_gps_data` VALUES ('3357180', '2012-07-17 12:02:08', '3', '', '43564.2403870668', '31862.546643249254', '51', '2012-07-17 12:02:08', '001190251');
INSERT INTO `t_gps_data` VALUES ('3357181', '2012-07-17 12:02:08', '2', '', '35926.6897213976', '30194.30132657154', '64', '2012-07-17 12:02:08', '001014182');
INSERT INTO `t_gps_data` VALUES ('3357182', '2012-07-17 12:02:08', '0', '', '39438.723292028175', '30164.14085567756', '50', '2012-07-17 12:02:08', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3357183', '2012-07-17 12:02:08', '2', '', '42757.19826095623', '39249.59842460469', '82', '2012-07-17 12:02:08', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3357184', '2012-07-17 12:02:08', '1', '', '34692.48029847225', '11185.042854205944', '69', '2012-07-17 12:02:08', '001001003');
INSERT INTO `t_gps_data` VALUES ('3357185', '2012-07-17 12:02:08', '2', '', '38116.99513776769', '30190.046508380103', '22', '2012-07-17 12:02:08', '001067110');
INSERT INTO `t_gps_data` VALUES ('3357186', '2012-07-17 12:02:08', '1', '', '33718.191683240446', '16399.69470566979', '14', '2012-07-17 12:02:08', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3357187', '2012-07-17 12:02:08', '1', '', '35586.26418246805', '11935.952461815754', '70', '2012-07-17 12:02:08', 'amk');
INSERT INTO `t_gps_data` VALUES ('3357188', '2012-07-17 12:02:08', '3', '', '42970.855684859365', '25194.10717921357', '72', '2012-07-17 12:02:08', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3357189', '2012-07-17 12:02:08', '3', '', '36484.51655326638', '16213.616169307112', '7', '2012-07-17 12:02:08', 'cck');
INSERT INTO `t_gps_data` VALUES ('3357190', '2012-07-17 12:02:08', '3', '', '29901.35811578657', '23888.47144977266', '4', '2012-07-17 12:02:08', 'clm');
INSERT INTO `t_gps_data` VALUES ('3357191', '2012-07-17 12:02:08', '2', '', '43914.48339144164', '27301.04297032159', '26', '2012-07-17 12:02:08', 'hou');
INSERT INTO `t_gps_data` VALUES ('3357192', '2012-07-17 12:02:08', '3', '', '43800.270790345414', '21665.828046547485', '18', '2012-07-17 12:02:08', 'jur');
INSERT INTO `t_gps_data` VALUES ('3357193', '2012-07-17 12:02:08', '0', '', '30527.843760100866', '20213.407166674428', '78', '2012-07-17 12:02:08', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3357194', '2012-07-17 12:02:18', '3', '', '40355.66618766349', '35150.931718212385', '39', '2012-07-17 12:02:18', '2');
INSERT INTO `t_gps_data` VALUES ('3357195', '2012-07-17 12:02:18', '3', '', '42583.37191980156', '25838.221606839754', '9', '2012-07-17 12:02:18', '1');
INSERT INTO `t_gps_data` VALUES ('3357196', '2012-07-17 12:02:18', '2', '', '29026.681364088687', '38818.92721052868', '71', '2012-07-17 12:02:18', '4');
INSERT INTO `t_gps_data` VALUES ('3357197', '2012-07-17 12:02:18', '3', '', '29015.433740052114', '21930.797911009005', '1', '2012-07-17 12:02:18', '3');
INSERT INTO `t_gps_data` VALUES ('3357198', '2012-07-17 12:02:18', '2', '', '38665.960426599435', '34540.59704033457', '28', '2012-07-17 12:02:18', '5');
INSERT INTO `t_gps_data` VALUES ('3357199', '2012-07-17 12:02:18', '2', '', '35270.90288148446', '37086.56088335854', '78', '2012-07-17 12:02:18', '6');
INSERT INTO `t_gps_data` VALUES ('3357200', '2012-07-17 12:02:18', '3', '', '43479.72783961177', '31848.444221594596', '51', '2012-07-17 12:02:18', '001190251');
INSERT INTO `t_gps_data` VALUES ('3357201', '2012-07-17 12:02:18', '2', '', '35971.06650626157', '30205.958557620343', '64', '2012-07-17 12:02:18', '001014182');
INSERT INTO `t_gps_data` VALUES ('3357202', '2012-07-17 12:02:18', '0', '', '39436.36804017502', '30067.29821717481', '50', '2012-07-17 12:02:18', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3357203', '2012-07-17 12:02:18', '2', '', '42833.84965644936', '39269.35384878336', '82', '2012-07-17 12:02:18', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3357204', '2012-07-17 12:02:18', '1', '', '34696.35315515507', '11257.955516187', '69', '2012-07-17 12:02:18', '001001003');
INSERT INTO `t_gps_data` VALUES ('3357205', '2012-07-17 12:02:18', '2', '', '38203.278723181764', '30194.96390795714', '22', '2012-07-17 12:02:18', '001067110');
INSERT INTO `t_gps_data` VALUES ('3357206', '2012-07-17 12:02:18', '1', '', '33719.430591593606', '16463.087682160036', '14', '2012-07-17 12:02:18', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3357207', '2012-07-17 12:02:18', '1', '', '35615.03995517931', '11969.125572184106', '70', '2012-07-17 12:02:18', 'amk');
INSERT INTO `t_gps_data` VALUES ('3357208', '2012-07-17 12:02:18', '3', '', '42904.26486283025', '25168.043383900756', '72', '2012-07-17 12:02:18', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3357209', '2012-07-17 12:02:18', '3', '', '36436.94884445162', '16189.422718547235', '7', '2012-07-17 12:02:18', 'cck');
INSERT INTO `t_gps_data` VALUES ('3357210', '2012-07-17 12:02:18', '3', '', '29804.34425597828', '23877.98731358865', '4', '2012-07-17 12:02:18', 'clm');
INSERT INTO `t_gps_data` VALUES ('3357211', '2012-07-17 12:02:18', '2', '', '43948.953364610206', '27329.778652159555', '26', '2012-07-17 12:02:18', 'hou');
INSERT INTO `t_gps_data` VALUES ('3357212', '2012-07-17 12:02:18', '3', '', '43717.2212249442', '21648.337914714593', '18', '2012-07-17 12:02:18', 'jur');
INSERT INTO `t_gps_data` VALUES ('3357213', '2012-07-17 12:02:18', '0', '', '30512.844694652034', '20143.148849300564', '78', '2012-07-17 12:02:18', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3357214', '2012-07-17 12:02:28', '3', '', '40284.818811915036', '35143.539793192394', '39', '2012-07-17 12:02:28', '2');
INSERT INTO `t_gps_data` VALUES ('3357215', '2012-07-17 12:02:28', '3', '', '42497.91878278693', '25824.156241044075', '9', '2012-07-17 12:02:28', '1');
INSERT INTO `t_gps_data` VALUES ('3357216', '2012-07-17 12:02:28', '2', '', '29121.395912637097', '38841.718578811095', '71', '2012-07-17 12:02:28', '4');
INSERT INTO `t_gps_data` VALUES ('3357217', '2012-07-17 12:02:28', '3', '', '28947.884663693927', '21903.215478447415', '1', '2012-07-17 12:02:28', '3');
INSERT INTO `t_gps_data` VALUES ('3357218', '2012-07-17 12:02:28', '2', '', '38744.693553747624', '34567.54386979816', '28', '2012-07-17 12:02:28', '5');
INSERT INTO `t_gps_data` VALUES ('3357219', '2012-07-17 12:02:28', '2', '', '35344.141407068', '37110.00784671207', '78', '2012-07-17 12:02:28', '6');
INSERT INTO `t_gps_data` VALUES ('3357220', '2012-07-17 12:02:28', '3', '', '43413.30812226924', '31830.66997682269', '51', '2012-07-17 12:02:28', '001190251');
INSERT INTO `t_gps_data` VALUES ('3357221', '2012-07-17 12:02:28', '2', '', '36001.2652823119', '30225.39418772288', '64', '2012-07-17 12:02:28', '001014182');
INSERT INTO `t_gps_data` VALUES ('3357222', '2012-07-17 12:02:28', '0', '', '39430.92716958563', '29967.56031751596', '50', '2012-07-17 12:02:28', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3357223', '2012-07-17 12:02:28', '2', '', '42887.91331223375', '39275.606373889', '82', '2012-07-17 12:02:28', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3357224', '2012-07-17 12:02:28', '1', '', '34716.051557175124', '11331.598307826494', '69', '2012-07-17 12:02:28', '001001003');
INSERT INTO `t_gps_data` VALUES ('3357225', '2012-07-17 12:02:28', '2', '', '38302.4922682336', '30221.09601579323', '22', '2012-07-17 12:02:28', '001067110');
INSERT INTO `t_gps_data` VALUES ('3357226', '2012-07-17 12:02:28', '1', '', '33745.56797673914', '16537.754467600273', '14', '2012-07-17 12:02:28', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3357227', '2012-07-17 12:02:28', '1', '', '35620.726772991286', '12015.582438991667', '70', '2012-07-17 12:02:28', 'amk');
INSERT INTO `t_gps_data` VALUES ('3357228', '2012-07-17 12:02:28', '3', '', '42825.76130423111', '25158.848152918887', '72', '2012-07-17 12:02:28', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3357229', '2012-07-17 12:02:28', '3', '', '36352.34596183402', '16183.925843479346', '7', '2012-07-17 12:02:28', 'cck');
INSERT INTO `t_gps_data` VALUES ('3357230', '2012-07-17 12:02:28', '3', '', '29746.94454055366', '23860.830180666035', '4', '2012-07-17 12:02:28', 'clm');
INSERT INTO `t_gps_data` VALUES ('3357231', '2012-07-17 12:02:28', '2', '', '43992.45992293213', '27333.726442255098', '26', '2012-07-17 12:02:28', 'hou');
INSERT INTO `t_gps_data` VALUES ('3357232', '2012-07-17 12:02:28', '3', '', '43663.20373470542', '21643.88922705634', '18', '2012-07-17 12:02:28', 'jur');
INSERT INTO `t_gps_data` VALUES ('3357233', '2012-07-17 12:02:28', '0', '', '30505.521003203878', '20064.666238574766', '78', '2012-07-17 12:02:28', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3357234', '2012-07-17 12:02:38', '3', '', '40198.47556596694', '35137.881734029754', '39', '2012-07-17 12:02:38', '2');
INSERT INTO `t_gps_data` VALUES ('3357235', '2012-07-17 12:02:38', '3', '', '42403.40376951465', '25809.899919968604', '9', '2012-07-17 12:02:38', '1');
INSERT INTO `t_gps_data` VALUES ('3357236', '2012-07-17 12:02:38', '2', '', '29180.013784170635', '38844.421136613266', '71', '2012-07-17 12:02:38', '4');
INSERT INTO `t_gps_data` VALUES ('3357237', '2012-07-17 12:02:38', '3', '', '28896.7247304999', '21890.53048073496', '1', '2012-07-17 12:02:38', '3');
INSERT INTO `t_gps_data` VALUES ('3357238', '2012-07-17 12:02:38', '2', '', '38836.72831256961', '34582.13089345048', '28', '2012-07-17 12:02:38', '5');
INSERT INTO `t_gps_data` VALUES ('3357239', '2012-07-17 12:02:38', '2', '', '35413.50197534361', '37129.3650211247', '78', '2012-07-17 12:02:38', '6');
INSERT INTO `t_gps_data` VALUES ('3357240', '2012-07-17 12:02:38', '3', '', '43338.38907652769', '31810.541345638856', '51', '2012-07-17 12:02:38', '001190251');
INSERT INTO `t_gps_data` VALUES ('3357241', '2012-07-17 12:02:38', '2', '', '36078.55481132665', '30249.009937636805', '64', '2012-07-17 12:02:38', '001014182');
INSERT INTO `t_gps_data` VALUES ('3357242', '2012-07-17 12:02:38', '0', '', '39425.27281903871', '29872.592494938028', '50', '2012-07-17 12:02:38', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3357243', '2012-07-17 12:02:38', '2', '', '42926.949223788535', '39290.55938858184', '82', '2012-07-17 12:02:38', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3357244', '2012-07-17 12:02:38', '1', '', '34732.1678369175', '11396.069592401627', '69', '2012-07-17 12:02:38', '001001003');
INSERT INTO `t_gps_data` VALUES ('3357245', '2012-07-17 12:02:38', '2', '', '38354.91264314221', '30227.26904997765', '22', '2012-07-17 12:02:38', '001067110');
INSERT INTO `t_gps_data` VALUES ('3357246', '2012-07-17 12:02:38', '1', '', '33752.61219629643', '16613.572750171137', '14', '2012-07-17 12:02:38', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3357247', '2012-07-17 12:02:38', '1', '', '35623.60190397163', '12051.601523615944', '70', '2012-07-17 12:02:38', 'amk');
INSERT INTO `t_gps_data` VALUES ('3357248', '2012-07-17 12:02:38', '3', '', '42780.16563635663', '25150.23980385174', '72', '2012-07-17 12:02:38', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3357249', '2012-07-17 12:02:38', '3', '', '36256.72512121072', '16162.494555049914', '7', '2012-07-17 12:02:38', 'cck');
INSERT INTO `t_gps_data` VALUES ('3357250', '2012-07-17 12:02:38', '3', '', '29685.887139776813', '23844.251533964707', '4', '2012-07-17 12:02:38', 'clm');
INSERT INTO `t_gps_data` VALUES ('3357251', '2012-07-17 12:02:38', '2', '', '44077.22361682201', '27343.06000828452', '26', '2012-07-17 12:02:38', 'hou');
INSERT INTO `t_gps_data` VALUES ('3357252', '2012-07-17 12:02:38', '3', '', '43617.75572567923', '21617.80635288786', '18', '2012-07-17 12:02:38', 'jur');
INSERT INTO `t_gps_data` VALUES ('3357253', '2012-07-17 12:02:38', '0', '', '30498.478808418047', '20026.298376132243', '78', '2012-07-17 12:02:38', 'tpy');

-- ----------------------------
-- Table structure for `t_location`
-- ----------------------------
DROP TABLE IF EXISTS `t_location`;
CREATE TABLE `t_location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `road` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `number` (`number`),
  KEY `FK27FC1320F9838451` (`group_id`),
  CONSTRAINT `FK27FC1320F9838451` FOREIGN KEY (`group_id`) REFERENCES `t_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_location
-- ----------------------------
INSERT INTO `t_location` VALUES ('1', 'depot1', '40982.30', '32902.84', 'depot_1', 'road1', 'depot', '3', 'depot001');
INSERT INTO `t_location` VALUES ('2', 'depot2', '35563.03', '26948.97', 'depot_2', 'road2', 'depot', '2', 'depot002');
INSERT INTO `t_location` VALUES ('3', 'depot3', '35961.42', '15177.17', 'depot_3', 'road3', 'depot', '1', 'depot003');
INSERT INTO `t_location` VALUES ('4', 'bus-stop1', '33792.58', '11683.57', 'bus-stop_1', 'road4', 'bus-stop', '4', 'bus-stop001');
INSERT INTO `t_location` VALUES ('5', 'bus-stop2', '36142.48', '11809.12', 'bus-stop_2', 'road5', 'bus-stop', '5', 'bus-stop002');
INSERT INTO `t_location` VALUES ('6', 'bus-stop3', '38370.97', '14127.31', 'bus-stop_3', 'road6', 'bus-stop', '6', 'bus-stop003');
INSERT INTO `t_location` VALUES ('7', 'bus-stop4', '39995.67', '18364.72', 'bus-stop_4', 'road7', 'bus-stop', '7', 'bus-stop004');

-- ----------------------------
-- Table structure for `t_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `content` longtext,
  `dateTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `isSuccess` bit(1) NOT NULL,
  `userAccount` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK68F78F947140EFE` (`user_id`),
  CONSTRAINT `FK68F78F947140EFE` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=588 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('328', 'Users.grid', '/users/grid?id=users', '2012-07-17 11:02:29', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('329', 'Users.read', '/Users/read', '2012-07-17 11:02:29', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '\0', 'admin');
INSERT INTO `t_log` VALUES ('330', 'Users.create', '/Users/create?models=%5B%7B%22id%22%3Anull%2C%22account%22%3A%22asdfasdfsa%22%2C%22name%22%3A%22fasfdasdf%22%2C%22desc%22%3A%22dasfsdadf%22%2C%22roles%22%3A%22%22%7D%5D', '2012-07-17 11:02:34', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '\0', 'admin');
INSERT INTO `t_log` VALUES ('331', 'Users.create', '/Users/create?models=%5B%7B%22id%22%3Anull%2C%22account%22%3A%22asdfasdfsaasfsa%22%2C%22name%22%3A%22fasfdasdfdfasdf%22%2C%22desc%22%3A%22dasfsdadfsadfa%22%2C%22roles%22%3A%22%22%7D%5D', '2012-07-17 11:02:39', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '\0', 'admin');
INSERT INTO `t_log` VALUES ('332', 'Users.grid', '/users/grid?id=users', '2012-07-17 11:02:48', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('333', 'Users.read', '/Users/read', '2012-07-17 11:02:48', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '\0', 'admin');
INSERT INTO `t_log` VALUES ('334', 'Roles.grid', '/roles/grid?id=roles', '2012-07-17 11:02:50', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('335', 'Roles.read', '/Roles/read', '2012-07-17 11:02:50', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('336', 'Permissions.grid', '/permissions/grid?id=perms', '2012-07-17 11:04:51', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('337', 'Permissions.read', '/Permissions/read', '2012-07-17 11:04:51', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('338', 'Roles.assign', '/roles/assign?id=assign_roles', '2012-07-17 11:04:54', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('339', 'Roles.perms', '/roles/perms?roleName=default', '2012-07-17 11:05:00', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('340', 'Roles.users', '/roles/users?roleName=default', '2012-07-17 11:05:00', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('341', 'Roles.users', '/roles/users?roleName=demo', '2012-07-17 11:05:02', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('342', 'Roles.perms', '/roles/perms?roleName=demo', '2012-07-17 11:05:02', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('343', 'Roles.users', '/roles/users?roleName=default', '2012-07-17 11:05:06', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('344', 'Roles.perms', '/roles/perms?roleName=default', '2012-07-17 11:05:06', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('345', 'Roles.assignUserAndPerm', '/roles/assignUserAndPerm?roleName=default&users=1&perms=0&perms=7&perms=8&perms=9&perms=16&perms=17&perms=10&perms=11&perms=12', '2012-07-17 11:05:23', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('346', 'Roles.perms', '/roles/perms?roleName=demo', '2012-07-17 11:05:26', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('347', 'Roles.users', '/roles/users?roleName=demo', '2012-07-17 11:05:26', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('348', 'Roles.users', '/roles/users?roleName=default', '2012-07-17 11:05:26', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('349', 'Roles.perms', '/roles/perms?roleName=default', '2012-07-17 11:05:26', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('350', 'Users.grid', '/users/grid?id=users', '2012-07-17 11:05:29', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('351', 'Users.read', '/Users/read', '2012-07-17 11:05:29', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '\0', 'admin');
INSERT INTO `t_log` VALUES ('352', 'Users.grid', '/users/grid?id=users', '2012-07-17 11:05:31', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('353', 'Users.read', '/Users/read', '2012-07-17 11:05:31', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '\0', 'admin');
INSERT INTO `t_log` VALUES ('354', 'Permissions.grid', '/permissions/grid?id=perms', '2012-07-17 11:05:33', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('355', 'Permissions.read', '/Permissions/read', '2012-07-17 11:05:33', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('356', 'Permissions.actions', '/permissions/actions?take=20&skip=0&page=1&pageSize=20', '2012-07-17 11:05:36', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('357', 'Roles.grid', '/roles/grid?id=roles', '2012-07-17 11:05:41', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('358', 'Roles.read', '/Roles/read', '2012-07-17 11:05:41', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('359', 'Users.grid', '/users/grid?id=users', '2012-07-17 11:05:46', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('360', 'Users.read', '/Users/read', '2012-07-17 11:05:46', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '\0', 'admin');
INSERT INTO `t_log` VALUES ('361', 'Application.admin', '/admin', '2012-07-17 11:05:58', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('362', 'Permissions.grid', '/permissions/grid?id=perms', '2012-07-17 11:06:01', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('363', 'Permissions.read', '/Permissions/read', '2012-07-17 11:06:02', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('364', 'Users.grid', '/users/grid?id=users', '2012-07-17 11:06:02', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('365', 'Users.read', '/Users/read', '2012-07-17 11:06:02', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('367', 'Application.admin', '/admin', '2012-07-17 11:07:07', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('368', 'Users.grid', '/users/grid?id=users', '2012-07-17 11:07:09', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('369', 'Users.read', '/Users/read', '2012-07-17 11:07:09', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('371', 'Users.grid', '/users/grid?id=users', '2012-07-17 11:07:17', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('372', 'Users.read', '/Users/read', '2012-07-17 11:07:17', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('373', 'Users.destroy', '/Users/destroy?models=%5B%7B%22id%22%3A%2211%22%2C%22account%22%3A%22asdfsafsss%22%2C%22name%22%3A%22ssss%22%2C%22desc%22%3A%22ss%22%2C%22roles%22%3A%22%5B%5D%22%7D%5D', '2012-07-17 11:07:25', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('374', 'Users.destroy', '/Users/destroy?models=%5B%7B%22id%22%3A%2210%22%2C%22account%22%3A%22asdfasdf%22%2C%22name%22%3A%22safdasdfa%22%2C%22desc%22%3A%22sdasdfasdf%22%2C%22roles%22%3A%22%5B%5D%22%7D%5D', '2012-07-17 11:07:30', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('375', 'Users.create', '/Users/create?models=%5B%7B%22id%22%3Anull%2C%22account%22%3A%22sdfsafasfasf%22%2C%22name%22%3A%22sdfsadf%22%2C%22desc%22%3A%22asdfasdf%22%2C%22roles%22%3A%22%22%7D%5D', '2012-07-17 11:07:35', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('376', 'Users.grid', '/users/grid?id=users', '2012-07-17 11:07:42', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('377', 'Users.read', '/Users/read', '2012-07-17 11:07:42', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('378', 'Users.destroy', '/Users/destroy?models=%5B%7B%22id%22%3A%2218%22%2C%22account%22%3A%22sdfsafasfasf%22%2C%22name%22%3A%22sdfsadf%22%2C%22desc%22%3A%22asdfasdf%22%2C%22roles%22%3A%22%5B%5D%22%7D%5D', '2012-07-17 11:07:44', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('379', 'Permissions.grid', '/permissions/grid?id=perms', '2012-07-17 11:09:58', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('380', 'Permissions.read', '/Permissions/read', '2012-07-17 11:09:58', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('381', 'Permissions.actions', '/permissions/actions?take=20&skip=0&page=1&pageSize=20', '2012-07-17 11:10:02', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('382', 'Permissions.create', '/Permissions/create?models=%5B%7B%22id%22%3Anull%2C%22action%22%3A%22Roles.assign%22%2C%22desc%22%3A%22Visit+Assign+Role+Page%22%7D%5D', '2012-07-17 11:10:34', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('383', 'Users.grid', '/users/grid?id=users', '2012-07-17 11:10:35', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('384', 'Users.read', '/Users/read', '2012-07-17 11:10:35', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('385', 'Permissions.grid', '/permissions/grid?id=perms', '2012-07-17 11:10:36', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('386', 'Permissions.read', '/Permissions/read', '2012-07-17 11:10:36', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('387', 'Roles.assign', '/roles/assign?id=assign_roles', '2012-07-17 11:10:38', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '\0', 'admin');
INSERT INTO `t_log` VALUES ('388', 'Application.admin', '/admin', '2012-07-17 11:12:14', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('389', 'Roles.assign', '/roles/assign?id=assign_roles', '2012-07-17 11:12:16', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '\0', 'admin');
INSERT INTO `t_log` VALUES ('390', 'Application.admin', '/admin', '2012-07-17 11:12:43', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('391', 'Application.admin', '/admin', '2012-07-17 11:13:20', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('392', 'Roles.assign', '/roles/assign?id=assign_roles', '2012-07-17 11:13:24', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '\0', 'admin');
INSERT INTO `t_log` VALUES ('393', 'Application.admin', '/admin', '2012-07-17 11:15:53', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('394', 'Roles.assign', '/roles/assign?id=assign_roles', '2012-07-17 11:15:55', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '\0', 'admin');
INSERT INTO `t_log` VALUES ('395', 'Application.admin', '/admin', '2012-07-17 11:16:38', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('396', 'Roles.assign', '/roles/assign?id=assign_roles', '2012-07-17 11:16:40', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '\0', 'admin');
INSERT INTO `t_log` VALUES ('397', 'Application.admin', '/admin', '2012-07-17 11:16:45', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('398', 'Roles.assign', '/roles/assign?id=assign_roles', '2012-07-17 11:16:46', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '\0', 'admin');
INSERT INTO `t_log` VALUES ('399', 'Fleets.assign', '/fleets/assign?id=assign_fleets', '2012-07-17 11:16:49', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('400', 'Departments.assign', '/departments/assign?id=assign_departments', '2012-07-17 11:16:50', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('401', 'Departments.grid', '/departments/grid?id=departments', '2012-07-17 11:16:51', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('402', 'Departments.read', '/departments/read', '2012-07-17 11:16:52', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('403', 'Fleets.grid', '/fleets/grid?id=fleets', '2012-07-17 11:16:52', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('404', 'Fleets.read', '/Fleets/read', '2012-07-17 11:16:52', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('405', 'Application.admin', '/admin', '2012-07-17 11:16:59', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('406', 'Roles.assign', '/roles/assign?id=assign_roles', '2012-07-17 11:17:01', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '\0', 'admin');
INSERT INTO `t_log` VALUES ('407', 'Permissions.grid', '/permissions/grid?id=perms', '2012-07-17 11:17:12', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('408', 'Permissions.read', '/Permissions/read', '2012-07-17 11:17:12', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('409', 'Application.admin', '/admin', '2012-07-17 11:20:58', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('410', 'Users.grid', '/users/grid?id=users', '2012-07-17 11:21:03', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('411', 'Users.read', '/Users/read', '2012-07-17 11:21:04', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('412', 'Roles.assign', '/roles/assign?id=assign_roles', '2012-07-17 11:21:09', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '\0', 'admin');
INSERT INTO `t_log` VALUES ('413', 'Roles.assign', '/roles/assign?id=assign_roles', '2012-07-17 11:21:24', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '\0', 'admin');
INSERT INTO `t_log` VALUES ('414', 'Application.admin', '/admin', '2012-07-17 11:23:23', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('415', 'Users.grid', '/users/grid?id=users', '2012-07-17 11:23:25', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('416', 'Users.read', '/Users/read', '2012-07-17 11:23:25', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('417', 'Roles.assign', '/roles/assign?id=assign_roles', '2012-07-17 11:23:27', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('418', 'Roles.perms', '/roles/perms?roleName=administrator', '2012-07-17 11:23:33', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('419', 'Roles.users', '/roles/users?roleName=administrator', '2012-07-17 11:23:33', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('420', 'Roles.assignUserAndPerm', '/roles/assignUserAndPerm?roleName=administrator&users=0&perms=0&perms=7&perms=8&perms=9&perms=16&perms=17&perms=10&perms=11&perms=12&perms=18', '2012-07-17 11:23:35', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('421', 'Roles.perms', '/roles/perms?roleName=manager', '2012-07-17 11:23:38', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('422', 'Roles.users', '/roles/users?roleName=manager', '2012-07-17 11:23:38', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('423', 'Roles.users', '/roles/users?roleName=administrator', '2012-07-17 11:23:39', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('424', 'Roles.perms', '/roles/perms?roleName=administrator', '2012-07-17 11:23:39', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('425', 'Roles.assignUserAndPerm', '/roles/assignUserAndPerm?roleName=administrator&users=0&perms=0', '2012-07-17 11:23:43', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('426', 'Roles.users', '/roles/users?roleName=manager', '2012-07-17 11:23:45', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('427', 'Roles.perms', '/roles/perms?roleName=manager', '2012-07-17 11:23:45', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('428', 'Roles.users', '/roles/users?roleName=administrator', '2012-07-17 11:23:45', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('429', 'Roles.perms', '/roles/perms?roleName=administrator', '2012-07-17 11:23:45', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('430', 'Roles.grid', '/roles/grid?id=roles', '2012-07-17 11:23:47', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('431', 'Roles.read', '/Roles/read', '2012-07-17 11:23:47', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('432', 'Permissions.grid', '/permissions/grid?id=perms', '2012-07-17 11:23:47', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('433', 'Permissions.read', '/Permissions/read', '2012-07-17 11:23:48', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('434', 'Permissions.actions', '/permissions/actions?take=20&skip=0&page=1&pageSize=20', '2012-07-17 11:23:50', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('435', 'Permissions.create', '/Permissions/create?models=%5B%7B%22id%22%3Anull%2C%22action%22%3A%22Roles.assignUserAndPerm%22%2C%22desc%22%3A%22Assign+Role_Perm+and+Role_User%22%7D%5D', '2012-07-17 11:24:08', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('436', 'Permissions.grid', '/permissions/grid?id=perms', '2012-07-17 11:24:11', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('437', 'Permissions.read', '/Permissions/read', '2012-07-17 11:24:11', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('438', 'Roles.assign', '/roles/assign?id=assign_roles', '2012-07-17 11:24:16', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('439', 'Roles.users', '/roles/users?roleName=administrator', '2012-07-17 11:24:20', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('440', 'Roles.perms', '/roles/perms?roleName=administrator', '2012-07-17 11:24:20', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('441', 'Roles.perms', '/roles/perms?roleName=manager', '2012-07-17 11:24:21', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('442', 'Roles.users', '/roles/users?roleName=manager', '2012-07-17 11:24:21', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('443', 'Roles.perms', '/roles/perms?roleName=administrator', '2012-07-17 11:24:22', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('444', 'Roles.users', '/roles/users?roleName=administrator', '2012-07-17 11:24:22', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('445', 'Roles.assignUserAndPerm', '/roles/assignUserAndPerm?roleName=administrator&users=0&perms=7', '2012-07-17 11:24:24', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('446', 'Roles.users', '/roles/users?roleName=manager', '2012-07-17 11:24:26', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('447', 'Roles.perms', '/roles/perms?roleName=manager', '2012-07-17 11:24:26', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('448', 'Roles.perms', '/roles/perms?roleName=administrator', '2012-07-17 11:24:26', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('449', 'Roles.users', '/roles/users?roleName=administrator', '2012-07-17 11:24:26', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('450', 'Application.admin', '/admin', '2012-07-17 11:25:05', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('451', 'Roles.assign', '/roles/assign?id=assign_roles', '2012-07-17 11:25:07', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('452', 'Roles.users', '/roles/users?roleName=administrator', '2012-07-17 11:25:08', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('453', 'Roles.perms', '/roles/perms?roleName=administrator', '2012-07-17 11:25:08', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('454', 'Roles.assignUserAndPerm', '/roles/assignUserAndPerm?roleName=administrator&users=0&perms=7&perms=8&perms=9&perms=16&perms=17', '2012-07-17 11:25:10', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('455', 'Roles.users', '/roles/users?roleName=manager', '2012-07-17 11:25:13', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('456', 'Roles.perms', '/roles/perms?roleName=manager', '2012-07-17 11:25:13', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('457', 'Roles.users', '/roles/users?roleName=administrator', '2012-07-17 11:25:13', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('458', 'Roles.perms', '/roles/perms?roleName=administrator', '2012-07-17 11:25:13', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('459', 'Roles.perms', '/roles/perms?roleName=default', '2012-07-17 11:25:20', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('460', 'Roles.users', '/roles/users?roleName=default', '2012-07-17 11:25:20', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('461', 'Roles.perms', '/roles/perms?roleName=administrator', '2012-07-17 11:25:23', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('462', 'Roles.users', '/roles/users?roleName=administrator', '2012-07-17 11:25:23', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('463', 'Roles.users', '/roles/users?roleName=manager', '2012-07-17 11:25:24', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('464', 'Roles.perms', '/roles/perms?roleName=manager', '2012-07-17 11:25:24', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('465', 'Roles.users', '/roles/users?roleName=default', '2012-07-17 11:25:26', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('466', 'Roles.perms', '/roles/perms?roleName=default', '2012-07-17 11:25:26', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('467', 'Roles.users', '/roles/users?roleName=demo', '2012-07-17 11:25:28', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('468', 'Roles.perms', '/roles/perms?roleName=demo', '2012-07-17 11:25:28', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('469', 'Roles.users', '/roles/users?roleName=fleetLeader', '2012-07-17 11:25:31', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('470', 'Roles.perms', '/roles/perms?roleName=fleetLeader', '2012-07-17 11:25:31', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('471', 'Roles.perms', '/roles/perms?roleName=manager', '2012-07-17 11:25:32', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('472', 'Roles.users', '/roles/users?roleName=manager', '2012-07-17 11:25:32', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('473', 'Roles.perms', '/roles/perms?roleName=administrator', '2012-07-17 11:25:32', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('474', 'Roles.users', '/roles/users?roleName=administrator', '2012-07-17 11:25:32', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('475', 'Permissions.grid', '/permissions/grid?id=perms', '2012-07-17 11:25:37', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('476', 'Permissions.read', '/Permissions/read', '2012-07-17 11:25:37', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('477', 'Application.admin', '/admin', '2012-07-17 11:29:20', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('478', 'Roles.assign', '/roles/assign?id=assign_roles', '2012-07-17 11:29:38', 'system', 'normal', null, null, '127.0.0.1', 'test', '\0', 'test');
INSERT INTO `t_log` VALUES ('479', 'Application.admin', '/admin', '2012-07-17 11:30:01', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('480', 'Roles.assign', '/roles/assign?id=assign_roles', '2012-07-17 11:30:02', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('481', 'Roles.users', '/roles/users?roleName=administrator', '2012-07-17 11:30:03', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('482', 'Roles.perms', '/roles/perms?roleName=administrator', '2012-07-17 11:30:03', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('483', 'Roles.assignUserAndPerm', '/roles/assignUserAndPerm?roleName=administrator&users=0&perms=9&perms=16&perms=17', '2012-07-17 11:30:06', 'system', 'normal', null, null, '127.0.0.1', 'test', '\0', 'test');
INSERT INTO `t_log` VALUES ('484', 'Application.admin', '/admin', '2012-07-17 11:31:11', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('485', 'Roles.assign', '/roles/assign?id=assign_roles', '2012-07-17 11:31:12', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('486', 'Application.admin', '/admin', '2012-07-17 11:32:43', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('487', 'Roles.assign', '/roles/assign?id=assign_roles', '2012-07-17 11:32:43', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('488', 'Roles.users', '/roles/users?roleName=administrator', '2012-07-17 11:32:45', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('489', 'Roles.perms', '/roles/perms?roleName=administrator', '2012-07-17 11:32:45', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('490', 'Roles.assignUserAndPerm', '/roles/assignUserAndPerm?roleName=administrator&users=0&perms=16&perms=17', '2012-07-17 11:32:48', 'system', 'normal', null, null, '127.0.0.1', 'test', '\0', 'test');
INSERT INTO `t_log` VALUES ('491', 'Application.admin', '/admin', '2012-07-17 11:33:25', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('492', 'Roles.assign', '/roles/assign?id=assign_roles', '2012-07-17 11:33:26', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('493', 'Roles.users', '/roles/users?roleName=administrator', '2012-07-17 11:33:27', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('494', 'Roles.perms', '/roles/perms?roleName=administrator', '2012-07-17 11:33:27', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('495', 'Roles.assignUserAndPerm', '/roles/assignUserAndPerm?roleName=administrator&users=0&perms=9&perms=16&perms=17', '2012-07-17 11:33:29', 'system', 'normal', null, null, '127.0.0.1', 'test', '\0', 'test');
INSERT INTO `t_log` VALUES ('496', 'Application.admin', '/admin', '2012-07-17 11:34:20', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('497', 'Roles.assign', '/roles/assign?id=assign_roles', '2012-07-17 11:34:23', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('498', 'Roles.users', '/roles/users?roleName=administrator', '2012-07-17 11:34:24', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('499', 'Roles.perms', '/roles/perms?roleName=administrator', '2012-07-17 11:34:24', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('500', 'Roles.assignUserAndPerm', '/roles/assignUserAndPerm?roleName=administrator&users=0&perms=16&perms=17', '2012-07-17 11:34:27', 'system', 'normal', null, null, '127.0.0.1', 'test', '\0', 'test');
INSERT INTO `t_log` VALUES ('501', 'Roles.users', '/roles/users?roleName=manager', '2012-07-17 11:35:49', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('502', 'Roles.perms', '/roles/perms?roleName=manager', '2012-07-17 11:35:49', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('503', 'Roles.assignUserAndPerm', '/roles/assignUserAndPerm?roleName=manager&users=5&users=6&perms=7&perms=8&perms=9&perms=16&perms=17', '2012-07-17 11:35:52', 'system', 'normal', null, null, '127.0.0.1', 'test', '\0', 'test');
INSERT INTO `t_log` VALUES ('504', 'Fleets.assign', '/fleets/assign?id=assign_fleets', '2012-07-17 11:35:55', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('505', 'Application.admin', '/admin', '2012-07-17 11:38:45', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('506', 'Application.admin', '/admin', '2012-07-17 11:39:14', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('507', 'Roles.assign', '/roles/assign?id=assign_roles', '2012-07-17 11:39:16', 'system', 'normal', null, null, '127.0.0.1', 'test', '\0', 'test');
INSERT INTO `t_log` VALUES ('508', 'Application.admin', '/admin', '2012-07-17 11:41:06', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('509', 'Roles.assign', '/roles/assign?id=assign_roles', '2012-07-17 11:41:07', 'system', 'normal', null, null, '127.0.0.1', 'test', '\0', 'test');
INSERT INTO `t_log` VALUES ('510', 'Users.grid', '/users/grid?id=users', '2012-07-17 11:41:09', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('511', 'Users.read', '/Users/read', '2012-07-17 11:41:09', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('512', 'Application.admin', '/admin', '2012-07-17 11:42:16', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('513', 'Users.grid', '/users/grid?id=users', '2012-07-17 11:42:18', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('514', 'Users.read', '/Users/read', '2012-07-17 11:42:18', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('515', 'Users.create', '/Users/create?models=%5B%7B%22id%22%3Anull%2C%22account%22%3A%22asdfasdf%22%2C%22name%22%3A%22sfasfd%22%2C%22desc%22%3A%22sdfasf%22%2C%22roles%22%3A%22%22%7D%5D', '2012-07-17 11:42:22', 'system', 'normal', null, null, '127.0.0.1', 'test', '\0', 'test');
INSERT INTO `t_log` VALUES ('516', 'Users.grid', '/users/grid?id=users', '2012-07-17 11:42:26', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('517', 'Users.read', '/Users/read', '2012-07-17 11:42:26', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('518', 'Users.create', '/Users/create?models=%5B%7B%22id%22%3Anull%2C%22account%22%3A%22admin%22%2C%22name%22%3A%22admin%22%2C%22desc%22%3A%22admin%22%2C%22roles%22%3A%22%22%7D%5D', '2012-07-17 11:42:43', 'system', 'normal', null, null, '127.0.0.1', 'test', '\0', 'test');
INSERT INTO `t_log` VALUES ('519', 'Users.grid', '/users/grid?id=users', '2012-07-17 11:42:45', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('520', 'Users.read', '/Users/read', '2012-07-17 11:42:45', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('521', 'Permissions.grid', '/permissions/grid?id=perms', '2012-07-17 11:42:47', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('522', 'Permissions.read', '/Permissions/read', '2012-07-17 11:42:48', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('523', 'Roles.assign', '/roles/assign?id=assign_roles', '2012-07-17 11:42:49', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('524', 'Roles.perms', '/roles/perms?roleName=administrator', '2012-07-17 11:42:50', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('525', 'Roles.users', '/roles/users?roleName=administrator', '2012-07-17 11:42:50', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('526', 'Roles.assignUserAndPerm', '/roles/assignUserAndPerm?roleName=administrator&users=0&perms=7&perms=8&perms=9&perms=16&perms=17', '2012-07-17 11:42:52', 'system', 'normal', null, null, '127.0.0.1', 'test', '\0', 'test');
INSERT INTO `t_log` VALUES ('527', 'Permissions.grid', '/permissions/grid?id=perms', '2012-07-17 11:51:59', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('528', 'Permissions.read', '/Permissions/read', '2012-07-17 11:51:59', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('529', 'Permissions.actions', '/permissions/actions?take=20&skip=0&page=1&pageSize=20', '2012-07-17 11:52:03', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('530', 'Permissions.actions', '/permissions/actions?take=20&skip=0&page=1&pageSize=20', '2012-07-17 11:52:03', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('531', 'Application.admin', '/admin', '2012-07-17 11:53:52', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('532', 'Application.admin', '/admin', '2012-07-17 11:54:04', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('533', 'Events.grid', '/events/grid?id=events?id=event_list', '2012-07-17 11:54:06', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('534', 'Events.listJson', '/events/listJson', '2012-07-17 11:54:07', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('535', 'Departments.assign', '/departments/assign?id=assign_departments', '2012-07-17 11:54:10', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('536', 'Permissions.grid', '/permissions/grid?id=perms', '2012-07-17 11:54:11', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('537', 'Permissions.read', '/Permissions/read', '2012-07-17 11:54:11', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('538', 'Permissions.actions', '/permissions/actions?take=20&skip=0&page=1&pageSize=20', '2012-07-17 11:54:13', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('539', 'Permissions.create', '/Permissions/create?models=%5B%7B%22id%22%3Anull%2C%22action%22%3A%22Events.destroy%22%2C%22desc%22%3A%22Delete+Event+Info%22%7D%5D', '2012-07-17 11:54:22', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('540', 'Permissions.grid', '/permissions/grid?id=perms', '2012-07-17 11:54:29', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('541', 'Permissions.read', '/Permissions/read', '2012-07-17 11:54:29', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('542', 'Roles.assign', '/roles/assign?id=assign_roles', '2012-07-17 11:54:36', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('543', 'Roles.users', '/roles/users?roleName=demo', '2012-07-17 11:54:37', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('544', 'Roles.perms', '/roles/perms?roleName=demo', '2012-07-17 11:54:37', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('545', 'Roles.perms', '/roles/perms?roleName=default', '2012-07-17 11:54:42', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('546', 'Roles.users', '/roles/users?roleName=default', '2012-07-17 11:54:42', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('547', 'Roles.perms', '/roles/perms?roleName=manager', '2012-07-17 11:54:42', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('548', 'Roles.users', '/roles/users?roleName=manager', '2012-07-17 11:54:42', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('549', 'Roles.users', '/roles/users?roleName=administrator', '2012-07-17 11:54:44', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('550', 'Roles.perms', '/roles/perms?roleName=administrator', '2012-07-17 11:54:44', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('551', 'Roles.perms', '/roles/perms?roleName=manager', '2012-07-17 11:54:44', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('552', 'Roles.users', '/roles/users?roleName=manager', '2012-07-17 11:54:44', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('553', 'Roles.perms', '/roles/perms?roleName=default', '2012-07-17 11:54:45', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('554', 'Roles.users', '/roles/users?roleName=default', '2012-07-17 11:54:45', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('555', 'Roles.users', '/roles/users?roleName=demo', '2012-07-17 11:54:45', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('556', 'Roles.perms', '/roles/perms?roleName=demo', '2012-07-17 11:54:45', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('557', 'Roles.perms', '/roles/perms?roleName=fleetLeader', '2012-07-17 11:54:47', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('558', 'Roles.users', '/roles/users?roleName=fleetLeader', '2012-07-17 11:54:47', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('559', 'Roles.users', '/roles/users?roleName=default', '2012-07-17 11:54:49', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('560', 'Roles.perms', '/roles/perms?roleName=default', '2012-07-17 11:54:49', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('561', 'Roles.perms', '/roles/perms?roleName=manager', '2012-07-17 11:54:51', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('562', 'Roles.users', '/roles/users?roleName=manager', '2012-07-17 11:54:51', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('563', 'Permissions.grid', '/permissions/grid?id=perms', '2012-07-17 11:54:54', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('564', 'Permissions.read', '/Permissions/read', '2012-07-17 11:54:54', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('565', 'Application.admin', '/admin', '2012-07-17 11:55:35', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('566', 'Permissions.grid', '/permissions/grid?id=perms', '2012-07-17 11:55:38', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('567', 'Permissions.read', '/Permissions/read', '2012-07-17 11:55:38', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('568', 'Application.admin', '/admin', '2012-07-17 11:55:45', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('569', 'Permissions.grid', '/permissions/grid?id=perms', '2012-07-17 11:55:46', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('570', 'Permissions.read', '/Permissions/read', '2012-07-17 11:55:46', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('571', 'Permissions.actions', '/permissions/actions?take=20&skip=0&page=1&pageSize=20', '2012-07-17 11:55:48', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('572', 'Permissions.create', '/Permissions/create?models=%5B%7B%22id%22%3Anull%2C%22action%22%3A%22Permissions.create%22%2C%22desc%22%3A%22Create+Permission+Info%22%7D%5D', '2012-07-17 11:56:09', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('573', 'Permissions.actions', '/permissions/actions?take=20&skip=0&page=1&pageSize=20', '2012-07-17 11:56:12', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('574', 'Permissions.create', '/Permissions/create?models=%5B%7B%22id%22%3Anull%2C%22action%22%3A%22Permissions.update%22%2C%22desc%22%3A%22Update+Permission+Info%22%7D%2C%7B%22id%22%3Anull%2C%22action%22%3A%22Permissions.create%22%2C%22desc%22%3A%22Create+Permission+Info%22%7D%5D', '2012-07-17 11:56:28', 'system', 'normal', null, null, '127.0.0.1', 'test', '\0', 'test');
INSERT INTO `t_log` VALUES ('575', 'Permissions.grid', '/permissions/grid?id=perms', '2012-07-17 11:56:38', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('576', 'Permissions.read', '/Permissions/read', '2012-07-17 11:56:38', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('577', 'Application.admin', '/admin', '2012-07-17 11:58:55', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('578', 'Permissions.grid', '/permissions/grid?id=perms', '2012-07-17 11:58:56', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('579', 'Permissions.read', '/Permissions/read', '2012-07-17 11:58:56', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('580', 'Permissions.actions', '/permissions/actions?take=20&skip=0&page=1&pageSize=20', '2012-07-17 11:58:59', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('581', 'Permissions.create', '/Permissions/create?models=%5B%7B%22id%22%3Anull%2C%22action%22%3A%22Events.update%22%2C%22desc%22%3A%22Update+Event+Info%22%7D%5D', '2012-07-17 11:59:06', 'system', 'normal', null, null, '127.0.0.1', 'test', '\0', 'test');
INSERT INTO `t_log` VALUES ('582', 'Permissions.grid', '/permissions/grid?id=perms', '2012-07-17 11:59:15', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('583', 'Permissions.read', '/Permissions/read', '2012-07-17 11:59:16', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('586', 'Users.grid', '/users/grid?id=users', '2012-07-17 11:59:57', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');
INSERT INTO `t_log` VALUES ('587', 'Users.read', '/Users/read', '2012-07-17 11:59:57', 'system', 'normal', null, null, '127.0.0.1', 'test', '', 'test');

-- ----------------------------
-- Table structure for `t_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `uri` (`uri`),
  UNIQUE KEY `action` (`action`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('7', 'Delete User Info', null, null, 'Users.destroy');
INSERT INTO `t_permission` VALUES ('8', 'Create User Info', null, null, 'Users.create');
INSERT INTO `t_permission` VALUES ('9', 'Update User Info', null, null, 'Users.update');
INSERT INTO `t_permission` VALUES ('10', 'Create Role Info', null, null, 'Roles.create');
INSERT INTO `t_permission` VALUES ('11', 'Delete Role Info', null, null, 'Roles.destroy');
INSERT INTO `t_permission` VALUES ('12', 'Update Role Info', null, null, 'Roles.update');
INSERT INTO `t_permission` VALUES ('16', 'Search User Info', null, null, 'Users.search');
INSERT INTO `t_permission` VALUES ('17', 'Read Users Info', null, null, 'Users.read');
INSERT INTO `t_permission` VALUES ('18', 'Visit Assign Role Page', null, null, 'Roles.assign');
INSERT INTO `t_permission` VALUES ('19', 'Assign Role_Perm and Role_User', null, null, 'Roles.assignUserAndPerm');
INSERT INTO `t_permission` VALUES ('20', 'Delete Event Info', null, null, 'Events.destroy');
INSERT INTO `t_permission` VALUES ('21', 'Create Permission Info', null, null, 'Permissions.create');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'administrator', 'administrator');
INSERT INTO `t_role` VALUES ('4', 'manager', 'manager');
INSERT INTO `t_role` VALUES ('5', 'default', 'default');
INSERT INTO `t_role` VALUES ('6', 'demo', 'demo');
INSERT INTO `t_role` VALUES ('7', 'fleetleader', 'fleetLeader');

-- ----------------------------
-- Table structure for `t_role_perm`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_perm`;
CREATE TABLE `t_role_perm` (
  `role_id` bigint(20) NOT NULL,
  `perm_id` bigint(20) NOT NULL,
  KEY `FK32E77F0E617968BD` (`perm_id`),
  KEY `FK32E77F0EA1E94B1E` (`role_id`),
  CONSTRAINT `FK32E77F0E617968BD` FOREIGN KEY (`perm_id`) REFERENCES `t_permission` (`id`),
  CONSTRAINT `FK32E77F0EA1E94B1E` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_perm
-- ----------------------------
INSERT INTO `t_role_perm` VALUES ('1', '17');
INSERT INTO `t_role_perm` VALUES ('1', '16');
INSERT INTO `t_role_perm` VALUES ('1', '7');
INSERT INTO `t_role_perm` VALUES ('1', '8');
INSERT INTO `t_role_perm` VALUES ('1', '9');
INSERT INTO `t_role_perm` VALUES ('5', '17');
INSERT INTO `t_role_perm` VALUES ('5', '16');
INSERT INTO `t_role_perm` VALUES ('5', '7');
INSERT INTO `t_role_perm` VALUES ('5', '8');
INSERT INTO `t_role_perm` VALUES ('5', '9');
INSERT INTO `t_role_perm` VALUES ('5', '10');
INSERT INTO `t_role_perm` VALUES ('5', '11');
INSERT INTO `t_role_perm` VALUES ('5', '12');
INSERT INTO `t_role_perm` VALUES ('6', '17');
INSERT INTO `t_role_perm` VALUES ('6', '18');

-- ----------------------------
-- Table structure for `t_schedule`
-- ----------------------------
DROP TABLE IF EXISTS `t_schedule`;
CREATE TABLE `t_schedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `driver_number` varchar(255) DEFAULT NULL,
  `vehicle_number` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `line` varchar(255) DEFAULT NULL,
  `duty_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8D130602EE73B744` (`vehicle_number`),
  KEY `FK8D130602A06578C` (`driver_number`),
  CONSTRAINT `FK8D130602A06578C` FOREIGN KEY (`driver_number`) REFERENCES `t_driver` (`number`),
  CONSTRAINT `t_schedule_ibfk_1` FOREIGN KEY (`vehicle_number`) REFERENCES `t_vehicle` (`number`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_schedule
-- ----------------------------
INSERT INTO `t_schedule` VALUES ('6', '74689', 'vehicle01', '2012-05-05 05:56:07', '2012-06-05 14:56:37', 'route01', 'route01AM04');
INSERT INTO `t_schedule` VALUES ('7', '74652', 'vehicle02', '2012-05-09 05:56:49', '2012-06-09 15:57:07', 'route01', 'route01AM13');
INSERT INTO `t_schedule` VALUES ('8', '74631', 'vehicle03', '2012-05-01 20:57:28', '2012-06-02 20:57:35', 'route01', 'route01PM12');
INSERT INTO `t_schedule` VALUES ('9', '74571', 'vehicle01', '2012-04-30 20:57:39', '2012-06-15 20:57:43', 'route02', 'route02AM04');
INSERT INTO `t_schedule` VALUES ('10', '74538', 'vehicle01', '2012-05-02 20:57:47', '2012-06-03 20:57:50', 'route02', 'route02PM04');
INSERT INTO `t_schedule` VALUES ('11', '74498', 'vehicle02', '2012-05-09 20:57:53', '2012-06-09 22:57:57', 'route01', 'route01AM13');
INSERT INTO `t_schedule` VALUES ('12', '74484', 'vehicle02', '2012-05-17 14:58:05', '2012-06-17 20:58:12', 'route01', 'route01AM15');
INSERT INTO `t_schedule` VALUES ('13', '74483', 'vehicle01', '2012-05-14 14:58:19', '2012-06-14 20:58:23', 'route02', 'route02AM04');
INSERT INTO `t_schedule` VALUES ('14', '74482', 'vehicle04', '2012-05-02 15:58:27', '2012-06-02 16:58:32', 'route03', 'route03S104');
INSERT INTO `t_schedule` VALUES ('15', '74423', 'vehicle01', '2012-05-07 20:58:39', '2012-06-08 20:58:43', 'route03', 'route03S108');
INSERT INTO `t_schedule` VALUES ('16', '74353', 'vehicle02', '2012-04-30 20:58:51', '2012-06-01 20:58:55', 'route01', 'route01AM13');
INSERT INTO `t_schedule` VALUES ('17', '74291', 'vehicle03', '2012-04-29 20:58:58', '2012-06-30 20:59:01', 'route01', 'route01AM15');
INSERT INTO `t_schedule` VALUES ('18', '74279', 'vehicle03', '2012-04-10 20:59:05', '2012-06-22 20:59:09', 'route01', 'route01S203');
INSERT INTO `t_schedule` VALUES ('19', '74270', 'vehicle04', '2012-04-30 20:59:12', '2012-06-24 20:59:16', 'route04', 'route04AM09');
INSERT INTO `t_schedule` VALUES ('20', '74228', 'vehicle04', '2012-04-30 20:59:19', '2012-06-07 20:59:22', 'route02', 'route02S104');
INSERT INTO `t_schedule` VALUES ('21', '74215', 'vehicle01', '2012-04-29 20:59:26', '2012-06-09 20:59:29', 'route02', 'route02S201');
INSERT INTO `t_schedule` VALUES ('22', '74106', 'vehicle01', '2012-05-08 20:59:32', '2012-06-23 20:59:37', 'route02', 'route02S254');
INSERT INTO `t_schedule` VALUES ('23', '74078', 'vehicle03', '2012-05-01 20:59:40', '2012-05-31 20:59:44', 'route04', 'route04AM16');
INSERT INTO `t_schedule` VALUES ('24', '73870', 'vehicle04', '2012-05-17 20:59:48', '2012-05-30 20:59:51', 'route04', 'route04AM0');
INSERT INTO `t_schedule` VALUES ('25', '73859', 'vehicle02', '2012-03-25 20:59:54', '2012-06-08 20:59:57', 'route01', 'route01AM13');
INSERT INTO `t_schedule` VALUES ('26', '73662', 'vehicle05', '2012-06-01 21:00:00', '2012-06-09 21:00:03', 'route02', 'route02AM06');
INSERT INTO `t_schedule` VALUES ('27', '73662', 'vehicle05', '2012-05-14 16:12:24', '2012-06-16 16:12:27', 'route02', 'route02PM08');

-- ----------------------------
-- Table structure for `t_systemconfig`
-- ----------------------------
DROP TABLE IF EXISTS `t_systemconfig`;
CREATE TABLE `t_systemconfig` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `displayName` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_systemconfig
-- ----------------------------
INSERT INTO `t_systemconfig` VALUES ('1', '123123', '1231', '123123');
INSERT INTO `t_systemconfig` VALUES ('2', 'asdfasf', 'asdfasdf', '12313');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `super_power` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'user_1', 'user_1', 'admin', '1');
INSERT INTO `t_user` VALUES ('5', 'demos', 'user_3', 'user_3', 'default', '0');
INSERT INTO `t_user` VALUES ('6', 'user_4', 'user_4', 'user_4', 'default', '0');
INSERT INTO `t_user` VALUES ('8', 'weiwei2', 'heihhhhh', 'weiwei2', 'default', '0');
INSERT INTO `t_user` VALUES ('9', 'weiwei3', 'asldjfklasjf', 'weiwei3', 'default', '0');
INSERT INTO `t_user` VALUES ('12', 'xxdsaf', 'asdfsafd', 'gdffasdf', 'default', '0');
INSERT INTO `t_user` VALUES ('19', 'test', 'test', 'test', 'test', '0');

-- ----------------------------
-- Table structure for `t_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `FK331DEE5FA1E94B1E` (`role_id`),
  KEY `FK331DEE5F47140EFE` (`user_id`),
  CONSTRAINT `FK331DEE5F47140EFE` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK331DEE5FA1E94B1E` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('5', '4');
INSERT INTO `t_user_role` VALUES ('6', '4');
INSERT INTO `t_user_role` VALUES ('5', '7');
INSERT INTO `t_user_role` VALUES ('1', '5');
INSERT INTO `t_user_role` VALUES ('1', '6');
INSERT INTO `t_user_role` VALUES ('19', '6');
INSERT INTO `t_user_role` VALUES ('5', '6');
INSERT INTO `t_user_role` VALUES ('6', '6');
INSERT INTO `t_user_role` VALUES ('8', '6');
INSERT INTO `t_user_role` VALUES ('9', '6');
INSERT INTO `t_user_role` VALUES ('12', '6');

-- ----------------------------
-- Table structure for `t_vehicle`
-- ----------------------------
DROP TABLE IF EXISTS `t_vehicle`;
CREATE TABLE `t_vehicle` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cctv_ip` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `device_id` bigint(20) DEFAULT NULL,
  `fleet_id` bigint(20) DEFAULT NULL,
  `number` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `license` (`license`),
  UNIQUE KEY `number` (`number`),
  KEY `FKCFF58261116C3656` (`fleet_id`),
  KEY `FKCFF58261A1D5461E` (`device_id`),
  CONSTRAINT `FKCFF58261116C3656` FOREIGN KEY (`fleet_id`) REFERENCES `t_fleet` (`id`),
  CONSTRAINT `FKCFF58261A1D5461E` FOREIGN KEY (`device_id`) REFERENCES `t_device` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_vehicle
-- ----------------------------
INSERT INTO `t_vehicle` VALUES ('1', '192.168.21.12', 'vehicle01', 'BA00001', 'bus', '4', '11', 'vehicle01');
INSERT INTO `t_vehicle` VALUES ('2', '210.38.124.35', 'vehicle02', 'FT00002', 'car', '8', '2', 'vehicle02');
INSERT INTO `t_vehicle` VALUES ('4', '33.125.45.782', 'vehicle03', 'HZ00012', 'bus', '12', '6', 'vehicle03');
INSERT INTO `t_vehicle` VALUES ('5', '210.58.654.12', 'vehicle04', 'CN0005', 'car', '11', '3', 'vehicle04');
INSERT INTO `t_vehicle` VALUES ('6', '102.210.45.41', 'vehicle05', 'GZ00001', 'bus', '18', '3', 'vehicle05');
INSERT INTO `t_vehicle` VALUES ('7', '12.122.45.123', 'vehicle06', 'GZ00002', 'car', '19', '5', 'vehicle06');
INSERT INTO `t_vehicle` VALUES ('8', '102.210.45.41', 'vehicle07', 'AZ00001', 'car', '31', '4', 'vehicle07');
INSERT INTO `t_vehicle` VALUES ('9', '102.210.45.41', 'vehicle08', 'BZ00003', 'bus', '32', '5', 'vehicle08');
INSERT INTO `t_vehicle` VALUES ('10', '102.210.45.41', 'vehicle09', 'BZ00004', 'bus', '58', '9', 'vehicle09');
INSERT INTO `t_vehicle` VALUES ('11', '102.210.45.41', 'vehicle10', 'BZ00005', 'car', '59', '10', 'vehicle10');
INSERT INTO `t_vehicle` VALUES ('12', '102.210.45.41', 'vehicle11', 'BZ00006', 'car', '60', '11', 'vehicle11');
INSERT INTO `t_vehicle` VALUES ('13', '102.210.45.41', 'vehicle12', 'BZ00007', 'car', '86', '3', 'vehicle12');
INSERT INTO `t_vehicle` VALUES ('14', '102.210.45.41', 'vehicle13', 'HZ00013', 'bus', '89', '5', 'vehicle13');
INSERT INTO `t_vehicle` VALUES ('15', '102.210.45.41', 'vehicle14', 'HZ00014', 'bus', '91', '6', 'vehicle14');
INSERT INTO `t_vehicle` VALUES ('16', '102.210.45.41', 'vehicle15', 'HZ00015', 'bus', '92', '2', 'vehicle15');
INSERT INTO `t_vehicle` VALUES ('17', '102.210.45.41', 'vehicle16', 'HS00014', 'car', '93', '6', 'vehicle16');
INSERT INTO `t_vehicle` VALUES ('18', '102.210.45.41', 'vehicle17', 'HS00002', 'car', '94', '5', 'vehicle17');
INSERT INTO `t_vehicle` VALUES ('20', '102.210.45.41', 'vehicle18', 'HW0012', 'bus', '95', '3', 'vehicle18');
INSERT INTO `t_vehicle` VALUES ('21', '102.210.45.41', 'vehicle19', 'SS00245', 'car', '96', '3', 'vehicle19');
INSERT INTO `t_vehicle` VALUES ('22', '102.210.45.41', 'vehicle20', 'SS01245', 'car', '97', '3', 'vehicle20');
