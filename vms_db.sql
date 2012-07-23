/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50511
Source Host           : localhost:3306
Source Database       : vms_db

Target Server Type    : MYSQL
Target Server Version : 50511
File Encoding         : 65001

Date: 2012-07-23 11:12:51
*/

SET FOREIGN_KEY_CHECKS=0;
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_counsel
-- ----------------------------
INSERT INTO `t_counsel` VALUES ('1', '2012-05-03 20:30:53', 'sdfasdf', '2012-05-02 15:30:21', '3', '1');
INSERT INTO `t_counsel` VALUES ('2', '2012-05-24 00:00:00', 'asdfasdf', '2012-05-02 00:00:00', '2', '1');
INSERT INTO `t_counsel` VALUES ('3', '2012-05-24 00:00:00', 'zzzzzz', '2012-05-02 00:00:00', '4', '1');
INSERT INTO `t_counsel` VALUES ('4', '2012-05-24 00:00:00', 'ggggg', '2012-05-02 00:00:00', '1', '1');
INSERT INTO `t_counsel` VALUES ('5', '2012-07-11 03:30:50', '123123', '2012-07-04 02:00:00', '2', '1');
INSERT INTO `t_counsel` VALUES ('7', '2012-07-18 06:00:00', '李靖什么的', '2012-07-01 02:30:00', '23', '1');
INSERT INTO `t_counsel` VALUES ('8', '2012-07-14 03:30:00', 'xxxxxxx', '2012-07-11 02:00:00', '4', '5');
INSERT INTO `t_counsel` VALUES ('14', '2012-07-18 02:00:00', 'asdfasdfs', '2012-07-18 00:00:00', '8', '6');
INSERT INTO `t_counsel` VALUES ('15', '2012-07-18 03:30:00', 'asfdasrerre', '2012-07-18 01:00:00', '9', '5');
INSERT INTO `t_counsel` VALUES ('16', '2012-07-18 07:00:00', 'sdfasdfasdf', '2012-07-18 01:30:00', '11', '6');
INSERT INTO `t_counsel` VALUES ('17', '2012-07-18 01:30:00', 'sdfasdfasdf', '2012-07-18 02:00:00', '8', '5');
INSERT INTO `t_counsel` VALUES ('18', '2012-07-18 03:30:00', '24234234', '2012-07-18 01:00:00', '9', '6');
INSERT INTO `t_counsel` VALUES ('19', '2012-07-18 11:30:00', 'asdfasfsadfsd', '2012-07-18 01:30:00', '11', '8');
INSERT INTO `t_counsel` VALUES ('20', '2012-07-18 12:00:00', 'sadfasdfasdfasd', '2012-07-18 01:30:00', '4', '1');
INSERT INTO `t_counsel` VALUES ('21', '2012-07-18 03:30:00', 'asdfasdfsdaf', '2012-07-18 02:30:00', '9', '5');
INSERT INTO `t_counsel` VALUES ('22', '2012-07-18 11:30:00', 'sdafsdf', '2012-07-18 01:30:00', '2', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

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
INSERT INTO `t_department` VALUES ('9', 'department_4_3', '5');

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
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `number` (`number`),
  KEY `FK6494EA5314A2A29E` (`department_id`),
  KEY `FK6494EA53116C3656` (`fleet_id`),
  CONSTRAINT `FK6494EA53116C3656` FOREIGN KEY (`fleet_id`) REFERENCES `t_fleet` (`id`),
  CONSTRAINT `FK6494EA5314A2A29E` FOREIGN KEY (`department_id`) REFERENCES `t_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_driver
-- ----------------------------
INSERT INTO `t_driver` VALUES ('1', 'TEST11111111', 'jack', '74689', '7', '6', null);
INSERT INTO `t_driver` VALUES ('2', '222asdfasfdsf', 'tangseng', '74652', '7', '11', null);
INSERT INTO `t_driver` VALUES ('3', '', 'zhulaoer', '74631', '2', null, null);
INSERT INTO `t_driver` VALUES ('4', 'just 4 test', 'xiaobai', '74571', '2', '2', 'smrtlbs@163.com');
INSERT INTO `t_driver` VALUES ('8', 'asdf', 'xiaohei', '74538', '4', '6', null);
INSERT INTO `t_driver` VALUES ('9', 'sadf', 'xiaoji', '74498', '4', '3', null);
INSERT INTO `t_driver` VALUES ('10', 'sf', 'xiaozhu', '74484', '6', '3', null);
INSERT INTO `t_driver` VALUES ('11', 'sdf', 'dahei', '74483', '6', '3', null);
INSERT INTO `t_driver` VALUES ('12', 'sdfs', 'dage', '74482', '7', null, null);
INSERT INTO `t_driver` VALUES ('13', 'dfsdfs', 'lixiaolong', '74423', '7', null, null);
INSERT INTO `t_driver` VALUES ('14', 'dfs', 'longwu', '74353', '8', null, null);
INSERT INTO `t_driver` VALUES ('15', 'df', 'zhanghanyun', '74291', '8', null, null);
INSERT INTO `t_driver` VALUES ('16', 'xv', 'chenglong', '74279', '2', null, null);
INSERT INTO `t_driver` VALUES ('17', 'xvx', 'shijun', '74270', '2', '2', null);
INSERT INTO `t_driver` VALUES ('18', 'xvxv', 'xiaodi', '74228', '3', '4', null);
INSERT INTO `t_driver` VALUES ('19', 'xvxv', 'zhangtianhan', '74215', '3', null, null);
INSERT INTO `t_driver` VALUES ('20', 'xvxvx', 'longhaitian', '74106', '4', null, null);
INSERT INTO `t_driver` VALUES ('21', 'xcvsdf', 'husun', '74078', '4', null, null);
INSERT INTO `t_driver` VALUES ('22', 'xvxv', 'menghaoran', '73870', '6', null, null);
INSERT INTO `t_driver` VALUES ('23', 'sdf', 'lijing', '73859', '7', '4', null);
INSERT INTO `t_driver` VALUES ('24', 'hdfh', 'lining', '73662', '8', null, null);
INSERT INTO `t_driver` VALUES ('26', 'heihei', 'fuckyourmm', '74690', null, null, null);
INSERT INTO `t_driver` VALUES ('32', 'xiaoping', 'xiaoping', '74694', null, null, null);
INSERT INTO `t_driver` VALUES ('33', 'mei', 'xiaomei', '74693', null, null, '493781187@qq.com');
INSERT INTO `t_driver` VALUES ('34', 'gua', 'guagua', '74692', null, null, null);
INSERT INTO `t_driver` VALUES ('35', 'wei', 'weiwei', '74691', null, null, 'l.weiwei@163.com');
INSERT INTO `t_driver` VALUES ('36', 'smrt office', 'smrt', '00000', null, null, 'smrtlbs@163.com');

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
) ENGINE=InnoDB AUTO_INCREMENT=7823 DEFAULT CHARSET=utf8;

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
INSERT INTO `t_driver_report` VALUES ('1527', '0', '2012-07-17 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-17 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '1', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1528', '0', '2012-07-17 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-17 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '2', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1529', '0', '2012-07-17 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-17 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '3', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1530', '0', '2012-07-17 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-17 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '4', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1531', '0', '2012-07-17 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-17 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '8', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1532', '0', '2012-07-17 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-17 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '9', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1533', '0', '2012-07-17 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-17 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '10', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1534', '0', '2012-07-17 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-17 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '11', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1535', '0', '2012-07-17 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-17 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '12', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1536', '0', '2012-07-17 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-17 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '13', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1537', '0', '2012-07-17 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-17 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '14', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1538', '0', '2012-07-17 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-17 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '15', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1539', '0', '2012-07-17 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-17 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '16', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1540', '0', '2012-07-17 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-17 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '17', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1541', '0', '2012-07-17 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-17 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '18', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1542', '0', '2012-07-17 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-17 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '19', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1543', '0', '2012-07-17 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-17 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '20', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1544', '0', '2012-07-17 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-17 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '21', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1545', '0', '2012-07-17 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-17 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '22', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1546', '0', '2012-07-17 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-17 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '23', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1547', '0', '2012-07-17 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-17 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '24', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1548', '0', '2012-07-17 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-17 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '26', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1549', '0', '2012-07-17 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-17 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '32', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1550', '0', '2012-07-17 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-17 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '33', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1551', '0', '2012-07-17 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-17 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '34', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1552', '0', '2012-07-17 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-17 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '35', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1553', '0', '2012-07-18 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '1', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1554', '0', '2012-07-18 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '2', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1555', '0', '2012-07-18 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '3', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1556', '0', '2012-07-18 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '4', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1557', '0', '2012-07-18 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '8', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1558', '0', '2012-07-18 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '9', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1559', '0', '2012-07-18 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '10', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1560', '0', '2012-07-18 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '11', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1561', '0', '2012-07-18 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '12', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1562', '0', '2012-07-18 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '13', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1563', '0', '2012-07-18 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '14', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1564', '0', '2012-07-18 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '15', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1565', '0', '2012-07-18 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '16', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1566', '0', '2012-07-18 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '17', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1567', '0', '2012-07-18 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '18', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1568', '0', '2012-07-18 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '19', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1569', '0', '2012-07-18 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '20', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1570', '0', '2012-07-18 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '21', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1571', '0', '2012-07-18 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '22', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1572', '0', '2012-07-18 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '23', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1573', '0', '2012-07-18 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '24', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1574', '0', '2012-07-18 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '26', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1575', '0', '2012-07-18 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '32', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1576', '0', '2012-07-18 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '33', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1577', '0', '2012-07-18 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '34', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1578', '0', '2012-07-18 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '35', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1579', '0', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '1', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1580', '0', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '2', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1581', '0', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '3', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1582', '0', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '4', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1583', '0', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '8', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1584', '0', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '9', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1585', '0', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '10', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1586', '0', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '11', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1587', '0', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '12', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1588', '0', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '13', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1589', '0', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '14', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1590', '0', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '15', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1591', '0', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '16', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1592', '86399', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '17', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1593', '172798', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '18', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1594', '0', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '19', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1595', '86399', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '20', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1596', '0', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '21', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1597', '0', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '22', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1598', '86399', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '23', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1599', '0', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '24', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1600', '0', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '26', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1601', '0', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '32', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1602', '0', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '33', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1603', '0', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '34', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1604', '0', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '35', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1605', '0', '2012-07-19 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-19 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '36', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1606', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '1', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1607', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '2', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1608', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '3', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1609', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '4', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1610', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '8', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1611', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '9', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1612', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '10', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1613', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '11', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1614', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '12', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1615', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '13', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1616', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '14', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1617', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '15', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1618', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '16', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1619', '86399', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '17', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1620', '172798', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '18', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1621', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '19', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1622', '86399', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '20', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1623', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '21', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1624', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '22', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1625', '86399', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '23', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1626', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '24', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1627', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '26', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1628', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '32', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1629', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '33', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1630', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '34', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1631', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '35', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1632', '0', '2012-07-22 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-22 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '36', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1633', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '1', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1634', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '2', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1635', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '3', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1636', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '4', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1637', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '8', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1638', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '9', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1639', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '10', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1640', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '11', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1641', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '12', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1642', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '13', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1643', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '14', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1644', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '15', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1645', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '16', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1646', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '17', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1647', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '18', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1648', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '19', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1649', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '20', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1650', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '21', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1651', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '22', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1652', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '23', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1653', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '24', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1654', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '26', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1655', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '32', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1656', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '33', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1657', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '34', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1658', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '35', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1659', '0', '2012-07-29 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '36', null, '100', '0', '0', '0');

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
INSERT INTO `t_event` VALUES ('24', '\0', '\0', '16', '2', '851', '', '6', '4', '2');
INSERT INTO `t_event` VALUES ('25', '\0', '\0', '2', '3', '851', '', '2', '2', '2');
INSERT INTO `t_event` VALUES ('26', '\0', '\0', '23', '4', '851', '', '2', '2', '7');
INSERT INTO `t_event` VALUES ('27', '\0', '\0', '4', '5', '171', '', '1', '1', '3');
INSERT INTO `t_event` VALUES ('28', '\0', '\0', '4', '6', '171', '', '1', '1', '3');
INSERT INTO `t_event` VALUES ('29', '\0', '\0', '17', '7', '167', '', '8', '5', '2');
INSERT INTO `t_event` VALUES ('30', '\0', '\0', '21', '8', '167', '', '6', '4', '4');
INSERT INTO `t_event` VALUES ('31', '\0', '\0', '18', '9', '171', '', '8', '5', '3');
INSERT INTO `t_event` VALUES ('32', '\0', '\0', '24', '10', '171', '', '7', '6', '8');

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
) ENGINE=InnoDB AUTO_INCREMENT=3727094 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_gps_data
-- ----------------------------
INSERT INTO `t_gps_data` VALUES ('3726354', '2012-07-23 11:06:02', '1', '', '29420.448339211973', '21604.897647895337', '28', '2012-07-23 11:06:02', '2');
INSERT INTO `t_gps_data` VALUES ('3726355', '2012-07-23 11:06:02', '0', '', '36778.13233660497', '12815.993605935679', '18', '2012-07-23 11:06:02', '1');
INSERT INTO `t_gps_data` VALUES ('3726356', '2012-07-23 11:06:02', '1', '', '41354.669645814225', '15335.813991117435', '16', '2012-07-23 11:06:02', '4');
INSERT INTO `t_gps_data` VALUES ('3726357', '2012-07-23 11:06:02', '3', '', '30207.994437536025', '30429.73067660714', '89', '2012-07-23 11:06:02', '3');
INSERT INTO `t_gps_data` VALUES ('3726358', '2012-07-23 11:06:02', '3', '', '31927.419218946503', '25377.575482366894', '7', '2012-07-23 11:06:02', '5');
INSERT INTO `t_gps_data` VALUES ('3726359', '2012-07-23 11:06:02', '2', '', '34209.393613250446', '10632.806827759048', '1', '2012-07-23 11:06:02', '6');
INSERT INTO `t_gps_data` VALUES ('3726360', '2012-07-23 11:06:02', '0', '', '36211.33665026013', '11355.262336753543', '17', '2012-07-23 11:06:02', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726361', '2012-07-23 11:06:02', '1', '', '39385.52226476457', '34713.72357630848', '5', '2012-07-23 11:06:02', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726362', '2012-07-23 11:06:02', '0', '', '29712.6591117264', '34102.385575302455', '46', '2012-07-23 11:06:02', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726363', '2012-07-23 11:06:02', '3', '', '31499.62306108707', '15183.472118824062', '29', '2012-07-23 11:06:02', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726364', '2012-07-23 11:06:02', '3', '', '43047.8586062649', '22462.42548974605', '7', '2012-07-23 11:06:02', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726365', '2012-07-23 11:06:02', '1', '', '32156.112785153273', '35999.223560685474', '49', '2012-07-23 11:06:02', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726366', '2012-07-23 11:06:02', '1', '', '35277.77774069381', '20037.388713143875', '53', '2012-07-23 11:06:02', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726367', '2012-07-23 11:06:02', '3', '', '40113.06492890988', '17555.246378068754', '30', '2012-07-23 11:06:02', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726368', '2012-07-23 11:06:02', '3', '', '30101.046534358058', '37136.40538435508', '10', '2012-07-23 11:06:02', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726369', '2012-07-23 11:06:02', '2', '', '39426.444891485546', '34333.32500491362', '18', '2012-07-23 11:06:02', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726370', '2012-07-23 11:06:02', '2', '', '40587.354248116826', '27955.68155725839', '44', '2012-07-23 11:06:02', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726371', '2012-07-23 11:06:02', '1', '', '33459.75098932799', '39153.706380945856', '43', '2012-07-23 11:06:02', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726372', '2012-07-23 11:06:02', '1', '', '39777.05876531881', '17249.053920154627', '24', '2012-07-23 11:06:02', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726373', '2012-07-23 11:06:02', '0', '', '42163.90858720852', '23254.7211751792', '21', '2012-07-23 11:06:02', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726374', '2012-07-23 11:06:12', '1', '', '29448.1379697454', '21652.30960780756', '28', '2012-07-23 11:06:12', '2');
INSERT INTO `t_gps_data` VALUES ('3726375', '2012-07-23 11:06:12', '0', '', '36762.78862658268', '12785.383787116198', '18', '2012-07-23 11:06:12', '1');
INSERT INTO `t_gps_data` VALUES ('3726376', '2012-07-23 11:06:12', '1', '', '41382.67349894703', '15375.698151783334', '16', '2012-07-23 11:06:12', '4');
INSERT INTO `t_gps_data` VALUES ('3726377', '2012-07-23 11:06:12', '3', '', '30118.684571121954', '30407.91683459847', '89', '2012-07-23 11:06:12', '3');
INSERT INTO `t_gps_data` VALUES ('3726378', '2012-07-23 11:06:12', '3', '', '31864.043775932943', '25374.93024245655', '7', '2012-07-23 11:06:12', '5');
INSERT INTO `t_gps_data` VALUES ('3726379', '2012-07-23 11:06:12', '2', '', '34246.25032926574', '10647.04113373928', '1', '2012-07-23 11:06:12', '6');
INSERT INTO `t_gps_data` VALUES ('3726380', '2012-07-23 11:06:12', '0', '', '36200.74145012426', '11299.863291917329', '17', '2012-07-23 11:06:12', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726381', '2012-07-23 11:06:12', '1', '', '39410.97665850412', '34771.410791435104', '5', '2012-07-23 11:06:12', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726382', '2012-07-23 11:06:12', '0', '', '29683.485542416824', '34068.690041804766', '46', '2012-07-23 11:06:12', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726383', '2012-07-23 11:06:12', '3', '', '31456.111977077533', '15158.753628345521', '29', '2012-07-23 11:06:12', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726384', '2012-07-23 11:06:12', '3', '', '42948.7992824049', '22461.11986932061', '7', '2012-07-23 11:06:12', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726385', '2012-07-23 11:06:12', '1', '', '32164.02269455873', '36056.81242315027', '49', '2012-07-23 11:06:12', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726386', '2012-07-23 11:06:12', '1', '', '35300.40044110576', '20098.6748854615', '53', '2012-07-23 11:06:12', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726387', '2012-07-23 11:06:12', '3', '', '40035.30071722112', '17545.21143534866', '30', '2012-07-23 11:06:12', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726388', '2012-07-23 11:06:12', '3', '', '30006.380984224666', '37110.19761501281', '10', '2012-07-23 11:06:12', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726389', '2012-07-23 11:06:12', '2', '', '39507.405549058625', '34350.25640920862', '18', '2012-07-23 11:06:12', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726390', '2012-07-23 11:06:12', '2', '', '40684.33172322265', '27977.87020997258', '44', '2012-07-23 11:06:12', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726391', '2012-07-23 11:06:12', '1', '', '33467.86460510229', '39205.26855354313', '43', '2012-07-23 11:06:12', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726392', '2012-07-23 11:06:12', '1', '', '39777.49393275413', '17326.297821439493', '24', '2012-07-23 11:06:12', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726393', '2012-07-23 11:06:12', '0', '', '42157.36971893341', '23200.798892425857', '21', '2012-07-23 11:06:12', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726394', '2012-07-23 11:06:23', '1', '', '29461.372705419442', '21745.073502044503', '28', '2012-07-23 11:06:23', '2');
INSERT INTO `t_gps_data` VALUES ('3726395', '2012-07-23 11:06:23', '0', '', '36744.08024816414', '12750.109214718408', '18', '2012-07-23 11:06:23', '1');
INSERT INTO `t_gps_data` VALUES ('3726396', '2012-07-23 11:06:23', '1', '', '41392.1027421788', '15473.416948352207', '16', '2012-07-23 11:06:23', '4');
INSERT INTO `t_gps_data` VALUES ('3726397', '2012-07-23 11:06:23', '3', '', '30085.98552042335', '30396.389488649704', '89', '2012-07-23 11:06:23', '3');
INSERT INTO `t_gps_data` VALUES ('3726398', '2012-07-23 11:06:23', '3', '', '31819.223435985903', '25353.209036658616', '7', '2012-07-23 11:06:23', '5');
INSERT INTO `t_gps_data` VALUES ('3726399', '2012-07-23 11:06:23', '2', '', '34288.44393747697', '10651.136407262142', '1', '2012-07-23 11:06:23', '6');
INSERT INTO `t_gps_data` VALUES ('3726400', '2012-07-23 11:06:23', '0', '', '36196.353931026184', '11242.301717379392', '17', '2012-07-23 11:06:23', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726401', '2012-07-23 11:06:23', '1', '', '39420.42731269438', '34804.498773533305', '5', '2012-07-23 11:06:23', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726402', '2012-07-23 11:06:23', '0', '', '29658.655644030416', '34017.47212983326', '46', '2012-07-23 11:06:23', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726403', '2012-07-23 11:06:23', '3', '', '31424.382401543076', '15154.89531989033', '29', '2012-07-23 11:06:23', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726404', '2012-07-23 11:06:23', '3', '', '42893.34506083529', '22445.375766394387', '7', '2012-07-23 11:06:23', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726405', '2012-07-23 11:06:23', '1', '', '32188.663371878356', '36110.43877814932', '49', '2012-07-23 11:06:23', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726406', '2012-07-23 11:06:23', '1', '', '35322.690240721284', '20196.786352337607', '53', '2012-07-23 11:06:23', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726407', '2012-07-23 11:06:23', '3', '', '39936.15640317293', '17535.458317636392', '30', '2012-07-23 11:06:23', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726408', '2012-07-23 11:06:23', '3', '', '29911.344302859816', '37088.8202135328', '10', '2012-07-23 11:06:23', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726409', '2012-07-23 11:06:23', '2', '', '39573.783618946654', '34373.23778405745', '18', '2012-07-23 11:06:23', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726410', '2012-07-23 11:06:23', '2', '', '40759.34127869164', '28004.5506659249', '44', '2012-07-23 11:06:23', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726411', '2012-07-23 11:06:23', '1', '', '33487.033199102174', '39295.98492490834', '43', '2012-07-23 11:06:23', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726412', '2012-07-23 11:06:23', '1', '', '39789.54572567984', '17374.83314331722', '24', '2012-07-23 11:06:23', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726413', '2012-07-23 11:06:23', '0', '', '42151.555231870945', '23133.330969802326', '21', '2012-07-23 11:06:23', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726414', '2012-07-23 11:06:33', '1', '', '29484.747347838413', '21793.693004327626', '28', '2012-07-23 11:06:33', '2');
INSERT INTO `t_gps_data` VALUES ('3726415', '2012-07-23 11:06:33', '0', '', '36730.61329561864', '12653.65125333832', '18', '2012-07-23 11:06:33', '1');
INSERT INTO `t_gps_data` VALUES ('3726416', '2012-07-23 11:06:33', '1', '', '41403.43367671255', '15558.493360845541', '16', '2012-07-23 11:06:33', '4');
INSERT INTO `t_gps_data` VALUES ('3726417', '2012-07-23 11:06:33', '3', '', '30006.066115412115', '30376.089719829615', '89', '2012-07-23 11:06:33', '3');
INSERT INTO `t_gps_data` VALUES ('3726418', '2012-07-23 11:06:33', '3', '', '31778.51596641463', '25351.363065874946', '7', '2012-07-23 11:06:33', '5');
INSERT INTO `t_gps_data` VALUES ('3726419', '2012-07-23 11:06:33', '2', '', '34326.70649489811', '10658.612391816949', '1', '2012-07-23 11:06:33', '6');
INSERT INTO `t_gps_data` VALUES ('3726420', '2012-07-23 11:06:33', '0', '', '36191.084236101415', '11199.723796043258', '17', '2012-07-23 11:06:33', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726421', '2012-07-23 11:06:33', '1', '', '39424.303646428525', '34840.302691352466', '5', '2012-07-23 11:06:33', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726422', '2012-07-23 11:06:33', '0', '', '29650.74250720617', '33937.5175447885', '46', '2012-07-23 11:06:33', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726423', '2012-07-23 11:06:33', '3', '', '31382.27393036272', '15140.177978066791', '29', '2012-07-23 11:06:33', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726424', '2012-07-23 11:06:33', '3', '', '42802.75853493672', '22426.547843179036', '7', '2012-07-23 11:06:33', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726425', '2012-07-23 11:06:33', '1', '', '32194.490002543916', '36193.35778191171', '49', '2012-07-23 11:06:33', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726426', '2012-07-23 11:06:33', '1', '', '35329.95857422846', '20244.628236160857', '53', '2012-07-23 11:06:33', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726427', '2012-07-23 11:06:33', '3', '', '39900.91028208049', '17510.02080188057', '30', '2012-07-23 11:06:33', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726428', '2012-07-23 11:06:33', '3', '', '29850.633421936822', '37073.12779413219', '10', '2012-07-23 11:06:33', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726429', '2012-07-23 11:06:33', '2', '', '39614.5633053843', '34374.129634461846', '18', '2012-07-23 11:06:33', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726430', '2012-07-23 11:06:33', '2', '', '40798.30675221377', '28028.047144915625', '44', '2012-07-23 11:06:33', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726431', '2012-07-23 11:06:33', '1', '', '33501.43694740777', '39347.92338417975', '43', '2012-07-23 11:06:33', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726432', '2012-07-23 11:06:33', '1', '', '39816.164383814874', '17409.104511377656', '24', '2012-07-23 11:06:33', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726433', '2012-07-23 11:06:33', '0', '', '42137.450631330066', '23037.074560173758', '21', '2012-07-23 11:06:33', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726434', '2012-07-23 11:06:43', '1', '', '29490.691680266078', '21858.962496433258', '28', '2012-07-23 11:06:43', '2');
INSERT INTO `t_gps_data` VALUES ('3726435', '2012-07-23 11:06:43', '0', '', '36719.95605095705', '12572.351093604737', '18', '2012-07-23 11:06:43', '1');
INSERT INTO `t_gps_data` VALUES ('3726436', '2012-07-23 11:06:43', '1', '', '41413.42983562694', '15597.594649507577', '16', '2012-07-23 11:06:43', '4');
INSERT INTO `t_gps_data` VALUES ('3726437', '2012-07-23 11:06:43', '3', '', '29957.70207399626', '30360.784785747255', '89', '2012-07-23 11:06:43', '3');
INSERT INTO `t_gps_data` VALUES ('3726438', '2012-07-23 11:06:43', '3', '', '31718.741708610112', '25341.188326193536', '7', '2012-07-23 11:06:43', '5');
INSERT INTO `t_gps_data` VALUES ('3726439', '2012-07-23 11:06:43', '2', '', '34376.502612744844', '10686.149511065601', '1', '2012-07-23 11:06:43', '6');
INSERT INTO `t_gps_data` VALUES ('3726440', '2012-07-23 11:06:43', '0', '', '36180.504906740534', '11158.875201581162', '17', '2012-07-23 11:06:43', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726441', '2012-07-23 11:06:43', '1', '', '39433.03890887302', '34874.075082671145', '5', '2012-07-23 11:06:43', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726442', '2012-07-23 11:06:43', '0', '', '29626.454328377815', '33848.667931351585', '46', '2012-07-23 11:06:43', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726443', '2012-07-23 11:06:43', '3', '', '31346.586049392572', '15129.597592709251', '29', '2012-07-23 11:06:43', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726444', '2012-07-23 11:06:43', '3', '', '42722.49655919278', '22399.5386986383', '7', '2012-07-23 11:06:43', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726445', '2012-07-23 11:06:43', '1', '', '32212.140254103262', '36228.88968149895', '49', '2012-07-23 11:06:43', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726446', '2012-07-23 11:06:43', '1', '', '35352.626992037534', '20342.734451771492', '53', '2012-07-23 11:06:43', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726447', '2012-07-23 11:06:43', '3', '', '39854.81408816491', '17496.57798595936', '30', '2012-07-23 11:06:43', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726448', '2012-07-23 11:06:43', '3', '', '29767.11296810575', '37061.096884719336', '10', '2012-07-23 11:06:43', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726449', '2012-07-23 11:06:43', '2', '', '39708.54462801686', '34382.68336622793', '18', '2012-07-23 11:06:43', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726450', '2012-07-23 11:06:43', '2', '', '40870.85595264031', '28056.65094231174', '44', '2012-07-23 11:06:43', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726451', '2012-07-23 11:06:43', '1', '', '33514.54383665097', '39395.14445632538', '43', '2012-07-23 11:06:43', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726452', '2012-07-23 11:06:43', '1', '', '39831.474160648', '17443.520981337053', '24', '2012-07-23 11:06:43', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726453', '2012-07-23 11:06:43', '0', '', '42135.96322214592', '22988.641488519876', '21', '2012-07-23 11:06:43', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726454', '2012-07-23 11:06:53', '1', '', '29500.999906850877', '21917.84538491596', '28', '2012-07-23 11:06:53', '2');
INSERT INTO `t_gps_data` VALUES ('3726455', '2012-07-23 11:06:53', '0', '', '36701.00790594119', '12493.177291823324', '18', '2012-07-23 11:06:53', '1');
INSERT INTO `t_gps_data` VALUES ('3726456', '2012-07-23 11:06:53', '1', '', '41422.92210325946', '15677.928523191797', '16', '2012-07-23 11:06:53', '4');
INSERT INTO `t_gps_data` VALUES ('3726457', '2012-07-23 11:06:53', '3', '', '29900.924071812653', '30335.436187611904', '89', '2012-07-23 11:06:53', '3');
INSERT INTO `t_gps_data` VALUES ('3726458', '2012-07-23 11:06:53', '3', '', '31666.66967815511', '25340.006417794502', '7', '2012-07-23 11:06:53', '5');
INSERT INTO `t_gps_data` VALUES ('3726459', '2012-07-23 11:06:53', '2', '', '34430.07377553788', '10697.866361577553', '1', '2012-07-23 11:06:53', '6');
INSERT INTO `t_gps_data` VALUES ('3726460', '2012-07-23 11:06:53', '0', '', '36162.085743904085', '11062.518251423175', '17', '2012-07-23 11:06:53', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726461', '2012-07-23 11:06:53', '1', '', '39457.29509419414', '34967.23714656741', '5', '2012-07-23 11:06:53', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726462', '2012-07-23 11:06:53', '0', '', '29624.99037895237', '33775.20408370318', '46', '2012-07-23 11:06:53', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726463', '2012-07-23 11:06:53', '3', '', '31313.40902212801', '15123.475645846846', '29', '2012-07-23 11:06:53', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726464', '2012-07-23 11:06:53', '3', '', '42672.54037212973', '22378.7586940467', '7', '2012-07-23 11:06:53', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726465', '2012-07-23 11:06:53', '1', '', '32214.305501586365', '36317.48297173816', '49', '2012-07-23 11:06:53', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726466', '2012-07-23 11:06:53', '1', '', '35363.62654054693', '20428.75589303525', '53', '2012-07-23 11:06:53', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726467', '2012-07-23 11:06:53', '3', '', '39811.052792176175', '17485.763108355455', '30', '2012-07-23 11:06:53', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726468', '2012-07-23 11:06:53', '3', '', '29694.667053813595', '37044.55067702553', '10', '2012-07-23 11:06:53', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726469', '2012-07-23 11:06:53', '2', '', '39768.205913271355', '34383.95187934681', '18', '2012-07-23 11:06:53', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726470', '2012-07-23 11:06:53', '2', '', '40957.842501262785', '28059.853302039075', '44', '2012-07-23 11:06:53', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726471', '2012-07-23 11:06:53', '1', '', '33526.80904817042', '39468.874323904616', '43', '2012-07-23 11:06:53', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726472', '2012-07-23 11:06:53', '1', '', '39852.46802000819', '17487.87481065254', '24', '2012-07-23 11:06:53', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726473', '2012-07-23 11:06:53', '0', '', '42107.39979006635', '22915.47564257706', '21', '2012-07-23 11:06:53', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726474', '2012-07-23 11:07:03', '1', '', '29515.942211924666', '21970.164011104625', '28', '2012-07-23 11:07:03', '2');
INSERT INTO `t_gps_data` VALUES ('3726475', '2012-07-23 11:07:03', '0', '', '36688.76342422787', '12460.871143582737', '18', '2012-07-23 11:07:03', '1');
INSERT INTO `t_gps_data` VALUES ('3726476', '2012-07-23 11:07:03', '1', '', '41452.77634365182', '15723.378331228934', '16', '2012-07-23 11:07:03', '4');
INSERT INTO `t_gps_data` VALUES ('3726477', '2012-07-23 11:07:03', '3', '', '29816.878490411775', '30313.8996568213', '89', '2012-07-23 11:07:03', '3');
INSERT INTO `t_gps_data` VALUES ('3726478', '2012-07-23 11:07:03', '3', '', '31597.284930745354', '25339.98120812681', '7', '2012-07-23 11:07:03', '5');
INSERT INTO `t_gps_data` VALUES ('3726479', '2012-07-23 11:07:03', '2', '', '34511.92213252626', '10727.283213771529', '1', '2012-07-23 11:07:03', '6');
INSERT INTO `t_gps_data` VALUES ('3726480', '2012-07-23 11:07:03', '0', '', '36142.074451187575', '11006.883582372411', '17', '2012-07-23 11:07:03', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726481', '2012-07-23 11:07:03', '1', '', '39471.968894902944', '35033.40918914677', '5', '2012-07-23 11:07:03', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726482', '2012-07-23 11:07:03', '0', '', '29607.17881974478', '33744.93989570885', '46', '2012-07-23 11:07:03', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726483', '2012-07-23 11:07:03', '3', '', '31227.29592803292', '15096.601301939985', '29', '2012-07-23 11:07:03', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726484', '2012-07-23 11:07:03', '3', '', '42638.60254453701', '22371.32906505527', '7', '2012-07-23 11:07:03', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726485', '2012-07-23 11:07:03', '1', '', '32226.530824300968', '36399.17891181168', '49', '2012-07-23 11:07:03', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726486', '2012-07-23 11:07:03', '1', '', '35366.67006046076', '20473.541597328254', '53', '2012-07-23 11:07:03', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726487', '2012-07-23 11:07:03', '3', '', '39725.8933559079', '17484.749325738518', '30', '2012-07-23 11:07:03', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726488', '2012-07-23 11:07:03', '3', '', '29638.336575295474', '37024.853569722414', '10', '2012-07-23 11:07:03', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726489', '2012-07-23 11:07:03', '2', '', '39811.007652189175', '34413.936176396055', '18', '2012-07-23 11:07:03', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726490', '2012-07-23 11:07:03', '2', '', '40990.690155417986', '28067.291579324938', '44', '2012-07-23 11:07:03', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726491', '2012-07-23 11:07:03', '1', '', '33541.37574007762', '39511.089647273206', '43', '2012-07-23 11:07:03', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726492', '2012-07-23 11:07:03', '1', '', '39852.830216415845', '17565.346414052903', '24', '2012-07-23 11:07:03', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726493', '2012-07-23 11:07:03', '0', '', '42103.991223661644', '22851.634540209176', '21', '2012-07-23 11:07:03', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726494', '2012-07-23 11:07:13', '1', '', '29544.750154095906', '22032.103423937286', '28', '2012-07-23 11:07:13', '2');
INSERT INTO `t_gps_data` VALUES ('3726495', '2012-07-23 11:07:13', '0', '', '36659.73376491934', '12391.070435237434', '18', '2012-07-23 11:07:13', '1');
INSERT INTO `t_gps_data` VALUES ('3726496', '2012-07-23 11:07:13', '1', '', '41471.398419544144', '15783.083995370402', '16', '2012-07-23 11:07:13', '4');
INSERT INTO `t_gps_data` VALUES ('3726497', '2012-07-23 11:07:13', '3', '', '29786.43784162659', '30301.958470574158', '89', '2012-07-23 11:07:13', '3');
INSERT INTO `t_gps_data` VALUES ('3726498', '2012-07-23 11:07:13', '3', '', '31502.402141108', '25317.983474684686', '7', '2012-07-23 11:07:13', '5');
INSERT INTO `t_gps_data` VALUES ('3726499', '2012-07-23 11:07:13', '2', '', '34604.40173062093', '10742.727979497678', '1', '2012-07-23 11:07:13', '6');
INSERT INTO `t_gps_data` VALUES ('3726500', '2012-07-23 11:07:13', '0', '', '36112.9613304808', '10919.74596466644', '17', '2012-07-23 11:07:13', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726501', '2012-07-23 11:07:13', '1', '', '39486.95500320762', '35119.71708242465', '5', '2012-07-23 11:07:13', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726502', '2012-07-23 11:07:13', '0', '', '29600.909479770173', '33689.32248541452', '46', '2012-07-23 11:07:13', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726503', '2012-07-23 11:07:13', '3', '', '31151.253176504557', '15083.360582470075', '29', '2012-07-23 11:07:13', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726504', '2012-07-23 11:07:13', '3', '', '42550.46961154462', '22353.67210326345', '7', '2012-07-23 11:07:13', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726505', '2012-07-23 11:07:13', '1', '', '32227.30124163588', '36471.90794102587', '49', '2012-07-23 11:07:13', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726506', '2012-07-23 11:07:13', '1', '', '35393.713671222824', '20545.341933333322', '53', '2012-07-23 11:07:13', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726507', '2012-07-23 11:07:13', '3', '', '39633.86967929761', '17470.696839230754', '30', '2012-07-23 11:07:13', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726508', '2012-07-23 11:07:13', '3', '', '29585.64761657494', '37018.66932609502', '10', '2012-07-23 11:07:13', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726509', '2012-07-23 11:07:13', '2', '', '39841.58413672764', '34442.81626412971', '18', '2012-07-23 11:07:13', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726510', '2012-07-23 11:07:13', '2', '', '41028.57212882827', '28082.85305764955', '44', '2012-07-23 11:07:13', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726511', '2012-07-23 11:07:13', '0', '', '33568.949335682686', '39590.19894232401', '43', '2012-07-23 11:07:13', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726512', '2012-07-23 11:07:13', '1', '', '39853.77818060539', '17636.976764317762', '24', '2012-07-23 11:07:13', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726513', '2012-07-23 11:07:13', '0', '', '42085.63969810242', '22763.594551882295', '21', '2012-07-23 11:07:13', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726514', '2012-07-23 11:07:23', '1', '', '29558.73433565955', '22083.06377319274', '28', '2012-07-23 11:07:23', '2');
INSERT INTO `t_gps_data` VALUES ('3726515', '2012-07-23 11:07:23', '0', '', '36657.53849065993', '12353.648584488252', '18', '2012-07-23 11:07:23', '1');
INSERT INTO `t_gps_data` VALUES ('3726516', '2012-07-23 11:07:23', '1', '', '41477.179517067336', '15875.988409621115', '16', '2012-07-23 11:07:23', '4');
INSERT INTO `t_gps_data` VALUES ('3726517', '2012-07-23 11:07:23', '3', '', '29688.84491081419', '30285.362677441703', '89', '2012-07-23 11:07:23', '3');
INSERT INTO `t_gps_data` VALUES ('3726518', '2012-07-23 11:07:23', '3', '', '31464.12366350984', '25290.291761155047', '7', '2012-07-23 11:07:23', '5');
INSERT INTO `t_gps_data` VALUES ('3726519', '2012-07-23 11:07:23', '2', '', '34659.641227744614', '10754.34921353645', '1', '2012-07-23 11:07:23', '6');
INSERT INTO `t_gps_data` VALUES ('3726520', '2012-07-23 11:07:23', '0', '', '36099.49216992289', '10826.706396709753', '17', '2012-07-23 11:07:23', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726521', '2012-07-23 11:07:23', '1', '', '39513.998567564144', '35150.06728070989', '5', '2012-07-23 11:07:23', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726522', '2012-07-23 11:07:23', '0', '', '29584.34700925522', '33604.318827044204', '46', '2012-07-23 11:07:23', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726523', '2012-07-23 11:07:23', '3', '', '31052.46334486176', '15074.225242433782', '29', '2012-07-23 11:07:23', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726524', '2012-07-23 11:07:23', '3', '', '42510.264937908396', '22347.918682472307', '7', '2012-07-23 11:07:23', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726525', '2012-07-23 11:07:23', '1', '', '32250.139443008895', '36570.13400331301', '49', '2012-07-23 11:07:23', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726526', '2012-07-23 11:07:23', '1', '', '35407.07638949291', '20635.60721646797', '53', '2012-07-23 11:07:23', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726527', '2012-07-23 11:07:23', '3', '', '39603.31394233266', '17462.75632780332', '30', '2012-07-23 11:07:23', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726528', '2012-07-23 11:07:23', '3', '', '29491.47405098506', '37000.80966942909', '10', '2012-07-23 11:07:23', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726529', '2012-07-23 11:07:23', '2', '', '39904.291357226415', '34449.06116095691', '18', '2012-07-23 11:07:23', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726530', '2012-07-23 11:07:23', '2', '', '41106.20305675795', '28098.422608616052', '44', '2012-07-23 11:07:23', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726531', '2012-07-23 11:07:23', '0', '', '33560.280481839196', '39503.86040866851', '43', '2012-07-23 11:07:23', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726532', '2012-07-23 11:07:23', '1', '', '39866.15904300394', '17680.553614028377', '24', '2012-07-23 11:07:23', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726533', '2012-07-23 11:07:23', '0', '', '42065.52202598124', '22684.039736409082', '21', '2012-07-23 11:07:23', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726534', '2012-07-23 11:07:33', '1', '', '29561.298445498353', '22136.25173847718', '28', '2012-07-23 11:07:33', '2');
INSERT INTO `t_gps_data` VALUES ('3726535', '2012-07-23 11:07:33', '0', '', '36639.166715753534', '12322.068679420416', '18', '2012-07-23 11:07:33', '1');
INSERT INTO `t_gps_data` VALUES ('3726536', '2012-07-23 11:07:33', '1', '', '41505.10000981843', '15932.301922734474', '16', '2012-07-23 11:07:33', '4');
INSERT INTO `t_gps_data` VALUES ('3726537', '2012-07-23 11:07:33', '3', '', '29652.71347867346', '30269.71264781471', '89', '2012-07-23 11:07:33', '3');
INSERT INTO `t_gps_data` VALUES ('3726538', '2012-07-23 11:07:33', '3', '', '31430.83161894148', '25275.02043522349', '7', '2012-07-23 11:07:33', '5');
INSERT INTO `t_gps_data` VALUES ('3726539', '2012-07-23 11:07:33', '2', '', '34716.82726625475', '10761.043509016254', '1', '2012-07-23 11:07:33', '6');
INSERT INTO `t_gps_data` VALUES ('3726540', '2012-07-23 11:07:33', '0', '', '36081.377419016164', '10782.628001645699', '17', '2012-07-23 11:07:33', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726541', '2012-07-23 11:07:33', '1', '', '39522.17707384308', '35184.72738878783', '5', '2012-07-23 11:07:33', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726542', '2012-07-23 11:07:33', '0', '', '29583.1840139912', '33525.5163328814', '46', '2012-07-23 11:07:33', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726543', '2012-07-23 11:07:33', '3', '', '30952.805072628104', '15052.668931996195', '29', '2012-07-23 11:07:33', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726544', '2012-07-23 11:07:33', '3', '', '42446.86755876459', '22320.536887734484', '7', '2012-07-23 11:07:33', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726545', '2012-07-23 11:07:33', '1', '', '32280.10132062808', '36615.87158942487', '49', '2012-07-23 11:07:33', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726546', '2012-07-23 11:07:33', '1', '', '35413.804065468015', '20703.950190197014', '53', '2012-07-23 11:07:33', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726547', '2012-07-23 11:07:33', '3', '', '39570.765485792144', '17453.877901595857', '30', '2012-07-23 11:07:33', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726548', '2012-07-23 11:07:33', '3', '', '29423.25416077868', '36998.52570958901', '10', '2012-07-23 11:07:33', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726549', '2012-07-23 11:07:33', '2', '', '39952.810302528014', '34451.04260884654', '18', '2012-07-23 11:07:33', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726550', '2012-07-23 11:07:33', '2', '', '41185.7409339938', '28103.779533154484', '44', '2012-07-23 11:07:33', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726551', '2012-07-23 11:07:33', '0', '', '33558.76126054426', '39462.01149587272', '43', '2012-07-23 11:07:33', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726552', '2012-07-23 11:07:33', '1', '', '39878.229621083185', '17734.412803239073', '24', '2012-07-23 11:07:33', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726553', '2012-07-23 11:07:33', '0', '', '42052.625760748684', '22630.08431327911', '21', '2012-07-23 11:07:33', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726554', '2012-07-23 11:07:43', '1', '', '29588.602528566258', '22193.71928989976', '28', '2012-07-23 11:07:43', '2');
INSERT INTO `t_gps_data` VALUES ('3726555', '2012-07-23 11:07:43', '0', '', '36613.79475622658', '12245.27043108028', '18', '2012-07-23 11:07:43', '1');
INSERT INTO `t_gps_data` VALUES ('3726556', '2012-07-23 11:07:43', '1', '', '41532.72802266313', '15988.884680103476', '16', '2012-07-23 11:07:43', '4');
INSERT INTO `t_gps_data` VALUES ('3726557', '2012-07-23 11:07:43', '3', '', '29571.25056092654', '30256.265960121953', '89', '2012-07-23 11:07:43', '3');
INSERT INTO `t_gps_data` VALUES ('3726558', '2012-07-23 11:07:43', '3', '', '31351.492730566188', '25254.327530341685', '7', '2012-07-23 11:07:43', '5');
INSERT INTO `t_gps_data` VALUES ('3726559', '2012-07-23 11:07:43', '2', '', '34755.10698441135', '10785.86669446226', '1', '2012-07-23 11:07:43', '6');
INSERT INTO `t_gps_data` VALUES ('3726560', '2012-07-23 11:07:43', '0', '', '36074.13036781459', '10704.08107422499', '17', '2012-07-23 11:07:43', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726561', '2012-07-23 11:07:43', '1', '', '39547.87204902652', '35224.146318437604', '5', '2012-07-23 11:07:43', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726562', '2012-07-23 11:07:43', '0', '', '29575.591302899866', '33446.863139402645', '46', '2012-07-23 11:07:43', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726563', '2012-07-23 11:07:43', '3', '', '30865.192625874042', '15033.550383928952', '29', '2012-07-23 11:07:43', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726564', '2012-07-23 11:07:43', '3', '', '42402.51419753807', '22316.716808456033', '7', '2012-07-23 11:07:43', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726565', '2012-07-23 11:07:43', '1', '', '32293.05577644316', '36704.929193428405', '49', '2012-07-23 11:07:43', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726566', '2012-07-23 11:07:43', '1', '', '35416.00508002704', '20735.739247431717', '53', '2012-07-23 11:07:43', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726567', '2012-07-23 11:07:43', '3', '', '39485.58617848596', '17452.24317267902', '30', '2012-07-23 11:07:43', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726568', '2012-07-23 11:07:43', '3', '', '29386.163429448425', '36994.97885760574', '10', '2012-07-23 11:07:43', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726569', '2012-07-23 11:07:43', '2', '', '40038.57431404683', '34455.696938782305', '18', '2012-07-23 11:07:43', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726570', '2012-07-23 11:07:43', '2', '', '41221.34112395307', '28115.694092702197', '44', '2012-07-23 11:07:43', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726571', '2012-07-23 11:07:43', '0', '', '33547.90992227808', '39411.877498638634', '43', '2012-07-23 11:07:43', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726572', '2012-07-23 11:07:43', '1', '', '39891.326982305094', '17778.857200043014', '24', '2012-07-23 11:07:43', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726573', '2012-07-23 11:07:43', '0', '', '42037.44251472927', '22566.049727258945', '21', '2012-07-23 11:07:43', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726574', '2012-07-23 11:07:53', '1', '', '29603.64403776578', '22280.412759210427', '28', '2012-07-23 11:07:53', '2');
INSERT INTO `t_gps_data` VALUES ('3726575', '2012-07-23 11:07:53', '0', '', '36600.31165021671', '12174.308496105416', '18', '2012-07-23 11:07:53', '1');
INSERT INTO `t_gps_data` VALUES ('3726576', '2012-07-23 11:07:53', '1', '', '41553.29678368001', '16027.575640060417', '16', '2012-07-23 11:07:53', '4');
INSERT INTO `t_gps_data` VALUES ('3726577', '2012-07-23 11:07:53', '3', '', '29479.4334195987', '30228.99577093237', '89', '2012-07-23 11:07:53', '3');
INSERT INTO `t_gps_data` VALUES ('3726578', '2012-07-23 11:07:53', '3', '', '31282.374437692295', '25243.01725287186', '7', '2012-07-23 11:07:53', '5');
INSERT INTO `t_gps_data` VALUES ('3726579', '2012-07-23 11:07:53', '2', '', '34831.52295689134', '10791.098212158608', '1', '2012-07-23 11:07:53', '6');
INSERT INTO `t_gps_data` VALUES ('3726580', '2012-07-23 11:07:53', '0', '', '36062.63264585411', '10616.024366160731', '17', '2012-07-23 11:07:53', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726581', '2012-07-23 11:07:53', '1', '', '39564.03730568293', '35261.73826179717', '5', '2012-07-23 11:07:53', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726582', '2012-07-23 11:07:53', '0', '', '29571.51505678412', '33366.327026635154', '46', '2012-07-23 11:07:53', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726583', '2012-07-23 11:07:53', '3', '', '30805.19495056012', '15024.700262621807', '29', '2012-07-23 11:07:53', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726584', '2012-07-23 11:07:53', '3', '', '42356.01929570798', '22288.41000557607', '7', '2012-07-23 11:07:53', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726585', '2012-07-23 11:07:53', '1', '', '32293.74486575322', '36739.83927355242', '49', '2012-07-23 11:07:53', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726586', '2012-07-23 11:07:53', '1', '', '35426.42829883732', '20803.17310165928', '53', '2012-07-23 11:07:53', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726587', '2012-07-23 11:07:53', '3', '', '39397.51005614951', '17434.863290950416', '30', '2012-07-23 11:07:53', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726588', '2012-07-23 11:07:53', '3', '', '29292.186060568252', '36977.965478043596', '10', '2012-07-23 11:07:53', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726589', '2012-07-23 11:07:53', '2', '', '40095.06020185471', '34467.11167761589', '18', '2012-07-23 11:07:53', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726590', '2012-07-23 11:07:53', '2', '', '41304.59602714328', '28138.85311243475', '44', '2012-07-23 11:07:53', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726591', '2012-07-23 11:07:53', '0', '', '33525.324736587834', '39346.30473523641', '43', '2012-07-23 11:07:53', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726592', '2012-07-23 11:07:53', '1', '', '39908.11587440392', '17861.24199623428', '24', '2012-07-23 11:07:53', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726593', '2012-07-23 11:07:53', '0', '', '42010.640921015714', '22502.889761821778', '21', '2012-07-23 11:07:53', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726594', '2012-07-23 11:08:03', '1', '', '29623.180047334296', '22370.0405280655', '28', '2012-07-23 11:08:03', '2');
INSERT INTO `t_gps_data` VALUES ('3726595', '2012-07-23 11:08:03', '0', '', '36570.65579846847', '12105.72067405777', '18', '2012-07-23 11:08:03', '1');
INSERT INTO `t_gps_data` VALUES ('3726596', '2012-07-23 11:08:03', '1', '', '41578.406093787686', '16078.092319987316', '16', '2012-07-23 11:08:03', '4');
INSERT INTO `t_gps_data` VALUES ('3726597', '2012-07-23 11:08:03', '3', '', '29421.409487782097', '30218.054960860954', '89', '2012-07-23 11:08:03', '3');
INSERT INTO `t_gps_data` VALUES ('3726598', '2012-07-23 11:08:03', '3', '', '31210.45269137409', '25223.24802723707', '7', '2012-07-23 11:08:03', '5');
INSERT INTO `t_gps_data` VALUES ('3726599', '2012-07-23 11:08:03', '2', '', '34875.395512569565', '10812.837307828271', '1', '2012-07-23 11:08:03', '6');
INSERT INTO `t_gps_data` VALUES ('3726600', '2012-07-23 11:08:03', '0', '', '36042.72155224432', '10536.615112316682', '17', '2012-07-23 11:08:03', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726601', '2012-07-23 11:08:03', '1', '', '39591.382066610146', '35309.639230645254', '5', '2012-07-23 11:08:03', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726602', '2012-07-23 11:08:03', '0', '', '29550.711939930334', '33331.43409758203', '46', '2012-07-23 11:08:03', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726603', '2012-07-23 11:08:03', '3', '', '30764.46942334393', '15010.045793075888', '29', '2012-07-23 11:08:03', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726604', '2012-07-23 11:08:03', '3', '', '42303.115344764716', '22261.476880054695', '7', '2012-07-23 11:08:03', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726605', '2012-07-23 11:08:03', '1', '', '32296.303148898678', '36786.1804633186', '49', '2012-07-23 11:08:03', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726606', '2012-07-23 11:08:03', '1', '', '35445.663596391234', '20886.611926217123', '53', '2012-07-23 11:08:03', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726607', '2012-07-23 11:08:03', '3', '', '39325.490110045685', '17413.26405531502', '30', '2012-07-23 11:08:03', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726608', '2012-07-23 11:08:03', '3', '', '29241.071468340262', '36969.66491512476', '10', '2012-07-23 11:08:03', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726609', '2012-07-23 11:08:03', '2', '', '40152.14425982958', '34487.3139905166', '18', '2012-07-23 11:08:03', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726610', '2012-07-23 11:08:03', '2', '', '41384.79876575933', '28147.042077836886', '44', '2012-07-23 11:08:03', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726611', '2012-07-23 11:08:03', '0', '', '33512.254905406706', '39259.48423464867', '43', '2012-07-23 11:08:03', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726612', '2012-07-23 11:08:03', '1', '', '39908.245085196046', '17949.449967660756', '24', '2012-07-23 11:08:03', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726613', '2012-07-23 11:08:03', '0', '', '41996.39164631888', '22421.597677011032', '21', '2012-07-23 11:08:03', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726614', '2012-07-23 11:08:13', '1', '', '29644.857242105616', '22400.180629317372', '28', '2012-07-23 11:08:13', '2');
INSERT INTO `t_gps_data` VALUES ('3726615', '2012-07-23 11:08:13', '0', '', '36560.88629063373', '12034.910139892767', '18', '2012-07-23 11:08:13', '1');
INSERT INTO `t_gps_data` VALUES ('3726616', '2012-07-23 11:08:13', '1', '', '41601.37563437631', '16154.431702967044', '16', '2012-07-23 11:08:13', '4');
INSERT INTO `t_gps_data` VALUES ('3726617', '2012-07-23 11:08:13', '3', '', '29356.853209852045', '30214.1879799392', '89', '2012-07-23 11:08:13', '3');
INSERT INTO `t_gps_data` VALUES ('3726618', '2012-07-23 11:08:13', '3', '', '31136.67231248377', '25196.391799601573', '7', '2012-07-23 11:08:13', '5');
INSERT INTO `t_gps_data` VALUES ('3726619', '2012-07-23 11:08:13', '2', '', '34964.350709815364', '10814.371027868974', '1', '2012-07-23 11:08:13', '6');
INSERT INTO `t_gps_data` VALUES ('3726620', '2012-07-23 11:08:13', '0', '', '36017.37036518197', '10476.393502337327', '17', '2012-07-23 11:08:13', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726621', '2012-07-23 11:08:13', '1', '', '39594.69675402839', '35384.429163277455', '5', '2012-07-23 11:08:13', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726622', '2012-07-23 11:08:13', '0', '', '29521.269338162732', '33266.26077594085', '46', '2012-07-23 11:08:13', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726623', '2012-07-23 11:08:13', '3', '', '30677.810531103765', '14982.291066282158', '29', '2012-07-23 11:08:13', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726624', '2012-07-23 11:08:14', '3', '', '42250.36047280274', '22255.766269685802', '7', '2012-07-23 11:08:14', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726625', '2012-07-23 11:08:14', '1', '', '32320.796993987333', '36841.49233081665', '49', '2012-07-23 11:08:14', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726626', '2012-07-23 11:08:14', '1', '', '35452.94256809746', '20936.676578795406', '53', '2012-07-23 11:08:14', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726627', '2012-07-23 11:08:14', '3', '', '39277.22953567776', '17399.34155248363', '30', '2012-07-23 11:08:14', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726628', '2012-07-23 11:08:14', '3', '', '29184.35288660714', '36943.92908010429', '10', '2012-07-23 11:08:14', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726629', '2012-07-23 11:08:14', '2', '', '40195.88486507222', '34489.215801696155', '18', '2012-07-23 11:08:14', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726630', '2012-07-23 11:08:14', '2', '', '41420.69258136561', '28172.11020114473', '44', '2012-07-23 11:08:14', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726631', '2012-07-23 11:08:14', '0', '', '33485.21150795838', '39184.55936011612', '43', '2012-07-23 11:08:14', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726632', '2012-07-23 11:08:14', '1', '', '39925.84119918915', '18019.197305300644', '24', '2012-07-23 11:08:14', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726633', '2012-07-23 11:08:14', '0', '', '41993.50858692385', '22385.90626835188', '21', '2012-07-23 11:08:14', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726634', '2012-07-23 11:08:24', '1', '', '29648.3031014703', '22432.973815697267', '28', '2012-07-23 11:08:24', '2');
INSERT INTO `t_gps_data` VALUES ('3726635', '2012-07-23 11:08:24', '0', '', '36555.68242953903', '11999.227567088781', '18', '2012-07-23 11:08:24', '1');
INSERT INTO `t_gps_data` VALUES ('3726636', '2012-07-23 11:08:24', '1', '', '41603.78267544178', '16219.269398485676', '16', '2012-07-23 11:08:24', '4');
INSERT INTO `t_gps_data` VALUES ('3726637', '2012-07-23 11:08:24', '3', '', '29296.50489364875', '30193.263223090005', '89', '2012-07-23 11:08:24', '3');
INSERT INTO `t_gps_data` VALUES ('3726638', '2012-07-23 11:08:24', '3', '', '31053.247766853747', '25169.722756450567', '7', '2012-07-23 11:08:24', '5');
INSERT INTO `t_gps_data` VALUES ('3726639', '2012-07-23 11:08:24', '2', '', '35061.79970553391', '10819.600596390635', '1', '2012-07-23 11:08:24', '6');
INSERT INTO `t_gps_data` VALUES ('3726640', '2012-07-23 11:08:24', '0', '', '35991.37150331827', '10414.243201747006', '17', '2012-07-23 11:08:24', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726641', '2012-07-23 11:08:24', '1', '', '39606.05109501303', '35456.95014553306', '5', '2012-07-23 11:08:24', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726642', '2012-07-23 11:08:24', '0', '', '29499.939407147926', '33172.3797801488', '46', '2012-07-23 11:08:24', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726643', '2012-07-23 11:08:24', '3', '', '30602.41847484881', '14958.917654790634', '29', '2012-07-23 11:08:24', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726644', '2012-07-23 11:08:24', '3', '', '42199.179570744745', '22254.711463440184', '7', '2012-07-23 11:08:24', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726645', '2012-07-23 11:08:24', '1', '', '32335.18220895841', '36872.92808450017', '49', '2012-07-23 11:08:24', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726646', '2012-07-23 11:08:24', '1', '', '35473.747255032344', '21033.008846157234', '53', '2012-07-23 11:08:24', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726647', '2012-07-23 11:08:24', '3', '', '39228.27525995547', '17385.96510782115', '30', '2012-07-23 11:08:24', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726648', '2012-07-23 11:08:24', '3', '', '29085.59239985816', '36930.701274890846', '10', '2012-07-23 11:08:24', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726649', '2012-07-23 11:08:24', '2', '', '40295.375508941615', '34495.605785784865', '18', '2012-07-23 11:08:24', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726650', '2012-07-23 11:08:24', '2', '', '41476.84718650727', '28188.342207973084', '44', '2012-07-23 11:08:24', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726651', '2012-07-23 11:08:24', '0', '', '33460.5252852164', '39116.39939328621', '43', '2012-07-23 11:08:24', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726652', '2012-07-23 11:08:24', '1', '', '39953.38645099767', '18059.95592722931', '24', '2012-07-23 11:08:24', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726653', '2012-07-23 11:08:24', '0', '', '41969.71278120423', '22299.431632425014', '21', '2012-07-23 11:08:24', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726654', '2012-07-23 11:08:34', '1', '', '29654.891822746067', '22517.23757610077', '28', '2012-07-23 11:08:34', '2');
INSERT INTO `t_gps_data` VALUES ('3726655', '2012-07-23 11:08:34', '0', '', '36534.69734621066', '11951.70776620532', '18', '2012-07-23 11:08:34', '1');
INSERT INTO `t_gps_data` VALUES ('3726656', '2012-07-23 11:08:34', '1', '', '41630.3073451536', '16284.978381240931', '16', '2012-07-23 11:08:34', '4');
INSERT INTO `t_gps_data` VALUES ('3726657', '2012-07-23 11:08:34', '3', '', '29207.963753573185', '30191.13320294746', '89', '2012-07-23 11:08:34', '3');
INSERT INTO `t_gps_data` VALUES ('3726658', '2012-07-23 11:08:34', '3', '', '30966.331148157507', '25145.23711462304', '7', '2012-07-23 11:08:34', '5');
INSERT INTO `t_gps_data` VALUES ('3726659', '2012-07-23 11:08:34', '2', '', '35103.85032785079', '10846.286583897256', '1', '2012-07-23 11:08:34', '6');
INSERT INTO `t_gps_data` VALUES ('3726660', '2012-07-23 11:08:34', '0', '', '35989.2776179084', '10360.979913178258', '17', '2012-07-23 11:08:34', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726661', '2012-07-23 11:08:34', '1', '', '39607.21392623307', '35516.18735863737', '5', '2012-07-23 11:08:34', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726662', '2012-07-23 11:08:34', '0', '', '29482.308400649767', '33090.82632294639', '46', '2012-07-23 11:08:34', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726663', '2012-07-23 11:08:34', '3', '', '30542.392593334967', '14934.128826589365', '29', '2012-07-23 11:08:34', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726664', '2012-07-23 11:08:34', '3', '', '42168.68310390731', '22238.476374894177', '7', '2012-07-23 11:08:34', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726665', '2012-07-23 11:08:34', '1', '', '32354.728113011006', '36967.323246049025', '49', '2012-07-23 11:08:34', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726666', '2012-07-23 11:08:34', '1', '', '35474.63656025382', '21090.848358920997', '53', '2012-07-23 11:08:34', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726667', '2012-07-23 11:08:34', '3', '', '39191.41496346144', '17378.972990428294', '30', '2012-07-23 11:08:34', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726668', '2012-07-23 11:08:34', '3', '', '29012.06055144333', '36926.16350157609', '10', '2012-07-23 11:08:34', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726669', '2012-07-23 11:08:34', '2', '', '40365.94564448271', '34498.74193556516', '18', '2012-07-23 11:08:34', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726670', '2012-07-23 11:08:34', '2', '', '41534.10292131757', '28203.487169973', '44', '2012-07-23 11:08:34', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726671', '2012-07-23 11:08:34', '0', '', '33430.609981957445', '39029.36643374628', '43', '2012-07-23 11:08:34', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726672', '2012-07-23 11:08:34', '1', '', '39965.49442944297', '18103.554951556416', '24', '2012-07-23 11:08:34', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726673', '2012-07-23 11:08:34', '0', '', '41942.27795399897', '22250.555362286454', '21', '2012-07-23 11:08:34', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726674', '2012-07-23 11:08:44', '1', '', '29664.505106913126', '22582.300626554435', '28', '2012-07-23 11:08:44', '2');
INSERT INTO `t_gps_data` VALUES ('3726675', '2012-07-23 11:08:44', '0', '', '36505.362137155564', '11921.199526159291', '18', '2012-07-23 11:08:44', '1');
INSERT INTO `t_gps_data` VALUES ('3726676', '2012-07-23 11:08:44', '1', '', '41655.37922129246', '16364.459420411615', '16', '2012-07-23 11:08:44', '4');
INSERT INTO `t_gps_data` VALUES ('3726677', '2012-07-23 11:08:44', '3', '', '29152.483618878523', '30166.387828178187', '89', '2012-07-23 11:08:44', '3');
INSERT INTO `t_gps_data` VALUES ('3726678', '2012-07-23 11:08:44', '3', '', '30869.51429119562', '25144.62970474791', '7', '2012-07-23 11:08:44', '5');
INSERT INTO `t_gps_data` VALUES ('3726679', '2012-07-23 11:08:44', '2', '', '35142.91277627773', '10870.94419137904', '1', '2012-07-23 11:08:44', '6');
INSERT INTO `t_gps_data` VALUES ('3726680', '2012-07-23 11:08:44', '0', '', '35987.14601775973', '10282.189906379303', '17', '2012-07-23 11:08:44', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726681', '2012-07-23 11:08:44', '1', '', '39635.206792547586', '35602.69478626653', '5', '2012-07-23 11:08:44', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726682', '2012-07-23 11:08:44', '0', '', '29458.81923896867', '33029.774396559', '46', '2012-07-23 11:08:44', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726683', '2012-07-23 11:08:44', '3', '', '30463.616142135837', '14913.233682823326', '29', '2012-07-23 11:08:44', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726684', '2012-07-23 11:08:44', '3', '', '42105.12049039677', '22237.135496850464', '7', '2012-07-23 11:08:44', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726685', '2012-07-23 11:08:44', '1', '', '32361.342670456655', '37000.394951275994', '49', '2012-07-23 11:08:44', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726686', '2012-07-23 11:08:44', '1', '', '35492.87438408614', '21141.710695057605', '53', '2012-07-23 11:08:44', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726687', '2012-07-23 11:08:44', '3', '', '39127.49838326411', '17352.5730322434', '30', '2012-07-23 11:08:44', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726688', '2012-07-23 11:08:44', '3', '', '28951.9370741237', '36911.421191957656', '10', '2012-07-23 11:08:44', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726689', '2012-07-23 11:08:44', '2', '', '40401.902788954954', '34509.669665862864', '18', '2012-07-23 11:08:44', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726690', '2012-07-23 11:08:44', '2', '', '41586.12698325746', '28213.934480508804', '44', '2012-07-23 11:08:44', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726691', '2012-07-23 11:08:44', '0', '', '33421.59974839918', '38936.75369432876', '43', '2012-07-23 11:08:44', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726692', '2012-07-23 11:08:44', '1', '', '39984.96493533523', '18147.09589882956', '24', '2012-07-23 11:08:44', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726693', '2012-07-23 11:08:44', '0', '', '41918.41990453459', '22178.69957142341', '21', '2012-07-23 11:08:44', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726694', '2012-07-23 11:08:54', '1', '', '29694.346171927034', '22623.202285417563', '28', '2012-07-23 11:08:54', '2');
INSERT INTO `t_gps_data` VALUES ('3726695', '2012-07-23 11:08:54', '0', '', '36487.31547668192', '11835.607801015143', '18', '2012-07-23 11:08:54', '1');
INSERT INTO `t_gps_data` VALUES ('3726696', '2012-07-23 11:08:54', '1', '', '41676.0634206305', '16435.817304695527', '16', '2012-07-23 11:08:54', '4');
INSERT INTO `t_gps_data` VALUES ('3726697', '2012-07-23 11:08:54', '3', '', '29099.04743709027', '30136.708752331928', '89', '2012-07-23 11:08:54', '3');
INSERT INTO `t_gps_data` VALUES ('3726698', '2012-07-23 11:08:54', '3', '', '30801.492688496783', '25127.084460090213', '7', '2012-07-23 11:08:54', '5');
INSERT INTO `t_gps_data` VALUES ('3726699', '2012-07-23 11:08:54', '2', '', '35186.57573204653', '10892.704239665994', '1', '2012-07-23 11:08:54', '6');
INSERT INTO `t_gps_data` VALUES ('3726700', '2012-07-23 11:08:54', '0', '', '35959.331249079856', '10244.244366682851', '17', '2012-07-23 11:08:54', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726701', '2012-07-23 11:08:54', '1', '', '39643.80250565789', '35669.502676984695', '5', '2012-07-23 11:08:54', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726702', '2012-07-23 11:08:54', '0', '', '29454.99595683762', '32943.46622912717', '46', '2012-07-23 11:08:54', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726703', '2012-07-23 11:08:54', '3', '', '30412.306486467805', '14904.892196483464', '29', '2012-07-23 11:08:54', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726704', '2012-07-23 11:08:54', '3', '', '42041.1477880357', '22223.92317660606', '7', '2012-07-23 11:08:54', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726705', '2012-07-23 11:08:54', '1', '', '32384.818397877567', '37081.36651786163', '49', '2012-07-23 11:08:54', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726706', '2012-07-23 11:08:54', '1', '', '35501.22205683877', '21206.022703672155', '53', '2012-07-23 11:08:54', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726707', '2012-07-23 11:08:54', '3', '', '39049.9850950078', '17330.307650006485', '30', '2012-07-23 11:08:54', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726708', '2012-07-23 11:08:54', '3', '', '28915.534125700004', '36902.614075390295', '10', '2012-07-23 11:08:54', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726709', '2012-07-23 11:08:54', '2', '', '40436.93375990415', '34520.476707003065', '18', '2012-07-23 11:08:54', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726710', '2012-07-23 11:08:54', '2', '', '41678.530726039666', '28225.235357883197', '44', '2012-07-23 11:08:54', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726711', '2012-07-23 11:08:54', '0', '', '33421.234237781864', '38905.06097354195', '43', '2012-07-23 11:08:54', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726712', '2012-07-23 11:08:54', '1', '', '39989.01229325491', '18222.951048002324', '24', '2012-07-23 11:08:54', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726713', '2012-07-23 11:08:54', '0', '', '41898.09998676214', '22122.263307249817', '21', '2012-07-23 11:08:54', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726714', '2012-07-23 11:09:04', '1', '', '29715.601385248796', '22711.375185232355', '28', '2012-07-23 11:09:04', '2');
INSERT INTO `t_gps_data` VALUES ('3726715', '2012-07-23 11:09:04', '0', '', '36460.61543156366', '11746.515104238842', '18', '2012-07-23 11:09:04', '1');
INSERT INTO `t_gps_data` VALUES ('3726716', '2012-07-23 11:09:04', '1', '', '41701.004759997944', '16511.63399903893', '16', '2012-07-23 11:09:04', '4');
INSERT INTO `t_gps_data` VALUES ('3726717', '2012-07-23 11:09:04', '3', '', '29066.85280495768', '30120.74342386373', '89', '2012-07-23 11:09:04', '3');
INSERT INTO `t_gps_data` VALUES ('3726718', '2012-07-23 11:09:04', '3', '', '30726.75590199331', '25109.3599172565', '7', '2012-07-23 11:09:04', '5');
INSERT INTO `t_gps_data` VALUES ('3726719', '2012-07-23 11:09:04', '2', '', '35224.08622346806', '10901.53458492743', '1', '2012-07-23 11:09:04', '6');
INSERT INTO `t_gps_data` VALUES ('3726720', '2012-07-23 11:09:04', '1', '', '35952.69979267884', '10149.813505394788', '17', '2012-07-23 11:09:04', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726721', '2012-07-23 11:09:04', '1', '', '39654.445856800296', '35748.72138755359', '5', '2012-07-23 11:09:04', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726722', '2012-07-23 11:09:04', '0', '', '29444.782999807918', '32848.10045868387', '46', '2012-07-23 11:09:04', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726723', '2012-07-23 11:09:04', '3', '', '30317.166284103387', '14884.571624294846', '29', '2012-07-23 11:09:04', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726724', '2012-07-23 11:09:04', '3', '', '41961.20271608848', '22203.415643163207', '7', '2012-07-23 11:09:04', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726725', '2012-07-23 11:09:04', '1', '', '32406.77005353167', '37157.44154358791', '49', '2012-07-23 11:09:04', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726726', '2012-07-23 11:09:04', '1', '', '35529.37173705568', '21239.097412366187', '53', '2012-07-23 11:09:04', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726727', '2012-07-23 11:09:04', '3', '', '39012.338905942255', '17329.694277166982', '30', '2012-07-23 11:09:04', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726728', '2012-07-23 11:09:04', '2', '', '28818.526448081728', '36901.66102641564', '10', '2012-07-23 11:09:04', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726729', '2012-07-23 11:09:04', '2', '', '40479.33041730829', '34549.55115581526', '18', '2012-07-23 11:09:04', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726730', '2012-07-23 11:09:04', '2', '', '41773.80779861236', '28237.690665125905', '44', '2012-07-23 11:09:04', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726731', '2012-07-23 11:09:04', '0', '', '33396.03455184894', '38830.450240214355', '43', '2012-07-23 11:09:04', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726732', '2012-07-23 11:09:04', '1', '', '40008.627006218834', '18292.828391766605', '24', '2012-07-23 11:09:04', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726733', '2012-07-23 11:09:04', '0', '', '41890.22370842336', '22080.67943401932', '21', '2012-07-23 11:09:04', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726734', '2012-07-23 11:09:14', '1', '', '29745.193376319436', '22777.46702909758', '28', '2012-07-23 11:09:14', '2');
INSERT INTO `t_gps_data` VALUES ('3726735', '2012-07-23 11:09:14', '0', '', '36443.327085727804', '11681.780308212048', '18', '2012-07-23 11:09:14', '1');
INSERT INTO `t_gps_data` VALUES ('3726736', '2012-07-23 11:09:14', '1', '', '41712.4642766002', '16566.90886240585', '16', '2012-07-23 11:09:14', '4');
INSERT INTO `t_gps_data` VALUES ('3726737', '2012-07-23 11:09:14', '3', '', '29012.863906562106', '30112.582896778487', '89', '2012-07-23 11:09:14', '3');
INSERT INTO `t_gps_data` VALUES ('3726738', '2012-07-23 11:09:14', '3', '', '30676.480710694792', '25083.712474168544', '7', '2012-07-23 11:09:14', '5');
INSERT INTO `t_gps_data` VALUES ('3726739', '2012-07-23 11:09:14', '2', '', '35282.45211137514', '10909.656194331888', '1', '2012-07-23 11:09:14', '6');
INSERT INTO `t_gps_data` VALUES ('3726740', '2012-07-23 11:09:14', '1', '', '35982.59135272721', '10197.3681642918', '17', '2012-07-23 11:09:14', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726741', '2012-07-23 11:09:14', '1', '', '39662.94301362978', '35779.50651486665', '5', '2012-07-23 11:09:14', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726742', '2012-07-23 11:09:14', '0', '', '29444.010281808685', '32759.50046116968', '46', '2012-07-23 11:09:14', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726743', '2012-07-23 11:09:14', '3', '', '30236.22484298078', '14875.649667070898', '29', '2012-07-23 11:09:14', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726744', '2012-07-23 11:09:14', '3', '', '41925.97532873311', '22180.64055497576', '7', '2012-07-23 11:09:14', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726745', '2012-07-23 11:09:14', '1', '', '32409.894903823835', '37224.54779356479', '49', '2012-07-23 11:09:14', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726746', '2012-07-23 11:09:14', '1', '', '35555.74675735498', '21331.60331929102', '53', '2012-07-23 11:09:14', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726747', '2012-07-23 11:09:14', '3', '', '38966.13305685012', '17309.25372511517', '30', '2012-07-23 11:09:14', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726748', '2012-07-23 11:09:14', '2', '', '28865.560534918066', '36913.06904225689', '10', '2012-07-23 11:09:14', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726749', '2012-07-23 11:09:14', '2', '', '40569.97284010779', '34577.152000588845', '18', '2012-07-23 11:09:14', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726750', '2012-07-23 11:09:14', '2', '', '41843.87590269918', '28264.116920210574', '44', '2012-07-23 11:09:14', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726751', '2012-07-23 11:09:14', '0', '', '33367.57905277828', '38736.020124480085', '43', '2012-07-23 11:09:14', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726752', '2012-07-23 11:09:14', '1', '', '40015.686758861724', '18328.78730500232', '24', '2012-07-23 11:09:14', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726753', '2012-07-23 11:09:14', '0', '', '41867.6023237538', '22043.079285332475', '21', '2012-07-23 11:09:14', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726754', '2012-07-23 11:09:24', '1', '', '29747.566488851568', '22869.02071678596', '28', '2012-07-23 11:09:24', '2');
INSERT INTO `t_gps_data` VALUES ('3726755', '2012-07-23 11:09:24', '0', '', '36431.611347015336', '11618.546411692114', '18', '2012-07-23 11:09:24', '1');
INSERT INTO `t_gps_data` VALUES ('3726756', '2012-07-23 11:09:24', '1', '', '41718.43851917558', '16646.35081160909', '16', '2012-07-23 11:09:24', '4');
INSERT INTO `t_gps_data` VALUES ('3726757', '2012-07-23 11:09:24', '3', '', '28970.381449301465', '30107.819364094503', '89', '2012-07-23 11:09:24', '3');
INSERT INTO `t_gps_data` VALUES ('3726758', '2012-07-23 11:09:24', '3', '', '30640.536444648187', '25066.085507830267', '7', '2012-07-23 11:09:24', '5');
INSERT INTO `t_gps_data` VALUES ('3726759', '2012-07-23 11:09:24', '2', '', '35327.45571974069', '10911.85623660074', '1', '2012-07-23 11:09:24', '6');
INSERT INTO `t_gps_data` VALUES ('3726760', '2012-07-23 11:09:24', '1', '', '36007.88003842408', '10229.913868863403', '17', '2012-07-23 11:09:24', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726761', '2012-07-23 11:09:24', '1', '', '39665.24982679363', '35847.83371032138', '5', '2012-07-23 11:09:24', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726762', '2012-07-23 11:09:24', '0', '', '29438.35804630738', '32728.81852734444', '46', '2012-07-23 11:09:24', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726763', '2012-07-23 11:09:24', '3', '', '30185.778909756707', '14871.96901594424', '29', '2012-07-23 11:09:24', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726764', '2012-07-23 11:09:24', '3', '', '41833.04922384738', '22167.70584874022', '7', '2012-07-23 11:09:24', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726765', '2012-07-23 11:09:24', '1', '', '32421.040257888384', '37295.10459153948', '49', '2012-07-23 11:09:24', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726766', '2012-07-23 11:09:24', '1', '', '35570.11620031476', '21402.11589393302', '53', '2012-07-23 11:09:24', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726767', '2012-07-23 11:09:24', '3', '', '38927.55163621129', '17289.3398450519', '30', '2012-07-23 11:09:24', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726768', '2012-07-23 11:09:24', '2', '', '28895.916700091424', '36918.51285372544', '10', '2012-07-23 11:09:24', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726769', '2012-07-23 11:09:24', '2', '', '40649.163762029326', '34582.43523674755', '18', '2012-07-23 11:09:24', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726770', '2012-07-23 11:09:24', '2', '', '41921.34097554325', '28285.64441231061', '44', '2012-07-23 11:09:24', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726771', '2012-07-23 11:09:24', '0', '', '33337.67638640245', '38642.91519759561', '43', '2012-07-23 11:09:24', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726772', '2012-07-23 11:09:24', '1', '', '40037.31700788938', '18421.720049666583', '24', '2012-07-23 11:09:24', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726773', '2012-07-23 11:09:24', '0', '', '41857.88825310888', '22009.27539445955', '21', '2012-07-23 11:09:24', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726774', '2012-07-23 11:09:34', '1', '', '29770.21112134375', '22960.658574876208', '28', '2012-07-23 11:09:34', '2');
INSERT INTO `t_gps_data` VALUES ('3726775', '2012-07-23 11:09:34', '0', '', '36414.325879279386', '11542.800801382222', '18', '2012-07-23 11:09:34', '1');
INSERT INTO `t_gps_data` VALUES ('3726776', '2012-07-23 11:09:34', '1', '', '41734.42836822443', '16736.621977370385', '16', '2012-07-23 11:09:34', '4');
INSERT INTO `t_gps_data` VALUES ('3726777', '2012-07-23 11:09:34', '3', '', '28938.931379608195', '30079.21526264484', '89', '2012-07-23 11:09:34', '3');
INSERT INTO `t_gps_data` VALUES ('3726778', '2012-07-23 11:09:34', '3', '', '30559.76896179948', '25065.109829349298', '7', '2012-07-23 11:09:34', '5');
INSERT INTO `t_gps_data` VALUES ('3726779', '2012-07-23 11:09:34', '2', '', '35402.140154440196', '10923.286999404358', '1', '2012-07-23 11:09:34', '6');
INSERT INTO `t_gps_data` VALUES ('3726780', '2012-07-23 11:09:34', '1', '', '36012.79016476412', '10267.627077160138', '17', '2012-07-23 11:09:34', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726781', '2012-07-23 11:09:34', '1', '', '39693.141664871866', '35941.46303964692', '5', '2012-07-23 11:09:34', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726782', '2012-07-23 11:09:34', '0', '', '29420.518321151187', '32656.02586275773', '46', '2012-07-23 11:09:34', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726783', '2012-07-23 11:09:34', '3', '', '30119.645776899233', '14852.690409491845', '29', '2012-07-23 11:09:34', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726784', '2012-07-23 11:09:34', '3', '', '41790.499000591204', '22151.680601987136', '7', '2012-07-23 11:09:34', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726785', '2012-07-23 11:09:34', '1', '', '32424.708676304715', '37339.20746002807', '49', '2012-07-23 11:09:34', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726786', '2012-07-23 11:09:34', '1', '', '35590.50696716849', '21493.81394634714', '53', '2012-07-23 11:09:34', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726787', '2012-07-23 11:09:34', '3', '', '38846.78961652565', '17262.318172635794', '30', '2012-07-23 11:09:34', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726788', '2012-07-23 11:09:34', '2', '', '28962.216658892215', '36942.266557431925', '10', '2012-07-23 11:09:34', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726789', '2012-07-23 11:09:34', '2', '', '40698.80538868916', '34600.009072138935', '18', '2012-07-23 11:09:34', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726790', '2012-07-23 11:09:34', '2', '', '42018.24143211027', '28301.623165097793', '44', '2012-07-23 11:09:34', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726791', '2012-07-23 11:09:34', '0', '', '33313.595309287266', '38575.896246540935', '43', '2012-07-23 11:09:34', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726792', '2012-07-23 11:09:34', '1', '', '40044.319670231365', '18488.497869467523', '24', '2012-07-23 11:09:34', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726793', '2012-07-23 11:09:34', '0', '', '41842.212088893124', '21926.299396047012', '21', '2012-07-23 11:09:34', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726794', '2012-07-23 11:09:44', '1', '', '29778.54490272611', '22998.258597951284', '28', '2012-07-23 11:09:44', '2');
INSERT INTO `t_gps_data` VALUES ('3726795', '2012-07-23 11:09:44', '0', '', '36395.79777266388', '11470.913151779114', '18', '2012-07-23 11:09:44', '1');
INSERT INTO `t_gps_data` VALUES ('3726796', '2012-07-23 11:09:44', '1', '', '41761.4437988481', '16785.505684648786', '16', '2012-07-23 11:09:44', '4');
INSERT INTO `t_gps_data` VALUES ('3726797', '2012-07-23 11:09:44', '3', '', '28893.535320922292', '30057.6206541708', '89', '2012-07-23 11:09:44', '3');
INSERT INTO `t_gps_data` VALUES ('3726798', '2012-07-23 11:09:44', '3', '', '30517.474040260102', '25045.822211607818', '7', '2012-07-23 11:09:44', '5');
INSERT INTO `t_gps_data` VALUES ('3726799', '2012-07-23 11:09:44', '2', '', '35445.88304726276', '10946.074183176457', '1', '2012-07-23 11:09:44', '6');
INSERT INTO `t_gps_data` VALUES ('3726800', '2012-07-23 11:09:44', '1', '', '36036.20418138923', '10305.322758832059', '17', '2012-07-23 11:09:44', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726801', '2012-07-23 11:09:44', '1', '', '39719.73499335936', '35983.36511106813', '5', '2012-07-23 11:09:44', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726802', '2012-07-23 11:09:44', '0', '', '29402.220744204013', '32587.76794164177', '46', '2012-07-23 11:09:44', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726803', '2012-07-23 11:09:44', '3', '', '30026.594608857526', '14834.43680883841', '29', '2012-07-23 11:09:44', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726804', '2012-07-23 11:09:44', '3', '', '41757.12789141139', '22140.420997084624', '7', '2012-07-23 11:09:44', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726805', '2012-07-23 11:09:44', '1', '', '32437.747399643864', '37436.88126333766', '49', '2012-07-23 11:09:44', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726806', '2012-07-23 11:09:44', '1', '', '35613.06449419301', '21534.59192640735', '53', '2012-07-23 11:09:44', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726807', '2012-07-23 11:09:44', '3', '', '38807.75897622799', '17260.209105791346', '30', '2012-07-23 11:09:44', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726808', '2012-07-23 11:09:44', '2', '', '29053.495679063097', '36967.67906133614', '10', '2012-07-23 11:09:44', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726809', '2012-07-23 11:09:44', '2', '', '40761.65030397727', '34610.14589179573', '18', '2012-07-23 11:09:44', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726810', '2012-07-23 11:09:44', '2', '', '42068.943651764035', '28325.908067218625', '44', '2012-07-23 11:09:44', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726811', '2012-07-23 11:09:44', '0', '', '33289.95525957304', '38499.33898774518', '43', '2012-07-23 11:09:44', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726812', '2012-07-23 11:09:44', '1', '', '40072.483785163895', '18562.662651238097', '24', '2012-07-23 11:09:44', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726813', '2012-07-23 11:09:44', '0', '', '41831.52692335997', '21877.579959937564', '21', '2012-07-23 11:09:44', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726814', '2012-07-23 11:09:54', '1', '', '29805.62739759301', '23028.4822927209', '28', '2012-07-23 11:09:54', '2');
INSERT INTO `t_gps_data` VALUES ('3726815', '2012-07-23 11:09:54', '0', '', '36377.43026833663', '11428.589127122328', '18', '2012-07-23 11:09:54', '1');
INSERT INTO `t_gps_data` VALUES ('3726816', '2012-07-23 11:09:54', '1', '', '41782.529223482066', '16836.459979369058', '16', '2012-07-23 11:09:54', '4');
INSERT INTO `t_gps_data` VALUES ('3726817', '2012-07-23 11:09:54', '2', '', '28819.447146590526', '30053.042749083204', '89', '2012-07-23 11:09:54', '3');
INSERT INTO `t_gps_data` VALUES ('3726818', '2012-07-23 11:09:54', '3', '', '30428.93368668946', '25031.510464751886', '7', '2012-07-23 11:09:54', '5');
INSERT INTO `t_gps_data` VALUES ('3726819', '2012-07-23 11:09:54', '2', '', '35482.733704674196', '10957.93010524803', '1', '2012-07-23 11:09:54', '6');
INSERT INTO `t_gps_data` VALUES ('3726820', '2012-07-23 11:09:54', '1', '', '36054.820726366655', '10403.812255111237', '17', '2012-07-23 11:09:54', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726821', '2012-07-23 11:09:54', '1', '', '39739.90103110655', '36025.38905445965', '5', '2012-07-23 11:09:54', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726822', '2012-07-23 11:09:54', '0', '', '29374.623750139708', '32556.79381983842', '46', '2012-07-23 11:09:54', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726823', '2012-07-23 11:09:54', '3', '', '29930.645160419088', '14804.721851287886', '29', '2012-07-23 11:09:54', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726824', '2012-07-23 11:09:54', '3', '', '41693.41452855121', '22124.068304001936', '7', '2012-07-23 11:09:54', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726825', '2012-07-23 11:09:54', '1', '', '32460.583312222283', '37527.92456425311', '49', '2012-07-23 11:09:54', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726826', '2012-07-23 11:09:54', '1', '', '35623.573696259766', '21597.647259186568', '53', '2012-07-23 11:09:54', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726827', '2012-07-23 11:09:54', '3', '', '38735.67413484486', '17231.860006890314', '30', '2012-07-23 11:09:54', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726828', '2012-07-23 11:09:54', '2', '', '29113.594100277485', '36973.95155052914', '10', '2012-07-23 11:09:54', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726829', '2012-07-23 11:09:54', '2', '', '40805.906227220505', '34634.224092684126', '18', '2012-07-23 11:09:54', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726830', '2012-07-23 11:09:54', '2', '', '42122.09645561374', '28347.041871603647', '44', '2012-07-23 11:09:54', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726831', '2012-07-23 11:09:54', '0', '', '33266.20400821613', '38444.20042398773', '43', '2012-07-23 11:09:54', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726832', '2012-07-23 11:09:54', '1', '', '40085.51336763126', '18613.638214735136', '24', '2012-07-23 11:09:54', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726833', '2012-07-23 11:09:54', '0', '', '41824.19213401248', '21822.596049758205', '21', '2012-07-23 11:09:54', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726834', '2012-07-23 11:10:04', '1', '', '29810.48612732586', '23094.932787083835', '28', '2012-07-23 11:10:04', '2');
INSERT INTO `t_gps_data` VALUES ('3726835', '2012-07-23 11:10:04', '0', '', '36374.466439586206', '11388.711141608663', '18', '2012-07-23 11:10:04', '1');
INSERT INTO `t_gps_data` VALUES ('3726836', '2012-07-23 11:10:04', '1', '', '41789.08687904269', '16872.619936393778', '16', '2012-07-23 11:10:04', '4');
INSERT INTO `t_gps_data` VALUES ('3726837', '2012-07-23 11:10:04', '2', '', '28912.934582483802', '30066.261381710083', '89', '2012-07-23 11:10:04', '3');
INSERT INTO `t_gps_data` VALUES ('3726838', '2012-07-23 11:10:04', '3', '', '30384.974857904228', '25026.298369495886', '7', '2012-07-23 11:10:04', '5');
INSERT INTO `t_gps_data` VALUES ('3726839', '2012-07-23 11:10:04', '2', '', '35533.53173404106', '10973.443217563747', '1', '2012-07-23 11:10:04', '6');
INSERT INTO `t_gps_data` VALUES ('3726840', '2012-07-23 11:10:04', '1', '', '36072.55982924322', '10452.295448146593', '17', '2012-07-23 11:10:04', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726841', '2012-07-23 11:10:04', '1', '', '39764.06141810967', '36077.91607392661', '5', '2012-07-23 11:10:04', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726842', '2012-07-23 11:10:04', '0', '', '29367.03815421558', '32494.40697212694', '46', '2012-07-23 11:10:04', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726843', '2012-07-23 11:10:04', '3', '', '29836.59892285689', '14783.366986770194', '29', '2012-07-23 11:10:04', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726844', '2012-07-23 11:10:04', '3', '', '41636.051692740344', '22107.566884301305', '7', '2012-07-23 11:10:04', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726845', '2012-07-23 11:10:04', '1', '', '32463.82468505441', '37571.87907479568', '49', '2012-07-23 11:10:04', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726846', '2012-07-23 11:10:04', '1', '', '35624.47743112283', '21636.313616206924', '53', '2012-07-23 11:10:04', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726847', '2012-07-23 11:10:04', '3', '', '38692.175102682304', '17226.716310756037', '30', '2012-07-23 11:10:04', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726848', '2012-07-23 11:10:04', '2', '', '29151.787939055863', '36988.75253445864', '10', '2012-07-23 11:10:04', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726849', '2012-07-23 11:10:05', '2', '', '40895.245328183606', '34648.536043481356', '18', '2012-07-23 11:10:05', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726850', '2012-07-23 11:10:05', '2', '', '42194.33001752376', '28357.534644254076', '44', '2012-07-23 11:10:05', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726851', '2012-07-23 11:10:05', '0', '', '33252.72441709189', '38383.95217425569', '43', '2012-07-23 11:10:05', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726852', '2012-07-23 11:10:05', '1', '', '40085.87852557087', '18675.162388606826', '24', '2012-07-23 11:10:05', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726853', '2012-07-23 11:10:05', '0', '', '41816.02270194291', '21791.79625137546', '21', '2012-07-23 11:10:05', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726854', '2012-07-23 11:10:15', '1', '', '29832.232243375947', '23190.45440022365', '28', '2012-07-23 11:10:15', '2');
INSERT INTO `t_gps_data` VALUES ('3726855', '2012-07-23 11:10:15', '0', '', '36364.59916601735', '11292.162513013107', '18', '2012-07-23 11:10:15', '1');
INSERT INTO `t_gps_data` VALUES ('3726856', '2012-07-23 11:10:15', '1', '', '41801.02894124773', '16940.71150384915', '16', '2012-07-23 11:10:15', '4');
INSERT INTO `t_gps_data` VALUES ('3726857', '2012-07-23 11:10:15', '2', '', '29010.95299281297', '30068.44702634137', '89', '2012-07-23 11:10:15', '3');
INSERT INTO `t_gps_data` VALUES ('3726858', '2012-07-23 11:10:15', '3', '', '30293.70439716043', '25014.50160779155', '7', '2012-07-23 11:10:15', '5');
INSERT INTO `t_gps_data` VALUES ('3726859', '2012-07-23 11:10:15', '2', '', '35569.85973573246', '10974.658294083678', '1', '2012-07-23 11:10:15', '6');
INSERT INTO `t_gps_data` VALUES ('3726860', '2012-07-23 11:10:15', '1', '', '36094.84004303866', '10542.19899503078', '17', '2012-07-23 11:10:15', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726861', '2012-07-23 11:10:15', '1', '', '39789.50021446471', '36162.53114927155', '5', '2012-07-23 11:10:15', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726862', '2012-07-23 11:10:15', '0', '', '29355.907609466867', '32427.046077417825', '46', '2012-07-23 11:10:15', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726863', '2012-07-23 11:10:15', '3', '', '29744.645927175054', '14768.273944687136', '29', '2012-07-23 11:10:15', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726864', '2012-07-23 11:10:15', '3', '', '41596.19345037508', '22084.313388536117', '7', '2012-07-23 11:10:15', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726865', '2012-07-23 11:10:15', '1', '', '32463.989728537796', '37658.20773317772', '49', '2012-07-23 11:10:15', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726866', '2012-07-23 11:10:15', '1', '', '35646.974321785034', '21736.23252098945', '53', '2012-07-23 11:10:15', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726867', '2012-07-23 11:10:15', '3', '', '38653.70272695', '17208.009949064282', '30', '2012-07-23 11:10:15', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726868', '2012-07-23 11:10:15', '2', '', '29199.70175986', '37005.14535360377', '10', '2012-07-23 11:10:15', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726869', '2012-07-23 11:10:15', '2', '', '40943.72299084762', '34670.183418156565', '18', '2012-07-23 11:10:15', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726870', '2012-07-23 11:10:15', '2', '', '42292.68526604396', '28360.452883594036', '44', '2012-07-23 11:10:15', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726871', '2012-07-23 11:10:15', '0', '', '33226.08678522573', '38321.30093829609', '43', '2012-07-23 11:10:15', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726872', '2012-07-23 11:10:15', '1', '', '40114.2831189624', '18769.879389155492', '24', '2012-07-23 11:10:15', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726873', '2012-07-23 11:10:15', '0', '', '41801.77354676084', '21745.414718356504', '21', '2012-07-23 11:10:15', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726874', '2012-07-23 11:10:25', '1', '', '29856.43213606324', '23248.98850822397', '28', '2012-07-23 11:10:25', '2');
INSERT INTO `t_gps_data` VALUES ('3726875', '2012-07-23 11:10:25', '0', '', '36363.512382604094', '11258.459794321694', '18', '2012-07-23 11:10:25', '1');
INSERT INTO `t_gps_data` VALUES ('3726876', '2012-07-23 11:10:25', '1', '', '41820.58660274234', '17006.74997834519', '16', '2012-07-23 11:10:25', '4');
INSERT INTO `t_gps_data` VALUES ('3726877', '2012-07-23 11:10:25', '2', '', '29076.798713614455', '30071.634075679358', '89', '2012-07-23 11:10:25', '3');
INSERT INTO `t_gps_data` VALUES ('3726878', '2012-07-23 11:10:25', '3', '', '30256.34788891242', '24986.65504887774', '7', '2012-07-23 11:10:25', '5');
INSERT INTO `t_gps_data` VALUES ('3726879', '2012-07-23 11:10:25', '2', '', '35664.753387764926', '10977.95003733036', '1', '2012-07-23 11:10:25', '6');
INSERT INTO `t_gps_data` VALUES ('3726880', '2012-07-23 11:10:25', '1', '', '36095.93327483186', '10578.507416120889', '17', '2012-07-23 11:10:25', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726881', '2012-07-23 11:10:25', '1', '', '39816.768139573316', '36237.60215083318', '5', '2012-07-23 11:10:25', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726882', '2012-07-23 11:10:25', '0', '', '29327.39686384945', '32382.157346682132', '46', '2012-07-23 11:10:25', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726883', '2012-07-23 11:10:25', '3', '', '29711.79470681961', '14761.938851760477', '29', '2012-07-23 11:10:25', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726884', '2012-07-23 11:10:25', '3', '', '41531.12626434212', '22073.83060786591', '7', '2012-07-23 11:10:25', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726885', '2012-07-23 11:10:25', '1', '', '32473.429135353897', '37729.96871019764', '49', '2012-07-23 11:10:25', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726886', '2012-07-23 11:10:25', '1', '', '35660.54440747464', '21801.258287131735', '53', '2012-07-23 11:10:25', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726887', '2012-07-23 11:10:25', '3', '', '38554.717499673614', '17190.15084526703', '30', '2012-07-23 11:10:25', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726888', '2012-07-23 11:10:25', '2', '', '29296.6991077746', '37015.29118758687', '10', '2012-07-23 11:10:25', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726889', '2012-07-23 11:10:25', '2', '', '41011.847304829345', '34674.688717270714', '18', '2012-07-23 11:10:25', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726890', '2012-07-23 11:10:25', '2', '', '42344.42265621896', '28389.02334017237', '44', '2012-07-23 11:10:25', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726891', '2012-07-23 11:10:25', '0', '', '33210.04374925756', '38291.14068194261', '43', '2012-07-23 11:10:25', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726892', '2012-07-23 11:10:25', '1', '', '40138.72480514685', '18841.657015423232', '24', '2012-07-23 11:10:25', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726893', '2012-07-23 11:10:25', '0', '', '41799.697344505286', '21662.750960746616', '21', '2012-07-23 11:10:25', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726894', '2012-07-23 11:10:35', '1', '', '29875.76420923755', '23328.76880630511', '28', '2012-07-23 11:10:35', '2');
INSERT INTO `t_gps_data` VALUES ('3726895', '2012-07-23 11:10:35', '0', '', '36346.49344451638', '11182.456856776595', '18', '2012-07-23 11:10:35', '1');
INSERT INTO `t_gps_data` VALUES ('3726896', '2012-07-23 11:10:35', '1', '', '41847.017527732874', '17065.903635108974', '16', '2012-07-23 11:10:35', '4');
INSERT INTO `t_gps_data` VALUES ('3726897', '2012-07-23 11:10:35', '2', '', '29107.488446584186', '30099.52734883554', '89', '2012-07-23 11:10:35', '3');
INSERT INTO `t_gps_data` VALUES ('3726898', '2012-07-23 11:10:35', '3', '', '30163.337492163395', '24967.680538586657', '7', '2012-07-23 11:10:35', '5');
INSERT INTO `t_gps_data` VALUES ('3726899', '2012-07-23 11:10:35', '2', '', '35712.7694732902', '10992.339087307573', '1', '2012-07-23 11:10:35', '6');
INSERT INTO `t_gps_data` VALUES ('3726900', '2012-07-23 11:10:35', '1', '', '36099.36362493631', '10649.295137573568', '17', '2012-07-23 11:10:35', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726901', '2012-07-23 11:10:35', '1', '', '39835.35202743494', '36292.539437697145', '5', '2012-07-23 11:10:35', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726902', '2012-07-23 11:10:35', '0', '', '29303.46229738986', '32300.750203196683', '46', '2012-07-23 11:10:35', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726903', '2012-07-23 11:10:35', '3', '', '29657.406921098616', '14757.325005509298', '29', '2012-07-23 11:10:35', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726904', '2012-07-23 11:10:35', '3', '', '41450.35168364784', '22069.14147771377', '7', '2012-07-23 11:10:35', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726905', '2012-07-23 11:10:35', '1', '', '32499.79944905581', '37819.30668801345', '49', '2012-07-23 11:10:35', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726906', '2012-07-23 11:10:35', '1', '', '35672.26130723129', '21845.67576748955', '53', '2012-07-23 11:10:35', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726907', '2012-07-23 11:10:35', '3', '', '38491.60679817177', '17162.842839705434', '30', '2012-07-23 11:10:35', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726908', '2012-07-23 11:10:35', '2', '', '29368.858195076322', '37027.53286730605', '10', '2012-07-23 11:10:35', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726909', '2012-07-23 11:10:35', '2', '', '41096.890579341714', '34680.59773204475', '18', '2012-07-23 11:10:35', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726910', '2012-07-23 11:10:35', '2', '', '42380.17456656673', '28416.527050622626', '44', '2012-07-23 11:10:35', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726911', '2012-07-23 11:10:35', '0', '', '33182.01123554332', '38204.6792270174', '43', '2012-07-23 11:10:35', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726912', '2012-07-23 11:10:35', '1', '', '40167.26106384754', '18905.922032477378', '24', '2012-07-23 11:10:35', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726913', '2012-07-23 11:10:35', '0', '', '41776.8103404099', '21571.91619501581', '21', '2012-07-23 11:10:35', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726914', '2012-07-23 11:10:45', '1', '', '29901.78391244348', '23381.54444234082', '28', '2012-07-23 11:10:45', '2');
INSERT INTO `t_gps_data` VALUES ('3726915', '2012-07-23 11:10:45', '0', '', '36326.43843188402', '11151.892560795302', '18', '2012-07-23 11:10:45', '1');
INSERT INTO `t_gps_data` VALUES ('3726916', '2012-07-23 11:10:45', '1', '', '41874.308802307896', '17107.310646076214', '16', '2012-07-23 11:10:45', '4');
INSERT INTO `t_gps_data` VALUES ('3726917', '2012-07-23 11:10:45', '2', '', '29145.19831946921', '30110.810089728242', '89', '2012-07-23 11:10:45', '3');
INSERT INTO `t_gps_data` VALUES ('3726918', '2012-07-23 11:10:45', '3', '', '30099.117441159517', '24941.97186041406', '7', '2012-07-23 11:10:45', '5');
INSERT INTO `t_gps_data` VALUES ('3726919', '2012-07-23 11:10:45', '2', '', '35800.88592844596', '11002.668613458807', '1', '2012-07-23 11:10:45', '6');
INSERT INTO `t_gps_data` VALUES ('3726920', '2012-07-23 11:10:45', '1', '', '36107.45079937056', '10717.24425852088', '17', '2012-07-23 11:10:45', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726921', '2012-07-23 11:10:45', '1', '', '39853.117911925205', '36376.43990328885', '5', '2012-07-23 11:10:45', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726922', '2012-07-23 11:10:45', '0', '', '29297.209537534967', '32233.190927243784', '46', '2012-07-23 11:10:45', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726923', '2012-07-23 11:10:45', '3', '', '29604.472007447854', '14747.235196046953', '29', '2012-07-23 11:10:45', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726924', '2012-07-23 11:10:45', '3', '', '41418.58795945449', '22068.665853554845', '7', '2012-07-23 11:10:45', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726925', '2012-07-23 11:10:45', '1', '', '32523.02375545282', '37878.027469694025', '49', '2012-07-23 11:10:45', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726926', '2012-07-23 11:10:45', '1', '', '35680.01211119291', '21918.150628766973', '53', '2012-07-23 11:10:45', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726927', '2012-07-23 11:10:45', '3', '', '38458.42179807474', '17162.35164130891', '30', '2012-07-23 11:10:45', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726928', '2012-07-23 11:10:45', '2', '', '29436.63677571356', '37044.950453051824', '10', '2012-07-23 11:10:45', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726929', '2012-07-23 11:10:45', '2', '', '41127.15545684199', '34708.48200782218', '18', '2012-07-23 11:10:45', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726930', '2012-07-23 11:10:45', '2', '', '42456.20887127378', '28441.187342681093', '44', '2012-07-23 11:10:45', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726931', '2012-07-23 11:10:45', '0', '', '33168.69581839528', '38118.90672187492', '43', '2012-07-23 11:10:45', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726932', '2012-07-23 11:10:45', '1', '', '40174.89717427569', '18967.0424258434', '24', '2012-07-23 11:10:45', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726933', '2012-07-23 11:10:45', '0', '', '41760.78191603095', '21484.731062507686', '21', '2012-07-23 11:10:45', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726934', '2012-07-23 11:10:55', '1', '', '29904.637940322562', '23438.657706476373', '28', '2012-07-23 11:10:55', '2');
INSERT INTO `t_gps_data` VALUES ('3726935', '2012-07-23 11:10:55', '0', '', '36314.21834193225', '11081.398663072663', '18', '2012-07-23 11:10:55', '1');
INSERT INTO `t_gps_data` VALUES ('3726936', '2012-07-23 11:10:55', '1', '', '41884.82248404666', '17206.808926260153', '16', '2012-07-23 11:10:55', '4');
INSERT INTO `t_gps_data` VALUES ('3726937', '2012-07-23 11:10:55', '2', '', '29212.88224954332', '30116.363253867476', '89', '2012-07-23 11:10:55', '3');
INSERT INTO `t_gps_data` VALUES ('3726938', '2012-07-23 11:10:55', '3', '', '30029.93346502348', '24924.331272186704', '7', '2012-07-23 11:10:55', '5');
INSERT INTO `t_gps_data` VALUES ('3726939', '2012-07-23 11:10:55', '2', '', '35853.68168507583', '11010.088380181021', '1', '2012-07-23 11:10:55', '6');
INSERT INTO `t_gps_data` VALUES ('3726940', '2012-07-23 11:10:55', '1', '', '36130.900505820246', '10781.7494118891', '17', '2012-07-23 11:10:55', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726941', '2012-07-23 11:10:55', '1', '', '39866.886192013044', '36471.22153354456', '5', '2012-07-23 11:10:55', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726942', '2012-07-23 11:10:55', '0', '', '29291.202624305744', '32137.266659323806', '46', '2012-07-23 11:10:55', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726943', '2012-07-23 11:10:55', '3', '', '29566.513527851508', '14743.733461960419', '29', '2012-07-23 11:10:55', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726944', '2012-07-23 11:10:55', '3', '', '41384.21398143401', '22049.50625789691', '7', '2012-07-23 11:10:55', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726945', '2012-07-23 11:10:55', '1', '', '32547.01545487381', '37968.70586739417', '49', '2012-07-23 11:10:55', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726946', '2012-07-23 11:10:55', '1', '', '35694.02550978318', '21975.818301604555', '53', '2012-07-23 11:10:55', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726947', '2012-07-23 11:10:55', '3', '', '38412.6088793082', '17140.966510118986', '30', '2012-07-23 11:10:55', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726948', '2012-07-23 11:10:55', '2', '', '29491.9350052464', '37063.70691975368', '10', '2012-07-23 11:10:55', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726949', '2012-07-23 11:10:55', '2', '', '41223.87820567484', '34721.17553245581', '18', '2012-07-23 11:10:55', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726950', '2012-07-23 11:10:55', '2', '', '42537.83642992329', '28467.217336769216', '44', '2012-07-23 11:10:55', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726951', '2012-07-23 11:10:55', '0', '', '33142.69559676401', '38033.81766635799', '43', '2012-07-23 11:10:55', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726952', '2012-07-23 11:10:55', '1', '', '40181.1069437337', '19046.459125546884', '24', '2012-07-23 11:10:55', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726953', '2012-07-23 11:10:55', '0', '', '41743.97612723401', '21440.13768859009', '21', '2012-07-23 11:10:55', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726954', '2012-07-23 11:11:05', '1', '', '29919.809195497095', '23476.336523992097', '28', '2012-07-23 11:11:05', '2');
INSERT INTO `t_gps_data` VALUES ('3726955', '2012-07-23 11:11:05', '0', '', '36305.22181585629', '11023.597752281723', '18', '2012-07-23 11:11:05', '1');
INSERT INTO `t_gps_data` VALUES ('3726956', '2012-07-23 11:11:05', '1', '', '41902.920018537574', '17299.24179170697', '16', '2012-07-23 11:11:05', '4');
INSERT INTO `t_gps_data` VALUES ('3726957', '2012-07-23 11:11:05', '2', '', '29277.66833464696', '30138.625096816613', '89', '2012-07-23 11:11:05', '3');
INSERT INTO `t_gps_data` VALUES ('3726958', '2012-07-23 11:11:05', '3', '', '29938.62313629917', '24895.664906891932', '7', '2012-07-23 11:11:05', '5');
INSERT INTO `t_gps_data` VALUES ('3726959', '2012-07-23 11:11:05', '2', '', '35920.82893281792', '11037.708294107697', '1', '2012-07-23 11:11:05', '6');
INSERT INTO `t_gps_data` VALUES ('3726960', '2012-07-23 11:11:05', '1', '', '36132.17582098748', '10823.871466555673', '17', '2012-07-23 11:11:05', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726961', '2012-07-23 11:11:05', '1', '', '39884.30034313393', '36565.40017175269', '5', '2012-07-23 11:11:05', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726962', '2012-07-23 11:11:05', '0', '', '29284.94497788572', '32102.51064475336', '46', '2012-07-23 11:11:05', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726963', '2012-07-23 11:11:05', '3', '', '29507.559183480567', '14715.343201107216', '29', '2012-07-23 11:11:05', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726964', '2012-07-23 11:11:05', '3', '', '41341.02007331122', '22038.907491228263', '7', '2012-07-23 11:11:05', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726965', '2012-07-23 11:11:05', '1', '', '32563.140209898764', '38052.62025183724', '49', '2012-07-23 11:11:05', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726966', '2012-07-23 11:11:05', '1', '', '35714.393963758026', '22035.60173247763', '53', '2012-07-23 11:11:05', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726967', '2012-07-23 11:11:05', '3', '', '38362.75912613842', '17115.472583027084', '30', '2012-07-23 11:11:05', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726968', '2012-07-23 11:11:05', '2', '', '29532.298321615195', '37085.79744743584', '10', '2012-07-23 11:11:05', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726969', '2012-07-23 11:11:05', '2', '', '41269.861709491735', '34732.87008400793', '18', '2012-07-23 11:11:05', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726970', '2012-07-23 11:11:05', '2', '', '42635.928783063784', '28489.978558161165', '44', '2012-07-23 11:11:05', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726971', '2012-07-23 11:11:05', '0', '', '33124.60464091907', '38001.94997295126', '43', '2012-07-23 11:11:05', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726972', '2012-07-23 11:11:05', '1', '', '40203.79917822543', '19109.18723229794', '24', '2012-07-23 11:11:05', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726973', '2012-07-23 11:11:05', '0', '', '41727.28226060426', '21357.071300679905', '21', '2012-07-23 11:11:05', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726974', '2012-07-23 11:11:24', '3', '', '30200.509588821114', '28881.071926959194', '16', '2012-07-23 11:11:24', '2');
INSERT INTO `t_gps_data` VALUES ('3726975', '2012-07-23 11:11:24', '2', '', '40237.14613467922', '13590.01208180451', '13', '2012-07-23 11:11:24', '1');
INSERT INTO `t_gps_data` VALUES ('3726976', '2012-07-23 11:11:24', '0', '', '35712.50089759269', '19682.04999281253', '9', '2012-07-23 11:11:24', '4');
INSERT INTO `t_gps_data` VALUES ('3726977', '2012-07-23 11:11:24', '1', '', '31640.798230697044', '26079.938097525206', '97', '2012-07-23 11:11:24', '3');
INSERT INTO `t_gps_data` VALUES ('3726978', '2012-07-23 11:11:24', '1', '', '39196.21652759517', '15772.189388964693', '9', '2012-07-23 11:11:24', '5');
INSERT INTO `t_gps_data` VALUES ('3726979', '2012-07-23 11:11:24', '1', '', '42177.921724209984', '17745.451276068157', '58', '2012-07-23 11:11:24', '6');
INSERT INTO `t_gps_data` VALUES ('3726980', '2012-07-23 11:11:24', '0', '', '39040.215669801815', '19207.825441327383', '46', '2012-07-23 11:11:24', '001190251');
INSERT INTO `t_gps_data` VALUES ('3726981', '2012-07-23 11:11:24', '1', '', '39709.94587977217', '31874.96207612352', '30', '2012-07-23 11:11:24', '001014182');
INSERT INTO `t_gps_data` VALUES ('3726982', '2012-07-23 11:11:24', '3', '', '40252.05132832488', '33618.14383356991', '94', '2012-07-23 11:11:24', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3726983', '2012-07-23 11:11:24', '0', '', '35164.56358738056', '31588.82125763617', '11', '2012-07-23 11:11:24', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3726984', '2012-07-23 11:11:24', '2', '', '32095.475034739033', '13126.30094846691', '60', '2012-07-23 11:11:24', '001001003');
INSERT INTO `t_gps_data` VALUES ('3726985', '2012-07-23 11:11:24', '1', '', '42767.2270705892', '17627.234522540886', '44', '2012-07-23 11:11:24', '001067110');
INSERT INTO `t_gps_data` VALUES ('3726986', '2012-07-23 11:11:24', '3', '', '37695.92044998471', '37513.53278859747', '48', '2012-07-23 11:11:24', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3726987', '2012-07-23 11:11:24', '0', '', '33523.032107242434', '20801.273489004903', '70', '2012-07-23 11:11:24', 'amk');
INSERT INTO `t_gps_data` VALUES ('3726988', '2012-07-23 11:11:24', '0', '', '29081.759115565703', '20260.89356890728', '61', '2012-07-23 11:11:24', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3726989', '2012-07-23 11:11:24', '3', '', '31828.88539947296', '17383.907061817747', '24', '2012-07-23 11:11:24', 'cck');
INSERT INTO `t_gps_data` VALUES ('3726990', '2012-07-23 11:11:24', '0', '', '36414.879587757336', '18959.605928146484', '39', '2012-07-23 11:11:24', 'clm');
INSERT INTO `t_gps_data` VALUES ('3726991', '2012-07-23 11:11:24', '0', '', '34779.49840737939', '14980.226616803913', '53', '2012-07-23 11:11:24', 'hou');
INSERT INTO `t_gps_data` VALUES ('3726992', '2012-07-23 11:11:24', '3', '', '39899.85291477548', '19082.788580524662', '85', '2012-07-23 11:11:24', 'jur');
INSERT INTO `t_gps_data` VALUES ('3726993', '2012-07-23 11:11:24', '1', '', '35881.42989111145', '12022.637783448385', '20', '2012-07-23 11:11:24', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3726994', '2012-07-23 11:11:43', '1', '', '40924.032465907425', '19591.472414442884', '38', '2012-07-23 11:11:43', '2');
INSERT INTO `t_gps_data` VALUES ('3726995', '2012-07-23 11:11:43', '0', '', '41440.879017218555', '36899.803460761505', '28', '2012-07-23 11:11:43', '1');
INSERT INTO `t_gps_data` VALUES ('3726996', '2012-07-23 11:11:43', '1', '', '38670.99843668245', '11336.623602214926', '99', '2012-07-23 11:11:43', '4');
INSERT INTO `t_gps_data` VALUES ('3726997', '2012-07-23 11:11:43', '3', '', '42641.87671149761', '38631.141251131034', '82', '2012-07-23 11:11:43', '3');
INSERT INTO `t_gps_data` VALUES ('3726998', '2012-07-23 11:11:43', '0', '', '37913.209211475834', '18492.912903341854', '73', '2012-07-23 11:11:43', '5');
INSERT INTO `t_gps_data` VALUES ('3726999', '2012-07-23 11:11:43', '2', '', '38480.567045915974', '17613.7106791833', '47', '2012-07-23 11:11:43', '6');
INSERT INTO `t_gps_data` VALUES ('3727000', '2012-07-23 11:11:43', '3', '', '39465.24171212925', '26394.446276341354', '15', '2012-07-23 11:11:43', '001190251');
INSERT INTO `t_gps_data` VALUES ('3727001', '2012-07-23 11:11:43', '0', '', '43318.19652233488', '17580.205360847453', '37', '2012-07-23 11:11:43', '001014182');
INSERT INTO `t_gps_data` VALUES ('3727002', '2012-07-23 11:11:43', '0', '', '36441.592752708115', '12975.377074758988', '28', '2012-07-23 11:11:43', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3727003', '2012-07-23 11:11:43', '1', '', '37425.63808069343', '24723.389733739183', '49', '2012-07-23 11:11:43', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3727004', '2012-07-23 11:11:43', '1', '', '38539.30256184392', '22701.82372854551', '90', '2012-07-23 11:11:43', '001001003');
INSERT INTO `t_gps_data` VALUES ('3727005', '2012-07-23 11:11:43', '1', '', '39336.07543048082', '22989.745211857444', '84', '2012-07-23 11:11:43', '001067110');
INSERT INTO `t_gps_data` VALUES ('3727006', '2012-07-23 11:11:43', '3', '', '33229.492670083535', '15698.261241992288', '55', '2012-07-23 11:11:43', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3727007', '2012-07-23 11:11:43', '0', '', '34460.20430635315', '21307.445537525513', '29', '2012-07-23 11:11:43', 'amk');
INSERT INTO `t_gps_data` VALUES ('3727008', '2012-07-23 11:11:43', '1', '', '33545.308565839994', '15262.955318445043', '59', '2012-07-23 11:11:43', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3727009', '2012-07-23 11:11:43', '2', '', '33803.91370125105', '30748.833471946375', '22', '2012-07-23 11:11:43', 'cck');
INSERT INTO `t_gps_data` VALUES ('3727010', '2012-07-23 11:11:43', '1', '', '33458.7104126749', '10661.301033861058', '12', '2012-07-23 11:11:43', 'clm');
INSERT INTO `t_gps_data` VALUES ('3727011', '2012-07-23 11:11:43', '1', '', '37452.65747755509', '12070.87785605538', '67', '2012-07-23 11:11:43', 'hou');
INSERT INTO `t_gps_data` VALUES ('3727012', '2012-07-23 11:11:43', '3', '', '43075.27146849723', '30555.1017288387', '60', '2012-07-23 11:11:43', 'jur');
INSERT INTO `t_gps_data` VALUES ('3727013', '2012-07-23 11:11:43', '2', '', '41710.108275959785', '34035.762842474236', '85', '2012-07-23 11:11:43', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3727014', '2012-07-23 11:11:53', '1', '', '40934.7239487311', '19679.455818817078', '38', '2012-07-23 11:11:53', '2');
INSERT INTO `t_gps_data` VALUES ('3727015', '2012-07-23 11:11:53', '0', '', '41418.26840685855', '36831.365291218295', '28', '2012-07-23 11:11:53', '1');
INSERT INTO `t_gps_data` VALUES ('3727016', '2012-07-23 11:11:53', '1', '', '38694.41009733545', '11375.215004932888', '99', '2012-07-23 11:11:53', '4');
INSERT INTO `t_gps_data` VALUES ('3727017', '2012-07-23 11:11:53', '3', '', '42606.96158429882', '38622.90683890928', '82', '2012-07-23 11:11:53', '3');
INSERT INTO `t_gps_data` VALUES ('3727018', '2012-07-23 11:11:53', '0', '', '37899.19313632029', '18420.991628212487', '73', '2012-07-23 11:11:53', '5');
INSERT INTO `t_gps_data` VALUES ('3727019', '2012-07-23 11:11:53', '2', '', '38521.81745269138', '17640.68650385838', '47', '2012-07-23 11:11:53', '6');
INSERT INTO `t_gps_data` VALUES ('3727020', '2012-07-23 11:11:53', '3', '', '39370.46165986856', '26393.857264511218', '15', '2012-07-23 11:11:53', '001190251');
INSERT INTO `t_gps_data` VALUES ('3727021', '2012-07-23 11:11:53', '0', '', '43289.21652568781', '17532.991099756295', '37', '2012-07-23 11:11:53', '001014182');
INSERT INTO `t_gps_data` VALUES ('3727022', '2012-07-23 11:11:53', '0', '', '36417.434932335775', '12882.992867435265', '28', '2012-07-23 11:11:53', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3727023', '2012-07-23 11:11:53', '1', '', '37445.007186895076', '24783.699986410807', '49', '2012-07-23 11:11:53', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3727024', '2012-07-23 11:11:53', '1', '', '38566.413416676194', '22751.13793745268', '90', '2012-07-23 11:11:53', '001001003');
INSERT INTO `t_gps_data` VALUES ('3727025', '2012-07-23 11:11:53', '1', '', '39349.9470368168', '23065.61101563037', '84', '2012-07-23 11:11:53', '001067110');
INSERT INTO `t_gps_data` VALUES ('3727026', '2012-07-23 11:11:53', '3', '', '33138.198304785736', '15681.32351284263', '55', '2012-07-23 11:11:53', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3727027', '2012-07-23 11:11:53', '0', '', '34436.01948963343', '21268.373129119296', '29', '2012-07-23 11:11:53', 'amk');
INSERT INTO `t_gps_data` VALUES ('3727028', '2012-07-23 11:11:53', '1', '', '33550.86207453866', '15324.000885366188', '59', '2012-07-23 11:11:53', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3727029', '2012-07-23 11:11:53', '2', '', '33855.9270112272', '30752.260527110055', '22', '2012-07-23 11:11:53', 'cck');
INSERT INTO `t_gps_data` VALUES ('3727030', '2012-07-23 11:11:53', '1', '', '33487.577676865054', '10710.787188157565', '12', '2012-07-23 11:11:53', 'clm');
INSERT INTO `t_gps_data` VALUES ('3727031', '2012-07-23 11:11:53', '1', '', '37470.176314987955', '12165.602824392914', '67', '2012-07-23 11:11:53', 'hou');
INSERT INTO `t_gps_data` VALUES ('3727032', '2012-07-23 11:11:53', '3', '', '42987.36544996507', '30531.857397568547', '60', '2012-07-23 11:11:53', 'jur');
INSERT INTO `t_gps_data` VALUES ('3727033', '2012-07-23 11:11:53', '2', '', '41767.889964319205', '34060.69547232173', '85', '2012-07-23 11:11:53', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3727034', '2012-07-23 11:12:03', '1', '', '40941.12667783149', '19716.934412261264', '38', '2012-07-23 11:12:03', '2');
INSERT INTO `t_gps_data` VALUES ('3727035', '2012-07-23 11:12:03', '0', '', '41389.75965697806', '36779.94868156528', '28', '2012-07-23 11:12:03', '1');
INSERT INTO `t_gps_data` VALUES ('3727036', '2012-07-23 11:12:03', '1', '', '38707.28305559019', '11408.88077366401', '99', '2012-07-23 11:12:03', '4');
INSERT INTO `t_gps_data` VALUES ('3727037', '2012-07-23 11:12:03', '3', '', '42523.99417702913', '38618.54791609505', '82', '2012-07-23 11:12:03', '3');
INSERT INTO `t_gps_data` VALUES ('3727038', '2012-07-23 11:12:03', '0', '', '37888.633711128845', '18346.81968531865', '73', '2012-07-23 11:12:03', '5');
INSERT INTO `t_gps_data` VALUES ('3727039', '2012-07-23 11:12:03', '2', '', '38573.63538031892', '17666.0404079471', '47', '2012-07-23 11:12:03', '6');
INSERT INTO `t_gps_data` VALUES ('3727040', '2012-07-23 11:12:03', '3', '', '39294.58573826767', '26392.3844008176', '15', '2012-07-23 11:12:03', '001190251');
INSERT INTO `t_gps_data` VALUES ('3727041', '2012-07-23 11:12:03', '0', '', '43275.48945782191', '17459.201120538066', '37', '2012-07-23 11:12:03', '001014182');
INSERT INTO `t_gps_data` VALUES ('3727042', '2012-07-23 11:12:03', '0', '', '36406.16122618151', '12802.434860907602', '28', '2012-07-23 11:12:03', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3727043', '2012-07-23 11:12:03', '1', '', '37458.49318460216', '24867.522183237652', '49', '2012-07-23 11:12:03', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3727044', '2012-07-23 11:12:03', '1', '', '38586.31040870007', '22811.400036218067', '90', '2012-07-23 11:12:03', '001001003');
INSERT INTO `t_gps_data` VALUES ('3727045', '2012-07-23 11:12:03', '1', '', '39367.019500392395', '23140.755455920582', '84', '2012-07-23 11:12:03', '001067110');
INSERT INTO `t_gps_data` VALUES ('3727046', '2012-07-23 11:12:03', '3', '', '33077.82326928147', '15666.811217144204', '55', '2012-07-23 11:12:03', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3727047', '2012-07-23 11:12:03', '0', '', '34425.81138712257', '21201.559313549486', '29', '2012-07-23 11:12:03', 'amk');
INSERT INTO `t_gps_data` VALUES ('3727048', '2012-07-23 11:12:03', '1', '', '33580.108175188994', '15405.42642558111', '59', '2012-07-23 11:12:03', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3727049', '2012-07-23 11:12:03', '2', '', '33903.92962771866', '30771.243464210933', '22', '2012-07-23 11:12:03', 'cck');
INSERT INTO `t_gps_data` VALUES ('3727050', '2012-07-23 11:12:03', '1', '', '33515.71417774738', '10740.987225530342', '12', '2012-07-23 11:12:03', 'clm');
INSERT INTO `t_gps_data` VALUES ('3727051', '2012-07-23 11:12:03', '1', '', '37483.801245200106', '12261.72501766114', '67', '2012-07-23 11:12:03', 'hou');
INSERT INTO `t_gps_data` VALUES ('3727052', '2012-07-23 11:12:03', '3', '', '42925.9530450236', '30514.56373243759', '60', '2012-07-23 11:12:03', 'jur');
INSERT INTO `t_gps_data` VALUES ('3727053', '2012-07-23 11:12:03', '2', '', '41835.899627583996', '34080.06457854559', '85', '2012-07-23 11:12:03', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3727054', '2012-07-23 11:12:13', '1', '', '40959.94090495054', '19793.304519242145', '38', '2012-07-23 11:12:13', '2');
INSERT INTO `t_gps_data` VALUES ('3727055', '2012-07-23 11:12:13', '0', '', '41386.818177315115', '36735.07894988418', '28', '2012-07-23 11:12:13', '1');
INSERT INTO `t_gps_data` VALUES ('3727056', '2012-07-23 11:12:13', '1', '', '38736.36880093572', '11497.399749009057', '99', '2012-07-23 11:12:13', '4');
INSERT INTO `t_gps_data` VALUES ('3727057', '2012-07-23 11:12:13', '3', '', '42458.04571323353', '38610.63549465868', '82', '2012-07-23 11:12:13', '3');
INSERT INTO `t_gps_data` VALUES ('3727058', '2012-07-23 11:12:13', '0', '', '37879.575552384405', '18314.769262929545', '73', '2012-07-23 11:12:13', '5');
INSERT INTO `t_gps_data` VALUES ('3727059', '2012-07-23 11:12:13', '2', '', '38605.334931073296', '17671.062245061024', '47', '2012-07-23 11:12:13', '6');
INSERT INTO `t_gps_data` VALUES ('3727060', '2012-07-23 11:12:13', '3', '', '39201.22765280713', '26387.17691157524', '15', '2012-07-23 11:12:13', '001190251');
INSERT INTO `t_gps_data` VALUES ('3727061', '2012-07-23 11:12:13', '0', '', '43255.844998351575', '17364.348006026245', '37', '2012-07-23 11:12:13', '001014182');
INSERT INTO `t_gps_data` VALUES ('3727062', '2012-07-23 11:12:13', '0', '', '36384.67678380328', '12748.637096333285', '28', '2012-07-23 11:12:13', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3727063', '2012-07-23 11:12:13', '1', '', '37465.0604466896', '24905.363690598322', '49', '2012-07-23 11:12:13', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3727064', '2012-07-23 11:12:13', '1', '', '38600.204808795286', '22909.49165680726', '90', '2012-07-23 11:12:13', '001001003');
INSERT INTO `t_gps_data` VALUES ('3727065', '2012-07-23 11:12:13', '1', '', '39389.51040483078', '23238.456643682777', '84', '2012-07-23 11:12:13', '001067110');
INSERT INTO `t_gps_data` VALUES ('3727066', '2012-07-23 11:12:13', '3', '', '33013.58418869145', '15666.256620679898', '55', '2012-07-23 11:12:13', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3727067', '2012-07-23 11:12:13', '0', '', '34411.858634985896', '21126.478797019347', '29', '2012-07-23 11:12:13', 'amk');
INSERT INTO `t_gps_data` VALUES ('3727068', '2012-07-23 11:12:13', '1', '', '33594.85578108265', '15448.726154009577', '59', '2012-07-23 11:12:13', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3727069', '2012-07-23 11:12:13', '2', '', '33944.13200003256', '30796.125484851953', '22', '2012-07-23 11:12:13', 'cck');
INSERT INTO `t_gps_data` VALUES ('3727070', '2012-07-23 11:12:13', '1', '', '33537.435444789444', '10820.59557166868', '12', '2012-07-23 11:12:13', 'clm');
INSERT INTO `t_gps_data` VALUES ('3727071', '2012-07-23 11:12:13', '1', '', '37494.08758115688', '12292.52126488418', '67', '2012-07-23 11:12:13', 'hou');
INSERT INTO `t_gps_data` VALUES ('3727072', '2012-07-23 11:12:13', '3', '', '42873.59974804261', '30489.697949875692', '60', '2012-07-23 11:12:13', 'jur');
INSERT INTO `t_gps_data` VALUES ('3727073', '2012-07-23 11:12:13', '2', '', '41873.83906794948', '34080.467240193844', '85', '2012-07-23 11:12:13', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3727074', '2012-07-23 11:12:23', '1', '', '40967.662387832075', '19858.669209026506', '38', '2012-07-23 11:12:23', '2');
INSERT INTO `t_gps_data` VALUES ('3727075', '2012-07-23 11:12:23', '0', '', '41364.755772122124', '36666.543618032534', '28', '2012-07-23 11:12:23', '1');
INSERT INTO `t_gps_data` VALUES ('3727076', '2012-07-23 11:12:23', '1', '', '38741.847924939444', '11547.726601241216', '99', '2012-07-23 11:12:23', '4');
INSERT INTO `t_gps_data` VALUES ('3727077', '2012-07-23 11:12:23', '3', '', '42403.76777566596', '38606.772785368994', '82', '2012-07-23 11:12:23', '3');
INSERT INTO `t_gps_data` VALUES ('3727078', '2012-07-23 11:12:23', '0', '', '37868.17110228142', '18265.786583866575', '73', '2012-07-23 11:12:23', '5');
INSERT INTO `t_gps_data` VALUES ('3727079', '2012-07-23 11:12:23', '2', '', '38663.975192218175', '17693.517112666676', '47', '2012-07-23 11:12:23', '6');
INSERT INTO `t_gps_data` VALUES ('3727080', '2012-07-23 11:12:23', '3', '', '39153.34747673942', '26358.885062542144', '15', '2012-07-23 11:12:23', '001190251');
INSERT INTO `t_gps_data` VALUES ('3727081', '2012-07-23 11:12:23', '0', '', '43248.008384141474', '17322.860036159163', '37', '2012-07-23 11:12:23', '001014182');
INSERT INTO `t_gps_data` VALUES ('3727082', '2012-07-23 11:12:23', '0', '', '36366.508671170515', '12671.768227052955', '28', '2012-07-23 11:12:23', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3727083', '2012-07-23 11:12:23', '1', '', '37489.598753305196', '24989.72184391195', '49', '2012-07-23 11:12:23', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3727084', '2012-07-23 11:12:23', '1', '', '38615.115192020334', '23000.045265649667', '90', '2012-07-23 11:12:23', '001001003');
INSERT INTO `t_gps_data` VALUES ('3727085', '2012-07-23 11:12:24', '1', '', '39416.11692919092', '23295.82284436465', '84', '2012-07-23 11:12:24', '001067110');
INSERT INTO `t_gps_data` VALUES ('3727086', '2012-07-23 11:12:24', '3', '', '32944.51049101394', '15665.00822981608', '55', '2012-07-23 11:12:24', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3727087', '2012-07-23 11:12:24', '0', '', '34387.81039943989', '21037.0398398548', '29', '2012-07-23 11:12:24', 'amk');
INSERT INTO `t_gps_data` VALUES ('3727088', '2012-07-23 11:12:24', '1', '', '33624.62991789839', '15541.90024102233', '59', '2012-07-23 11:12:24', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3727089', '2012-07-23 11:12:24', '2', '', '34003.79591559778', '30822.30065032573', '22', '2012-07-23 11:12:24', 'cck');
INSERT INTO `t_gps_data` VALUES ('3727090', '2012-07-23 11:12:24', '1', '', '33561.114947302354', '10917.884279564334', '12', '2012-07-23 11:12:24', 'clm');
INSERT INTO `t_gps_data` VALUES ('3727091', '2012-07-23 11:12:24', '1', '', '37507.54339305593', '12374.042980036847', '67', '2012-07-23 11:12:24', 'hou');
INSERT INTO `t_gps_data` VALUES ('3727092', '2012-07-23 11:12:24', '3', '', '42831.29016890983', '30479.150962442276', '60', '2012-07-23 11:12:24', 'jur');
INSERT INTO `t_gps_data` VALUES ('3727093', '2012-07-23 11:12:24', '2', '', '41933.37325386253', '34090.663133011156', '85', '2012-07-23 11:12:24', 'tpy');

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
) ENGINE=InnoDB AUTO_INCREMENT=2142 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('2133', 'Application.admin', '/admin', '2012-07-23 11:09:20', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('2134', 'SystemConfigs.grid', '/systemconfigs/grid?id=systemconfigs', '2012-07-23 11:09:23', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('2135', 'SystemConfigs.read', '/SystemConfigs/read', '2012-07-23 11:09:23', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('2136', 'SystemConfigs.create', '/SystemConfigs/create?models=[{\"id\":null,\"name\":\"99999999999999999999999999999\",\"value\":\"999999999999999999999999999999999\",\"displayName\":\"99999999999999999999999999999999\"}]', '2012-07-23 11:09:36', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('2137', 'Application.admin', '/admin', '2012-07-23 11:11:33', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('2138', 'Users.grid', '/users/grid?id=users', '2012-07-23 11:11:35', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('2139', 'Users.read', '/Users/read', '2012-07-23 11:11:35', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('2140', 'Events.grid', '/events/grid?id=events?id=event_list', '2012-07-23 11:11:58', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');
INSERT INTO `t_log` VALUES ('2141', 'Events.listJson', '/events/listJson', '2012-07-23 11:11:58', 'system', 'normal', null, null, '127.0.0.1', 'user_1', '', 'admin');

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

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
INSERT INTO `t_permission` VALUES ('22', 'Search Event Info', null, null, 'Events.search');
INSERT INTO `t_permission` VALUES ('23', 'Read Event Info', null, null, 'Events.read');
INSERT INTO `t_permission` VALUES ('24', 'Update Event Info', null, null, 'Events.update');
INSERT INTO `t_permission` VALUES ('25', 'Get Events Json Info', null, null, 'Events.listJson');
INSERT INTO `t_permission` VALUES ('30', 'asdfasdfsdaf', null, null, 'Events.grid');
INSERT INTO `t_permission` VALUES ('31', 'Delete Permission Info', null, null, 'Permissions.destroy');

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'administrator', 'administrator');
INSERT INTO `t_role` VALUES ('4', 'manager', 'manager');
INSERT INTO `t_role` VALUES ('5', 'default', 'default');
INSERT INTO `t_role` VALUES ('6', 'demo', 'demo');
INSERT INTO `t_role` VALUES ('7', 'fleetleader', 'fleetLeader');
INSERT INTO `t_role` VALUES ('9', 'asdfasdf', 'asdfasf');
INSERT INTO `t_role` VALUES ('15', 'dddddd', 'ffffff');
INSERT INTO `t_role` VALUES ('17', 'fdfdf', 'xxxddd');
INSERT INTO `t_role` VALUES ('20', 'sdffsdf', 'xxxffdddd');
INSERT INTO `t_role` VALUES ('23', 'asfasdfsd', 'asfasfasdf');
INSERT INTO `t_role` VALUES ('35', '11111111111', '1111111111111111');
INSERT INTO `t_role` VALUES ('36', '2222222222', '2222222222');
INSERT INTO `t_role` VALUES ('37', '33333333333333', 'xxxxxxxxxxxxx');

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
INSERT INTO `t_role_perm` VALUES ('6', '17');
INSERT INTO `t_role_perm` VALUES ('6', '18');
INSERT INTO `t_role_perm` VALUES ('5', '7');
INSERT INTO `t_role_perm` VALUES ('5', '8');
INSERT INTO `t_role_perm` VALUES ('5', '9');
INSERT INTO `t_role_perm` VALUES ('5', '10');
INSERT INTO `t_role_perm` VALUES ('5', '11');
INSERT INTO `t_role_perm` VALUES ('5', '12');
INSERT INTO `t_role_perm` VALUES ('5', '17');
INSERT INTO `t_role_perm` VALUES ('5', '16');
INSERT INTO `t_role_perm` VALUES ('5', '19');
INSERT INTO `t_role_perm` VALUES ('5', '18');
INSERT INTO `t_role_perm` VALUES ('5', '21');
INSERT INTO `t_role_perm` VALUES ('5', '20');
INSERT INTO `t_role_perm` VALUES ('5', '23');
INSERT INTO `t_role_perm` VALUES ('5', '22');
INSERT INTO `t_role_perm` VALUES ('5', '25');
INSERT INTO `t_role_perm` VALUES ('5', '24');
INSERT INTO `t_role_perm` VALUES ('5', '31');
INSERT INTO `t_role_perm` VALUES ('5', '30');
INSERT INTO `t_role_perm` VALUES ('15', '7');
INSERT INTO `t_role_perm` VALUES ('15', '8');
INSERT INTO `t_role_perm` VALUES ('15', '9');
INSERT INTO `t_role_perm` VALUES ('15', '10');
INSERT INTO `t_role_perm` VALUES ('15', '11');
INSERT INTO `t_role_perm` VALUES ('15', '12');
INSERT INTO `t_role_perm` VALUES ('15', '17');
INSERT INTO `t_role_perm` VALUES ('15', '16');
INSERT INTO `t_role_perm` VALUES ('15', '19');
INSERT INTO `t_role_perm` VALUES ('15', '18');
INSERT INTO `t_role_perm` VALUES ('15', '21');
INSERT INTO `t_role_perm` VALUES ('15', '20');
INSERT INTO `t_role_perm` VALUES ('15', '23');
INSERT INTO `t_role_perm` VALUES ('15', '22');
INSERT INTO `t_role_perm` VALUES ('15', '25');
INSERT INTO `t_role_perm` VALUES ('15', '24');
INSERT INTO `t_role_perm` VALUES ('15', '31');
INSERT INTO `t_role_perm` VALUES ('15', '30');

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
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_schedule
-- ----------------------------
INSERT INTO `t_schedule` VALUES ('1', '74689', 'vehicle01', '2012-10-06 05:42:00', '2012-10-06 14:53:00', '851', '851AM04');
INSERT INTO `t_schedule` VALUES ('2', '74652', 'vehicle02', '2012-07-04 05:46:00', '2012-07-04 15:21:00', '171', '171AM13');
INSERT INTO `t_schedule` VALUES ('3', '74652', 'vehicle03', '2011-06-12 14:44:00', '2009-12-01 00:00:00', '171', '171PM12');
INSERT INTO `t_schedule` VALUES ('4', '74652', 'vehicle01', '2011-03-03 05:48:00', '2011-03-03 14:51:00', '851', '851AM04');
INSERT INTO `t_schedule` VALUES ('5', '74652', 'vehicle01', '2013-04-03 14:57:00', '2013-05-03 01:07:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('6', '74631', 'vehicle02', '2013-02-02 06:08:00', '2013-02-02 15:10:00', '171', '171AM13');
INSERT INTO `t_schedule` VALUES ('7', '74631', 'vehicle02', '2012-03-02 06:31:00', '2012-03-02 15:08:00', '171', '171AM15');
INSERT INTO `t_schedule` VALUES ('8', '74631', 'vehicle01', '2013-04-02 05:25:00', '2013-04-02 14:57:00', '851', '851AM04');
INSERT INTO `t_schedule` VALUES ('9', '74631', 'vehicle04', '2011-11-04 17:17:00', '2011-11-04 20:29:00', '961', '961S104');
INSERT INTO `t_schedule` VALUES ('10', '74631', 'vehicle01', '2012-01-06 05:05:00', '2012-01-06 19:48:00', '961', '961S108');
INSERT INTO `t_schedule` VALUES ('11', '74571', 'vehicle02', '2011-05-06 05:39:00', '2011-05-06 16:00:00', '171', '171AM13');
INSERT INTO `t_schedule` VALUES ('12', '74571', 'vehicle03', '2011-11-05 05:27:00', '2011-11-05 14:39:00', '171', '171AM15');
INSERT INTO `t_schedule` VALUES ('13', '74571', 'vehicle03', '2013-01-02 06:32:00', '2013-01-02 08:51:00', '171', '171S203');
INSERT INTO `t_schedule` VALUES ('14', '74571', 'vehicle04', '2012-10-03 06:53:00', '2012-10-03 08:16:00', '811', '811AM09');
INSERT INTO `t_schedule` VALUES ('15', '74571', 'vehicle04', '2012-10-03 06:07:00', '2012-10-03 06:39:00', '851', '851S104');
INSERT INTO `t_schedule` VALUES ('16', '74571', 'vehicle01', '2011-04-04 05:51:00', '2011-04-04 09:22:00', '851', '851S201');
INSERT INTO `t_schedule` VALUES ('17', '74571', 'vehicle01', '2013-03-07 05:36:00', '2013-03-07 09:29:00', '851', '851S254');
INSERT INTO `t_schedule` VALUES ('18', '74571', 'vehicle04', '2012-10-03 08:24:00', '2012-10-03 12:24:00', '854', '854AM16');
INSERT INTO `t_schedule` VALUES ('19', '74538', 'vehicle04', '2011-03-07 11:00:00', '2011-03-07 15:04:00', 'RWS8', 'RWS8AM0');
INSERT INTO `t_schedule` VALUES ('20', '74498', 'vehicle02', '2013-03-05 06:59:00', '2013-03-05 15:22:00', '171', '171AM13');
INSERT INTO `t_schedule` VALUES ('21', '74498', 'vehicle05', '2012-09-06 05:53:00', '2012-09-06 15:22:00', '851', '851AM06');
INSERT INTO `t_schedule` VALUES ('22', '74498', 'vehicle04', '2011-03-03 15:21:00', '2011-03-03 19:42:00', '851', '851S155');
INSERT INTO `t_schedule` VALUES ('23', '74498', 'vehicle03', '2013-01-02 16:47:00', '2013-01-02 21:02:00', '851', '851S156');
INSERT INTO `t_schedule` VALUES ('24', '74498', 'vehicle01', '2012-06-11 13:30:00', '2012-06-11 20:02:00', '851', '851S202');
INSERT INTO `t_schedule` VALUES ('25', '74484', 'vehicle04', '2012-08-04 17:02:00', '2012-08-04 20:48:00', '806', '806S102');
INSERT INTO `t_schedule` VALUES ('26', '74484', 'vehicle05', '2012-03-04 19:26:00', '2012-04-04 00:36:00', '851', '851PM06');
INSERT INTO `t_schedule` VALUES ('27', '74484', 'vehicle05', '2011-12-04 17:52:00', '2011-12-04 21:15:00', '854', '854S107');
INSERT INTO `t_schedule` VALUES ('28', '74483', 'vehicle04', '2012-09-05 04:56:00', '2012-09-05 13:55:00', '851', '851AM11');
INSERT INTO `t_schedule` VALUES ('29', '74483', 'vehicle02', '2012-09-04 16:02:00', '2012-09-04 17:30:00', '969', '969S108');
INSERT INTO `t_schedule` VALUES ('30', '74482', 'vehicle02', '2011-06-01 06:14:00', '2011-06-01 15:09:00', '171', '171AM09');
INSERT INTO `t_schedule` VALUES ('31', '74482', 'vehicle04', '2012-11-03 08:40:00', '2012-11-03 14:40:00', '851', '851AM11');
INSERT INTO `t_schedule` VALUES ('32', '74423', 'vehicle02', '2011-02-04 05:00:00', '2011-02-04 15:12:00', '171', '171AM13');
INSERT INTO `t_schedule` VALUES ('33', '74423', 'vehicle03', '2011-04-06 05:30:00', '2011-04-06 15:27:00', '171', '171AM15');
INSERT INTO `t_schedule` VALUES ('34', '74423', 'vehicle05', '2012-05-07 05:40:00', '2012-05-07 14:34:00', '857', '857AM01');
INSERT INTO `t_schedule` VALUES ('35', '74423', 'vehicle05', '2012-05-07 14:44:00', '2012-05-07 17:22:00', '857', '857PM01');
INSERT INTO `t_schedule` VALUES ('36', '74423', 'vehicle04', '2012-02-03 16:28:00', '2012-02-03 20:37:00', '969', '969S108');
INSERT INTO `t_schedule` VALUES ('37', '74353', 'vehicle01', '2011-07-02 05:16:00', '2011-07-02 14:26:00', '851', '851AM02');
INSERT INTO `t_schedule` VALUES ('38', '74353', 'vehicle01', '2012-10-04 05:29:00', '2012-10-04 14:11:00', '851', '851AM04');
INSERT INTO `t_schedule` VALUES ('39', '74353', 'vehicle01', '2011-01-06 05:22:00', '2011-01-06 14:06:00', '851', '851AM04');
INSERT INTO `t_schedule` VALUES ('40', '74353', 'vehicle01', '2000-12-01 00:00:00', '2011-08-12 15:21:00', '851', '851AM10');
INSERT INTO `t_schedule` VALUES ('41', '74291', 'vehicle04', '2012-10-06 15:29:00', '2012-10-06 19:45:00', '851', '851S102');
INSERT INTO `t_schedule` VALUES ('42', '74291', 'vehicle04', '2012-11-06 06:08:00', '2012-11-06 11:13:00', '851', '851S102');
INSERT INTO `t_schedule` VALUES ('43', '74291', 'vehicle01', '2013-01-01 16:27:00', '2013-01-01 19:17:00', '851', '851S104');
INSERT INTO `t_schedule` VALUES ('44', '74291', 'vehicle01', '2011-10-06 06:16:00', '2011-10-06 11:37:00', '851', '851S104');
INSERT INTO `t_schedule` VALUES ('45', '74291', 'vehicle05', '2012-04-06 06:28:00', '2012-04-06 11:40:00', '851', '851S104');
INSERT INTO `t_schedule` VALUES ('46', '74291', 'vehicle01', '2012-08-01 05:49:00', '2012-08-01 09:44:00', '851', '851S201');
INSERT INTO `t_schedule` VALUES ('47', '74291', 'vehicle05', '2011-11-05 06:25:00', '2011-11-05 09:48:00', '851', '851S201');
INSERT INTO `t_schedule` VALUES ('48', '74279', 'vehicle02', '2012-06-03 05:53:00', '2012-06-03 14:54:00', '171', '171AM13');
INSERT INTO `t_schedule` VALUES ('49', '74279', 'vehicle01', '2013-07-03 05:33:00', '2013-07-03 14:51:00', '851', '851AM04');
INSERT INTO `t_schedule` VALUES ('50', '74279', 'vehicle05', '2012-01-03 04:48:00', '2012-01-03 11:18:00', '851', '851AM06');
INSERT INTO `t_schedule` VALUES ('51', '74279', 'vehicle05', '2012-03-03 06:00:00', '2012-03-03 15:10:00', '851', '851AM06');
INSERT INTO `t_schedule` VALUES ('52', '74279', 'vehicle05', '2012-04-03 05:47:00', '2012-04-03 15:12:00', '851', '851AM06');
INSERT INTO `t_schedule` VALUES ('53', '74279', 'vehicle04', '2012-05-12 14:10:00', '2012-05-12 15:07:00', '851', '851AM10');
INSERT INTO `t_schedule` VALUES ('54', '74279', 'vehicle05', '2012-07-03 13:49:00', '2012-07-03 13:52:00', '851', '851AM10');
INSERT INTO `t_schedule` VALUES ('55', '74279', 'vehicle04', '2012-08-03 05:41:00', '2012-08-03 14:16:00', '851', '851AM11');
INSERT INTO `t_schedule` VALUES ('56', '74279', 'vehicle04', '2011-11-04 05:33:00', '2011-11-04 12:45:00', '851', '851AM11');
INSERT INTO `t_schedule` VALUES ('57', '74279', 'vehicle04', '2011-12-04 05:42:00', '2011-12-04 14:54:00', '851', '851AM11');
INSERT INTO `t_schedule` VALUES ('58', '74279', 'vehicle04', '2012-02-04 05:36:00', '2012-02-04 14:52:00', '851', '851AM11');
INSERT INTO `t_schedule` VALUES ('59', '74279', 'vehicle04', '2012-03-04 05:34:00', '2012-03-04 14:53:00', '851', '851AM11');
INSERT INTO `t_schedule` VALUES ('60', '74270', 'vehicle01', '2011-11-03 05:43:00', '2011-11-03 14:54:00', '851', '851AM04');
INSERT INTO `t_schedule` VALUES ('61', '74270', 'vehicle05', '2012-02-05 05:42:00', '2012-02-05 14:39:00', '851', '851AM06');
INSERT INTO `t_schedule` VALUES ('62', '74270', 'vehicle05', '2011-03-06 05:49:00', '2011-03-06 14:42:00', '851', '851AM06');
INSERT INTO `t_schedule` VALUES ('63', '74270', 'vehicle04', '2012-12-04 05:55:00', '2012-12-04 14:18:00', '851', '851AM11');
INSERT INTO `t_schedule` VALUES ('64', '74270', 'vehicle01', '2011-03-04 14:19:00', '2011-04-04 00:12:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('65', '74270', 'vehicle01', '2011-05-04 14:57:00', '2011-06-04 01:15:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('66', '74270', 'vehicle01', '2011-04-07 15:05:00', '2011-05-07 01:26:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('67', '74270', 'vehicle01', '2011-05-07 15:05:00', '2011-06-07 01:25:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('68', '74270', 'vehicle05', '2012-05-04 14:58:00', '2012-06-04 00:50:00', '851', '851PM06');
INSERT INTO `t_schedule` VALUES ('69', '74270', 'vehicle05', '2012-06-04 15:31:00', '2012-07-04 00:42:00', '851', '851PM06');
INSERT INTO `t_schedule` VALUES ('70', '74270', 'vehicle05', '2012-07-04 15:31:00', '2012-08-04 00:46:00', '851', '851PM06');
INSERT INTO `t_schedule` VALUES ('71', '74270', 'vehicle05', '2012-08-04 15:31:00', '2012-09-04 00:56:00', '851', '851PM06');
INSERT INTO `t_schedule` VALUES ('72', '74270', 'vehicle05', '2012-09-04 15:31:00', '2012-10-04 00:42:00', '851', '851PM06');
INSERT INTO `t_schedule` VALUES ('73', '74270', 'vehicle04', '2011-07-05 15:14:00', '2011-08-05 01:28:00', '851', '851PM07');
INSERT INTO `t_schedule` VALUES ('74', '74270', 'vehicle01', '2011-03-02 16:07:00', '2011-04-02 00:38:00', '851', '851PM10');
INSERT INTO `t_schedule` VALUES ('75', '74270', 'vehicle04', '2011-05-02 14:45:00', '2011-06-02 01:00:00', '851', '851PM10');
INSERT INTO `t_schedule` VALUES ('76', '74270', 'vehicle04', '2012-12-04 14:32:00', '2012-12-04 19:42:00', '851', '851PM11');
INSERT INTO `t_schedule` VALUES ('77', '74270', 'vehicle04', '2011-09-06 15:35:00', '2011-10-06 01:26:00', '851', '851PM11');
INSERT INTO `t_schedule` VALUES ('78', '74270', 'vehicle04', '2011-01-07 14:59:00', '2011-02-07 01:34:00', '851', '851PM11');
INSERT INTO `t_schedule` VALUES ('79', '74228', 'vehicle02', '2011-09-01 16:22:00', '2011-10-01 01:08:00', '171', '171PM10');
INSERT INTO `t_schedule` VALUES ('80', '74228', 'vehicle02', '2013-05-01 19:33:00', '2013-06-01 01:30:00', '171', '171PM12');
INSERT INTO `t_schedule` VALUES ('81', '74228', 'vehicle02', '2011-05-04 17:33:00', '2011-06-04 01:08:00', '171', '171PM13');
INSERT INTO `t_schedule` VALUES ('82', '74228', 'vehicle02', '2010-08-12 18:17:00', '2010-08-12 22:31:00', '171', '171PM14');
INSERT INTO `t_schedule` VALUES ('83', '74228', 'vehicle02', '2012-07-02 15:31:00', '2012-08-02 01:12:00', '171', '171PM15');
INSERT INTO `t_schedule` VALUES ('84', '74228', 'vehicle03', '2011-12-06 15:18:00', '2012-01-06 00:28:00', '171', '171PM15');
INSERT INTO `t_schedule` VALUES ('85', '74228', 'vehicle03', '2012-07-06 15:18:00', '2012-08-06 00:13:00', '171', '171PM15');
INSERT INTO `t_schedule` VALUES ('86', '74228', 'vehicle01', '2012-09-04 21:03:00', '2012-10-04 01:20:00', '67', '67PM07');
INSERT INTO `t_schedule` VALUES ('87', '74228', 'vehicle01', '2013-03-04 15:05:00', '2013-04-04 01:17:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('88', '74228', 'vehicle01', '2013-06-07 16:01:00', '2013-07-07 00:28:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('89', '74228', 'vehicle04', '2013-02-04 14:59:00', '2013-03-04 01:22:00', '851', '851PM11');
INSERT INTO `t_schedule` VALUES ('90', '74215', 'vehicle01', '2011-09-06 05:50:00', '2011-09-06 14:09:00', '851', '851AM04');
INSERT INTO `t_schedule` VALUES ('91', '74215', 'vehicle01', '2011-02-07 05:57:00', '2011-02-07 15:45:00', '851', '851AM04');
INSERT INTO `t_schedule` VALUES ('92', '74215', 'vehicle01', '2011-09-07 05:42:00', '2011-09-07 15:40:00', '851', '851AM04');
INSERT INTO `t_schedule` VALUES ('93', '74215', 'vehicle04', '2013-05-05 06:10:00', '2013-05-05 14:14:00', '851', '851AM11');
INSERT INTO `t_schedule` VALUES ('94', '74106', 'vehicle04', '2008-12-01 00:00:00', '2012-04-12 13:44:00', '851', '851AM02');
INSERT INTO `t_schedule` VALUES ('95', '74106', 'vehicle04', '2000-12-01 00:00:00', '2012-06-12 13:47:00', '851', '851AM02');
INSERT INTO `t_schedule` VALUES ('96', '74106', 'vehicle04', '2011-02-01 05:06:00', '2011-02-01 15:29:00', '851', '851AM03');
INSERT INTO `t_schedule` VALUES ('97', '74106', 'vehicle04', '2011-03-01 05:11:00', '2011-03-01 14:40:00', '851', '851AM03');
INSERT INTO `t_schedule` VALUES ('98', '74106', 'vehicle04', '2012-01-01 05:34:00', '2012-01-01 15:02:00', '851', '851AM04');
INSERT INTO `t_schedule` VALUES ('99', '74106', 'vehicle01', '2012-05-04 05:32:00', '2012-05-04 14:12:00', '851', '851AM04');
INSERT INTO `t_schedule` VALUES ('100', '74106', 'vehicle01', '2012-06-04 05:35:00', '2012-06-04 14:55:00', '851', '851AM04');
INSERT INTO `t_schedule` VALUES ('101', '74106', 'vehicle01', '2012-07-04 05:37:00', '2012-07-04 14:53:00', '851', '851AM04');
INSERT INTO `t_schedule` VALUES ('102', '74106', 'vehicle01', '2012-07-05 05:47:00', '2012-07-05 14:54:00', '851', '851AM04');
INSERT INTO `t_schedule` VALUES ('103', '74106', 'vehicle01', '2012-07-05 05:47:00', '2012-07-05 14:54:00', '851', '851AM04');
INSERT INTO `t_schedule` VALUES ('104', '74106', 'vehicle04', '2012-05-01 05:36:00', '2012-05-01 15:01:00', '851', '851AM05');
INSERT INTO `t_schedule` VALUES ('105', '74106', 'vehicle04', '2012-06-01 05:42:00', '2012-06-01 15:02:00', '851', '851AM05');
INSERT INTO `t_schedule` VALUES ('106', '74106', 'vehicle04', '2012-07-01 05:39:00', '2012-07-01 15:05:00', '851', '851AM05');
INSERT INTO `t_schedule` VALUES ('107', '74106', 'vehicle04', '2013-05-01 05:36:00', '2013-05-01 15:00:00', '851', '851AM06');
INSERT INTO `t_schedule` VALUES ('108', '74106', 'vehicle05', '2011-01-05 04:44:00', '2011-01-05 14:42:00', '851', '851AM06');
INSERT INTO `t_schedule` VALUES ('109', '74106', 'vehicle05', '2011-02-05 04:43:00', '2011-02-05 14:42:00', '851', '851AM06');
INSERT INTO `t_schedule` VALUES ('110', '74106', 'vehicle05', '2011-03-05 05:45:00', '2011-03-05 15:21:00', '851', '851AM06');
INSERT INTO `t_schedule` VALUES ('111', '74106', 'vehicle05', '2011-04-05 05:47:00', '2011-04-05 15:17:00', '851', '851AM06');
INSERT INTO `t_schedule` VALUES ('112', '74106', 'vehicle05', '2011-05-05 05:53:00', '2011-05-05 15:19:00', '851', '851AM06');
INSERT INTO `t_schedule` VALUES ('113', '74106', 'vehicle04', '2013-06-01 05:16:00', '2013-06-01 15:33:00', '851', '851AM08');
INSERT INTO `t_schedule` VALUES ('114', '74106', 'vehicle04', '2013-07-01 04:57:00', '2013-07-01 15:39:00', '851', '851AM08');
INSERT INTO `t_schedule` VALUES ('115', '74106', 'vehicle04', '2011-01-02 05:02:00', '2011-01-02 15:39:00', '851', '851AM08');
INSERT INTO `t_schedule` VALUES ('116', '74106', 'vehicle04', '2011-02-02 06:15:00', '2011-02-02 14:56:00', '851', '851AM08');
INSERT INTO `t_schedule` VALUES ('117', '74106', 'vehicle04', '2011-03-02 05:23:00', '2011-03-02 15:18:00', '851', '851AM08');
INSERT INTO `t_schedule` VALUES ('118', '74106', 'vehicle04', '2012-05-02 05:26:00', '2012-05-02 16:04:00', '851', '851AM10');
INSERT INTO `t_schedule` VALUES ('119', '74106', 'vehicle04', '2012-06-02 05:25:00', '2012-06-02 16:00:00', '851', '851AM10');
INSERT INTO `t_schedule` VALUES ('120', '74106', 'vehicle04', '2012-09-02 05:40:00', '2012-09-02 14:39:00', '851', '851AM11');
INSERT INTO `t_schedule` VALUES ('121', '74106', 'vehicle04', '2012-10-02 05:37:00', '2012-10-02 14:42:00', '851', '851AM11');
INSERT INTO `t_schedule` VALUES ('122', '74106', 'vehicle04', '2011-02-06 05:17:00', '2011-02-06 15:28:00', '851', '851AM11');
INSERT INTO `t_schedule` VALUES ('123', '74106', 'vehicle04', '2000-12-01 00:00:00', '2010-10-12 16:07:00', '851', '851AM14');
INSERT INTO `t_schedule` VALUES ('124', '74106', 'vehicle04', '2005-12-01 00:00:00', '2011-03-12 14:47:00', '851', '851AM15');
INSERT INTO `t_schedule` VALUES ('125', '74106', 'vehicle04', '2007-12-01 00:00:00', '2011-05-12 14:47:00', '851', '851AM15');
INSERT INTO `t_schedule` VALUES ('126', '74106', 'vehicle04', '2008-12-01 00:00:00', '2011-06-12 14:28:00', '851', '851AM15');
INSERT INTO `t_schedule` VALUES ('127', '74106', 'vehicle04', '2001-12-01 00:00:00', '2011-09-12 15:00:00', '851', '851AM16');
INSERT INTO `t_schedule` VALUES ('128', '74106', 'vehicle04', '2009-12-01 00:00:00', '2011-07-12 16:36:00', '851', '851AM17');
INSERT INTO `t_schedule` VALUES ('129', '74106', 'vehicle04', '2011-07-01 14:52:00', '2011-07-01 23:46:00', '851', '851PM03');
INSERT INTO `t_schedule` VALUES ('130', '74106', 'vehicle04', '2011-08-01 15:49:00', '2011-09-01 00:25:00', '851', '851PM03');
INSERT INTO `t_schedule` VALUES ('131', '74106', 'vehicle04', '2011-09-01 14:23:00', '2011-10-01 00:05:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('132', '74106', 'vehicle04', '2011-10-01 15:00:00', '2011-11-01 01:17:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('133', '74106', 'vehicle04', '2011-11-01 14:57:00', '2011-12-01 01:19:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('134', '74106', 'vehicle01', '2012-10-04 14:21:00', '2012-11-04 00:14:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('135', '74106', 'vehicle01', '2012-06-07 15:09:00', '2012-07-07 01:24:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('136', '74106', 'vehicle01', '2012-07-07 15:05:00', '2012-08-07 01:13:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('137', '74106', 'vehicle04', '2012-09-01 15:11:00', '2012-10-01 01:21:00', '851', '851PM05');
INSERT INTO `t_schedule` VALUES ('138', '74106', 'vehicle04', '2012-11-01 14:56:00', '2012-12-01 00:40:00', '851', '851PM06');
INSERT INTO `t_schedule` VALUES ('139', '74106', 'vehicle04', '2013-01-01 15:17:00', '2013-02-01 00:21:00', '851', '851PM06');
INSERT INTO `t_schedule` VALUES ('140', '74106', 'vehicle04', '2013-02-01 15:18:00', '2013-03-01 00:22:00', '851', '851PM06');
INSERT INTO `t_schedule` VALUES ('141', '74106', 'vehicle04', '2013-03-01 15:25:00', '2013-04-01 00:35:00', '851', '851PM06');
INSERT INTO `t_schedule` VALUES ('142', '74106', 'vehicle04', '2013-05-01 15:04:00', '2013-05-01 15:48:00', '851', '851PM06');
INSERT INTO `t_schedule` VALUES ('143', '74106', 'vehicle05', '2011-07-05 14:58:00', '2011-08-05 00:46:00', '851', '851PM06');
INSERT INTO `t_schedule` VALUES ('144', '74106', 'vehicle04', '2013-02-02 15:05:00', '2013-02-02 23:52:00', '851', '851PM07');
INSERT INTO `t_schedule` VALUES ('145', '74106', 'vehicle04', '2011-10-02 16:00:00', '2011-11-02 00:53:00', '851', '851PM09');
INSERT INTO `t_schedule` VALUES ('146', '74106', 'vehicle04', '2011-11-02 15:57:00', '2011-12-02 00:51:00', '851', '851PM09');
INSERT INTO `t_schedule` VALUES ('147', '74106', 'vehicle04', '2012-02-02 16:22:00', '2012-03-02 01:07:00', '851', '851PM10');
INSERT INTO `t_schedule` VALUES ('148', '74106', 'vehicle04', '2013-05-05 14:32:00', '2013-05-05 23:09:00', '851', '851PM11');
INSERT INTO `t_schedule` VALUES ('149', '74106', 'vehicle04', '2013-06-05 15:33:00', '2013-07-05 01:23:00', '851', '851PM11');
INSERT INTO `t_schedule` VALUES ('150', '74106', 'vehicle04', '2013-06-06 14:59:00', '2011-01-07 01:26:00', '851', '851PM11');
INSERT INTO `t_schedule` VALUES ('151', '74106', 'vehicle04', '2012-03-07 14:59:00', '2012-04-07 01:24:00', '851', '851PM11');
INSERT INTO `t_schedule` VALUES ('152', '74106', 'vehicle04', '2010-12-12 16:10:00', '2003-12-01 00:00:00', '851', '851PM16');
INSERT INTO `t_schedule` VALUES ('153', '74106', 'vehicle04', '2011-11-12 15:05:00', '2004-12-01 00:00:00', '851', '851PM16');
INSERT INTO `t_schedule` VALUES ('154', '74106', 'vehicle04', '2011-12-12 15:21:00', '2005-12-01 00:00:00', '851', '851PM16');
INSERT INTO `t_schedule` VALUES ('155', '74106', 'vehicle04', '2012-01-12 16:10:00', '2006-12-01 00:00:00', '851', '851PM16');
INSERT INTO `t_schedule` VALUES ('156', '74106', 'vehicle04', '2011-12-02 14:34:00', '2012-01-02 00:31:00', '851', '851PM50');
INSERT INTO `t_schedule` VALUES ('157', '74078', 'vehicle02', '2011-01-04 05:51:00', '2011-01-04 15:21:00', '171', '171AM13');
INSERT INTO `t_schedule` VALUES ('158', '74078', 'vehicle03', '2011-11-07 05:06:00', '2011-11-07 14:34:00', '171', '171AM15');
INSERT INTO `t_schedule` VALUES ('159', '73870', 'vehicle01', '2011-12-06 05:24:00', '2011-12-06 11:46:00', '851', '851AM04');
INSERT INTO `t_schedule` VALUES ('160', '73870', 'vehicle01', '2012-02-06 05:13:00', '2012-02-06 14:05:00', '851', '851AM04');
INSERT INTO `t_schedule` VALUES ('161', '73870', 'vehicle05', '2011-06-05 05:48:00', '2011-06-05 15:18:00', '851', '851AM06');
INSERT INTO `t_schedule` VALUES ('162', '73870', 'vehicle04', '2011-01-01 05:24:00', '2011-01-01 15:42:00', '851', '851AM09');
INSERT INTO `t_schedule` VALUES ('163', '73870', 'vehicle04', '2013-03-03 05:41:00', '2013-03-03 14:13:00', '851', '851AM11');
INSERT INTO `t_schedule` VALUES ('164', '73870', 'vehicle04', '2012-06-04 05:23:00', '2012-06-04 14:54:00', '851', '851AM11');
INSERT INTO `t_schedule` VALUES ('165', '73870', 'vehicle04', '2012-07-04 05:25:00', '2012-07-04 14:52:00', '851', '851AM11');
INSERT INTO `t_schedule` VALUES ('166', '73870', 'vehicle04', '2013-06-06 05:26:00', '2013-06-06 14:56:00', '851', '851AM11');
INSERT INTO `t_schedule` VALUES ('167', '73870', 'vehicle04', '2013-02-07 05:26:00', '2013-02-07 14:50:00', '851', '851AM11');
INSERT INTO `t_schedule` VALUES ('168', '73870', 'vehicle04', '2012-01-03 08:05:00', '2012-01-03 16:50:00', '851', '851AM18');
INSERT INTO `t_schedule` VALUES ('169', '73870', 'vehicle01', '2011-06-03 14:21:00', '2011-07-03 00:09:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('170', '73870', 'vehicle01', '2011-07-03 14:57:00', '2011-08-03 01:12:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('171', '73870', 'vehicle01', '2011-08-03 14:57:00', '2011-09-03 01:08:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('172', '73870', 'vehicle01', '2012-04-06 14:17:00', '2012-05-06 00:23:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('173', '73870', 'vehicle01', '2012-05-06 14:17:00', '2012-06-06 00:08:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('174', '73870', 'vehicle01', '2012-06-06 15:56:00', '2012-07-06 00:33:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('175', '73870', 'vehicle05', '2012-09-03 15:17:00', '2012-10-03 00:25:00', '851', '851PM06');
INSERT INTO `t_schedule` VALUES ('176', '73870', 'vehicle05', '2012-10-03 15:17:00', '2012-11-03 00:32:00', '851', '851PM06');
INSERT INTO `t_schedule` VALUES ('177', '73870', 'vehicle05', '2012-11-03 15:17:00', '2012-12-03 00:24:00', '851', '851PM06');
INSERT INTO `t_schedule` VALUES ('178', '73870', 'vehicle04', '2011-12-05 14:59:00', '2012-01-05 01:26:00', '851', '851PM11');
INSERT INTO `t_schedule` VALUES ('179', '73859', 'vehicle02', '2012-06-05 15:07:00', '2012-06-05 20:14:00', '167', '167S101');
INSERT INTO `t_schedule` VALUES ('180', '73859', 'vehicle05', '2013-06-05 15:22:00', '2013-06-05 15:59:00', '167', '167S101');
INSERT INTO `t_schedule` VALUES ('181', '73859', 'vehicle03', '2012-07-02 17:53:00', '2012-08-02 00:38:00', '980', '980PM05');
INSERT INTO `t_schedule` VALUES ('182', '73662', 'vehicle05', '2012-02-02 05:49:00', '2012-02-02 15:12:00', '851', '851AM05');
INSERT INTO `t_schedule` VALUES ('183', '73662', 'vehicle01', '2013-03-02 14:21:00', '2013-04-02 00:37:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('184', '73662', 'vehicle01', '2013-04-02 14:58:00', '2011-01-03 01:17:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('185', '73662', 'vehicle01', '2011-03-03 14:59:00', '2011-04-03 01:13:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('186', '73662', 'vehicle01', '2011-05-03 16:05:00', '2011-06-03 00:42:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('187', '73662', 'vehicle01', '2011-06-06 14:22:00', '2011-07-06 00:17:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('188', '73662', 'vehicle01', '2011-07-06 14:17:00', '2011-08-06 00:12:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('189', '73662', 'vehicle01', '2011-09-06 14:17:00', '2011-10-06 00:19:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('190', '73662', 'vehicle01', '2013-03-06 15:07:00', '2013-04-06 01:22:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('191', '73662', 'vehicle01', '2013-04-06 15:22:00', '2013-05-06 01:19:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('192', '73662', 'vehicle01', '2011-01-07 15:07:00', '2011-02-07 01:24:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('193', '73662', 'vehicle01', '2013-02-07 15:05:00', '2013-03-07 01:19:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('194', '73662', 'vehicle01', '2013-07-07 14:21:00', '2011-01-08 00:14:00', '851', '851PM04');
INSERT INTO `t_schedule` VALUES ('195', '73662', 'vehicle05', '2012-08-02 14:58:00', '2012-09-02 00:39:00', '851', '851PM06');
INSERT INTO `t_schedule` VALUES ('196', '73662', 'vehicle05', '2012-03-03 15:17:00', '2012-04-03 00:26:00', '851', '851PM06');
INSERT INTO `t_schedule` VALUES ('197', '73662', 'vehicle05', '2012-04-03 15:17:00', '2012-05-03 00:55:00', '851', '851PM06');
INSERT INTO `t_schedule` VALUES ('198', '73662', 'vehicle05', '2012-05-03 15:17:00', '2012-06-03 00:50:00', '851', '851PM06');
INSERT INTO `t_schedule` VALUES ('199', '73662', 'vehicle05', '2012-08-06 15:31:00', '2012-09-06 00:46:00', '851', '851PM06');

-- ----------------------------
-- Table structure for `t_systemconfig`
-- ----------------------------
DROP TABLE IF EXISTS `t_systemconfig`;
CREATE TABLE `t_systemconfig` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `displayName` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_systemconfig
-- ----------------------------
INSERT INTO `t_systemconfig` VALUES ('3', 'system health daily report sending email list', 'SystemHealthDailyReportSendingEmailList', 'l.weiwei@163.com,lww2zhl@gmail.com');
INSERT INTO `t_systemconfig` VALUES ('4', 'auditing email sending list', 'AuditingEmailSendingList', 'l.weiwei@163.com,lww2zhl@gmail.com');
INSERT INTO `t_systemconfig` VALUES ('5', '99999999999999999999999999999999', '99999999999999999999999999999', '999999999999999999999999999999999');

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
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'user_1', 'user_1', 'admin', '1', null);
INSERT INTO `t_user` VALUES ('5', 'demos', 'user_3', 'user_3', 'default', '0', null);
INSERT INTO `t_user` VALUES ('6', 'user_4', 'user_4', 'user_4', 'default', '0', null);
INSERT INTO `t_user` VALUES ('8', 'weiwei2', 'heihhhhh', 'weiwei2', 'default', '0', null);
INSERT INTO `t_user` VALUES ('9', 'weiwei3', 'asldjfklasjf', 'weiwei3', 'default', '0', null);
INSERT INTO `t_user` VALUES ('12', 'xxdsaf', 'asdfsafd', 'gdffasdf', 'default', '0', null);
INSERT INTO `t_user` VALUES ('19', 'test', 'test', 'test', 'test', '0', null);

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
INSERT INTO `t_user_role` VALUES ('1', '6');
INSERT INTO `t_user_role` VALUES ('19', '6');
INSERT INTO `t_user_role` VALUES ('5', '6');
INSERT INTO `t_user_role` VALUES ('6', '6');
INSERT INTO `t_user_role` VALUES ('8', '6');
INSERT INTO `t_user_role` VALUES ('9', '6');
INSERT INTO `t_user_role` VALUES ('12', '6');
INSERT INTO `t_user_role` VALUES ('1', '5');

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
