#
# Cookbook:: db
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


apt_update

packet'mongodb' 

service 'mongodb' do 
	supports status: true, restart: true
	action [:enable, :start]	
end

template '/etc/mongod.conf' do
	source 'mongod.conf.erb'
	
end

template '/lib/systemd/system/mongod.service' do
	source 'mongod.service.erb'
end
