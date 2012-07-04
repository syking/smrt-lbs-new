/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50511
Source Host           : localhost:3306
Source Database       : vms_db

Target Server Type    : MYSQL
Target Server Version : 50511
File Encoding         : 65001

Date: 2012-07-04 22:06:27
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_counsel
-- ----------------------------
INSERT INTO `t_counsel` VALUES ('1', '2012-05-03 20:30:53', 'sdfasdf', '2012-05-02 15:30:21', '3', '1');
INSERT INTO `t_counsel` VALUES ('2', '2012-05-24 00:00:00', 'asdfasdf', '2012-05-02 00:00:00', '2', '1');
INSERT INTO `t_counsel` VALUES ('3', '2012-05-24 00:00:00', 'zzzzzz', '2012-05-02 00:00:00', '4', '1');
INSERT INTO `t_counsel` VALUES ('4', '2012-05-24 00:00:00', 'ggggg', '2012-05-02 00:00:00', '1', '1');
INSERT INTO `t_counsel` VALUES ('5', '2012-07-11 03:30:50', '123123', '2012-07-04 02:00:00', '2', '1');
INSERT INTO `t_counsel` VALUES ('7', '2012-07-18 06:00:00', '李靖什么的', '2012-07-01 02:30:00', '23', '1');

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `number` (`number`),
  KEY `FK6494EA5314A2A29E` (`department_id`),
  CONSTRAINT `FK6494EA5314A2A29E` FOREIGN KEY (`department_id`) REFERENCES `t_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_driver
-- ----------------------------
INSERT INTO `t_driver` VALUES ('1', 'TEST1111', 'jack', '74689', '2');
INSERT INTO `t_driver` VALUES ('2', '222asdfasfdsf', 'tangseng', '74652', '2');
INSERT INTO `t_driver` VALUES ('3', '', 'zhulaoer', '74631', '3');
INSERT INTO `t_driver` VALUES ('4', 'jlk;jhkluy', 'xiaobai', '74571', '3');
INSERT INTO `t_driver` VALUES ('8', 'asdf', 'xiaohei', '74538', '4');
INSERT INTO `t_driver` VALUES ('9', 'sadf', 'xiaoji', '74498', '4');
INSERT INTO `t_driver` VALUES ('10', 'sf', 'xiaozhu', '74484', '6');
INSERT INTO `t_driver` VALUES ('11', 'sdf', 'dahei', '74483', '6');
INSERT INTO `t_driver` VALUES ('12', 'sdfs', 'dage', '74482', '7');
INSERT INTO `t_driver` VALUES ('13', 'dfsdfs', 'lixiaolong', '74423', '7');
INSERT INTO `t_driver` VALUES ('14', 'dfs', 'longwu', '74353', '8');
INSERT INTO `t_driver` VALUES ('15', 'df', 'zhanghanyun', '74291', '8');
INSERT INTO `t_driver` VALUES ('16', 'xv', 'chenglong', '74279', '2');
INSERT INTO `t_driver` VALUES ('17', 'xvx', 'shijun', '74270', '2');
INSERT INTO `t_driver` VALUES ('18', 'xvxv', 'xiaodi', '74228', '3');
INSERT INTO `t_driver` VALUES ('19', 'xvxv', 'zhangtianhan', '74215', '3');
INSERT INTO `t_driver` VALUES ('20', 'xvxvx', 'longhaitian', '74106', '4');
INSERT INTO `t_driver` VALUES ('21', 'xcvsdf', 'husun', '74078', '4');
INSERT INTO `t_driver` VALUES ('22', 'xvxv', 'menghaoran', '73870', '6');
INSERT INTO `t_driver` VALUES ('23', 'sdf', 'lijing', '73859', '7');
INSERT INTO `t_driver` VALUES ('24', 'hdfh', 'lining', '73662', '8');
INSERT INTO `t_driver` VALUES ('26', 'heihei', 'fuckyourmm', '74690', null);

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `tech_name` (`tech_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2052 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_event_type
-- ----------------------------
INSERT INTO `t_event_type` VALUES ('1024', 'Idle', 'event-idle');
INSERT INTO `t_event_type` VALUES ('1025', 'Speeding', 'event-speeding');
INSERT INTO `t_event_type` VALUES ('2048', 'Sudden acceleration', 'event-sudden-acceleration');
INSERT INTO `t_event_type` VALUES ('2049', 'Sudden braking', 'event-sudden-braking');
INSERT INTO `t_event_type` VALUES ('2050', 'Sudden left', 'event-sudden-left');
INSERT INTO `t_event_type` VALUES ('2051', 'Sudden right', 'event-sudden-right');

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
) ENGINE=InnoDB AUTO_INCREMENT=2466154 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_gps_data
-- ----------------------------
INSERT INTO `t_gps_data` VALUES ('2466074', '2012-07-04 22:05:54', '2', '', '33376.4116599225', '29026.05430011737', '12', '2012-07-04 22:05:54', '2');
INSERT INTO `t_gps_data` VALUES ('2466075', '2012-07-04 22:05:54', '3', '', '41938.5020052299', '11230.720251745131', '64', '2012-07-04 22:05:54', '1');
INSERT INTO `t_gps_data` VALUES ('2466076', '2012-07-04 22:05:54', '2', '', '33055.13092425144', '36563.1296575475', '2', '2012-07-04 22:05:54', '4');
INSERT INTO `t_gps_data` VALUES ('2466077', '2012-07-04 22:05:54', '1', '', '42627.90985970137', '24052.882437559172', '4', '2012-07-04 22:05:54', '3');
INSERT INTO `t_gps_data` VALUES ('2466078', '2012-07-04 22:05:54', '0', '', '43094.46147499175', '25632.501599716183', '88', '2012-07-04 22:05:54', '5');
INSERT INTO `t_gps_data` VALUES ('2466079', '2012-07-04 22:05:54', '3', '', '42765.56979574867', '16878.03631910496', '55', '2012-07-04 22:05:54', '6');
INSERT INTO `t_gps_data` VALUES ('2466080', '2012-07-04 22:05:54', '2', '', '31231.32749456679', '24237.730455538083', '92', '2012-07-04 22:05:54', '001190251');
INSERT INTO `t_gps_data` VALUES ('2466081', '2012-07-04 22:05:54', '2', '', '34783.72797199284', '21027.92527591157', '51', '2012-07-04 22:05:54', '001014182');
INSERT INTO `t_gps_data` VALUES ('2466082', '2012-07-04 22:05:54', '1', '', '31396.043738333654', '20743.14286540465', '20', '2012-07-04 22:05:54', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2466083', '2012-07-04 22:05:54', '2', '', '36467.500376039454', '27630.321750026982', '69', '2012-07-04 22:05:54', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2466084', '2012-07-04 22:05:54', '1', '', '39266.75310646162', '15530.242818198347', '87', '2012-07-04 22:05:54', '001001003');
INSERT INTO `t_gps_data` VALUES ('2466085', '2012-07-04 22:05:54', '3', '', '42059.82524331796', '21317.415849902827', '11', '2012-07-04 22:05:54', '001067110');
INSERT INTO `t_gps_data` VALUES ('2466086', '2012-07-04 22:05:54', '1', '', '31071.148348628143', '24031.78761872543', '11', '2012-07-04 22:05:54', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2466087', '2012-07-04 22:05:54', '3', '', '43952.80851332012', '21035.26048452611', '51', '2012-07-04 22:05:54', 'amk');
INSERT INTO `t_gps_data` VALUES ('2466088', '2012-07-04 22:05:54', '2', '', '29033.69730520511', '28075.287426524188', '42', '2012-07-04 22:05:54', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2466089', '2012-07-04 22:05:54', '3', '', '35755.31708205523', '28246.052710091022', '10', '2012-07-04 22:05:54', 'cck');
INSERT INTO `t_gps_data` VALUES ('2466090', '2012-07-04 22:05:54', '1', '', '35174.26523483805', '34814.00071055519', '2', '2012-07-04 22:05:54', 'clm');
INSERT INTO `t_gps_data` VALUES ('2466091', '2012-07-04 22:05:54', '2', '', '37349.09364929077', '16554.978833276284', '51', '2012-07-04 22:05:54', 'hou');
INSERT INTO `t_gps_data` VALUES ('2466092', '2012-07-04 22:05:54', '0', '', '31003.733441340555', '16956.62070343181', '100', '2012-07-04 22:05:54', 'jur');
INSERT INTO `t_gps_data` VALUES ('2466093', '2012-07-04 22:05:54', '1', '', '39248.93063040788', '28809.714950789043', '82', '2012-07-04 22:05:54', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2466094', '2012-07-04 22:06:04', '2', '', '33467.047681747215', '29026.35555348338', '12', '2012-07-04 22:06:04', '2');
INSERT INTO `t_gps_data` VALUES ('2466095', '2012-07-04 22:06:04', '3', '', '41896.0027811747', '11225.270852095076', '64', '2012-07-04 22:06:04', '1');
INSERT INTO `t_gps_data` VALUES ('2466096', '2012-07-04 22:06:04', '2', '', '33105.81975794347', '36570.80269248367', '2', '2012-07-04 22:06:04', '4');
INSERT INTO `t_gps_data` VALUES ('2466097', '2012-07-04 22:06:04', '1', '', '42646.551073625866', '24112.06541648243', '4', '2012-07-04 22:06:04', '3');
INSERT INTO `t_gps_data` VALUES ('2466098', '2012-07-04 22:06:04', '0', '', '43090.067553864974', '25600.790021359815', '88', '2012-07-04 22:06:04', '5');
INSERT INTO `t_gps_data` VALUES ('2466099', '2012-07-04 22:06:04', '3', '', '42666.44105030008', '16856.89621631908', '55', '2012-07-04 22:06:04', '6');
INSERT INTO `t_gps_data` VALUES ('2466100', '2012-07-04 22:06:04', '2', '', '31264.426731313488', '24246.680846898736', '92', '2012-07-04 22:06:04', '001190251');
INSERT INTO `t_gps_data` VALUES ('2466101', '2012-07-04 22:06:04', '2', '', '34835.71189767472', '21053.06650777864', '51', '2012-07-04 22:06:04', '001014182');
INSERT INTO `t_gps_data` VALUES ('2466102', '2012-07-04 22:06:04', '1', '', '31417.287232552473', '20810.02091027078', '20', '2012-07-04 22:06:04', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2466103', '2012-07-04 22:06:04', '2', '', '36511.840697979365', '27636.95396418809', '69', '2012-07-04 22:06:04', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2466104', '2012-07-04 22:06:04', '1', '', '39271.35333481162', '15583.590583278072', '87', '2012-07-04 22:06:04', '001001003');
INSERT INTO `t_gps_data` VALUES ('2466105', '2012-07-04 22:06:04', '3', '', '41982.09386756885', '21296.69337349468', '11', '2012-07-04 22:06:04', '001067110');
INSERT INTO `t_gps_data` VALUES ('2466106', '2012-07-04 22:06:04', '1', '', '31071.71405732516', '24121.3779027093', '11', '2012-07-04 22:06:04', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2466107', '2012-07-04 22:06:04', '3', '', '43869.00067791944', '21012.957192065438', '51', '2012-07-04 22:06:04', 'amk');
INSERT INTO `t_gps_data` VALUES ('2466108', '2012-07-04 22:06:04', '2', '', '29087.9912061799', '28093.56219343546', '42', '2012-07-04 22:06:04', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2466109', '2012-07-04 22:06:04', '3', '', '35689.85705250771', '28228.693068637433', '10', '2012-07-04 22:06:04', 'cck');
INSERT INTO `t_gps_data` VALUES ('2466110', '2012-07-04 22:06:04', '1', '', '35192.311219817624', '34855.183301582845', '2', '2012-07-04 22:06:04', 'clm');
INSERT INTO `t_gps_data` VALUES ('2466111', '2012-07-04 22:06:04', '2', '', '37413.42168894468', '16567.746325886274', '51', '2012-07-04 22:06:04', 'hou');
INSERT INTO `t_gps_data` VALUES ('2466112', '2012-07-04 22:06:04', '0', '', '30987.294851225466', '16873.055778193', '100', '2012-07-04 22:06:04', 'jur');
INSERT INTO `t_gps_data` VALUES ('2466113', '2012-07-04 22:06:04', '1', '', '39275.57844714412', '28888.544604038314', '82', '2012-07-04 22:06:04', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2466114', '2012-07-04 22:06:14', '2', '', '33550.859153101876', '29048.607363145173', '12', '2012-07-04 22:06:14', '2');
INSERT INTO `t_gps_data` VALUES ('2466115', '2012-07-04 22:06:14', '3', '', '41856.03606472681', '11208.293402203144', '64', '2012-07-04 22:06:14', '1');
INSERT INTO `t_gps_data` VALUES ('2466116', '2012-07-04 22:06:14', '2', '', '33156.17706365859', '36580.143637256835', '2', '2012-07-04 22:06:14', '4');
INSERT INTO `t_gps_data` VALUES ('2466117', '2012-07-04 22:06:14', '1', '', '42660.00907217586', '24204.50603393923', '4', '2012-07-04 22:06:14', '3');
INSERT INTO `t_gps_data` VALUES ('2466118', '2012-07-04 22:06:14', '0', '', '43065.5607344062', '25548.349038983113', '88', '2012-07-04 22:06:14', '5');
INSERT INTO `t_gps_data` VALUES ('2466119', '2012-07-04 22:06:14', '3', '', '42597.10785469208', '16844.928660113535', '55', '2012-07-04 22:06:14', '6');
INSERT INTO `t_gps_data` VALUES ('2466120', '2012-07-04 22:06:14', '2', '', '31326.193493413848', '24275.33580243906', '92', '2012-07-04 22:06:14', '001190251');
INSERT INTO `t_gps_data` VALUES ('2466121', '2012-07-04 22:06:14', '2', '', '34871.452770033946', '21077.439596065342', '51', '2012-07-04 22:06:14', '001014182');
INSERT INTO `t_gps_data` VALUES ('2466122', '2012-07-04 22:06:14', '1', '', '31444.030314126994', '20893.088746234644', '20', '2012-07-04 22:06:14', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2466123', '2012-07-04 22:06:14', '2', '', '36590.91499471789', '27662.157556925005', '69', '2012-07-04 22:06:14', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2466124', '2012-07-04 22:06:14', '1', '', '39280.08890321934', '15644.911525817914', '87', '2012-07-04 22:06:14', '001001003');
INSERT INTO `t_gps_data` VALUES ('2466125', '2012-07-04 22:06:14', '3', '', '41896.47675112329', '21291.852034882773', '11', '2012-07-04 22:06:14', '001067110');
INSERT INTO `t_gps_data` VALUES ('2466126', '2012-07-04 22:06:14', '1', '', '31090.19883090541', '24165.711764908105', '11', '2012-07-04 22:06:14', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2466127', '2012-07-04 22:06:14', '3', '', '43831.05077843059', '21008.18545764395', '51', '2012-07-04 22:06:14', 'amk');
INSERT INTO `t_gps_data` VALUES ('2466128', '2012-07-04 22:06:14', '2', '', '29119.42169618951', '28107.3030740866', '42', '2012-07-04 22:06:14', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2466129', '2012-07-04 22:06:14', '3', '', '35638.61975207745', '28204.796363506233', '10', '2012-07-04 22:06:14', 'cck');
INSERT INTO `t_gps_data` VALUES ('2466130', '2012-07-04 22:06:14', '1', '', '35204.743552868014', '34907.85834071359', '2', '2012-07-04 22:06:14', 'clm');
INSERT INTO `t_gps_data` VALUES ('2466131', '2012-07-04 22:06:14', '2', '', '37476.001376055225', '16577.303993681377', '51', '2012-07-04 22:06:14', 'hou');
INSERT INTO `t_gps_data` VALUES ('2466132', '2012-07-04 22:06:14', '0', '', '30964.600880145434', '16821.899870338708', '100', '2012-07-04 22:06:14', 'jur');
INSERT INTO `t_gps_data` VALUES ('2466133', '2012-07-04 22:06:14', '1', '', '39278.01345457064', '28961.277244011137', '82', '2012-07-04 22:06:14', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2466134', '2012-07-04 22:06:24', '2', '', '33634.313719144295', '29055.72296425009', '12', '2012-07-04 22:06:24', '2');
INSERT INTO `t_gps_data` VALUES ('2466135', '2012-07-04 22:06:24', '3', '', '41766.3698858136', '11205.880596033572', '64', '2012-07-04 22:06:24', '1');
INSERT INTO `t_gps_data` VALUES ('2466136', '2012-07-04 22:06:24', '2', '', '33250.30066230427', '36591.79358793725', '2', '2012-07-04 22:06:24', '4');
INSERT INTO `t_gps_data` VALUES ('2466137', '2012-07-04 22:06:24', '1', '', '42675.383041516776', '24263.24937265857', '4', '2012-07-04 22:06:24', '3');
INSERT INTO `t_gps_data` VALUES ('2466138', '2012-07-04 22:06:24', '0', '', '43053.610572649166', '25465.195083500475', '88', '2012-07-04 22:06:24', '5');
INSERT INTO `t_gps_data` VALUES ('2466139', '2012-07-04 22:06:24', '3', '', '42523.02218880545', '16834.2677765216', '55', '2012-07-04 22:06:24', '6');
INSERT INTO `t_gps_data` VALUES ('2466140', '2012-07-04 22:06:24', '2', '', '31411.506266138735', '24297.687404258224', '92', '2012-07-04 22:06:24', '001190251');
INSERT INTO `t_gps_data` VALUES ('2466141', '2012-07-04 22:06:24', '2', '', '34904.63860533325', '21077.576511853233', '51', '2012-07-04 22:06:24', '001014182');
INSERT INTO `t_gps_data` VALUES ('2466142', '2012-07-04 22:06:24', '1', '', '31463.331646288054', '20991.26239196256', '20', '2012-07-04 22:06:24', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2466143', '2012-07-04 22:06:24', '2', '', '36660.40858262576', '27690.563170711383', '69', '2012-07-04 22:06:24', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2466144', '2012-07-04 22:06:24', '1', '', '39306.27903532421', '15734.362228395621', '87', '2012-07-04 22:06:24', '001001003');
INSERT INTO `t_gps_data` VALUES ('2466145', '2012-07-04 22:06:24', '3', '', '41862.44850537846', '21270.746280596526', '11', '2012-07-04 22:06:24', '001067110');
INSERT INTO `t_gps_data` VALUES ('2466146', '2012-07-04 22:06:24', '1', '', '31113.461343038824', '24253.231406919116', '11', '2012-07-04 22:06:24', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2466147', '2012-07-04 22:06:24', '3', '', '43788.21150474471', '20999.70295296553', '51', '2012-07-04 22:06:24', 'amk');
INSERT INTO `t_gps_data` VALUES ('2466148', '2012-07-04 22:06:24', '2', '', '29151.779428183327', '28107.64867869944', '42', '2012-07-04 22:06:24', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2466149', '2012-07-04 22:06:24', '3', '', '35606.78716569401', '28199.194715860074', '10', '2012-07-04 22:06:24', 'cck');
INSERT INTO `t_gps_data` VALUES ('2466150', '2012-07-04 22:06:24', '1', '', '35229.22968967053', '34946.857175098805', '2', '2012-07-04 22:06:24', 'clm');
INSERT INTO `t_gps_data` VALUES ('2466151', '2012-07-04 22:06:24', '2', '', '37511.873365745116', '16589.510128350274', '51', '2012-07-04 22:06:24', 'hou');
INSERT INTO `t_gps_data` VALUES ('2466152', '2012-07-04 22:06:24', '0', '', '30956.60176053216', '16757.631441641162', '100', '2012-07-04 22:06:24', 'jur');
INSERT INTO `t_gps_data` VALUES ('2466153', '2012-07-04 22:06:24', '1', '', '39306.43344842763', '29048.980728911887', '82', '2012-07-04 22:06:24', 'tpy');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'role_1', 'role_1');
INSERT INTO `t_role` VALUES ('4', 'role_2', 'role_2');
INSERT INTO `t_role` VALUES ('5', 'role_3', 'role_3');

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
INSERT INTO `t_role_perm` VALUES ('1', '1');
INSERT INTO `t_role_perm` VALUES ('4', '2');
INSERT INTO `t_role_perm` VALUES ('1', '3');
INSERT INTO `t_role_perm` VALUES ('1', '4');
INSERT INTO `t_role_perm` VALUES ('4', '1');
INSERT INTO `t_role_perm` VALUES ('4', '3');
INSERT INTO `t_role_perm` VALUES ('4', '4');
INSERT INTO `t_role_perm` VALUES ('4', '5');

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
INSERT INTO `t_user_role` VALUES ('1', '1');
INSERT INTO `t_user_role` VALUES ('2', '4');
INSERT INTO `t_user_role` VALUES ('5', '1');
INSERT INTO `t_user_role` VALUES ('5', '4');
INSERT INTO `t_user_role` VALUES ('6', '4');

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
INSERT INTO `t_vehicle` VALUES ('1', '192.168.21.12', 'vehicle01', 'BA00001', 'bus', '4', '1', 'vehicle01');
INSERT INTO `t_vehicle` VALUES ('2', '210.38.124.35', 'vehicle02', 'FT00002', 'car', '8', '2', 'vehicle02');
INSERT INTO `t_vehicle` VALUES ('4', '33.125.45.782', 'vehicle03', 'HZ00012', 'bus', '12', '6', 'vehicle03');
INSERT INTO `t_vehicle` VALUES ('5', '210.58.654.12', 'vehicle04', 'CN0005', 'car', '11', '8', 'vehicle04');
INSERT INTO `t_vehicle` VALUES ('6', '102.210.45.41', 'vehicle05', 'GZ00001', 'bus', '18', '7', 'vehicle05');
INSERT INTO `t_vehicle` VALUES ('7', '12.122.45.123', 'vehicle06', 'GZ00002', 'car', '19', '5', 'vehicle06');
INSERT INTO `t_vehicle` VALUES ('8', '102.210.45.41', 'vehicle07', 'AZ00001', 'car', '31', '4', 'vehicle07');
INSERT INTO `t_vehicle` VALUES ('9', '102.210.45.41', 'vehicle08', 'BZ00003', 'bus', '32', '5', 'vehicle08');
INSERT INTO `t_vehicle` VALUES ('10', '102.210.45.41', 'vehicle09', 'BZ00004', 'bus', '58', '9', 'vehicle09');
INSERT INTO `t_vehicle` VALUES ('11', '102.210.45.41', 'vehicle10', 'BZ00005', 'car', '59', '10', 'vehicle10');
INSERT INTO `t_vehicle` VALUES ('12', '102.210.45.41', 'vehicle11', 'BZ00006', 'car', '60', '11', 'vehicle11');
INSERT INTO `t_vehicle` VALUES ('13', '102.210.45.41', 'vehicle12', 'BZ00007', 'car', '86', '3', 'vehicle12');
INSERT INTO `t_vehicle` VALUES ('14', '102.210.45.41', 'vehicle13', 'HZ00013', 'bus', '89', '5', 'vehicle13');
INSERT INTO `t_vehicle` VALUES ('15', '102.210.45.41', 'vehicle14', 'HZ00014', 'bus', '91', '6', 'vehicle14');
INSERT INTO `t_vehicle` VALUES ('16', '102.210.45.41', 'vehicle15', 'HZ00015', 'bus', '92', '6', 'vehicle15');
INSERT INTO `t_vehicle` VALUES ('17', '102.210.45.41', 'vehicle16', 'HS00014', 'car', '93', '6', 'vehicle16');
INSERT INTO `t_vehicle` VALUES ('18', '102.210.45.41', 'vehicle17', 'HS00002', 'car', '94', '5', 'vehicle17');
INSERT INTO `t_vehicle` VALUES ('20', '102.210.45.41', 'vehicle18', 'HW0012', 'bus', '95', '3', 'vehicle18');
INSERT INTO `t_vehicle` VALUES ('21', '102.210.45.41', 'vehicle19', 'SS00245', 'car', '96', '3', 'vehicle19');
INSERT INTO `t_vehicle` VALUES ('22', '102.210.45.41', 'vehicle20', 'SS01245', 'car', '97', '3', 'vehicle20');
