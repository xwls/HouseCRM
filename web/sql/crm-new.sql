/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50629
Source Host           : localhost:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 50629
File Encoding         : 65001

Date: 2017-02-15 20:14:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for customer_care
-- ----------------------------
DROP TABLE IF EXISTS `customer_care`;
CREATE TABLE `customer_care` (
  `care_id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) DEFAULT NULL,
  `care_theme` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `care_way` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `care_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `care_remark` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `care_nexttime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `care_people` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_used` varchar(10) COLLATE utf8_unicode_ci DEFAULT '1',
  PRIMARY KEY (`care_id`),
  KEY `FK_Reference_15` (`customer_id`),
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customer_care
-- ----------------------------
INSERT INTO `customer_care` VALUES ('1', '1', '纪念日', '送礼品', '2013-05-23 23:12:29', '节日纪念', '2013-05-28 23:12:34', '孙悟空', '1');
INSERT INTO `customer_care` VALUES ('2', '2', '生日', '上门拜访', '2013-05-23 23:14:00', '过生日', '2013-06-12 23:14:15', '猪八戒', '1');
INSERT INTO `customer_care` VALUES ('5', '1', '是的的', '发短信', '2017-01-05 15:15:18', '是的撒', '2017-01-02 15:15:19', '张三', '1');
INSERT INTO `customer_care` VALUES ('6', '1', '改革 ', '发短信', '2017-01-05 15:15:28', '风格梵蒂冈反对梵蒂冈反对', '2017-01-15 15:15:32', '张三', '1');
INSERT INTO `customer_care` VALUES ('7', '1', '1', '发短信', '2017-01-05 15:15:50', ' 是的反倒是反倒是复方丹参', '2017-01-03 15:15:55', '张三', '1');
INSERT INTO `customer_care` VALUES ('8', '1', '1', '发短信', '2017-01-05 15:16:02', '的的说法但是反对', '2017-01-04 15:16:11', '猪八戒', '1');
INSERT INTO `customer_care` VALUES ('9', '1', '1', '发短信', '2017-01-05 15:16:18', '风格光伏发电股份规范化 ', '2017-01-02 15:16:25', '张三', '1');
INSERT INTO `customer_care` VALUES ('10', '1', '1', '发短信', '2017-01-05 15:17:08', '但是的房 ', '2017-01-16 15:17:11', '张三', '1');

-- ----------------------------
-- Table structure for customer_condition
-- ----------------------------
DROP TABLE IF EXISTS `customer_condition`;
CREATE TABLE `customer_condition` (
  `condition_id` int(10) NOT NULL AUTO_INCREMENT,
  `condition_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `condition_explain` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_used` varchar(10) COLLATE utf8_unicode_ci DEFAULT '1',
  PRIMARY KEY (`condition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customer_condition
-- ----------------------------
INSERT INTO `customer_condition` VALUES ('1', '潜在客户', '可能成为客户的人', '1');
INSERT INTO `customer_condition` VALUES ('2', '意向客户', '有意愿车成为客户的人', '1');
INSERT INTO `customer_condition` VALUES ('3', '交易客户', '正在交易的客户', '1');
INSERT INTO `customer_condition` VALUES ('4', '大声道撒', '大声地', '0');

-- ----------------------------
-- Table structure for customer_info
-- ----------------------------
DROP TABLE IF EXISTS `customer_info`;
CREATE TABLE `customer_info` (
  `customer_id` int(10) NOT NULL AUTO_INCREMENT,
  `condition_id` int(10) DEFAULT NULL,
  `source_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `type_id` int(10) DEFAULT NULL,
  `customer_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_sex` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_qq` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_remark` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_job` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_blog` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_tel` varbinary(20) DEFAULT NULL,
  `customer_msn` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth_day` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `customer_addtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `customer_addman` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_changtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `change_man` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_company` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_used` varchar(10) COLLATE utf8_unicode_ci DEFAULT '1',
  PRIMARY KEY (`customer_id`),
  KEY `FK_Reference_16` (`condition_id`),
  KEY `FK_Reference_17` (`source_id`),
  KEY `FK_Reference_18` (`type_id`),
  KEY `FK_Reference_23` (`user_id`),
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`condition_id`) REFERENCES `customer_condition` (`condition_id`),
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`source_id`) REFERENCES `customer_source` (`source_id`),
  CONSTRAINT `FK_Reference_18` FOREIGN KEY (`type_id`) REFERENCES `customer_type` (`type_id`),
  CONSTRAINT `FK_Reference_23` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customer_info
-- ----------------------------
INSERT INTO `customer_info` VALUES ('1', '2', '2', '1', '2', '李四', '男', '13725425426', '2334343', '重庆', '379727687@qq.com', '									你好\r\n		\r\n		\r\n		\r\n		\r\n		', '老板', '3434322', 0x3534353435343333, '23234465', '2013-05-01 15:40:52', '2013-05-08 22:30:40', '张三', '2013-05-25 09:25:43', '张三', '思科', '1');
INSERT INTO `customer_info` VALUES ('2', '1', '1', '3', '1', '吴天', '男', '13924452345', '23456', '重庆三峡', '379727687@qq.com', '																																																																																			反反复复\r\n		\r\n		\r\n						\r\n						\r\n						\r\n						\r\n						\r\n						\r\n						\r\n						\r\n						\r\n						\r\n						', '学生', '6576', 0x3835383538353834, '45454555', '2016-12-29 10:49:28', '2013-05-23 23:05:44', null, '2016-12-29 10:48:49', '二位', '天天', '0');
INSERT INTO `customer_info` VALUES ('3', '1', '1', '3', '1', '刘欢', '女', '13854545454', '23245', '重庆', '379727687@qq.com', '										如同仁堂\r\n		\r\n						', '学生', '6567', 0x3532343534373839, '53423134', '2016-12-28 14:00:00', '2013-05-23 23:08:52', '张三', '2016-12-28 13:59:54', '热热热', '微微', '1');
INSERT INTO `customer_info` VALUES ('4', '1', '1', '1', '1', '王五', '男', '13544455544', '454578', '重庆三峡学院', '379727687@qq.com', '																	法国风格\r\n		\r\n						\r\n						', '学生', '6565', 0x3235343738353437, '45444455', '2016-12-29 10:52:51', '2013-05-23 23:10:17', null, '2016-12-29 10:52:45', '恒河', '三峡学院', '1');
INSERT INTO `customer_info` VALUES ('7', '1', '1', null, '3', '黄晓军', '男', '15111866066', '909239200', '重庆云阳', '909239200@qq.com', '这个客户很水', '屌丝', 'guanzhuwo@blog.com', 0x3432323332333233, '2323232', '1992-09-10 16:21:00', '2013-05-25 16:20:38', '蒋大爷', '2013-05-25 16:20:38', '', '敏军网络科技有限公司', '1');
INSERT INTO `customer_info` VALUES ('8', '3', '2', null, '1', '温庆心', '男', '13652354533', '', '爱上对方', '123156@qq.com', '						\r\n		\r\n		', '', '', '', '', '1991-11-03 16:50:38', '2013-05-25 16:49:28', 'admin', '2013-05-25 16:52:07', '', '', '1');
INSERT INTO `customer_info` VALUES ('9', '1', '1', '4', '2', '刘老师', '男', '15111866066', '', '重庆丰都', '379727687@qq.com', '			\r\n		这是个好老师', '程序猿', '', 0x3538313035373839, '', '1987-05-13 20:02:29', '2013-05-25 20:00:42', '蒋元征', '2013-05-25 20:04:57', '蒋元征', '中软国际', '1');
INSERT INTO `customer_info` VALUES ('10', '2', '1', '1', '1', 'fdsa', '女', '15857241245', '1545613212', 'fds', '2531978662@qq.com', 'sadgasgdsa', 'fdsa', 'dsagfsa', 0x31323331353534, 'sdafas', '2017-01-17 19:16:49', '2017-01-05 19:16:36', 'fdsag', '2017-01-05 19:16:36', 'sdfas', 'gfdjh', '0');
INSERT INTO `customer_info` VALUES ('11', '1', '1', '1', '1', '风水大师的', '女', '13636445678', '', '', '1231@qq.com', '							\r\n						', '方式', '', '', '', '2017-01-06 15:28:42', '2017-01-06 15:27:31', null, '2017-01-06 15:28:27', '', '', '0');

-- ----------------------------
-- Table structure for customer_linkman
-- ----------------------------
DROP TABLE IF EXISTS `customer_linkman`;
CREATE TABLE `customer_linkman` (
  `linkman_id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) DEFAULT NULL,
  `linkman_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkman_sex` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkman_job` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkman_mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkman_age` int(10) DEFAULT NULL,
  `linkman_relation` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_used` varchar(10) COLLATE utf8_unicode_ci DEFAULT '1',
  PRIMARY KEY (`linkman_id`),
  KEY `FK_Reference_20` (`customer_id`),
  CONSTRAINT `FK_Reference_20` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customer_linkman
-- ----------------------------
INSERT INTO `customer_linkman` VALUES ('1', '2', '合格', '男', '老板', '35667', '34', '上下属', '1');
INSERT INTO `customer_linkman` VALUES ('2', '9', '小李', '女', '销售', '15824575145', '23', '暧昧', '0');

-- ----------------------------
-- Table structure for customer_linkreord
-- ----------------------------
DROP TABLE IF EXISTS `customer_linkreord`;
CREATE TABLE `customer_linkreord` (
  `record_id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) DEFAULT NULL,
  `link_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `who_link` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_theme` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_nexttime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_remark` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_used` varchar(10) COLLATE utf8_unicode_ci DEFAULT '1',
  PRIMARY KEY (`record_id`),
  KEY `FK_Reference_19` (`customer_id`),
  CONSTRAINT `FK_Reference_19` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customer_linkreord
-- ----------------------------
INSERT INTO `customer_linkreord` VALUES ('1', '1', '2013-05-23 23:15:11', '张三', '打电话', '过来买房', '2013-05-28 23:15:14', '很好', '1');
INSERT INTO `customer_linkreord` VALUES ('2', '4', '2017-01-06 17:08:58', 'hjoi', 'wqt', 'asgf', '2017-01-06 17:09:10', 'wqg', '1');

-- ----------------------------
-- Table structure for customer_source
-- ----------------------------
DROP TABLE IF EXISTS `customer_source`;
CREATE TABLE `customer_source` (
  `source_id` int(10) NOT NULL AUTO_INCREMENT,
  `source_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_used` varchar(10) COLLATE utf8_unicode_ci DEFAULT '1',
  PRIMARY KEY (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customer_source
-- ----------------------------
INSERT INTO `customer_source` VALUES ('1', '自己上门', '1');
INSERT INTO `customer_source` VALUES ('2', '朋友推荐', '1');
INSERT INTO `customer_source` VALUES ('3', '百度网', '1');

-- ----------------------------
-- Table structure for customer_type
-- ----------------------------
DROP TABLE IF EXISTS `customer_type`;
CREATE TABLE `customer_type` (
  `type_id` int(10) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_used` varchar(10) COLLATE utf8_unicode_ci DEFAULT '1',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customer_type
-- ----------------------------
INSERT INTO `customer_type` VALUES ('1', '客户', '1');
INSERT INTO `customer_type` VALUES ('2', '合作伙伴', '1');
INSERT INTO `customer_type` VALUES ('3', '供应商', '1');
INSERT INTO `customer_type` VALUES ('4', '合作伙伴', '1');

-- ----------------------------
-- Table structure for department_info
-- ----------------------------
DROP TABLE IF EXISTS `department_info`;
CREATE TABLE `department_info` (
  `department_id` int(10) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_desc` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_used` varchar(10) COLLATE utf8_unicode_ci DEFAULT '1',
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of department_info
-- ----------------------------
INSERT INTO `department_info` VALUES ('1', '财务部', '很有钱', '1');
INSERT INTO `department_info` VALUES ('3', '销售部', '搞销售的', '1');
INSERT INTO `department_info` VALUES ('4', '差点', '粉武器阿凡达人哇', '1');
INSERT INTO `department_info` VALUES ('5', '人事部', '管人的', '1');

-- ----------------------------
-- Table structure for email_info
-- ----------------------------
DROP TABLE IF EXISTS `email_info`;
CREATE TABLE `email_info` (
  `email_id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `email_content` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `email_state` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_theme` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_used` varchar(10) COLLATE utf8_unicode_ci DEFAULT '1',
  PRIMARY KEY (`email_id`),
  KEY `FK_Reference_14` (`user_id`),
  KEY `FK_Reference_21` (`customer_id`),
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`),
  CONSTRAINT `FK_Reference_21` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of email_info
-- ----------------------------
INSERT INTO `email_info` VALUES ('21', '4', '1', '第三代是的大多数都是', '2013-05-25 19:48:27', '1', '地地道道是', '1');
INSERT INTO `email_info` VALUES ('24', '2', '1', '刚刚', '2013-05-25 19:50:38', '1', '123', '1');
INSERT INTO `email_info` VALUES ('25', '9', '1', '祝你生日快乐！身体健康！', '2016-12-29 16:14:08', '1', '生日快乐', '1');
INSERT INTO `email_info` VALUES ('26', '4', '1', '11111111', '2016-12-29 17:10:55', '1', '11111111', '1');
INSERT INTO `email_info` VALUES ('27', '4', '1', '11111111', '2016-12-29 17:10:55', '1', '11111111', '0');
INSERT INTO `email_info` VALUES ('28', '4', '1', 'fcewafwf', '2016-12-30 15:57:53', '0', 'faesf', '1');
INSERT INTO `email_info` VALUES ('29', '3', '1', '大晚上大', '2017-01-04 09:51:12', '0', 'ad', '1');
INSERT INTO `email_info` VALUES ('30', '1', '1', '带我去多群', '2017-01-05 10:24:31', '0', '分吴福', '1');
INSERT INTO `email_info` VALUES ('31', '10', '13', 'dwqdq', '2017-01-06 14:57:10', '0', 'dwqad', '1');
INSERT INTO `email_info` VALUES ('32', '10', '13', 'dasdsa', '2017-01-06 14:59:26', '0', 'sadas', '1');
INSERT INTO `email_info` VALUES ('33', '1', '3', '梵蒂冈', '2017-01-06 17:23:50', '0', ' 的方式梵蒂冈', '1');
INSERT INTO `email_info` VALUES ('34', '1', '1', ' fds ', '2017-01-06 17:33:13', '0', 'd fd ', '1');

-- ----------------------------
-- Table structure for house_info
-- ----------------------------
DROP TABLE IF EXISTS `house_info`;
CREATE TABLE `house_info` (
  `house_id` int(10) NOT NULL AUTO_INCREMENT,
  `type_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `house_address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `house_price` int(20) DEFAULT NULL,
  `house_ambient` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_used` varchar(10) COLLATE utf8_unicode_ci DEFAULT '1',
  PRIMARY KEY (`house_id`),
  KEY `FK_Reference_13` (`user_id`),
  KEY `FK_Reference_26` (`type_id`),
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`),
  CONSTRAINT `FK_Reference_26` FOREIGN KEY (`type_id`) REFERENCES `house_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of house_info
-- ----------------------------
INSERT INTO `house_info` VALUES ('7', '2', '3', '三峡学院', '500', '萨法尔斯', '0');
INSERT INTO `house_info` VALUES ('9', '1', '1', '重庆云烟', '111', '这里是结婚生子的好地方', '1');
INSERT INTO `house_info` VALUES ('10', '1', '6', '重庆万州', '1200', '案发大发第三方', '1');
INSERT INTO `house_info` VALUES ('11', '1', '1', '重庆万州', '234', 'dadadassadca', '1');
INSERT INTO `house_info` VALUES ('12', '1', '6', '重庆万州', '1200', '5555', '1');
INSERT INTO `house_info` VALUES ('13', '1', '1', '宝山', '10000', '不错', '1');
INSERT INTO `house_info` VALUES ('14', '1', '1', '公关', '10000', '1312带我去', '0');
INSERT INTO `house_info` VALUES ('15', '1', '1', '爱的', '1300', '的地方', '0');

-- ----------------------------
-- Table structure for house_type
-- ----------------------------
DROP TABLE IF EXISTS `house_type`;
CREATE TABLE `house_type` (
  `type_id` int(10) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_used` varchar(10) COLLATE utf8_unicode_ci DEFAULT '1',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of house_type
-- ----------------------------
INSERT INTO `house_type` VALUES ('1', '三室一厅', '1');
INSERT INTO `house_type` VALUES ('2', '三室两厅', '1');
INSERT INTO `house_type` VALUES ('3', '两室一厅', '1');
INSERT INTO `house_type` VALUES ('4', '四室两厅', '1');

-- ----------------------------
-- Table structure for notice_info
-- ----------------------------
DROP TABLE IF EXISTS `notice_info`;
CREATE TABLE `notice_info` (
  `notice_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `notice_item` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notice_content` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notice_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `notice_endtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_used` varchar(10) COLLATE utf8_unicode_ci DEFAULT '1',
  PRIMARY KEY (`notice_id`),
  KEY `FK_Reference_12` (`user_id`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of notice_info
-- ----------------------------
INSERT INTO `notice_info` VALUES ('4', '1', '很舒服大吉', '发大水', '2017-01-06 15:04:27', '2017-01-25 15:04:34', '1');
INSERT INTO `notice_info` VALUES ('5', '1', '打球', '去吗', '2017-01-06 15:37:09', '2017-01-26 15:37:14', '0');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `department_id` int(10) DEFAULT NULL,
  `role_id` int(10) DEFAULT NULL,
  `user_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_sex` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_age` int(10) DEFAULT NULL,
  `user_address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_num` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_pw` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_tel` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_idnum` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_addtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_addman` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_changetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_changeman` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_intest` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_diploma` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_bankcard` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_nation` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_married` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_used` varchar(10) COLLATE utf8_unicode_ci DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '1', '1', '张三', '女', '13525452584', '20', '万州', 'a', '1', '52000112', '500234154545745474', '3797687@qq.com', '2013-05-25 09:37:18', '肉骨粉', '2017-01-06 10:08:37', '未修改', '很多', '本科', '5442232327863358787', '汉', '已婚', '1');
INSERT INTO `user_info` VALUES ('3', '1', '2', '王五', '男', '13254545454', '22', '重庆三峡学院', '123', '123', '22323244', '522141444514744547', '87592@qq.com', '2013-05-25 09:37:07', '张三', '2013-05-25 09:29:05', '未修改', '斗地主', '本科', '2323232345555555522', '汉', '未婚', '1');
INSERT INTO `user_info` VALUES ('4', '1', '2', '孙悟空', '男', '13545454545', '55', '花果山', '456', '456', '54584785', '524147444584574554', '39547@qq.com', '2013-05-25 09:37:04', '张三', '2013-05-25 09:30:14', '未修改', '吃桃子', '初中', '3535355488676754578', '汉', '离异', '0');
INSERT INTO `user_info` VALUES ('6', '3', '1', '蒋元征', '男', '15923219017', '20', '重庆双桥', 'jiang', 'jiang1314', '58105789', '500111199205191111', '253507692@qq.com', '2013-05-25 16:18:31', 'admin', '2013-05-25 16:20:27', '未修改', '上网、玩游戏', '本科', '6222023100045180177', '汉族', '未婚', '1');
INSERT INTO `user_info` VALUES ('12', '1', '1', '韩宝昆', '男', '15923219012', '12', '万州', '1313213', '3213123', '58105742', '500111199205191112', '2531978662@qq.com', '2017-01-04 11:20:36', '委屈无', '2017-01-04 11:20:51', '未修改', '上网、DNF', '初中', '5442232327863358788', '汉', '未婚', '1');
INSERT INTO `user_info` VALUES ('13', '3', '1', '李加廷', '男', '13525452586', '22', '万州', 'li', 'ayslapkguuqqbffd', '52000114', '500234154545745472', '653942945@qq.com', '2017-01-04 14:53:20', '查查', '2017-01-06 14:53:31', '未修改', '试试', '本科', '5442232327863358789', '汉', '未婚', '1');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_power` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_used` int(10) DEFAULT '1',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '管理员', '3', '1');
INSERT INTO `user_role` VALUES ('2', '员工', '2', '1');
INSERT INTO `user_role` VALUES ('3', '老板', '1', '1');
INSERT INTO `user_role` VALUES ('4', '违反', '1', '0');
INSERT INTO `user_role` VALUES ('5', '大展身手', '1', '1');
