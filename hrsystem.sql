/*
 Navicat Premium Data Transfer

 Source Server         : crc
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : hrsystem

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 25/06/2021 13:30:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_department
-- ----------------------------
DROP TABLE IF EXISTS `tbl_department`;
CREATE TABLE `tbl_department`  (
  `dept_id` int(0) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_department
-- ----------------------------
INSERT INTO `tbl_department` VALUES (40, '运营部');
INSERT INTO `tbl_department` VALUES (41, '财务部');
INSERT INTO `tbl_department` VALUES (42, '营销部');
INSERT INTO `tbl_department` VALUES (43, '开发部');

-- ----------------------------
-- Table structure for tbl_employee
-- ----------------------------
DROP TABLE IF EXISTS `tbl_employee`;
CREATE TABLE `tbl_employee`  (
  `emp_id` int(0) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `emp_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `emp_gender` bit(1) NULL DEFAULT NULL,
  `d_id` int(0) NOT NULL,
  PRIMARY KEY (`emp_id`) USING BTREE,
  INDEX `d_id`(`d_id`) USING BTREE,
  CONSTRAINT `tbl_employee_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `tbl_department` (`dept_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_employee
-- ----------------------------
INSERT INTO `tbl_employee` VALUES (53, '刘德华', '20221612@qq.com', b'0', 41);
INSERT INTO `tbl_employee` VALUES (54, '徐毅', '121312@qq.com', b'1', 42);
INSERT INTO `tbl_employee` VALUES (75, '流年', '2217021563@qq.com', b'0', 40);
INSERT INTO `tbl_employee` VALUES (76, '陈伟霆', '2487534069@qq.com', b'0', 41);
INSERT INTO `tbl_employee` VALUES (77, '刘恺威', '1277771312@qq.com', b'0', 42);
INSERT INTO `tbl_employee` VALUES (78, '莫文蔚', '1277771312@qq.com', b'1', 41);
INSERT INTO `tbl_employee` VALUES (79, '钟汉良', '1277771312@qq.com', b'0', 41);
INSERT INTO `tbl_employee` VALUES (80, '叶轩', '1277771312@qq.com', b'1', 41);
INSERT INTO `tbl_employee` VALUES (81, '洪金宝', '2217021563@qq.com', b'0', 43);
INSERT INTO `tbl_employee` VALUES (82, '成龙', '1277771312@qq.com', b'0', 41);
INSERT INTO `tbl_employee` VALUES (83, '林子聪', '2217021563@qq.com', b'0', 41);
INSERT INTO `tbl_employee` VALUES (84, '苗侨伟', '1277771312@qq.com', b'0', 41);
INSERT INTO `tbl_employee` VALUES (85, '曾志伟', '2217021563@qq.com', b'0', 41);
INSERT INTO `tbl_employee` VALUES (86, '任达华', '1277771312@qq.com', b'0', 42);
INSERT INTO `tbl_employee` VALUES (87, '傻强', '1277771312@qq.com', b'1', 41);
INSERT INTO `tbl_employee` VALUES (88, '余诗曼', '2217021563@qq.com', b'1', 41);
INSERT INTO `tbl_employee` VALUES (89, '余文乐', '2217021563@qq.com', b'0', 40);
INSERT INTO `tbl_employee` VALUES (90, '林凡', '1277771312@qq.com', b'0', 40);
INSERT INTO `tbl_employee` VALUES (91, '米雪', '2217021563@qq.com', b'1', 43);
INSERT INTO `tbl_employee` VALUES (92, '邓紫棋', '2217021563@qq.com', b'1', 42);
INSERT INTO `tbl_employee` VALUES (93, '莫少聪', '1277771312@qq.com', b'0', 41);
INSERT INTO `tbl_employee` VALUES (95, '古天乐', '2217021563@qq.com', b'0', 41);
INSERT INTO `tbl_employee` VALUES (96, '樊少皇', '2487534069@qq.com', b'0', 42);
INSERT INTO `tbl_employee` VALUES (97, '张晋', '1217021563@qq.com', b'1', 43);
INSERT INTO `tbl_employee` VALUES (98, '吴宣仪', '2217021563@qq.com', b'1', 41);
INSERT INTO `tbl_employee` VALUES (99, '甄子丹', '1277771312@qq.com', b'0', 41);
INSERT INTO `tbl_employee` VALUES (100, '吴千语', '2217021563@qq.com', b'0', 41);
INSERT INTO `tbl_employee` VALUES (101, '陈浩明', '1277771312@qq.com', b'0', 43);
INSERT INTO `tbl_employee` VALUES (102, '徐晶晶', '2217021563@qq.com', b'1', 42);
INSERT INTO `tbl_employee` VALUES (103, '徐锦江', '2487534069@qq.com', b'0', 42);
INSERT INTO `tbl_employee` VALUES (104, '康华', '2217021563@qq.com', b'0', 41);
INSERT INTO `tbl_employee` VALUES (105, '李小龙', '2217021563@qq.com', b'0', 43);
INSERT INTO `tbl_employee` VALUES (106, '唐太宗', '2217021563@qq.com', b'0', 42);
INSERT INTO `tbl_employee` VALUES (107, '武则天', '1277771312@qq.com', b'1', 41);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` int(0) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `user_password` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `user_telephone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `user_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (12, '彭于晏', '123456', '18212629751', NULL);
INSERT INTO `user_info` VALUES (13, '邹芳芳', '7654321', '18212629751', NULL);
INSERT INTO `user_info` VALUES (14, '刘德华', '1234567', '17366637245', NULL);
INSERT INTO `user_info` VALUES (15, '周慧敏', '12345678', '18212629751', NULL);
INSERT INTO `user_info` VALUES (16, '李小龙', '1234567', '18212629751', NULL);

SET FOREIGN_KEY_CHECKS = 1;
