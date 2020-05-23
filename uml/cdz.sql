CREATE TABLE `order` (
`id` bigint(64) unsigned NOT NULL COMMENT '主键',
    `status` tinyint(4) DEFAULT '-1' COMMENT '状态，-1：创建，未确认；0：已确认；1：已支付；2：已完成；-2：已取消',
    `sn` bigint(32) unsigned DEFAULT NULL COMMENT '订单编号',
    `user_id` bigint(64) unsigned DEFAULT NULL COMMENT '用户id',
    `merchant_id` bigint(64) unsigned DEFAULT NULL COMMENT '商户id',
    `cu_id` bigint(64) unsigned DEFAULT NULL COMMENT '充电枪id',
    `money` decimal(10,2) DEFAULT NULL COMMENT '金额',

    `version` int(8) DEFAULT '0' COMMENT '版本',
    `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
    `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
    `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (`id`) USING BTREE 
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='订单表\n(标识一个订单)';


CREATE TABLE `pay_record` (
`id` bigint(64) unsigned NOT NULL COMMENT '主键',
     `user_id` bigint(64) unsigned DEFAULT NULL COMMENT '用户id',
     `order_id` bigint(64) unsigned DEFAULT NULL COMMENT '订单id',
     `money` decimal(10,2) DEFAULT NULL COMMENT '金额',
     `type` tinyint(4) DEFAULT '-1' COMMENT '支付类型；0：微信；1：支付宝',
     `sn_third` varchar(256) DEFAULT '' COMMENT '第三方流水标识',
     `status` tinyint(4) DEFAULT '-1' COMMENT '状态；0：支付失败；1：支付成功',

     `version` int(8) DEFAULT '0' COMMENT '版本',
     `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
     `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
     `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
     `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
     PRIMARY KEY (`id`) USING BTREE 
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='支付记录表\n(标识一次支付行为)';

CREATE TABLE `deposit_record` (
`id` bigint(64) unsigned NOT NULL COMMENT '主键',
    `user_id` bigint(64) unsigned DEFAULT NULL COMMENT '用户id',
    `money` decimal(10,2) DEFAULT NULL COMMENT '金额',
    `type` tinyint(4) DEFAULT '-1' COMMENT '支付类型；0：微信；1：支付宝',
    `sn_third` varchar(256) DEFAULT '' COMMENT '第三方流水标识',
    `status` tinyint(4) DEFAULT '-1' COMMENT '状态；0：充值失败；1：充值成功',

    `version` int(8) DEFAULT '0' COMMENT '版本',
    `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
    `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
    `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE 
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='充值记录表\n(标识一次充值行为)';

CREATE TABLE `withdraw_record` (
`id` bigint(64) unsigned NOT NULL COMMENT '主键',
    `merchant_id` bigint(64) unsigned DEFAULT NULL COMMENT '用户id',
    `money` decimal(10,2) DEFAULT NULL COMMENT '金额',
    `type` tinyint(4) DEFAULT '-1' COMMENT '支付类型；0：微信；1：支付宝',
    `sn_third` varchar(256) DEFAULT '' COMMENT '第三方流水标识',
    `status` tinyint(4) DEFAULT '-1' COMMENT '状态；0：提现失败；1：提现成功',

    `version` int(8) DEFAULT '0' COMMENT '版本',
    `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
    `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
    `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE 
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='提现记录表\n(标识一次商家提现行为)';

