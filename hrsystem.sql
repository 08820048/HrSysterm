/*
 Navicat Premium Data Transfer

 Source Server         : crc
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : hrsystem

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 19/06/2021 18:13:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_department
-- ----------------------------
DROP TABLE IF EXISTS `tbl_department`;
CREATE TABLE `tbl_department`  (
  `dept_id` int(0) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_department
-- ----------------------------
INSERT INTO `tbl_department` VALUES (1, '开发部');
INSERT INTO `tbl_department` VALUES (2, '营销部');
INSERT INTO `tbl_department` VALUES (3, '事业部');
INSERT INTO `tbl_department` VALUES (4, '营销部');
INSERT INTO `tbl_department` VALUES (5, '宣传部');

-- ----------------------------
-- Table structure for tbl_employee
-- ----------------------------
DROP TABLE IF EXISTS `tbl_employee`;
CREATE TABLE `tbl_employee`  (
  `emp_id` int unsigned NOT NULL,
  `emp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `emp_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `emp_gender` bit(1) NULL DEFAULT NULL,
  `d_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`emp_id`) USING BTREE,
  INDEX `d_id`(`d_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_employee
-- ----------------------------
INSERT INTO `tbl_employee` VALUES (1, '李桂华', '21213@qq.com', b'1', 1);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` int(0) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `active_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, '测试', '123456', NULL, 'N');
INSERT INTO `user_info` VALUES (2, 'sds', '123456', NULL, NULL);
INSERT INTO `user_info` VALUES (3, 'xuyi', '123456', NULL, NULL);
INSERT INTO `user_info` VALUES (4, 'zff', '123456', NULL, NULL);
INSERT INTO `user_info` VALUES (5, 'hjgj', '3454', NULL, NULL);
INSERT INTO `user_info` VALUES (6, 'sas', '2131', NULL, NULL);
INSERT INTO `user_info` VALUES (7, 'fhsjd', '2111', NULL, NULL);
INSERT INTO `user_info` VALUES (8, 'xxa', '12121', NULL, NULL);
INSERT INTO `user_info` VALUES (9, '悬壶济世', '1212', NULL, NULL);
INSERT INTO `user_info` VALUES (10, '村上春树', 'sasa', NULL, NULL);
INSERT INTO `user_info` VALUES (11, '啥啊啥', 'sasaa', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
