#
# Cookbook Name:: sqlimport
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#create the sql script for db users to import
#includes delete , create , import
template 'D:\WORK\chef\sqlimport\files\sqlscript.bat' do
  source 'sqlimport.bat.erb'
  mode '0755'
  owner 'root'
  group 'root'
end

template 'D:\WORK\chef\sqlimport\files\create_user.sql' do 
  source 'create_user.sql.erb'
end

template "#{node['enet']['files']}/create_user_#{node['enetgas']['dbuser']}.sql" do 
 source 'create_user.sql.erb'
end 




batch "Run_SQL_Files" do  
  cwd "#{node['enet']['files']}"
  code "sqlscript.bat create_user_#{node['enetgas']['dbuser']}.sql"
  action:run
  #action:nothing
  only_if { node['platform'] == 'windows'}
end

