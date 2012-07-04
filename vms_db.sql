/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50511
Source Host           : localhost:3306
Source Database       : vms_db

Target Server Type    : MYSQL
Target Server Version : 50511
File Encoding         : 65001

Date: 2012-07-04 12:42:03
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
) ENGINE=InnoDB AUTO_INCREMENT=2403234 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_gps_data
-- ----------------------------
INSERT INTO `t_gps_data` VALUES ('2402874', '2012-07-04 12:39:06', '0', '', '41411.576389904636', '21968.296341092064', '55', '2012-07-04 12:39:06', '2');
INSERT INTO `t_gps_data` VALUES ('2402875', '2012-07-04 12:39:06', '1', '', '37234.86158648389', '12585.98166970608', '39', '2012-07-04 12:39:06', '1');
INSERT INTO `t_gps_data` VALUES ('2402876', '2012-07-04 12:39:06', '2', '', '36132.20579741467', '27319.833097753388', '77', '2012-07-04 12:39:06', '4');
INSERT INTO `t_gps_data` VALUES ('2402877', '2012-07-04 12:39:06', '2', '', '39410.96017211641', '39391.45221732609', '12', '2012-07-04 12:39:06', '3');
INSERT INTO `t_gps_data` VALUES ('2402878', '2012-07-04 12:39:06', '3', '', '40190.57189484639', '17806.89886693883', '37', '2012-07-04 12:39:06', '5');
INSERT INTO `t_gps_data` VALUES ('2402879', '2012-07-04 12:39:06', '3', '', '32493.228691141772', '35469.629718801596', '41', '2012-07-04 12:39:06', '6');
INSERT INTO `t_gps_data` VALUES ('2402880', '2012-07-04 12:39:06', '3', '', '44030.88900333985', '27397.27748715961', '34', '2012-07-04 12:39:06', '001190251');
INSERT INTO `t_gps_data` VALUES ('2402881', '2012-07-04 12:39:06', '3', '', '44406.92126132099', '19850.210029992828', '98', '2012-07-04 12:39:06', '001014182');
INSERT INTO `t_gps_data` VALUES ('2402882', '2012-07-04 12:39:06', '0', '', '36537.54323574371', '20091.03435835361', '75', '2012-07-04 12:39:06', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2402883', '2012-07-04 12:39:06', '1', '', '31175.110738615112', '26292.540628996223', '75', '2012-07-04 12:39:06', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2402884', '2012-07-04 12:39:07', '3', '', '39418.69204252796', '29838.447681888152', '3', '2012-07-04 12:39:07', '001001003');
INSERT INTO `t_gps_data` VALUES ('2402885', '2012-07-04 12:39:07', '1', '', '32218.13116080187', '28252.758834134635', '42', '2012-07-04 12:39:07', '001067110');
INSERT INTO `t_gps_data` VALUES ('2402886', '2012-07-04 12:39:07', '1', '', '38781.11807065037', '38764.22714111711', '96', '2012-07-04 12:39:07', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2402887', '2012-07-04 12:39:07', '3', '', '29095.979483859614', '24731.99558663919', '12', '2012-07-04 12:39:07', 'amk');
INSERT INTO `t_gps_data` VALUES ('2402888', '2012-07-04 12:39:07', '1', '', '40945.72517165245', '17181.492176186464', '100', '2012-07-04 12:39:07', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2402889', '2012-07-04 12:39:07', '3', '', '39430.047448886675', '25811.134862613835', '68', '2012-07-04 12:39:07', 'cck');
INSERT INTO `t_gps_data` VALUES ('2402890', '2012-07-04 12:39:07', '3', '', '32996.99229792745', '11855.466718561276', '66', '2012-07-04 12:39:07', 'clm');
INSERT INTO `t_gps_data` VALUES ('2402891', '2012-07-04 12:39:07', '1', '', '34961.17222105406', '33369.623745541176', '31', '2012-07-04 12:39:07', 'hou');
INSERT INTO `t_gps_data` VALUES ('2402892', '2012-07-04 12:39:07', '0', '', '29922.59221944843', '26498.957352616868', '54', '2012-07-04 12:39:07', 'jur');
INSERT INTO `t_gps_data` VALUES ('2402893', '2012-07-04 12:39:07', '0', '', '33800.541725209805', '27240.941810592063', '65', '2012-07-04 12:39:07', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2402894', '2012-07-04 12:39:17', '0', '', '41404.48885357834', '21902.80981895796', '55', '2012-07-04 12:39:17', '2');
INSERT INTO `t_gps_data` VALUES ('2402895', '2012-07-04 12:39:17', '1', '', '37242.47933909048', '12628.275396726818', '39', '2012-07-04 12:39:17', '1');
INSERT INTO `t_gps_data` VALUES ('2402896', '2012-07-04 12:39:17', '2', '', '36205.7569069901', '27332.683152778256', '77', '2012-07-04 12:39:17', '4');
INSERT INTO `t_gps_data` VALUES ('2402897', '2012-07-04 12:39:17', '2', '', '39475.4348627107', '39396.74072380406', '12', '2012-07-04 12:39:17', '3');
INSERT INTO `t_gps_data` VALUES ('2402898', '2012-07-04 12:39:17', '3', '', '40104.82455176839', '17802.71210352782', '37', '2012-07-04 12:39:17', '5');
INSERT INTO `t_gps_data` VALUES ('2402899', '2012-07-04 12:39:17', '3', '', '32457.346015543317', '35462.8597553362', '41', '2012-07-04 12:39:17', '6');
INSERT INTO `t_gps_data` VALUES ('2402900', '2012-07-04 12:39:17', '3', '', '43989.64633473412', '27386.36618249756', '34', '2012-07-04 12:39:17', '001190251');
INSERT INTO `t_gps_data` VALUES ('2402901', '2012-07-04 12:39:17', '3', '', '44336.31893365948', '19830.620241554774', '98', '2012-07-04 12:39:17', '001014182');
INSERT INTO `t_gps_data` VALUES ('2402902', '2012-07-04 12:39:17', '0', '', '36524.96800746915', '20020.18426454442', '75', '2012-07-04 12:39:17', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2402903', '2012-07-04 12:39:17', '1', '', '31201.884283929438', '26390.092741352328', '75', '2012-07-04 12:39:17', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2402904', '2012-07-04 12:39:17', '3', '', '39353.84959824129', '29819.949998067925', '3', '2012-07-04 12:39:17', '001001003');
INSERT INTO `t_gps_data` VALUES ('2402905', '2012-07-04 12:39:17', '1', '', '32238.993764581614', '28351.007443193703', '42', '2012-07-04 12:39:17', '001067110');
INSERT INTO `t_gps_data` VALUES ('2402906', '2012-07-04 12:39:17', '1', '', '38785.471839939535', '38809.20081637791', '96', '2012-07-04 12:39:17', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2402907', '2012-07-04 12:39:17', '3', '', '29037.885021930826', '24709.29596701782', '12', '2012-07-04 12:39:17', 'amk');
INSERT INTO `t_gps_data` VALUES ('2402908', '2012-07-04 12:39:17', '1', '', '40957.398545295124', '17272.349391532356', '100', '2012-07-04 12:39:17', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2402909', '2012-07-04 12:39:17', '3', '', '39383.99794581616', '25796.54373720965', '68', '2012-07-04 12:39:17', 'cck');
INSERT INTO `t_gps_data` VALUES ('2402910', '2012-07-04 12:39:17', '3', '', '32914.986369462196', '11828.052416313667', '66', '2012-07-04 12:39:17', 'clm');
INSERT INTO `t_gps_data` VALUES ('2402911', '2012-07-04 12:39:17', '1', '', '34972.24877248497', '33399.84348097031', '31', '2012-07-04 12:39:17', 'hou');
INSERT INTO `t_gps_data` VALUES ('2402912', '2012-07-04 12:39:17', '0', '', '29901.771770878462', '26450.128119788267', '54', '2012-07-04 12:39:17', 'jur');
INSERT INTO `t_gps_data` VALUES ('2402913', '2012-07-04 12:39:17', '0', '', '33776.82840535154', '27142.611319967542', '65', '2012-07-04 12:39:17', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2402914', '2012-07-04 12:39:27', '0', '', '41403.01630332138', '21838.867724462463', '55', '2012-07-04 12:39:27', '2');
INSERT INTO `t_gps_data` VALUES ('2402915', '2012-07-04 12:39:27', '1', '', '37265.457558058704', '12711.131795838108', '39', '2012-07-04 12:39:27', '1');
INSERT INTO `t_gps_data` VALUES ('2402916', '2012-07-04 12:39:27', '2', '', '36239.15373421241', '27342.42883400752', '77', '2012-07-04 12:39:27', '4');
INSERT INTO `t_gps_data` VALUES ('2402917', '2012-07-04 12:39:27', '2', '', '39532.73559493867', '39421.77104576626', '12', '2012-07-04 12:39:27', '3');
INSERT INTO `t_gps_data` VALUES ('2402918', '2012-07-04 12:39:27', '3', '', '40019.19117694695', '17798.947560777284', '37', '2012-07-04 12:39:27', '5');
INSERT INTO `t_gps_data` VALUES ('2402919', '2012-07-04 12:39:27', '3', '', '32387.70894126648', '35446.22475159323', '41', '2012-07-04 12:39:27', '6');
INSERT INTO `t_gps_data` VALUES ('2402920', '2012-07-04 12:39:27', '3', '', '43911.11861376199', '27366.025395266206', '34', '2012-07-04 12:39:27', '001190251');
INSERT INTO `t_gps_data` VALUES ('2402921', '2012-07-04 12:39:27', '3', '', '44285.353610380356', '19822.721693412368', '98', '2012-07-04 12:39:27', '001014182');
INSERT INTO `t_gps_data` VALUES ('2402922', '2012-07-04 12:39:27', '0', '', '36512.54812324036', '19968.824319655283', '75', '2012-07-04 12:39:27', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2402923', '2012-07-04 12:39:27', '1', '', '31212.304454769506', '26429.872345068597', '75', '2012-07-04 12:39:27', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2402924', '2012-07-04 12:39:27', '3', '', '39304.06581008809', '29805.506561670274', '3', '2012-07-04 12:39:27', '001001003');
INSERT INTO `t_gps_data` VALUES ('2402925', '2012-07-04 12:39:27', '1', '', '32258.492274024262', '28405.625533166378', '42', '2012-07-04 12:39:27', '001067110');
INSERT INTO `t_gps_data` VALUES ('2402926', '2012-07-04 12:39:27', '1', '', '38806.423037468725', '38903.965578642456', '96', '2012-07-04 12:39:27', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2402927', '2012-07-04 12:39:27', '3', '', '28955.02603507027', '24702.858962545084', '12', '2012-07-04 12:39:27', 'amk');
INSERT INTO `t_gps_data` VALUES ('2402928', '2012-07-04 12:39:27', '1', '', '40974.17525093752', '17343.560448427474', '100', '2012-07-04 12:39:27', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2402929', '2012-07-04 12:39:27', '3', '', '39308.064361970464', '25782.904184778978', '68', '2012-07-04 12:39:27', 'cck');
INSERT INTO `t_gps_data` VALUES ('2402930', '2012-07-04 12:39:27', '3', '', '32851.62039095716', '11809.037457092645', '66', '2012-07-04 12:39:27', 'clm');
INSERT INTO `t_gps_data` VALUES ('2402931', '2012-07-04 12:39:27', '1', '', '34983.124777283476', '33449.75585011109', '31', '2012-07-04 12:39:27', 'hou');
INSERT INTO `t_gps_data` VALUES ('2402932', '2012-07-04 12:39:27', '0', '', '29893.64030727327', '26414.427061646074', '54', '2012-07-04 12:39:27', 'jur');
INSERT INTO `t_gps_data` VALUES ('2402933', '2012-07-04 12:39:27', '0', '', '33756.58055234298', '27050.60603015704', '65', '2012-07-04 12:39:27', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2402934', '2012-07-04 12:39:37', '0', '', '41388.38179460697', '21808.579962431202', '55', '2012-07-04 12:39:37', '2');
INSERT INTO `t_gps_data` VALUES ('2402935', '2012-07-04 12:39:37', '1', '', '37290.3614886719', '12802.622683082196', '39', '2012-07-04 12:39:37', '1');
INSERT INTO `t_gps_data` VALUES ('2402936', '2012-07-04 12:39:37', '2', '', '36301.96984994488', '27350.08842546634', '77', '2012-07-04 12:39:37', '4');
INSERT INTO `t_gps_data` VALUES ('2402937', '2012-07-04 12:39:37', '2', '', '39606.43033922904', '39436.39534422129', '12', '2012-07-04 12:39:37', '3');
INSERT INTO `t_gps_data` VALUES ('2402938', '2012-07-04 12:39:37', '3', '', '39985.566078445816', '17795.14865610807', '37', '2012-07-04 12:39:37', '5');
INSERT INTO `t_gps_data` VALUES ('2402939', '2012-07-04 12:39:37', '3', '', '32333.907466339682', '35425.08244755903', '41', '2012-07-04 12:39:37', '6');
INSERT INTO `t_gps_data` VALUES ('2402940', '2012-07-04 12:39:37', '3', '', '43818.81756300453', '27336.481999047995', '34', '2012-07-04 12:39:37', '001190251');
INSERT INTO `t_gps_data` VALUES ('2402941', '2012-07-04 12:39:37', '3', '', '44243.019212115345', '19800.8284675948', '98', '2012-07-04 12:39:37', '001014182');
INSERT INTO `t_gps_data` VALUES ('2402942', '2012-07-04 12:39:37', '0', '', '36498.786003936955', '19903.24363065753', '75', '2012-07-04 12:39:37', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2402943', '2012-07-04 12:39:37', '1', '', '31213.723478669734', '26503.047066215924', '75', '2012-07-04 12:39:37', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2402944', '2012-07-04 12:39:37', '3', '', '39262.97098391163', '29778.898290006633', '3', '2012-07-04 12:39:37', '001001003');
INSERT INTO `t_gps_data` VALUES ('2402945', '2012-07-04 12:39:37', '1', '', '32271.18081801395', '28475.241324425948', '42', '2012-07-04 12:39:37', '001067110');
INSERT INTO `t_gps_data` VALUES ('2402946', '2012-07-04 12:39:37', '1', '', '38810.216113464136', '39001.56653030679', '96', '2012-07-04 12:39:37', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2402947', '2012-07-04 12:39:37', '3', '', '28897.271652091153', '24673.8338399223', '12', '2012-07-04 12:39:37', 'amk');
INSERT INTO `t_gps_data` VALUES ('2402948', '2012-07-04 12:39:37', '1', '', '40984.989952730284', '17382.95279799116', '100', '2012-07-04 12:39:37', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2402949', '2012-07-04 12:39:37', '3', '', '39262.656270524836', '25762.334342766022', '68', '2012-07-04 12:39:37', 'cck');
INSERT INTO `t_gps_data` VALUES ('2402950', '2012-07-04 12:39:37', '3', '', '32811.83403776247', '11780.990083644218', '66', '2012-07-04 12:39:37', 'clm');
INSERT INTO `t_gps_data` VALUES ('2402951', '2012-07-04 12:39:37', '1', '', '35001.25096992867', '33525.96694055068', '31', '2012-07-04 12:39:37', 'hou');
INSERT INTO `t_gps_data` VALUES ('2402952', '2012-07-04 12:39:37', '0', '', '29891.33239995167', '26341.352335990894', '54', '2012-07-04 12:39:37', 'jur');
INSERT INTO `t_gps_data` VALUES ('2402953', '2012-07-04 12:39:37', '0', '', '33752.00412150398', '26970.823525901793', '65', '2012-07-04 12:39:37', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2402954', '2012-07-04 12:39:47', '0', '', '41368.830522928416', '21714.452072718857', '55', '2012-07-04 12:39:47', '2');
INSERT INTO `t_gps_data` VALUES ('2402955', '2012-07-04 12:39:47', '1', '', '37295.892881497115', '12853.077174716307', '39', '2012-07-04 12:39:47', '1');
INSERT INTO `t_gps_data` VALUES ('2402956', '2012-07-04 12:39:47', '2', '', '36399.91069568147', '27373.565436412973', '77', '2012-07-04 12:39:47', '4');
INSERT INTO `t_gps_data` VALUES ('2402957', '2012-07-04 12:39:47', '2', '', '39653.013403221754', '39465.62981524316', '12', '2012-07-04 12:39:47', '3');
INSERT INTO `t_gps_data` VALUES ('2402958', '2012-07-04 12:39:47', '3', '', '39932.56301652857', '17781.072166294798', '37', '2012-07-04 12:39:47', '5');
INSERT INTO `t_gps_data` VALUES ('2402959', '2012-07-04 12:39:47', '3', '', '32302.278455384596', '35419.97436855885', '41', '2012-07-04 12:39:47', '6');
INSERT INTO `t_gps_data` VALUES ('2402960', '2012-07-04 12:39:47', '3', '', '43782.791005888', '27319.734918099723', '34', '2012-07-04 12:39:47', '001190251');
INSERT INTO `t_gps_data` VALUES ('2402961', '2012-07-04 12:39:47', '3', '', '44194.89823343954', '19793.86647900204', '98', '2012-07-04 12:39:47', '001014182');
INSERT INTO `t_gps_data` VALUES ('2402962', '2012-07-04 12:39:47', '0', '', '36469.91326900121', '19812.230362988183', '75', '2012-07-04 12:39:47', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2402963', '2012-07-04 12:39:47', '1', '', '31216.63521707778', '26541.486319371146', '75', '2012-07-04 12:39:47', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2402964', '2012-07-04 12:39:47', '3', '', '39191.71018083229', '29775.297763897834', '3', '2012-07-04 12:39:47', '001001003');
INSERT INTO `t_gps_data` VALUES ('2402965', '2012-07-04 12:39:47', '1', '', '32275.097063573907', '28533.68041073588', '42', '2012-07-04 12:39:47', '001067110');
INSERT INTO `t_gps_data` VALUES ('2402966', '2012-07-04 12:39:47', '1', '', '38830.00537987085', '39099.90058266122', '96', '2012-07-04 12:39:47', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2402967', '2012-07-04 12:39:47', '2', '', '28858.98724951198', '24662.940355753035', '12', '2012-07-04 12:39:47', 'amk');
INSERT INTO `t_gps_data` VALUES ('2402968', '2012-07-04 12:39:47', '1', '', '40997.205511328924', '17482.340184099612', '100', '2012-07-04 12:39:47', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2402969', '2012-07-04 12:39:47', '3', '', '39211.23936724862', '25737.793718148198', '68', '2012-07-04 12:39:47', 'cck');
INSERT INTO `t_gps_data` VALUES ('2402970', '2012-07-04 12:39:47', '3', '', '32754.123133915244', '11776.774884268918', '66', '2012-07-04 12:39:47', 'clm');
INSERT INTO `t_gps_data` VALUES ('2402971', '2012-07-04 12:39:47', '1', '', '35021.22234575493', '33579.021983974635', '31', '2012-07-04 12:39:47', 'hou');
INSERT INTO `t_gps_data` VALUES ('2402972', '2012-07-04 12:39:47', '0', '', '29884.696741337753', '26293.981828669508', '54', '2012-07-04 12:39:47', 'jur');
INSERT INTO `t_gps_data` VALUES ('2402973', '2012-07-04 12:39:47', '0', '', '33733.27311771022', '26880.345533420255', '65', '2012-07-04 12:39:47', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2402974', '2012-07-04 12:39:57', '0', '', '41358.3226133126', '21629.864120527927', '55', '2012-07-04 12:39:57', '2');
INSERT INTO `t_gps_data` VALUES ('2402975', '2012-07-04 12:39:57', '1', '', '37313.73327255882', '12895.17486883037', '39', '2012-07-04 12:39:57', '1');
INSERT INTO `t_gps_data` VALUES ('2402976', '2012-07-04 12:39:57', '2', '', '36488.64584527696', '27389.58395806533', '77', '2012-07-04 12:39:57', '4');
INSERT INTO `t_gps_data` VALUES ('2402977', '2012-07-04 12:39:57', '2', '', '39736.59030284409', '39469.64138149582', '12', '2012-07-04 12:39:57', '3');
INSERT INTO `t_gps_data` VALUES ('2402978', '2012-07-04 12:39:57', '3', '', '39894.84748753848', '17756.50428953498', '37', '2012-07-04 12:39:57', '5');
INSERT INTO `t_gps_data` VALUES ('2402979', '2012-07-04 12:39:57', '3', '', '32265.221600252593', '35406.65988332909', '41', '2012-07-04 12:39:57', '6');
INSERT INTO `t_gps_data` VALUES ('2402980', '2012-07-04 12:39:57', '3', '', '43740.56175389851', '27307.853195360596', '34', '2012-07-04 12:39:57', '001190251');
INSERT INTO `t_gps_data` VALUES ('2402981', '2012-07-04 12:39:57', '3', '', '44119.059882363654', '19776.911079931408', '98', '2012-07-04 12:39:57', '001014182');
INSERT INTO `t_gps_data` VALUES ('2402982', '2012-07-04 12:39:57', '0', '', '36468.78622061906', '19777.584643750775', '75', '2012-07-04 12:39:57', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2402983', '2012-07-04 12:39:57', '1', '', '31232.8373884174', '26591.412878715993', '75', '2012-07-04 12:39:57', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2402984', '2012-07-04 12:39:57', '3', '', '39095.54625649154', '29765.342938296606', '3', '2012-07-04 12:39:57', '001001003');
INSERT INTO `t_gps_data` VALUES ('2402985', '2012-07-04 12:39:57', '1', '', '32291.892911319046', '28605.33659208688', '42', '2012-07-04 12:39:57', '001067110');
INSERT INTO `t_gps_data` VALUES ('2402986', '2012-07-04 12:39:57', '1', '', '38849.92860499792', '39137.95449293419', '96', '2012-07-04 12:39:57', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2402987', '2012-07-04 12:39:57', '2', '', '28911.10143426997', '24692.93773078694', '12', '2012-07-04 12:39:57', 'amk');
INSERT INTO `t_gps_data` VALUES ('2402988', '2012-07-04 12:39:57', '1', '', '41011.64255025421', '17514.237585010036', '100', '2012-07-04 12:39:57', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2402989', '2012-07-04 12:39:57', '3', '', '39145.78824493813', '25719.884859153815', '68', '2012-07-04 12:39:57', 'cck');
INSERT INTO `t_gps_data` VALUES ('2402990', '2012-07-04 12:39:57', '3', '', '32719.630217523587', '11761.290887627816', '66', '2012-07-04 12:39:57', 'clm');
INSERT INTO `t_gps_data` VALUES ('2402991', '2012-07-04 12:39:57', '1', '', '35025.589907947186', '33675.582636427076', '31', '2012-07-04 12:39:57', 'hou');
INSERT INTO `t_gps_data` VALUES ('2402992', '2012-07-04 12:39:57', '0', '', '29878.46344453048', '26241.455380537944', '54', '2012-07-04 12:39:57', 'jur');
INSERT INTO `t_gps_data` VALUES ('2402993', '2012-07-04 12:39:57', '0', '', '33725.510216305905', '26801.377942450406', '65', '2012-07-04 12:39:57', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2402994', '2012-07-04 12:40:07', '0', '', '41329.23354906761', '21563.632582977636', '55', '2012-07-04 12:40:07', '2');
INSERT INTO `t_gps_data` VALUES ('2402995', '2012-07-04 12:40:07', '1', '', '37315.133985348715', '12983.948036510616', '39', '2012-07-04 12:40:07', '1');
INSERT INTO `t_gps_data` VALUES ('2402996', '2012-07-04 12:40:07', '2', '', '36534.520726157345', '27405.189596764318', '77', '2012-07-04 12:40:07', '4');
INSERT INTO `t_gps_data` VALUES ('2402997', '2012-07-04 12:40:07', '2', '', '39818.00442972333', '39499.14024573209', '12', '2012-07-04 12:40:07', '3');
INSERT INTO `t_gps_data` VALUES ('2402998', '2012-07-04 12:40:07', '3', '', '39818.016404864546', '17728.450646235902', '37', '2012-07-04 12:40:07', '5');
INSERT INTO `t_gps_data` VALUES ('2402999', '2012-07-04 12:40:07', '3', '', '32229.26605415779', '35387.647052838984', '41', '2012-07-04 12:40:07', '6');
INSERT INTO `t_gps_data` VALUES ('2403000', '2012-07-04 12:40:07', '3', '', '43643.316662559264', '27287.134651258115', '34', '2012-07-04 12:40:07', '001190251');
INSERT INTO `t_gps_data` VALUES ('2403001', '2012-07-04 12:40:07', '3', '', '44055.81245736215', '19771.280400208427', '98', '2012-07-04 12:40:07', '001014182');
INSERT INTO `t_gps_data` VALUES ('2403002', '2012-07-04 12:40:07', '0', '', '36463.557159053795', '19684.514059101635', '75', '2012-07-04 12:40:07', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2403003', '2012-07-04 12:40:07', '1', '', '31251.70048299528', '26642.169439109097', '75', '2012-07-04 12:40:07', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2403004', '2012-07-04 12:40:07', '3', '', '39040.65917596026', '29740.015738300004', '3', '2012-07-04 12:40:07', '001001003');
INSERT INTO `t_gps_data` VALUES ('2403005', '2012-07-04 12:40:07', '1', '', '32320.314958220642', '28695.399713343726', '42', '2012-07-04 12:40:07', '001067110');
INSERT INTO `t_gps_data` VALUES ('2403006', '2012-07-04 12:40:07', '1', '', '38863.865406418365', '39178.17910277432', '96', '2012-07-04 12:40:07', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2403007', '2012-07-04 12:40:07', '2', '', '28975.717969486926', '24708.040263816125', '12', '2012-07-04 12:40:07', 'amk');
INSERT INTO `t_gps_data` VALUES ('2403008', '2012-07-04 12:40:07', '1', '', '41032.28948579579', '17566.98634744519', '100', '2012-07-04 12:40:07', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2403009', '2012-07-04 12:40:07', '3', '', '39091.69105657024', '25711.30063539742', '68', '2012-07-04 12:40:07', 'cck');
INSERT INTO `t_gps_data` VALUES ('2403010', '2012-07-04 12:40:07', '3', '', '32636.618281462193', '11733.317871543502', '66', '2012-07-04 12:40:07', 'clm');
INSERT INTO `t_gps_data` VALUES ('2403011', '2012-07-04 12:40:07', '1', '', '35043.27454813734', '33746.729761441246', '31', '2012-07-04 12:40:07', 'hou');
INSERT INTO `t_gps_data` VALUES ('2403012', '2012-07-04 12:40:07', '0', '', '29856.36981021306', '26208.33802550242', '54', '2012-07-04 12:40:07', 'jur');
INSERT INTO `t_gps_data` VALUES ('2403013', '2012-07-04 12:40:07', '0', '', '33722.25494536695', '26756.50596682155', '65', '2012-07-04 12:40:07', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2403014', '2012-07-04 12:40:17', '0', '', '41323.6135950844', '21531.055193198918', '55', '2012-07-04 12:40:17', '2');
INSERT INTO `t_gps_data` VALUES ('2403015', '2012-07-04 12:40:17', '1', '', '37341.298418938786', '13022.612214072395', '39', '2012-07-04 12:40:17', '1');
INSERT INTO `t_gps_data` VALUES ('2403016', '2012-07-04 12:40:17', '2', '', '36628.29246023174', '27414.31169469426', '77', '2012-07-04 12:40:17', '4');
INSERT INTO `t_gps_data` VALUES ('2403017', '2012-07-04 12:40:17', '0', '', '39882.79312938813', '39523.314847713315', '12', '2012-07-04 12:40:17', '3');
INSERT INTO `t_gps_data` VALUES ('2403018', '2012-07-04 12:40:17', '3', '', '39755.15364418184', '17717.499970419773', '37', '2012-07-04 12:40:17', '5');
INSERT INTO `t_gps_data` VALUES ('2403019', '2012-07-04 12:40:17', '3', '', '32197.30903558789', '35361.4608094868', '41', '2012-07-04 12:40:17', '6');
INSERT INTO `t_gps_data` VALUES ('2403020', '2012-07-04 12:40:17', '3', '', '43601.6063850162', '27271.669958024853', '34', '2012-07-04 12:40:17', '001190251');
INSERT INTO `t_gps_data` VALUES ('2403021', '2012-07-04 12:40:17', '3', '', '43965.0089470092', '19753.093946919', '98', '2012-07-04 12:40:17', '001014182');
INSERT INTO `t_gps_data` VALUES ('2403022', '2012-07-04 12:40:17', '0', '', '36439.1660961862', '19596.888271687203', '75', '2012-07-04 12:40:17', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2403023', '2012-07-04 12:40:17', '1', '', '31262.882189419623', '26727.75277457111', '75', '2012-07-04 12:40:17', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2403024', '2012-07-04 12:40:17', '3', '', '38953.30619574748', '29734.31199457066', '3', '2012-07-04 12:40:17', '001001003');
INSERT INTO `t_gps_data` VALUES ('2403025', '2012-07-04 12:40:17', '1', '', '32337.68111281423', '28759.076410597467', '42', '2012-07-04 12:40:17', '001067110');
INSERT INTO `t_gps_data` VALUES ('2403026', '2012-07-04 12:40:17', '1', '', '38879.83788918692', '39272.2024985407', '96', '2012-07-04 12:40:17', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2403027', '2012-07-04 12:40:17', '2', '', '29052.238778545867', '24712.772391234605', '12', '2012-07-04 12:40:17', 'amk');
INSERT INTO `t_gps_data` VALUES ('2403028', '2012-07-04 12:40:17', '1', '', '41038.123198999674', '17619.56169912232', '100', '2012-07-04 12:40:17', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2403029', '2012-07-04 12:40:17', '3', '', '39015.84319092265', '25683.414961555194', '68', '2012-07-04 12:40:17', 'cck');
INSERT INTO `t_gps_data` VALUES ('2403030', '2012-07-04 12:40:17', '3', '', '32539.551311655057', '11709.571595366146', '66', '2012-07-04 12:40:17', 'clm');
INSERT INTO `t_gps_data` VALUES ('2403031', '2012-07-04 12:40:17', '1', '', '35045.288896315484', '33834.2493707919', '31', '2012-07-04 12:40:17', 'hou');
INSERT INTO `t_gps_data` VALUES ('2403032', '2012-07-04 12:40:17', '0', '', '29839.536351836774', '26115.60584198921', '54', '2012-07-04 12:40:17', 'jur');
INSERT INTO `t_gps_data` VALUES ('2403033', '2012-07-04 12:40:17', '0', '', '33708.898825850054', '26660.266375314066', '65', '2012-07-04 12:40:17', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2403034', '2012-07-04 12:40:27', '0', '', '41314.20562402411', '21496.390516941734', '55', '2012-07-04 12:40:27', '2');
INSERT INTO `t_gps_data` VALUES ('2403035', '2012-07-04 12:40:27', '1', '', '37367.94017166153', '13075.431772694055', '39', '2012-07-04 12:40:27', '1');
INSERT INTO `t_gps_data` VALUES ('2403036', '2012-07-04 12:40:27', '2', '', '36726.35104868133', '27420.593617057657', '77', '2012-07-04 12:40:27', '4');
INSERT INTO `t_gps_data` VALUES ('2403037', '2012-07-04 12:40:27', '0', '', '39864.32237262604', '39435.01242196795', '12', '2012-07-04 12:40:27', '3');
INSERT INTO `t_gps_data` VALUES ('2403038', '2012-07-04 12:40:27', '3', '', '39699.78931362287', '17696.0923975054', '37', '2012-07-04 12:40:27', '5');
INSERT INTO `t_gps_data` VALUES ('2403039', '2012-07-04 12:40:27', '3', '', '32120.87513333067', '35346.915866524876', '41', '2012-07-04 12:40:27', '6');
INSERT INTO `t_gps_data` VALUES ('2403040', '2012-07-04 12:40:27', '3', '', '43564.27945455223', '27260.196456427766', '34', '2012-07-04 12:40:27', '001190251');
INSERT INTO `t_gps_data` VALUES ('2403041', '2012-07-04 12:40:27', '3', '', '43865.47728556764', '19752.014478510133', '98', '2012-07-04 12:40:27', '001014182');
INSERT INTO `t_gps_data` VALUES ('2403042', '2012-07-04 12:40:27', '0', '', '36410.40218996722', '19542.439953746787', '75', '2012-07-04 12:40:27', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2403043', '2012-07-04 12:40:27', '1', '', '31265.963430248867', '26825.228342460152', '75', '2012-07-04 12:40:27', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2403044', '2012-07-04 12:40:27', '3', '', '38905.04298737693', '29706.820234670504', '3', '2012-07-04 12:40:27', '001001003');
INSERT INTO `t_gps_data` VALUES ('2403045', '2012-07-04 12:40:27', '1', '', '32341.74027898684', '28856.94896321481', '42', '2012-07-04 12:40:27', '001067110');
INSERT INTO `t_gps_data` VALUES ('2403046', '2012-07-04 12:40:27', '1', '', '38888.228258433104', '39372.0273437622', '96', '2012-07-04 12:40:27', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2403047', '2012-07-04 12:40:27', '2', '', '29131.945122005716', '24713.601943747955', '12', '2012-07-04 12:40:27', 'amk');
INSERT INTO `t_gps_data` VALUES ('2403048', '2012-07-04 12:40:27', '1', '', '41048.434875491395', '17704.11563759584', '100', '2012-07-04 12:40:27', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2403049', '2012-07-04 12:40:27', '3', '', '38951.774473554375', '25659.559580832578', '68', '2012-07-04 12:40:27', 'cck');
INSERT INTO `t_gps_data` VALUES ('2403050', '2012-07-04 12:40:27', '3', '', '32463.26444095948', '11682.191074131628', '66', '2012-07-04 12:40:27', 'clm');
INSERT INTO `t_gps_data` VALUES ('2403051', '2012-07-04 12:40:27', '1', '', '35060.93441676104', '33886.00258018958', '31', '2012-07-04 12:40:27', 'hou');
INSERT INTO `t_gps_data` VALUES ('2403052', '2012-07-04 12:40:27', '0', '', '29820.58805545998', '26048.58102537344', '54', '2012-07-04 12:40:27', 'jur');
INSERT INTO `t_gps_data` VALUES ('2403053', '2012-07-04 12:40:27', '0', '', '33699.61350552952', '26602.115656308753', '65', '2012-07-04 12:40:27', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2403054', '2012-07-04 12:40:37', '0', '', '41295.56973073763', '21426.66948174583', '55', '2012-07-04 12:40:37', '2');
INSERT INTO `t_gps_data` VALUES ('2403055', '2012-07-04 12:40:37', '1', '', '37381.0289431833', '13119.017367958286', '39', '2012-07-04 12:40:37', '1');
INSERT INTO `t_gps_data` VALUES ('2403056', '2012-07-04 12:40:37', '2', '', '36786.55409134119', '27437.399997109784', '77', '2012-07-04 12:40:37', '4');
INSERT INTO `t_gps_data` VALUES ('2403057', '2012-07-04 12:40:37', '0', '', '39858.23237762741', '39365.49181136423', '12', '2012-07-04 12:40:37', '3');
INSERT INTO `t_gps_data` VALUES ('2403058', '2012-07-04 12:40:37', '3', '', '39629.040653790216', '17671.421233026533', '37', '2012-07-04 12:40:37', '5');
INSERT INTO `t_gps_data` VALUES ('2403059', '2012-07-04 12:40:37', '3', '', '32045.659369138477', '35329.65840943974', '41', '2012-07-04 12:40:37', '6');
INSERT INTO `t_gps_data` VALUES ('2403060', '2012-07-04 12:40:37', '3', '', '43513.65941456385', '27237.62928024702', '34', '2012-07-04 12:40:37', '001190251');
INSERT INTO `t_gps_data` VALUES ('2403061', '2012-07-04 12:40:37', '3', '', '43829.25632305998', '19737.504648125003', '98', '2012-07-04 12:40:37', '001014182');
INSERT INTO `t_gps_data` VALUES ('2403062', '2012-07-04 12:40:37', '0', '', '36380.994790701465', '19470.05927390974', '75', '2012-07-04 12:40:37', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2403063', '2012-07-04 12:40:37', '1', '', '31269.358447303493', '26902.490709724698', '75', '2012-07-04 12:40:37', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2403064', '2012-07-04 12:40:37', '3', '', '38815.06477070161', '29696.925430193034', '3', '2012-07-04 12:40:37', '001001003');
INSERT INTO `t_gps_data` VALUES ('2403065', '2012-07-04 12:40:37', '1', '', '32359.674919661484', '28906.8526551483', '42', '2012-07-04 12:40:37', '001067110');
INSERT INTO `t_gps_data` VALUES ('2403066', '2012-07-04 12:40:37', '1', '', '38910.636958305346', '39412.61192163623', '96', '2012-07-04 12:40:37', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2403067', '2012-07-04 12:40:37', '2', '', '29171.117072383142', '24724.850430129336', '12', '2012-07-04 12:40:37', 'amk');
INSERT INTO `t_gps_data` VALUES ('2403068', '2012-07-04 12:40:37', '1', '', '41051.22361923608', '17753.254082989144', '100', '2012-07-04 12:40:37', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2403069', '2012-07-04 12:40:37', '3', '', '38879.74518691352', '25636.55858873068', '68', '2012-07-04 12:40:37', 'cck');
INSERT INTO `t_gps_data` VALUES ('2403070', '2012-07-04 12:40:37', '3', '', '32416.63376810301', '11656.695373451692', '66', '2012-07-04 12:40:37', 'clm');
INSERT INTO `t_gps_data` VALUES ('2403071', '2012-07-04 12:40:37', '1', '', '35068.8053786895', '33940.40387639346', '31', '2012-07-04 12:40:37', 'hou');
INSERT INTO `t_gps_data` VALUES ('2403072', '2012-07-04 12:40:37', '0', '', '29802.650509674364', '25988.504732967096', '54', '2012-07-04 12:40:37', 'jur');
INSERT INTO `t_gps_data` VALUES ('2403073', '2012-07-04 12:40:37', '0', '', '33690.65458353465', '26532.467184274927', '65', '2012-07-04 12:40:37', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2403074', '2012-07-04 12:40:47', '0', '', '41273.15098998256', '21371.253603336605', '55', '2012-07-04 12:40:47', '2');
INSERT INTO `t_gps_data` VALUES ('2403075', '2012-07-04 12:40:47', '1', '', '37391.940039308036', '13189.16991339504', '39', '2012-07-04 12:40:47', '1');
INSERT INTO `t_gps_data` VALUES ('2403076', '2012-07-04 12:40:47', '2', '', '36862.1998781022', '27449.21909718071', '77', '2012-07-04 12:40:47', '4');
INSERT INTO `t_gps_data` VALUES ('2403077', '2012-07-04 12:40:47', '0', '', '39831.12018188864', '39312.788328685005', '12', '2012-07-04 12:40:47', '3');
INSERT INTO `t_gps_data` VALUES ('2403078', '2012-07-04 12:40:47', '3', '', '39586.79088157595', '17654.14967948418', '37', '2012-07-04 12:40:47', '5');
INSERT INTO `t_gps_data` VALUES ('2403079', '2012-07-04 12:40:47', '3', '', '31990.933937211375', '35308.518650172955', '41', '2012-07-04 12:40:47', '6');
INSERT INTO `t_gps_data` VALUES ('2403080', '2012-07-04 12:40:47', '3', '', '43467.240582007544', '27228.841036212612', '34', '2012-07-04 12:40:47', '001190251');
INSERT INTO `t_gps_data` VALUES ('2403081', '2012-07-04 12:40:47', '3', '', '43743.47541711315', '19721.851398136896', '98', '2012-07-04 12:40:47', '001014182');
INSERT INTO `t_gps_data` VALUES ('2403082', '2012-07-04 12:40:47', '0', '', '36352.63903654069', '19424.47003036712', '75', '2012-07-04 12:40:47', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2403083', '2012-07-04 12:40:47', '1', '', '31288.952918010436', '26969.397585009134', '75', '2012-07-04 12:40:47', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2403084', '2012-07-04 12:40:47', '3', '', '38779.38334165963', '29685.68086920945', '3', '2012-07-04 12:40:47', '001001003');
INSERT INTO `t_gps_data` VALUES ('2403085', '2012-07-04 12:40:47', '1', '', '32360.587595864406', '28967.25518335243', '42', '2012-07-04 12:40:47', '001067110');
INSERT INTO `t_gps_data` VALUES ('2403086', '2012-07-04 12:40:47', '1', '', '38911.60934787444', '39456.3701852745', '96', '2012-07-04 12:40:47', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2403087', '2012-07-04 12:40:47', '2', '', '29221.581688780785', '24743.80768888996', '12', '2012-07-04 12:40:47', 'amk');
INSERT INTO `t_gps_data` VALUES ('2403088', '2012-07-04 12:40:47', '1', '', '41064.31875501682', '17793.614482711968', '100', '2012-07-04 12:40:47', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2403089', '2012-07-04 12:40:47', '3', '', '38838.26528880198', '25619.141996861792', '68', '2012-07-04 12:40:47', 'cck');
INSERT INTO `t_gps_data` VALUES ('2403090', '2012-07-04 12:40:47', '3', '', '32355.40901182205', '11645.28878124422', '66', '2012-07-04 12:40:47', 'clm');
INSERT INTO `t_gps_data` VALUES ('2403091', '2012-07-04 12:40:47', '1', '', '35081.89415948545', '34035.50040862223', '31', '2012-07-04 12:40:47', 'hou');
INSERT INTO `t_gps_data` VALUES ('2403092', '2012-07-04 12:40:47', '0', '', '29786.260589410827', '25932.220139167133', '54', '2012-07-04 12:40:47', 'jur');
INSERT INTO `t_gps_data` VALUES ('2403093', '2012-07-04 12:40:47', '0', '', '33665.90509012172', '26452.39299586902', '65', '2012-07-04 12:40:47', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2403094', '2012-07-04 12:40:57', '0', '', '41267.77015113967', '21271.77758352871', '55', '2012-07-04 12:40:57', '2');
INSERT INTO `t_gps_data` VALUES ('2403095', '2012-07-04 12:40:57', '1', '', '37403.15289269936', '13282.51899109771', '39', '2012-07-04 12:40:57', '1');
INSERT INTO `t_gps_data` VALUES ('2403096', '2012-07-04 12:40:57', '2', '', '36935.32354273097', '27471.06052865904', '77', '2012-07-04 12:40:57', '4');
INSERT INTO `t_gps_data` VALUES ('2403097', '2012-07-04 12:40:57', '0', '', '39806.29540853279', '39270.77741672279', '12', '2012-07-04 12:40:57', '3');
INSERT INTO `t_gps_data` VALUES ('2403098', '2012-07-04 12:40:57', '3', '', '39554.85505742996', '17644.881937886938', '37', '2012-07-04 12:40:57', '5');
INSERT INTO `t_gps_data` VALUES ('2403099', '2012-07-04 12:40:57', '3', '', '31943.973036452855', '35294.45658641489', '41', '2012-07-04 12:40:57', '6');
INSERT INTO `t_gps_data` VALUES ('2403100', '2012-07-04 12:40:57', '3', '', '43384.557104532316', '27213.417567093053', '34', '2012-07-04 12:40:57', '001190251');
INSERT INTO `t_gps_data` VALUES ('2403101', '2012-07-04 12:40:57', '3', '', '43671.731950451445', '19718.62530448539', '98', '2012-07-04 12:40:57', '001014182');
INSERT INTO `t_gps_data` VALUES ('2403102', '2012-07-04 12:40:57', '0', '', '36323.9976192516', '19337.133730961803', '75', '2012-07-04 12:40:57', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2403103', '2012-07-04 12:40:57', '1', '', '31295.69610519078', '27003.127829045432', '75', '2012-07-04 12:40:57', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2403104', '2012-07-04 12:40:57', '3', '', '38717.11168001791', '29684.014277812043', '3', '2012-07-04 12:40:57', '001001003');
INSERT INTO `t_gps_data` VALUES ('2403105', '2012-07-04 12:40:57', '1', '', '32366.324799470138', '29050.90462056359', '42', '2012-07-04 12:40:57', '001067110');
INSERT INTO `t_gps_data` VALUES ('2403106', '2012-07-04 12:40:57', '0', '', '38932.9333574118', '39533.60169197308', '96', '2012-07-04 12:40:57', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2403107', '2012-07-04 12:40:57', '2', '', '29312.725217927444', '24756.120114838504', '12', '2012-07-04 12:40:57', 'amk');
INSERT INTO `t_gps_data` VALUES ('2403108', '2012-07-04 12:40:57', '1', '', '41080.82438658308', '17877.781408497416', '100', '2012-07-04 12:40:57', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2403109', '2012-07-04 12:40:57', '3', '', '38784.66666013074', '25596.30393761125', '68', '2012-07-04 12:40:57', 'cck');
INSERT INTO `t_gps_data` VALUES ('2403110', '2012-07-04 12:40:57', '3', '', '32278.923409429448', '11630.840805048869', '66', '2012-07-04 12:40:57', 'clm');
INSERT INTO `t_gps_data` VALUES ('2403111', '2012-07-04 12:40:57', '1', '', '35087.65822699866', '34081.505334813446', '31', '2012-07-04 12:40:57', 'hou');
INSERT INTO `t_gps_data` VALUES ('2403112', '2012-07-04 12:40:57', '0', '', '29782.707914320334', '25835.588041043422', '54', '2012-07-04 12:40:57', 'jur');
INSERT INTO `t_gps_data` VALUES ('2403113', '2012-07-04 12:40:57', '0', '', '33647.54657202368', '26364.22798878756', '65', '2012-07-04 12:40:57', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2403114', '2012-07-04 12:41:07', '0', '', '41239.892321241765', '21219.537132494173', '55', '2012-07-04 12:41:07', '2');
INSERT INTO `t_gps_data` VALUES ('2403115', '2012-07-04 12:41:07', '1', '', '37428.533602961106', '13357.997880534987', '39', '2012-07-04 12:41:07', '1');
INSERT INTO `t_gps_data` VALUES ('2403116', '2012-07-04 12:41:07', '2', '', '36992.45570413513', '27488.187573277326', '77', '2012-07-04 12:41:07', '4');
INSERT INTO `t_gps_data` VALUES ('2403117', '2012-07-04 12:41:07', '0', '', '39786.846390331295', '39204.395105440766', '12', '2012-07-04 12:41:07', '3');
INSERT INTO `t_gps_data` VALUES ('2403118', '2012-07-04 12:41:07', '3', '', '39461.23958803378', '17633.73621650064', '37', '2012-07-04 12:41:07', '5');
INSERT INTO `t_gps_data` VALUES ('2403119', '2012-07-04 12:41:07', '3', '', '31868.433140017416', '35277.666899534874', '41', '2012-07-04 12:41:07', '6');
INSERT INTO `t_gps_data` VALUES ('2403120', '2012-07-04 12:41:07', '3', '', '43338.12878668168', '27184.344907412436', '34', '2012-07-04 12:41:07', '001190251');
INSERT INTO `t_gps_data` VALUES ('2403121', '2012-07-04 12:41:07', '3', '', '43608.66717544006', '19691.54656618056', '98', '2012-07-04 12:41:07', '001014182');
INSERT INTO `t_gps_data` VALUES ('2403122', '2012-07-04 12:41:07', '0', '', '36308.015563564564', '19237.151401369254', '75', '2012-07-04 12:41:07', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2403123', '2012-07-04 12:41:07', '1', '', '31304.938386803504', '27097.072827645923', '75', '2012-07-04 12:41:07', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2403124', '2012-07-04 12:41:07', '3', '', '38647.467025244776', '29665.258648968265', '3', '2012-07-04 12:41:07', '001001003');
INSERT INTO `t_gps_data` VALUES ('2403125', '2012-07-04 12:41:07', '1', '', '32368.522310593136', '29093.550692881847', '42', '2012-07-04 12:41:07', '001067110');
INSERT INTO `t_gps_data` VALUES ('2403126', '2012-07-04 12:41:07', '0', '', '38926.588435712125', '39502.08486885772', '96', '2012-07-04 12:41:07', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2403127', '2012-07-04 12:41:07', '2', '', '29371.038321331787', '24762.98006656241', '12', '2012-07-04 12:41:07', 'amk');
INSERT INTO `t_gps_data` VALUES ('2403128', '2012-07-04 12:41:07', '1', '', '41085.54748522951', '17931.15563000003', '100', '2012-07-04 12:41:07', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2403129', '2012-07-04 12:41:07', '3', '', '38729.85780933879', '25588.253397943718', '68', '2012-07-04 12:41:07', 'cck');
INSERT INTO `t_gps_data` VALUES ('2403130', '2012-07-04 12:41:07', '3', '', '32198.687749954086', '11620.275923381663', '66', '2012-07-04 12:41:07', 'clm');
INSERT INTO `t_gps_data` VALUES ('2403131', '2012-07-04 12:41:07', '1', '', '35093.31036887871', '34166.31380050198', '31', '2012-07-04 12:41:07', 'hou');
INSERT INTO `t_gps_data` VALUES ('2403132', '2012-07-04 12:41:07', '0', '', '29778.886011810944', '25797.922250406093', '54', '2012-07-04 12:41:07', 'jur');
INSERT INTO `t_gps_data` VALUES ('2403133', '2012-07-04 12:41:07', '0', '', '33645.61525950057', '26301.053668321845', '65', '2012-07-04 12:41:07', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2403134', '2012-07-04 12:41:17', '0', '', '41214.253009080916', '21132.768534565377', '55', '2012-07-04 12:41:17', '2');
INSERT INTO `t_gps_data` VALUES ('2403135', '2012-07-04 12:41:17', '1', '', '37446.12304898276', '13449.849348320626', '39', '2012-07-04 12:41:17', '1');
INSERT INTO `t_gps_data` VALUES ('2403136', '2012-07-04 12:41:17', '2', '', '37035.60602420606', '27511.19039001738', '77', '2012-07-04 12:41:17', '4');
INSERT INTO `t_gps_data` VALUES ('2403137', '2012-07-04 12:41:17', '0', '', '39783.03818347261', '39121.946505934364', '12', '2012-07-04 12:41:17', '3');
INSERT INTO `t_gps_data` VALUES ('2403138', '2012-07-04 12:41:17', '3', '', '39376.09541365813', '17625.79572918061', '37', '2012-07-04 12:41:17', '5');
INSERT INTO `t_gps_data` VALUES ('2403139', '2012-07-04 12:41:17', '3', '', '31807.82019895012', '35266.248760618604', '41', '2012-07-04 12:41:17', '6');
INSERT INTO `t_gps_data` VALUES ('2403140', '2012-07-04 12:41:17', '3', '', '43293.04630214963', '27180.318114737696', '34', '2012-07-04 12:41:17', '001190251');
INSERT INTO `t_gps_data` VALUES ('2403141', '2012-07-04 12:41:17', '3', '', '43554.90147462762', '19661.565862914646', '98', '2012-07-04 12:41:17', '001014182');
INSERT INTO `t_gps_data` VALUES ('2403142', '2012-07-04 12:41:17', '0', '', '36280.09656379944', '19173.68702443805', '75', '2012-07-04 12:41:17', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2403143', '2012-07-04 12:41:17', '1', '', '31331.68363546776', '27174.4623903398', '75', '2012-07-04 12:41:17', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2403144', '2012-07-04 12:41:17', '3', '', '38566.04974453146', '29641.298390491484', '3', '2012-07-04 12:41:17', '001001003');
INSERT INTO `t_gps_data` VALUES ('2403145', '2012-07-04 12:41:17', '1', '', '32388.97768267818', '29145.27081114804', '42', '2012-07-04 12:41:17', '001067110');
INSERT INTO `t_gps_data` VALUES ('2403146', '2012-07-04 12:41:17', '0', '', '38925.80981571178', '39407.31331723025', '96', '2012-07-04 12:41:17', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2403147', '2012-07-04 12:41:17', '2', '', '29403.88557110933', '24765.25362452194', '12', '2012-07-04 12:41:17', 'amk');
INSERT INTO `t_gps_data` VALUES ('2403148', '2012-07-04 12:41:17', '1', '', '41096.68940456792', '17963.79279236703', '100', '2012-07-04 12:41:17', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2403149', '2012-07-04 12:41:17', '3', '', '38645.47731387071', '25583.969305924304', '68', '2012-07-04 12:41:17', 'cck');
INSERT INTO `t_gps_data` VALUES ('2403150', '2012-07-04 12:41:17', '3', '', '32109.478908738824', '11619.638579185375', '66', '2012-07-04 12:41:17', 'clm');
INSERT INTO `t_gps_data` VALUES ('2403151', '2012-07-04 12:41:17', '1', '', '35102.70912348419', '34240.11395317497', '31', '2012-07-04 12:41:17', 'hou');
INSERT INTO `t_gps_data` VALUES ('2403152', '2012-07-04 12:41:17', '0', '', '29763.410384319617', '25755.672324705432', '54', '2012-07-04 12:41:17', 'jur');
INSERT INTO `t_gps_data` VALUES ('2403153', '2012-07-04 12:41:17', '0', '', '33629.88475921757', '26269.145249844893', '65', '2012-07-04 12:41:17', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2403154', '2012-07-04 12:41:27', '0', '', '41208.433928667146', '21096.050864428165', '55', '2012-07-04 12:41:27', '2');
INSERT INTO `t_gps_data` VALUES ('2403155', '2012-07-04 12:41:27', '1', '', '37449.29412821772', '13519.607469956838', '39', '2012-07-04 12:41:27', '1');
INSERT INTO `t_gps_data` VALUES ('2403156', '2012-07-04 12:41:27', '2', '', '37094.584298897826', '27511.828546802397', '77', '2012-07-04 12:41:27', '4');
INSERT INTO `t_gps_data` VALUES ('2403157', '2012-07-04 12:41:27', '0', '', '39769.63824192337', '39071.52237752344', '12', '2012-07-04 12:41:27', '3');
INSERT INTO `t_gps_data` VALUES ('2403158', '2012-07-04 12:41:27', '3', '', '39313.94227006401', '17606.08960338414', '37', '2012-07-04 12:41:27', '5');
INSERT INTO `t_gps_data` VALUES ('2403159', '2012-07-04 12:41:27', '3', '', '31717.391571191474', '35244.71798806042', '41', '2012-07-04 12:41:27', '6');
INSERT INTO `t_gps_data` VALUES ('2403160', '2012-07-04 12:41:27', '3', '', '43254.807990116795', '27173.411978580858', '34', '2012-07-04 12:41:27', '001190251');
INSERT INTO `t_gps_data` VALUES ('2403161', '2012-07-04 12:41:27', '3', '', '43518.32091652537', '19643.7539711652', '98', '2012-07-04 12:41:27', '001014182');
INSERT INTO `t_gps_data` VALUES ('2403162', '2012-07-04 12:41:27', '0', '', '36270.14781506933', '19100.410693341826', '75', '2012-07-04 12:41:27', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2403163', '2012-07-04 12:41:27', '1', '', '31333.751464239223', '27269.060761415178', '75', '2012-07-04 12:41:27', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2403164', '2012-07-04 12:41:27', '3', '', '38532.42857112917', '29621.572402917005', '3', '2012-07-04 12:41:27', '001001003');
INSERT INTO `t_gps_data` VALUES ('2403165', '2012-07-04 12:41:27', '1', '', '32405.341768057373', '29230.73145107789', '42', '2012-07-04 12:41:27', '001067110');
INSERT INTO `t_gps_data` VALUES ('2403166', '2012-07-04 12:41:27', '0', '', '38919.71962640858', '39323.638349479836', '96', '2012-07-04 12:41:27', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2403167', '2012-07-04 12:41:27', '2', '', '29461.843211982323', '24768.8732743408', '12', '2012-07-04 12:41:27', 'amk');
INSERT INTO `t_gps_data` VALUES ('2403168', '2012-07-04 12:41:27', '1', '', '41109.00014895386', '18006.774865320072', '100', '2012-07-04 12:41:27', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2403169', '2012-07-04 12:41:27', '3', '', '38577.85180824916', '25569.092705148752', '68', '2012-07-04 12:41:27', 'cck');
INSERT INTO `t_gps_data` VALUES ('2403170', '2012-07-04 12:41:27', '3', '', '32034.301081557296', '11590.250739118554', '66', '2012-07-04 12:41:27', 'clm');
INSERT INTO `t_gps_data` VALUES ('2403171', '2012-07-04 12:41:27', '1', '', '35107.29986676899', '34334.05436981431', '31', '2012-07-04 12:41:27', 'hou');
INSERT INTO `t_gps_data` VALUES ('2403172', '2012-07-04 12:41:27', '0', '', '29756.874991546785', '25678.074831094364', '54', '2012-07-04 12:41:27', 'jur');
INSERT INTO `t_gps_data` VALUES ('2403173', '2012-07-04 12:41:27', '0', '', '33604.43125098637', '26181.50887888641', '65', '2012-07-04 12:41:27', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2403174', '2012-07-04 12:41:37', '0', '', '41182.32573231357', '21019.26106259968', '55', '2012-07-04 12:41:37', '2');
INSERT INTO `t_gps_data` VALUES ('2403175', '2012-07-04 12:41:37', '1', '', '37475.937817912214', '13587.231439989404', '39', '2012-07-04 12:41:37', '1');
INSERT INTO `t_gps_data` VALUES ('2403176', '2012-07-04 12:41:37', '2', '', '37172.43742015739', '27516.800168455262', '77', '2012-07-04 12:41:37', '4');
INSERT INTO `t_gps_data` VALUES ('2403177', '2012-07-04 12:41:37', '0', '', '39759.07558145085', '39014.45212170514', '12', '2012-07-04 12:41:37', '3');
INSERT INTO `t_gps_data` VALUES ('2403178', '2012-07-04 12:41:37', '3', '', '39275.384052766414', '17599.093547210283', '37', '2012-07-04 12:41:37', '5');
INSERT INTO `t_gps_data` VALUES ('2403179', '2012-07-04 12:41:37', '3', '', '31661.754354257526', '35221.012478524746', '41', '2012-07-04 12:41:37', '6');
INSERT INTO `t_gps_data` VALUES ('2403180', '2012-07-04 12:41:37', '3', '', '43214.036298463594', '27171.9228672481', '34', '2012-07-04 12:41:37', '001190251');
INSERT INTO `t_gps_data` VALUES ('2403181', '2012-07-04 12:41:37', '3', '', '43443.2902260773', '19626.55256623497', '98', '2012-07-04 12:41:37', '001014182');
INSERT INTO `t_gps_data` VALUES ('2403182', '2012-07-04 12:41:37', '0', '', '36265.88904927282', '19036.872996776696', '75', '2012-07-04 12:41:37', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2403183', '2012-07-04 12:41:37', '1', '', '31337.58590827766', '27341.562787026374', '75', '2012-07-04 12:41:37', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2403184', '2012-07-04 12:41:38', '3', '', '38490.73434711017', '29602.884013644514', '3', '2012-07-04 12:41:38', '001001003');
INSERT INTO `t_gps_data` VALUES ('2403185', '2012-07-04 12:41:38', '1', '', '32411.16842248779', '29295.016174170978', '42', '2012-07-04 12:41:38', '001067110');
INSERT INTO `t_gps_data` VALUES ('2403186', '2012-07-04 12:41:38', '0', '', '38911.89918244089', '39246.50034059912', '96', '2012-07-04 12:41:38', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2403187', '2012-07-04 12:41:38', '2', '', '29550.22844613', '24793.86945642775', '12', '2012-07-04 12:41:38', 'amk');
INSERT INTO `t_gps_data` VALUES ('2403188', '2012-07-04 12:41:38', '1', '', '41136.61756864439', '18041.895674926112', '100', '2012-07-04 12:41:38', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2403189', '2012-07-04 12:41:38', '3', '', '38503.37988092438', '25548.00483973396', '68', '2012-07-04 12:41:38', 'cck');
INSERT INTO `t_gps_data` VALUES ('2403190', '2012-07-04 12:41:38', '3', '', '31967.822534823776', '11578.020695450383', '66', '2012-07-04 12:41:38', 'clm');
INSERT INTO `t_gps_data` VALUES ('2403191', '2012-07-04 12:41:38', '1', '', '35111.416697800654', '34409.25760783828', '31', '2012-07-04 12:41:38', 'hou');
INSERT INTO `t_gps_data` VALUES ('2403192', '2012-07-04 12:41:38', '0', '', '29732.561636552287', '25621.743153817115', '54', '2012-07-04 12:41:38', 'jur');
INSERT INTO `t_gps_data` VALUES ('2403193', '2012-07-04 12:41:38', '0', '', '33592.02691291554', '26095.389013021166', '65', '2012-07-04 12:41:38', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2403194', '2012-07-04 12:41:48', '0', '', '41182.01923691412', '20956.1288626696', '55', '2012-07-04 12:41:48', '2');
INSERT INTO `t_gps_data` VALUES ('2403195', '2012-07-04 12:41:48', '1', '', '37499.745739679456', '13664.89012304871', '39', '2012-07-04 12:41:48', '1');
INSERT INTO `t_gps_data` VALUES ('2403196', '2012-07-04 12:41:48', '2', '', '37272.223041146', '27538.875591580687', '77', '2012-07-04 12:41:48', '4');
INSERT INTO `t_gps_data` VALUES ('2403197', '2012-07-04 12:41:48', '0', '', '39754.65200633992', '38964.49308856608', '12', '2012-07-04 12:41:48', '3');
INSERT INTO `t_gps_data` VALUES ('2403198', '2012-07-04 12:41:48', '3', '', '39184.713842366225', '17576.17403359101', '37', '2012-07-04 12:41:48', '5');
INSERT INTO `t_gps_data` VALUES ('2403199', '2012-07-04 12:41:48', '3', '', '31608.92937269635', '35216.01224848274', '41', '2012-07-04 12:41:48', '6');
INSERT INTO `t_gps_data` VALUES ('2403200', '2012-07-04 12:41:48', '3', '', '43127.51179226578', '27157.917999730245', '34', '2012-07-04 12:41:48', '001190251');
INSERT INTO `t_gps_data` VALUES ('2403201', '2012-07-04 12:41:48', '3', '', '43365.86873042146', '19601.63173253491', '98', '2012-07-04 12:41:48', '001014182');
INSERT INTO `t_gps_data` VALUES ('2403202', '2012-07-04 12:41:48', '0', '', '36251.459160705344', '18963.030673965935', '75', '2012-07-04 12:41:48', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2403203', '2012-07-04 12:41:48', '1', '', '31339.12610956846', '27401.393305020207', '75', '2012-07-04 12:41:48', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2403204', '2012-07-04 12:41:48', '3', '', '38444.4139770476', '29578.502866345316', '3', '2012-07-04 12:41:48', '001001003');
INSERT INTO `t_gps_data` VALUES ('2403205', '2012-07-04 12:41:48', '1', '', '32428.805855548002', '29363.521677156376', '42', '2012-07-04 12:41:48', '001067110');
INSERT INTO `t_gps_data` VALUES ('2403206', '2012-07-04 12:41:48', '0', '', '38883.95449614921', '39193.93838454764', '96', '2012-07-04 12:41:48', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2403207', '2012-07-04 12:41:48', '2', '', '29637.443383150738', '24803.416856257827', '12', '2012-07-04 12:41:48', 'amk');
INSERT INTO `t_gps_data` VALUES ('2403208', '2012-07-04 12:41:48', '1', '', '41155.014007128375', '18113.15082314672', '100', '2012-07-04 12:41:48', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2403209', '2012-07-04 12:41:48', '3', '', '38466.192811728455', '25529.983591085005', '68', '2012-07-04 12:41:48', 'cck');
INSERT INTO `t_gps_data` VALUES ('2403210', '2012-07-04 12:41:48', '3', '', '31898.46049790765', '11550.86138391304', '66', '2012-07-04 12:41:48', 'clm');
INSERT INTO `t_gps_data` VALUES ('2403211', '2012-07-04 12:41:48', '1', '', '35114.03183510602', '34503.94269304081', '31', '2012-07-04 12:41:48', 'hou');
INSERT INTO `t_gps_data` VALUES ('2403212', '2012-07-04 12:41:48', '0', '', '29731.934709484623', '25562.20162872227', '54', '2012-07-04 12:41:48', 'jur');
INSERT INTO `t_gps_data` VALUES ('2403213', '2012-07-04 12:41:48', '0', '', '33572.32670467807', '26046.47500536832', '65', '2012-07-04 12:41:48', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2403214', '2012-07-04 12:41:58', '0', '', '41179.624607479476', '20899.367986762085', '55', '2012-07-04 12:41:58', '2');
INSERT INTO `t_gps_data` VALUES ('2403215', '2012-07-04 12:41:58', '1', '', '37522.112168648186', '13733.74990667398', '39', '2012-07-04 12:41:58', '1');
INSERT INTO `t_gps_data` VALUES ('2403216', '2012-07-04 12:41:58', '2', '', '37333.73812580179', '27543.072813022518', '77', '2012-07-04 12:41:58', '4');
INSERT INTO `t_gps_data` VALUES ('2403217', '2012-07-04 12:41:58', '0', '', '39753.43909266783', '38887.4526607204', '12', '2012-07-04 12:41:58', '3');
INSERT INTO `t_gps_data` VALUES ('2403218', '2012-07-04 12:41:58', '3', '', '39085.23813017635', '17560.71394095736', '37', '2012-07-04 12:41:58', '5');
INSERT INTO `t_gps_data` VALUES ('2403219', '2012-07-04 12:41:58', '3', '', '31521.52442907297', '35207.514748482914', '41', '2012-07-04 12:41:58', '6');
INSERT INTO `t_gps_data` VALUES ('2403220', '2012-07-04 12:41:58', '3', '', '43043.802473158845', '27130.513883364874', '34', '2012-07-04 12:41:58', '001190251');
INSERT INTO `t_gps_data` VALUES ('2403221', '2012-07-04 12:41:58', '3', '', '43335.13054209903', '19593.95811066868', '98', '2012-07-04 12:41:58', '001014182');
INSERT INTO `t_gps_data` VALUES ('2403222', '2012-07-04 12:41:58', '0', '', '36238.9748256291', '18903.94537383286', '75', '2012-07-04 12:41:58', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2403223', '2012-07-04 12:41:58', '1', '', '31365.563765200437', '27483.877832221307', '75', '2012-07-04 12:41:58', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2403224', '2012-07-04 12:41:58', '3', '', '38402.66806798659', '29564.4694282166', '3', '2012-07-04 12:41:58', '001001003');
INSERT INTO `t_gps_data` VALUES ('2403225', '2012-07-04 12:41:58', '1', '', '32453.649755953975', '29438.662777352863', '42', '2012-07-04 12:41:58', '001067110');
INSERT INTO `t_gps_data` VALUES ('2403226', '2012-07-04 12:41:58', '0', '', '38854.207592765204', '39123.07368368023', '96', '2012-07-04 12:41:58', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2403227', '2012-07-04 12:41:58', '2', '', '29712.913236288787', '24820.611459351905', '12', '2012-07-04 12:41:58', 'amk');
INSERT INTO `t_gps_data` VALUES ('2403228', '2012-07-04 12:41:58', '1', '', '41180.91514314847', '18145.430519655376', '100', '2012-07-04 12:41:58', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2403229', '2012-07-04 12:41:58', '3', '', '38394.39522597128', '25520.859592822628', '68', '2012-07-04 12:41:58', 'cck');
INSERT INTO `t_gps_data` VALUES ('2403230', '2012-07-04 12:41:58', '3', '', '31825.342047036036', '11527.034593956925', '66', '2012-07-04 12:41:58', 'clm');
INSERT INTO `t_gps_data` VALUES ('2403231', '2012-07-04 12:41:58', '1', '', '35126.38490799333', '34534.24754749245', '31', '2012-07-04 12:41:58', 'hou');
INSERT INTO `t_gps_data` VALUES ('2403232', '2012-07-04 12:41:58', '0', '', '29721.727556814152', '25477.46075899385', '54', '2012-07-04 12:41:58', 'jur');
INSERT INTO `t_gps_data` VALUES ('2403233', '2012-07-04 12:41:58', '0', '', '33548.108093070565', '25957.38359449082', '65', '2012-07-04 12:41:58', 'tpy');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'admin2222', 'admin');
INSERT INTO `t_role` VALUES ('4', 'asdfasf', 'asdfas');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'weiwei', 'weiwei', 'admin');
INSERT INTO `t_user` VALUES ('2', 'test', 'test', 'test account', 'default');
INSERT INTO `t_user` VALUES ('5', 'asdfas', 'sdfasdf', 'sdfasdf', 'default');

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
