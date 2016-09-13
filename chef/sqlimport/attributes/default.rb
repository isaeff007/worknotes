# encoding: UTF-8
################################################################################
# Default settings which can be overwritten by customer attributes/recipe or
# wrapper cookbook.
#
################################################################################
# General settings which are independent from operating system.
#TEST (to delete later):
#SQLPLUS AKBELVIS4TSM411X/12years@oracle-11g-srv-n:1521/BEL49
#ENET:
#SQLPLUS ADMIN_ENTW/12years@vm-win2012-ora:1522/ENTW12C

default['admin_dbuser'] = 'system'
default['admin_pwd'] = 'manager'
default['admin_host'] = 'oracle-11g-srv-n'
default['admin_instance'] =  'BEL49'
default['admin_port'] = '1521'

#just an array with users to be imported
default['userstoimport'] = ['ENET_GAS_AUTOMATISIERUNG','ENET_POWER_AUTOMATISIERUNG','ENET_TRANSFER_AUTOMATISIERUNG']


#default['enetgas']['dbuser'] = 'system'
default['enetgas']['dbuser'] = 'AKBELVIS4TSM411LB'
default['enetgas']['pwd'] = '12years'

default['enetpower']['dbuser'] = 'AKBELVIS4TSM411LB'
default['enetpower']['pwd'] = '12years'

default['enettransfer']['dbuser'] = 'ENET_TRANSFER_AUTOMATISIERUNG'
default['enettransfer']['pwd'] = '12years'

default['usertoimport']['dbuser'] = node['enettransfer']['dbuser']
default['usertoimport']['pwd'] = node['enettransfer']['pwd']


case node['platform_family']
# Settings redefined for Windows systems:
when 'windows'
  default['enet']['files'] = 'D:/WORK/chef/sqlimport/files'
else
  fail 'The platform family you are using is not supported by this cookbook!'
end  
  



