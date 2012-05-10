/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50511
Source Host           : localhost:3306
Source Database       : vms_db

Target Server Type    : MYSQL
Target Server Version : 50511
File Encoding         : 65001

Date: 2012-05-09 10:43:11
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
  PRIMARY KEY (`id`),
  KEY `FKF4A9456A4F961CDE` (`driver_id`),
  KEY `FKF4A9456A4004E7A1` (`users_id`),
  CONSTRAINT `FKF4A9456A4004E7A1` FOREIGN KEY (`users_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FKF4A9456A4F961CDE` FOREIGN KEY (`driver_id`) REFERENCES `t_driver` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_counsel
-- ----------------------------

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
INSERT INTO `t_device` VALUES ('8', '', '', '203.117.251.162', '1', '{\"port\":2000,\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\"}', 'Planet-TPY', 'http://www.baidu.com', 'offline');
INSERT INTO `t_device` VALUES ('11', '', '\0', '203.117.250.66', '3', '{\"port\":2000,\"record_server\":\"http://203.116.12.44:50000\",\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\"}', 'Star5-Jp1', 'http://www.baidu.com', 'online');
INSERT INTO `t_device` VALUES ('12', '', '', '203.117.251.156', '4', '{\"port\":2000,\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\"}', 'Star5-Jp2', 'http://www.baidu.com', 'offline');
INSERT INTO `t_device` VALUES ('18', '', '\0', '203.117.250.134', '5', '{\"port\":2000,\"login\":\"\",\"password\":\"\",\"internal_host\":\"\",\"address\":\"\",\"cloud_recording_server\":\"\"}', 'Star5-Compass', 'http://www.baidu.com', 'online');
INSERT INTO `t_device` VALUES ('19', '', '', '203.117.40.133', '6', '{\"port\":80,\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\"}', 'SHPlazaSingapura', 'http://www.baidu.com', 'offline');
INSERT INTO `t_device` VALUES ('31', null, '\0', '203.117.250.66', '001190251', '{\"password\":\"7473\",\"supportedtasktypes\":[\"live-image\",\"ptz-panleft\",\"ptz-panright\",\"ptz-tiltup\",\"ptz-tiltdown\",\"ptz-movehome\"],\"port\":0,\"record_server\":\"\",\"internal_host\":\"\",\"address\":\"33 Ubi Avenue 3\",\"login\":\"\",\"record_flag\":false,\"cloud_recording_server\":\"\"}', 'Office Juzz4Lite camera', 'http://www.baidu.com', 'offline');
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
INSERT INTO `t_device` VALUES ('99', null, '\0', '203.117.250.134', 'yis', '{\"port\":0,\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\"}', 'NHG Yishun Polyclinic', null, 'offline');
INSERT INTO `t_device` VALUES ('116', null, '\0', '203.117.250.134', '001080121', '{\"record_flag\":false,\"password\":\"1234\",\"address\":\"\",\"port\":111,\"record_server\":\"\",\"internal_host\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\"}', '001080121', null, 'offline');
INSERT INTO `t_device` VALUES ('117', null, '', '203.117.250.134', '001015205', '{\"record_flag\":true,\"password\":\"1234\",\"address\":\"\",\"port\":0,\"record_server\":\"\",\"internal_host\":\"3123\",\"login\":\"13\",\"cloud_recording_server\":\"\"}', '001015205', null, 'offline');
INSERT INTO `t_device` VALUES ('126', null, '\0', '203.117.250.134', '001067116', '{\"record_server\":\"\",\"record_flag\":false,\"internal_host\":\"\",\"password\":\"ipcam\",\"address\":\"\",\"login\":\"001067116\",\"port\":0,\"cloud_recording_server\":\"\"}', 'Thailand Juzz4Lite demo camera', null, 'offline');
INSERT INTO `t_device` VALUES ('136', null, '', '203.117.250.134', '4799', '{\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\",\"port\":0}', 'Sentosa: View from Sentosa Gateway (Towards Sentosa)', null, 'offline');
INSERT INTO `t_device` VALUES ('137', null, '\0', '203.117.250.134', '1003', '{\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\",\"port\":0}', 'KPE: View from KPE/PIE', null, 'offline');
INSERT INTO `t_device` VALUES ('138', null, '', '203.117.250.134', '4706', '{\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\",\"port\":0}', 'AYE: Near NUS (Towards Tuas)', null, 'offline');
INSERT INTO `t_device` VALUES ('139', null, '', '203.117.250.134', '1702', '{\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\",\"port\":0}', 'CTE: Braddell Flyover (Towards SLE) ', null, 'offline');
INSERT INTO `t_device` VALUES ('140', null, '\0', '203.117.250.134', '5799', '{\"internal_host\":\"\",\"password\":\"\",\"address\":\"\",\"login\":\"\",\"cloud_recording_server\":\"\",\"port\":0}', 'PIE: Woodsville Flyover (Towards Changi)', null, 'offline');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_driver
-- ----------------------------
INSERT INTO `t_driver` VALUES ('1', 'TEST', '杰克', '74689');
INSERT INTO `t_driver` VALUES ('2', '222asdfasfdsf', '唐僧', '74652');
INSERT INTO `t_driver` VALUES ('3', '', '猪老二', '74631');
INSERT INTO `t_driver` VALUES ('4', 'jlk;jhkluy', '晓白', '74571');
INSERT INTO `t_driver` VALUES ('8', 'asdf', '小黑', '74538');
INSERT INTO `t_driver` VALUES ('9', 'sadf', '小鸡', '74498');
INSERT INTO `t_driver` VALUES ('10', 'sf', '小猪', '74484');
INSERT INTO `t_driver` VALUES ('11', 'sdf', '大黑', '74483');
INSERT INTO `t_driver` VALUES ('12', 'sdfs', '大哥', '74482');
INSERT INTO `t_driver` VALUES ('13', 'dfsdfs', '李小龙', '74423');
INSERT INTO `t_driver` VALUES ('14', 'dfs', '龙五', '74353');
INSERT INTO `t_driver` VALUES ('15', 'df', '张含韵', '74291');
INSERT INTO `t_driver` VALUES ('16', 'xv', '成龙', '74279');
INSERT INTO `t_driver` VALUES ('17', 'xvx', '世军', '74270');
INSERT INTO `t_driver` VALUES ('18', 'xvxv', '小迪', '74228');
INSERT INTO `t_driver` VALUES ('19', 'xvxv', '张天寒', '74215');
INSERT INTO `t_driver` VALUES ('20', 'xvxvx', '龙海天', '74106');
INSERT INTO `t_driver` VALUES ('21', 'xcvsdf', '猢狲放', '74078');
INSERT INTO `t_driver` VALUES ('22', 'xvxv', '孟浩然', '73870');
INSERT INTO `t_driver` VALUES ('23', 'sdf', '李靖', '73859');
INSERT INTO `t_driver` VALUES ('24', 'hdfh', '李宁', '73662');

-- ----------------------------
-- Table structure for `t_event`
-- ----------------------------
DROP TABLE IF EXISTS `t_event`;
CREATE TABLE `t_event` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_high_way` bit(1) DEFAULT NULL,
  `is_near_bus_stop` bit(1) DEFAULT NULL,
  `is_processed` bit(1) DEFAULT NULL,
  `driver_id` bigint(20) DEFAULT NULL,
  `event_record_id` bigint(20) DEFAULT NULL,
  `service_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA035AF0F4F961CDE` (`driver_id`),
  KEY `FKA035AF0FC5D3364B` (`event_record_id`),
  CONSTRAINT `FKA035AF0F4F961CDE` FOREIGN KEY (`driver_id`) REFERENCES `t_driver` (`id`),
  CONSTRAINT `FKA035AF0FC5D3364B` FOREIGN KEY (`event_record_id`) REFERENCES `t_event_record` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_event
-- ----------------------------
INSERT INTO `t_event` VALUES ('1', '', '', '\0', '1', '5', 'route01');
INSERT INTO `t_event` VALUES ('2', '\0', '', '', '2', '2', 'route02');
INSERT INTO `t_event` VALUES ('3', '', '', '', '4', '6', 'route03');
INSERT INTO `t_event` VALUES ('4', '', '\0', '', '8', '3', 'route01');
INSERT INTO `t_event` VALUES ('5', '', '', '', '9', '4', 'route02');
INSERT INTO `t_event` VALUES ('6', '\0', '\0', '\0', '10', '7', 'route03');
INSERT INTO `t_event` VALUES ('7', '', '', '', '11', '8', 'route03');
INSERT INTO `t_event` VALUES ('8', '', '', '', '12', '9', 'route04');

-- ----------------------------
-- Table structure for `t_event_record`
-- ----------------------------
DROP TABLE IF EXISTS `t_event_record`;
CREATE TABLE `t_event_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `detail` varchar(255) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `event_time` datetime DEFAULT NULL,
  `g_value` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `road` varchar(255) DEFAULT NULL,
  `speed` int(11) NOT NULL,
  `event_type_tech_name` varchar(255) DEFAULT NULL,
  `device_key` varchar(255) DEFAULT NULL,
  `event_record_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK17BF7B81F8A19664` (`event_type_tech_name`),
  KEY `device_key` (`device_key`),
  KEY `FK17BF7B81C5D3364B` (`event_record_id`),
  CONSTRAINT `FK17BF7B81C5D3364B` FOREIGN KEY (`event_record_id`) REFERENCES `t_event_record` (`id`),
  CONSTRAINT `FK17BF7B81F8A19664` FOREIGN KEY (`event_type_tech_name`) REFERENCES `t_event_type` (`tech_name`),
  CONSTRAINT `t_event_record_ibfk_1` FOREIGN KEY (`device_key`) REFERENCES `t_device` (`device_key`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_event_record
-- ----------------------------
INSERT INTO `t_event_record` VALUES ('2', 'asdf', '1', '2012-01-29 17:13:57', '3123', '123123', '123123', 'asdf', '12', 'event-sudden-acceleration', '2', null);
INSERT INTO `t_event_record` VALUES ('3', 'xxxxx', '3', '2012-03-05 18:29:00', '341', '2312312', '54353', 'sssdd', '150', 'event-speeding', '1', null);
INSERT INTO `t_event_record` VALUES ('4', 'xxfdds', '5', '2012-03-20 18:59:59', '1122', '543234123', '34532342', 'xcbcsdaa', '200', 'event-speeding', '1', null);
INSERT INTO `t_event_record` VALUES ('5', 'sfasfsf', '12', '2012-05-22 19:00:35', '3123', '23534', '634534', 'xxsdfsadf', '120', 'event-sudden-braking', '2', null);
INSERT INTO `t_event_record` VALUES ('6', 'xvxv', '23', '2012-05-08 20:01:12', '123', '345345', '535345', 'hfghfghfdh', '125', 'event-speeding', '2', null);
INSERT INTO `t_event_record` VALUES ('7', 'fffeee', '3', '2012-06-08 17:54:33', '42342', '121434', '435623', 'aaaaaa', '34', 'event-sudden-right', '3', null);
INSERT INTO `t_event_record` VALUES ('8', 'sdafsf', '2', '2012-05-30 17:57:33', '3423', '23423', '234234', 'gsdfg', '55', 'event-idle', '4', null);
INSERT INTO `t_event_record` VALUES ('9', 'zzzzxxxx', '55', '2012-05-28 18:03:05', '654', '345345', '34534534', 'dddddd', '45', 'event-sudden-left', '001001003', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=8193 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_event_type
-- ----------------------------
INSERT INTO `t_event_type` VALUES ('1', 'Alarm', 'event-alarm');
INSERT INTO `t_event_type` VALUES ('2', 'Motion', 'event-motion');
INSERT INTO `t_event_type` VALUES ('3', 'Video loss', 'event-video-loss');
INSERT INTO `t_event_type` VALUES ('4', 'Connection lost', 'event-connection-lost');
INSERT INTO `t_event_type` VALUES ('5', 'Connected', 'event-connected');
INSERT INTO `t_event_type` VALUES ('512', 'Digital input', 'event-input');
INSERT INTO `t_event_type` VALUES ('513', 'Digital output', 'event-output');
INSERT INTO `t_event_type` VALUES ('1024', 'Idle', 'event-idle');
INSERT INTO `t_event_type` VALUES ('1025', 'Speeding', 'event-speeding');
INSERT INTO `t_event_type` VALUES ('2048', 'Sudden acceleration', 'event-sudden-acceleration');
INSERT INTO `t_event_type` VALUES ('2049', 'Sudden braking', 'event-sudden-braking');
INSERT INTO `t_event_type` VALUES ('2050', 'Sudden left', 'event-sudden-left');
INSERT INTO `t_event_type` VALUES ('2051', 'Sudden right', 'event-sudden-right');
INSERT INTO `t_event_type` VALUES ('2052', 'Sudden up', 'event-sudden-up');
INSERT INTO `t_event_type` VALUES ('2053', 'Sudden down', 'event-sudden-down');
INSERT INTO `t_event_type` VALUES ('4096', 'Entering geofence', 'event-geofence-enter');
INSERT INTO `t_event_type` VALUES ('4097', 'Exiting geofence', 'event-geofence-exit');
INSERT INTO `t_event_type` VALUES ('8192', 'Count', 'event-count');

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
INSERT INTO `t_fleet` VALUES ('1', '这是深圳市宝安区的车队', '宝安区车队', '21045', null);
INSERT INTO `t_fleet` VALUES ('2', '这是深圳市福田区的车队', '福田区车队', '54681', null);
INSERT INTO `t_fleet` VALUES ('3', '这是深圳市宝安区天悦龙庭分队', '天悦龙庭分队', '21014', '1');
INSERT INTO `t_fleet` VALUES ('4', '这是深圳市福田区岗厦小分队', '岗厦分队', '54601', '2');
INSERT INTO `t_fleet` VALUES ('5', '这是广州市车队', '广州车队', '12014', null);
INSERT INTO `t_fleet` VALUES ('6', '这是广州市花都车队', '花都车队', '12458', '5');
INSERT INTO `t_fleet` VALUES ('7', '这是福建车队', '福建车队', '32145', null);
INSERT INTO `t_fleet` VALUES ('8', '这是西安车队', '西安车队', '87452', null);
INSERT INTO `t_fleet` VALUES ('9', '这是北京车队', '北京车队', '65487', null);
INSERT INTO `t_fleet` VALUES ('10', '这是杭州车队', '杭州车队', '45712', null);
INSERT INTO `t_fleet` VALUES ('11', '这是杭州西湖车队', '西湖车队', '45732', '10');

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
  UNIQUE KEY `device_key` (`device_key`),
  CONSTRAINT `t_gps_data_ibfk_1` FOREIGN KEY (`device_key`) REFERENCES `t_device` (`device_key`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_gps_data
-- ----------------------------
INSERT INTO `t_gps_data` VALUES ('2', '2012-05-21 18:13:16', '0', '', '32255.02633334452', '19621.54623058727', '0', '2012-05-05 18:13:43', '2');
INSERT INTO `t_gps_data` VALUES ('3', '2012-05-29 18:13:49', '0', '', '34335.05990134846', '11791.630077000329', '0', '2012-05-05 18:14:14', '1');
INSERT INTO `t_gps_data` VALUES ('4', '2012-05-31 18:14:41', '1', '', '29103.997955436043', '30491.43855029164', '0', '2012-05-05 18:14:46', '3');
INSERT INTO `t_gps_data` VALUES ('5', '2012-05-31 18:14:56', '2', '', '29023.92910103239', '29795.223290425536', '0', '2012-05-05 18:15:36', '4');
INSERT INTO `t_gps_data` VALUES ('6', '2012-05-09 18:15:42', '3', '', '34326.98701124093', '33399.50823299224', '0', '2012-05-05 18:16:06', '5');
INSERT INTO `t_gps_data` VALUES ('7', '2012-05-22 18:16:16', '1', '', '32275.86079115839', '15826.84926458007', '0', '2012-05-05 18:16:45', '6');
INSERT INTO `t_gps_data` VALUES ('14', '2012-05-22 21:01:51', '1', '', '38182.94029196476', '10362.993039289997', '4', '2012-05-22 21:02:03', '001190251');
INSERT INTO `t_gps_data` VALUES ('15', '2012-05-23 21:03:11', '2', '', '30157.030248655934', '30062.028758860608', '1', '2012-05-23 21:03:02', '001014182');
INSERT INTO `t_gps_data` VALUES ('16', '2012-05-24 21:03:16', '1', '', '30064.52288440419', '31066.75143105303', '2', '2012-05-24 21:03:41', 'B5143913');
INSERT INTO `t_gps_data` VALUES ('17', '2012-05-25 21:03:20', '1', '', '32838.974413581454', '29191.01194041832', '3', '2012-05-25 21:03:45', 'B5155298');
INSERT INTO `t_gps_data` VALUES ('18', '2012-05-26 21:03:23', '0', '', '31656.375504605094', '12921.52432633214', '1', '2012-05-26 21:03:50', '001001003');
INSERT INTO `t_gps_data` VALUES ('19', '2012-05-27 21:03:26', '0', '', '30016.37496343437', '20208.790753623536', '2', '2012-05-27 21:03:54', '001067110');
INSERT INTO `t_gps_data` VALUES ('20', '2012-05-28 21:03:31', '3', '', '36102.84347778058', '34765.206346922685', '3', '2012-06-08 21:03:58', 'B5143706');
INSERT INTO `t_gps_data` VALUES ('21', '2012-05-05 22:58:23', '0', '', '36162.84347778058', '32765.206346922685', '69', '2012-05-05 22:58:59', 'amk');

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
  CONSTRAINT `t_schedule_ibfk_1` FOREIGN KEY (`vehicle_number`) REFERENCES `t_vehicle` (`number`) ON UPDATE CASCADE,
  CONSTRAINT `FK8D130602A06578C` FOREIGN KEY (`driver_number`) REFERENCES `t_driver` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_schedule
-- ----------------------------
INSERT INTO `t_schedule` VALUES ('6', '74689', 'vehicle01', '2012-05-05 05:56:07', '2012-05-05 14:56:37', 'route01', 'route01AM04');
INSERT INTO `t_schedule` VALUES ('7', '74652', 'vehicle02', '2012-05-09 05:56:49', '2012-05-09 15:57:07', 'route01', 'route01AM13');
INSERT INTO `t_schedule` VALUES ('8', '74631', 'vehicle03', '2012-05-01 20:57:28', '2012-05-02 20:57:35', 'route01', 'route01PM12');
INSERT INTO `t_schedule` VALUES ('9', '74571', 'vehicle01', '2012-04-30 20:57:39', '2012-05-15 20:57:43', 'route02', 'route02AM04');
INSERT INTO `t_schedule` VALUES ('10', '74538', 'vehicle01', '2012-05-02 20:57:47', '2012-05-03 20:57:50', 'route02', 'route02PM04');
INSERT INTO `t_schedule` VALUES ('11', '74498', 'vehicle02', '2012-05-09 20:57:53', '2012-05-09 22:57:57', 'route01', 'route01AM13');
INSERT INTO `t_schedule` VALUES ('12', '74484', 'vehicle02', '2012-05-17 14:58:05', '2012-05-17 20:58:12', 'route01', 'route01AM15');
INSERT INTO `t_schedule` VALUES ('13', '74483', 'vehicle01', '2012-05-14 14:58:19', '2012-05-14 20:58:23', 'route02', 'route02AM04');
INSERT INTO `t_schedule` VALUES ('14', '74482', 'vehicle04', '2012-05-02 15:58:27', '2012-05-02 16:58:32', 'route03', 'route03S104');
INSERT INTO `t_schedule` VALUES ('15', '74423', 'vehicle01', '2012-05-07 20:58:39', '2012-06-08 20:58:43', 'route03', 'route03S108');
INSERT INTO `t_schedule` VALUES ('16', '74353', 'vehicle02', '2012-04-30 20:58:51', '2012-05-01 20:58:55', 'route01', 'route01AM13');
INSERT INTO `t_schedule` VALUES ('17', '74291', 'vehicle03', '2012-04-29 20:58:58', '2012-04-30 20:59:01', 'route01', 'route01AM15');
INSERT INTO `t_schedule` VALUES ('18', '74279', 'vehicle03', '2012-04-30 20:59:05', '2012-05-22 20:59:09', 'route01', 'route01S203');
INSERT INTO `t_schedule` VALUES ('19', '74270', 'vehicle04', '2012-04-30 20:59:12', '2012-05-24 20:59:16', 'route04', 'route04AM09');
INSERT INTO `t_schedule` VALUES ('20', '74228', 'vehicle04', '2012-04-30 20:59:19', '2012-06-07 20:59:22', 'route02', 'route02S104');
INSERT INTO `t_schedule` VALUES ('21', '74215', 'vehicle01', '2012-04-29 20:59:26', '2012-06-09 20:59:29', 'route02', 'route02S201');
INSERT INTO `t_schedule` VALUES ('22', '74106', 'vehicle01', '2012-05-08 20:59:32', '2012-05-23 20:59:37', 'route02', 'route02S254');
INSERT INTO `t_schedule` VALUES ('23', '74078', 'vehicle04', '2012-05-01 20:59:40', '2012-05-31 20:59:44', 'route04', 'route04AM16');
INSERT INTO `t_schedule` VALUES ('24', '73870', 'vehicle04', '2012-05-17 20:59:48', '2012-05-30 20:59:51', 'route04', 'route04AM0');
INSERT INTO `t_schedule` VALUES ('25', '73859', 'vehicle02', '2012-05-25 20:59:54', '2012-06-08 20:59:57', 'route01', 'route01AM13');
INSERT INTO `t_schedule` VALUES ('26', '73662', 'vehicle05', '2012-06-01 21:00:00', '2012-06-09 21:00:03', 'route02', 'route02AM06');

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
  `license` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `device_id` bigint(20) DEFAULT NULL,
  `fleet_id` bigint(20) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `license` (`license`),
  UNIQUE KEY `number` (`number`),
  KEY `FKCFF58261116C3656` (`fleet_id`),
  KEY `FKCFF58261A1D5461E` (`device_id`),
  CONSTRAINT `FKCFF58261116C3656` FOREIGN KEY (`fleet_id`) REFERENCES `t_fleet` (`id`),
  CONSTRAINT `FKCFF58261A1D5461E` FOREIGN KEY (`device_id`) REFERENCES `t_device` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

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
