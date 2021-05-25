/*
Navicat MySQL Data Transfer

Source Server         : www.calibur.pro
Source Server Version : 50725
Source Host           : localhost:3309
Source Database       : cloud_auto

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-12-05 17:21:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_device
-- ----------------------------
DROP TABLE IF EXISTS `t_device`;
CREATE TABLE `t_device` (
  `device_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `connect_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_device
-- ----------------------------
INSERT INTO `t_device` VALUES ('47', '120.36.168.178', '120.36.168.178', '2019-12-04 16:25:48', '2019-12-04 16:25:48');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type` varchar(255) DEFAULT NULL,
  `log_level` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `task_name` varchar(255) DEFAULT NULL,
  `script_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_scheduler
-- ----------------------------
DROP TABLE IF EXISTS `t_scheduler`;
CREATE TABLE `t_scheduler` (
  `scheduler_id` int(11) NOT NULL AUTO_INCREMENT,
  `scheduler_name` varchar(255) NOT NULL,
  `cron_time` varchar(255) NOT NULL COMMENT '时间',
  `last_execute_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '上次执行时间',
  `script_id` int(11) NOT NULL COMMENT '执行的任务',
  `device_ids` varchar(1024) DEFAULT NULL COMMENT '执行的设备 可以多个',
  `active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`scheduler_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_scheduler
-- ----------------------------

-- ----------------------------
-- Table structure for t_script
-- ----------------------------
DROP TABLE IF EXISTS `t_script`;
CREATE TABLE `t_script` (
  `script_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '脚本',
  `script_name` varchar(255) DEFAULT NULL COMMENT '脚本名称',
  `script` longtext DEFAULT NULL COMMENT '脚本内容',
  `script_args` varchar(255) DEFAULT NULL COMMENT '脚本参数',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`script_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_task
-- ----------------------------
DROP TABLE IF EXISTS `t_task`;
CREATE TABLE `t_task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) DEFAULT NULL,
  `device_id` int(11) NOT NULL COMMENT '指定设备',
  `script_id` int(11) NOT NULL,
  `script_args` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `start_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `finish_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(255) DEFAULT NULL COMMENT '运行状态',
  `task_result` varchar(255) DEFAULT NULL COMMENT '运行结果',
  `batch_number` varchar(64) DEFAULT NULL COMMENT '同一批次的任务 批次号一样',
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_task
-- ----------------------------

CREATE TABLE `t_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;


INSERT INTO `t_admin` (`uname`, `password`) VALUES ('admin', '123456');

ALTER TABLE `t_device`
MODIFY COLUMN `create_time`  datetime NULL DEFAULT NULL AFTER `ip`,
MODIFY COLUMN `connect_time`  datetime NULL DEFAULT NULL AFTER `create_time`,
ADD COLUMN `category`  varchar(255) NULL DEFAULT 'default' AFTER `connect_time`
