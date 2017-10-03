/*
Navicat MySQL Data Transfer

Source Server         : L
Source Server Version : 50508
Source Host           : localhost:3306
Source Database       : utopia

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

Date: 2012-03-06 16:37:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `analogies`
-- ----------------------------
DROP TABLE IF EXISTS `analogies`;
CREATE TABLE `analogies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ema_id` int(11) NOT NULL,
  `choices` text NOT NULL,
  `answer` text NOT NULL,
  `score` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ema_analogy` (`ema_id`),
  CONSTRAINT `ema_analogy` FOREIGN KEY (`ema_id`) REFERENCES `emas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of analogies
-- ----------------------------

-- ----------------------------
-- Table structure for `arenas`
-- ----------------------------
DROP TABLE IF EXISTS `arenas`;
CREATE TABLE `arenas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `date` date NOT NULL,
  `start` time NOT NULL,
  `quota` int(3) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of arenas
-- ----------------------------

-- ----------------------------
-- Table structure for `arena_members`
-- ----------------------------
DROP TABLE IF EXISTS `arena_members`;
CREATE TABLE `arena_members` (
  `arena_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`arena_id`,`student_id`),
  KEY `arena_member_student_id` (`student_id`),
  CONSTRAINT `arena_member_arena_id` FOREIGN KEY (`arena_id`) REFERENCES `arenas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `arena_member_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of arena_members
-- ----------------------------

-- ----------------------------
-- Table structure for `arena_quiz`
-- ----------------------------
DROP TABLE IF EXISTS `arena_quiz`;
CREATE TABLE `arena_quiz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `arena_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `choice` text NOT NULL,
  `answer` text NOT NULL,
  `score` int(2) NOT NULL,
  `time` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `arena_quiz_arena_id` (`arena_id`),
  CONSTRAINT `arena_quiz_arena_id` FOREIGN KEY (`arena_id`) REFERENCES `arenas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of arena_quiz
-- ----------------------------

-- ----------------------------
-- Table structure for `arena_student`
-- ----------------------------
DROP TABLE IF EXISTS `arena_student`;
CREATE TABLE `arena_student` (
  `student_id` int(11) NOT NULL,
  `arena_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `score` int(4) NOT NULL,
  `total` int(4) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`student_id`,`arena_id`),
  KEY `arena_student_arena_id` (`arena_id`),
  CONSTRAINT `arena_student_arena_id` FOREIGN KEY (`arena_id`) REFERENCES `arenas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `arena_student_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of arena_student
-- ----------------------------

-- ----------------------------
-- Table structure for `bfmeetinglogs`
-- ----------------------------
DROP TABLE IF EXISTS `bfmeetinglogs`;
CREATE TABLE `bfmeetinglogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bfmeetinglogs
-- ----------------------------

-- ----------------------------
-- Table structure for `bfmeetingmessages`
-- ----------------------------
DROP TABLE IF EXISTS `bfmeetingmessages`;
CREATE TABLE `bfmeetingmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bfmeeting_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `status` varchar(30) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bfmeeting_message_id` (`bfmeeting_id`),
  KEY `bfmeeting_user_id` (`user_id`),
  CONSTRAINT `bfmeeting_message_id` FOREIGN KEY (`bfmeeting_id`) REFERENCES `bfmeetings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bfmeeting_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bfmeetingmessages
-- ----------------------------

-- ----------------------------
-- Table structure for `bfmeetingreplys`
-- ----------------------------
DROP TABLE IF EXISTS `bfmeetingreplys`;
CREATE TABLE `bfmeetingreplys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `status` varchar(30) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bfmeeting_message_reply_id` (`message_id`),
  KEY `bfmeeting_user_reply_id` (`user_id`),
  CONSTRAINT `bfmeeting_message_reply_id` FOREIGN KEY (`message_id`) REFERENCES `bfmeetingmessages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bfmeeting_user_reply_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bfmeetingreplys
-- ----------------------------

-- ----------------------------
-- Table structure for `bfmeetingrooms`
-- ----------------------------
DROP TABLE IF EXISTS `bfmeetingrooms`;
CREATE TABLE `bfmeetingrooms` (
  `bfmeeting_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `user_status` varchar(30) NOT NULL,
  PRIMARY KEY (`bfmeeting_id`,`user_id`),
  KEY `bfmeeting_user_room_id` (`user_id`),
  CONSTRAINT `bfmeeting_room_id` FOREIGN KEY (`bfmeeting_id`) REFERENCES `bfmeetings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bfmeeting_user_room_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bfmeetingrooms
-- ----------------------------

-- ----------------------------
-- Table structure for `bfmeetings`
-- ----------------------------
DROP TABLE IF EXISTS `bfmeetings`;
CREATE TABLE `bfmeetings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `quota` int(3) NOT NULL,
  `status` varchar(30) NOT NULL,
  `date_created` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bfmeeting_teacher_id` (`teacher_id`),
  CONSTRAINT `bfmeeting_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of bfmeetings
-- ----------------------------
INSERT INTO `bfmeetings` VALUES ('1', 'For parents of Yuyu', '2', '1', 'close', '2012-03-05');

-- ----------------------------
-- Table structure for `emas`
-- ----------------------------
DROP TABLE IF EXISTS `emas`;
CREATE TABLE `emas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `date` date NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  `time_limit` int(4) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of emas
-- ----------------------------

-- ----------------------------
-- Table structure for `fillblanks`
-- ----------------------------
DROP TABLE IF EXISTS `fillblanks`;
CREATE TABLE `fillblanks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ema_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `score` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ema_fillblank` (`ema_id`),
  CONSTRAINT `ema_fillblank` FOREIGN KEY (`ema_id`) REFERENCES `emas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of fillblanks
-- ----------------------------

-- ----------------------------
-- Table structure for `fones`
-- ----------------------------
DROP TABLE IF EXISTS `fones`;
CREATE TABLE `fones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` text NOT NULL,
  `title` text NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `size` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of fones
-- ----------------------------
INSERT INTO `fones` VALUES ('21', '4f50a85c682aa.jpg', 'SampleImage', 'image', '91012', 'public');
INSERT INTO `fones` VALUES ('23', '4f50d5096aed4.doc', 'SampleFile', 'other', '187392', 'public');
INSERT INTO `fones` VALUES ('30', 'http://www.youtube.com/v/AJNDeVt9UOo', 'Math - Variables and Expressions', 'video', '', 'public');
INSERT INTO `fones` VALUES ('31', 'http://www.youtube.com/v/hJ-_OoCHTks', 'Math-Equations and Inequalities', 'video', '', 'public');

-- ----------------------------
-- Table structure for `fonetags`
-- ----------------------------
DROP TABLE IF EXISTS `fonetags`;
CREATE TABLE `fonetags` (
  `fone_id` int(11) NOT NULL,
  `module_id` varchar(30) NOT NULL,
  PRIMARY KEY (`fone_id`,`module_id`),
  CONSTRAINT `fone_tag` FOREIGN KEY (`fone_id`) REFERENCES `fones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of fonetags
-- ----------------------------
INSERT INTO `fonetags` VALUES ('21', 'lc_1');
INSERT INTO `fonetags` VALUES ('21', 'lc_2');
INSERT INTO `fonetags` VALUES ('23', 'lc_1');
INSERT INTO `fonetags` VALUES ('30', 'lc_2');
INSERT INTO `fonetags` VALUES ('31', 'lc_2');

-- ----------------------------
-- Table structure for `learningcelllogs`
-- ----------------------------
DROP TABLE IF EXISTS `learningcelllogs`;
CREATE TABLE `learningcelllogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of learningcelllogs
-- ----------------------------

-- ----------------------------
-- Table structure for `learningcellmessages`
-- ----------------------------
DROP TABLE IF EXISTS `learningcellmessages`;
CREATE TABLE `learningcellmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `learningcell_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'none',
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `learningcell_message_id` (`learningcell_id`),
  KEY `learningcelluser_id` (`user_id`),
  CONSTRAINT `learningcelluser_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `learningcell_message_id` FOREIGN KEY (`learningcell_id`) REFERENCES `learningcells` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of learningcellmessages
-- ----------------------------
INSERT INTO `learningcellmessages` VALUES ('42', '2', '2', 'tset', 'none', '2012-02-26 16:29:05');
INSERT INTO `learningcellmessages` VALUES ('47', '2', '2', 'working\n', 'none', '2012-02-26 16:52:47');
INSERT INTO `learningcellmessages` VALUES ('74', '1', '2', 'test', 'none', '2012-02-27 13:42:47');
INSERT INTO `learningcellmessages` VALUES ('75', '1', '1', 'test', 'none', '2012-02-27 15:27:40');
INSERT INTO `learningcellmessages` VALUES ('82', '1', '1', 'enter to send\n', 'none', '2012-02-28 15:01:31');
INSERT INTO `learningcellmessages` VALUES ('83', '1', '1', 'enter not send\nenter not send\n\n', 'none', '2012-02-28 15:01:46');
INSERT INTO `learningcellmessages` VALUES ('84', '1', '1', 'wsssssss\n', 'none', '2012-02-28 15:03:05');
INSERT INTO `learningcellmessages` VALUES ('115', '2', '4', 'hi', 'none', '2012-02-28 17:23:49');
INSERT INTO `learningcellmessages` VALUES ('116', '2', '4', 'omg?', 'none', '2012-02-28 17:24:57');
INSERT INTO `learningcellmessages` VALUES ('118', '2', '4', 'hg', 'none', '2012-02-28 17:29:00');
INSERT INTO `learningcellmessages` VALUES ('119', '2', '4', 'test test test', 'none', '2012-02-28 17:29:05');
INSERT INTO `learningcellmessages` VALUES ('121', '2', '4', 'sfdfsdfsd', 'none', '2012-02-28 17:29:41');
INSERT INTO `learningcellmessages` VALUES ('124', '2', '2', 'test', 'none', '2012-02-28 18:56:07');
INSERT INTO `learningcellmessages` VALUES ('125', '19', '2', 'not work', 'none', '2012-02-28 18:56:21');
INSERT INTO `learningcellmessages` VALUES ('126', '19', '2', 'test', 'none', '2012-02-28 18:57:19');
INSERT INTO `learningcellmessages` VALUES ('127', '19', '2', 'work?\'', 'none', '2012-02-28 18:57:23');
INSERT INTO `learningcellmessages` VALUES ('128', '19', '2', 'comeon', 'none', '2012-02-28 18:58:22');
INSERT INTO `learningcellmessages` VALUES ('129', '19', '2', 'ooo', 'none', '2012-02-28 18:59:13');
INSERT INTO `learningcellmessages` VALUES ('130', '19', '2', 'aaa', 'none', '2012-02-28 18:59:17');
INSERT INTO `learningcellmessages` VALUES ('131', '19', '2', 'ooo', 'none', '2012-02-28 18:59:25');
INSERT INTO `learningcellmessages` VALUES ('132', '19', '2', 'aaa', 'none', '2012-02-28 18:59:27');
INSERT INTO `learningcellmessages` VALUES ('133', '19', '2', 'test', 'none', '2012-02-28 19:02:39');
INSERT INTO `learningcellmessages` VALUES ('165', '3', '1', 'first message from yuyu\'s account...', 'none', '2012-02-29 02:39:16');
INSERT INTO `learningcellmessages` VALUES ('168', '2', '3', 'kuya?', 'none', '2012-02-29 15:43:22');
INSERT INTO `learningcellmessages` VALUES ('169', '2', '3', 'yuyu here', 'none', '2012-02-29 15:43:26');
INSERT INTO `learningcellmessages` VALUES ('171', '2', '3', 'is loading correct?', 'none', '2012-02-29 15:43:38');
INSERT INTO `learningcellmessages` VALUES ('174', '2', '3', 'wait', 'none', '2012-02-29 15:44:03');
INSERT INTO `learningcellmessages` VALUES ('176', '2', '2', 'login as teacher', 'none', '2012-02-29 15:44:19');
INSERT INTO `learningcellmessages` VALUES ('178', '2', '2', 'you should not be able to send now', 'none', '2012-02-29 15:44:37');
INSERT INTO `learningcellmessages` VALUES ('180', '2', '2', 'wait', 'none', '2012-02-29 15:45:15');
INSERT INTO `learningcellmessages` VALUES ('181', '2', '2', 'can u see?', 'none', '2012-02-29 15:45:33');
INSERT INTO `learningcellmessages` VALUES ('182', '2', '5', 'i know u', 'none', '2012-03-01 19:09:47');
INSERT INTO `learningcellmessages` VALUES ('183', '2', '1', 'here we go', 'none', '2012-03-02 18:27:02');
INSERT INTO `learningcellmessages` VALUES ('184', '2', '1', 'o no', 'none', '2012-03-02 18:27:06');
INSERT INTO `learningcellmessages` VALUES ('185', '2', '1', 'now we are going to make it', 'none', '2012-03-02 18:27:14');
INSERT INTO `learningcellmessages` VALUES ('186', '2', '1', 'why?', 'none', '2012-03-02 18:27:18');
INSERT INTO `learningcellmessages` VALUES ('187', '2', '1', 'weird', 'none', '2012-03-02 18:27:22');
INSERT INTO `learningcellmessages` VALUES ('188', '2', '1', 'come on', 'none', '2012-03-02 18:27:29');
INSERT INTO `learningcellmessages` VALUES ('189', '2', '1', 'make it work', 'none', '2012-03-02 18:27:39');
INSERT INTO `learningcellmessages` VALUES ('206', '2', '2', 'delay', 'none', '2012-03-02 19:03:52');
INSERT INTO `learningcellmessages` VALUES ('207', '2', '2', 'here', 'none', '2012-03-02 19:03:55');
INSERT INTO `learningcellmessages` VALUES ('216', '2', '2', 'test', 'none', '2012-03-02 19:08:27');
INSERT INTO `learningcellmessages` VALUES ('217', '2', '1', 'DO NOT GIVE UP YUYU', 'none', '2012-03-02 19:08:40');
INSERT INTO `learningcellmessages` VALUES ('218', '2', '2', 'here', 'none', '2012-03-02 19:08:41');
INSERT INTO `learningcellmessages` VALUES ('219', '2', '1', 'wait lang', 'none', '2012-03-02 19:08:46');
INSERT INTO `learningcellmessages` VALUES ('220', '2', '2', 'here', 'none', '2012-03-02 19:08:52');
INSERT INTO `learningcellmessages` VALUES ('221', '2', '2', 'ha?', 'none', '2012-03-02 19:08:59');
INSERT INTO `learningcellmessages` VALUES ('222', '2', '1', 'type ka ulit', 'none', '2012-03-02 19:09:01');
INSERT INTO `learningcellmessages` VALUES ('223', '2', '2', 'still?', 'none', '2012-03-02 19:09:06');
INSERT INTO `learningcellmessages` VALUES ('224', '2', '1', 'ang gulo', 'none', '2012-03-02 19:09:08');
INSERT INTO `learningcellmessages` VALUES ('225', '2', '1', 'aaaww', 'none', '2012-03-02 19:09:16');
INSERT INTO `learningcellmessages` VALUES ('226', '2', '1', 'hihihihihi', 'none', '2012-03-02 19:09:50');
INSERT INTO `learningcellmessages` VALUES ('227', '2', '1', 'its dobol', 'none', '2012-03-02 19:09:57');
INSERT INTO `learningcellmessages` VALUES ('228', '2', '2', 'double?', 'none', '2012-03-02 19:10:44');
INSERT INTO `learningcellmessages` VALUES ('229', '2', '1', 'doble parin ba?', 'none', '2012-03-02 19:10:56');
INSERT INTO `learningcellmessages` VALUES ('230', '2', '1', 'isa pa', 'none', '2012-03-02 19:11:04');
INSERT INTO `learningcellmessages` VALUES ('231', '2', '1', 'why u like dat', 'none', '2012-03-02 19:11:11');
INSERT INTO `learningcellmessages` VALUES ('232', '2', '2', 'refresh', 'none', '2012-03-02 19:12:01');
INSERT INTO `learningcellmessages` VALUES ('233', '2', '1', 'type', 'none', '2012-03-02 19:12:15');
INSERT INTO `learningcellmessages` VALUES ('234', '2', '1', 'hey heeeey', 'none', '2012-03-02 19:12:23');
INSERT INTO `learningcellmessages` VALUES ('235', '2', '1', 'aaww huhuhu', 'none', '2012-03-02 19:12:39');
INSERT INTO `learningcellmessages` VALUES ('236', '2', '2', 'sure', 'none', '2012-03-02 19:13:27');
INSERT INTO `learningcellmessages` VALUES ('237', '2', '2', 'here', 'none', '2012-03-02 19:13:30');
INSERT INTO `learningcellmessages` VALUES ('238', '2', '2', 'game', 'none', '2012-03-02 19:13:47');
INSERT INTO `learningcellmessages` VALUES ('239', '2', '2', 'weird', 'none', '2012-03-02 19:13:51');
INSERT INTO `learningcellmessages` VALUES ('240', '2', '2', 'sad', 'none', '2012-03-02 19:14:11');
INSERT INTO `learningcellmessages` VALUES ('241', '2', '2', 'come on', 'none', '2012-03-02 19:14:16');
INSERT INTO `learningcellmessages` VALUES ('242', '2', '2', 'here na', 'none', '2012-03-02 19:14:19');
INSERT INTO `learningcellmessages` VALUES ('243', '2', '2', 'game?', 'none', '2012-03-02 19:14:22');
INSERT INTO `learningcellmessages` VALUES ('244', '2', '2', 'here', 'none', '2012-03-02 19:17:40');
INSERT INTO `learningcellmessages` VALUES ('245', '2', '2', 'game', 'none', '2012-03-02 19:17:42');
INSERT INTO `learningcellmessages` VALUES ('246', '2', '2', 'yeah', 'none', '2012-03-02 19:17:45');
INSERT INTO `learningcellmessages` VALUES ('247', '2', '2', 'no erro', 'none', '2012-03-02 19:17:47');
INSERT INTO `learningcellmessages` VALUES ('248', '2', '2', 'error', 'none', '2012-03-02 19:17:50');
INSERT INTO `learningcellmessages` VALUES ('249', '2', '1', 'halo', 'none', '2012-03-02 19:18:00');
INSERT INTO `learningcellmessages` VALUES ('250', '2', '2', 'game', 'none', '2012-03-02 19:18:02');
INSERT INTO `learningcellmessages` VALUES ('251', '2', '2', 'here', 'none', '2012-03-02 19:18:07');
INSERT INTO `learningcellmessages` VALUES ('252', '2', '1', 'hi', 'none', '2012-03-02 19:18:08');
INSERT INTO `learningcellmessages` VALUES ('253', '2', '2', 'keep typeing', 'none', '2012-03-02 19:18:18');
INSERT INTO `learningcellmessages` VALUES ('254', '2', '1', 'halo yuyu', 'none', '2012-03-02 19:18:18');
INSERT INTO `learningcellmessages` VALUES ('255', '2', '2', 'no error now', 'none', '2012-03-02 19:18:22');
INSERT INTO `learningcellmessages` VALUES ('256', '2', '1', 'oy', 'none', '2012-03-02 19:18:22');
INSERT INTO `learningcellmessages` VALUES ('257', '2', '1', 'oy', 'none', '2012-03-02 19:18:23');
INSERT INTO `learningcellmessages` VALUES ('258', '2', '1', 'isan lang', 'none', '2012-03-02 19:18:26');
INSERT INTO `learningcellmessages` VALUES ('259', '2', '2', 'how about there', 'none', '2012-03-02 19:18:26');
INSERT INTO `learningcellmessages` VALUES ('260', '2', '2', 'game', 'none', '2012-03-02 19:18:33');
INSERT INTO `learningcellmessages` VALUES ('261', '2', '1', 'okay', 'none', '2012-03-02 19:18:36');
INSERT INTO `learningcellmessages` VALUES ('262', '2', '1', 'one', 'none', '2012-03-02 19:18:38');
INSERT INTO `learningcellmessages` VALUES ('263', '2', '2', 'ok na?', 'none', '2012-03-02 19:18:39');
INSERT INTO `learningcellmessages` VALUES ('264', '2', '1', 'one', 'none', '2012-03-02 19:18:44');
INSERT INTO `learningcellmessages` VALUES ('265', '2', '1', 'two', 'none', '2012-03-02 19:18:47');
INSERT INTO `learningcellmessages` VALUES ('266', '2', '1', 'three', 'none', '2012-03-02 19:18:51');
INSERT INTO `learningcellmessages` VALUES ('267', '2', '1', 'three', 'none', '2012-03-02 19:18:58');
INSERT INTO `learningcellmessages` VALUES ('268', '2', '2', 'ulit', 'none', '2012-03-02 19:19:04');
INSERT INTO `learningcellmessages` VALUES ('269', '2', '2', 'here', 'none', '2012-03-02 19:19:07');
INSERT INTO `learningcellmessages` VALUES ('270', '2', '2', 'no double so far', 'none', '2012-03-02 19:19:13');
INSERT INTO `learningcellmessages` VALUES ('271', '2', '1', 'meron', 'none', '2012-03-02 19:19:16');
INSERT INTO `learningcellmessages` VALUES ('272', '2', '1', 'double', 'none', '2012-03-02 19:19:19');
INSERT INTO `learningcellmessages` VALUES ('273', '2', '2', 'i dont see ur msg', 'none', '2012-03-02 19:19:22');
INSERT INTO `learningcellmessages` VALUES ('274', '2', '1', 'HUY', 'none', '2012-03-02 19:19:30');
INSERT INTO `learningcellmessages` VALUES ('275', '2', '2', 'isa lang sa akin', 'none', '2012-03-02 19:19:31');
INSERT INTO `learningcellmessages` VALUES ('276', '2', '1', 'HOY', 'none', '2012-03-02 19:19:39');
INSERT INTO `learningcellmessages` VALUES ('277', '2', '2', 'ulit', 'none', '2012-03-02 19:20:36');
INSERT INTO `learningcellmessages` VALUES ('278', '2', '1', 'gusto mag quit', 'none', '2012-03-02 19:20:38');
INSERT INTO `learningcellmessages` VALUES ('279', '2', '2', 'no double so far', 'none', '2012-03-02 19:20:40');
INSERT INTO `learningcellmessages` VALUES ('280', '2', '1', 'isa nalang', 'none', '2012-03-02 19:20:44');
INSERT INTO `learningcellmessages` VALUES ('281', '2', '2', 'game', 'none', '2012-03-02 19:20:44');
INSERT INTO `learningcellmessages` VALUES ('282', '2', '1', 'bahaha', 'none', '2012-03-02 19:20:45');
INSERT INTO `learningcellmessages` VALUES ('283', '2', '2', 'here', 'none', '2012-03-02 19:20:46');
INSERT INTO `learningcellmessages` VALUES ('284', '2', '2', 'game', 'none', '2012-03-02 19:20:48');
INSERT INTO `learningcellmessages` VALUES ('285', '2', '1', 'kahit mabilis', 'none', '2012-03-02 19:20:48');
INSERT INTO `learningcellmessages` VALUES ('286', '2', '2', 'no', 'none', '2012-03-02 19:20:49');
INSERT INTO `learningcellmessages` VALUES ('287', '2', '1', 'hello', 'none', '2012-03-02 19:20:50');
INSERT INTO `learningcellmessages` VALUES ('288', '2', '2', 'double', 'none', '2012-03-02 19:20:51');
INSERT INTO `learningcellmessages` VALUES ('289', '2', '1', 'near far', 'none', '2012-03-02 19:20:52');
INSERT INTO `learningcellmessages` VALUES ('290', '2', '2', 'haah', 'none', '2012-03-02 19:20:54');
INSERT INTO `learningcellmessages` VALUES ('291', '2', '2', 'haha', 'none', '2012-03-02 19:20:55');
INSERT INTO `learningcellmessages` VALUES ('292', '2', '1', 'wherever you are', 'Star', '2012-03-02 19:20:56');
INSERT INTO `learningcellmessages` VALUES ('293', '1', '2', 'game', 'none', '2012-03-02 23:51:36');
INSERT INTO `learningcellmessages` VALUES ('294', '23', '1', 'yeah. im only one here', 'none', '2012-03-03 12:10:25');
INSERT INTO `learningcellmessages` VALUES ('295', '23', '1', 'lol', 'none', '2012-03-03 12:10:29');
INSERT INTO `learningcellmessages` VALUES ('296', '23', '1', 'haha', 'none', '2012-03-03 12:10:31');
INSERT INTO `learningcellmessages` VALUES ('297', '23', '1', 'this is funny', 'none', '2012-03-03 12:10:35');
INSERT INTO `learningcellmessages` VALUES ('298', '23', '1', 'we\'ll not finish this on time', 'none', '2012-03-03 12:10:46');
INSERT INTO `learningcellmessages` VALUES ('299', '23', '1', 'yeah', 'none', '2012-03-03 12:10:48');
INSERT INTO `learningcellmessages` VALUES ('300', '25', '9', 'knicks lost', 'none', '2012-03-05 16:52:37');

-- ----------------------------
-- Table structure for `learningcellreplies`
-- ----------------------------
DROP TABLE IF EXISTS `learningcellreplies`;
CREATE TABLE `learningcellreplies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `learningcellmessage_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `status` varchar(30) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `learningcellmessage_reply_id` (`learningcellmessage_id`),
  KEY `learningcelluser_reply_id` (`user_id`),
  CONSTRAINT `learningcellmessage_reply_id` FOREIGN KEY (`learningcellmessage_id`) REFERENCES `learningcellmessages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `learningcelluser_reply_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of learningcellreplies
-- ----------------------------

-- ----------------------------
-- Table structure for `learningcellrooms`
-- ----------------------------
DROP TABLE IF EXISTS `learningcellrooms`;
CREATE TABLE `learningcellrooms` (
  `learningcell_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_status` varchar(30) NOT NULL DEFAULT 'open',
  PRIMARY KEY (`learningcell_id`,`user_id`),
  KEY `learningcell_user_room_id` (`user_id`),
  CONSTRAINT `learningcell_room_id` FOREIGN KEY (`learningcell_id`) REFERENCES `learningcells` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `learningcell_user_room_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of learningcellrooms
-- ----------------------------
INSERT INTO `learningcellrooms` VALUES ('1', '1', 'open');
INSERT INTO `learningcellrooms` VALUES ('2', '1', 'open');
INSERT INTO `learningcellrooms` VALUES ('2', '3', 'open');
INSERT INTO `learningcellrooms` VALUES ('2', '4', 'open');
INSERT INTO `learningcellrooms` VALUES ('3', '1', 'open');
INSERT INTO `learningcellrooms` VALUES ('19', '3', 'open');
INSERT INTO `learningcellrooms` VALUES ('23', '1', 'open');
INSERT INTO `learningcellrooms` VALUES ('25', '1', 'open');

-- ----------------------------
-- Table structure for `learningcells`
-- ----------------------------
DROP TABLE IF EXISTS `learningcells`;
CREATE TABLE `learningcells` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `quota` int(3) NOT NULL,
  `status` varchar(30) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `learningcell_teacher_id` (`teacher_id`),
  CONSTRAINT `learningcell_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of learningcells
-- ----------------------------
INSERT INTO `learningcells` VALUES ('1', 'math', '2', '40', 'open', '2012-02-22 21:06:22');
INSERT INTO `learningcells` VALUES ('2', 'english', '2', '30', 'open', '2012-02-22 21:06:42');
INSERT INTO `learningcells` VALUES ('3', 'science', '2', '30', 'close', '2012-02-24 02:05:06');
INSERT INTO `learningcells` VALUES ('19', 'filipino', '2', '1', 'close', '2012-02-28 18:26:24');
INSERT INTO `learningcells` VALUES ('20', 'chemistry', '2', '50', 'open', '2012-03-01 17:44:04');
INSERT INTO `learningcells` VALUES ('23', 'test', '2', '1', 'close', '2012-03-01 19:08:23');
INSERT INTO `learningcells` VALUES ('25', 'basketball', '9', '2', 'open', '2012-03-05 16:52:20');

-- ----------------------------
-- Table structure for `logs`
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messge` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of logs
-- ----------------------------

-- ----------------------------
-- Table structure for `matchingtypes`
-- ----------------------------
DROP TABLE IF EXISTS `matchingtypes`;
CREATE TABLE `matchingtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ema_id` int(11) NOT NULL,
  `column_a` text NOT NULL,
  `column_b` text NOT NULL,
  `score` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ema_matchingtype` (`ema_id`),
  CONSTRAINT `ema_matchingtype` FOREIGN KEY (`ema_id`) REFERENCES `emas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of matchingtypes
-- ----------------------------

-- ----------------------------
-- Table structure for `multiplechoices`
-- ----------------------------
DROP TABLE IF EXISTS `multiplechoices`;
CREATE TABLE `multiplechoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ema_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `choices` text NOT NULL,
  `answer` tinyint(1) NOT NULL,
  `score` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ema_multiplechoice` (`ema_id`),
  CONSTRAINT `ema_multiplechoice` FOREIGN KEY (`ema_id`) REFERENCES `emas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of multiplechoices
-- ----------------------------

-- ----------------------------
-- Table structure for `notifications`
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `status` varchar(30) NOT NULL,
  `message` text NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of notifications
-- ----------------------------
INSERT INTO `notifications` VALUES ('1', '1', '1', 'check', 'test', '2012-02-21 02:29:00');
INSERT INTO `notifications` VALUES ('2', '1', '1', 'check', 'test2', '2012-02-22 02:53:59');
INSERT INTO `notifications` VALUES ('3', '1', '1', 'check', 'test3', '2012-02-22 03:09:50');
INSERT INTO `notifications` VALUES ('4', '1', '1', 'check', 'test4', '2012-02-22 12:27:50');
INSERT INTO `notifications` VALUES ('5', '1', '1', 'check', 'test5', '2012-02-22 12:30:08');
INSERT INTO `notifications` VALUES ('6', '1', '1', 'check', 'test6', '2012-02-22 12:30:47');
INSERT INTO `notifications` VALUES ('7', '1', '1', 'check', 'test7', '2012-02-22 12:33:10');
INSERT INTO `notifications` VALUES ('8', '1', '1', 'check', 'test8', '2012-02-22 13:06:34');
INSERT INTO `notifications` VALUES ('9', '1', '1', 'check', 'test9', '2012-02-23 11:47:03');
INSERT INTO `notifications` VALUES ('10', '1', '2', 'uncheck', 'test1', '2012-03-01 19:11:12');

-- ----------------------------
-- Table structure for `parents`
-- ----------------------------
DROP TABLE IF EXISTS `parents`;
CREATE TABLE `parents` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `contact` varchar(30) NOT NULL,
  `contact2` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_student` (`student_id`),
  CONSTRAINT `user_parent_id` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of parents
-- ----------------------------
INSERT INTO `parents` VALUES ('10', '3', '9271231234', null);

-- ----------------------------
-- Table structure for `piflogs`
-- ----------------------------
DROP TABLE IF EXISTS `piflogs`;
CREATE TABLE `piflogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of piflogs
-- ----------------------------

-- ----------------------------
-- Table structure for `pifmessages`
-- ----------------------------
DROP TABLE IF EXISTS `pifmessages`;
CREATE TABLE `pifmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pif_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'none',
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pif_message_id` (`pif_id`) USING BTREE,
  KEY `pifuser_id` (`user_id`) USING BTREE,
  CONSTRAINT `pifuser_message_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pif_message_id` FOREIGN KEY (`pif_id`) REFERENCES `pifs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pifmessages
-- ----------------------------

-- ----------------------------
-- Table structure for `pifreplys`
-- ----------------------------
DROP TABLE IF EXISTS `pifreplys`;
CREATE TABLE `pifreplys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `status` varchar(30) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pifmessage_reply_id` (`message_id`),
  KEY `pifuser_reply_id` (`user_id`),
  CONSTRAINT `pifmessage_reply_id` FOREIGN KEY (`message_id`) REFERENCES `pifmessages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pifuser_reply_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pifreplys
-- ----------------------------

-- ----------------------------
-- Table structure for `pifrooms`
-- ----------------------------
DROP TABLE IF EXISTS `pifrooms`;
CREATE TABLE `pifrooms` (
  `pif_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `user_status` varchar(30) NOT NULL,
  PRIMARY KEY (`pif_id`,`user_id`),
  KEY `pif_user_room_id` (`user_id`),
  CONSTRAINT `pif_room_id` FOREIGN KEY (`pif_id`) REFERENCES `pifs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pif_user_room_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pifrooms
-- ----------------------------
INSERT INTO `pifrooms` VALUES ('2', '1', '', '');

-- ----------------------------
-- Table structure for `pifs`
-- ----------------------------
DROP TABLE IF EXISTS `pifs`;
CREATE TABLE `pifs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `quota` int(3) NOT NULL,
  `status` varchar(30) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pif_teacher_id` (`teacher_id`),
  CONSTRAINT `pif_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pifs
-- ----------------------------
INSERT INTO `pifs` VALUES ('2', 'yuyu\'s room', '1', '3', 'close', '2012-03-05 16:18:01');

-- ----------------------------
-- Table structure for `references`
-- ----------------------------
DROP TABLE IF EXISTS `references`;
CREATE TABLE `references` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `link` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of references
-- ----------------------------
INSERT INTO `references` VALUES ('1', 'Math-Variables and Expressions', 'http://www.youtube.com/v/AJNDeVt9UOo');
INSERT INTO `references` VALUES ('2', 'Math-Order of Operations', 'http://www.youtube.com/v/3Po3nfITsok');
INSERT INTO `references` VALUES ('3', 'Math-Simple Equations', 'http://www.youtube.com/v/9Ek61w1LxSc');
INSERT INTO `references` VALUES ('4', 'Math-Equations and Inequalities', 'http://www.youtube.com/v/hJ-_OoCHTks');
INSERT INTO `references` VALUES ('5', 'Math-Exploring and Inequalities', 'http://www.youtube.com/v/qPx7i1jwXX4');
INSERT INTO `references` VALUES ('6', 'Math- Slope of a line', 'http://www.youtube.com/v/R948Tsyq4vA');
INSERT INTO `references` VALUES ('7', 'Math-Equation of a line', 'http://www.youtube.com/v/gvwKv6F69F0');
INSERT INTO `references` VALUES ('8', 'Art History-Leonardo\'s Last Supper', 'http://www.youtube.com/v/4NEXxAGG79A');
INSERT INTO `references` VALUES ('9', 'Art History-Michaelangelo\'s Slaves', 'http://www.youtube.com/v/h44bnIGogu8');
INSERT INTO `references` VALUES ('10', 'Art History-Michaelangelo\'s Moses', 'http://www.youtube.com/v/pnBbFIxCIGw');
INSERT INTO `references` VALUES ('11', 'Art History-Arch of Titus', 'http://www.youtube.com/v/Huop6oiCgVg');
INSERT INTO `references` VALUES ('12', 'Science Biology- Introduction to Evolution and Natural Selection', 'http://www.youtube.com/v/GcjgWov7mTM');
INSERT INTO `references` VALUES ('13', 'Science Biology- Phases of Meiosis', 'http://www.youtube.com/v/ijLc52LmFQg');
INSERT INTO `references` VALUES ('14', 'Science Biology- Cancer', 'http://www.youtube.com/v/RZhL7LDPk8w');
INSERT INTO `references` VALUES ('15', 'Science Biology- Punnet Square Fun', 'http://www.youtube.com/v/D5ymMYcLtv0');
INSERT INTO `references` VALUES ('16', 'Science Biology- Bacteria', 'http://www.youtube.com/v/TDoGrbpJJ14');
INSERT INTO `references` VALUES ('17', 'Science Biology- Viruses', 'http://www.youtube.com/v/0h5Jd7sgQWY');
INSERT INTO `references` VALUES ('18', 'Science Biology- Introduction to Cellular Respiration', 'http://www.youtube.com/v/2f7YwCtHcgk');
INSERT INTO `references` VALUES ('19', 'Science Biology- Phases of Mitosis', 'http://www.youtube.com/v/LLKX_4DHE3I');
INSERT INTO `references` VALUES ('20', 'Math Calculus- Introduction to Limits', 'http://www.youtube.com/v/W0VWO4asgmk');
INSERT INTO `references` VALUES ('21', 'Math Calculus- Squeeze Theorem', 'http://www.youtube.com/v/igJdDN-DPgA');
INSERT INTO `references` VALUES ('22', 'Math Calculus- Derivatives ', 'http://www.youtube.com/v/rAof9Ld5sOg');
INSERT INTO `references` VALUES ('23', 'Math Calculus- The Chain Rule', 'http://www.youtube.com/v/XIQ-KnsAsbg');
INSERT INTO `references` VALUES ('24', 'Math Calculus- Product Rule', 'http://www.youtube.com/v/h78GdGiRmpM');
INSERT INTO `references` VALUES ('25', 'Science Chemistry- Elements and Atoms', 'http://www.youtube.com/v/IFKnq9QM6_A');
INSERT INTO `references` VALUES ('26', 'Science Chemistry- Introduction to the Atom', 'http://www.youtube.com/v/1xSQlwWGT8M');
INSERT INTO `references` VALUES ('27', 'Science Chemistry- Orbital', 'http://www.youtube.com/v/yBrp8uvNAhI');
INSERT INTO `references` VALUES ('28', 'Science Chemistry- More on Orbitals and Electron Configuration', 'http://www.youtube.com/v/FmQoSenbtnU');
INSERT INTO `references` VALUES ('29', 'Science Chemistry- Electron Configuration', 'http://www.youtube.com/v/RJlEH5Jz80w');
INSERT INTO `references` VALUES ('30', 'Science Astronomy- Becoming a Red Giant', 'http://www.youtube.com/v/kJSOqlcFpJw');
INSERT INTO `references` VALUES ('31', 'Science Astronomy- Birth of Stars', 'http://www.youtube.com/v/i-NNWI8Ccas');
INSERT INTO `references` VALUES ('32', 'Science Astronomy- Scale of Earth and Sun', 'http://www.youtube.com/v/GZx3U0dbASg');
INSERT INTO `references` VALUES ('33', 'Science Astronomy- Scale of the Solar System', 'http://www.youtube.com/v/GP53b__h4ew');
INSERT INTO `references` VALUES ('34', 'Science Astronomy- Big Bang Introduction', 'http://www.youtube.com/v/eUF59jCFcyQ');
INSERT INTO `references` VALUES ('35', 'Currency- Currency Exchange Introduction', 'http://www.youtube.com/v/itoNb1lb5hY');
INSERT INTO `references` VALUES ('36', 'Currency- Currency Effect of Trade', 'http://www.youtube.com/v/5HVCFrXQ9pw');
INSERT INTO `references` VALUES ('37', 'Currency- American – Chinese Debt Loop', 'http://www.youtube.com/v/m5xu4r0szaA');
INSERT INTO `references` VALUES ('38', 'Finance- Introduction to Interest', 'http://www.youtube.com/v/GtaoP0skPWc');
INSERT INTO `references` VALUES ('39', 'Finance- Interest II', 'http://www.youtube.com/v/t4zfiBw0hwM');
INSERT INTO `references` VALUES ('40', 'Finance- Introduction to Present Value', 'http://www.youtube.com/v/ks33lMoxst0');
INSERT INTO `references` VALUES ('41', 'Finance- Home- Equity Loans', 'http://www.youtube.com/v/7rrSuhFC7I0');
INSERT INTO `references` VALUES ('42', 'Finance- Renting vs Buying a House', 'http://www.youtube.com/v/YL10H_EcB-E');
INSERT INTO `references` VALUES ('43', 'Math Geometry- Basic Language and Notation of Geometry', 'http://www.youtube.com/v/OtnQ9YEQ_tU');
INSERT INTO `references` VALUES ('44', 'Math Geometry- Lines, segments, and rays', 'http://www.youtube.com/v/JcqCf762y9w');
INSERT INTO `references` VALUES ('45', 'Math Geometry- Language and notation of a circle', 'http://www.youtube.com/v/U2W7HPyC0cM');
INSERT INTO `references` VALUES ('46', 'Math Geometry- Angle Basics', 'http://www.youtube.com/v/H-de6Tkxej8');
INSERT INTO `references` VALUES ('47', 'Math Geometry- Measuring Angles in Degrees', 'http://www.youtube.com/v/92aLiyeQj0w');
INSERT INTO `references` VALUES ('48', 'Math Geometry- Using a protractor', 'http://www.youtube.com/v/dw41PMWek6U');
INSERT INTO `references` VALUES ('49', 'Math Geometry- Measuring Angles', 'http://www.youtube.com/v/wJ37GJyViU8');
INSERT INTO `references` VALUES ('50', 'Math Geometry- Complementary Angles', 'http://www.youtube.com/v/BTnAlNSgNsY');

-- ----------------------------
-- Table structure for `students`
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `year` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_student_id` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES ('1', '3rd');

-- ----------------------------
-- Table structure for `student_analogies`
-- ----------------------------
DROP TABLE IF EXISTS `student_analogies`;
CREATE TABLE `student_analogies` (
  `student_id` int(11) NOT NULL,
  `analogy_id` int(11) NOT NULL,
  ` choices` text NOT NULL,
  `answer` text NOT NULL,
  `correct` text NOT NULL,
  `score` int(4) NOT NULL,
  PRIMARY KEY (`student_id`,`analogy_id`),
  KEY `student_analogy_analogy_id` (`analogy_id`),
  CONSTRAINT `student_analogy_analogy_id` FOREIGN KEY (`analogy_id`) REFERENCES `analogies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_analogy_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of student_analogies
-- ----------------------------

-- ----------------------------
-- Table structure for `student_emas`
-- ----------------------------
DROP TABLE IF EXISTS `student_emas`;
CREATE TABLE `student_emas` (
  `student_id` int(11) NOT NULL,
  `ema_id` int(11) NOT NULL,
  `start` time NOT NULL,
  `score` int(5) NOT NULL,
  `total` int(5) NOT NULL,
  `date_created` time NOT NULL,
  PRIMARY KEY (`student_id`,`ema_id`),
  KEY `student_ema_ema_id` (`ema_id`),
  CONSTRAINT `student_ema_ema_id` FOREIGN KEY (`ema_id`) REFERENCES `emas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_ema_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of student_emas
-- ----------------------------

-- ----------------------------
-- Table structure for `student_fillblanks`
-- ----------------------------
DROP TABLE IF EXISTS `student_fillblanks`;
CREATE TABLE `student_fillblanks` (
  `student_id` int(11) NOT NULL,
  `fillblank_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `correct` text NOT NULL,
  `score` int(4) NOT NULL,
  PRIMARY KEY (`student_id`,`fillblank_id`),
  KEY `student_fillblank_fillblank_id` (`fillblank_id`),
  CONSTRAINT `student_fillblank_fillblank_id` FOREIGN KEY (`fillblank_id`) REFERENCES `fillblanks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_fillblank_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of student_fillblanks
-- ----------------------------

-- ----------------------------
-- Table structure for `student_matchingtypes`
-- ----------------------------
DROP TABLE IF EXISTS `student_matchingtypes`;
CREATE TABLE `student_matchingtypes` (
  `student_id` int(11) NOT NULL,
  `matchingtype_id` int(11) NOT NULL,
  `answer_a` text NOT NULL,
  `answer_b` text NOT NULL,
  `column_a` text NOT NULL,
  `column_b` text NOT NULL,
  `score` int(4) NOT NULL,
  PRIMARY KEY (`student_id`,`matchingtype_id`),
  KEY `student_matchingtype_matchingtype_id` (`matchingtype_id`),
  CONSTRAINT `student_matchingtype_matchingtype_id` FOREIGN KEY (`matchingtype_id`) REFERENCES `matchingtypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_matchingtype_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of student_matchingtypes
-- ----------------------------

-- ----------------------------
-- Table structure for `student_multiplechoices`
-- ----------------------------
DROP TABLE IF EXISTS `student_multiplechoices`;
CREATE TABLE `student_multiplechoices` (
  `student_id` int(11) NOT NULL,
  `multiplechoice_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `choice` text NOT NULL,
  `answer` text NOT NULL,
  `correct` text NOT NULL,
  `score` int(4) NOT NULL,
  PRIMARY KEY (`student_id`,`multiplechoice_id`),
  KEY `student_multiplechoice_multiplechoice_id` (`multiplechoice_id`),
  CONSTRAINT `student_multiplechoice_multiplechoice_id` FOREIGN KEY (`multiplechoice_id`) REFERENCES `multiplechoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_multiplechoice_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of student_multiplechoices
-- ----------------------------

-- ----------------------------
-- Table structure for `student_trueorfalses`
-- ----------------------------
DROP TABLE IF EXISTS `student_trueorfalses`;
CREATE TABLE `student_trueorfalses` (
  `student_id` int(11) NOT NULL,
  `trueorfalse_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `correct` text NOT NULL,
  `score` int(4) NOT NULL,
  PRIMARY KEY (`student_id`,`trueorfalse_id`),
  KEY `student_trueorfalse_trueorfalse_id` (`trueorfalse_id`),
  CONSTRAINT `student_trueorfalse_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_trueorfalse_trueorfalse_id` FOREIGN KEY (`trueorfalse_id`) REFERENCES `trueorfalses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of student_trueorfalses
-- ----------------------------

-- ----------------------------
-- Table structure for `teachers`
-- ----------------------------
DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `department` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_teacher_id` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of teachers
-- ----------------------------
INSERT INTO `teachers` VALUES ('2', 'math');
INSERT INTO `teachers` VALUES ('9', 'p.e.');

-- ----------------------------
-- Table structure for `trueorfalses`
-- ----------------------------
DROP TABLE IF EXISTS `trueorfalses`;
CREATE TABLE `trueorfalses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ema_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `score` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ema_trueorfalse` (`ema_id`),
  CONSTRAINT `ema_trueorfalse` FOREIGN KEY (`ema_id`) REFERENCES `emas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trueorfalses
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `middlename` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'lai_yuyu_so', 'pw', 'lai', 'so', 'yuyu', 'student', 'active', '2012-02-22 01:15:31');
INSERT INTO `users` VALUES ('2', 'gilbert_taj', 'n', 'gilbert', '', 'taj', 'teacher', 'active', '2012-02-22 21:28:31');
INSERT INTO `users` VALUES ('3', 'sison_miguel_gomez', 'g', 'sison', 'gomez', 'miguel', 'student', 'active', '2012-02-26 15:05:42');
INSERT INTO `users` VALUES ('4', 'mendoza_lourdes_mauleon', 'm', 'mendaza', 'mauleon', 'lourdes', 'student', 'active', '2012-02-28 17:10:52');
INSERT INTO `users` VALUES ('5', 'admin', 'admin', 'admin', 'admin', 'admin', 'admin', 'active', '2012-02-29 02:40:45');
INSERT INTO `users` VALUES ('6', 'minano_warren_trapero', 't', 'minano', 'trapero', 'warren', 'student', 'active', '2012-03-01 00:10:51');
INSERT INTO `users` VALUES ('9', 'lin_jeremy', 'k', 'lin', '', 'jeremy', 'teacher', 'active', '2012-03-01 00:37:16');
INSERT INTO `users` VALUES ('10', 'sison_jay', 'sj', 'sison', '', 'jay', 'parent', 'active', '2012-03-01 00:38:56');
INSERT INTO `users` VALUES ('12', 'diego_deecee_sarte', 's', 'diego', 'sarte', 'deecee', 'student', 'active', '2012-03-01 14:47:09');
