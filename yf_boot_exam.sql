/*
SQLyog Ultimate v12.3.1 (64 bit)
MySQL - 8.0.40 : Database - yf_boot_exam
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE `yf_boot_exam`;

/*Table structure for table `el_cfg_base` */

DROP TABLE IF EXISTS `el_cfg_base`;

CREATE TABLE `el_cfg_base` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `site_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '系统名称',
  `login_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '登录LOGO',
  `login_bg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '登录背景',
  `back_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '后台LOGO',
  `copy_right` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '版权信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统设置';

/*Data for the table `el_cfg_base` */

insert  into `el_cfg_base`(`id`,`site_name`,`login_logo`,`login_bg`,`back_logo`,`copy_right`) values 
('1','云帆考试系统V2','http://localhost:8080/upload/file/2023/09/08/1700041676380217345.png','https://www.kaoshifeng.com/img/advantages/4.png','https://files.yfhl.net/2022/11/21/1669011274378-914f43d8.png','<p>&copy; 2025 北京云帆互联科技有限公司</p>');

/*Table structure for table `el_cfg_switch` */

DROP TABLE IF EXISTS `el_cfg_switch`;

CREATE TABLE `el_cfg_switch` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '功能名称',
  `val` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '开关或值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='功能配置';

/*Data for the table `el_cfg_switch` */

insert  into `el_cfg_switch`(`id`,`val`) values 
('loginTick','1'),
('userReg','true');

/*Table structure for table `el_exam` */

DROP TABLE IF EXISTS `el_exam`;

CREATE TABLE `el_exam` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '考试名称',
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '考试描述',
  `open_type` int NOT NULL DEFAULT '1' COMMENT '1公开2部门3定员',
  `state` int NOT NULL DEFAULT '0' COMMENT '考试状态',
  `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
  `end_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '结束时间',
  `total_score` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总分数',
  `total_time` int NOT NULL DEFAULT '0' COMMENT '总时长（分钟）',
  `qualify_score` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '及格分数',
  `chance` int NOT NULL DEFAULT '0' COMMENT '考试机会',
  `hand_min` int NOT NULL DEFAULT '0' COMMENT '最低交卷分钟',
  `late_max` int NOT NULL DEFAULT '0' COMMENT '允许迟到分钟',
  `thanks` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '感谢文字',
  `repo_id` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组卷题库ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='课程';

/*Data for the table `el_exam` */

insert  into `el_exam`(`id`,`title`,`content`,`open_type`,`state`,`start_time`,`end_time`,`total_score`,`total_time`,`qualify_score`,`chance`,`hand_min`,`late_max`,`thanks`,`repo_id`,`create_time`,`update_time`,`create_by`,`update_by`) values 
('1912103485514850306','胡乱考试3','<p>2121</p>',1,0,'2025-04-01 00:00:00','2025-05-31 00:00:00',20.00,1,0.00,0,0,0,NULL,'1910524655864012801','2025-04-15 19:19:30','2025-04-16 11:38:24',NULL,'1000000000000000001'),
('1912103518402387969','1212','<p>2121</p>',1,0,'2025-04-15 00:00:00','2025-05-21 00:00:00',0.00,0,0.00,0,0,0,NULL,'1910524655864012801','2025-04-15 19:19:38','2025-04-15 19:19:38',NULL,NULL),
('1912319059444625409','111',NULL,1,0,'2025-04-16 09:36:07','2025-04-16 09:36:07',5.00,5,1.00,0,0,0,NULL,'1910524655864012801','2025-04-16 09:36:07','2025-04-16 09:36:07',NULL,NULL),
('1912325593490780162','阿萨',NULL,1,0,'2025-04-16 10:02:05','2025-04-16 10:02:05',5.00,5,1.00,0,0,0,NULL,'1910524655864012801','2025-04-16 10:02:05','2025-04-16 10:02:05',NULL,NULL),
('1912340293842530306','新建考试','<p>就这样考试啊！</p>',1,0,'2025-04-01 00:00:00','2025-05-31 00:00:00',100.00,5,60.00,0,0,0,NULL,'1910524655864012801','2025-04-16 11:00:30','2025-04-16 11:00:30','1000000000000000001',NULL);

/*Table structure for table `el_exam_rule` */

DROP TABLE IF EXISTS `el_exam_rule`;

CREATE TABLE `el_exam_rule` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `exam_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '考试ID',
  `repo_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '题库ID',
  `qu_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '题型',
  `qu_count` int DEFAULT NULL COMMENT '出题数量',
  `qu_score` decimal(10,0) NOT NULL DEFAULT '1' COMMENT '每题分数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='考试规则';

/*Data for the table `el_exam_rule` */

insert  into `el_exam_rule`(`id`,`exam_id`,`repo_id`,`qu_type`,`qu_count`,`qu_score`) values 
('1912103518419165186','1912103518402387969','1910524655864012801','radio',1,5),
('1912103518419165187','1912103518402387969','1910524655864012801','multi',0,0),
('1912103518419165188','1912103518402387969','1910524655864012801','judge',0,0),
('1912103518419165189','1912103518402387969','1910524655864012801','multi2',0,0),
('1912319059532705793','1912319059444625409','1910524655864012801','radio',1,5),
('1912319059541094401','1912319059444625409','1910524655864012801','multi',0,0),
('1912319059549483009','1912319059444625409','1910524655864012801','judge',0,0),
('1912319059549483010','1912319059444625409','1910524655864012801','multi2',0,0),
('1912325593490780163','1912325593490780162','1910524655864012801','radio',1,5),
('1912325593490780164','1912325593490780162','1910524655864012801','multi',0,0),
('1912325593490780165','1912325593490780162','1910524655864012801','judge',0,0),
('1912325593490780166','1912325593490780162','1910524655864012801','multi2',0,0),
('1912340293909639170','1912340293842530306','1910524655864012801','radio',2,50),
('1912340293909639171','1912340293842530306','1910524655864012801','multi',0,0),
('1912340293909639172','1912340293842530306','1910524655864012801','judge',0,0),
('1912340293909639173','1912340293842530306','1910524655864012801','multi2',0,0),
('1912349830368665602','1912103485514850306','1910524655864012801','radio',2,10),
('1912349830372859906','1912103485514850306','1910524655864012801','multi',0,0),
('1912349830372859907','1912103485514850306','1910524655864012801','judge',0,0),
('1912349830372859908','1912103485514850306','1910524655864012801','multi2',0,0);

/*Table structure for table `el_paper` */

DROP TABLE IF EXISTS `el_paper`;

CREATE TABLE `el_paper` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `exam_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '考试ID',
  `title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '考试标题',
  `total_time` int NOT NULL DEFAULT '0' COMMENT '考试时长',
  `user_time` int NOT NULL DEFAULT '0' COMMENT '用户时长',
  `total_score` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '试卷总分',
  `qualify_score` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '试卷及格分',
  `user_score` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '用户总得分',
  `limit_time` datetime NOT NULL COMMENT '最后截止时间',
  `hand_time` datetime DEFAULT NULL COMMENT '实际交卷时间',
  `hand_state` int NOT NULL DEFAULT '0' COMMENT '交卷状态,0未交卷,1已交卷,2强制交卷',
  `passed` tinyint NOT NULL DEFAULT '0' COMMENT '成绩是否合格',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `exam_id` (`exam_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='试卷';

/*Data for the table `el_paper` */

/*Table structure for table `el_paper_qu` */

DROP TABLE IF EXISTS `el_paper_qu`;

CREATE TABLE `el_paper_qu` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `paper_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '试卷ID',
  `qu_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '题目ID',
  `qu_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '题目类型',
  `answered` tinyint NOT NULL DEFAULT '0' COMMENT '是否已答',
  `mark` tinyint NOT NULL DEFAULT '0' COMMENT '是否标记',
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '主观答案',
  `sort` int NOT NULL DEFAULT '0' COMMENT '问题排序',
  `score` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单题分分值',
  `actual_score` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际得分(主观题)',
  `is_right` tinyint NOT NULL DEFAULT '0' COMMENT '是否答对',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `paper_id` (`paper_id`) USING BTREE,
  KEY `qu_id` (`qu_id`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='试卷考题';

/*Data for the table `el_paper_qu` */

/*Table structure for table `el_paper_qu_answer` */

DROP TABLE IF EXISTS `el_paper_qu_answer`;

CREATE TABLE `el_paper_qu_answer` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `paper_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '试卷ID',
  `answer_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '回答项ID',
  `qu_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '题目ID',
  `is_right` tinyint NOT NULL DEFAULT '0' COMMENT '是否正确项',
  `answer` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '填空题',
  `checked` tinyint NOT NULL DEFAULT '0' COMMENT '是否选中',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `abc` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '选项标签',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `paper_id` (`paper_id`) USING BTREE,
  KEY `qu_id` (`qu_id`) USING BTREE,
  KEY `paper_qu_id` (`paper_id`,`qu_id`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='试卷考题备选答案';

/*Data for the table `el_paper_qu_answer` */

/*Table structure for table `el_repo` */

DROP TABLE IF EXISTS `el_repo`;

CREATE TABLE `el_repo` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '题库名称',
  `cat_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '分类ID',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '题库备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='题库';

/*Data for the table `el_repo` */

insert  into `el_repo`(`id`,`title`,`cat_id`,`remark`,`create_time`,`update_time`,`create_by`,`update_by`) values 
('1910524655864012801','测试题库','1910524409985523713',NULL,'2025-04-11 10:45:48','2025-04-11 10:45:48',NULL,NULL),
('1910526864483852290','测试题库2','1910524529837760513',NULL,'2025-04-11 10:54:35','2025-04-11 10:54:35','1000000000000000001','1000000000000000001');

/*Table structure for table `el_repo_qu` */

DROP TABLE IF EXISTS `el_repo_qu`;

CREATE TABLE `el_repo_qu` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `repo_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属题库',
  `chapter_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属章节',
  `qu_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '题目类型',
  `difficulty_level` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '难度等级',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '题目内容',
  `analysis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '整题解析',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `qu_type` (`qu_type`) USING BTREE,
  KEY `repo_id` (`repo_id`) USING BTREE,
  KEY `chapter_id` (`chapter_id`) USING BTREE,
  KEY `level` (`difficulty_level`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='问题题目';

/*Data for the table `el_repo_qu` */

insert  into `el_repo_qu`(`id`,`repo_id`,`chapter_id`,`qu_type`,`difficulty_level`,`content`,`analysis`,`create_time`,`update_time`,`create_by`,`update_by`) values 
('1911685389859876866','1910524655864012801',NULL,'radio','easy','<p>中国最北边的城市是哪个？</p>','<p style=\"text-align: start;\">中国最北边的城市是<strong>漠河市</strong>，位于黑龙江省大兴安岭地区。</p><h3 style=\"text-align: start; line-height: 1.5;\">关键信息：</h3><ul><li style=\"text-align: start;\">地理位置：漠河市地处北纬52°10′至53°33′，是中国纬度最高的城市，素有“神州北极”之称。</li><li style=\"text-align: start;\">边界：北隔黑龙江与俄罗斯相望，是中国与俄罗斯边境的重要节点。</li><li style=\"text-align: start;\">极寒气候：冬季极端最低气温可达-50℃以下，是中国最冷的地方之一。</li><li style=\"text-align: start;\">旅游特色：以北极村（中国最北的村庄）、极光观测（罕见但偶有出现）和冰雪景观闻名。</li></ul><h3 style=\"text-align: start; line-height: 1.5;\">补充说明：</h3><p style=\"text-align: start;\">漠河市原名漠河县，2018年撤县设市。其下辖的<strong>北极村</strong>是中国境内唯一可观赏到北极光现象的地区（概率较低），因此成为热门旅游目的地。</p>','2025-04-14 15:38:09','2025-04-14 15:38:09','1000000000000000001','1000000000000000001'),
('1912339000495435778','1910524655864012801',NULL,'radio','easy','<p>小客车在雾天行驶时，应当开启什么灯？</p>','<p>雾天能见度低时需开启雾灯和危险报警闪光灯以提高车辆辨识度。</p>','2025-04-16 10:55:22','2025-04-16 10:55:22','1000000000000000001','1000000000000000001');

/*Table structure for table `el_repo_qu_answer` */

DROP TABLE IF EXISTS `el_repo_qu_answer`;

CREATE TABLE `el_repo_qu_answer` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `qu_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '问题ID',
  `is_right` tinyint NOT NULL DEFAULT '0' COMMENT '是否正确',
  `content` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '答案内容',
  `image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图片地址',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ABCD标签',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `qu_id` (`qu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='候选答案';

/*Data for the table `el_repo_qu_answer` */

insert  into `el_repo_qu_answer`(`id`,`qu_id`,`is_right`,`content`,`image`,`tag`) values 
('1911611345437388801','1911611345353502722',0,'111',NULL,'A'),
('1911611345437388802','1911611345353502722',0,'333',NULL,'B'),
('1911611345437388803','1911611345353502722',0,'444',NULL,'C'),
('1911683311842291713','1911683311779377154',0,'111',NULL,'A'),
('1911683311842291714','1911683311779377154',1,'222',NULL,'B'),
('1911683311842291715','1911683311779377154',0,'333',NULL,'C'),
('1911685389926985729','1911685389859876866',1,'漠河',NULL,'A'),
('1911685389926985730','1911685389859876866',0,'新疆',NULL,'B'),
('1911685389926985731','1911685389859876866',0,'四川',NULL,'C'),
('1911685389926985732','1911685389859876866',0,'江西',NULL,'D'),
('1912339000633847809','1912339000495435778',0,'近光灯',NULL,'A'),
('1912339000638042114','1912339000495435778',0,'远光灯',NULL,'B'),
('1912339000638042115','1912339000495435778',0,'危险报警闪光灯',NULL,'C'),
('1912339000638042116','1912339000495435778',1,'雾灯和危险报警闪光灯',NULL,'D');

/*Table structure for table `el_sys_depart` */

DROP TABLE IF EXISTS `el_sys_depart`;

CREATE TABLE `el_sys_depart` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `dept_type` int NOT NULL DEFAULT '1' COMMENT '1公司2部门',
  `parent_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '所属上级',
  `dept_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '部门名称',
  `dept_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '部门编码',
  `dept_level` int NOT NULL DEFAULT '0' COMMENT '部门层级',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `dept_code` (`dept_code`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='部门信息';

/*Data for the table `el_sys_depart` */

insert  into `el_sys_depart`(`id`,`dept_type`,`parent_id`,`dept_name`,`dept_code`,`dept_level`,`sort`,`create_time`,`update_time`,`create_by`,`update_by`) values 
('1441328268501381121',1,'0','云帆互联','A01',0,2,'2021-09-24 17:06:52','2021-09-24 17:06:52','',''),
('1447829893265002498',1,'1441328268501381121','技术部','A01A01',0,2,'2021-10-12 15:42:01','2021-10-12 15:42:00','10001',''),
('1447829920330846210',1,'1441328268501381121','财务部','A01A02',0,1,'2021-10-12 15:42:07','2021-10-12 15:42:07','10001',''),
('1447829960050905090',1,'1441328268501381121','商务部','A01A03',0,3,'2021-10-12 15:42:17','2021-10-12 15:42:16','10001',''),
('1557278968304906242',1,'0','某公司2','A03',0,3,'2022-08-10 16:13:33','2022-08-10 16:13:33','',''),
('1557282632381771777',1,'1557278968304906242','某部门1','A03A01',0,1,'2022-08-10 16:28:07','2022-08-10 16:28:07','',''),
('1557282652489265153',1,'1557278968304906242','某部门2','A03A02',0,2,'2022-08-10 16:28:11','2022-08-10 16:28:11','','');

/*Table structure for table `el_sys_dic` */

DROP TABLE IF EXISTS `el_sys_dic`;

CREATE TABLE `el_sys_dic` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典编码',
  `type` int DEFAULT NULL COMMENT '1分类字典,2数据字典',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='分类字典';

/*Data for the table `el_sys_dic` */

insert  into `el_sys_dic`(`id`,`code`,`type`,`title`,`remark`,`create_time`,`update_time`,`create_by`,`update_by`) values 
('1399935914490269698','data_scope',1,'数据权限','角色数据权限范围','2021-06-02 11:48:26','2021-06-02 11:48:26','',''),
('1492388856845103105','state',1,'通用状态','系统全局通用状态','2022-02-12 14:43:25','2022-02-12 14:43:25','',''),
('1546399651832299522','user_state',1,'用户状态','用户状态','2022-07-11 15:43:02','2022-07-11 15:43:02','',''),
('1552482298987851778','menu_type',1,'菜单类型','目录/菜单/功能','2022-07-28 10:33:18','2022-07-28 10:33:18','',''),
('1552554336742055937','dic_type',1,'字典类型','数据字典类型枚举','2022-07-28 15:19:33','2022-07-28 15:19:33','',''),
('1698896002028761089','plugin_group',1,'插件类型','插件分组类型','2023-09-05 11:09:05','2023-09-05 11:09:05','',''),
('1910524211750133761','repo_catalog',2,'题库分类','题库分类','2025-04-11 10:44:02','2025-04-11 10:44:02','',''),
('1910602708967395330','qu_type',1,'试题题型','试题题型','2025-04-11 15:55:57','2025-04-11 15:55:57','',''),
('1910603515049709569','qu_difficulty_level',1,'试题难度','试题难度','2025-04-11 15:59:09','2025-04-11 15:59:09','','');

/*Table structure for table `el_sys_dic_value` */

DROP TABLE IF EXISTS `el_sys_dic_value`;

CREATE TABLE `el_sys_dic_value` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID/字典编码',
  `dic_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '归属字典',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子项编码',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分类名称',
  `parent_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '上级ID',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='分类字典值';

/*Data for the table `el_sys_dic_value` */

insert  into `el_sys_dic_value`(`id`,`dic_code`,`value`,`title`,`parent_id`,`remark`,`create_time`,`update_time`,`create_by`,`update_by`) values 
('1356065526639505409','exam_open_type','1','完全公开','0',NULL,'2021-02-01 10:23:10','2021-02-01 10:23:10','',''),
('1399936107176595458','data_scope','1','仅本人数据','0','仅本人数据','2021-06-02 11:49:12','2021-06-02 11:49:12','',''),
('1399936146162651137','data_scope','2','本部门数据','0','本部门数据','2021-06-02 11:49:21','2021-06-02 11:49:21','',''),
('1399936188902608897','data_scope','3','本部门及以下','0','本部门及以下','2021-06-02 11:49:31','2021-06-02 11:49:31','',''),
('1399936230719819777','data_scope','4','全部数据','0','全部数据','2021-06-02 11:49:41','2021-06-02 11:49:41','',''),
('1492388894015025153','state','0','正常','0',NULL,'2022-02-12 14:43:34','2022-02-12 14:43:34','',''),
('1492388933202407426','state','1','禁用','0',NULL,'2022-02-12 14:43:43','2022-02-12 14:43:43','',''),
('1546399693989249025','user_state','0','正常','0',NULL,'2022-07-11 15:43:12','2022-07-11 15:43:12','',''),
('1546399745172340738','user_state','1','已禁用','0',NULL,'2022-07-11 15:43:24','2022-07-11 15:43:24','',''),
('1546399778231844866','user_state','2','待审核','0',NULL,'2022-07-11 15:43:32','2022-07-11 15:43:32','',''),
('1552483045594935298','menu_type','1','目录','0',NULL,'2022-07-28 10:36:16','2022-07-28 10:36:16','',''),
('1552483057787777025','menu_type','2','菜单','0',NULL,'2022-07-28 10:36:19','2022-07-28 10:36:19','',''),
('1552483066511929345','menu_type','3','功能','0',NULL,'2022-07-28 10:36:21','2022-07-28 10:36:21','',''),
('1552554710609731586','dic_type','1','数据字典','0',NULL,'2022-07-28 15:21:02','2022-07-28 15:21:02','',''),
('1552554758366076929','dic_type','2','分类字典','0',NULL,'2022-07-28 15:21:14','2022-07-28 15:21:14','',''),
('1698896091577151490','plugin_group','upload','文件上传','0',NULL,'2023-09-05 11:09:26','2023-09-05 11:09:26','',''),
('1910524409985523713','repo_catalog','1910524409985523713','企业文化','0',NULL,'2025-04-11 10:44:49','2025-04-11 10:44:49','',''),
('1910524529837760513','repo_catalog','1910524529837760513','岗位晋升','0',NULL,'2025-04-11 10:45:18','2025-04-11 10:45:18','',''),
('1910524561106296834','repo_catalog','1910524561106296834','职业技能','0',NULL,'2025-04-11 10:45:25','2025-04-11 10:45:25','',''),
('1910602921656356865','qu_type','radio','单选题','0',NULL,'2025-04-11 15:56:48','2025-04-11 15:56:48','',''),
('1910602957609930754','qu_type','multi','多选题','0',NULL,'2025-04-11 15:56:57','2025-04-11 15:56:57','',''),
('1910603005953478658','qu_type','judge','判断题','0',NULL,'2025-04-11 15:57:08','2025-04-11 15:57:08','',''),
('1910603102577659905','qu_type','multi2','不定项选择题','0',NULL,'2025-04-11 15:57:31','2025-04-11 15:57:31','',''),
('1910603594192031746','qu_difficulty_level','easy','简单','0',NULL,'2025-04-11 15:59:28','2025-04-11 15:59:28','',''),
('1910603630212714498','qu_difficulty_level','normal','一般','0',NULL,'2025-04-11 15:59:37','2025-04-11 15:59:37','',''),
('1910604188910784514','qu_difficulty_level','hard','较难','0',NULL,'2025-04-11 16:01:50','2025-04-11 16:01:50','',''),
('1910604353570770946','qu_difficulty_level','extreme','极难','0',NULL,'2025-04-11 16:02:29','2025-04-11 16:02:29','','');

/*Table structure for table `el_sys_menu` */

DROP TABLE IF EXISTS `el_sys_menu`;

CREATE TABLE `el_sys_menu` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `parent_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '上级菜单',
  `menu_type` int NOT NULL DEFAULT '1' COMMENT '1菜单2功能',
  `permission_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '访问路径',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '视图或Layout',
  `redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '跳转地址',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由标题',
  `meta_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由标题',
  `meta_active_menu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '高亮菜单',
  `meta_no_cache` tinyint DEFAULT NULL COMMENT '是否缓存',
  `hidden` tinyint DEFAULT NULL COMMENT '是否隐藏',
  `sort` int DEFAULT NULL COMMENT '越小越前',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `permission_tag` (`permission_tag`) USING BTREE,
  UNIQUE KEY `path` (`path`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `menu_type` (`menu_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统菜单';

/*Data for the table `el_sys_menu` */

insert  into `el_sys_menu`(`id`,`parent_id`,`menu_type`,`permission_tag`,`path`,`component`,`redirect`,`name`,`meta_title`,`meta_icon`,`meta_active_menu`,`meta_no_cache`,`hidden`,`sort`,`create_time`,`update_time`,`create_by`,`update_by`) values 
('1367010529435996174','0',1,NULL,'/admin/sys','#','/admin/sys/menu','Sys','系统设置','carbon:settings',NULL,1,0,17,'2021-03-07 11:08:18','2022-01-06 18:10:33','','10001'),
('1367010529435996176','1367010529435996174',2,NULL,'/admin/sys/menu','views/System/Menu/Menu',NULL,'SysMenu','菜单管理','',NULL,1,0,2,'2021-03-07 11:08:18','2021-05-31 10:14:26','','10001'),
('1367010529435996178','1367010529435996174',2,NULL,'/admin/sys/role','views/System/Role/Role',NULL,'SysRole','角色管理','',NULL,1,0,3,'2021-03-07 11:08:18','2022-01-06 18:10:17','','10001'),
('1367010529435996179','1367010529435996174',2,NULL,'/admin/sys/dict','views/System/DataDict/DataDict',NULL,'SysDataDict','数据字典','',NULL,1,0,3,'2021-03-07 11:08:18','2022-01-06 18:10:17','','10001'),
('1399266644605394945','1367010529435996176',3,'sys:menu:add',NULL,NULL,NULL,NULL,'添加',NULL,NULL,1,1,1,'2021-05-31 15:29:00','2021-05-31 15:28:59','10001',''),
('1399266713060630529','1367010529435996176',3,'sys:menu:update',NULL,NULL,NULL,NULL,'修改',NULL,NULL,1,1,2,'2021-05-31 15:29:16','2021-05-31 15:29:16','10001',''),
('1399266787438223361','1367010529435996176',3,'sys:menu:delete',NULL,NULL,NULL,NULL,'删除',NULL,NULL,1,1,3,'2021-05-31 15:29:34','2021-05-31 15:29:33','10001',''),
('1399266868300210177','1367010529435996176',3,'sys:menu:sort',NULL,NULL,NULL,NULL,'排序',NULL,NULL,1,1,4,'2021-05-31 15:29:53','2021-05-31 15:29:53','10001',''),
('1552509704679235586','1367010529435996178',3,'sys:role:paging',NULL,NULL,NULL,'','查看','',NULL,NULL,1,1,'2022-07-28 12:22:12','2022-07-28 12:22:12','',''),
('1552510807093321730','1367010529435996178',3,'sys:role:add',NULL,NULL,NULL,NULL,'添加',NULL,NULL,NULL,1,2,'2022-07-28 12:26:35','2022-07-28 12:26:35','',''),
('1552510872314748929','1367010529435996178',3,'sys:role:edit',NULL,NULL,NULL,NULL,'修改',NULL,NULL,NULL,1,3,'2022-07-28 12:26:50','2022-07-28 12:26:50','',''),
('1552510963301785601','1367010529435996178',3,'sys:role:delete',NULL,NULL,NULL,NULL,'删除',NULL,NULL,NULL,1,4,'2022-07-28 12:27:12','2022-07-28 12:27:12','',''),
('1552547259067965442','0',1,NULL,'/admin/org','#',NULL,NULL,'组织架构','carbon:category',NULL,NULL,0,16,'2022-07-28 14:51:26','2022-07-28 14:51:26','',''),
('1552549085188235265','1367010529435996176',3,'sys:menu:paging',NULL,NULL,NULL,NULL,'查看',NULL,NULL,NULL,1,5,'2022-07-28 14:58:41','2022-07-28 14:58:41','',''),
('1552615713615716353','1367010529435996179',3,'sys:dict:add',NULL,NULL,NULL,NULL,'添加',NULL,NULL,NULL,NULL,1,'2022-07-28 19:23:26','2022-07-28 19:23:26','',''),
('1552615821107339266','1367010529435996179',3,'sys:dict:edit',NULL,NULL,NULL,NULL,'修改',NULL,NULL,NULL,NULL,2,'2022-07-28 19:23:52','2022-07-28 19:23:52','',''),
('1552615880121196546','1367010529435996179',3,'sys:dict:delete',NULL,NULL,NULL,NULL,'删除',NULL,NULL,NULL,NULL,3,'2022-07-28 19:24:06','2022-07-28 19:24:06','',''),
('1552616085025529857','1367010529435996179',3,'sys:dict:paging',NULL,NULL,NULL,NULL,'查看',NULL,NULL,NULL,NULL,4,'2022-07-28 19:24:55','2022-07-28 19:24:55','',''),
('1552842968174489602','1552547259067965442',2,NULL,'/admin/org/depart','views/System/Depart/Depart',NULL,'OrgDepart','部门管理',NULL,NULL,NULL,NULL,1,'2022-07-29 10:26:28','2022-07-29 10:26:28','',''),
('1553180631951761409','1367010529435996178',3,'sys:role:grant',NULL,NULL,NULL,NULL,'角色授权',NULL,NULL,NULL,NULL,5,'2022-07-30 08:48:14','2022-07-30 08:48:14','',''),
('1556906844813914114','1552547259067965442',2,NULL,'/admin/org/user','views/System/User/User',NULL,'OrgUser','人员管理',NULL,NULL,NULL,NULL,2,'2022-08-09 15:34:52','2022-08-09 15:34:52','',''),
('1556907609842380801','1556906844813914114',3,'sys:user:edit',NULL,NULL,NULL,NULL,'修改',NULL,NULL,NULL,1,3,'2022-08-09 15:37:54','2022-08-09 15:37:54','',''),
('1556907683607605249','1556906844813914114',3,'sys:user:add',NULL,NULL,NULL,NULL,'添加',NULL,NULL,NULL,1,2,'2022-08-09 15:38:12','2022-08-09 15:38:12','',''),
('1556907994690744321','1556906844813914114',3,'sys:user:paging',NULL,NULL,NULL,NULL,'查看',NULL,NULL,NULL,1,1,'2022-08-09 15:39:26','2022-08-09 15:39:26','',''),
('1556908088521519105','1556906844813914114',3,'sys:user:delete',NULL,NULL,NULL,NULL,'删除',NULL,NULL,NULL,1,4,'2022-08-09 15:39:48','2022-08-09 15:39:48','',''),
('1556911576896446466','1556906844813914114',3,'sys:user:state',NULL,NULL,NULL,NULL,'启用/禁用',NULL,NULL,NULL,1,5,'2022-08-09 15:53:40','2022-08-09 15:53:40','',''),
('1557199944846876674','1552842968174489602',3,'sys:depart:view',NULL,NULL,NULL,NULL,'查看',NULL,NULL,NULL,1,3,'2022-08-10 10:59:32','2022-08-10 10:59:32','',''),
('1557199992607416322','1552842968174489602',3,'sys:depart:add',NULL,NULL,NULL,NULL,'添加',NULL,NULL,NULL,1,1,'2022-08-10 10:59:44','2022-08-10 10:59:44','',''),
('1557200059632394242','1552842968174489602',3,'sys:depart:edit',NULL,NULL,NULL,NULL,'修改',NULL,NULL,NULL,1,4,'2022-08-10 11:00:00','2022-08-10 11:00:00','',''),
('1557200122416930817','1552842968174489602',3,'sys:depart:delete',NULL,NULL,NULL,NULL,'删除',NULL,NULL,NULL,1,2,'2022-08-10 11:00:15','2022-08-10 11:00:15','',''),
('1564510476430225410','1367010529435996174',2,NULL,'/admin/sys/config','views/System/Config/Config',NULL,'SysConfig','个性配置',NULL,NULL,NULL,NULL,4,'2022-08-30 15:08:59','2022-08-30 15:08:59','',''),
('1566612797037527042','1367010529435996174',2,NULL,'/admin/sys/plugin','views/System/Plugin/Plugin',NULL,'Plugin','插件管理',NULL,NULL,NULL,NULL,5,'2022-09-05 10:22:51','2022-09-05 10:22:51','',''),
('1700043149512056834','0',1,NULL,'/','#','/admin/dashboard',NULL,'管理首页','ant-design:dashboard-outlined',NULL,NULL,NULL,12,'2023-09-08 15:07:27','2023-09-08 15:11:37','1000000000000000001','1000000000000000001'),
('1700044482038243330','1700043149512056834',2,NULL,'/admin/dashboard','views/Dashboard/Dashboard',NULL,'Dashboard','工作台','',NULL,NULL,NULL,1,'2023-09-08 15:12:44','2023-09-08 15:12:52','1000000000000000001','1000000000000000001'),
('1910230973105442817','0',1,NULL,'/admin/repo','#',NULL,NULL,'题库管理','ant-design:product-outlined',NULL,NULL,NULL,14,'2025-04-10 15:18:49','2025-04-10 15:18:49','',''),
('1910231460139634690','1910230973105442817',2,NULL,'/admin/repo/repo','views/Exam/Repo/Repo',NULL,'Repo','题库管理',NULL,NULL,NULL,0,1,'2025-04-10 15:20:45','2025-04-10 15:20:45','',''),
('1910540102659358722','1910230973105442817',2,NULL,'/admin/repo/qu','views/Exam/Repo/Qu',NULL,'Qu','试题管理',NULL,NULL,NULL,NULL,2,'2025-04-11 11:47:11','2025-04-11 11:47:11','',''),
('1910584408183029762','1910231460139634690',3,'repo:repo:add',NULL,NULL,NULL,NULL,'添加',NULL,NULL,NULL,1,1,'2025-04-11 14:43:14','2025-04-11 14:43:14','',''),
('1910584475480637442','1910231460139634690',3,'repo:repo:delete',NULL,NULL,NULL,NULL,'删除',NULL,NULL,NULL,1,2,'2025-04-11 14:43:30','2025-04-11 14:43:30','',''),
('1910584582947094529','1910231460139634690',3,'repo:repo:edit',NULL,NULL,NULL,NULL,'修改',NULL,NULL,NULL,1,3,'2025-04-11 14:43:56','2025-04-11 14:43:56','',''),
('1910585687147954177','1910231460139634690',3,'repo:repo:view',NULL,NULL,NULL,NULL,'查看',NULL,NULL,NULL,1,4,'2025-04-11 14:48:19','2025-04-11 14:48:19','',''),
('1910640225917784066','1910540102659358722',3,'repo:qu:add',NULL,NULL,NULL,NULL,'添加',NULL,NULL,NULL,1,1,'2025-04-11 18:25:02','2025-04-11 18:25:02','',''),
('1910640675547172865','1910540102659358722',3,'repo:qu:delete',NULL,NULL,NULL,NULL,'删除',NULL,NULL,NULL,1,2,'2025-04-11 18:26:49','2025-04-11 18:26:49','',''),
('1910640779146481666','1910540102659358722',3,'repo:qu:edit',NULL,NULL,NULL,NULL,'修改',NULL,NULL,NULL,1,3,'2025-04-11 18:27:14','2025-04-11 18:27:14','',''),
('1910640845336793090','1910540102659358722',3,'repo:qu:view',NULL,NULL,NULL,NULL,'查看',NULL,NULL,NULL,1,4,'2025-04-11 18:27:30','2025-04-11 18:27:30','',''),
('1911703533823365121','0',1,NULL,'/admin/admin','#',NULL,NULL,'考试管理','ant-design:file-text-outlined',NULL,NULL,NULL,15,'2025-04-14 16:50:14','2025-04-14 16:50:14','',''),
('1911705220688547841','1911703533823365121',2,NULL,'/admin/exam/exam','views/Exam/Exam/Exam',NULL,'Exam','考试管理',NULL,NULL,NULL,NULL,1,'2025-04-14 16:56:57','2025-04-14 16:56:57','',''),
('1911956917277069314','1911705220688547841',3,'exam:exam:add','/admin/exam/add','views/Exam/Exam/Form',NULL,'ExamAdd','添加',NULL,NULL,NULL,1,1,'2025-04-15 09:37:06','2025-04-15 09:37:06','',''),
('1911956988110475266','1911705220688547841',3,'exam:exam:delete',NULL,NULL,NULL,NULL,'删除',NULL,NULL,NULL,1,2,'2025-04-15 09:37:23','2025-04-15 09:37:23','',''),
('1911957176237592577','1911705220688547841',3,'exam:exam:edit','/admin/exam/edit','views/Exam/Exam/Form',NULL,'ExamEdit','修改',NULL,NULL,NULL,1,3,'2025-04-15 09:38:07','2025-04-15 09:38:07','',''),
('1911957247897276417','1911705220688547841',3,'exam:exam:view',NULL,NULL,NULL,NULL,'查看',NULL,NULL,NULL,1,4,'2025-04-15 09:38:25','2025-04-15 09:38:25','',''),
('1912388980346134529','0',1,NULL,'/client/exam',NULL,NULL,NULL,'考试中心','ant-design:credit-card-outlined',NULL,NULL,NULL,13,'2025-04-16 14:13:58','2025-04-16 14:13:58','',''),
('1912389902866522113','1912388980346134529',2,NULL,'/client/exam/exam','views/Exam/Exam/Client/Exam',NULL,'ClientExamExam','在线考试',NULL,NULL,NULL,NULL,1,'2025-04-16 14:17:37','2025-04-16 14:17:37','','');

/*Table structure for table `el_sys_role` */

DROP TABLE IF EXISTS `el_sys_role`;

CREATE TABLE `el_sys_role` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `data_scope` int NOT NULL COMMENT '数据权限',
  `role_level` int NOT NULL COMMENT '越大越高',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色';

/*Data for the table `el_sys_role` */

insert  into `el_sys_role`(`id`,`role_name`,`data_scope`,`role_level`,`remark`,`create_time`,`create_by`,`update_time`,`update_by`) values 
('admin','超级管理员',4,999,'','2020-12-03 16:52:16','','2022-06-15 15:47:31','10001'),
('user','注册用户',1,1,'注册用户','2022-07-29 12:24:34','','2022-07-29 12:24:34','10001');

/*Table structure for table `el_sys_role_menu` */

DROP TABLE IF EXISTS `el_sys_role_menu`;

CREATE TABLE `el_sys_role_menu` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  `menu_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `data_flag` int NOT NULL DEFAULT '0' COMMENT '数据标识',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `menu_id` (`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色菜单授权';

/*Data for the table `el_sys_role_menu` */

insert  into `el_sys_role_menu`(`id`,`role_id`,`menu_id`,`create_time`,`update_time`,`create_by`,`update_by`,`data_flag`) values 
('1553195055651512321','1552872688874184706','1367010529435996174','2022-07-30 09:45:32','2022-07-30 09:45:32','','',0),
('1553195055655706626','1552872688874184706','1367010529435996176','2022-07-30 09:45:32','2022-07-30 09:45:32','','',0),
('1553195055655706627','1552872688874184706','1399266644605394945','2022-07-30 09:45:32','2022-07-30 09:45:32','','',0),
('1553195055655706628','1552872688874184706','1399266713060630529','2022-07-30 09:45:32','2022-07-30 09:45:32','','',0),
('1553195055659900930','1552872688874184706','1399266787438223361','2022-07-30 09:45:32','2022-07-30 09:45:32','','',0),
('1553195055659900931','1552872688874184706','1399266868300210177','2022-07-30 09:45:32','2022-07-30 09:45:32','','',0),
('1553195055659900932','1552872688874184706','1552549085188235265','2022-07-30 09:45:32','2022-07-30 09:45:32','','',0),
('1553195055664095234','1552872688874184706','1367010529435996178','2022-07-30 09:45:32','2022-07-30 09:45:32','','',0),
('1553195055664095235','1552872688874184706','1552509704679235586','2022-07-30 09:45:32','2022-07-30 09:45:32','','',0),
('1553195055664095236','1552872688874184706','1552510807093321730','2022-07-30 09:45:32','2022-07-30 09:45:32','','',0),
('1553195055664095237','1552872688874184706','1552510872314748929','2022-07-30 09:45:32','2022-07-30 09:45:32','','',0),
('1553195055664095238','1552872688874184706','1552510963301785601','2022-07-30 09:45:32','2022-07-30 09:45:32','','',0),
('1553195055668289538','1552872688874184706','1553180631951761409','2022-07-30 09:45:32','2022-07-30 09:45:32','','',0),
('1553195055668289539','1552872688874184706','1367010529435996179','2022-07-30 09:45:32','2022-07-30 09:45:32','','',0),
('1553195055668289540','1552872688874184706','1552615713615716353','2022-07-30 09:45:32','2022-07-30 09:45:32','','',0),
('1553195055672483841','1552872688874184706','1552615821107339266','2022-07-30 09:45:32','2022-07-30 09:45:32','','',0),
('1553195055672483842','1552872688874184706','1552615880121196546','2022-07-30 09:45:32','2022-07-30 09:45:32','','',0),
('1553195055672483843','1552872688874184706','1552616085025529857','2022-07-30 09:45:32','2022-07-30 09:45:32','','',0),
('1553196317679837185','admin','1367010529435996174','2022-07-30 09:50:33','2022-07-30 09:50:33','','',0),
('1553196317679837186','admin','1367010529435996176','2022-07-30 09:50:33','2022-07-30 09:50:33','','',0),
('1553196317684031489','admin','1399266644605394945','2022-07-30 09:50:33','2022-07-30 09:50:33','','',0),
('1553196317684031490','admin','1399266713060630529','2022-07-30 09:50:33','2022-07-30 09:50:33','','',0),
('1553196317684031491','admin','1399266787438223361','2022-07-30 09:50:33','2022-07-30 09:50:33','','',0),
('1553196317684031492','admin','1399266868300210177','2022-07-30 09:50:33','2022-07-30 09:50:33','','',0),
('1553196317688225794','admin','1552549085188235265','2022-07-30 09:50:33','2022-07-30 09:50:33','','',0),
('1553196317688225795','admin','1367010529435996178','2022-07-30 09:50:33','2022-07-30 09:50:33','','',0),
('1553196317688225796','admin','1552509704679235586','2022-07-30 09:50:33','2022-07-30 09:50:33','','',0),
('1553196317688225797','admin','1552510807093321730','2022-07-30 09:50:33','2022-07-30 09:50:33','','',0),
('1553196317692420098','admin','1552510872314748929','2022-07-30 09:50:33','2022-07-30 09:50:33','','',0),
('1553196317692420099','admin','1552510963301785601','2022-07-30 09:50:33','2022-07-30 09:50:33','','',0),
('1553196317692420100','admin','1553180631951761409','2022-07-30 09:50:33','2022-07-30 09:50:33','','',0),
('1553196317692420101','admin','1367010529435996179','2022-07-30 09:50:33','2022-07-30 09:50:33','','',0),
('1553196317692420102','admin','1552615713615716353','2022-07-30 09:50:33','2022-07-30 09:50:33','','',0),
('1553196317696614402','admin','1552615821107339266','2022-07-30 09:50:33','2022-07-30 09:50:33','','',0),
('1553196317696614403','admin','1552615880121196546','2022-07-30 09:50:33','2022-07-30 09:50:33','','',0),
('1553196317696614404','admin','1552616085025529857','2022-07-30 09:50:33','2022-07-30 09:50:33','','',0),
('1553196317696614405','admin','1552547259067965442','2022-07-30 09:50:33','2022-07-30 09:50:33','','',0),
('1553196317696614406','admin','1552842968174489602','2022-07-30 09:50:33','2022-07-30 09:50:33','','',0),
('1555025091098619905','admin','1555025091056676866','2022-08-04 10:57:27','2022-08-04 10:57:27','','',0),
('1556902577088622593','admin','1556902577034096641','2022-08-09 15:17:54','2022-08-09 15:17:54','','',0),
('1556904863445676033','admin','1556904863424704514','2022-08-09 15:26:59','2022-08-09 15:26:59','','',0),
('1556906844826497025','admin','1556906844813914114','2022-08-09 15:34:52','2022-08-09 15:34:52','','',0),
('1556907609884323842','admin','1556907609842380801','2022-08-09 15:37:54','2022-08-09 15:37:54','','',0),
('1556907683632771073','admin','1556907683607605249','2022-08-09 15:38:12','2022-08-09 15:38:12','','',0),
('1556907994728493058','admin','1556907994690744321','2022-08-09 15:39:26','2022-08-09 15:39:26','','',0),
('1556908088546684930','admin','1556908088521519105','2022-08-09 15:39:48','2022-08-09 15:39:48','','',0),
('1556911576934195201','admin','1556911576896446466','2022-08-09 15:53:40','2022-08-09 15:53:40','','',0),
('1557199944872042498','admin','1557199944846876674','2022-08-10 10:59:32','2022-08-10 10:59:32','','',0),
('1557199992640970753','admin','1557199992607416322','2022-08-10 10:59:44','2022-08-10 10:59:44','','',0),
('1557200059661754370','admin','1557200059632394242','2022-08-10 11:00:00','2022-08-10 11:00:00','','',0),
('1557200122437902337','admin','1557200122416930817','2022-08-10 11:00:15','2022-08-10 11:00:15','','',0),
('1564510476497334274','admin','1564510476430225410','2022-08-30 15:08:59','2022-08-30 15:08:59','','',0),
('1566612797104635906','admin','1566612797037527042','2022-09-05 10:22:51','2022-09-05 10:22:51','','',0),
('1700043149553999873','admin','1700043149512056834','2023-09-08 15:07:26','2023-09-08 15:07:26','','',0),
('1700044482067603457','admin','1700044482038243330','2023-09-08 15:12:44','2023-09-08 15:12:44','','',0),
('1700052878330273793','user','1700043149512056834','2023-09-08 15:46:06','2023-09-08 15:46:06','','',0),
('1700052878330273794','user','1700044482038243330','2023-09-08 15:46:06','2023-09-08 15:46:06','','',0),
('1910230973126414338','admin','1910230973105442817','2025-04-10 15:18:49','2025-04-10 15:18:49','','',0),
('1910231460148023298','admin','1910231460139634690','2025-04-10 15:20:45','2025-04-10 15:20:45','','',0),
('1910540102688718850','admin','1910540102659358722','2025-04-11 11:47:11','2025-04-11 11:47:11','','',0),
('1910584408204001281','admin','1910584408183029762','2025-04-11 14:43:14','2025-04-11 14:43:14','','',0),
('1910584475489026050','admin','1910584475480637442','2025-04-11 14:43:30','2025-04-11 14:43:30','','',0),
('1910584582959677441','admin','1910584582947094529','2025-04-11 14:43:56','2025-04-11 14:43:56','','',0),
('1910585687219257346','admin','1910585687147954177','2025-04-11 14:48:19','2025-04-11 14:48:19','','',0),
('1910640225930366978','admin','1910640225917784066','2025-04-11 18:25:02','2025-04-11 18:25:02','','',0),
('1910640675614281729','admin','1910640675547172865','2025-04-11 18:26:49','2025-04-11 18:26:49','','',0),
('1910640779213590530','admin','1910640779146481666','2025-04-11 18:27:14','2025-04-11 18:27:14','','',0),
('1910640845336793091','admin','1910640845336793090','2025-04-11 18:27:30','2025-04-11 18:27:30','','',0),
('1911703533848530946','admin','1911703533823365121','2025-04-14 16:50:14','2025-04-14 16:50:14','','',0),
('1911705220696936449','admin','1911705220688547841','2025-04-14 16:56:57','2025-04-14 16:56:57','','',0),
('1911956917390315522','admin','1911956917277069314','2025-04-15 09:37:06','2025-04-15 09:37:06','','',0),
('1911956988110475267','admin','1911956988110475266','2025-04-15 09:37:23','2025-04-15 09:37:23','','',0),
('1911957176237592578','admin','1911957176237592577','2025-04-15 09:38:07','2025-04-15 09:38:07','','',0),
('1911957247897276418','admin','1911957247897276417','2025-04-15 09:38:25','2025-04-15 09:38:25','','',0),
('1911977821767897091','admin','1911977821767897090','2025-04-15 11:00:10','2025-04-15 11:00:10','','',0),
('1911977970338533377','admin','1911977970275618817','2025-04-15 11:00:45','2025-04-15 11:00:45','','',0),
('1911978018652721154','admin','1911978018652721153','2025-04-15 11:00:57','2025-04-15 11:00:57','','',0),
('1911978069445742594','admin','1911978069445742593','2025-04-15 11:01:09','2025-04-15 11:01:09','','',0),
('1911978106036850689','admin','1911978105973936130','2025-04-15 11:01:17','2025-04-15 11:01:17','','',0),
('1912388980362911746','admin','1912388980346134529','2025-04-16 14:13:58','2025-04-16 14:13:58','','',0),
('1912389902866522114','admin','1912389902866522113','2025-04-16 14:17:38','2025-04-16 14:17:38','','',0);

/*Table structure for table `el_sys_user` */

DROP TABLE IF EXISTS `el_sys_user`;

CREATE TABLE `el_sys_user` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '真实姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `state` int NOT NULL DEFAULT '0' COMMENT '状态',
  `id_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '身份证号码',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `dept_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '部门编码',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `dept_code` (`dept_code`) USING BTREE,
  KEY `user_name` (`user_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='管理用户';

/*Data for the table `el_sys_user` */

insert  into `el_sys_user`(`id`,`user_name`,`real_name`,`avatar`,`password`,`salt`,`state`,`id_card`,`mobile`,`email`,`dept_code`,`create_time`,`create_by`,`update_time`,`update_by`) values 
('1000000000000000001','admin','超管A','https://files.yfhl.net/2023/4/25/1682414346430-6e2b5b35.jpg','39d45d8d86476537c495cee6231a151a','UgGORx',0,'360782198910105217','','','A01A01','2020-12-03 16:52:10','','2021-06-07 17:10:29','10001'),
('1557544252961996802','sasa','张三','','','',0,'360782198910105217','18682216559',NULL,'A01A03','2022-08-11 09:47:42','','2022-08-11 09:47:42',''),
('1557552992415170561','dora','郭银花','','','',0,'368782199006162228','18603038204',NULL,'A01A02','2022-08-11 10:22:26','','2022-08-11 10:22:26',''),
('1700049535004397569','zhangbaobao','张保保','','69196a000befb4b1f1f57d1e1b59af7b','Pedbda',0,'',NULL,NULL,'A01A02','2023-09-08 15:32:49','','2023-09-08 15:32:49','');

/*Table structure for table `el_sys_user_bind` */

DROP TABLE IF EXISTS `el_sys_user_bind`;

CREATE TABLE `el_sys_user_bind` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户ID',
  `login_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '登录类型',
  `open_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '三方ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='登录绑定';

/*Data for the table `el_sys_user_bind` */

insert  into `el_sys_user_bind`(`id`,`user_id`,`login_type`,`open_id`,`create_time`,`update_time`) values 
('1557552631587586049','1557544252961996802','mobile','18682216559',NULL,NULL),
('1557552992536805378','1557552992415170561','mobile','18603038204',NULL,NULL);

/*Table structure for table `el_sys_user_role` */

DROP TABLE IF EXISTS `el_sys_user_role`;

CREATE TABLE `el_sys_user_role` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户角色';

/*Data for the table `el_sys_user_role` */

insert  into `el_sys_user_role`(`id`,`user_id`,`role_id`) values 
('1','1000000000000000001','admin'),
('1557552631474339841','1557544252961996802','1552872688874184706'),
('1557552631482728450','1557544252961996802','admin'),
('1557552992465502210','1557552992415170561','1552872688874184706'),
('1557552992469696513','1557552992415170561','admin'),
('1699765812061040642','1699765811981348865','user'),
('1699959928904511490','1699959928875151362','user'),
('1699964466159972353','1699964466151583745','user'),
('1699975662460235778','1699975662443458562','user'),
('1910217631959805953','1700049535004397569','user');

/*Table structure for table `el_tmpl` */

DROP TABLE IF EXISTS `el_tmpl`;

CREATE TABLE `el_tmpl` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '试卷标题',
  `cat_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '试卷分类',
  `join_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组卷方式',
  `qu_count` int DEFAULT NULL COMMENT '题目数量',
  `total_score` decimal(10,2) DEFAULT NULL COMMENT '总分数',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `join_type` (`join_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='试卷';

/*Data for the table `el_tmpl` */

/*Table structure for table `el_tmpl_qu` */

DROP TABLE IF EXISTS `el_tmpl_qu`;

CREATE TABLE `el_tmpl_qu` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `tmpl_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '模板ID',
  `qu_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '题目ID',
  `qu_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '题目类型',
  `qu_score` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '分数',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tmpl_id` (`tmpl_id`) USING BTREE,
  KEY `qu_id` (`qu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='试卷题目';

/*Data for the table `el_tmpl_qu` */

/*Table structure for table `el_tmpl_rule` */

DROP TABLE IF EXISTS `el_tmpl_rule`;

CREATE TABLE `el_tmpl_rule` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `tmpl_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分组ID',
  `repo_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '题库ID',
  `qu_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '试题类型',
  `qu_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '难度',
  `qu_count` int DEFAULT NULL COMMENT '试题数量',
  `per_score` decimal(10,0) DEFAULT '1' COMMENT '每题分数',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `group_id` (`tmpl_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='大题组卷规则';

/*Data for the table `el_tmpl_rule` */

/*Table structure for table `pl_plugin_data` */

DROP TABLE IF EXISTS `pl_plugin_data`;

CREATE TABLE `pl_plugin_data` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '唯一识别码',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '插件名称',
  `schema_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '元数据ID',
  `group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分组ID',
  `config_data` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '配置数据',
  `service_clazz` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '后端服务类',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '前端页面',
  `in_use` tinyint NOT NULL COMMENT '是否使用',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '插件状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='插件信息';

/*Data for the table `pl_plugin_data` */

insert  into `pl_plugin_data`(`id`,`code`,`title`,`schema_id`,`group_id`,`config_data`,`service_clazz`,`component`,`in_use`,`state`) values 
('10002','upload-local','本地上传','upload_local','upload','{\"localDir\":\"/Users/van/work/yf-boot/\",\"visitUrl\":\"http://localhost:8080\"}','com.yf.plugins.upload.local.service.impl.LocalUpServiceImpl',' ',1,'0');

/*Table structure for table `pl_plugin_group` */

DROP TABLE IF EXISTS `pl_plugin_group`;

CREATE TABLE `pl_plugin_group` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分组名称',
  `single` tinyint DEFAULT NULL COMMENT '独立排斥',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='插件分组';

/*Data for the table `pl_plugin_group` */

insert  into `pl_plugin_group`(`id`,`title`,`single`) values 
('upload','上传组件',1);

/*Table structure for table `pl_plugin_schema` */

DROP TABLE IF EXISTS `pl_plugin_schema`;

CREATE TABLE `pl_plugin_schema` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `schema_data` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '元数据',
  `group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分组',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='插件元数据';

/*Data for the table `pl_plugin_schema` */

insert  into `pl_plugin_schema`(`id`,`schema_data`,`group_id`) values 
('upload_aliyun','[{\"title\":\"EndPoint\",\"name\":\"endPoint\",\"type\":\"text\"},{\"title\":\"Bucket\",\"name\":\"bucket\",\"type\":\"text\"},{\"title\":\"AccessKeyId\",\"name\":\"accessKeyId\",\"type\":\"text\"},{\"title\":\"AcccessKeySecret\",\"name\":\"acccessKeySecret\",\"type\":\"text\"},{\"title\":\"访问URL\",\"name\":\"visitUrl\",\"type\":\"text\"}]','upload'),
('upload_local','[{\"title\":\"本地目录\",\"name\":\"localDir\",\"type\":\"text\"},{\"title\":\"访问地址\",\"name\":\"visitUrl\",\"type\":\"text\"}]','upload');

/*Table structure for table `qrtz_blob_triggers` */

DROP TABLE IF EXISTS `qrtz_blob_triggers`;

CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `qrtz_blob_triggers` */

/*Table structure for table `qrtz_calendars` */

DROP TABLE IF EXISTS `qrtz_calendars`;

CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `qrtz_calendars` */

/*Table structure for table `qrtz_cron_triggers` */

DROP TABLE IF EXISTS `qrtz_cron_triggers`;

CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `qrtz_cron_triggers` */

/*Table structure for table `qrtz_fired_triggers` */

DROP TABLE IF EXISTS `qrtz_fired_triggers`;

CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`) USING BTREE,
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE,
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `qrtz_fired_triggers` */

/*Table structure for table `qrtz_job_details` */

DROP TABLE IF EXISTS `qrtz_job_details`;

CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `qrtz_job_details` */

/*Table structure for table `qrtz_locks` */

DROP TABLE IF EXISTS `qrtz_locks`;

CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `qrtz_locks` */

insert  into `qrtz_locks`(`SCHED_NAME`,`LOCK_NAME`) values 
('ExamScheduler','STATE_ACCESS'),
('examScheduler','TRIGGER_ACCESS');

/*Table structure for table `qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;

CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `qrtz_paused_trigger_grps` */

/*Table structure for table `qrtz_scheduler_state` */

DROP TABLE IF EXISTS `qrtz_scheduler_state`;

CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `qrtz_scheduler_state` */

insert  into `qrtz_scheduler_state`(`SCHED_NAME`,`INSTANCE_NAME`,`LAST_CHECKIN_TIME`,`CHECKIN_INTERVAL`) values 
('examScheduler','Van1744772599898',1744786196681,10000);

/*Table structure for table `qrtz_simple_triggers` */

DROP TABLE IF EXISTS `qrtz_simple_triggers`;

CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `qrtz_simple_triggers` */

/*Table structure for table `qrtz_simprop_triggers` */

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;

CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `INT_PROP_1` int DEFAULT NULL,
  `INT_PROP_2` int DEFAULT NULL,
  `LONG_PROP_1` bigint DEFAULT NULL,
  `LONG_PROP_2` bigint DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `qrtz_simprop_triggers` */

/*Table structure for table `qrtz_triggers` */

DROP TABLE IF EXISTS `qrtz_triggers`;

CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint DEFAULT NULL,
  `PREV_FIRE_TIME` bigint DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MISFIRE_INSTR` smallint DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE,
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `qrtz_triggers` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
