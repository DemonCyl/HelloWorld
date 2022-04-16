    select * from sajet.g_sn_status t where length(t.serial_number) not in (23,24,30)--不等于字符数量函数
    update_time>=to_date('2020-09-13 08:00:00', 'YYYY-MM-DD HH24:MI:SS') ---时间格式RSJ2020000000002
    UPDATE SAJET.G_SN_STATUS A SET A.NEXT_PROCESS=100089 WHERE --更新某一个表某一个栏位
    select * from sajet.g_log  where terminal_id in   ( select terminal_id  from sajet.sys_terminal where process_id='100043') and  instr(trev,'G9Q1194KL9FPR5Q1H+LCR62')>0
    select* from mes.product1_tztek1 where Barcode='GH311350R09Q2PH3F+E1DP2'  and UPLOAD_TIME>=to_date('2021-03-20 08:00:00', 'YYYY-MM-DD HH24:MI:SS')-----天准小模组
  select b.*,rowid from   sajet.g_sn_terminal_time b where b.serial_number='H1H1124028017Q88D511B013'and b.process_id='100034'--开始时间和结束时间查询
  select * from SAJET.G_QC_INSPEC_PDA ---QC使用PDA巡检记录表
  select * from RS_OEE.GLUE_MEASURE   ----点胶引导量测数据表
  select * from mes.g_travel_deletelog;  ----Travel  删除记录表
  select t.*,rowid from sajet.g_sn_trimrepair t; --RCVR Repair 记录表
  select A.*, rowid from sajet.sys_route_recast_cfg_check A---当前站点可重复过站配置表
  
   select t.*, rowid  from sajet.g_sn_ipi_temperature t---IPI  治具温度查询
   
   select t.*, rowid from sajet.sys_mp_config t where frame_part_no='613-19556-05-IR-N'------JMM量产料号，EEEE code对应关系表维护

--【Data Center】基本资料管理
select b.*,rowid from  sajet.g_log b  where b.serial_number='H1H101714850WPY8X201A012' --系統LOG
select b.*,rowid from sajet.sys_df_config b where b.display_con='ZA3' ---CG EEEE code和config关系维护表
select s.*,rowid from sajet.sys_sql  s WHERE sql_VALUE LIKE '%130%';-----工单维护Config和EEEE code
select * from sajet.sys_sql;---工单EEEE维护表
select t.*,rowid from sajet.sys_factory t; --厂别
select t.*,rowid from sajet.sys_ht_factory t;--历史表，在sys后面加_ht
select t.*,rowid from sajet.sys_pdline t where pdline_NAME='JF-F112F-GD';--线别 10003
select t.*,rowid from sajet.sys_stage t;--区段
select t.*,rowid from sajet.sys_process t  where process_NAME LIKE 'IQC%'--制程
select t.*,rowid from sajet.sys_operate_type t;--制程类型
select t.*,rowid from sajet.sys_terminal t where  PROCESS_ID like '%100037%'--站点
select* from MES.D16_P1_laser a  where  a.process_id='100039'  and a.wprk_flag='0' --for update--后段镭雕记录表
select t.*,rowid from  sajet.g_sn_travel t where t.terminal_id in ('100126')---产品历史信息
select t.*,rowid from sajet.g_sn_status T where T.SERIAL_NUMBER='H1H1205019C17VV5A619B014'
select t.*,rowid from sajet.sys_model t;--机种   
select t.*,rowid from sajet.sys_model_pkspec t;--机种包装规格
SELECT t.*,rowid from  sajet.g_sn_status t WHERE t.process_id='100039' ---产品当前状态表
select * from sajet.G_CODE96  where display_sn='G9N1216KGEHPQCL42+E2FA4'   --生成96码记录
select * from sajet.g_process_test_data where SN4='H1H052300300WPY1A201A0102'---SN   Link治具，机台号
select * from sajet.g_sn_info  ---治具   机台
select * from sajet.g_sn_terminal where serial_number='G9N0471AH16PQCL17+P2MYB'  --产品过站次数查询
select t.*,rowid from sajet.sys_part t where part_no in ('646-00524-ZRC-SDV-01-N');--料号2000119793
select t.*,rowid from sajet.g_wo_bom t where t.work_order='D64-F11-TEST';  ---工单BOM
select t.*,rowid from sajet.sys_part_pkspec t;--料号包装规格
SELECT * FROM SAJET.SYS_Machine  WHERE Machine_ID='10002564'
--物料清单
select t.*,rowid from sajet.sys_bom_info t;--主表
select t.*,rowid from sajet.sys_bom t;--细表
select * from  sajet.g_sn_status  where serial_number=''
--===================================================
--途程
select t.*,rowid from sajet.sys_route t  where t.route_name='Jefferson-TM-LQ';--主表
select t.*,rowid from sajet.sys_route_detail t  where T.route_id='10000029' AND PROCESS_ID='100064';--细表
select t.*,rowid from sajet.sys_pkspec t;--包装规格
--====================================================
--规则组合
select t.*,rowid from sajet.sys_rule_name t;
select t.*,rowid from sajet.sys_rule_param t;

--=============================================
--判定不良
select t.*,rowid from sajet.sys_defect_type t;--不良类型
select t.*,rowid from sajet.sys_defect t  where defect_CODE=N'90030002';--不良现象
select t.*,rowid from sajet.sys_defect_N t  --备用切换不良现象表
select t.*,rowid from sajet.sys_reason t WHERE T.REASON_CODE like N'%90030002%';--不良原因
select t.*,rowid from sajet.sys_duty t WHERE T.DUTY_ID='1';--责任归属
select t.*,rowid from sajet.sys_repair_code t;--维修类别

--========================================================
--【Repair】维修管理
--维修/复判不良代码、位置等记录表
select t.*, rowid from sajet.g_sn_defect t where t.serial_number='GH310961KUQQ2PH33+E1DM4';

--维修/复判责任归属等记录表
select t.*, rowid from sajet.g_sn_repair t where t.serial_number='H1H1107072610HR59511A011';
--=======================================
--权限人员管控
select t.*,rowid from sajet.sys_dept t;--部门
select t.*,rowid from sajet.sys_shift t;--班别
select t.*,rowid from sajet.sys_role t;--角色
select t.*,rowid from sajet.sys_role_emp t;--员工关联角色
select t.*,rowid from sajet.sys_role_privilege t;--角色关联权限
select t.*,rowid from sajet.sys_emp t where t.emp_NO IN ('RS0003186','RS0003119');--员工
select t.*,rowid from sajet.sys_customer t;--客户
select t.*,rowid from sajet.sys_vendor t;--供应商
select t.*,rowid from sajet.sys_machine_type t;--机台类型
select t.*,rowid from sajet.sys_machine t where machine_id='10000558';--机台


select *from sajet.sys_terminal t where t.terminal_id=10000088;
select *from sajet.sys_machine t where t.machine_id=10000128;

--========================================================
--【WO Manager】工单管理
--工单----
select t.*,rowid from sajet.g_wo_base t where work_order ='WSP-210500396';--10000030
select t.*,rowid from sajet.g_ht_wo_base t;

--工单BOM
select t.*,rowid from sajet.g_wo_bom t;   
select t.*,rowid from sajet.g_ht_wo_bom t;

--工单包装规格
select t.*,rowid from sajet.g_pack_spec t;

--工单状态变更记录表
select t.*,rowid from sajet.g_wo_status t;
--========================================================
--【Barcode Center】条码管理
--工单编码规则
select t.*, rowid from sajet.g_wo_param t;

--工单展开的箱号记录表
select t.*,rowid from sajet.g_wo_carton t;

--冲压原材料记录表
select t.*, rowid from sajet.g_stamping_sn t;

--Frame镭雕站 
select t.*, rowid from sajet.g_laser_info t;--FrameSN信息记录
select t.*, rowid from sajet.g_sn_status t;--SN产品表

--TM段镭雕记录表
select t.*, rowid from sajet.g_laser_mark_code t;
--========================================================
--【TGS】

select t.*, rowid from sajet.tgs_server_base t;--服务器
select t.*, rowid from sajet.tgs_gateway_base t;--闸道
--驱动
select t.*, rowid from sajet.tgs_driver_base t;
select t.*, rowid from sajet.tgs_driver_info t;


select t.*, rowid from sajet.tgs_job_type_base t;--工作类型

--工作内容
select t.*, rowid from sajet.tgs_job_base t;
select t.*, rowid from sajet.tgs_job_link t;

--行为
select t.*, rowid from sajet.tgs_group_base t;
select t.*, rowid from sajet.tgs_group_link t;


select t.*, rowid from sajet.tgs_terminal_link t;--工作站行为
select t.*, rowid from sajet.tgs_execute_log t;--TGS执行Log
--========================================================
--【QualityControl】品质管理


--========================================================
--【Rework】重工作业

select t.*, rowid from sajet.g_rework_no t WHERE REWORK_NO='RW2021042008029';--重工操作记录表
select t.*, rowid from sajet.g_rework_log t where work_order like '%WSP-210100128%';--重工log表
select t.*, rowid from sajet.g_rework_file t;--重工附加文件上传表
--========================================================
--【Packing】包装作业

select t.*, rowid from sajet.sys_module_param t where t.parame_name='TerminalID';--站点设定表
select t.*, rowid from sajet.g_pack_spec_terminal t;--各站工单包装方式对应表
select t.*, rowid from sajet.g_pack_carton t WHERE T.CARTON_NO='RSJ1201000025409'--包装箱号表，是否关箱
select t.*, rowid from sajet.g_pack_forceclose t WHERE T.PACK_NO='RSJ1201000025409'--包装强制关箱记录
select t.*, rowid from sajet.g_code96 t;--96码
select * from sajet.g_pack_scrap T WHERE T.CARTON_NO='RSJ1201000001231'---报废关箱表
--========================================================

SELECT * FROM SAJET.g_sn_stock where carton_no='RSJ1201000008912'---仓库
SELECT * FROM SAJET.g_sn_stock_ht A WHERE A.WAREHOUSE_ID='10000002' and a.location_id='10010402'--仓库历史表
SELECT t.*, rowid FROM SAJET.sys_warehouse_move t-- 箱号移動卡关配置表
select * from  sajet.sys_warehouse t ; --仓库表
select * from sajet.sys_location t  ; --货柜表

--=========================================================
--【Shipping】出货作业
--出货单号
select t.*, rowid from sajet.g_dn_base t;
select t.*, rowid from sajet.g_dn_detail t;

--撤销出货
select t.*, rowid from sajet.g_dn_base t where t.dn_id='10210610002'; --改状态work_flag=1
select t.*, rowid from sajet.g_shipping_sn t where t.carton_no='RSJ1201000013815'; --删除shipping_id对应的记录
select t.*,rowid  from sajet.g_sn_status t where t.carton_no='RSJ1201000013815'; --shipping_id =0 
select t.*, rowid from sajet.g_shipping_input t where t.shipping_id='10201223001'; --删除shipping_id 对应的记录
select t.*, rowid from  sajet.g_sn_travel t where t.process_id='100090'  and t.carton_no='RSJ1201000013815'

select t.*, rowid from sajet.g_shipping_sn t where t.shipping_id='10210610002';--出货信息
select t.*, rowid from sajet.g_shipping_input t where t.shipping_id='10210610002';--加入出货资料
--========================================================
--【IQC】进料检验
--收料单
select t.*, rowid from sajet.g_erp_rtno t;
select t.*, rowid from sajet.g_erp_rt_item t;

select t.*, rowid from sajet.g_iqc_lot t;--IQC检验信息
select t.*, rowid from sajet.g_iqc_test_item t;--IQC检验项目记录
--========================================================
--【Tooling Manager】治具管理

select t.*, rowid from sajet.sys_tooling t;--治具基本信息
select t.*, rowid from sajet.sys_tooling_status_move t;--治具状态变更规则
select t.*, rowid from sajet.g_tooling_mt_travel t;--治具状态变更记录
--========================================================
--【Report】报表
--流程卡查询：SN信息扩展栏位配置表（如：SN_OPTION1、SN_OPTION2...）
select t.*, rowid from sajet.sys_sql t;

--流程卡配置表：输入值类型、SN信息、SN查询（履历...)
select t.*, rowid from sajet.sys_report_sql t;

--报表类型
select t.*, rowid from sajet.sys_cust_report_type t;

--报表参数
select t.*, rowid from sajet.sys_cust_report t;
select t.*, rowid from sajet.sys_cust_report_2d t;
select t.*, rowid from sajet.sys_cust_report_color t;
select t.*, rowid from sajet.sys_cust_report_column t;
--========================================================
--【ATE】
--ATE对接数据记录表
select t.*, rowid from sajet.g_process_test_data t;
select t.*, rowid from sajet.g_process_test_data_detail t;

--========================================================
--【WIP IN/OUT】
--Display Config与Frame EEEE对应配置表
select t.*, rowid from sajet.sys_df_config t;

--站点卡控时效配置
select t.*,  rowid from sajet.sys_terminal_config t   where  terminal_id='10002720'  ----s時間

select t.*, rowid from sajet.sys_terminal_check_rs t  WHERE terminal_ID IN ('10000339') ;--站點

select t.*, rowid from sajet.sys_terminal_pdca_check T ---DVA NG Patten MP9 OK维护

select * from sajet.sys_process  where process_id ='100070'
---需在站点卡关表维护
select * from sajet.sys_cgmark t   ----特殊物料卡控ID
select * from sajet.g_sn_cgmark t   ------特殊物料卡控具体SN
------IQC卡关不允许投入
 select t.*, rowid from sajet.g_sn_mark t  WHERE T.SERIAL_NUMBER='1'  ----SN和MARK_ID对应表
 select t.*, rowid from sajet.sys_mark t  -----  锁定原因MARK_ID维护表
---不需要在站点卡关表维护
select t.* from sajet.g_sn_special t ;
select t.* from sajet.sys_special t;  


--========================================================
--Hold
--锁定解锁相关
SELECT * FROM sajet.G_SN_LOCK_TEMP T;            --临时表
SELECT * FROM sajet.G_SN_LOCK T;                 --锁定表
SELECT * FROM sajet.G_SN_LOCK_REASON T;          --锁定原因表
SELECT * FROM sajet.G_SN_LOCK_HT T;              --锁定历史表
SELECT * FROM sajet.G_SN_LOCK_REASON_HT T;       --锁定原因历史表




select t.*, rowid from sajet.bobcat_station_mapping t where  t.mes_process_name LIKE '%SPM%'--根据站点查询PDCA同步数据表
select * from SAJET.BOBCAT_D846_TEST20  where LCG_SN LIKE 'GH311320Y3QPR5R3D%' --PDCA数据同步LOG
--PDCA记录过站数据
select t.*, rowid from sajet.g_sn_terminal_pdca t where t.serial_number='GH3112705R8Q2PH3W+E1DB2'
--=================================================
select * from mes.g_accessory_blacklist t ;--辅料黑名单
select * from mes.g_accessory t where lot ;  --辅助SN记录表

select * from sajet.sj_chk_part_sn; --ATE 辅料卡控过程 
select * from sajet.g_sn_keyparts t where t.item_desc='Accessories'; --辅料SN 对应的SN 、制程、站点 存放记录表

select * from mes.g_accessory --辅料
--=====================================================
--TGS
select a.server_desc_e,a.server_desc_c,b.ip_address from sajet.tgs_server_base a 
inner join sajet.tgs_gateway_base_detail b on a.server_id=b.server_id
where ip_address  in ('10.80.85.188')---根据IP查询TGS地址

select * from sajet.g_log where tsajet1='6'  and sn2='GH311050U0SPR5R3W+E1XR4'


select * from sajet.tgs_terminal_link  --TGS绑定站点，行为ID
select * from sajet.tgs_server_base  ---TGS_ID
SELECT * FROM SAJET.TGS_GROUP_BASE_ht where update_time>=to_date('2021-03-11 12:00:00', 'YYYY-MM-DD HH24:MI:SS') --行为
select* from sajet.tgs_gateway_base_detail WHERE SERVER_ID='1' --匝道：绑定IP数量

--==============

select *from mes.table_info--display来料库位表
select * from  mes.tip_forwasdis_pickingprint t where t.printid='RSJ201000025409';--DISPLAY来料管理状态表
select * from mes.tip_forwasdis_pickingprod t where t.sn='G9N0487DDJHPRRD10+P2TG3'
select * from mes.tip_forwasdis_pickingprintout where BOXID='RSJ201000025409'
tip_forwasdis_pickingprod

select * from mes.TIP_FORWASDIS_WarehouseOut where BOXID='MAOL2R1482'
--==========================================================
--借料数据记录
select T.*,ROWID from sajet.g_sample_track T ORDER BY T.CREATE_TIME DESC  ;---批次号书力量记录 
select * from sajet.g_sample_track_detail t ORDER BY  T.TRACK_NO DESC ,T.LEND_TIME DESC ; ----根据批次号查询具体SN
--===============================================
--胶水管理相关table：
--胶水状态：,'F','冰库','W','回温','P','领用','T','用完','S','报废','R','回冰','V','上线','B','下线','G','入总仓','OG','出总仓','SP','入线边仓','GF','入总冰柜'
select* from IQC.IQC_SWEEP_CODE_RECORD@qmsdb  --1、来料表：
select* from IQC.IQC_PAD_BIND@qmsdb --2、IQC抽检记录表：
select* from SAJET.G_MATERIAL_GLUE where current_status='W'--3、胶水当前状态表：
select* from SAJET.G_HT_MATERIAL_GLUE  where  REEL_NO='H8540490MT109S82242108230108'--4、胶水流程记录表：
select* from SAJET.SYS_GLUE_PART --5、胶水料号设定表：
select* from SAJET.SYS_HT_GLUE_PART--6、胶水料号设定历史记录表：
select* from SAJET.SYS_GLUE_SETUP--7、胶水设定表：
select* from SAJET.SYS_HT_GLUE_SETUP--8、胶水设定历史记录表：
select* from sajet.g_glue_warehouse--9、胶水库位表：
select* from sajet.g_HT_glue_warehouse--10、胶水库位历史表：
select* from sajet.g_glue_location--11、胶水库位表：
select* from sajet.g_ht_glue_location--12、胶水库位历史表：
--===================
--去毛边分厂商
select * from sajet.g_pack_carton_vendor;
select t.*,rowid  from sajet.g_sn_lasermicport t where t.sn='H1H1186007317Q88V511A012'-- 涉及到几张表

--================

--tz
select T.*,ROWID from mes.ALT__INFO_LOG@link_226 t ;
--cyg
select * from mes.CYG_JEFFERSON_LOG;
SELECT * FROM MES.CYG_MADISON_LOG;
select * from mes.CYG_MONROE_LOG;
-- ump
select t.*,rowid from MES.UMP_INFO_LOG t;
--trim
select * from mes.EDMS_INFO_LOG;


--tz
select T.*,ROWID from ALT__INFO_LOG t ;
--cyg
select * from mes.CYG_JEFFERSON_LOG;
SELECT * FROM MES.CYG_MADISON_LOG;
select * from mes.CYG_MONROE_LOG;
-- ump
select t.*,rowid from MES.UMP_INFO_LOG t;
--trim
select * from mes.EDMS_INFO_LOG;

--tz
select T.*,ROWID from ALT__INFO_LOG t ;
--cyg
select * from mes.CYG_JEFFERSON_LOG;
SELECT * FROM MES.CYG_MADISON_LOG;
select * from mes.CYG_MONROE_LOG;
-- ump
select t.*,rowid from MES.UMP_INFO_LOG t;
--trim
select * from mes.EDMS_INFO_LOG;
--tz
select T.*,ROWID from ALT_INFO_LOG t ;
--cyg
select * from mes.CYG_JEFFERSON_LOG;
SELECT * FROM MES.CYG_MADISON_LOG;
select * from mes.CYG_MONROE_LOG;
-- ump
select t.*,rowid from MES.UMP_INFO_LOG@link_226 t;
--trim
select * from mes.EDMS_INFO_LOG@link_226;

--====
--电子看板
select t.*,rowid from mes.eboard_process_sys t;
select t.*,rowid from mes.eboard_terminal_sys t;--p_id = mes.eboard_process_sys.id
select * from mes.eboard_trinity_h_sys;--p_id = mes.eboard_terminal_sys.id
08~09, 白班:1; 夜班: 2












