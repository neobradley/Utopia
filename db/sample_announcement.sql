/*
Navicat MySQL Data Transfer

Source Server         : L
Source Server Version : 50508
Source Host           : localhost:3306
Source Database       : sample_announcement

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

Date: 2012-03-06 16:38:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tbl_announcement`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_announcement`;
CREATE TABLE `tbl_announcement` (
  `announcement_id` int(11) NOT NULL AUTO_INCREMENT,
  `announcement_title` varchar(100) DEFAULT NULL,
  `announcement_content` text,
  `dateposted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`announcement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_announcement
-- ----------------------------
INSERT INTO `tbl_announcement` VALUES ('1', 'adjbgadrgblh', '<p>lejbgldrbgwbglwebgl</p>\r\n<p>derwgw</p>\r\n<p>rg</p>\r\n<p>ggwrg</p>\r\n<p>we</p>\r\n<p>gwrg</p>\r\n<p>w</p>\r\n<p>gwg</p>', '2012-02-25 11:13:03', '1');
INSERT INTO `tbl_announcement` VALUES ('2', 'wwrgwrtwgwrgwtrw', '<p>djhgaldrgbqawjlgbwlgb</p>', '2012-02-25 11:15:14', '1');
INSERT INTO `tbl_announcement` VALUES ('3', 'Exam Schedule', '<p>qrkjgrqgkbqrglbqeglbh</p>\r\n<p>rqglwrjbgwrlbg</p>\r\n<p>qrg</p>\r\n<p>wr</p>\r\n<p>gwrqr</p>\r\n<p>g</p>\r\n<p>rg</p>\r\n<p>rqg</p>\r\n<p>qeg</p>\r\n<p>qer</p>\r\n<p>gqr</p>\r\n<p>gqrg</p>\r\n<p>qrg</p>\r\n<p>qrg</p>\r\n<p>qrg</p>\r\n<p>qr</p>\r\n<p>gr</p>\r\n<p>gq</p>\r\n<p>gq</p>\r\n<p>gq</p>', '2012-02-25 11:30:06', '1');
INSERT INTO `tbl_announcement` VALUES ('4', 'Exam Dates (Updated)', '<p>erkjbgheklrbgbg ljheq lbqegb glbqebglhbrlbhg</p>\r\n<p>grq;kjn ng\'q</p>\r\n<p>g q</p>\r\n<p>g q</p>\r\n<p>&nbsp;</p>\r\n<p>q r</p>\r\n<p>g</p>\r\n<p>q</p>\r\n<p>g qer q</p>\r\n<p>&nbsp;</p>\r\n<p>rq q</p>\r\n<p>g</p>\r\n<p>r</p>\r\n<p>&nbsp;q</p>\r\n<p>&nbsp;</p>\r\n<p>e</p>\r\n<p>q</p>\r\n<p>r</p>\r\n<p>&nbsp;q</p>\r\n<p>&nbsp;rg</p>\r\n<p>r</p>\r\n<p>qr</p>\r\n<p>&nbsp;qg</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>;lgfkn ;f \'q r qf</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>fr q</p>\r\n<p>rf</p>\r\n<p>&nbsp;qr</p>\r\n<p>fq</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;fq</p>\r\n<p>&nbsp;r</p>\r\n<p>&nbsp;f</p>\r\n<p>qf</p>\r\n<p>&nbsp;</p>\r\n<p>q</p>', '2012-02-25 12:13:27', '1');
INSERT INTO `tbl_announcement` VALUES ('5', 'Test', '<p>arrkgbhqrbg lkjb</p>', '2012-02-25 11:33:08', '1');
INSERT INTO `tbl_announcement` VALUES ('6', 'dkjbgkaq', '<p>jhqlbglqehbl ljhbq rhbqelblqhbr belblr elgel hbql hbrqbblgb</p>', '2012-02-25 11:33:22', '1');
INSERT INTO `tbl_announcement` VALUES ('7', 'qelrjqrgnq ljn ljgnlq  jqgk', '<p>qelbeqlr ljbql gbl jbrlgjqbg bqebl bljbqljgb rqlgjb qlgb qljgb qlrjb lqjb lgj g</p>', '2012-02-25 11:33:49', '1');
INSERT INTO `tbl_announcement` VALUES ('8', ';ekjn;wrng ng ;qrng;qn ;j nqen qn', '<p>qemjbqb e;rbgleb lqerb lqgblqhrbv qljebvlqeveg</p>', '2012-02-25 11:33:57', '1');
INSERT INTO `tbl_announcement` VALUES ('9', 'oahglq', '<p>lkbrelbjhqrlgbqrb l belqrbl rbglb rejge gbl jbqelgb rqljb glb grlqjereljb j bqlrgb lrjb</p>', '2012-02-25 11:41:31', '1');
INSERT INTO `tbl_announcement` VALUES ('10', 'jhrbaelh ', '<p>eljbqlb lhbg qrlhbhb qlj hb qlhb l hjqrblhjb qlhbgqlgbhllhb q</p>', '2012-02-25 11:52:00', '1');
INSERT INTO `tbl_announcement` VALUES ('11', 'jhrbaelh ', '<p>eljbqlb lhbg qrlhbhb qlj hb qlhb l hjqrblhjb ql\"hbgqlgbhllhb q</p>', '2012-03-01 03:08:14', '1');
INSERT INTO `tbl_announcement` VALUES ('12', 'Alisa', '<p><img title=\"Lovely\" src=\"http://media.giantbomb.com/uploads/0/9169/665632-asa_1p_65.jpg\" alt=\"Alisa Bosconovitch\" width=\"600\" height=\"800\"/></p>', '2012-03-01 03:05:03', '1');
