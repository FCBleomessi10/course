/*
 Source Schema         : nacos
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`
(
    `id`           bigint                                           NOT NULL AUTO_INCREMENT COMMENT 'id',
    `data_id`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
    `group_id`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL,
    `content`      longtext CHARACTER SET utf8 COLLATE utf8_bin     NOT NULL COMMENT 'content',
    `md5`          varchar(32) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT 'md5',
    `gmt_create`   datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `gmt_modified` datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    `src_user`     text CHARACTER SET utf8 COLLATE utf8_bin         NULL COMMENT 'source user',
    `src_ip`       varchar(50) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT 'source ip',
    `app_name`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL,
    `tenant_id`    varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT '' COMMENT '租户字段',
    `c_desc`       varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL,
    `c_use`        varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `effect`       varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `type`         varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `c_schema`     text CHARACTER SET utf8 COLLATE utf8_bin         NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_configinfo_datagrouptenant` (`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 175
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'config_info'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info`
VALUES (1, 'mp-config.properties', 'xc-group',
        '#驼峰下划线转换\r\nmybatis-plus.global-config.db-column-underline = true\r\n#实体扫描，多个package用逗号或者分号分隔\r\nmybatis-plus.typeAliasesPackage = com.course.*.entity\r\n#字段策略 0:\"忽略判断\",1:\"非 NULL 判断\"),2:\"非空判断\"\r\nmybatis-plus.global-config.field-strategy=2\r\n#全局地开启或关闭配置文件中的所有映射器已经配置的任何缓存，开发时不需要开启。\r\nmybatis-plus.configuration.cache-enabled = false\r\n#映射文件mapper文件存储位置\r\nmybatis-plus.mapper-locations = classpath:com.course.*.mapper/*.xml\r\n#主键类型  0:\"数据库ID自增\", 1:\"用户输入ID\",2:\"全局唯一ID (数字类型唯一ID)\", 3:\"全局唯一ID UUID\";\r\nmybatis-plus.global-config.id-type = 0\r\n#刷新mapper 调试神器\r\nmybatis-plus.global-config.refresh-mapper = true',
        'c4830681643505108185f52cbff96453', '2022-08-31 13:31:52', '2022-08-31 13:31:52', NULL, '192.168.101.1', '',
        '3adc3388-087e-4c90-a373-c5a6484752df', NULL, NULL, NULL, 'properties', NULL);
INSERT INTO `config_info`
VALUES (2, 'content-service-dev.properties', 'xc-group',
        '#spring http 配置信息\nserver.servlet.context-path = /content\nserver.port=63040\n\n\n#spring druid 配置信息\nspring.datasource.url = jdbc:mysql://192.168.101.65:3306/xc2.0_content?serverTimezone=UTC&userUnicode=true&useSSL=false&characterEncoding=utf8\n\n\n#文件系统配置\n#文件系统微服务的请求地址\nfile.service.url=http://127.0.0.1:56082/farming/generatetoken?origin=qiniu\n#文件存储空间名称\nfile.service.bucket=xczx-lzy\n\n#前端上传文件需要的配置信息\n#文件存储区域的地址\nfile.service.upload.region = http://upload.qiniu.com\n#文件访问的cdn加速域名\ncdn.domain = r3zc5rung.hd-bkt.clouddn.com\n\nfile.token.type = 1\nfile.token.deadline = 3600\n\n\n#异步回调，定义ConfirmCallback，MQ返回结果时会回调这个ConfirmCallback\nspring.rabbitmq.publisher-confirm-type = correlated\n#开启publish-return功能，同样是基于callback机制，不过是定义ReturnCallback\nspring.rabbitmq.publisher-returns = true\n#定义消息路由失败时的策略。true，则调用ReturnCallback；false：则直接丢弃消息\nspring.rabbitmq.template.mandatory = true\n\n\n# 课程发布 交互级名称\ncourse.publish.exchange = course_pub.direct\n# 课程发布 页面生成队列名称\ncourse.publish.queue = course_page.queue\ncourse.publish.routingKey= publish.course',
        'a2962f9623381bdee92050275a3e790b', '2022-08-31 13:31:52', '2022-09-01 02:50:07', NULL, '192.168.101.1', '',
        '3adc3388-087e-4c90-a373-c5a6484752df', '', '', '', 'properties', '');
INSERT INTO `config_info`
VALUES (3, 'spring-druid-config.properties', 'xc-group',
        '#spring druid 配置信息\n#spring.datasource.driver-class-name = com.mysql.jdbc.Driver\n#spring.datasource.url = jdbc:mysql://127.0.0.1:3306/xc2.0_content?userUnicode=true&useSSL=false&characterEncoding=utf8\nspring.datasource.username = root\nspring.datasource.password = mysql\n#初始化连接池的的连接数据量\nspring.datasource.druid.initial-size = 5\n#连接池最小连接数 \nspring.datasource.druid.min-idle = 5\n#获取连接等待超时时间 \nspring.datasource.druid.max-wait = 60000\n# 要启用PreparedStatementCache,必须配置大于0，当大于0时，poolPreparedStatements自动触发修改为true。\nspring.datasource.druid.max-pool-prepared-statement-per-connection-size = 20\n#连接池中最大激活连接数\nspring.datasource.druid.max-active = 20',
        '420867ac9dff1d6f7a76bb25769ab7bf', '2022-08-31 13:31:52', '2022-08-31 13:31:52', NULL, '192.168.101.1', '',
        '3adc3388-087e-4c90-a373-c5a6484752df', NULL, NULL, NULL, 'properties', NULL);
INSERT INTO `config_info`
VALUES (4, 'spring-http-config.properties', 'xc-group',
        '#srpingboot http 配置信息\nspring.http.encoding.enabled = true\nspring.http.encoding.charset = UTF-8\nspring.http.encoding.force = true\nserver.use-forward-headers = true\n#server.servlet.context-path = /\n#server.port=8888\n#nacos上添加如下配置重启服务即可让我们的服务优先读取本地配置参数信息！\nspring.cloud.config.allow-override=true\nspring.cloud.config.override-none=true\nspring.cloud.config.override-system-properties=false',
        '8a44e28b630fd3aa6384d66f9c351725', '2022-08-31 13:31:52', '2022-08-31 13:31:52', NULL, '192.168.101.1', '',
        '3adc3388-087e-4c90-a373-c5a6484752df', NULL, NULL, NULL, 'properties', NULL);
INSERT INTO `config_info`
VALUES (5, 'system-service-dev.properties', 'xc-group',
        '#srpingboot http 配置信息\nserver.servlet.context-path = /system\nserver.port=63110\n\n#spring druid 配置信息\nspring.datasource.url = jdbc:mysql://192.168.101.65:3306/xc2.0_system?serverTimezone=UTC&userUnicode=true&useSSL=false&characterEncoding=utf8',
        'a822e380324c0f08cb33d886a8643e5d', '2022-08-31 13:31:52', '2022-09-01 02:55:16', NULL, '192.168.101.1', '',
        '3adc3388-087e-4c90-a373-c5a6484752df', '', '', '', 'properties', '');
INSERT INTO `config_info`
VALUES (6, 'media-service-dev.properties', 'xc-group',
        '#springboot启动配置修改\nserver.servlet.context-path = /media\nserver.port=63050\n\n# 修改druid公共配置信息里的连接地址\nspring.datasource.url=jdbc:mysql://192.168.101.65:3306/xc2.0_media?serverTimezone=UTC&userUnicode=true&useSSL=false&characterEncoding=utf8\n\naliyun.region = cn-shanghai\naliyun.accessKeyId = LTAI5tPEYTyFEK1qsyyigFM7\naliyun.accessKeySecret = DGJggsZidqb6cyIhUSvZRaXQxEmHMN',
        '9b1e3ce87f944601a2f1e086830796eb', '2022-08-31 13:31:52', '2022-09-01 02:56:15', NULL, '192.168.101.1', '',
        '3adc3388-087e-4c90-a373-c5a6484752df', '', '', '', 'properties', '');
INSERT INTO `config_info`
VALUES (7, 'feign-config.properties', 'xc-group',
        '# 开启 feign 的远程调用使用熔断\nfeign.sentinel.enabled = true\n# 配置请求GZIP压缩\nfeign.compression.request.enabled = false\n# 配置压缩数据大小的下限\nfeign.compression.request.min-request-size = 2048\n# 配置响应GZIP压缩\nfeign.compression.response.enabled = false\n# 配置压缩支持的MIME TYPE\nfeign.compression.request.mime-types[0] = text/xml\nfeign.compression.request.mime-types[1] = application/xml\nfeign.compression.request.mime-types[2] = application/json',
        '2f3be5ae5f601d5b37e586607956770e', '2022-08-31 13:31:52', '2022-08-31 13:31:52', NULL, '192.168.101.1', '',
        '3adc3388-087e-4c90-a373-c5a6484752df', NULL, NULL, NULL, 'properties', NULL);
INSERT INTO `config_info`
VALUES (8, 'ribbon-config.properties', 'xc-group',
        '#对当前实例的重试次数 default 0\r\nribbon.MaxAutoRetries = 1\r\n#设置连接超时时间 default 2000\r\nribbon.ConnectTimeout = 3000\r\n#对所有操作请求都进行重试 default false\r\nribbon.OkToRetryOnAllOperations = false\r\n#设置读取超时时间 default 5000\r\nribbon.ReadTimeout = 20000\r\n#切换实例的重试次数 default 1\r\nribbon.MaxAutoRetriesNextServer = 1',
        '95976e0fbb744e2c148d1b9a214025b3', '2022-08-31 13:31:52', '2022-08-31 13:31:52', NULL, '192.168.101.1', '',
        '3adc3388-087e-4c90-a373-c5a6484752df', NULL, NULL, NULL, 'properties', NULL);
INSERT INTO `config_info`
VALUES (9, 'freemarker-config.properties', 'xc-group',
        '#开启 freemarker 功能\r\nspring.freemarker.enabled = true\r\n#关闭模板缓存，方便测试\r\nspring.freemarker.cache = false\r\nspring.freemarker.settings.template_update_delay = 0\r\n#页面模板后缀名\r\nspring.freemarker.suffix = .ftl\r\nspring.freemarker.charset = UTF-8\r\n#页面模板位置(默认为 classpath:/templates/)\r\nspring.freemarker.template-loader-path = classpath:/templates/\r\n#关闭项目中的静态资源映射(static、resources文件夹下的资源)\r\nspring.resources.add-mappings = false',
        'b922b2f76a55b5f1bb66bd0e86fd67da', '2022-08-31 13:31:52', '2022-08-31 13:31:52', NULL, '192.168.101.1', '',
        '3adc3388-087e-4c90-a373-c5a6484752df', NULL, NULL, NULL, 'properties', NULL);
INSERT INTO `config_info`
VALUES (10, 'rabbitmq-config.properties', 'xc-group',
        '#rabbitmq 配置信息\nspring.rabbitmq.host = 192.168.101.65\nspring.rabbitmq.port = 5672\nspring.rabbitmq.username = guest\nspring.rabbitmq.password = guest\nspring.rabbitmq.password.virtual-host = /\n\n#correlated 异步回调，定义ConfirmCallback，MQ返回结果时会回调这个ConfirmCallback\nspring.rabbitmq.publisher-confirm-type = correlated\n#开启publish-return功能，同样是基于callback机制，需要定义ReturnCallback\nspring.rabbitmq.publisher-returns = true\n#定义消息路由失败时的策略。true，则调用ReturnCallback；false：则直接丢弃消息\nspring.rabbitmq.template.mandatory = true\n#出现异常时返回nack，消息回滚到mq；没有异常，返回ack\nspring.rabbitmq.listener.simple.acknowledge-mode = auto\n#开启消费者失败重试\nspring.rabbitmq.listener.simple.retry.enabled = true\n#初识的失败等待时长为1秒\nspring.rabbitmq.listener.simple.retry.initial-interval = 1000ms\n#失败的等待时长倍数，下次等待时长 = multiplier * last-interval\nspring.rabbitmq.listener.simple.retry.multiplier = 1\n#最大重试次数\nspring.rabbitmq.listener.simple.retry.max-attempts = 3\n# true无状态；false有状态。如果业务中包含事务，这里改为false\nspring.rabbitmq.listener.simple.retry.stateless=true\n\n\n#消息队列配置\n#消息同步交换机\nxc.mq.msgsync.exchange=xc.msgsync.direct\n#课程发布消息队列\nxc.mq.msgsync.queue.coursepub=xc.course.publish.queue\n#课程发布消息队列routingkey\nxc.mq.msgsync.queue.coursepub.key=xc.course.publish.queue\n#课程发布结果消息队列\nxc.mq.msgsync.queue.coursepubresult=xc.course.publish.result.queue\n#课程发布结果消息队列routingkey\nxc.mq.msgsync.queue.coursepubresult.key=xc.course.publish.result.queue',
        'f7df4f6cf31e7401353c013820bb555c', '2022-08-31 13:31:52', '2022-09-01 02:57:24', NULL, '192.168.101.1', '',
        '3adc3388-087e-4c90-a373-c5a6484752df', '', '', '', 'properties', '');
INSERT INTO `config_info`
VALUES (11, 'coursepub-consumer-service-dev.properties', 'xc-group',
        '#springboot server 配置\nserver.servlet.context-path = /pub_consumer\nserver.port=63333\n\n#druid 配置信息\nspring.datasource.url = jdbc:mysql://127.0.0.1:3306/xc2.0_content?userUnicode=true&useSSL=false&characterEncoding=utf8\n\n#消费端应答模式\nspring.rabbitmq.listener.simple.acknowledge-mode = auto\n\n# 开启消费者失败重试\nspring.rabbitmq.listener.simple.retry.enabled = true\n# 初识的失败等待时长为1秒\nspring.rabbitmq.listener.simple.retry.initial-interval = 1000ms\n# 失败的等待时长倍数，下次等待时长 = multiplier * last-interval\nspring.rabbitmq.listener.simple.retry.multiplier = 1\n# 最大重试次数\nspring.rabbitmq.listener.simple.retry.max-attempts = 3\n# true无状态；false有状态。如果业务中包含事务，这里改为false\nspring.rabbitmq.listener.simple.retry.stateless = true\n\n# 课程发布 交换机名称\ncourse.publish.exchange = course_pub.direct\n# 课程发布 页面生成队列名称\ncourse.publish.queue = course_page.queue\ncourse.publish.routingkey= publish.course\n\n#课程发布 消费失败配置信息\ncourse.publish.error.exchange = error.course_pub.direct\ncourse.publish.error.queue = error.course_page.queue\ncourse.publish.error.routingkey = error.publish_course\n\n#生成静态化页面发布位置\ncourse.publish.position = pages/\n#七牛云的存储消息\nfile.qiniu.accessKey = C_406Zs8cIazVTGeQXLV_BVfg0hLbDgUs5J5K1ro\nfile.qiniu.secretKey = hfsJ1ypCKHOufHzk8mGuWfXACklkvSbwKyjG96RW\nfile.qiniu.bucket = xczx-lzy-static-pages',
        'd0b03638ad59ca16bc2c9357ff406771', '2022-08-31 13:31:52', '2022-08-31 13:31:52', NULL, '192.168.101.1', '',
        '3adc3388-087e-4c90-a373-c5a6484752df', NULL, NULL, NULL, 'properties', NULL);
INSERT INTO `config_info`
VALUES (12, 'search-service-dev.properties', 'xc-group',
        'server.servlet.context-path = /search\nserver.port=63080\n\n# ES 配置信息\ncourse.elasticsearch.hostlist = 106.15.33.29:9200\ncourse.elasticsearch.course.index = xc2.0_course',
        '00257720a4c531ad7c9edcf4e14da2cf', '2022-08-31 13:31:52', '2022-08-31 13:31:52', NULL, '192.168.101.1', '',
        '3adc3388-087e-4c90-a373-c5a6484752df', NULL, NULL, NULL, 'properties', NULL);
INSERT INTO `config_info`
VALUES (13, 'learning-service-dev.properties', 'xc-group',
        '#srpingboot http 配置信息\nserver.servlet.context-path = /learning\nserver.port=63070\n\nspring.datasource.url = jdbc:mysql://127.0.0.1:3306/xc2.0_learning?userUnicode=true&useSSL=false&characterEncoding=utf8',
        '1d91a8d5b2a4993061089242a2f5e52c', '2022-08-31 13:31:52', '2022-08-31 13:31:52', NULL, '192.168.101.1', '',
        '3adc3388-087e-4c90-a373-c5a6484752df', NULL, NULL, NULL, 'properties', NULL);
INSERT INTO `config_info`
VALUES (14, 'teaching-service-dev.properties', 'xc-group',
        '#srpingboot http 配置信息\nserver.servlet.context-path = /teaching\nserver.port=63060\n\nspring.datasource.url = jdbc:mysql://127.0.0.1:3306/xc2.0_teaching?userUnicode=true&useSSL=false&characterEncoding=utf8',
        'e033922e9ff1db4292280e3689cfe5d9', '2022-08-31 13:31:52', '2022-08-31 13:31:52', NULL, '192.168.101.1', '',
        '3adc3388-087e-4c90-a373-c5a6484752df', NULL, NULL, NULL, 'properties', NULL);
INSERT INTO `config_info`
VALUES (15, 'uaa-gateway-server-dev.properties', 'xc-group',
        '#srpingboot http 配置信息\r\nserver.servlet.context-path = /\r\nserver.port=63010',
        '001a3d10fe3c491c0444f6dcdd6b35e8', '2022-08-31 13:31:52', '2022-08-31 13:31:52', NULL, '192.168.101.1', '',
        '3adc3388-087e-4c90-a373-c5a6484752df', NULL, NULL, NULL, 'properties', NULL);
INSERT INTO `config_info`
VALUES (16, 'uaa-service-dev.properties', 'xc-group',
        '#srpingboot http 配置信息\nserver.servlet.context-path = /uaa\nserver.port=63020\n\nspring.datasource.url = jdbc:mysql://127.0.0.1:3306/xc2.0_uaa?userUnicode=true&useSSL=false&characterEncoding=utf8',
        'bcaad64b545f0d673d52b52084270ff8', '2022-08-31 13:31:52', '2022-08-31 13:31:52', NULL, '192.168.101.1', '',
        '3adc3388-087e-4c90-a373-c5a6484752df', NULL, NULL, NULL, 'properties', NULL);
INSERT INTO `config_info`
VALUES (17, 'user-service-dev.properties', 'xc-group',
        '#srpingboot http 配置信息\nserver.servlet.context-path = /user\nserver.port=63130\n\n\nspring.datasource.url = jdbc:mysql://127.0.0.1:3306/xc2.0_user?userUnicode=true&useSSL=false&characterEncoding=utf8',
        'b3f8bbaca06c2a84c25da45217caa1c3', '2022-08-31 13:31:52', '2022-08-31 13:31:52', NULL, '192.168.101.1', '',
        '3adc3388-087e-4c90-a373-c5a6484752df', NULL, NULL, NULL, 'properties', NULL);
INSERT INTO `config_info`
VALUES (18, 'order-service-dev.properties', 'xc-group',
        '#srpingboot http 配置信息\nserver.servlet.context-path = /order\nserver.port=63090\n\nspring.datasource.url = jdbc:mysql://127.0.0.1:3306/xc2.0_order?userUnicode=true&useSSL=false&characterEncoding=utf8\n\n#商户微信公共号或开放平台唯一标识\nweixinpay.app-id = wx8397f8696b538317\n#商户号\nweixinpay.mch-id = 1473426802\n#商户密钥\nweixinpay.mch-key = T6m9iK73b0kn9g5v426MKfHQH7X8rKwb\n#微信回调商户的地址\nweixinpay.notify-url = http://www.course.com/api\n#商户的支付类型（NATIVE 为扫码支付）\nweixinpay.trade-type = NATIVE',
        '8c06a86939b031fb73b3d25212c06920', '2022-08-31 13:31:52', '2022-08-31 13:31:52', NULL, '192.168.101.1', '',
        '3adc3388-087e-4c90-a373-c5a6484752df', NULL, NULL, NULL, 'properties', NULL);
INSERT INTO `config_info`
VALUES (19, 'seataServer.properties', 'xc-group',
        '# 数据存储方式，db代表数据库\nstore.mode=db\nstore.db.datasource=druid\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\nstore.db.url=jdbc:mysql://127.0.0.1:3306/xc2.0_seata?useUnicode=true&rewriteBatchedStatements=true\nstore.db.user=root\nstore.db.password=itcast136\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n# 事务、日志等配置\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\n\n# 客户端与服务端传输方式\ntransport.serialization=seata\ntransport.compressor=none\n# 关闭metrics功能，提高性能\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898',
        '58da867dd87f2b78b55aad31c968bcb5', '2022-08-31 13:31:52', '2022-08-31 13:31:52', NULL, '192.168.101.1', '',
        '3adc3388-087e-4c90-a373-c5a6484752df', NULL, NULL, NULL, 'properties', NULL);
INSERT INTO `config_info`
VALUES (20, 'redis-config.properties', 'xc-group',
        '# Redis数据库索引（默认为0）\nspring.redis.database=0\n# Redis服务器地址\nspring.redis.host=192.168.101.64\n# Redis服务器连接端口\nspring.redis.port=6379\n# Redis服务器连接密码（默认为空）\nspring.redis.password=itcast20220812\nspring.redis.lettuce.pool.max-active=20\nspring.redis.lettuce.pool.max-idle=10\nspring.redis.lettuce.pool.min-idle=0\nspring.redis.lettuce.pool.max-wait=-1\n# 连接池最大连接数（使用负值表示没有限制）\n#spring.redis.jedis.pool.max-active=20\n# 连接池最大阻塞等待时间（使用负值表示没有限制）\n#spring.redis.jedis.pool.max-wait=-1\n# 连接池中的最大空闲连接\n#spring.redis.jedis.pool.max-idle=10\n# 连接池中的最小空闲连接\n#spring.redis.jedis.pool.min-idle=0\n# 连接超时时间（毫秒）\nspring.redis.timeout=1000',
        '179450e4e39ac7dcce283e3d80cb6d97', '2022-08-31 13:31:52', '2022-08-31 13:31:52', NULL, '192.168.101.1', '',
        '3adc3388-087e-4c90-a373-c5a6484752df', NULL, NULL, NULL, 'properties', NULL);
INSERT INTO `config_info`
VALUES (21, 'comment-service.properties', 'xc-group',
        '#srpingboot http 配置信息\nserver.servlet.context-path = /comment\nserver.port=63120\n\nspring.datasource.url = jdbc:mysql://192.168.101.65:3306/xc2.0_comments?userUnicode=true&useSSL=false&characterEncoding=utf8',
        '1e6275014671ea2db7d2bff629055f56', '2022-08-31 13:31:52', '2022-09-01 03:14:32', NULL, '192.168.101.1', '',
        '3adc3388-087e-4c90-a373-c5a6484752df', '', '', '', 'properties', '');
INSERT INTO `config_info`
VALUES (22, 'media-process-service-dev.properties', 'xc-group',
        '#springboot启动配置修改\n\n# 修改druid公共配置信息里的连接地址\nspring.datasource.url=jdbc:mysql://192.168.101.65:3306/xc2.0_media?serverTimezone=UTC&userUnicode=true&useSSL=false&characterEncoding=utf8\n\n### xxl-job admin address list, such as \"http://address\" or \"http://address01,http://address02\"\nxxl.job.admin.addresses=http://192.168.101.65:8088/xxl-job-admin\n### xxl-job executor registry-address: default use address to registry , otherwise use ip:port if address is null\nxxl.job.executor.address=\n### xxl-job executor server-info\nxxl.job.executor.ip=\n### xxl-job, access token\nxxl.job.accessToken=default_token\n\n### xxl-job executor appname\nxxl.job.executor.appname=media-process-service\n\nxxl.job.executor.port=9999\n### xxl-job executor log-path\nxxl.job.executor.logpath=/data/applogs/xxl-job/jobhandler\n### xxl-job executor log-retention-days\nxxl.job.executor.logretentiondays=30',
        '2ed5918632f5d7fa6ae5b2d85091a490', '2022-08-31 13:31:52', '2022-09-01 03:14:21', NULL, '192.168.101.1', '',
        '3adc3388-087e-4c90-a373-c5a6484752df', '', '', '', 'properties', '');
INSERT INTO `config_info`
VALUES (23, 'message-process-service-dev.properties', 'xc-group',
        '### xxl-job admin address list, such as \"http://address\" or \"http://address01,http://address02\"\nxxl.job.admin.addresses=http://192.168.101.65:8088/xxl-job-admin\n### xxl-job executor registry-address: default use address to registry , otherwise use ip:port if address is null\nxxl.job.executor.address=\n### xxl-job executor server-info\nxxl.job.executor.ip=\n### xxl-job, access token\nxxl.job.accessToken=default_token\n\n### xxl-job executor appname\nxxl.job.executor.appname=media-process-service\n\nxxl.job.executor.port=9999\n### xxl-job executor log-path\nxxl.job.executor.logpath=/data/applogs/xxl-job/jobhandler\n### xxl-job executor log-retention-days\nxxl.job.executor.logretentiondays=30',
        '290992196277c8d37d72add540519ca0', '2022-08-31 13:31:52', '2022-09-01 03:13:45', NULL, '192.168.101.1', '',
        '3adc3388-087e-4c90-a373-c5a6484752df', '', '', '', 'properties', '');
INSERT INTO `config_info`
VALUES (24, 'cache-service-dev.properties', 'xc-group', 'server.servlet.context-path = /\nserver.port=63035',
        '203bcffeeca788f2e212eed4753ac81e', '2022-08-31 13:31:52', '2022-08-31 13:31:52', NULL, '192.168.101.1', '',
        '3adc3388-087e-4c90-a373-c5a6484752df', NULL, NULL, NULL, 'properties', NULL);
INSERT INTO `config_info`
VALUES (34, 'system-service-prod.properties', 'course-project', 'config.abc=456',
        '7c5a17db32855013580f7998984e1f52', '2022-09-11 04:25:57', '2022-09-11 04:26:23', NULL, '192.168.101.1', '',
        'prod', '', '', '', 'properties', '');
INSERT INTO `config_info`
VALUES (35, 'system-service-test.properties', 'course-project', 'config.abc=789',
        '48efd90540af953eed3dd41254495efc', '2022-09-11 04:26:13', '2022-09-11 04:26:35', NULL, '192.168.101.1', '',
        'test', '', '', '', 'properties', '');
INSERT INTO `config_info`
VALUES (81, 'system-service-dev.yaml', 'course-project',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_system?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n\n',
        '7c166a3388dc2a93e3e6a9d2444175bc', '2022-09-11 06:32:14', '2022-09-11 09:13:39', NULL, '192.168.101.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (82, 'system-api-dev.yaml', 'course-project',
        'server:\n  servlet:\n    context-path: /system\n  port: 63110\n\ntestconfig:\n a: 1aa',
        '08bc232c5164645dae080a8e0574cf27', '2022-09-11 06:33:06', '2022-09-11 06:37:16', NULL, '192.168.101.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (85, 'content-service-dev.yaml', 'course-project',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_content?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n\nxxl:\n  job:\n    admin: \n      addresses: http://192.168.101.65:8088/xxl-job-admin\n    executor:\n      appname: coursepublish-job\n      address: \n      ip: \n      port: 8999\n      logpath: /data/applogs/xxl-job/jobhandler\n      logretentiondays: 30\n    accessToken: default_token\ntest_config:\n a: 2a\n b: 2b\n c: 2c',
        '1ef8a88991220e3dfd68d53e33ceb3a8', '2022-09-11 07:33:48', '2022-09-22 03:09:26', NULL, '192.168.101.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (86, 'content-api-dev.yaml', 'course-project',
        'server:\n  servlet:\n    context-path: /content\n  port: 63040\n\ntest_config:\n a: 3a\n b: 3b\n\n#配置本地优先\nspring:\n cloud:\n  config:\n    override-none: true\n',
        'b253988f9f30d549192402cbab566a0e', '2022-09-11 07:54:17', '2022-09-11 09:01:41', NULL, '192.168.101.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (88, 'swagger-dev.yaml', 'course-common',
        '# swagger 文档配置\nswagger:\n  title: \"学成在线内容管理系统\"\n  description: \"内容系统管理系统对课程相关信息进行业务管理数据\"\n  base-package: com.course\n  enabled: true\n  version: 1.0.0\n\ntest_config:\n a: 1a\n b: 1b\n c: 1c\n d: 1d',
        '9c0d3be98c5a9ff620445bd718ea10ad', '2022-09-11 08:14:16', '2022-09-11 08:49:11', NULL, '192.168.101.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (91, 'logging-dev.yaml', 'course-common',
        '# 日志文件配置路径\nlogging:\n  config: classpath:log4j2-dev.xml\n  level:\n    org.springframework.cloud.gateway: trace',
        'cf8b1af28beb25b242f97519c8f2c560', '2022-09-11 08:22:12', '2022-09-12 13:21:52', NULL, '192.168.101.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (105, 'gateway-dev.yaml', 'course-project',
        'server:\n  port: 63010 # 网关端口\nspring:\n  cloud:\n    gateway:\n#      filter:\n#        strip-prefix:\n#          enabled: true\n      routes: # 网关路由配置\n        - id: content-api # 路由id，自定义，只要唯一即可\n          # uri: http://127.0.0.1:8081 # 路由的目标地址 http就是固定地址\n          uri: lb://content-api # 路由的目标地址 lb就是负载均衡，后面跟服务名称\n          predicates: # 路由断言，也就是判断请求是否符合路由规则的条件\n            - Path=/content/** # 这个是按照路径匹配，只要以/content/开头就符合要求\n#          filters:\n#            - StripPrefix=1\n        - id: system-api\n          # uri: http://127.0.0.1:8081\n          uri: lb://system-api\n          predicates:\n            - Path=/system/**\n#          filters:\n#            - StripPrefix=1\n        - id: media-api\n          # uri: http://127.0.0.1:8081\n          uri: lb://media-api\n          predicates:\n            - Path=/media/**\n#          filters:\n#            - StripPrefix=1\n        - id: search-service\n          # uri: http://127.0.0.1:8081\n          uri: lb://search\n          predicates:\n            - Path=/search/**\n#          filters:\n#            - StripPrefix=1\n        - id: auth-service\n          # uri: http://127.0.0.1:8081\n          uri: lb://auth-service\n          predicates:\n            - Path=/auth/**\n#          filters:\n#            - StripPrefix=1\n        - id: checkcode\n          # uri: http://127.0.0.1:8081\n          uri: lb://checkcode\n          predicates:\n            - Path=/checkcode/**\n#          filters:\n#            - StripPrefix=1\n        - id: learning-api\n          # uri: http://127.0.0.1:8081\n          uri: lb://learning-api\n          predicates:\n            - Path=/learning/**\n#          filters:\n#            - StripPrefix=1\n        - id: orders-api\n          # uri: http://127.0.0.1:8081\n          uri: lb://orders-api\n          predicates:\n            - Path=/orders/**\n#          filters:\n#            - StripPrefix=1',
        '0aa8d36f8c1ac49485e133f43f60481b', '2022-09-11 09:46:12', '2022-10-03 05:20:22', NULL, '192.168.101.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (107, 'media-api-dev.yaml', 'course-project',
        'server:\n  servlet:\n    context-path: /media\n  port: 63050\n\n', '7e41197fdbb4b6bd1194ae292af19ff8',
        '2022-09-11 10:05:29', '2022-09-17 05:26:20', NULL, '192.168.101.1', '', 'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (108, 'media-service-dev.yaml', 'course-project',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_media?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n  cloud:\n   config:\n    override-none: true\n\nminio:\n  endpoint: http://192.168.101.65:9000\n  accessKey: minioadmin\n  secretKey: minioadmin\n  bucket:\n    files: mediafiles\n    videofiles: video\nxxl:\n  job:\n    admin: \n      addresses: http://192.168.101.65:8088/xxl-job-admin\n    executor:\n      appname: media-process-service\n      address: \n      ip: \n      port: 9999\n      logpath: /data/applogs/xxl-job/jobhandler\n      logretentiondays: 30\n    accessToken: default_token\n\nvideoprocess:\n ffmpegpath: D:/soft/ffmpeg/ffmpeg.exe\n\n',
        '7473a1104ab69e8b207abd428e2aa0cf', '2022-09-11 10:05:29', '2022-09-22 03:10:04', NULL, '192.168.101.1', '',
        'dev', 'xxl.job.admin.addresses', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (121, 'freemarker-config-dev.yaml', 'course-common',
        'spring:\r\n  freemarker:\r\n    enabled: true\r\n    cache: false   #关闭模板缓存，方便测试\r\n    settings:\r\n      template_update_delay: 0\r\n    suffix: .ftl   #页面模板后缀名\r\n    charset: UTF-8\r\n    template-loader-path: classpath:/templates/   #页面模板位置(默认为 classpath:/templates/)\r\n    resources:\r\n      add-mappings: false   #关闭项目中的静态资源映射(static、resources文件夹下的资源)\r\n    ',
        '8e97657f299e4a1a6158e8ebf4894e51', '2022-09-15 11:18:37', '2022-09-15 11:18:37', NULL, '192.168.101.1', '',
        'dev', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info`
VALUES (132, 'message-service-dev.yaml', 'course-project',
        'spring:\n   datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n    dynamic:\n      primary: content #设置默认的数据源或者数据源组,默认值即为master\n      strict: true #设置严格模式,默认false不启动. 启动后在未匹配到指定数据源时候回抛出异常,不启动会使用默认数据源.\n      druid:\n        initial-size: 3\n        max-active: 5\n        min-idle: 5\n        max-wait: 60000\n        pool-prepared-statements: true\n        max-pool-prepared-statement-per-connection-size: 20\n        time-between-eviction-runs-millis: 60000\n        min-evictable-idle-time-millis: 300000\n        validation-query: SELECT 1 FROM DUAL\n        test-while-idle: true\n        test-on-borrow: false\n        test-on-return: false\n        stat-view-servlet:\n          enabled: true\n          url-pattern: /druid/*\n          #login-username: admin\n          #login-password: admin\n        filter:\n          stat:\n            log-slow-sql: true\n            slow-sql-millis: 1000\n            merge-sql: true\n          wall:\n            config:\n              multi-statement-allow: true\n      datasource:\n        content:\n          url: jdbc:mysql://192.168.101.65:3306/xcplus_content?serverTimezone=UTC&allowMultiQueries=true&useUnicode=true&characterEncoding=UTF-8\n          username: root\n          password: mysql\n          driver-class-name: com.mysql.cj.jdbc.Driver\n        media:\n          url: jdbc:mysql://192.168.101.65:3306/xcplus_media?serverTimezone=UTC&allowMultiQueries=true&useUnicode=true&characterEncoding=UTF-8\n          username: root\n          password: mysql\n          driver-class-name: com.mysql.cj.jdbc.Driver\n\n',
        '7c64bb323a1271815e8aadcd2feffbcd', '2022-09-19 10:22:11', '2022-09-19 10:25:17', NULL, '192.168.101.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (134, 'rabbitmq-dev.yaml', 'course-common',
        'spring:\n  rabbitmq:\n    host: 192.168.101.65\n    port: 5672\n    username: guest\n    password: guest\n    virtual-host: /\n    publisher-confirm-type: correlated #correlated 异步回调，定义ConfirmCallback，MQ返回结果时会回调这个ConfirmCallback\n    publisher-returns: false #开启publish-return功能，同样是基于callback机制，需要定义ReturnCallback\n    template:\n      mandatory: false #定义消息路由失败时的策略。true，则调用ReturnCallback；false：则直接丢弃消息\n    listener:\n      simple:\n        prefetch: 1  #每次只能获取一条消息，处理完成才能获取下一个消息\n        acknowledge-mode: none #auto:出现异常时返回unack，消息回滚到mq；没有异常，返回ack ,manual:手动控制,none:丢弃消息，不回滚到mq\n        retry:\n          enabled: true #开启消费者失败重试\n          initial-interval: 1000ms #初识的失败等待时长为1秒\n          multiplier: 1 #失败的等待时长倍数，下次等待时长 = multiplier * last-interval\n          max-attempts: 3 #最大重试次数\n          stateless: true #true无状态；false有状态。如果业务中包含事务，这里改为false',
        '9a2acc646d17166ee29989751faceaea', '2022-09-20 02:42:44', '2022-09-20 05:26:56', NULL, '192.168.101.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (145, 'feign-dev.yaml', 'course-common',
        'feign:\n  client:\n    config:\n      default: # default全局的配置\n        loggerLevel: BASIC # 日志级别，BASIC就是基本的请求和响应信息\n  hystrix:\n    enabled: true\n  circuitbreaker:\n    enabled: true\n  httpclient:\n    enabled: true # 开启feign对HttpClient的支持\n    max-connections: 200 # 最大的连接数\n    max-connections-per-route: 50 # 每个路径的最大连接数\n',
        '2287b4dcf1db4d243a11c74f7a2b6aff', '2022-09-20 11:59:29', '2022-10-03 01:07:11', NULL, '192.168.101.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (152, 'search-dev.yaml', 'course-project',
        'server:\n  servlet:\n    context-path: /search\n  port: 63080\n\nelasticsearch:\n  hostlist: 192.168.101.65:9200 #多个结点中间用逗号分隔\n  course:\n    index: course-publish\n    source_fields: id,name,grade,mt,st,charge,pic,price,originalPrice,teachmode,validDays,createDate',
        '9b90f07562994fc7295e4cb5fd43debf', '2022-09-24 12:58:14', '2022-09-25 02:38:46', NULL, '192.168.101.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (158, 'auth-service-dev.yaml', 'course-project',
        'server:\n  servlet:\n    context-path: /auth\n  port: 63070\nspring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_users?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql',
        '14b786a4aa780552864a2234cfeba924', '2022-09-26 12:41:48', '2022-09-28 14:56:18', NULL, '192.168.101.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (163, 'checkcode-dev.yaml', 'course-project',
        'server:\r\n  servlet:\r\n    context-path: /checkcode\r\n  port: 63075', '6033e8fd9f084a4e0019db05d6dc061e',
        '2022-09-29 05:46:44', '2022-09-29 05:46:44', NULL, '192.168.101.1', '', 'dev', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info`
VALUES (165, 'learning-service-dev.yaml', 'course-project',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_learning?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql',
        '8413185b8b7606c892d694b6b9590e17', '2022-10-02 02:22:18', '2022-10-02 10:32:26', NULL, '192.168.101.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (166, 'orders-service-dev.yaml', 'course-project',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_orders?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n\nxxl:\n  job:\n    admin: \n      addresses: http://192.168.101.65:8088/xxl-job-admin\n    executor:\n      appname: payresultnotify-job\n      address: \n      ip: \n      port: 8989\n      logpath: /data/applogs/xxl-job/jobhandler\n      logretentiondays: 30\n    accessToken: default_token',
        '8da9d76cf7f2d7042fe6fca8a0f128bd', '2022-10-02 02:23:03', '2022-10-04 22:17:13', NULL, '192.168.101.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (167, 'learning-api-dev.yaml', 'course-project',
        'server:\r\n  servlet:\r\n    context-path: /learning\r\n  port: 63020\r\n\r\n\r\n#配置本地优先\r\nspring:\r\n cloud:\r\n  config:\r\n    override-none: true\r\n',
        '8bbabf9a722ea65b49e13cdcfac95980', '2022-10-02 02:23:57', '2022-10-02 02:23:57', NULL, '192.168.101.1', '',
        'dev', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info`
VALUES (168, 'orders-api-dev.yaml', 'course-project',
        'server:\n  servlet:\n    context-path: /orders\n  port: 63030\n\npay:\n alipay:\n   APP_ID: 2016101900725017\n   APP_PRIVATE_KEY: MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCCek8F78Zgwdho816Xk3uS8AbR+q1c0NIsfERJjstf5bh+6x2aZUWp2iQdSR6IJVvTd0YUdjj4QyI2e0pBLEQUKO3onk+KSWXwaNSPSOlI7LqnxSUP7KzqBN8bmmZ2b5ywp6AhY9IpfRDHP1je79N0AHHht4q7nruZRLE8nUtxoiLSNRAmTH6Rn0SADT3k91zGJhumxxNDKObZ32kGOJP5GjmNayiQvxXEguPQq9Bw7myAO3eY64rImPO30Vz4VNC0zIZji2im8z5CMsTFGGwu9cJ+njB5g1kfriF1r5XXa1FwIPg64v21tMZLfT5esL8opuV5LLU6c3ZOLzxMfNEvAgMBAAECggEAcs8yp7OjaFJJnZfAPToN+25vYeblEw3AUlqKL/uRIvHdVPiHlOrV0K5dJtPHJN9SnJGQPcMFQBa6jRwRa6WKxf550T00GieZpmBn4Siz9XIwkB2eDhQg1s6wjvZegIqXYq4s7hSKwe0FjX1FMu3ur10Q2B+L2KnEwwm5tu9lijdutAUiRvIYbFFXq6Q1nwpxgbn3Os5r0PZKDO8pQomZnzl9AbAsgeA9f533o7bD2e8khFFyB02TLNTueFX+zTh0xuDyKhdD7Xje6kdGpWNnamUWRBCb9g3N3CcgGD60oZJJVo1zwte/eu9FJypR1H8qoEeJDfbA/Q/DMa5Jim/14QKBgQDTtQqUXPKCG/SR2z7BP5khpg+Fpqe1SYssxIHO2LEudovGUUkDi9u6baTie7cHtvOcD4nqcN2d/Kf8YyGxZ4Pq5EJFS0KplqDQKKxzGHV0xreCKg9iMV3sxJcnCUy5wJHyVZ0wyFopzH6jYmA9CZG0wynifS4zv/0ijCZEGNKSsQKBgQCdxqZHyxcNsg4sXCvuvkWsxAddJKeovDvU8c5ZqcIi6aUaTnL01uBHWZGT0PPPM0Y0W4SzJiEnYUl+MMZZj/VEzOfP2mPKVPH+bc7aT/42WAGpOtZSjl4mFi3KY4NPuO+9zrXlrXazZQhyaEUcFHn5ayygzG68ReSzK2CFIefZ3wKBgFww22GONEC6Yb9eZS6MPmfrw5ik4SVN2GBvVkO4EzgzgVykKxJzRgUiGApUa3jdj6onDhzcd3WD/7cliBeUB1szeTRpuKbXJEJhY+9e+E8Y9fKl1DsjWk5vsY7bOuEs3aFU7PXAWZsYJRGLFnOeBihcUJIDhyob8eSoeUVwNcqRAoGAP2lrw0cYyORbVfDlp1rJ3hoba5Aj4mllErzs1pSn9ig5t0z4XvdNxN925xYAJ7LP8JMnzmjwwkcTpqgr0CtPxIsmUB/SI6voZv3zOUMVRPoyELYZFa0qodwgI0vDpvMJSBwgd2M0Zf2hW3oU7Kg+LcSpdyczCnB87pXsgRWTfbkCgYEAkWy8MCXk0q91QCNNICSAlbvDIK/Mg+eVf1l1ilhrbELaBZlx9Tm9Jwn2Z2PRNAPDbd1FYl/5z8yAWAwf51HzlzXN4CWWCmqG/1ri/yD4geU6utepN9tVYRXLoxOPjIufPgCOSqEXde3C+lF7TleLrwjER720wUv23n/UQ/fas+Y=\n   ALIPAY_PUBLIC_KEY: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAoy8UIDCY2ZrrpDRbKIW/Zic3LPBXHGe5nRPLu9t1ud7PRDv5UDzwlhDRwTRnNAe8q3NZJP+ki3NzAY1Ky0QlIJZ6J9R4PRWHshR56U8kReLwuFfhQrYB5aKy8PMpRp41VT39+ywQNlD+UNbziSuRlmT0sjKPM7UCg3D9NucLKlWPfvH5mq+rWIs6pAOfcUDhSOCPS3lgHpMhpr7lYe2RFReKifFsBzEIOWBM8MGbwl0CYyASHKUtydfVDWE2k5g9N7Ypf3QgWYdNpc07vgYjSo3HPl5wLCE7bd7Haphai9gvaGFuEiscApDbQ4b2qWAIpLcwcBJnR+uQbMfYNFr2cQIDAQAB\n\n\n#配置本地优先\nspring:\n cloud:\n  config:\n    override-none: true\n',
        'f048494515f317d930ce66e549e67c00', '2022-10-02 02:24:29', '2022-10-04 09:00:10', NULL, '192.168.101.1', '',
        'dev', '', '', '', 'yaml', '');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`
(
    `id`           bigint                                           NOT NULL AUTO_INCREMENT COMMENT 'id',
    `data_id`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
    `group_id`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
    `datum_id`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
    `content`      longtext CHARACTER SET utf8 COLLATE utf8_bin     NOT NULL COMMENT '内容',
    `gmt_modified` datetime                                         NOT NULL COMMENT '修改时间',
    `app_name`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `tenant_id`    varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum` (`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = '增加租户字段'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`
(
    `id`           bigint                                            NOT NULL AUTO_INCREMENT COMMENT 'id',
    `data_id`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL COMMENT 'data_id',
    `group_id`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL COMMENT 'group_id',
    `app_name`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT 'app_name',
    `content`      longtext CHARACTER SET utf8 COLLATE utf8_bin      NOT NULL COMMENT 'content',
    `beta_ips`     varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT 'betaIps',
    `md5`          varchar(32) CHARACTER SET utf8 COLLATE utf8_bin   NULL     DEFAULT NULL COMMENT 'md5',
    `gmt_create`   datetime                                          NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `gmt_modified` datetime                                          NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    `src_user`     text CHARACTER SET utf8 COLLATE utf8_bin          NULL COMMENT 'source user',
    `src_ip`       varchar(50) CHARACTER SET utf8 COLLATE utf8_bin   NULL     DEFAULT NULL COMMENT 'source ip',
    `tenant_id`    varchar(128) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT '' COMMENT '租户字段',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_configinfobeta_datagrouptenant` (`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'config_info_beta'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`
(
    `id`           bigint                                           NOT NULL AUTO_INCREMENT COMMENT 'id',
    `data_id`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
    `group_id`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
    `tenant_id`    varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT '' COMMENT 'tenant_id',
    `tag_id`       varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
    `app_name`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT 'app_name',
    `content`      longtext CHARACTER SET utf8 COLLATE utf8_bin     NOT NULL COMMENT 'content',
    `md5`          varchar(32) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT 'md5',
    `gmt_create`   datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `gmt_modified` datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    `src_user`     text CHARACTER SET utf8 COLLATE utf8_bin         NULL COMMENT 'source user',
    `src_ip`       varchar(50) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT 'source ip',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_configinfotag_datagrouptenanttag` (`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'config_info_tag'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`
(
    `id`        bigint                                           NOT NULL COMMENT 'id',
    `tag_name`  varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
    `tag_type`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL COMMENT 'tag_type',
    `data_id`   varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
    `group_id`  varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
    `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
    `nid`       bigint                                           NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`nid`) USING BTREE,
    UNIQUE INDEX `uk_configtagrelation_configidtag` (`id`, `tag_name`, `tag_type`) USING BTREE,
    INDEX `idx_tenant_id` (`tenant_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'config_tag_relation'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`
(
    `id`                bigint UNSIGNED                                  NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `group_id`          varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
    `quota`             int UNSIGNED                                     NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
    `usage`             int UNSIGNED                                     NOT NULL DEFAULT 0 COMMENT '使用量',
    `max_size`          int UNSIGNED                                     NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
    `max_aggr_count`    int UNSIGNED                                     NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
    `max_aggr_size`     int UNSIGNED                                     NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
    `max_history_count` int UNSIGNED                                     NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
    `gmt_create`        datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `gmt_modified`      datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_group_id` (`group_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`
(
    `id`           bigint UNSIGNED                                  NOT NULL,
    `nid`          bigint UNSIGNED                                  NOT NULL AUTO_INCREMENT,
    `data_id`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `group_id`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `app_name`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT 'app_name',
    `content`      longtext CHARACTER SET utf8 COLLATE utf8_bin     NOT NULL,
    `md5`          varchar(32) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `gmt_create`   datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `gmt_modified` datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `src_user`     text CHARACTER SET utf8 COLLATE utf8_bin         NULL,
    `src_ip`       varchar(50) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `op_type`      char(10) CHARACTER SET utf8 COLLATE utf8_bin     NULL     DEFAULT NULL,
    `tenant_id`    varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT '' COMMENT '租户字段',
    PRIMARY KEY (`nid`) USING BTREE,
    INDEX `idx_gmt_create` (`gmt_create`) USING BTREE,
    INDEX `idx_gmt_modified` (`gmt_modified`) USING BTREE,
    INDEX `idx_did` (`data_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 188
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = '多租户改造'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info`
VALUES (0, 33, 'system-service-dev.properties', 'course-project', '', 'config.abc=123',
        '930a682cad5b4c4549ea8be5eaa44355', '2022-09-11 04:25:10', '2022-09-11 04:25:10', NULL, '192.168.101.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 34, 'system-service-prod.properties', 'course-project', '', 'config.abc=123',
        '930a682cad5b4c4549ea8be5eaa44355', '2022-09-11 04:25:56', '2022-09-11 04:25:57', NULL, '192.168.101.1', 'I',
        'prod');
INSERT INTO `his_config_info`
VALUES (0, 35, 'system-service-test.properties', 'course-project', '', 'config.abc=123',
        '930a682cad5b4c4549ea8be5eaa44355', '2022-09-11 04:26:13', '2022-09-11 04:26:13', NULL, '192.168.101.1', 'I',
        'test');
INSERT INTO `his_config_info`
VALUES (34, 36, 'system-service-prod.properties', 'course-project', '', 'config.abc=123',
        '930a682cad5b4c4549ea8be5eaa44355', '2022-09-11 04:26:22', '2022-09-11 04:26:23', NULL, '192.168.101.1', 'U',
        'prod');
INSERT INTO `his_config_info`
VALUES (35, 37, 'system-service-test.properties', 'course-project', '', 'config.abc=123',
        '930a682cad5b4c4549ea8be5eaa44355', '2022-09-11 04:26:34', '2022-09-11 04:26:35', NULL, '192.168.101.1', 'U',
        'test');
INSERT INTO `his_config_info`
VALUES (0, 38, 'test.properties', 'course-project', '', 'config.abc=123456789',
        'f0ec4adf094506e1263b8bceae3a0819', '2022-09-11 04:38:03', '2022-09-11 04:38:03', NULL, '192.168.101.1', 'I',
        '');
INSERT INTO `his_config_info`
VALUES (38, 39, 'test.properties', 'course-project', '', 'config.abc=123456789',
        'f0ec4adf094506e1263b8bceae3a0819', '2022-09-11 04:38:17', '2022-09-11 04:38:18', NULL, '192.168.101.1', 'D',
        '');
INSERT INTO `his_config_info`
VALUES (0, 40, 'share1.properties', 'course-project', '', 'config.abc=123456789',
        'f0ec4adf094506e1263b8bceae3a0819', '2022-09-11 04:38:59', '2022-09-11 04:39:00', NULL, '192.168.101.1', 'I',
        '');
INSERT INTO `his_config_info`
VALUES (0, 41, 'share2.properties', 'course-project', '', 'config.bcd=987654321',
        'd9f88690146a19d7c070854f001592f2', '2022-09-11 04:39:34', '2022-09-11 04:39:34', NULL, '192.168.101.1', 'I',
        '');
INSERT INTO `his_config_info`
VALUES (39, 42, 'share1.properties', 'course-project', '', 'config.abc=123456789',
        'f0ec4adf094506e1263b8bceae3a0819', '2022-09-11 05:03:31', '2022-09-11 05:03:31', NULL, '192.168.101.1', 'U',
        '');
INSERT INTO `his_config_info`
VALUES (39, 43, 'share1.properties', 'course-project', '', 'config.abc=123456789\nconfig.bcd=987654321',
        '22f2daab1c182585fc7a60ba61cd1efc', '2022-09-11 05:16:33', '2022-09-11 05:16:34', NULL, '192.168.101.1', 'U',
        '');
INSERT INTO `his_config_info`
VALUES (40, 44, 'share2.properties', 'course-project', '', 'config.bcd=987654321',
        'd9f88690146a19d7c070854f001592f2', '2022-09-11 05:16:46', '2022-09-11 05:16:47', NULL, '192.168.101.1', 'U',
        '');
INSERT INTO `his_config_info`
VALUES (40, 45, 'share2.properties', 'course-project', '', 'config.bcd=987654321\naaa=111',
        '74ba071d9023ca6d44e297d2e0c32c65', '2022-09-11 05:17:30', '2022-09-11 05:17:30', NULL, '192.168.101.1', 'U',
        '');
INSERT INTO `his_config_info`
VALUES (0, 46, 'share3.properties', 'DEFAULT_GROUP', '', 'config.bcd.2233', 'a93f2ddeb1d649e8a618131fc4cc88f1',
        '2022-09-11 05:24:04', '2022-09-11 05:24:04', NULL, '192.168.101.1', 'I', '');
INSERT INTO `his_config_info`
VALUES (0, 47, 'share2.properties', 'DEFAULT_GROUP', '', 'config.bcd=444', '4ad8367843a6494dd3bb6e67ad2f0930',
        '2022-09-11 05:25:05', '2022-09-11 05:25:05', NULL, '192.168.101.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (45, 48, 'share3.properties', 'DEFAULT_GROUP', '', 'config.bcd.2233', 'a93f2ddeb1d649e8a618131fc4cc88f1',
        '2022-09-11 05:25:28', '2022-09-11 05:25:28', NULL, '192.168.101.1', 'U', '');
INSERT INTO `his_config_info`
VALUES (46, 49, 'share2.properties', 'DEFAULT_GROUP', '', 'config.bcd=444', '4ad8367843a6494dd3bb6e67ad2f0930',
        '2022-09-11 05:26:24', '2022-09-11 05:26:24', NULL, '192.168.101.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 50, 'share2.properties', 'course-common', '', 'config.bcd=3344', '4c88cfceafce2fbf0dedf840a468fd8f',
        '2022-09-11 05:27:19', '2022-09-11 05:27:20', NULL, '192.168.101.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (39, 51, 'share1.properties', 'course-project', '', 'config.abc=123456789',
        'f0ec4adf094506e1263b8bceae3a0819', '2022-09-11 05:33:46', '2022-09-11 05:33:46', NULL, '192.168.101.1', 'D',
        '');
INSERT INTO `his_config_info`
VALUES (40, 52, 'share2.properties', 'course-project', '', 'config.bcd=987654321',
        'd9f88690146a19d7c070854f001592f2', '2022-09-11 05:33:46', '2022-09-11 05:33:46', NULL, '192.168.101.1', 'D',
        '');
INSERT INTO `his_config_info`
VALUES (45, 53, 'share3.properties', 'DEFAULT_GROUP', '', 'config.bcd=2233', '6a79021f8e25cf82829fe60677da680f',
        '2022-09-11 05:33:46', '2022-09-11 05:33:46', NULL, '192.168.101.1', 'D', '');
INSERT INTO `his_config_info`
VALUES (48, 54, 'share2.properties', 'course-common', '', 'config.bcd=3344', '4c88cfceafce2fbf0dedf840a468fd8f',
        '2022-09-11 05:34:01', '2022-09-11 05:34:01', NULL, '192.168.101.1', 'U', 'dev');
INSERT INTO `his_config_info`
VALUES (48, 55, 'share2.properties', 'course-common', '', 'config.bcd=3344\nconfig.abc=123',
        '5ab63c20ef3988a29d924dcfe5deb052', '2022-09-11 05:34:16', '2022-09-11 05:34:17', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (33, 56, 'system-service-dev.properties', 'course-project', '', 'config.abc=123',
        '930a682cad5b4c4549ea8be5eaa44355', '2022-09-11 05:35:23', '2022-09-11 05:35:23', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (48, 57, 'share2.properties', 'course-common', '', 'config.bcd=3344\nconfig.abc=a123',
        '5166f5fffbc21a5e7d998296675edd50', '2022-09-11 05:36:05', '2022-09-11 05:36:06', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (33, 58, 'system-service-dev.properties', 'course-project', '', 'config.abc=123\nconfig.bcd=a3344',
        'f93826b3b5b2588b261afaf37d6bc1d6', '2022-09-11 05:37:52', '2022-09-11 05:37:53', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (33, 59, 'system-service-dev.properties', 'course-project', '',
        'config.abc=123\nconfig.bcd=a3344\n#nacos上添加如下配置重启服务即可让我们的服务优先读取本地配置参数信息！\nspring.cloud.config.allow-override=true\nspring.cloud.config.override-none=true\nspring.cloud.config.override-system-properties=false\n',
        '1fe2b80607169974c5d7222af5f8eb5f', '2022-09-11 05:38:27', '2022-09-11 05:38:27', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (33, 60, 'system-service-dev.properties', 'course-project', '',
        'config.abc=123\nconfig.bcd=a3344\n#nacos上添加如下配置重启服务即可让我们的服务优先读取本地配置参数信息！\nspring.cloud.config.allow-override=true\n\n',
        'c450c7c94d89f6980365ea9d24a5d6bd', '2022-09-11 05:38:50', '2022-09-11 05:38:50', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (33, 61, 'system-service-dev.properties', 'course-project', '',
        'config.abc=123\nconfig.bcd=a3344\n#nacos上添加如下配置重启服务即可让我们的服务优先读取本地配置参数信息！\nspring.cloud.config.allow-override=true\nspring.cloud.config.override-none=true\n\n',
        'f512f9d17ce50753434d80d6a6f34435', '2022-09-11 05:39:29', '2022-09-11 05:39:29', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (33, 62, 'system-service-dev.properties', 'course-project', '',
        'config.abc=123\nconfig.bcd=a3344\n#nacos上添加如下配置重启服务即可让我们的服务优先读取本地配置参数信息！\n\nspring.cloud.config.override-none=true\n\n',
        '80688bec1915933ab075baeccc75aca2', '2022-09-11 05:40:00', '2022-09-11 05:40:01', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (48, 63, 'share2.properties', 'course-common', '', 'config.abc=a123\nconfig.bcd=3344',
        'efc90508c935ea6ea6747f5c08f30712', '2022-09-11 05:43:00', '2022-09-11 05:43:00', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (33, 64, 'system-service-dev.properties', 'course-project', '',
        'config.abc=123\nconfig.bcd=a3344\n#nacos上添加如下配置重启服务即可让我们的服务优先读取本地配置参数信息！\nspring.cloud.config.override-none=true\n\n',
        '0c58efbc9e7143b064f658b0de670d72', '2022-09-11 05:43:16', '2022-09-11 05:43:16', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (33, 65, 'system-service-dev.properties', 'course-project', '',
        'config.a=1a\nconfig.b=1b\nconfig.c=1c\n#nacos上添加如下配置重启服务即可让我们的服务优先读取本地配置参数信息！\nspring.cloud.config.override-none=true\n\n',
        'f3b72f82521940727249238c789e4798', '2022-09-11 05:43:32', '2022-09-11 05:43:33', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (48, 66, 'share2.properties', 'course-common', '', 'config.a=2a\nconfig.b=2b\nconfig.c=2c',
        'ac7e9676f668e919122fa9d182003390', '2022-09-11 05:43:46', '2022-09-11 05:43:46', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (33, 67, 'system-service-dev.properties', 'course-project', '',
        'config.a=1a\n\n#nacos上添加如下配置重启服务即可让我们的服务优先读取本地配置参数信息！\nspring.cloud.config.override-none=true\n\n',
        '3932439090ee818ed68efbec0b66a339', '2022-09-11 05:45:38', '2022-09-11 05:45:39', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (33, 68, 'system-service-dev.properties', 'course-project', '',
        'config.a=1a\n\n#配置本地优先\n#spring.cloud.config.override-none=true\n\n', '3a2323ba19b2bfa255651ce386e18ae7',
        '2022-09-11 05:58:19', '2022-09-11 05:58:19', NULL, '192.168.101.1', 'U', 'dev');
INSERT INTO `his_config_info`
VALUES (33, 69, 'system-service-dev.properties', 'course-project', '',
        'config.a=1a\n\n#配置本地优先\n#spring.cloud.config.override-none=true\n\n', '3a2323ba19b2bfa255651ce386e18ae7',
        '2022-09-11 05:59:16', '2022-09-11 05:59:16', NULL, '192.168.101.1', 'U', 'dev');
INSERT INTO `his_config_info`
VALUES (48, 70, 'share2.properties', 'course-common', '', 'config.a=2a\nconfig.b=2b\n',
        '6ab86976780105b2af48bbf8638a5098', '2022-09-11 05:59:24', '2022-09-11 05:59:25', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (33, 71, 'system-service-dev.properties', 'course-project', '',
        'testconfig.a=1a\n\n#配置本地优先\n#spring.cloud.config.override-none=true\n\n',
        'bddcd2bb9c29345b573090bd5eee8d0c', '2022-09-11 06:00:32', '2022-09-11 06:00:33', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (48, 72, 'share2.properties', 'course-common', '', 'testconfig.a=2a\ntestconfig.b=2b\n',
        'a50cb7a723c1dabd0f3195128d43296b', '2022-09-11 06:00:54', '2022-09-11 06:00:55', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (33, 73, 'system-service-dev.properties', 'course-project', '',
        'testconfig.a=1aa\n\n#配置本地优先\n#spring.cloud.config.override-none=true\n\n',
        'af55b2990b286b9bac19b19186601408', '2022-09-11 06:02:44', '2022-09-11 06:02:44', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (33, 74, 'system-service-dev.properties', 'course-project', '',
        'testconfig.a=1a\n\n#配置本地优先\n#spring.cloud.config.override-none=true\n\n',
        'bddcd2bb9c29345b573090bd5eee8d0c', '2022-09-11 06:08:32', '2022-09-11 06:08:32', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (48, 75, 'share2.properties', 'course-common', '', 'testconfig.a=2a\ntestconfig.b=2bb\n',
        'b8965a712849214518cfbfcf03b4a8f9', '2022-09-11 06:08:56', '2022-09-11 06:08:56', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (48, 76, 'share2.properties', 'course-common', '', 'testconfig.a=2a\ntestconfig.b=2b\n',
        'a50cb7a723c1dabd0f3195128d43296b', '2022-09-11 06:09:25', '2022-09-11 06:09:25', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (33, 77, 'system-service-dev.properties', 'course-project', '',
        'testconfig.a=1aa\n\n#配置本地优先\n#spring.cloud.config.override-none=true\n\n',
        'af55b2990b286b9bac19b19186601408', '2022-09-11 06:13:00', '2022-09-11 06:13:00', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (33, 78, 'system-service-dev.properties', 'course-project', '',
        'testconfig.a=1aa\nspring.datasource.url = jdbc:mysql://192.168.101.65:3306/xcplus_system?serverTimezone=UTC&userUnicode=true&useSSL=false&\n#配置本地优先\n#spring.cloud.config.override-none=true\n\n',
        'bdde3c8da9103293f2edb82e4794a749', '2022-09-11 06:13:17', '2022-09-11 06:13:17', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (33, 79, 'system-service-dev.properties', 'course-project', '',
        'testconfig.a=1aa\nspring.datasource.url = jdbc:mysql://192.168.101.65:3306/xcplusf_system?serverTimezone=UTC&userUnicode=true&useSSL=false&\n#配置本地优先\n#spring.cloud.config.override-none=true\n\n',
        '490c3f5a0bfa486a398be9c70ff074d9', '2022-09-11 06:14:12', '2022-09-11 06:14:12', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (33, 80, 'system-service-dev.properties', 'course-project', '',
        'testconfig.a=1aa\nspring.datasource.url = jdbc:mysql://192.168.101.65:3306/xcplus_system?serverTimezone=UTC&userUnicode=true&useSSL=false&\n#配置本地优先\n#spring.cloud.config.override-none=true\n\n',
        'bdde3c8da9103293f2edb82e4794a749', '2022-09-11 06:15:14', '2022-09-11 06:15:14', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (33, 81, 'system-service-dev.properties', 'course-project', '',
        'testconfig.a=1aa\nspring.datasource.url = jdbc:mysql://192.168.101.65:3306/xcplusf_system?serverTimezone=UTC&userUnicode=true&useSSL=false&\n#配置本地优先\n#spring.cloud.config.override-none=true\n\n',
        '490c3f5a0bfa486a398be9c70ff074d9', '2022-09-11 06:15:23', '2022-09-11 06:15:24', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 82, 'system-api-dev.properties', 'course-project', '',
        'server:\r\n  servlet:\r\n    context-path: /system\r\n  port: 63110', '16a8af56844eb4e80ab2a298329cef47',
        '2022-09-11 06:28:43', '2022-09-11 06:28:43', NULL, '192.168.101.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (33, 83, 'system-service-dev.properties', 'course-project', '',
        'testconfig.a=1aa\nspring.datasource.url = jdbc:mysql://192.168.101.65:3306/xcplus_system?serverTimezone=UTC&userUnicode=true&useSSL=false&\n#配置本地优先\n#spring.cloud.config.override-none=true\n\n',
        'bdde3c8da9103293f2edb82e4794a749', '2022-09-11 06:29:44', '2022-09-11 06:29:45', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (48, 84, 'share2.properties', 'course-common', '', 'testconfig.a=2a\ntestconfig.b=2b\ntestconfig.c=2c\n',
        'b58aea46c0ac570c94f8b15500683446', '2022-09-11 06:30:23', '2022-09-11 06:30:23', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 85, 'share2.yaml', 'course-common', '', 'testconfig:\r\n a: 2a\r\n b: 2b\r\n c: 2c',
        'bd5b8b530f4a4216390c7fc6e90d6611', '2022-09-11 06:31:24', '2022-09-11 06:31:25', NULL, '192.168.101.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (48, 86, 'share2.properties', 'course-common', '', 'testconfig:\n a: 2a\n b: 2b\n c: 2c',
        '9053c67093c4eedc3870a9e7b48e7c84', '2022-09-11 06:31:37', '2022-09-11 06:31:38', NULL, '192.168.101.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 87, 'system-service-dev.yaml', 'course-project', '',
        'testconfig:\r\n a: 1aa\r\n#配置本地优先\r\n#spring.cloud.config.override-none=true',
        '8c7673bf3e4b9ebe74a0ccb4c9926a97', '2022-09-11 06:32:14', '2022-09-11 06:32:14', NULL, '192.168.101.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (33, 88, 'system-service-dev.properties', 'course-project', '',
        'testconfig:\n a: 1aa\n#配置本地优先\n#spring.cloud.config.override-none=true\n\n',
        'e11e1c37437a47214bd269a40d28f59a', '2022-09-11 06:32:34', '2022-09-11 06:32:35', NULL, '192.168.101.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 89, 'system-api-dev.yaml', 'course-project', '',
        'server:\r\n  servlet:\r\n    context-path: /system\r\n  port: 63110', '16a8af56844eb4e80ab2a298329cef47',
        '2022-09-11 06:33:06', '2022-09-11 06:33:06', NULL, '192.168.101.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (77, 90, 'system-api-dev.properties', 'course-project', '',
        'server:\r\n  servlet:\r\n    context-path: /system\r\n  port: 63110', '16a8af56844eb4e80ab2a298329cef47',
        '2022-09-11 06:33:12', '2022-09-11 06:33:13', NULL, '192.168.101.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (82, 91, 'system-api-dev.yaml', 'course-project', '',
        'server:\r\n  servlet:\r\n    context-path: /system\r\n  port: 63110', '16a8af56844eb4e80ab2a298329cef47',
        '2022-09-11 06:37:16', '2022-09-11 06:37:16', NULL, '192.168.101.1', 'U', 'dev');
INSERT INTO `his_config_info`
VALUES (81, 92, 'system-service-dev.yaml', 'course-project', '',
        'testconfig:\r\n a: 1aa\r\n#配置本地优先\r\n#spring.cloud.config.override-none=true',
        '8c7673bf3e4b9ebe74a0ccb4c9926a97', '2022-09-11 06:38:43', '2022-09-11 06:38:44', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 93, 'content-service-dev.yaml', 'course-project', '',
        'spring:\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_content?serverTimezone=UTC&userUnicode=true&useSSL=false&\r\n    username: root\r\n    password: mysql',
        '3e4bcb48c13c3a1126b30c6a96815f8e', '2022-09-11 07:33:47', '2022-09-11 07:33:48', NULL, '192.168.101.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 94, 'content-api-dev.yaml', 'course-project', '',
        'server:\r\n  servlet:\r\n    context-path: /content\r\n  port: 63040\r\n#微服务配置\r\nspring:\r\n  cloud:\r\n\r\n\r\n# 日志文件配置路径\r\nlogging:\r\n  config: classpath:log4j2-dev.xml\r\n\r\n# swagger 文档配置\r\nswagger:\r\n  title: \"学成在线内容管理系统\"\r\n  description: \"内容系统管理系统对课程相关信息进行业务管理数据\"\r\n  base-package: com.course.content\r\n  enabled: true\r\n  version: 1.0.0\r\n',
        '466eb79d076733b5f91bab7763efa803', '2022-09-11 07:54:16', '2022-09-11 07:54:17', NULL, '192.168.101.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (86, 95, 'content-api-dev.yaml', 'course-project', '',
        'server:\r\n  servlet:\r\n    context-path: /content\r\n  port: 63040\r\n#微服务配置\r\nspring:\r\n  cloud:\r\n\r\n\r\n# 日志文件配置路径\r\nlogging:\r\n  config: classpath:log4j2-dev.xml\r\n\r\n# swagger 文档配置\r\nswagger:\r\n  title: \"学成在线内容管理系统\"\r\n  description: \"内容系统管理系统对课程相关信息进行业务管理数据\"\r\n  base-package: com.course.content\r\n  enabled: true\r\n  version: 1.0.0\r\n',
        '466eb79d076733b5f91bab7763efa803', '2022-09-11 07:54:47', '2022-09-11 07:54:48', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 96, 'swagger-dev.yaml', 'course-common', '',
        '# swagger 文档配置\r\nswagger:\r\n  title: \"学成在线内容管理系统\"\r\n  description: \"内容系统管理系统对课程相关信息进行业务管理数据\"\r\n  base-package: com.course\r\n  enabled: true\r\n  version: 1.0.0',
        'e8d2b4707b1ddfd26a385d62896ffd2f', '2022-09-11 08:14:16', '2022-09-11 08:14:16', NULL, '192.168.101.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (86, 97, 'content-api-dev.yaml', 'course-project', '',
        'server:\n  servlet:\n    context-path: /content\n  port: 63040\n\n# 日志文件配置路径\nlogging:\n  config: classpath:log4j2-dev.xml\n\n# swagger 文档配置\nswagger:\n  title: \"学成在线内容管理系统\"\n  description: \"内容系统管理系统对课程相关信息进行业务管理数据\"\n  base-package: com.course.content\n  enabled: true\n  version: 1.0.0\n',
        '9238a567bcbac52068aba89f5017ea52', '2022-09-11 08:14:48', '2022-09-11 08:14:49', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (86, 98, 'content-api-dev.yaml', 'course-project', '',
        'server:\n  servlet:\n    context-path: /content\n  port: 63040\n\n# 日志文件配置路径\nlogging:\n  config: classpath:log4j2-dev.xml\n\n\n',
        '573a4170a0e60d4d5b29a465a941599d', '2022-09-11 08:20:29', '2022-09-11 08:20:29', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 99, 'logging-dev.yaml', 'course-common', '',
        '# 日志文件配置路径\r\nlogging:\r\n  config: classpath:log4j2-dev.xml', '2612b6b904f330afacf6b0bf11813d31',
        '2022-09-11 08:22:11', '2022-09-11 08:22:12', NULL, '192.168.101.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (88, 100, 'swagger-dev.yaml', 'course-common', '',
        '# swagger 文档配置\r\nswagger:\r\n  title: \"学成在线内容管理系统\"\r\n  description: \"内容系统管理系统对课程相关信息进行业务管理数据\"\r\n  base-package: com.course\r\n  enabled: true\r\n  version: 1.0.0',
        'e8d2b4707b1ddfd26a385d62896ffd2f', '2022-09-11 08:43:41', '2022-09-11 08:43:42', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (88, 101, 'swagger-dev.yaml', 'course-common', '',
        '# swagger 文档配置\nswagger:\n  title: \"学成在线内容管理系统\"\n  description: \"内容系统管理系统对课程相关信息进行业务管理数据\"\n  base-package: com.course\n  enabled: true\n  version: 1.0.0\n\ntest_config:\n a: 1a\n b: 1b\n c: 1c\n d: 1d',
        '9c0d3be98c5a9ff620445bd718ea10ad', '2022-09-11 08:49:11', '2022-09-11 08:49:11', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (80, 102, 'share2.yaml', 'course-common', '', 'testconfig:\r\n a: 2a\r\n b: 2b\r\n c: 2c',
        'bd5b8b530f4a4216390c7fc6e90d6611', '2022-09-11 08:49:26', '2022-09-11 08:49:26', NULL, '192.168.101.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (85, 103, 'content-service-dev.yaml', 'course-project', '',
        'spring:\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_content?serverTimezone=UTC&userUnicode=true&useSSL=false&\r\n    username: root\r\n    password: mysql',
        '3e4bcb48c13c3a1126b30c6a96815f8e', '2022-09-11 08:50:48', '2022-09-11 08:50:49', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (86, 104, 'content-api-dev.yaml', 'course-project', '',
        'server:\n  servlet:\n    context-path: /content\n  port: 63040\n\n\n\n\n', 'f8f0fcc40cc0d8db4bf0d0739fa1e123',
        '2022-09-11 08:54:24', '2022-09-11 08:54:25', NULL, '192.168.101.1', 'U', 'dev');
INSERT INTO `his_config_info`
VALUES (81, 105, 'system-service-dev.yaml', 'course-project', '',
        'spring:\n  application:\n    name: content-service\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_system?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n\ntestconfig:\n a: 1aa\n#配置本地优先\n#spring.cloud.config.override-none=true',
        'fde702571414668a8fe7395669c47cbf', '2022-09-11 09:01:08', '2022-09-11 09:01:08', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (86, 106, 'content-api-dev.yaml', 'course-project', '',
        'server:\n  servlet:\n    context-path: /content\n  port: 63040\n\ntest_config:\n a: 3a\n b: 3b\n\n\n',
        '0cb27c11bf26561c4b60ca2c8166fbd9', '2022-09-11 09:01:40', '2022-09-11 09:01:41', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 107, 'media-api-dev.yaml', 'course-project', '',
        'server:\n  servlet:\n    context-path: /system\n  port: 63110\n\ntestconfig:\n a: 1aa',
        '08bc232c5164645dae080a8e0574cf27', '2022-09-11 09:12:03', '2022-09-11 09:12:03', NULL, '192.168.101.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 108, 'media-service-dev.yaml', 'course-project', '',
        'spring:\n  application:\n    name: content-service\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_system?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n\ntestconfig:\n a: 1aa\n',
        'ff657147c60d3773d31e3200671c9e12', '2022-09-11 09:12:30', '2022-09-11 09:12:30', NULL, '192.168.101.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (98, 109, 'media-api-dev.yaml', 'course-project', '',
        'server:\n  servlet:\n    context-path: /system\n  port: 63110\n\ntestconfig:\n a: 1aa',
        '08bc232c5164645dae080a8e0574cf27', '2022-09-11 09:12:52', '2022-09-11 09:12:52', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (99, 110, 'media-service-dev.yaml', 'course-project', '',
        'spring:\n  application:\n    name: content-service\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_system?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n\ntestconfig:\n a: 1aa\n',
        'ff657147c60d3773d31e3200671c9e12', '2022-09-11 09:13:26', '2022-09-11 09:13:27', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (81, 111, 'system-service-dev.yaml', 'course-project', '',
        'spring:\n  application:\n    name: content-service\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_system?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n\ntestconfig:\n a: 1aa\n',
        'ff657147c60d3773d31e3200671c9e12', '2022-09-11 09:13:38', '2022-09-11 09:13:39', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 112, 'gateway-dev.yaml', 'course-dev.yaml', '',
        'spring:\r\n  cloud:\r\n    gateway:\r\n#      filter:\r\n#        strip-prefix:\r\n#          enabled: true\r\n      routes: # 网关路由配置\r\n        - id: content-service # 路由id，自定义，只要唯一即可\r\n          # uri: http://127.0.0.1:8081 # 路由的目标地址 http就是固定地址\r\n          uri: lb://content-service # 路由的目标地址 lb就是负载均衡，后面跟服务名称\r\n          predicates: # 路由断言，也就是判断请求是否符合路由规则的条件\r\n            - Path=/content/** # 这个是按照路径匹配，只要以/content/开头就符合要求\r\n#          filters:\r\n#            - StripPrefix=1\r\n        - id: system-service\r\n          # uri: http://127.0.0.1:8081\r\n          uri: lb://system-service\r\n          predicates:\r\n            - Path=/system/**\r\n#          filters:\r\n#            - StripPrefix=1\r\n        - id: media-service\r\n          # uri: http://127.0.0.1:8081\r\n          uri: lb://media-service\r\n          predicates:\r\n            - Path=/media/**\r\n#          filters:\r\n#            - StripPrefix=1\r\n        - id: cache-service\r\n          # uri: http://127.0.0.1:8081\r\n          uri: lb://cache-service\r\n          predicates:\r\n            - Path=/cache/**\r\n#          filters:\r\n#            - StripPrefix=1',
        'a8621e7b762ff917b1de7ab8ebb8a87a', '2022-09-11 09:38:12', '2022-09-11 09:38:12', NULL, '192.168.101.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (103, 113, 'gateway-dev.yaml', 'course-dev.yaml', '',
        'spring:\r\n  cloud:\r\n    gateway:\r\n#      filter:\r\n#        strip-prefix:\r\n#          enabled: true\r\n      routes: # 网关路由配置\r\n        - id: content-service # 路由id，自定义，只要唯一即可\r\n          # uri: http://127.0.0.1:8081 # 路由的目标地址 http就是固定地址\r\n          uri: lb://content-service # 路由的目标地址 lb就是负载均衡，后面跟服务名称\r\n          predicates: # 路由断言，也就是判断请求是否符合路由规则的条件\r\n            - Path=/content/** # 这个是按照路径匹配，只要以/content/开头就符合要求\r\n#          filters:\r\n#            - StripPrefix=1\r\n        - id: system-service\r\n          # uri: http://127.0.0.1:8081\r\n          uri: lb://system-service\r\n          predicates:\r\n            - Path=/system/**\r\n#          filters:\r\n#            - StripPrefix=1\r\n        - id: media-service\r\n          # uri: http://127.0.0.1:8081\r\n          uri: lb://media-service\r\n          predicates:\r\n            - Path=/media/**\r\n#          filters:\r\n#            - StripPrefix=1\r\n        - id: cache-service\r\n          # uri: http://127.0.0.1:8081\r\n          uri: lb://cache-service\r\n          predicates:\r\n            - Path=/cache/**\r\n#          filters:\r\n#            - StripPrefix=1',
        'a8621e7b762ff917b1de7ab8ebb8a87a', '2022-09-11 09:38:44', '2022-09-11 09:38:44', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 114, 'gateway-dev.yaml', 'course-project', '',
        'server:\r\n  port: 63010 # 网关端口\r\nspring:\r\n  cloud:\r\n    gateway:\r\n#      filter:\r\n#        strip-prefix:\r\n#          enabled: true\r\n      routes: # 网关路由配置\r\n        - id: content-service # 路由id，自定义，只要唯一即可\r\n          # uri: http://127.0.0.1:8081 # 路由的目标地址 http就是固定地址\r\n          uri: lb://content-service # 路由的目标地址 lb就是负载均衡，后面跟服务名称\r\n          predicates: # 路由断言，也就是判断请求是否符合路由规则的条件\r\n            - Path=/content/** # 这个是按照路径匹配，只要以/content/开头就符合要求\r\n#          filters:\r\n#            - StripPrefix=1\r\n        - id: system-service\r\n          # uri: http://127.0.0.1:8081\r\n          uri: lb://system-service\r\n          predicates:\r\n            - Path=/system/**\r\n#          filters:\r\n#            - StripPrefix=1\r\n        - id: media-service\r\n          # uri: http://127.0.0.1:8081\r\n          uri: lb://media-service\r\n          predicates:\r\n            - Path=/media/**\r\n#          filters:\r\n#            - StripPrefix=1\r\n        - id: cache-service\r\n          # uri: http://127.0.0.1:8081\r\n          uri: lb://cache-service\r\n          predicates:\r\n            - Path=/cache/**\r\n#          filters:\r\n#            - StripPrefix=1',
        '22f7c167c60b3c99fed82fca81b2c967', '2022-09-11 09:46:12', '2022-09-11 09:46:12', NULL, '192.168.101.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (103, 115, 'gateway-dev.yaml', 'course-dev.yaml', '',
        'server:\n  port: 63010 # 网关端口\nspring:\n  cloud:\n    gateway:\n#      filter:\n#        strip-prefix:\n#          enabled: true\n      routes: # 网关路由配置\n        - id: content-service # 路由id，自定义，只要唯一即可\n          # uri: http://127.0.0.1:8081 # 路由的目标地址 http就是固定地址\n          uri: lb://content-service # 路由的目标地址 lb就是负载均衡，后面跟服务名称\n          predicates: # 路由断言，也就是判断请求是否符合路由规则的条件\n            - Path=/content/** # 这个是按照路径匹配，只要以/content/开头就符合要求\n#          filters:\n#            - StripPrefix=1\n        - id: system-service\n          # uri: http://127.0.0.1:8081\n          uri: lb://system-service\n          predicates:\n            - Path=/system/**\n#          filters:\n#            - StripPrefix=1\n        - id: media-service\n          # uri: http://127.0.0.1:8081\n          uri: lb://media-service\n          predicates:\n            - Path=/media/**\n#          filters:\n#            - StripPrefix=1\n        - id: cache-service\n          # uri: http://127.0.0.1:8081\n          uri: lb://cache-service\n          predicates:\n            - Path=/cache/**\n#          filters:\n#            - StripPrefix=1',
        'f1b4e3927ef2b872ee16807ce2c9a719', '2022-09-11 09:46:20', '2022-09-11 09:46:20', NULL, '192.168.101.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (105, 116, 'gateway-dev.yaml', 'course-project', '',
        'server:\r\n  port: 63010 # 网关端口\r\nspring:\r\n  cloud:\r\n    gateway:\r\n#      filter:\r\n#        strip-prefix:\r\n#          enabled: true\r\n      routes: # 网关路由配置\r\n        - id: content-service # 路由id，自定义，只要唯一即可\r\n          # uri: http://127.0.0.1:8081 # 路由的目标地址 http就是固定地址\r\n          uri: lb://content-service # 路由的目标地址 lb就是负载均衡，后面跟服务名称\r\n          predicates: # 路由断言，也就是判断请求是否符合路由规则的条件\r\n            - Path=/content/** # 这个是按照路径匹配，只要以/content/开头就符合要求\r\n#          filters:\r\n#            - StripPrefix=1\r\n        - id: system-service\r\n          # uri: http://127.0.0.1:8081\r\n          uri: lb://system-service\r\n          predicates:\r\n            - Path=/system/**\r\n#          filters:\r\n#            - StripPrefix=1\r\n        - id: media-service\r\n          # uri: http://127.0.0.1:8081\r\n          uri: lb://media-service\r\n          predicates:\r\n            - Path=/media/**\r\n#          filters:\r\n#            - StripPrefix=1\r\n        - id: cache-service\r\n          # uri: http://127.0.0.1:8081\r\n          uri: lb://cache-service\r\n          predicates:\r\n            - Path=/cache/**\r\n#          filters:\r\n#            - StripPrefix=1',
        '22f7c167c60b3c99fed82fca81b2c967', '2022-09-11 09:49:34', '2022-09-11 09:49:35', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (98, 117, 'media-api-dev.yaml', 'course-project', '',
        'server:\n  servlet:\n    context-path: /media\n  port: 63050\n', 'a88222c823efc4adef7beb0bf35dc85d',
        '2022-09-11 09:59:47', '2022-09-11 09:59:47', NULL, '192.168.101.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (99, 118, 'media-service-dev.yaml', 'course-project', '',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_media?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n\n',
        '6e3ffdcabe417a755d37c77847f4dbb2', '2022-09-11 09:59:47', '2022-09-11 09:59:47', NULL, '192.168.101.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 119, 'media-api-dev.yaml', 'course-project', '',
        'server:\n  servlet:\n    context-path: /media\n  port: 63050\n', 'a88222c823efc4adef7beb0bf35dc85d',
        '2022-09-11 10:05:29', '2022-09-11 10:05:29', NULL, '192.168.101.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 120, 'media-service-dev.yaml', 'course-project', '',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_media?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n\n',
        '6e3ffdcabe417a755d37c77847f4dbb2', '2022-09-11 10:05:29', '2022-09-11 10:05:29', NULL, '192.168.101.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (91, 121, 'logging-dev.yaml', 'course-common', '',
        '# 日志文件配置路径\r\nlogging:\r\n  config: classpath:log4j2-dev.xml', '2612b6b904f330afacf6b0bf11813d31',
        '2022-09-12 13:21:51', '2022-09-12 13:21:52', NULL, '192.168.101.1', 'U', 'dev');
INSERT INTO `his_config_info`
VALUES (107, 122, 'media-api-dev.yaml', 'course-project', '',
        'server:\n  servlet:\n    context-path: /media\n  port: 63050\n', 'a88222c823efc4adef7beb0bf35dc85d',
        '2022-09-12 14:06:04', '2022-09-12 14:06:04', NULL, '192.168.101.1', 'U', 'dev');
INSERT INTO `his_config_info`
VALUES (107, 123, 'media-api-dev.yaml', 'course-project', '',
        'server:\n  servlet:\n    context-path: /media\n  port: 63050\n\nminio:\n  endpoint: http://127.0.0.1:9000\n  accessKey: minioadmin\n  secretKey: minioadmin\n  bucket:\n    files: mediafilesbucket',
        '9ce5cedaf10d3c729d656f547f57906f', '2022-09-13 08:48:48', '2022-09-13 08:48:49', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (107, 124, 'media-api-dev.yaml', 'course-project', '',
        'server:\n  servlet:\n    context-path: /media\n  port: 63050\n\nminio:\n  endpoint: http://127.0.0.1:9000\n  accessKey: minioadmin\n  secretKey: minioadmin\n  bucket:\n    files: mediafilesbucket\n    bigfiles: mediabigfilesbucket',
        '1915f821f8242ff580585abf648e74e5', '2022-09-13 09:33:00', '2022-09-13 09:33:00', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (108, 125, 'media-service-dev.yaml', 'course-project', '',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_media?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n\n',
        '6e3ffdcabe417a755d37c77847f4dbb2', '2022-09-13 12:28:51', '2022-09-13 12:28:51', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (108, 126, 'media-service-dev.yaml', 'course-project', '',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_media?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n\nxxl:\n  job:\n    admin: addresses=http://localhost:8080/xxl-job-admin\n    executor:\n      appname: media-process-service\n      port: 9999\n      logpath: /data/applogs/xxl-job/jobhandler\n      logretentiondays: 30\n    accessToken: default_token\n\n',
        '58c1634ec72a5ee3d54e0411012c3605', '2022-09-13 12:45:30', '2022-09-13 12:45:31', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (108, 127, 'media-service-dev.yaml', 'course-project', '',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_media?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n\nxxl:\n  job:\n    admin: addresses=http://localhost:8080/xxl-job-admin\n    executor:\n      appname: media-process-service\n      port: 9999\n      logpath: /data/applogs/xxl-job/jobhandler\n      logretentiondays: 30\n    accessToken: default_token\n\n',
        '58c1634ec72a5ee3d54e0411012c3605', '2022-09-13 12:46:13', '2022-09-13 12:46:13', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (108, 128, 'media-service-dev.yaml', 'course-project', '',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_media?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n\nxxl:\n  job:\n    admin: \n      address: http://localhost:8080/xxl-job-admin\n    executor:\n      appname: media-process-service\n      port: 9999\n      logpath: /data/applogs/xxl-job/jobhandler\n      logretentiondays: 30\n    accessToken: default_token\n\n',
        '2e045b7b151a94c9b108af104e792fa9', '2022-09-13 12:47:44', '2022-09-13 12:47:45', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (108, 129, 'media-service-dev.yaml', 'course-project', '',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_media?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n\nxxl:\n  job:\n    admin: \n      address: http://localhost:8080/xxl-job-admin\n    executor:\n      appname: media-process-service\n      address: \n      ip: \n      port: 9999\n      logpath: /data/applogs/xxl-job/jobhandler\n      logretentiondays: 30\n    accessToken: default_token\n\n',
        '23579d6497ea840fb5f5c2f9e78df553', '2022-09-13 12:48:43', '2022-09-13 12:48:43', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (108, 130, 'media-service-dev.yaml', 'course-project', '',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_media?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n\nxxl:\n  job:\n    admin: \n      addresses: http://localhost:8080/xxl-job-admin\n    executor:\n      appname: media-process-service\n      address: \n      ip: \n      port: 9999\n      logpath: /data/applogs/xxl-job/jobhandler\n      logretentiondays: 30\n    accessToken: default_token\n\n',
        '7c62e2bcdb7f46dad9e7284f6967d884', '2022-09-13 13:22:59', '2022-09-13 13:23:00', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (108, 131, 'media-service-dev.yaml', 'course-project', '',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_media?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n\nxxl:\n  job:\n    admin: \n      addresses: http://localhost:8080/xxl-job-admin\n    executor:\n      appname: media-process-service\n      address: \n      ip: \n      port: 9999\n      logpath: /data/applogs/xxl-job/jobhandler\n      logretentiondays: 30\n    accessToken: default_token\n\n#配置本地优先\nspring:\n cloud:\n  config:\n    override-none: true',
        '3751467968e271b3709dc9d00d67159b', '2022-09-13 13:31:25', '2022-09-13 13:31:25', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (108, 132, 'media-service-dev.yaml', 'course-project', '',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_media?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n  cloud:\n   config:\n    override-none: true\n\nxxl:\n  job:\n    admin: \n      addresses: http://localhost:8080/xxl-job-admin\n    executor:\n      appname: media-process-service\n      address: \n      ip: \n      port: 9999\n      logpath: /data/applogs/xxl-job/jobhandler\n      logretentiondays: 30\n    accessToken: default_token\n\n',
        '82dd0655ff696ba2682142e1a25642d9', '2022-09-14 06:32:46', '2022-09-14 06:32:47', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 133, 'freemarker-config-dev.yaml', 'course-common', '',
        'spring:\r\n  freemarker:\r\n    enabled: true\r\n    cache: false   #关闭模板缓存，方便测试\r\n    settings:\r\n      template_update_delay: 0\r\n    suffix: .ftl   #页面模板后缀名\r\n    charset: UTF-8\r\n    template-loader-path: classpath:/templates/   #页面模板位置(默认为 classpath:/templates/)\r\n    resources:\r\n      add-mappings: false   #关闭项目中的静态资源映射(static、resources文件夹下的资源)\r\n    ',
        '8e97657f299e4a1a6158e8ebf4894e51', '2022-09-15 11:18:36', '2022-09-15 11:18:37', NULL, '192.168.101.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (107, 134, 'media-api-dev.yaml', 'course-project', '',
        'server:\n  servlet:\n    context-path: /media\n  port: 63050\n\nminio:\n  endpoint: http://127.0.0.1:9000\n  accessKey: minioadmin\n  secretKey: minioadmin\n  bucket:\n    files: mediafiles\n    videofiles: video',
        'f74f212391f03038e7ba73a2356b241d', '2022-09-17 05:26:19', '2022-09-17 05:26:20', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (108, 135, 'media-service-dev.yaml', 'course-project', '',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_media?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n  cloud:\n   config:\n    override-none: true\n\nxxl:\n  job:\n    admin: \n      addresses: http://localhost:8080/xxl-job-admin\n    executor:\n      appname: media-process-service\n      address: \n      ip: \n      port: 9999\n      logpath: /data/applogs/xxl-job/jobhandler\n      logretentiondays: 30\n    accessToken: default_token\n\nvideoprocess:\n ffmpegpath: D:/soft/ffmpeg/ffmpeg.exe',
        'da76198d1db05055b5bb13152577f689', '2022-09-17 05:26:31', '2022-09-17 05:26:32', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (108, 136, 'media-service-dev.yaml', 'course-project', '',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_media?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n  cloud:\n   config:\n    override-none: true\n\nxxl:\n  job:\n    admin: \n      addresses: http://localhost:8080/xxl-job-admin\n    executor:\n      appname: media-process-service\n      address: \n      ip: \n      port: 9999\n      logpath: /data/applogs/xxl-job/jobhandler\n      logretentiondays: 30\n    accessToken: default_token\n\nvideoprocess:\n ffmpegpath: D:/soft/ffmpeg/ffmpeg.exe\n\n minio:\n  endpoint: http://127.0.0.1:9000\n  accessKey: minioadmin\n  secretKey: minioadmin\n  bucket:\n    files: mediafiles\n    videofiles: video',
        'ed5f7d3f5e3f19521d09a0a6eca09142', '2022-09-18 03:56:26', '2022-09-18 03:56:26', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (108, 137, 'media-service-dev.yaml', 'course-project', '',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_media?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n  cloud:\n   config:\n    override-none: true\n\nxxl:\n  job:\n    admin: \n      addresses: http://localhost:8080/xxl-job-admin\n    executor:\n      appname: media-process-service\n      address: \n      ip: \n      port: 9999\n      logpath: /data/applogs/xxl-job/jobhandler\n      logretentiondays: 30\n    accessToken: default_token\n\nvideoprocess:\n ffmpegpath: D:/soft/ffmpeg/ffmpeg.exe\n\nminio:\n  endpoint: http://127.0.0.1:9000\n  accessKey: minioadmin\n  secretKey: minioadmin\n  bucket:\n    files: mediafiles\n    videofiles: video',
        '1444dd1dd4bae62dc7e13937fe5726ec', '2022-09-18 03:57:51', '2022-09-18 03:57:52', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (108, 138, 'media-service-dev.yaml', 'course-project', '',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_media?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n  cloud:\n   config:\n    override-none: true\n\nxxl:\n  job:\n    admin: \n      addresses: http://localhost:8080/xxl-job-admin\n    executor:\n      appname: media-process-service\n      address: \n      ip: \n      port: 9999\n      logpath: /data/applogs/xxl-job/jobhandler\n      logretentiondays: 30\n    accessToken: default_token\n\nvideoprocess:\n ffmpegpath: D:/soft/ffmpeg/ffmpeg.exe\n\nminio:\n  endpoint: http://192.168.101.65:9000\n  accessKey: minioadmin\n  secretKey: minioadmin\n  bucket:\n    files: mediafiles\n    videofiles: video',
        'c07dcd5c54658ea03abb92f8a71b3622', '2022-09-18 03:58:20', '2022-09-18 03:58:20', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (108, 139, 'media-service-dev.yaml', 'course-project', '',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_media?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n  cloud:\n   config:\n    override-none: true\n\nxxl:\n  job:\n    admin: \n      addresses: http://localhost:8080/xxl-job-admin\n    executor:\n      appname: media-process-service\n      address: \n      ip: \n      port: 9999\n      logpath: /data/applogs/xxl-job/jobhandler\n      logretentiondays: 30\n    accessToken: default_token\n\nvideoprocess:\n ffmpegpath: D:/soft/ffmpeg/ffmpeg.exe\n\nminio:\n  endpoint: http://192.168.101.65:9000\n  accessKey: minioadmin\n  secretKey: minioadmin\n  bucket:\n    files: mediafiles\n    videofiles: video',
        'c07dcd5c54658ea03abb92f8a71b3622', '2022-09-18 04:04:12', '2022-09-18 04:04:13', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (108, 140, 'media-service-dev.yaml', 'course-project', '',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_media?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n  cloud:\n   config:\n    override-none: true\n\nxxl:\n  job:\n    admin: \n      addresses: http://localhost:8080/xxl-job-admin\n    executor:\n      appname: media-process-service\n      address: \n      ip: \n      port: 9999\n      logpath: /data/applogs/xxl-job/jobhandler\n      logretentiondays: 30\n    accessToken: default_token\n\nvideoprocess:\n ffmpegpath: D:/soft/ffmpeg/ffmpeg.exe\n\nminio:\n  endpoint: http://192.168.101.65:9000\n  accessKey: minioadmin\n  secretKey: minioadmin\n  bucket:\n    files: mediafiles\n    videofiles: video',
        'c07dcd5c54658ea03abb92f8a71b3622', '2022-09-18 07:31:47', '2022-09-18 07:31:47', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (105, 141, 'gateway-dev.yaml', 'course-project', '',
        'server:\n  port: 63010 # 网关端口\nspring:\n  cloud:\n    gateway:\n#      filter:\n#        strip-prefix:\n#          enabled: true\n      routes: # 网关路由配置\n        - id: content-api # 路由id，自定义，只要唯一即可\n          # uri: http://127.0.0.1:8081 # 路由的目标地址 http就是固定地址\n          uri: lb://content-api # 路由的目标地址 lb就是负载均衡，后面跟服务名称\n          predicates: # 路由断言，也就是判断请求是否符合路由规则的条件\n            - Path=/content/** # 这个是按照路径匹配，只要以/content/开头就符合要求\n#          filters:\n#            - StripPrefix=1\n        - id: system-api\n          # uri: http://127.0.0.1:8081\n          uri: lb://system-api\n          predicates:\n            - Path=/system/**\n#          filters:\n#            - StripPrefix=1\n        - id: media-api\n          # uri: http://127.0.0.1:8081\n          uri: lb://media-api\n          predicates:\n            - Path=/media/**\n#          filters:\n#            - StripPrefix=1\n        - id: cache-service\n          # uri: http://127.0.0.1:8081\n          uri: lb://cache-service\n          predicates:\n            - Path=/cache/**\n#          filters:\n#            - StripPrefix=1',
        '7f6d6f1b9b561da3a47426dc8cd9e3bb', '2022-09-18 12:42:26', '2022-09-18 12:42:27', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (105, 142, 'gateway-dev.yaml', 'course-project', '',
        'server:\n  port: 63010 # 网关端口\nspring:\n  cloud:\n    gateway:\n#      filter:\n#        strip-prefix:\n#          enabled: true\n      routes: # 网关路由配置\n        - id: content-api # 路由id，自定义，只要唯一即可\n          # uri: http://127.0.0.1:8081 # 路由的目标地址 http就是固定地址\n          uri: lb://content-api # 路由的目标地址 lb就是负载均衡，后面跟服务名称\n          predicates: # 路由断言，也就是判断请求是否符合路由规则的条件\n            - Path=/content/** # 这个是按照路径匹配，只要以/content/开头就符合要求\n            - Path=/open/content/** \n#          filters:\n#            - StripPrefix=1\n        - id: system-api\n          # uri: http://127.0.0.1:8081\n          uri: lb://system-api\n          predicates:\n            - Path=/system/**\n#          filters:\n#            - StripPrefix=1\n        - id: media-api\n          # uri: http://127.0.0.1:8081\n          uri: lb://media-api\n          predicates:\n            - Path=/media/**\n#          filters:\n#            - StripPrefix=1\n        - id: cache-service\n          # uri: http://127.0.0.1:8081\n          uri: lb://cache-service\n          predicates:\n            - Path=/cache/**\n#          filters:\n#            - StripPrefix=1',
        '2ad435e9d270051bbba9c591a2b7d06c', '2022-09-18 12:43:26', '2022-09-18 12:43:27', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 143, 'message-service', 'course-project', '',
        'spring:\r\n   datasource:\r\n    druid:\r\n      stat-view-servlet:\r\n        enabled: true\r\n        loginUsername: admin\r\n        loginPassword: 123456\r\n    dynamic:\r\n      primary: content #设置默认的数据源或者数据源组,默认值即为master\r\n      strict: true #设置严格模式,默认false不启动. 启动后在未匹配到指定数据源时候回抛出异常,不启动会使用默认数据源.\r\n      druid:\r\n        initial-size: 3\r\n        max-active: 5\r\n        min-idle: 5\r\n        max-wait: 60000\r\n        pool-prepared-statements: true\r\n        max-pool-prepared-statement-per-connection-size: 20\r\n        time-between-eviction-runs-millis: 60000\r\n        min-evictable-idle-time-millis: 300000\r\n        validation-query: SELECT 1 FROM DUAL\r\n        test-while-idle: true\r\n        test-on-borrow: false\r\n        test-on-return: false\r\n        stat-view-servlet:\r\n          enabled: true\r\n          url-pattern: /druid/*\r\n          #login-username: admin\r\n          #login-password: admin\r\n        filter:\r\n          stat:\r\n            log-slow-sql: true\r\n            slow-sql-millis: 1000\r\n            merge-sql: true\r\n          wall:\r\n            config:\r\n              multi-statement-allow: true\r\n      datasource:\r\n        content:\r\n          url: jdbc:mysql://192.168.101.65:3306/xcplus_content?serverTimezone=UTC&allowMultiQueries=true&useUnicode=true&characterEncoding=UTF-8\r\n          username: root\r\n          password: mysql\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n        media:\r\n          url: jdbc:mysql://127.0.0.1:3306/xcplus_media?serverTimezone=UTC&allowMultiQueries=true&useUnicode=true&characterEncoding=UTF-8\r\n          username: root\r\n          password: mysql\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n\r\n',
        'fd7dd2e102ab66782aac52093d58f402', '2022-09-19 10:03:08', '2022-09-19 10:03:09', NULL, '192.168.101.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 144, 'message-service-dev.yaml', 'course-project', '',
        'spring:\r\n   datasource:\r\n    druid:\r\n      stat-view-servlet:\r\n        enabled: true\r\n        loginUsername: admin\r\n        loginPassword: 123456\r\n    dynamic:\r\n      primary: content #设置默认的数据源或者数据源组,默认值即为master\r\n      strict: true #设置严格模式,默认false不启动. 启动后在未匹配到指定数据源时候回抛出异常,不启动会使用默认数据源.\r\n      druid:\r\n        initial-size: 3\r\n        max-active: 5\r\n        min-idle: 5\r\n        max-wait: 60000\r\n        pool-prepared-statements: true\r\n        max-pool-prepared-statement-per-connection-size: 20\r\n        time-between-eviction-runs-millis: 60000\r\n        min-evictable-idle-time-millis: 300000\r\n        validation-query: SELECT 1 FROM DUAL\r\n        test-while-idle: true\r\n        test-on-borrow: false\r\n        test-on-return: false\r\n        stat-view-servlet:\r\n          enabled: true\r\n          url-pattern: /druid/*\r\n          #login-username: admin\r\n          #login-password: admin\r\n        filter:\r\n          stat:\r\n            log-slow-sql: true\r\n            slow-sql-millis: 1000\r\n            merge-sql: true\r\n          wall:\r\n            config:\r\n              multi-statement-allow: true\r\n      datasource:\r\n        content:\r\n          url: jdbc:mysql://192.168.101.65:3306/xcplus_content?serverTimezone=UTC&allowMultiQueries=true&useUnicode=true&characterEncoding=UTF-8\r\n          username: root\r\n          password: mysql\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n        media:\r\n          url: jdbc:mysql://127.0.0.1:3306/xcplus_media?serverTimezone=UTC&allowMultiQueries=true&useUnicode=true&characterEncoding=UTF-8\r\n          username: root\r\n          password: mysql\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n\r\n',
        'fd7dd2e102ab66782aac52093d58f402', '2022-09-19 10:22:10', '2022-09-19 10:22:11', NULL, '192.168.101.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (131, 145, 'message-service', 'course-project', '',
        'spring:\r\n   datasource:\r\n    druid:\r\n      stat-view-servlet:\r\n        enabled: true\r\n        loginUsername: admin\r\n        loginPassword: 123456\r\n    dynamic:\r\n      primary: content #设置默认的数据源或者数据源组,默认值即为master\r\n      strict: true #设置严格模式,默认false不启动. 启动后在未匹配到指定数据源时候回抛出异常,不启动会使用默认数据源.\r\n      druid:\r\n        initial-size: 3\r\n        max-active: 5\r\n        min-idle: 5\r\n        max-wait: 60000\r\n        pool-prepared-statements: true\r\n        max-pool-prepared-statement-per-connection-size: 20\r\n        time-between-eviction-runs-millis: 60000\r\n        min-evictable-idle-time-millis: 300000\r\n        validation-query: SELECT 1 FROM DUAL\r\n        test-while-idle: true\r\n        test-on-borrow: false\r\n        test-on-return: false\r\n        stat-view-servlet:\r\n          enabled: true\r\n          url-pattern: /druid/*\r\n          #login-username: admin\r\n          #login-password: admin\r\n        filter:\r\n          stat:\r\n            log-slow-sql: true\r\n            slow-sql-millis: 1000\r\n            merge-sql: true\r\n          wall:\r\n            config:\r\n              multi-statement-allow: true\r\n      datasource:\r\n        content:\r\n          url: jdbc:mysql://192.168.101.65:3306/xcplus_content?serverTimezone=UTC&allowMultiQueries=true&useUnicode=true&characterEncoding=UTF-8\r\n          username: root\r\n          password: mysql\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n        media:\r\n          url: jdbc:mysql://127.0.0.1:3306/xcplus_media?serverTimezone=UTC&allowMultiQueries=true&useUnicode=true&characterEncoding=UTF-8\r\n          username: root\r\n          password: mysql\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n\r\n',
        'fd7dd2e102ab66782aac52093d58f402', '2022-09-19 10:22:16', '2022-09-19 10:22:16', NULL, '192.168.101.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (132, 146, 'message-service-dev.yaml', 'course-project', '',
        'spring:\r\n   datasource:\r\n    druid:\r\n      stat-view-servlet:\r\n        enabled: true\r\n        loginUsername: admin\r\n        loginPassword: 123456\r\n    dynamic:\r\n      primary: content #设置默认的数据源或者数据源组,默认值即为master\r\n      strict: true #设置严格模式,默认false不启动. 启动后在未匹配到指定数据源时候回抛出异常,不启动会使用默认数据源.\r\n      druid:\r\n        initial-size: 3\r\n        max-active: 5\r\n        min-idle: 5\r\n        max-wait: 60000\r\n        pool-prepared-statements: true\r\n        max-pool-prepared-statement-per-connection-size: 20\r\n        time-between-eviction-runs-millis: 60000\r\n        min-evictable-idle-time-millis: 300000\r\n        validation-query: SELECT 1 FROM DUAL\r\n        test-while-idle: true\r\n        test-on-borrow: false\r\n        test-on-return: false\r\n        stat-view-servlet:\r\n          enabled: true\r\n          url-pattern: /druid/*\r\n          #login-username: admin\r\n          #login-password: admin\r\n        filter:\r\n          stat:\r\n            log-slow-sql: true\r\n            slow-sql-millis: 1000\r\n            merge-sql: true\r\n          wall:\r\n            config:\r\n              multi-statement-allow: true\r\n      datasource:\r\n        content:\r\n          url: jdbc:mysql://192.168.101.65:3306/xcplus_content?serverTimezone=UTC&allowMultiQueries=true&useUnicode=true&characterEncoding=UTF-8\r\n          username: root\r\n          password: mysql\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n        media:\r\n          url: jdbc:mysql://127.0.0.1:3306/xcplus_media?serverTimezone=UTC&allowMultiQueries=true&useUnicode=true&characterEncoding=UTF-8\r\n          username: root\r\n          password: mysql\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n\r\n',
        'fd7dd2e102ab66782aac52093d58f402', '2022-09-19 10:25:16', '2022-09-19 10:25:17', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 147, 'rabbitmq-dev.yaml', 'course-common', '',
        'spring:\r\n   rabbitmq:\r\n    host: 192.168.101.65\r\n    port: 5672\r\n    username: guest\r\n    password: guest\r\n    virtual-host: /\r\n    publisher-confirm-type: correlated #correlated 异步回调，定义ConfirmCallback，MQ返回结果时会回调这个ConfirmCallback\r\n    publisher-returns: true #开启publish-return功能，同样是基于callback机制，需要定义ReturnCallback\r\n    template:\r\n        mandatory: true #定义消息路由失败时的策略。true，则调用ReturnCallback；false：则直接丢弃消息\r\n    listener:\r\n        simple:\r\n        acknowledge-mode: auto #出现异常时返回nack，消息回滚到mq；没有异常，返回ack\r\n        retry:\r\n            enabled: true #开启消费者失败重试\r\n            initial-interval: 100ms #初识的失败等待时长为1秒\r\n            multiplier: 1 #失败的等待时长倍数，下次等待时长 = multiplier * last-interval\r\n            max-attempts: 3 #最大重试次数\r\n            stateless: true #true无状态；false有状态。如果业务中包含事务，这里改为false',
        '8d81e5e091bd4468eb9c9a344ee01e64', '2022-09-20 02:42:44', '2022-09-20 02:42:44', NULL, '192.168.101.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (134, 148, 'rabbitmq-dev.yaml', 'course-common', '',
        'spring:\r\n   rabbitmq:\r\n    host: 192.168.101.65\r\n    port: 5672\r\n    username: guest\r\n    password: guest\r\n    virtual-host: /\r\n    publisher-confirm-type: correlated #correlated 异步回调，定义ConfirmCallback，MQ返回结果时会回调这个ConfirmCallback\r\n    publisher-returns: true #开启publish-return功能，同样是基于callback机制，需要定义ReturnCallback\r\n    template:\r\n        mandatory: true #定义消息路由失败时的策略。true，则调用ReturnCallback；false：则直接丢弃消息\r\n    listener:\r\n        simple:\r\n        acknowledge-mode: auto #出现异常时返回nack，消息回滚到mq；没有异常，返回ack\r\n        retry:\r\n            enabled: true #开启消费者失败重试\r\n            initial-interval: 100ms #初识的失败等待时长为1秒\r\n            multiplier: 1 #失败的等待时长倍数，下次等待时长 = multiplier * last-interval\r\n            max-attempts: 3 #最大重试次数\r\n            stateless: true #true无状态；false有状态。如果业务中包含事务，这里改为false',
        '8d81e5e091bd4468eb9c9a344ee01e64', '2022-09-20 02:55:15', '2022-09-20 02:55:15', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (134, 149, 'rabbitmq-dev.yaml', 'course-common', '',
        'spring:\n    rabbitmq:\n        host: 192.168.101.65\n        port: 5672\n        username: guest\n        password: guest\n        virtual-host: /\n    ',
        '631193c61fecc73dc5493b8543886e26', '2022-09-20 02:56:30', '2022-09-20 02:56:30', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (134, 150, 'rabbitmq-dev.yaml', 'course-common', '',
        'spring:\n rabbitmq:\n  host: 192.168.101.65\n  port: 5672\n  username: guest\n  password: guest\n  virtual-host: /\n',
        '9d6fa9c56b1104c5c5332bd4cbd5e9e5', '2022-09-20 02:57:41', '2022-09-20 02:57:41', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (134, 151, 'rabbitmq-dev.yaml', 'course-common', '',
        'spring:\n  rabbitmq:\n    host: 192.168.101.65\n    port: 5672\n    username: guest\n    password: guest\n    virtual-host: /\n',
        'e6616d867e234f36d32df2cb8525265d', '2022-09-20 05:06:41', '2022-09-20 05:06:42', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (134, 152, 'rabbitmq-dev.yaml', 'course-common', '',
        'spring:\n  rabbitmq:\n    host: 192.168.101.65\n    port: 5672\n    username: guest\n    password: guest\n    virtual-host: /\n    publisher-confirm-type: correlated #correlated 异步回调，定义ConfirmCallback，MQ返回结果时会回调这个ConfirmCallback\n    publisher-returns: false #开启publish-return功能，同样是基于callback机制，需要定义ReturnCallback\n    template:\n      mandatory: false #定义消息路由失败时的策略。true，则调用ReturnCallback；false：则直接丢弃消息\n    listener:\n      simple:\n        acknowledge-mode: auto #出现异常时返回nack，消息回滚到mq；没有异常，返回ack\n        retry:\n          enabled: false #开启消费者失败重试\n          initial-interval: 100ms #初识的失败等待时长为1秒\n          multiplier: 1 #失败的等待时长倍数，下次等待时长 = multiplier * last-interval\n          max-attempts: 3 #最大重试次数\n          stateless: true #true无状态；false有状态。如果业务中包含事务，这里改为false',
        '0e222d901979cd7dd67c5e29f51fdf09', '2022-09-20 05:09:25', '2022-09-20 05:09:26', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (134, 153, 'rabbitmq-dev.yaml', 'course-common', '',
        'spring:\n  rabbitmq:\n    host: 192.168.101.65\n    port: 5672\n    username: guest\n    password: guest\n    virtual-host: /\n    publisher-confirm-type: correlated #correlated 异步回调，定义ConfirmCallback，MQ返回结果时会回调这个ConfirmCallback\n    publisher-returns: false #开启publish-return功能，同样是基于callback机制，需要定义ReturnCallback\n    template:\n      mandatory: false #定义消息路由失败时的策略。true，则调用ReturnCallback；false：则直接丢弃消息\n    listener:\n      simple:\n        acknowledge-mode: auto #出现异常时返回unack，消息回滚到mq；没有异常，返回ack\n        retry:\n          enabled: false #开启消费者失败重试\n          initial-interval: 100ms #初识的失败等待时长为1秒\n          multiplier: 1 #失败的等待时长倍数，下次等待时长 = multiplier * last-interval\n          max-attempts: 3 #最大重试次数\n          stateless: true #true无状态；false有状态。如果业务中包含事务，这里改为false',
        'cff78d578a951f3bbfaa4c026807faa5', '2022-09-20 05:13:06', '2022-09-20 05:13:06', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (134, 154, 'rabbitmq-dev.yaml', 'course-common', '',
        'spring:\n  rabbitmq:\n    host: 192.168.101.65\n    port: 5672\n    username: guest\n    password: guest\n    virtual-host: /\n    publisher-confirm-type: correlated #correlated 异步回调，定义ConfirmCallback，MQ返回结果时会回调这个ConfirmCallback\n    publisher-returns: false #开启publish-return功能，同样是基于callback机制，需要定义ReturnCallback\n    template:\n      mandatory: false #定义消息路由失败时的策略。true，则调用ReturnCallback；false：则直接丢弃消息\n    listener:\n      simple:\n        acknowledge-mode: none #出现异常时返回unack，消息回滚到mq；没有异常，返回ack ,另外选项：manual,none\n        retry:\n          enabled: false #开启消费者失败重试\n          initial-interval: 100ms #初识的失败等待时长为1秒\n          multiplier: 1 #失败的等待时长倍数，下次等待时长 = multiplier * last-interval\n          max-attempts: 3 #最大重试次数\n          stateless: true #true无状态；false有状态。如果业务中包含事务，这里改为false',
        '82f4c592600ea1ef08771f44dde366f7', '2022-09-20 05:15:00', '2022-09-20 05:15:00', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (134, 155, 'rabbitmq-dev.yaml', 'course-common', '',
        'spring:\n  rabbitmq:\n    host: 192.168.101.65\n    port: 5672\n    username: guest\n    password: guest\n    virtual-host: /\n    publisher-confirm-type: correlated #correlated 异步回调，定义ConfirmCallback，MQ返回结果时会回调这个ConfirmCallback\n    publisher-returns: false #开启publish-return功能，同样是基于callback机制，需要定义ReturnCallback\n    template:\n      mandatory: false #定义消息路由失败时的策略。true，则调用ReturnCallback；false：则直接丢弃消息\n    listener:\n      simple:\n        acknowledge-mode: none #出现异常时返回unack，消息回滚到mq；没有异常，返回ack ,manual:手动控制,none:丢弃消息，不回滚到mq\n        retry:\n          enabled: false #开启消费者失败重试\n          initial-interval: 100ms #初识的失败等待时长为1秒\n          multiplier: 1 #失败的等待时长倍数，下次等待时长 = multiplier * last-interval\n          max-attempts: 3 #最大重试次数\n          stateless: true #true无状态；false有状态。如果业务中包含事务，这里改为false',
        '30965a14b9de139a81990844fd43c10b', '2022-09-20 05:16:12', '2022-09-20 05:16:13', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (134, 156, 'rabbitmq-dev.yaml', 'course-common', '',
        'spring:\n  rabbitmq:\n    host: 192.168.101.65\n    port: 5672\n    username: guest\n    password: guest\n    virtual-host: /\n    publisher-confirm-type: correlated #correlated 异步回调，定义ConfirmCallback，MQ返回结果时会回调这个ConfirmCallback\n    publisher-returns: false #开启publish-return功能，同样是基于callback机制，需要定义ReturnCallback\n    template:\n      mandatory: false #定义消息路由失败时的策略。true，则调用ReturnCallback；false：则直接丢弃消息\n    listener:\n      simple:\n        acknowledge-mode: none #出现异常时返回unack，消息回滚到mq；没有异常，返回ack ,manual:手动控制,none:丢弃消息，不回滚到mq\n        retry:\n          enabled: false #开启消费者失败重试\n          initial-interval: 1000ms #初识的失败等待时长为1秒\n          multiplier: 1 #失败的等待时长倍数，下次等待时长 = multiplier * last-interval\n          max-attempts: 3 #最大重试次数\n          stateless: true #true无状态；false有状态。如果业务中包含事务，这里改为false',
        '0e1ce19712764ccf24927092fe9c2812', '2022-09-20 05:16:25', '2022-09-20 05:16:25', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (134, 157, 'rabbitmq-dev.yaml', 'course-common', '',
        'spring:\n  rabbitmq:\n    host: 192.168.101.65\n    port: 5672\n    username: guest\n    password: guest\n    virtual-host: /\n    publisher-confirm-type: correlated #correlated 异步回调，定义ConfirmCallback，MQ返回结果时会回调这个ConfirmCallback\n    publisher-returns: false #开启publish-return功能，同样是基于callback机制，需要定义ReturnCallback\n    template:\n      mandatory: false #定义消息路由失败时的策略。true，则调用ReturnCallback；false：则直接丢弃消息\n    listener:\n      simple:\n        acknowledge-mode: none #出现异常时返回unack，消息回滚到mq；没有异常，返回ack ,manual:手动控制,none:丢弃消息，不回滚到mq\n        retry:\n          enabled: true #开启消费者失败重试\n          initial-interval: 1000ms #初识的失败等待时长为1秒\n          multiplier: 1 #失败的等待时长倍数，下次等待时长 = multiplier * last-interval\n          max-attempts: 3 #最大重试次数\n          stateless: true #true无状态；false有状态。如果业务中包含事务，这里改为false',
        '5317328f096056da311907e93f6cc075', '2022-09-20 05:26:56', '2022-09-20 05:26:56', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 158, 'feign-dev.yaml', 'course-common', '',
        'feign:\r\n  client:\r\n    config:\r\n      default: # default全局的配置\r\n        loggerLevel: BASIC # 日志级别，BASIC就是基本的请求和响应信息\r\n  httpclient:\r\n    enabled: true # 开启feign对HttpClient的支持\r\n    max-connections: 200 # 最大的连接数\r\n    max-connections-per-route: 50 # 每个路径的最大连接数',
        '651f5f5504138b97c462b1715da3b781', '2022-09-20 11:59:29', '2022-09-20 11:59:29', NULL, '192.168.101.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (108, 159, 'media-service-dev.yaml', 'course-project', '',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_media?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n  cloud:\n   config:\n    override-none: true\n\nminio:\n  endpoint: http://192.168.101.65:9000\n  accessKey: minioadmin\n  secretKey: minioadmin\n  bucket:\n    files: mediafiles\n    videofiles: video\nxxl:\n  job:\n    admin: \n      addresses: http://localhost:8080/xxl-job-admin\n    executor:\n      appname: media-process-service\n      address: \n      ip: \n      port: 9999\n      logpath: /data/applogs/xxl-job/jobhandler\n      logretentiondays: 30\n    accessToken: default_token\n\nvideoprocess:\n ffmpegpath: D:/soft/ffmpeg/ffmpeg.exe\n\n',
        '131d9117673bad46085d4132f536180b', '2022-09-22 02:38:54', '2022-09-22 02:38:55', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (85, 160, 'content-service-dev.yaml', 'course-project', '',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_content?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n\ntest_config:\n a: 2a\n b: 2b\n c: 2c',
        '72a1a9c34652b1815e5b9034dc9da814', '2022-09-22 02:40:01', '2022-09-22 02:40:01', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (85, 161, 'content-service-dev.yaml', 'course-project', '',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_content?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n\nxxl:\n  job:\n    admin: \n      addresses: http://localhost:8088/xxl-job-admin\n    executor:\n      appname: coursepublish-job\n      address: \n      ip: \n      port: 89999\n      logpath: /data/applogs/xxl-job/jobhandler\n      logretentiondays: 30\n    accessToken: default_token\ntest_config:\n a: 2a\n b: 2b\n c: 2c',
        '2f298f6028c625e10faa716686174dee', '2022-09-22 03:03:22', '2022-09-22 03:03:23', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (85, 162, 'content-service-dev.yaml', 'course-project', '',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_content?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n\nxxl:\n  job:\n    admin: \n      addresses: http://localhost:8088/xxl-job-admin\n    executor:\n      appname: coursepublish-job\n      address: \n      ip: \n      port: 8999\n      logpath: /data/applogs/xxl-job/jobhandler\n      logretentiondays: 30\n    accessToken: default_token\ntest_config:\n a: 2a\n b: 2b\n c: 2c',
        'baeb4156a1a0108058ecbe43ba2332bf', '2022-09-22 03:09:05', '2022-09-22 03:09:05', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (85, 163, 'content-service-dev.yaml', 'course-project', '',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_content?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n\nxxl:\n  job:\n    admin: \n      addresses: http://192.168.101.65:8088/xxl-job-admin\n    executor:\n      appname: coursepublish-job\n      address: \n      ip: \n      port: 8999\n      logpath: /data/applogs/xxl-job/jobhandler\n      logretentiondays: 30\n    accessToken: default_token\ntest_config:\n a: 2a\n b: 2b\n c: 2c',
        '1ef8a88991220e3dfd68d53e33ceb3a8', '2022-09-22 03:09:25', '2022-09-22 03:09:26', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (108, 164, 'media-service-dev.yaml', 'course-project', '',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_media?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n  cloud:\n   config:\n    override-none: true\n\nminio:\n  endpoint: http://192.168.101.65:9000\n  accessKey: minioadmin\n  secretKey: minioadmin\n  bucket:\n    files: mediafiles\n    videofiles: video\nxxl:\n  job:\n    admin: \n      addresses: http://localhost:8088/xxl-job-admin\n    executor:\n      appname: media-process-service\n      address: \n      ip: \n      port: 9999\n      logpath: /data/applogs/xxl-job/jobhandler\n      logretentiondays: 30\n    accessToken: default_token\n\nvideoprocess:\n ffmpegpath: D:/soft/ffmpeg/ffmpeg.exe\n\n',
        '2f37e9a243ae57700c8d57f170db95a9', '2022-09-22 03:10:03', '2022-09-22 03:10:04', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 165, 'search-dev.yaml', 'course-project', '',
        'server:\r\n  servlet:\r\n    context-path: /content\r\n  port: 63080', 'eac5ae08a31e93eda7147d0ee0bef0a5',
        '2022-09-24 12:58:14', '2022-09-24 12:58:14', NULL, '192.168.101.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (152, 166, 'search-dev.yaml', 'course-project', '',
        'server:\r\n  servlet:\r\n    context-path: /content\r\n  port: 63080', 'eac5ae08a31e93eda7147d0ee0bef0a5',
        '2022-09-24 14:51:34', '2022-09-24 14:51:34', NULL, '192.168.101.1', 'U', 'dev');
INSERT INTO `his_config_info`
VALUES (152, 167, 'search-dev.yaml', 'course-project', '',
        'server:\n  servlet:\n    context-path: /content\n  port: 63080\n\nelasticsearch:\n  hostlist: 192.168.101.65:9200 #多个结点中间用逗号分隔\n  course:\n    index: course-publish',
        '699bfe4a79d2de7462694afab140131b', '2022-09-25 02:05:48', '2022-09-25 02:05:49', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (152, 168, 'search-dev.yaml', 'course-project', '',
        'server:\n  servlet:\n    context-path: /search\n  port: 63080\n\nelasticsearch:\n  hostlist: 192.168.101.65:9200 #多个结点中间用逗号分隔\n  course:\n    index: course-publish',
        '93542472d79de4fd06e0e5125c69dc1e', '2022-09-25 02:37:03', '2022-09-25 02:37:04', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (152, 169, 'search-dev.yaml', 'course-project', '',
        'server:\n  servlet:\n    context-path: /search\n  port: 63080\n\nelasticsearch:\n  hostlist: 192.168.101.65:9200 #多个结点中间用逗号分隔\n  course:\n    index: course-publish\n    source_field: id,name,grade,mt,st,charge,pic,price,originalPrice,teachmode,validDays,createDate',
        '21339cb81d3bb4208f2c0a3b2cb90887', '2022-09-25 02:38:46', '2022-09-25 02:38:46', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (105, 170, 'gateway-dev.yaml', 'course-project', '',
        'server:\n  port: 63010 # 网关端口\nspring:\n  cloud:\n    gateway:\n#      filter:\n#        strip-prefix:\n#          enabled: true\n      routes: # 网关路由配置\n        - id: content-api # 路由id，自定义，只要唯一即可\n          # uri: http://127.0.0.1:8081 # 路由的目标地址 http就是固定地址\n          uri: lb://content-api # 路由的目标地址 lb就是负载均衡，后面跟服务名称\n          predicates: # 路由断言，也就是判断请求是否符合路由规则的条件\n            - Path=/content/** # 这个是按照路径匹配，只要以/content/开头就符合要求\n#          filters:\n#            - StripPrefix=1\n        - id: system-api\n          # uri: http://127.0.0.1:8081\n          uri: lb://system-api\n          predicates:\n            - Path=/system/**\n#          filters:\n#            - StripPrefix=1\n        - id: media-api\n          # uri: http://127.0.0.1:8081\n          uri: lb://media-api\n          predicates:\n            - Path=/media/**\n#          filters:\n#            - StripPrefix=1\n        - id: cache-service\n          # uri: http://127.0.0.1:8081\n          uri: lb://cache-service\n          predicates:\n            - Path=/cache/**\n#          filters:\n#            - StripPrefix=1',
        '7f6d6f1b9b561da3a47426dc8cd9e3bb', '2022-09-25 03:34:56', '2022-09-25 03:34:56', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 171, 'auth-service-dev.yaml', 'course-project', '',
        'server:\r\n  servlet:\r\n    context-path: /\r\n  port: 63070', '370a94543114572c51467cfdb8640ce7',
        '2022-09-26 12:41:48', '2022-09-26 12:41:48', NULL, '192.168.101.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (158, 172, 'auth-service-dev.yaml', 'course-project', '',
        'server:\r\n  servlet:\r\n    context-path: /\r\n  port: 63070', '370a94543114572c51467cfdb8640ce7',
        '2022-09-28 10:12:12', '2022-09-28 10:12:13', NULL, '192.168.101.1', 'U', 'dev');
INSERT INTO `his_config_info`
VALUES (158, 173, 'auth-service-dev.yaml', 'course-project', '',
        'server:\n  servlet:\n    context-path: /\n  port: 63070\nspring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_user?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql',
        'bea7167025f26106339bf78144a4d2d6', '2022-09-28 10:13:38', '2022-09-28 10:13:38', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (105, 174, 'gateway-dev.yaml', 'course-project', '',
        'server:\n  port: 63010 # 网关端口\nspring:\n  cloud:\n    gateway:\n#      filter:\n#        strip-prefix:\n#          enabled: true\n      routes: # 网关路由配置\n        - id: content-api # 路由id，自定义，只要唯一即可\n          # uri: http://127.0.0.1:8081 # 路由的目标地址 http就是固定地址\n          uri: lb://content-api # 路由的目标地址 lb就是负载均衡，后面跟服务名称\n          predicates: # 路由断言，也就是判断请求是否符合路由规则的条件\n            - Path=/content/** # 这个是按照路径匹配，只要以/content/开头就符合要求\n#          filters:\n#            - StripPrefix=1\n        - id: system-api\n          # uri: http://127.0.0.1:8081\n          uri: lb://system-api\n          predicates:\n            - Path=/system/**\n#          filters:\n#            - StripPrefix=1\n        - id: media-api\n          # uri: http://127.0.0.1:8081\n          uri: lb://media-api\n          predicates:\n            - Path=/media/**\n#          filters:\n#            - StripPrefix=1\n        - id: search-service\n          # uri: http://127.0.0.1:8081\n          uri: lb://search\n          predicates:\n            - Path=/search/**\n#          filters:\n#            - StripPrefix=1',
        '4fc5597ecfcf5b60d98e116a9dce4fff', '2022-09-28 14:55:49', '2022-09-28 14:55:49', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (158, 175, 'auth-service-dev.yaml', 'course-project', '',
        'server:\n  servlet:\n    context-path: /\n  port: 63070\nspring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_users?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql',
        'eb3d54eff78bdf7a55a7bf0841eef3f9', '2022-09-28 14:56:18', '2022-09-28 14:56:18', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 176, 'checkcode-dev.yaml', 'course-project', '',
        'server:\r\n  servlet:\r\n    context-path: /checkcode\r\n  port: 63075', '6033e8fd9f084a4e0019db05d6dc061e',
        '2022-09-29 05:46:43', '2022-09-29 05:46:44', NULL, '192.168.101.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (105, 177, 'gateway-dev.yaml', 'course-project', '',
        'server:\n  port: 63010 # 网关端口\nspring:\n  cloud:\n    gateway:\n#      filter:\n#        strip-prefix:\n#          enabled: true\n      routes: # 网关路由配置\n        - id: content-api # 路由id，自定义，只要唯一即可\n          # uri: http://127.0.0.1:8081 # 路由的目标地址 http就是固定地址\n          uri: lb://content-api # 路由的目标地址 lb就是负载均衡，后面跟服务名称\n          predicates: # 路由断言，也就是判断请求是否符合路由规则的条件\n            - Path=/content/** # 这个是按照路径匹配，只要以/content/开头就符合要求\n#          filters:\n#            - StripPrefix=1\n        - id: system-api\n          # uri: http://127.0.0.1:8081\n          uri: lb://system-api\n          predicates:\n            - Path=/system/**\n#          filters:\n#            - StripPrefix=1\n        - id: media-api\n          # uri: http://127.0.0.1:8081\n          uri: lb://media-api\n          predicates:\n            - Path=/media/**\n#          filters:\n#            - StripPrefix=1\n        - id: search-service\n          # uri: http://127.0.0.1:8081\n          uri: lb://search\n          predicates:\n            - Path=/search/**\n#          filters:\n#            - StripPrefix=1\n        - id: auth-service\n          # uri: http://127.0.0.1:8081\n          uri: lb://auth-service\n          predicates:\n            - Path=/auth/**\n#          filters:\n#            - StripPrefix=1',
        'b0e96db474e1b57906bea928c4f45a25', '2022-09-29 12:27:19', '2022-09-29 12:27:19', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 178, 'learning-service-dev.yaml', 'course-project', '',
        'spring:\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_leanring?serverTimezone=UTC&userUnicode=true&useSSL=false&\r\n    username: root\r\n    password: mysql',
        '51ba6ac478bf1f29ba6177df195fa836', '2022-10-02 02:22:18', '2022-10-02 02:22:18', NULL, '192.168.101.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 179, 'orders-service-dev.yaml', 'course-project', '',
        'spring:\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_orders?serverTimezone=UTC&userUnicode=true&useSSL=false&\r\n    username: root\r\n    password: mysql',
        '82909c1ca114c12650e9141ff2eb737f', '2022-10-02 02:23:02', '2022-10-02 02:23:03', NULL, '192.168.101.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 180, 'learning-api-dev.yaml', 'course-project', '',
        'server:\r\n  servlet:\r\n    context-path: /learning\r\n  port: 63020\r\n\r\n\r\n#配置本地优先\r\nspring:\r\n cloud:\r\n  config:\r\n    override-none: true\r\n',
        '8bbabf9a722ea65b49e13cdcfac95980', '2022-10-02 02:23:57', '2022-10-02 02:23:57', NULL, '192.168.101.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 181, 'orders-api-dev.yaml', 'course-project', '',
        'server:\r\n  servlet:\r\n    context-path: /orders\r\n  port: 63030\r\n\r\n\r\n#配置本地优先\r\nspring:\r\n cloud:\r\n  config:\r\n    override-none: true\r\n',
        'a4a25b6364fe26875a3d1f6b55c0e379', '2022-10-02 02:24:28', '2022-10-02 02:24:29', NULL, '192.168.101.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (165, 182, 'learning-service-dev.yaml', 'course-project', '',
        'spring:\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_leanring?serverTimezone=UTC&userUnicode=true&useSSL=false&\r\n    username: root\r\n    password: mysql',
        '51ba6ac478bf1f29ba6177df195fa836', '2022-10-02 10:32:25', '2022-10-02 10:32:26', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (145, 183, 'feign-dev.yaml', 'course-common', '',
        'feign:\r\n  client:\r\n    config:\r\n      default: # default全局的配置\r\n        loggerLevel: BASIC # 日志级别，BASIC就是基本的请求和响应信息\r\n  httpclient:\r\n    enabled: true # 开启feign对HttpClient的支持\r\n    max-connections: 200 # 最大的连接数\r\n    max-connections-per-route: 50 # 每个路径的最大连接数',
        '651f5f5504138b97c462b1715da3b781', '2022-10-03 01:07:11', '2022-10-03 01:07:11', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (105, 184, 'gateway-dev.yaml', 'course-project', '',
        'server:\n  port: 63010 # 网关端口\nspring:\n  cloud:\n    gateway:\n#      filter:\n#        strip-prefix:\n#          enabled: true\n      routes: # 网关路由配置\n        - id: content-api # 路由id，自定义，只要唯一即可\n          # uri: http://127.0.0.1:8081 # 路由的目标地址 http就是固定地址\n          uri: lb://content-api # 路由的目标地址 lb就是负载均衡，后面跟服务名称\n          predicates: # 路由断言，也就是判断请求是否符合路由规则的条件\n            - Path=/content/** # 这个是按照路径匹配，只要以/content/开头就符合要求\n#          filters:\n#            - StripPrefix=1\n        - id: system-api\n          # uri: http://127.0.0.1:8081\n          uri: lb://system-api\n          predicates:\n            - Path=/system/**\n#          filters:\n#            - StripPrefix=1\n        - id: media-api\n          # uri: http://127.0.0.1:8081\n          uri: lb://media-api\n          predicates:\n            - Path=/media/**\n#          filters:\n#            - StripPrefix=1\n        - id: search-service\n          # uri: http://127.0.0.1:8081\n          uri: lb://search\n          predicates:\n            - Path=/search/**\n#          filters:\n#            - StripPrefix=1\n        - id: auth-service\n          # uri: http://127.0.0.1:8081\n          uri: lb://auth-service\n          predicates:\n            - Path=/auth/**\n#          filters:\n#            - StripPrefix=1\n        - id: checkcode\n          # uri: http://127.0.0.1:8081\n          uri: lb://checkcode\n          predicates:\n            - Path=/checkcode/**\n#          filters:\n#            - StripPrefix=1',
        'dba0679ac2645b85a0805cd674438a7d', '2022-10-03 05:20:21', '2022-10-03 05:20:22', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (168, 185, 'orders-api-dev.yaml', 'course-project', '',
        'server:\r\n  servlet:\r\n    context-path: /orders\r\n  port: 63030\r\n\r\n\r\n#配置本地优先\r\nspring:\r\n cloud:\r\n  config:\r\n    override-none: true\r\n',
        'a4a25b6364fe26875a3d1f6b55c0e379', '2022-10-04 09:00:10', '2022-10-04 09:00:10', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (166, 186, 'orders-service-dev.yaml', 'course-project', '',
        'spring:\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_orders?serverTimezone=UTC&userUnicode=true&useSSL=false&\r\n    username: root\r\n    password: mysql',
        '82909c1ca114c12650e9141ff2eb737f', '2022-10-04 22:12:09', '2022-10-04 22:12:09', NULL, '192.168.101.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (166, 187, 'orders-service-dev.yaml', 'course-project', '',
        'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://192.168.101.65:3306/xcplus_orders?serverTimezone=UTC&userUnicode=true&useSSL=false&\n    username: root\n    password: mysql\n\nxxl:\n  job:\n    admin: \n      addresses: http://192.168.101.65:8088/xxl-job-admin\n    executor:\n      appname: payresultnotify-job\n      address: \n      ip: \n      port: 8999\n      logpath: /data/applogs/xxl-job/jobhandler\n      logretentiondays: 30\n    accessToken: default_token',
        'fd7b2fcb75e10c1d84dd08231dc2739c', '2022-10-04 22:17:13', '2022-10-04 22:17:13', NULL, '192.168.101.1', 'U',
        'dev');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`
(
    `role`     varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci  NOT NULL,
    `resource` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
    `action`   varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci   NOT NULL,
    UNIQUE INDEX `uk_role_permission` (`role`, `resource`, `action`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = latin1
  COLLATE = latin1_swedish_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`
(
    `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
    `role`     varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
    UNIQUE INDEX `idx_user_role` (`username`, `role`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = latin1
  COLLATE = latin1_swedish_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles`
VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`
(
    `id`                bigint UNSIGNED                                  NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `tenant_id`         varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
    `quota`             int UNSIGNED                                     NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
    `usage`             int UNSIGNED                                     NOT NULL DEFAULT 0 COMMENT '使用量',
    `max_size`          int UNSIGNED                                     NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
    `max_aggr_count`    int UNSIGNED                                     NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
    `max_aggr_size`     int UNSIGNED                                     NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
    `max_history_count` int UNSIGNED                                     NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
    `gmt_create`        datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `gmt_modified`      datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_tenant_id` (`tenant_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = '租户容量信息表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`
(
    `id`            bigint                                           NOT NULL AUTO_INCREMENT COMMENT 'id',
    `kp`            varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
    `tenant_id`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
    `tenant_name`   varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
    `tenant_desc`   varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
    `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL COMMENT 'create_source',
    `gmt_create`    bigint                                           NOT NULL COMMENT '创建时间',
    `gmt_modified`  bigint                                           NOT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_tenant_info_kptenantid` (`kp`, `tenant_id`) USING BTREE,
    INDEX `idx_tenant_id` (`tenant_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'tenant_info'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info`
VALUES (1, '1', '3adc3388-087e-4c90-a373-c5a6484752df', 'xc3.0_dev', 'xc3.0_dev', 'nacos', 1661952703443,
        1661952703443);
INSERT INTO `tenant_info`
VALUES (3, '1', 'dev', '开发环境', '开发环境', 'nacos', 1662865995686, 1662865995686);
INSERT INTO `tenant_info`
VALUES (4, '1', 'test', '测试环境', '测试环境', 'nacos', 1662867234159, 1662867234159);
INSERT INTO `tenant_info`
VALUES (5, '1', 'prod', '生产环境', '生产环境', 'nacos', 1662868015781, 1662868015781);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`
(
    `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci  NOT NULL,
    `password` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
    `enabled`  tinyint(1)                                                  NOT NULL,
    PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = latin1
  COLLATE = latin1_swedish_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users`
VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;