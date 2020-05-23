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

CREATE TABLE `charge_gun` (
`id` bigint(64) unsigned NOT NULL COMMENT '主键',
    `cp_id` bigint(64) unsigned DEFAULT NULL COMMENT '充电桩id',
    `sn` varchar(256) DEFAULT '' COMMENT '枪口编号',

    `version` int(8) DEFAULT '0' COMMENT '版本',
    `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
    `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
    `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE 
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='充电枪表\n(标识一个充电枪)';

CREATE TABLE `fee_rule` (
`id` bigint(64) unsigned NOT NULL COMMENT '主键',
    `cp_id` bigint(64) unsigned DEFAULT NULL COMMENT '充电桩id',
    `name` varchar(256) DEFAULT '' COMMENT '名称',
    `description` varchar(256) DEFAULT '' COMMENT '明细描述',
    `status` tinyint(4) DEFAULT '-1' COMMENT '状态',
    `rule_version` int(8) DEFAULT '-1' COMMENT '规则的版本',

    `version` int(8) DEFAULT '0' COMMENT '版本',
    `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
    `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
    `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE 
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='计费规则表\n(标识一个计费规则)';

CREATE TABLE `cu_event_record` (
`id` bigint(64) unsigned NOT NULL COMMENT '主键',
    `cu_id` bigint(64) unsigned DEFAULT NULL COMMENT '充电枪id',
    `event_type` tinyint(4) DEFAULT '-1' COMMENT '事件类型',
    `event_id` bigint(64) unsigned DEFAULT NULL COMMENT '事件序列id',

    `version` int(8) DEFAULT '0' COMMENT '版本',
    `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
    `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
    `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE 
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='充电桩事件发送记录表\n(标识一次事件)';

CREATE TABLE `cu_server_event_record` (
`id` bigint(64) unsigned NOT NULL COMMENT '主键',
    `cu_id` bigint(64) unsigned DEFAULT NULL COMMENT '充电枪id',
    `event_type` tinyint(4) DEFAULT '-1' COMMENT '事件类型',
    `event_id` bigint(64) unsigned DEFAULT NULL COMMENT '事件序列id',

    `version` int(8) DEFAULT '0' COMMENT '版本',
    `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
    `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
    `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE 
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='平台回复事件记录表\n(标识一次平台指令事件)';

CREATE TABLE `cu_status` (
`id` bigint(64) unsigned NOT NULL COMMENT '主键',
    `cu_id` bigint(64) unsigned DEFAULT NULL COMMENT '充电枪id',
    `sn` bigint(64) unsigned DEFAULT NULL COMMENT '订单编号',
    `work_status` tinyint(4) DEFAULT NULL COMMENT '工作状态',
    `connect_status` tinyint(4) DEFAULT NULL COMMENT '连接状态',
    `output_contactor_status` tinyint(4) DEFAULT NULL COMMENT '输出接触器状态',
    `electronic_lock_status` tinyint(4) DEFAULT NULL COMMENT '电子锁状态',
    `fault_number` tinyint(4) DEFAULT NULL COMMENT '故障码',
    `voltage` smallint(6) unsigned DEFAULT NULL COMMENT '充电电压',
    `current` smallint(6) unsigned DEFAULT NULL COMMENT '充电电流',
    `bms_voltage` smallint(6) unsigned DEFAULT NULL COMMENT 'bms需求电压',
    `bms_current` smallint(6) unsigned DEFAULT NULL COMMENT 'bms需求电流',
    `bms_model` tinyint(4) DEFAULT NULL COMMENT 'bms充电模式',
    `input_quantity` smallint(6) unsigned DEFAULT NULL COMMENT '已充电量',
    `power` smallint(6) unsigned DEFAULT NULL COMMENT '充电功率',
    `a_voltage` smallint(6) unsigned DEFAULT NULL COMMENT '交流输出A相电压',
    `a_current` smallint(6) unsigned DEFAULT NULL COMMENT '交流输出A相电流',
    `b_voltage` smallint(6) unsigned DEFAULT NULL COMMENT '交流输出B相电压',
    `b_current` smallint(6) unsigned DEFAULT NULL COMMENT '交流输出B相电流',
    `c_voltage` smallint(6) unsigned DEFAULT NULL COMMENT '交流输出C相电压',
    `c_current` smallint(6) unsigned DEFAULT NULL COMMENT '交流输出C相电流',
    `input_duration` int(8) DEFAULT NULL COMMENT '已充时长，分钟',
    `left_duration` int(8) DEFAULT NULL COMMENT '剩余充电时间预估，分钟',
    `cp_temperature` tinyint(4) DEFAULT NULL COMMENT '充电桩内部温度',
    `cu_temperature` tinyint(4) DEFAULT NULL COMMENT '枪头温度',
    `input_start_quantity` smallint(6) unsigned DEFAULT NULL COMMENT '充电开始时电表读数',
    `input_now_quantity` smallint(6) unsigned DEFAULT NULL COMMENT '当前电表读数',
    `now_soc` tinyint(4) DEFAULT NULL COMMENT '当前 SOC',
    `cell_highest_temperature` tinyint(4) DEFAULT NULL COMMENT '单体电池最高温度',
    `cell_highest_voltage` smallint(6) unsigned DEFAULT NULL COMMENT '单体电池最高电压',
    `fee_id` bigint(64) unsigned DEFAULT NULL COMMENT '计费模型 id',
    `spike_quantity` smallint(6) unsigned DEFAULT NULL COMMENT '尖电量',
    `spike_quantity_fee` smallint(6) unsigned DEFAULT NULL COMMENT '尖电费',
    `spike_server_fee` smallint(6) unsigned DEFAULT NULL COMMENT '尖服务费',
    `peak_quantity` smallint(6) unsigned DEFAULT NULL COMMENT '峰电量',
    `peak_quantity_fee` smallint(6) unsigned DEFAULT NULL COMMENT '峰电费',
    `peak_server_fee` smallint(6) unsigned DEFAULT NULL COMMENT '峰服务费',
    `flat_quantity` smallint(6) unsigned DEFAULT NULL COMMENT '平电量',
    `flat_quantity_fee` smallint(6) unsigned DEFAULT NULL COMMENT '平电费',
    `flat_server_fee` smallint(6) unsigned DEFAULT NULL COMMENT '平服务费',
    `valley_quantity` smallint(6) unsigned DEFAULT NULL COMMENT '谷电量',
    `valley_quantity_fee` smallint(6) unsigned DEFAULT NULL COMMENT '谷电费',
    `valley_server_fee` smallint(6) unsigned DEFAULT NULL COMMENT '谷服务费',
    `now_quantity_fee` smallint(6) unsigned DEFAULT NULL COMMENT '当前充电电费',
    `now_total_fee` smallint(6) unsigned DEFAULT NULL COMMENT '当前充电总费用',

    `version` int(8) DEFAULT '0' COMMENT '版本',
    `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
    `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
    `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE 
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='充电枪状态记录表\n(标识一次充电枪状态上报行为)';

CREATE TABLE `charge_pile` (
`id` bigint(64) unsigned NOT NULL COMMENT '主键',
    `cs_id` bigint(64) unsigned DEFAULT NULL COMMENT '充电站id',
    `merchant_id` bigint(64) unsigned DEFAULT NULL COMMENT '商家id',
    `name` varchar(256) DEFAULT '' COMMENT '名称',
    `service_object` tinyint(4) DEFAULT NULL COMMENT '服务对象',
    `service_status` tinyint(4) DEFAULT NULL COMMENT '运营状态',
    `register_time` int(32) unsigned DEFAULT NULL COMMENT '登记时间，统一使用时间戳格式，精确到秒',

    `version` int(8) DEFAULT '0' COMMENT '版本',
    `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
    `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
    `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE 
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='充电桩表\n(标识一个充电桩)';

CREATE TABLE `charge_station` (
`id` bigint(64) unsigned NOT NULL COMMENT '主键',
    `merchant_id` bigint(64) unsigned DEFAULT NULL COMMENT '商家id',
    `name` varchar(256) DEFAULT '' COMMENT '名称',
    `address` varchar(256) DEFAULT '' COMMENT '地址',
    `latitude` decimal(10,7) DEFAULT NULL COMMENT '纬度',
    `longitude` decimal(10,7) DEFAULT NULL COMMENT '经度',
    `service_type` tinyint(4) DEFAULT NULL COMMENT '运营类型',
    `service_status` tinyint(4) DEFAULT NULL COMMENT '运营状态',
    `station_type` tinyint(4) DEFAULT NULL COMMENT '站点类型',
    `register_time` int(32) unsigned DEFAULT NULL COMMENT '投运时间',

    `version` int(8) DEFAULT '0' COMMENT '版本',
    `creator` bigint(64) unsigned DEFAULT NULL COMMENT '创建者',
    `updator` bigint(64) unsigned DEFAULT NULL COMMENT '更新者',
    `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE 
)  ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='充电站表\n(标识一个充电站)';

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
    `name` tinyint(4) DEFAULT NULL COMMENT '第三方账户姓名',

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
    `money` decimal(10,2) DEFAULT NULL COMMENT '账户余额',

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

CREATE TABLE `order_detail` (
`order_id` bigint(64) unsigned NOT NULL COMMENT '主键',
     `cp_id` bigint(64) unsigned DEFAULT NULL COMMENT '充电桩id',

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

