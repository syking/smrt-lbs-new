-- phpMyAdmin SQL Dump
-- version 3.3.5
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2012 年 05 月 05 日 07:01
-- 服务器版本: 5.1.49
-- PHP 版本: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `juzz4v2`
--

-- --------------------------------------------------------

--
-- 表的结构 `t_driver`
--

CREATE TABLE IF NOT EXISTS `t_driver` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `no` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `t_driver`
--

INSERT INTO `t_driver` (`id`, `description`, `name`, `no`) VALUES
(1, 'aaaaaaaaaaaaaaa', 'one', 'D1'),
(2, '222asdfasfdsf', 'two', 'D2'),
(3, '', 'fgjhfgdh', 'dfghfgh'),
(4, 'jlk;jhkluy', 'iouiouy', 'lyuoluyl'),
(8, '', 'kaiadmin', 'xvxsvsx');
