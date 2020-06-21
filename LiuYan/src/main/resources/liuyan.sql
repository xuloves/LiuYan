/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.19 : Database - liuyan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`liuyan` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `liuyan`;

/*Table structure for table `msg` */

DROP TABLE IF EXISTS `msg`;

CREATE TABLE `msg` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender` varchar(20) NOT NULL,
  `receiver` varchar(20) NOT NULL,
  `title` varbinary(20) NOT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` datetime NOT NULL,
  `count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `msg` */

insert  into `msg`(`id`,`sender`,`receiver`,`title`,`content`,`date`,`count`) values 
(3,'Jack','Tom','下一站','雨天','2020-06-09 23:22:32',0),
(4,'Tom','Jack','雨天','下一站','2020-06-12 23:22:52',1),
(5,'June','Mark','曙光','希望','2020-06-11 23:23:17',0),
(6,'Mark','June','希望','曙光','2020-06-10 23:23:58',0),
(7,'Mark','June','世界','清晨','2020-06-10 09:00:24',0),
(20,'Jack','Tom','世界','你好','2020-06-11 21:07:36',0),
(23,'Jack','Tom','你是谁','你好','2020-06-15 20:00:31',2),
(24,'Jack','Joy','你好呀','Joy','2020-06-18 11:15:38',1);

/*Table structure for table `reply` */

DROP TABLE IF EXISTS `reply`;

CREATE TABLE `reply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mid` int NOT NULL,
  `commentator` varchar(20) NOT NULL,
  `date` datetime NOT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `msg` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `reply` */

insert  into `reply`(`id`,`mid`,`commentator`,`date`,`content`) values 
(10,23,'Jack','2020-06-18 11:15:02','我是Tom'),
(11,23,'Jack','2020-06-18 11:15:12','你是谁'),
(12,4,'Jack','2020-06-18 11:15:23','下一站'),
(13,24,'Jack','2020-06-18 11:15:45','我是Jack');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `privilege` tinyint NOT NULL DEFAULT '0' COMMENT '权限',
  `email` varchar(25) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`username`,`password`,`privilege`,`email`) values 
('admin','41522031d51bd9b5757ceff4e3b2e39e',1,'1845706088@qq.com'),
('Hello','41522031d51bd9b5757ceff4e3b2e39e',0,'1845706088@qq.com'),
('Jack','41522031d51bd9b5757ceff4e3b2e39e',1,'1845706088@qq.com'),
('Joy','41522031d51bd9b5757ceff4e3b2e39e',0,'1845706088@qq.com'),
('kangkang','41522031d51bd9b5757ceff4e3b2e39e',0,'1845706088@qq.com'),
('spring','41522031d51bd9b5757ceff4e3b2e39e',0,'1845706088@qq.com'),
('Tom','41522031d51bd9b5757ceff4e3b2e39e',0,'1845706088@qq.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
