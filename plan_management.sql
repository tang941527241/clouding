/*
 Navicat Premium Data Transfer

 Source Server         : Windows_Mysql80
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : localhost:3306
 Source Schema         : plan_management

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 30/08/2024 09:31:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add 字典信息', 7, 'add_plandict');
INSERT INTO `auth_permission` VALUES (26, 'Can change 字典信息', 7, 'change_plandict');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 字典信息', 7, 'delete_plandict');
INSERT INTO `auth_permission` VALUES (28, 'Can view 字典信息', 7, 'view_plandict');
INSERT INTO `auth_permission` VALUES (29, 'Can add 计划信息', 8, 'add_plan');
INSERT INTO `auth_permission` VALUES (30, 'Can change 计划信息', 8, 'change_plan');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 计划信息', 8, 'delete_plan');
INSERT INTO `auth_permission` VALUES (32, 'Can view 计划信息', 8, 'view_plan');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$720000$QqMkWFTrGqYB9J7O5jo4hp$6oit2ho5DGogk+c9PFDbvbLCUagVaR436tgJqW0wGIs=', '2024-08-29 14:43:21.492809', 1, 'admin', '', '', 'admin@django.com', 1, 1, '2024-08-29 13:42:01.299788');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_chk_1` CHECK (`action_flag` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (7, 'plan_dicts', 'plandict');
INSERT INTO `django_content_type` VALUES (8, 'plans', 'plan');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2024-08-29 13:40:02.001521');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2024-08-29 13:40:02.463271');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2024-08-29 13:40:02.592749');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2024-08-29 13:40:02.599749');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2024-08-29 13:40:02.608021');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2024-08-29 13:40:02.682905');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2024-08-29 13:40:02.733352');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2024-08-29 13:40:02.752816');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2024-08-29 13:40:02.759811');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2024-08-29 13:40:02.803208');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2024-08-29 13:40:02.806207');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2024-08-29 13:40:02.813208');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2024-08-29 13:40:02.887240');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2024-08-29 13:40:02.991015');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2024-08-29 13:40:03.009305');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2024-08-29 13:40:03.016882');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2024-08-29 13:40:03.074373');
INSERT INTO `django_migrations` VALUES (18, 'plan_dicts', '0001_initial', '2024-08-29 13:40:03.108112');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2024-08-29 13:40:03.140475');
INSERT INTO `django_migrations` VALUES (20, 'plans', '0001_initial', '2024-08-29 13:40:29.634255');
INSERT INTO `django_migrations` VALUES (21, 'plan_dicts', '0002_alter_plandict_options', '2024-08-29 13:55:34.444042');
INSERT INTO `django_migrations` VALUES (22, 'plan_dicts', '0003_alter_plandict_options', '2024-08-29 13:56:16.407573');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('uwegicnk5eyxijsxitlqcmai2k4mgonu', '.eJxVjMsKgzAQRf8l6xLMQ41ddu83hJnMpNpqAj5Wpf_eCEJbBu7i3DvnJTzs2-D3lRc_krgKJS6_DCE8OR0FPSDdsww5bcuI8pjIs11ln4mn27n9EwywDuXbskHCoGJbjrGxtTHklDNN3enGEmtTYUct24idpRIuGgVRh0o71dZFeugSzFxsQPOYTuSXPH3Z-wOD60Uz:1sjgMr:7JLmpkOefRXjIrB5Vj4qvskZlixhhYdCrXcQYHW_T8I', '2024-09-12 14:43:21.495871');

-- ----------------------------
-- Table structure for plan
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `plan_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `year` date NOT NULL,
  `plan_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `project_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `audit_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `organizational_units` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `audited_objects` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `implementing_units` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `project_level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `creation_time` datetime(6) NOT NULL,
  `implementation_start_time` datetime(6) NOT NULL,
  `implementation_end_time` datetime(6) NOT NULL,
  `batch` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `program_leader` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `project_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `audit_highlights` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `plan_name`(`plan_name` ASC) USING BTREE,
  UNIQUE INDEX `plan_number`(`plan_number` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plan
-- ----------------------------
INSERT INTO `plan` VALUES (2, '审计测试', '202408290001', '2024-01-01', '1', '2', '1', '1', '2', '1', '1', '2024-08-29 14:31:26.881807', '2023-12-31 16:00:00.000000', '2024-08-31 16:00:00.000000', '2', '1', '1', '审计', '备注');
INSERT INTO `plan` VALUES (3, '审计测试2', '202408290002', '2023-01-01', '1', '2', '1', '2', '1', '2', '2', '2024-08-29 14:45:05.704486', '2022-12-31 16:00:00.000000', '2025-01-31 16:00:00.000000', '2', '2', '1', '审计', '备注');
INSERT INTO `plan` VALUES (4, '审计测试3', '202408300001', '2024-01-01', '1', '2', '2', '2', '3', '2', '2', '2024-08-30 01:02:33.950249', '2022-12-31 16:00:00.000000', '2025-02-28 16:00:00.000000', '2', '1', '1', '审计', '备注');
INSERT INTO `plan` VALUES (5, '审计测试4', '202408300002', '2022-01-01', '0', '3', '3', '2', '3', '2', '2', '2024-08-30 01:03:52.230132', '2020-12-31 16:00:00.000000', '2024-02-29 16:00:00.000000', '3', '1', '2', '审计', '备注');
INSERT INTO `plan` VALUES (6, '审计测试5', '202408300003', '2023-01-01', '0', '2', '2', '2', '1', '2', '2', '2024-08-30 01:04:22.813864', '2020-12-31 16:00:00.000000', '2024-08-31 16:00:00.000000', '2', '1', '1', '审计', '备注');
INSERT INTO `plan` VALUES (7, '审计测试6', '202408300004', '2024-01-01', '1', '1', '2', '3', '2', '1', '2', '2024-08-30 01:04:54.176492', '2022-12-31 16:00:00.000000', '2024-02-29 16:00:00.000000', '2', '1', '1', '审计', '备注');
INSERT INTO `plan` VALUES (8, '审计测试7', '202408300005', '2024-01-01', '0', '2', '3', '2', '2', '2', '1', '2024-08-30 01:06:12.772700', '2023-12-31 16:00:00.000000', '2025-02-28 16:00:00.000000', '2', '1', '1', '审计', '备注');
INSERT INTO `plan` VALUES (9, '审计测试8', '202408300006', '2024-01-01', '0', '1', '1', '2', '2', '1', '3', '2024-08-30 01:06:38.214015', '2023-12-31 16:00:00.000000', '2024-01-31 16:00:00.000000', '2', '2', '1', '审计', '备注');
INSERT INTO `plan` VALUES (10, '审计测试9', '202408300007', '2024-01-01', '0', '2', '3', '2', '2', '2', '1', '2024-08-30 01:07:05.646096', '2023-12-31 16:00:00.000000', '2025-02-28 16:00:00.000000', '2', '2', '1', '审计', '备注');
INSERT INTO `plan` VALUES (11, '审计测试10', '202408300008', '2024-01-01', '0', '2', '1', '2', '1', '1', '3', '2024-08-30 01:07:34.283186', '2020-12-31 16:00:00.000000', '2024-08-31 16:00:00.000000', '1', '1', '2', '审计', '备注');
INSERT INTO `plan` VALUES (12, '审计测试11', '202408300009', '2023-01-01', '0', '1', '2', '2', '1', '2', '2', '2024-08-30 01:07:56.678875', '2020-12-31 16:00:00.000000', '2024-01-31 16:00:00.000000', '1', '1', '0', '审计', '备注');
INSERT INTO `plan` VALUES (13, '审计测试12', '202408300010', '2024-01-01', '1', '2', '1', '1', '2', '1', '1', '2024-08-30 01:09:48.697805', '2023-12-31 16:00:00.000000', '2024-08-31 16:00:00.000000', '1', '1', '1', '审计', '备注');

-- ----------------------------
-- Table structure for plan_dict
-- ----------------------------
DROP TABLE IF EXISTS `plan_dict`;
CREATE TABLE `plan_dict`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_type_code`(`type` ASC, `code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plan_dict
-- ----------------------------
INSERT INTO `plan_dict` VALUES (17, 'plan_status', '0', '未发布');
INSERT INTO `plan_dict` VALUES (18, 'plan_status', '1', '已发布');
INSERT INTO `plan_dict` VALUES (19, 'project_type', '1', '专家');
INSERT INTO `plan_dict` VALUES (20, 'project_type', '2', '金融');
INSERT INTO `plan_dict` VALUES (21, 'project_type', '3', '物资');
INSERT INTO `plan_dict` VALUES (22, 'audit_type', '1', '国家审计');
INSERT INTO `plan_dict` VALUES (23, 'audit_type', '2', '省级审计');
INSERT INTO `plan_dict` VALUES (24, 'audit_type', '3', '市级审计');
INSERT INTO `plan_dict` VALUES (25, 'organizational_units', '1', '国家电网');
INSERT INTO `plan_dict` VALUES (26, 'organizational_units', '2', '北京电网');
INSERT INTO `plan_dict` VALUES (27, 'organizational_units', '3', '天津电网');
INSERT INTO `plan_dict` VALUES (28, 'audited_objects', '1', '个人');
INSERT INTO `plan_dict` VALUES (29, 'audited_objects', '2', '企业');
INSERT INTO `plan_dict` VALUES (30, 'audited_objects', '3', '单位');
INSERT INTO `plan_dict` VALUES (31, 'implementing_units', '1', '国家实施');
INSERT INTO `plan_dict` VALUES (32, 'implementing_units', '2', '省级实施');
INSERT INTO `plan_dict` VALUES (33, 'project_level', '1', '1级');
INSERT INTO `plan_dict` VALUES (34, 'project_level', '2', '2级');
INSERT INTO `plan_dict` VALUES (35, 'project_level', '3', '3级');
INSERT INTO `plan_dict` VALUES (36, 'batch', '1', '100001');
INSERT INTO `plan_dict` VALUES (37, 'batch', '2', '100002');
INSERT INTO `plan_dict` VALUES (38, 'batch', '3', '100003');
INSERT INTO `plan_dict` VALUES (39, 'program_leader', '1', 'zhangsan');
INSERT INTO `plan_dict` VALUES (40, 'program_leader', '2', '李四');
INSERT INTO `plan_dict` VALUES (41, 'project_status', '0', '未启动');
INSERT INTO `plan_dict` VALUES (42, 'project_status', '1', '启动');
INSERT INTO `plan_dict` VALUES (43, 'project_status', '2', '完成');

SET FOREIGN_KEY_CHECKS = 1;
