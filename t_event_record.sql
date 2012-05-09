/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50511
Source Host           : localhost:3306
Source Database       : vms_db

Target Server Type    : MYSQL
Target Server Version : 50511
File Encoding         : 65001

Date: 2012-05-09 17:00:07
*/

SET FOREIGN_KEY_CHECKS=0;
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
INSERT INTO `t_event_record` VALUES ('2', 'asdf', '1', '2012-01-29 17:13:57', '3123', '34335.05990134846', '11791.630077000329', 'asdf', '12', 'event-sudden-acceleration', '2', null);
INSERT INTO `t_event_record` VALUES ('3', 'xxxxx', '3', '2012-03-05 18:29:00', '341', '30157.030248655934', '30491.43855029164', 'sssdd', '150', 'event-speeding', '1', null);
INSERT INTO `t_event_record` VALUES ('4', 'xxfdds', '5', '2012-03-20 18:59:59', '1122', '34326.98701124093', '33399.50823299224', 'xcbcsdaa', '200', 'event-speeding', '1', null);
INSERT INTO `t_event_record` VALUES ('5', 'sfasfsf', '12', '2012-05-22 19:00:35', '3123', '36102.84347778058', '15826.84926458007', 'xxsdfsadf', '120', 'event-sudden-braking', '2', null);
INSERT INTO `t_event_record` VALUES ('6', 'xvxv', '23', '2012-05-08 20:01:12', '123', '30157.030248655934', '30491.43855029164', 'hfghfghfdh', '125', 'event-speeding', '2', null);
INSERT INTO `t_event_record` VALUES ('7', 'fffeee', '3', '2012-06-08 17:54:33', '42342', '30157.030248655934', '29191.01194041832', 'aaaaaa', '34', 'event-sudden-right', '3', null);
INSERT INTO `t_event_record` VALUES ('8', 'sdafsf', '2', '2012-05-30 17:57:33', '3423', '30491.43855029164', '30062.028758860608', 'gsdfg', '55', 'event-idle', '4', null);
INSERT INTO `t_event_record` VALUES ('9', 'zzzzxxxx', '55', '2012-05-28 18:03:05', '654', '36162.84347778058', '32765.206346922685', 'dddddd', '45', 'event-sudden-left', '001001003', null);
