create or replace procedure sajet.SINGLE_CN_TRANSFER(tterminal_id  in varchar2
                                                     ,tsn in varchar2
                                                     ,temp_id  in varchar2
                                                     ,tres    out varchar2
                                                     ,tnextproc  out varchar2) is
  v_serial_number  SAJET.g_sn_status.serial_number%TYPE;
  v_count number;
  CURSOR DATA_CURSOR IS select serial_number from sajet.g_sn_status WHERE carton_no = tcarton_no;
begin
  tres := 'OK';




  --循环Loop
  IF NOT DATA_CURSOR%ISOPEN THEN
    OPEN DATA_CURSOR;
  END IF;
  LOOP
    FETCH DATA_CURSOR  INTO v_serial_number;
    EXIT WHEN DATA_CURSOR%NOTFOUND OR DATA_CURSOR%NOTFOUND IS NULL;
    --这里写循环处理代码

  END LOOP;

  --调用存储过程做检测
  sajet.sj_chk_sn(trev => tsn, tres => tres);
  if substr(tres, 1, 2) <> 'OK' then
    tres := 'NG;' || tres || ';';
    goto endp;
  end if;
  
  --判断制程是否存在
   select count(*) into v_count from sajet.g_sn_travel t where t.serial_number = tsn and t.process_id = 100043;
  if (v_count=0) then
    tres := 'NG;未过制程xx,不能xx;';
    goto endp;
  end;




  <<endp>>
  if substr(tres, 1, 2) <> 'OK' then
    rollback;
  end if;
exception
  when others then
    rollback;
    tres := 'NG,SJ_REPAIROUTRISK_SCANIN异常';
end;


-- 单片过站
CREATE OR REPLACE PROCEDURE sajet.SINGLE_CN_TRANSFER(tterminal_id  in varchar2
                                                     ,tsn in varchar2
                                                     ,temp_id  in varchar2
                                                     ,tres    out varchar2
                                                     ,tnextproc  out varchar2) is
  ccount NUMBER;
  
BEGIN
  tres := 'OK';
  --检查SN
  sajet.sj_chk_sn(trev => tsn, tres => tres);
  if tres <> 'OK' then
    tres := 'NG;' || tres || ';';
    goto endp;
  end if;
  
  --检查厂内码
  select count(*)
    into ccount
    from sajet.g_sn_status t
   where t.serial_number = tsn;
  if ccount = 0 then
    tres := 'NG;这个厂内码不存在;';
    goto endp;
  end if;

  --每一片要过站
  sajet.sj_transfer(tterminalid => tterminal_id,
                      tsn         => tsn,
                      tdefect     => 'N/A',
                      tnow        => sysdate,
                      temp        => temp_id,
                      tres        => tres,
                      tnextproc   => tnextproc);
  if substr(tres, 1, 2) <> 'OK' then
    tres := 'NG;' || tres || ';';
    goto endp;
  end IF;

  <<endp>>
  if substr(tres, 1, 2) <> 'OK' then
    rollback;
  else
    commit;
  end if;
exception
  when others then
    rollback;
    tres := 'NG,存储SINGLE_CN_TRANSFER异常,' || sqlerrm;
end;



CREATE OR REPLACE PROCEDURE SAJET.SINGLE_YC_TRANSFER(TTERMINAL_ID IN VARCHAR2,
                                                     TSN          IN VARCHAR2,
                                                     TEMP_ID      IN VARCHAR2,
                                                     TRES         OUT VARCHAR2,
                                                     TNEXTPROC    OUT VARCHAR2) IS
BEGIN
  tres := 'OK';

  <<endp>>
  if substr(tres, 1, 2) <> 'OK' then
    rollback;
  else
    commit;
  end if;
exception
  when others then
    rollback;
    tres := 'NG,存储SINGLE_CN_TRANSFER异常,' || sqlerrm;
end;
