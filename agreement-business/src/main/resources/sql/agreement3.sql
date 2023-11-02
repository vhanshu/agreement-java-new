/*
 Navicat MySQL Data Transfer

 Source Server         : LW-Mysql
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : agreement

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 02/11/2023 09:39:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for a_activity
-- ----------------------------
DROP TABLE IF EXISTS `a_activity`;
CREATE TABLE `a_activity`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '活动id',
  `user_id` int(0) NOT NULL COMMENT '发起者id',
  `cover` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '缩略图',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动主题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动内容',
  `people_number` int(0) NOT NULL COMMENT '与会人数',
  `time_start` datetime(0) NOT NULL COMMENT '开始时间',
  `time_end` datetime(0) NOT NULL COMMENT '结束时间',
  `status` tinyint(1) NOT NULL DEFAULT 2 COMMENT '状态 (1发出 2草稿 3完成 4过期 5取消)',
  `create_time` datetime(0) NOT NULL COMMENT '发表时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a_activity
-- ----------------------------
INSERT INTO `a_activity` VALUES (1, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '跑步', '彩虹跑', 100, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 14:27:52', '2023-07-31 17:00:39');
INSERT INTO `a_activity` VALUES (2, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '密室逃脱', '密室逃脱', 6, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 14:28:02', '2023-07-31 17:00:39');
INSERT INTO `a_activity` VALUES (3, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '剧本杀', '剧本杀', 12, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 14:29:41', '2023-07-31 17:00:39');
INSERT INTO `a_activity` VALUES (4, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '异装类', '假面舞会', 200, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 14:31:03', '2023-07-31 17:00:39');
INSERT INTO `a_activity` VALUES (5, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '异装类', '化妆舞会', 150, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 14:31:57', '2023-07-31 17:00:39');
INSERT INTO `a_activity` VALUES (6, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '展览', '手工艺术展', 300, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 14:33:06', '2023-07-31 17:00:39');
INSERT INTO `a_activity` VALUES (7, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '展览', '服装展', 300, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 14:34:09', '2023-07-31 17:00:39');
INSERT INTO `a_activity` VALUES (8, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '展览', '画展', 300, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 14:35:13', '2023-07-31 17:00:39');
INSERT INTO `a_activity` VALUES (9, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '派对', '沙滩派对', 400, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 14:36:22', '2023-07-31 17:00:40');
INSERT INTO `a_activity` VALUES (10, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '交易市场', '跳蚤市场', 500, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 15:00:51', '2023-07-31 17:00:40');
INSERT INTO `a_activity` VALUES (11, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '音乐会', '音乐会', 1000, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 15:04:23', '2023-07-31 17:00:40');
INSERT INTO `a_activity` VALUES (12, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '游玩', '迪士尼一日游', 6, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 15:07:29', '2023-07-31 17:00:40');
INSERT INTO `a_activity` VALUES (13, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '游玩', '农家乐采摘', 10, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 15:08:42', '2023-07-31 17:00:40');
INSERT INTO `a_activity` VALUES (14, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '展览', '服装展', 300, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 2, '2023-04-24 15:11:05', '2023-07-31 17:00:40');
INSERT INTO `a_activity` VALUES (15, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '密室逃脱-测试md', '## 1. 服务器配置\n\n- [ ] 2 核 4G（使用 ES 搜索策略）\n- [ ] 2 核 2G（使用 MySQL 搜素策略，关闭 ES、Canal）\n\n## 2. CentOS 安装 Docker\n\n官方网站上有各种环境下的 [安装指南](https://docs.docker.com/install/)，这里主要介绍 Docker CE 在 CentOS 上的安装。\n\n### 2.1 卸载（可选\n\n如果之前安装过旧版本的 Docker，可以使用下面命令卸载：\n\n```docker\nyum remove docker \\\n                  docker-client \\\n                 docker-client-latest \\\n                 docker-common \\\n                 docker-latest \\\n                docker-latest-logrotate \\\n                 docker-logrotate \\\n                 docker-engine\n```\n\n### 2.2 安装 Docker\n\n1. 安装 yum 工具\n\n```shell\n   yum install -y yum-utils   \n```\n2. 设置镜像仓库\n```shell   \nyum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo\n```\n', 8, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 15:13:33', '2023-07-31 17:00:40');

-- ----------------------------
-- Table structure for a_appointment
-- ----------------------------
DROP TABLE IF EXISTS `a_appointment`;
CREATE TABLE `a_appointment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '约会id',
  `user_id` int(0) NOT NULL COMMENT '发起者id',
  `cover` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '缩略图',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '约会主题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '约会内容',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '发出类型 (1广播 2指定)',
  `time_start` datetime(0) NOT NULL COMMENT '开始时间',
  `time_end` datetime(0) NOT NULL COMMENT '结束时间',
  `status` tinyint(1) NOT NULL DEFAULT 2 COMMENT '状态 (1发出 2草稿 3完成 4过期 5取消)',
  `create_time` datetime(0) NOT NULL COMMENT '发表时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a_appointment
-- ----------------------------
INSERT INTO `a_appointment` VALUES (1, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '约饭', '吃饭', 1, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 14:27:52', '2023-07-31 17:00:38');
INSERT INTO `a_appointment` VALUES (3, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '学习', '探讨作业', 1, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 14:29:41', '2023-08-01 10:44:17');
INSERT INTO `a_appointment` VALUES (4, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', '爬山', 1, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 14:31:03', '2023-07-31 17:00:39');
INSERT INTO `a_appointment` VALUES (5, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', '滑冰', 1, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 14:31:57', '2023-07-31 17:00:39');
INSERT INTO `a_appointment` VALUES (6, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', '露营', 1, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 14:33:06', '2023-07-31 17:00:39');
INSERT INTO `a_appointment` VALUES (7, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '爱意绽放，约会的翩跹!', '# 1.相遇\n> 在柔和的月光下，*两颗心灵相遇*，<u>仿佛宇宙间只剩下彼此的存在</u>。约会，是那一场美丽的邂逅，是爱意绽放的时刻，是浪漫与激情的交织。\n# 2.相知\n > 当时钟指向约定的时刻，他们在相约的地点相遇。她优雅地走来，如一朵盛开的花朵，洋溢着自信和魅力。他眼中闪烁着兴奋的光芒，怦然心动地注视着她的美丽。他们交换着温暖的微笑，仿佛世界为他们而停驻。\n# 3.相约\n> 他们选择了一座宁静的咖啡馆，暖黄色的灯光映衬出浪漫的氛围。坐在舒适的座位上，他们聆听着彼此的心跳声。他们的对话如流水般流淌，每个字都是相互吸引的磁场。他们分享着彼此的梦想、喜好和故事，每个瞬间都让彼此更加了解。\n# 4.相爱\n> 窗外的风轻轻吹拂着他们的脸庞，仿佛是爱神的轻抚。~他们决定漫步在月光下的街道上~，手牵手，相互依偎。无言的默契在他们之间流转，他们感受着对方的存在，彷佛是彼此心灵的镜像。\n# 5.相语\n> 这段约会是如此神往，如此长存，仿佛他们置身于童话中的世界。他们相信，这个特殊的约会只是他们故事的开始，他们的爱情将继续绽放，直至永恒！', 2, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 3, '2023-04-24 14:34:09', '2023-08-31 22:31:58');
INSERT INTO `a_appointment` VALUES (8, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', '玩卡丁车', 1, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 14:34:09', '2023-07-31 17:00:39');
INSERT INTO `a_appointment` VALUES (9, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', '射箭', 1, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 14:34:09', '2023-07-31 17:00:39');
INSERT INTO `a_appointment` VALUES (10, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', '攀岩', 1, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 14:34:09', '2023-07-31 17:00:39');
INSERT INTO `a_appointment` VALUES (11, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', '游玩动物园', 1, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 14:34:09', '2023-07-31 17:00:39');
INSERT INTO `a_appointment` VALUES (12, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', '听演唱会', 1, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 14:34:09', '2023-07-31 17:00:39');
INSERT INTO `a_appointment` VALUES (13, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', '踏春', 1, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 14:34:09', '2023-07-31 17:00:39');
INSERT INTO `a_appointment` VALUES (14, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', '插花', 1, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 14:34:09', '2023-07-31 17:00:39');
INSERT INTO `a_appointment` VALUES (15, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', '海边看日出日落', 1, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 2, '2023-04-24 14:34:09', '2023-07-31 17:00:39');
INSERT INTO `a_appointment` VALUES (16, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', '农家乐采摘', 1, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '2023-04-24 14:34:09', '2023-07-31 17:00:39');

-- ----------------------------
-- Table structure for a_competition
-- ----------------------------
DROP TABLE IF EXISTS `a_competition`;
CREATE TABLE `a_competition`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '赛事id',
  `user_id` int(0) NOT NULL COMMENT '发起者id',
  `cover` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '缩略图',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '赛事主题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '赛事内容',
  `people_number` int(0) NOT NULL COMMENT '参赛队人数',
  `time_start` datetime(0) NOT NULL COMMENT '开始时间',
  `time_end` datetime(0) NOT NULL COMMENT '结束时间',
  `is_wager` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否赌注 (0否 1是)',
  `wager_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '赌注内容',
  `status` tinyint(1) NOT NULL DEFAULT 2 COMMENT '状态 (1发出 2草稿 3完成 4过期 5取消)',
  `create_time` datetime(0) NOT NULL COMMENT '发表时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a_competition
-- ----------------------------
INSERT INTO `a_competition` VALUES (1, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '嘉院好声音', '唱歌比赛', 20, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 0, NULL, 1, '2023-04-24 14:27:52', '2023-07-31 17:00:40');
INSERT INTO `a_competition` VALUES (2, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '热血正青春', '篮球比赛', 12, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 0, NULL, 1, '2023-04-24 14:28:02', '2023-07-31 17:00:40');
INSERT INTO `a_competition` VALUES (3, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '我和嘉院春天有个约会', '摄影比赛', 50, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 0, NULL, 1, '2023-04-24 14:29:41', '2023-07-31 17:00:40');
INSERT INTO `a_competition` VALUES (4, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', 'RUN的味道', '800米接力赛', 15, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 0, NULL, 1, '2023-04-24 14:31:03', '2023-07-31 17:00:40');
INSERT INTO `a_competition` VALUES (5, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '大学生英语竞赛', '英语比赛', 400, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 0, NULL, 1, '2023-04-24 14:31:57', '2023-07-31 17:00:40');
INSERT INTO `a_competition` VALUES (6, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '“挑战杯”中国大学生创业计划竞赛', '创业计划', 200, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 0, NULL, 1, '2023-04-24 14:33:06', '2023-07-31 17:00:40');
INSERT INTO `a_competition` VALUES (7, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '高数竞赛', '高数比赛', 100, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 0, NULL, 1, '2023-04-24 14:34:09', '2023-07-31 17:00:40');
INSERT INTO `a_competition` VALUES (8, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '出路', '说唱比赛', 30, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 0, NULL, 1, '2023-04-24 14:35:13', '2023-07-31 17:00:40');
INSERT INTO `a_competition` VALUES (9, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '迟到的正义是/不是正义', '辩论赛', 32, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 0, NULL, 1, '2023-04-24 14:36:22', '2023-07-31 17:00:40');
INSERT INTO `a_competition` VALUES (10, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '校园达人秀', '自我技能的展示', 25, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 0, NULL, 1, '2023-04-24 15:00:51', '2023-07-31 17:00:40');
INSERT INTO `a_competition` VALUES (11, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '校园二手商品交易会', '商品交易', 100, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 0, NULL, 2, '2023-04-24 15:04:23', '2023-07-31 17:00:40');
INSERT INTO `a_competition` VALUES (12, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '趣味运动会', '团队合作', 60, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '团队第一名：0.1学分', 1, '2023-04-24 15:07:29', '2023-07-31 17:00:40');
INSERT INTO `a_competition` VALUES (13, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '舞出人生', '舞蹈比赛', 30, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '第一名：DIY花束；第二名：奶茶；第三名：钥匙扣', 1, '2023-04-24 15:08:42', '2023-07-31 17:00:40');
INSERT INTO `a_competition` VALUES (14, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '大学生新媒体创意大赛', '学校宣传数字专刊创作', 500, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '\r\n\r\n优秀传播奖1部：奖金1000元', 1, '2023-04-24 15:11:05', '2023-07-31 17:00:40');
INSERT INTO `a_competition` VALUES (15, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '你问我答', '同学默契比拼', 30, '2024-07-04 18:27:36', '2024-09-01 18:27:36', 1, '第一名：雨伞；第二名：水杯；第三名：手持风扇', 1, '2023-04-24 15:13:33', '2023-07-31 17:00:40');

-- ----------------------------
-- Table structure for a_help
-- ----------------------------
DROP TABLE IF EXISTS `a_help`;
CREATE TABLE `a_help`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '帮忙id',
  `user_id` int(0) NOT NULL COMMENT '发起者id',
  `cover` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '缩略图',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '帮忙主题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '帮忙内容',
  `people_number` int(0) NOT NULL COMMENT '需要人数',
  `time_start` datetime(0) NOT NULL COMMENT '开始时间',
  `time_end` datetime(0) NOT NULL COMMENT '结束时间',
  `reward` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '报酬',
  `status` tinyint(1) NOT NULL DEFAULT 2 COMMENT '状态 (1发出 2草稿 3完成 4过期 5取消)',
  `create_time` datetime(0) NOT NULL COMMENT '发表时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a_help
-- ----------------------------
INSERT INTO `a_help` VALUES (1, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '代写', '写作', 2, '2024-07-04 18:27:36', '2024-09-01 18:27:36', '30元', 1, '2023-04-24 14:27:52', '2023-07-31 17:00:41');
INSERT INTO `a_help` VALUES (2, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '代拿', '拿快递', 2, '2024-07-04 18:27:36', '2024-09-01 18:27:36', '2元', 1, '2023-04-24 14:28:02', '2023-07-31 17:00:41');
INSERT INTO `a_help` VALUES (3, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '代购', '买东西', 1, '2024-07-04 18:27:36', '2024-09-01 18:27:36', '5元', 1, '2023-04-24 14:29:41', '2023-07-31 17:00:41');
INSERT INTO `a_help` VALUES (4, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '代跑', '咕咚', 1, '2024-07-04 18:27:36', '2024-09-01 18:27:36', '1.5元', 1, '2023-04-24 14:31:03', '2023-07-31 17:00:41');
INSERT INTO `a_help` VALUES (5, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '搬东西', '行李', 2, '2024-07-04 18:27:36', '2024-09-01 18:27:36', '10元', 1, '2023-04-24 14:31:57', '2023-07-31 17:00:41');
INSERT INTO `a_help` VALUES (6, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '猫', '照顾校内流浪猫', 3, '2024-07-04 18:27:36', '2024-09-01 18:27:36', NULL, 1, '2023-04-24 14:33:06', '2023-07-31 17:00:41');
INSERT INTO `a_help` VALUES (7, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '调研', '写问卷', 500, '2024-07-04 18:27:36', '2024-09-01 18:27:36', NULL, 1, '2023-04-24 14:34:09', '2023-07-31 17:00:41');
INSERT INTO `a_help` VALUES (8, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '投票', '投票', 25, '2024-07-04 18:27:36', '2024-09-01 18:27:36', NULL, 1, '2023-04-24 14:35:13', '2023-07-31 17:00:41');
INSERT INTO `a_help` VALUES (9, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '   作品', '点赞', 30, '2024-07-04 18:27:36', '2024-09-01 18:27:36', NULL, 1, '2023-04-24 14:36:22', '2023-07-31 17:00:41');
INSERT INTO `a_help` VALUES (10, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '调查', '问答题', 10, '2024-07-04 18:27:36', '2024-09-01 18:27:36', NULL, 2, '2023-04-24 15:00:51', '2023-07-31 17:00:41');
INSERT INTO `a_help` VALUES (11, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '宣传校园APP', '发传单', 5, '2024-07-04 18:27:36', '2024-09-01 18:27:36', '15元/1小时', 1, '2023-04-24 15:04:23', '2023-07-31 17:00:41');
INSERT INTO `a_help` VALUES (12, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '跑腿', '拿外卖', 1, '2024-07-04 18:27:36', '2024-09-01 18:27:36', '2元', 1, '2023-04-24 15:07:29', '2023-07-31 17:00:41');
INSERT INTO `a_help` VALUES (13, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '校园采访', '对于校园的了解度', 10, '2024-07-04 18:27:36', '2024-09-01 18:27:36', NULL, 1, '2023-04-24 15:08:42', '2023-07-31 17:00:41');
INSERT INTO `a_help` VALUES (14, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '学风督查', '志愿者', 2, '2024-07-04 18:27:36', '2024-09-01 18:27:36', '3个志愿时', 1, '2023-04-24 15:11:05', '2023-07-31 17:00:41');
INSERT INTO `a_help` VALUES (15, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '多媒体应用作业', '多媒体点赞、评论', 60, '2024-07-04 18:27:36', '2024-09-01 18:27:36', NULL, 1, '2023-04-24 15:13:33', '2023-07-31 17:00:41');

-- ----------------------------
-- Table structure for c_friend
-- ----------------------------
DROP TABLE IF EXISTS `c_friend`;
CREATE TABLE `c_friend`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '用户id',
  `friend_id` int(0) NULL DEFAULT NULL COMMENT '好友id',
  `friend_remark` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '好友备注',
  `is_delete` int(0) NULL DEFAULT 0 COMMENT '是否删除(0否 1是)',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '好友' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_friend
-- ----------------------------
INSERT INTO `c_friend` VALUES (1, 1, 2, '测试方', 0, '2023-05-24 11:35:04', '2023-09-01 20:50:11');
INSERT INTO `c_friend` VALUES (2, 2, 1, 'V函数', 0, '2023-08-24 10:41:54', '2023-09-01 20:49:31');
INSERT INTO `c_friend` VALUES (3, 1, 3, '内测方', 0, '2023-05-24 20:29:56', NULL);
INSERT INTO `c_friend` VALUES (4, 3, 1, 'V函数', 0, '2023-05-24 20:29:56', NULL);

-- ----------------------------
-- Table structure for c_group
-- ----------------------------
DROP TABLE IF EXISTS `c_group`;
CREATE TABLE `c_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '群名称',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '缩略图',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '群描述',
  `master_id` int(0) NOT NULL COMMENT '群主id',
  `is_delete` int(0) NULL DEFAULT 1 COMMENT '是否解散(0否 1是)',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '群组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_group
-- ----------------------------
INSERT INTO `c_group` VALUES (1, '约起联盟', 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/vhans.jpg', '约起联盟专属群,内部人员交流群', 1, 0, '2023-08-31 16:57:17', NULL);
INSERT INTO `c_group` VALUES (2, '约起内测', 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/vhans.jpg', '约起内测专属群,内部人员交流群', 1, 0, '2023-08-31 16:57:17', NULL);

-- ----------------------------
-- Table structure for c_group_msg
-- ----------------------------
DROP TABLE IF EXISTS `c_group_msg`;
CREATE TABLE `c_group_msg`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `from_uid` int(0) NOT NULL COMMENT '用户id',
  `to_uid` int(0) NULL DEFAULT NULL COMMENT '群id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息内容(可以是文件名)',
  `file_id` int(0) NULL DEFAULT 0 COMMENT '文件id',
  `msg_type` tinyint(1) NULL DEFAULT 1 COMMENT '类型(0系统 1文本 2文件 3图片 4视频)',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '群聊天信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_group_msg
-- ----------------------------
INSERT INTO `c_group_msg` VALUES (1, 1, 1, '好不好嘛?!', 0, 1, '2023-05-22 22:44:12', NULL);
INSERT INTO `c_group_msg` VALUES (2, 1, 1, '到底好不好嘛?!', 0, 1, '2023-05-23 09:51:40', NULL);
INSERT INTO `c_group_msg` VALUES (3, 2, 1, '测试账号加入群,热烈欢迎', 0, 0, '2023-05-24 20:29:56', NULL);
INSERT INTO `c_group_msg` VALUES (4, 2, 1, '不好!', 0, 1, '2023-05-25 18:47:07', NULL);
INSERT INTO `c_group_msg` VALUES (5, 1, 2, '创建约起内测群，欢迎大家入群', 0, 1, '2023-10-07 13:58:35', NULL);
INSERT INTO `c_group_msg` VALUES (23, 1, 1, '热热热', 0, 1, '2023-10-08 09:21:52', NULL);
INSERT INTO `c_group_msg` VALUES (25, 1, 2, 'ubuntu-18.04.6-live-server-amd64.iso', 278, 2, '2023-10-09 14:23:36', NULL);
INSERT INTO `c_group_msg` VALUES (26, 2, 1, '现在变冷啦', 0, 1, '2023-10-09 19:38:04', NULL);
INSERT INTO `c_group_msg` VALUES (27, 1, 1, '就是的，一晚上直接大降温', 0, 1, '2023-10-09 19:38:32', NULL);
INSERT INTO `c_group_msg` VALUES (28, 2, 1, '嘉兴的天气真难料😂', 0, 1, '2023-10-09 19:41:23', NULL);
INSERT INTO `c_group_msg` VALUES (29, 2, 1, '讲个笑话\n$$\n1+1=3\n$$', 0, 1, '2023-10-09 19:42:00', NULL);
INSERT INTO `c_group_msg` VALUES (30, 1, 1, '不对,代码证明1+1=2\n```java\nSystem.out.println(\"1+1=\" + (1 + 1));\n```', 0, 1, '2023-10-09 19:44:22', NULL);
INSERT INTO `c_group_msg` VALUES (31, 2, 1, '我不服，你能用论文证明我就信', 0, 1, '2023-10-09 19:46:52', NULL);
INSERT INTO `c_group_msg` VALUES (32, 1, 1, '1+1证明论文.docx', 286, 2, '2023-10-09 19:49:10', NULL);
INSERT INTO `c_group_msg` VALUES (33, 2, 1, '骗子，是空的', 0, 1, '2023-10-09 19:49:50', NULL);
INSERT INTO `c_group_msg` VALUES (34, 1, 1, '我不管，是你先骗我1+1=3的', 0, 1, '2023-10-09 19:50:28', NULL);
INSERT INTO `c_group_msg` VALUES (35, 1, 1, '🤪', 0, 1, '2023-10-09 19:50:38', NULL);
INSERT INTO `c_group_msg` VALUES (36, 2, 1, '🤐😡😡😡', 0, 1, '2023-10-09 19:51:35', NULL);
INSERT INTO `c_group_msg` VALUES (37, 1, 1, '走啦，自己慢慢想1+1证明才能等于3吧', 0, 1, '2023-10-09 19:52:37', NULL);
INSERT INTO `c_group_msg` VALUES (38, 2, 1, '哼', 0, 1, '2023-10-09 19:54:27', NULL);
INSERT INTO `c_group_msg` VALUES (39, 2, 1, '走着瞧', 0, 1, '2023-10-09 19:54:47', NULL);
INSERT INTO `c_group_msg` VALUES (59, 1, 1, 'basketball.jpg', 287, 3, '2023-10-12 18:36:06', NULL);
INSERT INTO `c_group_msg` VALUES (60, 1, 1, 'running.jpg', 288, 3, '2023-10-12 18:36:06', NULL);
INSERT INTO `c_group_msg` VALUES (61, 1, 1, 'snow.jpg', 289, 3, '2023-10-12 18:36:06', NULL);
INSERT INTO `c_group_msg` VALUES (62, 1, 1, 'study.jpg', 290, 3, '2023-10-12 18:36:06', NULL);
INSERT INTO `c_group_msg` VALUES (63, 1, 1, 'escaperoom.jpg', 291, 3, '2023-10-12 18:36:06', NULL);
INSERT INTO `c_group_msg` VALUES (64, 1, 1, '我的推荐记录图片', 0, 1, '2023-10-12 20:05:58', NULL);
INSERT INTO `c_group_msg` VALUES (109, 1, 1, 'img-1621147582022dc73ebb2880194d7b39be07d65ac44c5.jpg', 294, 3, '2023-10-19 21:26:25', NULL);
INSERT INTO `c_group_msg` VALUES (110, 1, 1, 'img-1621149429867f9cc76d0d6f11696a045b12dac98713d.jpg', 295, 3, '2023-10-19 21:26:25', NULL);
INSERT INTO `c_group_msg` VALUES (111, 1, 1, 'img-1621297259083bc8a078a8b6abb7a402f00666e2749f1.jpg', 296, 3, '2023-10-19 21:26:25', NULL);
INSERT INTO `c_group_msg` VALUES (112, 1, 1, 'b99b51e6c7945c9d5565861d397451cb_preview.mp4', 265, 2, '2023-10-27 17:26:59', NULL);

-- ----------------------------
-- Table structure for c_group_user
-- ----------------------------
DROP TABLE IF EXISTS `c_group_user`;
CREATE TABLE `c_group_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_id` int(0) NOT NULL COMMENT '群id',
  `user_id` int(0) NOT NULL COMMENT '用户id',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '成员称呼',
  `view_time` datetime(0) NULL DEFAULT NULL COMMENT '最近访问时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '群与用户关联' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_group_user
-- ----------------------------
INSERT INTO `c_group_user` VALUES (1, 1, 1, 'V函数', '2023-10-27 17:29:36');
INSERT INTO `c_group_user` VALUES (2, 1, 2, '测试者', '2023-10-10 16:45:48');
INSERT INTO `c_group_user` VALUES (3, 1, 3, '内测者', '2023-09-25 18:18:46');
INSERT INTO `c_group_user` VALUES (4, 2, 1, 'V函数', '2023-10-27 08:44:20');
INSERT INTO `c_group_user` VALUES (5, 2, 3, '内测者', '2023-10-03 20:33:02');

-- ----------------------------
-- Table structure for c_msg
-- ----------------------------
DROP TABLE IF EXISTS `c_msg`;
CREATE TABLE `c_msg`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `from_uid` int(0) NOT NULL COMMENT '发出用户id',
  `to_uid` int(0) NOT NULL COMMENT '目标用户id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '内容(可以是文件名)',
  `file_id` int(0) NULL DEFAULT 0 COMMENT '文件id',
  `msg_type` tinyint(1) NULL DEFAULT 1 COMMENT '类型(0系统 1文本 2文件 3图片 4视频)',
  `is_read` tinyint(1) NULL DEFAULT 0 COMMENT '是否读取(0否 1是)',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '查看时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 748 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户聊天信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_msg
-- ----------------------------
INSERT INTO `c_msg` VALUES (1, 1, 2, '你好,我是vhans', 0, 1, 1, '2023-09-30 11:41:12', NULL);
INSERT INTO `c_msg` VALUES (2, 2, 1, '你好,我是测试者', 0, 1, 1, '2023-10-03 11:41:56', NULL);
INSERT INTO `c_msg` VALUES (3, 1, 2, '不错的名字', 0, 1, 1, '2023-10-03 11:42:06', NULL);
INSERT INTO `c_msg` VALUES (4, 2, 1, '哈哈哈', 0, 1, 1, '2023-10-03 11:42:27', NULL);
INSERT INTO `c_msg` VALUES (5, 2, 1, '你的🍀个人简介\n本站作者幽默风趣，风度翩翩，人见人爱，花见花开，车见车载，宇宙无敌霹雳最最最帅气美男子，欢迎小姐姐通过各种手段加本人微信，通通通过，机不可失，失不再来。\r\n前面开玩笑，现在郑重介绍一下本人，吸纳无尽知识，成就编程之神，手撕源码，徒脚造轮子，反正我无敌，你们随意。\n最后，感谢大佬们的开源精神！💖', 0, 1, 1, '2023-10-03 11:42:49', NULL);
INSERT INTO `c_msg` VALUES (6, 1, 2, '承让了,我有急事,改天再聊', 0, 1, 1, '2023-10-03 11:43:48', NULL);
INSERT INTO `c_msg` VALUES (7, 2, 1, '好,再见', 0, 1, 1, '2023-10-03 11:45:08', '2023-10-04 18:53:41');
INSERT INTO `c_msg` VALUES (8, 3, 1, '我是测试员', 0, 1, 1, '2023-09-25 17:47:30', '2023-10-04 20:44:32');
INSERT INTO `c_msg` VALUES (12, 1, 2, 'jebrains破解补丁+CLion激活码20221110.zip', 9, 2, 1, '2023-10-07 09:42:00', '2023-10-09 19:24:02');
INSERT INTO `c_msg` VALUES (635, 1, 2, '我成功了', 0, 1, 1, '2023-10-07 20:08:49', '2023-10-09 19:24:02');
INSERT INTO `c_msg` VALUES (664, 1, 3, '我是V函数', 0, 1, 0, '2023-10-08 09:22:18', NULL);
INSERT INTO `c_msg` VALUES (673, 1, 2, '😒😏', 0, 1, 1, '2023-10-08 21:48:51', '2023-10-09 19:24:02');
INSERT INTO `c_msg` VALUES (679, 1, 2, 'img-1618103506002a70f03c6f7ab9a41a14c5211103816e3.jpg', 255, 3, 1, '2023-10-09 13:46:47', '2023-10-09 19:24:02');
INSERT INTO `c_msg` VALUES (694, 1, 2, '测试文件.java', 260, 2, 1, '2023-10-09 16:18:28', '2023-10-09 19:24:02');
INSERT INTO `c_msg` VALUES (713, 1, 2, '正式完工🥰😄🥰🥰', 0, 1, 1, '2023-10-09 19:35:55', '2023-10-09 20:03:36');
INSERT INTO `c_msg` VALUES (714, 2, 1, '🤪优秀啊，我的哥', 0, 1, 1, '2023-10-09 19:36:33', '2023-10-09 20:16:20');
INSERT INTO `c_msg` VALUES (715, 1, 2, '谬赞了', 0, 1, 1, '2023-10-09 19:36:53', '2023-10-09 20:03:36');
INSERT INTO `c_msg` VALUES (740, 1, 2, '😄😆😆🤭', 0, 1, 0, '2023-10-21 23:06:08', NULL);
INSERT INTO `c_msg` VALUES (741, 1, 2, '你好啊', 0, 1, 0, '2023-10-21 23:06:23', NULL);
INSERT INTO `c_msg` VALUES (742, 1, 2, '你好啊,mark😀😀😄🙄🙄🥲🥲\n🤔🤔😏😘😘😘', 0, 1, 0, '2023-10-21 23:07:25', NULL);
INSERT INTO `c_msg` VALUES (743, 1, 2, 'b99b51e6c7945c9d5565861d397451cb_preview.mp4', 265, 2, 0, '2023-10-21 23:08:04', NULL);
INSERT INTO `c_msg` VALUES (744, 1, 2, 'img-16187904129577db561041d9c67baa9b8c2b075e09e4b.jpg', 297, 3, 0, '2023-10-21 23:08:04', NULL);

-- ----------------------------
-- Table structure for c_request
-- ----------------------------
DROP TABLE IF EXISTS `c_request`;
CREATE TABLE `c_request`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `from_uid` int(0) NOT NULL COMMENT '请求用户id',
  `to_uid` int(0) NOT NULL COMMENT '目标用户id',
  `type` tinyint(1) NULL DEFAULT 1 COMMENT '请求类型(1好友 2群聊)',
  `status` tinyint(1) NULL DEFAULT 3 COMMENT '请求状态(1通过 2已拒绝 3申请中)',
  `is_look` tinyint(1) NULL DEFAULT 0 COMMENT '是否查看(0否 1是)',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求理由',
  `group_id` int(0) NULL DEFAULT NULL COMMENT '群id',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '好友请求' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of c_request
-- ----------------------------
INSERT INTO `c_request` VALUES (1, 2, 1, 1, 3, 0, '我可是测试者，加一个', NULL, '2023-05-31 17:06:46', NULL);
INSERT INTO `c_request` VALUES (2, 2, 1, 2, 1, 1, '我来测试群信息了，同意一下', 1, '2023-05-31 17:08:16', NULL);
INSERT INTO `c_request` VALUES (3, 1, 2, 1, 3, 0, '我是主号，加上我', NULL, '2023-10-03 19:52:39', NULL);

-- ----------------------------
-- Table structure for d_agree_record
-- ----------------------------
DROP TABLE IF EXISTS `d_agree_record`;
CREATE TABLE `d_agree_record`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `user_id` int(0) NOT NULL COMMENT '记录者id',
  `cover` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '记录缩略图',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '记录标题',
  `type` tinyint(0) NOT NULL COMMENT '记录类型(1约会 2活动 3赛事 4帮忙)',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '记录内容',
  `images` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '记录图片',
  `video` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '记录视频',
  `like_number` int(0) NULL DEFAULT 0 COMMENT '点赞数',
  `collect_number` int(0) NULL DEFAULT 0 COMMENT '收藏数',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态(1公开 2私密 3草稿)',
  `is_check` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否通过 (0否 1是)',
  `is_top` tinyint(1) NULL DEFAULT 0 COMMENT '是否置顶(0否 1是)',
  `is_recommend` tinyint(1) NULL DEFAULT 0 COMMENT '是否推荐(0否 1是)',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除(0否 1是)',
  `create_time` datetime(0) NOT NULL COMMENT '记录时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_agree_record
-- ----------------------------
INSERT INTO `d_agree_record` VALUES (1, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(1).jpg', '代写', 4, '写作', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(1).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(2).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(3).jpg', '', 0, 0, 1, 1, 1, 0, 0, '2023-04-25 07:20:50', '2023-05-04 08:00:57');
INSERT INTO `d_agree_record` VALUES (3, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(4).jpg', '代拿', 4, '拿快递', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(4).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(5).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(6).jpg', '', 0, 1, 1, 0, 0, 1, 0, '2023-04-25 07:44:51', '2023-05-04 08:03:35');
INSERT INTO `d_agree_record` VALUES (4, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(7).jpg', '代购', 4, '买东西', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(7).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(8).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(9).jpg', NULL, 0, 0, 1, 1, 0, 0, 1, '2023-04-25 07:45:27', NULL);
INSERT INTO `d_agree_record` VALUES (5, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(10).jpg', '代跑', 4, '咕咚', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(10).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(11).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(12).jpg', NULL, 0, 0, 1, 0, 0, 0, 0, '2023-04-25 07:46:40', NULL);
INSERT INTO `d_agree_record` VALUES (6, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(13).jpg', '搬东西', 4, '行李', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(13).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(14).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(15).jpg', NULL, 0, 0, 1, 1, 0, 0, 0, '2023-04-25 17:14:22', NULL);
INSERT INTO `d_agree_record` VALUES (7, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(17).jpg', '猫', 4, '照顾校内流浪猫', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(17).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(18).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(19).jpg', NULL, 0, 0, 1, 1, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (8, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(20).jpg', '调研', 4, '写问卷', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(20).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(21).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(22).jpg', NULL, 0, 0, 1, 1, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (9, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(23).jpg', '投票', 4, '投票', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(23).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(16).jpg', NULL, 0, 0, 2, 1, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (10, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(1).jpg', '作品', 4, '点赞', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(1).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(2).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(3).jpg', NULL, 0, 0, 3, 0, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (11, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(4).jpg', '调查', 4, '问答题', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(4).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(5).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(6).jpg', NULL, 0, 0, 3, 1, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (12, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(7).jpg', '唱歌比赛', 3, '嘉院好声音', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(7).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(8).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(9).jpg', '', 0, 0, 1, 0, 1, 0, 0, '2023-04-26 14:31:43', '2023-05-04 08:01:21');
INSERT INTO `d_agree_record` VALUES (13, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(10).jpg', '篮球比赛', 3, '热血正青春', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(10).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(11).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(12).jpg', '', 0, 1, 1, 1, 0, 1, 0, '2023-04-26 14:31:43', '2023-05-04 08:03:55');
INSERT INTO `d_agree_record` VALUES (14, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(13).jpg', '摄影比赛', 3, '我和嘉院春天有个约会', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(13).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(14).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(15).jpg', NULL, 0, 0, 1, 1, 0, 0, 1, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (15, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(17).jpg', '800米接力赛', 3, 'RUN的味道', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(17).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(18).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(19).jpg', NULL, 0, 0, 1, 1, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (16, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(20).jpg', '英语比赛', 3, '大学生英语竞赛', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(20).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(21).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(22).jpg', NULL, 0, 0, 1, 1, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (17, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(23).jpg', '创业计划', 3, '“挑战杯”中国大学生创业计划竞赛', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(23).jpg', NULL, 0, 0, 1, 0, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (18, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(1).jpg', '高数比赛', 3, '高数竞赛', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(1).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(2).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(3).jpg', NULL, 0, 0, 1, 1, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (19, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(4).jpg', '说唱比赛', 3, '秀出自我', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(4).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(5).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(6).jpg', NULL, 0, 0, 2, 0, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (20, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(7).jpg', '辩论赛', 3, '迟到的正义是/不是正义', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(7).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(8).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(9).jpg', NULL, 0, 0, 3, 1, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (21, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(10).jpg', '自我技能的展示', 3, '校园达人秀', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(10).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(11).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(12).jpg', NULL, 0, 0, 3, 1, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (22, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(13).jpg', '有益的跑步活动，健康生活一辈子，家人们跑起来', 2, '跑步', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(13).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(14).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(15).jpg', NULL, 0, 0, 1, 1, 1, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (23, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(17).jpg', '密室逃脱', 2, '密室逃脱', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(17).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(18).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(19).jpg', '', 0, 1, 1, 1, 0, 1, 0, '2023-04-26 14:31:43', '2023-05-04 08:02:46');
INSERT INTO `d_agree_record` VALUES (24, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(20).jpg', '剧本杀', 2, '剧本杀', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(20).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(21).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(22).jpg', NULL, 0, 0, 1, 0, 0, 0, 1, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (25, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(23).jpg', '异装类', 2, '异装类', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(23).jpg', NULL, 0, 0, 1, 1, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (26, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(7).jpg', '异装类', 2, '异装类', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(7).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(8).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(9).jpg', NULL, 0, 0, 1, 0, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (27, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(1).jpg', '博物馆之旅', 2, '展览', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(1).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(2).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(3).jpg', NULL, 0, 0, 1, 1, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (28, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(4).jpg', '夜行族，快来加入我们吧', 2, '# 夜行族，快来加入我们吧\r\n\r\n![夜行族](https://images.unsplash.com/photo-1698778393905-526feea681f7?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8fA%3D%3D)\r\n\r\n夜行族欢迎你的加入！我们是一个热衷于夜间活动的群体，无论是夜生活、社交聚会，还是特定兴趣爱好，我们都追求独特的夜晚体验。\r\n\r\n## 我们的活动\r\n\r\n- 夜生活派对\r\n- 夜景摄影探险\r\n- 电影院午夜场\r\n- 游戏之夜\r\n\r\n## 如何加入我们\r\n\r\n如果你对夜晚的魅力充满好奇，想和有趣的人一起度过夜晚，那么快来加入我们吧！无论你是新手还是夜猫子，我们都欢迎你的加入。\r\n\r\n请联系我们，了解更多关于我们的活动和成员信息。一起探索夜晚的精彩吧！\r\n\r\n[联系我们](mailto:your-email@example.com)\r\n\r\n![夜晚的魅力](https://images.unsplash.com/photo-1698694326956-026c3f4c986b?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyN3x8fGVufDB8fHx8fA%3D%3D)\r\n', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(4).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(5).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(6).jpg', NULL, 0, 0, 1, 1, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (29, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(7).jpg', '时尚服装展览秀', 2, '# 时尚服装展览秀\r\n\r\n时尚服装展览秀是时尚界的盛大活动，汇聚了设计师、模特、媒体和时尚爱好者，展示了最新的时尚趋势和创意设计。这些展览秀不仅令人陶醉于美丽的服装，还为人们提供了一个了解时尚产业的机会。\r\n\r\n## 创意与艺术\r\n\r\n时尚服装展览秀是时尚设计师展示他们的创意和艺术的平台。设计师们通过服装来表达自己的视觉和设计理念，展示出各种风格，从经典到前卫。观众们能够欣赏到独特的时尚作品，这些作品融合了创新、艺术和个性。\r\n\r\n## 模特的魅力\r\n\r\n时尚展览秀的另一个亮点是模特的魅力。他们走上T台，将设计师的作品展示得栩栩如生。模特们的步伐、表情和姿态都是展览秀的一部分，能够吸引观众的目光。他们扮演了时尚界的形象代言人，为服装赋予生命。\r\n\r\n## 时尚趋势的窗口\r\n\r\n时尚服装展览秀也是时尚趋势的窗口。观众们可以在展览秀中看到未来季节的时尚趋势，了解最新的流行元素和颜色。这有助于人们更好地理解时尚产业的发展方向，从中获取灵感。\r\n\r\n## 结语\r\n\r\n时尚服装展览秀是一场融合了创意、艺术和时尚的盛大活动。它不仅展示了时尚设计师的天赋，还吸引了时尚爱好者和行业专业人士的关注。无论是在T台上的服装还是模特的魅力，都让人陶醉其中，为时尚产业注入了新的活力。\r\n\r\n愿每一个时尚服装展览秀都充满创意和美丽，成为时尚界的一场盛宴。\r\n', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(7).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(8).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(9).jpg', NULL, 0, 0, 2, 1, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (30, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(10).jpg', '泳池派对和比基尼小姐姐', 2, '# 泳池派对和比基尼小姐姐\r\n\r\n夏天到了，阳光明媚，人们纷纷涌向泳池，享受水上乐趣。泳池派对成为了时下最流行的娱乐活动之一，吸引着年轻人和游客们。而在这些泳池派对中，比基尼小姐姐们无疑是派对的焦点。\r\n\r\n## 泳池派对：夏日欢乐\r\n\r\n泳池派对通常在度假村、酒店或私人泳池中举行。它们提供了一个绝佳的机会，让人们在炎热的夏天中放松身心，畅游清凉的泳池水中。音乐、美食、饮料和各种水上游戏使派对更加有趣。泳池边的躺椅和遮阳伞提供了一个理想的地方，供人们休息和晒太阳。\r\n\r\n## 比基尼小姐姐：时尚与美丽\r\n\r\n泳池派对的一大特点就是出现在派对中的比基尼小姐姐们。她们穿着各种时尚的比基尼，展示出健康、活力和美丽。比基尼小姐姐们通常来自各个地方，带来不同的风格和魅力，给派对增色不少。\r\n\r\n比基尼小姐姐们不仅是时尚的代表，还是派对的生力军。她们参与各种游戏和活动，与其他派对参与者一同欢度时光。她们也常常与大家分享美容秘诀和健康生活方式，成为了鼓舞人心的偶像。\r\n\r\n## 结语\r\n\r\n泳池派对和比基尼小姐姐们成为了夏季的不可或缺的元素。这些活动为人们提供了放松、社交和享受夏日的机会。无论你是寻求休闲还是寻找时尚灵感，泳池派对和比基尼小姐姐们都将为你带来难忘的夏日体验。\r\n\r\n愿你度过一个美好的夏季，充满阳光、欢笑和泳池派对的回忆。\r\n', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(10).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(11).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(12).jpg', NULL, 0, 0, 3, 1, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (31, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(13).jpg', '校园跳蚤市场，用你的陋室，高歌一曲吧', 2, '交易市场', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(13).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(14).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(15).jpg', NULL, 0, 0, 3, 0, 1, 1, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (32, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(17).jpg', '约饭', 1, '吃饭', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(17).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(18).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(19).jpg', '', 0, 0, 1, 1, 1, 0, 0, '2023-04-26 14:31:43', '2023-05-01 17:46:20');
INSERT INTO `d_agree_record` VALUES (33, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(20).jpg', '学习', 1, '探讨作业', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(20).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(21).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(22).jpg', '', 0, 0, 1, 0, 0, 1, 0, '2023-04-26 14:31:43', '2023-05-04 08:02:06');
INSERT INTO `d_agree_record` VALUES (34, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(23).jpg', '爬山之旅', 1, '日期： 2023 年 10 月 14 日\r\n\r\n地点： 雪山国家公园，新威尔士州\r\n\r\n天气： 晴朗，气温 20°C\r\n\r\n队伍成员： 我自己、朋友 A、朋友 B\r\n\r\n早上 6:00 AM： 我们在雪山国家公园的停车场集合，充满期待地准备开始今天的爬山冒险。我们的目标是徒步登顶雪山峰，这是一座海拔 2,228 米的高峰，被誉为新威尔士州最高峰。\r\n\r\n早上 7:00 AM： 我们开始了徒步旅行，一路穿越葱郁的森林，听着鸟儿的歌声，感受着清新的空气。山路逐渐陡峭，我们需要不断攀爬，但美丽的风景让我们感到充满动力。\r\n\r\n上午 10:00 AM： 终于到达了第一个休息点，我们在一个小溪旁休息，品尝自带的午餐。这里的景色如画，远处的山脉在阳光下闪耀。\r\n\r\n上午 11:30 AM： 继续前行，我们开始感受到空气变得稀薄，而且温度下降。山上的气氛与森林大不相同，光秃秃的山顶在眼前。\r\n\r\n下午 1:00 PM： 终于达到了山顶！我们感到兴奋和骄傲，同时也感到一丝疲惫。站在峰顶，我们可以看到远处的山脉、湖泊和城市，这一切都令人叹为观止。\r\n\r\n下午 3:00 PM： 我们开始下山，这次是一场全新的挑战。陡峭的山坡和崎岖的道路让下行更加困难，但我们小心翼翼地前行。\r\n\r\n傍晚 6:00 PM： 最后我们平安无事地返回了停车场。我们感到疲惫但充实，这一天的爬山之旅让我们收获了难忘的回忆和新鲜的空气。\r\n\r\n晚上 8:00 PM： 我们在附近的小镇上找到了一家餐馆，享用了一顿美味的晚餐，庆祝我们的成功。\r\n\r\n这次爬山之旅充满了冒险、美景和友情，让我们更加珍惜大自然的壮丽和团队合作的重要性。我们期待着未来的冒险！', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(23).jpg', NULL, 0, 0, 1, 1, 0, 0, 1, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (35, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(1).jpg', '滑冰之行', 1, '滑冰', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(1).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(2).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(3).jpg', NULL, 0, 0, 1, 1, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (36, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(4).jpg', '星空与露营', 1, '我们抵达湖边露营地，找到了一个美丽的露营地点，紧邻湖泊。我们开始搭建帐篷，并安排好露营地。湖水波光粼粼，风景迷人。\r\n我们吃了午餐，然后决定租一艘小船去湖上划行。湖泊清澈见底，我们看到了一些野生动物，包括鸟类和鱼类。\r\n返回露营地，开始准备晚餐。我们生起篝火，烤着棉花糖，讲着故事。夕阳西下，湖泊在余晖中闪烁。\r\n为了欣赏星空，我们熄灭了篝火。在湖边仰望星空是露营的一大乐趣。我们看到了流星划过夜空，许愿并欣赏星座。', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(4).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(5).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(6).jpg', NULL, 0, 0, 1, 1, 1, 1, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (37, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(7).jpg', '马路杀手之骑行路途', 1, '骑行', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(7).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(8).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(9).jpg', NULL, 0, 0, 1, 1, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (38, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(10).jpg', '来玩卡丁车，刺激我人生', 1, '玩卡丁车', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(10).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(11).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(12).jpg', NULL, 0, 0, 1, 1, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (39, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(13).jpg', '后羿拉弓射大雕', 1, '射箭', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(13).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(14).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(15).jpg', NULL, 0, 0, 2, 1, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (40, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(17).jpg', '不断向上，永攀高峰', 1, '攀岩', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(17).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(18).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(19).jpg', NULL, 0, 0, 3, 0, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `d_agree_record` VALUES (41, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(20).jpg', '动物园的小动物', 1, '游玩动物园', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(20).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(21).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(22).jpg', '', 0, 0, 3, 1, 0, 0, 0, '2023-04-26 14:31:43', '2023-05-04 08:04:21');
INSERT INTO `d_agree_record` VALUES (44, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(23).jpg', '南湖天地下雪啦', 2, '雪花飘飘，好美啊😍', '', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/video/dd68cbf9772948036ac654162ab6262d.mp4', 0, 1, 1, 1, 1, 1, 0, '2023-05-04 00:43:55', '2023-05-04 16:50:46');
INSERT INTO `d_agree_record` VALUES (46, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(1).jpg', '这班主任一点都不凶', 2, '班主任发飙了，听到班主任的怒吼，我感到有些惊讶，因为平时班主任总是很温和的。我赶紧问班主任发生了什么事情，班主任语气激动地告诉我，班里有几个同学在课堂上不认真听讲，还频繁玩手机，这严重影响了课堂纪律和学习效果。我当场也感到很气愤，因为这些同学的行为不仅影响了自己的学习，也会影响到其他同学的学习，这是极不负责任的行为。我表达了自己对这种行为的不满，并同意班主任的观点，我表示我会在之后的课堂上更加认真地听讲，并且会劝说身边的同学也认真听讲，共同维护课堂秩序。班主任听到我的表态，表情稍微缓和了一些，她告诉我要让同学们认识到听课的重要性，要让他们明白，他们所学的知识将是他们未来成功的基础，不能因为一时的放松而影响到自己的未来。我认真听取了班主任的教诲，并承诺我会在今后的学习中更加努力，为自己的未来奋斗。希望这些同学能够认识到自己的问题，并且能够改正自己的行为，为自己的未来打下坚实的基础。', '', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/video/4c0e905222605813e85587c51f83e336.mp4', 1, 1, 1, 1, 1, 0, 0, '2023-05-04 16:31:19', '2023-05-04 16:48:21');
INSERT INTO `d_agree_record` VALUES (47, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(4).jpg', 'md-editor-v3升级说明', 4, '## 🧙🏼 从 3.x 升级到 4.x\n\n### 🏄🏼 引用方式\n\n4.0 版本开始支持按需引用组件，不再默认导出编辑器。\n\n#### 🏄🏼‍♂️ 全局引用\n\n```diff\n- <script src=\"https://unpkg.com/md-editor-v3@latest/lib/md-editor-v3.umd.js\"></script>\n+ <script src=\"https://unpkg.com/md-editor-v3@latest/lib/umd/index.js\"></script>\n<script>\n  const App = {\n    data() {\n      return {\n        text: \'Hello Editor!!\'\n      };\n    }\n  };\n- Vue.createApp(App).use(MdEditorV3).mount(\'#md-editor-v3\');\n+ Vue.createApp(App).use(MdEditorV3.MdEditor).mount(\'#md-editor-v3\');\n</script>\n```\n\n#### 🏄🏼‍♀️ ES Module\n\n```diff\n<script setup>\n- import MdEditor from \'md-editor-v3\';\n- const NormalToolbar = MdEditor.NormalToolbar;\n- const DropdownToolbar = MdEditor.DropdownToolbar;\n- const ModalToolbar = MdEditor.ModalToolbar;\n- const MdCatalog = MdEditor.MdCatalog;\n+ import { MdEditor, NormalToolbar, DropdownToolbar, ModalToolbar, MdCatalog } from \'md-editor-v3\';\nimport \'md-editor-v3/lib/style.css\';\n</script>\n```\n\n### 🔖 Props\n\n| 名称        | 说明                            |\n| ----------- | ------------------------------- |\n| previewOnly | 已移除，使用组件`MdPreview`替换 |\n\n### 🪤 内部组件\n\n新增`MdPreview`组件，替换原编辑器的`previewOnly`属性，可以减少代码体积。\n\n```diff\n<template>\n- <MdEditor previewOnly />\n+ <MdPreview />\n</template>\n\n<script setup>\n- import MdEditor from \'md-editor-v3\';\n+ import { MdPreview } from \'md-editor-v3\';\n- import \'md-editor-v3/lib/style.css\';\n+ import \'md-editor-v3/lib/preview.css\';\n</script>\n```\n\n---\n\n## 🧙🏻‍♂️ 从 2.x 升级到 3.x\n\n下面列举的是`3.x`不兼容`2.x`的内容，兼容内容不作展示。\n\n### 🤹🏼‍♂️ 语法\n\n- 删除线\n\n  ```diff\n  - ~It is a dream deeply rooted in the American dream.~\n  + ~~It is a dream deeply rooted in the American dream.~~\n  ```\n\n### 🔩 Props\n\n| 名称            | 说明                |\n| --------------- | ------------------- |\n| markedHeadingId | 修改为`mdHeadingId` |\n| historyLength   | 已移除              |\n\n### 🤿 配置项\n\n```diff\nMdEditor.config({\n-  markedRenderer: (renderer) => renderer,\n-  markedExtensions: [],\n-  markedOptions,\n+  codeMirrorExtensions: (theme, extensions) => extensions,\n+  markdownItConfig: (mdit) { }\n})\n```\n\n### 🎤 快捷键\n\n| 键位     | 功能     | 说明   |\n| -------- | -------- | ------ |\n| CTRL + Q | 添加引用 | 已移除 |\n\n### 🪤 内部组件\n\n#### 🐻 目录导航\n\n- **props**\n\n  - `markedHeadingId`: 已删除，使用`mdHeadingId`代替。\n', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(1).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(2).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(3).jpg', '', 0, 1, 1, 1, 1, 1, 0, '2023-10-25 17:27:11', '2023-10-27 17:47:09');
INSERT INTO `d_agree_record` VALUES (48, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(7).jpg', 'md-editor-v3使用', 4, '## 🐶 标题\n\n```markdown\n## 标题\n```\n\n---\n\n## 🐱 加粗\n\n**I have a dream that one day this nation will rise up.**\n\n```markdown\n**I have a dream that one day this nation will rise up.**\n```\n\n---\n\n## 🐭 斜体\n\n_It is a dream deeply rooted in the American dream._\n\n```markdown\n_It is a dream deeply rooted in the American dream._\n```\n\n---\n\n## 🐹 删除线\n\n~~It is a dream deeply rooted in the American dream.~~\n\n```markdown\n~~It is a dream deeply rooted in the American dream.~~\n```\n\n---\n\n## 🐻 超链接\n\n[md-editor-v3](https://imzbf.github.io/md-editor-v3/)\n\n```markdown\n[md-editor-v3](https://imzbf.github.io/md-editor-v3/)\n```\n\n---\n\n## 🐼 图片\n\n![描述文字](https://imzbf.github.io/md-editor-v3/imgs/mark_emoji.gif)\n\n```markdown\n![描述文字](https://imzbf.github.io/md-editor-v3/imgs/mark_emoji.gif)\n```\n\n---\n\n## 🙉 下划线\n\n<u>So even though we face the difficulties of today and tomorrow, I still have a dream.</u>\n\n```markdown\n<u>So even though we face the difficulties of today and tomorrow, I still have a dream.</u>\n```\n\n---\n\n## 🙊 上标\n\nI have a dream that one day this nation will rise up.<sup>[1]</sup>\n\n```markdown\nI have a dream that one day this nation will rise up.<sup>[1]</sup>\n```\n\n---\n\n## 🐒 下标\n\nI have a dream that one day this nation will rise up.<sub>[2]</sub>\n\n```markdown\nI have a dream that one day this nation will rise up.<sub>[2]</sub>\n```\n\n---\n\n## 🐰 行内代码\n\n`md-editor-v3`\n\n```markdown\n`md-editor-v3`\n```\n\n---\n\n## 🦊 块级代码\n\n````markdown\n```js\nimport MdEditor from \'md-editor-v3\';\nimport \'md-editor-v3/lib/style.css\';\n```\n````\n\n### 🗄 代码组合\n\n```shell [id:yarn]\nyarn add md-editor-v3\n```\n\n```shell [id:npm]\nnpm install md-editor-v3\n```\n\n```shell [id:pnpm]\npnpm install md-editor-v3\n```\n\n````markdown\n```shell [id:yarn]\nyarn add md-editor-v3\n```\n\n```shell [id:npm]\nnpm install md-editor-v3\n```\n\n```shell [id:pnpm]\npnpm install md-editor-v3\n```\n````\n\n---\n\n## 🐻‍❄️ 引用\n\n> 引用：《I Have a Dream》\n\n```markdown\n> 引用：《I Have a Dream》\n```\n\n---\n\n## 🐨 有序列表\n\n1. So even though we face the difficulties of today and tomorrow, I still have a dream.\n2. It is a dream deeply rooted in the American dream.\n3. I have a dream that one day this nation will rise up.\n\n```markdown\n1. So even though we face the difficulties of today and tomorrow, I still have a dream.\n2. It is a dream deeply rooted in the American dream.\n3. I have a dream that one day this nation will rise up.\n```\n\n---\n\n## 🐯 无序列表\n\n- So even though we face the difficulties of today and tomorrow, I still have a dream.\n- It is a dream deeply rooted in the American dream.\n- I have a dream that one day this nation will rise up.\n\n```markdown\n- So even though we face the difficulties of today and tomorrow, I still have a dream.\n- It is a dream deeply rooted in the American dream.\n- I have a dream that one day this nation will rise up.\n```\n\n---\n\n## 🦁 任务列表\n\n- [ ] 周五\n- [ ] 周六\n- [x] 周天\n\n```markdown\n- [ ] 周五\n- [ ] 周六\n- [x] 周天\n```\n\n---\n\n## 🐮 表格\n\n| 昵称 | 来自      |\n| ---- | --------- |\n| 之间 | 中国-重庆 |\n\n```markdown\n| 昵称 | 来自      |\n| ---- | --------- |\n| 之间 | 中国-重庆 |\n```\n\n---\n\n## 🐷 数学公式\n\n有两种模式\n\n### 🐽 行内\n\n$x+y^{2x}$\n\n```markdown\n$x+y^{2x}$\n```\n\n### 🐸 块级\n\n$$\\sqrt[3]{x}$$\n\n```markdown\n$$\n\\sqrt[3]{x}\n$$\n\n或者\n\n$$\\sqrt[3]{x}$$\n```\n\n更多公式示例参考：[https://katex.org/docs/supported.html](https://katex.org/docs/supported.html)\n\n---\n\n## 🐵 图表\n\n```mermaid\n---\ntitle: Example Git diagram\n---\ngitGraph\n   commit\n   commit\n   branch develop\n   checkout develop\n   commit\n   commit\n   checkout main\n   merge develop\n   commit\n   commit\n```\n\n````markdown\n```mermaid\n---\ntitle: Example Git diagram\n---\ngitGraph\n   commit\n   commit\n   branch develop\n   checkout develop\n   commit\n   commit\n   checkout main\n   merge develop\n   commit\n   commit\n```\n````\n\n更多图形示例参考：[https://mermaid.js.org/syntax/flowchart.html](https://mermaid.js.org/syntax/flowchart.html)\n\n---\n\n## 🙈 提示\n\n!!! note 支持的类型\n\nnote、abstract、info、tip、success、question、warning、failure、danger、bug、example、quote、hint、caution、error、attention\n\n!!!\n\n```markdown\n!!! note 支持的类型\n\nnote、abstract、info、tip、success、question、warning\n\nfailure、danger、bug、example、quote、hint、caution、error、attention\n\n!!!\n```', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(4).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(5).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(6).jpg', '', 0, 0, 1, 1, 1, 1, 0, '2023-10-25 17:42:54', NULL);
INSERT INTO `d_agree_record` VALUES (50, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(10).jpg', '我直接一打四', 4, '看我操作', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(7).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(8).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(9).jpg', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/d006760c59a03787bb1f2b5d934dc118.mp4', 0, 0, 1, 1, 0, 0, 0, '2023-10-25 18:09:47', NULL);
INSERT INTO `d_agree_record` VALUES (52, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(13).jpg', '一段代码奉上', 4, '```vue\n<el-col :span=\"11\">\n    <el-form-item prop=\"date2\">\n      <el-time-picker\n        v-model=\"ruleForm.date2\"\n        label=\"Pick a time\"\n        placeholder=\"Pick a time\"\n        style=\"width: 100%\"/>\n    </el-form-item>\n</el-col>\n```\n', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(10).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(11).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(12).jpg', '', 0, 0, 1, 1, 0, 0, 0, '2023-10-25 19:45:39', NULL);
INSERT INTO `d_agree_record` VALUES (53, 1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(17).jpg', '不一样的烟火', 1, '# 不一样的烟火\n![](https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/1235feeed7bf35b90bc3026e21b19fc7.jpg)\n\n\n## 约会介绍\n\n在这个特别的约会中，我们将一同去欣赏不一样的烟火。这不是传统的烟花秀，而是一个充满创意和惊喜的活动，将为你和你的伴侣带来美好的回忆。\n\n## 活动详情\n\n- **日期：** 2023,11,11\n- **时间：** 5:20\n- **地点：** 南湖天地\n\n## 活动亮点\n\n1. **独特的烟火设计：** 这次的烟火秀将呈现出各种独特的烟火设计，不同寻常的色彩和形状，会让你们惊叹不已。\n\n2. **浪漫的氛围：** 活动场地将为你们营造出浪漫的氛围，让你们可以一同享受烟火的美景。\n\n3. **美食体验：** 活动场地附近会有美味的食物摊位，可以一边品尝美食，一边欣赏烟火。\n\n4. **音乐表演：** 活动期间还会有音乐表演，为你们的约会增添一份音乐的甜蜜。\n\n## 注意事项\n\n- 请提前购买门票或入场券，以确保你们能够参加活动。\n- 带上相机或手机，记录下这个特殊的瞬间。\n- 准备好一些毯子或座位垫，以便舒适地坐在活动场地上。\n\n这次不一样的烟火约会将成为你和你的伴侣之间的美好回忆。不要错过这个机会，一起欣赏美丽的烟火，创造珍贵的时刻。\n', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(13).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(14).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(15).jpg', '', 0, 0, 1, 1, 0, 0, 0, '2023-10-26 09:57:35', NULL);
INSERT INTO `d_agree_record` VALUES (56, 2, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/b5729c5177c509ea003216683a689a94.png', '小仙女驾到，统统闪开', 1, '#### 小仙女\n##### 简介\n  小仙女是一个迷人的角色，常常在童话故事和神话传说中出现。她通常被描述为拥有仙女般的美貌和魔法能力的女性精灵。小仙女以她们的美丽、智慧和善良而受到人们的喜爱和赞美。\n\n##### 特点\n  小仙女有许多令人着迷的特点，其中包括：\n\n1. 美丽与优雅：小仙女被描绘为拥有无与伦比的美貌和优雅的仙女。她们通常有长发、纤细的身材和令人着迷的眼睛，散发着迷人的光芒。\n![](https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/24b94d82e4021a5cd63a582558528a2a.png)\n\n2. 魔法能力：小仙女通常被认为拥有神奇的魔法能力，可以使用魔法来改变事物、治愈伤痛或赋予人们幸福。她们可以掌控自然元素，如水、风和花朵，以及操纵时间和空间。\n![](https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/c7c5d0d542424de085a56a5a06364594.png)\n\n3. 善良与仁慈：小仙女被赋予善良和仁慈的品质。她们通常关心人类和自然界的福祉，愿意帮助那些需要帮助的人们。她们的出现常常象征着希望、爱和和平。\n![](https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/b02081a93f7eb6d603fa20721a7ccc5b.jpg)\n\n4. 自由与独立：小仙女是自由而独立的存在。她们经常居住在远离尘嚣的地方，如深海、森林或仙境。她们追求自由的生活，远离尘世的纷扰，享受宁静和和平。\n#### 故事与传说\n  小仙女在许多故事和传说中扮演重要角色。以下是一些著名的小仙女故事：\n\n1. 《人鱼公主》：这个故事讲述了一位小仙女公主与人类王子之间的爱情故事。小仙女公主为了与心爱的王子在一起，放弃了她的魔法能力和仙境的生活。\n![](https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/4d02b5c1b7afc86625b952eaed791490.jpg)\n\n2. 《仙女故事》：这个故事描述了小仙女帮助一个善良的人类少女实现她的愿望。小仙女利用她的魔法能力，帮助少女克服困难，获得幸福和成功。\n![](https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/5739b76d7ad23701990a1110918ab1cb.jpg)\n\n3. 《灰姑娘》：在这个故事中，小仙女以她的魔法能力帮助灰姑娘走出苦难，与王子幸福生活在一起。\n![](https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/f5de57c28854749348edaabed6c583e7.jpg)\n\n#### 总结\n  小仙女是一个神奇而迷人的角色，以她们的美丽、魔法能力和善良而受到人们的喜爱。她们的故事和传说常常给人们带来希望、梦想和幸福的感觉。无论是在童话书中还是在想象中，小仙女都是一个令人向往的存在。', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(17).jpg,https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(18).jpg,\r\nhttps://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agw/ag%20(19).jpg', '', 0, 1, 1, 1, 1, 1, 0, '2023-10-31 22:02:42', '2023-10-31 22:09:59');

-- ----------------------------
-- Table structure for d_comment
-- ----------------------------
DROP TABLE IF EXISTS `d_comment`;
CREATE TABLE `d_comment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `type` tinyint(1) NOT NULL COMMENT '类型 (1记录 2提问)',
  `type_id` int(0) NULL DEFAULT NULL COMMENT '类型id ',
  `parent_id` int(0) NULL DEFAULT NULL COMMENT '父评论id',
  `reply_id` int(0) NULL DEFAULT NULL COMMENT '回复评论id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `from_uid` int(0) NOT NULL COMMENT '评论用户id',
  `to_uid` int(0) NULL DEFAULT NULL COMMENT '回复用户id',
  `like_number` int(0) NULL DEFAULT 0 COMMENT '点赞数',
  `is_check` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否通过 (0否 1是)',
  `create_time` datetime(0) NOT NULL COMMENT '评论时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 141 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_comment
-- ----------------------------
INSERT INTO `d_comment` VALUES (1, 1, 1, NULL, NULL, '对于学生来说，代写作业是一种不道德的行为。在学习过程中，完成作业是提高自己能力和知识水平的重要方式之一。如果完全依赖于代写服务，学生可能会错失学习的机会，影响长远的职业发展。', 1, NULL, 20, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (2, 1, 12, NULL, NULL, '唱歌比赛是一种有益的活动，可以帮助人们更好地发挥自己的才能。', 1, NULL, 21, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (3, 1, 22, NULL, NULL, '组织跑步是一种有益的活动，可以帮助人们改善身体健康，增强体能，提升心理素质。它可以帮助人们改善心肺功能，减少患心血管疾病的风险，还可以帮助人们缓解压力，提高情绪。', 1, NULL, 22, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (4, 1, 24, NULL, NULL, '剧本杀活动是一种有益的活动，可以帮助人们提升思维能力，增强团队协作能力，增进友谊。', 1, NULL, 23, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (5, 1, 36, NULL, NULL, '男女生约会去露营是一种有益的活动，可以帮助男女生更好地了解彼此，增进彼此之间的感情，改善身体健康。', 1, NULL, 24, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (6, 1, 1, 1, 1, '没错，完成作业是学习过程中重要的一环，而完全依赖于代写服务会影响学生的学习机会和职业发展。', 3, 1, 1, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (7, 1, 1, 1, 1, '代写作业是不道德的行为，因为它会影响学生的学习能力和知识水平。', 3, 1, 2, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (8, 1, 1, 1, 1, '代写作业可能会让学生错失学习的机会，从而影响他们的职业发展。', 3, 1, 3, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (9, 1, 1, 1, 1, '代写作业可能会导致学生无法真正掌握学习内容，从而降低他们的学习能力。', 3, 1, 4, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (10, 1, 1, 1, 1, '代写作业会损害学生的学习质量，影响他们的未来职业发展。', 3, 1, 5, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (11, 1, 1, 1, 1, '代写作业会损害学生的学习习惯，从而影响他们的学习成绩。', 3, 1, 6, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (12, 1, 1, 1, 1, '代写作业会让学生失去自主学习的能力，从而影响他们的职业发展。', 3, 1, 7, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (13, 1, 1, 1, 1, '代写作业会削弱学生的学习能力，使他们无法获得更好的职业机会。', 3, 1, 7, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (14, 1, 1, 1, 1, '代写作业会使学生失去自主思考的能力，从而影响他们的职业发展。', 3, 1, 7, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (15, 1, 1, 1, 1, '代写作业会使学生错失学习的机会，从而影响他们的未来职业发展。', 3, 1, 7, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (16, 1, 12, 2, 2, '没错，唱歌比赛可以激发人们的热情，帮助人们更好地表达自己。', 3, 1, 7, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (17, 1, 12, 2, 2, '唱歌比赛可以帮助人们提升自信心，更好地表达自己的才能。', 3, 1, 2, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (18, 1, 12, 2, 2, '唱歌比赛可以让人们更加了解自己的才能，从而更好地发挥自己的能力。', 3, 1, 3, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (19, 1, 12, 2, 2, '唱歌比赛可以增进彼此之间的友谊，让人们更加了解彼此的能力和特长。', 3, 1, 4, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (20, 1, 12, 2, 2, '唱歌比赛可以帮助人们提升自我表达能力，从而更好地发挥自己的才能。', 3, 1, 4, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (21, 1, 12, 2, 2, '唱歌比赛可以让人们更加了解自己的才能，从而更好地发挥自己的特长。', 3, 1, 4, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (22, 1, 12, 2, 2, '唱歌比赛可以增进彼此之间的友谊，让人们更加了解彼此的才能和技能。', 3, 1, 5, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (23, 1, 12, 2, 2, '唱歌比赛可以帮助人们提升自信心，更好地展现自己的才能。', 3, 1, 5, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (24, 1, 12, 2, 2, '唱歌比赛可以让人们更加了解自己的才能，从而更好地发挥自己的潜力。', 3, 1, 1, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (25, 1, 12, 2, 2, '唱歌比赛可以增进彼此之间的友谊，让人们更加了解彼此的才能和技巧。', 3, 1, 4, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (26, 1, 22, 3, 3, '没错，组织跑步是一种有益的活动，可以帮助人们改善身体健康。', 3, 1, 2, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (27, 1, 22, 3, 3, '跑步可以帮助人们改善心肺功能，减少患心血管疾病的风险。', 3, 1, 5, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (28, 1, 22, 3, 3, '跑步可以帮助人们增强体能，提升心理素质。', 3, 1, 5, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (29, 1, 22, 3, 3, '跑步可以帮助人们缓解压力，提高情绪。', 3, 1, 5, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (30, 1, 22, 3, 3, '跑步可以增进彼此之间的友谊，让人们更加了解彼此的能力和特长。', 3, 1, 6, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (31, 1, 22, 3, 3, '跑步可以帮助人们改善心脏功能，减少患心血管疾病的风险。', 3, 1, 6, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (32, 1, 22, 3, 3, '跑步可以帮助人们提升体能，改善心理素质。', 3, 1, 6, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (33, 1, 22, 3, 3, '跑步可以帮助人们缓解压力，改善情绪。', 3, 1, 6, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (34, 1, 22, 3, 3, '跑步可以增进彼此之间的友谊，让人们更加了解彼此的能力和技能。', 3, 1, 6, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (35, 1, 22, 3, 3, '跑步可以帮助人们改善身体健康，提升心理素质，增进友谊。', 3, 1, 6, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (36, 1, 24, 4, 4, '没错，剧本杀活动是一种有趣的活动，可以帮助人们提升思维能力。', 3, 1, 6, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (37, 1, 24, 4, 4, '剧本杀活动可以帮助人们更好地理解剧本，激发创新思维。', 3, 1, 7, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (38, 1, 24, 4, 4, '剧本杀活动可以帮助人们提高团队合作能力，增强团队协作能力。', 3, 1, 7, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (39, 1, 24, 4, 4, '剧本杀活动可以让人们更加了解彼此的思维模式，提高团队合作能力。', 3, 1, 7, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (40, 1, 24, 4, 4, '剧本杀活动可以增进彼此之间的友谊，让人们更加了解彼此的能力和特长。', 3, 1, 7, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (41, 1, 24, 4, 4, '剧本杀活动可以帮助人们更好地理解剧本，激发创新思维。', 3, 1, 7, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (42, 1, 24, 4, 4, '剧本杀活动可以帮助人们增强团队协作能力，提高团队合作能力。', 3, 1, 7, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (43, 1, 24, 4, 4, '剧本杀活动可以让人们更加了解彼此的思维模式，增强团队合作能力。', 3, 1, 7, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (44, 1, 24, 4, 4, '剧本杀活动可以增进彼此之间的友谊，让人们更加了解彼此的能力和技能。', 3, 1, 7, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (45, 1, 24, 4, 4, '剧本杀活动是一种有益的活动，可以帮助人们提升思维能力，增强团队协作能力，增进友谊。', 3, 1, 7, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (46, 1, 36, 5, 5, '没错，男女生约会去露营是一种有趣的活动，可以帮助男女生更好地了解彼此。', 3, 1, 7, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (47, 1, 36, 5, 5, '男女生约会去露营可以让男女生更加了解彼此的思维模式，拓宽视野。', 3, 1, 3, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (48, 1, 36, 5, 5, '男女生约会去露营可以让男女生更加了解自然，改善身体健康。', 3, 1, 3, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (49, 1, 36, 5, 5, '男女生约会去露营可以帮助男女生增强体能，提升心理素质。', 3, 1, 3, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (50, 1, 36, 5, 5, '男女生约会去露营可以帮助男女生增进友谊，增进彼此之间的感情。', 3, 1, 3, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (51, 1, 36, 5, 5, '男女生约会去露营可以让男女生更加了解彼此的思维模式，改善身体健康。', 3, 1, 2, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (52, 1, 36, 5, 5, '男女生约会去露营可以帮助男女生拓宽视野，增强体能。', 3, 1, 2, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (53, 1, 36, 5, 5, '男女生约会去露营可以帮助男女生提升心理素质，增进友谊。', 3, 1, 2, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (54, 1, 36, 5, 5, '男女生约会去露营是一种有益的活动，可以帮助男女生更好地了解彼此，增进彼此之间的感情。', 3, 1, 2, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (55, 1, 36, 5, 5, '男女生约会去露营可以帮助男女生改善身体健康，提升心理素质，增进友谊。', 3, 1, 2, 1, '2023-05-03 09:22:47', NULL);
INSERT INTO `d_comment` VALUES (56, 1, 36, NULL, NULL, '男女生约会去露营是一种有益的活动，可以帮助男女生更好地了解彼此，增进彼此之间的感情，改善身体健康222。', 1, NULL, 24, 1, '2023-10-30 09:44:59', NULL);
INSERT INTO `d_comment` VALUES (57, 1, 36, 56, 56, '没错，男女生约会去露营是一种有趣的活动，可以帮助男女生更好地了解彼此。222', 2, 1, 12, 1, '2023-10-30 09:46:37', NULL);
INSERT INTO `d_comment` VALUES (58, 1, 36, 56, 57, '加1', 3, 2, 1, 1, '2023-10-30 09:47:11', NULL);
INSERT INTO `d_comment` VALUES (59, 1, 36, 56, 58, '加1', 2, 3, 1, 1, '2023-10-30 09:47:28', NULL);
INSERT INTO `d_comment` VALUES (60, 1, 36, 56, 58, '加1', 3, 2, 1, 1, '2023-10-30 09:47:28', NULL);
INSERT INTO `d_comment` VALUES (61, 1, 36, 56, 58, '加1', 3, 2, 0, 1, '2023-10-30 09:47:28', NULL);
INSERT INTO `d_comment` VALUES (62, 1, 36, 56, 58, '加1', 3, 2, 0, 1, '2023-10-30 09:47:28', NULL);
INSERT INTO `d_comment` VALUES (63, 1, 36, 56, 58, '加1', 3, 2, 0, 1, '2023-10-30 09:47:28', NULL);
INSERT INTO `d_comment` VALUES (64, 1, 36, 56, 63, '谢谢', 1, 3, 0, 1, '2023-10-30 09:52:33', NULL);
INSERT INTO `d_comment` VALUES (65, 1, 36, 56, 63, '谢谢1', 1, 3, 0, 1, '2023-10-30 09:52:33', NULL);
INSERT INTO `d_comment` VALUES (66, 1, 36, 56, 63, '谢谢2', 1, 3, 0, 1, '2023-10-30 09:52:33', NULL);
INSERT INTO `d_comment` VALUES (67, 1, 36, 56, 63, '谢谢3', 1, 3, 0, 1, '2023-10-30 09:52:33', NULL);
INSERT INTO `d_comment` VALUES (68, 1, 36, 56, 63, '谢谢4', 1, 3, 0, 1, '2023-10-30 09:52:33', NULL);
INSERT INTO `d_comment` VALUES (69, 1, 36, 56, 63, '谢谢5', 1, 3, 0, 1, '2023-10-30 09:52:33', NULL);
INSERT INTO `d_comment` VALUES (73, 1, 36, NULL, NULL, '男女生约会去露营是一种有益的活动，可以帮助男女生更好地了解彼此，增进彼此之间的感情，改善身体健康333。', 2, NULL, 44, 1, '2023-10-30 10:54:13', NULL);
INSERT INTO `d_comment` VALUES (74, 1, 36, NULL, NULL, '男女生约会去露营，感觉不错的哟！', 2, NULL, 11, 1, '2023-10-30 10:55:00', NULL);
INSERT INTO `d_comment` VALUES (75, 1, 36, 74, 74, '我也觉得不错', 3, 2, 6, 1, '2023-10-30 10:56:11', NULL);
INSERT INTO `d_comment` VALUES (76, 1, 36, NULL, NULL, '约会露营好啊', 1, NULL, 1, 1, '2023-10-31 00:58:52', NULL);
INSERT INTO `d_comment` VALUES (77, 1, 36, NULL, NULL, '约会露营好啊+1', 2, NULL, 1, 1, '2023-10-31 00:58:52', NULL);
INSERT INTO `d_comment` VALUES (78, 1, 36, NULL, NULL, '约会露营好啊+2', 3, NULL, 1, 1, '2023-10-31 00:58:52', NULL);
INSERT INTO `d_comment` VALUES (92, 1, 36, NULL, NULL, '测试', 1, NULL, 0, 1, '2023-10-31 01:36:08', NULL);
INSERT INTO `d_comment` VALUES (93, 1, 36, NULL, NULL, '撒发生', 1, NULL, 0, 1, '2023-10-31 01:37:05', NULL);
INSERT INTO `d_comment` VALUES (94, 1, 36, NULL, NULL, '自行车', 1, NULL, 0, 1, '2023-10-31 01:38:57', NULL);
INSERT INTO `d_comment` VALUES (95, 1, 36, NULL, NULL, '秩序创造*', 1, NULL, 0, 1, '2023-10-31 01:39:50', NULL);
INSERT INTO `d_comment` VALUES (96, 1, 36, NULL, NULL, '沙发沙发', 1, NULL, 0, 1, '2023-10-31 01:40:42', NULL);
INSERT INTO `d_comment` VALUES (97, 1, 36, 56, 63, '666', 1, 3, 0, 1, '2023-10-31 10:24:30', NULL);
INSERT INTO `d_comment` VALUES (98, 1, 36, 56, 63, '777', 1, 3, 0, 1, '2023-10-31 10:25:16', NULL);
INSERT INTO `d_comment` VALUES (99, 1, 36, 56, 63, '888', 1, 3, 0, 1, '2023-10-31 10:25:19', NULL);
INSERT INTO `d_comment` VALUES (100, 1, 36, 56, 63, '100000', 1, 3, 0, 1, '2023-10-31 10:25:36', NULL);
INSERT INTO `d_comment` VALUES (101, 1, 36, 74, 75, '6666', 1, 3, 0, 1, '2023-10-31 10:46:26', NULL);
INSERT INTO `d_comment` VALUES (102, 1, 36, NULL, NULL, '阿是发顺丰', 1, NULL, 0, 1, '2023-10-31 10:47:08', NULL);
INSERT INTO `d_comment` VALUES (103, 1, 36, NULL, NULL, '5555', 1, NULL, 0, 1, '2023-10-31 10:48:08', NULL);
INSERT INTO `d_comment` VALUES (104, 1, 36, 74, 75, '5555', 1, 3, 0, 1, '2023-10-31 10:48:20', NULL);
INSERT INTO `d_comment` VALUES (105, 1, 36, NULL, NULL, '2222', 1, NULL, 0, 1, '2023-10-31 10:48:28', NULL);
INSERT INTO `d_comment` VALUES (106, 1, 36, 74, 74, '3333', 1, 2, 0, 1, '2023-10-31 10:48:35', NULL);
INSERT INTO `d_comment` VALUES (107, 1, 36, 56, 63, '4444', 1, 3, 0, 1, '2023-10-31 10:48:41', NULL);
INSERT INTO `d_comment` VALUES (108, 1, 22, NULL, NULL, '666', 1, NULL, 0, 1, '2023-10-31 20:17:38', NULL);
INSERT INTO `d_comment` VALUES (109, 1, 22, NULL, NULL, '大家好', 1, NULL, 0, 1, '2023-10-31 20:42:38', NULL);
INSERT INTO `d_comment` VALUES (112, 1, 22, NULL, NULL, '可以', 2, NULL, 0, 1, '2023-10-31 20:43:26', NULL);
INSERT INTO `d_comment` VALUES (113, 1, 22, 112, 112, '我也觉得', 1, 2, 0, 1, '2023-10-31 20:44:18', NULL);
INSERT INTO `d_comment` VALUES (114, 1, 22, 3, 26, '666', 1, 3, 0, 1, '2023-10-31 20:46:12', NULL);
INSERT INTO `d_comment` VALUES (115, 1, 22, 3, 28, '阿是发顺丰', 1, 3, 0, 1, '2023-10-31 20:46:40', NULL);
INSERT INTO `d_comment` VALUES (116, 1, 22, 112, 112, '666', 1, 2, 0, 1, '2023-10-31 20:46:53', NULL);
INSERT INTO `d_comment` VALUES (117, 1, 22, NULL, NULL, '5555', 2, NULL, 0, 1, '2023-10-31 20:48:44', NULL);
INSERT INTO `d_comment` VALUES (118, 1, 22, 117, 117, '22222', 1, 2, 0, 1, '2023-10-31 20:48:50', NULL);
INSERT INTO `d_comment` VALUES (119, 1, 22, 117, 117, '7777', 1, 2, 0, 1, '2023-10-31 20:49:15', NULL);
INSERT INTO `d_comment` VALUES (120, 1, 22, 117, 119, '收到啦', 2, 1, 0, 1, '2023-10-31 20:49:31', NULL);
INSERT INTO `d_comment` VALUES (121, 1, 44, NULL, NULL, '雪花飘飘，好美啊😍', 2, NULL, 0, 1, '2023-10-31 21:20:49', NULL);
INSERT INTO `d_comment` VALUES (122, 1, 44, 121, 121, '就是的', 1, 2, 0, 1, '2023-10-31 21:21:07', NULL);
INSERT INTO `d_comment` VALUES (123, 1, 44, 121, 122, '英雄所见略同', 2, 1, 0, 1, '2023-10-31 21:21:41', NULL);
INSERT INTO `d_comment` VALUES (124, 1, 44, 121, 123, '哈哈哈哈', 1, 2, 0, 1, '2023-10-31 21:21:50', NULL);
INSERT INTO `d_comment` VALUES (125, 1, 44, NULL, NULL, '作者真是nb，视频拍的好棒', 1, NULL, 0, 1, '2023-10-31 21:23:04', NULL);
INSERT INTO `d_comment` VALUES (126, 1, 44, 125, 125, '6666', 2, 1, 0, 1, '2023-10-31 21:29:06', NULL);
INSERT INTO `d_comment` VALUES (127, 1, 44, 125, 126, '+1', 1, 2, 0, 1, '2023-10-31 21:29:13', NULL);
INSERT INTO `d_comment` VALUES (128, 1, 44, 125, 125, '+1', 2, 1, 0, 1, '2023-10-31 21:29:19', NULL);
INSERT INTO `d_comment` VALUES (129, 1, 56, NULL, NULL, '小仙女真是一种神奇的生物啊', 1, NULL, 0, 1, '2023-10-31 22:04:32', NULL);
INSERT INTO `d_comment` VALUES (130, 1, 56, NULL, NULL, '我爱小仙女', 2, NULL, 0, 1, '2023-10-31 22:04:58', NULL);
INSERT INTO `d_comment` VALUES (131, 1, 56, 130, 130, '我也爱小仙女', 1, 2, 0, 1, '2023-10-31 22:05:26', NULL);
INSERT INTO `d_comment` VALUES (132, 1, 56, 130, 131, '哈哈哈哈😄🥰🥰', 2, 1, 0, 1, '2023-10-31 22:06:53', NULL);
INSERT INTO `d_comment` VALUES (133, 1, 44, NULL, NULL, '666', 1, NULL, 0, 1, '2023-11-01 13:46:24', NULL);
INSERT INTO `d_comment` VALUES (134, 1, 44, NULL, NULL, '666', 1, NULL, 0, 1, '2023-11-01 14:13:07', NULL);
INSERT INTO `d_comment` VALUES (135, 1, 44, NULL, NULL, '888', 1, NULL, 0, 1, '2023-11-01 14:13:15', NULL);
INSERT INTO `d_comment` VALUES (136, 1, 44, NULL, NULL, '哈哈哈哈，雪花', 1, NULL, 0, 1, '2023-11-01 14:14:00', NULL);
INSERT INTO `d_comment` VALUES (137, 1, 44, 125, 126, '可以的', 1, 2, 0, 1, '2023-11-01 14:14:10', NULL);
INSERT INTO `d_comment` VALUES (138, 1, 38, NULL, NULL, '之前玩卡丁车,真的太刺激了', 1, NULL, 0, 1, '2023-11-01 17:41:26', NULL);
INSERT INTO `d_comment` VALUES (139, 1, 38, 138, 138, '我也玩过好多次了,感觉还不错', 2, 1, 0, 1, '2023-11-01 17:42:07', NULL);
INSERT INTO `d_comment` VALUES (140, 1, 38, 138, 139, '就是速度还不够快,我喜欢超级刺激的', 1, 2, 0, 1, '2023-11-01 17:43:04', NULL);

-- ----------------------------
-- Table structure for d_message
-- ----------------------------
DROP TABLE IF EXISTS `d_message`;
CREATE TABLE `d_message`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `type` tinyint(1) NOT NULL COMMENT '类型 (1系统 2用户)',
  `user_out_id` int(0) NULL DEFAULT NULL COMMENT '发出者id(如果是用户)',
  `user_in_id` int(0) NOT NULL COMMENT '接收者id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '消息内容',
  `create_time` datetime(0) NOT NULL COMMENT '发送时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_message
-- ----------------------------

-- ----------------------------
-- Table structure for d_quiz
-- ----------------------------
DROP TABLE IF EXISTS `d_quiz`;
CREATE TABLE `d_quiz`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '提问id',
  `user_id` int(0) NOT NULL COMMENT '提问者id',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '提问标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '提问内容',
  `images` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '提问图片',
  `like_number` int(0) NULL DEFAULT 0 COMMENT '点赞数',
  `collect_number` int(0) NULL DEFAULT 0 COMMENT '收藏数',
  `is_check` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否通过 (0否 1是)',
  `is_solve` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否解答 (0否 1是)',
  `create_time` datetime(0) NOT NULL COMMENT '提问时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_quiz
-- ----------------------------
INSERT INTO `d_quiz` VALUES (1, 1, '交朋友', '交朋友的标准是什么？', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/12270c4fe6ff5e988c699946b9beef3a.jpg', 43, 20, 1, 0, '2023-04-21 22:32:07', '2023-05-01 00:07:30');
INSERT INTO `d_quiz` VALUES (2, 1, '生活品质', '做哪些事情可以提升生活品质？', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/12270c4fe6ff5e988c699946b9beef3a.jpg', 7, 3, 1, 0, '2023-04-21 22:51:42', '2023-05-01 00:07:18');
INSERT INTO `d_quiz` VALUES (3, 1, '回怼', '怎么反驳“你行你上啊”的逻辑？', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/12270c4fe6ff5e988c699946b9beef3a.jpg', 57, 23, 1, 0, '2023-04-21 22:53:32', '2023-05-01 00:07:06');
INSERT INTO `d_quiz` VALUES (4, 1, '念书更重要吗', '把学费拿来念书还是环游世界更合适？为什么？', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/12270c4fe6ff5e988c699946b9beef3a.jpg', 123, 32, 1, 0, '2023-04-21 22:54:42', '2023-05-01 00:06:53');
INSERT INTO `d_quiz` VALUES (5, 1, '爱情', '你心中的完美爱情是怎么样的？', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/12270c4fe6ff5e988c699946b9beef3a.jpg', 119, 13, 1, 0, '2023-04-21 22:32:07', '2023-05-01 00:06:08');
INSERT INTO `d_quiz` VALUES (6, 1, '苦难', '苦难有什么价值？', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/12270c4fe6ff5e988c699946b9beef3a.jpg', 37, 2, 1, 0, '2023-04-21 22:51:42', '2023-05-01 00:05:53');
INSERT INTO `d_quiz` VALUES (7, 1, '自由', '你对自由的理解是什么？', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/12270c4fe6ff5e988c699946b9beef3a.jpg', 235, 27, 1, 0, '2023-04-21 22:53:32', '2023-05-01 00:05:36');
INSERT INTO `d_quiz` VALUES (8, 1, '为什么会嫉妒', '同样是别人比自己强，为什么有时会产生嫉妒心理，而有时会产生崇拜？', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/12270c4fe6ff5e988c699946b9beef3a.jpg', 578, 23, 1, 0, '2023-04-21 22:54:42', '2023-05-01 00:04:59');
INSERT INTO `d_quiz` VALUES (9, 1, '留学', '二十六岁，工作三年却将留学三年，值得吗？', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/12270c4fe6ff5e988c699946b9beef3a.jpg', 245, 102, 1, 0, '2023-04-21 22:32:07', '2023-05-01 00:05:18');
INSERT INTO `d_quiz` VALUES (10, 1, '年轻', '如何看待“年轻时就释怀与淡泊，是没有希望的”这句话？', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/12270c4fe6ff5e988c699946b9beef3a.jpg', 23, 2, 1, 0, '2023-04-21 22:51:42', '2023-05-01 00:04:38');
INSERT INTO `d_quiz` VALUES (11, 1, '怎么努力', '要怎样努力，才能成为很厉害的人？', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/12270c4fe6ff5e988c699946b9beef3a.jpg', 0, 0, 0, 0, '2023-04-21 22:53:32', '2023-05-01 00:04:17');
INSERT INTO `d_quiz` VALUES (12, 1, '理念', '你遇到过哪些让你眼前一亮、醍醐灌顶或对你改变很大的理念？', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/12270c4fe6ff5e988c699946b9beef3a.jpg', 278, 13, 1, 0, '2023-04-21 22:54:42', '2023-05-01 00:03:47');
INSERT INTO `d_quiz` VALUES (13, 1, '为什么要努力', '人这一生为什么要努力？', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/12270c4fe6ff5e988c699946b9beef3a.jpg', 33, 2, 1, 0, '2023-04-21 22:32:07', '2023-05-01 00:04:02');
INSERT INTO `d_quiz` VALUES (14, 1, '困难', '你最困难的时候选择过放弃吗？', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/12270c4fe6ff5e988c699946b9beef3a.jpg', 482, 167, 1, 0, '2023-04-21 22:51:42', '2023-05-01 00:03:30');
INSERT INTO `d_quiz` VALUES (15, 1, '表白之后', '向喜欢的女生表白被拒绝了，还是喜欢她，怎么办？', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/378d3d4d7e1c7696cbb7d0709538798f.jpg\",\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/12270c4fe6ff5e988c699946b9beef3a.jpg', 237, 19, 1, 0, '2023-04-21 22:53:32', '2023-05-01 00:03:08');
INSERT INTO `d_quiz` VALUES (16, 1, '大世面', '什么叫见过大世面？', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/378d3d4d7e1c7696cbb7d0709538798f.jpg\",\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/12270c4fe6ff5e988c699946b9beef3a.jpg', 567, 230, 1, 0, '2023-04-21 22:54:42', '2023-05-01 00:02:58');
INSERT INTO `d_quiz` VALUES (17, 1, '科学与迷信', '科学和迷信的分界点是哪里？', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/12270c4fe6ff5e988c699946b9beef3a.jpg', 769, 173, 1, 0, '2023-04-21 22:32:07', '2023-05-01 00:02:47');
INSERT INTO `d_quiz` VALUES (18, 1, '建议', '你在生活中得到过的最好的建议是什么？', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/378d3d4d7e1c7696cbb7d0709538798f.jpg\",\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/12270c4fe6ff5e988c699946b9beef3a.jpg', 2, 0, 1, 0, '2023-04-21 22:51:42', '2023-05-01 00:02:34');
INSERT INTO `d_quiz` VALUES (19, 1, '最激励的话', '最能燃起你学习激情的一句话是什么？', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/12270c4fe6ff5e988c699946b9beef3a.jpg', 6, 1, 1, 0, '2023-04-21 22:53:32', '2023-05-01 00:02:22');
INSERT INTO `d_quiz` VALUES (20, 1, '新鲜感没有了怎么办', '恋爱半年，女朋友觉得没有了开始时的新鲜感，怎么办？', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/12270c4fe6ff5e988c699946b9beef3a.jpg', 523, 85, 1, 0, '2023-04-21 22:54:42', '2023-05-01 00:01:55');
INSERT INTO `d_quiz` VALUES (21, 1, '情商', '情商不高的例子有哪些？', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/988e83dae0ed1fa784c73eaf9320936e.jpg', 97, 12, 1, 0, '2023-04-21 22:32:07', '2023-05-01 00:00:22');
INSERT INTO `d_quiz` VALUES (22, 1, '最佳时期', '当你发现做一件事的最佳时期已经过了，还应该再去做吗？', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/12270c4fe6ff5e988c699946b9beef3a.jpg', 10, 1, 1, 0, '2023-04-21 22:51:42', '2023-05-01 00:01:22');
INSERT INTO `d_quiz` VALUES (23, 1, '道理', '有哪些道理是你读了不信，听不进去，直到你亲身经历方笃信不疑的？', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/12270c4fe6ff5e988c699946b9beef3a.jpg', 34, 7, 1, 0, '2023-04-21 22:53:32', '2023-05-01 00:01:02');
INSERT INTO `d_quiz` VALUES (24, 1, '人脉和朋友', '如何看待“年轻的时候需要的是朋友而不是人脉”？', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/378d3d4d7e1c7696cbb7d0709538798f.jpg\",\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/12270c4fe6ff5e988c699946b9beef3a.jpg', 113, 29, 1, 0, '2023-04-21 22:54:42', '2023-05-01 19:19:07');

-- ----------------------------
-- Table structure for d_quiz_answer
-- ----------------------------
DROP TABLE IF EXISTS `d_quiz_answer`;
CREATE TABLE `d_quiz_answer`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '作答id',
  `quiz_id` int(0) NOT NULL COMMENT '题目id',
  `user_id` int(0) NOT NULL COMMENT '作答者id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '作答内容',
  `like_number` int(0) NULL DEFAULT 0 COMMENT '点赞数',
  `is_check` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否通过 (0否 1是)',
  `create_time` datetime(0) NOT NULL COMMENT '作答时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '题目作答' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_quiz_answer
-- ----------------------------

-- ----------------------------
-- Table structure for d_tag
-- ----------------------------
DROP TABLE IF EXISTS `d_tag`;
CREATE TABLE `d_tag`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `tag_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签名',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_tag
-- ----------------------------
INSERT INTO `d_tag` VALUES (15, '测试标签', '2023-02-22 12:10:21', NULL);
INSERT INTO `d_tag` VALUES (16, '科技', '2023-04-21 14:09:49', NULL);
INSERT INTO `d_tag` VALUES (17, '数学', '2023-04-21 22:51:42', NULL);
INSERT INTO `d_tag` VALUES (18, '英语', '2023-04-21 22:53:32', NULL);
INSERT INTO `d_tag` VALUES (19, '火箭', '2023-04-21 22:54:42', NULL);
INSERT INTO `d_tag` VALUES (20, '文字', '2023-04-21 23:25:57', NULL);
INSERT INTO `d_tag` VALUES (21, '约会', '2023-04-25 09:11:49', NULL);
INSERT INTO `d_tag` VALUES (22, '友情', '2023-04-30 22:03:09', NULL);
INSERT INTO `d_tag` VALUES (23, '人文', '2023-05-01 00:00:23', NULL);
INSERT INTO `d_tag` VALUES (24, '哲理', '2023-05-01 00:01:02', NULL);
INSERT INTO `d_tag` VALUES (25, '情义', '2023-05-01 00:01:55', NULL);
INSERT INTO `d_tag` VALUES (26, '美景', '2023-05-04 00:43:55', NULL);
INSERT INTO `d_tag` VALUES (27, '有趣', '2023-05-04 08:02:46', NULL);
INSERT INTO `d_tag` VALUES (28, '摆摊', '2023-05-04 08:03:35', '2023-08-31 21:56:14');
INSERT INTO `d_tag` VALUES (29, '操作', '2023-10-25 17:27:11', NULL);
INSERT INTO `d_tag` VALUES (30, '萨法', '2023-10-25 18:02:50', NULL);
INSERT INTO `d_tag` VALUES (31, '艾师傅', '2023-10-25 18:09:47', NULL);
INSERT INTO `d_tag` VALUES (32, '测试', '2023-10-25 19:10:19', NULL);
INSERT INTO `d_tag` VALUES (33, '代码', '2023-10-25 19:45:40', NULL);
INSERT INTO `d_tag` VALUES (34, '烟火', '2023-10-26 09:57:35', NULL);
INSERT INTO `d_tag` VALUES (35, '仙女', '2023-10-31 22:02:42', NULL);
INSERT INTO `d_tag` VALUES (36, '美丽', '2023-10-31 22:02:42', NULL);

-- ----------------------------
-- Table structure for d_tag_text
-- ----------------------------
DROP TABLE IF EXISTS `d_tag_text`;
CREATE TABLE `d_tag_text`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tag_id` int(0) NOT NULL COMMENT '标签id',
  `type` tinyint(1) NOT NULL COMMENT '类型(1记录 2题目)',
  `type_id` int(0) NOT NULL COMMENT '类型id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 208 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_tag_text
-- ----------------------------
INSERT INTO `d_tag_text` VALUES (1, 23, 2, 21);
INSERT INTO `d_tag_text` VALUES (2, 24, 2, 22);
INSERT INTO `d_tag_text` VALUES (3, 25, 2, 20);
INSERT INTO `d_tag_text` VALUES (4, 24, 2, 19);
INSERT INTO `d_tag_text` VALUES (5, 23, 2, 18);
INSERT INTO `d_tag_text` VALUES (6, 16, 2, 17);
INSERT INTO `d_tag_text` VALUES (7, 24, 2, 16);
INSERT INTO `d_tag_text` VALUES (8, 25, 2, 15);
INSERT INTO `d_tag_text` VALUES (9, 23, 2, 14);
INSERT INTO `d_tag_text` VALUES (10, 23, 2, 11);
INSERT INTO `d_tag_text` VALUES (11, 23, 2, 10);
INSERT INTO `d_tag_text` VALUES (12, 24, 2, 10);
INSERT INTO `d_tag_text` VALUES (13, 23, 2, 8);
INSERT INTO `d_tag_text` VALUES (14, 23, 2, 9);
INSERT INTO `d_tag_text` VALUES (15, 24, 2, 9);
INSERT INTO `d_tag_text` VALUES (16, 20, 2, 7);
INSERT INTO `d_tag_text` VALUES (17, 23, 2, 7);
INSERT INTO `d_tag_text` VALUES (18, 15, 2, 6);
INSERT INTO `d_tag_text` VALUES (19, 20, 2, 6);
INSERT INTO `d_tag_text` VALUES (20, 15, 2, 5);
INSERT INTO `d_tag_text` VALUES (21, 16, 2, 5);
INSERT INTO `d_tag_text` VALUES (22, 17, 2, 5);
INSERT INTO `d_tag_text` VALUES (23, 20, 2, 4);
INSERT INTO `d_tag_text` VALUES (24, 24, 2, 2);
INSERT INTO `d_tag_text` VALUES (25, 15, 1, 32);
INSERT INTO `d_tag_text` VALUES (26, 21, 1, 32);
INSERT INTO `d_tag_text` VALUES (27, 15, 1, 43);
INSERT INTO `d_tag_text` VALUES (28, 15, 2, 24);
INSERT INTO `d_tag_text` VALUES (29, 22, 2, 24);
INSERT INTO `d_tag_text` VALUES (30, 15, 1, 22);
INSERT INTO `d_tag_text` VALUES (31, 20, 1, 1);
INSERT INTO `d_tag_text` VALUES (32, 23, 1, 12);
INSERT INTO `d_tag_text` VALUES (33, 20, 1, 33);
INSERT INTO `d_tag_text` VALUES (34, 23, 1, 33);
INSERT INTO `d_tag_text` VALUES (35, 27, 1, 23);
INSERT INTO `d_tag_text` VALUES (36, 28, 1, 3);
INSERT INTO `d_tag_text` VALUES (37, 22, 1, 13);
INSERT INTO `d_tag_text` VALUES (38, 21, 1, 41);
INSERT INTO `d_tag_text` VALUES (39, 20, 1, 46);
INSERT INTO `d_tag_text` VALUES (40, 26, 1, 44);
INSERT INTO `d_tag_text` VALUES (197, 29, 1, 47);
INSERT INTO `d_tag_text` VALUES (198, 29, 1, 48);
INSERT INTO `d_tag_text` VALUES (199, 30, 1, 49);
INSERT INTO `d_tag_text` VALUES (200, 31, 1, 50);
INSERT INTO `d_tag_text` VALUES (201, 32, 1, 51);
INSERT INTO `d_tag_text` VALUES (202, 33, 1, 52);
INSERT INTO `d_tag_text` VALUES (203, 34, 1, 53);
INSERT INTO `d_tag_text` VALUES (204, 32, 1, 54);
INSERT INTO `d_tag_text` VALUES (205, 32, 1, 55);
INSERT INTO `d_tag_text` VALUES (206, 35, 1, 56);
INSERT INTO `d_tag_text` VALUES (207, 36, 1, 56);

-- ----------------------------
-- Table structure for l_exception_log
-- ----------------------------
DROP TABLE IF EXISTS `l_exception_log`;
CREATE TABLE `l_exception_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '异常id',
  `module` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '异常模块',
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '异常uri',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '异常名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作描述',
  `error_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '异常方法',
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '异常信息',
  `params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求参数',
  `request_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求方式',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作ip',
  `ip_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作地址',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作系统',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '浏览器',
  `create_time` datetime(0) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of l_exception_log
-- ----------------------------

-- ----------------------------
-- Table structure for l_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `l_operation_log`;
CREATE TABLE `l_operation_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '操作id',
  `module` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作模块',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作类型',
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作uri',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '方法名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作描述',
  `params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求参数',
  `method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求方式',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返回数据',
  `user_id` int(0) NOT NULL COMMENT '用户id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作ip',
  `ip_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作地址',
  `times` int(0) NOT NULL COMMENT '操作耗时 (毫秒)',
  `create_time` datetime(0) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1508 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of l_operation_log
-- ----------------------------
INSERT INTO `l_operation_log` VALUES (1500, '标签模块', '修改', '/tag/update', 'com.vhans.aapi.controller.TagController.updateTag', '修改标签', '[{\"count\":0,\"id\":28,\"tagName\":\"摆摊\",\"updateTime\":\"2023-08-31 21:56:13.6335969\"}]', 'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1293, '2023-08-31 21:56:15');
INSERT INTO `l_operation_log` VALUES (1501, '用户模块', '修改', '/user/update', 'com.vhans.aapi.controller.UserController.updateUser', '修改用户', '[{\"avatar\":\"\",\"degree\":99999,\"email\":\"\",\"grade\":0,\"id\":1,\"intro\":\"\",\"ipAddress\":\"\",\"ipSource\":\"\",\"isDisable\":0,\"loginType\":0,\"nickname\":\"\",\"password\":\"\",\"username\":\"\"}]', 'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 130, '2023-08-31 22:00:13');
INSERT INTO `l_operation_log` VALUES (1502, '用户模块', '修改', '/user/status', 'com.vhans.aapi.controller.UserController.updateUserStatus', '修改用户状态', '[{\"id\":2,\"isDisable\":1}]', 'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 111, '2023-08-31 22:02:25');
INSERT INTO `l_operation_log` VALUES (1503, '管理员模块', '修改', '/admin/changeStatus', 'com.vhans.aapi.controller.AdminController.updateAdminStatus', '修改管理员状态', '[{\"id\":2,\"isDisable\":1}]', 'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 509, '2023-08-31 22:03:17');
INSERT INTO `l_operation_log` VALUES (1504, '管理员模块', '修改', '/admin/update', 'com.vhans.aapi.controller.AdminController.updateAdmin', '修改管理员', '[{\"id\":0,\"nickname\":\"111\",\"updateTime\":\"2023-08-31 22:09:41.7729191\"},null]', 'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 47, '2023-08-31 22:09:42');
INSERT INTO `l_operation_log` VALUES (1505, '管理员模块', '修改', '/admin/update', 'com.vhans.aapi.controller.AdminController.updateAdmin', '修改管理员', '[{\"id\":2,\"nickname\":\"111\",\"updateTime\":\"2023-08-31 22:10:12.8464044\"},null]', 'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 75, '2023-08-31 22:10:13');
INSERT INTO `l_operation_log` VALUES (1506, '管理员模块', '修改', '/admin/update', 'com.vhans.aapi.controller.AdminController.updateAdmin', '修改管理员', '[{\"id\":2,\"nickname\":\"111\",\"updateTime\":\"2023-08-31 22:11:29.1511795\"},null]', 'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 12268, '2023-08-31 22:11:29');
INSERT INTO `l_operation_log` VALUES (1507, '角色模块', '修改', '/role/changeStatus', 'com.vhans.aapi.controller.RoleController.updateRoleStatus', '修改角色状态', '[{\"id\":\"3\",\"isDisable\":1}]', 'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 777, '2023-09-01 09:38:13');
INSERT INTO `l_operation_log` VALUES (1508, '角色模块', '修改', '/role/changeStatus', 'com.vhans.aapi.controller.RoleController.updateRoleStatus', '修改角色状态', '[{\"id\":\"3\",\"isDisable\":0}]', 'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 182, '2023-09-01 09:38:31');

-- ----------------------------
-- Table structure for l_task_log
-- ----------------------------
DROP TABLE IF EXISTS `l_task_log`;
CREATE TABLE `l_task_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `task_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `task_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `task_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '日志信息',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '执行状态 (0失败 1正常)',
  `error_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '错误信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of l_task_log
-- ----------------------------

-- ----------------------------
-- Table structure for l_visit_log
-- ----------------------------
DROP TABLE IF EXISTS `l_visit_log`;
CREATE TABLE `l_visit_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `page` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问页面',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问ip',
  `ip_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问地址',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浏览器',
  `create_time` datetime(0) NOT NULL COMMENT '访问时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5253 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of l_visit_log
-- ----------------------------
INSERT INTO `l_visit_log` VALUES (3482, '标签', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-01 20:54:59');
INSERT INTO `l_visit_log` VALUES (3483, '标签', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-01 20:57:26');
INSERT INTO `l_visit_log` VALUES (3484, '标签', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-01 21:06:49');
INSERT INTO `l_visit_log` VALUES (3485, '标签', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-01 21:06:59');
INSERT INTO `l_visit_log` VALUES (3486, '标签', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-01 21:07:16');
INSERT INTO `l_visit_log` VALUES (3487, '标签', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-01 21:24:43');
INSERT INTO `l_visit_log` VALUES (3488, '标签', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-01 23:23:49');
INSERT INTO `l_visit_log` VALUES (3489, '标签', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-01 23:27:19');
INSERT INTO `l_visit_log` VALUES (3490, '标签', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-01 23:27:29');
INSERT INTO `l_visit_log` VALUES (3491, '约起中心', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-02 00:28:29');
INSERT INTO `l_visit_log` VALUES (3492, '约起中心', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-02 00:28:54');
INSERT INTO `l_visit_log` VALUES (3493, '约起中心', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-02 00:33:04');
INSERT INTO `l_visit_log` VALUES (3494, '约起中心', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-02 00:33:14');
INSERT INTO `l_visit_log` VALUES (3495, '约起中心', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-02 00:43:27');
INSERT INTO `l_visit_log` VALUES (3496, '约起中心', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-02 00:43:40');
INSERT INTO `l_visit_log` VALUES (3497, '约起中心', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-02 00:43:48');
INSERT INTO `l_visit_log` VALUES (3498, '约起中心', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-02 00:44:01');
INSERT INTO `l_visit_log` VALUES (3499, '约起中心', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-02 00:46:15');
INSERT INTO `l_visit_log` VALUES (3500, '约起中心', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-02 00:46:27');
INSERT INTO `l_visit_log` VALUES (3501, '约起中心', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-02 00:46:40');
INSERT INTO `l_visit_log` VALUES (3502, '约起中心', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-02 00:47:07');
INSERT INTO `l_visit_log` VALUES (3503, '约起中心', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-02 00:47:17');
INSERT INTO `l_visit_log` VALUES (3504, '约起中心', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-02 00:49:21');
INSERT INTO `l_visit_log` VALUES (3505, '约起中心', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-02 00:58:12');
INSERT INTO `l_visit_log` VALUES (3506, '约起中心', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-02 22:16:06');
INSERT INTO `l_visit_log` VALUES (3507, '关于', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-02 22:16:20');
INSERT INTO `l_visit_log` VALUES (3508, '首页', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-02 22:17:54');
INSERT INTO `l_visit_log` VALUES (3509, '首页', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-02 22:18:07');
INSERT INTO `l_visit_log` VALUES (3510, '首页', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-02 22:18:19');
INSERT INTO `l_visit_log` VALUES (3511, '首页', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-02 22:21:48');
INSERT INTO `l_visit_log` VALUES (3512, '首页', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-02 22:22:39');
INSERT INTO `l_visit_log` VALUES (3513, '首页', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-02 22:22:54');
INSERT INTO `l_visit_log` VALUES (3514, '总览', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-02 22:32:50');
INSERT INTO `l_visit_log` VALUES (3515, '学习中心', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-02 23:47:45');
INSERT INTO `l_visit_log` VALUES (3516, '总览', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-03 00:00:31');
INSERT INTO `l_visit_log` VALUES (3517, '学习中心', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-03 00:08:19');
INSERT INTO `l_visit_log` VALUES (3518, '总览', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-03 00:12:07');
INSERT INTO `l_visit_log` VALUES (3519, '约起中心', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-08 18:08:28');
INSERT INTO `l_visit_log` VALUES (3520, '约起中心', '192.168.244.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 116', '2023-09-08 18:08:36');
INSERT INTO `l_visit_log` VALUES (3521, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 17:48:34');
INSERT INTO `l_visit_log` VALUES (3522, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 18:28:25');
INSERT INTO `l_visit_log` VALUES (3523, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 18:34:30');
INSERT INTO `l_visit_log` VALUES (3524, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 18:35:56');
INSERT INTO `l_visit_log` VALUES (3525, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 18:42:40');
INSERT INTO `l_visit_log` VALUES (3526, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 18:43:01');
INSERT INTO `l_visit_log` VALUES (3527, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 18:49:43');
INSERT INTO `l_visit_log` VALUES (3528, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 18:50:43');
INSERT INTO `l_visit_log` VALUES (3529, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 18:51:05');
INSERT INTO `l_visit_log` VALUES (3530, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 18:59:15');
INSERT INTO `l_visit_log` VALUES (3531, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 18:59:57');
INSERT INTO `l_visit_log` VALUES (3532, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 19:03:30');
INSERT INTO `l_visit_log` VALUES (3533, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 19:07:23');
INSERT INTO `l_visit_log` VALUES (3534, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 19:09:51');
INSERT INTO `l_visit_log` VALUES (3535, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 19:10:02');
INSERT INTO `l_visit_log` VALUES (3536, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 19:11:47');
INSERT INTO `l_visit_log` VALUES (3537, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 19:21:19');
INSERT INTO `l_visit_log` VALUES (3538, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 19:55:51');
INSERT INTO `l_visit_log` VALUES (3539, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 20:05:57');
INSERT INTO `l_visit_log` VALUES (3540, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 20:07:47');
INSERT INTO `l_visit_log` VALUES (3541, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 20:09:31');
INSERT INTO `l_visit_log` VALUES (3542, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 20:10:25');
INSERT INTO `l_visit_log` VALUES (3543, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 20:14:29');
INSERT INTO `l_visit_log` VALUES (3544, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 20:21:55');
INSERT INTO `l_visit_log` VALUES (3545, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 20:39:39');
INSERT INTO `l_visit_log` VALUES (3546, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 20:39:46');
INSERT INTO `l_visit_log` VALUES (3547, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 20:42:52');
INSERT INTO `l_visit_log` VALUES (3548, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 20:46:20');
INSERT INTO `l_visit_log` VALUES (3549, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 20:47:45');
INSERT INTO `l_visit_log` VALUES (3550, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 21:02:23');
INSERT INTO `l_visit_log` VALUES (3551, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 21:05:06');
INSERT INTO `l_visit_log` VALUES (3552, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 21:06:47');
INSERT INTO `l_visit_log` VALUES (3553, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 21:10:19');
INSERT INTO `l_visit_log` VALUES (3554, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 21:11:57');
INSERT INTO `l_visit_log` VALUES (3555, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 21:12:45');
INSERT INTO `l_visit_log` VALUES (3556, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 21:13:35');
INSERT INTO `l_visit_log` VALUES (3557, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 21:14:30');
INSERT INTO `l_visit_log` VALUES (3558, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 21:15:37');
INSERT INTO `l_visit_log` VALUES (3559, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-25 21:16:20');
INSERT INTO `l_visit_log` VALUES (3560, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-26 08:03:03');
INSERT INTO `l_visit_log` VALUES (3561, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-27 14:44:23');
INSERT INTO `l_visit_log` VALUES (3562, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-27 14:46:09');
INSERT INTO `l_visit_log` VALUES (3563, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-27 14:53:50');
INSERT INTO `l_visit_log` VALUES (3564, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-27 15:17:09');
INSERT INTO `l_visit_log` VALUES (3565, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-27 15:33:11');
INSERT INTO `l_visit_log` VALUES (3566, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-27 15:56:49');
INSERT INTO `l_visit_log` VALUES (3567, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-27 16:10:49');
INSERT INTO `l_visit_log` VALUES (3568, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-27 16:12:23');
INSERT INTO `l_visit_log` VALUES (3569, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-27 16:13:09');
INSERT INTO `l_visit_log` VALUES (3570, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-27 16:14:36');
INSERT INTO `l_visit_log` VALUES (3571, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-27 16:16:11');
INSERT INTO `l_visit_log` VALUES (3572, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-27 16:16:33');
INSERT INTO `l_visit_log` VALUES (3573, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-27 16:16:49');
INSERT INTO `l_visit_log` VALUES (3574, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-27 16:17:20');
INSERT INTO `l_visit_log` VALUES (3575, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-27 16:17:53');
INSERT INTO `l_visit_log` VALUES (3576, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-27 18:08:31');
INSERT INTO `l_visit_log` VALUES (3577, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-27 18:22:44');
INSERT INTO `l_visit_log` VALUES (3578, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-27 18:24:38');
INSERT INTO `l_visit_log` VALUES (3579, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-27 18:24:42');
INSERT INTO `l_visit_log` VALUES (3580, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-27 18:25:19');
INSERT INTO `l_visit_log` VALUES (3581, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-27 18:26:34');
INSERT INTO `l_visit_log` VALUES (3582, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-27 18:26:46');
INSERT INTO `l_visit_log` VALUES (3583, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-27 18:48:15');
INSERT INTO `l_visit_log` VALUES (3584, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-27 18:49:44');
INSERT INTO `l_visit_log` VALUES (3585, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 08:28:53');
INSERT INTO `l_visit_log` VALUES (3586, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 10:06:32');
INSERT INTO `l_visit_log` VALUES (3587, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 10:24:23');
INSERT INTO `l_visit_log` VALUES (3588, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 10:39:57');
INSERT INTO `l_visit_log` VALUES (3589, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 11:38:21');
INSERT INTO `l_visit_log` VALUES (3590, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 13:04:19');
INSERT INTO `l_visit_log` VALUES (3591, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 13:15:32');
INSERT INTO `l_visit_log` VALUES (3592, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 13:37:46');
INSERT INTO `l_visit_log` VALUES (3593, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 13:45:41');
INSERT INTO `l_visit_log` VALUES (3594, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 13:45:47');
INSERT INTO `l_visit_log` VALUES (3595, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 13:46:49');
INSERT INTO `l_visit_log` VALUES (3596, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 13:47:05');
INSERT INTO `l_visit_log` VALUES (3597, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 14:10:37');
INSERT INTO `l_visit_log` VALUES (3598, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 14:10:47');
INSERT INTO `l_visit_log` VALUES (3599, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 14:10:51');
INSERT INTO `l_visit_log` VALUES (3600, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 14:10:59');
INSERT INTO `l_visit_log` VALUES (3601, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 14:12:23');
INSERT INTO `l_visit_log` VALUES (3602, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 14:12:55');
INSERT INTO `l_visit_log` VALUES (3603, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 14:15:04');
INSERT INTO `l_visit_log` VALUES (3604, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 14:21:29');
INSERT INTO `l_visit_log` VALUES (3605, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 14:22:25');
INSERT INTO `l_visit_log` VALUES (3606, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 15:00:33');
INSERT INTO `l_visit_log` VALUES (3607, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 15:08:49');
INSERT INTO `l_visit_log` VALUES (3608, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 15:09:52');
INSERT INTO `l_visit_log` VALUES (3609, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 15:28:55');
INSERT INTO `l_visit_log` VALUES (3610, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 15:29:27');
INSERT INTO `l_visit_log` VALUES (3611, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 15:37:01');
INSERT INTO `l_visit_log` VALUES (3612, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 16:06:20');
INSERT INTO `l_visit_log` VALUES (3613, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-09-28 16:06:25');
INSERT INTO `l_visit_log` VALUES (3614, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 13:27:19');
INSERT INTO `l_visit_log` VALUES (3615, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 13:43:10');
INSERT INTO `l_visit_log` VALUES (3616, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 13:52:31');
INSERT INTO `l_visit_log` VALUES (3617, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 14:07:53');
INSERT INTO `l_visit_log` VALUES (3618, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 14:08:57');
INSERT INTO `l_visit_log` VALUES (3619, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 14:09:07');
INSERT INTO `l_visit_log` VALUES (3620, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 14:21:31');
INSERT INTO `l_visit_log` VALUES (3621, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 14:33:59');
INSERT INTO `l_visit_log` VALUES (3622, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 14:41:34');
INSERT INTO `l_visit_log` VALUES (3623, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 14:42:38');
INSERT INTO `l_visit_log` VALUES (3624, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 14:44:35');
INSERT INTO `l_visit_log` VALUES (3625, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 14:45:04');
INSERT INTO `l_visit_log` VALUES (3626, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 14:45:47');
INSERT INTO `l_visit_log` VALUES (3627, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 14:46:29');
INSERT INTO `l_visit_log` VALUES (3628, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 14:48:39');
INSERT INTO `l_visit_log` VALUES (3629, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 14:49:43');
INSERT INTO `l_visit_log` VALUES (3630, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 14:49:46');
INSERT INTO `l_visit_log` VALUES (3631, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 14:51:26');
INSERT INTO `l_visit_log` VALUES (3632, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 14:51:42');
INSERT INTO `l_visit_log` VALUES (3633, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 14:52:38');
INSERT INTO `l_visit_log` VALUES (3634, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 19:02:21');
INSERT INTO `l_visit_log` VALUES (3635, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 19:29:16');
INSERT INTO `l_visit_log` VALUES (3636, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 19:30:45');
INSERT INTO `l_visit_log` VALUES (3637, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 19:48:35');
INSERT INTO `l_visit_log` VALUES (3638, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 20:29:11');
INSERT INTO `l_visit_log` VALUES (3639, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 20:29:17');
INSERT INTO `l_visit_log` VALUES (3640, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 20:31:26');
INSERT INTO `l_visit_log` VALUES (3641, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 20:32:11');
INSERT INTO `l_visit_log` VALUES (3642, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 21:31:28');
INSERT INTO `l_visit_log` VALUES (3643, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 21:41:09');
INSERT INTO `l_visit_log` VALUES (3644, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 22:36:29');
INSERT INTO `l_visit_log` VALUES (3645, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 23:08:11');
INSERT INTO `l_visit_log` VALUES (3646, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 23:27:57');
INSERT INTO `l_visit_log` VALUES (3647, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 23:28:27');
INSERT INTO `l_visit_log` VALUES (3648, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 23:32:57');
INSERT INTO `l_visit_log` VALUES (3649, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 23:41:26');
INSERT INTO `l_visit_log` VALUES (3650, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 23:45:16');
INSERT INTO `l_visit_log` VALUES (3651, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 23:47:45');
INSERT INTO `l_visit_log` VALUES (3652, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 23:50:40');
INSERT INTO `l_visit_log` VALUES (3653, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-02 23:56:52');
INSERT INTO `l_visit_log` VALUES (3654, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 00:00:57');
INSERT INTO `l_visit_log` VALUES (3655, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 00:06:12');
INSERT INTO `l_visit_log` VALUES (3656, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 00:07:14');
INSERT INTO `l_visit_log` VALUES (3657, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 00:09:08');
INSERT INTO `l_visit_log` VALUES (3658, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 00:11:35');
INSERT INTO `l_visit_log` VALUES (3659, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 00:25:53');
INSERT INTO `l_visit_log` VALUES (3660, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 00:32:17');
INSERT INTO `l_visit_log` VALUES (3661, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 00:36:11');
INSERT INTO `l_visit_log` VALUES (3662, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 00:40:19');
INSERT INTO `l_visit_log` VALUES (3663, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 00:51:50');
INSERT INTO `l_visit_log` VALUES (3664, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 01:02:10');
INSERT INTO `l_visit_log` VALUES (3665, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 01:03:51');
INSERT INTO `l_visit_log` VALUES (3666, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 01:03:57');
INSERT INTO `l_visit_log` VALUES (3667, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 01:05:44');
INSERT INTO `l_visit_log` VALUES (3668, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 01:06:57');
INSERT INTO `l_visit_log` VALUES (3669, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 01:09:17');
INSERT INTO `l_visit_log` VALUES (3670, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 07:11:04');
INSERT INTO `l_visit_log` VALUES (3671, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 07:33:50');
INSERT INTO `l_visit_log` VALUES (3672, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 07:57:32');
INSERT INTO `l_visit_log` VALUES (3673, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 08:01:53');
INSERT INTO `l_visit_log` VALUES (3674, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 08:04:05');
INSERT INTO `l_visit_log` VALUES (3675, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 08:05:34');
INSERT INTO `l_visit_log` VALUES (3676, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 08:07:30');
INSERT INTO `l_visit_log` VALUES (3677, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 08:17:47');
INSERT INTO `l_visit_log` VALUES (3678, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 09:08:09');
INSERT INTO `l_visit_log` VALUES (3679, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 09:23:42');
INSERT INTO `l_visit_log` VALUES (3680, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 09:47:46');
INSERT INTO `l_visit_log` VALUES (3681, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 10:38:46');
INSERT INTO `l_visit_log` VALUES (3682, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 11:09:32');
INSERT INTO `l_visit_log` VALUES (3683, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 11:09:54');
INSERT INTO `l_visit_log` VALUES (3684, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 11:50:50');
INSERT INTO `l_visit_log` VALUES (3685, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 12:55:55');
INSERT INTO `l_visit_log` VALUES (3686, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 12:56:03');
INSERT INTO `l_visit_log` VALUES (3687, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 13:13:40');
INSERT INTO `l_visit_log` VALUES (3688, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 13:15:23');
INSERT INTO `l_visit_log` VALUES (3689, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 13:15:29');
INSERT INTO `l_visit_log` VALUES (3690, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 19:49:23');
INSERT INTO `l_visit_log` VALUES (3691, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-03 20:39:45');
INSERT INTO `l_visit_log` VALUES (3692, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-04 10:17:12');
INSERT INTO `l_visit_log` VALUES (3693, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-04 10:20:26');
INSERT INTO `l_visit_log` VALUES (3694, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-04 16:31:36');
INSERT INTO `l_visit_log` VALUES (3695, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-04 16:31:42');
INSERT INTO `l_visit_log` VALUES (3696, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-04 18:23:04');
INSERT INTO `l_visit_log` VALUES (3697, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-04 18:53:25');
INSERT INTO `l_visit_log` VALUES (3698, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-04 18:54:20');
INSERT INTO `l_visit_log` VALUES (3699, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-04 18:57:26');
INSERT INTO `l_visit_log` VALUES (3700, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-04 18:57:46');
INSERT INTO `l_visit_log` VALUES (3701, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-04 18:58:28');
INSERT INTO `l_visit_log` VALUES (3702, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-04 19:06:56');
INSERT INTO `l_visit_log` VALUES (3703, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-04 19:37:01');
INSERT INTO `l_visit_log` VALUES (3704, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-04 20:47:27');
INSERT INTO `l_visit_log` VALUES (3705, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-04 21:50:04');
INSERT INTO `l_visit_log` VALUES (3706, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-04 21:50:45');
INSERT INTO `l_visit_log` VALUES (3707, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-04 23:49:51');
INSERT INTO `l_visit_log` VALUES (3708, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 00:15:06');
INSERT INTO `l_visit_log` VALUES (3709, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 00:34:03');
INSERT INTO `l_visit_log` VALUES (3710, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 01:12:30');
INSERT INTO `l_visit_log` VALUES (3711, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 01:20:36');
INSERT INTO `l_visit_log` VALUES (3712, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 01:37:12');
INSERT INTO `l_visit_log` VALUES (3713, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 01:41:22');
INSERT INTO `l_visit_log` VALUES (3714, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 01:43:37');
INSERT INTO `l_visit_log` VALUES (3715, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 01:50:24');
INSERT INTO `l_visit_log` VALUES (3716, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 02:00:11');
INSERT INTO `l_visit_log` VALUES (3717, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 02:02:07');
INSERT INTO `l_visit_log` VALUES (3718, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 10:36:46');
INSERT INTO `l_visit_log` VALUES (3719, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 10:52:55');
INSERT INTO `l_visit_log` VALUES (3720, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 10:53:10');
INSERT INTO `l_visit_log` VALUES (3721, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 10:53:43');
INSERT INTO `l_visit_log` VALUES (3722, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 10:54:37');
INSERT INTO `l_visit_log` VALUES (3723, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 10:59:05');
INSERT INTO `l_visit_log` VALUES (3724, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 10:59:17');
INSERT INTO `l_visit_log` VALUES (3725, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 10:59:53');
INSERT INTO `l_visit_log` VALUES (3726, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 11:01:14');
INSERT INTO `l_visit_log` VALUES (3727, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 11:02:39');
INSERT INTO `l_visit_log` VALUES (3728, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 11:02:43');
INSERT INTO `l_visit_log` VALUES (3729, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 11:03:59');
INSERT INTO `l_visit_log` VALUES (3730, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 11:05:19');
INSERT INTO `l_visit_log` VALUES (3731, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 11:05:42');
INSERT INTO `l_visit_log` VALUES (3732, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 11:21:12');
INSERT INTO `l_visit_log` VALUES (3733, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 11:21:36');
INSERT INTO `l_visit_log` VALUES (3734, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 11:23:44');
INSERT INTO `l_visit_log` VALUES (3735, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 11:36:57');
INSERT INTO `l_visit_log` VALUES (3736, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 11:38:35');
INSERT INTO `l_visit_log` VALUES (3737, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 11:38:37');
INSERT INTO `l_visit_log` VALUES (3738, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 12:17:36');
INSERT INTO `l_visit_log` VALUES (3739, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 12:23:19');
INSERT INTO `l_visit_log` VALUES (3740, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 12:23:31');
INSERT INTO `l_visit_log` VALUES (3741, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 12:31:10');
INSERT INTO `l_visit_log` VALUES (3742, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 12:53:10');
INSERT INTO `l_visit_log` VALUES (3743, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 13:03:54');
INSERT INTO `l_visit_log` VALUES (3744, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 13:26:30');
INSERT INTO `l_visit_log` VALUES (3745, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 13:31:00');
INSERT INTO `l_visit_log` VALUES (3746, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 13:35:24');
INSERT INTO `l_visit_log` VALUES (3747, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 13:45:52');
INSERT INTO `l_visit_log` VALUES (3748, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 13:45:59');
INSERT INTO `l_visit_log` VALUES (3749, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 13:48:04');
INSERT INTO `l_visit_log` VALUES (3750, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 13:54:34');
INSERT INTO `l_visit_log` VALUES (3751, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 14:34:08');
INSERT INTO `l_visit_log` VALUES (3752, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 14:34:25');
INSERT INTO `l_visit_log` VALUES (3753, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 14:52:10');
INSERT INTO `l_visit_log` VALUES (3754, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 15:06:28');
INSERT INTO `l_visit_log` VALUES (3755, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 15:07:21');
INSERT INTO `l_visit_log` VALUES (3756, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 16:08:27');
INSERT INTO `l_visit_log` VALUES (3757, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 16:21:44');
INSERT INTO `l_visit_log` VALUES (3758, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 16:27:49');
INSERT INTO `l_visit_log` VALUES (3759, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 17:09:27');
INSERT INTO `l_visit_log` VALUES (3760, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 17:11:01');
INSERT INTO `l_visit_log` VALUES (3761, '关于', '198.18.0.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 17:18:08');
INSERT INTO `l_visit_log` VALUES (3762, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 23:31:40');
INSERT INTO `l_visit_log` VALUES (3763, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-05 23:43:05');
INSERT INTO `l_visit_log` VALUES (3764, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 00:28:14');
INSERT INTO `l_visit_log` VALUES (3765, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 01:10:31');
INSERT INTO `l_visit_log` VALUES (3766, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 01:17:35');
INSERT INTO `l_visit_log` VALUES (3767, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 01:28:23');
INSERT INTO `l_visit_log` VALUES (3768, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 01:30:12');
INSERT INTO `l_visit_log` VALUES (3769, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 01:33:18');
INSERT INTO `l_visit_log` VALUES (3770, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 02:01:44');
INSERT INTO `l_visit_log` VALUES (3771, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 02:09:45');
INSERT INTO `l_visit_log` VALUES (3772, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 02:15:08');
INSERT INTO `l_visit_log` VALUES (3773, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 02:38:58');
INSERT INTO `l_visit_log` VALUES (3774, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 02:41:53');
INSERT INTO `l_visit_log` VALUES (3775, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 09:04:56');
INSERT INTO `l_visit_log` VALUES (3776, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 09:19:07');
INSERT INTO `l_visit_log` VALUES (3777, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 09:21:27');
INSERT INTO `l_visit_log` VALUES (3778, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 09:21:45');
INSERT INTO `l_visit_log` VALUES (3779, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 09:51:43');
INSERT INTO `l_visit_log` VALUES (3780, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 09:57:18');
INSERT INTO `l_visit_log` VALUES (3781, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 10:09:49');
INSERT INTO `l_visit_log` VALUES (3782, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 10:12:18');
INSERT INTO `l_visit_log` VALUES (3783, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 10:15:27');
INSERT INTO `l_visit_log` VALUES (3784, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 10:15:55');
INSERT INTO `l_visit_log` VALUES (3785, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 10:16:28');
INSERT INTO `l_visit_log` VALUES (3786, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 11:48:05');
INSERT INTO `l_visit_log` VALUES (3787, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 12:23:16');
INSERT INTO `l_visit_log` VALUES (3788, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 12:23:47');
INSERT INTO `l_visit_log` VALUES (3789, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 12:23:54');
INSERT INTO `l_visit_log` VALUES (3790, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 12:26:38');
INSERT INTO `l_visit_log` VALUES (3791, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 12:28:00');
INSERT INTO `l_visit_log` VALUES (3792, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 12:39:56');
INSERT INTO `l_visit_log` VALUES (3793, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 12:40:49');
INSERT INTO `l_visit_log` VALUES (3794, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 12:42:15');
INSERT INTO `l_visit_log` VALUES (3795, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 13:01:41');
INSERT INTO `l_visit_log` VALUES (3796, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 13:40:29');
INSERT INTO `l_visit_log` VALUES (3797, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 13:44:12');
INSERT INTO `l_visit_log` VALUES (3798, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 13:44:22');
INSERT INTO `l_visit_log` VALUES (3799, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 13:46:11');
INSERT INTO `l_visit_log` VALUES (3800, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 13:48:09');
INSERT INTO `l_visit_log` VALUES (3801, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 13:50:04');
INSERT INTO `l_visit_log` VALUES (3802, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 13:50:27');
INSERT INTO `l_visit_log` VALUES (3803, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 13:50:52');
INSERT INTO `l_visit_log` VALUES (3804, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 13:51:08');
INSERT INTO `l_visit_log` VALUES (3805, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 14:10:31');
INSERT INTO `l_visit_log` VALUES (3806, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 14:14:41');
INSERT INTO `l_visit_log` VALUES (3807, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 14:30:18');
INSERT INTO `l_visit_log` VALUES (3808, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 14:34:05');
INSERT INTO `l_visit_log` VALUES (3809, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 14:38:40');
INSERT INTO `l_visit_log` VALUES (3810, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 19:50:00');
INSERT INTO `l_visit_log` VALUES (3811, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 20:06:52');
INSERT INTO `l_visit_log` VALUES (3812, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 21:33:37');
INSERT INTO `l_visit_log` VALUES (3813, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 21:39:47');
INSERT INTO `l_visit_log` VALUES (3814, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 21:41:01');
INSERT INTO `l_visit_log` VALUES (3815, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 23:08:52');
INSERT INTO `l_visit_log` VALUES (3816, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 23:08:58');
INSERT INTO `l_visit_log` VALUES (3817, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 23:11:47');
INSERT INTO `l_visit_log` VALUES (3818, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 23:12:09');
INSERT INTO `l_visit_log` VALUES (3819, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 23:13:40');
INSERT INTO `l_visit_log` VALUES (3820, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 23:43:51');
INSERT INTO `l_visit_log` VALUES (3821, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 23:43:54');
INSERT INTO `l_visit_log` VALUES (3822, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 23:44:14');
INSERT INTO `l_visit_log` VALUES (3823, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-06 23:56:18');
INSERT INTO `l_visit_log` VALUES (3824, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 00:02:33');
INSERT INTO `l_visit_log` VALUES (3825, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 00:03:05');
INSERT INTO `l_visit_log` VALUES (3826, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 00:03:17');
INSERT INTO `l_visit_log` VALUES (3827, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 00:03:22');
INSERT INTO `l_visit_log` VALUES (3828, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 00:03:29');
INSERT INTO `l_visit_log` VALUES (3829, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 00:03:33');
INSERT INTO `l_visit_log` VALUES (3830, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 00:04:50');
INSERT INTO `l_visit_log` VALUES (3831, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 00:07:08');
INSERT INTO `l_visit_log` VALUES (3832, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 00:07:14');
INSERT INTO `l_visit_log` VALUES (3833, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 00:07:42');
INSERT INTO `l_visit_log` VALUES (3834, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 00:12:26');
INSERT INTO `l_visit_log` VALUES (3835, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 00:13:26');
INSERT INTO `l_visit_log` VALUES (3836, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 00:15:25');
INSERT INTO `l_visit_log` VALUES (3837, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 00:16:02');
INSERT INTO `l_visit_log` VALUES (3838, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 09:02:36');
INSERT INTO `l_visit_log` VALUES (3839, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 09:02:49');
INSERT INTO `l_visit_log` VALUES (3840, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 09:04:21');
INSERT INTO `l_visit_log` VALUES (3841, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 09:21:05');
INSERT INTO `l_visit_log` VALUES (3842, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 09:21:10');
INSERT INTO `l_visit_log` VALUES (3843, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 09:21:15');
INSERT INTO `l_visit_log` VALUES (3844, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 09:21:25');
INSERT INTO `l_visit_log` VALUES (3845, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 09:21:34');
INSERT INTO `l_visit_log` VALUES (3846, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 09:22:38');
INSERT INTO `l_visit_log` VALUES (3847, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 09:44:30');
INSERT INTO `l_visit_log` VALUES (3848, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 09:45:41');
INSERT INTO `l_visit_log` VALUES (3849, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 11:09:01');
INSERT INTO `l_visit_log` VALUES (3850, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 11:09:47');
INSERT INTO `l_visit_log` VALUES (3851, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 12:56:31');
INSERT INTO `l_visit_log` VALUES (3852, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 13:06:44');
INSERT INTO `l_visit_log` VALUES (3853, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 13:25:03');
INSERT INTO `l_visit_log` VALUES (3854, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 13:48:19');
INSERT INTO `l_visit_log` VALUES (3855, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 13:49:49');
INSERT INTO `l_visit_log` VALUES (3856, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 13:51:06');
INSERT INTO `l_visit_log` VALUES (3857, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 13:51:22');
INSERT INTO `l_visit_log` VALUES (3858, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 13:55:15');
INSERT INTO `l_visit_log` VALUES (3859, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 13:55:39');
INSERT INTO `l_visit_log` VALUES (3860, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 13:56:33');
INSERT INTO `l_visit_log` VALUES (3861, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 13:59:00');
INSERT INTO `l_visit_log` VALUES (3862, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 14:18:35');
INSERT INTO `l_visit_log` VALUES (3863, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 14:20:29');
INSERT INTO `l_visit_log` VALUES (3864, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 14:32:19');
INSERT INTO `l_visit_log` VALUES (3865, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 14:42:37');
INSERT INTO `l_visit_log` VALUES (3866, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 18:14:20');
INSERT INTO `l_visit_log` VALUES (3867, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 18:31:00');
INSERT INTO `l_visit_log` VALUES (3868, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 18:31:57');
INSERT INTO `l_visit_log` VALUES (3869, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 18:32:14');
INSERT INTO `l_visit_log` VALUES (3870, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 18:33:15');
INSERT INTO `l_visit_log` VALUES (3871, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 18:34:04');
INSERT INTO `l_visit_log` VALUES (3872, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 18:34:51');
INSERT INTO `l_visit_log` VALUES (3873, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 18:36:51');
INSERT INTO `l_visit_log` VALUES (3874, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 18:37:07');
INSERT INTO `l_visit_log` VALUES (3875, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 18:37:33');
INSERT INTO `l_visit_log` VALUES (3876, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 18:40:33');
INSERT INTO `l_visit_log` VALUES (3877, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 18:40:59');
INSERT INTO `l_visit_log` VALUES (3878, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 18:45:04');
INSERT INTO `l_visit_log` VALUES (3879, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 18:46:32');
INSERT INTO `l_visit_log` VALUES (3880, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:06:36');
INSERT INTO `l_visit_log` VALUES (3881, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:08:11');
INSERT INTO `l_visit_log` VALUES (3882, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:15:05');
INSERT INTO `l_visit_log` VALUES (3883, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:15:12');
INSERT INTO `l_visit_log` VALUES (3884, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:19:10');
INSERT INTO `l_visit_log` VALUES (3885, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:35:16');
INSERT INTO `l_visit_log` VALUES (3886, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:35:24');
INSERT INTO `l_visit_log` VALUES (3887, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:36:22');
INSERT INTO `l_visit_log` VALUES (3888, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:36:40');
INSERT INTO `l_visit_log` VALUES (3889, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:36:57');
INSERT INTO `l_visit_log` VALUES (3890, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:37:01');
INSERT INTO `l_visit_log` VALUES (3891, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:37:18');
INSERT INTO `l_visit_log` VALUES (3892, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:37:33');
INSERT INTO `l_visit_log` VALUES (3893, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:37:38');
INSERT INTO `l_visit_log` VALUES (3894, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:37:57');
INSERT INTO `l_visit_log` VALUES (3895, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:38:09');
INSERT INTO `l_visit_log` VALUES (3896, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:38:12');
INSERT INTO `l_visit_log` VALUES (3897, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:38:36');
INSERT INTO `l_visit_log` VALUES (3898, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:38:39');
INSERT INTO `l_visit_log` VALUES (3899, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:40:05');
INSERT INTO `l_visit_log` VALUES (3900, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:41:55');
INSERT INTO `l_visit_log` VALUES (3901, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:43:54');
INSERT INTO `l_visit_log` VALUES (3902, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:45:09');
INSERT INTO `l_visit_log` VALUES (3903, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:47:00');
INSERT INTO `l_visit_log` VALUES (3904, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:47:48');
INSERT INTO `l_visit_log` VALUES (3905, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:48:40');
INSERT INTO `l_visit_log` VALUES (3906, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:50:02');
INSERT INTO `l_visit_log` VALUES (3907, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:50:04');
INSERT INTO `l_visit_log` VALUES (3908, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:50:23');
INSERT INTO `l_visit_log` VALUES (3909, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:50:48');
INSERT INTO `l_visit_log` VALUES (3910, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:50:56');
INSERT INTO `l_visit_log` VALUES (3911, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:51:07');
INSERT INTO `l_visit_log` VALUES (3912, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:51:09');
INSERT INTO `l_visit_log` VALUES (3913, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:52:57');
INSERT INTO `l_visit_log` VALUES (3914, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:55:00');
INSERT INTO `l_visit_log` VALUES (3915, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:55:05');
INSERT INTO `l_visit_log` VALUES (3916, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:55:16');
INSERT INTO `l_visit_log` VALUES (3917, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:56:12');
INSERT INTO `l_visit_log` VALUES (3918, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:56:37');
INSERT INTO `l_visit_log` VALUES (3919, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:56:47');
INSERT INTO `l_visit_log` VALUES (3920, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:58:26');
INSERT INTO `l_visit_log` VALUES (3921, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 19:58:34');
INSERT INTO `l_visit_log` VALUES (3922, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 20:00:14');
INSERT INTO `l_visit_log` VALUES (3923, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 20:00:49');
INSERT INTO `l_visit_log` VALUES (3924, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 20:00:50');
INSERT INTO `l_visit_log` VALUES (3925, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 20:01:06');
INSERT INTO `l_visit_log` VALUES (3926, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 20:01:08');
INSERT INTO `l_visit_log` VALUES (3927, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 20:01:37');
INSERT INTO `l_visit_log` VALUES (3928, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 20:01:39');
INSERT INTO `l_visit_log` VALUES (3929, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 20:02:08');
INSERT INTO `l_visit_log` VALUES (3930, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 20:03:52');
INSERT INTO `l_visit_log` VALUES (3931, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 20:03:55');
INSERT INTO `l_visit_log` VALUES (3932, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 20:04:11');
INSERT INTO `l_visit_log` VALUES (3933, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 20:04:58');
INSERT INTO `l_visit_log` VALUES (3934, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 20:05:15');
INSERT INTO `l_visit_log` VALUES (3935, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 20:05:25');
INSERT INTO `l_visit_log` VALUES (3936, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 20:06:27');
INSERT INTO `l_visit_log` VALUES (3937, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 20:06:39');
INSERT INTO `l_visit_log` VALUES (3938, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 20:08:17');
INSERT INTO `l_visit_log` VALUES (3939, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 20:08:21');
INSERT INTO `l_visit_log` VALUES (3940, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 20:09:58');
INSERT INTO `l_visit_log` VALUES (3941, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 20:48:59');
INSERT INTO `l_visit_log` VALUES (3942, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 20:49:24');
INSERT INTO `l_visit_log` VALUES (3943, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 20:51:32');
INSERT INTO `l_visit_log` VALUES (3944, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 20:52:58');
INSERT INTO `l_visit_log` VALUES (3945, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 21:02:13');
INSERT INTO `l_visit_log` VALUES (3946, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 21:03:49');
INSERT INTO `l_visit_log` VALUES (3947, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 21:05:33');
INSERT INTO `l_visit_log` VALUES (3948, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 21:06:02');
INSERT INTO `l_visit_log` VALUES (3949, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 21:24:31');
INSERT INTO `l_visit_log` VALUES (3950, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 21:24:47');
INSERT INTO `l_visit_log` VALUES (3951, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 21:39:13');
INSERT INTO `l_visit_log` VALUES (3952, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 21:39:31');
INSERT INTO `l_visit_log` VALUES (3953, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 21:39:39');
INSERT INTO `l_visit_log` VALUES (3954, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 21:39:42');
INSERT INTO `l_visit_log` VALUES (3955, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 21:45:57');
INSERT INTO `l_visit_log` VALUES (3956, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 21:55:54');
INSERT INTO `l_visit_log` VALUES (3957, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 22:03:54');
INSERT INTO `l_visit_log` VALUES (3958, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 22:04:14');
INSERT INTO `l_visit_log` VALUES (3959, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 22:08:13');
INSERT INTO `l_visit_log` VALUES (3960, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-07 22:09:14');
INSERT INTO `l_visit_log` VALUES (3961, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 08:19:02');
INSERT INTO `l_visit_log` VALUES (3962, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 08:25:27');
INSERT INTO `l_visit_log` VALUES (3963, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 08:25:57');
INSERT INTO `l_visit_log` VALUES (3964, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 08:27:13');
INSERT INTO `l_visit_log` VALUES (3965, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 08:29:02');
INSERT INTO `l_visit_log` VALUES (3966, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 08:31:27');
INSERT INTO `l_visit_log` VALUES (3967, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 08:32:58');
INSERT INTO `l_visit_log` VALUES (3968, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 08:38:17');
INSERT INTO `l_visit_log` VALUES (3969, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 08:40:30');
INSERT INTO `l_visit_log` VALUES (3970, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 08:42:38');
INSERT INTO `l_visit_log` VALUES (3971, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 08:46:29');
INSERT INTO `l_visit_log` VALUES (3972, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 08:52:27');
INSERT INTO `l_visit_log` VALUES (3973, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 08:53:35');
INSERT INTO `l_visit_log` VALUES (3974, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 09:11:18');
INSERT INTO `l_visit_log` VALUES (3975, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 09:14:24');
INSERT INTO `l_visit_log` VALUES (3976, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 09:19:42');
INSERT INTO `l_visit_log` VALUES (3977, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 10:08:08');
INSERT INTO `l_visit_log` VALUES (3978, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 10:47:52');
INSERT INTO `l_visit_log` VALUES (3979, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 10:48:47');
INSERT INTO `l_visit_log` VALUES (3980, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 10:48:55');
INSERT INTO `l_visit_log` VALUES (3981, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 10:58:24');
INSERT INTO `l_visit_log` VALUES (3982, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 11:32:02');
INSERT INTO `l_visit_log` VALUES (3983, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 12:57:46');
INSERT INTO `l_visit_log` VALUES (3984, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 13:13:26');
INSERT INTO `l_visit_log` VALUES (3985, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 13:26:59');
INSERT INTO `l_visit_log` VALUES (3986, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 13:28:09');
INSERT INTO `l_visit_log` VALUES (3987, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 13:29:27');
INSERT INTO `l_visit_log` VALUES (3988, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 13:30:36');
INSERT INTO `l_visit_log` VALUES (3989, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 14:15:16');
INSERT INTO `l_visit_log` VALUES (3990, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 17:45:38');
INSERT INTO `l_visit_log` VALUES (3991, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 18:55:45');
INSERT INTO `l_visit_log` VALUES (3992, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 19:10:11');
INSERT INTO `l_visit_log` VALUES (3993, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 19:10:16');
INSERT INTO `l_visit_log` VALUES (3994, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 19:24:48');
INSERT INTO `l_visit_log` VALUES (3995, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 19:33:57');
INSERT INTO `l_visit_log` VALUES (3996, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 19:35:20');
INSERT INTO `l_visit_log` VALUES (3997, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 19:47:11');
INSERT INTO `l_visit_log` VALUES (3998, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 19:59:09');
INSERT INTO `l_visit_log` VALUES (3999, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 20:09:05');
INSERT INTO `l_visit_log` VALUES (4000, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 20:10:15');
INSERT INTO `l_visit_log` VALUES (4001, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 20:10:21');
INSERT INTO `l_visit_log` VALUES (4002, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 20:21:19');
INSERT INTO `l_visit_log` VALUES (4003, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 20:40:43');
INSERT INTO `l_visit_log` VALUES (4004, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 21:20:37');
INSERT INTO `l_visit_log` VALUES (4005, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 21:37:58');
INSERT INTO `l_visit_log` VALUES (4006, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-08 21:48:35');
INSERT INTO `l_visit_log` VALUES (4007, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 08:54:53');
INSERT INTO `l_visit_log` VALUES (4008, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 09:28:19');
INSERT INTO `l_visit_log` VALUES (4009, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 09:45:11');
INSERT INTO `l_visit_log` VALUES (4010, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 10:01:14');
INSERT INTO `l_visit_log` VALUES (4011, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 10:47:04');
INSERT INTO `l_visit_log` VALUES (4012, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 11:11:27');
INSERT INTO `l_visit_log` VALUES (4013, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 11:14:23');
INSERT INTO `l_visit_log` VALUES (4014, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 11:24:08');
INSERT INTO `l_visit_log` VALUES (4015, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 11:24:58');
INSERT INTO `l_visit_log` VALUES (4016, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 11:25:52');
INSERT INTO `l_visit_log` VALUES (4017, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 11:26:13');
INSERT INTO `l_visit_log` VALUES (4018, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 11:26:44');
INSERT INTO `l_visit_log` VALUES (4019, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 11:28:11');
INSERT INTO `l_visit_log` VALUES (4020, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 11:33:07');
INSERT INTO `l_visit_log` VALUES (4021, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 11:34:23');
INSERT INTO `l_visit_log` VALUES (4022, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 11:36:10');
INSERT INTO `l_visit_log` VALUES (4023, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 117', '2023-10-09 11:39:11');
INSERT INTO `l_visit_log` VALUES (4024, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 117', '2023-10-09 11:39:34');
INSERT INTO `l_visit_log` VALUES (4025, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 11:41:43');
INSERT INTO `l_visit_log` VALUES (4026, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 117', '2023-10-09 12:01:45');
INSERT INTO `l_visit_log` VALUES (4027, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 12:21:49');
INSERT INTO `l_visit_log` VALUES (4028, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 12:43:43');
INSERT INTO `l_visit_log` VALUES (4029, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 13:31:28');
INSERT INTO `l_visit_log` VALUES (4030, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 13:37:31');
INSERT INTO `l_visit_log` VALUES (4031, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 13:46:34');
INSERT INTO `l_visit_log` VALUES (4032, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 14:00:47');
INSERT INTO `l_visit_log` VALUES (4033, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 14:00:54');
INSERT INTO `l_visit_log` VALUES (4034, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 14:01:04');
INSERT INTO `l_visit_log` VALUES (4035, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 14:02:03');
INSERT INTO `l_visit_log` VALUES (4036, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 14:31:49');
INSERT INTO `l_visit_log` VALUES (4037, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 14:35:49');
INSERT INTO `l_visit_log` VALUES (4038, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 14:46:07');
INSERT INTO `l_visit_log` VALUES (4039, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 14:47:20');
INSERT INTO `l_visit_log` VALUES (4040, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 14:48:44');
INSERT INTO `l_visit_log` VALUES (4041, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 14:51:01');
INSERT INTO `l_visit_log` VALUES (4042, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 14:52:38');
INSERT INTO `l_visit_log` VALUES (4043, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 14:53:58');
INSERT INTO `l_visit_log` VALUES (4044, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 14:55:32');
INSERT INTO `l_visit_log` VALUES (4045, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 14:57:14');
INSERT INTO `l_visit_log` VALUES (4046, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 14:57:36');
INSERT INTO `l_visit_log` VALUES (4047, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 15:00:12');
INSERT INTO `l_visit_log` VALUES (4048, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 16:15:34');
INSERT INTO `l_visit_log` VALUES (4049, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 16:42:05');
INSERT INTO `l_visit_log` VALUES (4050, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 16:57:19');
INSERT INTO `l_visit_log` VALUES (4051, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 17:07:32');
INSERT INTO `l_visit_log` VALUES (4052, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 17:19:10');
INSERT INTO `l_visit_log` VALUES (4053, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 17:29:34');
INSERT INTO `l_visit_log` VALUES (4054, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 17:49:38');
INSERT INTO `l_visit_log` VALUES (4055, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 17:55:51');
INSERT INTO `l_visit_log` VALUES (4056, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 18:34:33');
INSERT INTO `l_visit_log` VALUES (4057, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 18:45:46');
INSERT INTO `l_visit_log` VALUES (4058, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 18:56:34');
INSERT INTO `l_visit_log` VALUES (4059, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 19:01:53');
INSERT INTO `l_visit_log` VALUES (4060, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 19:05:14');
INSERT INTO `l_visit_log` VALUES (4061, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 19:06:50');
INSERT INTO `l_visit_log` VALUES (4062, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 19:07:39');
INSERT INTO `l_visit_log` VALUES (4063, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 19:11:47');
INSERT INTO `l_visit_log` VALUES (4064, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 117', '2023-10-09 19:23:18');
INSERT INTO `l_visit_log` VALUES (4065, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 117', '2023-10-09 19:32:36');
INSERT INTO `l_visit_log` VALUES (4066, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 19:32:37');
INSERT INTO `l_visit_log` VALUES (4067, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 117', '2023-10-09 19:37:12');
INSERT INTO `l_visit_log` VALUES (4068, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 19:37:14');
INSERT INTO `l_visit_log` VALUES (4069, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-09 20:34:12');
INSERT INTO `l_visit_log` VALUES (4070, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 12:52:43');
INSERT INTO `l_visit_log` VALUES (4071, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 13:15:44');
INSERT INTO `l_visit_log` VALUES (4072, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 13:17:07');
INSERT INTO `l_visit_log` VALUES (4073, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 13:20:05');
INSERT INTO `l_visit_log` VALUES (4074, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 13:20:31');
INSERT INTO `l_visit_log` VALUES (4075, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 13:25:22');
INSERT INTO `l_visit_log` VALUES (4076, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 13:26:46');
INSERT INTO `l_visit_log` VALUES (4077, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 13:39:55');
INSERT INTO `l_visit_log` VALUES (4078, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 13:39:58');
INSERT INTO `l_visit_log` VALUES (4079, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 13:40:53');
INSERT INTO `l_visit_log` VALUES (4080, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 13:42:13');
INSERT INTO `l_visit_log` VALUES (4081, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 13:51:06');
INSERT INTO `l_visit_log` VALUES (4082, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 13:54:24');
INSERT INTO `l_visit_log` VALUES (4083, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 13:54:51');
INSERT INTO `l_visit_log` VALUES (4084, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 13:54:53');
INSERT INTO `l_visit_log` VALUES (4085, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 13:54:56');
INSERT INTO `l_visit_log` VALUES (4086, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 13:54:57');
INSERT INTO `l_visit_log` VALUES (4087, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 13:54:58');
INSERT INTO `l_visit_log` VALUES (4088, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 13:54:59');
INSERT INTO `l_visit_log` VALUES (4089, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 13:55:00');
INSERT INTO `l_visit_log` VALUES (4090, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 13:55:02');
INSERT INTO `l_visit_log` VALUES (4091, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 15:13:14');
INSERT INTO `l_visit_log` VALUES (4092, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 15:17:08');
INSERT INTO `l_visit_log` VALUES (4093, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 15:17:26');
INSERT INTO `l_visit_log` VALUES (4094, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 15:19:44');
INSERT INTO `l_visit_log` VALUES (4095, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 15:21:15');
INSERT INTO `l_visit_log` VALUES (4096, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 15:21:25');
INSERT INTO `l_visit_log` VALUES (4097, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 15:44:09');
INSERT INTO `l_visit_log` VALUES (4098, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 15:46:29');
INSERT INTO `l_visit_log` VALUES (4099, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 15:49:00');
INSERT INTO `l_visit_log` VALUES (4100, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 15:49:41');
INSERT INTO `l_visit_log` VALUES (4101, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 15:51:04');
INSERT INTO `l_visit_log` VALUES (4102, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 15:55:04');
INSERT INTO `l_visit_log` VALUES (4103, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 16:08:29');
INSERT INTO `l_visit_log` VALUES (4104, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 16:19:00');
INSERT INTO `l_visit_log` VALUES (4105, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 117', '2023-10-10 16:19:34');
INSERT INTO `l_visit_log` VALUES (4106, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 16:34:04');
INSERT INTO `l_visit_log` VALUES (4107, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 16:36:29');
INSERT INTO `l_visit_log` VALUES (4108, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 117', '2023-10-10 16:36:29');
INSERT INTO `l_visit_log` VALUES (4109, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 117', '2023-10-10 16:36:50');
INSERT INTO `l_visit_log` VALUES (4110, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 16:45:48');
INSERT INTO `l_visit_log` VALUES (4111, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 17:00:16');
INSERT INTO `l_visit_log` VALUES (4112, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 17:01:20');
INSERT INTO `l_visit_log` VALUES (4113, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 117', '2023-10-10 17:01:21');
INSERT INTO `l_visit_log` VALUES (4114, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 17:18:14');
INSERT INTO `l_visit_log` VALUES (4115, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 117', '2023-10-10 17:18:15');
INSERT INTO `l_visit_log` VALUES (4116, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 17:18:34');
INSERT INTO `l_visit_log` VALUES (4117, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 17:18:57');
INSERT INTO `l_visit_log` VALUES (4118, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 117', '2023-10-10 17:18:58');
INSERT INTO `l_visit_log` VALUES (4119, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 17:19:08');
INSERT INTO `l_visit_log` VALUES (4120, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 117', '2023-10-10 17:19:10');
INSERT INTO `l_visit_log` VALUES (4121, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 17:20:13');
INSERT INTO `l_visit_log` VALUES (4122, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 117', '2023-10-10 17:20:13');
INSERT INTO `l_visit_log` VALUES (4123, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 17:21:48');
INSERT INTO `l_visit_log` VALUES (4124, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 17:24:26');
INSERT INTO `l_visit_log` VALUES (4125, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 117', '2023-10-10 17:24:27');
INSERT INTO `l_visit_log` VALUES (4126, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 17:32:58');
INSERT INTO `l_visit_log` VALUES (4127, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 17:50:58');
INSERT INTO `l_visit_log` VALUES (4128, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 17:54:21');
INSERT INTO `l_visit_log` VALUES (4129, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 18:27:55');
INSERT INTO `l_visit_log` VALUES (4130, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 18:44:59');
INSERT INTO `l_visit_log` VALUES (4131, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 19:04:45');
INSERT INTO `l_visit_log` VALUES (4132, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 19:06:42');
INSERT INTO `l_visit_log` VALUES (4133, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 19:28:02');
INSERT INTO `l_visit_log` VALUES (4134, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 19:28:05');
INSERT INTO `l_visit_log` VALUES (4135, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 19:28:06');
INSERT INTO `l_visit_log` VALUES (4136, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 19:28:06');
INSERT INTO `l_visit_log` VALUES (4137, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 19:28:06');
INSERT INTO `l_visit_log` VALUES (4138, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 19:28:27');
INSERT INTO `l_visit_log` VALUES (4139, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 19:33:08');
INSERT INTO `l_visit_log` VALUES (4140, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 20:00:29');
INSERT INTO `l_visit_log` VALUES (4141, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 20:01:09');
INSERT INTO `l_visit_log` VALUES (4142, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 20:07:39');
INSERT INTO `l_visit_log` VALUES (4143, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 20:14:03');
INSERT INTO `l_visit_log` VALUES (4144, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 20:17:13');
INSERT INTO `l_visit_log` VALUES (4145, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 20:30:52');
INSERT INTO `l_visit_log` VALUES (4146, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 20:41:02');
INSERT INTO `l_visit_log` VALUES (4147, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 20:41:09');
INSERT INTO `l_visit_log` VALUES (4148, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 20:41:39');
INSERT INTO `l_visit_log` VALUES (4149, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 20:43:28');
INSERT INTO `l_visit_log` VALUES (4150, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 21:10:00');
INSERT INTO `l_visit_log` VALUES (4151, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 21:42:52');
INSERT INTO `l_visit_log` VALUES (4152, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 21:44:00');
INSERT INTO `l_visit_log` VALUES (4153, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 21:46:41');
INSERT INTO `l_visit_log` VALUES (4154, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 21:49:43');
INSERT INTO `l_visit_log` VALUES (4155, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-10 21:56:27');
INSERT INTO `l_visit_log` VALUES (4156, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 08:28:30');
INSERT INTO `l_visit_log` VALUES (4157, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 08:51:18');
INSERT INTO `l_visit_log` VALUES (4158, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 08:53:03');
INSERT INTO `l_visit_log` VALUES (4159, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 09:13:05');
INSERT INTO `l_visit_log` VALUES (4160, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 09:14:26');
INSERT INTO `l_visit_log` VALUES (4161, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 09:17:42');
INSERT INTO `l_visit_log` VALUES (4162, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 09:21:05');
INSERT INTO `l_visit_log` VALUES (4163, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 09:54:16');
INSERT INTO `l_visit_log` VALUES (4164, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 09:54:31');
INSERT INTO `l_visit_log` VALUES (4165, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 10:25:38');
INSERT INTO `l_visit_log` VALUES (4166, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 10:52:53');
INSERT INTO `l_visit_log` VALUES (4167, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 10:58:34');
INSERT INTO `l_visit_log` VALUES (4168, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 11:03:54');
INSERT INTO `l_visit_log` VALUES (4169, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 11:05:31');
INSERT INTO `l_visit_log` VALUES (4170, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 11:13:42');
INSERT INTO `l_visit_log` VALUES (4171, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 13:14:35');
INSERT INTO `l_visit_log` VALUES (4172, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 13:33:53');
INSERT INTO `l_visit_log` VALUES (4173, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 13:49:00');
INSERT INTO `l_visit_log` VALUES (4174, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 13:50:13');
INSERT INTO `l_visit_log` VALUES (4175, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 13:52:27');
INSERT INTO `l_visit_log` VALUES (4176, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 14:07:20');
INSERT INTO `l_visit_log` VALUES (4177, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 14:28:37');
INSERT INTO `l_visit_log` VALUES (4178, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 14:39:54');
INSERT INTO `l_visit_log` VALUES (4179, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 14:42:40');
INSERT INTO `l_visit_log` VALUES (4180, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 14:44:22');
INSERT INTO `l_visit_log` VALUES (4181, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 14:58:57');
INSERT INTO `l_visit_log` VALUES (4182, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 15:02:14');
INSERT INTO `l_visit_log` VALUES (4183, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 15:03:29');
INSERT INTO `l_visit_log` VALUES (4184, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 15:05:49');
INSERT INTO `l_visit_log` VALUES (4185, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 15:06:30');
INSERT INTO `l_visit_log` VALUES (4186, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 15:07:51');
INSERT INTO `l_visit_log` VALUES (4187, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 15:09:08');
INSERT INTO `l_visit_log` VALUES (4188, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 15:17:29');
INSERT INTO `l_visit_log` VALUES (4189, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 15:22:10');
INSERT INTO `l_visit_log` VALUES (4190, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 15:29:34');
INSERT INTO `l_visit_log` VALUES (4191, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 15:35:01');
INSERT INTO `l_visit_log` VALUES (4192, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 15:35:53');
INSERT INTO `l_visit_log` VALUES (4193, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 15:36:10');
INSERT INTO `l_visit_log` VALUES (4194, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 15:37:03');
INSERT INTO `l_visit_log` VALUES (4195, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 15:37:45');
INSERT INTO `l_visit_log` VALUES (4196, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 15:38:17');
INSERT INTO `l_visit_log` VALUES (4197, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 15:38:36');
INSERT INTO `l_visit_log` VALUES (4198, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 15:38:49');
INSERT INTO `l_visit_log` VALUES (4199, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 15:40:58');
INSERT INTO `l_visit_log` VALUES (4200, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-11 15:47:02');
INSERT INTO `l_visit_log` VALUES (4201, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-13 08:32:29');
INSERT INTO `l_visit_log` VALUES (4202, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-13 10:50:15');
INSERT INTO `l_visit_log` VALUES (4203, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 08:54:12');
INSERT INTO `l_visit_log` VALUES (4204, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 10:14:19');
INSERT INTO `l_visit_log` VALUES (4205, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 10:14:19');
INSERT INTO `l_visit_log` VALUES (4206, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 10:16:33');
INSERT INTO `l_visit_log` VALUES (4207, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 10:16:35');
INSERT INTO `l_visit_log` VALUES (4208, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 10:34:25');
INSERT INTO `l_visit_log` VALUES (4209, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 10:34:31');
INSERT INTO `l_visit_log` VALUES (4210, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 10:36:37');
INSERT INTO `l_visit_log` VALUES (4211, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 10:36:45');
INSERT INTO `l_visit_log` VALUES (4212, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 11:07:36');
INSERT INTO `l_visit_log` VALUES (4213, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 11:08:05');
INSERT INTO `l_visit_log` VALUES (4214, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 11:10:38');
INSERT INTO `l_visit_log` VALUES (4215, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 11:10:39');
INSERT INTO `l_visit_log` VALUES (4216, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 11:10:44');
INSERT INTO `l_visit_log` VALUES (4217, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 11:11:15');
INSERT INTO `l_visit_log` VALUES (4218, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 11:25:53');
INSERT INTO `l_visit_log` VALUES (4219, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 11:26:06');
INSERT INTO `l_visit_log` VALUES (4220, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 15:54:56');
INSERT INTO `l_visit_log` VALUES (4221, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 15:54:56');
INSERT INTO `l_visit_log` VALUES (4222, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 16:30:28');
INSERT INTO `l_visit_log` VALUES (4223, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 16:30:28');
INSERT INTO `l_visit_log` VALUES (4224, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 16:34:46');
INSERT INTO `l_visit_log` VALUES (4225, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 16:43:31');
INSERT INTO `l_visit_log` VALUES (4226, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 16:50:29');
INSERT INTO `l_visit_log` VALUES (4227, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 16:50:29');
INSERT INTO `l_visit_log` VALUES (4228, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 16:50:30');
INSERT INTO `l_visit_log` VALUES (4229, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 16:52:44');
INSERT INTO `l_visit_log` VALUES (4230, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 16:52:52');
INSERT INTO `l_visit_log` VALUES (4231, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 17:53:14');
INSERT INTO `l_visit_log` VALUES (4232, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 17:53:42');
INSERT INTO `l_visit_log` VALUES (4233, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 17:53:42');
INSERT INTO `l_visit_log` VALUES (4234, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 17:54:39');
INSERT INTO `l_visit_log` VALUES (4235, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 17:54:40');
INSERT INTO `l_visit_log` VALUES (4236, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 17:56:49');
INSERT INTO `l_visit_log` VALUES (4237, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 17:56:52');
INSERT INTO `l_visit_log` VALUES (4238, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 17:56:53');
INSERT INTO `l_visit_log` VALUES (4239, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 17:59:35');
INSERT INTO `l_visit_log` VALUES (4240, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 17:59:38');
INSERT INTO `l_visit_log` VALUES (4241, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 17:59:39');
INSERT INTO `l_visit_log` VALUES (4242, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 17:59:40');
INSERT INTO `l_visit_log` VALUES (4243, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 18:03:22');
INSERT INTO `l_visit_log` VALUES (4244, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 18:03:35');
INSERT INTO `l_visit_log` VALUES (4245, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 18:03:48');
INSERT INTO `l_visit_log` VALUES (4246, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 18:04:00');
INSERT INTO `l_visit_log` VALUES (4247, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 18:25:04');
INSERT INTO `l_visit_log` VALUES (4248, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 18:50:28');
INSERT INTO `l_visit_log` VALUES (4249, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 18:50:28');
INSERT INTO `l_visit_log` VALUES (4250, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 18:53:04');
INSERT INTO `l_visit_log` VALUES (4251, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 18:55:05');
INSERT INTO `l_visit_log` VALUES (4252, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 19:08:55');
INSERT INTO `l_visit_log` VALUES (4253, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 19:08:55');
INSERT INTO `l_visit_log` VALUES (4254, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 19:09:03');
INSERT INTO `l_visit_log` VALUES (4255, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 19:09:04');
INSERT INTO `l_visit_log` VALUES (4256, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 19:14:25');
INSERT INTO `l_visit_log` VALUES (4257, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 19:15:05');
INSERT INTO `l_visit_log` VALUES (4258, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 19:16:50');
INSERT INTO `l_visit_log` VALUES (4259, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 19:20:41');
INSERT INTO `l_visit_log` VALUES (4260, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 19:31:29');
INSERT INTO `l_visit_log` VALUES (4261, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 19:31:29');
INSERT INTO `l_visit_log` VALUES (4262, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 19:31:37');
INSERT INTO `l_visit_log` VALUES (4263, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 19:31:38');
INSERT INTO `l_visit_log` VALUES (4264, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 19:34:35');
INSERT INTO `l_visit_log` VALUES (4265, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 19:34:44');
INSERT INTO `l_visit_log` VALUES (4266, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 19:34:47');
INSERT INTO `l_visit_log` VALUES (4267, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 19:34:52');
INSERT INTO `l_visit_log` VALUES (4268, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 19:34:54');
INSERT INTO `l_visit_log` VALUES (4269, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 19:34:55');
INSERT INTO `l_visit_log` VALUES (4270, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 19:34:58');
INSERT INTO `l_visit_log` VALUES (4271, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 19:50:16');
INSERT INTO `l_visit_log` VALUES (4272, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 19:50:58');
INSERT INTO `l_visit_log` VALUES (4273, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 19:51:02');
INSERT INTO `l_visit_log` VALUES (4274, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 19:51:09');
INSERT INTO `l_visit_log` VALUES (4275, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 19:51:11');
INSERT INTO `l_visit_log` VALUES (4276, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 19:51:12');
INSERT INTO `l_visit_log` VALUES (4277, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 19:51:13');
INSERT INTO `l_visit_log` VALUES (4278, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 20:06:38');
INSERT INTO `l_visit_log` VALUES (4279, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 20:08:01');
INSERT INTO `l_visit_log` VALUES (4280, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 20:17:40');
INSERT INTO `l_visit_log` VALUES (4281, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 20:19:13');
INSERT INTO `l_visit_log` VALUES (4282, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 20:19:14');
INSERT INTO `l_visit_log` VALUES (4283, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-16 20:32:29');
INSERT INTO `l_visit_log` VALUES (4284, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 16:02:46');
INSERT INTO `l_visit_log` VALUES (4285, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 16:09:42');
INSERT INTO `l_visit_log` VALUES (4286, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 16:09:46');
INSERT INTO `l_visit_log` VALUES (4287, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 16:09:47');
INSERT INTO `l_visit_log` VALUES (4288, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 16:10:03');
INSERT INTO `l_visit_log` VALUES (4289, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 16:10:42');
INSERT INTO `l_visit_log` VALUES (4290, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 16:15:29');
INSERT INTO `l_visit_log` VALUES (4291, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 16:15:29');
INSERT INTO `l_visit_log` VALUES (4292, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 16:15:30');
INSERT INTO `l_visit_log` VALUES (4293, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 16:15:30');
INSERT INTO `l_visit_log` VALUES (4294, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 16:15:30');
INSERT INTO `l_visit_log` VALUES (4295, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 16:15:30');
INSERT INTO `l_visit_log` VALUES (4296, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 16:15:30');
INSERT INTO `l_visit_log` VALUES (4297, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 16:35:40');
INSERT INTO `l_visit_log` VALUES (4298, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 16:35:44');
INSERT INTO `l_visit_log` VALUES (4299, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 16:40:39');
INSERT INTO `l_visit_log` VALUES (4300, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 16:41:26');
INSERT INTO `l_visit_log` VALUES (4301, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 16:41:35');
INSERT INTO `l_visit_log` VALUES (4302, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 16:48:06');
INSERT INTO `l_visit_log` VALUES (4303, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 16:48:21');
INSERT INTO `l_visit_log` VALUES (4304, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 16:48:23');
INSERT INTO `l_visit_log` VALUES (4305, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 16:48:24');
INSERT INTO `l_visit_log` VALUES (4306, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 16:56:41');
INSERT INTO `l_visit_log` VALUES (4307, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 16:56:55');
INSERT INTO `l_visit_log` VALUES (4308, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 17:03:41');
INSERT INTO `l_visit_log` VALUES (4309, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 17:06:58');
INSERT INTO `l_visit_log` VALUES (4310, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 17:07:00');
INSERT INTO `l_visit_log` VALUES (4311, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 17:35:41');
INSERT INTO `l_visit_log` VALUES (4312, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 17:37:17');
INSERT INTO `l_visit_log` VALUES (4313, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 17:37:18');
INSERT INTO `l_visit_log` VALUES (4314, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 17:37:19');
INSERT INTO `l_visit_log` VALUES (4315, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 17:46:12');
INSERT INTO `l_visit_log` VALUES (4316, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 17:46:14');
INSERT INTO `l_visit_log` VALUES (4317, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 18:20:26');
INSERT INTO `l_visit_log` VALUES (4318, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 18:20:39');
INSERT INTO `l_visit_log` VALUES (4319, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 18:20:43');
INSERT INTO `l_visit_log` VALUES (4320, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-17 18:20:44');
INSERT INTO `l_visit_log` VALUES (4321, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 08:39:02');
INSERT INTO `l_visit_log` VALUES (4322, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 08:52:40');
INSERT INTO `l_visit_log` VALUES (4323, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 08:52:41');
INSERT INTO `l_visit_log` VALUES (4324, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 08:53:33');
INSERT INTO `l_visit_log` VALUES (4325, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 08:53:33');
INSERT INTO `l_visit_log` VALUES (4326, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 08:54:24');
INSERT INTO `l_visit_log` VALUES (4327, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 08:54:41');
INSERT INTO `l_visit_log` VALUES (4328, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 08:54:43');
INSERT INTO `l_visit_log` VALUES (4329, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 08:54:46');
INSERT INTO `l_visit_log` VALUES (4330, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:14:08');
INSERT INTO `l_visit_log` VALUES (4331, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:14:10');
INSERT INTO `l_visit_log` VALUES (4332, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:14:11');
INSERT INTO `l_visit_log` VALUES (4333, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:14:12');
INSERT INTO `l_visit_log` VALUES (4334, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:17:04');
INSERT INTO `l_visit_log` VALUES (4335, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:17:07');
INSERT INTO `l_visit_log` VALUES (4336, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:17:08');
INSERT INTO `l_visit_log` VALUES (4337, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:17:17');
INSERT INTO `l_visit_log` VALUES (4338, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:17:20');
INSERT INTO `l_visit_log` VALUES (4339, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:19:04');
INSERT INTO `l_visit_log` VALUES (4340, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:22:47');
INSERT INTO `l_visit_log` VALUES (4341, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:26:02');
INSERT INTO `l_visit_log` VALUES (4342, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:26:02');
INSERT INTO `l_visit_log` VALUES (4343, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:26:05');
INSERT INTO `l_visit_log` VALUES (4344, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:26:06');
INSERT INTO `l_visit_log` VALUES (4345, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:26:06');
INSERT INTO `l_visit_log` VALUES (4346, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:26:06');
INSERT INTO `l_visit_log` VALUES (4347, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:26:21');
INSERT INTO `l_visit_log` VALUES (4348, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:26:22');
INSERT INTO `l_visit_log` VALUES (4349, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:26:22');
INSERT INTO `l_visit_log` VALUES (4350, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:26:22');
INSERT INTO `l_visit_log` VALUES (4351, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:27:58');
INSERT INTO `l_visit_log` VALUES (4352, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:27:59');
INSERT INTO `l_visit_log` VALUES (4353, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:27:59');
INSERT INTO `l_visit_log` VALUES (4354, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:27:59');
INSERT INTO `l_visit_log` VALUES (4355, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:29:24');
INSERT INTO `l_visit_log` VALUES (4356, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:29:25');
INSERT INTO `l_visit_log` VALUES (4357, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:29:25');
INSERT INTO `l_visit_log` VALUES (4358, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:29:25');
INSERT INTO `l_visit_log` VALUES (4359, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:29:42');
INSERT INTO `l_visit_log` VALUES (4360, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:29:42');
INSERT INTO `l_visit_log` VALUES (4361, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:29:42');
INSERT INTO `l_visit_log` VALUES (4362, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 11:29:42');
INSERT INTO `l_visit_log` VALUES (4363, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 12:59:39');
INSERT INTO `l_visit_log` VALUES (4364, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:00:06');
INSERT INTO `l_visit_log` VALUES (4365, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:00:08');
INSERT INTO `l_visit_log` VALUES (4366, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:11:55');
INSERT INTO `l_visit_log` VALUES (4367, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:11:56');
INSERT INTO `l_visit_log` VALUES (4368, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:12:08');
INSERT INTO `l_visit_log` VALUES (4369, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:12:08');
INSERT INTO `l_visit_log` VALUES (4370, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:12:35');
INSERT INTO `l_visit_log` VALUES (4371, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:13:04');
INSERT INTO `l_visit_log` VALUES (4372, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:13:06');
INSERT INTO `l_visit_log` VALUES (4373, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:13:24');
INSERT INTO `l_visit_log` VALUES (4374, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:13:26');
INSERT INTO `l_visit_log` VALUES (4375, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:13:27');
INSERT INTO `l_visit_log` VALUES (4376, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:14:17');
INSERT INTO `l_visit_log` VALUES (4377, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:14:26');
INSERT INTO `l_visit_log` VALUES (4378, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:15:04');
INSERT INTO `l_visit_log` VALUES (4379, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:27:45');
INSERT INTO `l_visit_log` VALUES (4380, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:30:29');
INSERT INTO `l_visit_log` VALUES (4381, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:30:29');
INSERT INTO `l_visit_log` VALUES (4382, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:31:32');
INSERT INTO `l_visit_log` VALUES (4383, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:31:32');
INSERT INTO `l_visit_log` VALUES (4384, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:36:45');
INSERT INTO `l_visit_log` VALUES (4385, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:36:45');
INSERT INTO `l_visit_log` VALUES (4386, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:43:34');
INSERT INTO `l_visit_log` VALUES (4387, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:43:34');
INSERT INTO `l_visit_log` VALUES (4388, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:44:35');
INSERT INTO `l_visit_log` VALUES (4389, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:44:35');
INSERT INTO `l_visit_log` VALUES (4390, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:45:38');
INSERT INTO `l_visit_log` VALUES (4391, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:45:38');
INSERT INTO `l_visit_log` VALUES (4392, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:48:13');
INSERT INTO `l_visit_log` VALUES (4393, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:48:13');
INSERT INTO `l_visit_log` VALUES (4394, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:48:28');
INSERT INTO `l_visit_log` VALUES (4395, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:48:28');
INSERT INTO `l_visit_log` VALUES (4396, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:49:16');
INSERT INTO `l_visit_log` VALUES (4397, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:49:16');
INSERT INTO `l_visit_log` VALUES (4398, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:49:16');
INSERT INTO `l_visit_log` VALUES (4399, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:49:16');
INSERT INTO `l_visit_log` VALUES (4400, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:49:36');
INSERT INTO `l_visit_log` VALUES (4401, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:49:36');
INSERT INTO `l_visit_log` VALUES (4402, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:50:06');
INSERT INTO `l_visit_log` VALUES (4403, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:50:06');
INSERT INTO `l_visit_log` VALUES (4404, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:54:50');
INSERT INTO `l_visit_log` VALUES (4405, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:54:50');
INSERT INTO `l_visit_log` VALUES (4406, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:55:31');
INSERT INTO `l_visit_log` VALUES (4407, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:55:31');
INSERT INTO `l_visit_log` VALUES (4408, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:56:34');
INSERT INTO `l_visit_log` VALUES (4409, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:56:34');
INSERT INTO `l_visit_log` VALUES (4410, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:59:10');
INSERT INTO `l_visit_log` VALUES (4411, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 13:59:10');
INSERT INTO `l_visit_log` VALUES (4412, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:07:18');
INSERT INTO `l_visit_log` VALUES (4413, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:07:18');
INSERT INTO `l_visit_log` VALUES (4414, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:12:26');
INSERT INTO `l_visit_log` VALUES (4415, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:31:17');
INSERT INTO `l_visit_log` VALUES (4416, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:31:17');
INSERT INTO `l_visit_log` VALUES (4417, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:31:17');
INSERT INTO `l_visit_log` VALUES (4418, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:31:17');
INSERT INTO `l_visit_log` VALUES (4419, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:31:17');
INSERT INTO `l_visit_log` VALUES (4420, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:31:17');
INSERT INTO `l_visit_log` VALUES (4421, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:31:17');
INSERT INTO `l_visit_log` VALUES (4422, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:31:17');
INSERT INTO `l_visit_log` VALUES (4423, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:32:46');
INSERT INTO `l_visit_log` VALUES (4424, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:32:46');
INSERT INTO `l_visit_log` VALUES (4425, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:36:02');
INSERT INTO `l_visit_log` VALUES (4426, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:36:02');
INSERT INTO `l_visit_log` VALUES (4427, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:40:52');
INSERT INTO `l_visit_log` VALUES (4428, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:40:52');
INSERT INTO `l_visit_log` VALUES (4429, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:40:59');
INSERT INTO `l_visit_log` VALUES (4430, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:40:59');
INSERT INTO `l_visit_log` VALUES (4431, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:46:11');
INSERT INTO `l_visit_log` VALUES (4432, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:46:11');
INSERT INTO `l_visit_log` VALUES (4433, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:46:12');
INSERT INTO `l_visit_log` VALUES (4434, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:46:23');
INSERT INTO `l_visit_log` VALUES (4435, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:48:08');
INSERT INTO `l_visit_log` VALUES (4436, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:48:30');
INSERT INTO `l_visit_log` VALUES (4437, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:48:30');
INSERT INTO `l_visit_log` VALUES (4438, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:48:38');
INSERT INTO `l_visit_log` VALUES (4439, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:48:49');
INSERT INTO `l_visit_log` VALUES (4440, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:49:11');
INSERT INTO `l_visit_log` VALUES (4441, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:49:50');
INSERT INTO `l_visit_log` VALUES (4442, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:49:50');
INSERT INTO `l_visit_log` VALUES (4443, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:50:36');
INSERT INTO `l_visit_log` VALUES (4444, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:51:56');
INSERT INTO `l_visit_log` VALUES (4445, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:51:57');
INSERT INTO `l_visit_log` VALUES (4446, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:53:48');
INSERT INTO `l_visit_log` VALUES (4447, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:53:48');
INSERT INTO `l_visit_log` VALUES (4448, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:53:48');
INSERT INTO `l_visit_log` VALUES (4449, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:56:23');
INSERT INTO `l_visit_log` VALUES (4450, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:56:23');
INSERT INTO `l_visit_log` VALUES (4451, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:57:26');
INSERT INTO `l_visit_log` VALUES (4452, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:57:26');
INSERT INTO `l_visit_log` VALUES (4453, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:58:53');
INSERT INTO `l_visit_log` VALUES (4454, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:58:53');
INSERT INTO `l_visit_log` VALUES (4455, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:58:55');
INSERT INTO `l_visit_log` VALUES (4456, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:59:04');
INSERT INTO `l_visit_log` VALUES (4457, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:59:46');
INSERT INTO `l_visit_log` VALUES (4458, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 14:59:46');
INSERT INTO `l_visit_log` VALUES (4459, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:00:47');
INSERT INTO `l_visit_log` VALUES (4460, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:00:55');
INSERT INTO `l_visit_log` VALUES (4461, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:02:22');
INSERT INTO `l_visit_log` VALUES (4462, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:02:55');
INSERT INTO `l_visit_log` VALUES (4463, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:05:46');
INSERT INTO `l_visit_log` VALUES (4464, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:06:37');
INSERT INTO `l_visit_log` VALUES (4465, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:07:17');
INSERT INTO `l_visit_log` VALUES (4466, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:08:27');
INSERT INTO `l_visit_log` VALUES (4467, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:08:27');
INSERT INTO `l_visit_log` VALUES (4468, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:09:46');
INSERT INTO `l_visit_log` VALUES (4469, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:09:46');
INSERT INTO `l_visit_log` VALUES (4470, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:11:10');
INSERT INTO `l_visit_log` VALUES (4471, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:11:10');
INSERT INTO `l_visit_log` VALUES (4472, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:22:27');
INSERT INTO `l_visit_log` VALUES (4473, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:22:27');
INSERT INTO `l_visit_log` VALUES (4474, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:22:30');
INSERT INTO `l_visit_log` VALUES (4475, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:22:30');
INSERT INTO `l_visit_log` VALUES (4476, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:24:46');
INSERT INTO `l_visit_log` VALUES (4477, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:31:32');
INSERT INTO `l_visit_log` VALUES (4478, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:35:57');
INSERT INTO `l_visit_log` VALUES (4479, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:37:07');
INSERT INTO `l_visit_log` VALUES (4480, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:37:54');
INSERT INTO `l_visit_log` VALUES (4481, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:41:18');
INSERT INTO `l_visit_log` VALUES (4482, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:42:36');
INSERT INTO `l_visit_log` VALUES (4483, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:43:33');
INSERT INTO `l_visit_log` VALUES (4484, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:43:33');
INSERT INTO `l_visit_log` VALUES (4485, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:44:14');
INSERT INTO `l_visit_log` VALUES (4486, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:44:14');
INSERT INTO `l_visit_log` VALUES (4487, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:54:46');
INSERT INTO `l_visit_log` VALUES (4488, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:54:47');
INSERT INTO `l_visit_log` VALUES (4489, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:54:48');
INSERT INTO `l_visit_log` VALUES (4490, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:54:52');
INSERT INTO `l_visit_log` VALUES (4491, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:56:41');
INSERT INTO `l_visit_log` VALUES (4492, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:56:41');
INSERT INTO `l_visit_log` VALUES (4493, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:56:42');
INSERT INTO `l_visit_log` VALUES (4494, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:56:42');
INSERT INTO `l_visit_log` VALUES (4495, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:57:27');
INSERT INTO `l_visit_log` VALUES (4496, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:57:27');
INSERT INTO `l_visit_log` VALUES (4497, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:57:50');
INSERT INTO `l_visit_log` VALUES (4498, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:57:50');
INSERT INTO `l_visit_log` VALUES (4499, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:58:21');
INSERT INTO `l_visit_log` VALUES (4500, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 15:58:43');
INSERT INTO `l_visit_log` VALUES (4501, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:00:00');
INSERT INTO `l_visit_log` VALUES (4502, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:00:00');
INSERT INTO `l_visit_log` VALUES (4503, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:02:08');
INSERT INTO `l_visit_log` VALUES (4504, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:02:08');
INSERT INTO `l_visit_log` VALUES (4505, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:02:37');
INSERT INTO `l_visit_log` VALUES (4506, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:02:49');
INSERT INTO `l_visit_log` VALUES (4507, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:03:58');
INSERT INTO `l_visit_log` VALUES (4508, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:05:01');
INSERT INTO `l_visit_log` VALUES (4509, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:05:36');
INSERT INTO `l_visit_log` VALUES (4510, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:05:37');
INSERT INTO `l_visit_log` VALUES (4511, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:05:52');
INSERT INTO `l_visit_log` VALUES (4512, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:05:52');
INSERT INTO `l_visit_log` VALUES (4513, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:05:53');
INSERT INTO `l_visit_log` VALUES (4514, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:05:55');
INSERT INTO `l_visit_log` VALUES (4515, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:08:27');
INSERT INTO `l_visit_log` VALUES (4516, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:10:01');
INSERT INTO `l_visit_log` VALUES (4517, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:10:03');
INSERT INTO `l_visit_log` VALUES (4518, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:10:06');
INSERT INTO `l_visit_log` VALUES (4519, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:10:07');
INSERT INTO `l_visit_log` VALUES (4520, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:10:23');
INSERT INTO `l_visit_log` VALUES (4521, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:10:23');
INSERT INTO `l_visit_log` VALUES (4522, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:10:29');
INSERT INTO `l_visit_log` VALUES (4523, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:10:31');
INSERT INTO `l_visit_log` VALUES (4524, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:12:12');
INSERT INTO `l_visit_log` VALUES (4525, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:12:17');
INSERT INTO `l_visit_log` VALUES (4526, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:12:19');
INSERT INTO `l_visit_log` VALUES (4527, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:12:22');
INSERT INTO `l_visit_log` VALUES (4528, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:13:33');
INSERT INTO `l_visit_log` VALUES (4529, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:14:44');
INSERT INTO `l_visit_log` VALUES (4530, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:17:44');
INSERT INTO `l_visit_log` VALUES (4531, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:22:34');
INSERT INTO `l_visit_log` VALUES (4532, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:22:39');
INSERT INTO `l_visit_log` VALUES (4533, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:22:52');
INSERT INTO `l_visit_log` VALUES (4534, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:26:03');
INSERT INTO `l_visit_log` VALUES (4535, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:26:03');
INSERT INTO `l_visit_log` VALUES (4536, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:26:05');
INSERT INTO `l_visit_log` VALUES (4537, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:26:05');
INSERT INTO `l_visit_log` VALUES (4538, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:26:29');
INSERT INTO `l_visit_log` VALUES (4539, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:26:29');
INSERT INTO `l_visit_log` VALUES (4540, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:26:30');
INSERT INTO `l_visit_log` VALUES (4541, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:26:31');
INSERT INTO `l_visit_log` VALUES (4542, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:26:36');
INSERT INTO `l_visit_log` VALUES (4543, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:28:43');
INSERT INTO `l_visit_log` VALUES (4544, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:29:10');
INSERT INTO `l_visit_log` VALUES (4545, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:29:18');
INSERT INTO `l_visit_log` VALUES (4546, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:29:18');
INSERT INTO `l_visit_log` VALUES (4547, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:29:19');
INSERT INTO `l_visit_log` VALUES (4548, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:29:20');
INSERT INTO `l_visit_log` VALUES (4549, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:30:51');
INSERT INTO `l_visit_log` VALUES (4550, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:30:52');
INSERT INTO `l_visit_log` VALUES (4551, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:30:54');
INSERT INTO `l_visit_log` VALUES (4552, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:31:06');
INSERT INTO `l_visit_log` VALUES (4553, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:32:18');
INSERT INTO `l_visit_log` VALUES (4554, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-18 16:32:18');
INSERT INTO `l_visit_log` VALUES (4555, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 08:49:19');
INSERT INTO `l_visit_log` VALUES (4556, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 08:49:19');
INSERT INTO `l_visit_log` VALUES (4557, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:04:24');
INSERT INTO `l_visit_log` VALUES (4558, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:04:25');
INSERT INTO `l_visit_log` VALUES (4559, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:04:26');
INSERT INTO `l_visit_log` VALUES (4560, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:04:28');
INSERT INTO `l_visit_log` VALUES (4561, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:05:51');
INSERT INTO `l_visit_log` VALUES (4562, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:05:51');
INSERT INTO `l_visit_log` VALUES (4563, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:06:16');
INSERT INTO `l_visit_log` VALUES (4564, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:06:16');
INSERT INTO `l_visit_log` VALUES (4565, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:07:19');
INSERT INTO `l_visit_log` VALUES (4566, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:07:19');
INSERT INTO `l_visit_log` VALUES (4567, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:07:21');
INSERT INTO `l_visit_log` VALUES (4568, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:07:37');
INSERT INTO `l_visit_log` VALUES (4569, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:08:36');
INSERT INTO `l_visit_log` VALUES (4570, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:08:37');
INSERT INTO `l_visit_log` VALUES (4571, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:08:39');
INSERT INTO `l_visit_log` VALUES (4572, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:08:46');
INSERT INTO `l_visit_log` VALUES (4573, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:09:26');
INSERT INTO `l_visit_log` VALUES (4574, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:09:26');
INSERT INTO `l_visit_log` VALUES (4575, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:09:28');
INSERT INTO `l_visit_log` VALUES (4576, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:15:20');
INSERT INTO `l_visit_log` VALUES (4577, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:15:20');
INSERT INTO `l_visit_log` VALUES (4578, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:15:22');
INSERT INTO `l_visit_log` VALUES (4579, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:16:42');
INSERT INTO `l_visit_log` VALUES (4580, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:16:42');
INSERT INTO `l_visit_log` VALUES (4581, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:16:45');
INSERT INTO `l_visit_log` VALUES (4582, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:16:58');
INSERT INTO `l_visit_log` VALUES (4583, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:22:21');
INSERT INTO `l_visit_log` VALUES (4584, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:25:19');
INSERT INTO `l_visit_log` VALUES (4585, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:26:50');
INSERT INTO `l_visit_log` VALUES (4586, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:26:53');
INSERT INTO `l_visit_log` VALUES (4587, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:26:55');
INSERT INTO `l_visit_log` VALUES (4588, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:28:33');
INSERT INTO `l_visit_log` VALUES (4589, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:28:35');
INSERT INTO `l_visit_log` VALUES (4590, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:45:49');
INSERT INTO `l_visit_log` VALUES (4591, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:46:44');
INSERT INTO `l_visit_log` VALUES (4592, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:46:48');
INSERT INTO `l_visit_log` VALUES (4593, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:50:25');
INSERT INTO `l_visit_log` VALUES (4594, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:50:43');
INSERT INTO `l_visit_log` VALUES (4595, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:50:49');
INSERT INTO `l_visit_log` VALUES (4596, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:53:09');
INSERT INTO `l_visit_log` VALUES (4597, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:53:20');
INSERT INTO `l_visit_log` VALUES (4598, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 09:53:28');
INSERT INTO `l_visit_log` VALUES (4599, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 10:01:05');
INSERT INTO `l_visit_log` VALUES (4600, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 10:11:22');
INSERT INTO `l_visit_log` VALUES (4601, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 10:11:52');
INSERT INTO `l_visit_log` VALUES (4602, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 10:11:53');
INSERT INTO `l_visit_log` VALUES (4603, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 10:25:43');
INSERT INTO `l_visit_log` VALUES (4604, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 10:25:45');
INSERT INTO `l_visit_log` VALUES (4605, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 10:25:46');
INSERT INTO `l_visit_log` VALUES (4606, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 10:40:22');
INSERT INTO `l_visit_log` VALUES (4607, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 10:40:23');
INSERT INTO `l_visit_log` VALUES (4608, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 10:40:24');
INSERT INTO `l_visit_log` VALUES (4609, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 11:00:39');
INSERT INTO `l_visit_log` VALUES (4610, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 11:00:40');
INSERT INTO `l_visit_log` VALUES (4611, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 11:02:29');
INSERT INTO `l_visit_log` VALUES (4612, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 11:06:30');
INSERT INTO `l_visit_log` VALUES (4613, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 11:06:31');
INSERT INTO `l_visit_log` VALUES (4614, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 13:38:32');
INSERT INTO `l_visit_log` VALUES (4615, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 13:38:32');
INSERT INTO `l_visit_log` VALUES (4616, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 117', '2023-10-19 15:53:05');
INSERT INTO `l_visit_log` VALUES (4617, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 16:22:08');
INSERT INTO `l_visit_log` VALUES (4618, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 16:22:29');
INSERT INTO `l_visit_log` VALUES (4619, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 16:22:29');
INSERT INTO `l_visit_log` VALUES (4620, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 19:59:00');
INSERT INTO `l_visit_log` VALUES (4621, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 19:59:00');
INSERT INTO `l_visit_log` VALUES (4622, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 19:59:09');
INSERT INTO `l_visit_log` VALUES (4623, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:05:11');
INSERT INTO `l_visit_log` VALUES (4624, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:05:11');
INSERT INTO `l_visit_log` VALUES (4625, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:05:24');
INSERT INTO `l_visit_log` VALUES (4626, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:05:24');
INSERT INTO `l_visit_log` VALUES (4627, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:05:26');
INSERT INTO `l_visit_log` VALUES (4628, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:05:26');
INSERT INTO `l_visit_log` VALUES (4629, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:05:27');
INSERT INTO `l_visit_log` VALUES (4630, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:05:27');
INSERT INTO `l_visit_log` VALUES (4631, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:11:36');
INSERT INTO `l_visit_log` VALUES (4632, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:09');
INSERT INTO `l_visit_log` VALUES (4633, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:28');
INSERT INTO `l_visit_log` VALUES (4634, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:28');
INSERT INTO `l_visit_log` VALUES (4635, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:30');
INSERT INTO `l_visit_log` VALUES (4636, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:30');
INSERT INTO `l_visit_log` VALUES (4637, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:30');
INSERT INTO `l_visit_log` VALUES (4638, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:30');
INSERT INTO `l_visit_log` VALUES (4639, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:30');
INSERT INTO `l_visit_log` VALUES (4640, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:30');
INSERT INTO `l_visit_log` VALUES (4641, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:31');
INSERT INTO `l_visit_log` VALUES (4642, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:31');
INSERT INTO `l_visit_log` VALUES (4643, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:31');
INSERT INTO `l_visit_log` VALUES (4644, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:31');
INSERT INTO `l_visit_log` VALUES (4645, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:32');
INSERT INTO `l_visit_log` VALUES (4646, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:32');
INSERT INTO `l_visit_log` VALUES (4647, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:32');
INSERT INTO `l_visit_log` VALUES (4648, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:41');
INSERT INTO `l_visit_log` VALUES (4649, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:42');
INSERT INTO `l_visit_log` VALUES (4650, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:42');
INSERT INTO `l_visit_log` VALUES (4651, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:44');
INSERT INTO `l_visit_log` VALUES (4652, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:48');
INSERT INTO `l_visit_log` VALUES (4653, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:50');
INSERT INTO `l_visit_log` VALUES (4654, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:51');
INSERT INTO `l_visit_log` VALUES (4655, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:51');
INSERT INTO `l_visit_log` VALUES (4656, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:51');
INSERT INTO `l_visit_log` VALUES (4657, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:51');
INSERT INTO `l_visit_log` VALUES (4658, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:52');
INSERT INTO `l_visit_log` VALUES (4659, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:52');
INSERT INTO `l_visit_log` VALUES (4660, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:52');
INSERT INTO `l_visit_log` VALUES (4661, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:52');
INSERT INTO `l_visit_log` VALUES (4662, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:53');
INSERT INTO `l_visit_log` VALUES (4663, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:12:53');
INSERT INTO `l_visit_log` VALUES (4664, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:13:19');
INSERT INTO `l_visit_log` VALUES (4665, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:13:19');
INSERT INTO `l_visit_log` VALUES (4666, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:13:20');
INSERT INTO `l_visit_log` VALUES (4667, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:19:08');
INSERT INTO `l_visit_log` VALUES (4668, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:21:39');
INSERT INTO `l_visit_log` VALUES (4669, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:29:19');
INSERT INTO `l_visit_log` VALUES (4670, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:29:21');
INSERT INTO `l_visit_log` VALUES (4671, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:29:24');
INSERT INTO `l_visit_log` VALUES (4672, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:39:50');
INSERT INTO `l_visit_log` VALUES (4673, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:42:24');
INSERT INTO `l_visit_log` VALUES (4674, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:46:47');
INSERT INTO `l_visit_log` VALUES (4675, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:48:24');
INSERT INTO `l_visit_log` VALUES (4676, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:48:24');
INSERT INTO `l_visit_log` VALUES (4677, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:49:31');
INSERT INTO `l_visit_log` VALUES (4678, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:50:13');
INSERT INTO `l_visit_log` VALUES (4679, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:50:13');
INSERT INTO `l_visit_log` VALUES (4680, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:53:38');
INSERT INTO `l_visit_log` VALUES (4681, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:57:15');
INSERT INTO `l_visit_log` VALUES (4682, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:57:15');
INSERT INTO `l_visit_log` VALUES (4683, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 20:57:17');
INSERT INTO `l_visit_log` VALUES (4684, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 21:51:10');
INSERT INTO `l_visit_log` VALUES (4685, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 21:51:10');
INSERT INTO `l_visit_log` VALUES (4686, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-19 21:51:12');
INSERT INTO `l_visit_log` VALUES (4687, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 08:26:39');
INSERT INTO `l_visit_log` VALUES (4688, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 08:30:20');
INSERT INTO `l_visit_log` VALUES (4689, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 08:34:51');
INSERT INTO `l_visit_log` VALUES (4690, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 08:34:53');
INSERT INTO `l_visit_log` VALUES (4691, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 08:34:54');
INSERT INTO `l_visit_log` VALUES (4692, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 08:37:33');
INSERT INTO `l_visit_log` VALUES (4693, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 08:45:17');
INSERT INTO `l_visit_log` VALUES (4694, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 10:08:27');
INSERT INTO `l_visit_log` VALUES (4695, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 10:08:29');
INSERT INTO `l_visit_log` VALUES (4696, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 10:08:32');
INSERT INTO `l_visit_log` VALUES (4697, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 10:08:34');
INSERT INTO `l_visit_log` VALUES (4698, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 10:08:56');
INSERT INTO `l_visit_log` VALUES (4699, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 10:09:35');
INSERT INTO `l_visit_log` VALUES (4700, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 10:09:37');
INSERT INTO `l_visit_log` VALUES (4701, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 10:09:41');
INSERT INTO `l_visit_log` VALUES (4702, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 10:09:51');
INSERT INTO `l_visit_log` VALUES (4703, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 10:09:55');
INSERT INTO `l_visit_log` VALUES (4704, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 10:10:07');
INSERT INTO `l_visit_log` VALUES (4705, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 10:10:11');
INSERT INTO `l_visit_log` VALUES (4706, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 10:10:38');
INSERT INTO `l_visit_log` VALUES (4707, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 10:10:41');
INSERT INTO `l_visit_log` VALUES (4708, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 10:12:19');
INSERT INTO `l_visit_log` VALUES (4709, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 10:12:29');
INSERT INTO `l_visit_log` VALUES (4710, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 10:22:49');
INSERT INTO `l_visit_log` VALUES (4711, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 10:23:05');
INSERT INTO `l_visit_log` VALUES (4712, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 10:23:08');
INSERT INTO `l_visit_log` VALUES (4713, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-20 14:22:00');
INSERT INTO `l_visit_log` VALUES (4714, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 10:51:00');
INSERT INTO `l_visit_log` VALUES (4715, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 10:52:28');
INSERT INTO `l_visit_log` VALUES (4716, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 10:52:28');
INSERT INTO `l_visit_log` VALUES (4717, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 10:52:30');
INSERT INTO `l_visit_log` VALUES (4718, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 10:53:58');
INSERT INTO `l_visit_log` VALUES (4719, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 10:58:35');
INSERT INTO `l_visit_log` VALUES (4720, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 10:58:47');
INSERT INTO `l_visit_log` VALUES (4721, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 10:58:50');
INSERT INTO `l_visit_log` VALUES (4722, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 11:04:57');
INSERT INTO `l_visit_log` VALUES (4723, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 11:07:26');
INSERT INTO `l_visit_log` VALUES (4724, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 11:07:47');
INSERT INTO `l_visit_log` VALUES (4725, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 11:27:11');
INSERT INTO `l_visit_log` VALUES (4726, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 11:27:16');
INSERT INTO `l_visit_log` VALUES (4727, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 11:27:17');
INSERT INTO `l_visit_log` VALUES (4728, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 11:27:19');
INSERT INTO `l_visit_log` VALUES (4729, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 11:27:20');
INSERT INTO `l_visit_log` VALUES (4730, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 11:27:51');
INSERT INTO `l_visit_log` VALUES (4731, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 11:27:53');
INSERT INTO `l_visit_log` VALUES (4732, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 11:27:54');
INSERT INTO `l_visit_log` VALUES (4733, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 11:29:14');
INSERT INTO `l_visit_log` VALUES (4734, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 11:29:15');
INSERT INTO `l_visit_log` VALUES (4735, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 11:29:18');
INSERT INTO `l_visit_log` VALUES (4736, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 11:29:20');
INSERT INTO `l_visit_log` VALUES (4737, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 11:29:22');
INSERT INTO `l_visit_log` VALUES (4738, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 11:29:23');
INSERT INTO `l_visit_log` VALUES (4739, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 11:31:19');
INSERT INTO `l_visit_log` VALUES (4740, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 11:31:27');
INSERT INTO `l_visit_log` VALUES (4741, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 11:31:29');
INSERT INTO `l_visit_log` VALUES (4742, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 11:32:06');
INSERT INTO `l_visit_log` VALUES (4743, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 11:32:08');
INSERT INTO `l_visit_log` VALUES (4744, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 11:32:10');
INSERT INTO `l_visit_log` VALUES (4745, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 11:32:13');
INSERT INTO `l_visit_log` VALUES (4746, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 12:06:10');
INSERT INTO `l_visit_log` VALUES (4747, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 12:06:10');
INSERT INTO `l_visit_log` VALUES (4748, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 12:14:16');
INSERT INTO `l_visit_log` VALUES (4749, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 12:18:13');
INSERT INTO `l_visit_log` VALUES (4750, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 12:22:24');
INSERT INTO `l_visit_log` VALUES (4751, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 12:22:24');
INSERT INTO `l_visit_log` VALUES (4752, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 12:40:20');
INSERT INTO `l_visit_log` VALUES (4753, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 19:55:48');
INSERT INTO `l_visit_log` VALUES (4754, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 22:46:26');
INSERT INTO `l_visit_log` VALUES (4755, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 22:46:30');
INSERT INTO `l_visit_log` VALUES (4756, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 22:47:06');
INSERT INTO `l_visit_log` VALUES (4757, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 22:47:06');
INSERT INTO `l_visit_log` VALUES (4758, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 22:47:27');
INSERT INTO `l_visit_log` VALUES (4759, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 22:53:12');
INSERT INTO `l_visit_log` VALUES (4760, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 22:56:47');
INSERT INTO `l_visit_log` VALUES (4761, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 22:56:48');
INSERT INTO `l_visit_log` VALUES (4762, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 22:56:52');
INSERT INTO `l_visit_log` VALUES (4763, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 22:57:10');
INSERT INTO `l_visit_log` VALUES (4764, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 22:57:11');
INSERT INTO `l_visit_log` VALUES (4765, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 22:57:14');
INSERT INTO `l_visit_log` VALUES (4766, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 23:05:21');
INSERT INTO `l_visit_log` VALUES (4767, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 23:05:22');
INSERT INTO `l_visit_log` VALUES (4768, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-21 23:05:23');
INSERT INTO `l_visit_log` VALUES (4769, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-24 08:18:20');
INSERT INTO `l_visit_log` VALUES (4770, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-24 08:18:31');
INSERT INTO `l_visit_log` VALUES (4771, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-24 08:18:31');
INSERT INTO `l_visit_log` VALUES (4772, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-24 08:56:51');
INSERT INTO `l_visit_log` VALUES (4773, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-24 08:56:51');
INSERT INTO `l_visit_log` VALUES (4774, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-24 09:04:00');
INSERT INTO `l_visit_log` VALUES (4775, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-24 09:04:19');
INSERT INTO `l_visit_log` VALUES (4776, '关于', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 08:42:15');
INSERT INTO `l_visit_log` VALUES (4777, '总览', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 08:43:01');
INSERT INTO `l_visit_log` VALUES (4778, '总览', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 08:48:21');
INSERT INTO `l_visit_log` VALUES (4779, '总览', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 10:21:38');
INSERT INTO `l_visit_log` VALUES (4780, '总览', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 10:21:39');
INSERT INTO `l_visit_log` VALUES (4781, '总览', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 10:21:42');
INSERT INTO `l_visit_log` VALUES (4782, '总览', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 10:26:04');
INSERT INTO `l_visit_log` VALUES (4783, '总览', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 10:27:16');
INSERT INTO `l_visit_log` VALUES (4784, '总览', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 11:11:25');
INSERT INTO `l_visit_log` VALUES (4785, '总览', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 11:21:49');
INSERT INTO `l_visit_log` VALUES (4786, '总览', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 11:21:49');
INSERT INTO `l_visit_log` VALUES (4787, '总览', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 13:50:27');
INSERT INTO `l_visit_log` VALUES (4788, '总览', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 13:50:27');
INSERT INTO `l_visit_log` VALUES (4789, '总览', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 14:30:10');
INSERT INTO `l_visit_log` VALUES (4790, '总览', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 14:30:11');
INSERT INTO `l_visit_log` VALUES (4791, '总览', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 14:34:40');
INSERT INTO `l_visit_log` VALUES (4792, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 14:34:52');
INSERT INTO `l_visit_log` VALUES (4793, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 14:34:54');
INSERT INTO `l_visit_log` VALUES (4794, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 14:34:55');
INSERT INTO `l_visit_log` VALUES (4795, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 14:35:00');
INSERT INTO `l_visit_log` VALUES (4796, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 16:44:17');
INSERT INTO `l_visit_log` VALUES (4797, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 16:44:21');
INSERT INTO `l_visit_log` VALUES (4798, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 16:44:23');
INSERT INTO `l_visit_log` VALUES (4799, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 16:44:52');
INSERT INTO `l_visit_log` VALUES (4800, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 16:45:02');
INSERT INTO `l_visit_log` VALUES (4801, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 16:47:39');
INSERT INTO `l_visit_log` VALUES (4802, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 16:47:41');
INSERT INTO `l_visit_log` VALUES (4803, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 16:47:42');
INSERT INTO `l_visit_log` VALUES (4804, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 16:50:04');
INSERT INTO `l_visit_log` VALUES (4805, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 16:50:08');
INSERT INTO `l_visit_log` VALUES (4806, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 16:50:25');
INSERT INTO `l_visit_log` VALUES (4807, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 16:50:37');
INSERT INTO `l_visit_log` VALUES (4808, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 16:50:44');
INSERT INTO `l_visit_log` VALUES (4809, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 16:50:47');
INSERT INTO `l_visit_log` VALUES (4810, '总览', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 17:20:58');
INSERT INTO `l_visit_log` VALUES (4811, '总览', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 17:20:58');
INSERT INTO `l_visit_log` VALUES (4812, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 17:31:35');
INSERT INTO `l_visit_log` VALUES (4813, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 17:31:43');
INSERT INTO `l_visit_log` VALUES (4814, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 17:31:44');
INSERT INTO `l_visit_log` VALUES (4815, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 17:34:00');
INSERT INTO `l_visit_log` VALUES (4816, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 17:34:03');
INSERT INTO `l_visit_log` VALUES (4817, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 17:43:28');
INSERT INTO `l_visit_log` VALUES (4818, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 17:43:32');
INSERT INTO `l_visit_log` VALUES (4819, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 18:04:53');
INSERT INTO `l_visit_log` VALUES (4820, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 18:04:58');
INSERT INTO `l_visit_log` VALUES (4821, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 18:05:35');
INSERT INTO `l_visit_log` VALUES (4822, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 18:09:56');
INSERT INTO `l_visit_log` VALUES (4823, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 18:10:49');
INSERT INTO `l_visit_log` VALUES (4824, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 18:10:51');
INSERT INTO `l_visit_log` VALUES (4825, '总览', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 18:28:09');
INSERT INTO `l_visit_log` VALUES (4826, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:10:37');
INSERT INTO `l_visit_log` VALUES (4827, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:10:39');
INSERT INTO `l_visit_log` VALUES (4828, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:10:51');
INSERT INTO `l_visit_log` VALUES (4829, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:11:07');
INSERT INTO `l_visit_log` VALUES (4830, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:12:14');
INSERT INTO `l_visit_log` VALUES (4831, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:12:16');
INSERT INTO `l_visit_log` VALUES (4832, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:16:20');
INSERT INTO `l_visit_log` VALUES (4833, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:16:49');
INSERT INTO `l_visit_log` VALUES (4834, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:16:52');
INSERT INTO `l_visit_log` VALUES (4835, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:21:25');
INSERT INTO `l_visit_log` VALUES (4836, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:21:27');
INSERT INTO `l_visit_log` VALUES (4837, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:45:45');
INSERT INTO `l_visit_log` VALUES (4838, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:45:54');
INSERT INTO `l_visit_log` VALUES (4839, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:45:58');
INSERT INTO `l_visit_log` VALUES (4840, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:46:05');
INSERT INTO `l_visit_log` VALUES (4841, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:46:11');
INSERT INTO `l_visit_log` VALUES (4842, '记录中心', '122.238.191.106', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:46:21');
INSERT INTO `l_visit_log` VALUES (4843, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:47:19');
INSERT INTO `l_visit_log` VALUES (4844, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:47:24');
INSERT INTO `l_visit_log` VALUES (4845, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:47:28');
INSERT INTO `l_visit_log` VALUES (4846, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:47:34');
INSERT INTO `l_visit_log` VALUES (4847, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:47:35');
INSERT INTO `l_visit_log` VALUES (4848, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:47:35');
INSERT INTO `l_visit_log` VALUES (4849, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:47:35');
INSERT INTO `l_visit_log` VALUES (4850, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:47:35');
INSERT INTO `l_visit_log` VALUES (4851, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:47:36');
INSERT INTO `l_visit_log` VALUES (4852, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:47:36');
INSERT INTO `l_visit_log` VALUES (4853, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:47:36');
INSERT INTO `l_visit_log` VALUES (4854, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:47:36');
INSERT INTO `l_visit_log` VALUES (4855, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:47:36');
INSERT INTO `l_visit_log` VALUES (4856, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:47:36');
INSERT INTO `l_visit_log` VALUES (4857, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:47:37');
INSERT INTO `l_visit_log` VALUES (4858, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:47:37');
INSERT INTO `l_visit_log` VALUES (4859, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:47:37');
INSERT INTO `l_visit_log` VALUES (4860, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:47:37');
INSERT INTO `l_visit_log` VALUES (4861, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:47:38');
INSERT INTO `l_visit_log` VALUES (4862, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:47:38');
INSERT INTO `l_visit_log` VALUES (4863, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:47:39');
INSERT INTO `l_visit_log` VALUES (4864, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:47:39');
INSERT INTO `l_visit_log` VALUES (4865, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:47:39');
INSERT INTO `l_visit_log` VALUES (4866, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:47:56');
INSERT INTO `l_visit_log` VALUES (4867, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:48:05');
INSERT INTO `l_visit_log` VALUES (4868, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:53:42');
INSERT INTO `l_visit_log` VALUES (4869, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-25 19:53:43');
INSERT INTO `l_visit_log` VALUES (4870, '总览', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-26 09:52:18');
INSERT INTO `l_visit_log` VALUES (4871, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-26 09:57:39');
INSERT INTO `l_visit_log` VALUES (4872, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-26 09:57:56');
INSERT INTO `l_visit_log` VALUES (4873, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-26 09:58:18');
INSERT INTO `l_visit_log` VALUES (4874, '总览', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-26 10:29:21');
INSERT INTO `l_visit_log` VALUES (4875, '总览', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-26 10:32:55');
INSERT INTO `l_visit_log` VALUES (4876, '总览', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-26 10:32:55');
INSERT INTO `l_visit_log` VALUES (4877, '总览', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-26 10:34:02');
INSERT INTO `l_visit_log` VALUES (4878, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-26 10:43:38');
INSERT INTO `l_visit_log` VALUES (4879, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-26 10:43:39');
INSERT INTO `l_visit_log` VALUES (4880, '关于', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-26 11:29:00');
INSERT INTO `l_visit_log` VALUES (4881, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-26 11:29:18');
INSERT INTO `l_visit_log` VALUES (4882, '关于', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-26 13:15:39');
INSERT INTO `l_visit_log` VALUES (4883, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-26 13:15:39');
INSERT INTO `l_visit_log` VALUES (4884, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-26 13:16:58');
INSERT INTO `l_visit_log` VALUES (4885, '关于', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-26 13:20:43');
INSERT INTO `l_visit_log` VALUES (4886, '关于', '223.104.164.36', '中国|浙江省|嘉兴市|移动', 'Windows NT ??', 'Chrome 118', '2023-10-26 13:24:22');
INSERT INTO `l_visit_log` VALUES (4887, '记录中心', '223.104.164.36', '中国|浙江省|嘉兴市|移动', 'Windows NT ??', 'Chrome 118', '2023-10-26 13:28:07');
INSERT INTO `l_visit_log` VALUES (4888, '总览', '223.104.164.36', '中国|浙江省|嘉兴市|移动', 'Windows NT ??', 'Chrome 118', '2023-10-26 13:38:16');
INSERT INTO `l_visit_log` VALUES (4889, '总览', '223.104.164.36', '中国|浙江省|嘉兴市|移动', 'Windows NT ??', 'Chrome 118', '2023-10-26 13:38:16');
INSERT INTO `l_visit_log` VALUES (4890, '记录中心', '223.104.164.36', '中国|浙江省|嘉兴市|移动', 'Windows NT ??', 'Chrome 118', '2023-10-26 13:52:24');
INSERT INTO `l_visit_log` VALUES (4891, '记录中心', '223.104.164.36', '中国|浙江省|嘉兴市|移动', 'Windows NT ??', 'Chrome 118', '2023-10-26 13:52:46');
INSERT INTO `l_visit_log` VALUES (4892, '记录中心', '223.104.164.36', '中国|浙江省|嘉兴市|移动', 'Windows NT ??', 'Chrome 118', '2023-10-26 13:55:04');
INSERT INTO `l_visit_log` VALUES (4893, '总览', '223.104.164.36', '中国|浙江省|嘉兴市|移动', 'Windows NT ??', 'Chrome 118', '2023-10-26 13:57:44');
INSERT INTO `l_visit_log` VALUES (4894, '总览', '223.104.164.36', '中国|浙江省|嘉兴市|移动', 'Windows NT ??', 'Chrome 118', '2023-10-26 13:57:44');
INSERT INTO `l_visit_log` VALUES (4895, '总览', '223.104.164.36', '中国|浙江省|嘉兴市|移动', 'Windows NT ??', 'Chrome 118', '2023-10-26 14:12:14');
INSERT INTO `l_visit_log` VALUES (4896, '记录中心', '223.104.164.36', '中国|浙江省|嘉兴市|移动', 'Windows NT ??', 'Chrome 118', '2023-10-26 14:46:18');
INSERT INTO `l_visit_log` VALUES (4897, '记录中心', '223.104.164.36', '中国|浙江省|嘉兴市|移动', 'Windows NT ??', 'Chrome 118', '2023-10-26 14:46:22');
INSERT INTO `l_visit_log` VALUES (4898, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-26 16:26:24');
INSERT INTO `l_visit_log` VALUES (4899, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-26 16:57:04');
INSERT INTO `l_visit_log` VALUES (4900, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-26 17:14:14');
INSERT INTO `l_visit_log` VALUES (4901, '记录中心', '122.238.191.20', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-26 17:16:02');
INSERT INTO `l_visit_log` VALUES (4902, '总览', '122.238.190.15', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-27 08:40:36');
INSERT INTO `l_visit_log` VALUES (4903, '总览', '122.238.190.15', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-27 08:40:38');
INSERT INTO `l_visit_log` VALUES (4904, '总览', '122.238.190.15', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-27 08:42:05');
INSERT INTO `l_visit_log` VALUES (4905, '总览', '122.238.190.15', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-27 09:28:09');
INSERT INTO `l_visit_log` VALUES (4906, '总览', '122.238.190.15', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-27 09:28:37');
INSERT INTO `l_visit_log` VALUES (4907, '总览', '122.238.190.15', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-27 09:36:49');
INSERT INTO `l_visit_log` VALUES (4908, '总览', '122.238.190.15', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-27 09:36:49');
INSERT INTO `l_visit_log` VALUES (4909, '总览', '122.238.190.15', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-27 10:05:46');
INSERT INTO `l_visit_log` VALUES (4910, '总览', '122.238.190.15', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-27 10:05:46');
INSERT INTO `l_visit_log` VALUES (4911, '总览', '122.238.190.15', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-27 13:19:13');
INSERT INTO `l_visit_log` VALUES (4912, '总览', '122.238.190.15', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-27 16:13:32');
INSERT INTO `l_visit_log` VALUES (4913, '总览', '122.238.190.15', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-27 16:13:32');
INSERT INTO `l_visit_log` VALUES (4914, '总览', '122.238.190.15', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-27 16:13:34');
INSERT INTO `l_visit_log` VALUES (4915, '总览', '122.238.190.15', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-27 19:18:48');
INSERT INTO `l_visit_log` VALUES (4916, '总览', '122.238.190.15', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-27 19:18:50');
INSERT INTO `l_visit_log` VALUES (4917, '总览', '122.238.190.15', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-27 19:18:53');
INSERT INTO `l_visit_log` VALUES (4918, '总览', '122.238.190.15', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-27 19:21:01');
INSERT INTO `l_visit_log` VALUES (4919, '总览', '122.238.190.15', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-27 19:21:01');
INSERT INTO `l_visit_log` VALUES (4920, '总览', '122.238.190.15', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-27 19:21:06');
INSERT INTO `l_visit_log` VALUES (4921, '总览', '122.238.190.15', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-27 19:44:37');
INSERT INTO `l_visit_log` VALUES (4922, '总览', '122.238.190.15', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-27 19:44:58');
INSERT INTO `l_visit_log` VALUES (4923, '总览', '122.238.190.15', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-27 19:45:00');
INSERT INTO `l_visit_log` VALUES (4924, '记录中心', '122.238.190.15', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-27 21:31:59');
INSERT INTO `l_visit_log` VALUES (4925, '记录中心', '122.238.190.15', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-27 21:32:11');
INSERT INTO `l_visit_log` VALUES (4926, '记录中心', '122.238.190.15', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-27 21:32:16');
INSERT INTO `l_visit_log` VALUES (4927, '记录中心', '122.238.190.15', '中国|浙江省|嘉兴市|电信', 'Windows NT ??', 'Chrome 118', '2023-10-27 21:32:19');
INSERT INTO `l_visit_log` VALUES (4928, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-30 13:15:29');
INSERT INTO `l_visit_log` VALUES (4929, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-30 13:16:42');
INSERT INTO `l_visit_log` VALUES (4930, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-30 13:16:44');
INSERT INTO `l_visit_log` VALUES (4931, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-30 13:16:51');
INSERT INTO `l_visit_log` VALUES (4932, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-30 13:17:12');
INSERT INTO `l_visit_log` VALUES (4933, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-30 13:17:17');
INSERT INTO `l_visit_log` VALUES (4934, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-30 13:17:19');
INSERT INTO `l_visit_log` VALUES (4935, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-30 13:32:45');
INSERT INTO `l_visit_log` VALUES (4936, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-30 13:32:52');
INSERT INTO `l_visit_log` VALUES (4937, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-30 13:32:55');
INSERT INTO `l_visit_log` VALUES (4938, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-30 13:32:56');
INSERT INTO `l_visit_log` VALUES (4939, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-30 17:44:52');
INSERT INTO `l_visit_log` VALUES (4940, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-30 17:45:12');
INSERT INTO `l_visit_log` VALUES (4941, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-30 17:45:12');
INSERT INTO `l_visit_log` VALUES (4942, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-30 17:45:14');
INSERT INTO `l_visit_log` VALUES (4943, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-30 17:46:13');
INSERT INTO `l_visit_log` VALUES (4944, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-30 17:46:20');
INSERT INTO `l_visit_log` VALUES (4945, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-30 17:47:20');
INSERT INTO `l_visit_log` VALUES (4946, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-30 23:57:16');
INSERT INTO `l_visit_log` VALUES (4947, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 00:18:24');
INSERT INTO `l_visit_log` VALUES (4948, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 00:18:34');
INSERT INTO `l_visit_log` VALUES (4949, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 00:18:37');
INSERT INTO `l_visit_log` VALUES (4950, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 00:48:59');
INSERT INTO `l_visit_log` VALUES (4951, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 00:49:02');
INSERT INTO `l_visit_log` VALUES (4952, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 00:49:04');
INSERT INTO `l_visit_log` VALUES (4953, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 00:49:08');
INSERT INTO `l_visit_log` VALUES (4954, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 09:38:38');
INSERT INTO `l_visit_log` VALUES (4955, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 09:38:39');
INSERT INTO `l_visit_log` VALUES (4956, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 09:38:41');
INSERT INTO `l_visit_log` VALUES (4957, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 09:38:49');
INSERT INTO `l_visit_log` VALUES (4958, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 09:52:49');
INSERT INTO `l_visit_log` VALUES (4959, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 09:52:51');
INSERT INTO `l_visit_log` VALUES (4960, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 09:53:22');
INSERT INTO `l_visit_log` VALUES (4961, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 09:53:28');
INSERT INTO `l_visit_log` VALUES (4962, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 12:46:27');
INSERT INTO `l_visit_log` VALUES (4963, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 12:46:27');
INSERT INTO `l_visit_log` VALUES (4964, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 12:46:30');
INSERT INTO `l_visit_log` VALUES (4965, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 12:54:31');
INSERT INTO `l_visit_log` VALUES (4966, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 12:56:31');
INSERT INTO `l_visit_log` VALUES (4967, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 12:56:58');
INSERT INTO `l_visit_log` VALUES (4968, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 12:57:00');
INSERT INTO `l_visit_log` VALUES (4969, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:06:31');
INSERT INTO `l_visit_log` VALUES (4970, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:06:31');
INSERT INTO `l_visit_log` VALUES (4971, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:07:14');
INSERT INTO `l_visit_log` VALUES (4972, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:07:15');
INSERT INTO `l_visit_log` VALUES (4973, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:07:15');
INSERT INTO `l_visit_log` VALUES (4974, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:07:50');
INSERT INTO `l_visit_log` VALUES (4975, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:08:13');
INSERT INTO `l_visit_log` VALUES (4976, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:08:15');
INSERT INTO `l_visit_log` VALUES (4977, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:09:14');
INSERT INTO `l_visit_log` VALUES (4978, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:15:26');
INSERT INTO `l_visit_log` VALUES (4979, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:18:04');
INSERT INTO `l_visit_log` VALUES (4980, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:18:04');
INSERT INTO `l_visit_log` VALUES (4981, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:20:27');
INSERT INTO `l_visit_log` VALUES (4982, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:20:27');
INSERT INTO `l_visit_log` VALUES (4983, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:21:24');
INSERT INTO `l_visit_log` VALUES (4984, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:21:25');
INSERT INTO `l_visit_log` VALUES (4985, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:21:28');
INSERT INTO `l_visit_log` VALUES (4986, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:23:38');
INSERT INTO `l_visit_log` VALUES (4987, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:23:39');
INSERT INTO `l_visit_log` VALUES (4988, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:23:41');
INSERT INTO `l_visit_log` VALUES (4989, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:24:55');
INSERT INTO `l_visit_log` VALUES (4990, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:25:23');
INSERT INTO `l_visit_log` VALUES (4991, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:30:51');
INSERT INTO `l_visit_log` VALUES (4992, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:31:22');
INSERT INTO `l_visit_log` VALUES (4993, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:38:15');
INSERT INTO `l_visit_log` VALUES (4994, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:38:15');
INSERT INTO `l_visit_log` VALUES (4995, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:40:01');
INSERT INTO `l_visit_log` VALUES (4996, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:40:01');
INSERT INTO `l_visit_log` VALUES (4997, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:42:19');
INSERT INTO `l_visit_log` VALUES (4998, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:42:20');
INSERT INTO `l_visit_log` VALUES (4999, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:43:11');
INSERT INTO `l_visit_log` VALUES (5000, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:43:13');
INSERT INTO `l_visit_log` VALUES (5001, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:43:22');
INSERT INTO `l_visit_log` VALUES (5002, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:43:22');
INSERT INTO `l_visit_log` VALUES (5003, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:43:23');
INSERT INTO `l_visit_log` VALUES (5004, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:45:54');
INSERT INTO `l_visit_log` VALUES (5005, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:46:30');
INSERT INTO `l_visit_log` VALUES (5006, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:46:30');
INSERT INTO `l_visit_log` VALUES (5007, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:46:30');
INSERT INTO `l_visit_log` VALUES (5008, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:47:00');
INSERT INTO `l_visit_log` VALUES (5009, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:47:02');
INSERT INTO `l_visit_log` VALUES (5010, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:47:02');
INSERT INTO `l_visit_log` VALUES (5011, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:50:34');
INSERT INTO `l_visit_log` VALUES (5012, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:50:34');
INSERT INTO `l_visit_log` VALUES (5013, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:50:37');
INSERT INTO `l_visit_log` VALUES (5014, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:50:38');
INSERT INTO `l_visit_log` VALUES (5015, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:50:38');
INSERT INTO `l_visit_log` VALUES (5016, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:50:40');
INSERT INTO `l_visit_log` VALUES (5017, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:50:53');
INSERT INTO `l_visit_log` VALUES (5018, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:55:17');
INSERT INTO `l_visit_log` VALUES (5019, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:55:17');
INSERT INTO `l_visit_log` VALUES (5020, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:55:19');
INSERT INTO `l_visit_log` VALUES (5021, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:55:21');
INSERT INTO `l_visit_log` VALUES (5022, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:55:22');
INSERT INTO `l_visit_log` VALUES (5023, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:55:22');
INSERT INTO `l_visit_log` VALUES (5024, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:55:23');
INSERT INTO `l_visit_log` VALUES (5025, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:58:47');
INSERT INTO `l_visit_log` VALUES (5026, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:58:47');
INSERT INTO `l_visit_log` VALUES (5027, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:58:47');
INSERT INTO `l_visit_log` VALUES (5028, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:58:49');
INSERT INTO `l_visit_log` VALUES (5029, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:58:49');
INSERT INTO `l_visit_log` VALUES (5030, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:58:49');
INSERT INTO `l_visit_log` VALUES (5031, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:58:50');
INSERT INTO `l_visit_log` VALUES (5032, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:59:02');
INSERT INTO `l_visit_log` VALUES (5033, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:59:02');
INSERT INTO `l_visit_log` VALUES (5034, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:59:02');
INSERT INTO `l_visit_log` VALUES (5035, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:59:03');
INSERT INTO `l_visit_log` VALUES (5036, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:59:03');
INSERT INTO `l_visit_log` VALUES (5037, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:59:04');
INSERT INTO `l_visit_log` VALUES (5038, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:59:04');
INSERT INTO `l_visit_log` VALUES (5039, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:59:18');
INSERT INTO `l_visit_log` VALUES (5040, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:59:19');
INSERT INTO `l_visit_log` VALUES (5041, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:59:19');
INSERT INTO `l_visit_log` VALUES (5042, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:59:20');
INSERT INTO `l_visit_log` VALUES (5043, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:59:20');
INSERT INTO `l_visit_log` VALUES (5044, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:59:20');
INSERT INTO `l_visit_log` VALUES (5045, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:59:21');
INSERT INTO `l_visit_log` VALUES (5046, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:59:50');
INSERT INTO `l_visit_log` VALUES (5047, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:59:50');
INSERT INTO `l_visit_log` VALUES (5048, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:59:51');
INSERT INTO `l_visit_log` VALUES (5049, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:59:51');
INSERT INTO `l_visit_log` VALUES (5050, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 13:59:52');
INSERT INTO `l_visit_log` VALUES (5051, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 14:01:26');
INSERT INTO `l_visit_log` VALUES (5052, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 14:07:03');
INSERT INTO `l_visit_log` VALUES (5053, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 15:57:32');
INSERT INTO `l_visit_log` VALUES (5054, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 15:59:44');
INSERT INTO `l_visit_log` VALUES (5055, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 15:59:48');
INSERT INTO `l_visit_log` VALUES (5056, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 15:59:49');
INSERT INTO `l_visit_log` VALUES (5057, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:05:11');
INSERT INTO `l_visit_log` VALUES (5058, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:05:11');
INSERT INTO `l_visit_log` VALUES (5059, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:05:20');
INSERT INTO `l_visit_log` VALUES (5060, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:05:53');
INSERT INTO `l_visit_log` VALUES (5061, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:07:02');
INSERT INTO `l_visit_log` VALUES (5062, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:07:02');
INSERT INTO `l_visit_log` VALUES (5063, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:07:03');
INSERT INTO `l_visit_log` VALUES (5064, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:07:34');
INSERT INTO `l_visit_log` VALUES (5065, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:07:34');
INSERT INTO `l_visit_log` VALUES (5066, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:07:36');
INSERT INTO `l_visit_log` VALUES (5067, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:07:36');
INSERT INTO `l_visit_log` VALUES (5068, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:07:54');
INSERT INTO `l_visit_log` VALUES (5069, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:07:55');
INSERT INTO `l_visit_log` VALUES (5070, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:07:55');
INSERT INTO `l_visit_log` VALUES (5071, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:07:55');
INSERT INTO `l_visit_log` VALUES (5072, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:07:56');
INSERT INTO `l_visit_log` VALUES (5073, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:07:57');
INSERT INTO `l_visit_log` VALUES (5074, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:19:34');
INSERT INTO `l_visit_log` VALUES (5075, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:20:13');
INSERT INTO `l_visit_log` VALUES (5076, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:20:14');
INSERT INTO `l_visit_log` VALUES (5077, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:20:14');
INSERT INTO `l_visit_log` VALUES (5078, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:20:18');
INSERT INTO `l_visit_log` VALUES (5079, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:20:33');
INSERT INTO `l_visit_log` VALUES (5080, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:20:37');
INSERT INTO `l_visit_log` VALUES (5081, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:22:41');
INSERT INTO `l_visit_log` VALUES (5082, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:22:42');
INSERT INTO `l_visit_log` VALUES (5083, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:22:42');
INSERT INTO `l_visit_log` VALUES (5084, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:22:44');
INSERT INTO `l_visit_log` VALUES (5085, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:22:45');
INSERT INTO `l_visit_log` VALUES (5086, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:23:15');
INSERT INTO `l_visit_log` VALUES (5087, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:23:17');
INSERT INTO `l_visit_log` VALUES (5088, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:24:13');
INSERT INTO `l_visit_log` VALUES (5089, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:24:13');
INSERT INTO `l_visit_log` VALUES (5090, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:24:15');
INSERT INTO `l_visit_log` VALUES (5091, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:24:16');
INSERT INTO `l_visit_log` VALUES (5092, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:25:22');
INSERT INTO `l_visit_log` VALUES (5093, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:25:23');
INSERT INTO `l_visit_log` VALUES (5094, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 16:25:24');
INSERT INTO `l_visit_log` VALUES (5095, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 18:25:26');
INSERT INTO `l_visit_log` VALUES (5096, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 18:25:30');
INSERT INTO `l_visit_log` VALUES (5097, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 18:25:32');
INSERT INTO `l_visit_log` VALUES (5098, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 18:25:32');
INSERT INTO `l_visit_log` VALUES (5099, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 18:27:54');
INSERT INTO `l_visit_log` VALUES (5100, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 18:27:54');
INSERT INTO `l_visit_log` VALUES (5101, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 18:28:41');
INSERT INTO `l_visit_log` VALUES (5102, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 18:28:45');
INSERT INTO `l_visit_log` VALUES (5103, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 18:28:58');
INSERT INTO `l_visit_log` VALUES (5104, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 18:28:59');
INSERT INTO `l_visit_log` VALUES (5105, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 19:06:05');
INSERT INTO `l_visit_log` VALUES (5106, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 19:06:05');
INSERT INTO `l_visit_log` VALUES (5107, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 19:06:07');
INSERT INTO `l_visit_log` VALUES (5108, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 19:06:08');
INSERT INTO `l_visit_log` VALUES (5109, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 19:13:15');
INSERT INTO `l_visit_log` VALUES (5110, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 19:13:15');
INSERT INTO `l_visit_log` VALUES (5111, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 19:44:07');
INSERT INTO `l_visit_log` VALUES (5112, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 19:44:08');
INSERT INTO `l_visit_log` VALUES (5113, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 19:45:32');
INSERT INTO `l_visit_log` VALUES (5114, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 19:45:33');
INSERT INTO `l_visit_log` VALUES (5115, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 19:49:08');
INSERT INTO `l_visit_log` VALUES (5116, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 20:04:32');
INSERT INTO `l_visit_log` VALUES (5117, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 20:04:40');
INSERT INTO `l_visit_log` VALUES (5118, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 118', '2023-10-31 20:18:10');
INSERT INTO `l_visit_log` VALUES (5119, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 118', '2023-10-31 20:50:39');
INSERT INTO `l_visit_log` VALUES (5120, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 118', '2023-10-31 20:51:00');
INSERT INTO `l_visit_log` VALUES (5121, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 118', '2023-10-31 20:51:06');
INSERT INTO `l_visit_log` VALUES (5122, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 118', '2023-10-31 20:51:10');
INSERT INTO `l_visit_log` VALUES (5123, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 118', '2023-10-31 20:56:20');
INSERT INTO `l_visit_log` VALUES (5124, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 20:57:27');
INSERT INTO `l_visit_log` VALUES (5125, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 20:57:30');
INSERT INTO `l_visit_log` VALUES (5126, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 118', '2023-10-31 20:58:14');
INSERT INTO `l_visit_log` VALUES (5127, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 20:58:48');
INSERT INTO `l_visit_log` VALUES (5128, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:06:54');
INSERT INTO `l_visit_log` VALUES (5129, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:15:38');
INSERT INTO `l_visit_log` VALUES (5130, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:15:38');
INSERT INTO `l_visit_log` VALUES (5131, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:15:41');
INSERT INTO `l_visit_log` VALUES (5132, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:15:42');
INSERT INTO `l_visit_log` VALUES (5133, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:15:44');
INSERT INTO `l_visit_log` VALUES (5134, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:15:45');
INSERT INTO `l_visit_log` VALUES (5135, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:15:46');
INSERT INTO `l_visit_log` VALUES (5136, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:15:48');
INSERT INTO `l_visit_log` VALUES (5137, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:15:49');
INSERT INTO `l_visit_log` VALUES (5138, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:15:50');
INSERT INTO `l_visit_log` VALUES (5139, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:15:51');
INSERT INTO `l_visit_log` VALUES (5140, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:15:52');
INSERT INTO `l_visit_log` VALUES (5141, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:15:53');
INSERT INTO `l_visit_log` VALUES (5142, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:15:54');
INSERT INTO `l_visit_log` VALUES (5143, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:15:55');
INSERT INTO `l_visit_log` VALUES (5144, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:15:56');
INSERT INTO `l_visit_log` VALUES (5145, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:16:10');
INSERT INTO `l_visit_log` VALUES (5146, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:16:10');
INSERT INTO `l_visit_log` VALUES (5147, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:16:11');
INSERT INTO `l_visit_log` VALUES (5148, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:16:12');
INSERT INTO `l_visit_log` VALUES (5149, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:16:13');
INSERT INTO `l_visit_log` VALUES (5150, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:16:13');
INSERT INTO `l_visit_log` VALUES (5151, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:16:15');
INSERT INTO `l_visit_log` VALUES (5152, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:18:28');
INSERT INTO `l_visit_log` VALUES (5153, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:18:36');
INSERT INTO `l_visit_log` VALUES (5154, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:18:39');
INSERT INTO `l_visit_log` VALUES (5155, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:19:01');
INSERT INTO `l_visit_log` VALUES (5156, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:19:28');
INSERT INTO `l_visit_log` VALUES (5157, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:19:29');
INSERT INTO `l_visit_log` VALUES (5158, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:19:34');
INSERT INTO `l_visit_log` VALUES (5159, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 21:19:37');
INSERT INTO `l_visit_log` VALUES (5160, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 118', '2023-10-31 21:47:39');
INSERT INTO `l_visit_log` VALUES (5161, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 118', '2023-10-31 21:48:17');
INSERT INTO `l_visit_log` VALUES (5162, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 118', '2023-10-31 21:48:24');
INSERT INTO `l_visit_log` VALUES (5163, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 118', '2023-10-31 22:02:51');
INSERT INTO `l_visit_log` VALUES (5164, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 22:03:13');
INSERT INTO `l_visit_log` VALUES (5165, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 22:27:43');
INSERT INTO `l_visit_log` VALUES (5166, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 22:27:47');
INSERT INTO `l_visit_log` VALUES (5167, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 22:27:49');
INSERT INTO `l_visit_log` VALUES (5168, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-10-31 22:27:50');
INSERT INTO `l_visit_log` VALUES (5169, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 08:25:45');
INSERT INTO `l_visit_log` VALUES (5170, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 08:27:33');
INSERT INTO `l_visit_log` VALUES (5171, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 08:27:34');
INSERT INTO `l_visit_log` VALUES (5172, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 08:27:36');
INSERT INTO `l_visit_log` VALUES (5173, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 08:27:37');
INSERT INTO `l_visit_log` VALUES (5174, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 08:27:51');
INSERT INTO `l_visit_log` VALUES (5175, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 08:31:16');
INSERT INTO `l_visit_log` VALUES (5176, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 08:35:44');
INSERT INTO `l_visit_log` VALUES (5177, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 118', '2023-11-01 17:00:26');
INSERT INTO `l_visit_log` VALUES (5178, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows >=10', 'Edge 118', '2023-11-01 17:00:57');
INSERT INTO `l_visit_log` VALUES (5179, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 18:08:41');
INSERT INTO `l_visit_log` VALUES (5180, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 18:08:46');
INSERT INTO `l_visit_log` VALUES (5181, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 18:08:51');
INSERT INTO `l_visit_log` VALUES (5182, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 18:08:57');
INSERT INTO `l_visit_log` VALUES (5183, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 18:12:55');
INSERT INTO `l_visit_log` VALUES (5184, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 18:12:58');
INSERT INTO `l_visit_log` VALUES (5185, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 18:13:00');
INSERT INTO `l_visit_log` VALUES (5186, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 18:13:04');
INSERT INTO `l_visit_log` VALUES (5187, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 18:22:39');
INSERT INTO `l_visit_log` VALUES (5188, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 18:22:47');
INSERT INTO `l_visit_log` VALUES (5189, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 18:22:50');
INSERT INTO `l_visit_log` VALUES (5190, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 18:23:33');
INSERT INTO `l_visit_log` VALUES (5191, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 18:23:35');
INSERT INTO `l_visit_log` VALUES (5192, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 18:23:36');
INSERT INTO `l_visit_log` VALUES (5193, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 19:02:44');
INSERT INTO `l_visit_log` VALUES (5194, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 19:13:57');
INSERT INTO `l_visit_log` VALUES (5195, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 19:14:00');
INSERT INTO `l_visit_log` VALUES (5196, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 19:17:18');
INSERT INTO `l_visit_log` VALUES (5197, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 19:17:22');
INSERT INTO `l_visit_log` VALUES (5198, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 19:35:56');
INSERT INTO `l_visit_log` VALUES (5199, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 19:44:47');
INSERT INTO `l_visit_log` VALUES (5200, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 19:44:47');
INSERT INTO `l_visit_log` VALUES (5201, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 19:44:49');
INSERT INTO `l_visit_log` VALUES (5202, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 19:44:50');
INSERT INTO `l_visit_log` VALUES (5203, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 19:45:47');
INSERT INTO `l_visit_log` VALUES (5204, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 19:45:51');
INSERT INTO `l_visit_log` VALUES (5205, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 19:45:52');
INSERT INTO `l_visit_log` VALUES (5206, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 19:46:03');
INSERT INTO `l_visit_log` VALUES (5207, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 19:46:05');
INSERT INTO `l_visit_log` VALUES (5208, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 19:46:06');
INSERT INTO `l_visit_log` VALUES (5209, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:03:00');
INSERT INTO `l_visit_log` VALUES (5210, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:03:04');
INSERT INTO `l_visit_log` VALUES (5211, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:03:06');
INSERT INTO `l_visit_log` VALUES (5212, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:03:57');
INSERT INTO `l_visit_log` VALUES (5213, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:04:04');
INSERT INTO `l_visit_log` VALUES (5214, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:04:08');
INSERT INTO `l_visit_log` VALUES (5215, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:04:11');
INSERT INTO `l_visit_log` VALUES (5216, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:15:40');
INSERT INTO `l_visit_log` VALUES (5217, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:15:45');
INSERT INTO `l_visit_log` VALUES (5218, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:15:48');
INSERT INTO `l_visit_log` VALUES (5219, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:16:08');
INSERT INTO `l_visit_log` VALUES (5220, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:19:57');
INSERT INTO `l_visit_log` VALUES (5221, '关于', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:20:06');
INSERT INTO `l_visit_log` VALUES (5222, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:25:43');
INSERT INTO `l_visit_log` VALUES (5223, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:26:22');
INSERT INTO `l_visit_log` VALUES (5224, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:42:13');
INSERT INTO `l_visit_log` VALUES (5225, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:42:42');
INSERT INTO `l_visit_log` VALUES (5226, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:42:45');
INSERT INTO `l_visit_log` VALUES (5227, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:42:59');
INSERT INTO `l_visit_log` VALUES (5228, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:43:28');
INSERT INTO `l_visit_log` VALUES (5229, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:43:31');
INSERT INTO `l_visit_log` VALUES (5230, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:44:15');
INSERT INTO `l_visit_log` VALUES (5231, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:44:22');
INSERT INTO `l_visit_log` VALUES (5232, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:44:24');
INSERT INTO `l_visit_log` VALUES (5233, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:45:24');
INSERT INTO `l_visit_log` VALUES (5234, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:46:08');
INSERT INTO `l_visit_log` VALUES (5235, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:46:11');
INSERT INTO `l_visit_log` VALUES (5236, '记录中心', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 20:49:45');
INSERT INTO `l_visit_log` VALUES (5237, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 21:01:35');
INSERT INTO `l_visit_log` VALUES (5238, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 21:01:36');
INSERT INTO `l_visit_log` VALUES (5239, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 21:01:38');
INSERT INTO `l_visit_log` VALUES (5240, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 21:01:39');
INSERT INTO `l_visit_log` VALUES (5241, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 21:04:37');
INSERT INTO `l_visit_log` VALUES (5242, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 21:04:37');
INSERT INTO `l_visit_log` VALUES (5243, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 21:04:41');
INSERT INTO `l_visit_log` VALUES (5244, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 21:04:42');
INSERT INTO `l_visit_log` VALUES (5245, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 21:10:37');
INSERT INTO `l_visit_log` VALUES (5246, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 21:10:37');
INSERT INTO `l_visit_log` VALUES (5247, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 21:10:40');
INSERT INTO `l_visit_log` VALUES (5248, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 21:10:41');
INSERT INTO `l_visit_log` VALUES (5249, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 21:30:01');
INSERT INTO `l_visit_log` VALUES (5250, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 21:30:02');
INSERT INTO `l_visit_log` VALUES (5251, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 21:30:02');
INSERT INTO `l_visit_log` VALUES (5252, '总览', '192.168.44.1', '内网IP|内网IP', 'Windows NT ??', 'Chrome 118', '2023-11-01 21:30:04');

-- ----------------------------
-- Table structure for s_admin
-- ----------------------------
DROP TABLE IF EXISTS `s_admin`;
CREATE TABLE `s_admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '管理员昵称',
  `admin_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '头像',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '邮箱',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录ip',
  `ip_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地址',
  `is_disable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用 (0否 1是)',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '登录时间',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_admin
-- ----------------------------
INSERT INTO `s_admin` VALUES (1, 'V函数', 'vhans', '93988fed14da0c1b1865753a17918f51014b7363dc21aadb2b1391f17e4a5226', 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/vhans.jpg', '2873585297@qq.com', '192.168.244.1', '内网IP|内网IP', 0, '2023-09-04 00:18:15', '2022-11-29 21:45:48', '2023-09-04 00:18:15');
INSERT INTO `s_admin` VALUES (2, '测试人员', 'test', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/vhans.jpg', '2873585297@qq.com', '192.168.244.1', '内网IP|内网IP', 0, '2023-04-22 09:20:37', '2022-11-30 21:34:26', '2023-08-31 22:11:29');
INSERT INTO `s_admin` VALUES (3, '管理账号', 'admin', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/vhans.jpg', '2873585297@qq.com', '192.168.244.1', '内网IP|内网IP', 0, '2023-04-22 09:20:37', '2022-11-30 21:34:26', NULL);

-- ----------------------------
-- Table structure for s_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `s_admin_role`;
CREATE TABLE `s_admin_role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `admin_id` int(0) NOT NULL COMMENT '用户id',
  `role_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色id(标识)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_admin_role
-- ----------------------------
INSERT INTO `s_admin_role` VALUES (1, 1, '1');
INSERT INTO `s_admin_role` VALUES (2, 2, '2');
INSERT INTO `s_admin_role` VALUES (3, 3, '3');

-- ----------------------------
-- Table structure for s_file_record
-- ----------------------------
DROP TABLE IF EXISTS `s_file_record`;
CREATE TABLE `s_file_record`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件url',
  `file_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件名',
  `file_size` int(0) NOT NULL DEFAULT 0 COMMENT '文件大小',
  `extend_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '文件类型',
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件路径',
  `is_dir` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为目录 (0否 1是)',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 331 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_file_record
-- ----------------------------
INSERT INTO `s_file_record` VALUES (1, NULL, 'test', 0, '', '/', 1, '2023-04-22 13:34:33', NULL);
INSERT INTO `s_file_record` VALUES (2, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/3343e13d2426e268352fb80b51bf7113.jpg', '自然森林', 23826, 'png', '/record/image', 0, '2023-04-22 13:35:34', NULL);
INSERT INTO `s_file_record` VALUES (3, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/864a4e503bc6abeaf217e0285084af3b.jpg', '操场接力', 100182, 'jpg', '/record/image', 0, '2023-04-22 13:38:58', NULL);
INSERT INTO `s_file_record` VALUES (4, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/dcbe2fff1ef47be21827f80fd3057f2a.java', '测试文件', 1729, 'java', '/record/', 0, '2023-10-03 22:59:03', NULL);
INSERT INTO `s_file_record` VALUES (5, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/avatar/d86855a693b9c73c185bc677554ea60a.jpeg', '小姐姐', 190835, 'jpeg', '/avatar/', 0, '2023-09-01 20:53:18', NULL);
INSERT INTO `s_file_record` VALUES (6, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/b380c8a3643f7fd3bcc11cdf53091d96.jpg', '52160128366307220761613884222797', 871784, 'jpg', '/temp/', 0, '2023-10-06 22:29:54', NULL);
INSERT INTO `s_file_record` VALUES (7, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/bf613db529cc490e0bc61d651e21415b.png', 'image', 794363, 'png', '/temp/', 0, '2023-10-06 22:31:42', NULL);
INSERT INTO `s_file_record` VALUES (8, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/378d3d4d7e1c7696cbb7d0709538798f.jpg', '-42a831c7f07921a8', 121238, 'jpg', '/temp/', 0, '2023-10-06 23:46:08', NULL);
INSERT INTO `s_file_record` VALUES (9, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/2ecaacfe252f54894f1a3cfb90de9e37.zip', 'jebrains破解补丁+CLion激活码20221110', 92007, 'zip', '/temp/', 0, '2023-10-07 09:41:09', NULL);
INSERT INTO `s_file_record` VALUES (222, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/96a1088c91b5c64b2ed0c57aa495d438.jpg', 'mmexport1687863732550', 1621888, 'jpg', '/temp/', 0, '2023-10-08 10:21:56', NULL);
INSERT INTO `s_file_record` VALUES (223, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/da0704299c44631a6ca09dc941a545eb.ico', 'agree', 23826, 'ico', '/temp/', 0, '2023-10-08 10:48:14', NULL);
INSERT INTO `s_file_record` VALUES (224, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/dc6cd56262da0df87f9cd4db0012e81f.png', '300', 49036, 'png', '/temp/', 0, '2023-10-08 16:57:47', NULL);
INSERT INTO `s_file_record` VALUES (225, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/92733b33afbc9c3b09ff2d268105ff20.jfif', 'images', 1215, 'jfif', '/temp/', 0, '2023-10-08 16:58:32', NULL);
INSERT INTO `s_file_record` VALUES (226, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/17e1acc863524b9d757c31eadcd415c5.jpg', '41fe62725c1986236d9260897255fc', 123406, 'jpg', '/temp/', 0, '2023-10-08 17:25:21', NULL);
INSERT INTO `s_file_record` VALUES (227, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/,/temp/17e1acc863524b9d757c31eadcd415c5.jpg', '41fe62725c1986236d9260897255fc', 123406, 'jpg', '/temp/,/temp/', 0, '2023-10-08 17:25:22', NULL);
INSERT INTO `s_file_record` VALUES (228, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/,/temp/,/temp/17e1acc863524b9d757c31eadcd415c5.jpg', '41fe62725c1986236d9260897255fc', 123406, 'jpg', '/temp/,/temp/,/temp/', 0, '2023-10-08 17:25:23', NULL);
INSERT INTO `s_file_record` VALUES (229, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/,/temp/,/temp/,/temp/17e1acc863524b9d757c31eadcd415c5.jpg', '41fe62725c1986236d9260897255fc', 123406, 'jpg', '/temp/,/temp/,/temp/,/temp/', 0, '2023-10-08 17:25:23', NULL);
INSERT INTO `s_file_record` VALUES (230, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/,/temp/,/temp/,/temp/,/temp/17e1acc863524b9d757c31eadcd415c5.jpg', '41fe62725c1986236d9260897255fc', 123406, 'jpg', '/temp/,/temp/,/temp/,/temp/,/temp/', 0, '2023-10-08 17:25:24', NULL);
INSERT INTO `s_file_record` VALUES (231, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/,/temp/,/temp/,/temp/,/temp/,/temp/17e1acc863524b9d757c31eadcd415c5.jpg', '41fe62725c1986236d9260897255fc', 123406, 'jpg', '/temp/,/temp/,/temp/,/temp/,/temp/,/temp/', 0, '2023-10-08 17:25:25', NULL);
INSERT INTO `s_file_record` VALUES (232, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/,/temp/,/temp/,/temp/,/temp/,/temp/,/temp/17e1acc863524b9d757c31eadcd415c5.jpg', '41fe62725c1986236d9260897255fc', 123406, 'jpg', '/temp/,/temp/,/temp/,/temp/,/temp/,/temp/,/temp/', 0, '2023-10-08 17:25:26', NULL);
INSERT INTO `s_file_record` VALUES (233, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/,/temp/,/temp/,/temp/,/temp/,/temp/,/temp/,/temp/17e1acc863524b9d757c31eadcd415c5.jpg', '41fe62725c1986236d9260897255fc', 123406, 'jpg', '/temp/,/temp/,/temp/,/temp/,/temp/,/temp/,/temp/,/temp/', 0, '2023-10-08 17:25:27', NULL);
INSERT INTO `s_file_record` VALUES (234, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/,/temp/,/temp/,/temp/,/temp/,/temp/,/temp/,/temp/,/temp/17e1acc863524b9d757c31eadcd415c5.jpg', '41fe62725c1986236d9260897255fc', 123406, 'jpg', '/temp/,/temp/,/temp/,/temp/,/temp/,/temp/,/temp/,/temp/,/temp/', 0, '2023-10-08 17:25:28', NULL);
INSERT INTO `s_file_record` VALUES (235, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/,/temp/,/temp/,/temp/,/temp/,/temp/,/temp/,/temp/,/temp/,/temp/17e1acc863524b9d757c31eadcd415c5.jpg', '41fe62725c1986236d9260897255fc', 123406, 'jpg', '/temp/,/temp/,/temp/,/temp/,/temp/,/temp/,/temp/,/temp/,/temp/,/temp/', 0, '2023-10-08 17:25:28', NULL);
INSERT INTO `s_file_record` VALUES (236, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/4170b7a52a57e4c9274669e92ebd2e0c.jpg', 'user-1', 889782, 'jpg', '/temp/', 0, '2023-10-08 17:28:20', NULL);
INSERT INTO `s_file_record` VALUES (237, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/d2b691eda75f81958756dc99d06c18c9.jpg', 'user-bg3', 16556, 'jpg', '/temp/', 0, '2023-10-08 17:29:53', NULL);
INSERT INTO `s_file_record` VALUES (238, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/8cbff031e3f8b6d251cd9cd853c211c1.jpg', 'user-bg5', 22534, 'jpg', '/temp/', 0, '2023-10-08 17:30:00', NULL);
INSERT INTO `s_file_record` VALUES (239, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/cb12b3f79eec1487a6e8dc6f5a2b7bf8.jpg', 'E-1090636-6F5D2AD1', 26426, 'jpg', '/temp/', 0, '2023-10-08 17:38:09', NULL);
INSERT INTO `s_file_record` VALUES (240, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/c43755a9c8de30d91d8d4339845f6030.jpg', 'user-bg2', 46046, 'jpg', '/temp/', 0, '2023-10-08 17:45:58', NULL);
INSERT INTO `s_file_record` VALUES (241, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/0f38ef344d2f55fe4339d5f2a738f44a.jpg', '4797.jpg_wh300', 84473, 'jpg', '/temp/', 0, '2023-10-08 18:59:59', NULL);
INSERT INTO `s_file_record` VALUES (242, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/7fce90c38596dfdb0e0ef56bc9621b79.jpg', 'user-bg4', 22559, 'jpg', '/temp/', 0, '2023-10-08 19:03:34', NULL);
INSERT INTO `s_file_record` VALUES (243, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/,/temp/dc6cd56262da0df87f9cd4db0012e81f.png', '300', 49036, 'png', '/temp/,/temp/', 0, '2023-10-08 19:06:43', NULL);
INSERT INTO `s_file_record` VALUES (244, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/308c0f702d409bf1b12640891a8e8d89.csv', 'a_role', 341, 'csv', '/temp/', 0, '2023-10-08 19:28:17', NULL);
INSERT INTO `s_file_record` VALUES (245, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/c779d8cd7057b8b9e7d4279ccf414a0a.png', 'file-m', 2498, 'png', '/temp/', 0, '2023-10-08 19:43:07', NULL);
INSERT INTO `s_file_record` VALUES (246, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/0cea12be53ea93c71486b9171c29e8f7.csv', 'a_role_menu', 3977, 'csv', '/temp/', 0, '2023-10-08 19:48:20', NULL);
INSERT INTO `s_file_record` VALUES (247, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/,/temp/4170b7a52a57e4c9274669e92ebd2e0c.jpg', 'user-1', 889782, 'jpg', '/temp/,/temp/', 0, '2023-10-08 19:49:47', NULL);
INSERT INTO `s_file_record` VALUES (248, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/,/temp/,/temp/4170b7a52a57e4c9274669e92ebd2e0c.jpg', 'user-1', 889782, 'jpg', '/temp/,/temp/,/temp/', 0, '2023-10-08 19:49:49', NULL);
INSERT INTO `s_file_record` VALUES (249, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/7c4210ea81d20ad023efc04be84c91f7.csv', 'a_admin_role', 115, 'csv', '/temp/', 0, '2023-10-08 20:12:14', NULL);
INSERT INTO `s_file_record` VALUES (250, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/4e17d7db7acf485286783034e3814f8f.jpg', 'wallhaven-135r5v', 879035, 'jpg', '/temp/', 0, '2023-10-08 20:15:17', NULL);
INSERT INTO `s_file_record` VALUES (251, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/,/temp/4e17d7db7acf485286783034e3814f8f.jpg', 'wallhaven-135r5v', 879035, 'jpg', '/temp/,/temp/', 0, '2023-10-08 20:15:19', NULL);
INSERT INTO `s_file_record` VALUES (252, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/2add480c5dcc29350977a782152e5719.jpg', 'user-bg', 25006, 'jpg', '/temp/', 0, '2023-10-08 20:17:26', NULL);
INSERT INTO `s_file_record` VALUES (253, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/85902ff1273548827014398faa50835a.jpg', 'img-1618272520307fbefa6b05379a9918900ce51a6ff3ab0', 71605, 'jpg', '/temp/', 0, '2023-10-08 20:40:56', NULL);
INSERT INTO `s_file_record` VALUES (254, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/eba9cf99d7272a645d33c64afdf546d4.jpg', 'img-1618790427978d7572c10ef3c26a20bbebf2afa84002a', 280021, 'jpg', '/temp/', 0, '2023-10-08 20:40:57', NULL);
INSERT INTO `s_file_record` VALUES (255, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/0357babdb438ed09d39324f52f1cf6f6.jpg', 'img-1618103506002a70f03c6f7ab9a41a14c5211103816e3', 93123, 'jpg', '/temp/', 0, '2023-10-08 20:40:59', NULL);
INSERT INTO `s_file_record` VALUES (256, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/f495d9c1db5ea575ecfb92751eea0170.zip', 'tts-vue-windows-latest', 72818991, 'zip', '/temp/', 0, '2023-10-08 21:21:52', NULL);
INSERT INTO `s_file_record` VALUES (257, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/6a3b7374c6b7fb0cd5cd35dcf361d53c.sql', 'u2_config', 132839, 'sql', '/temp/', 0, '2023-10-08 21:24:56', NULL);
INSERT INTO `s_file_record` VALUES (258, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/8e69ad86ca73a6ca7570d02feeffa983.zip', 'ego_project', 98035985, 'zip', '/temp/', 0, '2023-10-08 21:25:46', NULL);
INSERT INTO `s_file_record` VALUES (259, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/848033afaf82c1eac3e24820219644dc.sql', 'u2_config', 139828, 'sql', '/temp/', 0, '2023-10-08 21:33:14', NULL);
INSERT INTO `s_file_record` VALUES (260, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/dcbe2fff1ef47be21827f80fd3057f2a.java', '测试文件', 1729, 'java', '/temp/', 0, '2023-10-08 21:38:12', NULL);
INSERT INTO `s_file_record` VALUES (261, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/95715da36ee97ce53e1d3c383fa58da0.jpg', 'img-1621118331404c2c56d8fdf5bde766c54a75ed82170d7', 149069, 'jpg', '/temp/', 0, '2023-10-08 21:38:40', NULL);
INSERT INTO `s_file_record` VALUES (262, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/24cbe045d1a471b5404f3a22e2f40387.jpg', 'img-1621118348239dbf548802b13a2ccae55ed4a11d69a70', 100182, 'jpg', '/temp/', 0, '2023-10-08 21:38:41', NULL);
INSERT INTO `s_file_record` VALUES (263, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/5fb341f0f7b4a582ea1d043e2841e7b0.jpg', 'img-1620352638772e43003ed02fc4c0e38ecfb4b645a2fbe', 94375, 'jpg', '/temp/', 0, '2023-10-08 21:38:41', NULL);
INSERT INTO `s_file_record` VALUES (264, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/1fe25c7efca796f934b4ffa051305b57.html', 'netty-test', 2911, 'html', '/temp/', 0, '2023-10-08 21:49:03', NULL);
INSERT INTO `s_file_record` VALUES (265, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/cc91ec1cdbd1222d3eaea67d7312e7e5.mp4', 'b99b51e6c7945c9d5565861d397451cb_preview', 1792593, 'mp4', '/temp/', 0, '2023-10-08 21:51:51', NULL);
INSERT INTO `s_file_record` VALUES (266, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/316c7d1ec6d28ceec39431d99a0829e2.mp4', '3760b2031ff41ca0bd80bc7a8a13f7bb_preview', 6263549, 'mp4', '/temp/', 0, '2023-10-08 21:52:14', NULL);
INSERT INTO `s_file_record` VALUES (267, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/93196f11679f7af3e23720dc423b1a01.jpg', 'img-16181624121219de05d6d1cc89484723e81e4c4962d09', 147419, 'jpg', '/temp/', 0, '2023-10-08 21:52:31', NULL);
INSERT INTO `s_file_record` VALUES (268, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/4ca2860f280c22e9a6983e9f3f88079a.jpg', 'img-16182725268499df9330995fc34d9c86897926a947843', 86691, 'jpg', '/temp/', 0, '2023-10-08 21:52:32', NULL);
INSERT INTO `s_file_record` VALUES (269, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/978c3086c91e5b84f290bd0b21722a62.jpg', 'img-16147404618535f7a91dc806f68f617edc127e30b1179', 158964, 'jpg', '/temp/', 0, '2023-10-08 21:52:33', NULL);
INSERT INTO `s_file_record` VALUES (270, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/d17b3d4bab676a2c365b82f65c9a5374.zip', 'mysql-8.0.30-winx64', 226363319, 'zip', '/temp/', 0, '2023-10-08 22:02:57', NULL);
INSERT INTO `s_file_record` VALUES (271, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/943a29b6d6d7c1c38be09bd3d430b0e6.zip', 'sw', 77647058, 'zip', '/temp/', 0, '2023-10-09 08:57:02', NULL);
INSERT INTO `s_file_record` VALUES (272, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/9a372fea6f8ef7b42137098a134b4fe9.zip', 'CF', 109845026, 'zip', '/temp/', 0, '2023-10-09 09:38:00', NULL);
INSERT INTO `s_file_record` VALUES (273, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/9a85f5b088978a8bb414ba37d7e10c53.zip', 'mingw-w64-v11.0.0', 16752516, 'zip', '/temp/', 0, '2023-10-09 10:47:04', NULL);
INSERT INTO `s_file_record` VALUES (274, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/212d9f277a9407819d46d044d63f8508.zip', 'codeium-1.2.77', 22678001, 'zip', '/temp/', 0, '2023-10-09 11:10:47', NULL);
INSERT INTO `s_file_record` VALUES (275, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/6b4f4b3913f831aca3daa850352910f1.png', 'card', 374170, 'png', '/temp/', 0, '2023-10-09 11:15:01', NULL);
INSERT INTO `s_file_record` VALUES (276, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/dd68cbf9772948036ac654162ab6262d.mp4', 'VID20230115110816', 13936568, 'mp4', '/temp/', 0, '2023-10-09 11:15:28', NULL);
INSERT INTO `s_file_record` VALUES (277, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/72d40981a636dcbeb0f9fb0751ce2d0d.zip', 'zh.232.172', 90754840, 'zip', '/temp/', 0, '2023-10-09 11:29:04', NULL);
INSERT INTO `s_file_record` VALUES (278, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/29ca9a17aeb497f5dd79f267649aaf71.iso', 'ubuntu-18.04.6-live-server-amd64', 1016070144, 'iso', '/temp/', 0, '2023-10-09 11:39:55', NULL);
INSERT INTO `s_file_record` VALUES (279, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/4ec176dfa9f470d77ff58bca0b18f072.rar', 'agreement', 415194259, 'rar', '/temp/', 0, '2023-10-09 12:26:50', NULL);
INSERT INTO `s_file_record` VALUES (280, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/a9c31e0719e34464e3820803d246548e.jpg', '52160128366307220761613884254858', 561463, 'jpg', '/temp/', 0, '2023-10-09 13:34:43', NULL);
INSERT INTO `s_file_record` VALUES (281, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/5739b76d7ad23701990a1110918ab1cb.jpg', '52160128366307220761613884638434', 835622, 'jpg', '/temp/', 0, '2023-10-09 13:35:23', NULL);
INSERT INTO `s_file_record` VALUES (282, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/848686a1da40e6e258f384d0e8350d5b.jpg', 'img-1619571666439b6fcae4683fed482a5d5f709e69ddec1', 44643, 'jpg', '/temp/', 0, '2023-10-09 13:39:12', NULL);
INSERT INTO `s_file_record` VALUES (283, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/eab1501175d69c69a51e03cfa2b94119.sql', 'u2_goods', 93321, 'sql', '/temp/', 0, '2023-10-09 16:36:14', NULL);
INSERT INTO `s_file_record` VALUES (284, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/63f358e6e17471c9dcdf0ea797dbd14d.sql', 'u2_system', 85319, 'sql', '/temp/', 0, '2023-10-09 16:36:48', NULL);
INSERT INTO `s_file_record` VALUES (285, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/7c4c7df2d048e15f1527909aa27b0ce4.xlsx', 'agreement-menu', 15704, 'xlsx', '/temp/', 0, '2023-10-09 17:47:43', NULL);
INSERT INTO `s_file_record` VALUES (286, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/d41d8cd98f00b204e9800998ecf8427e.docx', '1+1证明论文', 0, 'docx', '/temp/', 0, '2023-10-09 19:49:07', NULL);
INSERT INTO `s_file_record` VALUES (287, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/b0d0f1f3616fc6a53faaa6250ab9b123.jpg', 'basketball', 361330, 'jpg', '/temp/', 0, '2023-10-12 18:35:39', NULL);
INSERT INTO `s_file_record` VALUES (288, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/7bbf403ea8158f8c4e6965c614b3af78.jpg', 'running', 430276, 'jpg', '/temp/', 0, '2023-10-12 18:35:39', NULL);
INSERT INTO `s_file_record` VALUES (289, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/c1ed7a0afcdaacabac086e2de9da2f86.jpg', 'snow', 691494, 'jpg', '/temp/', 0, '2023-10-12 18:35:40', NULL);
INSERT INTO `s_file_record` VALUES (290, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/2880c7696ea256cf4efde0deec9d6664.jpg', 'study', 1183375, 'jpg', '/temp/', 0, '2023-10-12 18:35:50', NULL);
INSERT INTO `s_file_record` VALUES (291, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/1eb4f76ece833078096f49f088115cd1.jpg', 'escaperoom', 896081, 'jpg', '/temp/', 0, '2023-10-12 18:36:01', NULL);
INSERT INTO `s_file_record` VALUES (292, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/b7a9a9f1b412bcfd68eb91e0c0a52872.jpg', 'img-162114757828893d75071a62cbda00f5d9942915d5012', 137229, 'jpg', '/temp/', 0, '2023-10-19 21:26:18', NULL);
INSERT INTO `s_file_record` VALUES (293, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/ccd3a8c96c71d20cf9c1f37986f39199.jpg', 'img-162129724205613c5a2d1d9f20326da5d61534f374152', 185735, 'jpg', '/temp/', 0, '2023-10-19 21:26:19', NULL);
INSERT INTO `s_file_record` VALUES (294, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/bc3756ad6766f2443f0525c2a4fc5ac1.jpg', 'img-1621147582022dc73ebb2880194d7b39be07d65ac44c5', 176448, 'jpg', '/temp/', 0, '2023-10-19 21:26:22', NULL);
INSERT INTO `s_file_record` VALUES (295, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/7dc388c70dcf3fa93c1c54942dd8644f.jpg', 'img-1621149429867f9cc76d0d6f11696a045b12dac98713d', 185755, 'jpg', '/temp/', 0, '2023-10-19 21:26:23', NULL);
INSERT INTO `s_file_record` VALUES (296, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/d4bbffcc8f8c51724e597108d8df0bc8.jpg', 'img-1621297259083bc8a078a8b6abb7a402f00666e2749f1', 161949, 'jpg', '/temp/', 0, '2023-10-19 21:26:23', NULL);
INSERT INTO `s_file_record` VALUES (297, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/8d6713fb81d2ffd37709a61c27540205.jpg', 'img-16187904129577db561041d9c67baa9b8c2b075e09e4b', 264481, 'jpg', '/temp/', 0, '2023-10-20 17:45:34', NULL);
INSERT INTO `s_file_record` VALUES (298, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/7a8962f5b0be804d913d2a87df54eeae.jpg', 'img-16211475868861fed001dbdcca090522054ffd8b5dbe5', 224772, 'jpg', '/temp/', 0, '2023-10-20 17:45:35', NULL);
INSERT INTO `s_file_record` VALUES (299, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/e36b6a8178bb6acc56993f36433af58c.jpg', 'img-16211475907553ee8b77349240ed366980eae23b1afdf', 174678, 'jpg', '/temp/', 0, '2023-10-20 17:45:36', NULL);
INSERT INTO `s_file_record` VALUES (300, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/f343ef0206d61099e7734f2b7ae72f76.jpg', 'img-16211494262981ca3fa3994adf27c07862daeabe7e3d8', 157605, 'jpg', '/temp/', 0, '2023-10-20 17:45:37', NULL);
INSERT INTO `s_file_record` VALUES (301, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/52d5664fd9548135a8804c9d47e45387.jpg', 'img-1624000354781b99e710c54a15c73ee56e0871762fccd', 96940, 'jpg', '/temp/', 0, '2023-10-20 17:47:21', NULL);
INSERT INTO `s_file_record` VALUES (302, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/e7900c65b10258d272922071ab685805.jpg', 'img-1624101451565ac35805b3c704ee3af46da801c2da219', 66205, 'jpg', '/temp/', 0, '2023-10-20 17:47:22', NULL);
INSERT INTO `s_file_record` VALUES (303, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/e01a37c1bf8d71f7bdd56cce44e0dc12.jpg', 'img-1625828219285ae751241a032ef588ffc959567c7362d', 473444, 'jpg', '/temp/', 0, '2023-10-20 17:47:23', NULL);
INSERT INTO `s_file_record` VALUES (304, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/97a807aac6bdda5db35477b8cf479aab.jpg', 'img-1633866296344e14b287ff67a6162607b72358f39d8aa', 92458, 'jpg', '/temp/', 0, '2023-10-20 17:47:23', NULL);
INSERT INTO `s_file_record` VALUES (305, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/22adc95e272fbd96772f70d868e75844.mp4', ' 2021-11-07 20-02-15', 23491299, 'mp4', '/temp/', 0, '2023-10-20 18:10:05', NULL);
INSERT INTO `s_file_record` VALUES (306, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/a6db0d5c683da8a6c471b36ffbc02eb5.jpg', 'img-16364413270385db903928778508aaa2feccf6884c0ba', 266142, 'jpg', '/temp/', 0, '2023-10-20 18:15:07', NULL);
INSERT INTO `s_file_record` VALUES (307, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/b344e7e1ee704bead23ab14751a67f05.png', 'image', 371233, 'png', '/temp/', 0, '2023-10-25 10:25:43', NULL);
INSERT INTO `s_file_record` VALUES (308, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/8a443e3bc0b51955c8ef79d9c60f5c8b.png', '2y1dm9', 2955233, 'png', '/temp/', 0, '2023-10-25 14:57:53', NULL);
INSERT INTO `s_file_record` VALUES (309, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/baf441e2efd82afe53120362f390b1d2.jpg', '1 (1)', 11502506, 'jpg', '/temp/', 0, '2023-10-25 15:07:52', NULL);
INSERT INTO `s_file_record` VALUES (310, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/55bdd8787712fad698d9938a0b6be9aa.jpg', 'jy2', 1411528, 'jpg', '/temp/', 0, '2023-10-25 15:07:53', NULL);
INSERT INTO `s_file_record` VALUES (311, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/3bb5ad18d2bde21258374f1f34229b23.jpg', 'jy5', 1214670, 'jpg', '/temp/', 0, '2023-10-25 15:42:39', NULL);
INSERT INTO `s_file_record` VALUES (312, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/2fc6dcedd9a62c51b8bddcc4f545d270.jpg', 'admin', 779682, 'jpg', '/temp/', 0, '2023-10-25 15:47:39', NULL);
INSERT INTO `s_file_record` VALUES (313, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/df6ae405c0ec9dbf4bfc920fe178815d.jpg', 'jy1', 1134813, 'jpg', '/temp/', 0, '2023-10-25 16:27:37', NULL);
INSERT INTO `s_file_record` VALUES (314, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/66431a64e0e0c874c9b8e79846dc6305.jpg', 'wallhaven-4ywlzd', 909659, 'jpg', '/temp/', 0, '2023-10-25 16:29:55', NULL);
INSERT INTO `s_file_record` VALUES (315, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/1fdfc2b2945fdb7f78a94b81cb2c73e6.jpg', 'wallhaven-wy865r', 648418, 'jpg', '/temp/', 0, '2023-10-25 16:29:55', NULL);
INSERT INTO `s_file_record` VALUES (316, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/d006760c59a03787bb1f2b5d934dc118.mp4', '莎美拉', 174410174, 'mp4', '/temp/', 0, '2023-10-25 17:56:21', NULL);
INSERT INTO `s_file_record` VALUES (317, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/81715cfede0bbd902442a174d82e7162.jpg', '-97bd2425d24c034', 8578725, 'jpg', '/temp/', 0, '2023-10-25 18:09:05', NULL);
INSERT INTO `s_file_record` VALUES (318, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/3b2bab80b866f7d0b215913c36d03501.jpg', 'img-16364413220175c55910465a9548c3036cae48a834cfc', 353978, 'jpg', '/temp/', 0, '2023-10-25 19:44:25', NULL);
INSERT INTO `s_file_record` VALUES (319, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/1235feeed7bf35b90bc3026e21b19fc7.jpg', 'img-1624000338183d82b1d4211a6f72446f11a0e82e48471', 132312, 'jpg', '/temp/', 0, '2023-10-26 09:54:33', NULL);
INSERT INTO `s_file_record` VALUES (320, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/b12525f3e1cb7a55833d7f75d6c570d5.png', 'wallhaven-721z6o', 8773762, 'png', '/temp/', 0, '2023-10-26 10:04:36', NULL);
INSERT INTO `s_file_record` VALUES (321, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/8763f6a06c5477309aeda8bfccefc476.jpg', 'QQ图片20210628212243', 162971, 'jpg', '/temp/', 0, '2023-10-26 15:19:58', NULL);
INSERT INTO `s_file_record` VALUES (322, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/bba3ffca389e762a3d8fea92af036855.jpg', 'wallhaven-j853dy', 3409320, 'jpg', '/temp/', 0, '2023-10-26 15:20:39', NULL);
INSERT INTO `s_file_record` VALUES (323, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/e5435710b250b5cf697d33f2fe762aa5.jpg', 'img-162089668127842a5a6a7a04f6d86b6a394397f5bb820', 62929, 'jpg', '/temp/', 0, '2023-10-26 15:23:45', NULL);
INSERT INTO `s_file_record` VALUES (324, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/c4bae457a96b04c47fba6ddf9116f4b3.jpg', 'wallhaven-zyxz9v', 2315780, 'jpg', '/temp/', 0, '2023-10-26 15:30:26', NULL);
INSERT INTO `s_file_record` VALUES (325, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/24b94d82e4021a5cd63a582558528a2a.png', 'image', 817603, 'png', '/temp/', 0, '2023-10-31 21:59:18', NULL);
INSERT INTO `s_file_record` VALUES (326, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/c7c5d0d542424de085a56a5a06364594.png', 'image', 1741581, 'png', '/temp/', 0, '2023-10-31 21:59:36', NULL);
INSERT INTO `s_file_record` VALUES (327, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/b02081a93f7eb6d603fa20721a7ccc5b.jpg', 'Camera Roll339C44566AEDB43FADE7E4F44C6485E0', 683883, 'jpg', '/temp/', 0, '2023-10-31 21:59:45', NULL);
INSERT INTO `s_file_record` VALUES (328, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/4d02b5c1b7afc86625b952eaed791490.jpg', 'Camera RollPictureUnlock_s_159687.pictureunlock', 654096, 'jpg', '/temp/', 0, '2023-10-31 22:00:07', NULL);
INSERT INTO `s_file_record` VALUES (329, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/f5de57c28854749348edaabed6c583e7.jpg', 'Camera Rollimg-16154173200251a8562a6e744bf3a9e450840430f977a', 245238, 'jpg', '/temp/', 0, '2023-10-31 22:00:24', NULL);
INSERT INTO `s_file_record` VALUES (330, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/temp/b5729c5177c509ea003216683a689a94.png', 'wallhaven-k91r6m', 6734451, 'png', '/temp/', 0, '2023-10-31 22:01:53', NULL);

-- ----------------------------
-- Table structure for s_menu
-- ----------------------------
DROP TABLE IF EXISTS `s_menu`;
CREATE TABLE `s_menu`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` int(0) NOT NULL DEFAULT 0 COMMENT '父菜单id (paren_id为0且type为M则是一级菜单)',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限类型 (M目录 C菜单 B按钮)',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由地址',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `component` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单组件',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '权限标识',
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否隐藏 (0否 1是)',
  `is_disable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用 (0否 1是)',
  `order_num` int(0) NOT NULL DEFAULT 1 COMMENT '排序',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 275 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_menu
-- ----------------------------
INSERT INTO `s_menu` VALUES (1, 0, 'M', '记录管理', 'record', 'record', NULL, NULL, 0, 0, 1, '2023-04-20 13:38:58', '2023-04-22 14:43:15');
INSERT INTO `s_menu` VALUES (2, 0, 'M', '题目管理', 'quiz', 'quiz', NULL, NULL, 0, 0, 2, '2023-04-20 13:38:58', '2023-04-22 14:42:46');
INSERT INTO `s_menu` VALUES (3, 0, 'M', '约起管理', 'agreement', 'agreement', NULL, NULL, 0, 0, 3, '2023-04-20 13:38:58', '2023-04-22 14:41:34');
INSERT INTO `s_menu` VALUES (4, 0, 'M', '系统管理', 'system', 'system', NULL, NULL, 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (5, 0, 'M', '日志管理', 'log', 'log', NULL, NULL, 0, 0, 5, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (6, 0, 'M', '网站管理', 'web', 'international', NULL, NULL, 0, 0, 6, '2023-04-20 13:38:58', '2023-04-22 14:44:29');
INSERT INTO `s_menu` VALUES (7, 0, 'M', '系统监控', 'monitor', 'monitor', NULL, NULL, 0, 0, 7, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (11, 1, 'C', '发表记录', 'write', 'edit', '/agree/record/write', 'agree:record:list', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (12, 1, 'C', '记录列表', 'list', 'chart', '/agree/record/list', 'agree:record:list', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (13, 1, 'C', '记录标签', 'tag', 'tag', '/agree/record/tag', 'agree:tag:list', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (14, 1, 'C', '编辑记录', 'writer/:recordId', 'edit', '/agree/record/write', 'agree:record:list', 1, 0, 4, '2023-04-25 15:40:11', '2023-04-25 15:41:07');
INSERT INTO `s_menu` VALUES (16, 2, 'C', '题目列表', 'list', 'chart', '/agree/quiz/list', 'agree:quiz:list', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (17, 2, 'C', '题目标签', 'tag', 'tag', '/agree/quiz/tag', 'agree:tag:list', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (21, 3, 'C', '约会管理', 'appointment', 'appointment', '/agree/appointment/index', 'agree:agreement:list', 0, 0, 1, '2023-04-20 13:38:58', '2023-04-22 14:41:42');
INSERT INTO `s_menu` VALUES (22, 3, 'C', '活动管理', 'activity', 'activity', '/agree/activity/index', 'agree:agreement:list', 0, 0, 2, '2023-04-20 13:38:58', '2023-04-22 14:41:50');
INSERT INTO `s_menu` VALUES (23, 3, 'C', '赛事管理', 'competition', 'competition', '/agree/competition/index', 'agree:agreement:list', 0, 0, 3, '2023-04-20 13:38:58', '2023-04-22 14:42:00');
INSERT INTO `s_menu` VALUES (24, 3, 'C', '帮助管理', 'help', 'help', '/agree/help/index', 'agree:agreement:list', 0, 0, 4, '2023-04-20 13:38:58', '2023-04-22 14:42:21');
INSERT INTO `s_menu` VALUES (26, 4, 'C', '菜单管理', 'menu', 'tree-table', '/system/menu/index', 'system:menu:list', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (27, 4, 'C', '角色管理', 'role', 'peoples', '/system/role/index', 'system:role:list', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (28, 4, 'C', '管理员管理', 'admin', 'user', '/system/admin/index', 'system:admin:list', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (29, 4, 'C', '文件管理', 'file', 'file', '/system/file/index', 'system:file:list', 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (31, 5, 'C', '操作日志', 'operation', 'form', '/system/log/operation', 'log:operation:list', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (32, 5, 'C', '异常日志', 'exception', 'bug', '/system/log/exception', 'log:exception:list', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (33, 5, 'C', '访问日志', 'visit', 'logininfor', '/system/log/visit', 'log:visit:list', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (34, 5, 'C', '任务日志', 'task', 'job', '/system/log/task', 'log:task:list', 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (36, 6, 'C', '用户管理', 'user', 'user', '/web/user/index', 'web:user:list', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (37, 6, 'C', '评论管理', 'comment', 'comment', '/web/comment/index', 'web:comment:list', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (38, 6, 'C', '反馈管理', 'feedback', 'form', '/web/feedback/index', 'web:feedback:list', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (39, 6, 'C', '网站配置', 'site', 'example', '/web/site/index', 'web:site:list', 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (41, 7, 'C', '在线人员', 'online', 'online', '/monitor/online/index', 'monitor:online:list', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (42, 7, 'C', '定时任务', 'task', 'job', '/monitor/task/index', 'monitor:task:list', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (101, 12, 'B', '添加记录', NULL, NULL, NULL, 'agree:record:add', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (102, 12, 'B', '物理删除记录', NULL, NULL, NULL, 'agree:record:delete', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (103, 12, 'B', '逻辑删除记录', NULL, NULL, NULL, 'agree:record:recycle', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (104, 12, 'B', '更新记录', NULL, NULL, NULL, 'agree:record:update', 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (105, 12, 'B', '编辑记录', NULL, NULL, NULL, 'agree:record:info', 0, 0, 5, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (106, 12, 'B', '上传记录图片', NULL, NULL, NULL, 'agree:record:upload', 0, 0, 6, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (107, 12, 'B', '上传记录视频', NULL, NULL, NULL, 'agree:record:upload', 0, 0, 7, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (108, 12, 'B', '置顶记录', NULL, NULL, NULL, 'agree:record:top', 0, 0, 8, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (109, 12, 'B', '推荐记录', NULL, NULL, NULL, 'agree:record:recommend', 0, 0, 9, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (111, 13, 'B', '添加标签', NULL, NULL, NULL, 'agree:tag:add', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (112, 13, 'B', '删除标签', NULL, NULL, NULL, 'agree:tag:delete', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (113, 13, 'B', '修改标签', NULL, NULL, NULL, 'agree:tag:update', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (121, 16, 'B', '添加题目', NULL, NULL, NULL, 'agree:quiz:add', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (122, 16, 'B', '删除题目', NULL, NULL, NULL, 'agree:quiz:delete', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (123, 16, 'B', '更新题目', NULL, NULL, NULL, 'agree:quiz:update', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (124, 16, 'B', '编辑题目', NULL, NULL, NULL, 'agree:quiz:info', 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (125, 16, 'B', '上传题目图片', NULL, NULL, NULL, 'agree:quiz:upload', 0, 0, 5, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (131, 17, 'B', '添加标签', NULL, NULL, NULL, 'agree:tag:add', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (132, 17, 'B', '删除标签', NULL, NULL, NULL, 'agree:tag:delete', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (133, 17, 'B', '修改标签', NULL, NULL, NULL, 'agree:tag:update', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (141, 21, 'B', '添加约会', NULL, NULL, NULL, 'agree:agreement:add', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (142, 21, 'B', '删除约会', NULL, NULL, NULL, 'agree:agreement:delete', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (143, 21, 'B', '更新约会', NULL, NULL, NULL, 'agree:agreement:update', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (144, 21, 'B', '编辑约会', NULL, NULL, NULL, 'agree:agreement:info', 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (151, 22, 'B', '添加活动', NULL, NULL, NULL, 'agree:agreement:add', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (152, 22, 'B', '删除活动', NULL, NULL, NULL, 'agree:agreement:delete', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (153, 22, 'B', '更新活动', NULL, NULL, NULL, 'agree:agreement:update', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (154, 22, 'B', '编辑活动', NULL, NULL, NULL, 'agree:agreement:info', 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (161, 23, 'B', '添加赛事', NULL, NULL, NULL, 'agree:agreement:add', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (162, 23, 'B', '删除赛事', NULL, NULL, NULL, 'agree:agreement:delete', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (163, 23, 'B', '更新赛事', NULL, NULL, NULL, 'agree:agreement:update', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (164, 23, 'B', '编辑赛事', NULL, NULL, NULL, 'agree:agreement:info', 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (171, 24, 'B', '添加帮助', NULL, NULL, NULL, 'agree:agreement:add', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (172, 24, 'B', '删除帮助', NULL, NULL, NULL, 'agree:agreement:delete', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (173, 24, 'B', '更新帮助', NULL, NULL, NULL, 'agree:agreement:update', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (174, 24, 'B', '编辑帮助', NULL, NULL, NULL, 'agree:agreement:info', 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (181, 26, 'B', '添加菜单', NULL, NULL, NULL, 'system:menu:add', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (182, 26, 'B', '删除菜单', NULL, NULL, NULL, 'system:menu:delete', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (183, 26, 'B', '修改菜单', NULL, NULL, NULL, 'system:menu:update', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (184, 26, 'B', '编辑菜单', NULL, NULL, NULL, 'system:menu:info', 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (191, 27, 'B', '添加角色', NULL, NULL, NULL, 'system:role:add', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (192, 27, 'B', '删除角色', NULL, NULL, NULL, 'system:role:delete', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (193, 27, 'B', '修改角色', NULL, NULL, NULL, 'system:role:update', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (194, 27, 'B', '修改角色状态', NULL, NULL, NULL, 'system:role:status', 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (201, 28, 'B', '修改管理员', NULL, NULL, NULL, 'system:admin:update', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (202, 28, 'B', '修改管理员状态', NULL, NULL, NULL, 'system:admin:status', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (203, 28, 'B', '修改管理员邮箱', NULL, NULL, NULL, 'admin:email:update', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (204, 28, 'B', '修改管理员头像', NULL, NULL, NULL, 'admin:avatar:update', 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (205, 28, 'B', '修改管理员信息', NULL, NULL, NULL, 'admin:info:update', 0, 0, 5, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (206, 28, 'B', '修改管理员密码', NULL, NULL, NULL, 'admin:password:update', 0, 0, 6, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (210, 29, 'B', '上传文件', NULL, NULL, NULL, 'system:file:upload', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (211, 29, 'B', '新建文件夹', NULL, NULL, NULL, 'system:file:folder', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (212, 29, 'B', '删除文件', NULL, NULL, NULL, 'system:file:delete', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (221, 31, 'B', '删除操作日志', NULL, NULL, NULL, 'log:operation:delete', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (226, 32, 'B', '删除异常日志', NULL, NULL, NULL, 'log:exception:delete', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (231, 33, 'B', '删除访问日志', NULL, NULL, NULL, 'log:visit:delete', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (236, 34, 'B', '删除任务日志', NULL, NULL, NULL, 'log:task:delete', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (237, 34, 'B', '清空任务日志', NULL, NULL, NULL, 'log:task:clear', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (241, 36, 'B', '修改用户', NULL, NULL, NULL, 'web:user:update', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (242, 36, 'B', '修改用户状态', NULL, NULL, NULL, 'web:user:status', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (246, 36, 'B', '修改用户密码', NULL, NULL, NULL, 'web:user:password', 0, 0, 6, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (251, 37, 'B', '添加评论', NULL, NULL, NULL, 'web:comment:add', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (252, 37, 'B', '删除评论', NULL, NULL, NULL, 'web:comment:delete', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (253, 37, 'B', '审核评论', NULL, NULL, NULL, 'web:comment:pass', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (254, 37, 'B', '点赞评论', NULL, NULL, NULL, 'web:comment:like', 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (256, 38, 'B', '删除反馈', NULL, NULL, NULL, 'web:feedback:delete', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (257, 38, 'B', '审核反馈', NULL, NULL, NULL, 'web:feedback:pass', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (261, 39, 'B', '修改网站配置', NULL, NULL, NULL, 'web:site:update', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (262, 39, 'B', '上传网站配置图片', NULL, NULL, NULL, 'web:site:upload', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (266, 41, 'B', '下线管理员', NULL, NULL, NULL, 'monitor:online:kick', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (267, 41, 'B', '下线用户', NULL, NULL, NULL, 'monitor:online:kick', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (271, 42, 'B', '添加任务', NULL, NULL, NULL, 'monitor:task:add', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (272, 42, 'B', '修改任务', NULL, NULL, NULL, 'monitor:task:update', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (273, 42, 'B', '删除任务', NULL, NULL, NULL, 'monitor:task:delete', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (274, 42, 'B', '修改任务状态', NULL, NULL, NULL, 'monitor:task:status', 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `s_menu` VALUES (275, 42, 'B', '运行任务', NULL, NULL, NULL, 'monitor:task:run', 0, 0, 5, '2023-04-20 13:38:58', NULL);

-- ----------------------------
-- Table structure for s_role
-- ----------------------------
DROP TABLE IF EXISTS `s_role`;
CREATE TABLE `s_role`  (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id(标识)',
  `role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色描述',
  `is_disable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用 (0否 1是)',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_role
-- ----------------------------
INSERT INTO `s_role` VALUES ('1', 'vhans', '超级管理员', 0, '2022-11-03 17:41:57', '2023-03-10 23:12:59');
INSERT INTO `s_role` VALUES ('2', 'test', '测试账号', 0, '2022-11-03 17:42:31', '2023-04-25 23:33:30');
INSERT INTO `s_role` VALUES ('3', 'admin', '普通管理员,拥有数据cru权限,部分重要权限阉割', 0, '2023-05-04 14:06:58', '2023-09-01 09:38:31');

-- ----------------------------
-- Table structure for s_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `s_role_menu`;
CREATE TABLE `s_role_menu`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色id(标识)',
  `menu_id` int(0) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 472 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_role_menu
-- ----------------------------
INSERT INTO `s_role_menu` VALUES (1, '1', 1);
INSERT INTO `s_role_menu` VALUES (2, '1', 2);
INSERT INTO `s_role_menu` VALUES (3, '1', 3);
INSERT INTO `s_role_menu` VALUES (4, '1', 4);
INSERT INTO `s_role_menu` VALUES (5, '1', 5);
INSERT INTO `s_role_menu` VALUES (6, '1', 6);
INSERT INTO `s_role_menu` VALUES (7, '1', 7);
INSERT INTO `s_role_menu` VALUES (8, '1', 11);
INSERT INTO `s_role_menu` VALUES (9, '1', 12);
INSERT INTO `s_role_menu` VALUES (10, '1', 13);
INSERT INTO `s_role_menu` VALUES (11, '1', 14);
INSERT INTO `s_role_menu` VALUES (12, '1', 16);
INSERT INTO `s_role_menu` VALUES (13, '1', 17);
INSERT INTO `s_role_menu` VALUES (14, '1', 21);
INSERT INTO `s_role_menu` VALUES (15, '1', 22);
INSERT INTO `s_role_menu` VALUES (16, '1', 23);
INSERT INTO `s_role_menu` VALUES (17, '1', 24);
INSERT INTO `s_role_menu` VALUES (18, '1', 26);
INSERT INTO `s_role_menu` VALUES (19, '1', 27);
INSERT INTO `s_role_menu` VALUES (20, '1', 28);
INSERT INTO `s_role_menu` VALUES (21, '1', 29);
INSERT INTO `s_role_menu` VALUES (22, '1', 31);
INSERT INTO `s_role_menu` VALUES (23, '1', 32);
INSERT INTO `s_role_menu` VALUES (24, '1', 33);
INSERT INTO `s_role_menu` VALUES (25, '1', 34);
INSERT INTO `s_role_menu` VALUES (26, '1', 36);
INSERT INTO `s_role_menu` VALUES (27, '1', 37);
INSERT INTO `s_role_menu` VALUES (28, '1', 38);
INSERT INTO `s_role_menu` VALUES (29, '1', 39);
INSERT INTO `s_role_menu` VALUES (30, '1', 41);
INSERT INTO `s_role_menu` VALUES (31, '1', 42);
INSERT INTO `s_role_menu` VALUES (32, '1', 101);
INSERT INTO `s_role_menu` VALUES (33, '1', 102);
INSERT INTO `s_role_menu` VALUES (34, '1', 103);
INSERT INTO `s_role_menu` VALUES (35, '1', 104);
INSERT INTO `s_role_menu` VALUES (36, '1', 105);
INSERT INTO `s_role_menu` VALUES (37, '1', 106);
INSERT INTO `s_role_menu` VALUES (38, '1', 107);
INSERT INTO `s_role_menu` VALUES (39, '1', 108);
INSERT INTO `s_role_menu` VALUES (40, '1', 109);
INSERT INTO `s_role_menu` VALUES (41, '1', 111);
INSERT INTO `s_role_menu` VALUES (42, '1', 112);
INSERT INTO `s_role_menu` VALUES (43, '1', 113);
INSERT INTO `s_role_menu` VALUES (44, '1', 121);
INSERT INTO `s_role_menu` VALUES (45, '1', 122);
INSERT INTO `s_role_menu` VALUES (46, '1', 123);
INSERT INTO `s_role_menu` VALUES (47, '1', 124);
INSERT INTO `s_role_menu` VALUES (48, '1', 125);
INSERT INTO `s_role_menu` VALUES (49, '1', 131);
INSERT INTO `s_role_menu` VALUES (50, '1', 132);
INSERT INTO `s_role_menu` VALUES (51, '1', 133);
INSERT INTO `s_role_menu` VALUES (52, '1', 141);
INSERT INTO `s_role_menu` VALUES (53, '1', 142);
INSERT INTO `s_role_menu` VALUES (54, '1', 143);
INSERT INTO `s_role_menu` VALUES (55, '1', 144);
INSERT INTO `s_role_menu` VALUES (56, '1', 151);
INSERT INTO `s_role_menu` VALUES (57, '1', 152);
INSERT INTO `s_role_menu` VALUES (58, '1', 153);
INSERT INTO `s_role_menu` VALUES (59, '1', 154);
INSERT INTO `s_role_menu` VALUES (60, '1', 161);
INSERT INTO `s_role_menu` VALUES (61, '1', 162);
INSERT INTO `s_role_menu` VALUES (62, '1', 163);
INSERT INTO `s_role_menu` VALUES (63, '1', 164);
INSERT INTO `s_role_menu` VALUES (64, '1', 171);
INSERT INTO `s_role_menu` VALUES (65, '1', 172);
INSERT INTO `s_role_menu` VALUES (66, '1', 173);
INSERT INTO `s_role_menu` VALUES (67, '1', 174);
INSERT INTO `s_role_menu` VALUES (68, '1', 181);
INSERT INTO `s_role_menu` VALUES (69, '1', 182);
INSERT INTO `s_role_menu` VALUES (70, '1', 183);
INSERT INTO `s_role_menu` VALUES (71, '1', 184);
INSERT INTO `s_role_menu` VALUES (72, '1', 191);
INSERT INTO `s_role_menu` VALUES (73, '1', 192);
INSERT INTO `s_role_menu` VALUES (74, '1', 193);
INSERT INTO `s_role_menu` VALUES (75, '1', 194);
INSERT INTO `s_role_menu` VALUES (76, '1', 201);
INSERT INTO `s_role_menu` VALUES (77, '1', 202);
INSERT INTO `s_role_menu` VALUES (78, '1', 203);
INSERT INTO `s_role_menu` VALUES (79, '1', 204);
INSERT INTO `s_role_menu` VALUES (80, '1', 205);
INSERT INTO `s_role_menu` VALUES (81, '1', 206);
INSERT INTO `s_role_menu` VALUES (82, '1', 210);
INSERT INTO `s_role_menu` VALUES (83, '1', 211);
INSERT INTO `s_role_menu` VALUES (84, '1', 212);
INSERT INTO `s_role_menu` VALUES (85, '1', 221);
INSERT INTO `s_role_menu` VALUES (86, '1', 226);
INSERT INTO `s_role_menu` VALUES (87, '1', 231);
INSERT INTO `s_role_menu` VALUES (88, '1', 231);
INSERT INTO `s_role_menu` VALUES (89, '1', 232);
INSERT INTO `s_role_menu` VALUES (90, '1', 236);
INSERT INTO `s_role_menu` VALUES (91, '1', 236);
INSERT INTO `s_role_menu` VALUES (92, '1', 237);
INSERT INTO `s_role_menu` VALUES (93, '1', 237);
INSERT INTO `s_role_menu` VALUES (94, '1', 241);
INSERT INTO `s_role_menu` VALUES (95, '1', 241);
INSERT INTO `s_role_menu` VALUES (96, '1', 242);
INSERT INTO `s_role_menu` VALUES (97, '1', 242);
INSERT INTO `s_role_menu` VALUES (98, '1', 243);
INSERT INTO `s_role_menu` VALUES (99, '1', 244);
INSERT INTO `s_role_menu` VALUES (100, '1', 245);
INSERT INTO `s_role_menu` VALUES (101, '1', 246);
INSERT INTO `s_role_menu` VALUES (102, '1', 251);
INSERT INTO `s_role_menu` VALUES (103, '1', 252);
INSERT INTO `s_role_menu` VALUES (104, '1', 253);
INSERT INTO `s_role_menu` VALUES (105, '1', 254);
INSERT INTO `s_role_menu` VALUES (106, '1', 256);
INSERT INTO `s_role_menu` VALUES (107, '1', 257);
INSERT INTO `s_role_menu` VALUES (108, '1', 261);
INSERT INTO `s_role_menu` VALUES (109, '1', 262);
INSERT INTO `s_role_menu` VALUES (110, '1', 266);
INSERT INTO `s_role_menu` VALUES (111, '1', 267);
INSERT INTO `s_role_menu` VALUES (112, '1', 271);
INSERT INTO `s_role_menu` VALUES (113, '1', 272);
INSERT INTO `s_role_menu` VALUES (114, '1', 273);
INSERT INTO `s_role_menu` VALUES (115, '1', 274);
INSERT INTO `s_role_menu` VALUES (116, '1', 275);
INSERT INTO `s_role_menu` VALUES (200, '2', 1);
INSERT INTO `s_role_menu` VALUES (201, '2', 12);
INSERT INTO `s_role_menu` VALUES (202, '2', 101);
INSERT INTO `s_role_menu` VALUES (203, '2', 102);
INSERT INTO `s_role_menu` VALUES (204, '2', 103);
INSERT INTO `s_role_menu` VALUES (205, '2', 104);
INSERT INTO `s_role_menu` VALUES (206, '2', 105);
INSERT INTO `s_role_menu` VALUES (207, '2', 106);
INSERT INTO `s_role_menu` VALUES (208, '2', 107);
INSERT INTO `s_role_menu` VALUES (209, '2', 108);
INSERT INTO `s_role_menu` VALUES (210, '2', 109);
INSERT INTO `s_role_menu` VALUES (211, '2', 13);
INSERT INTO `s_role_menu` VALUES (212, '2', 111);
INSERT INTO `s_role_menu` VALUES (213, '2', 112);
INSERT INTO `s_role_menu` VALUES (214, '2', 113);
INSERT INTO `s_role_menu` VALUES (215, '2', 14);
INSERT INTO `s_role_menu` VALUES (216, '2', 2);
INSERT INTO `s_role_menu` VALUES (217, '2', 17);
INSERT INTO `s_role_menu` VALUES (218, '2', 18);
INSERT INTO `s_role_menu` VALUES (219, '2', 19);
INSERT INTO `s_role_menu` VALUES (220, '2', 3);
INSERT INTO `s_role_menu` VALUES (221, '2', 21);
INSERT INTO `s_role_menu` VALUES (222, '2', 144);
INSERT INTO `s_role_menu` VALUES (223, '2', 22);
INSERT INTO `s_role_menu` VALUES (224, '2', 154);
INSERT INTO `s_role_menu` VALUES (225, '2', 23);
INSERT INTO `s_role_menu` VALUES (226, '2', 164);
INSERT INTO `s_role_menu` VALUES (227, '2', 24);
INSERT INTO `s_role_menu` VALUES (228, '2', 174);
INSERT INTO `s_role_menu` VALUES (229, '2', 4);
INSERT INTO `s_role_menu` VALUES (230, '2', 26);
INSERT INTO `s_role_menu` VALUES (231, '2', 184);
INSERT INTO `s_role_menu` VALUES (232, '2', 27);
INSERT INTO `s_role_menu` VALUES (233, '2', 28);
INSERT INTO `s_role_menu` VALUES (234, '2', 205);
INSERT INTO `s_role_menu` VALUES (235, '2', 29);
INSERT INTO `s_role_menu` VALUES (236, '2', 5);
INSERT INTO `s_role_menu` VALUES (237, '2', 31);
INSERT INTO `s_role_menu` VALUES (238, '2', 32);
INSERT INTO `s_role_menu` VALUES (239, '2', 33);
INSERT INTO `s_role_menu` VALUES (240, '2', 34);
INSERT INTO `s_role_menu` VALUES (241, '2', 6);
INSERT INTO `s_role_menu` VALUES (242, '2', 36);
INSERT INTO `s_role_menu` VALUES (243, '2', 37);
INSERT INTO `s_role_menu` VALUES (244, '2', 38);
INSERT INTO `s_role_menu` VALUES (245, '2', 39);
INSERT INTO `s_role_menu` VALUES (246, '2', 7);
INSERT INTO `s_role_menu` VALUES (247, '2', 41);
INSERT INTO `s_role_menu` VALUES (248, '2', 42);
INSERT INTO `s_role_menu` VALUES (400, '3', 1);
INSERT INTO `s_role_menu` VALUES (401, '3', 11);
INSERT INTO `s_role_menu` VALUES (402, '3', 12);
INSERT INTO `s_role_menu` VALUES (403, '3', 101);
INSERT INTO `s_role_menu` VALUES (404, '3', 103);
INSERT INTO `s_role_menu` VALUES (405, '3', 104);
INSERT INTO `s_role_menu` VALUES (406, '3', 105);
INSERT INTO `s_role_menu` VALUES (407, '3', 106);
INSERT INTO `s_role_menu` VALUES (408, '3', 107);
INSERT INTO `s_role_menu` VALUES (409, '3', 108);
INSERT INTO `s_role_menu` VALUES (410, '3', 109);
INSERT INTO `s_role_menu` VALUES (411, '3', 13);
INSERT INTO `s_role_menu` VALUES (412, '3', 111);
INSERT INTO `s_role_menu` VALUES (413, '3', 113);
INSERT INTO `s_role_menu` VALUES (414, '3', 14);
INSERT INTO `s_role_menu` VALUES (415, '3', 2);
INSERT INTO `s_role_menu` VALUES (416, '3', 16);
INSERT INTO `s_role_menu` VALUES (417, '3', 121);
INSERT INTO `s_role_menu` VALUES (418, '3', 123);
INSERT INTO `s_role_menu` VALUES (419, '3', 124);
INSERT INTO `s_role_menu` VALUES (420, '3', 125);
INSERT INTO `s_role_menu` VALUES (421, '3', 17);
INSERT INTO `s_role_menu` VALUES (422, '3', 131);
INSERT INTO `s_role_menu` VALUES (423, '3', 133);
INSERT INTO `s_role_menu` VALUES (424, '3', 3);
INSERT INTO `s_role_menu` VALUES (425, '3', 21);
INSERT INTO `s_role_menu` VALUES (426, '3', 141);
INSERT INTO `s_role_menu` VALUES (427, '3', 143);
INSERT INTO `s_role_menu` VALUES (428, '3', 144);
INSERT INTO `s_role_menu` VALUES (429, '3', 22);
INSERT INTO `s_role_menu` VALUES (430, '3', 151);
INSERT INTO `s_role_menu` VALUES (431, '3', 153);
INSERT INTO `s_role_menu` VALUES (432, '3', 154);
INSERT INTO `s_role_menu` VALUES (433, '3', 23);
INSERT INTO `s_role_menu` VALUES (434, '3', 161);
INSERT INTO `s_role_menu` VALUES (435, '3', 163);
INSERT INTO `s_role_menu` VALUES (436, '3', 164);
INSERT INTO `s_role_menu` VALUES (437, '3', 24);
INSERT INTO `s_role_menu` VALUES (438, '3', 171);
INSERT INTO `s_role_menu` VALUES (439, '3', 173);
INSERT INTO `s_role_menu` VALUES (440, '3', 174);
INSERT INTO `s_role_menu` VALUES (441, '3', 4);
INSERT INTO `s_role_menu` VALUES (442, '3', 26);
INSERT INTO `s_role_menu` VALUES (443, '3', 181);
INSERT INTO `s_role_menu` VALUES (444, '3', 183);
INSERT INTO `s_role_menu` VALUES (445, '3', 184);
INSERT INTO `s_role_menu` VALUES (446, '3', 28);
INSERT INTO `s_role_menu` VALUES (447, '3', 203);
INSERT INTO `s_role_menu` VALUES (448, '3', 204);
INSERT INTO `s_role_menu` VALUES (449, '3', 205);
INSERT INTO `s_role_menu` VALUES (450, '3', 5);
INSERT INTO `s_role_menu` VALUES (451, '3', 31);
INSERT INTO `s_role_menu` VALUES (452, '3', 221);
INSERT INTO `s_role_menu` VALUES (453, '3', 32);
INSERT INTO `s_role_menu` VALUES (454, '3', 226);
INSERT INTO `s_role_menu` VALUES (455, '3', 33);
INSERT INTO `s_role_menu` VALUES (456, '3', 34);
INSERT INTO `s_role_menu` VALUES (457, '3', 6);
INSERT INTO `s_role_menu` VALUES (458, '3', 36);
INSERT INTO `s_role_menu` VALUES (459, '3', 246);
INSERT INTO `s_role_menu` VALUES (460, '3', 37);
INSERT INTO `s_role_menu` VALUES (461, '3', 251);
INSERT INTO `s_role_menu` VALUES (462, '3', 253);
INSERT INTO `s_role_menu` VALUES (463, '3', 254);
INSERT INTO `s_role_menu` VALUES (464, '3', 231);
INSERT INTO `s_role_menu` VALUES (465, '3', 7);
INSERT INTO `s_role_menu` VALUES (466, '3', 236);
INSERT INTO `s_role_menu` VALUES (467, '3', 237);
INSERT INTO `s_role_menu` VALUES (468, '3', 42);
INSERT INTO `s_role_menu` VALUES (469, '3', 241);
INSERT INTO `s_role_menu` VALUES (470, '3', 242);
INSERT INTO `s_role_menu` VALUES (471, '3', 244);
INSERT INTO `s_role_menu` VALUES (472, '3', 245);

-- ----------------------------
-- Table structure for u_user
-- ----------------------------
DROP TABLE IF EXISTS `u_user`;
CREATE TABLE `u_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户密码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '头像',
  `intro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '个人简介',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '邮箱',
  `degree` int(0) NULL DEFAULT 0 COMMENT '活动参与度',
  `grade` int(0) NULL DEFAULT 0 COMMENT '解疑等级',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录ip',
  `ip_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地址',
  `login_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '登录方式 (1邮箱 2QQ 3Gitee 4Github)',
  `is_disable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用 (0否 1是)',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '登录时间',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of u_user
-- ----------------------------
INSERT INTO `u_user` VALUES (1, 'V函数', 'vhans', '93988fed14da0c1b1865753a17918f51014b7363dc21aadb2b1391f17e4a5226', 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/vhans.jpg', '风度翩翩，人见人爱，花见花开，车见车载，宇宙无敌霹雳最最最帅气美男子，欢迎小姐姐通过各种手段加本人微信，通通通过，机不可失，失不再来。', '2873585297@qq.com', 100018, 99999, '192.168.44.1', '内网IP|内网IP', 1, 0, '2023-11-01 19:35:46', '2023-04-10 21:45:48', '2023-11-01 19:35:46');
INSERT INTO `u_user` VALUES (2, '测试账号', 'itest', '93988fed14da0c1b1865753a17918f51014b7363dc21aadb2b1391f17e4a5226', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/avatar/d86855a693b9c73c185bc677554ea60a.jpeg', '我是测试者', '2873585297@qq.com', 10006, 9999, '192.168.44.1', '内网IP|内网IP', 1, 0, '2023-11-01 17:34:10', '2023-05-19 11:00:22', '2023-11-01 17:34:10');
INSERT INTO `u_user` VALUES (3, '内测账号', 'interior', '93988fed14da0c1b1865753a17918f51014b7363dc21aadb2b1391f17e4a5226', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/record/image/3343e13d2426e268352fb80b51bf7113.jpg', '我是内测人员', '2873585297@qq.com', 9999, 9999, '192.168.244.1', '内网IP|内网IP', 1, 0, '2023-08-02 12:46:30', '2023-05-19 11:00:22', '2023-08-02 12:46:30');

-- ----------------------------
-- Table structure for u_user_agree
-- ----------------------------
DROP TABLE IF EXISTS `u_user_agree`;
CREATE TABLE `u_user_agree`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `agree_id` int(0) NOT NULL COMMENT '约起id',
  `user_id` int(0) NOT NULL COMMENT '用户id',
  `type` tinyint(1) NOT NULL COMMENT '约起类型(1约会 2活动 3赛事 4帮忙)',
  `limit_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '限定类型(0普通 1唯一 2观众)',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '约会状态(0无 1应约 2拒绝)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of u_user_agree
-- ----------------------------
INSERT INTO `u_user_agree` VALUES (1, 1, 3, 1, 0, 0);
INSERT INTO `u_user_agree` VALUES (2, 2, 2, 1, 0, 0);
INSERT INTO `u_user_agree` VALUES (3, 7, 2, 1, 1, 1);

-- ----------------------------
-- Table structure for u_user_collect
-- ----------------------------
DROP TABLE IF EXISTS `u_user_collect`;
CREATE TABLE `u_user_collect`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(0) NOT NULL COMMENT '用户id',
  `type` tinyint(1) NOT NULL COMMENT '收藏类型(1记录 2题目)',
  `type_id` int(0) NOT NULL COMMENT '类型id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of u_user_collect
-- ----------------------------
INSERT INTO `u_user_collect` VALUES (4, 1, 1, 13);
INSERT INTO `u_user_collect` VALUES (8, 1, 1, 46);
INSERT INTO `u_user_collect` VALUES (10, 1, 1, 47);
INSERT INTO `u_user_collect` VALUES (11, 1, 1, 3);
INSERT INTO `u_user_collect` VALUES (12, 1, 1, 23);
INSERT INTO `u_user_collect` VALUES (14, 1, 1, 44);
INSERT INTO `u_user_collect` VALUES (15, 2, 1, 56);

-- ----------------------------
-- Table structure for u_user_like
-- ----------------------------
DROP TABLE IF EXISTS `u_user_like`;
CREATE TABLE `u_user_like`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(0) NOT NULL COMMENT '用户id',
  `type` tinyint(1) NOT NULL COMMENT '点赞类型(1记录 2题目 3评论)',
  `type_id` int(0) NOT NULL COMMENT '类型id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of u_user_like
-- ----------------------------

-- ----------------------------
-- Table structure for w_site_config
-- ----------------------------
DROP TABLE IF EXISTS `w_site_config`;
CREATE TABLE `w_site_config`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户头像',
  `tourist_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '游客头像',
  `site_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站名称',
  `site_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站地址',
  `site_intro` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站简介',
  `site_notice` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站公告',
  `create_site_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '建站日期',
  `record_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '备案号',
  `author_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '作者头像',
  `site_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站作者',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '默认缩略图',
  `about_me` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '关于我',
  `github` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'Github',
  `gitee` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'Gitee',
  `bilibili` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '哔哩哔哩',
  `qq` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'QQ',
  `comment_check` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否评论审核 (0否 1是)',
  `quiz_check` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否题目审核 (0否 1是)',
  `is_reward` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否开启打赏 (0否 1是)',
  `wei_xin_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '微信二维码',
  `ali_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '支付宝二维码',
  `email_notice` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否邮箱通知 (0否 1是)',
  `social_list` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '社交列表',
  `login_list` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录方式',
  `is_music` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否开启音乐播放器 (0否 1是)',
  `music_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '网易云歌单id',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_site_config
-- ----------------------------
INSERT INTO `w_site_config` VALUES (1, 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/avatar/d86855a693b9c73c185bc677554ea60a.jpeg', 'https://static.ttkwsd.top/config/0bca52afdb2b9998132355d716390c9f.png', '三缺一', 'https://agree.vhans.cloud', '一站式校园活动开展', '欢迎同学们加入三缺一,也积极欢迎同学们推荐给其他同学.后端基于SpringBoot开发，前端基于Vue3 Ts Navie UI开发，<a href=\"https://gitee.com/v-function/agreement\" style=\"color: #49b1f5;\">网站源码</a>', '2023-04-10', '浙ICP备2023009806号', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/config/9119ed9788a4168cc1c18b358eaef665.jpg', 'Vhans', 'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/config/8763f6a06c5477309aeda8bfccefc476.jpg', '🍀个人简介\n\n本站作者幽默风趣，风度翩翩，人见人爱，花见花开，车见车载，宇宙无敌霹雳最最最帅气美男子，欢迎小姐姐通过各种手段加本人微信，通通通过，机不可失，失不再来。\n前面开玩笑，现在郑重介绍一下本人，吸纳无尽知识，成就编程之神，手撕源码，徒脚造轮子，反正我无敌，你们随意。\n最后，感谢大佬们的开源精神！💖', 'https://github.com/vhanshu', 'https://gitee.com/v-function/agreement', '无', '2873585297', 0, 0, 0, 'https://static.ttkwsd.top/config/994a286571b002e93281899cb402bd15.png', 'https://static.ttkwsd.top/config/f0be9dc73e230d8821179b9303a9ff49.jpg', 1, 'gitee,github,qq', 'gitee,github', 1, '7611185981', '2023-01-07 19:31:33', '2023-05-15 23:44:25');

-- ----------------------------
-- Table structure for w_task
-- ----------------------------
DROP TABLE IF EXISTS `w_task`;
CREATE TABLE `w_task`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `task_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `task_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'cron执行表达式',
  `misfire_policy` tinyint(1) NOT NULL DEFAULT 3 COMMENT '计划执行错误策略 (1立即执行 2执行一次 3放弃执行)',
  `concurrent` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否并发执行 (0否 1是)',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '任务状态 (0运行 1暂停)',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务备注信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_task
-- ----------------------------
INSERT INTO `w_task` VALUES (1, '清除游客访问记录', 'SYSTEM', 'timedTask.clear', '0 0 0 * * ?', 3, 0, 0, '每日清除一下缓存中的游客记录', '2023-04-14 09:49:39', '2023-04-18 15:48:41');
INSERT INTO `w_task` VALUES (2, '清除访问日志', 'SYSTEM', 'timedTask.clearVistiLog', '0 0 2 * * ?', 3, 0, 0, '清除一周前的访问日志', '2023-04-22 15:56:32', '2023-05-10 22:57:23');
INSERT INTO `w_task` VALUES (3, '设置持久点赞量', 'SYSTEM', 'timedTask.setLike', '0 0 2 * * ?', 3, 0, 0, '每周将缓存中的点赞量持久化到数据库', '2023-04-22 15:56:32', '2023-05-10 22:57:23');
INSERT INTO `w_task` VALUES (4, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '0 0 * * * ?', 1, 0, 1, '每个小时设置一下过期约起', '2023-04-20 15:42:32', '2023-05-03 18:09:19');

SET FOREIGN_KEY_CHECKS = 1;
