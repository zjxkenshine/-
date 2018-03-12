/*
Navicat MySQL Data Transfer

Source Server         : 123456
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : school_assistant

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2018-03-12 20:15:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `AddressId` int(11) NOT NULL AUTO_INCREMENT,
  `ClientId` int(11) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AddressId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('3', '1', '哈', '女子学院');
INSERT INTO `address` VALUES ('4', '1', '好', '山东中医药大学');

-- ----------------------------
-- Table structure for assess
-- ----------------------------
DROP TABLE IF EXISTS `assess`;
CREATE TABLE `assess` (
  `AssessId` int(11) NOT NULL AUTO_INCREMENT,
  `AssessString` varchar(255) DEFAULT NULL,
  `FromClientId` int(11) DEFAULT NULL,
  `ToClientId` int(11) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  PRIMARY KEY (`AssessId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assess
-- ----------------------------

-- ----------------------------
-- Table structure for city_info
-- ----------------------------
DROP TABLE IF EXISTS `city_info`;
CREATE TABLE `city_info` (
  `ci_id` int(10) NOT NULL COMMENT '城市ID值',
  `ci_province` int(10) NOT NULL COMMENT '省份外键',
  `ci_city` varchar(32) NOT NULL COMMENT '城市名称',
  PRIMARY KEY (`ci_id`),
  KEY `ci_province` (`ci_province`),
  CONSTRAINT `city_info_ibfk_1` FOREIGN KEY (`ci_province`) REFERENCES `province_info` (`pr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of city_info
-- ----------------------------
INSERT INTO `city_info` VALUES ('1', '1', '北京市');
INSERT INTO `city_info` VALUES ('2', '2', '上海市');
INSERT INTO `city_info` VALUES ('3', '3', '天津市');
INSERT INTO `city_info` VALUES ('4', '4', '重庆市');
INSERT INTO `city_info` VALUES ('5', '5', '大庆市');
INSERT INTO `city_info` VALUES ('6', '5', '大兴安岭地区');
INSERT INTO `city_info` VALUES ('7', '5', '哈尔滨市');
INSERT INTO `city_info` VALUES ('8', '5', '鹤岗市');
INSERT INTO `city_info` VALUES ('9', '5', '黑河市');
INSERT INTO `city_info` VALUES ('10', '5', '鸡西市');
INSERT INTO `city_info` VALUES ('11', '5', '佳木斯市');
INSERT INTO `city_info` VALUES ('12', '5', '牡丹江市');
INSERT INTO `city_info` VALUES ('13', '5', '七台河市');
INSERT INTO `city_info` VALUES ('14', '5', '齐齐哈尔市');
INSERT INTO `city_info` VALUES ('15', '5', '双鸭山市');
INSERT INTO `city_info` VALUES ('16', '5', '绥化市');
INSERT INTO `city_info` VALUES ('17', '5', '伊春市');
INSERT INTO `city_info` VALUES ('18', '6', '白城市');
INSERT INTO `city_info` VALUES ('19', '6', '白山市');
INSERT INTO `city_info` VALUES ('20', '6', '吉林市');
INSERT INTO `city_info` VALUES ('21', '6', '辽源市');
INSERT INTO `city_info` VALUES ('22', '6', '四平市');
INSERT INTO `city_info` VALUES ('23', '6', '松原市');
INSERT INTO `city_info` VALUES ('24', '6', '通化市');
INSERT INTO `city_info` VALUES ('25', '6', '延吉市');
INSERT INTO `city_info` VALUES ('26', '6', '长春市');
INSERT INTO `city_info` VALUES ('27', '7', '鞍山市');
INSERT INTO `city_info` VALUES ('28', '7', '本溪市');
INSERT INTO `city_info` VALUES ('29', '7', '朝阳市');
INSERT INTO `city_info` VALUES ('30', '7', '大连市');
INSERT INTO `city_info` VALUES ('31', '7', '丹东市');
INSERT INTO `city_info` VALUES ('32', '7', '抚顺市');
INSERT INTO `city_info` VALUES ('33', '7', '阜新市');
INSERT INTO `city_info` VALUES ('34', '7', '葫芦岛市');
INSERT INTO `city_info` VALUES ('35', '7', '锦州市');
INSERT INTO `city_info` VALUES ('36', '7', '辽阳市');
INSERT INTO `city_info` VALUES ('37', '7', '盘锦市');
INSERT INTO `city_info` VALUES ('38', '7', '沈阳市');
INSERT INTO `city_info` VALUES ('39', '7', '铁岭市');
INSERT INTO `city_info` VALUES ('40', '7', '营口市');
INSERT INTO `city_info` VALUES ('41', '8', '滨州市');
INSERT INTO `city_info` VALUES ('42', '8', '德州市');
INSERT INTO `city_info` VALUES ('43', '8', '东营市');
INSERT INTO `city_info` VALUES ('44', '8', '菏泽市');
INSERT INTO `city_info` VALUES ('45', '8', '济南市');
INSERT INTO `city_info` VALUES ('46', '8', '济宁市');
INSERT INTO `city_info` VALUES ('47', '8', '莱芜市');
INSERT INTO `city_info` VALUES ('48', '8', '聊城市');
INSERT INTO `city_info` VALUES ('49', '8', '临沂市');
INSERT INTO `city_info` VALUES ('50', '8', '青岛市');
INSERT INTO `city_info` VALUES ('51', '8', '日照市');
INSERT INTO `city_info` VALUES ('52', '8', '泰安市');
INSERT INTO `city_info` VALUES ('53', '8', '威海市');
INSERT INTO `city_info` VALUES ('54', '8', '潍坊市');
INSERT INTO `city_info` VALUES ('55', '8', '烟台市');
INSERT INTO `city_info` VALUES ('56', '8', '枣庄市');
INSERT INTO `city_info` VALUES ('57', '8', '淄博市');
INSERT INTO `city_info` VALUES ('58', '9', '大同市');
INSERT INTO `city_info` VALUES ('59', '9', '晋城市');
INSERT INTO `city_info` VALUES ('60', '9', '晋中市');
INSERT INTO `city_info` VALUES ('61', '9', '临汾市');
INSERT INTO `city_info` VALUES ('62', '9', '吕梁市');
INSERT INTO `city_info` VALUES ('63', '9', '朔州市');
INSERT INTO `city_info` VALUES ('64', '9', '太原市');
INSERT INTO `city_info` VALUES ('65', '9', '忻州市');
INSERT INTO `city_info` VALUES ('66', '9', '阳泉市');
INSERT INTO `city_info` VALUES ('67', '9', '运城市');
INSERT INTO `city_info` VALUES ('68', '9', '长治市');
INSERT INTO `city_info` VALUES ('69', '10', '安康市');
INSERT INTO `city_info` VALUES ('70', '10', '宝鸡市');
INSERT INTO `city_info` VALUES ('71', '10', '汉中市');
INSERT INTO `city_info` VALUES ('72', '10', '商洛市');
INSERT INTO `city_info` VALUES ('73', '10', '铜川市');
INSERT INTO `city_info` VALUES ('74', '10', '渭南市');
INSERT INTO `city_info` VALUES ('75', '10', '西安市');
INSERT INTO `city_info` VALUES ('76', '10', '咸阳市');
INSERT INTO `city_info` VALUES ('77', '10', '延安市');
INSERT INTO `city_info` VALUES ('78', '10', '榆林市');
INSERT INTO `city_info` VALUES ('79', '11', '保定市');
INSERT INTO `city_info` VALUES ('80', '11', '沧州市');
INSERT INTO `city_info` VALUES ('81', '11', '承德市');
INSERT INTO `city_info` VALUES ('82', '11', '邯郸市');
INSERT INTO `city_info` VALUES ('83', '11', '衡水市');
INSERT INTO `city_info` VALUES ('84', '11', '廊坊市');
INSERT INTO `city_info` VALUES ('85', '11', '秦皇岛市');
INSERT INTO `city_info` VALUES ('86', '11', '三河市');
INSERT INTO `city_info` VALUES ('87', '11', '石家庄市');
INSERT INTO `city_info` VALUES ('88', '11', '唐山市');
INSERT INTO `city_info` VALUES ('90', '11', '邢台市');
INSERT INTO `city_info` VALUES ('91', '11', '张家口市');
INSERT INTO `city_info` VALUES ('92', '12', '安阳市');
INSERT INTO `city_info` VALUES ('93', '12', '鹤壁市');
INSERT INTO `city_info` VALUES ('94', '12', '济源市');
INSERT INTO `city_info` VALUES ('95', '12', '焦作市');
INSERT INTO `city_info` VALUES ('96', '12', '开封市');
INSERT INTO `city_info` VALUES ('97', '12', '洛阳市');
INSERT INTO `city_info` VALUES ('98', '12', '漯河市');
INSERT INTO `city_info` VALUES ('99', '12', '南阳市');
INSERT INTO `city_info` VALUES ('100', '12', '平顶山市');
INSERT INTO `city_info` VALUES ('101', '12', '濮阳市');
INSERT INTO `city_info` VALUES ('102', '12', '三门峡市');
INSERT INTO `city_info` VALUES ('103', '12', '商丘市');
INSERT INTO `city_info` VALUES ('104', '12', '新乡市');
INSERT INTO `city_info` VALUES ('105', '12', '信阳市');
INSERT INTO `city_info` VALUES ('106', '12', '许昌市');
INSERT INTO `city_info` VALUES ('107', '12', '郑州市');
INSERT INTO `city_info` VALUES ('108', '12', '周口市');
INSERT INTO `city_info` VALUES ('109', '12', '驻马店市');
INSERT INTO `city_info` VALUES ('110', '13', '鄂州市');
INSERT INTO `city_info` VALUES ('111', '13', '恩施市');
INSERT INTO `city_info` VALUES ('112', '13', '黄冈市');
INSERT INTO `city_info` VALUES ('113', '13', '黄石市');
INSERT INTO `city_info` VALUES ('114', '13', '荆门市');
INSERT INTO `city_info` VALUES ('115', '13', '荆州市');
INSERT INTO `city_info` VALUES ('116', '13', '潜江市');
INSERT INTO `city_info` VALUES ('117', '13', '十堰市');
INSERT INTO `city_info` VALUES ('118', '13', '随州市');
INSERT INTO `city_info` VALUES ('119', '13', '天门市');
INSERT INTO `city_info` VALUES ('120', '13', '武汉市');
INSERT INTO `city_info` VALUES ('121', '13', '仙桃市');
INSERT INTO `city_info` VALUES ('122', '13', '咸宁市');
INSERT INTO `city_info` VALUES ('123', '13', '襄阳市');
INSERT INTO `city_info` VALUES ('124', '13', '孝感市');
INSERT INTO `city_info` VALUES ('125', '13', '宜昌市');
INSERT INTO `city_info` VALUES ('126', '14', '常德市');
INSERT INTO `city_info` VALUES ('127', '14', '郴州市');
INSERT INTO `city_info` VALUES ('128', '14', '衡阳市');
INSERT INTO `city_info` VALUES ('129', '14', '怀化市');
INSERT INTO `city_info` VALUES ('130', '14', '吉首市');
INSERT INTO `city_info` VALUES ('131', '14', '娄底市');
INSERT INTO `city_info` VALUES ('132', '14', '邵阳市');
INSERT INTO `city_info` VALUES ('133', '14', '湘潭市');
INSERT INTO `city_info` VALUES ('134', '14', '益阳市');
INSERT INTO `city_info` VALUES ('135', '14', '永州市');
INSERT INTO `city_info` VALUES ('136', '14', '岳阳市');
INSERT INTO `city_info` VALUES ('137', '14', '张家界市');
INSERT INTO `city_info` VALUES ('138', '14', '长沙市');
INSERT INTO `city_info` VALUES ('139', '14', '株洲市');
INSERT INTO `city_info` VALUES ('140', '15', '海口市');
INSERT INTO `city_info` VALUES ('141', '15', '琼海市');
INSERT INTO `city_info` VALUES ('142', '15', '三亚市');
INSERT INTO `city_info` VALUES ('143', '15', '文昌市');
INSERT INTO `city_info` VALUES ('144', '15', '五指山市');
INSERT INTO `city_info` VALUES ('145', '16', '常州市');
INSERT INTO `city_info` VALUES ('146', '16', '淮安市');
INSERT INTO `city_info` VALUES ('147', '16', '连云港市');
INSERT INTO `city_info` VALUES ('148', '16', '南京市');
INSERT INTO `city_info` VALUES ('149', '16', '南通市');
INSERT INTO `city_info` VALUES ('150', '16', '苏州市');
INSERT INTO `city_info` VALUES ('151', '16', '泰州市');
INSERT INTO `city_info` VALUES ('152', '16', '无锡市');
INSERT INTO `city_info` VALUES ('153', '16', '宿迁市');
INSERT INTO `city_info` VALUES ('154', '16', '徐州市');
INSERT INTO `city_info` VALUES ('155', '16', '盐城市');
INSERT INTO `city_info` VALUES ('156', '16', '扬州市');
INSERT INTO `city_info` VALUES ('157', '16', '镇江市');
INSERT INTO `city_info` VALUES ('158', '17', '抚州市');
INSERT INTO `city_info` VALUES ('159', '17', '赣州市');
INSERT INTO `city_info` VALUES ('160', '17', '吉安市');
INSERT INTO `city_info` VALUES ('161', '17', '景德镇市');
INSERT INTO `city_info` VALUES ('162', '17', '九江市');
INSERT INTO `city_info` VALUES ('163', '17', '南昌市');
INSERT INTO `city_info` VALUES ('164', '17', '萍乡市');
INSERT INTO `city_info` VALUES ('165', '17', '上饶市');
INSERT INTO `city_info` VALUES ('166', '17', '新余市');
INSERT INTO `city_info` VALUES ('167', '17', '宜春市');
INSERT INTO `city_info` VALUES ('168', '17', '鹰潭市');
INSERT INTO `city_info` VALUES ('169', '18', '潮州市');
INSERT INTO `city_info` VALUES ('170', '18', '东莞市');
INSERT INTO `city_info` VALUES ('171', '18', '佛山市');
INSERT INTO `city_info` VALUES ('172', '18', '广州市');
INSERT INTO `city_info` VALUES ('173', '18', '河源市');
INSERT INTO `city_info` VALUES ('174', '18', '惠州市');
INSERT INTO `city_info` VALUES ('175', '18', '江门市');
INSERT INTO `city_info` VALUES ('176', '18', '揭阳市');
INSERT INTO `city_info` VALUES ('177', '18', '茂名市');
INSERT INTO `city_info` VALUES ('178', '18', '梅州市');
INSERT INTO `city_info` VALUES ('179', '18', '清远市');
INSERT INTO `city_info` VALUES ('180', '18', '汕头市');
INSERT INTO `city_info` VALUES ('181', '18', '汕尾市');
INSERT INTO `city_info` VALUES ('182', '18', '韶关市');
INSERT INTO `city_info` VALUES ('183', '18', '深圳市');
INSERT INTO `city_info` VALUES ('184', '18', '阳江市');
INSERT INTO `city_info` VALUES ('185', '18', '云浮市');
INSERT INTO `city_info` VALUES ('186', '18', '湛江市');
INSERT INTO `city_info` VALUES ('187', '18', '肇庆市');
INSERT INTO `city_info` VALUES ('188', '18', '中山市');
INSERT INTO `city_info` VALUES ('189', '18', '珠海市');
INSERT INTO `city_info` VALUES ('190', '19', '百色市');
INSERT INTO `city_info` VALUES ('191', '19', '北海市');
INSERT INTO `city_info` VALUES ('192', '19', '崇左市');
INSERT INTO `city_info` VALUES ('193', '19', '贵港市');
INSERT INTO `city_info` VALUES ('194', '19', '桂林市');
INSERT INTO `city_info` VALUES ('195', '19', '河池市');
INSERT INTO `city_info` VALUES ('196', '19', '贺州市');
INSERT INTO `city_info` VALUES ('197', '19', '柳州市');
INSERT INTO `city_info` VALUES ('198', '19', '南宁市');
INSERT INTO `city_info` VALUES ('199', '19', '钦州市');
INSERT INTO `city_info` VALUES ('200', '19', '梧州市');
INSERT INTO `city_info` VALUES ('201', '19', '玉林市');
INSERT INTO `city_info` VALUES ('202', '20', '保山市');
INSERT INTO `city_info` VALUES ('203', '20', '楚雄市');
INSERT INTO `city_info` VALUES ('204', '20', '大理市');
INSERT INTO `city_info` VALUES ('205', '20', '德宏州');
INSERT INTO `city_info` VALUES ('206', '20', '个旧市');
INSERT INTO `city_info` VALUES ('207', '20', '景洪市');
INSERT INTO `city_info` VALUES ('208', '20', '昆明市');
INSERT INTO `city_info` VALUES ('209', '20', '丽江市');
INSERT INTO `city_info` VALUES ('210', '20', '临沧市');
INSERT INTO `city_info` VALUES ('211', '20', '蒙自市');
INSERT INTO `city_info` VALUES ('212', '20', '普洱市');
INSERT INTO `city_info` VALUES ('213', '20', '曲靖市');
INSERT INTO `city_info` VALUES ('214', '20', '文山州');
INSERT INTO `city_info` VALUES ('215', '20', '玉溪市');
INSERT INTO `city_info` VALUES ('216', '20', '昭通市');
INSERT INTO `city_info` VALUES ('217', '21', '安顺市');
INSERT INTO `city_info` VALUES ('218', '21', '毕节市');
INSERT INTO `city_info` VALUES ('219', '21', '都匀市');
INSERT INTO `city_info` VALUES ('220', '21', '贵阳市');
INSERT INTO `city_info` VALUES ('221', '21', '凯里市');
INSERT INTO `city_info` VALUES ('222', '21', '六盘水市');
INSERT INTO `city_info` VALUES ('223', '21', '黔南州');
INSERT INTO `city_info` VALUES ('224', '21', '铜仁市');
INSERT INTO `city_info` VALUES ('225', '21', '兴义市');
INSERT INTO `city_info` VALUES ('226', '21', '遵义市');
INSERT INTO `city_info` VALUES ('227', '22', '巴中市');
INSERT INTO `city_info` VALUES ('228', '22', '成都市');
INSERT INTO `city_info` VALUES ('229', '22', '达州市');
INSERT INTO `city_info` VALUES ('230', '22', '德阳市');
INSERT INTO `city_info` VALUES ('231', '22', '甘孜州');
INSERT INTO `city_info` VALUES ('232', '22', '广安市');
INSERT INTO `city_info` VALUES ('233', '22', '广汉市');
INSERT INTO `city_info` VALUES ('234', '22', '广元市');
INSERT INTO `city_info` VALUES ('235', '22', '乐山市');
INSERT INTO `city_info` VALUES ('236', '22', '泸州市');
INSERT INTO `city_info` VALUES ('237', '22', '眉山市');
INSERT INTO `city_info` VALUES ('238', '22', '绵阳市');
INSERT INTO `city_info` VALUES ('239', '22', '南充市');
INSERT INTO `city_info` VALUES ('240', '22', '内江市');
INSERT INTO `city_info` VALUES ('241', '22', '攀枝花市');
INSERT INTO `city_info` VALUES ('242', '22', '遂宁市');
INSERT INTO `city_info` VALUES ('243', '22', '汶川县');
INSERT INTO `city_info` VALUES ('244', '22', '西昌市');
INSERT INTO `city_info` VALUES ('245', '22', '雅安市');
INSERT INTO `city_info` VALUES ('246', '22', '宜宾市');
INSERT INTO `city_info` VALUES ('247', '22', '资阳市');
INSERT INTO `city_info` VALUES ('248', '22', '自贡市');
INSERT INTO `city_info` VALUES ('249', '23', '阿拉善盟');
INSERT INTO `city_info` VALUES ('250', '23', '巴彦淖尔市');
INSERT INTO `city_info` VALUES ('251', '23', '包头市');
INSERT INTO `city_info` VALUES ('252', '23', '赤峰市');
INSERT INTO `city_info` VALUES ('253', '23', '鄂尔多斯市');
INSERT INTO `city_info` VALUES ('254', '23', '呼和浩特市');
INSERT INTO `city_info` VALUES ('255', '23', '呼伦贝尔市');
INSERT INTO `city_info` VALUES ('256', '23', '通辽市');
INSERT INTO `city_info` VALUES ('257', '23', '乌海市');
INSERT INTO `city_info` VALUES ('258', '23', '乌兰察布市');
INSERT INTO `city_info` VALUES ('259', '23', '锡林郭勒盟');
INSERT INTO `city_info` VALUES ('260', '23', '兴安盟');
INSERT INTO `city_info` VALUES ('261', '24', '固原市');
INSERT INTO `city_info` VALUES ('262', '24', '石嘴山市');
INSERT INTO `city_info` VALUES ('263', '24', '吴忠市');
INSERT INTO `city_info` VALUES ('264', '24', '银川市');
INSERT INTO `city_info` VALUES ('265', '25', '白银市');
INSERT INTO `city_info` VALUES ('266', '25', '定西市');
INSERT INTO `city_info` VALUES ('267', '25', '甘南州');
INSERT INTO `city_info` VALUES ('268', '25', '嘉峪关市');
INSERT INTO `city_info` VALUES ('269', '25', '金昌市');
INSERT INTO `city_info` VALUES ('270', '25', '酒泉市');
INSERT INTO `city_info` VALUES ('271', '25', '兰州市');
INSERT INTO `city_info` VALUES ('272', '25', '陇南市');
INSERT INTO `city_info` VALUES ('273', '25', '平凉市');
INSERT INTO `city_info` VALUES ('274', '25', '庆阳市');
INSERT INTO `city_info` VALUES ('275', '25', '天水市');
INSERT INTO `city_info` VALUES ('276', '25', '武威市');
INSERT INTO `city_info` VALUES ('277', '25', '张掖市');
INSERT INTO `city_info` VALUES ('278', '26', '西宁市');
INSERT INTO `city_info` VALUES ('279', '27', '拉萨市');
INSERT INTO `city_info` VALUES ('280', '27', '咸阳市');
INSERT INTO `city_info` VALUES ('281', '28', '阿克苏市');
INSERT INTO `city_info` VALUES ('282', '28', '阿拉尔市');
INSERT INTO `city_info` VALUES ('283', '28', '昌吉市');
INSERT INTO `city_info` VALUES ('284', '28', '和田市');
INSERT INTO `city_info` VALUES ('285', '28', '喀什地区');
INSERT INTO `city_info` VALUES ('286', '28', '克拉玛依市');
INSERT INTO `city_info` VALUES ('287', '28', '库尔勒市');
INSERT INTO `city_info` VALUES ('288', '28', '奎屯市');
INSERT INTO `city_info` VALUES ('289', '28', '石河子市');
INSERT INTO `city_info` VALUES ('290', '28', '乌鲁木齐市');
INSERT INTO `city_info` VALUES ('291', '28', '伊犁州');
INSERT INTO `city_info` VALUES ('292', '28', '伊宁市');
INSERT INTO `city_info` VALUES ('293', '29', '安庆市');
INSERT INTO `city_info` VALUES ('294', '29', '蚌埠市');
INSERT INTO `city_info` VALUES ('295', '29', '亳州市');
INSERT INTO `city_info` VALUES ('296', '29', '池州市');
INSERT INTO `city_info` VALUES ('297', '29', '滁州市');
INSERT INTO `city_info` VALUES ('298', '29', '阜阳市');
INSERT INTO `city_info` VALUES ('299', '29', '合肥市');
INSERT INTO `city_info` VALUES ('300', '29', '淮北市');
INSERT INTO `city_info` VALUES ('301', '29', '淮南市');
INSERT INTO `city_info` VALUES ('302', '29', '黄山市');
INSERT INTO `city_info` VALUES ('303', '29', '六安市');
INSERT INTO `city_info` VALUES ('304', '29', '马鞍山市');
INSERT INTO `city_info` VALUES ('305', '29', '铜陵市');
INSERT INTO `city_info` VALUES ('306', '29', '芜湖市');
INSERT INTO `city_info` VALUES ('307', '29', '宿州市');
INSERT INTO `city_info` VALUES ('308', '29', '宣城市');
INSERT INTO `city_info` VALUES ('309', '30', '杭州市');
INSERT INTO `city_info` VALUES ('310', '30', '湖州市');
INSERT INTO `city_info` VALUES ('311', '30', '嘉兴市');
INSERT INTO `city_info` VALUES ('312', '30', '金华市');
INSERT INTO `city_info` VALUES ('313', '30', '丽水市');
INSERT INTO `city_info` VALUES ('314', '30', '宁波市');
INSERT INTO `city_info` VALUES ('315', '30', '衢州市');
INSERT INTO `city_info` VALUES ('316', '30', '绍兴市');
INSERT INTO `city_info` VALUES ('317', '30', '台州市');
INSERT INTO `city_info` VALUES ('318', '30', '温州市');
INSERT INTO `city_info` VALUES ('319', '30', '舟山市');
INSERT INTO `city_info` VALUES ('320', '31', '福州市');
INSERT INTO `city_info` VALUES ('321', '31', '龙岩市');
INSERT INTO `city_info` VALUES ('322', '31', '南平市');
INSERT INTO `city_info` VALUES ('323', '31', '宁德市');
INSERT INTO `city_info` VALUES ('324', '31', '莆田市');
INSERT INTO `city_info` VALUES ('325', '31', '泉州市');
INSERT INTO `city_info` VALUES ('326', '31', '三明市');
INSERT INTO `city_info` VALUES ('327', '31', '厦门市');
INSERT INTO `city_info` VALUES ('328', '31', '漳州市');

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `ClientId` int(11) NOT NULL AUTO_INCREMENT,
  `ClientCode` varchar(255) DEFAULT NULL,
  `ClientName` varchar(255) DEFAULT NULL,
  `RealName` varchar(255) DEFAULT '',
  `Idcard` varchar(255) DEFAULT '',
  `Tel` varchar(255) DEFAULT '',
  `E_mail` varchar(255) DEFAULT NULL,
  `Picture` varchar(255) DEFAULT '',
  `Province` varchar(255) DEFAULT '',
  `City` varchar(255) DEFAULT '',
  `School` varchar(255) DEFAULT '',
  `UseStatus` varchar(255) DEFAULT '1',
  `Status` varchar(255) DEFAULT '0',
  `RegisterTime` datetime DEFAULT NULL,
  `RegisterDate` date DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `TruhCode` int(11) DEFAULT '100',
  PRIMARY KEY (`ClientId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('1', '111111', '123456789', '周建新', '332502199705262414', '17854116993', '1754294529@qq.com', '111', '山东', '济南市', '齐鲁工业大学', '1', '1', '2017-05-27 00:00:00', '2017-05-27', '2017-06-07 02:20:00', '111111', '1000');
INSERT INTO `client` VALUES ('15', '5db1ab5a', '啦啦啦', null, null, null, '17854116993@qq.com', null, null, null, null, '1', '0', '2017-05-31 16:49:03', '2017-05-31', '2017-05-31 16:49:03', '123456', '100');
INSERT INTO `client` VALUES ('16', '5dd77d27', '123', null, null, null, '1091814109@qq.com', null, null, null, null, '1', '0', '2017-05-31 17:30:22', '2017-05-31', '2017-05-31 17:30:22', '123123', '100');
INSERT INTO `client` VALUES ('17', '832ab2fb', '王子玉', '王子玉', '222222222222222222', '17854111234', '718076878@qq.com', null, '山东', '济南市', '齐鲁工业大学', '1', '1', '2017-06-07 23:27:12', '2017-06-07', '2017-06-08 18:12:15', '123123', '100');
INSERT INTO `client` VALUES ('20', '111111', '666', '周建新', '332502199705262414', '17854116666', '675895354@qq.com', null, '山东', '济南市', '齐鲁工业大学', '1', '1', '2017-06-08 20:40:44', '2017-06-08', '2017-06-08 20:49:09', '111111', '100');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `CollectId` int(11) NOT NULL AUTO_INCREMENT,
  `ClientId` int(11) DEFAULT NULL,
  `GoodsId` int(11) DEFAULT NULL,
  `CollectTime` datetime DEFAULT NULL,
  PRIMARY KEY (`CollectId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES ('2', '1', '3', '2017-06-01 18:32:41');
INSERT INTO `collect` VALUES ('3', '1', '2', '2017-06-02 06:11:49');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `GoodsId` int(11) NOT NULL AUTO_INCREMENT,
  `GoodsName` varchar(255) DEFAULT NULL,
  `TypeId` int(11) DEFAULT NULL,
  `ClientId` int(11) DEFAULT NULL,
  `Price` varchar(255) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `AddDay` date DEFAULT NULL,
  `Discripe` varchar(255) DEFAULT NULL,
  `Picture` varchar(255) DEFAULT NULL,
  `Number` int(11) DEFAULT '1',
  `SellStatus` varchar(255) DEFAULT '1',
  `Location` varchar(255) DEFAULT NULL,
  `ColletNum` int(11) DEFAULT '0',
  `Status` varchar(255) DEFAULT '1',
  PRIMARY KEY (`GoodsId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '高数书', '12', '15', '13', '2015-05-27 00:00:00', '2015-05-27', '一本高数书', '11', '1', '1', '齐鲁工业大学', '0', '1');
INSERT INTO `goods` VALUES ('2', '书桌', '9', '15', '100', '2017-06-01 02:34:13', '2017-06-01', '112233', '/new_school_assistant/hou/upload/image/20170601/20170601021411_163.jpg', '1', '1', '齐鲁工大', '0', '1');
INSERT INTO `goods` VALUES ('3', '不知道是啥', '17', '15', '12', '2017-06-01 18:21:59', '2017-06-01', '111111', '/new_school_assistant/hou/upload/image/20170601/20170601182105_985.jpg', '1', '1', '紫薇阁', '0', '1');
INSERT INTO `goods` VALUES ('4', 'AAA', '10', '15', '10.0', '2017-06-08 16:22:51', '2017-06-08', '', '', '1', '1', 'AAA', '0', '1');
INSERT INTO `goods` VALUES ('5', '小包包', '5', '17', '20', '2017-06-08 18:12:54', '2017-06-08', '', '/new_school_assistant/hou/upload/image/20170607/20170607203038_539.jpg', '1', '1', '齐鲁工业大学1', '0', '1');
INSERT INTO `goods` VALUES ('6', '鼠标', '7', '17', '55.20', '2017-06-08 18:59:31', '2017-06-08', '', '/new_school_assistant/hou/upload/image/20170608/20170608185928_325.jpg', '1', '1', '齐鲁工大', '0', '1');
INSERT INTO `goods` VALUES ('7', '某裤子', '1', '15', '30', '2017-06-08 19:00:31', '2017-06-08', '', '/new_school_assistant/hou/upload/image/20170608/20170608190029_890.jpg', '1', '0', '交通学院', '0', '1');
INSERT INTO `goods` VALUES ('8', '小皮鞋', '3', '15', '70', '2017-06-08 19:01:51', '2017-06-08', '小皮鞋', '/new_school_assistant/hou/upload/image/20170608/20170608190124_840.jpg', '1', '0', '山东中医药大学', '0', '1');
INSERT INTO `goods` VALUES ('9', '自行车', '10', '17', '160', '2017-06-08 19:03:19', '2017-06-08', '自行车', '/new_school_assistant/hou/upload/image/20170608/20170608190233_628.jpg', '1', '1', '紫薇阁', '0', '1');
INSERT INTO `goods` VALUES ('10', '药物', '14', '15', '20', '2017-06-08 19:04:18', '2017-06-08', 'sss', '/new_school_assistant/hou/upload/image/20170608/20170608190413_643.jpg', '1', '1', '齐鲁工业大学1', '0', '1');
INSERT INTO `goods` VALUES ('11', '手机', '6', '20', '1000', '2017-06-08 20:50:02', '2017-06-08', '123123', '/new_school_assistant/hou/upload/image/20170608/20170608204942_771.jpg', '1', '0', '齐鲁工业大学1', '0', '1');

-- ----------------------------
-- Table structure for goodslatequery
-- ----------------------------
DROP TABLE IF EXISTS `goodslatequery`;
CREATE TABLE `goodslatequery` (
  `QueryId` int(11) NOT NULL AUTO_INCREMENT,
  `QueryString` varchar(255) DEFAULT NULL,
  `ClientId` int(11) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  PRIMARY KEY (`QueryId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodslatequery
-- ----------------------------
INSERT INTO `goodslatequery` VALUES ('1', '哈哈', '1', '2017-06-04 11:59:02');
INSERT INTO `goodslatequery` VALUES ('2', '书', '1', '2017-06-04 11:48:52');
INSERT INTO `goodslatequery` VALUES ('3', '书', '1', '2017-06-04 11:48:54');
INSERT INTO `goodslatequery` VALUES ('4', '自行车', '20', '2017-06-08 20:46:50');
INSERT INTO `goodslatequery` VALUES ('5', '男装', '20', '2017-06-08 20:47:14');

-- ----------------------------
-- Table structure for goodsquery
-- ----------------------------
DROP TABLE IF EXISTS `goodsquery`;
CREATE TABLE `goodsquery` (
  `QueryId` int(11) NOT NULL AUTO_INCREMENT,
  `GoodsTypeId` int(11) DEFAULT NULL,
  `ClientId` int(11) DEFAULT NULL,
  `QueryNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`QueryId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodsquery
-- ----------------------------
INSERT INTO `goodsquery` VALUES ('1', '12', '1', '41');
INSERT INTO `goodsquery` VALUES ('2', '2', '1', '4');
INSERT INTO `goodsquery` VALUES ('3', '5', '1', '1');
INSERT INTO `goodsquery` VALUES ('4', '17', '1', '15');
INSERT INTO `goodsquery` VALUES ('5', '1', '1', '7');
INSERT INTO `goodsquery` VALUES ('6', '9', '1', '3');
INSERT INTO `goodsquery` VALUES ('7', '16', '1', '1');
INSERT INTO `goodsquery` VALUES ('8', '3', '1', '2');
INSERT INTO `goodsquery` VALUES ('9', '6', '1', '1');
INSERT INTO `goodsquery` VALUES ('10', '1', '20', '1');
INSERT INTO `goodsquery` VALUES ('11', '7', '20', '1');

-- ----------------------------
-- Table structure for goodstype
-- ----------------------------
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype` (
  `TypeId` int(11) NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodstype
-- ----------------------------
INSERT INTO `goodstype` VALUES ('1', '男装');
INSERT INTO `goodstype` VALUES ('2', '女装');
INSERT INTO `goodstype` VALUES ('3', '鞋子');
INSERT INTO `goodstype` VALUES ('4', '饰品');
INSERT INTO `goodstype` VALUES ('5', '箱包');
INSERT INTO `goodstype` VALUES ('6', '手机及配件');
INSERT INTO `goodstype` VALUES ('7', '电脑及配件');
INSERT INTO `goodstype` VALUES ('8', '其他电器');
INSERT INTO `goodstype` VALUES ('9', '生活用品');
INSERT INTO `goodstype` VALUES ('10', '运动器材');
INSERT INTO `goodstype` VALUES ('11', '户外用品');
INSERT INTO `goodstype` VALUES ('12', '图书');
INSERT INTO `goodstype` VALUES ('13', '食品');
INSERT INTO `goodstype` VALUES ('14', '医疗药物');
INSERT INTO `goodstype` VALUES ('15', '乐器');
INSERT INTO `goodstype` VALUES ('16', '会员卡');
INSERT INTO `goodstype` VALUES ('17', '其他二手物品');

-- ----------------------------
-- Table structure for jobcollect
-- ----------------------------
DROP TABLE IF EXISTS `jobcollect`;
CREATE TABLE `jobcollect` (
  `CollectId` int(11) NOT NULL AUTO_INCREMENT,
  `JobId` int(11) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `ClientId` int(11) DEFAULT NULL,
  PRIMARY KEY (`CollectId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobcollect
-- ----------------------------
INSERT INTO `jobcollect` VALUES ('1', '1', '2017-05-29 00:00:00', '1');

-- ----------------------------
-- Table structure for joblatequery
-- ----------------------------
DROP TABLE IF EXISTS `joblatequery`;
CREATE TABLE `joblatequery` (
  `QueryId` int(11) DEFAULT NULL,
  `JobQueryString` varchar(255) DEFAULT NULL,
  `ClientId` int(11) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of joblatequery
-- ----------------------------

-- ----------------------------
-- Table structure for jobquery
-- ----------------------------
DROP TABLE IF EXISTS `jobquery`;
CREATE TABLE `jobquery` (
  `QueryId` int(11) NOT NULL AUTO_INCREMENT,
  `ClientId` int(11) DEFAULT NULL,
  `QueryString` varchar(255) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  PRIMARY KEY (`QueryId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobquery
-- ----------------------------
INSERT INTO `jobquery` VALUES ('1', '1', '外', '2017-05-29 00:00:00');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `ManagerId` int(11) NOT NULL AUTO_INCREMENT,
  `ManagerName` varchar(255) DEFAULT NULL,
  `WorkerId` int(11) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Status` int(11) DEFAULT '0',
  `E_mail` varchar(255) DEFAULT NULL,
  `Discripe` varchar(255) DEFAULT NULL,
  `DeleteStatus` varchar(255) DEFAULT NULL,
  `RegisterTime` datetime DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Picture` varchar(255) DEFAULT NULL,
  `UseStatus` int(11) DEFAULT '0',
  PRIMARY KEY (`ManagerId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', '周建新', '1', '123456', '1', '1754294529@qq.com', '无敌', '1', '2017-05-17 17:33:48', '2017-05-23 21:09:34', '/new_school_assistant/hou/upload/image/20170525/20170525160809_650.jpg', '0');
INSERT INTO `manager` VALUES ('5', 'add', '4', '111111', '62', 'aaaa@ee.com', 'wda', '1', '2017-05-17 19:39:42', '2017-06-08 20:56:44', null, '0');
INSERT INTO `manager` VALUES ('18', '1WDA', '2', '111111', '59', '1@163.com', 'ADW', '1', '2017-05-22 16:35:43', '2017-05-22 16:35:43', '/new_school_assistant/hou/upload/image/20170525/20170525160152_983.jpg', '0');
INSERT INTO `manager` VALUES ('19', '757657', '8', '111111', '61', '1091814109@qq.com', '7557', '1', '2017-05-23 01:28:39', '2017-06-08 18:16:48', '/new_school_assistant/hou/upload/image/20170601/20170601182105_985.jpg', '0');

-- ----------------------------
-- Table structure for manageroperation
-- ----------------------------
DROP TABLE IF EXISTS `manageroperation`;
CREATE TABLE `manageroperation` (
  `OperationId` int(11) NOT NULL AUTO_INCREMENT,
  `OperationType` varchar(255) DEFAULT NULL,
  `ManagerId` int(11) DEFAULT NULL,
  `OperatList` varchar(255) DEFAULT NULL,
  `OperationTime` datetime DEFAULT NULL,
  `OperationDay` date DEFAULT NULL,
  `Discripe` varchar(255) DEFAULT '',
  PRIMARY KEY (`OperationId`)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manageroperation
-- ----------------------------
INSERT INTO `manageroperation` VALUES ('1', '登录', '1', '无', '2017-05-19 20:24:41', '2017-05-19', '登录了系统');
INSERT INTO `manageroperation` VALUES ('2', '添加', '1', '职位表', '2017-05-19 20:24:51', '2017-05-19', '添加了一条职位信息');
INSERT INTO `manageroperation` VALUES ('3', '修改', '1', '职位表', '2017-05-19 20:25:23', '2017-05-19', '修改了一条职位信息，id=9');
INSERT INTO `manageroperation` VALUES ('4', '添加', '1', '职位表', '2017-05-19 20:26:58', '2017-05-19', '添加了一条职位信息');
INSERT INTO `manageroperation` VALUES ('5', '添加', '1', '职位表', '2017-05-19 20:29:05', '2017-05-19', '添加了一条职位信息');
INSERT INTO `manageroperation` VALUES ('6', '删除', '1', '职位表', '2017-05-19 20:29:08', '2017-05-19', '删除了1条职位信息，id=11');
INSERT INTO `manageroperation` VALUES ('7', '添加', '1', '职位表', '2017-05-19 20:29:28', '2017-05-19', '添加了一条职位信息');
INSERT INTO `manageroperation` VALUES ('8', '添加', '1', '职位表', '2017-05-19 20:29:34', '2017-05-19', '添加了一条职位信息');
INSERT INTO `manageroperation` VALUES ('9', '删除', '1', '职位表', '2017-05-19 20:29:47', '2017-05-19', '删除了2条职位信息，id=12,13');
INSERT INTO `manageroperation` VALUES ('10', '删除', '1', '职位表', '2017-05-19 20:29:56', '2017-05-19', '删除了0条职位信息，id=,,');
INSERT INTO `manageroperation` VALUES ('11', '添加', '1', '员工表', '2017-05-19 20:31:17', '2017-05-19', '添加了一条员工信息');
INSERT INTO `manageroperation` VALUES ('12', '修改', '1', '员工表', '2017-05-19 20:31:40', '2017-05-19', '修改了一条员工状态以及管理员状态，id=14');
INSERT INTO `manageroperation` VALUES ('13', '修改', '1', '员工表', '2017-05-19 20:31:57', '2017-05-19', '修改了一条员工状态以及管理员状态，id=14');
INSERT INTO `manageroperation` VALUES ('14', '修改', '1', '员工表', '2017-05-19 20:32:03', '2017-05-19', '修改了一条员工信息，id=14');
INSERT INTO `manageroperation` VALUES ('15', '添加', '1', '权限表', '2017-05-19 20:32:56', '2017-05-19', '添加了一条权限信息');
INSERT INTO `manageroperation` VALUES ('16', '添加', '1', '管理员表', '2017-05-19 20:33:43', '2017-05-19', '添加了一条管理员信息');
INSERT INTO `manageroperation` VALUES ('17', '修改', '1', '管理员表', '2017-05-19 20:33:48', '2017-05-19', '修改了一条管理员信息，id=17');
INSERT INTO `manageroperation` VALUES ('18', '修改', '1', '权限表', '2017-05-19 20:34:03', '2017-05-19', '修改了一条权限信息，id=50');
INSERT INTO `manageroperation` VALUES ('19', '删除', '1', '权限表', '2017-05-19 20:34:35', '2017-05-19', '删除了1条权限信息，id=50');
INSERT INTO `manageroperation` VALUES ('20', '修改', '1', '管理员表', '2017-05-19 20:34:50', '2017-05-19', '修改了一条管理员状态，id=17');
INSERT INTO `manageroperation` VALUES ('21', '删除', '1', '管理员表', '2017-05-19 20:35:01', '2017-05-19', '删除了1条管理员信息，id=17');
INSERT INTO `manageroperation` VALUES ('22', '删除', '1', '管理员表', '2017-05-19 20:35:05', '2017-05-19', '删除了1条管理员信息，id=');
INSERT INTO `manageroperation` VALUES ('23', '删除', '1', '管理员表', '2017-05-19 20:35:24', '2017-05-19', '删除了1条管理员信息，id=');
INSERT INTO `manageroperation` VALUES ('24', '删除', '1', '管理员表', '2017-05-19 20:37:11', '2017-05-19', '删除了1条管理员信息，id=');
INSERT INTO `manageroperation` VALUES ('25', '删除', '1', '员工表', '2017-05-19 20:39:41', '2017-05-19', '删除了1条员工信息以及管理员信息，id=');
INSERT INTO `manageroperation` VALUES ('26', '修改', '1', '员工表', '2017-05-19 20:42:37', '2017-05-19', '修改了一条员工状态以及管理员状态，id=14');
INSERT INTO `manageroperation` VALUES ('27', '删除', '1', '员工表', '2017-05-19 20:42:40', '2017-05-19', '删除了1条员工信息以及管理员信息，id=14');
INSERT INTO `manageroperation` VALUES ('28', '登录', '1', '无', '2017-05-19 22:05:38', '2017-05-19', '登录了系统');
INSERT INTO `manageroperation` VALUES ('29', '登录', '1', '无', '2017-05-19 23:51:56', '2017-05-19', '登录了系统');
INSERT INTO `manageroperation` VALUES ('30', '登录', '1', '无', '2017-05-20 00:12:21', '2017-05-20', '登录了系统');
INSERT INTO `manageroperation` VALUES ('31', '登录', '1', '无', '2017-05-20 00:52:36', '2017-05-20', '登录了系统');
INSERT INTO `manageroperation` VALUES ('32', '修改', '1', '管理员表', '2017-05-20 03:10:08', '2017-05-20', '修改了一条管理员信息，id=1');
INSERT INTO `manageroperation` VALUES ('33', '修改', '1', '管理员表', '2017-05-20 03:10:11', '2017-05-20', '修改了一条管理员信息，id=1');
INSERT INTO `manageroperation` VALUES ('34', '修改', '1', '管理员表', '2017-05-20 03:40:56', '2017-05-20', '修改了一条管理员信息，id=8');
INSERT INTO `manageroperation` VALUES ('35', '修改', '1', '管理员表', '2017-05-20 04:07:00', '2017-05-20', '修改了一条管理员信息，id=1');
INSERT INTO `manageroperation` VALUES ('36', '修改', '1', '员工表', '2017-05-20 04:07:00', '2017-05-20', '修改了一条员工信息，id=1');
INSERT INTO `manageroperation` VALUES ('37', '登录', '1', '无', '2017-05-20 10:56:24', '2017-05-20', '登录了系统');
INSERT INTO `manageroperation` VALUES ('38', '修改', '1', '管理员表', '2017-05-20 11:13:30', '2017-05-20', '修改了一条管理员个人信息，id=1');
INSERT INTO `manageroperation` VALUES ('39', '修改', '1', '员工表', '2017-05-20 11:13:30', '2017-05-20', '修改了一条员工个人信息，id=1');
INSERT INTO `manageroperation` VALUES ('40', '修改', '1', '管理员表', '2017-05-20 11:15:48', '2017-05-20', '修改了一条管理员个人信息，id=1');
INSERT INTO `manageroperation` VALUES ('41', '修改', '1', '员工表', '2017-05-20 11:15:48', '2017-05-20', '修改了一条员工个人信息，id=1');
INSERT INTO `manageroperation` VALUES ('42', '修改', '1', '管理员表', '2017-05-20 11:16:01', '2017-05-20', '修改了一条管理员个人信息，id=1');
INSERT INTO `manageroperation` VALUES ('43', '修改', '1', '员工表', '2017-05-20 11:16:01', '2017-05-20', '修改了一条员工个人信息，id=1');
INSERT INTO `manageroperation` VALUES ('44', '登录', '1', '无', '2017-05-20 14:39:12', '2017-05-20', '登录了系统');
INSERT INTO `manageroperation` VALUES ('45', '修改', '1', '管理员表', '2017-05-20 14:56:32', '2017-05-20', '修改了一条管理员个人信息，id=1');
INSERT INTO `manageroperation` VALUES ('46', '修改', '1', '员工表', '2017-05-20 14:56:32', '2017-05-20', '修改了一条员工个人信息，id=1');
INSERT INTO `manageroperation` VALUES ('47', '登录', '1', '无', '2017-05-20 17:27:54', '2017-05-20', '登录了系统');
INSERT INTO `manageroperation` VALUES ('48', '登录', '1', '无', '2017-05-20 23:57:33', '2017-05-20', '登录了系统');
INSERT INTO `manageroperation` VALUES ('49', '登录', '1', '无', '2017-05-21 09:35:30', '2017-05-21', '登录了系统');
INSERT INTO `manageroperation` VALUES ('50', '登录', '1', '无', '2017-05-21 09:36:22', '2017-05-21', '登录了系统');
INSERT INTO `manageroperation` VALUES ('51', '登录', '1', '无', '2017-05-21 18:17:48', '2017-05-21', '登录了系统');
INSERT INTO `manageroperation` VALUES ('52', '登录', '1', '无', '2017-05-21 18:19:33', '2017-05-21', '登录了系统');
INSERT INTO `manageroperation` VALUES ('53', '登录', '1', '无', '2017-05-21 18:22:19', '2017-05-21', '登录了系统');
INSERT INTO `manageroperation` VALUES ('54', '添加', '1', '权限表', '2017-05-21 21:26:13', '2017-05-21', '添加了一条权限信息');
INSERT INTO `manageroperation` VALUES ('55', '添加', '1', '权限表', '2017-05-21 21:32:57', '2017-05-21', '添加了一条权限信息');
INSERT INTO `manageroperation` VALUES ('56', '添加', '1', '权限表', '2017-05-21 21:34:58', '2017-05-21', '添加了一条权限信息');
INSERT INTO `manageroperation` VALUES ('57', '添加', '1', '权限表', '2017-05-21 21:35:44', '2017-05-21', '添加了一条权限信息');
INSERT INTO `manageroperation` VALUES ('58', '添加', '1', '权限表', '2017-05-21 21:46:00', '2017-05-21', '添加了一条权限信息');
INSERT INTO `manageroperation` VALUES ('59', '删除', '1', '权限表', '2017-05-21 21:46:19', '2017-05-21', '删除了一条权限信息,id=55');
INSERT INTO `manageroperation` VALUES ('60', '添加', '1', '权限表', '2017-05-21 22:12:30', '2017-05-21', '添加了一条权限信息');
INSERT INTO `manageroperation` VALUES ('61', '删除', '1', '权限表', '2017-05-21 22:12:38', '2017-05-21', '删除了一条权限信息,id=56');
INSERT INTO `manageroperation` VALUES ('62', '修改', '1', '权限表', '2017-05-21 22:23:15', '2017-05-21', '修改了一条权限信息，id=1');
INSERT INTO `manageroperation` VALUES ('63', '修改', '1', '权限表', '2017-05-21 22:34:40', '2017-05-21', '修改了一条权限信息，id=2');
INSERT INTO `manageroperation` VALUES ('64', '修改', '1', '权限表', '2017-05-21 22:34:45', '2017-05-21', '修改了一条权限信息，id=2');
INSERT INTO `manageroperation` VALUES ('65', '修改', '1', '权限表', '2017-05-21 22:34:56', '2017-05-21', '修改了一条权限信息，id=2');
INSERT INTO `manageroperation` VALUES ('66', '修改', '1', '权限表', '2017-05-21 22:35:03', '2017-05-21', '修改了一条权限信息，id=3');
INSERT INTO `manageroperation` VALUES ('67', '添加', '1', '权限表', '2017-05-21 22:53:38', '2017-05-21', '添加了一条权限信息');
INSERT INTO `manageroperation` VALUES ('68', '删除', '1', '权限表', '2017-05-21 22:53:56', '2017-05-21', '删除了2条权限信息，id=2,57');
INSERT INTO `manageroperation` VALUES ('69', '添加', '1', '权限表', '2017-05-21 22:54:53', '2017-05-21', '添加了一条权限信息');
INSERT INTO `manageroperation` VALUES ('70', '删除', '1', '权限表', '2017-05-21 23:04:43', '2017-05-21', '删除了2条权限信息，id=,58');
INSERT INTO `manageroperation` VALUES ('71', '登录', '1', '无', '2017-05-22 09:54:36', '2017-05-22', '登录了系统');
INSERT INTO `manageroperation` VALUES ('72', '登录', '1', '无', '2017-05-22 10:47:06', '2017-05-22', '登录了系统');
INSERT INTO `manageroperation` VALUES ('73', '登录', '1', '无', '2017-05-22 12:48:35', '2017-05-22', '登录了系统');
INSERT INTO `manageroperation` VALUES ('74', '修改', '1', '管理员表', '2017-05-22 14:17:31', '2017-05-22', '修改了一条管理员状态，id=13');
INSERT INTO `manageroperation` VALUES ('75', '修改', '1', '管理员表', '2017-05-22 14:18:39', '2017-05-22', '修改了一条管理员状态，id=13');
INSERT INTO `manageroperation` VALUES ('76', '修改', '1', '管理员表', '2017-05-22 14:18:42', '2017-05-22', '修改了一条管理员状态，id=13');
INSERT INTO `manageroperation` VALUES ('77', '修改', '1', '管理员表', '2017-05-22 14:18:45', '2017-05-22', '修改了一条管理员状态，id=13');
INSERT INTO `manageroperation` VALUES ('78', '修改', '1', '管理员表', '2017-05-22 14:18:49', '2017-05-22', '修改了一条管理员状态，id=13');
INSERT INTO `manageroperation` VALUES ('79', '修改', '1', '管理员表', '2017-05-22 14:19:10', '2017-05-22', '修改了一条管理员状态，id=1');
INSERT INTO `manageroperation` VALUES ('80', '修改', '1', '管理员表', '2017-05-22 14:21:38', '2017-05-22', '修改了一条管理员状态，id=13');
INSERT INTO `manageroperation` VALUES ('81', '修改', '1', '管理员表', '2017-05-22 14:21:41', '2017-05-22', '修改了一条管理员状态，id=13');
INSERT INTO `manageroperation` VALUES ('82', '修改', '1', '管理员表', '2017-05-22 14:21:45', '2017-05-22', '修改了一条管理员状态，id=13');
INSERT INTO `manageroperation` VALUES ('83', '修改', '1', '管理员表', '2017-05-22 14:21:48', '2017-05-22', '修改了一条管理员状态，id=13');
INSERT INTO `manageroperation` VALUES ('84', '修改', '1', '管理员表', '2017-05-22 14:21:51', '2017-05-22', '修改了一条管理员状态，id=13');
INSERT INTO `manageroperation` VALUES ('85', '修改', '1', '管理员表', '2017-05-22 14:21:55', '2017-05-22', '修改了一条管理员状态，id=13');
INSERT INTO `manageroperation` VALUES ('86', '修改', '1', '管理员表', '2017-05-22 14:21:57', '2017-05-22', '修改了一条管理员状态，id=13');
INSERT INTO `manageroperation` VALUES ('87', '修改', '1', '权限表', '2017-05-22 14:22:16', '2017-05-22', '修改了一条权限信息，id=1');
INSERT INTO `manageroperation` VALUES ('88', '修改', '1', '管理员表', '2017-05-22 14:32:54', '2017-05-22', '修改了一条管理员状态，id=13');
INSERT INTO `manageroperation` VALUES ('89', '修改', '1', '管理员表', '2017-05-22 14:32:57', '2017-05-22', '修改了一条管理员状态，id=13');
INSERT INTO `manageroperation` VALUES ('90', '修改', '1', '管理员表', '2017-05-22 14:33:03', '2017-05-22', '修改了一条管理员状态，id=13');
INSERT INTO `manageroperation` VALUES ('91', '修改', '1', '管理员表', '2017-05-22 14:33:05', '2017-05-22', '修改了一条管理员状态，id=13');
INSERT INTO `manageroperation` VALUES ('92', '修改', '1', '管理员表', '2017-05-22 14:33:10', '2017-05-22', '修改了一条管理员状态，id=13');
INSERT INTO `manageroperation` VALUES ('93', '修改', '1', '管理员表', '2017-05-22 14:33:14', '2017-05-22', '修改了一条管理员状态，id=1');
INSERT INTO `manageroperation` VALUES ('94', '修改', '1', '管理员表', '2017-05-22 14:33:20', '2017-05-22', '修改了一条管理员状态，id=1');
INSERT INTO `manageroperation` VALUES ('95', '修改', '1', '管理员表', '2017-05-22 14:33:23', '2017-05-22', '修改了一条管理员状态，id=13');
INSERT INTO `manageroperation` VALUES ('96', '修改', '1', '管理员表', '2017-05-22 14:33:51', '2017-05-22', '修改了一条管理员状态，id=1');
INSERT INTO `manageroperation` VALUES ('97', '修改', '1', '管理员表', '2017-05-22 14:36:31', '2017-05-22', '修改了一条管理员状态，id=13');
INSERT INTO `manageroperation` VALUES ('98', '修改', '1', '管理员表', '2017-05-22 14:36:33', '2017-05-22', '修改了一条管理员状态，id=8');
INSERT INTO `manageroperation` VALUES ('99', '修改', '1', '管理员表', '2017-05-22 14:36:37', '2017-05-22', '修改了一条管理员状态，id=13');
INSERT INTO `manageroperation` VALUES ('100', '修改', '1', '管理员表', '2017-05-22 14:36:41', '2017-05-22', '修改了一条管理员状态，id=5');
INSERT INTO `manageroperation` VALUES ('101', '修改', '1', '管理员表', '2017-05-22 14:36:41', '2017-05-22', '修改了一条管理员状态，id=5');
INSERT INTO `manageroperation` VALUES ('102', '修改', '1', '管理员表', '2017-05-22 14:36:44', '2017-05-22', '修改了一条管理员状态，id=5');
INSERT INTO `manageroperation` VALUES ('103', '修改', '1', '管理员表', '2017-05-22 14:36:46', '2017-05-22', '修改了一条管理员状态，id=8');
INSERT INTO `manageroperation` VALUES ('104', '修改', '1', '管理员表', '2017-05-22 14:36:49', '2017-05-22', '修改了一条管理员状态，id=13');
INSERT INTO `manageroperation` VALUES ('105', '修改', '1', '管理员表', '2017-05-22 14:37:08', '2017-05-22', '修改了一条管理员状态，id=13');
INSERT INTO `manageroperation` VALUES ('106', '修改', '1', '管理员表', '2017-05-22 14:37:13', '2017-05-22', '修改了一条管理员状态，id=8');
INSERT INTO `manageroperation` VALUES ('107', '修改', '1', '管理员表', '2017-05-22 14:37:33', '2017-05-22', '修改了一条管理员状态，id=8');
INSERT INTO `manageroperation` VALUES ('108', '修改', '1', '管理员表', '2017-05-22 14:37:36', '2017-05-22', '修改了一条管理员状态，id=8');
INSERT INTO `manageroperation` VALUES ('109', '修改', '1', '管理员表', '2017-05-22 14:37:39', '2017-05-22', '修改了一条管理员状态，id=13');
INSERT INTO `manageroperation` VALUES ('110', '修改', '1', '管理员表', '2017-05-22 14:38:03', '2017-05-22', '修改了一条管理员状态，id=8');
INSERT INTO `manageroperation` VALUES ('111', '修改', '1', '管理员表', '2017-05-22 14:38:06', '2017-05-22', '修改了一条管理员状态，id=8');
INSERT INTO `manageroperation` VALUES ('112', '修改', '1', '管理员表', '2017-05-22 14:38:10', '2017-05-22', '修改了一条管理员状态，id=8');
INSERT INTO `manageroperation` VALUES ('113', '修改', '1', '管理员表', '2017-05-22 15:50:47', '2017-05-22', '修改了一条管理员状态，id=8');
INSERT INTO `manageroperation` VALUES ('114', '修改', '1', '管理员表', '2017-05-22 15:50:51', '2017-05-22', '修改了一条管理员状态，id=8');
INSERT INTO `manageroperation` VALUES ('115', '修改', '1', '管理员表', '2017-05-22 15:50:56', '2017-05-22', '修改了一条管理员状态，id=8');
INSERT INTO `manageroperation` VALUES ('116', '修改', '1', '管理员表', '2017-05-22 15:51:06', '2017-05-22', '修改了一条管理员状态，id=5');
INSERT INTO `manageroperation` VALUES ('117', '修改', '1', '管理员表', '2017-05-22 15:51:10', '2017-05-22', '修改了一条管理员状态，id=5');
INSERT INTO `manageroperation` VALUES ('118', '修改', '1', '管理员表', '2017-05-22 15:51:16', '2017-05-22', '修改了一条管理员状态，id=5');
INSERT INTO `manageroperation` VALUES ('119', '修改', '1', '管理员表', '2017-05-22 15:53:21', '2017-05-22', '修改了一条管理员状态，id=8');
INSERT INTO `manageroperation` VALUES ('120', '修改', '1', '管理员表', '2017-05-22 15:53:26', '2017-05-22', '修改了一条管理员状态，id=8');
INSERT INTO `manageroperation` VALUES ('121', '修改', '1', '管理员表', '2017-05-22 15:53:35', '2017-05-22', '修改了一条管理员状态，id=5');
INSERT INTO `manageroperation` VALUES ('122', '修改', '1', '管理员表', '2017-05-22 15:53:37', '2017-05-22', '修改了一条管理员状态，id=8');
INSERT INTO `manageroperation` VALUES ('123', '修改', '1', '管理员表', '2017-05-22 15:58:14', '2017-05-22', '修改了一条管理员状态，id=8');
INSERT INTO `manageroperation` VALUES ('124', '修改', '1', '管理员表', '2017-05-22 16:01:47', '2017-05-22', '修改了一条管理员状态，id=13');
INSERT INTO `manageroperation` VALUES ('125', '修改', '1', '管理员表', '2017-05-22 16:01:53', '2017-05-22', '修改了一条管理员状态，id=13');
INSERT INTO `manageroperation` VALUES ('126', '修改', '1', '管理员表', '2017-05-22 16:01:58', '2017-05-22', '修改了一条管理员状态，id=13');
INSERT INTO `manageroperation` VALUES ('127', '删除', '1', '管理员表', '2017-05-22 16:02:00', '2017-05-22', '删除了1条管理员信息，id=13');
INSERT INTO `manageroperation` VALUES ('128', '登录', '1', '无', '2017-05-22 16:27:50', '2017-05-22', '登录了系统');
INSERT INTO `manageroperation` VALUES ('129', '删除', '1', '管理员表', '2017-05-22 16:32:20', '2017-05-22', '删除了0条管理员信息，id=,');
INSERT INTO `manageroperation` VALUES ('130', '添加', '1', '管理员表', '2017-05-22 16:35:43', '2017-05-22', '添加了一条管理员信息');
INSERT INTO `manageroperation` VALUES ('131', '修改', '1', '管理员表', '2017-05-22 16:58:42', '2017-05-22', '修改了一条管理员信息，id=5');
INSERT INTO `manageroperation` VALUES ('132', '登录', '1', '无', '2017-05-22 18:13:58', '2017-05-22', '登录了系统');
INSERT INTO `manageroperation` VALUES ('133', '修改', '1', '管理员表', '2017-05-22 18:28:21', '2017-05-22', '修改了一条管理员状态，id=5');
INSERT INTO `manageroperation` VALUES ('134', '修改', '1', '管理员表', '2017-05-22 18:28:25', '2017-05-22', '修改了一条管理员状态，id=5');
INSERT INTO `manageroperation` VALUES ('135', '修改', '1', '管理员表', '2017-05-22 18:33:06', '2017-05-22', '修改了一条管理员状态，id=5');
INSERT INTO `manageroperation` VALUES ('136', '修改', '1', '管理员表', '2017-05-22 18:33:09', '2017-05-22', '修改了一条管理员状态，id=5');
INSERT INTO `manageroperation` VALUES ('137', '添加', '1', '权限表', '2017-05-22 19:23:54', '2017-05-22', '添加了一条权限信息');
INSERT INTO `manageroperation` VALUES ('138', '修改', '1', '管理员表', '2017-05-22 19:24:07', '2017-05-22', '修改了一条管理员信息，id=5');
INSERT INTO `manageroperation` VALUES ('139', '添加', '1', '职位表', '2017-05-22 20:06:24', '2017-05-22', '添加了一条职位信息');
INSERT INTO `manageroperation` VALUES ('140', '添加', '1', '职位表', '2017-05-22 20:06:53', '2017-05-22', '添加了一条职位信息');
INSERT INTO `manageroperation` VALUES ('141', '添加', '1', '职位表', '2017-05-22 20:16:29', '2017-05-22', '添加了一条职位信息');
INSERT INTO `manageroperation` VALUES ('142', '删除', '1', '职位表', '2017-05-22 20:16:33', '2017-05-22', '删除了1条职位信息，id=16');
INSERT INTO `manageroperation` VALUES ('143', '删除', '1', '职位表', '2017-05-22 20:16:38', '2017-05-22', '删除了1条职位信息，id=15,,,');
INSERT INTO `manageroperation` VALUES ('144', '修改', '1', '职位表', '2017-05-22 20:29:54', '2017-05-22', '修改了一条职位信息，id=2');
INSERT INTO `manageroperation` VALUES ('145', '修改', '1', '职位表', '2017-05-22 20:30:01', '2017-05-22', '修改了一条职位信息，id=2');
INSERT INTO `manageroperation` VALUES ('146', '修改', '1', '职位表', '2017-05-22 20:30:16', '2017-05-22', '修改了一条职位信息，id=3');
INSERT INTO `manageroperation` VALUES ('147', '修改', '1', '职位表', '2017-05-22 20:30:26', '2017-05-22', '修改了一条职位信息，id=3');
INSERT INTO `manageroperation` VALUES ('148', '修改', '1', '员工表', '2017-05-22 20:59:51', '2017-05-22', '修改了一条员工状态以及管理员状态，id=2');
INSERT INTO `manageroperation` VALUES ('149', '修改', '1', '员工表', '2017-05-22 20:59:57', '2017-05-22', '修改了一条员工状态以及管理员状态，id=2');
INSERT INTO `manageroperation` VALUES ('150', '修改', '1', '员工表', '2017-05-22 20:59:59', '2017-05-22', '修改了一条员工状态以及管理员状态，id=4');
INSERT INTO `manageroperation` VALUES ('151', '修改', '1', '员工表', '2017-05-22 21:00:03', '2017-05-22', '修改了一条员工状态以及管理员状态，id=4');
INSERT INTO `manageroperation` VALUES ('152', '修改', '1', '员工表', '2017-05-22 21:00:05', '2017-05-22', '修改了一条员工状态以及管理员状态，id=8');
INSERT INTO `manageroperation` VALUES ('153', '修改', '1', '员工表', '2017-05-22 21:00:11', '2017-05-22', '修改了一条员工状态以及管理员状态，id=8');
INSERT INTO `manageroperation` VALUES ('154', '修改', '1', '管理员表', '2017-05-22 21:00:17', '2017-05-22', '修改了一条管理员状态，id=5');
INSERT INTO `manageroperation` VALUES ('155', '修改', '1', '管理员表', '2017-05-22 21:00:28', '2017-05-22', '修改了一条管理员状态，id=5');
INSERT INTO `manageroperation` VALUES ('156', '修改', '1', '员工表', '2017-05-22 21:00:35', '2017-05-22', '修改了一条员工状态以及管理员状态，id=8');
INSERT INTO `manageroperation` VALUES ('157', '修改', '1', '员工表', '2017-05-22 21:00:38', '2017-05-22', '修改了一条员工状态以及管理员状态，id=4');
INSERT INTO `manageroperation` VALUES ('158', '修改', '1', '员工表', '2017-05-22 21:00:41', '2017-05-22', '修改了一条员工状态以及管理员状态，id=4');
INSERT INTO `manageroperation` VALUES ('159', '修改', '1', '员工表', '2017-05-22 21:00:44', '2017-05-22', '修改了一条员工状态以及管理员状态，id=8');
INSERT INTO `manageroperation` VALUES ('160', '修改', '1', '员工表', '2017-05-22 21:00:48', '2017-05-22', '修改了一条员工状态以及管理员状态，id=8');
INSERT INTO `manageroperation` VALUES ('161', '修改', '1', '员工表', '2017-05-22 21:00:50', '2017-05-22', '修改了一条员工状态以及管理员状态，id=8');
INSERT INTO `manageroperation` VALUES ('162', '修改', '1', '员工表', '2017-05-22 21:18:11', '2017-05-22', '修改了一条员工状态以及管理员状态，id=2');
INSERT INTO `manageroperation` VALUES ('163', '修改', '1', '员工表', '2017-05-22 21:18:14', '2017-05-22', '修改了一条员工状态以及管理员状态，id=2');
INSERT INTO `manageroperation` VALUES ('164', '登录', '1', '无', '2017-05-22 23:06:57', '2017-05-22', '登录了系统');
INSERT INTO `manageroperation` VALUES ('165', '修改', '1', '员工表', '2017-05-22 23:48:12', '2017-05-22', '修改了一条员工状态以及管理员状态，id=2');
INSERT INTO `manageroperation` VALUES ('166', '修改', '1', '员工表', '2017-05-22 23:48:16', '2017-05-22', '修改了一条员工状态以及管理员状态，id=2');
INSERT INTO `manageroperation` VALUES ('167', '添加', '1', '员工表', '2017-05-23 00:15:52', '2017-05-23', '添加了一条员工信息');
INSERT INTO `manageroperation` VALUES ('168', '修改', '1', '员工表', '2017-05-23 00:20:07', '2017-05-23', '修改了一条员工状态以及管理员状态，id=4');
INSERT INTO `manageroperation` VALUES ('169', '修改', '1', '员工表', '2017-05-23 00:20:16', '2017-05-23', '修改了一条员工状态以及管理员状态，id=4');
INSERT INTO `manageroperation` VALUES ('170', '修改', '1', '员工表', '2017-05-23 00:20:21', '2017-05-23', '修改了一条员工状态以及管理员状态，id=15');
INSERT INTO `manageroperation` VALUES ('171', '删除', '1', '员工表', '2017-05-23 00:20:33', '2017-05-23', '删除了1条员工信息以及管理员信息，id=15');
INSERT INTO `manageroperation` VALUES ('172', '添加', '1', '员工表', '2017-05-23 00:20:59', '2017-05-23', '添加了一条员工信息');
INSERT INTO `manageroperation` VALUES ('173', '删除', '1', '员工表', '2017-05-23 00:21:06', '2017-05-23', '删除了0条员工信息以及管理员信息，id=,');
INSERT INTO `manageroperation` VALUES ('174', '修改', '1', '员工表', '2017-05-23 00:21:10', '2017-05-23', '修改了一条员工状态以及管理员状态，id=16');
INSERT INTO `manageroperation` VALUES ('175', '删除', '1', '员工表', '2017-05-23 00:21:14', '2017-05-23', '删除了2条员工信息以及管理员信息，id=,16');
INSERT INTO `manageroperation` VALUES ('176', '修改', '1', '员工表', '2017-05-23 00:37:35', '2017-05-23', '修改了一条员工信息，id=2');
INSERT INTO `manageroperation` VALUES ('177', '修改', '1', '员工表', '2017-05-23 00:37:45', '2017-05-23', '修改了一条员工信息，id=4');
INSERT INTO `manageroperation` VALUES ('178', '添加', '1', '管理员表', '2017-05-23 01:28:39', '2017-05-23', '添加了一条管理员信息');
INSERT INTO `manageroperation` VALUES ('179', '登录', '1', '无', '2017-05-23 16:11:16', '2017-05-23', '登录了系统');
INSERT INTO `manageroperation` VALUES ('180', '登录', '1', '无', '2017-05-23 17:49:52', '2017-05-23', '登录了系统');
INSERT INTO `manageroperation` VALUES ('181', '登录', '1', '无', '2017-05-23 19:32:24', '2017-05-23', '登录了系统');
INSERT INTO `manageroperation` VALUES ('182', '修改', '1', '管理员表', '2017-05-23 20:50:45', '2017-05-23', '修改了一条管理员个人信息，id=1');
INSERT INTO `manageroperation` VALUES ('183', '修改', '1', '员工表', '2017-05-23 20:50:45', '2017-05-23', '修改了一条员工个人信息，id=1');
INSERT INTO `manageroperation` VALUES ('184', '修改', '1', '员工表', '2017-05-23 20:54:21', '2017-05-23', '修改了一条员工信息，id=2');
INSERT INTO `manageroperation` VALUES ('185', '修改', '1', '管理员表', '2017-05-23 21:09:34', '2017-05-23', '修改了一条管理员个人信息，id=1');
INSERT INTO `manageroperation` VALUES ('186', '修改', '1', '员工表', '2017-05-23 21:09:34', '2017-05-23', '修改了一条员工个人信息，id=1');
INSERT INTO `manageroperation` VALUES ('187', '登录', '1', '无', '2017-05-23 23:21:07', '2017-05-23', '登录了系统');
INSERT INTO `manageroperation` VALUES ('188', '登录', '1', '无', '2017-05-23 23:59:31', '2017-05-23', '登录了系统');
INSERT INTO `manageroperation` VALUES ('189', '登录', '1', '无', '2017-05-24 17:56:22', '2017-05-24', '登录了系统');
INSERT INTO `manageroperation` VALUES ('190', '登录', '1', '无', '2017-05-24 19:11:16', '2017-05-24', '登录了系统');
INSERT INTO `manageroperation` VALUES ('191', '登录', '1', '无', '2017-05-24 19:45:54', '2017-05-24', '登录了系统');
INSERT INTO `manageroperation` VALUES ('192', '登录', '1', '无', '2017-05-24 19:55:22', '2017-05-24', '登录了系统');
INSERT INTO `manageroperation` VALUES ('193', '登录', '1', '无', '2017-05-24 20:20:20', '2017-05-24', '登录了系统');
INSERT INTO `manageroperation` VALUES ('194', '登录', '1', '无', '2017-05-24 22:15:32', '2017-05-24', '登录了系统');
INSERT INTO `manageroperation` VALUES ('195', '登录', '1', '无', '2017-05-24 23:15:07', '2017-05-24', '登录了系统');
INSERT INTO `manageroperation` VALUES ('196', '登录', '5', '无', '2017-05-25 00:05:43', '2017-05-25', '登录了系统');
INSERT INTO `manageroperation` VALUES ('197', '登录', '5', '无', '2017-05-25 00:08:51', '2017-05-25', '登录了系统');
INSERT INTO `manageroperation` VALUES ('198', '登录', '1', '无', '2017-05-25 00:10:10', '2017-05-25', '登录了系统');
INSERT INTO `manageroperation` VALUES ('199', '登录', '5', '无', '2017-05-25 00:11:23', '2017-05-25', '登录了系统');
INSERT INTO `manageroperation` VALUES ('200', '登录', '1', '无', '2017-05-25 01:12:13', '2017-05-25', '登录了系统');
INSERT INTO `manageroperation` VALUES ('201', '登录', '5', '无', '2017-05-25 01:56:38', '2017-05-25', '登录了系统');
INSERT INTO `manageroperation` VALUES ('202', '登录', '5', '无', '2017-05-25 02:12:13', '2017-05-25', '登录了系统');
INSERT INTO `manageroperation` VALUES ('203', '登录', '1', '无', '2017-05-25 02:13:54', '2017-05-25', '登录了系统');
INSERT INTO `manageroperation` VALUES ('204', '登录', '1', '无', '2017-05-25 15:13:20', '2017-05-25', '登录了系统');
INSERT INTO `manageroperation` VALUES ('205', '登录', '1', '无', '2017-05-25 15:17:22', '2017-05-25', '登录了系统');
INSERT INTO `manageroperation` VALUES ('206', '登录', '1', '无', '2017-05-25 16:28:50', '2017-05-25', '登录了系统');
INSERT INTO `manageroperation` VALUES ('207', '登录', '1', '无', '2017-05-25 16:32:37', '2017-05-25', '登录了系统');
INSERT INTO `manageroperation` VALUES ('208', '登录', '1', '无', '2017-05-25 16:39:16', '2017-05-25', '登录了系统');
INSERT INTO `manageroperation` VALUES ('209', '登录', '5', '无', '2017-05-25 20:22:52', '2017-05-25', '登录了系统');
INSERT INTO `manageroperation` VALUES ('210', '登录', '1', '无', '2017-05-25 21:06:17', '2017-05-25', '登录了系统');
INSERT INTO `manageroperation` VALUES ('211', '登录', '1', '无', '2017-05-25 22:38:01', '2017-05-25', '登录了系统');
INSERT INTO `manageroperation` VALUES ('212', '登录', '1', '无', '2017-05-25 23:14:27', '2017-05-25', '登录了系统');
INSERT INTO `manageroperation` VALUES ('213', '添加', '1', '共享表', '2017-05-26 00:36:41', '2017-05-26', '分享了张图片');
INSERT INTO `manageroperation` VALUES ('214', '删除', '1', '共享表', '2017-05-26 00:51:23', '2017-05-26', '取消了一个文件共享,id=2');
INSERT INTO `manageroperation` VALUES ('215', '删除', '1', '共享表', '2017-05-26 00:52:18', '2017-05-26', '取消了一个文件共享,id=2');
INSERT INTO `manageroperation` VALUES ('216', '删除', '1', '共享表', '2017-05-26 00:52:56', '2017-05-26', '取消了一个文件共享,id=2');
INSERT INTO `manageroperation` VALUES ('217', '删除', '1', '共享表', '2017-05-26 00:53:14', '2017-05-26', '取消了一个图片分享,id=2');
INSERT INTO `manageroperation` VALUES ('218', '删除', '1', '共享表', '2017-05-26 00:55:44', '2017-05-26', '取消了一个文件共享,id=3');
INSERT INTO `manageroperation` VALUES ('219', '登录', '1', '无', '2017-05-26 16:27:41', '2017-05-26', '登录了系统');
INSERT INTO `manageroperation` VALUES ('220', '登录', '1', '无', '2017-05-26 22:53:07', '2017-05-26', '登录了系统');
INSERT INTO `manageroperation` VALUES ('221', '登录', '1', '无', '2017-05-27 13:27:46', '2017-05-27', '登录了系统');
INSERT INTO `manageroperation` VALUES ('222', '修改', '1', '客户表', '2017-05-27 14:09:11', '2017-05-27', '修改了一条客户状态，id=1');
INSERT INTO `manageroperation` VALUES ('223', '修改', '1', '客户表', '2017-05-27 14:09:14', '2017-05-27', '修改了一条客户状态，id=1');
INSERT INTO `manageroperation` VALUES ('224', '修改', '1', '客户表', '2017-05-27 14:10:30', '2017-05-27', '修改了一条客户状态，id=1');
INSERT INTO `manageroperation` VALUES ('225', '修改', '1', '客户表', '2017-05-27 14:10:37', '2017-05-27', '修改了一条客户状态，id=1');
INSERT INTO `manageroperation` VALUES ('226', '修改', '1', '客户表', '2017-05-27 14:12:58', '2017-05-27', '修改了一条客户状态，id=1');
INSERT INTO `manageroperation` VALUES ('227', '修改', '1', '客户表', '2017-05-27 14:13:10', '2017-05-27', '修改了一条客户状态，id=1');
INSERT INTO `manageroperation` VALUES ('228', '修改', '1', '客户表', '2017-05-27 14:13:55', '2017-05-27', '修改了一条客户状态，id=1');
INSERT INTO `manageroperation` VALUES ('229', '修改', '1', '客户表', '2017-05-27 14:14:06', '2017-05-27', '修改了一条客户状态，id=1');
INSERT INTO `manageroperation` VALUES ('230', '修改', '1', '客户表', '2017-05-27 14:14:37', '2017-05-27', '修改了一条客户状态，id=1');
INSERT INTO `manageroperation` VALUES ('231', '修改', '1', '客户表', '2017-05-27 14:14:42', '2017-05-27', '修改了一条客户状态，id=1');
INSERT INTO `manageroperation` VALUES ('232', '登录', '1', '无', '2017-05-27 14:50:15', '2017-05-27', '登录了系统');
INSERT INTO `manageroperation` VALUES ('233', '修改', '1', '客户表', '2017-05-27 14:56:07', '2017-05-27', '修改了一条客户状态，id=1');
INSERT INTO `manageroperation` VALUES ('234', '修改', '1', '客户表', '2017-05-27 14:56:09', '2017-05-27', '修改了一条客户状态，id=1');
INSERT INTO `manageroperation` VALUES ('235', '登录', '1', '无', '2017-05-27 15:31:49', '2017-05-27', '登录了系统');
INSERT INTO `manageroperation` VALUES ('236', '登录', '1', '无', '2017-05-27 16:28:33', '2017-05-27', '登录了系统');
INSERT INTO `manageroperation` VALUES ('237', '登录', '1', '无', '2017-05-27 20:30:43', '2017-05-27', '登录了系统');
INSERT INTO `manageroperation` VALUES ('238', '修改', '1', '权限表', '2017-05-27 20:31:37', '2017-05-27', '修改了一条权限信息，id=59');
INSERT INTO `manageroperation` VALUES ('239', '登录', '1', '无', '2017-05-27 22:34:55', '2017-05-27', '登录了系统');
INSERT INTO `manageroperation` VALUES ('240', '登录', '1', '无', '2017-05-27 23:40:48', '2017-05-27', '登录了系统');
INSERT INTO `manageroperation` VALUES ('241', '修改', '1', '客户表', '2017-05-28 00:18:19', '2017-05-28', '修改了一条客户状态，id=1');
INSERT INTO `manageroperation` VALUES ('242', '修改', '1', '客户表', '2017-05-28 00:18:24', '2017-05-28', '修改了一条客户状态，id=1');
INSERT INTO `manageroperation` VALUES ('243', '修改', '1', '商品表', '2017-05-28 00:23:49', '2017-05-28', '修改了一条商品状态，id=undefined');
INSERT INTO `manageroperation` VALUES ('244', '修改', '1', '商品表', '2017-05-28 00:26:11', '2017-05-28', '修改了一条商品状态，id=1');
INSERT INTO `manageroperation` VALUES ('245', '修改', '1', '商品表', '2017-05-28 00:26:14', '2017-05-28', '修改了一条商品状态，id=1');
INSERT INTO `manageroperation` VALUES ('246', '登录', '1', '无', '2017-05-28 15:13:46', '2017-05-28', '登录了系统');
INSERT INTO `manageroperation` VALUES ('247', '登录', '1', '无', '2017-05-28 16:21:22', '2017-05-28', '登录了系统');
INSERT INTO `manageroperation` VALUES ('248', '登录', '1', '无', '2017-05-28 17:43:22', '2017-05-28', '登录了系统');
INSERT INTO `manageroperation` VALUES ('249', '登录', '1', '无', '2017-05-28 19:02:12', '2017-05-28', '登录了系统');
INSERT INTO `manageroperation` VALUES ('250', '清理', '1', '无', '2017-05-28 19:23:25', '2017-05-28', '清理了查询信息');
INSERT INTO `manageroperation` VALUES ('251', '清理', '1', '无', '2017-05-28 19:39:45', '2017-05-28', '清理了数据库信息');
INSERT INTO `manageroperation` VALUES ('252', '清理', '1', '无', '2017-05-28 19:51:17', '2017-05-28', '清理了页面信息');
INSERT INTO `manageroperation` VALUES ('253', '登录', '1', '无', '2017-05-28 20:50:16', '2017-05-28', '登录了系统');
INSERT INTO `manageroperation` VALUES ('254', '登录', '1', '无', '2017-05-28 22:22:51', '2017-05-28', '登录了系统');
INSERT INTO `manageroperation` VALUES ('255', '添加', '1', '权限表', '2017-05-28 22:56:44', '2017-05-28', '添加了一条权限信息');
INSERT INTO `manageroperation` VALUES ('256', '修改', '1', '权限表', '2017-05-28 22:56:56', '2017-05-28', '修改了一条权限信息，id=60');
INSERT INTO `manageroperation` VALUES ('257', '登录', '1', '无', '2017-05-29 01:22:19', '2017-05-29', '登录了系统');
INSERT INTO `manageroperation` VALUES ('258', '修改', '1', '兼职表', '2017-05-29 01:36:07', '2017-05-29', '修改了一条兼职状态，id=1');
INSERT INTO `manageroperation` VALUES ('259', '修改', '1', '兼职表', '2017-05-29 01:36:13', '2017-05-29', '修改了一条兼职状态，id=1');
INSERT INTO `manageroperation` VALUES ('260', '修改', '1', '兼职表', '2017-05-29 01:36:18', '2017-05-29', '修改了一条兼职状态，id=1');
INSERT INTO `manageroperation` VALUES ('261', '修改', '1', '兼职表', '2017-05-29 01:36:27', '2017-05-29', '修改了一条兼职状态，id=1');
INSERT INTO `manageroperation` VALUES ('262', '修改', '1', '兼职表', '2017-05-29 01:48:06', '2017-05-29', '修改了一条兼职状态，id=1');
INSERT INTO `manageroperation` VALUES ('263', '修改', '1', '兼职表', '2017-05-29 01:48:10', '2017-05-29', '修改了一条兼职状态，id=1');
INSERT INTO `manageroperation` VALUES ('264', '登录', '1', '无', '2017-05-29 12:55:57', '2017-05-29', '登录了系统');
INSERT INTO `manageroperation` VALUES ('265', '修改', '1', '网站信息表', '2017-05-29 15:07:37', '2017-05-29', '更新了网站公告');
INSERT INTO `manageroperation` VALUES ('266', '修改', '1', '网站信息表', '2017-05-29 15:09:14', '2017-05-29', '更新了网站公告');
INSERT INTO `manageroperation` VALUES ('267', '修改', '1', '网站信息表', '2017-05-29 15:09:25', '2017-05-29', '更新了网站公告');
INSERT INTO `manageroperation` VALUES ('268', '修改', '1', '网站信息表', '2017-05-29 15:25:48', '2017-05-29', '更新了网站公告');
INSERT INTO `manageroperation` VALUES ('269', '登录', '1', '无', '2017-05-29 17:06:18', '2017-05-29', '登录了系统');
INSERT INTO `manageroperation` VALUES ('270', '登录', '1', '无', '2017-05-30 13:58:11', '2017-05-30', '登录了系统');
INSERT INTO `manageroperation` VALUES ('271', '登录', '1', '无', '2017-05-30 21:37:22', '2017-05-30', '登录了系统');
INSERT INTO `manageroperation` VALUES ('272', '登录', '1', '无', '2017-05-31 15:54:02', '2017-05-31', '登录了系统');
INSERT INTO `manageroperation` VALUES ('273', '登录', '1', '无', '2017-06-01 03:59:35', '2017-06-01', '登录了系统');
INSERT INTO `manageroperation` VALUES ('274', '登录', '1', '无', '2017-06-01 11:36:23', '2017-06-01', '登录了系统');
INSERT INTO `manageroperation` VALUES ('275', '登录', '1', '无', '2017-06-01 15:58:06', '2017-06-01', '登录了系统');
INSERT INTO `manageroperation` VALUES ('276', '登录', '1', '无', '2017-06-02 01:42:03', '2017-06-02', '登录了系统');
INSERT INTO `manageroperation` VALUES ('277', '修改', '1', '商品表', '2017-06-02 01:42:27', '2017-06-02', '修改了一条商品状态，id=2');
INSERT INTO `manageroperation` VALUES ('278', '登录', '1', '无', '2017-06-02 12:47:28', '2017-06-02', '登录了系统');
INSERT INTO `manageroperation` VALUES ('279', '登录', '1', '无', '2017-06-04 00:25:40', '2017-06-04', '登录了系统');
INSERT INTO `manageroperation` VALUES ('280', '登录', '1', '无', '2017-06-06 21:47:55', '2017-06-06', '登录了系统');
INSERT INTO `manageroperation` VALUES ('281', '登录', '1', '无', '2017-06-07 15:20:06', '2017-06-07', '登录了系统');
INSERT INTO `manageroperation` VALUES ('282', '登录', '1', '无', '2017-06-07 18:48:58', '2017-06-07', '登录了系统');
INSERT INTO `manageroperation` VALUES ('283', '登录', '1', '无', '2017-06-07 22:35:47', '2017-06-07', '登录了系统');
INSERT INTO `manageroperation` VALUES ('284', '登录', '1', '无', '2017-06-08 00:29:02', '2017-06-08', '登录了系统');
INSERT INTO `manageroperation` VALUES ('285', '登录', '1', '无', '2017-06-08 14:59:42', '2017-06-08', '登录了系统');
INSERT INTO `manageroperation` VALUES ('286', '登录', '1', '无', '2017-06-08 16:14:21', '2017-06-08', '登录了系统');
INSERT INTO `manageroperation` VALUES ('287', '添加', '1', '权限表', '2017-06-08 16:15:55', '2017-06-08', '添加了一条权限信息');
INSERT INTO `manageroperation` VALUES ('288', '登录', '1', '无', '2017-06-08 18:08:55', '2017-06-08', '登录了系统');
INSERT INTO `manageroperation` VALUES ('289', '修改', '1', '管理员表', '2017-06-08 18:16:48', '2017-06-08', '修改了一条管理员信息，id=19');
INSERT INTO `manageroperation` VALUES ('290', '登录', '19', '无', '2017-06-08 18:17:48', '2017-06-08', '登录了系统');
INSERT INTO `manageroperation` VALUES ('291', '登录', '1', '无', '2017-06-08 18:21:17', '2017-06-08', '登录了系统');
INSERT INTO `manageroperation` VALUES ('292', '登录', '1', '无', '2017-06-08 20:54:36', '2017-06-08', '登录了系统');
INSERT INTO `manageroperation` VALUES ('293', '添加', '1', '权限表', '2017-06-08 20:56:05', '2017-06-08', '添加了一条权限信息');
INSERT INTO `manageroperation` VALUES ('294', '修改', '1', '管理员表', '2017-06-08 20:56:44', '2017-06-08', '修改了一条管理员信息，id=5');
INSERT INTO `manageroperation` VALUES ('295', '登录', '5', '无', '2017-06-08 20:57:36', '2017-06-08', '登录了系统');
INSERT INTO `manageroperation` VALUES ('296', '登录', '1', '无', '2017-06-08 20:58:07', '2017-06-08', '登录了系统');
INSERT INTO `manageroperation` VALUES ('297', '添加', '1', '共享表', '2017-06-08 21:02:08', '2017-06-08', '分享了一份文件');
INSERT INTO `manageroperation` VALUES ('298', '清理', '1', '无', '2017-06-08 21:03:11', '2017-06-08', '清理了查询信息');
INSERT INTO `manageroperation` VALUES ('299', '登录', '1', '无', '2017-06-09 22:06:02', '2017-06-09', '登录了系统');
INSERT INTO `manageroperation` VALUES ('300', '登录', '1', '无', '2017-06-15 14:45:35', '2017-06-15', '登录了系统');
INSERT INTO `manageroperation` VALUES ('301', '登录', '1', '无', '2017-06-15 14:46:16', '2017-06-15', '登录了系统');
INSERT INTO `manageroperation` VALUES ('302', '登录', '1', '无', '2017-07-11 09:20:12', '2017-07-11', '登录了系统');

-- ----------------------------
-- Table structure for managerstatus
-- ----------------------------
DROP TABLE IF EXISTS `managerstatus`;
CREATE TABLE `managerstatus` (
  `ManagerStatusId` int(11) NOT NULL AUTO_INCREMENT,
  `ManagerStatusName` varchar(255) DEFAULT NULL,
  `StatusType` varchar(255) DEFAULT NULL,
  `Discription` varchar(255) DEFAULT '',
  `AddTime` varchar(255) DEFAULT NULL,
  `Number` varchar(255) DEFAULT '0',
  PRIMARY KEY (`ManagerStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of managerstatus
-- ----------------------------
INSERT INTO `managerstatus` VALUES ('1', '超级管理员', '0,', '可以进行所有操作', '2017-5-15', '1');
INSERT INTO `managerstatus` VALUES ('59', '测试管理员', '2,7,8,9,', '测试用', '2017-05-22 19:23:54', '0');
INSERT INTO `managerstatus` VALUES ('60', '22222', '13,', 'dwad', '2017-05-28 22:56:44', '0');
INSERT INTO `managerstatus` VALUES ('61', 'AAA', '1,3,5,6,14,7,10,', 'AAA', '2017-06-08 16:15:55', '0');
INSERT INTO `managerstatus` VALUES ('62', '123', '1,3,2,7,8,9,10,15,', '123', '2017-06-08 20:56:05', '0');

-- ----------------------------
-- Table structure for managerstatustype
-- ----------------------------
DROP TABLE IF EXISTS `managerstatustype`;
CREATE TABLE `managerstatustype` (
  `StatusTypeId` int(11) NOT NULL,
  `StatusTypeName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`StatusTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of managerstatustype
-- ----------------------------
INSERT INTO `managerstatustype` VALUES ('1', '系统管理');
INSERT INTO `managerstatustype` VALUES ('2', '会员管理');
INSERT INTO `managerstatustype` VALUES ('3', '界面工具');
INSERT INTO `managerstatustype` VALUES ('4', '群发邮件');
INSERT INTO `managerstatustype` VALUES ('5', '网站反馈');
INSERT INTO `managerstatustype` VALUES ('6', '群发邮件');
INSERT INTO `managerstatustype` VALUES ('7', '员工列表');
INSERT INTO `managerstatustype` VALUES ('8', '管理员列表');
INSERT INTO `managerstatustype` VALUES ('9', '商品管理');
INSERT INTO `managerstatustype` VALUES ('10', '订单管理');
INSERT INTO `managerstatustype` VALUES ('11', '会员信息列表');
INSERT INTO `managerstatustype` VALUES ('12', '会员搜索管理');
INSERT INTO `managerstatustype` VALUES ('13', '兼职管理');
INSERT INTO `managerstatustype` VALUES ('14', '图片管理');
INSERT INTO `managerstatustype` VALUES ('15', '商品销量管理');
INSERT INTO `managerstatustype` VALUES ('16', '前台信息管理');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `MessageId` int(11) NOT NULL AUTO_INCREMENT,
  `FromManagerId` int(11) DEFAULT NULL,
  `ToManagerId` int(11) DEFAULT NULL,
  `SendTime` datetime DEFAULT NULL,
  `ReadStatus` int(11) DEFAULT '1',
  `FromStatus` int(11) DEFAULT NULL,
  `ToStatus` int(11) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Discripe` varchar(255) DEFAULT NULL,
  `FileAddress` varchar(255) DEFAULT NULL,
  `SendDay` date DEFAULT NULL,
  PRIMARY KEY (`MessageId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '1', '18', '2017-05-24 21:26:06', '1', '0', '1', '0', '呵呵', '哈哈', '/new_school_assistant/hou/upload/file/20170524/20170524205557_829.docx', '2017-05-24');
INSERT INTO `message` VALUES ('2', '1', '18', '2017-05-24 22:22:28', '1', '1', '1', '0', '哈哈哈', '来办公室', '/new_school_assistant/hou/upload/file/20170524/20170524222224_803.zip', '2017-05-24');
INSERT INTO `message` VALUES ('3', '1', '5', '2017-05-24 23:21:15', '1', '1', '1', '0', '哈哈哈', '呵呵呵', '/new_school_assistant/hou/upload/file/20170524/20170524232112_709.doc', '2017-05-24');
INSERT INTO `message` VALUES ('4', '5', '1', '2017-05-25 02:13:15', '0', '1', '1', '0', '000', 'SCZC', '/new_school_assistant/hou/upload/file/20170524/20170524222224_803.zip', '2017-05-25');
INSERT INTO `message` VALUES ('5', '1', '5', '2017-05-29 14:04:04', '1', '1', '1', '0', '达瓦大', '为大', '', '2017-05-29');
INSERT INTO `message` VALUES ('6', '1', '18', '2017-05-29 14:04:04', '1', '1', '1', '0', '达瓦大', '为大', '', '2017-05-29');
INSERT INTO `message` VALUES ('7', '1', '19', '2017-05-29 14:04:04', '1', '1', '1', '0', '达瓦大', '为大', '', '2017-05-29');
INSERT INTO `message` VALUES ('8', '1', '5', '2017-06-08 21:00:45', '1', '1', '1', '0', '123', '21111', '/new_school_assistant/hou/upload/file/20170525/20170525234827_286.txt', '2017-06-08');
INSERT INTO `message` VALUES ('9', '1', '5', '2017-06-15 14:47:19', '1', '1', '1', '0', '11', '111', '/new_school_assistant/hou/upload/file/20170524/20170524210251_919.docx', '2017-06-15');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `NoticeId` int(11) NOT NULL,
  `Discripe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`NoticeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '端午节全体员工放假');

-- ----------------------------
-- Table structure for ordered
-- ----------------------------
DROP TABLE IF EXISTS `ordered`;
CREATE TABLE `ordered` (
  `OrderId` int(11) DEFAULT NULL,
  `GoodsId` int(11) DEFAULT NULL,
  `GoodsName` varchar(255) DEFAULT NULL,
  `SaleClientId` int(11) DEFAULT NULL,
  `BuyClientId` int(11) DEFAULT NULL,
  `Status` varchar(255) DEFAULT '1',
  `ExpressCode` varchar(255) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `FinishTime` datetime DEFAULT NULL,
  `Discripe` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ordered
-- ----------------------------
INSERT INTO `ordered` VALUES ('492692', '2', '书桌', '15', '1', '6', null, '2017-06-07 16:15:57', '2017-06-08 17:33:41', '');
INSERT INTO `ordered` VALUES ('141533', '1', '高数书', '15', '1', '6', null, '2017-06-08 16:20:20', '2017-06-08 17:34:40', null);
INSERT INTO `ordered` VALUES ('830183', '3', '不知道是啥', '15', '1', '6', null, '2017-06-08 16:21:36', '2017-06-08 17:35:18', '');
INSERT INTO `ordered` VALUES ('342562', '7', '某裤子', '15', '1', '3', null, '2017-06-08 20:52:30', '2017-06-08 20:53:30', '');
INSERT INTO `ordered` VALUES ('730319', '11', '手机', '20', '1', '5', null, '2017-06-08 20:52:30', null, '');
INSERT INTO `ordered` VALUES ('300612', '8', '小皮鞋', '15', '1', '2', null, '2017-07-11 09:33:12', null, '');

-- ----------------------------
-- Table structure for orderstatus
-- ----------------------------
DROP TABLE IF EXISTS `orderstatus`;
CREATE TABLE `orderstatus` (
  `OrderStatusId` int(11) NOT NULL AUTO_INCREMENT,
  `OrdersStatusName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`OrderStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderstatus
-- ----------------------------
INSERT INTO `orderstatus` VALUES ('1', '未付款');
INSERT INTO `orderstatus` VALUES ('2', '已付款');
INSERT INTO `orderstatus` VALUES ('3', '已完成');
INSERT INTO `orderstatus` VALUES ('4', '已取消');
INSERT INTO `orderstatus` VALUES ('5', '正在退款');
INSERT INTO `orderstatus` VALUES ('6', '已退款');

-- ----------------------------
-- Table structure for page
-- ----------------------------
DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
  `PageId` int(11) NOT NULL AUTO_INCREMENT,
  `PageSize` varchar(255) DEFAULT '5',
  `PageName` varchar(255) DEFAULT NULL,
  `ManagerId` int(11) DEFAULT NULL,
  `NowPage` int(11) DEFAULT '1',
  PRIMARY KEY (`PageId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of page
-- ----------------------------
INSERT INTO `page` VALUES ('1', '5', '员工表', '1', '1');
INSERT INTO `page` VALUES ('5', '5', '管理员表', '1', '1');
INSERT INTO `page` VALUES ('6', '10', '员工表', '5', '1');
INSERT INTO `page` VALUES ('7', '10', '管理员表', '5', '1');
INSERT INTO `page` VALUES ('8', '5', '权限表', '1', '1');
INSERT INTO `page` VALUES ('9', '5', '职位表', '1', '1');
INSERT INTO `page` VALUES ('10', '5', '员工表', '13', '1');
INSERT INTO `page` VALUES ('11', '10', '管理员表', '13', '1');
INSERT INTO `page` VALUES ('12', '5', '员工表', '8', '1');
INSERT INTO `page` VALUES ('13', '5', '员工表', '8', '1');
INSERT INTO `page` VALUES ('14', '5', '管理员表', '8', '1');
INSERT INTO `page` VALUES ('15', '20', '管理员日志表', '1', '1');
INSERT INTO `page` VALUES ('16', '5', '个人邮件表', '1', '1');
INSERT INTO `page` VALUES ('17', '5', '个人邮件表', '5', '1');
INSERT INTO `page` VALUES ('19', '5', '文件共享表', '1', '1');
INSERT INTO `page` VALUES ('20', '5', '图片共享表', '1', '1');
INSERT INTO `page` VALUES ('21', '5', '客户列表', '1', '1');

-- ----------------------------
-- Table structure for parttimejob
-- ----------------------------
DROP TABLE IF EXISTS `parttimejob`;
CREATE TABLE `parttimejob` (
  `JobId` int(11) NOT NULL,
  `JobName` varchar(255) DEFAULT NULL,
  `WorkPlace` varchar(255) DEFAULT NULL,
  `WorkTime` varchar(255) DEFAULT NULL,
  `CilentId` int(11) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `Discripe` varchar(255) DEFAULT NULL,
  `NeedNum` int(11) DEFAULT NULL,
  `Picture` varchar(255) DEFAULT NULL,
  `Status` int(11) DEFAULT '1',
  `Tel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`JobId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parttimejob
-- ----------------------------
INSERT INTO `parttimejob` VALUES ('1', '送外卖的', '商业街', '每天11:00-13:00', '1', '2017-05-28 00:00:00', '能出苦耐劳', '2', null, '1', '17854116993');

-- ----------------------------
-- Table structure for proceeds
-- ----------------------------
DROP TABLE IF EXISTS `proceeds`;
CREATE TABLE `proceeds` (
  `ProceedsId` int(11) NOT NULL,
  `GoodsTypeId` int(11) DEFAULT NULL,
  `SumProceeds` int(255) DEFAULT '0',
  `SumPrice` varchar(255) DEFAULT '0',
  `MonthProceeds` int(11) DEFAULT '0',
  `MonthPrice` varchar(255) DEFAULT NULL,
  `WeekProceeds` varchar(255) DEFAULT NULL,
  `WeekPrice` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of proceeds
-- ----------------------------

-- ----------------------------
-- Table structure for province_info
-- ----------------------------
DROP TABLE IF EXISTS `province_info`;
CREATE TABLE `province_info` (
  `pr_id` int(10) NOT NULL COMMENT '省份ID值',
  `pr_province` varchar(32) NOT NULL COMMENT '省份名称',
  PRIMARY KEY (`pr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of province_info
-- ----------------------------
INSERT INTO `province_info` VALUES ('1', '北京');
INSERT INTO `province_info` VALUES ('2', '上海');
INSERT INTO `province_info` VALUES ('3', '天津');
INSERT INTO `province_info` VALUES ('4', '重庆');
INSERT INTO `province_info` VALUES ('5', '黑龙江');
INSERT INTO `province_info` VALUES ('6', '吉林');
INSERT INTO `province_info` VALUES ('7', '辽宁');
INSERT INTO `province_info` VALUES ('8', '山东');
INSERT INTO `province_info` VALUES ('9', '山西');
INSERT INTO `province_info` VALUES ('10', '陕西');
INSERT INTO `province_info` VALUES ('11', '河北');
INSERT INTO `province_info` VALUES ('12', '河南');
INSERT INTO `province_info` VALUES ('13', '湖北');
INSERT INTO `province_info` VALUES ('14', '湖南');
INSERT INTO `province_info` VALUES ('15', '海南');
INSERT INTO `province_info` VALUES ('16', '江苏');
INSERT INTO `province_info` VALUES ('17', '江西');
INSERT INTO `province_info` VALUES ('18', '广东');
INSERT INTO `province_info` VALUES ('19', '广西');
INSERT INTO `province_info` VALUES ('20', '云南');
INSERT INTO `province_info` VALUES ('21', '贵州');
INSERT INTO `province_info` VALUES ('22', '四川');
INSERT INTO `province_info` VALUES ('23', '内蒙古');
INSERT INTO `province_info` VALUES ('24', '宁夏');
INSERT INTO `province_info` VALUES ('25', '甘肃');
INSERT INTO `province_info` VALUES ('26', '青海');
INSERT INTO `province_info` VALUES ('27', '西藏');
INSERT INTO `province_info` VALUES ('28', '新疆');
INSERT INTO `province_info` VALUES ('29', '安徽');
INSERT INTO `province_info` VALUES ('30', '浙江');
INSERT INTO `province_info` VALUES ('31', '福建');
INSERT INTO `province_info` VALUES ('32', '香港');
INSERT INTO `province_info` VALUES ('33', '澳门');
INSERT INTO `province_info` VALUES ('34', '台湾');

-- ----------------------------
-- Table structure for qianmessage
-- ----------------------------
DROP TABLE IF EXISTS `qianmessage`;
CREATE TABLE `qianmessage` (
  `MessageId` int(11) NOT NULL,
  `MessageName` varchar(255) DEFAULT NULL,
  `MessageValue` varchar(255) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`MessageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qianmessage
-- ----------------------------
INSERT INTO `qianmessage` VALUES ('1', '首页大标题', '济南校园助手有限公司', '2017-05-31 00:00:00');
INSERT INTO `qianmessage` VALUES ('2', '大标题简介', '并没有更多信息', '2017-05-31 00:00:00');
INSERT INTO `qianmessage` VALUES ('3', '企业文化', '哈哈哈哈', '2017-05-31 00:00:00');
INSERT INTO `qianmessage` VALUES ('4', '公司战略', '无战略', '2017-05-31 00:00:00');
INSERT INTO `qianmessage` VALUES ('5', '公司简介', '济南市校园助手有限公司', '2017-05-31 00:00:00');

-- ----------------------------
-- Table structure for qianpic
-- ----------------------------
DROP TABLE IF EXISTS `qianpic`;
CREATE TABLE `qianpic` (
  `PicId` int(11) DEFAULT NULL,
  `PicName` varchar(255) DEFAULT NULL,
  `PicAddress` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qianpic
-- ----------------------------
INSERT INTO `qianpic` VALUES ('1', '首页轮播图', '111');

-- ----------------------------
-- Table structure for sharefile
-- ----------------------------
DROP TABLE IF EXISTS `sharefile`;
CREATE TABLE `sharefile` (
  `ShareFileId` int(11) NOT NULL AUTO_INCREMENT,
  `ManagerId` int(11) DEFAULT NULL,
  `DownloadNum` int(11) DEFAULT NULL,
  `UploadTime` datetime DEFAULT NULL,
  `FileAddress` varchar(255) DEFAULT NULL,
  `Discripe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ShareFileId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sharefile
-- ----------------------------
INSERT INTO `sharefile` VALUES ('1', '1', '0', '2017-05-25 23:53:08', '/new_school_assistant/hou/upload/file/20170525/20170525234827_286.txt', 'dawd');
INSERT INTO `sharefile` VALUES ('4', '1', '0', '2017-05-26 00:15:49', '/new_school_assistant/hou/upload/file/20170524/20170524222224_803.zip', 'eerr');
INSERT INTO `sharefile` VALUES ('5', '1', '0', '2017-06-08 21:02:08', '/new_school_assistant/hou/upload/file/20170525/20170525234827_286.txt', '111');

-- ----------------------------
-- Table structure for sharepic
-- ----------------------------
DROP TABLE IF EXISTS `sharepic`;
CREATE TABLE `sharepic` (
  `SharePicId` int(11) NOT NULL AUTO_INCREMENT,
  `ManagerId` int(11) DEFAULT NULL,
  `DownloadNum` int(11) DEFAULT NULL,
  `UploadTime` datetime DEFAULT NULL,
  `PicAddress` varchar(255) DEFAULT NULL,
  `Discripe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SharePicId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sharepic
-- ----------------------------
INSERT INTO `sharepic` VALUES ('1', '1', '0', '2017-05-26 00:01:58', '/new_school_assistant/hou/upload/image/20170525/20170525160809_650.jpg', 'dwada');

-- ----------------------------
-- Table structure for shool_info
-- ----------------------------
DROP TABLE IF EXISTS `shool_info`;
CREATE TABLE `shool_info` (
  `sh_id` int(10) NOT NULL COMMENT '学校ID值',
  `sh_city` int(10) NOT NULL COMMENT '城市外键',
  `sh_shool` varchar(32) NOT NULL COMMENT '学校名称',
  PRIMARY KEY (`sh_id`),
  KEY `sh_city` (`sh_city`),
  CONSTRAINT `shool_info_ibfk_1` FOREIGN KEY (`sh_city`) REFERENCES `city_info` (`ci_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shool_info
-- ----------------------------
INSERT INTO `shool_info` VALUES ('1', '1', '北京大学');
INSERT INTO `shool_info` VALUES ('2', '1', '中国人民大学');
INSERT INTO `shool_info` VALUES ('3', '1', '清华大学');
INSERT INTO `shool_info` VALUES ('4', '1', '北京交通大学');
INSERT INTO `shool_info` VALUES ('5', '1', '北京科技大学');
INSERT INTO `shool_info` VALUES ('6', '1', '北京化工大学');
INSERT INTO `shool_info` VALUES ('7', '1', '北京邮电大学');
INSERT INTO `shool_info` VALUES ('8', '1', '中国农业大学');
INSERT INTO `shool_info` VALUES ('9', '1', '北京林业大学');
INSERT INTO `shool_info` VALUES ('10', '1', '北京中医药大学');
INSERT INTO `shool_info` VALUES ('11', '1', '北京师范大学');
INSERT INTO `shool_info` VALUES ('12', '1', '北京外国语大学');
INSERT INTO `shool_info` VALUES ('13', '1', '北京语言大学');
INSERT INTO `shool_info` VALUES ('14', '1', '中央财经大学');
INSERT INTO `shool_info` VALUES ('15', '1', '对外经济贸易大学');
INSERT INTO `shool_info` VALUES ('16', '1', '中国政法大学');
INSERT INTO `shool_info` VALUES ('17', '1', '华北电力大学');
INSERT INTO `shool_info` VALUES ('18', '1', '中国石油大学');
INSERT INTO `shool_info` VALUES ('19', '1', '中央民族大学');
INSERT INTO `shool_info` VALUES ('20', '1', '中国人民公安大学');
INSERT INTO `shool_info` VALUES ('21', '1', '北京协和医学院');
INSERT INTO `shool_info` VALUES ('22', '1', '北京体育大学');
INSERT INTO `shool_info` VALUES ('23', '1', '北京航空航天大学');
INSERT INTO `shool_info` VALUES ('24', '1', '北京理工大学');
INSERT INTO `shool_info` VALUES ('25', '1', '中国科学院大学');
INSERT INTO `shool_info` VALUES ('26', '1', '北京工业大学');
INSERT INTO `shool_info` VALUES ('27', '1', '北方工业大学');
INSERT INTO `shool_info` VALUES ('28', '1', '北京工商大学');
INSERT INTO `shool_info` VALUES ('29', '1', '北京建筑大学');
INSERT INTO `shool_info` VALUES ('30', '1', '首都医科大学');
INSERT INTO `shool_info` VALUES ('31', '1', '首都师范大学');
INSERT INTO `shool_info` VALUES ('32', '1', '首都经济贸易大学');
INSERT INTO `shool_info` VALUES ('33', '1', '北京信息科技大学');
INSERT INTO `shool_info` VALUES ('34', '1', '北京联合大学');
INSERT INTO `shool_info` VALUES ('35', '1', '中国传媒大学');
INSERT INTO `shool_info` VALUES ('36', '1', '国际关系学院');
INSERT INTO `shool_info` VALUES ('37', '1', '中央音乐学院');
INSERT INTO `shool_info` VALUES ('38', '1', '中央美术学院');
INSERT INTO `shool_info` VALUES ('39', '1', '中央戏剧学院');
INSERT INTO `shool_info` VALUES ('40', '1', '北京电子科技学院');
INSERT INTO `shool_info` VALUES ('41', '1', '外交学院');
INSERT INTO `shool_info` VALUES ('42', '1', '中国劳动关系学院');
INSERT INTO `shool_info` VALUES ('43', '1', '中国青年政治学院');
INSERT INTO `shool_info` VALUES ('44', '1', '中华女子学院');
INSERT INTO `shool_info` VALUES ('45', '1', '北京服装学院');
INSERT INTO `shool_info` VALUES ('46', '1', '北京印刷学院');
INSERT INTO `shool_info` VALUES ('47', '1', '北京石油化工学院');
INSERT INTO `shool_info` VALUES ('48', '1', '北京农学院');
INSERT INTO `shool_info` VALUES ('49', '1', '首都体育学院');
INSERT INTO `shool_info` VALUES ('50', '1', '北京第二外国语学院');
INSERT INTO `shool_info` VALUES ('51', '1', '北京物资学院');
INSERT INTO `shool_info` VALUES ('52', '1', '中国音乐学院');
INSERT INTO `shool_info` VALUES ('53', '1', '中国戏曲学院');
INSERT INTO `shool_info` VALUES ('54', '1', '北京电影学院');
INSERT INTO `shool_info` VALUES ('55', '1', '北京舞蹈学院');
INSERT INTO `shool_info` VALUES ('56', '1', '北京城市学院');
INSERT INTO `shool_info` VALUES ('57', '1', '首钢工学院');
INSERT INTO `shool_info` VALUES ('58', '1', '北京警察学院');
INSERT INTO `shool_info` VALUES ('59', '1', '北京青年政治学院');
INSERT INTO `shool_info` VALUES ('60', '1', '北京工业职业技术学院');
INSERT INTO `shool_info` VALUES ('61', '1', '北京信息职业技术学院');
INSERT INTO `shool_info` VALUES ('62', '1', '北京电子科技职业学院');
INSERT INTO `shool_info` VALUES ('63', '1', '北京吉利大学');
INSERT INTO `shool_info` VALUES ('64', '1', '北京社会管理职业学院');
INSERT INTO `shool_info` VALUES ('65', '1', '北京新圆明职业学院');
INSERT INTO `shool_info` VALUES ('66', '1', '北京体育职业学院');
INSERT INTO `shool_info` VALUES ('67', '1', '北京交通运输职业学院');
INSERT INTO `shool_info` VALUES ('68', '1', '北京卫生职业学院');
INSERT INTO `shool_info` VALUES ('69', '1', '北京京北职业技术学院');
INSERT INTO `shool_info` VALUES ('70', '1', '北京交通职业技术学院');
INSERT INTO `shool_info` VALUES ('71', '1', '北京农业职业学院');
INSERT INTO `shool_info` VALUES ('72', '1', '北京政法职业学院');
INSERT INTO `shool_info` VALUES ('73', '1', '北京财贸职业学院');
INSERT INTO `shool_info` VALUES ('74', '1', '北京北大方正软件职业技术学院');
INSERT INTO `shool_info` VALUES ('75', '1', '北京经贸职业学院');
INSERT INTO `shool_info` VALUES ('76', '1', '北京经济技术职业学院');
INSERT INTO `shool_info` VALUES ('77', '1', '北京戏曲艺术职业学院');
INSERT INTO `shool_info` VALUES ('78', '1', '北京汇佳职业学院');
INSERT INTO `shool_info` VALUES ('79', '1', '北京现代职业技术学院');
INSERT INTO `shool_info` VALUES ('80', '1', '北京科技经营管理学院');
INSERT INTO `shool_info` VALUES ('81', '1', '北京科技职业学院');
INSERT INTO `shool_info` VALUES ('82', '1', '北京培黎职业学院');
INSERT INTO `shool_info` VALUES ('83', '1', '北京经济管理职业学院');
INSERT INTO `shool_info` VALUES ('84', '1', '北京劳动保障职业学院');
INSERT INTO `shool_info` VALUES ('85', '2', '复旦大学');
INSERT INTO `shool_info` VALUES ('86', '2', '同济大学');
INSERT INTO `shool_info` VALUES ('87', '2', '上海交通大学');
INSERT INTO `shool_info` VALUES ('88', '2', '华东理工大学');
INSERT INTO `shool_info` VALUES ('89', '2', '东华大学');
INSERT INTO `shool_info` VALUES ('90', '2', '华东师范大学');
INSERT INTO `shool_info` VALUES ('91', '2', '上海外国语大学');
INSERT INTO `shool_info` VALUES ('92', '2', '上海财经大学');
INSERT INTO `shool_info` VALUES ('93', '2', '上海理工大学');
INSERT INTO `shool_info` VALUES ('94', '2', '上海海事大学');
INSERT INTO `shool_info` VALUES ('95', '2', '上海海洋大学');
INSERT INTO `shool_info` VALUES ('96', '2', '上海中医药大学');
INSERT INTO `shool_info` VALUES ('97', '2', '上海师范大学');
INSERT INTO `shool_info` VALUES ('98', '2', '上海对外经贸大学');
INSERT INTO `shool_info` VALUES ('99', '2', '华东政法大学');
INSERT INTO `shool_info` VALUES ('100', '2', '上海大学');
INSERT INTO `shool_info` VALUES ('101', '2', '上海工程技术大学');
INSERT INTO `shool_info` VALUES ('102', '2', '上海纽约大学');
INSERT INTO `shool_info` VALUES ('103', '2', '上海海关学院');
INSERT INTO `shool_info` VALUES ('104', '2', '上海电力学院');
INSERT INTO `shool_info` VALUES ('105', '2', '上海应用技术学院');
INSERT INTO `shool_info` VALUES ('106', '2', '上海体育学院');
INSERT INTO `shool_info` VALUES ('107', '2', '上海音乐学院');
INSERT INTO `shool_info` VALUES ('108', '2', '上海戏剧学院');
INSERT INTO `shool_info` VALUES ('109', '2', '上海立信会计学院');
INSERT INTO `shool_info` VALUES ('110', '2', '上海电机学院');
INSERT INTO `shool_info` VALUES ('111', '2', '上海金融学院');
INSERT INTO `shool_info` VALUES ('112', '2', '上海杉达学院');
INSERT INTO `shool_info` VALUES ('113', '2', '上海商学院');
INSERT INTO `shool_info` VALUES ('114', '2', '上海视觉艺术学院');
INSERT INTO `shool_info` VALUES ('115', '2', '上海政法学院');
INSERT INTO `shool_info` VALUES ('116', '2', '上海第二工业大学');
INSERT INTO `shool_info` VALUES ('117', '2', '上海建桥学院');
INSERT INTO `shool_info` VALUES ('118', '2', '上海医疗器械高等专科学校');
INSERT INTO `shool_info` VALUES ('119', '2', '上海旅游高等专科学校');
INSERT INTO `shool_info` VALUES ('120', '2', '上海公安高等专科学校');
INSERT INTO `shool_info` VALUES ('121', '2', '上海出版印刷高等专科学校');
INSERT INTO `shool_info` VALUES ('122', '2', '上海医药高等专科学校');
INSERT INTO `shool_info` VALUES ('123', '2', '上海民航职业技术学院');
INSERT INTO `shool_info` VALUES ('124', '2', '上海东海职业技术学院');
INSERT INTO `shool_info` VALUES ('125', '2', '上海新侨职业技术学院');
INSERT INTO `shool_info` VALUES ('126', '2', '上海兴韦信息技术职业学院');
INSERT INTO `shool_info` VALUES ('127', '2', '上海体育职业学院');
INSERT INTO `shool_info` VALUES ('128', '2', '上海健康职业技术学院');
INSERT INTO `shool_info` VALUES ('129', '2', '上海行健职业学院');
INSERT INTO `shool_info` VALUES ('130', '2', '上海城市管理职业技术学院');
INSERT INTO `shool_info` VALUES ('131', '2', '上海交通职业技术学院');
INSERT INTO `shool_info` VALUES ('132', '2', '上海海事职业技术学院');
INSERT INTO `shool_info` VALUES ('133', '2', '上海电子信息职业技术学院');
INSERT INTO `shool_info` VALUES ('134', '2', '上海震旦职业学院');
INSERT INTO `shool_info` VALUES ('135', '2', '上海民远职业技术学院');
INSERT INTO `shool_info` VALUES ('136', '2', '上海欧华职业技术学院');
INSERT INTO `shool_info` VALUES ('137', '2', '上海思博职业技术学院');
INSERT INTO `shool_info` VALUES ('138', '2', '上海立达职业技术学院');
INSERT INTO `shool_info` VALUES ('139', '2', '上海工艺美术职业学院');
INSERT INTO `shool_info` VALUES ('140', '2', '上海济光职业技术学院');
INSERT INTO `shool_info` VALUES ('141', '2', '上海工商外国语职业学院');
INSERT INTO `shool_info` VALUES ('142', '2', '上海科学技术职业学院');
INSERT INTO `shool_info` VALUES ('143', '2', '上海农林职业技术学院');
INSERT INTO `shool_info` VALUES ('144', '2', '上海邦德职业技术学院');
INSERT INTO `shool_info` VALUES ('145', '2', '上海中侨职业技术学院');
INSERT INTO `shool_info` VALUES ('146', '2', '上海建峰职业技术学院');
INSERT INTO `shool_info` VALUES ('147', '2', '上海电影艺术职业学院');
INSERT INTO `shool_info` VALUES ('148', '2', '上海中华职业技术学院');
INSERT INTO `shool_info` VALUES ('149', '2', '上海工会管理职业学院');
INSERT INTO `shool_info` VALUES ('150', '3', '河北工业大学');
INSERT INTO `shool_info` VALUES ('151', '3', '南开大学');
INSERT INTO `shool_info` VALUES ('152', '3', '天津大学');
INSERT INTO `shool_info` VALUES ('153', '3', '中国民航大学');
INSERT INTO `shool_info` VALUES ('154', '3', '天津科技大学');
INSERT INTO `shool_info` VALUES ('155', '3', '天津工业大学');
INSERT INTO `shool_info` VALUES ('156', '3', '天津理工大学');
INSERT INTO `shool_info` VALUES ('157', '3', '天津医科大学');
INSERT INTO `shool_info` VALUES ('158', '3', '天津中医药大学');
INSERT INTO `shool_info` VALUES ('159', '3', '天津师范大学');
INSERT INTO `shool_info` VALUES ('160', '3', '天津职业技术师范大学');
INSERT INTO `shool_info` VALUES ('161', '3', '天津外国语大学');
INSERT INTO `shool_info` VALUES ('162', '3', '天津商业大学');
INSERT INTO `shool_info` VALUES ('163', '3', '天津财经大学');
INSERT INTO `shool_info` VALUES ('164', '3', '天津城建大学');
INSERT INTO `shool_info` VALUES ('165', '3', '天津农学院');
INSERT INTO `shool_info` VALUES ('166', '3', '天津体育学院');
INSERT INTO `shool_info` VALUES ('167', '3', '天津音乐学院');
INSERT INTO `shool_info` VALUES ('168', '3', '天津美术学院');
INSERT INTO `shool_info` VALUES ('169', '3', '天津天狮学院');
INSERT INTO `shool_info` VALUES ('170', '3', '天津医学高等专科学校');
INSERT INTO `shool_info` VALUES ('171', '3', '天津市职业大学');
INSERT INTO `shool_info` VALUES ('172', '3', '天津商务职业学院');
INSERT INTO `shool_info` VALUES ('173', '3', '天津广播影视职业学院');
INSERT INTO `shool_info` VALUES ('174', '3', '天津中德职业技术学院');
INSERT INTO `shool_info` VALUES ('175', '3', '天津滨海职业学院');
INSERT INTO `shool_info` VALUES ('176', '3', '天津工程职业技术学院');
INSERT INTO `shool_info` VALUES ('177', '3', '天津青年职业学院');
INSERT INTO `shool_info` VALUES ('178', '3', '天津渤海职业技术学院');
INSERT INTO `shool_info` VALUES ('179', '3', '天津电子信息职业技术学院');
INSERT INTO `shool_info` VALUES ('180', '3', '天津机电职业技术学院');
INSERT INTO `shool_info` VALUES ('181', '3', '天津现代职业技术学院');
INSERT INTO `shool_info` VALUES ('182', '3', '天津公安警官职业学院');
INSERT INTO `shool_info` VALUES ('183', '3', '天津轻工职业技术学院');
INSERT INTO `shool_info` VALUES ('184', '3', '天津国土资源和房屋职业学院');
INSERT INTO `shool_info` VALUES ('185', '3', '天津开发区职业技术学院');
INSERT INTO `shool_info` VALUES ('186', '3', '天津艺术职业学院');
INSERT INTO `shool_info` VALUES ('187', '3', '天津交通职业学院');
INSERT INTO `shool_info` VALUES ('188', '3', '天津冶金职业技术学院');
INSERT INTO `shool_info` VALUES ('189', '3', '天津石油职业技术学院');
INSERT INTO `shool_info` VALUES ('190', '3', '天津城市职业学院');
INSERT INTO `shool_info` VALUES ('191', '3', '天津铁道职业技术学院');
INSERT INTO `shool_info` VALUES ('192', '3', '天津工艺美术职业学院');
INSERT INTO `shool_info` VALUES ('193', '3', '天津城市建设管理职业技术学院');
INSERT INTO `shool_info` VALUES ('194', '3', '天津生物工程职业技术学院');
INSERT INTO `shool_info` VALUES ('195', '3', '天津海运职业学院');
INSERT INTO `shool_info` VALUES ('196', '4', '重庆大学');
INSERT INTO `shool_info` VALUES ('197', '4', '西南大学');
INSERT INTO `shool_info` VALUES ('198', '4', '重庆邮电大学');
INSERT INTO `shool_info` VALUES ('199', '4', '重庆交通大学');
INSERT INTO `shool_info` VALUES ('200', '4', '重庆医科大学');
INSERT INTO `shool_info` VALUES ('201', '4', '重庆师范大学');
INSERT INTO `shool_info` VALUES ('202', '4', '西南政法大学');
INSERT INTO `shool_info` VALUES ('203', '4', '重庆理工大学');
INSERT INTO `shool_info` VALUES ('204', '4', '重庆工商大学');
INSERT INTO `shool_info` VALUES ('205', '4', '重庆文理学院');
INSERT INTO `shool_info` VALUES ('206', '4', '重庆三峡学院');
INSERT INTO `shool_info` VALUES ('207', '4', '长江师范学院');
INSERT INTO `shool_info` VALUES ('208', '4', '四川外国语大学');
INSERT INTO `shool_info` VALUES ('209', '4', '四川美术学院');
INSERT INTO `shool_info` VALUES ('210', '4', '重庆科技学院');
INSERT INTO `shool_info` VALUES ('211', '4', '重庆警察学院');
INSERT INTO `shool_info` VALUES ('212', '4', '重庆人文科技学院');
INSERT INTO `shool_info` VALUES ('213', '4', '重庆第二师范学院');
INSERT INTO `shool_info` VALUES ('214', '4', '重庆电力高等专科学校');
INSERT INTO `shool_info` VALUES ('215', '4', '重庆幼儿师范高等专科学校');
INSERT INTO `shool_info` VALUES ('216', '4', '重庆三峡医药高等专科学校');
INSERT INTO `shool_info` VALUES ('217', '4', '重庆医药高等专科学校');
INSERT INTO `shool_info` VALUES ('218', '4', '重庆航天职业技术学院');
INSERT INTO `shool_info` VALUES ('219', '4', '重庆传媒职业学院');
INSERT INTO `shool_info` VALUES ('220', '4', '重庆房地产职业学院');
INSERT INTO `shool_info` VALUES ('221', '4', '重庆青年职业技术学院');
INSERT INTO `shool_info` VALUES ('222', '4', '重庆财经职业学院');
INSERT INTO `shool_info` VALUES ('223', '4', '重庆科创职业学院');
INSERT INTO `shool_info` VALUES ('224', '4', '重庆建筑工程职业学院');
INSERT INTO `shool_info` VALUES ('225', '4', '重庆电讯职业学院');
INSERT INTO `shool_info` VALUES ('226', '4', '重庆能源职业学院');
INSERT INTO `shool_info` VALUES ('227', '4', '重庆商务职业学院');
INSERT INTO `shool_info` VALUES ('228', '4', '重庆交通职业学院');
INSERT INTO `shool_info` VALUES ('229', '4', '重庆化工职业学院');
INSERT INTO `shool_info` VALUES ('230', '4', '重庆旅游职业学院');
INSERT INTO `shool_info` VALUES ('231', '4', '重庆安全技术职业学院');
INSERT INTO `shool_info` VALUES ('232', '4', '重庆公共运输职业学院');
INSERT INTO `shool_info` VALUES ('233', '4', '重庆艺术工程职业学院');
INSERT INTO `shool_info` VALUES ('234', '4', '重庆轻工职业学院');
INSERT INTO `shool_info` VALUES ('235', '4', '重庆电信职业学院');
INSERT INTO `shool_info` VALUES ('236', '4', '重庆经贸职业学院');
INSERT INTO `shool_info` VALUES ('237', '4', '重庆文化艺术职业学院');
INSERT INTO `shool_info` VALUES ('238', '4', '重庆服装工程职业学院');
INSERT INTO `shool_info` VALUES ('239', '4', '重庆工业职业技术学院');
INSERT INTO `shool_info` VALUES ('240', '4', '重庆三峡职业学院');
INSERT INTO `shool_info` VALUES ('241', '4', '重庆工贸职业技术学院');
INSERT INTO `shool_info` VALUES ('242', '4', '重庆机电职业技术学院');
INSERT INTO `shool_info` VALUES ('243', '4', '重庆正大软件职业技术学院');
INSERT INTO `shool_info` VALUES ('244', '4', '重庆电子工程职业学院');
INSERT INTO `shool_info` VALUES ('245', '4', '重庆海联职业技术学院');
INSERT INTO `shool_info` VALUES ('246', '4', '重庆信息技术职业学院');
INSERT INTO `shool_info` VALUES ('247', '4', '重庆城市管理职业学院');
INSERT INTO `shool_info` VALUES ('248', '4', '重庆工程职业技术学院');
INSERT INTO `shool_info` VALUES ('249', '4', '重庆城市职业学院');
INSERT INTO `shool_info` VALUES ('250', '4', '重庆水利电力职业技术学院');
INSERT INTO `shool_info` VALUES ('251', '4', '重庆工商职业学院');
INSERT INTO `shool_info` VALUES ('252', '4', '重庆民生职业技术学院');
INSERT INTO `shool_info` VALUES ('253', '5', '东北石油大学');
INSERT INTO `shool_info` VALUES ('254', '5', '黑龙江八一农垦大学');
INSERT INTO `shool_info` VALUES ('255', '5', '大庆师范学院');
INSERT INTO `shool_info` VALUES ('256', '5', '大庆医学高等专科学校');
INSERT INTO `shool_info` VALUES ('257', '5', '大庆职业学院');
INSERT INTO `shool_info` VALUES ('258', '6', '大兴安岭职业学院');
INSERT INTO `shool_info` VALUES ('259', '7', '东北林业大学');
INSERT INTO `shool_info` VALUES ('260', '7', '哈尔滨工业大学');
INSERT INTO `shool_info` VALUES ('261', '7', '哈尔滨工程大学');
INSERT INTO `shool_info` VALUES ('262', '7', '黑龙江大学');
INSERT INTO `shool_info` VALUES ('263', '7', '哈尔滨理工大学');
INSERT INTO `shool_info` VALUES ('264', '7', '黑龙江科技大学');
INSERT INTO `shool_info` VALUES ('265', '7', '东北农业大学');
INSERT INTO `shool_info` VALUES ('266', '7', '哈尔滨医科大学');
INSERT INTO `shool_info` VALUES ('267', '7', '黑龙江中医药大学');
INSERT INTO `shool_info` VALUES ('268', '7', '哈尔滨师范大学');
INSERT INTO `shool_info` VALUES ('269', '7', '哈尔滨商业大学');
INSERT INTO `shool_info` VALUES ('270', '7', '哈尔滨体育学院');
INSERT INTO `shool_info` VALUES ('271', '7', '哈尔滨金融学院');
INSERT INTO `shool_info` VALUES ('272', '7', '哈尔滨学院');
INSERT INTO `shool_info` VALUES ('273', '7', '黑龙江工程学院');
INSERT INTO `shool_info` VALUES ('274', '7', '黑龙江东方学院');
INSERT INTO `shool_info` VALUES ('275', '7', '黑龙江外国语学院');
INSERT INTO `shool_info` VALUES ('276', '7', '黑龙江财经学院');
INSERT INTO `shool_info` VALUES ('277', '7', '哈尔滨石油学院');
INSERT INTO `shool_info` VALUES ('278', '7', '哈尔滨远东理工学院');
INSERT INTO `shool_info` VALUES ('279', '7', '哈尔滨剑桥学院');
INSERT INTO `shool_info` VALUES ('280', '7', '哈尔滨广厦学院');
INSERT INTO `shool_info` VALUES ('281', '7', '哈尔滨华德学院');
INSERT INTO `shool_info` VALUES ('282', '7', '黑龙江护理高等专科学校');
INSERT INTO `shool_info` VALUES ('283', '7', '哈尔滨幼儿师范高等专科学校');
INSERT INTO `shool_info` VALUES ('284', '7', '黑龙江职业学院');
INSERT INTO `shool_info` VALUES ('285', '7', '黑龙江建筑职业技术学院');
INSERT INTO `shool_info` VALUES ('286', '7', '哈尔滨传媒职业学院');
INSERT INTO `shool_info` VALUES ('287', '7', '哈尔滨江南职业技术学院');
INSERT INTO `shool_info` VALUES ('288', '7', '哈尔滨应用职业技术学院');
INSERT INTO `shool_info` VALUES ('289', '7', '哈尔滨科学技术职业学院');
INSERT INTO `shool_info` VALUES ('290', '7', '黑龙江粮食职业学院');
INSERT INTO `shool_info` VALUES ('291', '7', '哈尔滨工程技术职业学院');
INSERT INTO `shool_info` VALUES ('292', '7', '哈尔滨华夏计算机职业技术学院');
INSERT INTO `shool_info` VALUES ('293', '7', '黑龙江艺术职业学院');
INSERT INTO `shool_info` VALUES ('294', '7', '黑龙江农业工程职业学院');
INSERT INTO `shool_info` VALUES ('295', '7', '黑龙江农垦职业学院');
INSERT INTO `shool_info` VALUES ('296', '7', '黑龙江司法警官职业学院');
INSERT INTO `shool_info` VALUES ('297', '7', '哈尔滨电力职业技术学院');
INSERT INTO `shool_info` VALUES ('298', '7', '哈尔滨铁道职业技术学院');
INSERT INTO `shool_info` VALUES ('299', '7', '哈尔滨职业技术学院');
INSERT INTO `shool_info` VALUES ('300', '7', '黑龙江生物科技职业学院');
INSERT INTO `shool_info` VALUES ('301', '7', '黑龙江公安警官职业学院');
INSERT INTO `shool_info` VALUES ('302', '7', '黑龙江信息技术职业学院');
INSERT INTO `shool_info` VALUES ('303', '7', '黑龙江旅游职业技术学院');
INSERT INTO `shool_info` VALUES ('304', '7', '黑龙江三江美术职业学院');
INSERT INTO `shool_info` VALUES ('305', '7', '黑龙江生态工程职业学院');
INSERT INTO `shool_info` VALUES ('306', '7', '黑龙江民族职业学院');
INSERT INTO `shool_info` VALUES ('307', '8', '鹤岗师范高等专科学校');
INSERT INTO `shool_info` VALUES ('308', '9', '黑河学院');
INSERT INTO `shool_info` VALUES ('309', '10', '黑龙江工业学院');
INSERT INTO `shool_info` VALUES ('310', '11', '佳木斯大学');
INSERT INTO `shool_info` VALUES ('311', '11', '佳木斯职业学院');
INSERT INTO `shool_info` VALUES ('312', '12', '牡丹江医学院');
INSERT INTO `shool_info` VALUES ('313', '12', '牡丹江师范学院');
INSERT INTO `shool_info` VALUES ('314', '12', '黑龙江幼儿师范高等专科学校');
INSERT INTO `shool_info` VALUES ('315', '12', '牡丹江大学');
INSERT INTO `shool_info` VALUES ('316', '12', '黑龙江林业职业技术学院');
INSERT INTO `shool_info` VALUES ('317', '12', '黑龙江农业职业技术学院');
INSERT INTO `shool_info` VALUES ('318', '12', '黑龙江农业经济职业学院');
INSERT INTO `shool_info` VALUES ('319', '12', '黑龙江商业职业学院');
INSERT INTO `shool_info` VALUES ('320', '13', '七台河职业学院');
INSERT INTO `shool_info` VALUES ('321', '14', '齐齐哈尔大学');
INSERT INTO `shool_info` VALUES ('322', '14', '齐齐哈尔医学院');
INSERT INTO `shool_info` VALUES ('323', '14', '齐齐哈尔工程学院');
INSERT INTO `shool_info` VALUES ('324', '14', '齐齐哈尔高等师范专科学校');
INSERT INTO `shool_info` VALUES ('325', '14', '黑龙江交通职业技术学院');
INSERT INTO `shool_info` VALUES ('326', '14', '齐齐哈尔理工职业学院');
INSERT INTO `shool_info` VALUES ('327', '15', '黑龙江煤炭职业技术学院');
INSERT INTO `shool_info` VALUES ('328', '16', '绥化学院');
INSERT INTO `shool_info` VALUES ('329', '16', '黑龙江农垦科技职业学院');
INSERT INTO `shool_info` VALUES ('330', '17', '伊春职业学院');
INSERT INTO `shool_info` VALUES ('331', '18', '白城师范学院');
INSERT INTO `shool_info` VALUES ('332', '18', '白城医学高等专科学校');
INSERT INTO `shool_info` VALUES ('333', '18', '白城职业技术学院');
INSERT INTO `shool_info` VALUES ('334', '19', '长白山职业技术学院');
INSERT INTO `shool_info` VALUES ('335', '20', '北华大学');
INSERT INTO `shool_info` VALUES ('336', '20', '东北电力大学');
INSERT INTO `shool_info` VALUES ('337', '20', '吉林化工学院');
INSERT INTO `shool_info` VALUES ('338', '20', '吉林农业科技学院');
INSERT INTO `shool_info` VALUES ('339', '20', '吉林医药学院');
INSERT INTO `shool_info` VALUES ('340', '20', '吉林铁道职业技术学院');
INSERT INTO `shool_info` VALUES ('341', '20', '吉林电子信息职业技术学院');
INSERT INTO `shool_info` VALUES ('342', '20', '吉林工业职业技术学院');
INSERT INTO `shool_info` VALUES ('343', '21', '辽源职业技术学院');
INSERT INTO `shool_info` VALUES ('344', '22', '吉林师范大学');
INSERT INTO `shool_info` VALUES ('345', '22', '四平职业大学');
INSERT INTO `shool_info` VALUES ('346', '22', '吉林农业工程职业技术学院');
INSERT INTO `shool_info` VALUES ('347', '23', '松原职业技术学院');
INSERT INTO `shool_info` VALUES ('348', '24', '通化师范学院');
INSERT INTO `shool_info` VALUES ('349', '25', '延边大学');
INSERT INTO `shool_info` VALUES ('350', '25', '延边职业技术学院');
INSERT INTO `shool_info` VALUES ('351', '26', '吉林大学');
INSERT INTO `shool_info` VALUES ('352', '26', '东北师范大学');
INSERT INTO `shool_info` VALUES ('353', '26', '长春理工大学');
INSERT INTO `shool_info` VALUES ('354', '26', '长春工业大学');
INSERT INTO `shool_info` VALUES ('355', '26', '吉林建筑大学');
INSERT INTO `shool_info` VALUES ('356', '26', '吉林农业大学');
INSERT INTO `shool_info` VALUES ('357', '26', '长春中医药大学');
INSERT INTO `shool_info` VALUES ('358', '26', '长春师范大学');
INSERT INTO `shool_info` VALUES ('359', '26', '吉林财经大学');
INSERT INTO `shool_info` VALUES ('360', '26', '长春大学');
INSERT INTO `shool_info` VALUES ('361', '26', '吉林工程技术师范学院');
INSERT INTO `shool_info` VALUES ('362', '26', '吉林体育学院');
INSERT INTO `shool_info` VALUES ('363', '26', '吉林艺术学院');
INSERT INTO `shool_info` VALUES ('364', '26', '吉林华桥外国语学院');
INSERT INTO `shool_info` VALUES ('365', '26', '吉林工商学院');
INSERT INTO `shool_info` VALUES ('366', '26', '长春工程学院');
INSERT INTO `shool_info` VALUES ('367', '26', '吉林警察学院');
INSERT INTO `shool_info` VALUES ('368', '26', '长春光华学院');
INSERT INTO `shool_info` VALUES ('369', '26', '长春建筑学院');
INSERT INTO `shool_info` VALUES ('370', '26', '长春科技学院');
INSERT INTO `shool_info` VALUES ('371', '26', '吉林动画学院');
INSERT INTO `shool_info` VALUES ('372', '26', '长春汽车工业高等专科学校');
INSERT INTO `shool_info` VALUES ('373', '26', '长春金融高等专科学校');
INSERT INTO `shool_info` VALUES ('374', '26', '长春医学高等专科学校');
INSERT INTO `shool_info` VALUES ('375', '26', '吉林交通职业技术学院');
INSERT INTO `shool_info` VALUES ('376', '26', '吉林科技职业技术学院');
INSERT INTO `shool_info` VALUES ('377', '26', '吉林城市职业技术学院');
INSERT INTO `shool_info` VALUES ('378', '26', '长春东方职业学院');
INSERT INTO `shool_info` VALUES ('379', '26', '吉林司法警官职业学院');
INSERT INTO `shool_info` VALUES ('380', '26', '长春职业技术学院');
INSERT INTO `shool_info` VALUES ('381', '26', '长春信息技术职业学院');
INSERT INTO `shool_info` VALUES ('382', '27', '辽宁科技大学');
INSERT INTO `shool_info` VALUES ('383', '27', '鞍山师范学院');
INSERT INTO `shool_info` VALUES ('384', '28', '辽宁科技学院');
INSERT INTO `shool_info` VALUES ('385', '28', '辽宁冶金职业技术学院');
INSERT INTO `shool_info` VALUES ('386', '29', '朝阳师范高等专科学校');
INSERT INTO `shool_info` VALUES ('387', '30', '大连理工大学');
INSERT INTO `shool_info` VALUES ('388', '30', '大连海事大学');
INSERT INTO `shool_info` VALUES ('389', '30', '大连交通大学');
INSERT INTO `shool_info` VALUES ('390', '30', '大连工业大学');
INSERT INTO `shool_info` VALUES ('391', '30', '大连海洋大学');
INSERT INTO `shool_info` VALUES ('392', '30', '大连医科大学');
INSERT INTO `shool_info` VALUES ('393', '30', '辽宁师范大学');
INSERT INTO `shool_info` VALUES ('394', '30', '大连外国语大学');
INSERT INTO `shool_info` VALUES ('395', '30', '东北财经大学');
INSERT INTO `shool_info` VALUES ('396', '30', '大连大学');
INSERT INTO `shool_info` VALUES ('397', '30', '大连民族学院');
INSERT INTO `shool_info` VALUES ('398', '30', '大连科技学院');
INSERT INTO `shool_info` VALUES ('399', '30', '大连财经学院');
INSERT INTO `shool_info` VALUES ('400', '30', '大连艺术学院');
INSERT INTO `shool_info` VALUES ('401', '30', '大连东软信息学院');
INSERT INTO `shool_info` VALUES ('402', '30', '辽宁对外经贸学院');
INSERT INTO `shool_info` VALUES ('403', '30', '辽宁警官高等专科学校');
INSERT INTO `shool_info` VALUES ('404', '30', '辽宁税务高等专科学校');
INSERT INTO `shool_info` VALUES ('405', '30', '大连职业技术学院');
INSERT INTO `shool_info` VALUES ('406', '30', '大连航运职业技术学院');
INSERT INTO `shool_info` VALUES ('407', '30', '大连装备制造职业技术学院');
INSERT INTO `shool_info` VALUES ('408', '30', '大连汽车职业技术学院');
INSERT INTO `shool_info` VALUES ('409', '30', '辽宁轻工职业学院');
INSERT INTO `shool_info` VALUES ('410', '30', '大连商务职业学院');
INSERT INTO `shool_info` VALUES ('411', '30', '大连软件职业学院');
INSERT INTO `shool_info` VALUES ('412', '30', '大连翻译职业学院');
INSERT INTO `shool_info` VALUES ('413', '30', '大连枫叶职业技术学院');
INSERT INTO `shool_info` VALUES ('414', '31', '辽东学院');
INSERT INTO `shool_info` VALUES ('415', '31', '辽宁地质工程职业学院');
INSERT INTO `shool_info` VALUES ('416', '31', '辽宁机电职业技术学院');
INSERT INTO `shool_info` VALUES ('417', '32', '辽宁石油化工大学');
INSERT INTO `shool_info` VALUES ('418', '32', '抚顺师范高等专科学校');
INSERT INTO `shool_info` VALUES ('419', '32', '抚顺职业技术学院');
INSERT INTO `shool_info` VALUES ('420', '33', '辽宁工程技术大学');
INSERT INTO `shool_info` VALUES ('421', '33', '阜新高等专科学校');
INSERT INTO `shool_info` VALUES ('422', '34', '辽宁财贸学院');
INSERT INTO `shool_info` VALUES ('423', '34', '渤海船舶职业学院');
INSERT INTO `shool_info` VALUES ('424', '35', '辽宁工业大学');
INSERT INTO `shool_info` VALUES ('425', '35', '渤海大学');
INSERT INTO `shool_info` VALUES ('426', '35', '辽宁医学院');
INSERT INTO `shool_info` VALUES ('427', '35', '锦州师范高等专科学校');
INSERT INTO `shool_info` VALUES ('428', '35', '辽宁理工职业学院');
INSERT INTO `shool_info` VALUES ('429', '35', '辽宁铁道职业技术学院');
INSERT INTO `shool_info` VALUES ('430', '35', '辽宁石化职业技术学院');
INSERT INTO `shool_info` VALUES ('431', '36', '辽宁轨道交通职业学院');
INSERT INTO `shool_info` VALUES ('432', '36', '辽宁建筑职业学院');
INSERT INTO `shool_info` VALUES ('433', '36', '辽阳职业技术学院');
INSERT INTO `shool_info` VALUES ('434', '37', '盘锦职业技术学院');
INSERT INTO `shool_info` VALUES ('435', '37', '辽河石油职业技术学院');
INSERT INTO `shool_info` VALUES ('436', '38', '东北大学');
INSERT INTO `shool_info` VALUES ('437', '38', '辽宁大学');
INSERT INTO `shool_info` VALUES ('438', '38', '沈阳工业大学');
INSERT INTO `shool_info` VALUES ('439', '38', '沈阳航空航天大学');
INSERT INTO `shool_info` VALUES ('440', '38', '沈阳理工大学');
INSERT INTO `shool_info` VALUES ('441', '38', '沈阳化工大学');
INSERT INTO `shool_info` VALUES ('442', '38', '沈阳建筑大学');
INSERT INTO `shool_info` VALUES ('443', '38', '沈阳农业大学');
INSERT INTO `shool_info` VALUES ('444', '38', '中国医科大学');
INSERT INTO `shool_info` VALUES ('445', '38', '辽宁中医药大学');
INSERT INTO `shool_info` VALUES ('446', '38', '沈阳药科大学');
INSERT INTO `shool_info` VALUES ('447', '38', '沈阳师范大学');
INSERT INTO `shool_info` VALUES ('448', '38', '沈阳大学');
INSERT INTO `shool_info` VALUES ('449', '38', '中国刑事警察学院');
INSERT INTO `shool_info` VALUES ('450', '38', '沈阳医学院');
INSERT INTO `shool_info` VALUES ('451', '38', '沈阳体育学院');
INSERT INTO `shool_info` VALUES ('452', '38', '沈阳音乐学院');
INSERT INTO `shool_info` VALUES ('453', '38', '鲁迅美术学院');
INSERT INTO `shool_info` VALUES ('454', '38', '沈阳工程学院');
INSERT INTO `shool_info` VALUES ('455', '38', '沈阳工学院');
INSERT INTO `shool_info` VALUES ('456', '38', '沈阳城市建设学院');
INSERT INTO `shool_info` VALUES ('457', '38', '沈阳城市学院');
INSERT INTO `shool_info` VALUES ('458', '38', '辽宁何氏医学院');
INSERT INTO `shool_info` VALUES ('459', '38', '辽宁交通高等专科学校');
INSERT INTO `shool_info` VALUES ('460', '38', '辽宁民族师范高等专科学校');
INSERT INTO `shool_info` VALUES ('461', '38', '辽宁现代服务职业技术学院');
INSERT INTO `shool_info` VALUES ('462', '38', '辽宁城市建设职业技术学院');
INSERT INTO `shool_info` VALUES ('463', '38', '辽宁卫生职业技术学院');
INSERT INTO `shool_info` VALUES ('464', '38', '沈阳北软信息职业技术学院');
INSERT INTO `shool_info` VALUES ('465', '38', '辽宁政法职业学院');
INSERT INTO `shool_info` VALUES ('466', '38', '辽宁水利职业学院');
INSERT INTO `shool_info` VALUES ('467', '38', '沈阳航空职业技术学院');
INSERT INTO `shool_info` VALUES ('468', '38', '辽宁体育运动职业技术学院');
INSERT INTO `shool_info` VALUES ('469', '38', '辽宁林业职业技术学院');
INSERT INTO `shool_info` VALUES ('470', '38', '沈阳职业技术学院');
INSERT INTO `shool_info` VALUES ('471', '38', '辽宁金融职业学院');
INSERT INTO `shool_info` VALUES ('472', '38', '辽宁广告职业学院');
INSERT INTO `shool_info` VALUES ('473', '38', '辽宁经济职业技术学院');
INSERT INTO `shool_info` VALUES ('474', '38', '辽宁美术职业学院');
INSERT INTO `shool_info` VALUES ('475', '38', '辽宁商贸职业学院');
INSERT INTO `shool_info` VALUES ('476', '38', '辽宁装备制造职业技术学院');
INSERT INTO `shool_info` VALUES ('477', '39', '铁岭师范高等专科学校');
INSERT INTO `shool_info` VALUES ('478', '39', '辽宁工程职业学院');
INSERT INTO `shool_info` VALUES ('479', '39', '铁岭卫生职业学院');
INSERT INTO `shool_info` VALUES ('480', '39', '辽宁职业学院');
INSERT INTO `shool_info` VALUES ('481', '40', '营口理工学院');
INSERT INTO `shool_info` VALUES ('482', '40', '辽宁农业职业技术学院');
INSERT INTO `shool_info` VALUES ('483', '40', '营口职业技术学院');
INSERT INTO `shool_info` VALUES ('484', '41', '滨州医学院');
INSERT INTO `shool_info` VALUES ('485', '41', '滨州学院');
INSERT INTO `shool_info` VALUES ('486', '41', '滨州职业学院');
INSERT INTO `shool_info` VALUES ('487', '42', '德州学院');
INSERT INTO `shool_info` VALUES ('488', '42', '德州职业技术学院');
INSERT INTO `shool_info` VALUES ('489', '42', '德州科技职业学院');
INSERT INTO `shool_info` VALUES ('490', '42', '山东华宇职业技术学院');
INSERT INTO `shool_info` VALUES ('491', '43', '东营职业学院');
INSERT INTO `shool_info` VALUES ('492', '43', '山东大王职业学院');
INSERT INTO `shool_info` VALUES ('493', '43', '山东胜利职业学院');
INSERT INTO `shool_info` VALUES ('494', '44', '菏泽学院');
INSERT INTO `shool_info` VALUES ('495', '44', '菏泽医学专科学校');
INSERT INTO `shool_info` VALUES ('496', '44', '菏泽家政职业学院');
INSERT INTO `shool_info` VALUES ('497', '44', '菏泽职业学院');
INSERT INTO `shool_info` VALUES ('498', '45', '山东大学');
INSERT INTO `shool_info` VALUES ('499', '45', '济南大学');
INSERT INTO `shool_info` VALUES ('500', '45', '山东建筑大学');
INSERT INTO `shool_info` VALUES ('501', '45', '齐鲁工业大学');
INSERT INTO `shool_info` VALUES ('502', '45', '山东中医药大学');
INSERT INTO `shool_info` VALUES ('503', '45', '山东师范大学');
INSERT INTO `shool_info` VALUES ('504', '45', '山东财经大学');
INSERT INTO `shool_info` VALUES ('505', '45', '山东体育学院');
INSERT INTO `shool_info` VALUES ('506', '45', '山东艺术学院');
INSERT INTO `shool_info` VALUES ('507', '45', '山东工艺美术学院');
INSERT INTO `shool_info` VALUES ('508', '45', '山东警察学院');
INSERT INTO `shool_info` VALUES ('509', '45', '山东交通学院');
INSERT INTO `shool_info` VALUES ('510', '45', '山东女子学院');
INSERT INTO `shool_info` VALUES ('511', '45', '山东英才学院');
INSERT INTO `shool_info` VALUES ('512', '45', '山东协和学院');
INSERT INTO `shool_info` VALUES ('513', '45', '齐鲁师范学院');
INSERT INTO `shool_info` VALUES ('514', '45', '山东青年政治学院');
INSERT INTO `shool_info` VALUES ('515', '45', '山东管理学院');
INSERT INTO `shool_info` VALUES ('516', '45', '山东农业工程学院');
INSERT INTO `shool_info` VALUES ('517', '45', '山东政法学院');
INSERT INTO `shool_info` VALUES ('518', '45', '山东电力高等专科学校');
INSERT INTO `shool_info` VALUES ('519', '45', '济南幼儿师范高等专科学校');
INSERT INTO `shool_info` VALUES ('520', '45', '山东商业职业技术学院');
INSERT INTO `shool_info` VALUES ('521', '45', '山东职业学院');
INSERT INTO `shool_info` VALUES ('522', '45', '山东传媒职业学院');
INSERT INTO `shool_info` VALUES ('523', '45', '济南护理职业学院');
INSERT INTO `shool_info` VALUES ('524', '45', '山东劳动职业技术学院');
INSERT INTO `shool_info` VALUES ('525', '45', '山东力明科技职业学院');
INSERT INTO `shool_info` VALUES ('526', '45', '山东圣翰财贸职业学院');
INSERT INTO `shool_info` VALUES ('527', '45', '山东现代职业学院');
INSERT INTO `shool_info` VALUES ('528', '45', '济南职业学院');
INSERT INTO `shool_info` VALUES ('529', '45', '山东凯文科技职业学院');
INSERT INTO `shool_info` VALUES ('530', '45', '济南工程职业技术学院');
INSERT INTO `shool_info` VALUES ('531', '45', '山东电子职业技术学院');
INSERT INTO `shool_info` VALUES ('532', '45', '山东旅游职业学院');
INSERT INTO `shool_info` VALUES ('533', '45', '山东杏林科技职业学院');
INSERT INTO `shool_info` VALUES ('534', '45', '山东外事翻译职业学院');
INSERT INTO `shool_info` VALUES ('535', '45', '山东城市建设职业学院');
INSERT INTO `shool_info` VALUES ('536', '45', '山东司法警官职业学院');
INSERT INTO `shool_info` VALUES ('537', '46', '曲阜师范大学');
INSERT INTO `shool_info` VALUES ('538', '46', '济宁医学院');
INSERT INTO `shool_info` VALUES ('539', '46', '济宁学院');
INSERT INTO `shool_info` VALUES ('540', '46', '山东理工职业学院');
INSERT INTO `shool_info` VALUES ('541', '46', '曲阜远东职业技术学院');
INSERT INTO `shool_info` VALUES ('542', '46', '济宁职业技术学院');
INSERT INTO `shool_info` VALUES ('543', '47', '莱芜职业技术学院');
INSERT INTO `shool_info` VALUES ('544', '48', '聊城大学');
INSERT INTO `shool_info` VALUES ('545', '48', '聊城职业技术学院');
INSERT INTO `shool_info` VALUES ('546', '49', '临沂大学');
INSERT INTO `shool_info` VALUES ('547', '49', '山东医学高等专科学校');
INSERT INTO `shool_info` VALUES ('548', '49', '临沂职业学院');
INSERT INTO `shool_info` VALUES ('549', '50', '中国海洋大学');
INSERT INTO `shool_info` VALUES ('550', '50', '山东科技大学');
INSERT INTO `shool_info` VALUES ('551', '50', '青岛科技大学');
INSERT INTO `shool_info` VALUES ('552', '50', '青岛理工大学');
INSERT INTO `shool_info` VALUES ('553', '50', '青岛农业大学');
INSERT INTO `shool_info` VALUES ('554', '50', '青岛大学');
INSERT INTO `shool_info` VALUES ('555', '50', '青岛滨海学院');
INSERT INTO `shool_info` VALUES ('556', '50', '青岛黄海学院');
INSERT INTO `shool_info` VALUES ('557', '50', '青岛工学院');
INSERT INTO `shool_info` VALUES ('558', '50', '青岛远洋船员职业学院');
INSERT INTO `shool_info` VALUES ('559', '50', '青岛职业技术学院');
INSERT INTO `shool_info` VALUES ('560', '50', '青岛飞洋职业技术学院');
INSERT INTO `shool_info` VALUES ('561', '50', '山东外贸职业学院');
INSERT INTO `shool_info` VALUES ('562', '50', '青岛酒店管理职业技术学院');
INSERT INTO `shool_info` VALUES ('563', '50', '青岛港湾职业技术学院');
INSERT INTO `shool_info` VALUES ('564', '50', '青岛恒星职业技术学院');
INSERT INTO `shool_info` VALUES ('565', '50', '青岛求实职业技术学院');
INSERT INTO `shool_info` VALUES ('566', '51', '日照职业技术学院');
INSERT INTO `shool_info` VALUES ('567', '51', '山东水利职业学院');
INSERT INTO `shool_info` VALUES ('568', '51', '山东外国语职业学院');
INSERT INTO `shool_info` VALUES ('569', '52', '山东农业大学');
INSERT INTO `shool_info` VALUES ('570', '52', '泰山医学院');
INSERT INTO `shool_info` VALUES ('571', '52', '泰山学院');
INSERT INTO `shool_info` VALUES ('572', '52', '泰山护理职业学院');
INSERT INTO `shool_info` VALUES ('573', '52', '山东服装职业学院');
INSERT INTO `shool_info` VALUES ('574', '52', '泰山职业技术学院');
INSERT INTO `shool_info` VALUES ('575', '53', '威海职业学院');
INSERT INTO `shool_info` VALUES ('576', '53', '山东药品食品职业学院');
INSERT INTO `shool_info` VALUES ('577', '54', '潍坊医学院');
INSERT INTO `shool_info` VALUES ('578', '54', '潍坊学院');
INSERT INTO `shool_info` VALUES ('579', '54', '潍坊科技学院');
INSERT INTO `shool_info` VALUES ('580', '54', '山东海事职业学院');
INSERT INTO `shool_info` VALUES ('581', '54', '潍坊护理职业学院');
INSERT INTO `shool_info` VALUES ('582', '54', '潍坊工程职业学院');
INSERT INTO `shool_info` VALUES ('583', '54', '潍坊职业学院');
INSERT INTO `shool_info` VALUES ('584', '54', '山东科技职业学院');
INSERT INTO `shool_info` VALUES ('585', '54', '山东畜牧兽医职业学院');
INSERT INTO `shool_info` VALUES ('586', '54', '山东交通职业学院');
INSERT INTO `shool_info` VALUES ('587', '54', '山东信息职业技术学院');
INSERT INTO `shool_info` VALUES ('588', '54', '山东经贸职业学院');
INSERT INTO `shool_info` VALUES ('589', '54', '潍坊工商职业学院');
INSERT INTO `shool_info` VALUES ('590', '55', '鲁东大学');
INSERT INTO `shool_info` VALUES ('591', '55', '烟台大学');
INSERT INTO `shool_info` VALUES ('592', '55', '山东工商学院');
INSERT INTO `shool_info` VALUES ('593', '55', '烟台南山学院');
INSERT INTO `shool_info` VALUES ('594', '55', '山东中医药高等专科学校');
INSERT INTO `shool_info` VALUES ('595', '55', '烟台工程职业技术学院');
INSERT INTO `shool_info` VALUES ('596', '55', '山东文化产业职业学院');
INSERT INTO `shool_info` VALUES ('597', '55', '烟台职业学院');
INSERT INTO `shool_info` VALUES ('598', '55', '山东商务职业学院');
INSERT INTO `shool_info` VALUES ('599', '55', '烟台汽车工程职业学院');
INSERT INTO `shool_info` VALUES ('600', '56', '枣庄学院');
INSERT INTO `shool_info` VALUES ('601', '56', '枣庄职业学院');
INSERT INTO `shool_info` VALUES ('602', '56', '枣庄科技职业学院');
INSERT INTO `shool_info` VALUES ('603', '57', '山东理工大学');
INSERT INTO `shool_info` VALUES ('604', '57', '山东万杰医学院');
INSERT INTO `shool_info` VALUES ('605', '57', '淄博师范高等专科学校');
INSERT INTO `shool_info` VALUES ('606', '57', '淄博职业学院');
INSERT INTO `shool_info` VALUES ('607', '57', '山东工业职业学院');
INSERT INTO `shool_info` VALUES ('608', '57', '山东化工职业学院');
INSERT INTO `shool_info` VALUES ('609', '57', '山东铝业职业学院');
INSERT INTO `shool_info` VALUES ('610', '57', '山东丝绸纺织职业学院');
INSERT INTO `shool_info` VALUES ('611', '58', '山西大同大学');
INSERT INTO `shool_info` VALUES ('612', '58', '大同煤炭职业技术学院');
INSERT INTO `shool_info` VALUES ('613', '59', '晋城职业技术学院');
INSERT INTO `shool_info` VALUES ('614', '60', '山西农业大学');
INSERT INTO `shool_info` VALUES ('615', '60', '晋中学院');
INSERT INTO `shool_info` VALUES ('616', '60', '晋中师范高等专科学校');
INSERT INTO `shool_info` VALUES ('617', '60', '山西同文职业技术学院');
INSERT INTO `shool_info` VALUES ('618', '60', '晋中职业技术学院');
INSERT INTO `shool_info` VALUES ('619', '61', '山西师范大学');
INSERT INTO `shool_info` VALUES ('620', '61', '临汾职业技术学院');
INSERT INTO `shool_info` VALUES ('621', '61', '山西信息职业技术学院');
INSERT INTO `shool_info` VALUES ('622', '61', '山西管理职业学院');
INSERT INTO `shool_info` VALUES ('623', '62', '吕梁学院');
INSERT INTO `shool_info` VALUES ('624', '63', '朔州师范高等专科学校');
INSERT INTO `shool_info` VALUES ('625', '63', '朔州职业技术学院');
INSERT INTO `shool_info` VALUES ('626', '64', '山西大学');
INSERT INTO `shool_info` VALUES ('627', '64', '太原科技大学');
INSERT INTO `shool_info` VALUES ('628', '64', '中北大学');
INSERT INTO `shool_info` VALUES ('629', '64', '太原理工大学');
INSERT INTO `shool_info` VALUES ('630', '64', '山西医科大学');
INSERT INTO `shool_info` VALUES ('631', '64', '山西财经大学');
INSERT INTO `shool_info` VALUES ('632', '64', '太原师范学院');
INSERT INTO `shool_info` VALUES ('633', '64', '山西中医学院');
INSERT INTO `shool_info` VALUES ('634', '64', '太原学院');
INSERT INTO `shool_info` VALUES ('635', '64', '山西工商学院');
INSERT INTO `shool_info` VALUES ('636', '64', '太原工业学院');
INSERT INTO `shool_info` VALUES ('637', '64', '山西传媒学院');
INSERT INTO `shool_info` VALUES ('638', '64', '太原电力高等专科学校');
INSERT INTO `shool_info` VALUES ('639', '64', '山西省财政税务专科学校');
INSERT INTO `shool_info` VALUES ('640', '64', '山西警官高等专科学校');
INSERT INTO `shool_info` VALUES ('641', '64', '山西药科职业学院');
INSERT INTO `shool_info` VALUES ('642', '64', '山西职业技术学院');
INSERT INTO `shool_info` VALUES ('643', '64', '山西老区职业技术学院');
INSERT INTO `shool_info` VALUES ('644', '64', '山西经贸职业学院');
INSERT INTO `shool_info` VALUES ('645', '64', '山西轻工职业技术学院');
INSERT INTO `shool_info` VALUES ('646', '64', '山西青年职业学院');
INSERT INTO `shool_info` VALUES ('647', '64', '山西艺术职业学院');
INSERT INTO `shool_info` VALUES ('648', '64', '山西建筑职业技术学院');
INSERT INTO `shool_info` VALUES ('649', '64', '山西工程职业技术学院');
INSERT INTO `shool_info` VALUES ('650', '64', '山西交通职业技术学院');
INSERT INTO `shool_info` VALUES ('651', '64', '山西兴华职业学院');
INSERT INTO `shool_info` VALUES ('652', '64', '山西戏剧职业学院');
INSERT INTO `shool_info` VALUES ('653', '64', '山西财贸职业技术学院');
INSERT INTO `shool_info` VALUES ('654', '64', '山西林业职业技术学院');
INSERT INTO `shool_info` VALUES ('655', '64', '山西煤炭职业技术学院');
INSERT INTO `shool_info` VALUES ('656', '64', '山西金融职业学院');
INSERT INTO `shool_info` VALUES ('657', '64', '太原城市职业技术学院');
INSERT INTO `shool_info` VALUES ('658', '64', '山西体育职业学院');
INSERT INTO `shool_info` VALUES ('659', '64', '山西警官职业学院');
INSERT INTO `shool_info` VALUES ('660', '64', '山西国际商务职业学院');
INSERT INTO `shool_info` VALUES ('661', '64', '太原旅游职业学院');
INSERT INTO `shool_info` VALUES ('662', '64', '山西旅游职业学院');
INSERT INTO `shool_info` VALUES ('663', '64', '山西电力职业技术学院');
INSERT INTO `shool_info` VALUES ('664', '64', '山西华澳商贸职业学院');
INSERT INTO `shool_info` VALUES ('665', '65', '忻州师范学院');
INSERT INTO `shool_info` VALUES ('666', '65', '忻州职业技术学院');
INSERT INTO `shool_info` VALUES ('667', '66', '阳泉师范高等专科学校');
INSERT INTO `shool_info` VALUES ('668', '66', '阳泉职业技术学院');
INSERT INTO `shool_info` VALUES ('669', '67', '运城学院');
INSERT INTO `shool_info` VALUES ('670', '67', '运城师范高等专科学校');
INSERT INTO `shool_info` VALUES ('671', '67', '运城幼儿师范高等专科学校');
INSERT INTO `shool_info` VALUES ('672', '67', '运城职业技术学院');
INSERT INTO `shool_info` VALUES ('673', '67', '运城护理职业学院');
INSERT INTO `shool_info` VALUES ('674', '67', '山西水利职业技术学院');
INSERT INTO `shool_info` VALUES ('675', '67', '山西运城农业职业技术学院');
INSERT INTO `shool_info` VALUES ('676', '68', '长治医学院');
INSERT INTO `shool_info` VALUES ('677', '68', '长治学院');
INSERT INTO `shool_info` VALUES ('678', '68', '长治职业技术学院');
INSERT INTO `shool_info` VALUES ('679', '68', '山西机电职业技术学院');
INSERT INTO `shool_info` VALUES ('680', '68', '潞安职业技术学院');
INSERT INTO `shool_info` VALUES ('681', '69', '安康学院');
INSERT INTO `shool_info` VALUES ('682', '69', '安康职业技术学院');
INSERT INTO `shool_info` VALUES ('683', '70', '宝鸡文理学院');
INSERT INTO `shool_info` VALUES ('684', '70', '宝鸡职业技术学院');
INSERT INTO `shool_info` VALUES ('685', '71', '陕西理工学院');
INSERT INTO `shool_info` VALUES ('686', '71', '陕西航空职业技术学院');
INSERT INTO `shool_info` VALUES ('687', '71', '汉中职业技术学院');
INSERT INTO `shool_info` VALUES ('688', '72', '商洛学院');
INSERT INTO `shool_info` VALUES ('689', '72', '商洛职业技术学院');
INSERT INTO `shool_info` VALUES ('690', '73', '铜川职业技术学院');
INSERT INTO `shool_info` VALUES ('691', '74', '渭南师范学院');
INSERT INTO `shool_info` VALUES ('692', '74', '陕西铁路工程职业技术学院');
INSERT INTO `shool_info` VALUES ('693', '74', '渭南职业技术学院');
INSERT INTO `shool_info` VALUES ('694', '75', '西安交通大学');
INSERT INTO `shool_info` VALUES ('695', '75', '西安电子科技大学');
INSERT INTO `shool_info` VALUES ('696', '75', '长安大学');
INSERT INTO `shool_info` VALUES ('697', '75', '陕西师范大学');
INSERT INTO `shool_info` VALUES ('698', '75', '西北工业大学');
INSERT INTO `shool_info` VALUES ('699', '75', '西北大学');
INSERT INTO `shool_info` VALUES ('700', '75', '西安理工大学');
INSERT INTO `shool_info` VALUES ('701', '75', '西安工业大学');
INSERT INTO `shool_info` VALUES ('702', '75', '西安建筑科技大学');
INSERT INTO `shool_info` VALUES ('703', '75', '西安科技大学');
INSERT INTO `shool_info` VALUES ('704', '75', '西安石油大学');
INSERT INTO `shool_info` VALUES ('705', '75', '陕西科技大学');
INSERT INTO `shool_info` VALUES ('706', '75', '西安工程大学');
INSERT INTO `shool_info` VALUES ('707', '75', '西安外国语大学');
INSERT INTO `shool_info` VALUES ('708', '75', '西北政法大学');
INSERT INTO `shool_info` VALUES ('709', '75', '西安邮电大学');
INSERT INTO `shool_info` VALUES ('710', '75', '西安体育学院');
INSERT INTO `shool_info` VALUES ('711', '75', '西安音乐学院');
INSERT INTO `shool_info` VALUES ('712', '75', '西安美术学院');
INSERT INTO `shool_info` VALUES ('713', '75', '西安文理学院');
INSERT INTO `shool_info` VALUES ('714', '75', '西安培华学院');
INSERT INTO `shool_info` VALUES ('715', '75', '西安财经学院');
INSERT INTO `shool_info` VALUES ('716', '75', '西安航空学院');
INSERT INTO `shool_info` VALUES ('717', '75', '西安医学院');
INSERT INTO `shool_info` VALUES ('718', '75', '西安思源学院');
INSERT INTO `shool_info` VALUES ('719', '75', '陕西学前师范学院');
INSERT INTO `shool_info` VALUES ('720', '75', '西安欧亚学院');
INSERT INTO `shool_info` VALUES ('721', '75', '西安外事学院');
INSERT INTO `shool_info` VALUES ('722', '75', '西安翻译学院');
INSERT INTO `shool_info` VALUES ('723', '75', '西京学院');
INSERT INTO `shool_info` VALUES ('724', '75', '西安电力高等专科学校');
INSERT INTO `shool_info` VALUES ('725', '75', '西安医学高等专科学校');
INSERT INTO `shool_info` VALUES ('726', '75', '西安城市建设职业学院');
INSERT INTO `shool_info` VALUES ('727', '75', '陕西工商职业学院');
INSERT INTO `shool_info` VALUES ('728', '75', '陕西艺术职业学院');
INSERT INTO `shool_info` VALUES ('729', '75', '陕西国防工业职业技术学院');
INSERT INTO `shool_info` VALUES ('730', '75', '西安航空职业技术学院');
INSERT INTO `shool_info` VALUES ('731', '75', '陕西交通职业技术学院');
INSERT INTO `shool_info` VALUES ('732', '75', '陕西职业技术学院');
INSERT INTO `shool_info` VALUES ('733', '75', '西安高新科技职业学院');
INSERT INTO `shool_info` VALUES ('734', '75', '西安科技商贸职业学院');
INSERT INTO `shool_info` VALUES ('735', '75', '陕西电子信息职业技术学院');
INSERT INTO `shool_info` VALUES ('736', '75', '西安海棠职业学院');
INSERT INTO `shool_info` VALUES ('737', '75', '西安汽车科技职业学院');
INSERT INTO `shool_info` VALUES ('738', '75', '西安东方亚太职业技术学院');
INSERT INTO `shool_info` VALUES ('739', '75', '陕西警官职业学院');
INSERT INTO `shool_info` VALUES ('740', '75', '陕西经济管理职业技术学院');
INSERT INTO `shool_info` VALUES ('741', '75', '西安铁路职业技术学院');
INSERT INTO `shool_info` VALUES ('742', '75', '西安职业技术学院');
INSERT INTO `shool_info` VALUES ('743', '75', '陕西青年职业学院');
INSERT INTO `shool_info` VALUES ('744', '75', '陕西电子科技职业学院');
INSERT INTO `shool_info` VALUES ('745', '76', '西北农林科技大学');
INSERT INTO `shool_info` VALUES ('746', '76', '陕西中医学院');
INSERT INTO `shool_info` VALUES ('747', '76', '咸阳师范学院');
INSERT INTO `shool_info` VALUES ('748', '76', '陕西国际商贸学院');
INSERT INTO `shool_info` VALUES ('749', '76', '陕西服装工程学院');
INSERT INTO `shool_info` VALUES ('750', '76', '陕西工业职业技术学院');
INSERT INTO `shool_info` VALUES ('751', '76', '杨凌职业技术学院');
INSERT INTO `shool_info` VALUES ('752', '76', '陕西能源职业技术学院');
INSERT INTO `shool_info` VALUES ('753', '76', '陕西财经职业技术学院');
INSERT INTO `shool_info` VALUES ('754', '76', '陕西邮电职业技术学院');
INSERT INTO `shool_info` VALUES ('755', '76', '咸阳职业技术学院');
INSERT INTO `shool_info` VALUES ('756', '76', '陕西旅游烹饪职业学院');
INSERT INTO `shool_info` VALUES ('757', '77', '延安大学');
INSERT INTO `shool_info` VALUES ('758', '77', '延安职业技术学院');
INSERT INTO `shool_info` VALUES ('759', '78', '榆林学院');
INSERT INTO `shool_info` VALUES ('760', '78', '榆林职业技术学院');
INSERT INTO `shool_info` VALUES ('761', '79', '河北大学');
INSERT INTO `shool_info` VALUES ('762', '79', '河北农业大学');
INSERT INTO `shool_info` VALUES ('763', '79', '中央司法警官学院');
INSERT INTO `shool_info` VALUES ('764', '79', '保定学院');
INSERT INTO `shool_info` VALUES ('765', '79', '河北金融学院');
INSERT INTO `shool_info` VALUES ('766', '79', '河北科技学院');
INSERT INTO `shool_info` VALUES ('767', '79', '保定幼儿师范高等专科学校');
INSERT INTO `shool_info` VALUES ('768', '79', '冀中职业学院');
INSERT INTO `shool_info` VALUES ('769', '79', '河北工艺美术职业学院');
INSERT INTO `shool_info` VALUES ('770', '79', '河北软件职业技术学院');
INSERT INTO `shool_info` VALUES ('771', '79', '保定职业技术学院');
INSERT INTO `shool_info` VALUES ('772', '79', '保定电力职业技术学院');
INSERT INTO `shool_info` VALUES ('773', '79', '保山学院');
INSERT INTO `shool_info` VALUES ('774', '79', '保山中医药高等专科学校');
INSERT INTO `shool_info` VALUES ('775', '80', '沧州师范学院');
INSERT INTO `shool_info` VALUES ('776', '80', '河北工程技术高等专科学校');
INSERT INTO `shool_info` VALUES ('777', '80', '沧州医学高等专科学校');
INSERT INTO `shool_info` VALUES ('778', '80', '泊头职业学院');
INSERT INTO `shool_info` VALUES ('779', '80', '渤海理工职业学院');
INSERT INTO `shool_info` VALUES ('780', '80', '沧州职业技术学院');
INSERT INTO `shool_info` VALUES ('781', '80', '渤海石油职业学院');
INSERT INTO `shool_info` VALUES ('782', '81', '承德医学院');
INSERT INTO `shool_info` VALUES ('783', '81', '河北民族师范学院');
INSERT INTO `shool_info` VALUES ('784', '81', '承德石油高等专科学校');
INSERT INTO `shool_info` VALUES ('785', '81', '河北旅游职业学院');
INSERT INTO `shool_info` VALUES ('786', '81', '承德护理职业学院');
INSERT INTO `shool_info` VALUES ('787', '82', '河北工程大学');
INSERT INTO `shool_info` VALUES ('788', '82', '邯郸学院');
INSERT INTO `shool_info` VALUES ('789', '82', '邯郸职业技术学院');
INSERT INTO `shool_info` VALUES ('790', '82', '河北司法警官职业学院');
INSERT INTO `shool_info` VALUES ('791', '83', '衡水学院');
INSERT INTO `shool_info` VALUES ('792', '83', '衡水职业技术学院');
INSERT INTO `shool_info` VALUES ('793', '84', '中国人民武装警察部队学院');
INSERT INTO `shool_info` VALUES ('794', '84', '廊坊师范学院');
INSERT INTO `shool_info` VALUES ('795', '84', '北华航天工业学院');
INSERT INTO `shool_info` VALUES ('796', '84', '廊坊东方职业技术学院');
INSERT INTO `shool_info` VALUES ('797', '84', '廊坊燕京职业技术学院');
INSERT INTO `shool_info` VALUES ('798', '84', '廊坊卫生职业学院');
INSERT INTO `shool_info` VALUES ('799', '84', '河北石油职业技术学院');
INSERT INTO `shool_info` VALUES ('800', '84', '廊坊职业技术学院');
INSERT INTO `shool_info` VALUES ('801', '85', '燕山大学');
INSERT INTO `shool_info` VALUES ('802', '85', '河北科技师范学院');
INSERT INTO `shool_info` VALUES ('803', '85', '河北外国语职业学院');
INSERT INTO `shool_info` VALUES ('804', '85', '河北建材职业技术学院');
INSERT INTO `shool_info` VALUES ('805', '85', '秦皇岛职业技术学院');
INSERT INTO `shool_info` VALUES ('806', '86', '防灾科技学院');
INSERT INTO `shool_info` VALUES ('807', '86', '华北科技学院');
INSERT INTO `shool_info` VALUES ('808', '86', '燕京理工学院');
INSERT INTO `shool_info` VALUES ('809', '87', '河北科技大学');
INSERT INTO `shool_info` VALUES ('810', '87', '河北医科大学');
INSERT INTO `shool_info` VALUES ('811', '87', '河北师范大学');
INSERT INTO `shool_info` VALUES ('812', '87', '石家庄铁道大学');
INSERT INTO `shool_info` VALUES ('813', '87', '河北经贸大学');
INSERT INTO `shool_info` VALUES ('814', '87', '石家庄经济学院');
INSERT INTO `shool_info` VALUES ('815', '87', '石家庄学院');
INSERT INTO `shool_info` VALUES ('816', '87', '河北体育学院');
INSERT INTO `shool_info` VALUES ('817', '87', '河北美术学院');
INSERT INTO `shool_info` VALUES ('818', '87', '河北外国语学院');
INSERT INTO `shool_info` VALUES ('819', '87', '河北中医学院');
INSERT INTO `shool_info` VALUES ('820', '87', '河北传媒学院');
INSERT INTO `shool_info` VALUES ('821', '87', '石家庄人民医学高等专科学校');
INSERT INTO `shool_info` VALUES ('822', '87', '石家庄幼儿师范高等专科学校');
INSERT INTO `shool_info` VALUES ('823', '87', '石家庄医学高等专科学校');
INSERT INTO `shool_info` VALUES ('824', '87', '河北工业职业技术学院');
INSERT INTO `shool_info` VALUES ('825', '87', '石家庄职业技术学院');
INSERT INTO `shool_info` VALUES ('826', '87', '石家庄工程职业学院');
INSERT INTO `shool_info` VALUES ('827', '87', '石家庄城市经济职业学院');
INSERT INTO `shool_info` VALUES ('828', '87', '石家庄城市职业学院');
INSERT INTO `shool_info` VALUES ('829', '87', '石家庄财经职业学院');
INSERT INTO `shool_info` VALUES ('830', '87', '石家庄邮电职业技术学院');
INSERT INTO `shool_info` VALUES ('831', '87', '石家庄理工职业学院');
INSERT INTO `shool_info` VALUES ('832', '87', '石家庄经济职业学院');
INSERT INTO `shool_info` VALUES ('833', '87', '石家庄科技工程职业学院');
INSERT INTO `shool_info` VALUES ('834', '87', '河北劳动关系职业学院');
INSERT INTO `shool_info` VALUES ('835', '87', '石家庄科技职业学院');
INSERT INTO `shool_info` VALUES ('836', '87', '河北轨道运输职业技术学院');
INSERT INTO `shool_info` VALUES ('837', '87', '河北政法职业学院');
INSERT INTO `shool_info` VALUES ('838', '87', '石家庄铁路职业技术学院');
INSERT INTO `shool_info` VALUES ('839', '87', '河北省艺术职业学院');
INSERT INTO `shool_info` VALUES ('840', '87', '河北交通职业技术学院');
INSERT INTO `shool_info` VALUES ('841', '87', '河北化工医药职业技术学院');
INSERT INTO `shool_info` VALUES ('842', '87', '石家庄信息工程职业学院');
INSERT INTO `shool_info` VALUES ('843', '87', '河北公安警察职业学院');
INSERT INTO `shool_info` VALUES ('844', '87', '石家庄工商职业学院');
INSERT INTO `shool_info` VALUES ('845', '87', '石家庄科技信息职业学院');
INSERT INTO `shool_info` VALUES ('846', '87', '河北女子职业技术学院');
INSERT INTO `shool_info` VALUES ('847', '87', '宁夏理工学院');
INSERT INTO `shool_info` VALUES ('848', '88', '河北联合大学');
INSERT INTO `shool_info` VALUES ('849', '88', '唐山师范学院');
INSERT INTO `shool_info` VALUES ('850', '88', '唐山学院');
INSERT INTO `shool_info` VALUES ('851', '88', '河北能源职业技术学院');
INSERT INTO `shool_info` VALUES ('852', '88', '唐山职业技术学院');
INSERT INTO `shool_info` VALUES ('853', '88', '唐山工业职业技术学院');
INSERT INTO `shool_info` VALUES ('854', '88', '唐山科技职业技术学院');
INSERT INTO `shool_info` VALUES ('855', '90', '邢台学院');
INSERT INTO `shool_info` VALUES ('856', '90', '邢台医学高等专科学校');
INSERT INTO `shool_info` VALUES ('857', '90', '邢台职业技术学院');
INSERT INTO `shool_info` VALUES ('858', '90', '河北机电职业技术学院');
INSERT INTO `shool_info` VALUES ('859', '91', '河北建筑工程学院');
INSERT INTO `shool_info` VALUES ('860', '91', '河北北方学院');
INSERT INTO `shool_info` VALUES ('861', '91', '张家口学院');
INSERT INTO `shool_info` VALUES ('862', '91', '张家口职业技术学院');
INSERT INTO `shool_info` VALUES ('863', '91', '宣化科技职业学院');
INSERT INTO `shool_info` VALUES ('864', '92', '安阳师范学院');
INSERT INTO `shool_info` VALUES ('865', '92', '安阳工学院');
INSERT INTO `shool_info` VALUES ('866', '92', '安阳幼儿师范高等专科学校');
INSERT INTO `shool_info` VALUES ('867', '92', '安阳职业技术学院');
INSERT INTO `shool_info` VALUES ('868', '92', '河南护理职业学院');
INSERT INTO `shool_info` VALUES ('869', '93', '鹤壁汽车工程职业学院');
INSERT INTO `shool_info` VALUES ('870', '93', '鹤壁职业技术学院');
INSERT INTO `shool_info` VALUES ('871', '94', '济源职业技术学院');
INSERT INTO `shool_info` VALUES ('872', '95', '河南理工大学');
INSERT INTO `shool_info` VALUES ('873', '95', '焦作师范高等专科学校');
INSERT INTO `shool_info` VALUES ('874', '95', '焦作大学');
INSERT INTO `shool_info` VALUES ('875', '95', '河南工业和信息化职业学院');
INSERT INTO `shool_info` VALUES ('876', '95', '焦作工贸职业学院');
INSERT INTO `shool_info` VALUES ('877', '96', '河南大学');
INSERT INTO `shool_info` VALUES ('878', '96', '开封大学');
INSERT INTO `shool_info` VALUES ('879', '96', '黄河水利职业技术学院');
INSERT INTO `shool_info` VALUES ('880', '96', '开封文化艺术职业学院');
INSERT INTO `shool_info` VALUES ('881', '97', '河南科技大学');
INSERT INTO `shool_info` VALUES ('882', '97', '洛阳师范学院');
INSERT INTO `shool_info` VALUES ('883', '97', '洛阳理工学院');
INSERT INTO `shool_info` VALUES ('884', '97', '河南林业职业学院');
INSERT INTO `shool_info` VALUES ('885', '97', '河南推拿职业学院');
INSERT INTO `shool_info` VALUES ('886', '97', '洛阳职业技术学院');
INSERT INTO `shool_info` VALUES ('887', '97', '洛阳科技职业学院');
INSERT INTO `shool_info` VALUES ('888', '98', '漯河医学高等专科学校');
INSERT INTO `shool_info` VALUES ('889', '98', '漯河职业技术学院');
INSERT INTO `shool_info` VALUES ('890', '98', '漯河食品职业学院');
INSERT INTO `shool_info` VALUES ('891', '99', '南阳师范学院');
INSERT INTO `shool_info` VALUES ('892', '99', '南阳理工学院');
INSERT INTO `shool_info` VALUES ('893', '99', '南阳医学高等专科学校');
INSERT INTO `shool_info` VALUES ('894', '99', '南阳职业学院');
INSERT INTO `shool_info` VALUES ('895', '99', '南阳农业职业学院');
INSERT INTO `shool_info` VALUES ('896', '99', '河南工业职业技术学院');
INSERT INTO `shool_info` VALUES ('897', '100', '平顶山学院');
INSERT INTO `shool_info` VALUES ('898', '100', '河南城建学院');
INSERT INTO `shool_info` VALUES ('899', '100', '平顶山工业职业技术学院');
INSERT INTO `shool_info` VALUES ('900', '100', '河南质量工程职业学院');
INSERT INTO `shool_info` VALUES ('901', '101', '濮阳职业技术学院');
INSERT INTO `shool_info` VALUES ('902', '102', '三门峡职业技术学院');
INSERT INTO `shool_info` VALUES ('903', '103', '商丘师范学院');
INSERT INTO `shool_info` VALUES ('904', '103', '商丘工学院');
INSERT INTO `shool_info` VALUES ('905', '103', '商丘学院');
INSERT INTO `shool_info` VALUES ('906', '103', '商丘医学高等专科学校');
INSERT INTO `shool_info` VALUES ('907', '103', '商丘职业技术学院');
INSERT INTO `shool_info` VALUES ('908', '103', '永城职业学院');
INSERT INTO `shool_info` VALUES ('909', '104', '河南师范大学');
INSERT INTO `shool_info` VALUES ('910', '104', '河南科技学院');
INSERT INTO `shool_info` VALUES ('911', '104', '新乡医学院');
INSERT INTO `shool_info` VALUES ('912', '104', '新乡学院');
INSERT INTO `shool_info` VALUES ('913', '104', '河南机电高等专科学校');
INSERT INTO `shool_info` VALUES ('914', '104', '新乡职业技术学院');
INSERT INTO `shool_info` VALUES ('915', '104', '长垣烹饪职业技术学院');
INSERT INTO `shool_info` VALUES ('916', '105', '信阳师范学院');
INSERT INTO `shool_info` VALUES ('917', '105', '信阳农林学院');
INSERT INTO `shool_info` VALUES ('918', '105', '信阳涉外职业技术学院');
INSERT INTO `shool_info` VALUES ('919', '105', '信阳职业技术学院');
INSERT INTO `shool_info` VALUES ('920', '106', '许昌学院');
INSERT INTO `shool_info` VALUES ('921', '106', '许昌陶瓷职业学院');
INSERT INTO `shool_info` VALUES ('922', '106', '许昌电气职业学院');
INSERT INTO `shool_info` VALUES ('923', '106', '许昌职业技术学院');
INSERT INTO `shool_info` VALUES ('924', '107', '华北水利水电大学');
INSERT INTO `shool_info` VALUES ('925', '107', '郑州大学');
INSERT INTO `shool_info` VALUES ('926', '107', '河南工业大学');
INSERT INTO `shool_info` VALUES ('927', '107', '河南农业大学');
INSERT INTO `shool_info` VALUES ('928', '107', '河南财经政法大学');
INSERT INTO `shool_info` VALUES ('929', '107', '铁道警察学院');
INSERT INTO `shool_info` VALUES ('930', '107', '郑州轻工业学院');
INSERT INTO `shool_info` VALUES ('931', '107', '中原工学院');
INSERT INTO `shool_info` VALUES ('932', '107', '河南牧业经济学院');
INSERT INTO `shool_info` VALUES ('933', '107', '河南中医学院');
INSERT INTO `shool_info` VALUES ('934', '107', '郑州航空工业管理学院');
INSERT INTO `shool_info` VALUES ('935', '107', '河南工程学院');
INSERT INTO `shool_info` VALUES ('936', '107', '河南警察学院');
INSERT INTO `shool_info` VALUES ('937', '107', '黄河科技学院');
INSERT INTO `shool_info` VALUES ('938', '107', '郑州科技学院');
INSERT INTO `shool_info` VALUES ('939', '107', '郑州华信学院');
INSERT INTO `shool_info` VALUES ('940', '107', '郑州师范学院');
INSERT INTO `shool_info` VALUES ('941', '107', '郑州成功财经学院');
INSERT INTO `shool_info` VALUES ('942', '107', '郑州升达经贸管理学院');
INSERT INTO `shool_info` VALUES ('943', '107', '河南财政税务高等专科学校');
INSERT INTO `shool_info` VALUES ('944', '107', '郑州电力高等专科学校');
INSERT INTO `shool_info` VALUES ('945', '107', '郑州幼儿师范高等专科学校');
INSERT INTO `shool_info` VALUES ('946', '107', '河南医学高等专科学校');
INSERT INTO `shool_info` VALUES ('947', '107', '郑州澍青医学高等专科学校');
INSERT INTO `shool_info` VALUES ('948', '107', '河南职业技术学院');
INSERT INTO `shool_info` VALUES ('949', '107', '郑州铁路职业技术学院');
INSERT INTO `shool_info` VALUES ('950', '107', '中州大学');
INSERT INTO `shool_info` VALUES ('951', '107', '河南水利与环境职业学院');
INSERT INTO `shool_info` VALUES ('952', '107', '河南信息统计职业学院');
INSERT INTO `shool_info` VALUES ('953', '107', '郑州电力职业技术学院');
INSERT INTO `shool_info` VALUES ('954', '107', '河南建筑职业技术学院');
INSERT INTO `shool_info` VALUES ('955', '107', '郑州城市职业学院');
INSERT INTO `shool_info` VALUES ('956', '107', '郑州理工职业学院');
INSERT INTO `shool_info` VALUES ('957', '107', '郑州信息工程职业学院');
INSERT INTO `shool_info` VALUES ('958', '107', '河南化工职业学院');
INSERT INTO `shool_info` VALUES ('959', '107', '河南艺术职业学院');
INSERT INTO `shool_info` VALUES ('960', '107', '河南机电职业学院');
INSERT INTO `shool_info` VALUES ('961', '107', '郑州商贸旅游职业学院');
INSERT INTO `shool_info` VALUES ('962', '107', '郑州黄河护理职业学院');
INSERT INTO `shool_info` VALUES ('963', '107', '郑州财税金融职业学院');
INSERT INTO `shool_info` VALUES ('964', '107', '河南司法警官职业学院');
INSERT INTO `shool_info` VALUES ('965', '107', '郑州经贸职业学院');
INSERT INTO `shool_info` VALUES ('966', '107', '郑州交通职业学院');
INSERT INTO `shool_info` VALUES ('967', '107', '河南检察职业学院');
INSERT INTO `shool_info` VALUES ('968', '107', '郑州信息科技职业学院');
INSERT INTO `shool_info` VALUES ('969', '107', '郑州电子信息职业技术学院');
INSERT INTO `shool_info` VALUES ('970', '107', '嵩山少林武术职业学院');
INSERT INTO `shool_info` VALUES ('971', '107', '郑州工业安全职业学院');
INSERT INTO `shool_info` VALUES ('972', '107', '河南经贸职业学院');
INSERT INTO `shool_info` VALUES ('973', '107', '河南交通职业技术学院');
INSERT INTO `shool_info` VALUES ('974', '107', '河南农业职业学院');
INSERT INTO `shool_info` VALUES ('975', '107', '郑州旅游职业学院');
INSERT INTO `shool_info` VALUES ('976', '107', '郑州职业技术学院');
INSERT INTO `shool_info` VALUES ('977', '107', '河南工业贸易职业学院');
INSERT INTO `shool_info` VALUES ('978', '108', '周口师范学院');
INSERT INTO `shool_info` VALUES ('979', '108', '周口科技职业学院');
INSERT INTO `shool_info` VALUES ('980', '108', '周口职业技术学院');
INSERT INTO `shool_info` VALUES ('981', '109', '黄淮学院');
INSERT INTO `shool_info` VALUES ('982', '109', '驻马店职业技术学院');
INSERT INTO `shool_info` VALUES ('983', '110', '鄂州职业大学');
INSERT INTO `shool_info` VALUES ('984', '110', '鄂东职业技术学院');
INSERT INTO `shool_info` VALUES ('985', '111', '湖北民族学院');
INSERT INTO `shool_info` VALUES ('986', '111', '恩施职业技术学院');
INSERT INTO `shool_info` VALUES ('987', '112', '黄冈师范学院');
INSERT INTO `shool_info` VALUES ('988', '112', '黄冈职业技术学院');
INSERT INTO `shool_info` VALUES ('989', '112', '黄冈科技职业学院');
INSERT INTO `shool_info` VALUES ('990', '113', '湖北师范学院');
INSERT INTO `shool_info` VALUES ('991', '113', '湖北理工学院');
INSERT INTO `shool_info` VALUES ('992', '113', '黄石职业技术学院');
INSERT INTO `shool_info` VALUES ('993', '114', '荆楚理工学院');
INSERT INTO `shool_info` VALUES ('994', '114', '长江大学');
INSERT INTO `shool_info` VALUES ('995', '114', '湖北中医药高等专科学校');
INSERT INTO `shool_info` VALUES ('996', '114', '荆州理工职业学院');
INSERT INTO `shool_info` VALUES ('997', '114', '荆州职业技术学院');
INSERT INTO `shool_info` VALUES ('998', '114', '湖北国土资源职业学院');
INSERT INTO `shool_info` VALUES ('999', '116', '江汉艺术职业学院');
INSERT INTO `shool_info` VALUES ('1000', '117', '湖北汽车工业学院');
INSERT INTO `shool_info` VALUES ('1001', '117', '湖北医药学院');
INSERT INTO `shool_info` VALUES ('1002', '117', '郧阳师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1003', '117', '湖北工业职业技术学院');
INSERT INTO `shool_info` VALUES ('1004', '118', '随州职业技术学院');
INSERT INTO `shool_info` VALUES ('1005', '119', '天门职业学院');
INSERT INTO `shool_info` VALUES ('1006', '120', '武汉大学');
INSERT INTO `shool_info` VALUES ('1007', '120', '华中科技大学');
INSERT INTO `shool_info` VALUES ('1008', '120', '中国地质大学');
INSERT INTO `shool_info` VALUES ('1009', '120', '武汉理工大学');
INSERT INTO `shool_info` VALUES ('1010', '120', '华中农业大学');
INSERT INTO `shool_info` VALUES ('1011', '120', '华中师范大学');
INSERT INTO `shool_info` VALUES ('1012', '120', '中南财经政法大学');
INSERT INTO `shool_info` VALUES ('1013', '120', '中南民族大学');
INSERT INTO `shool_info` VALUES ('1014', '120', '武汉科技大学');
INSERT INTO `shool_info` VALUES ('1015', '120', '武汉工程大学');
INSERT INTO `shool_info` VALUES ('1016', '120', '武汉纺织大学');
INSERT INTO `shool_info` VALUES ('1017', '120', '武汉轻工大学');
INSERT INTO `shool_info` VALUES ('1018', '120', '湖北工业大学');
INSERT INTO `shool_info` VALUES ('1019', '120', '湖北中医药大学');
INSERT INTO `shool_info` VALUES ('1020', '120', '湖北大学');
INSERT INTO `shool_info` VALUES ('1021', '120', '江汉大学');
INSERT INTO `shool_info` VALUES ('1022', '120', '武汉体育学院');
INSERT INTO `shool_info` VALUES ('1023', '120', '湖北美术学院');
INSERT INTO `shool_info` VALUES ('1024', '120', '湖北警官学院');
INSERT INTO `shool_info` VALUES ('1025', '120', '武汉音乐学院');
INSERT INTO `shool_info` VALUES ('1026', '120', '湖北经济学院');
INSERT INTO `shool_info` VALUES ('1027', '120', '武汉商学院');
INSERT INTO `shool_info` VALUES ('1028', '120', '武汉东湖学院');
INSERT INTO `shool_info` VALUES ('1029', '120', '汉口学院');
INSERT INTO `shool_info` VALUES ('1030', '120', '武昌理工学院');
INSERT INTO `shool_info` VALUES ('1031', '120', '武昌工学院');
INSERT INTO `shool_info` VALUES ('1032', '120', '武汉长江工商学院');
INSERT INTO `shool_info` VALUES ('1033', '120', '湖北第二师范学院');
INSERT INTO `shool_info` VALUES ('1034', '120', '武汉生物工程学院');
INSERT INTO `shool_info` VALUES ('1035', '120', '湖北幼儿师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1036', '120', '武汉职业技术学院');
INSERT INTO `shool_info` VALUES ('1037', '120', '长江职业学院');
INSERT INTO `shool_info` VALUES ('1038', '120', '武汉城市职业学院');
INSERT INTO `shool_info` VALUES ('1039', '120', '武汉船舶职业技术学院');
INSERT INTO `shool_info` VALUES ('1040', '120', '武汉工程职业技术学院');
INSERT INTO `shool_info` VALUES ('1041', '120', '武昌职业学院');
INSERT INTO `shool_info` VALUES ('1042', '120', '湖北科技职业学院');
INSERT INTO `shool_info` VALUES ('1043', '120', '湖北青年职业学院');
INSERT INTO `shool_info` VALUES ('1044', '120', '湖北体育职业学院');
INSERT INTO `shool_info` VALUES ('1045', '120', '武汉工贸职业学院');
INSERT INTO `shool_info` VALUES ('1046', '120', '湖北轻工职业技术学院');
INSERT INTO `shool_info` VALUES ('1047', '120', '湖北交通职业技术学院');
INSERT INTO `shool_info` VALUES ('1048', '120', '武汉航海职业技术学院');
INSERT INTO `shool_info` VALUES ('1049', '120', '武汉铁路职业技术学院');
INSERT INTO `shool_info` VALUES ('1050', '120', '武汉软件工程职业学院');
INSERT INTO `shool_info` VALUES ('1051', '120', '武汉电力职业技术学院');
INSERT INTO `shool_info` VALUES ('1052', '120', '湖北水利水电职业技术学院');
INSERT INTO `shool_info` VALUES ('1053', '120', '湖北城市建设职业技术学院');
INSERT INTO `shool_info` VALUES ('1054', '120', '武汉警官职业学院');
INSERT INTO `shool_info` VALUES ('1055', '120', '湖北生物科技职业学院');
INSERT INTO `shool_info` VALUES ('1056', '120', '湖北开放职业学院');
INSERT INTO `shool_info` VALUES ('1057', '120', '武汉科技职业学院');
INSERT INTO `shool_info` VALUES ('1058', '120', '武汉外语外事职业学院');
INSERT INTO `shool_info` VALUES ('1059', '120', '武汉信息传播职业技术学院');
INSERT INTO `shool_info` VALUES ('1060', '120', '武汉商贸职业学院');
INSERT INTO `shool_info` VALUES ('1061', '120', '湖北艺术职业学院');
INSERT INTO `shool_info` VALUES ('1062', '120', '武汉交通职业学院');
INSERT INTO `shool_info` VALUES ('1063', '120', '长江工程职业技术学院');
INSERT INTO `shool_info` VALUES ('1064', '120', '武汉工业职业技术学院');
INSERT INTO `shool_info` VALUES ('1065', '120', '武汉民政职业学院');
INSERT INTO `shool_info` VALUES ('1066', '120', '湖北财税职业学院');
INSERT INTO `shool_info` VALUES ('1067', '120', '湖北生态工程职业技术学院');
INSERT INTO `shool_info` VALUES ('1068', '121', '仙桃职业学院');
INSERT INTO `shool_info` VALUES ('1069', '122', '湖北科技学院');
INSERT INTO `shool_info` VALUES ('1070', '122', '咸宁职业技术学院');
INSERT INTO `shool_info` VALUES ('1071', '123', '湖北文理学院');
INSERT INTO `shool_info` VALUES ('1072', '123', '襄阳职业技术学院');
INSERT INTO `shool_info` VALUES ('1073', '123', '襄阳汽车职业技术学院');
INSERT INTO `shool_info` VALUES ('1074', '124', '湖北工程学院');
INSERT INTO `shool_info` VALUES ('1075', '124', '湖北职业技术学院');
INSERT INTO `shool_info` VALUES ('1076', '125', '三峡大学');
INSERT INTO `shool_info` VALUES ('1077', '125', '三峡电力职业学院');
INSERT INTO `shool_info` VALUES ('1078', '125', '三峡旅游职业技术学院');
INSERT INTO `shool_info` VALUES ('1079', '125', '湖北三峡职业技术学院');
INSERT INTO `shool_info` VALUES ('1080', '126', '湖南文理学院');
INSERT INTO `shool_info` VALUES ('1081', '126', '湖南幼儿师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1082', '126', '湖南高尔夫旅游职业学院');
INSERT INTO `shool_info` VALUES ('1083', '126', '常德职业技术学院');
INSERT INTO `shool_info` VALUES ('1084', '126', '湖南同德职业学院');
INSERT INTO `shool_info` VALUES ('1085', '127', '湘南学院');
INSERT INTO `shool_info` VALUES ('1086', '127', '郴州职业技术学院');
INSERT INTO `shool_info` VALUES ('1087', '128', '南华大学');
INSERT INTO `shool_info` VALUES ('1088', '128', '衡阳师范学院');
INSERT INTO `shool_info` VALUES ('1089', '128', '长沙医学院');
INSERT INTO `shool_info` VALUES ('1090', '128', '湖南工学院');
INSERT INTO `shool_info` VALUES ('1091', '128', '湖南环境生物职业技术学院');
INSERT INTO `shool_info` VALUES ('1092', '128', '湖南高速铁路职业技术学院');
INSERT INTO `shool_info` VALUES ('1093', '128', '湖南工商职业学院');
INSERT INTO `shool_info` VALUES ('1094', '128', '衡阳财经工业职业技术学院');
INSERT INTO `shool_info` VALUES ('1095', '128', '湖南科技经贸职业学院');
INSERT INTO `shool_info` VALUES ('1096', '129', '怀化学院');
INSERT INTO `shool_info` VALUES ('1097', '129', '怀化医学高等专科学校');
INSERT INTO `shool_info` VALUES ('1098', '129', '怀化职业技术学院');
INSERT INTO `shool_info` VALUES ('1099', '130', '吉首大学');
INSERT INTO `shool_info` VALUES ('1100', '130', '湘西民族职业技术学院');
INSERT INTO `shool_info` VALUES ('1101', '131', '湖南人文科技学院');
INSERT INTO `shool_info` VALUES ('1102', '131', '娄底职业技术学院');
INSERT INTO `shool_info` VALUES ('1103', '131', '潇湘职业学院');
INSERT INTO `shool_info` VALUES ('1104', '132', '邵阳学院');
INSERT INTO `shool_info` VALUES ('1105', '132', '邵阳医学高等专科学校');
INSERT INTO `shool_info` VALUES ('1106', '132', '邵阳职业技术学院');
INSERT INTO `shool_info` VALUES ('1107', '133', '湘潭大学');
INSERT INTO `shool_info` VALUES ('1108', '133', '湖南科技大学');
INSERT INTO `shool_info` VALUES ('1109', '133', '湖南工程学院');
INSERT INTO `shool_info` VALUES ('1110', '133', '湖南电气职业技术学院');
INSERT INTO `shool_info` VALUES ('1111', '133', '湖南电子科技职业学院');
INSERT INTO `shool_info` VALUES ('1112', '133', '湖南科技工业职业技术学院');
INSERT INTO `shool_info` VALUES ('1113', '133', '湖南吉利汽车职业技术学院');
INSERT INTO `shool_info` VALUES ('1114', '133', '湘潭职业技术学院');
INSERT INTO `shool_info` VALUES ('1115', '133', '湖南城建职业技术学院');
INSERT INTO `shool_info` VALUES ('1116', '133', '湖南理工职业技术学院');
INSERT INTO `shool_info` VALUES ('1117', '133', '湖南软件职业学院');
INSERT INTO `shool_info` VALUES ('1118', '134', '湖南城市学院');
INSERT INTO `shool_info` VALUES ('1119', '134', '益阳医学高等专科学校');
INSERT INTO `shool_info` VALUES ('1120', '134', '益阳职业技术学院');
INSERT INTO `shool_info` VALUES ('1121', '134', '湖南工艺美术职业学院');
INSERT INTO `shool_info` VALUES ('1122', '135', '湖南科技学院');
INSERT INTO `shool_info` VALUES ('1123', '135', '永州职业技术学院');
INSERT INTO `shool_info` VALUES ('1124', '135', '湖南九嶷职业技术学院');
INSERT INTO `shool_info` VALUES ('1125', '136', '湖南理工学院');
INSERT INTO `shool_info` VALUES ('1126', '136', '岳阳职业技术学院');
INSERT INTO `shool_info` VALUES ('1127', '136', '湖南石油化工职业技术学院');
INSERT INTO `shool_info` VALUES ('1128', '136', '湖南民族职业学院');
INSERT INTO `shool_info` VALUES ('1129', '137', '张家界航空工业职业技术学院');
INSERT INTO `shool_info` VALUES ('1130', '138', '湖南大学');
INSERT INTO `shool_info` VALUES ('1131', '138', '中南大学');
INSERT INTO `shool_info` VALUES ('1132', '138', '长沙理工大学');
INSERT INTO `shool_info` VALUES ('1133', '138', '湖南农业大学');
INSERT INTO `shool_info` VALUES ('1134', '138', '湖南中医药大学');
INSERT INTO `shool_info` VALUES ('1135', '138', '湖南师范大学');
INSERT INTO `shool_info` VALUES ('1136', '138', '湖南商学院');
INSERT INTO `shool_info` VALUES ('1137', '138', '长沙学院');
INSERT INTO `shool_info` VALUES ('1138', '138', '湖南财政经济学院');
INSERT INTO `shool_info` VALUES ('1139', '138', '湖南警察学院');
INSERT INTO `shool_info` VALUES ('1140', '138', '湖南女子学院');
INSERT INTO `shool_info` VALUES ('1141', '138', '湖南第一师范学院');
INSERT INTO `shool_info` VALUES ('1142', '138', '长沙师范学院');
INSERT INTO `shool_info` VALUES ('1143', '138', '湖南涉外经济学院');
INSERT INTO `shool_info` VALUES ('1144', '138', '湖南税务高等专科学校');
INSERT INTO `shool_info` VALUES ('1145', '138', '长沙航空职业技术学院');
INSERT INTO `shool_info` VALUES ('1146', '138', '长沙民政职业技术学院');
INSERT INTO `shool_info` VALUES ('1147', '138', '湖南工业职业技术学院');
INSERT INTO `shool_info` VALUES ('1148', '138', '湖南信息职业技术学院');
INSERT INTO `shool_info` VALUES ('1149', '138', '湖南生物机电职业技术学院');
INSERT INTO `shool_info` VALUES ('1150', '138', '湖南外贸职业学院');
INSERT INTO `shool_info` VALUES ('1151', '138', '湖南邮电职业技术学院');
INSERT INTO `shool_info` VALUES ('1152', '138', '湖南外国语职业学院');
INSERT INTO `shool_info` VALUES ('1153', '138', '湖南都市职业学院');
INSERT INTO `shool_info` VALUES ('1154', '138', '湖南三一工业职业技术学院');
INSERT INTO `shool_info` VALUES ('1155', '138', '长沙卫生职业学院');
INSERT INTO `shool_info` VALUES ('1156', '138', '湖南食品药品职业学院');
INSERT INTO `shool_info` VALUES ('1157', '138', '湖南大众传媒职业技术学院');
INSERT INTO `shool_info` VALUES ('1158', '138', '湖南科技职业学院');
INSERT INTO `shool_info` VALUES ('1159', '138', '湖南交通职业技术学院');
INSERT INTO `shool_info` VALUES ('1160', '138', '湖南商务职业技术学院');
INSERT INTO `shool_info` VALUES ('1161', '138', '湖南体育职业学院');
INSERT INTO `shool_info` VALUES ('1162', '138', '湖南工程职业技术学院');
INSERT INTO `shool_info` VALUES ('1163', '138', '保险职业学院');
INSERT INTO `shool_info` VALUES ('1164', '138', '湖南网络工程职业学院');
INSERT INTO `shool_info` VALUES ('1165', '138', '湖南司法警官职业学院');
INSERT INTO `shool_info` VALUES ('1166', '138', '长沙商贸旅游职业技术学院');
INSERT INTO `shool_info` VALUES ('1167', '138', '长沙环境保护职业技术学院');
INSERT INTO `shool_info` VALUES ('1168', '138', '湖南艺术职业学院');
INSERT INTO `shool_info` VALUES ('1169', '138', '湖南机电职业技术学院');
INSERT INTO `shool_info` VALUES ('1170', '138', '长沙职业技术学院');
INSERT INTO `shool_info` VALUES ('1171', '138', '长沙南方职业学院');
INSERT INTO `shool_info` VALUES ('1172', '138', '湖南信息科学职业学院');
INSERT INTO `shool_info` VALUES ('1173', '138', '长沙电力职业技术学院');
INSERT INTO `shool_info` VALUES ('1174', '138', '湖南水利水电职业技术学院');
INSERT INTO `shool_info` VALUES ('1175', '138', '湖南现代物流职业技术学院');
INSERT INTO `shool_info` VALUES ('1176', '138', '湖南安全技术职业学院');
INSERT INTO `shool_info` VALUES ('1177', '139', '湖南工业大学');
INSERT INTO `shool_info` VALUES ('1178', '139', '中南林业科技大学');
INSERT INTO `shool_info` VALUES ('1179', '139', '株洲师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1180', '139', '湖南中医药高等专科学校');
INSERT INTO `shool_info` VALUES ('1181', '139', '湖南冶金职业技术学院');
INSERT INTO `shool_info` VALUES ('1182', '139', '湖南有色金属职业技术学院');
INSERT INTO `shool_info` VALUES ('1183', '139', '湖南铁道职业技术学院');
INSERT INTO `shool_info` VALUES ('1184', '139', '湖南化工职业技术学院');
INSERT INTO `shool_info` VALUES ('1185', '139', '株洲职业技术学院');
INSERT INTO `shool_info` VALUES ('1186', '139', '湖南铁路科技职业技术学院');
INSERT INTO `shool_info` VALUES ('1187', '140', '海南大学');
INSERT INTO `shool_info` VALUES ('1188', '140', '海南师范大学');
INSERT INTO `shool_info` VALUES ('1189', '140', '海南医学院');
INSERT INTO `shool_info` VALUES ('1190', '140', '海口经济学院');
INSERT INTO `shool_info` VALUES ('1191', '140', '琼台师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1192', '140', '海南工商职业学院');
INSERT INTO `shool_info` VALUES ('1193', '140', '海南科技职业学院');
INSERT INTO `shool_info` VALUES ('1194', '140', '海南职业技术学院');
INSERT INTO `shool_info` VALUES ('1195', '140', '海南政法职业学院');
INSERT INTO `shool_info` VALUES ('1196', '140', '海南经贸职业技术学院');
INSERT INTO `shool_info` VALUES ('1197', '141', '海南软件职业技术学院');
INSERT INTO `shool_info` VALUES ('1198', '142', '三亚学院');
INSERT INTO `shool_info` VALUES ('1199', '142', '三亚理工职业学院');
INSERT INTO `shool_info` VALUES ('1200', '142', '三亚城市职业学院');
INSERT INTO `shool_info` VALUES ('1201', '142', '三亚航空旅游职业学院');
INSERT INTO `shool_info` VALUES ('1202', '143', '海南外国语职业学院');
INSERT INTO `shool_info` VALUES ('1203', '144', '琼州学院');
INSERT INTO `shool_info` VALUES ('1204', '145', '常州大学');
INSERT INTO `shool_info` VALUES ('1205', '145', '常州工学院');
INSERT INTO `shool_info` VALUES ('1206', '145', '江苏理工学院');
INSERT INTO `shool_info` VALUES ('1207', '145', '常州信息职业技术学院');
INSERT INTO `shool_info` VALUES ('1208', '145', '常州纺织服装职业技术学院');
INSERT INTO `shool_info` VALUES ('1209', '145', '常州轻工职业技术学院');
INSERT INTO `shool_info` VALUES ('1210', '145', '常州工程职业技术学院');
INSERT INTO `shool_info` VALUES ('1211', '145', '建东职业技术学院');
INSERT INTO `shool_info` VALUES ('1212', '145', '常州机电职业技术学院');
INSERT INTO `shool_info` VALUES ('1213', '146', '淮阴师范学院');
INSERT INTO `shool_info` VALUES ('1214', '146', '淮阴工学院');
INSERT INTO `shool_info` VALUES ('1215', '146', '江苏食品药品职业技术学院');
INSERT INTO `shool_info` VALUES ('1216', '146', '淮安信息职业技术学院');
INSERT INTO `shool_info` VALUES ('1217', '146', '江苏财经职业技术学院');
INSERT INTO `shool_info` VALUES ('1218', '147', '淮海工学院');
INSERT INTO `shool_info` VALUES ('1219', '147', '连云港师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1220', '147', '连云港职业技术学院');
INSERT INTO `shool_info` VALUES ('1221', '148', '南京大学');
INSERT INTO `shool_info` VALUES ('1222', '148', '东南大学');
INSERT INTO `shool_info` VALUES ('1223', '148', '河海大学');
INSERT INTO `shool_info` VALUES ('1224', '148', '南京农业大学');
INSERT INTO `shool_info` VALUES ('1225', '148', '中国药科大学');
INSERT INTO `shool_info` VALUES ('1226', '148', '南京航空航天大学');
INSERT INTO `shool_info` VALUES ('1227', '148', '南京理工大学');
INSERT INTO `shool_info` VALUES ('1228', '148', '南京工业大学');
INSERT INTO `shool_info` VALUES ('1229', '148', '南京邮电大学');
INSERT INTO `shool_info` VALUES ('1230', '148', '南京林业大学');
INSERT INTO `shool_info` VALUES ('1231', '148', '南京医科大学');
INSERT INTO `shool_info` VALUES ('1232', '148', '南京中医药大学');
INSERT INTO `shool_info` VALUES ('1233', '148', '南京师范大学');
INSERT INTO `shool_info` VALUES ('1234', '148', '南京财经大学');
INSERT INTO `shool_info` VALUES ('1235', '148', '南京森林警察学院');
INSERT INTO `shool_info` VALUES ('1236', '148', '南京信息工程大学');
INSERT INTO `shool_info` VALUES ('1237', '148', '江苏警官学院');
INSERT INTO `shool_info` VALUES ('1238', '148', '南京体育学院');
INSERT INTO `shool_info` VALUES ('1239', '148', '南京艺术学院');
INSERT INTO `shool_info` VALUES ('1240', '148', '金陵科技学院');
INSERT INTO `shool_info` VALUES ('1241', '148', '三江学院');
INSERT INTO `shool_info` VALUES ('1242', '148', '南京工程学院');
INSERT INTO `shool_info` VALUES ('1243', '148', '南京审计学院');
INSERT INTO `shool_info` VALUES ('1244', '148', '南京晓庄学院');
INSERT INTO `shool_info` VALUES ('1245', '148', '江苏第二师范学院');
INSERT INTO `shool_info` VALUES ('1246', '148', '江苏城市职业学院');
INSERT INTO `shool_info` VALUES ('1247', '148', '南京工业职业技术学院');
INSERT INTO `shool_info` VALUES ('1248', '148', '南京城市职业学院');
INSERT INTO `shool_info` VALUES ('1249', '148', '南京机电职业技术学院');
INSERT INTO `shool_info` VALUES ('1250', '148', '南京旅游职业学院');
INSERT INTO `shool_info` VALUES ('1251', '148', '江苏建康职业学院');
INSERT INTO `shool_info` VALUES ('1252', '148', '江苏经贸职业技术学院');
INSERT INTO `shool_info` VALUES ('1253', '148', '南京特殊教育职业技术学院');
INSERT INTO `shool_info` VALUES ('1254', '148', '江苏联合职业技术学院');
INSERT INTO `shool_info` VALUES ('1255', '148', '江苏海事职业技术学院');
INSERT INTO `shool_info` VALUES ('1256', '148', '应天职业技术学院');
INSERT INTO `shool_info` VALUES ('1257', '148', '南京交通职业技术学院');
INSERT INTO `shool_info` VALUES ('1258', '148', '南京化工职业技术学院');
INSERT INTO `shool_info` VALUES ('1259', '148', '正德职业技术学院');
INSERT INTO `shool_info` VALUES ('1260', '148', '钟山职业技术学院');
INSERT INTO `shool_info` VALUES ('1261', '148', '金肯职业技术学院');
INSERT INTO `shool_info` VALUES ('1262', '148', '南京铁道职业技术学院');
INSERT INTO `shool_info` VALUES ('1263', '148', '南京信息职业技术学院');
INSERT INTO `shool_info` VALUES ('1264', '148', '南京视觉艺术职业学院');
INSERT INTO `shool_info` VALUES ('1265', '149', '南通大学');
INSERT INTO `shool_info` VALUES ('1266', '149', '南通纺织职业技术学院');
INSERT INTO `shool_info` VALUES ('1267', '149', '南通职业大学');
INSERT INTO `shool_info` VALUES ('1268', '149', '江苏商贸职业学院');
INSERT INTO `shool_info` VALUES ('1269', '149', '紫琅职业技术学院');
INSERT INTO `shool_info` VALUES ('1270', '149', '南通农业职业技术学院');
INSERT INTO `shool_info` VALUES ('1271', '149', '南通航运职业技术学院');
INSERT INTO `shool_info` VALUES ('1272', '150', '苏州大学');
INSERT INTO `shool_info` VALUES ('1273', '150', '西交利物浦大学');
INSERT INTO `shool_info` VALUES ('1274', '150', '苏州科技学院');
INSERT INTO `shool_info` VALUES ('1275', '150', '常熟理工学院');
INSERT INTO `shool_info` VALUES ('1276', '150', '苏州工艺美术职业技术学院');
INSERT INTO `shool_info` VALUES ('1277', '150', '苏州职业大学');
INSERT INTO `shool_info` VALUES ('1278', '150', '沙洲职业工学院');
INSERT INTO `shool_info` VALUES ('1279', '150', '苏州卫生职业技术学院');
INSERT INTO `shool_info` VALUES ('1280', '150', '苏州高博软件技术职业学院');
INSERT INTO `shool_info` VALUES ('1281', '150', '苏州信息职业技术学院');
INSERT INTO `shool_info` VALUES ('1282', '150', '苏州工业园区服务外包职业学院');
INSERT INTO `shool_info` VALUES ('1283', '150', '硅湖职业技术学院');
INSERT INTO `shool_info` VALUES ('1284', '150', '苏州经贸职业技术学院');
INSERT INTO `shool_info` VALUES ('1285', '150', '苏州工业职业技术学院');
INSERT INTO `shool_info` VALUES ('1286', '150', '苏州托普信息职业技术学院');
INSERT INTO `shool_info` VALUES ('1287', '150', '苏州农业职业技术学院');
INSERT INTO `shool_info` VALUES ('1288', '150', '苏州工业园区职业技术学院');
INSERT INTO `shool_info` VALUES ('1289', '150', '健雄职业技术学院');
INSERT INTO `shool_info` VALUES ('1290', '150', '苏州港大思培科技职业学院');
INSERT INTO `shool_info` VALUES ('1291', '150', '昆山登云科技职业学院');
INSERT INTO `shool_info` VALUES ('1292', '151', '泰州学院');
INSERT INTO `shool_info` VALUES ('1293', '151', '泰州职业技术学院');
INSERT INTO `shool_info` VALUES ('1294', '151', '江苏农牧科技职业学院');
INSERT INTO `shool_info` VALUES ('1295', '152', '江南大学');
INSERT INTO `shool_info` VALUES ('1296', '152', '无锡太湖学院');
INSERT INTO `shool_info` VALUES ('1297', '152', '无锡职业技术学院');
INSERT INTO `shool_info` VALUES ('1298', '152', '无锡科技职业学院');
INSERT INTO `shool_info` VALUES ('1299', '152', '无锡商业职业技术学院');
INSERT INTO `shool_info` VALUES ('1300', '152', '太湖创意职业技术学院');
INSERT INTO `shool_info` VALUES ('1301', '152', '无锡南洋职业技术学院');
INSERT INTO `shool_info` VALUES ('1302', '152', '江南影视艺术职业学院');
INSERT INTO `shool_info` VALUES ('1303', '152', '江苏信息职业技术学院');
INSERT INTO `shool_info` VALUES ('1304', '152', '江阴职业技术学院');
INSERT INTO `shool_info` VALUES ('1305', '152', '无锡城市职业技术学院');
INSERT INTO `shool_info` VALUES ('1306', '152', '无锡工艺职业技术学院');
INSERT INTO `shool_info` VALUES ('1307', '153', '宿迁泽达职业技术学院');
INSERT INTO `shool_info` VALUES ('1308', '153', '宿迁职业技术学院');
INSERT INTO `shool_info` VALUES ('1309', '154', '中国矿业大学');
INSERT INTO `shool_info` VALUES ('1310', '154', '江苏师范大学');
INSERT INTO `shool_info` VALUES ('1311', '154', '徐州医学院');
INSERT INTO `shool_info` VALUES ('1312', '154', '徐州工程学院');
INSERT INTO `shool_info` VALUES ('1313', '154', '徐州幼儿师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1314', '154', '江苏建筑职业技术学院');
INSERT INTO `shool_info` VALUES ('1315', '154', '徐州生物工程职业技术学院');
INSERT INTO `shool_info` VALUES ('1316', '154', '九州职业技术学院');
INSERT INTO `shool_info` VALUES ('1317', '154', '徐州工业职业技术学院');
INSERT INTO `shool_info` VALUES ('1318', '155', '盐城工学院');
INSERT INTO `shool_info` VALUES ('1319', '155', '盐城师范学院');
INSERT INTO `shool_info` VALUES ('1320', '155', '民办明达职业技术学院');
INSERT INTO `shool_info` VALUES ('1321', '155', '盐城卫生职业技术学院');
INSERT INTO `shool_info` VALUES ('1322', '155', '盐城工业职业技术学院');
INSERT INTO `shool_info` VALUES ('1323', '155', '炎黄职业技术学院');
INSERT INTO `shool_info` VALUES ('1324', '156', '扬州大学');
INSERT INTO `shool_info` VALUES ('1325', '156', '扬州市职业大学');
INSERT INTO `shool_info` VALUES ('1326', '156', '扬州环境资源职业技术学院');
INSERT INTO `shool_info` VALUES ('1327', '156', '江海职业技术学院');
INSERT INTO `shool_info` VALUES ('1328', '156', '扬州工业职业技术学院');
INSERT INTO `shool_info` VALUES ('1329', '157', '江苏科技大学');
INSERT INTO `shool_info` VALUES ('1330', '157', '江苏大学');
INSERT INTO `shool_info` VALUES ('1331', '157', '镇江市高等专科学校');
INSERT INTO `shool_info` VALUES ('1332', '157', '江苏农林职业技术学院');
INSERT INTO `shool_info` VALUES ('1333', '157', '金山职业技术学院');
INSERT INTO `shool_info` VALUES ('1334', '158', '东华理工大学');
INSERT INTO `shool_info` VALUES ('1335', '158', '江西中医药高等专科学校');
INSERT INTO `shool_info` VALUES ('1336', '158', '抚州职业技术学院');
INSERT INTO `shool_info` VALUES ('1337', '159', '江西理工大学');
INSERT INTO `shool_info` VALUES ('1338', '159', '赣南医学院');
INSERT INTO `shool_info` VALUES ('1339', '159', '赣南师范学院');
INSERT INTO `shool_info` VALUES ('1340', '159', '赣州师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1341', '159', '江西环境工程职业学院');
INSERT INTO `shool_info` VALUES ('1342', '159', '江西应用技术职业学院');
INSERT INTO `shool_info` VALUES ('1343', '160', '井冈山大学');
INSERT INTO `shool_info` VALUES ('1344', '161', '景德镇陶瓷学院');
INSERT INTO `shool_info` VALUES ('1345', '161', '景德镇学院');
INSERT INTO `shool_info` VALUES ('1346', '161', '景德镇陶瓷职业技术学院');
INSERT INTO `shool_info` VALUES ('1347', '161', '江西陶瓷工艺美术职业技术学院');
INSERT INTO `shool_info` VALUES ('1348', '162', '九江学院');
INSERT INTO `shool_info` VALUES ('1349', '162', '九江职业大学');
INSERT INTO `shool_info` VALUES ('1350', '162', '九江职业技术学院');
INSERT INTO `shool_info` VALUES ('1351', '162', '江西枫林涉外经贸职业学院');
INSERT INTO `shool_info` VALUES ('1352', '162', '共青科技职业学院');
INSERT INTO `shool_info` VALUES ('1353', '162', '江西财经职业学院');
INSERT INTO `shool_info` VALUES ('1354', '163', '南昌大学');
INSERT INTO `shool_info` VALUES ('1355', '163', '华东交通大学');
INSERT INTO `shool_info` VALUES ('1356', '163', '南昌航空大学');
INSERT INTO `shool_info` VALUES ('1357', '163', '江西农业大学');
INSERT INTO `shool_info` VALUES ('1358', '163', '江西中医药大学');
INSERT INTO `shool_info` VALUES ('1359', '163', '江西师范大学');
INSERT INTO `shool_info` VALUES ('1360', '163', '江西财经大学');
INSERT INTO `shool_info` VALUES ('1361', '163', '江西科技师范大学');
INSERT INTO `shool_info` VALUES ('1362', '163', '江西科技学院');
INSERT INTO `shool_info` VALUES ('1363', '163', '南昌工程学院');
INSERT INTO `shool_info` VALUES ('1364', '163', '江西警察学院');
INSERT INTO `shool_info` VALUES ('1365', '163', '江西服装学院');
INSERT INTO `shool_info` VALUES ('1366', '163', '南昌工学院');
INSERT INTO `shool_info` VALUES ('1367', '163', '南昌师范学院');
INSERT INTO `shool_info` VALUES ('1368', '163', '南昌理工学院');
INSERT INTO `shool_info` VALUES ('1369', '163', '南昌师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1370', '163', '江西工业职业技术学院');
INSERT INTO `shool_info` VALUES ('1371', '163', '南昌职业学院');
INSERT INTO `shool_info` VALUES ('1372', '163', '江西泰豪动漫职业学院');
INSERT INTO `shool_info` VALUES ('1373', '163', '江西管理职业学院');
INSERT INTO `shool_info` VALUES ('1374', '163', '江西新闻出版职业技术学院');
INSERT INTO `shool_info` VALUES ('1375', '163', '江西工商职业技术学院');
INSERT INTO `shool_info` VALUES ('1376', '163', '江西水利职业学院');
INSERT INTO `shool_info` VALUES ('1377', '163', '江西司法警官职业学院');
INSERT INTO `shool_info` VALUES ('1378', '163', '江西旅游商贸职业学院');
INSERT INTO `shool_info` VALUES ('1379', '163', '江西电力职业技术学院');
INSERT INTO `shool_info` VALUES ('1380', '163', '江西艺术职业学院');
INSERT INTO `shool_info` VALUES ('1381', '163', '江西城市职业学院');
INSERT INTO `shool_info` VALUES ('1382', '163', '江西信息应用职业技术学院');
INSERT INTO `shool_info` VALUES ('1383', '163', '江西交通职业技术学院');
INSERT INTO `shool_info` VALUES ('1384', '163', '江西现代职业技术学院');
INSERT INTO `shool_info` VALUES ('1385', '163', '江西机电职业技术学院');
INSERT INTO `shool_info` VALUES ('1386', '163', '江西科技职业学院');
INSERT INTO `shool_info` VALUES ('1387', '163', '江西外语外贸职业学院');
INSERT INTO `shool_info` VALUES ('1388', '163', '江西工业贸易职业技术学院');
INSERT INTO `shool_info` VALUES ('1389', '163', '江西生物科技职业学院');
INSERT INTO `shool_info` VALUES ('1390', '163', '江西建设职业技术学院');
INSERT INTO `shool_info` VALUES ('1391', '163', '江西先锋软件职业技术学院');
INSERT INTO `shool_info` VALUES ('1392', '163', '江西经济管理职业学院');
INSERT INTO `shool_info` VALUES ('1393', '163', '江西制造职业技术学院');
INSERT INTO `shool_info` VALUES ('1394', '163', '江西工程职业学院');
INSERT INTO `shool_info` VALUES ('1395', '163', '江西青年职业学院');
INSERT INTO `shool_info` VALUES ('1396', '163', '江西航空职业技术学院');
INSERT INTO `shool_info` VALUES ('1397', '163', '江西护理职业技术学院');
INSERT INTO `shool_info` VALUES ('1398', '164', '萍乡学院');
INSERT INTO `shool_info` VALUES ('1399', '164', '江西工业工程职业技术学院');
INSERT INTO `shool_info` VALUES ('1400', '164', '江西应用工程职业学院');
INSERT INTO `shool_info` VALUES ('1401', '165', '上饶师范学院');
INSERT INTO `shool_info` VALUES ('1402', '165', '江西医学高等专科学校');
INSERT INTO `shool_info` VALUES ('1403', '165', '上饶职业技术学院');
INSERT INTO `shool_info` VALUES ('1404', '166', '新余学院');
INSERT INTO `shool_info` VALUES ('1405', '166', '江西太阳能科技职业学院');
INSERT INTO `shool_info` VALUES ('1406', '166', '江西冶金职业技术学院');
INSERT INTO `shool_info` VALUES ('1407', '166', '江西渝州科技职业学院');
INSERT INTO `shool_info` VALUES ('1408', '166', '赣西科技职业学院');
INSERT INTO `shool_info` VALUES ('1409', '167', '宜春学院');
INSERT INTO `shool_info` VALUES ('1410', '167', '宜春职业技术学院');
INSERT INTO `shool_info` VALUES ('1411', '167', '江西农业工程职业学院');
INSERT INTO `shool_info` VALUES ('1412', '168', '鹰潭职业技术学院');
INSERT INTO `shool_info` VALUES ('1413', '169', '韩山师范学院');
INSERT INTO `shool_info` VALUES ('1414', '170', '东莞理工学院');
INSERT INTO `shool_info` VALUES ('1415', '170', '广东科技学院');
INSERT INTO `shool_info` VALUES ('1416', '170', '东莞职业技术学院');
INSERT INTO `shool_info` VALUES ('1417', '170', '广东创新科技职业学院');
INSERT INTO `shool_info` VALUES ('1418', '170', '广东亚视演艺职业学院');
INSERT INTO `shool_info` VALUES ('1419', '171', '佛山科学技术学院');
INSERT INTO `shool_info` VALUES ('1420', '171', '顺德职业技术学院');
INSERT INTO `shool_info` VALUES ('1421', '171', '南海东软信息技术职业学院');
INSERT INTO `shool_info` VALUES ('1422', '171', '广东职业技术学院');
INSERT INTO `shool_info` VALUES ('1423', '171', '广东环境保护工程职业学院');
INSERT INTO `shool_info` VALUES ('1424', '171', '佛山职业技术学院');
INSERT INTO `shool_info` VALUES ('1425', '172', '中山大学');
INSERT INTO `shool_info` VALUES ('1426', '172', '华南理工大学');
INSERT INTO `shool_info` VALUES ('1427', '172', '暨南大学');
INSERT INTO `shool_info` VALUES ('1428', '172', '华南农业大学');
INSERT INTO `shool_info` VALUES ('1429', '172', '广州医科大学');
INSERT INTO `shool_info` VALUES ('1430', '172', '广州中医药大学');
INSERT INTO `shool_info` VALUES ('1431', '172', '华南师范大学');
INSERT INTO `shool_info` VALUES ('1432', '172', '广州大学');
INSERT INTO `shool_info` VALUES ('1433', '172', '广东工业大学');
INSERT INTO `shool_info` VALUES ('1434', '172', '广东外语外贸大学');
INSERT INTO `shool_info` VALUES ('1435', '172', '北京师范大学-香港浸会大学\n联合国际学院');
INSERT INTO `shool_info` VALUES ('1436', '172', '南方医科大学');
INSERT INTO `shool_info` VALUES ('1437', '172', '广东财经大学');
INSERT INTO `shool_info` VALUES ('1438', '172', '广东药学院');
INSERT INTO `shool_info` VALUES ('1439', '172', '广州体育学院');
INSERT INTO `shool_info` VALUES ('1440', '172', '广州美术学院');
INSERT INTO `shool_info` VALUES ('1441', '172', '星海音乐学院');
INSERT INTO `shool_info` VALUES ('1442', '172', '广东技术师范学院');
INSERT INTO `shool_info` VALUES ('1443', '172', '广东白云学院');
INSERT INTO `shool_info` VALUES ('1444', '172', '广州航海学院');
INSERT INTO `shool_info` VALUES ('1445', '172', '广东警官学院');
INSERT INTO `shool_info` VALUES ('1446', '172', '仲恺农业工程学院');
INSERT INTO `shool_info` VALUES ('1447', '172', '广东金融学院');
INSERT INTO `shool_info` VALUES ('1448', '172', '广东培正学院');
INSERT INTO `shool_info` VALUES ('1449', '172', '广东第二师范学院');
INSERT INTO `shool_info` VALUES ('1450', '172', '民办南华工商学院');
INSERT INTO `shool_info` VALUES ('1451', '172', '私立华联学院');
INSERT INTO `shool_info` VALUES ('1452', '172', '广州民航职业技术学院');
INSERT INTO `shool_info` VALUES ('1453', '172', '广东轻工职业技术学院');
INSERT INTO `shool_info` VALUES ('1454', '172', '广东交通职业技术学院');
INSERT INTO `shool_info` VALUES ('1455', '172', '广东水利电力职业技术学院');
INSERT INTO `shool_info` VALUES ('1456', '172', '广州番禺职业技术学院');
INSERT INTO `shool_info` VALUES ('1457', '172', '广东科贸职业学院');
INSERT INTO `shool_info` VALUES ('1458', '172', '广州科技贸易职业学院');
INSERT INTO `shool_info` VALUES ('1459', '172', '广州珠江职业技术学院');
INSERT INTO `shool_info` VALUES ('1460', '172', '广州松田职业学院');
INSERT INTO `shool_info` VALUES ('1461', '172', '广州城建职业学院');
INSERT INTO `shool_info` VALUES ('1462', '172', '广州华商职业学院');
INSERT INTO `shool_info` VALUES ('1463', '172', '广州华夏职业学院');
INSERT INTO `shool_info` VALUES ('1464', '172', '广东青年职业学院');
INSERT INTO `shool_info` VALUES ('1465', '172', '广州东华职业学院');
INSERT INTO `shool_info` VALUES ('1466', '172', '广东舞蹈戏剧职业学院');
INSERT INTO `shool_info` VALUES ('1467', '172', '广东财经职业学院');
INSERT INTO `shool_info` VALUES ('1468', '172', '广东农工商职业技术学院');
INSERT INTO `shool_info` VALUES ('1469', '172', '广东科学技术职业学院');
INSERT INTO `shool_info` VALUES ('1470', '172', '广东食品药品职业学院');
INSERT INTO `shool_info` VALUES ('1471', '172', '广州康大职业技术学院');
INSERT INTO `shool_info` VALUES ('1472', '172', '广东行政职业学院');
INSERT INTO `shool_info` VALUES ('1473', '172', '广东体育职业技术学院');
INSERT INTO `shool_info` VALUES ('1474', '172', '广东建设职业技术学院');
INSERT INTO `shool_info` VALUES ('1475', '172', '广东女子职业技术学院');
INSERT INTO `shool_info` VALUES ('1476', '172', '广东机电职业技术学院');
INSERT INTO `shool_info` VALUES ('1477', '172', '广东岭南职业技术学院');
INSERT INTO `shool_info` VALUES ('1478', '172', '广东邮电职业技术学院');
INSERT INTO `shool_info` VALUES ('1479', '172', '广东工贸职业技术学院');
INSERT INTO `shool_info` VALUES ('1480', '172', '广东司法警官职业学院');
INSERT INTO `shool_info` VALUES ('1481', '172', '广东省外语艺术职业学院');
INSERT INTO `shool_info` VALUES ('1482', '172', '广东文艺职业学院');
INSERT INTO `shool_info` VALUES ('1483', '172', '广州体育职业技术学院');
INSERT INTO `shool_info` VALUES ('1484', '172', '广州工程技术职业学院');
INSERT INTO `shool_info` VALUES ('1485', '172', '广州工商职业技术学院');
INSERT INTO `shool_info` VALUES ('1486', '172', '广州涉外经济职业技术学院');
INSERT INTO `shool_info` VALUES ('1487', '172', '广州南洋理工职业学院');
INSERT INTO `shool_info` VALUES ('1488', '172', '广州科技职业技术学院');
INSERT INTO `shool_info` VALUES ('1489', '172', '广州现代信息工程职业技术学院');
INSERT INTO `shool_info` VALUES ('1490', '172', '广东理工职业学院');
INSERT INTO `shool_info` VALUES ('1491', '172', '广州华南商贸职业学院');
INSERT INTO `shool_info` VALUES ('1492', '172', '广州华立科技职业学院');
INSERT INTO `shool_info` VALUES ('1493', '172', '广州城市职业学院');
INSERT INTO `shool_info` VALUES ('1494', '172', '广东工程职业技术学院');
INSERT INTO `shool_info` VALUES ('1495', '172', '广州铁路职业技术学院');
INSERT INTO `shool_info` VALUES ('1496', '172', '广东白云学院');
INSERT INTO `shool_info` VALUES ('1497', '172', '广东培正学院');
INSERT INTO `shool_info` VALUES ('1498', '172', '民办南华工商学院');
INSERT INTO `shool_info` VALUES ('1499', '172', '私立华联学院');
INSERT INTO `shool_info` VALUES ('1500', '172', '广州康大职业技术学院');
INSERT INTO `shool_info` VALUES ('1501', '172', '广东岭南职业技术学院');
INSERT INTO `shool_info` VALUES ('1502', '172', '广州工商职业技术学院');
INSERT INTO `shool_info` VALUES ('1503', '172', '广州涉外经济职业技术学院');
INSERT INTO `shool_info` VALUES ('1504', '172', '广州南洋理工职业学院');
INSERT INTO `shool_info` VALUES ('1505', '172', '广州科技职业技术学院');
INSERT INTO `shool_info` VALUES ('1506', '172', '广州现代信息工程职业技术学院');
INSERT INTO `shool_info` VALUES ('1507', '172', '广州华南商贸职业学院');
INSERT INTO `shool_info` VALUES ('1508', '172', '广州华立科技职业学院');
INSERT INTO `shool_info` VALUES ('1509', '172', '广州珠江职业技术学院');
INSERT INTO `shool_info` VALUES ('1510', '172', '广州松田职业学院');
INSERT INTO `shool_info` VALUES ('1511', '172', '广州城建职业学院');
INSERT INTO `shool_info` VALUES ('1512', '172', '广州华商职业学院');
INSERT INTO `shool_info` VALUES ('1513', '172', '广州华夏职业学院');
INSERT INTO `shool_info` VALUES ('1514', '172', '广州东华职业学院');
INSERT INTO `shool_info` VALUES ('1515', '173', '河源职业技术学院');
INSERT INTO `shool_info` VALUES ('1516', '174', '惠州学院');
INSERT INTO `shool_info` VALUES ('1517', '174', '惠州卫生职业技术学院');
INSERT INTO `shool_info` VALUES ('1518', '174', '惠州经济职业技术学院');
INSERT INTO `shool_info` VALUES ('1519', '175', '五邑大学');
INSERT INTO `shool_info` VALUES ('1520', '175', '广东南方职业学院');
INSERT INTO `shool_info` VALUES ('1521', '175', '江门职业技术学院');
INSERT INTO `shool_info` VALUES ('1522', '176', '潮汕职业技术学院');
INSERT INTO `shool_info` VALUES ('1523', '176', '揭阳职业技术学院');
INSERT INTO `shool_info` VALUES ('1524', '177', '广东石油化工学院');
INSERT INTO `shool_info` VALUES ('1525', '177', '茂名职业技术学院');
INSERT INTO `shool_info` VALUES ('1526', '178', '嘉应学院');
INSERT INTO `shool_info` VALUES ('1527', '179', '清远职业技术学院');
INSERT INTO `shool_info` VALUES ('1528', '180', '汕头大学');
INSERT INTO `shool_info` VALUES ('1529', '180', '汕头职业技术学院');
INSERT INTO `shool_info` VALUES ('1530', '181', '汕尾职业技术学院');
INSERT INTO `shool_info` VALUES ('1531', '182', '韶关学院');
INSERT INTO `shool_info` VALUES ('1532', '182', '广东松山职业技术学院');
INSERT INTO `shool_info` VALUES ('1533', '183', '深圳大学');
INSERT INTO `shool_info` VALUES ('1534', '183', '南方科技大学');
INSERT INTO `shool_info` VALUES ('1535', '183', '深圳职业技术学院');
INSERT INTO `shool_info` VALUES ('1536', '183', '广东新安职业技术学院');
INSERT INTO `shool_info` VALUES ('1537', '183', '深圳信息职业技术学院');
INSERT INTO `shool_info` VALUES ('1538', '184', '阳江职业技术学院');
INSERT INTO `shool_info` VALUES ('1539', '185', '罗定职业技术学院');
INSERT INTO `shool_info` VALUES ('1540', '186', '广东海洋大学');
INSERT INTO `shool_info` VALUES ('1541', '186', '广东医学院');
INSERT INTO `shool_info` VALUES ('1542', '186', '湛江师范学院');
INSERT INTO `shool_info` VALUES ('1543', '186', '广东文理职业学院');
INSERT INTO `shool_info` VALUES ('1544', '187', '肇庆学院');
INSERT INTO `shool_info` VALUES ('1545', '187', '肇庆医学高等专科学校');
INSERT INTO `shool_info` VALUES ('1546', '187', '广东信息工程职业学院');
INSERT INTO `shool_info` VALUES ('1547', '187', '肇庆科技职业技术学院');
INSERT INTO `shool_info` VALUES ('1548', '187', '肇庆工商职业技术学院');
INSERT INTO `shool_info` VALUES ('1549', '188', '中山职业技术学院');
INSERT INTO `shool_info` VALUES ('1550', '188', '中山火炬职业技术学院');
INSERT INTO `shool_info` VALUES ('1551', '189', '珠海艺术职业学院');
INSERT INTO `shool_info` VALUES ('1552', '189', '珠海城市职业技术学院');
INSERT INTO `shool_info` VALUES ('1553', '190', '右江民族医学院');
INSERT INTO `shool_info` VALUES ('1554', '190', '百色学院');
INSERT INTO `shool_info` VALUES ('1555', '190', '百色职业学院');
INSERT INTO `shool_info` VALUES ('1556', '190', '广西工程职业学院');
INSERT INTO `shool_info` VALUES ('1557', '190', '广西培贤国际职业学院');
INSERT INTO `shool_info` VALUES ('1558', '191', '北海职业学院');
INSERT INTO `shool_info` VALUES ('1559', '191', '北海艺术设计职业学院');
INSERT INTO `shool_info` VALUES ('1560', '192', '广西民族师范学院');
INSERT INTO `shool_info` VALUES ('1561', '192', '广西理工职业技术学院');
INSERT INTO `shool_info` VALUES ('1562', '192', '广西科技职业学院');
INSERT INTO `shool_info` VALUES ('1563', '192', '广西城市职业学院');
INSERT INTO `shool_info` VALUES ('1564', '193', '贵港职业学院');
INSERT INTO `shool_info` VALUES ('1565', '194', '桂林电子科技大学');
INSERT INTO `shool_info` VALUES ('1566', '194', '桂林理工大学');
INSERT INTO `shool_info` VALUES ('1567', '194', '广西师范大学');
INSERT INTO `shool_info` VALUES ('1568', '194', '桂林医学院');
INSERT INTO `shool_info` VALUES ('1569', '194', '桂林航天工业学院');
INSERT INTO `shool_info` VALUES ('1570', '194', '桂林旅游高等专科学校');
INSERT INTO `shool_info` VALUES ('1571', '194', '桂林师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1572', '194', '桂林山水职业学院');
INSERT INTO `shool_info` VALUES ('1573', '195', '河池学院');
INSERT INTO `shool_info` VALUES ('1574', '195', '广西现代职业技术学院');
INSERT INTO `shool_info` VALUES ('1575', '196', '贺州学院');
INSERT INTO `shool_info` VALUES ('1576', '197', '广西科技大学');
INSERT INTO `shool_info` VALUES ('1577', '197', '柳州师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1578', '197', '柳州职业技术学院');
INSERT INTO `shool_info` VALUES ('1579', '197', '柳州铁道职业技术学院');
INSERT INTO `shool_info` VALUES ('1580', '197', '柳州城市职业学院');
INSERT INTO `shool_info` VALUES ('1581', '197', '广西生态工程职业技术学院');
INSERT INTO `shool_info` VALUES ('1582', '198', '广西大学');
INSERT INTO `shool_info` VALUES ('1583', '198', '广西医科大学');
INSERT INTO `shool_info` VALUES ('1584', '198', '广西中医药大学');
INSERT INTO `shool_info` VALUES ('1585', '198', '广西民族大学');
INSERT INTO `shool_info` VALUES ('1586', '198', '广西师范学院');
INSERT INTO `shool_info` VALUES ('1587', '198', '广西艺术学院');
INSERT INTO `shool_info` VALUES ('1588', '198', '广西财经学院');
INSERT INTO `shool_info` VALUES ('1589', '198', '南宁学院');
INSERT INTO `shool_info` VALUES ('1590', '198', '广西外国语学院');
INSERT INTO `shool_info` VALUES ('1591', '198', '广西体育高等专科学校');
INSERT INTO `shool_info` VALUES ('1592', '198', '广西幼儿师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1593', '198', '广西警官高等专科学校');
INSERT INTO `shool_info` VALUES ('1594', '198', '广西机电职业技术学院');
INSERT INTO `shool_info` VALUES ('1595', '198', '南宁职业技术学院');
INSERT INTO `shool_info` VALUES ('1596', '198', '广西职业技术学院');
INSERT INTO `shool_info` VALUES ('1597', '198', '广西经济职业学院');
INSERT INTO `shool_info` VALUES ('1598', '198', '广西卫生职业技术学院');
INSERT INTO `shool_info` VALUES ('1599', '198', '广西水利电力职业技术学院');
INSERT INTO `shool_info` VALUES ('1600', '198', '广西交通职业技术学院');
INSERT INTO `shool_info` VALUES ('1601', '198', '广西工业职业技术学院');
INSERT INTO `shool_info` VALUES ('1602', '198', '广西国际商务职业技术学院');
INSERT INTO `shool_info` VALUES ('1603', '198', '广西农业职业技术学院');
INSERT INTO `shool_info` VALUES ('1604', '198', '广西建设职业技术学院');
INSERT INTO `shool_info` VALUES ('1605', '198', '广西经贸职业技术学院');
INSERT INTO `shool_info` VALUES ('1606', '198', '广西工商职业技术学院');
INSERT INTO `shool_info` VALUES ('1607', '198', '广西演艺职业学院');
INSERT INTO `shool_info` VALUES ('1608', '198', '广西电力职业技术学院');
INSERT INTO `shool_info` VALUES ('1609', '199', '钦州学院');
INSERT INTO `shool_info` VALUES ('1610', '199', '广西英华国际职业学院');
INSERT INTO `shool_info` VALUES ('1611', '200', '梧州学院');
INSERT INTO `shool_info` VALUES ('1612', '200', '梧州职业学院');
INSERT INTO `shool_info` VALUES ('1613', '201', '玉林师范学院');
INSERT INTO `shool_info` VALUES ('1614', '203', '楚雄师范学院');
INSERT INTO `shool_info` VALUES ('1615', '203', '楚雄医药高等专科学校');
INSERT INTO `shool_info` VALUES ('1616', '203', '云南现代职业技术学院');
INSERT INTO `shool_info` VALUES ('1617', '204', '大理学院');
INSERT INTO `shool_info` VALUES ('1618', '204', '大理农林职业技术学院');
INSERT INTO `shool_info` VALUES ('1619', '205', '德宏师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1620', '205', '德宏职业学院');
INSERT INTO `shool_info` VALUES ('1621', '206', '云南锡业职业技术学院');
INSERT INTO `shool_info` VALUES ('1622', '207', '西双版纳职业技术学院');
INSERT INTO `shool_info` VALUES ('1623', '208', '云南大学');
INSERT INTO `shool_info` VALUES ('1624', '208', '昆明理工大学');
INSERT INTO `shool_info` VALUES ('1625', '208', '云南农业大学');
INSERT INTO `shool_info` VALUES ('1626', '208', '西南林业大学');
INSERT INTO `shool_info` VALUES ('1627', '208', '昆明医科大学');
INSERT INTO `shool_info` VALUES ('1628', '208', '云南师范大学');
INSERT INTO `shool_info` VALUES ('1629', '208', '云南财经大学');
INSERT INTO `shool_info` VALUES ('1630', '208', '云南民族大学');
INSERT INTO `shool_info` VALUES ('1631', '208', '云南中医学院');
INSERT INTO `shool_info` VALUES ('1632', '208', '昆明学院');
INSERT INTO `shool_info` VALUES ('1633', '208', '云南艺术学院');
INSERT INTO `shool_info` VALUES ('1634', '208', '云南警官学院');
INSERT INTO `shool_info` VALUES ('1635', '208', '云南工商学院');
INSERT INTO `shool_info` VALUES ('1636', '208', '昆明冶金高等专科学校');
INSERT INTO `shool_info` VALUES ('1637', '208', '云南城市建设职业学院');
INSERT INTO `shool_info` VALUES ('1638', '208', '云南工程职业学院');
INSERT INTO `shool_info` VALUES ('1639', '208', '云南经贸外事职业学院');
INSERT INTO `shool_info` VALUES ('1640', '208', '云南商务职业学院');
INSERT INTO `shool_info` VALUES ('1641', '208', '昆明卫生职业学院');
INSERT INTO `shool_info` VALUES ('1642', '208', '云南旅游职业学院');
INSERT INTO `shool_info` VALUES ('1643', '208', '云南外事外语职业学院');
INSERT INTO `shool_info` VALUES ('1644', '208', '云南国土资源职业学院');
INSERT INTO `shool_info` VALUES ('1645', '208', '云南交通职业技术学院');
INSERT INTO `shool_info` VALUES ('1646', '208', '昆明工业职业技术学院');
INSERT INTO `shool_info` VALUES ('1647', '208', '云南农业职业技术学院');
INSERT INTO `shool_info` VALUES ('1648', '208', '云南司法警官职业学院');
INSERT INTO `shool_info` VALUES ('1649', '208', '云南文化艺术职业学院');
INSERT INTO `shool_info` VALUES ('1650', '208', '云南体育运动职业技术学院');
INSERT INTO `shool_info` VALUES ('1651', '208', '云南经济管理职业学院');
INSERT INTO `shool_info` VALUES ('1652', '208', '云南科技信息职业学院');
INSERT INTO `shool_info` VALUES ('1653', '208', '昆明艺术职业学院');
INSERT INTO `shool_info` VALUES ('1654', '208', '云南国防工业职业技术学院');
INSERT INTO `shool_info` VALUES ('1655', '208', '云南机电职业技术学院');
INSERT INTO `shool_info` VALUES ('1656', '208', '云南林业职业技术学院');
INSERT INTO `shool_info` VALUES ('1657', '208', '云南新兴职业学院');
INSERT INTO `shool_info` VALUES ('1658', '209', '丽江师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1659', '210', '临沧师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1660', '211', '红河学院');
INSERT INTO `shool_info` VALUES ('1661', '211', '红河卫生职业学院');
INSERT INTO `shool_info` VALUES ('1662', '212', '普洱学院');
INSERT INTO `shool_info` VALUES ('1663', '212', '云南热带作物职业学院');
INSERT INTO `shool_info` VALUES ('1664', '213', '曲靖师范学院');
INSERT INTO `shool_info` VALUES ('1665', '213', '曲靖医学高等专科学校');
INSERT INTO `shool_info` VALUES ('1666', '213', '云南能源职业技术学院');
INSERT INTO `shool_info` VALUES ('1667', '214', '文山学院');
INSERT INTO `shool_info` VALUES ('1668', '214', '云南三鑫职业技术学院');
INSERT INTO `shool_info` VALUES ('1669', '215', '玉溪师范学院');
INSERT INTO `shool_info` VALUES ('1670', '215', '玉溪农业职业技术学院');
INSERT INTO `shool_info` VALUES ('1671', '216', '昭通学院');
INSERT INTO `shool_info` VALUES ('1672', '217', '安顺学院');
INSERT INTO `shool_info` VALUES ('1673', '217', '安顺职业技术学院');
INSERT INTO `shool_info` VALUES ('1674', '218', '毕节学院');
INSERT INTO `shool_info` VALUES ('1675', '218', '毕节职业技术学院');
INSERT INTO `shool_info` VALUES ('1676', '219', '黔南民族师范学院');
INSERT INTO `shool_info` VALUES ('1677', '219', '黔南民族医学高等专科学校');
INSERT INTO `shool_info` VALUES ('1678', '219', '黔南民族职业技术学院');
INSERT INTO `shool_info` VALUES ('1679', '220', '贵州大学');
INSERT INTO `shool_info` VALUES ('1680', '220', '贵州师范大学');
INSERT INTO `shool_info` VALUES ('1681', '220', '贵州财经大学');
INSERT INTO `shool_info` VALUES ('1682', '220', '贵州民族大学');
INSERT INTO `shool_info` VALUES ('1683', '220', '贵阳医学院');
INSERT INTO `shool_info` VALUES ('1684', '220', '贵阳中医学院');
INSERT INTO `shool_info` VALUES ('1685', '220', '贵阳学院');
INSERT INTO `shool_info` VALUES ('1686', '220', '贵州师范学院');
INSERT INTO `shool_info` VALUES ('1687', '220', '贵州理工学院');
INSERT INTO `shool_info` VALUES ('1688', '220', '贵州商业高等专科学校');
INSERT INTO `shool_info` VALUES ('1689', '220', '贵阳幼儿师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1690', '220', '贵州工业职业技术学院');
INSERT INTO `shool_info` VALUES ('1691', '220', '贵阳职业技术学院');
INSERT INTO `shool_info` VALUES ('1692', '220', '贵州职业技术学院');
INSERT INTO `shool_info` VALUES ('1693', '220', '贵州工商职业学院');
INSERT INTO `shool_info` VALUES ('1694', '220', '贵州警官职业学院');
INSERT INTO `shool_info` VALUES ('1695', '220', '贵州交通职业技术学院');
INSERT INTO `shool_info` VALUES ('1696', '220', '贵州亚泰职业学院');
INSERT INTO `shool_info` VALUES ('1697', '220', '贵州电力职业技术学院');
INSERT INTO `shool_info` VALUES ('1698', '220', '贵州轻工职业技术学院');
INSERT INTO `shool_info` VALUES ('1699', '220', '贵阳护理职业学院');
INSERT INTO `shool_info` VALUES ('1700', '221', '凯里学院');
INSERT INTO `shool_info` VALUES ('1701', '221', '贵州电子信息职业技术学院');
INSERT INTO `shool_info` VALUES ('1702', '221', '黔东南民族职业技术学院');
INSERT INTO `shool_info` VALUES ('1703', '222', '六盘水师范学院');
INSERT INTO `shool_info` VALUES ('1704', '222', '六盘水职业技术学院');
INSERT INTO `shool_info` VALUES ('1705', '223', '贵州盛华职业学院');
INSERT INTO `shool_info` VALUES ('1706', '224', '铜仁学院');
INSERT INTO `shool_info` VALUES ('1707', '224', '铜仁幼儿师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1708', '224', '铜仁职业技术学院');
INSERT INTO `shool_info` VALUES ('1709', '225', '兴义民族师范学院');
INSERT INTO `shool_info` VALUES ('1710', '225', '黔西南民族职业技术学院');
INSERT INTO `shool_info` VALUES ('1711', '226', '遵义医学院');
INSERT INTO `shool_info` VALUES ('1712', '226', '遵义师范学院');
INSERT INTO `shool_info` VALUES ('1713', '226', '遵义医药高等专科学校');
INSERT INTO `shool_info` VALUES ('1714', '226', '贵州航天职业技术学院');
INSERT INTO `shool_info` VALUES ('1715', '226', '遵义职业技术学院');
INSERT INTO `shool_info` VALUES ('1716', '227', '巴中职业技术学院');
INSERT INTO `shool_info` VALUES ('1717', '228', '四川大学');
INSERT INTO `shool_info` VALUES ('1718', '228', '西南交通大学');
INSERT INTO `shool_info` VALUES ('1719', '228', '电子科技大学');
INSERT INTO `shool_info` VALUES ('1720', '228', '西南财经大学');
INSERT INTO `shool_info` VALUES ('1721', '228', '西南民族大学');
INSERT INTO `shool_info` VALUES ('1722', '228', '成都理工大学');
INSERT INTO `shool_info` VALUES ('1723', '228', '西华大学');
INSERT INTO `shool_info` VALUES ('1724', '228', '成都中医药大学');
INSERT INTO `shool_info` VALUES ('1725', '228', '四川师范大学');
INSERT INTO `shool_info` VALUES ('1726', '228', '成都信息工程学院');
INSERT INTO `shool_info` VALUES ('1727', '228', '成都体育学院');
INSERT INTO `shool_info` VALUES ('1728', '228', '四川音乐学院');
INSERT INTO `shool_info` VALUES ('1729', '228', '成都学院');
INSERT INTO `shool_info` VALUES ('1730', '228', '成都工业学院');
INSERT INTO `shool_info` VALUES ('1731', '228', '四川旅游学院');
INSERT INTO `shool_info` VALUES ('1732', '228', '成都东软学院');
INSERT INTO `shool_info` VALUES ('1733', '228', '四川传媒学院');
INSERT INTO `shool_info` VALUES ('1734', '228', '成都师范学院');
INSERT INTO `shool_info` VALUES ('1735', '228', '成都医学院');
INSERT INTO `shool_info` VALUES ('1736', '228', '成都纺织高等专科学校');
INSERT INTO `shool_info` VALUES ('1737', '228', '民办四川天一学院');
INSERT INTO `shool_info` VALUES ('1738', '228', '成都航空职业技术学院');
INSERT INTO `shool_info` VALUES ('1739', '228', '四川艺术职业学院');
INSERT INTO `shool_info` VALUES ('1740', '228', '四川科技职业学院');
INSERT INTO `shool_info` VALUES ('1741', '228', '四川财经职业学院');
INSERT INTO `shool_info` VALUES ('1742', '228', '四川城市职业学院');
INSERT INTO `shool_info` VALUES ('1743', '228', '四川现代职业学院');
INSERT INTO `shool_info` VALUES ('1744', '228', '四川长江职业学院');
INSERT INTO `shool_info` VALUES ('1745', '228', '四川三河职业学院');
INSERT INTO `shool_info` VALUES ('1746', '228', '四川电影电视职业学院');
INSERT INTO `shool_info` VALUES ('1747', '228', '四川文轩职业学院');
INSERT INTO `shool_info` VALUES ('1748', '228', '四川电力职业技术学院');
INSERT INTO `shool_info` VALUES ('1749', '228', '成都职业技术学院');
INSERT INTO `shool_info` VALUES ('1750', '228', '四川水利职业技术学院');
INSERT INTO `shool_info` VALUES ('1751', '228', '四川航天职业技术学院');
INSERT INTO `shool_info` VALUES ('1752', '228', '四川邮电职业技术学院');
INSERT INTO `shool_info` VALUES ('1753', '228', '四川交通职业技术学院');
INSERT INTO `shool_info` VALUES ('1754', '228', '四川工商职业技术学院');
INSERT INTO `shool_info` VALUES ('1755', '228', '四川托普信息技术职业学院');
INSERT INTO `shool_info` VALUES ('1756', '228', '四川国际标榜职业学院');
INSERT INTO `shool_info` VALUES ('1757', '228', '成都农业科技职业学院');
INSERT INTO `shool_info` VALUES ('1758', '228', '成都艺术职业学院');
INSERT INTO `shool_info` VALUES ('1759', '228', '四川商务职业学院');
INSERT INTO `shool_info` VALUES ('1760', '228', '四川文化传媒职业学院');
INSERT INTO `shool_info` VALUES ('1761', '228', '四川华新现代职业学院');
INSERT INTO `shool_info` VALUES ('1762', '228', '四川管理职业学院');
INSERT INTO `shool_info` VALUES ('1763', '228', '四川文化产业职业学院');
INSERT INTO `shool_info` VALUES ('1764', '229', '四川文理学院');
INSERT INTO `shool_info` VALUES ('1765', '229', '达州职业技术学院');
INSERT INTO `shool_info` VALUES ('1766', '230', '四川工业管理职业学院');
INSERT INTO `shool_info` VALUES ('1767', '230', '四川工程职业技术学院');
INSERT INTO `shool_info` VALUES ('1768', '230', '四川建筑职业技术学院');
INSERT INTO `shool_info` VALUES ('1769', '230', '四川司法警官职业学院');
INSERT INTO `shool_info` VALUES ('1770', '231', '四川民族学院');
INSERT INTO `shool_info` VALUES ('1771', '232', '广安职业技术学院');
INSERT INTO `shool_info` VALUES ('1772', '233', '中国民用航空飞行学院');
INSERT INTO `shool_info` VALUES ('1773', '234', '川北幼儿师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1774', '234', '四川信息职业技术学院');
INSERT INTO `shool_info` VALUES ('1775', '235', '乐山师范学院');
INSERT INTO `shool_info` VALUES ('1776', '235', '乐山职业技术学院');
INSERT INTO `shool_info` VALUES ('1777', '236', '泸州医学院');
INSERT INTO `shool_info` VALUES ('1778', '236', '四川警察学院');
INSERT INTO `shool_info` VALUES ('1779', '236', '四川化工职业技术学院');
INSERT INTO `shool_info` VALUES ('1780', '236', '泸州职业技术学院');
INSERT INTO `shool_info` VALUES ('1781', '237', '眉山职业技术学院');
INSERT INTO `shool_info` VALUES ('1782', '238', '西南科技大学');
INSERT INTO `shool_info` VALUES ('1783', '238', '绵阳师范学院');
INSERT INTO `shool_info` VALUES ('1784', '238', '四川幼儿师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1785', '238', '四川中医药高等专科学校');
INSERT INTO `shool_info` VALUES ('1786', '238', '四川汽车职业技术学院');
INSERT INTO `shool_info` VALUES ('1787', '238', '四川电子机械职业技术学院');
INSERT INTO `shool_info` VALUES ('1788', '238', '绵阳职业技术学院');
INSERT INTO `shool_info` VALUES ('1789', '239', '西华师范大学');
INSERT INTO `shool_info` VALUES ('1790', '239', '西南石油大学');
INSERT INTO `shool_info` VALUES ('1791', '239', '川北医学院');
INSERT INTO `shool_info` VALUES ('1792', '239', '南充职业技术学院');
INSERT INTO `shool_info` VALUES ('1793', '240', '内江师范学院');
INSERT INTO `shool_info` VALUES ('1794', '240', '内江职业技术学院');
INSERT INTO `shool_info` VALUES ('1795', '241', '攀枝花学院');
INSERT INTO `shool_info` VALUES ('1796', '241', '四川机电职业技术学院');
INSERT INTO `shool_info` VALUES ('1797', '242', '四川职业技术学院');
INSERT INTO `shool_info` VALUES ('1798', '243', '阿坝师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1799', '244', '西昌学院');
INSERT INTO `shool_info` VALUES ('1800', '245', '四川农业大学');
INSERT INTO `shool_info` VALUES ('1801', '245', '雅安职业技术学院');
INSERT INTO `shool_info` VALUES ('1802', '246', '阿拉善职业技术学院');
INSERT INTO `shool_info` VALUES ('1803', '246', '宜宾学院');
INSERT INTO `shool_info` VALUES ('1804', '246', '宜宾职业技术学院');
INSERT INTO `shool_info` VALUES ('1805', '247', '四川希望汽车职业学院');
INSERT INTO `shool_info` VALUES ('1806', '248', '四川理工学院');
INSERT INTO `shool_info` VALUES ('1807', '248', '四川卫生康复职业学院');
INSERT INTO `shool_info` VALUES ('1808', '250', '河套学院');
INSERT INTO `shool_info` VALUES ('1809', '250', '内蒙古美术职业学院');
INSERT INTO `shool_info` VALUES ('1810', '251', '内蒙古科技大学');
INSERT INTO `shool_info` VALUES ('1811', '251', '包头职业技术学院');
INSERT INTO `shool_info` VALUES ('1812', '251', '包头铁道职业技术学院');
INSERT INTO `shool_info` VALUES ('1813', '251', '包头轻工职业技术学院');
INSERT INTO `shool_info` VALUES ('1814', '251', '包头钢铁职业技术学院');
INSERT INTO `shool_info` VALUES ('1815', '252', '赤峰学院');
INSERT INTO `shool_info` VALUES ('1816', '252', '赤峰职业技术学院');
INSERT INTO `shool_info` VALUES ('1817', '252', '赤峰工业职业技术学院');
INSERT INTO `shool_info` VALUES ('1818', '252', '内蒙古交通职业技术学院');
INSERT INTO `shool_info` VALUES ('1819', '253', '内蒙古民族幼儿师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1820', '253', '鄂尔多斯职业学院');
INSERT INTO `shool_info` VALUES ('1821', '254', '内蒙古大学');
INSERT INTO `shool_info` VALUES ('1822', '254', '内蒙古工业大学');
INSERT INTO `shool_info` VALUES ('1823', '254', '内蒙古农业大学');
INSERT INTO `shool_info` VALUES ('1824', '254', '内蒙古医科大学');
INSERT INTO `shool_info` VALUES ('1825', '254', '内蒙古师范大学');
INSERT INTO `shool_info` VALUES ('1826', '254', '内蒙古财经大学');
INSERT INTO `shool_info` VALUES ('1827', '254', '呼和浩特民族学院');
INSERT INTO `shool_info` VALUES ('1828', '254', '内蒙古建筑职业技术学院');
INSERT INTO `shool_info` VALUES ('1829', '254', '内蒙古丰州职业学院');
INSERT INTO `shool_info` VALUES ('1830', '254', '内蒙古科技职业学院');
INSERT INTO `shool_info` VALUES ('1831', '254', '内蒙古北方职业技术学院');
INSERT INTO `shool_info` VALUES ('1832', '254', '内蒙古经贸外语职业学院');
INSERT INTO `shool_info` VALUES ('1833', '254', '内蒙古工业职业学院');
INSERT INTO `shool_info` VALUES ('1834', '254', '内蒙古能源职业学院');
INSERT INTO `shool_info` VALUES ('1835', '254', '呼和浩特职业学院');
INSERT INTO `shool_info` VALUES ('1836', '254', '内蒙古电子信息职业技术学院');
INSERT INTO `shool_info` VALUES ('1837', '254', '内蒙古机电职业技术学院');
INSERT INTO `shool_info` VALUES ('1838', '254', '内蒙古化工职业学院');
INSERT INTO `shool_info` VALUES ('1839', '254', '内蒙古商贸职业学院');
INSERT INTO `shool_info` VALUES ('1840', '254', '内蒙古警察职业学院');
INSERT INTO `shool_info` VALUES ('1841', '254', '内蒙古体育职业学院');
INSERT INTO `shool_info` VALUES ('1842', '255', '呼伦贝尔学院');
INSERT INTO `shool_info` VALUES ('1843', '255', '呼伦贝尔职业技术学院');
INSERT INTO `shool_info` VALUES ('1844', '255', '满洲里俄语职业学院');
INSERT INTO `shool_info` VALUES ('1845', '256', '内蒙古民族大学');
INSERT INTO `shool_info` VALUES ('1846', '256', '通辽职业学院');
INSERT INTO `shool_info` VALUES ('1847', '256', '科尔沁艺术职业学院');
INSERT INTO `shool_info` VALUES ('1848', '257', '乌海职业技术学院');
INSERT INTO `shool_info` VALUES ('1849', '258', '集宁师范学院');
INSERT INTO `shool_info` VALUES ('1850', '258', '乌兰察布医学高等专科学校');
INSERT INTO `shool_info` VALUES ('1851', '258', '乌兰察布职业学院');
INSERT INTO `shool_info` VALUES ('1852', '259', '锡林郭勒职业学院');
INSERT INTO `shool_info` VALUES ('1853', '260', '兴安职业技术学院');
INSERT INTO `shool_info` VALUES ('1854', '261', '宁夏师范学院');
INSERT INTO `shool_info` VALUES ('1855', '263', '宁夏民族职业技术学院');
INSERT INTO `shool_info` VALUES ('1856', '264', '北方民族大学');
INSERT INTO `shool_info` VALUES ('1857', '264', '宁夏大学');
INSERT INTO `shool_info` VALUES ('1858', '264', '宁夏医科大学');
INSERT INTO `shool_info` VALUES ('1859', '264', '银川能源学院');
INSERT INTO `shool_info` VALUES ('1860', '264', '宁夏防沙治沙职业技术学院');
INSERT INTO `shool_info` VALUES ('1861', '264', '宁夏工业职业学院');
INSERT INTO `shool_info` VALUES ('1862', '264', '宁夏职业技术学院');
INSERT INTO `shool_info` VALUES ('1863', '264', '宁夏工商职业技术学院');
INSERT INTO `shool_info` VALUES ('1864', '264', '宁夏财经职业技术学院');
INSERT INTO `shool_info` VALUES ('1865', '264', '宁夏司法警官职业学院');
INSERT INTO `shool_info` VALUES ('1866', '264', '宁夏建设职业技术学院');
INSERT INTO `shool_info` VALUES ('1867', '265', '白银矿冶职业技术学院');
INSERT INTO `shool_info` VALUES ('1868', '266', '定西师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1869', '267', '甘肃民族师范学院');
INSERT INTO `shool_info` VALUES ('1870', '268', '甘肃钢铁职业技术学院');
INSERT INTO `shool_info` VALUES ('1871', '269', '甘肃有色冶金职业技术学院');
INSERT INTO `shool_info` VALUES ('1872', '270', '酒泉职业技术学院');
INSERT INTO `shool_info` VALUES ('1873', '271', '兰州大学');
INSERT INTO `shool_info` VALUES ('1874', '271', '西北民族大学');
INSERT INTO `shool_info` VALUES ('1875', '271', '兰州理工大学');
INSERT INTO `shool_info` VALUES ('1876', '271', '兰州交通大学');
INSERT INTO `shool_info` VALUES ('1877', '271', '甘肃农业大学');
INSERT INTO `shool_info` VALUES ('1878', '271', '西北师范大学');
INSERT INTO `shool_info` VALUES ('1879', '271', '甘肃中医学院');
INSERT INTO `shool_info` VALUES ('1880', '271', '兰州城市学院');
INSERT INTO `shool_info` VALUES ('1881', '271', '兰州商学院');
INSERT INTO `shool_info` VALUES ('1882', '271', '甘肃政法学院');
INSERT INTO `shool_info` VALUES ('1883', '271', '兰州文理学院');
INSERT INTO `shool_info` VALUES ('1884', '271', '兰州工业学院');
INSERT INTO `shool_info` VALUES ('1885', '271', '兰州石化职业技术学院');
INSERT INTO `shool_info` VALUES ('1886', '271', '甘肃建筑职业技术学院');
INSERT INTO `shool_info` VALUES ('1887', '271', '兰州外语职业学院');
INSERT INTO `shool_info` VALUES ('1888', '271', '兰州职业技术学院');
INSERT INTO `shool_info` VALUES ('1889', '271', '甘肃警察职业学院');
INSERT INTO `shool_info` VALUES ('1890', '271', '甘肃交通职业技术学院');
INSERT INTO `shool_info` VALUES ('1891', '271', '兰州资源环境职业技术学院');
INSERT INTO `shool_info` VALUES ('1892', '271', '甘肃农业职业技术学院');
INSERT INTO `shool_info` VALUES ('1893', '272', '陇南师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1894', '273', '平凉医学高等专科学校');
INSERT INTO `shool_info` VALUES ('1895', '274', '陇东学院');
INSERT INTO `shool_info` VALUES ('1896', '275', '天水师范学院');
INSERT INTO `shool_info` VALUES ('1897', '275', '甘肃机电职业技术学院');
INSERT INTO `shool_info` VALUES ('1898', '275', '甘肃林业职业技术学院');
INSERT INTO `shool_info` VALUES ('1899', '275', '甘肃工业职业技术学院');
INSERT INTO `shool_info` VALUES ('1900', '276', '武威职业学院');
INSERT INTO `shool_info` VALUES ('1901', '276', '甘肃畜牧工程职业技术学院');
INSERT INTO `shool_info` VALUES ('1902', '277', '河西学院');
INSERT INTO `shool_info` VALUES ('1903', '277', '张掖医学高等专科学校');
INSERT INTO `shool_info` VALUES ('1904', '278', '青海大学');
INSERT INTO `shool_info` VALUES ('1905', '278', '青海师范大学');
INSERT INTO `shool_info` VALUES ('1906', '278', '青海民族大学');
INSERT INTO `shool_info` VALUES ('1907', '278', '青海卫生职业技术学院');
INSERT INTO `shool_info` VALUES ('1908', '278', '青海警官职业学院');
INSERT INTO `shool_info` VALUES ('1909', '278', '青海畜牧兽医职业技术学院');
INSERT INTO `shool_info` VALUES ('1910', '278', '青海交通职业技术学院');
INSERT INTO `shool_info` VALUES ('1911', '278', '青海建筑职业技术学院');
INSERT INTO `shool_info` VALUES ('1912', '279', '西藏大学');
INSERT INTO `shool_info` VALUES ('1913', '279', '西藏藏医学院');
INSERT INTO `shool_info` VALUES ('1914', '279', '西藏警官高等专科学校');
INSERT INTO `shool_info` VALUES ('1915', '279', '拉萨师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1916', '279', '西藏职业技术学院');
INSERT INTO `shool_info` VALUES ('1917', '280', '西藏民族学院');
INSERT INTO `shool_info` VALUES ('1918', '281', '阿克苏职业技术学院');
INSERT INTO `shool_info` VALUES ('1919', '282', '塔里木大学');
INSERT INTO `shool_info` VALUES ('1920', '283', '昌吉学院');
INSERT INTO `shool_info` VALUES ('1921', '283', '新疆农业职业技术学院');
INSERT INTO `shool_info` VALUES ('1922', '283', '昌吉职业技术学院');
INSERT INTO `shool_info` VALUES ('1923', '284', '和田师范专科学校');
INSERT INTO `shool_info` VALUES ('1924', '284', '新疆维吾尔医学专科学校');
INSERT INTO `shool_info` VALUES ('1925', '285', '喀什师范学院');
INSERT INTO `shool_info` VALUES ('1926', '286', '克拉玛依职业技术学院');
INSERT INTO `shool_info` VALUES ('1927', '287', '巴音郭楞职业技术学院');
INSERT INTO `shool_info` VALUES ('1928', '288', '新疆应用职业技术学院');
INSERT INTO `shool_info` VALUES ('1929', '289', '石河子大学');
INSERT INTO `shool_info` VALUES ('1930', '289', '新疆石河子职业技术学院');
INSERT INTO `shool_info` VALUES ('1931', '290', '新疆大学');
INSERT INTO `shool_info` VALUES ('1932', '290', '新疆农业大学');
INSERT INTO `shool_info` VALUES ('1933', '290', '新疆医科大学');
INSERT INTO `shool_info` VALUES ('1934', '290', '新疆师范大学');
INSERT INTO `shool_info` VALUES ('1935', '290', '新疆财经大学');
INSERT INTO `shool_info` VALUES ('1936', '290', '新疆艺术学院');
INSERT INTO `shool_info` VALUES ('1937', '290', '新疆工程学院');
INSERT INTO `shool_info` VALUES ('1938', '290', '新疆警察学院');
INSERT INTO `shool_info` VALUES ('1939', '290', '新疆师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1940', '290', '新疆兵团警官高等专科学校');
INSERT INTO `shool_info` VALUES ('1941', '290', '乌鲁木齐职业大学');
INSERT INTO `shool_info` VALUES ('1942', '290', '新疆职业大学');
INSERT INTO `shool_info` VALUES ('1943', '290', '新疆体育职业技术学院');
INSERT INTO `shool_info` VALUES ('1944', '290', '新疆铁道职业技术学院');
INSERT INTO `shool_info` VALUES ('1945', '290', '新疆机电职业技术学院');
INSERT INTO `shool_info` VALUES ('1946', '290', '新疆轻工职业技术学院');
INSERT INTO `shool_info` VALUES ('1947', '290', '新疆能源职业技术学院');
INSERT INTO `shool_info` VALUES ('1948', '290', '新疆建设职业技术学院');
INSERT INTO `shool_info` VALUES ('1949', '290', '新疆现代职业技术学院');
INSERT INTO `shool_info` VALUES ('1950', '290', '新疆天山职业技术学院');
INSERT INTO `shool_info` VALUES ('1951', '290', '新疆交通职业技术学院');
INSERT INTO `shool_info` VALUES ('1952', '291', '伊犁师范学院');
INSERT INTO `shool_info` VALUES ('1953', '292', '伊犁职业技术学院');
INSERT INTO `shool_info` VALUES ('1954', '293', '安庆师范学院');
INSERT INTO `shool_info` VALUES ('1955', '293', '安庆医药高等专科学校');
INSERT INTO `shool_info` VALUES ('1956', '293', '桐城师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1957', '293', '安徽黄梅戏艺术职业学院');
INSERT INTO `shool_info` VALUES ('1958', '293', '安庆职业技术学院');
INSERT INTO `shool_info` VALUES ('1959', '294', '安徽财经大学');
INSERT INTO `shool_info` VALUES ('1960', '294', '蚌埠医学院');
INSERT INTO `shool_info` VALUES ('1961', '294', '蚌埠学院');
INSERT INTO `shool_info` VALUES ('1962', '294', '蚌埠经济技术职业学院');
INSERT INTO `shool_info` VALUES ('1963', '294', '安徽电子信息职业技术学院');
INSERT INTO `shool_info` VALUES ('1964', '295', '亳州师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1965', '295', '亳州职业技术学院');
INSERT INTO `shool_info` VALUES ('1966', '296', '池州学院');
INSERT INTO `shool_info` VALUES ('1967', '296', '安徽人口职业学院');
INSERT INTO `shool_info` VALUES ('1968', '296', '池州职业技术学院');
INSERT INTO `shool_info` VALUES ('1969', '297', '滁州学院');
INSERT INTO `shool_info` VALUES ('1970', '297', '安徽科技学院');
INSERT INTO `shool_info` VALUES ('1971', '297', '滁州城市职业学院');
INSERT INTO `shool_info` VALUES ('1972', '297', '滁州职业技术学院');
INSERT INTO `shool_info` VALUES ('1973', '298', '阜阳师范学院');
INSERT INTO `shool_info` VALUES ('1974', '298', '民办安徽旅游职业学院');
INSERT INTO `shool_info` VALUES ('1975', '298', '阜阳职业技术学院');
INSERT INTO `shool_info` VALUES ('1976', '298', '阜阳科技职业学院');
INSERT INTO `shool_info` VALUES ('1977', '299', '合肥工业大学');
INSERT INTO `shool_info` VALUES ('1978', '299', '中国科学技术大学');
INSERT INTO `shool_info` VALUES ('1979', '299', '安徽大学');
INSERT INTO `shool_info` VALUES ('1980', '299', '安徽农业大学');
INSERT INTO `shool_info` VALUES ('1981', '299', '安徽医科大学');
INSERT INTO `shool_info` VALUES ('1982', '299', '安徽中医药大学');
INSERT INTO `shool_info` VALUES ('1983', '299', '安徽建筑大学');
INSERT INTO `shool_info` VALUES ('1984', '299', '巢湖学院');
INSERT INTO `shool_info` VALUES ('1985', '299', '安徽三联学院');
INSERT INTO `shool_info` VALUES ('1986', '299', '合肥学院');
INSERT INTO `shool_info` VALUES ('1987', '299', '安徽文达信息工程学院');
INSERT INTO `shool_info` VALUES ('1988', '299', '安徽外国语学院');
INSERT INTO `shool_info` VALUES ('1989', '299', '合肥师范学院');
INSERT INTO `shool_info` VALUES ('1990', '299', '安徽新华学院');
INSERT INTO `shool_info` VALUES ('1991', '299', '合肥幼儿师范高等专科学校');
INSERT INTO `shool_info` VALUES ('1992', '299', '安徽医学高等专科学校');
INSERT INTO `shool_info` VALUES ('1993', '299', '安徽职业技术学院');
INSERT INTO `shool_info` VALUES ('1994', '299', '合肥职业技术学院');
INSERT INTO `shool_info` VALUES ('1995', '299', '民办合肥滨湖职业技术学院');
INSERT INTO `shool_info` VALUES ('1996', '299', '民办合肥财经职业学院');
INSERT INTO `shool_info` VALUES ('1997', '299', '安徽涉外经济职业学院');
INSERT INTO `shool_info` VALUES ('1998', '299', '安徽绿海商务职业学院');
INSERT INTO `shool_info` VALUES ('1999', '299', '合肥共达职业技术学院');
INSERT INTO `shool_info` VALUES ('2000', '299', '徽商职业学院');
INSERT INTO `shool_info` VALUES ('2001', '299', '合肥信息技术职业学院');
INSERT INTO `shool_info` VALUES ('2002', '299', '安徽汽车职业技术学院');
INSERT INTO `shool_info` VALUES ('2003', '299', '安徽长江职业学院');
INSERT INTO `shool_info` VALUES ('2004', '299', '安徽粮食工程职业学院');
INSERT INTO `shool_info` VALUES ('2005', '299', '合肥科技职业学院');
INSERT INTO `shool_info` VALUES ('2006', '299', '安徽水利水电职业技术学院');
INSERT INTO `shool_info` VALUES ('2007', '299', '民办万博科技职业学院');
INSERT INTO `shool_info` VALUES ('2008', '299', '安徽警官职业学院');
INSERT INTO `shool_info` VALUES ('2009', '299', '安徽工业经济职业技术学院');
INSERT INTO `shool_info` VALUES ('2010', '299', '合肥通用职业技术学院');
INSERT INTO `shool_info` VALUES ('2011', '299', '民办合肥经济技术职业学院');
INSERT INTO `shool_info` VALUES ('2012', '299', '安徽交通职业技术学院');
INSERT INTO `shool_info` VALUES ('2013', '299', '安徽体育运动职业技术学院');
INSERT INTO `shool_info` VALUES ('2014', '299', '安徽广播影视职业技术学院');
INSERT INTO `shool_info` VALUES ('2015', '299', '安徽电气工程职业技术学院');
INSERT INTO `shool_info` VALUES ('2016', '299', '安徽城市管理职业学院');
INSERT INTO `shool_info` VALUES ('2017', '299', '安徽工商职业学院');
INSERT INTO `shool_info` VALUES ('2018', '299', '安徽中澳科技职业学院');
INSERT INTO `shool_info` VALUES ('2019', '299', '安徽艺术职业学院');
INSERT INTO `shool_info` VALUES ('2020', '299', '安徽财贸职业学院');
INSERT INTO `shool_info` VALUES ('2021', '299', '安徽国际商务职业学院');
INSERT INTO `shool_info` VALUES ('2022', '299', '安徽公安职业学院');
INSERT INTO `shool_info` VALUES ('2023', '299', '安徽林业职业技术学院');
INSERT INTO `shool_info` VALUES ('2024', '299', '安徽审计职业学院');
INSERT INTO `shool_info` VALUES ('2025', '299', '安徽新闻出版职业技术学院');
INSERT INTO `shool_info` VALUES ('2026', '299', '安徽邮电职业技术学院');
INSERT INTO `shool_info` VALUES ('2027', '300', '淮北师范大学');
INSERT INTO `shool_info` VALUES ('2028', '300', '淮北职业技术学院');
INSERT INTO `shool_info` VALUES ('2029', '300', '安徽矿业职业技术学院');
INSERT INTO `shool_info` VALUES ('2030', '301', '安徽理工大学');
INSERT INTO `shool_info` VALUES ('2031', '301', '淮南师范学院');
INSERT INTO `shool_info` VALUES ('2032', '301', '淮南联合大学');
INSERT INTO `shool_info` VALUES ('2033', '301', '淮南职业技术学院');
INSERT INTO `shool_info` VALUES ('2034', '301', '安徽工贸职业技术学院');
INSERT INTO `shool_info` VALUES ('2035', '302', '黄山学院');
INSERT INTO `shool_info` VALUES ('2036', '302', '黄山职业技术学院');
INSERT INTO `shool_info` VALUES ('2037', '303', '皖西学院');
INSERT INTO `shool_info` VALUES ('2038', '303', '安徽现代信息工程职业学院');
INSERT INTO `shool_info` VALUES ('2039', '303', '皖西卫生职业学院');
INSERT INTO `shool_info` VALUES ('2040', '303', '六安职业技术学院');
INSERT INTO `shool_info` VALUES ('2041', '303', '安徽国防科技职业学院');
INSERT INTO `shool_info` VALUES ('2042', '304', '安徽工业大学');
INSERT INTO `shool_info` VALUES ('2043', '304', '马鞍山师范高等专科学校');
INSERT INTO `shool_info` VALUES ('2044', '304', '马鞍山职业技术学院');
INSERT INTO `shool_info` VALUES ('2045', '304', '安徽冶金科技职业学院');
INSERT INTO `shool_info` VALUES ('2046', '305', '铜陵学院');
INSERT INTO `shool_info` VALUES ('2047', '305', '铜陵职业技术学院');
INSERT INTO `shool_info` VALUES ('2048', '305', '安徽工业职业技术学院');
INSERT INTO `shool_info` VALUES ('2049', '306', '安徽工程大学');
INSERT INTO `shool_info` VALUES ('2050', '306', '安徽师范大学');
INSERT INTO `shool_info` VALUES ('2051', '306', '皖南医学院');
INSERT INTO `shool_info` VALUES ('2052', '306', '安徽中医药高等专科学校');
INSERT INTO `shool_info` VALUES ('2053', '306', '芜湖职业技术学院');
INSERT INTO `shool_info` VALUES ('2054', '306', '安徽扬子职业技术学院');
INSERT INTO `shool_info` VALUES ('2055', '306', '安徽商贸职业技术学院');
INSERT INTO `shool_info` VALUES ('2056', '306', '安徽机电职业技术学院');
INSERT INTO `shool_info` VALUES ('2057', '307', '宿州学院');
INSERT INTO `shool_info` VALUES ('2058', '307', '宿州职业技术学院');
INSERT INTO `shool_info` VALUES ('2059', '308', '宣城职业技术学院');
INSERT INTO `shool_info` VALUES ('2060', '309', '浙江大学');
INSERT INTO `shool_info` VALUES ('2061', '309', '杭州电子科技大学');
INSERT INTO `shool_info` VALUES ('2062', '309', '浙江工业大学');
INSERT INTO `shool_info` VALUES ('2063', '309', '浙江理工大学');
INSERT INTO `shool_info` VALUES ('2064', '309', '浙江农林大学');
INSERT INTO `shool_info` VALUES ('2065', '309', '浙江中医药大学');
INSERT INTO `shool_info` VALUES ('2066', '309', '杭州师范大学');
INSERT INTO `shool_info` VALUES ('2067', '309', '浙江工商大学');
INSERT INTO `shool_info` VALUES ('2068', '309', '浙江财经大学');
INSERT INTO `shool_info` VALUES ('2069', '309', '中国美术学院');
INSERT INTO `shool_info` VALUES ('2070', '309', '中国计量学院');
INSERT INTO `shool_info` VALUES ('2071', '309', '浙江科技学院');
INSERT INTO `shool_info` VALUES ('2072', '309', '浙江水利水电学院');
INSERT INTO `shool_info` VALUES ('2073', '309', '浙江警察学院');
INSERT INTO `shool_info` VALUES ('2074', '309', '浙江传媒学院');
INSERT INTO `shool_info` VALUES ('2075', '309', '浙江树人学院');
INSERT INTO `shool_info` VALUES ('2076', '309', '浙江外国语学院');
INSERT INTO `shool_info` VALUES ('2077', '309', '浙江医学高等专科学校');
INSERT INTO `shool_info` VALUES ('2078', '309', '浙江交通职业技术学院');
INSERT INTO `shool_info` VALUES ('2079', '309', '浙江电力职业技术学院');
INSERT INTO `shool_info` VALUES ('2080', '309', '浙江同济科技职业学院');
INSERT INTO `shool_info` VALUES ('2081', '309', '杭州科技职业技术学院');
INSERT INTO `shool_info` VALUES ('2082', '309', '浙江体育职业技术学院');
INSERT INTO `shool_info` VALUES ('2083', '309', '浙江机电职业技术学院');
INSERT INTO `shool_info` VALUES ('2084', '309', '浙江建设职业技术学院');
INSERT INTO `shool_info` VALUES ('2085', '309', '浙江艺术职业学院');
INSERT INTO `shool_info` VALUES ('2086', '309', '浙江经贸职业技术学院');
INSERT INTO `shool_info` VALUES ('2087', '309', '浙江商业职业技术学院');
INSERT INTO `shool_info` VALUES ('2088', '309', '浙江经济职业技术学院');
INSERT INTO `shool_info` VALUES ('2089', '309', '浙江旅游职业学院');
INSERT INTO `shool_info` VALUES ('2090', '309', '浙江育英职业技术学院');
INSERT INTO `shool_info` VALUES ('2091', '309', '浙江警官职业学院');
INSERT INTO `shool_info` VALUES ('2092', '309', '浙江金融职业学院');
INSERT INTO `shool_info` VALUES ('2093', '309', '杭州职业技术学院');
INSERT INTO `shool_info` VALUES ('2094', '309', '浙江长征职业技术学院');
INSERT INTO `shool_info` VALUES ('2095', '309', '杭州万向职业技术学院');
INSERT INTO `shool_info` VALUES ('2096', '310', '湖州师范学院');
INSERT INTO `shool_info` VALUES ('2097', '310', '湖州职业技术学院');
INSERT INTO `shool_info` VALUES ('2098', '311', '嘉兴学院');
INSERT INTO `shool_info` VALUES ('2099', '311', '嘉兴职业技术学院');
INSERT INTO `shool_info` VALUES ('2100', '311', '嘉兴南洋职业技术学院');
INSERT INTO `shool_info` VALUES ('2101', '312', '浙江师范大学');
INSERT INTO `shool_info` VALUES ('2102', '312', '金华职业技术学院');
INSERT INTO `shool_info` VALUES ('2103', '312', '浙江横店影视职业学院');
INSERT INTO `shool_info` VALUES ('2104', '312', '义乌工商职业技术学院');
INSERT INTO `shool_info` VALUES ('2105', '312', '浙江广厦建设职业技术学院');
INSERT INTO `shool_info` VALUES ('2106', '313', '丽水学院');
INSERT INTO `shool_info` VALUES ('2107', '313', '丽水职业技术学院');
INSERT INTO `shool_info` VALUES ('2108', '314', '宁波大学');
INSERT INTO `shool_info` VALUES ('2109', '314', '宁波诺丁汉大学');
INSERT INTO `shool_info` VALUES ('2110', '314', '公安海警学院');
INSERT INTO `shool_info` VALUES ('2111', '314', '浙江万里学院');
INSERT INTO `shool_info` VALUES ('2112', '314', '宁波工程学院');
INSERT INTO `shool_info` VALUES ('2113', '314', '宁波大红鹰学院');
INSERT INTO `shool_info` VALUES ('2114', '314', '浙江医药高等专科学校');
INSERT INTO `shool_info` VALUES ('2115', '314', '宁波职业技术学院');
INSERT INTO `shool_info` VALUES ('2116', '314', '宁波卫生职业技术学院');
INSERT INTO `shool_info` VALUES ('2117', '314', '宁波城市职业技术学院');
INSERT INTO `shool_info` VALUES ('2118', '314', '浙江工商职业技术学院');
INSERT INTO `shool_info` VALUES ('2119', '314', '浙江纺织服装职业技术学院');
INSERT INTO `shool_info` VALUES ('2120', '315', '衢州学院');
INSERT INTO `shool_info` VALUES ('2121', '315', '衢州职业技术学院');
INSERT INTO `shool_info` VALUES ('2122', '316', '绍兴文理学院');
INSERT INTO `shool_info` VALUES ('2123', '316', '浙江越秀外国语学院');
INSERT INTO `shool_info` VALUES ('2124', '316', '绍兴职业技术学院');
INSERT INTO `shool_info` VALUES ('2125', '316', '浙江邮电职业技术学院');
INSERT INTO `shool_info` VALUES ('2126', '316', '浙江农业商贸职业学院');
INSERT INTO `shool_info` VALUES ('2127', '316', '浙江工业职业技术学院');
INSERT INTO `shool_info` VALUES ('2128', '317', '台州学院');
INSERT INTO `shool_info` VALUES ('2129', '317', '台州科技职业学院');
INSERT INTO `shool_info` VALUES ('2130', '317', '浙江汽车职业技术学院');
INSERT INTO `shool_info` VALUES ('2131', '317', '台州职业技术学院');
INSERT INTO `shool_info` VALUES ('2132', '318', '温州医科大学');
INSERT INTO `shool_info` VALUES ('2133', '318', '温州大学');
INSERT INTO `shool_info` VALUES ('2134', '318', '温州职业技术学院');
INSERT INTO `shool_info` VALUES ('2135', '318', '温州科技职业学院');
INSERT INTO `shool_info` VALUES ('2136', '318', '浙江工贸职业技术学院');
INSERT INTO `shool_info` VALUES ('2137', '318', '浙江东方职业技术学院');
INSERT INTO `shool_info` VALUES ('2138', '319', '浙江海洋学院');
INSERT INTO `shool_info` VALUES ('2139', '319', '浙江国际海运职业技术学院');
INSERT INTO `shool_info` VALUES ('2140', '320', '福州大学');
INSERT INTO `shool_info` VALUES ('2141', '320', '福建农林大学');
INSERT INTO `shool_info` VALUES ('2142', '320', '福建医科大学');
INSERT INTO `shool_info` VALUES ('2143', '320', '福建中医药大学');
INSERT INTO `shool_info` VALUES ('2144', '320', '福建师范大学');
INSERT INTO `shool_info` VALUES ('2145', '320', '福建工程学院');
INSERT INTO `shool_info` VALUES ('2146', '320', '闽江学院');
INSERT INTO `shool_info` VALUES ('2147', '320', '福建警察学院');
INSERT INTO `shool_info` VALUES ('2148', '320', '福州外语外贸学院');
INSERT INTO `shool_info` VALUES ('2149', '320', '福建江夏学院');
INSERT INTO `shool_info` VALUES ('2150', '320', '福建商业高等专科学校');
INSERT INTO `shool_info` VALUES ('2151', '320', '福建幼儿师范高等专科学校');
INSERT INTO `shool_info` VALUES ('2152', '320', '闽江师范高等专科学校');
INSERT INTO `shool_info` VALUES ('2153', '320', '福建船政交通职业学院');
INSERT INTO `shool_info` VALUES ('2154', '320', '福建华南女子职业学院');
INSERT INTO `shool_info` VALUES ('2155', '320', '福建卫生职业技术学院');
INSERT INTO `shool_info` VALUES ('2156', '320', '福建生物工程职业技术学院');
INSERT INTO `shool_info` VALUES ('2157', '320', '福建艺术职业学院');
INSERT INTO `shool_info` VALUES ('2158', '320', '福建体育职业技术学院');
INSERT INTO `shool_info` VALUES ('2159', '320', '福州职业技术学院');
INSERT INTO `shool_info` VALUES ('2160', '320', '福建信息职业技术学院');
INSERT INTO `shool_info` VALUES ('2161', '320', '福建农业职业技术学院');
INSERT INTO `shool_info` VALUES ('2162', '320', '福州英华职业学院');
INSERT INTO `shool_info` VALUES ('2163', '320', '福建警官职业学院');
INSERT INTO `shool_info` VALUES ('2164', '320', '福州黎明职业技术学院');
INSERT INTO `shool_info` VALUES ('2165', '320', '福州科技职业技术学院');
INSERT INTO `shool_info` VALUES ('2166', '320', '福建对外经济贸易职业技术学院');
INSERT INTO `shool_info` VALUES ('2167', '320', '福州海峡职业技术学院');
INSERT INTO `shool_info` VALUES ('2168', '320', '福州软件职业技术学院');
INSERT INTO `shool_info` VALUES ('2169', '321', '龙岩学院');
INSERT INTO `shool_info` VALUES ('2170', '321', '闽西职业技术学院');
INSERT INTO `shool_info` VALUES ('2171', '322', '武夷学院');
INSERT INTO `shool_info` VALUES ('2172', '322', '武夷山职业学院');
INSERT INTO `shool_info` VALUES ('2173', '322', '福建林业职业技术学院');
INSERT INTO `shool_info` VALUES ('2174', '322', '闽北职业技术学院');
INSERT INTO `shool_info` VALUES ('2175', '323', '宁德师范学院');
INSERT INTO `shool_info` VALUES ('2176', '323', '宁德职业技术学院');
INSERT INTO `shool_info` VALUES ('2177', '324', '莆田学院');
INSERT INTO `shool_info` VALUES ('2178', '324', '湄洲湾职业技术学院');
INSERT INTO `shool_info` VALUES ('2179', '325', '华侨大学');
INSERT INTO `shool_info` VALUES ('2180', '325', '仰恩大学');
INSERT INTO `shool_info` VALUES ('2181', '325', '泉州师范学院');
INSERT INTO `shool_info` VALUES ('2182', '325', '闽南理工学院');
INSERT INTO `shool_info` VALUES ('2183', '325', '泉州幼儿师范高等专科学校');
INSERT INTO `shool_info` VALUES ('2184', '325', '泉州医学高等专科学校');
INSERT INTO `shool_info` VALUES ('2185', '325', '黎明职业大学');
INSERT INTO `shool_info` VALUES ('2186', '325', '德化陶瓷职业技术学院');
INSERT INTO `shool_info` VALUES ('2187', '325', '泉州泰山航海职业学院');
INSERT INTO `shool_info` VALUES ('2188', '325', '泉州轻工职业学院');
INSERT INTO `shool_info` VALUES ('2189', '325', '福建电力职业技术学院');
INSERT INTO `shool_info` VALUES ('2190', '325', '泉州纺织服装职业学院');
INSERT INTO `shool_info` VALUES ('2191', '325', '泉州华光摄影艺术职业学院');
INSERT INTO `shool_info` VALUES ('2192', '325', '泉州理工职业学院');
INSERT INTO `shool_info` VALUES ('2193', '325', '泉州信息职业技术学院');
INSERT INTO `shool_info` VALUES ('2194', '325', '泉州经贸职业技术学院');
INSERT INTO `shool_info` VALUES ('2195', '326', '三明学院');
INSERT INTO `shool_info` VALUES ('2196', '326', '福建水利电力职业技术学院');
INSERT INTO `shool_info` VALUES ('2197', '326', '三明职业技术学院');
INSERT INTO `shool_info` VALUES ('2198', '327', '厦门大学');
INSERT INTO `shool_info` VALUES ('2199', '327', '集美大学');
INSERT INTO `shool_info` VALUES ('2200', '327', '厦门理工学院');
INSERT INTO `shool_info` VALUES ('2201', '327', '厦门医学高等专科学校');
INSERT INTO `shool_info` VALUES ('2202', '327', '厦门城市职业学院');
INSERT INTO `shool_info` VALUES ('2203', '327', '厦门软件职业技术学院');
INSERT INTO `shool_info` VALUES ('2204', '327', '厦门南洋职业学院');
INSERT INTO `shool_info` VALUES ('2205', '327', '厦门东海职业技术学院');
INSERT INTO `shool_info` VALUES ('2206', '327', '厦门安防科技职业学院');
INSERT INTO `shool_info` VALUES ('2207', '327', '厦门海洋职业技术学院');
INSERT INTO `shool_info` VALUES ('2208', '327', '厦门华厦职业学院');
INSERT INTO `shool_info` VALUES ('2209', '327', '厦门演艺职业学院');
INSERT INTO `shool_info` VALUES ('2210', '327', '厦门华天涉外职业技术学院');
INSERT INTO `shool_info` VALUES ('2211', '327', '厦门兴才职业技术学院');
INSERT INTO `shool_info` VALUES ('2212', '328', '闽南师范大学');
INSERT INTO `shool_info` VALUES ('2213', '328', '漳州职业技术学院');
INSERT INTO `shool_info` VALUES ('2214', '328', '漳州城市职业学院');
INSERT INTO `shool_info` VALUES ('2215', '328', '漳州科技职业学院');
INSERT INTO `shool_info` VALUES ('2216', '328', '漳州理工职业学院');
INSERT INTO `shool_info` VALUES ('2217', '328', '漳州卫生职业学院');

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `ShopId` int(11) NOT NULL AUTO_INCREMENT,
  `GoodsId` int(11) DEFAULT NULL,
  `ClientId` int(11) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ShopId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop
-- ----------------------------

-- ----------------------------
-- Table structure for webmessage
-- ----------------------------
DROP TABLE IF EXISTS `webmessage`;
CREATE TABLE `webmessage` (
  `WebMessageId` int(11) NOT NULL AUTO_INCREMENT,
  `MessageName` varchar(255) DEFAULT NULL,
  `MessageValue` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`WebMessageId`)
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webmessage
-- ----------------------------
INSERT INTO `webmessage` VALUES ('340', '网站类型', '综合服务类');
INSERT INTO `webmessage` VALUES ('341', '主营', '销售，兼职');
INSERT INTO `webmessage` VALUES ('342', '销售类型', '二手商品');
INSERT INTO `webmessage` VALUES ('343', '建站时间', '2015-5-15');
INSERT INTO `webmessage` VALUES ('344', '建站人', '周建新');

-- ----------------------------
-- Table structure for webpic
-- ----------------------------
DROP TABLE IF EXISTS `webpic`;
CREATE TABLE `webpic` (
  `WebPicId` int(11) NOT NULL,
  `WebPicture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`WebPicId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webpic
-- ----------------------------
INSERT INTO `webpic` VALUES ('1', '/new_school_assistant/hou/upload/image/20170525/20170525172737_202.jpg');

-- ----------------------------
-- Table structure for worker
-- ----------------------------
DROP TABLE IF EXISTS `worker`;
CREATE TABLE `worker` (
  `WorkerId` int(11) NOT NULL AUTO_INCREMENT,
  `WorkerName` varchar(255) DEFAULT NULL,
  `WorkerType` int(11) DEFAULT NULL,
  `Idcard` varchar(255) DEFAULT NULL,
  `Tel` varchar(255) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Discripe` varchar(255) DEFAULT NULL,
  `Picture` varchar(255) DEFAULT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `DeleteStatus` varchar(255) DEFAULT NULL,
  `WorkTime` date DEFAULT NULL,
  PRIMARY KEY (`WorkerId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of worker
-- ----------------------------
INSERT INTO `worker` VALUES ('1', '周建新', '1', '332502199705262414', '17854116993', '21', '呵呵', '/new_school_assistant/hou/upload/image/20170525/20170525160913_607.jpg', '男', '2017-05-16 00:00:00', '2017-05-23 21:09:34', '1', '2017-05-15');
INSERT INTO `worker` VALUES ('2', '王子玉', '2', '332502199205262414', '17854111234', '25', 'www', '/new_school_assistant/hou/upload/image/20170525/20170525160809_650.jpg', '男', '2017-05-16 00:00:00', '2017-05-23 20:54:21', '1', '2017-05-10');
INSERT INTO `worker` VALUES ('4', '苏子', '2', '221548199395959132', '17854111759', '24', '...', '/new_school_assistant/hou/upload/image/20170525/20170525160152_983.jpg', '男', '2017-05-16 00:00:00', '2017-05-23 00:37:45', '1', '2017-05-09');
INSERT INTO `worker` VALUES ('8', '纪港', '2', '332502199705262464', '17854116688', '20', '撒', null, '女', '2017-05-18 20:01:22', '2017-05-18 20:01:22', '1', '2017-05-01');

-- ----------------------------
-- Table structure for workertype
-- ----------------------------
DROP TABLE IF EXISTS `workertype`;
CREATE TABLE `workertype` (
  `WorkerTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `WorkerTypeName` varchar(255) DEFAULT NULL,
  `Discripe` varchar(255) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `Number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`WorkerTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of workertype
-- ----------------------------
INSERT INTO `workertype` VALUES ('1', '董事长', '无敌的董事长，哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', '0', '2017-05-15 00:00:00', '1');
INSERT INTO `workertype` VALUES ('2', '总经理', '一人之下万人之', '0', '2017-05-15 00:00:00', '0');
INSERT INTO `workertype` VALUES ('3', '经理', '尽力了ww', '0', '2017-05-10 13:39:01', '0');
