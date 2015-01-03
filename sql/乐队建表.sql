drop table if exists `permission_role_t`;
drop table if exists `permission_user_t`;
drop table if exists `permission_t`;
drop table if exists `role_user_t`;
drop table if exists `role_t`;
drop table if exists `menu_t`;
drop table if exists `user_t`;
drop table if exists `sys_album_music_t`;
drop table if exists `sys_discuss_activity_t`;
drop table if exists `sys_discuss_diary_t`;
drop table if exists `sys_discuss_music_t`;
drop table if exists `sys_activity_t`; 
drop table if exists `sys_album_t`;
drop table if exists `sys_music_t`;
drop table if exists `sys_diary_t`;
drop table if exists `sys_bandmember_t`;
drop table if exists `sys_experience_t`;
drop table if exists `sys_collectr_t`;

CREATE TABLE `permission_t` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '权限名称',
  `remark1` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark2` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark3` varchar(128) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

CREATE TABLE `role_t` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '角色名称',
  `remark1` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark2` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark3` varchar(128) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

CREATE TABLE `permission_role_t` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int unsigned NOT NULL COMMENT 'permission_t.id',
  `role_id` int unsigned NOT NULL COMMENT 'role_t.id',
  `remark1` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark2` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark3` varchar(128) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`id`),
  CONSTRAINT `contraint_2` FOREIGN KEY (`role_id`) REFERENCES `role_t` (`id`),
  CONSTRAINT `contraint_1` FOREIGN KEY (`permission_id`) REFERENCES `permission_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限表';

CREATE TABLE `user_t`(
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '用户昵称',
  `pwd` varchar(128) NOT NULL COMMENT '用户密码md5加密',
  `email` varchar(64) NOT NULL COMMENT '电子邮箱',
  `crt_date` timestamp NOT NULL DEFAULT NOW() COMMENT '记录创建时间',
  `upd_date` timestamp NOT NULL DEFAULT NOW() COMMENT '记录最后一次修改时间',
  `upd_user` int unsigned COMMENT '记录最后一次修改人',
  `sex` tinyint unsigned COMMENT '性别 0：男性 1：女性',
  `birthday` date COMMENT '生日',
  `tag` varchar(256) COMMENT '标签，用","分割',
  `province` varchar(64) COMMENT '',
  `city` varchar(64) COMMENT '',
  `used` tinyint unsigned NOT NULL DEFAULT 1 COMMENT '0：不可用 1：可用',
  `recent_login` timestamp COMMENT '最近登陆时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

CREATE TABLE `permission_user_t` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int unsigned NOT NULL COMMENT 'permission_t.id',
  `user_id` int unsigned NOT NULL COMMENT 'user_t.id',
  `remark1` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark2` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark3` varchar(128) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `user_t` (`id`),
  FOREIGN KEY (`permission_id`) REFERENCES `permission_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户权限表';

CREATE TABLE `role_user_t` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int unsigned NOT NULL COMMENT 'role_t.id',
  `user_id` int unsigned NOT NULL COMMENT 'sys_user_t.id',
  `remark1` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark2` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark3` varchar(128) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `user_t` (`id`),
  FOREIGN KEY (`role_id`) REFERENCES `role_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

CREATE TABLE `menu_t` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '菜单名称',
  `pid` int unsigned NOT NULL COMMENT '父菜单id',
  `url` varchar(128) NOT NULL COMMENT '菜单对应的url',
  `remark1` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark2` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark3` varchar(128) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

CREATE TABLE `sys_activity_t` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL COMMENT '活动标题',
  `start_time` timestamp NOT NULL DEFAULT now() COMMENT '活动开始时间',
  `end_time` timestamp NOT NULL DEFAULT now() COMMENT '活动终止时间',
  `crt_date` timestamp NOT NULL DEFAULT now() COMMENT '记录创建时间',
  `upd_date` timestamp NOT NULL DEFAULT now() COMMENT '记录最后一次修改时间',
  `upd_user` int unsigned COMMENT '记录最后一次修改人',
  `position` varchar(256) not null COMMENT '活动地址',
  `content` varchar(4096) not null COMMENT '活动内容',
  `incentive` varchar(256) not null COMMENT '活动奖励',
  `praise` int unsigned not null default 0 COMMENT '赞次数',
  `share` int unsigned not null default 0 COMMENT '分享次数',
  `discuss` int unsigned not null default 0 COMMENT '讨论次数',
  `dis_used` tinyint unsigned not null default 1 COMMENT '0：不可讨论 1：可讨论',
  `used` tinyint unsigned NOT NULL DEFAULT 1 COMMENT '0：不可用 1：可用',
  `remark1` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark2` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark3` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark4` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark5` varchar(128) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动表';

CREATE TABLE `sys_album_t` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT '专辑名称',
  `description` varchar(512) NOT NULL COMMENT '专辑描述',
  `publish_date` timestamp NOT NULL DEFAULT NOW() COMMENT '专辑发行时间',
  `crt_date` timestamp NOT NULL DEFAULT NOW() COMMENT '记录创建时间',
  `upd_date` timestamp NOT NULL DEFAULT NOW() COMMENT '记录最后一次修改时间',
  `upd_user` int COMMENT '记录最后一次修改人',
  `img` varchar(256) DEFAULT NULL COMMENT '专辑图片',
  `praise` int unsigned not null default 0 COMMENT '赞次数',
  `share` int unsigned not null default 0 COMMENT '分享次数',
  `discuss` int unsigned not null default 0 COMMENT '讨论次数',
  `dis_used` tinyint unsigned not null default 1 COMMENT '0：不可讨论 1：可讨论',
  `used` tinyint unsigned NOT NULL DEFAULT 1 COMMENT '0：不可用 1：可用',
  `remark1` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark2` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark3` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark4` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark5` varchar(128) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专辑表';

CREATE TABLE `sys_music_t` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '歌曲名称',
  `description` varchar(512) NOT NULL DEFAULT '' COMMENT '歌曲描述',
  `publish_date` timestamp NOT NULL DEFAULT NOW() COMMENT '歌曲发行时间',
  `crt_date` timestamp NOT NULL DEFAULT NOW() COMMENT '记录创建时间',
  `upd_date` timestamp NOT NULL DEFAULT NOW() COMMENT '记录最后一次修改时间',
  `upd_user` int unsigned COMMENT '记录最后一次修改人',
  `url` varchar(256) not null COMMENT '音频文件url',
  `lyrics` varchar(4096) default '' COMMENT '歌词',
  `length` bigint not null COMMENT '文件长度',
  `type` varchar(32) not null COMMENT '文件类型',
  `praise` int unsigned not null default 0 COMMENT '赞次数',
  `listen` int unsigned not null default 0 COMMENT '试听次数',
  `share` int unsigned not null default 0 COMMENT '分享次数',
  `discuss` int unsigned not null default 0 COMMENT '讨论次数',
  `dis_used` tinyint unsigned not null default 1 COMMENT '0：不可讨论 1：可讨论',
  `used` tinyint unsigned NOT NULL DEFAULT 1 COMMENT '0：不可用 1：可用',
  `remark1` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark2` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark3` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark4` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark5` varchar(128) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='歌曲表';

CREATE TABLE `sys_album_music_t` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `album_id` int unsigned NOT NULL COMMENT 'sys_album_t.id',
  `music_id` int unsigned NOT NULL COMMENT 'sys_music_t.id',
  `crt_date` timestamp NOT NULL DEFAULT now() COMMENT '记录创建时间',
  `upd_date` timestamp not null default now() COMMENT '记录最后一次修改时间',
  `upd_user` int unsigned COMMENT '记录最后一次修改人',
  `remark1` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark2` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark3` varchar(128) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专辑歌曲关系表';

CREATE TABLE `sys_diary_t` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL COMMENT '日记标题',
  `content` longtext NOT NULL COMMENT '日记内容，存html',
  `crt_date` timestamp NOT NULL DEFAULT now() COMMENT '记录创建时间',
  `upd_date` timestamp not null default now() COMMENT '记录最后一次修改时间',
  `upd_user` int unsigned COMMENT '记录最后一次修改人',
  `praise` int unsigned not null default 0 COMMENT '赞次数',
  `share` int unsigned not null default 0 COMMENT '分享次数',
  `discuss` int unsigned not null default 0 COMMENT '讨论次数',
  `dis_used` tinyint unsigned not null default 1 COMMENT '0：不可讨论 1：可讨论',
  `used` tinyint unsigned NOT NULL DEFAULT 1 COMMENT '0：不可用 1：可用',
  `remark1` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark2` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark3` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark4` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark5` varchar(128) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日记表';

CREATE TABLE `sys_discuss_activity_t` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int unsigned NOT NULL COMMENT '活动表主键,sys_activity_t.id',
  `content` varchar(4096) NOT NULL COMMENT '评论内容',
  `crt_date` timestamp NOT NULL DEFAULT now() COMMENT '记录创建时间',
  `upd_date` timestamp not null default now() COMMENT '记录最后一次修改时间',
  `upd_user` int unsigned COMMENT '记录最后一次修改人',
  `num` int unsigned COMMENT '评论序列号',
  `user_id` int unsigned NOT NULL COMMENT '评论用户id',
  `user_name` varchar(32) NOT NULL COMMENT '用户昵称',
  `pid` int unsigned COMMENT '父评论',
  `remark1` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark2` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark3` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark4` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark5` varchar(128) DEFAULT NULL COMMENT '备用字段',
   PRIMARY KEY (`id`),
   FOREIGN KEY (`activity_id`) REFERENCES `sys_activity_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动评论表';

CREATE TABLE `sys_discuss_diary_t` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `diary_id` int unsigned NOT NULL COMMENT '日记表主键,sys_diary_t.id',
  `content` varchar(4096) NOT NULL COMMENT '评论内容',
  `crt_date` timestamp NOT NULL DEFAULT now() COMMENT '记录创建时间',
  `upd_date` timestamp NOT NULL DEFAULT now() COMMENT '记录最后一次修改时间',
  `upd_user` int unsigned COMMENT '记录最后一次修改人',
  `num` int unsigned not null COMMENT '评论序列号',
  `user_id` int unsigned not null COMMENT '评论用户id',
  `user_name` varchar(32) not null COMMENT '用户昵称',
  `pid` int unsigned COMMENT '父评论',
  `remark1` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark2` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark3` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark4` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark5` varchar(128) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`diary_id`) REFERENCES `sys_diary_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日记评论表';

CREATE TABLE `sys_discuss_music_t` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `music_id` int unsigned NOT NULL COMMENT '日记表主键,sys_music_t.id',
  `content` varchar(4096) NOT NULL COMMENT '评论内容',
  `crt_date` timestamp NOT NULL DEFAULT now() COMMENT '记录创建时间',
  `upd_date` timestamp not null default now() COMMENT '记录最后一次修改时间',
  `upd_user` int unsigned COMMENT '记录最后一次修改人',
  `num` int unsigned not null COMMENT '评论序列号',
  `user_id` int unsigned not null COMMENT '评论用户id',
  `user_name` varchar(32) not null COMMENT '用户昵称',
  `pid` int unsigned COMMENT '父评论',
  `remark1` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark2` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark3` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark4` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark5` varchar(128) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='歌曲评论表';

CREATE TABLE `sys_bandmember_t` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint unsigned NOT NULL COMMENT '乐手类型,见乐手类型字典',
  `introduce` varchar(4096) NOT NULL COMMENT '乐手介绍',
  `img` timestamp NOT NULL DEFAULT now() COMMENT '乐手图片url',
  `crt_date` timestamp NOT NULL DEFAULT now() COMMENT '记录创建时间',
  `upd_date` timestamp not null default now() COMMENT '记录最后一次修改时间',
  `upd_user` int unsigned COMMENT '记录最后一次修改人',
  `num` int unsigned not null COMMENT '序号',
  `used` tinyint unsigned not null default 1 COMMENT '0：以往成员 1：现在成员',
  `remark1` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark2` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark3` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark4` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark5` varchar(128) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='乐队成员表';

CREATE TABLE `sys_experience_t` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `introduce` varchar(4096) NOT NULL COMMENT '经历内容',
  `crt_date` timestamp NOT NULL DEFAULT now() COMMENT '记录创建时间',
  `upd_date` timestamp NOT NULL DEFAULT now() COMMENT '记录最后一次修改时间',
  `upd_user` int unsigned COMMENT '记录最后一次修改人',
  `num` int unsigned not null COMMENT '序号',
  `used` tinyint unsigned not null default 1 COMMENT '0：不可见 1：可见',
  `remark1` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark2` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark3` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark4` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark5` varchar(128) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='乐队经历表';

CREATE TABLE `sys_collectr_t` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL COMMENT '用户id',
  `crt_date` timestamp NOT NULL DEFAULT now() COMMENT '记录创建时间',
  `upd_date` timestamp NOT NULL DEFAULT now() COMMENT '记录最后一次修改时间',
  `upd_user` int unsigned COMMENT '记录最后一次修改人',
  `type` tinyint not null COMMENT '主体类型，见主体字典',
  `entity_id` int unsigned not null COMMENT '主体id',
  `remark1` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark2` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark3` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark4` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark5` varchar(128) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='乐队收藏表';

CREATE TABLE `sys_extend_t` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` int unsigned NOT NULL COMMENT '用户id',
  `content` timestamp NOT NULL DEFAULT now() COMMENT '记录创建时间',
  `crt_date` timestamp NOT NULL DEFAULT now() COMMENT '记录创建时间',
  `upd_date` timestamp NOT NULL DEFAULT now() COMMENT '记录最后一次修改时间',
  `upd_user` int unsigned COMMENT '记录最后一次修改人',
  `remark1` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark2` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark3` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark4` varchar(128) DEFAULT NULL COMMENT '备用字段',
  `remark5` varchar(128) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推广广告表';


