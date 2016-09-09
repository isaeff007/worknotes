#
# Cookbook Name:: enetimport_win
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
template './mycommand' do
  source 'sqlcommand.bat'  
end
#execute "Run_SQL_Files" do
#  command "SQLPLUS"+  --user=root --password=toomba source /tmp/sql_dumps/15.sql"
#end