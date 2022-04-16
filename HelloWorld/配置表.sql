-- Create table
create table sajet.G_PROCEDURE_MANAGE_FUN
(
  fun_id        NUMBER not null,
  function_name VARCHAR2(150),
  other1        VARCHAR2(150),
  other2        VARCHAR2(150),
  other3        VARCHAR2(150),
  other4        NUMBER,
  other5        NUMBER,
  other6        NUMBER,
  remark        VARCHAR2(150)
)
tablespace SYSBS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table sajet.G_PROCEDURE_MANAGE_FUN
  add constraint PRIMARY_KEY_FUNID primary key (FUN_ID)
  using index 
  tablespace SYSBS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );


-- Create table
create table sajet.G_PROCEDURE_MANAGE
(
  proce_id      NUMBER not null,
  proce_name    VARCHAR2(50),
  update_userid VARCHAR2(50),
  update_time   DATE default SYSDATE,
  menu_name     VARCHAR2(50),
  terminal_id   NUMBER,
  mac_address   VARCHAR2(50),
  function_name VARCHAR2(50),
  program_type  NUMBER default 0,
  proce_name1   VARCHAR2(50),
  remark        VARCHAR2(150)
)
tablespace SYSBS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column sajet.G_PROCEDURE_MANAGE.proce_id
  is '�洢ID';
comment on column sajet.G_PROCEDURE_MANAGE.proce_name
  is '�洢��';
comment on column sajet.G_PROCEDURE_MANAGE.menu_name
  is '�˵���(��������ʾ���û�����)';
comment on column sajet.G_PROCEDURE_MANAGE.terminal_id
  is 'վ��ID';
comment on column sajet.G_PROCEDURE_MANAGE.mac_address
  is 'MAC��ַ';
comment on column sajet.G_PROCEDURE_MANAGE.function_name
  is '������';
comment on column sajet.G_PROCEDURE_MANAGE.program_type
  is '��ʽ����(0��ͨ�ù�վ/���䣻1��ͨ�õ�Ƭ��װ)';
comment on column sajet.G_PROCEDURE_MANAGE.proce_name1
  is '��Ƭ��װchk�洢';
-- Create/Recreate primary, unique and foreign key constraints 
alter table sajet.G_PROCEDURE_MANAGE
  add constraint PROCE_ID_PK_M primary key (PROCE_ID)
  using index 
  tablespace SYSBS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );



-- Create table
create table sajet.G_PROCEDURE_AUTH_MANAGE
(
  proce_id      NUMBER not null,
  proce_name    VARCHAR2(50),
  update_userid VARCHAR2(50),
  update_time   DATE default SYSDATE,
  menu_name     VARCHAR2(50),
  emp_id        VARCHAR2(255),
  remark        VARCHAR2(255),
  proce_name1   VARCHAR2(50),
  terminal_id   NUMBER,
  mac_address   VARCHAR2(50),
  function_name VARCHAR2(50)
)
tablespace SYSBS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table sajet.G_PROCEDURE_AUTH_MANAGE
  is 'ɨ��ͨ��-�û�Ȩ��';
-- Add comments to the columns 
comment on column sajet.G_PROCEDURE_AUTH_MANAGE.proce_name
  is '�洢��';
comment on column sajet.G_PROCEDURE_AUTH_MANAGE.menu_name
  is '�˵���(��������ʾ���û�����)';
comment on column sajet.G_PROCEDURE_AUTH_MANAGE.emp_id
  is 'Ȩ���û���';
comment on column sajet.G_PROCEDURE_AUTH_MANAGE.proce_name1
  is 'Ԥ���洢1';
comment on column sajet.G_PROCEDURE_AUTH_MANAGE.terminal_id
  is 'վ��ID';
comment on column sajet.G_PROCEDURE_AUTH_MANAGE.mac_address
  is 'Mac��ַ';
comment on column sajet.G_PROCEDURE_AUTH_MANAGE.function_name
  is '������';
-- Create/Recreate primary, unique and foreign key constraints 
alter table sajet.G_PROCEDURE_AUTH_MANAGE
  add constraint PRIMARY_PRCOCE_ID_AUTH primary key (PROCE_ID)
  using index 
  tablespace SYSBS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
