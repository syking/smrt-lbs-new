/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50511
Source Host           : localhost:3306
Source Database       : vms_db

Target Server Type    : MYSQL
Target Server Version : 50511
File Encoding         : 65001

Date: 2012-07-09 19:32:00
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
INSERT INTO `t_driver` VALUES ('1', 'TEST1111', 'jack', '74689', '2', '11');
INSERT INTO `t_driver` VALUES ('2', '222asdfasfdsf', 'tangseng', '74652', '2', '11');
INSERT INTO `t_driver` VALUES ('3', '', 'zhulaoer', '74631', '2', null);
INSERT INTO `t_driver` VALUES ('4', 'jlk;jhkluy', 'xiaobai', '74571', '2', '2');
INSERT INTO `t_driver` VALUES ('8', 'asdf', 'xiaohei', '74538', '4', null);
INSERT INTO `t_driver` VALUES ('9', 'sadf', 'xiaoji', '74498', '4', '2');
INSERT INTO `t_driver` VALUES ('10', 'sf', 'xiaozhu', '74484', '6', null);
INSERT INTO `t_driver` VALUES ('11', 'sdf', 'dahei', '74483', '6', null);
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
) ENGINE=InnoDB AUTO_INCREMENT=2835594 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_gps_data
-- ----------------------------
INSERT INTO `t_gps_data` VALUES ('2835154', '2012-07-09 19:28:20', '1', '', '39172.88076905769', '37095.290562908114', '60', '2012-07-09 19:28:20', '2');
INSERT INTO `t_gps_data` VALUES ('2835155', '2012-07-09 19:28:20', '3', '', '39887.16780280947', '18064.185403239004', '98', '2012-07-09 19:28:20', '1');
INSERT INTO `t_gps_data` VALUES ('2835156', '2012-07-09 19:28:20', '3', '', '35797.29451221933', '28106.488304211623', '15', '2012-07-09 19:28:20', '4');
INSERT INTO `t_gps_data` VALUES ('2835157', '2012-07-09 19:28:20', '0', '', '40151.429582716446', '27076.643860537628', '46', '2012-07-09 19:28:20', '3');
INSERT INTO `t_gps_data` VALUES ('2835158', '2012-07-09 19:28:20', '2', '', '40316.30927424421', '13990.092943753114', '70', '2012-07-09 19:28:20', '5');
INSERT INTO `t_gps_data` VALUES ('2835159', '2012-07-09 19:28:20', '1', '', '37612.09506111418', '36099.49977962146', '64', '2012-07-09 19:28:20', '6');
INSERT INTO `t_gps_data` VALUES ('2835160', '2012-07-09 19:28:20', '2', '', '38880.556852758746', '36058.01940273573', '37', '2012-07-09 19:28:20', '001190251');
INSERT INTO `t_gps_data` VALUES ('2835161', '2012-07-09 19:28:20', '3', '', '40677.720524032855', '23714.42620023327', '41', '2012-07-09 19:28:20', '001014182');
INSERT INTO `t_gps_data` VALUES ('2835162', '2012-07-09 19:28:20', '3', '', '39693.23365470464', '24292.743242758297', '77', '2012-07-09 19:28:20', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2835163', '2012-07-09 19:28:20', '0', '', '39459.448450516524', '20631.578908488234', '6', '2012-07-09 19:28:20', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2835164', '2012-07-09 19:28:20', '0', '', '43973.13121103799', '39412.9586968787', '77', '2012-07-09 19:28:20', '001001003');
INSERT INTO `t_gps_data` VALUES ('2835165', '2012-07-09 19:28:20', '0', '', '30355.63361344486', '27565.605782886796', '88', '2012-07-09 19:28:20', '001067110');
INSERT INTO `t_gps_data` VALUES ('2835166', '2012-07-09 19:28:20', '2', '', '44378.140115400725', '15797.787903144803', '14', '2012-07-09 19:28:20', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2835167', '2012-07-09 19:28:20', '0', '', '35153.3208676333', '36614.05693258768', '94', '2012-07-09 19:28:20', 'amk');
INSERT INTO `t_gps_data` VALUES ('2835168', '2012-07-09 19:28:20', '3', '', '43939.732605927704', '36430.081287485715', '37', '2012-07-09 19:28:20', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2835169', '2012-07-09 19:28:20', '1', '', '41113.59235271617', '25498.27166467597', '100', '2012-07-09 19:28:20', 'cck');
INSERT INTO `t_gps_data` VALUES ('2835170', '2012-07-09 19:28:20', '2', '', '33694.91721561341', '28802.643855643968', '21', '2012-07-09 19:28:20', 'clm');
INSERT INTO `t_gps_data` VALUES ('2835171', '2012-07-09 19:28:20', '3', '', '36180.578541535186', '17001.62148622671', '87', '2012-07-09 19:28:20', 'hou');
INSERT INTO `t_gps_data` VALUES ('2835172', '2012-07-09 19:28:20', '3', '', '37702.49673655117', '27411.46449711891', '1', '2012-07-09 19:28:20', 'jur');
INSERT INTO `t_gps_data` VALUES ('2835173', '2012-07-09 19:28:20', '3', '', '43703.79014505398', '26420.756051965407', '40', '2012-07-09 19:28:20', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2835174', '2012-07-09 19:28:30', '1', '', '39198.98056708172', '37189.26475904153', '60', '2012-07-09 19:28:30', '2');
INSERT INTO `t_gps_data` VALUES ('2835175', '2012-07-09 19:28:30', '3', '', '39836.401480640096', '18034.192883529126', '98', '2012-07-09 19:28:30', '1');
INSERT INTO `t_gps_data` VALUES ('2835176', '2012-07-09 19:28:30', '3', '', '35705.479860756095', '28086.836271751312', '15', '2012-07-09 19:28:30', '4');
INSERT INTO `t_gps_data` VALUES ('2835177', '2012-07-09 19:28:30', '0', '', '40129.09186762812', '27014.398154205686', '46', '2012-07-09 19:28:30', '3');
INSERT INTO `t_gps_data` VALUES ('2835178', '2012-07-09 19:28:30', '2', '', '40355.690507195686', '14017.425064233845', '70', '2012-07-09 19:28:30', '5');
INSERT INTO `t_gps_data` VALUES ('2835179', '2012-07-09 19:28:30', '1', '', '37627.9667100513', '36152.23379043554', '64', '2012-07-09 19:28:30', '6');
INSERT INTO `t_gps_data` VALUES ('2835180', '2012-07-09 19:28:30', '2', '', '38968.51346812569', '36081.82892269414', '37', '2012-07-09 19:28:30', '001190251');
INSERT INTO `t_gps_data` VALUES ('2835181', '2012-07-09 19:28:30', '3', '', '40594.25051354916', '23686.64221851891', '41', '2012-07-09 19:28:30', '001014182');
INSERT INTO `t_gps_data` VALUES ('2835182', '2012-07-09 19:28:30', '3', '', '39646.955966423', '24270.195611168438', '77', '2012-07-09 19:28:30', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2835183', '2012-07-09 19:28:30', '0', '', '39434.54360391313', '20589.347280830047', '6', '2012-07-09 19:28:30', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2835184', '2012-07-09 19:28:30', '0', '', '43957.71322482223', '39361.55125468989', '77', '2012-07-09 19:28:30', '001001003');
INSERT INTO `t_gps_data` VALUES ('2835185', '2012-07-09 19:28:30', '0', '', '30344.785002898752', '27526.551750879866', '88', '2012-07-09 19:28:30', '001067110');
INSERT INTO `t_gps_data` VALUES ('2835186', '2012-07-09 19:28:30', '2', '', '44436.83999906469', '15816.16635279512', '14', '2012-07-09 19:28:30', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2835187', '2012-07-09 19:28:30', '0', '', '35149.60561762316', '36578.934305091345', '94', '2012-07-09 19:28:30', 'amk');
INSERT INTO `t_gps_data` VALUES ('2835188', '2012-07-09 19:28:30', '3', '', '43849.188688665396', '36416.390686426035', '37', '2012-07-09 19:28:30', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2835189', '2012-07-09 19:28:30', '1', '', '41141.901245646106', '25568.57994342954', '100', '2012-07-09 19:28:30', 'cck');
INSERT INTO `t_gps_data` VALUES ('2835190', '2012-07-09 19:28:30', '2', '', '33738.53682252085', '28830.001949080888', '21', '2012-07-09 19:28:30', 'clm');
INSERT INTO `t_gps_data` VALUES ('2835191', '2012-07-09 19:28:30', '3', '', '36083.00741724513', '16982.049284443827', '87', '2012-07-09 19:28:30', 'hou');
INSERT INTO `t_gps_data` VALUES ('2835192', '2012-07-09 19:28:30', '3', '', '37639.55762906099', '27410.83517256432', '1', '2012-07-09 19:28:30', 'jur');
INSERT INTO `t_gps_data` VALUES ('2835193', '2012-07-09 19:28:30', '3', '', '43620.44124924067', '26411.50851172346', '40', '2012-07-09 19:28:30', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2835194', '2012-07-09 19:28:40', '1', '', '39226.73100776668', '37269.33171108166', '60', '2012-07-09 19:28:40', '2');
INSERT INTO `t_gps_data` VALUES ('2835195', '2012-07-09 19:28:40', '3', '', '39784.7148439291', '18025.56037751105', '98', '2012-07-09 19:28:40', '1');
INSERT INTO `t_gps_data` VALUES ('2835196', '2012-07-09 19:28:40', '3', '', '35631.24460324857', '28084.341574549904', '15', '2012-07-09 19:28:40', '4');
INSERT INTO `t_gps_data` VALUES ('2835197', '2012-07-09 19:28:40', '0', '', '40127.74731663122', '26926.85656380654', '46', '2012-07-09 19:28:40', '3');
INSERT INTO `t_gps_data` VALUES ('2835198', '2012-07-09 19:28:40', '2', '', '40453.15476201283', '14040.373156472308', '70', '2012-07-09 19:28:40', '5');
INSERT INTO `t_gps_data` VALUES ('2835199', '2012-07-09 19:28:40', '1', '', '37645.10289104167', '36208.71956151107', '64', '2012-07-09 19:28:40', '6');
INSERT INTO `t_gps_data` VALUES ('2835200', '2012-07-09 19:28:40', '2', '', '39059.12858572609', '36098.269609777', '37', '2012-07-09 19:28:40', '001190251');
INSERT INTO `t_gps_data` VALUES ('2835201', '2012-07-09 19:28:40', '3', '', '40523.888711690954', '23685.785706619623', '41', '2012-07-09 19:28:40', '001014182');
INSERT INTO `t_gps_data` VALUES ('2835202', '2012-07-09 19:28:40', '3', '', '39568.52556124042', '24257.38878023857', '77', '2012-07-09 19:28:40', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2835203', '2012-07-09 19:28:40', '0', '', '39428.5963652075', '20525.050461621453', '6', '2012-07-09 19:28:40', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2835204', '2012-07-09 19:28:40', '0', '', '43952.471982913914', '39262.3226210408', '77', '2012-07-09 19:28:40', '001001003');
INSERT INTO `t_gps_data` VALUES ('2835205', '2012-07-09 19:28:40', '0', '', '30335.424980412856', '27496.475988184724', '88', '2012-07-09 19:28:40', '001067110');
INSERT INTO `t_gps_data` VALUES ('2835206', '2012-07-09 19:28:40', '3', '', '44525.40508421928', '15833.837350542617', '14', '2012-07-09 19:28:40', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2835207', '2012-07-09 19:28:40', '0', '', '35136.09776306879', '36482.115158437264', '94', '2012-07-09 19:28:40', 'amk');
INSERT INTO `t_gps_data` VALUES ('2835208', '2012-07-09 19:28:40', '3', '', '43811.62429208068', '36400.04809938413', '37', '2012-07-09 19:28:40', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2835209', '2012-07-09 19:28:40', '1', '', '41156.87758155098', '25612.5432245831', '100', '2012-07-09 19:28:40', 'cck');
INSERT INTO `t_gps_data` VALUES ('2835210', '2012-07-09 19:28:40', '2', '', '33827.89522431209', '28831.190055689094', '21', '2012-07-09 19:28:40', 'clm');
INSERT INTO `t_gps_data` VALUES ('2835211', '2012-07-09 19:28:40', '3', '', '36050.242361396646', '16953.448901675907', '87', '2012-07-09 19:28:40', 'hou');
INSERT INTO `t_gps_data` VALUES ('2835212', '2012-07-09 19:28:40', '3', '', '37589.065766797146', '27398.96346745697', '1', '2012-07-09 19:28:40', 'jur');
INSERT INTO `t_gps_data` VALUES ('2835213', '2012-07-09 19:28:40', '3', '', '43587.40217109248', '26406.871891351842', '40', '2012-07-09 19:28:40', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2835214', '2012-07-09 19:28:50', '1', '', '39247.799778433255', '37366.73710552264', '60', '2012-07-09 19:28:50', '2');
INSERT INTO `t_gps_data` VALUES ('2835215', '2012-07-09 19:28:50', '3', '', '39750.304554723676', '18006.379373139534', '98', '2012-07-09 19:28:50', '1');
INSERT INTO `t_gps_data` VALUES ('2835216', '2012-07-09 19:28:50', '3', '', '35577.04524749807', '28071.54242870629', '15', '2012-07-09 19:28:50', '4');
INSERT INTO `t_gps_data` VALUES ('2835217', '2012-07-09 19:28:50', '0', '', '40101.39031630569', '26856.840392579743', '46', '2012-07-09 19:28:50', '3');
INSERT INTO `t_gps_data` VALUES ('2835218', '2012-07-09 19:28:50', '2', '', '40545.56867942156', '14069.21132682719', '70', '2012-07-09 19:28:50', '5');
INSERT INTO `t_gps_data` VALUES ('2835219', '2012-07-09 19:28:50', '1', '', '37665.602809718184', '36301.86705894963', '64', '2012-07-09 19:28:50', '6');
INSERT INTO `t_gps_data` VALUES ('2835220', '2012-07-09 19:28:50', '2', '', '39147.142052484945', '36108.251825403706', '37', '2012-07-09 19:28:50', '001190251');
INSERT INTO `t_gps_data` VALUES ('2835221', '2012-07-09 19:28:50', '3', '', '40483.88912918918', '23659.13093954038', '41', '2012-07-09 19:28:50', '001014182');
INSERT INTO `t_gps_data` VALUES ('2835222', '2012-07-09 19:28:50', '3', '', '39485.50959709387', '24253.301056065317', '77', '2012-07-09 19:28:50', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2835223', '2012-07-09 19:28:50', '0', '', '39420.65202858598', '20435.879905160164', '6', '2012-07-09 19:28:50', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2835224', '2012-07-09 19:28:50', '0', '', '43947.53737756443', '39193.47050836132', '77', '2012-07-09 19:28:50', '001001003');
INSERT INTO `t_gps_data` VALUES ('2835225', '2012-07-09 19:28:50', '0', '', '30316.62913509809', '27449.47868095539', '88', '2012-07-09 19:28:50', '001067110');
INSERT INTO `t_gps_data` VALUES ('2835226', '2012-07-09 19:28:50', '3', '', '44458.14993795892', '15832.090981033745', '14', '2012-07-09 19:28:50', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2835227', '2012-07-09 19:28:50', '0', '', '35113.34646930011', '36444.569279169096', '94', '2012-07-09 19:28:50', 'amk');
INSERT INTO `t_gps_data` VALUES ('2835228', '2012-07-09 19:28:50', '3', '', '43745.388684297395', '36376.13350809109', '37', '2012-07-09 19:28:50', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2835229', '2012-07-09 19:28:50', '1', '', '41177.48942857779', '25694.196814752046', '100', '2012-07-09 19:28:50', 'cck');
INSERT INTO `t_gps_data` VALUES ('2835230', '2012-07-09 19:28:50', '2', '', '33876.34601914737', '28835.746297699014', '21', '2012-07-09 19:28:50', 'clm');
INSERT INTO `t_gps_data` VALUES ('2835231', '2012-07-09 19:28:50', '3', '', '35999.06644110624', '16953.338281393666', '87', '2012-07-09 19:28:50', 'hou');
INSERT INTO `t_gps_data` VALUES ('2835232', '2012-07-09 19:28:50', '3', '', '37521.05073233963', '27384.645968071585', '1', '2012-07-09 19:28:50', 'jur');
INSERT INTO `t_gps_data` VALUES ('2835233', '2012-07-09 19:28:50', '3', '', '43535.74858351546', '26402.37627429964', '40', '2012-07-09 19:28:50', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2835234', '2012-07-09 19:29:00', '1', '', '39256.790694161966', '37442.92928307874', '60', '2012-07-09 19:29:00', '2');
INSERT INTO `t_gps_data` VALUES ('2835235', '2012-07-09 19:29:00', '3', '', '39713.02032144393', '17991.790988376644', '98', '2012-07-09 19:29:00', '1');
INSERT INTO `t_gps_data` VALUES ('2835236', '2012-07-09 19:29:00', '3', '', '35478.59894664221', '28044.08961600819', '15', '2012-07-09 19:29:00', '4');
INSERT INTO `t_gps_data` VALUES ('2835237', '2012-07-09 19:29:00', '0', '', '40078.26909367118', '26795.75287836718', '46', '2012-07-09 19:29:00', '3');
INSERT INTO `t_gps_data` VALUES ('2835238', '2012-07-09 19:29:00', '2', '', '40601.94483025582', '14097.133426908666', '70', '2012-07-09 19:29:00', '5');
INSERT INTO `t_gps_data` VALUES ('2835239', '2012-07-09 19:29:00', '1', '', '37680.88202684268', '36346.69107328604', '64', '2012-07-09 19:29:00', '6');
INSERT INTO `t_gps_data` VALUES ('2835240', '2012-07-09 19:29:00', '2', '', '39218.35374502727', '36131.71970091832', '37', '2012-07-09 19:29:00', '001190251');
INSERT INTO `t_gps_data` VALUES ('2835241', '2012-07-09 19:29:00', '3', '', '40412.570564995476', '23649.79564506573', '41', '2012-07-09 19:29:00', '001014182');
INSERT INTO `t_gps_data` VALUES ('2835242', '2012-07-09 19:29:00', '3', '', '39416.321165763184', '24245.300132678018', '77', '2012-07-09 19:29:00', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2835243', '2012-07-09 19:29:00', '0', '', '39392.021347505295', '20375.542616699986', '6', '2012-07-09 19:29:00', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2835244', '2012-07-09 19:29:00', '0', '', '43919.61356978581', '39124.794350486285', '77', '2012-07-09 19:29:00', '001001003');
INSERT INTO `t_gps_data` VALUES ('2835245', '2012-07-09 19:29:00', '0', '', '30307.83504739555', '27410.703371824446', '88', '2012-07-09 19:29:00', '001067110');
INSERT INTO `t_gps_data` VALUES ('2835246', '2012-07-09 19:29:00', '3', '', '44366.805062421976', '15828.907431590786', '14', '2012-07-09 19:29:00', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2835247', '2012-07-09 19:29:00', '0', '', '35089.668237201535', '36394.442540280055', '94', '2012-07-09 19:29:00', 'amk');
INSERT INTO `t_gps_data` VALUES ('2835248', '2012-07-09 19:29:00', '3', '', '43661.14221030922', '36346.42856513525', '37', '2012-07-09 19:29:00', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2835249', '2012-07-09 19:29:00', '1', '', '41204.78832878884', '25769.462595284378', '100', '2012-07-09 19:29:00', 'cck');
INSERT INTO `t_gps_data` VALUES ('2835250', '2012-07-09 19:29:00', '2', '', '33931.21157356666', '28859.952446779545', '21', '2012-07-09 19:29:00', 'clm');
INSERT INTO `t_gps_data` VALUES ('2835251', '2012-07-09 19:29:00', '3', '', '35937.13891242814', '16949.651781999164', '87', '2012-07-09 19:29:00', 'hou');
INSERT INTO `t_gps_data` VALUES ('2835252', '2012-07-09 19:29:00', '3', '', '37432.76109624005', '27367.369000712384', '1', '2012-07-09 19:29:00', 'jur');
INSERT INTO `t_gps_data` VALUES ('2835253', '2012-07-09 19:29:00', '3', '', '43444.825388898156', '26372.567193944917', '40', '2012-07-09 19:29:00', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2835254', '2012-07-09 19:29:10', '1', '', '39266.94770793796', '37508.91522067337', '60', '2012-07-09 19:29:10', '2');
INSERT INTO `t_gps_data` VALUES ('2835255', '2012-07-09 19:29:10', '3', '', '39643.878061242605', '17979.842848979923', '98', '2012-07-09 19:29:10', '1');
INSERT INTO `t_gps_data` VALUES ('2835256', '2012-07-09 19:29:10', '3', '', '35421.50160494251', '28025.31858477557', '15', '2012-07-09 19:29:10', '4');
INSERT INTO `t_gps_data` VALUES ('2835257', '2012-07-09 19:29:10', '0', '', '40070.86744235715', '26748.576963887008', '46', '2012-07-09 19:29:10', '3');
INSERT INTO `t_gps_data` VALUES ('2835258', '2012-07-09 19:29:10', '2', '', '40632.72690686049', '14098.762705358395', '70', '2012-07-09 19:29:10', '5');
INSERT INTO `t_gps_data` VALUES ('2835259', '2012-07-09 19:29:10', '1', '', '37703.819749121976', '36444.20343153843', '64', '2012-07-09 19:29:10', '6');
INSERT INTO `t_gps_data` VALUES ('2835260', '2012-07-09 19:29:10', '2', '', '39285.82405413224', '36142.3789273455', '37', '2012-07-09 19:29:10', '001190251');
INSERT INTO `t_gps_data` VALUES ('2835261', '2012-07-09 19:29:10', '3', '', '40366.66767238124', '23624.891744825774', '41', '2012-07-09 19:29:10', '001014182');
INSERT INTO `t_gps_data` VALUES ('2835262', '2012-07-09 19:29:10', '3', '', '39319.57872382747', '24231.42477941091', '77', '2012-07-09 19:29:10', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2835263', '2012-07-09 19:29:10', '0', '', '39376.06262751811', '20335.55873035118', '6', '2012-07-09 19:29:10', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2835264', '2012-07-09 19:29:10', '0', '', '43899.952605914565', '39043.18793037725', '77', '2012-07-09 19:29:10', '001001003');
INSERT INTO `t_gps_data` VALUES ('2835265', '2012-07-09 19:29:10', '0', '', '30290.829052075962', '27369.628045024263', '88', '2012-07-09 19:29:10', '001067110');
INSERT INTO `t_gps_data` VALUES ('2835266', '2012-07-09 19:29:10', '3', '', '44311.09219976456', '15814.316284961023', '14', '2012-07-09 19:29:10', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2835267', '2012-07-09 19:29:10', '0', '', '35083.90390079529', '36350.94607276668', '94', '2012-07-09 19:29:10', 'amk');
INSERT INTO `t_gps_data` VALUES ('2835268', '2012-07-09 19:29:10', '3', '', '43569.75254210387', '36316.5548520394', '37', '2012-07-09 19:29:10', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2835269', '2012-07-09 19:29:10', '1', '', '41227.46296811322', '25857.629209639934', '100', '2012-07-09 19:29:10', 'cck');
INSERT INTO `t_gps_data` VALUES ('2835270', '2012-07-09 19:29:10', '2', '', '34002.971899447526', '28889.377750641153', '21', '2012-07-09 19:29:10', 'clm');
INSERT INTO `t_gps_data` VALUES ('2835271', '2012-07-09 19:29:10', '3', '', '35867.90669882189', '16933.699883503163', '87', '2012-07-09 19:29:10', 'hou');
INSERT INTO `t_gps_data` VALUES ('2835272', '2012-07-09 19:29:10', '3', '', '37373.8958129848', '27362.610368045975', '1', '2012-07-09 19:29:10', 'jur');
INSERT INTO `t_gps_data` VALUES ('2835273', '2012-07-09 19:29:10', '3', '', '43365.932047792514', '26354.99530424197', '40', '2012-07-09 19:29:10', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2835274', '2012-07-09 19:29:20', '1', '', '39285.82864524425', '37560.51407031723', '60', '2012-07-09 19:29:20', '2');
INSERT INTO `t_gps_data` VALUES ('2835275', '2012-07-09 19:29:20', '3', '', '39592.61503744079', '17964.731129266966', '98', '2012-07-09 19:29:20', '1');
INSERT INTO `t_gps_data` VALUES ('2835276', '2012-07-09 19:29:20', '3', '', '35375.80035344229', '28001.928606185265', '15', '2012-07-09 19:29:20', '4');
INSERT INTO `t_gps_data` VALUES ('2835277', '2012-07-09 19:29:21', '0', '', '40047.224450426445', '26708.116943711095', '46', '2012-07-09 19:29:21', '3');
INSERT INTO `t_gps_data` VALUES ('2835278', '2012-07-09 19:29:21', '2', '', '40682.50665222495', '14114.62783154191', '70', '2012-07-09 19:29:21', '5');
INSERT INTO `t_gps_data` VALUES ('2835279', '2012-07-09 19:29:21', '1', '', '37719.84844375097', '36488.15171455983', '64', '2012-07-09 19:29:21', '6');
INSERT INTO `t_gps_data` VALUES ('2835280', '2012-07-09 19:29:21', '2', '', '39357.912377396286', '36146.072816467335', '37', '2012-07-09 19:29:21', '001190251');
INSERT INTO `t_gps_data` VALUES ('2835281', '2012-07-09 19:29:21', '3', '', '40331.26106877784', '23619.228598822265', '41', '2012-07-09 19:29:21', '001014182');
INSERT INTO `t_gps_data` VALUES ('2835282', '2012-07-09 19:29:21', '3', '', '39240.36151012648', '24219.603922213108', '77', '2012-07-09 19:29:21', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2835283', '2012-07-09 19:29:21', '0', '', '39348.31555243031', '20264.07231194422', '6', '2012-07-09 19:29:21', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2835284', '2012-07-09 19:29:21', '0', '', '43875.75319165821', '39010.33675383566', '77', '2012-07-09 19:29:21', '001001003');
INSERT INTO `t_gps_data` VALUES ('2835285', '2012-07-09 19:29:21', '0', '', '30266.242598985697', '27272.260104010853', '88', '2012-07-09 19:29:21', '001067110');
INSERT INTO `t_gps_data` VALUES ('2835286', '2012-07-09 19:29:21', '3', '', '44211.67856625262', '15796.736747772906', '14', '2012-07-09 19:29:21', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2835287', '2012-07-09 19:29:21', '0', '', '35058.648018875894', '36277.62602931741', '94', '2012-07-09 19:29:21', 'amk');
INSERT INTO `t_gps_data` VALUES ('2835288', '2012-07-09 19:29:21', '3', '', '43480.179366845376', '36304.370866648045', '37', '2012-07-09 19:29:21', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2835289', '2012-07-09 19:29:21', '1', '', '41232.75470601687', '25923.139156045425', '100', '2012-07-09 19:29:21', 'cck');
INSERT INTO `t_gps_data` VALUES ('2835290', '2012-07-09 19:29:21', '2', '', '34102.67015043795', '28899.08792107471', '21', '2012-07-09 19:29:21', 'clm');
INSERT INTO `t_gps_data` VALUES ('2835291', '2012-07-09 19:29:21', '3', '', '35795.26712630492', '16903.899872384492', '87', '2012-07-09 19:29:21', 'hou');
INSERT INTO `t_gps_data` VALUES ('2835292', '2012-07-09 19:29:21', '3', '', '37332.43752508995', '27338.393419497443', '1', '2012-07-09 19:29:21', 'jur');
INSERT INTO `t_gps_data` VALUES ('2835293', '2012-07-09 19:29:21', '3', '', '43297.75142986637', '26344.924241244695', '40', '2012-07-09 19:29:21', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2835294', '2012-07-09 19:29:31', '1', '', '39301.23956783539', '37629.41706919173', '60', '2012-07-09 19:29:31', '2');
INSERT INTO `t_gps_data` VALUES ('2835295', '2012-07-09 19:29:31', '3', '', '39518.33022757617', '17938.100020029888', '98', '2012-07-09 19:29:31', '1');
INSERT INTO `t_gps_data` VALUES ('2835296', '2012-07-09 19:29:31', '3', '', '35307.17175497375', '27976.127169528736', '15', '2012-07-09 19:29:31', '4');
INSERT INTO `t_gps_data` VALUES ('2835297', '2012-07-09 19:29:31', '0', '', '40018.45708254501', '26651.535890771796', '46', '2012-07-09 19:29:31', '3');
INSERT INTO `t_gps_data` VALUES ('2835298', '2012-07-09 19:29:31', '2', '', '40732.89444035101', '14125.82931566752', '70', '2012-07-09 19:29:31', '5');
INSERT INTO `t_gps_data` VALUES ('2835299', '2012-07-09 19:29:31', '1', '', '37733.9028710364', '36521.35024855252', '64', '2012-07-09 19:29:31', '6');
INSERT INTO `t_gps_data` VALUES ('2835300', '2012-07-09 19:29:31', '2', '', '39413.4695001233', '36165.94011291221', '37', '2012-07-09 19:29:31', '001190251');
INSERT INTO `t_gps_data` VALUES ('2835301', '2012-07-09 19:29:31', '3', '', '40297.1461179338', '23599.010481164252', '41', '2012-07-09 19:29:31', '001014182');
INSERT INTO `t_gps_data` VALUES ('2835302', '2012-07-09 19:29:31', '3', '', '39168.91111648559', '24217.99470733585', '77', '2012-07-09 19:29:31', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2835303', '2012-07-09 19:29:31', '0', '', '39320.45307154833', '20174.760147733603', '6', '2012-07-09 19:29:31', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2835304', '2012-07-09 19:29:31', '0', '', '43848.547774332335', '38974.58650215175', '77', '2012-07-09 19:29:31', '001001003');
INSERT INTO `t_gps_data` VALUES ('2835305', '2012-07-09 19:29:31', '0', '', '30241.29011576213', '27177.923571972922', '88', '2012-07-09 19:29:31', '001067110');
INSERT INTO `t_gps_data` VALUES ('2835306', '2012-07-09 19:29:31', '3', '', '44167.30063984803', '15781.464607084525', '14', '2012-07-09 19:29:31', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2835307', '2012-07-09 19:29:31', '0', '', '35034.529352604906', '36240.21281248186', '94', '2012-07-09 19:29:31', 'amk');
INSERT INTO `t_gps_data` VALUES ('2835308', '2012-07-09 19:29:31', '3', '', '43404.67395860574', '36277.76700801415', '37', '2012-07-09 19:29:31', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2835309', '2012-07-09 19:29:31', '1', '', '41241.66872167303', '25990.48722005568', '100', '2012-07-09 19:29:31', 'cck');
INSERT INTO `t_gps_data` VALUES ('2835310', '2012-07-09 19:29:31', '2', '', '34174.64397227201', '28924.029354342485', '21', '2012-07-09 19:29:31', 'clm');
INSERT INTO `t_gps_data` VALUES ('2835311', '2012-07-09 19:29:31', '3', '', '35750.77285356713', '16897.15121754087', '87', '2012-07-09 19:29:31', 'hou');
INSERT INTO `t_gps_data` VALUES ('2835312', '2012-07-09 19:29:31', '3', '', '37254.430043781365', '27335.267452496286', '1', '2012-07-09 19:29:31', 'jur');
INSERT INTO `t_gps_data` VALUES ('2835313', '2012-07-09 19:29:31', '3', '', '43203.98306585062', '26317.62948898172', '40', '2012-07-09 19:29:31', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2835314', '2012-07-09 19:29:41', '1', '', '39326.63412361652', '37684.616496822455', '60', '2012-07-09 19:29:41', '2');
INSERT INTO `t_gps_data` VALUES ('2835315', '2012-07-09 19:29:41', '3', '', '39476.44038891357', '17909.732342395975', '98', '2012-07-09 19:29:41', '1');
INSERT INTO `t_gps_data` VALUES ('2835316', '2012-07-09 19:29:41', '3', '', '35261.679200416205', '27956.957752569557', '15', '2012-07-09 19:29:41', '4');
INSERT INTO `t_gps_data` VALUES ('2835317', '2012-07-09 19:29:41', '0', '', '40011.07004546176', '26575.658054673826', '46', '2012-07-09 19:29:41', '3');
INSERT INTO `t_gps_data` VALUES ('2835318', '2012-07-09 19:29:41', '2', '', '40821.27906727884', '14135.464610594614', '70', '2012-07-09 19:29:41', '5');
INSERT INTO `t_gps_data` VALUES ('2835319', '2012-07-09 19:29:41', '1', '', '37742.09036007569', '36564.67668648389', '64', '2012-07-09 19:29:41', '6');
INSERT INTO `t_gps_data` VALUES ('2835320', '2012-07-09 19:29:41', '2', '', '39469.51856108554', '36185.16881205963', '37', '2012-07-09 19:29:41', '001190251');
INSERT INTO `t_gps_data` VALUES ('2835321', '2012-07-09 19:29:41', '3', '', '40249.740282938474', '23592.06451857197', '41', '2012-07-09 19:29:41', '001014182');
INSERT INTO `t_gps_data` VALUES ('2835322', '2012-07-09 19:29:41', '3', '', '39074.58907488998', '24213.612126630844', '77', '2012-07-09 19:29:41', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2835323', '2012-07-09 19:29:41', '0', '', '39314.63555577515', '20097.317203351853', '6', '2012-07-09 19:29:41', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2835324', '2012-07-09 19:29:41', '0', '', '43837.32360222779', '38891.95632418042', '77', '2012-07-09 19:29:41', '001001003');
INSERT INTO `t_gps_data` VALUES ('2835325', '2012-07-09 19:29:41', '0', '', '30219.900413461066', '27109.64463499251', '88', '2012-07-09 19:29:41', '001067110');
INSERT INTO `t_gps_data` VALUES ('2835326', '2012-07-09 19:29:41', '3', '', '44117.432654199445', '15767.781319351627', '14', '2012-07-09 19:29:41', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2835327', '2012-07-09 19:29:41', '0', '', '35025.76196870185', '36169.16076712497', '94', '2012-07-09 19:29:41', 'amk');
INSERT INTO `t_gps_data` VALUES ('2835328', '2012-07-09 19:29:41', '3', '', '43367.814279216684', '36247.88484585686', '37', '2012-07-09 19:29:41', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2835329', '2012-07-09 19:29:41', '1', '', '41256.36886593457', '26067.529737845918', '100', '2012-07-09 19:29:41', 'cck');
INSERT INTO `t_gps_data` VALUES ('2835330', '2012-07-09 19:29:41', '2', '', '34212.36647837852', '28930.418517634916', '21', '2012-07-09 19:29:41', 'clm');
INSERT INTO `t_gps_data` VALUES ('2835331', '2012-07-09 19:29:41', '3', '', '35657.43701189308', '16893.62558275494', '87', '2012-07-09 19:29:41', 'hou');
INSERT INTO `t_gps_data` VALUES ('2835332', '2012-07-09 19:29:41', '3', '', '37224.212466388344', '27318.33092748058', '1', '2012-07-09 19:29:41', 'jur');
INSERT INTO `t_gps_data` VALUES ('2835333', '2012-07-09 19:29:41', '3', '', '43122.90502960732', '26315.23197155903', '40', '2012-07-09 19:29:41', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2835334', '2012-07-09 19:29:51', '1', '', '39332.783080510155', '37736.948726174734', '60', '2012-07-09 19:29:51', '2');
INSERT INTO `t_gps_data` VALUES ('2835335', '2012-07-09 19:29:51', '3', '', '39404.39747260718', '17887.703320851495', '98', '2012-07-09 19:29:51', '1');
INSERT INTO `t_gps_data` VALUES ('2835336', '2012-07-09 19:29:51', '3', '', '35168.39513812377', '27946.466491033625', '15', '2012-07-09 19:29:51', '4');
INSERT INTO `t_gps_data` VALUES ('2835337', '2012-07-09 19:29:51', '0', '', '39993.955537271584', '26509.42960597059', '46', '2012-07-09 19:29:51', '3');
INSERT INTO `t_gps_data` VALUES ('2835338', '2012-07-09 19:29:51', '2', '', '40899.6965903892', '14165.428976526304', '70', '2012-07-09 19:29:51', '5');
INSERT INTO `t_gps_data` VALUES ('2835339', '2012-07-09 19:29:51', '1', '', '37771.8163784924', '36607.37584183122', '64', '2012-07-09 19:29:51', '6');
INSERT INTO `t_gps_data` VALUES ('2835340', '2012-07-09 19:29:51', '2', '', '39549.51410007646', '36207.66351280135', '37', '2012-07-09 19:29:51', '001190251');
INSERT INTO `t_gps_data` VALUES ('2835341', '2012-07-09 19:29:51', '3', '', '40206.46435779627', '23569.73801262994', '41', '2012-07-09 19:29:51', '001014182');
INSERT INTO `t_gps_data` VALUES ('2835342', '2012-07-09 19:29:51', '3', '', '38990.60395225757', '24209.887426841437', '77', '2012-07-09 19:29:51', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2835343', '2012-07-09 19:29:51', '0', '', '39314.24894141734', '20046.23704723128', '6', '2012-07-09 19:29:51', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2835344', '2012-07-09 19:29:51', '0', '', '43825.909447161575', '38799.84075703094', '77', '2012-07-09 19:29:51', '001001003');
INSERT INTO `t_gps_data` VALUES ('2835345', '2012-07-09 19:29:51', '0', '', '30197.016560926244', '27048.178476122648', '88', '2012-07-09 19:29:51', '001067110');
INSERT INTO `t_gps_data` VALUES ('2835346', '2012-07-09 19:29:51', '3', '', '44069.11305906452', '15740.782347885237', '14', '2012-07-09 19:29:51', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2835347', '2012-07-09 19:29:51', '0', '', '35010.179772413394', '36093.376581262695', '94', '2012-07-09 19:29:51', 'amk');
INSERT INTO `t_gps_data` VALUES ('2835348', '2012-07-09 19:29:51', '3', '', '43278.59282881365', '36245.80429202529', '37', '2012-07-09 19:29:51', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2835349', '2012-07-09 19:29:51', '1', '', '41267.62004103079', '26141.135145846856', '100', '2012-07-09 19:29:51', 'cck');
INSERT INTO `t_gps_data` VALUES ('2835350', '2012-07-09 19:29:51', '2', '', '34296.57514446408', '28959.277837983165', '21', '2012-07-09 19:29:51', 'clm');
INSERT INTO `t_gps_data` VALUES ('2835351', '2012-07-09 19:29:51', '3', '', '35562.23687790141', '16891.55293209143', '87', '2012-07-09 19:29:51', 'hou');
INSERT INTO `t_gps_data` VALUES ('2835352', '2012-07-09 19:29:51', '3', '', '37125.67042076106', '27309.53215871297', '1', '2012-07-09 19:29:51', 'jur');
INSERT INTO `t_gps_data` VALUES ('2835353', '2012-07-09 19:29:51', '3', '', '43072.72708622581', '26292.026838281312', '40', '2012-07-09 19:29:51', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2835354', '2012-07-09 19:30:01', '1', '', '39349.60035076931', '37785.620819133524', '60', '2012-07-09 19:30:01', '2');
INSERT INTO `t_gps_data` VALUES ('2835355', '2012-07-09 19:30:01', '3', '', '39316.000429357024', '17861.948216862707', '98', '2012-07-09 19:30:01', '1');
INSERT INTO `t_gps_data` VALUES ('2835356', '2012-07-09 19:30:01', '3', '', '35128.02052578962', '27921.678016881735', '15', '2012-07-09 19:30:01', '4');
INSERT INTO `t_gps_data` VALUES ('2835357', '2012-07-09 19:30:01', '0', '', '39982.55279882293', '26428.603196055774', '46', '2012-07-09 19:30:01', '3');
INSERT INTO `t_gps_data` VALUES ('2835358', '2012-07-09 19:30:01', '2', '', '40973.41883151313', '14190.346216814067', '70', '2012-07-09 19:30:01', '5');
INSERT INTO `t_gps_data` VALUES ('2835359', '2012-07-09 19:30:01', '1', '', '37790.96353288519', '36668.8300443336', '64', '2012-07-09 19:30:01', '6');
INSERT INTO `t_gps_data` VALUES ('2835360', '2012-07-09 19:30:01', '2', '', '39632.55090532677', '36224.71180679616', '37', '2012-07-09 19:30:01', '001190251');
INSERT INTO `t_gps_data` VALUES ('2835361', '2012-07-09 19:30:01', '3', '', '40164.10376825139', '23565.415324560512', '41', '2012-07-09 19:30:01', '001014182');
INSERT INTO `t_gps_data` VALUES ('2835362', '2012-07-09 19:30:01', '3', '', '38952.64716668318', '24199.355003630528', '77', '2012-07-09 19:30:01', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2835363', '2012-07-09 19:30:01', '0', '', '39296.13118763319', '20006.093833190393', '6', '2012-07-09 19:30:01', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2835364', '2012-07-09 19:30:01', '0', '', '43815.09031356844', '38759.27072677353', '77', '2012-07-09 19:30:01', '001001003');
INSERT INTO `t_gps_data` VALUES ('2835365', '2012-07-09 19:30:01', '0', '', '30192.332841604853', '26995.117405268218', '88', '2012-07-09 19:30:01', '001067110');
INSERT INTO `t_gps_data` VALUES ('2835366', '2012-07-09 19:30:01', '3', '', '44007.96691375925', '15719.738797511245', '14', '2012-07-09 19:30:01', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2835367', '2012-07-09 19:30:01', '0', '', '35001.328654760706', '36013.50148644323', '94', '2012-07-09 19:30:01', 'amk');
INSERT INTO `t_gps_data` VALUES ('2835368', '2012-07-09 19:30:01', '3', '', '43219.19180206034', '36238.85583165798', '37', '2012-07-09 19:30:01', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2835369', '2012-07-09 19:30:01', '1', '', '41293.65063273792', '26231.88047477311', '100', '2012-07-09 19:30:01', 'cck');
INSERT INTO `t_gps_data` VALUES ('2835370', '2012-07-09 19:30:01', '2', '', '34334.681068167476', '28968.967516138728', '21', '2012-07-09 19:30:01', 'clm');
INSERT INTO `t_gps_data` VALUES ('2835371', '2012-07-09 19:30:01', '3', '', '35479.428772274434', '16870.143227197328', '87', '2012-07-09 19:30:01', 'hou');
INSERT INTO `t_gps_data` VALUES ('2835372', '2012-07-09 19:30:01', '3', '', '37041.998307377195', '27295.624775358556', '1', '2012-07-09 19:30:01', 'jur');
INSERT INTO `t_gps_data` VALUES ('2835373', '2012-07-09 19:30:01', '3', '', '43030.83158194896', '26291.87807742233', '40', '2012-07-09 19:30:01', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2835374', '2012-07-09 19:30:11', '1', '', '39376.85621983419', '37847.45866031949', '60', '2012-07-09 19:30:11', '2');
INSERT INTO `t_gps_data` VALUES ('2835375', '2012-07-09 19:30:11', '3', '', '39280.55891843631', '17859.80264257216', '98', '2012-07-09 19:30:11', '1');
INSERT INTO `t_gps_data` VALUES ('2835376', '2012-07-09 19:30:11', '3', '', '35034.31184627032', '27910.274394154698', '15', '2012-07-09 19:30:11', '4');
INSERT INTO `t_gps_data` VALUES ('2835377', '2012-07-09 19:30:11', '0', '', '39973.08281995254', '26349.3275299364', '46', '2012-07-09 19:30:11', '3');
INSERT INTO `t_gps_data` VALUES ('2835378', '2012-07-09 19:30:11', '2', '', '41066.291015732095', '14208.248165711708', '70', '2012-07-09 19:30:11', '5');
INSERT INTO `t_gps_data` VALUES ('2835379', '2012-07-09 19:30:11', '1', '', '37798.85136352858', '36738.11285281453', '64', '2012-07-09 19:30:11', '6');
INSERT INTO `t_gps_data` VALUES ('2835380', '2012-07-09 19:30:11', '2', '', '39698.618429759495', '36225.153562262196', '37', '2012-07-09 19:30:11', '001190251');
INSERT INTO `t_gps_data` VALUES ('2835381', '2012-07-09 19:30:11', '3', '', '40115.51082504608', '23539.78747426272', '41', '2012-07-09 19:30:11', '001014182');
INSERT INTO `t_gps_data` VALUES ('2835382', '2012-07-09 19:30:11', '3', '', '38902.042079838415', '24195.32105031025', '77', '2012-07-09 19:30:11', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2835383', '2012-07-09 19:30:11', '0', '', '39283.256725406194', '19911.096152295268', '6', '2012-07-09 19:30:11', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2835384', '2012-07-09 19:30:11', '0', '', '43805.7573986429', '38666.08634683885', '77', '2012-07-09 19:30:11', '001001003');
INSERT INTO `t_gps_data` VALUES ('2835385', '2012-07-09 19:30:11', '0', '', '30181.154804660717', '26917.90514188435', '88', '2012-07-09 19:30:11', '001067110');
INSERT INTO `t_gps_data` VALUES ('2835386', '2012-07-09 19:30:11', '3', '', '43934.800408785384', '15692.138960185124', '14', '2012-07-09 19:30:11', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2835387', '2012-07-09 19:30:11', '0', '', '35001.13299757338', '35964.51219321803', '94', '2012-07-09 19:30:11', 'amk');
INSERT INTO `t_gps_data` VALUES ('2835388', '2012-07-09 19:30:11', '3', '', '43148.094819661244', '36209.603589029655', '37', '2012-07-09 19:30:11', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2835389', '2012-07-09 19:30:11', '1', '', '41296.35104882757', '26290.31166899508', '100', '2012-07-09 19:30:11', 'cck');
INSERT INTO `t_gps_data` VALUES ('2835390', '2012-07-09 19:30:11', '2', '', '34380.16367116572', '28997.04723850133', '21', '2012-07-09 19:30:11', 'clm');
INSERT INTO `t_gps_data` VALUES ('2835391', '2012-07-09 19:30:11', '3', '', '35427.22811255924', '16864.85055459903', '87', '2012-07-09 19:30:11', 'hou');
INSERT INTO `t_gps_data` VALUES ('2835392', '2012-07-09 19:30:11', '3', '', '36986.075728285425', '27277.508977380166', '1', '2012-07-09 19:30:11', 'jur');
INSERT INTO `t_gps_data` VALUES ('2835393', '2012-07-09 19:30:11', '3', '', '42959.36254626771', '26279.344910176173', '40', '2012-07-09 19:30:11', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2835394', '2012-07-09 19:30:22', '1', '', '39405.108333194265', '37924.51180413325', '60', '2012-07-09 19:30:22', '2');
INSERT INTO `t_gps_data` VALUES ('2835395', '2012-07-09 19:30:22', '3', '', '39245.869729452395', '17858.557514095894', '98', '2012-07-09 19:30:22', '1');
INSERT INTO `t_gps_data` VALUES ('2835396', '2012-07-09 19:30:22', '3', '', '34982.83972514529', '27897.59814880682', '15', '2012-07-09 19:30:22', '4');
INSERT INTO `t_gps_data` VALUES ('2835397', '2012-07-09 19:30:22', '0', '', '39970.98597134754', '26309.439950852924', '46', '2012-07-09 19:30:22', '3');
INSERT INTO `t_gps_data` VALUES ('2835398', '2012-07-09 19:30:22', '2', '', '41141.9455839921', '14211.578450909063', '70', '2012-07-09 19:30:22', '5');
INSERT INTO `t_gps_data` VALUES ('2835399', '2012-07-09 19:30:22', '1', '', '37808.29975859712', '36802.70753359867', '64', '2012-07-09 19:30:22', '6');
INSERT INTO `t_gps_data` VALUES ('2835400', '2012-07-09 19:30:22', '2', '', '39796.04363535398', '36238.42337220265', '37', '2012-07-09 19:30:22', '001190251');
INSERT INTO `t_gps_data` VALUES ('2835401', '2012-07-09 19:30:22', '3', '', '40038.76037049996', '23529.21968642793', '41', '2012-07-09 19:30:22', '001014182');
INSERT INTO `t_gps_data` VALUES ('2835402', '2012-07-09 19:30:22', '3', '', '38841.82926568224', '24169.005580519828', '77', '2012-07-09 19:30:22', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2835403', '2012-07-09 19:30:22', '0', '', '39272.8279489477', '19826.979135055797', '6', '2012-07-09 19:30:22', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2835404', '2012-07-09 19:30:22', '0', '', '43793.43919413442', '38608.02257483201', '77', '2012-07-09 19:30:22', '001001003');
INSERT INTO `t_gps_data` VALUES ('2835405', '2012-07-09 19:30:22', '0', '', '30152.628356535883', '26851.47490062765', '88', '2012-07-09 19:30:22', '001067110');
INSERT INTO `t_gps_data` VALUES ('2835406', '2012-07-09 19:30:22', '3', '', '43899.004480350755', '15689.798657122059', '14', '2012-07-09 19:30:22', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2835407', '2012-07-09 19:30:22', '0', '', '34992.36850314613', '35871.346682723524', '94', '2012-07-09 19:30:22', 'amk');
INSERT INTO `t_gps_data` VALUES ('2835408', '2012-07-09 19:30:22', '3', '', '43093.987603762595', '36191.63164387644', '37', '2012-07-09 19:30:22', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2835409', '2012-07-09 19:30:22', '1', '', '41323.013558123785', '26382.016199069785', '100', '2012-07-09 19:30:22', 'cck');
INSERT INTO `t_gps_data` VALUES ('2835410', '2012-07-09 19:30:22', '2', '', '34442.868982549815', '29017.385861583552', '21', '2012-07-09 19:30:22', 'clm');
INSERT INTO `t_gps_data` VALUES ('2835411', '2012-07-09 19:30:22', '3', '', '35338.13752700506', '16837.988891702862', '87', '2012-07-09 19:30:22', 'hou');
INSERT INTO `t_gps_data` VALUES ('2835412', '2012-07-09 19:30:22', '3', '', '36931.07672462419', '27249.31021822352', '1', '2012-07-09 19:30:22', 'jur');
INSERT INTO `t_gps_data` VALUES ('2835413', '2012-07-09 19:30:22', '3', '', '42919.12318992742', '26263.453492536257', '40', '2012-07-09 19:30:22', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2835414', '2012-07-09 19:30:32', '1', '', '39431.95598396245', '38013.93685871171', '60', '2012-07-09 19:30:32', '2');
INSERT INTO `t_gps_data` VALUES ('2835415', '2012-07-09 19:30:32', '3', '', '39211.723972220985', '17854.662316444494', '98', '2012-07-09 19:30:32', '1');
INSERT INTO `t_gps_data` VALUES ('2835416', '2012-07-09 19:30:32', '3', '', '34926.121959000455', '27880.31940617196', '15', '2012-07-09 19:30:32', '4');
INSERT INTO `t_gps_data` VALUES ('2835417', '2012-07-09 19:30:32', '0', '', '39944.599475693365', '26243.70257045325', '46', '2012-07-09 19:30:32', '3');
INSERT INTO `t_gps_data` VALUES ('2835418', '2012-07-09 19:30:32', '2', '', '41174.31937709303', '14224.202082365988', '70', '2012-07-09 19:30:32', '5');
INSERT INTO `t_gps_data` VALUES ('2835419', '2012-07-09 19:30:32', '1', '', '37833.52798697634', '36862.68012635553', '64', '2012-07-09 19:30:32', '6');
INSERT INTO `t_gps_data` VALUES ('2835420', '2012-07-09 19:30:32', '2', '', '39891.82703382039', '36260.32954004422', '37', '2012-07-09 19:30:32', '001190251');
INSERT INTO `t_gps_data` VALUES ('2835421', '2012-07-09 19:30:32', '3', '', '39965.35319043656', '23502.486016248', '41', '2012-07-09 19:30:32', '001014182');
INSERT INTO `t_gps_data` VALUES ('2835422', '2012-07-09 19:30:32', '3', '', '38811.14742333547', '24139.097895928753', '77', '2012-07-09 19:30:32', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2835423', '2012-07-09 19:30:32', '0', '', '39265.82212529726', '19729.222686794452', '6', '2012-07-09 19:30:32', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2835424', '2012-07-09 19:30:32', '0', '', '43793.362384083186', '38519.05105121716', '77', '2012-07-09 19:30:32', '001001003');
INSERT INTO `t_gps_data` VALUES ('2835425', '2012-07-09 19:30:32', '0', '', '30122.952476773156', '26811.44865818309', '88', '2012-07-09 19:30:32', '001067110');
INSERT INTO `t_gps_data` VALUES ('2835426', '2012-07-09 19:30:32', '3', '', '43817.90500723132', '15675.83819321653', '14', '2012-07-09 19:30:32', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2835427', '2012-07-09 19:30:32', '0', '', '34985.11252045239', '35841.11335275572', '94', '2012-07-09 19:30:32', 'amk');
INSERT INTO `t_gps_data` VALUES ('2835428', '2012-07-09 19:30:32', '3', '', '43003.15320803024', '36184.24907240423', '37', '2012-07-09 19:30:32', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2835429', '2012-07-09 19:30:32', '1', '', '41329.49196192269', '26458.85883526261', '100', '2012-07-09 19:30:32', 'cck');
INSERT INTO `t_gps_data` VALUES ('2835430', '2012-07-09 19:30:32', '2', '', '34524.41183742322', '29042.856074179654', '21', '2012-07-09 19:30:32', 'clm');
INSERT INTO `t_gps_data` VALUES ('2835431', '2012-07-09 19:30:32', '3', '', '35271.148152789894', '16823.96596452036', '87', '2012-07-09 19:30:32', 'hou');
INSERT INTO `t_gps_data` VALUES ('2835432', '2012-07-09 19:30:32', '3', '', '36847.17773987082', '27247.39063454232', '1', '2012-07-09 19:30:32', 'jur');
INSERT INTO `t_gps_data` VALUES ('2835433', '2012-07-09 19:30:32', '3', '', '42831.00982606682', '26261.901036724743', '40', '2012-07-09 19:30:32', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2835434', '2012-07-09 19:30:42', '1', '', '39459.739758428324', '38110.28783236577', '60', '2012-07-09 19:30:42', '2');
INSERT INTO `t_gps_data` VALUES ('2835435', '2012-07-09 19:30:42', '3', '', '39131.438701372135', '17845.263273734727', '98', '2012-07-09 19:30:42', '1');
INSERT INTO `t_gps_data` VALUES ('2835436', '2012-07-09 19:30:42', '3', '', '34886.987351043266', '27851.53215712281', '15', '2012-07-09 19:30:42', '4');
INSERT INTO `t_gps_data` VALUES ('2835437', '2012-07-09 19:30:42', '0', '', '39942.96961396866', '26192.489536979178', '46', '2012-07-09 19:30:42', '3');
INSERT INTO `t_gps_data` VALUES ('2835438', '2012-07-09 19:30:42', '2', '', '41224.64470600878', '14243.577428434386', '70', '2012-07-09 19:30:42', '5');
INSERT INTO `t_gps_data` VALUES ('2835439', '2012-07-09 19:30:42', '1', '', '37859.05707026009', '36947.54978626279', '64', '2012-07-09 19:30:42', '6');
INSERT INTO `t_gps_data` VALUES ('2835440', '2012-07-09 19:30:42', '2', '', '39963.99951960162', '36287.58093807261', '37', '2012-07-09 19:30:42', '001190251');
INSERT INTO `t_gps_data` VALUES ('2835441', '2012-07-09 19:30:42', '3', '', '39894.984490141935', '23477.515310509403', '41', '2012-07-09 19:30:42', '001014182');
INSERT INTO `t_gps_data` VALUES ('2835442', '2012-07-09 19:30:42', '3', '', '38761.49769300818', '24131.212327201134', '77', '2012-07-09 19:30:42', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2835443', '2012-07-09 19:30:42', '0', '', '39254.68339624392', '19644.166577838925', '6', '2012-07-09 19:30:42', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2835444', '2012-07-09 19:30:42', '0', '', '43786.90081213233', '38481.80951501644', '77', '2012-07-09 19:30:42', '001001003');
INSERT INTO `t_gps_data` VALUES ('2835445', '2012-07-09 19:30:42', '0', '', '30122.262116836322', '26736.405622662514', '88', '2012-07-09 19:30:42', '001067110');
INSERT INTO `t_gps_data` VALUES ('2835446', '2012-07-09 19:30:42', '3', '', '43765.218967434965', '15663.150452677772', '14', '2012-07-09 19:30:42', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2835447', '2012-07-09 19:30:42', '0', '', '34971.99853553961', '35798.84283889868', '94', '2012-07-09 19:30:42', 'amk');
INSERT INTO `t_gps_data` VALUES ('2835448', '2012-07-09 19:30:42', '3', '', '42959.55951367537', '36180.11362917755', '37', '2012-07-09 19:30:42', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2835449', '2012-07-09 19:30:42', '1', '', '41351.502159455034', '26527.33006462361', '100', '2012-07-09 19:30:42', 'cck');
INSERT INTO `t_gps_data` VALUES ('2835450', '2012-07-09 19:30:42', '2', '', '34564.112950127834', '29054.320831484685', '21', '2012-07-09 19:30:42', 'clm');
INSERT INTO `t_gps_data` VALUES ('2835451', '2012-07-09 19:30:42', '3', '', '35231.340747740396', '16797.858990814086', '87', '2012-07-09 19:30:42', 'hou');
INSERT INTO `t_gps_data` VALUES ('2835452', '2012-07-09 19:30:42', '3', '', '36774.28714178544', '27242.443079225905', '1', '2012-07-09 19:30:42', 'jur');
INSERT INTO `t_gps_data` VALUES ('2835453', '2012-07-09 19:30:42', '3', '', '42784.661865474125', '26247.790717307897', '40', '2012-07-09 19:30:42', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2835454', '2012-07-09 19:30:52', '1', '', '39474.49806409038', '38191.762890945545', '60', '2012-07-09 19:30:52', '2');
INSERT INTO `t_gps_data` VALUES ('2835455', '2012-07-09 19:30:52', '3', '', '39070.01078825865', '17820.2802140948', '98', '2012-07-09 19:30:52', '1');
INSERT INTO `t_gps_data` VALUES ('2835456', '2012-07-09 19:30:52', '3', '', '34791.00206397369', '27822.446286200386', '15', '2012-07-09 19:30:52', '4');
INSERT INTO `t_gps_data` VALUES ('2835457', '2012-07-09 19:30:52', '0', '', '39921.8559737731', '26147.603303899938', '46', '2012-07-09 19:30:52', '3');
INSERT INTO `t_gps_data` VALUES ('2835458', '2012-07-09 19:30:52', '2', '', '41284.57246829143', '14264.44158172398', '70', '2012-07-09 19:30:52', '5');
INSERT INTO `t_gps_data` VALUES ('2835459', '2012-07-09 19:30:52', '1', '', '37882.54216124132', '37017.65434042302', '64', '2012-07-09 19:30:52', '6');
INSERT INTO `t_gps_data` VALUES ('2835460', '2012-07-09 19:30:52', '2', '', '40038.25539189423', '36309.72246438173', '37', '2012-07-09 19:30:52', '001190251');
INSERT INTO `t_gps_data` VALUES ('2835461', '2012-07-09 19:30:52', '3', '', '39859.502440040786', '23450.94634128952', '41', '2012-07-09 19:30:52', '001014182');
INSERT INTO `t_gps_data` VALUES ('2835462', '2012-07-09 19:30:52', '3', '', '38731.236960632734', '24109.158473375628', '77', '2012-07-09 19:30:52', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2835463', '2012-07-09 19:30:52', '0', '', '39250.15208735849', '19582.42172924636', '6', '2012-07-09 19:30:52', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2835464', '2012-07-09 19:30:52', '0', '', '43765.38344028758', '38441.86585768663', '77', '2012-07-09 19:30:52', '001001003');
INSERT INTO `t_gps_data` VALUES ('2835465', '2012-07-09 19:30:52', '0', '', '30105.047591917497', '26677.284957098378', '88', '2012-07-09 19:30:52', '001067110');
INSERT INTO `t_gps_data` VALUES ('2835466', '2012-07-09 19:30:52', '3', '', '43698.72163226743', '15644.005597366295', '14', '2012-07-09 19:30:52', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2835467', '2012-07-09 19:30:52', '0', '', '34970.287841574675', '35759.00226572579', '94', '2012-07-09 19:30:52', 'amk');
INSERT INTO `t_gps_data` VALUES ('2835468', '2012-07-09 19:30:52', '3', '', '42911.639483900355', '36156.40274712371', '37', '2012-07-09 19:30:52', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2835469', '2012-07-09 19:30:52', '1', '', '41369.44670244473', '26570.439520582677', '100', '2012-07-09 19:30:52', 'cck');
INSERT INTO `t_gps_data` VALUES ('2835470', '2012-07-09 19:30:52', '2', '', '34595.11442239736', '29075.9047509536', '21', '2012-07-09 19:30:52', 'clm');
INSERT INTO `t_gps_data` VALUES ('2835471', '2012-07-09 19:30:52', '3', '', '35137.09718306948', '16782.515462029223', '87', '2012-07-09 19:30:52', 'hou');
INSERT INTO `t_gps_data` VALUES ('2835472', '2012-07-09 19:30:52', '3', '', '36690.07167524751', '27238.23376403968', '1', '2012-07-09 19:30:52', 'jur');
INSERT INTO `t_gps_data` VALUES ('2835473', '2012-07-09 19:30:52', '3', '', '42723.498037375015', '26237.92542102822', '40', '2012-07-09 19:30:52', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2835474', '2012-07-09 19:31:02', '1', '', '39501.37006000433', '38234.74403091743', '60', '2012-07-09 19:31:02', '2');
INSERT INTO `t_gps_data` VALUES ('2835475', '2012-07-09 19:31:03', '3', '', '39028.235725954924', '17795.892083653598', '98', '2012-07-09 19:31:03', '1');
INSERT INTO `t_gps_data` VALUES ('2835476', '2012-07-09 19:31:03', '3', '', '34713.32720338432', '27801.578712022052', '15', '2012-07-09 19:31:03', '4');
INSERT INTO `t_gps_data` VALUES ('2835477', '2012-07-09 19:31:03', '0', '', '39895.19222130396', '26085.036224252603', '46', '2012-07-09 19:31:03', '3');
INSERT INTO `t_gps_data` VALUES ('2835478', '2012-07-09 19:31:03', '2', '', '41327.522862679034', '14288.224091115884', '70', '2012-07-09 19:31:03', '5');
INSERT INTO `t_gps_data` VALUES ('2835479', '2012-07-09 19:31:03', '1', '', '37889.64333970783', '37112.4758281033', '64', '2012-07-09 19:31:03', '6');
INSERT INTO `t_gps_data` VALUES ('2835480', '2012-07-09 19:31:03', '2', '', '40135.13571770841', '36311.42430319599', '37', '2012-07-09 19:31:03', '001190251');
INSERT INTO `t_gps_data` VALUES ('2835481', '2012-07-09 19:31:03', '3', '', '39811.4074523913', '23441.168454365386', '41', '2012-07-09 19:31:03', '001014182');
INSERT INTO `t_gps_data` VALUES ('2835482', '2012-07-09 19:31:03', '3', '', '38696.39189825319', '24108.055972024693', '77', '2012-07-09 19:31:03', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2835483', '2012-07-09 19:31:03', '0', '', '39230.785074124935', '19542.09126122281', '6', '2012-07-09 19:31:03', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2835484', '2012-07-09 19:31:03', '0', '', '43751.87892039747', '38364.42534151814', '77', '2012-07-09 19:31:03', '001001003');
INSERT INTO `t_gps_data` VALUES ('2835485', '2012-07-09 19:31:03', '0', '', '30104.959715132863', '26631.68408856821', '88', '2012-07-09 19:31:03', '001067110');
INSERT INTO `t_gps_data` VALUES ('2835486', '2012-07-09 19:31:03', '3', '', '43665.278667981045', '15634.986176178503', '14', '2012-07-09 19:31:03', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2835487', '2012-07-09 19:31:03', '0', '', '34947.406711295065', '35720.003011018', '94', '2012-07-09 19:31:03', 'amk');
INSERT INTO `t_gps_data` VALUES ('2835488', '2012-07-09 19:31:03', '3', '', '42863.889628962956', '36138.24561954284', '37', '2012-07-09 19:31:03', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2835489', '2012-07-09 19:31:03', '1', '', '41384.36217540331', '26661.699416740572', '100', '2012-07-09 19:31:03', 'cck');
INSERT INTO `t_gps_data` VALUES ('2835490', '2012-07-09 19:31:03', '2', '', '34688.04346326983', '29096.530708583687', '21', '2012-07-09 19:31:03', 'clm');
INSERT INTO `t_gps_data` VALUES ('2835491', '2012-07-09 19:31:03', '3', '', '35039.255449656855', '16764.213210090624', '87', '2012-07-09 19:31:03', 'hou');
INSERT INTO `t_gps_data` VALUES ('2835492', '2012-07-09 19:31:03', '3', '', '36610.7537905972', '27221.282081205354', '1', '2012-07-09 19:31:03', 'jur');
INSERT INTO `t_gps_data` VALUES ('2835493', '2012-07-09 19:31:03', '3', '', '42650.289211748626', '26216.317718519484', '40', '2012-07-09 19:31:03', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2835494', '2012-07-09 19:31:13', '1', '', '39523.019235586245', '38293.72223546423', '60', '2012-07-09 19:31:13', '2');
INSERT INTO `t_gps_data` VALUES ('2835495', '2012-07-09 19:31:13', '3', '', '38948.98995147001', '17795.01377151362', '98', '2012-07-09 19:31:13', '1');
INSERT INTO `t_gps_data` VALUES ('2835496', '2012-07-09 19:31:13', '3', '', '34654.064549629424', '27774.896497630303', '15', '2012-07-09 19:31:13', '4');
INSERT INTO `t_gps_data` VALUES ('2835497', '2012-07-09 19:31:13', '0', '', '39881.42620707161', '26003.558286199896', '46', '2012-07-09 19:31:13', '3');
INSERT INTO `t_gps_data` VALUES ('2835498', '2012-07-09 19:31:13', '2', '', '41423.199902025415', '14315.455951946664', '70', '2012-07-09 19:31:13', '5');
INSERT INTO `t_gps_data` VALUES ('2835499', '2012-07-09 19:31:13', '1', '', '37908.76865578426', '37163.72326020985', '64', '2012-07-09 19:31:13', '6');
INSERT INTO `t_gps_data` VALUES ('2835500', '2012-07-09 19:31:13', '2', '', '40172.81732192066', '36331.379308318996', '37', '2012-07-09 19:31:13', '001190251');
INSERT INTO `t_gps_data` VALUES ('2835501', '2012-07-09 19:31:13', '3', '', '39772.865478085085', '23411.224239587515', '41', '2012-07-09 19:31:13', '001014182');
INSERT INTO `t_gps_data` VALUES ('2835502', '2012-07-09 19:31:13', '3', '', '38634.95534007148', '24093.992404115048', '77', '2012-07-09 19:31:13', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2835503', '2012-07-09 19:31:13', '0', '', '39207.899056745664', '19500.615552038482', '6', '2012-07-09 19:31:13', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2835504', '2012-07-09 19:31:13', '0', '', '43723.30212923453', '38311.55759098491', '77', '2012-07-09 19:31:13', '001001003');
INSERT INTO `t_gps_data` VALUES ('2835505', '2012-07-09 19:31:13', '0', '', '30076.903771694782', '26562.72630586024', '88', '2012-07-09 19:31:13', '001067110');
INSERT INTO `t_gps_data` VALUES ('2835506', '2012-07-09 19:31:13', '3', '', '43605.261400885356', '15619.943183755826', '14', '2012-07-09 19:31:13', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2835507', '2012-07-09 19:31:13', '0', '', '34942.98450219824', '35672.57280608905', '94', '2012-07-09 19:31:13', 'amk');
INSERT INTO `t_gps_data` VALUES ('2835508', '2012-07-09 19:31:13', '3', '', '42828.96615900834', '36109.78399349508', '37', '2012-07-09 19:31:13', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2835509', '2012-07-09 19:31:13', '1', '', '41386.89472783241', '26743.182029290445', '100', '2012-07-09 19:31:13', 'cck');
INSERT INTO `t_gps_data` VALUES ('2835510', '2012-07-09 19:31:13', '2', '', '34731.70730532131', '29109.46070251751', '21', '2012-07-09 19:31:13', 'clm');
INSERT INTO `t_gps_data` VALUES ('2835511', '2012-07-09 19:31:13', '3', '', '34963.84830099492', '16751.16578621385', '87', '2012-07-09 19:31:13', 'hou');
INSERT INTO `t_gps_data` VALUES ('2835512', '2012-07-09 19:31:13', '3', '', '36548.96943670413', '27200.665431876998', '1', '2012-07-09 19:31:13', 'jur');
INSERT INTO `t_gps_data` VALUES ('2835513', '2012-07-09 19:31:13', '3', '', '42597.59082690979', '26198.915197025115', '40', '2012-07-09 19:31:13', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2835514', '2012-07-09 19:31:23', '1', '', '39523.883055599406', '38378.57355693826', '60', '2012-07-09 19:31:23', '2');
INSERT INTO `t_gps_data` VALUES ('2835515', '2012-07-09 19:31:23', '3', '', '38876.126958480505', '17779.247881839205', '98', '2012-07-09 19:31:23', '1');
INSERT INTO `t_gps_data` VALUES ('2835516', '2012-07-09 19:31:23', '3', '', '34616.92194272609', '27762.855135504233', '15', '2012-07-09 19:31:23', '4');
INSERT INTO `t_gps_data` VALUES ('2835517', '2012-07-09 19:31:23', '0', '', '39854.62534030265', '25967.258574743017', '46', '2012-07-09 19:31:23', '3');
INSERT INTO `t_gps_data` VALUES ('2835518', '2012-07-09 19:31:23', '2', '', '41477.995132362', '14339.236159060796', '70', '2012-07-09 19:31:23', '5');
INSERT INTO `t_gps_data` VALUES ('2835519', '2012-07-09 19:31:23', '1', '', '37928.65365054644', '37194.16069242495', '64', '2012-07-09 19:31:23', '6');
INSERT INTO `t_gps_data` VALUES ('2835520', '2012-07-09 19:31:23', '2', '', '40205.50693087844', '36351.51068094772', '37', '2012-07-09 19:31:23', '001190251');
INSERT INTO `t_gps_data` VALUES ('2835521', '2012-07-09 19:31:23', '3', '', '39719.508985139364', '23398.751054840526', '41', '2012-07-09 19:31:23', '001014182');
INSERT INTO `t_gps_data` VALUES ('2835522', '2012-07-09 19:31:23', '3', '', '38595.58910538739', '24071.596547392386', '77', '2012-07-09 19:31:23', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2835523', '2012-07-09 19:31:23', '0', '', '39202.36180259646', '19403.211415411206', '6', '2012-07-09 19:31:23', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2835524', '2012-07-09 19:31:23', '0', '', '43701.241030906094', '38215.3041527159', '77', '2012-07-09 19:31:23', '001001003');
INSERT INTO `t_gps_data` VALUES ('2835525', '2012-07-09 19:31:23', '0', '', '30056.0713924313', '26480.206650099753', '88', '2012-07-09 19:31:23', '001067110');
INSERT INTO `t_gps_data` VALUES ('2835526', '2012-07-09 19:31:23', '3', '', '43536.94553502532', '15596.64890064749', '14', '2012-07-09 19:31:23', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2835527', '2012-07-09 19:31:23', '0', '', '34932.035927109864', '35588.901289376525', '94', '2012-07-09 19:31:23', 'amk');
INSERT INTO `t_gps_data` VALUES ('2835528', '2012-07-09 19:31:23', '3', '', '42776.80051363238', '36107.99597047409', '37', '2012-07-09 19:31:23', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2835529', '2012-07-09 19:31:23', '1', '', '41388.164739180975', '26820.142288048824', '100', '2012-07-09 19:31:23', 'cck');
INSERT INTO `t_gps_data` VALUES ('2835530', '2012-07-09 19:31:23', '2', '', '34790.36152757138', '29133.437757377687', '21', '2012-07-09 19:31:23', 'clm');
INSERT INTO `t_gps_data` VALUES ('2835531', '2012-07-09 19:31:23', '3', '', '34866.148458865246', '16737.970934742578', '87', '2012-07-09 19:31:23', 'hou');
INSERT INTO `t_gps_data` VALUES ('2835532', '2012-07-09 19:31:23', '3', '', '36507.05683035821', '27198.139679705033', '1', '2012-07-09 19:31:23', 'jur');
INSERT INTO `t_gps_data` VALUES ('2835533', '2012-07-09 19:31:23', '3', '', '42510.834028547746', '26180.070194895437', '40', '2012-07-09 19:31:23', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2835534', '2012-07-09 19:31:33', '1', '', '39544.21169739966', '38412.42775047203', '60', '2012-07-09 19:31:33', '2');
INSERT INTO `t_gps_data` VALUES ('2835535', '2012-07-09 19:31:33', '3', '', '38844.340524794825', '17756.801456975616', '98', '2012-07-09 19:31:33', '1');
INSERT INTO `t_gps_data` VALUES ('2835536', '2012-07-09 19:31:33', '3', '', '34568.82789386567', '27754.5160778707', '15', '2012-07-09 19:31:33', '4');
INSERT INTO `t_gps_data` VALUES ('2835537', '2012-07-09 19:31:33', '0', '', '39847.58320894755', '25892.058794676217', '46', '2012-07-09 19:31:33', '3');
INSERT INTO `t_gps_data` VALUES ('2835538', '2012-07-09 19:31:33', '2', '', '41557.72449789078', '14354.918418985706', '70', '2012-07-09 19:31:33', '5');
INSERT INTO `t_gps_data` VALUES ('2835539', '2012-07-09 19:31:33', '1', '', '37951.09705800046', '37248.143128205505', '64', '2012-07-09 19:31:33', '6');
INSERT INTO `t_gps_data` VALUES ('2835540', '2012-07-09 19:31:33', '2', '', '40304.82122213687', '36377.58622993778', '37', '2012-07-09 19:31:33', '001190251');
INSERT INTO `t_gps_data` VALUES ('2835541', '2012-07-09 19:31:33', '3', '', '39633.716605406815', '23389.03001822455', '41', '2012-07-09 19:31:33', '001014182');
INSERT INTO `t_gps_data` VALUES ('2835542', '2012-07-09 19:31:33', '3', '', '38524.170642337755', '24059.649265981512', '77', '2012-07-09 19:31:33', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2835543', '2012-07-09 19:31:33', '0', '', '39173.58557287709', '19340.72883839853', '6', '2012-07-09 19:31:33', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2835544', '2012-07-09 19:31:33', '0', '', '43688.003333030116', '38139.792535338536', '77', '2012-07-09 19:31:33', '001001003');
INSERT INTO `t_gps_data` VALUES ('2835545', '2012-07-09 19:31:33', '0', '', '30054.25343839488', '26402.026525863927', '88', '2012-07-09 19:31:33', '001067110');
INSERT INTO `t_gps_data` VALUES ('2835546', '2012-07-09 19:31:33', '3', '', '43468.04085072438', '15567.486773479446', '14', '2012-07-09 19:31:33', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2835547', '2012-07-09 19:31:33', '0', '', '34911.67531745269', '35532.97397803192', '94', '2012-07-09 19:31:33', 'amk');
INSERT INTO `t_gps_data` VALUES ('2835548', '2012-07-09 19:31:33', '3', '', '42712.15355785139', '36098.803605227506', '37', '2012-07-09 19:31:33', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2835549', '2012-07-09 19:31:33', '1', '', '41390.28518275106', '26917.651817602542', '100', '2012-07-09 19:31:33', 'cck');
INSERT INTO `t_gps_data` VALUES ('2835550', '2012-07-09 19:31:33', '2', '', '34821.187420546834', '29152.033801088088', '21', '2012-07-09 19:31:33', 'clm');
INSERT INTO `t_gps_data` VALUES ('2835551', '2012-07-09 19:31:33', '3', '', '34808.69530656894', '16718.812614129867', '87', '2012-07-09 19:31:33', 'hou');
INSERT INTO `t_gps_data` VALUES ('2835552', '2012-07-09 19:31:33', '3', '', '36428.174068701795', '27195.386974852117', '1', '2012-07-09 19:31:33', 'jur');
INSERT INTO `t_gps_data` VALUES ('2835553', '2012-07-09 19:31:33', '3', '', '42432.829488876734', '26158.970891538444', '40', '2012-07-09 19:31:33', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2835554', '2012-07-09 19:31:43', '1', '', '39569.48184341702', '38483.56950044993', '60', '2012-07-09 19:31:43', '2');
INSERT INTO `t_gps_data` VALUES ('2835555', '2012-07-09 19:31:43', '3', '', '38793.78514144185', '17730.693157660167', '98', '2012-07-09 19:31:43', '1');
INSERT INTO `t_gps_data` VALUES ('2835556', '2012-07-09 19:31:43', '3', '', '34470.041932623324', '27744.94155672325', '15', '2012-07-09 19:31:43', '4');
INSERT INTO `t_gps_data` VALUES ('2835557', '2012-07-09 19:31:43', '0', '', '39839.49235300109', '25799.82473696238', '46', '2012-07-09 19:31:43', '3');
INSERT INTO `t_gps_data` VALUES ('2835558', '2012-07-09 19:31:43', '2', '', '41616.05039781572', '14384.62184506876', '70', '2012-07-09 19:31:43', '5');
INSERT INTO `t_gps_data` VALUES ('2835559', '2012-07-09 19:31:43', '1', '', '37973.2509436721', '37284.83208200973', '64', '2012-07-09 19:31:43', '6');
INSERT INTO `t_gps_data` VALUES ('2835560', '2012-07-09 19:31:43', '2', '', '40397.34228785217', '36386.6454590552', '37', '2012-07-09 19:31:43', '001190251');
INSERT INTO `t_gps_data` VALUES ('2835561', '2012-07-09 19:31:43', '3', '', '39591.350117016555', '23364.929811863094', '41', '2012-07-09 19:31:43', '001014182');
INSERT INTO `t_gps_data` VALUES ('2835562', '2012-07-09 19:31:43', '3', '', '38473.78886288942', '24054.9026491042', '77', '2012-07-09 19:31:43', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2835563', '2012-07-09 19:31:43', '0', '', '39149.566368143', '19290.2220575858', '6', '2012-07-09 19:31:43', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2835564', '2012-07-09 19:31:43', '0', '', '43676.014107938725', '38097.254490659165', '77', '2012-07-09 19:31:43', '001001003');
INSERT INTO `t_gps_data` VALUES ('2835565', '2012-07-09 19:31:43', '0', '', '30039.09116905007', '26348.78075515751', '88', '2012-07-09 19:31:43', '001067110');
INSERT INTO `t_gps_data` VALUES ('2835566', '2012-07-09 19:31:43', '3', '', '43396.26165329476', '15561.734300798946', '14', '2012-07-09 19:31:43', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2835567', '2012-07-09 19:31:43', '0', '', '34902.7768036553', '35468.757055984745', '94', '2012-07-09 19:31:43', 'amk');
INSERT INTO `t_gps_data` VALUES ('2835568', '2012-07-09 19:31:43', '3', '', '42620.31231348553', '36094.492445091026', '37', '2012-07-09 19:31:43', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2835569', '2012-07-09 19:31:43', '1', '', '41397.4073902503', '26961.206918233514', '100', '2012-07-09 19:31:43', 'cck');
INSERT INTO `t_gps_data` VALUES ('2835570', '2012-07-09 19:31:43', '2', '', '34899.702978662644', '29178.71207075398', '21', '2012-07-09 19:31:43', 'clm');
INSERT INTO `t_gps_data` VALUES ('2835571', '2012-07-09 19:31:43', '3', '', '34749.55083616882', '16689.89443430186', '87', '2012-07-09 19:31:43', 'hou');
INSERT INTO `t_gps_data` VALUES ('2835572', '2012-07-09 19:31:43', '3', '', '36365.9880223437', '27176.576056999595', '1', '2012-07-09 19:31:43', 'jur');
INSERT INTO `t_gps_data` VALUES ('2835573', '2012-07-09 19:31:43', '3', '', '42367.26775476996', '26137.091843184564', '40', '2012-07-09 19:31:43', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2835574', '2012-07-09 19:31:53', '1', '', '39595.57648924502', '38568.27804500851', '60', '2012-07-09 19:31:53', '2');
INSERT INTO `t_gps_data` VALUES ('2835575', '2012-07-09 19:31:53', '3', '', '38722.87994087312', '17711.30269520295', '98', '2012-07-09 19:31:53', '1');
INSERT INTO `t_gps_data` VALUES ('2835576', '2012-07-09 19:31:53', '3', '', '34397.25275175643', '27740.118555044355', '15', '2012-07-09 19:31:53', '4');
INSERT INTO `t_gps_data` VALUES ('2835577', '2012-07-09 19:31:53', '0', '', '39833.43879342322', '25758.6163614148', '46', '2012-07-09 19:31:53', '3');
INSERT INTO `t_gps_data` VALUES ('2835578', '2012-07-09 19:31:53', '2', '', '41672.92171495486', '14389.430920631401', '70', '2012-07-09 19:31:53', '5');
INSERT INTO `t_gps_data` VALUES ('2835579', '2012-07-09 19:31:53', '1', '', '37986.05953042996', '37363.77814894628', '64', '2012-07-09 19:31:53', '6');
INSERT INTO `t_gps_data` VALUES ('2835580', '2012-07-09 19:31:53', '2', '', '40463.82543994332', '36393.972031421355', '37', '2012-07-09 19:31:53', '001190251');
INSERT INTO `t_gps_data` VALUES ('2835581', '2012-07-09 19:31:53', '3', '', '39543.30987117806', '23337.089171602896', '41', '2012-07-09 19:31:53', '001014182');
INSERT INTO `t_gps_data` VALUES ('2835582', '2012-07-09 19:31:53', '3', '', '38386.02320699699', '24031.02803110663', '77', '2012-07-09 19:31:53', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2835583', '2012-07-09 19:31:53', '0', '', '39146.07145724576', '19211.033949831824', '6', '2012-07-09 19:31:53', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2835584', '2012-07-09 19:31:53', '0', '', '43674.88143708667', '37998.918683146316', '77', '2012-07-09 19:31:53', '001001003');
INSERT INTO `t_gps_data` VALUES ('2835585', '2012-07-09 19:31:53', '0', '', '30022.22646485861', '26268.600604985484', '88', '2012-07-09 19:31:53', '001067110');
INSERT INTO `t_gps_data` VALUES ('2835586', '2012-07-09 19:31:53', '3', '', '43366.23264788635', '15560.847014055658', '14', '2012-07-09 19:31:53', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2835587', '2012-07-09 19:31:53', '0', '', '34900.95629769593', '35388.76975960353', '94', '2012-07-09 19:31:53', 'amk');
INSERT INTO `t_gps_data` VALUES ('2835588', '2012-07-09 19:31:53', '3', '', '42580.35713032216', '36070.12589390451', '37', '2012-07-09 19:31:53', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2835589', '2012-07-09 19:31:53', '1', '', '41422.41811280582', '27023.788909789688', '100', '2012-07-09 19:31:53', 'cck');
INSERT INTO `t_gps_data` VALUES ('2835590', '2012-07-09 19:31:53', '2', '', '34935.59476377458', '29206.818822864156', '21', '2012-07-09 19:31:53', 'clm');
INSERT INTO `t_gps_data` VALUES ('2835591', '2012-07-09 19:31:53', '3', '', '34656.292218243376', '16677.002521432183', '87', '2012-07-09 19:31:53', 'hou');
INSERT INTO `t_gps_data` VALUES ('2835592', '2012-07-09 19:31:53', '3', '', '36322.55517834888', '27173.830042313766', '1', '2012-07-09 19:31:53', 'jur');
INSERT INTO `t_gps_data` VALUES ('2835593', '2012-07-09 19:31:53', '3', '', '42314.77779532127', '26125.768312173674', '40', '2012-07-09 19:31:53', 'tpy');

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_vehicle
-- ----------------------------
INSERT INTO `t_vehicle` VALUES ('1', '192.168.21.12', 'vehicle01', 'BA00001', 'bus', '4', '11', 'vehicle01');
INSERT INTO `t_vehicle` VALUES ('2', '210.38.124.35', 'vehicle02', 'FT00002', 'car', '8', '2', 'vehicle02');
INSERT INTO `t_vehicle` VALUES ('4', '33.125.45.782', 'vehicle03', 'HZ00012', 'bus', '12', '6', 'vehicle03');
INSERT INTO `t_vehicle` VALUES ('5', '210.58.654.12', 'vehicle04', 'CN0005', 'car', '11', '2', 'vehicle04');
INSERT INTO `t_vehicle` VALUES ('6', '102.210.45.41', 'vehicle05', 'GZ00001', 'bus', '18', '2', 'vehicle05');
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
