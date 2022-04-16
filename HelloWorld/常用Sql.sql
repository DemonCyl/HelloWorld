
/*
command_code_machine 主要的存储过程
sj_ckrt_route 卡涂成
sj_transfer  过站
sj_ate_machine_data 记录测试数据
*/

-- WMS 获取采购单信息
select n.pmn04,--料号
i.ima02,--品名
i.ima021,--规格
i.ima09,--机种
m.pmm12, --采购人工号
gn.gen02,--采购人姓名
n.pmn20,--采购数量
k.pmk13,--请购部门代号
gm.gem02,--请购部门名称
i.ima25,--计量单位
m.pmm09,--厂商代码
p.pmc081--厂商名称
,m.dbname
from pmm_file@topdb m
INNER join pmn_file@topdb n on m.dbname = n.dbname and m.pmm01 = n.pmn01
LEFT join pmk_file@topdb k on k.dbname = n.dbname and n.pmn24 = k.pmk01
LEFT join gem_file@topdb gm on gm.dbname = k.dbname and k.pmk13 = gm.gem01
LEFT join gen_file@topdb gn on gn.dbname = m.dbname and m.pmm12 = gn.gen01
LEFT join ima_file@topdb i on n.dbname = i.dbname and n.pmn04 = i.ima01
LEFT join pmc_file@topdb p on p.dbname = m.dbname and m.pmm09 = p.pmc01
where m.pmm01 = '23B-220100143'--采购单单号
and n.pmn02 = 1--采购单项次
--AND m.dbname = 'rida'

sajet.P_WO_ISSUE_RETURN           --发料信息表 
sajet.P_WO_ISSUE_RETURN_MSG       --发料SAP返回信息表 
sajet.P_WO_CONSUME_RETURN_HEAD    --入库HEAD  
sajet.P_WO_CONSUME_RETURN_DETAIL  --入库ITEMS 
sajet.P_WO_CONSUME_RETURN_MSG     --入库MSG   

--定时任务
  declare job number; 
  begin 
   sys.dbms_job.submit(job,'sajet.sj_commtemp_del(2);',sysdate,'TRUNC(sysdate+1)');
  commit; 
  end;

  create or replace procedure sj_commtemp_del(tdays number) is
  begin
    delete SAJET.SYS_COMMON_TEMP t where t.create_time<sysdate-tdays;
  end;


--公共序列
  create sequence sajet.seq_common
  minvalue 1
  maxvalue 999999
  start with 1000000
  increment by 1
  NOCACHE  ORDER  CYCLE;

  create or replace procedure sajet.seq_commonhelper_reset(v_seqname varchar2) as n number(20);
  tsql varchar2(100);
  begin
  execute immediate 'select '||v_seqname||'.nextval from dual' into n;
  n:=-(n);
  tsql:='alter sequence '||v_seqname||' increment by '|| n;
  execute immediate tsql;
  execute immediate 'select '||v_seqname||'.nextval from dual' into n;
  tsql:='alter sequence '||v_seqname||' increment by 1';
  execute immediate tsql;
  end seq_commonhelper_reset;

  declare job number; 
  begin 
   sys.dbms_job.submit(job,'sajet.seq_commonhelper_reset(''sajet.seq_commonhelper'');',sysdate,'TRUNC(sysdate+1)');
  commit; 
  end;

--------------- 
select sid,serial# from v$session t where t.SID IN (select session_id from v$locked_object);
alter system kill session '478,4221';

select * from sajet.g_rmaback_log;   ---RMA 签退
select * from sajet.g_rmabatchback_log;  ---RMA 批退
select * from SAJET.G_RMACONSMETIC_CHECK_LOG;  ---RMA外观初判记录
select * from SAJET.G_AGRADE_LOG;  ---A-Grade刷入记录

--ORACLE Kill 杀死正在执行的存储过程,执行KILL_COMMAND字段中的语句即可
SELECT B.SID,
       B.SERIAL#,
       A.OBJECT,
       'alter system kill session   ' || '''' || B.SID || ',' || B.SERIAL# ||
       ''';' KILL_COMMAND
  FROM SYS.V_$ACCESS A, SYS.V_$SESSION B
 WHERE A.TYPE = 'PROCEDURE'
   AND (A.OBJECT LIKE UPPER('%存储过程名%') OR A.OBJECT LIKE LOWER('%存储过程名%'))
   AND A.SID = B.SID
   AND B.STATUS = 'ACTIVE';


SELECT SAJET.PASSWORD.ENCRYPT('123456') FROM dual;
SELECT SAJET.PASSWORD.decrypt('7483170F3F82FC14') FROM dual;
SELECT SAJET.PASSWORD.compare('123456','7483170F3F82FC14') FROM dual;

-- 通用function配置表 开发加菜单function值
SELECT t.*,ROWID FROM SAJET.G_PROCEDURE_MANAGE_FUN T;


--查询戚哥报表是否用到表G_SN_TRAVEL以CURRENT_STATUS为索引
select t.report_sql, rowid from sajet.sys_cust_report t
where UPPER(report_sql) LIKE UPPER('%G_SN_TRAVEL%WHERE%CURRENT_STATUS%');

-- BOBCAT目前涉及到的表：
select t.*,rowid from sajet.m_nitestrecord_t t; --PASS 的详细记录表
select t.*,rowid from sajet.m_nitestfailrecord_t t; --FAIL 的详细记录表
select t.*,rowid from sajet.g_web_log t; --执行完BOBCAT 过站的日志表
select t.*,rowid from sajet.g_bobcat_info_log t; --未配置BOBCAT站点报错日志
select t.*,rowid from sajet.bobcat_station_mapping t --BOBCAT站点配置表

-- 查数据库存储过程 包含xxx
SELECT t.* FROM ALL_SOURCE t WHERE UPPER(t.TEXT) LIKE UPPER('%%');
SELECT t.* FROM ALL_SOURCE t WHERE INSTR(UPPER(t.text),'G_SN_STATUS') > 0;

--配置Option
select * from sajet.sys_sql;
select * from sajet.sys_part;
select * from sajet.v_part

--根据菜单名查询代码所在
select t.*,rowid from sajet.sys_program_fun_name t WHERE t.FUN_CN like '%Code%'

--制程类型
select * from sys_operate_type

--这个表如果不加ROWNUM<10半天查不出来
select t.*,ROWNUM  from sajet.g_sn_status t where ROWNUM<10 order by OUT_PROCESS_TIME desc

--查询哪些表锁死了
SELECT B.OWNER
      ,B.OBJECT_NAME
      ,A.SESSION_ID
      ,A.LOCKED_MODE 
FROM V$LOCKED_OBJECT A,DBA_OBJECTS B WHERE B.OBJECT_ID = A.OBJECT_ID;
/*
当发现有表被锁了，
第一反应是MES中删除表SAJET.g_sn_nocheck_times记录
而PL/SQL中也对表SAJET.g_sn_nocheck_times记录进行了删除,但是没点击提交或者回滚
*/

--查询途程
select * from  sys_route where route_name like '%B+%'
select b.process_id, b.process_name,b.process_desc2,t.step  from   sajet.sys_route_detail t,sys_process b,sajet.sys_operate_type c
where  t.route_id = 10000065  and t.next_process_id= b.process_id(+) and b.operate_id = c.operate_id 
order by t.step


--找回10分钟之前删除的数据
insert into sajet.g_pack_carton
SELECT * FROM sajet.g_pack_carton as of timestamp sysdate -10/1440 where CARTON_NO ='RSJB210831192317';

--回滚更新提交后的数据
select * from sajet.wo_pack_split where carton_no='RSFN210824010840'

update sajet.wo_pack_split set carton_no='N/A'

select carton_no from sajet.wo_pack_split as of timestamp(sysdate-5/1440);

alter table sajet.wo_pack_split enable row movement

flashback table sajet.wo_pack_split to timestamp (sysdate-5/1440);

alter table sajet.wo_pack_split disable row movement

