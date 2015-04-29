# INSERT INTO `menu` (`id`, `systemMenu`, `resourceURL`, `smenCaption`, `smenIndex`, `smenHint`, `smenIcon`, `engSmenCaption`, `mlevel`, `level`)
# VALUES
# 	(68, NULL, NULL, '定存宝管理', NULL, NULL, 'smt-application_cascade', NULL, 1, NULL),
# 	(69, 68, '/staticloan/index', '定存宝池', 1, '定存宝标', 'smt-application_osx', NULL, 2, NULL);


alter table loansign
add
product int(1) default 0
comment '产品类别：0、散标，1、定存标';

alter table loansign
add
status int(1) default 0
comment '定存标是否处理：0、未处理，1、已处理';

alter table repaymentrecord
add
deleted int(1) default 0
comment '是否有效：0、有效，1、已删除';

#
# create TABLE loan_stage(
#   `id` bigint(20) NOT NULL AUTO_INCREMENT,
#   `loanSign_id` bigint(20) DEFAULT NULL COMMENT '购买借款标编号',
#   `lending_amount` decimal(18,4) DEFAULT NULL COMMENT '总借出金额',
#   `partition_amount` decimal(18,4) DEFAULT NULL COMMENT '本记录借出金额',
#   `pool_num` int(1) not null comment '分在哪个募集池',
#   `payback_id` BIGINT(20) DEFAULT NULL COMMENT '还款记录表对应id',
#   `soldOut` int(1) DEFAULT 0 COMMENT '0 未处理 ，1 已处理',
#   `deleted` int(1) DEFAULT 0 COMMENT '0 未删除 ，1 已删除',
#   `created_at` DATETIME null,
#   `updated_at` DATETIME NULL,
#   PRIMARY KEY (`id`),
#   KEY `FK_loansign_stage_1` (`loanSign_id`) USING BTREE,
#   KEY `FK_loansign_stage_2` (`payback_id`) USING BTREE,
#   CONSTRAINT `loanstage_ibfk_1` FOREIGN KEY (`loanSign_id`) REFERENCES `loansign` (`id`),
#   CONSTRAINT `loanstage_ibfk_2` FOREIGN KEY (`payback_id`) REFERENCES `repaymentrecord` (`id`)
# )ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='债权暂存表';

create table transfer_loan(
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loanSign_id` bigint(20) DEFAULT NULL COMMENT '购买借款标编号',
  `pool_num` int(1) not null comment '分在哪个募集池',
  `payback_id` BIGINT(20) DEFAULT NULL COMMENT '还款记录表对应id',
  `partition_amount` decimal(18,4) DEFAULT NULL COMMENT '本记录借出金额',
  `status` int(1) DEFAULT 0 COMMENT '0 未处理 ，1 已处理',
  `deleted` int(1) DEFAULT 0 COMMENT '0 未删除 ，1 已删除',
  `created_at` DATETIME null,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  KEY `FK_loansign_stage_1` (`loanSign_id`) USING BTREE,
  KEY `FK_loansign_stage_2` (`payback_id`) USING BTREE,
  CONSTRAINT `loanstage_ibfk_1` FOREIGN KEY (`loanSign_id`) REFERENCES `loansign` (`id`),
  CONSTRAINT `loanstage_ibfk_2` FOREIGN KEY (`payback_id`) REFERENCES `repaymentrecord` (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='分散债权表';

create table transfer_pool(
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pool_num` int(1) null comment '分在哪个募集池',
  `amount` decimal(18,4) DEFAULT 0 COMMENT '总量',
  `open_amount` DECIMAL(18,4) not null DEFAULT 0 COMMENT '可购余额',
  `sold_out` int(1) DEFAULT 0 COMMENT '0 没卖完，1 已卖完',
  `status` int(1) DEFAULT 0 COMMENT '0 今日 ，1 非今日',
  `created_at` DATETIME null,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='债权募集池统计表';

alter table loanrecord
add
pool_id bigint(20) default null
comment 'transfer_pool的id号';

alter table loanrecord
add
status int(1) default 0
comment '是否处理：0、未处理，1、已处理';

alter table loanrecord
add
pool_num int(1) default null
comment '分在哪个标池：0、未处理，1、已处理';

alter table loanrecord
add
product int(1) default 0
comment '产品类别：0、散标，1、定存标';

alter table userbank
add
  accountName varchar(120) DEFAULT NULL COMMENT '银行卡名称';

alter table userbank
add
  branch varchar(64) DEFAULT NULL COMMENT ' 支行';


INSERT INTO `menu` (`id`,`systemMenu`,`resourceURL`,`smenCaption`,`smenIndex`,`smenHint`,`smenIcon`,`engSmenCaption`,`mlevel`,`level`)
VALUES (70,5,'/invite/setting','邀请机制设置',1,'邀请机制设置','smt-welcome',NULL,2,NULL);

INSERT INTO `menurole` (`id`,`createTime`,`menu_id`,`role_id`) VALUES (2792,'2015-03-17 14:59:20',70,1);

INSERT INTO `menu` (`id`,`systemMenu`,`resourceURL`,`smenCaption`,`smenIndex`,`smenHint`,`smenIcon`,`engSmenCaption`,`mlevel`,`level`)
VALUES (71,5,'/myelite/setting','体验金设置',1,'体验金设置','smt-welcome',NULL,2,NULL);

INSERT INTO `menurole` (`id`,`createTime`,`menu_id`,`role_id`) VALUES (2841,'2015-03-17 14:59:20',71,1);