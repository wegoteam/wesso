/*
 Navicat Premium Data Transfer

 Source Server         : localhost-mysql
 Source Server Type    : MySQL
 Source Server Version : 50740
 Source Host           : localhost:3306
 Source Schema         : wesso

 Target Server Type    : MySQL
 Target Server Version : 50740
 File Encoding         : 65001

 Date: 11/07/2023 19:53:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sso_application
-- ----------------------------
DROP TABLE IF EXISTS `sso_application`;
CREATE TABLE `sso_application` (
                                   `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
                                   `app_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '系统名称',
                                   `app_instance_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '系统唯一id',
                                   `app_owner` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '系统所有者',
                                   `status` smallint(6) NOT NULL COMMENT '状态',
                                   `create_time` bigint(20) NOT NULL COMMENT '创建时间',
                                   `create_user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '创建人',
                                   `last_update_time` bigint(20) DEFAULT NULL COMMENT '最近更新时间',
                                   `last_update_user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '最近更新人',
                                   `app_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '系统编码',
                                   `app_owner_email` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '系统所有者邮箱',
                                   `app_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
                                   `app_type` smallint(6) NOT NULL COMMENT '类型',
                                   PRIMARY KEY (`id`),
                                   UNIQUE KEY `app_code` (`app_code`),
                                   UNIQUE KEY `app_instance_id` (`app_instance_id`),
                                   KEY `idx_res_application` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sso_application
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sso_application_auth_ref
-- ----------------------------
DROP TABLE IF EXISTS `sso_application_auth_ref`;
CREATE TABLE `sso_application_auth_ref` (
                                            `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
                                            `create_time` bigint(20) NOT NULL,
                                            `create_user_id` varchar(32) NOT NULL,
                                            `last_update_time` bigint(20) DEFAULT NULL,
                                            `last_update_user_id` varchar(32) DEFAULT NULL,
                                            `application_id` varchar(32) NOT NULL,
                                            `auth_app_id` varchar(32) NOT NULL,
                                            `status` int(11) NOT NULL,
                                            PRIMARY KEY (`id`),
                                            UNIQUE KEY `idx_res_app_auth` (`application_id`,`auth_app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sso_application_auth_ref
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sso_application_logs
-- ----------------------------
DROP TABLE IF EXISTS `sso_application_logs`;
CREATE TABLE `sso_application_logs` (
                                        `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
                                        `create_time` bigint(20) NOT NULL,
                                        `create_user_id` varchar(32) NOT NULL,
                                        `last_update_time` bigint(20) DEFAULT NULL,
                                        `last_update_user_id` varchar(32) DEFAULT NULL,
                                        `application_id` varchar(32) NOT NULL,
                                        `auth_app_ids` longtext,
                                        `opt_type` varchar(6) DEFAULT NULL,
                                        `status` int(11) NOT NULL,
                                        PRIMARY KEY (`id`),
                                        KEY `idx_res_app_logs` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sso_application_logs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sso_application_provide
-- ----------------------------
DROP TABLE IF EXISTS `sso_application_provide`;
CREATE TABLE `sso_application_provide` (
                                           `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
                                           `create_time` bigint(20) NOT NULL,
                                           `create_user_id` varchar(32) NOT NULL,
                                           `last_update_time` bigint(20) DEFAULT NULL,
                                           `last_update_user_id` varchar(32) DEFAULT NULL,
                                           `application_id` varchar(32) NOT NULL,
                                           `service_code` varchar(32) NOT NULL,
                                           `icon` varchar(64) DEFAULT NULL,
                                           `open` smallint(6) DEFAULT NULL,
                                           `remark` varchar(255) DEFAULT NULL,
                                           `service_name` varchar(127) DEFAULT NULL,
                                           `service_path` varchar(255) DEFAULT NULL,
                                           `status` smallint(6) NOT NULL,
                                           PRIMARY KEY (`id`),
                                           KEY `idx_res_app_privide` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sso_application_provide
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sso_application_service
-- ----------------------------
DROP TABLE IF EXISTS `sso_application_service`;
CREATE TABLE `sso_application_service` (
                                           `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
                                           `create_time` bigint(20) NOT NULL,
                                           `create_user_id` varchar(32) NOT NULL,
                                           `last_update_time` bigint(20) DEFAULT NULL,
                                           `last_update_user_id` varchar(32) DEFAULT NULL,
                                           `application_id` varchar(32) NOT NULL,
                                           `service_name` varchar(255) NOT NULL,
                                           `service_code` varchar(32) NOT NULL,
                                           `remark` varchar(255) DEFAULT NULL,
                                           `status` smallint(6) NOT NULL,
                                           PRIMARY KEY (`id`),
                                           UNIQUE KEY `service_code` (`service_code`),
                                           KEY `idx_res_app_service` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sso_application_service
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sso_auth_resource_ref
-- ----------------------------
DROP TABLE IF EXISTS `sso_auth_resource_ref`;
CREATE TABLE `sso_auth_resource_ref` (
                                         `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
                                         `authorization_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '权限id',
                                         `resource_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '资源id',
                                         `type` smallint(6) NOT NULL COMMENT '0：数据权限项，1：资源',
                                         `status` smallint(6) NOT NULL COMMENT '0：有效，1：超级管理员或父级置为失效，2：权限拥有者置为失效',
                                         `create_time` bigint(20) NOT NULL COMMENT '创建时间',
                                         `create_user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '创建用户',
                                         `last_update_time` bigint(20) DEFAULT NULL COMMENT '上次修改时间',
                                         `last_update_user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '上次修改用户',
                                         `application_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '应用id',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `idx_res_auth_res` (`authorization_id`,`resource_id`,`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sso_auth_resource_ref
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sso_authorization
-- ----------------------------
DROP TABLE IF EXISTS `sso_authorization`;
CREATE TABLE `sso_authorization` (
                                     `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
                                     `name` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
                                     `parent_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '父id',
                                     `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
                                     `status` smallint(6) NOT NULL COMMENT '状态',
                                     `cust_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
                                     `create_time` bigint(20) NOT NULL COMMENT '创建时间',
                                     `create_user_id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '创建用户',
                                     `last_update_time` bigint(20) DEFAULT NULL COMMENT '上次修改时间',
                                     `last_update_user_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '上次修改用户',
                                     `application_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '应用id',
                                     `code` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT 'code',
                                     `order_by` smallint(6) DEFAULT NULL COMMENT '排序字段',
                                     PRIMARY KEY (`id`),
                                     UNIQUE KEY `code` (`code`),
                                     KEY `idx_res_authorization` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sso_authorization
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sso_enterprise
-- ----------------------------
DROP TABLE IF EXISTS `sso_enterprise`;
CREATE TABLE `sso_enterprise` (
                                  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
                                  `create_time` bigint(20) NOT NULL,
                                  `create_user_id` varchar(32) NOT NULL,
                                  `last_update_time` bigint(20) DEFAULT NULL,
                                  `last_update_user_id` varchar(32) DEFAULT NULL,
                                  `employees_num` varchar(32) DEFAULT NULL,
                                  `enter_address` varchar(64) DEFAULT NULL,
                                  `enter_contacts` varchar(32) DEFAULT NULL,
                                  `enter_name` varchar(64) DEFAULT NULL,
                                  `enter_trade` varchar(32) DEFAULT NULL,
                                  `enter_license` varchar(32) DEFAULT NULL,
                                  PRIMARY KEY (`id`),
                                  KEY `idx_res_enterprise` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sso_enterprise
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sso_group
-- ----------------------------
DROP TABLE IF EXISTS `sso_group`;
CREATE TABLE `sso_group` (
                             `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
                             `cust_id` varchar(32) DEFAULT NULL,
                             `create_time` bigint(20) NOT NULL,
                             `create_user_id` varchar(32) NOT NULL,
                             `last_update_time` bigint(20) DEFAULT NULL,
                             `last_update_user_id` varchar(32) DEFAULT NULL,
                             `application_id` varchar(32) DEFAULT NULL,
                             `code` varchar(64) NOT NULL,
                             `name` varchar(255) DEFAULT NULL,
                             `remark` varchar(255) DEFAULT NULL,
                             `status` smallint(6) NOT NULL,
                             PRIMARY KEY (`id`),
                             UNIQUE KEY `code` (`code`),
                             KEY `idx_res_group` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sso_group
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sso_group_role_ref
-- ----------------------------
DROP TABLE IF EXISTS `sso_group_role_ref`;
CREATE TABLE `sso_group_role_ref` (
                                      `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
                                      `create_time` bigint(20) NOT NULL,
                                      `create_user_id` varchar(32) NOT NULL,
                                      `last_update_time` bigint(20) DEFAULT NULL,
                                      `last_update_user_id` varchar(32) DEFAULT NULL,
                                      `application_id` varchar(32) DEFAULT NULL,
                                      `group_id` varchar(32) NOT NULL,
                                      `role_id` varchar(32) NOT NULL,
                                      PRIMARY KEY (`id`),
                                      UNIQUE KEY `idx_res_group_role` (`group_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sso_group_role_ref
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sso_group_user_ref
-- ----------------------------
DROP TABLE IF EXISTS `sso_group_user_ref`;
CREATE TABLE `sso_group_user_ref` (
                                      `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
                                      `create_time` bigint(20) NOT NULL,
                                      `create_user_id` varchar(32) NOT NULL,
                                      `last_update_time` bigint(20) DEFAULT NULL,
                                      `last_update_user_id` varchar(32) DEFAULT NULL,
                                      `application_id` varchar(32) DEFAULT NULL,
                                      `group_id` varchar(32) NOT NULL,
                                      `user_id` varchar(32) NOT NULL,
                                      PRIMARY KEY (`id`),
                                      UNIQUE KEY `idx_res_group_user` (`group_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sso_group_user_ref
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sso_organization
-- ----------------------------
DROP TABLE IF EXISTS `sso_organization`;
CREATE TABLE `sso_organization` (
                                    `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
                                    `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '机构名称',
                                    `parent_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '父id',
                                    `create_time` bigint(20) NOT NULL COMMENT '创建时间',
                                    `create_user_id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '创建用户',
                                    `last_update_time` bigint(20) DEFAULT NULL COMMENT '上次修改时间',
                                    `last_update_user_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '上次修改用户',
                                    `address` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地址',
                                    `application_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '应用id',
                                    `code` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT 'code',
                                    `cust_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
                                    `fax` varchar(24) COLLATE utf8mb4_bin DEFAULT NULL,
                                    `link_man_dept` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系人部门',
                                    `link_man_email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系人邮箱',
                                    `link_man_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系人名称',
                                    `link_man_pos` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
                                    `link_man_tel` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系人手机号',
                                    `rank` smallint(6) DEFAULT '0' COMMENT '等级',
                                    `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
                                    `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态',
                                    `telephone` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
                                    `type` smallint(6) NOT NULL DEFAULT '0' COMMENT '0：经营单位；1：机构/部门',
                                    `zip_code` varchar(16) COLLATE utf8mb4_bin DEFAULT NULL,
                                    `path` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL,
                                    `organization_number` varchar(6) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '机构编号',
                                    `admin_user_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '管理员id',
                                    `area` smallint(6) NOT NULL COMMENT '区域（0：区域，1：非区域）',
                                    `order_by` smallint(6) DEFAULT NULL COMMENT '排序字段',
                                    PRIMARY KEY (`id`),
                                    UNIQUE KEY `code` (`code`),
                                    KEY `idx_res_organization` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sso_organization
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sso_resource
-- ----------------------------
DROP TABLE IF EXISTS `sso_resource`;
CREATE TABLE `sso_resource` (
                                `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
                                `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '资源名称',
                                `parent_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '父id',
                                `status` smallint(6) NOT NULL COMMENT '状态',
                                `create_time` bigint(20) NOT NULL COMMENT '创建时间',
                                `create_user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '创建用户id',
                                `last_update_time` bigint(20) DEFAULT NULL COMMENT '上次修改时间',
                                `last_update_user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '上次修改用户',
                                `application_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '应用id',
                                `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'code',
                                `order_by` smallint(6) DEFAULT NULL COMMENT '排序',
                                `picture_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图标',
                                `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
                                `type` smallint(6) NOT NULL COMMENT '类型',
                                `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '路由',
                                `show_status` smallint(6) DEFAULT NULL COMMENT '显示状态，0：显示，1：不显示',
                                `have_menu` smallint(6) DEFAULT NULL COMMENT '是否拥有，0：非拥有，1：拥有',
                                PRIMARY KEY (`id`),
                                UNIQUE KEY `code` (`code`),
                                KEY `idx_res_resource` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sso_resource
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sso_role
-- ----------------------------
DROP TABLE IF EXISTS `sso_role`;
CREATE TABLE `sso_role` (
                            `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
                            `parent_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '父id',
                            `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色名称',
                            `cust_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
                            `application_id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '应用id',
                            `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
                            `create_time` bigint(20) NOT NULL COMMENT '创建时间',
                            `code` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT 'code',
                            `create_user_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建用户',
                            `last_update_time` bigint(20) DEFAULT NULL COMMENT '上次修改时间',
                            `last_update_user_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '上次修改用户',
                            `status` smallint(6) NOT NULL COMMENT '角色状态',
                            `order_by` smallint(6) DEFAULT NULL COMMENT '排序字段',
                            `type` smallint(6) NOT NULL COMMENT '0：功能角色，1：数据角色',
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `code` (`code`),
                            KEY `idx_res_role` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sso_role
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sso_role_authorization_ref
-- ----------------------------
DROP TABLE IF EXISTS `sso_role_authorization_ref`;
CREATE TABLE `sso_role_authorization_ref` (
                                              `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
                                              `create_time` bigint(20) NOT NULL,
                                              `create_user_id` varchar(32) NOT NULL,
                                              `last_update_time` bigint(20) DEFAULT NULL,
                                              `last_update_user_id` varchar(32) DEFAULT NULL,
                                              `application_id` varchar(32) DEFAULT NULL,
                                              `authorization_id` varchar(32) NOT NULL,
                                              `role_id` varchar(32) NOT NULL,
                                              `status` smallint(6) NOT NULL COMMENT '0：有效，1：超级管理员或父级置为失效，2：权限拥有者置为失效',
                                              PRIMARY KEY (`id`),
                                              UNIQUE KEY `idx_res_role_auth` (`role_id`,`authorization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sso_role_authorization_ref
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sso_role_resource_ref
-- ----------------------------
DROP TABLE IF EXISTS `sso_role_resource_ref`;
CREATE TABLE `sso_role_resource_ref` (
                                         `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
                                         `create_time` bigint(20) NOT NULL COMMENT '创建时间',
                                         `create_user_id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '创建用户',
                                         `last_update_time` bigint(20) DEFAULT NULL COMMENT '上次修改时间',
                                         `last_update_user_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '上次修改用户',
                                         `application_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '应用id',
                                         `role_id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
                                         `resource_id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '资源id',
                                         `status` smallint(6) NOT NULL COMMENT '0：有效，1：超级管理员或父级置为失效，2：权限拥有者置为失效',
                                         `type` smallint(6) NOT NULL COMMENT '0：数据权限项，1：资源',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `idx_res_auth_res` (`role_id`,`resource_id`,`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sso_role_resource_ref
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sso_user
-- ----------------------------
DROP TABLE IF EXISTS `sso_user`;
CREATE TABLE `sso_user` (
                            `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
                            `create_time` bigint(20) NOT NULL COMMENT '创建时间',
                            `create_user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '创建用户',
                            `platfrom_userid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
                            `last_update_time` bigint(20) DEFAULT NULL COMMENT '上次修改时间',
                            `last_update_user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '上次修改用户',
                            `company_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
                            `organization_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
                            `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户名',
                            `user_type` smallint(6) NOT NULL COMMENT '用户类型',
                            `node_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
                            `sex` smallint(6) DEFAULT NULL COMMENT '性别',
                            `birthday` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '生日',
                            `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮箱',
                            `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '位置',
                            `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
                            `tel_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '手机号',
                            `user_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
                            `user_level` smallint(6) DEFAULT NULL,
                            `face_url` mediumblob COMMENT '头像',
                            `plat_person_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '工号',
                            `sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
                            `brief_introd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `user_code` (`user_code`),
                            UNIQUE KEY `platfrom_userid` (`platfrom_userid`),
                            UNIQUE KEY `tel_phone_uk` (`tel_phone`) USING BTREE,
                            KEY `idx_res_user` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sso_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sso_user_account
-- ----------------------------
DROP TABLE IF EXISTS `sso_user_account`;
CREATE TABLE `sso_user_account` (
                                    `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
                                    `account_expired` bigint(20) DEFAULT NULL,
                                    `account_locked` smallint(6) NOT NULL,
                                    `create_time` bigint(20) NOT NULL COMMENT '创建时间',
                                    `credential` varchar(512) DEFAULT NULL,
                                    `credential_expired` bigint(20) DEFAULT NULL,
                                    `identifier` varchar(32) NOT NULL COMMENT '账号',
                                    `identity_type` smallint(6) NOT NULL COMMENT '账号类型 1:username,2:email,3:phone,4:wechat,5:qq',
                                    `last_login_ip` varchar(15) DEFAULT NULL COMMENT '上次登录ip',
                                    `last_login_time` varchar(32) DEFAULT NULL COMMENT '上次登录时间',
                                    `last_update_time` bigint(20) DEFAULT NULL COMMENT '上次修改时间',
                                    `login_mode` smallint(6) NOT NULL,
                                    `status` smallint(6) NOT NULL COMMENT '用户状态',
                                    `user_id` varchar(32) NOT NULL COMMENT '用户id',
                                    `credential_update_time` bigint(20) DEFAULT NULL COMMENT '上次密码修改时间',
                                    `first_pwd_error_time` bigint(20) DEFAULT NULL COMMENT '第一次密码错误时间',
                                    `login_pwd_error_time` smallint(6) DEFAULT NULL COMMENT '登录密码错误的次数',
                                    PRIMARY KEY (`id`),
                                    UNIQUE KEY `identifier` (`identifier`),
                                    KEY `idx_res_account` (`last_update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sso_user_account
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sso_user_role_ref
-- ----------------------------
DROP TABLE IF EXISTS `sso_user_role_ref`;
CREATE TABLE `sso_user_role_ref` (
                                     `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
                                     `application_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
                                     `create_time` bigint(20) NOT NULL COMMENT '创建时间',
                                     `create_user_id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '创建用户',
                                     `last_update_time` bigint(20) DEFAULT NULL COMMENT '上次修改时间',
                                     `last_update_user_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '上次修改用户',
                                     `role_id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '角色id',
                                     `user_id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '用户id',
                                     `type` smallint(6) NOT NULL COMMENT '0：功能角色，1：数据角色',
                                     PRIMARY KEY (`id`),
                                     UNIQUE KEY `idx_res_user_role` (`user_id`,`role_id`,`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sso_user_role_ref
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
