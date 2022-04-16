--INSERT INTO sajet.sys_program_name
SELECT t.* FROM sajet.sys_program_name t WHERE t.program LIKE 'SA%' ;

-- Get 要建的菜单目录信息
select WEB_FLAG,program,function,dll_filename,form_name,fun_param,fun_tw,fun_cn,
fun_type,fun_type_tw,fun_type_cn,enabled,fun_idx,fun_type_idx,ROWID from SAJET.SYS_PROGRAM_FUN_NAME WHERE dll_filename LIKE 'AuthS%' OR dll_filename LIKE 'ngpack%' ;

-- create new menu
insert into SAJET.SYS_PROGRAM_FUN_NAME
(program,function,dll_filename,form_name,fun_param,fun_tw,fun_cn,fun_type,fun_type_tw,fun_type_cn,enabled,fun_idx,fun_type_idx)
values
('COMMONModule','EmpScanInT','EmpScanInT.dll','fMain',NULL,'通用扫码(仅工号)','通用扫码(仅工号)','EmpScanInT','通用程序','通用程序','Y',16,1);

-- select * from SYS_PROGRAM_FUN_AUTHORITY where FUNCTION like '%MyTestApp%';

-- create new Auth
INSERT INTO "SAJET"."SYS_PROGRAM_FUN_AUTHORITY" VALUES ('COMMONModule', 'AuthScanInT_emp', '0', 'Read Only');
INSERT INTO "SAJET"."SYS_PROGRAM_FUN_AUTHORITY" VALUES ('COMMONModule', 'AuthScanInT_emp', '1', 'Allow To Change');
INSERT INTO "SAJET"."SYS_PROGRAM_FUN_AUTHORITY" VALUES ('COMMONModule', 'AuthScanInT_emp', '2', 'Full Control');


--update to Production Base
INSERT INTO "SAJET"."SYS_PROGRAM_FUN_AUTHORITY"
SELECT * FROM "SAJET"."SYS_PROGRAM_FUN_AUTHORITY"@link_134  WHERE program = 'WMS' AND FUNCTION LIKE 'DPDeliveryInfo%' FOR UPDATE;

INSERT INTO SAJET.SYS_PROGRAM_FUN_NAME
SELECT * FROM SAJET.SYS_PROGRAM_FUN_NAME@link_134 WHERE dll_filename LIKE 'DPDeliveryInfo%';



/*  delete menu&Auth sql check !!!
select * from SYS_PROGRAM_FUN_NAME where fun_cn  like 'Lab IN/OUT管控%';
delete from SYS_PROGRAM_FUN_NAME where fun_cn  like 'Lab IN/OUT管控%';
	
select * from SYS_PROGRAM_FUN_AUTHORITY where FUNCTION like '%mytest%';
delete from SYS_PROGRAM_FUN_AUTHORITY where FUNCTION like '%mytest%';

select program,function,dll_filename,form_name,fun_param,fun_tw,fun_cn,
fun_type,fun_type_tw,fun_type_cn,enabled,fun_idx,fun_type_idx from SAJET.SYS_PROGRAM_FUN_NAME where fun_type_tw like 'SI Sorting in%';
*/


