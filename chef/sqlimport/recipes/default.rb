#
# Cookbook Name:: sqlimport
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#create the sql script for db users to import
#includes delete , create , import
 

#template "#{node['enet']['files']}/#{node['enetgas']['dbuser']}.sql" do 
# source 'create_user.sql.erb'
#end 

 node['userstoimport'].each do |dbuser|
    #script to delete and create userschema
	template "#{node['enet']['files']}/#{dbuser}.sql" do 
          source 'create_user.sql.erb'
			   variables(			   
                :usertoimport => dbuser 
               )
     end 
	#use the created script to create batch for importing the dump 
	#only if the prev. template has been created
	puts "----------------------> '#{node['enet']['files']}/#{dbuser}.sql'---------------------------"
	template "#{node['enet']['files']}/import_#{dbuser}.bat" do
		source 'sqlimport.bat.erb'   
			variables(
			:usertoimport => dbuser 
            )    
        only_if { File.exist?("#{node['enet']['files']}/#{dbuser}.sql")}			
	end  
	#and now execute the created batch to delete, create and import user.
	batch "Run_SQL_Files" do  
		cwd "#{node['enet']['files']}"
		code "import_#{dbuser}.bat"
		puts "#Importing #{dbuser}..."
		action:run
		#action:nothing
		only_if { node['platform'] == 'windows' && File.exist?("#{node['enet']['files']}/#{dbuser}.DMP")}
	end  	
end

#template "#{node['enet']['files']}/create_user.sql" do 
 # source 'create_user.sql.erb'
#end

#node['userstoimport'].each do |dbuser| 
 #batch "Run_SQL_Files" do  
  #cwd "#{node['enet']['files']}"
  #code "import_#{dbuser}.bat"
  #action:run
  #action:nothing
  #only_if { node['platform'] == 'windows'}
 #end
#end 

