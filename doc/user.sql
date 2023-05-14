/*
 Source Schema         : course_users
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oauth_access_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_token`;
CREATE TABLE `oauth_access_token`
(
    `token_id`          varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `token`             blob                                                    NULL,
    `authentication_id` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `user_name`         varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `client_id`         varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `authentication`    blob                                                    NULL,
    `refresh_token`     varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`authentication_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_access_token
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_approvals
-- ----------------------------
DROP TABLE IF EXISTS `oauth_approvals`;
CREATE TABLE `oauth_approvals`
(
    `userId`         varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL,
    `clientId`       varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL,
    `scope`          varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL,
    `status`         varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL     DEFAULT NULL,
    `expiresAt`      timestamp                                               NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `lastModifiedAt` timestamp                                               NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_approvals
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details`
(
    `client_id`               varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL,
    `resource_ids`            varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL,
    `client_secret`           varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL,
    `scope`                   varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL,
    `authorized_grant_types`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL,
    `web_server_redirect_uri` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL,
    `authorities`             varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL,
    `access_token_validity`   int                                                      NULL DEFAULT NULL,
    `refresh_token_validity`  int                                                      NULL DEFAULT NULL,
    `additional_information`  varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `autoapprove`             varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL,
    PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details`
VALUES ('app', NULL, 'app', 'app', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oauth_client_details`
VALUES ('XcWebApp', NULL, 'XcWebApp', 'app', 'authorization_code,password,refresh_token,client_credentials', NULL, NULL,
        43200, 43200, NULL, NULL);

-- ----------------------------
-- Table structure for oauth_client_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_token`;
CREATE TABLE `oauth_client_token`
(
    `token_id`          varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `token`             blob                                                    NULL,
    `authentication_id` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `user_name`         varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `client_id`         varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`authentication_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_client_token
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_code
-- ----------------------------
DROP TABLE IF EXISTS `oauth_code`;
CREATE TABLE `oauth_code`
(
    `code`           varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `authentication` blob                                                    NULL
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_code
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_token`;
CREATE TABLE `oauth_refresh_token`
(
    `token_id`       varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `token`          blob                                                    NULL,
    `authentication` blob                                                    NULL
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_refresh_token
-- ----------------------------
INSERT INTO `oauth_refresh_token`
VALUES ('b96e057b4e1c4920428e833db48d4c15',
        0xEFBFBDEFBFBD00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FEFBFBD4763EFBFBDEFBFBDC9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73EFBFBD0E0A6354EFBFBD5E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002462303132643438372D613930382D343361662D613865662D3533633533393963386264367372000E6A6176612E7574696C2E44617465686AEFBFBD014B59741903000078707708000001613B74C98E78,
        0xEFBFBDEFBFBD0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EEFBFBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374EFBFBD0F2531EFBFBDEFBFBD100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E194200EFBFBDEFBFBD5EEFBFBD1E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C69737478EFBFBDEFBFBD1DEFBFBDEFBFBD61EFBFBD03000149000473697A65787000000009770400000009737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001EFBFBD0200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000A524F4C455F61646D696E7371007E000D740006617069646F637371007E000D74000C64617461626173652F6C6F677371007E000D74000673797374656D7371007E000D740008757365722F6164647371007E000D74000B757365722F64656C6574657371007E000D740009757365722F656469747371007E000D740009757365722F766965777371007E000D740008757365724C6973747871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0024787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EEFBFBD7169EFBFBD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00224C000573636F706571007E00247870740006776562417070737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170EFBFBDEFBFBD74EFBFBD07420200014C00016D71007E00227870737200116A6176612E7574696C2E486173684D61700507EFBFBDEFBFBDEFBFBD1660EFBFBD03000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A6772616E745F7479706574000870617373776F7264740008757365726E616D6574000561646D696E78737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574EFBFBD1DEFBFBDD18FEFBFBDEFBFBD550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574EFBFBD6CEFBFBD5AEFBFBDEFBFBD2A1E020000787200116A6176612E7574696C2E48617368536574EFBFBD44EFBFBDEFBFBDEFBFBDEFBFBDEFBFBD340300007870770C000000103F4000000000000174000361707078017371007E0033770C000000103F40000000000000787371007E002A3F40000000000000770800000010000000007870707371007E0033770C000000103F40000000000000787371007E0033770C000000103F40000000000000787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001EFBFBD0200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000977040000000971007E000F71007E001171007E001371007E001571007E001771007E001971007E001B71007E001D71007E001F7871007E003D737200176A6176612E7574696C2E4C696E6B6564486173684D617034EFBFBD4E5C106CEFBFBDEFBFBD0200015A000B6163636573734F726465727871007E002A3F400000000000067708000000080000000271007E002C71007E002D71007E002E71007E002F780070737200326F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657200000000000001EFBFBD0200075A00116163636F756E744E6F6E457870697265645A00106163636F756E744E6F6E4C6F636B65645A001563726564656E7469616C734E6F6E457870697265645A0007656E61626C65644C000B617574686F72697469657371007E00244C000870617373776F726471007E000E4C0008757365726E616D6571007E000E7870010101017371007E0030737200116A6176612E7574696C2E54726565536574DD9850EFBFBDEFBFBDEFBFBD5B0300007870737200466F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657224417574686F72697479436F6D70617261746F7200000000000001EFBFBD020000787077040000000971007E000F71007E001171007E001371007E001571007E001771007E001971007E001B71007E001D71007E001F787074000561646D696E);

-- ----------------------------
-- Table structure for xc_company
-- ----------------------------
DROP TABLE IF EXISTS `xc_company`;
CREATE TABLE `xc_company`
(
    `id`          varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `linkname`    varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '联系人名称',
    `name`        varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
    `mobile`      varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `email`       varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `intro`       varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
    `logo`        varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'logo',
    `identitypic` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证照片',
    `worktype`    varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '工具性质',
    `businesspic` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照',
    `status`      varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '企业状态',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xc_company
-- ----------------------------
INSERT INTO `xc_company`
VALUES ('1', '张老师', '传智播客', '13333334444', 'abc@126.com', '2006年创建！', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `xc_company`
VALUES ('1232141425', 'M老师', '传智教育', '123456789', 'mm@qq.com', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `xc_company`
VALUES ('2', '李老师', '博学谷', '', '', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for xc_company_user
-- ----------------------------
DROP TABLE IF EXISTS `xc_company_user`;
CREATE TABLE `xc_company_user`
(
    `id`         varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `company_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `user_id`    varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `xc_company_user_unique` (`company_id`, `user_id`) USING BTREE,
    INDEX `FK_xc_company_user_user_id` (`user_id`) USING BTREE,
    CONSTRAINT `FK_xc_company_user_company_id` FOREIGN KEY (`company_id`) REFERENCES `xc_company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `FK_xc_company_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `xc_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xc_company_user
-- ----------------------------
INSERT INTO `xc_company_user`
VALUES ('1', '1', '49');
INSERT INTO `xc_company_user`
VALUES ('2', '1232141425', '52');

-- ----------------------------
-- Table structure for xc_menu
-- ----------------------------
DROP TABLE IF EXISTS `xc_menu`;
CREATE TABLE `xc_menu`
(
    `id`          varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `code`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单编码',
    `p_id`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父菜单ID',
    `menu_name`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
    `url`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求地址',
    `is_menu`     char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      NULL DEFAULT NULL COMMENT '是否是菜单',
    `level`       int                                                     NULL DEFAULT NULL COMMENT '菜单层级',
    `sort`        int                                                     NULL DEFAULT NULL COMMENT '菜单排序',
    `status`      char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      NULL DEFAULT NULL,
    `icon`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `create_time` datetime                                                NULL DEFAULT NULL,
    `update_time` datetime                                                NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `FK_CODE` (`code`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xc_menu
-- ----------------------------
INSERT INTO `xc_menu`
VALUES ('', 'xc_teachmanager_course_pic', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-28 08:35:25',
        '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('000000000000000000', 'root', '0', '系统根目录', NULL, '0', 0, 1, '1', NULL, '2022-09-28 08:35:25',
        '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('111111111111111111', 'xc_sysmanager', '000000000000000000', '系统管理', NULL, '1', 1, 10, '1', '',
        '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('222222222222222222', 'xc_teachmanager', '000000000000000000', '教学管理', NULL, '1', 1, 2, '1', NULL,
        '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('893288715881807872', 'xc_sysmanager_user', '111111111111111111', '用户管理', NULL, '1', 2, 1, '1', '',
        '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('893304960282787840', 'xc_sysmanager_user_add', '893288715881807872', '添加用户', NULL, '1', 3, 1, '1', '',
        '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('894396523532517376', 'xc_sysmanager_user_edit', '893288715881807872', '用户修改', NULL, '0', 3, 1, '1', '',
        '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('894473486712438784', 'xc_sysmanager_user_view', '893288715881807872', '用户列表', NULL, '1', 3, 2, '1', '',
        '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('894473651837992960', 'xc_sysmanager_user_delete', '893288715881807872', '用户删除', NULL, '0', 3, 4, '1', '',
        '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('894475142061621248', 'xc_sysmanager_role', '111111111111111111', '角色管理', NULL, '1', 2, 2, '1', '',
        '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('894475827880656896', 'xc_sysmanager_role_add', '894475142061621248', '角色添加', NULL, '0', 3, 1, '1', '',
        '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('894475985452269568', 'xc_sysmanager_role_edit', '894475142061621248', '角色编辑', NULL, '0', 3, 2, '1', '',
        '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('894476118730473472', 'xc_sysmanager_role_delete', '894475142061621248', '角色删除', NULL, '0', 3, 2, '1', '',
        '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('894476276402749440', 'xc_sysmanager_role_permission', '894475142061621248', '角色配权', NULL, '0', 3, 3, '1',
        '', '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('894476950951690240', 'xc_sysmanager_menu', '111111111111111111', '菜单管理', NULL, '1', 2, 2, '1', '',
        '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('894477107919323136', 'xc_sysmanager_menu_add', '894476950951690240', '菜单添加', NULL, '0', 3, 1, '1', '',
        '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('894477244926263296', 'xc_sysmanager_menu_edit', '894476950951690240', '菜单编辑', NULL, '0', 3, 2, '1', '',
        '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('894477420512411648', 'xc_sysmanager_menu_delete', '894476950951690240', '菜单删除', NULL, '0', 3, 2, '1', '',
        '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('894477851082883072', 'xc_sysmanager_doc', '111111111111111111', '文档查询', NULL, '1', 2, 9, '1', '',
        '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('894477995903811584', 'xc_sysmanager_log', '111111111111111111', 'add', NULL, '1', 2, 10, '1', '',
        '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('894752734459199488', 'xc_sysmanager_company', '111111111111111111', '机构管理', NULL, '1', 1, 1, '1', '',
        '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('903459378655395840', 'xc_sysmanager_user_resetpwd', '893288715881807872', '密码重置', NULL, '1', 3, 2, '1', '',
        '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('903459378655395841', 'xc_teachmanager_course', '222222222222222222', '课程管理', NULL, '1', 2, 1, '1', NULL,
        '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('903459378655395842', 'xc_teachmanager_course_add', '903459378655395841', '添加课程', NULL, '1', 3, 1, '1',
        NULL, '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('903459378655395843', 'xc_teachmanager_course_del', '903459378655395841', '删除课程', NULL, NULL, NULL, NULL,
        NULL, NULL, '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('903459378655395845', 'xc_teachmanager_course_market', '903459378655395841', '编辑课程营销信息', NULL, NULL,
        NULL, NULL, NULL, NULL, '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('903459378655395846', 'xc_teachmanager_course_base', '903459378655395841', '编辑课程基础信息', NULL, NULL, NULL,
        NULL, NULL, NULL, '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('903459378655395847', 'xc_teachmanager_course_plan', '903459378655395841', '编辑课程计划', NULL, NULL, NULL,
        NULL, NULL, NULL, '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('903459378655395848', 'xc_teachmanager_course_publish', '903459378655395841', '发布课程', NULL, NULL, NULL,
        NULL, NULL, NULL, '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('903459378655395849', 'xc_teachmanager_course_list', '903459378655395841', '我的课程', NULL, NULL, NULL, NULL,
        NULL, NULL, '2022-09-28 08:35:25', '2022-09-28 08:35:25');
INSERT INTO `xc_menu`
VALUES ('903459378655395850', 'course_find_list', '903459378655395841', '查询课程列表', NULL, NULL, NULL, NULL, '1',
        NULL, '2022-09-28 08:35:25', '2022-09-28 08:35:25');

-- ----------------------------
-- Table structure for xc_permission
-- ----------------------------
DROP TABLE IF EXISTS `xc_permission`;
CREATE TABLE `xc_permission`
(
    `id`          varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `role_id`     varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `menu_id`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `create_time` datetime                                                NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `xu_permission_unique` (`role_id`, `menu_id`) USING BTREE,
    INDEX `fk_xc_permission_menu_id` (`menu_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xc_permission
-- ----------------------------
INSERT INTO `xc_permission`
VALUES ('11', '20', '222222222222222222', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('11101', '20', '903459378655395850', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('12', '20', '903459378655395841', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('13', '20', '903459378655395842', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('14', '20', '903459378655395843', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('15', '20', '903459378655395845', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('16', '20', '903459378655395846', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('17', '20', '903459378655395847', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('18', '20', '903459378655395848', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('19', '20', '903459378655395849', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('89328714465778073617', '17', '111111111111111111', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8932871446577807366', '6', '111111111111111111', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8932871446577807367', '6', '903459378655395846', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8932871446577807368', '8', '111111111111111111', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8932887158818078726', '6', '893288715881807872', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8932887158818078728', '8', '893288715881807872', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8933049602827878406', '6', '893304960282787840', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8933049602827878408', '8', '893304960282787840', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8943965235325173766', '6', '894396523532517376', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8943965235325173768', '8', '894396523532517376', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8944734867124387846', '6', '894473486712438784', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8944734867124387848', '8', '894473486712438784', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8944736518379929606', '6', '894473651837992960', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8944736518379929608', '8', '894473651837992960', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8944751420616212488', '8', '894475142061621248', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8944758278806568968', '8', '894475827880656896', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8944759854522695688', '8', '894475985452269568', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8944761187304734728', '8', '894476118730473472', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8944762764027494408', '8', '894476276402749440', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8944769509516902408', '8', '894476950951690240', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8944771079193231368', '8', '894477107919323136', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8944772449262632968', '8', '894477244926263296', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8944774205124116488', '8', '894477420512411648', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('89447785108288307217', '17', '894477851082883072', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8944778510828830726', '6', '894477851082883072', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8944778510828830728', '8', '894477851082883072', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('89447799590381158417', '17', '894477995903811584', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8944779959038115846', '6', '894477995903811584', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8944779959038115848', '8', '894477995903811584', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('89475273445919948817', '17', '894752734459199488', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8947527344591994888', '8', '894752734459199488', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8947692177635409926', '6', '903459378655395842', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('8947692177635409930', '6', '903459378655395841', '2022-09-28 08:34:56');
INSERT INTO `xc_permission`
VALUES ('903459378655395849', '17', '903459378655395849', '2022-09-30 14:29:08');

-- ----------------------------
-- Table structure for xc_role
-- ----------------------------
DROP TABLE IF EXISTS `xc_role`;
CREATE TABLE `xc_role`
(
    `id`          varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `role_name`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `role_code`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `create_time` datetime                                                NULL DEFAULT NULL,
    `update_time` datetime                                                NULL DEFAULT NULL,
    `status`      char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      NOT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unique_role_name` (`role_name`) USING BTREE,
    UNIQUE INDEX `unique_role_value` (`role_code`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xc_role
-- ----------------------------
INSERT INTO `xc_role`
VALUES ('17', '学生', 'student', NULL, '2022-09-28 08:32:57', '2022-09-28 08:32:57', '1');
INSERT INTO `xc_role`
VALUES ('18', '老师', 'teacher', NULL, '2022-09-28 08:32:57', '2022-09-28 08:32:57', '1');
INSERT INTO `xc_role`
VALUES ('20', '教学管理员', 'teachmanager', NULL, '2022-09-28 08:32:57', '2022-09-28 08:32:57', '1');
INSERT INTO `xc_role`
VALUES ('6', '管理员', 'admin', NULL, '2022-09-28 08:32:57', '2022-09-28 08:32:57', '1');
INSERT INTO `xc_role`
VALUES ('8', '超级管理员', 'super', NULL, '2022-09-28 08:32:57', '2022-09-28 08:32:57', '1');

-- ----------------------------
-- Table structure for xc_teacher
-- ----------------------------
DROP TABLE IF EXISTS `xc_teacher`;
CREATE TABLE `xc_teacher`
(
    `id`      varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL,
    `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT '用户id',
    `name`    varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT '称呼',
    `intro`   varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '个人简介',
    `resume`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人简历',
    `pic`     varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '老师照片',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `xu_teacher_user_id` (`user_id`) USING BTREE,
    CONSTRAINT `fk_xc_teacher_user_id` FOREIGN KEY (`user_id`) REFERENCES `xc_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xc_teacher
-- ----------------------------

-- ----------------------------
-- Table structure for xc_user
-- ----------------------------
DROP TABLE IF EXISTS `xc_user`;
CREATE TABLE `xc_user`
(
    `id`          varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `username`    varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `password`    varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL,
    `salt`        varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL,
    `wx_unionid`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信unionid',
    `nickname`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
    `name`        varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `userpic`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
    `company_id`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL,
    `utype`       varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `birthday`    datetime                                                NULL DEFAULT NULL,
    `sex`         char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      NULL DEFAULT NULL,
    `email`       varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL,
    `cellphone`   varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL,
    `qq`          varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL,
    `status`      varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '用户状态',
    `create_time` datetime                                                NOT NULL,
    `update_time` datetime                                                NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `unique_user_username` (`username`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xc_user
-- ----------------------------
INSERT INTO `xc_user`
VALUES ('17b9d8be-cef3-400c-bec5-1478a6ef7ddc', 'o5PB1sytMXJGGv2x5OBP2uMzCpS8', 'o5PB1sytMXJGGv2x5OBP2uMzCpS8', NULL,
        'o5PB1sytMXJGGv2x5OBP2uMzCpS8', 'Mr.M', 'Mr.M',
        'https://thirdwx.qlogo.cn/mmopen/vi_32/P8h3wxWDqCqfI0BmHxAYHEzppsaBp4xt7nscyiaQ2ZptEhzyKcEia7loT6pO6zExaM9FR7BnSguxqKYuIe5B3aEA/132',
        NULL, '101001', NULL, NULL, NULL, NULL, NULL, '1', '2022-09-30 20:08:51', NULL);
INSERT INTO `xc_user`
VALUES ('46', 'super', '$2a$10$TJ4TmCdK.X4wv/tCqHW14.w70U3CC33CeVncD3SLmyMXMknstqKRe', NULL, NULL, NULL, '超级管理员',
        NULL, NULL, '101003', NULL, '1', NULL, NULL, NULL, '1', '2022-09-28 08:32:03', NULL);
INSERT INTO `xc_user`
VALUES ('48', 'admin', '$2a$10$TJ4TmCdK.X4wv/tCqHW14.w70U3CC33CeVncD3SLmyMXMknstqKRe', NULL, NULL, NULL, '系统管理员',
        NULL, NULL, '101003', NULL, '1', NULL, NULL, NULL, '1', '2022-09-28 08:32:03', NULL);
INSERT INTO `xc_user`
VALUES ('49', 'itcast', '$2a$10$TJ4TmCdK.X4wv/tCqHW14.w70U3CC33CeVncD3SLmyMXMknstqKRe', NULL, NULL, NULL, 'test02',
        NULL, NULL, '101002', NULL, '1', '', '12345', NULL, '1', '2022-09-28 08:32:03', NULL);
INSERT INTO `xc_user`
VALUES ('50', 'stu1', '$2a$10$0pt7WlfTbnPDTcWtp/.2Mu5CTXvohnNQhR628qq4RoKSc0dGAdEgm', NULL, NULL, '大水牛', '学生1',
        'http://file.xuecheng-plus.com/dddf', NULL, '101001', '2022-09-28 19:28:46', '1', NULL, NULL, NULL, '1',
        '2022-09-28 08:32:03', NULL);
INSERT INTO `xc_user`
VALUES ('51', 'stu2', '$2a$10$nxPKkYSez7uz2YQYUnwhR.z57km3yqKn3Hr/p1FR6ZKgc18u.Tvqm', NULL, NULL, NULL, '学生2', NULL,
        NULL, '101001', NULL, '1', NULL, NULL, NULL, '1', '2022-09-28 08:32:03', NULL);
INSERT INTO `xc_user`
VALUES ('52', 't1', '$2a$10$0pt7WlfTbnPDTcWtp/.2Mu5CTXvohnNQhR628qq4RoKSc0dGAdEgm', NULL, NULL, NULL, 'M老师', NULL,
        '1232141425', '101002', NULL, '1', NULL, NULL, NULL, '', '2022-09-28 08:32:03', NULL);

-- ----------------------------
-- Table structure for xc_user_role
-- ----------------------------
DROP TABLE IF EXISTS `xc_user_role`;
CREATE TABLE `xc_user_role`
(
    `id`          varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `user_id`     varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL,
    `role_id`     varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL,
    `create_time` datetime                                                NULL DEFAULT NULL,
    `creator`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `fk_xc_user_role_user_id` (`user_id`) USING BTREE,
    INDEX `fk_xc_user_role_role_id` (`role_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xc_user_role
-- ----------------------------
INSERT INTO `xc_user_role`
VALUES ('1', '46', '8', '2017-09-11 13:02:45', '超级管理员');
INSERT INTO `xc_user_role`
VALUES ('19', '50', '6', '2017-09-12 14:20:20', '超级管理员');
INSERT INTO `xc_user_role`
VALUES ('2', '48', '6', '2017-09-11 13:02:56', '超级管理员');
INSERT INTO `xc_user_role`
VALUES ('20', '50', '17', '2017-09-12 14:20:20', '超级管理员');
INSERT INTO `xc_user_role`
VALUES ('2034706c-7d15-43fb-8b0d-bd581c7ace02', 'e63fb882-3226-4365-9711-d3fd467a4813', '17', NULL, NULL);
INSERT INTO `xc_user_role`
VALUES ('21', '52', '20', NULL, NULL);
INSERT INTO `xc_user_role`
VALUES ('3', '49', '20', '2017-09-11 13:03:12', NULL);
INSERT INTO `xc_user_role`
VALUES ('48d759c1-a597-4220-8ddf-91696638d91d', '17b9d8be-cef3-400c-bec5-1478a6ef7ddc', '17', NULL, NULL);
INSERT INTO `xc_user_role`
VALUES ('88f646ec-7257-4987-816e-92adfb68e0c1', 'e47ade0d-377d-4e58-99fc-6d5e2af5c148', '17', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;