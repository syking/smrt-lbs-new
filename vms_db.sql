/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50511
Source Host           : localhost:3306
Source Database       : vms_db

Target Server Type    : MYSQL
Target Server Version : 50511
File Encoding         : 65001

Date: 2012-06-15 10:36:54
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_counsel`
-- ----------------------------
DROP TABLE IF EXISTS `t_counsel`;
CREATE TABLE `t_counsel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `end_time` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `start_time` varchar(255) DEFAULT NULL,
  `driver_id` bigint(20) DEFAULT NULL,
  `users_id` bigint(20) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF4A9456A4F961CDE` (`driver_id`),
  KEY `FKF4A9456A4004E7A1` (`users_id`),
  CONSTRAINT `FKF4A9456A4004E7A1` FOREIGN KEY (`users_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FKF4A9456A4F961CDE` FOREIGN KEY (`driver_id`) REFERENCES `t_driver` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_counsel
-- ----------------------------
INSERT INTO `t_counsel` VALUES ('1', '20:30:53', 'sdfasdf', '15:30:21', null, null, '2012-03-05');

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_driver
-- ----------------------------
INSERT INTO `t_driver` VALUES ('1', 'TEST', 'jack', '74689', '2');
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

-- ----------------------------
-- Table structure for `t_driver_report`
-- ----------------------------
DROP TABLE IF EXISTS `t_driver_report`;
CREATE TABLE `t_driver_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `report_time` datetime DEFAULT NULL,
  `event_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF7ADB4A0BAFEA2D6` (`event_id`),
  CONSTRAINT `FKF7ADB4A0BAFEA2D6` FOREIGN KEY (`event_id`) REFERENCES `t_event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_driver_report
-- ----------------------------
INSERT INTO `t_driver_report` VALUES ('1', '2012-05-08 21:10:38', '24');
INSERT INTO `t_driver_report` VALUES ('2', '2012-05-09 21:10:49', '25');
INSERT INTO `t_driver_report` VALUES ('3', '2012-05-10 21:11:03', '26');
INSERT INTO `t_driver_report` VALUES ('4', '2012-05-02 21:11:15', '24');
INSERT INTO `t_driver_report` VALUES ('5', '2012-05-24 22:11:38', '27');
INSERT INTO `t_driver_report` VALUES ('6', '2012-05-24 22:11:38', '28');
INSERT INTO `t_driver_report` VALUES ('7', '2012-05-24 22:11:38', '29');
INSERT INTO `t_driver_report` VALUES ('8', '2012-05-24 22:11:38', '31');
INSERT INTO `t_driver_report` VALUES ('9', '2012-05-24 22:11:38', '30');
INSERT INTO `t_driver_report` VALUES ('10', '2012-05-24 22:11:38', '32');

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
INSERT INTO `t_fleet` VALUES ('11', 'fleet_6_1', 'fleet_6_1', '45732', '10');

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
) ENGINE=InnoDB AUTO_INCREMENT=2084714 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_gps_data
-- ----------------------------
INSERT INTO `t_gps_data` VALUES ('2084474', '2012-06-15 10:35:01', '3', '', '30795.191399161522', '36231.95175779292', '87', '2012-06-15 10:35:01', '2');
INSERT INTO `t_gps_data` VALUES ('2084475', '2012-06-15 10:35:01', '2', '', '41462.01426134841', '31679.25839759126', '84', '2012-06-15 10:35:01', '1');
INSERT INTO `t_gps_data` VALUES ('2084476', '2012-06-15 10:35:01', '0', '', '42839.85877357939', '38158.60014003848', '17', '2012-06-15 10:35:01', '4');
INSERT INTO `t_gps_data` VALUES ('2084477', '2012-06-15 10:35:01', '0', '', '36051.78533053545', '30384.464136210296', '4', '2012-06-15 10:35:01', '3');
INSERT INTO `t_gps_data` VALUES ('2084478', '2012-06-15 10:35:01', '1', '', '35802.56535053911', '23595.94374285644', '50', '2012-06-15 10:35:01', '5');
INSERT INTO `t_gps_data` VALUES ('2084479', '2012-06-15 10:35:01', '0', '', '37683.485632289245', '18848.324093555617', '56', '2012-06-15 10:35:01', '6');
INSERT INTO `t_gps_data` VALUES ('2084480', '2012-06-15 10:35:01', '3', '', '44466.19971543238', '38436.622650124285', '5', '2012-06-15 10:35:01', '001190251');
INSERT INTO `t_gps_data` VALUES ('2084481', '2012-06-15 10:35:01', '3', '', '37524.0493137339', '15585.004452094163', '79', '2012-06-15 10:35:01', '001014182');
INSERT INTO `t_gps_data` VALUES ('2084482', '2012-06-15 10:35:01', '0', '', '33694.2318265238', '18552.661877528008', '74', '2012-06-15 10:35:01', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2084483', '2012-06-15 10:35:01', '0', '', '31469.55464551999', '14825.435211422991', '29', '2012-06-15 10:35:01', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2084484', '2012-06-15 10:35:01', '0', '', '39600.6164705934', '25990.29364257719', '90', '2012-06-15 10:35:01', '001001003');
INSERT INTO `t_gps_data` VALUES ('2084485', '2012-06-15 10:35:01', '2', '', '36970.33288508417', '32834.46478404204', '39', '2012-06-15 10:35:01', '001067110');
INSERT INTO `t_gps_data` VALUES ('2084486', '2012-06-15 10:35:01', '3', '', '41014.72105763183', '28890.03945636396', '75', '2012-06-15 10:35:01', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2084487', '2012-06-15 10:35:01', '0', '', '35987.31116434336', '31224.164154573762', '64', '2012-06-15 10:35:01', 'amk');
INSERT INTO `t_gps_data` VALUES ('2084488', '2012-06-15 10:35:01', '3', '', '31914.217932660496', '35298.81512663579', '69', '2012-06-15 10:35:01', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2084489', '2012-06-15 10:35:01', '2', '', '34554.39765143381', '15712.90460717724', '90', '2012-06-15 10:35:01', 'cck');
INSERT INTO `t_gps_data` VALUES ('2084490', '2012-06-15 10:35:01', '0', '', '33067.17702002769', '19665.87762650506', '93', '2012-06-15 10:35:01', 'clm');
INSERT INTO `t_gps_data` VALUES ('2084491', '2012-06-15 10:35:01', '1', '', '38163.063726894354', '31631.787878017698', '28', '2012-06-15 10:35:01', 'hou');
INSERT INTO `t_gps_data` VALUES ('2084492', '2012-06-15 10:35:01', '2', '', '32106.6853272854', '32940.6891506574', '41', '2012-06-15 10:35:01', 'jur');
INSERT INTO `t_gps_data` VALUES ('2084493', '2012-06-15 10:35:01', '0', '', '37536.73836073444', '38096.37948136931', '46', '2012-06-15 10:35:01', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2084494', '2012-06-15 10:35:11', '3', '', '30733.05880914731', '36230.13109471656', '87', '2012-06-15 10:35:11', '2');
INSERT INTO `t_gps_data` VALUES ('2084495', '2012-06-15 10:35:11', '2', '', '41541.297940024735', '31692.470607041403', '84', '2012-06-15 10:35:11', '1');
INSERT INTO `t_gps_data` VALUES ('2084496', '2012-06-15 10:35:11', '0', '', '42810.911711949215', '38123.65087578867', '17', '2012-06-15 10:35:11', '4');
INSERT INTO `t_gps_data` VALUES ('2084497', '2012-06-15 10:35:11', '0', '', '36038.80468288933', '30318.834992769807', '4', '2012-06-15 10:35:11', '3');
INSERT INTO `t_gps_data` VALUES ('2084498', '2012-06-15 10:35:11', '1', '', '35804.369381930446', '23642.506027586052', '50', '2012-06-15 10:35:11', '5');
INSERT INTO `t_gps_data` VALUES ('2084499', '2012-06-15 10:35:11', '0', '', '37658.914264839776', '18779.68643468259', '56', '2012-06-15 10:35:11', '6');
INSERT INTO `t_gps_data` VALUES ('2084500', '2012-06-15 10:35:11', '3', '', '44410.36364704621', '38434.73511918642', '5', '2012-06-15 10:35:11', '001190251');
INSERT INTO `t_gps_data` VALUES ('2084501', '2012-06-15 10:35:11', '3', '', '37477.573865412305', '15568.34616080094', '79', '2012-06-15 10:35:11', '001014182');
INSERT INTO `t_gps_data` VALUES ('2084502', '2012-06-15 10:35:11', '0', '', '33664.5266452688', '18484.703553230032', '74', '2012-06-15 10:35:11', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2084503', '2012-06-15 10:35:11', '0', '', '31459.428755335775', '14776.539371495495', '29', '2012-06-15 10:35:11', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2084504', '2012-06-15 10:35:11', '0', '', '39588.580242572956', '25922.805307708462', '90', '2012-06-15 10:35:11', '001001003');
INSERT INTO `t_gps_data` VALUES ('2084505', '2012-06-15 10:35:11', '2', '', '37052.65000737405', '32854.7419024557', '39', '2012-06-15 10:35:11', '001067110');
INSERT INTO `t_gps_data` VALUES ('2084506', '2012-06-15 10:35:11', '3', '', '40968.73846518521', '28875.60776802197', '75', '2012-06-15 10:35:11', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2084507', '2012-06-15 10:35:11', '0', '', '35987.30588422636', '31143.889288599643', '64', '2012-06-15 10:35:11', 'amk');
INSERT INTO `t_gps_data` VALUES ('2084508', '2012-06-15 10:35:11', '3', '', '31843.54135165385', '35281.15396575794', '69', '2012-06-15 10:35:11', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2084509', '2012-06-15 10:35:11', '2', '', '34607.38196199946', '15729.2032621182', '90', '2012-06-15 10:35:11', 'cck');
INSERT INTO `t_gps_data` VALUES ('2084510', '2012-06-15 10:35:11', '0', '', '33056.21383316887', '19627.311324624265', '93', '2012-06-15 10:35:11', 'clm');
INSERT INTO `t_gps_data` VALUES ('2084511', '2012-06-15 10:35:11', '1', '', '38164.71626832793', '31709.78109728323', '28', '2012-06-15 10:35:11', 'hou');
INSERT INTO `t_gps_data` VALUES ('2084512', '2012-06-15 10:35:11', '2', '', '32192.674772363305', '32943.57535924112', '41', '2012-06-15 10:35:11', 'jur');
INSERT INTO `t_gps_data` VALUES ('2084513', '2012-06-15 10:35:11', '0', '', '37514.522859439676', '38041.65611607871', '46', '2012-06-15 10:35:11', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2084514', '2012-06-15 10:35:21', '3', '', '30650.739793930436', '36203.98441963216', '87', '2012-06-15 10:35:21', '2');
INSERT INTO `t_gps_data` VALUES ('2084515', '2012-06-15 10:35:21', '2', '', '41613.280275281744', '31699.216808880934', '84', '2012-06-15 10:35:21', '1');
INSERT INTO `t_gps_data` VALUES ('2084516', '2012-06-15 10:35:21', '0', '', '42810.51470673316', '38083.37399072055', '17', '2012-06-15 10:35:21', '4');
INSERT INTO `t_gps_data` VALUES ('2084517', '2012-06-15 10:35:21', '0', '', '36038.775763209414', '30220.794946514452', '4', '2012-06-15 10:35:21', '3');
INSERT INTO `t_gps_data` VALUES ('2084518', '2012-06-15 10:35:21', '1', '', '35809.87483963399', '23696.85171563024', '50', '2012-06-15 10:35:21', '5');
INSERT INTO `t_gps_data` VALUES ('2084519', '2012-06-15 10:35:21', '0', '', '37657.3521933506', '18721.063089764688', '56', '2012-06-15 10:35:21', '6');
INSERT INTO `t_gps_data` VALUES ('2084520', '2012-06-15 10:35:21', '3', '', '44328.841674943826', '38406.32654153099', '5', '2012-06-15 10:35:21', '001190251');
INSERT INTO `t_gps_data` VALUES ('2084521', '2012-06-15 10:35:21', '3', '', '37402.721708897625', '15545.075384913303', '79', '2012-06-15 10:35:21', '001014182');
INSERT INTO `t_gps_data` VALUES ('2084522', '2012-06-15 10:35:21', '0', '', '33635.69340907218', '18443.058540036523', '74', '2012-06-15 10:35:21', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2084523', '2012-06-15 10:35:21', '0', '', '31438.480965450228', '14686.86487606315', '29', '2012-06-15 10:35:21', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2084524', '2012-06-15 10:35:21', '0', '', '39559.04538294429', '25858.683443857633', '90', '2012-06-15 10:35:21', '001001003');
INSERT INTO `t_gps_data` VALUES ('2084525', '2012-06-15 10:35:21', '2', '', '37083.73229957643', '32856.24417201335', '39', '2012-06-15 10:35:21', '001067110');
INSERT INTO `t_gps_data` VALUES ('2084526', '2012-06-15 10:35:21', '3', '', '40902.82025498388', '28852.015328438607', '75', '2012-06-15 10:35:21', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2084527', '2012-06-15 10:35:21', '0', '', '35965.20811241576', '31047.551606822126', '64', '2012-06-15 10:35:21', 'amk');
INSERT INTO `t_gps_data` VALUES ('2084528', '2012-06-15 10:35:21', '3', '', '31762.808183055608', '35258.97624155145', '69', '2012-06-15 10:35:21', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2084529', '2012-06-15 10:35:21', '2', '', '34648.370992003525', '15741.793842198185', '90', '2012-06-15 10:35:21', 'cck');
INSERT INTO `t_gps_data` VALUES ('2084530', '2012-06-15 10:35:21', '0', '', '33051.88171735018', '19558.212563412817', '93', '2012-06-15 10:35:21', 'clm');
INSERT INTO `t_gps_data` VALUES ('2084531', '2012-06-15 10:35:21', '1', '', '38176.053899323386', '31764.074958106066', '28', '2012-06-15 10:35:21', 'hou');
INSERT INTO `t_gps_data` VALUES ('2084532', '2012-06-15 10:35:21', '2', '', '32261.916259082216', '32953.94437910775', '41', '2012-06-15 10:35:21', 'jur');
INSERT INTO `t_gps_data` VALUES ('2084533', '2012-06-15 10:35:21', '0', '', '37501.384706228964', '37993.19318460459', '46', '2012-06-15 10:35:21', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2084534', '2012-06-15 10:35:31', '3', '', '30606.001166687736', '36174.286467751575', '87', '2012-06-15 10:35:31', '2');
INSERT INTO `t_gps_data` VALUES ('2084535', '2012-06-15 10:35:31', '2', '', '41700.83385730612', '31718.599564938453', '84', '2012-06-15 10:35:31', '1');
INSERT INTO `t_gps_data` VALUES ('2084536', '2012-06-15 10:35:31', '0', '', '42782.915872137964', '38016.416010100475', '17', '2012-06-15 10:35:31', '4');
INSERT INTO `t_gps_data` VALUES ('2084537', '2012-06-15 10:35:31', '0', '', '36009.057149578824', '30167.06488969677', '4', '2012-06-15 10:35:31', '3');
INSERT INTO `t_gps_data` VALUES ('2084538', '2012-06-15 10:35:31', '1', '', '35833.92073060564', '23771.250745004956', '50', '2012-06-15 10:35:31', '5');
INSERT INTO `t_gps_data` VALUES ('2084539', '2012-06-15 10:35:31', '0', '', '37648.907222174035', '18677.316330230668', '56', '2012-06-15 10:35:31', '6');
INSERT INTO `t_gps_data` VALUES ('2084540', '2012-06-15 10:35:31', '3', '', '44296.35827363973', '38388.999289068146', '5', '2012-06-15 10:35:31', '001190251');
INSERT INTO `t_gps_data` VALUES ('2084541', '2012-06-15 10:35:31', '3', '', '37308.38408206001', '15545.022570841977', '79', '2012-06-15 10:35:31', '001014182');
INSERT INTO `t_gps_data` VALUES ('2084542', '2012-06-15 10:35:31', '0', '', '33625.78684175223', '18375.03601721819', '74', '2012-06-15 10:35:31', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2084543', '2012-06-15 10:35:31', '0', '', '31411.691067614476', '14608.158711268423', '29', '2012-06-15 10:35:31', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2084544', '2012-06-15 10:35:31', '0', '', '39556.74910172004', '25813.18359242074', '90', '2012-06-15 10:35:31', '001001003');
INSERT INTO `t_gps_data` VALUES ('2084545', '2012-06-15 10:35:31', '2', '', '37122.68479375576', '32878.36262672051', '39', '2012-06-15 10:35:31', '001067110');
INSERT INTO `t_gps_data` VALUES ('2084546', '2012-06-15 10:35:31', '3', '', '40831.600674753514', '28842.51674151194', '75', '2012-06-15 10:35:31', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2084547', '2012-06-15 10:35:31', '0', '', '35940.529757361095', '30947.584155563734', '64', '2012-06-15 10:35:31', 'amk');
INSERT INTO `t_gps_data` VALUES ('2084548', '2012-06-15 10:35:31', '3', '', '31676.108157244205', '35241.67845918221', '69', '2012-06-15 10:35:31', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2084549', '2012-06-15 10:35:31', '2', '', '34698.36342523347', '15750.962188268059', '90', '2012-06-15 10:35:31', 'cck');
INSERT INTO `t_gps_data` VALUES ('2084550', '2012-06-15 10:35:31', '0', '', '33026.326635226855', '19482.30342646911', '93', '2012-06-15 10:35:31', 'clm');
INSERT INTO `t_gps_data` VALUES ('2084551', '2012-06-15 10:35:31', '1', '', '38198.601030863094', '31859.19464318727', '28', '2012-06-15 10:35:31', 'hou');
INSERT INTO `t_gps_data` VALUES ('2084552', '2012-06-15 10:35:31', '2', '', '32292.266242262158', '32962.48586836004', '41', '2012-06-15 10:35:31', 'jur');
INSERT INTO `t_gps_data` VALUES ('2084553', '2012-06-15 10:35:31', '0', '', '37489.80389347341', '37893.438564314216', '46', '2012-06-15 10:35:31', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2084554', '2012-06-15 10:35:41', '3', '', '30509.904693862532', '36161.70458054664', '87', '2012-06-15 10:35:41', '2');
INSERT INTO `t_gps_data` VALUES ('2084555', '2012-06-15 10:35:41', '2', '', '41758.039700095374', '31735.255036192735', '84', '2012-06-15 10:35:41', '1');
INSERT INTO `t_gps_data` VALUES ('2084556', '2012-06-15 10:35:41', '0', '', '42782.56636634698', '37946.79133509835', '17', '2012-06-15 10:35:41', '4');
INSERT INTO `t_gps_data` VALUES ('2084557', '2012-06-15 10:35:41', '0', '', '36008.44991125922', '30108.13779655624', '4', '2012-06-15 10:35:41', '3');
INSERT INTO `t_gps_data` VALUES ('2084558', '2012-06-15 10:35:41', '1', '', '35839.51517294415', '23838.35572011596', '50', '2012-06-15 10:35:41', '5');
INSERT INTO `t_gps_data` VALUES ('2084559', '2012-06-15 10:35:41', '0', '', '37623.12096208065', '18612.441735134795', '56', '2012-06-15 10:35:41', '6');
INSERT INTO `t_gps_data` VALUES ('2084560', '2012-06-15 10:35:41', '3', '', '44246.44406182126', '38362.21687817075', '5', '2012-06-15 10:35:41', '001190251');
INSERT INTO `t_gps_data` VALUES ('2084561', '2012-06-15 10:35:41', '3', '', '37261.999781960796', '15539.684668109137', '79', '2012-06-15 10:35:41', '001014182');
INSERT INTO `t_gps_data` VALUES ('2084562', '2012-06-15 10:35:41', '0', '', '33610.15936548384', '18276.67558580571', '74', '2012-06-15 10:35:41', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2084563', '2012-06-15 10:35:41', '0', '', '31387.150110235205', '14513.509098096576', '29', '2012-06-15 10:35:41', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2084564', '2012-06-15 10:35:41', '0', '', '39547.7979474796', '25735.828024565395', '90', '2012-06-15 10:35:41', '001001003');
INSERT INTO `t_gps_data` VALUES ('2084565', '2012-06-15 10:35:41', '2', '', '37162.5957761251', '32901.83018334385', '39', '2012-06-15 10:35:41', '001067110');
INSERT INTO `t_gps_data` VALUES ('2084566', '2012-06-15 10:35:41', '3', '', '40783.03005151207', '28819.314860265837', '75', '2012-06-15 10:35:41', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2084567', '2012-06-15 10:35:41', '0', '', '35919.22754293553', '30905.296074745813', '64', '2012-06-15 10:35:41', 'amk');
INSERT INTO `t_gps_data` VALUES ('2084568', '2012-06-15 10:35:41', '3', '', '31614.74535744446', '35234.220736634925', '69', '2012-06-15 10:35:41', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2084569', '2012-06-15 10:35:41', '2', '', '34737.921939816915', '15757.098638142565', '90', '2012-06-15 10:35:41', 'cck');
INSERT INTO `t_gps_data` VALUES ('2084570', '2012-06-15 10:35:41', '0', '', '33005.06370412519', '19392.337610011014', '93', '2012-06-15 10:35:41', 'clm');
INSERT INTO `t_gps_data` VALUES ('2084571', '2012-06-15 10:35:41', '1', '', '38211.643899176444', '31940.493046252177', '28', '2012-06-15 10:35:41', 'hou');
INSERT INTO `t_gps_data` VALUES ('2084572', '2012-06-15 10:35:41', '2', '', '32356.141100442335', '32990.540078144135', '41', '2012-06-15 10:35:41', 'jur');
INSERT INTO `t_gps_data` VALUES ('2084573', '2012-06-15 10:35:41', '0', '', '37479.31183515377', '37857.062592737304', '46', '2012-06-15 10:35:41', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2084574', '2012-06-15 10:35:51', '3', '', '30462.86682108676', '36151.31142577878', '87', '2012-06-15 10:35:51', '2');
INSERT INTO `t_gps_data` VALUES ('2084575', '2012-06-15 10:35:51', '2', '', '41834.06357706745', '31751.57018689877', '84', '2012-06-15 10:35:51', '1');
INSERT INTO `t_gps_data` VALUES ('2084576', '2012-06-15 10:35:51', '0', '', '42771.090640289294', '37906.475736547414', '17', '2012-06-15 10:35:51', '4');
INSERT INTO `t_gps_data` VALUES ('2084577', '2012-06-15 10:35:51', '0', '', '35980.86919493942', '30038.37588073524', '4', '2012-06-15 10:35:51', '3');
INSERT INTO `t_gps_data` VALUES ('2084578', '2012-06-15 10:35:51', '1', '', '35847.36441121042', '23928.209698818886', '50', '2012-06-15 10:35:51', '5');
INSERT INTO `t_gps_data` VALUES ('2084579', '2012-06-15 10:35:51', '0', '', '37602.91326721848', '18574.930764254685', '56', '2012-06-15 10:35:51', '6');
INSERT INTO `t_gps_data` VALUES ('2084580', '2012-06-15 10:35:51', '3', '', '44194.901018909135', '38336.113767568124', '5', '2012-06-15 10:35:51', '001190251');
INSERT INTO `t_gps_data` VALUES ('2084581', '2012-06-15 10:35:51', '3', '', '37218.00283325207', '15525.08711654491', '79', '2012-06-15 10:35:51', '001014182');
INSERT INTO `t_gps_data` VALUES ('2084582', '2012-06-15 10:35:51', '0', '', '33596.67305020106', '18231.519446598086', '74', '2012-06-15 10:35:51', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2084583', '2012-06-15 10:35:51', '0', '', '31367.065839660347', '14465.10142051109', '29', '2012-06-15 10:35:51', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2084584', '2012-06-15 10:35:51', '0', '', '39547.04594896047', '25684.58906452733', '90', '2012-06-15 10:35:51', '001001003');
INSERT INTO `t_gps_data` VALUES ('2084585', '2012-06-15 10:35:51', '2', '', '37201.41039077327', '32916.85741143452', '39', '2012-06-15 10:35:51', '001067110');
INSERT INTO `t_gps_data` VALUES ('2084586', '2012-06-15 10:35:51', '3', '', '40730.44352317441', '28797.297070174864', '75', '2012-06-15 10:35:51', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2084587', '2012-06-15 10:35:51', '0', '', '35915.53259174722', '30821.21839250492', '64', '2012-06-15 10:35:51', 'amk');
INSERT INTO `t_gps_data` VALUES ('2084588', '2012-06-15 10:35:51', '3', '', '31548.51664812722', '35224.59996933368', '69', '2012-06-15 10:35:51', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2084589', '2012-06-15 10:35:51', '2', '', '34781.135393587494', '15774.05553340785', '90', '2012-06-15 10:35:51', 'cck');
INSERT INTO `t_gps_data` VALUES ('2084590', '2012-06-15 10:35:51', '0', '', '32981.991423424945', '19297.06736615667', '93', '2012-06-15 10:35:51', 'clm');
INSERT INTO `t_gps_data` VALUES ('2084591', '2012-06-15 10:35:51', '1', '', '38231.30651936188', '31978.81574407818', '28', '2012-06-15 10:35:51', 'hou');
INSERT INTO `t_gps_data` VALUES ('2084592', '2012-06-15 10:35:51', '2', '', '32449.466585480914', '33004.38998930168', '41', '2012-06-15 10:35:51', 'jur');
INSERT INTO `t_gps_data` VALUES ('2084593', '2012-06-15 10:35:51', '0', '', '37466.160180756495', '37818.037238838355', '46', '2012-06-15 10:35:51', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2084594', '2012-06-15 10:36:01', '3', '', '30384.385552797983', '36134.46338534883', '87', '2012-06-15 10:36:01', '2');
INSERT INTO `t_gps_data` VALUES ('2084595', '2012-06-15 10:36:01', '2', '', '41874.54258584688', '31774.662515371463', '84', '2012-06-15 10:36:01', '1');
INSERT INTO `t_gps_data` VALUES ('2084596', '2012-06-15 10:36:01', '0', '', '42769.74876786763', '37875.95647120845', '17', '2012-06-15 10:36:01', '4');
INSERT INTO `t_gps_data` VALUES ('2084597', '2012-06-15 10:36:01', '0', '', '35971.96127454384', '29965.50332082183', '4', '2012-06-15 10:36:01', '3');
INSERT INTO `t_gps_data` VALUES ('2084598', '2012-06-15 10:36:01', '1', '', '35853.24017923342', '23981.46170559666', '50', '2012-06-15 10:36:01', '5');
INSERT INTO `t_gps_data` VALUES ('2084599', '2012-06-15 10:36:01', '0', '', '37600.606402839585', '18491.349832817', '56', '2012-06-15 10:36:01', '6');
INSERT INTO `t_gps_data` VALUES ('2084600', '2012-06-15 10:36:01', '3', '', '44121.30280498608', '38306.99278448412', '5', '2012-06-15 10:36:01', '001190251');
INSERT INTO `t_gps_data` VALUES ('2084601', '2012-06-15 10:36:01', '3', '', '37174.44817945961', '15518.274366573467', '79', '2012-06-15 10:36:01', '001014182');
INSERT INTO `t_gps_data` VALUES ('2084602', '2012-06-15 10:36:01', '0', '', '33571.52549053412', '18192.135960952623', '74', '2012-06-15 10:36:01', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2084603', '2012-06-15 10:36:01', '0', '', '31360.40610294821', '14432.825165606291', '29', '2012-06-15 10:36:01', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2084604', '2012-06-15 10:36:01', '0', '', '39542.97972747752', '25650.788743830664', '90', '2012-06-15 10:36:01', '001001003');
INSERT INTO `t_gps_data` VALUES ('2084605', '2012-06-15 10:36:01', '2', '', '37283.0937297998', '32942.87104435115', '39', '2012-06-15 10:36:01', '001067110');
INSERT INTO `t_gps_data` VALUES ('2084606', '2012-06-15 10:36:01', '3', '', '40667.25138726852', '28785.935696357974', '75', '2012-06-15 10:36:01', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2084607', '2012-06-15 10:36:01', '0', '', '35893.71107828844', '30776.004000366906', '64', '2012-06-15 10:36:01', 'amk');
INSERT INTO `t_gps_data` VALUES ('2084608', '2012-06-15 10:36:01', '3', '', '31502.20555296459', '35221.510546717596', '69', '2012-06-15 10:36:01', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2084609', '2012-06-15 10:36:01', '2', '', '34878.08605090837', '15776.074014668415', '90', '2012-06-15 10:36:01', 'cck');
INSERT INTO `t_gps_data` VALUES ('2084610', '2012-06-15 10:36:01', '0', '', '32969.19882201049', '19246.51641021223', '93', '2012-06-15 10:36:01', 'clm');
INSERT INTO `t_gps_data` VALUES ('2084611', '2012-06-15 10:36:01', '1', '', '38254.41648880931', '32060.104518285745', '28', '2012-06-15 10:36:01', 'hou');
INSERT INTO `t_gps_data` VALUES ('2084612', '2012-06-15 10:36:01', '2', '', '32493.450825139622', '33021.87650082004', '41', '2012-06-15 10:36:01', 'jur');
INSERT INTO `t_gps_data` VALUES ('2084613', '2012-06-15 10:36:01', '0', '', '37451.47922762482', '37761.5431229725', '46', '2012-06-15 10:36:01', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2084614', '2012-06-15 10:36:11', '3', '', '30295.356470449897', '36117.46259844389', '87', '2012-06-15 10:36:11', '2');
INSERT INTO `t_gps_data` VALUES ('2084615', '2012-06-15 10:36:11', '2', '', '41916.38652832265', '31794.126957756624', '84', '2012-06-15 10:36:11', '1');
INSERT INTO `t_gps_data` VALUES ('2084616', '2012-06-15 10:36:11', '0', '', '42766.844374878085', '37784.19645801734', '17', '2012-06-15 10:36:11', '4');
INSERT INTO `t_gps_data` VALUES ('2084617', '2012-06-15 10:36:11', '0', '', '35958.184475864524', '29923.493014940457', '4', '2012-06-15 10:36:11', '3');
INSERT INTO `t_gps_data` VALUES ('2084618', '2012-06-15 10:36:11', '1', '', '35867.554713511956', '24059.61479552418', '50', '2012-06-15 10:36:11', '5');
INSERT INTO `t_gps_data` VALUES ('2084619', '2012-06-15 10:36:11', '0', '', '37583.38050155491', '18437.24563942275', '56', '2012-06-15 10:36:11', '6');
INSERT INTO `t_gps_data` VALUES ('2084620', '2012-06-15 10:36:11', '3', '', '44032.51375717356', '38277.337989498374', '5', '2012-06-15 10:36:11', '001190251');
INSERT INTO `t_gps_data` VALUES ('2084621', '2012-06-15 10:36:11', '3', '', '37121.45470754992', '15492.453961875253', '79', '2012-06-15 10:36:11', '001014182');
INSERT INTO `t_gps_data` VALUES ('2084622', '2012-06-15 10:36:11', '0', '', '33570.73811961887', '18100.37223231976', '74', '2012-06-15 10:36:11', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2084623', '2012-06-15 10:36:11', '0', '', '31353.213496796874', '14379.077469450885', '29', '2012-06-15 10:36:11', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2084624', '2012-06-15 10:36:11', '0', '', '39536.28473889319', '25570.530185509095', '90', '2012-06-15 10:36:11', '001001003');
INSERT INTO `t_gps_data` VALUES ('2084625', '2012-06-15 10:36:11', '2', '', '37365.291420929556', '32959.77711338626', '39', '2012-06-15 10:36:11', '001067110');
INSERT INTO `t_gps_data` VALUES ('2084626', '2012-06-15 10:36:11', '3', '', '40611.68553377749', '28761.28141395636', '75', '2012-06-15 10:36:11', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2084627', '2012-06-15 10:36:11', '0', '', '35875.842725255', '30721.96415567016', '64', '2012-06-15 10:36:11', 'amk');
INSERT INTO `t_gps_data` VALUES ('2084628', '2012-06-15 10:36:11', '3', '', '31423.456020260954', '35214.382901811085', '69', '2012-06-15 10:36:11', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2084629', '2012-06-15 10:36:11', '2', '', '34931.868551674925', '15777.385020155805', '90', '2012-06-15 10:36:11', 'cck');
INSERT INTO `t_gps_data` VALUES ('2084630', '2012-06-15 10:36:11', '0', '', '32946.40743266759', '19153.34551635532', '93', '2012-06-15 10:36:11', 'clm');
INSERT INTO `t_gps_data` VALUES ('2084631', '2012-06-15 10:36:11', '1', '', '38257.70922445877', '32094.248104554707', '28', '2012-06-15 10:36:11', 'hou');
INSERT INTO `t_gps_data` VALUES ('2084632', '2012-06-15 10:36:11', '2', '', '32559.447047547106', '33032.35729557851', '41', '2012-06-15 10:36:11', 'jur');
INSERT INTO `t_gps_data` VALUES ('2084633', '2012-06-15 10:36:11', '0', '', '37450.58700030128', '37688.53360116724', '46', '2012-06-15 10:36:11', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2084634', '2012-06-15 10:36:21', '3', '', '30215.881229961156', '36089.70701463841', '87', '2012-06-15 10:36:21', '2');
INSERT INTO `t_gps_data` VALUES ('2084635', '2012-06-15 10:36:21', '2', '', '41991.50192493478', '31817.169136352855', '84', '2012-06-15 10:36:21', '1');
INSERT INTO `t_gps_data` VALUES ('2084636', '2012-06-15 10:36:21', '0', '', '42757.97881301197', '37751.8594478631', '17', '2012-06-15 10:36:21', '4');
INSERT INTO `t_gps_data` VALUES ('2084637', '2012-06-15 10:36:21', '0', '', '35929.92748827113', '29868.217826133947', '4', '2012-06-15 10:36:21', '3');
INSERT INTO `t_gps_data` VALUES ('2084638', '2012-06-15 10:36:21', '1', '', '35892.07704436048', '24132.144532058603', '50', '2012-06-15 10:36:21', '5');
INSERT INTO `t_gps_data` VALUES ('2084639', '2012-06-15 10:36:21', '0', '', '37565.680747696315', '18376.933778819955', '56', '2012-06-15 10:36:21', '6');
INSERT INTO `t_gps_data` VALUES ('2084640', '2012-06-15 10:36:21', '3', '', '43996.3143607488', '38273.25883602091', '5', '2012-06-15 10:36:21', '001190251');
INSERT INTO `t_gps_data` VALUES ('2084641', '2012-06-15 10:36:21', '3', '', '37076.751322767515', '15482.727804070399', '79', '2012-06-15 10:36:21', '001014182');
INSERT INTO `t_gps_data` VALUES ('2084642', '2012-06-15 10:36:21', '0', '', '33547.35953010941', '18064.936243123015', '74', '2012-06-15 10:36:21', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2084643', '2012-06-15 10:36:21', '0', '', '31346.739698227848', '14318.42645325974', '29', '2012-06-15 10:36:21', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2084644', '2012-06-15 10:36:21', '0', '', '39523.16279425758', '25479.546709573253', '90', '2012-06-15 10:36:21', '001001003');
INSERT INTO `t_gps_data` VALUES ('2084645', '2012-06-15 10:36:21', '2', '', '37411.110670433736', '32977.87022737436', '39', '2012-06-15 10:36:21', '001067110');
INSERT INTO `t_gps_data` VALUES ('2084646', '2012-06-15 10:36:21', '3', '', '40560.391934039224', '28731.766217859255', '75', '2012-06-15 10:36:21', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2084647', '2012-06-15 10:36:21', '0', '', '35846.77320388514', '30672.674806597253', '64', '2012-06-15 10:36:21', 'amk');
INSERT INTO `t_gps_data` VALUES ('2084648', '2012-06-15 10:36:21', '3', '', '31364.610155381124', '35202.63953444014', '69', '2012-06-15 10:36:21', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2084649', '2012-06-15 10:36:21', '2', '', '34994.50562959004', '15792.155464685657', '90', '2012-06-15 10:36:21', 'cck');
INSERT INTO `t_gps_data` VALUES ('2084650', '2012-06-15 10:36:21', '0', '', '32916.41979116493', '19108.028185816944', '93', '2012-06-15 10:36:21', 'clm');
INSERT INTO `t_gps_data` VALUES ('2084651', '2012-06-15 10:36:21', '1', '', '38287.31570884719', '32142.891706776227', '28', '2012-06-15 10:36:21', 'hou');
INSERT INTO `t_gps_data` VALUES ('2084652', '2012-06-15 10:36:21', '2', '', '32604.91378927921', '33052.71043543945', '41', '2012-06-15 10:36:21', 'jur');
INSERT INTO `t_gps_data` VALUES ('2084653', '2012-06-15 10:36:21', '0', '', '37434.674776121', '37634.46803978057', '46', '2012-06-15 10:36:21', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2084654', '2012-06-15 10:36:31', '3', '', '30165.91114426202', '36073.94212418404', '87', '2012-06-15 10:36:31', '2');
INSERT INTO `t_gps_data` VALUES ('2084655', '2012-06-15 10:36:31', '2', '', '42049.31333208079', '31845.30928625933', '84', '2012-06-15 10:36:31', '1');
INSERT INTO `t_gps_data` VALUES ('2084656', '2012-06-15 10:36:31', '0', '', '42753.29449385586', '37679.03006519751', '17', '2012-06-15 10:36:31', '4');
INSERT INTO `t_gps_data` VALUES ('2084657', '2012-06-15 10:36:31', '0', '', '35922.69197785204', '29833.40718090445', '4', '2012-06-15 10:36:31', '3');
INSERT INTO `t_gps_data` VALUES ('2084658', '2012-06-15 10:36:31', '1', '', '35906.042947356815', '24215.956266277026', '50', '2012-06-15 10:36:31', '5');
INSERT INTO `t_gps_data` VALUES ('2084659', '2012-06-15 10:36:31', '0', '', '37564.00888183827', '18324.956014553885', '56', '2012-06-15 10:36:31', '6');
INSERT INTO `t_gps_data` VALUES ('2084660', '2012-06-15 10:36:31', '3', '', '43962.18626305281', '38273.16605730689', '5', '2012-06-15 10:36:31', '001190251');
INSERT INTO `t_gps_data` VALUES ('2084661', '2012-06-15 10:36:31', '3', '', '37028.15934712931', '15471.815612545704', '79', '2012-06-15 10:36:31', '001014182');
INSERT INTO `t_gps_data` VALUES ('2084662', '2012-06-15 10:36:31', '0', '', '33532.141575224865', '17989.207898861354', '74', '2012-06-15 10:36:31', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2084663', '2012-06-15 10:36:31', '0', '', '31316.869344079718', '14238.199406406107', '29', '2012-06-15 10:36:31', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2084664', '2012-06-15 10:36:31', '0', '', '39512.50453797505', '25410.451103089898', '90', '2012-06-15 10:36:31', '001001003');
INSERT INTO `t_gps_data` VALUES ('2084665', '2012-06-15 10:36:31', '2', '', '37457.4127410983', '32979.138454309985', '39', '2012-06-15 10:36:31', '001067110');
INSERT INTO `t_gps_data` VALUES ('2084666', '2012-06-15 10:36:31', '3', '', '40517.08842558749', '28713.62294852407', '75', '2012-06-15 10:36:31', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2084667', '2012-06-15 10:36:31', '0', '', '35834.48700551389', '30612.111599780692', '64', '2012-06-15 10:36:31', 'amk');
INSERT INTO `t_gps_data` VALUES ('2084668', '2012-06-15 10:36:31', '3', '', '31318.3689447479', '35202.201771235974', '69', '2012-06-15 10:36:31', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2084669', '2012-06-15 10:36:31', '2', '', '35079.13153043809', '15794.149542132522', '90', '2012-06-15 10:36:31', 'cck');
INSERT INTO `t_gps_data` VALUES ('2084670', '2012-06-15 10:36:31', '0', '', '32889.296904614486', '19046.450526522698', '93', '2012-06-15 10:36:31', 'clm');
INSERT INTO `t_gps_data` VALUES ('2084671', '2012-06-15 10:36:31', '1', '', '38291.6329228682', '32220.023373716544', '28', '2012-06-15 10:36:31', 'hou');
INSERT INTO `t_gps_data` VALUES ('2084672', '2012-06-15 10:36:31', '2', '', '32692.717716319326', '33067.74482615401', '41', '2012-06-15 10:36:31', 'jur');
INSERT INTO `t_gps_data` VALUES ('2084673', '2012-06-15 10:36:31', '0', '', '37424.16485830326', '37586.15312134378', '46', '2012-06-15 10:36:31', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2084674', '2012-06-15 10:36:41', '3', '', '30114.379378592126', '36072.890314414', '87', '2012-06-15 10:36:41', '2');
INSERT INTO `t_gps_data` VALUES ('2084675', '2012-06-15 10:36:41', '2', '', '42147.960439677314', '31872.428157728256', '84', '2012-06-15 10:36:41', '1');
INSERT INTO `t_gps_data` VALUES ('2084676', '2012-06-15 10:36:41', '0', '', '42728.635877560955', '37633.40115238798', '17', '2012-06-15 10:36:41', '4');
INSERT INTO `t_gps_data` VALUES ('2084677', '2012-06-15 10:36:41', '0', '', '35907.4057246831', '29787.782487743396', '4', '2012-06-15 10:36:41', '3');
INSERT INTO `t_gps_data` VALUES ('2084678', '2012-06-15 10:36:41', '1', '', '35923.82578693687', '24254.867809722673', '50', '2012-06-15 10:36:41', '5');
INSERT INTO `t_gps_data` VALUES ('2084679', '2012-06-15 10:36:41', '0', '', '37546.347320525965', '18229.85306804304', '56', '2012-06-15 10:36:41', '6');
INSERT INTO `t_gps_data` VALUES ('2084680', '2012-06-15 10:36:41', '3', '', '43881.42098974583', '38260.30256647038', '5', '2012-06-15 10:36:41', '001190251');
INSERT INTO `t_gps_data` VALUES ('2084681', '2012-06-15 10:36:41', '3', '', '36958.22849778244', '15456.33780544659', '79', '2012-06-15 10:36:41', '001014182');
INSERT INTO `t_gps_data` VALUES ('2084682', '2012-06-15 10:36:41', '0', '', '33525.20601914256', '17895.409497260254', '74', '2012-06-15 10:36:41', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2084683', '2012-06-15 10:36:41', '0', '', '31289.96983169793', '14154.354393864793', '29', '2012-06-15 10:36:41', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2084684', '2012-06-15 10:36:41', '0', '', '39488.019903797525', '25322.55686558482', '90', '2012-06-15 10:36:41', '001001003');
INSERT INTO `t_gps_data` VALUES ('2084685', '2012-06-15 10:36:41', '2', '', '37500.348082934004', '32999.49108308593', '39', '2012-06-15 10:36:41', '001067110');
INSERT INTO `t_gps_data` VALUES ('2084686', '2012-06-15 10:36:41', '3', '', '40473.37886811653', '28709.573869511663', '75', '2012-06-15 10:36:41', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2084687', '2012-06-15 10:36:41', '0', '', '35826.34317434533', '30523.256539647522', '64', '2012-06-15 10:36:41', 'amk');
INSERT INTO `t_gps_data` VALUES ('2084688', '2012-06-15 10:36:41', '3', '', '31247.028515659385', '35184.162049342136', '69', '2012-06-15 10:36:41', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2084689', '2012-06-15 10:36:41', '2', '', '35169.997646433374', '15820.64567741059', '90', '2012-06-15 10:36:41', 'cck');
INSERT INTO `t_gps_data` VALUES ('2084690', '2012-06-15 10:36:41', '0', '', '32862.779950626405', '19014.319151065924', '93', '2012-06-15 10:36:41', 'clm');
INSERT INTO `t_gps_data` VALUES ('2084691', '2012-06-15 10:36:41', '1', '', '38313.05840228804', '32290.70527523475', '28', '2012-06-15 10:36:41', 'hou');
INSERT INTO `t_gps_data` VALUES ('2084692', '2012-06-15 10:36:41', '2', '', '32759.32993925388', '33087.11997991547', '41', '2012-06-15 10:36:41', 'jur');
INSERT INTO `t_gps_data` VALUES ('2084693', '2012-06-15 10:36:41', '0', '', '37410.55138231748', '37495.7376653528', '46', '2012-06-15 10:36:41', 'tpy');
INSERT INTO `t_gps_data` VALUES ('2084694', '2012-06-15 10:36:51', '3', '', '30063.354797239706', '36048.91695893133', '87', '2012-06-15 10:36:51', '2');
INSERT INTO `t_gps_data` VALUES ('2084695', '2012-06-15 10:36:51', '2', '', '42193.24930987582', '31885.862022496978', '84', '2012-06-15 10:36:51', '1');
INSERT INTO `t_gps_data` VALUES ('2084696', '2012-06-15 10:36:51', '0', '', '42716.42468502236', '37572.362604578404', '17', '2012-06-15 10:36:51', '4');
INSERT INTO `t_gps_data` VALUES ('2084697', '2012-06-15 10:36:51', '0', '', '35897.692615789514', '29703.902427693527', '4', '2012-06-15 10:36:51', '3');
INSERT INTO `t_gps_data` VALUES ('2084698', '2012-06-15 10:36:51', '1', '', '35931.08456839422', '24338.499910193925', '50', '2012-06-15 10:36:51', '5');
INSERT INTO `t_gps_data` VALUES ('2084699', '2012-06-15 10:36:51', '0', '', '37534.10344785694', '18161.10797507507', '56', '2012-06-15 10:36:51', '6');
INSERT INTO `t_gps_data` VALUES ('2084700', '2012-06-15 10:36:51', '3', '', '43816.22890904779', '38255.430898637875', '5', '2012-06-15 10:36:51', '001190251');
INSERT INTO `t_gps_data` VALUES ('2084701', '2012-06-15 10:36:51', '3', '', '36872.401131829436', '15440.887767488763', '79', '2012-06-15 10:36:51', '001014182');
INSERT INTO `t_gps_data` VALUES ('2084702', '2012-06-15 10:36:51', '0', '', '33516.616423049265', '17835.89126780177', '74', '2012-06-15 10:36:51', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('2084703', '2012-06-15 10:36:51', '0', '', '31281.49478358519', '14082.253853855977', '29', '2012-06-15 10:36:51', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('2084704', '2012-06-15 10:36:51', '0', '', '39475.420200844055', '25237.841360189122', '90', '2012-06-15 10:36:51', '001001003');
INSERT INTO `t_gps_data` VALUES ('2084705', '2012-06-15 10:36:51', '2', '', '37576.33864213392', '33016.37287304105', '39', '2012-06-15 10:36:51', '001067110');
INSERT INTO `t_gps_data` VALUES ('2084706', '2012-06-15 10:36:51', '3', '', '40407.18743108401', '28698.112726868247', '75', '2012-06-15 10:36:51', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('2084707', '2012-06-15 10:36:51', '0', '', '35799.66757109356', '30454.238264143456', '64', '2012-06-15 10:36:51', 'amk');
INSERT INTO `t_gps_data` VALUES ('2084708', '2012-06-15 10:36:51', '3', '', '31187.57188232059', '35172.18122940022', '69', '2012-06-15 10:36:51', 'bbk');
INSERT INTO `t_gps_data` VALUES ('2084709', '2012-06-15 10:36:51', '2', '', '35245.84297325725', '15837.792774449377', '90', '2012-06-15 10:36:51', 'cck');
INSERT INTO `t_gps_data` VALUES ('2084710', '2012-06-15 10:36:51', '0', '', '32848.96241456054', '18949.54669109146', '93', '2012-06-15 10:36:51', 'clm');
INSERT INTO `t_gps_data` VALUES ('2084711', '2012-06-15 10:36:51', '1', '', '38337.86036891293', '32345.533240452092', '28', '2012-06-15 10:36:51', 'hou');
INSERT INTO `t_gps_data` VALUES ('2084712', '2012-06-15 10:36:51', '2', '', '32801.03660245539', '33106.23883361041', '41', '2012-06-15 10:36:51', 'jur');
INSERT INTO `t_gps_data` VALUES ('2084713', '2012-06-15 10:36:51', '0', '', '37386.53790789935', '37452.209254413654', '46', '2012-06-15 10:36:51', 'tpy');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_systemconfig
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'weiwei', 'weiwei', 'admin');

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
INSERT INTO `t_vehicle` VALUES ('7', '12.122.45.123', 'vehicle06', 'GZ00002', 'car', '19', '3', 'vehicle06');
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
