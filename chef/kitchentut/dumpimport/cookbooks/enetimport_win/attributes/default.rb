# encoding: UTF-8
################################################################################
# Default settings which can be overwritten by customer attributes/recipe or
# wrapper cookbook.
#
################################################################################
# General settings which are independent from operating system.
#
# Installation mode. Can be install, update, uninstall.
# Uninstall is not complete, but will remove most of the components on Windows.
default['database']['pwd'] = '12years'
default['database']['host'] = 'oracle-11g-srv-n'
default['database']['port'] = '1521'
default['database']['instance'] = '1521'

default['enetgas']['dbuser'] = 'AKBELVIS4TSM411LB'
default['enetgas']['pwd'] = node['database']['pwd']
default['enetgas']['host'] = node['database']['host']
default['enetgas']['port'] = node['database']['port']
default['enetgas']['intstance'] = node['database']['instance']

#SQLPLUS AKBELVIS4TSM411X/12years@oracle-11g-srv-n:1521/BEL49

