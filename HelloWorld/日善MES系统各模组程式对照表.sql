    select * from sajet.g_sn_status t where length(t.serial_number) not in (23,24,30)--�������ַ���������
    update_time>=to_date('2020-09-13 08:00:00', 'YYYY-MM-DD HH24:MI:SS') ---ʱ���ʽRSJ2020000000002
    UPDATE SAJET.G_SN_STATUS A SET A.NEXT_PROCESS=100089 WHERE --����ĳһ����ĳһ����λ
    select * from sajet.g_log  where terminal_id in   ( select terminal_id  from sajet.sys_terminal where process_id='100043') and  instr(trev,'G9Q1194KL9FPR5Q1H+LCR62')>0
    select* from mes.product1_tztek1 where Barcode='GH311350R09Q2PH3F+E1DP2'  and UPLOAD_TIME>=to_date('2021-03-20 08:00:00', 'YYYY-MM-DD HH24:MI:SS')-----��׼Сģ��
  select b.*,rowid from   sajet.g_sn_terminal_time b where b.serial_number='H1H1124028017Q88D511B013'and b.process_id='100034'--��ʼʱ��ͽ���ʱ���ѯ
  select * from SAJET.G_QC_INSPEC_PDA ---QCʹ��PDAѲ���¼��
  select * from RS_OEE.GLUE_MEASURE   ----�㽺�����������ݱ�
  select * from mes.g_travel_deletelog;  ----Travel  ɾ����¼��
  select t.*,rowid from sajet.g_sn_trimrepair t; --RCVR Repair ��¼��
  select A.*, rowid from sajet.sys_route_recast_cfg_check A---��ǰվ����ظ���վ���ñ�
  
   select t.*, rowid  from sajet.g_sn_ipi_temperature t---IPI  �ξ��¶Ȳ�ѯ
   
   select t.*, rowid from sajet.sys_mp_config t where frame_part_no='613-19556-05-IR-N'------JMM�����Ϻţ�EEEE code��Ӧ��ϵ��ά��

--��Data Center���������Ϲ���
select b.*,rowid from  sajet.g_log b  where b.serial_number='H1H101714850WPY8X201A012' --ϵ�yLOG
select b.*,rowid from sajet.sys_df_config b where b.display_con='ZA3' ---CG EEEE code��config��ϵά����
select s.*,rowid from sajet.sys_sql  s WHERE sql_VALUE LIKE '%130%';-----����ά��Config��EEEE code
select * from sajet.sys_sql;---����EEEEά����
select t.*,rowid from sajet.sys_factory t; --����
select t.*,rowid from sajet.sys_ht_factory t;--��ʷ����sys�����_ht
select t.*,rowid from sajet.sys_pdline t where pdline_NAME='JF-F112F-GD';--�߱� 10003
select t.*,rowid from sajet.sys_stage t;--����
select t.*,rowid from sajet.sys_process t  where process_NAME LIKE 'IQC%'--�Ƴ�
select t.*,rowid from sajet.sys_operate_type t;--�Ƴ�����
select t.*,rowid from sajet.sys_terminal t where  PROCESS_ID like '%100037%'--վ��
select* from MES.D16_P1_laser a  where  a.process_id='100039'  and a.wprk_flag='0' --for update--����ص��¼��
select t.*,rowid from  sajet.g_sn_travel t where t.terminal_id in ('100126')---��Ʒ��ʷ��Ϣ
select t.*,rowid from sajet.g_sn_status T where T.SERIAL_NUMBER='H1H1205019C17VV5A619B014'
select t.*,rowid from sajet.sys_model t;--����   
select t.*,rowid from sajet.sys_model_pkspec t;--���ְ�װ���
SELECT t.*,rowid from  sajet.g_sn_status t WHERE t.process_id='100039' ---��Ʒ��ǰ״̬��
select * from sajet.G_CODE96  where display_sn='G9N1216KGEHPQCL42+E2FA4'   --����96���¼
select * from sajet.g_process_test_data where SN4='H1H052300300WPY1A201A0102'---SN   Link�ξߣ���̨��
select * from sajet.g_sn_info  ---�ξ�   ��̨
select * from sajet.g_sn_terminal where serial_number='G9N0471AH16PQCL17+P2MYB'  --��Ʒ��վ������ѯ
select t.*,rowid from sajet.sys_part t where part_no in ('646-00524-ZRC-SDV-01-N');--�Ϻ�2000119793
select t.*,rowid from sajet.g_wo_bom t where t.work_order='D64-F11-TEST';  ---����BOM
select t.*,rowid from sajet.sys_part_pkspec t;--�ϺŰ�װ���
SELECT * FROM SAJET.SYS_Machine  WHERE Machine_ID='10002564'
--�����嵥
select t.*,rowid from sajet.sys_bom_info t;--����
select t.*,rowid from sajet.sys_bom t;--ϸ��
select * from  sajet.g_sn_status  where serial_number=''
--===================================================
--;��
select t.*,rowid from sajet.sys_route t  where t.route_name='Jefferson-TM-LQ';--����
select t.*,rowid from sajet.sys_route_detail t  where T.route_id='10000029' AND PROCESS_ID='100064';--ϸ��
select t.*,rowid from sajet.sys_pkspec t;--��װ���
--====================================================
--�������
select t.*,rowid from sajet.sys_rule_name t;
select t.*,rowid from sajet.sys_rule_param t;

--=============================================
--�ж�����
select t.*,rowid from sajet.sys_defect_type t;--��������
select t.*,rowid from sajet.sys_defect t  where defect_CODE=N'90030002';--��������
select t.*,rowid from sajet.sys_defect_N t  --�����л����������
select t.*,rowid from sajet.sys_reason t WHERE T.REASON_CODE like N'%90030002%';--����ԭ��
select t.*,rowid from sajet.sys_duty t WHERE T.DUTY_ID='1';--���ι���
select t.*,rowid from sajet.sys_repair_code t;--ά�����

--========================================================
--��Repair��ά�޹���
--ά��/���в������롢λ�õȼ�¼��
select t.*, rowid from sajet.g_sn_defect t where t.serial_number='GH310961KUQQ2PH33+E1DM4';

--ά��/�������ι����ȼ�¼��
select t.*, rowid from sajet.g_sn_repair t where t.serial_number='H1H1107072610HR59511A011';
--=======================================
--Ȩ����Ա�ܿ�
select t.*,rowid from sajet.sys_dept t;--����
select t.*,rowid from sajet.sys_shift t;--���
select t.*,rowid from sajet.sys_role t;--��ɫ
select t.*,rowid from sajet.sys_role_emp t;--Ա��������ɫ
select t.*,rowid from sajet.sys_role_privilege t;--��ɫ����Ȩ��
select t.*,rowid from sajet.sys_emp t where t.emp_NO IN ('RS0003186','RS0003119');--Ա��
select t.*,rowid from sajet.sys_customer t;--�ͻ�
select t.*,rowid from sajet.sys_vendor t;--��Ӧ��
select t.*,rowid from sajet.sys_machine_type t;--��̨����
select t.*,rowid from sajet.sys_machine t where machine_id='10000558';--��̨


select *from sajet.sys_terminal t where t.terminal_id=10000088;
select *from sajet.sys_machine t where t.machine_id=10000128;

--========================================================
--��WO Manager����������
--����----
select t.*,rowid from sajet.g_wo_base t where work_order ='WSP-210500396';--10000030
select t.*,rowid from sajet.g_ht_wo_base t;

--����BOM
select t.*,rowid from sajet.g_wo_bom t;   
select t.*,rowid from sajet.g_ht_wo_bom t;

--������װ���
select t.*,rowid from sajet.g_pack_spec t;

--����״̬�����¼��
select t.*,rowid from sajet.g_wo_status t;
--========================================================
--��Barcode Center���������
--�����������
select t.*, rowid from sajet.g_wo_param t;

--����չ������ż�¼��
select t.*,rowid from sajet.g_wo_carton t;

--��ѹԭ���ϼ�¼��
select t.*, rowid from sajet.g_stamping_sn t;

--Frame�ص�վ 
select t.*, rowid from sajet.g_laser_info t;--FrameSN��Ϣ��¼
select t.*, rowid from sajet.g_sn_status t;--SN��Ʒ��

--TM���ص��¼��
select t.*, rowid from sajet.g_laser_mark_code t;
--========================================================
--��TGS��

select t.*, rowid from sajet.tgs_server_base t;--������
select t.*, rowid from sajet.tgs_gateway_base t;--բ��
--����
select t.*, rowid from sajet.tgs_driver_base t;
select t.*, rowid from sajet.tgs_driver_info t;


select t.*, rowid from sajet.tgs_job_type_base t;--��������

--��������
select t.*, rowid from sajet.tgs_job_base t;
select t.*, rowid from sajet.tgs_job_link t;

--��Ϊ
select t.*, rowid from sajet.tgs_group_base t;
select t.*, rowid from sajet.tgs_group_link t;


select t.*, rowid from sajet.tgs_terminal_link t;--����վ��Ϊ
select t.*, rowid from sajet.tgs_execute_log t;--TGSִ��Log
--========================================================
--��QualityControl��Ʒ�ʹ���


--========================================================
--��Rework���ع���ҵ

select t.*, rowid from sajet.g_rework_no t WHERE REWORK_NO='RW2021042008029';--�ع�������¼��
select t.*, rowid from sajet.g_rework_log t where work_order like '%WSP-210100128%';--�ع�log��
select t.*, rowid from sajet.g_rework_file t;--�ع������ļ��ϴ���
--========================================================
--��Packing����װ��ҵ

select t.*, rowid from sajet.sys_module_param t where t.parame_name='TerminalID';--վ���趨��
select t.*, rowid from sajet.g_pack_spec_terminal t;--��վ������װ��ʽ��Ӧ��
select t.*, rowid from sajet.g_pack_carton t WHERE T.CARTON_NO='RSJ1201000025409'--��װ��ű��Ƿ����
select t.*, rowid from sajet.g_pack_forceclose t WHERE T.PACK_NO='RSJ1201000025409'--��װǿ�ƹ����¼
select t.*, rowid from sajet.g_code96 t;--96��
select * from sajet.g_pack_scrap T WHERE T.CARTON_NO='RSJ1201000001231'---���Ϲ����
--========================================================

SELECT * FROM SAJET.g_sn_stock where carton_no='RSJ1201000008912'---�ֿ�
SELECT * FROM SAJET.g_sn_stock_ht A WHERE A.WAREHOUSE_ID='10000002' and a.location_id='10010402'--�ֿ���ʷ��
SELECT t.*, rowid FROM SAJET.sys_warehouse_move t-- ����Ƅӿ������ñ�
select * from  sajet.sys_warehouse t ; --�ֿ��
select * from sajet.sys_location t  ; --�����

--=========================================================
--��Shipping��������ҵ
--��������
select t.*, rowid from sajet.g_dn_base t;
select t.*, rowid from sajet.g_dn_detail t;

--��������
select t.*, rowid from sajet.g_dn_base t where t.dn_id='10210610002'; --��״̬work_flag=1
select t.*, rowid from sajet.g_shipping_sn t where t.carton_no='RSJ1201000013815'; --ɾ��shipping_id��Ӧ�ļ�¼
select t.*,rowid  from sajet.g_sn_status t where t.carton_no='RSJ1201000013815'; --shipping_id =0 
select t.*, rowid from sajet.g_shipping_input t where t.shipping_id='10201223001'; --ɾ��shipping_id ��Ӧ�ļ�¼
select t.*, rowid from  sajet.g_sn_travel t where t.process_id='100090'  and t.carton_no='RSJ1201000013815'

select t.*, rowid from sajet.g_shipping_sn t where t.shipping_id='10210610002';--������Ϣ
select t.*, rowid from sajet.g_shipping_input t where t.shipping_id='10210610002';--�����������
--========================================================
--��IQC�����ϼ���
--���ϵ�
select t.*, rowid from sajet.g_erp_rtno t;
select t.*, rowid from sajet.g_erp_rt_item t;

select t.*, rowid from sajet.g_iqc_lot t;--IQC������Ϣ
select t.*, rowid from sajet.g_iqc_test_item t;--IQC������Ŀ��¼
--========================================================
--��Tooling Manager���ξ߹���

select t.*, rowid from sajet.sys_tooling t;--�ξ߻�����Ϣ
select t.*, rowid from sajet.sys_tooling_status_move t;--�ξ�״̬�������
select t.*, rowid from sajet.g_tooling_mt_travel t;--�ξ�״̬�����¼
--========================================================
--��Report������
--���̿���ѯ��SN��Ϣ��չ��λ���ñ��磺SN_OPTION1��SN_OPTION2...��
select t.*, rowid from sajet.sys_sql t;

--���̿����ñ�����ֵ���͡�SN��Ϣ��SN��ѯ������...)
select t.*, rowid from sajet.sys_report_sql t;

--��������
select t.*, rowid from sajet.sys_cust_report_type t;

--�������
select t.*, rowid from sajet.sys_cust_report t;
select t.*, rowid from sajet.sys_cust_report_2d t;
select t.*, rowid from sajet.sys_cust_report_color t;
select t.*, rowid from sajet.sys_cust_report_column t;
--========================================================
--��ATE��
--ATE�Խ����ݼ�¼��
select t.*, rowid from sajet.g_process_test_data t;
select t.*, rowid from sajet.g_process_test_data_detail t;

--========================================================
--��WIP IN/OUT��
--Display Config��Frame EEEE��Ӧ���ñ�
select t.*, rowid from sajet.sys_df_config t;

--վ�㿨��ʱЧ����
select t.*,  rowid from sajet.sys_terminal_config t   where  terminal_id='10002720'  ----s�r�g

select t.*, rowid from sajet.sys_terminal_check_rs t  WHERE terminal_ID IN ('10000339') ;--վ�c

select t.*, rowid from sajet.sys_terminal_pdca_check T ---DVA NG Patten MP9 OKά��

select * from sajet.sys_process  where process_id ='100070'
---����վ�㿨�ر�ά��
select * from sajet.sys_cgmark t   ----�������Ͽ���ID
select * from sajet.g_sn_cgmark t   ------�������Ͽ��ؾ���SN
------IQC���ز�����Ͷ��
 select t.*, rowid from sajet.g_sn_mark t  WHERE T.SERIAL_NUMBER='1'  ----SN��MARK_ID��Ӧ��
 select t.*, rowid from sajet.sys_mark t  -----  ����ԭ��MARK_IDά����
---����Ҫ��վ�㿨�ر�ά��
select t.* from sajet.g_sn_special t ;
select t.* from sajet.sys_special t;  


--========================================================
--Hold
--�����������
SELECT * FROM sajet.G_SN_LOCK_TEMP T;            --��ʱ��
SELECT * FROM sajet.G_SN_LOCK T;                 --������
SELECT * FROM sajet.G_SN_LOCK_REASON T;          --����ԭ���
SELECT * FROM sajet.G_SN_LOCK_HT T;              --������ʷ��
SELECT * FROM sajet.G_SN_LOCK_REASON_HT T;       --����ԭ����ʷ��




select t.*, rowid from sajet.bobcat_station_mapping t where  t.mes_process_name LIKE '%SPM%'--����վ���ѯPDCAͬ�����ݱ�
select * from SAJET.BOBCAT_D846_TEST20  where LCG_SN LIKE 'GH311320Y3QPR5R3D%' --PDCA����ͬ��LOG
--PDCA��¼��վ����
select t.*, rowid from sajet.g_sn_terminal_pdca t where t.serial_number='GH3112705R8Q2PH3W+E1DB2'
--=================================================
select * from mes.g_accessory_blacklist t ;--���Ϻ�����
select * from mes.g_accessory t where lot ;  --����SN��¼��

select * from sajet.sj_chk_part_sn; --ATE ���Ͽ��ع��� 
select * from sajet.g_sn_keyparts t where t.item_desc='Accessories'; --����SN ��Ӧ��SN ���Ƴ̡�վ�� ��ż�¼��

select * from mes.g_accessory --����
--=====================================================
--TGS
select a.server_desc_e,a.server_desc_c,b.ip_address from sajet.tgs_server_base a 
inner join sajet.tgs_gateway_base_detail b on a.server_id=b.server_id
where ip_address  in ('10.80.85.188')---����IP��ѯTGS��ַ

select * from sajet.g_log where tsajet1='6'  and sn2='GH311050U0SPR5R3W+E1XR4'


select * from sajet.tgs_terminal_link  --TGS��վ�㣬��ΪID
select * from sajet.tgs_server_base  ---TGS_ID
SELECT * FROM SAJET.TGS_GROUP_BASE_ht where update_time>=to_date('2021-03-11 12:00:00', 'YYYY-MM-DD HH24:MI:SS') --��Ϊ
select* from sajet.tgs_gateway_base_detail WHERE SERVER_ID='1' --�ѵ�����IP����

--==============

select *from mes.table_info--display���Ͽ�λ��
select * from  mes.tip_forwasdis_pickingprint t where t.printid='RSJ201000025409';--DISPLAY���Ϲ���״̬��
select * from mes.tip_forwasdis_pickingprod t where t.sn='G9N0487DDJHPRRD10+P2TG3'
select * from mes.tip_forwasdis_pickingprintout where BOXID='RSJ201000025409'
tip_forwasdis_pickingprod

select * from mes.TIP_FORWASDIS_WarehouseOut where BOXID='MAOL2R1482'
--==========================================================
--�������ݼ�¼
select T.*,ROWID from sajet.g_sample_track T ORDER BY T.CREATE_TIME DESC  ;---���κ���������¼ 
select * from sajet.g_sample_track_detail t ORDER BY  T.TRACK_NO DESC ,T.LEND_TIME DESC ; ----�������κŲ�ѯ����SN
--===============================================
--��ˮ�������table��
--��ˮ״̬��,'F','����','W','����','P','����','T','����','S','����','R','�ر�','V','����','B','����','G','���ܲ�','OG','���ܲ�','SP','���߲߱�','GF','���ܱ���'
select* from IQC.IQC_SWEEP_CODE_RECORD@qmsdb  --1�����ϱ�
select* from IQC.IQC_PAD_BIND@qmsdb --2��IQC����¼��
select* from SAJET.G_MATERIAL_GLUE where current_status='W'--3����ˮ��ǰ״̬��
select* from SAJET.G_HT_MATERIAL_GLUE  where  REEL_NO='H8540490MT109S82242108230108'--4����ˮ���̼�¼��
select* from SAJET.SYS_GLUE_PART --5����ˮ�Ϻ��趨��
select* from SAJET.SYS_HT_GLUE_PART--6����ˮ�Ϻ��趨��ʷ��¼��
select* from SAJET.SYS_GLUE_SETUP--7����ˮ�趨��
select* from SAJET.SYS_HT_GLUE_SETUP--8����ˮ�趨��ʷ��¼��
select* from sajet.g_glue_warehouse--9����ˮ��λ��
select* from sajet.g_HT_glue_warehouse--10����ˮ��λ��ʷ��
select* from sajet.g_glue_location--11����ˮ��λ��
select* from sajet.g_ht_glue_location--12����ˮ��λ��ʷ��
--===================
--ȥë�߷ֳ���
select * from sajet.g_pack_carton_vendor;
select t.*,rowid  from sajet.g_sn_lasermicport t where t.sn='H1H1186007317Q88V511A012'-- �漰�����ű�

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
--���ӿ���
select t.*,rowid from mes.eboard_process_sys t;
select t.*,rowid from mes.eboard_terminal_sys t;--p_id = mes.eboard_process_sys.id
select * from mes.eboard_trinity_h_sys;--p_id = mes.eboard_terminal_sys.id
08~09, �װ�:1; ҹ��: 2












