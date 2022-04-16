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
  is '存储ID';
comment on column sajet.G_PROCEDURE_MANAGE.proce_name
  is '存储名';
comment on column sajet.G_PROCEDURE_MANAGE.menu_name
  is '菜单名(下拉框显示给用户看的)';
comment on column sajet.G_PROCEDURE_MANAGE.terminal_id
  is '站点ID';
comment on column sajet.G_PROCEDURE_MANAGE.mac_address
  is 'MAC地址';
comment on column sajet.G_PROCEDURE_MANAGE.function_name
  is '方法名';
comment on column sajet.G_PROCEDURE_MANAGE.program_type
  is '程式类型(0：通用过站/解箱；1：通用单片包装)';
comment on column sajet.G_PROCEDURE_MANAGE.proce_name1
  is '单片包装chk存储';
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
  is '扫码通用-用户权限';
-- Add comments to the columns 
comment on column sajet.G_PROCEDURE_AUTH_MANAGE.proce_name
  is '存储名';
comment on column sajet.G_PROCEDURE_AUTH_MANAGE.menu_name
  is '菜单名(下拉框显示给用户看的)';
comment on column sajet.G_PROCEDURE_AUTH_MANAGE.emp_id
  is '权限用户组';
comment on column sajet.G_PROCEDURE_AUTH_MANAGE.proce_name1
  is '预留存储1';
comment on column sajet.G_PROCEDURE_AUTH_MANAGE.terminal_id
  is '站点ID';
comment on column sajet.G_PROCEDURE_AUTH_MANAGE.mac_address
  is 'Mac地址';
comment on column sajet.G_PROCEDURE_AUTH_MANAGE.function_name
  is '方法名';
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
