/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50511
Source Host           : localhost:3306
Source Database       : vms_db

Target Server Type    : MYSQL
Target Server Version : 50511
File Encoding         : 65001

Date: 2012-07-12 18:55:53
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
) ENGINE=InnoDB AUTO_INCREMENT=1329 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_driver_report
-- ----------------------------
INSERT INTO `t_driver_report` VALUES ('1219', '0', '2012-07-10 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-10 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '1', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1220', '0', '2012-07-10 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-10 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '2', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1221', '0', '2012-07-10 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-10 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '3', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1222', '0', '2012-07-10 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-10 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '4', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1223', '0', '2012-07-10 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-10 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '8', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1224', '0', '2012-07-10 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-10 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '9', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1225', '0', '2012-07-10 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-10 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '10', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1226', '0', '2012-07-10 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-10 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '11', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1227', '0', '2012-07-10 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-10 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '12', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1228', '0', '2012-07-10 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-10 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '13', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1229', '0', '2012-07-10 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-10 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '14', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1230', '0', '2012-07-10 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-10 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '15', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1231', '0', '2012-07-10 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-10 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '16', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1232', '0', '2012-07-10 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-10 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '17', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1233', '0', '2012-07-10 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-10 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '18', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1234', '0', '2012-07-10 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-10 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '19', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1235', '0', '2012-07-10 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-10 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '20', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1236', '0', '2012-07-10 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-10 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '21', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1237', '0', '2012-07-10 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-10 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '22', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1238', '0', '2012-07-10 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-10 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '23', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1239', '0', '2012-07-10 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-10 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '24', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1240', '0', '2012-07-10 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-10 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '26', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1241', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '1', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1242', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '2', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1243', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '3', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1244', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '4', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1245', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '8', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1246', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '9', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1247', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '10', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1248', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '11', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1249', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '12', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1250', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '13', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1251', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '14', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1252', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '15', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1253', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '16', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1254', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '17', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1255', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '18', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1256', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '19', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1257', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '20', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1258', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '21', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1259', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '22', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1260', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '23', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1261', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '24', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1262', '0', '2012-07-15 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-09 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'weekly', '26', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1263', '399397', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '1', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1264', '748627', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '2', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1265', '161855', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '3', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1266', '1285060', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '4', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1267', '248270', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '8', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1268', '773877', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '9', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1269', '1457890', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '10', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1270', '1198700', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '11', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1271', '147512', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '12', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1272', '680323', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '13', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1273', '75535', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '14', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1274', '2581140', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '15', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1275', '1889950', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '16', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1276', '2062760', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '17', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1277', '593962', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '18', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1278', '766769', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '19', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1279', '1976380', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '20', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1280', '0', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '21', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1281', '0', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '22', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1282', '680397', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '23', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1283', '2045550', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '24', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1284', '0', '2012-06-30 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-06-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'monthly', '26', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1285', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '1', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1286', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '2', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1287', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '3', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1288', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '4', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1289', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '8', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1290', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '9', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1291', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '10', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1292', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '11', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1293', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '12', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1294', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '13', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1295', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '14', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1296', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '15', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1297', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '16', null, '98', '1', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1298', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '17', null, '100', '0', '100', '98');
INSERT INTO `t_driver_report` VALUES ('1299', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '18', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1300', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '19', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1301', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '20', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1302', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '21', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1303', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '22', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1304', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '1', '1', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '23', null, '96', '1', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1305', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '24', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1306', '0', '2011-12-31 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2011-01-01 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'yearly', '26', null, '100', '0', '0', '0');
INSERT INTO `t_driver_report` VALUES ('1307', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '1', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1308', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '2', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1309', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '3', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1310', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '4', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1311', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '8', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1312', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '9', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1313', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '10', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1314', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '11', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1315', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '12', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1316', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '13', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1317', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '14', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1318', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '15', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1319', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '16', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1320', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '17', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1321', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '18', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1322', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '19', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1323', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '20', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1324', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '21', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1325', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '22', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1326', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '23', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1327', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '24', null, '100', '0', '100', '100');
INSERT INTO `t_driver_report` VALUES ('1328', '0', '2012-07-11 23:59:59', '0', '0', '0', '', '0', '0', '0', '0', '0', '2012-07-11 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'daily', '26', null, '100', '0', '0', '0');

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
INSERT INTO `t_event_record` VALUES ('3', 'xxxxx', '3', '2012-05-09 14:57:07', '341', '30157.030248655934', '30491.43855029164', '150', 'event-speeding', '1', '2');
INSERT INTO `t_event_record` VALUES ('4', 'xxfdds', '5', '2011-04-20 18:59:59', '1122', '34326.98701124093', '33399.50823299224', '200', 'event-speeding', '1', '2');
INSERT INTO `t_event_record` VALUES ('5', 'sfasfsf', '12', '2012-05-02 17:57:35', '3123', '36102.84347778058', '15826.84926458007', '120', 'event-sudden-braking', '2', '2');
INSERT INTO `t_event_record` VALUES ('6', 'xvxv', '23', '2012-05-08 20:01:12', '123', '30157.030248655934', '30491.43855029164', '125', 'event-speeding', '2', '2');
INSERT INTO `t_event_record` VALUES ('7', 'fffeee', '3', '2012-05-20 16:59:16', '42342', '30157.030248655934', '29191.01194041832', '34', 'event-sudden-right', '3', '2');
INSERT INTO `t_event_record` VALUES ('8', 'sdafsf', '2', '2012-05-30 17:57:33', '3423', '30491.43855029164', '30062.028758860608', '55', 'event-idle', '4', '2');
INSERT INTO `t_event_record` VALUES ('9', 'zzzzxxxx', '55', '2012-05-15 18:03:05', '654', '36162.84347778058', '32765.206346922685', '45', 'event-sudden-left', '3', '2');
INSERT INTO `t_event_record` VALUES ('10', 'asdfsaf', '23', '2012-05-15 16:10:29', '625', '36362.84347778058', '30062.028758860608', '32', 'event-sudden-acceleration', '5', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=3046754 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_gps_data
-- ----------------------------
INSERT INTO `t_gps_data` VALUES ('3046354', '2012-07-12 18:52:33', '3', '', '32104.53265099751', '34152.89559871428', '29', '2012-07-12 18:52:33', '2');
INSERT INTO `t_gps_data` VALUES ('3046355', '2012-07-12 18:52:33', '0', '', '36297.795947421444', '35474.759748317556', '23', '2012-07-12 18:52:33', '1');
INSERT INTO `t_gps_data` VALUES ('3046356', '2012-07-12 18:52:33', '0', '', '42488.12389662905', '32474.847480159176', '39', '2012-07-12 18:52:33', '4');
INSERT INTO `t_gps_data` VALUES ('3046357', '2012-07-12 18:52:33', '3', '', '34636.740259299215', '30335.58688059847', '20', '2012-07-12 18:52:33', '3');
INSERT INTO `t_gps_data` VALUES ('3046358', '2012-07-12 18:52:33', '0', '', '40500.12962128222', '22133.32357414161', '52', '2012-07-12 18:52:33', '5');
INSERT INTO `t_gps_data` VALUES ('3046359', '2012-07-12 18:52:33', '1', '', '36875.26161424912', '15865.169214757889', '23', '2012-07-12 18:52:33', '6');
INSERT INTO `t_gps_data` VALUES ('3046360', '2012-07-12 18:52:33', '0', '', '30950.920215987237', '33201.36776138377', '11', '2012-07-12 18:52:33', '001190251');
INSERT INTO `t_gps_data` VALUES ('3046361', '2012-07-12 18:52:33', '1', '', '31083.91719062456', '36607.79208660759', '89', '2012-07-12 18:52:33', '001014182');
INSERT INTO `t_gps_data` VALUES ('3046362', '2012-07-12 18:52:33', '1', '', '33143.51364655856', '27445.22731112146', '8', '2012-07-12 18:52:33', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3046363', '2012-07-12 18:52:33', '3', '', '41909.50820743385', '20410.487615469247', '71', '2012-07-12 18:52:33', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3046364', '2012-07-12 18:52:33', '0', '', '40734.92748355953', '38598.002162660065', '14', '2012-07-12 18:52:33', '001001003');
INSERT INTO `t_gps_data` VALUES ('3046365', '2012-07-12 18:52:33', '1', '', '42685.365562123945', '35710.37225208647', '18', '2012-07-12 18:52:33', '001067110');
INSERT INTO `t_gps_data` VALUES ('3046366', '2012-07-12 18:52:33', '1', '', '31654.06376667906', '22850.842823806084', '73', '2012-07-12 18:52:33', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3046367', '2012-07-12 18:52:33', '0', '', '39572.786708996355', '15605.86142950297', '69', '2012-07-12 18:52:33', 'amk');
INSERT INTO `t_gps_data` VALUES ('3046368', '2012-07-12 18:52:33', '1', '', '32169.5798372039', '28405.772987683424', '73', '2012-07-12 18:52:33', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3046369', '2012-07-12 18:52:33', '2', '', '33825.40052118325', '31032.244440807994', '11', '2012-07-12 18:52:33', 'cck');
INSERT INTO `t_gps_data` VALUES ('3046370', '2012-07-12 18:52:33', '3', '', '34176.550255690665', '31601.62666131077', '26', '2012-07-12 18:52:33', 'clm');
INSERT INTO `t_gps_data` VALUES ('3046371', '2012-07-12 18:52:33', '1', '', '42557.38489224617', '15172.690721989', '29', '2012-07-12 18:52:33', 'hou');
INSERT INTO `t_gps_data` VALUES ('3046372', '2012-07-12 18:52:33', '3', '', '43923.47149177066', '38317.26903222262', '64', '2012-07-12 18:52:33', 'jur');
INSERT INTO `t_gps_data` VALUES ('3046373', '2012-07-12 18:52:33', '3', '', '37906.407431614374', '32341.087682970767', '47', '2012-07-12 18:52:33', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3046374', '2012-07-12 18:52:43', '3', '', '32056.364413429244', '34126.192597797286', '29', '2012-07-12 18:52:43', '2');
INSERT INTO `t_gps_data` VALUES ('3046375', '2012-07-12 18:52:43', '0', '', '36297.07663702011', '35414.458774066356', '23', '2012-07-12 18:52:43', '1');
INSERT INTO `t_gps_data` VALUES ('3046376', '2012-07-12 18:52:43', '0', '', '42471.12079287853', '32434.22064969927', '39', '2012-07-12 18:52:43', '4');
INSERT INTO `t_gps_data` VALUES ('3046377', '2012-07-12 18:52:43', '3', '', '34605.25386437938', '30328.058299781722', '20', '2012-07-12 18:52:43', '3');
INSERT INTO `t_gps_data` VALUES ('3046378', '2012-07-12 18:52:43', '0', '', '40494.53571272645', '22078.066894619406', '52', '2012-07-12 18:52:43', '5');
INSERT INTO `t_gps_data` VALUES ('3046379', '2012-07-12 18:52:43', '1', '', '36879.87826474501', '15903.307764291561', '23', '2012-07-12 18:52:43', '6');
INSERT INTO `t_gps_data` VALUES ('3046380', '2012-07-12 18:52:43', '0', '', '30932.67375398174', '33142.65184595365', '11', '2012-07-12 18:52:43', '001190251');
INSERT INTO `t_gps_data` VALUES ('3046381', '2012-07-12 18:52:43', '1', '', '31102.827908951625', '36663.62036688633', '89', '2012-07-12 18:52:43', '001014182');
INSERT INTO `t_gps_data` VALUES ('3046382', '2012-07-12 18:52:43', '1', '', '33162.787535189054', '27481.694437179427', '8', '2012-07-12 18:52:43', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3046383', '2012-07-12 18:52:43', '3', '', '41818.59464393714', '20394.549690443502', '71', '2012-07-12 18:52:43', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3046384', '2012-07-12 18:52:43', '0', '', '40724.932141031866', '38542.08662763218', '14', '2012-07-12 18:52:43', '001001003');
INSERT INTO `t_gps_data` VALUES ('3046385', '2012-07-12 18:52:43', '1', '', '42701.25774104176', '35774.105295949244', '18', '2012-07-12 18:52:43', '001067110');
INSERT INTO `t_gps_data` VALUES ('3046386', '2012-07-12 18:52:43', '1', '', '31669.077772998553', '22901.70757824599', '73', '2012-07-12 18:52:43', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3046387', '2012-07-12 18:52:43', '0', '', '39548.34596540076', '15515.030978269333', '69', '2012-07-12 18:52:43', 'amk');
INSERT INTO `t_gps_data` VALUES ('3046388', '2012-07-12 18:52:43', '1', '', '32197.26893229976', '28442.769129223154', '73', '2012-07-12 18:52:43', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3046389', '2012-07-12 18:52:43', '2', '', '33899.105255677896', '31056.51521932329', '11', '2012-07-12 18:52:43', 'cck');
INSERT INTO `t_gps_data` VALUES ('3046390', '2012-07-12 18:52:43', '3', '', '34130.36835546311', '31597.076169041844', '26', '2012-07-12 18:52:43', 'clm');
INSERT INTO `t_gps_data` VALUES ('3046391', '2012-07-12 18:52:43', '1', '', '42580.83800410249', '15264.871187251027', '29', '2012-07-12 18:52:43', 'hou');
INSERT INTO `t_gps_data` VALUES ('3046392', '2012-07-12 18:52:43', '3', '', '43848.984255667056', '38288.954472828664', '64', '2012-07-12 18:52:43', 'jur');
INSERT INTO `t_gps_data` VALUES ('3046393', '2012-07-12 18:52:44', '3', '', '37833.40861653121', '32321.45415218087', '47', '2012-07-12 18:52:44', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3046394', '2012-07-12 18:52:54', '3', '', '31957.199888828745', '34106.55389617676', '29', '2012-07-12 18:52:54', '2');
INSERT INTO `t_gps_data` VALUES ('3046395', '2012-07-12 18:52:54', '0', '', '36279.749752110714', '35376.1178495611', '23', '2012-07-12 18:52:54', '1');
INSERT INTO `t_gps_data` VALUES ('3046396', '2012-07-12 18:52:54', '0', '', '42443.42557559531', '32345.876839916185', '39', '2012-07-12 18:52:54', '4');
INSERT INTO `t_gps_data` VALUES ('3046397', '2012-07-12 18:52:54', '3', '', '34554.47265471464', '30311.04485078376', '20', '2012-07-12 18:52:54', '3');
INSERT INTO `t_gps_data` VALUES ('3046398', '2012-07-12 18:52:54', '0', '', '40477.29222349063', '22018.53895784804', '52', '2012-07-12 18:52:54', '5');
INSERT INTO `t_gps_data` VALUES ('3046399', '2012-07-12 18:52:54', '1', '', '36909.79250119908', '15941.69906096244', '23', '2012-07-12 18:52:54', '6');
INSERT INTO `t_gps_data` VALUES ('3046400', '2012-07-12 18:52:54', '0', '', '30923.87002326356', '33063.983429195396', '11', '2012-07-12 18:52:54', '001190251');
INSERT INTO `t_gps_data` VALUES ('3046401', '2012-07-12 18:52:54', '1', '', '31126.806084363776', '36715.48285957754', '89', '2012-07-12 18:52:54', '001014182');
INSERT INTO `t_gps_data` VALUES ('3046402', '2012-07-12 18:52:54', '1', '', '33166.3959691351', '27527.321698288808', '8', '2012-07-12 18:52:54', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3046403', '2012-07-12 18:52:54', '3', '', '41752.65108745102', '20376.20178275248', '71', '2012-07-12 18:52:54', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3046404', '2012-07-12 18:52:54', '0', '', '40696.893710465236', '38492.293886764666', '14', '2012-07-12 18:52:54', '001001003');
INSERT INTO `t_gps_data` VALUES ('3046405', '2012-07-12 18:52:54', '1', '', '42730.33700132346', '35847.38791323844', '18', '2012-07-12 18:52:54', '001067110');
INSERT INTO `t_gps_data` VALUES ('3046406', '2012-07-12 18:52:54', '1', '', '31689.18516195607', '22970.207191566842', '73', '2012-07-12 18:52:54', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3046407', '2012-07-12 18:52:54', '0', '', '39526.431808645306', '15470.00186498828', '69', '2012-07-12 18:52:54', 'amk');
INSERT INTO `t_gps_data` VALUES ('3046408', '2012-07-12 18:52:54', '1', '', '32199.001868888765', '28536.078816565598', '73', '2012-07-12 18:52:54', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3046409', '2012-07-12 18:52:54', '2', '', '33980.439027077686', '31065.552042546475', '11', '2012-07-12 18:52:54', 'cck');
INSERT INTO `t_gps_data` VALUES ('3046410', '2012-07-12 18:52:54', '3', '', '34046.58511926482', '31569.604867803926', '26', '2012-07-12 18:52:54', 'clm');
INSERT INTO `t_gps_data` VALUES ('3046411', '2012-07-12 18:52:54', '1', '', '42590.12329192704', '15300.611867511872', '29', '2012-07-12 18:52:54', 'hou');
INSERT INTO `t_gps_data` VALUES ('3046412', '2012-07-12 18:52:54', '3', '', '43816.63399595356', '38285.366757963355', '64', '2012-07-12 18:52:54', 'jur');
INSERT INTO `t_gps_data` VALUES ('3046413', '2012-07-12 18:52:54', '3', '', '37738.46640255325', '32304.912828506596', '47', '2012-07-12 18:52:54', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3046414', '2012-07-12 18:53:04', '3', '', '31921.48158224478', '34084.87134139017', '29', '2012-07-12 18:53:04', '2');
INSERT INTO `t_gps_data` VALUES ('3046415', '2012-07-12 18:53:04', '0', '', '36266.576862870636', '35335.41437615939', '23', '2012-07-12 18:53:04', '1');
INSERT INTO `t_gps_data` VALUES ('3046416', '2012-07-12 18:53:04', '0', '', '42437.99405106626', '32296.37024498879', '39', '2012-07-12 18:53:04', '4');
INSERT INTO `t_gps_data` VALUES ('3046417', '2012-07-12 18:53:04', '3', '', '34463.50297924583', '30298.031566267364', '20', '2012-07-12 18:53:04', '3');
INSERT INTO `t_gps_data` VALUES ('3046418', '2012-07-12 18:53:04', '0', '', '40474.487963601205', '21959.857608566566', '52', '2012-07-12 18:53:04', '5');
INSERT INTO `t_gps_data` VALUES ('3046419', '2012-07-12 18:53:04', '1', '', '36933.9550338411', '16002.240154686493', '23', '2012-07-12 18:53:04', '6');
INSERT INTO `t_gps_data` VALUES ('3046420', '2012-07-12 18:53:04', '0', '', '30914.669426745597', '33032.36238545124', '11', '2012-07-12 18:53:04', '001190251');
INSERT INTO `t_gps_data` VALUES ('3046421', '2012-07-12 18:53:04', '1', '', '31149.955706873166', '36790.541664081145', '89', '2012-07-12 18:53:04', '001014182');
INSERT INTO `t_gps_data` VALUES ('3046422', '2012-07-12 18:53:04', '1', '', '33193.07011579004', '27592.061009419485', '8', '2012-07-12 18:53:04', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3046423', '2012-07-12 18:53:04', '3', '', '41709.332976383565', '20346.451718729346', '71', '2012-07-12 18:53:04', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3046424', '2012-07-12 18:53:04', '0', '', '40691.52443879253', '38452.476389950876', '14', '2012-07-12 18:53:04', '001001003');
INSERT INTO `t_gps_data` VALUES ('3046425', '2012-07-12 18:53:04', '1', '', '42757.19596465398', '35905.60988975116', '18', '2012-07-12 18:53:04', '001067110');
INSERT INTO `t_gps_data` VALUES ('3046426', '2012-07-12 18:53:04', '1', '', '31709.10019025398', '23050.00034110913', '73', '2012-07-12 18:53:04', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3046427', '2012-07-12 18:53:04', '0', '', '39522.34126957703', '15409.83305747794', '69', '2012-07-12 18:53:04', 'amk');
INSERT INTO `t_gps_data` VALUES ('3046428', '2012-07-12 18:53:04', '1', '', '32205.687622800793', '28633.513661059627', '73', '2012-07-12 18:53:04', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3046429', '2012-07-12 18:53:04', '2', '', '34042.621204155344', '31093.674156446654', '11', '2012-07-12 18:53:04', 'cck');
INSERT INTO `t_gps_data` VALUES ('3046430', '2012-07-12 18:53:04', '3', '', '33959.7512935551', '31550.140601392715', '26', '2012-07-12 18:53:04', 'clm');
INSERT INTO `t_gps_data` VALUES ('3046431', '2012-07-12 18:53:04', '1', '', '42603.770229901245', '15333.711276744543', '29', '2012-07-12 18:53:04', 'hou');
INSERT INTO `t_gps_data` VALUES ('3046432', '2012-07-12 18:53:04', '3', '', '43764.30744754758', '38259.00691830804', '64', '2012-07-12 18:53:04', 'jur');
INSERT INTO `t_gps_data` VALUES ('3046433', '2012-07-12 18:53:04', '3', '', '37655.20756267357', '32292.941068472242', '47', '2012-07-12 18:53:04', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3046434', '2012-07-12 18:53:14', '3', '', '31845.95738198945', '34056.253168218704', '29', '2012-07-12 18:53:14', '2');
INSERT INTO `t_gps_data` VALUES ('3046435', '2012-07-12 18:53:14', '0', '', '36237.05621804685', '35259.32045414922', '23', '2012-07-12 18:53:14', '1');
INSERT INTO `t_gps_data` VALUES ('3046436', '2012-07-12 18:53:14', '0', '', '42430.05344317369', '32214.22460396677', '39', '2012-07-12 18:53:14', '4');
INSERT INTO `t_gps_data` VALUES ('3046437', '2012-07-12 18:53:14', '3', '', '34378.57995358249', '30282.517161310945', '20', '2012-07-12 18:53:14', '3');
INSERT INTO `t_gps_data` VALUES ('3046438', '2012-07-12 18:53:14', '0', '', '40461.723986866455', '21919.83906695651', '52', '2012-07-12 18:53:14', '5');
INSERT INTO `t_gps_data` VALUES ('3046439', '2012-07-12 18:53:14', '1', '', '36934.50860310156', '16070.239021049942', '23', '2012-07-12 18:53:14', '6');
INSERT INTO `t_gps_data` VALUES ('3046440', '2012-07-12 18:53:14', '0', '', '30887.60836659974', '32949.96969098605', '11', '2012-07-12 18:53:14', '001190251');
INSERT INTO `t_gps_data` VALUES ('3046441', '2012-07-12 18:53:14', '1', '', '31160.690567056343', '36867.538394710515', '89', '2012-07-12 18:53:14', '001014182');
INSERT INTO `t_gps_data` VALUES ('3046442', '2012-07-12 18:53:14', '1', '', '33214.44525574173', '27674.486442053298', '8', '2012-07-12 18:53:14', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3046443', '2012-07-12 18:53:14', '3', '', '41625.241342091176', '20319.482399704524', '71', '2012-07-12 18:53:14', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3046444', '2012-07-12 18:53:14', '0', '', '40677.265803034185', '38414.99082050192', '14', '2012-07-12 18:53:14', '001001003');
INSERT INTO `t_gps_data` VALUES ('3046445', '2012-07-12 18:53:14', '1', '', '42786.967254292686', '35978.338132365694', '18', '2012-07-12 18:53:14', '001067110');
INSERT INTO `t_gps_data` VALUES ('3046446', '2012-07-12 18:53:14', '1', '', '31728.030290322822', '23135.040116216536', '73', '2012-07-12 18:53:14', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3046447', '2012-07-12 18:53:14', '0', '', '39509.08657366512', '15349.618324943425', '69', '2012-07-12 18:53:14', 'amk');
INSERT INTO `t_gps_data` VALUES ('3046448', '2012-07-12 18:53:14', '1', '', '32217.978225739695', '28670.45856190862', '73', '2012-07-12 18:53:14', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3046449', '2012-07-12 18:53:14', '2', '', '34121.85717462438', '31111.984918579208', '11', '2012-07-12 18:53:14', 'cck');
INSERT INTO `t_gps_data` VALUES ('3046450', '2012-07-12 18:53:14', '3', '', '33920.57357246347', '31542.056117172684', '26', '2012-07-12 18:53:14', 'clm');
INSERT INTO `t_gps_data` VALUES ('3046451', '2012-07-12 18:53:14', '1', '', '42616.22557372101', '15364.387557186541', '29', '2012-07-12 18:53:14', 'hou');
INSERT INTO `t_gps_data` VALUES ('3046452', '2012-07-12 18:53:14', '3', '', '43710.348727299664', '38250.73732578865', '64', '2012-07-12 18:53:14', 'jur');
INSERT INTO `t_gps_data` VALUES ('3046453', '2012-07-12 18:53:14', '3', '', '37602.909455429704', '32281.558933052842', '47', '2012-07-12 18:53:14', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3046454', '2012-07-12 18:53:24', '3', '', '31746.73545811645', '34047.88480664327', '29', '2012-07-12 18:53:24', '2');
INSERT INTO `t_gps_data` VALUES ('3046455', '2012-07-12 18:53:24', '0', '', '36212.247690757045', '35168.279338650835', '23', '2012-07-12 18:53:24', '1');
INSERT INTO `t_gps_data` VALUES ('3046456', '2012-07-12 18:53:24', '0', '', '42414.97629138647', '32145.610601161494', '39', '2012-07-12 18:53:24', '4');
INSERT INTO `t_gps_data` VALUES ('3046457', '2012-07-12 18:53:24', '3', '', '34331.109038627525', '30260.436198277403', '20', '2012-07-12 18:53:24', '3');
INSERT INTO `t_gps_data` VALUES ('3046458', '2012-07-12 18:53:24', '0', '', '40436.724835774425', '21847.330795669866', '52', '2012-07-12 18:53:24', '5');
INSERT INTO `t_gps_data` VALUES ('3046459', '2012-07-12 18:53:24', '1', '', '36944.18587374931', '16122.696763370379', '23', '2012-07-12 18:53:24', '6');
INSERT INTO `t_gps_data` VALUES ('3046460', '2012-07-12 18:53:24', '0', '', '30885.9412886478', '32892.84941275753', '11', '2012-07-12 18:53:24', '001190251');
INSERT INTO `t_gps_data` VALUES ('3046461', '2012-07-12 18:53:24', '1', '', '31179.52866903345', '36959.307130023895', '89', '2012-07-12 18:53:24', '001014182');
INSERT INTO `t_gps_data` VALUES ('3046462', '2012-07-12 18:53:24', '1', '', '33234.88628386223', '27716.332044127612', '8', '2012-07-12 18:53:24', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3046463', '2012-07-12 18:53:24', '3', '', '41579.53039585545', '20309.7800904133', '71', '2012-07-12 18:53:24', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3046464', '2012-07-12 18:53:24', '0', '', '40669.34674767758', '38341.21392777913', '14', '2012-07-12 18:53:24', '001001003');
INSERT INTO `t_gps_data` VALUES ('3046465', '2012-07-12 18:53:24', '1', '', '42813.29012449403', '36020.625740499236', '18', '2012-07-12 18:53:24', '001067110');
INSERT INTO `t_gps_data` VALUES ('3046466', '2012-07-12 18:53:24', '1', '', '31728.848056358496', '23179.755935176156', '73', '2012-07-12 18:53:24', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3046467', '2012-07-12 18:53:24', '0', '', '39497.46736096433', '15319.60022418826', '69', '2012-07-12 18:53:24', 'amk');
INSERT INTO `t_gps_data` VALUES ('3046468', '2012-07-12 18:53:24', '1', '', '32228.02686534254', '28710.413241548056', '73', '2012-07-12 18:53:24', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3046469', '2012-07-12 18:53:24', '2', '', '34175.963685503324', '31130.403976675316', '11', '2012-07-12 18:53:24', 'cck');
INSERT INTO `t_gps_data` VALUES ('3046470', '2012-07-12 18:53:24', '3', '', '33888.11689487078', '31531.461535029848', '26', '2012-07-12 18:53:24', 'clm');
INSERT INTO `t_gps_data` VALUES ('3046471', '2012-07-12 18:53:24', '1', '', '42620.31031405084', '15402.89424275488', '29', '2012-07-12 18:53:24', 'hou');
INSERT INTO `t_gps_data` VALUES ('3046472', '2012-07-12 18:53:24', '3', '', '43638.162181362124', '38248.920456933454', '64', '2012-07-12 18:53:24', 'jur');
INSERT INTO `t_gps_data` VALUES ('3046473', '2012-07-12 18:53:24', '3', '', '37519.71498733697', '32277.96044539604', '47', '2012-07-12 18:53:24', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3046474', '2012-07-12 18:53:34', '3', '', '31704.68073283804', '34028.321842648984', '29', '2012-07-12 18:53:34', '2');
INSERT INTO `t_gps_data` VALUES ('3046475', '2012-07-12 18:53:34', '0', '', '36196.15845837843', '35133.70603090226', '23', '2012-07-12 18:53:34', '1');
INSERT INTO `t_gps_data` VALUES ('3046476', '2012-07-12 18:53:34', '0', '', '42408.63624732376', '32054.54654477932', '39', '2012-07-12 18:53:34', '4');
INSERT INTO `t_gps_data` VALUES ('3046477', '2012-07-12 18:53:34', '3', '', '34264.62170248283', '30243.37555597126', '20', '2012-07-12 18:53:34', '3');
INSERT INTO `t_gps_data` VALUES ('3046478', '2012-07-12 18:53:34', '0', '', '40435.61120455755', '21814.45885131584', '52', '2012-07-12 18:53:34', '5');
INSERT INTO `t_gps_data` VALUES ('3046479', '2012-07-12 18:53:34', '1', '', '36946.42424397825', '16159.863570476542', '23', '2012-07-12 18:53:34', '6');
INSERT INTO `t_gps_data` VALUES ('3046480', '2012-07-12 18:53:34', '0', '', '30874.937269459177', '32796.29183608385', '11', '2012-07-12 18:53:34', '001190251');
INSERT INTO `t_gps_data` VALUES ('3046481', '2012-07-12 18:53:34', '1', '', '31197.87018458456', '37057.26325035372', '89', '2012-07-12 18:53:34', '001014182');
INSERT INTO `t_gps_data` VALUES ('3046482', '2012-07-12 18:53:34', '1', '', '33249.571015870795', '27758.09138241269', '8', '2012-07-12 18:53:34', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3046483', '2012-07-12 18:53:34', '3', '', '41518.199723808946', '20289.060932052373', '71', '2012-07-12 18:53:34', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3046484', '2012-07-12 18:53:34', '0', '', '40647.432144141494', '38275.96811082362', '14', '2012-07-12 18:53:34', '001001003');
INSERT INTO `t_gps_data` VALUES ('3046485', '2012-07-12 18:53:34', '1', '', '42838.020698250715', '36072.11646565862', '18', '2012-07-12 18:53:34', '001067110');
INSERT INTO `t_gps_data` VALUES ('3046486', '2012-07-12 18:53:34', '1', '', '31737.48484513179', '23241.94824780071', '73', '2012-07-12 18:53:34', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3046487', '2012-07-12 18:53:34', '0', '', '39487.00681714446', '15251.786088977007', '69', '2012-07-12 18:53:34', 'amk');
INSERT INTO `t_gps_data` VALUES ('3046488', '2012-07-12 18:53:34', '1', '', '32237.188258589867', '28793.573108961013', '73', '2012-07-12 18:53:34', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3046489', '2012-07-12 18:53:34', '2', '', '34244.33735915937', '31153.380343825564', '11', '2012-07-12 18:53:34', 'cck');
INSERT INTO `t_gps_data` VALUES ('3046490', '2012-07-12 18:53:34', '3', '', '33806.535082851864', '31527.716872846013', '26', '2012-07-12 18:53:34', 'clm');
INSERT INTO `t_gps_data` VALUES ('3046491', '2012-07-12 18:53:34', '1', '', '42623.578140926824', '15499.115517761413', '29', '2012-07-12 18:53:34', 'hou');
INSERT INTO `t_gps_data` VALUES ('3046492', '2012-07-12 18:53:34', '3', '', '43591.32003292177', '38232.5719953729', '64', '2012-07-12 18:53:34', 'jur');
INSERT INTO `t_gps_data` VALUES ('3046493', '2012-07-12 18:53:34', '3', '', '37459.42554226352', '32264.928625093668', '47', '2012-07-12 18:53:34', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3046494', '2012-07-12 18:53:44', '3', '', '31611.50738592867', '34026.39393774906', '29', '2012-07-12 18:53:44', '2');
INSERT INTO `t_gps_data` VALUES ('3046495', '2012-07-12 18:53:44', '0', '', '36192.482326691665', '35070.213001427364', '23', '2012-07-12 18:53:44', '1');
INSERT INTO `t_gps_data` VALUES ('3046496', '2012-07-12 18:53:44', '0', '', '42392.90855040291', '31967.823339519025', '39', '2012-07-12 18:53:44', '4');
INSERT INTO `t_gps_data` VALUES ('3046497', '2012-07-12 18:53:44', '3', '', '34180.5860659586', '30232.348436389933', '20', '2012-07-12 18:53:44', '3');
INSERT INTO `t_gps_data` VALUES ('3046498', '2012-07-12 18:53:44', '0', '', '40423.921572544634', '21714.948060879844', '52', '2012-07-12 18:53:44', '5');
INSERT INTO `t_gps_data` VALUES ('3046499', '2012-07-12 18:53:44', '1', '', '36960.99924362524', '16235.965405130346', '23', '2012-07-12 18:53:44', '6');
INSERT INTO `t_gps_data` VALUES ('3046500', '2012-07-12 18:53:44', '0', '', '30873.37921227578', '32728.25222834035', '11', '2012-07-12 18:53:44', '001190251');
INSERT INTO `t_gps_data` VALUES ('3046501', '2012-07-12 18:53:44', '1', '', '31198.43079290911', '37125.64818480535', '89', '2012-07-12 18:53:44', '001014182');
INSERT INTO `t_gps_data` VALUES ('3046502', '2012-07-12 18:53:44', '1', '', '33256.244593813615', '27833.706252782427', '8', '2012-07-12 18:53:44', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3046503', '2012-07-12 18:53:44', '3', '', '41468.459344086354', '20267.78723374976', '71', '2012-07-12 18:53:44', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3046504', '2012-07-12 18:53:44', '0', '', '40640.6560321615', '38230.26140135102', '14', '2012-07-12 18:53:44', '001001003');
INSERT INTO `t_gps_data` VALUES ('3046505', '2012-07-12 18:53:44', '1', '', '42846.58665405048', '36106.681111953825', '18', '2012-07-12 18:53:44', '001067110');
INSERT INTO `t_gps_data` VALUES ('3046506', '2012-07-12 18:53:44', '1', '', '31762.65507408689', '23277.062359083597', '73', '2012-07-12 18:53:44', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3046507', '2012-07-12 18:53:44', '0', '', '39469.44071862106', '15182.124845799792', '69', '2012-07-12 18:53:44', 'amk');
INSERT INTO `t_gps_data` VALUES ('3046508', '2012-07-12 18:53:44', '1', '', '32266.248342843133', '28856.002630021427', '73', '2012-07-12 18:53:44', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3046509', '2012-07-12 18:53:44', '2', '', '34299.592049014704', '31155.314385493348', '11', '2012-07-12 18:53:44', 'cck');
INSERT INTO `t_gps_data` VALUES ('3046510', '2012-07-12 18:53:44', '3', '', '33754.92761104706', '31512.773000973746', '26', '2012-07-12 18:53:44', 'clm');
INSERT INTO `t_gps_data` VALUES ('3046511', '2012-07-12 18:53:44', '1', '', '42635.70263373598', '15595.350668784922', '29', '2012-07-12 18:53:44', 'hou');
INSERT INTO `t_gps_data` VALUES ('3046512', '2012-07-12 18:53:44', '3', '', '43514.19373099743', '38207.939066905936', '64', '2012-07-12 18:53:44', 'jur');
INSERT INTO `t_gps_data` VALUES ('3046513', '2012-07-12 18:53:44', '3', '', '37394.619137887545', '32256.629937165486', '47', '2012-07-12 18:53:44', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3046514', '2012-07-12 18:53:54', '3', '', '31578.7796915779', '34016.6347422875', '29', '2012-07-12 18:53:54', '2');
INSERT INTO `t_gps_data` VALUES ('3046515', '2012-07-12 18:53:54', '0', '', '36175.110221180046', '35017.9228260927', '23', '2012-07-12 18:53:54', '1');
INSERT INTO `t_gps_data` VALUES ('3046516', '2012-07-12 18:53:54', '0', '', '42377.07710105883', '31919.03883076056', '39', '2012-07-12 18:53:54', '4');
INSERT INTO `t_gps_data` VALUES ('3046517', '2012-07-12 18:53:54', '3', '', '34101.4055380804', '30231.068472443378', '20', '2012-07-12 18:53:54', '3');
INSERT INTO `t_gps_data` VALUES ('3046518', '2012-07-12 18:53:54', '0', '', '40405.352821891516', '21640.690674024314', '52', '2012-07-12 18:53:54', '5');
INSERT INTO `t_gps_data` VALUES ('3046519', '2012-07-12 18:53:54', '1', '', '36974.939206466785', '16317.50789166443', '23', '2012-07-12 18:53:54', '6');
INSERT INTO `t_gps_data` VALUES ('3046520', '2012-07-12 18:53:54', '0', '', '30861.336258267587', '32644.477006377885', '11', '2012-07-12 18:53:54', '001190251');
INSERT INTO `t_gps_data` VALUES ('3046521', '2012-07-12 18:53:54', '1', '', '31204.267089373705', '37223.4300188734', '89', '2012-07-12 18:53:54', '001014182');
INSERT INTO `t_gps_data` VALUES ('3046522', '2012-07-12 18:53:54', '1', '', '33274.248300070474', '27914.274741206435', '8', '2012-07-12 18:53:54', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3046523', '2012-07-12 18:53:54', '3', '', '41407.105215292846', '20263.24380927641', '71', '2012-07-12 18:53:54', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3046524', '2012-07-12 18:53:54', '0', '', '40619.64289821914', '38195.67086874561', '14', '2012-07-12 18:53:54', '001001003');
INSERT INTO `t_gps_data` VALUES ('3046525', '2012-07-12 18:53:54', '1', '', '42852.8977212482', '36165.07295139026', '18', '2012-07-12 18:53:54', '001067110');
INSERT INTO `t_gps_data` VALUES ('3046526', '2012-07-12 18:53:54', '1', '', '31783.053038396243', '23343.022311555153', '73', '2012-07-12 18:53:54', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3046527', '2012-07-12 18:53:54', '0', '', '39459.91113967408', '15139.3515271431', '69', '2012-07-12 18:53:54', 'amk');
INSERT INTO `t_gps_data` VALUES ('3046528', '2012-07-12 18:53:54', '1', '', '32282.542433370716', '28934.444615639062', '73', '2012-07-12 18:53:54', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3046529', '2012-07-12 18:53:54', '2', '', '34372.250315734025', '31159.388565437148', '11', '2012-07-12 18:53:54', 'cck');
INSERT INTO `t_gps_data` VALUES ('3046530', '2012-07-12 18:53:54', '3', '', '33703.62641928871', '31512.749676404404', '26', '2012-07-12 18:53:54', 'clm');
INSERT INTO `t_gps_data` VALUES ('3046531', '2012-07-12 18:53:54', '1', '', '42640.39086845905', '15692.641812759985', '29', '2012-07-12 18:53:54', 'hou');
INSERT INTO `t_gps_data` VALUES ('3046532', '2012-07-12 18:53:54', '3', '', '43449.069461105195', '38185.597761391466', '64', '2012-07-12 18:53:54', 'jur');
INSERT INTO `t_gps_data` VALUES ('3046533', '2012-07-12 18:53:54', '3', '', '37330.58437078956', '32233.35701152475', '47', '2012-07-12 18:53:54', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3046534', '2012-07-12 18:54:04', '3', '', '31530.59956528512', '33998.53615990253', '29', '2012-07-12 18:54:04', '2');
INSERT INTO `t_gps_data` VALUES ('3046535', '2012-07-12 18:54:04', '0', '', '36150.690142447005', '34984.027369199066', '23', '2012-07-12 18:54:04', '1');
INSERT INTO `t_gps_data` VALUES ('3046536', '2012-07-12 18:54:04', '0', '', '42356.513489318335', '31831.930138042902', '39', '2012-07-12 18:54:04', '4');
INSERT INTO `t_gps_data` VALUES ('3046537', '2012-07-12 18:54:04', '3', '', '34067.947538327506', '30230.83358190464', '20', '2012-07-12 18:54:04', '3');
INSERT INTO `t_gps_data` VALUES ('3046538', '2012-07-12 18:54:04', '0', '', '40403.67356860966', '21592.9307832712', '52', '2012-07-12 18:54:04', '5');
INSERT INTO `t_gps_data` VALUES ('3046539', '2012-07-12 18:54:04', '1', '', '37003.20247498807', '16348.063981074127', '23', '2012-07-12 18:54:04', '6');
INSERT INTO `t_gps_data` VALUES ('3046540', '2012-07-12 18:54:04', '0', '', '30834.089793005445', '32595.77104776249', '11', '2012-07-12 18:54:04', '001190251');
INSERT INTO `t_gps_data` VALUES ('3046541', '2012-07-12 18:54:04', '1', '', '31225.60385792273', '37299.67871909497', '89', '2012-07-12 18:54:04', '001014182');
INSERT INTO `t_gps_data` VALUES ('3046542', '2012-07-12 18:54:04', '1', '', '33295.703817031485', '27983.991351835077', '8', '2012-07-12 18:54:04', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3046543', '2012-07-12 18:54:04', '3', '', '41355.853630567515', '20250.32806083865', '71', '2012-07-12 18:54:04', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3046544', '2012-07-12 18:54:04', '0', '', '40619.16135271389', '38132.668264564694', '14', '2012-07-12 18:54:04', '001001003');
INSERT INTO `t_gps_data` VALUES ('3046545', '2012-07-12 18:54:04', '1', '', '42869.354349516645', '36208.99241916473', '18', '2012-07-12 18:54:04', '001067110');
INSERT INTO `t_gps_data` VALUES ('3046546', '2012-07-12 18:54:04', '1', '', '31802.972900653935', '23415.12241025113', '73', '2012-07-12 18:54:04', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3046547', '2012-07-12 18:54:04', '0', '', '39454.901097487156', '15082.033166479521', '69', '2012-07-12 18:54:04', 'amk');
INSERT INTO `t_gps_data` VALUES ('3046548', '2012-07-12 18:54:04', '1', '', '32300.963675281604', '28968.128231212595', '73', '2012-07-12 18:54:04', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3046549', '2012-07-12 18:54:04', '2', '', '34445.92666005817', '31181.240559318187', '11', '2012-07-12 18:54:04', 'cck');
INSERT INTO `t_gps_data` VALUES ('3046550', '2012-07-12 18:54:04', '3', '', '33665.38720767871', '31493.194174270753', '26', '2012-07-12 18:54:04', 'clm');
INSERT INTO `t_gps_data` VALUES ('3046551', '2012-07-12 18:54:04', '1', '', '42648.318153781445', '15726.615781254182', '29', '2012-07-12 18:54:04', 'hou');
INSERT INTO `t_gps_data` VALUES ('3046552', '2012-07-12 18:54:04', '3', '', '43395.90938554842', '38183.0949688966', '64', '2012-07-12 18:54:04', 'jur');
INSERT INTO `t_gps_data` VALUES ('3046553', '2012-07-12 18:54:04', '3', '', '37245.464046783774', '32221.038153814523', '47', '2012-07-12 18:54:04', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3046554', '2012-07-12 18:54:14', '3', '', '31467.262924683764', '33973.67066248709', '29', '2012-07-12 18:54:14', '2');
INSERT INTO `t_gps_data` VALUES ('3046555', '2012-07-12 18:54:14', '0', '', '36147.856992820954', '34920.00888633843', '23', '2012-07-12 18:54:14', '1');
INSERT INTO `t_gps_data` VALUES ('3046556', '2012-07-12 18:54:14', '0', '', '42337.488897091214', '31732.261705000277', '39', '2012-07-12 18:54:14', '4');
INSERT INTO `t_gps_data` VALUES ('3046557', '2012-07-12 18:54:14', '3', '', '34013.29760034101', '30219.81739705009', '20', '2012-07-12 18:54:14', '3');
INSERT INTO `t_gps_data` VALUES ('3046558', '2012-07-12 18:54:14', '0', '', '40382.86559129246', '21500.713534125072', '52', '2012-07-12 18:54:14', '5');
INSERT INTO `t_gps_data` VALUES ('3046559', '2012-07-12 18:54:14', '1', '', '37028.5714235028', '16423.782742893844', '23', '2012-07-12 18:54:14', '6');
INSERT INTO `t_gps_data` VALUES ('3046560', '2012-07-12 18:54:14', '0', '', '30832.661049815648', '32518.83659382006', '11', '2012-07-12 18:54:14', '001190251');
INSERT INTO `t_gps_data` VALUES ('3046561', '2012-07-12 18:54:14', '1', '', '31250.134911276', '37333.58563734975', '89', '2012-07-12 18:54:14', '001014182');
INSERT INTO `t_gps_data` VALUES ('3046562', '2012-07-12 18:54:14', '1', '', '33297.949915700665', '28018.864587727112', '8', '2012-07-12 18:54:14', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3046563', '2012-07-12 18:54:14', '3', '', '41303.91341856639', '20222.59893041172', '71', '2012-07-12 18:54:14', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3046564', '2012-07-12 18:54:14', '0', '', '40612.15544238931', '38095.85770694523', '14', '2012-07-12 18:54:14', '001001003');
INSERT INTO `t_gps_data` VALUES ('3046565', '2012-07-12 18:54:14', '1', '', '42884.46596725629', '36257.76362134152', '18', '2012-07-12 18:54:14', '001067110');
INSERT INTO `t_gps_data` VALUES ('3046566', '2012-07-12 18:54:14', '1', '', '31804.368750194717', '23474.85477212552', '73', '2012-07-12 18:54:14', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3046567', '2012-07-12 18:54:14', '0', '', '39444.28900912104', '14996.79355455405', '69', '2012-07-12 18:54:14', 'amk');
INSERT INTO `t_gps_data` VALUES ('3046568', '2012-07-12 18:54:14', '1', '', '32303.04177853044', '29053.642119137457', '73', '2012-07-12 18:54:14', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3046569', '2012-07-12 18:54:14', '2', '', '34543.34994280618', '31203.711781404047', '11', '2012-07-12 18:54:14', 'cck');
INSERT INTO `t_gps_data` VALUES ('3046570', '2012-07-12 18:54:14', '3', '', '33626.239633750396', '31469.63792628329', '26', '2012-07-12 18:54:14', 'clm');
INSERT INTO `t_gps_data` VALUES ('3046571', '2012-07-12 18:54:14', '1', '', '42658.283117571795', '15817.597736262305', '29', '2012-07-12 18:54:14', 'hou');
INSERT INTO `t_gps_data` VALUES ('3046572', '2012-07-12 18:54:14', '3', '', '43316.51420781963', '38155.652548303355', '64', '2012-07-12 18:54:14', 'jur');
INSERT INTO `t_gps_data` VALUES ('3046573', '2012-07-12 18:54:14', '3', '', '37196.17772855879', '32212.674849661056', '47', '2012-07-12 18:54:14', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3046574', '2012-07-12 18:54:24', '3', '', '31403.85478654255', '33945.68247927386', '29', '2012-07-12 18:54:24', '2');
INSERT INTO `t_gps_data` VALUES ('3046575', '2012-07-12 18:54:24', '0', '', '36136.87803781868', '34869.11835653201', '23', '2012-07-12 18:54:24', '1');
INSERT INTO `t_gps_data` VALUES ('3046576', '2012-07-12 18:54:24', '0', '', '42310.21820392985', '31660.384518879706', '39', '2012-07-12 18:54:24', '4');
INSERT INTO `t_gps_data` VALUES ('3046577', '2012-07-12 18:54:24', '3', '', '33966.71998490772', '30194.912223271687', '20', '2012-07-12 18:54:24', '3');
INSERT INTO `t_gps_data` VALUES ('3046578', '2012-07-12 18:54:24', '0', '', '40368.560479011336', '21405.974967462298', '52', '2012-07-12 18:54:24', '5');
INSERT INTO `t_gps_data` VALUES ('3046579', '2012-07-12 18:54:24', '1', '', '37049.26041623323', '16455.887725282326', '23', '2012-07-12 18:54:24', '6');
INSERT INTO `t_gps_data` VALUES ('3046580', '2012-07-12 18:54:25', '0', '', '30805.57229963837', '32459.157911567996', '11', '2012-07-12 18:54:25', '001190251');
INSERT INTO `t_gps_data` VALUES ('3046581', '2012-07-12 18:54:25', '1', '', '31267.30632928483', '37381.179812698734', '89', '2012-07-12 18:54:25', '001014182');
INSERT INTO `t_gps_data` VALUES ('3046582', '2012-07-12 18:54:25', '1', '', '33307.932756948816', '28049.245918260174', '8', '2012-07-12 18:54:25', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3046583', '2012-07-12 18:54:25', '3', '', '41210.91298721762', '20222.12976344647', '71', '2012-07-12 18:54:25', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3046584', '2012-07-12 18:54:25', '0', '', '40600.50583862878', '38027.78156311763', '14', '2012-07-12 18:54:25', '001001003');
INSERT INTO `t_gps_data` VALUES ('3046585', '2012-07-12 18:54:25', '1', '', '42900.58969782578', '36312.61316502503', '18', '2012-07-12 18:54:25', '001067110');
INSERT INTO `t_gps_data` VALUES ('3046586', '2012-07-12 18:54:25', '1', '', '31820.244950877932', '23518.037608934246', '73', '2012-07-12 18:54:25', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3046587', '2012-07-12 18:54:25', '0', '', '39438.076590695775', '14915.045492827534', '69', '2012-07-12 18:54:25', 'amk');
INSERT INTO `t_gps_data` VALUES ('3046588', '2012-07-12 18:54:25', '1', '', '32304.406448629277', '29128.79867676141', '73', '2012-07-12 18:54:25', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3046589', '2012-07-12 18:54:25', '2', '', '34639.686688959606', '31232.138549480675', '11', '2012-07-12 18:54:25', 'cck');
INSERT INTO `t_gps_data` VALUES ('3046590', '2012-07-12 18:54:25', '3', '', '33550.08432288951', '31449.576901702032', '26', '2012-07-12 18:54:25', 'clm');
INSERT INTO `t_gps_data` VALUES ('3046591', '2012-07-12 18:54:25', '1', '', '42666.31238889904', '15871.031515079347', '29', '2012-07-12 18:54:25', 'hou');
INSERT INTO `t_gps_data` VALUES ('3046592', '2012-07-12 18:54:25', '3', '', '43242.32442675444', '38129.92505139156', '64', '2012-07-12 18:54:25', 'jur');
INSERT INTO `t_gps_data` VALUES ('3046593', '2012-07-12 18:54:25', '3', '', '37134.89423900432', '32183.380418435154', '47', '2012-07-12 18:54:25', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3046594', '2012-07-12 18:54:35', '3', '', '31366.295680464882', '33930.08312149605', '29', '2012-07-12 18:54:35', '2');
INSERT INTO `t_gps_data` VALUES ('3046595', '2012-07-12 18:54:35', '0', '', '36129.25814531359', '34799.77901458919', '23', '2012-07-12 18:54:35', '1');
INSERT INTO `t_gps_data` VALUES ('3046596', '2012-07-12 18:54:35', '0', '', '42296.56171206879', '31607.78463488105', '39', '2012-07-12 18:54:35', '4');
INSERT INTO `t_gps_data` VALUES ('3046597', '2012-07-12 18:54:35', '3', '', '33906.380441656176', '30178.293132265102', '20', '2012-07-12 18:54:35', '3');
INSERT INTO `t_gps_data` VALUES ('3046598', '2012-07-12 18:54:35', '0', '', '40353.35917644926', '21340.771121330097', '52', '2012-07-12 18:54:35', '5');
INSERT INTO `t_gps_data` VALUES ('3046599', '2012-07-12 18:54:35', '1', '', '37051.44983397072', '16499.40714572729', '23', '2012-07-12 18:54:35', '6');
INSERT INTO `t_gps_data` VALUES ('3046600', '2012-07-12 18:54:35', '0', '', '30798.251638216276', '32416.466829203186', '11', '2012-07-12 18:54:35', '001190251');
INSERT INTO `t_gps_data` VALUES ('3046601', '2012-07-12 18:54:35', '1', '', '31285.964256468626', '37456.11911565292', '89', '2012-07-12 18:54:35', '001014182');
INSERT INTO `t_gps_data` VALUES ('3046602', '2012-07-12 18:54:35', '1', '', '33320.26187784465', '28096.233764642708', '8', '2012-07-12 18:54:35', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3046603', '2012-07-12 18:54:35', '3', '', '41113.56959214931', '20212.697574269067', '71', '2012-07-12 18:54:35', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3046604', '2012-07-12 18:54:35', '0', '', '40573.583078011434', '37968.28087784981', '14', '2012-07-12 18:54:35', '001001003');
INSERT INTO `t_gps_data` VALUES ('3046605', '2012-07-12 18:54:35', '1', '', '42901.965812729526', '36385.52663533969', '18', '2012-07-12 18:54:35', '001067110');
INSERT INTO `t_gps_data` VALUES ('3046606', '2012-07-12 18:54:35', '1', '', '31838.034207235258', '23555.365207403494', '73', '2012-07-12 18:54:35', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3046607', '2012-07-12 18:54:35', '0', '', '39425.09410067461', '14828.116032854325', '69', '2012-07-12 18:54:35', 'amk');
INSERT INTO `t_gps_data` VALUES ('3046608', '2012-07-12 18:54:35', '1', '', '32310.685989353897', '29197.763665444938', '73', '2012-07-12 18:54:35', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3046609', '2012-07-12 18:54:35', '2', '', '34733.36888038113', '31251.274984957163', '11', '2012-07-12 18:54:35', 'cck');
INSERT INTO `t_gps_data` VALUES ('3046610', '2012-07-12 18:54:35', '3', '', '33475.660608835875', '31444.61196085516', '26', '2012-07-12 18:54:35', 'clm');
INSERT INTO `t_gps_data` VALUES ('3046611', '2012-07-12 18:54:35', '1', '', '42671.923579748356', '15940.797187785382', '29', '2012-07-12 18:54:35', 'hou');
INSERT INTO `t_gps_data` VALUES ('3046612', '2012-07-12 18:54:35', '3', '', '43160.22940513263', '38128.05846757876', '64', '2012-07-12 18:54:35', 'jur');
INSERT INTO `t_gps_data` VALUES ('3046613', '2012-07-12 18:54:35', '3', '', '37084.85681581196', '32155.491530914747', '47', '2012-07-12 18:54:35', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3046614', '2012-07-12 18:54:45', '3', '', '31307.749906161753', '33917.661861631925', '29', '2012-07-12 18:54:45', '2');
INSERT INTO `t_gps_data` VALUES ('3046615', '2012-07-12 18:54:45', '0', '', '36122.82923022789', '34726.17486772421', '23', '2012-07-12 18:54:45', '1');
INSERT INTO `t_gps_data` VALUES ('3046616', '2012-07-12 18:54:45', '0', '', '42270.593915840385', '31526.7324315669', '39', '2012-07-12 18:54:45', '4');
INSERT INTO `t_gps_data` VALUES ('3046617', '2012-07-12 18:54:45', '3', '', '33808.779918854554', '30150.265633992087', '20', '2012-07-12 18:54:45', '3');
INSERT INTO `t_gps_data` VALUES ('3046618', '2012-07-12 18:54:45', '0', '', '40324.088148665396', '21279.866518347033', '52', '2012-07-12 18:54:45', '5');
INSERT INTO `t_gps_data` VALUES ('3046619', '2012-07-12 18:54:45', '1', '', '37067.703821029136', '16542.75422523305', '23', '2012-07-12 18:54:45', '6');
INSERT INTO `t_gps_data` VALUES ('3046620', '2012-07-12 18:54:45', '0', '', '30781.49149633808', '32364.18731401247', '11', '2012-07-12 18:54:45', '001190251');
INSERT INTO `t_gps_data` VALUES ('3046621', '2012-07-12 18:54:45', '1', '', '31307.763346482592', '37521.26707383853', '89', '2012-07-12 18:54:45', '001014182');
INSERT INTO `t_gps_data` VALUES ('3046622', '2012-07-12 18:54:45', '1', '', '33341.11710146588', '28138.594994273823', '8', '2012-07-12 18:54:45', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3046623', '2012-07-12 18:54:45', '3', '', '41057.757614794', '20183.454970591927', '71', '2012-07-12 18:54:45', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3046624', '2012-07-12 18:54:45', '0', '', '40562.24637056246', '37899.47000960426', '14', '2012-07-12 18:54:45', '001001003');
INSERT INTO `t_gps_data` VALUES ('3046625', '2012-07-12 18:54:45', '1', '', '42910.60531057193', '36457.558839488585', '18', '2012-07-12 18:54:45', '001067110');
INSERT INTO `t_gps_data` VALUES ('3046626', '2012-07-12 18:54:45', '1', '', '31847.874531780748', '23632.65802601058', '73', '2012-07-12 18:54:45', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3046627', '2012-07-12 18:54:45', '0', '', '39422.95621954548', '14757.775756168921', '69', '2012-07-12 18:54:45', 'amk');
INSERT INTO `t_gps_data` VALUES ('3046628', '2012-07-12 18:54:45', '1', '', '32323.068017974587', '29288.298555567195', '73', '2012-07-12 18:54:45', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3046629', '2012-07-12 18:54:45', '2', '', '34779.592613636225', '31265.20208755714', '11', '2012-07-12 18:54:45', 'cck');
INSERT INTO `t_gps_data` VALUES ('3046630', '2012-07-12 18:54:45', '3', '', '33438.007797905026', '31418.3192617551', '26', '2012-07-12 18:54:45', 'clm');
INSERT INTO `t_gps_data` VALUES ('3046631', '2012-07-12 18:54:45', '1', '', '42688.78265827914', '16038.447996275896', '29', '2012-07-12 18:54:45', 'hou');
INSERT INTO `t_gps_data` VALUES ('3046632', '2012-07-12 18:54:45', '3', '', '43089.97137104941', '38121.305643536536', '64', '2012-07-12 18:54:45', 'jur');
INSERT INTO `t_gps_data` VALUES ('3046633', '2012-07-12 18:54:45', '3', '', '37013.98355988927', '32137.74903894525', '47', '2012-07-12 18:54:45', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3046634', '2012-07-12 18:54:55', '3', '', '31270.29642933723', '33899.07901224814', '29', '2012-07-12 18:54:55', '2');
INSERT INTO `t_gps_data` VALUES ('3046635', '2012-07-12 18:54:55', '0', '', '36101.66985437036', '34676.33613299333', '23', '2012-07-12 18:54:55', '1');
INSERT INTO `t_gps_data` VALUES ('3046636', '2012-07-12 18:54:55', '0', '', '42243.91756394162', '31460.619415323436', '39', '2012-07-12 18:54:55', '4');
INSERT INTO `t_gps_data` VALUES ('3046637', '2012-07-12 18:54:55', '3', '', '33736.6697583533', '30132.354241477806', '20', '2012-07-12 18:54:55', '3');
INSERT INTO `t_gps_data` VALUES ('3046638', '2012-07-12 18:54:55', '0', '', '40308.26317098855', '21221.833283613076', '52', '2012-07-12 18:54:55', '5');
INSERT INTO `t_gps_data` VALUES ('3046639', '2012-07-12 18:54:55', '1', '', '37071.58826268561', '16631.574008606116', '23', '2012-07-12 18:54:55', '6');
INSERT INTO `t_gps_data` VALUES ('3046640', '2012-07-12 18:54:55', '0', '', '30752.902873975483', '32302.677854264883', '11', '2012-07-12 18:54:55', '001190251');
INSERT INTO `t_gps_data` VALUES ('3046641', '2012-07-12 18:54:55', '1', '', '31330.902926982795', '37558.669343809706', '89', '2012-07-12 18:54:55', '001014182');
INSERT INTO `t_gps_data` VALUES ('3046642', '2012-07-12 18:54:55', '1', '', '33366.18837520595', '28198.449566105584', '8', '2012-07-12 18:54:55', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3046643', '2012-07-12 18:54:55', '3', '', '40989.517094927316', '20183.15088671754', '71', '2012-07-12 18:54:55', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3046644', '2012-07-12 18:54:55', '0', '', '40558.90554571305', '37813.427759114835', '14', '2012-07-12 18:54:55', '001001003');
INSERT INTO `t_gps_data` VALUES ('3046645', '2012-07-12 18:54:55', '1', '', '42912.1064375099', '36508.35153763488', '18', '2012-07-12 18:54:55', '001067110');
INSERT INTO `t_gps_data` VALUES ('3046646', '2012-07-12 18:54:55', '1', '', '31869.003830352263', '23722.091723426147', '73', '2012-07-12 18:54:55', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3046647', '2012-07-12 18:54:55', '0', '', '39397.3057480419', '14668.460986346634', '69', '2012-07-12 18:54:55', 'amk');
INSERT INTO `t_gps_data` VALUES ('3046648', '2012-07-12 18:54:55', '1', '', '32348.866940405802', '29380.24620629606', '73', '2012-07-12 18:54:55', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3046649', '2012-07-12 18:54:55', '2', '', '34829.19434319831', '31280.263440714152', '11', '2012-07-12 18:54:55', 'cck');
INSERT INTO `t_gps_data` VALUES ('3046650', '2012-07-12 18:54:55', '3', '', '33348.2825470899', '31408.233989275283', '26', '2012-07-12 18:54:55', 'clm');
INSERT INTO `t_gps_data` VALUES ('3046651', '2012-07-12 18:54:55', '1', '', '42714.608995371826', '16079.948983713819', '29', '2012-07-12 18:54:55', 'hou');
INSERT INTO `t_gps_data` VALUES ('3046652', '2012-07-12 18:54:55', '3', '', '42996.05183888837', '38097.63028099322', '64', '2012-07-12 18:54:55', 'jur');
INSERT INTO `t_gps_data` VALUES ('3046653', '2012-07-12 18:54:55', '3', '', '36936.993735627446', '32111.338556303635', '47', '2012-07-12 18:54:55', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3046654', '2012-07-12 18:55:05', '3', '', '31183.725287466335', '33882.05042386918', '29', '2012-07-12 18:55:05', '2');
INSERT INTO `t_gps_data` VALUES ('3046655', '2012-07-12 18:55:05', '0', '', '36080.70462175035', '34586.95765580746', '23', '2012-07-12 18:55:05', '1');
INSERT INTO `t_gps_data` VALUES ('3046656', '2012-07-12 18:55:05', '0', '', '42225.16964223779', '31416.32022788704', '39', '2012-07-12 18:55:05', '4');
INSERT INTO `t_gps_data` VALUES ('3046657', '2012-07-12 18:55:05', '3', '', '33693.5655350371', '30119.34957880967', '20', '2012-07-12 18:55:05', '3');
INSERT INTO `t_gps_data` VALUES ('3046658', '2012-07-12 18:55:05', '0', '', '40285.706484412054', '21140.628393028634', '52', '2012-07-12 18:55:05', '5');
INSERT INTO `t_gps_data` VALUES ('3046659', '2012-07-12 18:55:05', '1', '', '37072.553993216294', '16722.917345627025', '23', '2012-07-12 18:55:05', '6');
INSERT INTO `t_gps_data` VALUES ('3046660', '2012-07-12 18:55:05', '0', '', '30727.89354616791', '32218.451023226007', '11', '2012-07-12 18:55:05', '001190251');
INSERT INTO `t_gps_data` VALUES ('3046661', '2012-07-12 18:55:05', '1', '', '31357.983359598762', '37598.421763102524', '89', '2012-07-12 18:55:05', '001014182');
INSERT INTO `t_gps_data` VALUES ('3046662', '2012-07-12 18:55:05', '1', '', '33369.88699661053', '28238.876829979083', '8', '2012-07-12 18:55:05', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3046663', '2012-07-12 18:55:05', '3', '', '40943.614128030145', '20182.19438087157', '71', '2012-07-12 18:55:05', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3046664', '2012-07-12 18:55:05', '0', '', '40536.83593718007', '37737.22859958141', '14', '2012-07-12 18:55:05', '001001003');
INSERT INTO `t_gps_data` VALUES ('3046665', '2012-07-12 18:55:05', '1', '', '42933.41886506781', '36595.21335077501', '18', '2012-07-12 18:55:05', '001067110');
INSERT INTO `t_gps_data` VALUES ('3046666', '2012-07-12 18:55:05', '1', '', '31884.3627768601', '23756.12333737382', '73', '2012-07-12 18:55:05', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3046667', '2012-07-12 18:55:05', '0', '', '39384.978857489456', '14610.368526295446', '69', '2012-07-12 18:55:05', 'amk');
INSERT INTO `t_gps_data` VALUES ('3046668', '2012-07-12 18:55:05', '1', '', '32372.63348758651', '29416.46002903642', '73', '2012-07-12 18:55:05', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3046669', '2012-07-12 18:55:05', '2', '', '34900.94371088747', '31284.19214780672', '11', '2012-07-12 18:55:05', 'cck');
INSERT INTO `t_gps_data` VALUES ('3046670', '2012-07-12 18:55:05', '3', '', '33316.977278535094', '31402.29523383156', '26', '2012-07-12 18:55:05', 'clm');
INSERT INTO `t_gps_data` VALUES ('3046671', '2012-07-12 18:55:05', '1', '', '42723.34235204798', '16135.438600543044', '29', '2012-07-12 18:55:05', 'hou');
INSERT INTO `t_gps_data` VALUES ('3046672', '2012-07-12 18:55:05', '3', '', '42913.47335004987', '38093.720387740905', '64', '2012-07-12 18:55:05', 'jur');
INSERT INTO `t_gps_data` VALUES ('3046673', '2012-07-12 18:55:05', '3', '', '36893.23378089732', '32093.57235037486', '47', '2012-07-12 18:55:05', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3046674', '2012-07-12 18:55:15', '3', '', '31088.684611073397', '33876.697851656114', '29', '2012-07-12 18:55:15', '2');
INSERT INTO `t_gps_data` VALUES ('3046675', '2012-07-12 18:55:15', '0', '', '36061.57268520074', '34549.52125183632', '23', '2012-07-12 18:55:15', '1');
INSERT INTO `t_gps_data` VALUES ('3046676', '2012-07-12 18:55:15', '0', '', '42196.26779556032', '31361.1954067924', '39', '2012-07-12 18:55:15', '4');
INSERT INTO `t_gps_data` VALUES ('3046677', '2012-07-12 18:55:15', '3', '', '33602.337192610175', '30110.53064678257', '20', '2012-07-12 18:55:15', '3');
INSERT INTO `t_gps_data` VALUES ('3046678', '2012-07-12 18:55:15', '0', '', '40260.033038602225', '21050.213954497707', '52', '2012-07-12 18:55:15', '5');
INSERT INTO `t_gps_data` VALUES ('3046679', '2012-07-12 18:55:15', '1', '', '37100.726679195075', '16769.46548987515', '23', '2012-07-12 18:55:15', '6');
INSERT INTO `t_gps_data` VALUES ('3046680', '2012-07-12 18:55:15', '0', '', '30722.105816402018', '32157.015881732106', '11', '2012-07-12 18:55:15', '001190251');
INSERT INTO `t_gps_data` VALUES ('3046681', '2012-07-12 18:55:15', '1', '', '31384.301807189942', '37667.365055132876', '89', '2012-07-12 18:55:15', '001014182');
INSERT INTO `t_gps_data` VALUES ('3046682', '2012-07-12 18:55:15', '1', '', '33397.16215352577', '28333.76441062917', '8', '2012-07-12 18:55:15', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3046683', '2012-07-12 18:55:15', '3', '', '40901.45327016291', '20166.497641512415', '71', '2012-07-12 18:55:15', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3046684', '2012-07-12 18:55:15', '0', '', '40519.627320280524', '37702.38650780311', '14', '2012-07-12 18:55:15', '001001003');
INSERT INTO `t_gps_data` VALUES ('3046685', '2012-07-12 18:55:15', '1', '', '42952.03320810921', '36674.716548434575', '18', '2012-07-12 18:55:15', '001067110');
INSERT INTO `t_gps_data` VALUES ('3046686', '2012-07-12 18:55:15', '1', '', '31892.855757841353', '23849.8053826936', '73', '2012-07-12 18:55:15', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3046687', '2012-07-12 18:55:15', '0', '', '39372.68721228571', '14579.599870742048', '69', '2012-07-12 18:55:15', 'amk');
INSERT INTO `t_gps_data` VALUES ('3046688', '2012-07-12 18:55:15', '1', '', '32379.83658414593', '29466.244900110454', '73', '2012-07-12 18:55:15', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3046689', '2012-07-12 18:55:15', '2', '', '34951.08142241576', '31298.63233016633', '11', '2012-07-12 18:55:15', 'cck');
INSERT INTO `t_gps_data` VALUES ('3046690', '2012-07-12 18:55:15', '3', '', '33238.241477730204', '31384.08498377187', '26', '2012-07-12 18:55:15', 'clm');
INSERT INTO `t_gps_data` VALUES ('3046691', '2012-07-12 18:55:15', '1', '', '42750.12567584379', '16211.944540615948', '29', '2012-07-12 18:55:15', 'hou');
INSERT INTO `t_gps_data` VALUES ('3046692', '2012-07-12 18:55:15', '3', '', '42822.07491236673', '38063.78817198376', '64', '2012-07-12 18:55:15', 'jur');
INSERT INTO `t_gps_data` VALUES ('3046693', '2012-07-12 18:55:15', '3', '', '36859.956668608465', '32080.276210584692', '47', '2012-07-12 18:55:15', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3046694', '2012-07-12 18:55:25', '3', '', '30997.549142282223', '33854.696310944346', '29', '2012-07-12 18:55:25', '2');
INSERT INTO `t_gps_data` VALUES ('3046695', '2012-07-12 18:55:25', '0', '', '36041.628346036596', '34475.860355701334', '23', '2012-07-12 18:55:25', '1');
INSERT INTO `t_gps_data` VALUES ('3046696', '2012-07-12 18:55:25', '0', '', '42172.36535144391', '31305.721407049314', '39', '2012-07-12 18:55:25', '4');
INSERT INTO `t_gps_data` VALUES ('3046697', '2012-07-12 18:55:25', '3', '', '33557.015057323006', '30083.68061932525', '20', '2012-07-12 18:55:25', '3');
INSERT INTO `t_gps_data` VALUES ('3046698', '2012-07-12 18:55:25', '0', '', '40248.68747968958', '20988.937127474248', '52', '2012-07-12 18:55:25', '5');
INSERT INTO `t_gps_data` VALUES ('3046699', '2012-07-12 18:55:25', '1', '', '37112.718441741206', '16846.97408612693', '23', '2012-07-12 18:55:25', '6');
INSERT INTO `t_gps_data` VALUES ('3046700', '2012-07-12 18:55:25', '0', '', '30693.0199162862', '32075.16589872527', '11', '2012-07-12 18:55:25', '001190251');
INSERT INTO `t_gps_data` VALUES ('3046701', '2012-07-12 18:55:25', '1', '', '31406.300043738785', '37727.16897188996', '89', '2012-07-12 18:55:25', '001014182');
INSERT INTO `t_gps_data` VALUES ('3046702', '2012-07-12 18:55:25', '1', '', '33415.28265902868', '28376.570491404735', '8', '2012-07-12 18:55:25', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3046703', '2012-07-12 18:55:25', '3', '', '40845.64864008894', '20162.580397389727', '71', '2012-07-12 18:55:25', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3046704', '2012-07-12 18:55:25', '0', '', '40499.275867297736', '37665.70489582408', '14', '2012-07-12 18:55:25', '001001003');
INSERT INTO `t_gps_data` VALUES ('3046705', '2012-07-12 18:55:25', '1', '', '42977.433244665146', '36715.51335115976', '18', '2012-07-12 18:55:25', '001067110');
INSERT INTO `t_gps_data` VALUES ('3046706', '2012-07-12 18:55:25', '1', '', '31919.869485044896', '23937.120242394583', '73', '2012-07-12 18:55:25', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3046707', '2012-07-12 18:55:25', '0', '', '39348.69664610951', '14539.819011136706', '69', '2012-07-12 18:55:25', 'amk');
INSERT INTO `t_gps_data` VALUES ('3046708', '2012-07-12 18:55:25', '1', '', '32388.24671405927', '29558.836095454393', '73', '2012-07-12 18:55:25', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3046709', '2012-07-12 18:55:25', '2', '', '35021.38777475806', '31315.865982771673', '11', '2012-07-12 18:55:25', 'cck');
INSERT INTO `t_gps_data` VALUES ('3046710', '2012-07-12 18:55:25', '3', '', '33141.40727090905', '31370.547740092767', '26', '2012-07-12 18:55:25', 'clm');
INSERT INTO `t_gps_data` VALUES ('3046711', '2012-07-12 18:55:25', '1', '', '42778.76025159819', '16289.143760351286', '29', '2012-07-12 18:55:25', 'hou');
INSERT INTO `t_gps_data` VALUES ('3046712', '2012-07-12 18:55:25', '3', '', '42731.83916728218', '38033.90205309827', '64', '2012-07-12 18:55:25', 'jur');
INSERT INTO `t_gps_data` VALUES ('3046713', '2012-07-12 18:55:25', '3', '', '36811.18577664899', '32067.05919925886', '47', '2012-07-12 18:55:25', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3046714', '2012-07-12 18:55:35', '3', '', '30956.055303607245', '33825.46433820328', '29', '2012-07-12 18:55:35', '2');
INSERT INTO `t_gps_data` VALUES ('3046715', '2012-07-12 18:55:35', '0', '', '36021.31772760962', '34387.86681303754', '23', '2012-07-12 18:55:35', '1');
INSERT INTO `t_gps_data` VALUES ('3046716', '2012-07-12 18:55:35', '0', '', '42155.18652047334', '31235.23521902363', '39', '2012-07-12 18:55:35', '4');
INSERT INTO `t_gps_data` VALUES ('3046717', '2012-07-12 18:55:35', '3', '', '33497.90761476247', '30055.055583608155', '20', '2012-07-12 18:55:35', '3');
INSERT INTO `t_gps_data` VALUES ('3046718', '2012-07-12 18:55:35', '0', '', '40230.97030963103', '20903.898501477306', '52', '2012-07-12 18:55:35', '5');
INSERT INTO `t_gps_data` VALUES ('3046719', '2012-07-12 18:55:35', '1', '', '37133.115917233925', '16924.032756819906', '23', '2012-07-12 18:55:35', '6');
INSERT INTO `t_gps_data` VALUES ('3046720', '2012-07-12 18:55:35', '0', '', '30663.911618703845', '32029.623691697754', '11', '2012-07-12 18:55:35', '001190251');
INSERT INTO `t_gps_data` VALUES ('3046721', '2012-07-12 18:55:35', '1', '', '31423.48941833824', '37821.17358880045', '89', '2012-07-12 18:55:35', '001014182');
INSERT INTO `t_gps_data` VALUES ('3046722', '2012-07-12 18:55:35', '1', '', '33420.6725970372', '28419.98725456884', '8', '2012-07-12 18:55:35', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3046723', '2012-07-12 18:55:35', '3', '', '40766.25857893728', '20157.52450386254', '71', '2012-07-12 18:55:35', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3046724', '2012-07-12 18:55:35', '0', '', '40482.64791353083', '37589.21574511634', '14', '2012-07-12 18:55:35', '001001003');
INSERT INTO `t_gps_data` VALUES ('3046725', '2012-07-12 18:55:35', '1', '', '42989.5481178646', '36750.83572529791', '18', '2012-07-12 18:55:35', '001067110');
INSERT INTO `t_gps_data` VALUES ('3046726', '2012-07-12 18:55:35', '1', '', '31929.742655575', '24002.99930510187', '73', '2012-07-12 18:55:35', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3046727', '2012-07-12 18:55:35', '0', '', '39321.40356208833', '14443.493990099216', '69', '2012-07-12 18:55:35', 'amk');
INSERT INTO `t_gps_data` VALUES ('3046728', '2012-07-12 18:55:35', '1', '', '32392.689633714625', '29618.404821082077', '73', '2012-07-12 18:55:35', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3046729', '2012-07-12 18:55:35', '2', '', '35074.541109115526', '31343.78285735704', '11', '2012-07-12 18:55:35', 'cck');
INSERT INTO `t_gps_data` VALUES ('3046730', '2012-07-12 18:55:35', '3', '', '33110.37368521688', '31367.706717188743', '26', '2012-07-12 18:55:35', 'clm');
INSERT INTO `t_gps_data` VALUES ('3046731', '2012-07-12 18:55:35', '1', '', '42780.458305983775', '16329.471050309274', '29', '2012-07-12 18:55:35', 'hou');
INSERT INTO `t_gps_data` VALUES ('3046732', '2012-07-12 18:55:35', '3', '', '42634.76203341492', '38031.395425696406', '64', '2012-07-12 18:55:35', 'jur');
INSERT INTO `t_gps_data` VALUES ('3046733', '2012-07-12 18:55:35', '3', '', '36743.097267185476', '32048.36021315717', '47', '2012-07-12 18:55:35', 'tpy');
INSERT INTO `t_gps_data` VALUES ('3046734', '2012-07-12 18:55:45', '3', '', '30858.96263103418', '33818.869053736154', '29', '2012-07-12 18:55:45', '2');
INSERT INTO `t_gps_data` VALUES ('3046735', '2012-07-12 18:55:45', '0', '', '36010.543832940464', '34333.45210058596', '23', '2012-07-12 18:55:45', '1');
INSERT INTO `t_gps_data` VALUES ('3046736', '2012-07-12 18:55:45', '0', '', '42148.079287858214', '31148.075222979744', '39', '2012-07-12 18:55:45', '4');
INSERT INTO `t_gps_data` VALUES ('3046737', '2012-07-12 18:55:45', '3', '', '33426.481691053305', '30038.235878735944', '20', '2012-07-12 18:55:45', '3');
INSERT INTO `t_gps_data` VALUES ('3046738', '2012-07-12 18:55:45', '0', '', '40203.65942352324', '20865.9062775665', '52', '2012-07-12 18:55:45', '5');
INSERT INTO `t_gps_data` VALUES ('3046739', '2012-07-12 18:55:45', '1', '', '37133.14225849504', '16988.124910222712', '23', '2012-07-12 18:55:45', '6');
INSERT INTO `t_gps_data` VALUES ('3046740', '2012-07-12 18:55:45', '0', '', '30639.233718634525', '31996.40679026319', '11', '2012-07-12 18:55:45', '001190251');
INSERT INTO `t_gps_data` VALUES ('3046741', '2012-07-12 18:55:45', '1', '', '31450.117928400345', '37860.546897945314', '89', '2012-07-12 18:55:45', '001014182');
INSERT INTO `t_gps_data` VALUES ('3046742', '2012-07-12 18:55:45', '1', '', '33423.44318354602', '28497.742511234563', '8', '2012-07-12 18:55:45', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('3046743', '2012-07-12 18:55:45', '3', '', '40698.03234906524', '20138.13819851665', '71', '2012-07-12 18:55:45', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('3046744', '2012-07-12 18:55:45', '0', '', '40475.380630565196', '37517.554044092045', '14', '2012-07-12 18:55:45', '001001003');
INSERT INTO `t_gps_data` VALUES ('3046745', '2012-07-12 18:55:45', '1', '', '43011.74611908479', '36807.843719261175', '18', '2012-07-12 18:55:45', '001067110');
INSERT INTO `t_gps_data` VALUES ('3046746', '2012-07-12 18:55:45', '1', '', '31952.889282185355', '24082.464702344438', '73', '2012-07-12 18:55:45', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('3046747', '2012-07-12 18:55:45', '0', '', '39299.871163371885', '14383.248009143275', '69', '2012-07-12 18:55:45', 'amk');
INSERT INTO `t_gps_data` VALUES ('3046748', '2012-07-12 18:55:45', '1', '', '32406.162359863283', '29701.426805542556', '73', '2012-07-12 18:55:45', 'bbk');
INSERT INTO `t_gps_data` VALUES ('3046749', '2012-07-12 18:55:45', '2', '', '35104.59717374064', '31364.1432370147', '11', '2012-07-12 18:55:45', 'cck');
INSERT INTO `t_gps_data` VALUES ('3046750', '2012-07-12 18:55:45', '3', '', '33035.17007677124', '31340.84655624938', '26', '2012-07-12 18:55:45', 'clm');
INSERT INTO `t_gps_data` VALUES ('3046751', '2012-07-12 18:55:45', '1', '', '42797.24252164784', '16378.830673594037', '29', '2012-07-12 18:55:45', 'hou');
INSERT INTO `t_gps_data` VALUES ('3046752', '2012-07-12 18:55:45', '3', '', '42562.691892613526', '38026.497271066546', '64', '2012-07-12 18:55:45', 'jur');
INSERT INTO `t_gps_data` VALUES ('3046753', '2012-07-12 18:55:45', '3', '', '36665.60321533387', '32019.76251225147', '47', '2012-07-12 18:55:45', 'tpy');

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
  `content` varchar(255) DEFAULT NULL,
  `dateTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK68F78F947140EFE` (`user_id`),
  CONSTRAINT `FK68F78F947140EFE` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_log
-- ----------------------------

-- ----------------------------
-- Table structure for `t_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `uri` (`uri`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('1', 'create user info', 'user.add', 'users/create');
INSERT INTO `t_permission` VALUES ('2', 'create role info', 'role.add', 'roles/add');
INSERT INTO `t_permission` VALUES ('3', 'update user info', 'user.update', 'users/update');
INSERT INTO `t_permission` VALUES ('4', 'delete user info', 'user.delete', 'users/destory');
INSERT INTO `t_permission` VALUES ('5', 'update role info', 'role.update', 'roles/update');
INSERT INTO `t_permission` VALUES ('6', 'delete role info', 'role.delete', 'roles/destroy');

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
INSERT INTO `t_role_perm` VALUES ('4', '2');
INSERT INTO `t_role_perm` VALUES ('4', '1');
INSERT INTO `t_role_perm` VALUES ('4', '3');
INSERT INTO `t_role_perm` VALUES ('4', '4');
INSERT INTO `t_role_perm` VALUES ('4', '5');
INSERT INTO `t_role_perm` VALUES ('7', '2');
INSERT INTO `t_role_perm` VALUES ('7', '4');
INSERT INTO `t_role_perm` VALUES ('7', '5');
INSERT INTO `t_role_perm` VALUES ('6', '1');
INSERT INTO `t_role_perm` VALUES ('6', '2');
INSERT INTO `t_role_perm` VALUES ('6', '3');
INSERT INTO `t_role_perm` VALUES ('6', '4');
INSERT INTO `t_role_perm` VALUES ('6', '5');
INSERT INTO `t_role_perm` VALUES ('6', '6');
INSERT INTO `t_role_perm` VALUES ('1', '1');
INSERT INTO `t_role_perm` VALUES ('1', '2');
INSERT INTO `t_role_perm` VALUES ('1', '3');
INSERT INTO `t_role_perm` VALUES ('1', '4');
INSERT INTO `t_role_perm` VALUES ('1', '5');
INSERT INTO `t_role_perm` VALUES ('1', '6');

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'user_1', 'user_1', 'admin');
INSERT INTO `t_user` VALUES ('2', 'test', 'user_2', 'user_2', 'default');
INSERT INTO `t_user` VALUES ('5', 'demo', 'user_3', 'user_3', 'default');
INSERT INTO `t_user` VALUES ('6', 'user_4', 'user_4', 'user_4', 'default');

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
INSERT INTO `t_user_role` VALUES ('2', '4');
INSERT INTO `t_user_role` VALUES ('5', '4');
INSERT INTO `t_user_role` VALUES ('6', '4');
INSERT INTO `t_user_role` VALUES ('2', '7');
INSERT INTO `t_user_role` VALUES ('5', '7');
INSERT INTO `t_user_role` VALUES ('1', '6');
INSERT INTO `t_user_role` VALUES ('2', '6');
INSERT INTO `t_user_role` VALUES ('5', '6');
INSERT INTO `t_user_role` VALUES ('6', '6');

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

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
