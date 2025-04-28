/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80028 (8.0.28)
 Source Host           : localhost:3306
 Source Schema         : yf_boot_exam

 Target Server Type    : MySQL
 Target Server Version : 80028 (8.0.28)
 File Encoding         : 65001

 Date: 28/04/2025 16:06:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for el_cfg_base
-- ----------------------------
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

-- ----------------------------
-- Records of el_cfg_base
-- ----------------------------
BEGIN;
INSERT INTO `el_cfg_base` (`id`, `site_name`, `login_logo`, `login_bg`, `back_logo`, `copy_right`) VALUES ('1', '云帆考试系统V2', 'https://be2.yfhl.net/upload/file/2025/04/23/1914966466990272513.png', 'https://be2.yfhl.net/upload/file/2025/04/23/1914966559726333954.png', 'https://be2.yfhl.net/upload/file/2025/04/23/1914966492999151618.png', '<p>&copy; 2025 北京云帆互联科技有限公司官网： <a href=\"https://www.yfhl.net/\" target=\"_blank\">https://www.yfhl.net/</a> </p>');
COMMIT;

-- ----------------------------
-- Table structure for el_cfg_switch
-- ----------------------------
DROP TABLE IF EXISTS `el_cfg_switch`;
CREATE TABLE `el_cfg_switch` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '功能名称',
  `val` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '开关或值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='功能配置';

-- ----------------------------
-- Records of el_cfg_switch
-- ----------------------------
BEGIN;
INSERT INTO `el_cfg_switch` (`id`, `val`) VALUES ('loginTick', '0');
INSERT INTO `el_cfg_switch` (`id`, `val`) VALUES ('userReg', 'true');
COMMIT;

-- ----------------------------
-- Table structure for el_exam
-- ----------------------------
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
  `repo_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组卷题库ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='课程';

-- ----------------------------
-- Records of el_exam
-- ----------------------------
BEGIN;
INSERT INTO `el_exam` (`id`, `title`, `content`, `open_type`, `state`, `start_time`, `end_time`, `total_score`, `total_time`, `qualify_score`, `chance`, `hand_min`, `late_max`, `thanks`, `repo_id`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915227067167539202', '云帆演示考试', '<p>1、本项目为云帆开源版考试系统。</p><p>2、为正常体验，将考试机会设置为不限制次数。</p><p>3、本系统每天自动重置系统数据，请不要上传重要资料。</p>', 1, 0, '2025-04-01 00:00:00', '2050-04-30 00:00:00', 150.00, 10, 90.00, 0, 0, 0, NULL, '1910524655864012801', '2025-04-24 10:11:31', '2025-04-27 15:33:25', '1000000000000000001', '1000000000000000001');
COMMIT;

-- ----------------------------
-- Table structure for el_exam_record
-- ----------------------------
DROP TABLE IF EXISTS `el_exam_record`;
CREATE TABLE `el_exam_record` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `exam_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '考试ID',
  `paper_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '结算的试卷ID',
  `try_count` int NOT NULL DEFAULT '1' COMMENT '考试次数',
  `max_score` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '最高分数',
  `last_score` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '最近分数',
  `passed` tinyint NOT NULL DEFAULT '0' COMMENT '是否通过',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`exam_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='考试记录';

-- ----------------------------
-- Records of el_exam_record
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for el_exam_rule
-- ----------------------------
DROP TABLE IF EXISTS `el_exam_rule`;
CREATE TABLE `el_exam_rule` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `exam_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '考试ID',
  `repo_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '题库ID',
  `qu_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '题型',
  `qu_count` int DEFAULT NULL COMMENT '出题数量',
  `qu_score` decimal(10,0) NOT NULL DEFAULT '1' COMMENT '每题分数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='考试规则';

-- ----------------------------
-- Records of el_exam_rule
-- ----------------------------
BEGIN;
INSERT INTO `el_exam_rule` (`id`, `exam_id`, `repo_id`, `qu_type`, `qu_count`, `qu_score`) VALUES ('1916395242890559489', '1915227067167539202', '1910524655864012801', 'radio', 5, 10);
INSERT INTO `el_exam_rule` (`id`, `exam_id`, `repo_id`, `qu_type`, `qu_count`, `qu_score`) VALUES ('1916395242898948097', '1915227067167539202', '1910524655864012801', 'multi', 5, 10);
INSERT INTO `el_exam_rule` (`id`, `exam_id`, `repo_id`, `qu_type`, `qu_count`, `qu_score`) VALUES ('1916395242898948098', '1915227067167539202', '1910524655864012801', 'judge', 5, 10);
COMMIT;

-- ----------------------------
-- Table structure for el_paper
-- ----------------------------
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

-- ----------------------------
-- Records of el_paper
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for el_paper_qu
-- ----------------------------
DROP TABLE IF EXISTS `el_paper_qu`;
CREATE TABLE `el_paper_qu` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `paper_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '试卷ID',
  `qu_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '题目ID',
  `qu_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '题目类型',
  `answered` tinyint NOT NULL DEFAULT '0' COMMENT '是否已答',
  `mark` tinyint NOT NULL DEFAULT '0' COMMENT '是否标记',
  `sort` int NOT NULL DEFAULT '0' COMMENT '问题排序',
  `score` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单题分分值',
  `actual_score` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际得分(主观题)',
  `is_right` tinyint NOT NULL DEFAULT '0' COMMENT '是否答对',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `paper_id` (`paper_id`) USING BTREE,
  KEY `qu_id` (`qu_id`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='试卷考题';

-- ----------------------------
-- Records of el_paper_qu
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for el_paper_qu_answer
-- ----------------------------
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

-- ----------------------------
-- Records of el_paper_qu_answer
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for el_repo
-- ----------------------------
DROP TABLE IF EXISTS `el_repo`;
CREATE TABLE `el_repo` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题库名称',
  `cat_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分类ID',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '题库备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='题库';

-- ----------------------------
-- Records of el_repo
-- ----------------------------
BEGIN;
INSERT INTO `el_repo` (`id`, `title`, `cat_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1910524655864012801', '云帆演示题库', '1915226614203678722', NULL, '2025-04-11 10:45:48', '2025-04-24 10:10:10', '1000000000000000001', '1000000000000000001');
COMMIT;

-- ----------------------------
-- Table structure for el_repo_qu
-- ----------------------------
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

-- ----------------------------
-- Records of el_repo_qu
-- ----------------------------
BEGIN;
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1911685389859876866', '1910524655864012801', NULL, 'radio', 'easy', '<p>中国最北边的城市是哪个？</p>', '<p style=\"text-align: start;\">中国最北边的城市是<strong>漠河市</strong>，位于黑龙江省大兴安岭地区。</p><h3 style=\"text-align: start; line-height: 1.5;\">关键信息：</h3><ul><li style=\"text-align: start;\">地理位置：漠河市地处北纬52°10′至53°33′，是中国纬度最高的城市，素有“神州北极”之称。</li><li style=\"text-align: start;\">边界：北隔黑龙江与俄罗斯相望，是中国与俄罗斯边境的重要节点。</li><li style=\"text-align: start;\">极寒气候：冬季极端最低气温可达-50℃以下，是中国最冷的地方之一。</li><li style=\"text-align: start;\">旅游特色：以北极村（中国最北的村庄）、极光观测（罕见但偶有出现）和冰雪景观闻名。</li></ul><h3 style=\"text-align: start; line-height: 1.5;\">补充说明：</h3><p style=\"text-align: start;\">漠河市原名漠河县，2018年撤县设市。其下辖的<strong>北极村</strong>是中国境内唯一可观赏到北极光现象的地区（概率较低），因此成为热门旅游目的地。</p>', '2025-04-14 15:38:09', '2025-04-14 15:38:09', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1912339000495435778', '1910524655864012801', NULL, 'radio', 'easy', '<p>小客车在雾天行驶时，应当开启什么灯？</p>', '<p>雾天能见度低时需开启雾灯和危险报警闪光灯以提高车辆辨识度。</p>', '2025-04-16 10:55:22', '2025-04-16 10:55:22', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1913062532164624386', '1910524655864012801', NULL, 'multi', 'easy', '<p>以下关于等腰三角形的描述，哪些是正确的？</p>', '<p>等腰三角形至少有两条边相等（A正确），且等边对等角（B正确）；但可能是锐角、直角或钝角三角形（C错误）；等边三角形作为特殊等腰三角形有三条对称轴（D错误）。</p>', '2025-04-18 10:50:25', '2025-04-18 10:50:25', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1913062799203377153', '1910524655864012801', NULL, 'multi', 'easy', '<p>小客车驾驶人哪些证件必须随车携带？（多选）</p>', '<p>行驶证和交强险标志为必带证件。</p>', '2025-04-18 10:51:29', '2025-04-18 10:51:29', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915216824811479042', '1910524655864012801', NULL, 'judge', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">对未取得驾驶证驾驶机动车的，追究其法律责任。</span></p>', '<p><br></p>', '2025-04-24 09:30:49', '2025-04-24 09:35:16', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915217036376367105', '1910524655864012801', NULL, 'radio', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">驾驶机动车应当随身携带哪种证件？</span></p>', NULL, '2025-04-24 09:31:39', '2025-04-24 09:31:39', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915217245693108225', '1910524655864012801', NULL, 'radio', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">在实习期内驾驶机动车的，应当在车身后部粘贴或者悬挂哪种标志？</span></p>', '<p><span style=\"color: rgb(178, 136, 80); font-size: 16px;\">本题主要考察实习期相关知识。实习期要在车后粘贴或悬挂实习标志，提醒其他车辆注意。因此选择“统一式样的实习标志”。<br><br>相关法规参考：《机动车驾驶证申领和使用规定》第七十六条，在实习期内驾驶机动车的，应当在车身后部粘贴或者悬挂统一式样的实习标志。</span></p>', '2025-04-24 09:32:29', '2025-04-24 09:32:29', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915217421350559745', '1910524655864012801', NULL, 'radio', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">以欺骗、贿赂等不正当手段取得驾驶证被依法撤销驾驶许可的，多长时间不得重新申请驾驶许可？</span></p>', '<p><span style=\"color: rgb(178, 136, 80); font-size: 16px;\">本题主要考察违规申领驾驶证行为。以欺骗、贿赂等手段取得驾驶证，是违法行为，取得的驾驶证也不合法，会被收缴驾驶证，3年内不得再次申领，处2000元以下罚款。因此选择“3年内”。<br><br>相关法规参考：《机动车驾驶证申领和使用规定》第九十三条，申请人以欺骗、贿赂等不正当手段取得机动车驾驶证的，公安机关交通管理部门收缴机动车驾驶证，撤销机动车驾驶许可，处二千元以下罚款；申请人在三年内不得再次申领机动车驾驶证。</span></p>', '2025-04-24 09:33:11', '2025-04-24 09:33:11', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915217849014378498', '1910524655864012801', NULL, 'judge', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">驾驶人要按照驾驶证载明的准驾车型驾驶车辆。</span></p>', '<p><span style=\"color: rgb(178, 136, 80); font-size: 16px;\">本题主要考察准驾车型。什么证开什么车，要按照驾驶证准驾的车型驾驶，与准驾车型不符上路行驶一次记9分。因此选择“正确”。<br><br>相关法规参考：《道路交通安全法》第十九条，驾驶人应当按照驾驶证载明的准驾车型驾驶机动车；驾驶机动车时，应当随身携带机动车驾驶证。</span></p>', '2025-04-24 09:34:53', '2025-04-24 09:35:00', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915218291043688449', '1910524655864012801', NULL, 'radio', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">驾驶报废机动车上路行驶的驾驶人，除按规定罚款外，还要受到哪种处理？</span></p>', '<p><span style=\"color: rgb(178, 136, 80); font-size: 16px;\">本题主要考察机动车强制报废相关规定。驾驶报废的机动车上路非常危险，除了按规定罚款，还要吊销其驾驶证。因此选择“吊销驾驶证”。<br><br>相关法规参考：《道路交通安全法》第一百条：驾驶拼装的机动车或者已达到报废标准的机动车上道路行驶的，公安机关交通管理部门应当予以收缴，强制报废。对驾驶前款所列机动车上道路行驶的驾驶人，处200元以上2000元以下罚款，并吊销机动车驾驶证。</span></p>', '2025-04-24 09:36:38', '2025-04-24 09:36:38', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915218432211378178', '1910524655864012801', NULL, 'radio', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">对驾驶已达到报废标准的机动车上路行驶的驾驶人，会受到下列哪种处罚？</span></p>', '<p><span style=\"color: rgb(178, 136, 80); font-size: 16px;\">本题主要考察机动车强制报废相关规定。驾驶达到报废标准的机动车上路非常危险，除了按规定罚款，还要吊销其驾驶证。因此选择“吊销机动车驾驶证”。<br><br>相关法规参考：《道路交通安全法》第一百条：驾驶拼装的机动车或者已达到报废标准的机动车上道路行驶的，公安机关交通管理部门应当予以收缴，强制报废。对驾驶前款所列机动车上道路行驶的驾驶人，处200元以上2000元以下罚款，并吊销机动车驾驶证。</span></p>', '2025-04-24 09:37:12', '2025-04-24 09:37:12', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915218558250213377', '1910524655864012801', NULL, 'judge', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">驾驶机动车上路前应当检查车辆安全技术性能。</span></p>', '<p><span style=\"color: rgb(178, 136, 80); font-size: 16px;\">本题主要考察出车前的检查。驾驶人在行车前，应对机动车的安全技术性能进行检查，确保车辆无安全隐患再上路行驶。因此选择“正确”。<br><br>相关法规参考：《道路交通安全法》第二十一条，驾驶人驾驶机动车上道路行驶前，应当对机动车的安全技术性能进行认真检查；不得驾驶安全设施不全或者机件不符合技术标准等具有安全隐患的机动车。</span></p>', '2025-04-24 09:37:42', '2025-04-24 09:37:42', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915218671928434690', '1910524655864012801', NULL, 'judge', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">不得驾驶具有安全隐患的机动车上道路行驶。</span></p>', '<p>本题主要考察机动车上路行驶条件。具有安全隐患的车辆是不可以上道路行驶的，因此选择“正确”。<br><br>相关法规参考：《道路交通安全法》第二十一条，驾驶人驾驶机动车上道路行驶前，应当对机动车的安全技术性能进行认真检查；不得驾驶安全设施不全或者机件不符合技术标准等具有安全隐患的机动车。</p><p><a href=\"\" target=\"\">我要分析</a></p><p><br></p>', '2025-04-24 09:38:09', '2025-04-24 09:38:09', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915218778346315778', '1910524655864012801', NULL, 'judge', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">拼装的机动车只要认为安全就可以上路行驶。</span></p>', '<p><span style=\"color: rgb(178, 136, 80); font-size: 16px;\">本题主要考察机动车上路行驶条件。拼装车辆具有安全隐患，是不可以上道路行驶的，因此选择“错误”。<br><br>相关法规参考：《道路交通安全法》第一百条，驾驶拼装的机动车或者已达到报废标准的机动车上道路行驶的，公安机关交通管理部门应当予以收缴，强制报废。对驾驶前款所列机动车上道路行驶的驾驶人，处200元以上2000元以下罚款，并吊销机动车驾驶证。</span></p>', '2025-04-24 09:38:34', '2025-04-24 09:38:34', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915218863494881282', '1910524655864012801', NULL, 'judge', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">已经达到报废标准的机动车经大修后可以上路行驶。</span></p>', '<p><span style=\"color: rgb(178, 136, 80); font-size: 16px;\">本题主要考察机动车强制报废相关规定。驾驶达到报废标准的机动车上路非常危险，即使大修也不能达到正常标准上路行驶，因此选择“错误”。<br><br>相关法规参考：《道路交通安全法》第一百条：驾驶拼装的机动车或者已达到报废标准的机动车上道路行驶的，公安机关交通管理部门应当予以收缴，强制报废。对驾驶前款所列机动车上道路行驶的驾驶人，处200元以上2000元以下罚款，并吊销机动车驾驶证。</span></p>', '2025-04-24 09:38:55', '2025-04-24 09:38:55', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915219114658193410', '1910524655864012801', NULL, 'radio', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">下列哪种证件是驾驶机动车上路行驶应当随车携带的？</span></p>', '<p><span style=\"color: rgb(178, 136, 80); font-size: 16px;\">本题主要考察机动车上路行驶条件。驾驶机动车上路行驶应随车携带驾驶证、行驶证。因此选择“机动车行驶证”。<br><br>相关法规参考：《道路交通安全法》第九十五条，上道路行驶的机动车未悬挂机动车号牌，未放置检验合格标志、保险标志，或者未随车携带行驶证、驾驶证的，公安机关交通管理部门应当扣留机动车，通知当事人提供相应的牌证、标志或者补办相应手续，并可以依照本法第九十条的规定予以处罚。当事人提供相应的牌证、标志或者补办相应手续的，应当及时退还机动车。</span></p>', '2025-04-24 09:39:55', '2025-04-24 09:39:55', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915219263514042370', '1910524655864012801', NULL, 'judge', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">驾驶机动车上路行驶应当按规定悬挂号牌。</span></p>', '<p><span style=\"color: rgb(178, 136, 80); font-size: 16px;\">本题主要考察机动车上路行驶条件。驾驶机动车上路行驶应按规定悬挂号牌。因此选择“正确”。<br><br>相关法规参考：《道路交通安全违法行为记分管理办法》第九条，驾驶未悬挂机动车号牌或者故意遮挡、污损机动车号牌的机动车上道路行驶的，一次记9分。</span></p>', '2025-04-24 09:40:30', '2025-04-24 09:40:30', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915219388600770562', '1910524655864012801', NULL, 'radio', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">公安交通管理部门对驾驶人的交通违法行为除依法给予行政处罚外，实行下列哪种制度？</span></p>', NULL, '2025-04-24 09:41:00', '2025-04-24 09:41:00', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915219521224663041', '1910524655864012801', NULL, 'radio', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">公安机关交通管理部门对累积记分达到规定分值的驾驶人怎样处理？</span></p>', NULL, '2025-04-24 09:41:32', '2025-04-24 09:41:32', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915219605299486722', '1910524655864012801', NULL, 'judge', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">驾驶人在驾驶证丢失后3个月内还可以驾驶机动车。</span></p>', NULL, '2025-04-24 09:41:52', '2025-04-24 09:41:52', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915219652812562434', '1910524655864012801', NULL, 'judge', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">驾驶人持超过有效期的驾驶证可以在1年内驾驶机动车。</span></p>', NULL, '2025-04-24 09:42:03', '2025-04-24 09:42:03', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915219698861826049', '1910524655864012801', NULL, 'judge', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">驾驶人的驾驶证损毁后不得驾驶机动车。</span></p>', NULL, '2025-04-24 09:42:14', '2025-04-24 09:42:14', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915219749436743681', '1910524655864012801', NULL, 'judge', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">记分满12分的驾驶人拒不参加学习和考试的将被公告驾驶证停止使用。</span></p>', NULL, '2025-04-24 09:42:26', '2025-04-24 09:42:26', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915219786166263810', '1910524655864012801', NULL, 'judge', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">记分满12分的驾驶人拒不参加学习和考试的将被公告驾驶证停止使用。</span></p>', NULL, '2025-04-24 09:42:35', '2025-04-24 09:42:35', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915219920572735489', '1910524655864012801', NULL, 'radio', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">初次申领的机动车驾驶证的有效期为多少年？</span></p>', NULL, '2025-04-24 09:43:07', '2025-04-24 09:43:07', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915220018249687042', '1910524655864012801', NULL, 'radio', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">准驾车型为小型汽车的，可以驾驶下列哪种车辆？</span></p>', NULL, '2025-04-24 09:43:30', '2025-04-24 09:43:30', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915220105797394434', '1910524655864012801', NULL, 'radio', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">准驾车型为小型自动挡汽车的，可以驾驶以下哪种车型？</span></p>', NULL, '2025-04-24 09:43:51', '2025-04-24 09:43:51', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915220178061058049', '1910524655864012801', NULL, 'judge', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">驾驶人在机动车驾驶证的6年有效期内，每个记分周期均未达到12分的，换发10年有效期的机动车驾驶证。</span></p>', NULL, '2025-04-24 09:44:08', '2025-04-24 09:44:08', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915220220272533506', '1910524655864012801', NULL, 'judge', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">机动车驾驶证有效期分为6年、10年、20年。</span></p>', NULL, '2025-04-24 09:44:18', '2025-04-24 09:44:18', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915220255701819393', '1910524655864012801', NULL, 'judge', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">准驾车型为小型汽车的，可以驾驶小型自动挡载客汽车。</span></p>', NULL, '2025-04-24 09:44:27', '2025-04-24 09:44:27', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915220312169734145', '1910524655864012801', NULL, 'judge', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">准驾车型为小型自动挡汽车的，可以驾驶低速载货汽车。</span></p>', NULL, '2025-04-24 09:44:40', '2025-04-24 09:44:40', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915220613626945538', '1910524655864012801', NULL, 'judge', '1', '<p><span style=\"color: rgb(51, 51, 51);\">初次申领的机动车驾驶证的有效期为6年。</span></p>', NULL, '2025-04-24 09:45:52', '2025-04-24 09:45:52', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915220690789556226', '1910524655864012801', NULL, 'judge', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">初次申领的机动车驾驶证的有效期为4年。</span></p>', NULL, '2025-04-24 09:46:10', '2025-04-24 09:46:10', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915220843122483201', '1910524655864012801', NULL, 'radio', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">初次申领机动车驾驶证的，可以申请下列哪种准驾车型？</span></p>', NULL, '2025-04-24 09:46:47', '2025-04-24 09:46:47', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915220956456771585', '1910524655864012801', NULL, 'radio', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">年满20周岁，可以初次申请下列哪种准驾车型？</span></p>', NULL, '2025-04-24 09:47:14', '2025-04-24 09:47:14', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915221062249701378', '1910524655864012801', NULL, 'judge', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">小型汽车科目二考试内容包括倒车入库、坡道定点停车和起步、侧方停车、曲线行驶、直角转弯。</span></p>', NULL, '2025-04-24 09:47:39', '2025-04-24 09:47:39', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915221120911237122', '1910524655864012801', NULL, 'judge', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">科目三考试分为道路驾驶技能考试和安全文明驾驶常识考试两部分。</span></p>', NULL, '2025-04-24 09:47:53', '2025-04-24 09:47:53', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915221317120778241', '1910524655864012801', NULL, 'radio', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">在学习驾驶证明的有效期内，科目二和科目三道路驾驶技能考试预约次数分别不得超过多少次？</span></p>', NULL, '2025-04-24 09:48:40', '2025-04-24 09:48:40', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915221404811091969', '1910524655864012801', NULL, 'radio', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">学习驾驶证明的有效期是多久？</span></p>', NULL, '2025-04-24 09:49:01', '2025-04-24 09:49:01', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915221508599144449', '1910524655864012801', NULL, 'judge', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">申请人因故不能按照预约时间参加考试的，应当提前一日申请取消预约，对申请人未按照预约考试时间参加考试的，判定该次考试不合格。</span></p>', NULL, '2025-04-24 09:49:25', '2025-04-24 09:49:25', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915221540773650434', '1910524655864012801', NULL, 'judge', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">机动车驾驶证遗失、损毁无法辨认时，机动车驾驶人应当向机动车驾驶证核发地或者核发地以外的车辆管理所申请补发。</span></p>', NULL, '2025-04-24 09:49:33', '2025-04-24 09:49:33', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915221579218640898', '1910524655864012801', NULL, 'judge', 'easy', '<p>有吸食、注射毒品后驾车行为的机动车驾驶人，不会被注销驾驶证。</p>', NULL, '2025-04-24 09:49:42', '2025-04-24 09:50:02', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915221624873639937', '1910524655864012801', NULL, 'judge', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">有执行社区戒毒、强制隔离戒毒、社区康复措施记录的，车辆管理所将注销其驾驶证。</span></p><p><br></p>', NULL, '2025-04-24 09:49:53', '2025-04-24 09:49:53', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915221794214469634', '1910524655864012801', NULL, 'radio', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">机动车登记证书、行驶证灭失、丢失或者损毁的，机动车所有人应当向哪个部门申请补领、换领？</span></p>', NULL, '2025-04-24 09:50:33', '2025-04-24 09:50:33', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915221894114402306', '1910524655864012801', NULL, 'judge', 'easy', '<p>机动车登记证书、行驶证灭失、丢失或者损毁的，机动车所有人应当向居住地车辆管理所申请补领、换领。</p>', NULL, '2025-04-24 09:50:57', '2025-04-24 09:51:15', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915221939685515265', '1910524655864012801', NULL, 'judge', 'easy', '<p><span style=\"color: rgb(51, 51, 51);\">申请人在考试过程中有贿赂、舞弊行为的，取消考试资格，已经通过考试的其他科目成绩无效。</span></p><p><br></p>', NULL, '2025-04-24 09:51:08', '2025-04-24 10:19:46', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915224313552437249', '1910524655864012801', NULL, 'multi', 'easy', '<p><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-size: 16px;\">下列哪些食物富含维生素C？</span></p>', NULL, '2025-04-24 10:00:34', '2025-04-24 10:00:34', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915224673234976770', '1910524655864012801', NULL, 'multi', 'easy', '<p>预防感冒可采取的措施包括？‌</p>', NULL, '2025-04-24 10:02:00', '2025-04-24 10:02:00', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915224783004106754', '1910524655864012801', NULL, 'multi', 'easy', '<p>被烫伤后正确处理方式包括？‌</p>', NULL, '2025-04-24 10:02:26', '2025-04-24 10:02:26', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915224948528119809', '1910524655864012801', NULL, 'multi', 'easy', '<p>长期使用电脑的正确护眼方式包括？‌</p>', NULL, '2025-04-24 10:03:06', '2025-04-24 10:03:06', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915225060553785346', '1910524655864012801', NULL, 'multi', 'easy', '<p>以下哪些做法有助于改善睡眠？‌</p>', NULL, '2025-04-24 10:03:32', '2025-04-24 10:03:32', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915225180309553153', '1910524655864012801', NULL, 'multi', 'easy', '<p>家中电器使用注意事项包括？‌</p>', NULL, '2025-04-24 10:04:01', '2025-04-24 10:04:01', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915225274383597569', '1910524655864012801', NULL, 'multi', 'easy', '<p>以下哪些行为可能引发火灾？‌</p>', NULL, '2025-04-24 10:04:23', '2025-04-24 10:04:23', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915225372442230786', '1910524655864012801', NULL, 'multi', 'easy', '<p>下列哪些说法符合健康饮水习惯？‌</p>', NULL, '2025-04-24 10:04:47', '2025-04-24 10:04:47', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915225528378064898', '1910524655864012801', NULL, 'multi', 'easy', '<p>哪些植物有净化空气的作用？‌</p>', NULL, '2025-04-24 10:05:24', '2025-04-24 10:05:24', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915225630517755906', '1910524655864012801', NULL, 'multi', 'easy', '<p>“八仙过海”中的八仙包括？‌</p>', NULL, '2025-04-24 10:05:48', '2025-04-24 10:05:48', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915225736142913538', '1910524655864012801', NULL, 'multi', 'easy', '<p>以下哪些物质可用于去除圆珠笔痕迹？‌</p>', NULL, '2025-04-24 10:06:13', '2025-04-24 10:06:13', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915225828769923074', '1910524655864012801', NULL, 'multi', 'easy', '<p>存放土豆的禁忌环境包括？‌</p>', NULL, '2025-04-24 10:06:35', '2025-04-24 10:06:35', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915225940757839873', '1910524655864012801', NULL, 'multi', 'easy', '<p>预防衣服褪色的正确方法包括？‌</p>', NULL, '2025-04-24 10:07:02', '2025-04-24 10:07:02', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915226034232098818', '1910524655864012801', NULL, 'multi', 'easy', '<p>微波炉使用禁忌包括？‌</p>', NULL, '2025-04-24 10:07:24', '2025-04-24 10:07:24', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_repo_qu` (`id`, `repo_id`, `chapter_id`, `qu_type`, `difficulty_level`, `content`, `analysis`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915226236653404162', '1910524655864012801', NULL, 'multi', 'easy', '<p>关于牛奶的饮用禁忌，正确的是？‌</p>', NULL, '2025-04-24 10:08:13', '2025-04-24 10:08:13', '1000000000000000001', '1000000000000000001');
COMMIT;

-- ----------------------------
-- Table structure for el_repo_qu_answer
-- ----------------------------
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

-- ----------------------------
-- Records of el_repo_qu_answer
-- ----------------------------
BEGIN;
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1911685389926985729', '1911685389859876866', 1, '漠河', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1911685389926985730', '1911685389859876866', 0, '新疆', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1911685389926985731', '1911685389859876866', 0, '四川', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1911685389926985732', '1911685389859876866', 0, '江西', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1912339000633847809', '1912339000495435778', 0, '近光灯', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1912339000638042114', '1912339000495435778', 0, '远光灯', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1912339000638042115', '1912339000495435778', 0, '危险报警闪光灯', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1912339000638042116', '1912339000495435778', 1, '雾灯和危险报警闪光灯', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1913062532181401602', '1913062532164624386', 1, '至少有两条边相等', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1913062532181401603', '1913062532164624386', 1, '两个底角相等', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1913062532181401604', '1913062532164624386', 0, '一定是锐角三角形', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1913062532181401605', '1913062532164624386', 0, '对称轴只有一条', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1913062799232737282', '1913062799203377153', 1, '行驶证', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1913062799232737283', '1913062799203377153', 1, '交强险标志', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1913062799241125890', '1913062799203377153', 0, '身份证', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1913062799241125891', '1913062799203377153', 0, '车辆购置税证明', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915216824866004993', '1915216824811479042', 1, '正确', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915216824870199298', '1915216824811479042', 0, '错误', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915217036414115842', '1915217036376367105', 1, '驾驶证', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915217036418310145', '1915217036376367105', 0, '职业资格证', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915217036422504450', '1915217036376367105', 0, '工作证', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915217036422504451', '1915217036376367105', 0, '身份证', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915217245739245569', '1915217245693108225', 1, '统一式样的实习标志', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915217245743439873', '1915217245693108225', 0, '注意避让标志', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915217245747634178', '1915217245693108225', 0, '注意新手标志', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915217245751828482', '1915217245693108225', 0, '注意车距标志', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915217421388308482', '1915217421350559745', 1, '3年内', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915217421392502785', '1915217421350559745', 0, '5年内', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915217421392502786', '1915217421350559745', 0, '终生', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915217421396697089', '1915217421350559745', 0, '1年内', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915217849047932930', '1915217849014378498', 1, '正确', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915217849047932931', '1915217849014378498', 0, '错误', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915218291106603009', '1915218291043688449', 0, '收缴驾驶证', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915218291110797313', '1915218291043688449', 1, '吊销驾驶证', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915218291110797314', '1915218291043688449', 0, '撤销驾驶许可', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915218291114991618', '1915218291043688449', 0, '强制恢复车况', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915218432249126913', '1915218432211378178', 0, '追究刑事责任', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915218432253321217', '1915218432211378178', 0, '处15日以下拘留', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915218432253321218', '1915218432211378178', 0, '处20元以上200元以下罚款', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915218432253321219', '1915218432211378178', 1, '吊销机动车驾驶证', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915218558279573506', '1915218558250213377', 1, '正确', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915218558279573507', '1915218558250213377', 0, '错误', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915218671953600514', '1915218671928434690', 1, '正确', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915218671957794818', '1915218671928434690', 0, '错误', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915218778375675905', '1915218778346315778', 0, '正确', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915218778375675906', '1915218778346315778', 1, '错误', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915218863520047105', '1915218863494881282', 0, '正确', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915218863524241410', '1915218863494881282', 1, '错误', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219114700136449', '1915219114658193410', 0, '机动车保险单', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219114704330754', '1915219114658193410', 0, '出厂合格证明', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219114708525057', '1915219114658193410', 1, '机动车行驶证', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219114708525058', '1915219114658193410', 0, '机动车登记证', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219263539208193', '1915219263514042370', 1, '正确', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219263539208194', '1915219263514042370', 0, '错误', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219388659490818', '1915219388600770562', 1, '违法登记制度', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219388663685122', '1915219388600770562', 0, '累积记分制度', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219388663685123', '1915219388600770562', 0, '奖励里程制度', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219388663685124', '1915219388600770562', 0, '强制报废制度', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219521266606082', '1915219521224663041', 1, '进行法律法规教育，重新考试', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219521266606083', '1915219521224663041', 0, '终生禁驾', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219521270800386', '1915219521224663041', 0, '依法追究刑事责任', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219521270800387', '1915219521224663041', 0, '处15日以下拘留', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219605324652545', '1915219605299486722', 0, '正确', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219605328846849', '1915219605299486722', 1, '错误', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219652841922562', '1915219652812562434', 0, '正确', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219652846116865', '1915219652812562434', 1, '错误', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219698886991874', '1915219698861826049', 1, '正确', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219698886991875', '1915219698861826049', 0, '错误', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219749461909505', '1915219749436743681', 1, '正确', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219749466103810', '1915219749436743681', 0, '错误', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219786191429633', '1915219786166263810', 1, '正确', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219786195623937', '1915219786166263810', 0, '错误', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219920610484226', '1915219920572735489', 0, '5年', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219920614678530', '1915219920572735489', 0, '3年', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219920618872834', '1915219920572735489', 0, '12年', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915219920618872835', '1915219920572735489', 1, '6年', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220018283241473', '1915220018249687042', 1, '低速载货汽车', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220018287435778', '1915220018249687042', 0, '三轮摩托车', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220018287435779', '1915220018249687042', 0, '轮式自行机械', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220018291630081', '1915220018249687042', 0, '中型客车', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220105856114689', '1915220105797394434', 1, '轻型自动挡载货汽车', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220105864503297', '1915220105797394434', 0, '小型汽车', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220105864503298', '1915220105797394434', 0, '二轮摩托车', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220105864503299', '1915220105797394434', 0, '低速载货汽车', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220178094612481', '1915220178061058049', 1, '正确', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220178094612482', '1915220178061058049', 0, '错误', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220220301893634', '1915220220272533506', 0, '正确', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220220306087938', '1915220220272533506', 1, '错误', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220255731179522', '1915220255701819393', 1, '正确', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220255735373825', '1915220255701819393', 0, '错误', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220312203288578', '1915220312169734145', 0, '正确', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220312203288579', '1915220312169734145', 1, '错误', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220613660499969', '1915220613626945538', 1, '正确', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220613664694274', '1915220613626945538', 0, '错误', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220690814722050', '1915220690789556226', 0, '正确', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220690814722051', '1915220690789556226', 1, '错误', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220843156037634', '1915220843122483201', 0, '大型客车', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220843160231938', '1915220843122483201', 0, '中型客车', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220843160231939', '1915220843122483201', 0, '重型牵引挂车', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220843164426241', '1915220843122483201', 1, '普通三轮摩托车', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220956490326018', '1915220956456771585', 0, '重型牵引挂车', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220956494520321', '1915220956456771585', 0, '大型客车', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220956494520322', '1915220956456771585', 0, '大型货车', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915220956498714626', '1915220956456771585', 1, '中型客车', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221062270672898', '1915221062249701378', 1, '正确', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221062274867202', '1915221062249701378', 0, '错误', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221120936402945', '1915221120911237122', 1, '正确', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221120936402946', '1915221120911237122', 0, '错误', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221317175304193', '1915221317120778241', 0, '4次', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221317175304194', '1915221317120778241', 1, '5次', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221317175304195', '1915221317120778241', 0, '6次', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221317175304196', '1915221317120778241', 0, '3次', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221404844646401', '1915221404811091969', 0, '1年', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221404848840705', '1915221404811091969', 1, '3年', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221404848840706', '1915221404811091969', 0, '2年', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221404853035009', '1915221404811091969', 0, '4年', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221508632698881', '1915221508599144449', 1, '正确', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221508632698882', '1915221508599144449', 0, '错误', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221540798816257', '1915221540773650434', 1, '正确', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221540798816258', '1915221540773650434', 0, '错误', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221579243806721', '1915221579218640898', 0, '正确', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221579248001026', '1915221579218640898', 1, '错误', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221624911388674', '1915221624873639937', 1, '正确', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221624915582977', '1915221624873639937', 0, '错误', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221794248024066', '1915221794214469634', 1, '登记地车辆管理所', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221794248024067', '1915221794214469634', 0, '当地公安局', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221794252218370', '1915221794214469634', 0, '住地交警支队车辆管理所', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221794252218371', '1915221794214469634', 0, '驾驶证核发地车辆管理所', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221894139568129', '1915221894114402306', 0, '正确', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221894143762433', '1915221894114402306', 1, '错误', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221939710681090', '1915221939685515265', 1, '正确', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915221939710681091', '1915221939685515265', 0, '错误', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915224313678266370', '1915224313552437249', 1, '橙子', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915224313686654977', '1915224313552437249', 1, '猕猴桃', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915224313690849281', '1915224313552437249', 0, '牛肉', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915224313690849282', '1915224313552437249', 1, '草莓', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915224673281114114', '1915224673234976770', 1, '多吃蔬菜水果', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915224673289502721', '1915224673234976770', 1, '接种流感疫苗', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915224673293697025', '1915224673234976770', 0, '剧烈运动后立即洗澡', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915224673297891329', '1915224673234976770', 1, '保持室内通风', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915224783087992834', '1915224783004106754', 1, '冷水冲洗', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915224783092187137', '1915224783004106754', 0, '涂抹牙膏', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915224783092187138', '1915224783004106754', 1, '覆盖无菌纱布', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915224783100575745', '1915224783004106754', 0, '挑破水泡', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915224948586840065', '1915224948528119809', 1, '调整屏幕亮度', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915224948586840066', '1915224948528119809', 1, '每1小时休息5分钟', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915224948586840067', '1915224948528119809', 1, '保持正确坐姿', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915224948599422977', '1915224948528119809', 0, '关灯使用电脑', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225060599922689', '1915225060553785346', 0, '睡前3小时进食', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225060604116993', '1915225060553785346', 1, '保持黑暗环境', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225060608311298', '1915225060553785346', 1, '睡前喝牛奶', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225060608311299', '1915225060553785346', 1, '白天适量运动', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225180364079105', '1915225180309553153', 0, '充电器长期插在插座上', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225180368273409', '1915225180309553153', 1, '远离水源', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225180372467713', '1915225180309553153', 1, '定期检查线路', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225180372467714', '1915225180309553153', 0, '覆盖电器散热孔', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225274421346306', '1915225274383597569', 1, '卧床吸烟', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225274429734913', '1915225274383597569', 0, '使用合格插线板', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225274429734914', '1915225274383597569', 1, '厨房燃气泄漏', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225274429734915', '1915225274383597569', 1, '微波炉加热金属容器', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225372517728257', '1915225372442230786', 1, '每天喝8杯水', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225372521922561', '1915225372442230786', 0, '运动后大量饮用冰水', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225372526116866', '1915225372442230786', 1, '睡前少喝水', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225372526116867', '1915225372442230786', 0, '饮用反复煮沸的水', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225528445173762', '1915225528378064898', 1, '绿萝', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225528445173763', '1915225528378064898', 1, '吊兰', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225528445173764', '1915225528378064898', 0, '玫瑰', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225528445173765', '1915225528378064898', 1, '芦荟', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225630597447682', '1915225630517755906', 1, '铁拐李', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225630601641986', '1915225630517755906', 1, '何仙姑', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225630601641987', '1915225630517755906', 1, '汉钟离', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225630610030594', '1915225630517755906', 0, '红孩儿', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225736239382529', '1915225736142913538', 1, '酒精', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225736247771138', '1915225736142913538', 1, '丙酮', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225736247771139', '1915225736142913538', 0, '醋', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225736251965442', '1915225736142913538', 0, '漂白剂', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225828807671809', '1915225828769923074', 0, '干燥处', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225828811866113', '1915225828769923074', 1, '日光照射处', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225828811866114', '1915225828769923074', 0, '通风处', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225828816060418', '1915225828769923074', 1, '潮湿处', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225940808171521', '1915225940757839873', 1, '盐水浸泡', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225940812365825', '1915225940757839873', 0, '使用漂白剂', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225940812365826', '1915225940757839873', 1, '反面晾晒', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915225940816560130', '1915225940757839873', 0, '热水洗涤', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915226034286624769', '1915226034232098818', 1, '加热金属容器', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915226034290819073', '1915226034232098818', 1, '加热带壳鸡蛋', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915226034290819074', '1915226034232098818', 0, '加热塑料盒', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915226034295013377', '1915226034232098818', 0, '加热玻璃容器', NULL, 'D');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915226236720513026', '1915226236653404162', 1, '与巧克力同食', NULL, 'A');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915226236724707330', '1915226236653404162', 0, '与鸡蛋同食', NULL, 'B');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915226236728901634', '1915226236653404162', 0, '与面包同食', NULL, 'C');
INSERT INTO `el_repo_qu_answer` (`id`, `qu_id`, `is_right`, `content`, `image`, `tag`) VALUES ('1915226236728901635', '1915226236653404162', 1, '空腹饮用', NULL, 'D');
COMMIT;

-- ----------------------------
-- Table structure for el_sys_depart
-- ----------------------------
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

-- ----------------------------
-- Records of el_sys_depart
-- ----------------------------
BEGIN;
INSERT INTO `el_sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `dept_level`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1441328268501381121', 1, '0', '云帆互联', 'A01', 0, 2, '2021-09-24 17:06:52', '2021-09-24 17:06:52', '', '');
INSERT INTO `el_sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `dept_level`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1447829893265002498', 1, '1441328268501381121', '技术部', 'A01A01', 0, 1, '2021-10-12 15:42:01', '2021-10-12 15:42:00', '10001', '');
INSERT INTO `el_sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `dept_level`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1447829920330846210', 1, '1441328268501381121', '财务部', 'A01A02', 0, 2, '2021-10-12 15:42:07', '2021-10-12 15:42:07', '10001', '');
INSERT INTO `el_sys_depart` (`id`, `dept_type`, `parent_id`, `dept_name`, `dept_code`, `dept_level`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1447829960050905090', 1, '1441328268501381121', '商务部', 'A01A03', 0, 3, '2021-10-12 15:42:17', '2021-10-12 15:42:16', '10001', '');
COMMIT;

-- ----------------------------
-- Table structure for el_sys_dic
-- ----------------------------
DROP TABLE IF EXISTS `el_sys_dic`;
CREATE TABLE `el_sys_dic` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `dic_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典编码',
  `type` int DEFAULT NULL COMMENT '1分类字典,2数据字典',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`dic_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='分类字典';

-- ----------------------------
-- Records of el_sys_dic
-- ----------------------------
BEGIN;
INSERT INTO `el_sys_dic` (`id`, `dic_code`, `type`, `title`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1399935914490269698', 'data_scope', 1, '数据权限', '角色数据权限范围', '2021-06-02 11:48:26', '2021-06-02 11:48:26', '', '');
INSERT INTO `el_sys_dic` (`id`, `dic_code`, `type`, `title`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1492388856845103105', 'state', 1, '通用状态', '系统全局通用状态', '2022-02-12 14:43:25', '2022-02-12 14:43:25', '', '');
INSERT INTO `el_sys_dic` (`id`, `dic_code`, `type`, `title`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1546399651832299522', 'user_state', 1, '用户状态', '用户状态', '2022-07-11 15:43:02', '2022-07-11 15:43:02', '', '');
INSERT INTO `el_sys_dic` (`id`, `dic_code`, `type`, `title`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1552482298987851778', 'menu_type', 1, '菜单类型', '目录/菜单/功能', '2022-07-28 10:33:18', '2022-07-28 10:33:18', '', '');
INSERT INTO `el_sys_dic` (`id`, `dic_code`, `type`, `title`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1552554336742055937', 'dic_type', 1, '字典类型', '数据字典类型枚举', '2022-07-28 15:19:33', '2022-07-28 15:19:33', '', '');
INSERT INTO `el_sys_dic` (`id`, `dic_code`, `type`, `title`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1698896002028761089', 'plugin_group', 1, '插件类型', '插件分组类型', '2023-09-05 11:09:05', '2023-09-05 11:09:05', '', '');
INSERT INTO `el_sys_dic` (`id`, `dic_code`, `type`, `title`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1910524211750133761', 'repo_catalog', 2, '题库分类', '题库分类', '2025-04-11 10:44:02', '2025-04-11 10:44:02', '', '');
INSERT INTO `el_sys_dic` (`id`, `dic_code`, `type`, `title`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1910602708967395330', 'qu_type', 1, '试题题型', '试题题型', '2025-04-11 15:55:57', '2025-04-11 15:55:57', '', '');
INSERT INTO `el_sys_dic` (`id`, `dic_code`, `type`, `title`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1910603515049709569', 'qu_difficulty_level', 1, '试题难度', '试题难度', '2025-04-11 15:59:09', '2025-04-11 15:59:09', '', '');
INSERT INTO `el_sys_dic` (`id`, `dic_code`, `type`, `title`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1914160770006573057', 'yes_no', 1, '是否', '通用是否选项', '2025-04-21 11:34:25', '2025-04-21 11:34:25', '', '');
COMMIT;

-- ----------------------------
-- Table structure for el_sys_dic_value
-- ----------------------------
DROP TABLE IF EXISTS `el_sys_dic_value`;
CREATE TABLE `el_sys_dic_value` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID/字典编码',
  `dic_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '归属字典',
  `dic_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子项编码',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分类名称',
  `parent_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '上级ID',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='分类字典值';

-- ----------------------------
-- Records of el_sys_dic_value
-- ----------------------------
BEGIN;
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1356065526639505409', 'exam_open_type', '1', '完全公开', '0', NULL, '2021-02-01 10:23:10', '2021-02-01 10:23:10', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1399936107176595458', 'data_scope', '1', '仅本人数据', '0', '仅本人数据', '2021-06-02 11:49:12', '2021-06-02 11:49:12', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1399936146162651137', 'data_scope', '2', '本部门数据', '0', '本部门数据', '2021-06-02 11:49:21', '2021-06-02 11:49:21', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1399936188902608897', 'data_scope', '3', '本部门及以下', '0', '本部门及以下', '2021-06-02 11:49:31', '2021-06-02 11:49:31', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1399936230719819777', 'data_scope', '4', '全部数据', '0', '全部数据', '2021-06-02 11:49:41', '2021-06-02 11:49:41', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1492388894015025153', 'state', '0', '正常', '0', NULL, '2022-02-12 14:43:34', '2022-02-12 14:43:34', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1492388933202407426', 'state', '1', '禁用', '0', NULL, '2022-02-12 14:43:43', '2022-02-12 14:43:43', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1546399693989249025', 'user_state', '0', '正常', '0', NULL, '2022-07-11 15:43:12', '2022-07-11 15:43:12', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1546399745172340738', 'user_state', '1', '已禁用', '0', NULL, '2022-07-11 15:43:24', '2022-07-11 15:43:24', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1546399778231844866', 'user_state', '2', '待审核', '0', NULL, '2022-07-11 15:43:32', '2022-07-11 15:43:32', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1552483045594935298', 'menu_type', '1', '目录', '0', NULL, '2022-07-28 10:36:16', '2022-07-28 10:36:16', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1552483057787777025', 'menu_type', '2', '菜单', '0', NULL, '2022-07-28 10:36:19', '2022-07-28 10:36:19', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1552483066511929345', 'menu_type', '3', '功能', '0', NULL, '2022-07-28 10:36:21', '2022-07-28 10:36:21', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1552554710609731586', 'dic_type', '1', '数据字典', '0', NULL, '2022-07-28 15:21:02', '2022-07-28 15:21:02', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1552554758366076929', 'dic_type', '2', '分类字典', '0', NULL, '2022-07-28 15:21:14', '2022-07-28 15:21:14', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1698896091577151490', 'plugin_group', 'upload', '文件上传', '0', NULL, '2023-09-05 11:09:26', '2023-09-05 11:09:26', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1910524409985523713', 'repo_catalog', '1910524409985523713', '企业文化', '0', NULL, '2025-04-11 10:44:49', '2025-04-11 10:44:49', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1910524529837760513', 'repo_catalog', '1910524529837760513', '岗位晋升', '0', NULL, '2025-04-11 10:45:18', '2025-04-11 10:45:18', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1910524561106296834', 'repo_catalog', '1910524561106296834', '职业技能', '0', NULL, '2025-04-11 10:45:25', '2025-04-11 10:45:25', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1910602921656356865', 'qu_type', 'radio', '单选题', '0', NULL, '2025-04-11 15:56:48', '2025-04-11 15:56:48', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1910602957609930754', 'qu_type', 'multi', '多选题', '0', NULL, '2025-04-11 15:56:57', '2025-04-11 15:56:57', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1910603005953478658', 'qu_type', 'judge', '判断题', '0', NULL, '2025-04-11 15:57:08', '2025-04-11 15:57:08', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1910603594192031746', 'qu_difficulty_level', 'easy', '简单', '0', NULL, '2025-04-11 15:59:28', '2025-04-11 15:59:28', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1910603630212714498', 'qu_difficulty_level', 'normal', '一般', '0', NULL, '2025-04-11 15:59:37', '2025-04-11 15:59:37', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1910604188910784514', 'qu_difficulty_level', 'hard', '较难', '0', NULL, '2025-04-11 16:01:50', '2025-04-11 16:01:50', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1910604353570770946', 'qu_difficulty_level', 'extreme', '极难', '0', NULL, '2025-04-11 16:02:29', '2025-04-11 16:02:29', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1914160827720196097', 'yes_no', '1', '是', '0', NULL, '2025-04-21 11:34:39', '2025-04-21 11:34:39', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1914160855650066434', 'yes_no', '0', '否', '0', NULL, '2025-04-21 11:34:46', '2025-04-21 11:34:46', '', '');
INSERT INTO `el_sys_dic_value` (`id`, `dic_code`, `dic_value`, `title`, `parent_id`, `remark`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1915226614203678722', 'repo_catalog', '1915226614203678722', '云帆演示', '0', NULL, '2025-04-24 10:09:42', '2025-04-24 10:09:42', '', '');
COMMIT;

-- ----------------------------
-- Table structure for el_sys_menu
-- ----------------------------
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

-- ----------------------------
-- Records of el_sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1367010529435996174', '0', 1, NULL, '/admin/sys', '#', '/admin/sys/menu', 'Sys', '系统设置', 'carbon:settings', NULL, 1, 0, 17, '2021-03-07 11:08:18', '2022-01-06 18:10:33', '', '10001');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1367010529435996176', '1367010529435996174', 2, NULL, '/admin/sys/menu', 'views/System/Menu/Menu', NULL, 'SysMenu', '菜单管理', '', NULL, 1, 0, 2, '2021-03-07 11:08:18', '2021-05-31 10:14:26', '', '10001');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1367010529435996178', '1367010529435996174', 2, NULL, '/admin/sys/role', 'views/System/Role/Role', NULL, 'SysRole', '角色管理', '', NULL, 1, 0, 3, '2021-03-07 11:08:18', '2022-01-06 18:10:17', '', '10001');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1367010529435996179', '1367010529435996174', 2, NULL, '/admin/sys/dict', 'views/System/DataDict/DataDict', NULL, 'SysDataDict', '数据字典', '', NULL, 1, 0, 3, '2021-03-07 11:08:18', '2022-01-06 18:10:17', '', '10001');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1399266644605394945', '1367010529435996176', 3, 'sys:menu:add', NULL, NULL, NULL, 'SysMenuAdd', '添加', NULL, NULL, 1, 1, 1, '2021-05-31 15:29:00', '2021-05-31 15:28:59', '10001', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1399266713060630529', '1367010529435996176', 3, 'sys:menu:update', NULL, NULL, NULL, 'SysMenuUpdate', '修改', NULL, NULL, 1, 1, 2, '2021-05-31 15:29:16', '2021-05-31 15:29:16', '10001', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1399266787438223361', '1367010529435996176', 3, 'sys:menu:delete', NULL, NULL, NULL, 'SysMenuDelete', '删除', NULL, NULL, 1, 1, 3, '2021-05-31 15:29:34', '2021-05-31 15:29:33', '10001', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1399266868300210177', '1367010529435996176', 3, 'sys:menu:sort', NULL, NULL, NULL, 'SysMenuSort', '排序', NULL, NULL, 1, 1, 4, '2021-05-31 15:29:53', '2021-05-31 15:29:53', '10001', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1552509704679235586', '1367010529435996178', 3, 'sys:role:paging', NULL, NULL, NULL, 'SysRolePaging', '查看', '', NULL, NULL, 1, 1, '2022-07-28 12:22:12', '2022-07-28 12:22:12', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1552510807093321730', '1367010529435996178', 3, 'sys:role:add', NULL, NULL, NULL, 'SysRoleAdd', '添加', NULL, NULL, NULL, 1, 2, '2022-07-28 12:26:35', '2022-07-28 12:26:35', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1552510872314748929', '1367010529435996178', 3, 'sys:role:edit', NULL, NULL, NULL, 'SysRoleEdit', '修改', NULL, NULL, NULL, 1, 3, '2022-07-28 12:26:50', '2022-07-28 12:26:50', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1552510963301785601', '1367010529435996178', 3, 'sys:role:delete', NULL, NULL, NULL, 'SysRoleDelete', '删除', NULL, NULL, NULL, 1, 4, '2022-07-28 12:27:12', '2022-07-28 12:27:12', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1552547259067965442', '0', 1, NULL, '/admin/org', '#', NULL, 'SysDept', '组织架构', 'carbon:category', NULL, NULL, 0, 16, '2022-07-28 14:51:26', '2022-07-28 14:51:26', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1552549085188235265', '1367010529435996176', 3, 'sys:menu:paging', NULL, NULL, NULL, 'SysMenuPaging', '查看', NULL, NULL, NULL, 1, 5, '2022-07-28 14:58:41', '2022-07-28 14:58:41', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1552615713615716353', '1367010529435996179', 3, 'sys:dict:add', NULL, NULL, NULL, 'SysDictAdd', '添加', NULL, NULL, NULL, NULL, 1, '2022-07-28 19:23:26', '2022-07-28 19:23:26', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1552615821107339266', '1367010529435996179', 3, 'sys:dict:edit', NULL, NULL, NULL, 'SysDictEdit', '修改', NULL, NULL, NULL, NULL, 2, '2022-07-28 19:23:52', '2022-07-28 19:23:52', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1552615880121196546', '1367010529435996179', 3, 'sys:dict:delete', NULL, NULL, NULL, 'SysDictDelete', '删除', NULL, NULL, NULL, NULL, 3, '2022-07-28 19:24:06', '2022-07-28 19:24:06', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1552616085025529857', '1367010529435996179', 3, 'sys:dict:paging', NULL, NULL, NULL, 'SysDictPaging', '查看', NULL, NULL, NULL, NULL, 4, '2022-07-28 19:24:55', '2022-07-28 19:24:55', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1552842968174489602', '1552547259067965442', 2, NULL, '/admin/org/depart', 'views/System/Depart/Depart', NULL, 'OrgDepart', '部门管理', NULL, NULL, NULL, NULL, 1, '2022-07-29 10:26:28', '2022-07-29 10:26:28', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1553180631951761409', '1367010529435996178', 3, 'sys:role:grant', NULL, NULL, NULL, 'SysRoleGrant', '角色授权', NULL, NULL, NULL, NULL, 5, '2022-07-30 08:48:14', '2022-07-30 08:48:14', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1556906844813914114', '1552547259067965442', 2, NULL, '/admin/org/user', 'views/System/User/User', NULL, 'OrgUser', '人员管理', NULL, NULL, NULL, NULL, 2, '2022-08-09 15:34:52', '2022-08-09 15:34:52', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1556907609842380801', '1556906844813914114', 3, 'sys:user:edit', NULL, NULL, NULL, 'SysUserEdit', '修改', NULL, NULL, NULL, 1, 3, '2022-08-09 15:37:54', '2022-08-09 15:37:54', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1556907683607605249', '1556906844813914114', 3, 'sys:user:add', NULL, NULL, NULL, 'SysUserAdd', '添加', NULL, NULL, NULL, 1, 2, '2022-08-09 15:38:12', '2022-08-09 15:38:12', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1556907994690744321', '1556906844813914114', 3, 'sys:user:paging', NULL, NULL, NULL, 'SysUserPaging', '查看', NULL, NULL, NULL, 1, 1, '2022-08-09 15:39:26', '2022-08-09 15:39:26', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1556908088521519105', '1556906844813914114', 3, 'sys:user:delete', NULL, NULL, NULL, 'SysUserDelete', '删除', NULL, NULL, NULL, 1, 4, '2022-08-09 15:39:48', '2022-08-09 15:39:48', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1556911576896446466', '1556906844813914114', 3, 'sys:user:state', NULL, NULL, NULL, 'SysUserState', '启用/禁用', NULL, NULL, NULL, 1, 5, '2022-08-09 15:53:40', '2022-08-09 15:53:40', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1557199944846876674', '1552842968174489602', 3, 'sys:depart:view', NULL, NULL, NULL, 'SysDeptView', '查看', NULL, NULL, NULL, 1, 3, '2022-08-10 10:59:32', '2022-08-10 10:59:32', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1557199992607416322', '1552842968174489602', 3, 'sys:depart:add', NULL, NULL, NULL, 'SysDeptAdd', '添加', NULL, NULL, NULL, 1, 1, '2022-08-10 10:59:44', '2022-08-10 10:59:44', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1557200059632394242', '1552842968174489602', 3, 'sys:depart:edit', NULL, NULL, NULL, 'SysDeptEdit', '修改', NULL, NULL, NULL, 1, 4, '2022-08-10 11:00:00', '2022-08-10 11:00:00', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1557200122416930817', '1552842968174489602', 3, 'sys:depart:delete', NULL, NULL, NULL, 'SysDeptDelete', '删除', NULL, NULL, NULL, 1, 2, '2022-08-10 11:00:15', '2022-08-10 11:00:15', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1564510476430225410', '1367010529435996174', 2, NULL, '/admin/sys/config', 'views/System/Config/Config', NULL, 'SysConfig', '个性配置', NULL, NULL, NULL, NULL, 4, '2022-08-30 15:08:59', '2022-08-30 15:08:59', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1566612797037527042', '1367010529435996174', 2, NULL, '/admin/sys/plugin', 'views/System/Plugin/Plugin', NULL, 'Plugin', '插件管理', NULL, NULL, NULL, NULL, 5, '2022-09-05 10:22:51', '2022-09-05 10:22:51', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1700043149512056834', '0', 1, NULL, '/admin', '#', '/admin/dashboard', 'HomeDashboard', '管理首页', 'ant-design:dashboard-outlined', NULL, NULL, NULL, 12, '2023-09-08 15:07:27', '2023-09-08 15:11:37', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1700044482038243330', '1700043149512056834', 2, NULL, '/admin/dashboard', 'views/Dashboard/Dashboard', NULL, 'Dashboard', '工作台', '', NULL, NULL, NULL, 1, '2023-09-08 15:12:44', '2023-09-08 15:12:52', '1000000000000000001', '1000000000000000001');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1910230973105442817', '0', 1, NULL, '/admin/repo', '#', NULL, 'HomeRepo', '题库管理', 'ant-design:product-outlined', NULL, NULL, NULL, 14, '2025-04-10 15:18:49', '2025-04-10 15:18:49', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1910231460139634690', '1910230973105442817', 2, NULL, '/admin/repo/repo', 'views/Exam/Repo/Repo', NULL, 'Repo', '题库管理', NULL, NULL, NULL, 0, 1, '2025-04-10 15:20:45', '2025-04-10 15:20:45', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1910540102659358722', '1910230973105442817', 2, NULL, '/admin/repo/qu', 'views/Exam/Repo/Qu', NULL, 'Qu', '试题管理', NULL, NULL, NULL, NULL, 2, '2025-04-11 11:47:11', '2025-04-11 11:47:11', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1910584408183029762', '1910231460139634690', 3, 'repo:repo:add', NULL, NULL, NULL, 'RepoAdd', '添加', NULL, NULL, NULL, 1, 1, '2025-04-11 14:43:14', '2025-04-11 14:43:14', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1910584475480637442', '1910231460139634690', 3, 'repo:repo:delete', NULL, NULL, NULL, 'RepoDelete', '删除', NULL, NULL, NULL, 1, 2, '2025-04-11 14:43:30', '2025-04-11 14:43:30', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1910584582947094529', '1910231460139634690', 3, 'repo:repo:edit', NULL, NULL, NULL, 'RepoEdit', '修改', NULL, NULL, NULL, 1, 3, '2025-04-11 14:43:56', '2025-04-11 14:43:56', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1910585687147954177', '1910231460139634690', 3, 'repo:repo:view', NULL, NULL, NULL, 'RepoView', '查看', NULL, NULL, NULL, 1, 4, '2025-04-11 14:48:19', '2025-04-11 14:48:19', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1910640225917784066', '1910540102659358722', 3, 'repo:qu:add', NULL, NULL, NULL, 'QuAdd', '添加', NULL, NULL, NULL, 1, 1, '2025-04-11 18:25:02', '2025-04-11 18:25:02', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1910640675547172865', '1910540102659358722', 3, 'repo:qu:delete', NULL, NULL, NULL, 'QuDelete', '删除', NULL, NULL, NULL, 1, 2, '2025-04-11 18:26:49', '2025-04-11 18:26:49', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1910640779146481666', '1910540102659358722', 3, 'repo:qu:edit', NULL, NULL, NULL, 'QuEdit', '修改', NULL, NULL, NULL, 1, 3, '2025-04-11 18:27:14', '2025-04-11 18:27:14', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1910640845336793090', '1910540102659358722', 3, 'repo:qu:view', NULL, NULL, NULL, 'QuView', '查看', NULL, NULL, NULL, 1, 4, '2025-04-11 18:27:30', '2025-04-11 18:27:30', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1911703533823365121', '0', 1, NULL, '/admin/admin', '#', NULL, 'HomeExam', '考试管理', 'ant-design:file-text-outlined', NULL, NULL, NULL, 15, '2025-04-14 16:50:14', '2025-04-14 16:50:14', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1911705220688547841', '1911703533823365121', 2, NULL, '/admin/exam/exam', 'views/Exam/Exam/Exam', NULL, 'Exam', '考试管理', NULL, NULL, NULL, NULL, 1, '2025-04-14 16:56:57', '2025-04-14 16:56:57', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1911956917277069314', '1911705220688547841', 3, 'exam:exam:add', '/admin/exam/add', 'views/Exam/Exam/Form', NULL, 'ExamAdd', '添加', NULL, NULL, NULL, 1, 1, '2025-04-15 09:37:06', '2025-04-15 09:37:06', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1911956988110475266', '1911705220688547841', 3, 'exam:exam:delete', NULL, NULL, NULL, 'ExamDelete', '删除', NULL, NULL, NULL, 1, 2, '2025-04-15 09:37:23', '2025-04-15 09:37:23', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1911957176237592577', '1911705220688547841', 3, 'exam:exam:edit', '/admin/exam/edit', 'views/Exam/Exam/Form', NULL, 'ExamEdit', '修改', NULL, NULL, NULL, 1, 3, '2025-04-15 09:38:07', '2025-04-15 09:38:07', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1911957247897276417', '1911705220688547841', 3, 'exam:exam:view', NULL, NULL, NULL, 'ExamView', '查看', NULL, NULL, NULL, 1, 4, '2025-04-15 09:38:25', '2025-04-15 09:38:25', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1912388980346134529', '0', 1, NULL, '/client/exam', '#', NULL, 'ClientExam', '考试中心', 'ant-design:credit-card-outlined', NULL, NULL, NULL, 13, '2025-04-16 14:13:58', '2025-04-16 14:13:58', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1912389902866522113', '1912388980346134529', 2, 'exam:client:list', '/client/exam/list', 'views/Exam/Exam/Client/List', NULL, 'ClientExamList', '在线考试', NULL, NULL, NULL, 0, 1, '2025-04-16 14:17:37', '2025-04-16 14:17:37', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1912445044980776961', '1912389902866522113', 3, 'exam:client:detail', '/client/exam/detail', 'views/Exam/Exam/Client/Detail', NULL, 'ExamClientDetail', '考试详情', NULL, NULL, NULL, 1, 1, '2025-04-16 17:56:44', '2025-04-16 17:56:44', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1912452280306171906', '1912389902866522113', 3, 'exam:client:enter', '/client/exam/enter', 'views/Exam/Exam/Client/Enter', NULL, 'ExamClientEnter', '进入考试', NULL, NULL, NULL, 1, 2, '2025-04-16 18:25:29', '2025-04-16 18:25:29', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1912766674995073025', '1912389902866522113', 3, 'exam:client:result', '/client/exam/result', 'views/Exam/Exam/Client/Result', NULL, 'ExamClientResult', '考试结果', NULL, NULL, NULL, 1, 3, '2025-04-17 15:14:47', '2025-04-17 15:14:47', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1914135464021499905', '1911705220688547841', 3, 'exam:record:list', '/admin/exam/record', 'views/Exam/Exam/Record', NULL, 'ExamRecord', '考试记录', NULL, NULL, NULL, 1, 5, '2025-04-21 09:53:52', '2025-04-21 09:53:52', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1914145046580039681', '1912388980346134529', 2, 'exam:client:record', '/client/exam/record', 'views/Exam/Exam/Client/Record', NULL, 'ClientExamRecord', '考试记录', NULL, NULL, NULL, 0, 2, '2025-04-21 10:31:56', '2025-04-21 10:31:56', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1914244224937299969', '0', 1, 'user', '/client/uc', '#', NULL, 'UCenter', '用户设置', 'ant-design:user-outlined', NULL, NULL, NULL, 18, '2025-04-21 17:06:02', '2025-04-21 17:06:02', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1914244884357386242', '1914244224937299969', 2, 'client:user:info', '/client/user/info', 'views/System/User/Client/Info', NULL, 'UserInfoUpdate', '资料修改', NULL, NULL, NULL, NULL, 1, '2025-04-21 17:08:40', '2025-04-21 17:08:40', '', '');
INSERT INTO `el_sys_menu` (`id`, `parent_id`, `menu_type`, `permission_tag`, `path`, `component`, `redirect`, `name`, `meta_title`, `meta_icon`, `meta_active_menu`, `meta_no_cache`, `hidden`, `sort`, `create_time`, `update_time`, `create_by`, `update_by`) VALUES ('1914245167460323330', '1914244224937299969', 2, 'client:user:passwd', '/client/user/passwd', 'views/System/User/Client/Passwd', NULL, 'UserPassUpdate', '密码安全', NULL, NULL, NULL, NULL, 2, '2025-04-21 17:09:47', '2025-04-21 17:09:47', '', '');
COMMIT;

-- ----------------------------
-- Table structure for el_sys_role
-- ----------------------------
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

-- ----------------------------
-- Records of el_sys_role
-- ----------------------------
BEGIN;
INSERT INTO `el_sys_role` (`id`, `role_name`, `data_scope`, `role_level`, `remark`, `create_time`, `create_by`, `update_time`, `update_by`) VALUES ('admin', '超级管理员', 4, 999, '', '2020-12-03 16:52:16', '', '2022-06-15 15:47:31', '10001');
INSERT INTO `el_sys_role` (`id`, `role_name`, `data_scope`, `role_level`, `remark`, `create_time`, `create_by`, `update_time`, `update_by`) VALUES ('user', '学员', 1, 1, '注册用户', '2022-07-29 12:24:34', '', '2022-07-29 12:24:34', '10001');
COMMIT;

-- ----------------------------
-- Table structure for el_sys_role_menu
-- ----------------------------
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

-- ----------------------------
-- Records of el_sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914256054338392065', 'user', '1912388980346134529', '2025-04-21 17:53:03', '2025-04-21 17:53:03', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914256054338392066', 'user', '1912389902866522113', '2025-04-21 17:53:03', '2025-04-21 17:53:03', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914256054338392067', 'user', '1912445044980776961', '2025-04-21 17:53:03', '2025-04-21 17:53:03', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914256054338392068', 'user', '1912452280306171906', '2025-04-21 17:53:03', '2025-04-21 17:53:03', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914256054338392069', 'user', '1912766674995073025', '2025-04-21 17:53:03', '2025-04-21 17:53:03', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914256054342586369', 'user', '1914145046580039681', '2025-04-21 17:53:03', '2025-04-21 17:53:03', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914256054342586370', 'user', '1914244224937299969', '2025-04-21 17:53:03', '2025-04-21 17:53:03', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914256054342586371', 'user', '1914244884357386242', '2025-04-21 17:53:03', '2025-04-21 17:53:03', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914256054342586372', 'user', '1914245167460323330', '2025-04-21 17:53:03', '2025-04-21 17:53:03', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409390628865', 'admin', '1700043149512056834', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409394823170', 'admin', '1700044482038243330', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409394823171', 'admin', '1910230973105442817', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409394823172', 'admin', '1910231460139634690', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409394823173', 'admin', '1910584408183029762', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409399017473', 'admin', '1910584475480637442', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409399017474', 'admin', '1910584582947094529', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409399017475', 'admin', '1910585687147954177', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409403211777', 'admin', '1910540102659358722', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409403211778', 'admin', '1910640225917784066', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409403211779', 'admin', '1910640675547172865', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409403211780', 'admin', '1910640779146481666', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409403211781', 'admin', '1910640845336793090', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409403211782', 'admin', '1911703533823365121', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409403211783', 'admin', '1911705220688547841', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409407406082', 'admin', '1911956917277069314', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409407406083', 'admin', '1911956988110475266', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409407406084', 'admin', '1911957176237592577', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409407406085', 'admin', '1911957247897276417', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409407406086', 'admin', '1914135464021499905', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409407406087', 'admin', '1552547259067965442', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409407406088', 'admin', '1552842968174489602', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409407406089', 'admin', '1557199992607416322', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409407406090', 'admin', '1557200122416930817', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409411600386', 'admin', '1557199944846876674', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409411600387', 'admin', '1557200059632394242', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409411600388', 'admin', '1556906844813914114', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409411600389', 'admin', '1556907994690744321', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409411600390', 'admin', '1556907683607605249', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409411600391', 'admin', '1556907609842380801', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409411600392', 'admin', '1556908088521519105', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409411600393', 'admin', '1556911576896446466', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409411600394', 'admin', '1367010529435996174', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409415794689', 'admin', '1367010529435996176', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409415794690', 'admin', '1399266644605394945', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409415794691', 'admin', '1399266713060630529', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409415794692', 'admin', '1399266787438223361', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409415794693', 'admin', '1399266868300210177', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409415794694', 'admin', '1552549085188235265', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409415794695', 'admin', '1367010529435996178', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409415794696', 'admin', '1552509704679235586', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409415794697', 'admin', '1552510807093321730', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409415794698', 'admin', '1552510872314748929', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409419988994', 'admin', '1552510963301785601', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409419988995', 'admin', '1553180631951761409', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409419988996', 'admin', '1367010529435996179', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409419988997', 'admin', '1552615713615716353', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409419988998', 'admin', '1552615821107339266', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409419988999', 'admin', '1552615880121196546', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409419989000', 'admin', '1552616085025529857', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409419989001', 'admin', '1564510476430225410', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409419989002', 'admin', '1566612797037527042', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409419989003', 'admin', '1914244224937299969', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409419989004', 'admin', '1914244884357386242', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
INSERT INTO `el_sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`, `create_by`, `update_by`, `data_flag`) VALUES ('1914593409424183298', 'admin', '1914245167460323330', '2025-04-22 16:13:34', '2025-04-22 16:13:34', '', '', 0);
COMMIT;

-- ----------------------------
-- Table structure for el_sys_user
-- ----------------------------
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

-- ----------------------------
-- Records of el_sys_user
-- ----------------------------
BEGIN;
INSERT INTO `el_sys_user` (`id`, `user_name`, `real_name`, `avatar`, `password`, `salt`, `state`, `id_card`, `mobile`, `email`, `dept_code`, `create_time`, `create_by`, `update_time`, `update_by`) VALUES ('1000000000000000001', 'admin', '云帆超管', 'https://be2.yfhl.net/upload/file/2025/04/23/1914975014591750145.jpeg', '05c0de3b9209d13bd07add35970563b0', 'HhwDnq', 0, '', '', '', 'A01A01', '2020-12-03 16:52:10', '', '2025-04-24 15:04:28', '1000000000000000001');
INSERT INTO `el_sys_user` (`id`, `user_name`, `real_name`, `avatar`, `password`, `salt`, `state`, `id_card`, `mobile`, `email`, `dept_code`, `create_time`, `create_by`, `update_time`, `update_by`) VALUES ('1914226980618383361', 'student', '云帆学员', 'https://be2.yfhl.net/upload/file/2025/04/24/1915311363890958337.jpeg', '57adae05a2485af81eaa722ac86f4f23', 'QvEQcj', 0, '', '', NULL, 'A01', '2025-04-21 15:57:31', '1000000000000000001', '2025-04-24 15:36:44', '1000000000000000001');
COMMIT;

-- ----------------------------
-- Table structure for el_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `el_sys_user_role`;
CREATE TABLE `el_sys_user_role` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户角色';

-- ----------------------------
-- Records of el_sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `el_sys_user_role` (`id`, `user_id`, `role_id`) VALUES ('1915227929898123265', '1914226980618383361', 'user');
INSERT INTO `el_sys_user_role` (`id`, `user_id`, `role_id`) VALUES ('1915300793024335873', '1000000000000000001', 'admin');
COMMIT;

-- ----------------------------
-- Table structure for pl_plugin_data
-- ----------------------------
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

-- ----------------------------
-- Records of pl_plugin_data
-- ----------------------------
BEGIN;
INSERT INTO `pl_plugin_data` (`id`, `code`, `title`, `schema_id`, `group_id`, `config_data`, `service_clazz`, `component`, `in_use`, `state`) VALUES ('10002', 'upload-local', '本地上传', 'upload_local', 'upload', '{\"localDir\":\"/data/upload/be2/\",\"visitUrl\":\"https://be2.yfhl.net\"}', 'com.yf.plugins.upload.local.service.impl.LocalUpServiceImpl', ' ', 1, '0');
COMMIT;

-- ----------------------------
-- Table structure for pl_plugin_group
-- ----------------------------
DROP TABLE IF EXISTS `pl_plugin_group`;
CREATE TABLE `pl_plugin_group` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分组名称',
  `single` tinyint DEFAULT NULL COMMENT '独立排斥',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='插件分组';

-- ----------------------------
-- Records of pl_plugin_group
-- ----------------------------
BEGIN;
INSERT INTO `pl_plugin_group` (`id`, `title`, `single`) VALUES ('upload', '上传组件', 1);
COMMIT;

-- ----------------------------
-- Table structure for pl_plugin_schema
-- ----------------------------
DROP TABLE IF EXISTS `pl_plugin_schema`;
CREATE TABLE `pl_plugin_schema` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `schema_data` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '元数据',
  `group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分组',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='插件元数据';

-- ----------------------------
-- Records of pl_plugin_schema
-- ----------------------------
BEGIN;
INSERT INTO `pl_plugin_schema` (`id`, `schema_data`, `group_id`) VALUES ('upload_aliyun', '[{\"title\":\"EndPoint\",\"name\":\"endPoint\",\"type\":\"text\"},{\"title\":\"Bucket\",\"name\":\"bucket\",\"type\":\"text\"},{\"title\":\"AccessKeyId\",\"name\":\"accessKeyId\",\"type\":\"text\"},{\"title\":\"AcccessKeySecret\",\"name\":\"acccessKeySecret\",\"type\":\"text\"},{\"title\":\"访问URL\",\"name\":\"visitUrl\",\"type\":\"text\"}]', 'upload');
INSERT INTO `pl_plugin_schema` (`id`, `schema_data`, `group_id`) VALUES ('upload_local', '[{\"title\":\"本地目录\",\"name\":\"localDir\",\"type\":\"text\"},{\"title\":\"访问地址\",\"name\":\"visitUrl\",\"type\":\"text\"}]', 'upload');
COMMIT;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
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

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
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

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_locks` (`SCHED_NAME`, `LOCK_NAME`) VALUES ('ExamScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` (`SCHED_NAME`, `LOCK_NAME`) VALUES ('examScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_scheduler_state` (`SCHED_NAME`, `INSTANCE_NAME`, `LAST_CHECKIN_TIME`, `CHECKIN_INTERVAL`) VALUES ('examScheduler', 'MacBook-Pro-16.local1745742094389', 1745827600288, 10000);
COMMIT;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
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

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
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

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
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

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
