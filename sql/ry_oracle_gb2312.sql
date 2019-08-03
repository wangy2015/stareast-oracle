-- ----------------------------
-- 1��������Ϣ��
-- ----------------------------
create sequence seq_sys_dept
 increment by 1
 start with 200
 nomaxvalue
 nominvalue
 cache 20;

drop table sys_dept cascade constraints;
create table sys_dept (
  dept_id 			number 		    not null,
  parent_id 		number		    default 0,
  ancestors 		varchar2(50)    default '',
  dept_name 		varchar2(30) 	default '',
  order_num 		number          default 0,
  leader            varchar2(20)    default null,
  phone             varchar2(11)    default null,
  email             varchar2(50)    default null,
  status 			char(1) 		default '0',
  del_flag			char(1) 		default '0',
  create_by         varchar(264)    default '',
  create_time 	    date,
  update_by         varchar2(64)    default '',
  update_time       date
);

alter table sys_dept add constraint pk_sys_dept primary key (dept_id);

comment on table  sys_dept              is '������Ϣ��';
comment on column sys_dept.dept_id      is '��������seq_sys_dept.nextval';
comment on column sys_dept.parent_id    is '������id';
comment on column sys_dept.ancestors    is '�漶�б�';
comment on column sys_dept.dept_name    is '��������';
comment on column sys_dept.order_num    is '��ʾ˳��';
comment on column sys_dept.leader       is '������';
comment on column sys_dept.phone        is '��ϵ�绰';
comment on column sys_dept.email        is '����';
comment on column sys_dept.status       is '����״̬��0���� 1ͣ�ã�';
comment on column sys_dept.del_flag     is 'ɾ����־��0������� 2����ɾ����';
comment on column sys_dept.create_by    is '������';
comment on column sys_dept.create_time  is '����ʱ��';
comment on column sys_dept.update_by    is '������';
comment on column sys_dept.update_time  is '����ʱ��';

-- ----------------------------
-- ��ʼ��-���ű�����
-- ----------------------------
insert into sys_dept values(100,  0,   '0',          '�����Ƽ�',   0, '����', '15888888888', 'ry@qq.com', '0', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'));
insert into sys_dept values(101,  100, '0,100',      '�����ܹ�˾', 1, '����', '15888888888', 'ry@qq.com', '0', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'));
insert into sys_dept values(102,  100, '0,100',      '��ɳ�ֹ�˾', 2, '����', '15888888888', 'ry@qq.com', '0', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'));
insert into sys_dept values(103,  101, '0,100,101',  '�з�����',   1, '����', '15888888888', 'ry@qq.com', '0', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'));
insert into sys_dept values(104,  101, '0,100,101',  '�г�����',   2, '����', '15888888888', 'ry@qq.com', '0', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'));
insert into sys_dept values(105,  101, '0,100,101',  '���Բ���',   3, '����', '15888888888', 'ry@qq.com', '0', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'));
insert into sys_dept values(106,  101, '0,100,101',  '������',   4, '����', '15888888888', 'ry@qq.com', '0', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'));
insert into sys_dept values(107,  101, '0,100,101',  '��ά����',   5, '����', '15888888888', 'ry@qq.com', '0', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'));
insert into sys_dept values(108,  102, '0,100,102',  '�г�����',   1, '����', '15888888888', 'ry@qq.com', '0', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'));
insert into sys_dept values(109,  102, '0,100,102',  '������',   2, '����', '15888888888', 'ry@qq.com', '0', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- 2���û���Ϣ��
-- ----------------------------
create sequence seq_sys_user
 increment by 1
 start with 100
 nomaxvalue
 nominvalue
 cache 20;

drop table sys_user cascade constraints;
create table sys_user (
  user_id 			number 		    not null,
  dept_id 			number 		    default null,
  login_name 		varchar2(30) 	not null,
  user_name 		varchar2(30) 	not null,
  user_type 		varchar2(2) 	default '00',
  email  			varchar2(50) 	default '',
  phonenumber  		varchar2(11) 	default '',
  sex  		        char(1) 	    default '0',
  avatar            varchar2(100) 	default '',
  password 			varchar2(50) 	default '',
  salt 				varchar2(20) 	default '',
  status 			char(1) 		default '0',
  del_flag			char(1) 		default '0',
  login_ip          varchar2(50)    default '',
  login_date        date,
  create_by         varchar2(64),
  create_time 	    date,
  update_by         varchar2(64)    default '',
  update_time       date,
  remark 		    varchar2(500) 	default ''
);

alter table sys_user add constraint pk_sys_user primary key (user_id);

comment on table  sys_user              is '�û���Ϣ��';
comment on column sys_user.user_id      is '�û�����seq_sys_user.nextval';
comment on column sys_user.dept_id      is '����ID';
comment on column sys_user.login_name   is '��¼�˺�';
comment on column sys_user.user_name    is '�û��ǳ�';
comment on column sys_user.user_type    is '�û����ͣ�00ϵͳ�û���';
comment on column sys_user.email        is '�û�����';
comment on column sys_user.phonenumber  is '�ֻ�����';
comment on column sys_user.sex          is '�û��Ա�0�� 1Ů 2δ֪��';
comment on column sys_user.avatar       is 'ͷ��·��';
comment on column sys_user.password     is '����';
comment on column sys_user.salt         is '�μ���';
comment on column sys_user.status       is '�ʺ�״̬��0���� 1ͣ�ã�';
comment on column sys_user.del_flag     is 'ɾ����־��0������� 2����ɾ����';
comment on column sys_user.login_ip     is '����½IP';
comment on column sys_user.login_date   is '����½ʱ��';
comment on column sys_user.create_by    is '������';
comment on column sys_user.create_time  is '����ʱ��';
comment on column sys_user.update_by    is '������';
comment on column sys_user.update_time  is '����ʱ��';
comment on column sys_user.remark       is '��ע';

-- ----------------------------
-- ��ʼ��-�û���Ϣ������
-- ----------------------------
insert into sys_user values(1,  103, 'admin', '����', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '����Ա');
insert into sys_user values(2,  105, 'ry',    '����', '00', 'ry@qq.com',  '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '����Ա');


-- ----------------------------
-- 3����λ��Ϣ��
-- ----------------------------
create sequence seq_sys_post
 increment by 1
 start with 10
 nomaxvalue
 nominvalue
 cache 20;

drop table sys_post cascade constraints;
create table sys_post
(
  post_id 			number 		    not null,
  post_code         varchar2(64)    not null,
  post_name         varchar2(50)    not null,
  post_sort         number          not null,
  status            char(1)         not null,
  create_by         varchar(264)    default '',
  create_time       date,
  update_by         varchar2(64) 	default '',
  update_time       date,
  remark 		    varchar(500)
);

alter table sys_post add constraint pk_sys_post primary key (post_id);

comment on table  sys_post              is '��λ��Ϣ��';
comment on column sys_post.post_id      is '��λ����seq_sys_post.nextval';
comment on column sys_post.post_code    is '��λ����';
comment on column sys_post.post_name    is '��λ����';
comment on column sys_post.post_sort    is '��ʾ˳��';
comment on column sys_post.status       is '״̬��0���� 1ͣ�ã�';
comment on column sys_post.create_by    is '������';
comment on column sys_post.create_time  is '����ʱ��';
comment on column sys_post.update_by    is '������';
comment on column sys_post.update_time  is '����ʱ��';
comment on column sys_post.remark       is '��ע';

-- ----------------------------
-- ��ʼ��-��λ��Ϣ������
-- ----------------------------
insert into sys_post values(1, 'ceo',  '���³�',    1, '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_post values(2, 'se',   '��Ŀ����',  2, '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_post values(3, 'hr',   '������Դ',  3, '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_post values(4, 'user', '��ͨԱ��',  4, '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');


-- ----------------------------
-- 4����ɫ��Ϣ��
-- ----------------------------
create sequence seq_sys_role
 increment by 1
 start with 100
 nomaxvalue
 nominvalue
 cache 20;

drop table sys_role cascade constraints;
create table sys_role (
  role_id 			number          not null,
  role_name 		varchar2(30) 	not null,
  role_key 		    varchar2(100) 	not null,
  role_sort         number          not null,
  data_scope        char(1) 	    default '1',
  status 			char(1) 		not null,
  del_flag			char(1) 		default '0',
  create_by         varchar2(64)    default '',
  create_time 		date,
  update_by 		varchar2(64) 	default '',
  update_time 		date,
  remark 			varchar2(500) 	default null
);

alter table sys_role add constraint pk_sys_role primary key (role_id);

comment on table  sys_role              is '��ɫ��Ϣ��';
comment on column sys_role.role_id      is '��ɫ����seq_sys_post.nextval';
comment on column sys_role.role_name    is '��ɫ����';
comment on column sys_role.role_key     is '��ɫȨ���ַ���';
comment on column sys_role.role_sort    is '��ʾ˳��';
comment on column sys_role.data_scope   is '���ݷ�Χ��1��ȫ������Ȩ�� 2���Զ�����Ȩ�ޣ�';
comment on column sys_role.status       is '��ɫ״̬��0���� 1ͣ�ã�';
comment on column sys_role.del_flag     is 'ɾ����־��0������� 2����ɾ����';
comment on column sys_role.create_by    is '������';
comment on column sys_role.create_time  is '����ʱ��';
comment on column sys_role.update_by    is '������';
comment on column sys_role.update_time  is '����ʱ��';
comment on column sys_role.remark       is '��ע';

-- ----------------------------
-- ��ʼ��-��ɫ��Ϣ������
-- ----------------------------
insert into sys_role values('1', '����Ա',   'admin',  1, 1, '0', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '����Ա');
insert into sys_role values('2', '��ͨ��ɫ', 'common', 2, 2, '0', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '��ͨ��ɫ');


-- ----------------------------
-- 5���˵�Ȩ�ޱ�
-- ----------------------------
create sequence seq_sys_menu
 increment by 1
 start with 2000
 nomaxvalue
 nominvalue
 cache 20;

drop table sys_menu cascade constraints;
create table sys_menu (
  menu_id 			number 		    not null,
  menu_name 		varchar2(50) 	not null,
  parent_id 		number          default 0,
  order_num 		number          default 0,
  url 				varchar2(200) 	default '#',
  target            varchar(20)     default '',
  menu_type 		char(1) 		default '',
  visible 			char(1) 		default 0,
  perms 			varchar2(100) 	default null,
  icon 				varchar2(100) 	default '#',
  create_by         varchar2(64)    default '',
  create_time 		date,
  update_by 		varchar2(64) 	default '',
  update_time 		date ,
  remark 			varchar2(500) 	default ''
);

alter table sys_menu add constraint pk_sys_menu primary key (menu_id);

comment on table  sys_menu              is '�˵�Ȩ�ޱ�';
comment on column sys_menu.menu_id      is '�˵�����seq_sys_post.nextval';
comment on column sys_menu.menu_name    is '�˵�����';
comment on column sys_menu.parent_id    is '���˵�ID';
comment on column sys_menu.order_num    is '��ʾ˳��';
comment on column sys_menu.url          is '�����ַ';
comment on column sys_menu.target       is '�򿪷�ʽ��menuItemҳǩ menuBlank�´��ڣ�'
comment on column sys_menu.menu_type    is '�˵����ͣ�MĿ¼ C�˵� F��ť��';
comment on column sys_menu.visible      is '�˵�״̬��0��ʾ 1���أ�';
comment on column sys_menu.perms        is 'Ȩ�ޱ�ʶ';
comment on column sys_menu.icon         is '�˵�ͼ��';
comment on column sys_menu.create_by    is '������';
comment on column sys_menu.create_time  is '����ʱ��';
comment on column sys_menu.update_by    is '������';
comment on column sys_menu.update_time  is '����ʱ��';
comment on column sys_menu.remark       is '��ע';

-- ----------------------------
-- ��ʼ��-�˵���Ϣ������
-- ----------------------------
-- һ���˵�
insert into sys_menu values('1', 'ϵͳ����', '0', '1', '#', '', 'M', '0', '', 'fa fa-gear',         'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ϵͳ����Ŀ¼');
insert into sys_menu values('2', 'ϵͳ���', '0', '2', '#', '', 'M', '0', '', 'fa fa-video-camera', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ϵͳ���Ŀ¼');
insert into sys_menu values('3', 'ϵͳ����', '0', '3', '#', '', 'M', '0', '', 'fa fa-bars',         'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ϵͳ����Ŀ¼');
-- �����˵�
insert into sys_menu values('100',  '�û�����', '1', '1', '/system/user',          '', 'C', '0', 'system:user:view',         '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '�û�����˵�');
insert into sys_menu values('101',  '��ɫ����', '1', '2', '/system/role',          '', 'C', '0', 'system:role:view',         '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '��ɫ����˵�');
insert into sys_menu values('102',  '�˵�����', '1', '3', '/system/menu',          '', 'C', '0', 'system:menu:view',         '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '�˵�����˵�');
insert into sys_menu values('103',  '���Ź���', '1', '4', '/system/dept',          '', 'C', '0', 'system:dept:view',         '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '���Ź���˵�');
insert into sys_menu values('104',  '��λ����', '1', '5', '/system/post',          '', 'C', '0', 'system:post:view',         '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '��λ����˵�');
insert into sys_menu values('105',  '�ֵ����', '1', '6', '/system/dict',          '', 'C', '0', 'system:dict:view',         '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '�ֵ����˵�');
insert into sys_menu values('106',  '��������', '1', '7', '/system/config',        '', 'C', '0', 'system:config:view',       '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '�������ò˵�');
insert into sys_menu values('107',  '֪ͨ����', '1', '8', '/system/notice',        '', 'C', '0', 'system:notice:view',       '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '֪ͨ����˵�');
insert into sys_menu values('108',  '��־����', '1', '9', '#',                     '', 'M', '0', '',                         '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '��־����˵�');
insert into sys_menu values('109',  '�����û�', '2', '1', '/monitor/online',       '', 'C', '0', 'monitor:online:view',      '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '�����û��˵�');
insert into sys_menu values('110',  '��ʱ����', '2', '2', '/monitor/job',          '', 'C', '0', 'monitor:job:view',         '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '��ʱ����˵�');
insert into sys_menu values('111',  '���ݼ��', '2', '3', '/monitor/data',         '', 'C', '0', 'monitor:data:view',        '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '���ݼ�ز˵�');
insert into sys_menu values('112',  '������', '2', '3', '/monitor/server',       '', 'C', '0', 'monitor:server:view',      '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '�����ز˵�');
insert into sys_menu values('113',  '������', '3', '1', '/tool/build',           '', 'C', '0', 'tool:build:view',          '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '�������˵�');
insert into sys_menu values('114',  '��������', '3', '2', '/tool/gen',             '', 'C', '0', 'tool:gen:view',            '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '�������ɲ˵�');
insert into sys_menu values('115',  'ϵͳ�ӿ�', '3', '3', '/tool/swagger',         '', 'C', '0', 'tool:swagger:view',        '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ϵͳ�ӿڲ˵�');
-- �����˵�
insert into sys_menu values('500',  '������־', '108', '1', '/monitor/operlog',    '', 'C', '0', 'monitor:operlog:view',     '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '������־�˵�');
insert into sys_menu values('501',  '��¼��־', '108', '2', '/monitor/logininfor', '', 'C', '0', 'monitor:logininfor:view',  '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '��¼��־�˵�');
-- �û�����ť
insert into sys_menu values('1000', '�û���ѯ', '100', '1',  '#', '',  'F', '0', 'system:user:list',        '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1001', '�û�����', '100', '2',  '#', '',  'F', '0', 'system:user:add',         '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1002', '�û��޸�', '100', '3',  '#', '',  'F', '0', 'system:user:edit',        '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1003', '�û�ɾ��', '100', '4',  '#', '',  'F', '0', 'system:user:remove',      '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1004', '�û�����', '100', '5',  '#', '',  'F', '0', 'system:user:export',      '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1005', '�û�����', '100', '6',  '#', '',  'F', '0', 'system:user:import',      '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1006', '��������', '100', '7',  '#', '',  'F', '0', 'system:user:resetPwd',    '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
-- ��ɫ����ť
insert into sys_menu values('1007', '��ɫ��ѯ', '101', '1',  '#', '',  'F', '0', 'system:role:list',        '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1008', '��ɫ����', '101', '2',  '#', '',  'F', '0', 'system:role:add',         '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1009', '��ɫ�޸�', '101', '3',  '#', '',  'F', '0', 'system:role:edit',        '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1010', '��ɫɾ��', '101', '4',  '#', '',  'F', '0', 'system:role:remove',      '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1011', '��ɫ����', '101', '5',  '#', '',  'F', '0', 'system:role:export',      '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
-- �˵�����ť
insert into sys_menu values('1012', '�˵���ѯ', '102', '1',  '#', '',  'F', '0', 'system:menu:list',        '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1013', '�˵�����', '102', '2',  '#', '',  'F', '0', 'system:menu:add',         '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1014', '�˵��޸�', '102', '3',  '#', '',  'F', '0', 'system:menu:edit',        '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1015', '�˵�ɾ��', '102', '4',  '#', '',  'F', '0', 'system:menu:remove',      '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
-- ���Ź���ť
insert into sys_menu values('1016', '���Ų�ѯ', '103', '1',  '#', '',  'F', '0', 'system:dept:list',        '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1017', '��������', '103', '2',  '#', '',  'F', '0', 'system:dept:add',         '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1018', '�����޸�', '103', '3',  '#', '',  'F', '0', 'system:dept:edit',        '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1019', '����ɾ��', '103', '4',  '#', '',  'F', '0', 'system:dept:remove',      '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
-- ��λ����ť
insert into sys_menu values('1020', '��λ��ѯ', '104', '1',  '#', '',  'F', '0', 'system:post:list',        '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1021', '��λ����', '104', '2',  '#', '',  'F', '0', 'system:post:add',         '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1022', '��λ�޸�', '104', '3',  '#', '',  'F', '0', 'system:post:edit',        '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1023', '��λɾ��', '104', '4',  '#', '',  'F', '0', 'system:post:remove',      '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1024', '��λ����', '104', '5',  '#', '',  'F', '0', 'system:post:export',      '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
-- �ֵ����ť
insert into sys_menu values('1025', '�ֵ��ѯ', '105', '1', '#', '',  'F', '0', 'system:dict:list',         '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1026', '�ֵ�����', '105', '2', '#', '',  'F', '0', 'system:dict:add',          '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1027', '�ֵ��޸�', '105', '3', '#', '',  'F', '0', 'system:dict:edit',         '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1028', '�ֵ�ɾ��', '105', '4', '#', '',  'F', '0', 'system:dict:remove',       '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1029', '�ֵ䵼��', '105', '5', '#', '',  'F', '0', 'system:dict:export',       '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
-- �������ð�ť
insert into sys_menu values('1030', '������ѯ', '106', '1', '#', '',  'F', '0', 'system:config:list',      '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1031', '��������', '106', '2', '#', '',  'F', '0', 'system:config:add',       '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1032', '�����޸�', '106', '3', '#', '',  'F', '0', 'system:config:edit',      '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1033', '����ɾ��', '106', '4', '#', '',  'F', '0', 'system:config:remove',    '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1034', '��������', '106', '5', '#', '',  'F', '0', 'system:config:export',    '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
-- ֪ͨ���水ť
insert into sys_menu values('1035', '�����ѯ', '107', '1', '#', '',  'F', '0', 'system:notice:list',      '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1036', '��������', '107', '2', '#', '',  'F', '0', 'system:notice:add',       '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1037', '�����޸�', '107', '3', '#', '',  'F', '0', 'system:notice:edit',      '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1038', '����ɾ��', '107', '4', '#', '',  'F', '0', 'system:notice:remove',    '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
-- ������־��ť
insert into sys_menu values('1039', '������ѯ', '500', '1', '#', '',  'F', '0', 'monitor:operlog:list',    '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1040', '����ɾ��', '500', '2', '#', '',  'F', '0', 'monitor:operlog:remove',  '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1041', '��ϸ��Ϣ', '500', '3', '#', '',  'F', '0', 'monitor:operlog:detail',  '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1042', '��־����', '500', '4', '#', '',  'F', '0', 'monitor:operlog:export',  '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
-- ��¼��־��ť
insert into sys_menu values('1043', '��¼��ѯ', '501', '1', '#', '',  'F', '0', 'monitor:logininfor:list',         '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1044', '��¼ɾ��', '501', '2', '#', '',  'F', '0', 'monitor:logininfor:remove',       '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1045', '��־����', '501', '3', '#', '',  'F', '0', 'monitor:logininfor:export',       '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
-- �����û���ť
insert into sys_menu values('1046', '���߲�ѯ', '109', '1', '#', '',  'F', '0', 'monitor:online:list',             '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1047', '����ǿ��', '109', '2', '#', '',  'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1048', '����ǿ��', '109', '3', '#', '',  'F', '0', 'monitor:online:forceLogout',      '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
-- ��ʱ����ť
insert into sys_menu values('1049', '�����ѯ', '110', '1', '#', '',  'F', '0', 'monitor:job:list',                '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1050', '��������', '110', '2', '#', '',  'F', '0', 'monitor:job:add',                 '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1051', '�����޸�', '110', '3', '#', '',  'F', '0', 'monitor:job:edit',                '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1052', '����ɾ��', '110', '4', '#', '',  'F', '0', 'monitor:job:remove',              '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1053', '״̬�޸�', '110', '5', '#', '',  'F', '0', 'monitor:job:changeStatus',        '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1054', '������ϸ', '110', '6', '#', '',  'F', '0', 'monitor:job:detail',              '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1055', '���񵼳�', '110', '7', '#', '',  'F', '0', 'monitor:job:export',              '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
-- �������ɰ�ť
insert into sys_menu values('1056', '���ɲ�ѯ', '114', '1', '#', '',  'F', '0', 'tool:gen:list',  '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_menu values('1057', '���ɴ���', '114', '2', '#', '',  'F', '0', 'tool:gen:code',  '#', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');


-- ----------------------------
-- 6���û��ͽ�ɫ������  �û�N-1��ɫ
-- ----------------------------
drop table sys_user_role cascade constraints;
create table sys_user_role (
  user_id 	number  not null,
  role_id 	number  not null
);

alter table sys_user_role add constraint pk_sys_user_role primary key (user_id, role_id);

comment on table  sys_user_role              is '�û��ͽ�ɫ������';
comment on column sys_user_role.user_id      is '�û�ID';
comment on column sys_user_role.role_id      is '��ɫID';

-- ----------------------------
-- ��ʼ��-�û��ͽ�ɫ����������
-- ----------------------------
insert into sys_user_role values ('1', '1');
insert into sys_user_role values ('2', '2');


-- ----------------------------
-- 7����ɫ�Ͳ˵�������  ��ɫ1-N�˵�
-- ----------------------------
drop table sys_role_menu cascade constraints;
create table sys_role_menu (
  role_id 	number  not null,
  menu_id 	number  not null
);

alter table sys_role_menu add constraint pk_sys_role_menu primary key (role_id, menu_id);

comment on table  sys_role_menu              is '��ɫ�Ͳ˵�������';
comment on column sys_role_menu.role_id      is '��ɫID';
comment on column sys_role_menu.menu_id      is '�˵�ID';

-- ----------------------------
-- ��ʼ��-��ɫ�Ͳ˵�����������
-- ----------------------------
insert into sys_role_menu values ('2', '1');
insert into sys_role_menu values ('2', '2');
insert into sys_role_menu values ('2', '3');
insert into sys_role_menu values ('2', '100');
insert into sys_role_menu values ('2', '101');
insert into sys_role_menu values ('2', '102');
insert into sys_role_menu values ('2', '103');
insert into sys_role_menu values ('2', '104');
insert into sys_role_menu values ('2', '105');
insert into sys_role_menu values ('2', '106');
insert into sys_role_menu values ('2', '107');
insert into sys_role_menu values ('2', '108');
insert into sys_role_menu values ('2', '109');
insert into sys_role_menu values ('2', '110');
insert into sys_role_menu values ('2', '111');
insert into sys_role_menu values ('2', '112');
insert into sys_role_menu values ('2', '113');
insert into sys_role_menu values ('2', '114');
insert into sys_role_menu values ('2', '115');
insert into sys_role_menu values ('2', '500');
insert into sys_role_menu values ('2', '501');
insert into sys_role_menu values ('2', '1000');
insert into sys_role_menu values ('2', '1001');
insert into sys_role_menu values ('2', '1002');
insert into sys_role_menu values ('2', '1003');
insert into sys_role_menu values ('2', '1004');
insert into sys_role_menu values ('2', '1005');
insert into sys_role_menu values ('2', '1006');
insert into sys_role_menu values ('2', '1007');
insert into sys_role_menu values ('2', '1008');
insert into sys_role_menu values ('2', '1009');
insert into sys_role_menu values ('2', '1010');
insert into sys_role_menu values ('2', '1011');
insert into sys_role_menu values ('2', '1012');
insert into sys_role_menu values ('2', '1013');
insert into sys_role_menu values ('2', '1014');
insert into sys_role_menu values ('2', '1015');
insert into sys_role_menu values ('2', '1016');
insert into sys_role_menu values ('2', '1017');
insert into sys_role_menu values ('2', '1018');
insert into sys_role_menu values ('2', '1019');
insert into sys_role_menu values ('2', '1020');
insert into sys_role_menu values ('2', '1021');
insert into sys_role_menu values ('2', '1022');
insert into sys_role_menu values ('2', '1023');
insert into sys_role_menu values ('2', '1024');
insert into sys_role_menu values ('2', '1025');
insert into sys_role_menu values ('2', '1026');
insert into sys_role_menu values ('2', '1027');
insert into sys_role_menu values ('2', '1028');
insert into sys_role_menu values ('2', '1029');
insert into sys_role_menu values ('2', '1030');
insert into sys_role_menu values ('2', '1031');
insert into sys_role_menu values ('2', '1032');
insert into sys_role_menu values ('2', '1033');
insert into sys_role_menu values ('2', '1034');
insert into sys_role_menu values ('2', '1035');
insert into sys_role_menu values ('2', '1036');
insert into sys_role_menu values ('2', '1037');
insert into sys_role_menu values ('2', '1038');
insert into sys_role_menu values ('2', '1039');
insert into sys_role_menu values ('2', '1040');
insert into sys_role_menu values ('2', '1041');
insert into sys_role_menu values ('2', '1042');
insert into sys_role_menu values ('2', '1043');
insert into sys_role_menu values ('2', '1044');
insert into sys_role_menu values ('2', '1045');
insert into sys_role_menu values ('2', '1046');
insert into sys_role_menu values ('2', '1047');
insert into sys_role_menu values ('2', '1048');
insert into sys_role_menu values ('2', '1049');
insert into sys_role_menu values ('2', '1050');
insert into sys_role_menu values ('2', '1051');
insert into sys_role_menu values ('2', '1052');
insert into sys_role_menu values ('2', '1053');
insert into sys_role_menu values ('2', '1054');
insert into sys_role_menu values ('2', '1055');
insert into sys_role_menu values ('2', '1056');

-- ----------------------------
-- 8����ɫ�Ͳ��Ź�����  ��ɫ1-N����
-- ----------------------------
drop table sys_role_dept cascade constraints;
create table sys_role_dept (
  role_id 	number  not null,
  dept_id 	number  not null
);

alter table sys_role_dept add constraint pk_sys_role_dept primary key (role_id, dept_id);

comment on table  sys_role_dept              is '��ɫ�Ͳ��Ź�����';
comment on column sys_role_dept.role_id      is '��ɫID';
comment on column sys_role_dept.dept_id      is '����ID';

-- ----------------------------
-- ��ʼ��-��ɫ�Ͳ��Ź���������
-- ----------------------------
insert into sys_role_dept values ('2', '100');
insert into sys_role_dept values ('2', '101');
insert into sys_role_dept values ('2', '105');

-- ----------------------------
-- 9���û����λ������  �û�1-N��λ
-- ----------------------------
drop table sys_user_post cascade constraints;
create table sys_user_post
(
	user_id number  not null,
	post_id number  not null
);

alter table sys_user_post add constraint pk_sys_user_post primary key (user_id, post_id);

comment on table  sys_user_post              is '�û����λ������';
comment on column sys_user_post.user_id      is '�û�ID';
comment on column sys_user_post.post_id      is '��λID';

-- ----------------------------
-- ��ʼ��-�û����λ����������
-- ----------------------------
insert into sys_user_post values ('1', '1');
insert into sys_user_post values ('2', '2');


-- ----------------------------
-- 10��������־��¼
-- ----------------------------
create sequence seq_sys_oper_log
 increment by 1
 start with 100
 nomaxvalue
 nominvalue
 cache 20;

drop table sys_oper_log cascade constraints;
create table sys_oper_log (
  oper_id 			number          not null ,
  title             varchar2(50)    default '',
  business_type     number          default 0,
  method            varchar2(100)   default '',
  operator_type     number          default 0,
  oper_name 	    varchar2(50)    default '',
  dept_name 		varchar2(50)    default '',
  oper_url 		    varchar2(255) 	default '',
  oper_ip 			varchar2(50) 	default '',
  oper_location     varchar2(255)   default '',
  oper_param 		varchar2(2000) 	default '',
  status 			number 		    default 0,
  error_msg 		varchar2(2000) 	default '' ,
  oper_time 		date
);

alter table sys_oper_log add constraint pk_sys_oper_log primary key (oper_id);

comment on table  sys_oper_log               is '������־��¼';
comment on column sys_oper_log.oper_id       is '��־����seq_sys_oper_log.nextval';
comment on column sys_oper_log.title         is 'ģ�����';
comment on column sys_oper_log.business_type is 'ҵ�����ͣ�0���� 1���� 2�޸� 3ɾ����';
comment on column sys_oper_log.method        is '��������';
comment on column sys_oper_log.operator_type is '�������0���� 1��̨�û� 2�ֻ����û���';
comment on column sys_oper_log.oper_name     is '������Ա';
comment on column sys_oper_log.dept_name     is '��������';
comment on column sys_oper_log.oper_url      is '����URL';
comment on column sys_oper_log.oper_ip       is '������ַ';
comment on column sys_oper_log.oper_location is '�����ص�';
comment on column sys_oper_log.oper_param    is '�������';
comment on column sys_oper_log.status        is '����״̬��0���� 1�쳣��';
comment on column sys_oper_log.error_msg     is '������Ϣ';
comment on column sys_oper_log.oper_time     is '����ʱ��';


-- ----------------------------
-- 11���ֵ����ͱ�
-- ----------------------------
create sequence seq_sys_dict_type
 increment by 1
 start with 100
 nomaxvalue
 nominvalue
 cache 20;
 
drop table sys_dict_type cascade constraints;
create table sys_dict_type
(
	dict_id          number          not null,
	dict_name        varchar2(100)   default '',
	dict_type        varchar2(100)   default '',
    status 			 char(1) 		 default '0',
    create_by        varchar2(64)    default '',
    create_time      date,
    update_by        varchar2(64) 	 default '',
	update_time      date,
    remark 	         varchar2(500) 	 default null
);

alter table sys_dict_type add constraint pk_sys_dict_type primary key (dict_id);
create unique index sys_dict_type_index1 on sys_dict_type (dict_type);

comment on table  sys_dict_type               is '�ֵ����ͱ�';
comment on column sys_dict_type.dict_id       is '�ֵ�����seq_sys_dict_type.nextval';
comment on column sys_dict_type.dict_name     is '�ֵ�����';
comment on column sys_dict_type.dict_type     is '�ֵ�����';
comment on column sys_dict_type.status        is '״̬��0���� 1ͣ�ã�';
comment on column sys_dict_type.create_by     is '������';
comment on column sys_dict_type.create_time   is '����ʱ��';
comment on column sys_dict_type.update_by     is '������';
comment on column sys_dict_type.update_time   is '����ʱ��';
comment on column sys_dict_type.remark        is '��ע';

insert into sys_dict_type values(1,  '�û��Ա�', 'sys_user_sex',        '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '�û��Ա��б�');
insert into sys_dict_type values(2,  '�˵�״̬', 'sys_show_hide',       '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '�˵�״̬�б�');
insert into sys_dict_type values(3,  'ϵͳ����', 'sys_normal_disable',  '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ϵͳ�����б�');
insert into sys_dict_type values(4,  '����״̬', 'sys_job_status',      '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '����״̬�б�');
insert into sys_dict_type values(5,  'ϵͳ�Ƿ�', 'sys_yes_no',          '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ϵͳ�Ƿ��б�');
insert into sys_dict_type values(6,  '֪ͨ����', 'sys_notice_type',     '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '֪ͨ�����б�');
insert into sys_dict_type values(7,  '֪ͨ״̬', 'sys_notice_status',   '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '֪ͨ״̬�б�');
insert into sys_dict_type values(8,  '��������', 'sys_oper_type',       '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '���������б�');
insert into sys_dict_type values(9,  'ϵͳ״̬', 'sys_common_status',   '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '��¼״̬�б�');


-- ----------------------------
-- 12���ֵ����ݱ�
-- ----------------------------
create sequence seq_sys_dict_data
 increment by 1
 start with 100
 nomaxvalue
 nominvalue
 cache 20;
 
drop table sys_dict_data cascade constraints;
create table sys_dict_data
(
	dict_code        number          not null,
	dict_sort        number          default 0,
	dict_label       varchar2(100)   default '',
	dict_value       varchar2(100)   default '',
	dict_type        varchar2(100)   default '',
	css_class        varchar2(100)   default null,
	list_class       varchar2(100)   default null,
	is_default       char(1)         default 'N',
    status 			 char(1) 		 default '0',
    create_by        varchar2(64)    default '',
    create_time      date,
    update_by        varchar2(64) 	 default '',
	update_time      date,
    remark 	         varchar2(500) 	 default null
);

alter table sys_dict_data add constraint pk_sys_dict_data primary key (dict_code);

comment on table  sys_dict_data               is '�ֵ����ݱ�';
comment on column sys_dict_data.dict_code     is '�ֵ�����seq_sys_dict_data.nextval';
comment on column sys_dict_data.dict_sort     is '�ֵ�����';
comment on column sys_dict_data.dict_label    is '�ֵ��ǩ';
comment on column sys_dict_data.dict_value    is '�ֵ��ֵ';
comment on column sys_dict_data.dict_type     is '�ֵ�����';
comment on column sys_dict_data.css_class     is '��ʽ���ԣ�������ʽ��չ��';
comment on column sys_dict_data.list_class    is '��������ʽ';
comment on column sys_dict_data.is_default    is '�Ƿ�Ĭ�ϣ�Y�� N��';
comment on column sys_dict_data.status        is '״̬��0���� 1ͣ�ã�';
comment on column sys_dict_data.create_by     is '������';
comment on column sys_dict_data.create_time   is '����ʱ��';
comment on column sys_dict_data.update_by     is '������';
comment on column sys_dict_data.update_time   is '����ʱ��';
comment on column sys_dict_data.remark        is '��ע';

insert into sys_dict_data values(1,  1,  '��',       '0',  'sys_user_sex',        '',   '',        'Y', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '�Ա���');
insert into sys_dict_data values(2,  2,  'Ů',       '1',  'sys_user_sex',        '',   '',        'N', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '�Ա�Ů');
insert into sys_dict_data values(3,  3,  'δ֪',     '2',  'sys_user_sex',        '',   '',        'N', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '�Ա�δ֪');
insert into sys_dict_data values(4,  1,  '��ʾ',     '0',  'sys_show_hide',       '',   'primary', 'Y', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '��ʾ�˵�');
insert into sys_dict_data values(5,  2,  '����',     '1',  'sys_show_hide',       '',   'danger',  'N', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '���ز˵�');
insert into sys_dict_data values(6,  1,  '����',     '0',  'sys_normal_disable',  '',   'primary', 'Y', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '����״̬');
insert into sys_dict_data values(7,  2,  'ͣ��',     '1',  'sys_normal_disable',  '',   'danger',  'N', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ͣ��״̬');
insert into sys_dict_data values(8,  1,  '����',     '0',  'sys_job_status',      '',   'primary', 'Y', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '����״̬');
insert into sys_dict_data values(9,  2,  '��ͣ',     '1',  'sys_job_status',      '',   'danger',  'N', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ͣ��״̬');
insert into sys_dict_data values(10, 1,  '��',       'Y',  'sys_yes_no',          '',   'primary', 'Y', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ϵͳĬ����');
insert into sys_dict_data values(11, 2,  '��',       'N',  'sys_yes_no',          '',   'danger',  'N', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ϵͳĬ�Ϸ�');
insert into sys_dict_data values(12, 1,  '֪ͨ',     '1',  'sys_notice_type',     '',   'warning', 'Y', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '֪ͨ');
insert into sys_dict_data values(13, 2,  '����',     '2',  'sys_notice_type',     '',   'success', 'N', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '����');
insert into sys_dict_data values(14, 1,  '����',     '0',  'sys_notice_status',   '',   'primary', 'Y', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '����״̬');
insert into sys_dict_data values(15, 2,  '�ر�',     '1',  'sys_notice_status',   '',   'danger',  'N', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '�ر�״̬');
insert into sys_dict_data values(16, 1,  '����',     '1',  'sys_oper_type',       '',   'info',    'N', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '��������');
insert into sys_dict_data values(17, 2,  '�޸�',     '2',  'sys_oper_type',       '',   'info',    'N', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '�޸Ĳ���');
insert into sys_dict_data values(18, 3,  'ɾ��',     '3',  'sys_oper_type',       '',   'danger',  'N', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ɾ������');
insert into sys_dict_data values(19, 4,  '��Ȩ',     '4',  'sys_oper_type',       '',   'primary', 'N', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '��Ȩ����');
insert into sys_dict_data values(20, 5,  '����',     '5',  'sys_oper_type',       '',   'warning', 'N', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '��������');
insert into sys_dict_data values(21, 6,  '����',     '6',  'sys_oper_type',       '',   'warning', 'N', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '�������');
insert into sys_dict_data values(22, 7,  'ǿ��',     '7',  'sys_oper_type',       '',   'danger',  'N', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ǿ�˲���');
insert into sys_dict_data values(23, 8,  '���ɴ���', '8',  'sys_oper_type',       '',   'warning', 'N', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '���ɲ���');
insert into sys_dict_data values(24, 8,  '�������', '9',  'sys_oper_type',       '',   'danger',  'N', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '��ղ���');
insert into sys_dict_data values(25, 1,  '�ɹ�',     '0',  'sys_common_status',   '',   'primary', 'N', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '����״̬');
insert into sys_dict_data values(26, 2,  'ʧ��',     '1',  'sys_common_status',   '',   'danger',  'N', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ͣ��״̬');


-- ----------------------------
-- 13���������ñ�
-- ----------------------------
create sequence seq_sys_config
 increment by 1
 start with 100
 nomaxvalue
 nominvalue
 cache 20;

drop table sys_config cascade constraints;
create table sys_config (
	config_id 		   number        not null,
	config_name        varchar2(100) default '',
	config_key         varchar2(100) default '',
	config_value       varchar2(100) default '',
	config_type        char(1)       default 'N',
    create_by          varchar2(64)  default '',
    create_time 	   date,
    update_by          varchar2(64)  default '',
    update_time        date,
	remark 	           varchar2(500)  default null
);

alter table sys_config add constraint pk_sys_config primary key (config_id);

comment on table  sys_config               is '�������ñ�';
comment on column sys_config.config_id     is '��������seq_sys_config.nextval';
comment on column sys_config.config_name   is '��������';
comment on column sys_config.config_key    is '��������';
comment on column sys_config.config_value  is '������ֵ';
comment on column sys_config.config_type   is 'ϵͳ���ã�Y�� N��';
comment on column sys_config.create_by     is '������';
comment on column sys_config.create_time   is '����ʱ��';
comment on column sys_config.update_by     is '������';
comment on column sys_config.update_time   is '����ʱ��';
comment on column sys_config.remark        is '��ע';

insert into sys_config values(1, '�����ҳ-Ĭ��Ƥ����ʽ����', 'sys.index.skinName',     'skin-blue',     'Y', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '��ɫ skin-blue����ɫ skin-green����ɫ skin-purple����ɫ skin-red����ɫ skin-yellow' );
insert into sys_config values(2, '�û�����-�˺ų�ʼ����',     'sys.user.initPassword',  '123456',        'Y', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '��ʼ������ 123456' );


-- ----------------------------
-- 14��ϵͳ���ʼ�¼
-- ----------------------------
create sequence seq_sys_logininfor
 increment by 1
 start with 100
 nomaxvalue
 nominvalue
 cache 20;

drop table sys_logininfor cascade constraints;
create table sys_logininfor (
  info_id 		 number        not null,
  login_name 	 varchar2(50)   default '',
  ipaddr 		 varchar2(50)   default '',
  login_location varchar2(255)  default '',
  browser  		 varchar2(50)   default '',
  os      		 varchar2(50)   default '',
  status 		 char(1) 	   default '0',
  msg      		 varchar2(255)  default '',
  login_time 	 date
);

alter table sys_logininfor add constraint pk_sys_logininfor primary key (info_id);

comment on table  sys_logininfor                is 'ϵͳ���ʼ�¼';
comment on column sys_logininfor.info_id        is '��������seq_seq_sys_logininfor.nextval';
comment on column sys_logininfor.login_name     is '��¼�˺�';
comment on column sys_logininfor.ipaddr         is '��¼IP��ַ';
comment on column sys_logininfor.login_location is '��¼�ص�';
comment on column sys_logininfor.browser        is '���������';
comment on column sys_logininfor.os             is '����ϵͳ';
comment on column sys_logininfor.status         is '��¼״̬��0�ɹ� 1ʧ�ܣ�';
comment on column sys_logininfor.msg            is '��ʾ��Ϣ';
comment on column sys_logininfor.login_time     is '����ʱ��';

-- ----------------------------
-- 15�������û���¼
-- ----------------------------
drop table sys_user_online cascade constraints;
create table sys_user_online (
  sessionId 	    varchar2(50)  default '',
  login_name 	    varchar2(50)  default '',
  dept_name 		varchar2(50)  default '',
  ipaddr 		    varchar2(50)  default '',
  login_location    varchar2(255) default '',
  browser  		    varchar2(50)  default '',
  os      		    varchar2(50)  default '',
  status      	    varchar2(10)  default '',
  start_timestamp 	date,
  last_access_time  date,
  expire_time 	    number 		 default 0
);

alter table sys_user_online add constraint pk_sys_user_online primary key (sessionId);

comment on table  sys_user_online                   is '�����û���¼';
comment on column sys_user_online.sessionId         is '�û��Ựid';
comment on column sys_user_online.login_name        is '��¼�˺�';
comment on column sys_user_online.dept_name         is '��������';
comment on column sys_user_online.ipaddr            is '��¼IP��ַ';
comment on column sys_user_online.login_location    is '��¼�ص�';
comment on column sys_user_online.browser           is '���������';
comment on column sys_user_online.os                is '����ϵͳ';
comment on column sys_user_online.status            is '����״̬on_line����off_line����';
comment on column sys_user_online.start_timestamp   is 'session����ʱ��';
comment on column sys_user_online.last_access_time  is 'session������ʱ��';
comment on column sys_user_online.expire_time       is '��ʱʱ�䣬��λΪ����';

-- ----------------------------
-- 16����ʱ������ȱ�
-- ----------------------------
create sequence seq_sys_job
 increment by 1
 start with 100
 nomaxvalue
 nominvalue
 cache 20;
 
drop table sys_job cascade constraints;
create table sys_job (
  job_id 		      number 	     not null,
  job_name            varchar2(64)   default '',
  job_group           varchar2(64)   default '',
  method_name         varchar2(500)  default '',
  method_params       varchar2(200)  default null,
  cron_expression     varchar2(255)  default '',
  misfire_policy      varchar2(20)   default '3',
  concurrent          char(1)        default '1',
  status              char(1)        default '0',
  create_by           varchar2(64)   default '',
  create_time         date,
  update_by           varchar2(64)   default '',
  update_time         date,
  remark              varchar(500)   default ''
);

alter table sys_job add constraint pk_sys_job primary key (job_id, job_name, job_group);

comment on table  sys_job                   is '��ʱ������ȱ�';
comment on column sys_job.job_id            is '��������seq_sys_job.nextval';
comment on column sys_job.job_name          is '��������';
comment on column sys_job.job_group         is '��������';
comment on column sys_job.method_name       is '���񷽷�';
comment on column sys_job.method_params     is '��������';
comment on column sys_job.cron_expression   is 'cronִ�б��ʽ';
comment on column sys_job.misfire_policy    is '�ƻ�ִ�д�����ԣ�1����ִ�� 2ִ��һ�� 3����ִ�У�';
comment on column sys_job.concurrent        is '�Ƿ񲢷�ִ�У�0���� 1��ֹ��';
comment on column sys_job.status            is '״̬��0���� 1��ͣ��';
comment on column sys_job.create_by         is '������';
comment on column sys_job.create_time       is '����ʱ��';
comment on column sys_job.update_by         is '������';
comment on column sys_job.update_time       is '����ʱ��';
comment on column sys_job.remark            is '��ע��Ϣ';

insert into sys_job values(1, 'ryTask', 'ϵͳĬ�ϣ��޲Σ�', 'ryNoParams',  '',   '0/10 * * * * ?', '3', '0', '1', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');
insert into sys_job values(2, 'ryTask', 'ϵͳĬ�ϣ��вΣ�', 'ryParams',    'ry', '0/20 * * * * ?', '3', '0', '1', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '');


-- ----------------------------
-- 17����ʱ���������־��
-- ----------------------------
create sequence seq_sys_job_log
 increment by 1
 start with 1
 nomaxvalue
 nominvalue
 cache 20;

drop table sys_job_log cascade constraints;
create table sys_job_log (
  job_log_id          number	     not null,
  job_name            varchar2(64)   not null,
  job_group           varchar2(64)   not null,
  method_name         varchar2(500),
  method_params       varchar2(200)  default null,
  job_message         varchar2(500),
  status              char(1)        default '0',
  exception_info      varchar2(2000) default '',
  create_time         date
);

alter table sys_job_log add constraint pk_sys_job_log primary key (job_log_id);

comment on table  sys_job_log                   is '��ʱ���������־��';
comment on column sys_job_log.job_log_id        is '��־����seq_sys_job_log.nextval';
comment on column sys_job_log.job_name          is '��������';
comment on column sys_job_log.job_group         is '��������';
comment on column sys_job_log.method_name       is '���񷽷�';
comment on column sys_job_log.method_params     is '��������';
comment on column sys_job_log.job_message       is '��־��Ϣ';
comment on column sys_job_log.status            is 'ִ��״̬��0���� 1ʧ�ܣ�';
comment on column sys_job_log.exception_info    is '�쳣��Ϣ';
comment on column sys_job_log.create_time       is '����ʱ��';


-- ----------------------------
-- 18��֪ͨ�����
-- ----------------------------
create sequence seq_sys_notice
 increment by 1
 start with 100
 nomaxvalue
 nominvalue
 cache 20;

drop table sys_notice cascade constraints;
create table sys_notice (
  notice_id 		number 		    not null,
  notice_title 		varchar2(50) 	not null,
  notice_type 		char(1) 	    not null,
  notice_content    varchar2(2000)  default null,
  status 			char(1) 		default '0',
  create_by         varchar2(64)    default '',
  create_time 		date,
  update_by 		varchar2(64) 	default '',
  update_time 		date,
  remark 			varchar2(255) 	default null
);

alter table sys_notice add constraint pk_sys_notice primary key (notice_id);

comment on table  sys_notice                   is '֪ͨ�����';
comment on column sys_notice.notice_id         is '��������seq_sys_notice.nextval';
comment on column sys_notice.notice_title      is '�������';
comment on column sys_notice.notice_type       is '�������ͣ�1֪ͨ 2���棩';
comment on column sys_notice.notice_content    is '��������';
comment on column sys_notice.status            is '����״̬��0���� 1�رգ�';
comment on column sys_notice.create_by         is '������';
comment on column sys_notice.create_time       is '����ʱ��';
comment on column sys_notice.update_by         is '������';
comment on column sys_notice.update_time       is '����ʱ��';
comment on column sys_notice.remark            is '��ע';

-- ----------------------------
-- ��ʼ��-������Ϣ������
-- ----------------------------
insert into sys_notice values('1', '��ܰ���ѣ�2018-07-01 �����°汾������', '2', '�°汾����', '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '����Ա');
insert into sys_notice values('2', 'ά��֪ͨ��2018-07-01 ����ϵͳ�賿ά��', '1', 'ά������',   '0', 'admin', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), 'ry', TO_DATE('2018-03-16 11-33-00', 'YYYY-MM-DD HH24:MI:SS'), '����Ա');

commit;