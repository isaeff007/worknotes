----kill sessions
begin
 for sessions in ( select sid, serial# 
                    from   v$session 
                    where  username = '')
  loop
    execute immediate 'alter system kill session '''||sessions.sid||','||sessions.serial#||'''';
  end loop;
end;
/
---- drop user 
DROP USER  CASCADE;
---- create user
CREATE USER 
  IDENTIFIED BY "12years"
  DEFAULT TABLESPACE   
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  ACCOUNT UNLOCK;
  -- 1 Role for new dbuser 
  GRANT CONNECT TO ;
  ALTER USER AKBELVIS4TSM411LB DEFAULT ROLE ALL;
  -- 13 System Privileges new dbuser
  GRANT CREATE DATABASE LINK TO ;
  GRANT CREATE JOB TO ;
  GRANT CREATE MATERIALIZED VIEW TO ;
  GRANT CREATE PROCEDURE TO ;
  GRANT CREATE PUBLIC DATABASE LINK TO ;
  GRANT CREATE PUBLIC SYNONYM TO ;
  GRANT CREATE SEQUENCE TO ;
  GRANT CREATE SESSION TO ;
  GRANT CREATE SYNONYM TO ;
  GRANT CREATE TABLE TO ;
  GRANT CREATE TRIGGER TO ;
  GRANT CREATE VIEW TO ;
  GRANT SELECT ANY DICTIONARY TO ;
  -- 2 Tablespace Quotas for created user
  ALTER USER AKBELVIS4TSM411LB QUOTA UNLIMITED ON ;
  ALTER USER AKBELVIS4TSM411LB QUOTA UNLIMITED ON USERS;
  -- 1 Object Privilege for created user
    GRANT READ, WRITE ON DIRECTORY DATA_PUMP_DIR TO ;
commit;
exit