/*
 Navicat MySQL Data Transfer

 Source Server         : 腾讯云
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 43.142.156.249:3306
 Source Schema         : agreement

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 02/05/2023 20:51:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for s_admin
-- ----------------------------
DROP TABLE IF EXISTS `s_admin`;
CREATE TABLE `s_admin`
(
    `id`          int(0)                                                        NOT NULL AUTO_INCREMENT COMMENT '管理员id',
    `nickname`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '管理员昵称',
    `admin_name`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '姓名',
    `password`    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
    `avatar`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '头像',
    `email`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT '' COMMENT '邮箱',
    `ip_address`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT '' COMMENT '登录ip',
    `ip_source`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT '' COMMENT '登录地址',
    `is_disable`  tinyint(1)                                                    NOT NULL DEFAULT 0 COMMENT '是否禁用 (0否 1是)',
    `login_time`  datetime(0)                                                   NULL     DEFAULT NULL COMMENT '登录时间',
    `create_time` datetime(0)                                                   NOT NULL COMMENT '创建时间',
    `update_time` datetime(0)                                                   NULL     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 18
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_admin
-- ----------------------------
INSERT INTO `s_admin`
VALUES (1, 'V函数', 'vhans', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/vhans.jpg', '2873585297@qq.com',
        '192.168.244.1', '内网IP|内网IP', 0, '2023-05-02 20:24:28', '2022-11-29 21:45:48', '2023-05-02 20:24:28');
INSERT INTO `s_admin`
VALUES (2, '测试账号', 'test', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/vhans.jpg', 'test@qq.com',
        '192.168.244.1', '内网IP|内网IP', 0, '2023-04-22 09:20:37', '2022-11-30 21:34:26', '2023-04-25 23:15:33');
INSERT INTO `s_admin`
VALUES (3, 'Clouds', 'Wr', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/vhans.jpg', '1664282121@qq.com',
        '127.0.0.1', '内网IP|内网IP', 0, '2023-04-24 23:18:59', '2023-04-24 16:32:26', '2023-04-25 23:15:41');
INSERT INTO `s_admin`
VALUES (4, 'gxr', 'Gxr', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/vhans.jpg', '2296902073@qq.com',
        '127.0.0.1', '内网IP|内网IP', 0, '2023-04-24 23:19:28', '2023-04-24 16:32:26', '2023-04-25 23:15:45');
INSERT INTO `s_admin`
VALUES (5, 'cs', 'Cs', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/vhans.jpg', '2621626507@qq.com',
        '127.0.0.1', '内网IP|内网IP', 0, NULL, '2023-04-30 18:47:33', '2023-04-30 19:27:05');
INSERT INTO `s_admin`
VALUES (6, 'myt', 'Myt', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/vhans.jpg', '921796926@qq.com',
        '127.0.0.1', '内网IP|内网IP', 0, NULL, '2023-04-30 18:50:08', '2023-04-30 19:27:10');

-- ----------------------------
-- Table structure for s_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `s_admin_role`;
CREATE TABLE `s_admin_role`
(
    `id`       int(0)                                                       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `admin_id` int(0)                                                       NOT NULL COMMENT '用户id',
    `role_id`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 64
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_admin_role
-- ----------------------------
INSERT INTO `s_admin_role`
VALUES (54, 1, '1');
INSERT INTO `s_admin_role`
VALUES (57, 16, '3');
INSERT INTO `s_admin_role`
VALUES (58, 17, '3');
INSERT INTO `s_admin_role`
VALUES (59, 2, '3');
INSERT INTO `s_admin_role`
VALUES (60, 3, '1');
INSERT INTO `s_admin_role`
VALUES (61, 4, '1');
INSERT INTO `s_admin_role`
VALUES (62, 5, '1');
INSERT INTO `s_admin_role`
VALUES (63, 6, '1');

-- ----------------------------
-- Table structure for a_exception_log
-- ----------------------------
DROP TABLE IF EXISTS `a_exception_log`;
CREATE TABLE `a_exception_log`
(
    `id`             int(0)                                                        NOT NULL AUTO_INCREMENT COMMENT '异常id',
    `module`         varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '异常模块',
    `uri`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '异常uri',
    `name`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '异常名称',
    `description`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作描述',
    `error_method`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '异常方法',
    `message`        longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci     NOT NULL COMMENT '异常信息',
    `params`         longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci     NOT NULL COMMENT '请求参数',
    `request_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '请求方式',
    `ip_address`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '操作ip',
    `ip_source`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '操作地址',
    `os`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '操作系统',
    `browser`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '浏览器',
    `create_time`    datetime(0)                                                   NOT NULL COMMENT '操作时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 250
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a_exception_log
-- ----------------------------

-- ----------------------------
-- Table structure for a_file
-- ----------------------------
DROP TABLE IF EXISTS `a_file`;
CREATE TABLE `a_file`
(
    `id`          int(0)                                                        NOT NULL AUTO_INCREMENT COMMENT '文件id',
    `file_url`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '文件url',
    `file_name`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件名',
    `file_size`   int(0)                                                        NOT NULL DEFAULT 0 COMMENT '文件大小',
    `extend_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL DEFAULT '' COMMENT '文件类型',
    `file_path`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件路径',
    `is_dir`      tinyint(1)                                                    NOT NULL DEFAULT 0 COMMENT '是否为目录 (0否 1是)',
    `create_time` datetime(0)                                                   NOT NULL COMMENT '创建时间',
    `update_time` datetime(0)                                                   NULL     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 200
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a_file
-- ----------------------------
INSERT INTO `a_file`
VALUES (125, NULL, 'test', 0, '', '/', 1, '2023-04-22 13:34:33', NULL);
INSERT INTO `a_file`
VALUES (126, 'https://uplaod.vhans.cloud/test/da0704299c44631a6ca09dc941a545eb.png', 'da0704299c44631a6ca09dc941a545eb',
        23826, 'png', '/test', 0, '2023-04-22 13:35:34', NULL);
INSERT INTO `a_file`
VALUES (127, 'https://uplaod.vhans.cloud/test/24cbe045d1a471b5404f3a22e2f40387.jpg', '24cbe045d1a471b5404f3a22e2f40387',
        100182, 'jpg', '/test', 0, '2023-04-22 13:38:58', NULL);
INSERT INTO `a_file`
VALUES (128, 'https://uplaod.vhans.cloud/test/848686a1da40e6e258f384d0e8350d5b.jpg', '848686a1da40e6e258f384d0e8350d5b',
        44643, 'jpg', '/test', 0, '2023-04-22 13:38:58', NULL);
INSERT INTO `a_file`
VALUES (129, 'https://uplaod.vhans.cloud/test/85902ff1273548827014398faa50835a.jpg', '85902ff1273548827014398faa50835a',
        71605, 'jpg', '/test', 0, '2023-04-22 13:38:58', NULL);
INSERT INTO `a_file`
VALUES (130, 'https://uplaod.vhans.cloud/test/5fb341f0f7b4a582ea1d043e2841e7b0.jpg', '5fb341f0f7b4a582ea1d043e2841e7b0',
        94375, 'jpg', '/test', 0, '2023-04-22 13:38:58', NULL);
INSERT INTO `a_file`
VALUES (131, 'https://uplaod.vhans.cloud/test/95715da36ee97ce53e1d3c383fa58da0.jpg', '95715da36ee97ce53e1d3c383fa58da0',
        149069, 'jpg', '/test', 0, '2023-04-22 13:38:58', NULL);
INSERT INTO `a_file`
VALUES (132, 'https://uplaod.vhans.cloud/test/0357babdb438ed09d39324f52f1cf6f6.jpg', '0357babdb438ed09d39324f52f1cf6f6',
        93123, 'jpg', '/test', 0, '2023-04-22 13:38:58', NULL);
INSERT INTO `a_file`
VALUES (133, 'https://uplaod.vhans.cloud/test/3703320c1d11a84e5f81ec5491b5f479.jpg', '3703320c1d11a84e5f81ec5491b5f479',
        209424, 'jpg', '/test', 0, '2023-04-22 13:38:58', NULL);
INSERT INTO `a_file`
VALUES (134, 'https://uplaod.vhans.cloud/test/0c59553f34374dcb34a554d59e27f1a2.jpg', '0c59553f34374dcb34a554d59e27f1a2',
        194208, 'jpg', '/test', 0, '2023-04-22 13:45:24', NULL);
INSERT INTO `a_file`
VALUES (136, 'https://uplaod.vhans.cloud/test/b423d873e8e984b3097a9d486f9aa9b8.jpg', 'b423d873e8e984b3097a9d486f9aa9b8',
        168558, 'jpg', '/test', 0, '2023-04-22 13:45:24', NULL);
INSERT INTO `a_file`
VALUES (137, 'https://uplaod.vhans.cloud/test/5b21ab083e2eb78a1ea3b19f208c4066.jpg', '5b21ab083e2eb78a1ea3b19f208c4066',
        210117, 'jpg', '/test', 0, '2023-04-22 13:45:24', NULL);
INSERT INTO `a_file`
VALUES (138, NULL, 'images', 0, '', '/', 1, '2023-04-22 13:46:29', NULL);
INSERT INTO `a_file`
VALUES (139, 'https://uplaod.vhans.cloud/images/10961ce71870265b9277d55d01b9b9f1.jpg',
        '10961ce71870265b9277d55d01b9b9f1', 151777, 'jpg', '/images', 0, '2023-04-22 13:46:54', NULL);
INSERT INTO `a_file`
VALUES (140, 'https://uplaod.vhans.cloud/images/708de16b745ddbc8635dcb844d61dfc5.jpg',
        '708de16b745ddbc8635dcb844d61dfc5', 126761, 'jpg', '/images', 0, '2023-04-22 13:46:54', NULL);
INSERT INTO `a_file`
VALUES (141, 'https://uplaod.vhans.cloud/images/429cdf35494323472b7cc6a1c56dbb21.jpg',
        '429cdf35494323472b7cc6a1c56dbb21', 190370, 'jpg', '/images', 0, '2023-04-22 13:46:54', NULL);
INSERT INTO `a_file`
VALUES (142, 'https://uplaod.vhans.cloud/images/8763f6a06c5477309aeda8bfccefc476.jpg',
        '8763f6a06c5477309aeda8bfccefc476', 162971, 'jpg', '/images', 0, '2023-04-22 13:46:54', NULL);
INSERT INTO `a_file`
VALUES (143, 'https://uplaod.vhans.cloud/images/24e5b66e63ba128ee20fae075572e365.jpg',
        '24e5b66e63ba128ee20fae075572e365', 195358, 'jpg', '/images', 0, '2023-04-22 13:46:55', NULL);
INSERT INTO `a_file`
VALUES (144, 'https://uplaod.vhans.cloud/images/e64ad19cc4753b57d6af7501faceeca0.jpg',
        'e64ad19cc4753b57d6af7501faceeca0', 210066, 'jpg', '/images', 0, '2023-04-22 13:46:55', NULL);
INSERT INTO `a_file`
VALUES (145, 'https://uplaod.vhans.cloud/images/ffa427c038e8f23f7e04c004c49922bb.jpg',
        'ffa427c038e8f23f7e04c004c49922bb', 211365, 'jpg', '/images', 0, '2023-04-22 13:46:55', NULL);
INSERT INTO `a_file`
VALUES (146, 'https://uplaod.vhans.cloud/images/80bfc07b78b29d2eb40d674ddc6014be.jpg',
        '80bfc07b78b29d2eb40d674ddc6014be', 194662, 'jpg', '/images', 0, '2023-04-22 13:46:55', NULL);
INSERT INTO `a_file`
VALUES (147, 'https://uplaod.vhans.cloud/test/2a307aebd883232ab5e9d067874da506.jpeg',
        '2a307aebd883232ab5e9d067874da506', 188386, 'jpeg', '/test', 0, '2023-04-22 21:04:21', NULL);
INSERT INTO `a_file`
VALUES (148, 'https://uplaod.vhans.cloud/test/d86855a693b9c73c185bc677554ea60a.jpeg',
        'd86855a693b9c73c185bc677554ea60a', 190835, 'jpeg', '/test', 0, '2023-04-22 21:04:21', NULL);
INSERT INTO `a_file`
VALUES (149, 'https://uplaod.vhans.cloud/test/ed36bb0094655d75b954eb6be5c040d3.jpeg',
        'ed36bb0094655d75b954eb6be5c040d3', 82324, 'jpeg', '/test', 0, '2023-04-22 21:04:21', NULL);
INSERT INTO `a_file`
VALUES (150, 'https://uplaod.vhans.cloud/test/afcb8e4ad3a5c55e717bc109520b6307.jpg', 'afcb8e4ad3a5c55e717bc109520b6307',
        204306, 'jpg', '/test', 0, '2023-04-22 21:04:21', NULL);
INSERT INTO `a_file`
VALUES (151, 'https://uplaod.vhans.cloud/test/fa66d26ea9f224095feef2db32975386.jpg', 'fa66d26ea9f224095feef2db32975386',
        202553, 'jpg', '/test', 0, '2023-04-22 21:04:21', NULL);
INSERT INTO `a_file`
VALUES (152, 'https://uplaod.vhans.cloud/test/0715866afe79492bd23b3a5c72b599cb.jpg', '0715866afe79492bd23b3a5c72b599cb',
        198697, 'jpg', '/test', 0, '2023-04-22 21:04:21', NULL);
INSERT INTO `a_file`
VALUES (153, 'https://uplaod.vhans.cloud/test/59ade72e4013a5edd6ba9578cbbc2b62.jpg', '59ade72e4013a5edd6ba9578cbbc2b62',
        198050, 'jpg', '/test', 0, '2023-04-22 21:04:22', NULL);
INSERT INTO `a_file`
VALUES (154, 'https://uplaod.vhans.cloud/test/ca79bee637b2bfc9d274680df803f09d.jpg', 'ca79bee637b2bfc9d274680df803f09d',
        205769, 'jpg', '/test', 0, '2023-04-22 21:04:22', NULL);
INSERT INTO `a_file`
VALUES (155, 'https://uplaod.vhans.cloud/test/7c77bdfbe31a2d848fbe28449a994f4c.jpg', '7c77bdfbe31a2d848fbe28449a994f4c',
        201585, 'jpg', '/test', 0, '2023-04-22 21:04:22', NULL);
INSERT INTO `a_file`
VALUES (156, 'https://uplaod.vhans.cloud/test/b26f39098962255e16ad83f4bf861db2.jpg', 'b26f39098962255e16ad83f4bf861db2',
        211948, 'jpg', '/test', 0, '2023-04-22 21:04:22', NULL);
INSERT INTO `a_file`
VALUES (157, 'https://uplaod.vhans.cloud/test/55aacf300a1c9948737c65682ebdc585.jpeg',
        '55aacf300a1c9948737c65682ebdc585', 195708, 'jpeg', '/test', 0, '2023-04-22 21:04:22', NULL);
INSERT INTO `a_file`
VALUES (158, 'https://uplaod.vhans.cloud/test/12270c4fe6ff5e988c699946b9beef3a.jpg', '12270c4fe6ff5e988c699946b9beef3a',
        203865, 'jpg', '/test', 0, '2023-04-22 21:04:23', NULL);
INSERT INTO `a_file`
VALUES (159, 'https://uplaod.vhans.cloud/test/170744952671524be2791ee4e6ae91f3.jpg', '170744952671524be2791ee4e6ae91f3',
        197051, 'jpg', '/test', 0, '2023-04-22 21:04:24', NULL);
INSERT INTO `a_file`
VALUES (160, NULL, 'videos', 0, '', '/', 1, '2023-04-23 00:02:12', NULL);
INSERT INTO `a_file`
VALUES (161, 'https://uplaod.vhans.cloud/videos/dd68cbf9772948036ac654162ab6262d.mp4',
        'dd68cbf9772948036ac654162ab6262d', 13936568, 'mp4', '/videos', 0, '2023-04-23 00:10:07', NULL);
INSERT INTO `a_file`
VALUES (162, 'https://uplaod.vhans.cloud/agreeRecord/image/da0704299c44631a6ca09dc941a545eb.png',
        'da0704299c44631a6ca09dc941a545eb', 23826, 'png', '/agreeRecord/image/', 0, '2023-04-25 14:19:06', NULL);
INSERT INTO `a_file`
VALUES (163, 'https://uplaod.vhans.cloud/agreeRecord/image/2fc6dcedd9a62c51b8bddcc4f545d270.jpg',
        '2fc6dcedd9a62c51b8bddcc4f545d270', 779682, 'jpg', '/agreeRecord/image/', 0, '2023-04-25 15:42:48', NULL);
INSERT INTO `a_file`
VALUES (164,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/3343e13d2426e268352fb80b51bf7113.jpg',
        '3343e13d2426e268352fb80b51bf7113', 212962, 'jpg', '/agreeRecord/image/', 0, '2023-04-25 17:10:01', NULL);
INSERT INTO `a_file`
VALUES (165,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/864a4e503bc6abeaf217e0285084af3b.jpg',
        '864a4e503bc6abeaf217e0285084af3b', 211020, 'jpg', '/agreeRecord/image/', 0, '2023-04-30 20:23:51', NULL);
INSERT INTO `a_file`
VALUES (166,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/306b946209c9250899912d1f357d4938.jpg',
        '306b946209c9250899912d1f357d4938', 202387, 'jpg', '/agreeRecord/image/', 0, '2023-04-30 22:20:08', NULL);
INSERT INTO `a_file`
VALUES (167,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/59ade72e4013a5edd6ba9578cbbc2b62.jpg',
        '59ade72e4013a5edd6ba9578cbbc2b62', 198050, 'jpg', '/agreeRecord/image/', 0, '2023-04-30 23:00:22', NULL);
INSERT INTO `a_file`
VALUES (168,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/ca79bee637b2bfc9d274680df803f09d.jpg',
        'ca79bee637b2bfc9d274680df803f09d', 205769, 'jpg', '/agreeRecord/image/', 0, '2023-04-30 23:08:10', NULL);
INSERT INTO `a_file`
VALUES (169,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/378d3d4d7e1c7696cbb7d0709538798f.jpg',
        '378d3d4d7e1c7696cbb7d0709538798f', 121238, 'jpg', '/agreeRecord/image/', 0, '2023-04-30 23:08:16', NULL);
INSERT INTO `a_file`
VALUES (170,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/662fab35bcce964bfe0d1d9e14229774.jpg',
        '662fab35bcce964bfe0d1d9e14229774', 140165, 'jpg', '/agreeRecord/image/', 0, '2023-04-30 23:08:25', NULL);
INSERT INTO `a_file`
VALUES (171,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg',
        '12270c4fe6ff5e988c699946b9beef3a', 203865, 'jpg', '/agreeRecord/image/', 0, '2023-04-30 23:08:31', NULL);
INSERT INTO `a_file`
VALUES (172,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/fa66d26ea9f224095feef2db32975386.jpg',
        'fa66d26ea9f224095feef2db32975386', 202553, 'jpg', '/agreeRecord/image/', 0, '2023-04-30 23:51:19', NULL);
INSERT INTO `a_file`
VALUES (173,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/988e83dae0ed1fa784c73eaf9320936e.jpg',
        '988e83dae0ed1fa784c73eaf9320936e', 50567, 'jpg', '/agreeRecord/image/', 0, '2023-04-30 23:59:34', NULL);
INSERT INTO `a_file`
VALUES (174,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/85902ff1273548827014398faa50835a.jpg',
        '85902ff1273548827014398faa50835a', 71605, 'jpg', '/agreeRecord/image/', 0, '2023-05-01 09:42:14', NULL);
INSERT INTO `a_file`
VALUES (175,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/0357babdb438ed09d39324f52f1cf6f6.jpg',
        '0357babdb438ed09d39324f52f1cf6f6', 93123, 'jpg', '/agreeRecord/image/', 0, '2023-05-01 09:49:34', NULL);
INSERT INTO `a_file`
VALUES (176,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/3703320c1d11a84e5f81ec5491b5f479.jpg',
        '3703320c1d11a84e5f81ec5491b5f479', 209424, 'jpg', '/agreeRecord/image/', 0, '2023-05-01 09:49:53', NULL);
INSERT INTO `a_file`
VALUES (177,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/7dc388c70dcf3fa93c1c54942dd8644f.jpg',
        '7dc388c70dcf3fa93c1c54942dd8644f', 185755, 'jpg', '/agreeRecord/image/', 0, '2023-05-01 09:51:43', NULL);
INSERT INTO `a_file`
VALUES (178,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/b7a9a9f1b412bcfd68eb91e0c0a52872.jpg',
        'b7a9a9f1b412bcfd68eb91e0c0a52872', 137229, 'jpg', '/agreeRecord/image/', 0, '2023-05-01 09:54:06', NULL);
INSERT INTO `a_file`
VALUES (179,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/1235feeed7bf35b90bc3026e21b19fc7.jpg',
        '1235feeed7bf35b90bc3026e21b19fc7', 132312, 'jpg', '/agreeRecord/image/', 0, '2023-05-01 09:54:38', NULL);
INSERT INTO `a_file`
VALUES (180,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/848686a1da40e6e258f384d0e8350d5b.jpg',
        '848686a1da40e6e258f384d0e8350d5b', 44643, 'jpg', '/agreeRecord/image/', 0, '2023-05-01 09:57:13', NULL);
INSERT INTO `a_file`
VALUES (181,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/95715da36ee97ce53e1d3c383fa58da0.jpg',
        '95715da36ee97ce53e1d3c383fa58da0', 149069, 'jpg', '/agreeRecord/image/', 0, '2023-05-01 09:58:19', NULL);
INSERT INTO `a_file`
VALUES (182,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/24cbe045d1a471b5404f3a22e2f40387.jpg',
        '24cbe045d1a471b5404f3a22e2f40387', 100182, 'jpg', '/agreeRecord/image/', 0, '2023-05-01 09:58:30', NULL);
INSERT INTO `a_file`
VALUES (183,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/d4bbffcc8f8c51724e597108d8df0bc8.jpg',
        'd4bbffcc8f8c51724e597108d8df0bc8', 161949, 'jpg', '/agreeRecord/image/', 0, '2023-05-01 10:02:26', NULL);
INSERT INTO `a_file`
VALUES (184,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/bc3756ad6766f2443f0525c2a4fc5ac1.jpg',
        'bc3756ad6766f2443f0525c2a4fc5ac1', 176448, 'jpg', '/agreeRecord/image/', 0, '2023-05-01 10:05:07', NULL);
INSERT INTO `a_file`
VALUES (185,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/db0a7fe25d21f260383170de2467a489.jpg',
        'db0a7fe25d21f260383170de2467a489', 195876, 'jpg', '/agreeRecord/image/', 0, '2023-05-01 10:05:11', NULL);
INSERT INTO `a_file`
VALUES (186,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/03909dd0c035301aeab46629b526cfb0.jpg',
        '03909dd0c035301aeab46629b526cfb0', 207744, 'jpg', '/agreeRecord/image/', 0, '2023-05-01 10:05:16', NULL);
INSERT INTO `a_file`
VALUES (187,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/e5435710b250b5cf697d33f2fe762aa5.jpg',
        'e5435710b250b5cf697d33f2fe762aa5', 62929, 'jpg', '/agreeRecord/image/', 0, '2023-05-01 10:05:23', NULL);
INSERT INTO `a_file`
VALUES (188,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/f343ef0206d61099e7734f2b7ae72f76.jpg',
        'f343ef0206d61099e7734f2b7ae72f76', 157605, 'jpg', '/agreeRecord/image/', 0, '2023-05-01 10:05:27', NULL);
INSERT INTO `a_file`
VALUES (189,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/619dd0d1cf9df3d96e9a01a08dc69607.jpg',
        '619dd0d1cf9df3d96e9a01a08dc69607', 198877, 'jpg', '/agreeRecord/image/', 0, '2023-05-01 10:05:33', NULL);
INSERT INTO `a_file`
VALUES (190,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/ccd3a8c96c71d20cf9c1f37986f39199.jpg',
        'ccd3a8c96c71d20cf9c1f37986f39199', 185735, 'jpg', '/agreeRecord/image/', 0, '2023-05-01 10:05:37', NULL);
INSERT INTO `a_file`
VALUES (191,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/9069c24008cc24c7f95e30764f9f9fa4.jpg',
        '9069c24008cc24c7f95e30764f9f9fa4', 107246, 'jpg', '/agreeRecord/image/', 0, '2023-05-01 10:05:45', NULL);
INSERT INTO `a_file`
VALUES (192,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/316c7d1ec6d28ceec39431d99a0829e2.mp4',
        '316c7d1ec6d28ceec39431d99a0829e2', 6263549, 'mp4', '/agreeRecord/video/', 0, '2023-05-01 10:09:45', NULL);
INSERT INTO `a_file`
VALUES (193,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/cc91ec1cdbd1222d3eaea67d7312e7e5.mp4',
        'cc91ec1cdbd1222d3eaea67d7312e7e5', 1792593, 'mp4', '/agreeRecord/video/', 0, '2023-05-01 10:13:31', NULL);
INSERT INTO `a_file`
VALUES (194,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreement/image/85902ff1273548827014398faa50835a.jpg',
        '85902ff1273548827014398faa50835a', 71605, 'jpg', '/agreement/image/', 0, '2023-05-01 18:03:30', NULL);
INSERT INTO `a_file`
VALUES (195,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreement/image/5fb341f0f7b4a582ea1d043e2841e7b0.jpg',
        '5fb341f0f7b4a582ea1d043e2841e7b0', 94375, 'jpg', '/agreement/image/', 0, '2023-05-01 18:18:44', NULL);
INSERT INTO `a_file`
VALUES (196,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreement/image/95715da36ee97ce53e1d3c383fa58da0.jpg',
        '95715da36ee97ce53e1d3c383fa58da0', 149069, 'jpg', '/agreement/image/', 0, '2023-05-01 18:31:41', NULL);
INSERT INTO `a_file`
VALUES (197,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreement/image/70fd119b20dc3b6da18e672ce5182eab.png',
        '70fd119b20dc3b6da18e672ce5182eab', 980578, 'png', '/agreement/image/', 0, '2023-05-01 18:32:18', NULL);
INSERT INTO `a_file`
VALUES (198,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreement/image/848686a1da40e6e258f384d0e8350d5b.jpg',
        '848686a1da40e6e258f384d0e8350d5b', 44643, 'jpg', '/agreement/image/', 0, '2023-05-01 22:32:50', NULL);
INSERT INTO `a_file`
VALUES (199,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreement/image/e7900c65b10258d272922071ab685805.jpg',
        'e7900c65b10258d272922071ab685805', 66205, 'jpg', '/agreement/image/', 0, '2023-05-01 22:56:15', NULL);

-- ----------------------------
-- Table structure for a_menu
-- ----------------------------
DROP TABLE IF EXISTS `a_menu`;
CREATE TABLE `a_menu`
(
    `id`          int                                                          NOT NULL AUTO_INCREMENT COMMENT '主键',
    `parent_id`   int                                                          NOT NULL DEFAULT '0' COMMENT '父菜单id (paren_id为0且type为M则是一级菜单)',
    `menu_type`   char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci     NOT NULL COMMENT '权限类型 (M目录 C菜单 B按钮)',
    `menu_name`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
    `path`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci         DEFAULT NULL COMMENT '路由地址',
    `icon`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci          DEFAULT NULL COMMENT '菜单图标',
    `component`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci          DEFAULT NULL COMMENT '菜单组件',
    `perms`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci         DEFAULT '' COMMENT '权限标识',
    `is_hidden`   tinyint(1)                                                   NOT NULL DEFAULT '0' COMMENT '是否隐藏 (0否 1是)',
    `is_disable`  tinyint(1)                                                   NOT NULL DEFAULT '0' COMMENT '是否禁用 (0否 1是)',
    `order_num`   int                                                          NOT NULL DEFAULT '1' COMMENT '排序',
    `create_time` datetime                                                     NOT NULL COMMENT '创建时间',
    `update_time` datetime                                                              DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 127
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT '菜单';

-- ----------------------------
-- Records of a_menu
-- ----------------------------
INSERT INTO `a_menu`
VALUES (1, 0, 'M', '记录管理', 'agreeRecord', 'agreeRecord', NULL, NULL, 0, 0, 1, '2023-04-20 13:38:58',
        '2023-04-22 14:43:15.225481');
INSERT INTO `a_menu`
VALUES (2, 0, 'M', '题目管理', 'quiz', 'quiz', NULL, NULL, 0, 0, 2, '2023-04-20 13:38:58',
        '2023-04-22 14:42:45.633287');
INSERT INTO `a_menu`
VALUES (3, 0, 'M', '约起管理', 'agreement', 'agreement', NULL, NULL, 0, 0, 3, '2023-04-20 13:38:58',
        '2023-04-22 14:41:33.962934');
INSERT INTO `a_menu`
VALUES (4, 0, 'M', '系统管理', 'system', 'system', NULL, NULL, 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (5, 0, 'M', '日志管理', 'log', 'log', NULL, NULL, 0, 0, 5, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (6, 0, 'M', '网站管理', 'web', 'international', NULL, NULL, 0, 0, 6, '2023-04-20 13:38:58',
        '2023-04-22 14:44:28.903022');
INSERT INTO `a_menu`
VALUES (7, 0, 'M', '系统监控', 'monitor', 'monitor', NULL, NULL, 0, 0, 7, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (11, 1, 'C', '发表记录', 'write', 'edit', '/agree/agreeRecord/write', 'agree:agreeRecord:list', 0, 0, 1,
        '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (12, 1, 'C', '记录列表', 'list', 'chart', '/agree/agreeRecord/list', 'agree:agreeRecord:list', 0, 0, 2,
        '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (13, 1, 'C', '记录标签', 'tag', 'tag', '/agree/agreeRecord/tag', 'agree:tag:list', 0, 0, 3, '2023-04-20 13:38:58',
        NULL);
INSERT INTO `a_menu`
VALUES (14, 1, 'C', '编辑记录', 'writer/:recordId', 'edit', '/agree/agreeRecord/write', 'agree:agreeRecord:list', 1, 0, 4,
        '2023-04-25 15:40:11', '2023-04-25 15:41:07');
INSERT INTO `a_menu`
VALUES (16, 2, 'C', '题目列表', 'list', 'chart', '/agree/quiz/list', 'agree:quiz:list', 0, 0, 2, '2023-04-20 13:38:58',
        NULL);
INSERT INTO `a_menu`
VALUES (17, 2, 'C', '题目标签', 'tag', 'tag', '/agree/quiz/tag', 'agree:tag:list', 0, 0, 3, '2023-04-20 13:38:58',
        NULL);
INSERT INTO `a_menu`
VALUES (21, 3, 'C', '约会管理', 'appointment', 'appointment', '/agree/appointment/index', 'agree:agreement:list', 0, 0,
        1, '2023-04-20 13:38:58', '2023-04-22 14:41:42.407627');
INSERT INTO `a_menu`
VALUES (22, 3, 'C', '活动管理', 'activity', 'activity', '/agree/activity/index', 'agree:agreement:list', 0, 0, 2,
        '2023-04-20 13:38:58', '2023-04-22 14:41:50.259172');
INSERT INTO `a_menu`
VALUES (23, 3, 'C', '赛事管理', 'competition', 'competition', '/agree/competition/index', 'agree:agreement:list', 0, 0,
        3, '2023-04-20 13:38:58', '2023-04-22 14:42:00.487292');
INSERT INTO `a_menu`
VALUES (24, 3, 'C', '帮助管理', 'help', 'help', '/agree/help/index', 'agree:agreement:list', 0, 0, 4,
        '2023-04-20 13:38:58', '2023-04-22 14:42:21.46354');
INSERT INTO `a_menu`
VALUES (26, 4, 'C', '菜单管理', 'menu', 'tree-table', '/system/menu/index', 'system:menu:list', 0, 0, 1,
        '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (27, 4, 'C', '角色管理', 'role', 'peoples', '/system/role/index', 'system:role:list', 0, 0, 2,
        '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (28, 4, 'C', '管理员管理', 'admin', 'user', '/system/admin/index', 'system:admin:list', 0, 0, 3,
        '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (29, 4, 'C', '文件管理', 'file', 'file', '/system/file/index', 'system:file:list', 0, 0, 4,
        '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (31, 5, 'C', '操作日志', 'operation', 'form', '/system/log/operation', 'log:operation:list', 0, 0, 1,
        '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (32, 5, 'C', '异常日志', 'exception', 'bug', '/system/log/exception', 'log:exception:list', 0, 0, 2,
        '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (33, 5, 'C', '访问日志', 'visit', 'logininfor', '/system/log/visit', 'log:visit:list', 0, 0, 3,
        '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (34, 5, 'C', '任务日志', 'task', 'job', '/system/log/task', 'log:task:list', 0, 0, 4, '2023-04-20 13:38:58',
        NULL);
INSERT INTO `a_menu`
VALUES (36, 6, 'C', '用户管理', 'user', 'user', '/web/user/index', 'web:user:list', 0, 0, 1, '2023-04-20 13:38:58',
        NULL);
INSERT INTO `a_menu`
VALUES (37, 6, 'C', '评论管理', 'comment', 'comment', '/web/comment/index', 'web:comment:list', 0, 0, 2,
        '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (38, 6, 'C', '反馈管理', 'feedback', 'form', '/web/feedback/index', 'web:feedback:list', 0, 0, 3,
        '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (39, 6, 'C', '网站配置', 'site', 'example', '/web/site/index', 'web:site:list', 0, 0, 4, '2023-04-20 13:38:58',
        NULL);
INSERT INTO `a_menu`
VALUES (41, 7, 'C', '在线人员', 'online', 'online', '/monitor/online/index', 'monitor:online:list', 0, 0, 1,
        '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (42, 7, 'C', '定时任务', 'task', 'job', '/monitor/task/index', 'monitor:task:list', 0, 0, 2,
        '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (101, 12, 'B', '添加记录', NULL, NULL, NULL, 'agree:agreeRecord:add', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (102, 12, 'B', '物理删除记录', NULL, NULL, NULL, 'agree:agreeRecord:delete', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (103, 12, 'B', '逻辑删除记录', NULL, NULL, NULL, 'agree:agreeRecord:recycle', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (104, 12, 'B', '更新记录', NULL, NULL, NULL, 'agree:agreeRecord:update', 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (105, 12, 'B', '编辑记录', NULL, NULL, NULL, 'agree:agreeRecord:edit', 0, 0, 5, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (106, 12, 'B', '上传记录图片', NULL, NULL, NULL, 'agree:agreeRecord:upload', 0, 0, 6, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (107, 12, 'B', '上传记录视频', NULL, NULL, NULL, 'agree:agreeRecord:upload', 0, 0, 7, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (108, 12, 'B', '置顶记录', NULL, NULL, NULL, 'agree:agreeRecord:top', 0, 0, 8, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (109, 12, 'B', '推荐记录', NULL, NULL, NULL, 'agree:agreeRecord:recommend', 0, 0, 9, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (111, 13, 'B', '添加标签', NULL, NULL, NULL, 'agree:tag:add', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (112, 13, 'B', '删除标签', NULL, NULL, NULL, 'agree:tag:delete', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (113, 13, 'B', '修改标签', NULL, NULL, NULL, 'agree:tag:update', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (121, 16, 'B', '添加题目', NULL, NULL, NULL, 'agree:quiz:add', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (122, 16, 'B', '删除题目', NULL, NULL, NULL, 'agree:quiz:delete', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (123, 16, 'B', '更新题目', NULL, NULL, NULL, 'agree:quiz:update', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (124, 16, 'B', '编辑题目', NULL, NULL, NULL, 'agree:quiz:edit', 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (125, 16, 'B', '上传题目图片', NULL, NULL, NULL, 'agree:quiz:upload', 0, 0, 5, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (131, 17, 'B', '添加标签', NULL, NULL, NULL, 'agree:tag:add', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (132, 17, 'B', '删除标签', NULL, NULL, NULL, 'agree:tag:delete', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (133, 17, 'B', '修改标签', NULL, NULL, NULL, 'agree:tag:update', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (141, 27, 'B', '添加约会', NULL, NULL, NULL, 'agree:agreement:add', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (142, 21, 'B', '删除约会', NULL, NULL, NULL, 'agree:agreement:delete', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (143, 21, 'B', '更新约会', NULL, NULL, NULL, 'agree:agreement:update', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (144, 21, 'B', '编辑约会', NULL, NULL, NULL, 'agree:agreement:edit', 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (151, 22, 'B', '添加活动', NULL, NULL, NULL, 'agree:agreement:add', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (152, 22, 'B', '删除活动', NULL, NULL, NULL, 'agree:agreement:delete', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (153, 22, 'B', '更新活动', NULL, NULL, NULL, 'agree:agreement:update', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (154, 22, 'B', '编辑活动', NULL, NULL, NULL, 'agree:agreement:edit', 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (161, 23, 'B', '添加赛事', NULL, NULL, NULL, 'agree:agreement:add', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (162, 23, 'B', '删除赛事', NULL, NULL, NULL, 'agree:agreement:delete', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (163, 23, 'B', '更新赛事', NULL, NULL, NULL, 'agree:agreement:update', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (164, 23, 'B', '编辑赛事', NULL, NULL, NULL, 'agree:agreement:edit', 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (171, 24, 'B', '添加帮助', NULL, NULL, NULL, 'agree:agreement:add', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (172, 24, 'B', '删除帮助', NULL, NULL, NULL, 'agree:agreement:delete', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (173, 24, 'B', '更新帮助', NULL, NULL, NULL, 'agree:agreement:update', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (174, 24, 'B', '编辑帮助', NULL, NULL, NULL, 'agree:agreement:edit', 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (181, 26, 'B', '添加菜单', NULL, NULL, NULL, 'system:menu:add', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (182, 26, 'B', '删除菜单', NULL, NULL, NULL, 'system:menu:delete', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (183, 26, 'B', '修改菜单', NULL, NULL, NULL, 'system:menu:update', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (184, 26, 'B', '编辑菜单', NULL, NULL, NULL, 'system:menu:edit', 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (191, 27, 'B', '添加角色', NULL, NULL, NULL, 'system:role:add', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (192, 27, 'B', '删除角色', NULL, NULL, NULL, 'system:role:delete', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (193, 27, 'B', '修改角色', NULL, NULL, NULL, 'system:role:update', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (194, 27, 'B', '修改角色状态', NULL, NULL, NULL, 'system:role:status', 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (201, 28, 'B', '修改管理员', NULL, NULL, NULL, 'system:admin:update', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (202, 28, 'B', '修改管理员状态', NULL, NULL, NULL, 'system:admin:status', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (203, 28, 'B', '修改管理员邮箱', NULL, NULL, NULL, 'admin:email:update', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (204, 28, 'B', '修改管理员头像', NULL, NULL, NULL, 'admin:avatar:update', 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (205, 28, 'B', '修改管理员信息', NULL, NULL, NULL, 'admin:info:update', 0, 0, 5, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (206, 28, 'B', '修改管理员密码', NULL, NULL, NULL, 'admin:password:update', 0, 0, 6, '2023-04-20 13:38:58',
        NULL);
INSERT INTO `a_menu`
VALUES (210, 29, 'B', '上传文件', NULL, NULL, NULL, 'system:file:upload', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (211, 29, 'B', '新建文件夹', NULL, NULL, NULL, 'system:file:folder', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (212, 29, 'B', '删除文件', NULL, NULL, NULL, 'system:file:delete', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (221, 31, 'B', '删除操作日志', NULL, NULL, NULL, 'log:operation:delete', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (226, 32, 'B', '删除异常日志', NULL, NULL, NULL, 'log:exception:delete', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (231, 33, 'B', '删除访问日志', NULL, NULL, NULL, 'log:visit:delete', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (236, 34, 'B', '删除任务日志', NULL, NULL, NULL, 'log:task:delete', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (237, 34, 'B', '清空任务日志', NULL, NULL, NULL, 'log:task:clear', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (241, 36, 'B', '修改用户', NULL, NULL, NULL, 'web:user:update', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (242, 36, 'B', '修改用户状态', NULL, NULL, NULL, 'web:user:status', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (246, 36, 'B', '修改用户密码', NULL, NULL, NULL, 'web:user:password', 0, 0, 6, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (251, 37, 'B', '添加评论', NULL, NULL, NULL, 'web:comment:add', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (252, 37, 'B', '删除评论', NULL, NULL, NULL, 'web:comment:delete', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (253, 37, 'B', '审核评论', NULL, NULL, NULL, 'web:comment:pass', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (254, 37, 'B', '点赞评论', NULL, NULL, NULL, 'web:comment:like', 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (256, 38, 'B', '删除反馈', NULL, NULL, NULL, 'web:feedback:delete', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (257, 38, 'B', '审核反馈', NULL, NULL, NULL, 'web:feedback:pass', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (261, 39, 'B', '修改网站配置', NULL, NULL, NULL, 'web:site:update', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (262, 39, 'B', '上传网站配置图片', NULL, NULL, NULL, 'web:site:upload', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (266, 41, 'B', '下线管理员', NULL, NULL, NULL, 'monitor:online:kick', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (267, 41, 'B', '下线用户', NULL, NULL, NULL, 'monitor:online:kick', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (271, 42, 'B', '添加任务', NULL, NULL, NULL, 'monitor:task:add', 0, 0, 1, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (272, 42, 'B', '修改任务', NULL, NULL, NULL, 'monitor:task:update', 0, 0, 2, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (273, 42, 'B', '删除任务', NULL, NULL, NULL, 'monitor:task:delete', 0, 0, 3, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (274, 42, 'B', '修改任务状态', NULL, NULL, NULL, 'monitor:task:status', 0, 0, 4, '2023-04-20 13:38:58', NULL);
INSERT INTO `a_menu`
VALUES (275, 42, 'B', '运行任务', NULL, NULL, NULL, 'monitor:task:run', 0, 0, 5, '2023-04-20 13:38:58', NULL);

-- ----------------------------
-- Table structure for a_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `a_operation_log`;
CREATE TABLE `a_operation_log`
(
    `id`          int(0)                                                        NOT NULL AUTO_INCREMENT COMMENT '操作id',
    `module`      varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '操作模块',
    `type`        varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '操作类型',
    `uri`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作uri',
    `name`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '方法名称',
    `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作描述',
    `params`      longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci     NOT NULL COMMENT '请求参数',
    `method`      varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '请求方式',
    `data`        longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci     NOT NULL COMMENT '返回数据',
    `user_id`     int(0)                                                        NOT NULL COMMENT '用户id',
    `nickname`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '用户昵称',
    `ip_address`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '操作ip',
    `ip_source`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '操作地址',
    `times`       int(0)                                                        NOT NULL COMMENT '操作耗时 (毫秒)',
    `create_time` datetime(0)                                                   NOT NULL COMMENT '操作时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1398
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a_operation_log
-- ----------------------------
INSERT INTO `a_operation_log`
VALUES (1152, '标签模块', '添加', '/admin/tag/add', 'com.vhans.aapi.controller.TagController.addTag', '添加标签',
        '[{\"id\":1,\"tagName\":\"科技\"}]', 'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans',
        '192.168.244.1', '内网IP|内网IP', 1502, '2023-04-21 14:09:50');
INSERT INTO `a_operation_log`
VALUES (1153, '题目模块', '添加', '/admin/quiz/add', 'com.vhans.aapi.controller.QuizController.addQuiz', '添加题目',
        '[{\"content\":\"test1\",\"id\":2,\"images\":\"http://test\",\"isCheck\":1,\"isSolve\":0,\"tagNameList\":[\"数学\"],\"title\":\"数学题\",\"userId\":1}]',
        'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 912,
        '2023-04-21 22:51:43');
INSERT INTO `a_operation_log`
VALUES (1154, '题目模块', '添加', '/admin/quiz/add', 'com.vhans.aapi.controller.QuizController.addQuiz', '添加题目',
        '[{\"content\":\"test1\",\"id\":3,\"images\":\"http://test\",\"isCheck\":1,\"isSolve\":0,\"tagNameList\":[\"英语\"],\"title\":\"英语题\",\"userId\":1}]',
        'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 276,
        '2023-04-21 22:53:32');
INSERT INTO `a_operation_log`
VALUES (1155, '题目模块', '添加', '/admin/quiz/add', 'com.vhans.aapi.controller.QuizController.addQuiz', '添加题目',
        '[{\"content\":\"test1\",\"id\":4,\"images\":\"http://test\",\"isCheck\":1,\"isSolve\":0,\"tagNameList\":[\"火箭\"],\"title\":\"国防\",\"userId\":1}]',
        'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 264,
        '2023-04-21 22:54:42');
INSERT INTO `a_operation_log`
VALUES (1156, '题目模块', '添加', '/admin/quiz/add', 'com.vhans.aapi.controller.QuizController.addQuiz', '添加题目',
        '[{\"content\":\"test1\",\"images\":\"http://test\",\"isCheck\":1,\"isSolve\":0,\"tagNameList\":[],\"title\":\"国防\",\"userId\":1}]',
        'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 648,
        '2023-04-21 23:08:04');
INSERT INTO `a_operation_log`
VALUES (1157, '题目模块', '删除', '/admin/quiz/delete', 'com.vhans.aapi.controller.QuizController.deleteQuiz',
        '删除题目', '[[5]]', 'DELETE', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1',
        '内网IP|内网IP', 158, '2023-04-21 23:20:13');
INSERT INTO `a_operation_log`
VALUES (1158, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"语言的魅力\",\"id\":1,\"isCheck\":1,\"isSolve\":0,\"title\":\"语文题\",\"userId\":1}]', 'PUT',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 120,
        '2023-04-21 23:24:24');
INSERT INTO `a_operation_log`
VALUES (1159, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"语言的魅力\",\"id\":1,\"isCheck\":1,\"isSolve\":0,\"tagNameList\":[\"文字\"],\"title\":\"语文题\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 416,
        '2023-04-21 23:25:57');
INSERT INTO `a_operation_log`
VALUES (1160, '管理员模块', '下线', '/admin/onlineAdmin/kick/Bearer%209bcf17d1-11b6-4f76-920b-bbc134fe6b19',
        'com.vhans.aapi.controller.AdminController.kickOutAdmin', '下线管理员',
        '[\"Bearer 9bcf17d1-11b6-4f76-920b-bbc134fe6b19\"]', 'GET', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 992, '2023-04-21 23:53:03');
INSERT INTO `a_operation_log`
VALUES (1161, '管理员模块', '下线', '/admin/onlineAdmin/kick/Bearer%209bcf17d1-11b6-4f76-920b-bbc134fe6b19',
        'com.vhans.aapi.controller.AdminController.kickOutAdmin', '下线管理员',
        '[\"Bearer 9bcf17d1-11b6-4f76-920b-bbc134fe6b19\"]', 'GET', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 163, '2023-04-21 23:53:10');
INSERT INTO `a_operation_log`
VALUES (1162, '文件模块', '添加', '/admin/file/createFolder', 'com.vhans.aapi.controller.FileController.createFolder',
        '创建目录', '[{\"fileName\":\"test\",\"filePath\":\"/\"}]', 'POST',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1004,
        '2023-04-22 13:34:34');
INSERT INTO `a_operation_log`
VALUES (1163, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'agree.png', 'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans',
        '192.168.244.1', '内网IP|内网IP', 397, '2023-04-22 13:35:34');
INSERT INTO `a_operation_log`
VALUES (1164, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'img-1619571666439b6fcae4683fed482a5d5f709e69ddec1.jpg', 'POST',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 278,
        '2023-04-22 13:38:58');
INSERT INTO `a_operation_log`
VALUES (1165, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'img-1621118348239dbf548802b13a2ccae55ed4a11d69a70.jpg', 'POST',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 278,
        '2023-04-22 13:38:58');
INSERT INTO `a_operation_log`
VALUES (1166, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'img-1618272520307fbefa6b05379a9918900ce51a6ff3ab0.jpg', 'POST',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 318,
        '2023-04-22 13:38:58');
INSERT INTO `a_operation_log`
VALUES (1167, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'img-1620352638772e43003ed02fc4c0e38ecfb4b645a2fbe.jpg', 'POST',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 330,
        '2023-04-22 13:38:58');
INSERT INTO `a_operation_log`
VALUES (1168, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'img-1621118331404c2c56d8fdf5bde766c54a75ed82170d7.jpg', 'POST',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 353,
        '2023-04-22 13:38:58');
INSERT INTO `a_operation_log`
VALUES (1169, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'img-1618103506002a70f03c6f7ab9a41a14c5211103816e3.jpg', 'POST',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 390,
        '2023-04-22 13:38:58');
INSERT INTO `a_operation_log`
VALUES (1170, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'img-1618790427978d7572c10ef3c26a20bbebf2afa84002a.jpg', 'POST',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 153,
        '2023-04-22 13:38:58');
INSERT INTO `a_operation_log`
VALUES (1171, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'img-16211475746083720a229b017fcc36649f09f7e18f872.jpg', 'POST',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 94,
        '2023-04-22 13:45:24');
INSERT INTO `a_operation_log`
VALUES (1172, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'img-16203526300272710383a16aff96daaa3fa1036458e67.jpg', 'POST',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 108,
        '2023-04-22 13:45:24');
INSERT INTO `a_operation_log`
VALUES (1173, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'img-162114941491629066baa984b32f49ac1aecdcb47557a.jpg', 'POST',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 117,
        '2023-04-22 13:45:24');
INSERT INTO `a_operation_log`
VALUES (1174, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'img-163644134342269453b21e74af0013ae491aafc6fe620.jpg', 'POST',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 135,
        '2023-04-22 13:45:24');
INSERT INTO `a_operation_log`
VALUES (1175, '文件模块', '删除', '/admin/file/delete', 'com.vhans.aapi.controller.FileController.deleteFile',
        '删除文件', '[[135]]', 'DELETE', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans',
        '192.168.244.1', '内网IP|内网IP', 205, '2023-04-22 13:46:16');
INSERT INTO `a_operation_log`
VALUES (1176, '文件模块', '添加', '/admin/file/createFolder', 'com.vhans.aapi.controller.FileController.createFolder',
        '创建目录', '[{\"fileName\":\"images\",\"filePath\":\"/\"}]', 'POST',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 117,
        '2023-04-22 13:46:29');
INSERT INTO `a_operation_log`
VALUES (1177, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件',
        'src=http___gss0.baidu.com_7LsWdDW5_xN3otqbppnN2DJv_lvpics_pic_item_b03533fa828ba61e670b26ac4634970a314e5948.jpg&refer=http___gss0.baidu.jpg',
        'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 87,
        '2023-04-22 13:46:55');
INSERT INTO `a_operation_log`
VALUES (1178, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'src=http___pic4.nipic.com_20090917_559695_091521002454_2.jpg&refer=http___pic4.nipic.jpg', 'POST',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 120,
        '2023-04-22 13:46:55');
INSERT INTO `a_operation_log`
VALUES (1179, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'img-1624000342016059040829c5af0a1ee5e85f644b2bc27.jpg', 'POST',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 121,
        '2023-04-22 13:46:55');
INSERT INTO `a_operation_log`
VALUES (1180, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'QQ图片20210628212243.jpg', 'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans',
        '192.168.244.1', '内网IP|内网IP', 127, '2023-04-22 13:46:55');
INSERT INTO `a_operation_log`
VALUES (1181, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件',
        'src=http___ac-r.static.booking.cn_images_hotel_max1280x900_116_116858890.jpg&refer=http___ac-r.static.booking.jpg',
        'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 109,
        '2023-04-22 13:46:55');
INSERT INTO `a_operation_log`
VALUES (1182, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件',
        'src=http___img.saihuitong.com_1503_img_34921_large_16855ca4cfa.jpg&refer=http___img.saihuitong.jpg', 'POST',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 127,
        '2023-04-22 13:46:55');
INSERT INTO `a_operation_log`
VALUES (1183, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'src=http___img8.zol.com.cn_bbs_upload_22593_22592079.JPG&refer=http___img8.zol.com.jpg', 'POST',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 85,
        '2023-04-22 13:46:55');
INSERT INTO `a_operation_log`
VALUES (1184, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件',
        'src=http___news.op.wpscdn.cn_uploadfile_2017_0513_20170513092424920.jpeg&refer=http___news.op.wpscdn.jpg',
        'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 121,
        '2023-04-22 13:46:55');
INSERT INTO `a_operation_log`
VALUES (1185, '菜单模块', '修改', '/admin/menu/update', 'com.vhans.aapi.controller.MenuController.updateMenu',
        '修改菜单',
        '[{\"icon\":\"nested\",\"id\":2,\"isDisable\":0,\"isHidden\":0,\"menuName\":\"题型管理\",\"menuType\":\"M\",\"orderNum\":2,\"parentId\":0,\"path\":\"quiz\"}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 188,
        '2023-04-22 14:24:12');
INSERT INTO `a_operation_log`
VALUES (1186, '菜单模块', '修改', '/admin/menu/update', 'com.vhans.aapi.controller.MenuController.updateMenu',
        '修改菜单',
        '[{\"icon\":\"nested\",\"id\":2,\"isDisable\":0,\"isHidden\":0,\"menuName\":\"题目管理\",\"menuType\":\"M\",\"orderNum\":2,\"parentId\":0,\"path\":\"quiz\"}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 87,
        '2023-04-22 14:24:24');
INSERT INTO `a_operation_log`
VALUES (1187, '菜单模块', '修改', '/admin/menu/update', 'com.vhans.aapi.controller.MenuController.updateMenu',
        '修改菜单',
        '[{\"icon\":\"nested\",\"id\":2,\"isDisable\":0,\"isHidden\":0,\"menuName\":\"题目管理\",\"menuType\":\"M\",\"orderNum\":2,\"parentId\":0,\"path\":\"quiz\"}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 724,
        '2023-04-22 14:30:57');
INSERT INTO `a_operation_log`
VALUES (1188, '菜单模块', '修改', '/admin/menu/update', 'com.vhans.aapi.controller.MenuController.updateMenu',
        '修改菜单',
        '[{\"icon\":\"clipboard\",\"id\":2,\"isDisable\":0,\"isHidden\":0,\"menuName\":\"题目管理\",\"menuType\":\"M\",\"orderNum\":2,\"parentId\":0,\"path\":\"quiz\"}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 89,
        '2023-04-22 14:31:49');
INSERT INTO `a_operation_log`
VALUES (1189, '菜单模块', '修改', '/admin/menu/update', 'com.vhans.aapi.controller.MenuController.updateMenu',
        '修改菜单',
        '[{\"icon\":\"appointment\",\"id\":3,\"isDisable\":0,\"isHidden\":0,\"menuName\":\"约起管理\",\"menuType\":\"M\",\"orderNum\":3,\"parentId\":0,\"path\":\"agreement\"}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 88,
        '2023-04-22 14:40:53');
INSERT INTO `a_operation_log`
VALUES (1190, '菜单模块', '修改', '/admin/menu/update', 'com.vhans.aapi.controller.MenuController.updateMenu',
        '修改菜单',
        '[{\"icon\":\"agreement\",\"id\":3,\"isDisable\":0,\"isHidden\":0,\"menuName\":\"约起管理\",\"menuType\":\"M\",\"orderNum\":3,\"parentId\":0,\"path\":\"agreement\"}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 91,
        '2023-04-22 14:41:34');
INSERT INTO `a_operation_log`
VALUES (1191, '菜单模块', '修改', '/admin/menu/update', 'com.vhans.aapi.controller.MenuController.updateMenu',
        '修改菜单',
        '[{\"component\":\"/agree/appointment/list\",\"icon\":\"appointment\",\"id\":21,\"isDisable\":0,\"isHidden\":0,\"menuName\":\"约会管理\",\"menuType\":\"C\",\"orderNum\":1,\"parentId\":3,\"path\":\"appointment\",\"perms\":\"agree:agreement:list\"}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 85,
        '2023-04-22 14:41:42');
INSERT INTO `a_operation_log`
VALUES (1192, '菜单模块', '修改', '/admin/menu/update', 'com.vhans.aapi.controller.MenuController.updateMenu',
        '修改菜单',
        '[{\"component\":\"/agree/activity/list\",\"icon\":\"activity\",\"id\":22,\"isDisable\":0,\"isHidden\":0,\"menuName\":\"活动管理\",\"menuType\":\"C\",\"orderNum\":2,\"parentId\":3,\"path\":\"activity\",\"perms\":\"agree:agreement:list\"}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 87,
        '2023-04-22 14:41:50');
INSERT INTO `a_operation_log`
VALUES (1193, '菜单模块', '修改', '/admin/menu/update', 'com.vhans.aapi.controller.MenuController.updateMenu',
        '修改菜单',
        '[{\"component\":\"/agree/competition/list\",\"icon\":\"competition\",\"id\":23,\"isDisable\":0,\"isHidden\":0,\"menuName\":\"赛事管理\",\"menuType\":\"C\",\"orderNum\":3,\"parentId\":3,\"path\":\"competition\",\"perms\":\"agree:agreement:list\"}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 109,
        '2023-04-22 14:42:01');
INSERT INTO `a_operation_log`
VALUES (1194, '菜单模块', '修改', '/admin/menu/update', 'com.vhans.aapi.controller.MenuController.updateMenu',
        '修改菜单',
        '[{\"component\":\"/agree/help/list\",\"icon\":\"help\",\"id\":24,\"isDisable\":0,\"isHidden\":0,\"menuName\":\"帮助管理\",\"menuType\":\"C\",\"orderNum\":4,\"parentId\":3,\"path\":\"help\",\"perms\":\"agree:agreement:list\"}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 87,
        '2023-04-22 14:42:22');
INSERT INTO `a_operation_log`
VALUES (1195, '菜单模块', '修改', '/admin/menu/update', 'com.vhans.aapi.controller.MenuController.updateMenu',
        '修改菜单',
        '[{\"icon\":\"quiz\",\"id\":2,\"isDisable\":0,\"isHidden\":0,\"menuName\":\"题目管理\",\"menuType\":\"M\",\"orderNum\":2,\"parentId\":0,\"path\":\"quiz\"}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 83,
        '2023-04-22 14:42:46');
INSERT INTO `a_operation_log`
VALUES (1196, '菜单模块', '修改', '/admin/menu/update', 'com.vhans.aapi.controller.MenuController.updateMenu',
        '修改菜单',
        '[{\"icon\":\"agreeRecord\",\"id\":1,\"isDisable\":0,\"isHidden\":0,\"menuName\":\"记录管理\",\"menuType\":\"M\",\"orderNum\":1,\"parentId\":0,\"path\":\"agreeRecord\"}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 82,
        '2023-04-22 14:43:15');
INSERT INTO `a_operation_log`
VALUES (1197, '菜单模块', '修改', '/admin/menu/update', 'com.vhans.aapi.controller.MenuController.updateMenu',
        '修改菜单',
        '[{\"icon\":\"international\",\"id\":6,\"isDisable\":0,\"isHidden\":0,\"menuName\":\"网站管理\",\"menuType\":\"M\",\"orderNum\":6,\"parentId\":0,\"path\":\"web\"}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 91,
        '2023-04-22 14:44:29');
INSERT INTO `a_operation_log`
VALUES (1198, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'Camera Roll1594706402071.jpeg', 'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1,
        'Vhans', '192.168.244.1', '内网IP|内网IP', 207, '2023-04-22 21:04:21');
INSERT INTO `a_operation_log`
VALUES (1199, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'Camera Rolla5c27d1ed21b0ef41bd5c8b98b8e46da81cb38db9088.jpeg', 'POST',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 255,
        '2023-04-22 21:04:21');
INSERT INTO `a_operation_log`
VALUES (1200, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'Camera Rolle88a49bccde359f0cabb40db83ba6080.jpeg', 'POST',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 295,
        '2023-04-22 21:04:21');
INSERT INTO `a_operation_log`
VALUES (1201, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', '52160128366307220761613884222797.jpg', 'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 171, '2023-04-22 21:04:21');
INSERT INTO `a_operation_log`
VALUES (1202, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', '52160128366307220761613884254858.jpg', 'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 128, '2023-04-22 21:04:21');
INSERT INTO `a_operation_log`
VALUES (1203, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'Camera Roll1e8a95a949f438c8.jpg', 'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1,
        'Vhans', '192.168.244.1', '内网IP|内网IP', 89, '2023-04-22 21:04:21');
INSERT INTO `a_operation_log`
VALUES (1204, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'Camera Roll887CCD8EAF723CA8A696668FD25B5C65.jpg', 'POST',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 91,
        '2023-04-22 21:04:22');
INSERT INTO `a_operation_log`
VALUES (1205, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'Camera Roll339C44566AEDB43FADE7E4F44C6485E0.jpg', 'POST',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 92,
        '2023-04-22 21:04:22');
INSERT INTO `a_operation_log`
VALUES (1206, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', '52160128366307220761613884638434.jpg', 'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 93, '2023-04-22 21:04:22');
INSERT INTO `a_operation_log`
VALUES (1207, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'Camera Roll5846FF5CA568FCA4DF07E362C4A37ADA.jpg', 'POST',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 96,
        '2023-04-22 21:04:22');
INSERT INTO `a_operation_log`
VALUES (1208, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'Camera Roll1594706395236.jpeg', 'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1,
        'Vhans', '192.168.244.1', '内网IP|内网IP', 91, '2023-04-22 21:04:22');
INSERT INTO `a_operation_log`
VALUES (1209, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'Camera Roll995D37FA1456024E2A75B6E4E8B417A1.jpg', 'POST',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 103,
        '2023-04-22 21:04:23');
INSERT INTO `a_operation_log`
VALUES (1210, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'Camera RollA47F60763F2C0F251F2AB4D0B52A8E9B.jpg', 'POST',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 88,
        '2023-04-22 21:04:24');
INSERT INTO `a_operation_log`
VALUES (1211, '文件模块', '添加', '/admin/file/createFolder', 'com.vhans.aapi.controller.FileController.createFolder',
        '创建目录', '[{\"fileName\":\"videos\",\"filePath\":\"/\"}]', 'POST',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 529,
        '2023-04-23 00:02:12');
INSERT INTO `a_operation_log`
VALUES (1212, '文件模块', '上传', '/admin/file/upload', 'com.vhans.aapi.controller.FileController.uploadFile',
        '上传文件', 'VID20230115110816.mp4', 'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans',
        '192.168.244.1', '内网IP|内网IP', 433, '2023-04-23 00:10:07');
INSERT INTO `a_operation_log`
VALUES (1213, '记录模块', '删除', '/admin/agreeRecord/delete', 'com.vhans.aapi.controller.AgreeRecordController.deleteRecord',
        '删除记录', '[[2]]', 'DELETE', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1',
        '内网IP|内网IP', 718, '2023-04-25 07:44:01');
INSERT INTO `a_operation_log`
VALUES (1214, '记录模块', '修改', '/admin/agreeRecord/recycle',
        'com.vhans.aapi.controller.AgreeRecordController.updateRecordDelete', '回收或恢复记录',
        '[{\"idList\":[5],\"isDelete\":1}]', 'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans',
        '192.168.244.1', '内网IP|内网IP', 264, '2023-04-25 07:47:21');
INSERT INTO `a_operation_log`
VALUES (1215, '记录模块', '修改', '/admin/agreeRecord/recycle',
        'com.vhans.aapi.controller.AgreeRecordController.updateRecordDelete', '回收或恢复记录',
        '[{\"idList\":[5],\"isDelete\":0}]', 'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans',
        '192.168.244.1', '内网IP|内网IP', 216, '2023-04-25 07:47:31');
INSERT INTO `a_operation_log`
VALUES (1216, '记录模块', '修改', '/admin/agreeRecord/top', 'com.vhans.aapi.controller.AgreeRecordController.updateRecordTop',
        '置顶记录', '[{\"id\":5,\"isTop\":1}]', 'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans',
        '192.168.244.1', '内网IP|内网IP', 80, '2023-04-25 07:51:07');
INSERT INTO `a_operation_log`
VALUES (1217, '记录模块', '修改', '/admin/agreeRecord/top', 'com.vhans.aapi.controller.AgreeRecordController.updateRecordTop',
        '置顶记录', '[{\"id\":5,\"isTop\":0}]', 'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans',
        '192.168.244.1', '内网IP|内网IP', 83, '2023-04-25 07:51:09');
INSERT INTO `a_operation_log`
VALUES (1218, '记录模块', '修改', '/admin/agreeRecord/recycle',
        'com.vhans.aapi.controller.AgreeRecordController.updateRecordDelete', '回收或恢复记录',
        '[{\"idList\":[5],\"isDelete\":1}]', 'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans',
        '192.168.244.1', '内网IP|内网IP', 204, '2023-04-25 08:03:09');
INSERT INTO `a_operation_log`
VALUES (1219, '记录模块', '修改', '/admin/agreeRecord/recycle',
        'com.vhans.aapi.controller.AgreeRecordController.updateRecordDelete', '回收或恢复记录',
        '[{\"idList\":[5],\"isDelete\":0}]', 'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans',
        '192.168.244.1', '内网IP|内网IP', 203, '2023-04-25 08:03:40');
INSERT INTO `a_operation_log`
VALUES (1220, '记录模块', '修改', '/admin/agreeRecord/recycle',
        'com.vhans.aapi.controller.AgreeRecordController.updateRecordDelete', '回收或恢复记录',
        '[{\"idList\":[5],\"isDelete\":1}]', 'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans',
        '192.168.244.1', '内网IP|内网IP', 177, '2023-04-25 08:24:44');
INSERT INTO `a_operation_log`
VALUES (1221, '标签模块', '添加', '/admin/tag/add', 'com.vhans.aapi.controller.TagController.addTag', '添加标签',
        '[{\"tagName\":\"约会\"}]', 'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans',
        '192.168.244.1', '内网IP|内网IP', 447, '2023-04-25 09:11:49');
INSERT INTO `a_operation_log`
VALUES (1222, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片', 'agree.png', 'POST',
        '{\"code\":200,\"data\":\"https://uplaod.vhans.cloud/agreeRecord/image/da0704299c44631a6ca09dc941a545eb.png\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 900, '2023-04-25 14:19:06');
INSERT INTO `a_operation_log`
VALUES (1223, '记录模块', '删除', '/admin/agreeRecord/delete', 'com.vhans.aapi.controller.AgreeRecordController.deleteRecord',
        '删除记录', '[[6]]', 'DELETE', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1',
        '内网IP|内网IP', 1065, '2023-04-25 15:26:14');
INSERT INTO `a_operation_log`
VALUES (1224, '记录模块', '添加', '/admin/agreeRecord/add', 'com.vhans.aapi.controller.AgreeRecordController.addRecord',
        '添加记录',
        '[{\"content\":\"嘉兴学院\",\"cover\":\"\",\"isRecommend\":0,\"isTop\":0,\"status\":1,\"tagNameList\":[],\"title\":\"2023-04-25\",\"type\":1,\"userId\":1}]',
        'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 2880,
        '2023-04-25 15:41:08');
INSERT INTO `a_operation_log`
VALUES (1225, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片', 'admin.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://uplaod.vhans.cloud/agreeRecord/image/2fc6dcedd9a62c51b8bddcc4f545d270.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 147, '2023-04-25 15:42:49');
INSERT INTO `a_operation_log`
VALUES (1226, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片', 'admin.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://uplaod.vhans.cloud/agreeRecord/image/2fc6dcedd9a62c51b8bddcc4f545d270.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 87347, '2023-04-25 15:51:03');
INSERT INTO `a_operation_log`
VALUES (1227, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片', 'admin.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/2fc6dcedd9a62c51b8bddcc4f545d270.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 2311, '2023-04-25 15:55:12');
INSERT INTO `a_operation_log`
VALUES (1228, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片', 'admin.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/2fc6dcedd9a62c51b8bddcc4f545d270.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 705, '2023-04-25 16:00:58');
INSERT INTO `a_operation_log`
VALUES (1229, '记录模块', '添加', '/admin/agreeRecord/add', 'com.vhans.aapi.controller.AgreeRecordController.addRecord',
        '添加记录',
        '[{\"content\":\"esgrghjh\",\"cover\":\"\",\"isRecommend\":0,\"isTop\":0,\"status\":1,\"tagNameList\":[],\"title\":\"asfa safas\",\"type\":1,\"userId\":1}]',
        'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 321,
        '2023-04-25 16:10:37');
INSERT INTO `a_operation_log`
VALUES (1230, '记录模块', '添加', '/admin/agreeRecord/add', 'com.vhans.aapi.controller.AgreeRecordController.addRecord',
        '添加记录',
        '[{\"content\":\"额发生\",\"cover\":\"\",\"isRecommend\":0,\"isTop\":0,\"status\":1,\"tagNameList\":[],\"title\":\"2023-04-25\",\"type\":1,\"userId\":1}]',
        'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 296,
        '2023-04-25 16:17:50');
INSERT INTO `a_operation_log`
VALUES (1231, '记录模块', '添加', '/admin/agreeRecord/add', 'com.vhans.aapi.controller.AgreeRecordController.addRecord',
        '添加记录',
        '[{\"content\":\"的不下班\",\"cover\":\"\",\"isRecommend\":0,\"isTop\":0,\"status\":1,\"tagNameList\":[],\"title\":\"2023-04-25\",\"type\":1,\"userId\":1}]',
        'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 277,
        '2023-04-25 16:18:10');
INSERT INTO `a_operation_log`
VALUES (1232, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片', 'admin.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/3343e13d2426e268352fb80b51bf7113.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1430, '2023-04-25 17:10:01');
INSERT INTO `a_operation_log`
VALUES (1233, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片', 'admin.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/3343e13d2426e268352fb80b51bf7113.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 668, '2023-04-25 17:12:44');
INSERT INTO `a_operation_log`
VALUES (1234, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片', 'admin.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/3343e13d2426e268352fb80b51bf7113.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 655, '2023-04-25 17:12:53');
INSERT INTO `a_operation_log`
VALUES (1235, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片', 'admin.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/3343e13d2426e268352fb80b51bf7113.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 656, '2023-04-25 17:13:12');
INSERT INTO `a_operation_log`
VALUES (1236, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片', 'admin.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/3343e13d2426e268352fb80b51bf7113.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 449, '2023-04-25 17:14:05');
INSERT INTO `a_operation_log`
VALUES (1237, '记录模块', '添加', '/admin/agreeRecord/add', 'com.vhans.aapi.controller.AgreeRecordController.addRecord',
        '添加记录',
        '[{\"content\":\"测试内容\",\"cover\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/3343e13d2426e268352fb80b51bf7113.jpg\",\"isRecommend\":0,\"isTop\":0,\"status\":1,\"tagNameList\":[],\"title\":\"测试\",\"type\":1,\"userId\":1}]',
        'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 271,
        '2023-04-25 17:14:22');
INSERT INTO `a_operation_log`
VALUES (1238, '记录模块', '删除', '/admin/agreeRecord/delete', 'com.vhans.aapi.controller.AgreeRecordController.deleteRecord',
        '删除记录', '[[13]]', 'DELETE', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans',
        '192.168.244.1', '内网IP|内网IP', 186, '2023-04-25 17:14:30');
INSERT INTO `a_operation_log`
VALUES (1239, '记录模块', '删除', '/admin/agreeRecord/delete', 'com.vhans.aapi.controller.AgreeRecordController.deleteRecord',
        '删除记录', '[[12,11,10]]', 'DELETE', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans',
        '192.168.244.1', '内网IP|内网IP', 188, '2023-04-25 17:14:39');
INSERT INTO `a_operation_log`
VALUES (1240, '记录模块', '修改', '/admin/agreeRecord/update', 'com.vhans.aapi.controller.AgreeRecordController.updateRecord',
        '修改记录',
        '[{\"content\":\"test\",\"cover\":\"http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg\",\"id\":4,\"isRecommend\":1,\"isTop\":0,\"status\":1,\"tagNameList\":[],\"title\":\"competition\",\"type\":3,\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 603,
        '2023-04-25 22:00:10');
INSERT INTO `a_operation_log`
VALUES (1241, '管理员模块', '修改', '/admin/admin/update', 'com.vhans.aapi.controller.AdminController.updateAdmin',
        '修改管理员', '[{\"id\":2,\"nickname\":\"测试账号\",\"roleIdList\":[\"3\"]}]', 'PUT',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 241,
        '2023-04-25 23:15:34');
INSERT INTO `a_operation_log`
VALUES (1242, '管理员模块', '修改', '/admin/admin/update', 'com.vhans.aapi.controller.AdminController.updateAdmin',
        '修改管理员', '[{\"id\":3,\"nickname\":\"Clouds\",\"roleIdList\":[\"1\"]}]', 'PUT',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 214,
        '2023-04-25 23:15:41');
INSERT INTO `a_operation_log`
VALUES (1243, '管理员模块', '修改', '/admin/admin/update', 'com.vhans.aapi.controller.AdminController.updateAdmin',
        '修改管理员', '[{\"id\":4,\"nickname\":\"gxr\",\"roleIdList\":[\"1\"]}]', 'PUT',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 200,
        '2023-04-25 23:15:46');
INSERT INTO `a_operation_log`
VALUES (1244, '角色模块', '修改', '/admin/role/update', 'com.vhans.aapi.controller.RoleController.updateRole',
        '修改角色',
        '[{\"id\":\"3\",\"isDisable\":0,\"menuIdList\":[1,12,101,102,103,104,105,106,107,108,109,13,111,112,113,14,2,17,18,19,3,21,144,22,154,23,164,24,174,4,26,184,27,28,205,29,5,31,32,33,34,6,36,37,38,39,7,41,42],\"roleDesc\":\"测试账号\",\"roleName\":\"test\"}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1000,
        '2023-04-25 23:33:31');
INSERT INTO `a_operation_log`
VALUES (1245, '网站配置模块', '修改', '/admin/site/update',
        'com.vhans.aapi.controller.SiteConfigController.updateSiteConfig', '更新网站配置',
        '[{\"aboutMe\":\"🍀个人简介\\n\\n想进大厂的小白\\n\\n感谢大佬们的开源精神💖\",\"aliCode\":\"https://static.ttkwsd.top/config/f0be9dc73e230d8821179b9303a9ff49.jpg\",\"authorAvatar\":\"https://static.ttkwsd.top/config/05409c1ed50047535f28a40464f7b1ab.jpg\",\"bilibili\":\"https://space.bilibili.com/505715511\",\"commentCheck\":0,\"cover\":\"https://static.ttkwsd.top/config/d6a00d059a1e9729e763469deb4870df.jpg\",\"createSiteTime\":\"2022-08-25\",\"emailNotice\":1,\"gitee\":\"https://gitee.com/wu_shengdong\",\"github\":\"https://github.com/ICAN1999\",\"id\":1,\"isMusic\":1,\"isReward\":1,\"loginList\":\",gitee,github\",\"musicId\":\"7611185981\",\"qq\":\"2873585297\",\"quizCheck\":0,\"recordNumber\":\"浙ICP备2023009806号\",\"siteAddress\":\"https://www.vhans.cloud\",\"siteAuthor\":\"Vhans\",\"siteIntro\":\"网站介绍\",\"siteName\":\"Hello World\",\"siteNotice\":\"欢迎同学们加入三缺一,也积极欢迎同学们推荐给其他同学\",\"socialList\":\"gitee,bilibili,github,qq\",\"touristAvatar\":\"https://static.ttkwsd.top/config/0bca52afdb2b9998132355d716390c9f.png\",\"userAvatar\":\"https://static.ttkwsd.top/config/7b6f25adc2b9627b8918176888bee3b5.png\",\"weiXinCode\":\"https://static.ttkwsd.top/config/994a286571b002e93281899cb402bd15.png\"}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1234,
        '2023-04-26 09:19:47');
INSERT INTO `a_operation_log`
VALUES (1246, '网站配置模块', '修改', '/admin/site/update',
        'com.vhans.aapi.controller.SiteConfigController.updateSiteConfig', '更新网站配置',
        '[{\"aboutMe\":\"🍀个人简介\\n\\n想进大厂的小白\\n\\n感谢大佬们的开源精神💖\",\"aliCode\":\"https://static.ttkwsd.top/config/f0be9dc73e230d8821179b9303a9ff49.jpg\",\"authorAvatar\":\"https://static.ttkwsd.top/config/05409c1ed50047535f28a40464f7b1ab.jpg\",\"bilibili\":\"https://space.bilibili.com/505715511\",\"commentCheck\":0,\"cover\":\"https://static.ttkwsd.top/config/d6a00d059a1e9729e763469deb4870df.jpg\",\"createSiteTime\":\"2023-04-10\",\"emailNotice\":1,\"gitee\":\"https://gitee.com/wu_shengdong\",\"github\":\"https://github.com/ICAN1999\",\"id\":1,\"isMusic\":1,\"isReward\":1,\"loginList\":\",gitee,github\",\"musicId\":\"7611185981\",\"qq\":\"2873585297\",\"quizCheck\":0,\"recordNumber\":\"浙ICP备2023009806号\",\"siteAddress\":\"https://www.vhans.cloud\",\"siteAuthor\":\"Vhans\",\"siteIntro\":\"网站介绍\",\"siteName\":\"Hello World\",\"siteNotice\":\"欢迎同学们加入三缺一,也积极欢迎同学们推荐给其他同学\",\"socialList\":\"gitee,bilibili,github,qq\",\"touristAvatar\":\"https://static.ttkwsd.top/config/0bca52afdb2b9998132355d716390c9f.png\",\"userAvatar\":\"https://static.ttkwsd.top/config/7b6f25adc2b9627b8918176888bee3b5.png\",\"weiXinCode\":\"https://static.ttkwsd.top/config/994a286571b002e93281899cb402bd15.png\"}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 269,
        '2023-04-26 09:20:00');
INSERT INTO `a_operation_log`
VALUES (1247, '记录模块', '添加', '/admin/agreeRecord/add', 'com.vhans.aapi.controller.AgreeRecordController.addRecord',
        '添加记录',
        '[{\"content\":\"好烦接口\",\"cover\":\"\",\"isRecommend\":0,\"isTop\":0,\"status\":1,\"tagNameList\":[],\"title\":\"test\",\"type\":1,\"userId\":1}]',
        'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 394,
        '2023-04-26 14:31:43');
INSERT INTO `a_operation_log`
VALUES (1248, '记录模块', '修改', '/admin/agreeRecord/recommend',
        'com.vhans.aapi.controller.AgreeRecordController.updateRecordRecommend', '推荐记录',
        '[{\"id\":4,\"isRecommend\":0}]', 'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans',
        '192.168.244.1', '内网IP|内网IP', 100, '2023-04-26 14:48:06');
INSERT INTO `a_operation_log`
VALUES (1249, '管理员模块', '修改', '/admin/admin/update', 'com.vhans.aapi.controller.AdminController.updateAdmin',
        '修改管理员', '[{\"id\":5,\"nickname\":\"cs\",\"roleIdList\":[\"1\"]}]', 'PUT',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 794,
        '2023-04-30 19:27:06');
INSERT INTO `a_operation_log`
VALUES (1250, '管理员模块', '修改', '/admin/admin/update', 'com.vhans.aapi.controller.AdminController.updateAdmin',
        '修改管理员', '[{\"id\":6,\"nickname\":\"myt\",\"roleIdList\":[\"1\"]}]', 'PUT',
        '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 166,
        '2023-04-30 19:27:10');
INSERT INTO `a_operation_log`
VALUES (1251, '题目模块', '上传', '/admin/quizImage/upload', 'com.vhans.aapi.controller.QuizController.saveQuizImages',
        '上传题目图片', '62d13541a290bb9a.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/864a4e503bc6abeaf217e0285084af3b.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 2133, '2023-04-30 20:23:51');
INSERT INTO `a_operation_log`
VALUES (1252, '记录模块', '修改', '/admin/agreeRecord/update', 'com.vhans.aapi.controller.AgreeRecordController.updateRecord',
        '修改记录',
        '[{\"content\":\"吃饭\",\"cover\":\"https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg\",\"id\":32,\"isRecommend\":0,\"isTop\":1,\"status\":1,\"tagNameList\":[],\"title\":\"约饭\",\"type\":3,\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 242,
        '2023-04-30 21:03:44');
INSERT INTO `a_operation_log`
VALUES (1253, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"如何看待“年轻的时候需要的是朋友而不是人脉”？\",\"id\":24,\"images\":\"https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg\",\"tagNameList\":[],\"title\":\"人脉和朋友\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 566,
        '2023-04-30 22:03:01');
INSERT INTO `a_operation_log`
VALUES (1254, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"如何看待“年轻的时候需要的是朋友而不是人脉”？\",\"id\":24,\"images\":\"https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg\",\"tagNameList\":[\"友情\"],\"title\":\"人脉和朋友\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 195,
        '2023-04-30 22:03:09');
INSERT INTO `a_operation_log`
VALUES (1255, '题目模块', '上传', '/admin/quizImage/upload', 'com.vhans.aapi.controller.QuizController.saveQuizImages',
        '上传题目图片', '-97bd2425d24c034.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/306b946209c9250899912d1f357d4938.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1779, '2023-04-30 22:20:08');
INSERT INTO `a_operation_log`
VALUES (1256, '题目模块', '上传', '/admin/quizImage/upload', 'com.vhans.aapi.controller.QuizController.saveQuizImages',
        '上传题目图片', '-97bd2425d24c034.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/306b946209c9250899912d1f357d4938.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 2442, '2023-04-30 22:57:30');
INSERT INTO `a_operation_log`
VALUES (1257, '题目模块', '上传', '/admin/quizImage/upload', 'com.vhans.aapi.controller.QuizController.saveQuizImages',
        '上传题目图片', '-97bd2425d24c034.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/306b946209c9250899912d1f357d4938.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 565, '2023-04-30 23:00:11');
INSERT INTO `a_operation_log`
VALUES (1258, '题目模块', '上传', '/admin/quizImage/upload', 'com.vhans.aapi.controller.QuizController.saveQuizImages',
        '上传题目图片', 'Camera Roll887CCD8EAF723CA8A696668FD25B5C65.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/59ade72e4013a5edd6ba9578cbbc2b62.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1244, '2023-04-30 23:00:22');
INSERT INTO `a_operation_log`
VALUES (1259, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"如何看待“年轻的时候需要的是朋友而不是人脉”？\",\"id\":24,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/306b946209c9250899912d1f357d4938.jpg\\\",\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/59ade72e4013a5edd6ba9578cbbc2b62.jpg\\\"]\",\"tagNameList\":[],\"title\":\"人脉和朋友\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 366,
        '2023-04-30 23:01:44');
INSERT INTO `a_operation_log`
VALUES (1260, '题目模块', '上传', '/admin/quizImage/upload', 'com.vhans.aapi.controller.QuizController.saveQuizImages',
        '上传题目图片', 'Camera Roll339C44566AEDB43FADE7E4F44C6485E0.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/ca79bee637b2bfc9d274680df803f09d.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1818, '2023-04-30 23:08:10');
INSERT INTO `a_operation_log`
VALUES (1261, '题目模块', '上传', '/admin/quizImage/upload', 'com.vhans.aapi.controller.QuizController.saveQuizImages',
        '上传题目图片', '-42a831c7f07921a8.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/378d3d4d7e1c7696cbb7d0709538798f.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1690, '2023-04-30 23:08:16');
INSERT INTO `a_operation_log`
VALUES (1262, '题目模块', '上传', '/admin/quizImage/upload', 'com.vhans.aapi.controller.QuizController.saveQuizImages',
        '上传题目图片', '-319a42e66d375d07.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/662fab35bcce964bfe0d1d9e14229774.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1164, '2023-04-30 23:08:25');
INSERT INTO `a_operation_log`
VALUES (1263, '题目模块', '上传', '/admin/quizImage/upload', 'com.vhans.aapi.controller.QuizController.saveQuizImages',
        '上传题目图片', 'Camera Roll995D37FA1456024E2A75B6E4E8B417A1.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1308, '2023-04-30 23:08:31');
INSERT INTO `a_operation_log`
VALUES (1264, '题目模块', '上传', '/admin/quizImage/upload', 'com.vhans.aapi.controller.QuizController.saveQuizImages',
        '上传题目图片', '-42a831c7f07921a8.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/378d3d4d7e1c7696cbb7d0709538798f.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 645, '2023-04-30 23:16:01');
INSERT INTO `a_operation_log`
VALUES (1265, '题目模块', '上传', '/admin/quizImage/upload', 'com.vhans.aapi.controller.QuizController.saveQuizImages',
        '上传题目图片', 'Camera Roll995D37FA1456024E2A75B6E4E8B417A1.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 958, '2023-04-30 23:16:06');
INSERT INTO `a_operation_log`
VALUES (1266, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"如何看待“年轻的时候需要的是朋友而不是人脉”？\",\"id\":24,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/378d3d4d7e1c7696cbb7d0709538798f.jpg\\\",\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\\\"]\",\"tagNameList\":[],\"title\":\"人脉和朋友\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 274,
        '2023-04-30 23:16:55');
INSERT INTO `a_operation_log`
VALUES (1267, '题目模块', '上传', '/admin/quizImage/upload', 'com.vhans.aapi.controller.QuizController.saveQuizImages',
        '上传题目图片', 'Camera Roll887CCD8EAF723CA8A696668FD25B5C65.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/59ade72e4013a5edd6ba9578cbbc2b62.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 401, '2023-04-30 23:17:02');
INSERT INTO `a_operation_log`
VALUES (1268, '题目模块', '上传', '/admin/quizImage/upload', 'com.vhans.aapi.controller.QuizController.saveQuizImages',
        '上传题目图片', 'Camera Roll995D37FA1456024E2A75B6E4E8B417A1.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 676, '2023-04-30 23:17:07');
INSERT INTO `a_operation_log`
VALUES (1269, '题目模块', '上传', '/admin/quizImage/upload', 'com.vhans.aapi.controller.QuizController.saveQuizImages',
        '上传题目图片', 'Camera Roll339C44566AEDB43FADE7E4F44C6485E0.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/ca79bee637b2bfc9d274680df803f09d.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 910, '2023-04-30 23:20:02');
INSERT INTO `a_operation_log`
VALUES (1270, '题目模块', '上传', '/admin/quizImage/upload', 'com.vhans.aapi.controller.QuizController.saveQuizImages',
        '上传题目图片', 'Camera Roll339C44566AEDB43FADE7E4F44C6485E0.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/ca79bee637b2bfc9d274680df803f09d.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 665, '2023-04-30 23:20:14');
INSERT INTO `a_operation_log`
VALUES (1271, '题目模块', '上传', '/admin/quizImage/upload', 'com.vhans.aapi.controller.QuizController.saveQuizImages',
        '上传题目图片', '-97bd2425d24c034.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/306b946209c9250899912d1f357d4938.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1034, '2023-04-30 23:51:11');
INSERT INTO `a_operation_log`
VALUES (1272, '题目模块', '上传', '/admin/quizImage/upload', 'com.vhans.aapi.controller.QuizController.saveQuizImages',
        '上传题目图片', '52160128366307220761613884254858.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/fa66d26ea9f224095feef2db32975386.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1931, '2023-04-30 23:51:19');
INSERT INTO `a_operation_log`
VALUES (1273, '题目模块', '添加', '/admin/quiz/add', 'com.vhans.aapi.controller.QuizController.addQuiz', '添加题目',
        '[{\"content\":\"test\",\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/306b946209c9250899912d1f357d4938.jpg\\\",\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/fa66d26ea9f224095feef2db32975386.jpg\\\"]\",\"tagNameList\":[],\"title\":\"test\",\"userId\":1}]',
        'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 731,
        '2023-04-30 23:51:22');
INSERT INTO `a_operation_log`
VALUES (1274, '题目模块', '删除', '/admin/quiz/delete', 'com.vhans.aapi.controller.QuizController.deleteQuiz',
        '删除题目', '[[25]]', 'DELETE', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans',
        '192.168.244.1', '内网IP|内网IP', 450, '2023-04-30 23:51:50');
INSERT INTO `a_operation_log`
VALUES (1275, '题目模块', '上传', '/admin/quizImage/upload', 'com.vhans.aapi.controller.QuizController.saveQuizImages',
        '上传题目图片', 'Camera Rollimg-16148132354263c47f8f5cf25c610dae5df53c71459a9.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/988e83dae0ed1fa784c73eaf9320936e.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 2200, '2023-04-30 23:59:34');
INSERT INTO `a_operation_log`
VALUES (1276, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"情商不高的例子有哪些？\",\"id\":21,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/988e83dae0ed1fa784c73eaf9320936e.jpg\\\"]\",\"tagNameList\":[\"人文\"],\"title\":\"情商\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 730,
        '2023-05-01 00:00:23');
INSERT INTO `a_operation_log`
VALUES (1277, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"有哪些道理是你读了不信，听不进去，直到你亲身经历方笃信不疑的？\",\"id\":23,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\\\"]\",\"tagNameList\":[\"哲理\"],\"title\":\"道理\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 655,
        '2023-05-01 00:01:02');
INSERT INTO `a_operation_log`
VALUES (1278, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"当你发现做一件事的最佳时期已经过了，还应该再去做吗？\",\"id\":22,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\\\"]\",\"tagNameList\":[],\"title\":\"最佳时期\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 582,
        '2023-05-01 00:01:22');
INSERT INTO `a_operation_log`
VALUES (1279, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"恋爱半年，女朋友觉得没有了开始时的新鲜感，怎么办？\",\"id\":20,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\\\"]\",\"tagNameList\":[\"情义\"],\"title\":\"新鲜感没有了怎么办\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 656,
        '2023-05-01 00:01:55');
INSERT INTO `a_operation_log`
VALUES (1280, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"你在生活中得到过的最好的建议是什么？\",\"id\":18,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/378d3d4d7e1c7696cbb7d0709538798f.jpg\\\",\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\\\"]\",\"tagNameList\":[],\"title\":\"建议\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 562,
        '2023-05-01 00:02:09');
INSERT INTO `a_operation_log`
VALUES (1281, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"最能燃起你学习激情的一句话是什么？\",\"id\":19,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\\\"]\",\"tagNameList\":[],\"title\":\"最激励的话\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 634,
        '2023-05-01 00:02:23');
INSERT INTO `a_operation_log`
VALUES (1282, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"你在生活中得到过的最好的建议是什么？\",\"id\":18,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/378d3d4d7e1c7696cbb7d0709538798f.jpg\\\",\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\\\"]\",\"tagNameList\":[],\"title\":\"建议\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 614,
        '2023-05-01 00:02:35');
INSERT INTO `a_operation_log`
VALUES (1283, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"科学和迷信的分界点是哪里？\",\"id\":17,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\\\"]\",\"tagNameList\":[],\"title\":\"科学与迷信\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 592,
        '2023-05-01 00:02:48');
INSERT INTO `a_operation_log`
VALUES (1284, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"什么叫见过大世面？\",\"id\":16,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/378d3d4d7e1c7696cbb7d0709538798f.jpg\\\",\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\\\"]\",\"tagNameList\":[],\"title\":\"大世面\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 593,
        '2023-05-01 00:02:59');
INSERT INTO `a_operation_log`
VALUES (1285, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"向喜欢的女生表白被拒绝了，还是喜欢她，怎么办？\",\"id\":15,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/378d3d4d7e1c7696cbb7d0709538798f.jpg\\\",\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\\\"]\",\"tagNameList\":[],\"title\":\"表白之后\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 575,
        '2023-05-01 00:03:08');
INSERT INTO `a_operation_log`
VALUES (1286, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"你最困难的时候选择过放弃吗？\",\"id\":14,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\\\"]\",\"tagNameList\":[],\"title\":\"困难\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 597,
        '2023-05-01 00:03:30');
INSERT INTO `a_operation_log`
VALUES (1287, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"你遇到过哪些让你眼前一亮、醍醐灌顶或对你改变很大的理念？\",\"id\":12,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\\\"]\",\"tagNameList\":[],\"title\":\"理念\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 593,
        '2023-05-01 00:03:47');
INSERT INTO `a_operation_log`
VALUES (1288, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"人这一生为什么要努力？\",\"id\":13,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\\\"]\",\"tagNameList\":[],\"title\":\"为什么要努力\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 576,
        '2023-05-01 00:04:02');
INSERT INTO `a_operation_log`
VALUES (1289, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"要怎样努力，才能成为很厉害的人？\",\"id\":11,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\\\"]\",\"tagNameList\":[],\"title\":\"怎么努力\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 585,
        '2023-05-01 00:04:18');
INSERT INTO `a_operation_log`
VALUES (1290, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"如何看待“年轻时就释怀与淡泊，是没有希望的”这句话？\",\"id\":10,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\\\"]\",\"tagNameList\":[],\"title\":\"年轻\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 581,
        '2023-05-01 00:04:39');
INSERT INTO `a_operation_log`
VALUES (1291, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"同样是别人比自己强，为什么有时会产生嫉妒心理，而有时会产生崇拜？\",\"id\":8,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\\\"]\",\"tagNameList\":[],\"title\":\"为什么会嫉妒\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 575,
        '2023-05-01 00:05:00');
INSERT INTO `a_operation_log`
VALUES (1292, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"二十六岁，工作三年却将留学三年，值得吗？\",\"id\":9,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\\\"]\",\"tagNameList\":[],\"title\":\"留学\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 538,
        '2023-05-01 00:05:18');
INSERT INTO `a_operation_log`
VALUES (1293, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"你对自由的理解是什么？\",\"id\":7,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\\\"]\",\"tagNameList\":[],\"title\":\"自由\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 591,
        '2023-05-01 00:05:37');
INSERT INTO `a_operation_log`
VALUES (1294, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"苦难有什么价值？\",\"id\":6,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\\\"]\",\"tagNameList\":[],\"title\":\"苦难\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 558,
        '2023-05-01 00:05:53');
INSERT INTO `a_operation_log`
VALUES (1295, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"你心中的完美爱情是怎么样的？\",\"id\":5,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\\\"]\",\"tagNameList\":[],\"title\":\"爱情\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 544,
        '2023-05-01 00:06:08');
INSERT INTO `a_operation_log`
VALUES (1296, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"把学费拿来念书还是环游世界更合适？为什么？\",\"id\":4,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\\\"]\",\"tagNameList\":[],\"title\":\"念书更重要吗\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 529,
        '2023-05-01 00:06:53');
INSERT INTO `a_operation_log`
VALUES (1297, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"怎么反驳“你行你上啊”的逻辑？\",\"id\":3,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\\\"]\",\"tagNameList\":[],\"title\":\"回怼\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 562,
        '2023-05-01 00:07:06');
INSERT INTO `a_operation_log`
VALUES (1298, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"做哪些事情可以提升生活品质？\",\"id\":2,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\\\"]\",\"tagNameList\":[],\"title\":\"生活品质\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 651,
        '2023-05-01 00:07:18');
INSERT INTO `a_operation_log`
VALUES (1299, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"交朋友的标准是什么？\",\"id\":1,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\\\"]\",\"tagNameList\":[],\"title\":\"交朋友\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 652,
        '2023-05-01 00:07:30');
INSERT INTO `a_operation_log`
VALUES (1300, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片', '-42a831c7f07921a8.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/378d3d4d7e1c7696cbb7d0709538798f.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 2096, '2023-05-01 00:14:54');
INSERT INTO `a_operation_log`
VALUES (1301, '题目模块', '上传', '/admin/quizImage/upload', 'com.vhans.aapi.controller.QuizController.saveQuizImages',
        '上传题目图片', 'img-1618272520307fbefa6b05379a9918900ce51a6ff3ab0.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/85902ff1273548827014398faa50835a.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1542, '2023-05-01 09:42:14');
INSERT INTO `a_operation_log`
VALUES (1302, '题目模块', '上传', '/admin/quizImage/upload', 'com.vhans.aapi.controller.QuizController.saveQuizImages',
        '上传题目图片', 'img-1618272520307fbefa6b05379a9918900ce51a6ff3ab0.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/85902ff1273548827014398faa50835a.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 809, '2023-05-01 09:44:21');
INSERT INTO `a_operation_log`
VALUES (1303, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1618103506002a70f03c6f7ab9a41a14c5211103816e3.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/0357babdb438ed09d39324f52f1cf6f6.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 30519, '2023-05-01 09:49:34');
INSERT INTO `a_operation_log`
VALUES (1304, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1618790427978d7572c10ef3c26a20bbebf2afa84002a.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/3703320c1d11a84e5f81ec5491b5f479.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1240, '2023-05-01 09:49:53');
INSERT INTO `a_operation_log`
VALUES (1305, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1618103506002a70f03c6f7ab9a41a14c5211103816e3.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/0357babdb438ed09d39324f52f1cf6f6.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 422, '2023-05-01 09:51:25');
INSERT INTO `a_operation_log`
VALUES (1306, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1621149429867f9cc76d0d6f11696a045b12dac98713d.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/7dc388c70dcf3fa93c1c54942dd8644f.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1276, '2023-05-01 09:51:43');
INSERT INTO `a_operation_log`
VALUES (1307, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1618790427978d7572c10ef3c26a20bbebf2afa84002a.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/3703320c1d11a84e5f81ec5491b5f479.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 698, '2023-05-01 09:52:48');
INSERT INTO `a_operation_log`
VALUES (1308, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1618103506002a70f03c6f7ab9a41a14c5211103816e3.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/0357babdb438ed09d39324f52f1cf6f6.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 2722, '2023-05-01 09:52:59');
INSERT INTO `a_operation_log`
VALUES (1309, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1618103506002a70f03c6f7ab9a41a14c5211103816e3.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/0357babdb438ed09d39324f52f1cf6f6.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 10558, '2023-05-01 09:53:37');
INSERT INTO `a_operation_log`
VALUES (1310, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-162114757828893d75071a62cbda00f5d9942915d5012.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/b7a9a9f1b412bcfd68eb91e0c0a52872.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 3588, '2023-05-01 09:54:06');
INSERT INTO `a_operation_log`
VALUES (1311, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1624000338183d82b1d4211a6f72446f11a0e82e48471.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/1235feeed7bf35b90bc3026e21b19fc7.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1008, '2023-05-01 09:54:38');
INSERT INTO `a_operation_log`
VALUES (1312, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1618103506002a70f03c6f7ab9a41a14c5211103816e3.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/0357babdb438ed09d39324f52f1cf6f6.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 516, '2023-05-01 09:56:52');
INSERT INTO `a_operation_log`
VALUES (1313, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1619571666439b6fcae4683fed482a5d5f709e69ddec1.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/848686a1da40e6e258f384d0e8350d5b.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 789, '2023-05-01 09:57:13');
INSERT INTO `a_operation_log`
VALUES (1314, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1618790427978d7572c10ef3c26a20bbebf2afa84002a.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/3703320c1d11a84e5f81ec5491b5f479.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 316, '2023-05-01 09:58:16');
INSERT INTO `a_operation_log`
VALUES (1315, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1621118331404c2c56d8fdf5bde766c54a75ed82170d7.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/95715da36ee97ce53e1d3c383fa58da0.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 960, '2023-05-01 09:58:20');
INSERT INTO `a_operation_log`
VALUES (1316, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1618103506002a70f03c6f7ab9a41a14c5211103816e3.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/0357babdb438ed09d39324f52f1cf6f6.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 298, '2023-05-01 09:58:23');
INSERT INTO `a_operation_log`
VALUES (1317, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1624000338183d82b1d4211a6f72446f11a0e82e48471.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/1235feeed7bf35b90bc3026e21b19fc7.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 327, '2023-05-01 09:58:26');
INSERT INTO `a_operation_log`
VALUES (1318, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1621118348239dbf548802b13a2ccae55ed4a11d69a70.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/24cbe045d1a471b5404f3a22e2f40387.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 577, '2023-05-01 09:58:30');
INSERT INTO `a_operation_log`
VALUES (1319, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1618103506002a70f03c6f7ab9a41a14c5211103816e3.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/0357babdb438ed09d39324f52f1cf6f6.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1109, '2023-05-01 10:02:11');
INSERT INTO `a_operation_log`
VALUES (1320, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1618790427978d7572c10ef3c26a20bbebf2afa84002a.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/3703320c1d11a84e5f81ec5491b5f479.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 612, '2023-05-01 10:02:16');
INSERT INTO `a_operation_log`
VALUES (1321, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1618272520307fbefa6b05379a9918900ce51a6ff3ab0.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/85902ff1273548827014398faa50835a.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 601, '2023-05-01 10:02:19');
INSERT INTO `a_operation_log`
VALUES (1322, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1621118348239dbf548802b13a2ccae55ed4a11d69a70.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/24cbe045d1a471b5404f3a22e2f40387.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 566, '2023-05-01 10:02:23');
INSERT INTO `a_operation_log`
VALUES (1323, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1621297259083bc8a078a8b6abb7a402f00666e2749f1.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/d4bbffcc8f8c51724e597108d8df0bc8.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 830, '2023-05-01 10:02:26');
INSERT INTO `a_operation_log`
VALUES (1324, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1618272520307fbefa6b05379a9918900ce51a6ff3ab0.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/85902ff1273548827014398faa50835a.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 434, '2023-05-01 10:02:31');
INSERT INTO `a_operation_log`
VALUES (1325, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1624000338183d82b1d4211a6f72446f11a0e82e48471.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/1235feeed7bf35b90bc3026e21b19fc7.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 572, '2023-05-01 10:04:59');
INSERT INTO `a_operation_log`
VALUES (1326, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1621149429867f9cc76d0d6f11696a045b12dac98713d.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/7dc388c70dcf3fa93c1c54942dd8644f.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 626, '2023-05-01 10:05:03');
INSERT INTO `a_operation_log`
VALUES (1327, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1621147582022dc73ebb2880194d7b39be07d65ac44c5.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/bc3756ad6766f2443f0525c2a4fc5ac1.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1113, '2023-05-01 10:05:07');
INSERT INTO `a_operation_log`
VALUES (1328, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1625828219285ae751241a032ef588ffc959567c7362d.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/db0a7fe25d21f260383170de2467a489.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 866, '2023-05-01 10:05:11');
INSERT INTO `a_operation_log`
VALUES (1329, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-16364413220175c55910465a9548c3036cae48a834cfc.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/03909dd0c035301aeab46629b526cfb0.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 769, '2023-05-01 10:05:16');
INSERT INTO `a_operation_log`
VALUES (1330, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-162089668127842a5a6a7a04f6d86b6a394397f5bb820.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/e5435710b250b5cf697d33f2fe762aa5.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1102, '2023-05-01 10:05:23');
INSERT INTO `a_operation_log`
VALUES (1331, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-16211494262981ca3fa3994adf27c07862daeabe7e3d8.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/f343ef0206d61099e7734f2b7ae72f76.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1020, '2023-05-01 10:05:28');
INSERT INTO `a_operation_log`
VALUES (1332, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-16187904129577db561041d9c67baa9b8c2b075e09e4b.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/619dd0d1cf9df3d96e9a01a08dc69607.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1032, '2023-05-01 10:05:33');
INSERT INTO `a_operation_log`
VALUES (1333, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-162129724205613c5a2d1d9f20326da5d61534f374152.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/ccd3a8c96c71d20cf9c1f37986f39199.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1156, '2023-05-01 10:05:37');
INSERT INTO `a_operation_log`
VALUES (1334, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-16203526300272710383a16aff96daaa3fa1036458e67.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/9069c24008cc24c7f95e30764f9f9fa4.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 669, '2023-05-01 10:05:46');
INSERT INTO `a_operation_log`
VALUES (1335, '记录模块', '上传', '/admin/recordVideo/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordVideo', '上传记录视频',
        '3760b2031ff41ca0bd80bc7a8a13f7bb_preview.mp4', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/316c7d1ec6d28ceec39431d99a0829e2.mp4\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 2272, '2023-05-01 10:09:45');
INSERT INTO `a_operation_log`
VALUES (1336, '记录模块', '上传', '/admin/recordVideo/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordVideo', '上传记录视频',
        '3760b2031ff41ca0bd80bc7a8a13f7bb_preview.mp4', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/316c7d1ec6d28ceec39431d99a0829e2.mp4\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 188401, '2023-05-01 10:17:00');
INSERT INTO `a_operation_log`
VALUES (1337, '记录模块', '上传', '/admin/recordVideo/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordVideo', '上传记录视频',
        '3760b2031ff41ca0bd80bc7a8a13f7bb_preview.mp4', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/316c7d1ec6d28ceec39431d99a0829e2.mp4\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 174172, '2023-05-01 10:22:31');
INSERT INTO `a_operation_log`
VALUES (1338, '记录模块', '上传', '/admin/recordVideo/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordVideo', '上传记录视频',
        '3760b2031ff41ca0bd80bc7a8a13f7bb_preview.mp4', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/316c7d1ec6d28ceec39431d99a0829e2.mp4\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 88164, '2023-05-01 10:27:38');
INSERT INTO `a_operation_log`
VALUES (1339, '记录模块', '上传', '/admin/recordVideo/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordVideo', '上传记录视频',
        '3760b2031ff41ca0bd80bc7a8a13f7bb_preview.mp4', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/316c7d1ec6d28ceec39431d99a0829e2.mp4\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 32522, '2023-05-01 10:35:14');
INSERT INTO `a_operation_log`
VALUES (1340, '记录模块', '上传', '/admin/recordVideo/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordVideo', '上传记录视频',
        '3760b2031ff41ca0bd80bc7a8a13f7bb_preview.mp4', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/316c7d1ec6d28ceec39431d99a0829e2.mp4\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 633, '2023-05-01 10:38:40');
INSERT INTO `a_operation_log`
VALUES (1341, '记录模块', '上传', '/admin/recordVideo/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordVideo', '上传记录视频',
        'b99b51e6c7945c9d5565861d397451cb_preview.mp4', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/cc91ec1cdbd1222d3eaea67d7312e7e5.mp4\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 692, '2023-05-01 10:39:17');
INSERT INTO `a_operation_log`
VALUES (1342, '记录模块', '上传', '/admin/recordVideo/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordVideo', '上传记录视频',
        '3760b2031ff41ca0bd80bc7a8a13f7bb_preview.mp4', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/316c7d1ec6d28ceec39431d99a0829e2.mp4\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 742, '2023-05-01 10:41:24');
INSERT INTO `a_operation_log`
VALUES (1343, '记录模块', '上传', '/admin/recordVideo/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordVideo', '上传记录视频',
        '3760b2031ff41ca0bd80bc7a8a13f7bb_preview.mp4', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/316c7d1ec6d28ceec39431d99a0829e2.mp4\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 847, '2023-05-01 10:52:59');
INSERT INTO `a_operation_log`
VALUES (1344, '记录模块', '上传', '/admin/recordVideo/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordVideo', '上传记录视频',
        '3760b2031ff41ca0bd80bc7a8a13f7bb_preview.mp4', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/316c7d1ec6d28ceec39431d99a0829e2.mp4\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 715, '2023-05-01 10:56:28');
INSERT INTO `a_operation_log`
VALUES (1345, '记录模块', '上传', '/admin/recordVideo/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordVideo', '上传记录视频',
        '3760b2031ff41ca0bd80bc7a8a13f7bb_preview.mp4', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/316c7d1ec6d28ceec39431d99a0829e2.mp4\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1291, '2023-05-01 10:57:42');
INSERT INTO `a_operation_log`
VALUES (1346, '记录模块', '上传', '/admin/recordVideo/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordVideo', '上传记录视频',
        '3760b2031ff41ca0bd80bc7a8a13f7bb_preview.mp4', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/316c7d1ec6d28ceec39431d99a0829e2.mp4\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 535, '2023-05-01 10:59:34');
INSERT INTO `a_operation_log`
VALUES (1347, '记录模块', '上传', '/admin/recordVideo/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordVideo', '上传记录视频',
        'b99b51e6c7945c9d5565861d397451cb_preview.mp4', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/cc91ec1cdbd1222d3eaea67d7312e7e5.mp4\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 792, '2023-05-01 11:01:30');
INSERT INTO `a_operation_log`
VALUES (1348, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1618103506002a70f03c6f7ab9a41a14c5211103816e3.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/0357babdb438ed09d39324f52f1cf6f6.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 768, '2023-05-01 11:14:08');
INSERT INTO `a_operation_log`
VALUES (1349, '记录模块', '修改', '/admin/agreeRecord/update', 'com.vhans.aapi.controller.AgreeRecordController.updateRecord',
        '修改记录',
        '[{\"content\":\"吃饭\",\"cover\":\"https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg\",\"id\":32,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/0357babdb438ed09d39324f52f1cf6f6.jpg\\\"]\",\"isRecommend\":0,\"isTop\":1,\"status\":1,\"tagNameList\":[],\"title\":\"约饭\",\"type\":3,\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 260,
        '2023-05-01 11:14:22');
INSERT INTO `a_operation_log`
VALUES (1350, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1621118331404c2c56d8fdf5bde766c54a75ed82170d7.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/95715da36ee97ce53e1d3c383fa58da0.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 741, '2023-05-01 11:16:21');
INSERT INTO `a_operation_log`
VALUES (1351, '记录模块', '添加', '/admin/agreeRecord/add', 'com.vhans.aapi.controller.AgreeRecordController.addRecord',
        '添加记录',
        '[{\"content\":\"一起吃饭\",\"cover\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/95715da36ee97ce53e1d3c383fa58da0.jpg\",\"images\":\"\",\"isRecommend\":0,\"isTop\":0,\"status\":1,\"tagNameList\":[],\"title\":\"约饭\",\"type\":1,\"userId\":1}]',
        'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 240,
        '2023-05-01 11:16:25');
INSERT INTO `a_operation_log`
VALUES (1352, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1619571666439b6fcae4683fed482a5d5f709e69ddec1.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/848686a1da40e6e258f384d0e8350d5b.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 505, '2023-05-01 11:18:09');
INSERT INTO `a_operation_log`
VALUES (1353, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1618272520307fbefa6b05379a9918900ce51a6ff3ab0.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/85902ff1273548827014398faa50835a.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 651, '2023-05-01 11:18:20');
INSERT INTO `a_operation_log`
VALUES (1354, '记录模块', '上传', '/admin/recordVideo/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordVideo', '上传记录视频',
        '3760b2031ff41ca0bd80bc7a8a13f7bb_preview.mp4', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/316c7d1ec6d28ceec39431d99a0829e2.mp4\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 619, '2023-05-01 11:18:30');
INSERT INTO `a_operation_log`
VALUES (1355, '记录模块', '修改', '/admin/agreeRecord/update', 'com.vhans.aapi.controller.AgreeRecordController.updateRecord',
        '修改记录',
        '[{\"content\":\"吃饭\",\"cover\":\"https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg\",\"id\":32,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/85902ff1273548827014398faa50835a.jpg\\\"]\",\"isRecommend\":0,\"isTop\":1,\"status\":1,\"tagNameList\":[],\"title\":\"约饭\",\"type\":1,\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 205,
        '2023-05-01 11:18:56');
INSERT INTO `a_operation_log`
VALUES (1356, '记录模块', '删除', '/admin/agreeRecord/delete', 'com.vhans.aapi.controller.AgreeRecordController.deleteRecord',
        '删除记录', '[[42]]', 'DELETE', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans',
        '192.168.244.1', '内网IP|内网IP', 438, '2023-05-01 11:19:21');
INSERT INTO `a_operation_log`
VALUES (1357, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1618272520307fbefa6b05379a9918900ce51a6ff3ab0.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/85902ff1273548827014398faa50835a.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 732, '2023-05-01 11:27:10');
INSERT INTO `a_operation_log`
VALUES (1358, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1624000338183d82b1d4211a6f72446f11a0e82e48471.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/1235feeed7bf35b90bc3026e21b19fc7.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 518, '2023-05-01 11:27:15');
INSERT INTO `a_operation_log`
VALUES (1359, '记录模块', '修改', '/admin/agreeRecord/update', 'com.vhans.aapi.controller.AgreeRecordController.updateRecord',
        '修改记录',
        '[{\"content\":\"吃饭\",\"cover\":\"https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg\",\"id\":32,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/85902ff1273548827014398faa50835a.jpg\\\",\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/1235feeed7bf35b90bc3026e21b19fc7.jpg\\\"]\",\"isRecommend\":0,\"isTop\":1,\"status\":1,\"tagNameList\":[],\"title\":\"约饭\",\"type\":1,\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 221,
        '2023-05-01 11:27:28');
INSERT INTO `a_operation_log`
VALUES (1360, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1618272520307fbefa6b05379a9918900ce51a6ff3ab0.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/85902ff1273548827014398faa50835a.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 431, '2023-05-01 11:27:55');
INSERT INTO `a_operation_log`
VALUES (1361, '记录模块', '上传', '/admin/recordVideo/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordVideo', '上传记录视频',
        '3760b2031ff41ca0bd80bc7a8a13f7bb_preview.mp4', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/316c7d1ec6d28ceec39431d99a0829e2.mp4\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 482, '2023-05-01 11:28:08');
INSERT INTO `a_operation_log`
VALUES (1362, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1619571666439b6fcae4683fed482a5d5f709e69ddec1.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/848686a1da40e6e258f384d0e8350d5b.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 633, '2023-05-01 11:28:31');
INSERT INTO `a_operation_log`
VALUES (1363, '记录模块', '添加', '/admin/agreeRecord/add', 'com.vhans.aapi.controller.AgreeRecordController.addRecord',
        '添加记录',
        '[{\"content\":\"测试\",\"cover\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/848686a1da40e6e258f384d0e8350d5b.jpg\",\"images\":\"\",\"isRecommend\":0,\"isTop\":0,\"status\":1,\"tagNameList\":[],\"title\":\"测试\",\"type\":2,\"userId\":1}]',
        'POST', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 219,
        '2023-05-01 11:28:37');
INSERT INTO `a_operation_log`
VALUES (1364, '记录模块', '上传', '/admin/recordVideo/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordVideo', '上传记录视频',
        '3760b2031ff41ca0bd80bc7a8a13f7bb_preview.mp4', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/316c7d1ec6d28ceec39431d99a0829e2.mp4\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 699, '2023-05-01 11:32:32');
INSERT INTO `a_operation_log`
VALUES (1365, '记录模块', '修改', '/admin/agreeRecord/update', 'com.vhans.aapi.controller.AgreeRecordController.updateRecord',
        '修改记录',
        '[{\"content\":\"测试\",\"cover\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/848686a1da40e6e258f384d0e8350d5b.jpg\",\"id\":43,\"images\":\"\",\"isRecommend\":0,\"isTop\":0,\"status\":1,\"tagNameList\":[],\"title\":\"测试\",\"type\":2,\"userId\":1,\"video\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/316c7d1ec6d28ceec39431d99a0829e2.mp4\"}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 231,
        '2023-05-01 11:32:37');
INSERT INTO `a_operation_log`
VALUES (1366, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1618103506002a70f03c6f7ab9a41a14c5211103816e3.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/0357babdb438ed09d39324f52f1cf6f6.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1255, '2023-05-01 11:43:25');
INSERT INTO `a_operation_log`
VALUES (1367, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1621149429867f9cc76d0d6f11696a045b12dac98713d.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/7dc388c70dcf3fa93c1c54942dd8644f.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 776, '2023-05-01 11:46:21');
INSERT INTO `a_operation_log`
VALUES (1368, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1618272520307fbefa6b05379a9918900ce51a6ff3ab0.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/85902ff1273548827014398faa50835a.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 620, '2023-05-01 11:46:33');
INSERT INTO `a_operation_log`
VALUES (1369, '记录模块', '上传', '/admin/recordVideo/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordVideo', '上传记录视频',
        '3760b2031ff41ca0bd80bc7a8a13f7bb_preview.mp4', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/316c7d1ec6d28ceec39431d99a0829e2.mp4\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 726, '2023-05-01 11:46:39');
INSERT INTO `a_operation_log`
VALUES (1370, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1618272520307fbefa6b05379a9918900ce51a6ff3ab0.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/85902ff1273548827014398faa50835a.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 667, '2023-05-01 11:46:45');
INSERT INTO `a_operation_log`
VALUES (1371, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1618272520307fbefa6b05379a9918900ce51a6ff3ab0.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/85902ff1273548827014398faa50835a.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 515, '2023-05-01 11:47:18');
INSERT INTO `a_operation_log`
VALUES (1372, '记录模块', '上传', '/admin/recordVideo/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordVideo', '上传记录视频',
        '3760b2031ff41ca0bd80bc7a8a13f7bb_preview.mp4', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/316c7d1ec6d28ceec39431d99a0829e2.mp4\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 710, '2023-05-01 11:47:22');
INSERT INTO `a_operation_log`
VALUES (1373, '记录模块', '修改', '/admin/agreeRecord/update', 'com.vhans.aapi.controller.AgreeRecordController.updateRecord',
        '修改记录',
        '[{\"content\":\"测试\",\"cover\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/848686a1da40e6e258f384d0e8350d5b.jpg\",\"id\":43,\"images\":\"\",\"isRecommend\":0,\"isTop\":0,\"status\":1,\"tagNameList\":[],\"title\":\"测试\",\"type\":2,\"userId\":1,\"video\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/316c7d1ec6d28ceec39431d99a0829e2.mp4\"}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 201,
        '2023-05-01 11:47:37');
INSERT INTO `a_operation_log`
VALUES (1374, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1618272520307fbefa6b05379a9918900ce51a6ff3ab0.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/85902ff1273548827014398faa50835a.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 208, '2023-05-01 11:48:09');
INSERT INTO `a_operation_log`
VALUES (1375, '记录模块', '修改', '/admin/agreeRecord/update', 'com.vhans.aapi.controller.AgreeRecordController.updateRecord',
        '修改记录',
        '[{\"content\":\"测试\",\"cover\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/848686a1da40e6e258f384d0e8350d5b.jpg\",\"id\":43,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/85902ff1273548827014398faa50835a.jpg\\\"]\",\"isRecommend\":0,\"isTop\":0,\"status\":1,\"tagNameList\":[],\"title\":\"测试\",\"type\":2,\"userId\":1,\"video\":\"\"}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 176,
        '2023-05-01 11:48:13');
INSERT INTO `a_operation_log`
VALUES (1376, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1624000338183d82b1d4211a6f72446f11a0e82e48471.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/1235feeed7bf35b90bc3026e21b19fc7.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 611, '2023-05-01 11:49:48');
INSERT INTO `a_operation_log`
VALUES (1377, '记录模块', '上传', '/admin/recordVideo/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordVideo', '上传记录视频',
        'b99b51e6c7945c9d5565861d397451cb_preview.mp4', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/cc91ec1cdbd1222d3eaea67d7312e7e5.mp4\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 562, '2023-05-01 11:53:57');
INSERT INTO `a_operation_log`
VALUES (1378, '记录模块', '修改', '/admin/agreeRecord/update', 'com.vhans.aapi.controller.AgreeRecordController.updateRecord',
        '修改记录',
        '[{\"content\":\"测试\",\"cover\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/848686a1da40e6e258f384d0e8350d5b.jpg\",\"id\":43,\"images\":\"\",\"isRecommend\":0,\"isTop\":0,\"status\":1,\"tagNameList\":[],\"title\":\"测试\",\"type\":2,\"userId\":1,\"video\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/cc91ec1cdbd1222d3eaea67d7312e7e5.mp4\"}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 190,
        '2023-05-01 11:54:05');
INSERT INTO `a_operation_log`
VALUES (1379, '记录模块', '上传', '/admin/recordImage/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordImages', '上传记录图片',
        'img-1618790427978d7572c10ef3c26a20bbebf2afa84002a.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/3703320c1d11a84e5f81ec5491b5f479.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1263, '2023-05-01 17:46:17');
INSERT INTO `a_operation_log`
VALUES (1380, '记录模块', '修改', '/admin/agreeRecord/update', 'com.vhans.aapi.controller.AgreeRecordController.updateRecord',
        '修改记录',
        '[{\"content\":\"吃饭\",\"cover\":\"https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg\",\"id\":32,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/85902ff1273548827014398faa50835a.jpg\\\",\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/1235feeed7bf35b90bc3026e21b19fc7.jpg\\\",\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/3703320c1d11a84e5f81ec5491b5f479.jpg\\\"]\",\"isRecommend\":0,\"isTop\":1,\"status\":1,\"tagNameList\":[],\"title\":\"约饭\",\"type\":1,\"userId\":1,\"video\":\"\"}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 262,
        '2023-05-01 17:46:21');
INSERT INTO `a_operation_log`
VALUES (1381, '记录模块', '上传', '/admin/recordVideo/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordVideo', '上传记录视频',
        '3760b2031ff41ca0bd80bc7a8a13f7bb_preview.mp4', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/316c7d1ec6d28ceec39431d99a0829e2.mp4\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 637, '2023-05-01 17:47:10');
INSERT INTO `a_operation_log`
VALUES (1382, '记录模块', '上传', '/admin/recordVideo/upload',
        'com.vhans.aapi.controller.AgreeRecordController.saveRecordVideo', '上传记录视频',
        '3760b2031ff41ca0bd80bc7a8a13f7bb_preview.mp4', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/316c7d1ec6d28ceec39431d99a0829e2.mp4\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 493, '2023-05-01 17:47:28');
INSERT INTO `a_operation_log`
VALUES (1383, '记录模块', '修改', '/admin/agreeRecord/update', 'com.vhans.aapi.controller.AgreeRecordController.updateRecord',
        '修改记录',
        '[{\"content\":\"测试\",\"cover\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/848686a1da40e6e258f384d0e8350d5b.jpg\",\"id\":43,\"images\":\"\",\"isRecommend\":0,\"isTop\":0,\"status\":1,\"tagNameList\":[],\"title\":\"测试\",\"type\":2,\"userId\":1,\"video\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/316c7d1ec6d28ceec39431d99a0829e2.mp4\"}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 222,
        '2023-05-01 17:47:38');
INSERT INTO `a_operation_log`
VALUES (1384, '约起模块', '上传', '/admin/agreementImage/upload',
        'com.vhans.aapi.controller.AgreeController.saveQuizImages', '上传约起图片',
        'img-1618272520307fbefa6b05379a9918900ce51a6ff3ab0.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreement/image/85902ff1273548827014398faa50835a.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1486, '2023-05-01 18:03:30');
INSERT INTO `a_operation_log`
VALUES (1385, '约起模块', '上传', '/admin/agreementImage/upload',
        'com.vhans.aapi.controller.AgreeController.saveQuizImages', '上传约起图片',
        'img-1620352638772e43003ed02fc4c0e38ecfb4b645a2fbe.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreement/image/5fb341f0f7b4a582ea1d043e2841e7b0.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1457, '2023-05-01 18:18:44');
INSERT INTO `a_operation_log`
VALUES (1386, '约起模块', '上传', '/admin/agreementImage/upload',
        'com.vhans.aapi.controller.AgreeController.saveQuizImages', '上传约起图片',
        'img-1618272520307fbefa6b05379a9918900ce51a6ff3ab0.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreement/image/85902ff1273548827014398faa50835a.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 688, '2023-05-01 18:31:11');
INSERT INTO `a_operation_log`
VALUES (1387, '约起模块', '上传', '/admin/agreementImage/upload',
        'com.vhans.aapi.controller.AgreeController.saveQuizImages', '上传约起图片',
        'img-1621118331404c2c56d8fdf5bde766c54a75ed82170d7.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreement/image/95715da36ee97ce53e1d3c383fa58da0.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1311, '2023-05-01 18:31:41');
INSERT INTO `a_operation_log`
VALUES (1388, '约起模块', '上传', '/admin/agreementImage/upload',
        'com.vhans.aapi.controller.AgreeController.saveQuizImages', '上传约起图片', 'image.png', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreement/image/70fd119b20dc3b6da18e672ce5182eab.png\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1639, '2023-05-01 18:32:18');
INSERT INTO `a_operation_log`
VALUES (1389, '约起模块', '上传', '/admin/agreementImage/upload',
        'com.vhans.aapi.controller.AgreeController.saveQuizImages', '上传约起图片',
        'img-1620352638772e43003ed02fc4c0e38ecfb4b645a2fbe.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreement/image/5fb341f0f7b4a582ea1d043e2841e7b0.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 709, '2023-05-01 18:38:52');
INSERT INTO `a_operation_log`
VALUES (1390, '约起模块', '上传', '/admin/agreementImage/upload',
        'com.vhans.aapi.controller.AgreeController.saveQuizImages', '上传约起图片',
        'img-1620352638772e43003ed02fc4c0e38ecfb4b645a2fbe.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreement/image/5fb341f0f7b4a582ea1d043e2841e7b0.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1710, '2023-05-01 18:46:00');
INSERT INTO `a_operation_log`
VALUES (1391, '题目模块', '修改', '/admin/quiz/update', 'com.vhans.aapi.controller.QuizController.updateQuiz',
        '修改题目',
        '[{\"content\":\"如何看待“年轻的时候需要的是朋友而不是人脉”？\",\"id\":24,\"images\":\"[\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/378d3d4d7e1c7696cbb7d0709538798f.jpg\\\",\\\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\\\"]\",\"tagNameList\":[],\"title\":\"人脉和朋友\",\"userId\":1}]',
        'PUT', '{\"code\":200,\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 346,
        '2023-05-01 19:19:07');
INSERT INTO `a_operation_log`
VALUES (1392, '约起模块', '修改', '/admin/agreement/update',
        'com.vhans.aapi.controller.AgreeController.updateAgreement', '修改约起',
        '[{\"agreementType\":1,\"content\":\"玩卡丁车\",\"cover\":\"https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg\",\"id\":7,\"status\":2,\"timeEnd\":\"2023-05-29 14:34:01\",\"timeStart\":\"2023-05-28 14:33:54\",\"title\":\"玩乐\",\"type\":1,\"userId\":1,\"userIntroListValid\":true,\"wagerContentValid\":true}]',
        'PUT', '{\"code\":200,\"data\":\"更新约会成功\",\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans',
        '192.168.244.1', '内网IP|内网IP', 2163, '2023-05-01 22:32:26');
INSERT INTO `a_operation_log`
VALUES (1393, '约起模块', '上传', '/admin/agreementImage/upload',
        'com.vhans.aapi.controller.AgreeController.saveQuizImages', '上传约起图片',
        'img-1619571666439b6fcae4683fed482a5d5f709e69ddec1.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreement/image/848686a1da40e6e258f384d0e8350d5b.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1849, '2023-05-01 22:32:50');
INSERT INTO `a_operation_log`
VALUES (1394, '约起模块', '修改', '/admin/agreement/update',
        'com.vhans.aapi.controller.AgreeController.updateAgreement', '修改约起',
        '[{\"agreementType\":1,\"content\":\"玩卡丁车\\n![](https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreement/image/848686a1da40e6e258f384d0e8350d5b.jpg)\\n\",\"cover\":\"https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg\",\"id\":7,\"status\":2,\"timeEnd\":\"2023-05-29 14:34:01\",\"timeStart\":\"2023-05-28 14:33:54\",\"title\":\"玩乐\",\"type\":1,\"userId\":1,\"userIntroListValid\":true,\"wagerContentValid\":true}]',
        'PUT', '{\"code\":200,\"data\":\"更新约会成功\",\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans',
        '192.168.244.1', '内网IP|内网IP', 3195, '2023-05-01 22:32:56');
INSERT INTO `a_operation_log`
VALUES (1395, '约起模块', '修改', '/admin/agreement/update',
        'com.vhans.aapi.controller.AgreeController.updateAgreement', '修改约起',
        '[{\"agreementType\":1,\"content\":\"玩卡丁车\\n![](https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreement/image/848686a1da40e6e258f384d0e8350d5b.jpg)\\n\",\"cover\":\"https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg\",\"id\":7,\"status\":2,\"timeEnd\":\"2023-05-29 14:34:01\",\"timeStart\":\"2023-05-28 14:33:54\",\"title\":\"玩乐\",\"type\":1,\"userId\":1,\"userIntroListValid\":true,\"wagerContentValid\":true}]',
        'PUT', '{\"code\":200,\"data\":\"更新约会成功\",\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans',
        '192.168.244.1', '内网IP|内网IP', 119, '2023-05-01 22:35:32');
INSERT INTO `a_operation_log`
VALUES (1396, '约起模块', '上传', '/admin/agreementImage/upload',
        'com.vhans.aapi.controller.AgreeController.saveQuizImages', '上传约起图片',
        'img-1624101451565ac35805b3c704ee3af46da801c2da219.jpg', 'POST',
        '{\"code\":200,\"data\":\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreement/image/e7900c65b10258d272922071ab685805.jpg\",\"flag\":true,\"msg\":\"操作成功\"}',
        1, 'Vhans', '192.168.244.1', '内网IP|内网IP', 1534, '2023-05-01 22:56:15');
INSERT INTO `a_operation_log`
VALUES (1397, '约起模块', '修改', '/admin/agreement/update',
        'com.vhans.aapi.controller.AgreeController.updateAgreement', '修改约起',
        '[{\"agreementType\":1,\"content\":\"## 玩卡丁车\\n![](https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreement/image/848686a1da40e6e258f384d0e8350d5b.jpg)\\n\",\"cover\":\"https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg\",\"id\":7,\"status\":2,\"timeEnd\":\"2023-05-29 14:34:01\",\"timeStart\":\"2023-05-28 14:33:54\",\"title\":\"玩乐\",\"type\":1,\"userId\":1,\"userIntroListValid\":true,\"wagerContentValid\":true}]',
        'PUT', '{\"code\":200,\"data\":\"更新约会成功\",\"flag\":true,\"msg\":\"操作成功\"}', 1, 'Vhans',
        '192.168.244.1', '内网IP|内网IP', 621, '2023-05-02 00:04:04');

-- ----------------------------
-- Table structure for a_role
-- ----------------------------
DROP TABLE IF EXISTS `a_role`;
CREATE TABLE `a_role`
(
    `id`          varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键id',
    `role_name`   varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
    `role_desc`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '角色描述',
    `is_disable`  tinyint(1)                                                   NOT NULL DEFAULT 0 COMMENT '是否禁用 (0否 1是)',
    `create_time` datetime(0)                                                  NOT NULL COMMENT '创建时间',
    `update_time` datetime(0)                                                  NULL     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a_role
-- ----------------------------
INSERT INTO `a_role`
VALUES ('1', 'admin', '管理员', 0, '2022-11-03 17:41:57', '2023-03-10 23:12:59');
INSERT INTO `a_role`
VALUES ('3', 'test', '测试账号', 0, '2022-11-03 17:42:31', '2023-04-25 23:33:30');

-- ----------------------------
-- Table structure for a_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `a_role_menu`;
CREATE TABLE `a_role_menu`
(
    `id`      int(0)                                                       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `role_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色id',
    `menu_id` int(0)                                                       NOT NULL COMMENT '菜单id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5916
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a_role_menu
-- ----------------------------
INSERT INTO `a_role_menu`
VALUES (1, '1', 1);
INSERT INTO `a_role_menu`
VALUES (2, '1', 2);
INSERT INTO `a_role_menu`
VALUES (3, '1', 3);
INSERT INTO `a_role_menu`
VALUES (4, '1', 4);
INSERT INTO `a_role_menu`
VALUES (5, '1', 5);
INSERT INTO `a_role_menu`
VALUES (6, '1', 6);
INSERT INTO `a_role_menu`
VALUES (7, '1', 7);
INSERT INTO `a_role_menu`
VALUES (8, '1', 11);
INSERT INTO `a_role_menu`
VALUES (9, '1', 12);
INSERT INTO `a_role_menu`
VALUES (10, '1', 13);
INSERT INTO `a_role_menu`
VALUES (11, '1', 14);
INSERT INTO `a_role_menu`
VALUES (12, '1', 16);
INSERT INTO `a_role_menu`
VALUES (13, '1', 17);
INSERT INTO `a_role_menu`
VALUES (14, '1', 18);
INSERT INTO `a_role_menu`
VALUES (15, '1', 19);
INSERT INTO `a_role_menu`
VALUES (16, '1', 21);
INSERT INTO `a_role_menu`
VALUES (17, '1', 22);
INSERT INTO `a_role_menu`
VALUES (18, '1', 23);
INSERT INTO `a_role_menu`
VALUES (19, '1', 24);
INSERT INTO `a_role_menu`
VALUES (20, '1', 26);
INSERT INTO `a_role_menu`
VALUES (21, '1', 27);
INSERT INTO `a_role_menu`
VALUES (22, '1', 28);
INSERT INTO `a_role_menu`
VALUES (23, '1', 29);
INSERT INTO `a_role_menu`
VALUES (24, '1', 31);
INSERT INTO `a_role_menu`
VALUES (25, '1', 32);
INSERT INTO `a_role_menu`
VALUES (26, '1', 33);
INSERT INTO `a_role_menu`
VALUES (27, '1', 34);
INSERT INTO `a_role_menu`
VALUES (28, '1', 36);
INSERT INTO `a_role_menu`
VALUES (29, '1', 37);
INSERT INTO `a_role_menu`
VALUES (30, '1', 38);
INSERT INTO `a_role_menu`
VALUES (31, '1', 39);
INSERT INTO `a_role_menu`
VALUES (32, '1', 41);
INSERT INTO `a_role_menu`
VALUES (33, '1', 42);
INSERT INTO `a_role_menu`
VALUES (34, '1', 101);
INSERT INTO `a_role_menu`
VALUES (35, '1', 102);
INSERT INTO `a_role_menu`
VALUES (36, '1', 103);
INSERT INTO `a_role_menu`
VALUES (37, '1', 104);
INSERT INTO `a_role_menu`
VALUES (38, '1', 105);
INSERT INTO `a_role_menu`
VALUES (39, '1', 106);
INSERT INTO `a_role_menu`
VALUES (40, '1', 107);
INSERT INTO `a_role_menu`
VALUES (41, '1', 108);
INSERT INTO `a_role_menu`
VALUES (42, '1', 109);
INSERT INTO `a_role_menu`
VALUES (43, '1', 111);
INSERT INTO `a_role_menu`
VALUES (44, '1', 112);
INSERT INTO `a_role_menu`
VALUES (45, '1', 113);
INSERT INTO `a_role_menu`
VALUES (46, '1', 121);
INSERT INTO `a_role_menu`
VALUES (47, '1', 122);
INSERT INTO `a_role_menu`
VALUES (48, '1', 123);
INSERT INTO `a_role_menu`
VALUES (49, '1', 124);
INSERT INTO `a_role_menu`
VALUES (50, '1', 125);
INSERT INTO `a_role_menu`
VALUES (51, '1', 131);
INSERT INTO `a_role_menu`
VALUES (52, '1', 132);
INSERT INTO `a_role_menu`
VALUES (53, '1', 133);
INSERT INTO `a_role_menu`
VALUES (54, '1', 141);
INSERT INTO `a_role_menu`
VALUES (55, '1', 142);
INSERT INTO `a_role_menu`
VALUES (56, '1', 143);
INSERT INTO `a_role_menu`
VALUES (57, '1', 144);
INSERT INTO `a_role_menu`
VALUES (58, '1', 151);
INSERT INTO `a_role_menu`
VALUES (59, '1', 152);
INSERT INTO `a_role_menu`
VALUES (60, '1', 153);
INSERT INTO `a_role_menu`
VALUES (61, '1', 154);
INSERT INTO `a_role_menu`
VALUES (62, '1', 161);
INSERT INTO `a_role_menu`
VALUES (63, '1', 162);
INSERT INTO `a_role_menu`
VALUES (64, '1', 163);
INSERT INTO `a_role_menu`
VALUES (65, '1', 164);
INSERT INTO `a_role_menu`
VALUES (66, '1', 171);
INSERT INTO `a_role_menu`
VALUES (67, '1', 172);
INSERT INTO `a_role_menu`
VALUES (68, '1', 173);
INSERT INTO `a_role_menu`
VALUES (69, '1', 174);
INSERT INTO `a_role_menu`
VALUES (70, '1', 181);
INSERT INTO `a_role_menu`
VALUES (71, '1', 182);
INSERT INTO `a_role_menu`
VALUES (72, '1', 183);
INSERT INTO `a_role_menu`
VALUES (73, '1', 184);
INSERT INTO `a_role_menu`
VALUES (74, '1', 191);
INSERT INTO `a_role_menu`
VALUES (75, '1', 192);
INSERT INTO `a_role_menu`
VALUES (76, '1', 193);
INSERT INTO `a_role_menu`
VALUES (77, '1', 194);
INSERT INTO `a_role_menu`
VALUES (78, '1', 201);
INSERT INTO `a_role_menu`
VALUES (79, '1', 202);
INSERT INTO `a_role_menu`
VALUES (80, '1', 203);
INSERT INTO `a_role_menu`
VALUES (81, '1', 204);
INSERT INTO `a_role_menu`
VALUES (82, '1', 205);
INSERT INTO `a_role_menu`
VALUES (83, '1', 206);
INSERT INTO `a_role_menu`
VALUES (84, '1', 210);
INSERT INTO `a_role_menu`
VALUES (85, '1', 211);
INSERT INTO `a_role_menu`
VALUES (86, '1', 212);
INSERT INTO `a_role_menu`
VALUES (87, '1', 221);
INSERT INTO `a_role_menu`
VALUES (88, '1', 226);
INSERT INTO `a_role_menu`
VALUES (89, '1', 231);
INSERT INTO `a_role_menu`
VALUES (90, '1', 231);
INSERT INTO `a_role_menu`
VALUES (91, '1', 232);
INSERT INTO `a_role_menu`
VALUES (92, '1', 236);
INSERT INTO `a_role_menu`
VALUES (93, '1', 236);
INSERT INTO `a_role_menu`
VALUES (94, '1', 237);
INSERT INTO `a_role_menu`
VALUES (95, '1', 237);
INSERT INTO `a_role_menu`
VALUES (96, '1', 241);
INSERT INTO `a_role_menu`
VALUES (97, '1', 241);
INSERT INTO `a_role_menu`
VALUES (98, '1', 242);
INSERT INTO `a_role_menu`
VALUES (99, '1', 242);
INSERT INTO `a_role_menu`
VALUES (100, '1', 243);
INSERT INTO `a_role_menu`
VALUES (101, '1', 244);
INSERT INTO `a_role_menu`
VALUES (102, '1', 245);
INSERT INTO `a_role_menu`
VALUES (103, '1', 246);
INSERT INTO `a_role_menu`
VALUES (104, '1', 251);
INSERT INTO `a_role_menu`
VALUES (105, '1', 252);
INSERT INTO `a_role_menu`
VALUES (106, '1', 253);
INSERT INTO `a_role_menu`
VALUES (107, '1', 254);
INSERT INTO `a_role_menu`
VALUES (108, '1', 256);
INSERT INTO `a_role_menu`
VALUES (109, '1', 257);
INSERT INTO `a_role_menu`
VALUES (5867, '3', 1);
INSERT INTO `a_role_menu`
VALUES (5868, '3', 12);
INSERT INTO `a_role_menu`
VALUES (5869, '3', 101);
INSERT INTO `a_role_menu`
VALUES (5870, '3', 102);
INSERT INTO `a_role_menu`
VALUES (5871, '3', 103);
INSERT INTO `a_role_menu`
VALUES (5872, '3', 104);
INSERT INTO `a_role_menu`
VALUES (5873, '3', 105);
INSERT INTO `a_role_menu`
VALUES (5874, '3', 106);
INSERT INTO `a_role_menu`
VALUES (5875, '3', 107);
INSERT INTO `a_role_menu`
VALUES (5876, '3', 108);
INSERT INTO `a_role_menu`
VALUES (5877, '3', 109);
INSERT INTO `a_role_menu`
VALUES (5878, '3', 13);
INSERT INTO `a_role_menu`
VALUES (5879, '3', 111);
INSERT INTO `a_role_menu`
VALUES (5880, '3', 112);
INSERT INTO `a_role_menu`
VALUES (5881, '3', 113);
INSERT INTO `a_role_menu`
VALUES (5882, '3', 14);
INSERT INTO `a_role_menu`
VALUES (5883, '3', 2);
INSERT INTO `a_role_menu`
VALUES (5884, '3', 17);
INSERT INTO `a_role_menu`
VALUES (5885, '3', 18);
INSERT INTO `a_role_menu`
VALUES (5886, '3', 19);
INSERT INTO `a_role_menu`
VALUES (5887, '3', 3);
INSERT INTO `a_role_menu`
VALUES (5888, '3', 21);
INSERT INTO `a_role_menu`
VALUES (5889, '3', 144);
INSERT INTO `a_role_menu`
VALUES (5890, '3', 22);
INSERT INTO `a_role_menu`
VALUES (5891, '3', 154);
INSERT INTO `a_role_menu`
VALUES (5892, '3', 23);
INSERT INTO `a_role_menu`
VALUES (5893, '3', 164);
INSERT INTO `a_role_menu`
VALUES (5894, '3', 24);
INSERT INTO `a_role_menu`
VALUES (5895, '3', 174);
INSERT INTO `a_role_menu`
VALUES (5896, '3', 4);
INSERT INTO `a_role_menu`
VALUES (5897, '3', 26);
INSERT INTO `a_role_menu`
VALUES (5898, '3', 184);
INSERT INTO `a_role_menu`
VALUES (5899, '3', 27);
INSERT INTO `a_role_menu`
VALUES (5900, '3', 28);
INSERT INTO `a_role_menu`
VALUES (5901, '3', 205);
INSERT INTO `a_role_menu`
VALUES (5902, '3', 29);
INSERT INTO `a_role_menu`
VALUES (5903, '3', 5);
INSERT INTO `a_role_menu`
VALUES (5904, '3', 31);
INSERT INTO `a_role_menu`
VALUES (5905, '3', 32);
INSERT INTO `a_role_menu`
VALUES (5906, '3', 33);
INSERT INTO `a_role_menu`
VALUES (5907, '3', 34);
INSERT INTO `a_role_menu`
VALUES (5908, '3', 6);
INSERT INTO `a_role_menu`
VALUES (5909, '3', 36);
INSERT INTO `a_role_menu`
VALUES (5910, '3', 37);
INSERT INTO `a_role_menu`
VALUES (5911, '3', 38);
INSERT INTO `a_role_menu`
VALUES (5912, '3', 39);
INSERT INTO `a_role_menu`
VALUES (5913, '3', 7);
INSERT INTO `a_role_menu`
VALUES (5914, '3', 41);
INSERT INTO `a_role_menu`
VALUES (5915, '3', 42);

-- ----------------------------
-- Table structure for a_task
-- ----------------------------
DROP TABLE IF EXISTS `a_task`;
CREATE TABLE `a_task`
(
    `id`              int(0)                                                        NOT NULL AUTO_INCREMENT COMMENT '任务id',
    `task_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '任务名称',
    `task_group`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
    `invoke_target`   varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标',
    `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT 'cron执行表达式',
    `misfire_policy`  tinyint(1)                                                    NOT NULL DEFAULT 3 COMMENT '计划执行错误策略 (1立即执行 2执行一次 3放弃执行)',
    `concurrent`      tinyint(1)                                                    NOT NULL DEFAULT 0 COMMENT '是否并发执行 (0否 1是)',
    `status`          tinyint(1)                                                    NOT NULL DEFAULT 0 COMMENT '任务状态 (0运行 1暂停)',
    `remark`          varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '任务备注信息',
    `create_time`     datetime(0)                                                   NULL     DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime(0)                                                   NULL     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a_task
-- ----------------------------
INSERT INTO `a_task`
VALUES (1, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '0 0 * * * ?', 1, 0, 0, '每个小时清除一下过期约起',
        '2023-04-20 15:42:32', NULL);
INSERT INTO `a_task`
VALUES (2, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '0 0 0 * * ?', 3, 0, 0, '清除redis中的游客记录',
        '2023-04-14 09:49:39', '2023-04-18 15:48:41');
INSERT INTO `a_task`
VALUES (3, '清除访问日志', 'SYSTEM', 'timedTask.clearVistiLog', '0 0 2 * * ?', 3, 0, 0, '清除一周前的访问日志',
        '2023-04-22 15:56:32', NULL);

-- ----------------------------
-- Table structure for a_task_log
-- ----------------------------
DROP TABLE IF EXISTS `a_task_log`;
CREATE TABLE `a_task_log`
(
    `id`            int(0)                                                        NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
    `task_name`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '任务名称',
    `task_group`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '任务组名',
    `invoke_target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
    `task_message`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '日志信息',
    `status`        tinyint(1)                                                    NULL DEFAULT 1 COMMENT '执行状态 (0失败 1正常)',
    `error_info`    longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci     NULL COMMENT '错误信息',
    `create_time`   datetime(0)                                                   NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 735
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a_task_log
-- ----------------------------
INSERT INTO `a_task_log`
VALUES (59, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：94毫秒', 1, NULL,
        '2023-04-21 14:00:00');
INSERT INTO `a_task_log`
VALUES (60, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：100毫秒', 1, NULL,
        '2023-04-21 14:00:00');
INSERT INTO `a_task_log`
VALUES (61, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：121毫秒', 1, NULL,
        '2023-04-21 14:00:00');
INSERT INTO `a_task_log`
VALUES (62, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：75毫秒', 1, NULL,
        '2023-04-21 15:00:00');
INSERT INTO `a_task_log`
VALUES (63, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：85毫秒', 1, NULL,
        '2023-04-21 15:00:00');
INSERT INTO `a_task_log`
VALUES (64, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：275毫秒', 1, NULL,
        '2023-04-21 15:00:00');
INSERT INTO `a_task_log`
VALUES (65, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：99毫秒', 1, NULL,
        '2023-04-21 16:00:00');
INSERT INTO `a_task_log`
VALUES (66, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：104毫秒', 1, NULL,
        '2023-04-21 16:00:00');
INSERT INTO `a_task_log`
VALUES (67, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：3001毫秒', 1, NULL,
        '2023-04-21 16:00:03');
INSERT INTO `a_task_log`
VALUES (68, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：192毫秒', 1, NULL,
        '2023-04-21 17:00:00');
INSERT INTO `a_task_log`
VALUES (69, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：215毫秒', 1, NULL,
        '2023-04-21 17:00:00');
INSERT INTO `a_task_log`
VALUES (70, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：166毫秒', 1, NULL,
        '2023-04-21 18:00:00');
INSERT INTO `a_task_log`
VALUES (71, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：226毫秒', 1, NULL,
        '2023-04-21 18:00:00');
INSERT INTO `a_task_log`
VALUES (72, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：146毫秒', 1, NULL,
        '2023-04-21 19:00:00');
INSERT INTO `a_task_log`
VALUES (73, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：169毫秒', 1, NULL,
        '2023-04-21 19:00:00');
INSERT INTO `a_task_log`
VALUES (74, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：127毫秒', 1, NULL,
        '2023-04-21 20:00:00');
INSERT INTO `a_task_log`
VALUES (75, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：155毫秒', 1, NULL,
        '2023-04-21 20:00:00');
INSERT INTO `a_task_log`
VALUES (76, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：136毫秒', 1, NULL,
        '2023-04-21 21:00:00');
INSERT INTO `a_task_log`
VALUES (77, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：152毫秒', 1, NULL,
        '2023-04-21 21:00:00');
INSERT INTO `a_task_log`
VALUES (78, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：124毫秒', 1, NULL,
        '2023-04-21 22:00:00');
INSERT INTO `a_task_log`
VALUES (79, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：121毫秒', 1, NULL,
        '2023-04-21 22:00:00');
INSERT INTO `a_task_log`
VALUES (80, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：75毫秒', 1, NULL,
        '2023-04-21 22:00:00');
INSERT INTO `a_task_log`
VALUES (81, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：50毫秒', 1, NULL,
        '2023-04-21 23:00:00');
INSERT INTO `a_task_log`
VALUES (82, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：92毫秒', 1, NULL,
        '2023-04-21 23:00:00');
INSERT INTO `a_task_log`
VALUES (83, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：102毫秒', 1, NULL,
        '2023-04-21 23:00:00');
INSERT INTO `a_task_log`
VALUES (84, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：13毫秒', 1, NULL,
        '2023-04-22 00:00:00');
INSERT INTO `a_task_log`
VALUES (85, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：10毫秒', 1, NULL,
        '2023-04-22 00:00:00');
INSERT INTO `a_task_log`
VALUES (86, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：181毫秒', 1, NULL,
        '2023-04-22 00:00:00');
INSERT INTO `a_task_log`
VALUES (87, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：204毫秒', 1, NULL,
        '2023-04-22 00:00:00');
INSERT INTO `a_task_log`
VALUES (88, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：1787毫秒', 1, NULL,
        '2023-04-22 00:00:09');
INSERT INTO `a_task_log`
VALUES (89, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：77毫秒', 1, NULL,
        '2023-04-22 01:00:00');
INSERT INTO `a_task_log`
VALUES (90, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：82毫秒', 1, NULL,
        '2023-04-22 01:00:00');
INSERT INTO `a_task_log`
VALUES (91, '清除访问日志', 'SYSTEM', 'timedTask.clearVistiLog', '清除访问日志 总共耗时：167毫秒', 1, NULL,
        '2023-04-22 02:00:00');
INSERT INTO `a_task_log`
VALUES (92, '清除访问日志', 'SYSTEM', 'timedTask.clearVistiLog', '清除访问日志 总共耗时：195毫秒', 1, NULL,
        '2023-04-22 02:00:00');
INSERT INTO `a_task_log`
VALUES (93, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：233毫秒', 1, NULL,
        '2023-04-22 02:00:00');
INSERT INTO `a_task_log`
VALUES (94, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：249毫秒', 1, NULL,
        '2023-04-22 02:00:00');
INSERT INTO `a_task_log`
VALUES (95, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：99毫秒', 1, NULL,
        '2023-04-22 03:00:00');
INSERT INTO `a_task_log`
VALUES (96, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：139毫秒', 1, NULL,
        '2023-04-22 03:00:00');
INSERT INTO `a_task_log`
VALUES (97, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：82毫秒', 1, NULL,
        '2023-04-22 04:00:00');
INSERT INTO `a_task_log`
VALUES (98, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：84毫秒', 1, NULL,
        '2023-04-22 04:00:00');
INSERT INTO `a_task_log`
VALUES (99, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：89毫秒', 1, NULL,
        '2023-04-22 05:00:00');
INSERT INTO `a_task_log`
VALUES (100, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：92毫秒', 1, NULL,
        '2023-04-22 05:00:00');
INSERT INTO `a_task_log`
VALUES (101, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：82毫秒', 1, NULL,
        '2023-04-22 06:00:00');
INSERT INTO `a_task_log`
VALUES (102, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：89毫秒', 1, NULL,
        '2023-04-22 06:00:00');
INSERT INTO `a_task_log`
VALUES (103, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：95毫秒', 1, NULL,
        '2023-04-22 07:00:00');
INSERT INTO `a_task_log`
VALUES (104, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：114毫秒', 1, NULL,
        '2023-04-22 07:00:00');
INSERT INTO `a_task_log`
VALUES (105, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：103毫秒', 1, NULL,
        '2023-04-22 08:00:00');
INSERT INTO `a_task_log`
VALUES (106, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：104毫秒', 1, NULL,
        '2023-04-22 08:00:00');
INSERT INTO `a_task_log`
VALUES (107, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：371毫秒', 1, NULL,
        '2023-04-22 08:00:00');
INSERT INTO `a_task_log`
VALUES (108, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：99毫秒', 1, NULL,
        '2023-04-22 09:00:00');
INSERT INTO `a_task_log`
VALUES (109, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：104毫秒', 1, NULL,
        '2023-04-22 09:00:00');
INSERT INTO `a_task_log`
VALUES (110, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：251毫秒', 1, NULL,
        '2023-04-22 09:00:00');
INSERT INTO `a_task_log`
VALUES (111, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：89毫秒', 1, NULL,
        '2023-04-22 10:00:00');
INSERT INTO `a_task_log`
VALUES (112, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：85毫秒', 1, NULL,
        '2023-04-22 10:00:00');
INSERT INTO `a_task_log`
VALUES (113, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：68毫秒', 1, NULL,
        '2023-04-22 10:00:00');
INSERT INTO `a_task_log`
VALUES (114, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：103毫秒', 1, NULL,
        '2023-04-22 11:00:00');
INSERT INTO `a_task_log`
VALUES (115, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：113毫秒', 1, NULL,
        '2023-04-22 11:00:00');
INSERT INTO `a_task_log`
VALUES (116, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：146毫秒', 1, NULL,
        '2023-04-22 11:00:00');
INSERT INTO `a_task_log`
VALUES (117, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：72毫秒', 1, NULL,
        '2023-04-22 12:00:00');
INSERT INTO `a_task_log`
VALUES (118, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：71毫秒', 1, NULL,
        '2023-04-22 12:00:00');
INSERT INTO `a_task_log`
VALUES (119, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：126毫秒', 1, NULL,
        '2023-04-22 12:00:00');
INSERT INTO `a_task_log`
VALUES (120, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：88毫秒', 1, NULL,
        '2023-04-22 13:00:00');
INSERT INTO `a_task_log`
VALUES (121, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：99毫秒', 1, NULL,
        '2023-04-22 13:00:00');
INSERT INTO `a_task_log`
VALUES (122, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：263毫秒', 1, NULL,
        '2023-04-22 13:00:00');
INSERT INTO `a_task_log`
VALUES (123, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：85毫秒', 1, NULL,
        '2023-04-22 14:00:00');
INSERT INTO `a_task_log`
VALUES (124, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：98毫秒', 1, NULL,
        '2023-04-22 14:00:00');
INSERT INTO `a_task_log`
VALUES (125, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：112毫秒', 1, NULL,
        '2023-04-22 14:00:00');
INSERT INTO `a_task_log`
VALUES (126, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：79毫秒', 1, NULL,
        '2023-04-22 15:00:00');
INSERT INTO `a_task_log`
VALUES (127, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：75毫秒', 1, NULL,
        '2023-04-22 15:00:00');
INSERT INTO `a_task_log`
VALUES (128, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：357毫秒', 1, NULL,
        '2023-04-22 15:00:00');
INSERT INTO `a_task_log`
VALUES (129, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：83毫秒', 1, NULL,
        '2023-04-22 16:00:00');
INSERT INTO `a_task_log`
VALUES (130, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：89毫秒', 1, NULL,
        '2023-04-22 16:00:00');
INSERT INTO `a_task_log`
VALUES (131, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：257毫秒', 1, NULL,
        '2023-04-22 16:00:00');
INSERT INTO `a_task_log`
VALUES (132, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：137毫秒', 1, NULL,
        '2023-04-22 17:00:00');
INSERT INTO `a_task_log`
VALUES (133, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：139毫秒', 1, NULL,
        '2023-04-22 17:00:00');
INSERT INTO `a_task_log`
VALUES (134, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：357毫秒', 1, NULL,
        '2023-04-22 17:00:00');
INSERT INTO `a_task_log`
VALUES (135, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：91毫秒', 1, NULL,
        '2023-04-22 18:00:00');
INSERT INTO `a_task_log`
VALUES (136, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：99毫秒', 1, NULL,
        '2023-04-22 18:00:00');
INSERT INTO `a_task_log`
VALUES (137, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：260毫秒', 1, NULL,
        '2023-04-22 18:00:00');
INSERT INTO `a_task_log`
VALUES (138, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：78毫秒', 1, NULL,
        '2023-04-22 19:00:00');
INSERT INTO `a_task_log`
VALUES (139, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：78毫秒', 1, NULL,
        '2023-04-22 19:00:00');
INSERT INTO `a_task_log`
VALUES (140, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：163毫秒', 1, NULL,
        '2023-04-22 19:00:00');
INSERT INTO `a_task_log`
VALUES (141, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：68毫秒', 1, NULL,
        '2023-04-22 20:00:00');
INSERT INTO `a_task_log`
VALUES (142, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：73毫秒', 1, NULL,
        '2023-04-22 20:00:00');
INSERT INTO `a_task_log`
VALUES (143, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：61毫秒', 1, NULL,
        '2023-04-22 20:00:00');
INSERT INTO `a_task_log`
VALUES (144, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：67毫秒', 1, NULL,
        '2023-04-22 21:00:00');
INSERT INTO `a_task_log`
VALUES (145, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：66毫秒', 1, NULL,
        '2023-04-22 21:00:00');
INSERT INTO `a_task_log`
VALUES (146, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：111毫秒', 1, NULL,
        '2023-04-22 21:00:00');
INSERT INTO `a_task_log`
VALUES (147, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：68毫秒', 1, NULL,
        '2023-04-22 22:00:00');
INSERT INTO `a_task_log`
VALUES (148, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：75毫秒', 1, NULL,
        '2023-04-22 22:00:00');
INSERT INTO `a_task_log`
VALUES (149, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：23毫秒', 1, NULL,
        '2023-04-22 23:00:00');
INSERT INTO `a_task_log`
VALUES (150, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：63毫秒', 1, NULL,
        '2023-04-22 23:00:00');
INSERT INTO `a_task_log`
VALUES (151, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：92毫秒', 1, NULL,
        '2023-04-22 23:00:00');
INSERT INTO `a_task_log`
VALUES (152, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：19毫秒', 1, NULL,
        '2023-04-23 00:00:00');
INSERT INTO `a_task_log`
VALUES (153, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：12毫秒', 1, NULL,
        '2023-04-23 00:00:00');
INSERT INTO `a_task_log`
VALUES (154, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：135毫秒', 1, NULL,
        '2023-04-23 00:00:00');
INSERT INTO `a_task_log`
VALUES (155, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：135毫秒', 1, NULL,
        '2023-04-23 00:00:00');
INSERT INTO `a_task_log`
VALUES (156, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：67毫秒', 1, NULL,
        '2023-04-23 00:00:00');
INSERT INTO `a_task_log`
VALUES (157, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：514毫秒', 1, NULL,
        '2023-04-23 00:00:01');
INSERT INTO `a_task_log`
VALUES (158, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：95毫秒', 1, NULL,
        '2023-04-23 01:00:00');
INSERT INTO `a_task_log`
VALUES (159, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：103毫秒', 1, NULL,
        '2023-04-23 01:00:00');
INSERT INTO `a_task_log`
VALUES (160, '清除访问日志', 'SYSTEM', 'timedTask.clearVistiLog', '清除访问日志 总共耗时：69毫秒', 1, NULL,
        '2023-04-23 02:00:00');
INSERT INTO `a_task_log`
VALUES (161, '清除访问日志', 'SYSTEM', 'timedTask.clearVistiLog', '清除访问日志 总共耗时：71毫秒', 1, NULL,
        '2023-04-23 02:00:00');
INSERT INTO `a_task_log`
VALUES (162, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：106毫秒', 1, NULL,
        '2023-04-23 02:00:00');
INSERT INTO `a_task_log`
VALUES (163, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：117毫秒', 1, NULL,
        '2023-04-23 02:00:00');
INSERT INTO `a_task_log`
VALUES (164, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：89毫秒', 1, NULL,
        '2023-04-23 03:00:00');
INSERT INTO `a_task_log`
VALUES (165, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：91毫秒', 1, NULL,
        '2023-04-23 03:00:00');
INSERT INTO `a_task_log`
VALUES (166, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：72毫秒', 1, NULL,
        '2023-04-23 04:00:00');
INSERT INTO `a_task_log`
VALUES (167, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：76毫秒', 1, NULL,
        '2023-04-23 04:00:00');
INSERT INTO `a_task_log`
VALUES (168, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：84毫秒', 1, NULL,
        '2023-04-23 05:00:00');
INSERT INTO `a_task_log`
VALUES (169, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：94毫秒', 1, NULL,
        '2023-04-23 05:00:00');
INSERT INTO `a_task_log`
VALUES (170, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：66毫秒', 1, NULL,
        '2023-04-23 06:00:00');
INSERT INTO `a_task_log`
VALUES (171, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：68毫秒', 1, NULL,
        '2023-04-23 06:00:00');
INSERT INTO `a_task_log`
VALUES (172, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：80毫秒', 1, NULL,
        '2023-04-23 07:00:00');
INSERT INTO `a_task_log`
VALUES (173, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：81毫秒', 1, NULL,
        '2023-04-23 07:00:00');
INSERT INTO `a_task_log`
VALUES (174, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：87毫秒', 1, NULL,
        '2023-04-23 08:00:00');
INSERT INTO `a_task_log`
VALUES (175, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：116毫秒', 1, NULL,
        '2023-04-23 08:00:00');
INSERT INTO `a_task_log`
VALUES (176, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：88毫秒', 1, NULL,
        '2023-04-23 09:00:00');
INSERT INTO `a_task_log`
VALUES (177, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：100毫秒', 1, NULL,
        '2023-04-23 09:00:00');
INSERT INTO `a_task_log`
VALUES (178, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：82毫秒', 1, NULL,
        '2023-04-23 10:00:00');
INSERT INTO `a_task_log`
VALUES (179, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：82毫秒', 1, NULL,
        '2023-04-23 10:00:00');
INSERT INTO `a_task_log`
VALUES (180, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：70毫秒', 1, NULL,
        '2023-04-23 11:00:00');
INSERT INTO `a_task_log`
VALUES (181, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：72毫秒', 1, NULL,
        '2023-04-23 11:00:00');
INSERT INTO `a_task_log`
VALUES (182, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：107毫秒', 1, NULL,
        '2023-04-23 12:00:00');
INSERT INTO `a_task_log`
VALUES (183, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：109毫秒', 1, NULL,
        '2023-04-23 12:00:00');
INSERT INTO `a_task_log`
VALUES (184, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：78毫秒', 1, NULL,
        '2023-04-23 13:00:00');
INSERT INTO `a_task_log`
VALUES (185, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：83毫秒', 1, NULL,
        '2023-04-23 13:00:00');
INSERT INTO `a_task_log`
VALUES (186, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：76毫秒', 1, NULL,
        '2023-04-23 14:00:00');
INSERT INTO `a_task_log`
VALUES (187, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：85毫秒', 1, NULL,
        '2023-04-23 14:00:00');
INSERT INTO `a_task_log`
VALUES (188, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：79毫秒', 1, NULL,
        '2023-04-23 15:00:00');
INSERT INTO `a_task_log`
VALUES (189, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：80毫秒', 1, NULL,
        '2023-04-23 15:00:00');
INSERT INTO `a_task_log`
VALUES (190, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：74毫秒', 1, NULL,
        '2023-04-23 16:00:00');
INSERT INTO `a_task_log`
VALUES (191, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：98毫秒', 1, NULL,
        '2023-04-23 16:00:00');
INSERT INTO `a_task_log`
VALUES (192, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：85毫秒', 1, NULL,
        '2023-04-23 17:00:00');
INSERT INTO `a_task_log`
VALUES (193, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：98毫秒', 1, NULL,
        '2023-04-23 17:00:00');
INSERT INTO `a_task_log`
VALUES (194, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：91毫秒', 1, NULL,
        '2023-04-23 18:00:00');
INSERT INTO `a_task_log`
VALUES (195, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：97毫秒', 1, NULL,
        '2023-04-23 18:00:00');
INSERT INTO `a_task_log`
VALUES (196, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：74毫秒', 1, NULL,
        '2023-04-23 19:00:00');
INSERT INTO `a_task_log`
VALUES (197, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：77毫秒', 1, NULL,
        '2023-04-23 19:00:00');
INSERT INTO `a_task_log`
VALUES (198, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：127毫秒', 1, NULL,
        '2023-04-23 20:00:00');
INSERT INTO `a_task_log`
VALUES (199, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：131毫秒', 1, NULL,
        '2023-04-23 20:00:00');
INSERT INTO `a_task_log`
VALUES (200, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：75毫秒', 1, NULL,
        '2023-04-23 21:00:00');
INSERT INTO `a_task_log`
VALUES (201, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：79毫秒', 1, NULL,
        '2023-04-23 21:00:00');
INSERT INTO `a_task_log`
VALUES (202, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：91毫秒', 1, NULL,
        '2023-04-23 22:00:00');
INSERT INTO `a_task_log`
VALUES (203, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：94毫秒', 1, NULL,
        '2023-04-23 22:00:00');
INSERT INTO `a_task_log`
VALUES (204, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：77毫秒', 1, NULL,
        '2023-04-23 23:00:00');
INSERT INTO `a_task_log`
VALUES (205, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：89毫秒', 1, NULL,
        '2023-04-23 23:00:00');
INSERT INTO `a_task_log`
VALUES (206, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：5毫秒', 1, NULL,
        '2023-04-24 00:00:00');
INSERT INTO `a_task_log`
VALUES (207, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：5毫秒', 1, NULL,
        '2023-04-24 00:00:00');
INSERT INTO `a_task_log`
VALUES (208, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：104毫秒', 1, NULL,
        '2023-04-24 00:00:00');
INSERT INTO `a_task_log`
VALUES (209, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：116毫秒', 1, NULL,
        '2023-04-24 00:00:00');
INSERT INTO `a_task_log`
VALUES (210, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：76毫秒', 1, NULL,
        '2023-04-24 01:00:00');
INSERT INTO `a_task_log`
VALUES (211, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：92毫秒', 1, NULL,
        '2023-04-24 01:00:00');
INSERT INTO `a_task_log`
VALUES (212, '清除访问日志', 'SYSTEM', 'timedTask.clearVistiLog', '清除访问日志 总共耗时：112毫秒', 1, NULL,
        '2023-04-24 02:00:00');
INSERT INTO `a_task_log`
VALUES (213, '清除访问日志', 'SYSTEM', 'timedTask.clearVistiLog', '清除访问日志 总共耗时：144毫秒', 1, NULL,
        '2023-04-24 02:00:00');
INSERT INTO `a_task_log`
VALUES (214, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：161毫秒', 1, NULL,
        '2023-04-24 02:00:00');
INSERT INTO `a_task_log`
VALUES (215, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：166毫秒', 1, NULL,
        '2023-04-24 02:00:00');
INSERT INTO `a_task_log`
VALUES (216, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：89毫秒', 1, NULL,
        '2023-04-24 03:00:00');
INSERT INTO `a_task_log`
VALUES (217, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：97毫秒', 1, NULL,
        '2023-04-24 03:00:00');
INSERT INTO `a_task_log`
VALUES (218, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：72毫秒', 1, NULL,
        '2023-04-24 04:00:00');
INSERT INTO `a_task_log`
VALUES (219, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：106毫秒', 1, NULL,
        '2023-04-24 04:00:00');
INSERT INTO `a_task_log`
VALUES (220, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：81毫秒', 1, NULL,
        '2023-04-24 05:00:00');
INSERT INTO `a_task_log`
VALUES (221, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：81毫秒', 1, NULL,
        '2023-04-24 05:00:00');
INSERT INTO `a_task_log`
VALUES (222, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：80毫秒', 1, NULL,
        '2023-04-24 06:00:00');
INSERT INTO `a_task_log`
VALUES (223, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：85毫秒', 1, NULL,
        '2023-04-24 06:00:00');
INSERT INTO `a_task_log`
VALUES (224, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：81毫秒', 1, NULL,
        '2023-04-24 07:00:00');
INSERT INTO `a_task_log`
VALUES (225, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：100毫秒', 1, NULL,
        '2023-04-24 07:00:00');
INSERT INTO `a_task_log`
VALUES (226, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：27毫秒', 1, NULL,
        '2023-04-24 08:00:00');
INSERT INTO `a_task_log`
VALUES (227, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：105毫秒', 1, NULL,
        '2023-04-24 08:00:00');
INSERT INTO `a_task_log`
VALUES (228, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：102毫秒', 1, NULL,
        '2023-04-24 09:00:00');
INSERT INTO `a_task_log`
VALUES (229, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：105毫秒', 1, NULL,
        '2023-04-24 09:00:00');
INSERT INTO `a_task_log`
VALUES (230, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：115毫秒', 1, NULL,
        '2023-04-24 10:00:00');
INSERT INTO `a_task_log`
VALUES (231, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：134毫秒', 1, NULL,
        '2023-04-24 10:00:00');
INSERT INTO `a_task_log`
VALUES (232, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：85毫秒', 1, NULL,
        '2023-04-24 11:00:00');
INSERT INTO `a_task_log`
VALUES (233, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：88毫秒', 1, NULL,
        '2023-04-24 11:00:00');
INSERT INTO `a_task_log`
VALUES (234, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：85毫秒', 1, NULL,
        '2023-04-24 12:00:00');
INSERT INTO `a_task_log`
VALUES (235, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：99毫秒', 1, NULL,
        '2023-04-24 12:00:00');
INSERT INTO `a_task_log`
VALUES (236, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：106毫秒', 1, NULL,
        '2023-04-24 13:00:00');
INSERT INTO `a_task_log`
VALUES (237, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：105毫秒', 1, NULL,
        '2023-04-24 13:00:00');
INSERT INTO `a_task_log`
VALUES (238, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：211毫秒', 1, NULL,
        '2023-04-24 14:00:00');
INSERT INTO `a_task_log`
VALUES (239, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：211毫秒', 1, NULL,
        '2023-04-24 14:00:00');
INSERT INTO `a_task_log`
VALUES (240, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：125毫秒', 1, NULL,
        '2023-04-24 15:00:00');
INSERT INTO `a_task_log`
VALUES (241, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：155毫秒', 1, NULL,
        '2023-04-24 15:00:00');
INSERT INTO `a_task_log`
VALUES (242, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：173毫秒', 1, NULL,
        '2023-04-24 16:00:00');
INSERT INTO `a_task_log`
VALUES (243, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：176毫秒', 1, NULL,
        '2023-04-24 16:00:00');
INSERT INTO `a_task_log`
VALUES (244, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：70毫秒', 1, NULL,
        '2023-04-24 17:00:00');
INSERT INTO `a_task_log`
VALUES (245, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：78毫秒', 1, NULL,
        '2023-04-24 17:00:00');
INSERT INTO `a_task_log`
VALUES (246, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：93毫秒', 1, NULL,
        '2023-04-24 18:00:00');
INSERT INTO `a_task_log`
VALUES (247, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：105毫秒', 1, NULL,
        '2023-04-24 18:00:00');
INSERT INTO `a_task_log`
VALUES (248, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：129毫秒', 1, NULL,
        '2023-04-24 19:00:00');
INSERT INTO `a_task_log`
VALUES (249, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：131毫秒', 1, NULL,
        '2023-04-24 19:00:00');
INSERT INTO `a_task_log`
VALUES (250, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：70毫秒', 1, NULL,
        '2023-04-24 20:00:00');
INSERT INTO `a_task_log`
VALUES (251, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：85毫秒', 1, NULL,
        '2023-04-24 20:00:00');
INSERT INTO `a_task_log`
VALUES (252, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：99毫秒', 1, NULL,
        '2023-04-24 21:00:00');
INSERT INTO `a_task_log`
VALUES (253, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：115毫秒', 1, NULL,
        '2023-04-24 21:00:00');
INSERT INTO `a_task_log`
VALUES (254, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：83毫秒', 1, NULL,
        '2023-04-24 22:00:00');
INSERT INTO `a_task_log`
VALUES (255, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：87毫秒', 1, NULL,
        '2023-04-24 22:00:00');
INSERT INTO `a_task_log`
VALUES (256, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：203毫秒', 1, NULL,
        '2023-04-24 23:00:00');
INSERT INTO `a_task_log`
VALUES (257, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：205毫秒', 1, NULL,
        '2023-04-24 23:00:00');
INSERT INTO `a_task_log`
VALUES (258, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：11毫秒', 1, NULL,
        '2023-04-25 00:00:00');
INSERT INTO `a_task_log`
VALUES (259, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：13毫秒', 1, NULL,
        '2023-04-25 00:00:00');
INSERT INTO `a_task_log`
VALUES (260, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：109毫秒', 1, NULL,
        '2023-04-25 00:00:00');
INSERT INTO `a_task_log`
VALUES (261, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：117毫秒', 1, NULL,
        '2023-04-25 00:00:00');
INSERT INTO `a_task_log`
VALUES (262, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：123毫秒', 1, NULL,
        '2023-04-25 00:00:00');
INSERT INTO `a_task_log`
VALUES (263, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：491毫秒', 1, NULL,
        '2023-04-25 00:00:01');
INSERT INTO `a_task_log`
VALUES (264, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：84毫秒', 1, NULL,
        '2023-04-25 01:00:00');
INSERT INTO `a_task_log`
VALUES (265, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：96毫秒', 1, NULL,
        '2023-04-25 01:00:00');
INSERT INTO `a_task_log`
VALUES (266, '清除访问日志', 'SYSTEM', 'timedTask.clearVistiLog', '清除访问日志 总共耗时：60毫秒', 1, NULL,
        '2023-04-25 02:00:00');
INSERT INTO `a_task_log`
VALUES (267, '清除访问日志', 'SYSTEM', 'timedTask.clearVistiLog', '清除访问日志 总共耗时：66毫秒', 1, NULL,
        '2023-04-25 02:00:00');
INSERT INTO `a_task_log`
VALUES (268, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：115毫秒', 1, NULL,
        '2023-04-25 02:00:00');
INSERT INTO `a_task_log`
VALUES (269, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：132毫秒', 1, NULL,
        '2023-04-25 02:00:00');
INSERT INTO `a_task_log`
VALUES (270, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：91毫秒', 1, NULL,
        '2023-04-25 03:00:00');
INSERT INTO `a_task_log`
VALUES (271, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：96毫秒', 1, NULL,
        '2023-04-25 03:00:00');
INSERT INTO `a_task_log`
VALUES (272, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：80毫秒', 1, NULL,
        '2023-04-25 04:00:00');
INSERT INTO `a_task_log`
VALUES (273, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：85毫秒', 1, NULL,
        '2023-04-25 04:00:00');
INSERT INTO `a_task_log`
VALUES (274, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：61毫秒', 1, NULL,
        '2023-04-25 05:00:00');
INSERT INTO `a_task_log`
VALUES (275, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：62毫秒', 1, NULL,
        '2023-04-25 05:00:00');
INSERT INTO `a_task_log`
VALUES (276, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：61毫秒', 1, NULL,
        '2023-04-25 06:00:00');
INSERT INTO `a_task_log`
VALUES (277, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：63毫秒', 1, NULL,
        '2023-04-25 06:00:00');
INSERT INTO `a_task_log`
VALUES (278, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：64毫秒', 1, NULL,
        '2023-04-25 07:00:00');
INSERT INTO `a_task_log`
VALUES (279, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：115毫秒', 1, NULL,
        '2023-04-25 07:00:00');
INSERT INTO `a_task_log`
VALUES (280, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：68毫秒', 1, NULL,
        '2023-04-25 08:00:00');
INSERT INTO `a_task_log`
VALUES (281, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：85毫秒', 1, NULL,
        '2023-04-25 08:00:00');
INSERT INTO `a_task_log`
VALUES (282, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：120毫秒', 1, NULL,
        '2023-04-25 08:00:00');
INSERT INTO `a_task_log`
VALUES (283, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：70毫秒', 1, NULL,
        '2023-04-25 09:00:00');
INSERT INTO `a_task_log`
VALUES (284, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：111毫秒', 1, NULL,
        '2023-04-25 09:00:00');
INSERT INTO `a_task_log`
VALUES (285, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：117毫秒', 1, NULL,
        '2023-04-25 09:00:00');
INSERT INTO `a_task_log`
VALUES (286, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：63毫秒', 1, NULL,
        '2023-04-25 10:00:00');
INSERT INTO `a_task_log`
VALUES (287, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：82毫秒', 1, NULL,
        '2023-04-25 10:00:00');
INSERT INTO `a_task_log`
VALUES (288, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：120086毫秒', 0, NULL,
        '2023-04-25 10:09:13');
INSERT INTO `a_task_log`
VALUES (289, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：120毫秒', 1, NULL,
        '2023-04-25 11:00:00');
INSERT INTO `a_task_log`
VALUES (290, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：146毫秒', 1, NULL,
        '2023-04-25 11:00:00');
INSERT INTO `a_task_log`
VALUES (291, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：73毫秒', 1, NULL,
        '2023-04-25 12:00:00');
INSERT INTO `a_task_log`
VALUES (292, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：88毫秒', 1, NULL,
        '2023-04-25 12:00:00');
INSERT INTO `a_task_log`
VALUES (293, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：78毫秒', 1, NULL,
        '2023-04-25 13:00:00');
INSERT INTO `a_task_log`
VALUES (294, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：117毫秒', 1, NULL,
        '2023-04-25 13:00:00');
INSERT INTO `a_task_log`
VALUES (295, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：66毫秒', 1, NULL,
        '2023-04-25 14:00:00');
INSERT INTO `a_task_log`
VALUES (296, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：67毫秒', 1, NULL,
        '2023-04-25 14:00:00');
INSERT INTO `a_task_log`
VALUES (297, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：901毫秒', 1, NULL,
        '2023-04-25 14:00:01');
INSERT INTO `a_task_log`
VALUES (298, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：66毫秒', 1, NULL,
        '2023-04-25 15:00:00');
INSERT INTO `a_task_log`
VALUES (299, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：95毫秒', 1, NULL,
        '2023-04-25 15:00:00');
INSERT INTO `a_task_log`
VALUES (300, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：101608毫秒', 1, NULL,
        '2023-04-25 15:23:51');
INSERT INTO `a_task_log`
VALUES (301, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：138毫秒', 1, NULL,
        '2023-04-25 16:00:00');
INSERT INTO `a_task_log`
VALUES (302, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：115毫秒', 1, NULL,
        '2023-04-25 16:00:00');
INSERT INTO `a_task_log`
VALUES (303, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：211毫秒', 1, NULL,
        '2023-04-25 16:00:00');
INSERT INTO `a_task_log`
VALUES (304, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：93毫秒', 1, NULL,
        '2023-04-25 17:00:00');
INSERT INTO `a_task_log`
VALUES (305, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：76毫秒', 1, NULL,
        '2023-04-25 17:00:00');
INSERT INTO `a_task_log`
VALUES (306, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：92毫秒', 1, NULL,
        '2023-04-25 17:00:00');
INSERT INTO `a_task_log`
VALUES (307, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：94毫秒', 1, NULL,
        '2023-04-25 18:00:00');
INSERT INTO `a_task_log`
VALUES (308, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：72毫秒', 1, NULL,
        '2023-04-25 18:00:00');
INSERT INTO `a_task_log`
VALUES (309, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：75毫秒', 1, NULL,
        '2023-04-25 18:00:00');
INSERT INTO `a_task_log`
VALUES (310, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：135毫秒', 1, NULL,
        '2023-04-25 19:00:00');
INSERT INTO `a_task_log`
VALUES (311, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：143毫秒', 1, NULL,
        '2023-04-25 19:00:00');
INSERT INTO `a_task_log`
VALUES (312, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：234毫秒', 1, NULL,
        '2023-04-25 19:00:00');
INSERT INTO `a_task_log`
VALUES (313, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：67毫秒', 1, NULL,
        '2023-04-25 20:00:00');
INSERT INTO `a_task_log`
VALUES (314, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：154毫秒', 1, NULL,
        '2023-04-25 20:00:00');
INSERT INTO `a_task_log`
VALUES (315, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：181毫秒', 1, NULL,
        '2023-04-25 20:00:00');
INSERT INTO `a_task_log`
VALUES (316, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：62毫秒', 1, NULL,
        '2023-04-25 21:00:00');
INSERT INTO `a_task_log`
VALUES (317, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：65毫秒', 1, NULL,
        '2023-04-25 21:00:00');
INSERT INTO `a_task_log`
VALUES (318, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：91毫秒', 1, NULL,
        '2023-04-25 21:00:00');
INSERT INTO `a_task_log`
VALUES (319, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：65毫秒', 1, NULL,
        '2023-04-25 22:00:00');
INSERT INTO `a_task_log`
VALUES (320, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：62毫秒', 1, NULL,
        '2023-04-25 22:00:00');
INSERT INTO `a_task_log`
VALUES (321, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：77毫秒', 1, NULL,
        '2023-04-25 22:00:00');
INSERT INTO `a_task_log`
VALUES (322, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：62毫秒', 1, NULL,
        '2023-04-25 23:00:00');
INSERT INTO `a_task_log`
VALUES (323, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：65毫秒', 1, NULL,
        '2023-04-25 23:00:00');
INSERT INTO `a_task_log`
VALUES (324, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：93毫秒', 1, NULL,
        '2023-04-25 23:00:00');
INSERT INTO `a_task_log`
VALUES (325, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：7毫秒', 1, NULL,
        '2023-04-26 00:00:00');
INSERT INTO `a_task_log`
VALUES (326, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：6毫秒', 1, NULL,
        '2023-04-26 00:00:00');
INSERT INTO `a_task_log`
VALUES (327, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：105毫秒', 1, NULL,
        '2023-04-26 00:00:00');
INSERT INTO `a_task_log`
VALUES (328, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：125毫秒', 1, NULL,
        '2023-04-26 00:00:00');
INSERT INTO `a_task_log`
VALUES (329, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：72毫秒', 1, NULL,
        '2023-04-26 01:00:00');
INSERT INTO `a_task_log`
VALUES (330, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：100毫秒', 1, NULL,
        '2023-04-26 01:00:00');
INSERT INTO `a_task_log`
VALUES (331, '清除访问日志', 'SYSTEM', 'timedTask.clearVistiLog', '清除访问日志 总共耗时：69毫秒', 1, NULL,
        '2023-04-26 02:00:00');
INSERT INTO `a_task_log`
VALUES (332, '清除访问日志', 'SYSTEM', 'timedTask.clearVistiLog', '清除访问日志 总共耗时：72毫秒', 1, NULL,
        '2023-04-26 02:00:00');
INSERT INTO `a_task_log`
VALUES (333, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：115毫秒', 1, NULL,
        '2023-04-26 02:00:00');
INSERT INTO `a_task_log`
VALUES (334, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：117毫秒', 1, NULL,
        '2023-04-26 02:00:00');
INSERT INTO `a_task_log`
VALUES (335, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：78毫秒', 1, NULL,
        '2023-04-26 03:00:00');
INSERT INTO `a_task_log`
VALUES (336, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：86毫秒', 1, NULL,
        '2023-04-26 03:00:00');
INSERT INTO `a_task_log`
VALUES (337, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：81毫秒', 1, NULL,
        '2023-04-26 04:00:00');
INSERT INTO `a_task_log`
VALUES (338, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：85毫秒', 1, NULL,
        '2023-04-26 04:00:00');
INSERT INTO `a_task_log`
VALUES (339, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：63毫秒', 1, NULL,
        '2023-04-26 05:00:00');
INSERT INTO `a_task_log`
VALUES (340, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：65毫秒', 1, NULL,
        '2023-04-26 05:00:00');
INSERT INTO `a_task_log`
VALUES (341, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：66毫秒', 1, NULL,
        '2023-04-26 06:00:00');
INSERT INTO `a_task_log`
VALUES (342, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：80毫秒', 1, NULL,
        '2023-04-26 06:00:00');
INSERT INTO `a_task_log`
VALUES (343, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：127毫秒', 1, NULL,
        '2023-04-26 07:00:00');
INSERT INTO `a_task_log`
VALUES (344, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：143毫秒', 1, NULL,
        '2023-04-26 07:00:00');
INSERT INTO `a_task_log`
VALUES (345, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：81毫秒', 1, NULL,
        '2023-04-26 08:00:00');
INSERT INTO `a_task_log`
VALUES (346, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：85毫秒', 1, NULL,
        '2023-04-26 08:00:00');
INSERT INTO `a_task_log`
VALUES (347, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：86毫秒', 1, NULL,
        '2023-04-26 09:00:00');
INSERT INTO `a_task_log`
VALUES (348, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：146毫秒', 1, NULL,
        '2023-04-26 09:00:00');
INSERT INTO `a_task_log`
VALUES (349, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：243毫秒', 1, NULL,
        '2023-04-26 09:00:00');
INSERT INTO `a_task_log`
VALUES (350, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：74毫秒', 1, NULL,
        '2023-04-26 10:00:00');
INSERT INTO `a_task_log`
VALUES (351, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：79毫秒', 1, NULL,
        '2023-04-26 10:00:00');
INSERT INTO `a_task_log`
VALUES (352, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：66毫秒', 1, NULL,
        '2023-04-26 11:00:00');
INSERT INTO `a_task_log`
VALUES (353, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：70毫秒', 1, NULL,
        '2023-04-26 11:00:00');
INSERT INTO `a_task_log`
VALUES (354, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：338毫秒', 1, NULL,
        '2023-04-26 11:00:00');
INSERT INTO `a_task_log`
VALUES (355, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：63毫秒', 1, NULL,
        '2023-04-26 12:00:00');
INSERT INTO `a_task_log`
VALUES (356, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：60毫秒', 1, NULL,
        '2023-04-26 12:00:00');
INSERT INTO `a_task_log`
VALUES (357, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：170毫秒', 1, NULL,
        '2023-04-26 12:00:00');
INSERT INTO `a_task_log`
VALUES (358, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：88毫秒', 1, NULL,
        '2023-04-26 13:00:00');
INSERT INTO `a_task_log`
VALUES (359, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：137毫秒', 1, NULL,
        '2023-04-26 13:00:00');
INSERT INTO `a_task_log`
VALUES (360, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：334毫秒', 1, NULL,
        '2023-04-26 13:00:00');
INSERT INTO `a_task_log`
VALUES (361, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：79毫秒', 1, NULL,
        '2023-04-26 14:00:00');
INSERT INTO `a_task_log`
VALUES (362, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：104毫秒', 1, NULL,
        '2023-04-26 14:00:00');
INSERT INTO `a_task_log`
VALUES (363, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：195毫秒', 1, NULL,
        '2023-04-26 14:00:00');
INSERT INTO `a_task_log`
VALUES (364, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：64毫秒', 1, NULL,
        '2023-04-26 15:00:00');
INSERT INTO `a_task_log`
VALUES (365, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：65毫秒', 1, NULL,
        '2023-04-26 15:00:00');
INSERT INTO `a_task_log`
VALUES (366, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：83毫秒', 1, NULL,
        '2023-04-26 15:00:00');
INSERT INTO `a_task_log`
VALUES (367, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：60毫秒', 1, NULL,
        '2023-04-26 16:00:00');
INSERT INTO `a_task_log`
VALUES (368, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：62毫秒', 1, NULL,
        '2023-04-26 16:00:00');
INSERT INTO `a_task_log`
VALUES (369, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：254毫秒', 1, NULL,
        '2023-04-26 16:00:00');
INSERT INTO `a_task_log`
VALUES (370, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：84毫秒', 1, NULL,
        '2023-04-26 17:00:00');
INSERT INTO `a_task_log`
VALUES (371, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：93毫秒', 1, NULL,
        '2023-04-26 17:00:00');
INSERT INTO `a_task_log`
VALUES (372, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：122毫秒', 1, NULL,
        '2023-04-26 17:00:00');
INSERT INTO `a_task_log`
VALUES (373, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：83毫秒', 1, NULL,
        '2023-04-26 18:00:00');
INSERT INTO `a_task_log`
VALUES (374, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：84毫秒', 1, NULL,
        '2023-04-26 18:00:00');
INSERT INTO `a_task_log`
VALUES (375, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：95毫秒', 1, NULL,
        '2023-04-26 19:00:00');
INSERT INTO `a_task_log`
VALUES (376, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：113毫秒', 1, NULL,
        '2023-04-26 19:00:00');
INSERT INTO `a_task_log`
VALUES (377, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：68毫秒', 1, NULL,
        '2023-04-26 20:00:00');
INSERT INTO `a_task_log`
VALUES (378, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：89毫秒', 1, NULL,
        '2023-04-26 20:00:00');
INSERT INTO `a_task_log`
VALUES (379, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：66毫秒', 1, NULL,
        '2023-04-26 21:00:00');
INSERT INTO `a_task_log`
VALUES (380, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：92毫秒', 1, NULL,
        '2023-04-26 21:00:00');
INSERT INTO `a_task_log`
VALUES (381, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：27850毫秒', 1, NULL,
        '2023-04-26 21:13:29');
INSERT INTO `a_task_log`
VALUES (382, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：70毫秒', 1, NULL,
        '2023-04-26 21:13:29');
INSERT INTO `a_task_log`
VALUES (383, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：69毫秒', 1, NULL,
        '2023-04-26 21:13:29');
INSERT INTO `a_task_log`
VALUES (384, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：68毫秒', 1, NULL,
        '2023-04-26 21:13:29');
INSERT INTO `a_task_log`
VALUES (385, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：85毫秒', 1, NULL,
        '2023-04-26 22:00:00');
INSERT INTO `a_task_log`
VALUES (386, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：59毫秒', 1, NULL,
        '2023-04-26 22:00:00');
INSERT INTO `a_task_log`
VALUES (387, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：60毫秒', 1, NULL,
        '2023-04-26 22:00:00');
INSERT INTO `a_task_log`
VALUES (388, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：242毫秒', 1, NULL,
        '2023-04-26 23:00:00');
INSERT INTO `a_task_log`
VALUES (389, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：68毫秒', 1, NULL,
        '2023-04-26 23:00:00');
INSERT INTO `a_task_log`
VALUES (390, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：72毫秒', 1, NULL,
        '2023-04-26 23:00:00');
INSERT INTO `a_task_log`
VALUES (391, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：332毫秒', 1, NULL,
        '2023-04-27 00:00:00');
INSERT INTO `a_task_log`
VALUES (392, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：4毫秒', 1, NULL,
        '2023-04-27 00:00:00');
INSERT INTO `a_task_log`
VALUES (393, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：45毫秒', 1, NULL,
        '2023-04-27 00:00:00');
INSERT INTO `a_task_log`
VALUES (394, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：5毫秒', 1, NULL,
        '2023-04-27 00:00:00');
INSERT INTO `a_task_log`
VALUES (395, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：94毫秒', 1, NULL,
        '2023-04-27 00:00:00');
INSERT INTO `a_task_log`
VALUES (396, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：1108毫秒', 1, NULL,
        '2023-04-27 00:00:01');
INSERT INTO `a_task_log`
VALUES (397, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：60毫秒', 1, NULL,
        '2023-04-27 01:00:00');
INSERT INTO `a_task_log`
VALUES (398, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：60毫秒', 1, NULL,
        '2023-04-27 01:00:00');
INSERT INTO `a_task_log`
VALUES (399, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：553毫秒', 1, NULL,
        '2023-04-27 01:00:01');
INSERT INTO `a_task_log`
VALUES (400, '清除访问日志', 'SYSTEM', 'timedTask.clearVistiLog', '清除访问日志 总共耗时：84毫秒', 1, NULL,
        '2023-04-27 02:00:00');
INSERT INTO `a_task_log`
VALUES (401, '清除访问日志', 'SYSTEM', 'timedTask.clearVistiLog', '清除访问日志 总共耗时：85毫秒', 1, NULL,
        '2023-04-27 02:00:00');
INSERT INTO `a_task_log`
VALUES (402, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：129毫秒', 1, NULL,
        '2023-04-27 02:00:00');
INSERT INTO `a_task_log`
VALUES (403, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：134毫秒', 1, NULL,
        '2023-04-27 02:00:00');
INSERT INTO `a_task_log`
VALUES (404, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：74毫秒', 1, NULL,
        '2023-04-27 03:00:00');
INSERT INTO `a_task_log`
VALUES (405, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：106毫秒', 1, NULL,
        '2023-04-27 03:00:00');
INSERT INTO `a_task_log`
VALUES (406, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：21毫秒', 1, NULL,
        '2023-04-27 04:00:00');
INSERT INTO `a_task_log`
VALUES (407, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：61毫秒', 1, NULL,
        '2023-04-27 04:00:00');
INSERT INTO `a_task_log`
VALUES (408, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：63毫秒', 1, NULL,
        '2023-04-27 05:00:00');
INSERT INTO `a_task_log`
VALUES (409, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：64毫秒', 1, NULL,
        '2023-04-27 05:00:00');
INSERT INTO `a_task_log`
VALUES (410, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：61毫秒', 1, NULL,
        '2023-04-27 06:00:00');
INSERT INTO `a_task_log`
VALUES (411, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：65毫秒', 1, NULL,
        '2023-04-27 06:00:00');
INSERT INTO `a_task_log`
VALUES (412, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：66毫秒', 1, NULL,
        '2023-04-27 07:00:00');
INSERT INTO `a_task_log`
VALUES (413, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：69毫秒', 1, NULL,
        '2023-04-27 07:00:00');
INSERT INTO `a_task_log`
VALUES (414, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：62毫秒', 1, NULL,
        '2023-04-27 08:00:00');
INSERT INTO `a_task_log`
VALUES (415, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：62毫秒', 1, NULL,
        '2023-04-27 08:00:00');
INSERT INTO `a_task_log`
VALUES (416, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：92毫秒', 1, NULL,
        '2023-04-27 09:00:00');
INSERT INTO `a_task_log`
VALUES (417, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：92毫秒', 1, NULL,
        '2023-04-27 09:00:00');
INSERT INTO `a_task_log`
VALUES (418, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：87毫秒', 1, NULL,
        '2023-04-27 10:00:00');
INSERT INTO `a_task_log`
VALUES (419, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：93毫秒', 1, NULL,
        '2023-04-27 10:00:00');
INSERT INTO `a_task_log`
VALUES (420, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：62毫秒', 1, NULL,
        '2023-04-27 11:00:00');
INSERT INTO `a_task_log`
VALUES (421, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：63毫秒', 1, NULL,
        '2023-04-27 11:00:00');
INSERT INTO `a_task_log`
VALUES (422, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：72毫秒', 1, NULL,
        '2023-04-27 12:00:00');
INSERT INTO `a_task_log`
VALUES (423, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：74毫秒', 1, NULL,
        '2023-04-27 12:00:00');
INSERT INTO `a_task_log`
VALUES (424, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：70毫秒', 1, NULL,
        '2023-04-27 13:00:00');
INSERT INTO `a_task_log`
VALUES (425, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：82毫秒', 1, NULL,
        '2023-04-27 13:00:00');
INSERT INTO `a_task_log`
VALUES (426, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：63毫秒', 1, NULL,
        '2023-04-27 14:00:00');
INSERT INTO `a_task_log`
VALUES (427, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：72毫秒', 1, NULL,
        '2023-04-27 14:00:00');
INSERT INTO `a_task_log`
VALUES (428, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：69毫秒', 1, NULL,
        '2023-04-27 15:00:00');
INSERT INTO `a_task_log`
VALUES (429, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：174毫秒', 1, NULL,
        '2023-04-27 15:00:00');
INSERT INTO `a_task_log`
VALUES (430, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：99毫秒', 1, NULL,
        '2023-04-27 16:00:00');
INSERT INTO `a_task_log`
VALUES (431, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：105毫秒', 1, NULL,
        '2023-04-27 16:00:00');
INSERT INTO `a_task_log`
VALUES (432, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：65毫秒', 1, NULL,
        '2023-04-27 17:00:00');
INSERT INTO `a_task_log`
VALUES (433, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：66毫秒', 1, NULL,
        '2023-04-27 17:00:00');
INSERT INTO `a_task_log`
VALUES (434, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：75毫秒', 1, NULL,
        '2023-04-27 18:00:00');
INSERT INTO `a_task_log`
VALUES (435, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：72毫秒', 1, NULL,
        '2023-04-27 18:00:00');
INSERT INTO `a_task_log`
VALUES (436, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：66毫秒', 1, NULL,
        '2023-04-27 19:00:00');
INSERT INTO `a_task_log`
VALUES (437, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：63毫秒', 1, NULL,
        '2023-04-27 19:00:00');
INSERT INTO `a_task_log`
VALUES (438, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：62毫秒', 1, NULL,
        '2023-04-27 20:00:00');
INSERT INTO `a_task_log`
VALUES (439, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：67毫秒', 1, NULL,
        '2023-04-27 20:00:00');
INSERT INTO `a_task_log`
VALUES (440, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：70毫秒', 1, NULL,
        '2023-04-27 21:00:00');
INSERT INTO `a_task_log`
VALUES (441, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：69毫秒', 1, NULL,
        '2023-04-27 21:00:00');
INSERT INTO `a_task_log`
VALUES (442, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：67毫秒', 1, NULL,
        '2023-04-27 22:00:00');
INSERT INTO `a_task_log`
VALUES (443, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：70毫秒', 1, NULL,
        '2023-04-27 22:00:00');
INSERT INTO `a_task_log`
VALUES (444, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：61毫秒', 1, NULL,
        '2023-04-27 23:00:00');
INSERT INTO `a_task_log`
VALUES (445, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：63毫秒', 1, NULL,
        '2023-04-27 23:00:00');
INSERT INTO `a_task_log`
VALUES (446, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：9毫秒', 1, NULL,
        '2023-04-28 00:00:00');
INSERT INTO `a_task_log`
VALUES (447, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：88毫秒', 1, NULL,
        '2023-04-28 00:00:00');
INSERT INTO `a_task_log`
VALUES (448, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：10毫秒', 1, NULL,
        '2023-04-28 00:00:00');
INSERT INTO `a_task_log`
VALUES (449, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：135毫秒', 1, NULL,
        '2023-04-28 00:00:00');
INSERT INTO `a_task_log`
VALUES (450, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：59毫秒', 1, NULL,
        '2023-04-28 01:00:00');
INSERT INTO `a_task_log`
VALUES (451, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：61毫秒', 1, NULL,
        '2023-04-28 01:00:00');
INSERT INTO `a_task_log`
VALUES (452, '清除访问日志', 'SYSTEM', 'timedTask.clearVistiLog', '清除访问日志 总共耗时：92毫秒', 1, NULL,
        '2023-04-28 02:00:00');
INSERT INTO `a_task_log`
VALUES (453, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：113毫秒', 1, NULL,
        '2023-04-28 02:00:00');
INSERT INTO `a_task_log`
VALUES (454, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：115毫秒', 1, NULL,
        '2023-04-28 02:00:00');
INSERT INTO `a_task_log`
VALUES (455, '清除访问日志', 'SYSTEM', 'timedTask.clearVistiLog', '清除访问日志 总共耗时：183毫秒', 1, NULL,
        '2023-04-28 02:00:00');
INSERT INTO `a_task_log`
VALUES (456, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：58毫秒', 1, NULL,
        '2023-04-28 03:00:00');
INSERT INTO `a_task_log`
VALUES (457, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：58毫秒', 1, NULL,
        '2023-04-28 03:00:00');
INSERT INTO `a_task_log`
VALUES (458, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：61毫秒', 1, NULL,
        '2023-04-28 04:00:00');
INSERT INTO `a_task_log`
VALUES (459, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：62毫秒', 1, NULL,
        '2023-04-28 04:00:00');
INSERT INTO `a_task_log`
VALUES (460, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：62毫秒', 1, NULL,
        '2023-04-28 05:00:00');
INSERT INTO `a_task_log`
VALUES (461, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：66毫秒', 1, NULL,
        '2023-04-28 05:00:00');
INSERT INTO `a_task_log`
VALUES (462, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：94毫秒', 1, NULL,
        '2023-04-28 06:00:00');
INSERT INTO `a_task_log`
VALUES (463, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：139毫秒', 1, NULL,
        '2023-04-28 06:00:00');
INSERT INTO `a_task_log`
VALUES (464, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：66毫秒', 1, NULL,
        '2023-04-28 07:00:00');
INSERT INTO `a_task_log`
VALUES (465, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：78毫秒', 1, NULL,
        '2023-04-28 07:00:00');
INSERT INTO `a_task_log`
VALUES (466, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：69毫秒', 1, NULL,
        '2023-04-28 08:00:00');
INSERT INTO `a_task_log`
VALUES (467, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：75毫秒', 1, NULL,
        '2023-04-28 08:00:00');
INSERT INTO `a_task_log`
VALUES (468, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：76毫秒', 1, NULL,
        '2023-04-28 09:00:00');
INSERT INTO `a_task_log`
VALUES (469, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：76毫秒', 1, NULL,
        '2023-04-28 09:00:00');
INSERT INTO `a_task_log`
VALUES (470, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：64毫秒', 1, NULL,
        '2023-04-28 10:00:00');
INSERT INTO `a_task_log`
VALUES (471, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：71毫秒', 1, NULL,
        '2023-04-28 10:00:00');
INSERT INTO `a_task_log`
VALUES (472, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：223毫秒', 1, NULL,
        '2023-04-28 10:00:00');
INSERT INTO `a_task_log`
VALUES (473, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：108毫秒', 1, NULL,
        '2023-04-28 11:00:00');
INSERT INTO `a_task_log`
VALUES (474, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：144毫秒', 1, NULL,
        '2023-04-28 11:00:00');
INSERT INTO `a_task_log`
VALUES (475, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：628毫秒', 1, NULL,
        '2023-04-28 11:00:01');
INSERT INTO `a_task_log`
VALUES (476, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：63毫秒', 1, NULL,
        '2023-04-28 12:00:00');
INSERT INTO `a_task_log`
VALUES (477, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：100毫秒', 1, NULL,
        '2023-04-28 12:00:00');
INSERT INTO `a_task_log`
VALUES (478, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：78毫秒', 1, NULL,
        '2023-04-28 13:00:00');
INSERT INTO `a_task_log`
VALUES (479, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：76毫秒', 1, NULL,
        '2023-04-28 13:00:00');
INSERT INTO `a_task_log`
VALUES (480, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：120073毫秒', 0, NULL,
        '2023-04-28 13:02:40');
INSERT INTO `a_task_log`
VALUES (481, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：90毫秒', 1, NULL,
        '2023-04-28 13:02:47');
INSERT INTO `a_task_log`
VALUES (482, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：69毫秒', 1, NULL,
        '2023-04-28 14:00:00');
INSERT INTO `a_task_log`
VALUES (483, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：77毫秒', 1, NULL,
        '2023-04-28 14:00:00');
INSERT INTO `a_task_log`
VALUES (484, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：60毫秒', 1, NULL,
        '2023-04-28 15:00:00');
INSERT INTO `a_task_log`
VALUES (485, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：61毫秒', 1, NULL,
        '2023-04-28 15:00:00');
INSERT INTO `a_task_log`
VALUES (486, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：84毫秒', 1, NULL,
        '2023-04-28 16:00:00');
INSERT INTO `a_task_log`
VALUES (487, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：84毫秒', 1, NULL,
        '2023-04-28 16:00:00');
INSERT INTO `a_task_log`
VALUES (488, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：64毫秒', 1, NULL,
        '2023-04-28 17:00:00');
INSERT INTO `a_task_log`
VALUES (489, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：83毫秒', 1, NULL,
        '2023-04-28 17:00:00');
INSERT INTO `a_task_log`
VALUES (490, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：72毫秒', 1, NULL,
        '2023-04-28 18:00:00');
INSERT INTO `a_task_log`
VALUES (491, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：79毫秒', 1, NULL,
        '2023-04-28 18:00:00');
INSERT INTO `a_task_log`
VALUES (492, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：94毫秒', 1, NULL,
        '2023-04-28 19:00:00');
INSERT INTO `a_task_log`
VALUES (493, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：102毫秒', 1, NULL,
        '2023-04-28 19:00:00');
INSERT INTO `a_task_log`
VALUES (494, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：77毫秒', 1, NULL,
        '2023-04-28 20:00:00');
INSERT INTO `a_task_log`
VALUES (495, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：80毫秒', 1, NULL,
        '2023-04-28 20:00:00');
INSERT INTO `a_task_log`
VALUES (496, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：64毫秒', 1, NULL,
        '2023-04-28 21:00:00');
INSERT INTO `a_task_log`
VALUES (497, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：65毫秒', 1, NULL,
        '2023-04-28 21:00:00');
INSERT INTO `a_task_log`
VALUES (498, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：72毫秒', 1, NULL,
        '2023-04-28 22:00:00');
INSERT INTO `a_task_log`
VALUES (499, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：88毫秒', 1, NULL,
        '2023-04-28 22:00:00');
INSERT INTO `a_task_log`
VALUES (500, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：66毫秒', 1, NULL,
        '2023-04-28 23:00:00');
INSERT INTO `a_task_log`
VALUES (501, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：71毫秒', 1, NULL,
        '2023-04-28 23:00:00');
INSERT INTO `a_task_log`
VALUES (502, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：18毫秒', 1, NULL,
        '2023-04-29 00:00:00');
INSERT INTO `a_task_log`
VALUES (503, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：12毫秒', 1, NULL,
        '2023-04-29 00:00:00');
INSERT INTO `a_task_log`
VALUES (504, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：139毫秒', 1, NULL,
        '2023-04-29 00:00:00');
INSERT INTO `a_task_log`
VALUES (505, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：155毫秒', 1, NULL,
        '2023-04-29 00:00:00');
INSERT INTO `a_task_log`
VALUES (506, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：72毫秒', 1, NULL,
        '2023-04-29 01:00:00');
INSERT INTO `a_task_log`
VALUES (507, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：67毫秒', 1, NULL,
        '2023-04-29 01:00:00');
INSERT INTO `a_task_log`
VALUES (508, '清除访问日志', 'SYSTEM', 'timedTask.clearVistiLog', '清除访问日志 总共耗时：82毫秒', 1, NULL,
        '2023-04-29 02:00:00');
INSERT INTO `a_task_log`
VALUES (509, '清除访问日志', 'SYSTEM', 'timedTask.clearVistiLog', '清除访问日志 总共耗时：84毫秒', 1, NULL,
        '2023-04-29 02:00:00');
INSERT INTO `a_task_log`
VALUES (510, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：123毫秒', 1, NULL,
        '2023-04-29 02:00:00');
INSERT INTO `a_task_log`
VALUES (511, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：125毫秒', 1, NULL,
        '2023-04-29 02:00:00');
INSERT INTO `a_task_log`
VALUES (512, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：68毫秒', 1, NULL,
        '2023-04-29 03:00:00');
INSERT INTO `a_task_log`
VALUES (513, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：69毫秒', 1, NULL,
        '2023-04-29 03:00:00');
INSERT INTO `a_task_log`
VALUES (514, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：65毫秒', 1, NULL,
        '2023-04-29 04:00:00');
INSERT INTO `a_task_log`
VALUES (515, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：71毫秒', 1, NULL,
        '2023-04-29 04:00:00');
INSERT INTO `a_task_log`
VALUES (516, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：67毫秒', 1, NULL,
        '2023-04-29 05:00:00');
INSERT INTO `a_task_log`
VALUES (517, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：68毫秒', 1, NULL,
        '2023-04-29 05:00:00');
INSERT INTO `a_task_log`
VALUES (518, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：66毫秒', 1, NULL,
        '2023-04-29 06:00:00');
INSERT INTO `a_task_log`
VALUES (519, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：70毫秒', 1, NULL,
        '2023-04-29 06:00:00');
INSERT INTO `a_task_log`
VALUES (520, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：68毫秒', 1, NULL,
        '2023-04-29 07:00:00');
INSERT INTO `a_task_log`
VALUES (521, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：69毫秒', 1, NULL,
        '2023-04-29 07:00:00');
INSERT INTO `a_task_log`
VALUES (522, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：72毫秒', 1, NULL,
        '2023-04-29 08:00:00');
INSERT INTO `a_task_log`
VALUES (523, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：74毫秒', 1, NULL,
        '2023-04-29 08:00:00');
INSERT INTO `a_task_log`
VALUES (524, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：66毫秒', 1, NULL,
        '2023-04-29 09:00:00');
INSERT INTO `a_task_log`
VALUES (525, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：67毫秒', 1, NULL,
        '2023-04-29 09:00:00');
INSERT INTO `a_task_log`
VALUES (526, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：61毫秒', 1, NULL,
        '2023-04-29 10:00:00');
INSERT INTO `a_task_log`
VALUES (527, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：64毫秒', 1, NULL,
        '2023-04-29 10:00:00');
INSERT INTO `a_task_log`
VALUES (528, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：64毫秒', 1, NULL,
        '2023-04-29 11:00:00');
INSERT INTO `a_task_log`
VALUES (529, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：64毫秒', 1, NULL,
        '2023-04-29 11:00:00');
INSERT INTO `a_task_log`
VALUES (530, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：66毫秒', 1, NULL,
        '2023-04-29 12:00:00');
INSERT INTO `a_task_log`
VALUES (531, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：70毫秒', 1, NULL,
        '2023-04-29 12:00:00');
INSERT INTO `a_task_log`
VALUES (532, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：91毫秒', 1, NULL,
        '2023-04-29 13:00:00');
INSERT INTO `a_task_log`
VALUES (533, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：91毫秒', 1, NULL,
        '2023-04-29 13:00:00');
INSERT INTO `a_task_log`
VALUES (534, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：62毫秒', 1, NULL,
        '2023-04-29 14:00:00');
INSERT INTO `a_task_log`
VALUES (535, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：68毫秒', 1, NULL,
        '2023-04-29 14:00:00');
INSERT INTO `a_task_log`
VALUES (536, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：64毫秒', 1, NULL,
        '2023-04-29 15:00:00');
INSERT INTO `a_task_log`
VALUES (537, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：65毫秒', 1, NULL,
        '2023-04-29 15:00:00');
INSERT INTO `a_task_log`
VALUES (538, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：65毫秒', 1, NULL,
        '2023-04-29 16:00:00');
INSERT INTO `a_task_log`
VALUES (539, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：110毫秒', 1, NULL,
        '2023-04-29 16:00:00');
INSERT INTO `a_task_log`
VALUES (540, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：71毫秒', 1, NULL,
        '2023-04-29 17:00:00');
INSERT INTO `a_task_log`
VALUES (541, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：91毫秒', 1, NULL,
        '2023-04-29 17:00:00');
INSERT INTO `a_task_log`
VALUES (542, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：76毫秒', 1, NULL,
        '2023-04-29 18:00:00');
INSERT INTO `a_task_log`
VALUES (543, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：82毫秒', 1, NULL,
        '2023-04-29 18:00:00');
INSERT INTO `a_task_log`
VALUES (544, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：66毫秒', 1, NULL,
        '2023-04-29 19:00:00');
INSERT INTO `a_task_log`
VALUES (545, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：66毫秒', 1, NULL,
        '2023-04-29 19:00:00');
INSERT INTO `a_task_log`
VALUES (546, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：69毫秒', 1, NULL,
        '2023-04-29 20:00:00');
INSERT INTO `a_task_log`
VALUES (547, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：74毫秒', 1, NULL,
        '2023-04-29 20:00:00');
INSERT INTO `a_task_log`
VALUES (548, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：74毫秒', 1, NULL,
        '2023-04-29 21:00:00');
INSERT INTO `a_task_log`
VALUES (549, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：77毫秒', 1, NULL,
        '2023-04-29 21:00:00');
INSERT INTO `a_task_log`
VALUES (550, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：81毫秒', 1, NULL,
        '2023-04-29 22:00:00');
INSERT INTO `a_task_log`
VALUES (551, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：77毫秒', 1, NULL,
        '2023-04-29 22:00:00');
INSERT INTO `a_task_log`
VALUES (552, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：72毫秒', 1, NULL,
        '2023-04-29 23:00:00');
INSERT INTO `a_task_log`
VALUES (553, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：73毫秒', 1, NULL,
        '2023-04-29 23:00:00');
INSERT INTO `a_task_log`
VALUES (554, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：5毫秒', 1, NULL,
        '2023-04-30 00:00:00');
INSERT INTO `a_task_log`
VALUES (555, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：85毫秒', 1, NULL,
        '2023-04-30 00:00:00');
INSERT INTO `a_task_log`
VALUES (556, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：4毫秒', 1, NULL,
        '2023-04-30 00:00:00');
INSERT INTO `a_task_log`
VALUES (557, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：203毫秒', 1, NULL,
        '2023-04-30 00:00:00');
INSERT INTO `a_task_log`
VALUES (558, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：64毫秒', 1, NULL,
        '2023-04-30 01:00:00');
INSERT INTO `a_task_log`
VALUES (559, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：63毫秒', 1, NULL,
        '2023-04-30 01:00:00');
INSERT INTO `a_task_log`
VALUES (560, '清除访问日志', 'SYSTEM', 'timedTask.clearVistiLog', '清除访问日志 总共耗时：84毫秒', 1, NULL,
        '2023-04-30 02:00:00');
INSERT INTO `a_task_log`
VALUES (561, '清除访问日志', 'SYSTEM', 'timedTask.clearVistiLog', '清除访问日志 总共耗时：86毫秒', 1, NULL,
        '2023-04-30 02:00:00');
INSERT INTO `a_task_log`
VALUES (562, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：116毫秒', 1, NULL,
        '2023-04-30 02:00:00');
INSERT INTO `a_task_log`
VALUES (563, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：119毫秒', 1, NULL,
        '2023-04-30 02:00:00');
INSERT INTO `a_task_log`
VALUES (564, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：63毫秒', 1, NULL,
        '2023-04-30 03:00:00');
INSERT INTO `a_task_log`
VALUES (565, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：63毫秒', 1, NULL,
        '2023-04-30 03:00:00');
INSERT INTO `a_task_log`
VALUES (566, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：64毫秒', 1, NULL,
        '2023-04-30 04:00:00');
INSERT INTO `a_task_log`
VALUES (567, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：64毫秒', 1, NULL,
        '2023-04-30 04:00:00');
INSERT INTO `a_task_log`
VALUES (568, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：69毫秒', 1, NULL,
        '2023-04-30 05:00:00');
INSERT INTO `a_task_log`
VALUES (569, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：76毫秒', 1, NULL,
        '2023-04-30 05:00:00');
INSERT INTO `a_task_log`
VALUES (570, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：62毫秒', 1, NULL,
        '2023-04-30 06:00:00');
INSERT INTO `a_task_log`
VALUES (571, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：62毫秒', 1, NULL,
        '2023-04-30 06:00:00');
INSERT INTO `a_task_log`
VALUES (572, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：76毫秒', 1, NULL,
        '2023-04-30 07:00:00');
INSERT INTO `a_task_log`
VALUES (573, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：80毫秒', 1, NULL,
        '2023-04-30 07:00:00');
INSERT INTO `a_task_log`
VALUES (574, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：67毫秒', 1, NULL,
        '2023-04-30 08:00:00');
INSERT INTO `a_task_log`
VALUES (575, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：69毫秒', 1, NULL,
        '2023-04-30 08:00:00');
INSERT INTO `a_task_log`
VALUES (576, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：66毫秒', 1, NULL,
        '2023-04-30 09:00:00');
INSERT INTO `a_task_log`
VALUES (577, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：69毫秒', 1, NULL,
        '2023-04-30 09:00:00');
INSERT INTO `a_task_log`
VALUES (578, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：26毫秒', 1, NULL,
        '2023-04-30 10:00:00');
INSERT INTO `a_task_log`
VALUES (579, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：68毫秒', 1, NULL,
        '2023-04-30 10:00:00');
INSERT INTO `a_task_log`
VALUES (580, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：67毫秒', 1, NULL,
        '2023-04-30 11:00:00');
INSERT INTO `a_task_log`
VALUES (581, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：71毫秒', 1, NULL,
        '2023-04-30 11:00:00');
INSERT INTO `a_task_log`
VALUES (582, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：96毫秒', 1, NULL,
        '2023-04-30 12:00:00');
INSERT INTO `a_task_log`
VALUES (583, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：95毫秒', 1, NULL,
        '2023-04-30 12:00:00');
INSERT INTO `a_task_log`
VALUES (584, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：64毫秒', 1, NULL,
        '2023-04-30 13:00:00');
INSERT INTO `a_task_log`
VALUES (585, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：67毫秒', 1, NULL,
        '2023-04-30 13:00:00');
INSERT INTO `a_task_log`
VALUES (586, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：96毫秒', 1, NULL,
        '2023-04-30 14:00:00');
INSERT INTO `a_task_log`
VALUES (587, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：113毫秒', 1, NULL,
        '2023-04-30 14:00:00');
INSERT INTO `a_task_log`
VALUES (588, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：84毫秒', 1, NULL,
        '2023-04-30 15:00:00');
INSERT INTO `a_task_log`
VALUES (589, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：100毫秒', 1, NULL,
        '2023-04-30 15:00:00');
INSERT INTO `a_task_log`
VALUES (590, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：68毫秒', 1, NULL,
        '2023-04-30 16:00:00');
INSERT INTO `a_task_log`
VALUES (591, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：106毫秒', 1, NULL,
        '2023-04-30 16:00:00');
INSERT INTO `a_task_log`
VALUES (592, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：64毫秒', 1, NULL,
        '2023-04-30 17:00:00');
INSERT INTO `a_task_log`
VALUES (593, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：75毫秒', 1, NULL,
        '2023-04-30 17:00:00');
INSERT INTO `a_task_log`
VALUES (594, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：71毫秒', 1, NULL,
        '2023-04-30 18:00:00');
INSERT INTO `a_task_log`
VALUES (595, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：73毫秒', 1, NULL,
        '2023-04-30 18:00:00');
INSERT INTO `a_task_log`
VALUES (596, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：97毫秒', 1, NULL,
        '2023-04-30 19:00:00');
INSERT INTO `a_task_log`
VALUES (597, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：112毫秒', 1, NULL,
        '2023-04-30 19:00:00');
INSERT INTO `a_task_log`
VALUES (598, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：91毫秒', 1, NULL,
        '2023-04-30 19:00:00');
INSERT INTO `a_task_log`
VALUES (599, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：76毫秒', 1, NULL,
        '2023-04-30 20:00:00');
INSERT INTO `a_task_log`
VALUES (600, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：104毫秒', 1, NULL,
        '2023-04-30 20:00:00');
INSERT INTO `a_task_log`
VALUES (601, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：282毫秒', 1, NULL,
        '2023-04-30 20:00:00');
INSERT INTO `a_task_log`
VALUES (602, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：65毫秒', 1, NULL,
        '2023-04-30 21:00:00');
INSERT INTO `a_task_log`
VALUES (603, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：63毫秒', 1, NULL,
        '2023-04-30 21:00:00');
INSERT INTO `a_task_log`
VALUES (604, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：266毫秒', 1, NULL,
        '2023-04-30 21:00:00');
INSERT INTO `a_task_log`
VALUES (605, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：66毫秒', 1, NULL,
        '2023-04-30 22:00:00');
INSERT INTO `a_task_log`
VALUES (606, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：69毫秒', 1, NULL,
        '2023-04-30 22:00:00');
INSERT INTO `a_task_log`
VALUES (607, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：190毫秒', 1, NULL,
        '2023-04-30 22:00:00');
INSERT INTO `a_task_log`
VALUES (608, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：66毫秒', 1, NULL,
        '2023-04-30 23:00:00');
INSERT INTO `a_task_log`
VALUES (609, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：68毫秒', 1, NULL,
        '2023-04-30 23:00:00');
INSERT INTO `a_task_log`
VALUES (610, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：100毫秒', 1, NULL,
        '2023-04-30 23:00:00');
INSERT INTO `a_task_log`
VALUES (611, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：4毫秒', 1, NULL,
        '2023-05-01 00:00:00');
INSERT INTO `a_task_log`
VALUES (612, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：4毫秒', 1, NULL,
        '2023-05-01 00:00:00');
INSERT INTO `a_task_log`
VALUES (613, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：96毫秒', 1, NULL,
        '2023-05-01 00:00:00');
INSERT INTO `a_task_log`
VALUES (614, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：114毫秒', 1, NULL,
        '2023-05-01 00:00:00');
INSERT INTO `a_task_log`
VALUES (615, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：79毫秒', 1, NULL,
        '2023-05-01 00:00:00');
INSERT INTO `a_task_log`
VALUES (616, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：241毫秒', 1, NULL,
        '2023-05-01 00:00:00');
INSERT INTO `a_task_log`
VALUES (617, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：69毫秒', 1, NULL,
        '2023-05-01 01:00:00');
INSERT INTO `a_task_log`
VALUES (618, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：74毫秒', 1, NULL,
        '2023-05-01 01:00:00');
INSERT INTO `a_task_log`
VALUES (619, '清除访问日志', 'SYSTEM', 'timedTask.clearVistiLog', '清除访问日志 总共耗时：73毫秒', 1, NULL,
        '2023-05-01 02:00:00');
INSERT INTO `a_task_log`
VALUES (620, '清除访问日志', 'SYSTEM', 'timedTask.clearVistiLog', '清除访问日志 总共耗时：67毫秒', 1, NULL,
        '2023-05-01 02:00:00');
INSERT INTO `a_task_log`
VALUES (621, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：126毫秒', 1, NULL,
        '2023-05-01 02:00:00');
INSERT INTO `a_task_log`
VALUES (622, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：146毫秒', 1, NULL,
        '2023-05-01 02:00:00');
INSERT INTO `a_task_log`
VALUES (623, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：67毫秒', 1, NULL,
        '2023-05-01 03:00:00');
INSERT INTO `a_task_log`
VALUES (624, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：73毫秒', 1, NULL,
        '2023-05-01 03:00:00');
INSERT INTO `a_task_log`
VALUES (625, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：68毫秒', 1, NULL,
        '2023-05-01 04:00:00');
INSERT INTO `a_task_log`
VALUES (626, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：68毫秒', 1, NULL,
        '2023-05-01 04:00:00');
INSERT INTO `a_task_log`
VALUES (627, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：63毫秒', 1, NULL,
        '2023-05-01 05:00:00');
INSERT INTO `a_task_log`
VALUES (628, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：67毫秒', 1, NULL,
        '2023-05-01 05:00:00');
INSERT INTO `a_task_log`
VALUES (629, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：66毫秒', 1, NULL,
        '2023-05-01 06:00:00');
INSERT INTO `a_task_log`
VALUES (630, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：70毫秒', 1, NULL,
        '2023-05-01 06:00:00');
INSERT INTO `a_task_log`
VALUES (631, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：61毫秒', 1, NULL,
        '2023-05-01 07:00:00');
INSERT INTO `a_task_log`
VALUES (632, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：61毫秒', 1, NULL,
        '2023-05-01 07:00:00');
INSERT INTO `a_task_log`
VALUES (633, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：64毫秒', 1, NULL,
        '2023-05-01 08:00:00');
INSERT INTO `a_task_log`
VALUES (634, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：65毫秒', 1, NULL,
        '2023-05-01 08:00:00');
INSERT INTO `a_task_log`
VALUES (635, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：76532毫秒', 1, NULL,
        '2023-05-01 08:35:05');
INSERT INTO `a_task_log`
VALUES (636, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：57毫秒', 1, NULL,
        '2023-05-01 08:35:05');
INSERT INTO `a_task_log`
VALUES (637, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：58毫秒', 1, NULL,
        '2023-05-01 08:35:05');
INSERT INTO `a_task_log`
VALUES (638, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：59毫秒', 1, NULL,
        '2023-05-01 08:35:05');
INSERT INTO `a_task_log`
VALUES (639, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：58毫秒', 1, NULL,
        '2023-05-01 08:35:05');
INSERT INTO `a_task_log`
VALUES (640, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：57毫秒', 1, NULL,
        '2023-05-01 08:35:05');
INSERT INTO `a_task_log`
VALUES (641, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：57毫秒', 1, NULL,
        '2023-05-01 08:35:06');
INSERT INTO `a_task_log`
VALUES (642, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：57毫秒', 1, NULL,
        '2023-05-01 08:35:06');
INSERT INTO `a_task_log`
VALUES (643, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：67毫秒', 1, NULL,
        '2023-05-01 09:00:00');
INSERT INTO `a_task_log`
VALUES (644, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：67毫秒', 1, NULL,
        '2023-05-01 09:00:00');
INSERT INTO `a_task_log`
VALUES (645, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：83毫秒', 1, NULL,
        '2023-05-01 09:00:00');
INSERT INTO `a_task_log`
VALUES (646, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：126毫秒', 1, NULL,
        '2023-05-01 10:00:00');
INSERT INTO `a_task_log`
VALUES (647, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：72毫秒', 1, NULL,
        '2023-05-01 10:00:00');
INSERT INTO `a_task_log`
VALUES (648, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：71毫秒', 1, NULL,
        '2023-05-01 10:00:00');
INSERT INTO `a_task_log`
VALUES (649, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：82毫秒', 1, NULL,
        '2023-05-01 11:00:00');
INSERT INTO `a_task_log`
VALUES (650, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：68毫秒', 1, NULL,
        '2023-05-01 11:00:00');
INSERT INTO `a_task_log`
VALUES (651, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：94毫秒', 1, NULL,
        '2023-05-01 11:00:00');
INSERT INTO `a_task_log`
VALUES (652, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：94毫秒', 1, NULL,
        '2023-05-01 12:00:00');
INSERT INTO `a_task_log`
VALUES (653, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：67毫秒', 1, NULL,
        '2023-05-01 12:00:00');
INSERT INTO `a_task_log`
VALUES (654, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：71毫秒', 1, NULL,
        '2023-05-01 12:00:00');
INSERT INTO `a_task_log`
VALUES (655, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：190毫秒', 1, NULL,
        '2023-05-01 13:00:00');
INSERT INTO `a_task_log`
VALUES (656, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：78毫秒', 1, NULL,
        '2023-05-01 13:00:00');
INSERT INTO `a_task_log`
VALUES (657, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：74毫秒', 1, NULL,
        '2023-05-01 13:00:00');
INSERT INTO `a_task_log`
VALUES (658, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：59毫秒', 1, NULL,
        '2023-05-01 14:00:00');
INSERT INTO `a_task_log`
VALUES (659, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：65毫秒', 1, NULL,
        '2023-05-01 14:00:00');
INSERT INTO `a_task_log`
VALUES (660, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：64毫秒', 1, NULL,
        '2023-05-01 14:00:00');
INSERT INTO `a_task_log`
VALUES (661, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：90毫秒', 1, NULL,
        '2023-05-01 15:00:00');
INSERT INTO `a_task_log`
VALUES (662, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：100毫秒', 1, NULL,
        '2023-05-01 15:00:00');
INSERT INTO `a_task_log`
VALUES (663, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：112毫秒', 1, NULL,
        '2023-05-01 15:00:00');
INSERT INTO `a_task_log`
VALUES (664, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：69毫秒', 1, NULL,
        '2023-05-01 16:00:00');
INSERT INTO `a_task_log`
VALUES (665, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：72毫秒', 1, NULL,
        '2023-05-01 16:00:00');
INSERT INTO `a_task_log`
VALUES (666, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：89毫秒', 1, NULL,
        '2023-05-01 16:00:00');
INSERT INTO `a_task_log`
VALUES (667, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：89毫秒', 1, NULL,
        '2023-05-01 17:00:00');
INSERT INTO `a_task_log`
VALUES (668, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：91毫秒', 1, NULL,
        '2023-05-01 17:00:00');
INSERT INTO `a_task_log`
VALUES (669, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：64毫秒', 1, NULL,
        '2023-05-01 17:00:00');
INSERT INTO `a_task_log`
VALUES (670, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：63毫秒', 1, NULL,
        '2023-05-01 18:00:00');
INSERT INTO `a_task_log`
VALUES (671, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：65毫秒', 1, NULL,
        '2023-05-01 18:00:00');
INSERT INTO `a_task_log`
VALUES (672, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：287毫秒', 1, NULL,
        '2023-05-01 18:00:00');
INSERT INTO `a_task_log`
VALUES (673, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：63毫秒', 1, NULL,
        '2023-05-01 19:00:00');
INSERT INTO `a_task_log`
VALUES (674, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：64毫秒', 1, NULL,
        '2023-05-01 19:00:00');
INSERT INTO `a_task_log`
VALUES (675, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：107毫秒', 1, NULL,
        '2023-05-01 19:00:00');
INSERT INTO `a_task_log`
VALUES (676, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：64毫秒', 1, NULL,
        '2023-05-01 20:00:00');
INSERT INTO `a_task_log`
VALUES (677, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：68毫秒', 1, NULL,
        '2023-05-01 20:00:00');
INSERT INTO `a_task_log`
VALUES (678, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：104毫秒', 1, NULL,
        '2023-05-01 21:00:00');
INSERT INTO `a_task_log`
VALUES (679, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：102毫秒', 1, NULL,
        '2023-05-01 21:00:00');
INSERT INTO `a_task_log`
VALUES (680, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：176毫秒', 1, NULL,
        '2023-05-01 21:00:00');
INSERT INTO `a_task_log`
VALUES (681, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：67毫秒', 1, NULL,
        '2023-05-01 22:00:00');
INSERT INTO `a_task_log`
VALUES (682, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：71毫秒', 1, NULL,
        '2023-05-01 22:00:00');
INSERT INTO `a_task_log`
VALUES (683, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：117毫秒', 1, NULL,
        '2023-05-01 22:00:00');
INSERT INTO `a_task_log`
VALUES (684, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：149毫秒', 1, NULL,
        '2023-05-01 23:00:00');
INSERT INTO `a_task_log`
VALUES (685, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：156毫秒', 1, NULL,
        '2023-05-01 23:00:00');
INSERT INTO `a_task_log`
VALUES (686, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：72毫秒', 1, NULL,
        '2023-05-01 23:00:00');
INSERT INTO `a_task_log`
VALUES (687, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：6毫秒', 1, NULL,
        '2023-05-02 00:00:00');
INSERT INTO `a_task_log`
VALUES (688, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：5毫秒', 1, NULL,
        '2023-05-02 00:00:00');
INSERT INTO `a_task_log`
VALUES (689, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：94毫秒', 1, NULL,
        '2023-05-02 00:00:00');
INSERT INTO `a_task_log`
VALUES (690, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：96毫秒', 1, NULL,
        '2023-05-02 00:00:00');
INSERT INTO `a_task_log`
VALUES (691, '清除每日游客访问记录', 'SYSTEM', 'timedTask.clear', '清除每日游客访问记录 总共耗时：65毫秒', 1, NULL,
        '2023-05-02 00:00:00');
INSERT INTO `a_task_log`
VALUES (692, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：338毫秒', 1, NULL,
        '2023-05-02 00:00:00');
INSERT INTO `a_task_log`
VALUES (693, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：64毫秒', 1, NULL,
        '2023-05-02 01:00:00');
INSERT INTO `a_task_log`
VALUES (694, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：68毫秒', 1, NULL,
        '2023-05-02 01:00:00');
INSERT INTO `a_task_log`
VALUES (695, '清除访问日志', 'SYSTEM', 'timedTask.clearVistiLog', '清除访问日志 总共耗时：62毫秒', 1, NULL,
        '2023-05-02 02:00:00');
INSERT INTO `a_task_log`
VALUES (696, '清除访问日志', 'SYSTEM', 'timedTask.clearVistiLog', '清除访问日志 总共耗时：62毫秒', 1, NULL,
        '2023-05-02 02:00:00');
INSERT INTO `a_task_log`
VALUES (697, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：117毫秒', 1, NULL,
        '2023-05-02 02:00:00');
INSERT INTO `a_task_log`
VALUES (698, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：131毫秒', 1, NULL,
        '2023-05-02 02:00:00');
INSERT INTO `a_task_log`
VALUES (699, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：76毫秒', 1, NULL,
        '2023-05-02 03:00:00');
INSERT INTO `a_task_log`
VALUES (700, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：82毫秒', 1, NULL,
        '2023-05-02 03:00:00');
INSERT INTO `a_task_log`
VALUES (701, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：69毫秒', 1, NULL,
        '2023-05-02 04:00:00');
INSERT INTO `a_task_log`
VALUES (702, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：69毫秒', 1, NULL,
        '2023-05-02 04:00:00');
INSERT INTO `a_task_log`
VALUES (703, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：64毫秒', 1, NULL,
        '2023-05-02 05:00:00');
INSERT INTO `a_task_log`
VALUES (704, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：66毫秒', 1, NULL,
        '2023-05-02 05:00:00');
INSERT INTO `a_task_log`
VALUES (705, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：72毫秒', 1, NULL,
        '2023-05-02 06:00:00');
INSERT INTO `a_task_log`
VALUES (706, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：77毫秒', 1, NULL,
        '2023-05-02 06:00:00');
INSERT INTO `a_task_log`
VALUES (707, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：73毫秒', 1, NULL,
        '2023-05-02 07:00:00');
INSERT INTO `a_task_log`
VALUES (708, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：77毫秒', 1, NULL,
        '2023-05-02 07:00:00');
INSERT INTO `a_task_log`
VALUES (709, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：64毫秒', 1, NULL,
        '2023-05-02 08:00:00');
INSERT INTO `a_task_log`
VALUES (710, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：65毫秒', 1, NULL,
        '2023-05-02 08:00:00');
INSERT INTO `a_task_log`
VALUES (711, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：64毫秒', 1, NULL,
        '2023-05-02 09:00:00');
INSERT INTO `a_task_log`
VALUES (712, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：75毫秒', 1, NULL,
        '2023-05-02 09:00:00');
INSERT INTO `a_task_log`
VALUES (713, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：62毫秒', 1, NULL,
        '2023-05-02 10:00:00');
INSERT INTO `a_task_log`
VALUES (714, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：121毫秒', 1, NULL,
        '2023-05-02 10:00:00');
INSERT INTO `a_task_log`
VALUES (715, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：64毫秒', 1, NULL,
        '2023-05-02 11:00:00');
INSERT INTO `a_task_log`
VALUES (716, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：63毫秒', 1, NULL,
        '2023-05-02 11:00:00');
INSERT INTO `a_task_log`
VALUES (717, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：65毫秒', 1, NULL,
        '2023-05-02 12:00:00');
INSERT INTO `a_task_log`
VALUES (718, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：65毫秒', 1, NULL,
        '2023-05-02 12:00:00');
INSERT INTO `a_task_log`
VALUES (719, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：66毫秒', 1, NULL,
        '2023-05-02 13:00:00');
INSERT INTO `a_task_log`
VALUES (720, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：86毫秒', 1, NULL,
        '2023-05-02 13:00:00');
INSERT INTO `a_task_log`
VALUES (721, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：66毫秒', 1, NULL,
        '2023-05-02 14:00:00');
INSERT INTO `a_task_log`
VALUES (722, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：71毫秒', 1, NULL,
        '2023-05-02 14:00:00');
INSERT INTO `a_task_log`
VALUES (723, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：69毫秒', 1, NULL,
        '2023-05-02 15:00:00');
INSERT INTO `a_task_log`
VALUES (724, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：70毫秒', 1, NULL,
        '2023-05-02 15:00:00');
INSERT INTO `a_task_log`
VALUES (725, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：63毫秒', 1, NULL,
        '2023-05-02 16:00:00');
INSERT INTO `a_task_log`
VALUES (726, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：65毫秒', 1, NULL,
        '2023-05-02 16:00:00');
INSERT INTO `a_task_log`
VALUES (727, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：74毫秒', 1, NULL,
        '2023-05-02 17:00:00');
INSERT INTO `a_task_log`
VALUES (728, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：74毫秒', 1, NULL,
        '2023-05-02 17:00:00');
INSERT INTO `a_task_log`
VALUES (729, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：62毫秒', 1, NULL,
        '2023-05-02 18:00:00');
INSERT INTO `a_task_log`
VALUES (730, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：64毫秒', 1, NULL,
        '2023-05-02 18:00:00');
INSERT INTO `a_task_log`
VALUES (731, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：63毫秒', 1, NULL,
        '2023-05-02 19:00:00');
INSERT INTO `a_task_log`
VALUES (732, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：63毫秒', 1, NULL,
        '2023-05-02 19:00:00');
INSERT INTO `a_task_log`
VALUES (733, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：117毫秒', 1, NULL,
        '2023-05-02 20:00:00');
INSERT INTO `a_task_log`
VALUES (734, '设置过期的约起', 'SYSTEM', 'timedTask.setExpire', '设置过期的约起 总共耗时：118毫秒', 1, NULL,
        '2023-05-02 20:00:00');

-- ----------------------------
-- Table structure for a_visit_log
-- ----------------------------
DROP TABLE IF EXISTS `a_visit_log`;
CREATE TABLE `a_visit_log`
(
    `id`          int(0)                                                       NOT NULL AUTO_INCREMENT COMMENT 'id',
    `page`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问页面',
    `ip_address`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问ip',
    `ip_source`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问地址',
    `os`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作系统',
    `browser`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浏览器',
    `create_time` datetime(0)                                                  NOT NULL COMMENT '访问时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1685
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a_visit_log
-- ----------------------------

-- ----------------------------
-- Table structure for b_activity
-- ----------------------------
DROP TABLE IF EXISTS `b_activity`;
CREATE TABLE `b_activity`
(
    `id`            int(0)                                                         NOT NULL AUTO_INCREMENT COMMENT '活动id',
    `user_id`       int(0)                                                         NOT NULL COMMENT '发起者id',
    `cover`         varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '缩略图',
    `title`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NOT NULL COMMENT '活动主题',
    `content`       longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NOT NULL COMMENT '活动内容',
    `people_number` int(0)                                                         NOT NULL COMMENT '与会人数',
    `time_start`    datetime(0)                                                    NOT NULL COMMENT '开始时间',
    `time_end`      datetime(0)                                                    NOT NULL COMMENT '结束时间',
    `status`        tinyint(1)                                                     NOT NULL DEFAULT 2 COMMENT '状态(1发出 2草稿 3完成 4过期 5取消)',
    `create_time`   datetime(0)                                                    NOT NULL COMMENT '发表时间',
    `update_time`   datetime(0)                                                    NULL     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 16
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_activity
-- ----------------------------
INSERT INTO `b_activity`
VALUES (1, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '跑步', '彩虹跑', 100,
        '2023-05-27 14:27:27', '2023-05-27 18:27:36', 1, '2023-04-24 14:27:52', NULL);
INSERT INTO `b_activity`
VALUES (2, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '密室逃脱', '密室逃脱',
        6, '2023-05-27 14:28:39', '2023-05-27 17:28:47', 1, '2023-04-24 14:28:02', NULL);
INSERT INTO `b_activity`
VALUES (3, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '剧本杀', '剧本杀', 12,
        '2023-05-28 14:29:25', '2023-05-28 17:29:33', 1, '2023-04-24 14:29:41', NULL);
INSERT INTO `b_activity`
VALUES (4, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '异装类', '假面舞会',
        200, '2023-05-29 14:30:47', '2023-05-29 22:30:54', 1, '2023-04-24 14:31:03', NULL);
INSERT INTO `b_activity`
VALUES (5, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '异装类', '化妆舞会',
        150, '2023-06-01 14:31:39', '2023-06-01 21:31:45', 2, '2023-04-24 14:31:57', NULL);
INSERT INTO `b_activity`
VALUES (6, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '展览', '手工艺术展',
        300, '2023-06-03 14:32:53', '2023-06-04 14:32:59', 1, '2023-04-24 14:33:06', NULL);
INSERT INTO `b_activity`
VALUES (7, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '展览', '服装展', 300,
        '2023-05-28 14:33:54', '2023-05-29 14:34:01', 2, '2023-04-24 14:34:09', NULL);
INSERT INTO `b_activity`
VALUES (8, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '展览', '画展', 300,
        '2023-05-31 14:34:58', '2023-06-01 14:35:06', 1, '2023-04-24 14:35:13', NULL);
INSERT INTO `b_activity`
VALUES (9, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '派对', '沙滩派对', 400,
        '2023-06-03 14:35:57', '2023-06-03 23:36:04', 1, '2023-04-24 14:36:22', NULL);
INSERT INTO `b_activity`
VALUES (10, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '交易市场', '跳蚤市场',
        500, '2023-06-04 15:00:19', '2023-06-04 21:00:28', 1, '2023-04-24 15:00:51', NULL);
INSERT INTO `b_activity`
VALUES (11, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '音乐会', '音乐会',
        1000, '2023-06-02 15:04:00', '2023-06-02 20:04:13', 3, '2023-04-24 15:04:23', NULL);
INSERT INTO `b_activity`
VALUES (12, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '游玩', '迪士尼一日游',
        6, '2023-05-26 15:07:14', '2023-05-26 20:07:21', 1, '2023-04-24 15:07:29', NULL);
INSERT INTO `b_activity`
VALUES (13, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '游玩', '农家乐采摘',
        10, '2023-06-04 15:08:25', '2023-06-04 17:08:33', 1, '2023-04-24 15:08:42', NULL);
INSERT INTO `b_activity`
VALUES (14, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '展览', '服装展', 300,
        '2023-06-06 15:10:46', '2023-06-06 15:10:57', 1, '2023-04-24 15:11:05', NULL);
INSERT INTO `b_activity`
VALUES (15, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '密室逃脱', '密室逃脱',
        8, '2023-06-10 15:13:04', '2023-06-10 19:13:14', 1, '2023-04-24 15:13:33', NULL);

-- ----------------------------
-- Table structure for b_agreement_user
-- ----------------------------
DROP TABLE IF EXISTS `b_agreement_user`;
CREATE TABLE `b_agreement_user`
(
    `id`           int(0)     NOT NULL AUTO_INCREMENT COMMENT '主键',
    `agree_id` int(0)     NOT NULL COMMENT '约起id',
    `type`         tinyint(1) NOT NULL COMMENT '约起类型(1约会 2活动 3赛事 4帮忙)',
    `limit_type`   tinyint(1) NOT NULL COMMENT '限定类型(1普通 2唯一 3观众)',
    `status`       tinyint(1) NULL DEFAULT 1 COMMENT '状态(1无 2应约 3拒绝)',
    `user_id`      int(0)     NOT NULL COMMENT '用户id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 15
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_agreement_user
-- ----------------------------

-- ----------------------------
-- Table structure for b_appointment
-- ----------------------------
DROP TABLE IF EXISTS `b_appointment`;
CREATE TABLE `b_appointment`
(
    `id`          int(0)                                                         NOT NULL AUTO_INCREMENT COMMENT '约会id',
    `user_id`     int(0)                                                         NOT NULL COMMENT '发起者id',
    `cover`       varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '缩略图',
    `title`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NOT NULL COMMENT '约会主题',
    `content`     longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NOT NULL COMMENT '约会内容',
    `type`        tinyint(1)                                                     NOT NULL DEFAULT 1 COMMENT '发出类型 (1广播 2指定)',
    `time_start`  datetime(0)                                                    NOT NULL COMMENT '开始时间',
    `time_end`    datetime(0)                                                    NOT NULL COMMENT '结束时间',
    `status`      tinyint(1)                                                     NOT NULL DEFAULT 2 COMMENT '状态(1发出 2草稿 3完成 4过期 5取消)',
    `create_time` datetime(0)                                                    NOT NULL COMMENT '发表时间',
    `update_time` datetime(0)                                                    NULL     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 16
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_appointment
-- ----------------------------
INSERT INTO `b_appointment`
VALUES (1, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '约饭', '吃饭', 1,
        '2023-05-27 14:27:27', '2023-05-27 18:27:36', 1, '2023-04-24 14:27:52', NULL);
INSERT INTO `b_appointment`
VALUES (3, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '学习', '探讨作业', 1,
        '2023-05-28 14:29:25', '2023-05-28 17:29:33', 1, '2023-04-24 14:29:41', NULL);
INSERT INTO `b_appointment`
VALUES (4, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', '爬山', 1,
        '2023-05-29 14:30:47', '2023-05-29 22:30:54', 1, '2023-04-24 14:31:03', NULL);
INSERT INTO `b_appointment`
VALUES (5, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', '滑冰', 1,
        '2023-06-01 14:31:39', '2023-06-01 21:31:45', 2, '2023-04-24 14:31:57', NULL);
INSERT INTO `b_appointment`
VALUES (6, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', '露营', 1,
        '2023-06-03 14:32:53', '2023-06-04 14:32:59', 1, '2023-04-24 14:33:06', NULL);
INSERT INTO `b_appointment`
VALUES (7, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', '骑行', 1,
        '2023-05-28 14:33:54', '2023-05-29 14:34:01', 2, '2023-04-24 14:34:09', NULL);
INSERT INTO `b_appointment`
VALUES (8, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', '玩卡丁车', 1,
        '2023-05-29 14:33:54', '2023-05-30 14:34:01', 1, '2023-04-24 14:34:09', NULL);
INSERT INTO `b_appointment`
VALUES (9, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', '射箭', 1,
        '2023-05-30 14:33:54', '2023-05-31 14:34:01', 1, '2023-04-24 14:34:09', NULL);
INSERT INTO `b_appointment`
VALUES (10, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', '攀岩', 1,
        '2023-05-31 14:33:54', '2023-06-01 14:34:01', 1, '2023-04-24 14:34:09', NULL);
INSERT INTO `b_appointment`
VALUES (11, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', '游玩动物园',
        1, '2023-06-01 14:33:54', '2023-06-02 14:34:01', 1, '2023-04-24 14:34:09', NULL);
INSERT INTO `b_appointment`
VALUES (12, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', '听演唱会', 1,
        '2023-06-02 14:33:54', '2023-06-03 14:34:01', 1, '2023-04-24 14:34:09', NULL);
INSERT INTO `b_appointment`
VALUES (13, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', '踏春', 1,
        '2023-06-03 14:33:54', '2023-06-04 14:34:01', 1, '2023-04-24 14:34:09', NULL);
INSERT INTO `b_appointment`
VALUES (14, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', '插花', 1,
        '2023-06-04 14:33:54', '2023-06-05 14:34:01', 1, '2023-04-24 14:34:09', NULL);
INSERT INTO `b_appointment`
VALUES (15, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐',
        '海边看日出日落', 1, '2023-06-05 14:33:54', '2023-06-06 14:34:01', 1, '2023-04-24 14:34:09', NULL);
INSERT INTO `b_appointment`
VALUES (16, 1, 'https:/vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', '农家乐采摘',
        1, '2023-06-06 14:33:54', '2023-06-07 14:34:01', 1, '2023-04-24 14:34:09', NULL);

-- ----------------------------
-- Table structure for b_comment
-- ----------------------------
DROP TABLE IF EXISTS `b_comment`;
CREATE TABLE `b_comment`
(
    `id`          int(0)                                                NOT NULL AUTO_INCREMENT COMMENT '评论id',
    `type`        tinyint(1)                                            NOT NULL COMMENT '类型 (1记录 2提问)',
    `type_id`     int(0)                                                NULL     DEFAULT NULL COMMENT '类型id ',
    `parent_id`   int(0)                                                NULL     DEFAULT NULL COMMENT '父评论id',
    `reply_id`    int(0)                                                NULL     DEFAULT NULL COMMENT '回复评论id',
    `content`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
    `from_uid`    int(0)                                                NOT NULL COMMENT '评论用户id',
    `to_uid`      int(0)                                                NULL     DEFAULT NULL COMMENT '回复用户id',
    `like_number` int(0)                                                NULL     DEFAULT 0 COMMENT '点赞数',
    `is_check`    tinyint(1)                                            NOT NULL DEFAULT 1 COMMENT '是否通过 (0否 1是)',
    `create_time` datetime(0)                                           NOT NULL COMMENT '评论时间',
    `update_time` datetime(0)                                           NULL     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_comment
-- ----------------------------

-- ----------------------------
-- Table structure for b_competition
-- ----------------------------
DROP TABLE IF EXISTS `b_competition`;
CREATE TABLE `b_competition`
(
    `id`            int(0)                                                         NOT NULL AUTO_INCREMENT COMMENT '赛事id',
    `user_id`       int(0)                                                         NOT NULL COMMENT '发起者id',
    `cover`         varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '缩略图',
    `title`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NOT NULL COMMENT '赛事主题',
    `content`       longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NOT NULL COMMENT '赛事内容',
    `people_number` int(0)                                                         NOT NULL COMMENT '参赛队人数',
    `time_start`    datetime(0)                                                    NOT NULL COMMENT '开始时间',
    `time_end`      datetime(0)                                                    NOT NULL COMMENT '结束时间',
    `is_wager`      tinyint(1)                                                     NOT NULL DEFAULT 0 COMMENT '是否赌注 (0否 1是)',
    `wager_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '赌注内容',
    `status`        tinyint(1)                                                     NOT NULL DEFAULT 2 COMMENT '状态(1发出 2草稿 3完成 4过期 5取消)',
    `create_time`   datetime(0)                                                    NOT NULL COMMENT '发表时间',
    `update_time`   datetime(0)                                                    NULL     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 16
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_competition
-- ----------------------------
INSERT INTO `b_competition`
VALUES (1, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '嘉院好声音',
        '唱歌比赛', 20, '2023-05-27 14:27:27', '2023-05-27 18:27:36', 0, NULL, 1, '2023-04-24 14:27:52', NULL);
INSERT INTO `b_competition`
VALUES (2, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '热血正青春',
        '篮球比赛', 12, '2023-05-27 14:28:39', '2023-05-27 17:28:47', 0, NULL, 1, '2023-04-24 14:28:02', NULL);
INSERT INTO `b_competition`
VALUES (3, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '我和嘉院春天有个约会',
        '摄影比赛', 50, '2023-05-28 14:29:25', '2023-05-28 17:29:33', 0, NULL, 1, '2023-04-24 14:29:41', NULL);
INSERT INTO `b_competition`
VALUES (4, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', 'RUN的味道',
        '800米接力赛', 15, '2023-05-29 14:30:47', '2023-05-29 22:30:54', 0, NULL, 1, '2023-04-24 14:31:03', NULL);
INSERT INTO `b_competition`
VALUES (5, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '大学生英语竞赛',
        '英语比赛', 400, '2023-06-01 14:31:39', '2023-06-01 21:31:45', 0, NULL, 2, '2023-04-24 14:31:57', NULL);
INSERT INTO `b_competition`
VALUES (6, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg',
        '“挑战杯”中国大学生创业计划竞赛', '创业计划', 200, '2023-06-03 14:32:53', '2023-06-04 14:32:59', 0, NULL, 1,
        '2023-04-24 14:33:06', NULL);
INSERT INTO `b_competition`
VALUES (7, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '高数竞赛', '高数比赛',
        100, '2023-05-28 14:33:54', '2023-05-29 14:34:01', 0, NULL, 2, '2023-04-24 14:34:09', NULL);
INSERT INTO `b_competition`
VALUES (8, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '出路', '说唱比赛', 30,
        '2023-05-31 14:34:58', '2023-06-01 14:35:06', 0, NULL, 1, '2023-04-24 14:35:13', NULL);
INSERT INTO `b_competition`
VALUES (9, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '迟到的正义是/不是正义',
        '辩论赛', 32, '2023-06-03 14:35:57', '2023-06-03 23:36:04', 0, NULL, 1, '2023-04-24 14:36:22', NULL);
INSERT INTO `b_competition`
VALUES (10, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '校园达人秀',
        '自我技能的展示', 25, '2023-06-04 15:00:19', '2023-06-04 21:00:28', 0, NULL, 1, '2023-04-24 15:00:51', NULL);
INSERT INTO `b_competition`
VALUES (11, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '校园二手商品交易会',
        '商品交易', 100, '2023-06-02 15:04:00', '2023-06-02 20:04:13', 0, NULL, 1, '2023-04-24 15:04:23', NULL);
INSERT INTO `b_competition`
VALUES (12, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '趣味运动会',
        '团队合作', 60, '2023-05-26 15:07:14', '2023-05-26 20:07:21', 1, '团队第一名：0.1学分', 1, '2023-04-24 15:07:29',
        NULL);
INSERT INTO `b_competition`
VALUES (13, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '舞出人生', '舞蹈比赛',
        30, '2023-06-04 15:08:25', '2023-06-04 17:08:33', 1, '第一名：DIY花束；第二名：奶茶；第三名：钥匙扣', 1,
        '2023-04-24 15:08:42', NULL);
INSERT INTO `b_competition`
VALUES (14, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '大学生新媒体创意大赛',
        '学校宣传数字专刊创作', 500, '2023-06-06 15:10:46', '2023-06-06 15:10:57', 1,
        '\r\n\r\n优秀传播奖1部：奖金1000元', 1, '2023-04-24 15:11:05', NULL);
INSERT INTO `b_competition`
VALUES (15, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '你问我答',
        '同学默契比拼', 30, '2023-06-10 15:13:04', '2023-06-10 19:13:14', 1, '第一名：雨伞；第二名：水杯；第三名：手持风扇',
        1, '2023-04-24 15:13:33', NULL);

-- ----------------------------
-- Table structure for b_help
-- ----------------------------
DROP TABLE IF EXISTS `b_help`;
CREATE TABLE `b_help`
(
    `id`            int(0)                                                         NOT NULL AUTO_INCREMENT COMMENT '帮忙id',
    `user_id`       int(0)                                                         NOT NULL COMMENT '发起者id',
    `cover`         varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '缩略图',
    `title`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NOT NULL COMMENT '帮忙主题',
    `content`       longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NOT NULL COMMENT '帮忙内容',
    `people_number` int(0)                                                         NOT NULL COMMENT '需要人数',
    `time_start`    datetime(0)                                                    NOT NULL COMMENT '开始时间',
    `time_end`      datetime(0)                                                    NOT NULL COMMENT '结束时间',
    `reward`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '报酬',
    `status`        tinyint(1)                                                     NOT NULL DEFAULT 2 COMMENT '状态(1发出 2草稿 3完成 4过期 5取消)',
    `create_time`   datetime(0)                                                    NOT NULL COMMENT '发表时间',
    `update_time`   datetime(0)                                                    NULL     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 16
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_help
-- ----------------------------
INSERT INTO `b_help`
VALUES (1, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '代写', '写作', 2,
        '2023-05-27 14:27:27', '2023-05-27 18:27:36', '30元', 1, '2023-04-24 14:27:52', NULL);
INSERT INTO `b_help`
VALUES (2, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '代拿', '拿快递', 2,
        '2023-05-27 14:28:39', '2023-05-27 17:28:47', '2元', 1, '2023-04-24 14:28:02', NULL);
INSERT INTO `b_help`
VALUES (3, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '代购', '买东西', 1,
        '2023-05-28 14:29:25', '2023-05-28 17:29:33', '5元', 1, '2023-04-24 14:29:41', NULL);
INSERT INTO `b_help`
VALUES (4, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '代跑', '咕咚', 1,
        '2023-05-29 14:30:47', '2023-05-29 22:30:54', '1.5元', 1, '2023-04-24 14:31:03', NULL);
INSERT INTO `b_help`
VALUES (5, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '搬东西', '行李', 2,
        '2023-06-01 14:31:39', '2023-06-01 21:31:45', '10元', 2, '2023-04-24 14:31:57', NULL);
INSERT INTO `b_help`
VALUES (6, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '猫', '照顾校内流浪猫',
        3, '2023-06-03 14:32:53', '2023-06-04 14:32:59', NULL, 1, '2023-04-24 14:33:06', NULL);
INSERT INTO `b_help`
VALUES (7, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '调研', '写问卷', 500,
        '2023-05-28 14:33:54', '2023-05-29 14:34:01', NULL, 2, '2023-04-24 14:34:09', NULL);
INSERT INTO `b_help`
VALUES (8, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '投票', '投票', 25,
        '2023-05-31 14:34:58', '2023-06-01 14:35:06', NULL, 1, '2023-04-24 14:35:13', NULL);
INSERT INTO `b_help`
VALUES (9, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '   作品', '点赞', 30,
        '2023-06-03 14:35:57', '2023-06-03 23:36:04', NULL, 1, '2023-04-24 14:36:22', NULL);
INSERT INTO `b_help`
VALUES (10, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '调查', '问答题', 10,
        '2023-06-04 15:00:19', '2023-06-04 21:00:28', NULL, 1, '2023-04-24 15:00:51', NULL);
INSERT INTO `b_help`
VALUES (11, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '宣传校园APP',
        '发传单', 5, '2023-06-02 15:04:00', '2023-06-02 20:04:13', '15元/1小时', 1, '2023-04-24 15:04:23', NULL);
INSERT INTO `b_help`
VALUES (12, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '跑腿', '拿外卖', 1,
        '2023-05-26 15:07:14', '2023-05-26 20:07:21', '2元', 1, '2023-04-24 15:07:29', NULL);
INSERT INTO `b_help`
VALUES (13, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '校园采访',
        '对于校园的了解度', 10, '2023-06-04 15:08:25', '2023-06-04 17:08:33', NULL, 1, '2023-04-24 15:08:42', NULL);
INSERT INTO `b_help`
VALUES (14, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '学风督查', '志愿者',
        2, '2023-06-06 15:10:46', '2023-06-06 15:10:57', '3个志愿时', 1, '2023-04-24 15:11:05', NULL);
INSERT INTO `b_help`
VALUES (15, 1, 'http://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '多媒体应用作业',
        '多媒体点赞、评论', 60, '2023-06-10 15:13:04', '2023-06-10 19:13:14', NULL, 1, '2023-04-24 15:13:33', NULL);

-- ----------------------------
-- Table structure for b_message
-- ----------------------------
DROP TABLE IF EXISTS `b_message`;
CREATE TABLE `b_message`
(
    `id`          int(0)                                                NOT NULL AUTO_INCREMENT COMMENT '消息id',
    `type`        tinyint(1)                                            NOT NULL COMMENT '类型 (1系统 2用户)',
    `user_out_id` int(0)                                                NULL DEFAULT NULL COMMENT '发出者id(如果是用户)',
    `user_in_id`  int(0)                                                NOT NULL COMMENT '接收者id',
    `content`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '消息内容',
    `create_time` datetime(0)                                           NOT NULL COMMENT '发送时间',
    `update_time` datetime(0)                                           NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_message
-- ----------------------------

-- ----------------------------
-- Table structure for b_quiz
-- ----------------------------
DROP TABLE IF EXISTS `b_quiz`;
CREATE TABLE `b_quiz`
(
    `id`             int(0)                                                         NOT NULL AUTO_INCREMENT COMMENT '提问id',
    `user_id`        int(0)                                                         NOT NULL COMMENT '提问者id',
    `title`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NOT NULL COMMENT '提问标题',
    `content`        varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '提问内容',
    `images`         varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '提问图片',
    `like_number`    int(0)                                                         NULL     DEFAULT 0 COMMENT '点赞数',
    `collect_number` int(0)                                                         NULL     DEFAULT 0 COMMENT '收藏数',
    `is_check`       tinyint(1)                                                     NOT NULL DEFAULT 1 COMMENT '是否通过 (0否 1是)',
    `is_solve`       tinyint(1)                                                     NOT NULL DEFAULT 0 COMMENT '是否解答 (0否 1是)',
    `create_time`    datetime(0)                                                    NOT NULL COMMENT '提问时间',
    `update_time`    datetime(0)                                                    NULL     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 26
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_quiz
-- ----------------------------
INSERT INTO `b_quiz`
VALUES (1, 1, '交朋友', '交朋友的标准是什么？',
        '[\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\"]',
        43, 20, 1, 1, '2023-04-21 22:32:07', '2023-05-01 00:07:30');
INSERT INTO `b_quiz`
VALUES (2, 1, '生活品质', '做哪些事情可以提升生活品质？',
        '[\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\"]',
        7, 3, 1, 1, '2023-04-21 22:51:42', '2023-05-01 00:07:18');
INSERT INTO `b_quiz`
VALUES (3, 1, '回怼', '怎么反驳“你行你上啊”的逻辑？',
        '[\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\"]',
        57, 23, 1, 1, '2023-04-21 22:53:32', '2023-05-01 00:07:06');
INSERT INTO `b_quiz`
VALUES (4, 1, '念书更重要吗', '把学费拿来念书还是环游世界更合适？为什么？',
        '[\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\"]',
        123, 32, 1, 1, '2023-04-21 22:54:42', '2023-05-01 00:06:53');
INSERT INTO `b_quiz`
VALUES (5, 1, '爱情', '你心中的完美爱情是怎么样的？',
        '[\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\"]',
        119, 13, 1, 1, '2023-04-21 22:32:07', '2023-05-01 00:06:08');
INSERT INTO `b_quiz`
VALUES (6, 1, '苦难', '苦难有什么价值？',
        '[\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\"]',
        37, 2, 1, 1, '2023-04-21 22:51:42', '2023-05-01 00:05:53');
INSERT INTO `b_quiz`
VALUES (7, 1, '自由', '你对自由的理解是什么？',
        '[\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\"]',
        235, 27, 1, 1, '2023-04-21 22:53:32', '2023-05-01 00:05:36');
INSERT INTO `b_quiz`
VALUES (8, 1, '为什么会嫉妒', '同样是别人比自己强，为什么有时会产生嫉妒心理，而有时会产生崇拜？',
        '[\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\"]',
        578, 23, 1, 1, '2023-04-21 22:54:42', '2023-05-01 00:04:59');
INSERT INTO `b_quiz`
VALUES (9, 1, '留学', '二十六岁，工作三年却将留学三年，值得吗？',
        '[\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\"]',
        245, 102, 1, 1, '2023-04-21 22:32:07', '2023-05-01 00:05:18');
INSERT INTO `b_quiz`
VALUES (10, 1, '年轻', '如何看待“年轻时就释怀与淡泊，是没有希望的”这句话？',
        '[\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\"]',
        23, 2, 1, 1, '2023-04-21 22:51:42', '2023-05-01 00:04:38');
INSERT INTO `b_quiz`
VALUES (11, 1, '怎么努力', '要怎样努力，才能成为很厉害的人？',
        '[\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\"]',
        0, 0, 0, 0, '2023-04-21 22:53:32', '2023-05-01 00:04:17');
INSERT INTO `b_quiz`
VALUES (12, 1, '理念', '你遇到过哪些让你眼前一亮、醍醐灌顶或对你改变很大的理念？',
        '[\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\"]',
        278, 13, 1, 1, '2023-04-21 22:54:42', '2023-05-01 00:03:47');
INSERT INTO `b_quiz`
VALUES (13, 1, '为什么要努力', '人这一生为什么要努力？',
        '[\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\"]',
        33, 2, 1, 1, '2023-04-21 22:32:07', '2023-05-01 00:04:02');
INSERT INTO `b_quiz`
VALUES (14, 1, '困难', '你最困难的时候选择过放弃吗？',
        '[\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\"]',
        482, 167, 1, 1, '2023-04-21 22:51:42', '2023-05-01 00:03:30');
INSERT INTO `b_quiz`
VALUES (15, 1, '表白之后', '向喜欢的女生表白被拒绝了，还是喜欢她，怎么办？',
        '[\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/378d3d4d7e1c7696cbb7d0709538798f.jpg\",\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\"]',
        237, 19, 1, 1, '2023-04-21 22:53:32', '2023-05-01 00:03:08');
INSERT INTO `b_quiz`
VALUES (16, 1, '大世面', '什么叫见过大世面？',
        '[\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/378d3d4d7e1c7696cbb7d0709538798f.jpg\",\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\"]',
        567, 230, 1, 1, '2023-04-21 22:54:42', '2023-05-01 00:02:58');
INSERT INTO `b_quiz`
VALUES (17, 1, '科学与迷信', '科学和迷信的分界点是哪里？',
        '[\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\"]',
        769, 173, 1, 1, '2023-04-21 22:32:07', '2023-05-01 00:02:47');
INSERT INTO `b_quiz`
VALUES (18, 1, '建议', '你在生活中得到过的最好的建议是什么？',
        '[\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/378d3d4d7e1c7696cbb7d0709538798f.jpg\",\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\"]',
        2, 0, 1, 0, '2023-04-21 22:51:42', '2023-05-01 00:02:34');
INSERT INTO `b_quiz`
VALUES (19, 1, '最激励的话', '最能燃起你学习激情的一句话是什么？',
        '[\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\"]',
        6, 1, 1, 3, '2023-04-21 22:53:32', '2023-05-01 00:02:22');
INSERT INTO `b_quiz`
VALUES (20, 1, '新鲜感没有了怎么办', '恋爱半年，女朋友觉得没有了开始时的新鲜感，怎么办？',
        '[\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\"]',
        523, 85, 1, 1, '2023-04-21 22:54:42', '2023-05-01 00:01:55');
INSERT INTO `b_quiz`
VALUES (21, 1, '情商', '情商不高的例子有哪些？',
        '[\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/988e83dae0ed1fa784c73eaf9320936e.jpg\"]',
        97, 12, 1, 1, '2023-04-21 22:32:07', '2023-05-01 00:00:22');
INSERT INTO `b_quiz`
VALUES (22, 1, '最佳时期', '当你发现做一件事的最佳时期已经过了，还应该再去做吗？',
        '[\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\"]',
        10, 1, 1, 1, '2023-04-21 22:51:42', '2023-05-01 00:01:22');
INSERT INTO `b_quiz`
VALUES (23, 1, '道理', '有哪些道理是你读了不信，听不进去，直到你亲身经历方笃信不疑的？',
        '[\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\"]',
        34, 7, 1, 1, '2023-04-21 22:53:32', '2023-05-01 00:01:02');
INSERT INTO `b_quiz`
VALUES (24, 1, '人脉和朋友', '如何看待“年轻的时候需要的是朋友而不是人脉”？',
        '[\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/378d3d4d7e1c7696cbb7d0709538798f.jpg\",\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/12270c4fe6ff5e988c699946b9beef3a.jpg\"]',
        113, 29, 1, 1, '2023-04-21 22:54:42', '2023-05-01 19:19:07');

-- ----------------------------
-- Table structure for b_record
-- ----------------------------
DROP TABLE IF EXISTS `b_record`;
CREATE TABLE `b_record`
(
    `id`             int(0)                                                         NOT NULL AUTO_INCREMENT COMMENT '记录id',
    `user_id`        int(0)                                                         NOT NULL COMMENT '记录者id',
    `cover`          varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '记录缩略图',
    `title`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL     DEFAULT NULL COMMENT '记录标题',
    `type`           tinyint(0)                                                     NOT NULL COMMENT '记录类型(1约会 2活动 3赛事 4帮忙)',
    `content`        varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '记录内容',
    `images`         varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '记录图片',
    `video`          varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '记录视频',
    `like_number`    int(0)                                                         NULL     DEFAULT 0 COMMENT '点赞数',
    `collect_number` int(0)                                                         NULL     DEFAULT 0 COMMENT '收藏数',
    `status`         tinyint(1)                                                     NULL     DEFAULT 1 COMMENT '状态(1公开 2私密 3草稿)',
    `is_check`       tinyint(1)                                                     NOT NULL DEFAULT 1 COMMENT '是否通过 (0否 1是)',
    `is_top`         tinyint(1)                                                     NULL     DEFAULT 0 COMMENT '是否置顶(0否 1是)',
    `is_recommend`   tinyint(1)                                                     NULL     DEFAULT 0 COMMENT '是否推荐(0否 1是)',
    `is_delete`      tinyint(1)                                                     NOT NULL DEFAULT 0 COMMENT '是否删除(0否 1是)',
    `create_time`    datetime(0)                                                    NOT NULL COMMENT '记录时间',
    `update_time`    datetime(0)                                                    NULL     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 44
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_record
-- ----------------------------
INSERT INTO `b_record`
VALUES (1, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '代写', 4, '写作',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 546, 489, 1, 1, 1, 0,
        0, '2023-04-25 07:20:50', NULL);
INSERT INTO `b_record`
VALUES (3, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '代拿', 1, '拿快递',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 43, 56, 1, 0, 0, 1, 0,
        '2023-04-25 07:44:51', NULL);
INSERT INTO `b_record`
VALUES (4, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '代购', 2, '买东西',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 15, 59, 1, 1, 0, 0, 1,
        '2023-04-25 07:45:27', NULL);
INSERT INTO `b_record`
VALUES (5, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '代跑', 3, '咕咚',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 5424, 4589, 1, 0, 0, 0,
        0, '2023-04-25 07:46:40', NULL);
INSERT INTO `b_record`
VALUES (6, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '搬东西', 4, '行李',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 54, 56, 1, 1, 0, 0, 0,
        '2023-04-25 17:14:22', NULL);
INSERT INTO `b_record`
VALUES (7, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '猫', 1,
        '照顾校内流浪猫', 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 54,
        56, 1, 1, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (8, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '调研', 2, '写问卷',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 5, 1268, 1, 1, 0, 0, 0,
        '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (9, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '投票', 3, '投票',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 13, 489, 2, 1, 0, 0, 0,
        '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (10, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '作品', 4, '点赞',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 156, 48, 3, 0, 0, 0, 0,
        '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (11, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '调查', 1, '问答题',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 489, 5, 3, 1, 0, 0, 0,
        '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (12, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '唱歌比赛', 2,
        '嘉院好声音', 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 546, 268,
        1, 0, 1, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (13, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '篮球比赛', 4,
        '热血正青春', 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 212, 59,
        1, 1, 0, 1, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (14, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '摄影比赛', 1,
        '我和嘉院春天有个约会', 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL,
        5, 15, 1, 1, 0, 0, 1, '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (15, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '800米接力赛', 2,
        'RUN的味道', 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 15, 89, 1,
        1, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (16, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '英语比赛', 2,
        '大学生英语竞赛', 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 21,
        126, 1, 1, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (17, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '创业计划', 4,
        '“挑战杯”中国大学生创业计划竞赛',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 12, 459, 1, 0, 0, 0, 0,
        '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (18, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '高数比赛', 3,
        '高数竞赛', 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 5, 598, 1,
        1, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (19, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '说唱比赛', 4, '出路',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 48, 5, 2, 0, 0, 0, 0,
        '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (20, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '辩论赛', 1,
        '迟到的正义是/不是正义', 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg',
        NULL, 47, 89, 3, 1, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (21, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '自我技能的展示', 2,
        '校园达人秀', 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 4, 988,
        3, 1, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (22, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '跑步', 1, '唱歌比赛',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 89, 5968, 1, 1, 1, 0,
        0, '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (23, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '密室逃脱', 4,
        '篮球比赛', 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 48, 56, 1,
        1, 0, 1, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (24, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '剧本杀', 4,
        '摄影比赛', 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 55, 56, 1,
        0, 0, 0, 1, '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (25, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '异装类', 3,
        '800米接力赛', 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 9, 9, 1,
        1, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (26, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '异装类', 4,
        '英语比赛', 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 5, 1, 1, 0,
        0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (27, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '展览', 2, '创业计划',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 62, 8, 1, 1, 0, 0, 0,
        '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (28, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '展览', 3, '高数比赛',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 56, 15, 1, 1, 0, 0, 0,
        '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (29, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '展览', 3, '说唱比赛',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 48, 88, 2, 1, 0, 0, 0,
        '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (30, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '派对', 4, '辩论赛',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 85, 457, 3, 1, 0, 0, 0,
        '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (31, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '交易市场', 2,
        '自我技能的展示', 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 59,
        5988, 3, 0, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (32, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '约饭', 1, '吃饭',
        '[\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/85902ff1273548827014398faa50835a.jpg\",\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/1235feeed7bf35b90bc3026e21b19fc7.jpg\",\"https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/3703320c1d11a84e5f81ec5491b5f479.jpg\"]',
        '', 2655, 568, 1, 1, 1, 0, 0, '2023-04-26 14:31:43', '2023-05-01 17:46:20');
INSERT INTO `b_record`
VALUES (33, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '学习', 1, '探讨作业',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 48899, 56, 1, 0, 0, 1,
        0, '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (34, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', 2, '爬山',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 565, 488, 1, 1, 0, 0,
        1, '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (35, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', 2, '滑冰',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 5659, 598, 1, 1, 0, 0,
        0, '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (36, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', 3, '露营',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 2658, 98, 1, 1, 0, 0,
        0, '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (37, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', 2, '骑行',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 598, 898, 1, 1, 0, 0,
        0, '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (38, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', 4, '玩卡丁车',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 25, 525, 1, 0, 0, 0, 0,
        '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (39, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', 3, '射箭',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 5878, 69, 2, 1, 0, 0,
        0, '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (40, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', 2, '攀岩',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 5698, 263, 3, 0, 0, 0,
        0, '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (41, 1, 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', '玩乐', 1,
        '游玩动物园', 'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/jxxy.jpg', NULL, 598, 98,
        3, 1, 0, 0, 0, '2023-04-26 14:31:43', NULL);
INSERT INTO `b_record`
VALUES (43, 1,
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/image/848686a1da40e6e258f384d0e8350d5b.jpg',
        '测试', 2, '测试', '',
        'https://vhans-bucket-1314157378.cos.ap-shanghai.myqcloud.com/agreeRecord/video/316c7d1ec6d28ceec39431d99a0829e2.mp4',
        0, 0, 1, 1, 0, 0, 0, '2023-05-01 11:28:36', '2023-05-01 17:47:38');

-- ----------------------------
-- Table structure for b_tag
-- ----------------------------
DROP TABLE IF EXISTS `b_tag`;
CREATE TABLE `b_tag`
(
    `id`          int(0)                                                       NOT NULL AUTO_INCREMENT COMMENT '标签id',
    `tag_name`    varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签名',
    `create_time` datetime(0)                                                  NOT NULL COMMENT '创建时间',
    `update_time` datetime(0)                                                  NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 26
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_tag
-- ----------------------------
INSERT INTO `b_tag`
VALUES (15, '测试标签', '2023-02-22 12:10:21', NULL);
INSERT INTO `b_tag`
VALUES (16, '科技', '2023-04-21 14:09:49', NULL);
INSERT INTO `b_tag`
VALUES (17, '数学', '2023-04-21 22:51:42', NULL);
INSERT INTO `b_tag`
VALUES (18, '英语', '2023-04-21 22:53:32', NULL);
INSERT INTO `b_tag`
VALUES (19, '火箭', '2023-04-21 22:54:42', NULL);
INSERT INTO `b_tag`
VALUES (20, '文字', '2023-04-21 23:25:57', NULL);
INSERT INTO `b_tag`
VALUES (21, '约会', '2023-04-25 09:11:49', NULL);
INSERT INTO `b_tag`
VALUES (22, '友情', '2023-04-30 22:03:09', NULL);
INSERT INTO `b_tag`
VALUES (23, '人文', '2023-05-01 00:00:23', NULL);
INSERT INTO `b_tag`
VALUES (24, '哲理', '2023-05-01 00:01:02', NULL);
INSERT INTO `b_tag`
VALUES (25, '情义', '2023-05-01 00:01:55', NULL);

-- ----------------------------
-- Table structure for b_tag_text
-- ----------------------------
DROP TABLE IF EXISTS `b_tag_text`;
CREATE TABLE `b_tag_text`
(
    `id`      int(0)     NOT NULL AUTO_INCREMENT COMMENT '主键',
    `tag_id`  int(0)     NOT NULL COMMENT '标签id',
    `type`    tinyint(1) NOT NULL COMMENT '类型(1记录 2题目)',
    `type_id` int(0)     NOT NULL COMMENT '类型id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 182
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_tag_text
-- ----------------------------
INSERT INTO `b_tag_text`
VALUES (135, 23, 2, 21);
INSERT INTO `b_tag_text`
VALUES (136, 24, 2, 23);
INSERT INTO `b_tag_text`
VALUES (137, 24, 2, 22);
INSERT INTO `b_tag_text`
VALUES (138, 25, 2, 20);
INSERT INTO `b_tag_text`
VALUES (140, 24, 2, 19);
INSERT INTO `b_tag_text`
VALUES (141, 23, 2, 18);
INSERT INTO `b_tag_text`
VALUES (142, 16, 2, 17);
INSERT INTO `b_tag_text`
VALUES (143, 24, 2, 16);
INSERT INTO `b_tag_text`
VALUES (144, 25, 2, 15);
INSERT INTO `b_tag_text`
VALUES (145, 23, 2, 14);
INSERT INTO `b_tag_text`
VALUES (146, 24, 2, 12);
INSERT INTO `b_tag_text`
VALUES (147, 24, 2, 13);
INSERT INTO `b_tag_text`
VALUES (148, 23, 2, 11);
INSERT INTO `b_tag_text`
VALUES (149, 23, 2, 10);
INSERT INTO `b_tag_text`
VALUES (150, 24, 2, 10);
INSERT INTO `b_tag_text`
VALUES (151, 23, 2, 8);
INSERT INTO `b_tag_text`
VALUES (152, 23, 2, 9);
INSERT INTO `b_tag_text`
VALUES (153, 24, 2, 9);
INSERT INTO `b_tag_text`
VALUES (154, 20, 2, 7);
INSERT INTO `b_tag_text`
VALUES (155, 23, 2, 7);
INSERT INTO `b_tag_text`
VALUES (156, 15, 2, 6);
INSERT INTO `b_tag_text`
VALUES (157, 20, 2, 6);
INSERT INTO `b_tag_text`
VALUES (158, 15, 2, 5);
INSERT INTO `b_tag_text`
VALUES (159, 16, 2, 5);
INSERT INTO `b_tag_text`
VALUES (160, 17, 2, 5);
INSERT INTO `b_tag_text`
VALUES (161, 20, 2, 4);
INSERT INTO `b_tag_text`
VALUES (162, 23, 2, 3);
INSERT INTO `b_tag_text`
VALUES (163, 24, 2, 2);
INSERT INTO `b_tag_text`
VALUES (164, 20, 2, 1);
INSERT INTO `b_tag_text`
VALUES (177, 15, 1, 32);
INSERT INTO `b_tag_text`
VALUES (178, 21, 1, 32);
INSERT INTO `b_tag_text`
VALUES (179, 15, 1, 43);
INSERT INTO `b_tag_text`
VALUES (180, 15, 2, 24);
INSERT INTO `b_tag_text`
VALUES (181, 22, 2, 24);

-- ----------------------------
-- Table structure for b_user
-- ----------------------------
DROP TABLE IF EXISTS `b_user`;
CREATE TABLE `b_user`
(
    `id`          int(0)                                                        NOT NULL AUTO_INCREMENT COMMENT '用户id',
    `nickname`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '用户昵称',
    `username`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '用户名',
    `password`    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户密码',
    `avatar`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '头像',
    `intro`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT '' COMMENT '个人简介',
    `email`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT '' COMMENT '邮箱',
    `degree`      int(0)                                                        NULL     DEFAULT 0 COMMENT '活动参与度',
    `grade`       int(0)                                                        NULL     DEFAULT 0 COMMENT '解疑等级',
    `ip_address`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT '' COMMENT '登录ip',
    `ip_source`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT '' COMMENT '登录地址',
    `login_type`  tinyint(1)                                                    NOT NULL DEFAULT 0 COMMENT '登录方式 (1邮箱 2QQ 3Gitee 4Github)',
    `is_disable`  tinyint(1)                                                    NOT NULL DEFAULT 0 COMMENT '是否禁用 (0否 1是)',
    `login_time`  datetime(0)                                                   NULL     DEFAULT NULL COMMENT '登录时间',
    `create_time` datetime(0)                                                   NOT NULL COMMENT '创建时间',
    `update_time` datetime(0)                                                   NULL     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 16
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_user
-- ----------------------------
INSERT INTO `b_user`
VALUES (1, 'Vhans', 'admin@qq.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/vhans.jpg', '个人简介',
        '2873585297@qq.com', 99999, 0, '192.168.244.1', '内网IP|内网IP', 1, 0, '2023-04-09 16:19:17',
        '2022-11-29 21:45:48', '2023-04-09 16:19:17');
INSERT INTO `b_user`
VALUES (3, '测试账号', 'test@qq.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
        'https://vhans-agreement-1314157378.cos.ap-shanghai.myqcloud.com/images/vhans.jpg', '个人简介', 'test@qq.com',
        0, 0, '192.168.244.1', '内网IP|内网IP', 1, 0, '2023-04-09 16:17:33', '2022-11-30 21:34:26',
        '2023-04-09 16:17:33');

-- ----------------------------
-- Table structure for b_user_agreement
-- ----------------------------
DROP TABLE IF EXISTS `b_user_agreement`;
CREATE TABLE `b_user_agreement`
(
    `id`      int(0)     NOT NULL COMMENT '主键',
    `user_id` int(0)     NOT NULL COMMENT '用户id',
    `type`    tinyint(1) NOT NULL COMMENT '类型(1约会 2活动 3赛事 4帮忙 5题目)',
    `type_id` int(0)     NOT NULL COMMENT '类型id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_user_agreement
-- ----------------------------

-- ----------------------------
-- Table structure for b_user_collect
-- ----------------------------
DROP TABLE IF EXISTS `b_user_collect`;
CREATE TABLE `b_user_collect`
(
    `id`      int(0)     NOT NULL AUTO_INCREMENT COMMENT '主键',
    `user_id` int(0)     NOT NULL COMMENT '用户id',
    `type`    tinyint(1) NOT NULL COMMENT '收藏类型(1记录 2题目)',
    `type_id` int(0)     NOT NULL COMMENT '类型id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_user_collect
-- ----------------------------

-- ----------------------------
-- Table structure for b_user_like
-- ----------------------------
DROP TABLE IF EXISTS `b_user_like`;
CREATE TABLE `b_user_like`
(
    `id`      int(0)     NOT NULL AUTO_INCREMENT COMMENT '主键',
    `user_id` int(0)     NOT NULL COMMENT '用户id',
    `type`    tinyint(1) NOT NULL COMMENT '点赞类型(1记录 2题目 3评论)',
    `type_id` int(0)     NOT NULL COMMENT '类型id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_user_like
-- ----------------------------

-- ----------------------------
-- Table structure for site_config
-- ----------------------------
DROP TABLE IF EXISTS `site_config`;
CREATE TABLE `site_config`
(
    `id`               int(0)                                                        NOT NULL AUTO_INCREMENT COMMENT '主键',
    `user_avatar`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户头像',
    `tourist_avatar`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '游客头像',
    `site_name`        varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '网站名称',
    `site_address`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '网站地址',
    `site_intro`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '网站简介',
    `site_notice`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站公告',
    `create_site_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '建站日期',
    `record_number`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '备案号',
    `author_avatar`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '作者头像',
    `site_author`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '网站作者',
    `cover`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '默认缩略图',
    `about_me`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci         NULL COMMENT '关于我',
    `github`           varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT '' COMMENT 'Github',
    `gitee`            varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT '' COMMENT 'Gitee',
    `bilibili`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT '' COMMENT '哔哩哔哩',
    `qq`               varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT 'QQ',
    `comment_check`    tinyint(1)                                                    NOT NULL DEFAULT 1 COMMENT '是否评论审核 (0否 1是)',
    `quiz_check`       tinyint(1)                                                    NOT NULL DEFAULT 1 COMMENT '是否题目审核 (0否 1是)',
    `is_reward`        tinyint(1)                                                    NOT NULL DEFAULT 1 COMMENT '是否开启打赏 (0否 1是)',
    `wei_xin_code`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT '' COMMENT '微信二维码',
    `ali_code`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT '' COMMENT '支付宝二维码',
    `email_notice`     tinyint(1)                                                    NOT NULL DEFAULT 1 COMMENT '是否邮箱通知 (0否 1是)',
    `social_list`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '社交列表',
    `login_list`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '登录方式',
    `is_music`         tinyint(1)                                                    NOT NULL DEFAULT 1 COMMENT '是否开启音乐播放器 (0否 1是)',
    `music_id`         varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT '' COMMENT '网易云歌单id',
    `create_time`      datetime(0)                                                   NOT NULL COMMENT '创建时间',
    `update_time`      datetime(0)                                                   NULL     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of site_config
-- ----------------------------
INSERT INTO `site_config`
VALUES (1, 'https://static.ttkwsd.top/config/7b6f25adc2b9627b8918176888bee3b5.png',
        'https://static.ttkwsd.top/config/0bca52afdb2b9998132355d716390c9f.png', 'Hello World',
        'https://www.vhans.cloud', '网站介绍', '欢迎同学们加入三缺一,也积极欢迎同学们推荐给其他同学', '2023-04-10',
        '浙ICP备2023009806号', 'https://static.ttkwsd.top/config/05409c1ed50047535f28a40464f7b1ab.jpg', 'Vhans',
        'https://static.ttkwsd.top/config/d6a00d059a1e9729e763469deb4870df.jpg',
        '🍀个人简介\n\n想进大厂的小白\n\n感谢大佬们的开源精神💖', 'https://github.com/ICAN1999',
        'https://gitee.com/wu_shengdong', 'https://space.bilibili.com/505715511', '2873585297', 0, 0, 1,
        'https://static.ttkwsd.top/config/994a286571b002e93281899cb402bd15.png',
        'https://static.ttkwsd.top/config/f0be9dc73e230d8821179b9303a9ff49.jpg', 1, 'gitee,bilibili,github,qq',
        ',gitee,github', 1, '7611185981', '2023-01-07 19:31:33', '2023-04-26 09:20:00');

SET FOREIGN_KEY_CHECKS = 1;
