CREATE TABLE `merchant` (
        `id` bigint(64) unsigned NOT NULL COMMENT '主键',
        `phone` varchar(256) DEFAULT '' COMMENT '手机',
        `password` varchar(256) DEFAULT '' COMMENT '密码',

        `version` int(8) DEFAULT '0' COMMENT '版本',
        `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
        `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
        `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
        `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
        PRIMARY KEY (`id`) USING BTREE
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='商家表\n(标识一个商家)';


CREATE TABLE `merchant_detail` (
        `merchant_id` bigint(64) unsigned NOT NULL COMMENT '主键',
        `name` varchar(256) DEFAULT '' COMMENT '名称',
        `address` varchar(256) DEFAULT '' COMMENT '地址',

        `version` int(8) DEFAULT '0' COMMENT '版本',
        `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
        `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
        `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
        `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
        PRIMARY KEY (`merchant_id`) USING BTREE
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='商家详情表\n(标识一个商家)';


CREATE TABLE `merchant_login_record` (
        `id` bigint(64) unsigned NOT NULL COMMENT '主键',
        `merchant_id` bigint(64) unsigned DEFAULT NULL COMMENT '用户id',
        `phone_models` varchar(256) DEFAULT '' COMMENT '手机型号',
        `device_id` varchar(256) DEFAULT '' COMMENT '设备ID',
        `imei` varchar(256) DEFAULT NULL COMMENT '设备标识',
        `ip` varchar(256) DEFAULT NULL COMMENT 'ip地址',
        `latitude` decimal(10,7) DEFAULT NULL COMMENT '纬度',
        `longitude` decimal(10,7) DEFAULT NULL COMMENT '经度',

        `version` int(8) DEFAULT '0' COMMENT '版本',
        `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
        `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
        `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
        `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
        PRIMARY KEY (`id`) USING BTREE
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='商家登陆记录表\n(标识一次商家登陆行为)';


CREATE TABLE `merchant_third` (
        `type` tinyint(4) NOT NULL COMMENT '类型，1：支付宝；2：微信',
        `third_id` varchar(256) NOT NULL COMMENT '第三方账户标识',
        `user_id` bigint(64) unsigned DEFAULT NULL COMMENT '用户id',
        `name` varchar(256) DEFAULT '' COMMENT '名称',

        `version` int(8) DEFAULT '0' COMMENT '版本',
        `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
        `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
        `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
        `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
        PRIMARY KEY (`type`,`third_id`) USING BTREE
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='第三方登录商户表\n(标识一个第三方账户，关联商户)';


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
        `user_id` bigint(64) unsigned NOT NULL COMMENT '主键，等同于user表的id',
        `group_id` bigint(64) unsigned DEFAULT NULL COMMENT '团体所属',
        `name` varchar(256) DEFAULT '' COMMENT '姓名、企业名',
        `nick_name` varchar(256) DEFAULT '' COMMENT '昵称',
        `id_number` varchar(256) DEFAULT '' COMMENT '身份证号',
        `sex` tinyint(4) DEFAULT '-1' COMMENT '性别,0:女；1：男；-1：未知',

        `version` int(8) DEFAULT '0' COMMENT '版本',
        `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
        `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
        `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
        `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
        PRIMARY KEY (`user_id`) USING BTREE
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='用户详情表\n(标识一个用户)';


CREATE TABLE `user_third` (
        `type` tinyint(4) NOT NULL COMMENT '类型，1：支付宝；2：微信',
        `third_id` varchar(256) NOT NULL COMMENT '第三方账户标识',
        `user_id` bigint(64) unsigned DEFAULT NULL COMMENT '用户id',
        `name` varchar(256) DEFAULT NULL COMMENT '第三方账户姓名',

        `version` int(8) DEFAULT '0' COMMENT '版本',
        `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
        `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
        `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
        `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
        PRIMARY KEY (`type`,`third_id`) USING BTREE
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='第三方登录用户表\n(标识一个第三方账户，关联用户)';


CREATE TABLE `user_login_record` (
        `id` bigint(64) unsigned NOT NULL COMMENT '主键',
        `user_id` bigint(64) unsigned DEFAULT NULL COMMENT '用户id',
        `phone_models` varchar(256) DEFAULT '' COMMENT '手机型号',
        `device_id` varchar(256) DEFAULT '' COMMENT '设备ID',
        `imei` varchar(256) DEFAULT NULL COMMENT '设备标识',
        `ip` varchar(256) DEFAULT NULL COMMENT 'ip地址',
        `latitude` decimal(10,7) DEFAULT NULL COMMENT '纬度',
        `longitude` decimal(10,7) DEFAULT NULL COMMENT '经度',

        `version` int(8) DEFAULT '0' COMMENT '版本',
        `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
        `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
        `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
        `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
        PRIMARY KEY (`id`) USING BTREE
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='用户登陆记录表\n(标识一次用户登陆行为)';


CREATE TABLE `car` (
        `id` bigint(64) unsigned NOT NULL COMMENT '主键',
        `user_id` bigint(64) unsigned DEFAULT NULL COMMENT '用户id',
        `vin` varchar(256) DEFAULT '' COMMENT 'vin码',
        `license_number` varchar(256) DEFAULT '' COMMENT '车辆号码',
        `self_number` varchar(256) DEFAULT '' COMMENT '自编号',
        `brand` varchar(256) DEFAULT '' COMMENT '品牌',
        `category` varchar(256) DEFAULT '-1' COMMENT '车辆分类',

        `version` int(8) DEFAULT '0' COMMENT '版本',
        `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
        `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
        `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
        `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
        PRIMARY KEY (`id`) USING BTREE
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='车辆表\n(标识一个车辆)';


CREATE TABLE `order` (
        `id` bigint(64) unsigned NOT NULL COMMENT '主键',
        `status` tinyint(4) DEFAULT '-1' COMMENT '状态，-1：创建，未确认；0：已确认；1：已支付；2：已完成；-2：已取消',
        `sn` bigint(32) unsigned DEFAULT NULL COMMENT '订单编号',
        `user_id` bigint(64) unsigned DEFAULT NULL COMMENT '用户id',
        `merchant_id` bigint(64) unsigned DEFAULT NULL COMMENT '商户id',
        `cg_id` bigint(64) unsigned DEFAULT NULL COMMENT '充电枪id',
        `money` decimal(10,2) DEFAULT NULL COMMENT '金额',

        `version` int(8) DEFAULT '0' COMMENT '版本',
        `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
        `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
        `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
        `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
         PRIMARY KEY (`id`) USING BTREE
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='订单表\n(标识一个订单)';


CREATE TABLE `order_detail` (
         `order_id` bigint(64) unsigned NOT NULL COMMENT '主键',
         `cp_id` bigint(64) unsigned DEFAULT NULL COMMENT '充电桩id',
         `car_id` bigint(64) unsigned DEFAULT NULL COMMENT '车辆id',

         `version` int(8) DEFAULT '0' COMMENT '版本',
         `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
         `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
         `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
         `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
         PRIMARY KEY (`order_id`) USING BTREE
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='订单详情表\n(标识一个订单)';


CREATE TABLE `pay_record` (
         `id` bigint(64) unsigned NOT NULL COMMENT '主键',
         `user_id` bigint(64) unsigned DEFAULT NULL COMMENT '用户id',
         `order_id` bigint(64) unsigned DEFAULT NULL COMMENT '订单id',
         `money` decimal(10,2) DEFAULT NULL COMMENT '金额',
         `type` tinyint(4) DEFAULT '-1' COMMENT '支付类型；0：微信；1：支付宝；2：账户余额支付',
         `sn_third` varchar(256) DEFAULT '' COMMENT '第三方流水标识；如果是余额支付；则为balance_pay_record表的sn字段',
         `status` tinyint(4) DEFAULT '-1' COMMENT '状态；0：支付失败；1：支付成功',

         `version` int(8) DEFAULT '0' COMMENT '版本',
         `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
         `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
         `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
         `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
         PRIMARY KEY (`id`) USING BTREE
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='支付记录表\n(标识一次支付行为)';


CREATE TABLE `wallet` (
        `user_id` bigint(64) unsigned NOT NULL COMMENT '主键，用户id',
        `money` decimal(10,2) DEFAULT NULL COMMENT '账户余额',
        `status` tinyint(4) DEFAULT NULL COMMENT '状态',

        `version` int(8) DEFAULT '0' COMMENT '版本',
        `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
        `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
        `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
        `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
        PRIMARY KEY (`user_id`) USING BTREE
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='用户钱包表\n(标识一个用户钱包)';


CREATE TABLE `deposit_record` (
        `id` bigint(64) unsigned NOT NULL COMMENT '主键',
        `user_id` bigint(64) unsigned DEFAULT NULL COMMENT '用户id,钱包id',
        `money` decimal(10,2) DEFAULT NULL COMMENT '金额',
        `type` tinyint(4) DEFAULT '-1' COMMENT '支付类型；0：微信；1：支付宝',
        `sn` varchar(256) DEFAULT '' COMMENT '第三方流水标识',
        `status` tinyint(4) DEFAULT '-1' COMMENT '状态；0：充值失败；1：充值成功',

        `version` int(8) DEFAULT '0' COMMENT '版本',
        `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
        `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
        `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
        `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
        PRIMARY KEY (`id`) USING BTREE
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='充值记录表\n(标识一次充值行为)';


CREATE TABLE `balance_pay_record` (
        `id` bigint(64) unsigned NOT NULL COMMENT '主键',
        `user_id` bigint(64) unsigned DEFAULT NULL COMMENT '用户id,钱包id',
        `money` decimal(10,2) DEFAULT NULL COMMENT '金额',
        `sn` varchar(256) DEFAULT '' COMMENT '流水号',
        `status` tinyint(4) DEFAULT '-1' COMMENT '状态；0：支付失败；1：支付成功',

        `version` int(8) DEFAULT '0' COMMENT '版本',
        `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
        `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
        `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
        `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
        PRIMARY KEY (`id`) USING BTREE
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='余额支付记录表\n(标识一次通过余额支付的行为)';


CREATE TABLE `withdraw_record` (
      `id` bigint(64) unsigned NOT NULL COMMENT '主键',
      `merchant_id` bigint(64) unsigned DEFAULT NULL COMMENT '商户id,钱包id',
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


CREATE TABLE `merchant_wallet` (
      `merchant_id` bigint(64) unsigned NOT NULL COMMENT '主键，商户id',
      `money` decimal(10,2) DEFAULT NULL COMMENT '账户余额',
      `status` tinyint(4) DEFAULT NULL COMMENT '状态',

      `version` int(8) DEFAULT '0' COMMENT '版本',
      `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
      `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
      `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
      `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
      PRIMARY KEY (`merchant_id`) USING BTREE
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='商户钱包表\n(标识一个商户钱包，用来记录商户的账户余额)';


