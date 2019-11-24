/*
 Navicat Premium Data Transfer

 Source Server         : 胡杰
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 49.234.217.183:3306
 Source Schema         : cms

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 22/11/2019 12:46:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base_privilege
-- ----------------------------
DROP TABLE IF EXISTS `base_privilege`;
CREATE TABLE `base_privilege` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_privilege_privilege` (`parent_id`),
  CONSTRAINT `fk_privilege_privilege` FOREIGN KEY (`parent_id`) REFERENCES `base_privilege` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_privilege
-- ----------------------------
BEGIN;
INSERT INTO `base_privilege` VALUES (1, '栏目管理', '', '/category/*', 'menu', '', NULL);
INSERT INTO `base_privilege` VALUES (2, '文章管理', '', '/article/*', 'menu', '', NULL);
INSERT INTO `base_privilege` VALUES (3, '栏目添加', NULL, '/category/saveOrUpdate', 'method', NULL, 1);
INSERT INTO `base_privilege` VALUES (4, '栏目列表', NULL, '/category/findAll', 'method', NULL, 1);
INSERT INTO `base_privilege` VALUES (5, '用户管理', NULL, '/user/*', 'menu', NULL, NULL);
INSERT INTO `base_privilege` VALUES (6, '用户添加或修改', '', '/baseUser/saveOrUpdate', 'menu', '', 5);
INSERT INTO `base_privilege` VALUES (7, '文章查询', '', '/article/findAll', 'method', '', 2);
INSERT INTO `base_privilege` VALUES (8, '通过id删除', NULL, '/category/deleteById', 'method', NULL, 1);
INSERT INTO `base_privilege` VALUES (9, '批量删除', NULL, '/category/batchDelete', 'method', NULL, 1);
INSERT INTO `base_privilege` VALUES (10, '级联查询文章', NULL, '/article/cascadeFindAll', 'method', NULL, 2);
INSERT INTO `base_privilege` VALUES (11, '通过id查询文章', NULL, '/article/findById', 'method', NULL, 2);
INSERT INTO `base_privilege` VALUES (12, '保存或更新', NULL, '/article/saveOrUpdate', 'method', NULL, 2);
INSERT INTO `base_privilege` VALUES (13, '通过token查询用户信息', NULL, '/user/info', 'method', NULL, 5);
INSERT INTO `base_privilege` VALUES (14, '查询用户级联角色', NULL, '/baseUser/cascadeRoleFindAll', 'method', NULL, 5);
INSERT INTO `base_privilege` VALUES (15, '通过id删除', NULL, '/baseUser/deleteById', 'method', NULL, 5);
INSERT INTO `base_privilege` VALUES (16, '查询所有', NULL, '/baseUser/findAll', 'method', NULL, 5);
INSERT INTO `base_privilege` VALUES (17, '设置角色', NULL, '/baseUser/setRoles', 'method', NULL, 5);
INSERT INTO `base_privilege` VALUES (18, '权限管理', NULL, '/privilege/*', 'menu', NULL, NULL);
INSERT INTO `base_privilege` VALUES (19, '查询所有', NULL, '/privilege/findAll', 'method', NULL, 18);
INSERT INTO `base_privilege` VALUES (20, '通过parentID查询权限', NULL, '/privilege/findByParentId', 'method', NULL, 18);
INSERT INTO `base_privilege` VALUES (21, '查询权限树', NULL, '/privilege/findPrivilegeTree', 'method', NULL, 18);
INSERT INTO `base_privilege` VALUES (22, '保存或更新', NULL, '/privilege/saveOrUpdate', 'method', NULL, 18);
INSERT INTO `base_privilege` VALUES (23, '角色管理', NULL, '/role/*', 'menu', NULL, NULL);
INSERT INTO `base_privilege` VALUES (24, '授权', NULL, '/role/authorization', 'method', NULL, 23);
INSERT INTO `base_privilege` VALUES (25, '级联权限查询', NULL, '/role/cascadePrivilegeFindAll', 'method', NULL, 23);
INSERT INTO `base_privilege` VALUES (26, '通过id删除', NULL, '/role/deleteById', 'method', NULL, 23);
INSERT INTO `base_privilege` VALUES (27, '查询所有', NULL, '/role/findAll', 'method', NULL, 23);
INSERT INTO `base_privilege` VALUES (28, '保存或更新', NULL, '/role/saveOrUpdate', 'method', NULL, 23);
INSERT INTO `base_privilege` VALUES (29, '文章导出', NULL, '/article/download', 'method', NULL, 2);
INSERT INTO `base_privilege` VALUES (35, '附件管理', NULL, '/file/*', 'menu', NULL, NULL);
INSERT INTO `base_privilege` VALUES (36, '附件上传', NULL, '/file/upload', 'method', NULL, 35);
COMMIT;

-- ----------------------------
-- Table structure for base_role
-- ----------------------------
DROP TABLE IF EXISTS `base_role`;
CREATE TABLE `base_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_role
-- ----------------------------
BEGIN;
INSERT INTO `base_role` VALUES (1, 'editor');
INSERT INTO `base_role` VALUES (2, 'admin');
INSERT INTO `base_role` VALUES (3, 'teacher');
COMMIT;

-- ----------------------------
-- Table structure for base_role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `base_role_privilege`;
CREATE TABLE `base_role_privilege` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `privilege_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role_privilege_role` (`role_id`),
  KEY `fk_role_privilege_privilege` (`privilege_id`),
  CONSTRAINT `fk_role_privilege_privilege` FOREIGN KEY (`privilege_id`) REFERENCES `base_privilege` (`id`),
  CONSTRAINT `fk_role_privilege_role` FOREIGN KEY (`role_id`) REFERENCES `base_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_role_privilege
-- ----------------------------
BEGIN;
INSERT INTO `base_role_privilege` VALUES (4, 1, 3);
INSERT INTO `base_role_privilege` VALUES (5, 1, 4);
INSERT INTO `base_role_privilege` VALUES (8, 1, 7);
INSERT INTO `base_role_privilege` VALUES (9, 3, 7);
INSERT INTO `base_role_privilege` VALUES (10, 2, 3);
INSERT INTO `base_role_privilege` VALUES (11, 2, 4);
INSERT INTO `base_role_privilege` VALUES (12, 2, 8);
INSERT INTO `base_role_privilege` VALUES (13, 2, 9);
INSERT INTO `base_role_privilege` VALUES (14, 2, 7);
INSERT INTO `base_role_privilege` VALUES (15, 2, 10);
INSERT INTO `base_role_privilege` VALUES (16, 2, 11);
INSERT INTO `base_role_privilege` VALUES (17, 2, 12);
INSERT INTO `base_role_privilege` VALUES (18, 2, 6);
INSERT INTO `base_role_privilege` VALUES (19, 2, 13);
INSERT INTO `base_role_privilege` VALUES (20, 2, 14);
INSERT INTO `base_role_privilege` VALUES (21, 2, 15);
INSERT INTO `base_role_privilege` VALUES (22, 2, 16);
INSERT INTO `base_role_privilege` VALUES (23, 2, 17);
INSERT INTO `base_role_privilege` VALUES (24, 2, 19);
INSERT INTO `base_role_privilege` VALUES (25, 2, 20);
INSERT INTO `base_role_privilege` VALUES (26, 2, 21);
INSERT INTO `base_role_privilege` VALUES (27, 2, 22);
INSERT INTO `base_role_privilege` VALUES (28, 2, 24);
INSERT INTO `base_role_privilege` VALUES (29, 2, 25);
INSERT INTO `base_role_privilege` VALUES (30, 2, 26);
INSERT INTO `base_role_privilege` VALUES (31, 2, 27);
INSERT INTO `base_role_privilege` VALUES (32, 2, 28);
INSERT INTO `base_role_privilege` VALUES (33, 1, 8);
INSERT INTO `base_role_privilege` VALUES (34, 1, 9);
INSERT INTO `base_role_privilege` VALUES (35, 1, 10);
INSERT INTO `base_role_privilege` VALUES (36, 1, 11);
INSERT INTO `base_role_privilege` VALUES (37, 1, 12);
INSERT INTO `base_role_privilege` VALUES (38, 1, 13);
INSERT INTO `base_role_privilege` VALUES (39, 2, 29);
INSERT INTO `base_role_privilege` VALUES (40, 1, 29);
INSERT INTO `base_role_privilege` VALUES (41, 2, 36);
COMMIT;

-- ----------------------------
-- Table structure for base_user
-- ----------------------------
DROP TABLE IF EXISTS `base_user`;
CREATE TABLE `base_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `birth` bigint(255) DEFAULT NULL,
  `register_time` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_face` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_user
-- ----------------------------
BEGIN;
INSERT INTO `base_user` VALUES (1, 'larry', '123321', '18812344321', '莱瑞', 'female', 1572883200000, NULL, '', 'http://134.175.154.93:8888/group1/M00/00/1F/rBAACV3ORSiAL_PJAAE66PqFd5A920.png');
INSERT INTO `base_user` VALUES (2, 'terry', '123321', '18867541234', '泰瑞', 'female', NULL, NULL, '', 'http://134.175.154.93:8888/group1/M00/00/1F/rBAACV3ORSiAL_PJAAE66PqFd5A920.png');
INSERT INTO `base_user` VALUES (3, 'jacky', '123321', '18812344325', '杰克', 'female', NULL, 1573892938430, '正常', 'http://134.175.154.93:8888/group1/M00/00/1F/rBAACV3ORSiAL_PJAAE66PqFd5A920.png');
INSERT INTO `base_user` VALUES (4, 'test01', '123321', '18812344321', '测试01', 'male', 1574784000000, 1573994760850, '正常', 'http://134.175.154.93:8888/group1/M00/00/1F/rBAACV3ORSiAL_PJAAE66PqFd5A920.png');
INSERT INTO `base_user` VALUES (5, 'admin', '111111', '18812344321', '超级管理员', 'male', NULL, 1574155005310, '正常', 'http://134.175.154.93:8888/group1/M00/00/20/rBAACV3SWCmADYOQAABJRZlrGTM789.jpg');
COMMIT;

-- ----------------------------
-- Table structure for base_user_role
-- ----------------------------
DROP TABLE IF EXISTS `base_user_role`;
CREATE TABLE `base_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role_user` (`user_id`),
  KEY `fk_user_role_role` (`role_id`),
  CONSTRAINT `fk_user_role_role` FOREIGN KEY (`role_id`) REFERENCES `base_role` (`id`),
  CONSTRAINT `fk_user_role_user` FOREIGN KEY (`user_id`) REFERENCES `base_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_user_role
-- ----------------------------
BEGIN;
INSERT INTO `base_user_role` VALUES (7, 2, 1);
INSERT INTO `base_user_role` VALUES (8, 4, 1);
INSERT INTO `base_user_role` VALUES (9, 4, 2);
INSERT INTO `base_user_role` VALUES (11, 5, 2);
INSERT INTO `base_user_role` VALUES (12, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `source` text,
  `publish_time` bigint(20) DEFAULT NULL,
  `read_times` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `thump_up` bigint(255) DEFAULT NULL,
  `thump_down` bigint(255) DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_category` (`category_id`),
  KEY `fk_article_user` (`author_id`),
  CONSTRAINT `fk_article_category` FOREIGN KEY (`category_id`) REFERENCES `cms_category` (`id`),
  CONSTRAINT `fk_article_user` FOREIGN KEY (`author_id`) REFERENCES `base_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_article
-- ----------------------------
BEGIN;
INSERT INTO `cms_article` VALUES (1, 'springboot的应用技术', 'test...sss', '', NULL, NULL, NULL, NULL, NULL, 1, 3);
INSERT INTO `cms_article` VALUES (2, 'springmvc的注解使用', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3);
INSERT INTO `cms_article` VALUES (11, 'test03', 'this is test03', '<h1>this is test03</h1>', 1573611999314, 0, '未审核', 0, 0, 1, 3);
INSERT INTO `cms_article` VALUES (12, 'test04', 'hello world', NULL, 1573619939569, 0, '未审核', 0, 0, NULL, 3);
COMMIT;

-- ----------------------------
-- Table structure for cms_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_category`;
CREATE TABLE `cms_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `no` int(11) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_category` (`parent_id`),
  CONSTRAINT `fk_category_category` FOREIGN KEY (`parent_id`) REFERENCES `cms_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_category
-- ----------------------------
BEGIN;
INSERT INTO `cms_category` VALUES (3, 'IT', '计算机编程', 1, NULL);
INSERT INTO `cms_category` VALUES (4, '娱乐', '八卦', 2, NULL);
INSERT INTO `cms_category` VALUES (5, '国际', '国际资讯', 3, NULL);
COMMIT;

-- ----------------------------
-- Table structure for cms_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_comment`;
CREATE TABLE `cms_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text,
  `comment_time` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `article_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_user` (`user_id`),
  KEY `fk_comment_article` (`article_id`),
  KEY `fk_comment_comment` (`parent_id`),
  CONSTRAINT `fk_comment_article` FOREIGN KEY (`article_id`) REFERENCES `cms_article` (`id`),
  CONSTRAINT `fk_comment_comment` FOREIGN KEY (`parent_id`) REFERENCES `cms_comment` (`id`),
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `base_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_comment
-- ----------------------------
BEGIN;
INSERT INTO `cms_comment` VALUES (1, '作者厉害', NULL, NULL, NULL, 1, NULL);
INSERT INTO `cms_comment` VALUES (2, '作者牛皮', NULL, NULL, NULL, 1, NULL);
INSERT INTO `cms_comment` VALUES (3, 'springmvc到底怎么用？', NULL, NULL, NULL, 2, NULL);
COMMIT;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
BEGIN;
INSERT INTO `test` VALUES (1, 'terry', 12);
INSERT INTO `test` VALUES (2, 'larry', 13);
INSERT INTO `test` VALUES (3, '李四', 123321);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
