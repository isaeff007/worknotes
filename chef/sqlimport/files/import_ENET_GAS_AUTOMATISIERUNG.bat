#SQLPLUS AKBELVIS4TSM411X/12years@oracle-11g-srv-n:1521/BEL49
SQLPLUS system/manager@oracle-11g-srv-n:1521/BEL49  @ENET_GAS_AUTOMATISIERUNG.sql

impdp ENET_GAS_AUTOMATISIERUNG/12years@oracle-11g-srv-n:1521/BEL49 dumpfile=ENET_GAS_AUTOMATISIERUNG.dmp remap_schema=ENET_GAS_AUTOMATISIERUNG:ENET_GAS_AUTOMATISIERUNG remap_tablespace=ENET_GAS_AUTOMATISIERUNG:ENET_GAS_AUTOMATISIERUNG DIRECTORY=DATA_PUMP_DIR
