#
# Cookbook Name:: sqlimport
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#create the sql script for db users to import
#includes delete , create , import

 #iterate over the enet dbusers
  #node['userstoimport'].each do |dbuser|
   # unless dbuser.empty?
    #      puts "#Importing #{dbuser}..."
	#	  template "#{node['enet']['files']}/#{dbuser}.sql" do 
     #         source 'create_user.sql.erb'
      #    end 		  
     #end 
   #end    
   
   #set the template variables to create the sql for each user
   node['userstoimport'].each do |dbuser|    
          puts "#Importing #{dbuser}..."
		  template "#{node['enet']['files']}/#{dbuser}.sql" do 
              source 'create_user.sql.erb'
			   variables(			   
                :usertoimport => dbuser 
               )
     end 
   end    

template "#{node['enet']['files']}/#{node['enetgas']['dbuser']}.sql" do 
 source 'create_user.sql.erb'
end 

 node['userstoimport'].each do |dbuser| 
  template "#{node['enet']['files']}/import_#{dbuser}.bat" do
   source 'sqlimport.bat.erb'
   mode '0755'
   owner 'root'
   group 'root'
   variables(
     :usertoimport => dbuser 
            )
  end
end

#template "#{node['enet']['files']}/create_user.sql" do 
 # source 'create_user.sql.erb'
#end


batch "Run_SQL_Files" do  
  cwd "#{node['enet']['files']}"
  code "sqlscript.bat #{node['enetgas']['dbuser']}"
  #action:run
  action:nothing
  only_if { node['platform'] == 'windows'}
end

