CREATE TABLE `user` (
`id` bigint(64) unsigned NOT NULL COMMENT '主键',
    `type` tinyint(4) DEFAULT '-1' COMMENT '用户类型,0:个人用户；1：企业用户；-1：未知',
    `phone` varchar(256) DEFAULT '' COMMENT '手机',
    `password` varchar(256) DEFAULT '' COMMENT '密码',
    `status` tinyint(4) DEFAULT NULL COMMENT '状态',

    `version` int(8) DEFAULT '0' COMMENT '版本',
    `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
    `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
    `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE 
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='用户表\n(标识一个用户)';

CREATE TABLE `user_detail` (
`id` bigint(64) unsigned NOT NULL COMMENT '主键',
    `type` tinyint(4) DEFAULT '-1' COMMENT '用户类型,0:个人用户；1：企业用户；-1：未知',
    `phone` varchar(256) DEFAULT '' COMMENT '手机',
    `password` varchar(256) DEFAULT '' COMMENT '密码',
    `status` tinyint(4) DEFAULT NULL COMMENT '状态',

    `version` int(8) DEFAULT '0' COMMENT '版本',
    `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
    `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
    `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE 
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='用户详情表\n(标识一个用户)';

CREATE TABLE `user_third` (
`id` bigint(64) unsigned NOT NULL COMMENT '主键',
    `type` tinyint(4) DEFAULT '-1' COMMENT '用户类型,0:个人用户；1：企业用户；-1：未知',
    `phone` varchar(256) DEFAULT '' COMMENT '手机',
    `password` varchar(256) DEFAULT '' COMMENT '密码',
    `status` tinyint(4) DEFAULT NULL COMMENT '状态',

    `version` int(8) DEFAULT '0' COMMENT '版本',
    `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
    `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
    `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE 
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='第三方登录用户表\n(标识一个第三方账户，关联用户)';

CREATE TABLE `user_login_record` (
`id` bigint(64) unsigned NOT NULL COMMENT '主键',
    `type` tinyint(4) DEFAULT '-1' COMMENT '用户类型,0:个人用户；1：企业用户；-1：未知',
    `phone` varchar(256) DEFAULT '' COMMENT '手机',
    `password` varchar(256) DEFAULT '' COMMENT '密码',
    `status` tinyint(4) DEFAULT NULL COMMENT '状态',

    `version` int(8) DEFAULT '0' COMMENT '版本',
    `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
    `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
    `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE 
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='用户登陆记录表\n(标识一次用户登陆行为)';

CREATE TABLE `order` (
`id` bigint(64) unsigned NOT NULL COMMENT '主键',
    `type` tinyint(4) DEFAULT '-1' COMMENT '用户类型,0:个人用户；1：企业用户；-1：未知',
    `phone` varchar(256) DEFAULT '' COMMENT '手机',
    `password` varchar(256) DEFAULT '' COMMENT '密码',
    `status` tinyint(4) DEFAULT NULL COMMENT '状态',

    `version` int(8) DEFAULT '0' COMMENT '版本',
    `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
    `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
    `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE 
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='订单表\n(标识一个订单)';

CREATE TABLE `order_detail` (
`id` bigint(64) unsigned NOT NULL COMMENT '主键',
    `type` tinyint(4) DEFAULT '-1' COMMENT '用户类型,0:个人用户；1：企业用户；-1：未知',
    `phone` varchar(256) DEFAULT '' COMMENT '手机',
    `password` varchar(256) DEFAULT '' COMMENT '密码',
    `status` tinyint(4) DEFAULT NULL COMMENT '状态',

    `version` int(8) DEFAULT '0' COMMENT '版本',
    `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
    `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
    `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE 
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='订单详情表\n(标识一个订单)';

CREATE TABLE `pay_record` (
`id` bigint(64) unsigned NOT NULL COMMENT '主键',
    `type` tinyint(4) DEFAULT '-1' COMMENT '用户类型,0:个人用户；1：企业用户；-1：未知',
    `phone` varchar(256) DEFAULT '' COMMENT '手机',
    `password` varchar(256) DEFAULT '' COMMENT '密码',
    `status` tinyint(4) DEFAULT NULL COMMENT '状态',

    `version` int(8) DEFAULT '0' COMMENT '版本',
    `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
    `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
    `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE 
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='支付记录表\n(标识一次支付行为)';

