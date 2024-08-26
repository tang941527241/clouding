use management;
/*
 Navicat MySQL Data Transfer

 Source Server         : mysql8
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : student_management

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 05/06/2024 08:46:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
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
INSERT INTO `auth_permission` VALUES (25, 'Can add 班级', 7, 'add_grade');
INSERT INTO `auth_permission` VALUES (26, 'Can change 班级', 7, 'change_grade');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 班级', 7, 'delete_grade');
INSERT INTO `auth_permission` VALUES (28, 'Can view 班级', 7, 'view_grade');
INSERT INTO `auth_permission` VALUES (29, 'Can add 学生信息', 8, 'add_student');
INSERT INTO `auth_permission` VALUES (30, 'Can change 学生信息', 8, 'change_student');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 学生信息', 8, 'delete_student');
INSERT INTO `auth_permission` VALUES (32, 'Can view 学生信息', 8, 'view_student');
INSERT INTO `auth_permission` VALUES (33, 'Can add 老师信息', 9, 'add_teacher');
INSERT INTO `auth_permission` VALUES (34, 'Can change 老师信息', 9, 'change_teacher');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 老师信息', 9, 'delete_teacher');
INSERT INTO `auth_permission` VALUES (36, 'Can view 老师信息', 9, 'view_teacher');
INSERT INTO `auth_permission` VALUES (37, 'Can add 成绩信息', 10, 'add_score');
INSERT INTO `auth_permission` VALUES (38, 'Can change 成绩信息', 10, 'change_score');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 成绩信息', 10, 'delete_score');
INSERT INTO `auth_permission` VALUES (40, 'Can view 成绩信息', 10, 'view_score');
COMMIT;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
BEGIN;
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$720000$NQWv4SdaLAfg0QzLUVTyPo$todNWXoF9WuHPs3Rz19ADJ8EMcu1GuV7eU7uRaCIuzk=', '2024-05-28 07:23:30.955855', 1, 'admin', '', '', 'admin@qq.com', 1, 1, '2024-04-26 02:57:09.327234');
INSERT INTO `auth_user` VALUES (2, 'pbkdf2_sha256$720000$xyVKZeDI7EUwxfN4gsQ32f$UuAQofynY4OmQvHl/n298GXwvaMPIpMeA++su9xVbJw=', NULL, 0, '张三丰_x123456789123111111', '', '', '', 0, 1, '2024-04-30 02:32:21.629336');
INSERT INTO `auth_user` VALUES (3, 'pbkdf2_sha256$720000$xljkCK7e1czCl0ZbGRHa2L$rSOdh4Xl2IzMqeEogNGwN4bUFwpqfy0kniKjIqa4KVA=', NULL, 0, '张三_x123456789123456788', '', '', '', 0, 1, '2024-04-30 02:34:01.118726');
INSERT INTO `auth_user` VALUES (4, 'pbkdf2_sha256$720000$FqmEtFiXqDrMJqC7PbQPmR$UO+dTOAZmuYxOl5c69jvkTPJbavLno9Na2ThLecP90Q=', NULL, 0, '李四_x123456789012345678', '', '', '', 0, 1, '2024-04-30 02:38:42.243480');
INSERT INTO `auth_user` VALUES (5, 'pbkdf2_sha256$720000$2Z7Pd6jATttZ1V8hbo5L95$DP5o7U2X4FdfCf541uu9V7fIqhgZ2983eGxBffZIHF4=', NULL, 0, '张三_x123456789123456789', '', '', '', 0, 1, '2024-04-30 06:33:50.985945');
INSERT INTO `auth_user` VALUES (6, 'pbkdf2_sha256$720000$N9ifdxM7rd9qSO6NG3dtzx$U0XUJ/J/l7V0MaS43fcmhP+50Ml1jk5v6brTpL8y5KQ=', NULL, 0, '李四_x123456789987654321', '', '', '', 0, 1, '2024-04-30 06:34:22.067958');
INSERT INTO `auth_user` VALUES (7, 'pbkdf2_sha256$720000$rpqihEWkF1ChY9hAKzbN7D$3Ko/sIqJ0UcvZzc26jI/CcWIY021P4PoJvH+wQOH67E=', NULL, 0, '王五_x987654321987654321', '', '', '', 0, 1, '2024-04-30 06:34:56.555891');
INSERT INTO `auth_user` VALUES (8, 'pbkdf2_sha256$720000$83R2THVGSOGS8Enc8Z9d1K$Py61W0U/uXyVDpoZ8fEYlS9Pbn/bCatiZBvgb3otR9w=', '2024-05-09 10:35:43.071613', 0, '张亮_G486190201508054369', '', '', '', 0, 1, '2024-05-06 06:58:22.412643');
INSERT INTO `auth_user` VALUES (9, 'pbkdf2_sha256$720000$qB2KdccW23KaNUGwNqmryy$I5Fsg1QIbVGMiQ4laEsK3CdlUcfUxqjKJVIieLtaVjc=', '2024-05-09 11:07:44.270878', 0, '吕帅_G533969201208026540', '', '', '', 0, 1, '2024-05-06 07:09:38.784758');
INSERT INTO `auth_user` VALUES (10, 'pbkdf2_sha256$720000$jixdygtLRqJTdUIp587TzQ$Y2d14SbGLKO65lGg2EJPW7xurqTS0N4+BpQAz2rSX/I=', NULL, 0, '金鑫_G548862201612173130', '', '', '', 0, 1, '2024-05-06 07:09:39.533919');
INSERT INTO `auth_user` VALUES (11, 'pbkdf2_sha256$720000$fm8by3Qbb296dyLq8EMEJw$C5Z3BG3sXFnMIe55CjrW85s5PO00dGRhO7T9vi/E/0k=', NULL, 0, '张欣_G562717201110265132', '', '', '', 0, 1, '2024-05-06 07:09:40.264090');
INSERT INTO `auth_user` VALUES (12, 'pbkdf2_sha256$720000$jYFAj5hW0U9oyV6Pe63Tyn$+k2XU6rSCt+3OF9DH9SI9pKRbNoUEbxJp1xVf0m0SdY=', NULL, 0, '黄伟_G610198201612242535', '', '', '', 0, 1, '2024-05-06 07:09:40.983820');
INSERT INTO `auth_user` VALUES (13, 'pbkdf2_sha256$720000$ZBKMmShx5Bu1cUdmgdWJ4o$osMF3hRAAcALKNlnnY3tOiTZqLHHvlgAGAcQxQBBLWY=', NULL, 0, '钟佳_G556035201703192974', '', '', '', 0, 1, '2024-05-06 07:09:41.698217');
INSERT INTO `auth_user` VALUES (14, 'pbkdf2_sha256$720000$i7Nlmmiz8w8k7zi38kxzoM$qYAz82AmubzTDBH8ciWnRpZBaVyXhZQFKNwFN7jk0FA=', NULL, 0, '萧红_G512635201302199490', '', '', '', 0, 1, '2024-05-06 07:09:42.482036');
INSERT INTO `auth_user` VALUES (15, 'pbkdf2_sha256$720000$iG65UFRJCK2wKHNvBVw2yv$2QkILgcVPtyCMJ4OPdeWtH3xsShWphuS9wLOJkUZVi8=', NULL, 0, '戴亮_G476620201211078926', '', '', '', 0, 1, '2024-05-06 07:09:43.224579');
INSERT INTO `auth_user` VALUES (16, 'pbkdf2_sha256$720000$3sFC3xJGYl7aK1jgsSmN8L$87n4Rqc0DSoQWIsEkQTsYe1YOy/Kc8R0QdJir+Rpa5M=', NULL, 0, '张婷婷_G565584201410153486', '', '', '', 0, 1, '2024-05-06 07:09:43.941931');
INSERT INTO `auth_user` VALUES (17, 'pbkdf2_sha256$720000$zR1ISnDFu6tOaHqcNJETkj$bYzZsAFFmvmPVHJ9M5J56ZHgJe8YBtA0mbaVu+J0gG0=', NULL, 0, '伊娟_G406752201611237458', '', '', '', 0, 1, '2024-05-06 07:09:44.653705');
INSERT INTO `auth_user` VALUES (18, 'pbkdf2_sha256$720000$mNreXfsrNlDuDB9qKd1xja$ycfr5OnPuzBkkaVbZuBU2//L2BnWnHc2ecZ4PNV9OWA=', NULL, 0, '刘雪梅_G652091201210207412', '', '', '', 0, 1, '2024-05-06 07:09:45.366650');
INSERT INTO `auth_user` VALUES (19, 'pbkdf2_sha256$720000$OgwIu9K5cekqyM1BAaSSe2$P9kLWslCBP5KT3ZXE+bi1WbyCkED50BB4d+Z9n5CTmc=', NULL, 0, '宋勇_G636865201412199914', '', '', '', 0, 1, '2024-05-06 07:09:46.081624');
INSERT INTO `auth_user` VALUES (20, 'pbkdf2_sha256$720000$MLspqWBvUW1vzENXebQCFw$hVoclol20BsorVRfpQsm68Wn+4stxz9sBLbjRo3Yxeo=', NULL, 0, '余帅_G543259201505062507', '', '', '', 0, 1, '2024-05-06 07:09:46.796737');
INSERT INTO `auth_user` VALUES (21, 'pbkdf2_sha256$720000$FWsUW6FM7f2BOLRsMCnyyK$wL3renZL60c2jCmY7oH/7eeVSUGrR8O8MobqS3Y7OnQ=', NULL, 0, '阮颖_G480282201410046212', '', '', '', 0, 1, '2024-05-06 07:09:47.525361');
INSERT INTO `auth_user` VALUES (22, 'pbkdf2_sha256$720000$IuJCrdGjPE00lA8JvC8TKN$ynoU7ctyUYFYBH0NBEZ153Hc8KGCGPnt3ssUqSA1n9k=', NULL, 0, '李洁_G445473201708202345', '', '', '', 0, 1, '2024-05-06 07:09:48.247693');
INSERT INTO `auth_user` VALUES (23, 'pbkdf2_sha256$720000$HLYWh2MMOJgJZSVSWKoU9e$ngOikm52hHJGD40WzkkBc4FkbbZl6pj28joq+grw8vc=', NULL, 0, '王娟_G623113201306037856', '', '', '', 0, 1, '2024-05-06 07:09:48.963211');
INSERT INTO `auth_user` VALUES (24, 'pbkdf2_sha256$720000$bjN1JbVDWlpZAKEVRgSyEB$pzb/VgReCkCE4hoGC7waDs8aE4LRLqTB7BgRwDt21hA=', NULL, 0, '吴博_G597622201501033709', '', '', '', 0, 1, '2024-05-06 07:09:49.735412');
INSERT INTO `auth_user` VALUES (25, 'pbkdf2_sha256$720000$TsQ1RG0lbujPKSLPzZXMQX$M8yND5NcsUbKAD6UyVFNAZIqgaXp2XDSRkHbNTsEJ08=', NULL, 0, '朱玉_G655308201110037589', '', '', '', 0, 1, '2024-05-06 07:09:50.456806');
INSERT INTO `auth_user` VALUES (26, 'pbkdf2_sha256$720000$r8YAvE9SZ8IXS3Rxf9quPS$DvOuR3Evr0NARut5A8h+3uFX2NbNIly1Fn2+SNcpHAE=', NULL, 0, '张桂香_G586476201508266228', '', '', '', 0, 1, '2024-05-06 07:09:51.171918');
INSERT INTO `auth_user` VALUES (27, 'pbkdf2_sha256$720000$JrGl1gV5wq3mw40Qs7gFtq$FMrGPzYw4FRXDJUZFnBx5xUx+RerbeSOdNp/C5PEg+A=', NULL, 0, '王淑华_G629116201305062115', '', '', '', 0, 1, '2024-05-06 07:09:51.889329');
INSERT INTO `auth_user` VALUES (28, 'pbkdf2_sha256$720000$wWUKoVwnX3SLjcomy6FVMb$q0xK2xm73lhMX0/KDum5tG8Y/K8kjsLUPq5CBu4F0t0=', NULL, 0, '张三丰_13412345678', '', '', '', 0, 1, '2024-05-08 06:07:23.076201');
INSERT INTO `auth_user` VALUES (29, 'pbkdf2_sha256$720000$JYtYlxO8ipixTX1RmSoBxq$JN/qbVOSKY643GHncuBL0BhNsOEI63kzkLnqo9+mrCc=', '2024-05-09 10:49:18.165415', 0, '张三_13312345678', '', '', '', 0, 1, '2024-05-08 06:11:48.118908');
INSERT INTO `auth_user` VALUES (30, 'pbkdf2_sha256$720000$rkNWcbtCpHQzR7tD4zNMA3$6e3wlBsfRdha+/uY6dLHhGv4dPuVH1PP7lc+waEQe/4=', '2024-05-10 06:02:59.325396', 0, '李四_13512345678', '', '', '', 0, 1, '2024-05-08 06:12:03.884683');
COMMIT;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
BEGIN;
INSERT INTO `django_admin_log` VALUES (1, '2024-04-26 03:34:18.926751', '1', '1年1班', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (2, '2024-04-26 03:34:33.076822', '1', '1年2班', 2, '[{\"changed\": {\"fields\": [\"\\u73ed\\u7ea7\\u540d\\u79f0\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (3, '2024-04-26 07:19:17.751430', '2', '1年3班', 1, '[{\"added\": {}}]', 7, 1);
COMMIT;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (7, 'grades', 'grade');
INSERT INTO `django_content_type` VALUES (10, 'scores', 'score');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (8, 'students', 'student');
INSERT INTO `django_content_type` VALUES (9, 'teachers', 'teacher');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2024-04-26 02:56:12.256748');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2024-04-26 02:56:12.460108');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2024-04-26 02:56:12.527545');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2024-04-26 02:56:12.536858');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2024-04-26 02:56:12.544520');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2024-04-26 02:56:12.597696');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2024-04-26 02:56:12.670912');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2024-04-26 02:56:12.696669');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2024-04-26 02:56:12.704878');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2024-04-26 02:56:12.735459');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2024-04-26 02:56:12.736920');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2024-04-26 02:56:12.745646');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2024-04-26 02:56:12.783293');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2024-04-26 02:56:12.822241');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2024-04-26 02:56:12.842280');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2024-04-26 02:56:12.854977');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2024-04-26 02:56:12.893136');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2024-04-26 02:56:12.908752');
INSERT INTO `django_migrations` VALUES (19, 'grades', '0001_initial', '2024-04-26 03:32:10.859079');
INSERT INTO `django_migrations` VALUES (20, 'students', '0001_initial', '2024-04-28 05:51:49.473473');
INSERT INTO `django_migrations` VALUES (21, 'teachers', '0001_initial', '2024-05-08 05:54:22.699131');
INSERT INTO `django_migrations` VALUES (22, 'scores', '0001_initial', '2024-05-08 06:44:21.532032');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('drtplrfu6cefc4adjds47svztzd362x5', '.eJxVjMsOwiAQRf-FtSHyBpfu_QYyw4BUDSSlXRn_3TbpQrfnnHvfLMK61LiOPMeJ2IUJdvplCOmZ2y7oAe3eeeptmSfke8IPO_itU35dj_bvoMKo29rpkpVFj4RGgyGyoJUXxfmkwkaDVcFYCedktClSClRQSKDw2XinPPt8AesaN7M:1s0BmW:_Ub4MjGDKuncmEOV2MHTt2VvpR_GMyuzYik4zXsg1Hc', '2024-05-10 02:57:48.363199');
INSERT INTO `django_session` VALUES ('uh240oti72ocjmvvlsubcpnn5gm22yuf', '.eJxVjMsOwiAQRf-FtSFSHqUu3fsNZIYBW20h6WNl_HchIVG359x7XszBsY_u2MLqJmIXJtjplyH4Z0hV0APSPXOf075OyOuEN7vxW6YwX9v2LzDCNpZ3r2KQBi0SagWayICSVsTeejkUOhg5aNPB2WulY9cJlBBJoLBB217aEq25BEsoNaBlSg25Nc9f9v4AaCBE0Q:1s5K9R:g2F28POmtYVAPeT_BI6kA9W_i-9Ei7Co46wieVH5D_k', '2024-05-24 06:54:41.582469');
INSERT INTO `django_session` VALUES ('zrkqr1zcwk0e24keeku3z9h5v07h5mmt', '.eJxVjMsOwiAQRf-FtSFSHqUu3fsNZIYBW20h6WNl_HchIVG359x7XszBsY_u2MLqJmIXJtjplyH4Z0hV0APSPXOf075OyOuEN7vxW6YwX9v2LzDCNpZ3r2KQBi0SagWayICSVsTeejkUOhg5aNPB2WulY9cJlBBJoLBB217aEq25BEsoNaBlSg25Nc9f9v4AaCBE0Q:1sBrBC:3WyRdUvuXqjBAFK0lBYSW-AJWOTVMjLgEK2YluxFt1g', '2024-06-11 07:23:30.958740');
COMMIT;

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `grade_name` varchar(50) NOT NULL,
  `grade_number` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grade_name` (`grade_name`),
  UNIQUE KEY `grade_number` (`grade_number`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of grade
-- ----------------------------
BEGIN;
INSERT INTO `grade` VALUES (6, '1年2班', 'x0102');
INSERT INTO `grade` VALUES (7, '1年3班', 'x0103');
INSERT INTO `grade` VALUES (8, '1年1班', 'x0101');
INSERT INTO `grade` VALUES (9, '1年4班', 'x0104');
INSERT INTO `grade` VALUES (10, '1年5班', 'x0105');
COMMIT;

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `student_number` varchar(20) NOT NULL,
  `student_name` varchar(20) NOT NULL,
  `chinese_score` decimal(5,2) NOT NULL,
  `math_score` decimal(5,2) NOT NULL,
  `english_score` decimal(5,2) NOT NULL,
  `grade_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `score_grade_id_23aa2d3f_fk_grade_id` (`grade_id`),
  CONSTRAINT `score_grade_id_23aa2d3f_fk_grade_id` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of score
-- ----------------------------
BEGIN;
INSERT INTO `score` VALUES (26, '1年级期中考试', 'G610198201612242535', '黄伟', 67.00, 80.00, 70.00, 8);
INSERT INTO `score` VALUES (27, '1年级期中考试', 'G565584201410153486', '张婷婷', 68.00, 81.00, 71.00, 8);
INSERT INTO `score` VALUES (28, '1年级期中考试', 'G652091201210207412', '刘雪梅', 69.00, 82.00, 72.00, 8);
INSERT INTO `score` VALUES (29, '1年级期中考试', 'G623113201306037856', '王娟', 70.00, 83.00, 73.00, 8);
INSERT INTO `score` VALUES (30, '1年级期中考试', 'G597622201501033709', '吴博', 71.00, 84.00, 74.00, 8);
INSERT INTO `score` VALUES (31, '1年级期中考试', 'G655308201110037589', '朱玉', 72.00, 85.00, 75.00, 8);
INSERT INTO `score` VALUES (32, '1年级期中考试', 'G586476201508266228', '张桂香', 73.00, 86.00, 76.00, 8);
INSERT INTO `score` VALUES (33, '1年级期中考试', 'G629116201305062115', '王淑华', 74.00, 87.00, 77.00, 8);
COMMIT;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `student_number` varchar(20) NOT NULL,
  `student_name` varchar(50) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `birthday` date NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `address` longtext NOT NULL,
  `grade_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_number` (`student_number`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `student_grade_id_eaf6ea9d_fk_grade_id` (`grade_id`),
  CONSTRAINT `student_grade_id_eaf6ea9d_fk_grade_id` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`),
  CONSTRAINT `student_user_id_dcc2526f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of student
-- ----------------------------
BEGIN;
INSERT INTO `student` VALUES (48, 'G486190201508054369', '张亮', 'F', '2015-08-05', '14536449111', '内蒙古自治区红梅县清城陈路f座 810872', 6, 8);
INSERT INTO `student` VALUES (51, 'G562717201110265132', '张欣', 'F', '2011-10-26', '13672259986', '黑龙江省晨市长寿陈路P座 536741', 8, 11);
INSERT INTO `student` VALUES (52, 'G610198201612242535', '黄伟', 'F', '2016-12-24', '13393668538', '海南省红霞市清河长沙路Q座 801313', 8, 12);
INSERT INTO `student` VALUES (53, 'G556035201703192974', '钟佳', 'F', '2017-03-19', '14746410949', '海南省南昌市城北董街T座 345005', 8, 13);
INSERT INTO `student` VALUES (54, 'G512635201302199490', '萧红', 'F', '2013-02-19', '13410023713', '广东省金凤县高港谢路Q座 776887', 8, 14);
INSERT INTO `student` VALUES (55, 'G476620201211078926', '戴亮', 'F', '2012-11-07', '13635120596', '山西省拉萨县白云福州路p座 486476', 8, 15);
INSERT INTO `student` VALUES (56, 'G565584201410153486', '张婷婷', 'F', '2014-10-15', '13971481400', '陕西省雪梅市徐汇曾路i座 737916', 8, 16);
INSERT INTO `student` VALUES (57, 'G406752201611237458', '伊娟', 'F', '2016-11-23', '15786033380', '上海市宜都县秀英金街J座 622949', 8, 17);
INSERT INTO `student` VALUES (58, 'G652091201210207412', '刘雪梅', 'F', '2012-10-20', '15505098808', '广西壮族自治区兰州市城东高路s座 681659', 8, 18);
INSERT INTO `student` VALUES (59, 'G636865201412199914', '宋勇', 'F', '2014-12-19', '18711910980', '海南省敏县吉区谭路n座 360145', 8, 19);
INSERT INTO `student` VALUES (60, 'G543259201505062507', '余帅', 'F', '2015-05-06', '15221740594', '山西省萍县南溪马鞍山街r座 251650', 8, 20);
INSERT INTO `student` VALUES (61, 'G480282201410046212', '阮颖', 'F', '2014-10-04', '15555908001', '云南省哈尔滨市山亭昆明街w座 936047', 8, 21);
INSERT INTO `student` VALUES (62, 'G445473201708202345', '李洁', 'F', '2017-08-20', '13986758967', '甘肃省北京市合川太原路C座 152738', 8, 22);
INSERT INTO `student` VALUES (63, 'G623113201306037856', '王娟', 'F', '2013-06-03', '15392969479', '宁夏回族自治区澳门县双滦深圳路o座 594458', 8, 23);
INSERT INTO `student` VALUES (64, 'G597622201501033709', '吴博', 'F', '2015-01-03', '15893601415', '河北省艳县徐汇北镇路b座 324654', 8, 24);
INSERT INTO `student` VALUES (65, 'G655308201110037589', '朱玉', 'F', '2011-10-03', '18626593089', '湖南省淑英县牧野郭路W座 969796', 8, 25);
COMMIT;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `teacher_name` varchar(50) NOT NULL,
  `phone_number` varchar(11) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `birthday` date NOT NULL,
  `grade_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_number` (`phone_number`),
  UNIQUE KEY `grade_id` (`grade_id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `teacher_grade_id_90d71031_fk_grade_id` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`),
  CONSTRAINT `teacher_user_id_e6b0eb7c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of teacher
-- ----------------------------
BEGIN;
INSERT INTO `teacher` VALUES (2, '张三', '13312345678', 'M', '2020-05-01', 8, 29);
INSERT INTO `teacher` VALUES (3, '李四', '13512345678', 'M', '2020-05-01', 6, 30);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
