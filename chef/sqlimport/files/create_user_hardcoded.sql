----kill sessions
begin
 for sessions in ( select sid, serial# 
                    from   v$session 
                    where  username = 'ENET_GAS_AUTOMATISIERUNG') 
  loop
    execute immediate 'alter system kill session '''||sessions.sid||','||sessions.serial#||'''';
  end loop;
end;
/
---- drop user 
DROP USER ENET_GAS_AUTOMATISIERUNG CASCADE;
---- create user
CREATE USER ENET_GAS_AUTOMATISIERUNG
  IDENTIFIED BY "12years"
  DEFAULT TABLESPACE ENET_GAS_AUTOMATISIERUNG
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  ACCOUNT UNLOCK;
  -- 1 Role for ENET_GAS_AUTOMATISIERUNG 
  GRANT CONNECT TO ENET_GAS_AUTOMATISIERUNG;
  ALTER USER ENET_GAS_AUTOMATISIERUNG DEFAULT ROLE ALL;
  -- 13 System Privileges for ENET_GAS_AUTOMATISIERUNG 
  GRANT CREATE DATABASE LINK TO ENET_GAS_AUTOMATISIERUNG;
  GRANT CREATE JOB TO ENET_GAS_AUTOMATISIERUNG;
  GRANT CREATE MATERIALIZED VIEW TO ENET_GAS_AUTOMATISIERUNG;
  GRANT CREATE PROCEDURE TO ENET_GAS_AUTOMATISIERUNG;
  GRANT CREATE PUBLIC DATABASE LINK TO ENET_GAS_AUTOMATISIERUNG;
  GRANT CREATE PUBLIC SYNONYM TO ENET_GAS_AUTOMATISIERUNG;
  GRANT CREATE SEQUENCE TO ENET_GAS_AUTOMATISIERUNG;
  GRANT CREATE SESSION TO ENET_GAS_AUTOMATISIERUNG;
  GRANT CREATE SYNONYM TO ENET_GAS_AUTOMATISIERUNG;
  GRANT CREATE TABLE TO ENET_GAS_AUTOMATISIERUNG;
  GRANT CREATE TRIGGER TO ENET_GAS_AUTOMATISIERUNG;
  GRANT CREATE VIEW TO ENET_GAS_AUTOMATISIERUNG;
  GRANT SELECT ANY DICTIONARY TO ENET_GAS_AUTOMATISIERUNG;
  -- 2 Tablespace Quotas for ENET_GAS_AUTOMATISIERUNG 
  ALTER USER ENET_GAS_AUTOMATISIERUNG QUOTA UNLIMITED ON ENET_GAS_AUTOMATISIERUNG;
  ALTER USER ENET_GAS_AUTOMATISIERUNG QUOTA UNLIMITED ON USERS;
  -- 1 Object Privilege for ENET_GAS_AUTOMATISIERUNG 
    GRANT READ, WRITE ON DIRECTORY DATA_PUMP_DIR TO ENET_GAS_AUTOMATISIERUNG;
commit;
exit